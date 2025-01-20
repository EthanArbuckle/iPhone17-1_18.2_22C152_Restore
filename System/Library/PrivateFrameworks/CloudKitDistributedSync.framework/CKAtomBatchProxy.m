@interface CKAtomBatchProxy
- (id)atoms;
@end

@implementation CKAtomBatchProxy

- (id)atoms
{
  v6 = objc_msgSend_backingStore(self, a2, v2);
  if (v6)
  {
    v7 = objc_msgSend_childProxyCache(self, v4, v5);
    objc_msgSend_binding(v6, v8, v9);
    v10 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_structListProxyForListReference_mutable_(v7, v11, v10[16], 0);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end