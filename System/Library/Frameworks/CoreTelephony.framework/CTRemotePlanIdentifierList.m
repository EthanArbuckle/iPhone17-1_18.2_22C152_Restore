@interface CTRemotePlanIdentifierList
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTRemotePlanIdentifierList)init;
- (CTRemotePlanIdentifierList)initWithCoder:(id)a3;
- (CTRemotePlanIdentifierList)initWithPlanIdentifiers:(id)a3;
- (NSArray)planIdentifiers;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setPlanIdentifiers:(id)a3;
@end

@implementation CTRemotePlanIdentifierList

- (CTRemotePlanIdentifierList)init
{
  v6.receiver = self;
  v6.super_class = (Class)CTRemotePlanIdentifierList;
  v2 = [(CTRemotePlanIdentifierList *)&v6 init];
  v3 = v2;
  if (v2)
  {
    planIdentifiers = v2->_planIdentifiers;
    v2->_planIdentifiers = 0;
  }
  return v3;
}

- (CTRemotePlanIdentifierList)initWithPlanIdentifiers:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTRemotePlanIdentifierList;
  objc_super v6 = [(CTRemotePlanIdentifierList *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_planIdentifiers, a3);
  }

  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", planIdentifiers=%@", self->_planIdentifiers];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTRemotePlanIdentifierList *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(CTRemotePlanIdentifierList *)self planIdentifiers];
      objc_super v6 = [(CTRemotePlanIdentifierList *)v4 planIdentifiers];
      if (v5 == v6)
      {
        char v9 = 1;
      }
      else
      {
        v7 = [(CTRemotePlanIdentifierList *)self planIdentifiers];
        v8 = [(CTRemotePlanIdentifierList *)v4 planIdentifiers];
        char v9 = [v7 isEqual:v8];
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTRemotePlanIdentifierList)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTRemotePlanIdentifierList;
  id v5 = [(CTRemotePlanIdentifierList *)&v12 init];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"planIdentifiers"];
    planIdentifiers = v5->_planIdentifiers;
    v5->_planIdentifiers = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSArray)planIdentifiers
{
  return self->_planIdentifiers;
}

- (void)setPlanIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end