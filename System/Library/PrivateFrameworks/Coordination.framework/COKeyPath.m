@interface COKeyPath
+ (id)allowedCharacterSet;
+ (id)createWithString:(id)a3;
+ (id)predicateWithComponents:(id)a3;
- (BOOL)isEqual:(id)a3;
- (COKeyPath)initWithComponents:(id)a3;
- (NSArray)components;
- (NSString)absoluteString;
- (id)description;
- (unint64_t)hash;
- (void)setAbsoluteString:(id)a3;
- (void)setComponents:(id)a3;
@end

@implementation COKeyPath

- (COKeyPath)initWithComponents:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)COKeyPath;
  v6 = [(COKeyPath *)&v23 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_10;
  }
  id obj = a3;
  v22 = v6;
  v8 = [MEMORY[0x263F089D8] string];
  if (![v5 count])
  {
LABEL_9:
    v7 = v22;
    absoluteString = v22->_absoluteString;
    v22->_absoluteString = v8;
    v16 = v8;

    objc_storeStrong((id *)&v22->_components, obj);
LABEL_10:
    v17 = v7;
    goto LABEL_11;
  }
  uint64_t v9 = 0;
  while (1)
  {
    v10 = [v5 objectAtIndex:v9];
    v11 = +[COKeyPath allowedCharacterSet];
    v12 = [v11 invertedSet];

    uint64_t v13 = [v10 rangeOfCharacterFromSet:v12];
    if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    if (v9) {
      v14 = @".%@";
    }
    else {
      v14 = @"%@";
    }
    -[NSString appendFormat:](v8, "appendFormat:", v14, v10);

    if (++v9 >= (unint64_t)[v5 count]) {
      goto LABEL_9;
    }
  }
  uint64_t v19 = v13;
  v20 = COLogForCategory(4);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    [(COKeyPath *)v10 initWithComponents:v20];
  }

  v17 = 0;
  v7 = v22;
LABEL_11:

  return v17;
}

+ (id)createWithString:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(COKeyPath);
  [(COKeyPath *)v4 setAbsoluteString:v3];
  id v5 = [v3 componentsSeparatedByString:@"."];

  [(COKeyPath *)v4 setComponents:v5];

  return v4;
}

+ (id)allowedCharacterSet
{
  if (allowedCharacterSet_onceToken != -1) {
    dispatch_once(&allowedCharacterSet_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)allowedCharacterSet_allowedCharacterSet;

  return v2;
}

void __32__COKeyPath_allowedCharacterSet__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F089C0]);
  v1 = [MEMORY[0x263F08708] uppercaseLetterCharacterSet];
  [v0 formUnionWithCharacterSet:v1];

  v2 = [MEMORY[0x263F08708] lowercaseLetterCharacterSet];
  [v0 formUnionWithCharacterSet:v2];

  id v3 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
  [v0 formUnionWithCharacterSet:v3];

  [v0 addCharactersInString:@"_"];
  [v0 addCharactersInString:@"-"];
  v4 = (void *)allowedCharacterSet_allowedCharacterSet;
  allowedCharacterSet_allowedCharacterSet = (uint64_t)v0;
}

+ (id)predicateWithComponents:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  if ([v3 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF contains %@", *(void *)(*((void *)&v13 + 1) + 8 * i)];
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    v11 = (void *)[objc_alloc(MEMORY[0x263F08730]) initWithType:1 subpredicates:v4];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (COKeyPath *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else if (objc_opt_respondsToSelector())
  {
    absoluteString = self->_absoluteString;
    uint64_t v6 = [(COKeyPath *)v4 absoluteString];
    char v7 = [(NSString *)absoluteString isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(COKeyPath *)self absoluteString];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  v2 = NSString;
  unint64_t v3 = [(COKeyPath *)self absoluteString];
  v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (NSString)absoluteString
{
  return self->_absoluteString;
}

- (void)setAbsoluteString:(id)a3
{
}

- (NSArray)components
{
  return self->_components;
}

- (void)setComponents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);

  objc_storeStrong((id *)&self->_absoluteString, 0);
}

- (void)initWithComponents:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v4[0] = 67109120;
  v4[1] = [a1 characterAtIndex:a2];
  _os_log_error_impl(&dword_21D3E0000, a3, OS_LOG_TYPE_ERROR, "COKeyPath components contains an invalid character '%c'", (uint8_t *)v4, 8u);
}

@end