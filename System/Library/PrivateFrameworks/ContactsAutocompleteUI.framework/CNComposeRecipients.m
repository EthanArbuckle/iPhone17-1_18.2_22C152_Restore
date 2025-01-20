@interface CNComposeRecipients
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
- (CNComposeRecipients)initWithRecipients:(id)a3;
- (NSArray)recipients;
@end

@implementation CNComposeRecipients

- (CNComposeRecipients)initWithRecipients:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNComposeRecipients;
  v6 = [(CNComposeRecipients *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_recipients, a3);
  }

  return v7;
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  v2 = [NSString readableTypeIdentifiersForItemProvider];
  v3 = [MEMORY[0x1E4F1CB10] readableTypeIdentifiersForItemProvider];
  v4 = [v2 arrayByAddingObjectsFromArray:v3];

  return (NSArray *)v4;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x1E4F1CB10] readableTypeIdentifiersForItemProvider];
  int v11 = [v10 containsObject:v9];

  if (v11)
  {
    id v44 = 0;
    v12 = [MEMORY[0x1E4F1CB10] objectWithItemProviderData:v8 typeIdentifier:v9 error:&v44];
    uint64_t v13 = (uint64_t)v44;
  }
  else
  {
    v14 = [NSString readableTypeIdentifiersForItemProvider];
    int v15 = [v14 containsObject:v9];

    if (v15)
    {
      id v43 = 0;
      v16 = [NSString objectWithItemProviderData:v8 typeIdentifier:v9 error:&v43];
      uint64_t v13 = (uint64_t)v43;
      v17 = [MEMORY[0x1E4F1CB10] URLWithString:v16];
      v12 = v17;
      if (v16)
      {
        v18 = [v17 scheme];

        if (!v18)
        {
          v19 = [v16 stringByReplacingOccurrencesOfString:@"\n", @", " withString];
          [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
          id v20 = v9;
          id v21 = v8;
          v23 = v22 = a5;
          [v19 stringByAddingPercentEncodingWithAllowedCharacters:v23];
          v41 = v12;
          v25 = id v24 = a1;

          a5 = v22;
          id v8 = v21;
          id v9 = v20;

          v16 = [@"mailto:" stringByAppendingString:v25];

          a1 = v24;
          v12 = [MEMORY[0x1E4F1CB10] URLWithString:v16];
        }
      }
    }
    else
    {
      v12 = 0;
      uint64_t v13 = 0;
    }
  }
  v26 = [v12 scheme];
  uint64_t v27 = [v26 caseInsensitiveCompare:@"mailto"];

  if (v27)
  {
    uint64_t v28 = 0;
  }
  else
  {
    v29 = [MEMORY[0x1E4F60300] componentsWithURL:v12];
    v30 = [v29 toRecipients];
    [v29 ccRecipients];
    v42 = v12;
    id v31 = v9;
    id v32 = v8;
    v34 = v33 = a5;
    [v30 arrayByAddingObjectsFromArray:v34];
    v35 = v40 = (objc_class *)a1;
    v36 = [v29 bccRecipients];
    v37 = [v35 arrayByAddingObjectsFromArray:v36];

    a5 = v33;
    id v8 = v32;
    id v9 = v31;
    v12 = v42;

    v38 = objc_msgSend(v37, "ef_map:", &__block_literal_global_16);
    uint64_t v28 = [[v40 alloc] initWithRecipients:v38];
  }
  if (!(v28 | v13))
  {
    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
  }
  if (a5 && v13) {
    *a5 = (id) v13;
  }

  return (id)v28;
}

CNComposeRecipient *__71__CNComposeRecipients_objectWithItemProviderData_typeIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[CNComposeRecipient alloc] initWithContact:0 address:v2 kind:0];

  return v3;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void).cxx_destruct
{
}

@end