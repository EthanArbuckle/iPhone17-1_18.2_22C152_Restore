@interface HRWDSpinnerView
- (BOOL)isAnimating;
- (HRWDSpinnerView)init;
- (void)_setupSubviews;
- (void)setMessageFont:(id)a3;
- (void)setMessageWhileSpinning:(id)a3;
- (void)startSpinner;
- (void)stopSpinner;
- (void)updateConstraints;
@end

@implementation HRWDSpinnerView

- (HRWDSpinnerView)init
{
  v5.receiver = self;
  v5.super_class = (Class)HRWDSpinnerView;
  v2 = [(HRWDSpinnerView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(HRWDSpinnerView *)v2 _setupSubviews];
  }
  return v3;
}

- (void)_setupSubviews
{
  v54[13] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HRWDSpinnerView *)self addSubview:v3];
  v4 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:101];
  spinner = self->_spinner;
  self->_spinner = v4;

  [(UIActivityIndicatorView *)self->_spinner setHidesWhenStopped:1];
  [(UIActivityIndicatorView *)self->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:self->_spinner];
  v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  label = self->_label;
  self->_label = v6;

  v8 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2990] variant:1024];
  [(UILabel *)self->_label setFont:v8];

  v9 = HBXLocalizedString(@"CONNECTING");
  [(UILabel *)self->_label setText:v9];

  v10 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)self->_label setTextColor:v10];

  [(UILabel *)self->_label setTextAlignment:1];
  [(UILabel *)self->_label setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:self->_label];
  v11 = [(UIActivityIndicatorView *)self->_spinner topAnchor];
  v12 = [v3 topAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  spinnerTopConstraint = self->_spinnerTopConstraint;
  self->_spinnerTopConstraint = v13;

  v38 = (void *)MEMORY[0x1E4F28DC8];
  v53 = [v3 topAnchor];
  v52 = [(HRWDSpinnerView *)self topAnchor];
  v51 = [v53 constraintGreaterThanOrEqualToAnchor:v52];
  v54[0] = v51;
  v50 = [v3 bottomAnchor];
  v49 = [(HRWDSpinnerView *)self bottomAnchor];
  v48 = [v50 constraintLessThanOrEqualToAnchor:v49];
  v54[1] = v48;
  v47 = [v3 leftAnchor];
  v46 = [(HRWDSpinnerView *)self leftAnchor];
  v45 = [v47 constraintGreaterThanOrEqualToAnchor:v46];
  v54[2] = v45;
  v44 = [v3 rightAnchor];
  v43 = [(HRWDSpinnerView *)self rightAnchor];
  v42 = [v44 constraintLessThanOrEqualToAnchor:v43];
  v54[3] = v42;
  v41 = [v3 centerXAnchor];
  v40 = [(HRWDSpinnerView *)self centerXAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v54[4] = v39;
  v37 = [v3 centerYAnchor];
  v36 = [(HRWDSpinnerView *)self centerYAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v54[5] = v35;
  v34 = [(UIActivityIndicatorView *)self->_spinner centerXAnchor];
  v33 = [v3 centerXAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v54[6] = v32;
  v31 = [(UILabel *)self->_label centerXAnchor];
  v30 = [v3 centerXAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v54[7] = v29;
  v28 = [(UILabel *)self->_label leadingAnchor];
  v27 = [v3 leadingAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v54[8] = v26;
  v25 = [(UILabel *)self->_label trailingAnchor];
  v15 = [v3 trailingAnchor];
  v16 = [v25 constraintEqualToAnchor:v15];
  v17 = self->_spinnerTopConstraint;
  v54[9] = v16;
  v54[10] = v17;
  v18 = [(UILabel *)self->_label topAnchor];
  v19 = [(UIActivityIndicatorView *)self->_spinner bottomAnchor];
  v20 = [v18 constraintEqualToAnchor:v19 constant:14.0];
  v54[11] = v20;
  v21 = [(UILabel *)self->_label bottomAnchor];
  v22 = [v3 bottomAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];
  v54[12] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:13];
  [v38 activateConstraints:v24];
}

- (void)updateConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)HRWDSpinnerView;
  [(HRWDSpinnerView *)&v3 updateConstraints];
  [(HRWDSpinnerView *)self frame];
  [(NSLayoutConstraint *)self->_spinnerTopConstraint setConstant:CGRectGetHeight(v4) * 0.4];
}

- (BOOL)isAnimating
{
  return [(UIActivityIndicatorView *)self->_spinner isAnimating];
}

- (void)setMessageWhileSpinning:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__HRWDSpinnerView_setMessageWhileSpinning___block_invoke;
  v6[3] = &unk_1E644ADD8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __43__HRWDSpinnerView_setMessageWhileSpinning___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) setText:*(void *)(a1 + 40)];
}

- (void)setMessageFont:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__HRWDSpinnerView_setMessageFont___block_invoke;
  v6[3] = &unk_1E644ADD8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __34__HRWDSpinnerView_setMessageFont___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) setFont:*(void *)(a1 + 40)];
}

- (void)startSpinner
{
  objc_initWeak(&location, self);
  objc_initWeak(&from, self->_spinner);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __31__HRWDSpinnerView_startSpinner__block_invoke;
  v3[3] = &unk_1E644B418;
  objc_copyWeak(&v4, &from);
  objc_copyWeak(&v5, &location);
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __31__HRWDSpinnerView_startSpinner__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained startAnimating];

  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [v3 setHidden:0];
}

- (void)stopSpinner
{
  objc_initWeak(&location, self);
  objc_initWeak(&from, self->_spinner);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __30__HRWDSpinnerView_stopSpinner__block_invoke;
  v3[3] = &unk_1E644B418;
  objc_copyWeak(&v4, &from);
  objc_copyWeak(&v5, &location);
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __30__HRWDSpinnerView_stopSpinner__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained stopAnimating];

  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [v3 setHidden:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinnerTopConstraint, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end