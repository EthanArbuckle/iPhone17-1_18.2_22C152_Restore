@interface _BMLibraryAndInternalLibraryNode
+ (id)identifier;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)validKeyPaths;
@end

@implementation _BMLibraryAndInternalLibraryNode

+ (id)sublibraries
{
  v2 = objc_opt_new();
  v3 = BiomeLibraryNodeBridge();
  v4 = v3;
  if (v3)
  {
    v5 = [v3 sublibraries];
    [v2 addObjectsFromArray:v5];
  }
  v6 = BiomeLibraryInternalNodeBridge();
  v7 = v6;
  if (v6)
  {
    v8 = [v6 sublibraries];
    [v2 addObjectsFromArray:v8];
  }

  return v2;
}

+ (id)identifier
{
  return @"BMLibraryAndInternalLibrary";
}

+ (id)streamNames
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)validKeyPaths
{
  v2 = objc_opt_new();

  return v2;
}

+ (id)streamWithName:(id)a3
{
  return 0;
}

@end