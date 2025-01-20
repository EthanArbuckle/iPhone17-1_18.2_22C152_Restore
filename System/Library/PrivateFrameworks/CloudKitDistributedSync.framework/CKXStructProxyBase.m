@interface CKXStructProxyBase
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)structInstance;
- (CKXStructProxyChildCache)childProxyCache;
- (id)dataForToken:(unint64_t)a3;
- (id)initInternal;
- (id)stringForToken:(unint64_t)a3;
- (void)associateWithStructInstance:(id *)a3;
- (void)copyBytes:(void *)a3 length:(unint64_t *)a4 isNull:(BOOL *)a5 forToken:(unint64_t)a6;
- (void)reset;
@end

@implementation CKXStructProxyBase

- (id)initInternal
{
  v8.receiver = self;
  v8.super_class = (Class)CKXStructProxyBase;
  v2 = [(CKXProxyBase *)&v8 initInternal];
  if (v2)
  {
    v3 = [CKXStructProxyChildCache alloc];
    uint64_t v5 = objc_msgSend_initWithProxy_(v3, v4, (uint64_t)v2);
    v6 = (void *)v2[4];
    v2[4] = v5;
  }
  return v2;
}

- (void)associateWithStructInstance:(id *)a3
{
  unint64_t var2 = a3->var2;
  *(_OWORD *)&self->_structInstance.structToken = *(_OWORD *)&a3->var0;
  self->_structInstance.offset = var2;
}

- (void)reset
{
  v5.receiver = self;
  v5.super_class = (Class)CKXStructProxyBase;
  [(CKXProxyBase *)&v5 reset];
  self->_structInstance.structToken = -1;
  objc_msgSend_reset(self->_childProxyCache, v3, v4);
}

- (void)copyBytes:(void *)a3 length:(unint64_t *)a4 isNull:(BOOL *)a5 forToken:(unint64_t)a6
{
  v11 = objc_msgSend_backingStore(self, a2, (uint64_t)a3);
  long long v34 = 0u;
  long long v35 = 0u;
  v13 = objc_msgSend_readerForProxy_(v11, v12, (uint64_t)self);
  objc_msgSend_structInstance(self, v14, v15);
  if (v13)
  {
    objc_msgSend_referencedListForReference_inStruct_(v13, v16, a6, v33);
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
  }

  v18 = objc_msgSend_readerForProxy_(v11, v17, (uint64_t)self);
  objc_msgSend_structInstance(self, v19, v20);
  char IsNull_inStruct = objc_msgSend_referenceIsNull_inStruct_(v18, v21, a6, v32);

  v24 = objc_msgSend_readerForProxy_(v11, v23, (uint64_t)self);
  v31[0] = v34;
  v31[1] = v35;
  unint64_t v26 = objc_msgSend_lengthForList_(v24, v25, (uint64_t)v31);

  v28 = objc_msgSend_readerForProxy_(v11, v27, (uint64_t)self);
  v30[0] = v34;
  v30[1] = v35;
  objc_msgSend_copyData_forList_(v28, v29, (uint64_t)a3, v30);

  if (a4) {
    *a4 = v26;
  }
  if (a5) {
    *a5 = IsNull_inStruct;
  }
}

- (id)dataForToken:(unint64_t)a3
{
  size_t count = 0;
  char v11 = 0;
  objc_msgSend_copyBytes_length_isNull_forToken_(self, a2, 0, &count, &v11, a3);
  objc_super v5 = 0;
  if (!v11)
  {
    v6 = malloc_type_calloc(count, 1uLL, 0x100004077774924uLL);
    objc_msgSend_copyBytes_length_isNull_forToken_(self, v7, (uint64_t)v6, 0, 0, a3);
    id v8 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    objc_super v5 = objc_msgSend_initWithBytesNoCopy_length_(v8, v9, (uint64_t)v6, count);
  }
  return v5;
}

- (id)stringForToken:(unint64_t)a3
{
  size_t count = 0;
  char v11 = 0;
  objc_msgSend_copyBytes_length_isNull_forToken_(self, a2, 0, &count, &v11, a3);
  objc_super v5 = 0;
  if (!v11)
  {
    v6 = malloc_type_calloc(count, 1uLL, 0x100004077774924uLL);
    objc_msgSend_copyBytes_length_isNull_forToken_(self, v7, (uint64_t)v6, 0, 0, a3);
    id v8 = [NSString alloc];
    objc_super v5 = objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v8, v9, (uint64_t)v6, count, 4, 1);
  }
  return v5;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)structInstance
{
  *($AD4A14DED6A629483A3530B31B20959D *)retstr = *($AD4A14DED6A629483A3530B31B20959D *)((char *)self + 40);
  return self;
}

- (CKXStructProxyChildCache)childProxyCache
{
  return self->_childProxyCache;
}

- (void).cxx_destruct
{
}

@end