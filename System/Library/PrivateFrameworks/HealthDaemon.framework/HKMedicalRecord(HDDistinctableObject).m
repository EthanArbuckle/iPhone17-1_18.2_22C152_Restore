@interface HKMedicalRecord(HDDistinctableObject)
- (id)uniqueIdentifierForDistinctByKeyPath:()HDDistinctableObject error:;
@end

@implementation HKMedicalRecord(HDDistinctableObject)

- (id)uniqueIdentifierForDistinctByKeyPath:()HDDistinctableObject error:
{
  id v7 = a3;
  if (!v7)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"HKSample+HDDistinctableObject.m", 64, @"Invalid parameter not satisfying: %@", @"keyPath" object file lineNumber description];
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F29908]])
  {
    v8 = [a1 primaryConcept];
    v9 = [v8 identifier];
LABEL_7:

    goto LABEL_17;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F29900]])
  {
    v8 = [a1 primaryConcept];
    v10 = [v8 groupByConcept];
    v9 = [v10 identifier];

    goto LABEL_7;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F29FE0]])
  {
    v11 = [a1 note];

    if (v11) {
      [a1 note];
    }
    else {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
    }
  }
  else if ([v7 isEqualToString:*MEMORY[0x1E4F29FD8]])
  {
    uint64_t v12 = [a1 modifiedDate];
  }
  else
  {
    v15.receiver = a1;
    v15.super_class = (Class)&off_1F186E580;
    uint64_t v12 = objc_msgSendSuper2(&v15, sel_uniqueIdentifierForDistinctByKeyPath_error_, v7, a4);
  }
  v9 = (void *)v12;
LABEL_17:

  return v9;
}

@end