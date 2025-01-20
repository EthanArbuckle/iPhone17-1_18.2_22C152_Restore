@interface MPAssistantAddMediaEntityToWishList
- (void)_addRadioTrackToWishListWithStoreID:(unint64_t)a3 stationHash:(id)a4 completion:(id)a5;
- (void)_addTrackToWishListWithStoreID:(unint64_t)a3 completion:(id)a4;
- (void)_fetchCurrentRadioTrackInfoWithCompletion:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantAddMediaEntityToWishList

- (void).cxx_destruct
{
}

- (void)_fetchCurrentRadioTrackInfoWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = dispatch_get_global_queue(0, 0);
  v6 = v3;
  id v5 = v3;
  MRMediaRemoteGetNowPlayingInfo();
}

- (void)_addRadioTrackToWishListWithStoreID:(unint64_t)a3 stationHash:(id)a4 completion:(id)a5
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  if (!a3
    || ([MEMORY[0x1E4F31940] defaultMediaLibrary],
        v9 = objc_claimAutoreleasedReturnValue(),
        [v9 itemWithStoreID:a3],
        v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        !v10))
  {
    v20[0] = *MEMORY[0x1E4F777D8];
    v13 = [NSNumber numberWithUnsignedLongLong:a3];
    v20[1] = *MEMORY[0x1E4F77770];
    v21[0] = v13;
    v21[1] = @"com.apple.MediaAssistant.siri";
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

    v14 = [MEMORY[0x1E4F76E68] systemMediaApplicationDestination];
    id v15 = objc_alloc_init(MEMORY[0x1E4F76E28]);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_1D425EB70;
    v17[3] = &unk_1E69E4160;
    id v18 = v15;
    id v19 = v8;
    id v16 = v15;
    [v16 sendCommand:23 toDestination:v14 withOptions:v12 completion:v17];

    goto LABEL_6;
  }
  if (v8)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F965A8]);
    v12 = (void *)[v11 initWithErrorCode:*MEMORY[0x1E4F97350]];
    (*((void (**)(id, void *))v8 + 2))(v8, v12);
LABEL_6:
  }
}

- (void)_addTrackToWishListWithStoreID:(unint64_t)a3 completion:(id)a4
{
  id v5 = (void (**)(id, void *))a4;
  if (a3
    && ([MEMORY[0x1E4F31940] defaultMediaLibrary],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v6 itemWithStoreID:a3],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    if (v5)
    {
      id v8 = objc_alloc(MEMORY[0x1E4F965A8]);
      v9 = (void *)[v8 initWithErrorCode:*MEMORY[0x1E4F97350]];
      v5[2](v5, v9);
    }
  }
  else
  {
    v10 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
    id v11 = [MEMORY[0x1E4FB87B8] activeAccount];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1D425ED58;
    v12[3] = &unk_1E69E4138;
    v13 = v5;
    unint64_t v14 = a3;
    [v10 getPropertiesForUserIdentity:v11 completionHandler:v12];
  }
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSString *)self->_requestAceHash length])
  {
    id v5 = [(MPAssistantAddMediaEntityToWishList *)self aceId];
    sub_1D4244ECC(@"Add Media Entity To Wish List", v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;
  }
  id v8 = _MPLogCategoryAssistant();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_requestAceHash;
    v10 = [(SAMPAddMediaEntityToWishList *)self adamId];
    *(_DWORD *)buf = 138543618;
    v20 = v9;
    __int16 v21 = 2114;
    v22 = v10;
    _os_log_impl(&dword_1D422A000, v8, OS_LOG_TYPE_DEFAULT, "Add Media Entity To Wish List (invoke) <%{public}@>: adam ID %{public}@", buf, 0x16u);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1D425F3DC;
  v17[3] = &unk_1E69E4098;
  id v11 = v4;
  void v17[4] = self;
  id v18 = v11;
  v12 = (void *)MEMORY[0x1D94452A0](v17);
  v13 = [(SAMPAddMediaEntityToWishList *)self adamId];
  if (v13)
  {
    unint64_t v14 = [(SAMPAddMediaEntityToWishList *)self adamId];
    -[MPAssistantAddMediaEntityToWishList _addTrackToWishListWithStoreID:completion:](self, "_addTrackToWishListWithStoreID:completion:", [v14 longLongValue], v12);
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1D425F548;
    v15[3] = &unk_1E69E40C0;
    v15[4] = self;
    id v16 = v12;
    [(MPAssistantAddMediaEntityToWishList *)self _fetchCurrentRadioTrackInfoWithCompletion:v15];
  }
}

@end