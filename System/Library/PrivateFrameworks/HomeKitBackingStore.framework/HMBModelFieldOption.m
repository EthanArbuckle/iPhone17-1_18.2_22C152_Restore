@interface HMBModelFieldOption
+ (id)encryptedExternalRecordField:(id)a3;
+ (id)excludeFromCloudStorage;
+ (id)externalRecordField:(id)a3;
+ (id)queryableField;
+ (id)queryableFieldWithEncodeBlock:(id)a3 decodeBlock:(id)a4;
+ (id)queryableFieldWithEncodeBlock:(id)a3 decodeBlock:(id)a4 descriptionBlock:(id)a5;
- (void)applyTo:(id)a3;
@end

@implementation HMBModelFieldOption

- (void)applyTo:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

+ (id)queryableFieldWithEncodeBlock:(id)a3 decodeBlock:(id)a4 descriptionBlock:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[HMBModelFieldOptionQueryable alloc] initWithEncodingBlock:v9 decodingBlock:v8 descriptionBlock:v7];

  return v10;
}

+ (id)queryableFieldWithEncodeBlock:(id)a3 decodeBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[HMBModelFieldOptionQueryable alloc] initWithEncodingBlock:v6 decodingBlock:v5 descriptionBlock:&__block_literal_global_262];

  return v7;
}

uint64_t __65__HMBModelFieldOption_queryableFieldWithEncodeBlock_decodeBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hmbDescription];
}

+ (id)queryableField
{
  v2 = objc_alloc_init(HMBModelFieldOptionQueryable);
  return v2;
}

+ (id)excludeFromCloudStorage
{
  v2 = objc_alloc_init(HMBModelFieldOptionExcludeFromCloudStorage);
  return v2;
}

+ (id)encryptedExternalRecordField:(id)a3
{
  id v3 = a3;
  id v4 = [[HMBModelFieldOptionExternalRecordField alloc] initWithExternalRecordField:v3 encrypted:1];

  return v4;
}

+ (id)externalRecordField:(id)a3
{
  id v3 = a3;
  id v4 = [[HMBModelFieldOptionExternalRecordField alloc] initWithExternalRecordField:v3 encrypted:0];

  return v4;
}

@end