@interface HMDValueTransformer
+ (Class)transformedValueClass;
+ (Class)valueClass;
+ (id)decodeValue:(id)a3 withTransformerNamed:(id)a4 error:(id *)a5;
+ (id)encodeValue:(id)a3 withTransformerNamed:(id)a4 error:(id *)a5;
+ (id)reverseTransformedValue:(id)a3 error:(id *)a4;
+ (id)sharedTransformer;
+ (id)transformedValue:(id)a3 error:(id *)a4;
+ (id)valueTransformerForName:(id)a3;
- (BOOL)isKindOfTransformer:(Class)a3;
- (HMDValueTransformer)init;
- (id)description;
- (id)reverseTransformedValue:(id)a3;
- (id)reverseTransformedValue:(id)a3 error:(id *)a4;
- (id)transformedValue:(id)a3;
- (id)transformedValue:(id)a3 error:(id *)a4;
@end

@implementation HMDValueTransformer

- (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_opt_class();
  if (sub_10000F1F8((uint64_t)v5, (uint64_t)[v6 transformedValueClass], a4))
  {
    v7 = [v6 reverseTransformedValue:v5 error:a4];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)transformedValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_opt_class();
  if (sub_10000F1F8((uint64_t)v5, (uint64_t)[v6 valueClass], a4))
  {
    v7 = [v6 transformedValue:v5 error:a4];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)reverseTransformedValue:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v13 = 0;
    id v5 = [(HMDValueTransformer *)self reverseTransformedValue:v4 error:&v13];
    id v6 = v13;
    if (!v5)
    {
      if (v6)
      {
        NSErrorUserInfoKey v14 = NSUnderlyingErrorKey;
        id v15 = v6;
        uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      }
      else
      {
        uint64_t v8 = 0;
      }
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      uint64_t v11 = +[NSString stringWithFormat:@"%@ reverseTransformedValue failed", v10];

      id v12 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v11 userInfo:v8];
      objc_exception_throw(v12);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)transformedValue:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v13 = 0;
    id v5 = [(HMDValueTransformer *)self transformedValue:v4 error:&v13];
    id v6 = v13;
    if (!v5)
    {
      if (v6)
      {
        NSErrorUserInfoKey v14 = NSUnderlyingErrorKey;
        id v15 = v6;
        uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      }
      else
      {
        uint64_t v8 = 0;
      }
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      uint64_t v11 = +[NSString stringWithFormat:@"%@ transformedValue failed", v10];

      id v12 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v11 userInfo:v8];
      objc_exception_throw(v12);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)isKindOfTransformer:(Class)a3
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)description
{
  v2 = objc_opt_class();

  return [v2 description];
}

- (HMDValueTransformer)init
{
  uint64_t v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    id v6 = NSStringFromSelector(a2);
    v7 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v6];
    id v8 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v7 userInfo:0];

    objc_exception_throw(v8);
  }
  v9.receiver = self;
  v9.super_class = (Class)HMDValueTransformer;
  return [(HMDValueTransformer *)&v9 init];
}

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = NSStringFromSelector(a2);
  v7 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v6];
  id v8 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

+ (id)transformedValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = NSStringFromSelector(a2);
  v7 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v6];
  id v8 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (Class)valueClass
{
  v2 = NSStringFromSelector(a2);
  v3 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

+ (id)valueTransformerForName:(id)a3
{
  id v3 = a3;
  id v4 = +[NSValueTransformer valueTransformerForName:v3];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
    }
    else
    {
      if (qword_100036C00 != -1) {
        dispatch_once(&qword_100036C00, &stru_10002C908);
      }
      id v5 = [(id)qword_100036BF8 objectForKey:v3];
      if (!v5)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          && ([v3 isEqualToString:NSKeyedUnarchiveFromDataTransformerName] & 1) == 0)
        {
          [v3 isEqualToString:NSUnarchiveFromDataTransformerName];
        }
        id v5 = [objc_alloc((Class)objc_opt_class()) initWithTransformer:v4];
        v7 = (void *)qword_100036BF8;
        id v8 = [v3 copy];
        [v7 setObject:v5 forKey:v8];
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)sharedTransformer
{
  v2 = NSStringFromClass((Class)a1);
  id v3 = +[NSValueTransformer valueTransformerForName:v2];

  return v3;
}

+ (id)decodeValue:(id)a3 withTransformerNamed:(id)a4 error:(id *)a5
{
  if (a4) {
    v7 = a4;
  }
  else {
    v7 = NSKeyedUnarchiveFromDataTransformerName;
  }
  id v8 = a3;
  objc_super v9 = sub_10000FFCC((uint64_t)a1, v7);
  v10 = [v9 reverseTransformedValue:v8 error:a5];

  return v10;
}

+ (id)encodeValue:(id)a3 withTransformerNamed:(id)a4 error:(id *)a5
{
  if (a4) {
    v7 = a4;
  }
  else {
    v7 = NSKeyedUnarchiveFromDataTransformerName;
  }
  id v8 = a3;
  objc_super v9 = sub_10000FFCC((uint64_t)a1, v7);
  v10 = [v9 transformedValue:v8 error:a5];

  return v10;
}

@end