@interface CNContactListDuplicatesBannerView
- (CNContactListDuplicatesBannerView)initWithDuplicatesCount:(int64_t)a3;
- (CNContactListDuplicatesBannerViewDelegate)delegate;
- (UILabel)titleLabel;
- (id)countStringForLocalizedStringKey:(id)a3 count:(int64_t)a4;
- (int64_t)duplicatesCount;
- (void)didTapDismiss;
- (void)didTapViewDuplicates;
- (void)setDelegate:(id)a3;
- (void)setDuplicatesCount:(int64_t)a3;
- (void)setTitleLabel:(id)a3;
- (void)setupSubviews;
@end

@implementation CNContactListDuplicatesBannerView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setDelegate:(id)a3
{
}

- (CNContactListDuplicatesBannerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNContactListDuplicatesBannerViewDelegate *)WeakRetained;
}

- (int64_t)duplicatesCount
{
  return self->_duplicatesCount;
}

- (void)didTapViewDuplicates
{
  id v3 = [(CNContactListDuplicatesBannerView *)self delegate];
  [v3 duplicatesBannerViewDidTapViewDuplicates:self];
}

- (void)didTapDismiss
{
  id v3 = [(CNContactListDuplicatesBannerView *)self delegate];
  [v3 duplicatesBannerViewDidTapDismiss:self];
}

- (id)countStringForLocalizedStringKey:(id)a3 count:(int64_t)a4
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__CNContactListDuplicatesBannerView_countStringForLocalizedStringKey_count___block_invoke;
  aBlock[3] = &unk_1E549A528;
  id v13 = v5;
  int64_t v14 = a4;
  id v6 = v5;
  v7 = (void (**)(void))_Block_copy(aBlock);
  v8 = NSString;
  v9 = v7[2]();
  v10 = objc_msgSend(v8, "localizedStringWithFormat:", v9, a4);

  return v10;
}

id __76__CNContactListDuplicatesBannerView_countStringForLocalizedStringKey_count___block_invoke(uint64_t a1)
{
  v2 = +[CNNumberFormatting localizedStringWithInteger:*(void *)(a1 + 40)];
  id v3 = NSString;
  v4 = CNContactsUIBundle();
  id v5 = [v4 localizedStringForKey:*(void *)(a1 + 32) value:&stru_1ED8AC728 table:@"Localized"];
  id v6 = objc_msgSend(v3, "localizedStringWithFormat:", v5, *(void *)(a1 + 40), v2);

  return v6;
}

- (void)setupSubviews
{
  v94[2] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  [(CNContactListDuplicatesBannerView *)self setBackgroundColor:v3];

  v4 = [(CNContactListDuplicatesBannerView *)self layer];
  [v4 setCornerRadius:12.0];

  id v5 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  id v6 = [(CNContactListDuplicatesBannerView *)self countStringForLocalizedStringKey:@"DUPLICATES_COUNT" count:self->_duplicatesCount];
  [v5 setText:v6];

  v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  [v5 setFont:v7];

  [v5 setNumberOfLines:0];
  [v5 setAdjustsFontForContentSizeCategory:1];
  id v8 = v5;
  v83 = v5;
  [(CNContactListDuplicatesBannerView *)self setTitleLabel:v5];
  id v9 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  v10 = CNContactsUIBundle();
  v11 = [v10 localizedStringForKey:@"DUPLICATES_FOUND_HINT" value:&stru_1ED8AC728 table:@"Localized"];
  [v9 setText:v11];

  v12 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2948]];
  v85 = [v12 fontDescriptorWithSymbolicTraits:0x8000];

  id v13 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v85 size:0.0];
  [v9 setFont:v13];

  int64_t v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v9 setTextColor:v14];

  [v9 setNumberOfLines:0];
  v82 = v9;
  [v9 setAdjustsFontForContentSizeCategory:1];
  id v15 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  v16 = objc_msgSend(v15, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v17 = [MEMORY[0x1E4FB1618] separatorColor];
  [v16 setBackgroundColor:v17];

  v18 = v16;
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v19 = objc_alloc_init(MEMORY[0x1E4FB14D0]);
  v20 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  v21 = CNContactsUIBundle();
  v22 = [v21 localizedStringForKey:@"DUPLICATES_FOUND_ACTION" value:&stru_1ED8AC728 table:@"Localized"];
  [v20 setTitle:v22];

  double v23 = *MEMORY[0x1E4FB12A8];
  double v24 = *(double *)(MEMORY[0x1E4FB12A8] + 8);
  double v25 = *(double *)(MEMORY[0x1E4FB12A8] + 16);
  double v26 = *(double *)(MEMORY[0x1E4FB12A8] + 24);
  v84 = v20;
  objc_msgSend(v20, "setContentInsets:", *MEMORY[0x1E4FB12A8], v24, v25, v26);
  [v19 setConfiguration:v20];
  v81 = v19;
  [v19 addTarget:self action:sel_didTapViewDuplicates forControlEvents:64];
  id v27 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
  [v27 setAxis:1];
  [v27 setAlignment:0];
  v94[0] = v8;
  v94[1] = v9;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:2];
  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = __50__CNContactListDuplicatesBannerView_setupSubviews__block_invoke;
  v89[3] = &unk_1E549A500;
  id v90 = v27;
  id v80 = v27;
  objc_msgSend(v28, "_cn_each:", v89);

  id v29 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
  [v29 setAxis:1];
  [v29 setAlignment:1];
  [v29 setSpacing:10.0];
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
  v93[0] = v80;
  v93[1] = v18;
  v93[2] = v19;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:3];
  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = __50__CNContactListDuplicatesBannerView_setupSubviews__block_invoke_2;
  v87[3] = &unk_1E549A500;
  id v88 = v29;
  id v31 = v29;
  objc_msgSend(v30, "_cn_each:", v87);

  [(CNContactListDuplicatesBannerView *)self addSubview:v31];
  v65 = (void *)MEMORY[0x1E4F28DC8];
  v75 = [v31 leadingAnchor];
  v76 = [(CNContactListDuplicatesBannerView *)self layoutMarginsGuide];
  v74 = [v76 leadingAnchor];
  v73 = [v75 constraintEqualToAnchor:v74 constant:4.0];
  v92[0] = v73;
  v71 = [v31 trailingAnchor];
  v72 = [(CNContactListDuplicatesBannerView *)self layoutMarginsGuide];
  v70 = [v72 trailingAnchor];
  v69 = [v71 constraintEqualToAnchor:v70 constant:-4.0];
  v92[1] = v69;
  v67 = [v31 topAnchor];
  v78 = self;
  v68 = [(CNContactListDuplicatesBannerView *)self layoutMarginsGuide];
  v66 = [v68 topAnchor];
  v64 = [v67 constraintEqualToAnchor:v66 constant:4.0];
  v92[2] = v64;
  v62 = [v31 bottomAnchor];
  v63 = [(CNContactListDuplicatesBannerView *)self layoutMarginsGuide];
  v61 = [v63 bottomAnchor];
  v60 = [v62 constraintEqualToAnchor:v61 constant:-4.0];
  v92[3] = v60;
  v32 = v18;
  v58 = [v18 heightAnchor];
  v59 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v59 scale];
  v34 = [v58 constraintEqualToConstant:1.0 / v33];
  v92[4] = v34;
  v79 = v18;
  v35 = [v18 leadingAnchor];
  v86 = v31;
  v36 = [v31 layoutMarginsGuide];
  v37 = [v36 leadingAnchor];
  v38 = [v35 constraintEqualToAnchor:v37];
  v92[5] = v38;
  v39 = [v32 trailingAnchor];
  v40 = [v31 layoutMarginsGuide];
  v41 = [v40 trailingAnchor];
  v42 = [v39 constraintEqualToAnchor:v41];
  v92[6] = v42;
  v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:7];
  [v65 activateConstraints:v43];

  id v44 = objc_alloc_init(MEMORY[0x1E4FB14D0]);
  v45 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  v46 = (void *)MEMORY[0x1E4FB1818];
  uint64_t v47 = *MEMORY[0x1E4FB2A60];
  v48 = [MEMORY[0x1E4FB1618] systemMidGrayColor];
  v49 = objc_msgSend(v46, "cnui_symbolImageNamed:scale:weight:withColor:useFixedSize:compatibleWithTextStyle:", @"xmark", v47, 4, v48, 1, *MEMORY[0x1E4FB28C8]);
  [v45 setImage:v49];

  objc_msgSend(v45, "setContentInsets:", v23, v24, v25, v26);
  [v44 setConfiguration:v45];
  [v44 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v44 addTarget:v78 action:sel_didTapDismiss forControlEvents:64];
  [(CNContactListDuplicatesBannerView *)v78 addSubview:v44];
  v77 = (void *)MEMORY[0x1E4F28DC8];
  v50 = [v44 trailingAnchor];
  v51 = [v86 trailingAnchor];
  v52 = [v50 constraintEqualToAnchor:v51];
  v91[0] = v52;
  v53 = [v44 topAnchor];
  v54 = [(CNContactListDuplicatesBannerView *)v78 layoutMarginsGuide];
  v55 = [v54 topAnchor];
  v56 = [v53 constraintEqualToAnchor:v55];
  v91[1] = v56;
  v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:2];
  [v77 activateConstraints:v57];
}

uint64_t __50__CNContactListDuplicatesBannerView_setupSubviews__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addArrangedSubview:a2];
}

uint64_t __50__CNContactListDuplicatesBannerView_setupSubviews__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addArrangedSubview:a2];
}

- (void)setDuplicatesCount:(int64_t)a3
{
  if (self->_duplicatesCount != a3)
  {
    self->_duplicatesCount = a3;
    id v5 = [(CNContactListDuplicatesBannerView *)self countStringForLocalizedStringKey:@"DUPLICATES_COUNT" count:a3];
    v4 = [(CNContactListDuplicatesBannerView *)self titleLabel];
    [v4 setText:v5];
  }
}

- (CNContactListDuplicatesBannerView)initWithDuplicatesCount:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CNContactListDuplicatesBannerView;
  v4 = -[CNContactListDuplicatesBannerView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v5 = v4;
  if (v4)
  {
    v4->_duplicatesCount = a3;
    [(CNContactListDuplicatesBannerView *)v4 setupSubviews];
    id v6 = v5;
  }

  return v5;
}

@end