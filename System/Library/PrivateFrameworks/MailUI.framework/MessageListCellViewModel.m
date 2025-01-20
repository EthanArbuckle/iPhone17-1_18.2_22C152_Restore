@interface MessageListCellViewModel
- (BOOL)addressIsPresent;
- (BOOL)allowAuthenticationWarning;
- (BOOL)hideFollowUp;
- (BOOL)subjectIsPresent;
- (MUIAvatarImageContext)avatarContext;
- (MUIAvatarImageGenerator)avatarGenerator;
- (MessageListCellViewModel)initWithBuilder:(id)a3;
- (MessageListCellViewModel)initWithItemBuilder:(id)a3;
- (NSArray)addressList;
- (NSArray)emailAddresses;
- (NSAttributedString)attributedAddress;
- (NSDictionary)hintsBySnippetZone;
- (NSString)address;
- (NSString)categorizationState;
- (NSString)subject;
- (int64_t)recipientType;
- (int64_t)style;
- (void)setAddress:(id)a3;
- (void)setAddressIsPresent:(BOOL)a3;
- (void)setAddressList:(id)a3;
- (void)setAllowAuthenticationWarning:(BOOL)a3;
- (void)setAttributedAddress:(id)a3;
- (void)setAvatarContext:(id)a3;
- (void)setAvatarGenerator:(id)a3;
- (void)setCategorizationState:(id)a3;
- (void)setEmailAddresses:(id)a3;
- (void)setHideFollowUp:(BOOL)a3;
- (void)setHintsBySnippetZone:(id)a3;
- (void)setRecipientType:(int64_t)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSubject:(id)a3;
- (void)setSubjectIsPresent:(BOOL)a3;
@end

@implementation MessageListCellViewModel

- (NSDictionary)hintsBySnippetZone
{
  return self->_hintsBySnippetZone;
}

- (NSArray)addressList
{
  return self->_addressList;
}

- (NSString)categorizationState
{
  return self->_categorizationState;
}

- (MessageListCellViewModel)initWithBuilder:(id)a3
{
  v5 = (void (**)(id, MessageListCellViewModel *))a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"MessageListCellViewModel.m", 30, @"Invalid parameter not satisfying: %@", @"builderBlock" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)MessageListCellViewModel;
  v6 = [(MessageListCellViewModel *)&v10 init];
  v7 = v6;
  if (v6)
  {
    [(MessageListCellViewModel *)v6 setSubjectIsPresent:1];
    [(MessageListCellViewModel *)v7 setAddressIsPresent:1];
    v5[2](v5, v7);
  }

  return v7;
}

- (void)setSubjectIsPresent:(BOOL)a3
{
  self->_subjectIsPresent = a3;
}

- (void)setAddressIsPresent:(BOOL)a3
{
  self->_addressIsPresent = a3;
}

- (BOOL)subjectIsPresent
{
  return self->_subjectIsPresent;
}

- (void)setSubject:(id)a3
{
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void)setRecipientType:(int64_t)a3
{
  self->_recipientType = a3;
}

- (void)setHintsBySnippetZone:(id)a3
{
}

- (void)setHideFollowUp:(BOOL)a3
{
  self->_hideFollowUp = a3;
}

- (void)setEmailAddresses:(id)a3
{
}

- (void)setAttributedAddress:(id)a3
{
}

- (void)setAddressList:(id)a3
{
}

- (void)setAddress:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (NSString)subject
{
  return self->_subject;
}

- (int64_t)recipientType
{
  return self->_recipientType;
}

- (NSAttributedString)attributedAddress
{
  return self->_attributedAddress;
}

- (NSString)address
{
  return self->_address;
}

- (BOOL)addressIsPresent
{
  return self->_addressIsPresent;
}

- (MessageListCellViewModel)initWithItemBuilder:(id)a3
{
  id v5 = a3;
  [(MessageListCellViewModel *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MessageListCellViewModel initWithItemBuilder:]", "MessageListCellViewModel.m", 43, "0");
}

- (BOOL)hideFollowUp
{
  return self->_hideFollowUp;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void)setCategorizationState:(id)a3
{
}

- (BOOL)allowAuthenticationWarning
{
  return self->_allowAuthenticationWarning;
}

- (void)setAllowAuthenticationWarning:(BOOL)a3
{
  self->_allowAuthenticationWarning = a3;
}

- (MUIAvatarImageContext)avatarContext
{
  return self->_avatarContext;
}

- (void)setAvatarContext:(id)a3
{
}

- (MUIAvatarImageGenerator)avatarGenerator
{
  return self->_avatarGenerator;
}

- (void)setAvatarGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarGenerator, 0);
  objc_storeStrong((id *)&self->_avatarContext, 0);
  objc_storeStrong((id *)&self->_categorizationState, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_addressList, 0);
  objc_storeStrong((id *)&self->_attributedAddress, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_hintsBySnippetZone, 0);
}

@end