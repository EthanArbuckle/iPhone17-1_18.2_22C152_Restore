@interface MKAppleMediaServices
+ (id)sharedInstance;
+ (id)sourceStringWithSource:(int64_t)a3;
- (BOOL)isVisualIntelligenceProcess;
- (id)additionalParameterWithType:(int64_t)a3;
- (id)externalRequestCounterRequestSubtypeWithType:(int64_t)a3;
- (id)externalRequestCounterRequestType;
- (int64_t)AMSMediaTaskTypeFromGEOAppleMediaServicesMediaType:(int64_t)a3;
- (void)appleMediaServicesResultsWithBundleIdentifiers:(id)a3 artworkSize:(CGSize)a4 screenScale:(double)a5 source:(int64_t)a6 completion:(id)a7;
- (void)appleMediaServicesResultsWithBundleIdentifiers:(id)a3 source:(int64_t)a4 completion:(id)a5;
- (void)appleMediaServicesResultsWithIdentifiers:(id)a3 artworkSize:(CGSize)a4 screenScale:(double)a5 type:(int64_t)a6 source:(int64_t)a7 completion:(id)a8;
- (void)appleMediaServicesResultsWithIdentifiers:(id)a3 bundleIdentifiers:(id)a4 artworkSize:(CGSize)a5 screenScale:(double)a6 type:(int64_t)a7 source:(int64_t)a8 completion:(id)a9;
- (void)appleMediaServicesResultsWithIdentifiers:(id)a3 source:(int64_t)a4 completion:(id)a5;
- (void)mediaResultWithIdentifiers:(id)a3 bundleIdentifiers:(id)a4 artworkSize:(CGSize)a5 screenScale:(double)a6 type:(int64_t)a7 source:(int64_t)a8 completion:(id)a9;
@end

@implementation MKAppleMediaServices

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__MKAppleMediaServices_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB315C40 != -1) {
    dispatch_once(&qword_1EB315C40, block);
  }
  v2 = (void *)_MergedGlobals_127;

  return v2;
}

void __38__MKAppleMediaServices_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_127;
  _MergedGlobals_127 = (uint64_t)v1;
}

- (void)appleMediaServicesResultsWithIdentifiers:(id)a3 source:(int64_t)a4 completion:(id)a5
{
}

- (void)appleMediaServicesResultsWithIdentifiers:(id)a3 artworkSize:(CGSize)a4 screenScale:(double)a5 type:(int64_t)a6 source:(int64_t)a7 completion:(id)a8
{
}

- (void)appleMediaServicesResultsWithBundleIdentifiers:(id)a3 source:(int64_t)a4 completion:(id)a5
{
}

- (void)appleMediaServicesResultsWithBundleIdentifiers:(id)a3 artworkSize:(CGSize)a4 screenScale:(double)a5 source:(int64_t)a6 completion:(id)a7
{
}

- (void)appleMediaServicesResultsWithIdentifiers:(id)a3 bundleIdentifiers:(id)a4 artworkSize:(CGSize)a5 screenScale:(double)a6 type:(int64_t)a7 source:(int64_t)a8 completion:(id)a9
{
  double height = a5.height;
  double width = a5.width;
  id v17 = a9;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __130__MKAppleMediaServices_appleMediaServicesResultsWithIdentifiers_bundleIdentifiers_artworkSize_screenScale_type_source_completion___block_invoke;
  v19[3] = &unk_1E54B83D0;
  id v20 = v17;
  id v18 = v17;
  -[MKAppleMediaServices mediaResultWithIdentifiers:bundleIdentifiers:artworkSize:screenScale:type:source:completion:](self, "mediaResultWithIdentifiers:bundleIdentifiers:artworkSize:screenScale:type:source:completion:", a3, a4, a7, a8, v19, width, height, a6);
}

void __130__MKAppleMediaServices_appleMediaServicesResultsWithIdentifiers_bundleIdentifiers_artworkSize_screenScale_type_source_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = (void *)MEMORY[0x1E4F28C58];
    v15 = @"error";
    v16[0] = v6;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    v11 = [v9 errorWithDomain:@"MKAppleMediaServicesErrorDomain" code:1 userInfo:v10];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v11);
  }
  else
  {
    uint64_t v12 = [v5 count];
    uint64_t v13 = *(void *)(a1 + 32);
    if (v12)
    {
      (*(void (**)(uint64_t, id, void))(v13 + 16))(v13, v5, 0);
    }
    else
    {
      v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MKAppleMediaServicesErrorDomain" code:2 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v14);
    }
  }
}

- (void)mediaResultWithIdentifiers:(id)a3 bundleIdentifiers:(id)a4 artworkSize:(CGSize)a5 screenScale:(double)a6 type:(int64_t)a7 source:(int64_t)a8 completion:(id)a9
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v17 = a3;
  id v18 = a4;
  id v19 = a9;
  id v20 = [getAMSMediaTaskClass() bagSubProfile];
  uint64_t v21 = [getAMSMediaTaskClass() bagSubProfileVersion];
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2050000000;
  v22 = (void *)getAMSBagClass_softClass;
  uint64_t v58 = getAMSBagClass_softClass;
  if (!getAMSBagClass_softClass)
  {
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __getAMSBagClass_block_invoke;
    v54[3] = &unk_1E54B8448;
    v54[4] = &v55;
    __getAMSBagClass_block_invoke((uint64_t)v54);
    v22 = (void *)v56[3];
  }
  v43 = v19;
  id v23 = v22;
  _Block_object_dispose(&v55, 8);
  v44 = (void *)v21;
  v24 = [v23 bagForProfile:v20 profileVersion:v21];
  int64_t v25 = [(MKAppleMediaServices *)self AMSMediaTaskTypeFromGEOAppleMediaServicesMediaType:a7];
  BOOL v26 = [(MKAppleMediaServices *)self isVisualIntelligenceProcess];
  v27 = @"com.apple.Maps";
  if (v26) {
    v27 = @"com.apple.VisualIntelligenceCamera";
  }
  v28 = v27;
  v29 = (void *)[objc_alloc((Class)getAMSMediaTaskClass()) initWithType:v25 clientIdentifier:v28 clientVersion:@"1" bag:v24];

  if ([v17 count])
  {
    v40 = v20;
    id v41 = v18;
    id v42 = v17;
    [v29 setItemIdentifiers:v17];
  }
  else
  {
    if (![v18 count])
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __116__MKAppleMediaServices_mediaResultWithIdentifiers_bundleIdentifiers_artworkSize_screenScale_type_source_completion___block_invoke;
      block[3] = &unk_1E54B82E8;
      v53 = v43;
      id v39 = v43;
      dispatch_async(MEMORY[0x1E4F14428], block);
      id v38 = v53;
      goto LABEL_10;
    }
    v40 = v20;
    id v41 = v18;
    id v42 = v17;
    [v29 setBundleIdentifiers:v18];
  }
  v30 = [(MKAppleMediaServices *)self additionalParameterWithType:a7];
  [v29 setAdditionalQueryParams:v30];

  v31 = [MEMORY[0x1E4F64900] sharedCounter];
  v32 = [(MKAppleMediaServices *)self externalRequestCounterRequestType];
  v33 = [(MKAppleMediaServices *)self externalRequestCounterRequestSubtypeWithType:a7];
  v34 = [(id)objc_opt_class() sourceStringWithSource:a8];
  v35 = GEOApplicationIdentifierOrProcessName();
  v36 = [v31 externalRequestCounterTicketForType:v32 subtype:v33 source:v34 appId:v35];

  v37 = [v29 perform];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __116__MKAppleMediaServices_mediaResultWithIdentifiers_bundleIdentifiers_artworkSize_screenScale_type_source_completion___block_invoke_2;
  v45[3] = &unk_1E54B8420;
  CGFloat v49 = width;
  CGFloat v50 = height;
  double v51 = a6;
  id v46 = v36;
  id v47 = v43;
  int64_t v48 = a7;
  id v38 = v43;
  id v39 = v36;
  [v37 addFinishBlock:v45];

  id v18 = v41;
  id v17 = v42;
  id v20 = v40;
LABEL_10:
}

uint64_t __116__MKAppleMediaServices_mediaResultWithIdentifiers_bundleIdentifiers_artworkSize_screenScale_type_source_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __116__MKAppleMediaServices_mediaResultWithIdentifiers_bundleIdentifiers_artworkSize_screenScale_type_source_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v21 = a3;
  v22 = v5;
  id v6 = [v5 responseDataItems];
  v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F643E8]), "initWithResponseDictionary:mediaType:artworkSize:screenScale:", v13, *(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
        if (v14)
        {
          v15 = MKGetAppleMediaServicesServerLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v32 = v14;
            __int16 v33 = 2112;
            uint64_t v34 = v13;
            _os_log_impl(&dword_18BAEC000, v15, OS_LOG_TYPE_INFO, "Returning result %@ from responseDictionary %@", buf, 0x16u);
          }

          [v7 addObject:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v10);
  }

  v16 = *(void **)(a1 + 32);
  id v17 = [v22 responseDictionary];
  [v16 requestCompletedWithAMPResult:v17];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __116__MKAppleMediaServices_mediaResultWithIdentifiers_bundleIdentifiers_artworkSize_screenScale_type_source_completion___block_invoke_19;
  block[3] = &unk_1E54B83F8;
  id v18 = *(id *)(a1 + 40);
  id v24 = v7;
  id v25 = v21;
  id v26 = v18;
  id v19 = v21;
  id v20 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __116__MKAppleMediaServices_mediaResultWithIdentifiers_bundleIdentifiers_artworkSize_screenScale_type_source_completion___block_invoke_19(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if ([*(id *)(a1 + 32) count]) {
    uint64_t v3 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);

  return v5(v2, v3, v4);
}

- (BOOL)isVisualIntelligenceProcess
{
  uint64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v3 = [v2 bundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.VisualIntelligenceCamera"];

  return v4;
}

- (int64_t)AMSMediaTaskTypeFromGEOAppleMediaServicesMediaType:(int64_t)a3
{
  int64_t result = 0;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0:
      char v4 = MKGetAppleMediaServicesServerLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        id v5 = [NSNumber numberWithInteger:0];
        int v6 = 138412290;
        v7 = v5;
        _os_log_impl(&dword_18BAEC000, v4, OS_LOG_TYPE_ERROR, "Unhandled GEOAppleMediaServicesMediaType %@", (uint8_t *)&v6, 0xCu);
      }
      goto LABEL_5;
    case 3:
      int64_t result = 5;
      break;
    case 4:
      int64_t result = 203;
      break;
    case 5:
LABEL_5:
      int64_t result = 200;
      break;
    case 6:
      int64_t result = 205;
      break;
    case 7:
      int64_t result = 202;
      break;
    case 8:
      int64_t result = 204;
      break;
    case 9:
      int64_t result = 201;
      break;
    case 10:
      int64_t result = 206;
      break;
    case 11:
      int64_t result = 207;
      break;
    case 12:
      int64_t result = 301;
      break;
    case 13:
      int64_t result = 300;
      break;
    case 14:
      int64_t result = 302;
      break;
    case 15:
      int64_t result = 101;
      break;
    case 16:
      int64_t result = 100;
      break;
    case 17:
      int64_t result = 103;
      break;
    case 18:
      int64_t result = 400;
      break;
    case 19:
      int64_t result = 402;
      break;
    case 20:
      int64_t result = 401;
      break;
    default:
      return result;
  }
  return result;
}

- (id)additionalParameterWithType:(int64_t)a3
{
  if (a3 <= 2)
  {
    if (a3 == 1) {
      return &unk_1ED97F080;
    }
    if (a3 == 2) {
      return &unk_1ED97F0F8;
    }
    else {
      return 0;
    }
  }
  else
  {
    switch(a3)
    {
      case 19:
        return &unk_1ED97F0D0;
      case 17:
        return &unk_1ED97F0A8;
      case 3:
        return &unk_1ED97F080;
      default:
        return 0;
    }
  }
}

+ (id)sourceStringWithSource:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 9) {
    return @"Open App";
  }
  else {
    return *(&off_1E54B8480 + a3 - 2);
  }
}

- (id)externalRequestCounterRequestType
{
  return @"AppleMediaServices";
}

- (id)externalRequestCounterRequestSubtypeWithType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x13) {
    return @"Unknown Subtype";
  }
  else {
    return *(&off_1E54B84D0 + a3 - 1);
  }
}

@end