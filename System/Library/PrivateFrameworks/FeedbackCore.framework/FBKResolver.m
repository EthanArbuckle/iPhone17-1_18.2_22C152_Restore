@interface FBKResolver
+ (id)name;
+ (id)resolverForName:(id)a3;
+ (id)resolverForName:(id)a3 arguments:(id)a4;
+ (id)resolverForQuestion:(id)a3;
- (NSArray)arguments;
- (id)run;
- (int64_t)expectedArguments;
- (void)setArguments:(id)a3;
@end

@implementation FBKResolver

+ (id)resolverForQuestion:(id)a3
{
  id v4 = a3;
  v5 = [v4 targetUserAgent];
  if (![@":FBA" isEqualToString:v5]) {
    goto LABEL_7;
  }
  v6 = [v4 userAgentPopulate];

  if (v6)
  {
    v7 = [v4 userAgentPopulate];
    v5 = [v7 componentsSeparatedByString:@","];

    if ([v5 count])
    {
      v8 = [v5 objectAtIndexedSubscript:0];
      v9 = [a1 resolverForName:v8];

      if (v9 && (unint64_t)[v5 count] >= 2)
      {
        v10 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 1, objc_msgSend(v5, "count") - 1);
        v11 = [v5 objectsAtIndexes:v10];
        [v9 setArguments:v11];
      }
      goto LABEL_8;
    }
LABEL_7:
    v9 = 0;
LABEL_8:

    goto LABEL_9;
  }
  v9 = 0;
LABEL_9:

  return v9;
}

+ (id)resolverForName:(id)a3 arguments:(id)a4
{
  id v6 = a4;
  v7 = [a1 resolverForName:a3];
  v8 = [v6 componentsSeparatedByString:@","];

  [v7 setArguments:v8];

  return v7;
}

+ (id)resolverForName:(id)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[FBKResolverCurrentBuild name];
  v10[0] = v4;
  v11[0] = objc_opt_class();
  v5 = +[FBKResolverModelName name];
  v10[1] = v5;
  v11[1] = objc_opt_class();
  id v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  v7 = [v6 objectForKeyedSubscript:v3];

  id v8 = objc_alloc_init(v7);

  return v8;
}

- (void)setArguments:(id)a3
{
}

+ (id)name
{
  return 0;
}

- (int64_t)expectedArguments
{
  return -1;
}

- (id)run
{
  return 0;
}

- (NSArray)arguments
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end