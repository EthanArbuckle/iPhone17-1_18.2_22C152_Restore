@interface MUIMessageListGroupedSenderSectionDataSource
- (BOOL)hideMessageListAvatar;
- (EFCancelable)avatarUserDefaultObserver;
- (MUIAvatarImageGenerator)avatarGenerator;
- (MUIMessageListGroupedSenderSectionDataSource)initWithConfiguration:(id)a3;
- (id)configuredCollectionViewCellForCollectionView:(id)a3 indexPath:(id)a4 itemID:(id)a5 cellIdentifier:(id)a6;
- (id)sectionForCollection:(id)a3;
- (void)_configureCell:(id)a3 atIndexPath:(id)a4 itemID:(id)a5;
- (void)setAvatarGenerator:(id)a3;
- (void)setAvatarUserDefaultObserver:(id)a3;
- (void)setHideMessageListAvatar:(BOOL)a3;
@end

@implementation MUIMessageListGroupedSenderSectionDataSource

- (MUIMessageListGroupedSenderSectionDataSource)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MUIMessageListGroupedSenderSectionDataSource;
  v6 = [(MessageListSectionDataSource *)&v26 initWithConfiguration:v5];
  if (v6)
  {
    v7 = [v5 avatarGenerator];

    if (!v7)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, v6, @"MUIMessageListGroupedSenderSectionDataSource-BlackPearlUI.m", 35, @"Invalid parameter not satisfying: %@", @"configuration.avatarGenerator" object file lineNumber description];
    }
    uint64_t v8 = [v5 avatarGenerator];
    avatarGenerator = v6->_avatarGenerator;
    v6->_avatarGenerator = (MUIAvatarImageGenerator *)v8;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v6);
    v10 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v11 = objc_opt_class();
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __70__MUIMessageListGroupedSenderSectionDataSource_initWithConfiguration___block_invoke;
    v23[3] = &unk_1E6D13088;
    objc_copyWeak(&v24, &location);
    uint64_t v12 = [v10 registrationWithCellClass:v11 configurationHandler:v23];
    cellRegistration = v6->_cellRegistration;
    v6->_cellRegistration = (UICollectionViewCellRegistration *)v12;

    v14 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
    uint64_t v15 = *MEMORY[0x1E4F60110];
    -[MUIMessageListGroupedSenderSectionDataSource setHideMessageListAvatar:](v6, "setHideMessageListAvatar:", [v14 BOOLForKey:*MEMORY[0x1E4F60110]]);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __70__MUIMessageListGroupedSenderSectionDataSource_initWithConfiguration___block_invoke_2;
    v20[3] = &unk_1E6D11C98;
    objc_copyWeak(&v22, &location);
    id v16 = v14;
    id v21 = v16;
    v17 = objc_msgSend(v16, "ef_observeKeyPath:options:autoCancelToken:usingBlock:", v15, 5, 1, v20);
    [(MUIMessageListGroupedSenderSectionDataSource *)v6 setAvatarUserDefaultObserver:v17];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __70__MUIMessageListGroupedSenderSectionDataSource_initWithConfiguration___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _configureCell:v11 atIndexPath:v7 itemID:v8];
  }
}

void __70__MUIMessageListGroupedSenderSectionDataSource_initWithConfiguration___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    objc_msgSend(WeakRetained, "setHideMessageListAvatar:", objc_msgSend(*(id *)(a1 + 32), "BOOLForKey:", *MEMORY[0x1E4F60110]));
  }
}

- (id)configuredCollectionViewCellForCollectionView:(id)a3 indexPath:(id)a4 itemID:(id)a5 cellIdentifier:(id)a6
{
  if (self) {
    cellRegistration = self->_cellRegistration;
  }
  else {
    cellRegistration = 0;
  }
  return (id)objc_msgSend(a3, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", cellRegistration, a4, a5, a6);
}

- (void)_configureCell:(id)a3 atIndexPath:(id)a4 itemID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t v11 = [(MessageListSectionDataSource *)self numberOfPreviewLines];
  CFTimeInterval v12 = CACurrentMediaTime();
  v13 = [(MessageListSectionDataSource *)self delegate];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__MUIMessageListGroupedSenderSectionDataSource__configureCell_atIndexPath_itemID___block_invoke;
  aBlock[3] = &unk_1E6D130D8;
  aBlock[4] = self;
  id v14 = v8;
  id v30 = v14;
  int64_t v33 = v11;
  CFTimeInterval v34 = v12;
  id v15 = v13;
  id v31 = v15;
  id v16 = v9;
  id v32 = v16;
  v17 = (void (**)(void *, void *, uint64_t))_Block_copy(aBlock);
  v18 = [(MessageListSectionDataSource *)self messageList];
  v19 = [v18 messageListItemForItemID:v10];
  v20 = [v19 resultIfAvailable];

  if (v20)
  {
    v17[2](v17, v20, 1);
  }
  else
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __82__MUIMessageListGroupedSenderSectionDataSource__configureCell_atIndexPath_itemID___block_invoke_15;
    v22[3] = &unk_1E6D13100;
    objc_copyWeak(&v27, &location);
    objc_super v26 = v17;
    id v23 = v10;
    id v24 = v16;
    id v25 = v15;
    id v21 = [(MessageListSectionDataSource *)self messageListItemForItemID:v23 indexPath:v24 receiver:v14 completion:v22];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
}

void __82__MUIMessageListGroupedSenderSectionDataSource__configureCell_atIndexPath_itemID___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = [*(id *)(a1 + 32) contactStore];
  id v7 = [v5 preferredSenderDisplayNameWithContactStore:v6];

  objc_msgSend(*(id *)(a1 + 40), "updateWithMessageListItem:avatarResult:maximumPreviewLines:hideAvatar:displayName:", v5, 0, *(void *)(a1 + 64), objc_msgSend(*(id *)(a1 + 32), "hideMessageListAvatar"), v7);
  [*(id *)(a1 + 48) messageListSectionDataSource:*(void *)(a1 + 32) didConfigureCell:*(void *)(a1 + 40) atIndexPath:*(void *)(a1 + 56) item:v5 itemWasCached:a3 duration:CACurrentMediaTime() - *(double *)(a1 + 72)];
  if (([*(id *)(a1 + 32) hideMessageListAvatar] & 1) == 0)
  {
    id v8 = [MUIAvatarImageContext alloc];
    id v9 = [*(id *)(a1 + 32) contactStore];
    id v10 = [*(id *)(a1 + 32) brandIndicatorProvider];
    int64_t v11 = [(MUIAvatarImageContext *)v8 initWithMessageListItem:v5 contactStore:v9 brandIndicatorProvider:v10];

    CFTimeInterval v12 = [*(id *)(a1 + 32) avatarGenerator];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __82__MUIMessageListGroupedSenderSectionDataSource__configureCell_atIndexPath_itemID___block_invoke_2;
    v16[3] = &unk_1E6D130B0;
    id v17 = *(id *)(a1 + 40);
    id v13 = v5;
    uint64_t v21 = *(void *)(a1 + 64);
    uint64_t v14 = *(void *)(a1 + 32);
    id v18 = v13;
    uint64_t v19 = v14;
    id v20 = v7;
    id v15 = (id)[v12 avatarImageForContext:v11 handler:v16];
  }
}

void __82__MUIMessageListGroupedSenderSectionDataSource__configureCell_atIndexPath_itemID___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) itemID];
  id v8 = [*(id *)(a1 + 40) itemID];

  if (v6 || v7 != v8)
  {
    id v9 = [*(id *)(a1 + 48) log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
      int64_t v11 = [*(id *)(a1 + 32) itemID];
      CFTimeInterval v12 = objc_msgSend(v6, "ef_publicDescription");
      int v13 = 138412802;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      id v16 = v11;
      __int16 v17 = 2114;
      id v18 = v12;
      _os_log_impl(&dword_1DDCDB000, v9, OS_LOG_TYPE_DEFAULT, "Skipping avatar update for item %@, the cell has ID %@ error %{public}@", (uint8_t *)&v13, 0x20u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "updateWithMessageListItem:avatarResult:maximumPreviewLines:hideAvatar:displayName:", *(void *)(a1 + 40), v5, *(void *)(a1 + 64), objc_msgSend(*(id *)(a1 + 48), "hideMessageListAvatar"), *(void *)(a1 + 56));
  }
}

void __82__MUIMessageListGroupedSenderSectionDataSource__configureCell_atIndexPath_itemID___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (v5)
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      int v8 = objc_msgSend(v6, "ef_isCancelledError");
      id v9 = [WeakRetained log];
      id v10 = v9;
      if (v8)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = *(void *)(a1 + 32);
          CFTimeInterval v12 = objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
          int v13 = objc_msgSend(v6, "ef_publicDescription");
          int v18 = 138543874;
          uint64_t v19 = v11;
          __int16 v20 = 2114;
          uint64_t v21 = v12;
          __int16 v22 = 2114;
          id v23 = v13;
          _os_log_impl(&dword_1DDCDB000, v10, OS_LOG_TYPE_DEFAULT, "Cancel messageListItem for itemID=%{public}@, indexPath=%{public}@, error=%{public}@", (uint8_t *)&v18, 0x20u);
        }
      }
      else
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          uint64_t v14 = *(void *)(a1 + 32);
          __int16 v15 = objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
          id v16 = [WeakRetained messageList];
          __int16 v17 = objc_msgSend(v6, "ef_publicDescription");
          int v18 = 138544130;
          uint64_t v19 = v14;
          __int16 v20 = 2114;
          uint64_t v21 = v15;
          __int16 v22 = 2048;
          id v23 = v16;
          __int16 v24 = 2112;
          id v25 = v17;
          _os_log_error_impl(&dword_1DDCDB000, v10, OS_LOG_TYPE_ERROR, "Failed to obtain messageListItem for itemID:%{public}@ at indexPath:%{public}@ in messageList:%p with error:%@", (uint8_t *)&v18, 0x2Au);
        }
        [*(id *)(a1 + 48) messageListSectionDataSource:WeakRetained didFailToConfigureCellAtIndexPath:*(void *)(a1 + 40) error:v6];
      }
    }
  }
}

- (id)sectionForCollection:(id)a3
{
  if (EMBlackPearlIsFeatureEnabled())
  {
    v4 = [(MessageListSectionDataSource *)self section];
    if ([v4 isEqualToString:@"MessageListSectionGroupedSenderUnseen"]) {
      id v5 = @"MessageListSectionGroupedSenderUnseen";
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (MUIAvatarImageGenerator)avatarGenerator
{
  return self->_avatarGenerator;
}

- (void)setAvatarGenerator:(id)a3
{
}

- (EFCancelable)avatarUserDefaultObserver
{
  return self->_avatarUserDefaultObserver;
}

- (void)setAvatarUserDefaultObserver:(id)a3
{
}

- (BOOL)hideMessageListAvatar
{
  return self->_hideMessageListAvatar;
}

- (void)setHideMessageListAvatar:(BOOL)a3
{
  self->_hideMessageListAvatar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellRegistration, 0);
  objc_storeStrong((id *)&self->_avatarUserDefaultObserver, 0);
  objc_storeStrong((id *)&self->_avatarGenerator, 0);
}

@end