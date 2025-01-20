@interface CRKFetchControlGroupIdentifiersResultObject
+ (BOOL)supportsSecureCoding;
- (CRKFetchControlGroupIdentifiersResultObject)initWithCoder:(id)a3;
- (CRKFetchControlGroupIdentifiersResultObject)initWithGroupIdentifiers:(id)a3;
- (NSArray)groupIdentifiers;
- (void)encodeWithCoder:(id)a3;
- (void)setGroupIdentifiers:(id)a3;
@end

@implementation CRKFetchControlGroupIdentifiersResultObject

- (CRKFetchControlGroupIdentifiersResultObject)initWithGroupIdentifiers:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKFetchControlGroupIdentifiersResultObject;
  v5 = [(CATTaskResultObject *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    groupIdentifiers = v5->_groupIdentifiers;
    v5->_groupIdentifiers = (NSArray *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchControlGroupIdentifiersResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRKFetchControlGroupIdentifiersResultObject;
  v5 = [(CATTaskResultObject *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"groupIdentifiers"];
    groupIdentifiers = v5->_groupIdentifiers;
    v5->_groupIdentifiers = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKFetchControlGroupIdentifiersResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(CRKFetchControlGroupIdentifiersResultObject *)self groupIdentifiers];
  [v4 encodeObject:v5 forKey:@"groupIdentifiers"];
}

- (NSArray)groupIdentifiers
{
  return self->_groupIdentifiers;
}

- (void)setGroupIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end