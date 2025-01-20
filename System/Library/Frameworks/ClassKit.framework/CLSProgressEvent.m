@interface CLSProgressEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)validateObject:(id *)a3;
- (CLSActivityReportItem)activityItemInfo;
- (CLSProgressEvent)initWithAttachmentID:(id)a3 classID:(id)a4 handoutID:(id)a5 eventType:(int64_t)a6;
- (CLSProgressEvent)initWithCoder:(id)a3;
- (CLSRange)rangeInfo;
- (CLSTimeInterval)timeIntervalInfo;
- (NSString)activityID;
- (NSString)attachmentID;
- (NSString)classID;
- (NSString)handoutAuthorizedObjectID;
- (NSString)handoutID;
- (NSString)objectIDPath;
- (NSString)primaryActivityItemIdentifier;
- (NSString)recipientPersonID;
- (id)description;
- (id)dictionaryRepresentation;
- (int)handoutAttachmentType;
- (int64_t)contextType;
- (void)encodeWithCoder:(id)a3;
- (void)mergeWithObject:(id)a3;
- (void)setActivityID:(id)a3;
- (void)setActivityItemInfo:(id)a3;
- (void)setAppIdentifier:(id)a3;
- (void)setAttachmentID:(id)a3;
- (void)setClassID:(id)a3;
- (void)setContextType:(int64_t)a3;
- (void)setHandoutAttachmentType:(int)a3;
- (void)setHandoutAuthorizedObjectID:(id)a3;
- (void)setHandoutID:(id)a3;
- (void)setObjectIDPath:(id)a3;
- (void)setPrimaryActivityItemIdentifier:(id)a3;
- (void)setRangeInfo:(id)a3;
- (void)setRecipientPersonID:(id)a3;
- (void)setTimeIntervalInfo:(id)a3;
@end

@implementation CLSProgressEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSProgressEvent)initWithAttachmentID:(id)a3 classID:(id)a4 handoutID:(id)a5 eventType:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CLSProgressEvent;
  v14 = [(CLSInsightEvent *)&v17 initWithType:a6];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_attachmentID, a3);
    objc_storeStrong((id *)&v15->_classID, a4);
    objc_storeStrong((id *)&v15->_handoutID, a5);
  }

  return v15;
}

- (BOOL)validateObject:(id *)a3
{
  v31.receiver = self;
  v31.super_class = (Class)CLSProgressEvent;
  BOOL v5 = -[CLSInsightEvent validateObject:](&v31, sel_validateObject_);
  if (v5)
  {
    if (objc_msgSend_length(self->_attachmentID, v6, v7))
    {
      if (objc_msgSend_length(self->_classID, v8, v9))
      {
        if (objc_msgSend_length(self->_handoutID, v10, v11))
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        id v12 = NSString;
        v22 = (void *)MEMORY[0x1E4F28B50];
        uint64_t v23 = objc_opt_class();
        v16 = objc_msgSend_bundleForClass_(v22, v24, v23);
        objc_msgSend_localizedStringForKey_value_table_(v16, v25, @"ERROR_DESCRIPTION_ATTACHMENT_EVENT_NO_HANDOUT_ID", &stru_1F37A1D30, @"ClassKit");
      }
      else
      {
        id v12 = NSString;
        v18 = (void *)MEMORY[0x1E4F28B50];
        uint64_t v19 = objc_opt_class();
        v16 = objc_msgSend_bundleForClass_(v18, v20, v19);
        objc_msgSend_localizedStringForKey_value_table_(v16, v21, @"ERROR_DESCRIPTION_ATTACHMENT_EVENT_NO_CLASS_ID", &stru_1F37A1D30, @"ClassKit");
      }
    }
    else
    {
      id v12 = NSString;
      id v13 = (void *)MEMORY[0x1E4F28B50];
      uint64_t v14 = objc_opt_class();
      v16 = objc_msgSend_bundleForClass_(v13, v15, v14);
      objc_msgSend_localizedStringForKey_value_table_(v16, v17, @"ERROR_DESCRIPTION_ATTACHMENT_EVENT_NO_ATTACHMENT_ID", &stru_1F37A1D30, @"ClassKit");
    v26 = };
    v28 = objc_msgSend_stringWithFormat_(v12, v27, (uint64_t)v26);

    objc_msgSend_cls_assignError_code_errorObject_description_(MEMORY[0x1E4F28C58], v29, (uint64_t)a3, 2, self, v28);
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (CLSProgressEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)CLSProgressEvent;
  BOOL v5 = [(CLSInsightEvent *)&v53 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"activityID");
    activityID = v5->_activityID;
    v5->_activityID = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"attachmentID");
    attachmentID = v5->_attachmentID;
    v5->_attachmentID = (NSString *)v12;

    uint64_t v14 = objc_opt_class();
    uint64_t v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, @"classID");
    classID = v5->_classID;
    v5->_classID = (NSString *)v16;

    uint64_t v18 = objc_opt_class();
    uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, @"handoutID");
    handoutID = v5->_handoutID;
    v5->_handoutID = (NSString *)v20;

    uint64_t v22 = objc_opt_class();
    uint64_t v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, @"recipientPersonID");
    recipientPersonID = v5->_recipientPersonID;
    v5->_recipientPersonID = (NSString *)v24;

    v5->_handoutAttachmentType = objc_msgSend_decodeIntegerForKey_(v4, v26, @"handoutAttachmentType");
    v5->_contextType = objc_msgSend_decodeIntegerForKey_(v4, v27, @"contextType");
    uint64_t v28 = objc_opt_class();
    uint64_t v30 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v29, v28, @"objectIDPath");
    objectIDPath = v5->_objectIDPath;
    v5->_objectIDPath = (NSString *)v30;

    uint64_t v32 = objc_opt_class();
    uint64_t v34 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v33, v32, @"handoutAuthorizedObjectID");
    handoutAuthorizedObjectID = v5->_handoutAuthorizedObjectID;
    v5->_handoutAuthorizedObjectID = (NSString *)v34;

    uint64_t v36 = objc_opt_class();
    uint64_t v38 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v37, v36, @"activityItemInfo");
    activityItemInfo = v5->_activityItemInfo;
    v5->_activityItemInfo = (CLSActivityReportItem *)v38;

    uint64_t v40 = objc_opt_class();
    uint64_t v42 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v41, v40, @"rangeInfo");
    rangeInfo = v5->_rangeInfo;
    v5->_rangeInfo = (CLSRange *)v42;

    uint64_t v44 = objc_opt_class();
    uint64_t v46 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v45, v44, @"timeIntervalInfo");
    timeIntervalInfo = v5->_timeIntervalInfo;
    v5->_timeIntervalInfo = (CLSTimeInterval *)v46;

    uint64_t v48 = objc_opt_class();
    uint64_t v50 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v49, v48, @"primaryActivityItemIdentifier");
    primaryActivityItemIdentifier = v5->_primaryActivityItemIdentifier;
    v5->_primaryActivityItemIdentifier = (NSString *)v50;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CLSProgressEvent;
  id v4 = a3;
  [(CLSInsightEvent *)&v18 encodeWithCoder:v4];
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_activityID, @"activityID", v18.receiver, v18.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_attachmentID, @"attachmentID");
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_classID, @"classID");
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_handoutID, @"handoutID");
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)self->_recipientPersonID, @"recipientPersonID");
  objc_msgSend_encodeInteger_forKey_(v4, v10, self->_handoutAttachmentType, @"handoutAttachmentType");
  objc_msgSend_encodeInteger_forKey_(v4, v11, self->_contextType, @"contextType");
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)self->_objectIDPath, @"objectIDPath");
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)self->_handoutAuthorizedObjectID, @"handoutAuthorizedObjectID");
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)self->_activityItemInfo, @"activityItemInfo");
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)self->_rangeInfo, @"rangeInfo");
  objc_msgSend_encodeObject_forKey_(v4, v16, (uint64_t)self->_timeIntervalInfo, @"timeIntervalInfo");
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)self->_primaryActivityItemIdentifier, @"primaryActivityItemIdentifier");
}

- (id)dictionaryRepresentation
{
  v30.receiver = self;
  v30.super_class = (Class)CLSProgressEvent;
  v3 = [(CLSInsightEvent *)&v30 dictionaryRepresentation];
  objc_msgSend_setObject_forKeyedSubscript_(v3, v4, (uint64_t)self->_activityID, @"activityID");
  objc_msgSend_setObject_forKeyedSubscript_(v3, v5, (uint64_t)self->_attachmentID, @"attachmentID");
  objc_msgSend_setObject_forKeyedSubscript_(v3, v6, (uint64_t)self->_classID, @"classID");
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, (uint64_t)self->_handoutID, @"handoutID");
  objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)self->_recipientPersonID, @"recipientPersonID");
  uint64_t v10 = NSStringFromHandoutAttachmentType(self->_handoutAttachmentType, v9);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v11, (uint64_t)v10, @"handoutAttachmentType");

  uint64_t v12 = DefaultNameFromContextType(self->_contextType);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v13, (uint64_t)v12, @"contextType");

  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)self->_objectIDPath, @"objectIDPath");
  objc_msgSend_setObject_forKeyedSubscript_(v3, v15, (uint64_t)self->_handoutAuthorizedObjectID, @"handoutAuthorizedObjectID");
  objc_super v18 = objc_msgSend_dictionaryRepresentation(self->_activityItemInfo, v16, v17);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v19, (uint64_t)v18, @"activityItemInfo");

  uint64_t v22 = objc_msgSend_dictionaryRepresentation(self->_rangeInfo, v20, v21);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v23, (uint64_t)v22, @"rangeInfo");

  v26 = objc_msgSend_dictionaryRepresentation(self->_timeIntervalInfo, v24, v25);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v27, (uint64_t)v26, @"timeIntervalInfo");

  objc_msgSend_setObject_forKeyedSubscript_(v3, v28, (uint64_t)self->_primaryActivityItemIdentifier, @"primaryActivityItemIdentifier");

  return v3;
}

- (void)mergeWithObject:(id)a3
{
  v22[13] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLSProgressEvent;
  [(CLSInsightEvent *)&v20 mergeWithObject:v4];
  v22[0] = @"activityID";
  v22[1] = @"attachmentID";
  v22[2] = @"classID";
  v22[3] = @"handoutID";
  v22[4] = @"recipientPersonID";
  v22[5] = @"handoutAttachmentType";
  v22[6] = @"contextType";
  v22[7] = @"objectIDPath";
  v22[8] = @"handoutAuthorizedObjectID";
  v22[9] = @"activityItemInfo";
  v22[10] = @"rangeInfo";
  v22[11] = @"timeIntervalInfo";
  v22[12] = @"primaryActivityItemIdentifier";
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v5, (uint64_t)v22, 13);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v16, v21, 16);
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend_valueForKey_(v4, v9, v13, (void)v16);
        objc_msgSend_setValue_forKey_(self, v15, (uint64_t)v14, v13);
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v16, v21, 16);
    }
    while (v10);
  }
}

- (void)setAppIdentifier:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  uint64_t v7 = objc_msgSend_appIdentifier(self, v5, v6);
  if (v4 | v7)
  {
    uint64_t v10 = (void *)v7;
    uint64_t v11 = objc_msgSend_appIdentifier(self, v8, v9);
    uint64_t v14 = v11;
    if (v4 && v11)
    {
      v15 = objc_msgSend_appIdentifier(self, v12, v13);
      char isEqualToString = objc_msgSend_isEqualToString_(v15, v16, v4);

      if (isEqualToString) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    objc_super v20 = objc_msgSend_copy((void *)v4, v18, v19);
    v21.receiver = self;
    v21.super_class = (Class)CLSProgressEvent;
    [(CLSObject *)&v21 setAppIdentifier:v20];
  }
LABEL_8:
}

- (id)description
{
  v26.receiver = self;
  v26.super_class = (Class)CLSProgressEvent;
  v3 = [(CLSInsightEvent *)&v26 description];
  uint64_t v6 = objc_msgSend_mutableCopy(v3, v4, v5);

  objc_msgSend_appendFormat_(v6, v7, @" (%@: %@)", @"activityID", self->_activityID);
  objc_msgSend_appendFormat_(v6, v8, @" (%@: %@)", @"attachmentID", self->_attachmentID);
  objc_msgSend_appendFormat_(v6, v9, @" (%@: %@)", @"classID", self->_classID);
  objc_msgSend_appendFormat_(v6, v10, @" (%@: %@)", @"handoutID", self->_handoutID);
  objc_msgSend_appendFormat_(v6, v11, @" (%@: %@)", @"recipientPersonID", self->_recipientPersonID);
  uint64_t v13 = NSStringFromHandoutAttachmentType(self->_handoutAttachmentType, v12);
  objc_msgSend_appendFormat_(v6, v14, @" (%@: %@)", @"handoutAttachmentType", v13);

  unint64_t contextType = self->_contextType;
  if (contextType)
  {
    long long v17 = DefaultNameFromContextType(contextType);
    objc_msgSend_appendFormat_(v6, v18, @" (%@: %@)", @"contextType", v17);
  }
  objectIDPath = self->_objectIDPath;
  if (objectIDPath) {
    objc_msgSend_appendFormat_(v6, v15, @" (%@: %@)", @"objectIDPath", objectIDPath);
  }
  handoutAuthorizedObjectID = self->_handoutAuthorizedObjectID;
  if (handoutAuthorizedObjectID) {
    objc_msgSend_appendFormat_(v6, v15, @" (%@: %@)", @"handoutAuthorizedObjectID", handoutAuthorizedObjectID);
  }
  activityItemInfo = self->_activityItemInfo;
  if (activityItemInfo) {
    objc_msgSend_appendFormat_(v6, v15, @" (%@: %@)", @"activityItemInfo", activityItemInfo);
  }
  rangeInfo = self->_rangeInfo;
  if (rangeInfo) {
    objc_msgSend_appendFormat_(v6, v15, @" (%@: %@)", @"rangeInfo", rangeInfo);
  }
  timeIntervalInfo = self->_timeIntervalInfo;
  if (timeIntervalInfo) {
    objc_msgSend_appendFormat_(v6, v15, @" (%@: %@)", @"timeIntervalInfo", timeIntervalInfo);
  }
  primaryActivityItemIdentifier = self->_primaryActivityItemIdentifier;
  if (primaryActivityItemIdentifier) {
    objc_msgSend_appendFormat_(v6, v15, @" (%@: %@)", @"primaryActivityItemIdentifier", primaryActivityItemIdentifier);
  }

  return v6;
}

- (NSString)attachmentID
{
  return self->_attachmentID;
}

- (void)setAttachmentID:(id)a3
{
}

- (NSString)classID
{
  return self->_classID;
}

- (void)setClassID:(id)a3
{
}

- (NSString)handoutID
{
  return self->_handoutID;
}

- (void)setHandoutID:(id)a3
{
}

- (NSString)recipientPersonID
{
  return self->_recipientPersonID;
}

- (void)setRecipientPersonID:(id)a3
{
}

- (int)handoutAttachmentType
{
  return self->_handoutAttachmentType;
}

- (void)setHandoutAttachmentType:(int)a3
{
  self->_handoutAttachmentType = a3;
}

- (int64_t)contextType
{
  return self->_contextType;
}

- (void)setContextType:(int64_t)a3
{
  self->_unint64_t contextType = a3;
}

- (NSString)objectIDPath
{
  return self->_objectIDPath;
}

- (void)setObjectIDPath:(id)a3
{
}

- (NSString)handoutAuthorizedObjectID
{
  return self->_handoutAuthorizedObjectID;
}

- (void)setHandoutAuthorizedObjectID:(id)a3
{
}

- (CLSActivityReportItem)activityItemInfo
{
  return self->_activityItemInfo;
}

- (void)setActivityItemInfo:(id)a3
{
}

- (CLSRange)rangeInfo
{
  return self->_rangeInfo;
}

- (void)setRangeInfo:(id)a3
{
}

- (CLSTimeInterval)timeIntervalInfo
{
  return self->_timeIntervalInfo;
}

- (void)setTimeIntervalInfo:(id)a3
{
}

- (NSString)primaryActivityItemIdentifier
{
  return self->_primaryActivityItemIdentifier;
}

- (void)setPrimaryActivityItemIdentifier:(id)a3
{
}

- (NSString)activityID
{
  return self->_activityID;
}

- (void)setActivityID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityID, 0);
  objc_storeStrong((id *)&self->_primaryActivityItemIdentifier, 0);
  objc_storeStrong((id *)&self->_timeIntervalInfo, 0);
  objc_storeStrong((id *)&self->_rangeInfo, 0);
  objc_storeStrong((id *)&self->_activityItemInfo, 0);
  objc_storeStrong((id *)&self->_handoutAuthorizedObjectID, 0);
  objc_storeStrong((id *)&self->_objectIDPath, 0);
  objc_storeStrong((id *)&self->_recipientPersonID, 0);
  objc_storeStrong((id *)&self->_handoutID, 0);
  objc_storeStrong((id *)&self->_classID, 0);

  objc_storeStrong((id *)&self->_attachmentID, 0);
}

@end