@interface LNAssistantDefinedSchemaValueType
+ (BOOL)supportsSecureCoding;
+ (id)objectClassesForCoding;
- (BOOL)isEqual:(id)a3;
- (Class)objectClass;
- (LNAssistantDefinedSchemaValueType)initWithCoder:(id)a3;
- (LNAssistantDefinedSchemaValueType)initWithIdentifier:(id)a3;
- (NSString)identifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNAssistantDefinedSchemaValueType

+ (id)objectClassesForCoding
{
  v2 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 arrayWithObject:v3];
}

- (void).cxx_destruct
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNAssistantDefinedSchemaValueType *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = [(LNAssistantDefinedSchemaValueType *)self identifier];
      v8 = [(LNAssistantDefinedSchemaValueType *)v6 identifier];
      id v9 = v7;
      id v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        char v12 = 1;
      }
      else
      {
        char v12 = 0;
        if (v9 && v10) {
          char v12 = [v9 isEqualToString:v10];
        }
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

- (unint64_t)hash
{
  v2 = [(LNAssistantDefinedSchemaValueType *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  v2 = NSString;
  unint64_t v3 = [(LNAssistantDefinedSchemaValueType *)self identifier];
  v4 = [v2 stringWithFormat:@"Entity<%@>", v3];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LNAssistantDefinedSchemaValueType *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];
}

- (LNAssistantDefinedSchemaValueType)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];

  if (v5)
  {
    self = [(LNAssistantDefinedSchemaValueType *)self initWithIdentifier:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (Class)objectClass
{
  return (Class)objc_opt_class();
}

- (LNAssistantDefinedSchemaValueType)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LNAssistantDefinedSchemaValueType;
  id v5 = [(LNValueType *)&v10 _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end