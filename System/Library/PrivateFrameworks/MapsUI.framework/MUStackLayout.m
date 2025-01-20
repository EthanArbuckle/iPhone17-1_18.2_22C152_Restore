@interface MUStackLayout
- (BOOL)alignmentBoundsContent;
- (BOOL)alignmentBoundsContentForArrangedLayoutItem:(id)a3;
- (BOOL)distributionBoundsContent;
- (BOOL)hasAlignmentForArrangedLayoutItem:(id)a3;
- (MULayoutItem)container;
- (MUStackLayout)initWithContainer:(id)a3 axis:(int64_t)a4;
- (NSArray)arrangedLayoutItems;
- (NSDirectionalEdgeInsets)insets;
- (NSDirectionalEdgeInsets)paddingForArrangedLayoutItem:(id)a3;
- (UIOffset)offsetForArrangedLayoutItem:(id)a3;
- (double)spacing;
- (float)alignmentFittingSizePriority;
- (float)alignmentFittingSizePriorityForArrangedLayoutItem:(id)a3;
- (float)distributionFittingSizePriority;
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
- (void)setContainer:(id)a3;
- (void)setDistribution:(int64_t)a3;
- (void)setDistributionBoundsContent:(BOOL)a3;
- (void)setDistributionFittingSizePriority:(float)a3;
- (void)setInsets:(NSDirectionalEdgeInsets)a3;
- (void)setOffset:(UIOffset)a3 forArrangedLayoutItem:(id)a4;
- (void)setPadding:(NSDirectionalEdgeInsets)a3 forArrangedLayoutItem:(id)a4;
- (void)setSpacing:(double)a3;
@end

@implementation MUStackLayout

- (MUStackLayout)initWithContainer:(id)a3 axis:(int64_t)a4
{
  id v6 = a3;
  v7 = [[MUStackLayoutInternal alloc] initWithContainer:v6 axis:a4];

  v11.receiver = self;
  v11.super_class = (Class)MUStackLayout;
  v8 = [(MUConstraintLayout *)&v11 initWithInternal:v7];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_internal, v7);
  }

  return v9;
}

- (MULayoutItem)container
{
  return [(MUStackLayoutInternal *)self->_internal container];
}

- (void)setContainer:(id)a3
{
}

- (int64_t)axis
{
  return [(MUStackLayoutInternal *)self->_internal axis];
}

- (void)setAxis:(int64_t)a3
{
}

- (int64_t)distribution
{
  return [(MUStackLayoutInternal *)self->_internal distribution];
}

- (void)setDistribution:(int64_t)a3
{
}

- (BOOL)distributionBoundsContent
{
  return [(MUStackLayoutInternal *)self->_internal distributionBoundsContent];
}

- (void)setDistributionBoundsContent:(BOOL)a3
{
}

- (float)distributionFittingSizePriority
{
  [(MUStackLayoutInternal *)self->_internal distributionFittingSizePriority];
  return result;
}

- (void)setDistributionFittingSizePriority:(float)a3
{
}

- (int64_t)alignment
{
  return [(MUStackLayoutInternal *)self->_internal alignment];
}

- (void)setAlignment:(int64_t)a3
{
}

- (BOOL)alignmentBoundsContent
{
  return [(MUStackLayoutInternal *)self->_internal alignmentBoundsContent];
}

- (void)setAlignmentBoundsContent:(BOOL)a3
{
}

- (float)alignmentFittingSizePriority
{
  [(MUStackLayoutInternal *)self->_internal alignmentFittingSizePriority];
  return result;
}

- (void)setAlignmentFittingSizePriority:(float)a3
{
}

- (double)spacing
{
  [(MUStackLayoutInternal *)self->_internal spacing];
  return result;
}

- (void)setSpacing:(double)a3
{
}

- (NSDirectionalEdgeInsets)insets
{
  [(MUStackLayoutInternal *)self->_internal insets];
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (void)setInsets:(NSDirectionalEdgeInsets)a3
{
}

- (NSArray)arrangedLayoutItems
{
  return [(MUStackLayoutInternal *)self->_internal arrangedLayoutItems];
}

- (void)setArrangedLayoutItems:(id)a3
{
}

- (void)addArrangedLayoutItem:(id)a3
{
}

- (void)removeArrangedLayoutItem:(id)a3
{
}

- (NSDirectionalEdgeInsets)paddingForArrangedLayoutItem:(id)a3
{
  [(MUStackLayoutInternal *)self->_internal paddingForArrangedLayoutItem:a3];
  result.trailing = v6;
  result.bottom = v5;
  result.leading = v4;
  result.top = v3;
  return result;
}

- (void)setPadding:(NSDirectionalEdgeInsets)a3 forArrangedLayoutItem:(id)a4
{
}

- (UIOffset)offsetForArrangedLayoutItem:(id)a3
{
  [(MUStackLayoutInternal *)self->_internal offsetForArrangedLayoutItem:a3];
  result.vertical = v4;
  result.horizontal = v3;
  return result;
}

- (void)setOffset:(UIOffset)a3 forArrangedLayoutItem:(id)a4
{
}

- (BOOL)hasAlignmentForArrangedLayoutItem:(id)a3
{
  return [(MUStackLayoutInternal *)self->_internal hasAlignmentForArrangedLayoutItem:a3];
}

- (void)disableAlignmentForArrangedLayoutItem:(id)a3
{
}

- (void)resetAlignmentForArrangedLayoutItem:(id)a3
{
}

- (int64_t)alignmentForArrangedLayoutItem:(id)a3
{
  return [(MUStackLayoutInternal *)self->_internal alignmentForArrangedLayoutItem:a3];
}

- (void)setAlignment:(int64_t)a3 forArrangedLayoutItem:(id)a4
{
}

- (BOOL)alignmentBoundsContentForArrangedLayoutItem:(id)a3
{
  return [(MUStackLayoutInternal *)self->_internal alignmentBoundsContentForArrangedLayoutItem:a3];
}

- (void)setAlignmentBoundsContent:(BOOL)a3 forArrangedLayoutItem:(id)a4
{
}

- (float)alignmentFittingSizePriorityForArrangedLayoutItem:(id)a3
{
  [(MUStackLayoutInternal *)self->_internal alignmentFittingSizePriorityForArrangedLayoutItem:a3];
  return result;
}

- (void)setAlignmentFittingSizePriority:(float)a3 forArrangedLayoutItem:(id)a4
{
}

- (void).cxx_destruct
{
}

@end