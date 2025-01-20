@interface GEOConfigRemoteProxy
- (GEOConfigRemoteProxy)init;
- (id)configExpiryForOptions:(unint64_t)a3;
- (id)configExpiryForSource:(int64_t)a3;
- (id)configStoreForOptions:(unint64_t)a3;
- (id)configStoreForSource:(int64_t)a3;
@end

@implementation GEOConfigRemoteProxy

- (id)configStoreForSource:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  v5 = [(NSPointerArray *)self->_configStores pointerAtIndex:a3];
  os_unfair_recursive_lock_unlock();
  if (!v5)
  {
    os_unfair_recursive_lock_lock_with_options();
    uint64_t v6 = [(NSPointerArray *)self->_configStores pointerAtIndex:a3];
    if (v6)
    {
      v5 = (GEOConfigStorageFallbackWriter *)v6;
    }
    else
    {
      switch(a3)
      {
        case 0:
        case 1:
        case 5:
        case 9:
          os_unfair_recursive_lock_unlock();
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
            v14 = GEODefaultsSourceAsString(a3);
            *(_DWORD *)buf = 138412290;
            v17 = v14;
            _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: source == %@", buf, 0xCu);
          }
          v5 = 0;
          goto LABEL_17;
        case 2:
          v10 = [GEOConfigStorageFallbackWriter alloc];
          v8 = _GEOConfigStorageCFPrefsReadOnly();
          v15 = v8;
          v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
          v12 = +[GEOConfigStorageClient shared];
          v5 = [(GEOConfigStorageFallbackWriter *)v10 initWithStorage:v11 writer:v12];

          goto LABEL_12;
        case 3:
        case 4:
          v7 = [GEOConfigStorageReadWriteAdapter alloc];
          v8 = _GEOGetConfigStorageRemote();
          v5 = [(GEOConfigStorageReadWriteAdapter *)v7 initWithStorage:v8];
LABEL_12:

          break;
        case 6:
        case 7:
          v9 = [[GEOConfigStorageCached alloc] initForSource:a3];
          goto LABEL_14;
        case 8:
          v9 = +[GEOConfigStorageClient shared];
LABEL_14:
          v5 = v9;
          break;
        default:
          v5 = 0;
          break;
      }
      [(NSPointerArray *)self->_configStores replacePointerAtIndex:a3 withPointer:v5];
    }
    os_unfair_recursive_lock_unlock();
  }
LABEL_17:

  return v5;
}

- (id)configStoreForOptions:(unint64_t)a3
{
  unint64_t v3 = a3 & 0xFF0000;
  if ((a3 & 0xFF0000) < 0x40000)
  {
    if (v3 == 0x10000)
    {
      uint64_t v4 = 3;
      return [(GEOConfigRemoteProxy *)self configStoreForSource:v4];
    }
    if (v3 == 0x20000)
    {
      uint64_t v4 = 6;
      return [(GEOConfigRemoteProxy *)self configStoreForSource:v4];
    }
LABEL_13:
    uint64_t v4 = 0;
    return [(GEOConfigRemoteProxy *)self configStoreForSource:v4];
  }
  if ((a3 & 0xFF0000) == 0x40000)
  {
    uint64_t v4 = 7;
    return [(GEOConfigRemoteProxy *)self configStoreForSource:v4];
  }
  if (v3 == 0x80000)
  {
    uint64_t v4 = 8;
    return [(GEOConfigRemoteProxy *)self configStoreForSource:v4];
  }
  if (v3 != 983040) {
    goto LABEL_13;
  }
  uint64_t v4 = 2;
  return [(GEOConfigRemoteProxy *)self configStoreForSource:v4];
}

- (id)configExpiryForSource:(int64_t)a3
{
  unint64_t v3 = 0;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 <= 9)
  {
    if (((1 << a3) & 0x223) != 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        v10 = GEODefaultsSourceAsString(a3);
        int v11 = 138412290;
        v12 = v10;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: source == %@", (uint8_t *)&v11, 0xCu);
      }
      unint64_t v3 = 0;
    }
    else
    {
      if (((1 << a3) & 0x84) != 0)
      {
        uint64_t v6 = 24;
      }
      else
      {
        if (((1 << a3) & 0x140) == 0) {
          goto LABEL_15;
        }
        uint64_t v6 = 32;
      }
      os_unfair_recursive_lock_lock_with_options();
      v7 = (objc_class *)*(id *)((char *)&self->super.isa + v6);
      os_unfair_recursive_lock_unlock();
      if (!v7)
      {
        os_unfair_recursive_lock_lock_with_options();
        v7 = (objc_class *)*(id *)((char *)&self->super.isa + v6);
        if (!v7)
        {
          v7 = (objc_class *)[[GEOConfigStorageExpiryCached alloc] initForSource:a3];
          v8 = *(Class *)((char *)&self->super.isa + v6);
          *(Class *)((char *)&self->super.isa + v6) = v7;
        }
        os_unfair_recursive_lock_unlock();
      }
      unint64_t v3 = v7;
    }
  }
LABEL_15:

  return v3;
}

- (id)configExpiryForOptions:(unint64_t)a3
{
  unint64_t v3 = a3 & 0xFF0000;
  if ((a3 & 0xFF0000) < 0x40000)
  {
    if (v3 == 0x10000)
    {
      uint64_t v4 = 3;
      return [(GEOConfigRemoteProxy *)self configExpiryForSource:v4];
    }
    if (v3 == 0x20000)
    {
      uint64_t v4 = 6;
      return [(GEOConfigRemoteProxy *)self configExpiryForSource:v4];
    }
LABEL_13:
    uint64_t v4 = 0;
    return [(GEOConfigRemoteProxy *)self configExpiryForSource:v4];
  }
  if ((a3 & 0xFF0000) == 0x40000)
  {
    uint64_t v4 = 7;
    return [(GEOConfigRemoteProxy *)self configExpiryForSource:v4];
  }
  if (v3 == 0x80000)
  {
    uint64_t v4 = 8;
    return [(GEOConfigRemoteProxy *)self configExpiryForSource:v4];
  }
  if (v3 != 983040) {
    goto LABEL_13;
  }
  uint64_t v4 = 2;
  return [(GEOConfigRemoteProxy *)self configExpiryForSource:v4];
}

- (GEOConfigRemoteProxy)init
{
  v7.receiver = self;
  v7.super_class = (Class)GEOConfigRemoteProxy;
  v2 = [(GEOConfigRemoteProxy *)&v7 init];
  unint64_t v3 = v2;
  if (v2)
  {
    v2->_lock = 0;
    uint64_t v4 = [MEMORY[0x1E4F28F50] strongObjectsPointerArray];
    configStores = v3->_configStores;
    v3->_configStores = (NSPointerArray *)v4;

    if ([(NSPointerArray *)v3->_configStores count] <= 8)
    {
      do
        [(NSPointerArray *)v3->_configStores addPointer:0];
      while ([(NSPointerArray *)v3->_configStores count] < 9);
    }
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirySystem, 0);
  objc_storeStrong((id *)&self->_expiryUser, 0);

  objc_storeStrong((id *)&self->_configStores, 0);
}

@end