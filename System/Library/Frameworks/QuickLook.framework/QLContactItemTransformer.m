@interface QLContactItemTransformer
+ (id)allowedOutputClasses;
- (id)transformedContentsFromData:(id)a3 context:(id)a4 error:(id *)a5;
@end

@implementation QLContactItemTransformer

+ (id)allowedOutputClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();

  return (id)[v2 setWithObject:v3];
}

- (id)transformedContentsFromData:(id)a3 context:(id)a4 error:(id *)a5
{
  id v12 = 0;
  v6 = [MEMORY[0x263EFEA70] contactsWithData:a3 error:&v12];
  id v7 = v12;
  v8 = v7;
  if (v7)
  {
    if (a5)
    {
      id v9 = v7;
LABEL_4:
      v10 = 0;
      *a5 = v9;
      goto LABEL_10;
    }
  }
  else
  {
    if ([v6 count])
    {
      v10 = [v6 firstObject];
      goto LABEL_10;
    }
    if (a5)
    {
      id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.quicklook.contactItemTransformer" code:1 userInfo:0];
      goto LABEL_4;
    }
  }
  v10 = 0;
LABEL_10:

  return v10;
}

@end