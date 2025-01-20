@interface VCCryptoInfo
- (VCCryptoInfo)initWithSRTPInfo:(tagSRTPINFO *)a3;
- (tagSRTPINFO)state;
- (void)dealloc;
@end

@implementation VCCryptoInfo

- (VCCryptoInfo)initWithSRTPInfo:(tagSRTPINFO *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCCryptoInfo;
  v4 = [(VCCryptoInfo *)&v7 init];
  v5 = v4;
  if (v4) {
    memcpy(&v4->_SRTPInfo, a3, sizeof(v4->_SRTPInfo));
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  SRTPCleanUp((uint64_t)&self->_SRTPInfo);
  v3.receiver = self;
  v3.super_class = (Class)VCCryptoInfo;
  [(VCCryptoInfo *)&v3 dealloc];
}

- (tagSRTPINFO)state
{
  return &self->_SRTPInfo;
}

@end