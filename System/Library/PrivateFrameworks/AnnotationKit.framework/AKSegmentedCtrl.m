@interface AKSegmentedCtrl
- (AKSegmentedCtrl)initWithFrame:(CGRect)a3;
- (AKSegmentedCtrl)initWithImages:(id)a3;
- (BOOL)isEnabledForSegment:(unint64_t)a3;
- (BOOL)isSelectedForSegment:(unint64_t)a3;
- (NSArray)buttons;
- (NSArray)images;
- (NSMutableOrderedSet)selectionStack;
- (id)segmentAtIndex:(unint64_t)a3;
- (id)segmentForTag:(int64_t)a3;
- (int64_t)tagForSegment:(unint64_t)a3;
- (unint64_t)segmentCount;
- (unint64_t)selectedSegment;
- (unint64_t)selectionType;
- (void)_buttonTapped:(id)a3;
- (void)_commonInit;
- (void)_configureForNewImages;
- (void)_setSelected:(BOOL)a3 forSegment:(unint64_t)a4;
- (void)deselectAllSegments;
- (void)selectSegmentWithTag:(int64_t)a3;
- (void)setButtons:(id)a3;
- (void)setEnabled:(BOOL)a3 forSegment:(unint64_t)a4;
- (void)setImages:(id)a3;
- (void)setSelected:(BOOL)a3 forSegment:(unint64_t)a4;
- (void)setSelectedSegment:(unint64_t)a3;
- (void)setSelectionStack:(id)a3;
- (void)setSelectionType:(unint64_t)a3;
- (void)setTag:(int64_t)a3 forSegment:(unint64_t)a4;
@end

@implementation AKSegmentedCtrl

- (AKSegmentedCtrl)initWithImages:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKSegmentedCtrl;
  v5 = -[AKSegmentedCtrl initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    images = v5->_images;
    v5->_images = (NSArray *)v6;

    [(AKSegmentedCtrl *)v5 _commonInit];
  }

  return v5;
}

- (AKSegmentedCtrl)initWithFrame:(CGRect)a3
{
  return -[AKSegmentedCtrl initWithImages:](self, "initWithImages:", MEMORY[0x263EFFA68], a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_commonInit
{
  v3 = [MEMORY[0x263EFF8C0] array];
  buttons = self->_buttons;
  self->_buttons = v3;

  self->_selectedSegment = 0x7FFFFFFFFFFFFFFFLL;

  MEMORY[0x270F9A6D0](self, sel__configureForNewImages);
}

- (void)_configureForNewImages
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  [(AKSegmentedCtrl *)self setSelectedSegment:0x7FFFFFFFFFFFFFFFLL];
  buttons = self->_buttons;
  uint64_t v47 = 480;
  self->_buttons = 0;

  id v4 = [(AKSegmentedCtrl *)self subviews];
  [v4 makeObjectsPerformSelector:sel_removeFromSuperview];

  v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](self->_images, "count"));
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  obj = self->_images;
  uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v54;
    double v9 = *MEMORY[0x263F001A8];
    double v10 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v11 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v12 = *(double *)(MEMORY[0x263F001A8] + 24);
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v54 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v53 + 1) + 8 * i);
        v15 = -[AKToggleButton initWithFrame:templateImage:autoUpdatesColor:]([AKToggleButton alloc], "initWithFrame:templateImage:autoUpdatesColor:", v14, 1, v9, v10, v11, v12);
        [(AKToggleButton *)v15 setTranslatesAutoresizingMaskIntoConstraints:0];
        [(AKToggleButton *)v15 setShouldTintNormalImage:1];
        v16 = [(AKToggleButton *)v15 layer];
        [v16 setCornerRadius:3.0];

        v17 = [(AKToggleButton *)v15 widthAnchor];
        v18 = [v17 constraintEqualToConstant:29.0];
        [v18 setActive:1];

        v19 = [(AKToggleButton *)v15 heightAnchor];
        v20 = [v19 constraintEqualToConstant:29.0];
        [v20 setActive:1];

        [(AKToggleButton *)v15 setImage:v14 forState:0];
        [(AKToggleButton *)v15 addTarget:self action:sel__buttonTapped_ forControlEvents:64];
        [v5 addObject:v15];
      }
      uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v7);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v21 = v5;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    v24 = 0;
    uint64_t v25 = *(void *)v50;
    double v26 = *MEMORY[0x263F001A8];
    double v27 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v28 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v29 = *(double *)(MEMORY[0x263F001A8] + 24);
    do
    {
      uint64_t v30 = 0;
      v31 = v24;
      do
      {
        if (*(void *)v50 != v25) {
          objc_enumerationMutation(v21);
        }
        v32 = *(void **)(*((void *)&v49 + 1) + 8 * v30);
        v24 = (AKSegmentedCtrl *)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v26, v27, v28, v29);
        [(AKSegmentedCtrl *)v24 setTranslatesAutoresizingMaskIntoConstraints:0];
        [(AKSegmentedCtrl *)self addSubview:v24];
        if (v31)
        {
          double v33 = 0.0;
          v34 = v24;
          v35 = v31;
          uint64_t v36 = 2;
        }
        else
        {
          double v33 = -10.0;
          v34 = v24;
          v35 = self;
          uint64_t v36 = 1;
        }
        v37 = objc_msgSend(MEMORY[0x263F08938], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v34, 1, 0, v35, v36, 1.0, v33, v47);
        [v37 setActive:1];

        v38 = [v21 lastObject];

        if (v32 == v38)
        {
          v39 = [MEMORY[0x263F08938] constraintWithItem:v24 attribute:2 relatedBy:0 toItem:self attribute:2 multiplier:1.0 constant:10.0];
          [v39 setActive:1];
        }
        v40 = [MEMORY[0x263F08938] constraintWithItem:v24 attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:0.0];
        [v40 setActive:1];

        v41 = [MEMORY[0x263F08938] constraintWithItem:v24 attribute:4 relatedBy:0 toItem:self attribute:4 multiplier:1.0 constant:0.0];
        [v41 setActive:1];

        if (v31)
        {
          v42 = [MEMORY[0x263F08938] constraintWithItem:v24 attribute:7 relatedBy:0 toItem:v31 attribute:7 multiplier:1.0 constant:0.0];
          [v42 setActive:1];
        }
        [(AKSegmentedCtrl *)v24 addSubview:v32];
        v43 = [MEMORY[0x263F08938] constraintWithItem:v32 attribute:9 relatedBy:0 toItem:v24 attribute:9 multiplier:1.0 constant:0.0];
        [v43 setActive:1];

        v44 = [MEMORY[0x263F08938] constraintWithItem:v32 attribute:10 relatedBy:0 toItem:v24 attribute:10 multiplier:1.0 constant:0.0];
        [v44 setActive:1];

        ++v30;
        v31 = v24;
      }
      while (v23 != v30);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v49 objects:v57 count:16];
    }
    while (v23);
  }
  v45 = (objc_class *)[v21 copy];
  v46 = *(Class *)((char *)&self->super.super.super.super.isa + v47);
  *(Class *)((char *)&self->super.super.super.super.isa + v47) = v45;
}

- (void)_buttonTapped:(id)a3
{
  id v6 = a3;
  id v4 = [(AKSegmentedCtrl *)self buttons];
  uint64_t v5 = [v4 indexOfObject:v6];

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[AKSegmentedCtrl _setSelected:forSegment:](self, "_setSelected:forSegment:", [v6 isSelected], v5);
    [(AKSegmentedCtrl *)self sendActionsForControlEvents:4096];
  }
}

- (void)_setSelected:(BOOL)a3 forSegment:(unint64_t)a4
{
  BOOL v4 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = [(AKSegmentedCtrl *)self segmentAtIndex:a4];
  if ([v6 isSelected] != v4) {
    [v6 setSelected:v4];
  }
  if (![(AKSegmentedCtrl *)self selectionType])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = self->_buttons;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (v13 != v6
            && objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "isSelected", (void)v14))
          {
            [v13 setSelected:0];
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }

    if (-[NSMutableOrderedSet count](self->_selectionStack, "count") == 1 && ([v6 isSelected] & 1) == 0) {
      [v6 setSelected:1];
    }
    buttons = self->_buttons;
    goto LABEL_20;
  }
  if ([(AKSegmentedCtrl *)self selectionType] == 1)
  {
    buttons = self->_buttons;
LABEL_20:
    -[AKSegmentedCtrl setSelectedSegment:](self, "setSelectedSegment:", -[NSArray indexOfObject:](buttons, "indexOfObject:", v6, (void)v14));
  }
}

- (void)setSelected:(BOOL)a3 forSegment:(unint64_t)a4
{
  BOOL v5 = a3;
  uint64_t v7 = [(AKSegmentedCtrl *)self buttons];
  unint64_t v8 = [v7 count];

  if (v8 <= a4)
  {
    NSLog(&cfstr_SegmentIndexLu.isa, a4);
  }
  else
  {
    id v9 = [(AKSegmentedCtrl *)self segmentAtIndex:a4];
    if ([v9 isSelected] != v5) {
      [(AKSegmentedCtrl *)self _setSelected:v5 forSegment:a4];
    }
  }
}

- (BOOL)isSelectedForSegment:(unint64_t)a3
{
  BOOL v5 = [(AKSegmentedCtrl *)self buttons];
  unint64_t v6 = [v5 count];

  if (v6 <= a3) {
    return 0;
  }
  uint64_t v7 = [(AKSegmentedCtrl *)self segmentAtIndex:a3];
  char v8 = [v7 isSelected];

  return v8;
}

- (void)selectSegmentWithTag:(int64_t)a3
{
  id v5 = [(AKSegmentedCtrl *)self segmentForTag:a3];
  NSUInteger v4 = [(NSArray *)self->_buttons indexOfObject:v5];
  if (([v5 isSelected] & 1) == 0) {
    [(AKSegmentedCtrl *)self _setSelected:1 forSegment:v4];
  }
}

- (void)deselectAllSegments
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(AKSegmentedCtrl *)self selectionType] == 1)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v3 = [(AKSegmentedCtrl *)self buttons];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          char v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          if ([v8 isSelected]) {
            [(AKSegmentedCtrl *)self _setSelected:0 forSegment:[(NSArray *)self->_buttons indexOfObject:v8]];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
}

- (void)setEnabled:(BOOL)a3 forSegment:(unint64_t)a4
{
  BOOL v4 = a3;
  id v5 = [(AKSegmentedCtrl *)self segmentAtIndex:a4];
  [v5 setEnabled:v4];
}

- (BOOL)isEnabledForSegment:(unint64_t)a3
{
  v3 = [(AKSegmentedCtrl *)self segmentAtIndex:a3];
  char v4 = [v3 isEnabled];

  return v4;
}

- (id)segmentAtIndex:(unint64_t)a3
{
  id v5 = [(AKSegmentedCtrl *)self buttons];
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    char v8 = 0;
  }
  else
  {
    uint64_t v7 = [(AKSegmentedCtrl *)self buttons];
    char v8 = [v7 objectAtIndexedSubscript:a3];
  }

  return v8;
}

- (void)setTag:(int64_t)a3 forSegment:(unint64_t)a4
{
  id v5 = [(AKSegmentedCtrl *)self segmentAtIndex:a4];
  [v5 setTag:a3];
}

- (int64_t)tagForSegment:(unint64_t)a3
{
  v3 = [(AKSegmentedCtrl *)self segmentAtIndex:a3];
  int64_t v4 = [v3 tag];

  return v4;
}

- (id)segmentForTag:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int64_t v4 = self->_buttons;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "tag", (void)v13) == a3)
        {
          id v11 = v10;

          uint64_t v7 = v11;
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)segmentCount
{
  v2 = [(AKSegmentedCtrl *)self buttons];
  unint64_t v3 = [v2 count];

  return v3;
}

- (unint64_t)selectionType
{
  return self->_selectionType;
}

- (void)setSelectionType:(unint64_t)a3
{
  self->_selectionType = a3;
}

- (unint64_t)selectedSegment
{
  return self->_selectedSegment;
}

- (void)setSelectedSegment:(unint64_t)a3
{
  self->_selectedSegment = a3;
}

- (NSArray)images
{
  return self->_images;
}

- (void)setImages:(id)a3
{
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
}

- (NSMutableOrderedSet)selectionStack
{
  return self->_selectionStack;
}

- (void)setSelectionStack:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionStack, 0);
  objc_storeStrong((id *)&self->_buttons, 0);

  objc_storeStrong((id *)&self->_images, 0);
}

@end