@interface JFXDepthDecompressor
+ (id)NSDataWithCMBlockBuffer:(OpaqueCMBlockBuffer *)a3 range:(_NSRange)a4;
+ (id)dataWithCMSampleBuffer:(opaqueCMSampleBuffer *)a3;
+ (id)trackOptionsForDepthCodecType:(int)a3 error:(id *)a4;
+ (int)bitDepthOf:(opaqueCMFormatDescription *)a3;
- (JFXDepthDecompressor)init;
- (id)decompressAVDepthData:(opaqueCMSampleBuffer *)a3 error:(id *)a4;
- (id)decompressAVDepthData_BGRA:(opaqueCMSampleBuffer *)a3 error:(id *)a4;
- (id)decompressAVDepthData_HEVC10:(opaqueCMSampleBuffer *)a3 error:(id *)a4;
- (id)decompressAVDepthData_LZ:(opaqueCMSampleBuffer *)a3 error:(id *)a4;
- (id)decompressAVDepthData_Photo:(opaqueCMSampleBuffer *)a3 error:(id *)a4;
- (id)incompleteImageSourceAuxDataInfoDict:(opaqueCMSampleBuffer *)a3 error:(id *)a4;
- (int)depthCodecType;
- (void)dealloc;
@end

@implementation JFXDepthDecompressor

- (JFXDepthDecompressor)init
{
  v3.receiver = self;
  v3.super_class = (Class)JFXDepthDecompressor;
  result = [(JFXDepthDecompressor *)&v3 init];
  if (result)
  {
    result->_depthCodecType = 0;
    result->_previousFormatDescription = 0;
  }
  return result;
}

- (void)dealloc
{
  videoDecoderInterface = self->_videoDecoderInterface;
  self->_videoDecoderInterface = 0;

  v4.receiver = self;
  v4.super_class = (Class)JFXDepthDecompressor;
  [(JFXDepthDecompressor *)&v4 dealloc];
}

+ (int)bitDepthOf:(opaqueCMFormatDescription *)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  objc_super v3 = CMFormatDescriptionGetExtension(a3, @"SampleDescriptionExtensionAtoms");
  objc_super v4 = v3;
  if (v3)
  {
    v5 = [v3 objectForKeyedSubscript:@"hvcC"];
    v6 = v5;
    if (v5)
    {
      [v5 getBytes:v9 length:18];
      if ((v9[16] & 3) != 0) {
        int v7 = 0;
      }
      else {
        int v7 = v9[17] & 7 | 8;
      }
    }
    else
    {
      int v7 = 0;
    }
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (id)decompressAVDepthData:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  signed int MediaSubType = CMFormatDescriptionGetMediaSubType(FormatDescription);
  if (a4) {
    *a4 = 0;
  }
  if (MediaSubType == 1111970369)
  {
    self->_depthCodecType = 1111970369;
    uint64_t v10 = [(JFXDepthDecompressor *)self decompressAVDepthData_BGRA:a3 error:a4];
    goto LABEL_17;
  }
  if (ImageBuffer) {
    goto LABEL_6;
  }
  if (MediaSubType <= 1280994656)
  {
    if ((MediaSubType - 1280992882) >= 2)
    {
      if (MediaSubType == 1212494384)
      {
        self->_depthCodecType = 1212494384;
        uint64_t v10 = [(JFXDepthDecompressor *)self decompressAVDepthData_Photo:a3 error:a4];
        goto LABEL_17;
      }
LABEL_6:
      uint64_t v10 = 0;
      self->_depthCodecType = 0;
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (MediaSubType == 1280994657 || MediaSubType == 1280997986)
  {
LABEL_16:
    self->_depthCodecType = MediaSubType;
    uint64_t v10 = [(JFXDepthDecompressor *)self decompressAVDepthData_LZ:a3 error:a4];
    goto LABEL_17;
  }
  if (MediaSubType != 1752589105
    || [(id)objc_opt_class() bitDepthOf:FormatDescription] != 10)
  {
    goto LABEL_6;
  }
  self->_depthCodecType = 1212493921;
  uint64_t v10 = [(JFXDepthDecompressor *)self decompressAVDepthData_HEVC10:a3 error:a4];
LABEL_17:
  return v10;
}

+ (id)dataWithCMSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  DataBuffer = CMSampleBufferGetDataBuffer(a3);
  objc_super v4 = DataBuffer;
  if (DataBuffer)
  {
    size_t DataLength = CMBlockBufferGetDataLength(DataBuffer);
    CMBlockBufferRef blockBufferOut = 0;
    OSStatus v6 = CMBlockBufferCreateContiguous((CFAllocatorRef)*MEMORY[0x263EFFB08], v4, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, DataLength, 2u, &blockBufferOut);
    objc_super v4 = 0;
    if (!v6 && blockBufferOut != 0)
    {
      size_t lengthAtOffsetOut = 0;
      dataPointerOut = 0;
      size_t v9 = 0;
      objc_super v4 = 0;
      if (!CMBlockBufferGetDataPointer(blockBufferOut, 0, &lengthAtOffsetOut, &v9, &dataPointerOut) && dataPointerOut)
      {
        objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:");
        objc_super v4 = (OpaqueCMBlockBuffer *)objc_claimAutoreleasedReturnValue();
      }
      CFRelease(blockBufferOut);
    }
  }
  return v4;
}

+ (id)NSDataWithCMBlockBuffer:(OpaqueCMBlockBuffer *)a3 range:(_NSRange)a4
{
  size_t length = a4.length;
  size_t location = a4.location;
  size_t DataLength = CMBlockBufferGetDataLength(a3);
  v8 = 0;
  if (location < DataLength && location + length <= DataLength)
  {
    v8 = malloc_type_malloc(length, 0xB27FD07DuLL);
    if (v8)
    {
      size_t v9 = v8;
      if (CMBlockBufferCopyDataBytes(a3, location, length, v8))
      {
        v8 = 0;
      }
      else
      {
        v8 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v9 length:DataLength freeWhenDone:1];
      }
    }
  }
  return v8;
}

- (id)incompleteImageSourceAuxDataInfoDict:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  v36[4] = *MEMORY[0x263EF8340];
  v5 = [MEMORY[0x263EFF8F8] dataWithBytes:"com.apple.Clips" length:16];
  size_t parameterSetCountOut = 0;
  int NALUnitHeaderLengthOut = 0;
  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  int v7 = FormatDescription;
  if (!FormatDescription
    || CMVideoFormatDescriptionGetHEVCParameterSetAtIndex(FormatDescription, 0, 0, 0, &parameterSetCountOut, &NALUnitHeaderLengthOut)|| parameterSetCountOut < 4|| (parameterSetSizeOut = 0, parameterSetPointerOut = 0, CMVideoFormatDescriptionGetHEVCParameterSetAtIndex(v7, 3uLL, (const uint8_t **)&parameterSetPointerOut, &parameterSetSizeOut, &parameterSetCountOut, 0))|| ([MEMORY[0x263EFF8F8] dataWithBytes:parameterSetPointerOut length:parameterSetSizeOut], (uint64_t v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    DataBuffer = CMSampleBufferGetDataBuffer(a3);
    size_t DataLength = CMBlockBufferGetDataLength(DataBuffer);
    uint64_t v10 = objc_msgSend((id)objc_opt_class(), "NSDataWithCMBlockBuffer:range:", DataBuffer, 0, DataLength);
  }
  uint64_t v11 = objc_msgSend(v10, "rangeOfData:options:range:", v5, 1, 0, objc_msgSend(v10, "length"));
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[JFXDepthDecompressor incompleteImageSourceAuxDataInfoDict:error:]();
    }

    CFDataRef v13 = +[JFXDepthCompressor fakeXMPDataIfNotFound];
  }
  else
  {
    uint64_t v14 = [v5 length] + v11;
    objc_msgSend(v10, "subdataWithRange:", v14, objc_msgSend(v10, "length") + ~v14);
    CFDataRef v13 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  }
  CFDataRef v15 = v13;
  CGImageMetadataRef v16 = CGImageMetadataCreateFromXMPData(v13);
  if (v7)
  {
    unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(v7);
    unint64_t v18 = HIDWORD(Dimensions);
    uint64_t v19 = (4 * Dimensions);
    v35[0] = @"Width";
    v20 = objc_msgSend(NSNumber, "numberWithInt:");
    v36[0] = v20;
    v35[1] = @"Height";
    v21 = [NSNumber numberWithInt:v18];
    v36[1] = v21;
    v35[2] = @"PixelFormat";
    v22 = [NSNumber numberWithUnsignedInt:1717855600];
    v36[2] = v22;
    v35[3] = @"BytesPerRow";
    v23 = [NSNumber numberWithInt:v19];
    v36[3] = v23;
    v24 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:4];

    uint64_t v25 = *MEMORY[0x263F0EF98];
    v33[0] = *MEMORY[0x263F0EF90];
    v33[1] = v25;
    v34[0] = v24;
    v34[1] = v16;
    v26 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
  }
  else
  {
    v27 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      -[JFXDepthDecompressor incompleteImageSourceAuxDataInfoDict:error:]();
    }

    if (v16) {
      CFRelease(v16);
    }
    v26 = 0;
  }

  return v26;
}

- (id)decompressAVDepthData_LZ:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  int depthCodecType = self->_depthCodecType;
  switch(depthCodecType)
  {
    case 1280992882:
      uint64_t v8 = 1;
      break;
    case 1280992883:
      uint64_t v8 = 0;
      break;
    case 1280994657:
      uint64_t v8 = 2;
      break;
    default:
      uint64_t v8 = 3;
      break;
  }
  size_t v9 = [(id)objc_opt_class() dataWithCMSampleBuffer:a3];
  uint64_t v10 = v9;
  if (v9)
  {
    id v25 = 0;
    uint64_t v11 = [v9 decompressedDataUsingAlgorithm:v8 error:&v25];
    id v12 = v25;
    id v13 = v12;
    if (!v11 || v12)
    {
      v21 = JFXLog_DebugDepthCodec();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[JFXDepthDecompressor decompressAVDepthData_LZ:error:].cold.4();
      }

      if (a4)
      {
        [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:0];
        v17 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }
      goto LABEL_38;
    }
    uint64_t v14 = [(JFXDepthDecompressor *)self incompleteImageSourceAuxDataInfoDict:a3 error:a4];
    CFDataRef v15 = v14;
    if (!v14)
    {
      v22 = JFXLog_DebugDepthCodec();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[JFXDepthDecompressor decompressAVDepthData_LZ:error:]();
      }

      if (a4)
      {
        [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:0];
        v17 = 0;
        id v13 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
        id v13 = 0;
      }
      goto LABEL_37;
    }
    CGImageMetadataRef v16 = (void *)[v14 mutableCopy];
    [v16 setObject:v11 forKeyedSubscript:*MEMORY[0x263F0EF88]];
    id v24 = 0;
    v17 = [MEMORY[0x263EFA6F0] depthDataFromDictionaryRepresentation:v16 error:&v24];
    id v13 = v24;
    if (!v17)
    {
      unint64_t v18 = JFXLog_DebugDepthCodec();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[JFXDepthDecompressor decompressAVDepthData_LZ:error:]();
      }

      if (v13)
      {
        if (a4)
        {
          id v19 = v13;
LABEL_35:
          *a4 = v19;
        }
      }
      else if (a4)
      {
        id v19 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:0];
        goto LABEL_35;
      }
    }

LABEL_37:
LABEL_38:

    goto LABEL_39;
  }
  v20 = JFXLog_DebugDepthCodec();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    -[JFXDepthDecompressor decompressAVDepthData_LZ:error:]();
  }

  if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:0];
    v17 = 0;
    id v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
    id v13 = 0;
  }
LABEL_39:

  return v17;
}

- (id)decompressAVDepthData_BGRA:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (ImageBuffer)
  {
    OSStatus v6 = copyBGRAToFloatDepthBuffer(ImageBuffer, 0);
    int v7 = +[JFXDepthCompressor fakeAuxDepthInfoDictionaryForCVPixelBuffer:v6];
    uint64_t v8 = [MEMORY[0x263EFA6F0] depthDataFromDictionaryRepresentation:v7 error:a4];
    size_t v9 = [v8 depthDataByReplacingDepthDataMapWithPixelBuffer:v6 error:a4];
    CVPixelBufferRelease(v6);
  }
  else
  {
    uint64_t v10 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[JFXDepthDecompressor decompressAVDepthData_BGRA:error:]();
    }

    size_t v9 = 0;
  }
  return v9;
}

- (id)decompressAVDepthData_HEVC10:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  size_t parameterSetCountOut = 0;
  int NALUnitHeaderLengthOut = 0;
  CMSampleBufferRef v50 = 0;
  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  if (CMVideoFormatDescriptionGetHEVCParameterSetAtIndex(FormatDescription, 0, 0, 0, &parameterSetCountOut, &NALUnitHeaderLengthOut)|| !parameterSetCountOut)
  {
    goto LABEL_13;
  }
  uint64_t v8 = (const uint8_t **)malloc_type_malloc(8 * parameterSetCountOut, 0x10040436913F5uLL);
  size_t v9 = (size_t *)malloc_type_malloc(8 * parameterSetCountOut, 0x100004000313F17uLL);
  if (parameterSetCountOut)
  {
    uint64_t v10 = 0;
    for (size_t i = 0; i < parameterSetCountOut; ++i)
    {
      CMVideoFormatDescriptionGetHEVCParameterSetAtIndex(FormatDescription, i, &v8[v10], &v9[v10], &parameterSetCountOut, 0);
      size_t v12 = parameterSetCountOut;
      ++v10;
    }
    if (parameterSetCountOut > 3)
    {
      CMFormatDescriptionRef formatDescriptionOut = 0;
      --parameterSetCountOut;
      CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      if (!CMVideoFormatDescriptionCreateFromHEVCParameterSets((CFAllocatorRef)*MEMORY[0x263EFFB08], v12 - 1, v8, v9, NALUnitHeaderLengthOut, 0, &formatDescriptionOut))
      {
        memset(&timingInfoOut, 0, sizeof(timingInfoOut));
        CMSampleBufferGetSampleTimingInfo(a3, 0, &timingInfoOut);
        size_t sampleSizeArray = CMSampleBufferGetSampleSize(a3, 0);
        DataBuffer = CMSampleBufferGetDataBuffer(a3);
        uint64_t v15 = CMSampleBufferCreate(v13, DataBuffer, 1u, 0, 0, formatDescriptionOut, 1, 1, &timingInfoOut, 1, &sampleSizeArray, &v50);
        if (v15)
        {
          uint64_t v16 = v15;
          v17 = JFXLog_DebugDepthCodec();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            -[JFXDepthDecompressor decompressAVDepthData_HEVC10:error:].cold.6(v16, v17, v18, v19, v20, v21, v22, v23);
          }
        }
      }
    }
  }
  free(v8);
  free(v9);
  CMSampleBufferRef v24 = v50;
  if (!v50)
  {
LABEL_13:
    CMSampleBufferRef v50 = a3;
    CMSampleBufferRef v24 = a3;
  }
  id v25 = CMSampleBufferGetFormatDescription(v24);
  int v26 = CMFormatDescriptionEqual(self->_previousFormatDescription, v25);
  videoDecoderInterface = self->_videoDecoderInterface;
  if (!videoDecoderInterface || !v26)
  {
    v28 = [[JFXVideoDecoderInterface alloc] initWithFormatDescription:v25];
    v29 = self->_videoDecoderInterface;
    self->_videoDecoderInterface = v28;

    previousFormatDescription = self->_previousFormatDescription;
    if (previousFormatDescription) {
      CFRelease(previousFormatDescription);
    }
    self->_previousFormatDescription = (opaqueCMFormatDescription *)CFRetain(v25);
    videoDecoderInterface = self->_videoDecoderInterface;
  }
  v31 = [(JFXVideoDecoderInterface *)videoDecoderInterface decodeFrame:v50];
  if (v31)
  {
    v32 = v31;
    CVPixelBufferRef v33 = copyL010ToFloatDepthBuffer(v31, 0);
    if (!v33)
    {
      v35 = JFXLog_DebugDepthCodec();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        -[JFXDepthDecompressor decompressAVDepthData_HEVC10:error:]();
      }
      v37 = 0;
      goto LABEL_43;
    }
    v34 = v33;
    v35 = [(JFXDepthDecompressor *)self incompleteImageSourceAuxDataInfoDict:a3 error:a4];
    if (a4 && *a4)
    {
      v36 = JFXLog_DebugDepthCodec();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        -[JFXDepthDecompressor decompressAVDepthData_HEVC10:error:].cold.5();
      }
      v37 = 0;
      goto LABEL_42;
    }
    v39 = +[JFXDepthCompressor NSDataFromFloatDepth32:v34];
    id v40 = [v35 mutableCopy];
    [v40 setObject:v39 forKeyedSubscript:*MEMORY[0x263F0EF88]];
    id v46 = 0;
    v37 = [MEMORY[0x263EFA6F0] depthDataFromDictionaryRepresentation:v40 error:&v46];
    v41 = v46;
    v36 = v41;
    if (v41)
    {
      if (a4) {
        *a4 = v41;
      }
      v42 = JFXLog_DebugDepthCodec();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
        -[JFXDepthDecompressor decompressAVDepthData_LZ:error:]();
      }
    }
    else
    {
      uint64_t v43 = [v37 depthDataMap];
      if (!v43)
      {
LABEL_41:

LABEL_42:
        CVPixelBufferRelease(v34);
LABEL_43:

        CVPixelBufferRelease(v32);
        goto LABEL_44;
      }
      v44 = (__CVBuffer *)v43;
      v42 = JFXLog_DebugDepthCodec();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
        -[JFXDepthDecompressor decompressAVDepthData_HEVC10:error:](v44, v42);
      }
    }

    goto LABEL_41;
  }
  v38 = JFXLog_DebugDepthCodec();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
    -[JFXDepthDecompressor decompressAVDepthData_HEVC10:error:]();
  }

  v37 = 0;
LABEL_44:
  return v37;
}

- (id)decompressAVDepthData_Photo:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  CFDataRef v5 = [(id)objc_opt_class() dataWithCMSampleBuffer:a3];
  CFDataRef v6 = v5;
  if (!v5)
  {
    v17 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[JFXDepthDecompressor decompressAVDepthData_Photo:error:]();
    }
    goto LABEL_15;
  }
  int v7 = CGImageSourceCreateWithData(v5, 0);
  if (!v7)
  {
    v17 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[JFXDepthDecompressor decompressAVDepthData_Photo:error:]();
    }
LABEL_15:

    if (a4)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:0];
      CFAllocatorRef v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CFAllocatorRef v13 = 0;
    }
    goto LABEL_24;
  }
  uint64_t v8 = v7;
  size_t PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(v7);
  CFDictionaryRef v10 = CGImageSourceCopyPropertiesAtIndex(v8, PrimaryImageIndex, 0);
  if (v10)
  {
    CFDictionaryRef v11 = v10;
    CFDictionaryRef v12 = CGImageSourceCopyAuxiliaryDataInfoAtIndex(v8, PrimaryImageIndex, (CFStringRef)*MEMORY[0x263F0EFA0]);
    id v26 = 0;
    CFAllocatorRef v13 = [MEMORY[0x263EFA6F0] depthDataFromDictionaryRepresentation:v12 error:&v26];
    id v14 = v26;
    uint64_t v15 = v14;
    if (v14)
    {
      if (a4) {
        *a4 = v14;
      }
      uint64_t v16 = JFXLog_DebugDepthCodec();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[JFXDepthDecompressor decompressAVDepthData_LZ:error:]();
      }
    }
  }
  else
  {
    uint64_t v18 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[JFXDepthDecompressor decompressAVDepthData_Photo:error:](PrimaryImageIndex, v18, v19, v20, v21, v22, v23, v24);
    }

    if (a4)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:0];
      CFAllocatorRef v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CFAllocatorRef v13 = 0;
    }
  }
  CFRelease(v8);
LABEL_24:

  return v13;
}

+ (id)trackOptionsForDepthCodecType:(int)a3 error:(id *)a4
{
  if (a3 <= 1280994656)
  {
    if (a3 > 1280992881)
    {
      if ((a3 - 1280992882) < 2) {
        goto LABEL_15;
      }
      goto LABEL_20;
    }
    if (a3 != 1111970369 && a3 != 1212493921)
    {
      int v5 = 1212494384;
      goto LABEL_14;
    }
LABEL_15:
    CFDataRef v6 = 0;
    if (a4) {
      *a4 = 0;
    }
    goto LABEL_17;
  }
  if (a3 <= 1499082807)
  {
    if (a3 == 1280994657) {
      goto LABEL_15;
    }
    int v5 = 1280997986;
  }
  else
  {
    if (a3 == 1499082808 || a3 == 1499083056) {
      goto LABEL_15;
    }
    int v5 = 1499082849;
  }
LABEL_14:
  if (a3 == v5) {
    goto LABEL_15;
  }
LABEL_20:
  if (a4)
  {
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-50 userInfo:0];
  }
  CFDataRef v6 = [NSDictionary dictionary];
LABEL_17:
  return v6;
}

- (int)depthCodecType
{
  return self->_depthCodecType;
}

- (void).cxx_destruct
{
}

- (void)incompleteImageSourceAuxDataInfoDict:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: format description not found in cmsamplebuffer.", v2, v3, v4, v5, v6);
}

- (void)incompleteImageSourceAuxDataInfoDict:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: SEI UUID not found.  Falling back to hard-coded XMP data. This should only be used in unit tests.", v2, v3, v4, v5, v6);
}

- (void)decompressAVDepthData_LZ:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: depthLZNSData is NULL", v2, v3, v4, v5, v6);
}

- (void)decompressAVDepthData_LZ:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: failed to create depth data dictionary", v2, v3, v4, v5, v6);
}

- (void)decompressAVDepthData_LZ:error:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: -[AVDepthData depthDataFromDictionaryRepresentation: error:] failed", v2, v3, v4, v5, v6);
}

- (void)decompressAVDepthData_LZ:error:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: failed to decompress depthLZNSData.", v2, v3, v4, v5, v6);
}

- (void)decompressAVDepthData_BGRA:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: depthImageBGRA is NULL", v2, v3, v4, v5, v6);
}

- (void)decompressAVDepthData_HEVC10:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: depthL010Decompressed is null", v2, v3, v4, v5, v6);
}

- (void)decompressAVDepthData_HEVC10:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: depthImageDecompressed is null", v2, v3, v4, v5, v6);
}

- (void)decompressAVDepthData_HEVC10:(__CVBuffer *)a1 error:(NSObject *)a2 .cold.3(__CVBuffer *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 67109376;
  v4[1] = CVPixelBufferGetWidth(a1);
  __int16 v5 = 1024;
  int Height = CVPixelBufferGetHeight(a1);
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "depthImage w=%d h=%d", (uint8_t *)v4, 0xEu);
}

- (void)decompressAVDepthData_HEVC10:error:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: incompleteImageSourceAuxDataInfoDict returned an error", v2, v3, v4, v5, v6);
}

- (void)decompressAVDepthData_HEVC10:(uint64_t)a3 error:(uint64_t)a4 .cold.6(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)decompressAVDepthData_Photo:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: dataWithCMSampleBuffer failed, depthNSData is NULL.", v2, v3, v4, v5, v6);
}

- (void)decompressAVDepthData_Photo:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: CGImageSourceCreateWithData() failed, imageSource is NULL.", v2, v3, v4, v5, v6);
}

- (void)decompressAVDepthData_Photo:(uint64_t)a3 error:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_234C41000, a2, a3, "Error: CGImageSourceCopyPropertiesAtIndex(%d) returned NULL imageProperties.", a5, a6, a7, a8, 0);
}

@end