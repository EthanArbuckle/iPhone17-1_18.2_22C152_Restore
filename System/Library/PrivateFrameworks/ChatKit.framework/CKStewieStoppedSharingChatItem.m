@interface CKStewieStoppedSharingChatItem
- (id)_transcriptText;
- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7;
- (id)loadTranscriptText;
- (unint64_t)layoutType;
@end

@implementation CKStewieStoppedSharingChatItem

- (unint64_t)layoutType
{
  return 20;
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  if (a4 < 1)
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend(a5, "objectAtIndex:", a4 - 1, a7.width, a7.height);
  }
  v9 = +[CKUIBehavior sharedBehaviors];
  [v9 mediumTranscriptSpace];
  double v11 = v10;

  v12 = +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:self previousChatItem:v8 topSpacing:v11 bottomSpacing:0.0];

  return v12;
}

- (id)loadTranscriptText
{
  uint64_t v2 = [(CKStewieStoppedSharingChatItem *)self _transcriptText];
  v3 = (void *)v2;
  v4 = &stru_1EDE4CA38;
  if (v2) {
    v4 = (__CFString *)v2;
  }
  v5 = v4;

  v6 = +[CKUIBehavior sharedBehaviors];
  v7 = [v6 transcriptEmphasizedFontAttributes];

  v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:v7];

  return v8;
}

- (id)_transcriptText
{
  v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isTranscriptSharingEnabled];

  if (v4)
  {
    v5 = [(CKChatItem *)self IMChatItem];
    v6 = [(CKChatItem *)self IMChatItem];
    v7 = [v6 handle];
    v8 = [v5 chat];
    v9 = [v7 displayNameForChat:v8];

    double v10 = NSString;
    double v11 = CKFrameworkBundle();
    v12 = [v11 localizedStringForKey:@"TS_STOPPED_SHARING_NOTICE" value:&stru_1EDE4CA38 table:@"TranscriptSharing-SYDROB_FEATURES"];
    objc_msgSend(v10, "localizedStringWithFormat:", v12, v9);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = &stru_1EDE4CA38;
  }

  return v13;
}

@end