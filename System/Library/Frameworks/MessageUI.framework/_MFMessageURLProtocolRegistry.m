@interface _MFMessageURLProtocolRegistry
+ (id)sharedRegistry;
- (NSMapTable)storage;
- (_MFMessageURLProtocolRegistry)init;
- (id)contentRepresentationForURL:(id)a3;
- (void)registerContentRepresentation:(id)a3;
@end

@implementation _MFMessageURLProtocolRegistry

+ (id)sharedRegistry
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47___MFMessageURLProtocolRegistry_sharedRegistry__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRegistry_onceToken != -1) {
    dispatch_once(&sharedRegistry_onceToken, block);
  }
  v2 = (void *)sharedRegistry_instance;

  return v2;
}

- (_MFMessageURLProtocolRegistry)init
{
  v7.receiver = self;
  v7.super_class = (Class)_MFMessageURLProtocolRegistry;
  v2 = [(_MFMessageURLProtocolRegistry *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    storage = v3->_storage;
    v3->_storage = (NSMapTable *)v4;
  }
  return v3;
}

- (void)registerContentRepresentation:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 contentURL];
  if (v5)
  {
    os_unfair_lock_lock(&self->_lock);
    [(NSMapTable *)self->_storage setObject:v4 forKey:v5];
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v6 = +[MFMessageURLProtocol log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_super v7 = objc_msgSend(v4, "ef_publicDescription");
      [(_MFMessageURLProtocolRegistry *)v7 registerContentRepresentation:v6];
    }
  }
}

- (id)contentRepresentationForURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v6 = [(NSMapTable *)self->_storage objectForKey:v4];
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSMapTable)storage
{
  return self->_storage;
}

- (void).cxx_destruct
{
}

- (void)registerContentRepresentation:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1AF945000, log, OS_LOG_TYPE_ERROR, "unexpected attempt to register a content representation without an associated URL: %{public}@", buf, 0xCu);
}

@end