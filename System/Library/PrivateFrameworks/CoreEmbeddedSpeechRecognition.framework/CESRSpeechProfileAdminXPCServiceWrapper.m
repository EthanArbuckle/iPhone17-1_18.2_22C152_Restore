@interface CESRSpeechProfileAdminXPCServiceWrapper
- (CESRSpeechProfileAdminXPCServiceWrapper)init;
- (void)beginEvaluation:(id)a3 completion:(id)a4;
- (void)beginEvaluationWithSerializedSets:(id)a3 completion:(id)a4;
- (void)endEvaluation:(id)a3;
- (void)rebuildSpeechProfileForUserId:(id)a3 completion:(id)a4;
- (void)triggerMaintenance:(BOOL)a3 completion:(id)a4;
@end

@implementation CESRSpeechProfileAdminXPCServiceWrapper

- (void).cxx_destruct
{
}

- (void)endEvaluation:(id)a3
{
  xpcServiceBridge = self->_xpcServiceBridge;
  id v4 = a3;
  id v5 = [(CESRSpeechProfileAdminXPCServiceBridge *)xpcServiceBridge service];
  [v5 endEvaluation:v4];
}

- (void)beginEvaluationWithSerializedSets:(id)a3 completion:(id)a4
{
  xpcServiceBridge = self->_xpcServiceBridge;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CESRSpeechProfileAdminXPCServiceBridge *)xpcServiceBridge service];
  [v8 beginEvaluationWithSerializedSets:v7 completion:v6];
}

- (void)beginEvaluation:(id)a3 completion:(id)a4
{
  xpcServiceBridge = self->_xpcServiceBridge;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CESRSpeechProfileAdminXPCServiceBridge *)xpcServiceBridge service];
  [v8 beginEvaluation:v7 completion:v6];
}

- (void)rebuildSpeechProfileForUserId:(id)a3 completion:(id)a4
{
  xpcServiceBridge = self->_xpcServiceBridge;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CESRSpeechProfileAdminXPCServiceBridge *)xpcServiceBridge service];
  [v8 rebuildSpeechProfileForUserId:v7 completion:v6];
}

- (void)triggerMaintenance:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  xpcServiceBridge = self->_xpcServiceBridge;
  id v6 = a4;
  id v7 = [(CESRSpeechProfileAdminXPCServiceBridge *)xpcServiceBridge service];
  [v7 triggerMaintenance:v4 completion:v6];
}

- (CESRSpeechProfileAdminXPCServiceWrapper)init
{
  v7.receiver = self;
  v7.super_class = (Class)CESRSpeechProfileAdminXPCServiceWrapper;
  v2 = [(CESRSpeechProfileAdminXPCServiceWrapper *)&v7 init];
  if (v2
    && (v3 = [[CESRSpeechProfileAdminXPCServiceBridge alloc] initWithServiceProtocol:&unk_1F12A57D0 machServiceName:@"com.apple.corespeech.corespeechd.speechprofileadmin.service"], xpcServiceBridge = v2->_xpcServiceBridge, v2->_xpcServiceBridge = v3, xpcServiceBridge, !v2->_xpcServiceBridge))
  {
    id v5 = 0;
  }
  else
  {
    id v5 = v2;
  }

  return v5;
}

@end