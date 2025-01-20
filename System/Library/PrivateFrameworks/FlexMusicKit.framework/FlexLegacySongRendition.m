@interface FlexLegacySongRendition
+ (int64_t)_durationOfOutroForPlaylist:(id)a3 onlyUsedDuration:(BOOL)a4;
- (FlexLegacySongRendition)initWithSong:(id)a3 segments:(id)a4 withOptions:(id)a5;
- (NSArray)segments;
- (id)_buildOutroFadeoutMixParams;
- (int64_t)durationOfFullOutro;
- (int64_t)durationOfUsedOutro;
- (void)_buildTracksFromSegments:(id)a3;
- (void)setDurationOfFullOutro:(int64_t)a3;
- (void)setDurationOfUsedOutro:(int64_t)a3;
- (void)setSegments:(id)a3;
@end

@implementation FlexLegacySongRendition

- (FlexLegacySongRendition)initWithSong:(id)a3 segments:(id)a4 withOptions:(id)a5
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v9 = a4;
  v84.receiver = self;
  v84.super_class = (Class)FlexLegacySongRendition;
  v10 = [(FMSongRendition *)&v84 initWithSong:a3 andOptions:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_segments, a4);
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v12 = v9;
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v80, (uint64_t)v85, 16);
    if (v14)
    {
      uint64_t v19 = v14;
      uint64_t v20 = 0;
      uint64_t v21 = *(void *)v81;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v81 != v21) {
            objc_enumerationMutation(v12);
          }
          v20 += objc_msgSend_duration(*(void **)(*((void *)&v80 + 1) + 8 * i), v15, v16, v17, v18, (void)v80);
        }
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v80, (uint64_t)v85, 16);
      }
      while (v19);
    }
    else
    {
      uint64_t v20 = 0;
    }

    objc_msgSend_setDuration_(v11, v23, v20, v24, v25);
    v30 = objc_msgSend_lastObject(v12, v26, v27, v28, v29);
    v35 = v30;
    if (v30)
    {
      v36 = objc_msgSend_url(v30, v31, v32, v33, v34);

      if (v36)
      {
        objc_msgSend_setDurationOfSilence_(v11, v37, 0, v39, v40);
        objc_msgSend_setDurationOfMusic_(v11, v41, v20, v42, v43, (void)v80);
      }
      else
      {
        uint64_t v49 = objc_msgSend_duration(v35, v37, v38, v39, v40);
        objc_msgSend_setDurationOfSilence_(v11, v50, v49, v51, v52);
        uint64_t v57 = objc_msgSend_duration(v11, v53, v54, v55, v56);
        uint64_t v62 = v57 - objc_msgSend_durationOfSilence(v11, v58, v59, v60, v61);
        objc_msgSend_setDurationOfMusic_(v11, v63, v62, v64, v65, (void)v80);
      }
    }
    else
    {
      objc_msgSend_setDurationOfMusic_(v11, v31, 0, v33, v34);
      objc_msgSend_setDurationOfSilence_(v11, v46, 0, v47, v48);
    }
    uint64_t v66 = objc_msgSend__durationOfOutroForPlaylist_onlyUsedDuration_(FlexLegacySongRendition, v44, (uint64_t)v12, 1, v45, (void)v80);
    objc_msgSend_setDurationOfUsedOutro_(v11, v67, v66, v68, v69);
    uint64_t v72 = objc_msgSend__durationOfOutroForPlaylist_onlyUsedDuration_(FlexLegacySongRendition, v70, (uint64_t)v12, 0, v71);
    objc_msgSend_setDurationOfFullOutro_(v11, v73, v72, v74, v75);
    objc_msgSend__buildTracksFromSegments_(v11, v76, (uint64_t)v12, v77, v78);
  }
  return v11;
}

+ (int64_t)_durationOfOutroForPlaylist:(id)a3 onlyUsedDuration:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v10 = objc_msgSend_lastObject(v5, v6, v7, v8, v9);
  v15 = v10;
  if (!v10) {
    goto LABEL_17;
  }
  uint64_t v16 = objc_msgSend_segment(v10, v11, v12, v13, v14);

  if (!v16)
  {
    if ((unint64_t)objc_msgSend_count(v5, v17, v18, v19, v20) >= 2)
    {
      uint64_t v69 = objc_msgSend_count(v5, v65, v66, v67, v68);
      v44 = objc_msgSend_objectAtIndex_(v5, v70, v69 - 2, v71, v72);
      uint64_t v77 = objc_msgSend_segment(v44, v73, v74, v75, v76);
      if (!v77
        || (long long v82 = (void *)v77,
            objc_msgSend_segment(v44, v78, v79, v80, v81),
            long long v83 = objc_claimAutoreleasedReturnValue(),
            uint64_t v88 = objc_msgSend_type(v83, v84, v85, v86, v87),
            v83,
            v82,
            v88 != 4))
      {
        int64_t v31 = 0;
        goto LABEL_22;
      }
      if (v4)
      {
        int64_t v31 = objc_msgSend_duration(v44, v89, v90, v91, v92);
        if ((unint64_t)objc_msgSend_count(v5, v93, v94, v95, v96) < 3)
        {
LABEL_22:

          goto LABEL_23;
        }
        uint64_t v101 = objc_msgSend_count(v5, v97, v98, v99, v100);
        v105 = objc_msgSend_objectAtIndex_(v5, v102, v101 - 3, v103, v104);
        uint64_t v110 = objc_msgSend_segment(v105, v106, v107, v108, v109);
        if (v110)
        {
          v115 = (void *)v110;
          v116 = objc_msgSend_segment(v105, v111, v112, v113, v114);
          uint64_t v121 = objc_msgSend_type(v116, v117, v118, v119, v120);

          if (v121 == 5) {
            v31 += objc_msgSend_duration(v105, v122, v123, v124, v125);
          }
        }
      }
      else
      {
        v105 = objc_msgSend_segment(v44, v89, v90, v91, v92);
        int64_t v31 = objc_msgSend_sampleCount(v105, v130, v131, v132, v133);
      }

      goto LABEL_22;
    }
LABEL_17:
    int64_t v31 = 0;
    goto LABEL_23;
  }
  uint64_t v21 = objc_msgSend_segment(v15, v17, v18, v19, v20);
  uint64_t v26 = objc_msgSend_type(v21, v22, v23, v24, v25);

  if (v26 != 4) {
    goto LABEL_17;
  }
  if (!v4)
  {
    v44 = objc_msgSend_segment(v15, v27, v28, v29, v30);
    int64_t v31 = objc_msgSend_sampleCount(v44, v126, v127, v128, v129);
    goto LABEL_22;
  }
  int64_t v31 = objc_msgSend_duration(v15, v27, v28, v29, v30);
  if ((unint64_t)objc_msgSend_count(v5, v32, v33, v34, v35) >= 2)
  {
    uint64_t v40 = objc_msgSend_count(v5, v36, v37, v38, v39);
    v44 = objc_msgSend_objectAtIndex_(v5, v41, v40 - 2, v42, v43);
    uint64_t v49 = objc_msgSend_segment(v44, v45, v46, v47, v48);
    if (v49)
    {
      uint64_t v54 = (void *)v49;
      uint64_t v55 = objc_msgSend_segment(v44, v50, v51, v52, v53);
      uint64_t v60 = objc_msgSend_type(v55, v56, v57, v58, v59);

      if (v60 == 5) {
        v31 += objc_msgSend_duration(v44, v61, v62, v63, v64);
      }
    }
    goto LABEL_22;
  }
LABEL_23:

  return v31;
}

- (void)_buildTracksFromSegments:(id)a3
{
  id v3 = a3;
  v304 = objc_opt_new();
  v315 = v3;
  uint64_t v8 = objc_msgSend_count(v3, v4, v5, v6, v7);
  v307 = objc_opt_new();
  v306 = objc_opt_new();
  v305 = objc_opt_new();
  uint64_t v302 = v8 - 1;
  uint64_t v303 = v8;
  if (v8 >= 1)
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    char v318 = 1;
    do
    {
      v15 = objc_msgSend_objectAtIndexedSubscript_(v315, v9, v14, v11, v12);
      uint64_t v16 = objc_opt_new();
      objc_msgSend_setPosition_(v16, v17, v13, v18, v19);
      uint64_t v24 = objc_msgSend_url(v15, v20, v21, v22, v23);
      objc_msgSend_setUrl_(v16, v25, (uint64_t)v24, v26, v27);

      uint64_t v32 = objc_msgSend_offset(v15, v28, v29, v30, v31);
      objc_msgSend_setOffset_(v16, v33, v32, v34, v35);
      uint64_t v40 = objc_msgSend_duration(v15, v36, v37, v38, v39);
      objc_msgSend_setDuration_(v16, v41, v40, v42, v43);
      uint64_t v316 = objc_msgSend_duration(v16, v44, v45, v46, v47);
      if (v14)
      {
        uint64_t v52 = objc_msgSend_objectAtIndexedSubscript_(v315, v48, v14 - 1, v50, v51);
      }
      else
      {
        uint64_t v52 = 0;
      }
      if (v14 >= v302)
      {
        v317 = 0;
      }
      else
      {
        v317 = objc_msgSend_objectAtIndexedSubscript_(v315, v48, v14 + 1, v50, v51);
      }
      uint64_t v53 = objc_msgSend_segment(v52, v48, v49, v50, v51);
      uint64_t v58 = objc_msgSend_segment(v15, v54, v55, v56, v57);
      uint64_t v63 = objc_msgSend_segment(v317, v59, v60, v61, v62);
      uint64_t v68 = objc_msgSend_name(v58, v64, v65, v66, v67);
      uint64_t v73 = objc_msgSend_barsUsed(v52, v69, v70, v71, v72);
      v312 = v53;
      uint64_t v76 = objc_msgSend_transitionToSegmentNamed_fromBarIndex_(v53, v74, (uint64_t)v68, v73 - 1, v75);

      v313 = v63;
      uint64_t v81 = objc_msgSend_name(v63, v77, v78, v79, v80);
      uint64_t v86 = objc_msgSend_barsUsed(v15, v82, v83, v84, v85);
      v314 = v58;
      v89 = objc_msgSend_transitionToSegmentNamed_fromBarIndex_(v58, v87, (uint64_t)v81, v86 - 1, v88);

      uint64_t v90 = v306;
      if (v318)
      {
        uint64_t v91 = v304;
      }
      else
      {
        uint64_t v90 = v305;
        uint64_t v91 = v307;
      }
      id v92 = v90;
      id v97 = v91;
      uint64_t v320 = 0;
      if (v76)
      {
        if (objc_msgSend_fadeIn(v76, v93, v94, v95, v96) >= 1
          && (objc_msgSend_prevented(v76, v93, v94, v95, v96) & 1) == 0)
        {
          uint64_t v98 = objc_msgSend_transitionSegmentName(v76, v93, v94, v95, v96);

          if (!v98)
          {
            uint64_t v99 = objc_msgSend_fadeOut(v76, v93, v94, v95, v96);
            uint64_t v100 = v76;
            id v101 = v97;
            v102 = v52;
            uint64_t v103 = v15;
            uint64_t v104 = v99;
            uint64_t v109 = objc_msgSend_fadeIn(v100, v105, v106, v107, v108);
            uint64_t v110 = v104;
            v15 = v103;
            uint64_t v52 = v102;
            id v97 = v101;
            uint64_t v76 = v100;
            objc_msgSend_crossfadeLengthInSamplesForFromSeg_toSeg_fadeOutTimeInMsec_fadeInTimeInMsec_validFadeOutSamples_validFadeInSamples_(FlexSegment, v111, (uint64_t)v312, (uint64_t)v314, v110, v109, 0, &v320);
            objc_msgSend_setFadeInLength_(v16, v112, v320, v113, v114);
          }
        }
      }
      v310 = objc_msgSend_lastVolumeKeyFrame(v92, v93, v94, v95, v96);
      objc_msgSend_value(v310, v115, v116, v117, v118);
      if (v320 < 1)
      {
        uint64_t v149 = v13;
        if (v123 != 0.0) {
          goto LABEL_26;
        }
      }
      else
      {
        if (v123 != 0.0)
        {
          uint64_t v124 = [FMKeyFrame alloc];
          uint64_t v128 = objc_msgSend_initWithValue_atTime_(v124, v125, v13, v126, v127, 0.0);
          objc_msgSend_appendVolumeKeyframe_(v92, v129, (uint64_t)v128, v130, v131);
        }
        uint64_t v132 = [FMKeyFrame alloc];
        v136 = objc_msgSend_initWithValue_atTime_(v132, v133, v13, v134, v135, 0.0);
        objc_msgSend_appendVolumeKeyframe_(v92, v137, (uint64_t)v136, v138, v139);

        uint64_t v140 = v320 + v13;
        if (v140 <= objc_msgSend_duration(self, v141, v142, v143, v144)) {
          uint64_t v149 = v320 + v13;
        }
        else {
          uint64_t v149 = objc_msgSend_duration(self, v145, v146, v147, v148);
        }
      }
      v150 = [FMKeyFrame alloc];
      LODWORD(v151) = 1.0;
      v155 = objc_msgSend_initWithValue_atTime_(v150, v152, v149, v153, v154, v151);
      objc_msgSend_appendVolumeKeyframe_(v92, v156, (uint64_t)v155, v157, v158);

LABEL_26:
      uint64_t v319 = 0;
      v311 = v15;
      if (!v89) {
        goto LABEL_40;
      }
      id v308 = v97;
      if (objc_msgSend_fadeOut(v89, v119, v120, v121, v122) < 1) {
        goto LABEL_30;
      }
      if (objc_msgSend_prevented(v89, v159, v160, v161, v162)) {
        goto LABEL_30;
      }
      v167 = objc_msgSend_transitionSegmentName(v89, v163, v164, v165, v166);

      if (v167) {
        goto LABEL_30;
      }
      v203 = objc_msgSend_segment(v15, v168, v169, v170, v171);
      uint64_t v208 = objc_msgSend_barsUsed(v15, v204, v205, v206, v207);
      uint64_t v301 = objc_msgSend_barEndPositionForBarIndex_(v203, v209, v208 - 1, v210, v211);

      uint64_t v216 = objc_msgSend_fadeOut(v89, v212, v213, v214, v215);
      uint64_t v221 = objc_msgSend_fadeIn(v89, v217, v218, v219, v220);
      objc_msgSend_crossfadeLengthInSamplesForFromSeg_toSeg_fadeOutTimeInMsec_fadeInTimeInMsec_validFadeOutSamples_validFadeInSamples_(FlexSegment, v222, (uint64_t)v314, (uint64_t)v313, v216, v221, &v319, 0);
      uint64_t v227 = v319;
      if (v319 < 1)
      {
LABEL_40:
        v172 = 0;
        goto LABEL_41;
      }
      if (v227 + v301 <= objc_msgSend_sampleCount(v314, v223, v224, v225, v226))
      {
        uint64_t v233 = 0;
        uint64_t v232 = v319;
      }
      else
      {
        uint64_t v232 = objc_msgSend_sampleCount(v314, v228, v229, v230, v231) - v301;
        uint64_t v233 = v319 - v232;
      }
      if (v232 >= 1)
      {
        uint64_t v246 = objc_msgSend_duration(v16, v228, v229, v230, v231);
        objc_msgSend_setDuration_(v16, v247, v246 + v232, v248, v249);
        objc_msgSend_setFadeOutLength_(v16, v250, v232, v251, v252);
      }
      if (v233 < 1)
      {
LABEL_30:
        v172 = 0;
      }
      else
      {
        if (objc_msgSend_useNextSegmentForFadeOut(v89, v228, v229, v230, v231)
          && (objc_msgSend_sliceable(v314, v253, v254, v255, v256) & 1) == 0
          && v317)
        {
          v172 = objc_opt_new();
          objc_msgSend_url(v317, v257, v258, v259, v260);
          v262 = uint64_t v261 = v233;
          objc_msgSend_setUrl_(v172, v263, (uint64_t)v262, v264, v265);

          uint64_t v233 = v261;
        }
        else
        {
          v172 = objc_msgSend_copy(v16, v253, v254, v255, v256);
        }
        objc_msgSend_setOffset_(v172, v266, 0, v267, v268);
        objc_msgSend_setDuration_(v172, v269, v233, v270, v271);
        uint64_t v276 = objc_msgSend_duration(v16, v272, v273, v274, v275);
        objc_msgSend_setPosition_(v172, v277, v276 + v13, v278, v279);
        objc_msgSend_setFadeOutLength_(v172, v280, v233, v281, v282);
      }
      if (v319 < 1)
      {
        id v97 = v308;
LABEL_41:
        v234 = [FMKeyFrame alloc];
        LODWORD(v235) = 1.0;
        uint64_t v199 = objc_msgSend_initWithValue_atTime_(v234, v236, v316 + v13, v237, v238, v235);
        goto LABEL_42;
      }
      v173 = [FMKeyFrame alloc];
      LODWORD(v174) = 1.0;
      uint64_t v178 = objc_msgSend_initWithValue_atTime_(v173, v175, v316 + v13, v176, v177, v174);
      v179 = v92;
      v180 = (void *)v178;
      v181 = v179;
      objc_msgSend_appendVolumeKeyframe_(v179, v182, v178, v183, v184);

      uint64_t v185 = v319 + v316 + v13;
      if (v185 <= objc_msgSend_duration(self, v186, v187, v188, v189)) {
        uint64_t v194 = v319 + v316 + v13;
      }
      else {
        uint64_t v194 = objc_msgSend_duration(self, v190, v191, v192, v193);
      }
      id v92 = v181;
      id v97 = v308;
      v195 = [FMKeyFrame alloc];
      uint64_t v199 = objc_msgSend_initWithValue_atTime_(v195, v196, v194, v197, v198, 0.0);
LABEL_42:
      v239 = (void *)v199;
      objc_msgSend_appendVolumeKeyframe_(v92, v200, v199, v201, v202);

      objc_msgSend_addObject_(v97, v240, (uint64_t)v16, v241, v242);
      if (v172) {
        objc_msgSend_addObject_(v97, v243, (uint64_t)v172, v244, v245);
      }
      v318 ^= 1u;
      v13 += v316;

      ++v14;
    }
    while (v303 != v14);
  }
  objc_msgSend_removeRedundantVolumeKeyFrames(v306, v9, v10, v11, v12);
  objc_msgSend_removeRedundantVolumeKeyFrames(v305, v283, v284, v285, v286);
  v287 = [FMTrack alloc];
  v290 = objc_msgSend_initWithClips_mixParameters_(v287, v288, (uint64_t)v304, (uint64_t)v306, v289);
  objc_msgSend_setTrackA_(self, v291, (uint64_t)v290, v292, v293);

  v294 = [FMTrack alloc];
  v297 = objc_msgSend_initWithClips_mixParameters_(v294, v295, (uint64_t)v307, (uint64_t)v305, v296);
  objc_msgSend_setTrackB_(self, v298, (uint64_t)v297, v299, v300);
}

- (id)_buildOutroFadeoutMixParams
{
  uint64_t v5 = objc_msgSend_timedMetadataItemsWithIdentifier_(self, a2, @"FMTimedMetadataIdentifierSection", v2, v3);
  uint64_t v74 = 0;
  uint64_t v75 = &v74;
  uint64_t v76 = 0x3810000000;
  uint64_t v77 = &unk_217A685A7;
  long long v78 = *MEMORY[0x263F01090];
  uint64_t v79 = *(void *)(MEMORY[0x263F01090] + 16);
  uint64_t v68 = 0;
  uint64_t v69 = &v68;
  uint64_t v70 = 0x3810000000;
  uint64_t v71 = &unk_217A685A7;
  long long v72 = v78;
  uint64_t v73 = v79;
  uint64_t v62 = 0;
  uint64_t v63 = &v62;
  uint64_t v64 = 0x3032000000;
  uint64_t v65 = sub_217A60018;
  uint64_t v66 = sub_217A60028;
  id v67 = 0;
  v61[0] = MEMORY[0x263EF8330];
  v61[1] = 3221225472;
  v61[2] = sub_217A60030;
  v61[3] = &unk_2642B7B70;
  v61[4] = &v74;
  v61[5] = &v68;
  v61[6] = &v62;
  objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v5, v6, 2, (uint64_t)v61, v7);
  uint64_t v12 = (void *)v63[5];
  if (!v12) {
    goto LABEL_3;
  }
  memset(&v60, 0, sizeof(v60));
  int64_t v13 = objc_msgSend_integerValue(v12, v8, v9, v10, v11);
  uint64_t v18 = objc_msgSend_song(self, v14, v15, v16, v17);
  int32_t v23 = objc_msgSend_sampleRate(v18, v19, v20, v21, v22);
  CMTimeMake(&v60, v13, v23);

  memset(&v59, 0, sizeof(v59));
  CMTime lhs = *(CMTime *)(v75 + 4);
  CMTime rhs = *(CMTime *)(v69 + 4);
  CMTimeAdd(&v59, &lhs, &rhs);
  CMTime lhs = v60;
  CMTime rhs = v59;
  if (CMTimeCompare(&lhs, &rhs) < 0)
  {
    uint64_t v24 = objc_opt_new();
    uint64_t v29 = objc_msgSend_song(self, v25, v26, v27, v28);
    int32_t v34 = objc_msgSend_sampleRate(v29, v30, v31, v32, v33);

    CMTime lhs = v60;
    CMTimeConvertScale(&v56, &lhs, v34, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    CMTimeValue value = v56.value;
    CMTime lhs = v59;
    CMTimeConvertScale(&v55, &lhs, v34, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    CMTimeValue v36 = v55.value;
    uint64_t v37 = [FMKeyFrame alloc];
    LODWORD(v38) = 1.0;
    uint64_t v42 = objc_msgSend_initWithValue_atTime_(v37, v39, value, v40, v41, v38);
    objc_msgSend_appendVolumeKeyframe_(v24, v43, (uint64_t)v42, v44, v45);

    uint64_t v46 = [FMKeyFrame alloc];
    uint64_t v50 = objc_msgSend_initWithValue_atTime_(v46, v47, v36, v48, v49, 0.0);
    objc_msgSend_appendVolumeKeyframe_(v24, v51, (uint64_t)v50, v52, v53);
  }
  else
  {
LABEL_3:
    uint64_t v24 = 0;
  }
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v74, 8);

  return v24;
}

- (NSArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
}

- (int64_t)durationOfUsedOutro
{
  return self->_durationOfUsedOutro;
}

- (void)setDurationOfUsedOutro:(int64_t)a3
{
  self->_durationOfUsedOutro = a3;
}

- (int64_t)durationOfFullOutro
{
  return self->_durationOfFullOutro;
}

- (void)setDurationOfFullOutro:(int64_t)a3
{
  self->_durationOfFullOutro = a3;
}

- (void).cxx_destruct
{
}

@end