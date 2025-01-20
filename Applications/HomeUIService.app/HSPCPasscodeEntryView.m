@interface HSPCPasscodeEntryView
+ (CGSize)preferredSizeForNumberOfDigits:(int64_t)a3;
+ (CGSize)wellSizeForNumberOfDigits:(int64_t)a3;
+ (double)interWellSpacingForNumberOfDigits:(int64_t)a3;
+ (double)wellCornerRadiusForNumberOfDigits:(int64_t)a3;
+ (id)fontForNumberOfDigits:(int64_t)a3 useMonospacedFont:(BOOL)a4;
- (BOOL)becomeFirstResponder;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)canBecomeFirstResponder;
- (BOOL)hasText;
- (BOOL)resignFirstResponder;
- (BOOL)useMonospacedFont;
- (CGSize)intrinsicContentSize;
- (HSPCPasscodeEntryView)initWithFrame:(CGRect)a3;
- (HSPCPasscodeEntryView)initWithNumberOfDigits:(int64_t)a3 useMonospacedFont:(BOOL)a4 delegate:(id)a5;
- (HSPCPasscodeEntryViewDelegate)delegate;
- (NSString)text;
- (int64_t)autocapitalizationType;
- (int64_t)keyboardType;
- (int64_t)spellCheckingType;
- (unint64_t)numberOfDigits;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_updateWells;
- (void)deleteBackward;
- (void)insertText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setKeyboardType:(int64_t)a3;
- (void)setText:(id)a3;
- (void)tintColorDidChange;
@end

@implementation HSPCPasscodeEntryView

- (HSPCPasscodeEntryView)initWithNumberOfDigits:(int64_t)a3 useMonospacedFont:(BOOL)a4 delegate:(id)a5
{
  id v8 = a5;
  [(id)objc_opt_class() preferredSizeForNumberOfDigits:a3];
  v70.receiver = self;
  v70.super_class = (Class)HSPCPasscodeEntryView;
  v9 = -[HSPCPasscodeEntryView initWithFrame:](&v70, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v10 = v9;
  if (v9)
  {
    id v60 = v8;
    objc_storeWeak((id *)&v9->_delegate, v8);
    v10->_keyboardType = 11;
    v10->_numberOfDigits = a3;
    v10->_useMonospacedFont = a4;
    uint64_t v11 = +[NSMutableString string];
    text = v10->_text;
    v10->_text = (NSMutableString *)v11;

    unint64_t v13 = vcvtpd_u64_f64((double)a3 * 0.125);
    id v65 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v13];
    v14 = +[NSMutableArray array];
    unint64_t v64 = v13;
    if (v13)
    {
      unint64_t v15 = 0;
      unint64_t v16 = vcvtpd_u64_f64((double)a3 / (double)v13);
      unint64_t v66 = v13 - 1;
      int64_t v62 = a3 - (v13 - 1) * v16;
      unint64_t v63 = v16;
      double v17 = (double)(v16 - v62);
      do
      {
        v18 = [(id)objc_opt_class() fontForNumberOfDigits:v63 useMonospacedFont:v10->_useMonospacedFont];
        [(id)objc_opt_class() interWellSpacingForNumberOfDigits:v63];
        double v20 = v19;
        [(id)objc_opt_class() wellCornerRadiusForNumberOfDigits:v63];
        double v22 = v21;
        [(id)objc_opt_class() wellSizeForNumberOfDigits:v63];
        double v24 = v23;
        double v26 = v25;
        unint64_t v67 = v15;
        if (v66 == v15) {
          int64_t v27 = v62;
        }
        else {
          int64_t v27 = v63;
        }
        id v28 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v27];
        [v65 addObject:v28];
        if (v27)
        {
          unint64_t v29 = (unint64_t)((v20 + v24) * v17 * 0.5);
          if (v66 != v15) {
            unint64_t v29 = 0;
          }
          double v30 = (double)v29;
          double v31 = v20 + v26;
          double v32 = (v20 + v26) * (double)v15;
          double v33 = -(v31 * (double)(v66 - v15));
          do
          {
            v34 = objc_alloc_init(HSPCPasscodeWell);
            [(HSPCPasscodeWell *)v34 setTranslatesAutoresizingMaskIntoConstraints:0];
            v35 = [(HSPCPasscodeWell *)v34 label];
            [v35 setFont:v18];

            [(HSPCPasscodeWell *)v34 _setContinuousCornerRadius:v22];
            [(HSPCPasscodeEntryView *)v10 addSubview:v34];
            v36 = [v28 lastObject];
            [v28 addObject:v34];
            if (v36)
            {
              v37 = [(HSPCPasscodeWell *)v34 widthAnchor];
              v38 = [v36 widthAnchor];
              v39 = [v37 constraintEqualToAnchor:v38];
              [v14 addObject:v39];

              v40 = [(HSPCPasscodeWell *)v34 leadingAnchor];
              v41 = [v36 trailingAnchor];
              v42 = v40;
              v43 = v41;
              double v44 = v20;
            }
            else
            {
              v40 = [(HSPCPasscodeWell *)v34 leadingAnchor];
              v41 = [(HSPCPasscodeEntryView *)v10 leadingAnchor];
              v42 = v40;
              v43 = v41;
              double v44 = v30;
            }
            v45 = [v42 constraintEqualToAnchor:v43 constant:v44];
            [v14 addObject:v45];

            if (v27 == 1)
            {
              v46 = [(HSPCPasscodeEntryView *)v10 trailingAnchor];
              v47 = [(HSPCPasscodeWell *)v34 trailingAnchor];
              v48 = [v46 constraintEqualToAnchor:v47 constant:v30];
              [v14 addObject:v48];
            }
            v49 = [(HSPCPasscodeWell *)v34 topAnchor];
            v50 = [(HSPCPasscodeEntryView *)v10 topAnchor];
            v51 = [v49 constraintEqualToAnchor:v50 constant:v32];
            [v14 addObject:v51];

            v52 = [(HSPCPasscodeWell *)v34 bottomAnchor];
            v53 = [(HSPCPasscodeEntryView *)v10 bottomAnchor];
            v54 = [v52 constraintEqualToAnchor:v53 constant:v33];
            [v14 addObject:v54];

            --v27;
          }
          while (v27);
        }

        unint64_t v15 = v67 + 1;
      }
      while (v67 + 1 != v64);
    }
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14, v60);
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_100044B34;
    v68[3] = &unk_1000AAD00;
    id v69 = objc_alloc_init((Class)NSMutableArray);
    id v55 = v69;
    [v65 enumerateObjectsUsingBlock:v68];
    v56 = (NSArray *)[v55 copy];
    wells = v10->_wells;
    v10->_wells = v56;

    [(HSPCPasscodeEntryView *)v10 _updateWells];
    v58 = v10;

    id v8 = v61;
  }

  return v10;
}

- (HSPCPasscodeEntryView)initWithFrame:(CGRect)a3
{
  return -[HSPCPasscodeEntryView initWithNumberOfDigits:useMonospacedFont:delegate:](self, "initWithNumberOfDigits:useMonospacedFont:delegate:", 4, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)HSPCPasscodeEntryView;
  [(HSPCPasscodeEntryView *)&v3 tintColorDidChange];
  [(HSPCPasscodeEntryView *)self _updateWells];
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)HSPCPasscodeEntryView;
  [(HSPCPasscodeEntryView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(HSPCPasscodeEntryView *)self _updateWells];
}

- (NSString)text
{
  id v2 = [(NSMutableString *)self->_text copy];

  return (NSString *)v2;
}

- (void)setText:(id)a3
{
  id v11 = a3;
  if ((-[NSMutableString isEqualToString:](self->_text, "isEqualToString:") & 1) == 0)
  {
    id v4 = [v11 length];
    unint64_t numberOfDigits = self->_numberOfDigits;
    if ((unint64_t)v4 > numberOfDigits)
    {
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"'%@' is too long for %@; _numberOfDigits=%ld",
        v11,
        self,
      v9 = numberOfDigits);
      id v10 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v9 userInfo:0];

      objc_exception_throw(v10);
    }
    v6 = [v11 uppercaseString];
    v7 = (NSMutableString *)[v6 mutableCopy];
    text = self->_text;
    self->_text = v7;

    [(HSPCPasscodeEntryView *)self _updateWells];
  }
}

- (void)_updateWells
{
  id v3 = [(NSMutableString *)self->_text length];
  id v4 = [(HSPCPasscodeEntryView *)self traitCollection];
  [v4 displayScale];
  double v6 = 1.0 / v5;

  wells = self->_wells;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100044E44;
  v8[3] = &unk_1000AAD28;
  v8[4] = self;
  v8[5] = v3;
  *(double *)&v8[6] = v6;
  [(NSArray *)wells enumerateObjectsUsingBlock:v8];
}

- (CGSize)intrinsicContentSize
{
  id v3 = objc_opt_class();
  unint64_t numberOfDigits = self->_numberOfDigits;

  [v3 preferredSizeForNumberOfDigits:numberOfDigits];
  result.height = v6;
  result.width = v5;
  return result;
}

+ (CGSize)wellSizeForNumberOfDigits:(int64_t)a3
{
  int64_t v3 = 8;
  if (a3 < 8) {
    int64_t v3 = a3;
  }
  double v4 = (double)(v3 - 4);
  float v5 = v4 * -4.5 + 50.0;
  double v6 = roundf(v5);
  *(float *)&double v4 = v4 * -7.0 + 76.0;
  double v7 = roundf(*(float *)&v4);
  result.height = v7;
  result.width = v6;
  return result;
}

+ (double)interWellSpacingForNumberOfDigits:(int64_t)a3
{
  int64_t v3 = 8;
  if (a3 < 8) {
    int64_t v3 = a3;
  }
  float v4 = (double)(v3 - 4) * -0.5 + 8.0;
  return roundf(v4);
}

+ (double)wellCornerRadiusForNumberOfDigits:(int64_t)a3
{
  return 8.0;
}

+ (CGSize)preferredSizeForNumberOfDigits:(int64_t)a3
{
  double v4 = (double)a3 * 0.125;
  unint64_t v5 = vcvtpd_u64_f64(v4);
  double v6 = (double)(unint64_t)ceil(v4);
  double v7 = (double)a3 / v6;
  double v8 = ceil(v7);
  unint64_t v9 = vcvtpd_u64_f64(v7);
  [a1 wellSizeForNumberOfDigits:v9];
  double v11 = v10;
  double v13 = v12;
  [a1 interWellSpacingForNumberOfDigits:v9];
  double v15 = v14 * (double)(v5 - 1) + v13 * v6;
  double v16 = v14 * (double)(v9 - 1) + v11 * (double)(unint64_t)v8;
  result.height = v15;
  result.width = v16;
  return result;
}

+ (id)fontForNumberOfDigits:(int64_t)a3 useMonospacedFont:(BOOL)a4
{
  int64_t v4 = 8;
  if (a3 < 8) {
    int64_t v4 = a3;
  }
  float v5 = 28.0 - (double)(v4 - 4);
  double v6 = roundf(v5);
  if (a4) {
    +[UIFont monospacedSystemFontOfSize:v6 weight:UIFontWeightSemibold];
  }
  else {
  double v7 = +[UIFont systemFontOfSize:v6 weight:UIFontWeightMedium];
  }

  return v7;
}

- (BOOL)becomeFirstResponder
{
  v7.receiver = self;
  v7.super_class = (Class)HSPCPasscodeEntryView;
  BOOL v3 = [(HSPCPasscodeEntryView *)&v7 becomeFirstResponder];
  if (v3)
  {
    [(HSPCPasscodeEntryView *)self _updateWells];
    int64_t v4 = [(HSPCPasscodeEntryView *)self delegate];

    if (v4)
    {
      float v5 = [(HSPCPasscodeEntryView *)self delegate];
      [v5 passcodeEntryViewDidBecomeFirstResponder:self];
    }
  }
  return v3;
}

- (BOOL)resignFirstResponder
{
  v5.receiver = self;
  v5.super_class = (Class)HSPCPasscodeEntryView;
  BOOL v3 = [(HSPCPasscodeEntryView *)&v5 resignFirstResponder];
  if (v3) {
    [(HSPCPasscodeEntryView *)self _updateWells];
  }
  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  return [(HSPCPasscodeEntryView *)self isEnabled];
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HSPCPasscodeEntryView;
  BOOL v5 = [(HSPCPasscodeEntryView *)&v7 beginTrackingWithTouch:a3 withEvent:a4];
  if (v5) {
    [(HSPCPasscodeEntryView *)self becomeFirstResponder];
  }
  return v5;
}

- (BOOL)hasText
{
  return [(NSMutableString *)self->_text length] != 0;
}

- (void)insertText:(id)a3
{
  id v6 = a3;
  if ((unint64_t)[(NSMutableString *)self->_text length] < self->_numberOfDigits)
  {
    text = self->_text;
    BOOL v5 = [v6 uppercaseString];
    [(NSMutableString *)text appendString:v5];

    [(HSPCPasscodeEntryView *)self _updateWells];
    [(HSPCPasscodeEntryView *)self sendActionsForControlEvents:4096];
  }
}

- (void)deleteBackward
{
  if ([(NSMutableString *)self->_text length])
  {
    -[NSMutableString replaceCharactersInRange:withString:](self->_text, "replaceCharactersInRange:withString:", (char *)[(NSMutableString *)self->_text length] - 1, 1, &stru_1000ABBA8);
    [(HSPCPasscodeEntryView *)self _updateWells];
    [(HSPCPasscodeEntryView *)self sendActionsForControlEvents:4096];
  }
}

- (int64_t)spellCheckingType
{
  return 1;
}

- (int64_t)autocapitalizationType
{
  return 3;
}

- (unint64_t)numberOfDigits
{
  return self->_numberOfDigits;
}

- (BOOL)useMonospacedFont
{
  return self->_useMonospacedFont;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (HSPCPasscodeEntryViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HSPCPasscodeEntryViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_wells, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end