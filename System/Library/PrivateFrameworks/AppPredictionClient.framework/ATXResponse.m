@interface ATXResponse
+ (BOOL)supportsSecureCoding;
- (ATXResponse)initWithCoder:(id)a3;
- (ATXResponse)initWithPredictions:(id)a3 cacheFileData:(id)a4 error:(id)a5;
- (ATXResponse)initWithPredictions:(id)a3 proactiveSuggestions:(id)a4 uuid:(id)a5 cacheFileData:(id)a6 blendingUICacheUpdateUUID:(id)a7 error:(id)a8;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToResponse:(id)a3;
- (NSArray)predictedApps;
- (NSArray)predictions;
- (NSArray)proactiveSuggestions;
- (NSData)cacheFileData;
- (NSError)error;
- (NSUUID)blendingModelUICacheUpdateUUID;
- (NSUUID)uuid;
- (id)description;
- (id)json;
- (id)jsonDescription;
- (id)jsonRawData;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateAtxSearchResults:(id)a3;
- (void)json;
@end

@implementation ATXResponse

- (ATXResponse)initWithPredictions:(id)a3 cacheFileData:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_opt_new();
  v12 = [(ATXResponse *)self initWithPredictions:v10 proactiveSuggestions:0 uuid:v11 cacheFileData:v9 blendingUICacheUpdateUUID:0 error:v8];

  return v12;
}

- (ATXResponse)initWithPredictions:(id)a3 proactiveSuggestions:(id)a4 uuid:(id)a5 cacheFileData:(id)a6 blendingUICacheUpdateUUID:(id)a7 error:(id)a8
{
  id v26 = a3;
  id v25 = a4;
  id v24 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v27.receiver = self;
  v27.super_class = (Class)ATXResponse;
  v18 = [(ATXResponse *)&v27 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_uuid, a5);
    objc_storeStrong((id *)&v19->_predictions, a3);
    objc_storeStrong((id *)&v19->_proactiveSuggestions, a4);
    objc_storeStrong((id *)&v19->_cacheFileData, a6);
    objc_storeStrong((id *)&v19->_blendingModelUICacheUpdateUUID, a7);
    objc_storeStrong((id *)&v19->_error, a8);
    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create("appClipQueue", v20);
    appClipQueue = v19->_appClipQueue;
    v19->_appClipQueue = (OS_dispatch_queue *)v21;
  }
  return v19;
}

- (NSArray)predictedApps
{
  return (NSArray *)+[ATXScoredPrediction predictionsFrom:self->_predictions];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"uuid:%@\npredictions:%@\nproactiveSuggestions:%@\ncacheFileData: %lu bytes\nblendingModelUICacheUpdateUUID:%@\nerror: %@", self->_uuid, self->_predictions, self->_proactiveSuggestions, -[NSData length](self->_cacheFileData, "length"), self->_blendingModelUICacheUpdateUUID, self->_error];
}

- (id)jsonRawData
{
  v20[6] = *MEMORY[0x1E4F143B8];
  v19[0] = @"uuid";
  uint64_t v3 = [(NSUUID *)self->_uuid description];
  v4 = (void *)v3;
  if (v3) {
    v5 = (__CFString *)v3;
  }
  else {
    v5 = @"nil";
  }
  v20[0] = v5;
  v19[1] = @"predictedApps";
  v6 = [(ATXResponse *)self predictedApps];
  v7 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v20[1] = v7;
  v19[2] = @"proactiveSuggestions";
  uint64_t v8 = [(ATXResponse *)self proactiveSuggestions];
  id v9 = (void *)v8;
  uint64_t v10 = MEMORY[0x1E4F1CBF0];
  if (v8) {
    uint64_t v10 = v8;
  }
  v20[2] = v10;
  v19[3] = @"cacheFileData";
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSData length](self->_cacheFileData, "length"));
  v12 = (void *)v11;
  blendingModelUICacheUpdateUUID = self->_blendingModelUICacheUpdateUUID;
  if (!blendingModelUICacheUpdateUUID) {
    blendingModelUICacheUpdateUUID = (NSUUID *)&stru_1EFD9B408;
  }
  v20[3] = v11;
  v20[4] = blendingModelUICacheUpdateUUID;
  v19[4] = @"blendingUICacheUpdateUUID";
  v19[5] = @"error";
  uint64_t v14 = [(NSError *)self->_error description];
  id v15 = (void *)v14;
  if (v14) {
    id v16 = (__CFString *)v14;
  }
  else {
    id v16 = @"nil";
  }
  v20[5] = v16;
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];

  if (!v6) {

  }
  return v17;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  uint64_t v3 = [(ATXResponse *)self jsonRawData];
  id v8 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  id v5 = v8;

  if (v5)
  {
    v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(ATXResponse *)(uint64_t)v5 json];
    }
  }

  return v4;
}

- (id)jsonDescription
{
  id v3 = [NSString alloc];
  v4 = [(ATXResponse *)self json];
  id v5 = (void *)[v3 initWithData:v4 encoding:4];

  return v5;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_uuid hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXResponse *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXResponse *)self isEqualToResponse:v5];

  return v6;
}

- (BOOL)isEqualToResponse:(id)a3
{
  v4 = (id *)a3;
  uuid = self->_uuid;
  BOOL v6 = (NSUUID *)v4[3];
  if (uuid == v6)
  {
  }
  else
  {
    v7 = v6;
    id v8 = uuid;
    char v9 = [(NSUUID *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_19;
    }
  }
  predictions = self->_predictions;
  uint64_t v11 = (NSArray *)v4[5];
  if (predictions == v11)
  {
  }
  else
  {
    v12 = v11;
    v13 = predictions;
    char v14 = [(NSArray *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_19;
    }
  }
  proactiveSuggestions = self->_proactiveSuggestions;
  id v16 = (NSArray *)v4[6];
  if (proactiveSuggestions == v16)
  {
  }
  else
  {
    id v17 = v16;
    v18 = proactiveSuggestions;
    char v19 = [(NSArray *)v18 isEqual:v17];

    if ((v19 & 1) == 0) {
      goto LABEL_19;
    }
  }
  cacheFileData = self->_cacheFileData;
  dispatch_queue_t v21 = (NSData *)v4[1];
  if (cacheFileData == v21)
  {
  }
  else
  {
    v22 = v21;
    v23 = cacheFileData;
    char v24 = [(NSData *)v23 isEqual:v22];

    if ((v24 & 1) == 0) {
      goto LABEL_19;
    }
  }
  blendingModelUICacheUpdateUUID = self->_blendingModelUICacheUpdateUUID;
  id v26 = (NSUUID *)v4[7];
  if (blendingModelUICacheUpdateUUID == v26)
  {
  }
  else
  {
    objc_super v27 = v26;
    v28 = blendingModelUICacheUpdateUUID;
    char v29 = [(NSUUID *)v28 isEqual:v27];

    if ((v29 & 1) == 0)
    {
LABEL_19:
      char v30 = 0;
      goto LABEL_20;
    }
  }
  v32 = self->_error;
  v33 = v32;
  if (v32 == v4[4]) {
    char v30 = 1;
  }
  else {
    char v30 = -[NSError isEqual:](v32, "isEqual:");
  }

LABEL_20:
  return v30;
}

- (void)enumerateAtxSearchResults:(id)a3
{
  id v4 = a3;
  predictions = self->_predictions;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__ATXResponse_enumerateAtxSearchResults___block_invoke;
  v7[3] = &unk_1E5D0A8A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSArray *)predictions enumerateObjectsUsingBlock:v7];
}

void __41__ATXResponse_enumerateAtxSearchResults___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = *(void **)(*(void *)(a1 + 32) + 48);
  id v6 = a2;
  if ([v5 count] <= a3)
  {
    v7 = 0;
  }
  else
  {
    v7 = [*(id *)(*(void *)(a1 + 32) + 48) objectAtIndex:a3];
  }
  id v8 = [[ATXSearchResult alloc] initWithScoredBundleId:v6 response:*(void *)(a1 + 32) proactiveSuggestion:v7];
  char v9 = [v6 predictedItem];

  uint64_t v10 = v9;
  if (!+[ATXApplicationRecord isAppClipWebClipBundleId:v10])
  {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v10 allowPlaceholder:1 error:0];
    v13 = [v12 localizedName];
    uint64_t v15 = 2;
    char v14 = v10;
    goto LABEL_10;
  }

  uint64_t v11 = [MEMORY[0x1E4F59138] sharedStore];
  v12 = [v11 synchronouslyGetAppClipWithIdentifier:v10];

  v13 = [v12 title];
  if (v12 && [v12 isApplicationInstalled] && v13)
  {
    char v14 = @"com.apple.application";
    uint64_t v15 = 22;
LABEL_10:

    if (![v13 length])
    {
      id v16 = __atxlog_handle_ui();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        __41__ATXResponse_enumerateAtxSearchResults___block_invoke_cold_2((uint64_t)v10, v16);
      }
    }
    id v17 = [MEMORY[0x1E4F9A4C0] textWithString:v13];
    [(ATXSearchResult *)v8 setTitle:v17];

    [(ATXSearchResult *)v8 setIdentifier:v10];
    [(ATXSearchResult *)v8 setApplicationBundleIdentifier:v14];
    [(ATXSearchResult *)v8 setIsLocalApplicationResult:1];
    [(ATXSearchResult *)v8 setSectionBundleIdentifier:@"com.apple.spotlight.dec.zkw.apps"];
    [(ATXSearchResult *)v8 setRenderHorizontallyWithOtherResultsInCategory:1];
    v18 = [(ATXSearchResult *)v8 title];
    [v18 setMaxLines:1];

    char v19 = [(ATXSearchResult *)v8 applicationBundleIdentifier];
    [(ATXSearchResult *)v8 setResultBundleId:v19];

    [(ATXSearchResult *)v8 setType:v15];
    v20 = __atxlog_handle_ui();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v26 = 138412290;
      objc_super v27 = v13;
      _os_log_impl(&dword_1A790D000, v20, OS_LOG_TYPE_INFO, "zkw app title: %@", (uint8_t *)&v26, 0xCu);
    }

    dispatch_queue_t v21 = __atxlog_handle_ui();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = [(ATXSearchResult *)v8 identifier];
      int v26 = 138412290;
      objc_super v27 = v22;
      _os_log_impl(&dword_1A790D000, v21, OS_LOG_TYPE_INFO, "zkw searchResult.identifier: %@", (uint8_t *)&v26, 0xCu);
    }
    v23 = __atxlog_handle_ui();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      char v24 = [(ATXSearchResult *)v8 applicationBundleIdentifier];
      int v26 = 138412290;
      objc_super v27 = v24;
      _os_log_impl(&dword_1A790D000, v23, OS_LOG_TYPE_INFO, "zkw searchResult.applicationBundleIdentifier: %@", (uint8_t *)&v26, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_24;
  }
  id v25 = __atxlog_handle_ui();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    __41__ATXResponse_enumerateAtxSearchResults___block_invoke_cold_1(v25);
  }

  char v14 = @"com.apple.application";
LABEL_24:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  char v9 = [v4 decodeObjectOfClasses:v8 forKey:@"scoredPredictions"];
  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"proactiveSuggestions"];
  char v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cacheFileData"];
  uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"blendingModelUICacheUpdateUUID"];
  id v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];

  id v17 = [(ATXResponse *)self initWithPredictions:v9 proactiveSuggestions:v13 uuid:v5 cacheFileData:v14 blendingUICacheUpdateUUID:v15 error:v16];
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  uuid = self->_uuid;
  id v5 = a3;
  [v5 encodeObject:uuid forKey:@"uuid"];
  [v5 encodeObject:self->_predictions forKey:@"scoredPredictions"];
  [v5 encodeObject:self->_proactiveSuggestions forKey:@"proactiveSuggestions"];
  [v5 encodeObject:self->_cacheFileData forKey:@"cacheFileData"];
  [v5 encodeObject:self->_blendingModelUICacheUpdateUUID forKey:@"blendingModelUICacheUpdateUUID"];
  [v5 encodeObject:self->_error forKey:@"error"];
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSError)error
{
  return self->_error;
}

- (NSArray)predictions
{
  return self->_predictions;
}

- (NSArray)proactiveSuggestions
{
  return self->_proactiveSuggestions;
}

- (NSUUID)blendingModelUICacheUpdateUUID
{
  return self->_blendingModelUICacheUpdateUUID;
}

- (NSData)cacheFileData
{
  return self->_cacheFileData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blendingModelUICacheUpdateUUID, 0);
  objc_storeStrong((id *)&self->_proactiveSuggestions, 0);
  objc_storeStrong((id *)&self->_predictions, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_appClipQueue, 0);

  objc_storeStrong((id *)&self->_cacheFileData, 0);
}

- (void)json
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "Unable to serialize ATXResponse. Error: %@", (uint8_t *)&v2, 0xCu);
}

void __41__ATXResponse_enumerateAtxSearchResults___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "Uninstalled webClip reached ATXReponse", v1, 2u);
}

void __41__ATXResponse_enumerateAtxSearchResults___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "ZKW app result had no title for bundleId: %@", (uint8_t *)&v2, 0xCu);
}

@end