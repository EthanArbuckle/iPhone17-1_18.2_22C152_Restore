@interface EKEvent(AttachmentUtils)
- (id)sortedEKAttachmentsDisplayStrings;
@end

@implementation EKEvent(AttachmentUtils)

- (id)sortedEKAttachmentsDisplayStrings
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [a1 attachments];
  v3 = [v2 sortedArrayUsingFunction:CompareEKAttachments context:0];

  id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v5 = [a1 attachments];
  v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "fileName", (void)v16);
        if (v12)
        {
          [v6 addObject:v12];
        }
        else
        {
          v13 = EventKitUIBundle();
          v14 = [v13 localizedStringForKey:@"Untitled Attachment" value:&stru_1F0CC2140 table:0];
          [v6 addObject:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v6;
}

@end