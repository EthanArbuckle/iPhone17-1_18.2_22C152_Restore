@interface MUBoxLayout
- (BOOL)hasHorizontalAlignmentForArrangedLayoutItem:(id)a3;
- (BOOL)hasVerticalAlignmentForArrangedLayoutItem:(id)a3;
- (BOOL)horizontalAlignmentBoundsContent;
- (BOOL)horizontalAlignmentBoundsContentForArrangedLayoutItem:(id)a3;
- (BOOL)verticalAlignmentBoundsContent;
- (BOOL)verticalAlignmentBoundsContentForArrangedLayoutItem:(id)a3;
- (MUBoxLayout)initWithContainer:(id)a3;
- (MULayoutItem)container;
- (NSArray)arrangedLayoutItems;
- (NSDirectionalEdgeInsets)insets;
- (NSDirectionalEdgeInsets)paddingForArrangedLayoutItem:(id)a3;
- (UIOffset)offsetForArrangedLayoutItem:(id)a3;
- (float)horizontalAlignmentFittingSizePriority;
- (float)horizontalFittingSizePriorityForArrangedLayoutItem:(id)a3;
- (float)verticalAlignmentFittingSizePriority;
- (float)verticalFittingSizePriorityForArrangedLayoutItem:(id)a3;
- (int64_t)horizontalAlignment;
- (int64_t)horizontalAlignmentForArrangedLayoutItem:(id)a3;
- (int64_t)verticalAlignment;
- (int64_t)verticalAlignmentForArrangedLayoutItem:(id)a3;
- (void)addArrangedLayoutItem:(id)a3;
- (void)disableHorizontalAlignmentForArrangedLayoutItem:(id)a3;
- (void)disableVerticalAlignmentForArrangedLayoutItem:(id)a3;
- (void)removeArrangedLayoutItem:(id)a3;
- (void)resetHorizontalAlignmentForArrangedLayoutItem:(id)a3;
- (void)resetVerticalAlignmentForArrangedLayoutItem:(id)a3;
- (void)setArrangedLayoutItems:(id)a3;
- (void)setContainer:(id)a3;
- (void)setHorizontalAlignment:(int64_t)a3;
- (void)setHorizontalAlignment:(int64_t)a3 forArrangedLayoutItem:(id)a4;
- (void)setHorizontalAlignmentBoundsContent:(BOOL)a3;
- (void)setHorizontalAlignmentBoundsContent:(BOOL)a3 forArrangedLayoutItem:(id)a4;
- (void)setHorizontalAlignmentFittingSizePriority:(float)a3;
- (void)setHorizontalFittingSizePriority:(float)a3 forArrangedLayoutItem:(id)a4;
- (void)setInsets:(NSDirectionalEdgeInsets)a3;
- (void)setOffset:(UIOffset)a3 forArrangedLayoutItem:(id)a4;
- (void)setPadding:(NSDirectionalEdgeInsets)a3 forArrangedLayoutItem:(id)a4;
- (void)setVerticalAlignment:(int64_t)a3;
- (void)setVerticalAlignment:(int64_t)a3 forArrangedLayoutItem:(id)a4;
- (void)setVerticalAlignmentBoundsContent:(BOOL)a3;
- (void)setVerticalAlignmentBoundsContent:(BOOL)a3 forArrangedLayoutItem:(id)a4;
- (void)setVerticalAlignmentFittingSizePriority:(float)a3;
- (void)setVerticalFittingSizePriority:(float)a3 forArrangedLayoutItem:(id)a4;
@end

@implementation MUBoxLayout

- (MUBoxLayout)initWithContainer:(id)a3
{
  id v4 = a3;
  v5 = [[MUBoxLayoutInternal alloc] initWithContainer:v4];

  v9.receiver = self;
  v9.super_class = (Class)MUBoxLayout;
  v6 = [(MUConstraintLayout *)&v9 initWithInternal:v5];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_internal, v5);
  }

  return v7;
}

- (MULayoutItem)container
{
  return [(MUBoxLayoutInternal *)self->_internal container];
}

- (void)setContainer:(id)a3
{
}

- (int64_t)verticalAlignment
{
  return [(MUBoxLayoutInternal *)self->_internal verticalAlignment];
}

- (void)setVerticalAlignment:(int64_t)a3
{
}

- (BOOL)verticalAlignmentBoundsContent
{
  return [(MUBoxLayoutInternal *)self->_internal verticalAlignmentBoundsContent];
}

- (void)setVerticalAlignmentBoundsContent:(BOOL)a3
{
}

- (float)verticalAlignmentFittingSizePriority
{
  [(MUBoxLayoutInternal *)self->_internal verticalAlignmentFittingSizePriority];
  return result;
}

- (void)setVerticalAlignmentFittingSizePriority:(float)a3
{
}

- (int64_t)horizontalAlignment
{
  return [(MUBoxLayoutInternal *)self->_internal horizontalAlignment];
}

- (void)setHorizontalAlignment:(int64_t)a3
{
}

- (BOOL)horizontalAlignmentBoundsContent
{
  return [(MUBoxLayoutInternal *)self->_internal horizontalAlignmentBoundsContent];
}

- (void)setHorizontalAlignmentBoundsContent:(BOOL)a3
{
}

- (float)horizontalAlignmentFittingSizePriority
{
  [(MUBoxLayoutInternal *)self->_internal horizontalAlignmentFittingSizePriority];
  return result;
}

- (void)setHorizontalAlignmentFittingSizePriority:(float)a3
{
}

- (NSDirectionalEdgeInsets)insets
{
  [(MUBoxLayoutInternal *)self->_internal insets];
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
  return [(MUBoxLayoutInternal *)self->_internal arrangedLayoutItems];
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
  [(MUBoxLayoutInternal *)self->_internal paddingForArrangedLayoutItem:a3];
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
  [(MUBoxLayoutInternal *)self->_internal offsetForArrangedLayoutItem:a3];
  result.vertical = v4;
  result.horizontal = v3;
  return result;
}

- (void)setOffset:(UIOffset)a3 forArrangedLayoutItem:(id)a4
{
}

- (BOOL)hasVerticalAlignmentForArrangedLayoutItem:(id)a3
{
  return [(MUBoxLayoutInternal *)self->_internal hasVerticalAlignmentForArrangedLayoutItem:a3];
}

- (void)disableVerticalAlignmentForArrangedLayoutItem:(id)a3
{
}

- (void)resetVerticalAlignmentForArrangedLayoutItem:(id)a3
{
}

- (int64_t)verticalAlignmentForArrangedLayoutItem:(id)a3
{
  return [(MUBoxLayoutInternal *)self->_internal verticalAlignmentForArrangedLayoutItem:a3];
}

- (void)setVerticalAlignment:(int64_t)a3 forArrangedLayoutItem:(id)a4
{
}

- (BOOL)verticalAlignmentBoundsContentForArrangedLayoutItem:(id)a3
{
  return [(MUBoxLayoutInternal *)self->_internal verticalAlignmentBoundsContentForArrangedLayoutItem:a3];
}

- (void)setVerticalAlignmentBoundsContent:(BOOL)a3 forArrangedLayoutItem:(id)a4
{
}

- (float)verticalFittingSizePriorityForArrangedLayoutItem:(id)a3
{
  [(MUBoxLayoutInternal *)self->_internal verticalFittingSizePriorityForArrangedLayoutItem:a3];
  return result;
}

- (void)setVerticalFittingSizePriority:(float)a3 forArrangedLayoutItem:(id)a4
{
}

- (BOOL)hasHorizontalAlignmentForArrangedLayoutItem:(id)a3
{
  return [(MUBoxLayoutInternal *)self->_internal hasHorizontalAlignmentForArrangedLayoutItem:a3];
}

- (void)disableHorizontalAlignmentForArrangedLayoutItem:(id)a3
{
}

- (void)resetHorizontalAlignmentForArrangedLayoutItem:(id)a3
{
}

- (int64_t)horizontalAlignmentForArrangedLayoutItem:(id)a3
{
  return [(MUBoxLayoutInternal *)self->_internal horizontalAlignmentForArrangedLayoutItem:a3];
}

- (void)setHorizontalAlignment:(int64_t)a3 forArrangedLayoutItem:(id)a4
{
}

- (BOOL)horizontalAlignmentBoundsContentForArrangedLayoutItem:(id)a3
{
  return [(MUBoxLayoutInternal *)self->_internal horizontalAlignmentBoundsContentForArrangedLayoutItem:a3];
}

- (void)setHorizontalAlignmentBoundsContent:(BOOL)a3 forArrangedLayoutItem:(id)a4
{
}

- (float)horizontalFittingSizePriorityForArrangedLayoutItem:(id)a3
{
  [(MUBoxLayoutInternal *)self->_internal horizontalFittingSizePriorityForArrangedLayoutItem:a3];
  return result;
}

- (void)setHorizontalFittingSizePriority:(float)a3 forArrangedLayoutItem:(id)a4
{
}

- (void).cxx_destruct
{
}

@end