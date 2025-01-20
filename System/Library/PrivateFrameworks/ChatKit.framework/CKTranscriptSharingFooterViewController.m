@interface CKTranscriptSharingFooterViewController
- (CKChatController)chatController;
- (CKTranscriptSharingFooterViewController)initWithChatController:(id)a3;
- (void)loadView;
@end

@implementation CKTranscriptSharingFooterViewController

- (CKTranscriptSharingFooterViewController)initWithChatController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKTranscriptSharingFooterViewController;
  v6 = [(CKTranscriptSharingFooterViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_chatController, a3);
  }

  return v7;
}

- (void)loadView
{
  v59[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isTranscriptSharingEnabled];

  if (v4)
  {
    v56.receiver = self;
    v56.super_class = (Class)CKTranscriptSharingFooterViewController;
    [(CKTranscriptSharingFooterViewController *)&v56 loadView];
    id v5 = [(CKCoreChatController *)self->_chatController conversation];
    v6 = [v5 chat];
    v55 = [v6 emergencyUserHandle];

    v7 = [(CKCoreChatController *)self->_chatController conversation];
    v8 = [v7 chat];
    v54 = [v55 displayNameForChat:v8];

    objc_super v9 = NSString;
    v10 = CKFrameworkBundle();
    v11 = [v10 localizedStringForKey:@"TS_DESCRIPTION_INPUT_DISABLED_DESCRIPTION" value:&stru_1EDE4CA38 table:@"TranscriptSharing-SYDROB_FEATURES"];
    v53 = objc_msgSend(v9, "localizedStringWithFormat:", v11, v54);

    v50 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v53];
    id v12 = objc_alloc(MEMORY[0x1E4F28E48]);
    v13 = CKFrameworkBundle();
    v14 = [v13 localizedStringForKey:@"TS_DESCRIPTION_INPUT_DISABLED_TITLE" value:&stru_1EDE4CA38 table:@"TranscriptSharing-SYDROB_FEATURES"];
    uint64_t v57 = *MEMORY[0x1E4FB06F8];
    uint64_t v15 = v57;
    v16 = +[CKUIBehavior sharedBehaviors];
    v17 = [v16 transcriptFooterNoteTitleFont];
    v59[0] = v17;
    uint64_t v58 = *MEMORY[0x1E4FB0700];
    uint64_t v18 = v58;
    v19 = [MEMORY[0x1E4F428B8] labelColor];
    v59[1] = v19;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:&v57 count:2];
    v20 = v51 = self;
    v52 = (void *)[v12 initWithString:v14 attributes:v20];

    v21 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    objc_msgSend(v50, "addAttribute:value:range:", v18, v21, 0, objc_msgSend(v50, "length"));
    v22 = +[CKUIBehavior sharedBehaviors];
    v23 = [v22 transcriptFooterNoteBodyFont];
    objc_msgSend(v50, "addAttribute:value:range:", v15, v23, 0, objc_msgSend(v50, "length"));

    id v24 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    [v24 appendAttributedString:v52];
    id v25 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    [v25 appendAttributedString:v50];
    v26 = [(CKChatController *)v51->_chatController view];
    [v26 bounds];
    double v28 = v27;
    double v30 = v29;

    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42F58]), "initWithFrame:", 0.0, 0.0, v28, v30);
    [v31 setScrollEnabled:0];
    [v31 setEditable:0];
    [v31 setUserInteractionEnabled:1];
    v32 = [v31 textDragInteraction];
    [v32 setEnabled:0];

    [v31 setAttributedText:v24];
    [v31 setBackgroundColor:0];
    objc_msgSend(v31, "setTextContainerInset:", 16.0, 20.0, 0.0, 20.0);
    [v31 sizeToFit];
    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42F58]), "initWithFrame:", 0.0, 0.0, v28, v30);
    [v33 setScrollEnabled:0];
    [v33 setEditable:0];
    [v33 setUserInteractionEnabled:1];
    v34 = [v33 textDragInteraction];
    [v34 setEnabled:0];

    [v33 setAttributedText:v25];
    [v33 setBackgroundColor:0];
    [v31 frame];
    objc_msgSend(v33, "setTextContainerInset:", v35, 20.0, 0.0, 20.0);
    [v33 sizeToFit];
    [v33 setSelectable:0];
    [v33 _setInteractiveTextSelectionDisabled:1];
    id v36 = objc_alloc(MEMORY[0x1E4F42F60]);
    v37 = objc_msgSend(v36, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v38 = +[CKUIBehavior sharedBehaviors];
    objc_msgSend(v37, "setTranslucent:", objc_msgSend(v38, "shouldUseTranslucentBars"));

    v39 = +[CKUIBehavior sharedBehaviors];
    v40 = [v39 theme];
    objc_msgSend(v37, "setBarStyle:", objc_msgSend(v40, "defaultBarStyle"));

    [v37 setAutoresizingMask:10];
    [v37 sizeToFit];
    [v37 addSubview:v31];
    [v37 addSubview:v33];
    [v37 frame];
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;
    [v31 frame];
    double v48 = v47;
    [v33 frame];
    objc_msgSend(v37, "setFrame:", v42, v44, v46, v48 + v49);
    [(CKTranscriptSharingFooterViewController *)v51 setView:v37];
  }
}

- (CKChatController)chatController
{
  return self->_chatController;
}

- (void).cxx_destruct
{
}

@end