@interface IDSGroupSessionParticipantUpdate
- (BOOL)fromServer;
- (BOOL)isInitiator;
- (IDSGroupSessionParticipantUpdate)initWithDictionaryRepresentation:(id)a3;
- (IDSGroupSessionParticipantUpdate)initWithGroupUUID:(id)a3 isInitiator:(BOOL)a4 participantIdentifier:(unint64_t)a5 participantDestinationID:(id)a6 participantUpdateType:(unint64_t)a7 participantUpdateSubtype:(unint64_t)a8 fromServer:(BOOL)a9 serverDate:(id)a10 participantData:(id)a11 clientContextData:(id)a12 members:(id)a13 participantIDs:(id)a14 relaySessionID:(id)a15;
- (IDSGroupSessionParticipantUpdate)initWithGroupUUID:(id)a3 isInitiator:(BOOL)a4 participantIdentifier:(unint64_t)a5 participantDestinationURI:(id)a6 participantUpdateType:(unint64_t)a7 participantUpdateSubtype:(unint64_t)a8 fromServer:(BOOL)a9 serverDate:(id)a10 participantData:(id)a11 clientContextData:(id)a12 members:(id)a13 participantIDs:(id)a14 relaySessionID:(id)a15;
- (IDSURI)participantDestinationURI;
- (NSArray)members;
- (NSData)clientContextData;
- (NSData)participantData;
- (NSDate)serverDate;
- (NSDictionary)participantIDs;
- (NSString)participantDestinationID;
- (NSUUID)groupUUID;
- (NSUUID)relaySessionID;
- (id)debugDescription;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)participantIdentifier;
- (unint64_t)participantUpdateSubtype;
- (unint64_t)participantUpdateType;
@end

@implementation IDSGroupSessionParticipantUpdate

- (IDSGroupSessionParticipantUpdate)initWithGroupUUID:(id)a3 isInitiator:(BOOL)a4 participantIdentifier:(unint64_t)a5 participantDestinationID:(id)a6 participantUpdateType:(unint64_t)a7 participantUpdateSubtype:(unint64_t)a8 fromServer:(BOOL)a9 serverDate:(id)a10 participantData:(id)a11 clientContextData:(id)a12 members:(id)a13 participantIDs:(id)a14 relaySessionID:(id)a15
{
  BOOL v33 = a4;
  id v17 = a15;
  id v18 = a14;
  id v19 = a13;
  id v20 = a12;
  id v21 = a11;
  id v22 = a10;
  id v23 = a3;
  v26 = objc_msgSend_URIWithPrefixedURI_(IDSURI, v24, (uint64_t)a6, v25);
  isInitiator_participantIdentifier_participantDestinationURI_participantUpdateType_participantUpdateSubtype_fromServer_serverDate_participantData_clientContextData_members_participantIDs_relaySessionID = (IDSGroupSessionParticipantUpdate *)objc_msgSend_initWithGroupUUID_isInitiator_participantIdentifier_participantDestinationURI_participantUpdateType_participantUpdateSubtype_fromServer_serverDate_participantData_clientContextData_members_participantIDs_relaySessionID_(self, v27, (uint64_t)v23, v28, v33, a5, v26, a7, a8, a9, v22, v21, v20, v19, v18, v17);

  return isInitiator_participantIdentifier_participantDestinationURI_participantUpdateType_participantUpdateSubtype_fromServer_serverDate_participantData_clientContextData_members_participantIDs_relaySessionID;
}

- (IDSGroupSessionParticipantUpdate)initWithGroupUUID:(id)a3 isInitiator:(BOOL)a4 participantIdentifier:(unint64_t)a5 participantDestinationURI:(id)a6 participantUpdateType:(unint64_t)a7 participantUpdateSubtype:(unint64_t)a8 fromServer:(BOOL)a9 serverDate:(id)a10 participantData:(id)a11 clientContextData:(id)a12 members:(id)a13 participantIDs:(id)a14 relaySessionID:(id)a15
{
  id v31 = a3;
  id v28 = a6;
  id v18 = a6;
  id v19 = a10;
  id v33 = a11;
  id v32 = a12;
  id v20 = a13;
  id v21 = a14;
  id v22 = a15;
  v34.receiver = self;
  v34.super_class = (Class)IDSGroupSessionParticipantUpdate;
  id v23 = [(IDSGroupSessionParticipantUpdate *)&v34 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_groupUUID, a3);
    v24->_isInitiator = a4;
    v24->_participantIdentifier = a5;
    objc_storeStrong((id *)&v24->_participantDestinationURI, v28);
    v24->_participantUpdateType = a7;
    v24->_participantUpdateSubtype = a8;
    v24->_fromServer = a9;
    objc_storeStrong((id *)&v24->_serverDate, a10);
    objc_storeStrong((id *)&v24->_participantData, a11);
    objc_storeStrong((id *)&v24->_clientContextData, a12);
    objc_storeStrong((id *)&v24->_members, a13);
    objc_storeStrong((id *)&v24->_participantIDs, a14);
    objc_storeStrong((id *)&v24->_relaySessionID, a15);
  }

  return v24;
}

- (IDSGroupSessionParticipantUpdate)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"IDSGroupSessionParticipantUpdateMembersKey", v6);
  v79 = v7;
  if (v7)
  {
    v78 = objc_msgSend___imArrayByApplyingBlock_(v7, v8, (uint64_t)&unk_1EEFCD498, v9);
  }
  else
  {
    v78 = 0;
  }
  id v10 = objc_alloc(MEMORY[0x1E4F29128]);
  v77 = objc_msgSend_objectForKeyedSubscript_(v4, v11, @"IDSGroupSessionParticipantUpdateGroupUUIDKey", v12);
  v73 = objc_msgSend_initWithUUIDString_(v10, v13, (uint64_t)v77, v14);
  v76 = objc_msgSend_objectForKeyedSubscript_(v4, v15, @"IDSGroupSessionParticipantUpdateIsInitiatorKey", v16);
  unsigned int v71 = objc_msgSend_BOOLValue(v76, v17, v18, v19);
  v75 = objc_msgSend_objectForKeyedSubscript_(v4, v20, @"IDSGroupSessionParticipantUpdateParticipantIdentifierKey", v21);
  uint64_t v69 = objc_msgSend_unsignedLongLongValue(v75, v22, v23, v24);
  v68 = objc_msgSend_objectForKeyedSubscript_(v4, v25, @"IDSGroupSessionParticipantUpdateParticipantDestinationIDKey", v26);
  v74 = objc_msgSend_objectForKeyedSubscript_(v4, v27, @"IDSGroupSessionParticipantUpdateMemberUpdateTypeKey", v28);
  uint64_t v67 = objc_msgSend_unsignedIntegerValue(v74, v29, v30, v31);
  v70 = objc_msgSend_objectForKeyedSubscript_(v4, v32, @"IDSGroupSessionParticipantUpdateMemberUpdateSubtypeKey", v33);
  uint64_t v66 = objc_msgSend_unsignedIntegerValue(v70, v34, v35, v36);
  v39 = objc_msgSend_objectForKeyedSubscript_(v4, v37, @"IDSGroupSessionParticipantUpdateFromServerKey", v38);
  char v43 = objc_msgSend_BOOLValue(v39, v40, v41, v42);
  v46 = objc_msgSend_objectForKeyedSubscript_(v4, v44, @"IDSGroupSessionParticipantUpdateServerDateKey", v45);
  v49 = objc_msgSend_objectForKeyedSubscript_(v4, v47, @"IDSGroupSessionParticipantUpdateParticipantDataKey", v48);
  v52 = objc_msgSend_objectForKeyedSubscript_(v4, v50, @"IDSGroupSessionParticipantUpdateClientContextDataKey", v51);
  v55 = objc_msgSend_objectForKeyedSubscript_(v4, v53, @"IDSGroupSessionParticipantUpdateParticipantIDsKey", v54);
  id v56 = objc_alloc(MEMORY[0x1E4F29128]);
  v59 = objc_msgSend_objectForKeyedSubscript_(v4, v57, @"IDSGroupSessionParticipantUpdateRelaySessionUUIDKey", v58);

  v62 = objc_msgSend_initWithUUIDString_(v56, v60, (uint64_t)v59, v61);
  isInitiator_participantIdentifier_participantDestinationID_participantUpdateType_participantUpdateSubtype_fromServer_serverDate_participantData_clientContextData_members_participantIDs_relaySessionID = (IDSGroupSessionParticipantUpdate *)objc_msgSend_initWithGroupUUID_isInitiator_participantIdentifier_participantDestinationID_participantUpdateType_participantUpdateSubtype_fromServer_serverDate_participantData_clientContextData_members_participantIDs_relaySessionID_(self, v63, (uint64_t)v73, v64, v71, v69, v68, v67, v66, v43, v46, v49, v52, v78, v55, v62);

  return isInitiator_participantIdentifier_participantDestinationID_participantUpdateType_participantUpdateSubtype_fromServer_serverDate_participantData_clientContextData_members_participantIDs_relaySessionID;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = objc_msgSend_groupUUID(self, v4, v5, v6);
  v11 = objc_msgSend_UUIDString(v7, v8, v9, v10);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v12, (uint64_t)v11, v13, @"IDSGroupSessionParticipantUpdateGroupUUIDKey");

  double v14 = NSNumber;
  uint64_t isInitiator = objc_msgSend_isInitiator(self, v15, v16, v17);
  double v21 = objc_msgSend_numberWithBool_(v14, v19, isInitiator, v20);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v22, (uint64_t)v21, v23, @"IDSGroupSessionParticipantUpdateIsInitiatorKey");

  double v24 = NSNumber;
  uint64_t v28 = objc_msgSend_participantIdentifier(self, v25, v26, v27);
  double v31 = objc_msgSend_numberWithUnsignedLongLong_(v24, v29, v28, v30);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v32, (uint64_t)v31, v33, @"IDSGroupSessionParticipantUpdateParticipantIdentifierKey");

  v37 = objc_msgSend_participantDestinationID(self, v34, v35, v36);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v38, (uint64_t)v37, v39, @"IDSGroupSessionParticipantUpdateParticipantDestinationIDKey");

  v40 = NSNumber;
  uint64_t updated = objc_msgSend_participantUpdateType(self, v41, v42, v43);
  v47 = objc_msgSend_numberWithUnsignedInteger_(v40, v45, updated, v46);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v48, (uint64_t)v47, v49, @"IDSGroupSessionParticipantUpdateMemberUpdateTypeKey");

  v50 = NSNumber;
  uint64_t v54 = objc_msgSend_participantUpdateSubtype(self, v51, v52, v53);
  v57 = objc_msgSend_numberWithUnsignedInteger_(v50, v55, v54, v56);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v58, (uint64_t)v57, v59, @"IDSGroupSessionParticipantUpdateMemberUpdateSubtypeKey");

  v60 = NSNumber;
  uint64_t v64 = objc_msgSend_fromServer(self, v61, v62, v63);
  uint64_t v67 = objc_msgSend_numberWithBool_(v60, v65, v64, v66);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v68, (uint64_t)v67, v69, @"IDSGroupSessionParticipantUpdateFromServerKey");

  v73 = objc_msgSend_serverDate(self, v70, v71, v72);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v74, (uint64_t)v73, v75, @"IDSGroupSessionParticipantUpdateServerDateKey");

  v79 = objc_msgSend_participantData(self, v76, v77, v78);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v80, (uint64_t)v79, v81, @"IDSGroupSessionParticipantUpdateParticipantDataKey");

  v85 = objc_msgSend_clientContextData(self, v82, v83, v84);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v86, (uint64_t)v85, v87, @"IDSGroupSessionParticipantUpdateClientContextDataKey");

  v91 = objc_msgSend_members(self, v88, v89, v90);
  v94 = objc_msgSend___imArrayByApplyingBlock_(v91, v92, (uint64_t)&unk_1EEFCE2F8, v93);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v95, (uint64_t)v94, v96, @"IDSGroupSessionParticipantUpdateMembersKey");

  v100 = objc_msgSend_participantIDs(self, v97, v98, v99);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v101, (uint64_t)v100, v102, @"IDSGroupSessionParticipantUpdateParticipantIDsKey");

  v106 = objc_msgSend_relaySessionID(self, v103, v104, v105);
  v110 = objc_msgSend_UUIDString(v106, v107, v108, v109);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v111, (uint64_t)v110, v112, @"IDSGroupSessionParticipantUpdateRelaySessionUUIDKey");

  return v3;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v8 = objc_msgSend_groupUUID(self, v5, v6, v7);
  if (objc_msgSend_isInitiator(self, v9, v10, v11)) {
    v15 = @"YES";
  }
  else {
    v15 = @"NO";
  }
  uint64_t v16 = objc_msgSend_participantIdentifier(self, v12, v13, v14);
  double v20 = objc_msgSend_participantDestinationURI(self, v17, v18, v19);
  uint64_t updated = objc_msgSend_participantUpdateType(self, v21, v22, v23);
  uint64_t v28 = objc_msgSend_participantUpdateSubtype(self, v25, v26, v27);
  double v31 = objc_msgSend_stringWithFormat_(v3, v29, @"<%@: %p groupUUID: %@, isInitiator: %@, participantIdentifier: %llu, participantDestinationID: %@, participantUpdateType: %lu, participantUpdateSubype: %lu>", v30, v4, self, v8, v15, v16, v20, updated, v28);

  return v31;
}

- (id)debugDescription
{
  uint64_t v62 = NSString;
  uint64_t v61 = objc_opt_class();
  v60 = objc_msgSend_groupUUID(self, v3, v4, v5);
  double v59 = objc_msgSend_relaySessionID(self, v6, v7, v8);
  int isInitiator = objc_msgSend_isInitiator(self, v9, v10, v11);
  uint64_t v16 = @"NO";
  if (isInitiator) {
    uint64_t v16 = @"YES";
  }
  double v58 = v16;
  uint64_t v57 = objc_msgSend_participantIdentifier(self, v13, v14, v15);
  double v20 = objc_msgSend_participantDestinationURI(self, v17, v18, v19);
  uint64_t updated = objc_msgSend_participantUpdateType(self, v21, v22, v23);
  uint64_t v28 = objc_msgSend_participantUpdateSubtype(self, v25, v26, v27);
  unsigned int v32 = objc_msgSend_fromServer(self, v29, v30, v31);
  double v36 = objc_msgSend_serverDate(self, v33, v34, v35);
  v40 = objc_msgSend_participantData(self, v37, v38, v39);
  v44 = objc_msgSend_clientContextData(self, v41, v42, v43);
  double v48 = objc_msgSend_members(self, v45, v46, v47);
  uint64_t v52 = objc_msgSend_participantIDs(self, v49, v50, v51);
  v55 = objc_msgSend_stringWithFormat_(v62, v53, @"%@: %p {\n\tgroupUUID: %@ (relaySessionID: %@)\n\tIsInitiator: %@\n\tparticipantIdentifier: %llu\n\tparticipantDestinationID: %@\n\tparticipantUpdateType: %lu\n\tparticipantUpdateSubtype: %lu\n\tfromServer: %d\n\tserverDate: %@\n\tparticipantData: %@\n\tclientContextData: %@\n\tmembers: %@\n\tparticipantIDs: %@\n}", v54, v61, self, v60, v59, v58, v57, v20, updated, v28, v32, v36, v40, v44, v48, v52);

  return v55;
}

- (NSString)participantDestinationID
{
  return (NSString *)objc_msgSend_prefixedURI(self->_participantDestinationURI, a2, v2, v3);
}

- (NSUUID)groupUUID
{
  return self->_groupUUID;
}

- (BOOL)isInitiator
{
  return self->_isInitiator;
}

- (unint64_t)participantIdentifier
{
  return self->_participantIdentifier;
}

- (unint64_t)participantUpdateType
{
  return self->_participantUpdateType;
}

- (NSData)participantData
{
  return self->_participantData;
}

- (NSData)clientContextData
{
  return self->_clientContextData;
}

- (NSDictionary)participantIDs
{
  return self->_participantIDs;
}

- (NSUUID)relaySessionID
{
  return self->_relaySessionID;
}

- (IDSURI)participantDestinationURI
{
  return self->_participantDestinationURI;
}

- (unint64_t)participantUpdateSubtype
{
  return self->_participantUpdateSubtype;
}

- (BOOL)fromServer
{
  return self->_fromServer;
}

- (NSDate)serverDate
{
  return self->_serverDate;
}

- (NSArray)members
{
  return self->_members;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantDestinationID, 0);
  objc_storeStrong((id *)&self->_relaySessionID, 0);
  objc_storeStrong((id *)&self->_participantIDs, 0);
  objc_storeStrong((id *)&self->_members, 0);
  objc_storeStrong((id *)&self->_clientContextData, 0);
  objc_storeStrong((id *)&self->_participantData, 0);
  objc_storeStrong((id *)&self->_serverDate, 0);
  objc_storeStrong((id *)&self->_participantDestinationURI, 0);
  objc_storeStrong((id *)&self->_groupUUID, 0);
}

@end