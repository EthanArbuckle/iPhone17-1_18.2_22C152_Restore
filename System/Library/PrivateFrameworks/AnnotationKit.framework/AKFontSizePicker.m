@interface AKFontSizePicker
- (AKFontSizePicker)initWithFrame:(CGRect)a3;
- (AKFontSizePicker)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (CGSize)_itemSizeInContainer;
- (NSArray)sizeListValues;
- (UICollectionView)sizeList;
- (UILabel)label;
- (UISlider)slider;
- (UIStepper)stepper;
- (double)value;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)didEndTrackingUpdates;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)willBeginTrackingUpdates;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)style;
- (void)_decreaseSize:(id)a3;
- (void)_handleValueChanged:(id)a3;
- (void)_increaseSize:(id)a3;
- (void)_selectSizeInList;
- (void)_sliderTouchDown:(id)a3;
- (void)_sliderTouchUp:(id)a3;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)setDidEndTrackingUpdates:(id)a3;
- (void)setLabel:(id)a3;
- (void)setSizeList:(id)a3;
- (void)setSizeListValues:(id)a3;
- (void)setSlider:(id)a3;
- (void)setStepper:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setValue:(double)a3;
- (void)setWillBeginTrackingUpdates:(id)a3;
@end

@implementation AKFontSizePicker

- (AKFontSizePicker)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AKFontSizePicker;
  v5 = -[AKFontSizePicker initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    sizeListValues = v5->_sizeListValues;
    v5->_sizeListValues = (NSArray *)&unk_26EA75FF8;

    [(AKFontSizePicker *)v6 setStyle:a4];
  }
  return v6;
}

- (AKFontSizePicker)initWithFrame:(CGRect)a3
{
  return -[AKFontSizePicker initWithFrame:style:](self, "initWithFrame:style:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setStyle:(int64_t)a3
{
  v70[4] = *MEMORY[0x263EF8340];
  if (self->_style != a3)
  {
    v5 = [(AKFontSizePicker *)self label];
    [v5 removeFromSuperview];

    v6 = [(AKFontSizePicker *)self stepper];
    [v6 removeFromSuperview];

    v7 = [(AKFontSizePicker *)self sizeList];
    [v7 removeFromSuperview];

    switch(a3)
    {
      case 3:
        id firstValuea = [MEMORY[0x263F1C6B0] systemImageNamed:@"textformat.size.smaller"];
        v67 = [MEMORY[0x263F1C6B0] systemImageNamed:@"textformat.size.larger"];
        id v24 = objc_alloc(MEMORY[0x263F1C990]);
        v25 = objc_msgSend(v24, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
        [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
        LODWORD(v26) = 9.0;
        [v25 setMinimumValue:v26];
        LODWORD(v27) = 1125122048;
        [v25 setMaximumValue:v27];
        [(AKFontSizePicker *)self value];
        *(float *)&double v28 = v28;
        [v25 setValue:v28];
        [v25 addTarget:self action:sel__handleValueChanged_ forControlEvents:4096];
        [v25 addTarget:self action:sel__sliderTouchUp_ forControlEvents:64];
        [v25 addTarget:self action:sel__sliderTouchUp_ forControlEvents:128];
        [v25 addTarget:self action:sel__sliderTouchUp_ forControlEvents:256];
        [v25 addTarget:self action:sel__sliderTouchDown_ forControlEvents:1];
        [(AKFontSizePicker *)self setSlider:v25];
        v29 = [MEMORY[0x263F1C488] buttonWithType:1];
        v30 = [MEMORY[0x263F1C550] labelColor];
        [v29 setTintColor:v30];

        [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v29 setImage:firstValuea forState:0];
        v66 = v29;
        [v29 addTarget:self action:sel__decreaseSize_ forControlEvents:64];
        v31 = [MEMORY[0x263F1C488] buttonWithType:1];
        v32 = [MEMORY[0x263F1C550] labelColor];
        [v31 setTintColor:v32];

        [v31 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v31 setImage:v67 forState:0];
        v65 = v31;
        [v31 addTarget:self action:sel__increaseSize_ forControlEvents:64];
        id v33 = objc_alloc_init(MEMORY[0x263F1C9B8]);
        [v33 setTranslatesAutoresizingMaskIntoConstraints:0];
        [(AKFontSizePicker *)self addSubview:v33];
        [v33 addArrangedSubview:v29];
        [v33 addArrangedSubview:v25];
        [v33 addArrangedSubview:v31];
        [v33 setSpacing:10.0];
        [v33 setAxis:0];
        [v33 setAlignment:3];
        v59 = (void *)MEMORY[0x263F08938];
        v64 = [v33 topAnchor];
        v63 = [(AKFontSizePicker *)self topAnchor];
        v62 = [v64 constraintEqualToAnchor:v63];
        v70[0] = v62;
        v61 = [v33 bottomAnchor];
        v60 = [(AKFontSizePicker *)self bottomAnchor];
        v34 = [v61 constraintEqualToAnchor:v60];
        v70[1] = v34;
        v35 = [v33 trailingAnchor];
        v36 = [(AKFontSizePicker *)self trailingAnchor];
        v37 = [v35 constraintEqualToAnchor:v36 constant:-10.0];
        v70[2] = v37;
        v38 = [v33 leadingAnchor];
        v39 = [(AKFontSizePicker *)self leadingAnchor];
        v40 = [v38 constraintEqualToAnchor:v39 constant:10.0];
        v70[3] = v40;
        v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:4];
        [v59 activateConstraints:v41];

        return;
      case 2:
        id firstValue = (id)objc_opt_new();
        [firstValue setScrollDirection:1];
        [firstValue setMinimumInteritemSpacing:0.0];
        [firstValue setMinimumLineSpacing:0.0];
        [(AKFontSizePicker *)self _itemSizeInContainer];
        objc_msgSend(firstValue, "setItemSize:");
        id v42 = objc_alloc(MEMORY[0x263F1C4E0]);
        [(AKFontSizePicker *)self bounds];
        v43 = objc_msgSend(v42, "initWithFrame:collectionViewLayout:", firstValue);
        [(AKFontSizePicker *)self setSizeList:v43];

        v44 = [(AKFontSizePicker *)self sizeList];
        [v44 setTranslatesAutoresizingMaskIntoConstraints:0];

        v45 = [(AKFontSizePicker *)self sizeList];
        [v45 setDelegate:self];

        v46 = [(AKFontSizePicker *)self sizeList];
        [v46 setDataSource:self];

        v47 = [(AKFontSizePicker *)self sizeList];
        [v47 setPagingEnabled:1];

        v48 = [(AKFontSizePicker *)self sizeList];
        [v48 setShowsHorizontalScrollIndicator:0];

        v49 = [(AKFontSizePicker *)self sizeList];
        [v49 setShowsVerticalScrollIndicator:0];

        v50 = [MEMORY[0x263F1C550] clearColor];
        v51 = [(AKFontSizePicker *)self sizeList];
        [v51 setBackgroundColor:v50];

        v52 = [(AKFontSizePicker *)self sizeList];
        [v52 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"AnnotationKit.fontSizePickerIdentifier"];

        v53 = [(AKFontSizePicker *)self sizeList];
        [(AKFontSizePicker *)self addSubview:v53];

        v54 = _NSDictionaryOfVariableBindings(&cfstr_Sizelist.isa, self->_sizeList, 0);
        v55 = (void *)MEMORY[0x263F08938];
        v56 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[_sizeList]|" options:0 metrics:0 views:v54];
        [v55 activateConstraints:v56];

        v57 = (void *)MEMORY[0x263F08938];
        v58 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[_sizeList]|" options:0 metrics:0 views:v54];
        [v57 activateConstraints:v58];

        break;
      case 1:
        id v8 = objc_alloc(MEMORY[0x263F1C768]);
        double v9 = *MEMORY[0x263F001A8];
        double v10 = *(double *)(MEMORY[0x263F001A8] + 8);
        double v11 = *(double *)(MEMORY[0x263F001A8] + 16);
        double v12 = *(double *)(MEMORY[0x263F001A8] + 24);
        id firstValue = (id)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x263F001A8], v10, v11, v12);
        [firstValue setTranslatesAutoresizingMaskIntoConstraints:0];
        [firstValue setUserInteractionEnabled:0];
        v13 = +[AKTextAttributesViewController fontSizeNumberFormatter];
        v14 = NSNumber;
        [(AKFontSizePicker *)self value];
        v15 = objc_msgSend(v14, "numberWithDouble:");
        v16 = [v13 stringFromNumber:v15];
        [firstValue setText:v16];

        [(AKFontSizePicker *)self setLabel:firstValue];
        v17 = objc_msgSend(objc_alloc(MEMORY[0x263F1C9E0]), "initWithFrame:", v9, v10, v11, v12);
        [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v17 setMinimumValue:4.0];
        [v17 setMaximumValue:200.0];
        [(AKFontSizePicker *)self value];
        objc_msgSend(v17, "setValue:");
        [v17 addTarget:self action:sel__handleValueChanged_ forControlEvents:4096];
        [(AKFontSizePicker *)self setStepper:v17];
        [(AKFontSizePicker *)self addSubview:firstValue];
        [(AKFontSizePicker *)self addSubview:v17];
        v18 = _NSDictionaryOfVariableBindings(&cfstr_LabelStepper.isa, firstValue, v17, 0);
        v19 = (void *)MEMORY[0x263F08938];
        v20 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[label]|" options:0 metrics:0 views:v18];
        [v19 activateConstraints:v20];

        v21 = [MEMORY[0x263F08938] constraintWithItem:v17 attribute:10 relatedBy:0 toItem:firstValue attribute:10 multiplier:1.0 constant:0.0];
        [v21 setActive:1];

        v22 = (void *)MEMORY[0x263F08938];
        v23 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-(16)-[label]-(8)-[stepper]-(16)-|" options:0 metrics:0 views:v18];
        [v22 activateConstraints:v23];

        break;
      default:
        return;
    }
  }
}

- (void)setValue:(double)a3
{
  if (self->_value != a3)
  {
    self->_double value = a3;
    v4 = +[AKTextAttributesViewController fontSizeNumberFormatter];
    v5 = [NSNumber numberWithDouble:self->_value];
    id v11 = [v4 stringFromNumber:v5];

    v6 = [(AKFontSizePicker *)self label];
    [v6 setText:v11];

    double value = self->_value;
    id v8 = [(AKFontSizePicker *)self stepper];
    [v8 setValue:value];

    *(float *)&double value = self->_value;
    double v9 = [(AKFontSizePicker *)self slider];
    LODWORD(v10) = LODWORD(value);
    [v9 setValue:v10];

    [(AKFontSizePicker *)self _selectSizeInList];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(AKFontSizePicker *)self style] != 1)
  {
    v20.receiver = self;
    v20.super_class = (Class)AKFontSizePicker;
    uint64_t v17 = -[AKFontSizePicker hitTest:withEvent:](&v20, sel_hitTest_withEvent_, v7, x, y);
    goto LABEL_5;
  }
  id v8 = [(AKFontSizePicker *)self stepper];
  [v8 frame];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v23.origin.double x = v10;
  v23.origin.double y = v12;
  v23.size.width = v14;
  v23.size.height = v16;
  v22.double x = x;
  v22.double y = y;
  if (CGRectContainsPoint(v23, v22))
  {
    uint64_t v17 = [(AKFontSizePicker *)self stepper];
LABEL_5:
    v18 = (void *)v17;
    goto LABEL_7;
  }
  v18 = 0;
LABEL_7:

  return v18;
}

- (void)_handleValueChanged:(id)a3
{
  [a3 value];
  [(AKFontSizePicker *)self setValue:v4];

  [(AKFontSizePicker *)self sendActionsForControlEvents:4096];
}

- (void)_sliderTouchDown:(id)a3
{
  float v4 = [(AKFontSizePicker *)self willBeginTrackingUpdates];

  if (v4)
  {
    v5 = [(AKFontSizePicker *)self willBeginTrackingUpdates];
    v5[2]();
  }
}

- (void)_sliderTouchUp:(id)a3
{
  float v4 = [(AKFontSizePicker *)self didEndTrackingUpdates];

  if (v4)
  {
    v5 = [(AKFontSizePicker *)self didEndTrackingUpdates];
    v5[2]();
  }
}

- (void)_decreaseSize:(id)a3
{
  [(AKFontSizePicker *)self value];
  double v5 = fmax(v4 + -1.0, 4.0);
  [(AKFontSizePicker *)self value];
  if (v5 != v6)
  {
    [(AKFontSizePicker *)self setValue:v5];
    [(AKFontSizePicker *)self sendActionsForControlEvents:4096];
  }
}

- (void)_increaseSize:(id)a3
{
  [(AKFontSizePicker *)self value];
  double v5 = v4 + 1.0;
  if (v5 <= 200.0) {
    double v6 = v5;
  }
  else {
    double v6 = 200.0;
  }
  [(AKFontSizePicker *)self value];
  if (v6 != v7)
  {
    [(AKFontSizePicker *)self setValue:v6];
    [(AKFontSizePicker *)self sendActionsForControlEvents:4096];
  }
}

- (CGSize)_itemSizeInContainer
{
  v3 = [(AKFontSizePicker *)self sizeListValues];
  double v4 = [v3 objectAtIndexedSubscript:0];
  unint64_t v5 = [v4 count];

  [(AKFontSizePicker *)self frame];
  CGFloat v6 = (CGRectGetWidth(v10) + (double)v5 * -30.0) / (double)v5 + 30.0;
  [(AKFontSizePicker *)self frame];
  double Height = CGRectGetHeight(v11);
  double v8 = v6;
  result.height = Height;
  result.width = v8;
  return result;
}

- (void)_selectSizeInList
{
  v3 = [(AKFontSizePicker *)self sizeList];

  if (v3)
  {
    double v4 = [(AKFontSizePicker *)self sizeListValues];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      unint64_t v6 = 0;
      do
      {
        double v7 = [(AKFontSizePicker *)self sizeListValues];
        double v8 = [v7 objectAtIndexedSubscript:v6];

        double v9 = NSNumber;
        [(AKFontSizePicker *)self value];
        CGRect v10 = objc_msgSend(v9, "numberWithDouble:");
        uint64_t v11 = [v8 indexOfObject:v10];

        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        {
          CGFloat v12 = [MEMORY[0x263F088C8] indexPathForRow:v11 inSection:v6];
          double v13 = [(AKFontSizePicker *)self sizeList];
          [v13 selectItemAtIndexPath:v12 animated:1 scrollPosition:0];
        }
        ++v6;
        CGFloat v14 = [(AKFontSizePicker *)self sizeListValues];
        unint64_t v15 = [v14 count];
      }
      while (v6 < v15);
    }
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [(AKFontSizePicker *)self sizeListValues];
  double v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  uint64_t v8 = [v5 row];

  double v9 = [v7 objectAtIndexedSubscript:v8];
  [v9 doubleValue];
  -[AKFontSizePicker setValue:](self, "setValue:");

  [(AKFontSizePicker *)self sendActionsForControlEvents:4096];
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v7 = [a3 cellForItemAtIndexPath:a4];
  double v4 = [v7 contentView];
  id v5 = [v4 viewWithTag:1001];

  [v5 setHighlighted:0];
  unint64_t v6 = [MEMORY[0x263F1C550] blackColor];
  [v5 setTextColor:v6];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  v3 = [(AKFontSizePicker *)self sizeListValues];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = [(AKFontSizePicker *)self sizeListValues];
  unint64_t v6 = [v5 objectAtIndexedSubscript:a4];
  int64_t v7 = [v6 count];

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  int64_t v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"AnnotationKit.fontSizePickerIdentifier" forIndexPath:v6];
  uint64_t v8 = [(AKFontSizePicker *)self sizeListValues];
  double v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  uint64_t v10 = [v6 row];

  uint64_t v11 = [v9 objectAtIndexedSubscript:v10];

  CGFloat v12 = [v7 contentView];
  double v13 = [v12 viewWithTag:1001];

  if (!v13)
  {
    id v14 = objc_alloc(MEMORY[0x263F1CB60]);
    [v7 bounds];
    unint64_t v15 = objc_msgSend(v14, "initWithFrame:");
    CGFloat v16 = [(AKFontSizePicker *)self tintColor];
    [v15 setBackgroundColor:v16];

    [v7 setSelectedBackgroundView:v15];
    id v17 = objc_alloc(MEMORY[0x263F1C768]);
    double v13 = objc_msgSend(v17, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v13 setTextAlignment:1];
    [v13 setUserInteractionEnabled:0];
    [v13 setTag:1001];
    v18 = [MEMORY[0x263F1C550] whiteColor];
    [v13 setHighlightedTextColor:v18];

    v19 = [v7 contentView];
    [v19 addSubview:v13];
  }
  objc_super v20 = [NSString stringWithFormat:@"%@", v11];
  [v13 setText:v20];

  v21 = _NSDictionaryOfVariableBindings(&cfstr_Label_0.isa, v13, 0);
  CGPoint v22 = (void *)MEMORY[0x263F08938];
  CGRect v23 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[label]|" options:0 metrics:0 views:v21];
  [v22 activateConstraints:v23];

  id v24 = (void *)MEMORY[0x263F08938];
  v25 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[label]|" options:0 metrics:0 views:v21];
  [v24 activateConstraints:v25];

  return v7;
}

- (double)value
{
  return self->_value;
}

- (id)willBeginTrackingUpdates
{
  return self->_willBeginTrackingUpdates;
}

- (void)setWillBeginTrackingUpdates:(id)a3
{
}

- (id)didEndTrackingUpdates
{
  return self->_didEndTrackingUpdates;
}

- (void)setDidEndTrackingUpdates:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (UIStepper)stepper
{
  return self->_stepper;
}

- (void)setStepper:(id)a3
{
}

- (UISlider)slider
{
  return self->_slider;
}

- (void)setSlider:(id)a3
{
}

- (UICollectionView)sizeList
{
  return self->_sizeList;
}

- (void)setSizeList:(id)a3
{
}

- (NSArray)sizeListValues
{
  return self->_sizeListValues;
}

- (void)setSizeListValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeListValues, 0);
  objc_storeStrong((id *)&self->_sizeList, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->_stepper, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_didEndTrackingUpdates, 0);

  objc_storeStrong(&self->_willBeginTrackingUpdates, 0);
}

@end