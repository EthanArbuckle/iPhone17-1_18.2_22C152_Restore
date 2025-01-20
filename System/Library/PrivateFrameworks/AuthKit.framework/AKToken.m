@interface AKToken
+ (BOOL)supportsSecureCoding;
+ (id)_tokenComponentsFromBase64String:(id)a3;
+ (id)idmsTokenWithBase64String:(id)a3;
+ (id)tokenWithBase64String:(id)a3;
+ (id)tokenWithDictionary:(id)a3;
+ (id)tokenWithValue:(id)a3 lifetime:(id)a4;
+ (id)tokenWithValue:(id)a3 lifetime:(id)a4 creationTime:(id)a5;
- (AKToken)initWithCoder:(id)a3;
- (NSDate)creationDate;
- (NSDate)expirationDate;
- (NSString)name;
- (NSString)stringValue;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
- (void)setStringValue:(id)a3;
@end

@implementation AKToken

+ (id)tokenWithValue:(id)a3 lifetime:(id)a4
{
  return (id)[a1 tokenWithValue:a3 lifetime:a4 creationTime:0];
}

+ (id)tokenWithValue:(id)a3 lifetime:(id)a4 creationTime:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = objc_alloc_init(AKToken);
  uint64_t v11 = [v9 copy];

  stringValue = v10->_stringValue;
  v10->_stringValue = (NSString *)v11;

  if (v7)
  {
    v13 = (void *)MEMORY[0x1E4F1C9C8];
    [v7 doubleValue];
    uint64_t v14 = objc_msgSend(v13, "dateWithTimeIntervalSinceNow:");
    expirationDate = v10->_expirationDate;
    v10->_expirationDate = (NSDate *)v14;
  }
  if (v8)
  {
    v16 = (void *)MEMORY[0x1E4F1C9C8];
    [v8 doubleValue];
    uint64_t v18 = [v16 dateWithTimeIntervalSince1970:v17 / 1000.0];
    creationDate = v10->_creationDate;
    v10->_creationDate = (NSDate *)v18;
  }

  return v10;
}

+ (id)tokenWithBase64String:(id)a3
{
  id v4 = a3;
  v5 = [a1 _tokenComponentsFromBase64String:v4];
  if ((unint64_t)[v5 count] > 1)
  {
    id v8 = [v5 objectAtIndexedSubscript:1];
    id v9 = [v5 objectAtIndexedSubscript:0];
    if ([v5 count] == 4)
    {
      v10 = NSNumber;
      uint64_t v11 = [v5 objectAtIndexedSubscript:2];
      v12 = objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "integerValue"));

      v13 = NSNumber;
      uint64_t v14 = [v5 objectAtIndexedSubscript:3];
      v15 = objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "integerValue"));

      id v7 = [a1 tokenWithValue:v8 lifetime:v12 creationTime:v15];
    }
    else
    {
      id v7 = [a1 tokenWithValue:v8 lifetime:0];
    }
    [v7 setName:v9];
  }
  else
  {
    v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[AKToken tokenWithBase64String:]();
    }

    id v7 = 0;
  }

  return v7;
}

+ (id)tokenWithDictionary:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 objectForKeyedSubscript:@"token"];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  objc_opt_class();
  id v7 = [v4 objectForKeyedSubscript:@"duration"];
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  objc_opt_class();
  id v9 = [v4 objectForKeyedSubscript:@"value"];
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  objc_opt_class();
  id v11 = [v4 objectForKeyedSubscript:@"cts"];
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  if (!v6 && v10)
  {
    id v6 = v10;
LABEL_17:
    v13 = [a1 tokenWithValue:v6 lifetime:v8 creationTime:v12];
    goto LABEL_19;
  }
  if (v6) {
    goto LABEL_17;
  }
  v13 = 0;
LABEL_19:

  return v13;
}

+ (id)idmsTokenWithBase64String:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _tokenComponentsFromBase64String:v4];
  if ([v5 count])
  {
    id v6 = [v5 objectAtIndexedSubscript:0];
    id v7 = 0;
    if ([v5 count] == 2)
    {
      id v8 = NSNumber;
      id v9 = [v5 objectAtIndexedSubscript:1];
      id v7 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "integerValue"));
    }
    id v10 = +[AKToken tokenWithValue:v6 lifetime:0 creationTime:v7];
  }
  else
  {
    id v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[AKToken idmsTokenWithBase64String:]();
    }

    id v10 = 0;
  }

  return v10;
}

+ (id)_tokenComponentsFromBase64String:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v3 options:0];
    id v5 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
    id v6 = [v5 componentsSeparatedByString:@":"];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p {\n\tstringValue: %@,\n\texpirationDate: %@,\n\tcreationDate: %@,\n\tname: %@,\n}>", v5, self, self->_stringValue, self->_expirationDate, self->_creationDate, self->_name];

  return v6;
}

- (AKToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AKToken;
  id v5 = [(AKToken *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_stringValue"];
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_creationDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    name = v5->_name;
    v5->_name = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  stringValue = self->_stringValue;
  id v5 = a3;
  [v5 encodeObject:stringValue forKey:@"_stringValue"];
  [v5 encodeObject:self->_expirationDate forKey:@"_expirationDate"];
  [v5 encodeObject:self->_creationDate forKey:@"_creationDate"];
  [v5 encodeObject:self->_name forKey:@"_name"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);

  objc_storeStrong((id *)&self->_expirationDate, 0);
}

+ (void)tokenWithBase64String:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Invalid token string! %@", v2, v3, v4, v5, v6);
}

+ (void)idmsTokenWithBase64String:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Invalid IdMS token string! %@", v2, v3, v4, v5, v6);
}

@end