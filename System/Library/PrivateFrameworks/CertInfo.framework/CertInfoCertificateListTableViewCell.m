@interface CertInfoCertificateListTableViewCell
- (CertInfoCertificateListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
- (void)updateWithTrustDescription:(id)a3 certificateIndex:(unint64_t)a4;
@end

@implementation CertInfoCertificateListTableViewCell

- (CertInfoCertificateListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)CertInfoCertificateListTableViewCell;
  v4 = [(CertInfoCertificateListTableViewCell *)&v15 initWithStyle:3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__CertInfoCertificateListTableViewCell_initWithStyle_reuseIdentifier___block_invoke;
    block[3] = &unk_26432C2D0;
    v6 = v4;
    v14 = v6;
    if (initWithStyle_reuseIdentifier__onceToken != -1) {
      dispatch_once(&initWithStyle_reuseIdentifier__onceToken, block);
    }
    v7 = [v6 imageView];
    [v7 setImage:initWithStyle_reuseIdentifier__sBlobImage];

    v8 = [CertInfoCertificateListCellContentView alloc];
    uint64_t v9 = -[CertInfoCertificateListCellContentView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    id v10 = v6[127];
    v6[127] = (id)v9;

    [v6[127] setUserInteractionEnabled:0];
    v11 = [v6 contentView];
    [v11 addSubview:v6[127]];
  }
  return v5;
}

void __70__CertInfoCertificateListTableViewCell_initWithStyle_reuseIdentifier___block_invoke()
{
  id v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v0 = [MEMORY[0x263F1C6B0] imageNamed:@"profiles-list-icon" inBundle:v2];
  v1 = (void *)initWithStyle_reuseIdentifier__sBlobImage;
  initWithStyle_reuseIdentifier__sBlobImage = v0;
}

- (void)updateWithTrustDescription:(id)a3 certificateIndex:(unint64_t)a4
{
  certificateContentView = self->_certificateContentView;
  id v7 = a3;
  v8 = [v7 certificateSubjectSummaryAtIndex:a4];
  [(CertInfoCertificateListCellContentView *)certificateContentView setTitle:v8];

  uint64_t v9 = self->_certificateContentView;
  id v10 = [v7 certificateIssuerSummaryAtIndex:a4];
  [(CertInfoCertificateListCellContentView *)v9 setSubtitle:v10];

  v11 = self->_certificateContentView;
  id v12 = [v7 certificateExpirationDateAtIndex:a4];

  [(CertInfoCertificateListCellContentView *)v11 setExpiration:v12];
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)CertInfoCertificateListTableViewCell;
  [(CertInfoCertificateListTableViewCell *)&v23 layoutSubviews];
  v3 = [(CertInfoCertificateListTableViewCell *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;

  id v12 = [(CertInfoCertificateListTableViewCell *)self imageView];
  [v12 frame];
  double v14 = v13;
  double v16 = v15;

  float v17 = (v11 - v16) * 0.5;
  CGFloat v18 = roundf(v17);
  v19 = [(CertInfoCertificateListTableViewCell *)self imageView];
  objc_msgSend(v19, "setFrame:", 8.0, v18, v14, v16);

  [(CertInfoCertificateListCellContentView *)self->_certificateContentView frame];
  v24.origin.x = 8.0;
  v24.origin.y = v18;
  v24.size.width = v14;
  v24.size.height = v16;
  CGFloat v20 = CGRectGetMaxX(v24) + 8.0;
  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  CGFloat v21 = CGRectGetMinY(v25) + 1.0;
  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  CGFloat v22 = CGRectGetMaxX(v26) - v20 + -9.0;
  v27.origin.x = v5;
  v27.origin.y = v7;
  v27.size.width = v9;
  v27.size.height = v11;
  -[CertInfoCertificateListCellContentView setFrame:](self->_certificateContentView, "setFrame:", v20, v21, v22, CGRectGetHeight(v27) + -1.0);
}

- (void).cxx_destruct
{
}

@end