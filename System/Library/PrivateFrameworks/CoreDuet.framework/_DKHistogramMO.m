@interface _DKHistogramMO
+ (id)fetchRequest;
@end

@implementation _DKHistogramMO

+ (id)fetchRequest
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"Histogram"];
  return v2;
}

@end