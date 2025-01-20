@interface JFXDepthCompressor
+ (id)NSDataFromDepthMapInsideAVDepthData:(id)a3;
+ (id)NSDataFromFloatDepth32:(__CVBuffer *)a3;
+ (id)decapsulatePayload:(id)a3;
+ (id)encapsulatePayload:(id)a3;
+ (id)fakeAuxDepthInfoDictionaryForCVPixelBuffer:(__CVBuffer *)a3;
+ (id)fakeXMPDataIfNotFound;
- (JFXDepthCompressor)initWithDepthCodecType:(int)a3;
- (__CVBuffer)copyDepthBufferAsBGRA:(__CVBuffer *)a3;
- (id)compressAVDepthData:(id)a3 timingInfo:(id *)a4 error:(id *)a5;
- (id)compressAVDepthData_BGRA:(id)a3 timingInfo:(id *)a4 error:(id *)a5;
- (id)compressAVDepthData_HEVC10:(id)a3 timingInfo:(id *)a4 error:(id *)a5;
- (id)compressAVDepthData_LZ:(id)a3 timingInfo:(id *)a4 error:(id *)a5;
- (id)compressAVDepthData_Photo:(id)a3 timingInfo:(id *)a4 error:(id *)a5;
- (id)compressDepthMapCVPixelBuffer:(__CVBuffer *)a3 timingInfo:(id *)a4 error:(id *)a5;
- (id)depthOutputSettingsForDepthDimensions:(id)a3;
- (id)depthSampleBufferAppendingDepthMetadata:(id)a3 depthSampleBufferFromCodec:(opaqueCMSampleBuffer *)a4;
- (id)depthSampleBufferWithNewHVCCWithDepthMetadata:(id)a3 depthSampleBufferFromCodec:(opaqueCMSampleBuffer *)a4;
- (id)hevcSEIMessageDataWithDepthXMPMetadata:(id)a3 isPrefixSEI:(BOOL)a4 nuh_layer_id:(int)a5 nuh_temporal_id_plus1:(int)a6;
- (id)hevcSEIPayload:(id)a3;
- (id)hevcSEIPayloadHeaderForPayloadType:(int)a3 payloadSize:(unint64_t)a4;
- (id)mutableCopyExtensionsDictionaryCopyFromAVDepthData:(id)a3;
- (int)depthCodecType;
- (opaqueCMFormatDescription)depthFormatDescriptionForDepthDimensions:(id)a3;
- (unsigned)getPayloadTypeOrSize:(id)a3 offsetPointer:(unint64_t *)a4;
- (void)dealloc;
@end

@implementation JFXDepthCompressor

+ (id)fakeXMPDataIfNotFound
{
  return (id)[MEMORY[0x263EFF8F8] dataWithBytesNoCopy:&kXMPDepthMetadataForiPhoneXR length:3180 freeWhenDone:0];
}

- (JFXDepthCompressor)initWithDepthCodecType:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)JFXDepthCompressor;
  result = [(JFXDepthCompressor *)&v5 init];
  if (result)
  {
    result->_depthCodecType = a3;
    result->_previousFormatDescription = 0;
  }
  return result;
}

- (void)dealloc
{
  [(JFXVideoEncoderInterface *)self->_videoEncoderInterface closeEncoder];
  videoEncoderInterface = self->_videoEncoderInterface;
  self->_videoEncoderInterface = 0;

  v4.receiver = self;
  v4.super_class = (Class)JFXDepthCompressor;
  [(JFXDepthCompressor *)&v4 dealloc];
}

- (id)depthOutputSettingsForDepthDimensions:(id)a3
{
  return 0;
}

- (opaqueCMFormatDescription)depthFormatDescriptionForDepthDimensions:(id)a3
{
  v45[4] = *MEMORY[0x263EF8340];
  uint64_t var1 = a3.var1;
  CVPixelBufferRef pixelBufferOut = 0;
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:");
  uint64_t v7 = [NSNumber numberWithInt:var1];
  uint64_t v8 = *MEMORY[0x263F04130];
  uint64_t v9 = MEMORY[0x263EFFA78];
  uint64_t v10 = *MEMORY[0x263F04240];
  v44[0] = *MEMORY[0x263F04130];
  v44[1] = v10;
  v45[0] = MEMORY[0x263EFFA78];
  v45[1] = v6;
  uint64_t v11 = *MEMORY[0x263F04118];
  uint64_t v12 = *MEMORY[0x263F04180];
  v44[2] = *MEMORY[0x263F04118];
  v44[3] = v12;
  v32 = (void *)v7;
  v45[2] = v7;
  v45[3] = &unk_26E801C98;
  CFDictionaryRef v13 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:4];
  CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  size_t var0 = a3.var0;
  size_t v16 = *(uint64_t *)&a3 >> 32;
  CFDictionaryRef v31 = v13;
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], var0, v16, 0x66646570u, v13, &pixelBufferOut);
  if (pixelBufferOut)
  {
    int depthCodecType = self->_depthCodecType;
    if (depthCodecType == 1111970369)
    {
      v42[0] = v8;
      v42[1] = v10;
      v43[0] = v9;
      v23 = (void *)v6;
      v42[2] = v11;
      v42[3] = v12;
      v22 = v32;
      v43[1] = v6;
      v43[2] = v32;
      v43[3] = &unk_26E801CB0;
      CFDictionaryRef v18 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:4];
      texture[0] = 0;
      CVPixelBufferCreate(v14, var0, v16, 0x42475241u, v18, texture);
      if (!texture[0])
      {
        v30 = JFXLog_DebugDepthCodec();
        CFDictionaryRef v24 = v31;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          -[JFXDepthCompressor depthFormatDescriptionForDepthDimensions:].cold.5();
        }

        goto LABEL_24;
      }
      CMVideoFormatDescriptionCreateForImageBuffer(v14, pixelBufferOut, &formatDescriptionOut);
      CVPixelBufferRelease(texture[0]);
    }
    else
    {
      if (depthCodecType == 1212494384 || depthCodecType == 1212493921)
      {
        CFDictionaryRef v18 = [[JFXDepthCompressor alloc] initWithDepthCodecType:self->_depthCodecType];
        *(void *)v37 = *(void *)(MEMORY[0x263F01088] + 16);
        long long v19 = *MEMORY[0x263F010E0];
        *(void *)&v37[24] = *(void *)(MEMORY[0x263F010E0] + 16);
        *(_OWORD *)&v37[8] = v19;
        long long v38 = v19;
        v33[2] = *(_OWORD *)&v37[16];
        v33[3] = v19;
        *(_OWORD *)texture = *MEMORY[0x263F01088];
        uint64_t v39 = *(void *)&v37[24];
        uint64_t v34 = *(void *)&v37[24];
        id v35 = 0;
        v33[0] = *(_OWORD *)texture;
        v33[1] = *(_OWORD *)v37;
        v20 = [(__CFDictionary *)v18 compressDepthMapCVPixelBuffer:pixelBufferOut timingInfo:v33 error:&v35];
        id v21 = v35;
        if (v20)
        {
          v22 = v32;
          v23 = (void *)v6;
          CFDictionaryRef v24 = v31;
          if ([v20 sampleBufferRef])
          {
            FormatDescription = CMSampleBufferGetFormatDescription((CMSampleBufferRef)[v20 sampleBufferRef]);
            CMVideoFormatDescriptionRef formatDescriptionOut = FormatDescription;
            if (FormatDescription) {
              CFRetain(FormatDescription);
            }
            goto LABEL_23;
          }
          v28 = JFXLog_DebugDepthCodec();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
            -[JFXDepthCompressor depthFormatDescriptionForDepthDimensions:].cold.4();
          }
        }
        else
        {
          v28 = JFXLog_DebugDepthCodec();
          v22 = v32;
          v23 = (void *)v6;
          CFDictionaryRef v24 = v31;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
            -[JFXDepthCompressor depthFormatDescriptionForDepthDimensions:]();
          }
        }

LABEL_23:
        goto LABEL_24;
      }
      JFXLog_DebugDepthCodec();
      CFDictionaryRef v18 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEBUG)) {
        -[JFXDepthCompressor depthFormatDescriptionForDepthDimensions:]();
      }
      v22 = v32;
      v23 = (void *)v6;
    }
    CFDictionaryRef v24 = v31;
LABEL_24:

    CVPixelBufferRelease(pixelBufferOut);
    v27 = formatDescriptionOut;
    goto LABEL_25;
  }
  v26 = JFXLog_DebugDepthCodec();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    -[JFXDepthCompressor depthFormatDescriptionForDepthDimensions:]();
  }

  v27 = 0;
  v22 = v32;
  v23 = (void *)v6;
  CFDictionaryRef v24 = v31;
LABEL_25:

  return v27;
}

- (id)compressAVDepthData:(id)a3 timingInfo:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  int depthCodecType = self->_depthCodecType;
  if (depthCodecType <= 1280992881)
  {
    if (depthCodecType == 1111970369)
    {
      long long v17 = *(_OWORD *)&a4->var2.var0;
      long long v25 = *(_OWORD *)&a4->var1.var1;
      long long v26 = v17;
      int64_t var3 = a4->var2.var3;
      long long v18 = *(_OWORD *)&a4->var0.var3;
      long long v23 = *(_OWORD *)&a4->var0.var0;
      long long v24 = v18;
      uint64_t v14 = [(JFXDepthCompressor *)self compressAVDepthData_BGRA:v8 timingInfo:&v23 error:a5];
      goto LABEL_16;
    }
    if (depthCodecType == 1212494384)
    {
      long long v15 = *(_OWORD *)&a4->var2.var0;
      long long v25 = *(_OWORD *)&a4->var1.var1;
      long long v26 = v15;
      int64_t var3 = a4->var2.var3;
      long long v16 = *(_OWORD *)&a4->var0.var3;
      long long v23 = *(_OWORD *)&a4->var0.var0;
      long long v24 = v16;
      uint64_t v14 = [(JFXDepthCompressor *)self compressAVDepthData_Photo:v8 timingInfo:&v23 error:a5];
      goto LABEL_16;
    }
  }
  else if ((depthCodecType - 1280992882) < 2 {
         || depthCodecType == 1280994657
  }
         || depthCodecType == 1280997986)
  {
    long long v12 = *(_OWORD *)&a4->var2.var0;
    long long v25 = *(_OWORD *)&a4->var1.var1;
    long long v26 = v12;
    int64_t var3 = a4->var2.var3;
    long long v13 = *(_OWORD *)&a4->var0.var3;
    long long v23 = *(_OWORD *)&a4->var0.var0;
    long long v24 = v13;
    uint64_t v14 = [(JFXDepthCompressor *)self compressAVDepthData_LZ:v8 timingInfo:&v23 error:a5];
    goto LABEL_16;
  }
  long long v19 = *(_OWORD *)&a4->var2.var0;
  long long v25 = *(_OWORD *)&a4->var1.var1;
  long long v26 = v19;
  int64_t var3 = a4->var2.var3;
  long long v20 = *(_OWORD *)&a4->var0.var3;
  long long v23 = *(_OWORD *)&a4->var0.var0;
  long long v24 = v20;
  uint64_t v14 = [(JFXDepthCompressor *)self compressAVDepthData_HEVC10:v8 timingInfo:&v23 error:a5];
LABEL_16:
  id v21 = (void *)v14;

  return v21;
}

+ (id)encapsulatePayload:(id)a3
{
  id v3 = a3;
  size_t v4 = [v3 length];
  id v5 = v3;
  uint64_t v6 = (unsigned __int8 *)[v5 bytes];
  uint64_t v7 = malloc_type_malloc(v4, 0xD19E75F9uLL);
  id v8 = v7;
  if (v4)
  {
    int v9 = 0;
    uint64_t v10 = 0;
    do
    {
      unsigned int v12 = *v6++;
      unsigned int v11 = v12;
      if (v9 == 2)
      {
        int v9 = 0;
        if (v11 <= 3) {
          *((unsigned char *)v7 + v10++) = 3;
        }
      }
      if (v11) {
        int v9 = 0;
      }
      else {
        ++v9;
      }
      *((unsigned char *)v7 + v10++) = v11;
      --v4;
    }
    while (v4);
  }
  else
  {
    uint64_t v10 = 0;
  }
  long long v13 = [MEMORY[0x263EFF8F8] dataWithBytes:v7 length:v10];
  free(v8);

  return v13;
}

+ (id)decapsulatePayload:(id)a3
{
  id v3 = a3;
  size_t v4 = [v3 length];
  id v5 = v3;
  uint64_t v6 = (unsigned __int8 *)[v5 bytes];
  uint64_t v7 = malloc_type_malloc(v4, 0xE3BAEA83uLL);
  id v8 = v7;
  if (v4)
  {
    int v9 = 0;
    uint64_t v10 = 0;
    do
    {
      int v12 = *v6++;
      int v11 = v12;
      if (v9 == 2 && v11 == 3)
      {
        int v9 = 0;
      }
      else
      {
        if (v11) {
          int v9 = 0;
        }
        else {
          ++v9;
        }
        *((unsigned char *)v7 + v10++) = v11;
      }
      --v4;
    }
    while (v4);
  }
  else
  {
    uint64_t v10 = 0;
  }
  long long v13 = [MEMORY[0x263EFF8F8] dataWithBytes:v7 length:v10];
  free(v8);

  return v13;
}

- (unsigned)getPayloadTypeOrSize:(id)a3 offsetPointer:(unint64_t *)a4
{
  id v5 = a3;
  unsigned int v6 = [v5 length];
  if (a4)
  {
    unint64_t v7 = *a4;
    unsigned __int8 v14 = 0;
    unint64_t v8 = v6;
    if (v6)
    {
      objc_msgSend(v5, "getBytes:range:", &v14, v7, 1);
      int v9 = 0;
      int v10 = v14;
      if (v14 == 255 && v7 < v8)
      {
        int v9 = 0;
        do
        {
          v9 += 255;
          objc_msgSend(v5, "getBytes:range:", &v14, v7++, 1);
          int v10 = v14;
        }
        while (v14 == 255 && v7 < v8);
      }
      unsigned int v12 = v9 + v10;
    }
    else
    {
      unsigned int v12 = 0;
    }
    *a4 = v7;
  }
  else
  {
    unsigned int v12 = 0;
  }

  return v12;
}

- (id)hevcSEIPayload:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unsigned int v16 = 0;
  unsigned int v5 = [v4 length];
  unsigned int v6 = v5 - 4;
  if (v5 >= 4)
  {
    objc_msgSend(v4, "getBytes:range:", &v16, 0, 4);
    unsigned int v7 = bswap32(v16);
    unsigned int v16 = v7;
    if (v7 > v5)
    {
      unint64_t v8 = JFXLog_DebugDepthCodec();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        [(JFXDepthCompressor *)(int *)&v16 hevcSEIPayload:v8];
      }

      unsigned int v16 = v6;
      unsigned int v7 = v6;
    }
    if (v7 >= 6)
    {
      objc_msgSend(v4, "getBytes:range:", v15, 4, 1);
      if (((v15[0] >> 1) & 0x3Fu) - 39 <= 1)
      {
        int v9 = [(id)objc_opt_class() decapsulatePayload:v4];
        unsigned int v16 = [v9 length];
        if (v16)
        {
          uint64_t v14 = 0;
          if ([(JFXDepthCompressor *)self getPayloadTypeOrSize:v9 offsetPointer:&v14] == 4)
          {
            [(JFXDepthCompressor *)self getPayloadTypeOrSize:v9 offsetPointer:&v14];
            uint64_t v17 = 0;
            uint64_t v18 = 0;
            objc_msgSend(v4, "getBytes:range:", &v17, v14, 16);
            if (v17 == 0x6C7070612E6D6F63 && v18 == 0x7370696C432E65)
            {
              v14 += 16;
              int v11 = objc_msgSend(v9, "subdataWithRange:");

              goto LABEL_21;
            }
          }
          else
          {
            unsigned int v12 = JFXLog_DebugDepthCodec();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
              -[JFXDepthCompressor hevcSEIPayload:]();
            }
          }
        }
      }
    }
  }
  int v11 = [MEMORY[0x263EFF8F8] data];
LABEL_21:

  return v11;
}

- (id)hevcSEIPayloadHeaderForPayloadType:(int)a3 payloadSize:(unint64_t)a4
{
  int v4 = a4;
  char v12 = -1;
  unsigned int v6 = [MEMORY[0x263EFF990] data];
  if (a3 >= 255)
  {
    int v7 = a3 / 255;
    do
    {
      [v6 appendBytes:&v12 length:1];
      --v7;
    }
    while (v7);
  }
  char v11 = a3 + a3 / 255;
  [v6 appendBytes:&v11 length:1];
  if (v4 >= 255)
  {
    int v8 = v4 / 255;
    do
    {
      [v6 appendBytes:&v12 length:1];
      --v8;
    }
    while (v8);
  }
  char v10 = v4 + v4 / 255;
  [v6 appendBytes:&v10 length:1];
  return v6;
}

- (id)hevcSEIMessageDataWithDepthXMPMetadata:(id)a3 isPrefixSEI:(BOOL)a4 nuh_layer_id:(int)a5 nuh_temporal_id_plus1:(int)a6
{
  if (a4) {
    char v7 = 78;
  }
  else {
    char v7 = 80;
  }
  v15[0] = v7 & 0xFE | ((a5 & 0x20) != 0);
  v15[1] = a6 | (8 * a5);
  int v8 = (void *)MEMORY[0x263EFF990];
  id v9 = a3;
  char v10 = [v8 data];
  [v10 appendBytes:v15 length:2];
  char v11 = [MEMORY[0x263EFF990] data];
  [v11 appendBytes:"com.apple.Clips" length:16];
  [v11 appendData:v9];

  char v12 = -[JFXDepthCompressor hevcSEIPayloadHeaderForPayloadType:payloadSize:](self, "hevcSEIPayloadHeaderForPayloadType:payloadSize:", 4, [v11 length]);
  [v10 appendData:v12];
  [v10 appendData:v11];
  [v10 appendBytes:&trailingByte length:1];
  long long v13 = [(id)objc_opt_class() encapsulatePayload:v10];

  return v13;
}

- (id)depthSampleBufferAppendingDepthMetadata:(id)a3 depthSampleBufferFromCodec:(opaqueCMSampleBuffer *)a4
{
  CMSampleBufferRef v29 = 0;
  *(_OWORD *)&timingInfoOut.duration.value = *MEMORY[0x263F01090];
  timingInfoOut.duration.epoch = *(void *)(MEMORY[0x263F01090] + 16);
  timingInfoOut.presentationTimeStamp = timingInfoOut.duration;
  timingInfoOut.decodeTimeStamp = timingInfoOut.duration;
  id v5 = a3;
  CMSampleBufferGetSampleTimingInfo(a4, 0, &timingInfoOut);
  DataBuffer = CMSampleBufferGetDataBuffer(a4);
  FormatDescription = CMSampleBufferGetFormatDescription(a4);
  CMBlockBufferRef theBuffer = 0;
  LODWORD(a4) = createReadonlyCMBlockBufferFromNSData(&theBuffer, v5);

  if (a4)
  {
    int v8 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[JFXDepthCompressor depthSampleBufferAppendingDepthMetadata:depthSampleBufferFromCodec:].cold.7();
    }
  }
  else
  {
    unsigned int v26 = bswap32(CMBlockBufferGetDataLength(theBuffer));
    char v11 = [MEMORY[0x263EFF8F8] dataWithBytes:&v26 length:4];
    CMBlockBufferRef v25 = 0;
    if (createReadonlyCMBlockBufferFromNSData(&v25, v11))
    {
      char v12 = JFXLog_DebugDepthCodec();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[JFXDepthCompressor depthSampleBufferAppendingDepthMetadata:depthSampleBufferFromCodec:].cold.6();
      }
    }
    else
    {
      long long v13 = v25;
      size_t DataLength = CMBlockBufferGetDataLength(v25);
      if (CMBlockBufferAppendBufferReference(DataBuffer, v13, 0, DataLength, 1u))
      {
        long long v15 = JFXLog_DebugDepthCodec();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          -[JFXDepthCompressor depthSampleBufferAppendingDepthMetadata:depthSampleBufferFromCodec:].cold.5();
        }
      }
      else
      {
        unsigned int v16 = theBuffer;
        size_t v17 = CMBlockBufferGetDataLength(theBuffer);
        OSStatus appended = CMBlockBufferAppendBufferReference(DataBuffer, v16, 0, v17, 1u);
        uint64_t v19 = JFXLog_DebugDepthCodec();
        BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
        if (appended)
        {
          if (v20) {
            -[JFXDepthCompressor depthSampleBufferAppendingDepthMetadata:depthSampleBufferFromCodec:].cold.4();
          }
        }
        else
        {
          if (v20) {
            -[JFXDepthCompressor depthSampleBufferAppendingDepthMetadata:depthSampleBufferFromCodec:](DataBuffer);
          }

          size_t sampleSizeArray = CMBlockBufferGetDataLength(DataBuffer);
          if (CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], DataBuffer, 1u, 0, 0, FormatDescription, 1, 1, &timingInfoOut, 1, &sampleSizeArray, &v29))
          {
            id v21 = JFXLog_DebugDepthCodec();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
              -[JFXDepthCompressor depthSampleBufferAppendingDepthMetadata:depthSampleBufferFromCodec:]();
            }
          }
        }
      }
      CFRelease(v25);
    }
    CFRelease(theBuffer);

    if (v29)
    {
      id v22 = objc_alloc(MEMORY[0x263F61228]);
      char v10 = (void *)[v22 initWithSampleBuffer:v29];
      CFRelease(v29);
      goto LABEL_29;
    }
  }
  id v9 = JFXLog_depthCodec();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[JFXDepthCompressor depthSampleBufferAppendingDepthMetadata:depthSampleBufferFromCodec:]();
  }

  char v10 = 0;
LABEL_29:
  return v10;
}

- (id)depthSampleBufferWithNewHVCCWithDepthMetadata:(id)a3 depthSampleBufferFromCodec:(opaqueCMSampleBuffer *)a4
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v5 = a3;
  CMFormatDescriptionRef formatDescriptionOut = 0;
  CMSampleBufferRef v88 = 0;
  DataBuffer = CMSampleBufferGetDataBuffer(a4);
  *(_OWORD *)&timingInfoOut.duration.value = *MEMORY[0x263F01090];
  timingInfoOut.duration.epoch = *(void *)(MEMORY[0x263F01090] + 16);
  timingInfoOut.presentationTimeStamp = timingInfoOut.duration;
  timingInfoOut.decodeTimeStamp = timingInfoOut.duration;
  CMSampleBufferGetSampleTimingInfo(a4, 0, &timingInfoOut);
  FormatDescription = CMSampleBufferGetFormatDescription(a4);
  size_t parameterSetCountOut = 0;
  int NALUnitHeaderLengthOut = 0;
  if (CMVideoFormatDescriptionGetHEVCParameterSetAtIndex(FormatDescription, 0, 0, 0, &parameterSetCountOut, &NALUnitHeaderLengthOut)|| !parameterSetCountOut)
  {
    long long v13 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[JFXDepthCompressor depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:]2();
    }
  }
  else
  {
    int v8 = (const uint8_t **)malloc_type_malloc(8 * parameterSetCountOut + 8, 0x10040436913F5uLL);
    parameterSetSizeOut = (size_t *)malloc_type_malloc(8 * parameterSetCountOut + 8, 0x100004000313F17uLL);
    if (parameterSetCountOut)
    {
      size_t v9 = -1;
      char v10 = v8;
      char v11 = parameterSetSizeOut;
      while (!CMVideoFormatDescriptionGetHEVCParameterSetAtIndex(FormatDescription, v9 + 1, v10, v11, &parameterSetCountOut, 0))
      {
        size_t v12 = v9 + 2;
        ++v11;
        ++v10;
        ++v9;
        if (v12 >= parameterSetCountOut) {
          goto LABEL_13;
        }
      }
      uint64_t v14 = JFXLog_DebugDepthCodec();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[JFXDepthCompressor depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:]1();
      }

      size_t parameterSetCountOut = v9;
    }
LABEL_13:
    long long v15 = objc_msgSend((id)CMFormatDescriptionGetExtension(FormatDescription, @"SampleDescriptionExtensionAtoms"), "mutableCopy");
    long long v13 = v15;
    if (v15)
    {
      unsigned int v16 = [v15 objectForKeyedSubscript:@"hvcC"];
      size_t v17 = [v16 mutableCopy];

      if (v17)
      {
        id v18 = v5;
        uint64_t v19 = [v17 length];
        id v76 = v18;
        size_t v77 = v19 + [v18 length] + 5;
        BOOL v20 = malloc_type_malloc(v77, 0x28ABFEC5uLL);
        [v17 getBytes:v20 length:[v17 length]];
        id v21 = JFXLog_DebugDepthCodec();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          -[JFXDepthCompressor depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:]0((uint64_t)v20, v21, v22, v23, v24, v25, v26, v27);
        }

        v28 = JFXLog_DebugDepthCodec();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          -[JFXDepthCompressor depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:].cold.9((uint64_t)v20, v28, v29, v30, v31, v32, v33, v34);
        }

        id v35 = JFXLog_DebugDepthCodec();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
          -[JFXDepthCompressor depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:].cold.8((uint64_t)v20, v35, v36, v37, v38, v39, v40, v41);
        }

        v81 = v20;
        uint64_t v42 = v20[22];
        v43 = JFXLog_DebugDepthCodec();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
          -[JFXDepthCompressor depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:].cold.7(v42, (uint64_t *)&parameterSetCountOut, v43);
        }
        v78 = DataBuffer;
        v79 = v13;
        v82 = v8;
        id v80 = v5;

        if (v42)
        {
          uint64_t v44 = 0;
          int v45 = 23;
          while (__rev16(*(unsigned __int16 *)&v20[v45 + 1]) == 1)
          {
            uint64_t v46 = v45;
            int v47 = v45 + 5;
            if ([v17 length] <= (unint64_t)v47)
            {
              v57 = JFXLog_DebugDepthCodec();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
                -[JFXDepthCompressor depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:].cold.5();
              }
              goto LABEL_42;
            }
            v48 = v17;
            v49 = &v20[v46];
            char v50 = v20[v46];
            unint64_t v51 = v82[v44][1];
            unsigned int v52 = *(unsigned __int16 *)(v49 + 3);
            size_t v53 = parameterSetSizeOut[v44];
            v54 = JFXLog_DebugDepthCodec();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109632;
              *(_DWORD *)&buf[4] = v44;
              __int16 v90 = 2048;
              uint64_t v91 = v50 & 0x1F;
              __int16 v92 = 2048;
              unint64_t v93 = v51 >> 3;
              _os_log_debug_impl(&dword_234C41000, v54, OS_LOG_TYPE_DEBUG, "param_set[%d] nal_unit_type=%lu (expect nal_unit_type=%lu)", buf, 0x1Cu);
            }
            uint64_t v55 = __rev16(v52);

            v56 = JFXLog_DebugDepthCodec();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109632;
              *(_DWORD *)&buf[4] = v44;
              __int16 v90 = 2048;
              uint64_t v91 = v55;
              __int16 v92 = 2048;
              unint64_t v93 = v53;
              _os_log_debug_impl(&dword_234C41000, v56, OS_LOG_TYPE_DEBUG, "param_set[%d] nal_unit_length=%lu (expect nal_unit_length=%lu)", buf, 0x1Cu);
            }

            int v45 = v47 + v55;
            size_t v17 = v48;
            if ([v48 length] <= (unint64_t)v45)
            {
              v57 = JFXLog_DebugDepthCodec();
              BOOL v20 = v81;
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
                -[JFXDepthCompressor depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:].cold.4();
              }
              goto LABEL_42;
            }
            ++v44;
            BOOL v20 = v81;
            if (v42 == v44) {
              goto LABEL_43;
            }
          }
          v57 = JFXLog_DebugDepthCodec();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
            -[JFXDepthCompressor depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:].cold.6();
          }
LABEL_42:
        }
LABEL_43:
        ++v20[22];
        id v58 = v76;
        int v59 = (*(unsigned __int8 *)[v58 bytes] >> 1) & 0x3F | 0x80;
        unint64_t v60 = (unint64_t)[v58 length] >> 8;
        char v61 = [v58 length];
        v62 = &v20[[v17 length]];
        uint64_t v63 = [v17 length];
        char *v62 = v59;
        *(_WORD *)(v62 + 1) = 256;
        v62[3] = v60;
        v62[4] = v61;
        objc_msgSend(v58, "getBytes:length:", &v20[v63 + 5], objc_msgSend(v58, "length"));
        v64 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v20 length:v77 freeWhenDone:1];
        long long v13 = v79;
        [v79 setObject:v64 forKeyedSubscript:@"hvcC"];

        id v5 = v80;
        int v8 = v82;
        DataBuffer = v78;
      }
      v65 = CMFormatDescriptionGetExtensions(FormatDescription);
      v66 = v65;
      if (v65)
      {
        v67 = (void *)[v65 mutableCopy];
      }
      else
      {
        v67 = [MEMORY[0x263EFF9A0] dictionary];
      }
      v68 = v67;
      [v67 setObject:v13 forKeyedSubscript:@"SampleDescriptionExtensionAtoms"];
      CFAllocatorRef v69 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      if (CMVideoFormatDescriptionCreateFromHEVCParameterSets((CFAllocatorRef)*MEMORY[0x263EFFB08], parameterSetCountOut, v8, parameterSetSizeOut, NALUnitHeaderLengthOut, (CFDictionaryRef)v68, &formatDescriptionOut))
      {
        v70 = JFXLog_DebugDepthCodec();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG)) {
          -[JFXDepthCompressor depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:]();
        }
      }
      else
      {
        *(void *)buf = CMBlockBufferGetDataLength(DataBuffer);
        OSStatus v71 = CMSampleBufferCreate(v69, DataBuffer, 1u, 0, 0, formatDescriptionOut, 1, 1, &timingInfoOut, 1, (const size_t *)buf, &v88);
        if (formatDescriptionOut)
        {
          CFRelease(formatDescriptionOut);
          CMFormatDescriptionRef formatDescriptionOut = 0;
        }
        if (!v71 && v88)
        {
          id v72 = objc_alloc(MEMORY[0x263F61228]);
          v73 = (void *)[v72 initWithSampleBuffer:v88];
          free(v8);
          free(parameterSetSizeOut);
          CFRelease(v88);

          goto LABEL_62;
        }
        v74 = JFXLog_DebugDepthCodec();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG)) {
          -[JFXDepthCompressor depthSampleBufferAppendingDepthMetadata:depthSampleBufferFromCodec:]();
        }
      }
    }
    else
    {
      size_t v17 = JFXLog_DebugDepthCodec();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[JFXDepthCompressor depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:]();
      }
    }

    free(v8);
    free(parameterSetSizeOut);
  }
  v73 = 0;
LABEL_62:

  return v73;
}

- (id)compressAVDepthData_HEVC10:(id)a3 timingInfo:(id *)a4 error:(id *)a5
{
  v46[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  size_t v9 = (__CVBuffer *)[v8 depthDataMap];
  size_t Width = CVPixelBufferGetWidth(v9);
  size_t Height = CVPixelBufferGetHeight(v9);
  if (!self->_videoEncoderInterface)
  {
    size_t v12 = Height;
    long long v13 = [[JFXVideoEncoderInterface alloc] initWithExpectedFrameRate:30.0];
    videoEncoderInterface = self->_videoEncoderInterface;
    self->_videoEncoderInterface = v13;

    [(JFXVideoEncoderInterface *)self->_videoEncoderInterface setupEncoderWithWidth:Width andHeight:v12 imageFormat:9 andFramerate:30.0];
    if (!self->_videoEncoderInterface)
    {
      uint64_t v26 = JFXLog_DebugDepthCodec();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        -[JFXDepthCompressor compressAVDepthData_HEVC10:timingInfo:error:]();
      }
LABEL_24:

      if (a5)
      {
        [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:0];
        uint64_t v29 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_33;
      }
      goto LABEL_26;
    }
  }
  CVPixelBufferRef v15 = copyFloatDepthBufferToL010(v9, 0);
  if (!v15)
  {
    uint64_t v26 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[JFXDepthCompressor compressAVDepthData_HEVC10:timingInfo:error:]();
    }
    goto LABEL_24;
  }
  unsigned int v16 = v15;
  uint64_t v45 = *MEMORY[0x263F1E8F0];
  v46[0] = MEMORY[0x263EFFA88];
  size_t v17 = [NSDictionary dictionaryWithObjects:v46 forKeys:&v45 count:1];
  id v18 = self->_videoEncoderInterface;
  *(_OWORD *)size_t parameterSetCountOut = *(_OWORD *)&a4->var1.var0;
  int64_t var3 = a4->var1.var3;
  uint64_t v19 = [(JFXVideoEncoderInterface *)v18 encodeFrame:v16 presentationTime:parameterSetCountOut frameProperties:v17];
  CVPixelBufferRelease(v16);
  if (!v19)
  {
    uint64_t v27 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      -[JFXDepthCompressor compressAVDepthData_HEVC10:timingInfo:error:]();
    }

    if (a5)
    {
      *a5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:0];
    }
    goto LABEL_21;
  }
  FormatDescription = CMSampleBufferGetFormatDescription(v19);
  parameterSetCountOut[0] = 0;
  int NALUnitHeaderLengthOut = 0;
  if (CMVideoFormatDescriptionGetHEVCParameterSetAtIndex(FormatDescription, 0, 0, 0, parameterSetCountOut, &NALUnitHeaderLengthOut)|| !parameterSetCountOut[0])
  {
    CFRelease(v19);
    v28 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      -[JFXDepthCompressor compressAVDepthData_HEVC10:timingInfo:error:].cold.6();
    }

LABEL_21:
LABEL_26:
    uint64_t v29 = 0;
    goto LABEL_33;
  }
  uint64_t v40 = v17;
  id v21 = (const uint8_t **)malloc_type_malloc(8 * parameterSetCountOut[0] + 8, 0x10040436913F5uLL);
  parameterSetSizeOut = (size_t *)malloc_type_malloc(8 * parameterSetCountOut[0] + 8, 0x100004000313F17uLL);
  if (parameterSetCountOut[0])
  {
    size_t v22 = -1;
    uint64_t v23 = v21;
    uint64_t v24 = parameterSetSizeOut;
    while (!CMVideoFormatDescriptionGetHEVCParameterSetAtIndex(FormatDescription, v22 + 1, v23, v24, parameterSetCountOut, 0))
    {
      size_t v25 = v22 + 2;
      ++v24;
      ++v23;
      ++v22;
      if (v25 >= parameterSetCountOut[0]) {
        goto LABEL_30;
      }
    }
    uint64_t v30 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      -[JFXDepthCompressor depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:]1();
    }

    parameterSetCountOut[0] = v22;
  }
LABEL_30:
  id v31 = [(JFXDepthCompressor *)self mutableCopyExtensionsDictionaryCopyFromAVDepthData:v8];
  unsigned int v32 = (*v21)[1];
  uint64_t v33 = (v32 >> 3) & 0xFFFFFFDF | (32 * (**v21 & 1));
  uint64_t v34 = v32 & 7;
  free(v21);
  free(parameterSetSizeOut);
  id v35 = [v31 objectForKeyedSubscript:kJFXCGImageAuxiliaryDataInfoMetadataAsXMPKey];
  uint64_t v36 = [(JFXDepthCompressor *)self hevcSEIMessageDataWithDepthXMPMetadata:v35 isPrefixSEI:0 nuh_layer_id:v33 nuh_temporal_id_plus1:v34];
  DataBuffer = CMSampleBufferGetDataBuffer(v19);
  uint64_t v38 = JFXLog_DebugDepthCodec();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
    -[JFXDepthCompressor compressAVDepthData_HEVC10:timingInfo:error:].cold.4(DataBuffer);
  }

  uint64_t v29 = [(JFXDepthCompressor *)self depthSampleBufferAppendingDepthMetadata:v36 depthSampleBufferFromCodec:v19];
  CFRelease(v19);

LABEL_33:
  return v29;
}

- (__CVBuffer)copyDepthBufferAsBGRA:(__CVBuffer *)a3
{
  CVPixelBufferRef pixelBufferOut = 0;
  if (a3)
  {
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    size_t Width = CVPixelBufferGetWidth(a3);
    size_t Height = CVPixelBufferGetHeight(a3);
    BOOL v7 = CVPixelBufferCreate(v4, Width, Height, 0x42475241u, 0, &pixelBufferOut) || pixelBufferOut == 0;
    if (!v7 && CVPixelBufferGetPixelFormatType(pixelBufferOut) == 1111970369)
    {
      size_t v8 = CVPixelBufferGetWidth(a3);
      size_t v9 = CVPixelBufferGetHeight(a3);
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      size_t v11 = CVPixelBufferGetBytesPerRow(pixelBufferOut);
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
      long long v13 = (char *)CVPixelBufferGetBaseAddress(pixelBufferOut);
      if (v9)
      {
        uint64_t v14 = v13;
        size_t v15 = 4 * v8;
        do
        {
          memcpy(v14, BaseAddress, v15);
          BaseAddress += BytesPerRow;
          v14 += v11;
          --v9;
        }
        while (v9);
      }
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
      CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
    }
  }
  return pixelBufferOut;
}

- (id)compressAVDepthData_BGRA:(id)a3 timingInfo:(id *)a4 error:(id *)a5
{
  CVPixelBufferRef Float32DepthImageForAVDepthData = createFloat32DepthImageForAVDepthData(a3);
  if (!Float32DepthImageForAVDepthData)
  {
    CVPixelBufferRelease(0);
    size_t v12 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[JFXDepthCompressor compressAVDepthData_BGRA:timingInfo:error:]();
    }
LABEL_14:

    goto LABEL_15;
  }
  size_t v9 = Float32DepthImageForAVDepthData;
  char v10 = [(JFXDepthCompressor *)self copyDepthBufferAsBGRA:Float32DepthImageForAVDepthData];
  CVPixelBufferRelease(v9);
  if (v10)
  {
    CMVideoFormatDescriptionRef formatDescriptionOut = 0;
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], v10, &formatDescriptionOut);
    size_t v12 = objc_opt_new();
    [v12 addEntriesFromDictionary:CMFormatDescriptionGetExtensions(formatDescriptionOut)];
    CMVideoFormatDescriptionRef formatDescription = 0;
    unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(formatDescriptionOut);
    int32_t v14 = Dimensions;
    unint64_t v15 = HIDWORD(Dimensions);
    FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType(formatDescriptionOut);
    CMVideoFormatDescriptionCreate(v11, MediaSubType, v14, v15, (CFDictionaryRef)v12, &formatDescription);
    if (formatDescription)
    {
      CMSampleBufferRef sampleBufferOut = 0;
      CMSampleBufferCreateReadyWithImageBuffer(v11, v10, formatDescription, (const CMSampleTimingInfo *)a4, &sampleBufferOut);
      if (sampleBufferOut)
      {
        id v17 = objc_alloc(MEMORY[0x263F61228]);
        id v18 = (void *)[v17 initWithSampleBuffer:sampleBufferOut];
        CFRelease(sampleBufferOut);
        CVPixelBufferRelease(v10);
        CFRelease(formatDescriptionOut);
        CFRelease(formatDescription);

        goto LABEL_16;
      }
      CVPixelBufferRelease(v10);
      CFRelease(formatDescriptionOut);
      CFRelease(formatDescription);
      uint64_t v19 = JFXLog_DebugDepthCodec();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[JFXDepthCompressor compressAVDepthData_BGRA:timingInfo:error:]();
      }
    }
    else
    {
      uint64_t v19 = JFXLog_DebugDepthCodec();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[JFXDepthCompressor compressAVDepthData_BGRA:timingInfo:error:]();
      }
    }

    if (a5)
    {
      *a5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:0];
    }
    goto LABEL_14;
  }
LABEL_15:
  id v18 = 0;
LABEL_16:
  return v18;
}

- (id)compressAVDepthData_Photo:(id)a3 timingInfo:(id *)a4 error:(id *)a5
{
  v78[3] = *MEMORY[0x263EF8340];
  id v8 = a3;
  ContiguousCVPixelBufferRef Float32DepthImageForAVDepthData = createContiguousFloat32DepthImageForAVDepthData(v8);
  if (!ContiguousFloat32DepthImageForAVDepthData)
  {
    id v18 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[JFXDepthCompressor compressAVDepthData_BGRA:timingInfo:error:]();
    }
    goto LABEL_38;
  }
  char v10 = malloc_type_malloc(0x40000uLL, 0x1817421BuLL);
  if (!v10)
  {
LABEL_36:
    id v18 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[JFXDepthCompressor compressAVDepthData_Photo:timingInfo:error:]();
    }
LABEL_38:

    if (a5)
    {
      *a5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:0];
    }
    goto LABEL_68;
  }
  CFAllocatorRef v11 = v10;
  memset(v10, 128, 0x40000uLL);
  CFDataRef v12 = [MEMORY[0x263EFF8F8] dataWithBytes:v11 length:0x40000];
  CFDataRef v13 = v12;
  if (v12)
  {
    CGDataProviderRef v14 = CGDataProviderCreateWithCFData(v12);
    if (v14)
    {
      unint64_t v15 = v14;
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      id v17 = CGImageCreate(0x100uLL, 0x100uLL, 8uLL, 0x20uLL, 0x400uLL, DeviceRGB, 0x2004u, v15, 0, 0, kCGRenderingIntentDefault);
      CGDataProviderRelease(v15);
      CGColorSpaceRelease(DeviceRGB);
      goto LABEL_13;
    }
    uint64_t v19 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[JFXDepthCompressor compressAVDepthData_Photo:timingInfo:error:]5();
    }
  }
  else
  {
    uint64_t v19 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[JFXDepthCompressor compressAVDepthData_Photo:timingInfo:error:]4();
    }
  }

  id v17 = 0;
LABEL_13:
  free(v11);

  if (!v17) {
    goto LABEL_36;
  }
  uint64_t v20 = *MEMORY[0x263F0F028];
  v77[0] = *MEMORY[0x263F0EFE8];
  v77[1] = v20;
  v78[0] = &unk_26E801EC0;
  v78[1] = MEMORY[0x263EFFA88];
  v77[2] = *MEMORY[0x263F0F030];
  v78[2] = MEMORY[0x263EFFA88];
  CFDictionaryRef properties = [NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:3];
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(ContiguousFloat32DepthImageForAVDepthData);
  size_t Height = CVPixelBufferGetHeight(ContiguousFloat32DepthImageForAVDepthData);
  size_t v23 = CGImageGetBytesPerRow(v17);
  size_t v24 = CGImageGetHeight(v17);
  Mutable = CFDataCreateMutable(0, Height * BytesPerRow + 2 * v23 * v24);
  if (!Mutable)
  {
    uint64_t v44 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
      -[JFXDepthCompressor compressAVDepthData_Photo:timingInfo:error:]();
    }

    if (a5)
    {
      *a5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:0];
    }
    goto LABEL_67;
  }
  uint64_t v26 = Mutable;
  uint64_t v27 = CGImageDestinationCreateWithData(Mutable, (CFStringRef)*MEMORY[0x263EF9870], 1uLL, 0);
  if (!v27)
  {
    uint64_t v45 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
      -[JFXDepthCompressor compressAVDepthData_Photo:timingInfo:error:].cold.4();
    }

    if (a5)
    {
      *a5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:0];
    }
    goto LABEL_66;
  }
  v28 = v27;
  CGImageDestinationAddImage(v27, v17, properties);
  id v72 = 0;
  CFDictionaryRef v68 = [v8 dictionaryRepresentationForAuxiliaryDataType:&v72];
  CFAllocatorRef v69 = (__CFString *)v72;
  if (([(__CFString *)v69 isEqualToString:*MEMORY[0x263F0EFA0]] & 1) == 0)
  {
    uint64_t v29 = v26;
    uint64_t v30 = v28;
    id v31 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      -[JFXDepthCompressor compressAVDepthData_Photo:timingInfo:error:]3();
    }

    v28 = v30;
    uint64_t v26 = v29;
    if (a5)
    {
      *a5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:0];
    }
  }
  CGImageDestinationAddAuxiliaryDataInfo(v28, v69, v68);
  v67 = v28;
  if (!CGImageDestinationFinalize(v28))
  {
    uint64_t v46 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
      -[JFXDepthCompressor compressAVDepthData_Photo:timingInfo:error:]2();
    }

    int v47 = v67;
    if (a5)
    {
      *a5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:0];
    }
    goto LABEL_65;
  }
  int32_t width = CVPixelBufferGetWidth(ContiguousFloat32DepthImageForAVDepthData);
  unsigned int v32 = v26;
  uint64_t v33 = NSDictionary;
  id v34 = [(JFXDepthCompressor *)self mutableCopyExtensionsDictionaryCopyFromAVDepthData:v8];
  CFDictionaryRef v35 = [v33 dictionaryWithDictionary:v34];

  CFDictionaryRef v66 = v35;
  if (!v35)
  {
    v48 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
      -[JFXDepthCompressor compressAVDepthData_Photo:timingInfo:error:].cold.5();
    }
    goto LABEL_54;
  }
  long long v36 = *(_OWORD *)&a4->var2.var0;
  *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = *(_OWORD *)&a4->var1.var1;
  *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v36;
  sampleTimingArray.decodeTimeStamp.epoch = a4->var2.var3;
  long long v37 = *(_OWORD *)&a4->var0.var3;
  *(_OWORD *)&sampleTimingArray.duration.value = *(_OWORD *)&a4->var0.var0;
  *(_OWORD *)&sampleTimingArray.duration.epoch = v37;
  uint64_t v38 = v32;
  CMSampleBufferRef sampleBufferOut = 0;
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  CFAllocatorRef v39 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  int ReadonlyCMBlockBufferFromNSData = CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0x48453230u, width, Height, v35, &formatDescriptionOut);
  if (ReadonlyCMBlockBufferFromNSData || !formatDescriptionOut)
  {
    unsigned int v52 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
      -[JFXDepthCompressor compressAVDepthData_Photo:timingInfo:error:]1();
    }

    goto LABEL_59;
  }
  CFTypeRef cf = 0;
  int ReadonlyCMBlockBufferFromNSData = createReadonlyCMBlockBufferFromNSData((CMBlockBufferRef *)&cf, v38);
  if (ReadonlyCMBlockBufferFromNSData || !cf)
  {
    v56 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
      -[JFXDepthCompressor compressAVDepthData_Photo:timingInfo:error:]0();
    }

    CMSampleBufferRef v41 = 0;
  }
  else
  {
    size_t sampleSizeArray = [(__CFData *)v38 length];
    int ReadonlyCMBlockBufferFromNSData = CMSampleBufferCreateReady(v39, (CMBlockBufferRef)cf, formatDescriptionOut, 1, 1, &sampleTimingArray, 1, &sampleSizeArray, &sampleBufferOut);
    CMSampleBufferRef v41 = sampleBufferOut;
    if (!sampleBufferOut)
    {
      uint64_t v42 = JFXLog_DebugDepthCodec();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
        -[JFXDepthCompressor compressAVDepthData_Photo:timingInfo:error:].cold.9();
      }
    }
    if (ReadonlyCMBlockBufferFromNSData)
    {
      v43 = JFXLog_DebugDepthCodec();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
        -[JFXDepthCompressor compressAVDepthData_Photo:timingInfo:error:].cold.8();
      }
    }
    CFRelease(cf);
  }
  CFRelease(formatDescriptionOut);

  if (!v41 || ReadonlyCMBlockBufferFromNSData)
  {
LABEL_59:
    size_t v53 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
      -[JFXDepthCompressor compressAVDepthData_Photo:timingInfo:error:].cold.7();
    }

    int v47 = v67;
    if (!a5) {
      goto LABEL_64;
    }
    v49 = (void *)MEMORY[0x263F087E8];
    uint64_t v50 = *MEMORY[0x263F08410];
    uint64_t v51 = ReadonlyCMBlockBufferFromNSData;
    goto LABEL_63;
  }
  uint64_t v57 = [objc_alloc(MEMORY[0x263F61228]) initWithSampleBuffer:v41];
  if (!v57)
  {
    v48 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
      -[JFXDepthCompressor compressAVDepthData_Photo:timingInfo:error:].cold.6(v48, v58, v59, v60, v61, v62, v63, v64);
    }
LABEL_54:

    int v47 = v67;
    if (!a5)
    {
LABEL_64:

LABEL_65:
      CFRelease(v47);

LABEL_66:
      CFRelease(v26);
LABEL_67:
      CGImageRelease(v17);

LABEL_68:
      CVPixelBufferRelease(ContiguousFloat32DepthImageForAVDepthData);
      v54 = 0;
      goto LABEL_69;
    }
    v49 = (void *)MEMORY[0x263F087E8];
    uint64_t v50 = *MEMORY[0x263F08410];
    uint64_t v51 = -50;
LABEL_63:
    *a5 = [v49 errorWithDomain:v50 code:v51 userInfo:0];
    goto LABEL_64;
  }
  v54 = (void *)v57;
  CVPixelBufferRelease(ContiguousFloat32DepthImageForAVDepthData);
  CGImageRelease(v17);
  CFRelease(v38);
  CFRelease(v67);
  CFRelease(v41);

LABEL_69:
  return v54;
}

+ (id)NSDataFromFloatDepth32:(__CVBuffer *)a3
{
  if (a3)
  {
    size_t DataSize = CVPixelBufferGetDataSize(a3);
    size_t Width = CVPixelBufferGetWidth(a3);
    if (DataSize == 4 * Width * CVPixelBufferGetHeight(a3))
    {
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      BaseAddress = CVPixelBufferGetBaseAddress(a3);
      if (BaseAddress)
      {
        BOOL v7 = [MEMORY[0x263EFF8F8] dataWithBytes:BaseAddress length:DataSize];
      }
      else
      {
        BOOL v7 = 0;
      }
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
      goto LABEL_11;
    }
    id v8 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[JFXDepthCompressor NSDataFromFloatDepth32:]();
    }
  }
  BOOL v7 = 0;
LABEL_11:
  return v7;
}

+ (id)NSDataFromDepthMapInsideAVDepthData:(id)a3
{
  ContiguousCVPixelBufferRef Float32DepthImageForAVDepthData = createContiguousFloat32DepthImageForAVDepthData(a3);
  CFAllocatorRef v4 = [(id)objc_opt_class() NSDataFromFloatDepth32:ContiguousFloat32DepthImageForAVDepthData];
  CVPixelBufferRelease(ContiguousFloat32DepthImageForAVDepthData);
  return v4;
}

- (id)mutableCopyExtensionsDictionaryCopyFromAVDepthData:(id)a3
{
  v30[7] = *MEMORY[0x263EF8340];
  id v3 = [a3 depthDataByConvertingToDepthDataType:1717855600];
  CFAllocatorRef v4 = [v3 dictionaryRepresentationForAuxiliaryDataType:0];
  id v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = *MEMORY[0x263F0EF98];
  BOOL v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F0EF98]];

  if (v7) {
    MutableCopy = CGImageMetadataCreateMutableCopy((CGImageMetadataRef)v7);
  }
  else {
    MutableCopy = CGImageMetadataCreateMutable();
  }
  size_t v9 = MutableCopy;
  if (MutableCopy)
  {
    CFErrorRef err = 0;
    if (CGImageMetadataRegisterNamespaceForPrefix(MutableCopy, @"http://ns.apple.com/pixeldatainfo/1.0/", @"apdi", &err))
    {
      uint64_t v10 = [v3 depthDataType];
      uint64_t v11 = v10;
      BOOL v12 = v10 == 1751410032 || v10 == 1717855600;
      CFDataRef v13 = @"disparity";
      if (v12) {
        CFDataRef v13 = @"depth";
      }
      v30[0] = v13;
      v29[0] = @"AuxiliaryImageType";
      v29[1] = @"NativeFormat";
      CGDataProviderRef v14 = NSNumber;
      unint64_t v15 = v13;
      unsigned int v16 = [v14 numberWithUnsignedInt:v11];
      v30[1] = v16;
      v30[2] = &unk_26E802098;
      v29[2] = @"FloatMinValue";
      v29[3] = @"FloatMaxValue";
      v30[3] = &unk_26E8020A8;
      v30[4] = &unk_26E801CC8;
      v29[4] = @"StoredFormat";
      v29[5] = @"IntMinValue";
      v29[6] = @"IntMaxValue";
      v30[5] = &unk_26E801CE0;
      v30[6] = &unk_26E801CF8;
      id v17 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:7];

      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __73__JFXDepthCompressor_mutableCopyExtensionsDictionaryCopyFromAVDepthData___block_invoke;
      v27[3] = &__block_descriptor_40_e15_v32__0_8_16_B24l;
      v27[4] = v9;
      [v17 enumerateKeysAndObjectsUsingBlock:v27];
      CFDataRef XMPData = CGImageMetadataCreateXMPData(v9, 0);
      [v5 setObject:XMPData forKeyedSubscript:kJFXCGImageAuxiliaryDataInfoMetadataAsXMPKey];

      [v5 removeObjectForKey:v6];
      [v5 removeObjectForKey:*MEMORY[0x263F0EF88]];
    }
    else
    {
      id v17 = JFXLog_DebugDepthCodec();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[JFXDepthCompressor mutableCopyExtensionsDictionaryCopyFromAVDepthData:]((uint64_t)&err, v17, v20, v21, v22, v23, v24, v25);
      }
    }

    CFRelease(v9);
  }
  else
  {
    uint64_t v19 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[JFXDepthCompressor mutableCopyExtensionsDictionaryCopyFromAVDepthData:]();
    }
  }
  return v5;
}

void __73__JFXDepthCompressor_mutableCopyExtensionsDictionaryCopyFromAVDepthData___block_invoke(uint64_t a1, void *a2, const void *a3)
{
  id v5 = a2;
  CGImageMetadataTagRef v6 = CGImageMetadataTagCreate(@"http://ns.apple.com/pixeldatainfo/1.0/", @"apdi", v5, kCGImageMetadataTypeDefault, a3);
  if (v6)
  {
    CGImageMetadataTagRef v7 = v6;
    id v8 = [NSString stringWithFormat:@"%@:%@", @"apdi", v5];
    if (v8)
    {
      if (CGImageMetadataSetTagWithPath(*(CGMutableImageMetadataRef *)(a1 + 32), 0, v8, v7))
      {
LABEL_11:
        CFRelease(v7);
        goto LABEL_12;
      }
      size_t v9 = JFXLog_DebugDepthCodec();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __73__JFXDepthCompressor_mutableCopyExtensionsDictionaryCopyFromAVDepthData___block_invoke_cold_3();
      }
    }
    else
    {
      size_t v9 = JFXLog_DebugDepthCodec();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __73__JFXDepthCompressor_mutableCopyExtensionsDictionaryCopyFromAVDepthData___block_invoke_cold_2();
      }
    }

    goto LABEL_11;
  }
  JFXLog_DebugDepthCodec();
  id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG)) {
    __73__JFXDepthCompressor_mutableCopyExtensionsDictionaryCopyFromAVDepthData___block_invoke_cold_1();
  }
LABEL_12:
}

- (id)compressAVDepthData_LZ:(id)a3 timingInfo:(id *)a4 error:(id *)a5
{
  CMVideoCodecType depthCodecType = self->_depthCodecType;
  switch(depthCodecType)
  {
    case 0x4C5A6672u:
      uint64_t v8 = 1;
      break;
    case 0x4C5A6673u:
      uint64_t v8 = 0;
      break;
    case 0x4C5A6D61u:
      uint64_t v8 = 2;
      break;
    default:
      uint64_t v8 = 3;
      break;
  }
  size_t v9 = [a3 depthDataByConvertingToDepthDataType:1717855600];
  uint64_t v10 = [v9 dictionaryRepresentationForAuxiliaryDataType:0];
  uint64_t v11 = (void *)[v10 mutableCopy];

  uint64_t v12 = *MEMORY[0x263F0EF98];
  CFDataRef v13 = [v11 objectForKeyedSubscript:*MEMORY[0x263F0EF98]];

  CFDataRef XMPData = CGImageMetadataCreateXMPData((CGImageMetadataRef)v13, 0);
  [v11 setObject:XMPData forKeyedSubscript:kJFXCGImageAuxiliaryDataInfoMetadataAsXMPKey];
  unint64_t v15 = [(id)objc_opt_class() NSDataFromDepthMapInsideAVDepthData:v9];
  unsigned int v16 = v15;
  if (v15)
  {
    id v42 = 0;
    id v17 = [v15 compressedDataUsingAlgorithm:v8 error:&v42];
    id v18 = v42;
    uint64_t v19 = v18;
    if (!v17 || v18)
    {
      uint64_t v29 = JFXLog_DebugDepthCodec();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        -[JFXDepthCompressor compressAVDepthData_LZ:timingInfo:error:]();
      }

      if (v19)
      {
        if (a5)
        {
          id v30 = v19;
LABEL_32:
          *a5 = v30;
        }
LABEL_47:

        goto LABEL_48;
      }
    }
    else
    {
      CMBlockBufferRef theBuffer = 0;
      createReadonlyCMBlockBufferFromNSData(&theBuffer, v17);
      if (theBuffer)
      {
        CMSampleTimingInfo sampleTimingArray = (CMSampleTimingInfo *)a4;
        long long v37 = a5;
        CMVideoFormatDescriptionRef formatDescriptionOut = 0;
        size_t sampleSizeArray = CMBlockBufferGetDataLength(theBuffer);
        [v11 removeObjectForKey:v12];
        [v11 removeObjectForKey:*MEMORY[0x263F0EF88]];
        uint64_t v20 = (__CVBuffer *)[v9 depthDataMap];
        CFAllocatorRef v21 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        int32_t Width = CVPixelBufferGetWidth(v20);
        int32_t Height = CVPixelBufferGetHeight(v20);
        if (CMVideoFormatDescriptionCreate(v21, depthCodecType, Width, Height, (CFDictionaryRef)v11, &formatDescriptionOut)|| !formatDescriptionOut)
        {
          unsigned int v32 = JFXLog_DebugDepthCodec();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
            -[JFXDepthCompressor compressAVDepthData_LZ:timingInfo:error:].cold.6();
          }
        }
        else
        {
          CMSampleBufferRef sampleBufferOut = 0;
          OSStatus v24 = CMSampleBufferCreateReady(v21, theBuffer, formatDescriptionOut, 1, 1, sampleTimingArray, 1, &sampleSizeArray, &sampleBufferOut);
          if (v24 || !sampleBufferOut)
          {
            uint64_t v33 = JFXLog_DebugDepthCodec();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
              -[JFXDepthCompressor compressAVDepthData_LZ:timingInfo:error:].cold.5();
            }

            if (v37)
            {
              *long long v37 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v24 userInfo:0];
            }
          }
          else
          {
            id v25 = objc_alloc(MEMORY[0x263F61228]);
            uint64_t v26 = [v25 initWithSampleBuffer:sampleBufferOut];
            if (v26)
            {
              uint64_t v27 = (void *)v26;
              CFRelease(sampleBufferOut);
              CFRelease(formatDescriptionOut);
              CFRelease(theBuffer);

              goto LABEL_49;
            }
            id v34 = JFXLog_DebugDepthCodec();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
              -[JFXDepthCompressor compressAVDepthData_LZ:timingInfo:error:].cold.4();
            }

            if (v37)
            {
              *long long v37 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:0 userInfo:0];
            }
            CFRelease(sampleBufferOut);
          }
          CFRelease(formatDescriptionOut);
        }
        CFRelease(theBuffer);
        goto LABEL_47;
      }
      id v31 = JFXLog_DebugDepthCodec();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        -[JFXDepthCompressor compressAVDepthData_LZ:timingInfo:error:]();
      }
    }
    if (a5)
    {
      id v30 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:0];
      goto LABEL_32;
    }
    goto LABEL_47;
  }
  v28 = JFXLog_DebugDepthCodec();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    -[JFXDepthCompressor compressAVDepthData_LZ:timingInfo:error:]();
  }

  if (a5)
  {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:0];
    uint64_t v27 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v27 = 0;
LABEL_49:

  return v27;
}

+ (id)fakeAuxDepthInfoDictionaryForCVPixelBuffer:(__CVBuffer *)a3
{
  v24[4] = *MEMORY[0x263EF8340];
  CFDataRef v4 = +[JFXDepthCompressor fakeXMPDataIfNotFound];
  CGImageMetadataRef v5 = CGImageMetadataCreateFromXMPData(v4);
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v23[0] = @"Width";
  uint64_t v10 = [NSNumber numberWithInt:Width];
  v24[0] = v10;
  v23[1] = @"Height";
  uint64_t v11 = [NSNumber numberWithInt:Height];
  v24[1] = v11;
  v23[2] = @"PixelFormat";
  uint64_t v12 = [NSNumber numberWithUnsignedInt:PixelFormatType];
  v24[2] = v12;
  v23[3] = @"BytesPerRow";
  CFDataRef v13 = [NSNumber numberWithInt:BytesPerRow];
  v24[3] = v13;
  CGDataProviderRef v14 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];

  CVPixelBufferLockBaseAddress(a3, 1uLL);
  unint64_t v15 = (void *)MEMORY[0x263EFF8F8];
  BaseAddress = CVPixelBufferGetBaseAddress(a3);
  id v17 = [v15 dataWithBytes:BaseAddress length:CVPixelBufferGetDataSize(a3)];
  uint64_t v18 = *MEMORY[0x263F0EF90];
  v21[0] = *MEMORY[0x263F0EF88];
  v21[1] = v18;
  v22[0] = v17;
  v22[1] = v14;
  v21[2] = *MEMORY[0x263F0EF98];
  v22[2] = v5;
  uint64_t v19 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];

  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  return v19;
}

- (id)compressDepthMapCVPixelBuffer:(__CVBuffer *)a3 timingInfo:(id *)a4 error:(id *)a5
{
  size_t v9 = +[JFXDepthCompressor fakeAuxDepthInfoDictionaryForCVPixelBuffer:](JFXDepthCompressor, "fakeAuxDepthInfoDictionaryForCVPixelBuffer:");
  uint64_t v10 = [MEMORY[0x263EFA6F0] depthDataFromDictionaryRepresentation:v9 error:a5];
  uint64_t v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 depthDataByReplacingDepthDataMapWithPixelBuffer:a3 error:a5];
    long long v13 = *(_OWORD *)&a4->var2.var0;
    v17[2] = *(_OWORD *)&a4->var1.var1;
    v17[3] = v13;
    int64_t var3 = a4->var2.var3;
    long long v14 = *(_OWORD *)&a4->var0.var3;
    v17[0] = *(_OWORD *)&a4->var0.var0;
    v17[1] = v14;
    unint64_t v15 = [(JFXDepthCompressor *)self compressAVDepthData:v12 timingInfo:v17 error:a5];
  }
  else
  {
    unint64_t v15 = 0;
  }

  return v15;
}

- (int)depthCodecType
{
  return self->_depthCodecType;
}

- (void).cxx_destruct
{
}

- (void)depthFormatDescriptionForDepthDimensions:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: fakeDepthMap is NULL", v2, v3, v4, v5, v6);
}

- (void)depthFormatDescriptionForDepthDimensions:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Warning: FIXME: depthFormatDescriptionForDepthDimensions returning NULL", v2, v3, v4, v5, v6);
}

- (void)depthFormatDescriptionForDepthDimensions:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_234C41000, v0, v1, "Error: compressDepthMapCVPixelBuffer returned null PVCMSampleBuffer %@", v2, v3, v4, v5, v6);
}

- (void)depthFormatDescriptionForDepthDimensions:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: compressDepthMapCVPixelBuffer returned null inner CMSampleBufferRef", v2, v3, v4, v5, v6);
}

- (void)depthFormatDescriptionForDepthDimensions:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: imageBGRA is NULL", v2, v3, v4, v5, v6);
}

- (void)hevcSEIPayload:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_234C41000, v0, v1, "Error: unknown SEI found (payloadType=%d", v2, v3, v4, v5, v6);
}

- (void)hevcSEIPayload:(NSObject *)a3 .cold.2(int *a1, void *a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = *a1;
  v5[0] = 67109376;
  v5[1] = v4;
  __int16 v6 = 2048;
  uint64_t v7 = [a2 length];
  _os_log_debug_impl(&dword_234C41000, a3, OS_LOG_TYPE_DEBUG, "Error: invalid length field %u > %lu", (uint8_t *)v5, 0x12u);
}

- (void)depthSampleBufferAppendingDepthMetadata:depthSampleBufferFromCodec:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_234C41000, v0, OS_LOG_TYPE_ERROR, "Error: depthSampleBuffer is nil", v1, 2u);
}

- (void)depthSampleBufferAppendingDepthMetadata:depthSampleBufferFromCodec:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_234C41000, v0, v1, "Error: CMSampleBufferCreate failed with error %d", v2, v3, v4, v5, v6);
}

- (void)depthSampleBufferAppendingDepthMetadata:(OpaqueCMBlockBuffer *)a1 depthSampleBufferFromCodec:.cold.3(OpaqueCMBlockBuffer *a1)
{
  CMBlockBufferGetDataLength(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v1, v2, "data length after: %lu bytes", v3, v4, v5, v6, v7);
}

- (void)depthSampleBufferAppendingDepthMetadata:depthSampleBufferFromCodec:.cold.4()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_234C41000, v0, v1, "Error: CMBlockBufferAppendBufferReference(seiMessageBBuf) failed with error %d", v2, v3, v4, v5, v6);
}

- (void)depthSampleBufferAppendingDepthMetadata:depthSampleBufferFromCodec:.cold.5()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_234C41000, v0, v1, "Error: CMBlockBufferAppendBufferReference(seiNalUnitLengthBBuf) failed with error %d", v2, v3, v4, v5, v6);
}

- (void)depthSampleBufferAppendingDepthMetadata:depthSampleBufferFromCodec:.cold.6()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_234C41000, v0, v1, "Error: createReadonlyCMBlockBufferFromNSData(seiNalUnitLengthData) failed with error %d", v2, v3, v4, v5, v6);
}

- (void)depthSampleBufferAppendingDepthMetadata:depthSampleBufferFromCodec:.cold.7()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_234C41000, v0, v1, "Error: createReadonlyCMBlockBufferFromNSData(seiMessage) failed with error %d", v2, v3, v4, v5, v6);
}

- (void)depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: sampleDescriptionExtensionAtoms is NULL", v2, v3, v4, v5, v6);
}

- (void)depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:.cold.3()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_234C41000, v0, v1, "Error: CMVideoFormatDescriptionCreateFromHEVCParameterSets failed with error %d", v2, v3, v4, v5, v6);
}

- (void)depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "avoiding buffer overflow 2", v2, v3, v4, v5, v6);
}

- (void)depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "avoiding buffer overflow", v2, v3, v4, v5, v6);
}

- (void)depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "numNalus!=1 not handled yet.", v2, v3, v4, v5, v6);
}

- (void)depthSampleBufferWithNewHVCCWithDepthMetadata:(os_log_t)log depthSampleBufferFromCodec:.cold.7(unsigned __int8 a1, uint64_t *a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  v4[0] = 67109376;
  v4[1] = a1;
  __int16 v5 = 2048;
  uint64_t v6 = v3;
  _os_log_debug_impl(&dword_234C41000, log, OS_LOG_TYPE_DEBUG, "numOfArrays=%d (should be same as paramSetCount %lu)", (uint8_t *)v4, 0x12u);
}

- (void)depthSampleBufferWithNewHVCCWithDepthMetadata:(uint64_t)a3 depthSampleBufferFromCodec:(uint64_t)a4 .cold.8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_234C41000, a2, a3, "general_level_idc=%d", a5, a6, a7, a8, 0);
}

- (void)depthSampleBufferWithNewHVCCWithDepthMetadata:(uint64_t)a3 depthSampleBufferFromCodec:(uint64_t)a4 .cold.9(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_234C41000, a2, a3, "general_profile_idc=%d", a5, a6, a7, a8, 0);
}

- (void)depthSampleBufferWithNewHVCCWithDepthMetadata:(uint64_t)a3 depthSampleBufferFromCodec:(uint64_t)a4 .cold.10(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_234C41000, a2, a3, "NALUnitHeaderLength=%d (should be 4)", a5, a6, a7, a8, 0);
}

- (void)depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:.cold.11()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_234C41000, v0, v1, "Error: CMVideoFormatDescriptionGetHEVCParameterSetAtIndex returned error %d", v2, v3, v4, v5, v6);
}

- (void)depthSampleBufferWithNewHVCCWithDepthMetadata:depthSampleBufferFromCodec:.cold.12()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: CMVideoFormatDescriptionGetHEVCParameterSetAtIndex failed.", v2, v3, v4, v5, v6);
}

- (void)compressAVDepthData_HEVC10:timingInfo:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: _videoEncoderInterface is NULL", v2, v3, v4, v5, v6);
}

- (void)compressAVDepthData_HEVC10:timingInfo:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: depthL010 is NULL", v2, v3, v4, v5, v6);
}

- (void)compressAVDepthData_HEVC10:timingInfo:error:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: depthSampleBufferFromCodec is NULL", v2, v3, v4, v5, v6);
}

- (void)compressAVDepthData_HEVC10:(OpaqueCMBlockBuffer *)a1 timingInfo:error:.cold.4(OpaqueCMBlockBuffer *a1)
{
  CMBlockBufferGetDataLength(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v1, v2, "data length before: %lu bytes", v3, v4, v5, v6, v7);
}

- (void)compressAVDepthData_HEVC10:timingInfo:error:.cold.6()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_234C41000, v0, v1, "Error: HEVCFormatDesc didn't have parameter sets error %d", v2, v3, v4, v5, v6);
}

- (void)compressAVDepthData_BGRA:timingInfo:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: depthImage is NULL", v2, v3, v4, v5, v6);
}

- (void)compressAVDepthData_BGRA:timingInfo:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: formatDesc is null", v2, v3, v4, v5, v6);
}

- (void)compressAVDepthData_BGRA:timingInfo:error:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: depthSampleBuffer is null", v2, v3, v4, v5, v6);
}

- (void)compressAVDepthData_Photo:timingInfo:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: CGImageCreate failed", v2, v3, v4, v5, v6);
}

- (void)compressAVDepthData_Photo:timingInfo:error:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: CFDataCreateMutable failed, destData is NULL.", v2, v3, v4, v5, v6);
}

- (void)compressAVDepthData_Photo:timingInfo:error:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: destCGData is NULL.", v2, v3, v4, v5, v6);
}

- (void)compressAVDepthData_Photo:timingInfo:error:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: format extensions is null.", v2, v3, v4, v5, v6);
}

- (void)compressAVDepthData_Photo:(uint64_t)a3 timingInfo:(uint64_t)a4 error:(uint64_t)a5 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_234C41000, a1, a3, "Error: createCMSampleBufferForNSData returned %d.", a5, a6, a7, a8, 0);
}

- (void)compressAVDepthData_Photo:timingInfo:error:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: [[PVCMSampleBuffer alloc] initWithSampleBuffer:] returned NULL.", v2, v3, v4, v5, v6);
}

- (void)compressAVDepthData_Photo:timingInfo:error:.cold.8()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_234C41000, v0, v1, "Error: CMSampleBufferCreateReady() returned error %d", v2, v3, v4, v5, v6);
}

- (void)compressAVDepthData_Photo:timingInfo:error:.cold.9()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: CMSampleBufferCreateReady() failed, depthSampleBuffer is NULL.", v2, v3, v4, v5, v6);
}

- (void)compressAVDepthData_Photo:timingInfo:error:.cold.10()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: createReadonlyCMBlockBufferFromNSData() failed, dataBuffer is NULL.", v2, v3, v4, v5, v6);
}

- (void)compressAVDepthData_Photo:timingInfo:error:.cold.11()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: CMVideoFormatDescriptionCreate() failed, dataBuffer is NULL.", v2, v3, v4, v5, v6);
}

- (void)compressAVDepthData_Photo:timingInfo:error:.cold.12()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: depth image not written to imageDest (which writes to destData).", v2, v3, v4, v5, v6);
}

- (void)compressAVDepthData_Photo:timingInfo:error:.cold.13()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_234C41000, v0, v1, "Error: got unexpected auxDataType %@.", v2, v3, v4, v5, v6);
}

- (void)compressAVDepthData_Photo:timingInfo:error:.cold.14()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: imageData = NULL", v2, v3, v4, v5, v6);
}

- (void)compressAVDepthData_Photo:timingInfo:error:.cold.15()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: dataProvider = NULL", v2, v3, v4, v5, v6);
}

+ (void)NSDataFromFloatDepth32:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: CVPixelBuffer padding detected.  FIXME: Need to handle this.", v2, v3, v4, v5, v6);
}

- (void)mutableCopyExtensionsDictionaryCopyFromAVDepthData:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Warning: mutableAuxMetadata is NULL", v2, v3, v4, v5, v6);
}

- (void)mutableCopyExtensionsDictionaryCopyFromAVDepthData:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __73__JFXDepthCompressor_mutableCopyExtensionsDictionaryCopyFromAVDepthData___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_234C41000, v0, v1, "Warning: CGImageMetadataTagCreate failed for key %@", v2, v3, v4, v5, v6);
}

void __73__JFXDepthCompressor_mutableCopyExtensionsDictionaryCopyFromAVDepthData___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Warning: path is nil, so not setting metadata", v2, v3, v4, v5, v6);
}

void __73__JFXDepthCompressor_mutableCopyExtensionsDictionaryCopyFromAVDepthData___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_234C41000, v0, v1, "Warning: CGImageMetadataSetValueWithPath failed for path %@", v2, v3, v4, v5, v6);
}

- (void)compressAVDepthData_LZ:timingInfo:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "srcData is NULL", v2, v3, v4, v5, v6);
}

- (void)compressAVDepthData_LZ:timingInfo:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "failed to compress depth using LZ lossless dictionary codec - got nserror", v2, v3, v4, v5, v6);
}

- (void)compressAVDepthData_LZ:timingInfo:error:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "createReadonlyBlockBuffer failed, blockBuffer = nil.", v2, v3, v4, v5, v6);
}

- (void)compressAVDepthData_LZ:timingInfo:error:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "SampleBufferRef is null or error detected", v2, v3, v4, v5, v6);
}

- (void)compressAVDepthData_LZ:timingInfo:error:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "depthSampleBuffer is NULL or CMSampleBufferCreateReady returned error", v2, v3, v4, v5, v6);
}

- (void)compressAVDepthData_LZ:timingInfo:error:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "formatDesc is null or error detected", v2, v3, v4, v5, v6);
}

@end