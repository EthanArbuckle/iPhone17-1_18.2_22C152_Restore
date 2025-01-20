@interface IMMessageFromStoragePipelineComponent
- (BOOL)_itemIsEligibleForStorageControllerWithInput:(id)a3;
- (IMMessageFromStoragePipelineComponent)initWithStorageProcessingType:(unint64_t)a3 storageController:(id)a4 broadcaster:(id)a5;
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IMMessageFromStoragePipelineComponent

- (id)runIndividuallyWithInput:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 GUID];
  if (IMOSLoggingEnabled())
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      unint64_t processingType = self->_processingType;
      v8 = @"Unknown";
      if (processingType == 1) {
        v8 = @"Post";
      }
      if (processingType) {
        v9 = v8;
      }
      else {
        v9 = @"Pre";
      }
      v10 = v9;
      *(_DWORD *)buf = 138412546;
      v45 = v10;
      __int16 v46 = 2112;
      v47 = v5;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "<IMMessageFromStoragePipelineComponent> Started processing type (%@) for guid %@", buf, 0x16u);
    }
  }
  uint64_t v11 = 16;
  unint64_t v12 = self->_processingType;
  if (v12 == 1)
  {
    if ([v4 isLastFromStorage]
      && [(IMMessageFromStoragePipelineComponent *)self _itemIsEligibleForStorageControllerWithInput:v4])
    {
      if (IMOSLoggingEnabled())
      {
        v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "    Last item from storage finished processing", buf, 2u);
        }
      }
      [(IMDMessageFromStorageController *)self->_storageController noteLastItemProcessed];
    }
    if ([(IMDMessageFromStorageController *)self->_storageController isAwaitingStorageTimer]
      || ([v4 messageItems],
          v15 = objc_claimAutoreleasedReturnValue(),
          BOOL v16 = [v15 count] == 0,
          v15,
          v16))
    {
      if (IMOSLoggingEnabled())
      {
        v34 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v34, OS_LOG_TYPE_INFO, "    Suppressing message from storage update.", buf, 2u);
        }
      }
      [(IMDMessageFromStorageController *)self->_storageController noteSuppressedMessageUpdate:v5];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = [v4 messageItems];
          uint64_t v19 = [v18 count];
          v20 = [v4 account];
          v21 = [v20 service];
          v22 = [v21 internalName];
          id broadcaster = self->_broadcaster;
          *(_DWORD *)buf = 134218498;
          v45 = (__CFString *)v19;
          __int16 v46 = 2112;
          v47 = v22;
          __int16 v48 = 2048;
          id v49 = broadcaster;
          _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "    Updated messages: %lu for service: %@ with broadcaster: %p", buf, 0x20u);
        }
      }
      v24 = objc_msgSend(v4, "messageItems", 16);
      v43 = (void *)IMCreateSerializedItemsFromArray();

      id v25 = self->_broadcaster;
      v26 = [v4 account];
      v27 = [v26 service];
      v28 = [v27 internalName];
      v29 = [v4 chat];
      v30 = [v29 chatIdentifier];
      v31 = [v4 chat];
      objc_msgSend(v25, "service:chat:style:messagesUpdated:", v28, v30, objc_msgSend(v31, "style"), v43);

      uint64_t v11 = v42;
    }
  }
  else if (!v12)
  {
    if ([v4 isLastFromStorage]
      && [(IMMessageFromStoragePipelineComponent *)self _itemIsEligibleForStorageControllerWithInput:v4])
    {
      if (IMOSLoggingEnabled())
      {
        v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "    Last item from storage", buf, 2u);
        }
      }
      [(IMDMessageFromStorageController *)self->_storageController noteLastItemFromStorage:v5];
    }
    else if ([(IMMessageFromStoragePipelineComponent *)self _itemIsEligibleForStorageControllerWithInput:v4])
    {
      if (IMOSLoggingEnabled())
      {
        v32 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isFromStorage"));
          v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v45 = v33;
          _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_INFO, "    Is from storage (%@)", buf, 0xCu);
        }
      }
      -[IMDMessageFromStorageController noteItemFromStorage:extendsStorageTimer:](self->_storageController, "noteItemFromStorage:extendsStorageTimer:", v5, [v4 isFromStorage]);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v35 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      uint64_t v36 = *(uint64_t *)((char *)&self->super.super.isa + v11);
      v37 = @"Unknown";
      if (v36 == 1) {
        v37 = @"Post";
      }
      if (v36) {
        v38 = v37;
      }
      else {
        v38 = @"Pre";
      }
      v39 = v38;
      *(_DWORD *)buf = 138412546;
      v45 = v39;
      __int16 v46 = 2112;
      v47 = v5;
      _os_log_impl(&dword_1D967A000, v35, OS_LOG_TYPE_INFO, "    Processed type (%@) for guid %@", buf, 0x16u);
    }
  }
  v40 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v4];

  return v40;
}

- (IMMessageFromStoragePipelineComponent)initWithStorageProcessingType:(unint64_t)a3 storageController:(id)a4 broadcaster:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)IMMessageFromStoragePipelineComponent;
  uint64_t v11 = [(IMMessageFromStoragePipelineComponent *)&v14 init];
  unint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_storageController, a4);
    v12->_unint64_t processingType = a3;
    objc_storeStrong(&v12->_broadcaster, a5);
  }

  return v12;
}

- (BOOL)_itemIsEligibleForStorageControllerWithInput:(id)a3
{
  id v4 = a3;
  if ([(IMDMessageFromStorageController *)self->_storageController isAwaitingStorageTimer])
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "    Storage timer is running, noting item to storage controller", buf, 2u);
      }
    }
    char v6 = 1;
    goto LABEL_16;
  }
  v7 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  if (([v7 isScheduledMessagesCoreEnabled] & 1) == 0)
  {

    goto LABEL_15;
  }
  v8 = +[IMDMessageStore sharedInstance];
  id v9 = [v4 GUID];
  id v10 = [v8 messageWithGUID:v9];
  uint64_t v11 = [v10 scheduleType];

  if (v11 != 2)
  {
LABEL_15:
    char v6 = [v4 isFromStorage];
    goto LABEL_16;
  }
  if (IMOSLoggingEnabled())
  {
    unint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)objc_super v14 = 0;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "    Item is user scheduled message and storage timer is not running, does not need to be noted to storage controller", v14, 2u);
    }
  }
  char v6 = 0;
LABEL_16:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageController, 0);

  objc_storeStrong(&self->_broadcaster, 0);
}

@end