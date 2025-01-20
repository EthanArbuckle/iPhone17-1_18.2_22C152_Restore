@interface SHAssetUtilities
+ (BOOL)buffersFromAudioFile:(id)a3 format:(id)a4 accumulator:(id)a5 error:(id *)a6;
+ (id)pcmBufferFromAudioFile:(id)a3 outputFormat:(id)a4 durationToRead:(double)a5 error:(id *)a6;
+ (id)pcmBufferFromAudioFile:(id)a3 outputFormat:(id)a4 error:(id *)a5;
+ (void)mixedTracksFromAsset:(id)a3 format:(id)a4 accumulator:(id)a5 completionHandler:(id)a6;
@end

@implementation SHAssetUtilities

+ (void)mixedTracksFromAsset:(id)a3 format:(id)a4 accumulator:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    id v21 = 0;
    v13 = (void *)[objc_alloc(MEMORY[0x263EFA4C0]) initWithAsset:v9 error:&v21];
    id v14 = v21;
    if (v13)
    {
      uint64_t v15 = *MEMORY[0x263EF9CE8];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __78__SHAssetUtilities_mixedTracksFromAsset_format_accumulator_completionHandler___block_invoke;
      v16[3] = &unk_2646EFA08;
      id v19 = v12;
      id v17 = v10;
      id v18 = v13;
      id v20 = v11;
      [v9 loadTracksWithMediaType:v15 completionHandler:v16];
    }
    else
    {
      (*((void (**)(id, id))v12 + 2))(v12, v14);
    }
  }
}

void __78__SHAssetUtilities_mixedTracksFromAsset_format_accumulator_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![v3 count])
  {
    uint64_t v17 = *(void *)(a1 + 48);
    id v18 = +[SHError errorWithCode:100 underlyingError:0];
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);

    goto LABEL_22;
  }
  id v4 = objc_alloc(MEMORY[0x263EFA4C8]);
  v5 = [*(id *)(a1 + 32) settings];
  v6 = (void *)[v4 initWithAudioTracks:v3 audioSettings:v5];

  if (([*(id *)(a1 + 40) canAddOutput:v6] & 1) == 0) {
    goto LABEL_20;
  }
  [*(id *)(a1 + 40) addOutput:v6];
  [*(id *)(a1 + 40) startReading];
  if ([*(id *)(a1 + 40) status] == 2)
  {
LABEL_15:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_21;
  }
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  while (1)
  {
    if ([*(id *)(a1 + 40) status] != 1) {
      goto LABEL_14;
    }
    v8 = (opaqueCMSampleBuffer *)[v6 copyNextSampleBuffer];
    if (!v8) {
      goto LABEL_14;
    }
    id v9 = v8;
    CMBlockBufferRef blockBufferOut = 0;
    memset(&bufferListOut, 0, sizeof(bufferListOut));
    OSStatus AudioBufferListWithRetainedBlockBuffer = CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(v8, 0, &bufferListOut, 0x18uLL, v7, v7, 1u, &blockBufferOut);
    CFRelease(v9);
    if (AudioBufferListWithRetainedBlockBuffer) {
      break;
    }
    id v11 = objc_alloc(MEMORY[0x263EF93B0]);
    id v12 = objc_msgSend(v11, "initWithPCMFormat:frameCapacity:", *(void *)(a1 + 32), bufferListOut.mBuffers[0].mDataByteSize/ *(_DWORD *)(objc_msgSend(*(id *)(a1 + 32), "streamDescription") + 24));
    objc_msgSend(v12, "setFrameLength:", objc_msgSend(v12, "frameCapacity"));
    if (bufferListOut.mNumberBuffers)
    {
      uint64_t v13 = 0;
      unint64_t v14 = 0;
      do
      {
        memcpy(*(void **)([v12 audioBufferList] + v13 * 16 + 16), bufferListOut.mBuffers[v13].mData, bufferListOut.mBuffers[v13].mDataByteSize);
        ++v14;
        ++v13;
      }
      while (v14 < bufferListOut.mNumberBuffers);
    }
    CFRelease(blockBufferOut);
    uint64_t v15 = *(void *)(a1 + 56);
    if (v15)
    {
      uint64_t v16 = (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v12);
      if (v16)
      {
        v22 = (void *)v16;
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

        goto LABEL_21;
      }
    }

LABEL_14:
    if ([*(id *)(a1 + 40) status] == 2) {
      goto LABEL_15;
    }
  }
  id v19 = sh_log_object();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_224B4B000, v19, OS_LOG_TYPE_ERROR, "Failed to get audio from URL passed to buffersFromAssetURL", v23, 2u);
  }

LABEL_20:
  uint64_t v20 = *(void *)(a1 + 48);
  id v21 = +[SHError errorWithCode:100 underlyingError:0];
  (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v21);

LABEL_21:
LABEL_22:
}

+ (BOOL)buffersFromAudioFile:(id)a3 format:(id)a4 accumulator:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (uint64_t (**)(id, void *))a5;
  id v11 = [v8 processingFormat];
  uint64_t v12 = 0x10000u / *(_DWORD *)([v11 streamDescription] + 24);

  id v13 = objc_alloc(MEMORY[0x263EF93B0]);
  unint64_t v14 = [v8 processingFormat];
  v31 = (void *)[v13 initWithPCMFormat:v14 frameCapacity:v12];

  [v9 sampleRate];
  double v16 = v15;
  uint64_t v17 = [v8 processingFormat];
  [v17 sampleRate];
  LODWORD(v12) = vcvtad_u64_f64(v16 / v18 * (double)v12);

  id v19 = (void *)[objc_alloc(MEMORY[0x263EF93B0]) initWithPCMFormat:v9 frameCapacity:v12];
  id v20 = objc_alloc(MEMORY[0x263EF9340]);
  id v21 = [v8 processingFormat];
  v30 = v9;
  v22 = (void *)[v20 initFromFormat:v21 toFormat:v9];

  uint64_t v23 = MEMORY[0x263EF8330];
  while (1)
  {
    v33[0] = v23;
    v33[1] = 3221225472;
    v33[2] = __66__SHAssetUtilities_buffersFromAudioFile_format_accumulator_error___block_invoke;
    v33[3] = &unk_2646EFA30;
    id v24 = v8;
    id v34 = v24;
    id v25 = v31;
    id v35 = v25;
    uint64_t v26 = [v22 convertToBuffer:v19 error:a6 withInputFromBlock:v33];
    if (v26 == 2)
    {
      LOBYTE(v27) = 1;
      goto LABEL_8;
    }
    BOOL v27 = v26;
    if (v26 == 3) {
      break;
    }
    id v28 = (id)v10[2](v10, v19);
    if (v27) {
      goto LABEL_8;
    }
    [v25 setFrameLength:0];
    [v19 setFrameLength:0];
  }
  LOBYTE(v27) = 0;
LABEL_8:

  return v27;
}

id __66__SHAssetUtilities_buffersFromAudioFile_format_accumulator_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  if ([*(id *)(a1 + 32) readIntoBuffer:*(void *)(a1 + 40) error:0])
  {
    *a3 = 0;
    id v5 = *(id *)(a1 + 40);
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) framePosition];
    if (v6 >= [*(id *)(a1 + 32) length])
    {
      id v5 = 0;
      uint64_t v7 = 2;
    }
    else
    {
      id v5 = 0;
      uint64_t v7 = 1;
    }
    *a3 = v7;
  }

  return v5;
}

+ (id)pcmBufferFromAudioFile:(id)a3 outputFormat:(id)a4 durationToRead:(double)a5 error:(id *)a6
{
  uint64_t v7 = [a1 pcmBufferFromAudioFile:a3 outputFormat:a4 error:a6];
  id v8 = v7;
  if (v7)
  {
    if (a5 <= 0.0)
    {
      double v9 = (double)[v7 frameLength];
      id v10 = [v8 format];
      [v10 sampleRate];
      a5 = v9 / v11;
    }
    uint64_t v12 = +[SHAudioUtilities splitBuffer:v8 fromStartPosition:0 intoDurationsOfSize:a5];
    id v13 = [v12 firstObject];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)pcmBufferFromAudioFile:(id)a3 outputFormat:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = (double)[v8 length];
  [v9 sampleRate];
  double v12 = v11;
  id v13 = [v8 processingFormat];
  [v13 sampleRate];
  LODWORD(v5) = vcvtad_u64_f64(v12 / v14 * v10);

  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  id v23 = (id)[objc_alloc(MEMORY[0x263EF93B0]) initWithPCMFormat:v9 frameCapacity:v5];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __62__SHAssetUtilities_pcmBufferFromAudioFile_outputFormat_error___block_invoke;
  v17[3] = &unk_2646EFA58;
  v17[4] = &v18;
  if (+[SHAssetUtilities buffersFromAudioFile:v8 format:v9 accumulator:v17 error:a5])
  {
    id v15 = (id)v19[5];
  }
  else
  {
    id v15 = 0;
  }
  _Block_object_dispose(&v18, 8);

  return v15;
}

uint64_t __62__SHAssetUtilities_pcmBufferFromAudioFile_outputFormat_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = +[SHAudioUtilities appendBuffer:a2 toBuffer:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

@end