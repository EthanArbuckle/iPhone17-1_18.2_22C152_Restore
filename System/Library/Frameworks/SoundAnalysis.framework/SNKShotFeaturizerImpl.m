@interface SNKShotFeaturizerImpl
+ (BOOL)ensureIsValidHallucinatorV3Model:(id)a3 error:(id *)a4;
+ (id)defaultRandomNumberGenerator;
+ (id)featurizeFiles:(id)a3 hallucinatorModelURL:(id)a4 queue:(id)a5 completionHandler:(id)a6;
+ (id)featurizeFiles:(id)a3 hallucinatorModelURL:(id)a4 queue:(id)a5 resultHandler:(id)a6 completionHandler:(id)a7;
+ (id)featurizeFiles:(id)a3 randomNumberGenerator:(id)a4 hallucinatorModelURL:(id)a5 error:(id *)a6;
+ (id)labelFromNumberRepresentation:(id)a3 error:(id *)a4;
+ (id)performSegmentationRequest:(id)a3 error:(id *)a4;
+ (id)pseudoRandomNumberGeneratorWithSeed:(unsigned int)a3;
+ (id)readNumRepetitionsPerTimeShiftFromHallucinator:(id)a3 error:(id *)a4;
+ (id)readNumTimeShiftsPerSegmentFromHallucinator:(id)a3 error:(id *)a4;
+ (id)streamCompletionFromFeaturizationResult:(id)a3;
+ (id)streamResultWithEmbedding:(id)a3 label:(id)a4 dataset:(int64_t)a5 error:(id *)a6;
+ (id)streamResultsForDatasetType:(int64_t)a3 embeddings:(id)a4 labels:(id)a5 error:(id *)a6;
+ (id)streamResultsFromFeaturizationResult:(id)a3 error:(id *)a4;
+ (int)recognizeHallucinatorModel:(id)a3 error:(id *)a4;
@end

@implementation SNKShotFeaturizerImpl

+ (id)defaultRandomNumberGenerator
{
  return &unk_1F37F85A0;
}

+ (id)pseudoRandomNumberGeneratorWithSeed:(unsigned int)a3
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  unsigned int v7 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1DCB50594;
  aBlock[3] = &unk_1E6CA7830;
  aBlock[4] = v6;
  v3 = _Block_copy(aBlock);
  _Block_object_dispose(v6, 8);

  return v3;
}

+ (id)featurizeFiles:(id)a3 hallucinatorModelURL:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v9 = a6;
  v10 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(v10);
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1DCB51968;
  aBlock[3] = &unk_1E6CA7858;
  id v18 = v14;
  id v39 = v18;
  id v19 = v15;
  id v40 = v19;
  id v20 = v16;
  id v41 = v20;
  id v21 = v17;
  id v42 = v21;
  v22 = _Block_copy(aBlock);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = sub_1DCB51A60;
  v32[3] = &unk_1E6CA7880;
  id v33 = v18;
  id v34 = v19;
  id v35 = v20;
  id v36 = v21;
  id v37 = v9;
  id v30 = v9;
  id v23 = v21;
  id v24 = v20;
  id v25 = v19;
  id v26 = v18;
  v27 = _Block_copy(v32);
  v28 = [a1 featurizeFiles:v13 hallucinatorModelURL:v12 queue:v11 resultHandler:v22 completionHandler:v27];

  return v28;
}

+ (id)featurizeFiles:(id)a3 hallucinatorModelURL:(id)a4 queue:(id)a5 resultHandler:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = a5;
  id v17 = objc_alloc_init(SNBooleanCancellable);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_1DCB51CC8;
  v26[3] = &unk_1E6CA78A8;
  id v32 = a1;
  id v27 = v12;
  id v28 = v13;
  id v18 = v17;
  v29 = v18;
  id v30 = v14;
  id v31 = v15;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(v16, v26);

  id v23 = v31;
  id v24 = v18;

  return v24;
}

+ (id)performSegmentationRequest:(id)a3 error:(id *)a4
{
  uint64_t v249 = *MEMORY[0x1E4F143B8];
  id v152 = a3;
  v4 = sub_1DCB6CF14();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.value) = 0;
    _os_log_impl(&dword_1DC873000, v4, OS_LOG_TYPE_DEFAULT, "[Custom Sound Recognition Model Training] Starting segmentation.", (uint8_t *)&buf, 2u);
  }

  v151 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:20];
  if (v152)
  {
    [v152 hangoverDuration];
    Float64 Seconds = CMTimeGetSeconds(&time);
    [v152 minSegmentDuration];
  }
  else
  {
    memset(&time, 0, sizeof(time));
    Float64 Seconds = CMTimeGetSeconds(&time);
    memset(&v241, 0, sizeof(v241));
  }
  Float64 v141 = CMTimeGetSeconds(&v241);
  long long v239 = 0u;
  long long v240 = 0u;
  long long v237 = 0u;
  long long v238 = 0u;
  obuint64_t j = [v152 fileURLs];
  uint64_t v5 = [obj countByEnumeratingWithState:&v237 objects:v248 count:16];
  if (v5)
  {
    v6.f64[0] = Seconds;
    v6.f64[1] = v141;
    int32x2_t v7 = vcvt_s32_f32(vdiv_f32(vmul_f32(vcvt_f32_f64(v6), (float32x2_t)vdup_n_s32(0x467A0000u)), (float32x2_t)vdup_n_s32(0x43200000u)));
    uint64_t v8 = *(void *)v238;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v238 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v237 + 1) + 8 * i);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = sub_1DCB53B5C;
        aBlock[3] = &unk_1E6CA78D0;
        void aBlock[4] = v10;
        uint64_t v233 = 0x6000000010;
        int v234 = 48;
        id v231 = v152;
        int32x2_t v235 = v7;
        int v236 = 1056964608;
        id v232 = v151;
        id v11 = (void (**)(void))_Block_copy(aBlock);
        id v12 = (void *)MEMORY[0x1E01A90A0]();
        id v13 = v11[2](v11);
        if (v13)
        {
          if (a4) {
            *a4 = v13;
          }

          v56 = 0;
          goto LABEL_138;
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v237 objects:v248 count:16];
    }
    while (v5);
  }

  v147 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v151, "count"));
  long long v229 = 0u;
  long long v228 = 0u;
  long long v227 = 0u;
  long long v226 = 0u;
  id v14 = v151;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v226 objects:v247 count:16];
  if (!v15) {
    goto LABEL_22;
  }
  uint64_t v16 = *(void *)v227;
  do
  {
    for (uint64_t j = 0; j != v15; ++j)
    {
      if (*(void *)v227 != v16) {
        objc_enumerationMutation(v14);
      }
      uint64_t v18 = *(void *)(*((void *)&v226 + 1) + 8 * j);
      v223[0] = MEMORY[0x1E4F143A8];
      v223[1] = 3221225472;
      v223[2] = sub_1DCB54BC4;
      v223[3] = &unk_1E6CA78F8;
      id v225 = a1;
      v223[4] = v18;
      id v224 = v147;
      id v19 = (void (**)(void))_Block_copy(v223);
      id v20 = (void *)MEMORY[0x1E01A90A0]();
      id v21 = v19[2](v19);
      if (v21)
      {
        if (a4) {
          *a4 = v21;
        }

        goto LABEL_52;
      }
    }
    uint64_t v15 = [v14 countByEnumeratingWithState:&v226 objects:v247 count:16];
  }
  while (v15);
LABEL_22:

  id v22 = objc_alloc(MEMORY[0x1E4F1E9A8]);
  id v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
  v246[0] = v23;
  id v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
  v246[1] = v24;
  id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v246 count:2];
  id v26 = (void *)[v22 initWithShape:v25 dataType:65568 error:a4];

  if (!v26)
  {
    id v14 = 0;
LABEL_52:
    obuint64_t j = 0;
    v56 = 0;
    goto LABEL_137;
  }
  id v138 = v26;
  obja = (float *)[v138 dataPointer];
  id v27 = [v138 strides];
  id v28 = [v27 objectAtIndexedSubscript:0];
  int v139 = [v28 intValue];

  v29 = [v138 strides];
  id v30 = [v29 objectAtIndexedSubscript:1];
  int v142 = [v30 intValue];

  if (![v14 count])
  {
LABEL_30:
    int v39 = 0;
    if ([v14 count])
    {
      uint64_t v40 = 1;
      id v41 = obja;
      do
      {
        float v42 = *v41;
        [v152 similarityThreshold];
        if (v42 > v43) {
          ++v39;
        }
        unint64_t v44 = [v14 count];
        unint64_t v45 = v40++;
        v41 += v142;
      }
      while (v44 > v45);
    }
    if ((unint64_t)[v14 count] < 2)
    {
      unsigned int v46 = 0;
    }
    else
    {
      unsigned int v46 = 0;
      v47 = &obja[v139];
      unsigned int v48 = 1;
      do
      {
        int v49 = 0;
        if ([v14 count])
        {
          v50 = v47;
          uint64_t v51 = 1;
          do
          {
            float v52 = *v50;
            [v152 similarityThreshold];
            if (v52 > v53) {
              ++v49;
            }
            unint64_t v54 = [v14 count];
            unint64_t v55 = v51++;
            v50 += v142;
          }
          while (v54 > v55);
        }
        if (v49 > v39)
        {
          unsigned int v46 = v48;
          int v39 = v49;
        }
        ++v48;
        v47 += v139;
      }
      while ([v14 count] > (unint64_t)v48);
    }
    v57 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:20];
    if ([v14 count])
    {
      unint64_t v58 = 0;
      v59 = &obja[v46 * v139];
      do
      {
        float v60 = *v59;
        [v152 similarityThreshold];
        if (v60 > v61)
        {
          if (![v57 count]) {
            goto LABEL_61;
          }
          v62 = [v57 lastObject];
          v63 = [v62 url];
          v64 = [v14 objectAtIndexedSubscript:v58];
          v65 = [v64 url];
          BOOL v66 = v63 == v65;

          if (v66)
          {
            v68 = [v57 lastObject];
            v67 = v68;
            if (v68)
            {
              [v68 timeRange];
            }
            else
            {
              long long v220 = 0u;
              long long v219 = 0u;
              long long v218 = 0u;
            }
            *(_OWORD *)&start.CMTimeValue value = v218;
            start.epoch = v219;
            v69 = [v14 objectAtIndexedSubscript:v58];
            v70 = v69;
            if (v69) {
              [v69 timeRange];
            }
            else {
              memset(&range, 0, sizeof(range));
            }
            CMTimeRangeGetEnd(&end, &range);
            CMTimeRangeFromTimeToTime(&v222, &start, &end);
            v71 = [v57 lastObject];
            CMTimeRange v215 = v222;
            [v71 setTimeRange:&v215];
          }
          else
          {
LABEL_61:
            v67 = [v14 objectAtIndexedSubscript:v58];
            [v57 addObject:v67];
          }

          v72 = [v14 objectAtIndexedSubscript:v58];
          v73 = v72;
          if (v72) {
            [v72 timeRange];
          }
          else {
            memset(&v213, 0, sizeof(v213));
          }
          CMTimeRangeGetEnd(&v214, &v213);
          double v74 = CMTimeGetSeconds(&v214);
          v75 = [v57 lastObject];
          v76 = v75;
          if (v75)
          {
            [v75 timeRange];
          }
          else
          {
            long long v211 = 0u;
            long long v210 = 0u;
            long long v209 = 0u;
          }
          *(_OWORD *)&v212.CMTimeValue value = v209;
          v212.epoch = v210;
          BOOL v77 = v74 - CMTimeGetSeconds(&v212) > 10.0;

          if (v77)
          {
            memset(&buf, 0, sizeof(buf));
            v78 = [v57 lastObject];
            v79 = v78;
            if (v78) {
              [v78 timeRange];
            }
            else {
              memset(&v208, 0, sizeof(v208));
            }
            CMTimeRangeGetEnd(&buf, &v208);

            CMTimeMake(&v206, buf.value - 10 * buf.timescale, buf.timescale);
            CMTime v205 = buf;
            CMTimeRangeFromTimeToTime(&v207, &v206, &v205);
            v80 = [v57 lastObject];
            CMTimeRange v204 = v207;
            [v80 setTimeRange:&v204];
          }
        }
        ++v58;
        v59 += v142;
      }
      while ([v14 count] > v58);
    }
    v136 = [v57 sortedArrayUsingComparator:&unk_1F37F8600];
    unint64_t v81 = (unint64_t)([v136 count] - 1) >> 1;
    v82 = [v136 objectAtIndexedSubscript:v81];
    v83 = v82;
    if (v82) {
      [v82 timeRange];
    }
    else {
      memset(&v203, 0, sizeof(v203));
    }
    CMTimeRangeGetEnd(&v202, &v203);
    CMTimeValue value = v202.value;
    v85 = [v136 objectAtIndexedSubscript:v81];
    v86 = v85;
    if (v85)
    {
      [v85 timeRange];
      uint64_t v87 = v199;
    }
    else
    {
      uint64_t v87 = 0;
      long long v200 = 0u;
      long long v201 = 0u;
      long long v199 = 0u;
    }

    memset(&v205, 0, sizeof(v205));
    v88 = [v136 objectAtIndexedSubscript:v81];
    v89 = v88;
    if (v88)
    {
      [v88 timeRange];
      int32_t v90 = DWORD2(v196);
    }
    else
    {
      int32_t v90 = 0;
      long long v197 = 0u;
      long long v198 = 0u;
      long long v196 = 0u;
    }
    CMTimeValue v133 = value - v87;
    CMTimeMake(&v205, value - v87, v90);

    v91 = [v57 objectAtIndexedSubscript:0];
    if ((unint64_t)[v57 count] >= 2)
    {
      int v137 = 0;
      uint64_t v92 = 1;
      while (1)
      {
        v93 = [v57 objectAtIndexedSubscript:v92];
        v94 = v93;
        if (v93)
        {
          [v93 timeRange];
          CMTimeRangeGetEnd(&v194, &v195);
          CMTimeValue v95 = v194.value;
          [v94 timeRange];
          uint64_t v96 = v191;
          if (!v91) {
            goto LABEL_96;
          }
        }
        else
        {
          memset(&v195, 0, sizeof(v195));
          CMTimeRangeGetEnd(&v194, &v195);
          uint64_t v96 = 0;
          CMTimeValue v95 = v194.value;
          long long v191 = 0u;
          long long v192 = 0u;
          long long v193 = 0u;
          if (!v91)
          {
LABEL_96:
            memset(&v190, 0, sizeof(v190));
            CMTimeRangeGetEnd(&v189, &v190);
            uint64_t v98 = 0;
            CMTimeValue v97 = v189.value;
            long long v186 = 0u;
            long long v187 = 0u;
            long long v188 = 0u;
            goto LABEL_97;
          }
        }
        [v91 timeRange];
        CMTimeRangeGetEnd(&v189, &v190);
        CMTimeValue v97 = v189.value;
        [v91 timeRange];
        uint64_t v98 = v186;
LABEL_97:
        if (v95 - v96 < v97 - v98)
        {
          uint64_t v99 = [v57 objectAtIndexedSubscript:v92];

          int v137 = v92;
          v91 = (void *)v99;
        }
        if (v94)
        {
          [v94 timeRange];
        }
        else
        {
          memset(v184, 0, sizeof(v184));
          long long v183 = 0u;
        }
        CMTime time1 = *(CMTime *)&v184[1];
        if (v91)
        {
          [v91 timeRange];
        }
        else
        {
          memset(v181, 0, sizeof(v181));
          long long v180 = 0u;
        }
        CMTime time2 = *(CMTime *)&v181[1];
        if (CMTimeCompare(&time1, &time2) < 0)
        {
          if (v94)
          {
            [v94 timeRange];
            *(_OWORD *)&v178.CMTimeValue value = v175;
            v178.epoch = v176;
            [v94 timeRange];
            int32_t v100 = DWORD2(v171);
          }
          else
          {
            int32_t v100 = 0;
            long long v176 = 0u;
            long long v177 = 0u;
            long long v175 = 0u;
            memset(&v178, 0, sizeof(v178));
            long long v171 = 0u;
            long long v172 = 0u;
            long long v173 = 0u;
          }
          CMTime buf = v205;
          CMTimeConvertScale(&duration, &buf, v100, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
          CMTimeRangeMake(&v179, &v178, &duration);
          CMTimeRange v170 = v179;
          [v94 setTimeRange:&v170];
        }

        if ([v57 count] <= (unint64_t)++v92) {
          goto LABEL_113;
        }
      }
    }
    int v137 = 0;
LABEL_113:
    CMTimeMake(&v169, 1, 1);
    v168 = 0;
    v134 = sub_1DCB50F90((uint64_t)a1, (long long *)&v169.value, v91, &v168);
    v101 = v168;
    if (!v134)
    {
      obuint64_t j = v101;
      +[SNError populateClientError:withCode:underlyingError:message:](SNError, "populateClientError:withCode:underlyingError:message:", a4, 1);
      v56 = 0;
LABEL_135:

      goto LABEL_136;
    }
    v102 = v101;
    v167 = v101;
    v103 = sub_1DCB511D0((uint64_t)a1, 2, v134, 0, (uint64_t)&unk_1F3819290, &v167);
    v130 = v167;

    if (!v103)
    {
      +[SNError populateClientError:a4 withCode:1 underlyingError:v130 message:@"Error ensuring segment length."];
      v56 = 0;
LABEL_134:

      obuint64_t j = v130;
      goto LABEL_135;
    }
    int v104 = [v103 count];
    v135 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v104];
    if (v104 < 1)
    {
LABEL_119:
      v111 = (void *)MEMORY[0x1E4F1E9A8];
      v112 = objc_msgSend(v135, "objectAtIndexedSubscript:", 0, v130);
      objc_msgSend(v111, "multiArrayByConcatenatingMultiArrays:alongAxis:dataType:", v135, 1, objc_msgSend(v112, "dataType"));
      id v143 = (id)objc_claimAutoreleasedReturnValue();

      int v113 = [v103 count];
      id v114 = objc_alloc(MEMORY[0x1E4F1E9A8]);
      v115 = [NSNumber numberWithInt:48];
      v243[0] = v115;
      int v132 = 96 * v113;
      v116 = objc_msgSend(NSNumber, "numberWithInt:");
      v243[1] = v116;
      v117 = [MEMORY[0x1E4F1C978] arrayWithObjects:v243 count:2];
      v56 = (SNKShotSegmentationResult *)[v114 initWithShape:v117 dataType:65568 error:a4];

      if (!v56)
      {

LABEL_133:
        goto LABEL_134;
      }
      v140 = v56;
      v131 = (float *)[(SNKShotSegmentationResult *)v140 dataPointer];
      id v143 = v143;
      vDSP_mtrans((const float *)[v143 dataPointer], 1, v131, 1, 0x30uLL, v132);
      id objb = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:20];
      int v118 = [v57 count];
      buf.CMTimeValue value = 0;
      *(void *)&buf.timescale = &buf;
      buf.epoch = 0x2020000000;
      int v166 = v137;
      if (v118 < 1)
      {
LABEL_124:
        v56 = objc_alloc_init(SNKShotSegmentationResult);
        [(SNKShotSegmentationResult *)v56 setSegments:objb];
        v127 = [v147 objectAtIndexedSubscript:v137];
        [(SNKShotSegmentationResult *)v56 setExemplarEmbedding:v127];

        v128 = [NSNumber numberWithInteger:*(int *)(*(void *)&buf.timescale + 24)];
        [(SNKShotSegmentationResult *)v56 setExemplarIndex:v128];

        +[SNUtils logKShotSegments:objb exemplarIndex:*(int *)(*(void *)&buf.timescale + 24)];
      }
      else
      {
        uint64_t v119 = 0;
        uint64_t v120 = v118;
        while (1)
        {
          v121 = [v57 objectAtIndexedSubscript:v119];
          v153[0] = MEMORY[0x1E4F143A8];
          v153[1] = 3221225472;
          v153[2] = sub_1DCB54E14;
          v153[3] = &unk_1E6CA7940;
          id v122 = v121;
          id v154 = v122;
          int v160 = v119;
          int v161 = v137;
          id v123 = objb;
          CMTimeValue v157 = v133;
          id v158 = a1;
          uint64_t v162 = 0x6000000010;
          int v163 = 48;
          int v164 = v132;
          v159 = v131;
          id v155 = v123;
          p_CMTime buf = &buf;
          v124 = (void (**)(void))_Block_copy(v153);
          v125 = (void *)MEMORY[0x1E01A90A0]();
          v126 = v124[2](v124);
          if (v126) {
            break;
          }

          if (v120 == ++v119) {
            goto LABEL_124;
          }
        }
        if (a4) {
          *a4 = v126;
        }

        v56 = 0;
      }
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      uint64_t v105 = 0;
      uint64_t v106 = v104;
      while (1)
      {
        v107 = objc_msgSend(v103, "objectAtIndexedSubscript:", v105, v130);
        id v143 = [v107 featureVector];

        v245[0] = &unk_1F3818E28;
        v245[1] = &unk_1F3818E28;
        v108 = [NSNumber numberWithInt:16];
        v245[2] = v108;
        v140 = [MEMORY[0x1E4F1C978] arrayWithObjects:v245 count:3];

        v244[0] = &unk_1F3818E40;
        v109 = [NSNumber numberWithInt:96];
        v244[1] = v109;
        v110 = [NSNumber numberWithInt:48];
        v244[2] = v110;
        id objb = [MEMORY[0x1E4F1C978] arrayWithObjects:v244 count:3];

        v56 = [v143 sliceAtOrigin:v140 shape:objb squeeze:0 error:a4];
        if (!v56) {
          break;
        }
        [v135 addObject:v56];

        if (v106 == ++v105) {
          goto LABEL_119;
        }
      }
    }

    goto LABEL_133;
  }
  unint64_t v31 = 0;
  id v32 = obja;
  while (![v14 count])
  {
LABEL_29:
    ++v31;
    v32 += v139;
    if ([v14 count] <= v31) {
      goto LABEL_30;
    }
  }
  unint64_t v33 = 0;
  id v34 = v32;
  while (1)
  {
    id v35 = [v147 objectAtIndexedSubscript:v31];
    id v36 = [v147 objectAtIndexedSubscript:v33];
    id v37 = +[SNFeaturePrint cosineSimilarityBetweenOneFeatureVector:v35 andAnotherFeatureVector:v36 error:a4];

    if (!v37) {
      break;
    }
    [v37 floatValue];
    *(_DWORD *)id v34 = v38;

    ++v33;
    v34 += v142;
    if ([v14 count] <= v33) {
      goto LABEL_29;
    }
  }
  obuint64_t j = 0;
  v56 = 0;
LABEL_136:
  id v14 = v138;
LABEL_137:

LABEL_138:

  return v56;
}

+ (id)featurizeFiles:(id)a3 randomNumberGenerator:(id)a4 hallucinatorModelURL:(id)a5 error:(id *)a6
{
  uint64_t v8 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc_init(v8);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v16 = objc_alloc_init(SNBooleanCancellable);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1DCB56920;
  aBlock[3] = &unk_1E6CA7858;
  id v17 = v12;
  id v35 = v17;
  id v18 = v13;
  id v36 = v18;
  id v19 = v14;
  id v37 = v19;
  id v20 = v15;
  id v38 = v20;
  id v21 = _Block_copy(aBlock);
  id v22 = a1;
  v29 = v16;
  id v23 = sub_1DCB51D80((uint64_t)v22, v11, v10, v9, v16, v21, a6);

  if (v23)
  {
    id v24 = objc_alloc_init(SNKShotFeaturizationResult);
    [(SNKShotFeaturizationResult *)v24 setTrainingDataEmbeddings:v17];
    [(SNKShotFeaturizationResult *)v24 setTrainingDataLabels:v18];
    [(SNKShotFeaturizationResult *)v24 setValidationDataEmbeddings:v19];
    [(SNKShotFeaturizationResult *)v24 setValidationDataLabels:v20];
    [v23 inferenceWindowSize];
    long long v30 = v32;
    uint64_t v31 = v33;
    [(SNKShotFeaturizationResult *)v24 setInferenceWindowSize:&v30];
    id v25 = [v23 exemplar];
    [(SNKShotFeaturizationResult *)v24 setExemplar:v25];
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

+ (id)readNumRepetitionsPerTimeShiftFromHallucinator:(id)a3 error:(id *)a4
{
  uint64_t v5 = [a3 modelDescription];
  float64x2_t v6 = [v5 metadata];
  int32x2_t v7 = [v6 objectForKeyedSubscript:@"MLModelCreatorDefinedKey"];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"iterationsPerTimeshift"];

  if (v8)
  {
    id v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "integerValue"));
  }
  else
  {
    id v10 = [NSString stringWithFormat:@"could not read key from hallucinator metadata: %@", @"iterationsPerTimeshift"];
    +[SNError populateClientError:a4 withCode:4 underlyingError:0 message:v10];

    id v9 = 0;
  }

  return v9;
}

+ (id)readNumTimeShiftsPerSegmentFromHallucinator:(id)a3 error:(id *)a4
{
  uint64_t v5 = [a3 modelDescription];
  float64x2_t v6 = [v5 metadata];
  int32x2_t v7 = [v6 objectForKeyedSubscript:@"MLModelCreatorDefinedKey"];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"timeshiftsPerSegment"];

  if (v8)
  {
    id v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "integerValue"));
  }
  else
  {
    id v10 = [NSString stringWithFormat:@"could not read key from hallucinator metadata: %@", @"timeshiftsPerSegment"];
    +[SNError populateClientError:a4 withCode:4 underlyingError:0 message:v10];

    id v9 = 0;
  }

  return v9;
}

+ (BOOL)ensureIsValidHallucinatorV3Model:(id)a3 error:(id *)a4
{
  v64[7] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int32x2_t v7 = [v6 modelDescription];
  uint64_t v8 = [v7 inputDescriptionsByName];

  id v9 = [v6 modelDescription];
  id v10 = [v9 outputDescriptionsByName];

  id v11 = [a1 readNumRepetitionsPerTimeShiftFromHallucinator:v6 error:a4];

  if (v11)
  {
    id v12 = [a1 readNumTimeShiftsPerSegmentFromHallucinator:v6 error:a4];

    if (v12)
    {
      v64[0] = @"foreground";
      v64[1] = @"background";
      v64[2] = @"shiftIteration";
      v64[3] = @"stateIn";
      v64[4] = @"set";
      v64[5] = @"shiftedSamples";
      v64[6] = @"segmentLength";
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:7];
      v63[0] = @"embedding";
      v63[1] = @"label";
      v63[2] = @"stateOut";
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:3];
      id v15 = [v6 modelDescription];
      BOOL v16 = +[SNValidateModel ensureModelDescription:v15 hasInputFeatureNames:v13 hasOutputFeatureNames:v14 error:a4];

      if (v16)
      {
        id v17 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", 1, 0x7FFFFFFFFFFFFFFFLL);
        v62[0] = v17;
        id v18 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", 1, 1);
        v62[1] = v18;
        id v19 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", 1000, 319001);
        v62[2] = v19;
        id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:3];

        id v21 = @"foreground";
        id v22 = [v8 objectForKeyedSubscript:@"foreground"];
        id v60 = 0;
        BOOL v23 = +[SNValidateModel ensureFeatureWithDescription:v22 isOptional:0 isMultiArrayWithDataType:65568 dimensionSizeRanges:v20 error:&v60];
        id v24 = v60;
        id v25 = v24;
        if (!v23) {
          goto LABEL_17;
        }

        id v26 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", 1, 0x7FFFFFFFFFFFFFFFLL);
        v61[0] = v26;
        id v27 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", 1, 1);
        v61[1] = v27;
        id v28 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", 1000, 319001);
        v61[2] = v28;
        id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:3];

        id v21 = @"background";
        id v22 = [v8 objectForKeyedSubscript:@"background"];
        id v59 = 0;
        BOOL v29 = +[SNValidateModel ensureFeatureWithDescription:v22 isOptional:0 isMultiArrayWithDataType:65568 dimensionSizeRanges:v20 error:&v59];
        id v30 = v59;
        id v25 = v30;
        if (v29)
        {

          uint64_t v31 = @"shiftIteration";
          id v20 = [v8 objectForKeyedSubscript:@"shiftIteration"];
          id v58 = 0;
          BOOL v32 = +[SNValidateModel ensureFeatureWithDescription:v20 isOptional:0 isMultiArrayWithDataType:65568 shapeOptions:&unk_1F3818E88 error:&v58];
          id v33 = v58;
          id v22 = v33;
          if (!v32) {
            goto LABEL_18;
          }

          uint64_t v31 = @"stateIn";
          id v20 = [v8 objectForKeyedSubscript:@"stateIn"];
          id v57 = 0;
          BOOL v34 = +[SNValidateModel ensureFeatureWithDescription:v20 isOptional:1 error:&v57];
          id v35 = v57;
          id v22 = v35;
          if (!v34) {
            goto LABEL_18;
          }

          uint64_t v31 = @"set";
          id v20 = [v8 objectForKeyedSubscript:@"set"];
          id v56 = 0;
          BOOL v36 = +[SNValidateModel ensureFeatureWithDescription:v20 isOptional:1 isMultiArrayWithDataType:65568 shapeOptions:&unk_1F3818EB8 error:&v56];
          id v37 = v56;
          id v22 = v37;
          if (!v36) {
            goto LABEL_18;
          }

          uint64_t v31 = @"shiftedSamples";
          id v20 = [v8 objectForKeyedSubscript:@"shiftedSamples"];
          id v55 = 0;
          BOOL v38 = +[SNValidateModel ensureFeatureWithDescription:v20 isOptional:1 isMultiArrayWithDataType:65568 shapeOptions:&unk_1F3818EE8 error:&v55];
          id v39 = v55;
          id v22 = v39;
          if (!v38) {
            goto LABEL_18;
          }

          uint64_t v31 = @"segmentLength";
          id v20 = [v8 objectForKeyedSubscript:@"segmentLength"];
          id v54 = 0;
          BOOL v40 = +[SNValidateModel ensureFeatureWithDescription:v20 isOptional:1 isMultiArrayWithDataType:65568 shapeOptions:&unk_1F3818F18 error:&v54];
          id v41 = v54;
          id v22 = v41;
          if (v40)
          {

            float v42 = @"embedding";
            id v20 = [v10 objectForKeyedSubscript:@"embedding"];
            id v53 = 0;
            BOOL v43 = +[SNValidateModel ensureFeatureWithDescription:v20 isOptional:0 isFreelyShapedMultiArrayWithDataType:65568 error:&v53];
            id v44 = v53;
            id v22 = v44;
            if (v43)
            {

              float v42 = @"label";
              id v20 = [v10 objectForKeyedSubscript:@"label"];
              id v52 = 0;
              BOOL v45 = +[SNValidateModel ensureFeatureWithDescription:v20 isOptional:0 isMultiArrayWithDataType:65568 shapeOptions:&unk_1F3818F48 error:&v52];
              id v46 = v52;
              id v22 = v46;
              if (v45)
              {

                float v42 = @"stateOut";
                id v20 = [v10 objectForKeyedSubscript:@"stateOut"];
                id v51 = 0;
                BOOL v47 = +[SNValidateModel ensureFeatureWithDescription:v20 isOptional:0 error:&v51];
                id v22 = v51;
                if (v47)
                {
                  BOOL v48 = 1;
LABEL_21:

                  goto LABEL_16;
                }
              }
            }
            [NSString stringWithFormat:@"invalid specification for output feature: '%@'", v42];
          }
          else
          {
LABEL_18:
            [NSString stringWithFormat:@"invalid specification for input feature: '%@'", v31];
          id v25 = };
          +[SNError populateClientError:a4 withCode:4 underlyingError:v22 message:v25];
        }
        else
        {
LABEL_17:
          v50 = [NSString stringWithFormat:@"invalid specification for input feature: '%@'", v21];
          +[SNError populateClientError:a4 withCode:4 underlyingError:v25 message:v50];
        }
        BOOL v48 = 0;
        goto LABEL_21;
      }
    }
  }
  BOOL v48 = 0;
LABEL_16:

  return v48;
}

+ (int)recognizeHallucinatorModel:(id)a3 error:(id *)a4
{
  return [a1 ensureIsValidHallucinatorV3Model:a3 error:a4];
}

+ (id)labelFromNumberRepresentation:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 unsignedIntegerValue];
  if (v6 == 1)
  {
    id v7 = [[SNKShotLabel alloc] initAsPositiveLabel];
    goto LABEL_5;
  }
  if (!v6)
  {
    id v7 = [[SNKShotLabel alloc] initAsNegativeLabel];
LABEL_5:
    uint64_t v8 = v7;
    goto LABEL_7;
  }
  id v9 = [NSString stringWithFormat:@"could not translate number to label: %@", v5];
  +[SNError populateClientError:a4 withCode:1 underlyingError:0 message:v9];

  uint64_t v8 = 0;
LABEL_7:

  return v8;
}

+ (id)streamResultWithEmbedding:(id)a3 label:(id)a4 dataset:(int64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = [a1 labelFromNumberRepresentation:a4 error:a6];
  if (v11)
  {
    id v12 = objc_alloc_init(SNKShotFeaturizationStreamResult);
    [(SNKShotFeaturizationStreamResult *)v12 setDatasetType:a5];
    [(SNKShotFeaturizationStreamResult *)v12 setData:v10];
    [(SNKShotFeaturizationStreamResult *)v12 setLabel:v11];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (id)streamResultsForDatasetType:(int64_t)a3 embeddings:(id)a4 labels:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = [MEMORY[0x1E4F1CA48] array];
  if ([v10 count])
  {
    uint64_t v13 = 0;
    while (1)
    {
      id v14 = [v10 objectAtIndexedSubscript:v13];
      id v15 = [v11 objectAtIndexedSubscript:v13];
      if (!v15 || !v14)
      {
        +[SNError populateClientError:a6 withCode:1 underlyingError:0 message:@"expected same number of embeddings and labels"];
        goto LABEL_10;
      }
      uint64_t v16 = [a1 streamResultWithEmbedding:v14 label:v15 dataset:a3 error:a6];
      if (!v16) {
        break;
      }
      id v17 = (void *)v16;
      [v12 addObject:v16];

      if ([v10 count] <= (unint64_t)++v13) {
        goto LABEL_11;
      }
    }

    id v12 = 0;
LABEL_10:
  }
LABEL_11:

  return v12;
}

+ (id)streamResultsFromFeaturizationResult:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 trainingDataEmbeddings];
  uint64_t v8 = [v6 trainingDataLabels];
  id v9 = [a1 streamResultsForDatasetType:0 embeddings:v7 labels:v8 error:a4];

  if (v9)
  {
    id v10 = [v6 validationDataEmbeddings];
    id v11 = [v6 validationDataLabels];
    id v12 = [a1 streamResultsForDatasetType:1 embeddings:v10 labels:v11 error:a4];

    if (v12)
    {
      uint64_t v13 = [v9 arrayByAddingObjectsFromArray:v12];
      goto LABEL_6;
    }
  }
  else
  {
    id v12 = 0;
  }
  uint64_t v13 = 0;
LABEL_6:

  return v13;
}

+ (id)streamCompletionFromFeaturizationResult:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(SNKShotFeaturizationStreamCompletion);
  if (v3)
  {
    [v3 inferenceWindowSize];
  }
  else
  {
    long long v9 = 0uLL;
    uint64_t v10 = 0;
  }
  long long v7 = v9;
  uint64_t v8 = v10;
  [(SNKShotFeaturizationStreamCompletion *)v4 setInferenceWindowSize:&v7];
  id v5 = [v3 exemplar];
  [(SNKShotFeaturizationStreamCompletion *)v4 setExemplar:v5];

  return v4;
}

@end