@interface CameraTargetView
+ (Class)layerClass;
- (BOOL)flashUIEnabled;
- (CAMFlashButton)flashButton;
- (CAMFlashStatusIndicator)flashIndicator;
- (CAMFlipButton)flipButton;
- (CGSize)flipButtonIntrinsicContentSize;
- (CGSize)shutterButtonIntrinsicContentSize;
- (CUShutterButton)shutterButton;
- (CameraTargetView)initWithFrame:(CGRect)a3 color:(id)a4 thickness:(double)a5 instructionText:(id)a6 presentationOptions:(int64_t)a7;
- (CameraTargetView)initWithFrame:(CGRect)a3 instructionText:(id)a4 presentationOptions:(int64_t)a5;
- (CameraTargetViewDelegate)delegate;
- (UIButton)cancelButton;
- (UILabel)viewfinderInstruction;
- (UIView)viewfinderOutsideRegionBottom;
- (UIView)viewfinderOutsideRegionTop;
- (int64_t)cameraPresentation;
- (void)cancelTapped:(id)a3;
- (void)flashTapped:(id)a3;
- (void)flipTapped:(id)a3;
- (void)setCameraPresentation:(int64_t)a3;
- (void)setCancelButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFlashButton:(id)a3;
- (void)setFlashIndicator:(id)a3;
- (void)setFlashState:(BOOL)a3;
- (void)setFlashUIEnabled:(BOOL)a3;
- (void)setFlipButton:(id)a3;
- (void)setFlipButtonIntrinsicContentSize:(CGSize)a3;
- (void)setShutterButton:(id)a3;
- (void)setShutterButtonIntrinsicContentSize:(CGSize)a3;
- (void)setViewfinderInstruction:(id)a3;
- (void)setViewfinderOutsideRegionBottom:(id)a3;
- (void)setViewfinderOutsideRegionTop:(id)a3;
- (void)takePicture:(id)a3;
- (void)updateConstraints;
@end

@implementation CameraTargetView

- (CameraTargetView)initWithFrame:(CGRect)a3 color:(id)a4 thickness:(double)a5 instructionText:(id)a6 presentationOptions:(int64_t)a7
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = a4;
  id v16 = a6;
  v69.receiver = self;
  v69.super_class = (Class)CameraTargetView;
  v17 = -[CameraTargetView initWithFrame:](&v69, "initWithFrame:", x, y, width, height);
  v18 = v17;
  if (v17)
  {
    v17->_cameraPresentation = a7;
    [(CameraTargetView *)v17 setOpaque:0];
    v19 = +[UIColor clearColor];
    [(CameraTargetView *)v18 setBackgroundColor:v19];

    if (a7)
    {
      v20 = +[UIBezierPath bezierPath];
      [(CameraTargetView *)v18 frame];
      [(CameraTargetView *)v18 center];
      [v20 addArcWithCenter:1];
      v21 = [(CameraTargetView *)v18 layer];
      id v22 = v20;
      [v21 setPath:[v22 CGPath]];
      [v21 setStrokeColor:[v15 CGColor]];
      id v23 = +[UIColor clearColor];
      objc_msgSend(v21, "setFillColor:", objc_msgSend(v23, "CGColor"));

      [v21 setLineWidth:a5];
      [v21 setLineCap:kCALineCapRound];
      [v21 setLineJoin:kCALineJoinRound];
    }
    v24 = +[UIColor colorWithWhite:0.0 alpha:0.5];
    id v25 = objc_alloc((Class)UIView);
    double v26 = CGRectZero.origin.y;
    double v27 = CGRectZero.size.width;
    double v28 = CGRectZero.size.height;
    v29 = [v25 initWithFrame:CGRectZero.origin.x, v26, v27, v28];
    viewfinderOutsideRegionTop = v18->_viewfinderOutsideRegionTop;
    v18->_viewfinderOutsideRegionTop = v29;

    [(UIView *)v18->_viewfinderOutsideRegionTop setOpaque:0];
    [(UIView *)v18->_viewfinderOutsideRegionTop setBackgroundColor:v24];
    LODWORD(v31) = 1148846080;
    [(UIView *)v18->_viewfinderOutsideRegionTop setContentHuggingPriority:1 forAxis:v31];
    [(UIView *)v18->_viewfinderOutsideRegionTop setContentCompressionResistancePriority:1 forAxis:0.0];
    [(UIView *)v18->_viewfinderOutsideRegionTop setTranslatesAutoresizingMaskIntoConstraints:0];
    v32 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, v26, v27, v28];
    viewfinderOutsideRegionBottom = v18->_viewfinderOutsideRegionBottom;
    v18->_viewfinderOutsideRegionBottom = v32;

    [(UIView *)v18->_viewfinderOutsideRegionBottom setOpaque:0];
    [(UIView *)v18->_viewfinderOutsideRegionBottom setBackgroundColor:v24];
    [(UIView *)v18->_viewfinderOutsideRegionBottom setTranslatesAutoresizingMaskIntoConstraints:0];
    v34 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, v26, v27, v28];
    viewfinderInstruction = v18->_viewfinderInstruction;
    v18->_viewfinderInstruction = v34;

    v36 = +[UIColor clearColor];
    [(UILabel *)v18->_viewfinderInstruction setBackgroundColor:v36];

    [(UILabel *)v18->_viewfinderInstruction setContentMode:7];
    LODWORD(v37) = 1144750080;
    [(UILabel *)v18->_viewfinderInstruction setContentHuggingPriority:0 forAxis:v37];
    [(UILabel *)v18->_viewfinderInstruction setContentHuggingPriority:1 forAxis:0.0];
    LODWORD(v38) = 1148846080;
    [(UILabel *)v18->_viewfinderInstruction setContentCompressionResistancePriority:1 forAxis:v38];
    [(UILabel *)v18->_viewfinderInstruction setTextAlignment:1];
    [(UILabel *)v18->_viewfinderInstruction setLineBreakMode:4];
    [(UILabel *)v18->_viewfinderInstruction setNumberOfLines:2];
    v39 = +[UIFont systemFontOfSize:18.0];
    [(UILabel *)v18->_viewfinderInstruction setFont:v39];

    v40 = +[UIColor whiteColor];
    [(UILabel *)v18->_viewfinderInstruction setTextColor:v40];

    id v68 = v16;
    [(UILabel *)v18->_viewfinderInstruction setText:v16];
    [(UILabel *)v18->_viewfinderInstruction setTranslatesAutoresizingMaskIntoConstraints:0];
    v41 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody];
    uint64_t v42 = +[UIFont fontWithDescriptor:v41 size:18.0];

    uint64_t v43 = +[UIButton buttonWithType:1];
    cancelButton = v18->_cancelButton;
    v18->_cancelButton = (UIButton *)v43;

    [(UIButton *)v18->_cancelButton setOpaque:0];
    v45 = +[UIColor clearColor];
    [(UIButton *)v18->_cancelButton setBackgroundColor:v45];

    v46 = [(UIButton *)v18->_cancelButton titleLabel];
    [v46 setContentMode:7];

    v47 = [(UIButton *)v18->_cancelButton titleLabel];
    [v47 setTextAlignment:1];

    v48 = [(UIButton *)v18->_cancelButton titleLabel];
    [v48 setLineBreakMode:4];

    v49 = [(UIButton *)v18->_cancelButton titleLabel];
    v67 = (void *)v42;
    [v49 setFont:v42];

    v50 = [(UIButton *)v18->_cancelButton titleLabel];
    [v50 setNumberOfLines:1];

    v51 = v18->_cancelButton;
    v52 = +[NSBundle mainBundle];
    v53 = [v52 localizedStringForKey:@"CANCEL" value:&stru_10000C408 table:0];
    [(UIButton *)v51 setTitle:v53 forState:0];

    v54 = v18->_cancelButton;
    v55 = +[UIColor whiteColor];
    [(UIButton *)v54 setTitleColor:v55 forState:0];

    [(UIButton *)v18->_cancelButton sizeToFit];
    [(UIButton *)v18->_cancelButton addTarget:v18 action:"cancelTapped:" forControlEvents:64];
    [(UIButton *)v18->_cancelButton setTranslatesAutoresizingMaskIntoConstraints:0];
    if ((a7 & 2) != 0)
    {
      uint64_t v56 = +[CUShutterButton shutterButton];
      shutterButton = v18->_shutterButton;
      v18->_shutterButton = (CUShutterButton *)v56;

      [(CUShutterButton *)v18->_shutterButton setExclusiveTouch:1];
      [(CUShutterButton *)v18->_shutterButton intrinsicContentSize];
      v18->_shutterButtonIntrinsicContentSize.double width = v58;
      v18->_shutterButtonIntrinsicContentSize.double height = v59;
      [(CUShutterButton *)v18->_shutterButton addTarget:v18 action:"takePicture:" forControlEvents:64];
      [(CUShutterButton *)v18->_shutterButton setTranslatesAutoresizingMaskIntoConstraints:0];
    }
    if ((a7 & 4) != 0)
    {
      uint64_t v60 = +[CAMFlipButton flipButtonOverContent];
      flipButton = v18->_flipButton;
      v18->_flipButton = (CAMFlipButton *)v60;

      [(CAMFlipButton *)v18->_flipButton setExclusiveTouch:1];
      [(CAMFlipButton *)v18->_flipButton intrinsicContentSize];
      v18->_flipButtonIntrinsicContentSize.double width = v62;
      v18->_flipButtonIntrinsicContentSize.double height = v63;
      [(CAMFlipButton *)v18->_flipButton addTarget:v18 action:"flipTapped:" forControlEvents:64];
      [(CAMFlipButton *)v18->_flipButton setTranslatesAutoresizingMaskIntoConstraints:0];
    }
    if ((a7 & 8) != 0)
    {
      v64 = (CAMFlashButton *)[objc_alloc((Class)CAMFlashButton) initWithLayoutStyle:4];
      flashButton = v18->_flashButton;
      v18->_flashButton = v64;

      [(CAMFlashButton *)v18->_flashButton setExclusiveTouch:1];
      [(CAMFlashButton *)v18->_flashButton setAllowsAutomaticFlash:0];
      [(CAMFlashButton *)v18->_flashButton setFlashMode:0];
      [(CAMFlashButton *)v18->_flashButton reloadData];
      [(CAMFlashButton *)v18->_flashButton addTarget:v18 action:"flashTapped:" forControlEvents:4096];
      [(CAMFlashButton *)v18->_flashButton setTranslatesAutoresizingMaskIntoConstraints:0];
    }
    [(CameraTargetView *)v18 setNeedsUpdateConstraints];
    [(UIView *)v18->_viewfinderOutsideRegionBottom addSubview:v18->_cancelButton];
    if ((a7 & 2) != 0)
    {
      [(UIView *)v18->_viewfinderOutsideRegionBottom addSubview:v18->_shutterButton];
      if ((a7 & 4) == 0)
      {
LABEL_12:
        if ((a7 & 8) == 0)
        {
LABEL_14:
          [(CameraTargetView *)v18 addSubview:v18->_viewfinderOutsideRegionTop];
          [(CameraTargetView *)v18 addSubview:v18->_viewfinderOutsideRegionBottom];
          [(CameraTargetView *)v18 addSubview:v18->_viewfinderInstruction];

          id v16 = v68;
          goto LABEL_15;
        }
LABEL_13:
        [(UIView *)v18->_viewfinderOutsideRegionBottom addSubview:v18->_flashButton];
        goto LABEL_14;
      }
    }
    else if ((a7 & 4) == 0)
    {
      goto LABEL_12;
    }
    [(UIView *)v18->_viewfinderOutsideRegionBottom addSubview:v18->_flipButton];
    if ((a7 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_15:

  return v18;
}

- (CameraTargetView)initWithFrame:(CGRect)a3 instructionText:(id)a4 presentationOptions:(int64_t)a5
{
  return -[CameraTargetView initWithFrame:color:thickness:instructionText:presentationOptions:](self, "initWithFrame:color:thickness:instructionText:presentationOptions:", 0, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0);
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setFlashState:(BOOL)a3
{
  if ((self->_cameraPresentation & 8) != 0)
  {
    BOOL v3 = a3;
    id v4 = [(CameraTargetView *)self flashButton];
    [v4 setFlashMode:v3];
  }
}

- (void)setFlashUIEnabled:(BOOL)a3
{
  if ((self->_cameraPresentation & 8) != 0)
  {
    BOOL v3 = a3;
    if (!a3) {
      [(CameraTargetView *)self setFlashState:0];
    }
    v5 = [(CameraTargetView *)self flashButton];
    [v5 setEnabled:v3];

    id v6 = [(CameraTargetView *)self flashButton];
    [v6 setHidden:v3 ^ 1];
  }
}

- (void)cancelTapped:(id)a3
{
  id v3 = [(CameraTargetView *)self delegate];
  [v3 cancelTapped];
}

- (void)flipTapped:(id)a3
{
  id v3 = [(CameraTargetView *)self delegate];
  [v3 flipTapped];
}

- (void)flashTapped:(id)a3
{
  id v3 = [(CameraTargetView *)self delegate];
  [v3 flashTapped];
}

- (void)takePicture:(id)a3
{
  if ((self->_cameraPresentation & 2) != 0)
  {
    id v4 = [(CameraTargetView *)self shutterButton];
    [v4 setEnabled:0];

    v5 = [(CameraTargetView *)self delegate];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100005668;
    v6[3] = &unk_10000C308;
    v6[4] = self;
    [v5 takePictureWithHandler:v6];
  }
}

- (void)updateConstraints
{
  id v3 = [(CameraTargetView *)self viewfinderOutsideRegionTop];
  id v4 = [(CameraTargetView *)self viewfinderOutsideRegionTop];
  [(CameraTargetView *)self frame];
  id v6 = +[NSLayoutConstraint constraintWithItem:v4 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v5];
  [v3 addConstraint:v6];

  v7 = [(CameraTargetView *)self viewfinderOutsideRegionTop];
  v8 = [(CameraTargetView *)self viewfinderOutsideRegionTop];
  v9 = +[NSLayoutConstraint constraintWithItem:v8 attribute:8 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:85.0];
  [v7 addConstraint:v9];

  v10 = [(CameraTargetView *)self viewfinderOutsideRegionTop];
  v11 = +[NSLayoutConstraint constraintWithItem:v10 attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
  [(CameraTargetView *)self addConstraint:v11];

  v12 = [(CameraTargetView *)self viewfinderOutsideRegionTop];
  v13 = +[NSLayoutConstraint constraintWithItem:v12 attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:0.0];
  [(CameraTargetView *)self addConstraint:v13];

  v14 = [(CameraTargetView *)self viewfinderOutsideRegionBottom];
  id v15 = [(CameraTargetView *)self viewfinderOutsideRegionBottom];
  [(CameraTargetView *)self frame];
  v17 = +[NSLayoutConstraint constraintWithItem:v15 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v16];
  [v14 addConstraint:v17];

  v18 = [(CameraTargetView *)self viewfinderOutsideRegionBottom];
  v19 = [(CameraTargetView *)self viewfinderOutsideRegionBottom];
  v20 = +[NSLayoutConstraint constraintWithItem:v19 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:85.0];
  [v18 addConstraint:v20];

  v21 = [(CameraTargetView *)self viewfinderOutsideRegionBottom];
  id v22 = +[NSLayoutConstraint constraintWithItem:v21 attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
  [(CameraTargetView *)self addConstraint:v22];

  id v23 = [(CameraTargetView *)self viewfinderOutsideRegionBottom];
  v24 = +[NSLayoutConstraint constraintWithItem:v23 attribute:4 relatedBy:0 toItem:self attribute:4 multiplier:1.0 constant:0.0];
  [(CameraTargetView *)self addConstraint:v24];

  id v25 = [(CameraTargetView *)self viewfinderInstruction];
  double v26 = [(CameraTargetView *)self viewfinderOutsideRegionTop];
  double v27 = +[NSLayoutConstraint constraintWithItem:v25 attribute:5 relatedBy:0 toItem:v26 attribute:5 multiplier:1.0 constant:15.0];
  [(CameraTargetView *)self addConstraint:v27];

  double v28 = [(CameraTargetView *)self viewfinderOutsideRegionTop];
  v29 = [(CameraTargetView *)self viewfinderInstruction];
  v30 = +[NSLayoutConstraint constraintWithItem:v28 attribute:6 relatedBy:0 toItem:v29 attribute:6 multiplier:1.0 constant:15.0];
  [(CameraTargetView *)self addConstraint:v30];

  double v31 = [(CameraTargetView *)self viewfinderInstruction];
  v32 = [v31 topAnchor];
  v33 = [(CameraTargetView *)self safeAreaLayoutGuide];
  v34 = [v33 topAnchor];
  v35 = [v32 constraintEqualToAnchor:v34 constant:0.0];
  [v35 setActive:1];

  v36 = [(CameraTargetView *)self viewfinderOutsideRegionTop];
  double v37 = [(CameraTargetView *)self viewfinderInstruction];
  double v38 = +[NSLayoutConstraint constraintWithItem:v36 attribute:4 relatedBy:0 toItem:v37 attribute:4 multiplier:1.0 constant:5.0];

  LODWORD(v39) = 1144750080;
  [v38 setPriority:v39];
  [(CameraTargetView *)self addConstraint:v38];
  v40 = [(CameraTargetView *)self viewfinderInstruction];
  v41 = +[NSLayoutConstraint constraintWithItem:v40 attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
  [(CameraTargetView *)self addConstraint:v41];

  uint64_t v42 = [(CameraTargetView *)self cancelButton];
  uint64_t v43 = [(CameraTargetView *)self cancelButton];
  v44 = [(CameraTargetView *)self cancelButton];
  [v44 frame];
  v46 = +[NSLayoutConstraint constraintWithItem:v43 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v45];
  [v42 addConstraint:v46];

  v47 = [(CameraTargetView *)self cancelButton];
  v48 = [(CameraTargetView *)self cancelButton];
  v49 = [(CameraTargetView *)self cancelButton];
  [v49 frame];
  v51 = +[NSLayoutConstraint constraintWithItem:v48 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v50];
  [v47 addConstraint:v51];

  v52 = [(CameraTargetView *)self viewfinderOutsideRegionBottom];
  v53 = [(CameraTargetView *)self cancelButton];
  v54 = [(CameraTargetView *)self viewfinderOutsideRegionBottom];
  v55 = +[NSLayoutConstraint constraintWithItem:v53 attribute:5 relatedBy:0 toItem:v54 attribute:5 multiplier:1.0 constant:15.0];
  [v52 addConstraint:v55];

  uint64_t v56 = [(CameraTargetView *)self viewfinderOutsideRegionBottom];
  v57 = [(CameraTargetView *)self cancelButton];
  CGFloat v58 = [(CameraTargetView *)self viewfinderOutsideRegionBottom];
  CGFloat v59 = +[NSLayoutConstraint constraintWithItem:v57 attribute:10 relatedBy:0 toItem:v58 attribute:10 multiplier:1.0 constant:0.0];
  [v56 addConstraint:v59];

  int64_t cameraPresentation = self->_cameraPresentation;
  if ((cameraPresentation & 2) == 0)
  {
    if ((cameraPresentation & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    v93 = [(CameraTargetView *)self flipButton];
    v94 = [(CameraTargetView *)self flipButton];
    [(CameraTargetView *)self flipButtonIntrinsicContentSize];
    v96 = +[NSLayoutConstraint constraintWithItem:v94 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v95];
    [v93 addConstraint:v96];

    v97 = [(CameraTargetView *)self flipButton];
    v98 = [(CameraTargetView *)self flipButton];
    [(CameraTargetView *)self flipButtonIntrinsicContentSize];
    v99 = +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v98, 8, 0, 0, 0, 1.0);
    [v97 addConstraint:v99];

    v100 = [(CameraTargetView *)self viewfinderOutsideRegionBottom];
    v101 = [(CameraTargetView *)self flipButton];
    v102 = [(CameraTargetView *)self viewfinderOutsideRegionBottom];
    v103 = +[NSLayoutConstraint constraintWithItem:v101 attribute:9 relatedBy:0 toItem:v102 attribute:9 multiplier:1.0 constant:0.0];
    [v100 addConstraint:v103];

    v104 = [(CameraTargetView *)self viewfinderOutsideRegionBottom];
    v105 = [(CameraTargetView *)self flipButton];
    v106 = [(CameraTargetView *)self viewfinderOutsideRegionBottom];
    v107 = +[NSLayoutConstraint constraintWithItem:v105 attribute:10 relatedBy:0 toItem:v106 attribute:10 multiplier:1.0 constant:0.0];
    [v104 addConstraint:v107];

    if ((self->_cameraPresentation & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  v78 = [(CameraTargetView *)self shutterButton];
  v79 = [(CameraTargetView *)self shutterButton];
  [(CameraTargetView *)self shutterButtonIntrinsicContentSize];
  v81 = +[NSLayoutConstraint constraintWithItem:v79 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v80];
  [v78 addConstraint:v81];

  v82 = [(CameraTargetView *)self shutterButton];
  v83 = [(CameraTargetView *)self shutterButton];
  [(CameraTargetView *)self shutterButtonIntrinsicContentSize];
  v84 = +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v83, 8, 0, 0, 0, 1.0);
  [v82 addConstraint:v84];

  v85 = [(CameraTargetView *)self viewfinderOutsideRegionBottom];
  v86 = [(CameraTargetView *)self shutterButton];
  v87 = [(CameraTargetView *)self viewfinderOutsideRegionBottom];
  v88 = +[NSLayoutConstraint constraintWithItem:v86 attribute:9 relatedBy:0 toItem:v87 attribute:9 multiplier:1.0 constant:0.0];
  [v85 addConstraint:v88];

  v89 = [(CameraTargetView *)self viewfinderOutsideRegionBottom];
  v90 = [(CameraTargetView *)self shutterButton];
  v91 = [(CameraTargetView *)self viewfinderOutsideRegionBottom];
  v92 = +[NSLayoutConstraint constraintWithItem:v90 attribute:10 relatedBy:0 toItem:v91 attribute:10 multiplier:1.0 constant:0.0];
  [v89 addConstraint:v92];

  int64_t cameraPresentation = self->_cameraPresentation;
  if ((cameraPresentation & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((cameraPresentation & 8) != 0)
  {
LABEL_4:
    v61 = [(CameraTargetView *)self flashButton];
    CGFloat v62 = [(CameraTargetView *)self flashButton];
    CGFloat v63 = [(CameraTargetView *)self flashButton];
    [v63 intrinsicContentSize];
    v65 = +[NSLayoutConstraint constraintWithItem:v62 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v64];
    [v61 addConstraint:v65];

    v66 = [(CameraTargetView *)self flashButton];
    v67 = [(CameraTargetView *)self flashButton];
    id v68 = [(CameraTargetView *)self flashButton];
    [v68 intrinsicContentSize];
    objc_super v69 = +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v67, 8, 0, 0, 0, 1.0);
    [v66 addConstraint:v69];

    v70 = [(CameraTargetView *)self viewfinderOutsideRegionBottom];
    v71 = [(CameraTargetView *)self flashButton];
    v72 = [(CameraTargetView *)self viewfinderOutsideRegionBottom];
    v73 = +[NSLayoutConstraint constraintWithItem:v71 attribute:6 relatedBy:0 toItem:v72 attribute:6 multiplier:1.0 constant:-15.0];
    [v70 addConstraint:v73];

    v74 = [(CameraTargetView *)self viewfinderOutsideRegionBottom];
    v75 = [(CameraTargetView *)self flashButton];
    v76 = [(CameraTargetView *)self viewfinderOutsideRegionBottom];
    v77 = +[NSLayoutConstraint constraintWithItem:v75 attribute:10 relatedBy:0 toItem:v76 attribute:10 multiplier:1.0 constant:0.0];
    [v74 addConstraint:v77];
  }
LABEL_5:
  v108.receiver = self;
  v108.super_class = (Class)CameraTargetView;
  [(CameraTargetView *)&v108 updateConstraints];
}

- (CameraTargetViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CameraTargetViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)flashUIEnabled
{
  return self->_flashUIEnabled;
}

- (int64_t)cameraPresentation
{
  return self->_cameraPresentation;
}

- (void)setCameraPresentation:(int64_t)a3
{
  self->_int64_t cameraPresentation = a3;
}

- (UILabel)viewfinderInstruction
{
  return self->_viewfinderInstruction;
}

- (void)setViewfinderInstruction:(id)a3
{
}

- (UIView)viewfinderOutsideRegionTop
{
  return self->_viewfinderOutsideRegionTop;
}

- (void)setViewfinderOutsideRegionTop:(id)a3
{
}

- (UIView)viewfinderOutsideRegionBottom
{
  return self->_viewfinderOutsideRegionBottom;
}

- (void)setViewfinderOutsideRegionBottom:(id)a3
{
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (CAMFlipButton)flipButton
{
  return self->_flipButton;
}

- (void)setFlipButton:(id)a3
{
}

- (CAMFlashButton)flashButton
{
  return self->_flashButton;
}

- (void)setFlashButton:(id)a3
{
}

- (CAMFlashStatusIndicator)flashIndicator
{
  return self->_flashIndicator;
}

- (void)setFlashIndicator:(id)a3
{
}

- (CUShutterButton)shutterButton
{
  return self->_shutterButton;
}

- (void)setShutterButton:(id)a3
{
}

- (CGSize)flipButtonIntrinsicContentSize
{
  double width = self->_flipButtonIntrinsicContentSize.width;
  double height = self->_flipButtonIntrinsicContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setFlipButtonIntrinsicContentSize:(CGSize)a3
{
  self->_flipButtonIntrinsicContentSize = a3;
}

- (CGSize)shutterButtonIntrinsicContentSize
{
  double width = self->_shutterButtonIntrinsicContentSize.width;
  double height = self->_shutterButtonIntrinsicContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setShutterButtonIntrinsicContentSize:(CGSize)a3
{
  self->_shutterButtonIntrinsicContentSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shutterButton, 0);
  objc_storeStrong((id *)&self->_flashIndicator, 0);
  objc_storeStrong((id *)&self->_flashButton, 0);
  objc_storeStrong((id *)&self->_flipButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_viewfinderOutsideRegionBottom, 0);
  objc_storeStrong((id *)&self->_viewfinderOutsideRegionTop, 0);
  objc_storeStrong((id *)&self->_viewfinderInstruction, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end