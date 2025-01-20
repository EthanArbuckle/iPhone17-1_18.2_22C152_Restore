@interface MOVWriterInterfaceStreamEncodingObject
- (BOOL)forceH264;
- (BOOL)lossless;
- (MOVWriterInterfaceStreamEncodingObject)init;
- (MOVWriterInterfaceStreamEncodingObject)initWithLossless:(BOOL)a3 bitrate:(float)a4 forceH264:(BOOL)a5 expectedFPS:(float)a6 extraConfigs:(id)a7;
- (NSDictionary)extraConfigs;
- (float)bitrate;
- (float)expectedFPS;
- (void)setBitrate:(float)a3;
- (void)setExpectedFPS:(float)a3;
- (void)setExtraConfigs:(id)a3;
- (void)setForceH264:(BOOL)a3;
- (void)setLossless:(BOOL)a3;
@end

@implementation MOVWriterInterfaceStreamEncodingObject

- (MOVWriterInterfaceStreamEncodingObject)initWithLossless:(BOOL)a3 bitrate:(float)a4 forceH264:(BOOL)a5 expectedFPS:(float)a6 extraConfigs:(id)a7
{
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)MOVWriterInterfaceStreamEncodingObject;
  v14 = [(MOVWriterInterfaceStreamEncodingObject *)&v17 init];
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

- (MOVWriterInterfaceStreamEncodingObject)init
{
  return [(MOVWriterInterfaceStreamEncodingObject *)self initWithLossless:0 bitrate:0 forceH264:0 expectedFPS:0.0 extraConfigs:0.0];
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