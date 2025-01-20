@interface NSDictionary(MediaAnalysis)
- (double)vcp_quality;
- (id)vcp_actionsAggregated;
- (id)vcp_fingerprint;
- (id)vcp_queryActionResultForPHFace:()MediaAnalysis;
- (uint64_t)vcp_dateAnalyzed;
- (uint64_t)vcp_dateModified;
- (uint64_t)vcp_flags;
- (uint64_t)vcp_results;
- (uint64_t)vcp_statsFlags;
- (uint64_t)vcp_types;
- (uint64_t)vcp_version;
- (unint64_t)vcp_degraded;
- (unint64_t)vcp_partiallyDegraded;
- (unint64_t)vcp_streamedVideo;
@end

@implementation NSDictionary(MediaAnalysis)

- (uint64_t)vcp_version
{
  v1 = [a1 objectForKey:@"version"];
  uint64_t v2 = [v1 intValue];

  return v2;
}

- (uint64_t)vcp_dateModified
{
  return [a1 objectForKey:@"dateModified"];
}

- (uint64_t)vcp_dateAnalyzed
{
  return [a1 objectForKey:@"dateAnalyzed"];
}

- (uint64_t)vcp_types
{
  v1 = [a1 objectForKey:@"performedAnalysisTypes"];
  uint64_t v2 = [v1 unsignedIntegerValue];

  return v2;
}

- (uint64_t)vcp_flags
{
  v1 = [a1 objectForKey:@"flags"];
  uint64_t v2 = [v1 unsignedIntegerValue];

  return v2;
}

- (uint64_t)vcp_statsFlags
{
  v1 = [a1 objectForKey:@"statsFlags"];
  uint64_t v2 = [v1 unsignedLongValue];

  return v2;
}

- (double)vcp_quality
{
  v1 = [a1 objectForKey:@"quality"];
  uint64_t v2 = v1;
  if (v1)
  {
    [v1 doubleValue];
    double v4 = v3;
  }
  else
  {
    double v4 = -1.0;
  }

  return v4;
}

- (uint64_t)vcp_results
{
  return [a1 objectForKey:@"metadataRanges"];
}

- (id)vcp_fingerprint
{
  uint64_t v2 = [a1 objectForKey:@"masterFingerprint"];
  double v3 = [a1 objectForKey:@"adjustedFingerprint"];
  double v4 = +[VCPFingerprint fingerprintWithMaster:v2 adjusted:v3];

  return v4;
}

- (unint64_t)vcp_degraded
{
  return ((unint64_t)objc_msgSend(a1, "vcp_flags") >> 18) & 1;
}

- (unint64_t)vcp_partiallyDegraded
{
  return ((unint64_t)objc_msgSend(a1, "vcp_flags") >> 32) & 1;
}

- (unint64_t)vcp_streamedVideo
{
  return ((unint64_t)objc_msgSend(a1, "vcp_flags") >> 29) & 1;
}

- (id)vcp_actionsAggregated
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v28 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  double v3 = objc_msgSend(a1, "vcp_results");
  double v4 = [v3 objectForKeyedSubscript:@"HumanActionClassificationResults"];

  obuint64_t j = v4;
  uint64_t v26 = [v4 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v6 = [v5 objectForKeyedSubscript:@"attributes"];
        v7 = [v6 objectForKeyedSubscript:@"humanActions"];

        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v30;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v30 != v10) {
                objc_enumerationMutation(v8);
              }
              v12 = *(void **)(*((void *)&v29 + 1) + 8 * j);
              if ((int)[v12 intValue] >= 2)
              {
                v13 = [v8 objectForKeyedSubscript:v12];
                [v13 floatValue];
                float v15 = v14;

                v16 = [v2 objectForKeyedSubscript:v12];
                if (!v16
                  || ([v2 objectForKeyedSubscript:v12],
                      v18 = objc_claimAutoreleasedReturnValue(),
                      [v18 floatValue],
                      BOOL v20 = v19 < v15,
                      v18,
                      v16,
                      v20))
                {
                  *(float *)&double v17 = v15;
                  v21 = [NSNumber numberWithFloat:v17];
                  [v2 setObject:v21 forKeyedSubscript:v12];

                  v22 = [v5 objectForKeyedSubscript:@"attributes"];
                  [v28 setObject:v22 forKeyedSubscript:v12];
                }
              }
            }
            uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v9);
        }
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v26);
  }

  return v28;
}

- (id)vcp_queryActionResultForPHFace:()MediaAnalysis
{
  v147[2] = *MEMORY[0x1E4F143B8];
  id v106 = a3;
  double v4 = objc_msgSend(a1, "vcp_results");
  v5 = [v4 objectForKeyedSubscript:@"HumanActionClassificationResults"];

  v103 = v5;
  if ([v5 count])
  {
    v146[0] = @"HighlightBestTrim";
    v146[1] = @"HighlightMaxDuration";
    v147[0] = MEMORY[0x1E4F1CC38];
    v147[1] = &unk_1F15EAD68;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v147 forKeys:v146 count:2];
    v105 = MediaAnalysisPostProcessMovieHighlights(a1, v6, 0, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

    v7 = [v105 objectForKeyedSubscript:@"MovieHighlightResults"];
    CMTimeValue value = *MEMORY[0x1E4F1FA20];
    CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 12);
    CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 8);
    uint64_t v9 = *(void **)(MEMORY[0x1E4F1FA20] + 16);
    CMTimeValue v10 = *(void *)(MEMORY[0x1E4F1FA20] + 24);
    CMTimeScale v11 = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 32);
    CMTimeFlags v12 = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 36);
    CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA20] + 40);
    v102 = v7;
    if ([v7 count])
    {
      CFDictionaryRef v14 = [v102 objectAtIndexedSubscript:0];
      CMTimeRangeMakeFromDictionary(&v143, v14);
      CMTimeValue value = v143.start.value;
      CMTimeFlags flags = v143.start.flags;
      CMTimeScale timescale = v143.start.timescale;
      CMTimeValue v10 = v143.duration.value;
      obuint64_t j = (id)v143.start.epoch;
      CMTimeFlags v12 = v143.duration.flags;
      CMTimeScale v97 = v143.duration.timescale;
      CMTimeEpoch epoch = v143.duration.epoch;

      if ((flags & 1) == 0) {
        goto LABEL_21;
      }
    }
    else
    {
      CMTimeScale v97 = v11;
      obuint64_t j = v9;
      if ((flags & 1) == 0)
      {
LABEL_21:
        if ((int)MediaAnalysisLogLevel() < 4)
        {
          CFDictionaryRef dictionaryRepresentation = 0;
          id v16 = 0;
LABEL_33:

          goto LABEL_34;
        }
        v23 = VCPLogInstance();
        v101 = v23;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v143.start.value) = 0;
          _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_DEFAULT, "queryActionResultForPHFace : not find the best highlight", (uint8_t *)&v143, 2u);
        }
        goto LABEL_31;
      }
    }
    if ((v12 & 1) == 0 || epoch || v10 < 0) {
      goto LABEL_21;
    }
    double v17 = [v106 faceClusteringProperties];
    v18 = [v17 faceprint];
    v101 = [v18 faceprintData];

    if (!v101 || [v106 detectionType] != 1)
    {
      if ((int)MediaAnalysisLogLevel() < 4)
      {
LABEL_31:
        CFDictionaryRef dictionaryRepresentation = 0;
        id v16 = 0;
        goto LABEL_32;
      }
      BOOL v20 = VCPLogInstance();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v24 = [v106 localIdentifier];
        LODWORD(v143.start.value) = 138412290;
        *(CMTimeValue *)((char *)&v143.start.value + 4) = (CMTimeValue)v24;
        _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_DEFAULT, "queryActionResultForPHFace : no faceprint data for face: %@", (uint8_t *)&v143, 0xCu);
      }
      goto LABEL_29;
    }
    id v136 = 0;
    float v19 = +[VCPVNImageprintWrapper generateVNImageprintWithType:0 archiveData:v101 andError:&v136];
    BOOL v20 = v136;
    if (v20)
    {
      if ((int)MediaAnalysisLogLevel() < 4)
      {
LABEL_20:

LABEL_29:
        CFDictionaryRef dictionaryRepresentation = 0;
        id v16 = 0;
LABEL_30:

LABEL_32:
        goto LABEL_33;
      }
      v21 = VCPLogInstance();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = [v20 description];
        LODWORD(v143.start.value) = 138412290;
        *(CMTimeValue *)((char *)&v143.start.value + 4) = (CMTimeValue)v22;
        _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_DEFAULT, "queryActionResultForPHFace : failed to decode torsoprint %@", (uint8_t *)&v143, 0xCu);
      }
LABEL_19:

      goto LABEL_20;
    }
    uint64_t v26 = [v19 torsoprint];
    BOOL v27 = v26 == 0;

    if (v27)
    {
      if ((int)MediaAnalysisLogLevel() < 6) {
        goto LABEL_20;
      }
      v21 = VCPLogInstance();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        LOWORD(v143.start.value) = 0;
        _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_INFO, "queryActionResultForPHFace : torsoprint not available", (uint8_t *)&v143, 2u);
      }
      goto LABEL_19;
    }
    v91 = [v19 torsoprint];

    v89 = [MEMORY[0x1E4F1CA48] array];
    long long v134 = 0u;
    long long v135 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    id v28 = v103;
    v93 = v28;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v132 objects:v142 count:16];
    if (!v29)
    {

LABEL_119:
      v61 = 0;
      CFDictionaryRef dictionaryRepresentation = 0;
LABEL_130:
      id v16 = v61;

      BOOL v20 = v91;
      goto LABEL_30;
    }
    CFDictionaryRef dictionaryRepresentation = 0;
    uint64_t v31 = *(void *)v133;
    float v32 = 0.0;
    *(void *)&long long v30 = 138412546;
    long long v88 = v30;
    CMTimeEpoch v33 = (CMTimeEpoch)obj;
    CMTimeScale v34 = v97;
    uint64_t v92 = *(void *)v133;
LABEL_41:
    uint64_t v35 = 0;
    uint64_t v94 = v29;
    while (1)
    {
      if (*(void *)v133 != v31) {
        objc_enumerationMutation(v28);
      }
      CFDictionaryRef v36 = *(const __CFDictionary **)(*((void *)&v132 + 1) + 8 * v35);
      memset(&v143, 0, sizeof(v143));
      CMTimeRangeMakeFromDictionary(&v143, v36);
      CMTimeRange range = v143;
      memset(&v131, 0, sizeof(v131));
      otherRange.start.CMTimeValue value = value;
      otherRange.start.CMTimeScale timescale = timescale;
      otherRange.start.CMTimeFlags flags = flags;
      otherRange.start.CMTimeEpoch epoch = v33;
      otherRange.duration.CMTimeValue value = v10;
      otherRange.duration.CMTimeScale timescale = v34;
      otherRange.duration.CMTimeFlags flags = v12;
      otherRange.duration.CMTimeEpoch epoch = 0;
      CMTimeRangeGetIntersection(&v131, &range, &otherRange);
      if ((v131.start.flags & 1) == 0) {
        goto LABEL_45;
      }
      if ((v131.duration.flags & 1) == 0) {
        goto LABEL_45;
      }
      if (v131.duration.epoch) {
        goto LABEL_45;
      }
      if (v131.duration.value < 0) {
        goto LABEL_45;
      }
      CMTime time = v131.duration;
      float Seconds = CMTimeGetSeconds(&time);
      if (Seconds < 1.0) {
        goto LABEL_45;
      }
      v38 = [(__CFDictionary *)v36 objectForKeyedSubscript:@"attributes"];
      uint64_t v96 = [v38 objectForKeyedSubscript:@"torsoPrint"];

      uint64_t v39 = (void *)v96;
      if (v96)
      {
        uint64_t v40 = [objc_alloc(MEMORY[0x1E4F45970]) initWithState:v96 error:0];
        if (!v40)
        {
          v95 = 0;
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            v86 = VCPLogInstance();
            if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(buf.start.value) = 0;
              _os_log_impl(&dword_1BBEDA000, v86, OS_LOG_TYPE_DEFAULT, "queryActionResultForPHFace : failed to decode torsoprintAction", (uint8_t *)&buf, 2u);
            }
LABEL_128:

            uint64_t v39 = (void *)v96;
          }

          v61 = 0;
          goto LABEL_130;
        }
        if (v91)
        {
          id v127 = 0;
          v95 = (void *)v40;
          v41 = [v91 computeDistance:v40 withDistanceFunction:0 error:&v127];
          v42 = v127;
          if (v42)
          {
            v86 = v42;
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              v87 = VCPLogInstance();
              if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(buf.start.value) = 0;
                _os_log_impl(&dword_1BBEDA000, v87, OS_LOG_TYPE_DEFAULT, "queryActionResultForPHFace : failed to get compute torsoprint distance", (uint8_t *)&buf, 2u);
              }
            }
            goto LABEL_128;
          }
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v43 = VCPLogInstance();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
            {
              v44 = [v106 localIdentifier];
              [v41 floatValue];
              LODWORD(buf.start.value) = v88;
              *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v44;
              LOWORD(buf.start.flags) = 2048;
              *(double *)((char *)&buf.start.flags + 2) = v45;
              _os_log_impl(&dword_1BBEDA000, v43, OS_LOG_TYPE_DEBUG, "queryActionResultForPHFace : torsoprint distance with %@, %f", (uint8_t *)&buf, 0x16u);
            }
          }
          if (v41 && ([v41 floatValue], v46 < 0.3))
          {
            v90 = v41;
            v47 = [(__CFDictionary *)v36 objectForKeyedSubscript:@"attributes"];
            v48 = [v47 objectForKeyedSubscript:@"humanActions"];

            long long v125 = 0u;
            long long v126 = 0u;
            long long v123 = 0u;
            long long v124 = 0u;
            id v49 = v48;
            uint64_t v50 = [v49 countByEnumeratingWithState:&v123 objects:v141 count:16];
            if (v50)
            {
              uint64_t v51 = *(void *)v124;
              float v52 = 0.0;
              do
              {
                for (uint64_t i = 0; i != v50; ++i)
                {
                  if (*(void *)v124 != v51) {
                    objc_enumerationMutation(v49);
                  }
                  v54 = *(void **)(*((void *)&v123 + 1) + 8 * i);
                  if ((int)objc_msgSend(v54, "intValue", v88) >= 2)
                  {
                    v55 = [v49 objectForKeyedSubscript:v54];
                    [v55 floatValue];
                    if (v56 >= v52) {
                      float v52 = v56;
                    }
                  }
                }
                uint64_t v50 = [v49 countByEnumeratingWithState:&v123 objects:v141 count:16];
              }
              while (v50);
            }
            else
            {
              float v52 = 0.0;
            }

            float v58 = v52 + Seconds;
            if (v58 <= v32)
            {
              float v58 = v32;
            }
            else
            {
              CFDictionaryRef v59 = v36;

              CFDictionaryRef dictionaryRepresentation = v59;
            }
            objc_msgSend(v89, "addObject:", v36, v88);

            v41 = v90;
          }
          else
          {
            float v58 = v32;
          }
          goto LABEL_86;
        }
        v57 = (void *)v40;
      }
      else
      {
        v57 = 0;
      }
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v41 = VCPLogInstance();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf.start.value) = 0;
          _os_log_impl(&dword_1BBEDA000, v41, OS_LOG_TYPE_DEFAULT, "queryActionResultForPHFace : failed to get torsoprints", (uint8_t *)&buf, 2u);
        }
        float v58 = v32;
        v95 = v57;
LABEL_86:

        uint64_t v39 = (void *)v96;
        goto LABEL_87;
      }
      float v58 = v32;
      v95 = v57;
LABEL_87:

      float v32 = v58;
      id v28 = v93;
      uint64_t v29 = v94;
      CMTimeEpoch v33 = (CMTimeEpoch)obj;
      CMTimeScale v34 = v97;
      uint64_t v31 = v92;
LABEL_45:
      if (++v35 == v29)
      {
        uint64_t v60 = [v28 countByEnumeratingWithState:&v132 objects:v142 count:16];
        uint64_t v29 = v60;
        if (!v60)
        {

          if (!dictionaryRepresentation) {
            goto LABEL_119;
          }
          v61 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:");
          if ((unint64_t)[v89 count] >= 2)
          {
            memset(&v143, 0, sizeof(v143));
            v98 = v61;
            CMTimeRangeMakeFromDictionary(&v143, dictionaryRepresentation);
            memset(&v122, 0, sizeof(v122));
            v131.CMTime start = v143.duration;
            CMTimeMultiplyByRatio(&rhs, &v131.start, 1, 2);
            *(_OWORD *)&v131.start.CMTimeValue value = *(_OWORD *)&v143.start.value;
            v131.start.CMTimeEpoch epoch = v143.start.epoch;
            buf.CMTime start = rhs;
            CMTimeAdd(&v122, &v131.start, &buf.start);
            v62 = [(__CFDictionary *)dictionaryRepresentation objectForKeyedSubscript:@"attributes"];
            v63 = [v62 objectForKeyedSubscript:@"humanActions"];

            long long v120 = 0u;
            long long v121 = 0u;
            long long v118 = 0u;
            long long v119 = 0u;
            id v64 = v63;
            v65 = 0;
            uint64_t v66 = [v64 countByEnumeratingWithState:&v118 objects:v140 count:16];
            if (v66)
            {
              uint64_t v67 = *(void *)v119;
              float v68 = 0.0;
              do
              {
                for (uint64_t j = 0; j != v66; ++j)
                {
                  if (*(void *)v119 != v67) {
                    objc_enumerationMutation(v64);
                  }
                  v70 = *(void **)(*((void *)&v118 + 1) + 8 * j);
                  v71 = objc_msgSend(v64, "objectForKeyedSubscript:", v70, v88);
                  [v71 floatValue];
                  float v73 = v72;

                  if ((int)[v70 intValue] >= 2 && v73 > v68)
                  {
                    id v75 = v70;

                    v65 = v75;
                    float v68 = v73;
                  }
                }
                uint64_t v66 = [v64 countByEnumeratingWithState:&v118 objects:v140 count:16];
              }
              while (v66);
            }

            long long v116 = 0u;
            long long v117 = 0u;
            long long v114 = 0u;
            long long v115 = 0u;
            id obja = v89;
            uint64_t v76 = [obja countByEnumeratingWithState:&v114 objects:v139 count:16];
            if (v76)
            {
              uint64_t v77 = *(void *)v115;
              do
              {
                for (uint64_t k = 0; k != v76; ++k)
                {
                  if (*(void *)v115 != v77) {
                    objc_enumerationMutation(obja);
                  }
                  v79 = *(void **)(*((void *)&v114 + 1) + 8 * k);
                  v80 = objc_msgSend(v79, "objectForKeyedSubscript:", @"attributes", v88);
                  v81 = [v80 objectForKeyedSubscript:@"humanActions"];

                  if (v65)
                  {
                    v82 = [v81 objectForKeyedSubscript:v65];
                    BOOL v83 = v82 == 0;

                    if (!v83)
                    {
                      memset(&v131, 0, sizeof(v131));
                      CMTimeRangeMakeFromDictionary(&v131, (CFDictionaryRef)v79);
                      memset(&v113, 0, sizeof(v113));
                      buf.CMTime start = v131.duration;
                      CMTimeMultiplyByRatio(&v112, &buf.start, 1, 2);
                      *(_OWORD *)&buf.start.CMTimeValue value = *(_OWORD *)&v131.start.value;
                      buf.start.CMTimeEpoch epoch = v131.start.epoch;
                      CMTime rhs = v112;
                      CMTimeAdd(&v113, &buf.start, &rhs);
                      buf.CMTime start = v113;
                      CMTime rhs = v122;
                      CMTimeSubtract(&v111, &buf.start, &rhs);
                      if (fabs(CMTimeGetSeconds(&v111)) < 3.0)
                      {
                        CMTimeRange v110 = v143;
                        CMTimeRange v109 = v131;
                        CMTimeRangeGetUnion(&buf, &v110, &v109);
                        CMTimeRange v143 = buf;
                      }
                    }
                  }
                }
                uint64_t v76 = [obja countByEnumeratingWithState:&v114 objects:v139 count:16];
              }
              while (v76);
            }

            CMTime start = v143.start;
            v84 = CMTimeToNSDictionary(&start);
            [v98 setObject:v84 forKeyedSubscript:@"start"];

            CMTime duration = v143.duration;
            v85 = CMTimeToNSDictionary(&duration);
            [v98 setObject:v85 forKeyedSubscript:@"duration"];

            v61 = v98;
          }
          goto LABEL_130;
        }
        goto LABEL_41;
      }
    }
  }
  if ((int)MediaAnalysisLogLevel() < 6)
  {
    CFDictionaryRef dictionaryRepresentation = 0;
    id v16 = 0;
    goto LABEL_35;
  }
  float v15 = VCPLogInstance();
  v105 = v15;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    LOWORD(v143.start.value) = 0;
    _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_INFO, "queryActionResultForPHFace : no action results", (uint8_t *)&v143, 2u);
  }
  CFDictionaryRef dictionaryRepresentation = 0;
  id v16 = 0;
LABEL_34:

LABEL_35:
  return v16;
}

@end