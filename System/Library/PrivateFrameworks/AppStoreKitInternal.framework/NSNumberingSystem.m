@interface NSNumberingSystem
+ (id)numberingSystemWithNumberingSystemName:(const char *)a3;
- (BOOL)isAlgorithmic;
- (BOOL)isEqual:(id)a3;
- (NSNumberingSystem)init;
- (NSNumberingSystem)initWithIdentifier:(id)a3 isAlgorithmic:(BOOL)a4 radix:(int64_t)a5 descriptor:(id)a6;
- (NSNumberingSystem)initWithLocaleIdentifier:(id)a3;
- (NSNumberingSystem)initWithNumberingSystemIdentifier:(id)a3;
- (NSString)descriptor;
- (NSString)identifier;
- (int64_t)radix;
- (unint64_t)hash;
- (void)setDescriptor:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsAlgorithmic:(BOOL)a3;
- (void)setRadix:(int64_t)a3;
@end

@implementation NSNumberingSystem

+ (id)numberingSystemWithNumberingSystemName:(const char *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = unumsys_openByName();
  v6 = [NSString stringWithCharacters:v11 length:(int)unumsys_getDescription()];
  int v7 = MEMORY[0x1E4E54AA0](v4);
  int v8 = MEMORY[0x1E4E54A90](v4);
  v9 = [NSString stringWithUTF8String:a3];
  v10 = [[NSNumberingSystem alloc] initWithIdentifier:v9 isAlgorithmic:v7 != 0 radix:v8 descriptor:v6];
  unumsys_close();

  return v10;
}

- (NSNumberingSystem)initWithIdentifier:(id)a3 isAlgorithmic:(BOOL)a4 radix:(int64_t)a5 descriptor:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)NSNumberingSystem;
  uint64_t v12 = [(NSNumberingSystem *)&v16 init];
  v13 = v12;
  if (v12)
  {
    [(NSNumberingSystem *)v12 setIdentifier:v10];
    [(NSNumberingSystem *)v13 setIsAlgorithmic:v8];
    [(NSNumberingSystem *)v13 setRadix:a5];
    [(NSNumberingSystem *)v13 setDescriptor:v11];
    v14 = v13;
  }

  return v13;
}

- (NSNumberingSystem)init
{
  return [(NSNumberingSystem *)self initWithLocaleIdentifier:&stru_1F3CF7B28];
}

- (NSNumberingSystem)initWithLocaleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 rangeOfString:@"numbers=([a-z]+)" options:1024];
  if (v6)
  {
    int v7 = objc_msgSend(v4, "substringWithRange:", v5, v6);
    BOOL v8 = [MEMORY[0x1E4F1CA20] ICUNumberingSystems];
    v9 = [v8 objectForKeyedSubscript:v7];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSNumberingSystem)initWithNumberingSystemIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA20] ICUNumberingSystems];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (unint64_t)hash
{
  v2 = [(NSNumberingSystem *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NSNumberingSystem *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(NSNumberingSystem *)self identifier];
      uint64_t v6 = [(NSNumberingSystem *)v4 identifier];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)isAlgorithmic
{
  return self->_isAlgorithmic;
}

- (void)setIsAlgorithmic:(BOOL)a3
{
  self->_isAlgorithmic = a3;
}

- (int64_t)radix
{
  return self->_radix;
}

- (void)setRadix:(int64_t)a3
{
  self->_radix = a3;
}

- (NSString)descriptor
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end