@interface CSUCaptionRuntimeParameters
- (CSUCaptionRuntimeParameters)initWithOptions:(id)a3;
- (NSArray)blackListRules;
- (NSArray)excludeGenderReplacements;
- (NSArray)excludeGenderTriggers;
- (NSArray)genderedTokens;
- (NSArray)replacements;
- (double)captionModelLengthNormalizationFactor;
- (double)captionModelMinimumConfidence;
- (int)excludeGenderStrategy;
- (int)genderOption;
- (void)_loadRuntimeParameters:(id)a3;
- (void)setBlackListRules:(id)a3;
- (void)setCaptionModelLengthNormalizationFactor:(double)a3;
- (void)setCaptionModelMinimumConfidence:(double)a3;
- (void)setExcludeGenderReplacements:(id)a3;
- (void)setExcludeGenderStrategy:(int)a3;
- (void)setExcludeGenderTriggers:(id)a3;
- (void)setGenderOption:(int)a3;
- (void)setGenderedTokens:(id)a3;
- (void)setReplacements:(id)a3;
@end

@implementation CSUCaptionRuntimeParameters

- (CSUCaptionRuntimeParameters)initWithOptions:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSUCaptionRuntimeParameters;
  v5 = [(CSUCaptionRuntimeParameters *)&v11 init];
  v6 = v5;
  if (v5)
  {
    *(_OWORD *)&v5->_captionModelMinimumConfidence = xmmword_24C730370;
    v5->_excludeGenderStrategy = 1;
    NSLog(&stru_26FEE0188.isa, v4);
    objc_msgSend__loadRuntimeParameters_(v6, v7, (uint64_t)v4, v8, v9);
  }

  return v6;
}

- (void)_loadRuntimeParameters:(id)a3
{
  uint64_t v249 = *MEMORY[0x263EF8340];
  id v246 = a3;
  v232 = v246;
  v6 = objc_msgSend_objectForKeyedSubscript_(v246, v3, @"captionModel", v4, v5);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = objc_msgSend_objectForKeyedSubscript_(v246, v7, @"captionModel", v8, v9);

    if (v10)
    {
      v230 = v10;
      v14 = objc_msgSend_objectForKeyedSubscript_(v10, v11, @"minimumConfidence", v12, v13);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = objc_msgSend_objectForKeyedSubscript_(v10, v15, @"minimumConfidence", v16, v17);

        if (v18)
        {
          objc_msgSend_doubleValue(v18, v19, v20, v21, v22);
          self->_captionModelMinimumConfidence = v26;
          goto LABEL_14;
        }
      }
      else
      {
      }
      v34 = sub_24C69662C();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        sub_24C72A5A0(v34, v35, v36, v37, v38, v39, v40, v41);
      }

      v18 = 0;
LABEL_14:
      v42 = objc_msgSend_objectForKeyedSubscript_(v10, v23, @"lengthNormalizationFactor", v24, v25);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v46 = objc_msgSend_objectForKeyedSubscript_(v10, v43, @"lengthNormalizationFactor", v44, v45);

        if (v46)
        {
          objc_msgSend_doubleValue(v46, v47, v48, v49, v50);
          self->_captionModelLengthNormalizationFactor = v54;
          goto LABEL_21;
        }
      }
      else
      {
      }
      v55 = sub_24C69662C();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG)) {
        sub_24C72A528(v55, v56, v57, v58, v59, v60, v61, v62);
      }

      v46 = 0;
LABEL_21:
      v63 = objc_msgSend_objectForKeyedSubscript_(v10, v51, @"excludeGenderStrategy", v52, v53);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v67 = objc_msgSend_objectForKeyedSubscript_(v230, v64, @"excludeGenderStrategy", v65, v66);

        if (v67)
        {
          self->_excludeGenderStrategy = objc_msgSend_unsignedIntegerValue(v67, v68, v69, v70, v71);
LABEL_27:

          goto LABEL_28;
        }
      }
      else
      {
      }
      v67 = sub_24C69662C();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG)) {
        sub_24C72A4B0(v67, v72, v73, v74, v75, v76, v77, v78);
      }
      goto LABEL_27;
    }
  }
  else
  {
  }
  v18 = sub_24C69662C();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_24C72A438(v18, v27, v28, v29, v30, v31, v32, v33);
  }
  v230 = 0;
LABEL_28:

  v245 = &v246;
  sub_24C6AEB90(&v245, @"replacements");
  v79 = (NSArray *)objc_claimAutoreleasedReturnValue();
  replacements = self->_replacements;
  self->_replacements = v79;

  sub_24C6AEB90(&v245, @"excludeGenderReplacements");
  v81 = (NSArray *)objc_claimAutoreleasedReturnValue();
  excludeGenderReplacements = self->_excludeGenderReplacements;
  self->_excludeGenderReplacements = v81;

  v86 = objc_msgSend_objectForKeyedSubscript_(v246, v83, @"excludeGenderTriggers", v84, v85);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v90 = objc_msgSend_objectForKeyedSubscript_(v246, v87, @"excludeGenderTriggers", v88, v89);

    if (v90)
    {
      v95 = objc_msgSend_array(MEMORY[0x263EFF980], v91, v92, v93, v94);
      long long v243 = 0u;
      long long v244 = 0u;
      long long v241 = 0u;
      long long v242 = 0u;
      obuint64_t j = v90;
      uint64_t v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v96, (uint64_t)&v241, (uint64_t)v248, 16);
      if (v97)
      {
        uint64_t v98 = *(void *)v242;
        do
        {
          for (uint64_t i = 0; i != v97; ++i)
          {
            if (*(void *)v242 != v98) {
              objc_enumerationMutation(obj);
            }
            uint64_t v100 = *(void *)(*((void *)&v241 + 1) + 8 * i);
            v101 = [CSUCaptionRuntimeExcludeGenderTrigger alloc];
            v105 = objc_msgSend_initWithDictionary_(v101, v102, v100, v103, v104);
            objc_msgSend_addObject_(v95, v106, (uint64_t)v105, v107, v108);
          }
          uint64_t v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v109, (uint64_t)&v241, (uint64_t)v248, 16);
        }
        while (v97);
      }

      v114 = (NSArray *)objc_msgSend_copy(v95, v110, v111, v112, v113);
      excludeGenderTriggers = self->_excludeGenderTriggers;
      self->_excludeGenderTriggers = v114;

      goto LABEL_42;
    }
  }
  else
  {
  }
  v95 = sub_24C69662C();
  if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG)) {
    sub_24C72A3C0(v95, v116, v117, v118, v119, v120, v121, v122);
  }
  obuint64_t j = 0;
LABEL_42:

  v126 = objc_msgSend_objectForKeyedSubscript_(v232, v123, (uint64_t)off_2697ED1B8, v124, v125);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v229 = objc_msgSend_objectForKeyedSubscript_(v232, v127, (uint64_t)off_2697ED1B8, v128, v129);

    if (v229)
    {
      int v134 = objc_msgSend_unsignedIntegerValue(v229, v130, v131, v132, v133);
      goto LABEL_47;
    }
  }
  else
  {
  }
  v229 = 0;
  int v134 = 1;
LABEL_47:
  self->_genderOption = v134;
  v135 = sub_24C69662C();
  if (os_log_type_enabled(v135, OS_LOG_TYPE_DEBUG)) {
    sub_24C72A344(&self->_genderOption, v135);
  }

  v139 = objc_msgSend_objectForKeyedSubscript_(v246, v136, @"filterTokens", v137, v138);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v231 = objc_msgSend_objectForKeyedSubscript_(v246, v140, @"filterTokens", v141, v142);

    if (v231)
    {
      v147 = objc_msgSend_array(MEMORY[0x263EFF980], v143, v144, v145, v146);
      v151 = objc_msgSend_objectForKeyedSubscript_(v231, v148, @"gender", v149, v150);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v155 = objc_msgSend_objectForKeyedSubscript_(v231, v152, @"gender", v153, v154);

        if (v155)
        {
          objc_msgSend_addObjectsFromArray_(v147, v156, (uint64_t)v155, v157, v158);
LABEL_62:
          v178 = (NSArray *)objc_msgSend_copy(v147, v159, v160, v161, v162, v229, v230);
          genderedTokens = self->_genderedTokens;
          self->_genderedTokens = v178;

          goto LABEL_63;
        }
      }
      else
      {
      }
      v170 = sub_24C69662C();
      if (os_log_type_enabled(v170, OS_LOG_TYPE_DEBUG)) {
        sub_24C72A2CC(v170, v171, v172, v173, v174, v175, v176, v177);
      }

      v155 = 0;
      goto LABEL_62;
    }
  }
  else
  {
  }
  v147 = sub_24C69662C();
  if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG)) {
    sub_24C72A254(v147, v163, v164, v165, v166, v167, v168, v169);
  }
  v231 = 0;
LABEL_63:

  v183 = objc_msgSend_objectForKeyedSubscript_(v246, v180, @"blacklistTokens", v181, v182);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v233 = objc_msgSend_objectForKeyedSubscript_(v246, v184, @"blacklistTokens", v185, v186);
  }
  else
  {
    v233 = 0;
  }

  v195 = objc_msgSend_array(MEMORY[0x263EFF980], v187, v188, v189, v190);
  if (v233)
  {
    v196 = objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x263F08708], v191, v192, v193, v194);
    long long v239 = 0u;
    long long v240 = 0u;
    long long v237 = 0u;
    long long v238 = 0u;
    id v197 = v233;
    uint64_t v202 = objc_msgSend_countByEnumeratingWithState_objects_count_(v197, v198, (uint64_t)&v237, (uint64_t)v247, 16);
    if (v202)
    {
      uint64_t v203 = *(void *)v238;
      do
      {
        for (uint64_t j = 0; j != v202; ++j)
        {
          if (*(void *)v238 != v203) {
            objc_enumerationMutation(v197);
          }
          v205 = objc_msgSend_stringByTrimmingCharactersInSet_(*(void **)(*((void *)&v237 + 1) + 8 * j), v199, (uint64_t)v196, v200, v201, v229);
          if (objc_msgSend_length(v205, v206, v207, v208, v209))
          {
            id v236 = 0;
            v211 = objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x263F08AE8], v210, (uint64_t)v205, 1, (uint64_t)&v236);
            id v215 = v236;
            if (v211) {
              objc_msgSend_addObject_(v195, v212, (uint64_t)v211, v213, v214);
            }
          }
        }
        uint64_t v202 = objc_msgSend_countByEnumeratingWithState_objects_count_(v197, v199, (uint64_t)&v237, (uint64_t)v247, 16);
      }
      while (v202);
    }
  }
  else
  {
    v196 = sub_24C69662C();
    if (os_log_type_enabled(v196, OS_LOG_TYPE_DEBUG)) {
      sub_24C72A1DC(v196, v216, v217, v218, v219, v220, v221, v222);
    }
  }

  v227 = (NSArray *)objc_msgSend_copy(v195, v223, v224, v225, v226);
  blackListRules = self->_blackListRules;
  self->_blackListRules = v227;
}

- (double)captionModelMinimumConfidence
{
  return self->_captionModelMinimumConfidence;
}

- (void)setCaptionModelMinimumConfidence:(double)a3
{
  self->_captionModelMinimumConfidence = a3;
}

- (double)captionModelLengthNormalizationFactor
{
  return self->_captionModelLengthNormalizationFactor;
}

- (void)setCaptionModelLengthNormalizationFactor:(double)a3
{
  self->_captionModelLengthNormalizationFactor = a3;
}

- (int)excludeGenderStrategy
{
  return self->_excludeGenderStrategy;
}

- (void)setExcludeGenderStrategy:(int)a3
{
  self->_excludeGenderStrategy = a3;
}

- (NSArray)replacements
{
  return self->_replacements;
}

- (void)setReplacements:(id)a3
{
}

- (NSArray)genderedTokens
{
  return self->_genderedTokens;
}

- (void)setGenderedTokens:(id)a3
{
}

- (NSArray)blackListRules
{
  return self->_blackListRules;
}

- (void)setBlackListRules:(id)a3
{
}

- (NSArray)excludeGenderReplacements
{
  return self->_excludeGenderReplacements;
}

- (void)setExcludeGenderReplacements:(id)a3
{
}

- (NSArray)excludeGenderTriggers
{
  return self->_excludeGenderTriggers;
}

- (void)setExcludeGenderTriggers:(id)a3
{
}

- (int)genderOption
{
  return self->_genderOption;
}

- (void)setGenderOption:(int)a3
{
  self->_genderOption = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludeGenderTriggers, 0);
  objc_storeStrong((id *)&self->_excludeGenderReplacements, 0);
  objc_storeStrong((id *)&self->_blackListRules, 0);
  objc_storeStrong((id *)&self->_genderedTokens, 0);
  objc_storeStrong((id *)&self->_replacements, 0);
}

@end