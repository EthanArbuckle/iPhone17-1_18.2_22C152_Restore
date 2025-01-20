@interface MKThirdPartyPhotoBigAttributionView
- (MKThirdPartyPhotoBigAttributionView)initWithContext:(int64_t)a3;
- (id)firstLineLabelFont;
- (id)secondLineLabelFont;
- (void)didEndAnimatingActivityIndicatorView;
- (void)updateInfoAttributionString;
- (void)willStartAnimatingActivityIndicatorView;
@end

@implementation MKThirdPartyPhotoBigAttributionView

- (MKThirdPartyPhotoBigAttributionView)initWithContext:(int64_t)a3
{
  v69[14] = *MEMORY[0x1E4F143B8];
  v68.receiver = self;
  v68.super_class = (Class)MKThirdPartyPhotoBigAttributionView;
  v3 = [(MKPhotoBigAttributionView *)&v68 initWithContext:a3];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    labelsView = v3->_labelsView;
    v3->_labelsView = (UIView *)v5;

    [(UIView *)v3->_labelsView setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [(MKPhotoBigAttributionView *)v3 contentView];
    [v7 addSubview:v3->_labelsView];

    v8 = [_MKUILabel alloc];
    [(MKThirdPartyPhotoBigAttributionView *)v3 bounds];
    v9 = -[_MKUILabel initWithFrame:](v8, "initWithFrame:");
    [(_MKUILabel *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [MEMORY[0x1E4F428B8] clearColor];
    [(_MKUILabel *)v9 setBackgroundColor:v10];

    [(_MKUILabel *)v9 setTextAlignment:1];
    [(_MKUILabel *)v9 setNumberOfLines:2];
    firstLineLabel = v3->_firstLineLabel;
    v3->_firstLineLabel = v9;
    v12 = v9;

    v13 = [_MKUILabel alloc];
    [(MKThirdPartyPhotoBigAttributionView *)v3 bounds];
    v14 = -[_MKUILabel initWithFrame:](v13, "initWithFrame:");
    [(_MKUILabel *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = [MEMORY[0x1E4F428B8] clearColor];
    [(_MKUILabel *)v14 setBackgroundColor:v15];

    [(_MKUILabel *)v14 setTextAlignment:1];
    [(_MKUILabel *)v14 setNumberOfLines:2];
    secondLineLabel = v3->_secondLineLabel;
    v3->_secondLineLabel = v14;
    v52 = v14;

    [(UIView *)v3->_labelsView addSubview:v3->_firstLineLabel];
    [(UIView *)v3->_labelsView addSubview:v3->_secondLineLabel];
    v17 = [(MKPhotoBigAttributionView *)v3 contentView];
    v48 = (void *)MEMORY[0x1E4F28DC8];
    v67 = [(UIView *)v3->_labelsView topAnchor];
    v66 = [v17 topAnchor];
    v65 = [v67 constraintGreaterThanOrEqualToAnchor:v66];
    v69[0] = v65;
    v64 = [(UIView *)v3->_labelsView bottomAnchor];
    v63 = [v17 bottomAnchor];
    v62 = [v64 constraintLessThanOrEqualToAnchor:v63];
    v69[1] = v62;
    v61 = [(UIView *)v3->_labelsView leadingAnchor];
    v60 = [v17 leadingAnchor];
    v59 = [v61 constraintEqualToAnchor:v60];
    v69[2] = v59;
    v58 = [(UIView *)v3->_labelsView trailingAnchor];
    v57 = [v17 trailingAnchor];
    v56 = [v58 constraintEqualToAnchor:v57];
    v69[3] = v56;
    v55 = [(UIView *)v3->_labelsView centerYAnchor];
    v54 = [v17 centerYAnchor];
    v53 = [v55 constraintEqualToAnchor:v54];
    v69[4] = v53;
    v51 = [(_MKUILabel *)v3->_firstLineLabel topAnchor];
    v50 = [(UIView *)v3->_labelsView topAnchor];
    v49 = [v51 constraintEqualToAnchor:v50];
    v69[5] = v49;
    v47 = [(_MKUILabel *)v3->_firstLineLabel leadingAnchor];
    v46 = [(UIView *)v3->_labelsView leadingAnchor];
    v45 = [v47 constraintEqualToAnchor:v46];
    v69[6] = v45;
    v44 = [(_MKUILabel *)v3->_firstLineLabel trailingAnchor];
    v43 = [(UIView *)v3->_labelsView trailingAnchor];
    v42 = [v44 constraintEqualToAnchor:v43];
    v69[7] = v42;
    v40 = [(_MKUILabel *)v3->_secondLineLabel topAnchor];
    v39 = [(_MKUILabel *)v3->_firstLineLabel bottomAnchor];
    v38 = [v40 constraintEqualToAnchor:v39 constant:2.0];
    v69[8] = v38;
    v37 = [(_MKUILabel *)v3->_secondLineLabel bottomAnchor];
    v36 = [(UIView *)v3->_labelsView bottomAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v69[9] = v35;
    v34 = [(_MKUILabel *)v3->_secondLineLabel leadingAnchor];
    v33 = [(UIView *)v3->_labelsView leadingAnchor];
    v32 = [v34 constraintEqualToAnchor:v33];
    v69[10] = v32;
    v31 = [(_MKUILabel *)v3->_secondLineLabel trailingAnchor];
    v30 = [(UIView *)v3->_labelsView trailingAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v69[11] = v29;
    v18 = [(MKPhotoBigAttributionView *)v3 spinner];
    v19 = [v18 centerXAnchor];
    v20 = v17;
    v41 = v17;
    v21 = [v17 centerXAnchor];
    v22 = [v19 constraintEqualToAnchor:v21];
    v69[12] = v22;
    v23 = [(MKPhotoBigAttributionView *)v3 spinner];
    v24 = [v23 centerYAnchor];
    v25 = [v20 centerYAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    v69[13] = v26;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:14];
    [v48 activateConstraints:v27];
  }
  return v3;
}

- (void)updateInfoAttributionString
{
  v32[2] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(MKPhotoBigAttributionView *)self type];
  id v4 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (v3) {
    uint64_t v5 = @"More photos";
  }
  else {
    uint64_t v5 = @"Add a photo";
  }
  v6 = _MKLocalizedStringFromThisBundle(v5);
  uint64_t v7 = *MEMORY[0x1E4F42508];
  v31[0] = *MEMORY[0x1E4F42508];
  v8 = [(MKThirdPartyPhotoBigAttributionView *)self firstLineLabelFont];
  v32[0] = v8;
  uint64_t v9 = *MEMORY[0x1E4F42510];
  v31[1] = *MEMORY[0x1E4F42510];
  v10 = [MEMORY[0x1E4F428B8] whiteColor];
  v32[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  v12 = (void *)[v4 initWithString:v6 attributes:v11];

  v13 = (void *)[v12 copy];
  [(_MKUILabel *)self->_firstLineLabel setAttributedText:v13];

  v14 = [(MKPhotoBigAttributionView *)self mapItem];
  v15 = objc_msgSend(v14, "_mapkit_preferredFirstPhotoVendor");

  v16 = [v15 providerName];
  if ([v16 length])
  {
    id v17 = objc_alloc(MEMORY[0x1E4F28B18]);
    v18 = NSString;
    v19 = _MKLocalizedStringFromThisBundle(@"PlaceCardPhotosBigAttribution");
    v20 = [v15 providerName];
    v21 = objc_msgSend(v18, "stringWithFormat:", v19, v20);
    v22 = (void *)[v17 initWithString:v21];

    v23 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v22];
    uint64_t v24 = [v22 length];
    v29[0] = v7;
    v25 = [(MKThirdPartyPhotoBigAttributionView *)self secondLineLabelFont];
    v29[1] = v9;
    v30[0] = v25;
    v26 = [MEMORY[0x1E4F428B8] systemGrayColor];
    v30[1] = v26;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
    objc_msgSend(v23, "addAttributes:range:", v27, 0, v24);

    v28 = (void *)[v23 copy];
    [(_MKUILabel *)self->_secondLineLabel setAttributedText:v28];
  }
}

- (id)firstLineLabelFont
{
  v2 = [(MKPhotoBigAttributionView *)self context];
  if (v2)
  {
    if (v2 != (void *)1) {
      goto LABEL_6;
    }
    double v3 = 20.0;
  }
  else
  {
    double v3 = 15.0;
  }
  v2 = [MEMORY[0x1E4F42A30] systemFontOfSize:v3 weight:*MEMORY[0x1E4F43930]];
LABEL_6:

  return v2;
}

- (id)secondLineLabelFont
{
  v2 = [(MKPhotoBigAttributionView *)self context];
  if (v2)
  {
    if (v2 != (void *)1) {
      goto LABEL_6;
    }
    double v3 = 17.0;
  }
  else
  {
    double v3 = 13.0;
  }
  v2 = [MEMORY[0x1E4F42A30] systemFontOfSize:v3];
LABEL_6:

  return v2;
}

- (void)willStartAnimatingActivityIndicatorView
{
}

- (void)didEndAnimatingActivityIndicatorView
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelsView, 0);
  objc_storeStrong((id *)&self->_secondLineLabel, 0);

  objc_storeStrong((id *)&self->_firstLineLabel, 0);
}

@end