@interface MFMailMessage(NSItemProvider)
+ (id)writableTypeIdentifiersForItemProvider;
+ (uint64_t)dragItemsAreAllMessages:()NSItemProvider;
- (id)_attributedSubject;
- (id)_loadFileRepresentationOfTypeIdentifier:()NSItemProvider forItemProviderCompletionHandler:;
- (id)loadDataWithTypeIdentifier:()NSItemProvider forItemProviderCompletionHandler:;
- (uint64_t)_preferredRepresentationForItemProviderWritableTypeIdentifier:()NSItemProvider;
- (void)_loadMessageDataWithCompletion:()NSItemProvider;
@end

@implementation MFMailMessage(NSItemProvider)

+ (id)writableTypeIdentifiersForItemProvider
{
  v0 = [MEMORY[0x1E4F1CA48] array];
  [v0 addObject:@"com.apple.mobilemail.internalMessageTransfer"];
  v1 = [MEMORY[0x1E4F60320] externalDataTypeIdentifiers];
  [v0 addObjectsFromArray:v1];

  return v0;
}

- (id)loadDataWithTypeIdentifier:()NSItemProvider forItemProviderCompletionHandler:
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v6];
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  v29 = __93__MFMailMessage_NSItemProvider__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
  v30 = &unk_1E5F7C7C8;
  id v9 = v8;
  id v31 = v9;
  v10 = (unsigned int (**)(void *, void *))_Block_copy(&v27);
  v11 = objc_msgSend(a1, "subject", v27, v28, v29, v30);
  if ([v11 length])
  {
    v12 = [a1 subject];
    [v12 subjectString];
  }
  else
  {
    v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.messageui"];
    [v12 localizedStringForKey:@"NO_SUBJECT" value:&stru_1F0817A00 table:@"Main"];
  v13 = };

  if ([v9 conformsToType:*MEMORY[0x1E4F443A8]])
  {
    [a1 _loadMessageDataWithCompletion:v7];
LABEL_6:
    v14 = 0;
    goto LABEL_12;
  }
  v15 = [MEMORY[0x1E4F22488] writableTypeIdentifiersForItemProvider];
  int v16 = [v15 containsObject:v6];

  if (v16)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F22488]);
    uint64_t v18 = *MEMORY[0x1E4F73DA0];
    v19 = (void *)[v17 initWithActivityType:*MEMORY[0x1E4F73DA0]];
    [v19 setTitle:v13];
    uint64_t v20 = *MEMORY[0x1E4F73DA8];
    v33[0] = v18;
    uint64_t v21 = *MEMORY[0x1E4F73D50];
    v32[0] = v20;
    v32[1] = v21;
    v22 = [a1 globalMessageURL];
    v23 = [v22 absoluteString];
    v33[1] = v23;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
    [v19 setUserInfo:v24];

    uint64_t v25 = [v19 loadDataWithTypeIdentifier:v6 forItemProviderCompletionHandler:v7];
LABEL_11:
    v14 = (void *)v25;

    goto LABEL_12;
  }
  if ([v9 conformsToType:*MEMORY[0x1E4F444F8]])
  {
    v19 = [a1 globalMessageURL];
    [v19 _setTitle:v13];
    uint64_t v25 = [v19 loadDataWithTypeIdentifier:v6 forItemProviderCompletionHandler:v7];
    goto LABEL_11;
  }
  if (!v10[2](v10, v13)) {
    goto LABEL_6;
  }
  v14 = [v13 loadDataWithTypeIdentifier:v6 forItemProviderCompletionHandler:v7];
LABEL_12:

  return v14;
}

- (uint64_t)_preferredRepresentationForItemProviderWritableTypeIdentifier:()NSItemProvider
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v3];
  v5 = [MEMORY[0x1E4F28B18] writableTypeIdentifiersForItemProvider];
  if (![v5 containsObject:v3]
    || ([v4 conformsToType:*MEMORY[0x1E4F443A8]] & 1) != 0)
  {
    goto LABEL_5;
  }
  id v6 = [MEMORY[0x1E4F22488] readableTypeIdentifiersForItemProvider];
  if ([v6 containsObject:v3])
  {

LABEL_5:
    goto LABEL_6;
  }
  char v9 = [v4 conformsToType:*MEMORY[0x1E4F444F8]];

  if ((v9 & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B18] _preferredRepresentationForItemProviderWritableTypeIdentifier:v3];
    goto LABEL_7;
  }
LABEL_6:
  uint64_t v7 = 0;
LABEL_7:

  return v7;
}

- (id)_loadFileRepresentationOfTypeIdentifier:()NSItemProvider forItemProviderCompletionHandler:
{
  id v7 = a3;
  id v8 = a4;
  char v9 = [MEMORY[0x1E4F28B18] writableTypeIdentifiersForItemProvider];
  char v10 = [v9 containsObject:v7];

  if ((v10 & 1) == 0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:a1 file:@"MFMailMessage+NSItemProvider.m" lineNumber:102 description:@"Attempting to load file representation for an incompatible type."];
  }
  v11 = [a1 _attributedSubject];
  v12 = [v11 _loadFileRepresentationOfTypeIdentifier:v7 forItemProviderCompletionHandler:v8];

  return v12;
}

- (id)_attributedSubject
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 subject];
  if ([v2 length])
  {
    id v3 = [a1 subject];
    [v3 subjectString];
  }
  else
  {
    id v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.messageui"];
    [v3 localizedStringForKey:@"NO_SUBJECT" value:&stru_1F0817A00 table:@"Main"];
  v4 = };

  v5 = [a1 globalMessageURL];
  id v6 = 0;
  if ([v4 length] && v5)
  {
    uint64_t v9 = *MEMORY[0x1E4FB0720];
    v10[0] = v5;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4 attributes:v7];
  }

  return v6;
}

- (void)_loadMessageDataWithCompletion:()NSItemProvider
{
  v4 = a3;
  v5 = [a1 messageStore];
  char v11 = 0;
  id v6 = objc_alloc_init(MEMORY[0x1E4F734A8]);
  id v7 = [v5 headerDataForMessage:a1 downloadIfNecessary:1];
  [v6 appendData:v7];

  id v8 = [v5 fullBodyDataForMessage:a1 andHeaderDataIfReadilyAvailable:0 isComplete:&v11 downloadIfNecessary:1 didDownload:0];
  [v6 appendData:v8];

  [v6 done];
  if (v11)
  {
    uint64_t v9 = [v6 data];
    v4[2](v4, v9, 0);
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v9 = (void *)[v10 initWithDomain:*MEMORY[0x1E4F77B18] code:1030 userInfo:0];
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v9);
  }
}

+ (uint64_t)dragItemsAreAllMessages:()NSItemProvider
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v6), "itemProvider", (void)v13);
        id v8 = [v7 registeredTypeIdentifiers];
        uint64_t v9 = [v8 firstObject];
        char v10 = [v9 isEqualToString:@"com.apple.mobilemail.internalMessageTransfer"];

        if ((v10 & 1) == 0)
        {
          uint64_t v11 = 0;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 1;
LABEL_11:

  return v11;
}

@end