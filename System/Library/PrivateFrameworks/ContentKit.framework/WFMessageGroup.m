@interface WFMessageGroup
+ (BOOL)supportsSecureCoding;
+ (id)objectWithWFSerializedRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (NSString)name;
- (WFMessageGroup)initWithCoder:(id)a3;
- (WFMessageGroup)initWithName:(id)a3 identifier:(id)a4;
- (WFMessageGroup)initWithSpeakableString:(id)a3;
- (id)wfSerializedRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFMessageGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFMessageGroup *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(WFMessageGroup *)v4 identifier];
      v6 = [(WFMessageGroup *)self identifier];
      char v7 = [v5 isEqual:v6];
      if (v7) {
        goto LABEL_4;
      }
      v12 = [(WFMessageGroup *)v4 identifier];
      if (v12)
      {
        char v10 = 0;
LABEL_13:

        goto LABEL_14;
      }
      v11 = [(WFMessageGroup *)self identifier];
      if (!v11)
      {
LABEL_4:
        v8 = [(WFMessageGroup *)v4 name];
        v9 = [(WFMessageGroup *)self name];
        char v10 = [v8 isEqual:v9];

        if (v7)
        {
LABEL_14:

          goto LABEL_15;
        }
        v11 = 0;
      }
      else
      {
        char v10 = 0;
      }

      v12 = 0;
      goto LABEL_13;
    }
    char v10 = 0;
  }
LABEL_15:

  return v10;
}

- (unint64_t)hash
{
  v3 = [(WFMessageGroup *)self identifier];
  uint64_t v4 = [v3 hash];
  v5 = [(WFMessageGroup *)self name];
  unint64_t v6 = v4 ^ [v5 hash] ^ 0xA709;

  return v6;
}

- (id)wfSerializedRepresentation
{
  v3 = objc_opt_new();
  uint64_t v4 = [(WFMessageGroup *)self name];
  [v3 setObject:v4 forKey:@"name"];

  v5 = [(WFMessageGroup *)self identifier];
  [v3 setValue:v5 forKey:@"identifier"];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFMessageGroup *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  id v6 = [(WFMessageGroup *)self identifier];
  [v4 encodeObject:v6 forKey:@"identifier"];
}

- (WFMessageGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    self = [(WFMessageGroup *)self initWithName:v5 identifier:v6];

    char v7 = self;
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (WFMessageGroup)initWithSpeakableString:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    char v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"WFMessageGroup.m", 30, @"Invalid parameter not satisfying: %@", @"speakableString" object file lineNumber description];
  }
  id v6 = [v5 spokenPhrase];
  char v7 = [v5 vocabularyIdentifier];
  v8 = [(WFMessageGroup *)self initWithName:v6 identifier:v7];

  return v8;
}

- (WFMessageGroup)initWithName:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFMessageGroup.m", 18, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)WFMessageGroup;
  v9 = [(WFMessageGroup *)&v17 init];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    name = v9->_name;
    v9->_name = (NSString *)v10;

    uint64_t v12 = [v8 copy];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v12;

    v14 = v9;
  }

  return v9;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (!v6)
  {
LABEL_12:
    uint64_t v12 = 0;
    goto LABEL_17;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v10 = getWFGeneralLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      int v15 = 136315906;
      v16 = "WFEnforceClass";
      __int16 v17 = 2114;
      id v18 = v6;
      __int16 v19 = 2114;
      id v20 = (id)objc_opt_class();
      __int16 v21 = 2114;
      uint64_t v22 = v5;
      id v11 = v20;
      _os_log_impl(&dword_216505000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v15, 0x2Au);
    }
    goto LABEL_12;
  }
  id v7 = [v6 objectForKey:@"name"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = [v6 objectForKey:@"identifier"];
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v9 = v8;
      }
      else {
        v9 = 0;
      }
    }
    else
    {
      v9 = 0;
    }
    id v13 = v9;

    uint64_t v12 = (void *)[objc_alloc((Class)a1) initWithName:v7 identifier:v13];
  }
  else
  {
    uint64_t v12 = 0;
  }

LABEL_17:
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end