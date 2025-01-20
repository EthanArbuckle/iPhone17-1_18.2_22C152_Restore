@interface SYDegenerateChange
+ (BOOL)isDegenerate:(id)a3;
+ (id)degenerateChange;
- (NSString)objectIdentifier;
- (NSString)sequencer;
- (int64_t)changeType;
@end

@implementation SYDegenerateChange

+ (id)degenerateChange
{
  if (degenerateChange_onceToken != -1) {
    dispatch_once(&degenerateChange_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)degenerateChange_instance;
  return v2;
}

uint64_t __38__SYDegenerateChange_degenerateChange__block_invoke()
{
  v0 = objc_alloc_init(SYDegenerateChange);
  uint64_t v1 = degenerateChange_instance;
  degenerateChange_instance = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (BOOL)isDegenerate:(id)a3
{
  id v3 = a3;
  id v4 = +[SYDegenerateChange degenerateChange];

  return v4 == v3;
}

- (NSString)sequencer
{
  return 0;
}

- (NSString)objectIdentifier
{
  return (NSString *)@"SY:degenerate";
}

- (int64_t)changeType
{
  return 2;
}

@end