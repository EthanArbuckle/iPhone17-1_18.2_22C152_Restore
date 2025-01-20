@interface CALNNotificationIdentifier
+ (id)_allowedCharacterSetForEncodingNotificationIdentifierComponents;
+ (id)_constructNotificationIdentifierStringRepresentationFromComponents:(id)a3;
+ (id)_deconstructNotificationIdentifierStringRepresentationIntoComponents:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNotificationIdentifier:(id)a3;
- (CALNNotificationIdentifier)initWithSourceIdentifier:(id)a3 sourceClientIdentifier:(id)a4;
- (CALNNotificationIdentifier)initWithSourceIdentifier:(id)a3 sourceClientIdentifier:(id)a4 stringRepresentation:(id)a5;
- (CALNNotificationIdentifier)initWithStringRepresentation:(id)a3;
- (NSString)sourceClientIdentifier;
- (NSString)sourceIdentifier;
- (NSString)stringRepresentation;
- (id)description;
- (unint64_t)hash;
@end

@implementation CALNNotificationIdentifier

+ (id)_constructNotificationIdentifierStringRepresentationFromComponents:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[CALNLogSubsystem defaultCategory];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[CALNNotificationIdentifier _constructNotificationIdentifierStringRepresentationFromComponents:].cold.5();
  }

  v6 = [v4 sourceIdentifier];
  v7 = [v4 sourceClientIdentifier];
  if (![v6 length])
  {
    v8 = +[CALNLogSubsystem defaultCategory];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[CALNNotificationIdentifier _constructNotificationIdentifierStringRepresentationFromComponents:]();
    }
    goto LABEL_13;
  }
  if (![v7 length])
  {
    v8 = +[CALNLogSubsystem defaultCategory];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[CALNNotificationIdentifier _constructNotificationIdentifierStringRepresentationFromComponents:]();
    }
LABEL_13:
    v12 = 0;
    goto LABEL_18;
  }
  v8 = [a1 _allowedCharacterSetForEncodingNotificationIdentifierComponents];
  v9 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:v8];
  if (v9)
  {
    v10 = [v7 stringByAddingPercentEncodingWithAllowedCharacters:v8];
    v15[0] = v9;
    v15[1] = v10;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
    v12 = [v11 componentsJoinedByString:@"/"];
    v13 = +[CALNLogSubsystem defaultCategory];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      +[CALNNotificationIdentifier _constructNotificationIdentifierStringRepresentationFromComponents:].cold.4();
    }
  }
  else
  {
    v10 = +[CALNLogSubsystem defaultCategory];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[CALNNotificationIdentifier _constructNotificationIdentifierStringRepresentationFromComponents:]();
    }
    v12 = 0;
  }

LABEL_18:
  return v12;
}

+ (id)_deconstructNotificationIdentifierStringRepresentationIntoComponents:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[CALNLogSubsystem defaultCategory];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[CALNNotificationIdentifier _deconstructNotificationIdentifierStringRepresentationIntoComponents:].cold.4();
  }

  v5 = [v3 componentsSeparatedByString:@"/"];
  if ([v5 count] == 2)
  {
    v6 = [v5 objectAtIndexedSubscript:0];
    v7 = [v5 objectAtIndexedSubscript:1];
    v8 = [v6 stringByRemovingPercentEncoding];
    v9 = [v7 stringByRemovingPercentEncoding];
    if ([v8 length])
    {
      if ([v9 length])
      {
        v10 = [[CALNNotificationIdentifierComponents alloc] initWithSourceIdentifier:v8 sourceClientIdentifier:v9];
        v11 = +[CALNLogSubsystem defaultCategory];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          +[CALNNotificationIdentifier _deconstructNotificationIdentifierStringRepresentationIntoComponents:]();
        }
        goto LABEL_16;
      }
      v11 = +[CALNLogSubsystem defaultCategory];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[CALNNotificationIdentifier _deconstructNotificationIdentifierStringRepresentationIntoComponents:]();
      }
    }
    else
    {
      v11 = +[CALNLogSubsystem defaultCategory];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[CALNNotificationIdentifier _deconstructNotificationIdentifierStringRepresentationIntoComponents:]();
      }
    }
    v10 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v6 = +[CALNLogSubsystem defaultCategory];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    int v14 = 138544130;
    v15 = &unk_26D3C5DD8;
    __int16 v16 = 2114;
    v17 = v12;
    __int16 v18 = 2114;
    v19 = v5;
    __int16 v20 = 2114;
    id v21 = v3;
    _os_log_impl(&dword_2216BB000, v6, OS_LOG_TYPE_DEFAULT, "Cannot deconstruct notification identifier string representation into components since there are an unexpected number of encoded components. Expected encoded component count: %{public}@. Actual encoded component count: %{public}@. Encoded components: %{public}@. String representation: %{public}@.", (uint8_t *)&v14, 0x2Au);
  }
  v10 = 0;
LABEL_17:

  return v10;
}

+ (id)_allowedCharacterSetForEncodingNotificationIdentifierComponents
{
  if (_allowedCharacterSetForEncodingNotificationIdentifierComponents_onceToken != -1) {
    dispatch_once(&_allowedCharacterSetForEncodingNotificationIdentifierComponents_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)_allowedCharacterSetForEncodingNotificationIdentifierComponents_allowedCharacterSet;
  return v2;
}

void __93__CALNNotificationIdentifier__allowedCharacterSetForEncodingNotificationIdentifierComponents__block_invoke()
{
  id v3 = [@"/" stringByAppendingString:@"%"];
  v0 = [MEMORY[0x263F08708] characterSetWithCharactersInString:v3];
  uint64_t v1 = [v0 invertedSet];
  v2 = (void *)_allowedCharacterSetForEncodingNotificationIdentifierComponents_allowedCharacterSet;
  _allowedCharacterSetForEncodingNotificationIdentifierComponents_allowedCharacterSet = v1;
}

- (CALNNotificationIdentifier)initWithSourceIdentifier:(id)a3 sourceClientIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [[CALNNotificationIdentifierComponents alloc] initWithSourceIdentifier:v6 sourceClientIdentifier:v7];
  v9 = [(id)objc_opt_class() _constructNotificationIdentifierStringRepresentationFromComponents:v8];
  if (v9)
  {
    self = [(CALNNotificationIdentifier *)self initWithSourceIdentifier:v6 sourceClientIdentifier:v7 stringRepresentation:v9];
    v10 = self;
  }
  else
  {
    v11 = +[CALNLogSubsystem defaultCategory];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CALNNotificationIdentifier initWithSourceIdentifier:sourceClientIdentifier:]();
    }

    v10 = 0;
  }

  return v10;
}

- (CALNNotificationIdentifier)initWithStringRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() _deconstructNotificationIdentifierStringRepresentationIntoComponents:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 sourceIdentifier];
    v8 = [v6 sourceClientIdentifier];
    self = [(CALNNotificationIdentifier *)self initWithSourceIdentifier:v7 sourceClientIdentifier:v8 stringRepresentation:v4];

    v9 = self;
  }
  else
  {
    v10 = +[CALNLogSubsystem defaultCategory];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CALNNotificationIdentifier initWithStringRepresentation:]();
    }

    v9 = 0;
  }

  return v9;
}

- (CALNNotificationIdentifier)initWithSourceIdentifier:(id)a3 sourceClientIdentifier:(id)a4 stringRepresentation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CALNNotificationIdentifier;
  v11 = [(CALNNotificationIdentifier *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    sourceIdentifier = v11->_sourceIdentifier;
    v11->_sourceIdentifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    sourceClientIdentifier = v11->_sourceClientIdentifier;
    v11->_sourceClientIdentifier = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    stringRepresentation = v11->_stringRepresentation;
    v11->_stringRepresentation = (NSString *)v16;
  }
  return v11;
}

- (unint64_t)hash
{
  id v3 = [(CALNNotificationIdentifier *)self sourceIdentifier];
  uint64_t v4 = [v3 hash];

  v5 = [(CALNNotificationIdentifier *)self sourceClientIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;

  id v7 = [(CALNNotificationIdentifier *)self sourceIdentifier];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(CALNNotificationIdentifier *)self isEqualToNotificationIdentifier:v4];

  return v5;
}

- (BOOL)isEqualToNotificationIdentifier:(id)a3
{
  id v4 = (CALNNotificationIdentifier *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    BOOL v5 = [(CALNNotificationIdentifier *)self sourceIdentifier];
    uint64_t v6 = [(CALNNotificationIdentifier *)v4 sourceIdentifier];
    int v7 = CalEqualStrings();

    if (v7
      && ([(CALNNotificationIdentifier *)self sourceClientIdentifier],
          unint64_t v8 = objc_claimAutoreleasedReturnValue(),
          [(CALNNotificationIdentifier *)v4 sourceClientIdentifier],
          id v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = CalEqualStrings(),
          v9,
          v8,
          v10))
    {
      v11 = [(CALNNotificationIdentifier *)self stringRepresentation];
      uint64_t v12 = [(CALNNotificationIdentifier *)v4 stringRepresentation];
      char v13 = CalEqualStrings();
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(CALNNotificationIdentifier *)self sourceIdentifier];
  uint64_t v6 = [(CALNNotificationIdentifier *)self sourceClientIdentifier];
  int v7 = [(CALNNotificationIdentifier *)self stringRepresentation];
  unint64_t v8 = [v3 stringWithFormat:@"<%@: %p>(sourceIdentifier = %@, sourceClientIdentifier = %@, stringRepresentation = %@)", v4, self, v5, v6, v7];

  return v8;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (NSString)sourceClientIdentifier
{
  return self->_sourceClientIdentifier;
}

- (NSString)stringRepresentation
{
  return self->_stringRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringRepresentation, 0);
  objc_storeStrong((id *)&self->_sourceClientIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
}

+ (void)_constructNotificationIdentifierStringRepresentationFromComponents:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Cannot construct notification identifier string representation from components since source identifier is an empty string. Components: %{public}@.", v2, v3, v4, v5, v6);
}

+ (void)_constructNotificationIdentifierStringRepresentationFromComponents:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Cannot construct notification identifier string representation from components since source client identifier is an empty string. Components: %{public}@.", v2, v3, v4, v5, v6);
}

+ (void)_constructNotificationIdentifierStringRepresentationFromComponents:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Cannot construct notification identifier string representation from components since source identifier could not be encoded. Components: %{public}@.", v2, v3, v4, v5, v6);
}

+ (void)_constructNotificationIdentifierStringRepresentationFromComponents:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2(&dword_2216BB000, v0, v1, "Constructed notification identifier string representation from components. String representation: %{public}@. Components: %{public}@.");
}

+ (void)_constructNotificationIdentifierStringRepresentationFromComponents:.cold.5()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_2216BB000, v0, OS_LOG_TYPE_DEBUG, "Constructing notification identifier string representation from components: %{public}@.", v1, 0xCu);
}

+ (void)_deconstructNotificationIdentifierStringRepresentationIntoComponents:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Cannot deconstruct notification identifier string representation into components since source identifier is an empty string. String representation: %{public}@.", v2, v3, v4, v5, v6);
}

+ (void)_deconstructNotificationIdentifierStringRepresentationIntoComponents:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Cannot deconstruct notification identifier string representation into components since source client identifier is an empty string. String representation: %{public}@.", v2, v3, v4, v5, v6);
}

+ (void)_deconstructNotificationIdentifierStringRepresentationIntoComponents:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2(&dword_2216BB000, v0, v1, "Deconstructed notification identifier string representation into components. String representation: %{public}@. Components: %{public}@.");
}

+ (void)_deconstructNotificationIdentifierStringRepresentationIntoComponents:.cold.4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_2216BB000, v0, OS_LOG_TYPE_DEBUG, "Deconstructing notification identifier string representation into components. String representation: %{public}@.", v1, 0xCu);
}

- (void)initWithSourceIdentifier:sourceClientIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_2216BB000, v0, OS_LOG_TYPE_ERROR, "Cannot initialize notification identifier with source client identifier and source client identifier because a string representation could not be constructed. Source identifier: %{public}@. Source Client identifier: %{public}@.", v1, 0x16u);
}

- (void)initWithStringRepresentation:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Cannot initialize notification identifier with string representation because string representation could not be deconstructed into components. String representation: %{public}@.", v2, v3, v4, v5, v6);
}

@end