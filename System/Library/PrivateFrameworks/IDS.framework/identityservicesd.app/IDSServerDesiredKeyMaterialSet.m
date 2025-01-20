@interface IDSServerDesiredKeyMaterialSet
- (BOOL)isEqual:(id)a3;
- (BOOL)requireSignature;
- (IDSServerDesiredKeyMaterialSet)initWithKMs:(id)a3 type:(int)a4 forPublicIdentity:(__SecKey *)a5 forParticipantID:(unint64_t)a6;
- (NSArray)kms;
- (NSString)description;
- (__SecKey)forPublicIdentity;
- (id)materialDataByID;
- (id)wrapMaterial:(id)a3 error:(id *)a4;
- (int)type;
- (unint64_t)forParticipantID;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation IDSServerDesiredKeyMaterialSet

- (IDSServerDesiredKeyMaterialSet)initWithKMs:(id)a3 type:(int)a4 forPublicIdentity:(__SecKey *)a5 forParticipantID:(unint64_t)a6
{
  id v11 = a3;
  v28.receiver = self;
  v28.super_class = (Class)IDSServerDesiredKeyMaterialSet;
  v12 = [(IDSServerDesiredKeyMaterialSet *)&v28 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_kms, a3);
    v13->_type = a4;
    if (a5) {
      CFRetain(a5);
    }
    v13->_forPublicIdentity = a5;
    v13->_forParticipantID = a6;
    v13->_requireSignature = 1;
    unint64_t v14 = [(IDSServerDesiredKeyMaterialSet *)v13 forParticipantID];
    unint64_t v15 = v14 ^ (unint64_t)[(IDSServerDesiredKeyMaterialSet *)v13 forPublicIdentity];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v16 = [(IDSServerDesiredKeyMaterialSet *)v13 kms];
    id v17 = [v16 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v25;
      do
      {
        v20 = 0;
        do
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v24 + 1) + 8 * (void)v20) keyIndex];
          v15 ^= (unint64_t)[v21 hash];

          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        id v18 = [v16 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v18);
    }

    v13->_hash = v15;
    v22 = v13;
  }

  return v13;
}

- (void)dealloc
{
  forPublicIdentity = self->_forPublicIdentity;
  if (forPublicIdentity)
  {
    CFRelease(forPublicIdentity);
    self->_forPublicIdentity = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)IDSServerDesiredKeyMaterialSet;
  [(IDSServerDesiredKeyMaterialSet *)&v4 dealloc];
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"<%@: %p forParticipantID:%llu forPublicIdentity:%@ materials:%@ hash:%llu>", objc_opt_class(), self, self->_forParticipantID, self->_forPublicIdentity, self->_kms, self->_hash];
}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    v6 = [v5 kms];
    BOOL v7 = [v6 isEqualToArray:self->_kms]
      && [v5 forPublicIdentity] == self->_forPublicIdentity
      && [v5 forParticipantID] == self->_forParticipantID;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)wrapMaterial:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = +[IDSFoundationLog ServerMaterialExchange];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "IDSServerDesiredKeyMaterialSet wrapMaterialOrError", v11, 2u);
  }

  v8 = [v6 keyMaterial];

  v9 = +[GFTKeyWrapping wrapSeed:v8 to:self->_forPublicIdentity legacy:0 error:a4];

  return v9;
}

- (id)materialDataByID
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v4 = [(IDSServerDesiredKeyMaterialSet *)self kms];
  id v5 = [v4 countByEnumeratingWithState:&v55 objects:v65 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v56;
    uint64_t v46 = IDSRealTimeEncryptionSKI;
    uint64_t v45 = IDSRealTimeEncryptionSKM;
    uint64_t v44 = IDSRealTimeEncryptionSKS;
    uint64_t v43 = IDSRealTimeEncryptionSKGC;
    uint64_t v42 = IDSRealTimeEncryptionMKI;
    uint64_t v41 = IDSRealTimeEncryptionMKM;
    uint64_t v40 = IDSRealTimeEncryptionMKS;
    uint64_t v39 = IDSRealTimeEncryptionMKGC;
    uint64_t v49 = IDSDSessionMessageRealTimeEncryptionWrapModeKey;
    uint64_t v48 = IDSRealTimeEncryptionParticipantID;
    do
    {
      v8 = 0;
      id v47 = v6;
      do
      {
        if (*(void *)v56 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v55 + 1) + 8 * (void)v8);
        id v54 = 0;
        v10 = -[IDSServerDesiredKeyMaterialSet wrapMaterial:error:](self, "wrapMaterial:error:", v9, &v54, v39);
        id v11 = v54;
        v12 = +[IDSFoundationLog ServerMaterialExchange];
        v13 = v12;
        if (v11) {
          BOOL v14 = 1;
        }
        else {
          BOOL v14 = v10 == 0;
        }
        if (!v14)
        {
          id v51 = v11;
          v53 = v10;
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v19 = [(IDSServerDesiredKeyMaterialSet *)self forParticipantID];
            v20 = [(IDSServerDesiredKeyMaterialSet *)self forPublicIdentity];
            [v9 keyIndex];
            uint64_t v21 = v7;
            v22 = self;
            v23 = v4;
            v25 = long long v24 = Mutable;
            *(_DWORD *)buf = 134218498;
            unint64_t v60 = v19;
            __int16 v61 = 2112;
            v62 = v20;
            __int16 v63 = 2112;
            v64 = v25;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "IDSServerDesiredKeyMaterialSet materialDataByID: encrypted the key material for participantID: %llu, remote pub key: %@, mki: %@", buf, 0x20u);

            CFMutableDictionaryRef Mutable = v24;
            id v4 = v23;
            self = v22;
            uint64_t v7 = v21;
            id v6 = v47;
          }

          long long v26 = [v9 keyIndex];
          v13 = IDSGetUUIDDataFromNSUUID();

          CFMutableDictionaryRef v27 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          CFMutableDictionaryRef v28 = v27;
          int type = self->_type;
          if (type == 14)
          {
            [(__CFDictionary *)v27 setObject:v13 forKeyedSubscript:v46];
            [(__CFDictionary *)v28 setObject:v53 forKeyedSubscript:v45];
            v35 = [v9 keySalt];
            [(__CFDictionary *)v28 setObject:v35 forKeyedSubscript:v44];

            v31 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v9 generationCounter]);
            CFMutableDictionaryRef v32 = v28;
            v33 = v31;
            uint64_t v34 = v43;
LABEL_19:
            [(__CFDictionary *)v32 setObject:v33 forKeyedSubscript:v34];
          }
          else if (type == 13)
          {
            [(__CFDictionary *)v27 setObject:v13 forKeyedSubscript:v42];
            [(__CFDictionary *)v28 setObject:v53 forKeyedSubscript:v41];
            v30 = [v9 keySalt];
            [(__CFDictionary *)v28 setObject:v30 forKeyedSubscript:v40];

            v31 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v9 generationCounter]);
            CFMutableDictionaryRef v32 = v28;
            v33 = v31;
            uint64_t v34 = v39;
            goto LABEL_19;
          }
          [(__CFDictionary *)v28 setObject:&off_1009D1B18 forKeyedSubscript:v49];
          v36 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v9 participantID]);
          [(__CFDictionary *)v28 setObject:v36 forKeyedSubscript:v48];

          v37 = JWEncodeDictionary();
          [(__CFDictionary *)Mutable setObject:v37 forKeyedSubscript:v13];

          id v11 = v51;
          v10 = v53;
          goto LABEL_21;
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v52 = v10;
          unint64_t v15 = [(IDSServerDesiredKeyMaterialSet *)self forParticipantID];
          id v50 = v11;
          v16 = [(IDSServerDesiredKeyMaterialSet *)self forPublicIdentity];
          id v17 = [v9 keyIndex];
          *(_DWORD *)buf = 134218498;
          unint64_t v60 = v15;
          __int16 v61 = 2112;
          v62 = v16;
          id v11 = v50;
          v10 = v52;
          __int16 v63 = 2112;
          v64 = v17;
          _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "IDSServerDesiredKeyMaterialSet materialDataByID: could not encrypt the key material for participantID: %llu, remote pub key: %@, mki: %@", buf, 0x20u);
        }
LABEL_21:

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v55 objects:v65 count:16];
    }
    while (v6);
  }

  return Mutable;
}

- (NSArray)kms
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (int)type
{
  return self->_type;
}

- (__SecKey)forPublicIdentity
{
  return self->_forPublicIdentity;
}

- (BOOL)requireSignature
{
  return self->_requireSignature;
}

- (unint64_t)forParticipantID
{
  return self->_forParticipantID;
}

- (void).cxx_destruct
{
}

@end