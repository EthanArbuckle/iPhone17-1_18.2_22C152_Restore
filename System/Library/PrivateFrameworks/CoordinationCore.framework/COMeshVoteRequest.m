@interface COMeshVoteRequest
+ (id)acceptableResponses;
@end

@implementation COMeshVoteRequest

+ (id)acceptableResponses
{
  id v2 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v3 = objc_opt_class();
  v4 = objc_msgSend(v2, "initWithObjects:", v3, objc_opt_class(), 0);
  return v4;
}

@end