@interface NSDictionary
- (BOOL)tcr_BOOLForKey:(id)a3;
- (BOOL)tcr_BOOLForKey:(id)a3 missingValue:(BOOL)a4;
- (BOOL)tcr_BOOLForKeyPath:(id)a3;
- (BOOL)tcr_BOOLForKeyPath:(id)a3 missingValue:(BOOL)a4;
- (BOOL)tcr_nullForKey:(id)a3;
- (BOOL)tcr_nullForKeyPath:(id)a3;
- (float)tcr_floatForKey:(id)a3;
- (id)_tcr_associatedReader;
- (id)_tcr_valueOfClass:(Class)a3 forKey:(id)a4;
- (id)lib_objectForCaseInsensitiveKey:(id)a3;
- (id)tcr_arrayForKey:(id)a3;
- (id)tcr_arrayForKeyPath:(id)a3;
- (id)tcr_dataForKey:(id)a3;
- (id)tcr_dataForKeyPath:(id)a3;
- (id)tcr_dateForKey:(id)a3;
- (id)tcr_dateForKeyPath:(id)a3;
- (id)tcr_dictionaryForKey:(id)a3;
- (id)tcr_dictionaryForKeyPath:(id)a3;
- (id)tcr_integerValueForKey:(id)a3;
- (id)tcr_integerValueForKeyPath:(id)a3;
- (id)tcr_numberForKey:(id)a3;
- (id)tcr_numberForKeyPath:(id)a3;
- (id)tcr_stringForKey:(id)a3;
- (id)tcr_stringForKeyPath:(id)a3;
- (id)tcr_urlForKey:(id)a3;
- (id)tcr_urlForKeyPath:(id)a3;
- (int64_t)tcr_integerValueForKey:(id)a3 missingValue:(int64_t)a4;
- (int64_t)tcr_integerValueForKeyPath:(id)a3 missingValue:(int64_t)a4;
- (unint64_t)tcr_unsignedLongLongForKey:(id)a3;
- (unint64_t)tcr_unsignedLongLongForKeyPath:(id)a3;
@end

@implementation NSDictionary

- (id)lib_objectForCaseInsensitiveKey:(id)a3
{
  v4 = [a3 lowercaseString];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [(NSDictionary *)self keyEnumerator];
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = [v10 lowercaseString];
        unsigned __int8 v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          v13 = [(NSDictionary *)self objectForKeyedSubscript:v10];
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (id)tcr_arrayForKey:(id)a3
{
  id v4 = a3;
  v5 = [(NSDictionary *)self _tcr_valueOfClass:objc_opt_class() forKey:v4];

  return v5;
}

- (id)tcr_arrayForKeyPath:(id)a3
{
  id v4 = a3;
  v5 = [(NSDictionary *)self _tcr_associatedReader];
  id v6 = [v5 valueOfClass:objc_opt_class() forKeyPath:v4];

  return v6;
}

- (BOOL)tcr_BOOLForKey:(id)a3
{
  return [(NSDictionary *)self tcr_BOOLForKey:a3 missingValue:0];
}

- (BOOL)tcr_BOOLForKey:(id)a3 missingValue:(BOOL)a4
{
  v5 = [(NSDictionary *)self tcr_numberForKey:a3];
  id v6 = v5;
  if (v5) {
    a4 = [v5 BOOLValue];
  }

  return a4;
}

- (BOOL)tcr_BOOLForKeyPath:(id)a3
{
  return [(NSDictionary *)self tcr_BOOLForKeyPath:a3 missingValue:0];
}

- (BOOL)tcr_BOOLForKeyPath:(id)a3 missingValue:(BOOL)a4
{
  v5 = [(NSDictionary *)self tcr_numberForKeyPath:a3];
  id v6 = v5;
  if (v5) {
    a4 = [v5 BOOLValue];
  }

  return a4;
}

- (id)tcr_dataForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(NSDictionary *)self _tcr_valueOfClass:objc_opt_class() forKey:v4];
  if (!v5)
  {
    id v6 = [(NSDictionary *)self _tcr_valueOfClass:objc_opt_class() forKey:v4];
    if (v6) {
      id v5 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v6 options:0];
    }
    else {
      id v5 = 0;
    }
  }

  return v5;
}

- (id)tcr_dataForKeyPath:(id)a3
{
  id v4 = a3;
  id v5 = [(NSDictionary *)self _tcr_associatedReader];
  id v6 = [v5 valueOfClass:objc_opt_class() forKeyPath:v4];
  if (!v6)
  {
    id v7 = [v5 valueOfClass:objc_opt_class() forKeyPath:v4];
    if (v7) {
      id v6 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v7 options:0];
    }
    else {
      id v6 = 0;
    }
  }

  return v6;
}

- (id)tcr_dateForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(NSDictionary *)self _tcr_valueOfClass:objc_opt_class() forKey:v4];

  return v5;
}

- (id)tcr_dateForKeyPath:(id)a3
{
  id v4 = a3;
  id v5 = [(NSDictionary *)self _tcr_associatedReader];
  id v6 = [v5 valueOfClass:objc_opt_class() forKeyPath:v4];

  return v6;
}

- (id)tcr_dictionaryForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(NSDictionary *)self _tcr_valueOfClass:objc_opt_class() forKey:v4];

  return v5;
}

- (id)tcr_dictionaryForKeyPath:(id)a3
{
  id v4 = a3;
  id v5 = [(NSDictionary *)self _tcr_associatedReader];
  id v6 = [v5 valueOfClass:objc_opt_class() forKeyPath:v4];

  return v6;
}

- (float)tcr_floatForKey:(id)a3
{
  v3 = [(NSDictionary *)self tcr_numberForKey:a3];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (id)tcr_integerValueForKey:(id)a3
{
  id v4 = a3;
  float v5 = [(NSDictionary *)self _tcr_valueOfClass:objc_opt_class() forKey:v4];
  if (!v5)
  {
    id v6 = [(NSDictionary *)self _tcr_valueOfClass:objc_opt_class() forKey:v4];
    if (v6)
    {
      uint64_t v9 = 0;
      id v7 = +[NSScanner scannerWithString:v6];
      float v5 = 0;
      if ([v7 scanInteger:&v9])
      {
        float v5 = +[NSNumber numberWithInteger:v9];
      }
    }
    else
    {
      float v5 = 0;
    }
  }

  return v5;
}

- (int64_t)tcr_integerValueForKey:(id)a3 missingValue:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(NSDictionary *)self _tcr_valueOfClass:objc_opt_class() forKey:v6];
  if (!v7)
  {
    id v7 = [(NSDictionary *)self _tcr_valueOfClass:objc_opt_class() forKey:v6];
  }
  if (objc_opt_respondsToSelector()) {
    a4 = (int64_t)[v7 integerValue];
  }

  return a4;
}

- (id)tcr_integerValueForKeyPath:(id)a3
{
  id v4 = a3;
  float v5 = [(NSDictionary *)self _tcr_associatedReader];
  id v6 = [v5 valueOfClass:objc_opt_class() forKeyPath:v4];
  if (!v6)
  {
    id v7 = [v5 valueOfClass:objc_opt_class() forKeyPath:v4];
    if (v7)
    {
      uint64_t v10 = 0;
      uint64_t v8 = +[NSScanner scannerWithString:v7];
      id v6 = 0;
      if ([v8 scanInteger:&v10])
      {
        id v6 = +[NSNumber numberWithInteger:v10];
      }
    }
    else
    {
      id v6 = 0;
    }
  }

  return v6;
}

- (int64_t)tcr_integerValueForKeyPath:(id)a3 missingValue:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(NSDictionary *)self _tcr_associatedReader];
  uint64_t v8 = [v7 valueOfClass:objc_opt_class() forKeyPath:v6];
  if (!v8)
  {
    uint64_t v8 = [v7 valueOfClass:objc_opt_class() forKeyPath:v6];
  }
  if (objc_opt_respondsToSelector()) {
    a4 = (int64_t)[v8 integerValue];
  }

  return a4;
}

- (BOOL)tcr_nullForKey:(id)a3
{
  id v4 = a3;
  float v5 = [(NSDictionary *)self _tcr_valueOfClass:objc_opt_class() forKey:v4];

  id v6 = +[NSNull null];
  BOOL v7 = v5 == v6;

  return v7;
}

- (BOOL)tcr_nullForKeyPath:(id)a3
{
  id v4 = a3;
  float v5 = [(NSDictionary *)self _tcr_associatedReader];
  id v6 = [v5 valueOfClass:objc_opt_class() forKeyPath:v4];

  BOOL v7 = +[NSNull null];
  LOBYTE(v4) = v6 == v7;

  return (char)v4;
}

- (id)tcr_numberForKey:(id)a3
{
  id v4 = a3;
  float v5 = [(NSDictionary *)self _tcr_valueOfClass:objc_opt_class() forKey:v4];
  if (!v5)
  {
    id v6 = [(NSDictionary *)self _tcr_valueOfClass:objc_opt_class() forKey:v4];
    if (v6)
    {
      id v7 = objc_alloc_init((Class)NSNumberFormatter);
      [v7 setNumberStyle:1];
      float v5 = [v7 numberFromString:v6];
    }
    else
    {
      float v5 = 0;
    }
  }

  return v5;
}

- (id)tcr_numberForKeyPath:(id)a3
{
  id v4 = a3;
  float v5 = [(NSDictionary *)self _tcr_associatedReader];
  id v6 = [v5 valueOfClass:objc_opt_class() forKeyPath:v4];
  if (!v6)
  {
    id v7 = [v5 valueOfClass:objc_opt_class() forKeyPath:v4];
    if (v7)
    {
      id v8 = objc_alloc_init((Class)NSNumberFormatter);
      [v8 setNumberStyle:1];
      id v6 = [v8 numberFromString:v7];
    }
    else
    {
      id v6 = 0;
    }
  }

  return v6;
}

- (id)tcr_stringForKey:(id)a3
{
  id v4 = a3;
  float v5 = [(NSDictionary *)self _tcr_valueOfClass:objc_opt_class() forKey:v4];

  return v5;
}

- (id)tcr_stringForKeyPath:(id)a3
{
  id v4 = a3;
  float v5 = [(NSDictionary *)self _tcr_associatedReader];
  id v6 = [v5 valueOfClass:objc_opt_class() forKeyPath:v4];

  return v6;
}

- (unint64_t)tcr_unsignedLongLongForKey:(id)a3
{
  v3 = [(NSDictionary *)self tcr_numberForKey:a3];
  id v4 = [v3 unsignedLongLongValue];

  return (unint64_t)v4;
}

- (unint64_t)tcr_unsignedLongLongForKeyPath:(id)a3
{
  v3 = [(NSDictionary *)self tcr_numberForKeyPath:a3];
  id v4 = [v3 unsignedLongLongValue];

  return (unint64_t)v4;
}

- (id)tcr_urlForKey:(id)a3
{
  v3 = [(NSDictionary *)self tcr_stringForKey:a3];
  if (v3)
  {
    id v4 = +[NSURL URLWithString:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)tcr_urlForKeyPath:(id)a3
{
  v3 = [(NSDictionary *)self tcr_stringForKeyPath:a3];
  if (v3)
  {
    id v4 = +[NSURL URLWithString:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_tcr_valueOfClass:(Class)a3 forKey:(id)a4
{
  id v4 = [(NSDictionary *)self objectForKeyedSubscript:a4];
  if (objc_opt_isKindOfClass()) {
    float v5 = v4;
  }
  else {
    float v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)_tcr_associatedReader
{
  v6.receiver = self;
  v6.super_class = (Class)NSDictionary;
  v3 = [(NSDictionary *)&v6 _tcr_associatedReader];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = [[TypeCheckedDictionaryReader alloc] initWithDictionary:self];

    [(NSDictionary *)self _tcr_associateWithReader:v4];
    v3 = v4;
  }

  return v3;
}

@end