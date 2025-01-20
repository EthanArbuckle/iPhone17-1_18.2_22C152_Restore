@interface CKVToken
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToToken:(id)a3;
- (BOOL)isSignificant;
- (BOOL)isWhitespace;
- (CKVToken)init;
- (CKVToken)initWithCoder:(id)a3;
- (CKVToken)initWithValue:(id)a3 cleanValue:(id)a4 beginIndex:(unint64_t)a5 endIndex:(unint64_t)a6 isSignificant:(BOOL)a7 isWhitespace:(BOOL)a8;
- (CKVToken)initWithValue:(id)a3 cleanValue:(id)a4 beginIndex:(unint64_t)a5 endIndex:(unint64_t)a6 isSignificant:(BOOL)a7 isWhitespace:(BOOL)a8 normalizedValues:(id)a9;
- (NSArray)normalizedValues;
- (NSString)cleanValue;
- (NSString)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)beginIndex;
- (unint64_t)endIndex;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKVToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedValues, 0);
  objc_storeStrong((id *)&self->_cleanValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (NSArray)normalizedValues
{
  return self->_normalizedValues;
}

- (BOOL)isWhitespace
{
  return self->_isWhitespace;
}

- (BOOL)isSignificant
{
  return self->_isSignificant;
}

- (unint64_t)endIndex
{
  return self->_endIndex;
}

- (unint64_t)beginIndex
{
  return self->_beginIndex;
}

- (NSString)cleanValue
{
  return self->_cleanValue;
}

- (NSString)value
{
  return self->_value;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_value hash];
  NSUInteger v4 = [(NSString *)self->_cleanValue hash] ^ v3;
  v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_beginIndex];
  uint64_t v6 = v4 ^ [v5 hash];
  v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_endIndex];
  uint64_t v8 = [v7 hash];
  v9 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isSignificant];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isWhitespace];
  uint64_t v12 = [v11 hash];
  unint64_t v13 = v10 ^ v12 ^ [(NSArray *)self->_normalizedValues hash];

  return v13;
}

- (BOOL)isEqualToToken:(id)a3
{
  id v4 = a3;
  value = self->_value;
  uint64_t v6 = [v4 value];
  LODWORD(value) = [(NSString *)value isEqualToString:v6];

  if (value)
  {
    cleanValue = self->_cleanValue;
    uint64_t v8 = [v4 cleanValue];
    LODWORD(cleanValue) = [(NSString *)cleanValue isEqualToString:v8];

    if (cleanValue)
    {
      unint64_t beginIndex = self->_beginIndex;
      if (beginIndex == [v4 beginIndex])
      {
        unint64_t endIndex = self->_endIndex;
        if (endIndex == [v4 endIndex])
        {
          int isSignificant = self->_isSignificant;
          if (isSignificant == [v4 isSignificant])
          {
            uint64_t isWhitespace = self->_isWhitespace;
            if (isWhitespace == [v4 isWhitespace])
            {
              normalizedValues = self->_normalizedValues;
              v14 = normalizedValues;
              if (!normalizedValues)
              {
                uint64_t isWhitespace = [v4 normalizedValues];
                if (!isWhitespace)
                {
                  LOBYTE(v16) = 0;
                  goto LABEL_15;
                }
                v14 = self->_normalizedValues;
              }
              v15 = [v4 normalizedValues];
              int v16 = [(NSArray *)v14 isEqual:v15] ^ 1;

              if (normalizedValues)
              {
LABEL_16:
                char v17 = v16 ^ 1;
                goto LABEL_13;
              }
LABEL_15:

              goto LABEL_16;
            }
          }
        }
      }
    }
  }
  char v17 = 0;
LABEL_13:

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKVToken *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CKVToken *)self isEqualToToken:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSString *)self->_value copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_cleanValue copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  *(void *)(v5 + 32) = self->_beginIndex;
  *(void *)(v5 + 40) = self->_endIndex;
  *(unsigned char *)(v5 + 8) = self->_isSignificant;
  *(unsigned char *)(v5 + 9) = self->_isWhitespace;
  objc_storeStrong((id *)(v5 + 48), self->_normalizedValues);
  return (id)v5;
}

- (CKVToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKVToken;
  uint64_t v5 = [(CKVToken *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    value = v5->_value;
    v5->_value = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cleanValue"];
    cleanValue = v5->_cleanValue;
    v5->_cleanValue = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"b"];
    v5->_unint64_t beginIndex = [v10 unsignedLongValue];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"e"];
    v5->_unint64_t endIndex = [v11 unsignedLongValue];

    v5->_int isSignificant = [v4 decodeBoolForKey:@"isSignificant"];
    v5->_uint64_t isWhitespace = [v4 decodeBoolForKey:@"isWhitespace"];
    uint64_t v12 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"normalizedValues"];
    normalizedValues = v5->_normalizedValues;
    v5->_normalizedValues = (NSArray *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  value = self->_value;
  id v7 = a3;
  [v7 encodeObject:value forKey:@"value"];
  [v7 encodeObject:self->_cleanValue forKey:@"cleanValue"];
  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:self->_beginIndex];
  [v7 encodeObject:v5 forKey:@"b"];

  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:self->_endIndex];
  [v7 encodeObject:v6 forKey:@"e"];

  [v7 encodeBool:self->_isSignificant forKey:@"isSignificant"];
  [v7 encodeBool:self->_isWhitespace forKey:@"isWhitespace"];
  [v7 encodeObject:self->_normalizedValues forKey:@"normalizedValues"];
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)CKVToken;
  NSUInteger v3 = [(CKVToken *)&v10 description];
  value = self->_value;
  cleanValue = self->_cleanValue;
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_beginIndex];
  id v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_endIndex];
  uint64_t v8 = [v3 stringByAppendingFormat:@" value: %@, cleanValue: %@, beginIndex: %@, endIndex: %@, isSignificant: %d, isWhitespace: %d, normalizedValues: %@", value, cleanValue, v6, v7, self->_isSignificant, self->_isWhitespace, self->_normalizedValues];

  return v8;
}

- (CKVToken)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"You must use -initWithValue:" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

- (CKVToken)initWithValue:(id)a3 cleanValue:(id)a4 beginIndex:(unint64_t)a5 endIndex:(unint64_t)a6 isSignificant:(BOOL)a7 isWhitespace:(BOOL)a8 normalizedValues:(id)a9
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a9;
  v29.receiver = self;
  v29.super_class = (Class)CKVToken;
  v18 = [(CKVToken *)&v29 init];
  if (!v18)
  {
LABEL_6:
    v26 = v18;
    goto LABEL_10;
  }
  uint64_t v19 = [v15 copy];
  value = v18->_value;
  v18->_value = (NSString *)v19;

  v21 = v18->_value;
  if (v21 && [(NSString *)v21 length])
  {
    uint64_t v22 = [v16 copy];
    cleanValue = v18->_cleanValue;
    v18->_cleanValue = (NSString *)v22;

    v18->_unint64_t beginIndex = a5;
    v18->_unint64_t endIndex = a6;
    v18->_int isSignificant = a7;
    v18->_uint64_t isWhitespace = a8;
    if ([v17 count])
    {
      uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithArray:v17];
      normalizedValues = v18->_normalizedValues;
      v18->_normalizedValues = (NSArray *)v24;
    }
    goto LABEL_6;
  }
  v27 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[CKVToken initWithValue:cleanValue:beginIndex:endIndex:isSignificant:isWhitespace:normalizedValues:]";
    _os_log_error_impl(&dword_1A77B3000, v27, OS_LOG_TYPE_ERROR, "%s Cannot construct token with nil value", buf, 0xCu);
  }
  v26 = 0;
LABEL_10:

  return v26;
}

- (CKVToken)initWithValue:(id)a3 cleanValue:(id)a4 beginIndex:(unint64_t)a5 endIndex:(unint64_t)a6 isSignificant:(BOOL)a7 isWhitespace:(BOOL)a8
{
  return [(CKVToken *)self initWithValue:a3 cleanValue:a4 beginIndex:a5 endIndex:a6 isSignificant:a7 isWhitespace:a8 normalizedValues:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end