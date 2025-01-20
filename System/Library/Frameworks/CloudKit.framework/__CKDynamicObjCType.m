@interface __CKDynamicObjCType
- (__CKDynamicObjCType)initWithCode:(int64_t)a3 encoding:(id)a4;
- (id)encoding;
@end

@implementation __CKDynamicObjCType

- (__CKDynamicObjCType)initWithCode:(int64_t)a3 encoding:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)__CKDynamicObjCType;
  v10 = [(CKObjCType *)&v14 initWithCode:a3];
  if (v10)
  {
    uint64_t v11 = objc_msgSend_copy(v6, v7, v8, v9);
    encoding = v10->_encoding;
    v10->_encoding = (NSString *)v11;
  }
  return v10;
}

- (id)encoding
{
  return self->_encoding;
}

- (void).cxx_destruct
{
}

@end