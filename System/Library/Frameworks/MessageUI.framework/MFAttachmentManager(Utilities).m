@interface MFAttachmentManager(Utilities)
- (uint64_t)sizeForScale:()Utilities imagesOnly:forContext:;
- (void)attachmentForCID:()Utilities isBasicImage:;
- (void)attachmentForCID:()Utilities isDisplayableImage:;
- (void)filenameAndURLForAttachmentForCID:()Utilities completionHandler:;
- (void)hasAttachmentForCID:()Utilities completionHandler:;
@end

@implementation MFAttachmentManager(Utilities)

- (uint64_t)sizeForScale:()Utilities imagesOnly:forContext:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v7 = objc_msgSend(a1, "attachmentsForContext:", a5, 0);
  uint64_t v8 = 0;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v12 isDisplayableImage])
        {
          uint64_t v13 = [v12 scaledFileSizeForScale:a3];
        }
        else
        {
          if (a4) {
            continue;
          }
          uint64_t v13 = [v12 decodedFileSize];
        }
        v8 += v13;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v8;
}

- (void)attachmentForCID:()Utilities isDisplayableImage:
{
  uint64_t v9 = a4;
  v6 = [a1 attachmentForCID:a3];
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "isDisplayableImage"));
  }
  else
  {
    uint64_t v8 = 0;
  }
  v9[2](v9, v8);
  if (v7) {
}
  }

- (void)attachmentForCID:()Utilities isBasicImage:
{
  uint64_t v9 = a4;
  v6 = [a1 attachmentForCID:a3];
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "isBasicImage"));
  }
  else
  {
    uint64_t v8 = 0;
  }
  v9[2](v9, v8);
  if (v7) {
}
  }

- (void)hasAttachmentForCID:()Utilities completionHandler:
{
  v7 = a4;
  v6 = [a1 attachmentForCID:a3];
  v7[2](v7, v6 != 0);
}

- (void)filenameAndURLForAttachmentForCID:()Utilities completionHandler:
{
  uint64_t v9 = a4;
  v6 = [a1 attachmentForCID:a3];
  v7 = [v6 fileName];
  uint64_t v8 = [v6 url];
  v9[2](v9, v7, v8);
}

@end