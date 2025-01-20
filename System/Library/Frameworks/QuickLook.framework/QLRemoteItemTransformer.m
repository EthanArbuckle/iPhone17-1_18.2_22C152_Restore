@interface QLRemoteItemTransformer
+ (id)allowedOutputClasses;
- (id)transformedContentsFromSpotlightSearchableItemInfo:(id)a3 context:(id)a4 error:(id *)a5;
- (id)transformedContentsFromURL:(id)a3 context:(id)a4 error:(id *)a5;
@end

@implementation QLRemoteItemTransformer

+ (id)allowedOutputClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

- (id)transformedContentsFromURL:(id)a3 context:(id)a4 error:(id *)a5
{
  id v5 = a3;

  return v5;
}

- (id)transformedContentsFromSpotlightSearchableItemInfo:(id)a3 context:(id)a4 error:(id *)a5
{
  id v5 = a3;

  return v5;
}

@end