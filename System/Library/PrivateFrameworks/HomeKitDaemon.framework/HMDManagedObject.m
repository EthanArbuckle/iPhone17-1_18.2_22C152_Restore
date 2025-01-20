@interface HMDManagedObject
+ (id)logCategory;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForInsertOrUpdate:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (NSString)debugDescription;
- (NSString)description;
@end

@implementation HMDManagedObject

- (BOOL)validateForUpdate:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMDManagedObject;
  BOOL v5 = -[HMDManagedObject validateForUpdate:](&v7, sel_validateForUpdate_);
  if (v5) {
    LOBYTE(v5) = [(HMDManagedObject *)self validateForInsertOrUpdate:a3];
  }
  return v5;
}

- (BOOL)validateForInsert:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMDManagedObject;
  BOOL v5 = -[HMDManagedObject validateForInsert:](&v7, sel_validateForInsert_);
  if (v5) {
    LOBYTE(v5) = [(HMDManagedObject *)self validateForInsertOrUpdate:a3];
  }
  return v5;
}

- (NSString)debugDescription
{
  v4.receiver = self;
  v4.super_class = (Class)HMDManagedObject;
  v2 = [(HMDManagedObject *)&v4 description];
  return (NSString *)v2;
}

- (NSString)description
{
  v2 = NSString;
  v3 = [(HMDManagedObject *)self objectID];
  objc_super v4 = objc_msgSend(v3, "hmd_debugIdentifier");
  BOOL v5 = [v2 stringWithFormat:@"<%@>", v4];

  return (NSString *)v5;
}

- (BOOL)validateForInsertOrUpdate:(id *)a3
{
  return 1;
}

+ (id)logCategory
{
  return +[HMDCoreData logCategory];
}

@end