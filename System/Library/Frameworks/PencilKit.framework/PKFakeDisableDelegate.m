@interface PKFakeDisableDelegate
+ (BOOL)_shouldAttachForView:(id)a3;
+ (id)_infoInProcess;
- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4;
@end

@implementation PKFakeDisableDelegate

+ (id)_infoInProcess
{
  if (qword_1EB3C6328 != -1) {
    dispatch_once(&qword_1EB3C6328, &__block_literal_global_158_0);
  }
  v2 = (void *)qword_1EB3C6320;

  return v2;
}

void __39__PKFakeDisableDelegate__infoInProcess__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:1282 valueOptions:0 capacity:10];
  v1 = (void *)qword_1EB3C6318;
  qword_1EB3C6318 = v0;

  v2 = (void *)qword_1EB3C6318;
  v3 = +[_PKFakeFixInfo disableInfoWithInteractionValue:0xBE3DE77E1BA5CA28];
  [v2 setObject:v3 forKey:0xD6014EA89BD82C72];

  v4 = (void *)qword_1EB3C6318;
  v5 = +[_PKFakeFixInfo disableInfoWithInteractionValue:0xBE3DE77E1BA5CA28];
  [v4 setObject:v5 forKey:0x55AFCEEEBCB7DC0CLL];

  v6 = [MEMORY[0x1E4F28B50] mainBundle];
  id v9 = [v6 bundleIdentifier];

  uint64_t v7 = objc_msgSend((id)qword_1EB3C6318, "objectForKey:", objc_msgSend(v9, "hash"));
  v8 = (void *)qword_1EB3C6320;
  qword_1EB3C6320 = v7;
}

+ (BOOL)_shouldAttachForView:(id)a3
{
  id v4 = a3;
  if (v4 && (dyld_program_sdk_at_least() & 1) == 0)
  {
    v6 = [a1 _infoInProcess];
    if ([v6 interactionValue])
    {
      uint64_t v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      uint64_t v9 = [v8 hash];
      BOOL v5 = v9 == [v6 interactionValue];
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  return 0;
}

@end