@interface CESRSpeechProfileEvaluationStatus
+ (id)sharedStatus;
- (BOOL)isEvaluationEnabled;
- (void)setEvaluationEnabled:(BOOL)a3;
@end

@implementation CESRSpeechProfileEvaluationStatus

- (void)setEvaluationEnabled:(BOOL)a3
{
  if (!+[CESRUtilities isCustomerInstall]) {
    atomic_store(a3, (unsigned __int8 *)&self->_isEvaluationEnabled);
  }
}

- (BOOL)isEvaluationEnabled
{
  if (+[CESRUtilities isCustomerInstall]) {
    return 0;
  }
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_isEvaluationEnabled);
  return v4 & 1;
}

+ (id)sharedStatus
{
  if (sharedStatus_onceToken[0] != -1) {
    dispatch_once(sharedStatus_onceToken, &__block_literal_global_3991);
  }
  v2 = (void *)sharedStatus_sharedStatus;

  return v2;
}

uint64_t __49__CESRSpeechProfileEvaluationStatus_sharedStatus__block_invoke()
{
  v0 = objc_alloc_init(CESRSpeechProfileEvaluationStatus);
  uint64_t v1 = sharedStatus_sharedStatus;
  sharedStatus_sharedStatus = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end