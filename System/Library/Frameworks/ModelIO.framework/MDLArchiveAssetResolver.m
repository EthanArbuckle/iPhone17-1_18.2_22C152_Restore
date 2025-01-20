@interface MDLArchiveAssetResolver
- (BOOL)canResolveAssetNamed:(id)a3;
- (MDLArchiveAssetResolver)initWithURL:(id)a3;
- (NSData)data;
- (id)assetNamesInArchive;
- (id)resolveAssetNamed:(id)a3;
- (id)resolveInsideArchiveWithAssetNamed:(id)a3;
- (void)addResolvedAssetNamed:(id)a3 offset:(unint64_t)a4 fileSize:(unint64_t)a5;
- (void)removeAssetNamed:(id)a3;
- (void)setData:(id)a3;
@end

@implementation MDLArchiveAssetResolver

- (MDLArchiveAssetResolver)initWithURL:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MDLArchiveAssetResolver;
  v6 = [(MDLArchiveAssetResolver *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_archiveURL, a3);
    rootUSDPath = v7->_rootUSDPath;
    v7->_rootUSDPath = 0;

    uint64_t v9 = objc_opt_new();
    archiveDictionary = v7->_archiveDictionary;
    v7->_archiveDictionary = (NSMutableDictionary *)v9;

    v11 = v7;
  }

  return v7;
}

- (BOOL)canResolveAssetNamed:(id)a3
{
  v3 = objc_msgSend_objectForKey_(self->_archiveDictionary, a2, (uint64_t)a3);
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)addResolvedAssetNamed:(id)a3 offset:(unint64_t)a4 fileSize:(unint64_t)a5
{
  v18[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  v10 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v9, a4);
  v18[0] = v10;
  v12 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v11, a5);
  v18[1] = v12;
  v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v13, (uint64_t)v18, 2);

  v16 = objc_msgSend_objectForKey_(self->_archiveDictionary, v15, (uint64_t)v8);
  LODWORD(v10) = v16 == 0;

  if (v10) {
    objc_msgSend_setObject_forKeyedSubscript_(self->_archiveDictionary, v17, (uint64_t)v14, v8);
  }
}

- (id)resolveAssetNamed:(id)a3
{
  id v3 = a3;
  v6 = (char *)objc_msgSend_UTF8String(v3, v4, v5);
  sub_20B07F8E0(&v13, v6);
  pxrInternal__aapl__pxrReserved__::ArSplitPackageRelativePathOuter();
  long long v19 = *(_OWORD *)v15;
  uint64_t v20 = v16;
  v15[1] = 0;
  uint64_t v16 = 0;
  v15[0] = 0;
  if (v18 < 0)
  {
    operator delete(__p);
    if (SHIBYTE(v16) < 0) {
      operator delete(v15[0]);
    }
  }
  if (v14 < 0) {
    operator delete(v13);
  }
  id v8 = NSURL;
  if (v20 >= 0) {
    objc_msgSend_stringWithUTF8String_(NSString, v7, (uint64_t)&v19);
  }
  else {
  uint64_t v9 = objc_msgSend_stringWithUTF8String_(NSString, v7, v19);
  }
  v11 = objc_msgSend_fileURLWithPath_(v8, v10, (uint64_t)v9);

  if (SHIBYTE(v20) < 0) {
    operator delete((void *)v19);
  }

  return v11;
}

- (id)resolveInsideArchiveWithAssetNamed:(id)a3
{
  id v3 = objc_msgSend_objectForKey_(self->_archiveDictionary, a2, (uint64_t)a3);

  return v3;
}

- (id)assetNamesInArchive
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = sub_20B082E4C;
  v12 = sub_20B082E5C;
  id v13 = 0;
  id v13 = (id)objc_opt_new();
  archiveDictionary = self->_archiveDictionary;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_20B082E64;
  v7[3] = &unk_263FFD9D8;
  v7[4] = &v8;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(archiveDictionary, v4, (uint64_t)v7);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)removeAssetNamed:(id)a3
{
  id v7 = a3;
  id v5 = objc_msgSend_objectForKey_(self->_archiveDictionary, v4, (uint64_t)v7);

  if (v5) {
    objc_msgSend_removeObjectForKey_(self->_archiveDictionary, v6, (uint64_t)v7);
  }
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_rootUSDPath, 0);
  objc_storeStrong((id *)&self->_archiveDictionary, 0);

  objc_storeStrong((id *)&self->_archiveURL, 0);
}

@end