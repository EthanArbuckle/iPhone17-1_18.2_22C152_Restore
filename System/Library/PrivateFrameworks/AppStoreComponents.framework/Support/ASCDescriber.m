@interface ASCDescriber
+ (id)nilObject;
- (ASCDescriber)initWithObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSMutableArray)properties;
- (NSObject)object;
- (id)describeObject;
- (id)describeProperties;
- (id)description;
- (id)finalizeDescription;
- (unint64_t)hash;
- (void)addBool:(BOOL)a3 withName:(id)a4;
- (void)addDouble:(double)a3 withName:(id)a4;
- (void)addInt64:(int64_t)a3 withName:(id)a4;
- (void)addInteger:(int64_t)a3 withName:(id)a4;
- (void)addObject:(id)a3 withName:(id)a4;
- (void)addSensitiveObject:(id)a3 withName:(id)a4;
- (void)addUInt64:(unint64_t)a3 withName:(id)a4;
- (void)addUnsignedInteger:(unint64_t)a3 withName:(id)a4;
@end

@implementation ASCDescriber

+ (id)nilObject
{
  return @"(null)";
}

- (ASCDescriber)initWithObject:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASCDescriber;
  v6 = [(ASCDescriber *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_object, a3);
    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    properties = v7->_properties;
    v7->_properties = v8;
  }
  return v7;
}

- (void)addBool:(BOOL)a3 withName:(id)a4
{
  id v5 = a4;
  NSStringFromBOOL();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(ASCDescriber *)self addObject:v6 withName:v5];
}

- (void)addInteger:(int64_t)a3 withName:(id)a4
{
  id v6 = a4;
  id v7 = +[NSNumber numberWithInteger:a3];
  [(ASCDescriber *)self addObject:v7 withName:v6];
}

- (void)addUnsignedInteger:(unint64_t)a3 withName:(id)a4
{
  id v6 = a4;
  id v7 = +[NSNumber numberWithUnsignedInteger:a3];
  [(ASCDescriber *)self addObject:v7 withName:v6];
}

- (void)addInt64:(int64_t)a3 withName:(id)a4
{
  id v6 = a4;
  id v7 = +[NSNumber numberWithLongLong:a3];
  [(ASCDescriber *)self addObject:v7 withName:v6];
}

- (void)addUInt64:(unint64_t)a3 withName:(id)a4
{
  id v6 = a4;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(ASCDescriber *)self addObject:v7 withName:v6];
}

- (void)addDouble:(double)a3 withName:(id)a4
{
  id v6 = a4;
  id v7 = +[NSNumber numberWithDouble:a3];
  [(ASCDescriber *)self addObject:v7 withName:v6];
}

- (void)addSensitiveObject:(id)a3 withName:(id)a4
{
  id v5 = a4;
  AMSHashIfNeeded();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(ASCDescriber *)self addObject:v6 withName:v5];
}

- (void)addObject:(id)a3 withName:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(ASCDescriber *)self properties];
  v8 = [ASCPair alloc];
  v9 = v11;
  if (!v11)
  {
    v9 = +[ASCDescriber nilObject];
  }
  v10 = [(ASCPair *)v8 initWithFirst:v6 second:v9];
  [v7 addObject:v10];

  if (!v11) {
}
  }

- (id)describeObject
{
  id v3 = objc_alloc((Class)NSString);
  v4 = [(ASCDescriber *)self object];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = [(ASCDescriber *)self object];
  id v8 = [v3 initWithFormat:@"%@:%p", v6, v7];

  return v8;
}

- (id)describeProperties
{
  id v3 = [(ASCDescriber *)self properties];
  id v4 = [v3 count];

  if (v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableString);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = [(ASCDescriber *)self properties];
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v5 length]) {
            [v5 appendString:@"; "];
          }
          v12 = [v11 first];
          v13 = [v11 second];
          [v5 appendFormat:@"%@ = %@", v12, v13];
        }
        id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    v14 = (__CFString *)[v5 copy];
  }
  else
  {
    v14 = &stru_10018BDF0;
  }

  return v14;
}

- (id)finalizeDescription
{
  id v3 = [(ASCDescriber *)self describeObject];
  id v4 = [(ASCDescriber *)self describeProperties];
  id v5 = [v4 length];
  id v6 = objc_alloc((Class)NSString);
  if (v5) {
    id v7 = [v6 initWithFormat:@"<%@ %@>", v3, v4];
  }
  else {
    id v7 = [v6 initWithFormat:@"<%@>", v3, v10];
  }
  id v8 = v7;

  return v8;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCDescriber *)self object];
  [(ASCHasher *)v3 combineObject:v4];

  id v5 = [(ASCDescriber *)self properties];
  [(ASCHasher *)v3 combineObject:v5];

  unint64_t v6 = [(ASCHasher *)v3 finalizeHash];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      unint64_t v6 = v5;
    }
    else {
      unint64_t v6 = 0;
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [(ASCDescriber *)self object];
    uint64_t v9 = [v7 object];
    uint64_t v10 = (void *)v9;
    if (v8 && v9)
    {
      if ([v8 isEqual:v9]) {
        goto LABEL_10;
      }
    }
    else if (v8 == (void *)v9)
    {
LABEL_10:
      id v11 = [(ASCDescriber *)self properties];
      uint64_t v12 = [v7 properties];
      v13 = (void *)v12;
      if (v11 && v12) {
        unsigned __int8 v14 = [v11 isEqual:v12];
      }
      else {
        unsigned __int8 v14 = v11 == (void *)v12;
      }

      goto LABEL_18;
    }
    unsigned __int8 v14 = 0;
LABEL_18:

    goto LABEL_19;
  }
  unsigned __int8 v14 = 0;
LABEL_19:

  return v14;
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(ASCDescriber *)self object];
  unint64_t v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = [(ASCDescriber *)self object];
  uint64_t v9 = [(ASCDescriber *)self properties];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@:%p object = <%@:%p>; properties = %@>",
    v4,
    self,
    v7,
    v8,
  uint64_t v10 = v9);

  return v10;
}

- (NSObject)object
{
  return self->_object;
}

- (NSMutableArray)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);

  objc_storeStrong((id *)&self->_object, 0);
}

@end