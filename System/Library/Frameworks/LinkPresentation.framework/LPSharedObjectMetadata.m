@interface LPSharedObjectMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isCollaboration;
- (BOOL)isEqual:(id)a3;
- (LPImage)icon;
- (LPSharedObjectMetadata)initWithCoder:(id)a3;
- (LPSpecializationMetadata)specialization;
- (NSString)information;
- (NSString)subtitle;
- (NSString)title;
- (id)_applicationFromURL:(id)a3;
- (id)applicationIconWithURL:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)downloadProgressForTransformer:(id)a3;
- (id)fallbackIconForTransformer:(id)a3;
- (id)presentationPropertiesForTransformer:(id)a3;
- (id)previewImageForTransformer:(id)a3;
- (id)previewSummaryForTransformer:(id)a3;
- (id)sourceApplicationMetadataForTransformer:(id)a3;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)populateMetadataForBackwardCompatibility:(id)a3;
- (void)setIcon:(id)a3;
- (void)setInformation:(id)a3;
- (void)setIsCollaboration:(BOOL)a3;
- (void)setSpecialization:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation LPSharedObjectMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPSharedObjectMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)LPSharedObjectMetadata;
  v5 = [(LPSharedObjectMetadata *)&v22 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"title");
    v7 = *(void **)&v5->_isCollaboration;
    *(void *)&v5->_isCollaboration = v6;

    uint64_t v8 = decodeStringForKey(v4, @"subtitle");
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v10 = decodeStringForKey(v4, @"information");
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v10;

    uint64_t v12 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"icon");
    information = v5->_information;
    v5->_information = (NSString *)v12;

    *(&v5->super.__disallowsURLOverrideByDelegate + 1) = [v4 decodeBoolForKey:@"isCollaboration"];
    if ([v4 containsValueForKey:@"specialization"])
    {
      v14 = decodableSpecializationClasses(objc_msgSend(v4, "_lp_coderType"));
      id v21 = 0;
      uint64_t v15 = objc_msgSend(v4, "_lp_strictlyDecodeTopLevelObjectOfClasses:forKey:error:", v14, @"specialization", &v21);
      id v16 = v21;
      icon = v5->_icon;
      v5->_icon = (LPImage *)v15;

      if (v16)
      {
        v18 = LPLogChannelSerialization();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[LPSharedObjectMetadata initWithCoder:]();
        }
      }
    }
    v19 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", *(void *)&self->_isCollaboration, @"title");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_title, @"subtitle");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_subtitle, @"information");
  [v4 encodeBool:*((unsigned __int8 *)&self->super.__disallowsURLOverrideByDelegate + 1) forKey:@"isCollaboration"];
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_information, @"icon");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_icon, @"specialization");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPSharedObjectMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPSharedObjectMetadata *)self title];
    [(LPSharedObjectMetadata *)v4 setTitle:v5];

    uint64_t v6 = [(LPSharedObjectMetadata *)self subtitle];
    [(LPSharedObjectMetadata *)v4 setSubtitle:v6];

    v7 = [(LPSharedObjectMetadata *)self information];
    [(LPSharedObjectMetadata *)v4 setInformation:v7];

    [(LPSharedObjectMetadata *)v4 setIsCollaboration:[(LPSharedObjectMetadata *)self isCollaboration]];
    uint64_t v8 = [(LPSharedObjectMetadata *)self icon];
    [(LPSharedObjectMetadata *)v4 setIcon:v8];

    v9 = [(LPSharedObjectMetadata *)self specialization];
    [(LPSharedObjectMetadata *)v4 setSpecialization:v9];

    uint64_t v10 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)LPSharedObjectMetadata;
  if ([(LPSharedObjectMetadata *)&v18 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (unsigned __int8 *)v4;
      v7 = *(void **)&self->_isCollaboration;
      uint64_t v8 = [v6 title];
      LOBYTE(v7) = objectsAreEqual_0(v7, v8);

      if ((v7 & 1) == 0) {
        goto LABEL_11;
      }
      title = self->_title;
      uint64_t v10 = [v6 subtitle];
      LOBYTE(title) = objectsAreEqual_0(title, v10);

      if ((title & 1) == 0) {
        goto LABEL_11;
      }
      subtitle = self->_subtitle;
      uint64_t v12 = [v6 information];
      LOBYTE(subtitle) = objectsAreEqual_0(subtitle, v12);

      if ((subtitle & 1) == 0) {
        goto LABEL_11;
      }
      if (v6[11] == *((unsigned __int8 *)&self->super.__disallowsURLOverrideByDelegate + 1)
        && (information = self->_information,
            [v6 icon],
            v14 = objc_claimAutoreleasedReturnValue(),
            LOBYTE(information) = objectsAreEqual_0(information, v14),
            v14,
            (information & 1) != 0))
      {
        icon = self->_icon;
        id v16 = [v6 specialization];
        char v5 = objectsAreEqual_0(icon, v16);
      }
      else
      {
LABEL_11:
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
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"title", @"subtitle", @"information", @"icon", @"isCollaboration", @"specialization", 0);
}

- (void)_enumerateAsynchronousFields:(id)a3
{
}

- (NSString)title
{
  return *(NSString **)&self->_isCollaboration;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_title;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)information
{
  return self->_subtitle;
}

- (void)setInformation:(id)a3
{
}

- (LPImage)icon
{
  return (LPImage *)self->_information;
}

- (void)setIcon:(id)a3
{
}

- (BOOL)isCollaboration
{
  return *(&self->super.__disallowsURLOverrideByDelegate + 1);
}

- (void)setIsCollaboration:(BOOL)a3
{
  *(&self->super.__disallowsURLOverrideByDelegate + 1) = a3;
}

- (LPSpecializationMetadata)specialization
{
  return (LPSpecializationMetadata *)self->_icon;
}

- (void)setSpecialization:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_information, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_isCollaboration, 0);
}

- (id)_applicationFromURL:(id)a3
{
  id v3 = a3;
  if (v3 && ([MEMORY[0x1E4F22398] currentProcessHasReadAccess] & 1) != 0)
  {
    id v11 = 0;
    id v4 = [MEMORY[0x1E4F22398] appLinksWithURL:v3 limit:1 includeLinksForCurrentApplication:1 error:&v11];
    id v5 = v11;
    if (v4)
    {
      uint64_t v6 = [v4 firstObject];
      if ([v6 isEnabled])
      {
        v7 = [v6 targetApplicationRecord];
        uint64_t v8 = [v7 localizedName];
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
    else
    {
      v9 = LPLogChannelUI();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(LPSharedObjectMetadata(Transformers) *)(uint64_t)v3 _applicationFromURL:v9];
      }
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 commonPresentationPropertiesForStyle:47];
  uint64_t v6 = [(LPSharedObjectMetadata *)self specialization];
  int v7 = [v6 conformsToProtocol:&unk_1EF725228];

  if (v7)
  {
    v56 = [(LPSharedObjectMetadata *)self specialization];
  }
  else
  {
    v56 = 0;
  }
  v54 = [v4 originalURL];
  uint64_t v8 = [(LPSharedObjectMetadata *)self title];
  v9 = v8;
  if (v8)
  {
    id v52 = v8;
  }
  else
  {
    id v52 = [v56 sharedObjectTitleForTransformer:v4];
  }

  uint64_t v10 = [(LPSharedObjectMetadata *)self icon];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [v56 sharedObjectIconForTransformer:v4];
  }
  v13 = v12;

  if ([v4 isInComposeContext])
  {
    id v55 = 0;
    v14 = 0;
  }
  else
  {
    uint64_t v15 = [(LPSharedObjectMetadata *)self information];
    id v16 = v15;
    if (v15)
    {
      id v55 = v15;
    }
    else
    {
      id v55 = [v56 sharedObjectInformationForTransformer:v4];
    }

    if (!v54
      || ([v54 isFileURL] & 1) != 0
      || +[LPPresentationSpecializations isiCloudURL:v54])
    {
      v17 = [(LPSharedObjectMetadata *)self subtitle];
      objc_super v18 = v17;
      if (v17)
      {
        id v19 = v17;
      }
      else
      {
        id v19 = [v56 sharedObjectSubtitleForTransformer:v4];
      }
      v14 = v19;
    }
    else if (v56 {
           || ([(LPSharedObjectMetadata *)self _applicationFromURL:v54],
    }
               (v14 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v14 = objc_msgSend(v4, "domainName", v52);
    }
  }
  uint64_t v20 = objc_msgSend(v4, "_rowConfigurationForStyle:", objc_msgSend(v5, "style", v52));
  if (v20 && ![(LPSharedObjectMetadata *)self isCollaboration])
  {
    uint64_t v21 = joinedByDot(v14, v55);

    v14 = (void *)v21;
  }
  if ([v4 sharedObjectDownloadState])
  {
    objc_super v22 = [LPLinkMetadataDownloadProgressTransformer alloc];
    uint64_t v23 = [v4 bytesLoaded];
    uint64_t v24 = [v4 sharedObjectDownloadState];
    v25 = [v4 metadata];
    v26 = [(LPLinkMetadataDownloadProgressTransformer *)v22 initWithBytesLoaded:v23 downloadState:v24 metadata:v25];

    v27 = [(LPSharedObjectMetadata *)self downloadProgressForTransformer:v26];
    uint64_t v28 = [v27 subtitle];

    v14 = (void *)v28;
  }
  v29 = objc_alloc_init(LPCaptionBarPresentationProperties);
  [v5 setCaptionBar:v29];

  if ((unint64_t)(v20 - 1) >= 3)
  {
    if (v20) {
      goto LABEL_32;
    }
    v33 = joinedByDot(v53, v14);
    v34 = [v5 captionBar];
    v35 = [v34 top];
    v36 = [v35 leading];
    [v36 setText:v33];
  }
  else
  {
    v30 = [v5 captionBar];
    v31 = [v30 top];
    v32 = [v31 leading];
    [v32 setText:v53];

    v33 = [v5 captionBar];
    v34 = [v33 bottom];
    v35 = [v34 leading];
    [v35 setText:v14];
  }

LABEL_32:
  if (!v13)
  {
    v13 = +[LPResources safariIcon];
  }
  if ([v4 effectiveSizeClass])
  {
    v37 = 0;
    goto LABEL_46;
  }
  v38 = objc_alloc_init(LPCaptionButtonPresentationProperties);
  [(LPCaptionButtonPresentationProperties *)v38 setType:1];
  [(LPCaptionButtonPresentationProperties *)v38 setRequiresInlineButton:MEMORY[0x1E4F1CC38]];
  -[LPCaptionButtonPresentationProperties setDisabled:](v38, "setDisabled:", [v4 isInComposeContext]);
  if ([(LPSharedObjectMetadata *)self isCollaboration])
  {
    v39 = @"person.2.fill";
  }
  else
  {
    v46 = [(LPSharedObjectMetadata *)self specialization];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_44;
    }
    v47 = [(LPSharedObjectMetadata *)self specialization];
    unint64_t v48 = [v47 size];
    unint64_t v49 = [v4 bytesLoaded];

    if (v48 <= v49)
    {
LABEL_44:
      v45 = 0;
      goto LABEL_45;
    }
    v39 = @"square.and.arrow.down";
  }
  uint64_t v40 = objc_msgSend(MEMORY[0x1E4FB1818], "_lp_systemImageNamed:", v39);
  if (!v40) {
    goto LABEL_44;
  }
  v41 = [[LPImage alloc] initWithPlatformImage:v40];
  v42 = +[LPButtonAction actionWithTitle:0 image:v41 handler:0];
  v57[0] = v42;
  v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:1];
  [(LPCaptionButtonPresentationProperties *)v38 setActions:v43];

  v44 = [v5 captionBar];
  [v44 setButton:v38];

  v45 = (void *)v40;
LABEL_45:
  v37 = objc_alloc_init(LPImagePresentationProperties);
  [(LPImagePresentationProperties *)v37 setCanAdjustHorizontalPaddingForFixedSize:1];

LABEL_46:
  if ([v56 sharedObjectPrefersIconAsImageForTransformer:v4])
  {
    [v4 _populateProperties:v5 withPrimaryImage:v13];
    v50 = [(LPSharedObjectMetadata *)self applicationIconWithURL:v54];
    [v4 _populateProperties:v5 withPrimaryIcon:v50 iconProperties:0 canBecomeImage:0];
  }
  else
  {
    [v4 _populateProperties:v5 withPrimaryIcon:v13 iconProperties:v37 canBecomeImage:0];
  }

  return v5;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return 1;
}

- (id)applicationIconWithURL:(id)a3
{
  id v4 = a3;
  if (+[LPPresentationSpecializations isiCloudURL:v4])
  {
    id v5 = +[LPiCloudSharingMetadata extractApplicationFromURL:v4];
  }
  else
  {
    uint64_t v6 = [(LPSharedObjectMetadata *)self specialization];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v8 = [(LPSharedObjectMetadata *)self specialization];
      v9 = [v8 type];

      if (objc_msgSend(v9, "_lp_hasCaseInsensitivePrefix:", @"com.apple.iwork.pages"))
      {
        id v5 = @"Pages";
      }
      else if (objc_msgSend(v9, "_lp_hasCaseInsensitivePrefix:", @"com.apple.iwork.numbers"))
      {
        id v5 = @"Numbers";
      }
      else if (objc_msgSend(v9, "_lp_hasCaseInsensitivePrefix:", @"com.apple.iwork.keynote"))
      {
        id v5 = @"Keynote";
      }
      else
      {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = 0;
    }
  }
  if ([(__CFString *)v5 _lp_isEqualIgnoringCase:@"pages"])
  {
    uint64_t v10 = +[LPResources pagesIcon];
LABEL_22:
    id v11 = (void *)v10;
    goto LABEL_23;
  }
  if ([(__CFString *)v5 _lp_isEqualIgnoringCase:@"numbers"])
  {
    uint64_t v10 = +[LPResources numbersIcon];
    goto LABEL_22;
  }
  if ([(__CFString *)v5 _lp_isEqualIgnoringCase:@"keynote"])
  {
    uint64_t v10 = +[LPResources keynoteIcon];
    goto LABEL_22;
  }
  if (([(__CFString *)v5 _lp_isEqualIgnoringCase:@"freeform"] & 1) != 0
    || [(__CFString *)v5 _lp_isEqualIgnoringCase:@"freeform-copy"])
  {
    uint64_t v10 = +[LPResources freeformIcon];
    goto LABEL_22;
  }
  if ([(__CFString *)v5 _lp_isEqualIgnoringCase:@"iclouddrive"])
  {
    uint64_t v10 = +[LPResources iCloudDriveIcon];
    goto LABEL_22;
  }
  if ([(__CFString *)v5 _lp_isEqualIgnoringCase:@"safari-tab-groups"])
  {
    uint64_t v10 = +[LPResources safariAppIconBadge];
    goto LABEL_22;
  }
  id v11 = 0;
LABEL_23:

  return v11;
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  id v9 = a3;
  id v4 = [(LPSharedObjectMetadata *)self specialization];
  if ([v4 conformsToProtocol:&unk_1EF724770])
  {
    id v5 = [(LPSharedObjectMetadata *)self specialization];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      int v7 = [(LPSharedObjectMetadata *)self specialization];
      [v7 populateMetadataForBackwardCompatibility:v9];
      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v8 = [(LPSharedObjectMetadata *)self title];
  [v9 setTitle:v8];

  int v7 = [(LPSharedObjectMetadata *)self icon];
  [v9 setIcon:v7];
LABEL_6:
}

- (id)previewSummaryForTransformer:(id)a3
{
  id v6 = a3;
  int v7 = [v6 metadata];
  uint64_t v8 = [v7 originalURL];
  BOOL v9 = +[LPPresentationSpecializations isiCloudURL:v8];

  if (v9)
  {
    uint64_t v10 = [(LPSharedObjectMetadata *)self specialization];
    if ([v10 conformsToProtocol:&unk_1EF725228])
    {
      id v11 = [(LPSharedObjectMetadata *)self specialization];
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        v13 = [(LPSharedObjectMetadata *)self specialization];
        uint64_t v14 = [v13 sharedObjectPreviewSummaryForTransformer:v6];
LABEL_9:
        objc_super v18 = (void *)v14;
        goto LABEL_16;
      }
    }
    else
    {
    }
    uint64_t v15 = [(LPSharedObjectMetadata *)self specialization];
    if ([v15 conformsToProtocol:&unk_1EF7246E0])
    {
      id v16 = [(LPSharedObjectMetadata *)self specialization];
      char v17 = objc_opt_respondsToSelector();

      if (v17)
      {
        v13 = [(LPSharedObjectMetadata *)self specialization];
        uint64_t v14 = [v13 previewSummaryForTransformer:v6];
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  id v19 = [v6 metadata];
  uint64_t v20 = [v19 originalURL];
  v13 = [(LPSharedObjectMetadata *)self _applicationFromURL:v20];

  uint64_t v21 = NSString;
  objc_super v22 = LPLocalizedString(@"Link: “%@” shared from %@");
  uint64_t v23 = [(LPSharedObjectMetadata *)self title];
  uint64_t v24 = v13;
  if (!v13)
  {
    id v3 = [v6 metadata];
    id v4 = [v3 originalURL];
    uint64_t v24 = objc_msgSend(v4, "_lp_simplifiedStringForDisplayOnly:", 0);
  }
  objc_super v18 = objc_msgSend(v21, "stringWithFormat:", v22, v23, v24);
  if (!v13)
  {
  }
LABEL_16:

  return v18;
}

- (id)previewImageForTransformer:(id)a3
{
  id v4 = a3;
  id v5 = [(LPSharedObjectMetadata *)self specialization];
  if ([v5 conformsToProtocol:&unk_1EF7246E0])
  {
    id v6 = [(LPSharedObjectMetadata *)self specialization];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      uint64_t v8 = [(LPSharedObjectMetadata *)self specialization];
      BOOL v9 = [v8 previewImageForTransformer:v4];

      goto LABEL_6;
    }
  }
  else
  {
  }
  BOOL v9 = [(LPSharedObjectMetadata *)self icon];
LABEL_6:

  return v9;
}

- (id)sourceApplicationMetadataForTransformer:(id)a3
{
  id v4 = a3;
  id v5 = [(LPSharedObjectMetadata *)self specialization];
  if (([v5 conformsToProtocol:&unk_1EF725228] & 1) == 0)
  {

    goto LABEL_5;
  }
  id v6 = [(LPSharedObjectMetadata *)self specialization];
  char v7 = [v6 sharedObjectPrefersIconAsImageForTransformer:v4];

  if ((v7 & 1) == 0)
  {
LABEL_5:
    BOOL v9 = [v4 originalURL];
    uint64_t v10 = [(LPSharedObjectMetadata *)self applicationIconWithURL:v9];

    if (v10)
    {
      uint64_t v8 = objc_alloc_init(LPSourceApplicationMetadata);
      [(LPSourceApplicationMetadata *)v8 setIcon:v10];
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_9;
  }
  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

- (id)downloadProgressForTransformer:(id)a3
{
  id v4 = a3;
  if ([(LPSharedObjectMetadata *)self isCollaboration])
  {
    id v5 = 0;
  }
  else
  {
    id v6 = [(LPSharedObjectMetadata *)self specialization];
    char v7 = [v6 type];

    if (v7)
    {
      uint64_t v8 = [v6 type];
      char v7 = +[LPFileMetadata descriptionForUTI:v8];
    }
    unint64_t v9 = [v4 bytesLoaded];
    unint64_t v10 = [v6 size];
    if ([v6 size])
    {
      id v11 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", objc_msgSend(v6, "size"), 0);
      if (v9 < v10)
      {
        v13 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", objc_msgSend(v4, "bytesLoaded"), 0);
        uint64_t v14 = NSString;
        uint64_t v15 = LPLocalizedString(@"%@ of %@");
        char v12 = objc_msgSend(v14, "stringWithFormat:", v15, v13, v11);
      }
      else
      {
        char v12 = joinedByDot(v7, v11);
      }
    }
    else
    {
      char v12 = 0;
    }
    double v16 = 1.0;
    if (v9 < v10)
    {
      unint64_t v17 = [v4 bytesLoaded];
      double v16 = (double)v17 / (double)(unint64_t)[v6 size];
    }
    id v5 = [[LPDownloadProgress alloc] initWithProgress:v12 subtitle:v9 >= v10 isFinished:v16];
  }

  return v5;
}

- (id)fallbackIconForTransformer:(id)a3
{
  id v3 = a3;
  id v4 = [v3 originalURL];
  BOOL v5 = +[LPPresentationSpecializations isiCloudURL:v4];

  if (v5)
  {
    id v6 = +[LPResources iCloudIcon];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)initWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A35DC000, v0, v1, "Failed to decode LPSharedObjectMetadata 'provider' with error: %@", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A35DC000, v0, v1, "Failed to decode LPSharedObjectMetadata 'provider' with exception: %@", v2, v3, v4, v5, v6);
}

@end