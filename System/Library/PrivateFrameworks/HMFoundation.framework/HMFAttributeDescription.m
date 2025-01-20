@interface HMFAttributeDescription
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMFAttributeDescription)init;
- (HMFAttributeDescription)initWithName:(id)a3 value:(id)a4;
- (HMFAttributeDescription)initWithName:(id)a3 value:(id)a4 options:(unint64_t)a5 formatter:(id)a6;
- (NSFormatter)formatter;
- (NSObject)value;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)name;
- (NSString)privateDescription;
- (NSString)shortDescription;
- (unint64_t)hash;
- (unint64_t)options;
@end

@implementation HMFAttributeDescription

- (NSObject)value
{
  return self->_value;
}

- (NSString)name
{
  return self->_name;
}

- (NSFormatter)formatter
{
  return self->_formatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (HMFAttributeDescription)initWithName:(id)a3 value:(id)a4 options:(unint64_t)a5 formatter:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([v10 length])
  {
    v18.receiver = self;
    v18.super_class = (Class)HMFAttributeDescription;
    v13 = [(HMFAttributeDescription *)&v18 init];
    if (v13)
    {
      uint64_t v14 = [v10 capitalizedString];
      name = v13->_name;
      v13->_name = (NSString *)v14;

      objc_storeStrong((id *)&v13->_value, a4);
      v13->_options = a5;
      objc_storeStrong((id *)&v13->_formatter, a6);
    }
    self = v13;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSString)privateDescription
{
  char v3 = [(HMFAttributeDescription *)self options] | 2;
  return (NSString *)HMFAttributeDescriptionDescriptionWithOptions(self, v3);
}

- (NSString)description
{
  char v3 = [(HMFAttributeDescription *)self options];
  return (NSString *)HMFAttributeDescriptionDescriptionWithOptions(self, v3);
}

- (unint64_t)options
{
  return self->_options;
}

- (HMFAttributeDescription)initWithName:(id)a3 value:(id)a4
{
  return [(HMFAttributeDescription *)self initWithName:a3 value:a4 options:0 formatter:0];
}

- (HMFAttributeDescription)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (unint64_t)hash
{
  v2 = [(HMFAttributeDescription *)self name];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMFAttributeDescription *)a3;
  if (self == v4)
  {
    char v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (!v6) {
      goto LABEL_10;
    }
    id v7 = [(HMFAttributeDescription *)self name];
    v8 = [(HMFAttributeDescription *)v6 name];
    int v9 = [v7 isEqualToString:v8];

    if (!v9) {
      goto LABEL_10;
    }
    id v10 = [(HMFAttributeDescription *)self value];
    id v11 = [(HMFAttributeDescription *)v6 value];
    char v12 = [v10 isEqual:v11];

    if (v12) {
      goto LABEL_10;
    }
    unint64_t v13 = [(HMFAttributeDescription *)self options];
    if (v13 == [(HMFAttributeDescription *)v6 options])
    {
      uint64_t v14 = [(HMFAttributeDescription *)self formatter];
      v15 = [(HMFAttributeDescription *)v6 formatter];
      char v16 = HMFEqualObjects(v14, v15);
    }
    else
    {
LABEL_10:
      char v16 = 0;
    }
  }
  return v16;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)shortDescription
{
  char v3 = [(HMFAttributeDescription *)self options] | 1;
  return (NSString *)HMFAttributeDescriptionDescriptionWithOptions(self, v3);
}

- (NSString)debugDescription
{
  return (NSString *)HMFAttributeDescriptionDescriptionWithOptions(self, 0);
}

@end