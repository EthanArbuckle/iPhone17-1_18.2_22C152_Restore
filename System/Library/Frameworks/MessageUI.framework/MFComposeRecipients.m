@interface MFComposeRecipients
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
- (MFComposeRecipients)initWithRecipients:(id)a3;
- (NSArray)recipients;
@end

@implementation MFComposeRecipients

- (MFComposeRecipients)initWithRecipients:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFComposeRecipients;
  v6 = [(MFComposeRecipients *)&v9 init];
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
  id v35 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CB10] readableTypeIdentifiersForItemProvider];
  LODWORD(a4) = [v8 containsObject:v7];

  if (a4)
  {
    id v37 = 0;
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CB10], "objectWithItemProviderData:typeIdentifier:error:", v35, v7, &v37, a1);
    uint64_t v10 = (uint64_t)v37;
    v11 = (void *)v9;
  }
  else
  {
    v12 = objc_msgSend(NSString, "readableTypeIdentifiersForItemProvider", a1);
    int v13 = [v12 containsObject:v7];

    if (v13)
    {
      id v36 = 0;
      v14 = [NSString objectWithItemProviderData:v35 typeIdentifier:v7 error:&v36];
      uint64_t v10 = (uint64_t)v36;
      v15 = [MEMORY[0x1E4F1CB10] URLWithString:v14];
      v11 = v15;
      if (v14)
      {
        v16 = [v15 scheme];

        if (v16)
        {
          v17 = v14;
        }
        else
        {
          v18 = [v14 stringByReplacingOccurrencesOfString:@"\n", @", " withString];
          v19 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
          v20 = [v18 stringByAddingPercentEncodingWithAllowedCharacters:v19];

          v17 = [@"mailto:" stringByAppendingString:v20];

          uint64_t v21 = [MEMORY[0x1E4F1CB10] URLWithString:v17];

          v11 = (void *)v21;
        }
      }
      else
      {
        v17 = 0;
      }
    }
    else
    {
      uint64_t v10 = 0;
      v11 = 0;
    }
  }
  v22 = [v11 scheme];
  uint64_t v23 = [v22 caseInsensitiveCompare:*MEMORY[0x1E4F5FD88]];

  if (v23)
  {
    uint64_t v24 = 0;
  }
  else
  {
    v25 = [MEMORY[0x1E4F60300] componentsWithURL:v11];
    v26 = [v25 toRecipients];
    v27 = [v25 ccRecipients];
    v28 = [v26 arrayByAddingObjectsFromArray:v27];
    v29 = [v25 bccRecipients];
    v30 = [v28 arrayByAddingObjectsFromArray:v29];

    v31 = objc_msgSend(v30, "ef_map:", &__block_literal_global_10);
    uint64_t v24 = [[v34 alloc] initWithRecipients:v31];
  }
  if (!(v24 | v10))
  {
    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
  }
  if (a5 && v10) {
    *a5 = (id) v10;
  }

  return (id)v24;
}

id __71__MFComposeRecipients_objectWithItemProviderData_typeIdentifier_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[MFComposeRecipient recipientWithProperty:*MEMORY[0x1E4F49AC0] address:a2];

  return v2;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void).cxx_destruct
{
}

@end