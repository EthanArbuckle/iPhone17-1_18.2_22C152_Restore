@interface UIPasteboard(MFAttachmentsPasteboardSupport)
- (id)mf_getAttachmentsPasteboardRepresentations;
- (void)mf_addPasteboardRepresentationsForAttachments:()MFAttachmentsPasteboardSupport;
@end

@implementation UIPasteboard(MFAttachmentsPasteboardSupport)

- (void)mf_addPasteboardRepresentationsForAttachments:()MFAttachmentsPasteboardSupport
{
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __94__UIPasteboard_MFAttachmentsPasteboardSupport__mf_addPasteboardRepresentationsForAttachments___block_invoke;
  v12[3] = &unk_1E5F79578;
  id v6 = v5;
  id v13 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v12];
  v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
  v8 = [a1 items];
  v9 = (void *)[v8 mutableCopy];

  if ([v9 count])
  {
    v10 = [v9 objectAtIndexedSubscript:0];
    v11 = (void *)[v10 mutableCopy];
  }
  else
  {
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
  }
  [v11 setObject:v7 forKeyedSubscript:@"mf_attachmentsData"];
  [v9 setObject:v11 atIndexedSubscript:0];
  [a1 setItems:v9];
}

- (id)mf_getAttachmentsPasteboardRepresentations
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v1 = [a1 dataForPasteboardType:@"mf_attachmentsData" inItemSet:0];
  v2 = [v1 lastObject];

  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F28DC0];
    id v4 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:3];
    id v6 = objc_msgSend(v4, "setWithArray:", v5, v9, v10);
    v7 = [v3 unarchivedObjectOfClasses:v6 fromData:v2 error:0];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end