@interface FlexMLSongRendition
- (FlexMLSongRendition)initWithSong:(id)a3 options:(id)a4 andSummary:(id)a5 forDuration:(id *)a6;
- (FlexMLSummary)summary;
- (id)_buildOutroFadeoutMixParams;
- (void)_buildTracks;
- (void)_calculateDuration:(id *)a3;
- (void)setSummary:(id)a3;
@end

@implementation FlexMLSongRendition

- (FlexMLSongRendition)initWithSong:(id)a3 options:(id)a4 andSummary:(id)a5 forDuration:(id *)a6
{
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)FlexMLSongRendition;
  v12 = [(FMSongRendition *)&v24 initWithSong:a3 andOptions:a4];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_summary, a5);
    long long v22 = *(_OWORD *)&a6->var0;
    int64_t var3 = a6->var3;
    objc_msgSend__calculateDuration_(v13, v14, (uint64_t)&v22, v15, v16);
    objc_msgSend__buildTracks(v13, v17, v18, v19, v20);
  }

  return v13;
}

- (void)_calculateDuration:(id *)a3
{
  v7 = objc_msgSend_song(self, a2, (uint64_t)a3, v3, v4);
  int32_t v12 = objc_msgSend_sampleRate(v7, v8, v9, v10, v11);

  memset(&v39, 0, sizeof(v39));
  CMTime time = *(CMTime *)a3;
  CMTimeConvertScale(&v39, &time, v12, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  memset(&time, 0, sizeof(time));
  v17 = objc_msgSend_summary(self, v13, v14, v15, v16);
  long long v22 = v17;
  if (v17) {
    objc_msgSend_duration(v17, v18, v19, v20, v21);
  }
  else {
    memset(&time, 0, sizeof(time));
  }

  memset(&v37, 0, sizeof(v37));
  CMTime v36 = time;
  CMTimeConvertScale(&v37, &v36, v12, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  memset(&v36, 0, sizeof(v36));
  CMTime lhs = v39;
  CMTime rhs = v37;
  CMTimeSubtract(&v36, &lhs, &rhs);
  CMTime lhs = v36;
  long long v33 = *MEMORY[0x263F010E0];
  *(_OWORD *)&rhs.value = *MEMORY[0x263F010E0];
  CMTimeEpoch v23 = *(void *)(MEMORY[0x263F010E0] + 16);
  rhs.epoch = v23;
  if (CMTimeCompare(&lhs, &rhs) < 0)
  {
    *(_OWORD *)&v36.value = v33;
    v36.epoch = v23;
  }
  objc_msgSend_setDuration_(self, v24, v39.value, v25, v26, v33);
  objc_msgSend_setDurationOfSilence_(self, v27, v36.value, v28, v29);
  objc_msgSend_setDurationOfMusic_(self, v30, v37.value, v31, v32);
}

- (void)_buildTracks
{
  uint64_t v283 = *MEMORY[0x263EF8340];
  v6 = objc_msgSend_summary(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_song(self, v7, v8, v9, v10);
  int32_t v16 = objc_msgSend_sampleRate(v11, v12, v13, v14, v15);

  v256 = objc_opt_new();
  v252 = objc_opt_new();
  v258 = objc_opt_new();
  v257 = objc_opt_new();
  uint64_t v21 = objc_msgSend_song(self, v17, v18, v19, v20);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v27 = objc_msgSend_song(self, v23, v24, v25, v26);
    v255 = objc_msgSend_audioFileURL(v27, v28, v29, v30, v31);
  }
  else
  {
    v255 = 0;
  }
  v250 = self;
  v251 = v6;
  long long v280 = 0u;
  long long v281 = 0u;
  long long v278 = 0u;
  long long v279 = 0u;
  objc_msgSend_segments(v6, v23, v24, v25, v26);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v259 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v32, (uint64_t)&v278, (uint64_t)v282, 16);
  long long v33 = 0;
  if (v259)
  {
    uint64_t v254 = *(void *)v279;
    char v263 = 1;
    v34 = (CMTime *)MEMORY[0x263F010E0];
    v35 = v252;
    do
    {
      for (uint64_t i = 0; i != v259; ++i)
      {
        if (*(void *)v279 != v254) {
          objc_enumerationMutation(obj);
        }
        CMTime v37 = *(void **)(*((void *)&v278 + 1) + 8 * i);
        v42 = objc_opt_new();
        memset(&v277, 0, sizeof(v277));
        if (v37) {
          objc_msgSend_summaryTime(v37, v38, v39, v40, v41);
        }
        else {
          memset(&time, 0, sizeof(time));
        }
        CMTimeConvertScale(&v277, &time, v16, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
        objc_msgSend_setPosition_(v42, v43, v277.value, v44, v45);
        objc_msgSend_setUrl_(v42, v46, (uint64_t)v255, v47, v48);
        memset(&v275, 0, sizeof(v275));
        if (v37) {
          objc_msgSend_trackTime(v37, v49, v50, v51, v52);
        }
        else {
          memset(&v274, 0, sizeof(v274));
        }
        CMTimeConvertScale(&v275, &v274, v16, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
        objc_msgSend_setOffset_(v42, v53, v275.value, v54, v55);
        memset(&v273, 0, sizeof(v273));
        v261 = v33;
        if (v37) {
          objc_msgSend_duration(v37, v56, v57, v58, v59);
        }
        else {
          memset(&v272, 0, sizeof(v272));
        }
        CMTimeConvertScale(&v273, &v272, v16, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
        uint64_t v262 = (uint64_t)v42;
        objc_msgSend_setDuration_(v42, v60, v273.value, v61, v62);
        v63 = v256;
        if (v263)
        {
          v64 = v258;
        }
        else
        {
          v63 = v35;
          v64 = v257;
        }
        id v260 = v63;
        id v65 = v64;
        v70 = objc_msgSend_gainFunction(v37, v66, v67, v68, v69);
        v75 = v70;
        if (v70 && objc_msgSend_count(v70, v71, v72, v73, v74))
        {
          v76 = objc_msgSend_sortedArrayUsingSelector_(v75, v71, (uint64_t)sel_compare_, v73, v74);

          if (objc_msgSend_count(v76, v77, v78, v79, v80) == 1)
          {
            v85 = objc_msgSend_firstObject(v76, v81, v82, v83, v84);
            objc_msgSend_gain(v85, v86, v87, v88, v89);
            int v91 = v90;

            v92 = [FMKeyFrame alloc];
            LODWORD(v93) = v91;
            v97 = objc_msgSend_initWithValue_atTime_(v92, v94, 0, v95, v96, v93);
            objc_msgSend_appendVolumeKeyframe_(v65, v98, (uint64_t)v97, v99, v100);
          }
          if (objc_msgSend_count(v76, v81, v82, v83, v84) != 1)
          {
            uint64_t v101 = 0;
            do
            {
              memset(&v271, 0, sizeof(v271));
              v102 = objc_msgSend_objectAtIndexedSubscript_(v76, v71, v101, v73, v74);
              v107 = v102;
              if (v102) {
                objc_msgSend_segmentTime(v102, v103, v104, v105, v106);
              }
              else {
                memset(&v271, 0, sizeof(v271));
              }

              memset(&v270, 0, sizeof(v270));
              uint64_t v108 = v101 + 1;
              v112 = objc_msgSend_objectAtIndexedSubscript_(v76, v109, v108, v110, v111);
              v117 = v112;
              if (v112) {
                objc_msgSend_segmentTime(v112, v113, v114, v115, v116);
              }
              else {
                memset(&v270, 0, sizeof(v270));
              }

              v121 = objc_msgSend_objectAtIndexedSubscript_(v76, v118, v108 - 1, v119, v120);
              objc_msgSend_gain(v121, v122, v123, v124, v125);
              int v127 = v126;

              v131 = objc_msgSend_objectAtIndexedSubscript_(v76, v128, v108, v129, v130);
              objc_msgSend_gain(v131, v132, v133, v134, v135);
              int v137 = v136;

              memset(&v269, 0, sizeof(v269));
              if (v37) {
                objc_msgSend_summaryTime(v37, v138, v139, v140, v141);
              }
              else {
                memset(&lhs, 0, sizeof(lhs));
              }
              CMTime rhs = v271;
              CMTimeAdd(&v269, &lhs, &rhs);
              memset(&rhs, 0, sizeof(rhs));
              CMTime time1 = v270;
              CMTime time2 = v271;
              CMTimeSubtract(&rhs, &time1, &time2);
              uint64_t v142 = v108 - 1;
              if (v108 == 1)
              {
                CMTime time1 = v269;
                CMTime time2 = *v34;
                if (CMTimeCompare(&time1, &time2))
                {
                  v143 = [FMKeyFrame alloc];
                  v147 = objc_msgSend_initWithValue_atTime_(v143, v144, 0, v145, v146, 0.0);
                  objc_msgSend_appendVolumeKeyframe_(v65, v148, (uint64_t)v147, v149, v150);
                }
              }
              CMTime time1 = rhs;
              CMTime time2 = *v34;
              if (CMTimeCompare(&time1, &time2) < 0)
              {
                CMTimeMake(&time1, 1, rhs.timescale);
                CMTime rhs = time1;
              }
              memset(&time1, 0, sizeof(time1));
              CMTime time2 = v269;
              CMTimeConvertScale(&time1, &time2, v16, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
              memset(&time2, 0, sizeof(time2));
              CMTime v264 = rhs;
              CMTimeConvertScale(&time2, &v264, v16, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
              v151 = [FMKeyFrame alloc];
              LODWORD(v152) = v127;
              v156 = objc_msgSend_initWithValue_atTime_(v151, v153, time1.value, v154, v155, v152);
              objc_msgSend_appendVolumeKeyframe_(v65, v157, (uint64_t)v156, v158, v159);

              v160 = [FMKeyFrame alloc];
              LODWORD(v161) = v137;
              v165 = objc_msgSend_initWithValue_atTime_(v160, v162, time2.value + time1.value, v163, v164, v161);
              objc_msgSend_appendVolumeKeyframe_(v65, v166, (uint64_t)v165, v167, v168);

              uint64_t v101 = v142 + 1;
            }
            while (objc_msgSend_count(v76, v169, v170, v171, v172) - 1 > (unint64_t)(v142 + 1));
          }
          v75 = v76;
          v35 = v252;
        }
        objc_msgSend_addObject_(v260, v71, v262, v73, v74);
        v263 ^= 1u;

        long long v33 = (void *)v262;
      }
      uint64_t v259 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v173, (uint64_t)&v278, (uint64_t)v282, 16);
    }
    while (v259);
  }

  objc_msgSend_removeRedundantVolumeKeyFrames(v258, v174, v175, v176, v177);
  objc_msgSend_removeRedundantVolumeKeyFrames(v257, v178, v179, v180, v181);
  if (v33)
  {
    v186 = v250;
    uint64_t v187 = objc_msgSend_durationOfMusic(v250, v182, v183, v184, v185);
    uint64_t v192 = objc_msgSend_position(v33, v188, v189, v190, v191);
    uint64_t v197 = objc_msgSend_duration(v33, v193, v194, v195, v196);
    uint64_t v202 = objc_msgSend_duration(v33, v198, v199, v200, v201);
    objc_msgSend_setDuration_(v33, v203, v187 - (v192 + v197) + v202, v204, v205);
    v210 = v251;
    if (objc_msgSend_durationOfSilence(v250, v206, v207, v208, v209))
    {
      v211 = objc_opt_new();
      uint64_t v216 = objc_msgSend_position(v33, v212, v213, v214, v215);
      uint64_t v221 = objc_msgSend_duration(v33, v217, v218, v219, v220);
      objc_msgSend_setPosition_(v211, v222, v221 + v216, v223, v224);
      uint64_t v229 = objc_msgSend_durationOfSilence(v250, v225, v226, v227, v228);
      objc_msgSend_setDuration_(v211, v230, v229, v231, v232);
      objc_msgSend_addObject_(v256, v233, (uint64_t)v211, v234, v235);
    }
  }
  else
  {
    v186 = v250;
    objc_msgSend_durationOfSilence(v250, v182, v183, v184, v185);
    v210 = v251;
  }
  v236 = [FMTrack alloc];
  v239 = objc_msgSend_initWithClips_mixParameters_(v236, v237, (uint64_t)v256, (uint64_t)v258, v238);
  objc_msgSend_setTrackA_(v186, v240, (uint64_t)v239, v241, v242);

  v243 = [FMTrack alloc];
  v246 = objc_msgSend_initWithClips_mixParameters_(v243, v244, (uint64_t)v252, (uint64_t)v257, v245);
  objc_msgSend_setTrackB_(v186, v247, (uint64_t)v246, v248, v249);
}

- (id)_buildOutroFadeoutMixParams
{
  return 0;
}

- (FlexMLSummary)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end