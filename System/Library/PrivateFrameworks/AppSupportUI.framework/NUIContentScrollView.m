@interface NUIContentScrollView
+ (BOOL)requiresConstraintBasedLayout;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3;
- (BOOL)canScrollDocumentViewHorizontally;
- (BOOL)canScrollDocumentViewVertically;
- (BOOL)isLayoutSizeDependentOnPerpendicularAxis;
- (CGSize)_finalSizeForTargetSize:(CGSize)result resultSize:(CGSize)a4 insets:(UIEdgeInsets)a5;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (CGSize)_measureSizeForTargetSize:(CGSize)a3 insets:(UIEdgeInsets)a4;
- (NUIContentScrollView)initWithDocumentView:(id)a3;
- (NUIContentScrollView)initWithFrame:(CGRect)a3;
- (UIView)documentView;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (int64_t)horizontalAlignment;
- (int64_t)verticalAlignment;
- (unint64_t)_axesForDerivingIntrinsicContentSizeFromLayoutSize;
- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3;
- (void)layoutSubviews;
- (void)setCanScrollDocumentViewHorizontally:(BOOL)a3;
- (void)setCanScrollDocumentViewVertically:(BOOL)a3;
- (void)setDocumentView:(id)a3;
- (void)setHorizontalAlignment:(int64_t)a3;
- (void)setVerticalAlignment:(int64_t)a3;
@end

@implementation NUIContentScrollView

+ (BOOL)requiresConstraintBasedLayout
{
  return 0;
}

- (void)setCanScrollDocumentViewHorizontally:(BOOL)a3
{
  if (self->_canScrollDocumentViewHorizontally != a3)
  {
    self->_canScrollDocumentViewHorizontally = a3;
    [(NUIContentScrollView *)self setNeedsLayout];
  }
}

- (void)setCanScrollDocumentViewVertically:(BOOL)a3
{
  if (self->_canScrollDocumentViewVertically != a3)
  {
    self->_canScrollDocumentViewVertically = a3;
    [(NUIContentScrollView *)self setNeedsLayout];
  }
}

- (NUIContentScrollView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = [(NUIContentScrollView *)self initWithDocumentView:0];
  v8 = v7;
  if (v7) {
    -[NUIContentScrollView setFrame:](v7, "setFrame:", x, y, width, height);
  }
  return v8;
}

- (NUIContentScrollView)initWithDocumentView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NUIContentScrollView;
  v5 = -[NUIContentScrollView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5)
  {
    v5->_canScrollDocumentViewHorizontalldouble y = 1;
    v5->_canScrollDocumentViewVerticalldouble y = 1;
    [(NUIContentScrollView *)v5 _setHostsLayoutEngine:1];
    v6->_horizontalAlignment = 3;
    v6->_verticalAlignment = 1;
    [(NUIContentScrollView *)v6 setDocumentView:v4];
  }

  return v6;
}

- (void)setDocumentView:(id)a3
{
  id v7 = a3;
  id v5 = [(NUIContentScrollView *)self documentView];

  v6 = v7;
  if (v5 != v7)
  {
    [(UIView *)self->_documentView removeFromSuperview];
    objc_storeStrong((id *)&self->_documentView, a3);
    if (v7) {
      [(NUIContentScrollView *)self addSubview:v7];
    }
    [(NUIContentScrollView *)self invalidateIntrinsicContentSize];
    v6 = v7;
  }
}

- (void)setHorizontalAlignment:(int64_t)a3
{
  int64_t v3 = 3;
  if (a3 != -1) {
    int64_t v3 = a3;
  }
  if (self->_horizontalAlignment != v3)
  {
    self->_horizontalAlignment = v3;
    [(NUIContentScrollView *)self setNeedsLayout];
  }
}

- (void)setVerticalAlignment:(int64_t)a3
{
  if (a3 == -1) {
    int64_t v3 = 1;
  }
  else {
    int64_t v3 = a3;
  }
  if (self->_verticalAlignment != v3)
  {
    self->_verticalAlignment = v3;
    [(NUIContentScrollView *)self setNeedsLayout];
  }
}

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  v2 = [(NUIContentScrollView *)self documentView];
  char v3 = [v2 isLayoutSizeDependentOnPerpendicularAxis];

  return v3;
}

- (unint64_t)_axesForDerivingIntrinsicContentSizeFromLayoutSize
{
  return 3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3
{
  [(UIView *)self effectiveFirstBaselineOffsetFromContentTop];
  double v5 = v4;
  [(UIView *)self effectiveBaselineOffsetFromContentBottom];
  double v7 = v6;
  objc_super v8 = [(NUIContentScrollView *)self viewForFirstBaselineLayout];

  if (v8 == self) {
    double v5 = 2.22507386e-308;
  }
  v9 = [(NUIContentScrollView *)self viewForLastBaselineLayout];

  if (v9 == self) {
    double v10 = 2.22507386e-308;
  }
  else {
    double v10 = v7;
  }
  double v11 = v5;
  result.var1 = v10;
  result.var0 = v11;
  return result;
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  id v4 = a3;
  id v5 = [(NUIContentScrollView *)self documentView];

  if (v5 == v4)
  {
    [(NUIContentScrollView *)self invalidateIntrinsicContentSize];
    [(NUIContentScrollView *)self setNeedsLayout];
  }
  v6.receiver = self;
  v6.super_class = (Class)NUIContentScrollView;
  [(UIView *)&v6 _intrinsicContentSizeInvalidatedForChildView:v4];
}

- (CGSize)_measureSizeForTargetSize:(CGSize)a3 insets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  double height = a3.height;
  double width = a3.width;
  BOOL v11 = fabs(a3.width) < 0.001
     || [(NUIContentScrollView *)self canScrollDocumentViewHorizontally];
  if (fabs(height) >= 0.001)
  {
    BOOL v13 = [(NUIContentScrollView *)self canScrollDocumentViewVertically];
    double v12 = width - (left + right);
    if (v11) {
      double v12 = 3.40282347e38;
    }
    if (!v13)
    {
      double v14 = height - (top + bottom);
      goto LABEL_13;
    }
  }
  else
  {
    double v12 = width - (left + right);
    if (v11) {
      double v12 = 3.40282347e38;
    }
  }
  double v14 = 3.40282347e38;
LABEL_13:
  result.double height = v14;
  result.double width = v12;
  return result;
}

- (CGSize)_finalSizeForTargetSize:(CGSize)result resultSize:(CGSize)a4 insets:(UIEdgeInsets)a5
{
  double v5 = a5.right + a4.width + a5.left;
  if (v5 < result.width) {
    result.double width = v5;
  }
  if (a5.bottom + a4.height + a5.top < result.height) {
    result.double height = a5.bottom + a4.height + a5.top;
  }
  return result;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(NUIContentScrollView *)self contentInset];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v26 = width;
  double v27 = height;
  -[NUIContentScrollView _measureSizeForTargetSize:insets:](self, "_measureSizeForTargetSize:insets:", width, height, v6, v8, v10, v12);
  double v16 = 0.0;
  double v17 = 0.0;
  if (v14 > 0.0)
  {
    double v18 = v15;
    if (v15 > 0.0)
    {
      double v19 = v14;
      v20 = [(NUIContentScrollView *)self documentView];

      if (v20)
      {
        v21 = [(NUIContentScrollView *)self documentView];
        objc_msgSend(v21, "effectiveLayoutSizeFittingSize:", v19, v18);
        double v16 = v22;
        double v17 = v23;
      }
    }
  }
  -[NUIContentScrollView _finalSizeForTargetSize:resultSize:insets:](self, "_finalSizeForTargetSize:resultSize:insets:", v26, v27, v16, v17, v7, v9, v11, v13);
  result.double height = v25;
  result.double width = v24;
  return result;
}

- (id)viewForFirstBaselineLayout
{
  char v3 = [(NUIContentScrollView *)self documentView];

  if (v3)
  {
    id v4 = [(NUIContentScrollView *)self documentView];
    double v5 = [v4 viewForFirstBaselineLayout];
  }
  else
  {
    double v5 = self;
  }
  return v5;
}

- (id)viewForLastBaselineLayout
{
  char v3 = [(NUIContentScrollView *)self documentView];

  if (v3)
  {
    id v4 = [(NUIContentScrollView *)self documentView];
    double v5 = [v4 viewForLastBaselineLayout];
  }
  else
  {
    double v5 = self;
  }
  return v5;
}

- (void)layoutSubviews
{
  v82.receiver = self;
  v82.super_class = (Class)NUIContentScrollView;
  [(NUIContentScrollView *)&v82 layoutSubviews];
  id v4 = [(NUIContentScrollView *)self documentView];

  if (v4)
  {
    [(NUIContentScrollView *)self contentInset];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    [(NUIContentScrollView *)self bounds];
    double v14 = v13 - (v8 + v12);
    double v16 = v15 - (v6 + v10);
    double v17 = *MEMORY[0x1E4F1DB30];
    double v18 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (![(NUIContentScrollView *)self canScrollDocumentViewHorizontally]) {
      double v17 = v14;
    }
    if (![(NUIContentScrollView *)self canScrollDocumentViewVertically]) {
      double v18 = v16;
    }
    double v20 = *MEMORY[0x1E4F1DB28];
    double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    v21 = [(NUIContentScrollView *)self documentView];
    objc_msgSend(v21, "effectiveLayoutSizeFittingSize:", v17, v18);
    double v23 = v22;
    double v25 = v24;

    -[NUIContentScrollView setContentSize:](self, "setContentSize:", v23, v25);
    uint64_t v26 = [(NUIContentScrollView *)self effectiveUserInterfaceLayoutDirection];
    int64_t horizontalAlignment = self->_horizontalAlignment;
    if (v26 == 1)
    {
      switch(horizontalAlignment)
      {
        case 0:
          goto LABEL_9;
        case 1:
          goto LABEL_18;
        case 3:
          goto LABEL_17;
        case 4:
          break;
        default:
          goto LABEL_12;
      }
    }
    else
    {
      switch(horizontalAlignment)
      {
        case 0:
LABEL_9:
          v83.origin.double x = v20;
          v83.origin.double y = v19;
          v83.size.double width = v23;
          v83.size.double height = v25;
          double Width = CGRectGetWidth(v83);
          if (Width >= v14) {
            double v23 = Width;
          }
          else {
            double v23 = v14;
          }
          break;
        case 1:
          break;
        case 3:
LABEL_17:
          v84.origin.double x = v20;
          v84.origin.double y = v19;
          v84.size.double width = v23;
          v84.size.double height = v25;
          double v34 = (v14 - CGRectGetWidth(v84)) * 0.5;
          goto LABEL_19;
        case 4:
LABEL_18:
          v85.origin.double x = v20;
          v85.origin.double y = v19;
          v85.size.double width = v23;
          v85.size.double height = v25;
          double v34 = v14 - CGRectGetWidth(v85);
LABEL_19:
          double v20 = fmax(v34, 0.0);
          break;
        default:
LABEL_12:
          if (_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
          {
            uint64_t v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContentScrollView.m"];
            v30 = (void *)v29;
            v31 = @"<Unknown File>";
            if (v29) {
              v31 = (__CFString *)v29;
            }
            v32 = v31;

            v33 = [MEMORY[0x1E4F28B00] currentHandler];
            objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v32, 260, @"Invalid horizontal alignment %ld.", self->_horizontalAlignment);
          }
          break;
      }
    }
    switch(self->_verticalAlignment)
    {
      case 0:
        v86.origin.double x = v20;
        v86.origin.double y = v19;
        v86.size.double width = v23;
        v86.size.double height = v25;
        double Height = CGRectGetHeight(v86);
        if (Height >= v16) {
          double v25 = Height;
        }
        else {
          double v25 = v16;
        }
        break;
      case 1:
        break;
      case 3:
        v87.origin.double x = v20;
        v87.origin.double y = v19;
        v87.size.double width = v23;
        v87.size.double height = v25;
        double v41 = (v16 - CGRectGetHeight(v87)) * 0.5;
        goto LABEL_31;
      case 4:
        v88.origin.double x = v20;
        v88.origin.double y = v19;
        v88.size.double width = v23;
        v88.size.double height = v25;
        double v41 = v16 - CGRectGetHeight(v88);
LABEL_31:
        double v19 = fmax(v41, 0.0);
        break;
      default:
        if (_NUIEnableAPIMisuseAssertions || _NUIIsDebuggerAttached())
        {
          uint64_t v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIContentScrollView.m"];
          v37 = (void *)v36;
          v38 = @"<Unknown File>";
          if (v36) {
            v38 = (__CFString *)v36;
          }
          v39 = v38;

          v40 = [MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v39, 276, @"Invalid vertical alignment %ld.", self->_verticalAlignment);
        }
        break;
    }
    [(NUIContentScrollView *)self _currentScreenScale];
    double v43 = v42;
    v89.origin.double x = v20;
    v89.origin.double y = v19;
    v89.size.double width = v23;
    v89.size.double height = v25;
    double MinX = CGRectGetMinX(v89);
    if (v43 == 1.0)
    {
      double v45 = ceil(MinX);
      double v46 = v45 - MinX;
      double v47 = floor(MinX);
      if (v46 >= 0.001) {
        double v48 = v47;
      }
      else {
        double v48 = v45;
      }
      v90.origin.double x = v20;
      v90.origin.double y = v19;
      v90.size.double width = v23;
      v90.size.double height = v25;
      double MinY = CGRectGetMinY(v90);
      double v50 = ceil(MinY);
      double v51 = v50 - MinY;
      double v52 = floor(MinY);
      if (v51 >= 0.001) {
        double v53 = v52;
      }
      else {
        double v53 = v50;
      }
      v91.origin.double x = v20;
      v91.origin.double y = v19;
      v91.size.double width = v23;
      v91.size.double height = v25;
      double v54 = CGRectGetWidth(v91);
      double v55 = floor(v54);
      double v56 = v54 - v55;
      double v57 = ceil(v54);
      if (v56 >= 0.001) {
        double v58 = v57;
      }
      else {
        double v58 = v55;
      }
      v92.origin.double x = v20;
      v92.origin.double y = v19;
      v92.size.double width = v23;
      v92.size.double height = v25;
      double v59 = CGRectGetHeight(v92);
      double v60 = floor(v59);
      double v61 = v59 - v60;
      double v62 = ceil(v59);
      if (v61 >= 0.001) {
        double v63 = v62;
      }
      else {
        double v63 = v60;
      }
    }
    else
    {
      double v64 = v43 * MinX;
      double v65 = ceil(v64);
      double v66 = v65 - v64;
      double v67 = floor(v64);
      if (v66 < 0.001) {
        double v67 = v65;
      }
      double v81 = v67 / v43;
      v93.origin.double x = v20;
      v93.origin.double y = v19;
      v93.size.double width = v23;
      v93.size.double height = v25;
      double v68 = v43 * CGRectGetMinY(v93);
      double v69 = ceil(v68);
      double v70 = v69 - v68;
      double v71 = floor(v68);
      if (v70 < 0.001) {
        double v71 = v69;
      }
      double v53 = v71 / v43;
      v94.origin.double x = v20;
      v94.origin.double y = v19;
      v94.size.double width = v23;
      v94.size.double height = v25;
      double v72 = v43 * CGRectGetWidth(v94);
      double v73 = floor(v72);
      double v74 = v72 - v73;
      double v75 = ceil(v72);
      if (v74 < 0.001) {
        double v75 = v73;
      }
      double v58 = v75 / v43;
      v95.origin.double x = v20;
      v95.origin.double y = v19;
      v95.size.double width = v23;
      v95.size.double height = v25;
      double v76 = v43 * CGRectGetHeight(v95);
      double v77 = floor(v76);
      double v78 = v76 - v77;
      double v79 = ceil(v76);
      double v48 = v81;
      if (v78 < 0.001) {
        double v79 = v77;
      }
      double v63 = v79 / v43;
    }
    v80 = [(NUIContentScrollView *)self documentView];
    objc_msgSend(v80, "setFrame:", v48, v53, v58, v63);
  }
}

- (UIView)documentView
{
  return self->_documentView;
}

- (int64_t)horizontalAlignment
{
  return self->_horizontalAlignment;
}

- (int64_t)verticalAlignment
{
  return self->_verticalAlignment;
}

- (BOOL)canScrollDocumentViewHorizontally
{
  return self->_canScrollDocumentViewHorizontally;
}

- (BOOL)canScrollDocumentViewVertically
{
  return self->_canScrollDocumentViewVertically;
}

- (void).cxx_destruct
{
}

@end