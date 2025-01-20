@interface CNPostalAddress(schema)
+ (id)fromSchema:()schema;
- (id)schema;
@end

@implementation CNPostalAddress(schema)

- (id)schema
{
  v2 = objc_opt_new();
  [v2 setObject:@"http://schema.org/PostalAddress" forKeyedSubscript:@"@type"];
  uint64_t v3 = [a1 street];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [a1 street];
    char v6 = [v5 isEqualToString:&stru_1F24EEF20];

    if ((v6 & 1) == 0)
    {
      v7 = [a1 street];
      [v2 setObject:v7 forKeyedSubscript:@"streetAddress"];
    }
  }
  uint64_t v8 = [a1 city];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [a1 city];
    char v11 = [v10 isEqualToString:&stru_1F24EEF20];

    if ((v11 & 1) == 0)
    {
      v12 = [a1 city];
      [v2 setObject:v12 forKeyedSubscript:@"addressLocality"];
    }
  }
  uint64_t v13 = [a1 state];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [a1 state];
    char v16 = [v15 isEqualToString:&stru_1F24EEF20];

    if ((v16 & 1) == 0)
    {
      v17 = [a1 state];
      [v2 setObject:v17 forKeyedSubscript:@"addressRegion"];
    }
  }
  uint64_t v18 = [a1 postalCode];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [a1 postalCode];
    char v21 = [v20 isEqualToString:&stru_1F24EEF20];

    if ((v21 & 1) == 0)
    {
      v22 = [a1 postalCode];
      [v2 setObject:v22 forKeyedSubscript:@"postalCode"];
    }
  }
  uint64_t v23 = [a1 country];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [a1 country];
    char v26 = [v25 isEqualToString:&stru_1F24EEF20];

    if ((v26 & 1) == 0)
    {
      v27 = [a1 country];
      [v2 setObject:v27 forKeyedSubscript:@"addressCountry"];
    }
  }
  if ((unint64_t)[v2 count] < 2) {
    id v28 = 0;
  }
  else {
    id v28 = v2;
  }

  return v28;
}

+ (id)fromSchema:()schema
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 objectForKeyedSubscript:@"streetAddress"];

  if (v5)
  {
    char v6 = [v3 objectForKeyedSubscript:@"streetAddress"];
    [v4 setStreet:v6];
  }
  v7 = [v3 objectForKeyedSubscript:@"addressLocality"];

  if (v7)
  {
    uint64_t v8 = [v3 objectForKeyedSubscript:@"addressLocality"];
    [v4 setCity:v8];
  }
  v9 = [v3 objectForKeyedSubscript:@"addressRegion"];

  if (v9)
  {
    v10 = [v3 objectForKeyedSubscript:@"addressRegion"];
    [v4 setState:v10];
  }
  char v11 = [v3 objectForKeyedSubscript:@"postalCode"];

  if (v11)
  {
    v12 = [v3 objectForKeyedSubscript:@"postalCode"];
    [v4 setPostalCode:v12];
  }
  uint64_t v13 = [v3 objectForKeyedSubscript:@"addressCountry"];

  if (v13)
  {
    v14 = [v3 objectForKeyedSubscript:@"addressCountry"];
    [v4 setCountry:v14];
  }
  return v4;
}

@end