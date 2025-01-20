@interface NSData(GKBase64)
- (id)_gkZippedDictionaryValue;
@end

@implementation NSData(GKBase64)

- (id)_gkZippedDictionaryValue
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v10 = 0;
  v1 = [a1 decompressedDataUsingAlgorithm:3 error:&v10];
  id v2 = v10;
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v5 = [v3 setWithArray:v4];

  id v9 = v2;
  v6 = [MEMORY[0x1E4F28DC0] _strictlyUnarchivedObjectOfClasses:v5 fromData:v1 error:&v9];
  id v7 = v9;

  return v6;
}

@end