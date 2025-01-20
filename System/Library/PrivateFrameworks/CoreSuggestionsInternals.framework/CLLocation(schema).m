@interface CLLocation(schema)
+ (id)fromSchema:()schema;
- (id)schema;
@end

@implementation CLLocation(schema)

- (id)schema
{
  v2 = objc_opt_new();
  [a1 coordinate];
  if (v3 != 0.0 || ([a1 coordinate], v4 != 0.0))
  {
    [v2 setObject:@"http://schema.org/GeoCoordinates" forKeyedSubscript:@"@type"];
    v5 = NSNumber;
    [a1 coordinate];
    v6 = objc_msgSend(v5, "numberWithDouble:");
    [v2 setObject:v6 forKeyedSubscript:@"latitude"];

    v7 = NSNumber;
    [a1 coordinate];
    v9 = [v7 numberWithDouble:v8];
    [v2 setObject:v9 forKeyedSubscript:@"longitude"];
  }
  if ((unint64_t)[v2 count] < 2) {
    id v10 = 0;
  }
  else {
    id v10 = v2;
  }

  return v10;
}

+ (id)fromSchema:()schema
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"longitude"];
  if (v4
    && (v5 = (void *)v4,
        [v3 objectForKeyedSubscript:@"latitude"],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    v7 = [v3 objectForKeyedSubscript:@"latitude"];
    [v7 floatValue];
    float v9 = v8;

    id v10 = [v3 objectForKeyedSubscript:@"longitude"];
    [v10 floatValue];
    float v12 = v11;

    id v13 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    double v14 = v9;
    double v15 = v12;
  }
  else
  {
    id v13 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    double v14 = 0.0;
    double v15 = 0.0;
  }
  v16 = (void *)[v13 initWithLatitude:v14 longitude:v15];

  return v16;
}

@end