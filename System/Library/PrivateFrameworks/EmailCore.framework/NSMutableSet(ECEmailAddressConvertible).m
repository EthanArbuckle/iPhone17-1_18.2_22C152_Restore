@interface NSMutableSet(ECEmailAddressConvertible)
+ (id)ec_emailAddressConvertiblesSetFromArray:()ECEmailAddressConvertible includeInvalid:;
@end

@implementation NSMutableSet(ECEmailAddressConvertible)

+ (id)ec_emailAddressConvertiblesSetFromArray:()ECEmailAddressConvertible includeInvalid:
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __98__NSMutableSet_ECEmailAddressConvertible__ec_emailAddressConvertiblesSetFromArray_includeInvalid___block_invoke;
  v9[3] = &unk_1E63EE538;
  id v7 = v6;
  id v10 = v7;
  char v11 = a4;
  [v5 enumerateObjectsUsingBlock:v9];

  return v7;
}

@end