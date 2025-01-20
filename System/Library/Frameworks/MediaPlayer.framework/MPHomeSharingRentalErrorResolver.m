@interface MPHomeSharingRentalErrorResolver
- (BOOL)_errorIsFairPlayError:(id)a3;
- (MPHomeSharingML3DataProvider)dataProvider;
- (MPHomeSharingRentalErrorResolver)initWithItemID:(unint64_t)a3 homeSharingID:(unint64_t)a4 rentalID:(unint64_t)a5 accountID:(unint64_t)a6;
- (unint64_t)itemID;
- (void)dealloc;
- (void)request:(id)a3 didFailWithError:(id)a4;
- (void)requestDidFinish:(id)a3;
- (void)resolveError:(id)a3;
- (void)setDataProvider:(id)a3;
@end

@implementation MPHomeSharingRentalErrorResolver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_dataProvider, 0);
}

- (unint64_t)itemID
{
  return self->_itemID;
}

- (void)setDataProvider:(id)a3
{
}

- (MPHomeSharingML3DataProvider)dataProvider
{
  return self->_dataProvider;
}

- (BOOL)_errorIsFairPlayError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 code];
  unint64_t v5 = v4 + 49999;
  unint64_t v6 = v4 + 12169;
  if (v4 == -11835)
  {
    v7 = [v3 domain];
    int v8 = [v7 isEqualToString:*MEMORY[0x1E4F15AC0]];
  }
  else
  {
    int v8 = 0;
  }
  if (v5 >> 6 < 0x7D || v6 <= 0x13)
  {
    v10 = [v3 domain];
    v8 |= [v10 isEqualToString:*MEMORY[0x1E4F28760]];
  }
  return v8;
}

- (void)requestDidFinish:(id)a3
{
  uint64_t v4 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingRentalErrorResolver] Rental checkout finished", v12, 2u);
  }

  [(SSRentalCheckoutRequest *)self->_request setDelegate:0];
  request = self->_request;
  self->_request = 0;

  unint64_t v6 = +[MPHomeSharingRentalTracker sharedInstance];
  unint64_t itemID = self->_itemID;
  int v8 = [(MPHomeSharingML3DataProvider *)self->_dataProvider uniqueIdentifier];
  [v6 addRentalWithItemID:itemID databaseID:v8];

  [(MPHomeSharingML3DataProvider *)self->_dataProvider setRentalPlaybackStartDateForItemID:self->_itemID];
  v9 = [(MPHomeSharingML3DataProvider *)self->_dataProvider homeSharingLibrary];
  v10 = objc_msgSend(MEMORY[0x1E4F6A388], "requestWithDatabaseID:itemID:", objc_msgSend(v9, "databaseID"), self->_homeSharingID);
  [v9 sendRequest:v10 withResponseHandler:&__block_literal_global_8];
  [(MPAVErrorResolver *)self sendDidResolveError:self->_error withResolution:2];
  error = self->_error;
  self->_error = 0;
}

void __53__MPHomeSharingRentalErrorResolver_requestDidFinish___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingRentalErrorResolver] iTunes set rental playback start date response: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    unint64_t v15 = (unint64_t)v5;
    _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingRentalErrorResolver] Rental checkout failed: %{public}@", (uint8_t *)&v14, 0xCu);
  }

  [(SSRentalCheckoutRequest *)self->_request setDelegate:0];
  request = self->_request;
  self->_request = 0;

  int v8 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t itemID = self->_itemID;
    unint64_t homeSharingID = self->_homeSharingID;
    int v14 = 134218240;
    unint64_t v15 = itemID;
    __int16 v16 = 2048;
    unint64_t v17 = homeSharingID;
    _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingRentalErrorResolver] Checking out rental on iTunes side after failure with item ID: %llu homesharing ID: %llu", (uint8_t *)&v14, 0x16u);
  }

  v11 = [(MPHomeSharingML3DataProvider *)self->_dataProvider homeSharingLibrary];
  v12 = objc_msgSend(MEMORY[0x1E4F6A360], "requestWithDatabaseID:itemID:", objc_msgSend(v11, "databaseID"), self->_homeSharingID);
  [v11 sendRequest:v12 withResponseHandler:&__block_literal_global_36755];
  [(MPAVErrorResolver *)self sendDidResolveError:self->_error withResolution:0];
  error = self->_error;
  self->_error = 0;
}

void __61__MPHomeSharingRentalErrorResolver_request_didFailWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingRentalErrorResolver] iTunes rental checkout response: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)resolveError:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(MPHomeSharingRentalErrorResolver *)self _errorIsFairPlayError:v5])
  {
    objc_storeStrong((id *)&self->_error, a3);
    uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t itemID = self->_itemID;
      unint64_t homeSharingID = self->_homeSharingID;
      *(_DWORD *)buf = 134218240;
      unint64_t v13 = itemID;
      __int16 v14 = 2048;
      unint64_t v15 = homeSharingID;
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingRentalErrorResolver] Checking in rental on iTunes side with item ID: %llu homesharing ID: %llu", buf, 0x16u);
    }

    v9 = [(MPHomeSharingML3DataProvider *)self->_dataProvider homeSharingLibrary];
    v10 = objc_msgSend(MEMORY[0x1E4F6A358], "requestWithDatabaseID:itemID:", objc_msgSend(v9, "databaseID"), self->_homeSharingID);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __49__MPHomeSharingRentalErrorResolver_resolveError___block_invoke;
    v11[3] = &unk_1E57F56B0;
    v11[4] = self;
    [v9 sendRequest:v10 withResponseHandler:v11];
  }
  else
  {
    [(MPAVErrorResolver *)self sendDidResolveError:v5 withResolution:0];
  }
}

void __49__MPHomeSharingRentalErrorResolver_resolveError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v3;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingRentalErrorResolver] iTunes rental check-in response: %{public}@", buf, 0xCu);
  }

  unint64_t v5 = [v3 responseCode];
  uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 > 0x12B)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingRentalErrorResolver] iTunes rental check-in failed", buf, 2u);
    }

    v21 = *(void **)(a1 + 32);
    uint64_t v20 = a1 + 32;
    [v21 sendDidResolveError:v21[4] withResolution:0];
    v22 = *(void **)(*(void *)v20 + 32);
    *(void *)(*(void *)v20 + 32) = 0;
  }
  else
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(v8 + 56);
      uint64_t v10 = *(void *)(v8 + 16);
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v10;
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingRentalErrorResolver] Checking out rental for rental ID: %llu, account ID: %llu", buf, 0x16u);
    }

    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2050000000;
    v11 = (void *)getSSRentalCheckoutRequestClass_softClass;
    uint64_t v26 = getSSRentalCheckoutRequestClass_softClass;
    if (!getSSRentalCheckoutRequestClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getSSRentalCheckoutRequestClass_block_invoke;
      v28 = &unk_1E57FA300;
      v29 = &v23;
      __getSSRentalCheckoutRequestClass_block_invoke((uint64_t)buf);
      v11 = (void *)v24[3];
    }
    v12 = v11;
    _Block_object_dispose(&v23, 8);
    id v13 = [v12 alloc];
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v14 = a1 + 32;
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", *(void *)(v15 + 16), v23);
    unint64_t v17 = [NSNumber numberWithUnsignedLongLong:*(void *)(*(void *)v14 + 56)];
    uint64_t v18 = [v13 initWithAccountIdentifier:v16 rentalKeyIdentifier:v17];
    v19 = *(void **)(*(void *)v14 + 64);
    *(void *)(*(void *)v14 + 64) = v18;

    objc_msgSend(*(id *)(*(void *)v14 + 64), "setDelegate:");
    [*(id *)(*(void *)v14 + 64) start];
  }
}

- (void)dealloc
{
  [(SSRentalCheckoutRequest *)self->_request cancel];
  [(SSRentalCheckoutRequest *)self->_request setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)MPHomeSharingRentalErrorResolver;
  [(MPHomeSharingRentalErrorResolver *)&v3 dealloc];
}

- (MPHomeSharingRentalErrorResolver)initWithItemID:(unint64_t)a3 homeSharingID:(unint64_t)a4 rentalID:(unint64_t)a5 accountID:(unint64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)MPHomeSharingRentalErrorResolver;
  result = [(MPHomeSharingRentalErrorResolver *)&v11 init];
  if (result)
  {
    result->_unint64_t itemID = a3;
    result->_unint64_t homeSharingID = a4;
    result->_rentalID = a5;
    result->_accountID = a6;
  }
  return result;
}

@end