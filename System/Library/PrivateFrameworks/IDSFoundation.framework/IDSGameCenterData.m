@interface IDSGameCenterData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualTo:(id)a3;
- (BOOL)supportsFriendingViaPush;
- (IDSGameCenterData)initWithAssociationID:(id)a3 sharingState:(id)a4 lastUpdatedDate:(id)a5;
- (IDSGameCenterData)initWithAssociationID:(id)a3 sharingState:(id)a4 lastUpdatedDate:(id)a5 supportsFriending:(BOOL)a6;
- (IDSGameCenterData)initWithCoder:(id)a3;
- (NSDate)contactsLastUpdatedDate;
- (NSNumber)contactsSharingState;
- (NSString)contactsAssociationID;
- (id)compareAgainstData:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setContactsAssociationID:(id)a3;
- (void)setContactsLastUpdatedDate:(id)a3;
- (void)setContactsSharingState:(id)a3;
@end

@implementation IDSGameCenterData

- (IDSGameCenterData)initWithAssociationID:(id)a3 sharingState:(id)a4 lastUpdatedDate:(id)a5
{
  return (IDSGameCenterData *)objc_msgSend_initWithAssociationID_sharingState_lastUpdatedDate_supportsFriending_(self, a2, (uint64_t)a3, v5, a4, a5, 0);
}

- (IDSGameCenterData)initWithAssociationID:(id)a3 sharingState:(id)a4 lastUpdatedDate:(id)a5 supportsFriending:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IDSGameCenterData;
  v14 = [(IDSGameCenterData *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_contactsAssociationID, a3);
    objc_storeStrong((id *)&v15->_contactsSharingState, a4);
    objc_storeStrong((id *)&v15->_contactsLastUpdatedDate, a5);
    v15->_supportsFriendingViaPush = a6;
  }

  return v15;
}

- (id)compareAgainstData:(id)a3
{
  v4 = (IDSGameCenterData *)a3;
  v8 = v4;
  if (v4
    && (objc_msgSend_contactsLastUpdatedDate(v4, v5, v6, v7),
        v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    id v13 = objc_msgSend_contactsLastUpdatedDate(self, v10, v11, v12);

    objc_super v17 = v8;
    if (v13)
    {
      v18 = objc_msgSend_contactsLastUpdatedDate(self, v14, v15, v16);
      v22 = objc_msgSend_contactsLastUpdatedDate(v8, v19, v20, v21);
      uint64_t v25 = objc_msgSend_compare_(v18, v23, (uint64_t)v22, v24);

      if (v25 == -1) {
        objc_super v17 = v8;
      }
      else {
        objc_super v17 = self;
      }
    }
  }
  else
  {
    objc_super v17 = self;
  }
  v26 = v17;

  return v26;
}

- (id)description
{
  double v5 = NSString;
  uint64_t v6 = objc_msgSend_contactsAssociationID(self, a2, v2, v3);
  v10 = objc_msgSend_contactsSharingState(self, v7, v8, v9);
  uint64_t v14 = objc_msgSend_contactsLastUpdatedDate(self, v11, v12, v13);
  objc_super v17 = (void *)v14;
  if (self->_supportsFriendingViaPush) {
    objc_msgSend_stringWithFormat_(v5, v15, @"<IDSGameCenterData: %p; contactsAssociationID: %@ contactsSharingState: %@ contactsLastUpdatedDate: %@ supportsFriendingViaPush: %@>",
  }
      v16,
      self,
      v6,
      v10,
      v14,
      @"YES");
  else {
    objc_msgSend_stringWithFormat_(v5, v15, @"<IDSGameCenterData: %p; contactsAssociationID: %@ contactsSharingState: %@ contactsLastUpdatedDate: %@ supportsFriendingViaPush: %@>",
  }
      v16,
      self,
      v6,
      v10,
      v14,
  v18 = @"NO");

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char isEqualTo = objc_msgSend_isEqualTo_(self, v5, (uint64_t)v4, v6);
  }
  else {
    char isEqualTo = 0;
  }

  return isEqualTo;
}

- (BOOL)isEqualTo:(id)a3
{
  id v7 = a3;
  if (!v7) {
    goto LABEL_29;
  }
  uint64_t v11 = objc_msgSend_contactsAssociationID(self, v5, v6, v8);
  if (v11
    || (objc_msgSend_contactsAssociationID(v7, v9, v10, v12), (double v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v13 = objc_msgSend_contactsAssociationID(self, v9, v10, v12);
    if (!v13) {
      goto LABEL_26;
    }
    objc_super v17 = (void *)v13;
    uint64_t v18 = objc_msgSend_contactsAssociationID(v7, v14, v15, v16);
    if (!v18) {
      goto LABEL_25;
    }
    v22 = (void *)v18;
    v23 = objc_msgSend_contactsAssociationID(self, v19, v20, v21);
    v27 = objc_msgSend_contactsAssociationID(v7, v24, v25, v26);
    int isEqualToString = objc_msgSend_isEqualToString_(v23, v28, (uint64_t)v27, v29);

    if (v11)
    {

      if (!isEqualToString) {
        goto LABEL_29;
      }
    }
    else
    {

      if ((isEqualToString & 1) == 0) {
        goto LABEL_29;
      }
    }
  }
  uint64_t v11 = objc_msgSend_contactsSharingState(self, v9, v10, v12);
  if (v11
    || (objc_msgSend_contactsSharingState(v7, v31, v32, v33), (double v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v34 = objc_msgSend_contactsSharingState(self, v31, v32, v33);
    if (!v34) {
      goto LABEL_26;
    }
    objc_super v17 = (void *)v34;
    uint64_t v38 = objc_msgSend_contactsSharingState(v7, v35, v36, v37);
    if (!v38) {
      goto LABEL_25;
    }
    v42 = (void *)v38;
    v43 = objc_msgSend_contactsSharingState(self, v39, v40, v41);
    v47 = objc_msgSend_contactsSharingState(v7, v44, v45, v46);
    int isEqualToNumber = objc_msgSend_isEqualToNumber_(v43, v48, (uint64_t)v47, v49);

    if (v11)
    {

      if (!isEqualToNumber) {
        goto LABEL_29;
      }
    }
    else
    {

      if ((isEqualToNumber & 1) == 0) {
        goto LABEL_29;
      }
    }
  }
  uint64_t v11 = objc_msgSend_contactsLastUpdatedDate(self, v31, v32, v33);
  if (!v11)
  {
    double v3 = objc_msgSend_contactsLastUpdatedDate(v7, v51, v52, v53);
    if (!v3) {
      goto LABEL_32;
    }
  }
  uint64_t v54 = objc_msgSend_contactsLastUpdatedDate(self, v51, v52, v53);
  if (!v54)
  {
LABEL_26:
    if (v11) {

    }
    else {
    goto LABEL_29;
    }
  }
  objc_super v17 = (void *)v54;
  uint64_t v58 = objc_msgSend_contactsLastUpdatedDate(v7, v55, v56, v57);
  if (!v58)
  {
LABEL_25:

    goto LABEL_26;
  }
  v62 = (void *)v58;
  v63 = objc_msgSend_contactsLastUpdatedDate(self, v59, v60, v61);
  v67 = objc_msgSend_contactsLastUpdatedDate(v7, v64, v65, v66);
  int isEqualToDate = objc_msgSend_isEqualToDate_(v63, v68, (uint64_t)v67, v69);

  if (v11)
  {

    if (isEqualToDate) {
      goto LABEL_32;
    }
  }
  else
  {

    if (isEqualToDate)
    {
LABEL_32:
      int v73 = objc_msgSend_supportsFriendingViaPush(self, v51, v52, v53);
      int v71 = v73 ^ objc_msgSend_supportsFriendingViaPush(v7, v74, v75, v76) ^ 1;
      goto LABEL_30;
    }
  }
LABEL_29:
  LOBYTE(v71) = 0;
LABEL_30:

  return v71;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSGameCenterData)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  double v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, @"gs-contacts-association-id");
  uint64_t v9 = objc_opt_class();
  double v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, v11, @"gs-contacts-sharing-state");
  uint64_t v13 = objc_opt_class();
  double v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, v15, @"gs-contacts-last-updated");
  uint64_t v17 = objc_opt_class();
  uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, v19, @"gs-supports-friending-via-push");

  uint64_t v24 = objc_msgSend_BOOLValue(v20, v21, v22, v23);
  UpdatedDate_supportsFriending = (IDSGameCenterData *)objc_msgSend_initWithAssociationID_sharingState_lastUpdatedDate_supportsFriending_(self, v25, (uint64_t)v8, v26, v12, v16, v24);

  return UpdatedDate_supportsFriending;
}

- (void)encodeWithCoder:(id)a3
{
  contactsAssociationID = self->_contactsAssociationID;
  id v5 = a3;
  objc_msgSend_encodeObject_forKey_(v5, v6, (uint64_t)contactsAssociationID, v7, @"gs-contacts-association-id");
  objc_msgSend_encodeObject_forKey_(v5, v8, (uint64_t)self->_contactsSharingState, v9, @"gs-contacts-sharing-state");
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)self->_contactsLastUpdatedDate, v11, @"gs-contacts-last-updated");
  objc_msgSend_numberWithBool_(NSNumber, v12, self->_supportsFriendingViaPush, v13);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v14, (uint64_t)v16, v15, @"gs-supports-friending-via-push");
}

- (NSString)contactsAssociationID
{
  return self->_contactsAssociationID;
}

- (void)setContactsAssociationID:(id)a3
{
}

- (NSNumber)contactsSharingState
{
  return self->_contactsSharingState;
}

- (void)setContactsSharingState:(id)a3
{
}

- (NSDate)contactsLastUpdatedDate
{
  return self->_contactsLastUpdatedDate;
}

- (void)setContactsLastUpdatedDate:(id)a3
{
}

- (BOOL)supportsFriendingViaPush
{
  return self->_supportsFriendingViaPush;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsLastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_contactsSharingState, 0);
  objc_storeStrong((id *)&self->_contactsAssociationID, 0);
}

@end