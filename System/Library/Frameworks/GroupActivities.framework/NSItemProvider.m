@interface NSItemProvider
@end

@implementation NSItemProvider

void __91__NSItemProvider_GroupActivities_LinkPresentation__registerTUConversationActivityMetadata___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  v4 = lpLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    int v24 = 138412290;
    id v25 = v5;
    _os_log_impl(&dword_1A375F000, v4, OS_LOG_TYPE_INFO, "Started loading link metadata for TUConversationActivityMetadata from NSItemProvider: %@", (uint8_t *)&v24, 0xCu);
  }

  v6 = (void *)CUTWeakLinkClass();
  v8 = *(void **)(a1 + 32);
  v7 = (id *)(a1 + 32);
  v9 = [v8 linkMetadatablob];

  v10 = lpLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v11)
    {
      id v12 = *v7;
      int v24 = 138412290;
      id v25 = v12;
      _os_log_impl(&dword_1A375F000, v10, OS_LOG_TYPE_INFO, "TUConversationActivityMetadata had linkMetadatablob, using that to derive link metadata for NSItemProvider load: %@", (uint8_t *)&v24, 0xCu);
    }

    v13 = [*v7 linkMetadatablob];
    id v14 = [v6 metadataWithDataRepresentation:v13];
    goto LABEL_11;
  }
  if (v11)
  {
    id v15 = *v7;
    int v24 = 138412290;
    id v25 = v15;
    _os_log_impl(&dword_1A375F000, v10, OS_LOG_TYPE_INFO, "TUConversationActivityMetadata did not have a linkMetadatablob, deriving link metadata directly from TUConversationActivityMetadata properties for NSItemProvider load: %@", (uint8_t *)&v24, 0xCu);
  }

  id v14 = objc_alloc_init((Class)v6);
  v16 = [*v7 title];
  [v14 setTitle:v16];

  v17 = [*v7 subTitle];
  [v14 setSummary:v17];

  v18 = [*v7 imageData];

  if (v18)
  {
    id v19 = objc_alloc((Class)CUTWeakLinkClass());
    v13 = [*v7 imageData];
    v20 = (void *)[v19 initWithData:v13 MIMEType:@"image/jpeg"];
    [v14 setImage:v20];

LABEL_11:
  }
  v21 = lpLog();
  v22 = v21;
  if (v3)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v23 = *v7;
      int v24 = 138412290;
      id v25 = v23;
      _os_log_impl(&dword_1A375F000, v22, OS_LOG_TYPE_INFO, "Finished loading link metadata for TUConversationActivityMetadata from NSItemProvider: %@", (uint8_t *)&v24, 0xCu);
    }

    v3[2](v3, v14, 0);
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      __91__NSItemProvider_GroupActivities_LinkPresentation__registerTUConversationActivityMetadata___block_invoke_cold_1((uint64_t *)v7, v22);
    }
  }
}

void __91__NSItemProvider_GroupActivities_LinkPresentation__registerTUConversationActivityMetadata___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A375F000, a2, OS_LOG_TYPE_ERROR, "NSItemProvider completionHandler was unexpectedly nil. Not loading link metadata for TUConversationActivityMetadata: %@", (uint8_t *)&v3, 0xCu);
}

@end