@interface LoopAudioComposer
- (int)composeLoopWithAudio:(id)a3 withAudioSource:(id)a4 startTime:(id *)a5 fadeTime:(id *)a6 periodTime:(id *)a7 metadata:(id)a8 andOutputURL:(id)a9;
@end

@implementation LoopAudioComposer

- (int)composeLoopWithAudio:(id)a3 withAudioSource:(id)a4 startTime:(id *)a5 fadeTime:(id *)a6 periodTime:(id *)a7 metadata:(id)a8 andOutputURL:(id)a9
{
  id v13 = a3;
  id v55 = a4;
  id v54 = a8;
  id v14 = a9;
  CMTime time1 = *(CMTime *)a6;
  v15 = (CMTime *)MEMORY[0x1E4F1FA48];
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  int32_t v16 = CMTimeCompare(&time1, &time2);
  v17 = [MEMORY[0x1E4F28CB8] defaultManager];
  v18 = [v14 path];
  int v19 = [v17 fileExistsAtPath:v18];

  if (v19)
  {
    v20 = [MEMORY[0x1E4F28CB8] defaultManager];
    v21 = [v14 path];
    [v20 removeItemAtPath:v21 error:0];
  }
  CMTime v107 = (CMTime)*a7;
  if (v13) {
    [v13 duration];
  }
  else {
    memset(&v106, 0, sizeof(v106));
  }
  if (CMTimeCompare(&v107, &v106))
  {
    int64_t var0 = a7->var0;
    uint64_t var1 = a7->var1;
    if (v13)
    {
      [v13 duration];
      uint64_t v24 = v97;
      [v13 duration];
      uint64_t v25 = DWORD2(v94);
    }
    else
    {
      uint64_t v25 = 0;
      uint64_t v24 = 0;
      long long v97 = 0uLL;
      *(void *)&v98[0] = 0;
      long long v94 = 0uLL;
      *(void *)&long long v95 = 0;
    }
    NSLog(&cfstr_WarningLoopPer.isa, var0, var1, v24, v25);
  }
  uint64_t v26 = *MEMORY[0x1E4F15C18];
  v27 = [v13 tracksWithMediaType:*MEMORY[0x1E4F15C18]];
  uint64_t v28 = [v27 count];

  if (v28)
  {
    v29 = [v13 tracksWithMediaType:v26];
    v53 = [v29 objectAtIndex:0];

    uint64_t v30 = *MEMORY[0x1E4F15BA8];
    v31 = [v55 tracksWithMediaType:*MEMORY[0x1E4F15BA8]];
    uint64_t v32 = [v31 count];

    if (v32)
    {
      v33 = [v55 tracksWithMediaType:v30];
      v34 = [v33 objectAtIndex:0];

      v51 = [MEMORY[0x1E4F16590] composition];
      v52 = [v51 addMutableTrackWithMediaType:v26 preferredTrackID:0];
      CMTime start = *v15;
      CMTime duration = (CMTime)*a7;
      CMTimeRangeMake(&v105, &start, &duration);
      long long v101 = *(_OWORD *)&v15->value;
      CMTimeEpoch epoch = v15->epoch;
      [v52 insertTimeRange:&v105 ofTrack:v53 atTime:&v101 error:0];
      CMTime v100 = (CMTime)*a7;
      if (v34)
      {
        [v34 timeRange];
      }
      else
      {
        memset(v98, 0, sizeof(v98));
        long long v97 = 0u;
      }
      CMTime v99 = *(CMTime *)((char *)v98 + 8);
      if (CMTimeCompare(&v100, &v99) < 1)
      {
        if (v53)
        {
          [v53 preferredTransform];
        }
        else
        {
          long long v93 = 0u;
          long long v92 = 0u;
          long long v91 = 0u;
        }
        v90[0] = v91;
        v90[1] = v92;
        v90[2] = v93;
        [v52 setPreferredTransform:v90];
        long long v97 = 0uLL;
        *(void *)&v98[0] = 0;
        CMTime lhs = (CMTime)*a7;
        CMTime rhs = (CMTime)*a6;
        CMTimeSubtract((CMTime *)&v97, &lhs, &rhs);
        if (v16 <= 0)
        {
          v42 = [v51 addMutableTrackWithMediaType:v30 preferredTrackID:0];
          CMTime v86 = (CMTime)*a5;
          CMTime v85 = (CMTime)*a7;
          CMTimeRangeMake(&v87, &v86, &v85);
          long long v83 = *(_OWORD *)&v15->value;
          CMTimeEpoch v84 = v15->epoch;
          v47 = 0;
          v48 = 0;
          v49 = 0;
          [v42 insertTimeRange:&v87 ofTrack:v34 atTime:&v83 error:0];
          v40 = 0;
        }
        else
        {
          v47 = [v51 addMutableTrackWithMediaType:v30 preferredTrackID:0];
          v48 = [v51 addMutableTrackWithMediaType:v30 preferredTrackID:0];
          v49 = [v51 addMutableTrackWithMediaType:v30 preferredTrackID:0];
          CMTime v82 = (CMTime)*a6;
          CMTime v81 = *v15;
          if (CMTimeCompare(&v82, &v81) >= 1)
          {
            CMTime v79 = (CMTime)*a5;
            CMTime v78 = (CMTime)*a6;
            CMTimeRangeMake(&v80, &v79, &v78);
            long long v76 = v97;
            uint64_t v77 = *(void *)&v98[0];
            [v47 insertTimeRange:&v80 ofTrack:v34 atTime:&v76 error:0];
            CMTime v73 = (CMTime)*a5;
            CMTime v72 = (CMTime)*a7;
            CMTimeAdd(&v74, &v73, &v72);
            CMTime v71 = (CMTime)*a6;
            CMTimeRangeMake(&v75, &v74, &v71);
            long long v69 = v97;
            uint64_t v70 = *(void *)&v98[0];
            [v48 insertTimeRange:&v75 ofTrack:v34 atTime:&v69 error:0];
          }
          *(_OWORD *)&v68.value = v97;
          v68.CMTimeEpoch epoch = *(void *)&v98[0];
          CMTime v67 = *v15;
          if (CMTimeCompare(&v68, &v67) >= 1)
          {
            CMTime v64 = (CMTime)*a5;
            CMTime v63 = (CMTime)*a6;
            CMTimeAdd(&v65, &v64, &v63);
            *(_OWORD *)&v62.value = v97;
            v62.CMTimeEpoch epoch = *(void *)&v98[0];
            CMTimeRangeMake(&v66, &v65, &v62);
            long long v60 = *(_OWORD *)&v15->value;
            CMTimeEpoch v61 = v15->epoch;
            [v49 insertTimeRange:&v66 ofTrack:v34 atTime:&v60 error:0];
          }
          v40 = [MEMORY[0x1E4F16580] audioMix];
          v41 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
          *(_OWORD *)&v59.value = v97;
          v59.CMTimeEpoch epoch = *(void *)&v98[0];
          $3CC8671D27C23BF42ADDB32F2B5E48AE v58 = *a7;
          sub_1DD3CD388(v48, v41, &v59, (CMTime *)&v58, 1);
          *(_OWORD *)&v57.value = v97;
          v57.CMTimeEpoch epoch = *(void *)&v98[0];
          $3CC8671D27C23BF42ADDB32F2B5E48AE v56 = *a7;
          sub_1DD3CD388(v47, v41, &v57, (CMTime *)&v56, 0);
          [v40 setInputParameters:v41];

          v42 = 0;
        }
        v43 = [MEMORY[0x1E4F16360] exportPresetsCompatibleWithAsset:v13];
        uint64_t v44 = *MEMORY[0x1E4F156E8];
        if (([(id)*MEMORY[0x1E4F156E8] isEqualToString:*MEMORY[0x1E4F15758]] & 1) != 0
          || ([v43 containsObject:v44] & 1) != 0)
        {
          v45 = (void *)[objc_alloc(MEMORY[0x1E4F16360]) initWithAsset:v51 presetName:v44];
          [v45 setOutputURL:v14];
          [v45 setOutputFileType:*MEMORY[0x1E4F15AB0]];
          [v45 setShouldOptimizeForNetworkUse:1];
          [v45 setAudioMix:v40];
          if (v54) {
            [v45 setMetadata:v54];
          }
          if (sub_1DD3BDDAC(v45))
          {
            NSLog(&cfstr_AudioExportErr_0.isa);
            int v35 = -1;
          }
          else
          {
            int v35 = 0;
          }
        }
        else
        {
          NSLog(&cfstr_AudioExportErr.isa);
          int v35 = 0;
        }
      }
      else
      {
        int64_t v36 = a7->var0;
        uint64_t v37 = a7->var1;
        if (v34)
        {
          [v34 timeRange];
          uint64_t v38 = *((void *)&v98[0] + 1);
          [v34 timeRange];
          uint64_t v39 = v96;
        }
        else
        {
          uint64_t v39 = 0;
          uint64_t v38 = 0;
          memset(v98, 0, sizeof(v98));
          long long v97 = 0u;
          long long v96 = 0u;
          long long v95 = 0u;
          long long v94 = 0u;
        }
        NSLog(&cfstr_AudioTrackOfIn.isa, v36, v37, v38, v39);
        int v35 = -1;
      }
    }
    else
    {
      NSLog(&cfstr_NoAudioTrackAv.isa);
      int v35 = -1;
    }
  }
  else
  {
    NSLog(&cfstr_NoVideoTrackAv.isa);
    int v35 = -1;
  }

  return v35;
}

@end