@interface GenerativeAssistantSiriInvocationManager
- (void)invokeTypeToSiriForFollowup;
@end

@implementation GenerativeAssistantSiriInvocationManager

- (void)invokeTypeToSiriForFollowup
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v2 = (void *)getSiriSimpleActivationSourceClass_softClass;
  uint64_t v9 = getSiriSimpleActivationSourceClass_softClass;
  if (!getSiriSimpleActivationSourceClass_softClass)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __getSiriSimpleActivationSourceClass_block_invoke;
    v5[3] = &unk_265340708;
    v5[4] = &v6;
    __getSiriSimpleActivationSourceClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = v2;
  _Block_object_dispose(&v6, 8);
  id v4 = objc_alloc_init(v3);
  [v4 activateFromSource:55];
  [v4 invalidate];
}

@end