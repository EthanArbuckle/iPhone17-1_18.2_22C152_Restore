@interface HKClinicalSharingSyncInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKClinicalSharingSyncInfo)initWithCoder:(id)a3;
- (HKClinicalSharingSyncInfo)initWithStartDate:(id)a3 accountIdentifiers:(id)a4;
- (NSDate)startDate;
- (NSSet)accountIdentifiers;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKClinicalSharingSyncInfo

- (HKClinicalSharingSyncInfo)initWithStartDate:(id)a3 accountIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKClinicalSharingSyncInfo;
  v8 = [(HKClinicalSharingSyncInfo *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    startDate = v8->_startDate;
    v8->_startDate = (NSDate *)v9;

    uint64_t v11 = [v7 copy];
    accountIdentifiers = v8->_accountIdentifiers;
    v8->_accountIdentifiers = (NSSet *)v11;
  }
  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_startDate hash];
  return [(NSSet *)self->_accountIdentifiers hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKClinicalSharingSyncInfo *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    id v6 = v4;
    objc_opt_class();
    BOOL v7 = (objc_opt_isKindOfClass() & 1) != 0
      && [(NSDate *)self->_startDate isEqualToDate:v6->_startDate]
      && [(NSSet *)self->_accountIdentifiers isEqualToSet:v6->_accountIdentifiers];
  }
  return v7;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  startDate = self->_startDate;
  id v6 = [(NSSet *)self->_accountIdentifiers allObjects];
  BOOL v7 = [v6 componentsJoinedByString:@", "];
  v8 = [v3 stringWithFormat:@"<%@:%p start: %@ accounts: [%@]>", v4, self, startDate, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  startDate = self->_startDate;
  id v5 = a3;
  [v5 encodeObject:startDate forKey:@"startDate"];
  [v5 encodeObject:self->_accountIdentifiers forKey:@"accoundIdentifiers"];
}

- (HKClinicalSharingSyncInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"accoundIdentifiers"];
    if (v9)
    {
      self = [(HKClinicalSharingSyncInfo *)self initWithStartDate:v5 accountIdentifiers:v9];
      v10 = self;
    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
      v10 = 0;
    }
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v10 = 0;
  }

  return v10;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSSet)accountIdentifiers
{
  return self->_accountIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifiers, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end