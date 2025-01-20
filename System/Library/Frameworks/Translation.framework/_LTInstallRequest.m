@interface _LTInstallRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)useCellular;
- (NSArray)locales;
- (_LTInstallRequest)initWithCoder:(id)a3;
- (_LTInstallRequest)initWithLocales:(id)a3 useCellular:(BOOL)a4;
- (_LTInstallRequest)initWithLocales:(id)a3 useCellular:(BOOL)a4 delegate:(id)a5;
- (_LTInstallRequest)initWithLocales:(id)a3 useCellular:(BOOL)a4 progressHandler:(id)a5;
- (_LTSpeechTranslationDelegate)delegate;
- (id)completionHandler;
- (id)progressHandler;
- (void)_startInstallationWithService:(id)a3 done:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)languageInstallProgressed:(id)a3 error:(id)a4;
- (void)setCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLocales:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)setUseCellular:(BOOL)a3;
@end

@implementation _LTInstallRequest

- (_LTInstallRequest)initWithLocales:(id)a3 useCellular:(BOOL)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_LTInstallRequest;
  v8 = [(_LTInstallRequest *)&v13 init];
  if (v8)
  {
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.siri.translation.speechrequest", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v8->_locales, a3);
    v8->_useCellular = a4;
    v11 = v8;
  }

  return v8;
}

- (_LTInstallRequest)initWithLocales:(id)a3 useCellular:(BOOL)a4 progressHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  dispatch_queue_t v9 = [(_LTInstallRequest *)self initWithLocales:a3 useCellular:v5];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    id progressHandler = v9->_progressHandler;
    v9->_id progressHandler = (id)v10;

    v12 = v9;
  }

  return v9;
}

- (_LTInstallRequest)initWithLocales:(id)a3 useCellular:(BOOL)a4 delegate:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  dispatch_queue_t v9 = [(_LTInstallRequest *)self initWithLocales:a3 useCellular:v5];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    v11 = v10;
  }

  return v10;
}

- (_LTInstallRequest)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_LTInstallRequest;
  BOOL v5 = [(_LTInstallRequest *)&v12 init];
  if (v5)
  {
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
    id v7 = [MEMORY[0x263EFFA08] setWithArray:v6];
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"locales"];
    locales = v5->_locales;
    v5->_locales = (NSArray *)v8;

    v5->_useCellular = [v4 decodeBoolForKey:@"useCellular"];
    uint64_t v10 = v5;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  locales = self->_locales;
  id v5 = a3;
  [v5 encodeObject:locales forKey:@"locales"];
  [v5 encodeBool:self->_useCellular forKey:@"useCellular"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_startInstallationWithService:(id)a3 done:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _LTOSLogAssets();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_24639B000, v8, OS_LOG_TYPE_DEFAULT, "Start installation request with service", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56___LTInstallRequest__startInstallationWithService_done___block_invoke;
  block[3] = &unk_2651DB9F8;
  objc_copyWeak(&v15, buf);
  id v13 = v6;
  id v14 = v7;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(queue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(buf);
}

- (void)languageInstallProgressed:(id)a3 error:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained languageInstallProgressed:v10 error:v6];

  if (v10 && (id progressHandler = (void (**)(id, id, id))self->_progressHandler) != 0)
  {
    progressHandler[2](progressHandler, v10, v6);
  }
  else
  {
    completionHandler = (void (**)(id, id))self->_completionHandler;
    if (completionHandler) {
      completionHandler[2](completionHandler, v6);
    }
  }
}

- (NSArray)locales
{
  return self->_locales;
}

- (void)setLocales:(id)a3
{
}

- (BOOL)useCellular
{
  return self->_useCellular;
}

- (void)setUseCellular:(BOOL)a3
{
  self->_useCellular = a3;
}

- (_LTSpeechTranslationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_LTSpeechTranslationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_locales, 0);
  objc_storeStrong(&self->_done, 0);
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end