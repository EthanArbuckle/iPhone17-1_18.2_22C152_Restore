@interface GEOConfigLocalProxy
- (GEOConfigLocalProxy)init;
- (id)configExpiryForOptions:(unint64_t)a3;
- (id)configExpiryForSource:(int64_t)a3;
- (id)configStoreForOptions:(unint64_t)a3;
- (id)configStoreForSource:(int64_t)a3;
@end

@implementation GEOConfigLocalProxy

- (id)configExpiryForSource:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4 = 0;
  switch(a3)
  {
    case 0:
    case 1:
    case 5:
    case 9:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
        goto LABEL_10;
      }
      goto LABEL_3;
    case 2:
    case 7:
      v4 = _GEOConfigStorageExpiryUser();
      break;
    case 3:
    case 4:
      break;
    case 6:
    case 8:
      v4 = _GEOConfigStorageExpirySystem();
      break;
    default:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
LABEL_10:
        v6 = GEODefaultsSourceAsString(a3);
        int v7 = 138543362;
        v8 = v6;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: source == %{public}@", (uint8_t *)&v7, 0xCu);
      }
LABEL_3:
      v4 = 0;
      break;
  }

  return v4;
}

- (id)configExpiryForOptions:(unint64_t)a3
{
  unint64_t v3 = a3 & 0xFF0000;
  if ((a3 & 0xFF0000) < 0x40000)
  {
    if (v3 == 0x10000)
    {
      uint64_t v4 = 3;
      return [(GEOConfigLocalProxy *)self configExpiryForSource:v4];
    }
    if (v3 == 0x20000)
    {
      uint64_t v4 = 6;
      return [(GEOConfigLocalProxy *)self configExpiryForSource:v4];
    }
LABEL_13:
    uint64_t v4 = 0;
    return [(GEOConfigLocalProxy *)self configExpiryForSource:v4];
  }
  if ((a3 & 0xFF0000) == 0x40000)
  {
    uint64_t v4 = 7;
    return [(GEOConfigLocalProxy *)self configExpiryForSource:v4];
  }
  if (v3 == 0x80000)
  {
    uint64_t v4 = 8;
    return [(GEOConfigLocalProxy *)self configExpiryForSource:v4];
  }
  if (v3 != 983040) {
    goto LABEL_13;
  }
  uint64_t v4 = 2;
  return [(GEOConfigLocalProxy *)self configExpiryForSource:v4];
}

- (id)configStoreForSource:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  v5 = [(NSPointerArray *)self->_configStores pointerAtIndex:a3];
  os_unfair_recursive_lock_unlock();
  if (!v5)
  {
    os_unfair_recursive_lock_lock_with_options();
    uint64_t v6 = [(NSPointerArray *)self->_configStores pointerAtIndex:a3];
    if (v6)
    {
      v5 = (_GEOConfigStorageLocalHelper *)v6;
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
            v20 = GEODefaultsSourceAsString(a3);
            int v21 = 138543362;
            v22 = v20;
            _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: source == %{public}@", (uint8_t *)&v21, 0xCu);
          }
          v5 = 0;
          goto LABEL_20;
        case 2:
          v10 = [_GEOConfigStorageLocalHelper alloc];
          v8 = _GEOConfigStorageCFPrefsReadWrite();
          v11 = v10;
          uint64_t v12 = 2;
          goto LABEL_15;
        case 3:
        case 4:
          int v7 = [GEOConfigStorageReadWriteAdapter alloc];
          v8 = _GEOGetConfigStorageRemote();
          uint64_t v9 = [(GEOConfigStorageReadWriteAdapter *)v7 initWithStorage:v8];
          goto LABEL_16;
        case 6:
          v13 = [_GEOConfigStorageLocalHelper alloc];
          v8 = _GEOConfigStorageSystem();
          v14 = _GEOConfigStorageDirectSystemReadWrite();
          v15 = v13;
          uint64_t v16 = 6;
          goto LABEL_13;
        case 7:
          v17 = [_GEOConfigStorageLocalHelper alloc];
          v8 = _GEOConfigStorageUser();
          v14 = _GEOConfigStorageDirectUserReadWrite();
          v15 = v17;
          uint64_t v16 = 7;
LABEL_13:
          v5 = [(_GEOConfigStorageLocalHelper *)v15 initWithSource:v16 store:v8 directStore:v14];

          goto LABEL_17;
        case 8:
          v18 = [_GEOConfigStorageLocalHelper alloc];
          v8 = _GEOConfigStorageXPC();
          v11 = v18;
          uint64_t v12 = 8;
LABEL_15:
          uint64_t v9 = [(_GEOConfigStorageLocalHelper *)v11 initWithSource:v12 store:v8 directStore:0];
LABEL_16:
          v5 = (_GEOConfigStorageLocalHelper *)v9;
LABEL_17:

          break;
        default:
          v5 = 0;
          break;
      }
      [(NSPointerArray *)self->_configStores replacePointerAtIndex:a3 withPointer:v5];
    }
    os_unfair_recursive_lock_unlock();
  }
LABEL_20:

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
      return [(GEOConfigLocalProxy *)self configStoreForSource:v4];
    }
    if (v3 == 0x20000)
    {
      uint64_t v4 = 6;
      return [(GEOConfigLocalProxy *)self configStoreForSource:v4];
    }
LABEL_13:
    uint64_t v4 = 0;
    return [(GEOConfigLocalProxy *)self configStoreForSource:v4];
  }
  if ((a3 & 0xFF0000) == 0x40000)
  {
    uint64_t v4 = 7;
    return [(GEOConfigLocalProxy *)self configStoreForSource:v4];
  }
  if (v3 == 0x80000)
  {
    uint64_t v4 = 8;
    return [(GEOConfigLocalProxy *)self configStoreForSource:v4];
  }
  if (v3 != 983040) {
    goto LABEL_13;
  }
  uint64_t v4 = 2;
  return [(GEOConfigLocalProxy *)self configStoreForSource:v4];
}

- (GEOConfigLocalProxy)init
{
  v7.receiver = self;
  v7.super_class = (Class)GEOConfigLocalProxy;
  v2 = [(GEOConfigLocalProxy *)&v7 init];
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
}

@end