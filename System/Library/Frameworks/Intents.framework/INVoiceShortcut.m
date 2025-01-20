@interface INVoiceShortcut
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INShortcut)shortcut;
- (INVoiceShortcut)initWithCoder:(id)a3;
- (INVoiceShortcut)initWithIntent:(id)a3;
- (INVoiceShortcut)initWithUserActivity:(id)a3;
- (NSString)invocationPhrase;
- (NSUUID)identifier;
- (id)_initWithIdentifier:(id)a3 invocationPhrase:(id)a4 shortcut:(id)a5;
- (id)_initWithVCVoiceShortcut:(id)a3;
- (id)description;
- (id)intent;
- (id)userActivity;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INVoiceShortcut

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcut, 0);
  objc_storeStrong((id *)&self->_invocationPhrase, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (INShortcut)shortcut
{
  return self->_shortcut;
}

- (NSString)invocationPhrase
{
  return self->_invocationPhrase;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(INVoiceShortcut *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(INVoiceShortcut *)self invocationPhrase];
  [v4 encodeObject:v6 forKey:@"invocationPhrase"];

  id v7 = [(INVoiceShortcut *)self shortcut];
  [v4 encodeObject:v7 forKey:@"shortcut"];
}

- (INVoiceShortcut)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)INVoiceShortcut;
  v5 = [(INVoiceShortcut *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"invocationPhrase"];
    invocationPhrase = v5->_invocationPhrase;
    v5->_invocationPhrase = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortcut"];
    shortcut = v5->_shortcut;
    v5->_shortcut = (INShortcut *)v13;

    v15 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INVoiceShortcut *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(INVoiceShortcut *)self identifier];
      id v7 = [(INVoiceShortcut *)v5 identifier];
      if ([v6 isEqual:v7])
      {
        v8 = [(INVoiceShortcut *)self invocationPhrase];
        uint64_t v9 = [(INVoiceShortcut *)v5 invocationPhrase];
        if ([v8 isEqual:v9])
        {
          v10 = [(INVoiceShortcut *)self shortcut];
          uint64_t v11 = [(INVoiceShortcut *)v5 shortcut];
          char v12 = [v10 isEqual:v11];
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p id: %@, phrase: %@, shortcut: %@>", v5, self, self->_identifier, self->_invocationPhrase, self->_shortcut];

  return v6;
}

- (id)_initWithVCVoiceShortcut:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 phrase];
  id v6 = objc_alloc(MEMORY[0x1E4F29128]);
  id v7 = [v4 identifier];
  v8 = (void *)[v6 initWithUUIDString:v7];

  uint64_t v9 = [v4 shortcut];
  if (v9)
  {
    self = (INVoiceShortcut *)[(INVoiceShortcut *)self _initWithIdentifier:v8 invocationPhrase:v5 shortcut:v9];
    v10 = self;
  }
  else
  {
    uint64_t v11 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315394;
      v14 = "-[INVoiceShortcut _initWithVCVoiceShortcut:]";
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_error_impl(&dword_18CB2F000, v11, OS_LOG_TYPE_ERROR, "%s Unexpectedly got nil INShortcut for voice shortcut %@", (uint8_t *)&v13, 0x16u);
    }
    v10 = 0;
  }

  return v10;
}

- (id)_initWithIdentifier:(id)a3 invocationPhrase:(id)a4 shortcut:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)INVoiceShortcut;
  char v12 = [(INVoiceShortcut *)&v17 init];
  int v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    uint64_t v14 = [v10 copy];
    invocationPhrase = v13->_invocationPhrase;
    v13->_invocationPhrase = (NSString *)v14;

    objc_storeStrong((id *)&v13->_shortcut, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)userActivity
{
  v2 = [(INVoiceShortcut *)self shortcut];
  v3 = [v2 userActivity];

  return v3;
}

- (id)intent
{
  v2 = [(INVoiceShortcut *)self shortcut];
  v3 = [v2 intent];

  return v3;
}

- (INVoiceShortcut)initWithUserActivity:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INVoiceShortcut;
  v5 = [(INVoiceShortcut *)&v10 init];
  if (v5)
  {
    id v6 = [[INShortcut alloc] initWithUserActivity:v4];
    shortcut = v5->_shortcut;
    v5->_shortcut = v6;

    v8 = v5;
  }

  return v5;
}

- (INVoiceShortcut)initWithIntent:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INVoiceShortcut;
  v5 = [(INVoiceShortcut *)&v10 init];
  if (v5)
  {
    id v6 = [[INShortcut alloc] initWithIntent:v4];
    shortcut = v5->_shortcut;
    v5->_shortcut = v6;

    v8 = v5;
  }

  return v5;
}

@end