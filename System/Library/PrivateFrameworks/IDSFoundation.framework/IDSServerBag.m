@interface IDSServerBag
+ (id)_sharedCourierBag;
+ (id)_sharedIDSBag;
+ (id)sharedInstance;
+ (id)sharedInstanceForBagType:(int64_t)a3;
- (BOOL)allowSelfSignedCertificates;
- (BOOL)allowUnsignedBags;
- (BOOL)isInDebilitatedMode;
- (BOOL)isLoaded;
- (BOOL)isLoading;
- (BOOL)isServerAvailable;
- (BOOL)requiresIDSConnection;
- (BOOL)requiresIDSHost;
- (IDSServerBag)init;
- (IDSServerBag)initWithConfig:(id)a3 queue:(id)a4;
- (IDSServerBag)initWithConfig:(id)a3 queue:(id)a4 contentProvider:(id)a5;
- (IDSServerBagConfig)config;
- (IDSServerBagContentProvider)contentProvider;
- (IDSServerBagLoadedContents)loadedContents;
- (NSMutableDictionary)overrideValues;
- (NSString)apsEnvironmentName;
- (NSURL)bagURL;
- (OS_dispatch_queue)queue;
- (id)_overrideValues;
- (id)copyLoadedContents;
- (id)debugDescription;
- (id)description;
- (id)objectForKey:(id)a3;
- (id)objectForKey:(id)a3 ofClass:(Class)a4;
- (id)urlWithKey:(id)a3;
- (os_unfair_lock_s)contentsLock;
- (void)_clearOverrideValues;
- (void)_setOverrideValue:(id)a3 forKey:(id)a4;
- (void)forceBagLoad;
- (void)setConfig:(id)a3;
- (void)setContentProvider:(id)a3;
- (void)setContentsLock:(os_unfair_lock_s)a3;
- (void)setLoadedContents:(id)a3;
- (void)setOverrideValues:(id)a3;
- (void)setQueue:(id)a3;
- (void)startBagLoad;
@end

@implementation IDSServerBag

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v8 = objc_msgSend_config(self, v5, v6, v7);
  unint64_t v12 = objc_msgSend_bagType(v8, v9, v10, v11);
  v13 = _IDSServerBagTypeInternalString(v12);
  v16 = objc_msgSend_stringWithFormat_(v3, v14, @"<%@:%p %@>", v15, v4, self, v13);;

  return v16;
}

+ (id)sharedInstanceForBagType:(int64_t)a3
{
  if (a3 == 1) {
    objc_msgSend__sharedCourierBag(a1, a2, 1, v3);
  }
  else {
  uint64_t v4 = objc_msgSend__sharedIDSBag(a1, a2, a3, v3);
  }
  return v4;
}

+ (id)_sharedCourierBag
{
  if (qword_1EB2BB800 != -1) {
    dispatch_once(&qword_1EB2BB800, &unk_1EEFCD638);
  }
  v2 = (void *)qword_1EB2BB808;
  return v2;
}

+ (id)_sharedIDSBag
{
  if (qword_1EB2BB838 != -1) {
    dispatch_once(&qword_1EB2BB838, &unk_1EEFCE458);
  }
  v2 = (void *)qword_1EB2BB830;
  return v2;
}

- (IDSServerBag)initWithConfig:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [IDSServerBagInProcessContentProvider alloc];
  double v11 = objc_msgSend_initWithConfig_queue_(v8, v9, (uint64_t)v7, v10, v6);
  v14 = (IDSServerBag *)objc_msgSend_initWithConfig_queue_contentProvider_(self, v12, (uint64_t)v7, v13, v6, v11);

  return v14;
}

- (IDSServerBag)initWithConfig:(id)a3 queue:(id)a4 contentProvider:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v52.receiver = self;
  v52.super_class = (Class)IDSServerBag;
  unint64_t v12 = [(IDSServerBag *)&v52 init];
  double v13 = v12;
  if (v12)
  {
    v12->_contentsLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_queue, a4);
    objc_storeStrong((id *)&v13->_config, a3);
    objc_storeStrong((id *)&v13->_contentProvider, a5);
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v13);
    contentProvider = v13->_contentProvider;
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = sub_19DAA6948;
    v49[3] = &unk_1E5974930;
    objc_copyWeak(&v50, &location);
    objc_msgSend_setContentsUpdatedBlock_(contentProvider, v15, (uint64_t)v49, v16);
    os_unfair_lock_lock(&v13->_contentsLock);
    id v48 = 0;
    uint64_t v19 = objc_msgSend_currentLoadedContentsWithError_(v11, v17, (uint64_t)&v48, v18);
    id v20 = v48;
    loadedContents = v13->_loadedContents;
    v13->_loadedContents = (IDSServerBagLoadedContents *)v19;

    v25 = objc_msgSend_loadOverrideValuesIfPresent(v13->_contentProvider, v22, v23, v24);
    uint64_t v29 = objc_msgSend_mutableCopy(v25, v26, v27, v28);
    overrideValues = v13->_overrideValues;
    v13->_overrideValues = (NSMutableDictionary *)v29;

    v34 = objc_msgSend_dictionary(v13->_loadedContents, v31, v32, v33);
    uint64_t v38 = objc_msgSend_count(v34, v35, v36, v37);

    uint64_t v42 = objc_msgSend_count(v13->_overrideValues, v39, v40, v41);
    os_unfair_lock_unlock(&v13->_contentsLock);
    v46 = objc_msgSend_logCategory(v9, v43, v44, v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544386;
      v54 = v13;
      __int16 v55 = 2114;
      id v56 = v9;
      __int16 v57 = 2112;
      id v58 = v11;
      __int16 v59 = 2050;
      uint64_t v60 = v38;
      __int16 v61 = 2050;
      uint64_t v62 = v42;
      _os_log_impl(&dword_19D9BE000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@ created {config: %{public}@, contentProvider: %@, loadedContents.count: %{public}llu, overrideValues.count: %{public}llu}", buf, 0x34u);
    }

    objc_destroyWeak(&v50);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_contentsLock);
  if (CUTIsInternalInstall())
  {
    objc_msgSend_stringByAppendingString_(@"server-bag-", v5, (uint64_t)v4, v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v12 = objc_msgSend_sharedDefaults(MEMORY[0x1E4F6C408], v9, v10, v11);
    double v15 = objc_msgSend_appValueForKey_(v12, v13, (uint64_t)v8, v14);

    if (v15
      || objc_msgSend_count(self->_overrideValues, v16, v17, v18)
      && (objc_msgSend_objectForKey_(self->_overrideValues, v19, (uint64_t)v4, v20),
          (double v15 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      os_unfair_lock_unlock(&self->_contentsLock);
      goto LABEL_10;
    }
  }
  v21 = objc_msgSend_loadedContents(self, v5, v6, v7);
  v25 = objc_msgSend_dictionary(v21, v22, v23, v24);
  objc_msgSend_objectForKey_(v25, v26, (uint64_t)v4, v27);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_contentsLock);
  if (v8)
  {
    id v8 = v8;
    double v15 = v8;
  }
  else
  {
    v31 = objc_msgSend_config(self, v28, v29, v30);
    v35 = objc_msgSend_defaultBag(v31, v32, v33, v34);
    double v15 = objc_msgSend_objectForKey_(v35, v36, (uint64_t)v4, v37);
  }
LABEL_10:

  return v15;
}

- (IDSServerBagLoadedContents)loadedContents
{
  return self->_loadedContents;
}

- (IDSServerBagConfig)config
{
  return self->_config;
}

+ (id)sharedInstance
{
  return (id)objc_msgSend_sharedInstanceForBagType_(IDSServerBag, a2, 0, v2);
}

- (IDSServerBag)init
{
  v8.receiver = self;
  v8.super_class = (Class)IDSServerBag;
  id v4 = [(IDSServerBag *)&v8 init];
  if (v4)
  {
    uint64_t v6 = objc_msgSend_serverBag(MEMORY[0x1E4F6C3B8], v2, v3, v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_19DB7DE60(v6);
    }
  }
  return v4;
}

- (void)startBagLoad
{
  objc_msgSend_contentProvider(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)objc_msgSend_updateContentsIfPossibleShouldForce_(v7, v4, 0, v5);
}

- (void)forceBagLoad
{
  objc_msgSend_contentProvider(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)objc_msgSend_updateContentsIfPossibleShouldForce_(v7, v4, 1, v5);
}

- (BOOL)isLoading
{
  return objc_msgSend_isLoading(self->_contentProvider, a2, v2, v3);
}

- (BOOL)isLoaded
{
  return self->_loadedContents != 0;
}

- (BOOL)isInDebilitatedMode
{
  if (objc_msgSend_bagType(self->_config, a2, v2, v3)) {
    return 0;
  }
  objc_super v8 = objc_msgSend_objectForKey_(self, v5, @"vc-disaster-mode", v6);
  BOOL v7 = objc_msgSend_intValue(v8, v9, v10, v11) != 0;

  return v7;
}

- (BOOL)requiresIDSConnection
{
  id v4 = objc_msgSend_config(self, a2, v2, v3);
  char v8 = objc_msgSend_requiresIDSHost(v4, v5, v6, v7);

  return v8;
}

- (BOOL)requiresIDSHost
{
  id v4 = objc_msgSend_config(self, a2, v2, v3);
  char v8 = objc_msgSend_requiresIDSHost(v4, v5, v6, v7);

  return v8;
}

- (NSURL)bagURL
{
  id v4 = objc_msgSend_config(self, a2, v2, v3);
  char v8 = objc_msgSend_url(v4, v5, v6, v7);

  return (NSURL *)v8;
}

- (NSString)apsEnvironmentName
{
  id v4 = objc_msgSend_config(self, a2, v2, v3);
  char v8 = objc_msgSend_apsEnvironmentName(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (BOOL)allowSelfSignedCertificates
{
  return 0;
}

- (BOOL)allowUnsignedBags
{
  return 0;
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4
{
  Class v5 = a4;
  if (a4)
  {
    uint64_t v6 = objc_msgSend_objectForKey_(self, a2, (uint64_t)a3, v4);
    if (objc_opt_isKindOfClass()) {
      Class v5 = v6;
    }
    else {
      Class v5 = 0;
    }
  }
  return v5;
}

- (id)urlWithKey:(id)a3
{
  objc_msgSend_objectForKey_(self, a2, (uint64_t)a3, v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isServerAvailable(self, v6, v7, v8)) {
    objc_msgSend_startBagLoad(self, v9, v10, v11);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v15 = objc_msgSend_length(v5, v12, v13, v14);
    if (v15)
    {
      double v15 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v16, (uint64_t)v5, v17);
    }
  }
  else
  {
    double v15 = 0;
  }
  return v15;
}

- (void)_clearOverrideValues
{
  p_contentsLock = &self->_contentsLock;
  os_unfair_lock_lock(&self->_contentsLock);
  overrideValues = self->_overrideValues;
  self->_overrideValues = 0;

  os_unfair_lock_unlock(p_contentsLock);
  id v8 = (id)objc_msgSend_clearOverrideValues(self->_contentProvider, v5, v6, v7);
}

- (void)_setOverrideValue:(id)a3 forKey:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  uint64_t v10 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C360], v7, v8, v9);
  int isInternalInstall = objc_msgSend_isInternalInstall(v10, v11, v12, v13);

  if (isInternalInstall)
  {
    os_unfair_lock_lock(&self->_contentsLock);
    overrideValues = self->_overrideValues;
    if (!overrideValues)
    {
      double v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v19 = self->_overrideValues;
      self->_overrideValues = v18;

      overrideValues = self->_overrideValues;
    }
    objc_msgSend_setObject_forKey_(overrideValues, v15, (uint64_t)v23, v16, v6);
    os_unfair_lock_unlock(&self->_contentsLock);
    id v22 = (id)objc_msgSend_writeOverrideValues_(self->_contentProvider, v20, (uint64_t)self->_overrideValues, v21);
  }
}

- (id)_overrideValues
{
  p_contentsLock = &self->_contentsLock;
  os_unfair_lock_lock(&self->_contentsLock);
  double v7 = objc_msgSend_copy(self->_overrideValues, v4, v5, v6);
  os_unfair_lock_unlock(p_contentsLock);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v9 = v8;

  return v9;
}

- (id)copyLoadedContents
{
  p_contentsLock = &self->_contentsLock;
  os_unfair_lock_lock(&self->_contentsLock);
  double v7 = objc_msgSend_copy(self->_loadedContents, v4, v5, v6);
  os_unfair_lock_unlock(p_contentsLock);
  return v7;
}

- (BOOL)isServerAvailable
{
  return objc_msgSend_isServerAvailable(self->_contentProvider, a2, v2, v3);
}

- (id)debugDescription
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)objc_msgSend_stringWithFormat_(v3, v5, @"<%@:%p; config: %@; contentProvider: %@>",
               v6,
               v4,
               self,
               self->_config,
               self->_contentProvider);
}

- (void)setLoadedContents:(id)a3
{
}

- (NSMutableDictionary)overrideValues
{
  return self->_overrideValues;
}

- (void)setOverrideValues:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (os_unfair_lock_s)contentsLock
{
  return self->_contentsLock;
}

- (void)setContentsLock:(os_unfair_lock_s)a3
{
  self->_contentsLock = a3;
}

- (void)setConfig:(id)a3
{
}

- (IDSServerBagContentProvider)contentProvider
{
  return self->_contentProvider;
}

- (void)setContentProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProvider, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_overrideValues, 0);
  objc_storeStrong((id *)&self->_loadedContents, 0);
}

@end