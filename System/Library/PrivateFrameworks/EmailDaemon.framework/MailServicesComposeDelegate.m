@interface MailServicesComposeDelegate
- (MFMessageHeaders)savedHeaders;
- (id)accountProxyGenerator;
- (id)attachments;
- (id)bccRecipients;
- (id)composeWebView;
- (id)sendingAccountProxy;
- (id)sendingEmailAddress;
- (id)shouldCreateRichTextRepresentation;
- (void)setSavedHeaders:(id)a3;
- (void)setSendingEmailAddress:(id)a3;
@end

@implementation MailServicesComposeDelegate

- (id)composeWebView
{
  bodyField = self->_bodyField;
  if (!bodyField)
  {
    v4 = (MFComposeWebView *)objc_alloc_init((Class)MFComposeWebView);
    v5 = self->_bodyField;
    self->_bodyField = v4;

    bodyField = self->_bodyField;
  }

  return bodyField;
}

- (id)bccRecipients
{
  v3 = [(MailServicesComposeDelegate *)self bcc];
  v4 = +[NSUserDefaults em_userDefaults];
  unsigned int v5 = [v4 BOOLForKey:EMUserDefaultAlwaysBCCSelf];

  if (v5)
  {
    v6 = [(MailServicesComposeDelegate *)self sendingEmailAddress];
    v7 = +[MailAccount accountContainingEmailAddress:v6 includingInactive:1];

    if (v7
      || (+[MailAccount defaultMailAccountForDelivery],
          (v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = [v7 emailAddressStrings];
      v9 = [v8 firstObject];

      v10 = +[ECEmailAddressComponents componentsWithString:v9];
      v11 = [v7 fullUserName];
      [v10 setDisplayName:v11];

      id v12 = objc_alloc_init((Class)ECEmailAddressFormatter);
      [v12 setShouldIncludeDisplayName:1];
      uint64_t v13 = [v10 emailAddressValue];
      v14 = (void *)v13;
      if (v13) {
        v15 = (void *)v13;
      }
      else {
        v15 = v9;
      }
      v16 = [v12 stringFromEmailAddressConvertible:v15];
    }
    else
    {
      v16 = 0;
    }
    if ([v16 length] && (objc_msgSend(v3, "containsObject:", v16) & 1) == 0)
    {
      v17 = +[NSMutableArray arrayWithArray:v3];
      [v17 addObject:v16];
    }
    else
    {
      v17 = v3;
    }

    v3 = v17;
  }

  return v3;
}

- (void)setSendingEmailAddress:(id)a3
{
  v4 = (NSString *)a3;
  if (self->_sendingEmailAddress != v4)
  {
    v7 = v4;
    unsigned int v5 = (NSString *)[(NSString *)v4 copy];
    sendingEmailAddress = self->_sendingEmailAddress;
    self->_sendingEmailAddress = v5;

    v4 = v7;
  }
}

- (id)sendingEmailAddress
{
  return self->_sendingEmailAddress;
}

- (id)attachments
{
  return 0;
}

- (id)shouldCreateRichTextRepresentation
{
  v2 = [(MailServicesComposeDelegate *)self composeWebView];
  v3 = [v2 containsRichText];

  return v3;
}

- (id)accountProxyGenerator
{
  accountProxyGenerator = self->_accountProxyGenerator;
  if (!accountProxyGenerator)
  {
    v4 = (MFMailAccountProxyGenerator *)[objc_alloc((Class)MFMailAccountProxyGenerator) initWithAllowsRestrictedAccounts:0];
    unsigned int v5 = self->_accountProxyGenerator;
    self->_accountProxyGenerator = v4;

    accountProxyGenerator = self->_accountProxyGenerator;
  }

  return accountProxyGenerator;
}

- (id)sendingAccountProxy
{
  v3 = [(MailServicesComposeDelegate *)self accountProxyGenerator];
  v4 = [v3 accountProxyContainingEmailAddress:self->_sendingEmailAddress includingInactive:0 originatingBundleID:0 sourceAccountManagement:0];

  return v4;
}

- (MFMessageHeaders)savedHeaders
{
  return self->_savedHeaders;
}

- (void)setSavedHeaders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedHeaders, 0);
  objc_storeStrong((id *)&self->_accountProxyGenerator, 0);
  objc_storeStrong((id *)&self->_bodyField, 0);

  objc_storeStrong((id *)&self->_sendingEmailAddress, 0);
}

@end