@interface _BMWalletPaymentsCommerceLibraryNode
+ (id)FinancialInsights;
+ (id)UserProofing;
+ (id)identifier;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)validKeyPaths;
@end

@implementation _BMWalletPaymentsCommerceLibraryNode

+ (id)identifier
{
  return @"WalletPaymentsCommerce";
}

+ (id)sublibraries
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v3 = [a1 FinancialInsights];
  v7[0] = v3;
  v4 = [a1 UserProofing];
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

+ (id)UserProofing
{
  return (id)objc_opt_class();
}

+ (id)FinancialInsights
{
  return (id)objc_opt_class();
}

@end