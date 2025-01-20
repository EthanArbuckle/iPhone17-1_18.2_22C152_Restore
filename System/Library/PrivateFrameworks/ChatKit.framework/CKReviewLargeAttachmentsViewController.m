@interface CKReviewLargeAttachmentsViewController
- (CKReviewLargeAttachmentsViewController)init;
- (Class)tableViewCellClass;
- (NSArray)attachments;
- (OS_dispatch_queue)privateWorkQueue;
- (id)_previewItem;
- (id)attachmentClass;
- (id)modelObjectAtIndex:(unint64_t)a3;
- (id)navigationBarTitle;
- (id)tableViewCellReuseIdentifier;
- (unint64_t)numberOfModelObjects;
- (void)_populateAttachmentData;
- (void)deleteModelObjectAndUnderlyingData:(id)a3;
- (void)didSelectModelObjectAtIndex:(unint64_t)a3;
- (void)previewControllerDidDismiss:(id)a3;
- (void)reloadModelData;
- (void)setAttachments:(id)a3;
- (void)setPrivateWorkQueue:(id)a3;
@end

@implementation CKReviewLargeAttachmentsViewController

- (CKReviewLargeAttachmentsViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)CKReviewLargeAttachmentsViewController;
  v2 = [(CKReviewLargeAttachmentsViewController *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("CKReviewLargeAttachmentsViewController", v3);
    privateWorkQueue = v2->_privateWorkQueue;
    v2->_privateWorkQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (id)navigationBarTitle
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"ATTACHMENTS" value:&stru_1EDE4CA38 table:@"General"];

  return v3;
}

- (id)tableViewCellReuseIdentifier
{
  return @"Attachments";
}

- (Class)tableViewCellClass
{
  return (Class)objc_opt_class();
}

- (void)reloadModelData
{
}

- (unint64_t)numberOfModelObjects
{
  [(CKReviewLargeAttachmentsViewController *)self _populateAttachmentData];
  v3 = [(CKReviewLargeAttachmentsViewController *)self attachments];
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)modelObjectAtIndex:(unint64_t)a3
{
  [(CKReviewLargeAttachmentsViewController *)self _populateAttachmentData];
  v5 = [(CKReviewLargeAttachmentsViewController *)self attachments];
  v6 = [v5 objectAtIndexedSubscript:a3];

  return v6;
}

- (void)deleteModelObjectAndUnderlyingData:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"guid"];
  v6 = v5;
  if (v5)
  {
    privateWorkQueue = self->_privateWorkQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__CKReviewLargeAttachmentsViewController_deleteModelObjectAndUnderlyingData___block_invoke;
    block[3] = &unk_1E5620C40;
    id v12 = v5;
    dispatch_async(privateWorkQueue, block);
  }
  v8 = [(CKReviewLargeAttachmentsViewController *)self attachments];
  v13[0] = v4;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v10 = [v8 arrayByExcludingObjectsInArray:v9];
  [(CKReviewLargeAttachmentsViewController *)self setAttachments:v10];
}

uint64_t __77__CKReviewLargeAttachmentsViewController_deleteModelObjectAndUnderlyingData___block_invoke(uint64_t a1)
{
  return MEMORY[0x1F4123130](*(void *)(a1 + 32));
}

- (void)didSelectModelObjectAtIndex:(unint64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(CKReviewLargeAttachmentsViewController *)self _previewItem];
  if ([MEMORY[0x1E4F3A650] canPreviewItem:v4])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F3A650]);
    v10[0] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    objc_super v7 = (void *)[v5 initWithPreviewItems:v6];

    [v7 setDelegate:self];
    [(CKReviewLargeAttachmentsViewController *)self presentViewController:v7 animated:1 completion:0];
  }
  else
  {
    v8 = [(CKAbstractReviewViewController *)self tableView];
    objc_super v7 = [v8 indexPathForSelectedRow];

    if (v7)
    {
      v9 = [(CKAbstractReviewViewController *)self tableView];
      [v9 deselectRowAtIndexPath:v7 animated:1];
    }
  }
}

- (void)previewControllerDidDismiss:(id)a3
{
  id v4 = [(CKAbstractReviewViewController *)self tableView];
  id v6 = [v4 indexPathForSelectedRow];

  if (v6)
  {
    id v5 = [(CKAbstractReviewViewController *)self tableView];
    [v5 deselectRowAtIndexPath:v6 animated:1];
  }
}

- (id)attachmentClass
{
  return 0;
}

- (void)_populateAttachmentData
{
  v2 = self;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v3 = [(CKReviewLargeAttachmentsViewController *)self attachments];

  if (!v3)
  {
    id v4 = [(CKReviewLargeAttachmentsViewController *)v2 attachmentClass];

    if (v4)
    {
      id v5 = [(CKReviewLargeAttachmentsViewController *)v2 attachmentClass];
      id v6 = IMDAttachmentFindLargestAttachmentGUIDsForAttachmentClassWithLimitAndOffset();

      objc_super v7 = [MEMORY[0x1E4F6BC68] sharedInstance];
      int v8 = [v7 isEnabled];

      if (v8)
      {
        v9 = [MEMORY[0x1E4F1CA48] array];
        if ([v6 count])
        {
          v10 = 0;
          v23 = v2;
          do
          {
            if ((unint64_t)[v9 count] > 0x63) {
              break;
            }
            v24 = v10;
            long long v29 = 0u;
            long long v30 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            id v11 = v6;
            uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
            if (v12)
            {
              uint64_t v13 = v12;
              uint64_t v14 = *(void *)v28;
              do
              {
                for (uint64_t i = 0; i != v13; ++i)
                {
                  if (*(void *)v28 != v14) {
                    objc_enumerationMutation(v11);
                  }
                  v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
                  int v26 = 0;
                  v17 = [v16 objectForKeyedSubscript:@"filename"];
                  v18 = (void *)MEMORY[0x1E4F6E558];
                  v19 = [v17 stringByExpandingTildeInPath];
                  uint64_t v20 = [v18 purgableFlagsForPath:v19 error:&v26];

                  if (!v20 || (IM_APFS_PURGEABLE_IGNORE_ME() & v20) != 0)
                  {
                    v21 = (void *)[v16 copy];
                    [v9 addObject:v21];
                  }
                }
                uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
              }
              while (v13);
            }

            v2 = v23;
            v10 = v24 + 100;
            v22 = [(CKReviewLargeAttachmentsViewController *)v23 attachmentClass];
            id v6 = IMDAttachmentFindLargestAttachmentGUIDsForAttachmentClassWithLimitAndOffset();
          }
          while ([v6 count]);
        }
        [(CKReviewLargeAttachmentsViewController *)v2 setAttachments:v9];
      }
      else
      {
        [(CKReviewLargeAttachmentsViewController *)v2 setAttachments:v6];
      }
    }
    else
    {
      IMDAttachmentFindLargestNonSyncedAttachmentGUIDs();
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      -[CKReviewLargeAttachmentsViewController setAttachments:](v2, "setAttachments:");
    }
  }
}

- (id)_previewItem
{
  v3 = [(CKAbstractReviewViewController *)self tableView];
  id v4 = [v3 indexPathForSelectedRow];

  if (v4)
  {
    id v5 = [(CKAbstractReviewViewController *)self tableView];
    id v6 = [v5 cellForRowAtIndexPath:v4];

    if (v6)
    {
      objc_super v7 = [v6 attachmentItem];
    }
    else
    {
      objc_super v7 = 0;
    }
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (OS_dispatch_queue)privateWorkQueue
{
  return self->_privateWorkQueue;
}

- (void)setPrivateWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateWorkQueue, 0);

  objc_storeStrong((id *)&self->_attachments, 0);
}

@end