@interface FBKAttachmentCell
+ (id)reuseIdentifier;
- (BOOL)showsFileSize;
- (BOOL)showsIcon;
- (FBKAttachment)attachment;
- (NSLayoutConstraint)attachmentLabelSpacingToSuperview;
- (NSLayoutConstraint)superviewToImageSpacing;
- (NSString)itemIdentifier;
- (UIImageView)attachmentIcon;
- (UILabel)accessoryLabel;
- (UILabel)attachmentDisplayName;
- (UILabel)doneLabel;
- (double)horizontalFrameInset;
- (int64_t)attachmentType;
- (int64_t)gatherState;
- (void)awakeFromNib;
- (void)setAccessoryLabel:(id)a3;
- (void)setAccessoryText:(id)a3;
- (void)setAttachment:(id)a3;
- (void)setAttachmentDisplayName:(id)a3;
- (void)setAttachmentIcon:(id)a3;
- (void)setAttachmentLabelSpacingToSuperview:(id)a3;
- (void)setAttachmentType:(int64_t)a3;
- (void)setDoneLabel:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setGatherState:(int64_t)a3;
- (void)setHorizontalFrameInset:(double)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setShowsFileSize:(BOOL)a3;
- (void)setShowsIcon:(BOOL)a3;
- (void)setSuperviewToImageSpacing:(id)a3;
- (void)showButtonState;
- (void)showDeferredState;
- (void)showDownloadNotPermittedState;
- (void)showDownloadUnavailableState;
- (void)showFailedToGatherState;
- (void)showGatheredState;
- (void)showGatheringState;
- (void)showNotGatheredState;
- (void)showUnsatisfiedState;
- (void)updateAccessibilityLabel;
- (void)updateCell;
- (void)updateContentInsetWithValue:(double)a3;
- (void)updateDeferredStateWith:(id)a3;
- (void)updateSuperviewToAttachmentLabelSpacing:(double)a3;
- (void)updateSuperviewToSeparatorSpacing:(double)a3;
@end

@implementation FBKAttachmentCell

+ (id)reuseIdentifier
{
  return @"FBKAttachmentCell";
}

- (void)awakeFromNib
{
  v14.receiver = self;
  v14.super_class = (Class)FBKAttachmentCell;
  [(FBKAttachmentCell *)&v14 awakeFromNib];
  id v3 = objc_alloc(MEMORY[0x263F828E0]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  accessoryLabel = self->_accessoryLabel;
  self->_accessoryLabel = v4;

  v6 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [(UILabel *)self->_accessoryLabel setTextColor:v6];

  v7 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
  [(UILabel *)self->_accessoryLabel setFont:v7];

  v8 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  doneLabel = self->_doneLabel;
  self->_doneLabel = v8;

  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"DONE" value:&stru_26DDF6A30 table:0];
  [(UILabel *)self->_doneLabel setText:v11];

  v12 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [(UILabel *)self->_doneLabel setTextColor:v12];

  [(UILabel *)self->_doneLabel sizeToFit];
  self->_showsIcon = 1;
  self->_showsFileSize = 0;
  self->_horizontalFrameInset = 0.0;
  v13 = [(FBKAttachmentCell *)self attachmentDisplayName];
  [v13 setAdjustsFontForContentSizeCategory:1];

  [(UILabel *)self->_accessoryLabel setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)self->_doneLabel setAdjustsFontSizeToFitWidth:1];
}

- (void)setFrame:(CGRect)a3
{
  double horizontalFrameInset = self->_horizontalFrameInset;
  double v4 = a3.size.width + horizontalFrameInset * -2.0;
  BOOL v5 = horizontalFrameInset == 0.0;
  if (horizontalFrameInset == 0.0) {
    double horizontalFrameInset = -0.0;
  }
  double v6 = a3.origin.x + horizontalFrameInset;
  if (!v5) {
    a3.size.width = v4;
  }
  v7.receiver = self;
  v7.super_class = (Class)FBKAttachmentCell;
  -[FBKAttachmentCell setFrame:](&v7, sel_setFrame_, v6, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setShowsIcon:(BOOL)a3
{
  self->_showsIcon = a3;
  BOOL v3 = !a3;
  id v4 = [(FBKAttachmentCell *)self attachmentIcon];
  [v4 setHidden:v3];
}

- (void)showGatheringState
{
  BOOL v3 = [(FBKAttachmentCell *)self attachmentIcon];
  [v3 setHidden:1];

  id v4 = [(FBKAttachmentCell *)self attachment];
  int v5 = [v4 fileComesFromFBK];

  double v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v7 = v6;
  if (v5) {
    v8 = @"ATTACHING";
  }
  else {
    v8 = @"GATHERING";
  }
  v9 = [v6 localizedStringForKey:v8 value:&stru_26DDF6A30 table:@"CommonStrings"];
  [(FBKAttachmentCell *)self setAccessoryText:v9];

  id v12 = [(FBKAttachmentCell *)self attachment];
  v10 = [v12 displayName];
  v11 = [(FBKAttachmentCell *)self attachmentDisplayName];
  [v11 setText:v10];
}

- (void)showGatheredState
{
  BOOL v3 = [(FBKAttachmentCell *)self attachment];
  id v4 = [v3 displayName];
  int v5 = [(FBKAttachmentCell *)self attachmentDisplayName];
  [v5 setText:v4];

  double v6 = [(FBKAttachmentCell *)self attachment];
  uint64_t v7 = [v6 attachmentType];

  if (v7 != 6)
  {
    v8 = [(FBKAttachmentCell *)self attachmentIcon];
    [v8 setHidden:1];
  }
  v9 = [(FBKAttachmentCell *)self attachment];
  uint64_t v10 = [v9 group];
  if (v10)
  {
    v11 = (void *)v10;
    BOOL v12 = [(FBKAttachmentCell *)self showsFileSize];

    if (v12)
    {
      id v17 = (id)objc_opt_new();
      v13 = [(FBKAttachmentCell *)self attachment];
      objc_super v14 = [v13 group];
      v15 = [v14 totalFileSize];
      v16 = objc_msgSend(v17, "stringFromByteCount:", objc_msgSend(v15, "longLongValue"));
      [(FBKAttachmentCell *)self setAccessoryText:v16];

      return;
    }
  }
  else
  {
  }
  [(FBKAttachmentCell *)self setAccessoryView:0];

  [(FBKAttachmentCell *)self setAccessoryType:1];
}

- (void)showNotGatheredState
{
  if ([(FBKAttachmentCell *)self attachmentType] == 1)
  {
    BOOL v3 = [MEMORY[0x263F086E0] FeedbackCore];
    id v22 = [v3 localizedStringForKey:@"GATHER_WITH_DIAGNOSTIC_NAME" value:@"Gather %@" table:0];

    id v4 = NSString;
    int v5 = [(FBKAttachmentCell *)self attachment];
    double v6 = [v5 displayName];
    uint64_t v7 = objc_msgSend(v4, "stringWithFormat:", v22, v6);
    v8 = [(FBKAttachmentCell *)self attachmentDisplayName];
    [v8 setText:v7];

    v9 = [MEMORY[0x263F825C8] tintColor];
    uint64_t v10 = [(FBKAttachmentCell *)self attachmentDisplayName];
    [v10 setTextColor:v9];

    v11 = [(FBKAttachmentCell *)self attachment];
    LODWORD(v10) = [v11 isRequired];

    if (v10)
    {
      BOOL v12 = [MEMORY[0x263F086E0] FeedbackCore];
      v13 = [v12 localizedStringForKey:@"REQUIRED" value:@"Required" table:0];

      [(FBKAttachmentCell *)self setAccessoryText:v13];
    }
    else
    {
      [(FBKAttachmentCell *)self setAccessoryView:0];
      [(FBKAttachmentCell *)self setAccessoryType:0];
    }
    objc_super v14 = [(FBKAttachmentCell *)self attachment];
    int v15 = [v14 isRequired];

    if (v15)
    {
      v16 = [MEMORY[0x263F827E8] systemImageNamed:@"exclamationmark.circle"];
      id v17 = [(FBKAttachmentCell *)self attachmentIcon];
      [v17 setImage:v16];

      v18 = [(FBKAttachmentCell *)self attachmentIcon];
      v19 = v18;
      uint64_t v20 = 0;
    }
    else
    {
      uint64_t v21 = [(FBKAttachmentCell *)self showsIcon] ^ 1;
      v18 = [(FBKAttachmentCell *)self attachmentIcon];
      v19 = v18;
      uint64_t v20 = v21;
    }
    [v18 setHidden:v20];
  }
}

- (void)showDeferredState
{
  BOOL v3 = [(FBKAttachmentCell *)self attachment];
  id v4 = [v3 displayName];
  int v5 = [(FBKAttachmentCell *)self attachmentDisplayName];
  [v5 setText:v4];

  double v6 = [(FBKAttachmentCell *)self attachmentIcon];
  [v6 setHidden:1];

  id v9 = [(FBKAttachmentCell *)self attachment];
  uint64_t v7 = [v9 requirement];
  v8 = [v7 localizedWhenItWillGather];
  [(FBKAttachmentCell *)self setAccessoryText:v8];
}

- (void)updateDeferredStateWith:(id)a3
{
  id v4 = [a3 localizedWhenItWillGather];
  [(FBKAttachmentCell *)self setAccessoryText:v4];
}

- (void)setAccessoryText:(id)a3
{
  id v7 = a3;
  if (!v7) {
    [(FBKAttachmentCell *)self setAccessoryView:0];
  }
  id v4 = [(FBKAttachmentCell *)self accessoryLabel];
  [v4 setText:v7];

  int v5 = [(FBKAttachmentCell *)self accessoryLabel];
  [v5 sizeToFit];

  double v6 = [(FBKAttachmentCell *)self accessoryLabel];
  [(FBKAttachmentCell *)self setAccessoryView:v6];
}

- (void)showButtonState
{
  BOOL v3 = [MEMORY[0x263F825C8] tintColor];
  id v4 = [(FBKAttachmentCell *)self attachmentDisplayName];
  [v4 setTextColor:v3];

  [(FBKAttachmentCell *)self setAccessoryView:0];

  [(FBKAttachmentCell *)self setAccessoryType:0];
}

- (void)showUnsatisfiedState
{
  BOOL v3 = [MEMORY[0x263F825C8] secondaryLabelColor];
  id v4 = [(FBKAttachmentCell *)self attachmentDisplayName];
  [v4 setTextColor:v3];

  [(FBKAttachmentCell *)self setAccessoryView:0];

  [(FBKAttachmentCell *)self setAccessoryType:0];
}

- (void)showFailedToGatherState
{
  id v3 = [(FBKAttachmentCell *)self doneLabel];
  [(FBKAttachmentCell *)self setAccessoryView:v3];
}

- (void)showDownloadUnavailableState
{
  [(FBKAttachmentCell *)self setAccessoryView:0];
  [(FBKAttachmentCell *)self setAccessoryType:0];
  id v4 = [MEMORY[0x263F825C8] secondaryLabelColor];
  id v3 = [(FBKAttachmentCell *)self attachmentDisplayName];
  [v3 setTextColor:v4];
}

- (void)showDownloadNotPermittedState
{
  [(FBKAttachmentCell *)self setAccessoryView:0];
  [(FBKAttachmentCell *)self setAccessoryType:0];
  id v4 = [MEMORY[0x263F825C8] secondaryLabelColor];
  id v3 = [(FBKAttachmentCell *)self attachmentDisplayName];
  [v3 setTextColor:v4];
}

- (void)setGatherState:(int64_t)a3
{
  self->_gatherState = a3;
  [(FBKAttachmentCell *)self updateCell];
}

- (void)setAttachmentType:(int64_t)a3
{
  self->_attachmentType = a3;
  [(FBKAttachmentCell *)self updateCell];
}

- (void)updateCell
{
  id v3 = [MEMORY[0x263F825C8] tintColor];
  id v4 = [(FBKAttachmentCell *)self attachmentIcon];
  [v4 setTintColor:v3];

  int v5 = [MEMORY[0x263F825C8] labelColor];
  double v6 = [(FBKAttachmentCell *)self attachmentDisplayName];
  [v6 setTextColor:v5];

  switch([(FBKAttachmentCell *)self gatherState])
  {
    case 1:
      [(FBKAttachmentCell *)self showGatheringState];
      break;
    case 2:
      [(FBKAttachmentCell *)self showGatheredState];
      break;
    case 3:
      [(FBKAttachmentCell *)self showFailedToGatherState];
      break;
    case 6:
      [(FBKAttachmentCell *)self showDownloadUnavailableState];
      break;
    case 7:
      [(FBKAttachmentCell *)self showDownloadNotPermittedState];
      break;
    case 8:
      [(FBKAttachmentCell *)self showDeferredState];
      break;
    default:
      [(FBKAttachmentCell *)self showNotGatheredState];
      break;
  }
  unint64_t v7 = [(FBKAttachmentCell *)self attachmentType] - 1;
  if (v7 < 6 && ((0x3Du >> v7) & 1) != 0)
  {
    v11 = off_264877140[v7];
  }
  else
  {
    v8 = [(FBKAttachmentCell *)self attachmentDisplayName];
    id v9 = [v8 text];
    char v10 = [v9 isImageFile];

    if (v10)
    {
      v11 = FBKSystemImageNamePhoto;
    }
    else
    {
      BOOL v12 = [(FBKAttachmentCell *)self attachmentDisplayName];
      v13 = [v12 text];
      int v14 = [v13 isVideoFile];

      v11 = FBKSystemImageNamePaper;
      if (v14) {
        v11 = FBKSystemImageNameVideo;
      }
    }
  }
  v23 = *v11;
  if ([(FBKAttachmentCell *)self gatherState] == 6
    || [(FBKAttachmentCell *)self gatherState] == 3)
  {
    int v15 = @"exclamationmark.circle";

    v23 = v15;
  }
  if ([(FBKAttachmentCell *)self showsIcon])
  {
    v16 = [MEMORY[0x263F827E8] systemImageNamed:v23];
    id v17 = [(FBKAttachmentCell *)self attachmentIcon];
    [v17 setImage:v16];

    v18 = [(FBKAttachmentCell *)self attachmentIcon];
    [v18 setAccessibilityIdentifier:v23];
  }
  v19 = [(FBKAttachmentCell *)self traitCollection];
  uint64_t v20 = [v19 preferredContentSizeCategory];
  BOOL v21 = !UIContentSizeCategoryIsAccessibilityCategory(v20);
  id v22 = [(FBKAttachmentCell *)self attachmentDisplayName];
  [v22 setNumberOfLines:v21];

  [(FBKAttachmentCell *)self updateAccessibilityLabel];
}

- (void)setAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_attachment, a3);
  id v5 = a3;
  [(FBKAttachmentCell *)self setSelectionStyle:3];
  double v6 = [v5 displayName];
  unint64_t v7 = [(FBKAttachmentCell *)self attachmentDisplayName];
  [v7 setText:v6];

  -[FBKAttachmentCell setGatherState:](self, "setGatherState:", [v5 state]);
  uint64_t v8 = [v5 attachmentType];

  [(FBKAttachmentCell *)self setAttachmentType:v8];
  uint64_t v9 = [(FBKAttachmentCell *)self accessibilityTraits];
  uint64_t v10 = *MEMORY[0x263F83260] | v9;

  [(FBKAttachmentCell *)self setAccessibilityTraits:v10];
}

- (void)updateSuperviewToAttachmentLabelSpacing:(double)a3
{
  id v5 = [(FBKAttachmentCell *)self attachmentLabelSpacingToSuperview];
  [v5 setConstant:a3];

  double v6 = [(FBKAttachmentCell *)self attachmentLabelSpacingToSuperview];
  [v6 setActive:1];

  unint64_t v7 = [(FBKAttachmentCell *)self attachmentIcon];
  [v7 frame];
  double v9 = a3 * 0.5 - v8 * 0.5;

  id v10 = [(FBKAttachmentCell *)self superviewToImageSpacing];
  [v10 setConstant:v9];
}

- (void)updateSuperviewToSeparatorSpacing:(double)a3
{
  id v5 = [(FBKAttachmentCell *)self attachmentLabelSpacingToSuperview];
  [v5 setConstant:a3];

  id v6 = [(FBKAttachmentCell *)self attachmentLabelSpacingToSuperview];
  [v6 setActive:1];
}

- (void)updateContentInsetWithValue:(double)a3
{
  id v5 = [(FBKAttachmentCell *)self superviewToImageSpacing];
  [v5 setConstant:a3];

  id v6 = [(FBKAttachmentCell *)self attachmentLabelSpacingToSuperview];
  [v6 setActive:0];
}

- (void)updateAccessibilityLabel
{
  [(FBKAttachmentCell *)self setAccessibilityTraits:*MEMORY[0x263F83260]];
  uint64_t v3 = [(FBKAttachmentCell *)self gatherState];
  uint64_t v4 = [(FBKAttachmentCell *)self attachmentType];
  id v5 = [(FBKAttachmentCell *)self attachment];
  int v6 = [v5 fileComesFromFBK];
  unint64_t v7 = [(FBKAttachmentCell *)self attachmentDisplayName];
  double v8 = [v7 text];
  double v9 = [(FBKAttachmentCell *)self accessoryLabel];
  id v10 = [v9 text];
  FBKAccessoryAccessibilityLabel(v3, v4, v6, v8, v10);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  if ([v12 length])
  {
    [(FBKAttachmentCell *)self setAccessibilityLabel:v12];
  }
  else
  {
    uint64_t v11 = [(FBKAttachmentCell *)self accessibilityTraits];
    [(FBKAttachmentCell *)self setAccessibilityTraits:*MEMORY[0x263F83290] | v11];
  }
}

- (NSString)itemIdentifier
{
  return self->itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (int64_t)gatherState
{
  return self->_gatherState;
}

- (int64_t)attachmentType
{
  return self->_attachmentType;
}

- (BOOL)showsIcon
{
  return self->_showsIcon;
}

- (BOOL)showsFileSize
{
  return self->_showsFileSize;
}

- (void)setShowsFileSize:(BOOL)a3
{
  self->_showsFileSize = a3;
}

- (double)horizontalFrameInset
{
  return self->_horizontalFrameInset;
}

- (void)setHorizontalFrameInset:(double)a3
{
  self->_double horizontalFrameInset = a3;
}

- (FBKAttachment)attachment
{
  return self->_attachment;
}

- (UILabel)attachmentDisplayName
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachmentDisplayName);

  return (UILabel *)WeakRetained;
}

- (void)setAttachmentDisplayName:(id)a3
{
}

- (UIImageView)attachmentIcon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachmentIcon);

  return (UIImageView *)WeakRetained;
}

- (void)setAttachmentIcon:(id)a3
{
}

- (UILabel)accessoryLabel
{
  return self->_accessoryLabel;
}

- (void)setAccessoryLabel:(id)a3
{
}

- (UILabel)doneLabel
{
  return self->_doneLabel;
}

- (void)setDoneLabel:(id)a3
{
}

- (NSLayoutConstraint)superviewToImageSpacing
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_superviewToImageSpacing);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setSuperviewToImageSpacing:(id)a3
{
}

- (NSLayoutConstraint)attachmentLabelSpacingToSuperview
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachmentLabelSpacingToSuperview);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setAttachmentLabelSpacingToSuperview:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_attachmentLabelSpacingToSuperview);
  objc_destroyWeak((id *)&self->_superviewToImageSpacing);
  objc_storeStrong((id *)&self->_doneLabel, 0);
  objc_storeStrong((id *)&self->_accessoryLabel, 0);
  objc_destroyWeak((id *)&self->_attachmentIcon);
  objc_destroyWeak((id *)&self->_attachmentDisplayName);
  objc_storeStrong((id *)&self->_attachment, 0);

  objc_storeStrong((id *)&self->itemIdentifier, 0);
}

@end