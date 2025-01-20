@interface StreamEncodingObject
- (BOOL)forceH264;
- (BOOL)lossless;
- (NSDictionary)extraConfigs;
- (StreamEncodingObject)initWithLossless:(BOOL)a3 bitrate:(float)a4 forceH264:(BOOL)a5 expectedFPS:(float)a6 extraConfigs:(id)a7;
- (float)bitrate;
- (float)expectedFPS;
- (void)setBitrate:(float)a3;
- (void)setExpectedFPS:(float)a3;
- (void)setExtraConfigs:(id)a3;
- (void)setForceH264:(BOOL)a3;
- (void)setLossless:(BOOL)a3;
@end

@implementation StreamEncodingObject

- (StreamEncodingObject)initWithLossless:(BOOL)a3 bitrate:(float)a4 forceH264:(BOOL)a5 expectedFPS:(float)a6 extraConfigs:(id)a7
{
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)StreamEncodingObject;
  v14 = [(StreamEncodingObject *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_lossless = a3;
    v14->_forceH264 = a5;
    v14->_bitrate = a4;
    v14->_expectedFPS = a6;
    objc_storeStrong((id *)&v14->_extraConfigs, a7);
  }

  return v15;
}

- (BOOL)lossless
{
  return self->_lossless;
}

- (void)setLossless:(BOOL)a3
{
  self->_lossless = a3;
}

- (float)bitrate
{
  return self->_bitrate;
}

- (void)setBitrate:(float)a3
{
  self->_bitrate = a3;
}

- (BOOL)forceH264
{
  return self->_forceH264;
}

- (void)setForceH264:(BOOL)a3
{
  self->_forceH264 = a3;
}

- (float)expectedFPS
{
  return self->_expectedFPS;
}

- (void)setExpectedFPS:(float)a3
{
  self->_expectedFPS = a3;
}

- (NSDictionary)extraConfigs
{
  return self->_extraConfigs;
}

- (void)setExtraConfigs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end