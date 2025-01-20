@interface ComposePlaceholderViewModel
- (BOOL)shouldUseMultiField;
- (BOOL)showSenderAddress;
- (NSArray)bccRecipients;
- (NSArray)ccRecipients;
- (NSArray)toRecipients;
- (NSString)htmlContent;
- (NSString)senderAddress;
- (void)setBccRecipients:(id)a3;
- (void)setCcRecipients:(id)a3;
- (void)setHtmlContent:(id)a3;
- (void)setSenderAddress:(id)a3;
- (void)setShowSenderAddress:(BOOL)a3;
- (void)setToRecipients:(id)a3;
@end

@implementation ComposePlaceholderViewModel

- (BOOL)shouldUseMultiField
{
  v3 = [(ComposePlaceholderViewModel *)self ccRecipients];
  unint64_t v4 = (unint64_t)[v3 count];

  v5 = [(ComposePlaceholderViewModel *)self bccRecipients];
  unint64_t v6 = v4 | (unint64_t)[v5 count];

  return v6 == 0;
}

- (NSArray)toRecipients
{
  return self->_toRecipients;
}

- (void)setToRecipients:(id)a3
{
}

- (NSArray)ccRecipients
{
  return self->_ccRecipients;
}

- (void)setCcRecipients:(id)a3
{
}

- (NSArray)bccRecipients
{
  return self->_bccRecipients;
}

- (void)setBccRecipients:(id)a3
{
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (void)setSenderAddress:(id)a3
{
}

- (BOOL)showSenderAddress
{
  return self->_showSenderAddress;
}

- (void)setShowSenderAddress:(BOOL)a3
{
  self->_showSenderAddress = a3;
}

- (NSString)htmlContent
{
  return self->_htmlContent;
}

- (void)setHtmlContent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_htmlContent, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_bccRecipients, 0);
  objc_storeStrong((id *)&self->_ccRecipients, 0);

  objc_storeStrong((id *)&self->_toRecipients, 0);
}

@end