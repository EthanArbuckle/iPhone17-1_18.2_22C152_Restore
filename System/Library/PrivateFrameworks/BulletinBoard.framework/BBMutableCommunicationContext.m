@interface BBMutableCommunicationContext
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAssociatedObjectUri:(id)a3;
- (void)setBusinessCorrespondence:(BOOL)a3;
- (void)setCapabilities:(int64_t)a3;
- (void)setContentURL:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageName:(id)a3;
- (void)setMentionsCurrentUser:(BOOL)a3;
- (void)setNotifyRecipientAnyway:(BOOL)a3;
- (void)setRecipientCount:(unint64_t)a3;
- (void)setRecipients:(id)a3;
- (void)setReplyToCurrentUser:(BOOL)a3;
- (void)setSender:(id)a3;
- (void)setSystemImage:(BOOL)a3;
@end

@implementation BBMutableCommunicationContext

- (void)setIdentifier:(id)a3
{
  self->super._identifier = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setAssociatedObjectUri:(id)a3
{
  self->super._associatedObjectUri = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setDisplayName:(id)a3
{
  self->super._displayName = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setSender:(id)a3
{
  self->super._sender = (BBContact *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setRecipients:(id)a3
{
  self->super._recipients = (NSArray *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setContentURL:(id)a3
{
  self->super._contentURL = (NSURL *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setImageName:(id)a3
{
  self->super._imageName = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setSystemImage:(BOOL)a3
{
  self->super._systemImage = a3;
}

- (void)setMentionsCurrentUser:(BOOL)a3
{
  self->super._mentionsCurrentUser = a3;
}

- (void)setNotifyRecipientAnyway:(BOOL)a3
{
  self->super._notifyRecipientAnyway = a3;
}

- (void)setReplyToCurrentUser:(BOOL)a3
{
  self->super._replyToCurrentUser = a3;
}

- (void)setRecipientCount:(unint64_t)a3
{
  self->super._recipientCount = a3;
}

- (void)setCapabilities:(int64_t)a3
{
  self->super._capabilities = a3;
}

- (void)setBusinessCorrespondence:(BOOL)a3
{
  self->super._businessCorrespondence = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v22 = +[BBCommunicationContext allocWithZone:a3];
  v21 = [(BBCommunicationContext *)self identifier];
  v20 = [(BBCommunicationContext *)self bundleIdentifier];
  v19 = [(BBCommunicationContext *)self associatedObjectUri];
  v18 = [(BBCommunicationContext *)self displayName];
  v17 = [(BBCommunicationContext *)self sender];
  v4 = [(BBCommunicationContext *)self recipients];
  v5 = [(BBCommunicationContext *)self contentURL];
  v6 = [(BBCommunicationContext *)self imageName];
  BOOL v7 = [(BBCommunicationContext *)self systemImage];
  BOOL v8 = [(BBCommunicationContext *)self mentionsCurrentUser];
  BOOL v9 = [(BBCommunicationContext *)self notifyRecipientAnyway];
  BOOL v10 = [(BBCommunicationContext *)self isReplyToCurrentUser];
  unint64_t v11 = [(BBCommunicationContext *)self recipientCount];
  int64_t v12 = [(BBCommunicationContext *)self capabilities];
  LOBYTE(v16) = [(BBCommunicationContext *)self isBusinessCorrespondence];
  BYTE3(v15) = v10;
  BYTE2(v15) = v9;
  BYTE1(v15) = v8;
  LOBYTE(v15) = v7;
  id v13 = -[BBCommunicationContext _initWithIdentifier:bundleIdentifier:associatedObjectUri:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:capabilities:businessCorrespondence:](v22, "_initWithIdentifier:bundleIdentifier:associatedObjectUri:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:capabilities:businessCorrespondence:", v21, v20, v19, v18, v17, v4, v5, v6, v15, v11, v12, v16);

  return v13;
}

@end