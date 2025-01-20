@interface CKDetailsExpanseActivityCell
+ (BOOL)shouldHighlight;
+ (id)reuseIdentifier;
- (BOOL)isScreenShare;
- (CKDetailsExpanseActivityCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 conversation:(id)a5;
- (CNContact)contactSharingScreen;
- (LPLinkView)lpLinkView;
- (TUConversation)conversation;
- (UILabel)activityDescriptionLabel;
- (double)buttonInteritemSpacing;
- (double)insetPadding;
- (double)interitemSpacing;
- (void)addConstraints;
- (void)formatTitle;
- (void)layoutSubviews;
- (void)setActivityDescriptionLabel:(id)a3;
- (void)setContactSharingScreen:(id)a3;
- (void)setConversation:(id)a3;
- (void)setIsScreenShare:(BOOL)a3;
- (void)setLpLinkView:(id)a3;
- (void)setupView;
@end

@implementation CKDetailsExpanseActivityCell

- (CKDetailsExpanseActivityCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 conversation:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)CKDetailsExpanseActivityCell;
  v9 = [(CKDetailsCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];
  v10 = v9;
  if (v9)
  {
    [(CKDetailsExpanseActivityCell *)v9 setConversation:v8];
    [(CKDetailsExpanseActivityCell *)v10 setupView];
  }

  return v10;
}

- (void)setupView
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F30A78]);
  v4 = (void *)MEMORY[0x1E4F6BCC0];
  v5 = [(CKDetailsExpanseActivityCell *)self conversation];
  v6 = [v4 activitySessionForTUConversation:v5];

  v7 = (void *)MEMORY[0x1E4F6BCC0];
  id v8 = [(CKDetailsExpanseActivityCell *)self conversation];
  -[CKDetailsExpanseActivityCell setIsScreenShare:](self, "setIsScreenShare:", [v7 isScreenShareActivityForTUConversation:v8]);

  v9 = [(CKDetailsExpanseActivityCell *)self conversation];
  v10 = +[CKTUConversationViewUtilities activityTitleForTUConversation:v9];
  [v3 setTitle:v10];

  v11 = [(CKDetailsExpanseActivityCell *)self conversation];
  objc_super v12 = +[CKTUConversationViewUtilities activityTextForTUConversation:v11];
  [v3 setSummary:v12];

  id v13 = objc_alloc(MEMORY[0x1E4F30A38]);
  v14 = [(CKDetailsExpanseActivityCell *)self conversation];
  v15 = +[CKTUConversationViewUtilities activityImageForTUConversation:v14];
  v16 = (void *)[v13 initWithPlatformImage:v15];
  [v3 setImage:v16];

  v17 = [v3 image];

  if (!v17)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F30A38]);
    v19 = [(CKDetailsExpanseActivityCell *)self conversation];
    v20 = +[CKUIBehavior sharedBehaviors];
    [v20 detailsExpanseImageFallbackDimension];
    v21 = +[CKTUConversationViewUtilities activityIconForTUConversation:iconSize:](CKTUConversationViewUtilities, "activityIconForTUConversation:iconSize:", v19);
    v22 = (void *)[v18 initWithPlatformImage:v21];
    [v3 setImage:v22];
  }
  if (![(CKDetailsExpanseActivityCell *)self isScreenShare])
  {
    id v38 = objc_alloc_init(MEMORY[0x1E4F30AE0]);
    [v3 setSourceApplication:v38];

    v39 = [(CKDetailsExpanseActivityCell *)self conversation];
    v40 = +[CKTUConversationViewUtilities activityAppNameForTUConversation:v39];
    v41 = [v3 sourceApplication];
    [v41 setName:v40];

    v42 = [v3 title];

    if (!v42)
    {
      v43 = [v3 sourceApplication];
      v44 = [v43 name];
      [v3 setTitle:v44];
    }
    v45 = [(CKDetailsExpanseActivityCell *)self conversation];
    v46 = +[CKTUConversationViewUtilities activityBundleIdentifierForTUConversation:v45];
    v47 = [v3 sourceApplication];
    [v47 setBundleIdentifier:v46];

    id v48 = objc_alloc(MEMORY[0x1E4F30A38]);
    v25 = [(CKDetailsExpanseActivityCell *)self conversation];
    v29 = +[CKUIBehavior sharedBehaviors];
    [v29 tuConversationBalloonIconDimensions];
    v36 = +[CKTUConversationViewUtilities activityIconForTUConversation:iconSize:](CKTUConversationViewUtilities, "activityIconForTUConversation:iconSize:", v25);
    v37 = (void *)[v48 initWithPlatformImage:v36];
    v49 = [v3 sourceApplication];
    [v49 setIcon:v37];

    goto LABEL_13;
  }
  v23 = (void *)MEMORY[0x1E4F6BCC0];
  v24 = [(CKDetailsExpanseActivityCell *)self conversation];
  v25 = [v23 remoteParticipantHandleSharingScreenForTUConversation:v24];

  if (!v25)
  {
    v26 = [(CKDetailsExpanseActivityCell *)self conversation];
    v27 = [v26 localMember];
    v28 = [v27 handle];
    v25 = [v28 value];
  }
  v29 = +[CKEntity entityForAddress:v25];
  v30 = [v29 defaultIMHandle];
  v31 = [v30 cnContactWithKeys:MEMORY[0x1E4F1CBF0]];
  [(CKDetailsExpanseActivityCell *)self setContactSharingScreen:v31];

  v32 = [v3 title];

  if (!v32)
  {
    v33 = CKFrameworkBundle();
    v34 = [v33 localizedStringForKey:@"EXPANSE_SCREENSHARE_DEFAULT" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v3 setTitle:v34];
  }
  v35 = [v3 summary];

  if (!v35)
  {
    v36 = CKFrameworkBundle();
    v37 = [v36 localizedStringForKey:@"EXPANSE_SCREENSHARE_SCREEN" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v3 setSummary:v37];
LABEL_13:
  }
  v50 = (void *)[objc_alloc(MEMORY[0x1E4F30A98]) initWithMetadata:v3];
  [(CKDetailsExpanseActivityCell *)self setLpLinkView:v50];

  v51 = [(CKDetailsExpanseActivityCell *)self lpLinkView];
  [v51 _setApplyCornerRadius:0];

  v52 = [(CKDetailsExpanseActivityCell *)self lpLinkView];
  [(CKDetailsExpanseActivityCell *)self _cornerRadius];
  objc_msgSend(v52, "_setCornerRadius:");

  v53 = [(CKDetailsExpanseActivityCell *)self lpLinkView];
  v54 = [MEMORY[0x1E4F428B8] clearColor];
  [v53 _setOverrideBackgroundColor:v54];

  v55 = [(CKDetailsExpanseActivityCell *)self lpLinkView];
  if ([(CKDetailsExpanseActivityCell *)self isScreenShare])
  {
    [v55 _setPreferredSizeClass:11];
  }
  else
  {
    v56 = [v3 image];
    if (v56) {
      uint64_t v57 = 10;
    }
    else {
      uint64_t v57 = 11;
    }
    [v55 _setPreferredSizeClass:v57];
  }
  v58 = [(CKDetailsExpanseActivityCell *)self lpLinkView];
  [v58 setTranslatesAutoresizingMaskIntoConstraints:0];

  v59 = [(CKDetailsExpanseActivityCell *)self contactSharingScreen];

  if (v59)
  {
    v60 = [(CKDetailsExpanseActivityCell *)self lpLinkView];
    v61 = [(CKDetailsExpanseActivityCell *)self contactSharingScreen];
    v72[0] = v61;
    v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:1];
    [v60 _setContactsForAttribution:v62];
  }
  v63 = [(CKDetailsExpanseActivityCell *)self lpLinkView];
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __41__CKDetailsExpanseActivityCell_setupView__block_invoke;
  v70[3] = &unk_1E5620C40;
  id v71 = v6;
  id v64 = v6;
  v65 = CKFrameworkBundle();
  v66 = [v65 localizedStringForKey:@"VIEW_BUTTON_TEXT" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v63 _setAction:v70 withText:v66 buttonType:1];

  v67 = [(CKDetailsExpanseActivityCell *)self contentView];
  v68 = [(CKDetailsExpanseActivityCell *)self lpLinkView];
  [v67 addSubview:v68];

  v69 = [(CKDetailsExpanseActivityCell *)self contentView];
  [v69 setBackgroundColor:0];

  [(CKDetailsExpanseActivityCell *)self addConstraints];
}

void __41__CKDetailsExpanseActivityCell_setupView__block_invoke(uint64_t a1)
{
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  v2 = [MEMORY[0x1E4FADA90] sharedInstance];
  id v3 = [v2 conversationManager];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v6 = [MEMORY[0x1E4FADA90] sharedInstance];
    v5 = [v6 conversationManager];
    [v5 launchApplicationForActivitySession:*(void *)(a1 + 32) completionHandler:&__block_literal_global_145];
  }
}

- (void)formatTitle
{
  id v3 = [(CKDetailsExpanseActivityCell *)self activityDescriptionLabel];
  char v4 = +[CKUIBehavior sharedBehaviors];
  v5 = [v4 headerFont];
  [v3 setFont:v5];

  id v6 = [(CKDetailsExpanseActivityCell *)self activityDescriptionLabel];
  v7 = +[CKUIBehavior sharedBehaviors];
  id v8 = [v7 theme];
  v9 = [v8 secondaryLabelColor];
  [v6 setTextColor:v9];

  v10 = [(CKDetailsExpanseActivityCell *)self activityDescriptionLabel];
  [v10 setNumberOfLines:1];

  v11 = [(CKDetailsExpanseActivityCell *)self activityDescriptionLabel];
  [v11 setLineBreakMode:4];

  id v12 = [(CKDetailsExpanseActivityCell *)self activityDescriptionLabel];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)addConstraints
{
  v57[4] = *MEMORY[0x1E4F143B8];
  v55 = [MEMORY[0x1E4F1CA48] array];
  if (CKIsRunningInMacCatalyst())
  {
    id v3 = [(CKDetailsExpanseActivityCell *)self contactSharingScreen];
    char v4 = +[CKUIBehavior sharedBehaviors];
    v5 = v4;
    if (v3) {
      [v4 detailsExpanseScreenShareIconVerticalInsetPadding];
    }
    else {
      [v4 detailsExpanseActivityImageInsetPadding];
    }
    double v7 = v6;

    v53 = [(CKDetailsExpanseActivityCell *)self activityDescriptionLabel];
    v49 = [v53 leadingAnchor];
    v51 = [(CKDetailsExpanseActivityCell *)self contentView];
    v47 = [v51 layoutMarginsGuide];
    v45 = [v47 leadingAnchor];
    v43 = [v49 constraintEqualToAnchor:v45];
    v57[0] = v43;
    v41 = [(CKDetailsExpanseActivityCell *)self activityDescriptionLabel];
    v37 = [v41 trailingAnchor];
    v39 = [(CKDetailsExpanseActivityCell *)self contentView];
    v35 = [v39 trailingAnchor];
    v33 = [v37 constraintEqualToAnchor:v35];
    v57[1] = v33;
    v31 = [(CKDetailsExpanseActivityCell *)self activityDescriptionLabel];
    v28 = [v31 topAnchor];
    v29 = [(CKDetailsExpanseActivityCell *)self contentView];
    id v8 = [v29 topAnchor];
    v9 = [v28 constraintEqualToAnchor:v8 constant:v7];
    v57[2] = v9;
    v10 = [(CKDetailsExpanseActivityCell *)self activityDescriptionLabel];
    v11 = [v10 heightAnchor];
    id v12 = [(CKDetailsExpanseActivityCell *)self activityDescriptionLabel];
    id v13 = [v12 font];
    [v13 pointSize];
    v14 = objc_msgSend(v11, "constraintEqualToConstant:");
    v57[3] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:4];
    [v55 addObjectsFromArray:v15];
  }
  v54 = [(CKDetailsExpanseActivityCell *)self lpLinkView];
  v16 = [v54 leadingAnchor];
  v50 = [(CKDetailsExpanseActivityCell *)self contentView];
  [v50 leadingAnchor];
  id v48 = v52 = v16;
  v46 = objc_msgSend(v16, "constraintEqualToAnchor:");
  v56[0] = v46;
  v44 = [(CKDetailsExpanseActivityCell *)self lpLinkView];
  v17 = [v44 trailingAnchor];
  v40 = [(CKDetailsExpanseActivityCell *)self contentView];
  [v40 trailingAnchor];
  id v38 = v42 = v17;
  v36 = objc_msgSend(v17, "constraintEqualToAnchor:");
  v56[1] = v36;
  v34 = [(CKDetailsExpanseActivityCell *)self lpLinkView];
  id v18 = [v34 topAnchor];
  v32 = [(CKDetailsExpanseActivityCell *)self activityDescriptionLabel];
  if (v32)
  {
    v19 = [(CKDetailsExpanseActivityCell *)self activityDescriptionLabel];
    [v19 bottomAnchor];
  }
  else
  {
    v19 = [(CKDetailsExpanseActivityCell *)self contentView];
    [v19 topAnchor];
  v20 = };
  v21 = [v18 constraintEqualToAnchor:v20];
  v56[2] = v21;
  v22 = [(CKDetailsExpanseActivityCell *)self lpLinkView];
  [v22 bottomAnchor];
  v23 = v30 = v18;
  v24 = [(CKDetailsExpanseActivityCell *)self contentView];
  v25 = [v24 bottomAnchor];
  v26 = [v23 constraintEqualToAnchor:v25];
  v56[3] = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:4];
  [v55 addObjectsFromArray:v27];

  [MEMORY[0x1E4F28DC8] activateConstraints:v55];
}

+ (id)reuseIdentifier
{
  return @"ExpanseActivityCell_reuseIdentifier";
}

+ (BOOL)shouldHighlight
{
  return 0;
}

- (double)insetPadding
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 tuConversationInsetPadding];
  double v4 = v3;

  return v4;
}

- (double)buttonInteritemSpacing
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 tuConversationButtonInteritemSpacing];
  double v4 = v3;

  return v4;
}

- (double)interitemSpacing
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 tuConversationInteritemSpacing];
  double v4 = v3;

  return v4;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CKDetailsExpanseActivityCell;
  [(CKDetailsCell *)&v5 layoutSubviews];
  double v3 = [(CKDetailsCell *)self topSeperator];
  [v3 setHidden:1];

  double v4 = [(CKDetailsCell *)self bottomSeperator];
  [v4 setHidden:1];
}

- (TUConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (LPLinkView)lpLinkView
{
  return self->_lpLinkView;
}

- (void)setLpLinkView:(id)a3
{
}

- (BOOL)isScreenShare
{
  return self->_isScreenShare;
}

- (void)setIsScreenShare:(BOOL)a3
{
  self->_isScreenShare = a3;
}

- (UILabel)activityDescriptionLabel
{
  return self->_activityDescriptionLabel;
}

- (void)setActivityDescriptionLabel:(id)a3
{
}

- (CNContact)contactSharingScreen
{
  return self->_contactSharingScreen;
}

- (void)setContactSharingScreen:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactSharingScreen, 0);
  objc_storeStrong((id *)&self->_activityDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_lpLinkView, 0);

  objc_storeStrong((id *)&self->_conversation, 0);
}

@end