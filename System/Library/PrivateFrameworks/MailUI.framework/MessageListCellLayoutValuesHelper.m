@interface MessageListCellLayoutValuesHelper
- (BOOL)inMultiSelectionMode;
- (BOOL)supportsPopover;
- (MessageListCellLayoutValues)defaultLayoutValues;
- (MessageListCellLayoutValues)expandedLayoutValues;
- (MessageListCellLayoutValues)groupedSenderLayoutValues;
- (MessageListCellLayoutValues)topHitsLayoutValues;
- (MessageListCellLayoutValuesHelper)init;
- (NSDirectionalEdgeInsets)systemLayoutMargins;
- (UIBackgroundConfiguration)defaultBackgroundConfiguration;
- (UIColor)tintColor;
- (UITraitCollection)traitCollection;
- (double)dynamicRowHeightWithSummary:(id)a3 bounds:(CGRect)a4;
- (id)layoutValuesForStyle:(int64_t)a3;
- (void)invalidate;
- (void)setDefaultBackgroundConfiguration:(id)a3;
- (void)setDefaultLayoutValues:(id)a3;
- (void)setExpandedLayoutValues:(id)a3;
- (void)setGroupedSenderLayoutValues:(id)a3;
- (void)setInMultiSelectionMode:(BOOL)a3;
- (void)setSupportsPopover:(BOOL)a3;
- (void)setSystemLayoutMargins:(NSDirectionalEdgeInsets)a3;
- (void)setTintColor:(id)a3;
- (void)setTopHitsLayoutValues:(id)a3;
- (void)setTraitCollection:(id)a3;
- (void)updateTintColorFromView:(id)a3;
@end

@implementation MessageListCellLayoutValuesHelper

- (void)updateTintColorFromView:(id)a3
{
  id v4 = [a3 tintColor];
  [(MessageListCellLayoutValuesHelper *)self setTintColor:v4];
}

- (void)setTintColor:(id)a3
{
  v13 = (UIColor *)a3;
  if (pthread_main_np() != 1)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"MessageListCellLayoutValues.m" lineNumber:175 description:@"Current thread must be main"];
  }
  p_tintColor = &self->_tintColor;
  v7 = v13;
  if (self->_tintColor != v13)
  {
    objc_storeStrong((id *)p_tintColor, a3);
    v8 = [(MessageListCellLayoutValuesHelper *)self defaultLayoutValues];
    [v8 setTintColor:v13];

    v9 = [(MessageListCellLayoutValuesHelper *)self expandedLayoutValues];
    [v9 setTintColor:v13];

    v10 = [(MessageListCellLayoutValuesHelper *)self topHitsLayoutValues];
    [v10 setTintColor:v13];

    v11 = [(MessageListCellLayoutValuesHelper *)self groupedSenderLayoutValues];
    [v11 setTintColor:v13];

    v7 = v13;
  }
  MEMORY[0x1F41817F8](p_tintColor, v7);
}

- (void)setSystemLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  double trailing = a3.trailing;
  double bottom = a3.bottom;
  double leading = a3.leading;
  double top = a3.top;
  double v7 = self->_systemLayoutMargins.top;
  if (self->_systemLayoutMargins.leading != a3.leading
    || v7 != top
    || self->_systemLayoutMargins.trailing != a3.trailing
    || self->_systemLayoutMargins.bottom != a3.bottom)
  {
    self->_systemLayoutMargins.double top = top;
    self->_systemLayoutMargins.double leading = a3.leading;
    self->_systemLayoutMargins.double bottom = a3.bottom;
    self->_systemLayoutMargins.double trailing = a3.trailing;
    v12 = [(MessageListCellLayoutValuesHelper *)self defaultLayoutValues];
    objc_msgSend(v12, "setSystemLayoutMargins:", top, leading, bottom, trailing);

    v13 = [(MessageListCellLayoutValuesHelper *)self expandedLayoutValues];
    objc_msgSend(v13, "setSystemLayoutMargins:", top, leading, bottom, trailing);

    v14 = [(MessageListCellLayoutValuesHelper *)self topHitsLayoutValues];
    objc_msgSend(v14, "setSystemLayoutMargins:", top, leading, bottom, trailing);

    id v15 = [(MessageListCellLayoutValuesHelper *)self groupedSenderLayoutValues];
    objc_msgSend(v15, "setSystemLayoutMargins:", top, leading, bottom, trailing);
  }
}

- (void)setTraitCollection:(id)a3
{
  v13 = (UITraitCollection *)a3;
  if (pthread_main_np() != 1)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"MessageListCellLayoutValues.m" lineNumber:173 description:@"Current thread must be main"];
  }
  p_traitCollection = &self->_traitCollection;
  double v7 = v13;
  if (self->_traitCollection != v13)
  {
    objc_storeStrong((id *)p_traitCollection, a3);
    v8 = [(MessageListCellLayoutValuesHelper *)self defaultLayoutValues];
    [v8 setTraitCollection:v13];

    v9 = [(MessageListCellLayoutValuesHelper *)self expandedLayoutValues];
    [v9 setTraitCollection:v13];

    v10 = [(MessageListCellLayoutValuesHelper *)self topHitsLayoutValues];
    [v10 setTraitCollection:v13];

    v11 = [(MessageListCellLayoutValuesHelper *)self groupedSenderLayoutValues];
    [v11 setTraitCollection:v13];

    double v7 = v13;
  }
  MEMORY[0x1F41817F8](p_traitCollection, v7);
}

- (MessageListCellLayoutValuesHelper)init
{
  v13.receiver = self;
  v13.super_class = (Class)MessageListCellLayoutValuesHelper;
  v2 = [(MessageListCellLayoutValuesHelper *)&v13 init];
  if (v2)
  {
    v3 = [[_DefaultMessageListCellLayoutValues alloc] _init];
    defaultLayoutValues = v2->_defaultLayoutValues;
    v2->_defaultLayoutValues = v3;

    v5 = [[_ExpandedMessageListCellLayoutValues alloc] _init];
    expandedLayoutValues = v2->_expandedLayoutValues;
    v2->_expandedLayoutValues = v5;

    double v7 = [[_TopHitsMessageListCellLayoutValues alloc] _init];
    topHitsLayoutValues = v2->_topHitsLayoutValues;
    v2->_topHitsLayoutValues = v7;

    v9 = [[_GroupedSenderMessageListCellLayoutValues alloc] _init];
    groupedSenderLayoutValues = v2->_groupedSenderLayoutValues;
    v2->_groupedSenderLayoutValues = v9;

    v11 = [MEMORY[0x1E4FB1498] listPlainCellConfiguration];
    [(MessageListCellLayoutValuesHelper *)v2 setDefaultBackgroundConfiguration:v11];
  }
  return v2;
}

- (void)setDefaultBackgroundConfiguration:(id)a3
{
  if (self->_defaultBackgroundConfiguration != a3)
  {
    id v4 = (UIBackgroundConfiguration *)[a3 copy];
    defaultBackgroundConfiguration = self->_defaultBackgroundConfiguration;
    self->_defaultBackgroundConfiguration = v4;
    v6 = v4;

    double v7 = [(MessageListCellLayoutValuesHelper *)self defaultLayoutValues];
    [v7 setDefaultBackgroundConfiguration:v6];

    v8 = [(MessageListCellLayoutValuesHelper *)self expandedLayoutValues];
    [v8 setDefaultBackgroundConfiguration:v6];

    v9 = [(MessageListCellLayoutValuesHelper *)self topHitsLayoutValues];
    [v9 setDefaultBackgroundConfiguration:v6];

    id v10 = [(MessageListCellLayoutValuesHelper *)self groupedSenderLayoutValues];
    [v10 setDefaultBackgroundConfiguration:v6];
  }
}

- (id)layoutValuesForStyle:(int64_t)a3
{
  if (a3 == 4)
  {
    v3 = [(MessageListCellLayoutValuesHelper *)self groupedSenderLayoutValues];
  }
  else if (a3 == 3)
  {
    v3 = [(MessageListCellLayoutValuesHelper *)self topHitsLayoutValues];
  }
  else
  {
    if (a3 == 2) {
      [(MessageListCellLayoutValuesHelper *)self expandedLayoutValues];
    }
    else {
    v3 = [(MessageListCellLayoutValuesHelper *)self defaultLayoutValues];
    }
  }
  return v3;
}

- (MessageListCellLayoutValues)defaultLayoutValues
{
  return self->_defaultLayoutValues;
}

- (MessageListCellLayoutValues)topHitsLayoutValues
{
  return self->_topHitsLayoutValues;
}

- (MessageListCellLayoutValues)expandedLayoutValues
{
  return self->_expandedLayoutValues;
}

- (void)setInMultiSelectionMode:(BOOL)a3
{
  if (self->_inMultiSelectionMode != a3)
  {
    BOOL v3 = a3;
    self->_inMultiSelectionMode = a3;
    v5 = [(MessageListCellLayoutValuesHelper *)self defaultLayoutValues];
    [v5 setInMultiSelectionMode:v3];

    v6 = [(MessageListCellLayoutValuesHelper *)self expandedLayoutValues];
    [v6 setInMultiSelectionMode:v3];

    double v7 = [(MessageListCellLayoutValuesHelper *)self topHitsLayoutValues];
    [v7 setInMultiSelectionMode:v3];

    id v8 = [(MessageListCellLayoutValuesHelper *)self groupedSenderLayoutValues];
    [v8 setInMultiSelectionMode:v3];
  }
}

- (double)dynamicRowHeightWithSummary:(id)a3 bounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  id v10 = [(MessageListCellLayoutValuesHelper *)self defaultLayoutValues];
  uint64_t v11 = objc_msgSend(v10, "actualLineCountForSummary:bounds:", v9, x, y, width, height);

  [v10 heightWithNumberOfSummaryLines:v11];
  double v13 = v12;

  return v13;
}

- (void)invalidate
{
  BOOL v3 = [(MessageListCellLayoutValuesHelper *)self defaultLayoutValues];
  [v3 _invalidateAndNotify:1];

  id v4 = [(MessageListCellLayoutValuesHelper *)self expandedLayoutValues];
  [v4 _invalidateAndNotify:1];

  v5 = [(MessageListCellLayoutValuesHelper *)self topHitsLayoutValues];
  [v5 _invalidateAndNotify:1];

  id v6 = [(MessageListCellLayoutValuesHelper *)self groupedSenderLayoutValues];
  [v6 _invalidateAndNotify:1];
}

- (void)setSupportsPopover:(BOOL)a3
{
  BOOL v3 = a3;
  if (pthread_main_np() != 1)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MessageListCellLayoutValues.m" lineNumber:174 description:@"Current thread must be main"];
  }
  if (self->_supportsPopover != v3)
  {
    self->_supportsPopover = v3;
    id v6 = [(MessageListCellLayoutValuesHelper *)self defaultLayoutValues];
    [v6 setSupportsPopover:v3];

    double v7 = [(MessageListCellLayoutValuesHelper *)self expandedLayoutValues];
    [v7 setSupportsPopover:v3];

    id v8 = [(MessageListCellLayoutValuesHelper *)self topHitsLayoutValues];
    [v8 setSupportsPopover:v3];

    id v10 = [(MessageListCellLayoutValuesHelper *)self groupedSenderLayoutValues];
    [v10 setSupportsPopover:v3];
  }
}

- (UIBackgroundConfiguration)defaultBackgroundConfiguration
{
  v2 = (void *)[(UIBackgroundConfiguration *)self->_defaultBackgroundConfiguration copy];
  return (UIBackgroundConfiguration *)v2;
}

- (void)setDefaultLayoutValues:(id)a3
{
}

- (void)setExpandedLayoutValues:(id)a3
{
}

- (void)setTopHitsLayoutValues:(id)a3
{
}

- (MessageListCellLayoutValues)groupedSenderLayoutValues
{
  return self->_groupedSenderLayoutValues;
}

- (void)setGroupedSenderLayoutValues:(id)a3
{
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (BOOL)supportsPopover
{
  return self->_supportsPopover;
}

- (NSDirectionalEdgeInsets)systemLayoutMargins
{
  double top = self->_systemLayoutMargins.top;
  double leading = self->_systemLayoutMargins.leading;
  double bottom = self->_systemLayoutMargins.bottom;
  double trailing = self->_systemLayoutMargins.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (BOOL)inMultiSelectionMode
{
  return self->_inMultiSelectionMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_groupedSenderLayoutValues, 0);
  objc_storeStrong((id *)&self->_topHitsLayoutValues, 0);
  objc_storeStrong((id *)&self->_expandedLayoutValues, 0);
  objc_storeStrong((id *)&self->_defaultLayoutValues, 0);
  objc_storeStrong((id *)&self->_defaultBackgroundConfiguration, 0);
}

@end