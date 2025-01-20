@interface CKTUConversationViewUtilities
+ (BOOL)activityHasImageForTUConversation:(id)a3;
+ (CGSize)faceTimeIconSize;
+ (id)activityAppNameForTUConversation:(id)a3;
+ (id)activityBundleIdentifierForTUConversation:(id)a3;
+ (id)activityDescriptionStringForTUConversation:(id)a3;
+ (id)activityIconForTUConversation:(id)a3 iconSize:(double)a4;
+ (id)activityImageForTUConversation:(id)a3;
+ (id)activityTextForTUConversation:(id)a3;
+ (id)activityTitleForTUConversation:(id)a3;
+ (id)faceTimeIconForTUConversation:(id)a3;
+ (id)joinStateStatusStringForTUConversation:(id)a3;
+ (id)sharePlayIcon;
+ (id)titleForAVMode:(unint64_t)a3;
+ (unint64_t)ckTUConversationStateForTUConversation:(id)a3;
+ (void)formatLPImageForScreenShare:(id)a3 conversation:(id)a4;
@end

@implementation CKTUConversationViewUtilities

+ (id)faceTimeIconForTUConversation:(id)a3
{
  v3 = @"video.fill";
  if (a3 && !objc_msgSend(MEMORY[0x1E4F6BCC0], "conversationIsVideoCall:")) {
    v3 = @"phone.fill";
  }
  v4 = (void *)MEMORY[0x1E4F42A80];
  v5 = v3;
  v6 = +[CKUIBehavior sharedBehaviors];
  v7 = [v6 tuConversationBalloonIconConfiguration];
  v8 = [v4 systemImageNamed:v5 withConfiguration:v7];

  return v8;
}

+ (id)sharePlayIcon
{
  v2 = (void *)MEMORY[0x1E4F42A80];
  v3 = [MEMORY[0x1E4F42A98] configurationWithScale:3];
  v4 = [v2 systemImageNamed:@"shareplay" withConfiguration:v3];

  return v4;
}

+ (id)activityBundleIdentifierForTUConversation:(id)a3
{
  v3 = [MEMORY[0x1E4F6BCC0] activitySessionForTUConversation:a3];
  v4 = [v3 activity];
  v5 = [v4 bundleIdentifier];

  return v5;
}

+ (id)activityIconForTUConversation:(id)a3 iconSize:(double)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F42D90];
  id v6 = a3;
  v7 = [v5 mainScreen];
  [v7 scale];
  double v9 = v8;

  v10 = +[CKTUConversationViewUtilities activityBundleIdentifierForTUConversation:v6];

  v11 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v10 allowPlaceholder:1 error:0];
  if (v11)
  {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithBundleIdentifier:v10];
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", a4, a4, v9);
    v18[0] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [v12 prepareImagesForImageDescriptors:v14];

    v15 = [v12 imageForImageDescriptor:v13];
    v16 = objc_msgSend(MEMORY[0x1E4F42A80], "imageWithCGImage:scale:orientation:", objc_msgSend(v15, "CGImage"), 0, v9);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)activityImageForTUConversation:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4F6BCC0] isScreenShareActivityForTUConversation:v3])
  {
    v4 = [MEMORY[0x1E4F42A80] systemImageNamed:@"rectangle.inset.filled.and.person.filled"];
    v5 = [MEMORY[0x1E4F42A98] configurationWithScale:3];
    id v6 = [v4 imageWithConfiguration:v5];
    v7 = (void *)MEMORY[0x1E4F42A98];
    double v8 = [MEMORY[0x1E4F428B8] whiteColor];
    double v9 = [v7 configurationWithHierarchicalColor:v8];
    v10 = [v6 imageByApplyingSymbolConfiguration:v9];

LABEL_5:
    goto LABEL_7;
  }
  v4 = [MEMORY[0x1E4F6BCC0] activityMetadataForTUConversation:v3];
  if (objc_opt_respondsToSelector())
  {
    v11 = (void *)MEMORY[0x1E4F42A80];
    v5 = [v4 imageData];
    v10 = [v11 imageWithData:v5];
    goto LABEL_5;
  }
  v10 = 0;
LABEL_7:

  return v10;
}

+ (BOOL)activityHasImageForTUConversation:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4F6BCC0] activeTUConversationHasActivitySession:v3])
  {
    if ([MEMORY[0x1E4F6BCC0] isScreenShareActivityForTUConversation:v3])
    {
      BOOL v4 = 1;
    }
    else
    {
      v5 = [MEMORY[0x1E4F6BCC0] activityMetadataForTUConversation:v3];
      if (objc_opt_respondsToSelector())
      {
        id v6 = [v5 imageData];
        BOOL v4 = v6 != 0;
      }
      else
      {
        BOOL v4 = 0;
      }
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

+ (CGSize)faceTimeIconSize
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 tuConversationBalloonFaceTimeIconDimensions];
  double v4 = v3;

  double v5 = v4;
  double v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

+ (id)titleForAVMode:(unint64_t)a3
{
  double v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v5 = [v4 isAVLessSharePlayEnabled];

  if (v5)
  {
    double v6 = CKFrameworkBundle();
    v7 = v6;
    if (a3) {
      double v8 = @"FACE_TIME_DEFAULT";
    }
    else {
      double v8 = @"EXPANSE_DEFAULT";
    }
  }
  else
  {
    double v6 = CKFrameworkBundle();
    v7 = v6;
    double v8 = @"FACE_TIME_DEFAULT";
  }
  double v9 = [v6 localizedStringForKey:v8 value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v9;
}

+ (id)activityTitleForTUConversation:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4F6BCC0] activeTUConversationHasActivitySession:v3])
  {
    if ([MEMORY[0x1E4F6BCC0] isScreenShareActivityForTUConversation:v3])
    {
      double v4 = [MEMORY[0x1E4F6BCC0] remoteParticipantHandleSharingScreenForTUConversation:v3];
      if (v4)
      {
        int v5 = +[CKEntity entityForAddress:v4];
        [v5 fullName];
      }
      else
      {
        int v5 = CKFrameworkBundle();
        [v5 localizedStringForKey:@"EXPANSE_LOCAL_SCREENSHARE" value:&stru_1EDE4CA38 table:@"ChatKit"];
      uint64_t v6 = };
      goto LABEL_12;
    }
    double v4 = [MEMORY[0x1E4F6BCC0] activityMetadataForTUConversation:v3];
    int v5 = +[CKTUConversationViewUtilities activityAppNameForTUConversation:v3];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v6 = [v4 title];
LABEL_12:
      v7 = (void *)v6;

      int v5 = v7;
    }
  }
  else
  {
    if (v3)
    {
      int v5 = +[CKTUConversationViewUtilities titleForAVMode:](CKTUConversationViewUtilities, "titleForAVMode:", [v3 avMode]);
      goto LABEL_14;
    }
    double v4 = CKFrameworkBundle();
    int v5 = [v4 localizedStringForKey:@"FACE_TIME_DEFAULT" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }

LABEL_14:

  return v5;
}

+ (id)activityTextForTUConversation:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4F6BCC0] isScreenShareActivityForTUConversation:v3])
  {
    double v4 = 0;
  }
  else
  {
    int v5 = [MEMORY[0x1E4F6BCC0] activityMetadataForTUConversation:v3];
    if (objc_opt_respondsToSelector())
    {
      double v4 = [v5 subTitle];
    }
    else
    {
      double v4 = 0;
    }
  }

  return v4;
}

+ (id)activityAppNameForTUConversation:(id)a3
{
  id v3 = [MEMORY[0x1E4F6BCC0] activitySessionForTUConversation:a3];
  double v4 = [v3 activity];
  int v5 = [v4 localizedApplicationName];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [v4 fallbackApplicationName];
  }
  double v8 = v7;

  return v8;
}

+ (void)formatLPImageForScreenShare:(id)a3 conversation:(id)a4
{
  double v4 = (void *)MEMORY[0x1E4F428B8];
  id v5 = a3;
  id v7 = [v4 systemWhiteColor];
  uint64_t v6 = [v5 properties];

  [v6 setOverlaidTextColor:v7];
}

+ (id)joinStateStatusStringForTUConversation:(id)a3
{
  id v3 = [a3 mergedActiveRemoteParticipants];
  uint64_t v4 = [v3 count];

  id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v6 = [v5 objectForKey:@"MultiwayOverrideActiveParticipants"];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v4 = [v7 integerForKey:@"MultiwayOverrideActiveParticipants"];
  }
  if (v4)
  {
    double v8 = NSString;
    double v9 = IMSharedUtilitiesFrameworkBundle();
    v10 = [v9 localizedStringForKey:@"%lu People Active" value:&stru_1EDE4CA38 table:@"IMSharedUtilities"];
    v11 = objc_msgSend(v8, "localizedStringWithFormat:", v10, v4);
  }
  else
  {
    double v9 = CKFrameworkBundle();
    v11 = [v9 localizedStringForKey:@"FACETIME_WAITING" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }

  return v11;
}

+ (unint64_t)ckTUConversationStateForTUConversation:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    if (IMOSLoggingEnabled())
    {
      double v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Setting state to CKTUConversationStateCallEnded for nil TUConversation", (uint8_t *)&v11, 2u);
      }
      goto LABEL_17;
    }
LABEL_18:
    unint64_t v8 = 0;
    goto LABEL_19;
  }
  int v4 = [MEMORY[0x1E4F6BCC0] activeTUConversationHasActivitySession:v3];
  unint64_t v5 = [v3 state];
  if (v5 > 4)
  {
    if (IMOSLoggingEnabled())
    {
      double v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        id v12 = v3;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "TUConversationState is TUConversationStateCallEnded. Setting state to CKTUConversationStateCallEnded for TUConversation %@", (uint8_t *)&v11, 0xCu);
      }
LABEL_17:

      goto LABEL_18;
    }
    goto LABEL_18;
  }
  uint64_t v6 = 3;
  if (!v4) {
    uint64_t v6 = 1;
  }
  uint64_t v7 = 2;
  if (v4) {
    uint64_t v7 = 4;
  }
  if (((1 << v5) & 0x13) != 0) {
    unint64_t v8 = v6;
  }
  else {
    unint64_t v8 = v7;
  }
LABEL_19:

  return v8;
}

+ (id)activityDescriptionStringForTUConversation:(id)a3
{
  id v3 = [MEMORY[0x1E4F6BCC0] activitySessionForTUConversation:a3];
  int v4 = [v3 activity];
  unint64_t v5 = [v4 metadata];
  uint64_t v6 = [v5 context];
  uint64_t v7 = [v6 identifier];

  if (([v7 isEqualToString:@"CPGroupActivityGenericContext"] & 1) == 0
    && ![v7 isEqualToString:@"CPGroupActivityWorkoutTogetherContext"])
  {
    if (([v7 isEqualToString:@"CPGroupActivityListenTogetherContext"] & 1) != 0
      || [v7 isEqualToString:@"CPGroupActivityWatchTogetherContext"])
    {
      unint64_t v8 = CKFrameworkBundle();
      double v9 = v8;
      v10 = @"EXPANSE_ACTIVITY_DESCRIPTION_PLAYING";
      goto LABEL_4;
    }
    if ([v7 isEqualToString:@"CPGroupActivityScreenSharingContext"])
    {
      double v9 = [v4 originator];
      v14 = CKFrameworkBundle();
      v15 = v14;
      if (v9) {
        v16 = @"EXPANSE_ACTIVITY_DESCRIPTIONE_VIEWING";
      }
      else {
        v16 = @"EXPANSE_ACTIVITY_DESCRIPTION_SHARING";
      }
      int v11 = [v14 localizedStringForKey:v16 value:&stru_1EDE4CA38 table:@"ChatKit"];

      goto LABEL_5;
    }
  }
  unint64_t v8 = CKFrameworkBundle();
  double v9 = v8;
  v10 = @"EXPANSE_ACTIVITY_DESCRIPTION_DEFAULT";
LABEL_4:
  int v11 = [v8 localizedStringForKey:v10 value:&stru_1EDE4CA38 table:@"ChatKit"];
LABEL_5:

  id v12 = [v11 uppercaseString];

  return v12;
}

@end