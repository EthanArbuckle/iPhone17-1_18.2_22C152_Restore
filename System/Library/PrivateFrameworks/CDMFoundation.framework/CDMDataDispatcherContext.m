@interface CDMDataDispatcherContext
- (BOOL)isSampledForEmission;
- (CDMDataDispatcherContext)init;
- (CDMDataDispatcherContext)initWithCallingBundleId:(id)a3;
- (NSString)callingBundleId;
- (NSUUID)streamUUID;
- (int)cdmSELFLoggingPolicyType;
- (unint64_t)samplingDiceRoll;
- (void)setCdmSELFLoggingPolicyType:(int)a3;
- (void)setSamplingDiceRoll:(unint64_t)a3;
@end

@implementation CDMDataDispatcherContext

- (int)cdmSELFLoggingPolicyType
{
  return self->_cdmSELFLoggingPolicyType;
}

- (BOOL)isSampledForEmission
{
  if (self->_cdmSELFLoggingPolicyType == 1) {
    return 1;
  }
  unint64_t samplingDiceRoll = self->_samplingDiceRoll;
  return samplingDiceRoll < +[CDMUserDefaultsUtils readNonSiriSelfSampleRate];
}

- (NSString)callingBundleId
{
  return self->_callingBundleId;
}

- (NSUUID)streamUUID
{
  return self->_streamUUID;
}

- (CDMDataDispatcherContext)initWithCallingBundleId:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CDMDataDispatcherContext;
  v6 = [(CDMDataDispatcherContext *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callingBundleId, a3);
    uint64_t v8 = [MEMORY[0x263F08C38] UUID];
    streamUUID = v7->_streamUUID;
    v7->_streamUUID = (NSUUID *)v8;

    v7->_cdmSELFLoggingPolicyType = +[CDMSELFLoggingPolicy getSELFCDMLoggingPolicyType:v5];
    v7->_unint64_t samplingDiceRoll = arc4random_uniform(0x64u);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamUUID, 0);
  objc_storeStrong((id *)&self->_callingBundleId, 0);
}

- (void)setSamplingDiceRoll:(unint64_t)a3
{
  self->_unint64_t samplingDiceRoll = a3;
}

- (unint64_t)samplingDiceRoll
{
  return self->_samplingDiceRoll;
}

- (void)setCdmSELFLoggingPolicyType:(int)a3
{
  self->_cdmSELFLoggingPolicyType = a3;
}

- (CDMDataDispatcherContext)init
{
  return [(CDMDataDispatcherContext *)self initWithCallingBundleId:@"com.apple.assistant.assistantd"];
}

@end