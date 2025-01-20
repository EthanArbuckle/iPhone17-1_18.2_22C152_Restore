@interface NSArray(INKeyImageProducing)
- (id)_keyImage;
- (uint64_t)_compareSubProducerOne:()INKeyImageProducing subProducerTwo:;
@end

@implementation NSArray(INKeyImageProducing)

- (uint64_t)_compareSubProducerOne:()INKeyImageProducing subProducerTwo:
{
  v6 = NSNumber;
  id v7 = a4;
  v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(a1, "indexOfObject:", a3));
  v9 = NSNumber;
  uint64_t v10 = [a1 indexOfObject:v7];

  v11 = [v9 numberWithUnsignedInteger:v10];
  uint64_t v12 = [v8 compare:v11];

  return v12;
}

- (id)_keyImage
{
  v2 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_4339];
  v3 = [a1 filteredArrayUsingPredicate:v2];

  v4 = INKeyImageUtilitiesKeyImageBySubProducerComparison(a1, v3);

  return v4;
}

@end