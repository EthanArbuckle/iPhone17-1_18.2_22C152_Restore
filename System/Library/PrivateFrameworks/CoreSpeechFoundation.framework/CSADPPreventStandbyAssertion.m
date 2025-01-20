@interface CSADPPreventStandbyAssertion
- (ADPAssertion)adpAssertion;
- (CSADPPreventStandbyAssertion)initWithName:(id)a3 clientQueue:(id)a4;
- (NSString)name;
- (OS_dispatch_queue)clientQueue;
- (void)_setupADPAssertion:(id)a3;
- (void)dealloc;
- (void)setAdpAssertion:(ADPAssertion *)a3;
- (void)setClientQueue:(id)a3;
- (void)setName:(id)a3;
@end

@implementation CSADPPreventStandbyAssertion

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_clientQueue);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setClientQueue:(id)a3
{
}

- (OS_dispatch_queue)clientQueue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientQueue);
  return (OS_dispatch_queue *)WeakRetained;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setAdpAssertion:(ADPAssertion *)a3
{
  self->_adpAssertion = a3;
}

- (ADPAssertion)adpAssertion
{
  return self->_adpAssertion;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_adpAssertion)
  {
    ADPAssertionDestroy();
    self->_adpAssertion = 0;
  }
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CSADPPreventStandbyAssertion dealloc]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Destroyed ADP assertion for darwinOS", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSADPPreventStandbyAssertion;
  [(CSADPPreventStandbyAssertion *)&v4 dealloc];
}

- (void)_setupADPAssertion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_adpAssertion)
  {
    ADPAssertionDestroy();
    self->_adpAssertion = 0;
  }
  self->_adpAssertion = (ADPAssertion *)ADPAssertionCreateWithDispatchQueue();
  objc_initWeak(&location, self);
  objc_copyWeak(&v7, &location);
  id v5 = v4;
  ADPAssertionSetCancelHandler();
  v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[CSADPPreventStandbyAssertion _setupADPAssertion:]";
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Taking ADP assertion %{public}@ for darwinOS", buf, 0x16u);
  }

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __51__CSADPPreventStandbyAssertion__setupADPAssertion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained clientQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__CSADPPreventStandbyAssertion__setupADPAssertion___block_invoke_2;
  v5[3] = &unk_1E6201030;
  id v6 = *(id *)(a1 + 32);
  id v7 = WeakRetained;
  id v4 = WeakRetained;
  dispatch_async(v3, v5);
}

uint64_t __51__CSADPPreventStandbyAssertion__setupADPAssertion___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "-[CSADPPreventStandbyAssertion _setupADPAssertion:]_block_invoke_2";
    __int16 v7 = 2114;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s appledisplayplatformd is lost, reset ADP assertion for %{public}@", (uint8_t *)&v5, 0x16u);
  }
  return [*(id *)(a1 + 40) _setupADPAssertion:*(void *)(a1 + 32)];
}

- (CSADPPreventStandbyAssertion)initWithName:(id)a3 clientQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (+[CSUtils deviceRequirePreventStandbyAssertion])
  {
    v13.receiver = self;
    v13.super_class = (Class)CSADPPreventStandbyAssertion;
    uint64_t v9 = [(CSADPPreventStandbyAssertion *)&v13 init];
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_name, a3);
      objc_storeWeak(p_isa + 3, v8);
      [p_isa _setupADPAssertion:v7];
    }
    self = p_isa;
    __int16 v11 = self;
  }
  else
  {
    __int16 v11 = 0;
  }

  return v11;
}

@end