@interface MFMailQLAttachmentContext
+ (MFMailQLAttachmentContext)contextWithUserActivity:(id)a3;
- (BOOL)insertingDrawing;
- (BOOL)isContentManaged;
- (BOOL)shouldShowReplyAll;
- (EMMailboxObjectID)mailboxObjectID;
- (EMMessageObjectID)messageObjectID;
- (MFAttachment)attachmentBeingEdited;
- (MFMailQLAttachmentContext)initWithAttachmentBeingEdited:(id)a3;
- (MFMailQLAttachmentContext)initWithAttachmentURL:(id)a3 editBehavior:(int64_t)a4 messageObjectID:(id)a5 mailboxObjectID:(id)a6 subject:(id)a7 senderDisplayName:(id)a8 shouldShowReplyAll:(BOOL)a9 contentManaged:(BOOL)a10;
- (NSString)senderDisplayName;
- (NSString)subject;
- (NSURL)attachmentURL;
- (NSUserActivity)userActivity;
- (id)initForInsertingDrawing;
- (int64_t)editBehavior;
@end

@implementation MFMailQLAttachmentContext

+ (MFMailQLAttachmentContext)contextWithUserActivity:(id)a3
{
  id v4 = a3;
  v5 = [v4 activityType];
  char v6 = [v5 isEqualToString:*MEMORY[0x1E4F73DB0]];

  if (v6)
  {
    v7 = [v4 userInfo];
    v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F73DB8]];
    v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F73DC0]];
    v26 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F73DC8]];
    uint64_t v10 = *MEMORY[0x1E4F73D38];
    uint64_t v25 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F73D38]];
    v11 = [v7 objectForKeyedSubscript:v10];
    v12 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F73D48]];
    v13 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F73DD0]];
    v14 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F73DD8]];
    char v15 = [v14 BOOLValue];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_opt_class();
      v16 = (void *)v25;
      if (objc_opt_isKindOfClass())
      {
        if (v11)
        {
          v24 = [MEMORY[0x1E4F60310] objectIDFromSerializedRepresentation:v11];
        }
        else
        {
          v24 = 0;
        }
        id v21 = objc_alloc((Class)a1);
        v22 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
        uint64_t v20 = [v9 integerValue];
        v23 = [MEMORY[0x1E4F603A0] objectIDFromSerializedRepresentation:v25];
        BYTE1(v19) = [v26 BOOLValue];
        LOBYTE(v19) = v15;
        v17 = objc_msgSend(v21, "initWithAttachmentURL:editBehavior:messageObjectID:mailboxObjectID:subject:senderDisplayName:shouldShowReplyAll:contentManaged:", v22, v20, v23, v24, v12, v13, v19);
      }
      else
      {
        v17 = 0;
      }
    }
    else
    {
      v17 = 0;
      v16 = (void *)v25;
    }
  }
  else
  {
    v17 = 0;
  }

  return (MFMailQLAttachmentContext *)v17;
}

- (MFMailQLAttachmentContext)initWithAttachmentURL:(id)a3 editBehavior:(int64_t)a4 messageObjectID:(id)a5 mailboxObjectID:(id)a6 subject:(id)a7 senderDisplayName:(id)a8 shouldShowReplyAll:(BOOL)a9 contentManaged:(BOOL)a10
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v25 = a8;
  v26.receiver = self;
  v26.super_class = (Class)MFMailQLAttachmentContext;
  uint64_t v20 = [(MFMailQLAttachmentContext *)&v26 init];
  id v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_attachmentURL, a3);
    v21->_contentManaged = a10;
    v21->_editBehavior = a4;
    objc_storeStrong((id *)&v21->_messageObjectID, a5);
    objc_storeStrong((id *)&v21->_mailboxObjectID, a6);
    objc_storeStrong((id *)&v21->_subject, a7);
    objc_storeStrong((id *)&v21->_senderDisplayName, a8);
    v21->_shouldShowReplyAll = a9;
    v21->_insertingDrawing = 0;
    attachmentBeingEdited = v21->_attachmentBeingEdited;
    v21->_attachmentBeingEdited = 0;
  }
  return v21;
}

- (id)initForInsertingDrawing
{
  v3.receiver = self;
  v3.super_class = (Class)MFMailQLAttachmentContext;
  id result = [(MFMailQLAttachmentContext *)&v3 init];
  if (result) {
    *((unsigned char *)result + 10) = 1;
  }
  return result;
}

- (MFMailQLAttachmentContext)initWithAttachmentBeingEdited:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMailQLAttachmentContext;
  char v6 = [(MFMailQLAttachmentContext *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_attachmentBeingEdited, a3);
    v7->_insertingDrawing = 0;
  }

  return v7;
}

- (NSUserActivity)userActivity
{
  v27[6] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F22488]);
  uint64_t v4 = *MEMORY[0x1E4F73DB0];
  id v25 = (id)[v3 initWithActivityType:*MEMORY[0x1E4F73DB0]];
  id v5 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v26[0] = *MEMORY[0x1E4F73DB8];
  v24 = [(MFMailQLAttachmentContext *)self attachmentURL];
  char v6 = [v24 absoluteString];
  v27[0] = v6;
  v26[1] = *MEMORY[0x1E4F73DC0];
  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[MFMailQLAttachmentContext editBehavior](self, "editBehavior"));
  v27[1] = v7;
  v26[2] = *MEMORY[0x1E4F73DC8];
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[MFMailQLAttachmentContext isContentManaged](self, "isContentManaged"));
  v27[2] = v8;
  v26[3] = *MEMORY[0x1E4F73D38];
  objc_super v9 = [(MFMailQLAttachmentContext *)self messageObjectID];
  uint64_t v10 = [v9 serializedRepresentation];
  v27[3] = v10;
  v26[4] = *MEMORY[0x1E4F73D48];
  v11 = [(MFMailQLAttachmentContext *)self subject];
  uint64_t v23 = v4;
  v27[4] = v11;
  v26[5] = *MEMORY[0x1E4F73DD8];
  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[MFMailQLAttachmentContext shouldShowReplyAll](self, "shouldShowReplyAll"));
  v27[5] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:6];
  v14 = (void *)[v5 initWithDictionary:v13];

  char v15 = [(MFMailQLAttachmentContext *)self senderDisplayName];

  if (v15)
  {
    id v16 = [(MFMailQLAttachmentContext *)self senderDisplayName];
    [v14 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F73DD0]];
  }
  id v17 = [(MFMailQLAttachmentContext *)self mailboxObjectID];
  id v18 = [v17 serializedRepresentation];

  if (v18) {
    [v14 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F73D30]];
  }
  [v25 setUserInfo:v14];
  id v19 = NSString;
  uint64_t v20 = [(NSURL *)self->_attachmentURL absoluteString];
  id v21 = [v19 stringWithFormat:@"%@.%@", v23, v20];
  [v25 setTargetContentIdentifier:v21];

  return (NSUserActivity *)v25;
}

- (NSURL)attachmentURL
{
  return self->_attachmentURL;
}

- (BOOL)isContentManaged
{
  return self->_contentManaged;
}

- (int64_t)editBehavior
{
  return self->_editBehavior;
}

- (EMMessageObjectID)messageObjectID
{
  return self->_messageObjectID;
}

- (EMMailboxObjectID)mailboxObjectID
{
  return self->_mailboxObjectID;
}

- (NSString)subject
{
  return self->_subject;
}

- (NSString)senderDisplayName
{
  return self->_senderDisplayName;
}

- (BOOL)shouldShowReplyAll
{
  return self->_shouldShowReplyAll;
}

- (BOOL)insertingDrawing
{
  return self->_insertingDrawing;
}

- (MFAttachment)attachmentBeingEdited
{
  return self->_attachmentBeingEdited;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentBeingEdited, 0);
  objc_storeStrong((id *)&self->_senderDisplayName, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_mailboxObjectID, 0);
  objc_storeStrong((id *)&self->_messageObjectID, 0);

  objc_storeStrong((id *)&self->_attachmentURL, 0);
}

@end