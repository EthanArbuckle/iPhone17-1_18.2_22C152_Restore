@interface PinField
- (BOOL)variableLength;
- (LACSecureData)pinValue;
- (NSNumber)pinCharset;
- (NSNumber)pinFixedLength;
- (NSNumber)pinMaxLength;
- (NSNumber)pinMinLength;
- (PinField)initWithPinLength:(id)a3 minLength:(id)a4 maxLength:(id)a5 charset:(id)a6;
- (PinFieldDelegate)delegate;
- (UIButton)okButton;
- (UITextField)pinTextField;
- (unint64_t)pinLength;
- (void)_enterPin;
- (void)_handleReturnKeyTapped:(id)a3;
- (void)_setupForFixedLength;
- (void)_setupForVariableLength;
- (void)appendPinCharacter:(id)a3;
- (void)deleteLastPinCharacter;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)updateLayoutForWidth:(double)a3;
@end

@implementation PinField

- (PinField)initWithPinLength:(id)a3 minLength:(id)a4 maxLength:(id)a5 charset:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PinField;
  v15 = [(PinField *)&v24 init];
  v16 = v15;
  if (v15)
  {
    p_pinFixedLength = &v15->_pinFixedLength;
    objc_storeStrong((id *)&v15->_pinFixedLength, a3);
    objc_storeStrong((id *)&v16->_pinMinLength, a4);
    objc_storeStrong((id *)&v16->_pinMaxLength, a5);
    objc_storeStrong((id *)&v16->_pinCharset, a6);
    if (*p_pinFixedLength
      && (unsigned int v18 = [v11 unsignedIntValue], v16->_pinLength = v18, v18 - 4 <= 8))
    {
      [(PinField *)v16 _setupForFixedLength];
      if (!v14) {
        goto LABEL_9;
      }
    }
    else
    {
      [(PinField *)v16 _setupForVariableLength];
      if (!v14)
      {
LABEL_9:
        v20 = [&stru_100088CF0 stringByPaddingToLength:v16->_pinLength withString:@" " startingAtIndex:0];
        uint64_t v21 = +[LACSecureData secureDataWithString:v20];
        pinValue = v16->_pinValue;
        v16->_pinValue = (LACSecureData *)v21;

        [(LACSecureData *)v16->_pinValue resize:0];
        goto LABEL_10;
      }
    }
    if ([v14 unsignedIntValue])
    {
      v19 = +[NSNotificationCenter defaultCenter];
      [v19 addObserver:v16 selector:"_handleReturnKeyTapped:" name:UIKeyboardReturnKeyPressed object:0];
    }
    goto LABEL_9;
  }
LABEL_10:

  return v16;
}

- (void)_setupForFixedLength
{
  v3 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:self->_pinLength];
  pinDashViews = self->_pinDashViews;
  self->_pinDashViews = v3;

  v5 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:self->_pinLength];
  pinDotViews = self->_pinDotViews;
  self->_pinDotViews = v5;

  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v21 = +[UIImage imageNamed:@"pinDash" inBundle:v7];

  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = +[UIImage imageNamed:@"pinDot" inBundle:v8];

  p_pinDashSize = &self->_pinDashSize;
  [v21 size];
  self->_pinDashSize.double width = v11;
  self->_pinDashSize.CGFloat height = v12;
  p_pinDotSize = &self->_pinDotSize;
  [v9 size];
  self->_pinDotSize.double width = v15;
  self->_pinDotSize.CGFloat height = v14;
  CGFloat height = self->_pinDashSize.height;
  if (height < v14) {
    CGFloat height = v14;
  }
  self->_slotHeight = height;
  double width = p_pinDashSize->width;
  if (p_pinDashSize->width < p_pinDotSize->width) {
    double width = p_pinDotSize->width;
  }
  self->_slotWidth = width;
  if (self->_pinLength)
  {
    unint64_t v18 = 0;
    do
    {
      id v19 = [objc_alloc((Class)UIImageView) initWithImage:v21];
      [(NSMutableArray *)self->_pinDashViews addObject:v19];
      id v20 = [objc_alloc((Class)UIImageView) initWithImage:v9];

      [(NSMutableArray *)self->_pinDotViews addObject:v20];
      ++v18;
    }
    while (v18 < self->_pinLength);
  }
}

- (void)_setupForVariableLength
{
  id obj = objc_alloc_init((Class)UITextField);
  [obj setSecureTextEntry:1];
  [obj setBorderStyle:3];
  [obj setUserInteractionEnabled:0];
  objc_storeStrong((id *)&self->_pinTextField, obj);
  v3 = [(PinField *)self pinTextField];
  [(PinField *)self addSubview:v3];

  v4 = [(PinField *)self pinCharset];
  unsigned int v5 = [v4 unsignedIntValue];

  if (!v5)
  {
    v6 = +[UIButton buttonWithType:1];
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"PASSWORD_ALERT_DONE" value:&stru_100088CF0 table:@"MobileUI"];
    [(UIButton *)v6 setTitle:v8 forState:0];

    v9 = +[UIColor labelColor];
    [(UIButton *)v6 setTitleColor:v9 forState:0];

    v10 = +[UIColor redColor];
    [(UIButton *)v6 setTitleColor:v10 forState:2];

    [(UIButton *)v6 addTarget:self action:"_okButtonClicked:" forControlEvents:1];
    [(UIButton *)v6 sizeToFit];
    okButton = self->_okButton;
    self->_okButton = v6;

    CGFloat v12 = [(PinField *)self okButton];
    [(PinField *)self addSubview:v12];
  }
  self->_variableLength = 1;
}

- (void)updateLayoutForWidth:(double)a3
{
  if ([(PinField *)self variableLength])
  {
    -[PinField setFrame:](self, "setFrame:", CGRectZero.origin.x, CGRectZero.origin.y, a3, 30.0);
    unsigned int v5 = [(PinField *)self pinMaxLength];
    [v5 intValue];

    UIRectCenteredXInRect();
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v14 = [(PinField *)self pinTextField];
    [v14 setFrame:v7, v9, v11, v13];

    id v33 = [(PinField *)self okButton];
    [v33 setFrame:CGRectMake(v7 + v11, 0.0, 50.0, 30.0)];
  }
  else
  {
    double slotWidth = self->_slotWidth;
    double v16 = 25.0;
    unint64_t pinLength = self->_pinLength;
    double v18 = (double)pinLength;
    double v19 = (slotWidth + 25.0) * (double)pinLength + -25.0;
    if (v19 > a3 + -25.0)
    {
      double v16 = (a3 + -25.0 - slotWidth * v18) / (double)(pinLength - 1);
      double v19 = -(v16 - (slotWidth + v16) * v18);
    }
    float slotHeight = self->_slotHeight;
    -[PinField setFrame:](self, "setFrame:", CGRectZero.origin.x, CGRectZero.origin.y, v19, ceilf(slotHeight));
    if (self->_pinLength)
    {
      unint64_t v21 = 0;
      p_pinDashSize = &self->_pinDashSize;
      do
      {
        v35.size.double width = p_pinDashSize->width;
        v35.size.double height = self->_pinDashSize.height;
        v35.origin.double x = (self->_slotWidth - p_pinDashSize->width) * 0.5 + (v16 + self->_slotWidth) * (double)v21;
        v35.origin.double y = (self->_slotHeight - v35.size.height) * 0.5;
        CGRect v36 = CGRectIntegral(v35);
        double x = v36.origin.x;
        double y = v36.origin.y;
        double width = v36.size.width;
        double height = v36.size.height;
        v27 = [(NSMutableArray *)self->_pinDashViews objectAtIndex:v21];
        [v27 setFrame:CGRectMake(x, y, width, height)];
        v37.size.double width = self->_pinDotSize.width;
        v37.size.double height = self->_pinDotSize.height;
        v37.origin.double x = (self->_slotWidth - v37.size.width) * 0.5 + (v16 + self->_slotWidth) * (double)v21;
        v37.origin.double y = (self->_slotHeight - v37.size.height) * 0.5;
        CGRect v38 = CGRectIntegral(v37);
        double v28 = v38.origin.x;
        double v29 = v38.origin.y;
        double v30 = v38.size.width;
        double v31 = v38.size.height;
        v32 = [(NSMutableArray *)self->_pinDotViews objectAtIndex:v21];

        [v32 setFrame:v28, v29, v30, v31];
        ++v21;
      }
      while (v21 < self->_pinLength);
    }
  }
}

- (void)layoutSubviews
{
  if ([(PinField *)self variableLength])
  {
    id v3 = [(LACSecureData *)self->_pinValue length];
    v4 = [(PinField *)self pinMinLength];
    BOOL v5 = (unint64_t)v3 < [v4 unsignedIntValue];

    id v13 = [(PinField *)self okButton];
    [v13 setHidden:v5];
  }
  else if (self->_pinLength)
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = [(LACSecureData *)self->_pinValue length];
      if (v6 >= (unint64_t)v7) {
        double v8 = &OBJC_IVAR___PinField__pinDotViews;
      }
      else {
        double v8 = &OBJC_IVAR___PinField__pinDashViews;
      }
      if (v6 >= (unint64_t)v7) {
        double v9 = &OBJC_IVAR___PinField__pinDashViews;
      }
      else {
        double v9 = &OBJC_IVAR___PinField__pinDotViews;
      }
      double v10 = [*(id *)((char *)&self->super.super.super.isa + *v8) objectAtIndexedSubscript:v6];
      [v10 removeFromSuperview];

      double v11 = [*(id *)((char *)&self->super.super.super.isa + *v9) objectAtIndexedSubscript:v6];
      double v12 = [v11 superview];

      if (!v12) {
        [(PinField *)self addSubview:v11];
      }

      ++v6;
    }
    while (v6 < self->_pinLength);
  }
}

- (void)appendPinCharacter:(id)a3
{
  id v15 = a3;
  if ([(PinField *)self variableLength])
  {
    v4 = [(PinField *)self pinMaxLength];
    if (v4)
    {
      BOOL v5 = [(PinField *)self pinMaxLength];
      unint64_t v6 = [v5 unsignedIntValue];
    }
    else
    {
      unint64_t v6 = -1;
    }
  }
  else
  {
    unint64_t v6 = [(PinField *)self pinLength];
  }
  if ((unint64_t)[(LACSecureData *)self->_pinValue length] < v6
    && ([v15 isEqualToString:@"\n"] & 1) == 0)
  {
    id v7 = [(PinField *)self pinCharset];
    unsigned int v8 = [v7 unsignedIntValue];

    id v9 = v15;
    if (v8 == 2)
    {
      uint64_t v10 = [v15 uppercaseString];

      id v9 = (id)v10;
    }
    id v15 = v9;
    [(LACSecureData *)self->_pinValue appendString:v9];
    if ([(PinField *)self variableLength])
    {
      double v11 = [(PinField *)self pinTextField];
      double v12 = [v11 text];
      id v13 = [v12 stringByAppendingString:v15];
      double v14 = [(PinField *)self pinTextField];
      [v14 setText:v13];
    }
    [(PinField *)self setNeedsLayout];
    if ([(LACSecureData *)self->_pinValue length] == (id)v6) {
      [(PinField *)self _enterPin];
    }
  }
}

- (void)deleteLastPinCharacter
{
  if ([(LACSecureData *)self->_pinValue length])
  {
    [(LACSecureData *)self->_pinValue removeLastCharacter];
    if ([(PinField *)self variableLength])
    {
      id v3 = [(PinField *)self pinTextField];
      v4 = [v3 text];
      BOOL v5 = [(PinField *)self pinTextField];
      unint64_t v6 = [v5 text];
      id v7 = [v4 substringToIndex:[v6 length] - 1];
      unsigned int v8 = [(PinField *)self pinTextField];
      [v8 setText:v7];
    }
    [(PinField *)self setNeedsLayout];
  }
}

- (void)_handleReturnKeyTapped:(id)a3
{
  if (![(PinField *)self variableLength]
    || (id v4 = [(LACSecureData *)self->_pinValue length],
        (unint64_t)v4 >= [(NSNumber *)self->_pinMinLength unsignedIntValue]))
  {
    [(PinField *)self _enterPin];
  }
}

- (void)_enterPin
{
  dispatch_time_t v3 = dispatch_time(0, 76000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D114;
  block[3] = &unk_100085F40;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (PinFieldDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PinFieldDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (LACSecureData)pinValue
{
  return self->_pinValue;
}

- (BOOL)variableLength
{
  return self->_variableLength;
}

- (NSNumber)pinFixedLength
{
  return self->_pinFixedLength;
}

- (NSNumber)pinMinLength
{
  return self->_pinMinLength;
}

- (NSNumber)pinMaxLength
{
  return self->_pinMaxLength;
}

- (NSNumber)pinCharset
{
  return self->_pinCharset;
}

- (unint64_t)pinLength
{
  return self->_pinLength;
}

- (UITextField)pinTextField
{
  return self->_pinTextField;
}

- (UIButton)okButton
{
  return self->_okButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_okButton, 0);
  objc_storeStrong((id *)&self->_pinTextField, 0);
  objc_storeStrong((id *)&self->_pinCharset, 0);
  objc_storeStrong((id *)&self->_pinMaxLength, 0);
  objc_storeStrong((id *)&self->_pinMinLength, 0);
  objc_storeStrong((id *)&self->_pinFixedLength, 0);
  objc_storeStrong((id *)&self->_pinValue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pinDotViews, 0);

  objc_storeStrong((id *)&self->_pinDashViews, 0);
}

@end