@interface MMCSSimpleFile
- (MMCSSimpleFile)init;
- (NSData)authResponseData;
- (NSData)fileHash;
- (NSData)signature;
- (NSError)mmcsError;
- (NSString)authToken;
- (NSString)guid;
- (NSString)localPath;
- (NSString)requestorID;
- (NSURL)requestURL;
- (double)progress;
- (id)description;
- (int)fd;
- (int64_t)encryptionBehavior;
- (unint64_t)itemID;
- (unint64_t)protocolFileSize;
- (void)dealloc;
- (void)setAuthResponseData:(id)a3;
- (void)setAuthToken:(id)a3;
- (void)setEncryptionBehavior:(int64_t)a3;
- (void)setFd:(int)a3;
- (void)setFileHash:(id)a3;
- (void)setGuid:(id)a3;
- (void)setItemID:(unint64_t)a3;
- (void)setLocalPath:(id)a3;
- (void)setMMCSError:(id)a3;
- (void)setProgress:(double)a3;
- (void)setProtocolFileSize:(unint64_t)a3;
- (void)setRequestURL:(id)a3;
- (void)setRequestorID:(id)a3;
- (void)setSignature:(id)a3;
@end

@implementation MMCSSimpleFile

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  return (id)objc_msgSend_stringWithFormat_(v3, v6, @"[%@: guid: %@  item id: %qx  path: %@  fd: %d token: %@   requestor ID: %@  request url: %@ signature: %@  progress: %f file size: %llu]", v7, v8, v5, self->_guid, self->_itemID, self->_localPath, self->_fd, self->_authToken, self->_requestorID, self->_requestURL, self->_signature, *(void *)&self->_progress, self->_protocolFileSize);
}

- (MMCSSimpleFile)init
{
  v12.receiver = self;
  v12.super_class = (Class)MMCSSimpleFile;
  v6 = [(MMCSSimpleFile *)&v12 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_stringGUID(NSString, v2, v3, v4, v5);
    objc_msgSend_setGuid_(v6, v8, v7, v9, v10);
  }
  return v6;
}

- (void)dealloc
{
  objc_msgSend_setLocalPath_(self, a2, 0, v2, v3);
  objc_msgSend_setRequestorID_(self, v5, 0, v6, v7);
  objc_msgSend_setRequestURL_(self, v8, 0, v9, v10);
  objc_msgSend_setFileHash_(self, v11, 0, v12, v13);
  objc_msgSend_setSignature_(self, v14, 0, v15, v16);
  objc_msgSend_setAuthToken_(self, v17, 0, v18, v19);
  objc_msgSend_setMMCSError_(self, v20, 0, v21, v22);

  v23.receiver = self;
  v23.super_class = (Class)MMCSSimpleFile;
  [(MMCSSimpleFile *)&v23 dealloc];
}

- (int)fd
{
  return self->_fd;
}

- (void)setFd:(int)a3
{
  self->_fd = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (NSString)authToken
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAuthToken:(id)a3
{
}

- (int64_t)encryptionBehavior
{
  return self->_encryptionBehavior;
}

- (void)setEncryptionBehavior:(int64_t)a3
{
  self->_encryptionBehavior = a3;
}

- (NSString)localPath
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLocalPath:(id)a3
{
}

- (NSURL)requestURL
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRequestURL:(id)a3
{
}

- (NSString)requestorID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRequestorID:(id)a3
{
}

- (NSString)guid
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setGuid:(id)a3
{
}

- (unint64_t)itemID
{
  return self->_itemID;
}

- (void)setItemID:(unint64_t)a3
{
  self->_itemID = a3;
}

- (NSData)signature
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSignature:(id)a3
{
}

- (NSData)fileHash
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFileHash:(id)a3
{
}

- (unint64_t)protocolFileSize
{
  return self->_protocolFileSize;
}

- (void)setProtocolFileSize:(unint64_t)a3
{
  self->_protocolFileSize = a3;
}

- (NSError)mmcsError
{
  return (NSError *)objc_getProperty(self, a2, 104, 1);
}

- (void)setMMCSError:(id)a3
{
}

- (NSData)authResponseData
{
  return (NSData *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAuthResponseData:(id)a3
{
}

@end