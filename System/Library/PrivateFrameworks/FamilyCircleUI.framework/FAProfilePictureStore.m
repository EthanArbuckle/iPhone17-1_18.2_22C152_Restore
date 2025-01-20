@interface FAProfilePictureStore
+ (double)screenScale;
+ (id)_dataForImage:(id)a3;
+ (id)profilePictureForContact:(id)a3 serverImageData:(id)a4 firstName:(id)a5 lastName:(id)a6 diameter:(double)a7;
- (FAFamilyCircle)familyCircle;
- (FAProfilePictureStore)initWithFamilyCircle:(id)a3;
- (NSDictionary)profileImages;
- (NSDictionary)recommendedMembersImages;
- (id)contactFor:(id)a3;
- (id)profilePictureForFamilyMember:(id)a3;
- (id)profilePictureForFamilyMember:(id)a3 pictureDiameter:(double)a4;
- (id)profilePictureForFamilyMemberWithAltDSID:(id)a3 pictureDiameter:(double)a4;
- (id)profilePictureForRecommendedFamilyMember:(id)a3;
- (id)profilePicturesWithDiameter:(double)a3;
- (id)resizedPictureWithData:(id)a3 diameter:(double)a4;
- (void)_fetchProfileImages:(BOOL)a3 withCompletion:(id)a4;
- (void)dealloc;
- (void)fetchProfileImagesWithCompletion:(id)a3;
- (void)fetchProfilePicturesForRecommendedFamilyMembers:(id)a3;
- (void)notifyObservable;
- (void)setFamilyCircle:(id)a3;
@end

@implementation FAProfilePictureStore

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)FAProfilePictureStore;
  [(FAProfilePictureStore *)&v4 dealloc];
}

- (FAProfilePictureStore)initWithFamilyCircle:(id)a3
{
  v35[19] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)FAProfilePictureStore;
  v6 = [(FAProfilePictureStore *)&v34 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_familyCircle, a3);
    dispatch_queue_t v8 = dispatch_queue_create("AAUIProfilePictureStorefetchProfileImagesForFamilyCircle", 0);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    profileImages = v7->_profileImages;
    v7->_profileImages = (NSMutableDictionary *)v10;

    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
    recommendedMembersImages = v7->_recommendedMembersImages;
    v7->_recommendedMembersImages = (NSMutableDictionary *)v12;

    v14 = (CNContactStore *)objc_alloc_init(MEMORY[0x263EFEA58]);
    contactStore = v7->_contactStore;
    v7->_contactStore = v14;

    uint64_t v16 = *MEMORY[0x263EFDFC8];
    v35[0] = *MEMORY[0x263EFE040];
    v35[1] = v16;
    uint64_t v17 = *MEMORY[0x263EFDFB8];
    v35[2] = *MEMORY[0x263EFE038];
    v35[3] = v17;
    uint64_t v18 = *MEMORY[0x263EFE048];
    v35[4] = *MEMORY[0x263EFE0B8];
    v35[5] = v18;
    uint64_t v19 = *MEMORY[0x263EFE068];
    v35[6] = *MEMORY[0x263EFE050];
    v35[7] = v19;
    uint64_t v20 = *MEMORY[0x263EFE018];
    v35[8] = *MEMORY[0x263EFDF70];
    v35[9] = v20;
    uint64_t v21 = *MEMORY[0x263EFE090];
    v35[10] = *MEMORY[0x263EFE088];
    v35[11] = v21;
    uint64_t v22 = *MEMORY[0x263EFE098];
    v35[12] = *MEMORY[0x263EFE080];
    v35[13] = v22;
    uint64_t v23 = *MEMORY[0x263EFE070];
    v35[14] = *MEMORY[0x263EFE148];
    v35[15] = v23;
    uint64_t v24 = *MEMORY[0x263EFE140];
    v35[16] = *MEMORY[0x263EFDF80];
    v35[17] = v24;
    v35[18] = *MEMORY[0x263EFDFE0];
    uint64_t v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:19];
    keysToFetch = v7->_keysToFetch;
    v7->_keysToFetch = (NSArray *)v25;

    v27 = v7->_keysToFetch;
    v28 = [MEMORY[0x263EFEA20] descriptorForRequiredKeysForStyle:0];
    uint64_t v29 = [(NSArray *)v27 arrayByAddingObject:v28];
    v30 = v7->_keysToFetch;
    v7->_keysToFetch = (NSArray *)v29;

    v31 = [MEMORY[0x263F08A00] defaultCenter];
    [v31 addObserver:v7 selector:sel__traitCollectionDidChange_ name:*MEMORY[0x263F83DD8] object:0];
  }
  v32 = [MEMORY[0x263F08A00] defaultCenter];
  [v32 addObserver:v7 selector:sel__contactsDidChange name:*MEMORY[0x263EFE118] object:0];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysToFetch, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_recommendedMembersImages, 0);
  objc_storeStrong((id *)&self->_profileImages, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_familyCircle, 0);
}

- (void)setFamilyCircle:(id)a3
{
  objc_storeStrong((id *)&self->_familyCircle, a3);
  id v5 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__FAProfilePictureStore_setFamilyCircle___block_invoke;
  block[3] = &unk_2643489F8;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

void __41__FAProfilePictureStore_setFamilyCircle___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v3 = *(void *)(a1 + 32);
  objc_super v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;
}

- (FAFamilyCircle)familyCircle
{
  return self->_familyCircle;
}

- (NSDictionary)profileImages
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  uint64_t v10 = __Block_byref_object_dispose__4;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__FAProfilePictureStore_profileImages__block_invoke;
  v5[3] = &unk_264349F58;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __38__FAProfilePictureStore_profileImages__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)profilePictureForFamilyMember:(id)a3
{
  id v4 = a3;
  id v5 = [v4 contact];
  uint64_t v6 = [(FAProfilePictureStore *)self profileImages];
  v7 = [v6 objectForKeyedSubscript:v4];
  uint64_t v8 = [v4 firstName];
  v9 = [v4 lastName];

  uint64_t v10 = +[FAProfilePictureStore profilePictureForContact:v5 serverImageData:v7 firstName:v8 lastName:v9 diameter:80.0];

  return v10;
}

+ (id)profilePictureForContact:(id)a3 serverImageData:(id)a4 firstName:(id)a5 lastName:(id)a6 diameter:(double)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = (void *)MEMORY[0x21D47C100]();
  uint64_t v17 = [v12 thumbnailImageData];

  if (v17)
  {
    uint64_t v18 = [v12 thumbnailImageData];
    [a1 screenScale];
    id v20 = [v18 _faCircularImageDataWithDiameter:v19 * a7];
  }
  else
  {
    [a1 screenScale];
    uint64_t v18 = objc_msgSend(v13, "_faCircularImageDataWithDiameter:cropRect:", v21 * a7, *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
    if ([v18 length])
    {
      id v20 = v18;
      uint64_t v18 = v20;
    }
    else
    {
      uint64_t v22 = [v12 givenName];
      if ([v22 length])
      {
      }
      else
      {
        uint64_t v23 = [v12 familyName];
        uint64_t v24 = [v23 length];

        if (!v24)
        {
          if ([v14 length] || objc_msgSend(v15, "length"))
          {
            uint64_t v29 = (void *)MEMORY[0x263F3BF88];
            [a1 screenScale];
            id v20 = [v29 monogramWithFirstName:v14 lastName:v15 diameter:a7 scale:v30];
          }
          else
          {
            v31 = (void *)MEMORY[0x263F3BF88];
            [a1 screenScale];
            id v20 = [v31 silhouetteMonogramWithDiameter:a7 scale:v32];
          }
          goto LABEL_9;
        }
      }
      uint64_t v25 = (void *)MEMORY[0x263F3BF88];
      [a1 screenScale];
      id v20 = [v25 monogramForContact:v12 diameter:a7 scale:v26];
    }
  }
LABEL_9:
  v27 = v20;

  return v27;
}

+ (id)_dataForImage:(id)a3
{
  return UIImagePNGRepresentation((UIImage *)a3);
}

+ (double)screenScale
{
  uint64_t v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 scale];
  double v4 = v3;

  return v4;
}

- (void)_fetchProfileImages:(BOOL)a3 withCompletion:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v17 = a4;
  uint64_t v16 = [(FAProfilePictureStore *)self profileImages];
  if (a3 || ![v16 count])
  {
    uint64_t v6 = dispatch_group_create();
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__4;
    v28[4] = __Block_byref_object_dispose__4;
    id v29 = 0;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v7 = [(FAFamilyCircle *)self->_familyCircle members];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v25;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v24 + 1) + 8 * v10);
          dispatch_group_enter(v6);
          id v12 = objc_alloc(MEMORY[0x263F3BF58]);
          id v13 = [v11 dsid];
          id v14 = (void *)[v12 initWithFamilyMemberDSID:v13 size:1 localFallback:1];

          [v14 setUseMonogramAsLastResort:0];
          +[FAProfilePictureStore screenScale];
          [v14 setMonogramDiameter:v15 * 80.0];
          v21[0] = MEMORY[0x263EF8330];
          v21[1] = 3221225472;
          v21[2] = __60__FAProfilePictureStore__fetchProfileImages_withCompletion___block_invoke;
          v21[3] = &unk_264349FA8;
          v21[4] = self;
          v21[5] = v11;
          uint64_t v23 = v28;
          uint64_t v22 = v6;
          [v14 startRequestWithCompletionHandler:v21];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v8);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__FAProfilePictureStore__fetchProfileImages_withCompletion___block_invoke_42;
    block[3] = &unk_264349FD0;
    block[4] = self;
    id v19 = v17;
    id v20 = v28;
    dispatch_group_notify(v6, MEMORY[0x263EF83A0], block);

    _Block_object_dispose(v28, 8);
  }
  else
  {
    (*((void (**)(id, void *, void))v17 + 2))(v17, v16, 0);
  }
}

void __60__FAProfilePictureStore__fetchProfileImages_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__FAProfilePictureStore__fetchProfileImages_withCompletion___block_invoke_2;
  block[3] = &unk_264349F80;
  id v13 = v6;
  long long v14 = *(_OWORD *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 56);
  id v15 = v7;
  uint64_t v16 = v9;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(v8, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __60__FAProfilePictureStore__fetchProfileImages_withCompletion___block_invoke_2(void *a1)
{
  if (a1[4])
  {
    uint64_t v2 = *(void **)(a1[5] + 24);
    objc_msgSend(v2, "setObject:forKeyedSubscript:");
  }
  else
  {
    uint64_t v3 = *(void *)(a1[8] + 8);
    id v6 = *(void **)(v3 + 40);
    double v4 = (id *)(v3 + 40);
    id v5 = v6;
    if (!v6) {
      id v5 = (void *)a1[7];
    }
    objc_storeStrong(v4, v5);
    id v7 = _FALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __60__FAProfilePictureStore__fetchProfileImages_withCompletion___block_invoke_2_cold_1((uint64_t)a1, v7);
    }
  }
}

void __60__FAProfilePictureStore__fetchProfileImages_withCompletion___block_invoke_42(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:FAProfilePictureStoreDidReloadImagesNotification object:*(void *)(a1 + 32)];

  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) profileImages];
  (*(void (**)(uint64_t, id, void))(v3 + 16))(v3, v4, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
}

- (void)fetchProfileImagesWithCompletion:(id)a3
{
}

- (id)profilePicturesWithDiameter:(double)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v6 = dispatch_group_create();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v7 = [(FAFamilyCircle *)self->_familyCircle members];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        id v13 = [MEMORY[0x263EFF8F8] data];
        [v5 setObject:v13 forKeyedSubscript:v12];

        dispatch_group_enter(v6);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v9);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = [(FAFamilyCircle *)self->_familyCircle members];
  uint64_t v14 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v32 + 1) + 8 * j);
        id v19 = [(FAProfilePictureStore *)self profilePictureForFamilyMember:v18];
        id v20 = dispatch_get_global_queue(33, 0);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __53__FAProfilePictureStore_profilePicturesWithDiameter___block_invoke;
        block[3] = &unk_264349FF8;
        id v26 = v5;
        uint64_t v27 = v18;
        v28 = self;
        id v29 = v19;
        double v31 = a3;
        double v30 = v6;
        id v21 = v19;
        dispatch_async(v20, block);
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v15);
  }

  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v22 = (void *)[v5 copy];

  return v22;
}

void __53__FAProfilePictureStore_profilePicturesWithDiameter___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 48) resizedPictureWithData:*(void *)(a1 + 56) diameter:*(double *)(a1 + 72)];
  [*(id *)(a1 + 32) setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v3 = *(NSObject **)(a1 + 64);
  dispatch_group_leave(v3);
}

- (id)profilePictureForFamilyMemberWithAltDSID:(id)a3 pictureDiameter:(double)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [(FAFamilyCircle *)self->_familyCircle members];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v13 = [v12 altDSID];
        char v14 = [v13 isEqualToString:v6];

        if (v14)
        {
          uint64_t v15 = [(FAProfilePictureStore *)self profilePictureForFamilyMember:v12 pictureDiameter:a4];
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v15 = 0;
LABEL_11:

  return v15;
}

- (id)profilePictureForFamilyMember:(id)a3 pictureDiameter:(double)a4
{
  id v6 = [(FAProfilePictureStore *)self profilePictureForFamilyMember:a3];
  id v7 = [(FAProfilePictureStore *)self resizedPictureWithData:v6 diameter:a4];

  return v7;
}

- (void)fetchProfilePicturesForRecommendedFamilyMembers:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v20;
    *(void *)&long long v5 = 138412290;
    long long v17 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v10 = -[FAProfilePictureStore contactFor:](self, "contactFor:", v9, v17);
        id v11 = [v10 identifier];

        if (v11)
        {
          uint64_t v12 = [v10 givenName];
          id v13 = [v10 familyName];
          char v14 = +[FAProfilePictureStore profilePictureForContact:v10 serverImageData:0 firstName:v12 lastName:v13 diameter:40.0];
          recommendedMembersImages = self->_recommendedMembersImages;
          uint64_t v16 = [v10 identifier];
          [(NSMutableDictionary *)recommendedMembersImages setObject:v14 forKeyedSubscript:v16];
        }
        else
        {
          uint64_t v12 = _FALogSystem();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            uint64_t v24 = v9;
            _os_log_error_impl(&dword_2189F0000, v12, OS_LOG_TYPE_ERROR, "contact.identifier was nil. Skipping fetching profile image for recommended family member: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v6);
  }
}

- (id)profilePictureForRecommendedFamilyMember:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  recommendedMembersImages = self->_recommendedMembersImages;
  uint64_t v6 = [v4 contact];
  uint64_t v7 = [v6 identifier];
  uint64_t v8 = [(NSMutableDictionary *)recommendedMembersImages objectForKeyedSubscript:v7];

  if (!v8)
  {
    v15[0] = v4;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    [(FAProfilePictureStore *)self fetchProfilePicturesForRecommendedFamilyMembers:v9];
  }
  uint64_t v10 = self->_recommendedMembersImages;
  id v11 = [v4 contact];
  uint64_t v12 = [v11 identifier];
  id v13 = [(NSMutableDictionary *)v10 objectForKeyedSubscript:v12];

  return v13;
}

- (id)contactFor:(id)a3
{
  contactStore = self->_contactStore;
  long long v5 = [a3 contact];
  uint64_t v6 = [v5 identifier];
  uint64_t v7 = [(CNContactStore *)contactStore unifiedContactWithIdentifier:v6 keysToFetch:self->_keysToFetch error:0];

  return v7;
}

- (id)resizedPictureWithData:(id)a3 diameter:(double)a4
{
  id v5 = a3;
  +[FAProfilePictureStore screenScale];
  uint64_t v7 = [v5 _faCircularImageDataWithDiameter:v6 * a4];

  return v7;
}

- (NSDictionary)recommendedMembersImages
{
  return &self->_recommendedMembersImages->super;
}

- (void)notifyObservable
{
  uint64_t v2 = self;
  FAProfilePictureStore.notifyObservable()();
}

void __60__FAProfilePictureStore__fetchProfileImages_withCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_2189F0000, a2, OS_LOG_TYPE_ERROR, "Unable to get image data for member: %@ error: %@", (uint8_t *)&v4, 0x16u);
}

@end