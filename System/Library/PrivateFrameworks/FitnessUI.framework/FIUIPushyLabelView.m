@interface FIUIPushyLabelView
- (CGSize)sizeThatFits:(CGSize)a3;
- (FIUIPushyLabelView)initWithFrame:(CGRect)a3;
- (id)_snapshotCharactersFromAttributedText:(id)a3 perCharacter:(BOOL)a4;
- (id)currentAttributedText;
- (void)_layoutForPushStartWithDirection:(unint64_t)a3;
- (void)_layoutViewsAtIndex:(unint64_t)a3 forPushEndWithDirection:(unint64_t)a4;
- (void)_processPendingStringIfNeeded;
- (void)_setCurrentSnapshotCharacters:(id)a3;
- (void)_setIncomingSnapshotCharacters:(id)a3;
- (void)_swapCurrentSnapshotCharacters:(id)a3 forIncomingCharacters:(id)a4;
- (void)pushToAttributedText:(id)a3 direction:(unint64_t)a4 perCharacter:(BOOL)a5;
- (void)setAttributedTextUnanimated:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)sizeToFitAttributedText:(id)a3;
@end

@implementation FIUIPushyLabelView

- (FIUIPushyLabelView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FIUIPushyLabelView;
  v3 = -[FIUIPushyLabelView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(FIUIPushyLabelView *)v3 setClipsToBounds:1];
    [(FIUIPushyLabelView *)v4 setUserInteractionEnabled:0];
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  p_incomingSnapshotCharacters = &self->_incomingSnapshotCharacters;
  if (![(NSArray *)self->_incomingSnapshotCharacters count]) {
    p_incomingSnapshotCharacters = &self->_currentSnapshotCharacters;
  }
  v5 = (double *)MEMORY[0x263F001B0];
  objc_super v6 = *p_incomingSnapshotCharacters;
  if ([(NSArray *)v6 count])
  {
    v7 = [(NSArray *)v6 firstObject];
    v8 = [v7 renderedView];
    [v8 frame];
    double v10 = v9;
  }
  else
  {
    double v10 = v5[1];
  }
  double v11 = *v5;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v12 = v6;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v16), "renderedView", (void)v21);
        [v17 frame];
        double v11 = v11 + v18;

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  double v19 = v11;
  double v20 = v10;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v27 = *MEMORY[0x263EF8340];
  [(FIUIPushyLabelView *)self frame];
  v31.origin.double x = v8;
  v31.origin.double y = v9;
  v31.size.double width = v10;
  v31.size.double height = v11;
  v28.origin.double x = x;
  v28.origin.double y = y;
  v28.size.double width = width;
  v28.size.double height = height;
  if (!CGRectEqualToRect(v28, v31))
  {
    [(FIUIPushyLabelView *)self frame];
    double v13 = v12;
    v25.receiver = self;
    v25.super_class = (Class)FIUIPushyLabelView;
    -[FIUIPushyLabelView setFrame:](&v25, sel_setFrame_, x, y, width, height);
    if (width != v13)
    {
      if ([(FIUIPushyLabelView *)self _shouldReverseLayoutDirection])
      {
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v14 = [(FIUIPushyLabelView *)self subviews];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v22;
          double v18 = width - v13;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v22 != v17) {
                objc_enumerationMutation(v14);
              }
              double v20 = *(void **)(*((void *)&v21 + 1) + 8 * i);
              [v20 frame];
              CGRect v30 = CGRectOffset(v29, v18, 0.0);
              objc_msgSend(v20, "setFrame:", v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
          }
          while (v16);
        }
      }
    }
  }
}

- (void)sizeToFitAttributedText:(id)a3
{
  id v4 = a3;
  [(FIUIPushyLabelView *)self frame];
  double v6 = v5;
  double v8 = v7;
  [v4 size];
  double v10 = v9;
  double v12 = v11;

  -[FIUIPushyLabelView setFrame:](self, "setFrame:", v6, v8, v10, v12);
}

- (void)setAttributedTextUnanimated:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToAttributedString:self->_currentAttributedText] & 1) == 0)
  {
    double v5 = [(FIUIPushyLabelView *)self _snapshotCharactersFromAttributedText:v6 perCharacter:0];
    [(FIUIPushyLabelView *)self _setIncomingSnapshotCharacters:v5];
    [(FIUIPushyLabelView *)self _layoutViewsAtIndex:0 forPushEndWithDirection:0];
    [(FIUIPushyLabelView *)self _swapCurrentSnapshotCharacters:self->_currentSnapshotCharacters forIncomingCharacters:v5];
    objc_storeStrong((id *)&self->_currentAttributedText, a3);
  }
}

- (void)pushToAttributedText:(id)a3 direction:(unint64_t)a4 perCharacter:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  if (([v9 isEqualToAttributedString:self->_currentAttributedText] & 1) == 0)
  {
    BOOL v10 = v5 & ~[(FIUIPushyLabelView *)self _shouldReverseLayoutDirection];
    double Current = CFAbsoluteTimeGetCurrent();
    if (self->_currentAnimationFinishTime - Current >= 0.0) {
      double v12 = self->_currentAnimationFinishTime - Current;
    }
    else {
      double v12 = 0.0;
    }
    if (v12 <= 0.0)
    {
      id obj = a3;
      uint64_t v14 = self->_currentSnapshotCharacters;
      id v34 = v9;
      uint64_t v15 = [(FIUIPushyLabelView *)self _snapshotCharactersFromAttributedText:v9 perCharacter:v10];
      [(FIUIPushyLabelView *)self _setIncomingSnapshotCharacters:v15];
      [(FIUIPushyLabelView *)self _layoutForPushStartWithDirection:a4];
      double currentAnimationFinishTime = self->_currentAnimationFinishTime;
      if (v10) {
        double v17 = 0.06;
      }
      else {
        double v17 = 0.0;
      }
      unint64_t v18 = [(NSArray *)v14 count];
      unint64_t v19 = [v15 count];
      if (v18 <= v19) {
        unint64_t v20 = v19;
      }
      else {
        unint64_t v20 = v18;
      }
      if (v20)
      {
        unint64_t v21 = 0;
        unint64_t v22 = 0;
        long long v23 = v43;
        unint64_t v35 = v20;
        do
        {
          double v24 = 0.75;
          if (v21 < -[NSArray count](v14, "count") && v21 < [v15 count])
          {
            [(NSArray *)v14 objectAtIndexedSubscript:v21];
            uint64_t v26 = v25 = a4;
            [v26 sourceText];
            v28 = uint64_t v27 = v23;

            CGRect v29 = [v15 objectAtIndexedSubscript:v21];
            CGRect v30 = [v29 sourceText];

            a4 = v25;
            if ([v28 isEqualToAttributedString:v30]) {
              double v24 = 0.0;
            }
            else {
              double v24 = 0.75;
            }

            long long v23 = v27;
            unint64_t v20 = v35;
          }
          double v31 = v12 + v17 * (double)v22;
          if (currentAnimationFinishTime < v31 + Current + v24) {
            double currentAnimationFinishTime = v31 + Current + v24;
          }
          v32 = (void *)MEMORY[0x263F82E00];
          v42[0] = MEMORY[0x263EF8330];
          v42[1] = 3221225472;
          v43[0] = __66__FIUIPushyLabelView_pushToAttributedText_direction_perCharacter___block_invoke;
          v43[1] = &unk_2644A7F58;
          v43[2] = self;
          v43[3] = v21;
          v43[4] = a4;
          v36[0] = MEMORY[0x263EF8330];
          v36[1] = 3221225472;
          v36[2] = __66__FIUIPushyLabelView_pushToAttributedText_direction_perCharacter___block_invoke_2;
          v36[3] = &unk_2644A7F80;
          v37 = v14;
          unint64_t v40 = v21;
          id v38 = v15;
          v39 = self;
          double v41 = v17;
          [v32 animateWithDuration:0x10000 delay:v42 usingSpringWithDamping:v36 initialSpringVelocity:v24 options:v12 + v17 * (double)v22 animations:0.6 completion:-5.0];
          if (v24 > 2.22044605e-16) {
            ++v22;
          }

          ++v21;
        }
        while (v20 != v21);
      }
      self->_double currentAnimationFinishTime = v17 + currentAnimationFinishTime;
      objc_storeStrong((id *)&self->_currentAttributedText, obj);

      id v9 = v34;
    }
    else
    {
      double v13 = v9;
      if (!v9)
      {
        double v13 = [MEMORY[0x263EFF9D0] null];
      }
      objc_storeStrong(&self->_pendingAttributedString, v13);
      if (!v9) {

      }
      self->_pendingDirection = a4;
      self->_pendingPushPerCharacter = v10;
    }
  }
}

uint64_t __66__FIUIPushyLabelView_pushToAttributedText_direction_perCharacter___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutViewsAtIndex:*(void *)(a1 + 40) forPushEndWithDirection:*(void *)(a1 + 48)];
}

void __66__FIUIPushyLabelView_pushToAttributedText_direction_perCharacter___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 56);
    if (v3 == [*(id *)(a1 + 40) count] - 1 || !objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      [*(id *)(a1 + 48) _swapCurrentSnapshotCharacters:*(void *)(a1 + 32) forIncomingCharacters:*(void *)(a1 + 40)];
      id v4 = *(void **)(a1 + 48);
      double v5 = *(double *)(a1 + 64);
      [v4 performSelector:sel__processPendingStringIfNeeded withObject:0 afterDelay:v5];
    }
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "renderedView", (void)v12);
          [v11 removeFromSuperview];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)_processPendingStringIfNeeded
{
  id pendingAttributedString = self->_pendingAttributedString;
  if (pendingAttributedString)
  {
    id v4 = [MEMORY[0x263EFF9D0] null];
    char v5 = [pendingAttributedString isEqual:v4];

    if (v5) {
      id v9 = 0;
    }
    else {
      id v9 = self->_pendingAttributedString;
    }
    unint64_t pendingDirection = self->_pendingDirection;
    BOOL pendingPushPerCharacter = self->_pendingPushPerCharacter;
    id v8 = self->_pendingAttributedString;
    self->_id pendingAttributedString = 0;

    [(FIUIPushyLabelView *)self pushToAttributedText:v9 direction:pendingDirection perCharacter:pendingPushPerCharacter];
  }
}

- (id)currentAttributedText
{
  return self->_currentAttributedText;
}

- (void)_setCurrentSnapshotCharacters:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = self->_currentSnapshotCharacters;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = [*(id *)(*((void *)&v22 + 1) + 8 * v10) renderedView];
        [v11 removeFromSuperview];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v8);
  }

  objc_storeStrong((id *)&self->_currentSnapshotCharacters, a3);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v16), "renderedView", (void)v18);
        [(FIUIPushyLabelView *)self addSubview:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }
}

- (void)_setIncomingSnapshotCharacters:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = self->_incomingSnapshotCharacters;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = [*(id *)(*((void *)&v22 + 1) + 8 * v10) renderedView];
        [v11 removeFromSuperview];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v8);
  }

  objc_storeStrong((id *)&self->_incomingSnapshotCharacters, a3);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v16), "renderedView", (void)v18);
        [(FIUIPushyLabelView *)self addSubview:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }
}

- (void)_swapCurrentSnapshotCharacters:(id)a3 forIncomingCharacters:(id)a4
{
  id v5 = (NSArray *)a4;
  [(FIUIPushyLabelView *)self _setCurrentSnapshotCharacters:0];
  currentSnapshotCharacters = self->_currentSnapshotCharacters;
  self->_currentSnapshotCharacters = v5;
  uint64_t v8 = v5;

  incomingSnapshotCharacters = self->_incomingSnapshotCharacters;
  self->_incomingSnapshotCharacters = 0;
}

- (void)_layoutForPushStartWithDirection:(unint64_t)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = self->_currentSnapshotCharacters;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v28 + 1) + 8 * v9) renderedView];
        [v10 frame];
        objc_msgSend(v10, "setFrame:");

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  double v11 = self->_incomingSnapshotCharacters;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v15), "renderedView", (void)v24);
        [v16 frame];
        double v19 = v18;
        double v21 = v20;
        double v22 = v17;
        if (a3)
        {
          double Height = -v17;
        }
        else
        {
          [(FIUIPushyLabelView *)self bounds];
          double Height = CGRectGetHeight(v35);
        }
        objc_msgSend(v16, "setFrame:", v19, Height, v21, v22);

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v13);
  }
}

- (void)_layoutViewsAtIndex:(unint64_t)a3 forPushEndWithDirection:(unint64_t)a4
{
  if ([(NSArray *)self->_currentSnapshotCharacters count] > a3)
  {
    uint64_t v7 = [(NSArray *)self->_currentSnapshotCharacters objectAtIndexedSubscript:a3];
    uint64_t v8 = [v7 renderedView];
    [v8 frame];
    double v11 = v10;
    double v13 = v12;
    double v14 = v9;
    if (a4)
    {
      [(FIUIPushyLabelView *)self bounds];
      double Height = CGRectGetHeight(v19);
    }
    else
    {
      double Height = -v9;
    }
    objc_msgSend(v8, "setFrame:", v11, Height, v13, v14);
  }
  if ([(NSArray *)self->_incomingSnapshotCharacters count] > a3)
  {
    id v17 = [(NSArray *)self->_incomingSnapshotCharacters objectAtIndexedSubscript:a3];
    uint64_t v16 = [v17 renderedView];
    [v16 frame];
    objc_msgSend(v16, "setFrame:");
  }
}

- (id)_snapshotCharactersFromAttributedText:(id)a3 perCharacter:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v40 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "length"));
  if ([v6 length])
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F816E8]) initWithAttributedString:v6];
    id v8 = objc_alloc_init(MEMORY[0x263F81648]);
    CGRect v35 = v7;
    [v7 addLayoutManager:v8];
    id v9 = objc_alloc(MEMORY[0x263F81680]);
    [v6 size];
    double v10 = objc_msgSend(v9, "initWithSize:");
    [v10 setLineFragmentPadding:0.0];
    v39 = v10;
    [v8 addTextContainer:v10];
    uint64_t v43 = 0;
    uint64_t v44 = 0;
    double scale = FIUIDeviceScale();
    if (v4) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = [v6 length];
    }
    if ([v6 length])
    {
      unint64_t v12 = 0;
      double v14 = *MEMORY[0x263F00148];
      double v13 = *(double *)(MEMORY[0x263F00148] + 8);
      double v41 = scale + scale;
      double v15 = 0.0;
      CGFloat v36 = v13;
      CGFloat v37 = *MEMORY[0x263F00148];
      do
      {
        uint64_t v16 = objc_msgSend(v6, "attributedSubstringFromRange:", v12, v11);
        objc_msgSend(v8, "characterRangeForGlyphRange:actualGlyphRange:", v12, v11, &v43);
        objc_msgSend(v8, "boundingRectForGlyphRange:inTextContainer:", v43, v44, v39);
        double v18 = v17;
        double v20 = v19;
        [v16 size];
        double v23 = v21;
        double v24 = v22;
        if (!v4)
        {
          double v14 = -v18 / v41;
          double v13 = -v20 / v41;
        }
        if (v18 < 0.0)
        {
          double v23 = v21 - v18 / v41;
          double v18 = 0.0;
        }
        double v42 = v13;
        double v25 = v14;
        if (v20 < 0.0)
        {
          double v24 = v22 - v20 / v41;
          double v20 = 0.0;
        }
        if ([(FIUIPushyLabelView *)self _shouldReverseLayoutDirection]
          && !v4)
        {
          [(FIUIPushyLabelView *)self frame];
          double v18 = v26 - v23;
        }
        v46.double width = v23;
        v46.double height = v24;
        UIGraphicsBeginImageContextWithOptions(v46, 0, scale);
        CurrentContext = UIGraphicsGetCurrentContext();
        double v13 = v36;
        double v14 = v37;
        v47.origin.double x = v37;
        v47.origin.double y = v36;
        v47.size.double width = v23;
        v47.size.double height = v24;
        CGContextClearRect(CurrentContext, v47);
        objc_msgSend(v16, "drawAtPoint:", v25, v42);
        long long v28 = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        long long v29 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v28];
        long long v30 = v29;
        if (v4) {
          double v31 = v15;
        }
        else {
          double v31 = v18;
        }
        double v32 = -0.0;
        if (v4) {
          double v32 = v23;
        }
        double v15 = v15 + v32;
        objc_msgSend(v29, "setFrame:", v31, v20, v23, v24);
        v33 = objc_alloc_init(FIUIPushyLabelCharacter);
        [(FIUIPushyLabelCharacter *)v33 setSourceText:v16];
        [(FIUIPushyLabelCharacter *)v33 setRenderedView:v30];
        [v40 addObject:v33];

        v12 += v11;
      }
      while (v12 < [v6 length]);
    }
  }
  return v40;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingAttributedString, 0);
  objc_storeStrong((id *)&self->_currentAttributedText, 0);
  objc_storeStrong((id *)&self->_incomingSnapshotCharacters, 0);
  objc_storeStrong((id *)&self->_currentSnapshotCharacters, 0);
}

@end