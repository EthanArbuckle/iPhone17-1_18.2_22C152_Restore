@interface LAPSPasscode
+ (id)emptyPasscode;
- (BOOL)isEqual:(id)a3;
- (LAPSPasscode)initWithLocalizedPasscode:(id)a3 type:(id)a4;
- (LAPSPasscode)initWithPasscode:(id)a3;
- (LAPSPasscode)initWithPasscode:(id)a3 type:(id)a4;
- (LAPSPasscodeType)type;
- (NSData)data;
- (NSString)passcode;
- (id)externalizePasscode;
@end

@implementation LAPSPasscode

- (LAPSPasscode)initWithPasscode:(id)a3
{
  id v4 = a3;
  v5 = +[LAPSPasscodeType typeAllowingString:v4];
  v6 = [(LAPSPasscode *)self initWithPasscode:v4 type:v5];

  return v6;
}

- (LAPSPasscode)initWithLocalizedPasscode:(id)a3 type:(id)a4
{
  id v6 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __47__LAPSPasscode_initWithLocalizedPasscode_type___block_invoke;
  v12[3] = &unk_26506E808;
  id v13 = v6;
  id v7 = v6;
  id v8 = a4;
  v9 = __47__LAPSPasscode_initWithLocalizedPasscode_type___block_invoke((uint64_t)v12);
  v10 = [(LAPSPasscode *)self initWithPasscode:v9 type:v8];

  return v10;
}

id __47__LAPSPasscode_initWithLocalizedPasscode_type___block_invoke(uint64_t a1)
{
  v2 = +[LAPSPasscodeType typeAllowingString:*(void *)(a1 + 32)];
  v3 = +[LAPSPasscodeType alphanumericType];
  char v4 = [v2 isEqual:v3];

  id v5 = *(id *)(a1 + 32);
  id v6 = v5;
  if (v4)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
    v9 = [v6 stringByTrimmingCharactersInSet:v8];
    uint64_t v10 = [v9 length];

    if (v10)
    {
      id v20 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Numeric passcode contains non-numeric characters" userInfo:0];
      objc_exception_throw(v20);
    }
    if (LAPSPasscodeLatinDigitsPasscodeFromLocalizedNumericPasscode_onceToken != -1) {
      dispatch_once(&LAPSPasscodeLatinDigitsPasscodeFromLocalizedNumericPasscode_onceToken, &__block_literal_global_5);
    }
    id v7 = objc_alloc_init(MEMORY[0x263F089D8]);
    if ([v6 length])
    {
      unint64_t v11 = 0;
      do
      {
        v12 = (void *)LAPSPasscodeLatinDigitsPasscodeFromLocalizedNumericPasscode_fmt;
        id v13 = objc_msgSend(v6, "substringWithRange:", v11, 1);
        v14 = [v12 numberFromString:v13];

        v15 = (void *)LAPSPasscodeLatinDigitsPasscodeFromLocalizedNumericPasscode_fmt;
        v16 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US"];
        [v15 setLocale:v16];

        v17 = [(id)LAPSPasscodeLatinDigitsPasscodeFromLocalizedNumericPasscode_fmt stringFromNumber:v14];
        [v7 appendString:v17];

        ++v11;
      }
      while (v11 < [v6 length]);
    }
    uint64_t v18 = [v7 length];
    if (v18 != [v6 length]) {
      __47__LAPSPasscode_initWithLocalizedPasscode_type___block_invoke_cold_1();
    }
  }

  return v7;
}

+ (id)emptyPasscode
{
  id v2 = objc_alloc((Class)a1);
  v3 = +[LAPSPasscodeType noneType];
  char v4 = (void *)[v2 initWithPasscode:&stru_26F31E768 type:v3];

  return v4;
}

- (LAPSPasscode)initWithPasscode:(id)a3 type:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = a4;
  if (([v7 allowsString:v6] & 1) == 0)
  {
    [NSString stringWithFormat:@"Passcode type %@, does not allow string", v7];
    id v12 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v12);
  }
  v13.receiver = self;
  v13.super_class = (Class)LAPSPasscode;
  id v8 = [(LAPSPasscode *)&v13 init];
  v9 = v8;
  if (v8)
  {
    if (v6) {
      uint64_t v10 = v6;
    }
    else {
      uint64_t v10 = &stru_26F31E768;
    }
    objc_storeStrong((id *)&v8->_passcode, v10);
    objc_storeStrong((id *)&v9->_type, a4);
  }

  return v9;
}

- (NSData)data
{
  return [(NSString *)self->_passcode dataUsingEncoding:4];
}

- (id)externalizePasscode
{
  id v3 = objc_alloc_init(MEMORY[0x263F10468]);
  char v4 = [(LAPSPasscode *)self data];
  int v5 = [v3 setCredential:v4 type:-9];

  if (v5) {
    id v6 = v3;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(LAPSPasscode *)self passcode];
    id v7 = [v5 passcode];
    int v8 = [v6 isEqualToString:v7];

    if (v8)
    {
      v9 = [(LAPSPasscode *)self type];
      uint64_t v10 = [v5 type];
      char v11 = [v9 isEqual:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (NSString)passcode
{
  return self->_passcode;
}

- (LAPSPasscodeType)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_passcode, 0);
}

void __47__LAPSPasscode_initWithLocalizedPasscode_type___block_invoke_cold_1()
{
  __assert_rtn("LAPSPasscodeLatinDigitsPasscodeFromLocalizedNumericPasscode", "LAPSPasscode.m", 130, "[result length] == [numericPasscode length]");
}

@end