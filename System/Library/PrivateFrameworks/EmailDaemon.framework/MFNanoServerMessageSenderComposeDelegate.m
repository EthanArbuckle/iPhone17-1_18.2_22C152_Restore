@interface MFNanoServerMessageSenderComposeDelegate
- (BOOL)bccAddressesDirtied;
- (BOOL)canShowAttachmentPicker;
- (BOOL)canShowFromField;
- (BOOL)canShowImageSizeField;
- (BOOL)hasAttachments;
- (BOOL)includesAttachments;
- (BOOL)isAddressHideMyEmail:(id)a3;
- (BOOL)isHideMyEmailMessage;
- (BOOL)isQuickReply;
- (BOOL)sendingEmailDirtied;
- (MFMessageHeaders)savedHeaders;
- (MFNanoMailReplyWorkaround)replyWorkaround;
- (MFNanoServerMessageSenderComposeDelegate)init;
- (MFNanoServerMessageSenderComposeDelegate)initWithCoder:(id)a3;
- (NSMutableSet)attachmentsAdded;
- (_MFMailCompositionContext)compositionContext;
- (id)accountProxyGenerator;
- (id)allRecipientNamesAndAddresses;
- (id)attachmentConfigCompletion;
- (id)attachments;
- (id)bccRecipients;
- (id)composeWebView;
- (id)currentScaleImageSize;
- (id)emailAddresses;
- (id)inputContextHistory;
- (id)pianoMoverImageURL;
- (id)popoverManager;
- (id)presentationViewController;
- (id)sendingAccountProxy;
- (id)sendingEmailAddress;
- (id)sendingEmailAddressIfExists;
- (id)shouldCreateRichTextRepresentation;
- (id)subject;
- (int64_t)addressableGroupResultStyleForComposeContactsSearchController:(id)a3;
- (int64_t)compositionType;
- (void)addSignature:(BOOL)a3;
- (void)didInsertAttachment:(id)a3;
- (void)setAttachmentConfigCompletion:(id)a3;
- (void)setAttachmentsAdded:(id)a3;
- (void)setCompositionContext:(id)a3;
- (void)setIncludesAttachments:(BOOL)a3;
- (void)setReplyWorkaround:(id)a3;
- (void)setSavedHeaders:(id)a3;
- (void)setSendingEmailAddress:(id)a3;
@end

@implementation MFNanoServerMessageSenderComposeDelegate

- (MFNanoServerMessageSenderComposeDelegate)init
{
  v5.receiver = self;
  v5.super_class = (Class)MFNanoServerMessageSenderComposeDelegate;
  v2 = [(MFNanoServerMessageSenderComposeDelegate *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSMutableSet);
    [(MFNanoServerMessageSenderComposeDelegate *)v2 setAttachmentsAdded:v3];
  }
  return v2;
}

- (MFNanoServerMessageSenderComposeDelegate)initWithCoder:(id)a3
{
  return 0;
}

- (id)composeWebView
{
  bodyField = self->_bodyField;
  if (!bodyField)
  {
    v4 = (MFComposeWebView *)objc_alloc_init((Class)MFComposeWebView);
    objc_super v5 = self->_bodyField;
    self->_bodyField = v4;

    v6 = self->_bodyField;
    v7 = [(_MFMailCompositionContext *)self->_compositionContext contextID];
    [(MFComposeWebView *)v6 setCompositionContextID:v7];

    [(MFComposeWebView *)self->_bodyField setMailComposeViewDelegate:self];
    bodyField = self->_bodyField;
  }

  return bodyField;
}

- (id)subject
{
  return [(_MFMailCompositionContext *)self->_compositionContext subject];
}

- (id)bccRecipients
{
  id v3 = [(MFNanoServerMessageSenderComposeDelegate *)self bcc];
  v4 = +[NSUserDefaults em_userDefaults];
  unsigned int v5 = [v4 BOOLForKey:EMUserDefaultAlwaysBCCSelf];

  if (v5)
  {
    v6 = [(MFNanoServerMessageSenderComposeDelegate *)self sendingEmailAddress];
    v7 = +[MailAccount accountContainingEmailAddress:v6 includingInactive:1];

    if (v7
      || (+[MailAccount defaultMailAccountForDelivery],
          (v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = [v7 emailAddressStrings];
      id v9 = [v8 count];

      if (v9)
      {
        v10 = [v7 emailAddressStrings];
        v11 = [v10 objectAtIndexedSubscript:0];
        v12 = [v11 emailAddressValue];
        v13 = +[ECEmailAddressComponents componentsWithEmailAddress:v12];

        v14 = [v7 fullUserName];
        [v13 setDisplayName:v14];

        id v9 = [v13 stringValue];
      }
    }
    else
    {
      id v9 = 0;
    }
    if ([v9 length] && (objc_msgSend(v3, "containsObject:", v9) & 1) == 0)
    {
      v15 = +[NSMutableArray arrayWithArray:v3];
      [v15 addObject:v9];
    }
    else
    {
      v15 = v3;
    }

    id v3 = v15;
  }

  return v3;
}

- (void)setSendingEmailAddress:(id)a3
{
  id v6 = a3;
  v4 = (NSString *)[v6 copy];
  sendingEmailAddress = self->_sendingEmailAddress;
  self->_sendingEmailAddress = v4;
}

- (id)sendingEmailAddress
{
  return self->_sendingEmailAddress;
}

- (id)attachments
{
  id v3 = [(MFNanoServerMessageSenderComposeDelegate *)self compositionContext];
  v4 = [v3 contextID];

  if ([v4 length])
  {
    unsigned int v5 = [(MFNanoServerMessageSenderComposeDelegate *)self compositionContext];
    id v6 = [v5 attachmentManager];
    v7 = [v6 attachmentsForContext:v4];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)pianoMoverImageURL
{
  return 0;
}

- (id)shouldCreateRichTextRepresentation
{
  return +[EFFuture futureWithResult:&__kCFBooleanTrue];
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
  id v3 = [(MFNanoServerMessageSenderComposeDelegate *)self accountProxyGenerator];
  v4 = [v3 accountProxyContainingEmailAddress:self->_sendingEmailAddress includingInactive:0 originatingBundleID:0 sourceAccountManagement:0];

  return v4;
}

- (void)addSignature:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = +[MFNanoBridgeSettingsManager sharedInstance];
  id v8 = [v5 signature];

  if ([v8 length])
  {
    bodyField = self->_bodyField;
    if (v3)
    {
      v7 = +[NSString stringWithFormat:@"<br/><br/>%@<br/><br/>", v8];
      [(MFComposeWebView *)bodyField prependMarkupString:v7 quote:0];
    }
    else
    {
      v7 = +[NSString stringWithFormat:@"<br/><br/>%@", v8];
      [(MFComposeWebView *)bodyField appendMarkupString:v7 quote:0];
    }
  }
}

- (void)didInsertAttachment:(id)a3
{
  id v10 = a3;
  v4 = [(MFNanoServerMessageSenderComposeDelegate *)self attachmentsAdded];
  unsigned int v5 = [v10 contentID];
  [v4 addObject:v5];

  id v6 = [(MFNanoServerMessageSenderComposeDelegate *)self attachmentsAdded];
  id v7 = [v6 count];
  id v8 = [(MFNanoServerMessageSenderComposeDelegate *)self attachments];
  if (v7 == [v8 count])
  {
    id v9 = [(MFNanoServerMessageSenderComposeDelegate *)self attachmentConfigCompletion];

    if (!v9) {
      goto LABEL_6;
    }
    id v6 = [(MFNanoServerMessageSenderComposeDelegate *)self attachmentConfigCompletion];
    v6[2]();
  }
  else
  {
  }
LABEL_6:
}

- (int64_t)addressableGroupResultStyleForComposeContactsSearchController:(id)a3
{
  return 1;
}

- (id)inputContextHistory
{
  return 0;
}

- (BOOL)bccAddressesDirtied
{
  return 0;
}

- (BOOL)canShowAttachmentPicker
{
  return 0;
}

- (BOOL)canShowFromField
{
  return 0;
}

- (BOOL)canShowImageSizeField
{
  return 0;
}

- (int64_t)compositionType
{
  return (int64_t)[(_MFMailCompositionContext *)self->_compositionContext composeType];
}

- (id)currentScaleImageSize
{
  return 0;
}

- (id)emailAddresses
{
  return &__NSArray0__struct;
}

- (BOOL)hasAttachments
{
  return 0;
}

- (BOOL)isAddressHideMyEmail:(id)a3
{
  return 0;
}

- (BOOL)isHideMyEmailMessage
{
  return 0;
}

- (id)popoverManager
{
  return 0;
}

- (id)presentationViewController
{
  return 0;
}

- (id)sendingEmailAddressIfExists
{
  return 0;
}

- (id)allRecipientNamesAndAddresses
{
  return 0;
}

- (BOOL)sendingEmailDirtied
{
  return 0;
}

- (BOOL)isQuickReply
{
  return 0;
}

- (MFNanoMailReplyWorkaround)replyWorkaround
{
  return self->_replyWorkaround;
}

- (void)setReplyWorkaround:(id)a3
{
}

- (MFMessageHeaders)savedHeaders
{
  return self->_savedHeaders;
}

- (void)setSavedHeaders:(id)a3
{
}

- (_MFMailCompositionContext)compositionContext
{
  return self->_compositionContext;
}

- (void)setCompositionContext:(id)a3
{
}

- (BOOL)includesAttachments
{
  return self->_includesAttachments;
}

- (void)setIncludesAttachments:(BOOL)a3
{
  self->_includesAttachments = a3;
}

- (NSMutableSet)attachmentsAdded
{
  return self->_attachmentsAdded;
}

- (void)setAttachmentsAdded:(id)a3
{
}

- (id)attachmentConfigCompletion
{
  return self->_attachmentConfigCompletion;
}

- (void)setAttachmentConfigCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_attachmentConfigCompletion, 0);
  objc_storeStrong((id *)&self->_attachmentsAdded, 0);
  objc_storeStrong((id *)&self->_compositionContext, 0);
  objc_storeStrong((id *)&self->_savedHeaders, 0);
  objc_storeStrong((id *)&self->_replyWorkaround, 0);
  objc_storeStrong((id *)&self->_accountProxyGenerator, 0);
  objc_storeStrong((id *)&self->_bodyField, 0);

  objc_storeStrong((id *)&self->_sendingEmailAddress, 0);
}

@end