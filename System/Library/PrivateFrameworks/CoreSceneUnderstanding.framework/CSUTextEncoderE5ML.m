@interface CSUTextEncoderE5ML
- (BOOL)checkIfEmbeddingInDstBufferIsContiguous:(const void *)a3;
- (BOOL)checkIfEmbeddingInSrcBufferIsContiguous:(id)a3;
- (BOOL)loadModelCatalogResourcesWithAssetLock:(id)a3 Error:(id *)a4;
- (BOOL)loadResources:(id *)a3;
- (BOOL)loadResourcesInternal:(id *)a3;
- (BOOL)reLoadResources:(id *)a3;
- (CSUTextEncoderE5ML)initWithConfiguration:(id)a3;
- (CSUTextEncoderE5MLConfiguration)configuration;
- (NSArray)tokenSegments;
- (NSDictionary)additionalLayers;
- (id).cxx_construct;
- (id)getTokenEmbeddingsforChunks:(vector<std:(std:(id *)a4 :allocator<std::vector<unsigned int>>> *)a3 :vector<unsigned)int> error:;
- (vector<unsigned)getTokensOnText:(CSUTextEncoderE5ML *)self withBOS:(SEL)a3 withEOS:(id)a4 withError:(BOOL)a5;
- (void)_unsafeRunOnInput:(id)a3 completion:(id)a4;
- (void)_unsafeRunOnInputText:(id)a3 completion:(id)a4;
- (void)runOnInput:(id)a3 completion:(id)a4;
- (void)runOnInputText:(id)a3 completion:(id)a4;
- (void)setAdditionalLayers:(id)a3;
- (void)setTokenSegments:(id)a3;
@end

@implementation CSUTextEncoderE5ML

- (CSUTextEncoderE5ML)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSUTextEncoderE5ML;
  v6 = [(CSUTextEncoderE5ML *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    tokenEmbedder = v7->_tokenEmbedder;
    v7->_tokenEmbedder = 0;

    textEncoder = v7->_textEncoder;
    v7->_textEncoder = 0;

    assetVersionNumber = v7->_assetVersionNumber;
    v7->_assetVersionNumber = 0;

    v11 = v7;
  }

  return v7;
}

- (vector<unsigned)getTokensOnText:(CSUTextEncoderE5ML *)self withBOS:(SEL)a3 withEOS:(id)a4 withError:(BOOL)a5
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a4;
  if ((objc_msgSend_loadResources_(self, v13, (uint64_t)a7, v14, v15) & 1) == 0)
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2.var0 = 0;
    goto LABEL_22;
  }
  if (objc_msgSend_inputIsLowerCase(self->_configuration, v16, v17, v18, v19))
  {
    uint64_t v24 = objc_msgSend_lowercaseString(v12, v20, v21, v22, v23);

    id v12 = (id)v24;
  }
  id v12 = v12;
  v29 = (const char *)objc_msgSend_UTF8String(v12, v25, v26, v27, v28);
  size_t v30 = strlen(v29);
  if (v30 >= 0x7FFFFFFFFFFFFFF8) {
    sub_24C6673C8();
  }
  v31 = (void *)v30;
  if (v30 >= 0x17)
  {
    uint64_t v33 = (v30 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v30 | 7) != 0x17) {
      uint64_t v33 = v30 | 7;
    }
    uint64_t v34 = v33 + 1;
    v32 = (void **)operator new(v33 + 1);
    __dst[1] = v31;
    unint64_t v45 = v34 | 0x8000000000000000;
    __dst[0] = v32;
  }
  else
  {
    HIBYTE(v45) = v30;
    v32 = __dst;
    if (!v30) {
      goto LABEL_13;
    }
  }
  memmove(v32, v29, (size_t)v31);
LABEL_13:
  *((unsigned char *)v31 + (void)v32) = 0;
  (*(void (**)(unsigned char **__return_ptr))(*(void *)self->_vocabulary.__ptr_.__value_ + 16))(&v42);
  if (v9)
  {
    int v41 = 1;
    sub_24C678294((void **)&v42, v42, &v41);
  }
  v35 = v42;
  uint64_t v36 = (uint64_t)v43 + 4 * v8 - 4;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  int64_t v37 = v36 - (void)v35;
  if ((void *)v36 != v35)
  {
    if (v37 < 0) {
      sub_24C667470();
    }
    v38 = (unsigned int *)operator new(v36 - (void)v35);
    retstr->var0 = v38;
    v39 = &v38[v37 >> 2];
    retstr->var2.var0 = v39;
    memmove(v38, v35, v37);
    retstr->var1 = v39;
  }
  if (v35)
  {
    v43 = v35;
    operator delete(v35);
  }
  if (SHIBYTE(v45) < 0) {
    operator delete(__dst[0]);
  }
LABEL_22:

  return result;
}

- (BOOL)loadResources:(id *)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = sub_24C69662C();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  v7 = sub_24C69662C();
  BOOL v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v43[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_24C664000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CSUTextEncoderE5MLLoadResources", "", (uint8_t *)v43, 2u);
  }

  v43[0] = &unk_26FEDB970;
  v43[1] = v6;
  v44 = v43;
  BOOL v9 = 0;
  uint64_t v14 = objc_msgSend_configuration(self, v10, v11, v12, v13);
  uint64_t v23 = objc_msgSend_revision(v14, v15, v16, v17, v18);
  if (v23 != 2)
  {
    BOOL v9 = objc_msgSend_configuration(self, v19, v20, v21, v22);
    if (objc_msgSend_revision(v9, v24, v25, v26, v27) != 5)
    {

LABEL_12:
      v40 = 0;
      goto LABEL_13;
    }
  }
  uint64_t v28 = objc_msgSend_configuration(self, v19, v20, v21, v22);
  char v33 = objc_msgSend_sideLoaded(v28, v29, v30, v31, v32);

  if (v23 != 2) {
  if (v33)
  }
    goto LABEL_12;
  int64_t v37 = objc_opt_new();
  if (objc_msgSend_loadModelCatalogResourcesWithAssetLock_Error_(self, v38, (uint64_t)v37, (uint64_t)a3, v39))
  {
    v40 = v37;
LABEL_13:
    char ResourcesInternal = objc_msgSend_loadResourcesInternal_(self, v34, (uint64_t)a3, v35, v36);
    int64_t v37 = v40;
    goto LABEL_14;
  }
  char ResourcesInternal = 0;
LABEL_14:

  if (!v44) {
    sub_24C66DAC0();
  }
  (*(void (**)(void *))(*v44 + 48))(v44);
  if (v44 == v43)
  {
    (*(void (**)(void *))(v43[0] + 32))(v43);
  }
  else if (v44)
  {
    (*(void (**)(void))(*v44 + 40))();
  }
  return ResourcesInternal;
}

- (BOOL)loadResourcesInternal:(id *)a3
{
  if (self->_textEncoder && self->_tokenEmbedder) {
    return 1;
  }
  else {
    return objc_msgSend_reLoadResources_(self, a2, (uint64_t)a3, v3, v4);
  }
}

- (BOOL)reLoadResources:(id *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_24C69662C();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  os_signpost_id_t v6 = sub_24C69662C();
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_24C664000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "CSUTextEncoderE5MLReLoadResources", "", buf, 2u);
  }

  *(void *)buf = &unk_26FEDB9C8;
  os_signpost_id_t v27 = v5;
  uint64_t v28 = buf;
  objc_msgSend_vocabularyModelPath(self->_configuration, v8, v9, v10, v11);
  id v12 = objc_claimAutoreleasedReturnValue();
  uint64_t v17 = (const char *)objc_msgSend_UTF8String(v12, v13, v14, v15, v16);
  size_t v18 = strlen(v17);
  if (v18 >= 0x7FFFFFFFFFFFFFF8) {
    sub_24C6673C8();
  }
  size_t v19 = v18;
  if (v18 >= 0x17)
  {
    uint64_t v21 = (v18 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v18 | 7) != 0x17) {
      uint64_t v21 = v18 | 7;
    }
    uint64_t v22 = v21 + 1;
    uint64_t v20 = operator new(v21 + 1);
    __dst[1] = v19;
    unint64_t v25 = v22 | 0x8000000000000000;
    __dst[0] = v20;
  }
  else
  {
    HIBYTE(v25) = v18;
    uint64_t v20 = __dst;
    if (!v18)
    {
LABEL_12:
      *((unsigned char *)v20 + v19) = 0;
      sub_24C666A80();
    }
  }
  memmove(v20, v17, v19);
  goto LABEL_12;
}

- (BOOL)checkIfEmbeddingInDstBufferIsContiguous:(const void *)a3
{
  memset(&__p[3], 0, 24);
  os_signpost_id_t v6 = (unsigned char *)*((void *)a3 + 2);
  os_signpost_id_t v5 = (unsigned char *)*((void *)a3 + 3);
  int64_t v7 = v5 - v6;
  if (v5 == v6)
  {
    BOOL v8 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    if (v7 < 0) {
      sub_24C667470();
    }
    BOOL v8 = (char *)operator new(v5 - v6);
    uint64_t v9 = &v8[8 * (v7 >> 3)];
    memcpy(v8, v6, v7);
  }
  (*(void (**)(void **__return_ptr))(**((void **)a3 + 5) + 32))(__p);
  if (v9 == v8)
  {
LABEL_11:
    char v17 = 0;
    BOOL v18 = 0;
    uint64_t v16 = __p[0];
    if (!__p[0]) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v14 = 0;
    while (1)
    {
      uint64_t v15 = *(void *)&v8[8 * v14];
      if (v15 == objc_msgSend_tokenEmbeddingLength(self->_configuration, v10, v11, v12, v13))
      {
        uint64_t v16 = __p[0];
        if (*((void *)__p[0] + v14) == 4) {
          break;
        }
      }
      if (++v14 >= (unint64_t)((v9 - v8) >> 3)) {
        goto LABEL_11;
      }
    }
    char v17 = 1;
  }
  __p[1] = v16;
  operator delete(v16);
  BOOL v18 = v17;
LABEL_13:
  if (v8) {
    operator delete(v8);
  }
  return v18;
}

- (BOOL)checkIfEmbeddingInSrcBufferIsContiguous:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_strides(v4, v5, v6, v7, v8);
  BOOL v18 = objc_msgSend_shape(v4, v10, v11, v12, v13);
  for (unint64_t i = 0; ; ++i)
  {
    if (i >= objc_msgSend_count(v18, v14, v15, v16, v17))
    {
      BOOL v34 = 0;
      goto LABEL_7;
    }
    uint64_t v23 = objc_msgSend_objectAtIndex_(v18, v20, i, v21, v22);
    uint64_t v28 = objc_msgSend_unsignedLongValue(v23, v24, v25, v26, v27);
    uint64_t v33 = objc_msgSend_tokenEmbeddingLength(self->_configuration, v29, v30, v31, v32);

    if (v28 == v33) {
      break;
    }
  }
  uint64_t v35 = objc_msgSend_objectAtIndex_(v9, v14, i, v16, v17);
  BOOL v34 = objc_msgSend_unsignedLongValue(v35, v36, v37, v38, v39) == 1;

LABEL_7:
  return v34;
}

- (id)getTokenEmbeddingsforChunks:(vector<std:(std:(id *)a4 :allocator<std::vector<unsigned int>>> *)a3 :vector<unsigned)int> error:
{
  v89[2] = *MEMORY[0x263EF8340];
  unint64_t v10 = objc_msgSend_contextLength(self->_configuration, a2, (uint64_t)a3, (uint64_t)a4, v4);
  v81 = a4;
  __p = 0;
  *a4 = 0;
  *(void *)v83 = 0;
  uint64_t v84 = 0;
  var0 = (char **)a3->var0;
  var1 = (char **)a3->var1;
  if (var0 != var1)
  {
    do
    {
      sub_24C67C730((unint64_t *)&__p, *(void **)v83, *var0, var0[1], (var0[1] - *var0) >> 2);
      var0 += 3;
    }
    while (var0 != var1);
    if (v10 < (uint64_t)(*(void *)v83 - (void)__p) >> 2)
    {
      uint64_t v13 = objc_msgSend_stringWithFormat_(NSString, v7, @"Maximum input token sequence length exceeds %zu", v8, v9, v10);
      objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v14, (uint64_t)v13, v15, v16);
      id *v81 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  tokenEmbedder = self->_tokenEmbedder;
  v89[0] = &unk_26FEEA1B8;
  BOOL v18 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v7, v10, v8, v9);
  v89[1] = v18;
  uint64_t v21 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v19, (uint64_t)v89, 2, v20);
  uint64_t v23 = objc_msgSend_getInputMLMutliArrayFor_WithShape_error_(tokenEmbedder, v22, @"text_ids", (uint64_t)v21, (uint64_t)v81);

  if (v23)
  {
    if (v10)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        uint64_t v28 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v24, 0, v25, v26);
        v88[0] = &unk_26FEEA1E8;
        uint64_t v32 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v29, i, v30, v31);
        v88[1] = v32;
        uint64_t v35 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v33, (uint64_t)v88, 2, v34);
        objc_msgSend_setObject_forKeyedSubscript_(v23, v36, (uint64_t)v28, (uint64_t)v35, v37);
      }
      uint64_t v38 = *(char **)v83;
      if (__p != *(void **)v83)
      {
        uint64_t v39 = (char *)__p + 4;
        unint64_t v40 = 1;
        do
        {
          int v41 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v24, *((unsigned int *)v39 - 1), v25, v26);
          v87[0] = &unk_26FEEA1E8;
          uint64_t v45 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v42, v40 - 1, v43, v44);
          v87[1] = v45;
          v48 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v46, (uint64_t)v87, 2, v47);
          objc_msgSend_setObject_forKeyedSubscript_(v23, v49, (uint64_t)v41, (uint64_t)v48, v50);

          if (v39 == v38) {
            break;
          }
          v39 += 4;
        }
        while (v40++ < v10);
      }
    }
    v52 = self->_tokenEmbedder;
    v85 = @"text_ids";
    v86 = v23;
    v53 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v24, (uint64_t)&v86, (uint64_t)&v85, 1);
    char v56 = objc_msgSend_setInputFeatures_error_(v52, v54, (uint64_t)v53, (uint64_t)v81, v55);

    if (v56)
    {
      if (objc_msgSend_predict_(self->_tokenEmbedder, v57, (uint64_t)v81, v58, v59))
      {
        v63 = objc_msgSend_getOutputFor_(self->_tokenEmbedder, v60, @"token_embed", v61, v62);
        goto LABEL_25;
      }
      v64 = sub_24C69662C();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
        sub_24C729C94(v64, v72, v73, v74, v75, v76, v77, v78);
      }
    }
    else
    {
      v64 = sub_24C69662C();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
        sub_24C729CCC(v64, v65, v66, v67, v68, v69, v70, v71);
      }
    }
  }
  v63 = 0;
LABEL_25:

  if (__p)
  {
    *(void *)v83 = __p;
    operator delete(__p);
  }
  return v63;
}

- (BOOL)loadModelCatalogResourcesWithAssetLock:(id)a3 Error:(id *)a4
{
  id v7 = a3;
  uint64_t v12 = objc_msgSend_configuration(self, v8, v9, v10, v11);
  uint64_t v21 = objc_msgSend_revision(v12, v13, v14, v15, v16);
  if (v21 != 2)
  {
    uint64_t v4 = objc_msgSend_configuration(self, v17, v18, v19, v20);
    if (objc_msgSend_revision(v4, v22, v23, v24, v25) != 5) {
      goto LABEL_8;
    }
  }
  uint64_t v26 = objc_msgSend_configuration(self, v17, v18, v19, v20);
  char v31 = objc_msgSend_sideLoaded(v26, v27, v28, v29, v30);

  if (v21 != 2) {
  if (v31)
  }
    goto LABEL_9;
  uint64_t v12 = objc_opt_new();
  uint64_t v4 = objc_msgSend_fetchWithAssetLock_error_(v12, v32, (uint64_t)v7, (uint64_t)a4, v33);
  if (!v4)
  {
    if (a4)
    {
      objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v34, @"Model Catalog asset base url for text and token encoders is nil!", (uint64_t)*a4, v37);
      BOOL v43 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

      goto LABEL_18;
    }
LABEL_16:
    BOOL v43 = 0;
    goto LABEL_17;
  }
  uint64_t v38 = objc_msgSend_getAssetVersion(v12, v34, v35, v36, v37);
  char isEqual = objc_msgSend_isEqual_(v38, v39, (uint64_t)self->_assetVersionNumber, v40, v41);

  if ((isEqual & 1) == 0)
  {
    uint64_t v44 = sub_24C69662C();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v71 = 0;
      _os_log_impl(&dword_24C664000, v44, OS_LOG_TYPE_INFO, "new ModelCatalog assets available for text encoder - reloading", v71, 2u);
    }

    v49 = objc_msgSend_configuration(self, v45, v46, v47, v48);
    objc_msgSend_setTextEncoderNetworkURL_(v49, v50, (uint64_t)v4, v51, v52);

    v57 = objc_msgSend_configuration(self, v53, v54, v55, v56);
    objc_msgSend_setTokenEmbeddingNetworkURL_(v57, v58, (uint64_t)v4, v59, v60);

    if (objc_msgSend_reLoadResources_(self, v61, (uint64_t)a4, v62, v63))
    {
      objc_msgSend_getAssetVersion(v12, v64, v65, v66, v67);
      uint64_t v68 = (NSString *)objc_claimAutoreleasedReturnValue();
      assetVersionNumber = self->_assetVersionNumber;
      self->_assetVersionNumber = v68;

      BOOL v43 = 1;
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_8:

LABEL_9:
  BOOL v43 = 1;
LABEL_18:

  return v43;
}

- (void)_unsafeRunOnInput:(id)a3 completion:(id)a4
{
  uint64_t v592 = *MEMORY[0x263EF8340];
  id v542 = a3;
  v547 = (void (**)(id, void, id))a4;
  v543 = objc_msgSend_date(MEMORY[0x263EFF910], v6, v7, v8, v9);
  uint64_t v10 = 0;
  uint64_t v15 = objc_msgSend_configuration(self, v11, v12, v13, v14);
  uint64_t v24 = objc_msgSend_revision(v15, v16, v17, v18, v19);
  if (v24 == 2
    || (objc_msgSend_configuration(self, v20, v21, v22, v23),
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_revision(v10, v25, v26, v27, v28) == 5))
  {
    uint64_t v29 = objc_msgSend_configuration(self, v20, v21, v22, v23);
    char v34 = objc_msgSend_sideLoaded(v29, v30, v31, v32, v33);

    if (v24 != 2) {
    if ((v34 & 1) == 0)
    }
    {
      uint64_t v38 = objc_opt_new();
      id v582 = 0;
      char ModelCatalogResourcesWithAssetLock_Error = objc_msgSend_loadModelCatalogResourcesWithAssetLock_Error_(self, v39, (uint64_t)v38, (uint64_t)&v582, v40);
      id v42 = v582;
      if ((ModelCatalogResourcesWithAssetLock_Error & 1) == 0)
      {
        v547[2](v547, 0, v42);
        goto LABEL_188;
      }
      v546 = v38;
      goto LABEL_10;
    }
  }
  else
  {
  }
  v546 = 0;
  id v42 = 0;
LABEL_10:
  id v581 = v42;
  char ResourcesInternal = objc_msgSend_loadResourcesInternal_(self, v35, (uint64_t)&v581, v36, v37);
  v554 = self;
  id v44 = v581;

  if ((ResourcesInternal & 1) == 0)
  {
    id v42 = v44;
    v547[2](v547, 0, v44);
    uint64_t v38 = v546;
    goto LABEL_188;
  }
  objc_msgSend_timeIntervalSinceNow(v543, v45, v46, v47, v48);
  uint64_t v50 = v49;
  uint64_t v51 = sub_24C69662C();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v50;
    _os_log_impl(&dword_24C664000, v51, OS_LOG_TYPE_INFO, "time to load resources = %f", (uint8_t *)&buf, 0xCu);
  }

  long long buf = 0uLL;
  unint64_t v591 = 0;
  v578 = 0;
  v579 = 0;
  unint64_t v580 = 0;
  uint64_t v52 = operator new(4uLL);
  v589[0].n128_u64[0] = (unint64_t)v52;
  _DWORD *v52 = 1;
  v589[0].n128_u64[1] = (unint64_t)(v52 + 1);
  v589[1].n128_u64[0] = (unint64_t)(v52 + 1);
  sub_24C67B50C((char **)&buf, 0, v589);
  v57 = self;
  if (v589[0].n128_u64[0])
  {
    v589[0].n128_u64[1] = v589[0].n128_u64[0];
    operator delete((void *)v589[0].n128_u64[0]);
  }
  v539 = objc_msgSend_date(MEMORY[0x263EFF910], v53, v54, v55, v56);
  long long v576 = 0u;
  long long v577 = 0u;
  long long v574 = 0u;
  long long v575 = 0u;
  id obj = v542;
  uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v58, (uint64_t)&v574, (uint64_t)v588, 16);
  if (!v59)
  {
    char v538 = 0;
    v548 = &stru_26FEDE788;
    unint64_t v552 = 1;
LABEL_85:

    id v549 = v44;
LABEL_86:
    uint64_t v200 = *((void *)&buf + 1);
    v201 = operator new(4uLL);
    v589[0].n128_u64[0] = (unint64_t)v201;
    _DWORD *v201 = 1;
    v589[0].n128_u64[1] = (unint64_t)(v201 + 1);
    v589[1].n128_u64[0] = (unint64_t)(v201 + 1);
    sub_24C67B50C((char **)&buf, v200, v589);
    if (v589[0].n128_u64[0])
    {
      v589[0].n128_u64[1] = v589[0].n128_u64[0];
      operator delete((void *)v589[0].n128_u64[0]);
    }
    objc_msgSend_timeIntervalSinceNow(v539, v202, v203, v204, v205);
    unint64_t v207 = v206;
    v208 = sub_24C69662C();
    if (os_log_type_enabled(v208, OS_LOG_TYPE_INFO))
    {
      v589[0].n128_u32[0] = 134217984;
      *(unint64_t *)((char *)v589[0].n128_u64 + 4) = v207;
      _os_log_impl(&dword_24C664000, v208, OS_LOG_TYPE_INFO, "time to compute tokens = %f", (uint8_t *)v589, 0xCu);
    }

    id obja = (id)objc_opt_new();
    v214 = (void *)*((void *)&buf + 1);
    v213 = (void *)buf;
    if ((void)buf != *((void *)&buf + 1))
    {
      uint64_t v215 = 0;
      uint64_t v216 = 0;
      do
      {
        if (v216 && v216 != -1 - 0x5555555555555555 * ((uint64_t)(*((void *)&buf + 1) - buf) >> 3))
        {
          v217 = v213 + 1;
          v219 = objc_msgSend_valueWithRange_(MEMORY[0x263F08D40], v209, v215, (uint64_t)(v213[1] - *v213) >> 2, v212);
          objc_msgSend_addObject_(obja, v223, (uint64_t)v219, v224, v225);
        }
        else
        {
          v217 = v213 + 1;
          uint64_t v218 = v213[1] - *v213 == 4 && *(_DWORD *)*v213 == 1;
          v219 = objc_msgSend_CSUAssert_log_(CSUError, v209, v218, @"BOS or EOS token not present in token IDs", v212);
          objc_msgSend_logInternalError_(CSUError, v220, (uint64_t)v219, v221, v222);
        }

        v226 = (_DWORD *)*v213;
        v213 += 3;
        v215 += (uint64_t)(*v217 - (void)v226) >> 2;
        ++v216;
      }
      while (v213 != v214);
    }
    uint64_t v227 = objc_msgSend_copy(obja, v209, v210, v211, v212);
    tokenSegments = v554->_tokenSegments;
    v554->_tokenSegments = (NSArray *)v227;

    v541 = objc_msgSend_date(MEMORY[0x263EFF910], v229, v230, v231, v232);
    sub_24C67D2E4(&v569, (uint64_t *)&buf);
    id v568 = v549;
    v556 = objc_msgSend_getTokenEmbeddingsforChunks_error_(v554, v233, (uint64_t)&v569, (uint64_t)&v568, v234);
    id v235 = v568;

    v240 = (char *)v569;
    if (v569)
    {
      v241 = v570;
      v242 = v569;
      if (v570 != v569)
      {
        v243 = v570;
        do
        {
          v245 = (void *)*((void *)v243 - 3);
          v243 -= 24;
          v244 = v245;
          if (v245)
          {
            *((void *)v241 - 2) = v244;
            operator delete(v244);
          }
          v241 = v243;
        }
        while (v243 != v240);
        v242 = v569;
      }
      v570 = v240;
      operator delete(v242);
    }
    if (!v556)
    {
      objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v236, @"Could not compute Token Embeddings!", (uint64_t)v235, v239);
      id v549 = (id)objc_claimAutoreleasedReturnValue();

      ((void (*)(void (**)(id, void, id), void))v547[2])(v547, 0);
LABEL_173:

      goto LABEL_174;
    }
    objc_msgSend_timeIntervalSinceNow(v541, v236, v237, v238, v239);
    unint64_t v247 = v246;
    v248 = sub_24C69662C();
    if (os_log_type_enabled(v248, OS_LOG_TYPE_INFO))
    {
      v589[0].n128_u32[0] = 134217984;
      *(unint64_t *)((char *)v589[0].n128_u64 + 4) = v247;
      _os_log_impl(&dword_24C664000, v248, OS_LOG_TYPE_INFO, "time to get token embeddings = %f", (uint8_t *)v589, 0xCu);
    }

    v254 = (id *)v578;
    v253 = v579;
    if (v578 == v579)
    {
      v289 = v235;
    }
    else
    {
      do
      {
        id v255 = v254[1];
        id v256 = *v254;
        v261 = objc_msgSend_strides(v556, v257, v258, v259, v260);
        v265 = objc_msgSend_objectAtIndexedSubscript_(v261, v262, 1, v263, v264);
        uint64_t v270 = objc_msgSend_unsignedLongValue(v265, v266, v267, v268, v269);

        if (v270 != objc_msgSend_tokenEmbeddingLength(v554->_configuration, v271, v272, v273, v274))
        {
          v279 = sub_24C69662C();
          if (os_log_type_enabled(v279, OS_LOG_TYPE_ERROR))
          {
            uint64_t v325 = objc_msgSend_tokenEmbeddingLength(v554->_configuration, v280, v281, v282, v283);
            v589[0].n128_u32[0] = 134218240;
            *(unint64_t *)((char *)v589[0].n128_u64 + 4) = v270;
            v589[0].n128_u16[6] = 2048;
            *(unint64_t *)((char *)&v589[0].n128_u64[1] + 6) = v325;
            _os_log_error_impl(&dword_24C664000, v279, OS_LOG_TYPE_ERROR, "Potential error during custom embedding insertion? stride is %zu, but token embedding length is %zu", (uint8_t *)v589, 0x16u);
          }
        }
        uint64_t v288 = v270 * (void)v256;
        if (objc_msgSend_dataType(v556, v275, v276, v277, v278) == 65568)
        {
          v288 *= 4;
          v289 = v235;
        }
        else if (objc_msgSend_dataType(v556, v284, v285, v286, v287) == 65552)
        {
          v288 *= 2;
          v289 = v235;
        }
        else
        {
          v289 = objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v284, @"Non FP32 or FP16 datatype encountered!", 0, v287);

          v290 = sub_24C69662C();
          if (os_log_type_enabled(v290, OS_LOG_TYPE_ERROR)) {
            sub_24C729D3C((uint8_t *)&v586, (unsigned char *)&v586 + 1, v290);
          }

          v547[2](v547, 0, v289);
        }
        uint64_t v291 = objc_msgSend_dataType(v255, v284, v285, v286, v287);
        if (v291 == objc_msgSend_dataType(v556, v292, v293, v294, v295))
        {
          id v296 = v255;
        }
        else
        {
          v297 = sub_24C69662C();
          if (os_log_type_enabled(v297, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v326 = objc_msgSend_dataType(v255, v298, v299, v300, v301);
            uint64_t v331 = objc_msgSend_dataType(v556, v327, v328, v329, v330);
            v589[0].n128_u32[0] = 134218240;
            *(unint64_t *)((char *)v589[0].n128_u64 + 4) = v326;
            v589[0].n128_u16[6] = 2048;
            *(unint64_t *)((char *)&v589[0].n128_u64[1] + 6) = v331;
            _os_log_debug_impl(&dword_24C664000, v297, OS_LOG_TYPE_DEBUG, "Casting custom embedding from %ld type to expected token embedding type %ld", (uint8_t *)v589, 0x16u);
          }

          id v302 = objc_alloc(MEMORY[0x263F00DA8]);
          v307 = objc_msgSend_shape(v255, v303, v304, v305, v306);
          uint64_t v312 = objc_msgSend_dataType(v556, v308, v309, v310, v311);
          v317 = objc_msgSend_strides(v255, v313, v314, v315, v316);
          id v296 = (id)objc_msgSend_initWithShape_dataType_strides_(v302, v318, (uint64_t)v307, v312, (uint64_t)v317);

          objc_msgSend_transferToMultiArray_(v255, v319, (uint64_t)v296, v320, v321);
        }
        v565[0] = MEMORY[0x263EF8330];
        v565[1] = 3221225472;
        v565[2] = sub_24C687DB0;
        v565[3] = &unk_2652E7DF8;
        id v566 = v556;
        uint64_t v567 = v288;
        objc_msgSend_getBytesWithHandler_(v296, v322, (uint64_t)v565, v323, v324);

        v254 += 2;
        id v235 = v289;
      }
      while (v254 != (id *)v253);
    }
    v537 = objc_msgSend_date(MEMORY[0x263EFF910], v249, v250, v251, v252);
    id v332 = objc_alloc(MEMORY[0x263F00DA8]);
    id v564 = v289;
    v540 = objc_msgSend_initWithShape_dataType_error_(v332, v333, (uint64_t)&unk_26FEEA380, 65568, (uint64_t)&v564);
    id v334 = v564;

    *(float *)&double v335 = (float)v552;
    v340 = objc_msgSend_numberWithFloat_(NSNumber, v336, v337, v338, v339, v335);
    objc_msgSend_setObject_forKeyedSubscript_(v540, v341, (uint64_t)v340, (uint64_t)&unk_26FEEA398, v342);

    textEncoder = v554->_textEncoder;
    v584[0] = @"indices";
    v584[1] = @"token_embed";
    v585[0] = v540;
    v585[1] = v556;
    v345 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v344, (uint64_t)v585, (uint64_t)v584, 2);
    id v563 = v334;
    LOBYTE(textEncoder) = objc_msgSend_setInputFeatures_error_(textEncoder, v346, (uint64_t)v345, (uint64_t)&v563, v347);
    id v549 = v563;

    if ((textEncoder & 1) == 0)
    {
      v447 = sub_24C69662C();
      if (os_log_type_enabled(v447, OS_LOG_TYPE_ERROR)) {
        sub_24C729D04(v447, v448, v449, v450, v451, v452, v453, v454);
      }

      ((void (*)(void (**)(id, void, id), void))v547[2])(v547, 0);
      goto LABEL_172;
    }
    v536 = objc_msgSend_date(MEMORY[0x263EFF910], v348, v349, v350, v351);
    long long v561 = 0u;
    long long v562 = 0u;
    long long v559 = 0u;
    long long v560 = 0u;
    v356 = objc_msgSend_layerShapes(v554->_configuration, v352, v353, v354, v355);
    objc_msgSend_allKeys(v356, v357, v358, v359, v360);
    id v553 = (id)objc_claimAutoreleasedReturnValue();

    unint64_t v366 = objc_msgSend_countByEnumeratingWithState_objects_count_(v553, v361, (uint64_t)&v559, (uint64_t)v583, 16);
    v367 = v554;
    id v368 = v549;
    if (v366)
    {
      uint64_t v369 = *(void *)v560;
      while (1)
      {
        v550 = v368;
        if (*(void *)v560 != v369) {
          objc_enumerationMutation(v553);
        }
        uint64_t v370 = **((void **)&v559 + 1);
        v371 = objc_msgSend_layerShapes(v367->_configuration, v362, v363, v364, v365);
        objc_msgSend_objectForKeyedSubscript_(v371, v372, v370, v373, v374);
        id v375 = (id)objc_claimAutoreleasedReturnValue();

        v380 = objc_msgSend_layerWidths(v554->_configuration, v376, v377, v378, v379);
        v384 = objc_msgSend_objectForKeyedSubscript_(v380, v381, v370, v382, v383);

        v389 = objc_msgSend_layerHeights(v554->_configuration, v385, v386, v387, v388);
        v393 = objc_msgSend_objectForKeyedSubscript_(v389, v390, v370, v391, v392);

        v394 = v554->_textEncoder;
        uint64_t v399 = objc_msgSend_unsignedLongValue(v384, v395, v396, v397, v398);
        uint64_t v404 = objc_msgSend_unsignedLongValue(v393, v400, v401, v402, v403);
        id v558 = v550;
        objc_msgSend_setOutputBufferWithLayerName_withWidth_withHeight_withShape_withPixelFormat_error_(v394, v405, v370, v399, v404, v375, 1278226536, &v558);
        id v406 = v558;

        if (v406) {
          break;
        }

        if (v366 >= 2)
        {
          uint64_t v411 = 1;
          while (1)
          {
            if (*(void *)v560 != v369) {
              objc_enumerationMutation(v553);
            }
            uint64_t v412 = *(void *)(*((void *)&v559 + 1) + 8 * v411);
            v413 = objc_msgSend_layerShapes(v554->_configuration, v407, v408, v409, v410);
            objc_msgSend_objectForKeyedSubscript_(v413, v414, v412, v415, v416);
            id v375 = (id)objc_claimAutoreleasedReturnValue();

            v421 = objc_msgSend_layerWidths(v554->_configuration, v417, v418, v419, v420);
            v384 = objc_msgSend_objectForKeyedSubscript_(v421, v422, v412, v423, v424);

            v429 = objc_msgSend_layerHeights(v554->_configuration, v425, v426, v427, v428);
            v393 = objc_msgSend_objectForKeyedSubscript_(v429, v430, v412, v431, v432);

            v433 = v554->_textEncoder;
            uint64_t v438 = objc_msgSend_unsignedLongValue(v384, v434, v435, v436, v437);
            uint64_t v443 = objc_msgSend_unsignedLongValue(v393, v439, v440, v441, v442);
            id v558 = 0;
            objc_msgSend_setOutputBufferWithLayerName_withWidth_withHeight_withShape_withPixelFormat_error_(v433, v444, v412, v438, v443, v375, 1278226536, &v558);
            id v445 = v558;
            if (v445) {
              break;
            }

            if (v366 == ++v411) {
              goto LABEL_144;
            }
          }
          id v406 = v445;
          break;
        }
LABEL_144:
        unint64_t v366 = objc_msgSend_countByEnumeratingWithState_objects_count_(v553, v407, (uint64_t)&v559, (uint64_t)v583, 16);
        id v368 = 0;
        v446 = 0;
        v367 = v554;
        if (!v366) {
          goto LABEL_154;
        }
      }
      id v549 = v406;
      v547[2](v547, 0, v406);
    }
    else
    {
      v446 = v549;
LABEL_154:

      objc_msgSend_timeIntervalSinceNow(v536, v455, v456, v457, v458);
      unint64_t v460 = v459;
      v461 = sub_24C69662C();
      if (os_log_type_enabled(v461, OS_LOG_TYPE_INFO))
      {
        v589[0].n128_u32[0] = 134217984;
        *(unint64_t *)((char *)v589[0].n128_u64 + 4) = v460;
        _os_log_impl(&dword_24C664000, v461, OS_LOG_TYPE_INFO, "time to get output buffers = %f", (uint8_t *)v589, 0xCu);
      }

      v462 = v554->_textEncoder;
      id v557 = v446;
      char v466 = objc_msgSend_predict_(v462, v463, (uint64_t)&v557, v464, v465);
      id v551 = v557;

      if ((v466 & 1) == 0)
      {
        uint64_t v507 = objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v467, @"Prediction failed with the text Encoder", (uint64_t)v551, v469);

        v547[2](v547, 0, (id)v507);
        id v549 = (id)v507;
LABEL_171:

LABEL_172:
        goto LABEL_173;
      }
      objc_msgSend_getOutputFor_(v554->_textEncoder, v467, @"text_embed", v468, v469);
      id v553 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceNow(v537, v470, v471, v472, v473);
      unint64_t v475 = v474;
      v476 = sub_24C69662C();
      if (os_log_type_enabled(v476, OS_LOG_TYPE_INFO))
      {
        v589[0].n128_u32[0] = 134217984;
        *(unint64_t *)((char *)v589[0].n128_u64 + 4) = v475;
        _os_log_impl(&dword_24C664000, v476, OS_LOG_TYPE_INFO, "time to run full text n/w = %f", (uint8_t *)v589, 0xCu);
      }

      id v375 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      uint64_t v477 = (uint64_t)v548;
      v478 = v551;
      v384 = objc_msgSend_additionalLayerNames(v554->_configuration, v479, v480, v481, v482);
      for (unint64_t i = 0; i < objc_msgSend_count(v384, v483, v484, v485, v486); ++i)
      {
        v491 = objc_msgSend_objectAtIndexedSubscript_(v384, v488, i, v489, v490);
        v498 = objc_msgSend_getOutputFor_(v554->_textEncoder, v492, (uint64_t)v491, v493, v494);
        if (v498)
        {
          objc_msgSend_setObject_forKey_(v375, v495, (uint64_t)v498, (uint64_t)v491, v497);
        }
        else
        {
          v499 = objc_msgSend_stringWithFormat_(NSString, v495, @"Output for %@ is nil", v496, v497, v491);
          uint64_t v502 = objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v500, (uint64_t)v499, 0, v501);

          v478 = (void *)v502;
        }

        uint64_t v477 = (uint64_t)v548;
      }
      id v549 = v478;
      v508 = [CSUTextEncoderE5MLNetworkOutput alloc];
      v393 = objc_msgSend_initWithTextEmbedding_tokenSegments_(v508, v509, (uint64_t)v553, (uint64_t)v554->_tokenSegments, v510);
      objc_msgSend_setAdditionalLayers_(v393, v511, (uint64_t)v375, v512, v513);
      objc_msgSend_setProcessedInput_(v393, v514, v477, v515, v516);
      objc_msgSend_setTruncatedInput_(v393, v517, v538 & 1, v518, v519);
      objc_msgSend_timeIntervalSinceNow(v543, v520, v521, v522, v523);
      unint64_t v525 = v524;
      v526 = sub_24C69662C();
      if (os_log_type_enabled(v526, OS_LOG_TYPE_INFO))
      {
        v589[0].n128_u32[0] = 134217984;
        *(unint64_t *)((char *)v589[0].n128_u64 + 4) = v525;
        _os_log_impl(&dword_24C664000, v526, OS_LOG_TYPE_INFO, "time to run text encoding = %f", (uint8_t *)v589, 0xCu);
      }

      ((void (**)(id, void *, id))v547)[2](v547, v393, v478);
    }

    goto LABEL_171;
  }
  char v538 = 0;
  uint64_t v555 = *(void *)v575;
  v548 = &stru_26FEDE788;
  unint64_t v552 = 1;
LABEL_17:
  uint64_t v60 = 0;
  while (1)
  {
    if (*(void *)v575 != v555) {
      objc_enumerationMutation(obj);
    }
    id v61 = *(id *)(*((void *)&v574 + 1) + 8 * v60);
    if (v552 >= objc_msgSend_maximumSequenceLength(v57->_configuration, v62, v63, v64, v65) - 1)
    {
      objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v66, @"Input length longer than maximum allowed sequence length - truncated input", v67, v68);
      id v96 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_logInternalError_(CSUError, v197, (uint64_t)v96, v198, v199);
LABEL_84:

      char v538 = 1;
      goto LABEL_85;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v96 = v61;
        v101 = objc_msgSend_tokenID(v96, v97, v98, v99, v100);
        int v106 = objc_msgSend_unsignedIntValue(v101, v102, v103, v104, v105);
        memset(v589, 0, 24);
        v107 = operator new(4uLL);
        v589[0].n128_u64[0] = (unint64_t)v107;
        _DWORD *v107 = v106;
        v589[0].n128_u64[1] = (unint64_t)(v107 + 1);
        v589[1].n128_u64[0] = (unint64_t)(v107 + 1);
        v108 = (__n128 *)*((void *)&buf + 1);
        if (*((void *)&buf + 1) >= v591)
        {
          *((void *)&buf + 1) = sub_24C67D078((char **)&buf, (uint64_t)v589);
          if (v589[0].n128_u64[0])
          {
            v589[0].n128_u64[1] = v589[0].n128_u64[0];
            operator delete((void *)v589[0].n128_u64[0]);
          }
        }
        else
        {
          **((void **)&buf + 1) = 0;
          v108->n128_u64[1] = 0;
          v108[1].n128_u64[0] = 0;
          __n128 *v108 = v589[0];
          v108[1].n128_u64[0] = v589[1].n128_u64[0];
          memset(v589, 0, 24);
          *((void *)&buf + 1) = (char *)v108 + 24;
        }

        uint64_t v165 = *(void *)(*((void *)&buf + 1) - 24);
        uint64_t v164 = *(void *)(*((void *)&buf + 1) - 16);
        v166 = NSString;
        v171 = objc_msgSend_tokenID(v96, v167, v168, v169, v170);
        uint64_t v175 = objc_msgSend_stringWithFormat_(v166, v172, @"%@<token_id_input>%@", v173, v174, v548, v171);

        v552 += (v164 - v165) >> 2;
        v548 = (__CFString *)v175;
      }
      else
      {
        objc_msgSend_embedding(v61, v92, v93, v94, v95);
        id v96 = (id)objc_claimAutoreleasedReturnValue();
        v113 = objc_msgSend_shape(v96, v109, v110, v111, v112);
        v117 = objc_msgSend_objectAtIndex_(v113, v114, 0, v115, v116);
        unint64_t v122 = objc_msgSend_unsignedLongValue(v117, v118, v119, v120, v121);

        unint64_t v131 = v122 + v552;
        if (v122 + v552 > objc_msgSend_maximumSequenceLength(v554->_configuration, v123, v124, v125, v126) - 1)
        {
          v503 = objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v127, @"Input length longer than maximum allowed sequence length - truncated input", v129, v130);
          objc_msgSend_logInternalError_(CSUError, v504, (uint64_t)v503, v505, v506);

          goto LABEL_84;
        }
        memset(v589, 0, 24);
        if (v122)
        {
          if (v122 >> 62) {
            sub_24C667470();
          }
          size_t v132 = 4 * v122;
          v133 = operator new(4 * v122);
          unint64_t v134 = (unint64_t)v133 + 4 * v122;
          v589[0].n128_u64[0] = (unint64_t)v133;
          v589[1].n128_u64[0] = v134;
          bzero(v133, v132);
          v589[0].n128_u64[1] = v134;
        }
        v135 = (void *)*((void *)&buf + 1);
        if (*((void *)&buf + 1) >= v591)
        {
          v140 = sub_24C67CE68((char **)&buf, (uint64_t)v589);
        }
        else
        {
          **((void **)&buf + 1) = 0;
          v135[1] = 0;
          v135[2] = 0;
          v136 = (const void *)v589[0].n128_u64[0];
          int64_t v137 = v589[0].n128_u64[1] - v589[0].n128_u64[0];
          if (v589[0].n128_u64[1] != v589[0].n128_u64[0])
          {
            if (v137 < 0) {
              sub_24C667470();
            }
            v138 = (char *)operator new(v589[0].n128_u64[1] - v589[0].n128_u64[0]);
            void *v135 = v138;
            v135[1] = v138;
            v139 = &v138[4 * (v137 >> 2)];
            v135[2] = v139;
            memcpy(v138, v136, v137);
            v135[1] = v139;
          }
          v140 = (char *)(v135 + 3);
        }
        *((void *)&buf + 1) = v140;
        uint64_t v176 = objc_msgSend_embedding(v61, v127, v128, v129, v130);
        *(void *)&long long v586 = v552;
        *((void *)&v586 + 1) = v176;
        v177 = v579;
        if ((unint64_t)v579 >= v580)
        {
          v178 = sub_24C6883D0(&v578, (uint64_t *)&v586);
        }
        else
        {
          unint64_t *v579 = v552;
          *((void *)&v586 + 1) = 0;
          v178 = v177 + 2;
          v177[1] = v176;
        }
        v579 = v178;

        uint64_t v182 = objc_msgSend_stringWithFormat_(NSString, v179, @"%@<custom_embedding_input>", v180, v181, v548);

        if (v589[0].n128_u64[0])
        {
          v589[0].n128_u64[1] = v589[0].n128_u64[0];
          operator delete((void *)v589[0].n128_u64[0]);
        }
        unint64_t v552 = v131;
        v548 = (__CFString *)v182;
      }

      goto LABEL_74;
    }
    id v69 = v61;
    uint64_t v74 = objc_msgSend_date(MEMORY[0x263EFF910], v70, v71, v72, v73);
    v79 = objc_msgSend_string(v69, v75, v76, v77, v78);
    id v573 = v44;
    objc_msgSend_getTokensOnText_withBOS_withEOS_withError_(v57, v80, (uint64_t)v79, 0, 0, &v573);
    id v549 = v573;

    objc_msgSend_timeIntervalSinceNow(v74, v81, v82, v83, v84);
    uint64_t v86 = v85;
    v87 = sub_24C69662C();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
    {
      LODWORD(v586) = 134217984;
      *(void *)((char *)&v586 + 4) = v86;
      _os_log_impl(&dword_24C664000, v87, OS_LOG_TYPE_INFO, "time for getTokensOnText = %f", (uint8_t *)&v586, 0xCu);
    }

    if (v549)
    {
      ((void (*)(void (**)(id, void, id), void))v547[2])(v547, 0);
      int v91 = 1;
      goto LABEL_70;
    }
    uint64_t v141 = objc_msgSend_maximumSequenceLength(v554->_configuration, v88, 0, v89, v90);
    v146 = (const void *)v589[0].n128_u64[0];
    unint64_t v147 = (uint64_t)(v589[0].n128_u64[1] - v589[0].n128_u64[0]) >> 2;
    v587 = 0;
    uint64_t v148 = v141 + ~v552 >= v147 ? (uint64_t)(v589[0].n128_u64[1] - v589[0].n128_u64[0]) >> 2 : v141 + ~v552;
    long long v586 = 0uLL;
    if (v148)
    {
      if (v148 < 0) {
        sub_24C667470();
      }
      size_t v149 = 4 * v148;
      v150 = (char *)operator new(4 * v148);
      *(void *)&long long v586 = v150;
      *((void *)&v586 + 1) = v150;
      v151 = &v150[4 * v148];
      v587 = v151;
      memmove(v150, v146, v149);
      *((void *)&v586 + 1) = v151;
      if (v147 == (v151 - v150) >> 2)
      {
LABEL_44:
        v152 = NSString;
        v153 = objc_msgSend_string(v69, v142, v143, v144, v145);
        uint64_t v157 = objc_msgSend_stringWithFormat_(v152, v154, @"%@<text_input>%@", v155, v156, v548, v153);

        v548 = (__CFString *)v157;
        v158 = (void *)*((void *)&buf + 1);
        if (*((void *)&buf + 1) < v591)
        {
LABEL_45:
          void *v158 = 0;
          v158[1] = 0;
          v158[2] = 0;
          v159 = (const void *)v586;
          int64_t v160 = *((void *)&v586 + 1) - v586;
          if (*((void *)&v586 + 1) != (void)v586)
          {
            if (v160 < 0) {
              sub_24C667470();
            }
            v161 = (char *)operator new(*((void *)&v586 + 1) - v586);
            void *v158 = v161;
            v158[1] = v161;
            v162 = &v161[4 * (v160 >> 2)];
            v158[2] = v162;
            memcpy(v161, v159, v160);
            v158[1] = v162;
          }
          v163 = (char *)(v158 + 3);
LABEL_68:
          int v91 = 0;
          *((void *)&buf + 1) = v163;
          unint64_t v194 = v552 + ((uint64_t)(*((void *)v163 - 2) - *((void *)v163 - 3)) >> 2);
          v187 = (void *)v586;
          unint64_t v552 = v194;
          if (!(void)v586) {
            goto LABEL_70;
          }
LABEL_69:
          *((void *)&v586 + 1) = v187;
          operator delete(v187);
          goto LABEL_70;
        }
LABEL_67:
        v163 = sub_24C67CE68((char **)&buf, (uint64_t)&v586);
        goto LABEL_68;
      }
    }
    else if (!v147)
    {
      goto LABEL_44;
    }
    v183 = objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v142, @"Input length longer than maximum allowed sequence length - truncated input", v144, v145);
    objc_msgSend_logInternalError_(CSUError, v184, (uint64_t)v183, v185, v186);

    v187 = (void *)v586;
    if ((void)v586 != *((void *)&v586 + 1))
    {
      v188 = NSString;
      (*(void (**)(void **__return_ptr))(*(void *)v554->_vocabulary.__ptr_.__value_ + 24))(__p);
      v192 = __p;
      if (v572 < 0) {
        v192 = (void **)__p[0];
      }
      uint64_t v193 = objc_msgSend_stringWithFormat_(v188, v189, @"%@<text_input>%s", v190, v191, v548, v192);

      if (v572 < 0) {
        operator delete(__p[0]);
      }
      char v538 = 1;
      v548 = (__CFString *)v193;
      v158 = (void *)*((void *)&buf + 1);
      if (*((void *)&buf + 1) < v591) {
        goto LABEL_45;
      }
      goto LABEL_67;
    }
    int v91 = 2;
    char v538 = 1;
    if ((void)v586) {
      goto LABEL_69;
    }
LABEL_70:
    if (v589[0].n128_u64[0])
    {
      v589[0].n128_u64[1] = v589[0].n128_u64[0];
      operator delete((void *)v589[0].n128_u64[0]);
    }

    if (v91) {
      break;
    }
    id v44 = v549;
LABEL_74:

    ++v60;
    v57 = v554;
    if (v59 == v60)
    {
      uint64_t v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v195, (uint64_t)&v574, (uint64_t)v588, 16);
      uint64_t v59 = v196;
      if (!v196) {
        goto LABEL_85;
      }
      goto LABEL_17;
    }
  }

  if (v91 == 2) {
    goto LABEL_86;
  }
LABEL_174:

  v527 = (unint64_t *)v578;
  id v42 = v549;
  if (v578)
  {
    v528 = v579;
    v529 = v578;
    if (v579 != v578)
    {
      do
      {

        v528 -= 2;
      }
      while (v528 != v527);
      v529 = v578;
      id v42 = v549;
    }
    v579 = v527;
    operator delete(v529);
  }
  uint64_t v530 = buf;
  if ((void)buf)
  {
    uint64_t v531 = *((void *)&buf + 1);
    v532 = (void *)buf;
    if (*((void *)&buf + 1) != (void)buf)
    {
      uint64_t v533 = *((void *)&buf + 1);
      do
      {
        v535 = *(void **)(v533 - 24);
        v533 -= 24;
        v534 = v535;
        if (v535)
        {
          *(void *)(v531 - 16) = v534;
          operator delete(v534);
        }
        uint64_t v531 = v533;
      }
      while (v533 != v530);
      v532 = (void *)buf;
    }
    *((void *)&buf + 1) = v530;
    operator delete(v532);
  }
  uint64_t v38 = v546;
LABEL_188:
}

- (void)_unsafeRunOnInputText:(id)a3 completion:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  objc_msgSend_setString_(v8, v9, (uint64_t)v17, v10, v11);
  objc_msgSend_addObject_(v7, v12, (uint64_t)v8, v13, v14);
  objc_msgSend_runOnInput_completion_(self, v15, (uint64_t)v7, (uint64_t)v6, v16);
}

- (void)runOnInput:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend__unsafeRunOnInput_completion_(self, v8, (uint64_t)v6, (uint64_t)v7, v9);
}

- (void)runOnInputText:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend__unsafeRunOnInputText_completion_(self, v8, (uint64_t)v6, (uint64_t)v7, v9);
}

- (CSUTextEncoderE5MLConfiguration)configuration
{
  return self->_configuration;
}

- (NSDictionary)additionalLayers
{
  return self->_additionalLayers;
}

- (void)setAdditionalLayers:(id)a3
{
}

- (NSArray)tokenSegments
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTokenSegments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenSegments, 0);
  objc_storeStrong((id *)&self->_additionalLayers, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_assetVersionNumber, 0);
  value = self->_vocabulary.__ptr_.__value_;
  self->_vocabulary.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(SentencePieceVocabulary *))(*(void *)value + 8))(value);
  }
  objc_storeStrong((id *)&self->_textEncoder, 0);
  objc_storeStrong((id *)&self->_tokenEmbedder, 0);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  return self;
}

@end