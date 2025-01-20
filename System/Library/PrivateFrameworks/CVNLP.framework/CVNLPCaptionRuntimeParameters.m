@interface CVNLPCaptionRuntimeParameters
- (CVNLPCaptionRuntimeParameters)initWithOptions:(id)a3;
- (NSArray)blackListRules;
- (NSArray)excludeGenderReplacements;
- (NSArray)excludeGenderTriggers;
- (NSArray)genderedTokens;
- (NSArray)replacements;
- (NSDictionary)classifierRevisions;
- (NSDictionary)sensitiveImageParameters;
- (double)captionModelLengthNormalizationFactor;
- (double)captionModelMinimumConfidence;
- (int)excludeGenderStrategy;
- (int)genderOption;
- (void)_loadRuntimeParameters:(id)a3;
- (void)setBlackListRules:(id)a3;
- (void)setCaptionModelLengthNormalizationFactor:(double)a3;
- (void)setCaptionModelMinimumConfidence:(double)a3;
- (void)setClassifierRevisions:(id)a3;
- (void)setExcludeGenderReplacements:(id)a3;
- (void)setExcludeGenderStrategy:(int)a3;
- (void)setExcludeGenderTriggers:(id)a3;
- (void)setGenderOption:(int)a3;
- (void)setGenderedTokens:(id)a3;
- (void)setReplacements:(id)a3;
- (void)setSensitiveImageParameters:(id)a3;
@end

@implementation CVNLPCaptionRuntimeParameters

- (CVNLPCaptionRuntimeParameters)initWithOptions:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CVNLPCaptionRuntimeParameters;
  v5 = [(CVNLPCaptionRuntimeParameters *)&v10 init];
  v8 = v5;
  if (v5)
  {
    *(_OWORD *)&v5->_captionModelMinimumConfidence = xmmword_1B4C9AFB0;
    v5->_excludeGenderStrategy = 1;
    objc_msgSend__loadRuntimeParameters_(v5, v6, (uint64_t)v4, v7);
  }

  return v8;
}

- (void)_loadRuntimeParameters:(id)a3
{
  uint64_t v242 = *MEMORY[0x1E4F143B8];
  id v211 = a3;
  v208 = objc_msgSend_objectForKeyedSubscript_(v211, v3, (uint64_t)CVNLPCaptionModelPath, v4);
  uint64_t v7 = objc_msgSend_URLByAppendingPathComponent_(v208, v5, @"runtime_parameters.json", v6);
  v8 = (void *)MEMORY[0x1E4F1C9B8];
  v210 = v7;
  v12 = objc_msgSend_path(v7, v9, v10, v11);
  uint64_t v15 = objc_msgSend_dataWithContentsOfFile_(v8, v13, (uint64_t)v12, v14);

  v209 = (void *)v15;
  if (v15)
  {
    objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E4F28D90], v16, v15, 0, 0);
    id location = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v17 = location;
    }
    else {
      id v17 = 0;
    }
    objc_storeStrong(&location, v17);
    if (!v17)
    {
      if (qword_1E9D40AF0 != -1) {
        dispatch_once(&qword_1E9D40AF0, &unk_1F0D56000);
      }
      log = (id)qword_1E9D40AE8;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v236 = v210;
        _os_log_error_impl(&dword_1B4BAD000, log, OS_LOG_TYPE_ERROR, "Could not load the contents of file at %@ as dictionary", buf, 0xCu);
      }
      goto LABEL_120;
    }
    v20 = objc_msgSend_objectForKeyedSubscript_(v17, v18, @"captionModel", v19);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      log = 0;
LABEL_33:

LABEL_34:
      v49 = objc_msgSend_objectForKeyedSubscript_(location, v24, @"classifiers", v25);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v52 = objc_msgSend_objectForKeyedSubscript_(location, v50, @"classifiers", v51);

        if (v52)
        {
          v206 = v52;
          v55 = objc_msgSend_objectForKeyedSubscript_(v52, v53, @"revisions", v54);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend_objectForKeyedSubscript_(v52, v56, @"revisions", v57);
            v58 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
            classifierRevisions = self->_classifierRevisions;
            self->_classifierRevisions = v58;
          }
          else
          {
            classifierRevisions = self->_classifierRevisions;
            self->_classifierRevisions = 0;
          }

          v62 = objc_msgSend_objectForKeyedSubscript_(v52, v60, @"blockingTokens", v61);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend_objectForKeyedSubscript_(v52, v63, @"blockingTokens", v64);
            id v217 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v217 = 0;
          }

          v67 = objc_msgSend_objectForKeyedSubscript_(v52, v65, @"categories", v66);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v70 = objc_msgSend_objectForKeyedSubscript_(v52, v68, @"categories", v69);

            if (v70)
            {
              v215 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v71, v72, v73);
              long long v232 = 0u;
              long long v233 = 0u;
              long long v230 = 0u;
              long long v231 = 0u;
              objc_msgSend_allKeys(v70, v74, v75, v76);
              obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v77, (uint64_t)&v230, (uint64_t)v241, 16);
              if (v78)
              {
                uint64_t v79 = *(void *)v231;
                do
                {
                  for (uint64_t i = 0; i != v78; ++i)
                  {
                    if (*(void *)v231 != v79) {
                      objc_enumerationMutation(obj);
                    }
                    id v81 = *(id *)(*((void *)&v230 + 1) + 8 * i);
                    v84 = objc_msgSend_objectForKeyedSubscript_(v70, v82, (uint64_t)v81, v83);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v87 = objc_msgSend_objectForKeyedSubscript_(v70, v85, (uint64_t)v81, v86);
                    }
                    else
                    {
                      v87 = 0;
                    }

                    v90 = objc_msgSend_objectForKeyedSubscript_(v87, v88, @"minimumConfidence", v89);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v93 = objc_msgSend_objectForKeyedSubscript_(v87, v91, @"minimumConfidence", v92);
                    }
                    else
                    {
                      v93 = 0;
                    }

                    v96 = objc_msgSend_objectForKeyedSubscript_(v87, v94, @"blockingTokens", v95);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v99 = objc_msgSend_objectForKeyedSubscript_(v87, v97, @"blockingTokens", v98);
                    }
                    else
                    {
                      v99 = 0;
                    }

                    v102 = objc_msgSend_objectForKeyedSubscript_(v87, v100, @"blockingTokensAnnex", v101);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v105 = objc_msgSend_objectForKeyedSubscript_(v87, v103, @"blockingTokensAnnex", v104);
                    }
                    else
                    {
                      v105 = 0;
                    }

                    if (v93)
                    {
                      v106 = [CVNLPCaptionSensitiveImageParameters alloc];
                      objc_msgSend_doubleValue(v93, v107, v108, v109);
                      v111 = objc_msgSend_initWithVisionIdentifier_minConfidence_commonBlockingTokens_categoryBlockingTokens_categoryBlockingTokensAnnex_(v106, v110, (uint64_t)v81, (uint64_t)v217, v99, v105);
                      objc_msgSend_setObject_forKeyedSubscript_(v215, v112, (uint64_t)v111, (uint64_t)v81);
                    }
                  }
                  uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v113, (uint64_t)&v230, (uint64_t)v241, 16);
                }
                while (v78);
              }

              v117 = (NSDictionary *)objc_msgSend_copy(v215, v114, v115, v116);
              sensitiveImageParameters = self->_sensitiveImageParameters;
              self->_sensitiveImageParameters = v117;
            }
          }
          else
          {
          }
LABEL_70:
          p_id location = &location;
          sub_1B4C44F30(&p_location, @"replacements");
          v119 = (NSArray *)objc_claimAutoreleasedReturnValue();
          replacements = self->_replacements;
          self->_replacements = v119;

          sub_1B4C44F30(&p_location, @"excludeGenderReplacements");
          v121 = (NSArray *)objc_claimAutoreleasedReturnValue();
          excludeGenderReplacements = self->_excludeGenderReplacements;
          self->_excludeGenderReplacements = v121;

          v125 = objc_msgSend_objectForKeyedSubscript_(location, v123, @"excludeGenderTriggers", v124);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend_objectForKeyedSubscript_(location, v126, @"excludeGenderTriggers", v127);
            id v218 = (id)objc_claimAutoreleasedReturnValue();

            if (!v218)
            {
              id v219 = 0;
LABEL_82:
              v148 = objc_msgSend_objectForKeyedSubscript_(v211, v128, (uint64_t)CVNLPCaptionEnableGenderedCaptions, v130);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v205 = objc_msgSend_objectForKeyedSubscript_(v211, v149, (uint64_t)CVNLPCaptionEnableGenderedCaptions, v150);

                if (v205)
                {
                  int v154 = objc_msgSend_unsignedIntegerValue(v205, v151, v152, v153);
                  goto LABEL_87;
                }
              }
              else
              {
              }
              v205 = 0;
              int v154 = 1;
LABEL_87:
              self->_genderOption = v154;
              v155 = objc_msgSend_objectForKeyedSubscript_(location, v151, @"filterTokens", v153);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                objc_msgSend_objectForKeyedSubscript_(location, v156, @"filterTokens", v157);
                id obja = (id)objc_claimAutoreleasedReturnValue();

                if (!obja)
                {
                  id obja = 0;
                  goto LABEL_98;
                }
                v155 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v158, v159, v160);
                v163 = objc_msgSend_objectForKeyedSubscript_(obja, v161, @"gender", v162);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v166 = objc_msgSend_objectForKeyedSubscript_(obja, v164, @"gender", v165);

                  if (v166) {
                    objc_msgSend_addObjectsFromArray_(v155, v167, (uint64_t)v166, v169);
                  }
                }
                else
                {

                  v166 = 0;
                }
                v170 = (NSArray *)objc_msgSend_copy(v155, v167, v168, v169);
                genderedTokens = self->_genderedTokens;
                self->_genderedTokens = v170;
              }
              else
              {
                id obja = 0;
              }

LABEL_98:
              objc_msgSend_objectForKeyedSubscript_(location, v158, @"blacklistTokens", v160);
              id v172 = (id)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v204 = objc_msgSend_objectForKeyedSubscript_(location, v173, @"blacklistTokens", v174);

                if (!v204)
                {
LABEL_119:

LABEL_120:
                  goto LABEL_121;
                }
                v216 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v175, v176, v177);
                v181 = objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E4F28B88], v178, v179, v180);
                long long v223 = 0u;
                long long v224 = 0u;
                long long v221 = 0u;
                long long v222 = 0u;
                id v172 = v204;
                uint64_t v185 = objc_msgSend_countByEnumeratingWithState_objects_count_(v172, v182, (uint64_t)&v221, (uint64_t)v239, 16);
                if (v185)
                {
                  uint64_t v186 = *(void *)v222;
                  do
                  {
                    uint64_t v187 = 0;
                    do
                    {
                      if (*(void *)v222 != v186) {
                        objc_enumerationMutation(v172);
                      }
                      v188 = objc_msgSend_stringByTrimmingCharactersInSet_(*(void **)(*((void *)&v221 + 1) + 8 * v187), v183, (uint64_t)v181, v184);
                      if (objc_msgSend_length(v188, v189, v190, v191))
                      {
                        id v220 = 0;
                        v193 = objc_msgSend_regularExpressionWithPattern_options_error_(MEMORY[0x1E4F28FD8], v192, (uint64_t)v188, 1, &v220);
                        id v194 = v220;
                        v197 = v194;
                        if (v193)
                        {
                          objc_msgSend_addObject_(v216, v195, (uint64_t)v193, v196);
                        }
                        else if (v194)
                        {
                          if (qword_1E9D40AF0 != -1) {
                            dispatch_once(&qword_1E9D40AF0, &unk_1F0D56000);
                          }
                          v198 = (id)qword_1E9D40AE8;
                          if (os_log_type_enabled(v198, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138412546;
                            v236 = v188;
                            __int16 v237 = 2112;
                            v238 = v197;
                            _os_log_error_impl(&dword_1B4BAD000, v198, OS_LOG_TYPE_ERROR, "Error adding caption rules-file line: %@. Error: %@", buf, 0x16u);
                          }
                        }
                      }

                      ++v187;
                    }
                    while (v185 != v187);
                    uint64_t v185 = objc_msgSend_countByEnumeratingWithState_objects_count_(v172, v183, (uint64_t)&v221, (uint64_t)v239, 16);
                  }
                  while (v185);
                }

                v202 = (NSArray *)objc_msgSend_copy(v216, v199, v200, v201);
                blackListRules = self->_blackListRules;
                self->_blackListRules = v202;
              }
              goto LABEL_119;
            }
            v125 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v128, v129, v130);
            long long v227 = 0u;
            long long v228 = 0u;
            long long v225 = 0u;
            long long v226 = 0u;
            id v219 = v218;
            uint64_t v132 = objc_msgSend_countByEnumeratingWithState_objects_count_(v219, v131, (uint64_t)&v225, (uint64_t)v240, 16);
            if (v132)
            {
              uint64_t v133 = *(void *)v226;
              do
              {
                for (uint64_t j = 0; j != v132; ++j)
                {
                  if (*(void *)v226 != v133) {
                    objc_enumerationMutation(v219);
                  }
                  uint64_t v135 = *(void *)(*((void *)&v225 + 1) + 8 * j);
                  v136 = [CVNLPCaptionRuntimeExcludeGenderTrigger alloc];
                  v139 = objc_msgSend_initWithDictionary_(v136, v137, v135, v138);
                  objc_msgSend_addObject_(v125, v140, (uint64_t)v139, v141);
                }
                uint64_t v132 = objc_msgSend_countByEnumeratingWithState_objects_count_(v219, v142, (uint64_t)&v225, (uint64_t)v240, 16);
              }
              while (v132);
            }

            v146 = (NSArray *)objc_msgSend_copy(v125, v143, v144, v145);
            excludeGenderTriggers = self->_excludeGenderTriggers;
            self->_excludeGenderTriggers = v146;
          }
          else
          {
            id v219 = 0;
          }

          goto LABEL_82;
        }
      }
      else
      {
      }
      v206 = 0;
      goto LABEL_70;
    }
    v23 = objc_msgSend_objectForKeyedSubscript_(location, v21, @"captionModel", v22);

    if (!v23)
    {
      log = 0;
      goto LABEL_34;
    }
    log = v23;
    v26 = objc_msgSend_objectForKeyedSubscript_(v23, v24, @"minimumConfidence", v25);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = objc_msgSend_objectForKeyedSubscript_(log, v27, @"minimumConfidence", v28);

      if (v20)
      {
        objc_msgSend_doubleValue(v20, v29, v30, v31);
        self->_captionModelMinimumConfidence = v32;
      }
    }
    else
    {

      v20 = 0;
    }
    v34 = objc_msgSend_objectForKeyedSubscript_(log, v29, @"lengthNormalizationFactor", v31);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v37 = objc_msgSend_objectForKeyedSubscript_(log, v35, @"lengthNormalizationFactor", v36);

      if (v37)
      {
        objc_msgSend_doubleValue(v37, v38, v39, v40);
        self->_captionModelLengthNormalizationFactor = v41;
      }
    }
    else
    {

      v37 = 0;
    }
    v42 = objc_msgSend_objectForKeyedSubscript_(log, v38, @"excludeGenderStrategy", v40);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v45 = objc_msgSend_objectForKeyedSubscript_(log, v43, @"excludeGenderStrategy", v44);

      if (!v45)
      {
LABEL_32:

        goto LABEL_33;
      }
      self->_excludeGenderStrategy = objc_msgSend_unsignedIntegerValue(v45, v46, v47, v48);
    }
    else
    {
      v45 = v42;
    }

    goto LABEL_32;
  }
  if (qword_1E9D40AF0 != -1) {
    dispatch_once(&qword_1E9D40AF0, &unk_1F0D56000);
  }
  v33 = (id)qword_1E9D40AE8;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v236 = v210;
    _os_log_error_impl(&dword_1B4BAD000, v33, OS_LOG_TYPE_ERROR, "Could not load the contents of file at %@", buf, 0xCu);
  }

LABEL_121:
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

- (NSDictionary)classifierRevisions
{
  return self->_classifierRevisions;
}

- (void)setClassifierRevisions:(id)a3
{
}

- (NSDictionary)sensitiveImageParameters
{
  return self->_sensitiveImageParameters;
}

- (void)setSensitiveImageParameters:(id)a3
{
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
  objc_storeStrong((id *)&self->_sensitiveImageParameters, 0);
  objc_storeStrong((id *)&self->_classifierRevisions, 0);
}

@end