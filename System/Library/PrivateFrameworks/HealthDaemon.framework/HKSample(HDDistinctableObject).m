@interface HKSample(HDDistinctableObject)
+ (uint64_t)supportsDistinctByKeyPath:()HDDistinctableObject;
- (uint64_t)uniqueIdentifierForDistinctByKeyPath:()HDDistinctableObject error:;
@end

@implementation HKSample(HDDistinctableObject)

+ (uint64_t)supportsDistinctByKeyPath:()HDDistinctableObject
{
  if (!a3)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, a1, @"HKSample+HDDistinctableObject.m", 22, @"Invalid parameter not satisfying: %@", @"keyPath" object file lineNumber description];
  }
  return 0;
}

- (uint64_t)uniqueIdentifierForDistinctByKeyPath:()HDDistinctableObject error:
{
  id v7 = a3;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"HKSample+HDDistinctableObject.m", 28, @"Invalid parameter not satisfying: %@", @"keyPath" object file lineNumber description];
  }
  v8 = (void *)MEMORY[0x1E4F28C58];
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  objc_msgSend(v8, "hk_assignError:code:format:", a4, 3, @"%@ does not support distinct-by on key-path %@", v10, v7);

  return 0;
}

@end