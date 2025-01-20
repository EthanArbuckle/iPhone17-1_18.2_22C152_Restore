@interface CNShareContactActivityItem
- (BOOL)canShareMeCardOnlySharingProperties;
- (BOOL)canSharePronouns;
- (CNContactFormatter)contactFormatter;
- (CNShareContactActivityItem)initWithContact:(id)a3;
- (CNShareContactActivityItem)initWithContacts:(id)a3 inGroupNamed:(id)a4;
- (LPFileMetadata)fileMetadata;
- (LPLinkMetadata)linkMetadata;
- (NSArray)contacts;
- (NSString)groupName;
- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4;
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (id)displayString;
- (id)thumbnailImage;
- (void)setCanShareMeCardOnlySharingProperties:(BOOL)a3;
- (void)setCanSharePronouns:(BOOL)a3;
- (void)setContactFormatter:(id)a3;
- (void)setContacts:(id)a3;
- (void)setFileMetadata:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setLinkMetadata:(id)a3;
@end

@implementation CNShareContactActivityItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_fileMetadata, 0);
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_groupName, 0);

  objc_storeStrong((id *)&self->_contacts, 0);
}

- (void)setContactFormatter:(id)a3
{
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setFileMetadata:(id)a3
{
}

- (LPFileMetadata)fileMetadata
{
  return self->_fileMetadata;
}

- (void)setLinkMetadata:(id)a3
{
}

- (void)setGroupName:(id)a3
{
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setContacts:(id)a3
{
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setCanShareMeCardOnlySharingProperties:(BOOL)a3
{
  self->_canShareMeCardOnlySharingProperties = a3;
}

- (BOOL)canShareMeCardOnlySharingProperties
{
  return self->_canShareMeCardOnlySharingProperties;
}

- (void)setCanSharePronouns:(BOOL)a3
{
  self->_canSharePronouns = a3;
}

- (BOOL)canSharePronouns
{
  return self->_canSharePronouns;
}

- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4
{
  v5 = [(CNShareContactActivityItem *)self contacts];
  uint64_t v6 = [v5 count];

  if (v6 == 1)
  {
    v7 = [(CNShareContactActivityItem *)self contacts];
    v8 = [v7 firstObject];
    v9 = +[CNUIVCardUtilities fileNameForContact:v8];
  }
  else
  {
    v10 = NSString;
    v7 = [(CNShareContactActivityItem *)self displayString];
    v9 = [v10 stringWithFormat:@"%@.vcf", v7];
  }

  return v9;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  return (id)getkUTTypeVCard[0]();
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  double width = a5.width;
  id v7 = a4;
  v8 = [(CNShareContactActivityItem *)self contacts];
  uint64_t v9 = [v8 count];

  if (v9 == 1)
  {
    v10 = [(CNShareContactActivityItem *)self contacts];
    v11 = [v10 firstObject];

    if ([v7 isEqualToString:*MEMORY[0x1E4F43590]])
    {
      v12 = [[CNMonogrammer alloc] initWithStyle:2 diameter:width];
      [(CNMonogrammer *)v12 monogramForContact:v11];
    }
    else
    {
      v14 = (void *)MEMORY[0x1E4FB1818];
      v12 = [v11 thumbnailImageData];
      [v14 imageWithData:v12];
    v13 = };
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  v4 = [(CNShareContactActivityItem *)self linkMetadata];
  v5 = [v4 title];

  return v5;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  v5 = objc_msgSend(MEMORY[0x1E4FB8C18], "optionsFromPreferences", a3, a4);
  [v5 setIncludePhotos:1];
  [v5 setIncludeNotes:1];
  uint64_t v6 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v7 = [v6 featureFlags];
  if ([v7 isFeatureEnabled:12])
  {
    BOOL v8 = [(CNShareContactActivityItem *)self canSharePronouns];

    if (v8)
    {
      [v5 setIncludePronouns:1];
      [v5 setUseUnencryptedPronouns:1];
    }
  }
  else
  {
  }
  objc_msgSend(v5, "setIncludeMeCardOnlySharingProperties:", -[CNShareContactActivityItem canShareMeCardOnlySharingProperties](self, "canShareMeCardOnlySharingProperties"));
  uint64_t v9 = (void *)MEMORY[0x1E4F1B998];
  v10 = [(CNShareContactActivityItem *)self contacts];
  v11 = [v9 dataWithContacts:v10 options:v5 error:0];

  return v11;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C9B8], "data", a3);
}

- (id)thumbnailImage
{
  v3 = [(CNShareContactActivityItem *)self contacts];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    v5 = [(CNShareContactActivityItem *)self contacts];
    uint64_t v6 = [v5 firstObject];

    id v7 = [v6 thumbnailImageData];

    if (v7)
    {
      BOOL v8 = (void *)MEMORY[0x1E4FB1818];
      uint64_t v9 = [v6 thumbnailImageData];
      v10 = [v8 imageWithData:v9];
    }
    else
    {
      v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v11 scale];
      double v13 = v12;

      uint64_t v9 = +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:color:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:color:", [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1, 0, 0, 160.0, 160.0, v13);
      v14 = [CNAvatarImageRenderer alloc];
      v15 = +[CNAvatarImageRendererSettings defaultSettings];
      v16 = [(CNAvatarImageRenderer *)v14 initWithSettings:v15];

      v10 = [(CNAvatarImageRenderer *)v16 renderMonogramForContact:v6 color:0 scope:v9 prohibitedSources:0];
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)displayString
{
  v3 = [(CNShareContactActivityItem *)self contacts];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    v5 = [(CNShareContactActivityItem *)self contacts];
    id v6 = [v5 firstObject];

    id v7 = [(CNShareContactActivityItem *)self contactFormatter];
    BOOL v8 = [v7 stringFromContact:v6];

    uint64_t v9 = *MEMORY[0x1E4F5A298];
    if (!(*(unsigned int (**)(void, void *))(*MEMORY[0x1E4F5A298] + 16))(*MEMORY[0x1E4F5A298], v8)) {
      goto LABEL_7;
    }
    v10 = [v6 phoneNumbers];
    v11 = [v10 firstObject];
    double v12 = [v11 value];

    double v13 = [v12 formattedStringValue];

    if ((*(unsigned int (**)(uint64_t, void *))(v9 + 16))(v9, v13))
    {
      v14 = [v6 emailAddresses];
      v15 = [v14 firstObject];
      uint64_t v16 = [v15 value];

      double v13 = (void *)v16;
    }
  }
  else
  {
    v17 = [CNGroupIdentity alloc];
    v18 = [(CNShareContactActivityItem *)self groupName];
    v19 = [(CNShareContactActivityItem *)self contacts];
    id v6 = [(CNGroupIdentity *)v17 initGroupWithName:v18 photo:0 contacts:v19];

    double v12 = [(CNShareContactActivityItem *)self contactFormatter];
    double v13 = [v12 stringFromGroupIdentity:v6];
  }

  BOOL v8 = v13;
LABEL_7:

  return v8;
}

- (LPLinkMetadata)linkMetadata
{
  linkMetadata = self->_linkMetadata;
  if (!linkMetadata)
  {
    uint64_t v4 = (LPLinkMetadata *)objc_alloc_init((Class)getLPLinkMetadataClass[0]());
    v5 = self->_linkMetadata;
    self->_linkMetadata = v4;

    id v6 = (LPFileMetadata *)objc_alloc_init((Class)getLPFileMetadataClass[0]());
    fileMetadata = self->_fileMetadata;
    self->_fileMetadata = v6;

    BOOL v8 = [(CNShareContactActivityItem *)self displayString];
    [(LPFileMetadata *)self->_fileMetadata setName:v8];

    uint64_t v9 = getkUTTypeVCard[0]();
    [(LPFileMetadata *)self->_fileMetadata setType:v9];

    v10 = [(CNShareContactActivityItem *)self thumbnailImage];
    if (v10)
    {
      v11 = (void *)[objc_alloc((Class)getLPImageClass[0]()) initWithPlatformImage:v10];
      [(LPFileMetadata *)self->_fileMetadata setThumbnail:v11];
    }
    [(LPLinkMetadata *)self->_linkMetadata setSpecialization:self->_fileMetadata];
    double v12 = [(CNShareContactActivityItem *)self displayString];
    [(LPLinkMetadata *)self->_linkMetadata setTitle:v12];

    linkMetadata = self->_linkMetadata;
  }

  return linkMetadata;
}

- (CNShareContactActivityItem)initWithContacts:(id)a3 inGroupNamed:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNShareContactActivityItem;
  uint64_t v9 = [(CNShareContactActivityItem *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contacts, a3);
    objc_storeStrong((id *)&v10->_groupName, a4);
    v11 = (CNContactFormatter *)objc_alloc_init(MEMORY[0x1E4F1B910]);
    contactFormatter = v10->_contactFormatter;
    v10->_contactFormatter = v11;

    [(CNContactFormatter *)v10->_contactFormatter setStyle:0];
    double v13 = v10;
  }

  return v10;
}

- (CNShareContactActivityItem)initWithContact:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v9 count:1];

  id v7 = -[CNShareContactActivityItem initWithContacts:inGroupNamed:](self, "initWithContacts:inGroupNamed:", v6, 0, v9, v10);
  return v7;
}

@end