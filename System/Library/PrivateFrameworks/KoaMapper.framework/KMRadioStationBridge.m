@interface KMRadioStationBridge
+ (void)bootstrapListenerWithHandler:(id)a3;
- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4;
- (KMRadioStationBridge)init;
- (RadioListener)radioStore;
- (id)originAppId;
- (unsigned)cascadeItemType;
- (void)setRadioStore:(id)a3;
@end

@implementation KMRadioStationBridge

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_radioStore);
  objc_storeStrong((id *)&self->_builder, 0);
}

- (void)setRadioStore:(id)a3
{
}

- (RadioListener)radioStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_radioStore);
  return (RadioListener *)WeakRetained;
}

- (id)originAppId
{
  return (id)*MEMORY[0x263F51058];
}

- (unsigned)cascadeItemType
{
  return -16470;
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v5 = (uint64_t (**)(void))a4;
  v6 = +[CarPlayConnectionManager shared];
  v7 = [v6 radioStore];
  [(KMRadioStationBridge *)self setRadioStore:v7];

  v8 = [(KMRadioStationBridge *)self radioStore];
  v9 = [v8 radioStations];

  v10 = (void *)KMLogContextCore;
  if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_DEBUG))
  {
    v19 = v10;
    *(_DWORD *)buf = 136315394;
    v26 = "-[KMRadioStationBridge enumerateItemsWithError:usingBlock:]";
    __int16 v27 = 2048;
    uint64_t v28 = [v9 count];
    _os_log_debug_impl(&dword_22475B000, v19, OS_LOG_TYPE_DEBUG, "%s #radio: %li radio stations found for donation.", buf, 0x16u);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        if (!*(void *)(*((void *)&v20 + 1) + 8 * i) || (v5[2](v5) & 1) == 0)
        {
          v17 = KMLogContextCore;
          if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v26 = "-[KMRadioStationBridge enumerateItemsWithError:usingBlock:]";
            _os_log_error_impl(&dword_22475B000, v17, OS_LOG_TYPE_ERROR, "%s #radio: Could not donate while enumerating over station list", buf, 0xCu);
          }
          BOOL v16 = 0;
          goto LABEL_17;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      BOOL v16 = 1;
      if (v13) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v16 = 1;
  }
LABEL_17:

  return v16;
}

- (KMRadioStationBridge)init
{
  v7.receiver = self;
  v7.super_class = (Class)KMRadioStationBridge;
  v2 = [(KMRadioStationBridge *)&v7 init];
  if (v2)
  {
    v3 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x263F510C0]);
    builder = v2->_builder;
    v2->_builder = v3;

    v5 = v2;
  }

  return v2;
}

+ (void)bootstrapListenerWithHandler:(id)a3
{
  id v3 = a3;
  id v4 = +[CarPlayConnectionManager shared];
  [v4 registerUpdateHandler:v3];
}

@end