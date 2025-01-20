@interface CKVAdminXPCServiceWrapper
- (CKVAdminXPCServiceWrapper)init;
- (void)beginEvaluation:(id)a3 clean:(BOOL)a4 completion:(id)a5;
- (void)captureVocabularySnapshot:(id)a3 completion:(id)a4;
- (void)deleteAllItemsWithUserId:(id)a3 completion:(id)a4;
- (void)deleteAllItemsWithUserId:(id)a3 deviceId:(id)a4 completion:(id)a5;
- (void)endEvaluation:(id)a3;
- (void)finishEventSimulation:(id)a3;
- (void)handleTask:(unsigned __int16)a3 reason:(unsigned __int16)a4 completion:(id)a5;
- (void)rebuildSpeechProfileForUserId:(id)a3 completion:(id)a4;
- (void)startEventSimulation:(BOOL)a3 completion:(id)a4;
- (void)triggerMaintenance:(id)a3;
- (void)triggerMigration:(BOOL)a3 completeAfterTrigger:(BOOL)a4 completion:(id)a5;
@end

@implementation CKVAdminXPCServiceWrapper

- (void).cxx_destruct
{
}

- (void)endEvaluation:(id)a3
{
  xpcServiceBridge = self->_xpcServiceBridge;
  id v4 = a3;
  id v5 = [(CKVXPCServiceBridge *)xpcServiceBridge service];
  [v5 endEvaluation:v4];
}

- (void)beginEvaluation:(id)a3 clean:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  xpcServiceBridge = self->_xpcServiceBridge;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(CKVXPCServiceBridge *)xpcServiceBridge service];
  [v10 beginEvaluation:v9 clean:v5 completion:v8];
}

- (void)deleteAllItemsWithUserId:(id)a3 deviceId:(id)a4 completion:(id)a5
{
  xpcServiceBridge = self->_xpcServiceBridge;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CKVXPCServiceBridge *)xpcServiceBridge service];
  [v11 deleteAllItemsWithUserId:v10 deviceId:v9 completion:v8];
}

- (void)deleteAllItemsWithUserId:(id)a3 completion:(id)a4
{
  xpcServiceBridge = self->_xpcServiceBridge;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CKVXPCServiceBridge *)xpcServiceBridge service];
  [v8 deleteAllItemsWithUserId:v7 completion:v6];
}

- (void)rebuildSpeechProfileForUserId:(id)a3 completion:(id)a4
{
  xpcServiceBridge = self->_xpcServiceBridge;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CKVXPCServiceBridge *)xpcServiceBridge service];
  [v8 rebuildSpeechProfileForUserId:v7 completion:v6];
}

- (void)captureVocabularySnapshot:(id)a3 completion:(id)a4
{
  xpcServiceBridge = self->_xpcServiceBridge;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CKVXPCServiceBridge *)xpcServiceBridge service];
  [v8 captureVocabularySnapshot:v7 completion:v6];
}

- (void)triggerMaintenance:(id)a3
{
  xpcServiceBridge = self->_xpcServiceBridge;
  id v4 = a3;
  id v5 = [(CKVXPCServiceBridge *)xpcServiceBridge service];
  [v5 triggerMaintenance:v4];
}

- (void)triggerMigration:(BOOL)a3 completeAfterTrigger:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  xpcServiceBridge = self->_xpcServiceBridge;
  id v8 = a5;
  id v9 = [(CKVXPCServiceBridge *)xpcServiceBridge service];
  [v9 triggerMigration:v6 completeAfterTrigger:v5 completion:v8];
}

- (void)finishEventSimulation:(id)a3
{
  xpcServiceBridge = self->_xpcServiceBridge;
  id v4 = a3;
  id v5 = [(CKVXPCServiceBridge *)xpcServiceBridge service];
  [v5 finishEventSimulation:v4];
}

- (void)handleTask:(unsigned __int16)a3 reason:(unsigned __int16)a4 completion:(id)a5
{
  uint64_t v5 = a4;
  uint64_t v6 = a3;
  xpcServiceBridge = self->_xpcServiceBridge;
  id v8 = a5;
  id v9 = [(CKVXPCServiceBridge *)xpcServiceBridge service];
  [v9 handleTask:v6 reason:v5 completion:v8];
}

- (void)startEventSimulation:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  xpcServiceBridge = self->_xpcServiceBridge;
  id v6 = a4;
  id v7 = [(CKVXPCServiceBridge *)xpcServiceBridge service];
  [v7 startEventSimulation:v4 completion:v6];
}

- (CKVAdminXPCServiceWrapper)init
{
  v7.receiver = self;
  v7.super_class = (Class)CKVAdminXPCServiceWrapper;
  v2 = [(CKVAdminXPCServiceWrapper *)&v7 init];
  if (v2
    && (v3 = [[CKVXPCServiceBridge alloc] initWithServiceProtocol:&unk_1EFD82730 machServiceName:@"com.apple.siriknowledged.vocabulary.admin"], xpcServiceBridge = v2->_xpcServiceBridge, v2->_xpcServiceBridge = v3, xpcServiceBridge, !v2->_xpcServiceBridge))
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = v2;
  }

  return v5;
}

@end