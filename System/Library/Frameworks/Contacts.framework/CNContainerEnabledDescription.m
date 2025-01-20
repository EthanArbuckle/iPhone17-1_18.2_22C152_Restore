@interface CNContainerEnabledDescription
- (BOOL)isWritable;
- (Class)valueClass;
- (id)CNValueForContainer:(id)a3;
- (id)key;
- (int)abPropertyID;
- (void)setCNValue:(id)a3 onContainer:(id)a4;
@end

@implementation CNContainerEnabledDescription

- (id)key
{
  return @"enabled";
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isWritable
{
  return 1;
}

- (id)CNValueForContainer:(id)a3
{
  v3 = NSNumber;
  uint64_t v4 = [a3 isEnabled];

  return (id)[v3 numberWithBool:v4];
}

- (void)setCNValue:(id)a3 onContainer:(id)a4
{
  id v5 = a4;
  objc_msgSend(v5, "setEnabled:", objc_msgSend(a3, "BOOLValue"));
}

- (int)abPropertyID
{
  return *MEMORY[0x1E4F49E08];
}

@end