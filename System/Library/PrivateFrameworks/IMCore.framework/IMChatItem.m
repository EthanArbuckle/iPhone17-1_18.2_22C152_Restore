@interface IMChatItem
- (BOOL)canDelete;
- (BOOL)canEditMessageText;
- (BOOL)canReply;
- (BOOL)canRetract;
- (BOOL)isEditedMessageHistory;
- (BOOL)isHighlighted;
- (BOOL)isReplyContextPreview;
- (BOOL)itemIsReply;
- (BOOL)itemIsReplyContextPreview;
- (BOOL)itemIsReplyCount;
- (BOOL)itemIsThreadOriginator;
- (BOOL)itemIsThreadOriginatorWithThreadIdentifier:(id *)a3;
- (BOOL)supportsCommunicationSafety;
- (BOOL)wasDetonated;
- (IMItem)item;
- (NSString)balloonBundleID;
- (NSString)commSafetyTransferGUID;
- (NSString)itemGUID;
- (NSString)threadIdentifier;
- (id)_initWithItem:(id)a3;
- (id)_item;
- (id)_parentItem;
- (id)_timeAdded;
- (id)_timeStale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)threadGroupIdentifier;
- (int64_t)fileTransferReloadStatus;
- (int64_t)syndicationBehavior;
- (int64_t)syndicationType;
- (void)setItem:(id)a3;
- (void)setNeedsReloadForTransferStatusChangeWithType:(int64_t)a3;
@end

@implementation IMChatItem

- (BOOL)itemIsReply
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
  }
  if (objc_msgSend_isReplyContextPreview(self, v3, v4, v5)) {
    return 0;
  }
  v10 = objc_msgSend_threadIdentifier(self, v6, v7, v8);
  BOOL v9 = objc_msgSend_length(v10, v11, v12, v13) != 0;

  return v9;
}

- (BOOL)itemIsReplyContextPreview
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
  }

  return objc_msgSend_isReplyContextPreview(self, v3, v4, v5);
}

- (BOOL)itemIsThreadOriginator
{
  return objc_msgSend_itemIsThreadOriginatorWithThreadIdentifier_(self, a2, 0, v2);
}

- (BOOL)itemIsThreadOriginatorWithThreadIdentifier:(id *)a3
{
  if (objc_msgSend_isReplyContextPreview(self, a2, (uint64_t)a3, v3)) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = self;
      uint64_t v17 = objc_msgSend_replyCount(v13, v14, v15, v16);
      BOOL v11 = v17 != 0;
      if (!a3 || !v17) {
        goto LABEL_11;
      }
      uint64_t v12 = IMCreateThreadIdentifierForRetractedMessagePartChatItem(v13);
      goto LABEL_10;
    }
    return 0;
  }
  v6 = self;
  uint64_t v10 = objc_msgSend_replyCount(v6, v7, v8, v9);
  BOOL v11 = v10 != 0;
  if (!a3 || !v10) {
    goto LABEL_11;
  }
  uint64_t v12 = IMCreateThreadIdentifierForMessagePartChatItem(v6);
LABEL_10:
  id v18 = v12;
  *a3 = v18;

  BOOL v11 = 1;
LABEL_11:

  return v11;
}

- (id)threadGroupIdentifier
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = self;
    uint64_t v10 = objc_msgSend_threadIdentifier(v3, v4, v5, v6);
    if (!v10)
    {
      uint64_t isReplyContextPreview = objc_msgSend_isReplyContextPreview(v3, v7, v8, v9);
      uint64_t v15 = objc_msgSend_replyCount(v3, v12, v13, v14);
      if ((isReplyContextPreview & 1) != 0 || v15)
      {
        uint64_t v16 = IMCreateThreadIdentifierForMessagePartChatItem(v3);
LABEL_10:
        uint64_t v10 = (void *)v16;
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v10 = 0;
      goto LABEL_14;
    }
    uint64_t v17 = self;
    uint64_t v10 = objc_msgSend_threadIdentifier(v17, v18, v19, v20);
    if (!v10)
    {
      if (objc_msgSend_replyCount(v17, v21, v22, v23))
      {
        uint64_t v16 = IMCreateThreadIdentifierForRetractedMessagePartChatItem(v17);
        goto LABEL_10;
      }
LABEL_12:
      uint64_t v10 = 0;
    }
  }
LABEL_13:

LABEL_14:

  return v10;
}

- (BOOL)itemIsReplyCount
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)description
{
  uint64_t v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)IMChatItem;
  uint64_t v4 = [(IMChatItem *)&v9 description];
  uint64_t v7 = objc_msgSend_stringWithFormat_(v3, v5, @"%@ (%@)", v6, v4, self->_item);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  item = self->_item;

  return (id)objc_msgSend__initWithItem_(v4, v5, (uint64_t)item, v6);
}

- (BOOL)canDelete
{
  return 0;
}

- (BOOL)canRetract
{
  return 0;
}

- (BOOL)canEditMessageText
{
  return 0;
}

- (BOOL)canReply
{
  return 0;
}

- (BOOL)supportsCommunicationSafety
{
  return 0;
}

- (void)setNeedsReloadForTransferStatusChangeWithType:(int64_t)a3
{
  if (a3 == 1)
  {
    if (!objc_msgSend_supportsCommunicationSafety(self, a2, 1, v3)) {
      return;
    }
    a3 = 1;
  }
  self->_fileTransferReloadStatus = a3;
}

- (NSString)itemGUID
{
  return (NSString *)objc_msgSend_guid(self->_item, a2, v2, v3);
}

- (id)_initWithItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMChatItem;
  uint64_t v6 = [(IMChatItem *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_item, a3);
  }

  return v7;
}

- (id)_item
{
  return self->_item;
}

- (id)_parentItem
{
  return self->_item;
}

- (id)_timeStale
{
  return 0;
}

- (id)_timeAdded
{
  return 0;
}

- (NSString)balloonBundleID
{
  id v4 = objc_msgSend__item(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_balloonBundleID(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (BOOL)isEditedMessageHistory
{
  return 0;
}

- (BOOL)isReplyContextPreview
{
  return 0;
}

- (NSString)threadIdentifier
{
  return 0;
}

- (int64_t)syndicationBehavior
{
  return 0;
}

- (BOOL)isHighlighted
{
  return 0;
}

- (int64_t)syndicationType
{
  return 0;
}

- (BOOL)wasDetonated
{
  return 0;
}

- (NSString)commSafetyTransferGUID
{
  return self->_commSafetyTransferGUID;
}

- (int64_t)fileTransferReloadStatus
{
  return self->_fileTransferReloadStatus;
}

- (IMItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);

  objc_storeStrong((id *)&self->_commSafetyTransferGUID, 0);
}

@end