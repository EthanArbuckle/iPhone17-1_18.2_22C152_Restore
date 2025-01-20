@interface AVCBasebandAudioTapRegistrationResult
- (AVCBasebandAudioTapRegistrationResult)init;
- (BOOL)didSucceed;
- (id)description;
- (int64_t)downlinkToken;
- (int64_t)tapToken;
- (int64_t)uplinkToken;
- (void)init;
- (void)setDidSucceed:(BOOL)a3;
- (void)setDownlinkToken:(int64_t)a3;
- (void)setTapToken:(int64_t)a3;
- (void)setUplinkToken:(int64_t)a3;
@end

@implementation AVCBasebandAudioTapRegistrationResult

- (AVCBasebandAudioTapRegistrationResult)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)AVCBasebandAudioTapRegistrationResult;
  v2 = [(AVCBasebandAudioTapRegistrationResult *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_tapToken = 0;
    v2->_uplinkToken = 0;
    v2->_downlinkToken = 0;
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[AVCBasebandAudioTapRegistrationResult init]();
    }
  }
  return v3;
}

- (id)description
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)AVCBasebandAudioTapRegistrationResult;
  id v4 = [(AVCBasebandAudioTapRegistrationResult *)&v7 description];
  if (self->_didSucceed) {
    objc_super v5 = "YES";
  }
  else {
    objc_super v5 = "NO";
  }
  return (id)[v3 stringWithFormat:@"{ %@ success=%s tapToken=%ld uplinkToken=%ld downlinkToken=%ld }", v4, v5, self->_tapToken, self->_uplinkToken, self->_downlinkToken];
}

- (int64_t)tapToken
{
  return self->_tapToken;
}

- (void)setTapToken:(int64_t)a3
{
  self->_tapToken = a3;
}

- (int64_t)uplinkToken
{
  return self->_uplinkToken;
}

- (void)setUplinkToken:(int64_t)a3
{
  self->_uplinkToken = a3;
}

- (int64_t)downlinkToken
{
  return self->_downlinkToken;
}

- (void)setDownlinkToken:(int64_t)a3
{
  self->_downlinkToken = a3;
}

- (BOOL)didSucceed
{
  return self->_didSucceed;
}

- (void)setDidSucceed:(BOOL)a3
{
  self->_didSucceed = a3;
}

- (void)init
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to super init instance", v2, v3, v4, v5, v6);
}

@end