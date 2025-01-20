@interface MTMutableAlarm(CoordinationCore)
- (void)co_setHomeKitSaveDate:()CoordinationCore;
- (void)co_setIsMediaSystemOriginating;
- (void)co_setTargetReference:()CoordinationCore;
@end

@implementation MTMutableAlarm(CoordinationCore)

- (void)co_setHomeKitSaveDate:()CoordinationCore
{
}

- (void)co_setTargetReference:()CoordinationCore
{
  id v11 = a3;
  if ([v11 length])
  {
    v4 = [a1 siriContext];
    id v5 = (id)[v4 mutableCopy];

    if (!v5) {
      id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    [v5 setObject:v11 forKey:*MEMORY[0x263F33D90]];
    v6 = a1;
    id v7 = v5;
    goto LABEL_5;
  }
  v8 = objc_msgSend(a1, "co_targetReference");
  uint64_t v9 = [v8 length];

  if (v9)
  {
    id v5 = [a1 siriContext];
    if ([v5 count] != 1)
    {
      v10 = (void *)[v5 mutableCopy];
      [v10 removeObjectForKey:*MEMORY[0x263F33D90]];
      [a1 setSiriContext:v10];

      goto LABEL_6;
    }
    v6 = a1;
    id v7 = 0;
LABEL_5:
    [v6 setSiriContext:v7];
LABEL_6:
  }
}

- (void)co_setIsMediaSystemOriginating
{
  v2 = [a1 siriContext];
  id v4 = (id)[v2 mutableCopy];

  id v3 = v4;
  if (!v4) {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  id v5 = v3;
  [v3 setObject:MEMORY[0x263EFFA88] forKey:@"COAlarmSiriContextIsMediaSystemKey"];
  [a1 setSiriContext:v5];
}

@end