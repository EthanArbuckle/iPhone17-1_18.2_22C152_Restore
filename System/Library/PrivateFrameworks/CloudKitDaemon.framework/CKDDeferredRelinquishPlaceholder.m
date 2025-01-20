@interface CKDDeferredRelinquishPlaceholder
- (CKDDeferredRelinquishPlaceholder)initWithExistingWaiter:(id)a3;
- (NSString)description;
- (NSString)underlyingCKShortDescription;
- (id)ckShortDescription;
- (int64_t)qualityOfService;
@end

@implementation CKDDeferredRelinquishPlaceholder

- (CKDDeferredRelinquishPlaceholder)initWithExistingWaiter:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKDDeferredRelinquishPlaceholder;
  v7 = [(CKDDeferredRelinquishPlaceholder *)&v13 init];
  if (v7)
  {
    v7->_qualityOfService = objc_msgSend_qualityOfService(v4, v5, v6);
    uint64_t v10 = objc_msgSend_ckShortDescription(v4, v8, v9);
    underlyingCKShortDescription = v7->_underlyingCKShortDescription;
    v7->_underlyingCKShortDescription = (NSString *)v10;
  }
  return v7;
}

- (id)ckShortDescription
{
  v3 = NSString;
  id v4 = objc_msgSend_underlyingCKShortDescription(self, a2, v2);
  uint64_t v6 = objc_msgSend_stringWithFormat_(v3, v5, @"Deferred relinquish of %@", v4);

  return v6;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v8 = objc_msgSend_ckShortDescription(self, v6, v7);
  uint64_t v10 = objc_msgSend_stringWithFormat_(v3, v9, @"<%@: %p %@>", v5, self, v8);;

  return (NSString *)v10;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (NSString)underlyingCKShortDescription
{
  return self->_underlyingCKShortDescription;
}

- (void).cxx_destruct
{
}

@end