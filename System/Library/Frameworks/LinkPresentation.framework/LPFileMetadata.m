@interface LPFileMetadata
+ (BOOL)supportsSecureCoding;
+ (id)descriptionForUTI:(id)a3;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)_canDeferAsynchronousFieldsMetadataUpdateUntilCompletion;
- (BOOL)_isImage;
- (BOOL)_isPlainText;
- (BOOL)_isWatchFace;
- (BOOL)_shouldUseBackground;
- (BOOL)_shouldUseCircularIcon;
- (BOOL)_shouldUseSquareIcon;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)sharedObjectPrefersIconAsImageForTransformer:(id)a3;
- (LPFileMetadata)initWithCoder:(id)a3;
- (LPImage)icon;
- (LPImage)smallThumbnail;
- (LPImage)thumbnail;
- (NSDate)creationDate;
- (NSString)name;
- (NSString)type;
- (id)_bottomCaptionStringForTransformer:(id)a3;
- (id)_fileDetailStringForTransformer:(id)a3;
- (id)_fileTypeStringForTransformer:(id)a3;
- (id)_iconIfLoaded;
- (id)_nameForTransformer:(id)a3;
- (id)_singleLineDescriptionForRemoteFileWithTransformer:(id)a3;
- (id)_smallThumbnailIfLoaded;
- (id)_thumbnailIfLoaded;
- (id)_valueForKeyPathIfLoaded:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fallbackIconForTransformer:(id)a3;
- (id)presentationPropertiesForTransformer:(id)a3;
- (id)previewImageForTransformer:(id)a3;
- (id)previewSummaryForTransformer:(id)a3;
- (id)sharedObjectIconForTransformer:(id)a3;
- (id)sharedObjectInformationForTransformer:(id)a3;
- (id)sharedObjectPreviewSummaryForTransformer:(id)a3;
- (id)sharedObjectSubtitleForTransformer:(id)a3;
- (id)sharedObjectTitleForTransformer:(id)a3;
- (int64_t)summaryTypeForTransformer:(id)a3;
- (unint64_t)hash;
- (unint64_t)size;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)populateMetadataForBackwardCompatibility:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setIcon:(id)a3;
- (void)setName:(id)a3;
- (void)setSize:(unint64_t)a3;
- (void)setSmallThumbnail:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)setType:(id)a3;
@end

@implementation LPFileMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPFileMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)LPFileMetadata;
  v5 = [(LPFileMetadata *)&v21 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"name");
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = decodeStringForKey(v4, @"type");
    type = v5->_type;
    v5->_type = (NSString *)v8;

    v10 = decodeNumberForKey(v4, @"size");
    v5->_size = [v10 unsignedLongLongValue];

    uint64_t v11 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"thumbnail");
    thumbnail = v5->_thumbnail;
    v5->_thumbnail = (LPImage *)v11;

    uint64_t v13 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"smallThumbnail");
    smallThumbnail = v5->_smallThumbnail;
    v5->_smallThumbnail = (LPImage *)v13;

    uint64_t v15 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"icon");
    icon = v5->_icon;
    v5->_icon = (LPImage *)v15;

    uint64_t v17 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"creationDate");
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v17;

    v19 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "_lp_encodeStringIfNotNil:forKey:", self->_name, @"name");
  objc_msgSend(v5, "_lp_encodeStringIfNotNil:forKey:", self->_type, @"type");
  if (self->_size)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    objc_msgSend(v5, "_lp_encodeObjectIfNotNil:forKey:", v4, @"size");
  }
  objc_msgSend(v5, "_lp_encodeObjectIfNotNil:forKey:", self->_thumbnail, @"thumbnail");
  objc_msgSend(v5, "_lp_encodeObjectIfNotNil:forKey:", self->_smallThumbnail, @"smallThumbnail");
  objc_msgSend(v5, "_lp_encodeObjectIfNotNil:forKey:", self->_icon, @"icon");
  objc_msgSend(v5, "_lp_encodeObjectIfNotNil:forKey:", self->_creationDate, @"creationDate");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPFileMetadata allocWithZone:a3];
  if (v4)
  {
    id v5 = [(LPFileMetadata *)self name];
    [(LPFileMetadata *)v4 setName:v5];

    uint64_t v6 = [(LPFileMetadata *)self type];
    [(LPFileMetadata *)v4 setType:v6];

    [(LPFileMetadata *)v4 setSize:[(LPFileMetadata *)self size]];
    v7 = [(LPFileMetadata *)self thumbnail];
    [(LPFileMetadata *)v4 setThumbnail:v7];

    uint64_t v8 = [(LPFileMetadata *)self smallThumbnail];
    [(LPFileMetadata *)v4 setSmallThumbnail:v8];

    v9 = [(LPFileMetadata *)self icon];
    [(LPFileMetadata *)v4 setIcon:v9];

    v10 = [(LPFileMetadata *)self creationDate];
    [(LPFileMetadata *)v4 setCreationDate:v10];

    uint64_t v11 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPFileMetadata;
  if ([(LPFileMetadata *)&v8 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[2], self->_name) & 1) != 0
        && objectsAreEqual_0(v6[3], self->_type)
        && v6[4] == (void *)self->_size
        && objectsAreEqual_0(v6[5], self->_thumbnail)
        && objectsAreEqual_0(v6[6], self->_smallThumbnail)
        && objectsAreEqual_0(v6[7], self->_icon))
      {
        char v5 = objectsAreEqual_0(v6[8], self->_creationDate);
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

- (unint64_t)hash
{
  return [(NSString *)self->_name hash];
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  v3 = (void (**)(id, __CFString *))a3;
  v3[2](v3, @"thumbnail");
  v3[2](v3, @"smallThumbnail");
  v3[2](v3, @"icon");
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"name", @"type", @"size", @"thumbnail", @"smallThumbnail", @"icon", @"creationDate", 0);
}

- (BOOL)_canDeferAsynchronousFieldsMetadataUpdateUntilCompletion
{
  return 1;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (LPImage)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
}

- (LPImage)smallThumbnail
{
  return self->_smallThumbnail;
}

- (void)setSmallThumbnail:(id)a3
{
}

- (LPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_smallThumbnail, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)descriptionForUTI:(id)a3
{
  v103[22] = *MEMORY[0x1E4F143B8];
  v3 = (__CFString *)a3;
  if (([(__CFString *)v3 _lp_hasCaseInsensitivePrefix:@"com.apple.iwork"] & 1) != 0
    || ([(__CFString *)v3 _lp_hasCaseInsensitivePrefix:@"com.apple.itunes"] & 1) != 0
    || ([(__CFString *)v3 _lp_hasCaseInsensitivePrefix:@"org.oasis-open"] & 1) != 0)
  {

LABEL_5:
    id v4 = (void *)UTTypeCopyDescription(v3);
    goto LABEL_6;
  }
  v103[0] = @"Apple Watch";
  v102[0] = @"com.apple.watchface";
  v102[1] = @"com.apple.webarchive";
  v55 = LPLocalizedString(@"Web Archive (file type)");
  v103[1] = v55;
  v102[2] = @"com.apple.rtfd";
  v53 = LPLocalizedString(@"RTF Document (file type)");
  v103[2] = v53;
  v102[3] = @"com.apple.flat-rtfd";
  v71 = LPLocalizedString(@"RTF Document (file type)");
  v103[3] = v71;
  v102[4] = @"public.rtf";
  v69 = LPLocalizedString(@"RTF Document (file type)");
  v103[4] = v69;
  v102[5] = @"com.adobe.pdf";
  v67 = LPLocalizedString(@"PDF Document (file type)");
  v103[5] = v67;
  v102[6] = @"com.apple.mpeg-4-ringtone";
  v65 = LPLocalizedString(@"Ringtone (file type)");
  v103[6] = v65;
  v102[7] = @"public.vcard";
  v63 = LPLocalizedString(@"Contact Card (file type)");
  v103[7] = v63;
  v102[8] = @"org.idpf.epub-container";
  v61 = LPLocalizedString(@"Book (file type)");
  v103[8] = v61;
  v102[9] = @"com.apple.ibooks";
  v59 = LPLocalizedString(@"Book (file type)");
  v103[9] = v59;
  v102[10] = @"com.apple.ibooks-container";
  v57 = LPLocalizedString(@"Book (file type)");
  v103[10] = v57;
  v102[11] = @"com.apple.ibooksauthor.book";
  v51 = LPLocalizedString(@"Book (file type)");
  v103[11] = v51;
  v102[12] = @"public.jpeg";
  v49 = LPLocalizedString(@"JPEG Image (file type)");
  v103[12] = v49;
  v102[13] = @"public.png";
  uint64_t v6 = LPLocalizedString(@"PNG Image (file type)");
  v103[13] = v6;
  v102[14] = @"com.compuserve.gif";
  v7 = LPLocalizedString(@"GIF Image (file type)");
  v103[14] = v7;
  v102[15] = @"public.tiff";
  objc_super v8 = LPLocalizedString(@"TIFF Image (file type)");
  v103[15] = v8;
  v102[16] = @"public.zip-archive";
  v9 = LPLocalizedString(@"ZIP Archive (file type)");
  v103[16] = v9;
  v102[17] = @"public.heif";
  v10 = LPLocalizedString(@"HEIF Image (file type)");
  v103[17] = v10;
  v102[18] = @"public.heif-standard";
  uint64_t v11 = LPLocalizedString(@"HEIF Image (file type)");
  v103[18] = v11;
  v102[19] = @"public.data";
  v12 = LPLocalizedString(@"File (file type)");
  v103[19] = v12;
  v102[20] = @"public.folder";
  uint64_t v13 = LPLocalizedString(@"Folder (file type)");
  v102[21] = @"com.apple.workout";
  v103[20] = v13;
  v103[21] = @"Apple Watch";
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v103 forKeys:v102 count:22];

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v81 objects:v101 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v82;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v82 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = *(void *)(*((void *)&v81 + 1) + 8 * i);
        if ([(__CFString *)v3 _lp_isEqualIgnoringCase:v19])
        {
          id v4 = [v15 objectForKeyedSubscript:v19];
          id v27 = v15;
          goto LABEL_39;
        }
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v81 objects:v101 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  v99[0] = @"com.microsoft.excel";
  v20 = LPLocalizedString(@"Office Spreadsheet (file type)");
  v100[0] = v20;
  v99[1] = @"org.openxmlformats.spreadsheetml";
  objc_super v21 = LPLocalizedString(@"Office Spreadsheet (file type)");
  v100[1] = v21;
  v99[2] = @"com.microsoft.powerpoint";
  v22 = LPLocalizedString(@"Office Presentation (file type)");
  v100[2] = v22;
  v99[3] = @"org.openxmlformats.presentationml";
  v23 = LPLocalizedString(@"Office Presentation (file type)");
  v100[3] = v23;
  v99[4] = @"com.microsoft.word";
  v24 = LPLocalizedString(@"Word Document (file type)");
  v100[4] = v24;
  v99[5] = @"org.openxmlformats.wordprocessingml";
  v25 = LPLocalizedString(@"Word Document (file type)");
  v100[5] = v25;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v100 forKeys:v99 count:6];

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v27 = v26;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v77 objects:v98 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v78;
    while (2)
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v78 != v29) {
          objc_enumerationMutation(v27);
        }
        uint64_t v31 = *(void *)(*((void *)&v77 + 1) + 8 * j);
        if ([(__CFString *)v3 _lp_hasCaseInsensitivePrefix:v31])
        {
          id v4 = [v27 objectForKeyedSubscript:v31];
          id v39 = v27;
          goto LABEL_38;
        }
      }
      uint64_t v28 = [v27 countByEnumeratingWithState:&v77 objects:v98 count:16];
      if (v28) {
        continue;
      }
      break;
    }
  }

  v96[0] = @"com.apple.disk-image";
  v70 = LPLocalizedString(@"Disk Image (file type)");
  v96[1] = v70;
  v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:2];
  v97[0] = v68;
  v95[0] = @"public.source-code";
  v66 = LPLocalizedString(@"Source Code (file type)");
  v95[1] = v66;
  v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:2];
  v97[1] = v64;
  v94[0] = @"com.apple.application";
  v62 = LPLocalizedString(@"Application (file type)");
  v94[1] = v62;
  v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:2];
  v97[2] = v60;
  v93[0] = @"public.3d-content";
  v72 = LPLocalizedString(@"3D Asset (file type)");
  v93[1] = v72;
  v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:2];
  v97[3] = v58;
  v92[0] = @"public.executable";
  v56 = LPLocalizedString(@"Executable (file type)");
  v92[1] = v56;
  v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:2];
  v97[4] = v54;
  v91[0] = @"public.archive";
  v52 = LPLocalizedString(@"Archive (file type)");
  v91[1] = v52;
  v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:2];
  v97[5] = v50;
  v90[0] = @"public.image";
  v48 = LPLocalizedString(@"Image (file type)");
  v90[1] = v48;
  v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:2];
  v97[6] = v47;
  v89[0] = @"public.audio";
  v46 = LPLocalizedString(@"Audio Recording (file type)");
  v89[1] = v46;
  v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:2];
  v97[7] = v45;
  v88[0] = @"public.font";
  v32 = LPLocalizedString(@"Font (file type)");
  v88[1] = v32;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:2];
  v97[8] = v33;
  v87[0] = @"public.movie";
  v34 = LPLocalizedString(@"Video (file type)");
  v87[1] = v34;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:2];
  v97[9] = v35;
  v86[0] = @"public.plain-text";
  v36 = LPLocalizedString(@"Text Document (file type)");
  v86[1] = v36;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:2];
  v97[10] = v37;
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:11];

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v39 = v38;
  id v4 = (void *)[v39 countByEnumeratingWithState:&v73 objects:v85 count:16];
  if (v4)
  {
    uint64_t v40 = *(void *)v74;
    while (2)
    {
      for (k = 0; k != v4; k = (char *)k + 1)
      {
        if (*(void *)v74 != v40) {
          objc_enumerationMutation(v39);
        }
        v42 = *(void **)(*((void *)&v73 + 1) + 8 * (void)k);
        v43 = [v42 objectAtIndexedSubscript:0];
        int v44 = UTTypeConformsTo(v3, v43);

        if (v44)
        {
          id v4 = [v42 objectAtIndexedSubscript:1];
          goto LABEL_37;
        }
      }
      id v4 = (void *)[v39 countByEnumeratingWithState:&v73 objects:v85 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_37:

LABEL_38:
LABEL_39:

  if (!v4) {
    goto LABEL_5;
  }
LABEL_6:

  return v4;
}

- (id)_fileTypeStringForTransformer:(id)a3
{
  id v4 = [(LPFileMetadata *)self type];

  if (v4)
  {
    char v5 = [(LPFileMetadata *)self type];
    id v4 = +[LPFileMetadata descriptionForUTI:v5];
  }

  return v4;
}

- (id)_fileDetailStringForTransformer:(id)a3
{
  id v4 = a3;
  char v5 = [(LPFileMetadata *)self creationDate];
  if (v5
    && ([v4 sourceBundleIdentifier],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = objc_msgSend(v6, "_lp_isEqualIgnoringCase:", @"com.apple.mobilephone"),
        v6,
        v5,
        v7))
  {
    objc_super v8 = (void *)MEMORY[0x1E4F28C10];
    v9 = [(LPFileMetadata *)self creationDate];
    v10 = [v8 localizedStringFromDate:v9 dateStyle:1 timeStyle:1];
  }
  else if ([(LPFileMetadata *)self size])
  {
    v10 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", -[LPFileMetadata size](self, "size"), 0);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_bottomCaptionStringForTransformer:(id)a3
{
  id v4 = a3;
  char v5 = [(LPFileMetadata *)self _fileTypeStringForTransformer:v4];
  uint64_t v6 = [(LPFileMetadata *)self _fileDetailStringForTransformer:v4];
  int v7 = joinedByDot(v5, v6);

  return v7;
}

- (BOOL)_isImage
{
  v2 = [(LPFileMetadata *)self type];
  BOOL v3 = UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E4F225F8]) != 0;

  return v3;
}

- (BOOL)_isPlainText
{
  v2 = [(LPFileMetadata *)self type];
  BOOL v3 = UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E4F22688]) != 0;

  return v3;
}

- (BOOL)_isWatchFace
{
  v2 = [(LPFileMetadata *)self type];
  BOOL v3 = UTTypeConformsTo(v2, @"com.apple.watchface") != 0;

  return v3;
}

- (BOOL)_shouldUseSquareIcon
{
  BOOL v3 = [(LPFileMetadata *)self _thumbnailIfLoaded];
  if (v3) {
    BOOL v4 = [(LPFileMetadata *)self _isImage];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)_shouldUseCircularIcon
{
  v2 = [(LPFileMetadata *)self type];
  BOOL v3 = UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E4F22718]) != 0;

  return v3;
}

- (BOOL)_shouldUseBackground
{
  uint64_t v3 = [(LPFileMetadata *)self _thumbnailIfLoaded];
  if (!v3) {
    return 0;
  }
  BOOL v4 = (void *)v3;
  char v5 = [(LPFileMetadata *)self _thumbnailIfLoaded];
  uint64_t v6 = [v5 properties];
  uint64_t v7 = [v6 type];

  if (v7 == 5 || [(LPFileMetadata *)self _isWatchFace]) {
    return 0;
  }
  v10 = [(LPFileMetadata *)self _thumbnailIfLoaded];
  char v8 = [v10 _hasTransparency];

  return v8;
}

- (id)_singleLineDescriptionForRemoteFileWithTransformer:(id)a3
{
  id v4 = a3;
  char v5 = [(LPFileMetadata *)self _fileTypeStringForTransformer:v4];
  uint64_t v6 = [v4 URL];
  uint64_t v7 = objc_msgSend(v6, "_lp_simplifiedStringForDisplayOnly:", 0);

  char v8 = joinedByEmDash(v5, v7);

  return v8;
}

- (id)_nameForTransformer:(id)a3
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 effectiveSizeClass] != 2) {
    goto LABEL_14;
  }
  char v5 = [v4 metadata];
  uint64_t v6 = [v5 originalURL];
  if ((objc_msgSend(v6, "_lp_isHTTPFamilyURL") & 1) == 0)
  {

    goto LABEL_14;
  }
  uint64_t v7 = [(LPFileMetadata *)self type];

  if (!v7)
  {
LABEL_14:
    objc_super v21 = [(LPFileMetadata *)self name];
    goto LABEL_15;
  }
  char v8 = [(LPFileMetadata *)self type];
  v30[0] = @"public.image";
  v9 = LPLocalizedString(@"Image (file type)");
  v30[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  v31[0] = v10;
  v29[0] = @"public.movie";
  uint64_t v11 = LPLocalizedString(@"Video (file type)");
  v29[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  v31[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v13;
  id v15 = (void *)[v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v14);
        }
        v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_msgSend(v18, "objectAtIndexedSubscript:", 0, (void)v24);
        uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        int v20 = UTTypeConformsTo(v8, v19);

        if (v20)
        {
          id v15 = [v18 objectAtIndexedSubscript:1];
          goto LABEL_19;
        }
      }
      id v15 = (void *)[v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_19:

  if (v15)
  {
    id v23 = v15;
  }
  else
  {
    id v23 = [(LPFileMetadata *)self name];
  }
  objc_super v21 = v23;

LABEL_15:

  return v21;
}

- (id)_valueForKeyPathIfLoaded:(id)a3
{
  uint64_t v3 = [(LPFileMetadata *)self valueForKeyPath:a3];
  char v4 = [v3 conformsToProtocol:&unk_1EF721F50];
  id v5 = v3;
  uint64_t v6 = v5;
  id v7 = v5;
  if (v4)
  {
    if ([v5 needsAsynchronousLoad]
      && ![v6 hasPlaceholderValueForAsynchronousLoad])
    {
      id v7 = 0;
    }
    else
    {
      id v7 = v6;
    }
  }

  return v7;
}

- (id)_thumbnailIfLoaded
{
  return [(LPFileMetadata *)self _valueForKeyPathIfLoaded:@"thumbnail"];
}

- (id)_smallThumbnailIfLoaded
{
  return [(LPFileMetadata *)self _valueForKeyPathIfLoaded:@"smallThumbnail"];
}

- (id)_iconIfLoaded
{
  return [(LPFileMetadata *)self _valueForKeyPathIfLoaded:@"icon"];
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4 = a3;
  if ([v4 effectiveSizeClass] == 2 || objc_msgSend(v4, "effectiveSizeClass") == 12)
  {
    id v5 = [(LPFileMetadata *)self _thumbnailIfLoaded];
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      char v8 = [(LPFileMetadata *)self type];
      [v4 scaleFactor];
      v10 = customIconForUTI(v8, v9);
      uint64_t v11 = v10;
      if (v10)
      {
        id v7 = v10;
      }
      else
      {
        uint64_t v29 = [(LPFileMetadata *)self _iconIfLoaded];
        v30 = v29;
        if (v29)
        {
          id v31 = v29;
        }
        else
        {
          id v31 = +[LPResources fileIcon];
        }
        id v7 = v31;
      }
    }

    v41 = [LPCardHeadingPresentationProperties alloc];
    v42 = [(LPFileMetadata *)self _nameForTransformer:v4];
    v43 = [(LPFileMetadata *)self _bottomCaptionStringForTransformer:v4];
    v12 = [(LPCardHeadingPresentationProperties *)v41 initWithStyle:33 topCaption:v42 bottomCaption:v43 icon:v7];

    int v44 = objc_alloc_init(LPImagePresentationProperties);
    v45 = [(LPWebLinkPresentationProperties *)v12 captionBar];
    [v45 setLeadingIconProperties:v44];

    if ([(LPFileMetadata *)self _shouldUseSquareIcon])
    {
      v46 = [(LPWebLinkPresentationProperties *)v12 captionBar];
      v47 = [v46 leadingIconProperties];
      [v47 setRequireFixedSize:1];

      v48 = [(LPWebLinkPresentationProperties *)v12 captionBar];
      v49 = [v48 leadingIconProperties];
      [v49 setScalingMode:2];
    }
    else
    {
      if (![(LPFileMetadata *)self _shouldUseCircularIcon]) {
        goto LABEL_30;
      }
      v48 = [(LPWebLinkPresentationProperties *)v12 captionBar];
      v49 = [v48 leadingIconProperties];
      [v49 setFilter:12];
    }

LABEL_30:
    if ([(LPFileMetadata *)self _shouldUseBackground])
    {
      v50 = [(LPWebLinkPresentationProperties *)v12 captionBar];
      v51 = [v50 leadingIconProperties];
      [v51 setShouldApplyBackground:1];
    }
    goto LABEL_42;
  }
  v12 = [v4 commonPresentationPropertiesForStyle:33];
  uint64_t v13 = objc_alloc_init(LPCaptionBarPresentationProperties);
  [(LPWebLinkPresentationProperties *)v12 setCaptionBar:v13];

  if (!objc_msgSend(v4, "_rowConfigurationForStyle:", -[LPWebLinkPresentationProperties style](v12, "style")))
  {
    id v14 = [v4 URL];
    char v15 = [v14 isFileURL];

    if ((v15 & 1) == 0)
    {
      long long v25 = [(LPFileMetadata *)self _singleLineDescriptionForRemoteFileWithTransformer:v4];
      long long v26 = [(LPWebLinkPresentationProperties *)v12 captionBar];
      v22 = [v26 top];
      long long v27 = [v22 leading];
      [v27 setText:v25];
      goto LABEL_14;
    }
  }
  uint64_t v16 = [(LPFileMetadata *)self _nameForTransformer:v4];
  uint64_t v17 = [(LPWebLinkPresentationProperties *)v12 captionBar];
  v18 = [v17 top];
  uint64_t v19 = [v18 leading];
  [v19 setText:v16];

  int v20 = [(LPFileMetadata *)self _bottomCaptionStringForTransformer:v4];
  uint64_t v21 = [(LPWebLinkPresentationProperties *)v12 captionBar];
  v22 = [(id)v21 bottom];
  id v23 = [v22 leading];
  [v23 setText:v20];

  long long v24 = [v4 URL];
  LOBYTE(v21) = [v24 isFileURL];

  if ((v21 & 1) == 0)
  {
    long long v25 = [v4 URL];
    long long v26 = objc_msgSend(v25, "_lp_simplifiedStringForDisplayOnly:", 0);
    v22 = [(LPWebLinkPresentationProperties *)v12 captionBar];
    long long v27 = [v22 belowBottom];
    uint64_t v28 = [v27 leading];
    [v28 setText:v26];

LABEL_14:
  }
  v32 = [(LPFileMetadata *)self _smallThumbnailIfLoaded];
  if (v32 && (uint64_t v33 = [v4 effectiveSizeClass], v32, v33 == 8))
  {
    v34 = [(LPFileMetadata *)self _smallThumbnailIfLoaded];
    [v4 _populateProperties:v12 withPrimaryImage:v34];
  }
  else
  {
    v35 = [(LPFileMetadata *)self _thumbnailIfLoaded];

    if (v35)
    {
      v34 = [(LPFileMetadata *)self _thumbnailIfLoaded];
      [v4 _populateProperties:v12 withPrimaryImage:v34];
    }
    else
    {
      v34 = [(LPFileMetadata *)self type];
      [v4 scaleFactor];
      uint64_t v37 = customIconForUTI(v34, v36);
      v38 = (void *)v37;
      if (v37)
      {
        int v39 = 0;
        uint64_t v40 = (void *)v37;
      }
      else
      {
        uint64_t v52 = [(LPFileMetadata *)self _iconIfLoaded];
        v22 = (void *)v52;
        if (v52)
        {
          int v39 = 0;
          uint64_t v40 = (void *)v52;
        }
        else
        {
          uint64_t v40 = +[LPResources fileIcon];
          v22 = 0;
          int v39 = 1;
        }
      }
      [v4 _populateProperties:v12 withPrimaryIcon:v40 iconProperties:0 canBecomeImage:0];
      if (v39) {

      }
      if (!v38) {
    }
      }
  }

  v53 = [v4 metadata];
  v54 = [v53 video];
  [(LPWebLinkPresentationProperties *)v12 setVideo:v54];

  v55 = [v4 metadata];
  v56 = [v55 audio];
  [(LPWebLinkPresentationProperties *)v12 setAudio:v56];

  v57 = [(LPWebLinkPresentationProperties *)v12 audio];

  if (v57)
  {
    v58 = [(LPWebLinkPresentationProperties *)v12 audio];
    id v7 = +[LPInlineMediaPlaybackInformation audioFilePlaybackInformationWithAudio:v58];

    [(LPWebLinkPresentationProperties *)v12 setInlinePlaybackInformation:v7];
LABEL_42:
  }

  return v12;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return 1;
}

- (id)previewSummaryForTransformer:(id)a3
{
  id v4 = NSString;
  id v5 = LPLocalizedString(@"File: %@");
  uint64_t v6 = [(LPFileMetadata *)self name];
  id v7 = objc_msgSend(v6, "_lp_directionallyIsolatedString");
  char v8 = objc_msgSend(v4, "stringWithFormat:", v5, v7);

  return v8;
}

- (id)previewImageForTransformer:(id)a3
{
  id v4 = [(LPFileMetadata *)self thumbnail];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(LPFileMetadata *)self icon];
  }
  id v7 = v6;

  return v7;
}

- (id)fallbackIconForTransformer:(id)a3
{
  uint64_t v3 = +[LPResources fileIcon];

  return v3;
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  id v7 = a3;
  id v4 = [(LPFileMetadata *)self name];
  [v7 setTitle:v4];

  id v5 = [(LPFileMetadata *)self thumbnail];
  [v7 setImage:v5];

  id v6 = [(LPFileMetadata *)self icon];
  [v7 setIcon:v6];
}

- (int64_t)summaryTypeForTransformer:(id)a3
{
  if ([(LPFileMetadata *)self _isImage]) {
    return 1;
  }
  if ([(LPFileMetadata *)self _isPlainText]) {
    return 3;
  }
  return 2;
}

- (id)sharedObjectTitleForTransformer:(id)a3
{
  uint64_t v3 = [(LPFileMetadata *)self name];

  return v3;
}

- (id)sharedObjectSubtitleForTransformer:(id)a3
{
  id v4 = [(LPFileMetadata *)self type];

  if (v4)
  {
    id v5 = [(LPFileMetadata *)self type];
    id v4 = +[LPFileMetadata descriptionForUTI:v5];
  }

  return v4;
}

- (id)sharedObjectInformationForTransformer:(id)a3
{
  id v4 = [(LPFileMetadata *)self size];
  if (v4)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", -[LPFileMetadata size](self, "size"), 0);
  }

  return v4;
}

- (id)sharedObjectIconForTransformer:(id)a3
{
  id v4 = a3;
  id v5 = [(LPFileMetadata *)self _thumbnailIfLoaded];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    char v8 = [(LPFileMetadata *)self type];
    [v4 scaleFactor];
    v10 = customIconForUTI(v8, v9);
    uint64_t v11 = v10;
    if (v10)
    {
      id v7 = v10;
    }
    else
    {
      v12 = [(LPFileMetadata *)self _iconIfLoaded];
      uint64_t v13 = v12;
      if (v12)
      {
        id v14 = v12;
      }
      else
      {
        id v14 = +[LPResources fileIcon];
      }
      id v7 = v14;
    }
  }

  return v7;
}

- (BOOL)sharedObjectPrefersIconAsImageForTransformer:(id)a3
{
  id v4 = a3;
  id v5 = [(LPFileMetadata *)self _thumbnailIfLoaded];
  if (v5) {
    BOOL v6 = sizeClassRequiresLargeMedia([v4 effectiveSizeClass]);
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)sharedObjectPreviewSummaryForTransformer:(id)a3
{
  id v4 = NSString;
  id v5 = LPLocalizedString(@"“%@”");
  BOOL v6 = [(LPFileMetadata *)self name];
  id v7 = objc_msgSend(v6, "_lp_directionallyIsolatedString");
  char v8 = objc_msgSend(v4, "stringWithFormat:", v5, v7);

  return v8;
}

@end