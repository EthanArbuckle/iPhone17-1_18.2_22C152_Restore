@interface LPPasswordsInviteMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)_disallowsURLOverrideByDelegate;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldDonateToSharedWithYouForTransformer:(id)a3;
- (LPImage)icon;
- (LPPasswordsInviteMetadata)initWithCoder:(id)a3;
- (NSString)buttonTitle;
- (NSString)groupName;
- (NSString)subtitle;
- (NSString)title;
- (NSString)urlParameters;
- (id)_baseURL;
- (id)_overrideURL;
- (id)_subtitle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)presentationPropertiesForTransformer:(id)a3;
- (id)previewImageForTransformer:(id)a3;
- (id)previewSummaryForTransformer:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)populateMetadataForBackwardCompatibility:(id)a3;
- (void)setButtonTitle:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setIcon:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUrlParameters:(id)a3;
@end

@implementation LPPasswordsInviteMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPPasswordsInviteMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPPasswordsInviteMetadata;
  v5 = [(LPPasswordsInviteMetadata *)&v12 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"groupName");
    groupName = v5->_groupName;
    v5->_groupName = (NSString *)v6;

    uint64_t v8 = decodeStringForKey(v4, @"urlParameters");
    urlParameters = v5->_urlParameters;
    v5->_urlParameters = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_groupName, @"groupName");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_urlParameters, @"urlParameters");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPPasswordsInviteMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPPasswordsInviteMetadata *)self groupName];
    [(LPPasswordsInviteMetadata *)v4 setGroupName:v5];

    uint64_t v6 = [(LPPasswordsInviteMetadata *)self urlParameters];
    [(LPPasswordsInviteMetadata *)v4 setUrlParameters:v6];

    v7 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPPasswordsInviteMetadata;
  if ([(LPPasswordsInviteMetadata *)&v12 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      groupName = self->_groupName;
      uint64_t v8 = [v6 groupName];
      LOBYTE(groupName) = objectsAreEqual_0(groupName, v8);

      if (groupName)
      {
        urlParameters = self->_urlParameters;
        v10 = [v6 urlParameters];
        char v5 = objectsAreEqual_0(urlParameters, v10);
      }
      else
      {
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

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"groupName", @"urlParameters", 0);
}

- (BOOL)_disallowsURLOverrideByDelegate
{
  return 1;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
}

- (NSString)urlParameters
{
  return self->_urlParameters;
}

- (void)setUrlParameters:(id)a3
{
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

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (void)setButtonTitle:(id)a3
{
}

- (LPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_urlParameters, 0);

  objc_storeStrong((id *)&self->_groupName, 0);
}

- (id)_subtitle
{
  v3 = NSString;
  id v4 = LPLocalizedString(@"You have been invited to join the group “%@”.");
  char v5 = [(LPPasswordsInviteMetadata *)self groupName];
  id v6 = objc_msgSend(v3, "stringWithFormat:", v4, v5);

  return v6;
}

- (id)_baseURL
{
  return @"prefs:root=PASSWORDS&";
}

- (id)_overrideURL
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2050000000;
  v3 = (void *)getSFPasswordManagerURLClass_softClass;
  uint64_t v31 = getSFPasswordManagerURLClass_softClass;
  if (!getSFPasswordManagerURLClass_softClass)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __getSFPasswordManagerURLClass_block_invoke;
    v27[3] = &unk_1E5B04EB8;
    v27[4] = &v28;
    __getSFPasswordManagerURLClass_block_invoke((uint64_t)v27);
    v3 = (void *)v29[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v28, 8);
  if (objc_opt_respondsToSelector())
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F29088]);
    uint64_t v6 = [(LPPasswordsInviteMetadata *)self urlParameters];
    v7 = (void *)v6;
    if (v6) {
      uint64_t v8 = (__CFString *)v6;
    }
    else {
      uint64_t v8 = &stru_1EF6D6D90;
    }
    [v5 setQuery:v8];

    v9 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v10 = objc_msgSend(v5, "queryItems", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v10);
          }
          v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v15 = [v14 value];
          v16 = [v14 name];
          [v9 setObject:v15 forKeyedSubscript:v16];
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v32 count:16];
      }
      while (v11);
    }

    v17 = [v4 passwordManagerURLWithParameters:v9];
  }
  else
  {
    id v5 = [(LPPasswordsInviteMetadata *)self _baseURL];
    v18 = [(LPPasswordsInviteMetadata *)self urlParameters];
    uint64_t v19 = [v18 length];

    if (v19)
    {
      v20 = [(LPPasswordsInviteMetadata *)self urlParameters];
      uint64_t v21 = [v5 stringByAppendingString:v20];

      id v5 = (id)v21;
    }
    v17 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
  }

  return v17;
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4 = [a3 unspecializedPresentationProperties];
  id v5 = LPLocalizedString(@"Shared Passwords");
  uint64_t v6 = [v4 captionBar];
  v7 = [v6 top];
  uint64_t v8 = [v7 leading];
  [v8 setText:v5];

  v9 = [(LPPasswordsInviteMetadata *)self _subtitle];
  v10 = [v4 captionBar];
  uint64_t v11 = [v10 bottom];
  uint64_t v12 = [v11 leading];
  [v12 setText:v9];

  v13 = [v4 captionBar];
  v14 = [v13 bottom];
  v15 = [v14 leading];
  [v15 setMaximumNumberOfLines:&unk_1EF712690];

  v16 = [v4 captionBar];
  [v16 setLeadingIcon:0];

  v17 = [v4 captionBar];
  [v17 setTrailingIcon:0];

  [v4 setOverrideAllowOpeningSensitiveURLs:MEMORY[0x1E4F1CC38]];
  v18 = [(LPPasswordsInviteMetadata *)self _overrideURL];
  [v4 setOverrideURL:v18];

  uint64_t v19 = +[LPResources passwordsInviteIcon];
  [v4 setImage:v19];

  [v4 setStyle:48];

  return v4;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isSharedPasswordsInviteURL:a3];
}

- (id)previewImageForTransformer:(id)a3
{
  v3 = +[LPResources passwordsInviteIcon];

  return v3;
}

- (id)previewSummaryForTransformer:(id)a3
{
  v3 = [(LPPasswordsInviteMetadata *)self _subtitle];

  return v3;
}

- (BOOL)shouldDonateToSharedWithYouForTransformer:(id)a3
{
  return 0;
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  id v5 = a3;
  v3 = LPLocalizedString(@"Shared Passwords Invitation");
  [v5 setTitle:v3];

  id v4 = +[LPImage _PNGImageNamed:@"PasswordsInvite"];
  [v5 setImage:v4];
}

@end