@interface MUWebBasedPlacecardImageDataProvider
+ (id)sharedInstance;
- (id)_base64EncodedImageForUIImage:(id)a3;
- (id)imageDataForStyleAttributes:(id)a3;
- (void)attributionDataForVendorID:(id)a3 mapItem:(id)a4 withCompletion:(id)a5;
- (void)dataForAMPId:(id)a3 withCompletion:(id)a4;
@end

@implementation MUWebBasedPlacecardImageDataProvider

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MUWebBasedPlacecardImageDataProvider_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB4F70E8 != -1) {
    dispatch_once(&qword_1EB4F70E8, block);
  }
  v2 = (void *)_MergedGlobals_116;
  return v2;
}

uint64_t __54__MUWebBasedPlacecardImageDataProvider_sharedInstance__block_invoke(uint64_t a1)
{
  _MergedGlobals_116 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (id)imageDataForStyleAttributes:(id)a3
{
  id v4 = a3;
  char v5 = [v4 nightMode];
  uint64_t v6 = [v4 transparent];
  v7 = [v4 styleAttributes];

  v8 = [v7 dictionaryRepresentation];

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F64AA8]) initWithDictionary:v8];
  id v10 = objc_alloc_init(MEMORY[0x1E4F64AA0]);
  [v10 setKey:5];
  [v10 setValue:3];
  [v9 addAttribute:v10];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F645A0]) initWithGEOStyleAttributes:v9];
  v12 = (void *)MEMORY[0x1E4F30EB8];
  v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v13 nativeScale];
  LOBYTE(v17) = v5;
  v14 = objc_msgSend(v12, "imageForStyle:size:forScale:format:transparent:transitMode:isCarplay:nightMode:", v11, 4, 1, v6, 0, 0, v17);

  v15 = [(MUWebBasedPlacecardImageDataProvider *)self _base64EncodedImageForUIImage:v14];

  return v15;
}

- (void)dataForAMPId:(id)a3 withCompletion:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = (void *)MEMORY[0x1E4F30E48];
  id v7 = a3;
  v8 = [v6 sharedInstance];
  v20[0] = v7;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  +[MUPlaceAppLockupView appIconSize];
  double v11 = v10;
  double v13 = v12;
  v14 = [MEMORY[0x1E4F31038] sharedInstance];
  [v14 screenScale];
  double v16 = v15;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68__MUWebBasedPlacecardImageDataProvider_dataForAMPId_withCompletion___block_invoke;
  v18[3] = &unk_1E574EDC0;
  id v19 = v5;
  id v17 = v5;
  objc_msgSend(v8, "appleMediaServicesResultsWithIdentifiers:artworkSize:screenScale:type:source:completion:", v9, 1, 4, v18, v11, v13, v16);
}

void __68__MUWebBasedPlacecardImageDataProvider_dataForAMPId_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a2 firstObject];
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v5 || !v6)
  {
    if (qword_1EB4F70F8 != -1) {
      dispatch_once(&qword_1EB4F70F8, &__block_literal_global_4);
    }
    v24 = qword_1EB4F70F0;
    if (os_log_type_enabled((os_log_t)qword_1EB4F70F0, OS_LOG_TYPE_ERROR))
    {
      int v25 = 138412290;
      id v26 = v5;
      _os_log_impl(&dword_1931EA000, v24, OS_LOG_TYPE_ERROR, "Error with fetching adam ids %@", (uint8_t *)&v25, 0xCu);
    }
    uint64_t v23 = *(void *)(a1 + 32);
    if (v23) {
      goto LABEL_20;
    }
  }
  else if (*(void *)(a1 + 32))
  {
    v8 = [v6 identifier];

    if (v8)
    {
      v9 = [v6 identifier];
      [v7 setObject:v9 forKey:@"identifier"];
    }
    double v10 = [v6 displayName];

    if (v10)
    {
      double v11 = [v6 displayName];
      [v7 setObject:v11 forKey:@"displayName"];
    }
    double v12 = [v6 subtitle];

    if (v12)
    {
      double v13 = [v6 subtitle];
      [v7 setObject:v13 forKey:@"subtitle"];
    }
    v14 = [v6 artworkURL];
    double v15 = [v14 absoluteString];

    if (v15)
    {
      double v16 = [v6 artworkURL];
      id v17 = [v16 absoluteString];
      [v7 setObject:v17 forKey:@"artworkURL"];
    }
    v18 = [v6 url];
    id v19 = [v18 absoluteString];

    if (v19)
    {
      v20 = [v6 url];
      v21 = [v20 absoluteString];
      [v7 setObject:v21 forKey:@"url"];
    }
    v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "isAppInstalled"));
    [v7 setObject:v22 forKey:@"isAppInstalled"];

    uint64_t v23 = *(void *)(a1 + 32);
LABEL_20:
    (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v7);
  }
}

- (void)attributionDataForVendorID:(id)a3 mapItem:(id)a4 withCompletion:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  double v10 = (void (**)(id, void *))a5;
  double v11 = [MEMORY[0x1E4F1CA60] dictionary];
  double v12 = [v9 _attribution];
  double v13 = [v12 providerID];
  int v14 = [v13 isEqualToString:v8];

  if (v14)
  {
    uint64_t v15 = [v9 _attribution];
    goto LABEL_9;
  }
  double v16 = [v9 _reviewsAttribution];
  id v17 = [v16 providerID];
  int v18 = [v17 isEqualToString:v8];

  if (v18)
  {
    uint64_t v15 = [v9 _reviewsAttribution];
    goto LABEL_9;
  }
  id v19 = [v9 _photosAttribution];
  v20 = [v19 providerID];
  int v21 = [v20 isEqualToString:v8];

  if (v21)
  {
    uint64_t v15 = [v9 _photosAttribution];
    goto LABEL_9;
  }
  v22 = [v9 _encyclopedicInfoAttribution];
  uint64_t v23 = [v22 providerID];
  int v24 = [v23 isEqualToString:v8];

  if (v24)
  {
    uint64_t v15 = [v9 _encyclopedicInfoAttribution];
LABEL_9:
    id v25 = (id)v15;
    if (!v15) {
      goto LABEL_21;
    }
    goto LABEL_10;
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = [v9 _allPhotoAttributions];
  id v25 = (id)[obj countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v25)
  {
    v43 = self;
    uint64_t v38 = *(void *)v46;
    while (2)
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v46 != v38) {
          objc_enumerationMutation(obj);
        }
        v40 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        v41 = objc_msgSend(v40, "providerID", v43);
        int v42 = [v41 isEqualToString:v8];

        if (v42)
        {
          id v25 = v40;
          goto LABEL_32;
        }
      }
      id v25 = (id)[obj countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v25) {
        continue;
      }
      break;
    }
LABEL_32:
    self = v43;
  }

  if (v25)
  {
LABEL_10:
    id v26 = [v25 providerName];

    if (v26)
    {
      uint64_t v27 = [v25 providerName];
      [v11 setObject:v27 forKey:@"displayName"];
    }
    v28 = [v25 providerID];

    if (v28)
    {
      v29 = [v25 providerID];
      [v11 setObject:v29 forKey:@"providerID"];
    }
    v30 = [v25 attributionURLs];

    if (v30)
    {
      v31 = [v25 attributionURLs];
      [v11 setObject:v31 forKey:@"baseActionUrl"];
    }
    v32 = [MEMORY[0x1E4F31038] sharedInstance];
    [v32 screenScale];
    v33 = objc_msgSend(v25, "providerLogoImageForScale:");

    if (v33)
    {
      v34 = [(MUWebBasedPlacecardImageDataProvider *)self _base64EncodedImageForUIImage:v33];
      [v11 setObject:v34 forKey:@"logoImage"];
    }
    v35 = [MEMORY[0x1E4F31038] sharedInstance];
    [v35 screenScale];
    v36 = objc_msgSend(v25, "providerSnippetLogoImageForScale:");

    if (v36)
    {
      v37 = [(MUWebBasedPlacecardImageDataProvider *)self _base64EncodedImageForUIImage:v36];
      [v11 setObject:v37 forKey:@"snippetLogoImage"];
    }
  }
LABEL_21:
  v10[2](v10, v11);
}

- (id)_base64EncodedImageForUIImage:(id)a3
{
  v3 = UIImagePNGRepresentation((UIImage *)a3);
  id v4 = [v3 base64EncodedStringWithOptions:0];

  return v4;
}

@end