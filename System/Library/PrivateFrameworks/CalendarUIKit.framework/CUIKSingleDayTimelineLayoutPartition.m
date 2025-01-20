@interface CUIKSingleDayTimelineLayoutPartition
- (CUIKSingleDayTimelineLayoutPartition)init;
- (NSArray)stackedOccurrences;
- (double)endBoundary;
- (double)freeSpaceStartBoundary;
- (double)freeSpaceWidth;
- (double)initialStartBoundary;
- (double)topBoundaryTime;
- (double)totalWidth;
- (id)description;
- (id)peekOccurrence;
- (void)popOccurrence;
- (void)pushOccurrence:(id)a3;
- (void)setEndBoundary:(double)a3;
- (void)setInitialStartBoundary:(double)a3;
- (void)setTopBoundaryTime:(double)a3;
@end

@implementation CUIKSingleDayTimelineLayoutPartition

- (double)totalWidth
{
  [(CUIKSingleDayTimelineLayoutPartition *)self endBoundary];
  double v4 = v3;
  [(CUIKSingleDayTimelineLayoutPartition *)self initialStartBoundary];
  double result = v4 - v5;
  if (result < 0.0) {
    return -result;
  }
  return result;
}

- (double)freeSpaceStartBoundary
{
  [(CUIKSingleDayTimelineLayoutPartition *)self initialStartBoundary];
  double v4 = v3;
  uint64_t v5 = [(NSMutableArray *)self->_stackOfOccurrences count];
  if (v5)
  {
    unint64_t v6 = v5;
    v7 = [(NSMutableArray *)self->_stackOfOccurrences objectAtIndex:0];
    char v8 = objc_opt_respondsToSelector();
    v9 = v7;
    if ((v8 & 1) == 0) {
      v9 = objc_opt_class();
    }
    [v9 barToBarHorizontalDistanceIncludingBarWidth];
    double v11 = v10;
    double v12 = v10 * (double)v6;
    [(CUIKSingleDayTimelineLayoutPartition *)self endBoundary];
    if (v4 >= v13) {
      double v14 = -(v11 * (double)v6);
    }
    else {
      double v14 = v12;
    }
    double v4 = v4 + v14;
  }
  return v4;
}

- (double)initialStartBoundary
{
  return self->_initialStartBoundary;
}

- (double)freeSpaceWidth
{
  [(CUIKSingleDayTimelineLayoutPartition *)self endBoundary];
  double v4 = v3;
  [(CUIKSingleDayTimelineLayoutPartition *)self freeSpaceStartBoundary];
  double result = v4 - v5;
  if (result < 0.0) {
    return -result;
  }
  return result;
}

- (double)endBoundary
{
  return self->_endBoundary;
}

- (double)topBoundaryTime
{
  return self->_topBoundaryTime;
}

- (id)peekOccurrence
{
  return (id)[(NSMutableArray *)self->_stackOfOccurrences lastObject];
}

- (void)setTopBoundaryTime:(double)a3
{
  self->_topBoundaryTime = a3;
}

- (void)setEndBoundary:(double)a3
{
  self->_endBoundary = a3;
}

- (void)pushOccurrence:(id)a3
{
}

- (void)popOccurrence
{
}

- (void)setInitialStartBoundary:(double)a3
{
  self->_initialStartBoundary = a3;
}

- (CUIKSingleDayTimelineLayoutPartition)init
{
  v6.receiver = self;
  v6.super_class = (Class)CUIKSingleDayTimelineLayoutPartition;
  v2 = [(CUIKSingleDayTimelineLayoutPartition *)&v6 init];
  if (v2)
  {
    double v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    stackOfOccurrences = v2->_stackOfOccurrences;
    v2->_stackOfOccurrences = v3;
  }
  return v2;
}

- (void).cxx_destruct
{
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)CUIKSingleDayTimelineLayoutPartition;
  double v3 = [(CUIKSingleDayTimelineLayoutPartition *)&v9 description];
  double v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_topBoundaryTime];
  uint64_t v5 = [(NSMutableArray *)self->_stackOfOccurrences count];
  objc_super v6 = [(CUIKSingleDayTimelineLayoutPartition *)self peekOccurrence];
  v7 = [NSString stringWithFormat:@"%@ topBoundary: [%@], initialStartBoundary: [%f], endBoundary: [%f], number of stacked occurrences: [%lu], top occurrence on stack: [%@]", v3, v4, *(void *)&self->_initialStartBoundary, *(void *)&self->_endBoundary, v5, v6];

  return v7;
}

- (NSArray)stackedOccurrences
{
  return (NSArray *)self->_stackOfOccurrences;
}

@end