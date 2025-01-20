@interface CRKFetchActiveControlGroupIdentifierResultObject
+ (BOOL)supportsSecureCoding;
- (CRKFetchActiveControlGroupIdentifierResultObject)initWithCoder:(id)a3;
- (DMFControlGroupIdentifier)groupIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setGroupIdentifier:(id)a3;
@end

@implementation CRKFetchActiveControlGroupIdentifierResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchActiveControlGroupIdentifierResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKFetchActiveControlGroupIdentifierResultObject;
  v5 = [(CATTaskResultObject *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"groupIdentifier"];
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (DMFControlGroupIdentifier *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKFetchActiveControlGroupIdentifierResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(CRKFetchActiveControlGroupIdentifierResultObject *)self groupIdentifier];
  [v4 encodeObject:v5 forKey:@"groupIdentifier"];
}

- (DMFControlGroupIdentifier)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end