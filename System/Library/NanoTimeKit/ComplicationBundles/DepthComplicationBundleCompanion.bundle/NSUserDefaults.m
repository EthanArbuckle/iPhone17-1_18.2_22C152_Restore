@interface NSUserDefaults
- (BOOL)compOverrideEnabled;
- (double)compOverrideDepth;
- (double)compOverrideHistDepth;
- (double)compOverrideHistDuration;
- (double)compOverrideHistTemp;
- (double)compOverrideTemp;
- (int64_t)compOverrideHistNumberOfDives;
@end

@implementation NSUserDefaults

- (double)compOverrideDepth
{
  return sub_357CC(self);
}

- (double)compOverrideHistDepth
{
  return sub_357CC(self);
}

- (double)compOverrideTemp
{
  return sub_357CC(self);
}

- (double)compOverrideHistTemp
{
  return sub_357CC(self);
}

- (int64_t)compOverrideHistNumberOfDives
{
  v2 = self;
  NSString v3 = sub_36DC8();
  NSInteger v4 = [(NSUserDefaults *)v2 integerForKey:v3];

  return v4;
}

- (double)compOverrideHistDuration
{
  return sub_357CC(self);
}

- (BOOL)compOverrideEnabled
{
  uint64_t v2 = qword_47CC8;
  NSString v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  NSString v4 = sub_36DC8();
  unsigned __int8 v5 = [(NSUserDefaults *)v3 BOOLForKey:v4];

  return v5;
}

@end