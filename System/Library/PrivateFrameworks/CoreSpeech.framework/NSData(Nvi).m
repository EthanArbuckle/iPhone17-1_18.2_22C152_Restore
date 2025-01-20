@interface NSData(Nvi)
- (id)strRepForFloatData;
- (uint64_t)rawMicChannelsDataWithNumSamplesPerChannel:()Nvi;
- (void)splitAudioDataToReachSampleCount:()Nvi currSampleCount:numBytesPerSample:completionHandler:;
@end

@implementation NSData(Nvi)

- (id)strRepForFloatData
{
  v2 = [MEMORY[0x1E4F28E78] stringWithFormat:@"[ "];
  id v3 = a1;
  v4 = (float *)[v3 bytes];
  unint64_t v5 = [v3 length];
  if (v5 >= 4)
  {
    unint64_t v6 = v5 >> 2;
    do
    {
      float v7 = *v4++;
      objc_msgSend(v2, "appendFormat:", @"%f ", v7);
      --v6;
    }
    while (v6);
  }
  [v2 appendString:@"]"];
  return v2;
}

- (uint64_t)rawMicChannelsDataWithNumSamplesPerChannel:()Nvi
{
  uint64_t v5 = +[NviConstants nviDirectionalityStartingChannelId];
  uint64_t v6 = +[NviConstants numChannelsForNviDirectionality];
  uint64_t v7 = v5
     * a3
     * +[NviConstants inputRecordingSampleByteDepth];
  uint64_t v8 = v6
     * a3
     * +[NviConstants inputRecordingSampleByteDepth];
  return objc_msgSend(a1, "subdataWithRange:", v7, v8);
}

- (void)splitAudioDataToReachSampleCount:()Nvi currSampleCount:numBytesPerSample:completionHandler:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  unint64_t v11 = a3 - a4;
  if ((uint64_t)(a3 - a4) <= 0)
  {
    v18 = NviLogContextFacility;
    if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315650;
      v20 = "-[NSData(Nvi) splitAudioDataToReachSampleCount:currSampleCount:numBytesPerSample:completionHandler:]";
      __int16 v21 = 2050;
      uint64_t v22 = a4;
      __int16 v23 = 2050;
      unint64_t v24 = a3;
      _os_log_impl(&dword_1C9338000, v18, OS_LOG_TYPE_DEFAULT, "%s RequiredSampleCount reached: currSampleCount=%{public}lu, endingSampleCount=%{public}lu", (uint8_t *)&v19, 0x20u);
    }
    (*((void (**)(id, void, void, void, void, uint64_t))v10 + 2))(v10, 0, 0, 0, 0, 1);
  }
  else
  {
    unint64_t v12 = [a1 length];
    unint64_t v13 = v12 / a5;
    if (v12 / a5 >= v11) {
      unint64_t v14 = a3 - a4;
    }
    else {
      unint64_t v14 = v12 / a5;
    }
    unint64_t v15 = v13 - v14;
    if (v13 <= v11)
    {
      id v16 = a1;
      v17 = 0;
    }
    else
    {
      objc_msgSend(a1, "subdataWithRange:", 0, v14 * a5);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(a1, "subdataWithRange:", v14 * a5, v15 * a5);
    }
    (*((void (**)(id, id, unint64_t, void *, unint64_t, BOOL))v10 + 2))(v10, v16, v14, v17, v15, v14 + a4 >= a3);
  }
}

@end