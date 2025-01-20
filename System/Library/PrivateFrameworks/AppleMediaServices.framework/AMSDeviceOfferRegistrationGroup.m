@interface AMSDeviceOfferRegistrationGroup
- (AMSDeviceOfferRegistrationGroup)initWithDatabaseEntry:(id)a3;
- (AMSDeviceOfferRegistrationGroup)initWithRegistrationItems:(id)a3;
- (BOOL)_serialsMatchSerialsFromGroup:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRegistrationGroup:(id)a3;
- (BOOL)isModifiedVersionOfGroup:(id)a3;
- (NSArray)registrationItems;
- (NSString)description;
- (id)_initWithRegistrationItems:(id)a3 validationOptions:(unint64_t)a4;
- (id)serializeToDictionary;
- (unint64_t)hash;
- (unint64_t)validationOptions;
- (void)setValidationOptions:(unint64_t)a3;
@end

@implementation AMSDeviceOfferRegistrationGroup

- (AMSDeviceOfferRegistrationGroup)initWithDatabaseEntry:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"registrationItems"];
  v6 = objc_msgSend(v5, "ams_mapWithTransform:", &__block_literal_global_42);
  v7 = [v4 objectForKeyedSubscript:@"validationOptions"];

  if (v7) {
    uint64_t v8 = [v7 unsignedIntegerValue];
  }
  else {
    uint64_t v8 = 0;
  }
  v9 = [(AMSDeviceOfferRegistrationGroup *)self _initWithRegistrationItems:v6 validationOptions:v8];

  return v9;
}

AMSDeviceOfferRegistrationItem *__57__AMSDeviceOfferRegistrationGroup_initWithDatabaseEntry___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[AMSDeviceOfferRegistrationItem alloc] initWithDatabaseEntry:v2];

  return v3;
}

- (AMSDeviceOfferRegistrationGroup)initWithRegistrationItems:(id)a3
{
  return (AMSDeviceOfferRegistrationGroup *)[(AMSDeviceOfferRegistrationGroup *)self _initWithRegistrationItems:a3 validationOptions:0];
}

- (id)_initWithRegistrationItems:(id)a3 validationOptions:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSDeviceOfferRegistrationGroup;
  uint64_t v8 = [(AMSDeviceOfferRegistrationGroup *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_registrationItems, a3);
    v9->_validationOptions = a4;
  }

  return v9;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = [(AMSDeviceOfferRegistrationGroup *)self registrationItems];
  v5 = [v3 stringWithFormat:@"{items:%@ validationOptions:%lu}", v4, -[AMSDeviceOfferRegistrationGroup validationOptions](self, "validationOptions")];

  return (NSString *)v5;
}

- (id)serializeToDictionary
{
  v3 = objc_opt_new();
  id v4 = [(AMSDeviceOfferRegistrationGroup *)self registrationItems];
  v5 = objc_msgSend(v4, "ams_mapWithTransform:", &__block_literal_global_12_1);
  [v3 setObject:v5 forKeyedSubscript:@"registrationItems"];

  v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[AMSDeviceOfferRegistrationGroup validationOptions](self, "validationOptions"));
  [v3 setObject:v6 forKeyedSubscript:@"validationOptions"];

  id v7 = (void *)[v3 copy];
  return v7;
}

uint64_t __56__AMSDeviceOfferRegistrationGroup_serializeToDictionary__block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeToDictionary];
}

- (unint64_t)hash
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(AMSDeviceOfferRegistrationGroup *)self validationOptions];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(AMSDeviceOfferRegistrationGroup *)self registrationItems];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v3 ^= [*(id *)(*((void *)&v10 + 1) + 8 * v8++) hash];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AMSDeviceOfferRegistrationGroup *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    BOOL v6 = v5 == objc_opt_class()
      && [(AMSDeviceOfferRegistrationGroup *)self isEqualToRegistrationGroup:v4];
  }

  return v6;
}

- (BOOL)isEqualToRegistrationGroup:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(AMSDeviceOfferRegistrationGroup *)self validationOptions];
  if (v5 == [v4 validationOptions])
  {
    BOOL v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = [(AMSDeviceOfferRegistrationGroup *)self registrationItems];
    uint64_t v8 = [v6 setWithArray:v7];
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    long long v10 = [v4 registrationItems];
    long long v11 = [v9 setWithArray:v10];
    char v12 = [v8 isEqualToSet:v11];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)isModifiedVersionOfGroup:(id)a3
{
  id v4 = a3;
  if ([(AMSDeviceOfferRegistrationGroup *)self _serialsMatchSerialsFromGroup:v4]) {
    BOOL v5 = ![(AMSDeviceOfferRegistrationGroup *)self isEqual:v4];
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)_serialsMatchSerialsFromGroup:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  BOOL v6 = [(AMSDeviceOfferRegistrationGroup *)self registrationItems];
  uint64_t v7 = objc_msgSend(v6, "ams_mapWithTransform:", &__block_literal_global_17_0);
  uint64_t v8 = [v4 setWithArray:v7];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  long long v10 = [v5 registrationItems];

  long long v11 = objc_msgSend(v10, "ams_mapWithTransform:", &__block_literal_global_19);
  char v12 = [v9 setWithArray:v11];

  LOBYTE(v11) = [v8 isEqualToSet:v12];
  return (char)v11;
}

uint64_t __65__AMSDeviceOfferRegistrationGroup__serialsMatchSerialsFromGroup___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serialNumber];
}

uint64_t __65__AMSDeviceOfferRegistrationGroup__serialsMatchSerialsFromGroup___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serialNumber];
}

- (NSArray)registrationItems
{
  return self->_registrationItems;
}

- (unint64_t)validationOptions
{
  return self->_validationOptions;
}

- (void)setValidationOptions:(unint64_t)a3
{
  self->_validationOptions = a3;
}

- (void).cxx_destruct
{
}

@end