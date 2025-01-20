@interface GKTimeScopeButton
- (GKTimeScopeButton)initWithFrame:(CGRect)a3;
- (int64_t)leaderboardOccurrence;
- (int64_t)timeScope;
- (void)_commonInit;
- (void)awakeFromNib;
- (void)setLeaderboardOccurrence:(int64_t)a3;
- (void)setTimeScope:(int64_t)a3;
- (void)updateWithTitle:(id)a3;
@end

@implementation GKTimeScopeButton

- (GKTimeScopeButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKTimeScopeButton;
  v3 = -[GKTimeScopeButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(GKTimeScopeButton *)v3 _commonInit];
  }
  return v4;
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)GKTimeScopeButton;
  [(GKTimeScopeButton *)&v3 awakeFromNib];
  [(GKTimeScopeButton *)self _commonInit];
}

- (void)_commonInit
{
}

- (void)setTimeScope:(int64_t)a3
{
  self->_timeScope = a3;
  objc_msgSend(MEMORY[0x1E4F63738], "localizedStringForTimeScope:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(GKTimeScopeButton *)self updateWithTitle:v4];
}

- (void)setLeaderboardOccurrence:(int64_t)a3
{
  self->_leaderboardOccurrence = a3;
  objc_msgSend(MEMORY[0x1E4F63738], "localizedStringForLeaderboardOccurrence:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(GKTimeScopeButton *)self updateWithTitle:v4];
}

- (void)updateWithTitle:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F28E48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = (void *)MEMORY[0x1E4FB0870];
  v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.down"];
  v9 = [v7 textAttachmentWithImage:v8];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5];
  [v6 appendAttributedString:v10];

  v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
  [v6 appendAttributedString:v11];

  v12 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v9];
  [v6 appendAttributedString:v12];

  v13 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  if (*MEMORY[0x1E4F63830]) {
    [MEMORY[0x1E4FB1618] systemWhiteColor];
  }
  else {
  v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  uint64_t v15 = *MEMORY[0x1E4FB0700];
  v17[0] = *MEMORY[0x1E4FB06F8];
  v17[1] = v15;
  v18[0] = v13;
  v18[1] = v14;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  objc_msgSend(v6, "addAttributes:range:", v16, 0, objc_msgSend(v6, "length"));

  [(GKTimeScopeButton *)self setAttributedTitle:v6 forState:0];
}

- (int64_t)timeScope
{
  return self->_timeScope;
}

- (int64_t)leaderboardOccurrence
{
  return self->_leaderboardOccurrence;
}

@end