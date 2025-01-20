@interface IDSGroupEncryptionKeyMaterial
+ (NSUUID)keyOriginIdentifier;
+ (unsigned)locallyGeneratedKeysCounter;
+ (void)setLocallyGeneratedKeysCounter:(unsigned int)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRealTimeEncryptionKeyMaterial:(id)a3;
- (BOOL)isGeneratedLocally;
- (BOOL)isSentToClient;
- (IDSGroupEncryptionKeyMaterial)initWithDictionary:(id)a3;
- (IDSGroupEncryptionKeyMaterial)initWithIndex:(id)a3 groupID:(id)a4 participantID:(unint64_t)a5;
- (IDSGroupEncryptionKeyMaterial)initWithKeyMaterial:(id)a3 keySalt:(id)a4 keyIndex:(id)a5 groupID:(id)a6;
- (IDSGroupEncryptionKeyMaterial)initWithKeyMaterial:(id)a3 keySalt:(id)a4 keyIndex:(id)a5 groupID:(id)a6 generationCounter:(unsigned int)a7 participantID:(unint64_t)a8;
- (IDSGroupEncryptionKeyMaterial)initWithKeyMaterial:(id)a3 keySalt:(id)a4 keyIndex:(id)a5 groupID:(id)a6 isGeneratedLocally:(BOOL)a7 createdAt:(id)a8 generationCounter:(unsigned int)a9 participantID:(unint64_t)a10;
- (IDSGroupEncryptionKeyMaterial)initWithKeyMaterial:(id)a3 keySalt:(id)a4 keyIndex:(id)a5 groupID:(id)a6 isGeneratedLocally:(BOOL)a7 createdAt:(id)a8 generationCounter:(unsigned int)a9 participantID:(unint64_t)a10 shortKeyIndexLength:(unsigned __int8)a11;
- (IDSGroupEncryptionKeyMaterial)initWithKeyMaterial:(id)a3 keySalt:(id)a4 keyIndex:(id)a5 groupID:(id)a6 participantID:(unint64_t)a7;
- (NSData)keyMaterial;
- (NSData)keySalt;
- (NSDate)createdAt;
- (NSString)groupID;
- (NSUUID)keyIndex;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)dictionaryRepresentation;
- (int)ratchetIndex;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (unint64_t)participantID;
- (unsigned)generationCounter;
- (unsigned)shortKeyIndexLength;
- (void)changeCreatedAt:(id)a3;
- (void)removeDeviceFromSentToDevice:(id)a3;
- (void)sentToDevice:(id)a3;
- (void)setGenerationCounter:(unsigned int)a3;
- (void)setIsGeneratedLocally:(BOOL)a3;
- (void)setIsSentToClient:(BOOL)a3;
- (void)setParticipantID:(unint64_t)a3;
- (void)setRatchetIndex:(int)a3;
- (void)setShortKeyIndexLength:(unsigned __int8)a3;
@end

@implementation IDSGroupEncryptionKeyMaterial

- (IDSGroupEncryptionKeyMaterial)initWithIndex:(id)a3 groupID:(id)a4 participantID:(unint64_t)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v46.receiver = self;
  v46.super_class = (Class)IDSGroupEncryptionKeyMaterial;
  v10 = [(IDSGroupEncryptionKeyMaterial *)&v46 init];
  if (!v10) {
    goto LABEL_13;
  }
  CFTypeRef cf = 0;
  if (qword_1E944F630 != -1) {
    dispatch_once(&qword_1E944F630, &unk_1EEFCD5B8);
  }
  if (off_1E944F628 && (uint64_t v11 = off_1E944F628(0, &cf)) != 0 && !cf)
  {
    if (qword_1E944F640 != -1) {
      dispatch_once(&qword_1E944F640, &unk_1EEFCE398);
    }
    if (off_1E944F638)
    {
      uint64_t v12 = off_1E944F638(0, &cf);
      if (v12)
      {
        if (!cf)
        {
          keyMaterial = v10->_keyMaterial;
          v10->_keyMaterial = (NSData *)v11;

          keySalt = v10->_keySalt;
          v10->_keySalt = (NSData *)v12;

          uint64_t v18 = objc_msgSend_copy(v8, v15, v16, v17);
          keyIndex = v10->_keyIndex;
          v10->_keyIndex = (NSUUID *)v18;

          uint64_t v23 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v20, v21, v22);
          createdAt = v10->_createdAt;
          v10->_createdAt = (NSDate *)v23;

          uint64_t v28 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v25, v26, v27);
          devicesToBeSent = v10->_devicesToBeSent;
          v10->_devicesToBeSent = (NSMutableSet *)v28;

          uint64_t v33 = objc_msgSend_copy(v9, v30, v31, v32);
          groupID = v10->_groupID;
          v10->_groupID = (NSString *)v33;

          v10->_isGeneratedLocally = 1;
          uint64_t v38 = objc_msgSend_locallyGeneratedKeysCounter(IDSGroupEncryptionKeyMaterial, v35, v36, v37)+ 1;
          objc_msgSend_setLocallyGeneratedKeysCounter_(IDSGroupEncryptionKeyMaterial, v39, v38, v40);
          v10->_generationCounter = v38;
          v10->_participantID = a5;
          v10->_shortKeyIndexLength = 0;
LABEL_13:
          v41 = v10;
          goto LABEL_29;
        }
      }
    }
    v43 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFTypeRef v48 = cf;
      _os_log_impl(&dword_19D9BE000, v43, OS_LOG_TYPE_DEFAULT, "_SecMWCreateSessionSalt for Key Salt (error %@)", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"IDSRTEncryptionKeyMaterial", @"IDS", @"_SecMWCreateSessionSalt for Key Salt (error %@)");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"IDSRTEncryptionKeyMaterial", @"_SecMWCreateSessionSalt for Key Salt (error %@)");
        }
      }
    }
  }
  else
  {
    v42 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFTypeRef v48 = cf;
      _os_log_impl(&dword_19D9BE000, v42, OS_LOG_TYPE_DEFAULT, "SecMWCreateSessionSeed for Key Material (error %@)", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"IDSRTEncryptionKeyMaterial", @"IDS", @"SecMWCreateSessionSeed for Key Material (error %@)");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"IDSRTEncryptionKeyMaterial", @"SecMWCreateSessionSeed for Key Material (error %@)");
        }
      }
    }
  }
  if (cf) {
    CFRelease(cf);
  }
  v41 = 0;
LABEL_29:

  return v41;
}

- (IDSGroupEncryptionKeyMaterial)initWithKeyMaterial:(id)a3 keySalt:(id)a4 keyIndex:(id)a5 groupID:(id)a6
{
  v10 = (void *)MEMORY[0x1E4F1C9C8];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  uint64_t v18 = objc_msgSend_date(v10, v15, v16, v17);
  int v23 = 0;
  isGeneratedLocally_createdAt_generationCounter_participantID = (IDSGroupEncryptionKeyMaterial *)objc_msgSend_initWithKeyMaterial_keySalt_keyIndex_groupID_isGeneratedLocally_createdAt_generationCounter_participantID_(self, v19, (uint64_t)v14, v20, v13, v12, v11, 0, v18, v23, 0);

  return isGeneratedLocally_createdAt_generationCounter_participantID;
}

- (IDSGroupEncryptionKeyMaterial)initWithKeyMaterial:(id)a3 keySalt:(id)a4 keyIndex:(id)a5 groupID:(id)a6 participantID:(unint64_t)a7
{
  id v12 = (void *)MEMORY[0x1E4F1C9C8];
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  double v20 = objc_msgSend_date(v12, v17, v18, v19);
  int v25 = 0;
  isGeneratedLocally_createdAt_generationCounter_participantID = (IDSGroupEncryptionKeyMaterial *)objc_msgSend_initWithKeyMaterial_keySalt_keyIndex_groupID_isGeneratedLocally_createdAt_generationCounter_participantID_(self, v21, (uint64_t)v16, v22, v15, v14, v13, 0, v20, v25, a7);

  return isGeneratedLocally_createdAt_generationCounter_participantID;
}

- (IDSGroupEncryptionKeyMaterial)initWithKeyMaterial:(id)a3 keySalt:(id)a4 keyIndex:(id)a5 groupID:(id)a6 generationCounter:(unsigned int)a7 participantID:(unint64_t)a8
{
  id v14 = (void *)MEMORY[0x1E4F1C9C8];
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  double v22 = objc_msgSend_date(v14, v19, v20, v21);
  unsigned int v27 = a7;
  isGeneratedLocally_createdAt_generationCounter_participantID = (IDSGroupEncryptionKeyMaterial *)objc_msgSend_initWithKeyMaterial_keySalt_keyIndex_groupID_isGeneratedLocally_createdAt_generationCounter_participantID_(self, v23, (uint64_t)v18, v24, v17, v16, v15, 0, v22, v27, a8);

  return isGeneratedLocally_createdAt_generationCounter_participantID;
}

- (IDSGroupEncryptionKeyMaterial)initWithKeyMaterial:(id)a3 keySalt:(id)a4 keyIndex:(id)a5 groupID:(id)a6 isGeneratedLocally:(BOOL)a7 createdAt:(id)a8 generationCounter:(unsigned int)a9 participantID:(unint64_t)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  v43.receiver = self;
  v43.super_class = (Class)IDSGroupEncryptionKeyMaterial;
  int v23 = [(IDSGroupEncryptionKeyMaterial *)&v43 init];
  if (v23)
  {
    uint64_t v25 = objc_msgSend_copy(v16, v21, v22, v24);
    keyMaterial = v23->_keyMaterial;
    v23->_keyMaterial = (NSData *)v25;

    uint64_t v30 = objc_msgSend_copy(v17, v27, v28, v29);
    keySalt = v23->_keySalt;
    v23->_keySalt = (NSData *)v30;

    uint64_t v35 = objc_msgSend_copy(v18, v32, v33, v34);
    keyIndex = v23->_keyIndex;
    v23->_keyIndex = (NSUUID *)v35;

    objc_storeStrong((id *)&v23->_createdAt, a8);
    v23->_isGeneratedLocally = a7;
    v23->_generationCounter = a9;
    uint64_t v40 = objc_msgSend_copy(v19, v37, v38, v39);
    groupID = v23->_groupID;
    v23->_groupID = (NSString *)v40;

    v23->_participantID = a10;
    v23->_shortKeyIndexLength = 0;
  }

  return v23;
}

- (IDSGroupEncryptionKeyMaterial)initWithKeyMaterial:(id)a3 keySalt:(id)a4 keyIndex:(id)a5 groupID:(id)a6 isGeneratedLocally:(BOOL)a7 createdAt:(id)a8 generationCounter:(unsigned int)a9 participantID:(unint64_t)a10 shortKeyIndexLength:(unsigned __int8)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a8;
  v44.receiver = self;
  v44.super_class = (Class)IDSGroupEncryptionKeyMaterial;
  double v24 = [(IDSGroupEncryptionKeyMaterial *)&v44 init];
  if (v24)
  {
    uint64_t v26 = objc_msgSend_copy(v17, v22, v23, v25);
    keyMaterial = v24->_keyMaterial;
    v24->_keyMaterial = (NSData *)v26;

    uint64_t v31 = objc_msgSend_copy(v18, v28, v29, v30);
    keySalt = v24->_keySalt;
    v24->_keySalt = (NSData *)v31;

    uint64_t v36 = objc_msgSend_copy(v19, v33, v34, v35);
    keyIndex = v24->_keyIndex;
    v24->_keyIndex = (NSUUID *)v36;

    objc_storeStrong((id *)&v24->_createdAt, a8);
    v24->_isGeneratedLocally = a7;
    v24->_generationCounter = a9;
    uint64_t v41 = objc_msgSend_copy(v20, v38, v39, v40);
    groupID = v24->_groupID;
    v24->_groupID = (NSString *)v41;

    v24->_participantID = a10;
    v24->_shortKeyIndexLength = a11;
  }

  return v24;
}

- (IDSGroupEncryptionKeyMaterial)initWithDictionary:(id)a3
{
  id v4 = a3;
  v52 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"keyMaterial", v6);
  v51 = objc_msgSend_objectForKeyedSubscript_(v4, v7, @"keySalt", v8);
  v50 = objc_msgSend_objectForKeyedSubscript_(v4, v9, @"keyIndex", v10);
  id v13 = objc_msgSend_objectForKeyedSubscript_(v4, v11, @"groupID", v12);
  id v16 = objc_msgSend_objectForKeyedSubscript_(v4, v14, @"isGeneratedLocally", v15);
  unsigned int v49 = objc_msgSend_BOOLValue(v16, v17, v18, v19);
  uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(v4, v20, @"createdAt", v21);
  double v25 = objc_msgSend_objectForKeyedSubscript_(v4, v23, @"generationCounter", v24);
  int v29 = objc_msgSend_unsignedIntValue(v25, v26, v27, v28);
  double v32 = objc_msgSend_objectForKeyedSubscript_(v4, v30, @"participantID", v31);
  uint64_t v36 = objc_msgSend_unsignedLongLongValue(v32, v33, v34, v35);
  uint64_t v39 = objc_msgSend_objectForKeyedSubscript_(v4, v37, @"smkil", v38);

  char v48 = objc_msgSend_unsignedIntValue(v39, v40, v41, v42);
  int v47 = v29;
  isGeneratedLocally_createdAt_generationCounter_participantID_shortKeyIndexLength = (IDSGroupEncryptionKeyMaterial *)objc_msgSend_initWithKeyMaterial_keySalt_keyIndex_groupID_isGeneratedLocally_createdAt_generationCounter_participantID_shortKeyIndexLength_(self, v43, (uint64_t)v52, v44, v51, v50, v13, v49, v22, v47, v36, v48);

  return isGeneratedLocally_createdAt_generationCounter_participantID_shortKeyIndexLength;
}

- (void)changeCreatedAt:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    createdAt = self->_createdAt;
    *(_DWORD *)buf = 138412546;
    double v15 = createdAt;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_19D9BE000, v5, OS_LOG_TYPE_DEFAULT, "change CreatedAt from %@ to %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      double v12 = self->_createdAt;
      id v13 = v4;
      _IDSLogTransport(@"IDSRTEncryptionKeyMaterial", @"IDS", @"change CreatedAt from %@ to %@");
      if (_IDSShouldLog())
      {
        double v12 = self->_createdAt;
        id v13 = v4;
        _IDSLogV(0, @"IDSFoundation", @"IDSRTEncryptionKeyMaterial", @"change CreatedAt from %@ to %@");
      }
    }
  }
  double v10 = (NSDate *)objc_msgSend_copy(v4, v7, v8, v9, v12, v13);
  id v11 = self->_createdAt;
  self->_createdAt = v10;
}

- (void)sentToDevice:(id)a3
{
  objc_msgSend_addObject_(self->_devicesToBeSent, a2, (uint64_t)a3, v3);
}

- (void)removeDeviceFromSentToDevice:(id)a3
{
  objc_msgSend_removeObject_(self->_devicesToBeSent, a2, (uint64_t)a3, v3);
}

+ (unsigned)locallyGeneratedKeysCounter
{
  return dword_1E944F648;
}

+ (void)setLocallyGeneratedKeysCounter:(unsigned int)a3
{
  dword_1E944F648 = a3;
}

+ (NSUUID)keyOriginIdentifier
{
  if (qword_1E944F650 != -1) {
    dispatch_once(&qword_1E944F650, &unk_1EEFCE4F8);
  }
  v2 = (void *)qword_1E944F658;
  return (NSUUID *)v2;
}

- (BOOL)isEqualToRealTimeEncryptionKeyMaterial:(id)a3
{
  if (self == a3) {
    return 1;
  }
  v5 = objc_msgSend_keyIndex(a3, a2, (uint64_t)a3, v3);
  double v9 = objc_msgSend_keyIndex(self, v6, v7, v8);
  char isEqual = objc_msgSend_isEqual_(v5, v10, (uint64_t)v9, v11);

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char isEqualToRealTimeEncryptionKeyMaterial = objc_msgSend_isEqualToRealTimeEncryptionKeyMaterial_(self, v5, (uint64_t)v4, v6);
  }
  else {
    char isEqualToRealTimeEncryptionKeyMaterial = 0;
  }

  return isEqualToRealTimeEncryptionKeyMaterial;
}

- (unint64_t)hash
{
  id v4 = objc_msgSend_keyIndex(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (id)description
{
  double v44 = NSString;
  uint64_t v3 = objc_opt_class();
  double v7 = objc_msgSend_keyIndex(self, v4, v5, v6);
  double v11 = objc_msgSend_keyMaterial(self, v8, v9, v10);
  double v15 = objc_msgSend_keySalt(self, v12, v13, v14);
  uint64_t v19 = objc_msgSend_ratchetIndex(self, v16, v17, v18);
  uint64_t v23 = objc_msgSend_createdAt(self, v20, v21, v22);
  if (objc_msgSend_isGeneratedLocally(self, v24, v25, v26)) {
    double v30 = @"YES";
  }
  else {
    double v30 = @"NO";
  }
  uint64_t v31 = objc_msgSend_generationCounter(self, v27, v28, v29);
  uint64_t v35 = objc_msgSend_participantID(self, v32, v33, v34);
  unsigned int v39 = objc_msgSend_shortKeyIndexLength(self, v36, v37, v38);
  double v42 = objc_msgSend_stringWithFormat_(v44, v40, @"<%@: %p KeyIndex: %@, KeyMaterial: %@, KeySalt: %@, ratchetIndex: %d, createdAt: %@, isGeneratedLocally: %@, counter:%u, participantID: %llu, smkil: %u>", v41, v3, self, v7, v11, v15, v19, v23, v30, v31, v35, v39);

  return v42;
}

- (id)debugDescription
{
  char v48 = NSString;
  uint64_t v47 = objc_opt_class();
  double v6 = objc_msgSend_keyIndex(self, v3, v4, v5);
  double v10 = objc_msgSend_groupID(self, v7, v8, v9);
  double v14 = objc_msgSend_createdAt(self, v11, v12, v13);
  if (objc_msgSend_isGeneratedLocally(self, v15, v16, v17)) {
    uint64_t v21 = @"YES";
  }
  else {
    uint64_t v21 = @"NO";
  }
  double v22 = objc_msgSend_keySalt(self, v18, v19, v20);
  double v26 = objc_msgSend_keyMaterial(self, v23, v24, v25);
  uint64_t v30 = objc_msgSend_ratchetIndex(self, v27, v28, v29);
  uint64_t v34 = objc_msgSend_generationCounter(self, v31, v32, v33);
  uint64_t v38 = objc_msgSend_participantID(self, v35, v36, v37);
  unsigned int v42 = objc_msgSend_shortKeyIndexLength(self, v39, v40, v41);
  v45 = objc_msgSend_stringWithFormat_(v48, v43, @"<%@: %p KeyIndex: %@, groupID: %@, createdAt: %@, isGeneratedLocally: %@, KeySalt: %@, KeyMaterial: %@, ratchetIndex: %d, counter: %u, participantID: %llu, smkil: %u>", v44, v47, self, v6, v10, v14, v21, v22, v26, v30, v34, v38, v42);

  return v45;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [IDSGroupEncryptionKeyMaterial alloc];
  unsigned int generationCounter = self->_generationCounter;
  return (id)objc_msgSend_initWithKeyMaterial_keySalt_keyIndex_groupID_isGeneratedLocally_createdAt_generationCounter_participantID_(v4, v5, (uint64_t)self->_keyMaterial, v6, self->_keySalt, self->_keyIndex, self->_groupID, self->_isGeneratedLocally, self->_createdAt, generationCounter, self->_participantID);
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  unsigned int v8 = objc_msgSend_generationCounter(self, v5, v6, v7);
  if (v8 >= objc_msgSend_generationCounter(v4, v9, v10, v11))
  {
    unsigned int v16 = objc_msgSend_generationCounter(self, v12, v13, v14);
    int64_t v15 = v16 > objc_msgSend_generationCounter(v4, v17, v18, v19);
  }
  else
  {
    int64_t v15 = -1;
  }

  return v15;
}

- (id)dictionaryRepresentation
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  keyIndex = self->_keyIndex;
  v18[0] = @"keyIndex";
  v18[1] = @"keySalt";
  long long v20 = *(_OWORD *)&self->_keySalt;
  v18[2] = @"keyMaterial";
  v18[3] = @"groupID";
  groupID = self->_groupID;
  v18[4] = @"isGeneratedLocally";
  uint64_t v3 = objc_msgSend_numberWithBool_(NSNumber, a2, self->_isGeneratedLocally, *(double *)&v20);
  double v22 = v3;
  v18[5] = @"generationCounter";
  uint64_t v6 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v4, self->_generationCounter, v5);
  createdAt = self->_createdAt;
  uint64_t v23 = v6;
  uint64_t v24 = createdAt;
  v18[6] = @"createdAt";
  v18[7] = @"participantID";
  uint64_t v10 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v8, self->_participantID, v9);
  double v25 = v10;
  v18[8] = @"smkil";
  uint64_t v13 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v11, self->_shortKeyIndexLength, v12);
  double v26 = v13;
  unsigned int v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v14, (uint64_t)&keyIndex, v15, v18, 9);

  return v16;
}

- (BOOL)isSentToClient
{
  return self->_isSentToClient;
}

- (void)setIsSentToClient:(BOOL)a3
{
  self->_isSentToClient = a3;
}

- (BOOL)isGeneratedLocally
{
  return self->_isGeneratedLocally;
}

- (void)setIsGeneratedLocally:(BOOL)a3
{
  self->_isGeneratedLocally = a3;
}

- (NSUUID)keyIndex
{
  return self->_keyIndex;
}

- (NSData)keySalt
{
  return self->_keySalt;
}

- (NSData)keyMaterial
{
  return self->_keyMaterial;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (unsigned)generationCounter
{
  return self->_generationCounter;
}

- (void)setGenerationCounter:(unsigned int)a3
{
  self->_unsigned int generationCounter = a3;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (unint64_t)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(unint64_t)a3
{
  self->_participantID = a3;
}

- (int)ratchetIndex
{
  return self->_ratchetIndex;
}

- (void)setRatchetIndex:(int)a3
{
  self->_ratchetIndex = a3;
}

- (unsigned)shortKeyIndexLength
{
  return self->_shortKeyIndexLength;
}

- (void)setShortKeyIndexLength:(unsigned __int8)a3
{
  self->_shortKeyIndexLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_devicesToBeSent, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_keyMaterial, 0);
  objc_storeStrong((id *)&self->_keySalt, 0);
  objc_storeStrong((id *)&self->_keyIndex, 0);
}

@end