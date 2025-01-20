@interface CSUVideoCaptionerConfiguration
+ (id)CSUVideoCaptionerConfigurationForRevision:(int64_t)a3 error:(id *)a4;
+ (id)CSUVideoCaptioningConfigurationWithConfigPath:(id)a3 error:(id *)a4;
+ (id)availableRevisions;
- (BOOL)saveDecoderFeatures;
- (CSUBeamSearchConfiguration)beamSearch;
- (CSUVideoCaptionerConfiguration)initWithConfigPath:(id)a3;
- (MLComputeDeviceProtocol)espressoDevice;
- (NSString)configPath;
- (void)setBeamSearch:(id)a3;
- (void)setConfigPath:(id)a3;
- (void)setEspressoDevice:(id)a3;
- (void)setSaveDecoderFeatures:(BOOL)a3;
@end

@implementation CSUVideoCaptionerConfiguration

- (CSUVideoCaptionerConfiguration)initWithConfigPath:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSUVideoCaptionerConfiguration;
  v6 = [(CSUVideoCaptionerConfiguration *)&v12 init];
  v7 = v6;
  if (v6)
  {
    espressoDevice = v6->_espressoDevice;
    v6->_espressoDevice = 0;

    v9 = objc_alloc_init(CSUBeamSearchConfiguration);
    beamSearch = v7->_beamSearch;
    v7->_beamSearch = v9;

    objc_storeStrong((id *)&v7->_configPath, a3);
  }

  return v7;
}

+ (id)CSUVideoCaptionerConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  if (a3 == 5 || a3 == -1)
  {
    v6 = (void *)MEMORY[0x263F086E0];
    uint64_t v7 = objc_opt_class();
    v11 = objc_msgSend_bundleForClass_(v6, v8, v7, v9, v10);
    v14 = objc_msgSend_pathForResource_ofType_(v11, v12, @"video_captioning", (uint64_t)&stru_26FEDE788, v13);
    v18 = objc_msgSend_stringByAppendingPathComponent_(v14, v15, @"VideoCaptioning_v5.0.0_66jtuk6hs5-87200", v16, v17);
    v22 = objc_msgSend_stringByAppendingPathComponent_(v18, v19, @"VideoCaptioning.config.json", v20, v21);
    v25 = objc_msgSend_CSUVideoCaptioningConfigurationWithConfigPath_error_(CSUVideoCaptionerConfiguration, v23, (uint64_t)v22, (uint64_t)a4, v24);

LABEL_6:
    goto LABEL_7;
  }
  if (a4)
  {
    v26 = NSString;
    v11 = objc_msgSend_numberWithInteger_(NSNumber, a2, a3, (uint64_t)a4, v4);
    v14 = objc_msgSend_stringWithFormat_(v26, v27, @"Unsupported CSUVideoCaptionerConfigurationRevision %@", v28, v29, v11);
    objc_msgSend_errorForUnsupportedRevision_(CSUError, v30, (uint64_t)v14, v31, v32);
    v25 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v25 = 0;
LABEL_7:
  return v25;
}

+ (id)CSUVideoCaptioningConfigurationWithConfigPath:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = [CSUVideoCaptionerConfiguration alloc];
  uint64_t v9 = objc_msgSend_initWithConfigPath_(v5, v6, (uint64_t)v4, v7, v8);

  return v9;
}

+ (id)availableRevisions
{
  id v2 = objc_alloc_init(MEMORY[0x263F089C8]);
  objc_msgSend_addIndex_(v2, v3, 5, v4, v5);
  return v2;
}

- (MLComputeDeviceProtocol)espressoDevice
{
  return self->_espressoDevice;
}

- (void)setEspressoDevice:(id)a3
{
}

- (CSUBeamSearchConfiguration)beamSearch
{
  return self->_beamSearch;
}

- (void)setBeamSearch:(id)a3
{
}

- (NSString)configPath
{
  return self->_configPath;
}

- (void)setConfigPath:(id)a3
{
}

- (BOOL)saveDecoderFeatures
{
  return self->_saveDecoderFeatures;
}

- (void)setSaveDecoderFeatures:(BOOL)a3
{
  self->_saveDecoderFeatures = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configPath, 0);
  objc_storeStrong((id *)&self->_beamSearch, 0);
  objc_storeStrong((id *)&self->_espressoDevice, 0);
}

@end