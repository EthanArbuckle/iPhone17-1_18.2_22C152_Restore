@interface IDSServerDesiredEncryptedDataBlobMaterialSet
- (BOOL)isEqual:(id)a3;
- (BOOL)requireSignature;
- (IDSServerDesiredEncryptedDataBlobMaterialSet)initWithEncryptedBlobData:(id)a3 type:(int)a4 requireSignature:(BOOL)a5;
- (NSData)encryptedDataBlob;
- (NSString)description;
- (id)materialDataByID;
- (int)type;
- (unint64_t)forParticipantID;
- (unint64_t)hash;
@end

@implementation IDSServerDesiredEncryptedDataBlobMaterialSet

- (IDSServerDesiredEncryptedDataBlobMaterialSet)initWithEncryptedBlobData:(id)a3 type:(int)a4 requireSignature:(BOOL)a5
{
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IDSServerDesiredEncryptedDataBlobMaterialSet;
  v10 = [(IDSServerDesiredEncryptedDataBlobMaterialSet *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_encryptedDataBlob, a3);
    v11->_type = a4;
    v11->_requireSignature = a5;
    v12 = v11;
  }

  return v11;
}

- (unint64_t)forParticipantID
{
  return 0;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  CFStringRef v4 = @"YES";
  if (!self->_requireSignature) {
    CFStringRef v4 = @"NO";
  }
  return +[NSString stringWithFormat:@"<%@: %p encryptedDataBlob:%@ type: %d, requireSignature:%@>", v3, self, self->_encryptedDataBlob, self->_type, v4];
}

- (unint64_t)hash
{
  return (unint64_t)[(NSData *)self->_encryptedDataBlob hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = (id *)v4;
    BOOL v6 = [v5[2] isEqualToData:self->_encryptedDataBlob]
      && *((_DWORD *)v5 + 3) == self->_type
      && *((unsigned __int8 *)v5 + 8) == self->_requireSignature;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)materialDataByID
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v4 = -[NSData subdataWithRange:](self->_encryptedDataBlob, "subdataWithRange:", 0, 16);
  [(__CFDictionary *)Mutable setObject:self->_encryptedDataBlob forKeyedSubscript:v4];
  v5 = +[IDSFoundationLog ServerMaterialExchange];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int type = self->_type;
    encryptedDataBlob = self->_encryptedDataBlob;
    int v9 = 138413058;
    v10 = v4;
    __int16 v11 = 1024;
    int v12 = type;
    __int16 v13 = 2112;
    objc_super v14 = encryptedDataBlob;
    __int16 v15 = 2112;
    CFMutableDictionaryRef v16 = Mutable;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "keyID: %@, type: %d, _encryptedDataBlob: %@, result: %@", (uint8_t *)&v9, 0x26u);
  }

  return Mutable;
}

- (NSData)encryptedDataBlob
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (int)type
{
  return self->_type;
}

- (BOOL)requireSignature
{
  return self->_requireSignature;
}

- (void).cxx_destruct
{
}

@end