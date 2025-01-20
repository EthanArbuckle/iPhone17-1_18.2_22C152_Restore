@interface COStateReadRequest
+ (id)acceptableResponses;
@end

@implementation COStateReadRequest

+ (id)acceptableResponses
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", objc_opt_class(), 0);
  return v2;
}

@end