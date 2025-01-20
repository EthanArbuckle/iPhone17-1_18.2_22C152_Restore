@interface PICSDiagnosticExtensionExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (id)gatherAttachments;
@end

@implementation PICSDiagnosticExtensionExtension

- (id)attachmentList
{
  return [(PICSDiagnosticExtensionExtension *)self gatherAttachments];
}

- (id)attachmentsForParameters:(id)a3
{
  return [(PICSDiagnosticExtensionExtension *)self gatherAttachments];
}

- (id)gatherAttachments
{
  v2 = objc_opt_new();
  v3 = [v2 getFileList];
  v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = +[DEAttachmentItem attachmentWithPathURL:](DEAttachmentItem, "attachmentWithPathURL:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

@end