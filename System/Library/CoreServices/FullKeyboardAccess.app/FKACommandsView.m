@interface FKACommandsView
- (FKACommandsView)initWithCommandLists:(id)a3;
- (NSArray)commandLists;
- (id)primaryTextStyle;
- (void)setCommandLists:(id)a3;
@end

@implementation FKACommandsView

- (FKACommandsView)initWithCommandLists:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)FKACommandsView;
  v6 = [(FKACommandsView *)&v28 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_commandLists, a3);
    v8 = +[NSMutableArray array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v23 = v5;
    id v9 = v5;
    id v10 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v13);
          v15 = [FKACommandListView alloc];
          v16 = [(FKACommandsView *)v7 platterBlurEffect];
          v17 = [(FKACommandListView *)v15 initWithCommandList:v14 blurEffect:v16];

          [v8 addObject:v17];
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v11);
    }

    id v18 = [objc_alloc((Class)UIStackView) initWithArrangedSubviews:v8];
    [v18 setAxis:1];
    [v18 setSpacing:0.0];
    [v18 setDistribution:3];
    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = [(FKACommandsView *)v7 contentView];
    [v19 addSubview:v18];

    v20 = [(FKACommandsView *)v7 contentView];
    v21 = +[NSLayoutConstraint ax_constraintsToMakeView:v18 sameDimensionsAsView:v20];
    +[NSLayoutConstraint activateConstraints:v21];

    id v5 = v23;
  }

  return v7;
}

- (id)primaryTextStyle
{
  return UIFontTextStyleSubheadline;
}

- (NSArray)commandLists
{
  return self->_commandLists;
}

- (void)setCommandLists:(id)a3
{
}

- (void).cxx_destruct
{
}

@end