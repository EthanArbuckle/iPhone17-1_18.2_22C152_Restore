@interface LPApplePhotosSharedLibraryInvitationMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LPApplePhotosSharedLibraryInvitationMetadata)initWithCoder:(id)a3;
- (NSString)message;
- (NSString)originatorDisplayName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)presentationPropertiesForTransformer:(id)a3;
- (id)previewImageForTransformer:(id)a3;
- (id)previewSummaryForTransformer:(id)a3;
- (id)sharedLibraryInvitationMessage;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setMessage:(id)a3;
- (void)setOriginatorDisplayName:(id)a3;
@end

@implementation LPApplePhotosSharedLibraryInvitationMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPApplePhotosSharedLibraryInvitationMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPApplePhotosSharedLibraryInvitationMetadata;
  v5 = [(LPApplePhotosSharedLibraryInvitationMetadata *)&v12 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"message");
    message = v5->_message;
    v5->_message = (NSString *)v6;

    uint64_t v8 = decodeStringForKey(v4, @"originatorDisplayName");
    originatorDisplayName = v5->_originatorDisplayName;
    v5->_originatorDisplayName = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_message, @"message");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_originatorDisplayName, @"originatorDisplayName");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPApplePhotosSharedLibraryInvitationMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPApplePhotosSharedLibraryInvitationMetadata *)self message];
    [(LPApplePhotosSharedLibraryInvitationMetadata *)v4 setMessage:v5];

    uint64_t v6 = [(LPApplePhotosSharedLibraryInvitationMetadata *)self originatorDisplayName];
    [(LPApplePhotosSharedLibraryInvitationMetadata *)v4 setOriginatorDisplayName:v6];

    v7 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPApplePhotosSharedLibraryInvitationMetadata;
  if ([(LPApplePhotosSharedLibraryInvitationMetadata *)&v8 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void **)v4;
      if (objectsAreEqual_0(v6[2], self->_message)) {
        char v5 = objectsAreEqual_0(v6[3], self->_originatorDisplayName);
      }
      else {
        char v5 = 0;
      }
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_message hash];
  return [(NSString *)self->_originatorDisplayName hash] ^ v3;
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"message", @"originatorDisplayName", 0);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)originatorDisplayName
{
  return self->_originatorDisplayName;
}

- (void)setOriginatorDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatorDisplayName, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

- (id)sharedLibraryInvitationMessage
{
  NSUInteger v3 = [(LPApplePhotosSharedLibraryInvitationMetadata *)self originatorDisplayName];

  if (v3)
  {
    id v4 = NSString;
    char v5 = LPLocalizedString(@"%@ wants you to join a Shared Library in Photos");
    uint64_t v6 = [(LPApplePhotosSharedLibraryInvitationMetadata *)self originatorDisplayName];
    v7 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v6);
  }
  else
  {
    v7 = [(LPApplePhotosSharedLibraryInvitationMetadata *)self message];
  }

  return v7;
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4 = a3;
  char v5 = [v4 metadata];
  uint64_t v6 = [v5 title];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    LPLocalizedString(@"Shared Library Invitation");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  v10 = +[LPImage _PNGImageNamed:@"InvitationIcon"];
  v11 = objc_alloc_init(LPWebLinkPresentationProperties);
  [(LPWebLinkPresentationProperties *)v11 setStyle:50];
  objc_super v12 = objc_alloc_init(LPCaptionBarPresentationProperties);
  [(LPWebLinkPresentationProperties *)v11 setCaptionBar:v12];

  v13 = [(LPWebLinkPresentationProperties *)v11 captionBar];
  v14 = [v13 top];
  v15 = [v14 leading];
  [v15 setText:v9];

  v16 = [(LPApplePhotosSharedLibraryInvitationMetadata *)self sharedLibraryInvitationMessage];
  v17 = [(LPWebLinkPresentationProperties *)v11 captionBar];
  v18 = [v17 bottom];
  v19 = [v18 leading];
  [v19 setText:v16];

  v20 = [(LPWebLinkPresentationProperties *)v11 captionBar];
  v21 = [v20 bottom];
  v22 = [v21 leading];
  [v22 setMaximumNumberOfLines:&unk_1EF7127C8];

  if ([v4 effectiveSizeClass] == 1
    || [v4 effectiveSizeClass] == 2
    || [v4 effectiveSizeClass] == 12)
  {
    v23 = [(LPWebLinkPresentationProperties *)v11 captionBar];
    [v23 setLeadingIcon:v10];

    v24 = objc_alloc_init(LPImagePresentationProperties);
    v25 = [(LPWebLinkPresentationProperties *)v11 captionBar];
    [v25 setLeadingIconProperties:v24];

    v26 = [(LPWebLinkPresentationProperties *)v11 captionBar];
    v27 = [v26 leadingIconProperties];
    [v27 setFilter:5];
  }
  else
  {
    [(LPWebLinkPresentationProperties *)v11 setImage:v10];
  }

  return v11;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isApplePhotosSharedLibraryInvitationURL:a3];
}

- (id)previewSummaryForTransformer:(id)a3
{
  NSUInteger v3 = [(LPApplePhotosSharedLibraryInvitationMetadata *)self sharedLibraryInvitationMessage];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    LPLocalizedString(@"Photos: Shared Library Invitation");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v6 = v5;

  return v6;
}

- (id)previewImageForTransformer:(id)a3
{
  return 0;
}

@end