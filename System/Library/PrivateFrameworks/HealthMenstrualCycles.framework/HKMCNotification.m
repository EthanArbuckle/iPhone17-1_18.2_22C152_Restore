@interface HKMCNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKMCNotification)initWithCategory:(id)a3 dueDateComponents:(id)a4;
- (HKMCNotification)initWithCoder:(id)a3;
- (NSDateComponents)dueDateComponents;
- (NSString)category;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCategory:(id)a3;
- (void)setDueDateComponents:(id)a3;
@end

@implementation HKMCNotification

- (HKMCNotification)initWithCategory:(id)a3 dueDateComponents:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKMCNotification;
  v8 = [(HKMCNotification *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    category = v8->_category;
    v8->_category = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    dueDateComponents = v8->_dueDateComponents;
    v8->_dueDateComponents = (NSDateComponents *)v11;
  }
  return v8;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %@ %@>", objc_opt_class(), self->_category, self->_dueDateComponents];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKMCNotification *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      category = self->_category;
      id v7 = [(HKMCNotification *)v5 category];
      if ([(NSString *)category isEqualToString:v7])
      {
        dueDateComponents = self->_dueDateComponents;
        uint64_t v9 = [(HKMCNotification *)v5 dueDateComponents];
        char v10 = [(NSDateComponents *)dueDateComponents isEqual:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  category = self->_category;
  id v5 = a3;
  [v5 encodeObject:category forKey:@"Category"];
  [v5 encodeObject:self->_dueDateComponents forKey:@"DueDateComponents"];
}

- (HKMCNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKMCNotification;
  id v5 = [(HKMCNotification *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Category"];
    category = v5->_category;
    v5->_category = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DueDateComponents"];
    dueDateComponents = v5->_dueDateComponents;
    v5->_dueDateComponents = (NSDateComponents *)v8;
  }
  return v5;
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (NSDateComponents)dueDateComponents
{
  return self->_dueDateComponents;
}

- (void)setDueDateComponents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dueDateComponents, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

@end