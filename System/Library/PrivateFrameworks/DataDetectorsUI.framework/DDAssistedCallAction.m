@interface DDAssistedCallAction
+ (BOOL)isAvailable;
- (id)iconName;
- (id)subtitle;
@end

@implementation DDAssistedCallAction

+ (BOOL)isAvailable
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___DDAssistedCallAction;
  unsigned int v2 = objc_msgSendSuper2(&v4, sel_isAvailable);
  if (v2) {
    LOBYTE(v2) = _AXSSoftwareTTYEnabled() != 0;
  }
  return v2;
}

- (id)iconName
{
  return @"teletype";
}

- (id)subtitle
{
  return 0;
}

@end