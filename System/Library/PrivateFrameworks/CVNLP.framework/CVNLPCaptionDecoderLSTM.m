@interface CVNLPCaptionDecoderLSTM
- (CVNLPCaptionDecoderLSTM)initWithOptions:(id)a3 runTimeParams:(id)a4;
- (id)computeCaptionForImageWithInputs:(id)a3 genderOption:(int)a4;
- (id)packBeamID:(id)a3 tokenID:(id)a4 lstmAttnState:(id *)a5 lstmLangState:(id *)a6 softmax:(id *)a7;
- (void)dealloc;
- (void)extractBeamID:(id *)a3 tokenID:(id *)a4 lstmAttnState:(id *)a5 lstmLangState:(id *)a6 fromFollowup:(id)a7;
@end

@implementation CVNLPCaptionDecoderLSTM

- (CVNLPCaptionDecoderLSTM)initWithOptions:(id)a3 runTimeParams:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v90.receiver = self;
  v90.super_class = (Class)CVNLPCaptionDecoderLSTM;
  v8 = [(CVNLPCaptionModelBase *)&v90 initWithOptions:v6 runTimeParams:v7];
  v11 = v8;
  if (v8)
  {
    v8->startID = 0;
    v8->endID = 0;
    v8->maxCaptionLen = 16;
    v8->beamSize = 5;
    v8->meanFeaturesPresent = 0;
    v87 = objc_msgSend_objectForKeyedSubscript_(v6, v9, (uint64_t)CVNLPCaptionModelPath, v10);
    v14 = objc_msgSend_URLByAppendingPathComponent_(v87, v12, @"vocab_reverse.json", v13);
    v15 = (void *)MEMORY[0x1E4F1C9B8];
    v86 = v14;
    v19 = objc_msgSend_path(v14, v16, v17, v18);
    v22 = objc_msgSend_dataWithContentsOfFile_(v15, v20, (uint64_t)v19, v21);

    id v89 = 0;
    uint64_t v24 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E4F28D90], v23, (uint64_t)v22, 0, &v89);
    id v85 = v89;
    vocab = v11->vocab;
    v11->vocab = (NSDictionary *)v24;

    v88 = objc_msgSend_URLByAppendingPathComponent_(v87, v26, @"decoder_opt_pro.espresso.net", v27);
    v11->decoderCtx = (void *)espresso_create_context();
    v11->_decoderPlan = (void *)espresso_create_plan();
    objc_msgSend_path(v88, v28, v29, v30);
    id v31 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_UTF8String(v31, v32, v33, v34);
    int v35 = espresso_plan_add_network();

    if (v35)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(exception, v60);
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    if (espresso_plan_build())
    {
      v61 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v61, v62);
      __cxa_throw(v61, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    if (c_network_get_input_names())
    {
      v63 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v63, v64);
      __cxa_throw(v63, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    if (v11->meanFeaturesPresent && espresso_network_bind_buffer())
    {
      v83 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v83, v84);
      __cxa_throw(v83, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    if (espresso_network_bind_buffer())
    {
      v65 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v65, v66);
      __cxa_throw(v65, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    if (espresso_network_bind_buffer())
    {
      v67 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v67, v68);
      __cxa_throw(v67, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    if (espresso_network_bind_buffer())
    {
      v69 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v69, v70);
      __cxa_throw(v69, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    if (espresso_network_bind_buffer())
    {
      v71 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v71, v72);
      __cxa_throw(v71, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    if (espresso_network_bind_buffer())
    {
      v73 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v73, v74);
      __cxa_throw(v73, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    if (espresso_network_bind_buffer())
    {
      v75 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v75, v76);
      __cxa_throw(v75, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    if (espresso_network_bind_buffer())
    {
      v77 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v77, v78);
      __cxa_throw(v77, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    if (espresso_network_bind_buffer())
    {
      v79 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v79, v80);
      __cxa_throw(v79, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    if (espresso_network_bind_buffer())
    {
      v81 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v81, v82);
      __cxa_throw(v81, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    v11->vocabSize = objc_msgSend_count(v11->vocab, v36, v37, v38);
    v42 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v39, v40, v41);
    uint64_t v45 = objc_msgSend_objectForKeyedSubscript_(v6, v43, (uint64_t)CVNLPBeamSearchSize, v44);
    v47 = (void *)v45;
    if (v45) {
      objc_msgSend_setObject_forKeyedSubscript_(v42, v46, v45, (uint64_t)CVNLPBeamSearchSize);
    }
    else {
      objc_msgSend_setObject_forKeyedSubscript_(v42, v46, (uint64_t)&unk_1F0D5B1D0, (uint64_t)CVNLPBeamSearchSize);
    }
    v50 = objc_msgSend_numberWithInt_(NSNumber, v48, v11->endID, v49);
    objc_msgSend_setObject_forKeyedSubscript_(v42, v51, (uint64_t)v50, (uint64_t)CVNLPBeamEndToken);

    v54 = objc_msgSend_numberWithInt_(NSNumber, v52, v11->vocabSize, v53);
    objc_msgSend_setObject_forKeyedSubscript_(v42, v55, (uint64_t)v54, (uint64_t)CVNLPBeamSearchOutputVocabSize);

    objc_msgSend_setObject_forKeyedSubscript_(v42, v56, (uint64_t)v11->vocab, (uint64_t)CVNLPBeamSearchOutputVocabMap);
    objc_msgSend_setObject_forKeyedSubscript_(v42, v57, MEMORY[0x1E4F1CC38], (uint64_t)CVNLPBeamSearchIncludeLanguageModel);
    v11->_beamSearch = (CVNLPBeamSearch *)CVNLPBeamSearchCreate(v42, 0);
  }
  return v11;
}

- (void)dealloc
{
  espresso_plan_destroy();
  espresso_context_destroy();
  CFRelease(self->_beamSearch);
  v3.receiver = self;
  v3.super_class = (Class)CVNLPCaptionDecoderLSTM;
  [(CVNLPCaptionDecoderLSTM *)&v3 dealloc];
}

- (id)packBeamID:(id)a3 tokenID:(id)a4 lstmAttnState:(id *)a5 lstmLangState:(id *)a6 softmax:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  uint64_t v17 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v14, v15, v16);
  objc_msgSend_setObject_forKeyedSubscript_(v17, v18, (uint64_t)v12, (uint64_t)CVNLPBeamSearchBeamID);
  objc_msgSend_setObject_forKeyedSubscript_(v17, v19, (uint64_t)v13, (uint64_t)CVNLPBeamSearchNextTokenID);
  if (a7)
  {
    v23 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v20, (uint64_t)a7->var0, 4 * self->vocabSize);
    objc_msgSend_setObject_forKeyedSubscript_(v17, v24, (uint64_t)v23, (uint64_t)CVNLPBeamSearchNextTokenSoftmaxValues);
  }
  v28 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v20, v21, v22);
  if (a5)
  {
    var0 = a5->var0;
    long long v30 = *(_OWORD *)&a5->var12;
    v54[8] = *(_OWORD *)&a5->var10;
    v54[9] = v30;
    uint64_t v55 = *(void *)&a5->var14;
    long long v31 = *(_OWORD *)&a5->var4;
    v54[4] = *(_OWORD *)&a5->var3[2];
    v54[5] = v31;
    long long v32 = *(_OWORD *)&a5->var8;
    v54[6] = *(_OWORD *)&a5->var6;
    v54[7] = v32;
    long long v33 = *(_OWORD *)a5->var2;
    v54[0] = *(_OWORD *)&a5->var0;
    v54[1] = v33;
    long long v34 = *(_OWORD *)a5->var3;
    v54[2] = *(_OWORD *)&a5->var2[2];
    v54[3] = v34;
    uint64_t v35 = objc_msgSend__blob_size_(self, v25, (uint64_t)v54, v27);
    uint64_t v37 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v36, (uint64_t)var0, 4 * v35);
    objc_msgSend_setObject_forKeyedSubscript_(v28, v38, (uint64_t)v37, @"lstmAttnStateData");
  }
  if (a6)
  {
    v39 = a6->var0;
    long long v40 = *(_OWORD *)&a6->var12;
    v52[8] = *(_OWORD *)&a6->var10;
    v52[9] = v40;
    uint64_t v53 = *(void *)&a6->var14;
    long long v41 = *(_OWORD *)&a6->var4;
    v52[4] = *(_OWORD *)&a6->var3[2];
    v52[5] = v41;
    long long v42 = *(_OWORD *)&a6->var8;
    v52[6] = *(_OWORD *)&a6->var6;
    v52[7] = v42;
    long long v43 = *(_OWORD *)a6->var2;
    v52[0] = *(_OWORD *)&a6->var0;
    v52[1] = v43;
    long long v44 = *(_OWORD *)a6->var3;
    v52[2] = *(_OWORD *)&a6->var2[2];
    v52[3] = v44;
    uint64_t v45 = objc_msgSend__blob_size_(self, v25, (uint64_t)v52, v27);
    v47 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v46, (uint64_t)v39, 4 * v45);
    objc_msgSend_setObject_forKeyedSubscript_(v28, v48, (uint64_t)v47, @"lstmLangStateData");
  }
  uint64_t v49 = objc_msgSend_copy(v28, v25, v26, v27);
  objc_msgSend_setObject_forKeyedSubscript_(v17, v50, (uint64_t)v49, (uint64_t)CVNLPBeamSearchNextTokenMetaData);

  return v17;
}

- (void)extractBeamID:(id *)a3 tokenID:(id *)a4 lstmAttnState:(id *)a5 lstmLangState:(id *)a6 fromFollowup:(id)a7
{
  id v12 = a7;
  objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)CVNLPBeamSearchBeamID, v14);
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v12, v15, (uint64_t)CVNLPBeamSearchNextTokenID, v16);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_objectForKeyedSubscript_(v12, v17, (uint64_t)CVNLPBeamSearchNextTokenMetaData, v18);
  uint64_t v24 = objc_msgSend_objectForKeyedSubscript_(v19, v20, @"lstmAttnStateData", v21);
  if (v24)
  {
    var0 = a5->var0;
    long long v26 = *(_OWORD *)&a5->var12;
    v53[8] = *(_OWORD *)&a5->var10;
    v53[9] = v26;
    uint64_t v54 = *(void *)&a5->var14;
    long long v27 = *(_OWORD *)&a5->var4;
    v53[4] = *(_OWORD *)&a5->var3[2];
    v53[5] = v27;
    long long v28 = *(_OWORD *)&a5->var8;
    v53[6] = *(_OWORD *)&a5->var6;
    v53[7] = v28;
    long long v29 = *(_OWORD *)a5->var2;
    v53[0] = *(_OWORD *)&a5->var0;
    v53[1] = v29;
    long long v30 = *(_OWORD *)a5->var3;
    v53[2] = *(_OWORD *)&a5->var2[2];
    v53[3] = v30;
    uint64_t v31 = objc_msgSend__blob_size_(self, v22, (uint64_t)v53, v23);
    id v32 = v24;
    uint64_t v22 = (const char *)objc_msgSend_bytes(v32, v33, v34, v35);
    if (v31) {
      memmove(var0, v22, 4 * v31);
    }
  }
  uint64_t v38 = objc_msgSend_objectForKeyedSubscript_(v19, v22, @"lstmLangStateData", v23);
  if (v38)
  {
    v39 = a6->var0;
    long long v40 = *(_OWORD *)&a6->var12;
    v51[8] = *(_OWORD *)&a6->var10;
    v51[9] = v40;
    uint64_t v52 = *(void *)&a6->var14;
    long long v41 = *(_OWORD *)&a6->var4;
    v51[4] = *(_OWORD *)&a6->var3[2];
    v51[5] = v41;
    long long v42 = *(_OWORD *)&a6->var8;
    v51[6] = *(_OWORD *)&a6->var6;
    v51[7] = v42;
    long long v43 = *(_OWORD *)a6->var2;
    v51[0] = *(_OWORD *)&a6->var0;
    v51[1] = v43;
    long long v44 = *(_OWORD *)a6->var3;
    v51[2] = *(_OWORD *)&a6->var2[2];
    v51[3] = v44;
    uint64_t v45 = objc_msgSend__blob_size_(self, v36, (uint64_t)v51, v37);
    id v46 = v38;
    v50 = (const void *)objc_msgSend_bytes(v46, v47, v48, v49);
    if (v45) {
      memmove(v39, v50, 4 * v45);
    }
  }
}

- (id)computeCaptionForImageWithInputs:(id)a3 genderOption:(int)a4
{
  v179[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v141 = v5;
  if (self->meanFeaturesPresent)
  {
    objc_msgSend_objectAtIndexedSubscript_(v5, v6, 0, v7);
    id v8 = objc_claimAutoreleasedReturnValue();
    uint64_t v12 = objc_msgSend_bytes(v8, v9, v10, v11);
    long long v13 = *(_OWORD *)&self->meanFeatsPlaceholderBlob.stride_batch_number;
    v173[8] = *(_OWORD *)&self->meanFeatsPlaceholderBlob.stride_height;
    v173[9] = v13;
    uint64_t v174 = *(void *)&self->meanFeatsPlaceholderBlob.storage_type;
    long long v14 = *(_OWORD *)&self->meanFeatsPlaceholderBlob.width;
    v173[4] = *(_OWORD *)&self->meanFeatsPlaceholderBlob.stride[2];
    v173[5] = v14;
    long long v15 = *(_OWORD *)&self->meanFeatsPlaceholderBlob.channels;
    v173[7] = *(_OWORD *)&self->meanFeatsPlaceholderBlob.sequence_length;
    v173[6] = v15;
    long long v16 = *(_OWORD *)self->meanFeatsPlaceholderBlob.dim;
    v173[0] = *(_OWORD *)&self->meanFeatsPlaceholderBlob.data;
    v173[1] = v16;
    long long v17 = *(_OWORD *)&self->meanFeatsPlaceholderBlob.dim[2];
    v173[3] = *(_OWORD *)self->meanFeatsPlaceholderBlob.stride;
    v173[2] = v17;
    objc_msgSend__copy_data_to_blob_to_(self, v18, v12, (uint64_t)v173);

    id v5 = v141;
  }
  objc_msgSend_objectAtIndexedSubscript_(v5, v6, 1, v7);
  id v139 = objc_claimAutoreleasedReturnValue();
  uint64_t v22 = objc_msgSend_bytes(v139, v19, v20, v21);
  long long v23 = *(_OWORD *)&self->attFeatsPlaceholderBlob.stride_batch_number;
  v171[8] = *(_OWORD *)&self->attFeatsPlaceholderBlob.stride_height;
  v171[9] = v23;
  uint64_t v172 = *(void *)&self->attFeatsPlaceholderBlob.storage_type;
  long long v24 = *(_OWORD *)&self->attFeatsPlaceholderBlob.width;
  v171[4] = *(_OWORD *)&self->attFeatsPlaceholderBlob.stride[2];
  v171[5] = v24;
  long long v25 = *(_OWORD *)&self->attFeatsPlaceholderBlob.channels;
  v171[7] = *(_OWORD *)&self->attFeatsPlaceholderBlob.sequence_length;
  v171[6] = v25;
  long long v26 = *(_OWORD *)self->attFeatsPlaceholderBlob.dim;
  v171[0] = *(_OWORD *)&self->attFeatsPlaceholderBlob.data;
  v171[1] = v26;
  long long v27 = *(_OWORD *)self->attFeatsPlaceholderBlob.stride;
  v171[2] = *(_OWORD *)&self->attFeatsPlaceholderBlob.dim[2];
  v171[3] = v27;
  objc_msgSend__copy_data_to_blob_to_(self, v28, v22, (uint64_t)v171);
  objc_msgSend_objectAtIndexedSubscript_(v141, v29, 2, v30);
  id v140 = objc_claimAutoreleasedReturnValue();
  uint64_t v34 = objc_msgSend_bytes(v140, v31, v32, v33);
  long long v35 = *(_OWORD *)&self->pAttFeatsPlaceholderBlob.stride_batch_number;
  v169[8] = *(_OWORD *)&self->pAttFeatsPlaceholderBlob.stride_height;
  v169[9] = v35;
  uint64_t v170 = *(void *)&self->pAttFeatsPlaceholderBlob.storage_type;
  long long v36 = *(_OWORD *)&self->pAttFeatsPlaceholderBlob.width;
  v169[4] = *(_OWORD *)&self->pAttFeatsPlaceholderBlob.stride[2];
  v169[5] = v36;
  long long v37 = *(_OWORD *)&self->pAttFeatsPlaceholderBlob.sequence_length;
  v169[6] = *(_OWORD *)&self->pAttFeatsPlaceholderBlob.channels;
  v169[7] = v37;
  long long v38 = *(_OWORD *)self->pAttFeatsPlaceholderBlob.dim;
  v169[0] = *(_OWORD *)&self->pAttFeatsPlaceholderBlob.data;
  v169[1] = v38;
  long long v39 = *(_OWORD *)self->pAttFeatsPlaceholderBlob.stride;
  v169[2] = *(_OWORD *)&self->pAttFeatsPlaceholderBlob.dim[2];
  v169[3] = v39;
  objc_msgSend__copy_data_to_blob_to_(self, v40, v34, (uint64_t)v169);
  long long v41 = *(_OWORD *)&self->lstmAttStateFeedBlob.stride_batch_number;
  v167[8] = *(_OWORD *)&self->lstmAttStateFeedBlob.stride_height;
  v167[9] = v41;
  uint64_t v168 = *(void *)&self->lstmAttStateFeedBlob.storage_type;
  long long v42 = *(_OWORD *)&self->lstmAttStateFeedBlob.width;
  v167[4] = *(_OWORD *)&self->lstmAttStateFeedBlob.stride[2];
  v167[5] = v42;
  long long v43 = *(_OWORD *)&self->lstmAttStateFeedBlob.sequence_length;
  v167[6] = *(_OWORD *)&self->lstmAttStateFeedBlob.channels;
  v167[7] = v43;
  long long v44 = *(_OWORD *)self->lstmAttStateFeedBlob.dim;
  v167[0] = *(_OWORD *)&self->lstmAttStateFeedBlob.data;
  v167[1] = v44;
  long long v45 = *(_OWORD *)self->lstmAttStateFeedBlob.stride;
  v167[2] = *(_OWORD *)&self->lstmAttStateFeedBlob.dim[2];
  v167[3] = v45;
  objc_msgSend__fill_blob_data_with_(self, v46, (uint64_t)v167, v47, 0.0);
  long long v48 = *(_OWORD *)&self->lstmLangStateFeedBlob.stride_batch_number;
  v165[8] = *(_OWORD *)&self->lstmLangStateFeedBlob.stride_height;
  v165[9] = v48;
  uint64_t v166 = *(void *)&self->lstmLangStateFeedBlob.storage_type;
  long long v49 = *(_OWORD *)&self->lstmLangStateFeedBlob.width;
  v165[4] = *(_OWORD *)&self->lstmLangStateFeedBlob.stride[2];
  v165[5] = v49;
  long long v50 = *(_OWORD *)&self->lstmLangStateFeedBlob.sequence_length;
  v165[6] = *(_OWORD *)&self->lstmLangStateFeedBlob.channels;
  v165[7] = v50;
  long long v51 = *(_OWORD *)self->lstmLangStateFeedBlob.dim;
  v165[0] = *(_OWORD *)&self->lstmLangStateFeedBlob.data;
  v165[1] = v51;
  long long v52 = *(_OWORD *)self->lstmLangStateFeedBlob.stride;
  v165[2] = *(_OWORD *)&self->lstmLangStateFeedBlob.dim[2];
  v165[3] = v52;
  objc_msgSend__fill_blob_data_with_(self, v53, (uint64_t)v165, v54, 0.0);
  v57 = objc_msgSend_numberWithInt_(NSNumber, v55, self->startID, v56);
  v59 = objc_msgSend_packBeamID_tokenID_lstmAttnState_lstmLangState_softmax_(self, v58, 0, (uint64_t)v57, 0, 0, 0);
  v179[0] = v59;
  v144 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v60, (uint64_t)v179, 1);

  id v61 = 0;
  id v62 = 0;
  do
  {
    context = (void *)MEMORY[0x1BA992F90]();
    objc_msgSend_array(MEMORY[0x1E4F1CA48], v63, v64, v65);
    CFArrayRef theArray = (CFArrayRef)objc_claimAutoreleasedReturnValue();
    long long v163 = 0u;
    long long v164 = 0u;
    long long v161 = 0u;
    long long v162 = 0u;
    obunint64_t j = v144;
    uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v66, (uint64_t)&v161, (uint64_t)v178, 16);
    if (v67)
    {
      uint64_t v149 = *(void *)v162;
      do
      {
        uint64_t v68 = 0;
        v69 = v61;
        v70 = v62;
        do
        {
          if (*(void *)v162 != v149) {
            objc_enumerationMutation(obj);
          }
          uint64_t v71 = *(void *)(*((void *)&v161 + 1) + 8 * v68);
          v72 = (void *)MEMORY[0x1BA992F90]();
          id v159 = v69;
          id v160 = v70;
          objc_msgSend_extractBeamID_tokenID_lstmAttnState_lstmLangState_fromFollowup_(self, v73, (uint64_t)&v160, (uint64_t)&v159, &self->lstmAttStateFeedBlob, &self->lstmLangStateFeedBlob, v71);
          id v62 = v160;

          id v61 = v159;
          long long v74 = *(_OWORD *)&self->inWordIDBlob.stride_batch_number;
          v157[8] = *(_OWORD *)&self->inWordIDBlob.stride_height;
          v157[9] = v74;
          uint64_t v158 = *(void *)&self->inWordIDBlob.storage_type;
          long long v75 = *(_OWORD *)&self->inWordIDBlob.width;
          v157[4] = *(_OWORD *)&self->inWordIDBlob.stride[2];
          v157[5] = v75;
          long long v76 = *(_OWORD *)&self->inWordIDBlob.sequence_length;
          v157[6] = *(_OWORD *)&self->inWordIDBlob.channels;
          v157[7] = v76;
          long long v77 = *(_OWORD *)self->inWordIDBlob.dim;
          v157[0] = *(_OWORD *)&self->inWordIDBlob.data;
          v157[1] = v77;
          long long v78 = *(_OWORD *)self->inWordIDBlob.stride;
          v157[2] = *(_OWORD *)&self->inWordIDBlob.dim[2];
          v157[3] = v78;
          *(float *)&double v82 = (float)(unint64_t)objc_msgSend_unsignedIntegerValue(v61, v79, v80, v81);
          objc_msgSend__fill_blob_data_with_(self, v83, (uint64_t)v157, v84, v82);
          if (espresso_plan_execute_sync())
          {
            exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
            espresso_plan_get_error_info();
            std::runtime_error::runtime_error(exception, v138);
            __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
          }
          v86 = objc_msgSend_packBeamID_tokenID_lstmAttnState_lstmLangState_softmax_(self, v85, (uint64_t)v62, (uint64_t)v61, &self->newAttStateBlob, &self->newLangStateBlob, &self->langProbBlob);
          objc_msgSend_addObject_(theArray, v87, (uint64_t)v86, v88);

          ++v68;
          v69 = v61;
          v70 = v62;
        }
        while (v67 != v68);
        uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v89, (uint64_t)&v161, (uint64_t)v178, 16);
      }
      while (v67);
    }

    v144 = CVNLPBeamSearchOneStep((uint64_t)self->_beamSearch, theArray);
  }
  while (objc_msgSend_count(v144, v90, v91, v92));
  contexta = (void *)CVNLPBeamSearchCopyTopBeams((uint64_t)self->_beamSearch);
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v93, v94, v95);
  id v148 = (id)objc_claimAutoreleasedReturnValue();
  long long v155 = 0u;
  long long v156 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  id obja = contexta;
  uint64_t v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v96, (uint64_t)&v153, (uint64_t)v177, 16);
  if (v97)
  {
    uint64_t v147 = *(void *)v154;
    do
    {
      uint64_t v150 = v97;
      for (uint64_t i = 0; i != v150; ++i)
      {
        if (*(void *)v154 != v147) {
          objc_enumerationMutation(obja);
        }
        v102 = *(void **)(*((void *)&v153 + 1) + 8 * i);
        v103 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v98, v99, v100);
        v106 = objc_msgSend_objectForKeyedSubscript_(v102, v104, (uint64_t)CVNLPBeamTokens, v105);
        objc_msgSend_objectForKeyedSubscript_(v102, v107, (uint64_t)CVNLPBeamScore, v108);
        CFArrayRef theArraya = (CFArrayRef)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_count(v106, v109, v110, v111))
        {
          v115 = objc_msgSend_lastObject(v106, v112, v113, v114);
          BOOL v119 = objc_msgSend_unsignedIntegerValue(v115, v116, v117, v118) == self->endID;

          if (v119)
          {
            for (unint64_t j = 0; j < objc_msgSend_count(v106, v112, v120, v114) - 1; ++j)
            {
              v122 = objc_msgSend_objectAtIndexedSubscript_(v106, v112, j, v114);
              v125 = objc_msgSend_stringWithFormat_(NSString, v123, @"%@", v124, v122);
              v128 = objc_msgSend_objectForKeyedSubscript_(self->vocab, v126, (uint64_t)v125, v127);
              objc_msgSend_addObject_(v103, v129, (uint64_t)v128, v130);
            }
          }
        }
        v175[0] = CVNLPGeneratedCaption;
        v131 = objc_msgSend_componentsJoinedByString_(v103, v112, @" ", v114);
        v175[1] = CVNLPGeneratedCaptionScore;
        v176[0] = v131;
        v176[1] = theArraya;
        v133 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v132, (uint64_t)v176, (uint64_t)v175, 2);

        objc_msgSend_addObject_(v148, v134, (uint64_t)v133, v135);
      }
      uint64_t v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v98, (uint64_t)&v153, (uint64_t)v177, 16);
    }
    while (v97);
  }

  sub_1B4C42F2C((void *)self->_beamSearch + 2);
  return v148;
}

- (void).cxx_destruct
{
}

@end