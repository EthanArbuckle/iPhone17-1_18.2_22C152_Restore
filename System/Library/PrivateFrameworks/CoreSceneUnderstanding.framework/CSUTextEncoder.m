@interface CSUTextEncoder
- (BOOL)loadResources:(id *)a3;
- (BOOL)reLoadResources:(id *)a3;
- (CSUSystemSearchTextEncoderV1)systemSearchtextEncoder;
- (CSUTextEncoder)initWithConfiguration:(id)a3;
- (CSUTextEncoderConfiguration)configuration;
- (CSUTextEncoderE5ML)textEncoderE5ML;
- (CSUTextEncoderOutput)inferenceOutputs;
- (void)runOnInput:(id)a3 error:(id *)a4;
- (void)runOnInputText:(id)a3 error:(id *)a4;
- (void)setContextLength:(unint64_t)a3 error:(id *)a4;
- (void)setInferenceOutputs:(id)a3;
- (void)setSystemSearchtextEncoder:(id)a3;
- (void)setTextEncoderE5ML:(id)a3;
@end

@implementation CSUTextEncoder

- (CSUTextEncoder)initWithConfiguration:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_configuration, a3);
  if ((unint64_t)(objc_msgSend_revision(v5, v6, v7, v8, v9) - 6) >= 4) {
    goto LABEL_4;
  }
  v10 = [CSUTextEncoderE5ML alloc];
  v15 = objc_msgSend_textEncoderE5MLConfig(v5, v11, v12, v13, v14);
  v19 = (CSUTextEncoderE5ML *)objc_msgSend_initWithConfiguration_(v10, v16, (uint64_t)v15, v17, v18);
  textEncoderE5ML = self->_textEncoderE5ML;
  self->_textEncoderE5ML = v19;

  if (self->_textEncoderE5ML) {
    v21 = self;
  }
  else {
LABEL_4:
  }
    v21 = 0;

  return v21;
}

- (BOOL)loadResources:(id *)a3
{
  *a3 = 0;
  if ((unint64_t)(objc_msgSend_revision(self->_configuration, a2, (uint64_t)a3, v3, v4) - 6) > 3)
  {
    objc_msgSend_errorForInvalidArgumentWithLocalizedDescription_(CSUError, v7, @"Text encoder revision not supported in loadResources(...)", v8, v9);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    return 0;
  }
  else
  {
    textEncoderE5ML = self->_textEncoderE5ML;
    return objc_msgSend_loadResources_(textEncoderE5ML, v7, (uint64_t)a3, v8, v9);
  }
}

- (BOOL)reLoadResources:(id *)a3
{
  *a3 = 0;
  if ((unint64_t)(objc_msgSend_revision(self->_configuration, a2, (uint64_t)a3, v3, v4) - 6) > 3)
  {
    objc_msgSend_errorForInvalidArgumentWithLocalizedDescription_(CSUError, v7, @"Text encoder revision not supported in reLoadResources(...)", v8, v9);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    return 0;
  }
  else
  {
    textEncoderE5ML = self->_textEncoderE5ML;
    return objc_msgSend_reLoadResources_(textEncoderE5ML, v7, (uint64_t)a3, v8, v9);
  }
}

- (void)runOnInput:(id)a3 error:(id *)a4
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v80 = a3;
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x3032000000;
  v90 = sub_24C68D83C;
  v91 = sub_24C68D84C;
  id v92 = 0;
  v79 = self;
  if ((unint64_t)(objc_msgSend_revision(self->_configuration, v5, v6, v7, v8) - 6) >= 4)
  {
    v62 = NSString;
    v67 = uint64_t v63 = objc_msgSend_revision(self->_configuration, v9, v10, v11, v12);
    uint64_t v71 = objc_msgSend_errorForUnsupportedRevision_(CSUError, v68, (uint64_t)v67, v69, v70);
    v72 = (void *)v88[5];
    v88[5] = v71;
  }
  else
  {
    context = (void *)MEMORY[0x2532F8ED0]();
    uint64_t v13 = sub_24C69662C();
    os_signpost_id_t v14 = os_signpost_id_generate(v13);

    v15 = sub_24C69662C();
    v16 = v15;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_24C664000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "CSUTextEncoderE5MLRunOnInput", "", buf, 2u);
    }

    *(void *)buf = &unk_26FEDB918;
    os_signpost_id_t v95 = v14;
    v96 = buf;
    uint64_t v17 = objc_opt_new();
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v18 = v80;
    uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v83, (uint64_t)v93, 16);
    if (v20)
    {
      uint64_t v21 = *(void *)v84;
      while (2)
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v84 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v83 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v24 = objc_opt_new();
            v29 = objc_msgSend_string(v23, v25, v26, v27, v28);
            objc_msgSend_setString_(v24, v30, (uint64_t)v29, v31, v32);

            objc_msgSend_addObject_(v17, v33, (uint64_t)v24, v34, v35);
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v24 = objc_opt_new();
              v40 = objc_msgSend_embedding(v23, v36, v37, v38, v39);
              objc_msgSend_setEmbedding_(v24, v41, (uint64_t)v40, v42, v43);

              objc_msgSend_addObject_(v17, v44, (uint64_t)v24, v45, v46);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                uint64_t v73 = objc_msgSend_errorForInvalidArgumentWithLocalizedDescription_(CSUError, v47, @"input item in array for text encoding should be one of types CSUString, CSUTokenEmbedding, CSUTokenID", v48, v49);
                v74 = (void *)v88[5];
                v88[5] = v73;

                goto LABEL_21;
              }
              v24 = objc_opt_new();
              v54 = objc_msgSend_tokenID(v23, v50, v51, v52, v53);
              objc_msgSend_setTokenID_(v24, v55, (uint64_t)v54, v56, v57);

              objc_msgSend_addObject_(v17, v58, (uint64_t)v24, v59, v60);
            }
          }
        }
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v61, (uint64_t)&v83, (uint64_t)v93, 16);
        if (v20) {
          continue;
        }
        break;
      }
    }
LABEL_21:

    textEncoderE5ML = v79->_textEncoderE5ML;
    v82[0] = MEMORY[0x263EF8330];
    v82[1] = 3221225472;
    v82[2] = sub_24C68D854;
    v82[3] = &unk_2652E7EE8;
    v82[4] = v79;
    v82[5] = &v87;
    objc_msgSend_runOnInput_completion_(textEncoderE5ML, v76, (uint64_t)v17, (uint64_t)v82, v77);

    if (!v96) {
      sub_24C66DAC0();
    }
    (*(void (**)(uint8_t *))(*(void *)v96 + 48))(v96);
    if (v96 == buf)
    {
      (*(void (**)(uint8_t *))(*(void *)buf + 32))(buf);
    }
    else if (v96)
    {
      (*(void (**)(uint8_t *))(*(void *)v96 + 40))(v96);
    }
  }
  if (a4) {
    *a4 = (id) v88[5];
  }
  _Block_object_dispose(&v87, 8);
}

- (void)runOnInputText:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = sub_24C68D83C;
  uint64_t v35 = sub_24C68D84C;
  id v36 = 0;
  if ((unint64_t)(objc_msgSend_revision(self->_configuration, v7, v8, v9, v10) - 6) >= 4)
  {
    v19 = NSString;
    v24 = uint64_t v20 = objc_msgSend_revision(self->_configuration, v11, v12, v13, v14);
    uint64_t v28 = objc_msgSend_errorForUnsupportedRevision_(CSUError, v25, (uint64_t)v24, v26, v27);
    v29 = (void *)v32[5];
    v32[5] = v28;

    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v15 = (void *)MEMORY[0x2532F8ED0]();
  textEncoderE5ML = self->_textEncoderE5ML;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = sub_24C68DC1C;
  v30[3] = &unk_2652E7EE8;
  v30[4] = self;
  v30[5] = &v31;
  objc_msgSend_runOnInputText_completion_(textEncoderE5ML, v17, (uint64_t)v6, (uint64_t)v30, v18);
  if (a4) {
LABEL_3:
  }
    *a4 = (id) v32[5];
LABEL_4:
  _Block_object_dispose(&v31, 8);
}

- (void)setContextLength:(unint64_t)a3 error:(id *)a4
{
  if (objc_msgSend_contextLength(self->_configuration, a2, a3, (uint64_t)a4, v4) != a3)
  {
    NSLog(&cfstr_SettingNewCont.isa, a3);
    objc_msgSend_setContextLength_(self->_configuration, v8, a3, v9, v10);
    objc_msgSend_reLoadResources_(self, v11, (uint64_t)a4, v12, v13);
  }
}

- (CSUTextEncoderConfiguration)configuration
{
  return self->_configuration;
}

- (CSUTextEncoderOutput)inferenceOutputs
{
  return self->_inferenceOutputs;
}

- (void)setInferenceOutputs:(id)a3
{
}

- (CSUSystemSearchTextEncoderV1)systemSearchtextEncoder
{
  return self->_systemSearchtextEncoder;
}

- (void)setSystemSearchtextEncoder:(id)a3
{
}

- (CSUTextEncoderE5ML)textEncoderE5ML
{
  return self->_textEncoderE5ML;
}

- (void)setTextEncoderE5ML:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textEncoderE5ML, 0);
  objc_storeStrong((id *)&self->_systemSearchtextEncoder, 0);
  objc_storeStrong((id *)&self->_inferenceOutputs, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end