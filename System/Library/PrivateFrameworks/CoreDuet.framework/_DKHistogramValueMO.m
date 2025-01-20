@interface _DKHistogramValueMO
+ (id)fetchRequest;
@end

@implementation _DKHistogramValueMO

+ (id)fetchRequest
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"HistogramValue"];
  return v2;
}

@end