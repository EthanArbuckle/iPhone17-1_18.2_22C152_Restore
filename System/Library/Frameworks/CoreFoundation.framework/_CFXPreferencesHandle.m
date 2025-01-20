@interface _CFXPreferencesHandle
- (_CFXPreferencesHandle)init;
- (id)copyPrefs;
- (void)dealloc;
- (void)setEUIDOverride:(unsigned int)a3;
@end

@implementation _CFXPreferencesHandle

- (id)copyPrefs
{
  uint64_t v19 = *(void *)off_1ECE0A5B0;
  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  int overrideEUID = self->overrideEUID;
  if (overrideEUID == -1) {
    int overrideEUID = _CFGetEUID();
  }
  prefs = self->prefs;
  if (prefs->_euid == overrideEUID)
  {
    v6 = self->prefs;
    prefs = 0;
  }
  else
  {
    v7 = objc_alloc_init(_CFXPreferences);
    self->prefs = v7;
    -[_CFXPreferences ingestVolatileStateFromPreferences:]((uint64_t)v7, (uint64_t)prefs);
    v8 = _CFPrefsClientLog();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    v6 = self->prefs;
    if (v9)
    {
      unsigned int euid = prefs->_euid;
      unsigned int v13 = v6->_euid;
      v14[0] = 67109634;
      v14[1] = euid;
      __int16 v15 = 1024;
      unsigned int v16 = v13;
      __int16 v17 = 2114;
      v18 = v6;
      _os_log_debug_impl(&dword_182B90000, v8, OS_LOG_TYPE_DEBUG, "Replacing preferences for EUID change: %u -> %u %{public}@", (uint8_t *)v14, 0x18u);
      v6 = self->prefs;
    }
  }
  v10 = v6;
  os_unfair_lock_unlock(p_lock);
  if (prefs) {

  }
  return v10;
}

- (_CFXPreferencesHandle)init
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  v4.receiver = self;
  v4.super_class = (Class)_CFXPreferencesHandle;
  v2 = [(_CFXPreferencesHandle *)&v4 init];
  if (v2)
  {
    v2->prefs = objc_alloc_init(_CFXPreferences);
    *(void *)&v2->lock._os_unfair_lock_opaque = 0xFFFFFFFF00000000;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;

  v3.receiver = self;
  v3.super_class = (Class)_CFXPreferencesHandle;
  [(_CFXPreferencesHandle *)&v3 dealloc];
}

- (void)setEUIDOverride:(unsigned int)a3
{
  self->int overrideEUID = a3;
}

@end