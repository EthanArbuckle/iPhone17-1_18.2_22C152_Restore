@interface IDSGroupSessionActiveParticipant
- (BOOL)isKnown;
- (IDSGroupSessionActiveParticipant)initWithDictionaryRepresentation:(id)a3;
- (IDSGroupSessionActiveParticipant)initWithGroupUUID:(id)a3 participantIdentifier:(unint64_t)a4 isKnown:(BOOL)a5 participantURI:(id)a6 pushToken:(id)a7;
- (IDSGroupSessionActiveParticipant)initWithGroupUUID:(id)a3 participantIdentifier:(unint64_t)a4 isKnown:(BOOL)a5 participantURIObject:(id)a6 pushTokenObject:(id)a7;
- (IDSPushToken)participantPushTokenObject;
- (NSData)participantPushToken;
- (NSString)participantURI;
- (NSUUID)groupUUID;
- (id)debugDescription;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)participantIdentifier;
@end

@implementation IDSGroupSessionActiveParticipant

- (IDSGroupSessionActiveParticipant)initWithGroupUUID:(id)a3 participantIdentifier:(unint64_t)a4 isKnown:(BOOL)a5 participantURI:(id)a6 pushToken:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {

    id v14 = 0;
  }
  if (v13)
  {
    v18 = objc_msgSend_URIWithPrefixedURI_(IDSURI, v15, (uint64_t)v13, v17);
    if (v14)
    {
LABEL_5:
      v19 = objc_msgSend_pushTokenWithData_(IDSPushToken, v15, (uint64_t)v14, v17);
      uint64_t isKnown_participantURIObject_pushTokenObject = objc_msgSend_initWithGroupUUID_participantIdentifier_isKnown_participantURIObject_pushTokenObject_(self, v20, (uint64_t)v12, v21, a4, v9, v18, v19);
      goto LABEL_8;
    }
  }
  else
  {
    v18 = 0;
    if (v14) {
      goto LABEL_5;
    }
  }
  v19 = 0;
  uint64_t isKnown_participantURIObject_pushTokenObject = objc_msgSend_initWithGroupUUID_participantIdentifier_isKnown_participantURIObject_pushTokenObject_(self, v15, (uint64_t)v12, v17, a4, v9, v18, 0);
LABEL_8:
  v23 = (IDSGroupSessionActiveParticipant *)isKnown_participantURIObject_pushTokenObject;
  if (v14) {

  }
  if (v13) {
  if (v23)
  }
    v23->_givenNSNullToken = isKindOfClass & 1;

  return v23;
}

- (IDSGroupSessionActiveParticipant)initWithGroupUUID:(id)a3 participantIdentifier:(unint64_t)a4 isKnown:(BOOL)a5 participantURIObject:(id)a6 pushTokenObject:(id)a7
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)IDSGroupSessionActiveParticipant;
  v16 = [(IDSGroupSessionActiveParticipant *)&v19 init];
  double v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_groupUUID, a3);
    v17->_participantIdentifier = a4;
    objc_storeStrong((id *)&v17->_participantURIObject, a6);
    v17->_isKnown = a5;
    objc_storeStrong((id *)&v17->_participantPushTokenObject, a7);
  }

  return v17;
}

- (IDSGroupSessionActiveParticipant)initWithDictionaryRepresentation:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F29128];
  id v5 = a3;
  id v6 = [v4 alloc];
  BOOL v9 = objc_msgSend_objectForKeyedSubscript_(v5, v7, @"IDSGroupSessionActiveParticipantGroupUUIDKey", v8);
  id v12 = objc_msgSend_initWithUUIDString_(v6, v10, (uint64_t)v9, v11);
  id v15 = objc_msgSend_objectForKeyedSubscript_(v5, v13, @"IDSGroupSessionActiveParticipantIdentifierKey", v14);
  uint64_t v19 = objc_msgSend_unsignedLongLongValue(v15, v16, v17, v18);
  v22 = objc_msgSend_objectForKeyedSubscript_(v5, v20, @"IDSGroupSessionActiveParticipantIdentifierKey", v21);
  uint64_t v26 = objc_msgSend_BOOLValue(v22, v23, v24, v25);
  v29 = objc_msgSend_objectForKeyedSubscript_(v5, v27, @"IDSGroupSessionActiveParticipantURIKey", v28);
  v32 = objc_msgSend_objectForKeyedSubscript_(v5, v30, @"IDSGroupSessionActiveParticipantPushTokenKey", v31);

  isKnown_participantURI_pushToken = (IDSGroupSessionActiveParticipant *)objc_msgSend_initWithGroupUUID_participantIdentifier_isKnown_participantURI_pushToken_(self, v33, (uint64_t)v12, v34, v19, v26, v29, v32);
  return isKnown_participantURI_pushToken;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = objc_msgSend_groupUUID(self, v4, v5, v6);
  double v11 = objc_msgSend_UUIDString(v7, v8, v9, v10);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v12, (uint64_t)v11, v13, @"IDSGroupSessionActiveParticipantGroupUUIDKey");

  double v14 = NSNumber;
  uint64_t v18 = objc_msgSend_participantIdentifier(self, v15, v16, v17);
  double v21 = objc_msgSend_numberWithUnsignedLongLong_(v14, v19, v18, v20);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v22, (uint64_t)v21, v23, @"IDSGroupSessionActiveParticipantIdentifierKey");

  v27 = objc_msgSend_participantURI(self, v24, v25, v26);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v28, (uint64_t)v27, v29, @"IDSGroupSessionActiveParticipantURIKey");

  v30 = NSNumber;
  uint64_t isKnown = objc_msgSend_isKnown(self, v31, v32, v33);
  v37 = objc_msgSend_numberWithBool_(v30, v35, isKnown, v36);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v38, (uint64_t)v37, v39, @"IDSGroupSessionActiveParticipantIsKnown");

  v43 = objc_msgSend_participantPushToken(self, v40, v41, v42);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v44, (uint64_t)v43, v45, @"IDSGroupSessionActiveParticipantPushTokenKey");

  return v3;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v8 = objc_msgSend_groupUUID(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_participantIdentifier(self, v9, v10, v11);
  participantURIObject = self->_participantURIObject;
  participantPushTokenObject = self->_participantPushTokenObject;
  if (objc_msgSend_isKnown(self, v15, v16, v17)) {
    objc_msgSend_stringWithFormat_(v3, v18, @"<%@: %p groupUUID: %@, participantIdentifier: %llu, participantURI: %@, participantPushToken: %@, isKnown: %@>", v19, v4, self, v8, v12, participantURIObject, participantPushTokenObject, @"YES");
  }
  else {
  double v20 = objc_msgSend_stringWithFormat_(v3, v18, @"<%@: %p groupUUID: %@, participantIdentifier: %llu, participantURI: %@, participantPushToken: %@, isKnown: %@>", v19, v4, self, v8, v12, participantURIObject, participantPushTokenObject, @"NO");
  }

  return v20;
}

- (id)debugDescription
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v8 = objc_msgSend_groupUUID(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_participantIdentifier(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_debugDescription(self->_participantURIObject, v13, v14, v15);
  double v20 = objc_msgSend_debugDescription(self->_participantPushTokenObject, v17, v18, v19);
  if (objc_msgSend_isKnown(self, v21, v22, v23)) {
    objc_msgSend_stringWithFormat_(v3, v24, @"%@: %p {\n\tgroupUUID: %@\n\tparticipantIdentifier: %lu\n\tparticipantURI: %@\n\tparticipantPushToken: %@\n\tisKnown: %@}", v25, v4, self, v8, v12, v16, v20, @"YES");
  }
  else {
  double v26 = objc_msgSend_stringWithFormat_(v3, v24, @"%@: %p {\n\tgroupUUID: %@\n\tparticipantIdentifier: %lu\n\tparticipantURI: %@\n\tparticipantPushToken: %@\n\tisKnown: %@}", v25, v4, self, v8, v12, v16, v20, @"NO");
  }

  return v26;
}

- (IDSPushToken)participantPushTokenObject
{
  if (self->_givenNSNullToken)
  {
    objc_msgSend_null(MEMORY[0x1E4F1CA98], a2, v2, v3);
    uint64_t v4 = (IDSPushToken *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v4 = self->_participantPushTokenObject;
  }
  return v4;
}

- (NSString)participantURI
{
  return (NSString *)objc_msgSend_prefixedURI(self->_participantURIObject, a2, v2, v3);
}

- (NSData)participantPushToken
{
  if (self->_givenNSNullToken) {
    objc_msgSend_null(MEMORY[0x1E4F1CA98], a2, v2, v3);
  }
  else {
  uint64_t v4 = objc_msgSend_rawToken(self->_participantPushTokenObject, a2, v2, v3);
  }
  return (NSData *)v4;
}

- (NSUUID)groupUUID
{
  return self->_groupUUID;
}

- (unint64_t)participantIdentifier
{
  return self->_participantIdentifier;
}

- (BOOL)isKnown
{
  return self->_isKnown;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantPushTokenObject, 0);
  objc_storeStrong((id *)&self->_participantURIObject, 0);
  objc_storeStrong((id *)&self->_groupUUID, 0);
}

@end