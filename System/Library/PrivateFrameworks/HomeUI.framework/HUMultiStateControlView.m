@interface HUMultiStateControlView
+ (Class)valueClass;
- (BOOL)isDisabled;
- (CGSize)intrinsicContentSize;
- (HUControlViewDelegate)delegate;
- (HUMultiStateControlView)initWithFrame:(CGRect)a3;
- (NSArray)possibleValues;
- (NSString)identifier;
- (UISegmentedControl)segmentedControl;
- (id)value;
- (void)_selectedIndexChanged:(id)a3;
- (void)addPossibleValue:(id)a3 withImage:(id)a4;
- (void)addPossibleValue:(id)a3 withTitle:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation HUMultiStateControlView

- (HUMultiStateControlView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)HUMultiStateControlView;
  v7 = -[HUMultiStateControlView initWithFrame:](&v13, sel_initWithFrame_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42DD0]), "initWithFrame:", x, y, width, height);
    segmentedControl = v7->_segmentedControl;
    v7->_segmentedControl = (UISegmentedControl *)v8;

    [(UISegmentedControl *)v7->_segmentedControl setAutoresizingMask:18];
    [(UISegmentedControl *)v7->_segmentedControl addTarget:v7 action:sel__selectedIndexChanged_ forControlEvents:4096];
    [(HUMultiStateControlView *)v7 addSubview:v7->_segmentedControl];
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    possibleValues = v7->_possibleValues;
    v7->_possibleValues = (NSMutableArray *)v10;
  }
  return v7;
}

- (CGSize)intrinsicContentSize
{
  v2 = [(HUMultiStateControlView *)self segmentedControl];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)addPossibleValue:(id)a3 withTitle:(id)a4
{
  id v6 = a4;
  id v9 = a3;
  double v7 = [(HUMultiStateControlView *)self segmentedControl];
  double v8 = [(HUMultiStateControlView *)self possibleValues];
  objc_msgSend(v7, "insertSegmentWithTitle:atIndex:animated:", v6, objc_msgSend(v8, "count"), 0);

  [(NSMutableArray *)self->_possibleValues addObject:v9];
}

- (void)addPossibleValue:(id)a3 withImage:(id)a4
{
  id v6 = a4;
  id v9 = a3;
  double v7 = [(HUMultiStateControlView *)self segmentedControl];
  double v8 = [(HUMultiStateControlView *)self possibleValues];
  objc_msgSend(v7, "insertSegmentWithImage:atIndex:animated:", v6, objc_msgSend(v8, "count"), 0);

  [(NSMutableArray *)self->_possibleValues addObject:v9];
}

- (void)_selectedIndexChanged:(id)a3
{
  double v4 = [(HUMultiStateControlView *)self delegate];
  [v4 controlViewDidBeginUserInteraction:self];

  double v5 = [(HUMultiStateControlView *)self delegate];
  id v6 = [(HUMultiStateControlView *)self value];
  [v5 controlView:self valueDidChange:v6];

  id v7 = [(HUMultiStateControlView *)self delegate];
  [v7 controlViewDidEndUserInteraction:self];
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)value
{
  double v3 = [(HUMultiStateControlView *)self segmentedControl];
  uint64_t v4 = [v3 selectedSegmentIndex];

  if (v4 == -1)
  {
    id v6 = 0;
  }
  else
  {
    double v5 = [(HUMultiStateControlView *)self possibleValues];
    id v6 = [v5 objectAtIndexedSubscript:v4];
  }

  return v6;
}

- (void)setValue:(id)a3
{
  id v10 = a3;
  if (v10)
  {
    uint64_t v4 = [(HUMultiStateControlView *)self possibleValues];
    uint64_t v5 = [v4 indexOfObject:v10];

    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = [(HUMultiStateControlView *)self possibleValues];
      NSLog(&cfstr_DesiredValueIs.isa, v10, v6);
    }
    id v7 = [(HUMultiStateControlView *)self segmentedControl];
    double v8 = v7;
    uint64_t v9 = v5;
  }
  else
  {
    id v7 = [(HUMultiStateControlView *)self segmentedControl];
    double v8 = v7;
    uint64_t v9 = -1;
  }
  [v7 setSelectedSegmentIndex:v9];
}

- (BOOL)isDisabled
{
  v2 = [(HUMultiStateControlView *)self segmentedControl];
  char v3 = [v2 isEnabled] ^ 1;

  return v3;
}

- (void)setDisabled:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = [(HUMultiStateControlView *)self segmentedControl];
  [v4 setEnabled:v3];
}

- (HUControlViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUControlViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSArray)possibleValues
{
  return &self->_possibleValues->super;
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_possibleValues, 0);
}

@end