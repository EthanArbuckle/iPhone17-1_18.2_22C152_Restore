@interface MFMessageComposeViewController
+ (BOOL)_canSendText;
+ (BOOL)canSendAttachments;
+ (BOOL)canSendPhotos:(int)a3 videos:(int)a4 audioClips:(int)a5;
+ (BOOL)canSendSubject;
+ (BOOL)canSendText;
+ (BOOL)isMMSEnabled;
+ (BOOL)isSupportedAttachmentUTI:(NSString *)uti;
+ (BOOL)isiMessageEnabled;
+ (double)maxTrimDurationForAudio;
+ (double)maxTrimDurationForVideo;
+ (id)_chatKitBundle;
+ (id)log;
+ (void)_preloadDependencies;
+ (void)_setupAccountMonitor;
+ (void)_startListeningForAvailabilityNotifications;
+ (void)_updateServiceAvailability;
+ (void)initialize;
- (BOOL)_isAudioMIMEType:(id)a3;
- (BOOL)_isImageMIMEType:(id)a3;
- (BOOL)_isVideoMIMEType:(id)a3;
- (BOOL)addAttachmentData:(NSData *)attachmentData typeIdentifier:(NSString *)uti filename:(NSString *)filename;
- (BOOL)addAttachmentData:(id)a3 withAlternateFilename:(id)a4;
- (BOOL)addAttachmentURL:(NSURL *)attachmentURL withAlternateFilename:(NSString *)alternateFilename;
- (BOOL)addRichLinkData:(id)a3 withWebpageURL:(id)a4;
- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers;
- (BOOL)canAddAttachmentURL:(id)a3;
- (BOOL)insertCollaborationItemProvider:(NSItemProvider *)itemProvider;
- (BOOL)insertCollaborationItemProvider:(id)a3 collaborationOptions:(id)a4 collaborationMetadata:(id)a5 isCollaboration:(BOOL)a6;
- (BOOL)insertCollaborationItemProvider:(id)a3 collaborationShareOptions:(id)a4 collaborationMetadata:(id)a5 isCollaboration:(BOOL)a6;
- (BOOL)insertGroupActivity:(id)a3;
- (BOOL)shouldHideClearPluginButton;
- (MFMessageComposeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (MSMessage)message;
- (NSArray)attachments;
- (NSArray)recipients;
- (NSString)body;
- (NSString)chatGUID;
- (NSString)groupName;
- (NSString)serviceId;
- (NSString)subject;
- (NSString)suggestions;
- (id)UTITypes;
- (id)_MIMETypeForURL:(id)a3;
- (id)_contentTypeForMIMEType:(id)a3;
- (id)_deviceValidationSendCompletion;
- (id)attachmentURLs;
- (id)cloudPhotoIDs;
- (id)contentText;
- (id)contentURLs;
- (id)messageComposeDelegate;
- (id)mutableAttachmentURLs;
- (id)photoIDs;
- (id)shareSheetSessionID;
- (int64_t)preferredPresentationStyle;
- (unint64_t)currentAttachedAudioCount;
- (unint64_t)currentAttachedImageCount;
- (unint64_t)currentAttachedVideoCount;
- (void)_insertCKSMSComposeFileDataForItemProvider:(id)a3 collaborationShareOptions:(id)a4 collaborationMetadata:(id)a5 sendAsCopyURL:(id)a6 isCollaboration:(BOOL)a7 outReturnResult:(BOOL *)a8;
- (void)_loadSWCopyRepresentationForItemProvider:(id)a3 completionHandler:(id)a4;
- (void)_loadSWCopyRepresentationForItemProvider:(id)a3 forTypeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)_setCanEditRecipients:(BOOL)a3;
- (void)_setNavBarTitle:(id)a3;
- (void)_setShouldDisableEntryField:(BOOL)a3;
- (void)_setShouldIgnoreEmailsWhenSending:(BOOL)a3;
- (void)_updateAttachmentCountForAttachmentURL:(id)a3;
- (void)dealloc;
- (void)disableUserAttachments;
- (void)insertSharedItemAndReturnEntryViewFrame:(id)a3 withAlternateFilename:(id)a4 completion:(id)a5;
- (void)setBody:(NSString *)body;
- (void)setChatGUID:(id)a3;
- (void)setCloudPhotoIDs:(id)a3;
- (void)setContentText:(id)a3;
- (void)setContentURLs:(id)a3;
- (void)setCurrentAttachedAudioCount:(unint64_t)a3;
- (void)setCurrentAttachedImageCount:(unint64_t)a3;
- (void)setCurrentAttachedVideoCount:(unint64_t)a3;
- (void)setGroupName:(id)a3;
- (void)setMessage:(MSMessage *)message;
- (void)setMessage:(id)a3 withExtensionBundleIdentifier:(id)a4;
- (void)setMessageComposeDelegate:(id)messageComposeDelegate;
- (void)setModalPresentationStyle:(int64_t)a3;
- (void)setPhotoIDs:(id)a3;
- (void)setPreferredPresentationStyle:(int64_t)a3;
- (void)setRecipients:(NSArray *)recipients;
- (void)setServiceId:(id)a3;
- (void)setShareSheetSessionID:(id)a3;
- (void)setShouldHideClearPluginButton:(BOOL)a3;
- (void)setSubject:(NSString *)subject;
- (void)setSuggestions:(id)a3;
- (void)setUPIVerificationCodeSendCompletion:(id)a3;
- (void)setUTITypes:(id)a3;
- (void)set_deviceValidationSendCompletion:(id)a3;
- (void)showSharedItemInEntryView;
- (void)smsComposeControllerCancelled:(id)a3;
- (void)smsComposeControllerEntryViewContentInserted:(id)a3;
- (void)smsComposeControllerSendStarted:(id)a3;
- (void)smsComposeControllerSendStarted:(id)a3 withText:(id)a4 messageGUID:(id)a5;
- (void)smsComposeControllerShouldSendMessageWithText:(id)a3 toRecipients:(id)a4 completion:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MFMessageComposeViewController

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__MFMessageComposeViewController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_7 != -1) {
    dispatch_once(&log_onceToken_7, block);
  }
  v2 = (void *)log_log_7;

  return v2;
}

void __37__MFMessageComposeViewController_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_7;
  log_log_7 = (uint64_t)v1;
}

+ (void)_setupAccountMonitor
{
  if (_setupAccountMonitor_accountMonitorToken != -1) {
    dispatch_once(&_setupAccountMonitor_accountMonitorToken, &__block_literal_global_27);
  }
}

void __54__MFMessageComposeViewController__setupAccountMonitor__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v6 = [v0 bundleIdentifier];

  os_log_t v1 = [MEMORY[0x1E4F29128] UUID];
  v2 = [v1 UUIDString];

  uint64_t v3 = [NSString stringWithFormat:@"MFMessageComposeViewController:%@#%@", v6, v2];
  v4 = (void *)sMFListenerName;
  sMFListenerName = v3;

  v5 = [MEMORY[0x1E4F61730] sharedInstance];
  [v5 addListenerID:sMFListenerName forService:1];
}

+ (BOOL)_canSendText
{
  if (MGGetBoolAnswer()) {
    return 1;
  }

  return +[MFMessageComposeViewController isiMessageEnabled];
}

+ (BOOL)canSendSubject
{
  if (+[MFMessageComposeViewController isMMSEnabled]) {
    return 1;
  }

  return +[MFMessageComposeViewController isiMessageEnabled];
}

+ (BOOL)canSendAttachments
{
  if (+[MFMessageComposeViewController isMMSEnabled]) {
    return 1;
  }

  return +[MFMessageComposeViewController isiMessageEnabled];
}

+ (BOOL)isSupportedAttachmentUTI:(NSString *)uti
{
  uint64_t v3 = [MEMORY[0x1E4F442D8] typeWithIdentifier:uti];
  if (+[MFMessageComposeViewController isiMessageEnabled])
  {
    goto LABEL_2;
  }
  if (!+[MFMessageComposeViewController isMMSEnabled])
  {
    v5 = (void *)MEMORY[0x1E4F444F0];
    goto LABEL_9;
  }
  if (([v3 conformsToType:*MEMORY[0x1E4F44330]] & 1) == 0
    && ([v3 conformsToType:*MEMORY[0x1E4F44338]] & 1) == 0
    && ([v3 conformsToType:*MEMORY[0x1E4F44518]] & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1E4F44400];
LABEL_9:
    char v4 = [v3 conformsToType:*v5];
    goto LABEL_10;
  }
LABEL_2:
  char v4 = 1;
LABEL_10:

  return v4;
}

+ (void)_updateServiceAvailability
{
  uint64_t v2 = sServiceAvailability;
  unsigned int v3 = [a1 _canSendText];
  if (sServiceAvailability != v3)
  {
    sServiceAvailability = v3;
    if (v2 != -1)
    {
      id v6 = (id)[objc_alloc(NSNumber) initWithBool:v3];
      char v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v6, @"__kMFMessageComposeViewControllerTextMessageAvailabilityKey", 0);
      v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 postNotificationName:@"__kMFMessageComposeViewControllerTextMessageAvailabilityDidChangeNotification" object:0 userInfo:v4];
    }
  }
}

+ (void)_startListeningForAvailabilityNotifications
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__MFMessageComposeViewController__startListeningForAvailabilityNotifications__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_startListeningForAvailabilityNotifications_listenerToken != -1) {
    dispatch_once(&_startListeningForAvailabilityNotifications_listenerToken, block);
  }
}

void __77__MFMessageComposeViewController__startListeningForAvailabilityNotifications__block_invoke(uint64_t a1)
{
  id v2 = [NSString alloc];
  name = (__CFString *)[v2 initWithFormat:@"%@%@", *MEMORY[0x1E4F64CD8], *MEMORY[0x1E4F64CF0]];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_SMSCapabilityChanged, name, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  char v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:*(void *)(a1 + 32) selector:sel__serviceAvailabilityChanged_ name:*MEMORY[0x1E4F61728] object:0];
}

+ (BOOL)canSendText
{
  unsigned int v3 = [MEMORY[0x1E4F74230] sharedConnection];
  char v4 = [v3 effectiveWhitelistedAppBundleIDs];
  v5 = v4;
  if (v4 && ![v4 containsObject:@"com.apple.MobileSMS"])
  {
    char v6 = 0;
  }
  else
  {
    [a1 _updateServiceAvailability];
    char v6 = 1;
  }
  if (sServiceAvailability > 0) {
    BOOL v7 = v6;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

+ (void)_preloadDependencies
{
  id v2 = (id)[a1 _chatKitBundle];
}

+ (id)_chatKitBundle
{
  id v2 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/PrivateFrameworks/ChatKit.framework"];
  [v2 load];

  return v2;
}

+ (double)maxTrimDurationForAudio
{
  id v2 = [a1 _chatKitBundle];
  objc_msgSend((id)objc_msgSend(v2, "classNamed:", @"CKSMSComposeController"), "maxTrimDurationForAudio");
  double v4 = v3;

  return v4;
}

+ (double)maxTrimDurationForVideo
{
  id v2 = [a1 _chatKitBundle];
  objc_msgSend((id)objc_msgSend(v2, "classNamed:", @"CKSMSComposeController"), "maxTrimDurationForVideo");
  double v4 = v3;

  return v4;
}

+ (BOOL)canSendPhotos:(int)a3 videos:(int)a4 audioClips:(int)a5
{
  return softLinkIMSPIShareSheetCanSendMedia(*(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a5);
}

+ (void)initialize
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MFMessageComposeViewController_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __44__MFMessageComposeViewController_initialize__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupAccountMonitor];
}

- (MFMessageComposeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(id)objc_opt_class() canSendText])
  {
    v16.receiver = self;
    v16.super_class = (Class)MFMessageComposeViewController;
    v8 = [(MFMessageComposeViewController *)&v16 initWithNibName:v6 bundle:v7];
    v9 = v8;
    if (v8)
    {
      [(MFMessageComposeViewController *)v8 setPreferredPresentationStyle:1];
      v10 = [(id)objc_opt_class() _chatKitBundle];
      v11 = objc_msgSend(objc_alloc((Class)objc_msgSend(v10, "classNamed:", @"CKSMSComposeController")), "initWithNavigationController:", v9);
      [v11 setDelegate:v9];
      if ((dyld_program_sdk_at_least() & 1) == 0) {
        [(MFMessageComposeViewController *)v9 disableUserAttachments];
      }
      [(MFMessageComposeViewController *)v9 pushViewController:v11 animated:0];
      [(MFMessageComposeViewController *)v9 setCurrentAttachedVideoCount:0];
      [(MFMessageComposeViewController *)v9 setCurrentAttachedAudioCount:0];
      [(MFMessageComposeViewController *)v9 setCurrentAttachedImageCount:0];
    }
    self = v9;
    v12 = self;
  }
  else
  {
    v13 = +[MFMessageComposeViewController log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_opt_class();
      -[MFMessageComposeViewController initWithNibName:bundle:](v14, buf, v13);
    }

    v12 = 0;
  }

  return v12;
}

- (BOOL)canAddAttachmentURL:(id)a3
{
  id v4 = a3;
  if ([v4 isFileURL])
  {
    v5 = [(MFMessageComposeViewController *)self _MIMETypeForURL:v4];
    id v6 = [(id)objc_opt_class() _chatKitBundle];
    id v7 = (void *)[v6 classNamed:@"CKSMSComposeController"];
    char v8 = [v7 acceptsMIMEType:v5];
    BOOL v9 = [(MFMessageComposeViewController *)self _isVideoMIMEType:v5];
    BOOL v10 = [(MFMessageComposeViewController *)self _isAudioMIMEType:v5];
    BOOL v11 = [(MFMessageComposeViewController *)self _isImageMIMEType:v5];
    if (v9 || v10 || v11) {
      char v12 = [v7 canSendPhotos:(LODWORD(self->_currentAttachedImageCount) + v11) videos:(LODWORD(self->_currentAttachedVideoCount) + v9) audioClips:(LODWORD(self->_currentAttachedAudioCount) + v10)];
    }
    else {
      char v12 = 0;
    }

    char v13 = v8 & v12;
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (id)attachmentURLs
{
  return 0;
}

- (id)mutableAttachmentURLs
{
  return 0;
}

- (id)_MIMETypeForURL:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F290B0] sharedMappings];
  v5 = [v3 pathExtension];
  id v6 = [v4 MIMETypeForExtension:v5];

  return v6;
}

- (id)_contentTypeForMIMEType:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"/"];
  if ((unint64_t)[v3 count] < 2)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [v3 objectAtIndex:0];
  }

  return v4;
}

- (BOOL)_isVideoMIMEType:(id)a3
{
  id v3 = [(MFMessageComposeViewController *)self _contentTypeForMIMEType:a3];
  char v4 = [v3 isEqualToIgnoringCase:@"video"];

  return v4;
}

- (BOOL)_isAudioMIMEType:(id)a3
{
  id v3 = [(MFMessageComposeViewController *)self _contentTypeForMIMEType:a3];
  char v4 = [v3 isEqualToIgnoringCase:@"audio"];

  return v4;
}

- (BOOL)_isImageMIMEType:(id)a3
{
  id v3 = [(MFMessageComposeViewController *)self _contentTypeForMIMEType:a3];
  char v4 = [v3 isEqualToIgnoringCase:@"image"];

  return v4;
}

- (BOOL)addAttachmentURL:(NSURL *)attachmentURL withAlternateFilename:(NSString *)alternateFilename
{
  id v6 = attachmentURL;
  id v7 = alternateFilename;
  if ([(NSURL *)v6 isFileURL]
    || ([(NSURL *)v6 scheme],
        char v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 isEqualToString:@"assets-library"],
        v8,
        (v9 & 1) != 0))
  {
    BOOL v10 = [(MFMessageComposeViewController *)self topViewController];
    BOOL v11 = v10;
    if (v10 && [v10 insertAttachmentWithURL:v6 andDescription:v7])
    {
      [(MFMessageComposeViewController *)self _updateAttachmentCountForAttachmentURL:v6];
      BOOL v12 = 1;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)addAttachmentData:(NSData *)attachmentData typeIdentifier:(NSString *)uti filename:(NSString *)filename
{
  char v8 = attachmentData;
  char v9 = uti;
  BOOL v10 = filename;
  if (!v9) {
    goto LABEL_7;
  }
  uint64_t v11 = [(NSString *)v9 length];
  char v12 = 0;
  if (!v8 || !v11) {
    goto LABEL_10;
  }
  if (![(NSData *)v8 length])
  {
LABEL_7:
    char v12 = 0;
    goto LABEL_10;
  }
  char v13 = [(MFMessageComposeViewController *)self topViewController];
  if (v13)
  {
    uint64_t v14 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v9];
    v15 = [v14 preferredMIMEType];
    char v12 = [v13 insertData:v8 MIMEType:v15 exportedFilename:v10];
  }
  else
  {
    char v12 = 0;
  }

LABEL_10:
  return v12;
}

- (BOOL)addAttachmentData:(id)a3 withAlternateFilename:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 length])
  {
    char v8 = [(MFMessageComposeViewController *)self topViewController];
    if (v8)
    {
      char v9 = [MEMORY[0x1E4F290B0] sharedMappings];
      BOOL v10 = [v7 pathExtension];
      uint64_t v11 = [v9 MIMETypeForExtension:v10];

      char v12 = [v8 insertData:v6 MIMEType:v11 exportedFilename:v7];
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (void)insertSharedItemAndReturnEntryViewFrame:(id)a3 withAlternateFilename:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(MFMessageComposeViewController *)self topViewController];
  if (v11)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __107__MFMessageComposeViewController_insertSharedItemAndReturnEntryViewFrame_withAlternateFilename_completion___block_invoke;
    v12[3] = &unk_1E5F7C978;
    id v13 = v10;
    [v11 insertItemForSendingAndCalculateEntryViewFrame:v8 withAlternateFilename:v9 completion:v12];
  }
}

void __107__MFMessageComposeViewController_insertSharedItemAndReturnEntryViewFrame_withAlternateFilename_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = v3;
  [v3 CGRectValue];
  (*(void (**)(uint64_t))(v4 + 16))(v4);
}

- (void)_insertCKSMSComposeFileDataForItemProvider:(id)a3 collaborationShareOptions:(id)a4 collaborationMetadata:(id)a5 sendAsCopyURL:(id)a6 isCollaboration:(BOOL)a7 outReturnResult:(BOOL *)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  uint64_t v18 = [(MFMessageComposeViewController *)self topViewController];
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    v20 = +[MFMessageComposeViewController log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF945000, v20, OS_LOG_TYPE_DEFAULT, "Calling new compose SPI with nil URL for spinner.", buf, 2u);
    }

    v21 = [(MFMessageComposeViewController *)self topViewController];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __171__MFMessageComposeViewController__insertCKSMSComposeFileDataForItemProvider_collaborationShareOptions_collaborationMetadata_sendAsCopyURL_isCollaboration_outReturnResult___block_invoke;
    v32[3] = &unk_1E5F7CA10;
    id v33 = v14;
    v34 = self;
    id v35 = v15;
    id v36 = v16;
    BOOL v39 = v9;
    id v37 = v17;
    v38 = a8;
    [v21 insertFileURLForCollaboration:0 collaborationShareOptions:v35 metadata:v36 sendAsCopyURL:v37 isCollaboration:v9 completionHandler:v32];

    v22 = v33;
LABEL_9:

    goto LABEL_10;
  }
  v23 = [(MFMessageComposeViewController *)self topViewController];
  char v24 = objc_opt_respondsToSelector();

  if (v24)
  {
    v25 = +[MFMessageComposeViewController log];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF945000, v25, OS_LOG_TYPE_DEFAULT, "Using legacy CKSMSComposeController SPI for FileProvider", buf, 2u);
    }

    uint64_t v26 = objc_opt_class();
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __171__MFMessageComposeViewController__insertCKSMSComposeFileDataForItemProvider_collaborationShareOptions_collaborationMetadata_sendAsCopyURL_isCollaboration_outReturnResult___block_invoke_160;
    v28[3] = &unk_1E5F7CA38;
    v28[4] = self;
    id v29 = v15;
    id v30 = v16;
    BOOL v31 = v9;
    id v27 = (id)[v14 loadObjectOfClass:v26 completionHandler:v28];

    v22 = v29;
    goto LABEL_9;
  }
LABEL_10:
}

void __171__MFMessageComposeViewController__insertCKSMSComposeFileDataForItemProvider_collaborationShareOptions_collaborationMetadata_sendAsCopyURL_isCollaboration_outReturnResult___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __171__MFMessageComposeViewController__insertCKSMSComposeFileDataForItemProvider_collaborationShareOptions_collaborationMetadata_sendAsCopyURL_isCollaboration_outReturnResult___block_invoke_2;
  v8[3] = &unk_1E5F7C9E8;
  uint64_t v4 = *(void **)(a1 + 48);
  v8[4] = *(void *)(a1 + 40);
  id v9 = v4;
  id v10 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 64);
  char v13 = *(unsigned char *)(a1 + 80);
  uint64_t v6 = *(void *)(a1 + 72);
  id v11 = v5;
  uint64_t v12 = v6;
  id v7 = (id)[v2 loadObjectOfClass:v3 completionHandler:v8];
}

void __171__MFMessageComposeViewController__insertCKSMSComposeFileDataForItemProvider_collaborationShareOptions_collaborationMetadata_sendAsCopyURL_isCollaboration_outReturnResult___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[MFMessageComposeViewController log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v3;
    _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_DEFAULT, "Loading item provider for type file URL. URL: %@{public} and metadata", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __171__MFMessageComposeViewController__insertCKSMSComposeFileDataForItemProvider_collaborationShareOptions_collaborationMetadata_sendAsCopyURL_isCollaboration_outReturnResult___block_invoke_153;
  block[3] = &unk_1E5F7C9C0;
  id v5 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v10 = v3;
  id v11 = v5;
  id v12 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  char v15 = *(unsigned char *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 64);
  id v13 = v6;
  uint64_t v14 = v7;
  id v8 = v3;
  dispatch_sync(MEMORY[0x1E4F14428], block);
}

void __171__MFMessageComposeViewController__insertCKSMSComposeFileDataForItemProvider_collaborationShareOptions_collaborationMetadata_sendAsCopyURL_isCollaboration_outReturnResult___block_invoke_153(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) topViewController];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 80);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __171__MFMessageComposeViewController__insertCKSMSComposeFileDataForItemProvider_collaborationShareOptions_collaborationMetadata_sendAsCopyURL_isCollaboration_outReturnResult___block_invoke_2_154;
  v8[3] = &__block_descriptor_40_e8_v12__0B8l;
  v8[4] = *(void *)(a1 + 72);
  [v2 insertFileURLForCollaboration:v3 collaborationShareOptions:v4 metadata:v5 sendAsCopyURL:v6 isCollaboration:v7 completionHandler:v8];
}

uint64_t __171__MFMessageComposeViewController__insertCKSMSComposeFileDataForItemProvider_collaborationShareOptions_collaborationMetadata_sendAsCopyURL_isCollaboration_outReturnResult___block_invoke_2_154(uint64_t result, char a2)
{
  id v2 = *(unsigned char **)(result + 32);
  if (v2) {
    unsigned char *v2 = a2;
  }
  return result;
}

void __171__MFMessageComposeViewController__insertCKSMSComposeFileDataForItemProvider_collaborationShareOptions_collaborationMetadata_sendAsCopyURL_isCollaboration_outReturnResult___block_invoke_160(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[MFMessageComposeViewController log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_DEFAULT, "Loading item provider for type file URL. URL: %@{public} and metadata", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = [*(id *)(a1 + 32) topViewController];
  [v5 insertFileURLForCollaboration:v3 collaborationShareOptions:*(void *)(a1 + 40) metadata:*(void *)(a1 + 48) isCollaboration:*(unsigned __int8 *)(a1 + 56)];
}

- (void)_loadSWCopyRepresentationForItemProvider:(id)a3 completionHandler:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = getSWCopyRepresentationTypeIdentifier();
  [(MFMessageComposeViewController *)self _loadSWCopyRepresentationForItemProvider:v8 forTypeIdentifier:v7 completionHandler:v6];
}

- (void)_loadSWCopyRepresentationForItemProvider:(id)a3 forTypeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __111__MFMessageComposeViewController__loadSWCopyRepresentationForItemProvider_forTypeIdentifier_completionHandler___block_invoke;
  v10[3] = &unk_1E5F7CA88;
  id v11 = v7;
  id v8 = v7;
  id v9 = (id)[a3 loadInPlaceFileRepresentationForTypeIdentifier:a4 completionHandler:v10];
}

void __111__MFMessageComposeViewController__loadSWCopyRepresentationForItemProvider_forTypeIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = v8;
  if (!v7 || v8)
  {
    id v13 = +[MFMessageComposeViewController log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __111__MFMessageComposeViewController__loadSWCopyRepresentationForItemProvider_forTypeIdentifier_completionHandler___block_invoke_cold_1((uint64_t)v9, v13, v14, v15, v16, v17, v18, v19);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v26 = 0;
    id v27 = &v26;
    uint64_t v28 = 0x3032000000;
    id v29 = __Block_byref_object_copy__7;
    id v30 = __Block_byref_object_dispose__7;
    id v31 = (id)0xAAAAAAAAAAAAAAAALL;
    id v31 = v7;
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:0];
    uint64_t v11 = v27[5];
    id v25 = 0;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __111__MFMessageComposeViewController__loadSWCopyRepresentationForItemProvider_forTypeIdentifier_completionHandler___block_invoke_162;
    v20[3] = &unk_1E5F7CA60;
    v23 = &v26;
    id v21 = 0;
    char v24 = a3;
    id v22 = *(id *)(a1 + 32);
    [v10 coordinateReadingItemAtURL:v11 options:1 error:&v25 byAccessor:v20];
    id v12 = v25;

    _Block_object_dispose(&v26, 8);
  }
}

void __111__MFMessageComposeViewController__loadSWCopyRepresentationForItemProvider_forTypeIdentifier_completionHandler___block_invoke_162(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = a1 + 48;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    if (*(unsigned char *)(a1 + 56))
    {
      id v6 = +[MFMessageComposeViewController log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AF945000, v6, OS_LOG_TYPE_DEFAULT, "Send copy representation was loaded in place", buf, 2u);
      }
    }
    else
    {
      id v7 = +[MFMessageComposeViewController log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AF945000, v7, OS_LOG_TYPE_DEFAULT, "Send copy representation was not loaded in place, will re-save file to temp directory", buf, 2u);
      }

      id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v26 = [*(id *)(*(void *)(*(void *)v5 + 8) + 40) lastPathComponent];
      id v8 = [v6 temporaryDirectory];
      id v28 = 0;
      id v9 = [v6 URLForDirectory:99 inDomain:1 appropriateForURL:v8 create:1 error:&v28];
      id v10 = v28;

      if (!v9)
      {
        uint64_t v11 = +[MFMessageComposeViewController log];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          __111__MFMessageComposeViewController__loadSWCopyRepresentationForItemProvider_forTypeIdentifier_completionHandler___block_invoke_162_cold_3((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);
        }

        id v9 = [v6 temporaryDirectory];
      }
      uint64_t v18 = [v9 URLByAppendingPathComponent:v26];
      uint64_t v19 = *(void *)(*(void *)(*(void *)v5 + 8) + 40);
      id v27 = v10;
      int v20 = [v6 copyItemAtURL:v19 toURL:v18 error:&v27];
      id v21 = v27;

      if (v20)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)v5 + 8) + 40), v18);
        id v22 = +[MFMessageComposeViewController log];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = *(void *)(*(void *)(*(void *)v5 + 8) + 40);
          *(_DWORD *)buf = 138412290;
          uint64_t v30 = v23;
          _os_log_impl(&dword_1AF945000, v22, OS_LOG_TYPE_DEFAULT, "Successfully obtained sendCopyURL: %@", buf, 0xCu);
        }
      }
      else
      {
        id v22 = +[MFMessageComposeViewController log];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          __111__MFMessageComposeViewController__loadSWCopyRepresentationForItemProvider_forTypeIdentifier_completionHandler___block_invoke_162_cold_2();
        }
      }
    }
  }
  else
  {
    id v6 = +[MFMessageComposeViewController log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __111__MFMessageComposeViewController__loadSWCopyRepresentationForItemProvider_forTypeIdentifier_completionHandler___block_invoke_162_cold_1();
    }
  }

  char v24 = +[MFMessageComposeViewController log];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v30 = v25;
    _os_log_impl(&dword_1AF945000, v24, OS_LOG_TYPE_DEFAULT, "Item provider is conforming to UTCopyRepresentationTypeIdentifier. sendCopyURL: %@", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)insertCollaborationItemProvider:(id)a3 collaborationShareOptions:(id)a4 collaborationMetadata:(id)a5 isCollaboration:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = +[MFMessageComposeViewController log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_1AF945000, v13, OS_LOG_TYPE_DEFAULT, "Invoking insertCollaborationItemProvider with metadata: %@{public}", (uint8_t *)&buf, 0xCu);
  }

  if (v10)
  {
    Class SWPendingCollaborationClass = get_SWPendingCollaborationClass();
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v80 = 0x2020000000;
    char v81 = 0;
    if ([v10 canLoadObjectOfClass:objc_opt_class()])
    {
      uint64_t v15 = getSWCopyRepresentationTypeIdentifier();
      int v16 = [v10 hasItemConformingToTypeIdentifier:v15];

      if (v16)
      {
        v70[0] = MEMORY[0x1E4F143A8];
        v70[1] = 3221225472;
        v70[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke;
        v70[3] = &unk_1E5F7CAB0;
        v70[4] = self;
        id v71 = v10;
        id v72 = v11;
        BOOL v75 = v6;
        id v73 = v12;
        p_long long buf = &buf;
        [(MFMessageComposeViewController *)self _loadSWCopyRepresentationForItemProvider:v71 completionHandler:v70];
      }
      else
      {
        char v24 = +[MFMessageComposeViewController log];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = [v10 registeredTypeIdentifiers];
          LODWORD(v76) = 138412290;
          *(void *)((char *)&v76 + 4) = v25;
          _os_log_impl(&dword_1AF945000, v24, OS_LOG_TYPE_DEFAULT, "Item provider does not have item conforming to UTCopyRepresentationTypeIdentifier. Registered type identifiers are: %@", (uint8_t *)&v76, 0xCu);
        }
        [(MFMessageComposeViewController *)self _insertCKSMSComposeFileDataForItemProvider:v10 collaborationShareOptions:v11 collaborationMetadata:v12 sendAsCopyURL:0 isCollaboration:v6 outReturnResult:*((void *)&buf + 1) + 24];
      }
      BOOL v18 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
      goto LABEL_37;
    }
    if ([v10 canLoadObjectOfClass:objc_opt_class()])
    {
      uint64_t v19 = +[MFMessageComposeViewController log];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v76) = 0;
        _os_log_impl(&dword_1AF945000, v19, OS_LOG_TYPE_DEFAULT, "Loading item provider for SWShareableContent", (uint8_t *)&v76, 2u);
      }

      int v20 = [(MFMessageComposeViewController *)self topViewController];
      char v21 = objc_opt_respondsToSelector();

      if (v21)
      {
        *(void *)&long long v76 = 0;
        *((void *)&v76 + 1) = &v76;
        uint64_t v77 = 0x2020000000;
        char v78 = 0;
        id v22 = [(MFMessageComposeViewController *)self topViewController];
        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_168;
        v62[3] = &unk_1E5F7CB50;
        Class v68 = SWPendingCollaborationClass;
        id v63 = v10;
        v64 = self;
        id v65 = v11;
        BOOL v69 = v6;
        id v66 = v12;
        v67 = &v76;
        [v22 insertSWYPendingCollaboration:0 collaborationShareOptions:0 collaborationMetadata:0 sendAsCopyURL:0 isCollaboration:v6 completionHandler:v62];

        BOOL v18 = *(unsigned char *)(*((void *)&v76 + 1) + 24) != 0;
LABEL_27:
        _Block_object_dispose(&v76, 8);
LABEL_37:
        _Block_object_dispose(&buf, 8);
        goto LABEL_38;
      }
      v32 = [(MFMessageComposeViewController *)self topViewController];
      char v33 = objc_opt_respondsToSelector();

      if (v33)
      {
        *(void *)&long long v76 = 0;
        *((void *)&v76 + 1) = &v76;
        uint64_t v77 = 0x2020000000;
        char v78 = 0;
        v34 = [(MFMessageComposeViewController *)self topViewController];
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_4;
        v55[3] = &unk_1E5F7CBC8;
        Class v61 = SWPendingCollaborationClass;
        id v56 = v10;
        v57 = self;
        id v58 = v11;
        id v59 = v12;
        v60 = &v76;
        [v34 insertSWYPendingCollaboration:0 collaborationShareOptions:0 collaborationMetadata:0 completionHandler:v55];

        BOOL v18 = *(unsigned char *)(*((void *)&v76 + 1) + 24) != 0;
        goto LABEL_27;
      }
LABEL_28:
      BOOL v18 = 0;
      goto LABEL_37;
    }
    uint64_t v23 = (void *)*MEMORY[0x1E4F1A4D8];
    if (![v10 hasItemConformingToTypeIdentifier:*MEMORY[0x1E4F1A4D8]])
    {
      uint64_t v23 = (void *)*MEMORY[0x1E4F1A4D0];
      if (![v10 hasItemConformingToTypeIdentifier:*MEMORY[0x1E4F1A4D0]]) {
        goto LABEL_28;
      }
    }
    id v26 = v23;
    uint64_t v27 = objc_opt_class();
    if (!v26) {
      goto LABEL_28;
    }
    *(void *)&long long v76 = 0;
    *((void *)&v76 + 1) = &v76;
    uint64_t v77 = 0x2020000000;
    char v78 = 0;
    id v28 = [(MFMessageComposeViewController *)self topViewController];
    char v29 = objc_opt_respondsToSelector();

    if (v29)
    {
      uint64_t v30 = [(MFMessageComposeViewController *)self topViewController];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_2_183;
      v47[3] = &unk_1E5F7CB50;
      id v48 = v10;
      uint64_t v53 = v27;
      id v49 = v26;
      v50 = self;
      BOOL v54 = v6;
      id v51 = v11;
      v52 = &v76;
      [v30 insertCKShareForCollaboration:0 containerSetupInfo:0 collaborationShareOptions:v51 isCollaboration:v6 completionHandler:v47];

      BOOL v18 = *(unsigned char *)(*((void *)&v76 + 1) + 24) != 0;
      uint64_t v31 = v48;
    }
    else
    {
      uint64_t v31 = [(MFMessageComposeViewController *)self topViewController];
      if (objc_opt_respondsToSelector())
      {
        int v35 = [v10 canLoadObjectOfClass:objc_opt_class()];

        if (!v35)
        {
          BOOL v18 = 0;
          goto LABEL_36;
        }
        id v36 = +[MFMessageComposeViewController log];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v46 = 0;
          _os_log_impl(&dword_1AF945000, v36, OS_LOG_TYPE_DEFAULT, "Using legacy CKSMSComposeController SPI for CKShare.", v46, 2u);
        }

        uint64_t v37 = objc_opt_class();
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_189;
        v40[3] = &unk_1E5F7CC40;
        id v41 = v26;
        v42 = self;
        BOOL v45 = v6;
        id v43 = v11;
        uint64_t v44 = v27;
        id v38 = (id)[v10 loadObjectOfClass:v37 completionHandler:v40];

        BOOL v18 = 1;
        uint64_t v31 = v41;
      }
      else
      {
        BOOL v18 = 0;
      }
    }

LABEL_36:
    _Block_object_dispose(&v76, 8);

    goto LABEL_37;
  }
  uint64_t v17 = +[MFMessageComposeViewController log];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[MFMessageComposeViewController insertCollaborationItemProvider:collaborationShareOptions:collaborationMetadata:isCollaboration:](v17);
  }

  BOOL v18 = 0;
LABEL_38:

  return v18;
}

uint64_t __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _insertCKSMSComposeFileDataForItemProvider:*(void *)(a1 + 40) collaborationShareOptions:*(void *)(a1 + 48) collaborationMetadata:*(void *)(a1 + 56) sendAsCopyURL:a2 isCollaboration:*(unsigned __int8 *)(a1 + 72) outReturnResult:*(void *)(*(void *)(a1 + 64) + 8) + 24];
}

void __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_168(uint64_t a1)
{
  id v2 = +[MFMessageComposeViewController log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1AF945000, v2, OS_LOG_TYPE_DEFAULT, "Loading item provider for _SWPendingCollaboration with nil items", buf, 2u);
  }

  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = objc_opt_class();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_169;
  v11[3] = &unk_1E5F7CB28;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  id v12 = v5;
  uint64_t v13 = v6;
  id v14 = v7;
  id v8 = *(id *)(a1 + 56);
  char v17 = *(unsigned char *)(a1 + 80);
  uint64_t v9 = *(void *)(a1 + 64);
  id v15 = v8;
  uint64_t v16 = v9;
  id v10 = (id)[v3 loadObjectOfClass:v4 completionHandler:v11];
}

void __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_169(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_2;
  block[3] = &unk_1E5F7CB00;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void **)(a1 + 48);
  id v11 = v4;
  uint64_t v12 = v5;
  id v13 = v3;
  id v14 = v6;
  id v7 = *(id *)(a1 + 56);
  char v17 = *(unsigned char *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 64);
  id v15 = v7;
  uint64_t v16 = v8;
  id v9 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_2(uint64_t a1)
{
  id v2 = +[MFMessageComposeViewController log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1AF945000, v2, OS_LOG_TYPE_DEFAULT, "Loading item provider for _SWPendingCollaboration with non nil items", buf, 2u);
  }

  id v3 = *(void **)(a1 + 32);
  id v4 = (void *)*MEMORY[0x1E4F444F0];
  uint64_t v5 = [(id)*MEMORY[0x1E4F444F0] identifier];
  int v6 = [v3 hasItemConformingToTypeIdentifier:v5];

  id v7 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = [v4 identifier];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_170;
    v19[3] = &unk_1E5F7CAB0;
    id v10 = *(void **)(a1 + 48);
    v19[4] = *(void *)(a1 + 40);
    id v20 = v10;
    id v21 = *(id *)(a1 + 56);
    id v11 = *(id *)(a1 + 64);
    char v24 = *(unsigned char *)(a1 + 80);
    uint64_t v12 = *(void *)(a1 + 72);
    id v22 = v11;
    uint64_t v23 = v12;
    [v7 _loadSWCopyRepresentationForItemProvider:v8 forTypeIdentifier:v9 completionHandler:v19];
  }
  else
  {
    id v13 = [*(id *)(a1 + 40) topViewController];
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 56);
    uint64_t v16 = *(unsigned __int8 *)(a1 + 80);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_3;
    v18[3] = &unk_1E5F7CAD8;
    uint64_t v17 = *(void *)(a1 + 64);
    v18[4] = *(void *)(a1 + 72);
    [v13 insertSWYPendingCollaboration:v14 collaborationShareOptions:v15 collaborationMetadata:v17 sendAsCopyURL:0 isCollaboration:v16 completionHandler:v18];
  }
}

void __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_170(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) topViewController];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 72);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_2_171;
  v9[3] = &unk_1E5F7CAD8;
  uint64_t v8 = *(void *)(a1 + 56);
  v9[4] = *(void *)(a1 + 64);
  [v4 insertSWYPendingCollaboration:v5 collaborationShareOptions:v6 collaborationMetadata:v8 sendAsCopyURL:v3 isCollaboration:v7 completionHandler:v9];
}

uint64_t __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_2_171(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_3(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_4(uint64_t a1)
{
  id v2 = +[MFMessageComposeViewController log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1AF945000, v2, OS_LOG_TYPE_DEFAULT, "Loading item provider for _SWPendingCollaboration with nil items", buf, 2u);
  }

  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = objc_opt_class();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_175;
  v9[3] = &unk_1E5F7CBA0;
  uint64_t v5 = *(void **)(a1 + 48);
  v9[4] = *(void *)(a1 + 40);
  id v10 = v5;
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  id v11 = v6;
  uint64_t v12 = v7;
  id v8 = (id)[v3 loadObjectOfClass:v4 completionHandler:v9];
}

void __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_175(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_2_176;
  block[3] = &unk_1E5F7CB78;
  uint64_t v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v9 = v3;
  id v10 = v4;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v11 = v5;
  uint64_t v12 = v6;
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_2_176(uint64_t a1)
{
  id v2 = +[MFMessageComposeViewController log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1AF945000, v2, OS_LOG_TYPE_DEFAULT, "Loading item provider for _SWPendingCollaboration with non nil items", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) topViewController];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_177;
  v7[3] = &unk_1E5F7CAD8;
  uint64_t v6 = *(void *)(a1 + 56);
  v7[4] = *(void *)(a1 + 64);
  [v3 insertSWYPendingCollaboration:v4 collaborationShareOptions:v5 collaborationMetadata:v6 completionHandler:v7];
}

uint64_t __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_177(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_2_183(uint64_t a1)
{
  id v2 = +[MFMessageComposeViewController log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1AF945000, v2, OS_LOG_TYPE_DEFAULT, "Calling MVS SPI with nil URL.", buf, 2u);
  }

  if ([*(id *)(a1 + 32) canLoadObjectOfClass:objc_opt_class()])
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = objc_opt_class();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_184;
    v11[3] = &unk_1E5F7CC18;
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = *(void **)(a1 + 56);
    id v12 = v5;
    uint64_t v13 = v6;
    id v8 = v7;
    char v16 = *(unsigned char *)(a1 + 80);
    uint64_t v9 = *(void *)(a1 + 64);
    id v14 = v8;
    uint64_t v15 = v9;
    id v10 = (id)[v3 loadObjectOfClass:v4 completionHandler:v11];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
}

void __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_184(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[MFMessageComposeViewController log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v22 = v5;
    _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_DEFAULT, "Loading item provider for Type Identifier %@", buf, 0xCu);
  }

  if (v3)
  {
    id v6 = v3;
    id v7 = [v6 share];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_185;
    v14[3] = &unk_1E5F7CBF0;
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void **)(a1 + 48);
    id v15 = v7;
    uint64_t v16 = v8;
    id v17 = v6;
    id v10 = v9;
    char v20 = *(unsigned char *)(a1 + 64);
    uint64_t v11 = *(void *)(a1 + 56);
    id v18 = v10;
    uint64_t v19 = v11;
    id v12 = v6;
    id v13 = v7;
    dispatch_async(MEMORY[0x1E4F14428], v14);
  }
}

void __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_185(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = +[MFMessageComposeViewController log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) URL];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1AF945000, v2, OS_LOG_TYPE_DEFAULT, "Calling MVS SPI with unloaded item provider. URL: %@", buf, 0xCu);
  }
  uint64_t v4 = [*(id *)(a1 + 40) topViewController];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [*(id *)(a1 + 48) containerSetupInfo];
  uint64_t v7 = *(unsigned __int8 *)(a1 + 72);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_186;
  v9[3] = &unk_1E5F7CAD8;
  uint64_t v8 = *(void *)(a1 + 56);
  v9[4] = *(void *)(a1 + 64);
  [v4 insertCKShareForCollaboration:v5 containerSetupInfo:v6 collaborationShareOptions:v8 isCollaboration:v7 completionHandler:v9];
}

uint64_t __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_186(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_189(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[MFMessageComposeViewController log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v11 = 138412290;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_DEFAULT, "Loading item provider for Type Identifier %@", (uint8_t *)&v11, 0xCu);
  }

  if (v3)
  {
    id v6 = v3;
    uint64_t v7 = [v6 share];
    uint64_t v8 = [*(id *)(a1 + 40) topViewController];
    uint64_t v9 = [v6 containerSetupInfo];
    [v8 insertCKShareForCollaboration:v7 containerSetupInfo:v9 collaborationShareOptions:*(void *)(a1 + 48) isCollaboration:*(unsigned __int8 *)(a1 + 64)];
  }
  else
  {
    id v6 = +[MFMessageComposeViewController log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v10 = objc_opt_class();
      __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_189_cold_1(v10, (uint64_t)&v11, v6);
    }
  }
}

- (BOOL)insertCollaborationItemProvider:(id)a3 collaborationOptions:(id)a4 collaborationMetadata:(id)a5 isCollaboration:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void *)[objc_alloc(get_SWCollaborationShareOptionsClass()) initWithOptionsGroups:v11];
  LOBYTE(v6) = [(MFMessageComposeViewController *)self insertCollaborationItemProvider:v10 collaborationShareOptions:v13 collaborationMetadata:v12 isCollaboration:v6];

  return v6;
}

- (BOOL)insertGroupActivity:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = v4 != 0;
  if (v4)
  {
    BOOL v6 = +[MFMessageComposeViewController log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_1AF945000, v6, OS_LOG_TYPE_DEFAULT, "Inserting groupActivity %@{public}", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v7 = [(MFMessageComposeViewController *)self topViewController];
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0)
    {
      BOOL v5 = 0;
      goto LABEL_10;
    }
    uint64_t v9 = [(MFMessageComposeViewController *)self topViewController];
    [v9 insertGroupActivity:v4];
  }
  else
  {
    uint64_t v9 = +[MFMessageComposeViewController log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MFMessageComposeViewController insertGroupActivity:](v9);
    }
  }

LABEL_10:
  return v5;
}

- (void)showSharedItemInEntryView
{
  id v2 = [(MFMessageComposeViewController *)self topViewController];
  if (v2) {
    [v2 showInsertedItemInEntryView];
  }
}

- (BOOL)addRichLinkData:(id)a3 withWebpageURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    char v8 = [(MFMessageComposeViewController *)self topViewController];
    uint64_t v9 = v8;
    if (v8) {
      char v10 = [v8 insertRichLinkWithURL:v7 andData:v6];
    }
    else {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)setMessage:(id)a3 withExtensionBundleIdentifier:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = (MSMessage *)a3;
  id v8 = a4;
  p_message = &self->_message;
  if (self->_message != v7)
  {
    objc_storeStrong((id *)&self->_message, a3);
    if (*p_message)
    {
      char v10 = [(MFMessageComposeViewController *)self topViewController];
      int v11 = v10;
      if (v10)
      {
        if (v8)
        {
          id v12 = +[MFMessageComposeViewController log];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            int v13 = 138412290;
            id v14 = v8;
            _os_log_impl(&dword_1AF945000, v12, OS_LOG_TYPE_DEFAULT, "Passing override extensionBundleIdentifier: '%@' to CKSMSComposeController.", (uint8_t *)&v13, 0xCu);
          }

          if (objc_opt_respondsToSelector()) {
            [v11 insertMessage:*p_message extensionBundleIdentifier:v8];
          }
        }
        else
        {
          [v10 insertMessage:*p_message];
        }
      }
    }
  }
}

- (void)setMessage:(MSMessage *)message
{
}

- (MSMessage)message
{
  return self->_message;
}

- (void)_updateAttachmentCountForAttachmentURL:(id)a3
{
  id v4 = [(MFMessageComposeViewController *)self _MIMETypeForURL:a3];
  if (-[MFMessageComposeViewController _isAudioMIMEType:](self, "_isAudioMIMEType:")) {
    ++self->_currentAttachedAudioCount;
  }
  if ([(MFMessageComposeViewController *)self _isVideoMIMEType:v4]) {
    ++self->_currentAttachedVideoCount;
  }
  if ([(MFMessageComposeViewController *)self _isImageMIMEType:v4]) {
    ++self->_currentAttachedImageCount;
  }
}

- (void)disableUserAttachments
{
  id v2 = [(MFMessageComposeViewController *)self topViewController];
  [v2 disableCameraAttachments];
}

- (void)dealloc
{
  id v3 = [(MFMessageComposeViewController *)self topViewController];
  [v3 removeFromParentViewController];
  [v3 setDelegate:0];
  [(MFMessageComposeViewController *)self setMessageComposeDelegate:0];
  [(MFMessageComposeViewController *)self setBody:0];
  [(MFMessageComposeViewController *)self setRecipients:0];

  v4.receiver = self;
  v4.super_class = (Class)MFMessageComposeViewController;
  [(MFMessageComposeViewController *)&v4 dealloc];
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MFMessageComposeViewController;
  [(MFMessageComposeViewController *)&v3 setModalPresentationStyle:[(MFMessageComposeViewController *)self preferredPresentationStyle]];
}

- (void)setPreferredPresentationStyle:(int64_t)a3
{
  self->_preferredPresentationStyle = a3;
  -[MFMessageComposeViewController setModalPresentationStyle:](self, "setModalPresentationStyle:");
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)MFMessageComposeViewController;
  [(MFMessageComposeViewController *)&v5 viewDidLoad];
  objc_super v3 = [(MFMessageComposeViewController *)self view];
  objc_super v4 = [MEMORY[0x1E4FB1618] whiteColor];
  [v3 setBackgroundColor:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(MFMessageComposeViewController *)self topViewController];
  [v5 setServiceId:self->_serviceId];
  [v5 setSuggestions:self->_suggestions];
  id v6 = [(UIViewController *)self mf_dataForUICustomization];
  [v5 setUICustomizationData:v6];

  [v5 setShareSheetSessionID:self->_shareSheetSessionID];
  if (self->_shareSheetSessionID || !self->_chatGUID)
  {
    char v7 = objc_opt_respondsToSelector();
    body = self->_body;
    subject = self->_subject;
    recipients = self->_recipients;
    if (v7) {
      [v5 setText:body subject:subject addresses:recipients shouldHideClearPluginButton:self->_shouldHideClearPluginButton];
    }
    else {
      [v5 setText:body subject:subject addresses:recipients];
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    [v5 setText:self->_body subject:self->_subject addresses:self->_recipients shouldHideClearPluginButton:self->_shouldHideClearPluginButton chatGUID:self->_chatGUID];
  }
  else
  {
    int v11 = +[MFMessageComposeViewController log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MFMessageComposeViewController viewWillAppear:]((uint64_t)&self->_chatGUID, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  [v5 setUTIs:self->_UTITypes];
  [v5 setPhotoIDs:self->_photoIDs];
  [v5 setCloudPhotoIDs:self->_cloudPhotoIDs];
  [v5 setContentURLs:self->_contentURLs];
  [v5 setContentText:self->_contentText];
  v18.receiver = self;
  v18.super_class = (Class)MFMessageComposeViewController;
  [(MFMessageComposeViewController *)&v18 viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFMessageComposeViewController;
  [(MFMessageComposeViewController *)&v5 viewDidAppear:a3];
  BOOL v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  int v4 = [v3 isPPTAvailable];

  if (v4) {
    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_212);
  }
}

void __48__MFMessageComposeViewController_viewDidAppear___block_invoke()
{
  id v0 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v0 postNotificationName:@"MFMessageShareComposeViewDidShow" object:0 userInfo:0 deliverImmediately:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFMessageComposeViewController;
  [(MFMessageComposeViewController *)&v5 viewWillDisappear:a3];
  if ([(MFMessageComposeViewController *)self isBeingDismissed])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__MFMessageComposeViewController_viewWillDisappear___block_invoke;
    block[3] = &unk_1E5F79088;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __52__MFMessageComposeViewController_viewWillDisappear___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MFMessageComposeViewControllerIsBeingDismissed" object:*(void *)(a1 + 32)];
}

- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers
{
  return 1;
}

- (void)smsComposeControllerCancelled:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageComposeDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained messageComposeViewController:self didFinishWithResult:0];
  }
}

- (void)smsComposeControllerSendStarted:(id)a3 withText:(id)a4 messageGUID:(id)a5
{
  id v10 = a3;
  id v7 = a5;
  id v8 = [(MFMessageComposeViewController *)self _deviceValidationSendCompletion];

  if (v8)
  {
    if (v7)
    {
      uint64_t v9 = [(MFMessageComposeViewController *)self _deviceValidationSendCompletion];
      +[_MFMessageObserver observeMessageGUID:v7 completion:v9];
    }
    else
    {
      NSLog(&cfstr_LikelyAttempte.isa);
    }
    [(MFMessageComposeViewController *)self set_deviceValidationSendCompletion:0];
  }
  [(MFMessageComposeViewController *)self smsComposeControllerSendStarted:v10];
}

- (void)smsComposeControllerSendStarted:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageComposeDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained messageComposeViewController:self didFinishWithResult:1];
  }
}

- (void)smsComposeControllerEntryViewContentInserted:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageComposeDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained messageComposeViewControllerDidShowEntryViewContent:self];
  }
}

- (void)smsComposeControllerShouldSendMessageWithText:(id)a3 toRecipients:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, uint64_t))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageComposeDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained messageComposeViewController:self shouldSendMessage:v11 toRecipients:v8 completion:v9];
  }
  else {
    v9[2](v9, 1);
  }
}

+ (BOOL)isMMSEnabled
{
  return MEMORY[0x1F4123900](a1, a2);
}

+ (BOOL)isiMessageEnabled
{
  [a1 _setupAccountMonitor];
  id v2 = [MEMORY[0x1E4F61730] sharedInstance];
  uint64_t v3 = [v2 availabilityForListenerID:sMFListenerName forService:1];

  return v3 == 1;
}

- (void)_setCanEditRecipients:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MFMessageComposeViewController *)self topViewController];
  [v4 setCanEditRecipients:v3];
}

- (void)_setShouldDisableEntryField:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(MFMessageComposeViewController *)self topViewController];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = [(MFMessageComposeViewController *)self topViewController];
    [v7 setShouldDisableEntryField:v3];
  }
}

- (void)_setNavBarTitle:(id)a3
{
  id v7 = a3;
  id v4 = [(MFMessageComposeViewController *)self topViewController];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(MFMessageComposeViewController *)self topViewController];
    [v6 setNavBarTitle:v7];
  }
}

- (void)_setShouldIgnoreEmailsWhenSending:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(MFMessageComposeViewController *)self topViewController];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = [(MFMessageComposeViewController *)self topViewController];
    [v7 setShouldIgnoreEmailsWhenSending:v3];
  }
}

- (BOOL)insertCollaborationItemProvider:(NSItemProvider *)itemProvider
{
  id v4 = itemProvider;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__MFMessageComposeViewController_insertCollaborationItemProvider___block_invoke;
  v9[3] = &unk_1E5F7CC68;
  id v10 = v4;
  id v11 = &v12;
  v9[4] = self;
  char v5 = v4;
  id v6 = [(NSItemProvider *)v5 loadDataRepresentationForTypeIdentifier:@"com.apple.SharedWithYou.SWCollaborationMetadata" completionHandler:v9];
  char v7 = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __66__MFMessageComposeViewController_insertCollaborationItemProvider___block_invoke(void *a1, void *a2)
{
  id v7 = a2;
  BOOL v3 = [(objc_class *)get_SWCollaborationMetadataClass() objectWithItemProviderData:v7 typeIdentifier:@"com.apple.SharedWithYou.SWCollaborationMetadata" error:0];
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  id v6 = [v3 defaultShareOptions];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v4 insertCollaborationItemProvider:v5 collaborationShareOptions:v6 collaborationMetadata:v3 isCollaboration:1];
}

- (void)setUPIVerificationCodeSendCompletion:(id)a3
{
  id v5 = a3;
  if (MGGetBoolAnswer())
  {
    id v4 = [(MFMessageComposeViewController *)self topViewController];
    if (objc_opt_respondsToSelector())
    {
      [v4 configureForDeviceValidation];
      [(MFMessageComposeViewController *)self set_deviceValidationSendCompletion:v5];
    }
  }
  else
  {
    NSLog(&cfstr_SCannotBeUsedO.isa, "-[MFMessageComposeViewController setUPIVerificationCodeSendCompletion:]");
  }
}

- (id)messageComposeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageComposeDelegate);

  return WeakRetained;
}

- (void)setMessageComposeDelegate:(id)messageComposeDelegate
{
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(NSArray *)recipients
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(NSString *)body
{
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(NSString *)subject
{
}

- (unint64_t)currentAttachedVideoCount
{
  return self->_currentAttachedVideoCount;
}

- (void)setCurrentAttachedVideoCount:(unint64_t)a3
{
  self->_currentAttachedVideoCount = a3;
}

- (unint64_t)currentAttachedAudioCount
{
  return self->_currentAttachedAudioCount;
}

- (void)setCurrentAttachedAudioCount:(unint64_t)a3
{
  self->_currentAttachedAudioCount = a3;
}

- (unint64_t)currentAttachedImageCount
{
  return self->_currentAttachedImageCount;
}

- (void)setCurrentAttachedImageCount:(unint64_t)a3
{
  self->_currentAttachedImageCount = a3;
}

- (id)UTITypes
{
  return self->_UTITypes;
}

- (void)setUTITypes:(id)a3
{
}

- (id)photoIDs
{
  return self->_photoIDs;
}

- (void)setPhotoIDs:(id)a3
{
}

- (id)cloudPhotoIDs
{
  return self->_cloudPhotoIDs;
}

- (void)setCloudPhotoIDs:(id)a3
{
}

- (id)contentText
{
  return self->_contentText;
}

- (void)setContentText:(id)a3
{
}

- (id)contentURLs
{
  return self->_contentURLs;
}

- (void)setContentURLs:(id)a3
{
}

- (NSString)chatGUID
{
  return self->_chatGUID;
}

- (void)setChatGUID:(id)a3
{
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
}

- (id)shareSheetSessionID
{
  return self->_shareSheetSessionID;
}

- (void)setShareSheetSessionID:(id)a3
{
}

- (NSString)serviceId
{
  return self->_serviceId;
}

- (void)setServiceId:(id)a3
{
}

- (NSString)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (id)_deviceValidationSendCompletion
{
  return self->__deviceValidationSendCompletion;
}

- (void)set_deviceValidationSendCompletion:(id)a3
{
}

- (BOOL)shouldHideClearPluginButton
{
  return self->_shouldHideClearPluginButton;
}

- (void)setShouldHideClearPluginButton:(BOOL)a3
{
  self->_shouldHideClearPluginButton = a3;
}

- (int64_t)preferredPresentationStyle
{
  return self->_preferredPresentationStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__deviceValidationSendCompletion, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_serviceId, 0);
  objc_storeStrong((id *)&self->_shareSheetSessionID, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_chatGUID, 0);
  objc_storeStrong((id *)&self->_contentURLs, 0);
  objc_storeStrong((id *)&self->_contentText, 0);
  objc_storeStrong((id *)&self->_cloudPhotoIDs, 0);
  objc_storeStrong((id *)&self->_photoIDs, 0);
  objc_storeStrong((id *)&self->_UTITypes, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_destroyWeak((id *)&self->_messageComposeDelegate);

  objc_storeStrong(&self->_internal, 0);
}

- (void)initWithNibName:(os_log_t)log bundle:.cold.1(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1AF945000, log, OS_LOG_TYPE_ERROR, "Unable to initialize due to + [%{public}@ canSendText] returns NO.", buf, 0xCu);
}

void __111__MFMessageComposeViewController__loadSWCopyRepresentationForItemProvider_forTypeIdentifier_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __111__MFMessageComposeViewController__loadSWCopyRepresentationForItemProvider_forTypeIdentifier_completionHandler___block_invoke_162_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_4();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1AF945000, v1, OS_LOG_TYPE_ERROR, "Failed to coordinate read for copy representation URL for file at URL %@ with error: %@", v2, 0x16u);
}

void __111__MFMessageComposeViewController__loadSWCopyRepresentationForItemProvider_forTypeIdentifier_completionHandler___block_invoke_162_cold_2()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_4();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1AF945000, v1, OS_LOG_TYPE_ERROR, "Failed to copy file %@ to temporary directory with error %@", v2, 0x16u);
}

void __111__MFMessageComposeViewController__loadSWCopyRepresentationForItemProvider_forTypeIdentifier_completionHandler___block_invoke_162_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)insertCollaborationItemProvider:(os_log_t)log collaborationShareOptions:collaborationMetadata:isCollaboration:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1AF945000, log, OS_LOG_TYPE_ERROR, "Received nil itemProvider", v1, 2u);
}

void __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_189_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  id v5 = a1;
  _os_log_error_impl(&dword_1AF945000, a3, OS_LOG_TYPE_ERROR, "Failed to load object of class '%@' for CKShare using legacy CKSMSComposeController SPI.", (uint8_t *)a2, 0xCu);
}

- (void)insertGroupActivity:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1AF945000, log, OS_LOG_TYPE_ERROR, "Received nil groupActivity to insertGroupActivity", v1, 2u);
}

- (void)viewWillAppear:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end