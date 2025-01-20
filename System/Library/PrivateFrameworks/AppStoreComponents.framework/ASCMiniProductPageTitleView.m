@interface ASCMiniProductPageTitleView
- (ASCAgeRatingView)ageRatingView;
- (ASCMiniProductPageTitleView)initWithFrame:(CGRect)a3;
- (CGRect)lastLineFrame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (unint64_t)displayedNumberOfLines;
- (void)layoutSubviews;
- (void)setAgeRatingView:(id)a3;
@end

@implementation ASCMiniProductPageTitleView

- (ASCMiniProductPageTitleView)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)ASCMiniProductPageTitleView;
  v3 = -[ASCMiniProductPageTitleView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [ASCAgeRatingView alloc];
    uint64_t v5 = -[ASCAgeRatingView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    ageRatingView = v3->_ageRatingView;
    v3->_ageRatingView = (ASCAgeRatingView *)v5;

    v7 = ASCAXIdentifierWithSuffix(@"Lockup.AgeRating");
    [(ASCAgeRatingView *)v3->_ageRatingView setAccessibilityIdentifier:v7];

    double v8 = *MEMORY[0x1E4FB2848];
    double v9 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v10 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v11 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    -[ASCMiniProductPageTitleView setLayoutMargins:](v3, "setLayoutMargins:", *MEMORY[0x1E4FB2848], v9, v10, v11);
    -[ASCMiniProductPageTitleView setTextContainerInset:](v3, "setTextContainerInset:", v8, v9, v10, v11);
    [(ASCMiniProductPageTitleView *)v3 setEditable:0];
    [(ASCMiniProductPageTitleView *)v3 setSelectable:0];
    [(ASCMiniProductPageTitleView *)v3 setScrollEnabled:0];
    [(ASCMiniProductPageTitleView *)v3 setBorderStyle:0];
    v12 = [(ASCMiniProductPageTitleView *)v3 textContainer];
    [v12 setLineFragmentPadding:0.0];

    v13 = [(ASCMiniProductPageTitleView *)v3 textContainer];
    [v13 setLineBreakMode:4];

    v14 = [(ASCMiniProductPageTitleView *)v3 textContainer];
    [v14 setWidthTracksTextView:1];

    v15 = [(ASCMiniProductPageTitleView *)v3 textContainer];
    [v15 setHeightTracksTextView:1];

    [(ASCMiniProductPageTitleView *)v3 addSubview:v3->_ageRatingView];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(ASCMiniProductPageTitleView *)self textContainer];
  objc_msgSend(v6, "setSize:", width, height);

  v7 = [(ASCMiniProductPageTitleView *)self textContainer];
  [v7 setExclusionPaths:MEMORY[0x1E4F1CBF0]];

  v27.receiver = self;
  v27.super_class = (Class)ASCMiniProductPageTitleView;
  -[ASCSkeletonTextView sizeThatFits:](&v27, sel_sizeThatFits_, width, height);
  double v9 = v8;
  double v11 = v10;
  v12 = [(ASCMiniProductPageTitleView *)self ageRatingView];
  objc_msgSend(v12, "sizeThatFits:", width, height);
  double v14 = v13;

  [(ASCMiniProductPageTitleView *)self lastLineFrame];
  double v16 = v15;
  unint64_t v17 = [(ASCMiniProductPageTitleView *)self displayedNumberOfLines];
  double v18 = v14 + 6.0;
  if (width - v16 >= v18)
  {
    if (v18 + v16 >= v9) {
      double v9 = v18 + v16;
    }
  }
  else
  {
    unint64_t v19 = v17;
    v20 = [(ASCMiniProductPageTitleView *)self textContainer];
    if (v19 < [v20 maximumNumberOfLines])
    {

LABEL_11:
      v23 = [(ASCMiniProductPageTitleView *)self font];
      [v23 lineHeight];
      double v11 = v11 + v24;

      goto LABEL_12;
    }
    v21 = [(ASCMiniProductPageTitleView *)self textContainer];
    uint64_t v22 = [v21 maximumNumberOfLines];

    if (!v22) {
      goto LABEL_11;
    }
    if (v18 + v16 < v9) {
      double v9 = v18 + v16;
    }
  }
LABEL_12:
  double v25 = v9;
  double v26 = v11;
  result.double height = v26;
  result.double width = v25;
  return result;
}

- (void)layoutSubviews
{
  v51[1] = *MEMORY[0x1E4F143B8];
  v50.receiver = self;
  v50.super_class = (Class)ASCMiniProductPageTitleView;
  [(ASCMiniProductPageTitleView *)&v50 layoutSubviews];
  v3 = [(ASCMiniProductPageTitleView *)self textContainer];
  [v3 setExclusionPaths:MEMORY[0x1E4F1CBF0]];

  [(ASCMiniProductPageTitleView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v8 = [(ASCMiniProductPageTitleView *)self ageRatingView];
  objc_msgSend(v8, "sizeThatFits:", v5, v7);
  double v10 = v9;
  double v12 = v11;

  [(ASCMiniProductPageTitleView *)self lastLineFrame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  unint64_t v21 = [(ASCMiniProductPageTitleView *)self displayedNumberOfLines];
  double v22 = v10 + 6.0;
  if (v5 - v18 < v10 + 6.0)
  {
    double v49 = v10;
    double v23 = (double)v21;
    double v24 = [(ASCMiniProductPageTitleView *)self textContainer];
    if (v23 < (double)(unint64_t)[v24 maximumNumberOfLines])
    {
    }
    else
    {
      double v25 = [(ASCMiniProductPageTitleView *)self textContainer];
      uint64_t v26 = [v25 maximumNumberOfLines];

      if (v26)
      {
        [(ASCMiniProductPageTitleView *)self bounds];
        +[__ASCLayoutProxy rectWithLayoutDirectionForRect:inTraitEnvironment:relativeTo:](__ASCLayoutProxy, "rectWithLayoutDirectionForRect:inTraitEnvironment:relativeTo:", self, v5 - v22, v16, v22, v20, v27, v28, v29, v30);
        v31 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:");
        v51[0] = v31;
        v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
        v33 = [(ASCMiniProductPageTitleView *)self textContainer];
        [v33 setExclusionPaths:v32];

        [(ASCMiniProductPageTitleView *)self lastLineFrame];
        double v14 = v34;
        double v16 = v35;
        double v18 = v36;
        double v20 = v37;
        double v38 = v34 + v36 + 6.0;
        double v39 = v35 + (v37 - v12) * 0.5;

LABEL_8:
        double v10 = v49;
        goto LABEL_9;
      }
    }
    double v39 = v16 + v20 + (v20 - v12) * 0.5;
    double v38 = 0.0;
    goto LABEL_8;
  }
  double v38 = v14 + v18 + 6.0;
  double v39 = v16 + (v20 - v12) * 0.5;
LABEL_9:
  +[__ASCLayoutProxy rectWithLayoutDirectionForRect:inTraitEnvironment:relativeTo:](__ASCLayoutProxy, "rectWithLayoutDirectionForRect:inTraitEnvironment:relativeTo:", self, v38, v39, v10, v12, v14, v16, v18, v20);
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  v48 = [(ASCMiniProductPageTitleView *)self ageRatingView];
  objc_msgSend(v48, "setFrame:", v41, v43, v45, v47);
}

- (CGRect)lastLineFrame
{
  uint64_t v16 = 0;
  double v17 = (double *)&v16;
  uint64_t v18 = 0x4010000000;
  double v19 = &unk_1C2C3D093;
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v20 = *MEMORY[0x1E4F1DB28];
  long long v21 = v3;
  double v4 = [(ASCMiniProductPageTitleView *)self textLayoutManager];
  double v5 = [(ASCMiniProductPageTitleView *)self textLayoutManager];
  double v6 = [v5 documentRange];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __44__ASCMiniProductPageTitleView_lastLineFrame__block_invoke;
  v15[3] = &unk_1E645E6C8;
  v15[4] = &v16;
  [v4 enumerateTextSegmentsInRange:v6 type:0 options:1 usingBlock:v15];

  double v7 = v17[4];
  double v8 = v17[5];
  double v9 = v17[6];
  double v10 = v17[7];
  _Block_object_dispose(&v16, 8);
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

uint64_t __44__ASCMiniProductPageTitleView_lastLineFrame__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v5 = *(double **)(*(void *)(a1 + 32) + 8);
  v5[4] = a2;
  v5[5] = a3;
  v5[6] = a4;
  v5[7] = a5;
  return 1;
}

- (unint64_t)displayedNumberOfLines
{
  uint64_t v9 = 0;
  double v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  long long v3 = [(ASCMiniProductPageTitleView *)self textLayoutManager];
  double v4 = [(ASCMiniProductPageTitleView *)self textLayoutManager];
  double v5 = [v4 documentRange];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__ASCMiniProductPageTitleView_displayedNumberOfLines__block_invoke;
  v8[3] = &unk_1E645E6C8;
  v8[4] = &v9;
  [v3 enumerateTextSegmentsInRange:v5 type:0 options:1 usingBlock:v8];

  unint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __53__ASCMiniProductPageTitleView_displayedNumberOfLines__block_invoke(uint64_t a1)
{
  return 1;
}

- (ASCAgeRatingView)ageRatingView
{
  return self->_ageRatingView;
}

- (void)setAgeRatingView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end