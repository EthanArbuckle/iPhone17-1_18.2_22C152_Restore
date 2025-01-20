@interface _SFQRImagePreviewViewController
- (BCSAction)action;
- (_SFQRImagePreviewViewController)initWithElementInfo:(id)a3;
- (id)_contentViewSubtitleWithAction:(id)a3;
- (void)loadView;
@end

@implementation _SFQRImagePreviewViewController

- (_SFQRImagePreviewViewController)initWithElementInfo:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFQRImagePreviewViewController;
  v6 = [(_SFQRImagePreviewViewController *)&v12 initWithNibName:0 bundle:0];
  if (v6)
  {
    v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v6->_imageView;
    v6->_imageView = v7;

    v9 = [v5 image];
    [(UIImageView *)v6->_imageView setImage:v9];

    objc_storeStrong((id *)&v6->_activatedElementInfo, a3);
    v10 = v6;
  }

  return v6;
}

- (BCSAction)action
{
  v3 = +[_SFQRCodeDetectionController sharedController];
  v4 = [v3 actionForElement:self->_activatedElementInfo];

  return (BCSAction *)v4;
}

- (id)_contentViewSubtitleWithAction:(id)a3
{
  id v3 = a3;
  v4 = [v3 urlThatCanBeOpened];

  if (v4)
  {
    id v5 = [v3 urlThatCanBeOpened];
    v4 = objc_msgSend(v5, "safari_userVisibleString");
  }

  return v4;
}

- (void)loadView
{
  v82[12] = *MEMORY[0x1E4F143B8];
  v81.receiver = self;
  v81.super_class = (Class)_SFQRImagePreviewViewController;
  [(_SFQRImagePreviewViewController *)&v81 loadView];
  id v3 = [(_SFQRImagePreviewViewController *)self view];
  v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  id v9 = [(UIImageView *)self->_imageView image];
  v10 = (CGImage *)[v9 CGImage];

  double Width = (double)CGImageGetWidth(v10);
  size_t Height = CGImageGetHeight(v10);
  double v13 = Width / (double)Height;
  double v14 = v6 / v8;
  double v15 = v8 / (double)Height * Width;
  if (v13 >= v6 / v8) {
    double v15 = v6;
  }
  if (v13 > v14) {
    double v16 = v6 / Width * (double)Height;
  }
  else {
    double v16 = v8;
  }
  if (v13 > v14) {
    double v17 = v6;
  }
  else {
    double v17 = v15;
  }
  [(UIImageView *)self->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
  imageView = self->_imageView;
  id v19 = v3;
  [v19 addSubview:imageView];
  v20 = [MEMORY[0x1E4FB1618] whiteColor];
  [v19 setBackgroundColor:v20];

  v21 = [SFQRImageHeaderView alloc];
  v22 = -[SFQRImageHeaderView initWithFrame:](v21, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v23 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(SFQRImageHeaderView *)v22 setBackgroundColor:v23];

  v80 = [(_SFQRImagePreviewViewController *)self action];
  [(SFQRImageHeaderView *)v22 setAction:v80];
  [(SFQRImageHeaderView *)v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  v24 = v22;
  [v19 addSubview:v22];
  v25 = [SFQRImageContentView alloc];
  v26 = [v80 localizedDefaultActionDescription];
  v27 = [(_SFQRImagePreviewViewController *)self _contentViewSubtitleWithAction:v80];
  v28 = [(SFQRImageContentView *)v25 initWithTitle:v26 subtitle:v27];

  v29 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(SFQRImageContentView *)v28 setBackgroundColor:v29];

  v30 = [(_SFQRImagePreviewViewController *)self view];
  [v30 bounds];
  -[SFQRImageContentView sizeThatFits:](v28, "sizeThatFits:", v31, v32);
  double v34 = v33;

  [(SFQRImageContentView *)v28 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v19 addSubview:v28];
  -[_SFQRImagePreviewViewController setPreferredContentSize:](self, "setPreferredContentSize:", fmin(v6, v8), v16 + 56.0 + v34);
  v65 = (void *)MEMORY[0x1E4F28DC8];
  v35 = self->_imageView;
  v79 = [(SFQRImageHeaderView *)v24 topAnchor];
  v78 = [v19 topAnchor];
  v77 = [v79 constraintEqualToAnchor:v78];
  v82[0] = v77;
  v75 = [(SFQRImageHeaderView *)v24 heightAnchor];
  v74 = [v75 constraintEqualToConstant:56.0];
  v82[1] = v74;
  v76 = v24;
  v73 = [(SFQRImageHeaderView *)v24 widthAnchor];
  v72 = [v19 widthAnchor];
  v71 = [v73 constraintEqualToAnchor:v72];
  v82[2] = v71;
  v70 = [(SFQRImageHeaderView *)v24 bottomAnchor];
  v36 = v35;
  v63 = v35;
  v69 = [(UIImageView *)v35 topAnchor];
  v68 = [v70 constraintEqualToAnchor:v69];
  v82[3] = v68;
  v37 = [(UIImageView *)self->_imageView widthAnchor];
  v67 = v37;
  uint64_t v38 = [(UIImageView *)self->_imageView heightAnchor];
  v66 = (void *)v38;
  double v39 = v17 / v16;
  if (v16 == 0.0) {
    double v39 = 1.0;
  }
  v64 = [v37 constraintEqualToAnchor:v38 multiplier:v39];
  v82[4] = v64;
  v62 = [(UIImageView *)v36 leftAnchor];
  v61 = [v19 leftAnchor];
  v60 = [v62 constraintGreaterThanOrEqualToAnchor:v61];
  v82[5] = v60;
  v58 = [(UIImageView *)v36 rightAnchor];
  v57 = [v19 rightAnchor];
  v56 = [v58 constraintLessThanOrEqualToAnchor:v57];
  v82[6] = v56;
  v55 = [(UIImageView *)v36 centerXAnchor];
  v54 = [v19 centerXAnchor];
  v53 = [v55 constraintEqualToAnchor:v54];
  v82[7] = v53;
  v52 = [(UIImageView *)v36 bottomAnchor];
  v40 = v28;
  v51 = [(SFQRImageContentView *)v28 topAnchor];
  v50 = [v52 constraintEqualToAnchor:v51];
  v82[8] = v50;
  v41 = [(SFQRImageContentView *)v28 heightAnchor];
  v42 = [v41 constraintEqualToConstant:v34];
  v82[9] = v42;
  v59 = v28;
  v43 = [(SFQRImageContentView *)v28 widthAnchor];
  v44 = [v19 widthAnchor];
  v45 = [v43 constraintEqualToAnchor:v44];
  v82[10] = v45;
  v46 = [(SFQRImageContentView *)v40 bottomAnchor];
  v47 = [v19 bottomAnchor];

  v48 = [v46 constraintEqualToAnchor:v47];
  v82[11] = v48;
  v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:12];
  [v65 activateConstraints:v49];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activatedElementInfo, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end