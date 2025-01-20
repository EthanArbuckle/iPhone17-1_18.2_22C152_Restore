@interface PKPaletteTooltipPresentationHandle
- (PKPaletteTooltipPresentationHandle)initWithHostingView:(id)a3;
- (void)hideFloatingLabel;
- (void)showWithText:(id)a3 fromView:(id)a4 rect:(CGRect)a5 atEdge:(unint64_t)a6 offset:(double)a7 traitCollection:(id)a8;
@end

@implementation PKPaletteTooltipPresentationHandle

- (PKPaletteTooltipPresentationHandle)initWithHostingView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPaletteTooltipPresentationHandle;
  v5 = [(PKPaletteTooltipPresentationHandle *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_hostingView, v4);
  }

  return v6;
}

- (void)showWithText:(id)a3 fromView:(id)a4 rect:(CGRect)a5 atEdge:(unint64_t)a6 offset:(double)a7 traitCollection:(id)a8
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v56 = a3;
  id v17 = a4;
  id v18 = a8;
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_hideFloatingLabel object:0];
  [(PKPaletteTooltipPresentationHandle *)self hideFloatingLabel];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostingView);
  if (WeakRetained)
  {
    v58.origin.double x = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v17, WeakRetained, x, y, width, height);
    CGFloat v20 = v58.origin.x;
    CGFloat v21 = v58.origin.y;
    CGFloat v22 = v58.size.width;
    CGFloat v23 = v58.size.height;
    double MidX = CGRectGetMidX(v58);
    v59.origin.double x = v20;
    v59.origin.double y = v21;
    v59.size.double width = v22;
    v59.size.double height = v23;
    double MidY = CGRectGetMidY(v59);
    v26 = +[PKFloatingLabelView floatingLabelViewWithString:(uint64_t)PKFloatingLabelView font:v56 location:0 traitCollection:v18];
    floatingLabel = self->_floatingLabel;
    self->_floatingLabel = v26;

    [(UIView *)self->_floatingLabel frame];
    double v30 = v28;
    double v31 = v28;
    double v32 = v29;
    CGFloat v54 = v33;
    CGFloat v55 = v34;
    double v35 = v29;
    switch(a6)
    {
      case 1uLL:
        v60.origin.double x = v20;
        double v50 = v30;
        double v52 = v29;
        v60.origin.double y = v21;
        v60.size.double width = v22;
        v60.size.double height = v23;
        CGFloat v49 = CGRectGetMidX(v60);
        v61.origin.double x = v20;
        v61.origin.double y = v21;
        v61.size.double width = v22;
        v61.size.double height = v23;
        double v35 = CGRectGetMaxY(v61) + a7;
        v62.origin.double x = v31;
        v62.origin.double y = v32;
        v62.size.double width = v54;
        v62.size.double height = v55;
        CGFloat v36 = CGRectGetMidX(v62);
        v63.origin.double x = v31;
        v63.origin.double y = v32;
        v63.size.double width = v54;
        v63.size.double height = v55;
        double MinY = CGRectGetMinY(v63);
        goto LABEL_6;
      case 2uLL:
        v64.origin.double x = v20;
        double v51 = v30;
        double v53 = v29;
        v64.origin.double y = v21;
        v64.size.double width = v22;
        v64.size.double height = v23;
        double v38 = CGRectGetMaxX(v64) + a7;
        v65.origin.double x = v20;
        v65.origin.double y = v21;
        v65.size.double width = v22;
        v65.size.double height = v23;
        double v35 = CGRectGetMidY(v65);
        v66.origin.double x = v31;
        v66.origin.double y = v32;
        CGFloat v40 = v54;
        CGFloat v39 = v55;
        v66.size.double width = v54;
        v66.size.double height = v55;
        double MinX = CGRectGetMinX(v66);
        goto LABEL_8;
      case 4uLL:
        v67.origin.double x = v20;
        double v50 = v30;
        double v52 = v29;
        v67.origin.double y = v21;
        v67.size.double width = v22;
        v67.size.double height = v23;
        CGFloat v49 = CGRectGetMidX(v67);
        v68.origin.double x = v20;
        v68.origin.double y = v21;
        v68.size.double width = v22;
        v68.size.double height = v23;
        double v35 = CGRectGetMinY(v68) - a7;
        v69.origin.double x = v31;
        v69.origin.double y = v32;
        v69.size.double width = v54;
        v69.size.double height = v55;
        CGFloat v36 = CGRectGetMidX(v69);
        v70.origin.double x = v31;
        v70.origin.double y = v32;
        v70.size.double width = v54;
        v70.size.double height = v55;
        double MinY = CGRectGetMaxY(v70);
LABEL_6:
        double v30 = v50;
        double v29 = v52;
        double v32 = MinY;
        double v28 = v49;
        goto LABEL_9;
      case 8uLL:
        v71.origin.double x = v20;
        double v51 = v30;
        double v53 = v29;
        v71.origin.double y = v21;
        v71.size.double width = v22;
        v71.size.double height = v23;
        double v38 = CGRectGetMinX(v71) - a7;
        v72.origin.double x = v20;
        v72.origin.double y = v21;
        v72.size.double width = v22;
        v72.size.double height = v23;
        double v35 = CGRectGetMidY(v72);
        v73.origin.double x = v31;
        v73.origin.double y = v32;
        CGFloat v40 = v54;
        CGFloat v39 = v55;
        v73.size.double width = v54;
        v73.size.double height = v55;
        double MinX = CGRectGetMaxX(v73);
LABEL_8:
        CGFloat v36 = MinX;
        v74.origin.double x = v31;
        v74.origin.double y = v32;
        v74.size.double width = v40;
        v74.size.double height = v39;
        CGFloat v42 = CGRectGetMidY(v74);
        double v30 = v51;
        double v29 = v53;
        double v32 = v42;
        double v28 = v38;
LABEL_9:
        double v31 = v36;
        break;
      default:
        break;
    }
    double v43 = v30 + v28 - v31;
    CGFloat v44 = v29 + v35 - v32;
    objc_msgSend(WeakRetained, "bounds", *(void *)&v49);
    [(UIView *)self->_floatingLabel setFrame:DKDUpdateFixedSizeRectToFitInsideRectIfPossible(v43, v44, v54, v55, v45, v46, v47, v48)];
    [WeakRetained addSubview:self->_floatingLabel];
    [(PKPaletteTooltipPresentationHandle *)self performSelector:sel_hideFloatingLabel withObject:0 afterDelay:1.0];
  }
}

- (void)hideFloatingLabel
{
  [(UIView *)self->_floatingLabel removeFromSuperview];
  floatingLabel = self->_floatingLabel;
  self->_floatingLabel = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingLabel, 0);

  objc_destroyWeak((id *)&self->_hostingView);
}

@end