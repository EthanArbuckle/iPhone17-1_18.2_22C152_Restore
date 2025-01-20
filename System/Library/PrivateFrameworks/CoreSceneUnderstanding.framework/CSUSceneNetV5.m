@interface CSUSceneNetV5
- (BOOL)enumerateAestheticsAttributeScores:(id)a3 usingBlock:(id)a4;
- (BOOL)enumerateAestheticsAttributeScores:(id)a3 usingBlock:(id)a4 error:(id *)a5;
- (BOOL)enumerateAestheticsGlobalScores:(id)a3 usingBlock:(id)a4;
- (BOOL)enumerateAestheticsGlobalScores:(id)a3 usingBlock:(id)a4 error:(id *)a5;
- (BOOL)enumerateEntityNetClassificationLikelihoods:(id)a3 usingBlock:(id)a4;
- (BOOL)enumerateEntityNetClassificationLikelihoods:(id)a3 usingBlock:(id)a4 error:(id *)a5;
- (BOOL)enumerateHierarchicalSceneClassificationLikelihoods:(id)a3 usingBlock:(id)a4;
- (BOOL)enumerateHierarchicalSceneClassificationLikelihoods:(id)a3 usingBlock:(id)a4 error:(id *)a5;
- (BOOL)enumerateLeafSceneClassificationLikelihoods:(id)a3 usingBlock:(id)a4;
- (BOOL)enumerateLeafSceneClassificationLikelihoods:(id)a3 usingBlock:(id)a4 error:(id *)a5;
- (BOOL)enumerateSceneClassificationLikelihoods:(id)a3 usingBlock:(id)a4;
- (BOOL)enumerateSceneClassificationLikelihoods:(id)a3 usingBlock:(id)a4 error:(id *)a5;
- (BOOL)loadResources:(id *)a3;
- (BOOL)resampleImage:(__CVBuffer *)a3 intoInputImage:(__CVBuffer *)a4 error:(id *)a5;
- (CSUSceneNetV5)initWithConfiguration:(id)a3;
- (CSUSceneNetV5Configuration)configuration;
- (__CVBuffer)pixelBufferForSaliencyMap:(id)a3 error:(id *)a4;
- (id).cxx_construct;
- (id)allAestheticsAttributeScores:(id)a3;
- (id)allAestheticsAttributeScores:(id)a3 error:(id *)a4;
- (id)allAestheticsGlobalScores:(id)a3;
- (id)allAestheticsGlobalScores:(id)a3 error:(id *)a4;
- (id)allEntityNetClassificationLikelihoods:(id)a3;
- (id)allEntityNetClassificationLikelihoods:(id)a3 error:(id *)a4;
- (id)allSceneClassificationLikelihoods:(id)a3;
- (id)allSceneClassificationLikelihoods:(id)a3 error:(id *)a4;
- (id)base64HashesFromFingerprintEmbedding:(id)a3;
- (id)detectionResultFromScoreHeatMap:(id)a3 coordinateOffsetMap:(id)a4;
- (id)detectionResultFromScoreHeatMap:(id)a3 coordinateOffsetMap:(id)a4 options:(id)a5 error:(id *)a6;
- (id)hashesFromFingerprintEmbedding:(id)a3;
- (vector<float,)computeAllSceneClassificationLikelihoods:(CSUSceneNetV5 *)self;
- (void)_unsafeRunOnInputImage:(__CVBuffer *)a3 completion:(id)a4;
- (void)runOnInputImage:(__CVBuffer *)a3 completion:(id)a4;
@end

@implementation CSUSceneNetV5

- (CSUSceneNetV5)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSUSceneNetV5;
  v6 = [(CSUSceneNetV5 *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)loadResources:(id *)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  v4 = sub_24C69662C();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  v6 = sub_24C69662C();
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v39) = 0;
    _os_signpost_emit_with_name_impl(&dword_24C664000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "CSUSceneNetLoadResources", "", (uint8_t *)&v39, 2u);
  }

  v55[0] = &unk_26FEDDBD8;
  v55[1] = v5;
  v56 = v55;
  if (!self->_net.__ptr_.__value_)
  {
    if (objc_msgSend_revision(self->_configuration, v8, v9, v10, v11) == 3
      && objc_msgSend_espressoExecutionEngine(self->_configuration, v12, v13, v14, v15) == 10007)
    {
      v16 = objc_msgSend_espressoNetworkPath(self->_configuration, v12, v13, v14, v15);
      v19 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v16, v17, @".espresso.net", @"_dev_op.espresso.net", v18);

      id v20 = v19;
      uint64_t v54 = objc_msgSend_UTF8String(v20, v21, v22, v23, v24);
      int v40 = objc_msgSend_espressoExecutionEngine(self->_configuration, v25, v26, v27, v28, 0, 0, 0);
      char v41 = 1;
      char v42 = 0;
      char v43 = 0;
      uint64_t v44 = 0xFFFFFFFFLL;
      char v45 = 0;
      char v46 = 0;
      char v47 = 0;
      char v48 = 0;
      *(_OWORD *)v49 = 0u;
      *(_OWORD *)v50 = 0u;
      int v51 = 1065353216;
      char v53 = 0;
      LOBYTE(__p) = 0;
      sub_24C669758();
    }
    objc_msgSend_espressoNetworkPath(self->_configuration, v12, v13, v14, v15);
    id v29 = objc_claimAutoreleasedReturnValue();
    uint64_t v54 = objc_msgSend_UTF8String(v29, v30, v31, v32, v33);
    int v40 = objc_msgSend_espressoExecutionEngine(self->_configuration, v34, v35, v36, v37, 0, 0, 0);
    char v41 = 1;
    char v42 = 0;
    char v43 = 0;
    uint64_t v44 = 0xFFFFFFFFLL;
    char v45 = 0;
    char v46 = 0;
    char v47 = 0;
    char v48 = 0;
    *(_OWORD *)v49 = 0u;
    *(_OWORD *)v50 = 0u;
    int v51 = 1065353216;
    char v53 = 0;
    LOBYTE(__p) = 0;
    sub_24C669758();
  }
  (*(void (**)(void *))(v55[0] + 48))(v55);
  if (v56 == v55)
  {
    (*(void (**)(void *))(v55[0] + 32))(v55);
  }
  else if (v56)
  {
    (*(void (**)(void))(*v56 + 40))();
  }
  return 1;
}

- (BOOL)resampleImage:(__CVBuffer *)a3 intoInputImage:(__CVBuffer *)a4 error:(id *)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v8 = sub_24C69662C();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  uint64_t v10 = sub_24C69662C();
  uint64_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v15[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_24C664000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "CSUSceneNetResampleImage", "", (uint8_t *)v15, 2u);
  }

  v15[0] = &unk_26FEDDC58;
  v15[1] = v9;
  v16 = v15;
  value = (VTPixelTransferSessionRef **)self->_transferSession.__ptr_.__value_;
  if (!value) {
    operator new();
  }
  uint64_t v13 = VTPixelTransferSessionTransferImage(**value, a3, a4);
  sub_24C66DC4C(v13, "Image Transfer");
  if (!v16) {
    sub_24C66DAC0();
  }
  (*(void (**)(void *))(*v16 + 48))(v16);
  if (v16 == v15)
  {
    (*(void (**)(void *))(v15[0] + 32))(v15);
  }
  else if (v16)
  {
    (*(void (**)(void))(*v16 + 40))();
  }
  return 1;
}

- (void)runOnInputImage:(__CVBuffer *)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = sub_24C69662C();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  os_signpost_id_t v9 = sub_24C69662C();
  uint64_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_24C664000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CSUSceneNetRunOnInputImage", "", buf, 2u);
  }

  *(void *)buf = &unk_26FEDDCD8;
  os_signpost_id_t v14 = v8;
  uint64_t v15 = buf;
  objc_msgSend__unsafeRunOnInputImage_completion_(self, v11, (uint64_t)a3, (uint64_t)v6, v12);
  if (!v15) {
    sub_24C66DAC0();
  }
  (*(void (**)(uint8_t *))(*(void *)v15 + 48))(v15);
  if (v15 == buf)
  {
    (*(void (**)(uint8_t *))(*(void *)buf + 32))(buf);
  }
  else if (v15)
  {
    (*(void (**)(void))(*(void *)v15 + 40))();
  }
}

- (vector<float,)computeAllSceneClassificationLikelihoods:(CSUSceneNetV5 *)self
{
  id v6 = a4;
  configuration = self->_configuration;
  id v52 = 0;
  uint64_t v11 = objc_msgSend_sceneTaxonomyWithError_(configuration, v8, (uint64_t)&v52, v9, v10);
  id v16 = v52;
  if (!v11)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    objc_msgSend_localizedDescription(v16, v30, v31, v32, v33);
    id v34 = objc_claimAutoreleasedReturnValue();
    v39 = (char *)objc_msgSend_UTF8String(v34, v35, v36, v37, v38);
    sub_24C6698FC(&v50, v39);
    sub_24C66A45C("SceneNet taxonomy could not be loaded: ", &v50, &v51);
    std::runtime_error::runtime_error(exception, &v51);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  uint64_t v17 = objc_msgSend_leafSceneClassificationVocabularyName(self->_configuration, v12, v13, v14, v15);
  uint64_t v18 = (void *)sub_24C66A4BC(v6);
  uint64_t v22 = objc_msgSend__vocabularyNamed_(v11, v19, (uint64_t)v17, v20, v21);
  unint64_t v27 = objc_msgSend_internalCount(v22, v23, v24, v25, v26);

  if (v18[12] != v27)
  {
    int v40 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    char v41 = v18;
    char v42 = v40;
    std::to_string(&v48, v41[12]);
    sub_24C66A45C("Number of channels ", &v48, &v49);
    sub_24C66A5A0(" in supplied likelihood buffer does not match the expected number ", &v49, &v50);
    std::to_string(&v47, v27);
    if ((v47.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      char v43 = &v47;
    }
    else {
      char v43 = (std::string *)v47.__r_.__value_.__r.__words[0];
    }
    if ((v47.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v47.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v47.__r_.__value_.__l.__size_;
    }
    char v45 = std::string::append(&v50, (const std::string::value_type *)v43, size);
    long long v46 = *(_OWORD *)&v45->__r_.__value_.__l.__data_;
    v51.__r_.__value_.__r.__words[2] = v45->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v51.__r_.__value_.__l.__data_ = v46;
    v45->__r_.__value_.__l.__size_ = 0;
    v45->__r_.__value_.__r.__words[2] = 0;
    v45->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(v42, &v51);
    __cxa_throw(v42, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  sub_24C6A11F4(v11, v17, v18, (uint64_t *)retstr);

  return result;
}

- (BOOL)enumerateSceneClassificationLikelihoods:(id)a3 usingBlock:(id)a4 error:(id *)a5
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v50 = a4;
  id v16 = objc_msgSend_sceneTaxonomyWithError_(self->_configuration, v9, (uint64_t)a5, v10, v11);
  if (v16)
  {
    std::string v47 = objc_msgSend_leafSceneClassificationVocabularyName(self->_configuration, v12, v13, v14, v15);
    uint64_t v21 = objc_msgSend_hierarchicalSceneClassificationVocabularyName(self->_configuration, v17, v18, v19, v20);
    objc_msgSend_computeAllSceneClassificationLikelihoods_(self, v22, (uint64_t)v8, v23, v24);
    uint64_t v25 = (char *)v60[0];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v61[0] = v47;
    v61[1] = v21;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v26, (uint64_t)v61, 2, v27);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v51, (uint64_t)v62, 16);
    if (v32)
    {
      uint64_t v49 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v52 != v49) {
            objc_enumerationMutation(obj);
          }
          id v34 = objc_msgSend__vocabularyNamed_(v16, v29, *(void *)(*((void *)&v51 + 1) + 8 * i), v30, v31);
          v39 = v25;
          int v40 = &v25[4 * objc_msgSend_startIndex(v34, v35, v36, v37, v38)];
          id v41 = v50;
          v60[0] = 0;
          v60[1] = v60;
          v60[2] = 0x3812000000;
          v60[3] = sub_24C6748B8;
          v60[4] = nullsub_7;
          v60[5] = &unk_24C74DED7;
          v60[6] = v40;
          v59[0] = 0;
          v59[1] = v59;
          v59[2] = 0x2020000000;
          v59[3] = 0;
          v55[0] = MEMORY[0x263EF8330];
          v55[1] = 3221225472;
          v55[2] = sub_24C6748C8;
          void v55[3] = &unk_2652E7C70;
          uint64_t v57 = v60;
          v58 = v59;
          id v56 = v41;
          objc_msgSend__enumerateVisibleLabelsAndIndicesInVocabularyUsingBlock_(v34, v42, (uint64_t)v55, v43, v44);

          uint64_t v25 = v39;
          _Block_object_dispose(v59, 8);
          _Block_object_dispose(v60, 8);
        }
        uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v51, (uint64_t)v62, 16);
      }
      while (v32);
    }

    if (v25) {
      operator delete(v25);
    }
    BOOL v45 = 1;
  }
  else
  {
    BOOL v45 = 0;
  }

  return v45;
}

- (BOOL)enumerateSceneClassificationLikelihoods:(id)a3 usingBlock:(id)a4
{
  return objc_msgSend_enumerateSceneClassificationLikelihoods_usingBlock_error_(self, a2, (uint64_t)a3, (uint64_t)a4, 0);
}

- (id)allSceneClassificationLikelihoods:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_24C66AC40;
  v13[3] = &unk_2652E7C28;
  id v14 = v7;
  id v8 = v7;
  if (objc_msgSend_enumerateSceneClassificationLikelihoods_usingBlock_error_(self, v9, (uint64_t)v6, (uint64_t)v13, (uint64_t)a4))uint64_t v10 = v8; {
  else
  }
    uint64_t v10 = 0;
  id v11 = v10;

  return v11;
}

- (id)allSceneClassificationLikelihoods:(id)a3
{
  v4 = objc_msgSend_allSceneClassificationLikelihoods_error_(self, a2, (uint64_t)a3, 0, v3);
  return v4;
}

- (BOOL)enumerateLeafSceneClassificationLikelihoods:(id)a3 usingBlock:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v17 = objc_msgSend_sceneTaxonomyWithError_(self->_configuration, v10, (uint64_t)a5, v11, v12);
  if (!v17)
  {
    BOOL v25 = 0;
    goto LABEL_9;
  }
  uint64_t v18 = objc_msgSend_leafSceneClassificationVocabularyName(self->_configuration, v13, v14, v15, v16);
  id v19 = v8;
  if (!v19)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "The given CSUBuffer instance is nil.");
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "The given CSUBuffer is not an instance of CSUEspressoBuffer.");
LABEL_7:
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  uint64_t v24 = objc_msgSend_espressoBuffer(v19, v20, v21, v22, v23);

  sub_24C6A0A44(v17, v18, v24, v9);
  BOOL v25 = 1;
LABEL_9:

  return v25;
}

- (BOOL)enumerateLeafSceneClassificationLikelihoods:(id)a3 usingBlock:(id)a4
{
  return MEMORY[0x270F9A6D0](self, sel_enumerateLeafSceneClassificationLikelihoods_usingBlock_error_, a3, a4, 0);
}

- (BOOL)enumerateHierarchicalSceneClassificationLikelihoods:(id)a3 usingBlock:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v17 = objc_msgSend_sceneTaxonomyWithError_(self->_configuration, v10, (uint64_t)a5, v11, v12);
  if (v17)
  {
    uint64_t v18 = objc_msgSend_hierarchicalSceneClassificationVocabularyName(self->_configuration, v13, v14, v15, v16);
    objc_msgSend_computeAllSceneClassificationLikelihoods_(self, v19, (uint64_t)v8, v20, v21);
    BOOL v25 = objc_msgSend__vocabularyNamed_(v17, v22, (uint64_t)v18, v23, v24);
    uint64_t started = objc_msgSend_startIndex(v25, v26, v27, v28, v29);
    sub_24C66A9F8(v25, (uint64_t)v33 + 4 * started, v9);

    if (v33) {
      operator delete(v33);
    }
    BOOL v31 = 1;
  }
  else
  {
    BOOL v31 = 0;
  }

  return v31;
}

- (BOOL)enumerateHierarchicalSceneClassificationLikelihoods:(id)a3 usingBlock:(id)a4
{
  return MEMORY[0x270F9A6D0](self, sel_enumerateHierarchicalSceneClassificationLikelihoods_usingBlock_error_, a3, a4, 0);
}

- (id)allAestheticsAttributeScores:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_24C66B1AC;
  v13[3] = &unk_2652E7C28;
  id v14 = v7;
  id v8 = v7;
  if (objc_msgSend_enumerateAestheticsAttributeScores_usingBlock_error_(self, v9, (uint64_t)v6, (uint64_t)v13, (uint64_t)a4))uint64_t v10 = v8; {
  else
  }
    uint64_t v10 = 0;
  id v11 = v10;

  return v11;
}

- (id)allAestheticsAttributeScores:(id)a3
{
  v4 = objc_msgSend_allAestheticsAttributeScores_error_(self, a2, (uint64_t)a3, 0, v3);
  return v4;
}

- (id)allAestheticsGlobalScores:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_24C66B380;
  v13[3] = &unk_2652E7C28;
  id v14 = v7;
  id v8 = v7;
  if (objc_msgSend_enumerateAestheticsGlobalScores_usingBlock_error_(self, v9, (uint64_t)v6, (uint64_t)v13, (uint64_t)a4))uint64_t v10 = v8; {
  else
  }
    uint64_t v10 = 0;
  id v11 = v10;

  return v11;
}

- (id)allAestheticsGlobalScores:(id)a3
{
  v4 = objc_msgSend_allAestheticsGlobalScores_error_(self, a2, (uint64_t)a3, 0, v3);
  return v4;
}

- (BOOL)enumerateAestheticsAttributeScores:(id)a3 usingBlock:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v17 = objc_msgSend_aestheticsTaxonomyWithError_(self->_configuration, v10, (uint64_t)a5, v11, v12);
  if (!v17)
  {
    BOOL v25 = 0;
    goto LABEL_9;
  }
  uint64_t v18 = objc_msgSend_aestheticsAttributeVocabularyName(self->_configuration, v13, v14, v15, v16);
  id v19 = v8;
  if (!v19)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "The given CSUBuffer instance is nil.");
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "The given CSUBuffer is not an instance of CSUEspressoBuffer.");
LABEL_7:
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  uint64_t v24 = objc_msgSend_espressoBuffer(v19, v20, v21, v22, v23);

  sub_24C6A0A44(v17, v18, v24, v9);
  BOOL v25 = 1;
LABEL_9:

  return v25;
}

- (BOOL)enumerateAestheticsAttributeScores:(id)a3 usingBlock:(id)a4
{
  return objc_msgSend_enumerateAestheticsAttributeScores_usingBlock_error_(self, a2, (uint64_t)a3, (uint64_t)a4, 0);
}

- (BOOL)enumerateAestheticsGlobalScores:(id)a3 usingBlock:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v17 = objc_msgSend_aestheticsTaxonomyWithError_(self->_configuration, v10, (uint64_t)a5, v11, v12);
  if (!v17)
  {
    BOOL v25 = 0;
    goto LABEL_9;
  }
  uint64_t v18 = objc_msgSend_aestheticsGlobalScoreVocabularyName(self->_configuration, v13, v14, v15, v16);
  id v19 = v8;
  if (!v19)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "The given CSUBuffer instance is nil.");
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "The given CSUBuffer is not an instance of CSUEspressoBuffer.");
LABEL_7:
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  uint64_t v24 = objc_msgSend_espressoBuffer(v19, v20, v21, v22, v23);

  sub_24C6A0A44(v17, v18, v24, v9);
  BOOL v25 = 1;
LABEL_9:

  return v25;
}

- (BOOL)enumerateAestheticsGlobalScores:(id)a3 usingBlock:(id)a4
{
  return objc_msgSend_enumerateAestheticsGlobalScores_usingBlock_error_(self, a2, (uint64_t)a3, (uint64_t)a4, 0);
}

- (id)detectionResultFromScoreHeatMap:(id)a3 coordinateOffsetMap:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(CSUObjectDetectionOptions);
  uint64_t v10 = objc_msgSend_detectionResultFromScoreHeatMap_coordinateOffsetMap_options_error_(self, v9, (uint64_t)v6, (uint64_t)v7, (uint64_t)v8, 0);
  uint64_t v11 = v10;
  if (!v10) {
    uint64_t v10 = (void *)MEMORY[0x263EFFA68];
  }
  id v12 = v10;

  return v12;
}

- (id)detectionResultFromScoreHeatMap:(id)a3 coordinateOffsetMap:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v20 = objc_msgSend_detectionTaxonomyWithError_(self->_configuration, v13, (uint64_t)a6, v14, v15);
  if (v20)
  {
    uint64_t v55 = 0;
    objc_msgSend_detectionForegroundThreshold(v12, v16, v17, v18, v19);
    if (v25 > 0.0)
    {
      char IsSoftmax = objc_msgSend_detectionHeadIsSoftmax(self->_configuration, v21, v22, v23, v24);
      BOOL v31 = objc_msgSend_detectionVocabularyName(self->_configuration, v27, v28, v29, v30);
      uint64_t v36 = objc_msgSend_relevantClassNames(v12, v32, v33, v34, v35);
      objc_msgSend_detectionForegroundThreshold(v12, v37, v38, v39, v40);
      sub_24C6A1588(IsSoftmax, v20, v31, v36, v41 | 0x100000000, (uint64_t)v54);
      operator new();
    }
    char v42 = objc_msgSend_detectionHeadIsSoftmax(self->_configuration, v21, v22, v23, v24);
    std::string v47 = objc_msgSend_detectionVocabularyName(self->_configuration, v43, v44, v45, v46);
    long long v52 = objc_msgSend_relevantClassNames(v12, v48, v49, v50, v51);
    sub_24C6A1588(v42, v20, v47, v52, 0, (uint64_t)v54);
    operator new();
  }

  return 0;
}

- (__CVBuffer)pixelBufferForSaliencyMap:(id)a3 error:(id *)a4
{
  id v4 = a3;
  os_signpost_id_t v5 = (uint64_t *)sub_24C66A4BC(v4);
  size_t v6 = v5[10];
  size_t v7 = v5[11];
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Invalid dimensions requested for CVPixelBuffer creation.");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CVPixelBufferRef pixelBufferOut = 0;
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t v44 = Mutable;
  CFMutableDictionaryRef v11 = CFDictionaryCreateMutable(v9, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  id v12 = (const void *)*MEMORY[0x263F04130];
  v43.__r_.__value_.__r.__words[0] = (std::string::size_type)v11;
  CFDictionarySetValue(Mutable, v12, v11);
  if (v11) {
    CFRelease(v11);
  }
  CVReturn v13 = CVPixelBufferCreate(v9, v6, v7, 0x4C303066u, Mutable, &pixelBufferOut);
  if (v13)
  {
    uint64_t v40 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::to_string(&v42, v13);
    sub_24C66A45C("Failed to create CVPixelBuffer. Status = ", &v42, &v43);
    std::runtime_error::runtime_error(v40, &v43);
    __cxa_throw(v40, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  uint64_t v14 = pixelBufferOut;
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (CVPixelBufferLockBaseAddress(v14, 0))
  {
    unsigned int v41 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v41, "Failed to lock pixel buffer.");
    goto LABEL_41;
  }
  uint64_t v15 = v5[16];
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v14);
  uint64_t v17 = *v5;
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(v14);
  uint64_t v19 = 4 * v15;
  if (v6 > 7)
  {
    if (v6 == (v6 & 0xFFFFFFFFFFFFFFF8))
    {
      uint64_t v22 = 0;
      uint64_t v23 = BaseAddress;
      uint64_t v24 = v17;
      do
      {
        if ((unint64_t)&BaseAddress[BytesPerRow * v22 - v17 - v19 * v22] >= 0x20)
        {
          uint64_t v26 = 0;
          unint64_t v27 = v6 & 0xFFFFFFFFFFFFFFF8;
          do
          {
            long long v28 = *(_OWORD *)(v24 + v26 + 16);
            uint64_t v29 = &v23[v26];
            *(_OWORD *)uint64_t v29 = *(_OWORD *)(v24 + v26);
            *((_OWORD *)v29 + 1) = v28;
            v26 += 32;
            v27 -= 8;
          }
          while (v27);
        }
        else
        {
          for (uint64_t i = 0; i != v6; ++i)
            *(_DWORD *)&v23[4 * i] = *(_DWORD *)(v24 + 4 * i);
        }
        v24 += v19;
        v23 += BytesPerRow;
        ++v22;
      }
      while (v22 != v7);
    }
    else
    {
      uint64_t v30 = 0;
      BOOL v31 = BaseAddress;
      uint64_t v32 = v17;
      do
      {
        if ((unint64_t)&BaseAddress[BytesPerRow * v30 - v17 - v19 * v30] >= 0x20)
        {
          uint64_t v34 = 0;
          unint64_t v35 = v6 & 0xFFFFFFFFFFFFFFF8;
          do
          {
            long long v36 = *(_OWORD *)(v32 + v34 + 16);
            uint64_t v37 = &v31[v34];
            *(_OWORD *)uint64_t v37 = *(_OWORD *)(v32 + v34);
            *((_OWORD *)v37 + 1) = v36;
            v34 += 32;
            v35 -= 8;
          }
          while (v35);
          unint64_t v33 = v6 & 0xFFFFFFFFFFFFFFF8;
        }
        else
        {
          unint64_t v33 = 0;
        }
        do
        {
          *(_DWORD *)&v31[4 * v33] = *(_DWORD *)(v32 + 4 * v33);
          ++v33;
        }
        while (v6 != v33);
        v32 += v19;
        v31 += BytesPerRow;
        ++v30;
      }
      while (v30 != v7);
    }
  }
  else
  {
    uint64_t v20 = 0;
    do
    {
      uint64_t v21 = 0;
      do
      {
        *(_DWORD *)&BaseAddress[4 * v21] = *(_DWORD *)(v17 + 4 * v21);
        ++v21;
      }
      while (v6 != v21);
      v17 += v19;
      BaseAddress += BytesPerRow;
      ++v20;
    }
    while (v20 != v7);
  }
  if (CVPixelBufferUnlockBaseAddress(v14, 0))
  {
    unsigned int v41 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v41, "Failed to unlock pixel buffer.");
LABEL_41:
    __cxa_throw(v41, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }

  return v14;
}

- (id)hashesFromFingerprintEmbedding:(id)a3
{
  id v4 = a3;
  os_signpost_id_t v5 = (uint64_t *)sub_24C66A4BC(v4);
  uint64_t v6 = *v5;
  __p = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  sub_24C677288(self->_fingerprinter.__ptr_.__value_, v6, v5[11] * v5[10] * v5[12], (uint64_t)&__p);
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v10 = (uint64_t *)__p;
  CFMutableDictionaryRef v11 = v24;
  if (__p != v24)
  {
    do
    {
      id v12 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v7, *v10, v10[1] - *v10, v8);
      objc_msgSend_addObject_(v9, v13, (uint64_t)v12, v14, v15);

      v10 += 3;
    }
    while (v10 != v11);
  }
  uint64_t v16 = (uint64_t *)__p;
  if (__p)
  {
    uint64_t v17 = v24;
    uint64_t v18 = __p;
    if (v24 != __p)
    {
      uint64_t v19 = v24;
      do
      {
        uint64_t v21 = (void *)*(v19 - 3);
        v19 -= 3;
        uint64_t v20 = v21;
        if (v21)
        {
          *(v17 - 2) = (uint64_t)v20;
          operator delete(v20);
        }
        uint64_t v17 = v19;
      }
      while (v19 != v16);
      uint64_t v18 = __p;
    }
    uint64_t v24 = v16;
    operator delete(v18);
  }

  return v9;
}

- (id)base64HashesFromFingerprintEmbedding:(id)a3
{
  id v4 = a3;
  os_signpost_id_t v5 = (uint64_t *)sub_24C66A4BC(v4);
  uint64_t v6 = *v5;
  unint64_t v27 = 0;
  long long v28 = 0;
  uint64_t v29 = 0;
  sub_24C677288(self->_fingerprinter.__ptr_.__value_, v6, v5[11] * v5[10] * v5[12], (uint64_t)&v27);
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v8 = (char *)v27;
  id v9 = v28;
  if (v27 != v28)
  {
    do
    {
      __p = 0;
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      (*(void (**)(ImageDescriptorProcessorHyperplaneLSH *, void, void **))(*(void *)self->_fingerprinter.__ptr_.__value_
                                                                                       + 24))(self->_fingerprinter.__ptr_.__value_, *(void *)v8, &__p);
      if (v26 >= 0) {
        p_p = &__p;
      }
      else {
        p_p = __p;
      }
      if (v26 >= 0) {
        objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v10, (uint64_t)p_p, HIBYTE(v26), v11);
      }
      else {
      CVReturn v13 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v10, (uint64_t)p_p, v25, v11);
      }
      objc_msgSend_addObject_(v7, v14, (uint64_t)v13, v15, v16);

      if (SHIBYTE(v26) < 0) {
        operator delete(__p);
      }
      v8 += 24;
    }
    while (v8 != v9);
  }
  uint64_t v17 = (char *)v27;
  if (v27)
  {
    uint64_t v18 = v28;
    uint64_t v19 = v27;
    if (v28 != v27)
    {
      uint64_t v20 = v28;
      do
      {
        uint64_t v22 = (void *)*((void *)v20 - 3);
        v20 -= 24;
        uint64_t v21 = v22;
        if (v22)
        {
          *((void *)v18 - 2) = v21;
          operator delete(v21);
        }
        uint64_t v18 = v20;
      }
      while (v20 != v17);
      uint64_t v19 = v27;
    }
    long long v28 = v17;
    operator delete(v19);
  }

  return v7;
}

- (BOOL)enumerateEntityNetClassificationLikelihoods:(id)a3 usingBlock:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v17 = objc_msgSend_sceneTaxonomyWithError_(self->_configuration, v10, (uint64_t)a5, v11, v12);
  if (!v17)
  {
    BOOL v25 = 0;
    goto LABEL_9;
  }
  uint64_t v18 = objc_msgSend_entityNetVocabularyName(self->_configuration, v13, v14, v15, v16);
  id v19 = v8;
  if (!v19)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "The given CSUBuffer instance is nil.");
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "The given CSUBuffer is not an instance of CSUEspressoBuffer.");
LABEL_7:
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  uint64_t v24 = objc_msgSend_espressoBuffer(v19, v20, v21, v22, v23);

  sub_24C6A0A44(v17, v18, v24, v9);
  BOOL v25 = 1;
LABEL_9:

  return v25;
}

- (BOOL)enumerateEntityNetClassificationLikelihoods:(id)a3 usingBlock:(id)a4
{
  return objc_msgSend_enumerateEntityNetClassificationLikelihoods_usingBlock_error_(self, a2, (uint64_t)a3, (uint64_t)a4, 0);
}

- (id)allEntityNetClassificationLikelihoods:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_24C66CD9C;
  v13[3] = &unk_2652E7C28;
  id v14 = v7;
  id v8 = v7;
  if (objc_msgSend_enumerateEntityNetClassificationLikelihoods_usingBlock_error_(self, v9, (uint64_t)v6, (uint64_t)v13, (uint64_t)a4))id v10 = v8; {
  else
  }
    id v10 = 0;
  id v11 = v10;

  return v11;
}

- (id)allEntityNetClassificationLikelihoods:(id)a3
{
  id v4 = objc_msgSend_allEntityNetClassificationLikelihoods_error_(self, a2, (uint64_t)a3, 0, v3);
  return v4;
}

- (void)_unsafeRunOnInputImage:(__CVBuffer *)a3 completion:(id)a4
{
  uint64_t v104 = *MEMORY[0x263EF8340];
  v88 = (void (**)(id, void *, void))a4;
  id v97 = 0;
  char Resources = objc_msgSend_loadResources_(self, v6, (uint64_t)&v97, v7, v8);
  id v10 = v97;
  uint64_t v15 = v10;
  if (Resources)
  {
    id v82 = v10;
    value = self->_net.__ptr_.__value_;
    objc_msgSend_inputImageTensorName(self->_configuration, v11, v12, v13, v14);
    id v17 = objc_claimAutoreleasedReturnValue();
    v93 = (const char *)objc_msgSend_UTF8String(v17, v18, v19, v20, v21);
    sub_24C671D40((uint64_t)v89, a3);
    sub_24C672AB4((uint64_t)&v98, &v93, (uint64_t)v89);
    memset(v94, 0, sizeof(v94));
    int v95 = 1065353216;
    sub_24C672C8C((uint64_t)v94, (uint64_t)&v98, &v98);
    sub_24C66D4AC((uint64_t)value, (uint64_t)v94, (uint64_t)v96);
    sub_24C6717DC((uint64_t)v94);
    v100 = &unk_26FEDD950;
    uint64_t v22 = v103;
    if (v103 && !atomic_fetch_add(&v103->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
    if (v101)
    {
      v102 = v101;
      operator delete(v101);
    }
    if (v99 < 0) {
      operator delete((void *)v98);
    }
    v89[0] = &unk_26FEDD950;
    uint64_t v23 = v92;
    if (v92 && !atomic_fetch_add(&v92->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
    if (__p)
    {
      v91 = __p;
      operator delete(__p);
    }

    *(void *)&long long v98 = v96;
    uint64_t v24 = [CSUSceneNetV5NetworkOutput alloc];
    v81 = objc_msgSend_scenePrintTensorName(self->_configuration, v25, v26, v27, v28);
    v87 = sub_24C66D704((void **)&v98, v81);
    v80 = objc_msgSend_sceneClassificationTensorName(self->_configuration, v29, v30, v31, v32);
    v86 = sub_24C66D704((void **)&v98, v80);
    v79 = objc_msgSend_aestheticsAttributesTensorName(self->_configuration, v33, v34, v35, v36);
    v85 = sub_24C66D704((void **)&v98, v79);
    v78 = objc_msgSend_aestheticsGlobalScoresTensorName(self->_configuration, v37, v38, v39, v40);
    v84 = sub_24C66D704((void **)&v98, v78);
    v77 = objc_msgSend_detectionScoreHeatMapName(self->_configuration, v41, v42, v43, v44);
    v83 = sub_24C66D704((void **)&v98, v77);
    v76 = objc_msgSend_detectionCoordinateOffsetMapName(self->_configuration, v45, v46, v47, v48);
    uint64_t v49 = sub_24C66D704((void **)&v98, v76);
    long long v54 = objc_msgSend_saliencyAttentionTensorName(self->_configuration, v50, v51, v52, v53);
    uint64_t v55 = sub_24C66D704((void **)&v98, v54);
    v60 = objc_msgSend_saliencyObjectnessTensorName(self->_configuration, v56, v57, v58, v59);
    v61 = sub_24C66D704((void **)&v98, v60);
    v66 = objc_msgSend_fingerprintEmbeddingTensorName(self->_configuration, v62, v63, v64, v65);
    v67 = sub_24C66D704((void **)&v98, v66);
    v72 = objc_msgSend_entityNetClassificationTensorName(self->_configuration, v68, v69, v70, v71);
    v73 = sub_24C66D704((void **)&v98, v72);
    v75 = objc_msgSend_initWithScenePrint_sceneClassificationLikelihoods_aestheticsAttributeScores_aestheticsGlobalScores_detectionScoreHeatMap_detectionCoordinateOffsetMap_saliencyAttentionMap_saliencyObjectnessMap_fingerprintEmbedding_entityNetClassificationLikelihoods_(v24, v74, (uint64_t)v87, (uint64_t)v86, (uint64_t)v85, v84, v83, v49, v55, v61, v67, v73);

    ((void (**)(id, void *, id))v88)[2](v88, v75, v82);
    sub_24C6717DC((uint64_t)v96);
    uint64_t v15 = v82;
  }
  else
  {
    ((void (**)(id, void *, id))v88)[2](v88, 0, v10);
  }
}

- (CSUSceneNetV5Configuration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  value = self->_fingerprinter.__ptr_.__value_;
  self->_fingerprinter.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(ImageDescriptorProcessorHyperplaneLSH *))(*(void *)value + 8))(value);
  }
  id v4 = self->_transferSession.__ptr_.__value_;
  self->_transferSession.__ptr_.__value_ = 0;
  if (v4)
  {
    os_signpost_id_t v5 = *(CFTypeRef **)v4;
    *(void *)id v4 = 0;
    if (v5)
    {
      if (*v5) {
        CFRelease(*v5);
      }
      MEMORY[0x2532F8960](v5, 0x20C4093837F09);
    }
    MEMORY[0x2532F8960](v4, 0x20C4093837F09);
  }
  id v6 = self->_net.__ptr_.__value_;
  self->_net.__ptr_.__value_ = 0;
  if (v6)
  {
    uint64_t v7 = *(void (**)(void))(*(void *)v6 + 8);
    v7();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end