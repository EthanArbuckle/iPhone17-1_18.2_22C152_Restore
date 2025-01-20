@interface AFClientLite
- (AFClientLite)init;
- (void)_handleCommand:(id)a3 afterCurrentRequest:(BOOL)a4 isOneWay:(BOOL)a5 commandHandler:(id)a6 completion:(id)a7;
- (void)dealloc;
- (void)handleCommand:(id)a3 afterCurrentRequest:(BOOL)a4 commandHandler:(id)a5 completion:(id)a6;
- (void)handleCommand:(id)a3 commandHandler:(id)a4 completion:(id)a5;
- (void)handleOneWayCommand:(id)a3 commandHandler:(id)a4 completion:(id)a5;
@end

@implementation AFClientLite

- (void).cxx_destruct
{
}

- (void)handleCommand:(id)a3 commandHandler:(id)a4 completion:(id)a5
{
}

- (void)handleOneWayCommand:(id)a3 commandHandler:(id)a4 completion:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315650;
    v13 = "-[AFClientLite handleOneWayCommand:commandHandler:completion:]";
    __int16 v14 = 2048;
    v15 = self;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_debug_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_DEBUG, "%s %p %@", (uint8_t *)&v12, 0x20u);
  }
  [(AFClientLite *)self _handleCommand:v8 afterCurrentRequest:1 isOneWay:1 commandHandler:v9 completion:v10];
}

- (void)handleCommand:(id)a3 afterCurrentRequest:(BOOL)a4 commandHandler:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 136315906;
    v15 = "-[AFClientLite handleCommand:afterCurrentRequest:commandHandler:completion:]";
    __int16 v16 = 2048;
    id v17 = self;
    __int16 v18 = 2112;
    id v19 = v10;
    __int16 v20 = 1024;
    BOOL v21 = v8;
    _os_log_debug_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_DEBUG, "%s %p %@ %d", (uint8_t *)&v14, 0x26u);
  }
  [(AFClientLite *)self _handleCommand:v10 afterCurrentRequest:v8 isOneWay:0 commandHandler:v11 completion:v12];
}

- (void)_handleCommand:(id)a3 afterCurrentRequest:(BOOL)a4 isOneWay:(BOOL)a5 commandHandler:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v15 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v16 = 136316162;
    id v17 = "-[AFClientLite _handleCommand:afterCurrentRequest:isOneWay:commandHandler:completion:]";
    __int16 v18 = 2048;
    id v19 = self;
    __int16 v20 = 2112;
    id v21 = v12;
    __int16 v22 = 1024;
    BOOL v23 = v10;
    __int16 v24 = 1024;
    BOOL v25 = v9;
    _os_log_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_INFO, "%s %p %@ %d %d", (uint8_t *)&v16, 0x2Cu);
  }
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[AFClientLite dealloc]";
    __int16 v7 = 2048;
    BOOL v8 = self;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)AFClientLite;
  [(AFClientLite *)&v4 dealloc];
}

- (AFClientLite)init
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)AFClientLite;
  v3 = [(AFClientLite *)&v18 init];
  if (v3)
  {
    if (v2 && (memset(&v19, 0, sizeof(v19)), dladdr(v2, &v19)))
    {
      if (v19.dli_fname && *v19.dli_fname)
      {
        id v4 = [NSString alloc];
        v5 = (void *)[v4 initWithUTF8String:v19.dli_fname];
      }
      else
      {
        v5 = 0;
      }
      if (v19.dli_sname && *v19.dli_sname)
      {
        id v7 = [NSString alloc];
        BOOL v8 = (void *)[v7 initWithUTF8String:v19.dli_sname];
      }
      else
      {
        BOOL v8 = 0;
      }
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __20__AFClientLite_init__block_invoke;
      v15[3] = &unk_1E592A130;
      id v16 = v5;
      id v17 = v8;
      id v9 = v8;
      id v10 = v5;
      v6 = +[AFCallSiteInfo newWithBuilder:v15];
    }
    else
    {
      v6 = 0;
    }
    initiationCallSiteInfo = v3->_initiationCallSiteInfo;
    v3->_initiationCallSiteInfo = v6;

    id v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      id v13 = v3->_initiationCallSiteInfo;
      LODWORD(v19.dli_fname) = 136315650;
      *(const char **)((char *)&v19.dli_fname + 4) = "-[AFClientLite init]";
      WORD2(v19.dli_fbase) = 2048;
      *(void **)((char *)&v19.dli_fbase + 6) = v3;
      HIWORD(v19.dli_sname) = 2112;
      v19.dli_saddr = v13;
      _os_log_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_INFO, "%s %p (Caller = %@)", (uint8_t *)&v19, 0x20u);
    }
  }
  return v3;
}

void __20__AFClientLite_init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setImagePath:v3];
  [v4 setSymbolName:*(void *)(a1 + 40)];
}

@end