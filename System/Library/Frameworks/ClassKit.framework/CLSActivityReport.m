@interface CLSActivityReport
+ (BOOL)supportsSecureCoding;
- (CLSActivityReport)initWithCoder:(id)a3;
- (CLSActivityReportItem)primaryReportItem;
- (CLSAggregatedValue)progress;
- (CLSAggregatedValue)time;
- (NSArray)additionalReportItems;
- (NSString)contextAppBundleIdentifier;
- (NSString)contextID;
- (NSString)contextStableObjectID;
- (NSString)contextTitle;
- (NSString)contextTopic;
- (NSString)handoutAuthorizedObjectID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)handoutAttachmentType;
- (int64_t)compare:(id)a3;
- (int64_t)contextType;
- (void)add:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)scalarMultiply:(double)a3;
- (void)setAdditionalReportItems:(id)a3;
- (void)setContextAppBundleIdentifier:(id)a3;
- (void)setContextID:(id)a3;
- (void)setContextStableObjectID:(id)a3;
- (void)setContextTitle:(id)a3;
- (void)setContextTopic:(id)a3;
- (void)setContextType:(int64_t)a3;
- (void)setHandoutAttachmentType:(int)a3;
- (void)setHandoutAuthorizedObjectID:(id)a3;
- (void)setPrimaryReportItem:(id)a3;
- (void)setProgress:(id)a3;
- (void)setTime:(id)a3;
@end

@implementation CLSActivityReport

- (CLSActivityReport)initWithCoder:(id)a3
{
  id v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)CLSActivityReport;
  v6 = [(CLSActivityReport *)&v56 init];
  if (v6)
  {
    v6->_contextType = objc_msgSend_decodeIntegerForKey_(v4, v5, @"contextType");
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"contextTitle");
    if (v9) {
      v10 = (__CFString *)v9;
    }
    else {
      v10 = &stru_1F37A1D30;
    }
    v55 = v10;
    objc_storeStrong((id *)&v6->_contextTitle, v10);
    uint64_t v11 = objc_opt_class();
    uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"contextTopic");
    contextTopic = v6->_contextTopic;
    v6->_contextTopic = (NSString *)v13;

    uint64_t v15 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, @"contextAppBundleIdentifier");
    if (v17) {
      v18 = (__CFString *)v17;
    }
    else {
      v18 = &stru_1F37A1D30;
    }
    objc_storeStrong((id *)&v6->_contextAppBundleIdentifier, v18);
    uint64_t v19 = objc_opt_class();
    uint64_t v21 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, @"contextID");
    if (v21) {
      v22 = (__CFString *)v21;
    }
    else {
      v22 = &stru_1F37A1D30;
    }
    objc_storeStrong((id *)&v6->_contextID, v22);
    uint64_t v23 = objc_opt_class();
    uint64_t v25 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, @"contextStableObjectID");
    if (v25) {
      v26 = (__CFString *)v25;
    }
    else {
      v26 = &stru_1F37A1D30;
    }
    contextStableObjectID = v6->_contextStableObjectID;
    v6->_contextStableObjectID = &v26->isa;
    v28 = v26;

    uint64_t v29 = objc_opt_class();
    uint64_t v31 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v30, v29, @"time");
    time = v6->_time;
    v6->_time = (CLSAggregatedValue *)v31;

    uint64_t v33 = objc_opt_class();
    uint64_t v35 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v33, @"progress");
    progress = v6->_progress;
    v6->_progress = (CLSAggregatedValue *)v35;

    uint64_t v37 = objc_opt_class();
    uint64_t v39 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v38, v37, @"primaryReportItem");
    primaryReportItem = v6->_primaryReportItem;
    v6->_primaryReportItem = (CLSActivityReportItem *)v39;

    v41 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v42 = objc_opt_class();
    uint64_t v43 = objc_opt_class();
    v45 = objc_msgSend_setWithObjects_(v41, v44, v42, v43, 0);
    uint64_t v47 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v46, (uint64_t)v45, @"additionalReportItems");
    additionalReportItems = v6->_additionalReportItems;
    v6->_additionalReportItems = (NSArray *)v47;

    v6->_handoutAttachmentType = objc_msgSend_decodeInt32ForKey_(v4, v49, @"handoutAttachmentType");
    uint64_t v50 = objc_opt_class();
    uint64_t v52 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v51, v50, @"handoutAuthorizedObjectID");
    handoutAuthorizedObjectID = v6->_handoutAuthorizedObjectID;
    v6->_handoutAuthorizedObjectID = (NSString *)v52;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t contextType = self->_contextType;
  id v17 = a3;
  objc_msgSend_encodeInteger_forKey_(v17, v5, contextType, @"contextType");
  objc_msgSend_encodeObject_forKey_(v17, v6, (uint64_t)self->_contextTitle, @"contextTitle");
  objc_msgSend_encodeObject_forKey_(v17, v7, (uint64_t)self->_contextTopic, @"contextTopic");
  objc_msgSend_encodeObject_forKey_(v17, v8, (uint64_t)self->_contextAppBundleIdentifier, @"contextAppBundleIdentifier");
  objc_msgSend_encodeObject_forKey_(v17, v9, (uint64_t)self->_contextID, @"contextID");
  objc_msgSend_encodeObject_forKey_(v17, v10, (uint64_t)self->_contextStableObjectID, @"contextStableObjectID");
  objc_msgSend_encodeObject_forKey_(v17, v11, (uint64_t)self->_time, @"time");
  objc_msgSend_encodeObject_forKey_(v17, v12, (uint64_t)self->_progress, @"progress");
  objc_msgSend_encodeObject_forKey_(v17, v13, (uint64_t)self->_primaryReportItem, @"primaryReportItem");
  objc_msgSend_encodeObject_forKey_(v17, v14, (uint64_t)self->_additionalReportItems, @"additionalReportItems");
  objc_msgSend_encodeInteger_forKey_(v17, v15, self->_handoutAttachmentType, @"handoutAttachmentType");
  objc_msgSend_encodeObject_forKey_(v17, v16, (uint64_t)self->_handoutAuthorizedObjectID, @"handoutAuthorizedObjectID");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v54.receiver = self;
  v54.super_class = (Class)CLSActivityReport;
  id v4 = [(CLSReportItem *)&v54 copyWithZone:a3];
  uint64_t v7 = objc_msgSend_contextType(self, v5, v6);
  objc_msgSend_setContextType_(v4, v8, v7);
  uint64_t v11 = objc_msgSend_contextTopic(self, v9, v10);
  objc_msgSend_setContextTopic_(v4, v12, (uint64_t)v11);

  uint64_t v15 = objc_msgSend_contextTitle(self, v13, v14);
  objc_msgSend_setContextTitle_(v4, v16, (uint64_t)v15);

  uint64_t v19 = objc_msgSend_contextAppBundleIdentifier(self, v17, v18);
  objc_msgSend_setContextAppBundleIdentifier_(v4, v20, (uint64_t)v19);

  uint64_t v23 = objc_msgSend_contextID(self, v21, v22);
  objc_msgSend_setContextID_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_contextStableObjectID(self, v25, v26);
  objc_msgSend_setContextStableObjectID_(v4, v28, (uint64_t)v27);

  uint64_t v31 = objc_msgSend_time(self, v29, v30);
  objc_msgSend_setTime_(v4, v32, (uint64_t)v31);

  uint64_t v35 = objc_msgSend_progress(self, v33, v34);
  objc_msgSend_setProgress_(v4, v36, (uint64_t)v35);

  uint64_t v39 = objc_msgSend_primaryReportItem(self, v37, v38);
  objc_msgSend_setPrimaryReportItem_(v4, v40, (uint64_t)v39);

  uint64_t v43 = objc_msgSend_additionalReportItems(self, v41, v42);
  objc_msgSend_setAdditionalReportItems_(v4, v44, (uint64_t)v43);

  uint64_t v47 = objc_msgSend_handoutAttachmentType(self, v45, v46);
  objc_msgSend_setHandoutAttachmentType_(v4, v48, v47);
  v51 = objc_msgSend_handoutAuthorizedObjectID(self, v49, v50);
  objc_msgSend_setHandoutAuthorizedObjectID_(v4, v52, (uint64_t)v51);

  return v4;
}

- (int64_t)compare:(id)a3
{
  id v4 = objc_msgSend_convertToItemCompatibleWithItem_copyIfSameType_(a3, a2, (uint64_t)self, 0);
  primaryReportItem = self->_primaryReportItem;
  v8 = objc_msgSend_primaryReportItem(v4, v6, v7);
  int64_t v10 = objc_msgSend_compare_(primaryReportItem, v9, (uint64_t)v8);

  return v10;
}

- (void)add:(id)a3
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_time(self, v5, v6);
  int64_t v10 = objc_msgSend_time(v4, v8, v9);
  objc_msgSend_add_(v7, v11, (uint64_t)v10);

  uint64_t v14 = objc_msgSend_progress(self, v12, v13);
  id v17 = objc_msgSend_progress(v4, v15, v16);
  objc_msgSend_add_(v14, v18, (uint64_t)v17);

  uint64_t v21 = objc_msgSend_primaryReportItem(self, v19, v20);
  v24 = objc_msgSend_primaryReportItem(v4, v22, v23);
  objc_msgSend_add_(v21, v25, (uint64_t)v24);

  uint64_t v26 = objc_opt_new();
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  uint64_t v29 = objc_msgSend_additionalReportItems(self, v27, v28);
  uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v77, v82, 16);
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v78;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v78 != v33) {
          objc_enumerationMutation(v29);
        }
        uint64_t v35 = *(void **)(*((void *)&v77 + 1) + 8 * v34);
        v36 = (void *)MEMORY[0x1E01A0360]();
        uint64_t v39 = objc_msgSend_copy(v35, v37, v38);
        uint64_t v42 = objc_msgSend_identifier(v35, v40, v41);
        objc_msgSend_setObject_forKeyedSubscript_(v26, v43, (uint64_t)v39, v42);

        ++v34;
      }
      while (v32 != v34);
      uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v44, (uint64_t)&v77, v82, 16);
    }
    while (v32);
  }

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  v72 = v4;
  uint64_t v47 = objc_msgSend_additionalReportItems(v4, v45, v46);
  uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v48, (uint64_t)&v73, v81, 16);
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v74;
    do
    {
      uint64_t v52 = 0;
      do
      {
        if (*(void *)v74 != v51) {
          objc_enumerationMutation(v47);
        }
        v53 = *(void **)(*((void *)&v73 + 1) + 8 * v52);
        objc_super v54 = (void *)MEMORY[0x1E01A0360]();
        v57 = objc_msgSend_identifier(v53, v55, v56);
        v59 = objc_msgSend_objectForKeyedSubscript_(v26, v58, (uint64_t)v57);

        if (v59)
        {
          objc_msgSend_add_(v59, v60, (uint64_t)v53);
        }
        else
        {
          v62 = objc_msgSend_copy(v53, v60, v61);
          v65 = objc_msgSend_identifier(v53, v63, v64);
          objc_msgSend_setObject_forKeyedSubscript_(v26, v66, (uint64_t)v62, v65);
        }
        ++v52;
      }
      while (v50 != v52);
      uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v67, (uint64_t)&v73, v81, 16);
    }
    while (v50);
  }

  v70 = objc_msgSend_allValues(v26, v68, v69);
  objc_msgSend_setAdditionalReportItems_(self, v71, (uint64_t)v70);
}

- (void)scalarMultiply:(double)a3
{
  uint64_t v6 = objc_msgSend_time(self, a2, v3);
  objc_msgSend_scalarMultiply_(v6, v7, v8, a3);

  uint64_t v11 = objc_msgSend_progress(self, v9, v10);
  objc_msgSend_scalarMultiply_(v11, v12, v13, a3);

  uint64_t v16 = objc_msgSend_primaryReportItem(self, v14, v15);
  objc_msgSend_scalarMultiply_(v16, v17, v18, a3);

  uint64_t v21 = objc_msgSend_additionalReportItems(self, v19, v20);
  objc_msgSend_multiply_withScalar_(CLSReportItem, v22, (uint64_t)v21, a3);
  id v24 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setAdditionalReportItems_(self, v23, (uint64_t)v24);
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v4 = objc_opt_class();
  uint64_t v6 = objc_msgSend_initWithFormat_(v3, v5, @"<%@ %p", v4, self);
  unint64_t v9 = objc_msgSend_contextType(self, v7, v8);
  uint64_t v10 = DefaultNameFromContextType(v9);
  objc_msgSend_appendFormat_(v6, v11, @" %@: %@", @"contextType", v10);

  uint64_t v14 = objc_msgSend_contextTopic(self, v12, v13);
  objc_msgSend_appendFormat_(v6, v15, @" %@: %@", @"contextTopic", v14);

  uint64_t v18 = objc_msgSend_contextTitle(self, v16, v17);
  objc_msgSend_appendFormat_(v6, v19, @" %@: %@", @"contextTitle", v18);

  uint64_t v22 = objc_msgSend_contextAppBundleIdentifier(self, v20, v21);
  objc_msgSend_appendFormat_(v6, v23, @" %@: %@", @"contextAppBundleIdentifier", v22);

  uint64_t v26 = objc_msgSend_contextID(self, v24, v25);
  objc_msgSend_appendFormat_(v6, v27, @" %@: %@", @"contextID", v26);

  uint64_t v30 = objc_msgSend_contextStableObjectID(self, v28, v29);
  objc_msgSend_appendFormat_(v6, v31, @" %@: %@", @"contextStableObjectID", v30);

  uint64_t v34 = objc_msgSend_time(self, v32, v33);
  objc_msgSend_appendFormat_(v6, v35, @" %@: %@", @"time", v34);

  uint64_t v38 = objc_msgSend_progress(self, v36, v37);
  objc_msgSend_appendFormat_(v6, v39, @" %@: %@", @"progress", v38);

  uint64_t v42 = objc_msgSend_primaryReportItem(self, v40, v41);

  if (v42)
  {
    v45 = objc_msgSend_primaryReportItem(self, v43, v44);
    objc_msgSend_appendFormat_(v6, v46, @" %@: %@", @"primaryReportItem", v45);
  }
  uint64_t v47 = objc_msgSend_additionalReportItems(self, v43, v44);
  uint64_t v50 = objc_msgSend_count(v47, v48, v49);

  if (v50)
  {
    v53 = objc_msgSend_additionalReportItems(self, v51, v52);
    objc_msgSend_appendFormat_(v6, v54, @" %@: %@", @"additionalReportItems", v53);
  }
  unsigned int v55 = objc_msgSend_handoutAttachmentType(self, v51, v52);
  v57 = NSStringFromHandoutAttachmentType(v55, v56);
  objc_msgSend_appendFormat_(v6, v58, @" %@: %@", @"handoutAttachmentType", v57);

  uint64_t v61 = objc_msgSend_handoutAuthorizedObjectID(self, v59, v60);
  objc_msgSend_appendFormat_(v6, v62, @" %@: %@", @"handoutAuthorizedObjectID", v61);

  objc_msgSend_appendString_(v6, v63, @">");

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  v88.receiver = self;
  v88.super_class = (Class)CLSActivityReport;
  id v3 = [(CLSReportItem *)&v88 dictionaryRepresentation];
  unint64_t v6 = objc_msgSend_contextType(self, v4, v5);
  uint64_t v7 = DefaultNameFromContextType(v6);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)v7, @"contextType");

  uint64_t v11 = objc_msgSend_contextTopic(self, v9, v10);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v12, (uint64_t)v11, @"contextTopic");

  uint64_t v15 = objc_msgSend_contextTitle(self, v13, v14);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v16, (uint64_t)v15, @"contextTitle");

  uint64_t v19 = objc_msgSend_contextAppBundleIdentifier(self, v17, v18);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v20, (uint64_t)v19, @"contextAppBundleIdentifier");

  uint64_t v23 = objc_msgSend_contextID(self, v21, v22);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v24, (uint64_t)v23, @"contextID");

  v27 = objc_msgSend_contextStableObjectID(self, v25, v26);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v28, (uint64_t)v27, @"contextStableObjectID");

  uint64_t v31 = objc_msgSend_time(self, v29, v30);
  uint64_t v34 = objc_msgSend_dictionaryRepresentation(v31, v32, v33);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v35, (uint64_t)v34, @"time");

  uint64_t v38 = objc_msgSend_progress(self, v36, v37);
  uint64_t v41 = objc_msgSend_dictionaryRepresentation(v38, v39, v40);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v42, (uint64_t)v41, @"progress");

  v45 = objc_msgSend_handoutAuthorizedObjectID(self, v43, v44);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v46, (uint64_t)v45, @"handoutAuthorizedObjectID");

  unsigned int v49 = objc_msgSend_handoutAttachmentType(self, v47, v48);
  uint64_t v51 = NSStringFromHandoutAttachmentType(v49, v50);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v52, (uint64_t)v51, @"handoutAttachmentType");

  unsigned int v55 = objc_msgSend_primaryReportItem(self, v53, v54);
  v58 = objc_msgSend_dictionaryRepresentation(v55, v56, v57);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v59, (uint64_t)v58, @"primaryReportItem");

  v62 = objc_msgSend_additionalReportItems(self, v60, v61);
  uint64_t v65 = objc_msgSend_count(v62, v63, v64);

  if (v65)
  {
    v66 = objc_opt_new();
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    uint64_t v69 = objc_msgSend_additionalReportItems(self, v67, v68, 0);
    uint64_t v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v70, (uint64_t)&v84, v89, 16);
    if (v71)
    {
      uint64_t v72 = v71;
      uint64_t v73 = *(void *)v85;
      do
      {
        for (uint64_t i = 0; i != v72; ++i)
        {
          if (*(void *)v85 != v73) {
            objc_enumerationMutation(v69);
          }
          long long v75 = *(void **)(*((void *)&v84 + 1) + 8 * i);
          long long v76 = (void *)MEMORY[0x1E01A0360]();
          long long v79 = objc_msgSend_dictionaryRepresentation(v75, v77, v78);
          objc_msgSend_addObject_(v66, v80, (uint64_t)v79);
        }
        uint64_t v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v81, (uint64_t)&v84, v89, 16);
      }
      while (v72);
    }

    objc_msgSend_setObject_forKeyedSubscript_(v3, v82, (uint64_t)v66, @"additionalReportItems");
  }

  return v3;
}

- (int64_t)contextType
{
  return self->_contextType;
}

- (void)setContextType:(int64_t)a3
{
  self->_int64_t contextType = a3;
}

- (NSString)contextTopic
{
  return self->_contextTopic;
}

- (void)setContextTopic:(id)a3
{
}

- (NSString)contextTitle
{
  return self->_contextTitle;
}

- (void)setContextTitle:(id)a3
{
}

- (NSString)contextAppBundleIdentifier
{
  return self->_contextAppBundleIdentifier;
}

- (void)setContextAppBundleIdentifier:(id)a3
{
}

- (NSString)contextID
{
  return self->_contextID;
}

- (void)setContextID:(id)a3
{
}

- (CLSAggregatedValue)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
}

- (CLSAggregatedValue)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (CLSActivityReportItem)primaryReportItem
{
  return self->_primaryReportItem;
}

- (void)setPrimaryReportItem:(id)a3
{
}

- (NSArray)additionalReportItems
{
  return self->_additionalReportItems;
}

- (void)setAdditionalReportItems:(id)a3
{
}

- (NSString)contextStableObjectID
{
  return self->_contextStableObjectID;
}

- (void)setContextStableObjectID:(id)a3
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

- (NSString)handoutAuthorizedObjectID
{
  return self->_handoutAuthorizedObjectID;
}

- (void)setHandoutAuthorizedObjectID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handoutAuthorizedObjectID, 0);
  objc_storeStrong((id *)&self->_contextStableObjectID, 0);
  objc_storeStrong((id *)&self->_additionalReportItems, 0);
  objc_storeStrong((id *)&self->_primaryReportItem, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_contextAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_contextTitle, 0);

  objc_storeStrong((id *)&self->_contextTopic, 0);
}

@end