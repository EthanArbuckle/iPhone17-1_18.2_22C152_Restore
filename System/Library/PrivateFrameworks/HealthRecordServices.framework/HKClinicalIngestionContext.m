@interface HKClinicalIngestionContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKClinicalAccountConnectionInformation)accountInformation;
- (HKClinicalIngestionContext)init;
- (HKClinicalIngestionContext)initWithAccountConnectionInformation:(id)a3 queryMode:(int64_t)a4 options:(unint64_t)a5 lastFetchDate:(id)a6;
- (HKClinicalIngestionContext)initWithCoder:(id)a3;
- (NSDate)lastFetchDate;
- (int64_t)queryMode;
- (unint64_t)hash;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKClinicalIngestionContext

- (HKClinicalIngestionContext)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKClinicalIngestionContext)initWithAccountConnectionInformation:(id)a3 queryMode:(int64_t)a4 options:(unint64_t)a5 lastFetchDate:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HKClinicalIngestionContext;
  v12 = [(HKClinicalIngestionContext *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    accountInformation = v12->_accountInformation;
    v12->_accountInformation = (HKClinicalAccountConnectionInformation *)v13;

    v12->_queryMode = a4;
    v12->_options = a5;
    uint64_t v15 = [v11 copy];
    lastFetchDate = v12->_lastFetchDate;
    v12->_lastFetchDate = (NSDate *)v15;
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  accountInformation = self->_accountInformation;
  id v5 = a3;
  [v5 encodeObject:accountInformation forKey:@"AccountInformation"];
  [v5 encodeInteger:self->_queryMode forKey:@"QueryMode"];
  [v5 encodeInteger:self->_options forKey:@"Options"];
  [v5 encodeObject:self->_lastFetchDate forKey:@"LastFetchDate"];
}

- (HKClinicalIngestionContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AccountInformation"];
  if (v5
    && [v4 containsValueForKey:@"QueryMode"]
    && ([v4 containsValueForKey:@"Options"] & 1) != 0)
  {
    uint64_t v6 = [v4 decodeIntegerForKey:@"QueryMode"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastFetchDate"];
    self = -[HKClinicalIngestionContext initWithAccountConnectionInformation:queryMode:options:lastFetchDate:](self, "initWithAccountConnectionInformation:queryMode:options:lastFetchDate:", v5, v6, [v4 decodeIntegerForKey:@"Options"], v7);

    v8 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = self->_queryMode ^ [(HKClinicalAccountConnectionInformation *)self->_accountInformation hash];
  return v3 ^ [(NSDate *)self->_lastFetchDate hash] ^ self->_options;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (HKClinicalIngestionContext *)a3;
  v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v14 = 0;
LABEL_22:

      goto LABEL_23;
    }
    accountInformation = self->_accountInformation;
    id v10 = [(HKClinicalIngestionContext *)v8 accountInformation];
    if (accountInformation == v10)
    {
      int64_t queryMode = self->_queryMode;
      if (queryMode == [(HKClinicalIngestionContext *)v8 queryMode]) {
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v11 = [(HKClinicalIngestionContext *)v8 accountInformation];
      if (v11)
      {
        unint64_t v3 = (void *)v11;
        v12 = self->_accountInformation;
        id v4 = [(HKClinicalIngestionContext *)v8 accountInformation];
        if (![(HKClinicalAccountConnectionInformation *)v12 isEqual:v4]
          || (int64_t v13 = self->_queryMode, v13 != [(HKClinicalIngestionContext *)v8 queryMode]))
        {
          BOOL v14 = 0;
LABEL_20:

          goto LABEL_21;
        }
LABEL_11:
        lastFetchDate = self->_lastFetchDate;
        uint64_t v17 = [(HKClinicalIngestionContext *)v8 lastFetchDate];
        if (lastFetchDate == (NSDate *)v17)
        {
          unint64_t options = self->_options;
          BOOL v14 = options == [(HKClinicalIngestionContext *)v8 options];
        }
        else
        {
          objc_super v18 = (void *)v17;
          uint64_t v19 = [(HKClinicalIngestionContext *)v8 lastFetchDate];
          if (v19)
          {
            v20 = (void *)v19;
            v21 = self->_lastFetchDate;
            uint64_t v22 = [(HKClinicalIngestionContext *)v8 lastFetchDate];
            v23 = v21;
            v24 = (void *)v22;
            if ([(NSDate *)v23 isEqual:v22])
            {
              unint64_t v25 = self->_options;
              BOOL v14 = v25 == [(HKClinicalIngestionContext *)v8 options];

              goto LABEL_19;
            }
          }
          BOOL v14 = 0;
        }
LABEL_19:
        if (accountInformation != v10) {
          goto LABEL_20;
        }
LABEL_21:

        goto LABEL_22;
      }
    }
    BOOL v14 = 0;
    goto LABEL_21;
  }
  BOOL v14 = 1;
LABEL_23:

  return v14;
}

- (HKClinicalAccountConnectionInformation)accountInformation
{
  return self->_accountInformation;
}

- (int64_t)queryMode
{
  return self->_queryMode;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSDate)lastFetchDate
{
  return self->_lastFetchDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFetchDate, 0);

  objc_storeStrong((id *)&self->_accountInformation, 0);
}

@end