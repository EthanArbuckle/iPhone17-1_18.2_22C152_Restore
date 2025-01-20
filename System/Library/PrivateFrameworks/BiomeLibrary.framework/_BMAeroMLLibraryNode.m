@interface _BMAeroMLLibraryNode
+ (id)DataCorrelations;
+ (id)Insights;
+ (id)LabeledData;
+ (id)RawEvent;
+ (id)identifier;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)validKeyPaths;
@end

@implementation _BMAeroMLLibraryNode

+ (id)identifier
{
  return @"AeroML";
}

+ (id)sublibraries
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v3 = [a1 DataCorrelations];
  v9[0] = v3;
  v4 = [a1 Insights];
  v9[1] = v4;
  v5 = [a1 LabeledData];
  v9[2] = v5;
  v6 = [a1 RawEvent];
  v9[3] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];

  return v7;
}

+ (id)RawEvent
{
  return (id)objc_opt_class();
}

+ (id)LabeledData
{
  return (id)objc_opt_class();
}

+ (id)Insights
{
  return (id)objc_opt_class();
}

+ (id)DataCorrelations
{
  return (id)objc_opt_class();
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

@end