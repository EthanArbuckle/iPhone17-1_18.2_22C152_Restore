@interface CSUTextEncoderConfiguration
+ (id)availableContextLengthsForRevision:(int64_t)a3;
+ (id)availableRevisions;
+ (id)createForRevision:(int64_t)a3 error:(id *)a4;
+ (id)defaultContextLengthForRevision:(int64_t)a3;
- (CSUSystemSearchTextEncoderV1Configuration)systemSearchTextEncoderConfig;
- (CSUTextEncoderE5MLConfiguration)textEncoderE5MLConfig;
- (NSArray)additionalLayerNames;
- (NSArray)availableContextLengths;
- (id)initSystemSearchTextEncoderV1:(id)a3 forRevision:(int64_t)a4;
- (id)initTextEncoderE5ML:(id)a3 forRevision:(int64_t)a4;
- (int64_t)revision;
- (unint64_t)contextLength;
- (unint64_t)tokenEmbeddingLength;
- (void)setAdditionalLayerNames:(id)a3;
- (void)setAvailableContextLengths:(id)a3;
- (void)setContextLength:(unint64_t)a3;
- (void)setSystemSearchTextEncoderConfig:(id)a3;
- (void)setTextEncoderE5MLConfig:(id)a3;
@end

@implementation CSUTextEncoderConfiguration

+ (id)availableRevisions
{
  id v2 = objc_alloc_init(MEMORY[0x263F089C8]);
  objc_msgSend_addIndex_(v2, v3, 7, v4, v5);
  objc_msgSend_addIndex_(v2, v6, 2, v7, v8);
  objc_msgSend_addIndex_(v2, v9, 8, v10, v11);
  objc_msgSend_addIndex_(v2, v12, 9, v13, v14);
  return v2;
}

+ (id)availableContextLengthsForRevision:(int64_t)a3
{
  if ((unint64_t)(a3 - 6) > 3) {
    return 0;
  }
  else {
    return (id)qword_2652E7F08[a3 - 6];
  }
}

+ (id)defaultContextLengthForRevision:(int64_t)a3
{
  if ((unint64_t)(a3 - 6) >= 4) {
    return 0;
  }
  else {
    return &unk_26FEEA200;
  }
}

+ (id)createForRevision:(int64_t)a3 error:(id *)a4
{
  *a4 = 0;
  if ((unint64_t)(a3 - 6) < 2)
  {
    uint64_t v11 = objc_msgSend_TextEncoderE5MLConfigurationForRevision_error_(CSUTextEncoderE5MLConfiguration, a2, 2, (uint64_t)a4, v4);
    id v12 = *a4;
    if (!*a4)
    {
      uint64_t v13 = [CSUTextEncoderConfiguration alloc];
      uint64_t inited = objc_msgSend_initTextEncoderE5ML_forRevision_(v13, v14, (uint64_t)v11, a3, v15);
      goto LABEL_13;
    }
  }
  else
  {
    if (a3 != 8)
    {
      uint64_t v7 = 0;
      if (a3 != 9) {
        goto LABEL_15;
      }
      uint64_t v11 = objc_msgSend_TextEncoderE5MLConfigurationForRevision_error_(CSUTextEncoderE5MLConfiguration, a2, 4, (uint64_t)a4, v4);
      id v12 = *a4;
      if (*a4) {
        goto LABEL_9;
      }
      v17 = [CSUTextEncoderConfiguration alloc];
      uint64_t inited = objc_msgSend_initTextEncoderE5ML_forRevision_(v17, v18, (uint64_t)v11, 9, v19);
LABEL_13:
      uint64_t v7 = (void *)inited;
      goto LABEL_14;
    }
    uint64_t v11 = objc_msgSend_TextEncoderE5MLConfigurationForRevision_error_(CSUTextEncoderE5MLConfiguration, a2, 5, (uint64_t)a4, v4);
    id v12 = *a4;
    if (!*a4)
    {
      v20 = [CSUTextEncoderConfiguration alloc];
      uint64_t inited = objc_msgSend_initTextEncoderE5ML_forRevision_(v20, v21, (uint64_t)v11, 8, v22);
      goto LABEL_13;
    }
  }
LABEL_9:
  objc_msgSend_logInternalError_(CSUError, v8, (uint64_t)v12, v9, v10);
  uint64_t v7 = 0;
LABEL_14:

LABEL_15:
  return v7;
}

- (id)initSystemSearchTextEncoderV1:(id)a3 forRevision:(int64_t)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CSUTextEncoderConfiguration;
  uint64_t v8 = [(CSUTextEncoderConfiguration *)&v17 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_revision = a4;
    objc_storeStrong((id *)&v8->_systemSearchTextEncoderConfig, a3);
    v9->_tokenEmbeddingLength = objc_msgSend_tokenEmbeddingLength(v9->_systemSearchTextEncoderConfig, v10, v11, v12, v13);
    textEncoderE5MLConfig = v9->_textEncoderE5MLConfig;
    v9->_textEncoderE5MLConfig = 0;

    uint64_t v15 = v9;
  }

  return v9;
}

- (id)initTextEncoderE5ML:(id)a3 forRevision:(int64_t)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CSUTextEncoderConfiguration;
  uint64_t v8 = [(CSUTextEncoderConfiguration *)&v17 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_revision = a4;
    objc_storeStrong((id *)&v8->_textEncoderE5MLConfig, a3);
    v9->_tokenEmbeddingLength = objc_msgSend_tokenEmbeddingLength(v9->_textEncoderE5MLConfig, v10, v11, v12, v13);
    systemSearchTextEncoderConfig = v9->_systemSearchTextEncoderConfig;
    v9->_systemSearchTextEncoderConfig = 0;

    uint64_t v15 = v9;
  }

  return v9;
}

- (void)setAdditionalLayerNames:(id)a3
{
  id v10 = a3;
  objc_storeStrong((id *)&self->_additionalLayerNames, a3);
  systemSearchTextEncoderConfig = self->_systemSearchTextEncoderConfig;
  if (systemSearchTextEncoderConfig) {
    objc_msgSend_setAdditionalLayerNames_(systemSearchTextEncoderConfig, v5, (uint64_t)v10, v6, v7);
  }
  textEncoderE5MLConfig = self->_textEncoderE5MLConfig;
  if (textEncoderE5MLConfig) {
    objc_msgSend_setAdditionalLayerNames_(textEncoderE5MLConfig, v5, (uint64_t)v10, v6, v7);
  }
}

- (void)setContextLength:(unint64_t)a3
{
  self->_unint64_t contextLength = a3;
  if (self->_systemSearchTextEncoderConfig)
  {
    uint64_t v5 = sub_24C69662C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_24C729DC0(v5);
    }
  }
  else
  {
    textEncoderE5MLConfig = self->_textEncoderE5MLConfig;
    if (textEncoderE5MLConfig)
    {
      objc_msgSend_setContextLength_(textEncoderE5MLConfig, a2, a3, v3, v4);
      unint64_t contextLength = self->_contextLength;
      if (contextLength == 512)
      {
        id v10 = sub_24C69662C();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)objc_super v17 = 0;
          _os_log_impl(&dword_24C664000, v10, OS_LOG_TYPE_INFO, "Setting e5Function to be used as main_ctx_512", v17, 2u);
        }

        objc_msgSend_setE5function_(self->_textEncoderE5MLConfig, v11, @"main_ctx_512", v12, v13);
      }
      else
      {
        if (contextLength == 77)
        {
          uint64_t v9 = sub_24C69662C();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_24C664000, v9, OS_LOG_TYPE_INFO, "Setting e5Function to be used as main_ctx_77", buf, 2u);
          }
        }
        else
        {
          uint64_t v9 = sub_24C69662C();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            sub_24C729D7C(v9);
          }
        }

        objc_msgSend_setE5function_(self->_textEncoderE5MLConfig, v14, @"main_ctx_77", v15, v16);
      }
    }
  }
}

- (int64_t)revision
{
  return self->_revision;
}

- (NSArray)additionalLayerNames
{
  return self->_additionalLayerNames;
}

- (unint64_t)tokenEmbeddingLength
{
  return self->_tokenEmbeddingLength;
}

- (NSArray)availableContextLengths
{
  return self->_availableContextLengths;
}

- (void)setAvailableContextLengths:(id)a3
{
}

- (unint64_t)contextLength
{
  return self->_contextLength;
}

- (CSUSystemSearchTextEncoderV1Configuration)systemSearchTextEncoderConfig
{
  return self->_systemSearchTextEncoderConfig;
}

- (void)setSystemSearchTextEncoderConfig:(id)a3
{
}

- (CSUTextEncoderE5MLConfiguration)textEncoderE5MLConfig
{
  return self->_textEncoderE5MLConfig;
}

- (void)setTextEncoderE5MLConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textEncoderE5MLConfig, 0);
  objc_storeStrong((id *)&self->_systemSearchTextEncoderConfig, 0);
  objc_storeStrong((id *)&self->_availableContextLengths, 0);
  objc_storeStrong((id *)&self->_additionalLayerNames, 0);
}

@end