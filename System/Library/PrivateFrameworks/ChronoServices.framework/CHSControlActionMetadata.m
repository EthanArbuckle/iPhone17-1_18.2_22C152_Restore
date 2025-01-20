@interface CHSControlActionMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isCameraCapture;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLauncher;
- (CHSControlActionMetadata)init;
- (CHSControlActionMetadata)initWithCoder:(id)a3;
- (CHSControlActionMetadata)initWithIntentType:(id)a3;
- (NSString)description;
- (NSString)intentType;
- (NSString)rawIntentType;
- (id)_initWithMetadata:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSControlActionMetadata

- (CHSControlActionMetadata)init
{
  return [(CHSControlActionMetadata *)self initWithIntentType:0];
}

- (CHSControlActionMetadata)initWithIntentType:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSControlActionMetadata;
  v5 = [(CHSControlActionMetadata *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    intentType = v5->_intentType;
    v5->_intentType = (NSString *)v6;
  }
  return v5;
}

- (id)_initWithMetadata:(id)a3
{
  id v4 = a3;
  v5 = [(CHSControlActionMetadata *)self initWithIntentType:*((void *)v4 + 1)];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_isLauncher = *((unsigned char *)v4 + 16);
    v5->_isCameraCapture = *((unsigned char *)v4 + 17);
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)[(CHSControlActionMetadata *)self descriptionWithMultilinePrefix:0];
}

- (NSString)rawIntentType
{
  BOOL v3 = [(NSString *)self->_intentType hasPrefix:@"appintent:"];
  intentType = self->_intentType;
  if (v3)
  {
    v5 = -[NSString substringFromIndex:](intentType, "substringFromIndex:", [@"appintent:" length]);
  }
  else
  {
    v5 = (void *)[(NSString *)intentType copy];
  }
  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CHSControlActionMetadata *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (BSEqualStrings() && BSEqualBools()) {
        char v6 = BSEqualBools();
      }
      else {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_intentType hash] + 19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_intentType forKey:@"intentType"];
  [v4 encodeBool:self->_isLauncher forKey:@"isLauncher"];
  [v4 encodeBool:self->_isCameraCapture forKey:@"isCameraCapture"];
}

- (CHSControlActionMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intentType"];
  if (v5)
  {
    char v6 = [(CHSControlActionMetadata *)self initWithIntentType:v5];
    if (v6)
    {
      v6->_isLauncher = [v4 decodeBoolForKey:@"isLauncher"];
      v6->_isCameraCapture = [v4 decodeBoolForKey:@"isCameraCapture"];
    }
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)succinctDescription
{
  v2 = [(CHSControlActionMetadata *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  BOOL v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__CHSControlActionMetadata_succinctDescriptionBuilder__block_invoke;
  v7[3] = &unk_1E56C81F0;
  id v4 = v3;
  id v8 = v4;
  objc_super v9 = self;
  [v4 appendProem:self block:v7];
  id v5 = v4;

  return v5;
}

id __54__CHSControlActionMetadata_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 8) withName:@"intentType"];
  id v2 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 16) withName:@"isLauncher"];
  return (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 17) withName:@"isCameraCapture"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(CHSControlActionMetadata *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(CHSControlActionMetadata *)self succinctDescriptionBuilder];
  return v3;
}

- (NSString)intentType
{
  return self->_intentType;
}

- (BOOL)isLauncher
{
  return self->_isLauncher;
}

- (BOOL)isCameraCapture
{
  return self->_isCameraCapture;
}

- (void).cxx_destruct
{
}

@end