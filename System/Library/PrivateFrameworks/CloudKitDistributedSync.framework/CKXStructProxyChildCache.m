@interface CKXStructProxyChildCache
- (CKXStructProxyBase)proxy;
- (CKXStructProxyChildCache)initWithProxy:(id)a3;
- (id).cxx_construct;
- (id)structListProxyForListReference:(unint64_t)a3 mutable:(BOOL)a4;
- (id)structProxyForStructReference:(unint64_t)a3 mutable:(BOOL)a4;
- (void)reset;
@end

@implementation CKXStructProxyChildCache

- (CKXStructProxyChildCache)initWithProxy:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKXStructProxyChildCache;
  v5 = [(CKXStructProxyChildCache *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_proxy, v4);
  }

  return v6;
}

- (void)reset
{
  if (self->fieldToProxy.__table_.__p2_.__value_)
  {
    sub_1DD31621C((id *)self->fieldToProxy.__table_.__p1_.__value_.__next_);
    self->fieldToProxy.__table_.__p1_.__value_.__next_ = 0;
    unint64_t value = self->fieldToProxy.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (value)
    {
      for (uint64_t i = 0; i != value; ++i)
        self->fieldToProxy.__table_.__bucket_list_.__ptr_.__value_[i] = 0;
    }
    self->fieldToProxy.__table_.__p2_.__value_ = 0;
  }
}

- (id)structProxyForStructReference:(unint64_t)a3 mutable:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v23 = a3;
  p_fieldToProxy = (uint64_t *)&self->fieldToProxy;
  if (!sub_1DD31616C(&self->fieldToProxy.__table_.__bucket_list_.__ptr_.__value_, a3))
  {
    v10 = objc_msgSend_proxy(self, v8, v9);
    v15 = objc_msgSend_backingStore(v10, v11, v12);
    if (v10) {
      objc_msgSend_structInstance(v10, v13, v14);
    }
    else {
      memset(v22, 0, sizeof(v22));
    }
    uint64_t v16 = objc_msgSend_structProxyForStructReference_inStructInstance_mutable_(v15, v13, a3, v22, v4);

    v17 = sub_1DD316260(p_fieldToProxy, a3, &v23);
    v18 = (void *)v17[3];
    v17[3] = v16;
  }
  v19 = sub_1DD31616C(p_fieldToProxy, a3);
  if (!v19) {
    sub_1DD25B5D0("unordered_map::at: key not found");
  }
  v20 = (void *)v19[3];
  return v20;
}

- (id)structListProxyForListReference:(unint64_t)a3 mutable:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v23 = a3;
  p_fieldToProxy = (uint64_t *)&self->fieldToProxy;
  if (!sub_1DD31616C(&self->fieldToProxy.__table_.__bucket_list_.__ptr_.__value_, a3))
  {
    v10 = objc_msgSend_proxy(self, v8, v9);
    v15 = objc_msgSend_backingStore(v10, v11, v12);
    if (v10) {
      objc_msgSend_structInstance(v10, v13, v14);
    }
    else {
      memset(v22, 0, sizeof(v22));
    }
    uint64_t v16 = objc_msgSend_structListProxyForListReference_inStructInstance_mutable_(v15, v13, a3, v22, v4);

    v17 = sub_1DD316260(p_fieldToProxy, a3, &v23);
    v18 = (void *)v17[3];
    v17[3] = v16;
  }
  v19 = sub_1DD31616C(p_fieldToProxy, a3);
  if (!v19) {
    sub_1DD25B5D0("unordered_map::at: key not found");
  }
  v20 = (void *)v19[3];
  return v20;
}

- (CKXStructProxyBase)proxy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxy);
  return (CKXStructProxyBase *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_proxy);
  sub_1DD31621C((id *)self->fieldToProxy.__table_.__p1_.__value_.__next_);
  unint64_t value = self->fieldToProxy.__table_.__bucket_list_.__ptr_.__value_;
  self->fieldToProxy.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
  {
    operator delete(value);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  return self;
}

@end