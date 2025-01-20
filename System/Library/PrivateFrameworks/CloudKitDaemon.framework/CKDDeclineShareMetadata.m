@interface CKDDeclineShareMetadata
- (CKRecordID)shareRecordID;
- (CKRoughlyEquivalentProperties)equivalencyProperties;
- (NSString)participantID;
- (NSURL)shareURL;
- (void)setParticipantID:(id)a3;
- (void)setShareRecordID:(id)a3;
- (void)setShareURL:(id)a3;
@end

@implementation CKDDeclineShareMetadata

- (CKRoughlyEquivalentProperties)equivalencyProperties
{
  v3 = objc_opt_new();
  v6 = objc_msgSend_shareURL(self, v4, v5);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, (uint64_t)v6, @"shareURL");

  v10 = objc_msgSend_participantID(self, v8, v9);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v11, (uint64_t)v10, @"participantID");

  v14 = objc_msgSend_shareRecordID(self, v12, v13);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v15, (uint64_t)v14, @"shareRecordID");

  v18 = objc_msgSend_properties(v3, v16, v17);

  return (CKRoughlyEquivalentProperties *)v18;
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (void)setShareURL:(id)a3
{
}

- (CKRecordID)shareRecordID
{
  return self->_shareRecordID;
}

- (void)setShareRecordID:(id)a3
{
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_shareRecordID, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
}

@end