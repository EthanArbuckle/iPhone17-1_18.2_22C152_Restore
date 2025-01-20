@interface CKDetailsContactsTableViewCell
+ (Class)cellClass;
+ (double)estimatedHeight;
+ (double)marginWidth;
+ (double)preferredHeight;
+ (id)reuseIdentifier;
- (BOOL)showFaceTimeVideoButton;
- (BOOL)showInfoButton;
- (BOOL)showMessageButton;
- (BOOL)showPhoneButton;
- (BOOL)showScreenSharingButton;
- (BOOL)showsLocation;
- (BOOL)showsTUConversationStatus;
- (BOOL)tuConversationStatusIsActive;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKAvatarView)contactAvatarView;
- (CKDetailsContactsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CKDetailsContactsTableViewCellDelegate)delegate;
- (CKLabel)nameLabel;
- (CNContact)contact;
- (NSString)entityName;
- (NSString)locationString;
- (UIActivityIndicatorView)updatingParticipantSpinner;
- (UIButton)facetimeVideoButton;
- (UIButton)messageButton;
- (UIButton)phoneButton;
- (UIButton)screenSharingButton;
- (UILabel)expanseStatusLabel;
- (UILabel)locationLabel;
- (id)_ckSymbolImageNamed:(id)a3 preferredContentSizeCategory:(id)a4 preferredFontTextStyle:(id)a5;
- (id)_imageNamed:(id)a3;
- (int64_t)callType;
- (void)_configureButtonLayer:(id)a3;
- (void)_dismissUpdatingParticipantSpinner;
- (void)_formatExpanseStatusLabel;
- (void)_handleCommunicationAction:(id)a3;
- (void)_showUpdatingParticipantSpinner;
- (void)configureWithViewModel:(id)a3;
- (void)didHoverOverCell:(id)a3;
- (void)layoutSubviews;
- (void)setCallType:(int64_t)a3;
- (void)setContact:(id)a3;
- (void)setContactAvatarView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEntityName:(id)a3;
- (void)setExpanseStatusLabel:(id)a3;
- (void)setFacetimeVideoButton:(id)a3;
- (void)setLocationLabel:(id)a3;
- (void)setLocationString:(id)a3;
- (void)setMessageButton:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setPhoneButton:(id)a3;
- (void)setScreenSharingButton:(id)a3;
- (void)setShowFaceTimeVideoButton:(BOOL)a3;
- (void)setShowInfoButton:(BOOL)a3;
- (void)setShowMessageButton:(BOOL)a3;
- (void)setShowPhoneButton:(BOOL)a3;
- (void)setShowScreenSharingButton:(BOOL)a3;
- (void)setShowsLocation:(BOOL)a3;
- (void)setShowsTUConversationStatus:(BOOL)a3;
- (void)setTuConversationStatusIsActive:(BOOL)a3;
- (void)setUpdatingParticipantSpinner:(id)a3;
@end

@implementation CKDetailsContactsTableViewCell

+ (Class)cellClass
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 isAccessibilityPreferredContentSizeCategory];
  id v3 = (id)objc_opt_class();

  return (Class)v3;
}

+ (id)reuseIdentifier
{
  return @"CKDetailsContactsTableViewCell_reuseIdentifier";
}

+ (double)estimatedHeight
{
  return 0.0;
}

+ (double)preferredHeight
{
  return 0.0;
}

+ (double)marginWidth
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 transcriptDrawerContactImageDiameter];
  double v4 = v3;
  v5 = +[CKUIBehavior sharedBehaviors];
  [v5 detailsContactAvatarLabelSpacing];
  double v7 = v4 + v6 * 2.0;

  return v7;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CKDetailsContactsTableViewCell;
  -[CKDetailsContactsTableViewCell sizeThatFits:](&v12, sel_sizeThatFits_, a3.width, a3.height);
  double v4 = v3;
  double v6 = v5;
  double v7 = +[CKUIBehavior sharedBehaviors];
  [v7 detailsContactCellMinimumHeight];
  double v9 = v8;

  if (v9 >= v6) {
    double v10 = v9;
  }
  else {
    double v10 = v6;
  }
  double v11 = v4;
  result.height = v10;
  result.width = v11;
  return result;
}

- (CKDetailsContactsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v92.receiver = self;
  v92.super_class = (Class)CKDetailsContactsTableViewCell;
  double v4 = [(CKDetailsCell *)&v92 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    double v5 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    [(CKDetailsContactsTableViewCell *)v4 setMessageButton:v5];

    double v6 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    [(CKDetailsContactsTableViewCell *)v4 setPhoneButton:v6];

    double v7 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    [(CKDetailsContactsTableViewCell *)v4 setFacetimeVideoButton:v7];

    double v8 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    [(CKDetailsContactsTableViewCell *)v4 setScreenSharingButton:v8];

    double v9 = [(CKDetailsContactsTableViewCell *)v4 messageButton];
    double v10 = [v9 imageView];
    [v10 setContentMode:1];

    double v11 = [(CKDetailsContactsTableViewCell *)v4 phoneButton];
    objc_super v12 = [v11 imageView];
    [v12 setContentMode:1];

    v13 = [(CKDetailsContactsTableViewCell *)v4 facetimeVideoButton];
    v14 = [v13 imageView];
    [v14 setContentMode:1];

    v15 = [(CKDetailsContactsTableViewCell *)v4 screenSharingButton];
    v16 = [v15 imageView];
    [v16 setContentMode:1];

    v17 = [(CKDetailsContactsTableViewCell *)v4 messageButton];
    [v17 setContentMode:4];

    v18 = [(CKDetailsContactsTableViewCell *)v4 phoneButton];
    [v18 setContentMode:4];

    v19 = [(CKDetailsContactsTableViewCell *)v4 facetimeVideoButton];
    [v19 setContentMode:4];

    v20 = [(CKDetailsContactsTableViewCell *)v4 screenSharingButton];
    [v20 setContentMode:4];

    v21 = [(CKDetailsContactsTableViewCell *)v4 messageButton];
    objc_msgSend(v21, "setImageEdgeInsets:", -2.0, -1.0, -2.5, -2.0);

    v22 = [(CKDetailsContactsTableViewCell *)v4 phoneButton];
    objc_msgSend(v22, "setImageEdgeInsets:", -2.0, -1.0, -2.5, -2.0);

    v23 = [(CKDetailsContactsTableViewCell *)v4 facetimeVideoButton];
    objc_msgSend(v23, "setImageEdgeInsets:", -2.0, -2.0, -2.0, -2.0);

    v24 = [(CKDetailsContactsTableViewCell *)v4 screenSharingButton];
    objc_msgSend(v24, "setImageEdgeInsets:", -2.0, -2.0, -2.0, -2.0);

    v25 = [(CKDetailsContactsTableViewCell *)v4 _imageNamed:@"video.fill"];
    v26 = [(CKDetailsContactsTableViewCell *)v4 _imageNamed:@"phone.fill"];
    v27 = [(CKDetailsContactsTableViewCell *)v4 _imageNamed:@"message.fill"];
    v28 = [(CKDetailsContactsTableViewCell *)v4 _imageNamed:@"rectangle.fill.on.rectangle.fill"];
    v29 = [(CKDetailsContactsTableViewCell *)v4 facetimeVideoButton];
    [v29 setImage:v25 forState:0];

    v30 = [(CKDetailsContactsTableViewCell *)v4 phoneButton];
    [v30 setImage:v26 forState:0];

    v31 = [(CKDetailsContactsTableViewCell *)v4 messageButton];
    [v31 setImage:v27 forState:0];

    v32 = [(CKDetailsContactsTableViewCell *)v4 screenSharingButton];
    [v32 setImage:v28 forState:0];

    v33 = +[CKUIBehavior sharedBehaviors];
    v34 = [v33 theme];
    v35 = [v34 contactsActionButtonColor];
    v36 = [(CKDetailsContactsTableViewCell *)v4 facetimeVideoButton];
    [v36 setTintColor:v35];

    v37 = +[CKUIBehavior sharedBehaviors];
    v38 = [v37 theme];
    v39 = [v38 contactsActionButtonColor];
    v40 = [(CKDetailsContactsTableViewCell *)v4 phoneButton];
    [v40 setTintColor:v39];

    v41 = +[CKUIBehavior sharedBehaviors];
    v42 = [v41 theme];
    v43 = [v42 contactsActionButtonColor];
    v44 = [(CKDetailsContactsTableViewCell *)v4 messageButton];
    [v44 setTintColor:v43];

    v45 = +[CKUIBehavior sharedBehaviors];
    v46 = [v45 theme];
    v47 = [v46 contactsActionButtonColor];
    v48 = [(CKDetailsContactsTableViewCell *)v4 screenSharingButton];
    [v48 setTintColor:v47];

    v49 = +[CKUIBehavior sharedBehaviors];
    v50 = [v49 theme];
    v51 = [v50 contactsActionButtonBackgroundColor];
    v52 = [(CKDetailsContactsTableViewCell *)v4 facetimeVideoButton];
    [v52 setBackgroundColor:v51];

    v53 = +[CKUIBehavior sharedBehaviors];
    v54 = [v53 theme];
    v55 = [v54 contactsActionButtonBackgroundColor];
    v56 = [(CKDetailsContactsTableViewCell *)v4 phoneButton];
    [v56 setBackgroundColor:v55];

    v57 = +[CKUIBehavior sharedBehaviors];
    v58 = [v57 theme];
    v59 = [v58 contactsActionButtonBackgroundColor];
    v60 = [(CKDetailsContactsTableViewCell *)v4 messageButton];
    [v60 setBackgroundColor:v59];

    v61 = +[CKUIBehavior sharedBehaviors];
    v62 = [v61 theme];
    v63 = [v62 contactsActionButtonBackgroundColor];
    v64 = [(CKDetailsContactsTableViewCell *)v4 screenSharingButton];
    [v64 setBackgroundColor:v63];

    v65 = [(CKDetailsContactsTableViewCell *)v4 facetimeVideoButton];
    [v65 setTitle:0 forState:0];

    v66 = [(CKDetailsContactsTableViewCell *)v4 phoneButton];
    [v66 setTitle:0 forState:0];

    v67 = [(CKDetailsContactsTableViewCell *)v4 messageButton];
    [v67 setTitle:0 forState:0];

    v68 = [(CKDetailsContactsTableViewCell *)v4 screenSharingButton];
    [v68 setTitle:0 forState:0];

    v69 = [CKLabel alloc];
    double v70 = *MEMORY[0x1E4F1DB28];
    double v71 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v72 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v73 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v74 = -[CKLabel initWithFrame:](v69, "initWithFrame:", *MEMORY[0x1E4F1DB28], v71, v72, v73);
    [(CKDetailsContactsTableViewCell *)v4 setNameLabel:v74];

    v75 = [(CKDetailsContactsTableViewCell *)v4 nameLabel];
    v76 = +[CKUIBehavior sharedBehaviors];
    v77 = [v76 recipientNameFont];
    [v75 setFont:v77];

    v78 = [(CKDetailsContactsTableViewCell *)v4 nameLabel];
    v79 = +[CKUIBehavior sharedBehaviors];
    v80 = [v79 theme];
    v81 = [v80 contactCellTextColor];
    [v78 setTextColor:v81];

    v82 = [(CKDetailsContactsTableViewCell *)v4 nameLabel];
    [v82 setNumberOfLines:0];

    v83 = [(CKDetailsContactsTableViewCell *)v4 nameLabel];
    [v83 setContentMode:7];

    v84 = -[CKAvatarView initWithFrame:]([CKAvatarView alloc], "initWithFrame:", v70, v71, v72, v73);
    [(CKDetailsContactsTableViewCell *)v4 setContactAvatarView:v84];

    v85 = [(CKDetailsContactsTableViewCell *)v4 contactAvatarView];
    [v85 setShowsContactOnTap:0];

    v86 = [(CKDetailsContactsTableViewCell *)v4 contentView];
    [v86 setBackgroundColor:0];

    if (CKIsRunningInMacCatalyst())
    {
      v87 = (void *)[objc_alloc(MEMORY[0x1E4F42A70]) initWithTarget:v4 action:sel_didHoverOverCell_];
      [(CKDetailsContactsTableViewCell *)v4 addGestureRecognizer:v87];
    }
    else
    {
      [(CKDetailsContactsTableViewCell *)v4 setAccessoryType:1];
      v87 = [(CKDetailsContactsTableViewCell *)v4 _tableView];
      v88 = +[CKUIBehavior sharedBehaviors];
      v89 = [v88 theme];
      v90 = [v89 detailsContactCellChevronColor];
      [v87 _setAccessoryBaseColor:v90];
    }
  }
  return v4;
}

- (id)_ckSymbolImageNamed:(id)a3 preferredContentSizeCategory:(id)a4 preferredFontTextStyle:(id)a5
{
  double v7 = (void *)MEMORY[0x1E4F42F80];
  id v8 = a5;
  id v9 = a3;
  double v10 = [v7 traitCollectionWithPreferredContentSizeCategory:a4];
  double v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v8 compatibleWithTraitCollection:v10];

  [v11 pointSize];
  objc_super v12 = objc_msgSend(MEMORY[0x1E4F42A98], "configurationWithPointSize:");
  v13 = [MEMORY[0x1E4F42A80] systemImageNamed:v9 withConfiguration:v12];

  return v13;
}

- (id)_imageNamed:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    int v5 = CKIsRunningInMacCatalyst();
    double v6 = (uint64_t *)MEMORY[0x1E4F437B0];
    if (v5) {
      double v6 = (uint64_t *)MEMORY[0x1E4F437B8];
    }
    uint64_t v7 = *v6;
    id v8 = (void *)MEMORY[0x1E4F43890];
    if (v5) {
      id v8 = (void *)MEMORY[0x1E4F438C8];
    }
    id v9 = [(CKDetailsContactsTableViewCell *)self _ckSymbolImageNamed:v4 preferredContentSizeCategory:v7 preferredFontTextStyle:*v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)layoutSubviews
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)CKDetailsContactsTableViewCell;
  [(CKDetailsCell *)&v29 layoutSubviews];
  double v3 = +[CKUIBehavior sharedBehaviors];
  [v3 detailsContactCellButtonEdgeInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  objc_super v12 = [(CKDetailsContactsTableViewCell *)self facetimeVideoButton];
  v30[0] = v12;
  v13 = [(CKDetailsContactsTableViewCell *)self phoneButton];
  v30[1] = v13;
  v14 = [(CKDetailsContactsTableViewCell *)self messageButton];
  v30[2] = v14;
  v15 = [(CKDetailsContactsTableViewCell *)self screenSharingButton];
  v30[3] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];

  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        objc_msgSend(v21, "setContentEdgeInsets:", v5, v7, v9, v11);
        v22 = [v21 layer];
        [(CKDetailsContactsTableViewCell *)self _configureButtonLayer:v22];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v18);
  }

  v23 = [(CKDetailsContactsTableViewCell *)self contact];
  if (v23)
  {
    v24 = [(CKDetailsContactsTableViewCell *)self contactAvatarView];
    [v24 setContact:v23];
  }
}

- (void)setShowsLocation:(BOOL)a3
{
  if (self->_showsLocation != a3)
  {
    self->_showsLocation = a3;
    if (a3)
    {
      id v4 = objc_alloc(MEMORY[0x1E4F42B38]);
      double v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(CKDetailsContactsTableViewCell *)self setLocationLabel:v5];

      double v6 = [(CKDetailsContactsTableViewCell *)self locationLabel];
      double v7 = +[CKUIBehavior sharedBehaviors];
      double v8 = [v7 locationSubtitleFont];
      [v6 setFont:v8];

      double v9 = [(CKDetailsContactsTableViewCell *)self locationLabel];
      double v10 = +[CKUIBehavior sharedBehaviors];
      double v11 = [v10 theme];
      objc_super v12 = [v11 detailsContactCellSubTitleColor];
      [v9 setTextColor:v12];

      v13 = [(CKDetailsContactsTableViewCell *)self locationLabel];
      [v13 setLineBreakMode:5];
    }
    else
    {
      v14 = [(CKDetailsContactsTableViewCell *)self locationLabel];
      [v14 removeFromSuperview];

      [(CKDetailsContactsTableViewCell *)self setLocationLabel:0];
    }
    id v15 = [(CKDetailsContactsTableViewCell *)self contentView];
    [v15 setNeedsLayout];
  }
}

- (void)setShowsTUConversationStatus:(BOOL)a3
{
  if (self->_showsTUConversationStatus != a3)
  {
    self->_showsTUConversationStatus = a3;
    if (a3)
    {
      id v4 = objc_alloc(MEMORY[0x1E4F42B38]);
      double v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(CKDetailsContactsTableViewCell *)self setExpanseStatusLabel:v5];

      double v6 = [(CKDetailsContactsTableViewCell *)self expanseStatusLabel];
      double v7 = +[CKUIBehavior sharedBehaviors];
      double v8 = [v7 locationSubtitleFont];
      [v6 setFont:v8];

      double v9 = [(CKDetailsContactsTableViewCell *)self expanseStatusLabel];
      double v10 = +[CKUIBehavior sharedBehaviors];
      double v11 = [v10 theme];
      objc_super v12 = [v11 detailsContactCellSubTitleColor];
      [v9 setTextColor:v12];

      [(CKDetailsContactsTableViewCell *)self _formatExpanseStatusLabel];
    }
    else
    {
      v13 = [(CKDetailsContactsTableViewCell *)self expanseStatusLabel];
      [v13 removeFromSuperview];

      [(CKDetailsContactsTableViewCell *)self setExpanseStatusLabel:0];
    }
    id v14 = [(CKDetailsContactsTableViewCell *)self contentView];
    [v14 setNeedsLayout];
  }
}

- (void)setShowInfoButton:(BOOL)a3
{
  if (self->_showInfoButton != a3)
  {
    self->_showInfoButton = a3;
    [(CKDetailsContactsTableViewCell *)self _updateVisibleButtons];
  }
}

- (void)setShowMessageButton:(BOOL)a3
{
  if (self->_showMessageButton != a3)
  {
    self->_showMessageButton = a3;
    [(CKDetailsContactsTableViewCell *)self _updateVisibleButtons];
  }
}

- (void)setShowPhoneButton:(BOOL)a3
{
  if (self->_showPhoneButton != a3)
  {
    self->_showPhoneButton = a3;
    [(CKDetailsContactsTableViewCell *)self _updateVisibleButtons];
  }
}

- (void)setShowFaceTimeVideoButton:(BOOL)a3
{
  if (self->_showFaceTimeVideoButton != a3)
  {
    self->_showFaceTimeVideoButton = a3;
    [(CKDetailsContactsTableViewCell *)self _updateVisibleButtons];
  }
}

- (void)setShowScreenSharingButton:(BOOL)a3
{
  if (self->_showScreenSharingButton != a3)
  {
    self->_showScreenSharingButton = a3;
    [(CKDetailsContactsTableViewCell *)self _updateVisibleButtons];
  }
}

- (void)setLocationString:(id)a3
{
  id v7 = a3;
  if (!-[NSString isEqualToString:](self->_locationString, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_locationString, a3);
    double v5 = [(CKDetailsContactsTableViewCell *)self locationString];
    double v6 = [(CKDetailsContactsTableViewCell *)self locationLabel];
    [v6 setText:v5];

    [(CKDetailsContactsTableViewCell *)self setNeedsLayout];
  }
}

- (void)configureWithViewModel:(id)a3
{
  id v16 = a3;
  id v4 = [v16 entityName];
  [(CKDetailsContactsTableViewCell *)self setEntityName:v4];

  LODWORD(v4) = [v16 verified];
  double v5 = [(CKDetailsContactsTableViewCell *)self nameLabel];
  [v5 setTitleIconImageType:v4];

  double v6 = [v16 locationString];
  [(CKDetailsContactsTableViewCell *)self setLocationString:v6];

  -[CKDetailsContactsTableViewCell setShowsLocation:](self, "setShowsLocation:", [v16 showsLocation]);
  -[CKDetailsContactsTableViewCell setTuConversationStatusIsActive:](self, "setTuConversationStatusIsActive:", [v16 tuConversationStatusIsActive]);
  -[CKDetailsContactsTableViewCell setCallType:](self, "setCallType:", [v16 callType]);
  -[CKDetailsContactsTableViewCell setShowsTUConversationStatus:](self, "setShowsTUConversationStatus:", [v16 showsTUConversationStatus]);
  id v7 = [v16 contact];
  [(CKDetailsContactsTableViewCell *)self setContact:v7];

  double v8 = [v16 preferredHandle];
  double v9 = [(CKDetailsContactsTableViewCell *)self contactAvatarView];
  [v9 setPreferredHandle:v8];

  if (CKIsRunningInMacCatalyst())
  {
    -[CKDetailsContactsTableViewCell setShowFaceTimeVideoButton:](self, "setShowFaceTimeVideoButton:", [v16 showsFaceTimeVideoButton]);
    -[CKDetailsContactsTableViewCell setShowMessageButton:](self, "setShowMessageButton:", [v16 showsMessageButton]);
    -[CKDetailsContactsTableViewCell setShowPhoneButton:](self, "setShowPhoneButton:", [v16 showsPhoneButton]);
    uint64_t v10 = [v16 showsScreenSharingButton];
  }
  else
  {
    [(CKDetailsContactsTableViewCell *)self setShowFaceTimeVideoButton:0];
    [(CKDetailsContactsTableViewCell *)self setShowMessageButton:0];
    [(CKDetailsContactsTableViewCell *)self setShowPhoneButton:0];
    uint64_t v10 = 0;
  }
  [(CKDetailsContactsTableViewCell *)self setShowScreenSharingButton:v10];
  double v11 = [(CKDetailsContactsTableViewCell *)self messageButton];
  [v11 addTarget:self action:sel__handleCommunicationAction_ forControlEvents:64];

  objc_super v12 = [(CKDetailsContactsTableViewCell *)self facetimeVideoButton];
  [v12 addTarget:self action:sel__handleCommunicationAction_ forControlEvents:64];

  v13 = [(CKDetailsContactsTableViewCell *)self phoneButton];
  [v13 addTarget:self action:sel__handleCommunicationAction_ forControlEvents:64];

  if ([v16 isPendingRecipient]) {
    [(CKDetailsContactsTableViewCell *)self _showUpdatingParticipantSpinner];
  }
  else {
    [(CKDetailsContactsTableViewCell *)self _dismissUpdatingParticipantSpinner];
  }
  -[CKDetailsContactsTableViewCell setShowsLocation:](self, "setShowsLocation:", [v16 showsLocation]);
  id v14 = [(CKDetailsContactsTableViewCell *)self locationString];
  id v15 = [(CKDetailsContactsTableViewCell *)self locationLabel];
  [v15 setText:v14];

  -[CKDetailsContactsTableViewCell setShowsTUConversationStatus:](self, "setShowsTUConversationStatus:", [v16 showsTUConversationStatus]);
  -[CKDetailsContactsTableViewCell setTuConversationStatusIsActive:](self, "setTuConversationStatusIsActive:", [v16 tuConversationStatusIsActive]);
  -[CKDetailsContactsTableViewCell setCallType:](self, "setCallType:", [v16 callType]);
  [(CKDetailsContactsTableViewCell *)self _formatExpanseStatusLabel];
  if (CKIsRunningInMacCatalyst()) {
    [(CKDetailsContactsTableViewCell *)self _hideAllButtons];
  }
}

- (void)_formatExpanseStatusLabel
{
  if ([(CKDetailsContactsTableViewCell *)self tuConversationStatusIsActive])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4FB0870]);
    id v4 = (void *)MEMORY[0x1E4F42A98];
    double v5 = +[CKUIBehavior sharedBehaviors];
    double v6 = [v5 locationSubtitleFont];
    id v7 = [v4 configurationWithFont:v6 scale:1];

    int64_t v8 = [(CKDetailsContactsTableViewCell *)self callType];
    if ((unint64_t)(v8 - 1) > 2) {
      double v9 = &stru_1EDE4CA38;
    }
    else {
      double v9 = off_1E562A118[v8 - 1];
    }
    double v11 = [MEMORY[0x1E4F42A80] systemImageNamed:v9 withConfiguration:v7];
    objc_super v12 = [v11 imageWithRenderingMode:2];
    [v3 setImage:v12];

    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:&stru_1EDE4CA38];
    v13 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v3];
    [v10 appendAttributedString:v13];

    id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v15 = CKFrameworkBundle();
    id v16 = [v15 localizedStringForKey:@"ACTIVE_FACETIME" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v17 = (void *)[v14 initWithString:v16];
    [v10 appendAttributedString:v17];

    uint64_t v18 = [(CKDetailsContactsTableViewCell *)self expanseStatusLabel];
    [v18 setAttributedText:v10];
  }
  else
  {
    CKFrameworkBundle();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [v3 localizedStringForKey:@"INVITED_FACETIME" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v10 = [(CKDetailsContactsTableViewCell *)self expanseStatusLabel];
    [v10 setText:v7];
  }

  id v19 = [(CKDetailsContactsTableViewCell *)self expanseStatusLabel];
  [v19 setLineBreakMode:4];
}

- (void)_showUpdatingParticipantSpinner
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "showUpdatingParticipantSpinner", v6, 2u);
    }
  }
  id v4 = [(CKDetailsContactsTableViewCell *)self updatingParticipantSpinner];
  if (!v4)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
    [(CKDetailsContactsTableViewCell *)self setUpdatingParticipantSpinner:v4];
    double v5 = [(CKDetailsContactsTableViewCell *)self contentView];
    [v5 addSubview:v4];
  }
}

- (void)_dismissUpdatingParticipantSpinner
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "dismissUpdatingParticipantSpinner", v7, 2u);
    }
  }
  id v4 = [(CKDetailsContactsTableViewCell *)self updatingParticipantSpinner];

  if (v4)
  {
    double v5 = [(CKDetailsContactsTableViewCell *)self updatingParticipantSpinner];
    [v5 stopAnimating];

    double v6 = [(CKDetailsContactsTableViewCell *)self updatingParticipantSpinner];
    [v6 removeFromSuperview];

    [(CKDetailsContactsTableViewCell *)self setUpdatingParticipantSpinner:0];
  }
}

- (void)_handleCommunicationAction:(id)a3
{
  id v9 = a3;
  id v4 = [(CKDetailsContactsTableViewCell *)self messageButton];

  if (v4 == v9)
  {
    int64_t v8 = [(CKDetailsContactsTableViewCell *)self delegate];
    [v8 contactsCellDidTapMessagesButton:self];
  }
  else
  {
    id v5 = [(CKDetailsContactsTableViewCell *)self facetimeVideoButton];

    if (v5 == v9)
    {
      int64_t v8 = [(CKDetailsContactsTableViewCell *)self delegate];
      [v8 contactsCellDidTapFaceTimeVideoButton:self];
    }
    else
    {
      id v6 = [(CKDetailsContactsTableViewCell *)self phoneButton];

      id v7 = v9;
      if (v6 != v9) {
        goto LABEL_8;
      }
      int64_t v8 = [(CKDetailsContactsTableViewCell *)self delegate];
      [v8 contactsCellDidTapPhoneButton:self];
    }
  }

  id v7 = v9;
LABEL_8:
}

- (void)_configureButtonLayer:(id)a3
{
  id v3 = a3;
  id v7 = +[CKUIBehavior sharedBehaviors];
  [v7 detailsContactCellButtonWidth];
  double v5 = v4;
  if (CKMainScreenScale_once_74 != -1) {
    dispatch_once(&CKMainScreenScale_once_74, &__block_literal_global_189);
  }
  double v6 = *(double *)&CKMainScreenScale_sMainScreenScale_74;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_74 == 0.0) {
    double v6 = 1.0;
  }
  [v3 setCornerRadius:round(v5 * 0.5 * v6) / v6];
}

- (void)didHoverOverCell:(id)a3
{
  id v4 = a3;
  id v6 = [(CKDetailsContactsTableViewCell *)self delegate];
  uint64_t v5 = [v4 state];

  [v6 contactsCell:self didHoverWithState:v5];
}

- (CKAvatarView)contactAvatarView
{
  return self->_contactAvatarView;
}

- (void)setContactAvatarView:(id)a3
{
}

- (CKDetailsContactsTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKDetailsContactsTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKLabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)locationLabel
{
  return self->_locationLabel;
}

- (void)setLocationLabel:(id)a3
{
}

- (UILabel)expanseStatusLabel
{
  return self->_expanseStatusLabel;
}

- (void)setExpanseStatusLabel:(id)a3
{
}

- (NSString)entityName
{
  return self->_entityName;
}

- (void)setEntityName:(id)a3
{
}

- (NSString)locationString
{
  return self->_locationString;
}

- (BOOL)tuConversationStatusIsActive
{
  return self->_tuConversationStatusIsActive;
}

- (void)setTuConversationStatusIsActive:(BOOL)a3
{
  self->_tuConversationStatusIsActive = a3;
}

- (int64_t)callType
{
  return self->_callType;
}

- (void)setCallType:(int64_t)a3
{
  self->_callType = a3;
}

- (BOOL)showsLocation
{
  return self->_showsLocation;
}

- (BOOL)showMessageButton
{
  return self->_showMessageButton;
}

- (BOOL)showPhoneButton
{
  return self->_showPhoneButton;
}

- (BOOL)showFaceTimeVideoButton
{
  return self->_showFaceTimeVideoButton;
}

- (BOOL)showInfoButton
{
  return self->_showInfoButton;
}

- (BOOL)showScreenSharingButton
{
  return self->_showScreenSharingButton;
}

- (BOOL)showsTUConversationStatus
{
  return self->_showsTUConversationStatus;
}

- (UIButton)messageButton
{
  return self->_messageButton;
}

- (void)setMessageButton:(id)a3
{
}

- (UIButton)phoneButton
{
  return self->_phoneButton;
}

- (void)setPhoneButton:(id)a3
{
}

- (UIButton)facetimeVideoButton
{
  return self->_facetimeVideoButton;
}

- (void)setFacetimeVideoButton:(id)a3
{
}

- (UIButton)screenSharingButton
{
  return self->_screenSharingButton;
}

- (void)setScreenSharingButton:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (UIActivityIndicatorView)updatingParticipantSpinner
{
  return self->_updatingParticipantSpinner;
}

- (void)setUpdatingParticipantSpinner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatingParticipantSpinner, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_screenSharingButton, 0);
  objc_storeStrong((id *)&self->_facetimeVideoButton, 0);
  objc_storeStrong((id *)&self->_phoneButton, 0);
  objc_storeStrong((id *)&self->_messageButton, 0);
  objc_storeStrong((id *)&self->_locationString, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_expanseStatusLabel, 0);
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_contactAvatarView, 0);
}

@end