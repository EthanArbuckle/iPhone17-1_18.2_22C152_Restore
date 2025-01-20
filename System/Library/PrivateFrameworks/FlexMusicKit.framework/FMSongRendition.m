@interface FMSongRendition
+ (id)coalesceMixParamsA:(id)a3 withMixParamsB:(id)a4;
- (FMSongRendition)initWithSong:(id)a3 andOptions:(id)a4;
- (FMTrack)trackA;
- (FMTrack)trackB;
- (FlexSongProtocol)song;
- (NSDictionary)options;
- (double)_maxPeakAndLoudness:(double *)a3 missingPeakValueCount:(int *)a4 missingLoudnessCount:(int *)a5;
- (id)_buildOutroFadeoutMixParams;
- (id)avCompositionWithAudioMix:(id *)a3 includeShortenedOutroFadeOut:(BOOL)a4;
- (id)description;
- (id)timedMetadataItemsWithIdentifier:(id)a3;
- (int64_t)duration;
- (int64_t)durationOfMusic;
- (int64_t)durationOfSilence;
- (void)setDuration:(int64_t)a3;
- (void)setDurationOfMusic:(int64_t)a3;
- (void)setDurationOfSilence:(int64_t)a3;
- (void)setSong:(id)a3;
- (void)setTrackA:(id)a3;
- (void)setTrackB:(id)a3;
@end

@implementation FMSongRendition

- (FMSongRendition)initWithSong:(id)a3 andOptions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FMSongRendition;
  v9 = [(FMSongRendition *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_song, a3);
    objc_storeStrong((id *)&v10->_options, a4);
  }

  return v10;
}

- (id)description
{
  v6 = NSString;
  id v7 = objc_msgSend_trackA(self, a2, v2, v3, v4);
  objc_super v12 = objc_msgSend_description(v7, v8, v9, v10, v11);
  v16 = objc_msgSend_stringWithFormat_(v6, v13, @"\nTrackA: %@", v14, v15, v12);
  v20 = objc_msgSend_stringByAppendingString_(@"\nFMTracks:", v17, (uint64_t)v16, v18, v19);

  v21 = NSString;
  v26 = objc_msgSend_trackB(self, v22, v23, v24, v25);
  v31 = objc_msgSend_description(v26, v27, v28, v29, v30);
  v35 = objc_msgSend_stringWithFormat_(v21, v32, @"\nTrackB: %@", v33, v34, v31);
  v39 = objc_msgSend_stringByAppendingString_(v20, v36, (uint64_t)v35, v37, v38);

  return v39;
}

+ (id)coalesceMixParamsA:(id)a3 withMixParamsB:(id)a4
{
  uint64_t v223 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v11 = v6;
  if (!v6) {
    goto LABEL_4;
  }
  objc_super v12 = objc_msgSend_volumeKeyFrames(v6, v7, v8, v9, v10);
  if (objc_msgSend_count(v12, v13, v14, v15, v16) == 1)
  {
    v21 = objc_msgSend_volumeKeyFrames(v11, v17, v18, v19, v20);
    v26 = objc_msgSend_lastObject(v21, v22, v23, v24, v25);
    objc_msgSend_value(v26, v27, v28, v29, v30);
    float v32 = v31;

    if (v32 == 1.0)
    {
LABEL_4:
      id v37 = v5;
LABEL_10:
      v59 = v37;
      goto LABEL_11;
    }
  }
  else
  {
  }
  if (!v5)
  {
LABEL_9:
    id v37 = v11;
    goto LABEL_10;
  }
  uint64_t v38 = objc_msgSend_volumeKeyFrames(v5, v33, v34, v35, v36);
  if (objc_msgSend_count(v38, v39, v40, v41, v42) == 1)
  {
    v47 = objc_msgSend_volumeKeyFrames(v5, v43, v44, v45, v46);
    v52 = objc_msgSend_lastObject(v47, v48, v49, v50, v51);
    objc_msgSend_value(v52, v53, v54, v55, v56);
    float v58 = v57;

    if (v58 == 1.0) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  v59 = objc_opt_new();
  long long v215 = 0u;
  long long v216 = 0u;
  long long v217 = 0u;
  long long v218 = 0u;
  v65 = objc_msgSend_volumeKeyFrames(v5, v61, v62, v63, v64);
  uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v66, (uint64_t)&v215, (uint64_t)v222, 16);
  if (v67)
  {
    uint64_t v68 = v67;
    uint64_t v69 = *(void *)v216;
    do
    {
      for (uint64_t i = 0; i != v68; ++i)
      {
        if (*(void *)v216 != v69) {
          objc_enumerationMutation(v65);
        }
        v71 = *(void **)(*((void *)&v215 + 1) + 8 * i);
        v72 = [FMKeyFrame alloc];
        uint64_t v77 = objc_msgSend_sampleTime(v71, v73, v74, v75, v76);
        v81 = objc_msgSend_initWithValue_atTime_(v72, v78, v77, v79, v80, 0.0);
        objc_msgSend_appendVolumeKeyframe_(v59, v82, (uint64_t)v81, v83, v84);
      }
      uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v85, (uint64_t)&v215, (uint64_t)v222, 16);
    }
    while (v68);
  }

  long long v213 = 0u;
  long long v214 = 0u;
  long long v211 = 0u;
  long long v212 = 0u;
  v90 = objc_msgSend_volumeKeyFrames(v11, v86, v87, v88, v89);
  uint64_t v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v90, v91, (uint64_t)&v211, (uint64_t)v221, 16);
  if (v92)
  {
    uint64_t v93 = v92;
    uint64_t v94 = *(void *)v212;
    do
    {
      for (uint64_t j = 0; j != v93; ++j)
      {
        if (*(void *)v212 != v94) {
          objc_enumerationMutation(v90);
        }
        v96 = *(void **)(*((void *)&v211 + 1) + 8 * j);
        v97 = [FMKeyFrame alloc];
        uint64_t v102 = objc_msgSend_sampleTime(v96, v98, v99, v100, v101);
        v106 = objc_msgSend_initWithValue_atTime_(v97, v103, v102, v104, v105, 0.0);
        objc_msgSend_insertVolumeKeyframe_(v59, v107, (uint64_t)v106, v108, v109);
      }
      uint64_t v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(v90, v110, (uint64_t)&v211, (uint64_t)v221, 16);
    }
    while (v93);
  }

  v111 = objc_opt_new();
  v116 = objc_msgSend_volumeKeyFrames(v59, v112, v113, v114, v115);
  if (objc_msgSend_count(v116, v117, v118, v119, v120) != 1)
  {
    unint64_t v124 = 0;
    do
    {
      v125 = objc_msgSend_objectAtIndexedSubscript_(v116, v121, v124, v122, v123);
      uint64_t v130 = objc_msgSend_sampleTime(v125, v126, v127, v128, v129);

      v134 = objc_msgSend_objectAtIndexedSubscript_(v116, v131, ++v124, v132, v133);
      uint64_t v139 = objc_msgSend_sampleTime(v134, v135, v136, v137, v138);

      uint64_t v140 = v139 + v130;
      if (v139 + v130 < 0 != __OFADD__(v139, v130)) {
        ++v140;
      }
      uint64_t v141 = v140 >> 1;
      v142 = [FMKeyFrame alloc];
      v146 = objc_msgSend_initWithValue_atTime_(v142, v143, v141, v144, v145, 0.0);
      objc_msgSend_addObject_(v111, v147, (uint64_t)v146, v148, v149);
    }
    while (v124 < objc_msgSend_count(v116, v150, v151, v152, v153) - 1);
  }
  v202 = v116;
  long long v209 = 0u;
  long long v210 = 0u;
  long long v207 = 0u;
  long long v208 = 0u;
  id v154 = v111;
  uint64_t v156 = objc_msgSend_countByEnumeratingWithState_objects_count_(v154, v155, (uint64_t)&v207, (uint64_t)v220, 16);
  if (v156)
  {
    uint64_t v160 = v156;
    uint64_t v161 = *(void *)v208;
    do
    {
      for (uint64_t k = 0; k != v160; ++k)
      {
        if (*(void *)v208 != v161) {
          objc_enumerationMutation(v154);
        }
        objc_msgSend_insertVolumeKeyframe_(v59, v157, *(void *)(*((void *)&v207 + 1) + 8 * k), v158, v159);
      }
      uint64_t v160 = objc_msgSend_countByEnumeratingWithState_objects_count_(v154, v157, (uint64_t)&v207, (uint64_t)v220, 16);
    }
    while (v160);
  }

  long long v205 = 0u;
  long long v206 = 0u;
  long long v203 = 0u;
  long long v204 = 0u;
  v167 = objc_msgSend_volumeKeyFrames(v59, v163, v164, v165, v166);
  uint64_t v169 = objc_msgSend_countByEnumeratingWithState_objects_count_(v167, v168, (uint64_t)&v203, (uint64_t)v219, 16);
  if (v169)
  {
    uint64_t v174 = v169;
    uint64_t v175 = *(void *)v204;
    do
    {
      for (uint64_t m = 0; m != v174; ++m)
      {
        if (*(void *)v204 != v175) {
          objc_enumerationMutation(v167);
        }
        v177 = *(void **)(*((void *)&v203 + 1) + 8 * m);
        uint64_t v178 = objc_msgSend_sampleTime(v177, v170, v171, v172, v173);
        objc_msgSend_volumeValueAtTime_(v5, v179, v178, v180, v181);
        float v183 = v182;
        uint64_t v188 = objc_msgSend_sampleTime(v177, v184, v185, v186, v187);
        objc_msgSend_volumeValueAtTime_(v11, v189, v188, v190, v191);
        if (fabsf(v183) == INFINITY) {
          float v197 = 1.0;
        }
        else {
          float v197 = v183;
        }
        if (fabsf(*(float *)&v196) == INFINITY) {
          *(float *)&double v196 = 1.0;
        }
        *(float *)&double v196 = v197 * *(float *)&v196;
        objc_msgSend_setValue_(v177, v192, v193, v194, v195, v196);
      }
      uint64_t v174 = objc_msgSend_countByEnumeratingWithState_objects_count_(v167, v170, (uint64_t)&v203, (uint64_t)v219, 16);
    }
    while (v174);
  }

  objc_msgSend_removeRedundantVolumeKeyFrames(v59, v198, v199, v200, v201);
LABEL_11:

  return v59;
}

- (id)avCompositionWithAudioMix:(id *)a3 includeShortenedOutroFadeOut:(BOOL)a4
{
  BOOL v5 = a4;
  uint64_t v241 = *MEMORY[0x263EF8340];
  objc_msgSend_composition(MEMORY[0x263EFA788], a2, (uint64_t)a3, a4, v4);
  id v211 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = objc_msgSend_song(self, v7, v8, v9, v10);
  int32_t timescale = objc_msgSend_sampleRate(v11, v12, v13, v14, v15);

  if (v5
    && (objc_msgSend_options(self, v16, v17, v18, v19),
        uint64_t v20 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKey_(v20, v21, @"OutroCanBeShortened", v22, v23),
        uint64_t v24 = objc_claimAutoreleasedReturnValue(),
        int v29 = objc_msgSend_BOOLValue(v24, v25, v26, v27, v28),
        v24,
        v20,
        v29))
  {
    long long v210 = objc_msgSend__buildOutroFadeoutMixParams(self, v16, v17, v18, v19);
  }
  else
  {
    long long v210 = 0;
  }
  long long v213 = 0;
  uint64_t v30 = *MEMORY[0x263EF9CE8];
  uint64_t v221 = *MEMORY[0x263EFA288];
  char v31 = 1;
  uint64_t v219 = *MEMORY[0x263EF9CE8];
  long long v216 = self;
  do
  {
    char v32 = v31;
    if (v31) {
      objc_msgSend_trackA(self, v16, v17, v18, v19);
    }
    else {
    uint64_t v35 = objc_msgSend_trackB(self, v16, v17, v18, v19);
    }
    if (!v35) {
      goto LABEL_43;
    }
    char v214 = v32;
    long long v217 = objc_msgSend_addMutableTrackWithMediaType_preferredTrackID_(v211, v33, v30, 0, v34);
    long long v233 = 0u;
    long long v234 = 0u;
    long long v235 = 0u;
    long long v236 = 0u;
    long long v215 = v35;
    objc_msgSend_clips(v35, v36, v37, v38, v39);
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v40, (uint64_t)&v233, (uint64_t)v240, 16);
    if (!v41) {
      goto LABEL_27;
    }
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v234;
    do
    {
      for (uint64_t i = 0; i != v42; ++i)
      {
        if (*(void *)v234 != v43) {
          objc_enumerationMutation(obj);
        }
        uint64_t v45 = *(void **)(*((void *)&v233 + 1) + 8 * i);
        uint64_t v46 = (void *)MEMORY[0x21D453880]();
        uint64_t v51 = objc_msgSend_url(v45, v47, v48, v49, v50);

        if (v51)
        {
          uint64_t v56 = (void *)MEMORY[0x263EFA8D0];
          float v57 = objc_msgSend_url(v45, v52, v53, v54, v55);
          uint64_t v238 = v221;
          uint64_t v239 = MEMORY[0x263EFFA88];
          v59 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v58, (uint64_t)&v239, (uint64_t)&v238, 1);
          uint64_t v62 = objc_msgSend_URLAssetWithURL_options_(v56, v60, (uint64_t)v57, (uint64_t)v59, v61);

          dispatch_semaphore_t v63 = dispatch_semaphore_create(0);
          v231[0] = MEMORY[0x263EF8330];
          v231[1] = 3221225472;
          v231[2] = sub_217A34578;
          v231[3] = &unk_2642B6D78;
          uint64_t v64 = v63;
          v232 = v64;
          objc_msgSend_loadValuesAsynchronouslyForKeys_completionHandler_(v62, v65, (uint64_t)&unk_26C806FD0, (uint64_t)v231, v66);
          dispatch_time_t v67 = dispatch_time(0, 20000000000);
          if (dispatch_semaphore_wait(v64, v67))
          {
            v71 = FlexLogForCategory(0);
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v76 = objc_msgSend_url(v45, v72, v73, v74, v75);
              LODWORD(buf.start.value) = 138412290;
              *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v76;
              _os_log_impl(&dword_217A2F000, v71, OS_LOG_TYPE_DEFAULT, "Timed out waiting for tracks to load for asset: \"%@\"", (uint8_t *)&buf, 0xCu);
              goto LABEL_23;
            }
          }
          else
          {
            v71 = objc_msgSend_tracksWithMediaType_(v62, v68, v30, v69, v70);
            if (objc_msgSend_count(v71, v77, v78, v79, v80))
            {
              uint64_t v84 = objc_msgSend_tracksWithMediaType_(v62, v81, v30, v82, v83);
              uint64_t v76 = objc_msgSend_objectAtIndex_(v84, v85, 0, v86, v87);

              int64_t v92 = objc_msgSend_offset(v45, v88, v89, v90, v91);
              CMTimeMake(&start, v92, timescale);
              int64_t v97 = objc_msgSend_duration(v45, v93, v94, v95, v96);
              CMTimeMake(&duration, v97, timescale);
              CMTimeRangeMake(&v230, &start, &duration);
              int64_t v102 = objc_msgSend_position(v45, v98, v99, v100, v101);
              uint64_t v30 = v219;
              CMTimeMake(&v227, v102, timescale);
              objc_msgSend_insertTimeRange_ofTrack_atTime_error_(v217, v103, (uint64_t)&v230, (uint64_t)v76, (uint64_t)&v227, 0);
            }
            else
            {
              uint64_t v76 = FlexLogForCategory(0);
              if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v108 = objc_msgSend_url(v45, v104, v105, v106, v107);
                LODWORD(buf.start.value) = 138412290;
                *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)v108;
                _os_log_impl(&dword_217A2F000, v76, OS_LOG_TYPE_DEFAULT, "0 audio tracks found in asset: \"%@\"", (uint8_t *)&buf, 0xCu);

                uint64_t v30 = v219;
              }
            }
LABEL_23:
          }
        }
      }
      uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v109, (uint64_t)&v233, (uint64_t)v240, 16);
    }
    while (v42);
LABEL_27:

    if (!a3) {
      goto LABEL_41;
    }
    uint64_t v35 = v215;
    uint64_t v114 = objc_msgSend_mixParameters(v215, v110, v111, v112, v113);

    if (v114)
    {
      uint64_t v119 = (uint64_t)v213;
      if (!v213)
      {
        uint64_t v119 = objc_msgSend_array(MEMORY[0x263EFF980], v115, v116, v117, v118);
      }
      long long v213 = (void *)v119;
      uint64_t v120 = objc_msgSend_audioMixInputParametersWithTrack_(MEMORY[0x263EFA780], v115, (uint64_t)v217, v117, v118, v210);
      v125 = objc_msgSend_mixParameters(v215, v121, v122, v123, v124);
      uint64_t v128 = objc_msgSend_coalesceMixParamsA_withMixParamsB_(FMSongRendition, v126, (uint64_t)v125, (uint64_t)v210, v127);

      uint64_t v133 = objc_msgSend_volumeKeyFrames(v128, v129, v130, v131, v132);
      uint64_t v138 = objc_msgSend_count(v133, v134, v135, v136, v137);
      uint64_t v142 = v138 - 1;
      if (v138 >= 1)
      {
        uint64_t v143 = v138;
        uint64_t v144 = 0;
        do
        {
          uint64_t v149 = objc_msgSend_objectAtIndexedSubscript_(v133, v139, v144, v140, v141);
          if (v144 < v142
            && (objc_msgSend_objectAtIndexedSubscript_(v133, v145, v144 + 1, v147, v148),
                (uint64_t v150 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            uint64_t v151 = (void *)v150;
            memset(&buf, 0, sizeof(buf));
            int64_t v152 = objc_msgSend_sampleTime(v149, v145, v146, v147, v148);
            CMTimeMake(&v226, v152, timescale);
            uint64_t v157 = objc_msgSend_sampleTime(v151, v153, v154, v155, v156);
            uint64_t v162 = objc_msgSend_sampleTime(v149, v158, v159, v160, v161);
            CMTimeMake(&v225, v157 - v162, timescale);
            CMTimeRangeMake(&buf, &v226, &v225);
            objc_msgSend_value(v149, v163, v164, v165, v166);
            unsigned int v168 = v167;
            objc_msgSend_value(v151, v169, v170, v171, v172);
            LODWORD(v174) = v173;
            CMTimeRange v224 = buf;
            objc_msgSend_setVolumeRampFromStartVolume_toEndVolume_timeRange_(v120, v175, (uint64_t)&v224, v176, v177, COERCE_DOUBLE(__PAIR64__(buf.duration.flags, v168)), v174);

            ++v144;
          }
          else
          {
            memset(&buf, 0, sizeof(buf));
            int64_t v178 = objc_msgSend_sampleTime(v149, v145, v146, v147, v148);
            CMTimeMake(&v223, v178, timescale);
            uint64_t v183 = objc_msgSend_duration(v216, v179, v180, v181, v182);
            uint64_t v188 = objc_msgSend_sampleTime(v149, v184, v185, v186, v187);
            CMTimeMake(&v222, v183 - v188, timescale);
            CMTimeRangeMake(&buf, &v223, &v222);
            if (buf.duration.value >= 1)
            {
              objc_msgSend_value(v149, v189, v190, v191, v192);
              unsigned int v194 = v193;
              objc_msgSend_value(v149, v195, v196, v197, v198);
              LODWORD(v200) = v199;
              CMTimeRange v224 = buf;
              objc_msgSend_setVolumeRampFromStartVolume_toEndVolume_timeRange_(v120, v201, (uint64_t)&v224, v202, v203, COERCE_DOUBLE(__PAIR64__(buf.duration.flags, v194)), v200);
            }
            ++v144;
          }
          uint64_t v30 = v219;
        }
        while (v144 != v143);
      }
      objc_msgSend_addObject_(v213, v139, (uint64_t)v120, v140, v141);

LABEL_41:
      uint64_t v35 = v215;
    }

    self = v216;
    char v32 = v214;
LABEL_43:

    char v31 = 0;
  }
  while ((v32 & 1) != 0);
  if (a3)
  {
    if (v213)
    {
      long long v204 = objc_msgSend_audioMix(MEMORY[0x263EFA778], v16, v17, v18, v19);
      objc_msgSend_setInputParameters_(v204, v205, (uint64_t)v213, v206, v207);
    }
    else
    {
      long long v204 = 0;
    }
    id v208 = v204;
    *a3 = v208;
  }
  return v211;
}

- (id)timedMetadataItemsWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_song(self, v5, v6, v7, v8);
  objc_super v12 = objc_msgSend_timedMetadataItemsWithIdentifier_forRendition_(v9, v10, (uint64_t)v4, (uint64_t)self, v11);

  return v12;
}

- (double)_maxPeakAndLoudness:(double *)a3 missingPeakValueCount:(int *)a4 missingLoudnessCount:(int *)a5
{
  uint64_t v33 = 0;
  uint64_t v34 = (double *)&v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = (double *)&v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = (double *)&v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  uint64_t v8 = objc_msgSend_timedMetadataItemsWithIdentifier_(self, a2, @"FMTimedMetadataIdentifierSegment", (uint64_t)a4, (uint64_t)a5);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_217A347F8;
  v16[3] = &unk_2642B6DA0;
  v16[4] = &v33;
  v16[5] = &v21;
  v16[6] = &v29;
  v16[7] = &v25;
  v16[8] = &v17;
  objc_msgSend_enumerateObjectsUsingBlock_(v8, v9, (uint64_t)v16, v10, v11);
  if (a3)
  {
    double v12 = v26[3];
    if (v12 <= 0.0) {
      double v13 = -INFINITY;
    }
    else {
      double v13 = v30[3] / v12;
    }
    v30[3] = v13;
    *a3 = v13;
  }
  if (a4) {
    *a4 = *((_DWORD *)v22 + 6);
  }
  if (a5) {
    *a5 = *((_DWORD *)v18 + 6);
  }
  double v14 = v34[3];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  return v14;
}

- (id)_buildOutroFadeoutMixParams
{
  return 0;
}

- (FMTrack)trackA
{
  return self->_trackA;
}

- (void)setTrackA:(id)a3
{
}

- (FMTrack)trackB
{
  return self->_trackB;
}

- (void)setTrackB:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (int64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(int64_t)a3
{
  self->_CMTime duration = a3;
}

- (int64_t)durationOfSilence
{
  return self->_durationOfSilence;
}

- (void)setDurationOfSilence:(int64_t)a3
{
  self->_durationOfSilence = a3;
}

- (int64_t)durationOfMusic
{
  return self->_durationOfMusic;
}

- (void)setDurationOfMusic:(int64_t)a3
{
  self->_durationOfMusic = a3;
}

- (FlexSongProtocol)song
{
  return self->_song;
}

- (void)setSong:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_song, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_trackB, 0);
  objc_storeStrong((id *)&self->_trackA, 0);
}

@end