@interface EKExpandedReminderStackCell
+ (id)exampleCell;
- (EKExpandedReminderStackCell)initWithFrame:(CGRect)a3;
- (UIButton)circle;
- (UIImageView)backgroundImageView;
- (UIImageView)recurringImageView;
- (UILabel)time;
- (UILabel)title;
- (UIView)backgroundColorView;
- (void)setBackgroundColorView:(id)a3;
- (void)setBackgroundImageView:(id)a3;
- (void)setCircle:(id)a3;
- (void)setRecurringImageView:(id)a3;
- (void)setTime:(id)a3;
- (void)setTitle:(id)a3;
- (void)setVisibleForExpandingAnimation:(BOOL)a3;
- (void)setupCellWithTitle:(id)a3 completed:(BOOL)a4 editable:(BOOL)a5 date:(id)a6 buttonColor:(id)a7 buttonImageName:(id)a8 backgroundColor:(id)a9 recurringString:(id)a10 delegate:(id)a11;
@end

@implementation EKExpandedReminderStackCell

- (EKExpandedReminderStackCell)initWithFrame:(CGRect)a3
{
  v97[17] = *MEMORY[0x1E4F143B8];
  v96.receiver = self;
  v96.super_class = (Class)EKExpandedReminderStackCell;
  v3 = -[EKExpandedReminderStackCell initWithFrame:](&v96, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    title = v3->_title;
    v3->_title = v4;

    [(UILabel *)v3->_title setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_title setNumberOfLines:1];
    [(UILabel *)v3->_title setAdjustsFontForContentSizeCategory:1];
    v6 = [(EKExpandedReminderStackCell *)v3 contentView];
    [v6 addSubview:v3->_title];

    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    time = v3->_time;
    v3->_time = v7;

    [(UILabel *)v3->_time setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_time setNumberOfLines:1];
    [(UILabel *)v3->_time setAdjustsFontForContentSizeCategory:1];
    v9 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2950] addingSymbolicTraits:0x10000];
    [(UILabel *)v3->_time setFont:v9];

    v10 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v3->_time setTextColor:v10];

    v11 = [(EKExpandedReminderStackCell *)v3 contentView];
    [v11 addSubview:v3->_time];

    v12 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    backgroundColorView = v3->_backgroundColorView;
    v3->_backgroundColorView = v12;

    [(UIView *)v3->_backgroundColorView setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = [(UIView *)v3->_backgroundColorView layer];
    [v14 setCornerRadius:12.0];

    v15 = [(EKExpandedReminderStackCell *)v3 contentView];
    [v15 addSubview:v3->_backgroundColorView];

    v16 = [(EKExpandedReminderStackCell *)v3 contentView];
    [v16 sendSubviewToBack:v3->_backgroundColorView];

    v17 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    backgroundImageView = v3->_backgroundImageView;
    v3->_backgroundImageView = v17;

    [(UIImageView *)v3->_backgroundImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = [(EKExpandedReminderStackCell *)v3 contentView];
    [v19 addSubview:v3->_backgroundImageView];

    v20 = [(EKExpandedReminderStackCell *)v3 contentView];
    [v20 sendSubviewToBack:v3->_backgroundImageView];

    objc_initWeak(&location, v3);
    v21 = (void *)MEMORY[0x1E4FB13F0];
    v93[0] = MEMORY[0x1E4F143A8];
    v93[1] = 3221225472;
    v93[2] = __45__EKExpandedReminderStackCell_initWithFrame___block_invoke;
    v93[3] = &unk_1E6088B78;
    objc_copyWeak(&v94, &location);
    v90 = [v21 actionWithHandler:v93];
    v22 = (void *)MEMORY[0x1E4FB14D0];
    v23 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    uint64_t v24 = [v22 buttonWithConfiguration:v23 primaryAction:v90];
    circle = v3->_circle;
    v3->_circle = (UIButton *)v24;

    [(UIButton *)v3->_circle setExclusiveTouch:1];
    LODWORD(v26) = 1148846080;
    [(UIButton *)v3->_circle setContentCompressionResistancePriority:0 forAxis:v26];
    [(UIButton *)v3->_circle setTranslatesAutoresizingMaskIntoConstraints:0];
    v27 = [(EKExpandedReminderStackCell *)v3 contentView];
    [v27 addSubview:v3->_circle];

    v28 = [(UILabel *)v3->_title topAnchor];
    v29 = [(UIView *)v3->_backgroundColorView topAnchor];
    v92 = [v28 constraintEqualToAnchor:v29 constant:11.0];

    LODWORD(v30) = 1132068864;
    [v92 setPriority:v30];
    v31 = [(UILabel *)v3->_time bottomAnchor];
    v32 = [(UIView *)v3->_backgroundColorView bottomAnchor];
    v91 = [v31 constraintEqualToAnchor:v32 constant:-11.0];

    LODWORD(v33) = 1132068864;
    [v91 setPriority:v33];
    v44 = (void *)MEMORY[0x1E4F28DC8];
    v89 = [(UIButton *)v3->_circle leadingAnchor];
    v88 = [(UIView *)v3->_backgroundColorView leadingAnchor];
    v87 = [v89 constraintEqualToAnchor:v88 constant:11.0];
    v97[0] = v87;
    v86 = [(UIButton *)v3->_circle firstBaselineAnchor];
    v85 = [(UILabel *)v3->_title firstBaselineAnchor];
    v84 = [v86 constraintEqualToAnchor:v85];
    v97[1] = v84;
    v83 = [(UILabel *)v3->_title leadingAnchor];
    v82 = [(UIButton *)v3->_circle trailingAnchor];
    v81 = [v83 constraintEqualToAnchor:v82 constant:10.0];
    v97[2] = v81;
    v80 = [(UILabel *)v3->_title trailingAnchor];
    v79 = [(UIView *)v3->_backgroundColorView trailingAnchor];
    v78 = [v80 constraintLessThanOrEqualToAnchor:v79 constant:-11.0];
    v97[3] = v78;
    v77 = [(UILabel *)v3->_time leadingAnchor];
    v76 = [(UIButton *)v3->_circle trailingAnchor];
    v75 = [v77 constraintEqualToAnchor:v76 constant:10.0];
    v97[4] = v75;
    v74 = [(UILabel *)v3->_time trailingAnchor];
    v73 = [(UIView *)v3->_backgroundColorView trailingAnchor];
    v72 = [v74 constraintLessThanOrEqualToAnchor:v73 constant:-11.0];
    v97[5] = v72;
    v71 = [(UILabel *)v3->_time topAnchor];
    v70 = [(UILabel *)v3->_title bottomAnchor];
    v69 = [v71 constraintEqualToAnchor:v70 constant:2.0];
    v97[6] = v69;
    v97[7] = v92;
    v97[8] = v91;
    v67 = [(UIView *)v3->_backgroundColorView leadingAnchor];
    v68 = [(EKExpandedReminderStackCell *)v3 contentView];
    v66 = [v68 leadingAnchor];
    v65 = [v67 constraintEqualToAnchor:v66];
    v97[9] = v65;
    v63 = [(UIView *)v3->_backgroundColorView topAnchor];
    v64 = [(EKExpandedReminderStackCell *)v3 contentView];
    v62 = [v64 topAnchor];
    v61 = [v63 constraintEqualToAnchor:v62];
    v97[10] = v61;
    v59 = [(UIView *)v3->_backgroundColorView trailingAnchor];
    v60 = [(EKExpandedReminderStackCell *)v3 contentView];
    v58 = [v60 trailingAnchor];
    v57 = [v59 constraintEqualToAnchor:v58];
    v97[11] = v57;
    v55 = [(UIView *)v3->_backgroundColorView bottomAnchor];
    v56 = [(EKExpandedReminderStackCell *)v3 contentView];
    v54 = [v56 bottomAnchor];
    v53 = [v55 constraintEqualToAnchor:v54];
    v97[12] = v53;
    v51 = [(UIImageView *)v3->_backgroundImageView leadingAnchor];
    v52 = [(EKExpandedReminderStackCell *)v3 contentView];
    v50 = [v52 leadingAnchor];
    v49 = [v51 constraintEqualToAnchor:v50];
    v97[13] = v49;
    v47 = [(UIImageView *)v3->_backgroundImageView topAnchor];
    v48 = [(EKExpandedReminderStackCell *)v3 contentView];
    v46 = [v48 topAnchor];
    v45 = [v47 constraintEqualToAnchor:v46];
    v97[14] = v45;
    v34 = [(UIImageView *)v3->_backgroundImageView trailingAnchor];
    v35 = [(EKExpandedReminderStackCell *)v3 contentView];
    v36 = [v35 trailingAnchor];
    v37 = [v34 constraintEqualToAnchor:v36];
    v97[15] = v37;
    v38 = [(UIImageView *)v3->_backgroundImageView bottomAnchor];
    v39 = [(EKExpandedReminderStackCell *)v3 contentView];
    v40 = [v39 bottomAnchor];
    v41 = [v38 constraintEqualToAnchor:v40];
    v97[16] = v41;
    v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:17];
    [v44 activateConstraints:v42];

    objc_destroyWeak(&v94);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __45__EKExpandedReminderStackCell_initWithFrame___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 81);
    [v2 reminderToggled:v3];

    WeakRetained = v3;
  }
}

+ (id)exampleCell
{
  id v2 = [EKExpandedReminderStackCell alloc];
  v3 = -[EKExpandedReminderStackCell initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v4 = [MEMORY[0x1E4F1C9C8] now];
  v5 = [MEMORY[0x1E4FB1618] blueColor];
  uint64_t v6 = *MEMORY[0x1E4F57AA0];
  v7 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(EKExpandedReminderStackCell *)v3 setupCellWithTitle:@"Example" completed:0 editable:1 date:v4 buttonColor:v5 buttonImageName:v6 backgroundColor:v7 recurringString:@"Daily" delegate:0];

  return v3;
}

- (void)setupCellWithTitle:(id)a3 completed:(BOOL)a4 editable:(BOOL)a5 date:(id)a6 buttonColor:(id)a7 buttonImageName:(id)a8 backgroundColor:(id)a9 recurringString:(id)a10 delegate:(id)a11
{
  BOOL v14 = a5;
  BOOL v15 = a4;
  id v55 = a3;
  id v54 = a10;
  id v17 = a9;
  id v51 = a8;
  id v52 = a7;
  id v18 = a6;
  objc_storeWeak((id *)&self->_delegate, a11);
  [(UIView *)self->_backgroundColorView setBackgroundColor:v17];

  [(UILabel *)self->_title setText:v55];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v20 = *MEMORY[0x1E4FB28C8];
  v21 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  uint64_t v22 = *MEMORY[0x1E4FB06F8];
  [v19 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  uint64_t v49 = v22;
  if (!v14 || v15)
  {
    uint64_t v23 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  }
  else
  {
    uint64_t v23 = [MEMORY[0x1E4FB1618] labelColor];
  }
  uint64_t v24 = (void *)v23;
  uint64_t v25 = *MEMORY[0x1E4FB0700];
  [v19 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

  v50 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v55 attributes:v19];
  -[UILabel setAttributedText:](self->_title, "setAttributedText:");
  id v26 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v26 setTimeStyle:1];
  [v26 setDateStyle:0];
  [v26 setDoesRelativeDateFormatting:1];
  v53 = [v26 stringFromDate:v18];

  if (v54)
  {
    v27 = (void *)MEMORY[0x1E4FB0870];
    v28 = [MEMORY[0x1E4FB1818] systemImageNamed:@"repeat"];
    v48 = [v27 textAttachmentWithImage:v28];

    v29 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v48];
    id v30 = objc_alloc(MEMORY[0x1E4F28B18]);
    v31 = EventKitUIBundle();
    v32 = [v31 localizedStringForKey:@"%@, %@ %@", &stru_1F0CC2140, 0 value table];
    id v33 = v26;
    v34 = self;
    uint64_t v35 = v25;
    id v36 = v19;
    uint64_t v37 = v20;
    v38 = (void *)[v30 initWithString:v32];

    unint64_t v39 = 0x1E4FB1000;
    v40 = objc_msgSend(MEMORY[0x1E4F28E48], "localizedAttributedStringWithFormat:", v38, v53, v29, v54);

    uint64_t v20 = v37;
    id v19 = v36;
    uint64_t v25 = v35;
    self = v34;
    id v26 = v33;
  }
  else
  {
    unint64_t v39 = 0x1E4FB1000uLL;
    v40 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v53];
  }
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v42 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [v41 setObject:v42 forKeyedSubscript:v49];

  v43 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v41 setObject:v43 forKeyedSubscript:v25];

  objc_msgSend(v40, "addAttributes:range:", v41, 0, objc_msgSend(v40, "length"));
  [(UILabel *)self->_time setAttributedText:v40];
  v44 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  [v44 contentInsets];
  objc_msgSend(v44, "setContentInsets:");
  v45 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:v20 weight:*MEMORY[0x1E4FB09E0]];
  v46 = [MEMORY[0x1E4FB1830] configurationWithFont:v45 scale:3];
  v47 = [*(id *)(v39 + 2072) systemImageNamed:v51 withConfiguration:v46];

  [v44 setImage:v47];
  [v44 setBaseForegroundColor:v52];

  [(UIButton *)self->_circle setConfiguration:v44];
}

- (void)setVisibleForExpandingAnimation:(BOOL)a3
{
  circle = self->_circle;
  if (a3)
  {
    [(UIButton *)circle setAlpha:1.0];
    [(UILabel *)self->_title setAlpha:1.0];
    [(UILabel *)self->_time setAlpha:1.0];
    v5 = [(UIView *)self->_backgroundColorView layer];
    [v5 setCornerRadius:12.0];

    [(UIView *)self->_backgroundColorView setAlpha:1.0];
    p_backgroundImageView = (void **)&self->_backgroundImageView;
  }
  else
  {
    [(UIButton *)circle setAlpha:0.0];
    [(UILabel *)self->_title setAlpha:0.0];
    [(UILabel *)self->_time setAlpha:0.0];
    p_backgroundImageView = (void **)&self->_backgroundColorView;
    v7 = [(UIView *)self->_backgroundColorView layer];
    [v7 setCornerRadius:0.0];

    [(UIImageView *)self->_backgroundImageView setAlpha:1.0];
  }
  v8 = *p_backgroundImageView;

  [v8 setAlpha:0.0];
}

- (UIImageView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)setBackgroundImageView:(id)a3
{
}

- (UIView)backgroundColorView
{
  return self->_backgroundColorView;
}

- (void)setBackgroundColorView:(id)a3
{
}

- (UILabel)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (UILabel)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
}

- (UIButton)circle
{
  return self->_circle;
}

- (void)setCircle:(id)a3
{
}

- (UIImageView)recurringImageView
{
  return self->_recurringImageView;
}

- (void)setRecurringImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recurringImageView, 0);
  objc_storeStrong((id *)&self->_circle, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_backgroundColorView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_eventIdentifer, 0);
}

@end