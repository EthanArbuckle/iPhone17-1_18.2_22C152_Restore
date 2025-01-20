@interface NSDictionary
- (BOOL)ds_BOOLFromKey:(id)a3 defaultValue:(BOOL)a4 failed:(BOOL *)a5;
- (id)ds_numberFromKey:(id)a3 defaultValue:(id)a4 failed:(BOOL *)a5;
- (id)ds_numberFromKey:(id)a3 lowerBound:(id)a4 upperBound:(id)a5 defaultValue:(id)a6 failed:(BOOL *)a7;
@end

@implementation NSDictionary

- (id)ds_numberFromKey:(id)a3 lowerBound:(id)a4 upperBound:(id)a5 defaultValue:(id)a6 failed:(BOOL *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [(NSDictionary *)self objectForKey:a3];
  if (v15)
  {
    v16 = (void *)v15;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (id v17 = [v16 compare:v13], (unint64_t)objc_msgSend(v16, "compare:", v12) <= 1)
      && (unint64_t)v17 + 1 < 2)
    {
      id v18 = v16;
    }
    else
    {
      id v18 = v14;

      if (a7) {
        *a7 = 1;
      }
    }
  }
  else
  {
    id v18 = v14;
  }

  return v18;
}

- (id)ds_numberFromKey:(id)a3 defaultValue:(id)a4 failed:(BOOL *)a5
{
  id v8 = a4;
  uint64_t v9 = [(NSDictionary *)self objectForKey:a3];
  if (v9)
  {
    v10 = (void *)v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v10;
    }
    else
    {
      id v11 = v8;

      if (a5) {
        *a5 = 1;
      }
    }
  }
  else
  {
    id v11 = v8;
  }

  return v11;
}

- (BOOL)ds_BOOLFromKey:(id)a3 defaultValue:(BOOL)a4 failed:(BOOL *)a5
{
  v7 = [(NSDictionary *)self objectForKey:a3];
  if (!v7) {
    goto LABEL_4;
  }
  if (objc_opt_respondsToSelector())
  {
    a4 = [v7 BOOLValue];
LABEL_4:

    return a4;
  }
  if (!a5) {
    goto LABEL_4;
  }
  *a5 = 1;

  return a4;
}

@end