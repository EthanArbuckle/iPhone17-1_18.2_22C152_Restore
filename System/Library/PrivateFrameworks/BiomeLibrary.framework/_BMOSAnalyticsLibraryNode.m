@interface _BMOSAnalyticsLibraryNode
+ (id)CA;
+ (id)Hardware;
+ (id)Stability;
+ (id)identifier;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)validKeyPaths;
@end

@implementation _BMOSAnalyticsLibraryNode

+ (id)identifier
{
  return @"OSAnalytics";
}

+ (id)sublibraries
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v3 = [a1 CA];
  v4 = objc_msgSend(a1, "Hardware", v3);
  v8[1] = v4;
  v5 = [a1 Stability];
  v8[2] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];

  return v6;
}

+ (id)streamWithName:(id)a3
{
  return 0;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = (void *)[v2 copy];

  return v3;
}

+ (id)streamNames
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)Stability
{
  return (id)objc_opt_class();
}

+ (id)Hardware
{
  return (id)objc_opt_class();
}

+ (id)CA
{
  return (id)objc_opt_class();
}

@end