@interface HKElectrocardiogramBuilder(DemoData)
+ (id)builderFromDemoDataFile:()DemoData startDate:;
@end

@implementation HKElectrocardiogramBuilder(DemoData)

+ (id)builderFromDemoDataFile:()DemoData startDate:
{
  v5 = (objc_class *)MEMORY[0x1E4F2AF80];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initWithDataFileName:v7];

  v9 = (void *)[v8 newBuilderWithStartDate:v6];

  return v9;
}

@end