@interface HKDiagnosticTestResult(HKDistinctableObject)
+ (uint64_t)supportsDistinctByKeyPath:()HKDistinctableObject;
- (id)uniqueIdentifierForDistinctByKeyPath:()HKDistinctableObject error:;
@end

@implementation HKDiagnosticTestResult(HKDistinctableObject)

+ (uint64_t)supportsDistinctByKeyPath:()HKDistinctableObject
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"HKSample+HDDistinctableObject.m", 87, @"Invalid parameter not satisfying: %@", @"keyPath" object file lineNumber description];
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F29A38]])
  {
    uint64_t v6 = 1;
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&off_1F186FDF8;
    uint64_t v6 = (uint64_t)objc_msgSendSuper2(&v9, sel_supportsDistinctByKeyPath_, v5);
  }

  return v6;
}

- (id)uniqueIdentifierForDistinctByKeyPath:()HKDistinctableObject error:
{
  id v7 = a3;
  if (!v7)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"HKSample+HDDistinctableObject.m", 96, @"Invalid parameter not satisfying: %@", @"keyPath" object file lineNumber description];
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F29A38]])
  {
    uint64_t v8 = [a1 category];
  }
  else
  {
    v12.receiver = a1;
    v12.super_class = (Class)&off_1F18706E8;
    uint64_t v8 = objc_msgSendSuper2(&v12, sel_uniqueIdentifierForDistinctByKeyPath_error_, v7, a4);
  }
  objc_super v9 = (void *)v8;

  return v9;
}

@end