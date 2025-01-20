@interface CRJSObject
+ (id)objectWithClassName:(id)a3 objectType:(id)a4;
- (CRJSObject)initWithClassName:(id)a3 objectType:(int64_t)a4;
- (id)_backingObjectForJSValue:(id)a3;
- (id)backingObject;
- (id)backingObjectValueForKey:(id)a3;
- (void)_logErrorLog:(id)a3;
- (void)setBackingObjectValue:(id)a3 forKey:(id)a4;
@end

@implementation CRJSObject

- (CRJSObject)initWithClassName:(id)a3 objectType:(int64_t)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRJSObject;
  v7 = [(CRJSObject *)&v15 init];
  if (v7)
  {
    if (a4)
    {
      if (a4 != 1)
      {
        v13 = 0;
        goto LABEL_10;
      }
      v8 = @"_INPB";
    }
    else
    {
      v8 = @"_SFPB";
    }
    v9 = [(__CFString *)v8 stringByAppendingString:v6];
    v10 = NSClassFromString(v9);

    if ([(objc_class *)v10 isSubclassOfClass:objc_opt_class()])
    {
      id v11 = objc_alloc_init(v10);
      id backingObject = v7->_backingObject;
      v7->_id backingObject = v11;
    }
  }
  v13 = v7;
LABEL_10:

  return v13;
}

+ (id)objectWithClassName:(id)a3 objectType:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)objc_opt_class());
  v8 = [v6 toString];

  v9 = [v5 toNumber];

  v10 = objc_msgSend(v7, "initWithClassName:objectType:", v8, objc_msgSend(v9, "integerValue"));
  return v10;
}

- (void)setBackingObjectValue:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [v6 toString];
  if ([v9 isNull] & 1) != 0 || (objc_msgSend(v9, "isUndefined"))
  {
    v8 = 0;
  }
  else
  {
    v8 = [(CRJSObject *)self _backingObjectForJSValue:v9];
  }
  [self->_backingObject setValue:v8 forKey:v7];
}

- (id)backingObjectValueForKey:(id)a3
{
  v4 = [a3 toString];
  id v5 = (void *)MEMORY[0x263F10390];
  id v6 = [self->_backingObject valueForKey:v4];
  id v7 = [MEMORY[0x263F10378] currentContext];
  v8 = [v5 valueWithObject:v6 inContext:v7];

  return v8;
}

- (void)_logErrorLog:(id)a3
{
  v3 = (void *)MEMORY[0x263F10378];
  id v4 = a3;
  id v7 = [v3 currentContext];
  id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"( function() { console.error('%@'); }());",
                 v4);

  id v6 = (id)[v7 evaluateScript:v5];
}

- (id)_backingObjectForJSValue:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 valueForProperty:@"_backingObject"];
  if ([v5 isUndefined]) {
    id v6 = v4;
  }
  else {
    id v6 = v5;
  }
  id v7 = [v6 toObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = v7[1];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = v5;
      id v20 = v4;
      objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      obj = v7;
      uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v24 != v10) {
              objc_enumerationMutation(obj);
            }
            v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            v13 = (void *)MEMORY[0x22A66D010]();
            v14 = [v12 objectForKeyedSubscript:@"_backingObject"];
            id v15 = v14[1];
            v16 = [(CRJSObject *)self backingObject];
            int v17 = [v15 isEqual:v16];

            if (v17) {
              [(CRJSObject *)self _logErrorLog:@"Invalid object. Has reference cycles."];
            }
            else {
              [v21 addObject:v14[1]];
            }
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v9);
      }

      id v5 = v19;
      id v4 = v20;
    }
    else
    {
      id v21 = v7;
    }
  }

  return v21;
}

- (id)backingObject
{
  return self->_backingObject;
}

- (void).cxx_destruct
{
}

@end