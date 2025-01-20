@interface CKXStructArrayMutableProxy
- (BOOL)isMutable;
- (int64_t)count;
- (int64_t)index;
- (void)appendWithProxyBlock:(id)a3;
- (void)reset;
- (void)setIndex:(int64_t)a3;
@end

@implementation CKXStructArrayMutableProxy

- (BOOL)isMutable
{
  return 1;
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)CKXStructArrayMutableProxy;
  [(CKXArrayProxyBase *)&v3 reset];
  self->_index = -1;
}

- (int64_t)count
{
  return objc_msgSend_index(self, a2, v2) + 1;
}

- (void)appendWithProxyBlock:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v7 = objc_msgSend_backingStore(self, v4, v5);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1DD315CC0;
    v9[3] = &unk_1E6CBAEC0;
    v9[4] = self;
    id v10 = v6;
    objc_msgSend_proxyScope_(v7, v8, (uint64_t)v9);
  }
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

@end