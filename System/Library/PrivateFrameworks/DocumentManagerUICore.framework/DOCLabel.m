@interface DOCLabel
- (BOOL)_useShortcutIntrinsicContentSize;
- (CGSize)doc_effectiveContentSize;
- (DOCLabel)initWithCoder:(id)a3;
- (DOCLabel)initWithFrame:(CGRect)a3;
- (void)doc_commonInit;
- (void)setAttributedText:(id)a3;
- (void)setText:(id)a3;
- (void)updateForChangedTraitsAffectingFonts;
@end

@implementation DOCLabel

- (BOOL)_useShortcutIntrinsicContentSize
{
  return !self->_intrinsicContentSizeShortcutDisabled;
}

- (void)setText:(id)a3
{
  useAttributedTextNumber = self->useAttributedTextNumber;
  id v6 = a3;
  if ([(NSNumber *)useAttributedTextNumber BOOLValue])
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"DOCLabel.m", 45, @"Mixing text and attributedText is not suggested, see comments in DOCLabel" object file lineNumber description];
  }
  v7 = self->useAttributedTextNumber;
  self->useAttributedTextNumber = (NSNumber *)MEMORY[0x263EFFA80];

  v9.receiver = self;
  v9.super_class = (Class)DOCLabel;
  [(DOCLabel *)&v9 setText:v6];
}

- (DOCLabel)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DOCLabel;
  v3 = -[DOCLabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(DOCLabel *)v3 doc_commonInit];
  }
  return v4;
}

- (void)doc_commonInit
{
  objc_msgSend(MEMORY[0x263F1CB00], "doc_traitsAffectingFonts");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = (id)[(DOCLabel *)self registerForTraitChanges:v4 withAction:sel_updateForChangedTraitsAffectingFonts];
}

- (void).cxx_destruct
{
}

- (DOCLabel)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DOCLabel;
  id v3 = [(DOCLabel *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(DOCLabel *)v3 doc_commonInit];
  }
  return v4;
}

- (void)setAttributedText:(id)a3
{
  id v5 = a3;
  useAttributedTextNumber = self->useAttributedTextNumber;
  if (useAttributedTextNumber && ![(NSNumber *)useAttributedTextNumber BOOLValue])
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"DOCLabel.m", 52, @"Mixing text and attributedText is not suggested, see comments in DOCLabel" object file lineNumber description];
  }
  v7 = self->useAttributedTextNumber;
  self->useAttributedTextNumber = (NSNumber *)MEMORY[0x263EFFA88];

  v9.receiver = self;
  v9.super_class = (Class)DOCLabel;
  [(DOCLabel *)&v9 setAttributedText:v5];
}

- (CGSize)doc_effectiveContentSize
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  self->_intrinsicContentSizeShortcutDisabled = 1;
  [(DOCLabel *)self invalidateIntrinsicContentSize];
  [(DOCLabel *)self intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  self->_intrinsicContentSizeShortcutDisabled = 0;
  [(DOCLabel *)self frame];
  if (v4 >= v7) {
    double v8 = v7;
  }
  else {
    double v8 = v4;
  }
  double v9 = v6;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)updateForChangedTraitsAffectingFonts
{
  if ([(DOCLabel *)self adjustsFontForContentSizeCategory])
  {
    [(DOCLabel *)self invalidateIntrinsicContentSize];
  }
}

@end