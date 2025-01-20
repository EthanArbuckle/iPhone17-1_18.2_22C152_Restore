@interface CKCloudSyncStatusView
- (BOOL)hasFinishedFirstLayoutPass;
- (BOOL)isVisibleInViewHierarchy;
- (CKCloudSyncStatusView)initWithFrame:(CGRect)a3;
- (UILabel)progressLabel;
- (UIProgressView)progressView;
- (UIView)containerView;
- (UIView)hairlineView;
- (UIVisualEffectView)backgroundVisualEffectView;
- (void)_configureUI;
- (void)layoutSubviews;
- (void)setBackgroundVisualEffectView:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setHairlineView:(id)a3;
- (void)setHasFinishedFirstLayoutPass:(BOOL)a3;
- (void)setProgressLabel:(id)a3;
- (void)setProgressView:(id)a3;
- (void)updateWithSyncState:(id)a3;
@end

@implementation CKCloudSyncStatusView

- (CKCloudSyncStatusView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKCloudSyncStatusView;
  v3 = -[CKCloudSyncStatusView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_hasFinishedFirstLayoutPass = 0;
    [(CKCloudSyncStatusView *)v3 _configureUI];
  }
  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CKCloudSyncStatusView;
  [(CKCloudSyncStatusView *)&v3 layoutSubviews];
  if (![(CKCloudSyncStatusView *)self hasFinishedFirstLayoutPass]) {
    [(CKCloudSyncStatusView *)self setHasFinishedFirstLayoutPass:1];
  }
}

- (void)_configureUI
{
  v107[4] = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)MEMORY[0x1E4F427D8];
  v4 = +[CKUIBehavior sharedBehaviors];
  v102 = objc_msgSend(v3, "effectWithStyle:", objc_msgSend(v4, "syncBarBlurEffectStyle"));

  v5 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v102];
  [(UIVisualEffectView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CKCloudSyncStatusView *)self addSubview:v5];
  v77 = (void *)MEMORY[0x1E4F28DC8];
  v100 = [(UIVisualEffectView *)v5 leadingAnchor];
  v97 = [(CKCloudSyncStatusView *)self leadingAnchor];
  v93 = [v100 constraintEqualToAnchor:v97];
  v107[0] = v93;
  v87 = [(UIVisualEffectView *)v5 trailingAnchor];
  v82 = [(CKCloudSyncStatusView *)self trailingAnchor];
  objc_super v6 = [v87 constraintEqualToAnchor:v82];
  v107[1] = v6;
  v7 = [(UIVisualEffectView *)v5 topAnchor];
  v8 = [(CKCloudSyncStatusView *)self topAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  v107[2] = v9;
  v10 = [(UIVisualEffectView *)v5 bottomAnchor];
  v11 = [(CKCloudSyncStatusView *)self bottomAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  v107[3] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:4];
  [v77 activateConstraints:v13];

  backgroundVisualEffectView = self->_backgroundVisualEffectView;
  self->_backgroundVisualEffectView = v5;
  v101 = v5;

  v15 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
  [(UIView *)v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  v16 = +[CKUIBehavior sharedBehaviors];
  v17 = [v16 syncBarHairlineColor];
  [(UIView *)v15 setBackgroundColor:v17];

  [(CKCloudSyncStatusView *)self addSubview:v15];
  v78 = (void *)MEMORY[0x1E4F28DC8];
  v98 = [(UIView *)v15 leadingAnchor];
  v94 = [(CKCloudSyncStatusView *)self leadingAnchor];
  v88 = [v98 constraintEqualToAnchor:v94];
  v106[0] = v88;
  v83 = [(UIView *)v15 trailingAnchor];
  v18 = [(CKCloudSyncStatusView *)self trailingAnchor];
  v19 = [v83 constraintEqualToAnchor:v18];
  v106[1] = v19;
  v20 = [(UIView *)v15 topAnchor];
  v21 = [(CKCloudSyncStatusView *)self topAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];
  v106[2] = v22;
  v23 = [(UIView *)v15 heightAnchor];
  v24 = [v23 constraintEqualToConstant:1.0];
  v106[3] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:4];
  [v78 activateConstraints:v25];

  hairlineView = self->_hairlineView;
  self->_hairlineView = v15;
  v99 = v15;

  id v27 = objc_alloc(MEMORY[0x1E4F42D28]);
  v28 = +[CKUIBehavior sharedBehaviors];
  v29 = (UIProgressView *)objc_msgSend(v27, "initWithProgressViewStyle:", objc_msgSend(v28, "syncProgressBarStyle"));

  [(UIProgressView *)v29 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIProgressView *)v29 setClipsToBounds:1];
  v30 = +[CKUIBehavior sharedBehaviors];
  v31 = [v30 syncProgressTrackColor];
  [(UIProgressView *)v29 setTrackTintColor:v31];

  v32 = +[CKUIBehavior sharedBehaviors];
  v33 = [v32 syncProgressColor];
  [(UIProgressView *)v29 setTintColor:v33];

  [(CKCloudSyncStatusView *)self addSubview:v29];
  v75 = (void *)MEMORY[0x1E4F28DC8];
  v95 = [(UIProgressView *)v29 leadingAnchor];
  v84 = [(CKCloudSyncStatusView *)self leadingAnchor];
  v89 = +[CKUIBehavior sharedBehaviors];
  [v89 syncProgressLeadingPadding];
  v79 = objc_msgSend(v95, "constraintEqualToAnchor:constant:", v84);
  v105[0] = v79;
  v73 = [(UIProgressView *)v29 trailingAnchor];
  v34 = [(CKCloudSyncStatusView *)self trailingAnchor];
  v35 = +[CKUIBehavior sharedBehaviors];
  [v35 syncProgressTrailingPadding];
  v36 = objc_msgSend(v73, "constraintEqualToAnchor:constant:", v34);
  v105[1] = v36;
  v37 = [(UIProgressView *)v29 topAnchor];
  v38 = [(CKCloudSyncStatusView *)self topAnchor];
  v39 = +[CKUIBehavior sharedBehaviors];
  [v39 syncProgressTopPadding];
  v40 = objc_msgSend(v37, "constraintEqualToAnchor:constant:", v38);
  v105[2] = v40;
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:3];
  [v75 activateConstraints:v41];

  progressView = self->_progressView;
  self->_progressView = v29;
  v96 = v29;

  v43 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
  [(UIView *)v43 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CKCloudSyncStatusView *)self addSubview:v43];
  v69 = (void *)MEMORY[0x1E4F28DC8];
  v85 = [(UIView *)v43 leadingAnchor];
  v90 = [(CKCloudSyncStatusView *)self safeAreaLayoutGuide];
  v80 = [v90 leadingAnchor];
  v76 = [v85 constraintEqualToAnchor:v80];
  v104[0] = v76;
  v72 = [(UIView *)v43 trailingAnchor];
  v74 = [(CKCloudSyncStatusView *)self safeAreaLayoutGuide];
  v71 = [v74 trailingAnchor];
  v70 = [v72 constraintEqualToAnchor:v71];
  v104[1] = v70;
  v68 = [(UIView *)v43 topAnchor];
  v67 = [(CKCloudSyncStatusView *)self topAnchor];
  v66 = [v68 constraintEqualToAnchor:v67];
  v104[2] = v66;
  v44 = [(UIView *)v43 bottomAnchor];
  v45 = [(CKCloudSyncStatusView *)self safeAreaLayoutGuide];
  v46 = [v45 bottomAnchor];
  v47 = [v44 constraintEqualToAnchor:v46];
  v104[3] = v47;
  v48 = [(UIView *)v43 heightAnchor];
  v49 = +[CKUIBehavior sharedBehaviors];
  [v49 syncBarFooterHeight];
  v50 = objc_msgSend(v48, "constraintEqualToConstant:");
  v104[4] = v50;
  v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v104 count:5];
  [v69 activateConstraints:v51];

  v92 = self;
  containerView = self->_containerView;
  self->_containerView = v43;
  v53 = v43;

  v54 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
  [(UILabel *)v54 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)v54 setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)v54 setTextAlignment:1];
  [(UILabel *)v54 setNumberOfLines:2];
  [(UILabel *)v54 setText:&stru_1EDE4CA38];
  v55 = +[CKUIBehavior sharedBehaviors];
  v56 = [v55 syncProgressLabelFont];
  [(UILabel *)v54 setFont:v56];

  [(UIView *)v53 addSubview:v54];
  v81 = (void *)MEMORY[0x1E4F28DC8];
  v91 = [(UILabel *)v54 leadingAnchor];
  v86 = [(UIView *)v53 leadingAnchor];
  v57 = [v91 constraintEqualToAnchor:v86];
  v103[0] = v57;
  v58 = [(UILabel *)v54 trailingAnchor];
  v59 = [(UIView *)v53 trailingAnchor];
  v60 = [v58 constraintEqualToAnchor:v59];
  v103[1] = v60;
  v61 = [(UILabel *)v54 centerYAnchor];
  v62 = [(UIView *)v53 centerYAnchor];
  v63 = [v61 constraintEqualToAnchor:v62];
  v103[2] = v63;
  v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:3];
  [v81 activateConstraints:v64];

  progressLabel = v92->_progressLabel;
  v92->_progressLabel = v54;
}

- (BOOL)isVisibleInViewHierarchy
{
  objc_super v3 = [(CKCloudSyncStatusView *)self superview];
  if (v3) {
    int v4 = [(CKCloudSyncStatusView *)self isHidden] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)updateWithSyncState:(id)a3
{
  id v20 = a3;
  if ([v20 syncType] == 2) {
    int v4 = [v20 hasNotSyncedInLastSevenDays] ^ 1;
  }
  else {
    int v4 = 1;
  }
  if ([v20 hasAvailableRecordsToDownload])
  {
    if ([v20 syncJobState] != 2 && objc_msgSend(v20, "syncJobState") != 3) {
      int v4 = 0;
    }
  }
  else
  {
    int v4 = 0;
  }
  v5 = [(CKCloudSyncStatusView *)self progressView];
  int v6 = [v5 isHidden];

  if (v4 == v6)
  {
    v8 = [(CKCloudSyncStatusView *)self progressView];
    [v8 setHidden:v4 ^ 1u];

    v9 = [(CKCloudSyncStatusView *)self progressView];
    int v7 = [v9 isHidden];
  }
  else
  {
    int v7 = 1;
  }
  v10 = v20;
  if (v4)
  {
    [v20 lastDownloadProgress];
    double v12 = v11;
    uint64_t v13 = [(CKCloudSyncStatusView *)self hasFinishedFirstLayoutPass] & v7;
    v14 = [(CKCloudSyncStatusView *)self progressView];
    *(float *)&double v15 = v12;
    [v14 setProgress:v13 animated:v15];

    v10 = v20;
  }
  uint64_t v16 = [v10 syncStatusText];
  v17 = (void *)v16;
  if (v16) {
    v18 = (__CFString *)v16;
  }
  else {
    v18 = &stru_1EDE4CA38;
  }
  v19 = [(CKCloudSyncStatusView *)self progressLabel];
  [v19 setText:v18];
}

- (UIVisualEffectView)backgroundVisualEffectView
{
  return self->_backgroundVisualEffectView;
}

- (void)setBackgroundVisualEffectView:(id)a3
{
}

- (UIView)hairlineView
{
  return self->_hairlineView;
}

- (void)setHairlineView:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UIProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
}

- (UILabel)progressLabel
{
  return self->_progressLabel;
}

- (void)setProgressLabel:(id)a3
{
}

- (BOOL)hasFinishedFirstLayoutPass
{
  return self->_hasFinishedFirstLayoutPass;
}

- (void)setHasFinishedFirstLayoutPass:(BOOL)a3
{
  self->_hasFinishedFirstLayoutPass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressLabel, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_hairlineView, 0);

  objc_storeStrong((id *)&self->_backgroundVisualEffectView, 0);
}

@end