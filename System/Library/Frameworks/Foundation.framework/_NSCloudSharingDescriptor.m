@interface _NSCloudSharingDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)invitationsSentViaThirdPartyService;
- (BOOL)publicShare;
- (NSString)sharedContentType;
- (_NSCloudSharingDescriptor)initWithCoder:(id)a3;
- (id)_variantSubstrings;
- (int64_t)numberOfInvitations;
- (int64_t)operation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setInvitationsSentViaThirdPartyService:(BOOL)a3;
- (void)setNumberOfInvitations:(int64_t)a3;
- (void)setOperation:(int64_t)a3;
- (void)setPublicShare:(BOOL)a3;
- (void)setSharedContentType:(id)a3;
@end

@implementation _NSCloudSharingDescriptor

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)_NSCloudSharingDescriptor;
  [(_NSCloudSharingDescriptor *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSCloudSharingDescriptor)initWithCoder:(id)a3
{
  self->_operation = [a3 decodeIntegerForKey:@"NSShareOperation"];
  self->_invitationsSentViaThirdPartyService = [a3 decodeBoolForKey:@"NSShareViaThirdParty"];
  self->_publicShare = [a3 decodeBoolForKey:@"NSSharePublic"];
  self->_numberOfInvitations = [a3 decodeIntegerForKey:@"NSShareNumberOfInviations"];
  self->_sharedContentType = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSShareContentType"];
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInteger:self->_operation forKey:@"NSShareOperation"];
  [a3 encodeBool:self->_invitationsSentViaThirdPartyService forKey:@"NSShareViaThirdParty"];
  [a3 encodeBool:self->_publicShare forKey:@"NSSharePublic"];
  [a3 encodeInteger:self->_numberOfInvitations forKey:@"NSShareNumberOfInviations"];
  sharedContentType = self->_sharedContentType;

  [a3 encodeObject:sharedContentType forKey:@"NSShareContentType"];
}

- (id)_variantSubstrings
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = v3;
  unint64_t v5 = self->_operation - 1;
  if (v5 < 3)
  {
    v6 = off_1E51F7888[v5];
LABEL_13:
    [v4 addObject:v6];
    return v4;
  }
  if (self->_publicShare)
  {
    v7 = @"Public";
LABEL_9:
    [v3 addObject:v7];
    goto LABEL_10;
  }
  if (self->_invitationsSentViaThirdPartyService)
  {
    v7 = @"3rdParty";
    goto LABEL_9;
  }
  if (self->_numberOfInvitations >= 2)
  {
    v7 = @"Multiple";
    goto LABEL_9;
  }
LABEL_10:
  if (((unsigned int (*)(uint64_t, uint64_t))softLinkUTTypeConformsTo[0])((uint64_t)self->_sharedContentType, @"public.presentation")|| [(NSString *)self->_sharedContentType isEqualToString:@"key"])
  {
    v6 = @"Presentation";
    goto LABEL_13;
  }
  if (((unsigned int (*)(uint64_t, uint64_t))softLinkUTTypeConformsTo[0])((uint64_t)self->_sharedContentType, @"public.spreadsheet")|| [(NSString *)self->_sharedContentType isEqualToString:@"numbers"])
  {
    v6 = @"Spreadsheet";
    goto LABEL_13;
  }
  if (((unsigned int (*)(uint64_t, uint64_t))softLinkUTTypeConformsTo[0])((uint64_t)self->_sharedContentType, @"com.apple.notes.note"))
  {
    v6 = @"Note";
    goto LABEL_13;
  }
  if (((unsigned int (*)(uint64_t, uint64_t))softLinkUTTypeConformsTo[0])((uint64_t)self->_sharedContentType, @"com.apple.iwork.pages.pages")|| [(NSString *)self->_sharedContentType isEqualToString:@"pages"])
  {
    v6 = @"Document";
    goto LABEL_13;
  }
  return v4;
}

- (int64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(int64_t)a3
{
  self->_operation = a3;
}

- (BOOL)invitationsSentViaThirdPartyService
{
  return self->_invitationsSentViaThirdPartyService;
}

- (void)setInvitationsSentViaThirdPartyService:(BOOL)a3
{
  self->_invitationsSentViaThirdPartyService = a3;
}

- (BOOL)publicShare
{
  return self->_publicShare;
}

- (void)setPublicShare:(BOOL)a3
{
  self->_publicShare = a3;
}

- (int64_t)numberOfInvitations
{
  return self->_numberOfInvitations;
}

- (void)setNumberOfInvitations:(int64_t)a3
{
  self->_numberOfInvitations = a3;
}

- (NSString)sharedContentType
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSharedContentType:(id)a3
{
}

@end