@interface HKSignedClinicalDataParsingResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKSignedClinicalDataParsingResult)init;
- (HKSignedClinicalDataParsingResult)initWithCoder:(id)a3;
- (HKSignedClinicalDataParsingResult)initWithItems:(id)a3 options:(unint64_t)a4;
- (NSArray)items;
- (id)copyWithItems:(id)a3;
- (unint64_t)hash;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSignedClinicalDataParsingResult

- (HKSignedClinicalDataParsingResult)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKSignedClinicalDataParsingResult)initWithItems:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKSignedClinicalDataParsingResult;
  v7 = [(HKSignedClinicalDataParsingResult *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    items = v7->_items;
    v7->_items = (NSArray *)v8;

    v7->_options = a4;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  items = self->_items;
  id v5 = a3;
  [v5 encodeObject:items forKey:@"Items"];
  [v5 encodeInteger:self->_options forKey:@"Options"];
}

- (HKSignedClinicalDataParsingResult)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
  id v6 = [v4 decodeObjectOfClasses:v5 forKey:@"Items"];
  if (v6 && ([v4 containsValueForKey:@"Options"] & 1) != 0)
  {
    self = -[HKSignedClinicalDataParsingResult initWithItems:options:](self, "initWithItems:options:", v6, [v4 decodeIntegerForKey:@"Options"]);
    v7 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v7 = 0;
  }

  return v7;
}

- (id)copyWithItems:(id)a3
{
  id v4 = a3;
  id v5 = [[HKSignedClinicalDataParsingResult alloc] initWithItems:v4 options:self->_options];

  return v5;
}

- (unint64_t)hash
{
  return self->_options ^ [(NSArray *)self->_items hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKSignedClinicalDataParsingResult *)a3;
  id v5 = v4;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      items = self->_items;
      uint64_t v8 = [(HKSignedClinicalDataParsingResult *)v6 items];
      if (items == v8)
      {
        unint64_t options = self->_options;
        BOOL v13 = options == [(HKSignedClinicalDataParsingResult *)v6 options];
      }
      else
      {
        v9 = [(HKSignedClinicalDataParsingResult *)v6 items];
        if (v9)
        {
          v10 = self->_items;
          objc_super v11 = [(HKSignedClinicalDataParsingResult *)v6 items];
          if ([(NSArray *)v10 isEqualToArray:v11])
          {
            unint64_t v12 = self->_options;
            BOOL v13 = v12 == [(HKSignedClinicalDataParsingResult *)v6 options];
          }
          else
          {
            BOOL v13 = 0;
          }
        }
        else
        {
          BOOL v13 = 0;
        }
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  return v13;
}

- (NSArray)items
{
  return self->_items;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
}

@end