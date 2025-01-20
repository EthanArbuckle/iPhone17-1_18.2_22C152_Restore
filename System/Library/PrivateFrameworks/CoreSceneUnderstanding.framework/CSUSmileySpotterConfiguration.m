@interface CSUSmileySpotterConfiguration
+ (id)CSUSmileySpotterConfigurationForRevision:(int64_t)a3 error:(id *)a4;
+ (id)getConfigurationForCSUSmileySpotter_v1_0_EnglishWithError:(id *)a3;
+ (id)getConfigurationForCSUSmileySpotter_v2_0_EnglishWithError:(id *)a3;
+ (id)overrideWithSideLoadedPathForSmileySpotterModel:(id)a3;
- (BOOL)sideLoaded;
- (NSString)headModelPath;
- (NSURL)headModelURL;
- (float)threshold;
- (id)initCSUSmileySpotterConfigurationForRevision:(int64_t)a3 modelPath:(id)a4 threshold:(float)a5;
- (int64_t)revision;
- (void)setHeadModelPath:(id)a3;
- (void)setHeadModelURL:(id)a3;
- (void)setRevision:(int64_t)a3;
- (void)setSideLoaded:(BOOL)a3;
- (void)setThreshold:(float)a3;
@end

@implementation CSUSmileySpotterConfiguration

+ (id)getConfigurationForCSUSmileySpotter_v1_0_EnglishWithError:(id *)a3
{
  id v3 = objc_alloc((Class)a1);
  LODWORD(v4) = 1062836634;
  inited = objc_msgSend_initCSUSmileySpotterConfigurationForRevision_modelPath_threshold_(v3, v5, 1, @"md1_e5_smiley_spotter.mlmodelc", v6, v4);
  return inited;
}

+ (id)overrideWithSideLoadedPathForSmileySpotterModel:(id)a3
{
  id v3 = a3;
  v8 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v4, v5, v6, v7);
  v12 = objc_msgSend_stringByAppendingPathComponent_(@"private/var/mobile/Library/Application Support/com.apple.VisualGeneration/OVERRIDE", v9, (uint64_t)v3, v10, v11);
  if (objc_msgSend_fileExistsAtPath_(v8, v13, (uint64_t)v12, v14, v15))
  {
    v18 = objc_msgSend_fileURLWithPath_isDirectory_(NSURL, v16, @"private/var/mobile/Library/Application Support/com.apple.VisualGeneration/OVERRIDE", 1, v17);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)getConfigurationForCSUSmileySpotter_v2_0_EnglishWithError:(id *)a3
{
  id v3 = objc_alloc((Class)a1);
  LODWORD(v4) = 1062836634;
  inited = objc_msgSend_initCSUSmileySpotterConfigurationForRevision_modelPath_threshold_(v3, v5, 2, @"smileyspotter_v3.0_fjuxk2wg9j-59976md4_te-md4.mlmodelc", v6, v4);
  return inited;
}

+ (id)CSUSmileySpotterConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  if (a3 == 2)
  {
    uint64_t v6 = objc_msgSend_getConfigurationForCSUSmileySpotter_v2_0_EnglishWithError_(a1, a2, (uint64_t)a4, (uint64_t)a4, v4);
  }
  else if (a3 == 1)
  {
    uint64_t v6 = objc_msgSend_getConfigurationForCSUSmileySpotter_v1_0_EnglishWithError_(a1, a2, (uint64_t)a4, (uint64_t)a4, v4);
  }
  else
  {
    if (a4)
    {
      v8 = NSString;
      v9 = objc_msgSend_numberWithInteger_(NSNumber, a2, a3, (uint64_t)a4, v4);
      v13 = objc_msgSend_stringWithFormat_(v8, v10, @"Unsupported CSUSmileySpotter revision %@", v11, v12, v9);
      objc_msgSend_errorForUnsupportedRevision_(CSUError, v14, (uint64_t)v13, v15, v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v6 = 0;
  }
  return v6;
}

- (id)initCSUSmileySpotterConfigurationForRevision:(int64_t)a3 modelPath:(id)a4 threshold:(float)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a4;
  objc_storeStrong((id *)&self->_headModelPath, a4);
  uint64_t v10 = objc_opt_class();
  objc_msgSend_overrideWithSideLoadedPathForSmileySpotterModel_(v10, v11, (uint64_t)v9, v12, v13);
  uint64_t v14 = (NSURL *)objc_claimAutoreleasedReturnValue();
  headModelURL = self->_headModelURL;
  self->_headModelURL = v14;

  self->_sideLoaded = 0;
  if (self->_headModelURL)
  {
    uint64_t v16 = sub_24C69662C();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v21 = objc_msgSend_absoluteString(self->_headModelURL, v17, v18, v19, v20);
      int v23 = 138412290;
      v24 = v21;
      _os_log_impl(&dword_24C664000, v16, OS_LOG_TYPE_INFO, "Models side loaded from %@", (uint8_t *)&v23, 0xCu);
    }
    self->_sideLoaded = 1;
  }
  self->_revision = a3;
  self->_threshold = a5;

  return self;
}

- (NSString)headModelPath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setHeadModelPath:(id)a3
{
}

- (int64_t)revision
{
  return self->_revision;
}

- (void)setRevision:(int64_t)a3
{
  self->_revision = a3;
}

- (float)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(float)a3
{
  self->_threshold = a3;
}

- (NSURL)headModelURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHeadModelURL:(id)a3
{
}

- (BOOL)sideLoaded
{
  return self->_sideLoaded;
}

- (void)setSideLoaded:(BOOL)a3
{
  self->_sideLoaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headModelURL, 0);
  objc_storeStrong((id *)&self->_headModelPath, 0);
}

@end