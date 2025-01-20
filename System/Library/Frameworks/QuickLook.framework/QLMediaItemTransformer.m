@interface QLMediaItemTransformer
+ (id)allowedOutputClasses;
- (id)transformedContentsFromURL:(id)a3 context:(id)a4 error:(id *)a5;
@end

@implementation QLMediaItemTransformer

+ (id)allowedOutputClasses
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
}

- (id)transformedContentsFromURL:(id)a3 context:(id)a4 error:(id *)a5
{
  v12[1] = *MEMORY[0x263EF8340];
  v5 = (objc_class *)MEMORY[0x263EFA8D0];
  id v6 = a3;
  id v7 = [v5 alloc];
  uint64_t v11 = *MEMORY[0x263EFA2A8];
  v12[0] = &unk_26C913138;
  v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v9 = (void *)[v7 initWithURL:v6 options:v8];

  return v9;
}

@end