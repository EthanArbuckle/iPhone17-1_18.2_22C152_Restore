@interface _BMSpringBoardLibraryNode
+ (id)Domino;
+ (id)ExternalDisplay;
+ (id)GestureEducation;
+ (id)WindowManagement;
+ (id)identifier;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)validKeyPaths;
@end

@implementation _BMSpringBoardLibraryNode

+ (id)identifier
{
  return @"SpringBoard";
}

+ (id)sublibraries
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v3 = [a1 Domino];
  v9[0] = v3;
  v4 = [a1 ExternalDisplay];
  v9[1] = v4;
  v5 = [a1 GestureEducation];
  v9[2] = v5;
  v6 = [a1 WindowManagement];
  v9[3] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];

  return v7;
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

+ (id)WindowManagement
{
  return (id)objc_opt_class();
}

+ (id)GestureEducation
{
  return (id)objc_opt_class();
}

+ (id)ExternalDisplay
{
  return (id)objc_opt_class();
}

+ (id)Domino
{
  return (id)objc_opt_class();
}

@end