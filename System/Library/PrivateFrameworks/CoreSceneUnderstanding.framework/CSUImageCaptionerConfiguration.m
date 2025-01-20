@interface CSUImageCaptionerConfiguration
+ (id)CSUImageCaptionerConfigurationForRevision:(int64_t)a3 error:(id *)a4;
+ (id)availableRevisions;
+ (id)createCSUImageCaptionerConfigurationWithConfigPath:(id)a3 error:(id *)a4;
+ (id)createCSUImageCaptionerConfigurationWithEncoderConfiguration:(id)a3 DecoderConfiguration:(id)a4 error:(id *)a5;
+ (int64_t)_resolvedRevision:(int64_t)a3;
- (CSUImageCaptionerConfiguration)initWithCaptioningEncoderConfiguration:(id)a3 captioningDecoderConfiguration:(id)a4;
- (CSUImageCaptioningDecoderConfiguration)captioningDecoderConfiguration;
- (CSUImageCaptioningEncoderConfiguration)captioningEncoderConfiguration;
- (int64_t)revision;
@end

@implementation CSUImageCaptionerConfiguration

+ (int64_t)_resolvedRevision:(int64_t)a3
{
  if (a3 == -1) {
    return 1;
  }
  else {
    return a3;
  }
}

+ (id)availableRevisions
{
  id v2 = objc_alloc_init(MEMORY[0x263F089C8]);
  objc_msgSend_addIndex_(v2, v3, 1, v4, v5);
  objc_msgSend_addIndex_(v2, v6, 6, v7, v8);
  objc_msgSend_addIndex_(v2, v9, 7, v10, v11);
  objc_msgSend_addIndex_(v2, v12, 8, v13, v14);
  return v2;
}

+ (id)CSUImageCaptionerConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  uint64_t v8 = objc_msgSend__resolvedRevision_(CSUImageCaptionerConfiguration, a2, a3, (uint64_t)a4, v4);
  char v11 = 0;
  switch(v8)
  {
    case 1:
      goto LABEL_9;
    case 4:
      char v11 = 1;
      objc_msgSend_CSUImageCaptioningDecoderConfigurationForRevision_error_(CSUImageCaptioningDecoderConfiguration, v7, 5, (uint64_t)a4, v10);
      goto LABEL_10;
    case 5:
      char v11 = 1;
      objc_msgSend_CSUImageCaptioningDecoderConfigurationForRevision_error_(CSUImageCaptioningDecoderConfiguration, v7, 7, (uint64_t)a4, v10);
      goto LABEL_10;
    case 6:
      char v11 = 1;
      objc_msgSend_CSUImageCaptioningDecoderConfigurationForRevision_error_(CSUImageCaptioningDecoderConfiguration, v7, 8, (uint64_t)a4, v10);
      goto LABEL_10;
    case 7:
      char v11 = 1;
      objc_msgSend_CSUImageCaptioningDecoderConfigurationForRevision_error_(CSUImageCaptioningDecoderConfiguration, v7, 9, (uint64_t)a4, v10);
      goto LABEL_10;
    case 8:
      char v11 = 1;
      uint64_t v8 = 10;
LABEL_9:
      objc_msgSend_CSUImageCaptioningDecoderConfigurationForRevision_error_(CSUImageCaptioningDecoderConfiguration, v7, v8, (uint64_t)a4, v10);
      uint64_t v13 = LABEL_10:;
      if (!v13)
      {
        v21 = 0;
        goto LABEL_18;
      }
      if (v11)
      {
        v24 = [CSUImageCaptionerConfiguration alloc];
        v21 = objc_msgSend_initWithCaptioningEncoderConfiguration_captioningDecoderConfiguration_(v24, v25, 0, (uint64_t)v13, v26);
        goto LABEL_18;
      }
      v17 = objc_msgSend_CSUImageCaptioningEncoderConfigurationForRevision_error_(CSUImageCaptioningEncoderConfiguration, v22, 1, (uint64_t)a4, v23);
      if (v17)
      {
        v27 = [CSUImageCaptionerConfiguration alloc];
        v21 = objc_msgSend_initWithCaptioningEncoderConfiguration_captioningDecoderConfiguration_(v27, v28, (uint64_t)v17, (uint64_t)v13, v29);
      }
      else
      {
        v21 = 0;
      }
      goto LABEL_17;
    default:
      if (a4)
      {
        v12 = NSString;
        uint64_t v13 = objc_msgSend_numberWithInteger_(NSNumber, v7, a3, v9, v10);
        v17 = objc_msgSend_stringWithFormat_(v12, v14, @"Unsupported Image captioning revision %@", v15, v16, v13);
        objc_msgSend_errorForUnsupportedRevision_(CSUError, v18, (uint64_t)v17, v19, v20);
        v21 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

LABEL_18:
      }
      else
      {
        v21 = 0;
      }
      return v21;
  }
}

+ (id)createCSUImageCaptionerConfigurationWithConfigPath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  *a4 = 0;
  uint64_t v10 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v6, v7, v8, v9);
  uint64_t v14 = objc_msgSend_fileExistsAtPath_(v10, v11, (uint64_t)v5, v12, v13);
  v18 = objc_msgSend_stringWithFormat_(NSString, v15, @"Config file does not exist at path %@", v16, v17, v5);
  char v20 = objc_msgSend_CSUAssert_logError_withMessage_(CSUError, v19, v14, (uint64_t)a4, (uint64_t)v18);

  if ((v20 & 1) == 0)
  {
    v49 = 0;
    goto LABEL_12;
  }
  v24 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x263EFF8F8], v21, (uint64_t)v5, v22, v23);
  v28 = objc_msgSend_stringWithFormat_(NSString, v25, @"Config path %@ could not be read!", v26, v27, v5);
  char v30 = objc_msgSend_CSUAssert_logError_withMessage_(CSUError, v29, v24 != 0, (uint64_t)a4, (uint64_t)v28);

  if (v30)
  {
    v32 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x263F08900], v31, (uint64_t)v24, 0, (uint64_t)a4);
    id v33 = *a4;
    v37 = objc_msgSend_stringWithFormat_(NSString, v34, @"Config path %@ could not be read!", v35, v36, v5);
    char v39 = objc_msgSend_CSUAssert_logError_withMessage_(CSUError, v38, v33 == 0, (uint64_t)a4, (uint64_t)v37);

    if (v39)
    {
      v44 = objc_msgSend_createCSUImageCaptioningDecoderConfigurationWithConfigPath_error_(CSUImageCaptioningDecoderConfiguration, v40, (uint64_t)v5, (uint64_t)a4, v41);
      if (v44)
      {
        v45 = objc_msgSend_createCSUImageCaptioningEncoderConfigurationWithConfigPath_error_(CSUImageCaptioningEncoderConfiguration, v42, (uint64_t)v5, (uint64_t)a4, v43);
        v46 = [CSUImageCaptionerConfiguration alloc];
        v49 = objc_msgSend_initWithCaptioningEncoderConfiguration_captioningDecoderConfiguration_(v46, v47, (uint64_t)v45, (uint64_t)v44, v48);
      }
      else
      {
        v49 = 0;
      }

      goto LABEL_11;
    }
  }
  else
  {
    v32 = 0;
  }
  v49 = 0;
LABEL_11:

LABEL_12:
  return v49;
}

+ (id)createCSUImageCaptionerConfigurationWithEncoderConfiguration:(id)a3 DecoderConfiguration:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [CSUImageCaptionerConfiguration alloc];
  char v11 = objc_msgSend_initWithCaptioningEncoderConfiguration_captioningDecoderConfiguration_(v8, v9, (uint64_t)v6, (uint64_t)v7, v10);

  return v11;
}

- (CSUImageCaptionerConfiguration)initWithCaptioningEncoderConfiguration:(id)a3 captioningDecoderConfiguration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CSUImageCaptionerConfiguration;
  uint64_t v9 = [(CSUImageCaptionerConfiguration *)&v13 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_captioningEncoderConfiguration, a3);
    objc_storeStrong((id *)&v10->_captioningDecoderConfiguration, a4);
    char v11 = v10;
  }

  return v10;
}

- (CSUImageCaptioningEncoderConfiguration)captioningEncoderConfiguration
{
  return self->_captioningEncoderConfiguration;
}

- (CSUImageCaptioningDecoderConfiguration)captioningDecoderConfiguration
{
  return self->_captioningDecoderConfiguration;
}

- (int64_t)revision
{
  return self->_revision;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captioningDecoderConfiguration, 0);
  objc_storeStrong((id *)&self->_captioningEncoderConfiguration, 0);
}

@end