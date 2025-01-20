@interface CNContainerGuardianStateDirtyDescription
- (BOOL)isWritable;
- (BOOL)setABValue:(void *)a3 onABSource:(void *)a4 error:(__CFError *)a5;
- (Class)valueClass;
- (id)CNValueForContainer:(id)a3;
- (id)CNValueFromABValue:(void *)a3;
- (id)key;
- (int)abPropertyID;
- (void)ABValueFromCNValue:(id)a3;
- (void)setCNValue:(id)a3 onContainer:(id)a4;
@end

@implementation CNContainerGuardianStateDirtyDescription

- (id)key
{
  return @"guardianStateDirty";
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
  uint64_t v4 = [a3 isGuardianStateDirty];

  return (id)[v3 numberWithBool:v4];
}

- (void)setCNValue:(id)a3 onContainer:(id)a4
{
  id v5 = a4;
  objc_msgSend(v5, "setGuardianStateDirty:", objc_msgSend(a3, "BOOLValue"));
}

- (int)abPropertyID
{
  return *MEMORY[0x1E4F49DF8];
}

- (BOOL)setABValue:(void *)a3 onABSource:(void *)a4 error:(__CFError *)a5
{
  if (!a3) {
    return 1;
  }
  v6 = a3;
  [(CNContainerGuardianStateDirtyDescription *)self abPropertyID];
  ABRecordGetIntValue();
  [v6 intValue];

  [(CNContainerGuardianStateDirtyDescription *)self abPropertyID];

  return ABRecordSetIntValue();
}

- (void)ABValueFromCNValue:(id)a3
{
  if ([a3 BOOLValue]) {
    uint64_t v3 = 8;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = (const void *)[NSNumber numberWithInt:v3];
  if (!v4) {
    return 0;
  }
  CFTypeRef v5 = CFRetain(v4);
  if (!v5) {
    return 0;
  }

  return (void *)CFAutorelease(v5);
}

- (id)CNValueFromABValue:(void *)a3
{
  if (([a3 intValue] & 8) != 0) {
    return (id)MEMORY[0x1E4F1CC38];
  }
  else {
    return (id)MEMORY[0x1E4F1CC28];
  }
}

@end