@interface HKSemanticDate
+ (BOOL)supportsSecureCoding;
+ (HKSemanticDate)semanticDateWithKeyPath:(id)a3 date:(id)a4;
- (BOOL)isEqual:(id)a3;
- (HKSemanticDate)init;
- (HKSemanticDate)initWithCoder:(id)a3;
- (HKSemanticDate)initWithKeyPath:(id)a3 date:(id)a4;
- (NSDate)date;
- (NSString)keyPath;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSemanticDate

+ (HKSemanticDate)semanticDateWithKeyPath:(id)a3 date:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithKeyPath:v6 date:v5];

  return (HKSemanticDate *)v7;
}

- (HKSemanticDate)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKSemanticDate)initWithKeyPath:(id)a3 date:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HKSemanticDate.m", 32, @"Invalid parameter not satisfying: %@", @"keyPath" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"HKSemanticDate.m", 33, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)HKSemanticDate;
  v10 = [(HKSemanticDate *)&v18 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    keyPath = v10->_keyPath;
    v10->_keyPath = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    date = v10->_date;
    v10->_date = (NSDate *)v13;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKSemanticDate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKSemanticDate;
  id v5 = [(HKSemanticDate *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"KeyPath"];
    keyPath = v5->_keyPath;
    v5->_keyPath = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Date"];
    date = v5->_date;
    v5->_date = (NSDate *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HKSemanticDate *)self keyPath];
  [v4 encodeObject:v5 forKey:@"KeyPath"];

  id v6 = [(HKSemanticDate *)self date];
  [v4 encodeObject:v6 forKey:@"Date"];
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  id v7 = v6;
  if (v6 && ([v6 date], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    v10 = [(HKSemanticDate *)self date];
    int64_t v11 = [v10 compare:v9];
  }
  else
  {
    int64_t v11 = 1;
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(HKSemanticDate *)self keyPath];
  uint64_t v4 = [v3 hash];
  id v5 = [(HKSemanticDate *)self date];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKSemanticDate *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      unint64_t v6 = [(HKSemanticDate *)self keyPath];
      id v7 = [(HKSemanticDate *)v5 keyPath];
      int v8 = [v6 isEqualToString:v7];

      if (v8)
      {
        v9 = [(HKSemanticDate *)self date];
        v10 = [(HKSemanticDate *)v5 date];
        char v11 = [v9 isEqualToDate:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end