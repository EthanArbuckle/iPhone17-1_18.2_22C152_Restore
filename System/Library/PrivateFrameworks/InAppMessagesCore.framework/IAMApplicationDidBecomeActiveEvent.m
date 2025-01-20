@interface IAMApplicationDidBecomeActiveEvent
- (IAMApplicationDidBecomeActiveEvent)initWithName:(id)a3;
- (IAMApplicationDidBecomeActiveEvent)initWithName:(id)a3 type:(int64_t)a4;
- (id)name;
- (int64_t)type;
@end

@implementation IAMApplicationDidBecomeActiveEvent

- (id)name
{
  return @"applicationDidBecomeActive";
}

- (IAMApplicationDidBecomeActiveEvent)initWithName:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF4A0];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v4 raise:v5, @"%@ -initWithName: is not supported, use -init", v7 format];

  return 0;
}

- (IAMApplicationDidBecomeActiveEvent)initWithName:(id)a3 type:(int64_t)a4
{
  uint64_t v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF4A0];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v5 raise:v6, @"%@ -initWithName:type: is not supported, use -init", v8 format];

  return 0;
}

- (int64_t)type
{
  return 0;
}

@end