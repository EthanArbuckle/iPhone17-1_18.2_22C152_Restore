@interface MUCompositionalStackLayoutGroup
- (BOOL)alignmentBoundsContent;
- (BOOL)alignmentBoundsContentForArrangedLayoutItem:(id)a3;
- (BOOL)distributionBoundsContent;
- (BOOL)hasAlignmentForArrangedLayoutItem:(id)a3;
- (MUCompositionalStackLayoutGroup)initWithAxis:(int64_t)a3;
- (MUCompositionalStackLayoutGroup)initWithIdentifier:(id)a3 axis:(int64_t)a4;
- (MUCompositionalStackLayoutGroupInternal)internal;
- (NSArray)arrangedLayoutItems;
- (NSDirectionalEdgeInsets)insets;
- (NSDirectionalEdgeInsets)paddingForArrangedLayoutItem:(id)a3;
- (NSString)identifier;
- (UIOffset)offsetForArrangedLayoutItem:(id)a3;
- (double)spacing;
- (float)alignmentFittingSizePriority;
- (float)alignmentFittingSizePriorityForArrangedLayoutItem:(id)a3;
- (float)distributionFittingSizePriority;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)alignment;
- (int64_t)alignmentForArrangedLayoutItem:(id)a3;
- (int64_t)axis;
- (int64_t)distribution;
- (void)addArrangedLayoutItem:(id)a3;
- (void)disableAlignmentForArrangedLayoutItem:(id)a3;
- (void)removeArrangedLayoutItem:(id)a3;
- (void)resetAlignmentForArrangedLayoutItem:(id)a3;
- (void)setAlignment:(int64_t)a3;
- (void)setAlignment:(int64_t)a3 forArrangedLayoutItem:(id)a4;
- (void)setAlignmentBoundsContent:(BOOL)a3;
- (void)setAlignmentBoundsContent:(BOOL)a3 forArrangedLayoutItem:(id)a4;
- (void)setAlignmentFittingSizePriority:(float)a3;
- (void)setAlignmentFittingSizePriority:(float)a3 forArrangedLayoutItem:(id)a4;
- (void)setArrangedLayoutItems:(id)a3;
- (void)setAxis:(int64_t)a3;
- (void)setDistribution:(int64_t)a3;
- (void)setDistributionBoundsContent:(BOOL)a3;
- (void)setDistributionFittingSizePriority:(float)a3;
- (void)setIdentifier:(id)a3;
- (void)setInsets:(NSDirectionalEdgeInsets)a3;
- (void)setInternal:(id)a3;
- (void)setOffset:(UIOffset)a3 forArrangedLayoutItem:(id)a4;
- (void)setPadding:(NSDirectionalEdgeInsets)a3 forArrangedLayoutItem:(id)a4;
- (void)setSpacing:(double)a3;
@end

@implementation MUCompositionalStackLayoutGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_arrangedLayoutItems, 0);
}

- (void)setAlignment:(int64_t)a3 forArrangedLayoutItem:(id)a4
{
  internal = self->_internal;
  unwrapLayoutItem(a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(MUCompositionalStackLayoutGroupInternal *)internal setAlignment:a3 forArrangedLayoutItem:v6];
}

- (MUCompositionalStackLayoutGroup)initWithIdentifier:(id)a3 axis:(int64_t)a4
{
  id v6 = a3;
  v7 = [[MUCompositionalStackLayoutGroupInternal alloc] initWithIdentifier:v6 axis:a4];

  v12.receiver = self;
  v12.super_class = (Class)MUCompositionalStackLayoutGroup;
  v8 = [(MUCompositionalStackLayoutGroup *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_internal, v7);
    arrangedLayoutItems = v9->_arrangedLayoutItems;
    v9->_arrangedLayoutItems = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v9;
}

- (void)setPadding:(NSDirectionalEdgeInsets)a3 forArrangedLayoutItem:(id)a4
{
  double trailing = a3.trailing;
  double bottom = a3.bottom;
  double leading = a3.leading;
  double top = a3.top;
  internal = self->_internal;
  unwrapLayoutItem(a4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  -[MUCompositionalStackLayoutGroupInternal setPadding:forArrangedLayoutItem:](internal, "setPadding:forArrangedLayoutItem:", v9, top, leading, bottom, trailing);
}

- (void)setArrangedLayoutItems:(id)a3
{
  v4 = (NSArray *)a3;
  if (self->_arrangedLayoutItems != v4)
  {
    v8 = v4;
    if ((-[NSArray isEqual:](v4, "isEqual:") & 1) == 0)
    {
      v5 = [MEMORY[0x1E4F1C978] arrayWithArray:v8];
      arrangedLayoutItems = self->_arrangedLayoutItems;
      self->_arrangedLayoutItems = v5;

      v7 = MUMap(self->_arrangedLayoutItems, &__block_literal_global_9);
      [(MUCompositionalStackLayoutGroupInternal *)self->_internal setArrangedLayoutItems:v7];
    }
  }
  MEMORY[0x1F41817F8]();
}

id __58__MUCompositionalStackLayoutGroup_setArrangedLayoutItems___block_invoke(uint64_t a1, void *a2)
{
  return unwrapLayoutItem(a2);
}

- (MUCompositionalStackLayoutGroupInternal)internal
{
  return self->_internal;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(MUCompositionalStackLayoutGroupInternal *)self->_internal copy];
  uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithAxis:", -[MUCompositionalStackLayoutGroup axis](self, "axis"));
  v7 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v5;
  id v8 = v5;

  objc_storeStrong((id *)(v6 + 8), self->_arrangedLayoutItems);
  return (id)v6;
}

- (MUCompositionalStackLayoutGroup)initWithAxis:(int64_t)a3
{
  v4 = [[MUCompositionalStackLayoutGroupInternal alloc] initWithAxis:a3];
  v9.receiver = self;
  v9.super_class = (Class)MUCompositionalStackLayoutGroup;
  v5 = [(MUCompositionalStackLayoutGroup *)&v9 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_internal, v4);
    arrangedLayoutItems = v6->_arrangedLayoutItems;
    v6->_arrangedLayoutItems = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v6;
}

- (int64_t)axis
{
  return [(MUCompositionalStackLayoutGroupInternal *)self->_internal axis];
}

- (void)setDistributionFittingSizePriority:(float)a3
{
}

- (void)setDistribution:(int64_t)a3
{
}

- (NSString)identifier
{
  return [(MUCompositionalStackLayoutGroupInternal *)self->_internal identifier];
}

- (void)setIdentifier:(id)a3
{
}

- (void)setAxis:(int64_t)a3
{
}

- (int64_t)distribution
{
  return [(MUCompositionalStackLayoutGroupInternal *)self->_internal distribution];
}

- (BOOL)distributionBoundsContent
{
  return [(MUCompositionalStackLayoutGroupInternal *)self->_internal distributionBoundsContent];
}

- (void)setDistributionBoundsContent:(BOOL)a3
{
}

- (float)distributionFittingSizePriority
{
  [(MUCompositionalStackLayoutGroupInternal *)self->_internal distributionFittingSizePriority];
  return result;
}

- (int64_t)alignment
{
  return [(MUCompositionalStackLayoutGroupInternal *)self->_internal alignment];
}

- (void)setAlignment:(int64_t)a3
{
}

- (BOOL)alignmentBoundsContent
{
  return [(MUCompositionalStackLayoutGroupInternal *)self->_internal alignmentBoundsContent];
}

- (void)setAlignmentBoundsContent:(BOOL)a3
{
}

- (float)alignmentFittingSizePriority
{
  [(MUCompositionalStackLayoutGroupInternal *)self->_internal alignmentFittingSizePriority];
  return result;
}

- (void)setAlignmentFittingSizePriority:(float)a3
{
}

- (double)spacing
{
  [(MUCompositionalStackLayoutGroupInternal *)self->_internal spacing];
  return result;
}

- (void)setSpacing:(double)a3
{
}

- (NSDirectionalEdgeInsets)insets
{
  [(MUCompositionalStackLayoutGroupInternal *)self->_internal insets];
  result.double trailing = v5;
  result.double bottom = v4;
  result.double leading = v3;
  result.double top = v2;
  return result;
}

- (void)setInsets:(NSDirectionalEdgeInsets)a3
{
}

- (void)addArrangedLayoutItem:(id)a3
{
  id v10 = a3;
  double v4 = unwrapLayoutItem(v10);
  NSUInteger v5 = [(NSArray *)self->_arrangedLayoutItems count];
  [(MUCompositionalStackLayoutGroupInternal *)self->_internal addArrangedLayoutItem:v4];
  uint64_t v6 = [(MUCompositionalStackLayoutGroupInternal *)self->_internal arrangedLayoutItems];
  uint64_t v7 = [v6 count];

  if (v5 != v7)
  {
    id v8 = [(NSArray *)self->_arrangedLayoutItems arrayByAddingObject:v10];
    arrangedLayoutItems = self->_arrangedLayoutItems;
    self->_arrangedLayoutItems = v8;
  }
}

- (void)removeArrangedLayoutItem:(id)a3
{
  id v11 = a3;
  double v4 = unwrapLayoutItem(v11);
  NSUInteger v5 = [(NSArray *)self->_arrangedLayoutItems count];
  [(MUCompositionalStackLayoutGroupInternal *)self->_internal removeArrangedLayoutItem:v4];
  uint64_t v6 = [(MUCompositionalStackLayoutGroupInternal *)self->_internal arrangedLayoutItems];
  uint64_t v7 = [v6 count];

  if (v5 != v7)
  {
    id v8 = [MEMORY[0x1E4F1CA48] arrayWithArray:self->_arrangedLayoutItems];
    [v8 removeObject:v11];
    objc_super v9 = (NSArray *)[v8 copy];
    arrangedLayoutItems = self->_arrangedLayoutItems;
    self->_arrangedLayoutItems = v9;
  }
}

- (NSDirectionalEdgeInsets)paddingForArrangedLayoutItem:(id)a3
{
  internal = self->_internal;
  double v4 = unwrapLayoutItem(a3);
  [(MUCompositionalStackLayoutGroupInternal *)internal paddingForArrangedLayoutItem:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.double trailing = v16;
  result.double bottom = v15;
  result.double leading = v14;
  result.double top = v13;
  return result;
}

- (UIOffset)offsetForArrangedLayoutItem:(id)a3
{
  internal = self->_internal;
  double v4 = unwrapLayoutItem(a3);
  [(MUCompositionalStackLayoutGroupInternal *)internal offsetForArrangedLayoutItem:v4];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.vertical = v10;
  result.horizontal = v9;
  return result;
}

- (void)setOffset:(UIOffset)a3 forArrangedLayoutItem:(id)a4
{
  double vertical = a3.vertical;
  double horizontal = a3.horizontal;
  internal = self->_internal;
  unwrapLayoutItem(a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MUCompositionalStackLayoutGroupInternal setOffset:forArrangedLayoutItem:](internal, "setOffset:forArrangedLayoutItem:", v7, horizontal, vertical);
}

- (BOOL)hasAlignmentForArrangedLayoutItem:(id)a3
{
  internal = self->_internal;
  double v4 = unwrapLayoutItem(a3);
  LOBYTE(internal) = [(MUCompositionalStackLayoutGroupInternal *)internal hasAlignmentForArrangedLayoutItem:v4];

  return (char)internal;
}

- (void)disableAlignmentForArrangedLayoutItem:(id)a3
{
  internal = self->_internal;
  unwrapLayoutItem(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(MUCompositionalStackLayoutGroupInternal *)internal disableAlignmentForArrangedLayoutItem:v4];
}

- (void)resetAlignmentForArrangedLayoutItem:(id)a3
{
  internal = self->_internal;
  unwrapLayoutItem(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(MUCompositionalStackLayoutGroupInternal *)internal resetAlignmentForArrangedLayoutItem:v4];
}

- (int64_t)alignmentForArrangedLayoutItem:(id)a3
{
  internal = self->_internal;
  id v4 = unwrapLayoutItem(a3);
  int64_t v5 = [(MUCompositionalStackLayoutGroupInternal *)internal alignmentForArrangedLayoutItem:v4];

  return v5;
}

- (BOOL)alignmentBoundsContentForArrangedLayoutItem:(id)a3
{
  internal = self->_internal;
  id v4 = unwrapLayoutItem(a3);
  LOBYTE(internal) = [(MUCompositionalStackLayoutGroupInternal *)internal alignmentBoundsContentForArrangedLayoutItem:v4];

  return (char)internal;
}

- (void)setAlignmentBoundsContent:(BOOL)a3 forArrangedLayoutItem:(id)a4
{
  BOOL v4 = a3;
  internal = self->_internal;
  unwrapLayoutItem(a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(MUCompositionalStackLayoutGroupInternal *)internal setAlignmentBoundsContent:v4 forArrangedLayoutItem:v6];
}

- (float)alignmentFittingSizePriorityForArrangedLayoutItem:(id)a3
{
  internal = self->_internal;
  BOOL v4 = unwrapLayoutItem(a3);
  [(MUCompositionalStackLayoutGroupInternal *)internal alignmentFittingSizePriorityForArrangedLayoutItem:v4];
  float v6 = v5;

  return v6;
}

- (void)setAlignmentFittingSizePriority:(float)a3 forArrangedLayoutItem:(id)a4
{
  internal = self->_internal;
  unwrapLayoutItem(a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&double v6 = a3;
  [(MUCompositionalStackLayoutGroupInternal *)internal setAlignmentFittingSizePriority:v7 forArrangedLayoutItem:v6];
}

- (NSArray)arrangedLayoutItems
{
  return self->_arrangedLayoutItems;
}

- (void)setInternal:(id)a3
{
}

@end