@interface IMMomentSharePresentationCache
- (IMMomentSharePresentationCache)init;
- (IMMomentSharePresentationCache)initWithMomentShareCache:(id)a3;
- (IMMomentSharePresentationCacheDelegate)delegate;
- (id)statusPresentationForMomentShareURLString:(id)a3;
- (void)_momentShareCacheDidChange:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)registerMomentShareItemForMessage:(id)a3;
- (void)registerMomentShareURLString:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation IMMomentSharePresentationCache

- (IMMomentSharePresentationCache)init
{
}

- (IMMomentSharePresentationCache)initWithMomentShareCache:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IMMomentSharePresentationCache;
  v6 = [(IMMomentSharePresentationCache *)&v15 init];
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cache = v6->_cache;
    v6->_cache = v7;

    objc_storeStrong((id *)&v6->_momentShareCache, a3);
    v12 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v9, v10, v11);
    objc_msgSend_addObserver_selector_name_object_(v12, v13, (uint64_t)v6, (uint64_t)sel__momentShareCacheDidChange_, @"IMMomentShareCacheDidChangeNotification", v6->_momentShareCache);
  }
  return v6;
}

- (id)statusPresentationForMomentShareURLString:(id)a3
{
  id v4 = a3;
  objc_msgSend_registerMomentShareURLString_(self, v5, (uint64_t)v4, v6);
  v9 = objc_msgSend_objectForKeyedSubscript_(self->_cache, v7, (uint64_t)v4, v8);

  return v9;
}

- (void)registerMomentShareItemForMessage:(id)a3
{
  id v4 = IMCoreMomentShareURLForMessage(a3);
  if (v4)
  {
    id v14 = v4;
    uint64_t v8 = objc_msgSend_absoluteString(v4, v5, v6, v7);
    if (objc_msgSend_length(v8, v9, v10, v11)) {
      objc_msgSend_registerMomentShareURLString_(self, v12, (uint64_t)v8, v13);
    }

    id v4 = v14;
  }
}

- (void)registerMomentShareURLString:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(self->_cache, v5, (uint64_t)v4, v6);

  if (!v7)
  {
    momentShareCache = self->_momentShareCache;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1A4B9068C;
    v10[3] = &unk_1E5B7C768;
    v10[4] = self;
    id v11 = v4;
    objc_msgSend_momentShareForURLString_completionHandler_(momentShareCache, v9, (uint64_t)v11, (uint64_t)v10);
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 0x1400C) != 0 && qword_1E965BBB8 == (void)a5)
  {
    objc_msgSend_delegate(self, a2, (uint64_t)a3, a4, a5);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_momentSharePresentationCacheDidChange_(v9, v7, (uint64_t)self, v8);
  }
}

- (void)_momentShareCacheDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_userInfo(v4, v5, v6, v7);
  id v11 = objc_msgSend_objectForKeyedSubscript_(v8, v9, @"IMMomentShareCacheNotificationURLStringsUserInfoKey", v10);

  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  objc_super v15 = objc_msgSend_allKeys(self->_cache, v12, v13, v14);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1A4B90A6C;
  v25[3] = &unk_1E5B7C790;
  id v16 = v11;
  id v26 = v16;
  v27 = self;
  v28 = &v29;
  objc_msgSend_enumerateObjectsUsingBlock_(v15, v17, (uint64_t)v25, v18);

  if (*((unsigned char *)v30 + 24))
  {
    v22 = objc_msgSend_delegate(self, v19, v20, v21);
    objc_msgSend_momentSharePresentationCacheDidChange_(v22, v23, (uint64_t)self, v24);
  }
  _Block_object_dispose(&v29, 8);
}

- (IMMomentSharePresentationCacheDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IMMomentSharePresentationCacheDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_momentShareCache, 0);

  objc_storeStrong((id *)&self->_cache, 0);
}

@end