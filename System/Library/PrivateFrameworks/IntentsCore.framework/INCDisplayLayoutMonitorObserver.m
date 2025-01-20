@interface INCDisplayLayoutMonitorObserver
+ (void)initialize;
- (id)handler;
- (void)setHandler:(id)a3;
- (void)updateDisplayLayout:(id)a3;
@end

@implementation INCDisplayLayoutMonitorObserver

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)updateDisplayLayout:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_handler)
  {
    v5 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[INCDisplayLayoutMonitorObserver updateDisplayLayout:]";
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_impl(&dword_1BC57D000, v5, OS_LOG_TYPE_INFO, "%s Layout changed to: %@", buf, 0x16u);
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v6 = objc_msgSend(v4, "elements", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      int v9 = 0;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v12, "_intents_isExpectedElement")) {
            v9 |= objc_msgSend(v12, "_intents_isSiri");
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    (*((void (**)(void))self->_handler + 2))();
  }
}

- (id)handler
{
  return self->_handler;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    INLogInitIfNeeded();
  }
}

@end