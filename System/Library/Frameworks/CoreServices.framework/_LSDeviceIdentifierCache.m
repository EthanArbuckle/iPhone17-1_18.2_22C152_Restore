@interface _LSDeviceIdentifierCache
- (BOOL)deviceUnlockedSinceBoot;
- (NSString)personaUniqueString;
- (OS_dispatch_queue)queue;
- (_LSDeviceIdentifierCache)initWithPersona:(id)a3;
- (id)allIdentifiersNotDispatched;
- (id)applyPerUserEntropyNotDispatched:(id)a3 type:(int64_t)a4;
- (id)deviceIdentifierVendorSeed;
- (id)extractUUIDForKey:(id)a3;
- (id)generateSomePerUserEntropyNotDispatched;
- (id)identifiersOfTypeNotDispatched:(int64_t)a3;
- (void)clearAllIdentifiersOfType:(int64_t)a3;
- (void)clearIdentifiersForUninstallationWithVendorName:(id)a3 bundleIdentifier:(id)a4;
- (void)generatePerUserEntropyIfNeededNotDispatched;
- (void)getIdentifierOfType:(int64_t)a3 vendorName:(id)a4 bundleIdentifier:(id)a5 completionHandler:(id)a6;
- (void)save;
@end

@implementation _LSDeviceIdentifierCache

- (void)getIdentifierOfType:(int64_t)a3 vendorName:(id)a4 bundleIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94___LSDeviceIdentifierCache_getIdentifierOfType_vendorName_bundleIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E522E898;
  id v18 = v10;
  id v19 = v11;
  id v21 = v12;
  int64_t v22 = a3;
  v20 = self;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(queue, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)identifiersOfTypeNotDispatched:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = [(_LSDeviceIdentifierCache *)self allIdentifiersNotDispatched];
  v5 = v4;
  if (v4 && (unint64_t)(a3 - 1) >= 2)
  {
    if (!a3)
    {
      v6 = [v4 objectForKeyedSubscript:@"LSVendors"];
      goto LABEL_9;
    }
    v7 = _LSDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = a3;
      _os_log_impl(&dword_182959000, v7, OS_LOG_TYPE_DEFAULT, "Failed to figure out string representation of identifier type %i", (uint8_t *)v9, 8u);
    }
  }
  v6 = 0;
LABEL_9:

  return v6;
}

- (id)applyPerUserEntropyNotDispatched:(id)a3 type:(int64_t)a4
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(_LSDeviceIdentifierCache *)self generatePerUserEntropyIfNeededNotDispatched];
  if (v6)
  {
    perUserEntropy = self->_perUserEntropy;
    v8 = v6;
    if (perUserEntropy)
    {
      v9 = [NSNumber numberWithInteger:a4];
      uint64_t v10 = [(NSDictionary *)perUserEntropy objectForKeyedSubscript:v9];
      uint64_t v11 = [v10 length];

      v8 = v6;
      if (v11)
      {
        v21[0] = 0;
        v21[1] = 0;
        [v6 getUUIDBytes:v21];
        id v12 = (void *)MEMORY[0x1E4F1CA58];
        v13 = self->_perUserEntropy;
        id v14 = [NSNumber numberWithInteger:a4];
        id v15 = [(NSDictionary *)v13 objectForKeyedSubscript:v14];
        id v16 = objc_msgSend(v12, "dataWithCapacity:", objc_msgSend(v15, "length") + 16);

        v8 = v6;
        if (v16)
        {
          [v16 appendBytes:v21 length:16];
          v17 = self->_perUserEntropy;
          id v18 = [NSNumber numberWithInteger:a4];
          id v19 = [(NSDictionary *)v17 objectForKeyedSubscript:v18];
          [v16 appendData:v19];

          v8 = objc_msgSend(MEMORY[0x1E4F29128], "_LS_UUIDWithData:digestType:", v16, 1);
        }
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)generatePerUserEntropyIfNeededNotDispatched
{
  v22[3] = *MEMORY[0x1E4F143B8];
  if (!self->_perUserEntropy && [(_LSDeviceIdentifierCache *)self deviceUnlockedSinceBoot])
  {
    if ([(id)__LSDefaultsGetSharedInstance() isInEducationMode])
    {
      v3 = _LSPerUserEntropyURL();
      if (v3)
      {
        v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v3];
        if (v4)
        {
          v5 = (void *)MEMORY[0x1E4F28DC0];
          id v6 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v7 = objc_opt_class();
          uint64_t v8 = objc_opt_class();
          v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
          uint64_t v10 = [v5 unarchivedObjectOfClasses:v9 fromData:v4 error:0];
          perUserEntropy = self->_perUserEntropy;
          self->_perUserEntropy = v10;
        }
        if (!self->_perUserEntropy)
        {
          id v12 = [(_LSDeviceIdentifierCache *)self generateSomePerUserEntropyNotDispatched];
          v13 = [(_LSDeviceIdentifierCache *)self generateSomePerUserEntropyNotDispatched];
          uint64_t v14 = [(_LSDeviceIdentifierCache *)self generateSomePerUserEntropyNotDispatched];
          id v15 = (void *)v14;
          if (v12 && v14)
          {
            v21[0] = &unk_1ECB43888;
            v21[1] = &unk_1ECB438A0;
            v22[0] = v12;
            v22[1] = v14;
            v21[2] = &unk_1ECB438B8;
            v22[2] = v13;
            id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
            v17 = self->_perUserEntropy;
            self->_perUserEntropy = v16;

            [(_LSDeviceIdentifierCache *)self save];
          }
          else
          {
            id v19 = _LSDefaultLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_182959000, v19, OS_LOG_TYPE_DEFAULT, "Failed to get per-user entropy for device identifiers. Will only have per-device identifiers.", buf, 2u);
            }
          }
        }
      }
      else
      {
        v4 = _LSDefaultLog();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_182959000, v4, OS_LOG_TYPE_DEFAULT, "Failed to get per-user entropy URL for device identifiers. Will only have per-device identifiers.", buf, 2u);
        }
      }
    }
    else
    {
      id v18 = self->_perUserEntropy;
      self->_perUserEntropy = (NSDictionary *)MEMORY[0x1E4F1CC08];
    }
  }
}

- (id)allIdentifiersNotDispatched
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (![(_LSDeviceIdentifierCache *)self deviceUnlockedSinceBoot])
  {
    _LSDefaultLog();
    v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_182959000, &v4->super, OS_LOG_TYPE_DEFAULT, "Identifiers file unavailable (not yet unlocked)", buf, 2u);
    }
    v3 = 0;
    goto LABEL_26;
  }
  v3 = self->_identifiers;
  if (v3) {
    goto LABEL_27;
  }
  v4 = self->_identifiersFileURL;
  if (v4)
  {
    v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4];
    if (v5)
    {
LABEL_5:
      id v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:1 format:0 error:0];
      identifiers = self->_identifiers;
      self->_identifiers = v6;

      uint64_t v8 = [(NSDictionary *)self->_identifiers objectForKeyedSubscript:@"LSVendors"];
      BOOL v9 = v8 == 0;

      if (v9)
      {
        uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
        [(NSDictionary *)self->_identifiers setObject:v10 forKeyedSubscript:@"LSVendors"];

        [(_LSDeviceIdentifierCache *)self save];
      }
      uint64_t v11 = [(_LSDeviceIdentifierCache *)self extractUUIDForKey:@"LSAdvertiserIdentifier"];
      advertiserIdentifier = self->_advertiserIdentifier;
      self->_advertiserIdentifier = v11;

      v13 = [(_LSDeviceIdentifierCache *)self extractUUIDForKey:@"LSVendorSeed"];
      vendorIdentifierSeed = self->_vendorIdentifierSeed;
      self->_vendorIdentifierSeed = v13;

      goto LABEL_21;
    }
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:@"/var/db/lsd/com.apple.lsdidentifiers.plist" isDirectory:0];
    id v16 = [MEMORY[0x1E4F28CB8] defaultManager];
    v17 = [v15 path];
    char v18 = [v16 fileExistsAtPath:v17];

    if (v18)
    {
      id v19 = _LSDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v15;
        _os_log_impl(&dword_182959000, v19, OS_LOG_TYPE_DEFAULT, "Identifiers file does not exist, attempting to read file from old location in %@", buf, 0xCu);
      }

      uint64_t v20 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v15];
      v5 = (void *)v20;
      if (!v20)
      {
        id v21 = _LSDefaultLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v33 = v15;
          _os_log_impl(&dword_182959000, v21, OS_LOG_TYPE_DEFAULT, "Invalid data found at %@", buf, 0xCu);
        }
      }
      int64_t v22 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v22 removeItemAtURL:v15 error:0];

      if (!v20) {
        goto LABEL_21;
      }
      goto LABEL_5;
    }
  }
LABEL_21:
  v23 = self->_identifiers;
  if (!v23)
  {
    v24 = _LSDefaultLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_182959000, v24, OS_LOG_TYPE_DEFAULT, "Creating identifiers table for the first time.", buf, 2u);
    }

    v25 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", @"LSVendors");
    v31 = v25;
    v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    v27 = (NSDictionary *)[v26 copy];
    v28 = self->_identifiers;
    self->_identifiers = v27;

    [(_LSDeviceIdentifierCache *)self save];
    v23 = self->_identifiers;
  }
  v3 = v23;
LABEL_26:

LABEL_27:

  return v3;
}

- (BOOL)deviceUnlockedSinceBoot
{
  return (int)softLinkMKBDeviceUnlockedSinceBoot() > 0;
}

- (_LSDeviceIdentifierCache)initWithPersona:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_LSDeviceIdentifierCache;
  id v6 = [(_LSDeviceIdentifierCache *)&v20 init];
  uint64_t v7 = v6;
  _LSAssertRunningInServer((uint64_t)"-[_LSDeviceIdentifierCache initWithPersona:]");
  if (v6)
  {
    objc_storeStrong((id *)&v6->_personaUniqueString, a3);
    identifiers = v6->_identifiers;
    v6->_identifiers = 0;

    advertiserIdentifier = v6->_advertiserIdentifier;
    v6->_advertiserIdentifier = 0;

    uint64_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.launchservices.deviceidentifiers", v10);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v11;

    if (v5 && [v5 length])
    {
      v13 = [(id)__LSDefaultsGetSharedInstance() identifiersFileURL];
      uint64_t v14 = [v13 URLByDeletingPathExtension];
      id v15 = [NSString stringWithFormat:@"%@.plist", v5];
      uint64_t v16 = [v14 URLByAppendingPathExtension:v15];
      identifiersFileURL = v7->_identifiersFileURL;
      v7->_identifiersFileURL = (NSURL *)v16;
    }
    else
    {
      uint64_t v18 = [(id)__LSDefaultsGetSharedInstance() identifiersFileURL];
      v13 = v6->_identifiersFileURL;
      v6->_identifiersFileURL = (NSURL *)v18;
    }
  }
  return v7;
}

- (void)clearIdentifiersForUninstallationWithVendorName:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93___LSDeviceIdentifierCache_clearIdentifiersForUninstallationWithVendorName_bundleIdentifier___block_invoke;
  block[3] = &unk_1E522DD38;
  id v12 = v6;
  id v13 = v7;
  uint64_t v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)clearAllIdentifiersOfType:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54___LSDeviceIdentifierCache_clearAllIdentifiersOfType___block_invoke;
  v4[3] = &unk_1E522BA28;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)save
{
  queue = self->_queue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32___LSDeviceIdentifierCache_save__block_invoke;
  v3[3] = &unk_1E522D3E8;
  v3[4] = self;
  _LSDispatchCoalescedAfterDelay((atomic_uchar *)&self->_saveFlag, queue, v3, 3.0);
}

- (NSString)personaUniqueString
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_identifiersFileURL, 0);
  objc_storeStrong((id *)&self->_perUserEntropy, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_vendorIdentifierSeed, 0);
  objc_storeStrong((id *)&self->_advertiserIdentifier, 0);

  objc_storeStrong((id *)&self->_identifiers, 0);
}

- (id)generateSomePerUserEntropyNotDispatched
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], 0x10uLL, bytes))
  {
    v2 = 0;
  }
  else
  {
    v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:bytes length:16];
  }

  return v2;
}

- (id)extractUUIDForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSDictionary *)self->_identifiers objectForKeyedSubscript:v4];
  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v5];
    [(NSDictionary *)self->_identifiers removeObjectForKey:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)deviceIdentifierVendorSeed
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  vendorIdentifierSeed = self->_vendorIdentifierSeed;
  if (!vendorIdentifierSeed)
  {
    id v4 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v5 = self->_vendorIdentifierSeed;
    self->_vendorIdentifierSeed = v4;

    id v6 = _LSDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = self->_vendorIdentifierSeed;
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_182959000, v6, OS_LOG_TYPE_INFO, "Generated vendor seed %@", (uint8_t *)&v9, 0xCu);
    }

    [(_LSDeviceIdentifierCache *)self save];
    vendorIdentifierSeed = self->_vendorIdentifierSeed;
  }

  return vendorIdentifierSeed;
}

@end