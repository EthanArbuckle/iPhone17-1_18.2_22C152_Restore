@interface _BMLighthouseLibraryNode
+ (id)Ledger;
+ (id)identifier;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)validKeyPaths;
@end

@implementation _BMLighthouseLibraryNode

+ (id)identifier
{
  return @"Lighthouse";
}

+ (id)sublibraries
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 Ledger];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
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

+ (id)Ledger
{
  return (id)objc_opt_class();
}

@end