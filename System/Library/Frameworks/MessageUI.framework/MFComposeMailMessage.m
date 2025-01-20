@interface MFComposeMailMessage
+ (id)legacyMessageWithMessage:(id)a3 mailboxUid:(id)a4;
+ (id)legacyMessageWithMessage:(id)a3 mailboxUid:(id)a4 skipAttachmentDownload:(BOOL)a5;
- (EMMessage)emailMessageRepresentation;
- (EMMessageRepository)messageRepository;
- (id)account;
- (id)documentID;
- (void)markAsForwarded;
- (void)markAsReplied;
- (void)markAsViewed;
- (void)setEmailMessageRepresentation:(id)a3;
@end

@implementation MFComposeMailMessage

+ (id)legacyMessageWithMessage:(id)a3 mailboxUid:(id)a4 skipAttachmentDownload:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  v9 = [[MFEMMessageStore alloc] initWithEMMessage:v7 messageClass:objc_opt_class() mailboxUid:v8 skipAttachmentDownload:v5];
  v10 = [(MFEMMessageStore *)v9 legacyMessage];
  [v10 setEmailMessageRepresentation:v7];

  return v10;
}

+ (id)legacyMessageWithMessage:(id)a3 mailboxUid:(id)a4
{
  v4 = [a1 legacyMessageWithMessage:a3 mailboxUid:a4 skipAttachmentDownload:0];

  return v4;
}

- (id)account
{
  v2 = [(MFComposeMailMessage *)self mailbox];
  v3 = [v2 account];

  return v3;
}

- (EMMessageRepository)messageRepository
{
  v2 = [(MFComposeMailMessage *)self emailMessageRepresentation];
  v3 = [v2 repository];

  return (EMMessageRepository *)v3;
}

- (id)documentID
{
  v2 = [(MFComposeMailMessage *)self emailMessageRepresentation];
  v3 = [v2 documentID];

  return v3;
}

- (void)markAsViewed
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F608B8]) initWithBuilder:&__block_literal_global_8];
  id v4 = objc_alloc(MEMORY[0x1E4F60358]);
  BOOL v5 = [(MFComposeMailMessage *)self emailMessageRepresentation];
  v9[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v7 = (void *)[v4 initWithMessageListItems:v6 origin:4 actor:2 flagChange:v3];

  id v8 = [(MFComposeMailMessage *)self messageRepository];
  [v8 performMessageChangeAction:v7];
}

void __36__MFComposeMailMessage_markAsViewed__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 changesReadTo:1];
  [v2 setReason:3];
}

- (void)markAsReplied
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F608B8]) initWithBuilder:&__block_literal_global_16];
  id v4 = objc_alloc(MEMORY[0x1E4F60358]);
  BOOL v5 = [(MFComposeMailMessage *)self emailMessageRepresentation];
  v9[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v7 = (void *)[v4 initWithMessageListItems:v6 origin:4 actor:2 flagChange:v3];

  id v8 = [(MFComposeMailMessage *)self messageRepository];
  [v8 performMessageChangeAction:v7];
}

void __37__MFComposeMailMessage_markAsReplied__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 changesRepliedTo:1];
  [v2 setReason:4];
}

- (void)markAsForwarded
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F608B8]) initWithBuilder:&__block_literal_global_18];
  id v4 = objc_alloc(MEMORY[0x1E4F60358]);
  BOOL v5 = [(MFComposeMailMessage *)self emailMessageRepresentation];
  v9[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v7 = (void *)[v4 initWithMessageListItems:v6 origin:4 actor:2 flagChange:v3];

  id v8 = [(MFComposeMailMessage *)self messageRepository];
  [v8 performMessageChangeAction:v7];
}

void __39__MFComposeMailMessage_markAsForwarded__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 changesForwardedTo:1];
  [v2 setReason:4];
}

- (EMMessage)emailMessageRepresentation
{
  return self->_emailMessageRepresentation;
}

- (void)setEmailMessageRepresentation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end