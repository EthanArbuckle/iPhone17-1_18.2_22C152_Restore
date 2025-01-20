@interface HKQuantityDatum(ClientDataCollection)
+ (id)quantityDatumWithHDQuantityDatum:()ClientDataCollection;
@end

@implementation HKQuantityDatum(ClientDataCollection)

+ (id)quantityDatumWithHDQuantityDatum:()ClientDataCollection
{
  v3 = (objc_class *)MEMORY[0x1E4F2B378];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = [v4 datumIdentifier];
  v7 = [v4 dateInterval];
  v8 = [v4 quantity];
  v9 = [v4 resumeContext];

  v10 = (void *)[v5 initWithIdentifier:v6 dateInterval:v7 quantity:v8 resumeContext:v9];

  return v10;
}

@end