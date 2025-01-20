@interface MTRCameraAVStreamManagementClusterAudioCapabilitiesStruct
- (MTRCameraAVStreamManagementClusterAudioCapabilitiesStruct)init;
- (NSArray)supportedBitDepths;
- (NSArray)supportedCodecs;
- (NSArray)supportedSampleRates;
- (NSNumber)maxNumberOfChannels;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setMaxNumberOfChannels:(id)a3;
- (void)setSupportedBitDepths:(id)a3;
- (void)setSupportedCodecs:(id)a3;
- (void)setSupportedSampleRates:(id)a3;
@end

@implementation MTRCameraAVStreamManagementClusterAudioCapabilitiesStruct

- (MTRCameraAVStreamManagementClusterAudioCapabilitiesStruct)init
{
  v18.receiver = self;
  v18.super_class = (Class)MTRCameraAVStreamManagementClusterAudioCapabilitiesStruct;
  v2 = [(MTRCameraAVStreamManagementClusterAudioCapabilitiesStruct *)&v18 init];
  v3 = v2;
  if (v2)
  {
    maxNumberOfChannels = v2->_maxNumberOfChannels;
    v2->_maxNumberOfChannels = (NSNumber *)&unk_26F9C8620;

    uint64_t v7 = objc_msgSend_array(MEMORY[0x263EFF8C0], v5, v6);
    supportedCodecs = v3->_supportedCodecs;
    v3->_supportedCodecs = (NSArray *)v7;

    uint64_t v11 = objc_msgSend_array(MEMORY[0x263EFF8C0], v9, v10);
    supportedSampleRates = v3->_supportedSampleRates;
    v3->_supportedSampleRates = (NSArray *)v11;

    uint64_t v15 = objc_msgSend_array(MEMORY[0x263EFF8C0], v13, v14);
    supportedBitDepths = v3->_supportedBitDepths;
    v3->_supportedBitDepths = (NSArray *)v15;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRCameraAVStreamManagementClusterAudioCapabilitiesStruct);
  uint64_t v7 = objc_msgSend_maxNumberOfChannels(self, v5, v6);
  objc_msgSend_setMaxNumberOfChannels_(v4, v8, (uint64_t)v7);

  uint64_t v11 = objc_msgSend_supportedCodecs(self, v9, v10);
  objc_msgSend_setSupportedCodecs_(v4, v12, (uint64_t)v11);

  uint64_t v15 = objc_msgSend_supportedSampleRates(self, v13, v14);
  objc_msgSend_setSupportedSampleRates_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_supportedBitDepths(self, v17, v18);
  objc_msgSend_setSupportedBitDepths_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: maxNumberOfChannels:%@; supportedCodecs:%@; supportedSampleRates:%@; supportedBitDepths:%@; >",
    v5,
    self->_maxNumberOfChannels,
    self->_supportedCodecs,
    self->_supportedSampleRates,
  uint64_t v7 = self->_supportedBitDepths);

  return v7;
}

- (NSNumber)maxNumberOfChannels
{
  return self->_maxNumberOfChannels;
}

- (void)setMaxNumberOfChannels:(id)a3
{
}

- (NSArray)supportedCodecs
{
  return self->_supportedCodecs;
}

- (void)setSupportedCodecs:(id)a3
{
}

- (NSArray)supportedSampleRates
{
  return self->_supportedSampleRates;
}

- (void)setSupportedSampleRates:(id)a3
{
}

- (NSArray)supportedBitDepths
{
  return self->_supportedBitDepths;
}

- (void)setSupportedBitDepths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedBitDepths, 0);
  objc_storeStrong((id *)&self->_supportedSampleRates, 0);
  objc_storeStrong((id *)&self->_supportedCodecs, 0);

  objc_storeStrong((id *)&self->_maxNumberOfChannels, 0);
}

@end