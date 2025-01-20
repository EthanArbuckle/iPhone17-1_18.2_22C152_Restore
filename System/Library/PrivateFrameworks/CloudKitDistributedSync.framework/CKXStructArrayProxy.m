@interface CKXStructArrayProxy
- (id)proxyAtIndex:(int64_t)a3;
- (int64_t)count;
- (void)enumerate:(id)a3;
@end

@implementation CKXStructArrayProxy

- (void)enumerate:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = objc_msgSend_count(self, v4, v5);
    uint64_t v10 = v7 - 1;
    if (v7 >= 1)
    {
      uint64_t v11 = 0;
      do
      {
        uint64_t v19 = 0;
        v20 = &v19;
        uint64_t v21 = 0x2020000000;
        char v22 = 0;
        v12 = objc_msgSend_backingStore(self, v8, v9);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = sub_1DD315998;
        v15[3] = &unk_1E6CBAE98;
        v15[4] = self;
        uint64_t v18 = v11;
        id v16 = v6;
        v17 = &v19;
        objc_msgSend_proxyScope_(v12, v13, (uint64_t)v15);

        LODWORD(v12) = *((unsigned __int8 *)v20 + 24);
        _Block_object_dispose(&v19, 8);
        if (v12) {
          break;
        }
      }
      while (v10 != v11++);
    }
  }
}

- (int64_t)count
{
  v4 = objc_msgSend_backingStore(self, a2, v2);
  id v6 = objc_msgSend_readerForProxy_(v4, v5, (uint64_t)self);
  objc_msgSend_listInstance(self, v7, v8);
  int64_t v10 = objc_msgSend_lengthForList_(v6, v9, (uint64_t)&v12);

  return v10;
}

- (id)proxyAtIndex:(int64_t)a3
{
  uint64_t v5 = objc_msgSend_backingStore(self, a2, a3);
  objc_msgSend_listInstance(self, v6, v7);
  uint64_t v9 = objc_msgSend_structProxyForListInstance_atIndex_(v5, v8, (uint64_t)&v11, a3);

  return v9;
}

@end