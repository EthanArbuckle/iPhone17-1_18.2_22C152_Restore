@interface NSArray(BMDSLArray)
- (BMDSLArray)dslWithClass:()BMDSLArray;
- (BMDSLArray)dslWithValueClassName:()BMDSLArray;
@end

@implementation NSArray(BMDSLArray)

- (BMDSLArray)dslWithClass:()BMDSLArray
{
  v5 = [BMDSLArray alloc];
  v6 = NSStringFromClass(a3);
  v7 = [(BMDSLArray *)v5 initWithValues:a1 valueClassName:v6];

  return v7;
}

- (BMDSLArray)dslWithValueClassName:()BMDSLArray
{
  id v4 = a3;
  v5 = [[BMDSLArray alloc] initWithValues:a1 valueClassName:v4];

  return v5;
}

@end