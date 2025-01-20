@interface PHStaticDialerPad
- (BOOL)canBecomeFocused;
- (CGSize)intrinsicContentSize;
- (PHStaticDialerPad)initWithDialerType:(int)a3;
- (PHStaticDialerPad)initWithFrame:(CGRect)a3;
- (float)_yFudge;
- (id)_highlightedImage;
- (id)_keypadImage;
- (id)_linearFocusMovementSequences;
- (id)_pressedImage;
- (int)dialerType;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)keyPressed:(id)a3;
- (void)layoutSubviews;
- (void)setDialerType:(int)a3;
@end

@implementation PHStaticDialerPad

- (PHStaticDialerPad)initWithDialerType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)PHStaticDialerPad;
  v4 = -[PHStaticDialerPad initWithFrame:](&v7, "initWithFrame:", 0.0, 0.0, 147.0, 180.0);
  v5 = v4;
  if (v4)
  {
    [(PHStaticDialerPad *)v4 setDialerType:v3];
    *(void *)&v5->TPPhonePad_opaque[OBJC_IVAR___TPPhonePad__topHeight] = 0x4045C00000000000;
    *(void *)&v5->TPPhonePad_opaque[OBJC_IVAR___TPPhonePad__midHeight] = 0x4047800000000000;
    *(void *)&v5->TPPhonePad_opaque[OBJC_IVAR___TPPhonePad__bottomHeight] = 0x4045400000000000;
    *(void *)&v5->TPPhonePad_opaque[OBJC_IVAR___TPPhonePad__leftWidth] = 0x4047600000000000;
    *(void *)&v5->TPPhonePad_opaque[OBJC_IVAR___TPPhonePad__midWidth] = 0x404A800000000000;
    *(void *)&v5->TPPhonePad_opaque[OBJC_IVAR___TPPhonePad__rightWidth] = 0x4047A00000000000;
    [(PHStaticDialerPad *)v5 setOpaque:1];
    -[PHStaticDialerPad setFrame:](v5, "setFrame:", 0.0, 0.0, 147.0, 180.0);
  }
  return v5;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)PHStaticDialerPad;
  [(PHStaticDialerPad *)&v17 layoutSubviews];
  id v3 = objc_alloc_init((Class)NSMutableArray);
  [(PHStaticDialerPad *)self frame];
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  double v7 = v6 * 0.25;
  double v9 = v8 / 3.0;
  do
  {
    uint64_t v10 = 0;
    uint64_t v16 = v5;
    double v11 = v7 * (double)v5;
    do
    {
      v12 = objc_alloc_init(CPKeyView);
      [(CPKeyView *)v12 setKeyIndex:v4 + v10];
      -[CPKeyView setFrame:](v12, "setFrame:", v9 * (double)v10, v11, v9, v7);
      id v13 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"keyPressed:"];
      [v13 setMinimumPressDuration:0.0];
      [v13 setAllowedPressTypes:&off_10028CCE0];
      [(CPKeyView *)v12 addGestureRecognizer:v13];
      [(PHStaticDialerPad *)self addSubview:v12];
      [v3 addObject:v12];

      ++v10;
    }
    while (v10 != 3);
    uint64_t v5 = v16 + 1;
    v4 += 3;
  }
  while (v16 != 3);
  v14 = +[_UIFocusLinearMovementSequence sequenceWithItems:v3 loops:0];
  linearSequence = self->_linearSequence;
  self->_linearSequence = v14;
}

- (void)keyPressed:(id)a3
{
  id v4 = [a3 state];
  if (v4 == (id)4)
  {
    [(PHStaticDialerPad *)self performTapActionCancelForHighlightedKey];
  }
  else if (v4 == (id)3)
  {
    [(PHStaticDialerPad *)self performTapActionEndForHighlightedKey];
  }
  else if (v4 == (id)1)
  {
    [(PHStaticDialerPad *)self performTapActionDownForHighlightedKey];
  }
}

- (PHStaticDialerPad)initWithFrame:(CGRect)a3
{
  return -[PHStaticDialerPad initWithDialerType:](self, "initWithDialerType:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)_pressedImage
{
  if ([(PHStaticDialerPad *)self dialerType] == 1
    || [(PHStaticDialerPad *)self dialerType] == 2)
  {
    id v3 = +[UIImage phCarPlayImageNamed:@"carplay_keypad_highlighted"];
  }
  else
  {
    id v3 = +[UIImage _deviceSpecificImageNamed:@"dialerView-pressed"];
  }

  return v3;
}

- (id)_keypadImage
{
  if ([(PHStaticDialerPad *)self dialerType] == 1
    || [(PHStaticDialerPad *)self dialerType] == 2)
  {
    id v3 = +[UIImage phCarPlayImageNamed:@"carplay_keypad"];
  }
  else
  {
    id v3 = +[UIImage _deviceSpecificImageNamed:@"dialerView-normal"];
  }

  return v3;
}

- (id)_highlightedImage
{
  if ([(PHStaticDialerPad *)self dialerType] == 1
    || [(PHStaticDialerPad *)self dialerType] == 2)
  {
    id v3 = +[UIImage phCarPlayImageNamed:@"carplay_keypad_highlighted"];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (float)_yFudge
{
  return 0.0;
}

- (CGSize)intrinsicContentSize
{
  id v3 = [(PHStaticDialerPad *)self _keypadImage];
  [v3 size];
  double v5 = v4;
  double v6 = [(PHStaticDialerPad *)self _keypadImage];
  [v6 size];
  double v8 = v7;

  double v9 = v5;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(PHStaticDialerPad *)self performTapActionCancelForHighlightedKey];
  v14.receiver = self;
  v14.super_class = (Class)PHStaticDialerPad;
  [(PHStaticDialerPad *)&v14 didUpdateFocusInContext:v6 withAnimationCoordinator:v7];

  uint64_t v8 = [v6 nextFocusedItem];
  if (v8
    && (double v9 = (void *)v8,
        [v6 nextFocusedItem],
        double v10 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v10,
        v9,
        (isKindOfClass & 1) != 0))
  {
    v12 = [v6 nextFocusedItem];
    uint64_t v13 = (uint64_t)[v12 keyIndex];
  }
  else
  {
    uint64_t v13 = -1;
  }
  [(PHStaticDialerPad *)self highlightKeyAtIndex:v13];
}

- (id)_linearFocusMovementSequences
{
  linearSequence = self->_linearSequence;
  v2 = +[NSArray arrayWithObjects:&linearSequence count:1];

  return v2;
}

- (int)dialerType
{
  return self->_dialerType;
}

- (void)setDialerType:(int)a3
{
  self->_dialerType = a3;
}

- (void).cxx_destruct
{
}

@end