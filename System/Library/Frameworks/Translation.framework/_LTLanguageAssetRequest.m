@interface _LTLanguageAssetRequest
+ (BOOL)supportsSecureCoding;
- (NSArray)assets;
- (_LTLanguageAssetRequest)assetRequestWithService:(id)a3 done:(id)a4;
- (_LTLanguageAssetRequest)initWithCoder:(id)a3;
- (_LTLanguageAssetRequest)initWithLanguageAssets:(id)a3 options:(unint64_t)a4 progress:(id)a5 completion:(id)a6;
- (_LTSpeechTranslationDelegate)delegate;
- (id)completion;
- (id)progress;
- (unint64_t)options;
- (void)assetResponseWithProgress:(id)a3 finished:(BOOL)a4 error:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation _LTLanguageAssetRequest

- (_LTLanguageAssetRequest)initWithLanguageAssets:(id)a3 options:(unint64_t)a4 progress:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)_LTLanguageAssetRequest;
  v14 = [(_LTLanguageAssetRequest *)&v23 init];
  if (v14)
  {
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.translationd.AssetXPC", 0);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v14->_assets, a3);
    v14->_options = a4;
    uint64_t v17 = [v12 copy];
    id progress = v14->_progress;
    v14->_id progress = (id)v17;

    uint64_t v19 = [v13 copy];
    id completion = v14->_completion;
    v14->_id completion = (id)v19;

    v21 = v14;
  }

  return v14;
}

- (_LTLanguageAssetRequest)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_LTLanguageAssetRequest;
  v5 = [(_LTLanguageAssetRequest *)&v12 init];
  if (v5)
  {
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
    v7 = [MEMORY[0x263EFFA08] setWithArray:v6];
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"assets"];
    assets = v5->_assets;
    v5->_assets = (NSArray *)v8;

    v5->_options = [v4 decodeIntegerForKey:@"options"];
    v10 = v5;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  assets = self->_assets;
  id v5 = a3;
  [v5 encodeObject:assets forKey:@"assets"];
  [v5 encodeInteger:self->_options forKey:@"options"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_LTLanguageAssetRequest)assetRequestWithService:(id)a3 done:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56___LTLanguageAssetRequest_assetRequestWithService_done___block_invoke;
  v12[3] = &unk_2651DB9F8;
  objc_copyWeak(&v15, &location);
  id v13 = v6;
  id v14 = v7;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  return result;
}

- (void)assetResponseWithProgress:(id)a3 finished:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68___LTLanguageAssetRequest_assetResponseWithProgress_finished_error___block_invoke;
  block[3] = &unk_2651DBA70;
  objc_copyWeak(&v16, &location);
  BOOL v17 = a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (_LTSpeechTranslationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_LTSpeechTranslationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)assets
{
  return self->_assets;
}

- (unint64_t)options
{
  return self->_options;
}

- (id)progress
{
  return self->_progress;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_progress, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_done, 0);
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end