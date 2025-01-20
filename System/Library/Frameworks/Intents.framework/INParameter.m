@interface INParameter
+ (BOOL)supportsSecureCoding;
+ (INParameter)parameterForClass:(Class)aClass keyPath:(NSString *)keyPath;
- (BOOL)isEqual:(id)a3;
- (Class)parameterClass;
- (INParameter)init;
- (INParameter)initWithCoder:(id)a3;
- (NSMutableDictionary)_indexesForSubKeyPaths;
- (NSString)_subscriptedKeyPath;
- (NSString)parameterKeyPath;
- (NSUInteger)indexForSubKeyPath:(NSString *)subKeyPath;
- (id)_dictionaryRepresentation;
- (id)_parameterValueForParameterizedObject:(id)a3;
- (id)_sanitizedKeyPathForKeyPath:(id)a3 removingSubscripts:(BOOL)a4;
- (id)_valueOfObject:(id)a3 forRemainingKeyPath:(id)a4 inFullyQualifiedKeyPath:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionAtIndent:(unint64_t)a3;
- (id)parameterValue;
- (id)parameterizedObject;
- (unint64_t)hash;
- (void)_setIndexesForKeyPathWithSubscripts:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIndex:(NSUInteger)index forSubKeyPath:(NSString *)subKeyPath;
- (void)setParameterClass:(Class)a3;
- (void)setParameterKeyPath:(id)a3;
- (void)set_indexesForSubKeyPaths:(id)a3;
@end

@implementation INParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterKeyPath, 0);
  objc_storeStrong((id *)&self->_parameterClass, 0);

  objc_storeStrong((id *)&self->_indexesForSubKeyPaths, 0);
}

- (void)setParameterKeyPath:(id)a3
{
}

- (NSString)parameterKeyPath
{
  return self->_parameterKeyPath;
}

- (void)setParameterClass:(Class)a3
{
}

- (Class)parameterClass
{
  return self->_parameterClass;
}

- (void)set_indexesForSubKeyPaths:(id)a3
{
}

- (NSMutableDictionary)_indexesForSubKeyPaths
{
  return self->_indexesForSubKeyPaths;
}

- (void)encodeWithCoder:(id)a3
{
  parameterClass = self->_parameterClass;
  id v6 = a3;
  v5 = NSStringFromClass(parameterClass);
  [v6 encodeObject:v5 forKey:@"parameterClass"];

  [v6 encodeObject:self->_parameterKeyPath forKey:@"parameterKeyPath"];
  [v6 encodeObject:self->_indexesForSubKeyPaths forKey:@"_indexesForSubKeyPaths"];
}

- (INParameter)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)INParameter;
  v5 = [(INParameter *)&v18 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameterClass"];
    uint64_t v7 = NSClassFromString(v6);
    Class parameterClass = v5->_parameterClass;
    v5->_Class parameterClass = (Class)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameterKeyPath"];
    parameterKeyPath = v5->_parameterKeyPath;
    v5->_parameterKeyPath = (NSString *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"_indexesForSubKeyPaths"];
    indexesForSubKeyPaths = v5->_indexesForSubKeyPaths;
    v5->_indexesForSubKeyPaths = (NSMutableDictionary *)v15;
  }
  return v5;
}

- (id)_dictionaryRepresentation
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSStringFromClass([(INParameter *)self parameterClass]);
  id v4 = (void *)v3;
  v5 = @"(nil)";
  if (v3) {
    v5 = (__CFString *)v3;
  }
  v10[0] = @"parameterKeyPath (subscripted)";
  id v6 = v5;
  uint64_t v7 = [(INParameter *)self _subscriptedKeyPath];
  v10[1] = @"parameterClass";
  v11[0] = v7;
  v11[1] = v6;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INParameter;
  id v6 = [(INParameter *)&v11 description];
  uint64_t v7 = [(INParameter *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  uint64_t v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (id)description
{
  return [(INParameter *)self descriptionAtIndent:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = NSStringFromClass([(INParameter *)self parameterClass]);
  id v6 = (NSString *)[v5 copyWithZone:a3];
  Class v7 = NSClassFromString(v6);
  v8 = [(INParameter *)self parameterKeyPath];
  uint64_t v9 = (void *)[v8 copyWithZone:a3];
  v10 = +[INParameter parameterForClass:v7 keyPath:v9];

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = NSStringFromClass([(INParameter *)self parameterClass]);
  uint64_t v4 = [v3 hash];
  v5 = [(INParameter *)self parameterKeyPath];
  uint64_t v6 = [v5 hash];
  Class v7 = [(INParameter *)self _indexesForSubKeyPaths];
  unint64_t v8 = v6 ^ [v7 hash] ^ v4;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = NSStringFromClass((Class)[v4 parameterClass]);
    uint64_t v6 = NSStringFromClass([(INParameter *)self parameterClass]);
    if ([v5 isEqualToString:v6])
    {
      Class v7 = [v4 parameterKeyPath];
      unint64_t v8 = [(INParameter *)self parameterKeyPath];
      if ([v7 isEqualToString:v8])
      {
        uint64_t v9 = [v4 _indexesForSubKeyPaths];
        v10 = [(INParameter *)self _indexesForSubKeyPaths];
        char v11 = [v9 isEqualToDictionary:v10];
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
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (INParameter)init
{
  v6.receiver = self;
  v6.super_class = (Class)INParameter;
  v2 = [(INParameter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    indexesForSubKeyPaths = v2->_indexesForSubKeyPaths;
    v2->_indexesForSubKeyPaths = v3;
  }
  return v2;
}

- (id)parameterizedObject
{
  return 0;
}

- (id)parameterValue
{
  return 0;
}

- (id)_parameterValueForParameterizedObject:(id)a3
{
  id v4 = a3;
  v5 = [(INParameter *)self parameterKeyPath];
  objc_super v6 = [(INParameter *)self parameterKeyPath];
  Class v7 = [(INParameter *)self _valueOfObject:v4 forRemainingKeyPath:v5 inFullyQualifiedKeyPath:v6];

  return v7;
}

- (void)_setIndexesForKeyPathWithSubscripts:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v25 = v3;
  id obj = [v3 componentsSeparatedByString:@"."];
  uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v32;
    unint64_t v8 = 0x1E4F28000uLL;
    v26 = v4;
    uint64_t v27 = *(void *)v32;
    do
    {
      uint64_t v9 = 0;
      uint64_t v29 = v6;
      do
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
        char v11 = [*(id *)(v8 + 2952) characterSetWithCharactersInString:@"[]"];
        uint64_t v12 = [v10 componentsSeparatedByCharactersInSet:v11];

        uint64_t v13 = [v12 firstObject];
        [v4 addObject:v13];
        if ((unint64_t)[v12 count] >= 2)
        {
          v14 = [v12 objectAtIndexedSubscript:1];
          uint64_t v15 = [v4 componentsJoinedByString:@"."];
          uint64_t v16 = [v14 integerValue];
          unint64_t v17 = v8;
          objc_super v18 = [*(id *)(v8 + 2952) decimalDigitCharacterSet];
          v19 = [v18 invertedSet];
          uint64_t v20 = [v14 rangeOfCharacterFromSet:v19];

          if (v20 != 0x7FFFFFFFFFFFFFFFLL || v16 < 0)
          {
            v21 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v22 = *MEMORY[0x1E4F1C3B8];
            v23 = [NSString stringWithFormat:@"Invalid index <%@> for key path <%@>", v14, v15];
            id v24 = [v21 exceptionWithName:v22 reason:v23 userInfo:0];

            objc_exception_throw(v24);
          }
          [(INParameter *)self setIndex:v16 forSubKeyPath:v15];

          id v4 = v26;
          uint64_t v7 = v27;
          unint64_t v8 = v17;
          uint64_t v6 = v29;
        }

        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v6);
  }
}

- (NSString)_subscriptedKeyPath
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:self->_parameterKeyPath];
  id v4 = [(NSMutableDictionary *)self->_indexesForSubKeyPaths allKeys];
  uint64_t v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_53368];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        char v11 = NSString;
        uint64_t v12 = NSNumber;
        uint64_t v13 = [(NSMutableDictionary *)self->_indexesForSubKeyPaths objectForKey:v10];
        v14 = objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "integerValue"));
        uint64_t v15 = [v11 stringWithFormat:@"%@[%@]", v10, v14];
        objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", v10, v15, 8, 0, objc_msgSend(v3, "length"));
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  uint64_t v16 = (void *)[v3 copy];

  return (NSString *)v16;
}

uint64_t __34__INParameter__subscriptedKeyPath__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a2;
  uint64_t v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(a3, "length"));
  uint64_t v7 = NSNumber;
  uint64_t v8 = [v5 length];

  uint64_t v9 = [v7 numberWithUnsignedInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

- (id)_sanitizedKeyPathForKeyPath:(id)a3 removingSubscripts:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 componentsSeparatedByString:@"."];
  uint64_t v8 = (void *)[v7 mutableCopy];

  uint64_t v9 = [v8 firstObject];
  uint64_t v10 = NSStringFromClass([(INParameter *)self parameterClass]);
  int v11 = [v9 isEqualToString:v10];

  if (v11)
  {
    [v8 removeObject:v9];
    id v12 = [v8 componentsJoinedByString:@"."];
  }
  else
  {
    id v12 = v6;
  }
  uint64_t v13 = v12;
  if (v4)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __62__INParameter__sanitizedKeyPathForKeyPath_removingSubscripts___block_invoke;
    v17[3] = &unk_1E5519850;
    id v14 = v8;
    id v18 = v14;
    [v14 enumerateObjectsUsingBlock:v17];
    uint64_t v15 = [v14 componentsJoinedByString:@"."];

    uint64_t v13 = (void *)v15;
  }

  return v13;
}

void __62__INParameter__sanitizedKeyPathForKeyPath_removingSubscripts___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = [a2 componentsSeparatedByString:@"["];
  id v5 = [v6 firstObject];
  [*(id *)(a1 + 32) setObject:v5 atIndexedSubscript:a3];
}

- (id)_valueOfObject:(id)a3 forRemainingKeyPath:(id)a4 inFullyQualifiedKeyPath:(id)a5
{
  id v25 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 componentsSeparatedByString:@"."];
  int v11 = (void *)[v10 mutableCopy];

  id v12 = [v11 firstObject];
  [v11 removeObject:v12];
  uint64_t v13 = [v9 rangeOfString:v12];
  uint64_t v15 = v13 + v14;
  if (v13 + v14 >= 0 && v15 <= [v9 length])
  {
    unint64_t v17 = [v9 substringToIndex:v15];
    if (v17)
    {
      uint64_t v16 = [(NSMutableDictionary *)self->_indexesForSubKeyPaths objectForKey:v17];
    }
    else
    {
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v16 = 0;
    unint64_t v17 = 0;
  }
  id v18 = [v25 valueForKey:v12];
  long long v19 = v18;
  if (v16)
  {
    objc_msgSend(v18, "objectAtIndex:", objc_msgSend(v16, "unsignedIntegerValue"));
    id v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v20 = v18;
  }
  long long v21 = v20;
  if ([v11 count])
  {
    long long v22 = [v11 componentsJoinedByString:@"."];
    uint64_t v23 = [(INParameter *)self _valueOfObject:v21 forRemainingKeyPath:v22 inFullyQualifiedKeyPath:v9];

    long long v21 = (void *)v23;
  }

  return v21;
}

- (NSUInteger)indexForSubKeyPath:(NSString *)subKeyPath
{
  id v3 = [(NSMutableDictionary *)self->_indexesForSubKeyPaths objectForKey:subKeyPath];
  BOOL v4 = v3;
  if (v3) {
    NSUInteger v5 = [v3 unsignedIntegerValue];
  }
  else {
    NSUInteger v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (void)setIndex:(NSUInteger)index forSubKeyPath:(NSString *)subKeyPath
{
  id v8 = [(INParameter *)self _sanitizedKeyPathForKeyPath:subKeyPath removingSubscripts:1];
  if (v8)
  {
    indexesForSubKeyPaths = self->_indexesForSubKeyPaths;
    uint64_t v7 = [NSNumber numberWithUnsignedInteger:index];
    [(NSMutableDictionary *)indexesForSubKeyPaths setValue:v7 forKey:v8];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (INParameter)parameterForClass:(Class)aClass keyPath:(NSString *)keyPath
{
  NSUInteger v5 = keyPath;
  id v6 = objc_alloc_init(INParameter);
  [(INParameter *)v6 setParameterClass:aClass];
  uint64_t v7 = [(INParameter *)v6 _sanitizedKeyPathForKeyPath:v5 removingSubscripts:1];
  if (v7)
  {
    [(INParameter *)v6 setParameterKeyPath:v7];
    id v8 = [(INParameter *)v6 _sanitizedKeyPathForKeyPath:v5 removingSubscripts:0];
    [(INParameter *)v6 _setIndexesForKeyPathWithSubscripts:v8];
  }
  else
  {
    id v8 = v6;
    id v6 = 0;
  }

  return v6;
}

@end