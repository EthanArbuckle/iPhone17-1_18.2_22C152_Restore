@interface CKTranscriptDNDCell
+ (double)preferredHeight;
+ (id)identifier;
- (CKTranscriptDNDCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UISwitch)muteSwitch;
- (void)layoutSubviews;
- (void)setMuteSwitch:(id)a3;
@end

@implementation CKTranscriptDNDCell

+ (id)identifier
{
  return @"transcript-management-dnd-cell";
}

+ (double)preferredHeight
{
  return 44.0;
}

- (CKTranscriptDNDCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)CKTranscriptDNDCell;
  v4 = [(CKTranscriptDNDCell *)&v11 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F42E78]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v7 = [(CKTranscriptDNDCell *)v4 textLabel];
    v8 = CKFrameworkBundle();
    v9 = [v8 localizedStringForKey:@"DETAILS_VIEW_HIDE_ALERTS_TOGGLE_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v7 setText:v9];

    [(CKTranscriptDNDCell *)v4 setMuteSwitch:v6];
  }
  return v4;
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)CKTranscriptDNDCell;
  [(CKTranscriptDNDCell *)&v22 layoutSubviews];
  [(CKTranscriptDNDCell *)self layoutMargins];
  double v4 = v3;
  double v6 = v5;
  v7 = [(CKTranscriptDNDCell *)self muteSwitch];

  if (v7)
  {
    v8 = [(CKTranscriptDNDCell *)self muteSwitch];
    [v8 frame];
    double v10 = v9;
    double v12 = v11;

    if (([(CKTranscriptDNDCell *)self _shouldReverseLayoutDirection] & 1) == 0)
    {
      v13 = [(CKTranscriptDNDCell *)self contentView];
      [v13 bounds];
      double v15 = 20.0;
      if (v6 >= 20.0) {
        double v15 = v6;
      }
      double v4 = v14 - v15 - v10;
    }
    v16 = [(CKTranscriptDNDCell *)self contentView];
    [v16 bounds];
    double v18 = (v17 - v12) * 0.5;
    if (CKMainScreenScale_once_75 != -1) {
      dispatch_once(&CKMainScreenScale_once_75, &__block_literal_global_191);
    }
    double v19 = *(double *)&CKMainScreenScale_sMainScreenScale_75;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_75 == 0.0) {
      double v19 = 1.0;
    }
    double v20 = ceil(v18 * v19) / v19;

    v21 = [(CKTranscriptDNDCell *)self muteSwitch];
    objc_msgSend(v21, "setFrame:", v4, v20, v10, v12);
  }
}

- (void)setMuteSwitch:(id)a3
{
  double v5 = (UISwitch *)a3;
  muteSwitch = self->_muteSwitch;
  v8 = v5;
  if (muteSwitch != v5)
  {
    [(UISwitch *)muteSwitch removeFromSuperview];
    objc_storeStrong((id *)&self->_muteSwitch, a3);
    v7 = [(CKTranscriptDNDCell *)self contentView];
    [v7 addSubview:v8];

    [(CKTranscriptDNDCell *)self setNeedsLayout];
  }
}

- (UISwitch)muteSwitch
{
  return self->_muteSwitch;
}

- (void).cxx_destruct
{
}

@end