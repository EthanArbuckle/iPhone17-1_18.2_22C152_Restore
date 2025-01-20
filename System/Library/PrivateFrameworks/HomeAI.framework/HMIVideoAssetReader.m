@interface HMIVideoAssetReader
- (BOOL)_createOutputsForAsset:(id)a3 readVideo:(BOOL)a4 readAudio:(BOOL)a5;
- (BOOL)checkAndSaveCrashReportWithData:(id)a3;
- (HMIVideoAssetReader)initWithAsset:(id)a3;
- (HMIVideoAssetReader)initWithAsset:(id)a3 readVideoTrack:(BOOL)a4 readAudioTrack:(BOOL)a5;
- (opaqueCMSampleBuffer)_copyNextSampleBufferFromTrackOutput:(id)a3;
- (opaqueCMSampleBuffer)copyNextSampleBuffer;
- (opaqueCMSampleBuffer)copyNextSampleBufferWithTrackIndexOutput:(unint64_t *)a3;
- (void)dealloc;
@end

@implementation HMIVideoAssetReader

- (HMIVideoAssetReader)initWithAsset:(id)a3
{
  return [(HMIVideoAssetReader *)self initWithAsset:a3 readVideoTrack:1 readAudioTrack:1];
}

- (HMIVideoAssetReader)initWithAsset:(id)a3 readVideoTrack:(BOOL)a4 readAudioTrack:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HMIVideoAssetReader;
  v10 = [(HMIVideoAssetReader *)&v21 init];
  if (v10)
  {
    v10->_trackSamples = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
    uint64_t v11 = [MEMORY[0x263EFF980] array];
    trackOutputs = v10->_trackOutputs;
    v10->_trackOutputs = (NSMutableArray *)v11;

    objc_storeStrong((id *)&v10->_asset, a3);
    id v20 = 0;
    uint64_t v13 = [MEMORY[0x263EFA4C0] assetReaderWithAsset:v9 error:&v20];
    v14 = (NSError *)v20;
    assetReader = v10->_assetReader;
    v10->_assetReader = (AVAssetReader *)v13;

    if (v10->_assetReader)
    {
      if ([(HMIVideoAssetReader *)v10 _createOutputsForAsset:v9 readVideo:v6 readAudio:v5])
      {
        uint64_t v16 = 1;
LABEL_7:
        v10->super._status = v16;

        goto LABEL_8;
      }
    }
    else
    {
      error = v10->super._error;
      v10->super._error = v14;
      v18 = v14;
    }
    uint64_t v16 = 4;
    goto LABEL_7;
  }
LABEL_8:

  return v10;
}

- (BOOL)_createOutputsForAsset:(id)a3 readVideo:(BOOL)a4 readAudio:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v25 = *MEMORY[0x263EF8340];
  v8 = objc_msgSend(MEMORY[0x263EFF980], "array", a3);
  if (v6)
  {
    id v9 = [(AVAsset *)self->_asset tracksWithMediaType:*MEMORY[0x263EF9D48]];
    [v8 addObjectsFromArray:v9];
  }
  if (v5)
  {
    v10 = [(AVAsset *)self->_asset tracksWithMediaType:*MEMORY[0x263EF9CE8]];
    [v8 addObjectsFromArray:v10];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    v15 = (const void *)*MEMORY[0x263EFFD08];
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        v17 = objc_msgSend(MEMORY[0x263EFA4D8], "assetReaderTrackOutputWithTrack:outputSettings:", *(void *)(*((void *)&v20 + 1) + 8 * i), 0, (void)v20);
        [v17 setAlwaysCopiesSampleData:0];
        if (![(AVAssetReader *)self->_assetReader canAddOutput:v17])
        {

          BOOL v18 = 0;
          goto LABEL_15;
        }
        [(AVAssetReader *)self->_assetReader addOutput:v17];
        [(NSMutableArray *)self->_trackOutputs addObject:v17];
        CFArrayAppendValue(self->_trackSamples, v15);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  BOOL v18 = 1;
LABEL_15:

  return v18;
}

- (void)dealloc
{
  [(AVAssetReader *)self->_assetReader cancelReading];
  CFRelease(self->_trackSamples);
  v3.receiver = self;
  v3.super_class = (Class)HMIVideoAssetReader;
  [(HMIVideoAssetReader *)&v3 dealloc];
}

- (opaqueCMSampleBuffer)_copyNextSampleBufferFromTrackOutput:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 copyNextSampleBuffer];
  if (v5)
  {
    BOOL v6 = (void *)v5;
    while (!CMSampleBufferGetNumSamples((CMSampleBufferRef)v6))
    {
      CFRelease(v6);
      BOOL v6 = (void *)[v4 copyNextSampleBuffer];
      if (!v6) {
        goto LABEL_5;
      }
    }
    memset(&v15, 0, sizeof(v15));
    CMSampleBufferGetDecodeTimeStamp(&v15, (CMSampleBufferRef)v6);
  }
  else
  {
LABEL_5:
    if ([(AVAssetReader *)self->_assetReader status] == AVAssetReaderStatusFailed)
    {
      v7 = (void *)MEMORY[0x22A641C70]();
      v8 = self;
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = HMFGetLogIdentifier();
        id v11 = [(AVAssetReader *)self->_assetReader error];
        LODWORD(v15.value) = 138543618;
        *(CMTimeValue *)((char *)&v15.value + 4) = (CMTimeValue)v10;
        LOWORD(v15.flags) = 2112;
        *(void *)((char *)&v15.flags + 2) = v11;
        _os_log_impl(&dword_225DC6000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to read sample buffer, error: %@", (uint8_t *)&v15, 0x16u);
      }
      uint64_t v12 = [(AVAssetReader *)self->_assetReader error];
      error = v8->super._error;
      v8->super._error = (NSError *)v12;

      BOOL v6 = 0;
      v8->super._status = 4;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return (opaqueCMSampleBuffer *)v6;
}

- (opaqueCMSampleBuffer)copyNextSampleBuffer
{
  return [(HMIVideoAssetReader *)self copyNextSampleBufferWithTrackIndexOutput:0];
}

- (opaqueCMSampleBuffer)copyNextSampleBufferWithTrackIndexOutput:(unint64_t *)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  int64_t status = self->super._status;
  if (status != 1)
  {
    if (status == 4)
    {
      BOOL v6 = (void *)MEMORY[0x22A641C70]();
      v7 = self;
      v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = HMFGetLogIdentifier();
        LODWORD(buf.value) = 138543362;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v9;
        _os_log_impl(&dword_225DC6000, v8, OS_LOG_TYPE_ERROR, "%{public}@Asset reader failed, ignoring", (uint8_t *)&buf, 0xCu);
      }
      return 0;
    }
LABEL_14:
    CMTime buf = *(CMTime *)*(void *)&MEMORY[0x263F010B8];
    if ([(NSMutableArray *)self->_trackOutputs count])
    {
      unint64_t v15 = 0;
      uint64_t v16 = (opaqueCMSampleBuffer *)*MEMORY[0x263EFFD08];
      unsigned int v17 = -1;
      do
      {
        ValueAtIndex = (opaqueCMSampleBuffer *)CFArrayGetValueAtIndex(self->_trackSamples, v15);
        if (ValueAtIndex) {
          BOOL v19 = ValueAtIndex == v16;
        }
        else {
          BOOL v19 = 1;
        }
        if (!v19)
        {
          memset(&v30, 0, sizeof(v30));
          CMSampleBufferGetDecodeTimeStamp(&v30, ValueAtIndex);
          CMTime time1 = v30;
          CMTime v28 = buf;
          if (CMTimeCompare(&time1, &v28) < 0)
          {
            CMTime buf = v30;
            unsigned int v17 = v15;
          }
        }
        ++v15;
      }
      while ([(NSMutableArray *)self->_trackOutputs count] > v15);
      if ((v17 & 0x80000000) == 0)
      {
        long long v20 = CFArrayGetValueAtIndex(self->_trackSamples, v17);
        long long v21 = (opaqueCMSampleBuffer *)CFRetain(v20);
        long long v22 = [(NSMutableArray *)self->_trackOutputs objectAtIndexedSubscript:v17];
        long long v23 = [(HMIVideoAssetReader *)self _copyNextSampleBufferFromTrackOutput:v22];

        trackSamples = self->_trackSamples;
        if (v23)
        {
          CFArraySetValueAtIndex(trackSamples, v17, v23);
          CFRelease(v23);
          if (!a3) {
            return v21;
          }
        }
        else
        {
          CFArraySetValueAtIndex(trackSamples, v17, v16);
          if (!a3) {
            return v21;
          }
        }
        *a3 = v17;
        return v21;
      }
    }
    return 0;
  }
  if (![(AVAssetReader *)self->_assetReader startReading])
  {
    v26 = [(AVAssetReader *)self->_assetReader error];
    error = self->super._error;
    self->super._error = v26;

    long long v21 = 0;
    self->super._int64_t status = 4;
    return v21;
  }
  self->super._int64_t status = 2;
  if ([(NSMutableArray *)self->_trackOutputs count])
  {
    unint64_t v10 = 0;
    id v11 = (const void *)*MEMORY[0x263EFFD08];
    do
    {
      uint64_t v12 = [(NSMutableArray *)self->_trackOutputs objectAtIndexedSubscript:v10];
      uint64_t v13 = [(HMIVideoAssetReader *)self _copyNextSampleBufferFromTrackOutput:v12];

      uint64_t v14 = self->_trackSamples;
      if (v13)
      {
        CFArraySetValueAtIndex(v14, v10, v13);
        CFRelease(v13);
      }
      else
      {
        CFArraySetValueAtIndex(v14, v10, v11);
      }
      ++v10;
    }
    while ([(NSMutableArray *)self->_trackOutputs count] > v10);
  }
  if (self->super._status != 4) {
    goto LABEL_14;
  }
  return 0;
}

- (BOOL)checkAndSaveCrashReportWithData:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3810000000;
  v36 = &unk_225F58031;
  long long v37 = *MEMORY[0x263F010B8];
  uint64_t v38 = *(void *)(MEMORY[0x263F010B8] + 16);
  uint64_t v27 = 0;
  CMTime v28 = &v27;
  uint64_t v29 = 0x3810000000;
  long long v31 = *MEMORY[0x263F010E0];
  uint64_t v6 = *(void *)(MEMORY[0x263F010E0] + 16);
  CMTime v30 = &unk_225F58031;
  uint64_t v32 = v6;
  v7 = [(AVAsset *)self->_asset tracks];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __55__HMIVideoAssetReader_checkAndSaveCrashReportWithData___block_invoke;
  v23[3] = &unk_26477BC28;
  v23[4] = self;
  uint64_t v25 = &v33;
  v26 = &v27;
  id v8 = v5;
  id v24 = v8;
  objc_msgSend(v7, "na_each:", v23);

  CMTime lhs = *(CMTime *)(v28 + 4);
  CMTime rhs = *(CMTime *)(v34 + 4);
  CMTimeSubtract(&time, &lhs, &rhs);
  if (CMTimeGetSeconds(&time) > 1.0) {
    [v8 addObject:&unk_26D9A9B70];
  }
  if ([v8 count])
  {
    id v9 = (void *)MEMORY[0x22A641C70]();
    unint64_t v10 = self;
    HMFGetOSLogHandle();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      LODWORD(lhs.value) = 138543618;
      *(CMTimeValue *)((char *)&lhs.value + 4) = (CMTimeValue)v12;
      LOWORD(lhs.flags) = 2112;
      *(void *)((char *)&lhs.flags + 2) = v8;
      _os_log_impl(&dword_225DC6000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Warnings: %@", (uint8_t *)&lhs, 0x16u);
    }
    uint64_t v13 = [MEMORY[0x263F089D8] string];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __55__HMIVideoAssetReader_checkAndSaveCrashReportWithData___block_invoke_26;
    v19[3] = &unk_26477BC50;
    id v14 = v13;
    id v20 = v14;
    objc_msgSend(v8, "na_each:", v19);
    if (+[HMIPreference isInternalInstall])
    {
      [v14 appendString:@"Sanitized Data\n"];
      unint64_t v15 = [v4 base64EncodedDataWithOptions:1];
      uint64_t v16 = (void *)[[NSString alloc] initWithData:v15 encoding:4];
      [v14 appendString:v16];

      [v14 appendString:@"\n\n"];
    }
    HMISimulateCrash(@"Asset Check", v14, 1);
  }
  BOOL v17 = [v8 count] != 0;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v17;
}

void __55__HMIVideoAssetReader_checkAndSaveCrashReportWithData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x22A641C70]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = HMFGetLogIdentifier();
    if (v3) {
      [v3 timeRange];
    }
    else {
      memset(v24, 0, sizeof(v24));
    }
    id v8 = HMICMTimeRangeDescription(v24);
    LODWORD(buf.value) = 138543874;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v7;
    LOWORD(buf.flags) = 2112;
    *(void *)((char *)&buf.flags + 2) = v3;
    HIWORD(buf.epoch) = 2112;
    CMTime v28 = v8;
    _os_log_impl(&dword_225DC6000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Track %@, %@", (uint8_t *)&buf, 0x20u);
  }
  if (v3)
  {
    [v3 timeRange];
  }
  else
  {
    memset(v21, 0, sizeof(v21));
    long long v20 = 0u;
  }
  CMTime time1 = *(CMTime *)((char *)v21 + 8);
  CMTime buf = *(CMTime *)(*(void *)(*(void *)(a1 + 48) + 8) + 32);
  CMTimeMinimum(&v23, &time1, &buf);
  *(CMTime *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = v23;
  if (v3)
  {
    [v3 timeRange];
  }
  else
  {
    memset(v17, 0, sizeof(v17));
    long long v16 = 0u;
  }
  CMTime v18 = *(CMTime *)((char *)v17 + 8);
  CMTime buf = *(CMTime *)(*(void *)(*(void *)(a1 + 56) + 8) + 32);
  CMTimeMaximum(&v19, &v18, &buf);
  *(CMTime *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = v19;
  if (v3) {
    [v3 timeRange];
  }
  else {
    memset(&v14[3], 0, 48);
  }
  CMTime time = *(CMTime *)((char *)&v14[4] + 8);
  if (CMTimeGetSeconds(&time) > 3600.0)
  {
    id v9 = *(void **)(a1 + 40);
    v25[0] = @"name";
    v25[1] = @"discussion";
    v26[0] = @"VeryLongTrackDuration";
    unint64_t v10 = NSString;
    if (v3) {
      [v3 timeRange];
    }
    else {
      memset(v14, 0, 48);
    }
    id v11 = HMICMTimeRangeDescription(v14);
    uint64_t v12 = [v10 stringWithFormat:@"Track %@ has an unexpectedly long track duration %@.", v3, v11];
    v26[1] = v12;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
    [v9 addObject:v13];
  }
}

uint64_t __55__HMIVideoAssetReader_checkAndSaveCrashReportWithData___block_invoke_26(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 objectForKeyedSubscript:@"name"];
  [v3 appendFormat:@"%@\n", v5];

  uint64_t v6 = *(void **)(a1 + 32);
  v7 = [v4 objectForKeyedSubscript:@"discussion"];

  [v6 appendFormat:@"%@\n", v7];
  id v8 = *(void **)(a1 + 32);
  return [v8 appendString:@"\n"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackOutputs, 0);
  objc_storeStrong((id *)&self->_assetReader, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end