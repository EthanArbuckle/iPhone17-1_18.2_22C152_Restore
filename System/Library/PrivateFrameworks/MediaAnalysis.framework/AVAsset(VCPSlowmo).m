@interface AVAsset(VCPSlowmo)
- (id)vcp_assetWithoutAdjustments:()VCPSlowmo duration:;
- (void)vcp_scaleRampWithIntervals:()VCPSlowmo andRates:inSlowmoTimerange:withTimeMapping:inComposition:;
- (void)vcp_scaleSlowmoTimeRange:()VCPSlowmo withTimeMapping:inComposition:;
@end

@implementation AVAsset(VCPSlowmo)

- (void)vcp_scaleSlowmoTimeRange:()VCPSlowmo withTimeMapping:inComposition:
{
  id v7 = a4;
  id v8 = a5;
  memset(v17, 0, sizeof(v17));
  long long v9 = *(_OWORD *)(a3 + 16);
  v15[0] = *(_OWORD *)a3;
  v15[1] = v9;
  v15[2] = *(_OWORD *)(a3 + 32);
  long long v16 = 0u;
  if (v7) {
    objc_msgSend(v7, "vcp_convertToOriginalTimerangeFromScaledTimerange:", v15);
  }
  *(_OWORD *)&start.value = v16;
  start.epoch = *(void *)&v17[0];
  CMTime duration = *(CMTime *)(a3 + 24);
  CMTimeRangeMake(&v14, &start, &duration);
  long long v10 = *(_OWORD *)((char *)v17 + 8);
  uint64_t v11 = *((void *)&v17[1] + 1);
  [v8 scaleTimeRange:&v14 toDuration:&v10];
}

- (void)vcp_scaleRampWithIntervals:()VCPSlowmo andRates:inSlowmoTimerange:withTimeMapping:inComposition:
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if ((*(unsigned char *)(a5 + 12) & 1) == 0
    || (*(unsigned char *)(a5 + 36) & 1) == 0
    || *(void *)(a5 + 40)
    || (*(void *)(a5 + 24) & 0x8000000000000000) != 0
    || (time1 = *(CMTime *)(a5 + 24), CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48], CMTimeCompare(&time1, &time2)))
  {
    if ([v13 count])
    {
      unint64_t v16 = 0;
      CMTime v32 = *(CMTime *)a5;
      while (v16 < [v13 count] - 1)
      {
        v17 = [v12 objectAtIndexedSubscript:v16];
        [v17 floatValue];
        float v19 = v18;
        v20 = [v13 objectAtIndexedSubscript:v16];
        [v20 floatValue];
        Float64 v22 = (float)(v19 / v21);

        memset(&v31, 0, sizeof(v31));
        CMTimeMakeWithSeconds(&v31, v22, 600);
        CMTime start = v32;
        CMTime duration = v31;
        CMTimeRangeMake(&v30, &start, &duration);
        objc_msgSend(a1, "vcp_scaleSlowmoTimeRange:withTimeMapping:inComposition:", &v30, v14, v15);
        CMTime lhs = v32;
        CMTime rhs = v31;
        CMTimeAdd(&v37, &lhs, &rhs);
        CMTime v32 = v37;
        ++v16;
      }
      CMTime v26 = v32;
      long long v23 = *(_OWORD *)(a5 + 16);
      *(_OWORD *)&v24.start.value = *(_OWORD *)a5;
      *(_OWORD *)&v24.start.epoch = v23;
      *(_OWORD *)&v24.duration.timescale = *(_OWORD *)(a5 + 32);
      CMTimeRangeGetEnd(&end, &v24);
      CMTimeRangeFromTimeToTime(&v27, &v26, &end);
      objc_msgSend(a1, "vcp_scaleSlowmoTimeRange:withTimeMapping:inComposition:", &v27, v14, v15);
    }
  }
}

- (id)vcp_assetWithoutAdjustments:()VCPSlowmo duration:
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F8CE10]);
    id v8 = [v6 privateFileURL];
    long long v9 = (void *)[v7 initWithURL:v8];

    v34 = v9;
    if (v9 && ([v9 hasSlowMotionAdjustments] & 1) != 0)
    {
      v33 = (void *)[objc_alloc(MEMORY[0x1E4F8CE08]) initWithVideoAsset:0 videoAdjustments:v9];
      if (v33)
      {
        long long v10 = [MEMORY[0x1E4F16590] composition];
        memset(&v73, 0, sizeof(v73));
        uint64_t v11 = (CMTime *)MEMORY[0x1E4F1FA48];
        CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
        [a1 duration];
        CMTimeRangeFromTimeToTime(&v73, &start, &end);
        CMTimeRange v70 = v73;
        long long v68 = *(_OWORD *)&v11->value;
        CMTimeEpoch epoch = v11->epoch;
        if ([v10 insertTimeRange:&v70 ofAsset:a1 atTime:&v68 error:0])
        {
          id v26 = objc_alloc_init(MEMORY[0x1E4F8CD90]);
          v29 = [v26 rampDown];
          CMTimeRange v30 = [v26 rampUp];
          [v9 slowMotionRate];
          id v67 = 0;
          id v66 = 0;
          objc_msgSend(v29, "computeRampToTargetRate:forExport:outTimeSteps:outIntermediateRates:", 1, &v67, &v66);
          id v31 = v67;
          id v32 = v66;
          [v9 slowMotionRate];
          id v65 = 0;
          id v64 = 0;
          objc_msgSend(v30, "computeRampToTargetRate:forExport:outTimeSteps:outIntermediateRates:", 1, &v65, &v64);
          id v27 = v65;
          id v28 = v64;
          memset(&v63, 0, sizeof(v63));
          [v33 slowMotionRampInRangeForExport:1];
          long long v61 = 0u;
          long long v62 = 0u;
          long long v60 = 0u;
          [v33 slowMotionRampOutRangeForExport:1];
          memset(&v59, 0, sizeof(v59));
          [v9 slowMotionTimeRange];
          CMTimeRangeGetEnd(&v59, &range);
          CMTime time = v63.start;
          double Seconds = CMTimeGetSeconds(&time);
          CMTime v56 = v59;
          double v13 = CMTimeGetSeconds(&v56);
          memset(&v55, 0, sizeof(v55));
          if (Seconds >= 0.100000001)
          {
            CMTimeRange v54 = v63;
            CMTimeRangeGetEnd(&v55, &v54);
          }
          else
          {
            CMTime v55 = *v11;
          }
          double v15 = a2 - v13;
          memset(&v53, 0, sizeof(v53));
          if (v15 >= 0.100000001)
          {
            *(_OWORD *)&v53.value = v60;
            v53.CMTimeEpoch epoch = v61;
          }
          else
          {
            CMTimeRange v52 = v73;
            CMTimeRangeGetEnd(&v53, &v52);
          }
          memset(&v51, 0, sizeof(v51));
          CMTime v50 = v55;
          CMTime v49 = v53;
          CMTimeRangeFromTimeToTime(&v51, &v50, &v49);
          if (v15 >= 0.100000001)
          {
            CMTimeRange v48 = v63;
            objc_msgSend(a1, "vcp_scaleRampWithIntervals:andRates:inSlowmoTimerange:withTimeMapping:inComposition:", v31, v32, &v48, v33, v10);
          }
          memset(&v47, 0, sizeof(v47));
          long long v45 = *(_OWORD *)&v51.start.value;
          CMTimeEpoch v46 = v51.start.epoch;
          [v33 convertToOriginalTimeFromScaledTime:&v45 forExport:1];
          CMTime v43 = v47;
          CMTime duration = v51.duration;
          CMTimeRangeMake(&v44, &v43, &duration);
          CMTime v40 = v51.duration;
          [v9 slowMotionRate];
          CMTimeMultiplyByFloat64(&v41, &v40, v16);
          [v10 scaleTimeRange:&v44 toDuration:&v41];
          if (Seconds >= 0.100000001)
          {
            v39[0] = v60;
            v39[1] = v61;
            v39[2] = v62;
            objc_msgSend(a1, "vcp_scaleRampWithIntervals:andRates:inSlowmoTimerange:withTimeMapping:inComposition:", v27, v28, v39, v33, v10);
          }
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          v17 = [v10 tracks];
          uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v74 count:16];
          if (v18)
          {
            uint64_t v19 = *(void *)v36;
            uint64_t v20 = *MEMORY[0x1E4F15BA8];
            do
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v36 != v19) {
                  objc_enumerationMutation(v17);
                }
                Float64 v22 = *(void **)(*((void *)&v35 + 1) + 8 * i);
                long long v23 = [v22 mediaType];
                int v24 = [v23 isEqualToString:v20];

                if (v24) {
                  [v10 removeTrack:v22];
                }
              }
              uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v74 count:16];
            }
            while (v18);
          }

          id v14 = v10;
        }
        else
        {
          id v14 = 0;
        }
      }
      else
      {
        id v14 = 0;
      }
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

@end