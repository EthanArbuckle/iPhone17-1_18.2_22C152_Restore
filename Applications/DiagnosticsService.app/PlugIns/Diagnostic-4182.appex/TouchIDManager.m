@interface TouchIDManager
+ (id)convertDictionary:(id)a3 toJSON:(BOOL)a4;
+ (id)convertKey:(id)a3 toJSON:(BOOL)a4;
+ (id)runTouchIDDiagnostic:(int)a3 options:(id)a4;
@end

@implementation TouchIDManager

+ (id)runTouchIDDiagnostic:(int)a3 options:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  v6 = +[NSMutableDictionary dictionary];
  if (v5)
  {
    v7 = +[TouchIDManager convertDictionary:v5 toJSON:0];
  }
  else
  {
    v7 = &__NSDictionary0__struct;
  }
  char v17 = 0;
  v8 = [(objc_class *)+[DASoftLinking biometricKitClass:@"BiometricKit"] manager];
  v9 = v8;
  if (v8)
  {
    id v16 = 0;
    int v10 = [v8 diagnostics:v4 withOptions:v7 passed:&v17 withDetails:&v16];
    id v11 = v16;
    if (v11)
    {
      v12 = +[TouchIDManager convertDictionary:v11 toJSON:1];
      [v6 setObject:v12 forKeyedSubscript:@"data"];
    }
    if (v10)
    {
      v13 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100002978(v10, v13);
      }

      v14 = &off_100004418;
    }
    else if (v17)
    {
      v14 = &off_1000043E8;
    }
    else
    {
      v14 = &off_100004400;
    }
    [v6 setObject:v14 forKeyedSubscript:@"testStatus"];
  }
  else
  {
    [v6 setObject:&__NSDictionary0__struct forKeyedSubscript:@"data"];
    [v6 setObject:&off_1000043D0 forKeyedSubscript:@"testStatus"];
  }

  return v6;
}

+ (id)convertDictionary:(id)a3 toJSON:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [v5 mutableCopy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v7 = [v5 allKeys];
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v13 = [v5 objectForKey:v12];
        [v6 removeObjectForKey:v12];
        v14 = +[TouchIDManager convertKey:v12 toJSON:v4];
        [v6 setObject:v13 forKey:v14];
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (id)convertKey:(id)a3 toJSON:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [v5 mutableCopy];
  unsigned int v7 = [v5 characterAtIndex:0];

  if (v4)
  {
    if (v7 == 107)
    {
      [v6 deleteCharactersInRange:0, 1];
      id v8 = [v6 substringWithRange:0, 1];
      id v9 = [v8 lowercaseString];
      [v6 replaceCharactersInRange:0, 1, v9];
    }
  }
  else if (v7 != 107)
  {
    uint64_t v10 = [v6 substringWithRange:0, 1];
    id v11 = [v10 uppercaseString];
    [v6 replaceCharactersInRange:0, 1 withString:v11];

    [v6 insertString:@"k" atIndex:0];
  }

  return v6;
}

@end