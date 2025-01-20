@interface CPMLEvalutionResult
- (double)getDouble;
- (id)getList;
- (id)getListDict;
- (id)getString;
- (id)getStringList;
- (id)init:(id)a3 withConfigurationList:(id)a4;
- (int)getInt;
@end

@implementation CPMLEvalutionResult

- (id)init:(id)a3 withConfigurationList:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPMLEvalutionResult;
  v7 = [(CPMLEvalutionResult *)&v10 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->object, a3);
    v8->count = [v8->object count];
  }

  return v8;
}

- (id)getString
{
  if (self->count)
  {
    v2 = [self->object objectAtIndexedSubscript:0];
    v3 = [v2 allKeys];
    v4 = [v3 objectAtIndexedSubscript:0];
  }
  else
  {
    v4 = @"CPMLER: Empty Result String";
  }

  return v4;
}

- (id)getStringList
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v4 = self->object;
  if ([v4 count])
  {
    unint64_t v5 = 0;
    do
    {
      id v6 = [v4 objectAtIndexedSubscript:v5];
      v7 = [v6 allKeys];
      v8 = [v7 objectAtIndexedSubscript:0];

      [v3 appendString:v8];
      [v3 appendString:@"\n"];

      ++v5;
    }
    while (v5 < [v4 count]);
  }

  return v3;
}

- (double)getDouble
{
  if (self->count != 1) {
    return -999.999;
  }
  v2 = [self->object objectAtIndexedSubscript:0];
  id v3 = [v2 allValues];
  v4 = [v3 objectAtIndexedSubscript:0];

  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (int)getInt
{
  if (self->count != 1) {
    return 999;
  }
  v2 = [self->object objectAtIndexedSubscript:0];
  id v3 = [v2 allValues];
  v4 = [v3 objectAtIndexedSubscript:0];

  LODWORD(v3) = [v4 intValue];
  return (int)v3;
}

- (id)getList
{
  id v3 = objc_opt_new();
  if ([self->object count])
  {
    unint64_t v4 = 0;
    do
    {
      double v5 = [self->object objectAtIndexedSubscript:v4];
      double v6 = [v5 allKeys];
      v7 = [v6 objectAtIndexedSubscript:0];

      [v3 addObject:v7];
      ++v4;
    }
    while (v4 < [self->object count]);
  }

  return v3;
}

- (id)getListDict
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = self->object;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end