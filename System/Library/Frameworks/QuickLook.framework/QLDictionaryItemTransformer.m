@interface QLDictionaryItemTransformer
+ (id)allowedOutputClasses;
- (id)transformedContentsFromData:(id)a3 context:(id)a4 error:(id *)a5;
- (id)transformedContentsFromURL:(id)a3 context:(id)a4 error:(id *)a5;
@end

@implementation QLDictionaryItemTransformer

+ (id)allowedOutputClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();

  return (id)[v2 setWithObject:v3];
}

- (id)transformedContentsFromURL:(id)a3 context:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(NSDictionary, "dictionaryWithContentsOfURL:", a3, a4, a5);
}

- (id)transformedContentsFromData:(id)a3 context:(id)a4 error:(id *)a5
{
  return (id)[MEMORY[0x263F08AC0] propertyListWithData:a3 options:0 format:0 error:a5];
}

@end