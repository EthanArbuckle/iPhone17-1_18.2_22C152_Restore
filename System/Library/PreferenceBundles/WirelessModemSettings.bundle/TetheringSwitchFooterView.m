@interface TetheringSwitchFooterView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3 inTableView:(id)a4 shouldSetSize:(BOOL)a5;
- (TetheringSwitchFooterView)initWithSpecifier:(id)a3;
- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4;
- (void)layoutSubviews;
- (void)setText:(id)a3;
@end

@implementation TetheringSwitchFooterView

- (TetheringSwitchFooterView)initWithSpecifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TetheringSwitchFooterView;
  v5 = [(TetheringSwitchFooterView *)&v11 init];
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    labels = v5->_labels;
    v5->_labels = v6;

    v8 = [MEMORY[0x263F825C8] clearColor];
    [(TetheringSwitchFooterView *)v5 setBackgroundColor:v8];

    v9 = [v4 propertyForKey:@"TextFooterInitialText"];
    [(TetheringSwitchFooterView *)v5 setText:v9];
  }
  return v5;
}

- (void)setText:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v5 = [(TetheringSwitchFooterView *)self subviews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * v9++) removeFromSuperview];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }

  [(NSMutableArray *)self->_labels removeAllObjects];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v19 = v4;
  id obj = [v4 componentsSeparatedByString:@"\n"];
  uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * v13);
        id v15 = objc_alloc_init(MEMORY[0x263F828E0]);
        v16 = PreferencesTableViewFooterColor();
        [v15 setTextColor:v16];

        v17 = [MEMORY[0x263F825C8] clearColor];
        [v15 setBackgroundColor:v17];

        [v15 setLineBreakMode:0];
        v18 = PreferencesTableViewFooterFont();
        [v15 setFont:v18];

        [v15 setNumberOfLines:0];
        [v15 setText:v14];
        [(NSMutableArray *)self->_labels addObject:v15];
        v21.receiver = self;
        v21.super_class = (Class)TetheringSwitchFooterView;
        [(TetheringSwitchFooterView *)&v21 addSubview:v15];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v11);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3 inTableView:(id)a4 shouldSetSize:(BOOL)a5
{
  BOOL v5 = a5;
  double width = a3.width;
  uint64_t v38 = *MEMORY[0x263EF8340];
  PreferencesTableViewCellLeftPad();
  float v9 = v8;
  PreferencesTableViewCellLeftPad();
  float v11 = v10;
  PreferencesTableViewCellRightPad();
  float v13 = v12;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = self->_labels;
  uint64_t v14 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    double v16 = width - v11 - v13;
    double v17 = v9;
    uint64_t v18 = *(void *)v32;
    uint64_t v19 = *MEMORY[0x263F814F0];
    double v20 = 6.0;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(obj);
        }
        long long v22 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        [v22 frame];
        long long v23 = [v22 text];
        uint64_t v35 = v19;
        long long v24 = [v22 font];
        v36 = v24;
        long long v25 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        objc_msgSend(v23, "boundingRectWithSize:options:attributes:context:", 1, v25, 0, v16, 3.40282347e38);
        double v27 = v26;

        if (v5)
        {
          v40.origin.x = v17;
          v40.origin.y = v20;
          v40.size.double width = v16;
          v40.size.height = v27;
          CGRect v41 = CGRectIntegral(v40);
          objc_msgSend(v22, "setFrame:", v41.origin.x, v41.origin.y, v41.size.width, v41.size.height);
        }
        double v20 = v20 + v27 + 6.0;
      }
      uint64_t v15 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v15);
  }
  else
  {
    double v20 = 6.0;
  }

  double v28 = width;
  double v29 = v20;
  result.height = v29;
  result.double width = v28;
  return result;
}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  -[TetheringSwitchFooterView sizeThatFits:inTableView:shouldSetSize:](self, "sizeThatFits:inTableView:shouldSetSize:", a4, 0, a3, 0.0);
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(TetheringSwitchFooterView *)self superview];
  -[TetheringSwitchFooterView sizeThatFits:inTableView:shouldSetSize:](self, "sizeThatFits:inTableView:shouldSetSize:", v6, 0, width, height);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)TetheringSwitchFooterView;
  [(TetheringSwitchFooterView *)&v8 layoutSubviews];
  [(TetheringSwitchFooterView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(TetheringSwitchFooterView *)self superview];
  -[TetheringSwitchFooterView sizeThatFits:inTableView:shouldSetSize:](self, "sizeThatFits:inTableView:shouldSetSize:", v7, 1, v4, v6);
}

- (void).cxx_destruct
{
}

@end