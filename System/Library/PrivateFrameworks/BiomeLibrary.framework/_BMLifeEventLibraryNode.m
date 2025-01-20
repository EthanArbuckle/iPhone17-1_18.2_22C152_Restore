@interface _BMLifeEventLibraryNode
+ (id)Intraday;
+ (id)Retrospective;
+ (id)identifier;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)validKeyPaths;
@end

@implementation _BMLifeEventLibraryNode

+ (id)identifier
{
  return @"LifeEvent";
}

+ (id)sublibraries
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v3 = [a1 Intraday];
  v7[0] = v3;
  v4 = [a1 Retrospective];
  v7[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
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

+ (id)Retrospective
{
  return (id)objc_opt_class();
}

+ (id)Intraday
{
  return (id)objc_opt_class();
}

@end