@interface INVoiceCommandStepInfo
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INVoiceCommandStepInfo)initWithApplicationIdentifier:(id)a3 category:(int64_t)a4 name:(id)a5;
- (INVoiceCommandStepInfo)initWithCoder:(id)a3;
- (NSString)applicationIdentifier;
- (NSString)description;
- (NSString)name;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)category;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INVoiceCommandStepInfo

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INVoiceCommandStepInfo;
  v6 = [(INVoiceCommandStepInfo *)&v11 description];
  v7 = [(INVoiceCommandStepInfo *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)category
{
  return self->_category;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (id)_dictionaryRepresentation
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10[0] = @"applicationIdentifier";
  applicationIdentifier = self->_applicationIdentifier;
  v4 = applicationIdentifier;
  if (!applicationIdentifier)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[0] = v4;
  v10[1] = @"category";
  v5 = [NSNumber numberWithInteger:self->_category];
  v11[1] = v5;
  v10[2] = @"name";
  name = self->_name;
  v7 = name;
  if (!name)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[2] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  if (!name) {

  }
  if (!applicationIdentifier) {

  }
  return v8;
}

- (NSString)description
{
  return (NSString *)[(INVoiceCommandStepInfo *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_applicationIdentifier];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"applicationIdentifier");

  unint64_t v9 = self->_category - 1;
  if (v9 > 0x13) {
    v10 = @"unknown";
  }
  else {
    v10 = off_1E551EA00[v9];
  }
  objc_super v11 = v10;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"category");

  v12 = [v6 encodeObject:self->_name];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"name");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  applicationIdentifier = self->_applicationIdentifier;
  id v5 = a3;
  [v5 encodeObject:applicationIdentifier forKey:@"applicationIdentifier"];
  [v5 encodeInteger:self->_category forKey:@"category"];
  [v5 encodeObject:self->_name forKey:@"name"];
}

- (INVoiceCommandStepInfo)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"applicationIdentifier"];

  uint64_t v9 = [v5 decodeIntegerForKey:@"category"];
  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v13 = [v5 decodeObjectOfClasses:v12 forKey:@"name"];

  v14 = [(INVoiceCommandStepInfo *)self initWithApplicationIdentifier:v8 category:v9 name:v13];
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (INVoiceCommandStepInfo *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      applicationIdentifier = self->_applicationIdentifier;
      BOOL v8 = 0;
      if ((applicationIdentifier == v5->_applicationIdentifier
         || -[NSString isEqual:](applicationIdentifier, "isEqual:"))
        && self->_category == v5->_category)
      {
        name = self->_name;
        if (name == v5->_name || -[NSString isEqual:](name, "isEqual:")) {
          BOOL v8 = 1;
        }
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_applicationIdentifier hash];
  v4 = [NSNumber numberWithInteger:self->_category];
  uint64_t v5 = [v4 hash];
  NSUInteger v6 = v5 ^ v3 ^ [(NSString *)self->_name hash];

  return v6;
}

- (INVoiceCommandStepInfo)initWithApplicationIdentifier:(id)a3 category:(int64_t)a4 name:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)INVoiceCommandStepInfo;
  v10 = [(INVoiceCommandStepInfo *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    applicationIdentifier = v10->_applicationIdentifier;
    v10->_applicationIdentifier = (NSString *)v11;

    v10->_category = a4;
    uint64_t v13 = [v9 copy];
    name = v10->_name;
    v10->_name = (NSString *)v13;
  }
  return v10;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v6 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v6 objectForKeyedSubscript:@"applicationIdentifier"];
    id v8 = [v6 objectForKeyedSubscript:@"category"];
    uint64_t v9 = INIntentCategoryWithString(v8);

    v10 = [v6 objectForKeyedSubscript:@"name"];
    uint64_t v11 = (void *)[objc_alloc((Class)a1) initWithApplicationIdentifier:v7 category:v9 name:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end