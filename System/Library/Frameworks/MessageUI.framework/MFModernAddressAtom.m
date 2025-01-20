@interface MFModernAddressAtom
+ (id)copyDisplayStringForAddress:(id)a3 usingAddressBook:(void *)a4 useAbbreviatedName:(BOOL)a5;
- (BOOL)isDisplayStringFromAddressBook;
- (BOOL)respondsToSelector:(SEL)a3;
- (CGPoint)baselinePoint;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MFModernAddressAtom)initWithAddress:(id)a3 presentationOptions:(unint64_t)a4 isPhoneNumber:(BOOL)a5 maxWidth:(double)a6 addressBook:(void *)a7;
- (NSString)addressIdentifier;
- (NSString)description;
- (double)firstLineIndent;
- (id)contactWithKeysToFetch:(id)a3;
- (id)displayString;
- (id)emailAddress;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)fullAddress;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)presentationOptionsDescription;
- (id)unmodifiedAddressString;
- (id)viewForLastBaselineLayout;
- (int)ABPropertyType;
- (int)identifier;
- (int64_t)numberOfLines;
- (unint64_t)presentationOptions;
- (void)ABPerson;
- (void)_displayStringDidChange;
- (void)_updateABPerson;
- (void)_updateDisplayStringIncludingABPerson:(BOOL)a3;
- (void)addressBookDidChange:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)performBuildInAnimationFromTextColor:(id)a3 withDuration:(double)a4;
- (void)setAddress:(id)a3;
- (void)setAtomFont:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFirstLineIndent:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIsPrimaryAddressAtom:(BOOL)a3;
- (void)setLabelAlpha:(double)a3;
- (void)setMaxWidth:(unsigned int)a3;
- (void)setOpaque:(BOOL)a3;
- (void)setPresentationOptions:(unint64_t)a3;
- (void)setScale:(double)a3;
@end

@implementation MFModernAddressAtom

+ (id)copyDisplayStringForAddress:(id)a3 usingAddressBook:(void *)a4 useAbbreviatedName:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  v8 = [v7 emailAddressValue];
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "em_displayableString");
    [v9 simpleAddress];
    if (v5) {
      v11 = {;
    }
      MFPreferredAbbreviatedNameForAddressAndDisplayName(a4, v11, v10, 0);
    }
    else {
      v11 = {;
    }
      MFPreferredCompositeNameForAddressAndDisplayName(a4, v11, v10, 0);
    v13 = };
  }
  else
  {
    v10 = [v7 stringValue];
    if ([v10 containsString:&stru_1F081EF00])
    {
      id v12 = [v10 stringByReplacingOccurrencesOfString:&stru_1F081EF00 withString:&stru_1F0817A00];
    }
    else
    {
      id v12 = v10;
      v10 = v12;
    }
    v13 = v12;
  }

  return v13;
}

- (MFModernAddressAtom)initWithAddress:(id)a3 presentationOptions:(unint64_t)a4 isPhoneNumber:(BOOL)a5 maxWidth:(double)a6 addressBook:(void *)a7
{
  id v14 = a3;
  [MEMORY[0x1E4F5A0C8] defaultHeight];
  double v16 = v15;
  if (pthread_main_np() != 1)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"MFModernAddressAtom.m" lineNumber:112 description:@"Current thread must be main"];
  }
  double v17 = *MEMORY[0x1E4F1DAD8];
  double v18 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v29.receiver = self;
  v29.super_class = (Class)MFModernAddressAtom;
  v19 = -[MFModernAddressAtom initWithFrame:](&v29, sel_initWithFrame_, v17, v18, 30.0, v16);
  v20 = v19;
  v21 = v19;
  if (v19)
  {
    v19->_maxWidth = a6;
    [(MFModernAddressAtom *)v19 setOpaque:0];
    [(MFModernAddressAtom *)v21 setAutoresizesSubviews:1];
    *((unsigned char *)v21 + 504) = *((unsigned char *)v21 + 504) & 0xFE | a5;
    objc_storeStrong((id *)&v20->_fullAddress, a3);
    if (a7) {
      v22 = (void *)CFRetain(a7);
    }
    else {
      v22 = 0;
    }
    v21->_addressBook = v22;
    [(MFModernAddressAtom *)v21 _updateDisplayStringIncludingABPerson:1];
    id v23 = objc_alloc(MEMORY[0x1E4F5A0C8]);
    [(MFModernAddressAtom *)v21 bounds];
    uint64_t v24 = objc_msgSend(v23, "initWithFrame:presentationOptions:separatorStyle:wrappingSupported:", a4, 1, 1);
    atomView = v21->_atomView;
    v21->_atomView = (CNAtomView *)v24;

    [(CNAtomView *)v21->_atomView setUserInteractionEnabled:0];
    [(CNAtomView *)v21->_atomView setAutoresizingMask:2];
    v26 = [MEMORY[0x1E4FB1618] clearColor];
    [(CNAtomView *)v21->_atomView setBackgroundColor:v26];

    [(MFModernAddressAtom *)v21 addSubview:v21->_atomView];
    [(MFModernAddressAtom *)v21 _displayStringDidChange];
  }

  return v21;
}

- (int64_t)numberOfLines
{
  v3 = [(CNAtomView *)self->_atomView titleLabel];
  [v3 bounds];
  double v5 = v4;
  v6 = [(CNAtomView *)self->_atomView titleLabel];
  id v7 = [v6 font];
  [v7 lineHeight];
  double v9 = v5 / v8;

  double v10 = floor(v9);
  double v11 = ceil(v9);
  if (v9 - v10 >= 0.25) {
    return (uint64_t)v11;
  }
  return (uint64_t)v10;
}

- (void)setFirstLineIndent:(double)a3
{
  self->_firstLineIndent = a3;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFModernAddressAtom;
  if (-[MFModernAddressAtom respondsToSelector:](&v5, sel_respondsToSelector_)) {
    char v3 = 1;
  }
  else {
    char v3 = objc_opt_respondsToSelector();
  }
  return v3 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MFModernAddressAtom;
  objc_super v5 = -[MFModernAddressAtom methodSignatureForSelector:](&v7, sel_methodSignatureForSelector_);
  if (!v5)
  {
    objc_super v5 = [(CNAtomView *)self->_atomView methodSignatureForSelector:a3];
  }

  return v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_atomView;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MFModernAddressAtom;
  -[MFModernAddressAtom setEnabled:](&v6, sel_setEnabled_);
  if (v3)
  {
    [(CNAtomView *)self->_atomView setTintColor:0];
  }
  else
  {
    objc_super v5 = [MEMORY[0x1E4FB1618] mailModernLabelledAddressAtomDefaultTextColor];
    [(CNAtomView *)self->_atomView setTintColor:v5];
  }
}

- (NSString)description
{
  v16.receiver = self;
  v16.super_class = (Class)MFModernAddressAtom;
  BOOL v3 = [(MFModernAddressAtom *)&v16 description];
  double v4 = [v3 componentsSeparatedByString:@";"];
  objc_super v5 = (void *)[v4 mutableCopy];

  objc_super v6 = NSString;
  objc_super v7 = [(MFModernAddressAtom *)self presentationOptionsDescription];
  double v8 = [v6 stringWithFormat:@" presentation = %@", v7];
  [v5 insertObject:v8 atIndex:1];

  double v9 = [NSString stringWithFormat:@" address = “%@”", self->_fullAddress];
  [v5 insertObject:v9 atIndex:1];

  if (self->_identifier >= 1)
  {
    double v10 = objc_msgSend(NSString, "stringWithFormat:", @" person = %d", self->_identifier);
    [v5 insertObject:v10 atIndex:1];
  }
  if ([(NSString *)self->_displayString length])
  {
    double v11 = NSString;
    id v12 = [(MFModernAddressAtom *)self displayString];
    v13 = [v11 stringWithFormat:@" name = “%@”", v12];

    [v5 insertObject:v13 atIndex:1];
  }
  else
  {
    [v5 insertObject:@" name = nil" atIndex:1];
  }
  id v14 = [v5 componentsJoinedByString:@";"];

  return (NSString *)v14;
}

- (id)presentationOptionsDescription
{
  unint64_t v2 = [(MFModernAddressAtom *)self presentationOptions];
  if (v2)
  {
    unint64_t v3 = v2;
    double v4 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    double v11 = __53__MFModernAddressAtom_presentationOptionsDescription__block_invoke;
    id v12 = &unk_1E5F7CD80;
    unint64_t v14 = v3;
    id v5 = v4;
    id v13 = v5;
    objc_super v6 = (void (**)(void *, uint64_t, __CFString *))_Block_copy(&v9);
    v6[2](v6, 1, @"failure");
    v6[2](v6, 2, @"sms");
    v6[2](v6, 8, @"disabled");
    v6[2](v6, 16, @"VIP");
    v6[2](v6, 32, @"signed");
    v6[2](v6, 64, @"insecure");
    v6[2](v6, 128, @"secure");
    v6[2](v6, 256, @"unverified");
    v6[2](v6, 512, @"pending (leading)");
    v6[2](v6, 4, @"pending (trailing)");
    v6[2](v6, 1024, @"available");
    v6[2](v6, 2048, @"unavailable");
    v6[2](v6, 4096, @"unknown availability");
    objc_msgSend(v5, "componentsJoinedByString:", @" + ", v9, v10, v11, v12);
    objc_super v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v7 = @"none";
  }

  return v7;
}

void __53__MFModernAddressAtom_presentationOptionsDescription__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ((*(void *)(a1 + 40) & a2) != 0) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (void)addressBookDidChange:(id)a3
{
  [(MFModernAddressAtom *)self _updateDisplayStringIncludingABPerson:1];

  [(MFModernAddressAtom *)self _displayStringDidChange];
}

- (void)setDelegate:(id)a3
{
}

- (void)dealloc
{
  addressBook = self->_addressBook;
  if (addressBook) {
    CFRelease(addressBook);
  }
  person = self->_person;
  if (person) {
    CFRelease(person);
  }
  v5.receiver = self;
  v5.super_class = (Class)MFModernAddressAtom;
  [(MFModernAddressAtom *)&v5 dealloc];
}

- (void)setFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFModernAddressAtom;
  -[MFModernAddressAtom setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  atomView = self->_atomView;
  [(MFModernAddressAtom *)self bounds];
  -[CNAtomView setFrame:](atomView, "setFrame:");
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MFModernAddressAtom;
  [(MFModernAddressAtom *)&v3 layoutSubviews];
  [(CNAtomView *)self->_atomView sizeToFit];
  [(MFModernAddressAtom *)self sizeToFit];
}

- (void)setMaxWidth:(unsigned int)a3
{
  self->_maxWidth = a3;
  [(MFModernAddressAtom *)self setNeedsLayout];
}

- (unint64_t)presentationOptions
{
  return [(CNAtomView *)self->_atomView presentationOptions];
}

- (void)setPresentationOptions:(unint64_t)a3
{
  [(CNAtomView *)self->_atomView setPresentationOptions:a3];

  [(MFModernAddressAtom *)self sizeToFit];
}

- (void)setScale:(double)a3
{
  -[CNAtomView setScale:](self->_atomView, "setScale:");
  [(MFModernAddressAtom *)self frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [MEMORY[0x1E4F5A0C8] defaultHeight];
  -[MFModernAddressAtom setFrame:](self, "setFrame:", v6, v8, v10, v11 * a3);

  [(MFModernAddressAtom *)self sizeToFit];
}

- (void)setIsPrimaryAddressAtom:(BOOL)a3
{
  [(CNAtomView *)self->_atomView setIsPrimaryAddressAtom:a3];

  [(MFModernAddressAtom *)self sizeToFit];
}

- (CGPoint)baselinePoint
{
  [(CNAtomView *)self->_atomView baselinePoint];
  atomView = self->_atomView;

  -[MFModernAddressAtom convertPoint:fromView:](self, "convertPoint:fromView:", atomView);
  result.y = v5;
  result.x = v4;
  return result;
}

- (void)setAtomFont:(id)a3
{
  id v4 = a3;
  -[CNAtomView setTitleFont:](self->_atomView, "setTitleFont:");
  [(MFModernAddressAtom *)self sizeToFit];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  objc_msgSend((id)*MEMORY[0x1E4FB2608], "preferredContentSizeCategory", a3.width, a3.height);
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  atomView = self->_atomView;
  if (IsAccessibilityCategory)
  {
    LODWORD(v6) = self->_maxWidth;
    double v8 = (double)v6;
    -[CNAtomView sizeThatFits:](atomView, "sizeThatFits:", v8, 1.79769313e308);
  }
  else
  {
    double v11 = [(CNAtomView *)atomView titleFont];
    [v11 lineHeight];
    double v13 = v12;
    unint64_t v14 = [(CNAtomView *)self->_atomView titleFont];
    [v14 descender];
    double v16 = round(v13 - v15);

    double v17 = self->_atomView;
    LODWORD(v18) = self->_maxWidth;
    double v19 = (double)v18;
    [(CNAtomView *)v17 frame];
    -[CNAtomView preferredWidthWithSizeConstraints:](v17, "preferredWidthWithSizeConstraints:", v19, v20);
    double v10 = v16;
  }
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)_updateABPerson
{
  if (pthread_main_np() != 1)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MFModernAddressAtom.m" lineNumber:329 description:@"Current thread must be main"];
  }
  person = self->_person;
  if (person) {
    CFRelease(person);
  }
  if (self->_addressBook)
  {
    fullAddress = self->_fullAddress;
    if (*((unsigned char *)self + 504))
    {
      double v7 = [(ECEmailAddressConvertible *)fullAddress stringValue];
      if ([v7 length])
      {
        double v8 = (void *)ABCFindPersonMatchingPhoneNumber();
        goto LABEL_11;
      }
    }
    else
    {
      unint64_t v6 = [(ECEmailAddressConvertible *)fullAddress emailAddressValue];
      double v7 = [v6 simpleAddress];

      if ([v7 length])
      {
        double v8 = (void *)ABCFindPersonMatchingEmailAddress();
LABEL_11:
        self->_person = v8;
      }
    }
  }
  self->_person = 0;
  self->_identifier = 0;
  *((unsigned char *)self + 504) |= 2u;
}

- (id)emailAddress
{
  unint64_t v2 = [(ECEmailAddressConvertible *)self->_fullAddress emailAddressValue];
  objc_super v3 = [v2 simpleAddress];

  return v3;
}

- (BOOL)isDisplayStringFromAddressBook
{
  return (*((unsigned __int8 *)self + 504) >> 2) & 1;
}

- (void)setAddress:(id)a3
{
  double v5 = (ECEmailAddressConvertible *)a3;
  if (self->_fullAddress != v5)
  {
    objc_storeStrong((id *)&self->_fullAddress, a3);
    *((unsigned char *)self + 504) &= ~1u;
    [(MFModernAddressAtom *)self _updateDisplayStringIncludingABPerson:0];
    *((unsigned char *)self + 504) |= 2u;
    [(MFModernAddressAtom *)self _displayStringDidChange];
  }
}

- (void)_displayStringDidChange
{
  atomView = self->_atomView;
  id v5 = [(MFModernAddressAtom *)self displayString];
  -[CNAtomView setTitle:](atomView, "setTitle:");

  [(CNAtomView *)self->_atomView layoutSubviews];
  [(MFModernAddressAtom *)self sizeToFit];
  [(MFModernAddressAtom *)self setNeedsDisplay];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(MFModernAddressAtom *)self displayString];
    [WeakRetained addressAtom:self displayStringDidChange:v4];
  }
}

- (void)_updateDisplayStringIncludingABPerson:(BOOL)a3
{
  BOOL v3 = a3;
  if (pthread_main_np() != 1)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"MFModernAddressAtom.m" lineNumber:400 description:@"Current thread must be main"];
  }
  p_displayString = (id *)&self->_displayString;
  displayString = self->_displayString;
  self->_displayString = 0;

  *((unsigned char *)self + 504) &= ~4u;
  if (v3) {
    [(MFModernAddressAtom *)self _updateABPerson];
  }
  if (!*p_displayString)
  {
    id v17 = [(ECEmailAddressConvertible *)self->_fullAddress emailAddressValue];
    double v8 = [v17 displayName];
    if ([v8 isEqualToString:@"Hide My Email"])
    {
      double v9 = [v17 domain];
      int v10 = [v9 isEqualToString:@"icloud.com"];

      if (v10)
      {
        id v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.messageui"];
        uint64_t v12 = [v11 localizedStringForKey:@"HIDE_MY_EMAIL_TITLE" value:&stru_1F0817A00 table:@"Main"];
        id v13 = *p_displayString;
        id *p_displayString = (id)v12;

LABEL_14:

        return;
      }
    }
    else
    {
    }
    if (*((unsigned char *)self + 504))
    {
      id v11 = [(ECEmailAddressConvertible *)self->_fullAddress stringValue];
      uint64_t v15 = CPPhoneNumberCopyFormattedStringForTextMessage();
      id v16 = *p_displayString;
      id *p_displayString = (id)v15;

      if (!*p_displayString) {
        objc_storeStrong(p_displayString, v11);
      }
    }
    else
    {
      uint64_t v14 = [(id)objc_opt_class() copyDisplayStringForAddress:self->_fullAddress usingAddressBook:0 useAbbreviatedName:0];
      id v11 = *p_displayString;
      id *p_displayString = (id)v14;
    }
    goto LABEL_14;
  }
}

- (void)ABPerson
{
  if ((*((unsigned char *)self + 504) & 2) == 0) {
    [(MFModernAddressAtom *)self _updateABPerson];
  }
  return self->_person;
}

- (int)ABPropertyType
{
  if (*((unsigned char *)self + 504)) {
    unint64_t v2 = (int *)MEMORY[0x1E4F49918];
  }
  else {
    unint64_t v2 = (int *)MEMORY[0x1E4F498D0];
  }
  return *v2;
}

- (id)fullAddress
{
  return self->_fullAddress;
}

- (int)identifier
{
  return self->_identifier;
}

- (NSString)addressIdentifier
{
  v18[1] = *MEMORY[0x1E4F143B8];
  addressIdentifier = self->_addressIdentifier;
  if (addressIdentifier) {
    goto LABEL_4;
  }
  v18[0] = *MEMORY[0x1E4F1ADC8];
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  id v5 = [(MFModernAddressAtom *)self contactWithKeysToFetch:v4];

  unint64_t v6 = [(MFModernAddressAtom *)self emailAddress];
  double v7 = [v6 emailAddressValue];

  if (v7)
  {
    double v8 = [v5 emailAddresses];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __40__MFModernAddressAtom_addressIdentifier__block_invoke;
    v16[3] = &unk_1E5F7BE88;
    id v9 = v7;
    id v17 = v9;
    int v10 = objc_msgSend(v8, "ef_firstObjectPassingTest:", v16);

    uint64_t v11 = [v10 identifier];
    p_addressIdentifier = &self->_addressIdentifier;
    id v13 = *p_addressIdentifier;
    *p_addressIdentifier = (NSString *)v11;

    addressIdentifier = *p_addressIdentifier;
LABEL_4:
    uint64_t v14 = addressIdentifier;
    goto LABEL_5;
  }

  uint64_t v14 = 0;
LABEL_5:

  return v14;
}

BOOL __40__MFModernAddressAtom_addressIdentifier__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 value];
  id v5 = [v4 emailAddressValue];

  if (v5)
  {
    unint64_t v6 = [v3 value];
    double v7 = [v6 emailAddressValue];
    BOOL v8 = [v7 compare:*(void *)(a1 + 32)] == 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)contactWithKeysToFetch:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  unint64_t v6 = [(MFModernAddressAtom *)self unmodifiedAddressString];
  double v7 = objc_msgSend(v5, "em_fetchContactForEmailAddress:keysToFetch:createIfNeeded:", v6, v4, 1);

  return v7;
}

- (id)unmodifiedAddressString
{
  return (id)[(ECEmailAddressConvertible *)self->_fullAddress stringValue];
}

- (id)displayString
{
  return self->_displayString;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MFModernAddressAtom *)self isHighlighted] != a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)MFModernAddressAtom;
    [(MFModernAddressAtom *)&v8 setHighlighted:v3];
    atomView = self->_atomView;
    if (v3)
    {
      [(CNAtomView *)atomView setSelected:1 animated:1];
    }
    else
    {
      unint64_t v6 = objc_msgSend(MEMORY[0x1E4F60F28], "__mui_nextRunLoopMainThreadScheduler");
      double v7 = [(CNAtomView *)atomView ef_onScheduler:v6];
      [v7 setSelected:0 animated:1];
    }
  }
}

- (void)setOpaque:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MFModernAddressAtom;
  -[MFModernAddressAtom setOpaque:](&v6, sel_setOpaque_);
  if (v3) {
    [MEMORY[0x1E4FB1618] whiteColor];
  }
  else {
  id v5 = [MEMORY[0x1E4FB1618] clearColor];
  }
  [(MFModernAddressAtom *)self setBackgroundColor:v5];
}

- (void)setLabelAlpha:(double)a3
{
  id v4 = [(CNAtomView *)self->_atomView titleLabel];
  [v4 setAlpha:a3];
}

- (void)performBuildInAnimationFromTextColor:(id)a3 withDuration:(double)a4
{
}

- (id)viewForLastBaselineLayout
{
  return (id)[(CNAtomView *)self->_atomView titleLabel];
}

- (double)firstLineIndent
{
  return self->_firstLineIndent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressIdentifier, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_fullAddress, 0);
  objc_storeStrong((id *)&self->_atomView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end