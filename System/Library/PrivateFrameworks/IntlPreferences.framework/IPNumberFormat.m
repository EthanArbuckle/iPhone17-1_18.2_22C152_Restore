@interface IPNumberFormat
+ (id)availableFormats;
+ (id)currentFormat;
+ (void)setFormat:(id)a3;
- (BOOL)isEqual:(id)a3;
- (IPNumberFormat)initWithDecimalSeparator:(id)a3 groupingSeparator:(id)a4;
- (IPNumberFormat)initWithLocale:(id)a3;
- (NSString)decimalSeparator;
- (NSString)formattedNumber;
- (NSString)groupingSeparator;
- (unint64_t)hash;
@end

@implementation IPNumberFormat

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [(IPNumberFormat *)self decimalSeparator];
  v6 = [v4 decimalSeparator];
  if ([v5 isEqualToString:v6])
  {
    v7 = [(IPNumberFormat *)self groupingSeparator];
    v8 = [v4 groupingSeparator];
    char v9 = [v7 isEqualToString:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = [(IPNumberFormat *)self formattedNumber];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (IPNumberFormat)initWithDecimalSeparator:(id)a3 groupingSeparator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)IPNumberFormat;
  char v9 = [(IPNumberFormat *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_decimalSeparator, a3);
    objc_storeStrong((id *)&v10->_groupingSeparator, a4);
    id v11 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    v12 = [MEMORY[0x1E4F1CA20] preferredLocale];
    [v11 setLocale:v12];

    [v11 setDecimalSeparator:v7];
    [v11 setGroupingSeparator:v8];
    [v11 setNumberStyle:1];
    uint64_t v13 = [v11 stringFromNumber:&unk_1F19D8A80];
    formattedNumber = v10->_formattedNumber;
    v10->_formattedNumber = (NSString *)v13;
  }
  return v10;
}

- (IPNumberFormat)initWithLocale:(id)a3
{
  id v4 = a3;
  v5 = [v4 decimalSeparator];
  v6 = [v4 groupingSeparator];

  id v7 = [(IPNumberFormat *)self initWithDecimalSeparator:v5 groupingSeparator:v6];
  return v7;
}

+ (id)availableFormats
{
  v2 = [MEMORY[0x1E4F1CA70] orderedSet];
  unint64_t v3 = [IPNumberFormat alloc];
  id v4 = +[IPFormat localeFromDeviceLocale];
  v5 = [(IPNumberFormat *)v3 initWithLocale:v4];
  [v2 addObject:v5];

  v6 = [IPNumberFormat alloc];
  id v7 = +[IPFormat localeFromDeviceLanguage];
  id v8 = [(IPNumberFormat *)v6 initWithLocale:v7];
  [v2 addObject:v8];

  char v9 = [[IPNumberFormat alloc] initWithDecimalSeparator:@"." groupingSeparator:@","];
  [v2 addObject:v9];

  v10 = [[IPNumberFormat alloc] initWithDecimalSeparator:@"," groupingSeparator:@"."];
  [v2 addObject:v10];

  id v11 = [[IPNumberFormat alloc] initWithDecimalSeparator:@"." groupingSeparator:@" "];
  [v2 addObject:v11];

  v12 = [[IPNumberFormat alloc] initWithDecimalSeparator:@"," groupingSeparator:@" "];
  [v2 addObject:v12];

  uint64_t v13 = [v2 array];

  return v13;
}

+ (id)currentFormat
{
  v2 = [IPNumberFormat alloc];
  unint64_t v3 = [MEMORY[0x1E4F1CA20] preferredLocale];
  id v4 = [(IPNumberFormat *)v2 initWithLocale:v3];

  return v4;
}

+ (void)setFormat:(id)a3
{
  v18[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [IPNumberFormat alloc];
  v5 = +[IPFormat localeFromDeviceLocale];
  v6 = [(IPNumberFormat *)v4 initWithLocale:v5];

  id v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if ([v3 isEqual:v6])
  {
    [v7 removeObjectForKey:@"AppleICUNumberSymbols" inDomain:*MEMORY[0x1E4F283E0]];
  }
  else
  {
    objc_super v16 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
    v17[0] = v16;
    v15 = [v3 decimalSeparator];
    v18[0] = v15;
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
    v17[1] = v8;
    char v9 = [v3 groupingSeparator];
    v18[1] = v9;
    v10 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 10);
    v17[2] = v10;
    id v11 = [v3 decimalSeparator];
    v18[2] = v11;
    v12 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 17);
    v17[3] = v12;
    uint64_t v13 = [v3 groupingSeparator];
    v18[3] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

    [v7 setObject:v14 forKey:@"AppleICUNumberSymbols" inDomain:*MEMORY[0x1E4F283E0]];
  }
}

- (NSString)formattedNumber
{
  return self->_formattedNumber;
}

- (NSString)decimalSeparator
{
  return self->_decimalSeparator;
}

- (NSString)groupingSeparator
{
  return self->_groupingSeparator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupingSeparator, 0);
  objc_storeStrong((id *)&self->_decimalSeparator, 0);
  objc_storeStrong((id *)&self->_formattedNumber, 0);
}

@end