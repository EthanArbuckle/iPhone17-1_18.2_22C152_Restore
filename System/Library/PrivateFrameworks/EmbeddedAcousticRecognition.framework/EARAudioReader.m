@interface EARAudioReader
- (EARAudioReader)initWithFileURL:(id)a3 sampleRate:(unint64_t)a4;
- (id)_avf_enumerateAudioBuffersWithBlock:(id)a3;
- (id)_opx_enumerateAudioBuffersWithBlock:(id)a3;
- (id)_opx_enumeratePacketsWithBlock:(id)a3;
- (id)enumerateAudioBuffersWithBlock:(id)a3;
@end

@implementation EARAudioReader

- (EARAudioReader)initWithFileURL:(id)a3 sampleRate:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EARAudioReader;
  v7 = [(EARAudioReader *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    fileURL = v7->_fileURL;
    v7->_fileURL = (NSURL *)v8;

    v7->_sampleRate = (double)a4;
  }

  return v7;
}

- (id)enumerateAudioBuffersWithBlock:(id)a3
{
  id v4 = a3;
  v5 = [(NSURL *)self->_fileURL pathExtension];
  id v6 = [v5 lowercaseString];
  int v7 = [v6 isEqual:@"opx"];

  if (v7) {
    [(EARAudioReader *)self _opx_enumerateAudioBuffersWithBlock:v4];
  }
  else {
  uint64_t v8 = [(EARAudioReader *)self _avf_enumerateAudioBuffersWithBlock:v4];
  }

  return v8;
}

- (id)_avf_enumerateAudioBuffersWithBlock:(id)a3
{
  v33[6] = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(id, char *, size_t, unsigned char *))a3;
  id v6 = [MEMORY[0x1E4F166D0] assetWithURL:self->_fileURL];
  id v31 = 0;
  int v7 = [MEMORY[0x1E4F16370] assetReaderWithAsset:v6 error:&v31];
  id v8 = v31;
  v9 = v8;
  if (v7)
  {
    uint64_t v10 = *MEMORY[0x1E4F151D8];
    v33[0] = &unk_1F0A74010;
    uint64_t v11 = *MEMORY[0x1E4F15268];
    v32[0] = v10;
    v32[1] = v11;
    v12 = [NSNumber numberWithDouble:self->_sampleRate];
    uint64_t v13 = *MEMORY[0x1E4F15230];
    v33[1] = v12;
    v33[2] = &unk_1F0A74028;
    uint64_t v14 = *MEMORY[0x1E4F151E8];
    v32[2] = v13;
    v32[3] = v14;
    uint64_t v15 = *MEMORY[0x1E4F15200];
    v33[3] = &unk_1F0A74040;
    v33[4] = MEMORY[0x1E4F1CC28];
    uint64_t v16 = *MEMORY[0x1E4F15210];
    v32[4] = v15;
    v32[5] = v16;
    v33[5] = MEMORY[0x1E4F1CC28];
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:6];

    v18 = (void *)MEMORY[0x1E4F16388];
    v19 = [v6 tracksWithMediaType:*MEMORY[0x1E4F15BB0]];
    v20 = [v18 assetReaderAudioMixOutputWithAudioTracks:v19 audioSettings:v17];

    if (!v20)
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2 object:self file:@"EARAudioReader.mm" lineNumber:68 description:&stru_1F0A64AB0];
    }
    if (([v7 canAddOutput:v20] & 1) == 0)
    {
      v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:a2 object:self file:@"EARAudioReader.mm" lineNumber:70 description:&stru_1F0A64AB0];
    }
    [v7 addOutput:v20];
    [v7 startReading];
    while (1)
    {
      v21 = (opaqueCMSampleBuffer *)[v20 copyNextSampleBuffer];
      id v22 = v21;
      if (!v21) {
        break;
      }
      size_t totalLengthOut = 0;
      dataPointerOut = 0;
      DataBuffer = CMSampleBufferGetDataBuffer(v21);
      OSStatus DataPointer = CMBlockBufferGetDataPointer(DataBuffer, 0, 0, &totalLengthOut, &dataPointerOut);
      if (DataPointer)
      {
        id v22 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:DataPointer userInfo:0];
        break;
      }
      char v28 = 0;
      v5[2](v5, dataPointerOut, totalLengthOut >> 1, &v28);
      if (v28)
      {
        id v22 = 0;
        break;
      }
      CFRelease(v22);
    }
  }
  else
  {
    id v22 = v8;
  }

  return v22;
}

- (id)_opx_enumerateAudioBuffersWithBlock:(id)a3
{
  id v4 = a3;
  inSourceFormat.mSampleRate = self->_sampleRate;
  *(_OWORD *)&inSourceFormat.mFormatID = xmmword_1B257FD10;
  *(_OWORD *)&inSourceFormat.mBytesPerFrame = xmmword_1B257FD20;
  inDestinationFormat.mSampleRate = inSourceFormat.mSampleRate;
  *(_OWORD *)&inDestinationFormat.mFormatID = xmmword_1B257FD30;
  *(_OWORD *)&inDestinationFormat.mBytesPerFrame = xmmword_1B257FD40;
  AudioConverterRef outAudioConverter = 0;
  v5 = (EARLogger *)AudioConverterNew(&inSourceFormat, &inDestinationFormat, &outAudioConverter);
  int v6 = (int)v5;
  if (v5)
  {
    int v7 = EARLogger::QuasarOSLogger(v5);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[EARAudioReader _opx_enumerateAudioBuffersWithBlock:](v6, v7);
    }

    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v6 userInfo:0];
  }
  else
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:640];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __54__EARAudioReader__opx_enumerateAudioBuffersWithBlock___block_invoke;
    v13[3] = &unk_1E5FFF758;
    int v17 = 320;
    id v14 = v9;
    AudioConverterRef v16 = outAudioConverter;
    id v15 = v4;
    id v10 = v9;
    id v11 = [(EARAudioReader *)self _opx_enumeratePacketsWithBlock:v13];

    id v8 = 0;
  }

  return v8;
}

void __54__EARAudioReader__opx_enumerateAudioBuffersWithBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  outOutputData.mNumberBuffers = 1;
  outOutputData.mBuffers[0].mData = (void *)[*(id *)(a1 + 32) mutableBytes];
  UInt32 v4 = [*(id *)(a1 + 32) length];
  outOutputData.mBuffers[0].mNumberChannels = 1;
  outOutputData.mBuffers[0].mDataByteSize = v4;
  UInt32 ioOutputDataPacketSize = *(_DWORD *)(a1 + 56);
  v5 = *(OpaqueAudioConverter **)(a1 + 48);
  inInputDataProcUserData[0] = MEMORY[0x1E4F143A8];
  inInputDataProcUserData[1] = 3221225472;
  inInputDataProcUserData[2] = __54__EARAudioReader__opx_enumerateAudioBuffersWithBlock___block_invoke_2;
  inInputDataProcUserData[3] = &unk_1E5FFF730;
  id v14 = v18;
  id v15 = &v20;
  id v6 = v3;
  id v13 = v6;
  int v7 = (EARLogger *)AudioConverterFillComplexBuffer(v5, (AudioConverterComplexInputDataProc)AudioConverterFillComplexBuffer_BlockInvoke, inInputDataProcUserData, &ioOutputDataPacketSize, &outOutputData, 0);
  int v8 = (int)v7;
  if (v7 != 1836086393 && v7)
  {
    id v11 = EARLogger::QuasarOSLogger(v7);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __54__EARAudioReader__opx_enumerateAudioBuffersWithBlock___block_invoke_cold_1(v8, v11);
    }

    goto LABEL_12;
  }
  if (!ioOutputDataPacketSize || !outOutputData.mNumberBuffers)
  {
LABEL_12:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_13;
  }
  int v9 = 2 * ioOutputDataPacketSize;
  if (2 * (unint64_t)ioOutputDataPacketSize <= outOutputData.mBuffers[0].mDataByteSize)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_12;
  }
  id v10 = EARLogger::QuasarOSLogger(v7);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    __54__EARAudioReader__opx_enumerateAudioBuffersWithBlock___block_invoke_cold_2(v9, (int *)&outOutputData.mBuffers[0].mDataByteSize, v10);
  }

LABEL_13:
  _Block_object_dispose(v18, 8);
}

uint64_t __54__EARAudioReader__opx_enumerateAudioBuffersWithBlock___block_invoke_2(uint64_t a1, unsigned int *a2, uint64_t a3, void *a4)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t result = 1836086393;
    *a2 = 0;
    *(void *)(a3 + 16) = 0;
    *(_DWORD *)(a3 + 12) = 0;
    if (a4)
    {
      int v9 = *(void **)(a1 + 48);
      void *v9 = 0;
      v9[1] = 0;
      *a4 = v9;
    }
  }
  else if (*a2 == 1)
  {
    int v10 = [*(id *)(a1 + 32) length];
    *(void *)(a3 + 16) = [*(id *)(a1 + 32) bytes];
    *(_DWORD *)(a3 + 12) = v10;
    if (a4)
    {
      uint64_t v11 = *(void *)(a1 + 48);
      *(void *)uint64_t v11 = 0;
      *(_DWORD *)(v11 + 8) = 0;
      *(_DWORD *)(v11 + 12) = v10;
      *a4 = v11;
    }
    uint64_t result = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    v12 = EARLogger::QuasarOSLogger((EARLogger *)a1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __54__EARAudioReader__opx_enumerateAudioBuffersWithBlock___block_invoke_2_cold_1(a2, v12);
    }

    return 1752524863;
  }
  return result;
}

- (id)_opx_enumeratePacketsWithBlock:(id)a3
{
  UInt32 v4 = (void (**)(id, void *, unsigned char *))a3;
  fileURL = self->_fileURL;
  id v21 = 0;
  id v6 = [MEMORY[0x1E4F28CB0] fileHandleForReadingFromURL:fileURL error:&v21];
  id v7 = v21;
  id v8 = v7;
  if (!v6)
  {
    id v8 = v7;
    id v15 = v8;
    goto LABEL_14;
  }
  while (2)
  {
    unint64_t v9 = 0;
    char v20 = 0x80;
    do
    {
      id v19 = 0;
      int v10 = [v6 readDataUpToLength:1 error:&v19];
      id v11 = v19;

      if (!v10)
      {
        id v15 = v11;
LABEL_13:

        id v8 = v11;
        goto LABEL_14;
      }
      if ([v10 length] != 1)
      {
        id v15 = 0;
        goto LABEL_13;
      }
      [v10 getBytes:&v20 length:1];
      unint64_t v12 = v20 & 0x7F | (v9 << 7);

      id v8 = v11;
      unint64_t v9 = v12;
    }
    while (v20 < 0);
    id v18 = 0;
    id v13 = [v6 readDataUpToLength:v12 error:&v18];
    id v8 = v18;

    if (!v13)
    {
      id v15 = v8;
LABEL_19:

      break;
    }
    if ([v13 length] != v12)
    {
      id v15 = 0;
      goto LABEL_19;
    }
    unsigned __int8 v17 = 0;
    v4[2](v4, v13, &v17);
    int v14 = v17;

    id v15 = 0;
    if (!v14) {
      continue;
    }
    break;
  }
LABEL_14:

  return v15;
}

- (void).cxx_destruct
{
}

- (void)_opx_enumerateAudioBuffersWithBlock:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B1A86000, a2, OS_LOG_TYPE_ERROR, "Could not make Opus decoder: %d", (uint8_t *)v2, 8u);
}

void __54__EARAudioReader__opx_enumerateAudioBuffersWithBlock___block_invoke_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B1A86000, a2, OS_LOG_TYPE_ERROR, "Could not finish Opus decoding for offline only mode: %d", (uint8_t *)v2, 8u);
}

void __54__EARAudioReader__opx_enumerateAudioBuffersWithBlock___block_invoke_cold_2(int a1, int *a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = *a2;
  v4[0] = 67109376;
  v4[1] = a1;
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_error_impl(&dword_1B1A86000, log, OS_LOG_TYPE_ERROR, "Opus ecoder gave us %d bytes bytes but we really only expected %d", (uint8_t *)v4, 0xEu);
}

void __54__EARAudioReader__opx_enumerateAudioBuffersWithBlock___block_invoke_2_cold_1(unsigned int *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1B1A86000, a2, OS_LOG_TYPE_ERROR, "Only expecting to get 1 Opus packet at a time, not %lu", (uint8_t *)&v3, 0xCu);
}

@end