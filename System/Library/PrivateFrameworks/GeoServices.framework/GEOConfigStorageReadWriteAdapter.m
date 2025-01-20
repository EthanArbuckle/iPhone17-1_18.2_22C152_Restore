@interface GEOConfigStorageReadWriteAdapter
- (GEOConfigStorageReadWriteAdapter)initWithStorage:(id)a3;
- (id)getConfigValueForKey:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 source:(int64_t *)a6;
- (void)resync;
- (void)setConfigValue:(id)a3 forKey:(id)a4 options:(unint64_t)a5 synchronous:(BOOL)a6;
@end

@implementation GEOConfigStorageReadWriteAdapter

- (GEOConfigStorageReadWriteAdapter)initWithStorage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOConfigStorageReadWriteAdapter;
  v6 = [(GEOConfigStorageReadWriteAdapter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_storage, a3);
  }

  return v7;
}

- (void)resync
{
}

- (id)getConfigValueForKey:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 source:(int64_t *)a6
{
  return (id)[(GEOConfigStorageReadOnly *)self->_storage getConfigValueForKey:a3 countryCode:a4 options:a5 source:a6];
}

- (void)setConfigValue:(id)a3 forKey:(id)a4 options:(unint64_t)a5 synchronous:(BOOL)a6
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: __objc_no", v6, 2u);
  }
}

- (void).cxx_destruct
{
}

@end