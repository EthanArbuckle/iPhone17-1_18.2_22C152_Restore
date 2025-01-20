@interface UIProgressFooterView
- (BOOL)progressIsComplete;
- (UILabel)assetLabel;
- (UILabel)detailProgressLabel;
- (UIProgressFooterView)initWithSpecifier:(id)a3;
- (UIProgressView)progressView;
- (double)preferredHeightForWidth:(double)a3;
- (void)clearProgress;
- (void)refreshContentsWithSpecifier:(id)a3;
- (void)setAssetLabel:(id)a3;
- (void)setDetailProgressLabel:(id)a3;
- (void)setProgressView:(id)a3;
- (void)setupSubviewsAndConstraints;
@end

@implementation UIProgressFooterView

- (UIProgressFooterView)initWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = -[UIProgressFooterView initWithFrame:](self, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v6 = v5;
  if (v5)
  {
    [(UIProgressFooterView *)v5 setupSubviewsAndConstraints];
    [(UIProgressFooterView *)v6 refreshContentsWithSpecifier:v4];
  }

  return v6;
}

- (BOOL)progressIsComplete
{
  v2 = [(UIProgressFooterView *)self progressView];
  [v2 progress];
  BOOL v4 = v3 == 1.0;

  return v4;
}

- (void)clearProgress
{
  float v3 = [(UIProgressFooterView *)self progressView];
  [v3 setProgress:0.0];

  BOOL v4 = [(UIProgressFooterView *)self assetLabel];
  [v4 setText:&stru_26DCD2B00];

  id v5 = [(UIProgressFooterView *)self detailProgressLabel];
  [v5 setText:&stru_26DCD2B00];
}

- (void)refreshContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [v4 propertyForKey:@"AUSettingsProgressKeyBytesSent"];
  v6 = [v4 propertyForKey:@"AUSettingsProgressKeyBytesTotal"];
  if ([v5 longValue] >= 1
    && [v6 longValue] >= 1
    && (uint64_t v7 = [v5 longValue], v7 <= objc_msgSend(v6, "longValue")))
  {
    float v14 = (float)[v5 longValue];
    float v15 = v14 / (float)[v6 longValue];
    v11 = [(UIProgressFooterView *)self progressView];
    v12 = v11;
    *(float *)&double v13 = v15;
  }
  else
  {
    v8 = [(UIProgressFooterView *)self progressView];
    [v8 progress];
    float v10 = v9;

    if (v10 != 0.0) {
      goto LABEL_8;
    }
    v11 = [(UIProgressFooterView *)self progressView];
    v12 = v11;
    LODWORD(v13) = 1008981770;
  }
  [v11 setProgress:0 animated:v13];

LABEL_8:
  BOOL v16 = [(UIProgressFooterView *)self progressIsComplete];
  v17 = @"Staging";
  if (v16) {
    v17 = @"Completed";
  }
  v18 = v17;
  BOOL v19 = [(UIProgressFooterView *)self progressIsComplete];
  v20 = @"...";
  if (v19) {
    v20 = &stru_26DCD2B00;
  }
  v21 = v20;
  v22 = [v4 propertyForKey:@"kAUSettingsProgressActiveSerialNumber"];
  v23 = [NSString stringWithFormat:@"%@: (%@ / %@ bytes)", v22, v5, v6];
  if ([(UIProgressFooterView *)self progressIsComplete])
  {
    dispatch_time_t v24 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__UIProgressFooterView_refreshContentsWithSpecifier___block_invoke;
    block[3] = &unk_264839E58;
    block[4] = self;
    v33 = v18;
    id v34 = v4;
    v35 = v21;
    id v36 = v23;
    dispatch_after(v24, MEMORY[0x263EF83A0], block);
  }
  else
  {
    v25 = NSString;
    [v4 propertyForKey:@"AUSettingsProgressKeyBuild"];
    v31 = v5;
    v27 = v26 = v6;
    v28 = [v25 stringWithFormat:@"%@ %@ %@", v18, v27, v21];
    v29 = [(UIProgressFooterView *)self assetLabel];
    [v29 setText:v28];

    v6 = v26;
    id v5 = v31;
    v30 = [(UIProgressFooterView *)self detailProgressLabel];
    [v30 setText:v23];
  }
}

void __53__UIProgressFooterView_refreshContentsWithSpecifier___block_invoke(uint64_t a1)
{
  v2 = NSString;
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) propertyForKey:@"AUSettingsProgressKeyBuild"];
  id v5 = [v2 stringWithFormat:@"%@ %@ %@", v3, v4, *(void *)(a1 + 56)];
  v6 = [*(id *)(a1 + 32) assetLabel];
  [v6 setText:v5];

  uint64_t v7 = *(void *)(a1 + 64);
  id v8 = [*(id *)(a1 + 32) detailProgressLabel];
  [v8 setText:v7];
}

- (void)setupSubviewsAndConstraints
{
  id v3 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(UIProgressFooterView *)self setAssetLabel:v3];

  id v4 = [(UIProgressFooterView *)self assetLabel];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v5 = [MEMORY[0x263F1C550] clearColor];
  v6 = [(UIProgressFooterView *)self assetLabel];
  [v6 setBackgroundColor:v5];

  uint64_t v7 = [MEMORY[0x263F1C550] grayColor];
  id v8 = [(UIProgressFooterView *)self assetLabel];
  [v8 setTextColor:v7];

  float v9 = [(UIProgressFooterView *)self contentView];
  float v10 = [(UIProgressFooterView *)self assetLabel];
  [v9 addSubview:v10];

  v11 = (void *)[objc_alloc(MEMORY[0x263F1C8E0]) initWithProgressViewStyle:0];
  [(UIProgressFooterView *)self setProgressView:v11];

  v12 = [(UIProgressFooterView *)self progressView];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v13 = [(UIProgressFooterView *)self progressView];
  float v14 = v13;
  if (v13) {
    [v13 transform];
  }
  else {
    memset(&v70, 0, sizeof(v70));
  }
  CGAffineTransformScale(&v71, &v70, 1.0, 2.0);
  float v15 = [(UIProgressFooterView *)self progressView];
  CGAffineTransform v69 = v71;
  [v15 setTransform:&v69];

  BOOL v16 = [(UIProgressFooterView *)self progressView];
  [v16 setProgress:0.0];

  v17 = [(UIProgressFooterView *)self contentView];
  v18 = [(UIProgressFooterView *)self progressView];
  [v17 addSubview:v18];

  id v19 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(UIProgressFooterView *)self setDetailProgressLabel:v19];

  v20 = [(UIProgressFooterView *)self detailProgressLabel];
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

  v21 = [MEMORY[0x263F1C550] clearColor];
  v22 = [(UIProgressFooterView *)self detailProgressLabel];
  [v22 setBackgroundColor:v21];

  v23 = [MEMORY[0x263F1C550] grayColor];
  dispatch_time_t v24 = [(UIProgressFooterView *)self detailProgressLabel];
  [v24 setTextColor:v23];

  v25 = [(UIProgressFooterView *)self detailProgressLabel];
  v26 = [v25 font];
  v27 = [v26 fontWithSize:14.0];
  v28 = [(UIProgressFooterView *)self detailProgressLabel];
  [v28 setFont:v27];

  v29 = [(UIProgressFooterView *)self detailProgressLabel];
  [v29 setTextAlignment:1];

  v30 = [(UIProgressFooterView *)self contentView];
  v31 = [(UIProgressFooterView *)self detailProgressLabel];
  [v30 addSubview:v31];

  v32 = [MEMORY[0x263EFF980] array];
  v33 = (void *)MEMORY[0x263F08938];
  id v34 = [(UIProgressFooterView *)self assetLabel];
  v35 = [(UIProgressFooterView *)self contentView];
  id v36 = [v33 constraintWithItem:v34 attribute:3 relatedBy:0 toItem:v35 attribute:3 multiplier:1.0 constant:20.0];
  [v32 addObject:v36];

  v37 = (void *)MEMORY[0x263F08938];
  v38 = [(UIProgressFooterView *)self assetLabel];
  v39 = [(UIProgressFooterView *)self contentView];
  v40 = [v37 constraintWithItem:v38 attribute:5 relatedBy:0 toItem:v39 attribute:5 multiplier:1.0 constant:20.0];
  [v32 addObject:v40];

  v41 = (void *)MEMORY[0x263F08938];
  v42 = [(UIProgressFooterView *)self assetLabel];
  v43 = [(UIProgressFooterView *)self contentView];
  v44 = [v41 constraintWithItem:v42 attribute:6 relatedBy:0 toItem:v43 attribute:6 multiplier:1.0 constant:-5.0];
  [v32 addObject:v44];

  v45 = (void *)MEMORY[0x263F08938];
  v46 = [(UIProgressFooterView *)self progressView];
  v47 = [(UIProgressFooterView *)self assetLabel];
  v48 = [v45 constraintWithItem:v46 attribute:3 relatedBy:1 toItem:v47 attribute:4 multiplier:1.0 constant:10.0];
  [v32 addObject:v48];

  v49 = (void *)MEMORY[0x263F08938];
  v50 = [(UIProgressFooterView *)self progressView];
  v51 = [(UIProgressFooterView *)self assetLabel];
  v52 = [v49 constraintWithItem:v50 attribute:5 relatedBy:0 toItem:v51 attribute:5 multiplier:1.0 constant:0.0];
  [v32 addObject:v52];

  v53 = (void *)MEMORY[0x263F08938];
  v54 = [(UIProgressFooterView *)self progressView];
  v55 = [(UIProgressFooterView *)self assetLabel];
  v56 = [v53 constraintWithItem:v54 attribute:6 relatedBy:0 toItem:v55 attribute:6 multiplier:1.0 constant:0.0];
  [v32 addObject:v56];

  v57 = (void *)MEMORY[0x263F08938];
  v58 = [(UIProgressFooterView *)self detailProgressLabel];
  v59 = [(UIProgressFooterView *)self progressView];
  v60 = [v57 constraintWithItem:v58 attribute:3 relatedBy:1 toItem:v59 attribute:4 multiplier:1.0 constant:10.0];
  [v32 addObject:v60];

  v61 = (void *)MEMORY[0x263F08938];
  v62 = [(UIProgressFooterView *)self detailProgressLabel];
  v63 = [(UIProgressFooterView *)self progressView];
  v64 = [v61 constraintWithItem:v62 attribute:5 relatedBy:0 toItem:v63 attribute:5 multiplier:1.0 constant:0.0];
  [v32 addObject:v64];

  v65 = (void *)MEMORY[0x263F08938];
  v66 = [(UIProgressFooterView *)self detailProgressLabel];
  v67 = [(UIProgressFooterView *)self progressView];
  v68 = [v65 constraintWithItem:v66 attribute:6 relatedBy:0 toItem:v67 attribute:6 multiplier:1.0 constant:0.0];
  [v32 addObject:v68];

  [MEMORY[0x263F08938] activateConstraints:v32];
}

- (double)preferredHeightForWidth:(double)a3
{
  [(UIProgressFooterView *)self layoutMargins];
  double v6 = a3 - v5;
  [(UIProgressFooterView *)self layoutMargins];
  double v8 = v6 - v7;
  float v9 = [(UIProgressFooterView *)self assetLabel];
  objc_msgSend(v9, "sizeThatFits:", v8, 3.40282347e38);
  double v11 = v10;

  v12 = [(UIProgressFooterView *)self progressView];
  objc_msgSend(v12, "sizeThatFits:", v8, 3.40282347e38);
  double v14 = v13;

  float v15 = [(UIProgressFooterView *)self detailProgressLabel];
  objc_msgSend(v15, "sizeThatFits:", v8, 3.40282347e38);
  double v17 = v16;

  [(UIProgressFooterView *)self layoutMargins];
  double v19 = v11 + v14 + v17 + v18;
  [(UIProgressFooterView *)self layoutMargins];
  return v19 + v20 + 20.0;
}

- (UILabel)assetLabel
{
  return self->_assetLabel;
}

- (void)setAssetLabel:(id)a3
{
}

- (UIProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
}

- (UILabel)detailProgressLabel
{
  return self->_detailProgressLabel;
}

- (void)setDetailProgressLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailProgressLabel, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_assetLabel, 0);
}

@end