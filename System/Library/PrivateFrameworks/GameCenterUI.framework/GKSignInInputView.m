@interface GKSignInInputView
- (NSLayoutConstraint)bottomToSignInBaselineConstraint;
- (NSLayoutConstraint)inputViewHeightConstraint;
- (NSLayoutConstraint)promptTextToProgressIndicatorTopConstraint;
- (NSLayoutConstraint)signInBaselineToPromptTextTopConstraint;
- (NSLayoutConstraint)signInFormToSignInLabelTopConstraint;
- (NSLayoutConstraint)signInInputViewHeightConstraint;
- (NSLayoutConstraint)topToSignInBaselineConstraint;
- (id)allVariableConstraints;
- (void)setBottomToSignInBaselineConstraint:(id)a3;
- (void)setInputViewHeightConstraint:(id)a3;
- (void)setPromptTextToProgressIndicatorTopConstraint:(id)a3;
- (void)setSignInBaselineToPromptTextTopConstraint:(id)a3;
- (void)setSignInFormToSignInLabelTopConstraint:(id)a3;
- (void)setSignInInputViewHeightConstraint:(id)a3;
- (void)setTopToSignInBaselineConstraint:(id)a3;
- (void)setupConstraintConstantsForOrientation:(int64_t)a3;
@end

@implementation GKSignInInputView

- (void)setupConstraintConstantsForOrientation:(int64_t)a3
{
  unint64_t v4 = a3 - 3;
  v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 == 1)
  {
    if (*MEMORY[0x1E4F63830])
    {
      topToSignInBaselineConstraint = self->_topToSignInBaselineConstraint;
      double v8 = 143.0;
    }
    else
    {
      double v8 = dbl_1AF7CAE40[v4 < 2];
      topToSignInBaselineConstraint = self->_topToSignInBaselineConstraint;
    }
  }
  else
  {
    v9 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v10 = [v9 userInterfaceIdiom];

    if (v10 != 1)
    {
      v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v11 bounds];
      double v13 = v12;
      double v15 = v14;

      double v16 = v15 <= v13 ? v13 : v15;
      if (v16 > 480.0)
      {
        BOOL v17 = v4 < 2;
        p_topToSignInBaselineConstraint = &self->_topToSignInBaselineConstraint;
        [(NSLayoutConstraint *)self->_topToSignInBaselineConstraint setConstant:dbl_1AF7CAE20[v17]];
        [(NSLayoutConstraint *)self->_signInBaselineToPromptTextTopConstraint setConstant:34.0];
        v19 = [MEMORY[0x1E4FB1BA8] mainScreen];
        [v19 bounds];
        double v21 = v20;
        double v23 = v22;

        [(NSLayoutConstraint *)self->_topToSignInBaselineConstraint constant];
        double v25 = v24 * (fmin(v21, v23) / 320.0);
        goto LABEL_13;
      }
    }
    topToSignInBaselineConstraint = self->_topToSignInBaselineConstraint;
    double v8 = dbl_1AF7CAE30[*MEMORY[0x1E4F63830] == 0];
  }
  [(NSLayoutConstraint *)topToSignInBaselineConstraint setConstant:v8];
  p_topToSignInBaselineConstraint = &self->_signInBaselineToPromptTextTopConstraint;
  double v25 = 34.0;
LABEL_13:
  [(NSLayoutConstraint *)*p_topToSignInBaselineConstraint setConstant:v25];
  [(NSLayoutConstraint *)self->_signInBaselineToPromptTextTopConstraint constant];
  -[NSLayoutConstraint setConstant:](self->_promptTextToProgressIndicatorTopConstraint, "setConstant:");
  [(NSLayoutConstraint *)self->_signInBaselineToPromptTextTopConstraint constant];
  [(NSLayoutConstraint *)self->_signInFormToSignInLabelTopConstraint setConstant:v26 + -15.0];
  id v28 = +[GKConstraintUpdateController sharedController];
  signInBaselineToPromptTextTopConstraint = self->_signInBaselineToPromptTextTopConstraint;
  [(NSLayoutConstraint *)signInBaselineToPromptTextTopConstraint constant];
  objc_msgSend(v28, "registerConstraint:leading:forFontTextStyle:", signInBaselineToPromptTextTopConstraint, *MEMORY[0x1E4FB28C8]);
}

- (id)allVariableConstraints
{
  v6[4] = *MEMORY[0x1E4F143B8];
  signInBaselineToPromptTextTopConstraint = self->_signInBaselineToPromptTextTopConstraint;
  v6[0] = self->_topToSignInBaselineConstraint;
  v6[1] = signInBaselineToPromptTextTopConstraint;
  signInFormToSignInLabelTopConstraint = self->_signInFormToSignInLabelTopConstraint;
  v6[2] = self->_promptTextToProgressIndicatorTopConstraint;
  v6[3] = signInFormToSignInLabelTopConstraint;
  unint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];

  return v4;
}

- (NSLayoutConstraint)topToSignInBaselineConstraint
{
  return self->_topToSignInBaselineConstraint;
}

- (void)setTopToSignInBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomToSignInBaselineConstraint
{
  return self->_bottomToSignInBaselineConstraint;
}

- (void)setBottomToSignInBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)signInBaselineToPromptTextTopConstraint
{
  return self->_signInBaselineToPromptTextTopConstraint;
}

- (void)setSignInBaselineToPromptTextTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)inputViewHeightConstraint
{
  return self->_inputViewHeightConstraint;
}

- (void)setInputViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)promptTextToProgressIndicatorTopConstraint
{
  return self->_promptTextToProgressIndicatorTopConstraint;
}

- (void)setPromptTextToProgressIndicatorTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)signInFormToSignInLabelTopConstraint
{
  return self->_signInFormToSignInLabelTopConstraint;
}

- (void)setSignInFormToSignInLabelTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)signInInputViewHeightConstraint
{
  return self->_signInInputViewHeightConstraint;
}

- (void)setSignInInputViewHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signInInputViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_signInFormToSignInLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_promptTextToProgressIndicatorTopConstraint, 0);
  objc_storeStrong((id *)&self->_inputViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_signInBaselineToPromptTextTopConstraint, 0);
  objc_storeStrong((id *)&self->_bottomToSignInBaselineConstraint, 0);

  objc_storeStrong((id *)&self->_topToSignInBaselineConstraint, 0);
}

@end