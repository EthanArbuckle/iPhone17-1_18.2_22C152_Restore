@interface CSUVideoCaptioner
- (BOOL)loadResources:(id *)a3;
- (CSUImageCaptioningDecoder)imageCaptionDecoder;
- (CSUVideoCaptioner)initWithConfiguration:(id)a3 error:(id *)a4;
- (CSUVideoCaptionerConfiguration)config;
- (id)_initWithConfiguration:(id)a3 error:(id *)a4;
- (id)computeCaptionForVideoEmbedding:(id)a3 error:(id *)a4;
- (void)setImageCaptionDecoder:(id)a3;
@end

@implementation CSUVideoCaptioner

- (CSUVideoCaptioner)initWithConfiguration:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = sub_24C69662C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v12 = objc_msgSend_configPath(v6, v8, v9, v10, v11);
    *(_DWORD *)buf = 138412290;
    v22 = v12;
    _os_log_impl(&dword_24C664000, v7, OS_LOG_TYPE_INFO, "Begin CSUVideoCaptioner init configPath=%@", buf, 0xCu);
  }
  id v20 = 0;
  v15 = (CSUVideoCaptioner *)objc_msgSend__initWithConfiguration_error_(self, v13, (uint64_t)v6, (uint64_t)&v20, v14);
  id v16 = v20;
  if (v15)
  {
    v17 = sub_24C69662C();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24C664000, v17, OS_LOG_TYPE_INFO, "End CSUVideoCaptioner init", buf, 2u);
    }
  }
  else
  {
    v18 = sub_24C69662C();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_24C72A164((uint64_t)v16, v18);
    }

    if (a4) {
      *a4 = v16;
    }
  }

  return v15;
}

- (id)_initWithConfiguration:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v42.receiver = self;
  v42.super_class = (Class)CSUVideoCaptioner;
  v8 = [(CSUVideoCaptioner *)&v42 init];
  uint64_t v9 = v8;
  if (!v8) {
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v8->_config, a3);
  uint64_t v14 = objc_msgSend_configPath(v7, v10, v11, v12, v13);

  if (!v14)
  {
    if (a4)
    {
      objc_msgSend_errorForUnknownErrorWithLocalizedDescription_(CSUError, v15, @"CSUVideoCaptioner nil config path", v17, v18);
      v40 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
LABEL_12:
    v40 = 0;
    goto LABEL_13;
  }
  v19 = objc_msgSend_configPath(v7, v15, v16, v17, v18);
  v22 = objc_msgSend_createCSUImageCaptioningDecoderConfigurationWithConfigPath_error_(CSUImageCaptioningDecoderConfiguration, v20, (uint64_t)v19, (uint64_t)a4, v21);

  if (!v22)
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v27 = objc_msgSend_saveDecoderFeatures(v7, v23, v24, v25, v26);
  objc_msgSend_setSaveDecoderFeatures_(v22, v28, v27, v29, v30);
  v31 = [CSUImageCaptioningDecoder alloc];
  uint64_t v35 = objc_msgSend_initWithConfiguration_(v31, v32, (uint64_t)v22, v33, v34);
  imageCaptionDecoder = v9->_imageCaptionDecoder;
  v9->_imageCaptionDecoder = (CSUImageCaptioningDecoder *)v35;

  if (!v9->_imageCaptionDecoder)
  {
    if (a4)
    {
      objc_msgSend_errorForUnknownErrorWithLocalizedDescription_(CSUError, v37, @"Failed to init video decoder", v38, v39);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_11;
  }

LABEL_6:
  v40 = v9;
LABEL_13:

  return v40;
}

- (BOOL)loadResources:(id *)a3
{
  v5 = a3;
  id v6 = objc_msgSend_imageCaptionDecoder(self, a2, (uint64_t)a3, v3, v4);
  LOBYTE(v5) = objc_msgSend_loadResources_(v6, v7, (uint64_t)v5, v8, v9);

  return (char)v5;
}

- (id)computeCaptionForVideoEmbedding:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v11 = objc_msgSend_config(self, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_beamSearch(v11, v12, v13, v14, v15);
  uint64_t v21 = objc_msgSend_beamWidth(v16, v17, v18, v19, v20);
  int v26 = objc_msgSend_intValue(v21, v22, v23, v24, v25);

  v31 = objc_msgSend_imageCaptionDecoder(self, v27, v28, v29, v30);
  uint64_t v33 = objc_msgSend_computeDecodedCaptionsForFeatures_withDecodingMethod_error_(v31, v32, (uint64_t)v6, v26 != 1, (uint64_t)a4);

  return v33;
}

- (CSUVideoCaptionerConfiguration)config
{
  return self->_config;
}

- (CSUImageCaptioningDecoder)imageCaptionDecoder
{
  return self->_imageCaptionDecoder;
}

- (void)setImageCaptionDecoder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCaptionDecoder, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end