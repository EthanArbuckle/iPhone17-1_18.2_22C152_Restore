@interface AAMessagesInviteContext
- (NSArray)recipients;
- (NSString)action;
- (NSString)messageBody;
- (NSString)secondaryTitle;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)inviteURL;
- (NSURL)messageURL;
- (id)description;
- (void)setAction:(id)a3;
- (void)setInviteURL:(id)a3;
- (void)setMessageBody:(id)a3;
- (void)setMessageURL:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setSecondaryTitle:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation AAMessagesInviteContext

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(AAMessagesInviteContext *)self title];
  v6 = [(AAMessagesInviteContext *)self subtitle];
  v7 = [(AAMessagesInviteContext *)self action];
  v8 = [(AAMessagesInviteContext *)self inviteURL];
  v9 = [v8 absoluteString];
  v10 = [(AAMessagesInviteContext *)self recipients];
  v11 = [(AAMessagesInviteContext *)self messageURL];
  v12 = [v11 absoluteString];
  v13 = [v3 stringWithFormat:@"%@ - title: %@ subtitle: %@ action: %@ inviteURL: %@ recipients: %@ messageURL %@", v4, v5, v6, v7, v9, v10, v12];

  return v13;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
}

- (NSString)messageBody
{
  return self->_messageBody;
}

- (void)setMessageBody:(id)a3
{
}

- (NSURL)inviteURL
{
  return self->_inviteURL;
}

- (void)setInviteURL:(id)a3
{
}

- (NSString)secondaryTitle
{
  return self->_secondaryTitle;
}

- (void)setSecondaryTitle:(id)a3
{
}

- (NSURL)messageURL
{
  return self->_messageURL;
}

- (void)setMessageURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageURL, 0);
  objc_storeStrong((id *)&self->_secondaryTitle, 0);
  objc_storeStrong((id *)&self->_inviteURL, 0);
  objc_storeStrong((id *)&self->_messageBody, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end