@interface CDMToken
+ (id)getTokenWith:(id)a3 cleanValue:(id)a4 normalizedValues:(id)a5 isSignificant:(BOOL)a6 isWhitespace:(BOOL)a7;
- (BOOL)getHasCleanValues;
- (BOOL)hasValue:(id)a3 from:(int64_t)a4 to:(int64_t)a5;
- (BOOL)isSignificant;
- (BOOL)isWhiteSpace;
- (CDMToken)initWithProtoToken:(id)a3;
- (CDMToken)initWithValue:(id)a3;
- (CDMToken)initWithValue:(id)a3 begin:(int64_t)a4 end:(int64_t)a5;
- (CDMToken)initWithValue:(id)a3 begin:(int64_t)a4 end:(int64_t)a5 significant:(BOOL)a6;
- (CDMToken)initWithValue:(id)a3 begin:(int64_t)a4 end:(int64_t)a5 significant:(BOOL)a6 whitespace:(BOOL)a7;
- (CDMToken)initWithValue:(id)a3 begin:(int64_t)a4 end:(int64_t)a5 significant:(BOOL)a6 whitespace:(BOOL)a7 cleanValue:(id)a8;
- (CDMToken)initWithValue:(id)a3 begin:(int64_t)a4 end:(int64_t)a5 significant:(BOOL)a6 whitespace:(BOOL)a7 cleanValue:(id)a8 tokenIndex:(int64_t)a9 nonWhitespaceTokenIndex:(int64_t)a10;
- (CDMToken)initWithValue:(id)a3 begin:(int64_t)a4 end:(int64_t)a5 significant:(BOOL)a6 whitespace:(BOOL)a7 cleanValue:(id)a8 tokenIndex:(int64_t)a9 nonWhitespaceTokenIndex:(int64_t)a10 normalizedValues:(id)a11;
- (NSArray)cleanValues;
- (NSArray)normalizedValues;
- (NSString)cleanValue;
- (NSString)value;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)begin;
- (int64_t)end;
- (int64_t)nonWhitespaceTokenIndex;
- (int64_t)tokenIndex;
- (void)addNormalizedValue:(id)a3;
@end

@implementation CDMToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cleanValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_normalizedValues, 0);
}

- (NSArray)normalizedValues
{
  return &self->_normalizedValues->super;
}

- (int64_t)nonWhitespaceTokenIndex
{
  return self->_nonWhitespaceTokenIndex;
}

- (int64_t)tokenIndex
{
  return self->_tokenIndex;
}

- (NSString)cleanValue
{
  return self->_cleanValue;
}

- (BOOL)isWhiteSpace
{
  return self->_isWhiteSpace;
}

- (BOOL)isSignificant
{
  return self->_isSignificant;
}

- (int64_t)end
{
  return self->_end;
}

- (int64_t)begin
{
  return self->_begin;
}

- (NSString)value
{
  return self->_value;
}

- (id)dictionaryRepresentation
{
  v13[6] = *MEMORY[0x263EF8340];
  int64_t begin = self->_begin;
  v13[0] = self->_value;
  v12[0] = @"value";
  v12[1] = @"begin";
  v4 = [NSNumber numberWithInteger:begin];
  v13[1] = v4;
  v12[2] = @"end";
  uint64_t v5 = [NSNumber numberWithInteger:self->_end];
  v6 = (void *)v5;
  v7 = @"NO";
  if (self->_isSignificant) {
    v7 = @"YES";
  }
  v13[2] = v5;
  v13[3] = v7;
  v12[3] = @"significant";
  v12[4] = @"cleanValue";
  cleanValue = self->_cleanValue;
  v12[5] = @"normalizedValues";
  normalizedValues = self->_normalizedValues;
  v13[4] = cleanValue;
  v13[5] = normalizedValues;
  v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:6];

  return v10;
}

- (id)description
{
  v2 = @"YES";
  if (self->_isSignificant) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  if (!self->_isWhiteSpace) {
    v2 = @"NO";
  }
  return (id)[NSString stringWithFormat:@"{ value: %@, begin: %td, end: %td, significant: %@, whitespace: %@, cleanValue: %@, normalizedValues: %@}", *(_OWORD *)&self->_value, self->_end, v3, v2, self->_cleanValue, self->_normalizedValues];
}

- (NSArray)cleanValues
{
  v4[1] = *MEMORY[0x263EF8340];
  if (self->_cleanValue)
  {
    v4[0] = self->_cleanValue;
    v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (BOOL)getHasCleanValues
{
  if (!self->_cleanValue) {
    return 0;
  }
  v2 = [(CDMToken *)self cleanValues];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)addNormalizedValue:(id)a3
{
}

- (BOOL)hasValue:(id)a3 from:(int64_t)a4 to:(int64_t)a5
{
  id v8 = a3;
  if ([(CDMToken *)self begin] <= a4 && [(CDMToken *)self end] >= a5)
  {
    v10 = [(CDMToken *)self value];
    char v9 = [v10 isEqualToString:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (CDMToken)initWithProtoToken:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CDMToken;
  uint64_t v5 = [(CDMToken *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 value];
    value = v5->_value;
    v5->_value = (NSString *)v6;

    v5->_int64_t begin = (int)[v4 begin];
    v5->_end = (int)[v4 end];
    v5->_isSignificant = [v4 isSignificant];
    v5->_isWhiteSpace = [v4 isWhitespace];
    v5->_tokenIndex = (int)[v4 tokenIndex];
    v5->_nonWhitespaceTokenIndex = (int)[v4 nonWhitespaceTokenIndex];
    uint64_t v8 = [v4 cleanValue];
    cleanValue = v5->_cleanValue;
    v5->_cleanValue = (NSString *)v8;

    v10 = [v4 normalizedValues];
    uint64_t v11 = [v10 copy];
    normalizedValues = v5->_normalizedValues;
    v5->_normalizedValues = (NSMutableArray *)v11;
  }
  return v5;
}

- (CDMToken)initWithValue:(id)a3 begin:(int64_t)a4 end:(int64_t)a5 significant:(BOOL)a6 whitespace:(BOOL)a7 cleanValue:(id)a8 tokenIndex:(int64_t)a9 nonWhitespaceTokenIndex:(int64_t)a10 normalizedValues:(id)a11
{
  id v17 = a3;
  id v18 = a8;
  id v19 = a11;
  v24.receiver = self;
  v24.super_class = (Class)CDMToken;
  v20 = [(CDMToken *)&v24 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_value, a3);
    v21->_int64_t begin = a4;
    v21->_end = a5;
    v21->_isSignificant = a6;
    v21->_isWhiteSpace = a7;
    v21->_tokenIndex = a9;
    v21->_nonWhitespaceTokenIndex = a10;
    objc_storeStrong((id *)&v21->_cleanValue, a8);
    objc_storeStrong((id *)&v21->_normalizedValues, a11);
  }

  return v21;
}

- (CDMToken)initWithValue:(id)a3 begin:(int64_t)a4 end:(int64_t)a5 significant:(BOOL)a6 whitespace:(BOOL)a7 cleanValue:(id)a8 tokenIndex:(int64_t)a9 nonWhitespaceTokenIndex:(int64_t)a10
{
  id v17 = a3;
  id v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CDMToken;
  id v19 = [(CDMToken *)&v24 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_value, a3);
    v20->_int64_t begin = a4;
    v20->_end = a5;
    v20->_isSignificant = a6;
    v20->_isWhiteSpace = a7;
    v20->_tokenIndex = a9;
    v20->_nonWhitespaceTokenIndex = a10;
    objc_storeStrong((id *)&v20->_cleanValue, a8);
    uint64_t v21 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
    normalizedValues = v20->_normalizedValues;
    v20->_normalizedValues = (NSMutableArray *)v21;
  }
  return v20;
}

- (CDMToken)initWithValue:(id)a3 begin:(int64_t)a4 end:(int64_t)a5 significant:(BOOL)a6 whitespace:(BOOL)a7 cleanValue:(id)a8
{
  return [(CDMToken *)self initWithValue:a3 begin:a4 end:a5 significant:a6 whitespace:a7 cleanValue:a8 tokenIndex:-1 nonWhitespaceTokenIndex:-1];
}

- (CDMToken)initWithValue:(id)a3 begin:(int64_t)a4 end:(int64_t)a5 significant:(BOOL)a6 whitespace:(BOOL)a7
{
  return [(CDMToken *)self initWithValue:a3 begin:a4 end:a5 significant:a6 whitespace:a7 cleanValue:a3];
}

- (CDMToken)initWithValue:(id)a3 begin:(int64_t)a4 end:(int64_t)a5 significant:(BOOL)a6
{
  BOOL v6 = a6;
  v10 = (void *)MEMORY[0x263F08708];
  id v11 = a3;
  v12 = [v10 whitespaceCharacterSet];
  v13 = [v11 stringByTrimmingCharactersInSet:v12];
  BOOL v14 = [v13 length] == 0;

  v15 = [(CDMToken *)self initWithValue:v11 begin:a4 end:a5 significant:v6 whitespace:v14];
  return v15;
}

- (CDMToken)initWithValue:(id)a3 begin:(int64_t)a4 end:(int64_t)a5
{
  return [(CDMToken *)self initWithValue:a3 begin:a4 end:a5 significant:1];
}

- (CDMToken)initWithValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[CDMToken initWithValue:begin:end:significant:](self, "initWithValue:begin:end:significant:", v4, 0, [v4 length], 1);

  return v5;
}

+ (id)getTokenWith:(id)a3 cleanValue:(id)a4 normalizedValues:(id)a5 isSignificant:(BOOL)a6 isWhitespace:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v11 = (objc_class *)MEMORY[0x263F71F20];
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = objc_alloc_init(v11);
  [v15 setValue:v14];

  [v15 setCleanValue:v13];
  [v15 setNormalizedValues:v12];

  [v15 setIsSignificant:v8];
  [v15 setIsWhitespace:v7];
  return v15;
}

@end