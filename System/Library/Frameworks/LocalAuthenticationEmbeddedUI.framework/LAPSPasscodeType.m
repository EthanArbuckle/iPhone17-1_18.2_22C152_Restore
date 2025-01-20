@interface LAPSPasscodeType
+ (id)alphanumericType;
+ (id)noneType;
+ (id)numericCustomDigitsType;
+ (id)numericFourDigitsType;
+ (id)numericSixDigitsType;
+ (id)typeAllowingString:(id)a3;
- (BOOL)allowsLength:(int64_t)a3;
- (BOOL)allowsString:(id)a3;
- (BOOL)hasFixedLength;
- (BOOL)isEqual:(id)a3;
- (LAPSPasscodeType)initWithIdentifier:(int64_t)a3 length:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)localizedName;
- (int64_t)complexityRating;
- (int64_t)identifier;
- (unint64_t)hash;
- (unint64_t)length;
- (void)setIdentifier:(int64_t)a3;
@end

@implementation LAPSPasscodeType

- (LAPSPasscodeType)initWithIdentifier:(int64_t)a3 length:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)LAPSPasscodeType;
  result = [(LAPSPasscodeType *)&v7 init];
  if (result)
  {
    result->_identifier = a3;
    result->_length = a4;
  }
  return result;
}

+ (id)typeAllowingString:(id)a3
{
  id v3 = a3;
  v4 = +[LAPSPasscodeType numericFourDigitsType];
  int v5 = [v4 allowsString:v3];

  if (v5)
  {
    uint64_t v6 = +[LAPSPasscodeType numericFourDigitsType];
  }
  else
  {
    objc_super v7 = +[LAPSPasscodeType numericSixDigitsType];
    int v8 = [v7 allowsString:v3];

    if (v8)
    {
      uint64_t v6 = +[LAPSPasscodeType numericSixDigitsType];
    }
    else
    {
      v9 = +[LAPSPasscodeType numericCustomDigitsType];
      int v10 = [v9 allowsString:v3];

      if (v10)
      {
        uint64_t v6 = +[LAPSPasscodeType numericCustomDigitsType];
      }
      else
      {
        v11 = +[LAPSPasscodeType alphanumericType];
        int v12 = [v11 allowsString:v3];

        if (v12)
        {
          uint64_t v6 = +[LAPSPasscodeType alphanumericType];
        }
        else
        {
          v13 = +[LAPSPasscodeType noneType];
          if (([v13 allowsString:v3] & 1) == 0) {
            +[LAPSPasscodeType typeAllowingString:]();
          }

          uint64_t v6 = +[LAPSPasscodeType noneType];
        }
      }
    }
  }
  v14 = (void *)v6;

  return v14;
}

+ (id)noneType
{
  v2 = [[LAPSPasscodeType alloc] initWithIdentifier:0 length:0];

  return v2;
}

+ (id)numericFourDigitsType
{
  v2 = [[LAPSPasscodeType alloc] initWithIdentifier:1 length:4];

  return v2;
}

+ (id)numericSixDigitsType
{
  v2 = [[LAPSPasscodeType alloc] initWithIdentifier:2 length:6];

  return v2;
}

+ (id)numericCustomDigitsType
{
  v2 = [[LAPSPasscodeType alloc] initWithIdentifier:3 length:-1];

  return v2;
}

+ (id)alphanumericType
{
  v2 = [[LAPSPasscodeType alloc] initWithIdentifier:4 length:-1];

  return v2;
}

- (int64_t)complexityRating
{
  if ((unint64_t)(self->_identifier - 1) >= 4) {
    return -1;
  }
  else {
    return self->_identifier - 1;
  }
}

- (BOOL)allowsLength:(int64_t)a3
{
  if ([(LAPSPasscodeType *)self hasFixedLength]) {
    return [(LAPSPasscodeType *)self length] == a3;
  }
  else {
    return a3 > 0;
  }
}

- (BOOL)allowsString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __33__LAPSPasscodeType_allowsString___block_invoke;
    v9[3] = &unk_26506F350;
    v9[4] = self;
    int v5 = __33__LAPSPasscodeType_allowsString___block_invoke((uint64_t)v9);
    BOOL v7 = objc_msgSend(v5, "rangeOfFirstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length")) != 0x7FFFFFFFFFFFFFFFLL
      && v6 == [v4 length];
  }
  else
  {
    BOOL v7 = [(LAPSPasscodeType *)self identifier] == 0;
  }

  return v7;
}

id __33__LAPSPasscodeType_allowsString___block_invoke(uint64_t a1)
{
  v5[1] = (id)MEMORY[0x263EF8330];
  v5[2] = (id)3221225472;
  v5[3] = __33__LAPSPasscodeType_allowsString___block_invoke_2;
  v5[4] = &unk_26506E808;
  uint64_t v6 = *(void *)(a1 + 32);
  unint64_t v1 = *(void *)(v6 + 8);
  if (v1 > 4) {
    v2 = @"^\\d{4}$";
  }
  else {
    v2 = off_26506F370[v1];
  }
  v5[0] = 0;
  id v3 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v2 options:1 error:v5];
  if (v5[0]) {
    __33__LAPSPasscodeType_allowsString___block_invoke_cold_1();
  }

  return v3;
}

__CFString *__33__LAPSPasscodeType_allowsString___block_invoke_2(uint64_t a1)
{
  unint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v1 > 4) {
    return @"^\\d{4}$";
  }
  else {
    return off_26506F370[v1];
  }
}

- (id)localizedName
{
  switch(self->_identifier)
  {
    case 0:
      self = +[LALocalizedString passcodeTypeNone];
      break;
    case 1:
      self = +[LALocalizedString passcodeTypeNumericFourDigits];
      break;
    case 2:
      self = +[LALocalizedString passcodeTypeNumericSixDigits];
      break;
    case 3:
      self = +[LALocalizedString passcodeTypeNumericCustomDigits];
      break;
    case 4:
      self = +[LALocalizedString passcodeTypeAlphanumeric];
      break;
    default:
      break;
  }

  return self;
}

- (BOOL)hasFixedLength
{
  return [(LAPSPasscodeType *)self length] != -1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [LAPSPasscodeType alloc];
  int64_t v5 = [(LAPSPasscodeType *)self identifier];
  unint64_t v6 = [(LAPSPasscodeType *)self length];

  return [(LAPSPasscodeType *)v4 initWithIdentifier:v5 length:v6];
}

- (unint64_t)hash
{
  int64_t v3 = [(LAPSPasscodeType *)self identifier];
  return [(LAPSPasscodeType *)self length] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 identifier];
    if (v6 == [(LAPSPasscodeType *)self identifier])
    {
      uint64_t v7 = [v5 length];
      BOOL v8 = v7 == [(LAPSPasscodeType *)self length];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  unint64_t v2 = [(LAPSPasscodeType *)self identifier];
  if (v2 > 4) {
    return @"LAPSPasscodeTypeIdentifierUnknown";
  }
  else {
    return off_26506F398[v2];
  }
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int64_t)a3
{
  self->_identifier = a3;
}

- (unint64_t)length
{
  return self->_length;
}

+ (void)typeAllowingString:.cold.1()
{
}

void __33__LAPSPasscodeType_allowsString___block_invoke_cold_1()
{
  __assert_rtn("-[LAPSPasscodeType allowsString:]_block_invoke", "LAPSPasscodeType.m", 141, "error == nil");
}

@end