@interface MUIBrandIndicatorProvider
+ (OS_os_log)log;
+ (OS_os_log)signpostLog;
- (EFScheduler)scheduler;
- (EMMessageRepository)messageRepository;
- (MUIBrandIndicatorProvider)initWithMessageRepository:(id)a3 svgConverter:(id)a4;
- (MUICachingSVGConverter)svgConverter;
- (id)brandIndicatorFutureForLocation:(id)a3;
- (id)brandIndicatorFutureForLocation:(id)a3 size:(CGSize)a4;
- (unint64_t)signpostID;
@end

@implementation MUIBrandIndicatorProvider

- (MUIBrandIndicatorProvider)initWithMessageRepository:(id)a3 svgConverter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MUIBrandIndicatorProvider;
  v9 = [(MUIBrandIndicatorProvider *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messageRepository, a3);
    objc_storeStrong((id *)&v10->_svgConverter, a4);
    uint64_t v11 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.mail.MUIBrandIndicatorProvider" qualityOfService:25];
    scheduler = v10->_scheduler;
    v10->_scheduler = (EFScheduler *)v11;
  }
  return v10;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__MUIBrandIndicatorProvider_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_6 != -1) {
    dispatch_once(&log_onceToken_6, block);
  }
  v2 = (void *)log_log_6;
  return (OS_os_log *)v2;
}

void __32__MUIBrandIndicatorProvider_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_6;
  log_log_6 = (uint64_t)v1;
}

+ (OS_os_log)signpostLog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__MUIBrandIndicatorProvider_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_0 != -1) {
    dispatch_once(&signpostLog_onceToken_0, block);
  }
  v2 = (void *)signpostLog_log_0;
  return (OS_os_log *)v2;
}

void __40__MUIBrandIndicatorProvider_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  v2 = (void *)signpostLog_log_0;
  signpostLog_log_0 = (uint64_t)v1;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (id)brandIndicatorFutureForLocation:(id)a3
{
  return -[MUIBrandIndicatorProvider brandIndicatorFutureForLocation:size:](self, "brandIndicatorFutureForLocation:size:", a3, 60.0, 60.0);
}

- (id)brandIndicatorFutureForLocation:(id)a3 size:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    id v8 = +[MUIBrandIndicatorProvider signpostLog];
    unint64_t v9 = [(MUIBrandIndicatorProvider *)self signpostID];
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        id v11 = v7;
        if ([MEMORY[0x1E4F602E0] preferenceEnabled:13])
        {
          v12 = [v11 absoluteString];
        }
        else
        {
          v17 = (void *)MEMORY[0x1E4F60E00];
          v18 = [v11 absoluteString];
          v12 = [v17 fullyRedactedStringForString:v18];
        }
        *(_DWORD *)buf = 138543362;
        v26 = v12;
        _os_signpost_emit_with_name_impl(&dword_1DDCDB000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "BIMI REQUEST", "Scheduling request for brand indicator url %{public}@", buf, 0xCu);
      }
    }

    v19 = (void *)MEMORY[0x1E4F60D70];
    v15 = [(MUIBrandIndicatorProvider *)self scheduler];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __66__MUIBrandIndicatorProvider_brandIndicatorFutureForLocation_size___block_invoke;
    v21[3] = &unk_1E6D12AD0;
    v21[4] = self;
    id v22 = v7;
    CGFloat v23 = width;
    CGFloat v24 = height;
    v16 = [v19 onScheduler:v15 lazyFutureWithBlock:v21];
  }
  else
  {
    v13 = +[MUIBrandIndicatorProvider log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MUIBrandIndicatorProvider brandIndicatorFutureForLocation:size:](v13);
    }

    objc_super v14 = (void *)MEMORY[0x1E4F60D70];
    v15 = [MEMORY[0x1E4F1CA98] null];
    v16 = [v14 futureWithResult:v15];
  }

  return v16;
}

id __66__MUIBrandIndicatorProvider_brandIndicatorFutureForLocation_size___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v4 = [*(id *)(a1 + 32) messageRepository];
  v5 = [v4 brandIndicatorForLocation:*(void *)(a1 + 40)];

  v6 = +[MUIBrandIndicatorProvider signpostLog];
  uint64_t v7 = [*(id *)(a1 + 32) signpostID];
  if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = v7;
    if (os_signpost_enabled(v6))
    {
      unint64_t v9 = (void *)MEMORY[0x1E4F602E0];
      id v10 = *(id *)(a1 + 40);
      if ([v9 preferenceEnabled:13])
      {
        id v11 = [v10 absoluteString];
      }
      else
      {
        v12 = (void *)MEMORY[0x1E4F60E00];
        uint64_t v13 = [v10 absoluteString];
        id v11 = [v12 fullyRedactedStringForString:v13];

        id v10 = (id)v13;
      }

      *(_DWORD *)buf = 138543362;
      v35 = v11;
      _os_signpost_emit_with_name_impl(&dword_1DDCDB000, v6, OS_SIGNPOST_EVENT, v8, "BIMI REQUEST", "Requesting brand indicator for url %{public}@", buf, 0xCu);
    }
  }

  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  v29 = __66__MUIBrandIndicatorProvider_brandIndicatorFutureForLocation_size___block_invoke_7;
  v30 = &unk_1E6D12AA8;
  id v14 = *(id *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 32);
  id v31 = v14;
  uint64_t v32 = v15;
  long long v33 = *(_OWORD *)(a1 + 48);
  v16 = [v5 then:&v27];
  v17 = objc_msgSend(v16, "result:", a2, v27, v28, v29, v30);

  v18 = +[MUIBrandIndicatorProvider signpostLog];
  uint64_t v19 = [*(id *)(a1 + 32) signpostID];
  if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v20 = v19;
    if (os_signpost_enabled(v18))
    {
      v21 = (void *)MEMORY[0x1E4F602E0];
      id v22 = *(id *)(a1 + 40);
      if ([v21 preferenceEnabled:13])
      {
        CGFloat v23 = [v22 absoluteString];
      }
      else
      {
        CGFloat v24 = (void *)MEMORY[0x1E4F60E00];
        uint64_t v25 = [v22 absoluteString];
        CGFloat v23 = [v24 fullyRedactedStringForString:v25];

        id v22 = (id)v25;
      }

      *(_DWORD *)buf = 138543362;
      v35 = v23;
      _os_signpost_emit_with_name_impl(&dword_1DDCDB000, v18, OS_SIGNPOST_INTERVAL_END, v20, "BIMI REQUEST", "Fetched brand indicator data for url %{public}@", buf, 0xCu);
    }
  }

  return v17;
}

id __66__MUIBrandIndicatorProvider_brandIndicatorFutureForLocation_size___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    os_signpost_id_t v4 = v3;
  }
  else {
    os_signpost_id_t v4 = 0;
  }
  id v5 = v4;
  if (v5)
  {
    v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v6 scale];
    double v8 = v7;

    unint64_t v9 = +[MUIBrandIndicatorProvider signpostLog];
    uint64_t v10 = [*(id *)(a1 + 40) signpostID];
    if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v11 = v10;
      if (os_signpost_enabled(v9))
      {
        v12 = (void *)MEMORY[0x1E4F602E0];
        id v13 = *(id *)(a1 + 32);
        if ([v12 preferenceEnabled:13])
        {
          id v14 = [v13 absoluteString];
        }
        else
        {
          uint64_t v19 = (void *)MEMORY[0x1E4F60E00];
          uint64_t v20 = [v13 absoluteString];
          id v14 = [v19 fullyRedactedStringForString:v20];

          id v13 = (id)v20;
        }

        *(_DWORD *)buf = 138543362;
        v29 = v14;
        _os_signpost_emit_with_name_impl(&dword_1DDCDB000, v9, OS_SIGNPOST_EVENT, v11, "BIMI REQUEST", "Generating image for url %{public}@", buf, 0xCu);
      }
    }

    id v21 = objc_alloc_init(MEMORY[0x1E4F60E18]);
    id v22 = [*(id *)(a1 + 40) svgConverter];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __66__MUIBrandIndicatorProvider_brandIndicatorFutureForLocation_size___block_invoke_11;
    v26[3] = &unk_1E6D12A80;
    id v27 = v21;
    double v23 = *(double *)(a1 + 48);
    double v24 = *(double *)(a1 + 56);
    id v17 = v21;
    objc_msgSend(v22, "imageForSVGData:size:scale:completionHandler:", v5, v26, v23, v24, v8);

    v18 = [v17 future];
  }
  else
  {
    uint64_t v15 = +[MUIBrandIndicatorProvider log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __66__MUIBrandIndicatorProvider_brandIndicatorFutureForLocation_size___block_invoke_7_cold_1(a1, v15);
    }

    v16 = (void *)MEMORY[0x1E4F60D70];
    id v17 = [MEMORY[0x1E4F1CA98] null];
    v18 = [v16 futureWithResult:v17];
  }

  return v18;
}

void __66__MUIBrandIndicatorProvider_brandIndicatorFutureForLocation_size___block_invoke_11(uint64_t a1, UIImage *image)
{
  uint64_t v3 = UIImagePNGRepresentation(image);
  os_signpost_id_t v4 = *(void **)(a1 + 32);
  id v6 = (id)v3;
  if (v3)
  {
    [v4 finishWithResult:v3];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
    [v4 finishWithResult:v5];
  }
}

- (EMMessageRepository)messageRepository
{
  return self->_messageRepository;
}

- (MUICachingSVGConverter)svgConverter
{
  return self->_svgConverter;
}

- (EFScheduler)scheduler
{
  return self->_scheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_svgConverter, 0);
  objc_storeStrong((id *)&self->_messageRepository, 0);
}

- (void)brandIndicatorFutureForLocation:(os_log_t)log size:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1DDCDB000, log, OS_LOG_TYPE_ERROR, "Missing brand indicator location. No BIMI image will be returned", v1, 2u);
}

void __66__MUIBrandIndicatorProvider_brandIndicatorFutureForLocation_size___block_invoke_7_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F602E0];
  id v4 = *(id *)(a1 + 32);
  if ([v3 preferenceEnabled:13])
  {
    id v5 = [v4 absoluteString];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F60E00];
    uint64_t v7 = [v4 absoluteString];
    id v5 = [v6 fullyRedactedStringForString:v7];

    id v4 = (id)v7;
  }

  int v8 = 138543362;
  unint64_t v9 = v5;
  _os_log_error_impl(&dword_1DDCDB000, a2, OS_LOG_TYPE_ERROR, "No data fetched for brand indicator url %{public}@", (uint8_t *)&v8, 0xCu);
}

@end