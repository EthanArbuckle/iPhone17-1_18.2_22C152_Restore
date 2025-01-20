@interface CVNLPCTCTextDecoder
- (CVNLPActivationMatrix)activationMatrix;
- (CVNLPCTCTextDecoder)initWithLanguageResourceBundle:(id)a3;
- (id)decodingResultForKBestPaths:(unint64_t)a3 withBeamWidth:(unint64_t)a4;
- (id)decodingResultForKBestPaths:(unint64_t)a3 withBeamWidth:(unint64_t)a4 context:(id)a5;
- (id)decodingResultForKBestPaths:(unint64_t)a3 withBeamWidth:(unint64_t)a4 context:(id)a5 optimizeAlignment:(BOOL)a6;
- (id)decodingResultWithConfiguration:(id)a3 withContext:(id)a4;
- (id)greedyDecodingResultWithConfiguration:(id)a3;
- (void)setActivationMatrix:(id)a3;
@end

@implementation CVNLPCTCTextDecoder

- (CVNLPCTCTextDecoder)initWithLanguageResourceBundle:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CVNLPCTCTextDecoder;
  return [(CVNLPTextDecoder *)&v4 initWithLanguageResourceBundle:a3];
}

- (id)decodingResultForKBestPaths:(unint64_t)a3 withBeamWidth:(unint64_t)a4
{
  v7 = objc_msgSend_defaultWhitespaceCommitActionBehavior(CVNLPTextDecodingConfiguration, a2, a3, a4);
  v11 = objc_msgSend_languageResourceBundle(self, v8, v9, v10);
  v14 = objc_msgSend_defaultPathScoringFunctionForLanguageResourceBundle_(CVNLPTextDecodingPath, v12, (uint64_t)v11, v13);

  v15 = [CVNLPTextDecodingBeamSearchConfiguration alloc];
  v17 = objc_msgSend_initWithCommitActionBehavior_scoringFunction_beamWidth_pathCount_(v15, v16, (uint64_t)v7, (uint64_t)v14, a4, a3);
  v19 = objc_msgSend_decodingResultWithConfiguration_withContext_(self, v18, (uint64_t)v17, 0);

  return v19;
}

- (id)decodingResultForKBestPaths:(unint64_t)a3 withBeamWidth:(unint64_t)a4 context:(id)a5
{
  id v8 = a5;
  v12 = objc_msgSend_defaultWhitespaceCommitActionBehavior(CVNLPTextDecodingConfiguration, v9, v10, v11);
  v16 = objc_msgSend_languageResourceBundle(self, v13, v14, v15);
  v19 = objc_msgSend_defaultPathScoringFunctionForLanguageResourceBundle_(CVNLPTextDecodingPath, v17, (uint64_t)v16, v18);

  v20 = [CVNLPTextDecodingBeamSearchConfiguration alloc];
  v22 = objc_msgSend_initWithCommitActionBehavior_scoringFunction_beamWidth_pathCount_(v20, v21, (uint64_t)v12, (uint64_t)v19, a4, a3);
  v24 = objc_msgSend_decodingResultWithConfiguration_withContext_(self, v23, (uint64_t)v22, (uint64_t)v8);

  return v24;
}

- (id)decodingResultForKBestPaths:(unint64_t)a3 withBeamWidth:(unint64_t)a4 context:(id)a5 optimizeAlignment:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  uint64_t v14 = objc_msgSend_defaultWhitespaceCommitActionBehavior(CVNLPTextDecodingConfiguration, v11, v12, v13);
  uint64_t v18 = objc_msgSend_languageResourceBundle(self, v15, v16, v17);
  v21 = objc_msgSend_defaultPathScoringFunctionForLanguageResourceBundle_(CVNLPTextDecodingPath, v19, (uint64_t)v18, v20);

  v22 = [CVNLPTextDecodingBeamSearchConfiguration alloc];
  shouldOptimizeAlignment = objc_msgSend_initWithCommitActionBehavior_scoringFunction_beamWidth_pathCount_shouldOptimizeAlignment_(v22, v23, (uint64_t)v14, (uint64_t)v21, a4, a3, v6);
  v26 = objc_msgSend_decodingResultWithConfiguration_withContext_(self, v25, (uint64_t)shouldOptimizeAlignment, (uint64_t)v10);

  return v26;
}

- (id)decodingResultWithConfiguration:(id)a3 withContext:(id)a4
{
  uint64_t v261 = *MEMORY[0x1E4F143B8];
  id v224 = a3;
  id v223 = a4;
  v227 = self;
  BOOL v9 = objc_msgSend_domainType(self->_activationMatrix, v6, v7, v8) == 0;
  v226 = objc_alloc_init(CVNLPCTCBeamState);
  v225 = objc_alloc_init(CVNLPCTCBeamState);
  uint64_t v16 = objc_msgSend_scoringFunction(v224, v10, v11, v12);
  if (!v16)
  {
    uint64_t v17 = objc_msgSend_languageResourceBundle(self, v13, v14, v15);
    uint64_t v21 = objc_msgSend_pruneProblematicMixedScriptWordPaths(v224, v18, v19, v20);
    uint64_t v16 = objc_msgSend_defaultPathScoringFunctionForLanguageResourceBundle_pruneProblematicMixedScriptWordPaths_(CVNLPTextDecodingPath, v22, (uint64_t)v17, v21);
  }
  v23 = objc_msgSend_languageResourceBundle(self, v13, v14, v15);
  v219 = (void *)v16;
  v27 = objc_msgSend_characterLanguageModel(v23, v24, v25, v26);
  int v31 = objc_msgSend_lmSPIType(v27, v28, v29, v30);

  if (v31 == 2)
  {
    v35 = objc_msgSend_languageResourceBundle(v227, v32, v33, v34);
    v39 = objc_msgSend_characterLanguageModel(v35, v36, v37, v38);
    v43 = (const void *)objc_msgSend_languageModel(v39, v40, v41, v42);
    v44 = (const void *)CVNLPLanguageModelWithStateCreate(v43);

    if (v223)
    {
      v48 = objc_msgSend_history(v223, v45, v46, v47);
      CVNLPLanguageModelWithStateUpdateWithContext((uint64_t)v44, v48);
    }
    __src = 0;
    v49 = 0;
  }
  else
  {
    v50 = objc_msgSend_languageResourceBundle(v227, v32, v33, v34);
    v54 = objc_msgSend_characterLanguageModel(v50, v51, v52, v53);
    v60 = objc_msgSend_history(v223, v55, v56, v57);
    if (v54)
    {
      objc_msgSend_characterTokenIDsForString_(v54, v58, (uint64_t)v60, v59);
      v49 = (char *)v246;
      __src = v245;
    }
    else
    {
      v49 = 0;
      __src = 0;
    }
    v245 = 0;
    v246 = 0;
    uint64_t v247 = 0;

    v44 = 0;
  }
  v61 = objc_msgSend_languageResourceBundle(v227, v45, v46, v47);
  v65 = objc_msgSend_wordLanguageModel(v61, v62, v63, v64);
  v69 = v65;
  if (v223 && v65)
  {
    v70 = objc_msgSend_history(v223, v66, v67, v68);
    BOOL v74 = objc_msgSend_length(v70, v71, v72, v73) == 0;

    if (v74)
    {
      v220 = 0;
      v88 = 0;
      goto LABEL_21;
    }
    v61 = objc_msgSend_inactiveSubstring(v223, v75, v76, v77);
    v81 = objc_msgSend_languageResourceBundle(v227, v78, v79, v80);
    v85 = objc_msgSend_wordLanguageModel(v81, v82, v83, v84);
    v87 = v85;
    if (v85)
    {
      objc_msgSend_wordTokenIDsForString_outTokenRanges_(v85, v86, (uint64_t)v61, 0);
      v88 = (char *)v246;
      v220 = v245;
    }
    else
    {
      v88 = 0;
      v220 = 0;
    }
    v245 = 0;
    v246 = 0;
    uint64_t v247 = 0;
  }
  else
  {

    v220 = 0;
    v88 = 0;
  }

LABEL_21:
  uint64_t shouldOptimizeAlignment = objc_msgSend_shouldOptimizeAlignment(v224, v75, v76, v77);
  BOOL v90 = v9;
  v91 = [CVNLPCTCTextDecodingPath alloc];
  v96 = objc_msgSend_languageResourceBundle(v227, v92, v93, v94);
  v257 = 0;
  v258 = 0;
  v259 = 0;
  int64_t v97 = v49 - __src;
  if (v49 != __src)
  {
    if (v97 < 0) {
      sub_1B4BB3244();
    }
    v257 = operator new(v49 - __src);
    v259 = (char *)v257 + 4 * (v97 >> 2);
    memcpy(v257, __src, v97);
    v258 = v259;
  }
  __p = 0;
  v255 = 0;
  v256 = 0;
  int64_t v98 = v88 - v220;
  if (v88 != v220)
  {
    if (v98 < 0) {
      sub_1B4BB3244();
    }
    __p = operator new(v88 - v220);
    v256 = (char *)__p + 4 * (v98 >> 2);
    memcpy(__p, v220, v98);
    v255 = v256;
  }
  hasContext = objc_msgSend_initWithLanguageResourceBundle_scoringFunction_initialCharacterLMState_characterTokenIDs_wordTokenIDs_optimizingAlignment_hasContext_(v91, v95, (uint64_t)v96, (uint64_t)v219, v44, &v257, &__p, shouldOptimizeAlignment, v223 != 0);
  if (__p)
  {
    v255 = __p;
    operator delete(__p);
  }
  if (v257)
  {
    v258 = v257;
    operator delete(v257);
  }

  if (v44) {
    CFRelease(v44);
  }
  objc_msgSend_setBlankLogProbability_(hasContext, v99, v100, v101, 0.0);
  objc_msgSend_setNonBlankLogProbability_(hasContext, v102, v103, v104, -1022.0);
  v108 = objc_msgSend_languageResourceBundle(v227, v105, v106, v107);
  v111 = objc_msgSend_packagedLexiconCursorsUsingContext_(v108, v109, (uint64_t)v223, v110);
  objc_msgSend_setCursors_(hasContext, v112, (uint64_t)v111, v113);

  objc_msgSend_addPath_(v226, v114, (uint64_t)hasContext, v115);
  for (uint64_t i = 0; i < objc_msgSend_timestepCount(v227->_activationMatrix, v116, v117, v118); ++i)
  {
    v123 = (void *)MEMORY[0x1BA992F90]();
    v124 = objc_alloc_init(CVNLPCTCBeamState);
    objc_msgSend_logProbabilityForBlankAtTimestep_(v227->_activationMatrix, v125, i, v126);
    double v128 = v127;
    v245 = 0;
    v246 = (void **)&v245;
    uint64_t v247 = 0x4812000000;
    v248 = sub_1B4C79F90;
    v249 = sub_1B4C79FB4;
    v250 = &unk_1B4C9FEA6;
    v252 = 0;
    uint64_t v253 = 0;
    v251 = 0;
    activationMatrix = v227->_activationMatrix;
    v243[0] = MEMORY[0x1E4F143A8];
    v243[1] = 3221225472;
    v243[2] = sub_1B4C7A08C;
    v243[3] = &unk_1E60A3E18;
    BOOL v244 = v90;
    v243[4] = &v245;
    objc_msgSend_enumerateNonBlankCandidatesInTimestep_block_(activationMatrix, v130, i, (uint64_t)v243);
    v235[0] = MEMORY[0x1E4F143A8];
    float v131 = v128;
    v235[1] = 3221225472;
    v235[2] = sub_1B4C7A2E8;
    v235[3] = &unk_1E60A3E40;
    uint64_t v241 = i;
    v235[4] = v227;
    float v242 = v131;
    v132 = v124;
    v236 = v132;
    v240 = (void **)&v245;
    id v133 = v224;
    id v237 = v133;
    v134 = v226;
    v238 = v134;
    v135 = v225;
    v239 = v135;
    objc_msgSend_enumeratePathsWithBlock_(v134, v136, (uint64_t)v235, v137);
    if (objc_msgSend_shouldApplyWordLMToLastWord(v133, v138, v139, v140)
      && i == objc_msgSend_timestepCount(v227->_activationMatrix, v141, v142, v143) - 1)
    {
      objc_msgSend_applyWordLanguageModelProbabilityToPaths(v132, v141, v142, v143);
    }
    v233 = v135;
    v234 = v134;
    uint64_t v144 = objc_msgSend_beamWidth(v133, v141, v142, v143);
    objc_msgSend_kBest_discarded_k_shouldUpdateLMState_(v132, v145, (uint64_t)&v234, (uint64_t)&v233, v144, 1);
    v226 = v234;

    v225 = v233;
    _Block_object_dispose(&v245, 8);
    v146 = (char *)v251;
    if (v251)
    {
      v147 = v252;
      v148 = v251;
      if (v252 != v251)
      {
        do
        {
          v149 = (void *)*((void *)v147 - 2);
          v147 -= 16;
        }
        while (v147 != v146);
        v148 = v251;
      }
      v252 = v146;
      operator delete(v148);
    }
  }
  objc_msgSend_mergePathsWithTrailingWhitespaces(v226, v120, v121, v122);
  id v232 = 0;
  uint64_t v153 = objc_msgSend_pathCount(v224, v150, v151, v152);
  objc_msgSend_kBest_discarded_k_shouldUpdateLMState_(v226, v154, (uint64_t)&v232, 0, v153, 0);
  id v155 = v232;
  v159 = objc_msgSend_sortedKeys(v155, v156, v157, v158);
  v160 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v164 = objc_msgSend_count(v159, v161, v162, v163);
  v167 = objc_msgSend_arrayWithCapacity_(v160, v165, v164, v166);
  long long v230 = 0u;
  long long v231 = 0u;
  long long v228 = 0u;
  long long v229 = 0u;
  id v168 = v159;
  uint64_t v172 = objc_msgSend_countByEnumeratingWithState_objects_count_(v168, v169, (uint64_t)&v228, (uint64_t)v260, 16);
  if (v172)
  {
    uint64_t v173 = *(void *)v229;
    do
    {
      for (uint64_t j = 0; j != v172; ++j)
      {
        if (*(void *)v229 != v173) {
          objc_enumerationMutation(v168);
        }
        v175 = objc_msgSend_pathForString_(v155, v170, *(void *)(*((void *)&v228 + 1) + 8 * j), v171);
        uint64_t v179 = objc_msgSend_timestepCount(v227->_activationMatrix, v176, v177, v178);
        v181 = objc_msgSend_tokensWithTimestep_isFinalTimestep_(v175, v180, v179 - 1, 1);
        v182 = [CVNLPTextDecodingResultCandidate alloc];
        objc_msgSend_normalizedTotalLogProbability(v175, v183, v184, v185);
        long double v187 = v186;
        objc_msgSend_normalizedActivationLogProbability(v175, v188, v189, v190);
        long double v192 = v191;
        double v193 = exp(v187);
        long double v194 = exp(v192);
        v197 = objc_msgSend_initWithTokens_score_activationScore_(v182, v195, (uint64_t)v181, v196, v193, (double)v194);
        objc_msgSend_addObject_(v167, v198, (uint64_t)v197, v199);
      }
      uint64_t v172 = objc_msgSend_countByEnumeratingWithState_objects_count_(v168, v170, (uint64_t)&v228, (uint64_t)v260, 16);
    }
    while (v172);
  }

  unint64_t v203 = objc_msgSend_count(v167, v200, v201, v202);
  if (v203 <= objc_msgSend_pathCount(v224, v204, v205, v206))
  {
    id v212 = v167;
  }
  else
  {
    uint64_t v210 = objc_msgSend_pathCount(v224, v207, v208, v209);
    objc_msgSend_subarrayWithRange_(v167, v211, 0, v210);
    id v212 = (id)objc_claimAutoreleasedReturnValue();
  }
  v213 = v212;
  v214 = [CVNLPTextDecodingResult alloc];
  v217 = objc_msgSend_initWithCandidates_(v214, v215, (uint64_t)v213, v216);

  if (v220) {
    operator delete(v220);
  }
  if (__src) {
    operator delete(__src);
  }

  return v217;
}

- (id)greedyDecodingResultWithConfiguration:(id)a3
{
  v141[1] = *MEMORY[0x1E4F143B8];
  id v137 = a3;
  uint64_t v7 = objc_msgSend_characterObservations(self->_activationMatrix, v4, v5, v6);
  uint64_t v11 = objc_msgSend_blankIndex(self->_activationMatrix, v8, v9, v10);
  uint64_t v14 = objc_msgSend_objectAtIndexedSubscript_(v7, v12, v11, v13);

  id v15 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v139 = objc_msgSend_initWithString_(v15, v16, (uint64_t)&stru_1F0D56340, v17);
  uint64_t v21 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v18, v19, v20);
  v134 = v21;
  if (objc_msgSend_timestepCount(self->_activationMatrix, v22, v23, v24) < 1)
  {
    v138 = 0;
    uint64_t v70 = 0;
    double v31 = 0.0;
    double v32 = 0.0;
  }
  else
  {
    if (v137)
    {
      uint64_t v28 = 0;
      uint64_t v29 = 0;
      v138 = 0;
      uint64_t v30 = 0;
      uint64_t v133 = 0;
      double v31 = 0.0;
      char v135 = 1;
      double v32 = 0.0;
      while (v28 < objc_msgSend_timestepCount(self->_activationMatrix, v25, v26, v27))
      {
        double v140 = 0.0;
        uint64_t v34 = objc_msgSend_topCandidateForTimestep_outputLogProbability_outputIndex_(self->_activationMatrix, v33, v28, (uint64_t)&v140, 0);
        double v35 = v140;
        if (objc_msgSend_isEqualToString_(v34, v36, (uint64_t)v14, v37))
        {
          ++v30;
          double v32 = v140 + v32;
        }
        else
        {
          char isEqualToString = objc_msgSend_isEqualToString_(v34, v38, (uint64_t)v29, v39);
          ++v30;
          double v32 = v140 + v32;
          if ((isEqualToString & 1) == 0)
          {
            v44 = objc_msgSend_commitActionBlock(v137, v41, v42, v43);
            BOOL v45 = v44 == 0;

            if (!v45
              && (objc_msgSend_commitActionBlock(v137, v46, v47, v48),
                  v49 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue(),
                  objc_msgSend_string(v138, v50, v51, v52),
                  uint64_t v53 = objc_claimAutoreleasedReturnValue(),
                  uint64_t v54 = ((uint64_t (**)(void, void *, void *))v49)[2](v49, v53, v34),
                  v53,
                  v49,
                  v54)
              && objc_msgSend_length(v139, v46, v55, v48))
            {
              if (v135)
              {
                char v135 = 1;
              }
              else
              {
                if (v54 == 2)
                {
                  id v136 = v34;
                }
                else
                {
                  objc_msgSend_appendString_(v139, v46, (uint64_t)v34, v48);
                  id v136 = 0;
                }
                uint64_t v56 = [CVNLPTextDecodingToken alloc];
                long double v57 = exp(v32);
                v61 = objc_msgSend_numberWithDouble_(NSNumber, v58, v59, v60, (double)v57);
                uint64_t v63 = objc_msgSend_initWithString_score_alignmentScore_activationRange_terminatingCharacter_(v56, v62, (uint64_t)v139, (uint64_t)v61, &unk_1F0D5B1C0, v133, v30, v136);

                objc_msgSend_addObject_(v134, v64, v63, v65);
                id v66 = objc_alloc(MEMORY[0x1E4F28E78]);
                uint64_t v69 = objc_msgSend_initWithString_(v66, v67, (uint64_t)&stru_1F0D56340, v68);

                char v135 = 0;
                v133 += v30;
                double v32 = 0.0;
                v138 = (void *)v63;
                uint64_t v139 = (void *)v69;
                uint64_t v30 = 0;
              }
            }
            else
            {
              objc_msgSend_appendString_(v139, v46, (uint64_t)v34, v48);
              char v135 = 0;
            }
          }
        }

        double v31 = v35 + v31;
        ++v28;
        uint64_t v29 = v34;
      }
    }
    else
    {
      uint64_t v71 = 0;
      uint64_t v29 = 0;
      double v31 = 0.0;
      double v32 = 0.0;
      while (v71 < objc_msgSend_timestepCount(self->_activationMatrix, v25, v26, v27))
      {
        double v140 = 0.0;
        uint64_t v73 = objc_msgSend_topCandidateForTimestep_outputLogProbability_outputIndex_(self->_activationMatrix, v72, v71, (uint64_t)&v140, 0);
        double v74 = v140;
        if (objc_msgSend_isEqualToString_(v73, v75, (uint64_t)v14, v76))
        {
          double v79 = v140;
        }
        else
        {
          char v80 = objc_msgSend_isEqualToString_(v73, v77, (uint64_t)v29, v78);
          double v79 = v140;
          if ((v80 & 1) == 0) {
            objc_msgSend_appendString_(v139, v81, (uint64_t)v73, v82);
          }
        }

        double v31 = v74 + v31;
        double v32 = v79 + v32;
        ++v71;
        uint64_t v29 = v73;
      }
      v138 = 0;
      uint64_t v133 = 0;
    }

    uint64_t v70 = v133;
    uint64_t v21 = v134;
  }
  if (objc_msgSend_length(v139, v25, v26, v27))
  {
    uint64_t v86 = objc_msgSend_timestepCount(self->_activationMatrix, v83, v84, v85);
    v87 = [CVNLPTextDecodingToken alloc];
    long double v88 = exp(v32);
    v92 = objc_msgSend_numberWithDouble_(NSNumber, v89, v90, v91, (double)v88);
    uint64_t v94 = objc_msgSend_initWithString_score_alignmentScore_activationRange_terminatingCharacter_(v87, v93, (uint64_t)v139, (uint64_t)v92, &unk_1F0D5B1C0, v70, v86 - v70, 0);

    v138 = (void *)v94;
    uint64_t v21 = v134;
    objc_msgSend_addObject_(v134, v95, v94, v96);
  }
  else if (objc_msgSend_count(v21, v83, v84, v85) && v138)
  {
    uint64_t v100 = objc_msgSend_activationRange(v138, v97, v98, v99);
    uint64_t v104 = objc_msgSend_timestepCount(self->_activationMatrix, v101, v102, v103);
    v105 = [CVNLPTextDecodingToken alloc];
    v109 = objc_msgSend_string(v138, v106, v107, v108);
    uint64_t v113 = objc_msgSend_score(v138, v110, v111, v112);
    uint64_t v115 = objc_msgSend_initWithString_score_alignmentScore_activationRange_terminatingCharacter_(v105, v114, (uint64_t)v109, (uint64_t)v113, &unk_1F0D5B1C0, v100, v104 - v100, 0);

    objc_msgSend_removeLastObject(v134, v116, v117, v118);
    objc_msgSend_addObject_(v134, v119, (uint64_t)v115, v120);

    uint64_t v21 = v134;
  }
  uint64_t v121 = [CVNLPTextDecodingResultCandidate alloc];
  long double v122 = exp(v31);
  v125 = objc_msgSend_initWithTokens_score_activationScore_(v121, v123, (uint64_t)v21, v124, (double)v122, (double)v122);
  uint64_t v126 = [CVNLPTextDecodingResult alloc];
  v141[0] = v125;
  double v128 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v127, (uint64_t)v141, 1);
  float v131 = objc_msgSend_initWithCandidates_(v126, v129, (uint64_t)v128, v130);

  return v131;
}

- (CVNLPActivationMatrix)activationMatrix
{
  return self->_activationMatrix;
}

- (void)setActivationMatrix:(id)a3
{
}

- (void).cxx_destruct
{
}

@end