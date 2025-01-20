@interface CKStewieSharingSummaryChatItem
- (id)_transcriptText;
- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7;
- (id)loadTranscriptText;
- (unint64_t)layoutType;
@end

@implementation CKStewieSharingSummaryChatItem

- (unint64_t)layoutType
{
  return 19;
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (a4 < 1)
  {
    v14 = 0;
  }
  else
  {
    v14 = [v12 objectAtIndex:a4 - 1];
  }
  uint64_t v15 = [v14 layoutType];
  v16 = +[CKUIBehavior sharedBehaviors];
  v17 = v16;
  if (v15 == 19) {
    [v16 mediumTranscriptSpace];
  }
  else {
    [v16 largeTranscriptSpace];
  }
  double v19 = v18;

  v20 = +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:self previousChatItem:v14 topSpacing:v19 bottomSpacing:v19];

  return v20;
}

- (id)loadTranscriptText
{
  uint64_t v2 = [(CKStewieSharingSummaryChatItem *)self _transcriptText];
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

    v10 = NSString;
    id v11 = CKFrameworkBundle();
    id v12 = [v11 localizedStringForKey:@"TS_DESCRIPTION_SUMMARY_TEXT" value:&stru_1EDE4CA38 table:@"TranscriptSharing-SYDROB_FEATURES"];
    objc_msgSend(v10, "localizedStringWithFormat:", v12, v9, v9);
    id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = &stru_1EDE4CA38;
  }

  return v13;
}

@end