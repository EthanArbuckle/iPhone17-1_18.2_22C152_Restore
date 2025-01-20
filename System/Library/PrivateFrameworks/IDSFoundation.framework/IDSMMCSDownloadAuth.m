@interface IDSMMCSDownloadAuth
- (IDSMMCSDownloadAuth)initWithDictionaryRepresentation:(id)a3;
- (IDSMMCSDownloadAuth)initWithSignature:(id)a3 authURL:(id)a4 ownerID:(id)a5;
- (NSData)signature;
- (NSDictionary)dictionaryRepresentation;
- (NSString)authURL;
- (NSString)ownerID;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation IDSMMCSDownloadAuth

- (IDSMMCSDownloadAuth)initWithSignature:(id)a3 authURL:(id)a4 ownerID:(id)a5
{
  v20[3] = *MEMORY[0x1E4F143B8];
  v19[0] = @"mS";
  v19[1] = @"mR";
  v20[0] = a3;
  v20[1] = a4;
  v19[2] = @"mO";
  v20[2] = a5;
  v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v8, v12, (uint64_t)v20, v13, v19, 3);

  v17 = (IDSMMCSDownloadAuth *)objc_msgSend_initWithDictionaryRepresentation_(self, v15, (uint64_t)v14, v16);
  return v17;
}

- (IDSMMCSDownloadAuth)initWithDictionaryRepresentation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSMMCSDownloadAuth;
  v6 = [(IDSMMCSDownloadAuth *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dictionaryRepresentation, a3);
  }

  return v7;
}

- (NSData)signature
{
  return (NSData *)objc_msgSend_objectForKey_(self->_dictionaryRepresentation, a2, @"mS", v2);
}

- (NSString)authURL
{
  return (NSString *)objc_msgSend_objectForKey_(self->_dictionaryRepresentation, a2, @"mR", v2);
}

- (NSString)ownerID
{
  return (NSString *)objc_msgSend_objectForKey_(self->_dictionaryRepresentation, a2, @"mO", v2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [IDSMMCSDownloadAuth alloc];
  v8 = objc_msgSend_copyWithZone_(self->_dictionaryRepresentation, v6, (uint64_t)a3, v7);
  id v11 = objc_msgSend_initWithDictionaryRepresentation_(v5, v9, (uint64_t)v8, v10);

  return v11;
}

- (NSDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (void).cxx_destruct
{
}

@end