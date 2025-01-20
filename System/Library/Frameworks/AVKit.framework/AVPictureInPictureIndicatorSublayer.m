@interface AVPictureInPictureIndicatorSublayer
- (AVPictureInPictureIndicatorSublayer)init;
- (AVPictureInPictureIndicatorSublayer)initWithDisplayScale:(double)a3 placeholderImage:(CGImage *)a4 opaque:(BOOL)a5;
- (BOOL)canRenderAttributedTextWithoutTruncationInsideRect:(CGRect)a3;
- (CGRect)textBoundingRectWhenDrawnInRect:(CGRect)a3;
- (NSString)customText;
- (void)layoutSublayers;
- (void)layoutSublayersWithTextAndImageUsingInsetBounds:(CGRect)a3;
- (void)setCustomText:(id)a3;
@end

@implementation AVPictureInPictureIndicatorSublayer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customText, 0);
  objc_storeStrong((id *)&self->_imageLayer, 0);
  objc_storeStrong((id *)&self->_textLayer, 0);

  objc_storeStrong((id *)&self->_attributedText, 0);
}

- (NSString)customText
{
  return self->_customText;
}

- (BOOL)canRenderAttributedTextWithoutTruncationInsideRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  -[NSAttributedString boundingRectWithSize:options:context:](self->_attributedText, "boundingRectWithSize:options:context:", 1, 0, CGRectGetWidth(a3), 1000.0);
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = *MEMORY[0x1E4F1DAD8];
  uint64_t v10 = *(void *)(MEMORY[0x1E4F1DAD8] + 8);
  CGFloat v11 = width;
  CGFloat v12 = height;
  uint64_t v13 = *MEMORY[0x1E4F1DAD8];
  uint64_t v14 = v10;

  return CGRectContainsRect(*(CGRect *)&v9, *(CGRect *)&v13);
}

- (CGRect)textBoundingRectWhenDrawnInRect:(CGRect)a3
{
  -[NSAttributedString boundingRectWithSize:options:context:](self->_attributedText, "boundingRectWithSize:options:context:", 1, 0, a3.size.width, a3.size.height);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)layoutSublayersWithTextAndImageUsingInsetBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(AVPictureInPictureIndicatorSublayer *)self bounds];
  CGFloat v71 = v9;
  CGFloat v73 = v8;
  CGFloat v67 = v11;
  CGFloat v69 = v10;
  textLayer = self->_textLayer;
  v89.origin.double x = x;
  v89.origin.double y = y;
  v89.size.double width = width;
  v89.size.double height = height;
  if (CGRectGetWidth(v89) <= 0.0)
  {
    BOOL v13 = 1;
  }
  else
  {
    v90.origin.double x = x;
    v90.origin.double y = y;
    v90.size.double width = width;
    v90.size.double height = height;
    BOOL v13 = CGRectGetHeight(v90) <= 0.0;
  }
  [(CATextLayer *)textLayer setHidden:v13];
  -[AVPictureInPictureIndicatorSublayer textBoundingRectWhenDrawnInRect:](self, "textBoundingRectWhenDrawnInRect:", x, y, width, height);
  CGFloat rect = x;
  CGFloat rect_8 = y;
  double v14 = v91.origin.x;
  double v15 = v91.origin.y;
  double v16 = v91.size.width;
  CGFloat v66 = height;
  double v17 = v91.size.height;
  double v18 = CGRectGetHeight(v91);
  double lineHeight = self->_lineHeight;
  if (lineHeight < 13.0) {
    double lineHeight = 13.0;
  }
  double v20 = v18 / lineHeight;
  double left = self->_languageAwareOutsets.left;
  CGFloat v22 = v14 - left;
  CGFloat v23 = v15 - self->_languageAwareOutsets.top * v20;
  CGFloat v85 = width;
  double v86 = v16 - (-self->_languageAwareOutsets.right - left);
  double v24 = v17 - (-(self->_languageAwareOutsets.top * v20) - v20 * self->_languageAwareOutsets.bottom);
  -[AVPictureInPictureIndicatorSublayer textBoundingRectWhenDrawnInRect:](self, "textBoundingRectWhenDrawnInRect:", v22, v23);
  CGFloat v80 = v25;
  CGFloat rect_24 = v26;
  CGFloat v79 = v27;
  CGFloat v87 = v28;
  p_imageSize = &self->_imageSize;
  CGFloat v63 = self->_imageSize.width;
  CGFloat v76 = self->_imageSize.height;
  v92.origin.double x = v73;
  v92.origin.double y = v71;
  v92.size.double width = v69;
  v92.size.double height = v67;
  double MidX = CGRectGetMidX(v92);
  v93.origin.double x = v73;
  v93.origin.double y = v71;
  v93.size.double width = v69;
  v93.size.double height = v67;
  double MidY = CGRectGetMidY(v93);
  CGFloat v77 = v23;
  CGFloat v78 = v22;
  v94.origin.double x = v22;
  v94.origin.double y = v23;
  v94.size.double width = v86;
  v94.size.double height = v24;
  double v65 = MidY + CGRectGetMidY(v94);
  v95.origin.double x = v80;
  v95.origin.double y = rect_24;
  v95.size.double width = v79;
  v95.size.double height = v87;
  double v64 = CGRectGetMidY(v95);
  v96.origin.double x = v73;
  v96.origin.double y = v71;
  v96.size.double width = v69;
  v96.size.double height = v67;
  double rect_16 = CGRectGetMidX(v96);
  v97.origin.double x = v73;
  v97.origin.double y = v71;
  v97.size.double width = v69;
  v97.size.double height = v67;
  double v74 = CGRectGetMidY(v97);
  double v70 = self->_imageSize.height;
  double v72 = self->_imageSize.width;
  double baselineOffset = self->_baselineOffset;
  v98.origin.double x = rect;
  v98.origin.double y = rect_8;
  v98.size.double width = width;
  v98.size.double height = v66;
  double v31 = CGRectGetHeight(v98);
  v99.origin.double x = v80;
  v99.origin.double y = rect_24;
  v99.size.double width = v79;
  v99.size.double height = v87;
  double v68 = round(24.0 - baselineOffset);
  double v32 = v31 - CGRectGetHeight(v99) - v68;
  imageLayer = self->_imageLayer;
  if (v32 >= 48.0)
  {
    v100.origin.double x = rect;
    v100.origin.double y = rect_8;
    v100.size.double width = width;
    CGFloat v34 = v66;
    v100.size.double height = v66;
    BOOL v35 = CGRectGetWidth(v100) < v72 / v70 * 48.0;
  }
  else
  {
    CGFloat v34 = v66;
    BOOL v35 = 1;
  }
  double v36 = v65 - v64;
  [(CALayer *)imageLayer setHidden:v35];
  double v37 = v76;
  if ([(CALayer *)self->_imageLayer isHidden] || self->_imageSize.width * self->_imageSize.height <= 0.0)
  {
    CGFloat v50 = v63;
    double v52 = v74;
  }
  else
  {
    double v38 = round(32.0 - baselineOffset);
    v101.origin.double x = rect;
    v101.origin.double y = rect_8;
    v101.size.double width = v85;
    v101.size.double height = v34;
    double v39 = CGRectGetWidth(v101);
    double v40 = p_imageSize->width;
    double v41 = self->_imageSize.height;
    if (v39 >= p_imageSize->width) {
      double v39 = p_imageSize->width;
    }
    if (v32 >= v41) {
      double v42 = self->_imageSize.height;
    }
    else {
      double v42 = v32;
    }
    double v43 = v39 / v40;
    double v44 = v42 / v41;
    if (v43 >= v44) {
      double v43 = v44;
    }
    double v45 = fmin(v43, 1.0);
    double v46 = v40 * v45;
    double v37 = v41 * v45;
    v102.origin.double x = 0.0;
    v102.origin.double y = 0.0;
    v102.size.double width = v46;
    v102.size.double height = v37;
    double v47 = v32 - CGRectGetHeight(v102);
    if (v68 >= v47) {
      double v47 = v68;
    }
    if (v47 >= v38) {
      double v48 = v38;
    }
    else {
      double v48 = v47;
    }
    v103.origin.double x = v80;
    v103.origin.double y = rect_24;
    v103.size.double width = v79;
    v103.size.double height = v87;
    CGFloat v49 = CGRectGetHeight(v103) + v48;
    v104.origin.double x = 0.0;
    v104.origin.double y = 0.0;
    v104.size.double width = v46;
    v104.size.double height = v37;
    double rect_16 = rect_16 + v45 * 3.0;
    CGFloat v50 = v46;
    CGFloat v51 = (CGRectGetHeight(v104) + v49) * 0.5;
    v105.origin.double x = 0.0;
    v105.origin.double y = 0.0;
    v105.size.double width = v46;
    v105.size.double height = v37;
    double v52 = v74 - (v51 - CGRectGetMidY(v105));
    v106.origin.double x = v80;
    v106.origin.double y = rect_24;
    v106.size.double width = v79;
    v106.size.double height = v87;
    double v36 = v36 + v51 - CGRectGetMidY(v106);
  }
  -[CALayer setPosition:](self->_imageLayer, "setPosition:", round(rect_16), round(v52));
  -[CATextLayer setPosition:](self->_textLayer, "setPosition:", round(MidX), round(v36));
  v53 = self->_imageLayer;
  v107.origin.double x = 0.0;
  v107.origin.double y = 0.0;
  v107.size.double width = v50;
  v107.size.double height = v37;
  double v54 = round(CGRectGetMinX(v107));
  v108.origin.double x = 0.0;
  v108.origin.double y = 0.0;
  v108.size.double width = v50;
  v108.size.double height = v37;
  double v55 = round(CGRectGetMinY(v108));
  v109.origin.double x = 0.0;
  v109.origin.double y = 0.0;
  v109.size.double width = v50;
  v109.size.double height = v37;
  double v56 = round(CGRectGetWidth(v109));
  v110.origin.double x = 0.0;
  v110.origin.double y = 0.0;
  v110.size.double width = v50;
  v110.size.double height = v37;
  -[CALayer setBounds:](v53, "setBounds:", v54, v55, v56, round(CGRectGetHeight(v110)));
  v57 = self->_textLayer;
  v111.origin.double x = v78;
  v111.origin.double y = v77;
  v111.size.double width = v86;
  v111.size.double height = v24;
  double v58 = round(CGRectGetMinX(v111));
  v112.origin.double x = v78;
  v112.origin.double y = v77;
  v112.size.double width = v86;
  v112.size.double height = v24;
  double v59 = round(CGRectGetMinY(v112));
  v113.origin.double x = v78;
  v113.origin.double y = v77;
  v113.size.double width = v86;
  v113.size.double height = v24;
  double v60 = round(CGRectGetWidth(v113));
  v114.origin.double x = v78;
  v114.origin.double y = v77;
  v114.size.double width = v86;
  v114.size.double height = v24;
  double v61 = round(CGRectGetHeight(v114));

  -[CATextLayer setBounds:](v57, "setBounds:", v58, v59, v60, v61);
}

- (void)layoutSublayers
{
  v14.receiver = self;
  v14.super_class = (Class)AVPictureInPictureIndicatorSublayer;
  [(AVPictureInPictureIndicatorSublayer *)&v14 layoutSublayers];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(AVPictureInPictureIndicatorSublayer *)self bounds];
  BOOL v7 = v5 + -16.0 > 32.0 && v6 + -16.0 > 32.0;
  double v8 = 8.0;
  if (v7) {
    double v8 = 16.0;
  }
  CGRect v15 = CGRectInset(*(CGRect *)&v3, v8, v8);
  double x = v15.origin.x;
  double y = v15.origin.y;
  double width = v15.size.width;
  double height = v15.size.height;
  if ([(AVPictureInPictureIndicatorSublayer *)self canRenderAttributedTextWithoutTruncationInsideRect:"canRenderAttributedTextWithoutTruncationInsideRect:"])
  {
    -[AVPictureInPictureIndicatorSublayer layoutSublayersWithTextAndImageUsingInsetBounds:](self, "layoutSublayersWithTextAndImageUsingInsetBounds:", x, y, width, height);
  }
  else
  {
    [(CALayer *)self->_imageLayer setHidden:0];
    v19.origin.double x = x;
    v19.origin.double y = y;
    v19.size.double width = width;
    v19.size.double height = height;
    CGRect v16 = AVMakeRectWithAspectRatioInsideRect(self->_imageSize, v19);
    -[CALayer setBounds:](self->_imageLayer, "setBounds:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
    v17.origin.double x = x;
    v17.origin.double y = y;
    v17.size.double width = width;
    v17.size.double height = height;
    double v13 = round(CGRectGetMidX(v17));
    v18.origin.double x = x;
    v18.origin.double y = y;
    v18.size.double width = width;
    v18.size.double height = height;
    -[CALayer setPosition:](self->_imageLayer, "setPosition:", v13, round(CGRectGetMidY(v18)));
    [(CATextLayer *)self->_textLayer setHidden:1];
  }
  [MEMORY[0x1E4F39CF8] commit];
}

- (void)setCustomText:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  double v4 = (__CFString *)a3;
  if (([(__CFString *)v4 isEqualToString:self->_customText] & 1) == 0)
  {
    double v5 = objc_msgSend(MEMORY[0x1E4FB1618], "AV_indicatorForegroundColor");
    double v6 = [MEMORY[0x1E4FB08E0] systemFontOfSize:13.0];
    id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
    if (v4) {
      double v8 = v4;
    }
    else {
      double v8 = &stru_1F09185C8;
    }
    uint64_t v9 = *MEMORY[0x1E4FB0700];
    v15[0] = *MEMORY[0x1E4FB06F8];
    v15[1] = v9;
    v16[0] = v6;
    v16[1] = v5;
    double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    double v11 = (NSAttributedString *)[v7 initWithString:v8 attributes:v10];
    attributedText = self->_attributedText;
    self->_attributedText = v11;

    double v13 = (NSString *)[(__CFString *)v4 copy];
    customText = self->_customText;
    self->_customText = v13;

    [(CATextLayer *)self->_textLayer setString:v4];
    [(AVPictureInPictureIndicatorSublayer *)self setNeedsLayout];
  }
}

- (AVPictureInPictureIndicatorSublayer)init
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3A8];
  double v5 = _AVMethodProem(self);
  double v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  [v3 raise:v4, @"%@ is not a valid initializer. You must call -[%@ initWithTraitCollection:opaque:].", v5, v7 format];

  return [(AVPictureInPictureIndicatorSublayer *)self initWithDisplayScale:0 placeholderImage:0 opaque:1.0];
}

- (AVPictureInPictureIndicatorSublayer)initWithDisplayScale:(double)a3 placeholderImage:(CGImage *)a4 opaque:(BOOL)a5
{
  BOOL v5 = a5;
  v34[2] = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)AVPictureInPictureIndicatorSublayer;
  double v8 = [(AVPictureInPictureIndicatorSublayer *)&v32 init];
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E4FB1618], "AV_indicatorBackgroundColor");
    id v9 = objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 CGColor];

    double v11 = objc_msgSend(MEMORY[0x1E4FB1618], "AV_indicatorForegroundColor");
    CGFloat v12 = [MEMORY[0x1E4FB08E0] systemFontOfSize:13.0];
    [v12 lineHeight];
    v8->_double lineHeight = v13;
    if (v5) {
      uint64_t v14 = v10;
    }
    else {
      uint64_t v14 = 0;
    }
    [(AVPictureInPictureIndicatorSublayer *)v8 setBackgroundColor:v14];
    CGFloat Width = (double)CGImageGetWidth(a4);
    size_t Height = CGImageGetHeight(a4);
    v8->_imageSize.double width = Width;
    v8->_imageSize.double height = (double)Height;
    CGRect v17 = AVLocalizedString(@"PICTURE_IN_PICTURE_INDICATOR_LAYER_TITLE");
    id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v19 = *MEMORY[0x1E4FB0700];
    v33[0] = *MEMORY[0x1E4FB06F8];
    v33[1] = v19;
    v34[0] = v12;
    v34[1] = v11;
    double v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
    uint64_t v21 = [v18 initWithString:v17 attributes:v20];
    attributedText = v8->_attributedText;
    v8->_attributedText = (NSAttributedString *)v21;

    [v12 ascender];
    v8->_double baselineOffset = v23;
    CTFontGetLanguageAwareOutsets();
    v8->_languageAwareOutsets.top = 0.0;
    v8->_languageAwareOutsets.double left = 0.0;
    v8->_languageAwareOutsets.bottom = 0.0;
    v8->_languageAwareOutsets.right = 0.0;
    uint64_t v24 = [MEMORY[0x1E4F39BE8] layer];
    imageLayer = v8->_imageLayer;
    v8->_imageLayer = (CALayer *)v24;

    [(CALayer *)v8->_imageLayer setContents:a4];
    [(CALayer *)v8->_imageLayer setContentsGravity:*MEMORY[0x1E4F3A3D0]];
    [(CALayer *)v8->_imageLayer setContentsScale:a3];
    double v26 = v8->_imageLayer;
    [(AVPictureInPictureIndicatorSublayer *)v8 bounds];
    -[CALayer setBounds:](v26, "setBounds:");
    [(AVPictureInPictureIndicatorSublayer *)v8 addSublayer:v8->_imageLayer];
    uint64_t v27 = [MEMORY[0x1E4F39CE8] layer];
    textLayer = v8->_textLayer;
    v8->_textLayer = (CATextLayer *)v27;

    [(CATextLayer *)v8->_textLayer setFont:v12];
    [(CATextLayer *)v8->_textLayer setFontSize:13.0];
    v29 = v8->_textLayer;
    id v30 = v11;
    -[CATextLayer setForegroundColor:](v29, "setForegroundColor:", [v30 CGColor]);
    [(CATextLayer *)v8->_textLayer setAlignmentMode:*MEMORY[0x1E4F39D38]];
    [(CATextLayer *)v8->_textLayer setContentsScale:a3];
    [(CATextLayer *)v8->_textLayer setString:v8->_attributedText];
    [(CATextLayer *)v8->_textLayer setTruncationMode:*MEMORY[0x1E4F3A5E0]];
    [(CATextLayer *)v8->_textLayer setWrapped:1];
    [(AVPictureInPictureIndicatorSublayer *)v8 addSublayer:v8->_textLayer];
  }
  return v8;
}

@end