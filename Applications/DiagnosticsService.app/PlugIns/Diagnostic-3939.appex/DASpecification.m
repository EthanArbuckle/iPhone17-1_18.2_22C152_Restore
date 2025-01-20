@interface DASpecification
+ (id)specificationFromArray:(id)a3;
- (DASpecification)init;
- (DASpecification)initWithDictionary:(id)a3;
@end

@implementation DASpecification

- (DASpecification)initWithDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DASpecification;
  v5 = [(DASpecification *)&v8 init];
  if (v5 && ![v4 count]) {
    v6 = 0;
  }
  else {
    v6 = v5;
  }

  return v6;
}

- (DASpecification)init
{
  return [(DASpecification *)self initWithDictionary:0];
}

+ (id)specificationFromArray:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v12 = objc_alloc((Class)a1);
        id v13 = [v12 initWithDictionary:v11, v16];
        if (!v13)
        {

          v5 = 0;
          goto LABEL_11;
        }
        v14 = v13;
        [v5 addObject:v13];
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

@end