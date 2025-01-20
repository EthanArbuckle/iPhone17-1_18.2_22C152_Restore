@interface HKVerifiableHealthRecordsParsingResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKVerifiableHealthRecordsParsingResult)init;
- (HKVerifiableHealthRecordsParsingResult)initWithCoder:(id)a3;
- (HKVerifiableHealthRecordsParsingResult)initWithOptions:(unint64_t)a3 localizedTypeDisplayNames:(id)a4;
- (NSArray)localizedTypeDisplayNames;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKVerifiableHealthRecordsParsingResult

- (HKVerifiableHealthRecordsParsingResult)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKVerifiableHealthRecordsParsingResult)initWithOptions:(unint64_t)a3 localizedTypeDisplayNames:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKVerifiableHealthRecordsParsingResult;
  v7 = [(HKVerifiableHealthRecordsParsingResult *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_options = a3;
    uint64_t v9 = [v6 copy];
    localizedTypeDisplayNames = v8->_localizedTypeDisplayNames;
    v8->_localizedTypeDisplayNames = (NSArray *)v9;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKVerifiableHealthRecordsParsingResult *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    id v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (unint64_t options = self->_options, options == [(HKVerifiableHealthRecordsParsingResult *)v6 options]))
    {
      localizedTypeDisplayNames = self->_localizedTypeDisplayNames;
      uint64_t v9 = [(HKVerifiableHealthRecordsParsingResult *)v6 localizedTypeDisplayNames];
      if (localizedTypeDisplayNames == v9)
      {
        char v13 = 1;
      }
      else
      {
        v10 = [(HKVerifiableHealthRecordsParsingResult *)v6 localizedTypeDisplayNames];
        if (v10)
        {
          v11 = self->_localizedTypeDisplayNames;
          objc_super v12 = [(HKVerifiableHealthRecordsParsingResult *)v6 localizedTypeDisplayNames];
          char v13 = [(NSArray *)v11 isEqualToArray:v12];
        }
        else
        {
          char v13 = 0;
        }
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t options = self->_options;
  id v5 = a3;
  [v5 encodeInteger:options forKey:@"options"];
  [v5 encodeObject:self->_localizedTypeDisplayNames forKey:@"localizedTypeDisplayNames"];
}

- (HKVerifiableHealthRecordsParsingResult)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"options"])
  {
    uint64_t v5 = [v4 decodeIntegerForKey:@"options"];
    id v6 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
    v7 = [v4 decodeObjectOfClasses:v6 forKey:@"localizedTypeDisplayNames"];
    v8 = [[HKVerifiableHealthRecordsParsingResult alloc] initWithOptions:v5 localizedTypeDisplayNames:v7];
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v8 = 0;
  }

  return v8;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSArray)localizedTypeDisplayNames
{
  return self->_localizedTypeDisplayNames;
}

- (void).cxx_destruct
{
}

@end