@interface CVNLPCaptionDecoderTransformer
- (CVNLPBeamSearch)beamSearch;
- (CVNLPBeamSearch)filterBeamSearch;
- (CVNLPCaptionDecoderTransformer)initWithOptions:(id)a3 runTimeParams:(id)a4;
- (NSArray)decoderBlocks;
- (NSDictionary)vocab;
- (id)computeCaptionForImageWithInputs:(id)a3 genderOption:(int)a4;
- (id)computeCaptionForImageWithInputsImpl:(id)a3 genderOption:(int)a4;
- (id)performanceResults;
- (unint64_t)beamSize;
- (unint64_t)decoderBatchSize;
- (unint64_t)endID;
- (unint64_t)maxCaptionLen;
- (unint64_t)outputVocabSize;
- (unint64_t)startID;
- (unint64_t)vocabSize;
- (void)_createBeamSearch:(id)a3 runTimeParams:(id)a4;
- (void)_loadNetwork:(id)a3 options:(id)a4 runTimeParams:(id)a5;
- (void)_loadVocabFile:(id)a3;
- (void)dealloc;
- (void)setBeamSearch:(CVNLPBeamSearch *)a3;
- (void)setBeamSize:(unint64_t)a3;
- (void)setDecoderBatchSize:(unint64_t)a3;
- (void)setDecoderBlocks:(id)a3;
- (void)setEndID:(unint64_t)a3;
- (void)setFilterBeamSearch:(CVNLPBeamSearch *)a3;
- (void)setMaxCaptionLen:(unint64_t)a3;
- (void)setOutputVocabSize:(unint64_t)a3;
- (void)setStartID:(unint64_t)a3;
- (void)setVocab:(id)a3;
- (void)setVocabSize:(unint64_t)a3;
@end

@implementation CVNLPCaptionDecoderTransformer

- (CVNLPCaptionDecoderTransformer)initWithOptions:(id)a3 runTimeParams:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CVNLPCaptionDecoderTransformer;
  v8 = [(CVNLPCaptionModelBase *)&v18 initWithOptions:v6 runTimeParams:v7];
  v11 = v8;
  if (v8)
  {
    v8->_startID = 0;
    v8->_endID = 0;
    v12 = objc_msgSend_objectForKeyedSubscript_(v6, v9, (uint64_t)CVNLPCaptionModelPath, v10);
    objc_msgSend__loadVocabFile_(v11, v13, (uint64_t)v12, v14);
    objc_msgSend__loadNetwork_options_runTimeParams_(v11, v15, (uint64_t)v12, (uint64_t)v6, v7);
    objc_msgSend__createBeamSearch_runTimeParams_(v11, v16, (uint64_t)v6, (uint64_t)v7);
    if (v11->_vocabSize != v11->_outputVocabSize) {
      sub_1B4C53070(3u, (uint64_t)"Mismatching vocab file and output vocab sizes");
    }
  }
  return v11;
}

- (void)_loadVocabFile:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_URLByAppendingPathComponent_(v4, v5, @"vocab_reverse.json", v6);
  v8 = (void *)MEMORY[0x1E4F1C9B8];
  v12 = objc_msgSend_path(v7, v9, v10, v11);
  v15 = objc_msgSend_dataWithContentsOfFile_(v8, v13, (uint64_t)v12, v14);

  id v23 = 0;
  objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E4F28D90], v16, (uint64_t)v15, 0, &v23);
  v17 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  id v18 = v23;
  vocab = self->_vocab;
  self->_vocab = v17;

  self->_vocabSize = objc_msgSend_count(self->_vocab, v20, v21, v22) + 1;
}

- (void)_loadNetwork:(id)a3 options:(id)a4 runTimeParams:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v14 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v11, v12, v13);
  for (uint64_t i = 0; ; ++i)
  {
    v16 = [CVNLPCaptionDecoderBlock alloc];
    uint64_t v21 = objc_msgSend_initWithOptions_modelIndex_runTimeParams_(v16, v17, (uint64_t)v9, i, v10);
    if (!v21) {
      break;
    }
    objc_msgSend_addObject_(v14, v18, (uint64_t)v21, v20);
  }
  if (!objc_msgSend_count(v14, v18, v19, v20))
  {
    v25 = (char *)operator new(0x20uLL);
    strcpy(v25, "Failed to load decoder network");
    sub_1B4C53070(3u, (uint64_t)v25);
  }
  v26 = (NSArray *)objc_msgSend_copy(v14, v22, v23, v24);
  unint64_t v27 = 0;
  decoderBlocks = self->_decoderBlocks;
  self->_decoderBlocks = v26;
  while (1)
  {

    if (v27 >= objc_msgSend_count(v14, v29, v30, v31) - 1) {
      break;
    }
    v35 = objc_msgSend_decoderBlocks(self, v32, v33, v34);
    decoderBlocks = objc_msgSend_objectAtIndexedSubscript_(v35, v36, v27, v37);

    v41 = objc_msgSend_decoderBlocks(self, v38, v39, v40);
    v44 = objc_msgSend_objectAtIndexedSubscript_(v41, v42, v27 + 1, v43);

    objc_msgSend_setNextBlock_(decoderBlocks, v45, (uint64_t)v44, v46);
    ++v27;
  }
  v47 = objc_msgSend_firstObject(v14, v32, v33, v34);
  uint64_t v51 = objc_msgSend_lastObject(v14, v48, v49, v50);
  v55 = (void *)v51;
  if (!v47)
  {
    unint64_t decoderBatchSize = 0;
    p_maxCaptionLen = &self->_maxCaptionLen;
    self->_maxCaptionLen = 0;
    self->_unint64_t decoderBatchSize = 0;
    if (!v51) {
      goto LABEL_15;
    }
    goto LABEL_20;
  }
  objc_msgSend_decoderInputNames(v47, v52, v53, v54);
  v59 = v94;
  unint64_t v60 = 0xAAAAAAAAAAAAAAABLL * (v94 - v93);
  if (!v93)
  {
LABEL_13:
    if (v60 <= 4) {
      goto LABEL_14;
    }
    goto LABEL_23;
  }
  if (v94 == v93)
  {
    operator delete(v93);
    goto LABEL_13;
  }
  do
  {
    if (*((char *)v59 - 1) < 0) {
      operator delete(*(v59 - 3));
    }
    v59 -= 3;
  }
  while (v59 != v93);
  operator delete(v93);
  if (v60 < 5)
  {
LABEL_14:
    objc_msgSend_blockInput(v47, v56, v57, v58);
    objc_msgSend_blockInput(v47, v61, v62, v63);
    p_maxCaptionLen = &self->_maxCaptionLen;
    self->_maxCaptionLen = v92 * v95;
    objc_msgSend_blockInput(v47, v65, v66, v67);
    objc_msgSend_blockInput(v47, v68, v69, v70);
    objc_msgSend_blockInput(v47, v71, v72, v73);
    unint64_t decoderBatchSize = v91 * v98 * v90;
    self->_unint64_t decoderBatchSize = decoderBatchSize;
    if (!v55)
    {
LABEL_15:
      unint64_t v75 = 0;
LABEL_21:
      unint64_t v82 = v75 / (*p_maxCaptionLen * decoderBatchSize);
      goto LABEL_26;
    }
LABEL_20:
    objc_msgSend_blockOutput(v55, v52, v53, v54);
    objc_msgSend_blockOutput(v55, v76, v77, v78);
    objc_msgSend_blockOutput(v55, v79, v80, v81);
    unint64_t decoderBatchSize = self->_decoderBatchSize;
    unint64_t v75 = v91 * v95 * v89;
    goto LABEL_21;
  }
LABEL_23:
  objc_msgSend_blockInput(v47, v56, v57, v58);
  self->_maxCaptionLen = v98;
  objc_msgSend_blockInput(v47, v83, v84, v85);
  self->_unint64_t decoderBatchSize = v97;
  if (v55)
  {
    objc_msgSend_blockOutput(v55, v86, v87, v88);
    unint64_t v82 = v96;
  }
  else
  {
    unint64_t v82 = 0;
  }
LABEL_26:
  self->_outputVocabSize = v82;
}

- (void)_createBeamSearch:(id)a3 runTimeParams:(id)a4
{
  id v50 = a3;
  id v6 = a4;
  id v10 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8, v9);
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v50, v11, (uint64_t)CVNLPBeamSearchSize, v12);
  v17 = v13;
  if (v13) {
    uint64_t v18 = objc_msgSend_unsignedIntegerValue(v13, v14, v15, v16);
  }
  else {
    uint64_t v18 = 1;
  }
  self->_beamSize = v18;
  uint64_t v19 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v14, v18, v16);
  objc_msgSend_setObject_forKeyedSubscript_(v10, v20, (uint64_t)v19, (uint64_t)CVNLPBeamSearchSize);

  uint64_t v21 = NSNumber;
  objc_msgSend_captionModelLengthNormalizationFactor(v6, v22, v23, v24);
  v28 = objc_msgSend_numberWithDouble_(v21, v25, v26, v27);
  objc_msgSend_setObject_forKeyedSubscript_(v10, v29, (uint64_t)v28, (uint64_t)CVNLPBeamSearchLengthNormalizationFactor);

  v32 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v30, self->_endID, v31);
  objc_msgSend_setObject_forKeyedSubscript_(v10, v33, (uint64_t)v32, (uint64_t)CVNLPBeamEndToken);

  v36 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v34, self->_vocabSize, v35);
  objc_msgSend_setObject_forKeyedSubscript_(v10, v37, (uint64_t)v36, (uint64_t)CVNLPBeamSearchOutputVocabSize);

  objc_msgSend_setObject_forKeyedSubscript_(v10, v38, (uint64_t)self->_vocab, (uint64_t)CVNLPBeamSearchOutputVocabMap);
  v42 = objc_msgSend_blackListRules(v6, v39, v40, v41);
  objc_msgSend_setObject_forKeyedSubscript_(v10, v43, (uint64_t)v42, (uint64_t)CVNLPBeamSearchBlacklistRules);

  objc_msgSend_setObject_forKeyedSubscript_(v10, v44, MEMORY[0x1E4F1CC38], (uint64_t)CVNLPBeamSearchIncludeLanguageModel);
  self->_beamSearch = (CVNLPBeamSearch *)CVNLPBeamSearchCreate(v10, 0);
  v48 = objc_msgSend_genderedTokens(v6, v45, v46, v47);
  objc_msgSend_setObject_forKeyedSubscript_(v10, v49, (uint64_t)v48, (uint64_t)CVNLPBeamSearchOutputVocabFilterList);

  self->_filterBeamSearch = (CVNLPBeamSearch *)CVNLPBeamSearchCreate(v10, 0);
}

- (void)dealloc
{
  beamSearch = self->_beamSearch;
  if (beamSearch) {
    CFRelease(beamSearch);
  }
  filterBeamSearch = self->_filterBeamSearch;
  if (filterBeamSearch) {
    CFRelease(filterBeamSearch);
  }
  v5.receiver = self;
  v5.super_class = (Class)CVNLPCaptionDecoderTransformer;
  [(CVNLPCaptionDecoderTransformer *)&v5 dealloc];
}

- (id)computeCaptionForImageWithInputs:(id)a3 genderOption:(int)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1B4C7BDE0;
  uint64_t v23 = sub_1B4C7BDF0;
  id v24 = 0;
  id v10 = objc_msgSend_perfResults(self, v7, v8, v9);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1B4C7BDF8;
  v15[3] = &unk_1E60A3E68;
  v17 = &v19;
  v15[4] = self;
  id v11 = v6;
  id v16 = v11;
  int v18 = a4;
  objc_msgSend_run_block_(v10, v12, @"Decode", (uint64_t)v15);

  id v13 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v13;
}

- (id)computeCaptionForImageWithInputsImpl:(id)a3 genderOption:(int)a4
{
  uint64_t v218 = *MEMORY[0x1E4F143B8];
  v212 = self;
  id v6 = a3;
  uint64_t v9 = 9;
  if (!a4) {
    uint64_t v9 = 10;
  }
  uint64_t v169 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                    + OBJC_IVAR___CVNLPCaptionDecoderTransformer__startID[v9]);
  v166 = v6;
  v171 = objc_msgSend_objectAtIndexedSubscript_(v6, v7, 0, v8);
  id v13 = objc_msgSend_decoderBlocks(self, v10, v11, v12);
  v17 = objc_msgSend_firstObject(v13, v14, v15, v16);
  uint64_t v21 = v17;
  if (!v17)
  {

    goto LABEL_15;
  }
  objc_msgSend_decoderInputNames(v17, v18, v19, v20);
  uint64_t v22 = p_p;
  unint64_t v23 = 0xAAAAAAAAAAAAAAABLL * (((char *)p_p - (unsigned char *)__p) >> 3);
  if (!__p)
  {

    if (v23 >= 5) {
      goto LABEL_26;
    }
    goto LABEL_15;
  }
  id v24 = __p;
  if (p_p != __p)
  {
    do
    {
      if (*((char *)v22 - 1) < 0) {
        operator delete(*(v22 - 3));
      }
      v22 -= 3;
    }
    while (v22 != __p);
    id v24 = __p;
  }
  p_p = (void **)__p;
  operator delete(v24);

  if (v23 < 5)
  {
LABEL_15:
    long long v210 = 0u;
    long long v211 = 0u;
    long long v208 = 0u;
    long long v209 = 0u;
    v28 = objc_msgSend_decoderBlocks(v212, v25, v26, v27);
    uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v208, (uint64_t)v217, 16);
    if (v33)
    {
      uint64_t v34 = *(void *)v209;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v209 != v34) {
            objc_enumerationMutation(v28);
          }
          v36 = *(void **)(*((void *)&v208 + 1) + 8 * i);
          uint64_t v37 = v212;
          if (v36)
          {
            objc_msgSend_attFeatsPlaceholderBlob(v36, v30, v31, v32);
          }
          else
          {
            uint64_t v207 = 0;
            memset(v206, 0, sizeof(v206));
          }
          objc_msgSend__copy_data_to_blob_repeated_to_(v37, v30, (uint64_t)v171, (uint64_t)v206);
        }
        uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v30, (uint64_t)&v208, (uint64_t)v217, 16);
      }
      while (v33);
    }
  }
LABEL_26:
  v38 = objc_msgSend_decoderBlocks(v212, v25, v26, v27);
  objc_msgSend_firstObject(v38, v39, v40, v41);
  id v205 = (id)objc_claimAutoreleasedReturnValue();

  v45 = objc_msgSend_decoderBlocks(v212, v42, v43, v44);
  objc_msgSend_lastObject(v45, v46, v47, v48);
  id v204 = (id)objc_claimAutoreleasedReturnValue();

  v52 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v49, v50, v51);
  v167 = v52;
  unint64_t v56 = objc_msgSend_maxCaptionLen(v212, v53, v54, v55);
  unint64_t v60 = v56;
  v201 = 0;
  v202 = 0;
  v203 = 0;
  if (v56)
  {
    if (v56 >> 62) {
      sub_1B4BB3244();
    }
    size_t v61 = 4 * v56;
    v201 = (char *)operator new(4 * v56);
    v203 = &v201[4 * v60];
    v164 = v201;
    bzero(v201, v61);
    v202 = v203;
  }
  else
  {
    v164 = 0;
  }
  v165 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v57, v58, v59);
  objc_msgSend_setObject_forKeyedSubscript_(v52, v62, (uint64_t)v165, (uint64_t)CVNLPBeamSearchNextTokenMetaData);
  uint64_t v63 = NSNumber;
  uint64_t started = objc_msgSend_startID(v212, v64, v65, v66);
  uint64_t v70 = objc_msgSend_numberWithUnsignedInteger_(v63, v68, started, v69);
  objc_msgSend_setObject_forKeyedSubscript_(v52, v71, (uint64_t)v70, (uint64_t)CVNLPBeamSearchNextTokenID);

  __p = 0;
  p_p = &__p;
  uint64_t v197 = 0x3032000000;
  v198 = sub_1B4C7BDE0;
  v199 = sub_1B4C7BDF0;
  v216 = v52;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v72, (uint64_t)&v216, 1);
  id v200 = (id)objc_claimAutoreleasedReturnValue();
  id v168 = v205;
  unint64_t v76 = 0;
  do
  {
    if (v76 >= objc_msgSend_maxCaptionLen(v212, v73, v74, v75)) {
      break;
    }
    uint64_t v80 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v77, v78, v79);
    uint64_t v84 = objc_msgSend_perfResults(v212, v81, v82, v83);
    v183[0] = MEMORY[0x1E4F143A8];
    v183[1] = 3321888768;
    v183[2] = sub_1B4C7C9A0;
    v183[3] = &unk_1F0D55E88;
    id v184 = v205;
    unint64_t v189 = v76;
    id v185 = v171;
    v186 = v212;
    v188 = &__p;
    v190 = (void **)&v212;
    id v191 = v168;
    v192 = (void **)&v212;
    v193 = &v204;
    v194 = &v205;
    id v85 = (id)v80;
    id v187 = v85;
    objc_msgSend_run_block_(v84, v86, @"DecodeBlock", (uint64_t)v183);

    uint64_t v90 = objc_msgSend_perfResults(v212, v87, v88, v89);
    v179[0] = MEMORY[0x1E4F143A8];
    v179[1] = 3221225472;
    v179[2] = sub_1B4C7DC80;
    v179[3] = &unk_1E60A3EE0;
    v181 = &__p;
    uint64_t v182 = v169;
    id v91 = v85;
    id v180 = v91;
    objc_msgSend_run_block_(v90, v92, @"OneStep", (uint64_t)v179);

    LOBYTE(v80) = objc_msgSend_count(p_p[5], v93, v94, v95) == 0;
    ++v76;
  }
  while ((v80 & 1) == 0);
  v163 = (void *)CVNLPBeamSearchCopyTopBeams(v169);
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v96, v97, v98);
  id v173 = (id)objc_claimAutoreleasedReturnValue();
  long long v177 = 0u;
  long long v178 = 0u;
  long long v175 = 0u;
  long long v176 = 0u;
  obuint64_t j = v163;
  uint64_t v100 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v99, (uint64_t)&v175, (uint64_t)v215, 16);
  if (v100)
  {
    uint64_t v172 = *(void *)v176;
    do
    {
      uint64_t v174 = v100;
      for (uint64_t j = 0; j != v174; ++j)
      {
        if (*(void *)v176 != v172) {
          objc_enumerationMutation(obj);
        }
        v105 = *(void **)(*((void *)&v175 + 1) + 8 * j);
        v106 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v101, v102, v103);
        v109 = objc_msgSend_objectForKeyedSubscript_(v105, v107, (uint64_t)CVNLPBeamTokens, v108);
        v112 = objc_msgSend_objectForKeyedSubscript_(v105, v110, (uint64_t)CVNLPBeamScore, v111);
        if (objc_msgSend_count(v109, v113, v114, v115))
        {
          v119 = objc_msgSend_lastObject(v109, v116, v117, v118);
          uint64_t v123 = objc_msgSend_unsignedIntegerValue(v119, v120, v121, v122);
          LODWORD(v123) = v123 == objc_msgSend_endID(v212, v124, v125, v126);

          if (v123)
          {
            for (unint64_t k = 0; k < objc_msgSend_count(v109, v116, v117, v118) - 1; ++k)
            {
              v128 = objc_msgSend_objectAtIndexedSubscript_(v109, v116, k, v118);
              v131 = objc_msgSend_stringWithFormat_(NSString, v129, @"%@", v130, v128);
              v135 = objc_msgSend_vocab(v212, v132, v133, v134);
              v138 = objc_msgSend_objectForKeyedSubscript_(v135, v136, (uint64_t)v131, v137);
              objc_msgSend_addObject_(v106, v139, (uint64_t)v138, v140);
            }
          }
        }
        objc_msgSend_floatValue(v112, v116, v117, v118);
        float v142 = v141;
        v146 = objc_msgSend_runTimeParams(v212, v143, v144, v145);
        objc_msgSend_captionModelMinimumConfidence(v146, v147, v148, v149);
        double v151 = v150;

        v213[0] = CVNLPGeneratedCaption;
        v154 = objc_msgSend_componentsJoinedByString_(v106, v152, @" ", v153);
        v214[0] = v154;
        v214[1] = v112;
        v213[1] = CVNLPGeneratedCaptionScore;
        v213[2] = CVNLPGeneratedCaptionConfidenceLow;
        v157 = objc_msgSend_numberWithBool_(NSNumber, v155, v151 >= v142, v156);
        v214[2] = v157;
        v159 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v158, (uint64_t)v214, (uint64_t)v213, 3);

        objc_msgSend_addObject_(v173, v160, (uint64_t)v159, v161);
      }
      uint64_t v100 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v101, (uint64_t)&v175, (uint64_t)v215, 16);
    }
    while (v100);
  }

  sub_1B4C42F2C((void *)(v169 + 16));
  _Block_object_dispose(&__p, 8);

  if (v164) {
    operator delete(v164);
  }

  return v173;
}

- (id)performanceResults
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  objc_super v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  v32.receiver = self;
  v32.super_class = (Class)CVNLPCaptionDecoderTransformer;
  id v6 = [(CVNLPModelBase *)&v32 performanceResults];
  objc_msgSend_addEntriesFromDictionary_(v5, v7, (uint64_t)v6, v8);

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v12 = objc_msgSend_decoderBlocks(self, v9, v10, v11, 0);
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v28, (uint64_t)v33, 16);
  if (v17)
  {
    uint64_t v18 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v12);
        }
        uint64_t v20 = objc_msgSend_performanceResults(*(void **)(*((void *)&v28 + 1) + 8 * i), v14, v15, v16);
        objc_msgSend_addEntriesFromDictionary_(v5, v21, (uint64_t)v20, v22);
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v28, (uint64_t)v33, 16);
    }
    while (v17);
  }

  uint64_t v26 = objc_msgSend_copy(v5, v23, v24, v25);
  return v26;
}

- (unint64_t)startID
{
  return self->_startID;
}

- (void)setStartID:(unint64_t)a3
{
  self->_startID = a3;
}

- (unint64_t)endID
{
  return self->_endID;
}

- (void)setEndID:(unint64_t)a3
{
  self->_endID = a3;
}

- (unint64_t)decoderBatchSize
{
  return self->_decoderBatchSize;
}

- (void)setDecoderBatchSize:(unint64_t)a3
{
  self->_unint64_t decoderBatchSize = a3;
}

- (unint64_t)maxCaptionLen
{
  return self->_maxCaptionLen;
}

- (void)setMaxCaptionLen:(unint64_t)a3
{
  self->_maxCaptionLen = a3;
}

- (unint64_t)vocabSize
{
  return self->_vocabSize;
}

- (void)setVocabSize:(unint64_t)a3
{
  self->_vocabSize = a3;
}

- (unint64_t)outputVocabSize
{
  return self->_outputVocabSize;
}

- (void)setOutputVocabSize:(unint64_t)a3
{
  self->_outputVocabSize = a3;
}

- (NSDictionary)vocab
{
  return self->_vocab;
}

- (void)setVocab:(id)a3
{
}

- (NSArray)decoderBlocks
{
  return self->_decoderBlocks;
}

- (void)setDecoderBlocks:(id)a3
{
}

- (unint64_t)beamSize
{
  return self->_beamSize;
}

- (void)setBeamSize:(unint64_t)a3
{
  self->_beamSize = a3;
}

- (CVNLPBeamSearch)beamSearch
{
  return self->_beamSearch;
}

- (void)setBeamSearch:(CVNLPBeamSearch *)a3
{
  self->_beamSearch = a3;
}

- (CVNLPBeamSearch)filterBeamSearch
{
  return self->_filterBeamSearch;
}

- (void)setFilterBeamSearch:(CVNLPBeamSearch *)a3
{
  self->_filterBeamSearch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decoderBlocks, 0);
  objc_storeStrong((id *)&self->_vocab, 0);
}

@end