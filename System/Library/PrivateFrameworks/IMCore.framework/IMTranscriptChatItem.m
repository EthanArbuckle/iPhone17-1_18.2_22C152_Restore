@interface IMTranscriptChatItem
- (BOOL)_isContiguousLoaded;
- (BOOL)contiguousLoaded;
- (BOOL)isAttachmentContiguousWithChatItem:(id)a3;
- (BOOL)isContiguous;
- (BOOL)isContiguousWithChatItem:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromMe;
- (BOOL)wantsTail;
- (IMChatContext)chatContext;
- (IMHandle)handle;
- (IMServiceImpl)service;
- (NSAttributedString)transcriptText;
- (NSDate)transcriptDate;
- (NSString)description;
- (NSString)guid;
- (NSString)layoutGroupIdentifier;
- (NSString)serviceName;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unsigned)attachmentContiguousType;
- (unsigned)contiguousType;
- (void)_setAttachmentContiguousType:(unsigned __int8)a3;
- (void)_setContiguousLoaded:(BOOL)a3;
- (void)_setContiguousType:(unsigned __int8)a3;
- (void)_setGUID:(id)a3;
- (void)setChatContext:(id)a3;
@end

@implementation IMTranscriptChatItem

- (NSString)serviceName
{
  v4 = objc_msgSend__item(self, a2, v2, v3);
  v8 = objc_msgSend_service(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (NSString)layoutGroupIdentifier
{
  return self->_guid;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)IMTranscriptChatItem;
  v4 = [(IMChatItem *)&v9 description];
  uint64_t v7 = objc_msgSend_stringWithFormat_(v3, v5, @"%@ (%@)", v6, v4, self->_guid);

  return (NSString *)v7;
}

- (unint64_t)hash
{
  return objc_msgSend_hash(self->_guid, a2, v2, v3);
}

- (BOOL)isEqual:(id)a3
{
  return IMTranscriptChatItemEqual(self, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v8 = objc_msgSend__item(self, v5, v6, v7);
  v11 = objc_msgSend__initWithItem_(v4, v9, (uint64_t)v8, v10);

  return v11;
}

- (BOOL)isContiguousWithChatItem:(id)a3
{
  id v4 = a3;
  v5 = &selRef_isHidden;
  if (!objc_msgSend_conformsToProtocol_(self, v6, (uint64_t)&unk_1EF9256E8, v7)) {
    goto LABEL_36;
  }
  if (objc_msgSend_isEditedMessageHistory(self, v8, v9, v10))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_4;
    }
  }
  if (objc_opt_class(), (objc_opt_isKindOfClass())
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_msgSend_messageHighlightChatItem(self, v12, v14, v13),
        v15 = objc_claimAutoreleasedReturnValue(),
        v15,
        v15)
    || !objc_msgSend_conformsToProtocol_(v4, v12, (uint64_t)&unk_1EF9256E8, v13)
    || (objc_msgSend_isReplyContextPreview(self, v16, v17, v18) & 1) != 0
    || (objc_msgSend_isReplyContextPreview(v4, v19, v20, v21) & 1) != 0
    || (objc_msgSend_itemIsThreadOriginator(self, v22, v23, v24) & 1) != 0
    || (objc_msgSend_itemIsThreadOriginator(v4, v25, v26, v27) & 1) != 0)
  {
LABEL_36:
    char v11 = 0;
    goto LABEL_37;
  }
  v31 = objc_msgSend__item(self, v28, v29, v30);
  int isReply = objc_msgSend_isReply(v31, v32, v33, v34);
  char v39 = isReply;
  if (isReply
    && (objc_msgSend__item(v4, v36, v37, v38),
        v5 = (char **)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_isReply(v5, v40, v41, v42)))
  {
  }
  else
  {
    v46 = objc_msgSend__item(self, v36, v37, v38);
    if (objc_msgSend_isReply(v46, v47, v48, v49))
    {

      if (v39) {
      goto LABEL_36;
      }
    }
    v53 = objc_msgSend__item(v4, v50, v51, v52);
    char v57 = objc_msgSend_isReply(v53, v54, v55, v56);

    if (v39) {
    if (v57)
    }
      goto LABEL_36;
  }
  v58 = objc_msgSend__item(self, v43, v44, v45);
  v62 = objc_msgSend__item(v4, v59, v60, v61);

  if (v58 != v62)
  {
    int isEditedMessageHistory = objc_msgSend_isEditedMessageHistory(self, v63, v64, v65);
    if (isEditedMessageHistory == objc_msgSend_isEditedMessageHistory(v4, v67, v68, v69))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v73 = self;
          id v74 = v4;
          int v78 = objc_msgSend_requiresSiriAttribution(v73, v75, v76, v77);
          int v85 = v78 ^ objc_msgSend_requiresSiriAttribution(v74, v79, v80, v81);
          if ((v85 & 1) != 0
            || objc_msgSend_requiresFaceTimeAttribution(v73, v82, v83, v84)
            && objc_msgSend_requiresFaceTimeAttribution(v74, v86, v87, v88)
            && (int v92 = objc_msgSend_isFromMe(v73, v89, v90, v91),
                v92 == objc_msgSend_isFromMe(v74, v93, v94, v95)))
          {
            char v11 = v85 ^ 1;

            goto LABEL_37;
          }
        }
      }
      int v96 = objc_msgSend_isFromMe(self, v70, v71, v72);
      if (v96 == objc_msgSend_isFromMe(v4, v97, v98, v99))
      {
        v103 = objc_msgSend_time(v4, v100, v101, v102);
        v107 = objc_msgSend_time(self, v104, v105, v106);
        objc_msgSend_timeIntervalSinceDate_(v103, v108, (uint64_t)v107, v109);
        double v111 = fabs(v110);

        if (v111 <= 60.0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            char v11 = objc_opt_isKindOfClass() ^ 1;
            goto LABEL_37;
          }
        }
      }
    }
    goto LABEL_36;
  }
LABEL_4:
  char v11 = 1;
LABEL_37:

  return v11 & 1;
}

- (BOOL)isAttachmentContiguousWithChatItem:(id)a3
{
  return 0;
}

- (unsigned)contiguousType
{
  return self->_contiguousType;
}

- (unsigned)attachmentContiguousType
{
  return self->_attachmentContiguousType;
}

- (BOOL)isContiguous
{
  return self->_contiguousType - 1 < 2;
}

- (BOOL)isFromMe
{
  return 0;
}

- (BOOL)wantsTail
{
  int v4 = objc_msgSend_contiguousType(self, a2, v2, v3);
  return v4 == 3 || v4 == 0;
}

- (NSAttributedString)transcriptText
{
  return 0;
}

- (NSDate)transcriptDate
{
  return 0;
}

- (IMServiceImpl)service
{
  return 0;
}

- (IMHandle)handle
{
  return 0;
}

- (BOOL)_isContiguousLoaded
{
  return self->_contiguousLoaded;
}

- (void)_setContiguousLoaded:(BOOL)a3
{
  self->_contiguousLoaded = a3;
}

- (void)_setContiguousType:(unsigned __int8)a3
{
  self->_contiguousType = a3;
}

- (void)_setAttachmentContiguousType:(unsigned __int8)a3
{
  self->_attachmentContiguousType = a3;
}

- (void)_setGUID:(id)a3
{
  int v4 = (NSString *)a3;
  p_guid = &self->_guid;
  if (*p_guid != v4)
  {
    uint64_t v10 = v4;
    uint64_t v9 = objc_msgSend_copy(v4, v5, v6, v7);

    objc_storeStrong((id *)p_guid, v9);
    int v4 = (NSString *)v9;
  }
}

- (NSString)guid
{
  return self->_guid;
}

- (BOOL)contiguousLoaded
{
  return self->_contiguousLoaded;
}

- (IMChatContext)chatContext
{
  return self->_chatContext;
}

- (void)setChatContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatContext, 0);

  objc_storeStrong((id *)&self->_guid, 0);
}

@end