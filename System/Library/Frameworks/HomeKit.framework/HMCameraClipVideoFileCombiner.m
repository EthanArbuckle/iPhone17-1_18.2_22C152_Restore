@interface HMCameraClipVideoFileCombiner
+ (id)logCategory;
- (HMCameraClipVideoFileCombiner)initWithVideoFileURLs:(id)a3 queue:(id)a4;
- (NSArray)videoFileURLs;
- (OS_dispatch_queue)queue;
- (void)combineToOutputFileURL:(id)a3 completion:(id)a4;
- (void)writeSamplesFromOutputs:(id)a3 toInput:(id)a4 completion:(id)a5;
@end

@implementation HMCameraClipVideoFileCombiner

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_videoFileURLs, 0);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)videoFileURLs
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)writeSamplesFromOutputs:(id)a3 toInput:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  int v22 = 0;
  v11 = [(HMCameraClipVideoFileCombiner *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__HMCameraClipVideoFileCombiner_writeSamplesFromOutputs_toInput_completion___block_invoke;
  v15[3] = &unk_1E593E7F8;
  id v12 = v9;
  id v16 = v12;
  v20 = v21;
  id v13 = v8;
  id v17 = v13;
  id v14 = v10;
  v18 = self;
  id v19 = v14;
  [v12 requestMediaDataWhenReadyOnQueue:v11 usingBlock:v15];

  _Block_object_dispose(v21, 8);
}

void __76__HMCameraClipVideoFileCombiner_writeSamplesFromOutputs_toInput_completion___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(a1 + 32) isReadyForMoreMediaData]) {
    return;
  }
  uint64_t v3 = *MEMORY[0x1E4F15BA8];
  *(void *)&long long v2 = 138543618;
  long long v23 = v2;
  while (1)
  {
    unint64_t v4 = *(int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    if (objc_msgSend(*(id *)(a1 + 40), "count", v23) <= v4)
    {
      [*(id *)(a1 + 32) markAsFinished];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      return;
    }
    v5 = [*(id *)(a1 + 40) objectAtIndexedSubscript:*(int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
    uint64_t v6 = [v5 copyNextSampleBuffer];
    if (!v6)
    {
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      goto LABEL_13;
    }
    v7 = (opaqueCMSampleBuffer *)v6;
    id v8 = [v5 track];
    id v9 = [v8 mediaType];
    if ([v9 isEqualToString:v3])
    {
      CMItemCount NumSamples = CMSampleBufferGetNumSamples(v7);

      if (!NumSamples)
      {
        v11 = (void *)MEMORY[0x19F3A64A0]();
        id v12 = *(id *)(a1 + 48);
        id v13 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          id v14 = HMFGetLogIdentifier();
          *(_DWORD *)buf = v23;
          v25 = v14;
          __int16 v26 = 2048;
          v27 = v7;
          _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Skipping audio sample buffer with no samples: %p", buf, 0x16u);
        }
        CFRelease(v7);
        goto LABEL_13;
      }
    }
    else
    {
    }
    char v15 = [*(id *)(a1 + 32) appendSampleBuffer:v7];
    CFRelease(v7);
    if ((v15 & 1) == 0) {
      break;
    }
LABEL_13:

    if (([*(id *)(a1 + 32) isReadyForMoreMediaData] & 1) == 0) {
      return;
    }
  }
  id v16 = (void *)MEMORY[0x19F3A64A0]();
  id v17 = *(id *)(a1 + 48);
  v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    id v19 = HMFGetLogIdentifier();
    v20 = *(opaqueCMSampleBuffer **)(a1 + 32);
    *(_DWORD *)buf = v23;
    v25 = v19;
    __int16 v26 = 2112;
    v27 = v20;
    _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to append sample buffer to input %@", buf, 0x16u);
  }
  [*(id *)(a1 + 32) markAsFinished];
  uint64_t v21 = *(void *)(a1 + 56);
  int v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);
}

- (void)combineToOutputFileURL:(id)a3 completion:(id)a4
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Combining video files and outputting to file URL: %@", buf, 0x16u);
  }
  id v12 = [(HMCameraClipVideoFileCombiner *)v9 videoFileURLs];
  uint64_t v13 = [v12 count];

  if (!v13)
  {
    v24 = (void *)MEMORY[0x19F3A64A0]();
    v25 = v9;
    __int16 v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v27;
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_INFO, "%{public}@Asked to combine empty list of video file URLs", buf, 0xCu);
    }
    v7[2](v7, 0);
    goto LABEL_83;
  }
  unsigned __int8 v136 = 0;
  id v14 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v15 = [v6 path];
  int v16 = [v14 fileExistsAtPath:v15 isDirectory:&v136];

  if (v16)
  {
    int v17 = v136;
    v18 = (void *)MEMORY[0x19F3A64A0]();
    id v19 = v9;
    v20 = HMFGetOSLogHandle();
    uint64_t v21 = v20;
    if (v17)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v22;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Cannot combine to output file URL because it is a directory: %@", buf, 0x16u);
      }
      id v23 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      ((void (**)(id, id))v7)[2](v7, v23);
      goto LABEL_82;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v28;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_INFO, "%{public}@Removing existing file at output file URL: %@", buf, 0x16u);
    }
    v29 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v135 = 0;
    char v30 = [v29 removeItemAtURL:v6 error:&v135];
    id v23 = v135;

    if ((v30 & 1) == 0)
    {
      v79 = (void *)MEMORY[0x19F3A64A0]();
      v80 = v19;
      v81 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        v82 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v82;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2112;
        id v139 = v23;
        _os_log_impl(&dword_19D1A8000, v81, OS_LOG_TYPE_ERROR, "%{public}@Cannot remove existing file at output file URL %@: %@", buf, 0x20u);
      }
      v83 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      ((void (**)(id, void *))v7)[2](v7, v83);

      goto LABEL_82;
    }
  }
  v31 = [(HMCameraClipVideoFileCombiner *)v9 videoFileURLs];
  v32 = objc_msgSend(v31, "na_map:", &__block_literal_global_4209);

  v111 = [MEMORY[0x1E4F1CA48] array];
  v108 = [MEMORY[0x1E4F1CA48] array];
  v107 = [MEMORY[0x1E4F1CA48] array];
  long long v131 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  id v23 = v32;
  v106 = v7;
  uint64_t v116 = [v23 countByEnumeratingWithState:&v131 objects:v137 count:16];
  v117 = v9;
  v33 = 0;
  v34 = 0;
  if (!v116) {
    goto LABEL_45;
  }
  uint64_t v115 = *(void *)v132;
  uint64_t v113 = *MEMORY[0x1E4F15C18];
  uint64_t v112 = *MEMORY[0x1E4F15BA8];
  id v105 = v6;
  v114 = v23;
  while (2)
  {
    v109 = v34;
    v110 = v33;
    for (uint64_t i = 0; i != v116; ++i)
    {
      if (*(void *)v132 != v115) {
        objc_enumerationMutation(v23);
      }
      v36 = *(void **)(*((void *)&v131 + 1) + 8 * i);
      id v37 = objc_alloc(MEMORY[0x1E4F16378]);
      id v130 = 0;
      v38 = (void *)[v37 initWithAsset:v36 error:&v130];
      id v39 = v130;
      if (!v38)
      {
        v75 = (void *)MEMORY[0x19F3A64A0]();
        v76 = v9;
        v77 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          v78 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v78;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v36;
          *(_WORD *)&buf[22] = 2112;
          id v139 = v39;
          _os_log_impl(&dword_19D1A8000, v77, OS_LOG_TYPE_ERROR, "%{public}@Failed to create asset reader with asset %@: %@", buf, 0x20u);
        }
        ((void (**)(id, id))v7)[2](v7, v39);
        id v66 = v23;
        id v6 = v105;
        goto LABEL_80;
      }
      v40 = [v36 tracksWithMediaType:v113];
      v41 = [v40 firstObject];

      if (!v41)
      {
        v43 = (void *)MEMORY[0x19F3A64A0]();
        v44 = v9;
        v45 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          v46 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v46;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v36;
          _os_log_impl(&dword_19D1A8000, v45, OS_LOG_TYPE_INFO, "%{public}@Skipping video for asset because no video track was found: %@", buf, 0x16u);
        }
        id v9 = v117;
LABEL_28:
        v47 = objc_msgSend(v36, "tracksWithMediaType:", v112, v105);
        v42 = [v47 firstObject];

        if (v42)
        {
          v48 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v42 outputSettings:0];
          if (![v38 canAddOutput:v48])
          {
            v60 = (void *)MEMORY[0x19F3A64A0]();
            v61 = v9;
            v62 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            {
              v63 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              *(void *)&uint8_t buf[4] = v63;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v48;
              *(_WORD *)&buf[22] = 2112;
              id v139 = v38;
              _os_log_impl(&dword_19D1A8000, v62, OS_LOG_TYPE_ERROR, "%{public}@Cannot add audio output %@ to reader %@", buf, 0x20u);

              v7 = v106;
            }

            v59 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
            ((void (**)(id, void *))v7)[2](v7, v59);
            int v53 = 1;
            id v9 = v117;
            goto LABEL_41;
          }
          [v38 addOutput:v48];
          [v107 addObject:v48];
        }
        else
        {
          v54 = (void *)MEMORY[0x19F3A64A0]();
          v55 = v9;
          v56 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            v57 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v57;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v36;
            _os_log_impl(&dword_19D1A8000, v56, OS_LOG_TYPE_INFO, "%{public}@Skipping audio for asset because no audio track was found: %@", buf, 0x16u);

            v7 = v106;
          }

          id v9 = v117;
        }
        [v38 startReading];
        [v111 addObject:v38];
        v58 = [v41 formatDescriptions];
        v109 = [v58 firstObject];

        v48 = [v42 formatDescriptions];
        v59 = [v48 firstObject];
        int v53 = 0;
        v110 = v59;
LABEL_41:

        goto LABEL_42;
      }
      v42 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v41 outputSettings:0];
      if ([v38 canAddOutput:v42])
      {
        [v38 addOutput:v42];
        [v108 addObject:v42];

        goto LABEL_28;
      }
      v49 = (void *)MEMORY[0x19F3A64A0]();
      v50 = v9;
      v51 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        v52 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v52;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v42;
        *(_WORD *)&buf[22] = 2112;
        id v139 = v38;
        _os_log_impl(&dword_19D1A8000, v51, OS_LOG_TYPE_ERROR, "%{public}@Cannot add video output %@ to reader %@", buf, 0x20u);
      }
      v48 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      ((void (**)(id, void *))v7)[2](v7, v48);
      int v53 = 1;
      id v9 = v117;
LABEL_42:

      if (v53)
      {
        id v23 = v114;
        id v66 = v114;
        id v6 = v105;
        goto LABEL_81;
      }
      id v23 = v114;
    }
    id v6 = v105;
    v34 = v109;
    v33 = v110;
    uint64_t v116 = [v114 countByEnumeratingWithState:&v131 objects:v137 count:16];
    if (v116) {
      continue;
    }
    break;
  }
LABEL_45:

  id v64 = objc_alloc(MEMORY[0x1E4F163B8]);
  uint64_t v65 = *MEMORY[0x1E4F15AA8];
  id v129 = 0;
  id v39 = (id)[v64 initWithURL:v6 fileType:v65 error:&v129];
  id v66 = v129;
  if (v39)
  {
    if (!v34)
    {
      v88 = (void *)MEMORY[0x19F3A64A0]();
      v89 = v117;
      v90 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v92 = v91 = v33;
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v92;
        _os_log_impl(&dword_19D1A8000, v90, OS_LOG_TYPE_INFO, "%{public}@Skipping video input because no assets contained a video track", buf, 0xCu);

        v33 = v91;
      }

      v68 = 0;
      if (v33) {
        goto LABEL_65;
      }
LABEL_49:
      v70 = (void *)MEMORY[0x19F3A64A0](v69);
      v71 = v117;
      v72 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        v73 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v73;
        _os_log_impl(&dword_19D1A8000, v72, OS_LOG_TYPE_INFO, "%{public}@Skipping audio input because no assets contained an audio track", buf, 0xCu);
      }
      v74 = 0;
LABEL_67:
      objc_msgSend(v39, "startWriting", v105);
      *(_OWORD *)buf = *MEMORY[0x1E4F1FA48];
      *(void *)&buf[16] = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      [v39 startSessionAtSourceTime:buf];
      v94 = dispatch_group_create();
      v95 = v94;
      if (v68)
      {
        dispatch_group_enter(v94);
        v126[0] = MEMORY[0x1E4F143A8];
        v126[1] = 3221225472;
        v126[2] = __67__HMCameraClipVideoFileCombiner_combineToOutputFileURL_completion___block_invoke_8;
        v126[3] = &unk_1E593E7D0;
        id v127 = v111;
        v128 = v95;
        [(HMCameraClipVideoFileCombiner *)v117 writeSamplesFromOutputs:v108 toInput:v68 completion:v126];
      }
      if (v74)
      {
        dispatch_group_enter(v95);
        v123[0] = MEMORY[0x1E4F143A8];
        v123[1] = 3221225472;
        v123[2] = __67__HMCameraClipVideoFileCombiner_combineToOutputFileURL_completion___block_invoke_2;
        v123[3] = &unk_1E593E7D0;
        id v124 = v111;
        v125 = v95;
        [(HMCameraClipVideoFileCombiner *)v117 writeSamplesFromOutputs:v107 toInput:v74 completion:v123];
      }
      v96 = [(HMCameraClipVideoFileCombiner *)v117 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__HMCameraClipVideoFileCombiner_combineToOutputFileURL_completion___block_invoke_3;
      block[3] = &unk_1E5944360;
      id v119 = v39;
      v120 = v117;
      id v121 = v6;
      v122 = v7;
      dispatch_group_notify(v95, v96, block);

      goto LABEL_78;
    }
    id v67 = objc_alloc(MEMORY[0x1E4F163C0]);
    v68 = (void *)[v67 initWithMediaType:*MEMORY[0x1E4F15C18] outputSettings:0 sourceFormatHint:v34];
    if ([v39 canAddInput:v68])
    {
      uint64_t v69 = [v39 addInput:v68];
      if (!v33) {
        goto LABEL_49;
      }
LABEL_65:
      id v93 = objc_alloc(MEMORY[0x1E4F163C0]);
      v74 = (void *)[v93 initWithMediaType:*MEMORY[0x1E4F15BA8] outputSettings:0 sourceFormatHint:v33];
      if ([v39 canAddInput:v74])
      {
        [v39 addInput:v74];
        goto LABEL_67;
      }
      v101 = (void *)MEMORY[0x19F3A64A0]();
      v102 = v117;
      v103 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
      {
        v104 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v104;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v74;
        *(_WORD *)&buf[22] = 2112;
        id v139 = v39;
        _os_log_impl(&dword_19D1A8000, v103, OS_LOG_TYPE_ERROR, "%{public}@Cannot add audio input %@ to writer %@", buf, 0x20u);

        v7 = v106;
      }

      v95 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      ((void (**)(id, NSObject *))v7)[2](v7, v95);
LABEL_78:
    }
    else
    {
      v97 = (void *)MEMORY[0x19F3A64A0]();
      v98 = v117;
      v99 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
      {
        v100 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v100;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v68;
        *(_WORD *)&buf[22] = 2112;
        id v139 = v39;
        _os_log_impl(&dword_19D1A8000, v99, OS_LOG_TYPE_ERROR, "%{public}@Cannot add video input %@ to writer %@", buf, 0x20u);
      }
      v74 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      ((void (**)(id, void *))v7)[2](v7, v74);
    }
  }
  else
  {
    v84 = (void *)MEMORY[0x19F3A64A0]();
    v85 = v117;
    v86 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
    {
      v87 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v87;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2112;
      id v139 = v66;
      _os_log_impl(&dword_19D1A8000, v86, OS_LOG_TYPE_ERROR, "%{public}@Failed to create asset writer with URL %@: %@", buf, 0x20u);
    }
    ((void (**)(id, id))v7)[2](v7, v66);
    id v39 = 0;
  }
LABEL_80:

LABEL_81:
LABEL_82:

LABEL_83:
}

void __67__HMCameraClipVideoFileCombiner_combineToOutputFileURL_completion___block_invoke_8(uint64_t a1)
{
}

void __67__HMCameraClipVideoFileCombiner_combineToOutputFileURL_completion___block_invoke_2(uint64_t a1)
{
}

void __67__HMCameraClipVideoFileCombiner_combineToOutputFileURL_completion___block_invoke_3(uint64_t a1)
{
  long long v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__HMCameraClipVideoFileCombiner_combineToOutputFileURL_completion___block_invoke_4;
  v6[3] = &unk_1E5944360;
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  id v7 = v3;
  uint64_t v8 = v4;
  id v9 = v5;
  id v10 = *(id *)(a1 + 56);
  [v3 finishWritingWithCompletionHandler:v6];
}

void __67__HMCameraClipVideoFileCombiner_combineToOutputFileURL_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) status];
  id v3 = (void *)MEMORY[0x19F3A64A0]();
  id v4 = *(id *)(a1 + 40);
  v5 = HMFGetOSLogHandle();
  id v6 = v5;
  if (v2 == 2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 48);
      int v14 = 138543618;
      char v15 = v7;
      __int16 v16 = 2112;
      uint64_t v17 = v8;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully combined fragments to %@", (uint8_t *)&v14, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      uint64_t v10 = *(void *)(a1 + 48);
      v11 = [*(id *)(a1 + 32) error];
      int v14 = 138543874;
      char v15 = v9;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      id v19 = v11;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to combine fragments to %@: %@", (uint8_t *)&v14, 0x20u);
    }
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v13 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
  }
}

id __67__HMCameraClipVideoFileCombiner_combineToOutputFileURL_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F166C8];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithURL:v3 options:0];

  return v4;
}

- (HMCameraClipVideoFileCombiner)initWithVideoFileURLs:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMCameraClipVideoFileCombiner;
  id v9 = [(HMCameraClipVideoFileCombiner *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_videoFileURLs, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
  }

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19 != -1) {
    dispatch_once(&logCategory__hmf_once_t19, &__block_literal_global_12);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v20;

  return v2;
}

uint64_t __44__HMCameraClipVideoFileCombiner_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v20;
  logCategory__hmf_once_uint64_t v20 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end