@interface CKDPCSIdentityWrapper
- (CKDPCSIdentityWrapper)initWithIdentitySet:(_PCSIdentitySetData *)a3 withPrimaryServiceName:(id)a4;
- (NSString)identityString;
- (NSString)primaryServiceName;
- (_PCSIdentitySetData)identitySet;
- (void)dealloc;
@end

@implementation CKDPCSIdentityWrapper

- (CKDPCSIdentityWrapper)initWithIdentitySet:(_PCSIdentitySetData *)a3 withPrimaryServiceName:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CKDPCSIdentityWrapper;
  v8 = [(CKDPCSIdentityWrapper *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_identitySet = a3;
    if (a3) {
      CFRetain(a3);
    }
    objc_storeStrong((id *)&v9->_primaryServiceName, a4);
  }

  return v9;
}

- (void)dealloc
{
  identitySet = self->_identitySet;
  if (identitySet)
  {
    CFRelease(identitySet);
    self->_identitySet = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CKDPCSIdentityWrapper;
  [(CKDPCSIdentityWrapper *)&v4 dealloc];
}

- (NSString)identityString
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_identityString)
  {
    v5 = objc_msgSend_primaryServiceName(v2, v3, v4);
    uint64_t v8 = objc_msgSend_identitySet(v2, v6, v7);
    uint64_t v9 = CKBasicStringForIdentitySet(v5, v8);
    identityString = v2->_identityString;
    v2->_identityString = (NSString *)v9;
  }
  objc_sync_exit(v2);

  objc_super v11 = v2->_identityString;
  return v11;
}

- (_PCSIdentitySetData)identitySet
{
  return self->_identitySet;
}

- (NSString)primaryServiceName
{
  return self->_primaryServiceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryServiceName, 0);
  objc_storeStrong((id *)&self->_identityString, 0);
}

@end