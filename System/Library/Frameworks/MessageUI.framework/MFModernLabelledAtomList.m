@interface MFModernLabelledAtomList
+ (double)atomLineHeight;
+ (double)spaceBetweenColonAndFirstAtomNaturalEdge;
+ (id)defaultLabelFont;
+ (id)primaryLabelFont;
- (BOOL)isLabelVisible;
- (BOOL)isPrimary;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGPoint)baselinePointForRow:(unint64_t)a3;
- (CGRect)_frameForAtomAtIndex:(unint64_t)a3 withStartingPoint:(CGPoint)a4 row:(unint64_t *)a5;
- (CGRect)labelFrame;
- (CGSize)intrinsicContentSize;
- (MFModernLabelledAtomList)initWithLabel:(id)a3 title:(id)a4 addressBook:(void *)a5;
- (MFModernLabelledAtomListDelegate)delegate;
- (NSArray)addresses;
- (NSArray)viewsToDodge;
- (UIColor)labelTextColor;
- (UILabel)label;
- (double)_remainingSpaceForRowAtPoint:(CGPoint)a3;
- (double)lineSpacing;
- (id)addressAtoms;
- (id)atomDisplayStrings;
- (id)labelText;
- (id)passthroughViews;
- (id)title;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (unint64_t)numberOfRows;
- (void)_reflow;
- (void)_reflowIfNeeded;
- (void)_setNeedsReflow;
- (void)_updateLastAddressAtomIfNecessary;
- (void)addressBookDidChange:(id)a3;
- (void)crossFadeLabelVisibility:(BOOL)a3 atomSeparatorStyle:(int)a4 withAnimationCoordinator:(id)a5;
- (void)dealloc;
- (void)enumerateAddressAtomsUsingBlock:(id)a3;
- (void)layoutSubviews;
- (void)setAddressAtomScale:(double)a3;
- (void)setAddressAtomSeparatorStyle:(int)a3;
- (void)setAddressAtomTarget:(id)a3 action:(SEL)a4;
- (void)setAddressAtomsArePrimary:(BOOL)a3;
- (void)setAddresses:(id)a3;
- (void)setAddresses:(id)a3 withCompletion:(id)a4;
- (void)setAtomAlpha:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setLabelTextColor:(id)a3;
- (void)setLabelVisible:(BOOL)a3;
- (void)setLineSpacing:(double)a3;
- (void)setOpaque:(BOOL)a3;
- (void)setOverrideFont:(id)a3;
- (void)setPrimary:(BOOL)a3;
- (void)setViewsToDodge:(id)a3;
@end

@implementation MFModernLabelledAtomList

- (void)dealloc
{
  [(MFModernLabelledAtomList *)self setAddressAtomTarget:0 action:0];
  [(NSMutableArray *)self->_addressAtoms makeObjectsPerformSelector:sel_setDelegate_ withObject:0];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  addressBook = self->_addressBook;
  if (addressBook) {
    CFRelease(addressBook);
  }
  v5.receiver = self;
  v5.super_class = (Class)MFModernLabelledAtomList;
  [(MFModernLabelledAtomList *)&v5 dealloc];
}

- (MFModernLabelledAtomList)initWithLabel:(id)a3 title:(id)a4 addressBook:(void *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (pthread_main_np() != 1)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2 object:self file:@"MFModernLabelledAtomList.m" lineNumber:70 description:@"Current thread must be main"];
  }
  v33.receiver = self;
  v33.super_class = (Class)MFModernLabelledAtomList;
  double v11 = *MEMORY[0x1E4F1DB28];
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v15 = -[MFModernLabelledAtomList initWithFrame:](&v33, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v12, v13, v14);
  if (v15)
  {
    if (a5) {
      v15->_addressBook = (void *)CFRetain(a5);
    }
    [(MFModernLabelledAtomList *)v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MFModernLabelledAtomList *)v15 setOpaque:1];
    [(MFModernLabelledAtomList *)v15 setAutoresizesSubviews:0];
    uint64_t v16 = [MEMORY[0x1E4FB1618] mailModernLabelledAtomDefaultTextColor];
    labelTextColor = v15->_labelTextColor;
    v15->_labelTextColor = (UIColor *)v16;

    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v11, v12, v13, v14);
    label = v15->_label;
    v15->_label = (UILabel *)v18;

    [(UILabel *)v15->_label setText:v9];
    [(UILabel *)v15->_label setTextColor:v15->_labelTextColor];
    [(MFModernLabelledAtomList *)v15 addSubview:v15->_label];
    v15->_labelVisible = 1;
    v20 = v15->_label;
    v21 = +[MFModernLabelledAtomList defaultLabelFont];
    [(UILabel *)v20 setFont:v21];

    [(UILabel *)v15->_label setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v15->_label sizeToFit];
    uint64_t v22 = [v10 copy];
    title = v15->_title;
    v15->_title = (NSString *)v22;

    v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    addressAtoms = v15->_addressAtoms;
    v15->_addressAtoms = v24;

    uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v11, v12, v13, v14);
    lastBaselineDeceptionLabel = v15->_lastBaselineDeceptionLabel;
    v15->_lastBaselineDeceptionLabel = (UILabel *)v26;

    [(UILabel *)v15->_lastBaselineDeceptionLabel setHidden:1];
    [(UILabel *)v15->_lastBaselineDeceptionLabel setText:@" "];
    [(UILabel *)v15->_lastBaselineDeceptionLabel sizeToFit];
    [(MFModernLabelledAtomList *)v15 addSubview:v15->_lastBaselineDeceptionLabel];
    LODWORD(v28) = 1148846080;
    [(MFModernLabelledAtomList *)v15 setContentHuggingPriority:1 forAxis:v28];
    LODWORD(v29) = 1148846080;
    [(MFModernLabelledAtomList *)v15 setContentCompressionResistancePriority:1 forAxis:v29];
    v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v30 addObserver:v15 selector:sel_contentSizeCategoryDidChangeNotification_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  [(MFModernLabelledAtomList *)v15 setAccessibilityIdentifier:*MEMORY[0x1E4F73C00]];

  return v15;
}

- (void)_updateLastAddressAtomIfNecessary
{
  id v4 = [(NSMutableArray *)self->_addressAtoms lastObject];
  int v3 = [v4 separatorStyle];

  if (!v3)
  {
    id v5 = [(NSMutableArray *)self->_addressAtoms lastObject];
    [v5 setSeparatorStyle:2];
  }
}

- (void)setAddresses:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, MFModernLabelledAtomList *))a4;
  if (![(NSArray *)self->_addresses isEqualToArray:v6])
  {
    [(MFModernLabelledAtomList *)self setAddresses:v6];
    unint64_t v8 = [v6 count];
    id v9 = [(MFModernLabelledAtomList *)self addressAtoms];
    unint64_t v10 = [v9 count];

    if (v10 > v8)
    {
      unint64_t v11 = v10;
      do
      {
        double v12 = [(NSMutableArray *)self->_addressAtoms lastObject];
        [v12 removeFromSuperview];
        [(NSMutableArray *)self->_addressAtoms removeObject:v12];

        --v11;
      }
      while (v11 > v8);
    }
    addressAtoms = self->_addressAtoms;
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __56__MFModernLabelledAtomList_setAddresses_withCompletion___block_invoke;
    v24 = &unk_1E5F7CE30;
    id v14 = v6;
    id v25 = v14;
    [(NSMutableArray *)addressAtoms enumerateObjectsUsingBlock:&v21];
    if (v10 < v8)
    {
      v20 = v7;
      if (v8 > 0x63) {
        addressBook = 0;
      }
      else {
        addressBook = self->_addressBook;
      }
      do
      {
        uint64_t v16 = [MFModernAddressAtom alloc];
        v17 = [v14 objectAtIndexedSubscript:v10];
        uint64_t v18 = [(MFModernAddressAtom *)v16 initWithAddress:v17 presentationOptions:0 isPhoneNumber:0 maxWidth:addressBook addressBook:0.0];

        if ([(MFModernLabelledAtomList *)self isPrimary]) {
          BOOL v19 = [(MFModernLabelledAtomList *)self isLabelVisible];
        }
        else {
          BOOL v19 = 1;
        }
        -[MFModernAddressAtom setEnabled:](v18, "setEnabled:", v19, v20, v21, v22, v23, v24);
        [(MFModernAddressAtom *)v18 setDelegate:self];
        [(NSMutableArray *)self->_addressAtoms addObject:v18];
        [(MFModernLabelledAtomList *)self addSubview:v18];

        ++v10;
      }
      while (v8 != v10);
      v7 = v20;
      [(MFModernLabelledAtomList *)self _updateLastAddressAtomIfNecessary];
    }
    if (v7) {
      v7[2](v7, self);
    }
    [(MFModernLabelledAtomList *)self _reflow];
  }
}

void __56__MFModernLabelledAtomList_setAddresses_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  id v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  [v6 setAddress:v5];
}

- (CGSize)intrinsicContentSize
{
  [(MFModernLabelledAtomList *)self bounds];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)addressBookDidChange:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v5 = self->_addressAtoms;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "addressBookDidChange:", v4, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

+ (id)defaultLabelFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
}

+ (id)primaryLabelFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
}

+ (double)atomLineHeight
{
  return 25.0;
}

+ (double)spaceBetweenColonAndFirstAtomNaturalEdge
{
  return 5.0;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)MFModernLabelledAtomList;
  [(MFModernLabelledAtomList *)&v5 layoutSubviews];
  [(MFModernLabelledAtomList *)self frame];
  CGFloat Width = CGRectGetWidth(v6);
  double v4 = Width - self->_previousWidth;
  if (v4 < 0.0) {
    double v4 = -v4;
  }
  if (v4 > 0.00000011920929)
  {
    self->_previousCGFloat Width = Width;
    [(MFModernLabelledAtomList *)self _setNeedsReflow];
  }
  [(MFModernLabelledAtomList *)self _reflowIfNeeded];
}

- (void)_reflowIfNeeded
{
  if (*((unsigned char *)self + 433)) {
    [(MFModernLabelledAtomList *)self _reflow];
  }
}

- (void)setPrimary:(BOOL)a3
{
  if (self->_primary != a3)
  {
    self->_primary = a3;
    objc_super v5 = objc_opt_class();
    if (a3) {
      [v5 primaryLabelFont];
    }
    else {
    id v6 = [v5 defaultLabelFont];
    }
    [(UILabel *)self->_label setFont:v6];
    [(UILabel *)self->_label sizeToFit];
  }
}

- (void)setLabelTextColor:(id)a3
{
  objc_super v5 = (UIColor *)a3;
  if (self->_labelTextColor != v5)
  {
    objc_storeStrong((id *)&self->_labelTextColor, a3);
    [(UILabel *)self->_label setTextColor:v5];
  }
}

- (void)setLineSpacing:(double)a3
{
  if (self->_lineSpacing != a3)
  {
    self->_lineSpacing = a3;
    [(MFModernLabelledAtomList *)self _setNeedsReflow];
  }
}

- (void)enumerateAddressAtomsUsingBlock:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MFModernLabelledAtomList *)self addressAtoms];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__MFModernLabelledAtomList_enumerateAddressAtomsUsingBlock___block_invoke;
  v7[3] = &unk_1E5F7CE58;
  id v6 = v4;
  id v8 = v6;
  [v5 enumerateObjectsUsingBlock:v7];
}

uint64_t __60__MFModernLabelledAtomList_enumerateAddressAtomsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_setNeedsReflow
{
  if ((*((unsigned char *)self + 433) & 1) == 0)
  {
    *((unsigned char *)self + 433) |= 1u;
    [(MFModernLabelledAtomList *)self setNeedsLayout];
  }
}

- (void)_reflow
{
  v55[1] = *MEMORY[0x1E4F143B8];
  *((unsigned char *)self + 433) &= ~1u;
  if ([(NSMutableArray *)self->_addressAtoms count])
  {
    uint64_t v3 = [(MFModernLabelledAtomList *)self effectiveUserInterfaceLayoutDirection];
    double v4 = 0.0;
    double v50 = 0.0;
    if ([(MFModernLabelledAtomList *)self isLabelVisible])
    {
      objc_super v5 = [(UILabel *)self->_label text];
      uint64_t v54 = *MEMORY[0x1E4FB06F8];
      id v6 = [(UILabel *)self->_label font];
      v55[0] = v6;
      uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:&v54 count:1];
      objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 1, v7, 0, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      double v9 = v8;

      [(id)objc_opt_class() spaceBetweenColonAndFirstAtomNaturalEdge];
      double v50 = v9 + v10;
    }
    if (v3 == 1)
    {
      [(MFModernLabelledAtomList *)self bounds];
      double v4 = CGRectGetWidth(v56) - v50;
    }
    uint64_t v53 = 0;
    uint64_t v11 = [(NSMutableArray *)self->_addressAtoms count];
    if (v11)
    {
      BOOL v12 = 0;
      uint64_t v13 = 0;
      double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v51 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v52 = *MEMORY[0x1E4F1DB28];
      double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      uint64_t v16 = (id *)MEMORY[0x1E4FB2608];
      CGFloat v17 = 0.0;
      double v18 = v50;
      CGFloat v19 = 0.0;
      do
      {
        v20 = [(NSMutableArray *)self->_addressAtoms objectAtIndex:v13];
        if (!v13)
        {
          uint64_t v21 = [*v16 preferredContentSizeCategory];
          BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v21);

          double v23 = 0.0;
          if (IsAccessibilityCategory)
          {
            double v23 = v50;
            if (!self->_labelVisible) {
              double v23 = 0.0;
            }
          }
          [v20 setFirstLineIndent:v23];
        }
        [v20 layoutIfNeeded];
        if (v12)
        {
          ++v53;
          CGFloat v19 = v51;
          double v4 = v52;
          double v18 = v14;
          CGFloat v17 = v15;
        }
        v57.origin.x = v4;
        v57.origin.y = v19;
        v57.size.width = v18;
        v57.size.height = v17;
        double MaxX = CGRectGetMaxX(v57);
        v58.origin.x = v4;
        v58.origin.y = v19;
        v58.size.width = v18;
        v58.size.height = v17;
        double MaxY = CGRectGetMaxY(v58);
        if (v3 == 1)
        {
          v59.origin.x = v4;
          v59.origin.y = v19;
          v59.size.width = v18;
          v59.size.height = v17;
          double MaxX = CGRectGetMinX(v59);
        }
        [(MFModernLabelledAtomList *)self bounds];
        if (CGRectGetWidth(v60) > 0.0)
        {
          -[MFModernLabelledAtomList _frameForAtomAtIndex:withStartingPoint:row:](self, "_frameForAtomAtIndex:withStartingPoint:row:", v13, &v53, MaxX, MaxY);
          objc_msgSend(v20, "setFrame:");
          BOOL v12 = [v20 numberOfLines] > 1;
          [v20 frame];
          double v4 = v26;
          CGFloat v19 = v27;
          double v29 = v28;
          CGFloat v17 = v30;
          [v20 edgeInsets];
          double v18 = v29 + v31;
        }

        ++v13;
      }
      while (v11 != v13);
    }
    [(MFModernLabelledAtomList *)self baselinePointForRow:v53];
    double v33 = v32;
    self->_numberOfRows = v53 + 1;
    [(MFModernLabelledAtomList *)self frame];
    if (v34 != v33)
    {
      -[MFModernLabelledAtomList setFrame:](self, "setFrame:");
      [(MFModernLabelledAtomList *)self invalidateIntrinsicContentSize];
    }
    if (v3 == 1)
    {
      [(UILabel *)self->_label frame];
      double v36 = v35;
      double v38 = v37;
      double v40 = v39;
      [(MFModernLabelledAtomList *)self bounds];
      -[UILabel setFrame:](self->_label, "setFrame:", v41 - v38, v36, v38, v40);
    }
    [(UILabel *)self->_lastBaselineDeceptionLabel frame];
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;
    [(UILabel *)self->_lastBaselineDeceptionLabel _firstBaselineOffsetFromTop];
    -[UILabel setFrame:](self->_lastBaselineDeceptionLabel, "setFrame:", v43, v33 - v48, v45, v47);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained displayStringsDidChangeForLabelledAtomList:self];
  }
}

- (CGRect)_frameForAtomAtIndex:(unint64_t)a3 withStartingPoint:(CGPoint)a4 row:(unint64_t *)a5
{
  double x = a4.x;
  double v9 = -[NSMutableArray objectAtIndex:](self->_addressAtoms, "objectAtIndex:", a4.x, a4.y);
  uint64_t v10 = [(MFModernLabelledAtomList *)self effectiveUserInterfaceLayoutDirection];
  [(MFModernLabelledAtomList *)self baselinePointForRow:*a5];
  double v12 = v11;
  if (!a3)
  {
    uint64_t v13 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v13);

    if (IsAccessibilityCategory && self->_labelVisible)
    {
      -[MFModernLabelledAtomList _remainingSpaceForRowAtPoint:](self, "_remainingSpaceForRowAtPoint:", x, v12);
      if (v15 >= 1.0)
      {
        [(UILabel *)self->_label origin];
        double x = v17;
        [(UILabel *)self->_label bounds];
        [v9 setFirstLineIndent:v18];
      }
      else
      {
        [v9 setFirstLineIndent:0.0];
        ++*a5;
        -[MFModernLabelledAtomList baselinePointForRow:](self, "baselinePointForRow:");
        double v12 = v16;
        double x = 0.0;
      }
    }
  }
  -[MFModernLabelledAtomList _remainingSpaceForRowAtPoint:](self, "_remainingSpaceForRowAtPoint:", x, v12);
  double v20 = v19;
  [(MFModernLabelledAtomList *)self bounds];
  double Width = CGRectGetWidth(v44);
  if (!a3) {
    double Width = v20;
  }
  [v9 setMaxWidth:Width];
  [v9 layoutIfNeeded];
  [v9 frame];
  CGFloat v26 = v24;
  CGFloat v27 = v25;
  if (v10 == 1) {
    CGRectGetWidth(*(CGRect *)&v22);
  }
  [v9 edgeInsets];
  UIRoundToViewScale();
  CGFloat v29 = v28;
  [v9 baselinePoint];
  UIRoundToViewScale();
  CGFloat v31 = v30;
  uint64_t v32 = [v9 numberOfLines];
  if (a3
    && ([(MFModernLabelledAtomList *)self lineSpacing], v33 > 0.0)
    && (v45.origin.double x = v29, v45.origin.y = v31, v45.size.width = v26, v45.size.height = v27, CGRectGetWidth(v45) > v20))
  {
    ++*a5;
    uint64_t v34 = MEMORY[0x1E4F1DAD8];
    if (v10 == 1)
    {
      [(MFModernLabelledAtomList *)self bounds];
      double v35 = CGRectGetWidth(v46);
    }
    else
    {
      double v35 = *MEMORY[0x1E4F1DAD8];
    }
    -[MFModernLabelledAtomList _frameForAtomAtIndex:withStartingPoint:row:](self, "_frameForAtomAtIndex:withStartingPoint:row:", a3, a5, v35, *(double *)(v34 + 8));
    CGFloat v29 = v36;
    CGFloat v31 = v37;
    CGFloat v26 = v38;
    CGFloat v27 = v39;
  }
  else if (v32 >= 2)
  {
    *a5 = [v9 numberOfLines] + *a5 - 1;
  }

  double v40 = v29;
  double v41 = v31;
  double v42 = v26;
  double v43 = v27;
  result.size.height = v43;
  result.size.width = v42;
  result.origin.y = v41;
  result.origin.double x = v40;
  return result;
}

- (double)_remainingSpaceForRowAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(MFModernLabelledAtomList *)self effectiveUserInterfaceLayoutDirection];
  [(MFModernLabelledAtomList *)self bounds];
  double v7 = CGRectGetWidth(v53) - x;
  [(MFModernLabelledAtomList *)self baselinePointForRow:0];
  double v9 = v8;
  if (v6 == 1) {
    double v10 = x;
  }
  else {
    double v10 = v7;
  }
  double v46 = v10;
  if (v6 == 1)
  {
    double v11 = 0.0;
    double v7 = x;
  }
  else
  {
    [(MFModernLabelledAtomList *)self bounds];
    double v11 = CGRectGetWidth(v54) - v7;
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  double v12 = [(MFModernLabelledAtomList *)self viewsToDodge];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v13)
  {
    double v14 = y - v9;
    uint64_t v15 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v48 != v15) {
          objc_enumerationMutation(v12);
        }
        double v17 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        [v17 frame];
        double v19 = v18;
        double v21 = v20;
        double v23 = v22;
        double v25 = v24;
        CGFloat v26 = [v17 superview];
        -[MFModernLabelledAtomList convertRect:fromView:](self, "convertRect:fromView:", v26, v19, v21, v23, v25);
        CGFloat v28 = v27;
        CGFloat v30 = v29;
        CGFloat v32 = v31;
        CGFloat v34 = v33;

        v55.origin.double x = v28;
        v55.origin.double y = v30;
        v55.size.CGFloat width = v32;
        v55.size.CGFloat height = v34;
        v57.origin.double x = v11;
        v57.origin.double y = v14;
        v57.size.CGFloat width = v7;
        v57.size.CGFloat height = v9;
        CGRect v56 = CGRectIntersection(v55, v57);
        CGFloat v35 = v56.origin.x;
        CGFloat v36 = v56.origin.y;
        CGFloat width = v56.size.width;
        CGFloat height = v56.size.height;
        if (!CGRectIsEmpty(v56))
        {
          CGFloat v39 = v35;
          CGFloat v40 = v36;
          CGFloat v41 = width;
          CGFloat v42 = height;
          if (v6 == 1) {
            double v43 = v45 - CGRectGetMaxX(*(CGRect *)&v39);
          }
          else {
            double v43 = CGRectGetMinX(*(CGRect *)&v39) - v45;
          }
          double v46 = v43;
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v13);
  }

  return v46;
}

- (void)setAddressAtomTarget:(id)a3 action:(SEL)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v7 = self->_addressAtoms;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        double v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v11, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL, (void)v12);
        if (v6) {
          [v11 addTarget:v6 action:a4 forControlEvents:64];
        }
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)setAddressAtomScale:(double)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v4 = self->_addressAtoms;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "setScale:", a3, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)setAddressAtomSeparatorStyle:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_addressAtoms;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setSeparatorStyle:", v3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(MFModernLabelledAtomList *)self _updateLastAddressAtomIfNecessary];
  [(MFModernLabelledAtomList *)self _setNeedsReflow];
}

- (void)setAddressAtomsArePrimary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_addressAtoms;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setIsPrimaryAddressAtom:", v3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(MFModernLabelledAtomList *)self _setNeedsReflow];
}

- (id)labelText
{
  return [(UILabel *)self->_label text];
}

- (CGRect)labelFrame
{
  if ([(MFModernLabelledAtomList *)self isLabelVisible])
  {
    [(UILabel *)self->_label frame];
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB28];
    double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (BOOL)isLabelVisible
{
  return self->_labelVisible;
}

- (void)setLabelVisible:(BOOL)a3
{
  if (self->_labelVisible != a3)
  {
    BOOL v3 = a3;
    self->_labelVisible = a3;
    double v5 = 0.0;
    if (a3) {
      double v5 = 1.0;
    }
    [(UILabel *)self->_label setAlpha:v5];
    id v6 = [(NSMutableArray *)self->_addressAtoms firstObject];
    [v6 setEnabled:v3];
    [(MFModernLabelledAtomList *)self _setNeedsReflow];
  }
}

- (id)title
{
  return self->_title;
}

- (id)atomDisplayStrings
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_addressAtoms = &self->_addressAtoms;
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->_addressAtoms, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v4 = *p_addressAtoms;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "displayString", (void)v10);
        [v3 addObject:v8];
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v3;
}

- (id)addressAtoms
{
  double v2 = (void *)[(NSMutableArray *)self->_addressAtoms copy];

  return v2;
}

- (void)setAtomAlpha:(double)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v4 = self->_addressAtoms;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "setAlpha:", a3, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)setOpaque:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFModernLabelledAtomList;
  -[MFModernLabelledAtomList setOpaque:](&v7, sel_setOpaque_);
  label = self->_label;
  if (v3) {
    [MEMORY[0x1E4FB1618] whiteColor];
  }
  else {
  uint64_t v6 = [MEMORY[0x1E4FB1618] clearColor];
  }
  [(UILabel *)label setBackgroundColor:v6];
}

- (id)passthroughViews
{
  double v2 = (void *)[(NSMutableArray *)self->_addressAtoms copy];

  return v2;
}

- (void)crossFadeLabelVisibility:(BOOL)a3 atomSeparatorStyle:(int)a4 withAnimationCoordinator:(id)a5
{
  id v8 = a5;
  if ([(NSMutableArray *)self->_addressAtoms count])
  {
    long long v9 = [(NSMutableArray *)self->_addressAtoms objectAtIndex:0];
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x4010000000;
    v36[3] = "";
    *(void *)&long long v10 = -1;
    *((void *)&v10 + 1) = -1;
    long long v37 = v10;
    long long v38 = v10;
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x4010000000;
    v33[3] = "";
    long long v34 = v10;
    long long v35 = v10;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x3032000000;
    v31[3] = __Block_byref_object_copy__8;
    v31[4] = __Block_byref_object_dispose__8;
    id v32 = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = __Block_byref_object_copy__8;
    v29[4] = __Block_byref_object_dispose__8;
    id v30 = 0;
    long long v11 = (void *)MEMORY[0x1E4FB1EB0];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __97__MFModernLabelledAtomList_crossFadeLabelVisibility_atomSeparatorStyle_withAnimationCoordinator___block_invoke;
    v20[3] = &unk_1E5F7CE80;
    double v23 = v33;
    id v12 = v9;
    id v21 = v12;
    double v22 = self;
    BOOL v28 = a3;
    int v27 = a4;
    double v24 = v31;
    double v25 = v36;
    CGFloat v26 = v29;
    [v11 performWithoutAnimation:v20];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __97__MFModernLabelledAtomList_crossFadeLabelVisibility_atomSeparatorStyle_withAnimationCoordinator___block_invoke_2;
    v18[3] = &unk_1E5F7CEA8;
    BOOL v19 = a3;
    v18[4] = self;
    v18[5] = v29;
    v18[6] = v31;
    v18[7] = v36;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __97__MFModernLabelledAtomList_crossFadeLabelVisibility_atomSeparatorStyle_withAnimationCoordinator___block_invoke_3;
    v14[3] = &unk_1E5F79EA8;
    id v13 = v12;
    id v15 = v13;
    double v16 = v31;
    uint64_t v17 = v29;
    [v8 animateAlongsideAnimations:v18 completion:v14];

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(v31, 8);

    _Block_object_dispose(v33, 8);
    _Block_object_dispose(v36, 8);
  }
}

uint64_t __97__MFModernLabelledAtomList_crossFadeLabelVisibility_atomSeparatorStyle_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) frame];
  double v2 = *(void **)(*(void *)(a1 + 48) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  uint64_t v7 = [*(id *)(a1 + 32) snapshotView];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  long long v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  long long v10 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) layer];
  objc_msgSend(v10, "setAnchorPoint:", 0.0, 0.5);

  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 56));
  [*(id *)(a1 + 40) addSubview:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  [*(id *)(a1 + 32) setEnabled:*(unsigned __int8 *)(a1 + 84)];
  *(unsigned char *)(*(void *)(a1 + 40) + 432) = *(unsigned char *)(a1 + 84);
  [*(id *)(a1 + 40) setAddressAtomSeparatorStyle:*(unsigned int *)(a1 + 80)];
  [*(id *)(a1 + 32) sizeToFit];
  [*(id *)(a1 + 40) _reflow];
  [*(id *)(a1 + 32) frame];
  long long v11 = *(void **)(*(void *)(a1 + 64) + 8);
  v11[4] = v12;
  v11[5] = v13;
  v11[6] = v14;
  v11[7] = v15;
  uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1C40]), "initWithFrame:", *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 56));
  uint64_t v17 = *(void *)(*(void *)(a1 + 72) + 8);
  double v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;

  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) captureSnapshotOfView:*(void *)(a1 + 32) withSnapshotType:0];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setAlpha:0.0];
  [*(id *)(a1 + 40) addSubview:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  BOOL v19 = *(void **)(a1 + 32);

  return [v19 setAlpha:0.0];
}

uint64_t __97__MFModernLabelledAtomList_crossFadeLabelVisibility_atomSeparatorStyle_withAnimationCoordinator___block_invoke_2(uint64_t a1)
{
  double v2 = 1.0;
  if (!*(unsigned char *)(a1 + 64)) {
    double v2 = 0.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 448) setAlpha:v2];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setAlpha:1.0];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setAlpha:0.0];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 56));
  uint64_t v3 = *(double **)(*(void *)(a1 + 56) + 8);
  double v4 = v3[4];
  double v5 = v3[5];
  double v6 = v3[6];
  double v7 = v3[7];
  uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return objc_msgSend(v8, "setFrame:", v4, v5, v6, v7);
}

uint64_t __97__MFModernLabelledAtomList_crossFadeLabelVisibility_atomSeparatorStyle_withAnimationCoordinator___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) removeFromSuperview];
  double v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);

  return [v2 removeFromSuperview];
}

- (id)viewForFirstBaselineLayout
{
  return self->_label;
}

- (id)viewForLastBaselineLayout
{
  return self->_lastBaselineDeceptionLabel;
}

- (void)setOverrideFont:(id)a3
{
  id v4 = a3;
  double v5 = (void *)MEMORY[0x1E4FB08E0];
  [v4 pointSize];
  double v6 = objc_msgSend(v5, "systemFontOfSize:");
  [(UILabel *)self->_label setFont:v6];
  [(UILabel *)self->_label sizeToFit];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__MFModernLabelledAtomList_setOverrideFont___block_invoke;
  v8[3] = &unk_1E5F7CED0;
  id v7 = v4;
  id v9 = v7;
  [(MFModernLabelledAtomList *)self enumerateAddressAtomsUsingBlock:v8];
  [(MFModernLabelledAtomList *)self _setNeedsReflow];
}

uint64_t __44__MFModernLabelledAtomList_setOverrideFont___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setTitleFont:*(void *)(a1 + 32)];
}

- (void)setViewsToDodge:(id)a3
{
  id v5 = a3;
  if ((-[NSArray isEqual:](self->_viewsToDodge, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewsToDodge, a3);
    [(MFModernLabelledAtomList *)self _setNeedsReflow];
  }
}

- (CGPoint)baselinePointForRow:(unint64_t)a3
{
  [(UILabel *)self->_label frame];
  double MaxY = CGRectGetMaxY(v12);
  [(UILabel *)self->_label _baselineOffsetFromBottom];
  double v6 = MaxY - v5;
  double v7 = *MEMORY[0x1E4F1DAD8];
  [(MFModernLabelledAtomList *)self lineSpacing];
  UIRoundToViewScale();
  double v9 = v6 + v8;
  double v10 = v7;
  result.double y = v9;
  result.double x = v10;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  [(MFModernLabelledAtomList *)self frame];
  uint64_t v8 = v7;
  double v10 = v9;
  uint64_t v12 = v11;
  double v14 = v13;
  uint64_t v15 = [(MFModernLabelledAtomList *)self superview];
  objc_msgSend(v15, "convertPoint:fromView:", self, x, y);
  uint64_t v17 = v16;
  uint64_t v19 = v18;

  if ([(NSMutableArray *)self->_addressAtoms count])
  {
    double v20 = [(NSMutableArray *)self->_addressAtoms objectAtIndex:0];
    [v20 baselinePoint];
    double v22 = v21;
    [v20 frame];
    double v14 = v14 + (v23 - v22) * 2.0;
    double v10 = v10 - (v23 - v22);
  }
  uint64_t v24 = v8;
  double v25 = v10;
  uint64_t v26 = v12;
  double v27 = v14;
  uint64_t v28 = v17;
  uint64_t v29 = v19;

  return CGRectContainsPoint(*(CGRect *)&v24, *(CGPoint *)&v28);
}

- (UILabel)label
{
  return self->_label;
}

- (UIColor)labelTextColor
{
  return self->_labelTextColor;
}

- (BOOL)isPrimary
{
  return self->_primary;
}

- (double)lineSpacing
{
  return self->_lineSpacing;
}

- (unint64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (NSArray)viewsToDodge
{
  return self->_viewsToDodge;
}

- (MFModernLabelledAtomListDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFModernLabelledAtomListDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)addresses
{
  return self->_addresses;
}

- (void)setAddresses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewsToDodge, 0);
  objc_storeStrong((id *)&self->_labelTextColor, 0);
  objc_storeStrong((id *)&self->_lastBaselineDeceptionLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_addressAtoms, 0);
}

@end