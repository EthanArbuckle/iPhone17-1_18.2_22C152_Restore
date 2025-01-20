@interface MKLookAroundContainerBadgeView
- (MKLookAroundContainerBadgeView)initWithFrame:(CGRect)a3;
@end

@implementation MKLookAroundContainerBadgeView

- (MKLookAroundContainerBadgeView)initWithFrame:(CGRect)a3
{
  v51[3] = *MEMORY[0x1E4F143B8];
  v48.receiver = self;
  v48.super_class = (Class)MKLookAroundContainerBadgeView;
  v3 = -[MKLookAroundContainerBadgeView initWithFrame:](&v48, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MKLookAroundContainerBadgeView *)v3 setAccessibilityIdentifier:@"LookAroundContainerBadge"];
    v47 = [MEMORY[0x1E4F42A80] systemImageNamed:@"binoculars.fill"];
    v46 = [MEMORY[0x1E4F42698] textAttachmentWithImage:v47];
    id v5 = objc_alloc_init(MEMORY[0x1E4F42680]);
    v6 = [MEMORY[0x1E4F428B8] blackColor];
    v7 = [v6 colorWithAlphaComponent:0.5];
    [v5 setShadowColor:v7];

    [v5 setShadowBlurRadius:4.0];
    v45 = v5;
    objc_msgSend(v5, "setShadowOffset:", 0.0, 1.0);
    v8 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v46];
    v9 = (void *)[v8 mutableCopy];

    v10 = (void *)MEMORY[0x1E4F42A30];
    uint64_t v11 = *MEMORY[0x1E4F438C8];
    v12 = [MEMORY[0x1E4F42F80] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x1E4F437B0]];
    v44 = [v10 preferredFontForTextStyle:v11 compatibleWithTraitCollection:v12];

    uint64_t v13 = *MEMORY[0x1E4F42508];
    v50[0] = *MEMORY[0x1E4F42560];
    v50[1] = v13;
    v51[0] = v5;
    v51[1] = v44;
    v50[2] = *MEMORY[0x1E4F42510];
    v14 = [MEMORY[0x1E4F428B8] whiteColor];
    v51[2] = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:3];
    v43 = v9;
    objc_msgSend(v9, "addAttributes:range:", v15, 0, objc_msgSend(v9, "length"));

    v16 = [_MKUILabel alloc];
    uint64_t v17 = -[_MKUILabel initWithFrame:](v16, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    label = v4->_label;
    v4->_label = (_MKUILabel *)v17;

    [(_MKUILabel *)v4->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_MKUILabel *)v4->_label setAttributedText:v9];
    [(_MKUILabel *)v4->_label setTextAlignment:1];
    [(MKLookAroundContainerBadgeView *)v4 addSubview:v4->_label];
    -[_MKUILabel systemLayoutSizeFittingSize:](v4->_label, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F43B90], *(double *)(MEMORY[0x1E4F43B90] + 8));
    double v20 = v19;
    double v22 = v21;
    v36 = (void *)MEMORY[0x1E4F28DC8];
    v42 = [(_MKUILabel *)v4->_label topAnchor];
    v41 = [(MKLookAroundContainerBadgeView *)v4 topAnchor];
    v40 = [v42 constraintEqualToAnchor:v41 constant:-2.0];
    v49[0] = v40;
    v39 = [(_MKUILabel *)v4->_label bottomAnchor];
    v38 = [(MKLookAroundContainerBadgeView *)v4 bottomAnchor];
    v37 = [v39 constraintEqualToAnchor:v38 constant:6.0];
    v49[1] = v37;
    v35 = [(_MKUILabel *)v4->_label leadingAnchor];
    v34 = [(MKLookAroundContainerBadgeView *)v4 leadingAnchor];
    v23 = [v35 constraintEqualToAnchor:v34 constant:-6.0];
    v49[2] = v23;
    v24 = [(_MKUILabel *)v4->_label trailingAnchor];
    v25 = [(MKLookAroundContainerBadgeView *)v4 trailingAnchor];
    v26 = [v24 constraintEqualToAnchor:v25 constant:6.0];
    v49[3] = v26;
    v27 = [(_MKUILabel *)v4->_label widthAnchor];
    v28 = [v27 constraintEqualToConstant:v20 + 8.0];
    v49[4] = v28;
    v29 = [(_MKUILabel *)v4->_label heightAnchor];
    v30 = [v29 constraintEqualToConstant:v22 + 8.0];
    v49[5] = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:6];
    [v36 activateConstraints:v31];

    v32 = v4;
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end