@interface HMDLegacyModel
+ (id)createWithLegacyRecord:(id)a3 modelContainer:(id)a4 error:(id *)a5;
- (id)encodeWithExistingRecord:(id)a3 cloudZone:(id)a4 modelContainer:(id)a5 error:(id *)a6;
@end

@implementation HMDLegacyModel

+ (id)createWithLegacyRecord:(id)a3 modelContainer:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)MEMORY[0x263EFF940];
  uint64_t v10 = *MEMORY[0x263EFF498];
  v11 = NSString;
  v12 = NSStringFromSelector(a2);
  v13 = [v11 stringWithFormat:@"You must override %@ in a subclass", v12];
  id v14 = [v9 exceptionWithName:v10 reason:v13 userInfo:0];

  objc_exception_throw(v14);
}

- (id)encodeWithExistingRecord:(id)a3 cloudZone:(id)a4 modelContainer:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void *)MEMORY[0x263EFF940];
  uint64_t v13 = *MEMORY[0x263EFF498];
  id v14 = NSString;
  v15 = NSStringFromSelector(a2);
  v16 = [v14 stringWithFormat:@"You must override %@ in a subclass", v15];
  id v17 = [v12 exceptionWithName:v13 reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

@end