@interface CalGeocoder
+ (void)geocodeLocationString:(id)a3 withCompletionBlock:(id)a4;
- (CalGeocoder)initWithLocationString:(id)a3 andCompletionBlock:(id)a4;
- (MKLocalSearch)search;
- (NSString)locationString;
- (id)completionBlock;
- (void)_callCompletionBlockWithResult:(id)a3 error:(id)a4;
- (void)cancel;
- (void)dealloc;
- (void)setCompletionBlock:(id)a3;
- (void)setLocationString:(id)a3;
- (void)setSearch:(id)a3;
- (void)startGeocoding;
@end

@implementation CalGeocoder

- (CalGeocoder)initWithLocationString:(id)a3 andCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CalGeocoder;
  v8 = [(CalGeocoder *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(CalGeocoder *)v8 setLocationString:v6];
    [(CalGeocoder *)v9 setCompletionBlock:v7];
  }

  return v9;
}

- (void)dealloc
{
  [(CalGeocoder *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)CalGeocoder;
  [(CalGeocoder *)&v3 dealloc];
}

- (void)startGeocoding
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_190D88000, a2, OS_LOG_TYPE_ERROR, "URL location string given: [%@].  Will not geocode.", (uint8_t *)&v2, 0xCu);
}

void __29__CalGeocoder_startGeocoding__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    v8 = [v6 domain];
    v9 = EKWeakLinkStringConstant("MKErrorDomain", 0xFuLL);
    if ([v8 isEqualToString:v9])
    {
      uint64_t v10 = [v7 code];

      if (v10 == 4)
      {

        objc_super v11 = 0;
        id v7 = 0;
        goto LABEL_16;
      }
    }
    else
    {
    }
  }
  v12 = [v5 mapItems];
  uint64_t v13 = [v12 count];
  if (v13 == 1)
  {
    objc_super v11 = [v12 firstObject];
    v14 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __29__CalGeocoder_startGeocoding__block_invoke_cold_3(a1, (uint64_t)v11, v14);
    }
  }
  else
  {
    if (v13)
    {
      v14 = +[CalFoundationLogSubsystem defaultCategory];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __29__CalGeocoder_startGeocoding__block_invoke_cold_1(v12, v14);
      }
    }
    else
    {
      v14 = +[CalFoundationLogSubsystem defaultCategory];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __29__CalGeocoder_startGeocoding__block_invoke_cold_2(a1, v14);
      }
    }
    objc_super v11 = 0;
  }

LABEL_16:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _callCompletionBlockWithResult:v11 error:v7];
}

- (void)cancel
{
  uint64_t v3 = [(CalGeocoder *)self search];
  [v3 cancel];

  [(CalGeocoder *)self setSearch:0];
}

+ (void)geocodeLocationString:(id)a3 withCompletionBlock:(id)a4
{
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __57__CalGeocoder_geocodeLocationString_withCompletionBlock___block_invoke;
  v17 = &unk_1E56CE468;
  id v18 = v8;
  id v19 = v5;
  id v9 = v8;
  id v10 = v5;
  objc_super v11 = (void *)MEMORY[0x192FD8850](&v14);
  id v12 = objc_alloc((Class)objc_opt_class());
  uint64_t v13 = objc_msgSend(v12, "initWithLocationString:andCompletionBlock:", v7, v11, v14, v15, v16, v17);

  [v9 addObject:v13];
  [v13 startGeocoding];
}

uint64_t __57__CalGeocoder_geocodeLocationString_withCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 removeAllObjects];
}

- (void)_callCompletionBlockWithResult:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(CalGeocoder *)self completionBlock];

  if (v7)
  {
    id v8 = [(CalGeocoder *)self completionBlock];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);

    [(CalGeocoder *)self setCompletionBlock:0];
  }
}

- (NSString)locationString
{
  return self->_locationString;
}

- (void)setLocationString:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (MKLocalSearch)search
{
  return self->_search;
}

- (void)setSearch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_search, 0);
  objc_storeStrong(&self->_completionBlock, 0);

  objc_storeStrong((id *)&self->_locationString, 0);
}

void __29__CalGeocoder_startGeocoding__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = 134218242;
  uint64_t v5 = [a1 count];
  __int16 v6 = 2112;
  id v7 = a1;
  _os_log_error_impl(&dword_190D88000, a2, OS_LOG_TYPE_ERROR, "Expected 0 or 1 geocoding results.  Got %lu.  Map items: [%@]", (uint8_t *)&v4, 0x16u);
}

void __29__CalGeocoder_startGeocoding__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_190D88000, a2, OS_LOG_TYPE_DEBUG, "No geocoding results found for location string: [%@]", (uint8_t *)&v3, 0xCu);
}

void __29__CalGeocoder_startGeocoding__block_invoke_cold_3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_190D88000, log, OS_LOG_TYPE_DEBUG, "Found one result for location string: [%@].  Result: [%@]", (uint8_t *)&v4, 0x16u);
}

@end