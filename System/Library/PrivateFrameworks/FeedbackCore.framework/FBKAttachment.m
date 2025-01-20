@interface FBKAttachment
+ (id)descriptorForAttachment:(id)a3 given:(id)a4;
- (BOOL)canBeDeleted;
- (BOOL)canStartGathering;
- (BOOL)fileComesFromFBK;
- (BOOL)hasFBKFileReadyForSubmission;
- (BOOL)hasFiles;
- (BOOL)hasGroup;
- (BOOL)isAdditional;
- (BOOL)isCollecting;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocal;
- (BOOL)isReadyToDisplayContents;
- (BOOL)isRequired;
- (BOOL)matchesAttachmentDescriptor:(id)a3;
- (BOOL)shouldAutoGather;
- (BOOL)wasAttachedByApplication;
- (DEDAttachmentGroup)attachedGroup;
- (DEDAttachmentItem)attachedItem;
- (DEDExtension)extension;
- (FBKAttachment)initWithCollectorIdentifier:(id)a3 deviceUUID:(id)a4;
- (FBKAttachment)initWithRequirement:(id)a3 urlExtension:(id)a4 collectorIdentifier:(id)a5 deviceUUID:(id)a6;
- (FBKMatcherPredicate)requirement;
- (FBKURLExtension)urlExtension;
- (NSString)collectorIdentifier;
- (NSString)deviceUUID;
- (NSString)instructionsAsHTML;
- (NSString)localizedAttachmentInfo;
- (NSString)placeholderText;
- (NSString)proposedFileNameForLocalFiles;
- (NSString)stateDescription;
- (NSString)uniqueIdentifier;
- (NSURL)fileURL;
- (NSURL)originalLocalFileURL;
- (_TtC12FeedbackCore23FBKAttachmentAnnotation)annotation;
- (id)_annotationUntypedButAccessibleInSwift;
- (id)description;
- (id)diffableHashWithContext:(id)a3;
- (id)displayName;
- (id)promisedFileName;
- (id)shortDescription;
- (int64_t)attachmentType;
- (int64_t)state;
- (void)isLocal;
- (void)loadAnnotationFromURL:(id)a3;
- (void)remove;
- (void)setAttachedGroup:(id)a3;
- (void)setAttachedItem:(id)a3;
- (void)setAttachmentType:(int64_t)a3;
- (void)setDeviceUUID:(id)a3;
- (void)setExtension:(id)a3;
- (void)setFileComesFromFBK:(BOOL)a3;
- (void)setGroup:(id)a3;
- (void)setItem:(id)a3 originalURL:(id)a4;
- (void)setLocalizedAttachmentInfo:(id)a3;
- (void)setOriginalLocalFileURL:(id)a3;
- (void)setPlaceholderText:(id)a3;
- (void)setProposedFileNameForLocalFiles:(id)a3;
- (void)setRequirement:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setUrlExtension:(id)a3;
- (void)set_annotationUntypedButAccessibleInSwift:(id)a3;
@end

@implementation FBKAttachment

- (FBKAttachment)initWithCollectorIdentifier:(id)a3 deviceUUID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)FBKAttachment;
  v9 = [(FBKAttachment *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deviceUUID, a4);
    objc_storeStrong((id *)&v10->_collectorIdentifier, a3);
    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v12 = [v11 localizedStringForKey:@"ATTACHMENT" value:&stru_26DDF6A30 table:0];
    placeholderText = v10->_placeholderText;
    v10->_placeholderText = (NSString *)v12;

    v10->_attachmentType = 0;
    v10->_state = 0;
  }

  return v10;
}

- (FBKAttachment)initWithRequirement:(id)a3 urlExtension:(id)a4 collectorIdentifier:(id)a5 deviceUUID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [(FBKAttachment *)self initWithCollectorIdentifier:a5 deviceUUID:a6];
  if (v12)
  {
    if (v11 || ([v10 isConfiguredWithDEBundleIdentifier] & 1) != 0)
    {
      uint64_t v13 = 1;
    }
    else
    {
      if (![v10 hasRegularExpression]) {
        goto LABEL_6;
      }
      uint64_t v13 = 2;
    }
    [(FBKAttachment *)v12 setAttachmentType:v13];
LABEL_6:
    [(FBKAttachment *)v12 setUrlExtension:v11];
    [(FBKAttachment *)v12 setRequirement:v10];
  }

  return v12;
}

- (void)setGroup:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(FBKAttachment *)self item];

  if (v5)
  {
    v6 = +[FBKLog appHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[FBKAttachment setGroup:](self, v6);
    }
  }
  [(FBKAttachment *)self setAttachedGroup:v4];
  if (v4)
  {
    [(FBKAttachment *)self setState:2];
    if ([v4 isLocal])
    {
      id v7 = [v4 rootURL];
      [(FBKAttachment *)self loadAnnotationFromURL:v7];
    }
  }
  else
  {
    [(FBKAttachment *)self setState:0];
  }
  id v8 = +[FBKLog appHandle];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = [(FBKAttachment *)self shortDescription];
    int v10 = 138543362;
    id v11 = v9;
    _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_INFO, "Did set group on [%{public}@]", (uint8_t *)&v10, 0xCu);
  }
}

- (void)setItem:(id)a3 originalURL:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(FBKAttachment *)self setOriginalLocalFileURL:a4];
  [(FBKAttachment *)self setAttachedItem:v6];
  [(FBKAttachment *)self setAttachedGroup:0];
  if (v6)
  {
    [(FBKAttachment *)self setState:2];
    uint64_t v7 = [v6 attachedPath];
    if (!v7) {
      goto LABEL_5;
    }
    id v8 = (void *)v7;
    v9 = [MEMORY[0x263F08850] defaultManager];
    int v10 = [v6 attachedPath];
    id v11 = [v10 path];
    int v12 = [v9 fileExistsAtPath:v11];

    if (v12)
    {
      uint64_t v13 = [v6 attachedPath];
      [(FBKAttachment *)self loadAnnotationFromURL:v13];
    }
    else
    {
LABEL_5:
      uint64_t v13 = +[FBKLog appHandle];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = [(FBKAttachment *)self displayName];
        int v17 = 138543362;
        v18 = v14;
        _os_log_impl(&dword_22A36D000, v13, OS_LOG_TYPE_DEFAULT, "Gathered attachment [%{public}@] doesn't have URL", (uint8_t *)&v17, 0xCu);
      }
    }
  }
  else
  {
    [(FBKAttachment *)self setState:0];
  }
  objc_super v15 = +[FBKLog appHandle];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = [(FBKAttachment *)self shortDescription];
    int v17 = 138543362;
    v18 = v16;
    _os_log_impl(&dword_22A36D000, v15, OS_LOG_TYPE_INFO, "Did set item on [%{public}@]", (uint8_t *)&v17, 0xCu);
  }
}

- (NSString)stateDescription
{
  int64_t v2 = [(FBKAttachment *)self state];
  if ((unint64_t)(v2 - 1) > 7) {
    return (NSString *)@"not gathered";
  }
  else {
    return &off_264874D70[v2 - 1]->isa;
  }
}

- (void)setAttachmentType:(int64_t)a3
{
  self->_attachmentType = a3;
  switch(a3)
  {
    case 1:
      [(FBKAttachment *)self setState:0];
      return;
    case 3:
      [(FBKAttachment *)self setState:1];
      uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v10 = v7;
      id v8 = @"GATHERING_IMAGE";
      goto LABEL_14;
    case 4:
      [(FBKAttachment *)self setState:1];
      uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v10 = v7;
      id v8 = @"GATHERING_VIDEO";
LABEL_14:
      v9 = [v7 localizedStringForKey:v8 value:&stru_26DDF6A30 table:0];
      [(FBKAttachment *)self setPlaceholderText:v9];

      return;
    case 5:
    case 6:
      v5 = [(FBKAttachment *)self displayName];

      if (v5) {
        return;
      }
      id v6 = +[FBKLog appHandle];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[FBKAttachment setAttachmentType:](v6);
      }
LABEL_10:

      return;
    default:
      id v6 = +[FBKLog appHandle];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[FBKAttachment setAttachmentType:](a3, v6);
      }
      goto LABEL_10;
  }
}

- (id)displayName
{
  v3 = [(FBKAttachment *)self attachedGroup];

  if (v3)
  {
    uint64_t v4 = [(FBKAttachment *)self urlExtension];
    if (!v4) {
      goto LABEL_5;
    }
    v5 = (void *)v4;
    id v6 = [(FBKAttachment *)self urlExtension];
    uint64_t v7 = [v6 name];

    if (!v7)
    {
LABEL_5:
      v9 = [(FBKAttachment *)self requirement];
      id v10 = [v9 name];
      if (v10)
      {
        id v11 = [(FBKAttachment *)self requirement];
        [v11 name];
      }
      else
      {
        id v11 = [(FBKAttachment *)self attachedGroup];
        [v11 displayName];
      v14 = };

      goto LABEL_15;
    }
    goto LABEL_4;
  }
  int v12 = [(FBKAttachment *)self attachedItem];

  if (!v12)
  {
    objc_super v15 = [(FBKAttachment *)self requirement];

    if (v15)
    {
      id v8 = [(FBKAttachment *)self requirement];
      goto LABEL_13;
    }
    uint64_t v17 = [(FBKAttachment *)self urlExtension];
    if (!v17) {
      goto LABEL_21;
    }
    v18 = (void *)v17;
    uint64_t v19 = [(FBKAttachment *)self urlExtension];
    v20 = [v19 name];

    if (!v20)
    {
LABEL_21:
      v21 = [(FBKAttachment *)self extension];

      if (!v21)
      {
        v22 = [(FBKAttachment *)self proposedFileNameForLocalFiles];

        if (v22) {
          [(FBKAttachment *)self proposedFileNameForLocalFiles];
        }
        else {
        v14 = [(FBKAttachment *)self placeholderText];
        }
        goto LABEL_16;
      }
      id v8 = [(FBKAttachment *)self extension];
      goto LABEL_13;
    }
LABEL_4:
    id v8 = [(FBKAttachment *)self urlExtension];
LABEL_13:
    v9 = v8;
    uint64_t v13 = [v8 name];
    goto LABEL_14;
  }
  v9 = [(FBKAttachment *)self attachedItem];
  uint64_t v13 = [v9 displayName];
LABEL_14:
  v14 = (void *)v13;
LABEL_15:

LABEL_16:

  return v14;
}

- (id)promisedFileName
{
  v3 = [(FBKAttachment *)self attachedGroup];

  if (v3)
  {
    uint64_t v4 = [(FBKAttachment *)self attachedGroup];
    v5 = [v4 rootURL];
LABEL_5:
    uint64_t v7 = v5;
    id v8 = [v5 lastPathComponent];

    goto LABEL_6;
  }
  id v6 = [(FBKAttachment *)self attachedItem];

  if (v6)
  {
    uint64_t v4 = [(FBKAttachment *)self attachedItem];
    v5 = [v4 attachedPath];
    goto LABEL_5;
  }
  id v8 = 0;
LABEL_6:

  return v8;
}

- (void)remove
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "FBK attachment item is not local, this is not supported.", v1, 2u);
}

- (BOOL)wasAttachedByApplication
{
  int64_t v2 = [(FBKAttachment *)self originalLocalFileURL];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)hasFBKFileReadyForSubmission
{
  if ([(FBKAttachment *)self isCollecting]
    || ![(FBKAttachment *)self wasAttachedByApplication]
    || ![(FBKAttachment *)self isLocal])
  {
    return 0;
  }

  return [(FBKAttachment *)self hasFiles];
}

- (BOOL)isCollecting
{
  return [(FBKAttachment *)self state] == 1;
}

- (BOOL)hasFiles
{
  int64_t v2 = [(FBKAttachment *)self fileURL];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)hasGroup
{
  int64_t v2 = [(FBKAttachment *)self attachedGroup];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isLocal
{
  BOOL v3 = [(FBKAttachment *)self attachedGroup];

  if (v3)
  {
    uint64_t v4 = [(FBKAttachment *)self attachedGroup];
LABEL_5:
    id v6 = v4;
    char v7 = [v4 isLocal];

    return v7;
  }
  v5 = [(FBKAttachment *)self attachedItem];

  if (v5)
  {
    uint64_t v4 = [(FBKAttachment *)self attachedItem];
    goto LABEL_5;
  }
  v9 = +[FBKLog appHandle];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[FBKAttachment isLocal](v9);
  }

  return 1;
}

- (id)description
{
  objc_super v15 = NSString;
  v17.receiver = self;
  v17.super_class = (Class)FBKAttachment;
  v14 = [(FBKAttachment *)&v17 description];
  BOOL v3 = [(FBKAttachment *)self requirement];
  v16 = [(FBKAttachment *)self extension];
  uint64_t v4 = [v16 description];
  v5 = [(FBKAttachment *)self stateDescription];
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[FBKAttachment attachmentType](self, "attachmentType"));
  char v7 = [(FBKAttachment *)self item];
  id v8 = [(FBKAttachment *)self group];
  v9 = [(FBKAttachment *)self originalLocalFileURL];
  id v10 = [(FBKAttachment *)self displayName];
  id v11 = [(FBKAttachment *)self placeholderText];
  int v12 = [v15 stringWithFormat:@"\n%@\nreq[%@]\next[%@]\nstate[%@] type[%@] item[%@] group[%@]\nfrom [%@]\ndisplay[%@] altDisplay[%@]\n", v14, v3, v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (id)shortDescription
{
  BOOL v3 = [(FBKAttachment *)self requirement];

  uint64_t v4 = NSString;
  if (v3)
  {
    v5 = [(FBKAttachment *)self requirement];
    id v6 = [v5 shortDescription];
    char v7 = [(FBKAttachment *)self uniqueIdentifier];
    id v8 = [v4 stringWithFormat:@"Attachment: %@ | %@", v6, v7];
  }
  else
  {
    v5 = [(FBKAttachment *)self displayName];
    id v6 = [(FBKAttachment *)self uniqueIdentifier];
    id v8 = [v4 stringWithFormat:@"Attachment: %@ | %@", v5, v6];
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (FBKAttachment *)a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (v4 == self) & isKindOfClass;
}

- (BOOL)shouldAutoGather
{
  BOOL v3 = [(FBKAttachment *)self requirement];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [(FBKAttachment *)self requirement];
  char v5 = [v4 shouldAutoGather];

  return v5;
}

- (BOOL)canBeDeleted
{
  if ([(FBKAttachment *)self state] == 3)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(FBKAttachment *)self hasFiles];
    if (v3) {
      LOBYTE(v3) = [(FBKAttachment *)self state] == 2;
    }
  }
  return v3;
}

- (BOOL)isAdditional
{
  int64_t v2 = [(FBKAttachment *)self requirement];
  char v3 = [v2 isAdditional];

  return v3;
}

- (BOOL)isReadyToDisplayContents
{
  if ([(FBKAttachment *)self state] != 2) {
    return 0;
  }

  return [(FBKAttachment *)self hasFiles];
}

- (BOOL)canStartGathering
{
  if ([(FBKAttachment *)self state] || [(FBKAttachment *)self attachmentType] != 1) {
    return 0;
  }
  char v3 = [(FBKAttachment *)self extension];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isRequired
{
  char v3 = [(FBKAttachment *)self requirement];
  if (v3) {
    BOOL v4 = ![(FBKAttachment *)self isAdditional];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (NSURL)fileURL
{
  char v3 = [(FBKAttachment *)self attachedItem];

  if (v3)
  {
    BOOL v4 = [(FBKAttachment *)self attachedItem];
    uint64_t v5 = [v4 attachedPath];
  }
  else
  {
    id v6 = [(FBKAttachment *)self attachedGroup];

    if (!v6) {
      goto LABEL_6;
    }
    BOOL v4 = [(FBKAttachment *)self attachedGroup];
    uint64_t v5 = [v4 rootURL];
  }
  id v6 = (void *)v5;

LABEL_6:

  return (NSURL *)v6;
}

- (NSString)instructionsAsHTML
{
  int64_t v2 = [(FBKAttachment *)self requirement];
  char v3 = [v2 fileMatcher];
  BOOL v4 = [v3 instructionsAsHTML];

  return (NSString *)v4;
}

- (NSString)uniqueIdentifier
{
  char v3 = NSString;
  uint64_t v4 = [(FBKAttachment *)self hash];
  int64_t v5 = [(FBKAttachment *)self state];
  id v6 = [(FBKAttachment *)self displayName];
  char v7 = [v3 stringWithFormat:@"%lu-%lu-%@", v4, v5, v6];

  return (NSString *)v7;
}

- (id)diffableHashWithContext:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int64_t v5 = NSString;
    id v6 = [(FBKAttachment *)self uniqueIdentifier];
    char v7 = [v5 stringWithFormat:@"%@-%@", v6, v4];
  }
  else
  {
    char v7 = [(FBKAttachment *)self uniqueIdentifier];
  }

  return v7;
}

- (BOOL)matchesAttachmentDescriptor:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 url];

  if (!v5)
  {
    uint64_t v13 = [v4 diagnosticExtensionIdentifier];

    if (v13)
    {
      v14 = [(FBKAttachment *)self requirement];
      objc_super v15 = [v14 fileMatcher];
      v16 = [v15 deBundleIdentifier];

      if (v16)
      {
        id v6 = [(FBKAttachment *)self requirement];
        char v7 = [v6 fileMatcher];
        id v8 = [v7 deBundleIdentifier];
        v9 = [v4 diagnosticExtensionIdentifier];
        id v10 = v8;
        goto LABEL_3;
      }
      objc_super v17 = [(FBKAttachment *)self extension];
      v18 = [v17 identifier];

      if (v18)
      {
        id v6 = [(FBKAttachment *)self extension];
        char v7 = [v6 identifier];
        id v8 = [v4 diagnosticExtensionIdentifier];
        char v11 = [v7 isEqualToString:v8];
        goto LABEL_4;
      }
    }
    char v11 = 0;
    goto LABEL_5;
  }
  id v6 = [v4 url];
  char v7 = [v6 lastPathComponent];
  id v8 = [(FBKAttachment *)self originalLocalFileURL];
  v9 = [v8 lastPathComponent];
  id v10 = v7;
LABEL_3:
  char v11 = [v10 isEqualToString:v9];

LABEL_4:
LABEL_5:

  return v11;
}

+ (id)descriptorForAttachment:(id)a3 given:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__FBKAttachment_descriptorForAttachment_given___block_invoke;
  v9[3] = &unk_264874D50;
  id v10 = v5;
  id v6 = v5;
  char v7 = objc_msgSend(a4, "ded_findWithBlock:", v9);

  return v7;
}

uint64_t __47__FBKAttachment_descriptorForAttachment_given___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) matchesAttachmentDescriptor:a2];
}

- (FBKMatcherPredicate)requirement
{
  return self->_requirement;
}

- (void)setRequirement:(id)a3
{
}

- (DEDExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (FBKURLExtension)urlExtension
{
  return self->_urlExtension;
}

- (void)setUrlExtension:(id)a3
{
}

- (BOOL)fileComesFromFBK
{
  return self->_fileComesFromFBK;
}

- (void)setFileComesFromFBK:(BOOL)a3
{
  self->_fileComesFromFBK = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSString)placeholderText
{
  return self->_placeholderText;
}

- (void)setPlaceholderText:(id)a3
{
}

- (NSString)proposedFileNameForLocalFiles
{
  return self->_proposedFileNameForLocalFiles;
}

- (void)setProposedFileNameForLocalFiles:(id)a3
{
}

- (NSString)collectorIdentifier
{
  return self->_collectorIdentifier;
}

- (NSURL)originalLocalFileURL
{
  return self->_originalLocalFileURL;
}

- (void)setOriginalLocalFileURL:(id)a3
{
}

- (NSString)localizedAttachmentInfo
{
  return self->_localizedAttachmentInfo;
}

- (void)setLocalizedAttachmentInfo:(id)a3
{
}

- (id)_annotationUntypedButAccessibleInSwift
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)set_annotationUntypedButAccessibleInSwift:(id)a3
{
}

- (DEDAttachmentGroup)attachedGroup
{
  return self->_attachedGroup;
}

- (void)setAttachedGroup:(id)a3
{
}

- (DEDAttachmentItem)attachedItem
{
  return self->_attachedItem;
}

- (void)setAttachedItem:(id)a3
{
}

- (int64_t)attachmentType
{
  return self->_attachmentType;
}

- (NSString)deviceUUID
{
  return self->_deviceUUID;
}

- (void)setDeviceUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUUID, 0);
  objc_storeStrong((id *)&self->_attachedItem, 0);
  objc_storeStrong((id *)&self->_attachedGroup, 0);
  objc_storeStrong(&self->__annotationUntypedButAccessibleInSwift, 0);
  objc_storeStrong((id *)&self->_localizedAttachmentInfo, 0);
  objc_storeStrong((id *)&self->_originalLocalFileURL, 0);
  objc_storeStrong((id *)&self->_collectorIdentifier, 0);
  objc_storeStrong((id *)&self->_proposedFileNameForLocalFiles, 0);
  objc_storeStrong((id *)&self->_placeholderText, 0);
  objc_storeStrong((id *)&self->_urlExtension, 0);
  objc_storeStrong((id *)&self->_extension, 0);

  objc_storeStrong((id *)&self->_requirement, 0);
}

- (_TtC12FeedbackCore23FBKAttachmentAnnotation)annotation
{
  int64_t v2 = self;
  char v3 = (void *)FBKAttachment.annotation.getter();

  return (_TtC12FeedbackCore23FBKAttachmentAnnotation *)v3;
}

- (void)loadAnnotationFromURL:(id)a3
{
  uint64_t v4 = sub_22A4B24C8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  id v10 = (char *)&v13 - v9;
  sub_22A4B2488();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  char v11 = self;
  id v12 = _s12FeedbackCore23FBKAttachmentAnnotationC7fromURLACSg10Foundation0F0V_tcfC_0((uint64_t)v8);
  [(FBKAttachment *)v11 set_annotationUntypedButAccessibleInSwift:v12];

  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
}

- (void)setGroup:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  char v3 = [a1 item];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "Setting group on Attachment with item: %{public}@", (uint8_t *)&v4, 0xCu);
}

- (void)setAttachmentType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "unknown attachment type given %ld", (uint8_t *)&v2, 0xCu);
}

- (void)setAttachmentType:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22A36D000, log, OS_LOG_TYPE_DEBUG, "FBKAttachmentType.otherFile/.fileDownload with no display name", v1, 2u);
}

- (void)isLocal
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "could not find item or group for attachment, cannot determine isLocal:", v1, 2u);
}

@end