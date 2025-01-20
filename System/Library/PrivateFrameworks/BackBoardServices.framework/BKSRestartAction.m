@interface BKSRestartAction
+ (id)actionWithOptions:(unint64_t)a3;
- (unint64_t)options;
@end

@implementation BKSRestartAction

+ (id)actionWithOptions:(unint64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v5 = [NSNumber numberWithUnsignedInteger:a3];
  [v4 setObject:v5 forSetting:1];

  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithInfo:v4 responder:0];
  return v6;
}

- (unint64_t)options
{
  v2 = [(BKSRestartAction *)self info];
  v3 = [v2 objectForSetting:1];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

@end