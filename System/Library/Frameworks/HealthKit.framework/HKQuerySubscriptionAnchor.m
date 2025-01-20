@interface HKQuerySubscriptionAnchor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKQuerySubscriptionAnchor)initWithCoder:(id)a3;
- (HKQuerySubscriptionAnchor)initWithDataAnchor:(id)a3 associationAnchor:(id)a4;
- (NSNumber)associationAnchor;
- (NSNumber)dataAnchor;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)updateAssociationAnchor:(id)a3;
- (void)updateDataAnchor:(id)a3;
@end

@implementation HKQuerySubscriptionAnchor

- (HKQuerySubscriptionAnchor)initWithDataAnchor:(id)a3 associationAnchor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKQuerySubscriptionAnchor;
  v8 = [(HKQuerySubscriptionAnchor *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    dataAnchor = v8->_dataAnchor;
    v8->_dataAnchor = (NSNumber *)v9;

    uint64_t v11 = [v7 copy];
    associationAnchor = v8->_associationAnchor;
    v8->_associationAnchor = (NSNumber *)v11;
  }
  return v8;
}

- (void)updateDataAnchor:(id)a3
{
}

- (void)updateAssociationAnchor:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@:%p DataAnchor=%@, AssociationAnchor=%@>", v5, self, self->_dataAnchor, self->_associationAnchor];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = (HKQuerySubscriptionAnchor *)a3;
  if (self == v6)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      dataAnchor = self->_dataAnchor;
      uint64_t v9 = [(HKQuerySubscriptionAnchor *)v7 dataAnchor];
      if (dataAnchor == v9) {
        goto LABEL_9;
      }
      uint64_t v10 = [(HKQuerySubscriptionAnchor *)v7 dataAnchor];
      if (!v10)
      {
        char v12 = 0;
LABEL_17:

        goto LABEL_18;
      }
      v3 = (void *)v10;
      uint64_t v11 = self->_dataAnchor;
      v4 = [(HKQuerySubscriptionAnchor *)v7 dataAnchor];
      if ([(NSNumber *)v11 isEqual:v4])
      {
LABEL_9:
        associationAnchor = self->_associationAnchor;
        uint64_t v14 = [(HKQuerySubscriptionAnchor *)v7 associationAnchor];
        if (associationAnchor == (NSNumber *)v14)
        {

          char v12 = 1;
        }
        else
        {
          v15 = (void *)v14;
          uint64_t v16 = [(HKQuerySubscriptionAnchor *)v7 associationAnchor];
          if (v16)
          {
            v17 = (void *)v16;
            v18 = self->_associationAnchor;
            v19 = [(HKQuerySubscriptionAnchor *)v7 associationAnchor];
            char v12 = [(NSNumber *)v18 isEqual:v19];
          }
          else
          {

            char v12 = 0;
          }
        }
        if (dataAnchor == v9) {
          goto LABEL_17;
        }
      }
      else
      {
        char v12 = 0;
      }

      goto LABEL_17;
    }
    char v12 = 0;
  }
LABEL_18:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  dataAnchor = self->_dataAnchor;
  id v5 = a3;
  [v5 encodeObject:dataAnchor forKey:@"DataAnchor"];
  [v5 encodeObject:self->_associationAnchor forKey:@"AssociationAnchor"];
}

- (HKQuerySubscriptionAnchor)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DataAnchor"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AssociationAnchor"];

  id v7 = [(HKQuerySubscriptionAnchor *)self initWithDataAnchor:v5 associationAnchor:v6];
  return v7;
}

- (NSNumber)dataAnchor
{
  return self->_dataAnchor;
}

- (NSNumber)associationAnchor
{
  return self->_associationAnchor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associationAnchor, 0);

  objc_storeStrong((id *)&self->_dataAnchor, 0);
}

@end