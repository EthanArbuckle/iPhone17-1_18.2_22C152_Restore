@interface CRKFetchActiveRestrictionUUIDsResultObject
+ (BOOL)supportsSecureCoding;
- (CRKFetchActiveRestrictionUUIDsResultObject)initWithCoder:(id)a3;
- (NSSet)activeRestrictionUUIDs;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveRestrictionUUIDs:(id)a3;
@end

@implementation CRKFetchActiveRestrictionUUIDsResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchActiveRestrictionUUIDsResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRKFetchActiveRestrictionUUIDsResultObject;
  v5 = [(CATTaskResultObject *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"activeRestrictionUUIDs"];
    activeRestrictionUUIDs = v5->_activeRestrictionUUIDs;
    v5->_activeRestrictionUUIDs = (NSSet *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKFetchActiveRestrictionUUIDsResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(CRKFetchActiveRestrictionUUIDsResultObject *)self activeRestrictionUUIDs];
  [v4 encodeObject:v5 forKey:@"activeRestrictionUUIDs"];
}

- (NSSet)activeRestrictionUUIDs
{
  return self->_activeRestrictionUUIDs;
}

- (void)setActiveRestrictionUUIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end