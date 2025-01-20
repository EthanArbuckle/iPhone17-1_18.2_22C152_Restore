@interface QLWebItemTransformer
+ (id)allowedOutputClasses;
- (id)transformedContentsFromData:(id)a3 context:(id)a4 error:(id *)a5;
- (id)transformedContentsFromURL:(id)a3 context:(id)a4 error:(id *)a5;
@end

@implementation QLWebItemTransformer

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

- (id)transformedContentsFromData:(id)a3 context:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 contentType];

  if (v8)
  {
    v9 = [QLGeneratedPreviewParts alloc];
    uint64_t v10 = [v7 stringEncoding];
    v11 = (void *)MEMORY[0x263F1D920];
    v12 = [v7 contentType];
    v13 = [v11 typeWithIdentifier:v12];
    v14 = [v13 preferredMIMEType];
    v15 = [v7 attachments];
    v8 = [(QLGeneratedPreviewParts *)v9 initWithData:v6 encoding:v10 mimeType:v14 attachments:v15];
  }

  return v8;
}

@end