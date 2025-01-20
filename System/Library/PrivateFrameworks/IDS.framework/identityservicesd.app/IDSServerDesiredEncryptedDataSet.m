@interface IDSServerDesiredEncryptedDataSet
- (BOOL)isEqual:(id)a3;
- (BOOL)requireSignature;
- (IDSServerDesiredEncryptedDataSet)initWithEncryptedData:(id)a3 type:(int)a4 forPublicIdentity:(__SecKey *)a5 forParticipantID:(unint64_t)a6;
- (NSData)encryptedData;
- (NSString)description;
- (__SecKey)forPublicIdentity;
- (id)_wrapData:(id)a3 error:(id *)a4;
- (id)materialDataByID;
- (int)type;
- (unint64_t)forParticipantID;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation IDSServerDesiredEncryptedDataSet

- (IDSServerDesiredEncryptedDataSet)initWithEncryptedData:(id)a3 type:(int)a4 forPublicIdentity:(__SecKey *)a5 forParticipantID:(unint64_t)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IDSServerDesiredEncryptedDataSet;
  v12 = [(IDSServerDesiredEncryptedDataSet *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_encryptedData, a3);
    v13->_type = a4;
    CFRetain(a5);
    v13->_forPublicIdentity = a5;
    v13->_forParticipantID = a6;
    v13->_requireSignature = 1;
  }

  return v13;
}

- (void)dealloc
{
  CFRelease(self->_forPublicIdentity);
  v3.receiver = self;
  v3.super_class = (Class)IDSServerDesiredEncryptedDataSet;
  [(IDSServerDesiredEncryptedDataSet *)&v3 dealloc];
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"<%@: %p forParticipantID: %llu forPublicIdentity: %@ encryptedData: %@>", objc_opt_class(), self, self->_forParticipantID, self->_forPublicIdentity, self->_encryptedData];
}

- (unint64_t)hash
{
  unint64_t v2 = self->_forParticipantID ^ (unint64_t)self->_forPublicIdentity;
  return v2 ^ (unint64_t)[(NSData *)self->_encryptedData hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    v6 = [v5 encryptedData];
    BOOL v7 = v6 == self->_encryptedData
      && [v5 forPublicIdentity] == self->_forPublicIdentity
      && [v5 forParticipantID] == self->_forParticipantID;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_wrapData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = +[GFTKeyWrapping encrypt:v6 toKey:self->_forPublicIdentity error:a4];
  v8 = (void *)v7;
  if (a4 || !v7)
  {
    v9 = +[IDSFoundationLog ServerMaterialExchange];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      forPublicIdentity = self->_forPublicIdentity;
      unint64_t forParticipantID = self->_forParticipantID;
      id v13 = *a4;
      int v14 = 134218754;
      unint64_t v15 = forParticipantID;
      __int16 v16 = 2112;
      v17 = forPublicIdentity;
      __int16 v18 = 2112;
      id v19 = v13;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "_wrapData: Couldn't protect the data for _forParticipantID: %llu _forPublicIdentity: %@ (error: %@), data: %@", (uint8_t *)&v14, 0x2Au);
    }
  }

  return v8;
}

- (id)materialDataByID
{
  objc_super v3 = +[NSUUID UUID];
  id v4 = IDSGetUUIDDataFromNSUUID();

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  int v6 = IMGetDomainBoolForKey();
  encryptedData = self->_encryptedData;
  if (v6)
  {
    v8 = encryptedData;
    v9 = +[IDSFoundationLog ServerMaterialExchange];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "IDSServerDesiredEncryptedDataSet: disableEncryptionForData, use plain data: %@", buf, 0xCu);
    }

    goto LABEL_10;
  }
  id v23 = 0;
  v10 = [(IDSServerDesiredEncryptedDataSet *)self _wrapData:encryptedData error:&v23];
  id v11 = (NSData *)v23;
  if (!v11)
  {
    v8 = v10;
LABEL_10:
    int v14 = +[IDSFoundationLog ServerMaterialExchange];
    unint64_t v15 = v14;
    if (v8)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v16 = [(IDSServerDesiredEncryptedDataSet *)self forParticipantID];
        v17 = [(IDSServerDesiredEncryptedDataSet *)self forPublicIdentity];
        __int16 v18 = self->_encryptedData;
        *(_DWORD *)buf = 134218754;
        v25 = (NSData *)v16;
        __int16 v26 = 2112;
        v27 = v17;
        __int16 v28 = 2112;
        v29 = v18;
        __int16 v30 = 2112;
        v31 = v8;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "IDSServerDesiredEncryptedDataSet materialDataByID: encrypted the data for participantID: %llu, remote pub key: %@, data: %@, protectedData: %@", buf, 0x2Au);
      }

      CFMutableDictionaryRef v19 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      [(__CFDictionary *)v19 setObject:v8 forKeyedSubscript:IDSDSessionMessageRealTimeEncryptionEncryptedData];
      [(__CFDictionary *)v19 setObject:&off_1009D0F90 forKeyedSubscript:IDSDSessionMessageRealTimeEncryptionWrapModeKey];
      __int16 v20 = +[NSNumber numberWithUnsignedLongLong:self->_forParticipantID];
      [(__CFDictionary *)v19 setObject:v20 forKeyedSubscript:IDSRealTimeEncryptionParticipantID];

      id v21 = JWEncodeDictionary();
      [(__CFDictionary *)Mutable setObject:v21 forKeyedSubscript:v4];
      id v13 = Mutable;
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10070EBC0(v15);
      }
      id v13 = 0;
      v8 = (NSData *)v15;
    }
    goto LABEL_17;
  }
  v8 = v11;
  v12 = +[IDSFoundationLog ServerMaterialExchange];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_10070EC04((uint64_t)v8, v12);
  }

  id v13 = 0;
LABEL_17:

  return v13;
}

- (NSData)encryptedData
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

- (__SecKey)forPublicIdentity
{
  return self->_forPublicIdentity;
}

- (unint64_t)forParticipantID
{
  return self->_forParticipantID;
}

- (void).cxx_destruct
{
}

@end