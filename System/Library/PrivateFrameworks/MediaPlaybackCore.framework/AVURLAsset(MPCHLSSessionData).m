@interface AVURLAsset(MPCHLSSessionData)
- (id)mpc_HLSAVMetadataItemInMetadata:()MPCHLSSessionData;
- (id)mpc_synchronousHLSSessionDataWithTimeout:()MPCHLSSessionData error:;
@end

@implementation AVURLAsset(MPCHLSSessionData)

- (id)mpc_HLSAVMetadataItemInMetadata:()MPCHLSSessionData
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "key", (void)v13);
        int v10 = [v9 isEqualToString:@"com.apple.hls.audioAssetMetadata"];

        if (v10)
        {
          id v11 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

- (id)mpc_synchronousHLSSessionDataWithTimeout:()MPCHLSSessionData error:
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  if ([a1 statusOfValueForKey:@"metadata" error:0] == 2)
  {
    v7 = [a1 metadataForFormat:*MEMORY[0x263EF9DD8]];
    v8 = objc_msgSend(a1, "mpc_HLSAVMetadataItemInMetadata:", v7);

    goto LABEL_10;
  }
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__12029;
  v31 = __Block_byref_object_dispose__12030;
  id v32 = 0;
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __80__AVURLAsset_MPCHLSSessionData__mpc_synchronousHLSSessionDataWithTimeout_error___block_invoke;
  v22 = &unk_2643C5508;
  v25 = &v33;
  v26 = &v27;
  v23 = a1;
  int v10 = v9;
  v24 = v10;
  [a1 loadValuesAsynchronouslyForKeys:&unk_26CC19550 completionHandler:&v19];
  dispatch_time_t v11 = dispatch_time(0, 1000000000 * a3);
  if (dispatch_semaphore_wait(v10, v11))
  {
    v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_7:
      v8 = 0;
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138543362;
    v38 = a1;
    long long v13 = "[AL] Time-out while retrieving HLS session metadata - Asset:%{public}@";
    long long v14 = v12;
    uint32_t v15 = 12;
LABEL_6:
    _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
    goto LABEL_7;
  }
  uint64_t v17 = v34[3];
  if (v17 == 3)
  {
    if (a4) {
      *a4 = (id) v28[5];
    }
    v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v18 = v28[5];
    *(_DWORD *)buf = 138543618;
    v38 = a1;
    __int16 v39 = 2114;
    uint64_t v40 = v18;
    long long v13 = "[AL] Error retrieving HLS session metadata - Asset:%{public}@ - Error:%{public}@";
    long long v14 = v12;
    uint32_t v15 = 22;
    goto LABEL_6;
  }
  if (v17 != 2)
  {
    v8 = 0;
    goto LABEL_9;
  }
  v12 = objc_msgSend(a1, "metadataForFormat:", *MEMORY[0x263EF9DD8], v19, v20, v21, v22, v23);
  v8 = objc_msgSend(a1, "mpc_HLSAVMetadataItemInMetadata:", v12);
LABEL_8:

LABEL_9:
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
LABEL_10:

  return v8;
}

@end