@interface CSUImageCaptioner
- (BOOL)loadResources:(id *)a3;
- (BOOL)resampleImage:(__CVBuffer *)a3 intoInputImage:(__CVBuffer *)a4 error:(id *)a5;
- (CSUImageCaptioner)initWithConfiguration:(id)a3;
- (CSUImageCaptionerConfiguration)configuration;
- (CSUImageCaptioningDecoder)decoder;
- (CSUImageCaptioningEncoder)encoder;
- (id)computeCaptionForCSUBufferEmbedding:(id)a3 withDecodingMethod:(int64_t)a4 error:(id *)a5;
- (id)computeCaptionForEmbedding:(id)a3 withDecodingMethod:(int64_t)a4 error:(id *)a5;
- (id)computeCaptionForImage:(__CVBuffer *)a3 withDecodingMethod:(int64_t)a4 error:(id *)a5;
- (void)setDecoder:(id)a3;
- (void)setEncoder:(id)a3;
@end

@implementation CSUImageCaptioner

- (CSUImageCaptioner)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CSUImageCaptioner;
  v6 = [(CSUImageCaptioner *)&v38 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    encoder = v7->_encoder;
    v7->_encoder = 0;

    v13 = objc_msgSend_captioningEncoderConfiguration(v7->_configuration, v9, v10, v11, v12);

    if (v13)
    {
      v14 = [CSUImageCaptioningEncoder alloc];
      v19 = objc_msgSend_captioningEncoderConfiguration(v5, v15, v16, v17, v18);
      uint64_t v23 = objc_msgSend_initWithConfiguration_(v14, v20, (uint64_t)v19, v21, v22);
      v24 = v7->_encoder;
      v7->_encoder = (CSUImageCaptioningEncoder *)v23;
    }
    v25 = [CSUImageCaptioningDecoder alloc];
    v30 = objc_msgSend_captioningDecoderConfiguration(v5, v26, v27, v28, v29);
    uint64_t v34 = objc_msgSend_initWithConfiguration_(v25, v31, (uint64_t)v30, v32, v33);
    decoder = v7->_decoder;
    v7->_decoder = (CSUImageCaptioningDecoder *)v34;

    v36 = v7;
  }

  return v7;
}

- (BOOL)loadResources:(id *)a3
{
  v7 = objc_msgSend_captioningEncoderConfiguration(self->_configuration, a2, (uint64_t)a3, v3, v4);

  if (!v7 || (int Resources = objc_msgSend_loadResources_(self->_encoder, v8, (uint64_t)a3, v9, v10)) != 0)
  {
    decoder = self->_decoder;
    LOBYTE(Resources) = objc_msgSend_loadResources_(decoder, v8, (uint64_t)a3, v9, v10);
  }
  return Resources;
}

- (BOOL)resampleImage:(__CVBuffer *)a3 intoInputImage:(__CVBuffer *)a4 error:(id *)a5
{
  return MEMORY[0x270F9A6D0](self->_encoder, sel_resampleImage_intoInputImage_error_, a3, a4, a5);
}

- (id)computeCaptionForImage:(__CVBuffer *)a3 withDecodingMethod:(int64_t)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v9 = sub_24C69662C();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  uint64_t v11 = sub_24C69662C();
  uint64_t v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v24[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_24C664000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CSUComputeCaptionForImage", "", (uint8_t *)v24, 2u);
  }

  v24[0] = &unk_26FEDBA78;
  v24[1] = v10;
  v25 = v24;
  uint64_t v16 = (void *)MEMORY[0x2532F8ED0]();
  encoder = self->_encoder;
  if (encoder)
  {
    v19 = objc_msgSend_computeEncodedCaptioningFeaturesForImage_error_(encoder, v13, (uint64_t)a3, (uint64_t)a5, v15);
    if (*a5)
    {
      id v20 = 0;
    }
    else
    {
      uint64_t v21 = objc_msgSend_computeDecodedCaptionsForFeaturesWithCSUBuffer_withDecodingMethod_error_(self->_decoder, v18, (uint64_t)v19, a4, (uint64_t)a5);
      uint64_t v22 = v21;
      if (*a5) {
        id v20 = 0;
      }
      else {
        id v20 = v21;
      }
    }
  }
  else
  {
    objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v13, @"Encoder not configured!", v14, v15);
    id v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!v25) {
    sub_24C66DAC0();
  }
  (*(void (**)(void *))(*v25 + 48))(v25);
  if (v25 == v24)
  {
    (*(void (**)(void *))(v24[0] + 32))(v24);
  }
  else if (v25)
  {
    (*(void (**)(void))(*v25 + 40))();
  }
  return v20;
}

- (id)computeCaptionForEmbedding:(id)a3 withDecodingMethod:(int64_t)a4 error:(id *)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = sub_24C69662C();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  uint64_t v11 = sub_24C69662C();
  uint64_t v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_24C664000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CSUComputeCaptionForEmbeddingNSData", "", buf, 2u);
  }

  *(void *)buf = &unk_26FEDBAD0;
  os_signpost_id_t v49 = v10;
  v50 = buf;
  uint64_t v14 = (void *)MEMORY[0x2532F8ED0]();
  if (v8)
  {
    decoder = self->_decoder;
    id v46 = 0;
    uint64_t v16 = objc_msgSend_computeDecodedCaptionsForFeatures_withDecodingMethod_error_(decoder, v13, (uint64_t)v8, a4, (uint64_t)&v46);
    uint64_t v17 = v46;
    if (!v16)
    {
      id v18 = [NSString alloc];
      uint64_t v23 = objc_msgSend_domain(v17, v19, v20, v21, v22);
      uint64_t v27 = objc_msgSend_initWithString_(v18, v24, (uint64_t)v23, v25, v26);

      uint64_t v32 = objc_msgSend_code(v17, v28, v29, v30, v31);
      id v33 = objc_alloc(NSDictionary);
      objc_super v38 = objc_msgSend_userInfo(v17, v34, v35, v36, v37);
      v42 = objc_msgSend_initWithDictionary_(v33, v39, (uint64_t)v38, v40, v41);

      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v17 = sub_24C69662C();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v47 = 0;
      _os_log_impl(&dword_24C664000, v17, OS_LOG_TYPE_INFO, "Input to computeCaptionForEmbedding is null", v47, 2u);
    }
    uint64_t v16 = 0;
  }
  uint64_t v32 = 0;
  v42 = 0;
  uint64_t v27 = 0;
LABEL_11:

  if (v8)
  {
    if (a5 && v27)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(CSUError, v43, (uint64_t)v27, v32, (uint64_t)v42);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v44 = v16;
  }
  else
  {
    id v44 = 0;
  }

  if (!v50) {
    sub_24C66DAC0();
  }
  (*(void (**)(uint8_t *))(*(void *)v50 + 48))(v50);
  if (v50 == buf)
  {
    (*(void (**)(uint8_t *))(*(void *)buf + 32))(buf);
  }
  else if (v50)
  {
    (*(void (**)(void))(*(void *)v50 + 40))();
  }

  return v44;
}

- (id)computeCaptionForCSUBufferEmbedding:(id)a3 withDecodingMethod:(int64_t)a4 error:(id *)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = sub_24C69662C();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  uint64_t v11 = sub_24C69662C();
  uint64_t v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v17[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_24C664000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CSUComputeCaptionForEmbeddingCSUBuffer", "", (uint8_t *)v17, 2u);
  }

  v17[0] = &unk_26FEDBB28;
  v17[1] = v10;
  id v18 = v17;
  v13 = (void *)MEMORY[0x2532F8ED0]();
  uint64_t v15 = objc_msgSend_computeDecodedCaptionsForFeaturesWithCSUBuffer_withDecodingMethod_error_(self->_decoder, v14, (uint64_t)v8, a4, (uint64_t)a5);
  if (!v18) {
    sub_24C66DAC0();
  }
  (*(void (**)(void *))(*v18 + 48))(v18);
  if (v18 == v17)
  {
    (*(void (**)(void *))(v17[0] + 32))(v17);
  }
  else if (v18)
  {
    (*(void (**)(void))(*v18 + 40))();
  }

  return v15;
}

- (CSUImageCaptionerConfiguration)configuration
{
  return self->_configuration;
}

- (CSUImageCaptioningEncoder)encoder
{
  return self->_encoder;
}

- (void)setEncoder:(id)a3
{
}

- (CSUImageCaptioningDecoder)decoder
{
  return self->_decoder;
}

- (void)setDecoder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decoder, 0);
  objc_storeStrong((id *)&self->_encoder, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end