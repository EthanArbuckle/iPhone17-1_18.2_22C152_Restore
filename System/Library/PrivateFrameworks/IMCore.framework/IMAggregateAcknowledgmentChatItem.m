@interface IMAggregateAcknowledgmentChatItem
- (BOOL)canDelete;
- (BOOL)includesFromMe;
- (BOOL)includesMultiple;
- (BOOL)isEqual:(id)a3;
- (BOOL)latestIsFromMe;
- (BOOL)supportsCommunicationSafety;
- (IMMessageAcknowledgmentChatItem)fromMeAcknowledgement;
- (IMTapback)latestTapback;
- (NSArray)acknowledgments;
- (id)_initWithAcknowledgments:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation IMAggregateAcknowledgmentChatItem

- (BOOL)includesFromMe
{
  return self->_fromMeAcknowledgement != 0;
}

- (id)_initWithAcknowledgments:(id)a3
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!objc_msgSend_count(v4, v5, v6, v7))
  {
    id v11 = v4;
    v12 = NSString;
    uint64_t v13 = IMFileLocationTrimFileName();
    v16 = objc_msgSend_stringWithFormat_(NSString, v14, @"acknowledgments array must be nonempty", v15);
    v19 = objc_msgSend_stringWithFormat_(v12, v17, @"Unexpected false '%@' in %s at %s:%d. %@", v18, @"acknowledgments.count > 0", "-[IMAggregateAcknowledgmentChatItem _initWithAcknowledgments:]", v13, 5220, v16);

    v20 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v20)
    {
      v20(v19);
    }
    else if (IMOSLoggingEnabled())
    {
      v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v19;
        _os_log_impl(&dword_1A4AF7000, v21, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
      }
    }
    id v4 = v11;
  }
  v89 = v4;
  v90 = objc_msgSend_lastObject(v4, v8, v9, v10);
  v25 = objc_msgSend__item(v90, v22, v23, v24);
  v29 = objc_msgSend_sender(v90, v26, v27, v28);
  uint64_t v31 = objc_msgSend__initWithItem_sender_(self, v30, (uint64_t)v25, (uint64_t)v29);

  if (v31)
  {
    uint64_t v35 = objc_msgSend_copy(v89, v32, v33, v34);
    v36 = *(void **)(v31 + 168);
    *(void *)(v31 + 168) = v35;

    uint64_t v40 = objc_msgSend_parentMessageIsFromMe(v90, v37, v38, v39);
    objc_msgSend__setParentMessageIsFromMe_((void *)v31, v41, v40, v42);
    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id obj = *(id *)(v31 + 168);
    uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v43, (uint64_t)&v93, (uint64_t)v101, 16);
    if (v47)
    {
      uint64_t v48 = *(void *)v94;
      do
      {
        for (uint64_t i = 0; i != v47; ++i)
        {
          if (*(void *)v94 != v48) {
            objc_enumerationMutation(obj);
          }
          v50 = *(void **)(*((void *)&v93 + 1) + 8 * i);
          v51 = objc_msgSend_associatedMessageGUID((void *)v31, v44, v45, v46);
          v55 = objc_msgSend_associatedMessageGUID(v50, v52, v53, v54);
          char isEqualToString = objc_msgSend_isEqualToString_(v51, v56, (uint64_t)v55, v57);

          if ((isEqualToString & 1) == 0)
          {
            v62 = NSString;
            uint64_t v63 = IMFileLocationTrimFileName();
            v66 = objc_msgSend_stringWithFormat_(NSString, v64, @"all acknowledgments must have the same associated message", v65);
            v69 = objc_msgSend_stringWithFormat_(v62, v67, @"Unexpected false '%@' in %s at %s:%d. %@", v68, @"[self.associatedMessageGUID isEqualToString:acknowledgment.associatedMessageGUID]", "-[IMAggregateAcknowledgmentChatItem _initWithAcknowledgments:]", v63, 5227, v66);

            v70 = (void (*)(void *))IMGetAssertionFailureHandler();
            if (v70)
            {
              v70(v69);
            }
            else if (IMOSLoggingEnabled())
            {
              v71 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&buf[4] = v69;
                _os_log_impl(&dword_1A4AF7000, v71, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
              }
            }
          }
          if (objc_msgSend_isFromMe(v50, v59, v60, v61)) {
            objc_storeStrong((id *)(v31 + 176), v50);
          }
        }
        uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v44, (uint64_t)&v93, (uint64_t)v101, 16);
      }
      while (v47);
    }

    *(unsigned char *)(v31 + 161) = (unint64_t)objc_msgSend_count(v89, v72, v73, v74) > 1;
    *(unsigned char *)(v31 + 160) = objc_msgSend_isFromMe(v90, v75, v76, v77);
    uint64_t v81 = objc_msgSend_tapback(v90, v78, v79, v80);
    v82 = *(void **)(v31 + 184);
    *(void *)(v31 + 184) = v81;

    long long v92 = 0u;
    objc_msgSend_geometryDescriptor((void *)v31, v83, v84, v85);
    *(void *)&long long v92 = 10;
    *(_OWORD *)buf = v92;
    long long v98 = 0u;
    long long v99 = 0u;
    uint64_t v100 = 0;
    objc_msgSend__setGeometryDescriptor_((void *)v31, v86, (uint64_t)buf, v87);
  }

  return (id)v31;
}

- (unint64_t)hash
{
  id v4 = objc_msgSend_lastObject(self->_acknowledgments, a2, v2, v3);
  unint64_t v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = v4;
    if (self->_latestIsFromMe == *((unsigned __int8 *)v7 + 160)
      && objc_msgSend_isEqual_(self->_latestTapback, v5, v7[23], v6)
      && self->_includesMultiple == *((unsigned __int8 *)v7 + 161))
    {
      char isEqual = objc_msgSend_isEqual_(self->_acknowledgments, v8, v7[21], v9);
    }
    else
    {
      char isEqual = 0;
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  acknowledgments = self->_acknowledgments;

  return (id)objc_msgSend__initWithAcknowledgments_(v4, v5, (uint64_t)acknowledgments, v6);
}

- (BOOL)supportsCommunicationSafety
{
  return 1;
}

- (BOOL)canDelete
{
  return 1;
}

- (NSArray)acknowledgments
{
  return self->_acknowledgments;
}

- (IMMessageAcknowledgmentChatItem)fromMeAcknowledgement
{
  return self->_fromMeAcknowledgement;
}

- (BOOL)latestIsFromMe
{
  return self->_latestIsFromMe;
}

- (BOOL)includesMultiple
{
  return self->_includesMultiple;
}

- (IMTapback)latestTapback
{
  return self->_latestTapback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestTapback, 0);
  objc_storeStrong((id *)&self->_fromMeAcknowledgement, 0);

  objc_storeStrong((id *)&self->_acknowledgments, 0);
}

@end