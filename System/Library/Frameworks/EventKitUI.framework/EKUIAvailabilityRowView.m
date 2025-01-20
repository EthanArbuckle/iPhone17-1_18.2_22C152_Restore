@interface EKUIAvailabilityRowView
+ (double)cornerRadius;
+ (double)padInset;
- (BOOL)isLoading;
- (CGRect)frameForSpanView:(id)a3;
- (EKParticipant)participant;
- (EKUIAvailabilityRowView)initWithParticipant:(id)a3;
- (NSArray)spans;
- (double)convertDateIntoOffset:(id)a3;
- (void)addToSpans:(id)a3;
- (void)completedLoad;
- (void)setFrame:(CGRect)a3;
- (void)startLoadForDate:(id)a3;
- (void)updateSpanViews;
@end

@implementation EKUIAvailabilityRowView

- (EKUIAvailabilityRowView)initWithParticipant:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EKUIAvailabilityRowView;
  v6 = [(EKUIAvailabilityRowView *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_participant, a3);
    v8 = [MEMORY[0x1E4FB1618] clearColor];
    [(EKUIAvailabilityRowView *)v7 setBackgroundColor:v8];

    uint64_t v9 = objc_opt_new();
    spanViews = v7->_spanViews;
    v7->_spanViews = (NSMutableArray *)v9;

    uint64_t v11 = objc_opt_new();
    spans = v7->_spans;
    v7->_spans = (NSMutableArray *)v11;
  }
  return v7;
}

- (void)startLoadForDate:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_startOfDay, a3);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = self->_spanViews;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9++), "removeFromSuperview", (void)v12);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  v10 = self;
  objc_sync_enter(v10);
  [(NSMutableArray *)v10->_spans removeAllObjects];
  spans = v10->_spans;
  v10->_spans = 0;

  objc_sync_exit(v10);
}

- (void)completedLoad
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_spans)
  {
    v3 = [(NSDate *)v2->_startOfDay dateByAddingTimeInterval:86399.0];
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F254B0]) initWithStartDate:v2->_startOfDay endDate:v3 type:0];
    uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithObject:v4];
    spans = v2->_spans;
    v2->_spans = (NSMutableArray *)v5;
  }
  objc_sync_exit(v2);

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__EKUIAvailabilityRowView_completedLoad__block_invoke;
  block[3] = &unk_1E6087570;
  block[4] = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __40__EKUIAvailabilityRowView_completedLoad__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateSpanViews];
}

- (NSArray)spans
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [MEMORY[0x1E4F1C978] arrayWithArray:v2->_spans];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)addToSpans:(id)a3
{
  id v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  id v5 = v9;
  spans = v4->_spans;
  if (!spans)
  {
    uint64_t v7 = objc_opt_new();
    uint64_t v8 = v4->_spans;
    v4->_spans = (NSMutableArray *)v7;

    spans = v4->_spans;
    id v5 = v9;
  }
  [(NSMutableArray *)spans addObjectsFromArray:v5];
  [(NSMutableArray *)v4->_spans sortUsingComparator:&__block_literal_global_17];
  objc_sync_exit(v4);
}

uint64_t __38__EKUIAvailabilityRowView_addToSpans___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 startDate];
  v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)updateSpanViews
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v3 = self->_spanViews;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v42 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v41 + 1) + 8 * i) removeFromSuperview];
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v5);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = [(EKUIAvailabilityRowView *)self spans];
  uint64_t v8 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v36 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v9; ++j)
      {
        if (*(void *)v38 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v37 + 1) + 8 * j);
        if ([v11 type] == 1 || objc_msgSend(v11, "type") == 5)
        {
          long long v12 = objc_opt_new();
          long long v13 = [v11 startDate];
          [v12 setStartDate:v13];

          long long v14 = [v11 endDate];
          [v12 setEndDate:v14];

          [v12 setInset:1];
          [(EKUIAvailabilityRowView *)self frameForSpanView:v12];
          objc_msgSend(v12, "setFrame:");
          long long v15 = [MEMORY[0x1E4FB1618] systemGray2Color];
          id v16 = [v15 colorWithAlphaComponent:0.3];
          uint64_t v17 = [v16 CGColor];
          v18 = [v12 layer];
          [v18 setBackgroundColor:v17];

          id v19 = [MEMORY[0x1E4FB1618] systemGray2Color];
          uint64_t v20 = [v19 CGColor];
          v21 = [v12 layer];
          [v21 setBorderColor:v20];

          v22 = [v12 layer];
          [v22 setBorderWidth:1.5];

          +[EKUIAvailabilityRowView cornerRadius];
          double v24 = v23;
          v25 = [v12 layer];
          [v25 setCornerRadius:v24];

          v26 = [v12 layer];
          [v26 setMasksToBounds:1];

          [(NSMutableArray *)self->_spanViews addObject:v12];
          [(EKUIAvailabilityRowView *)self addSubview:v12];
        }
        if (objc_msgSend(MEMORY[0x1E4F254B8], "showTypeAsUnavailable:", objc_msgSend(v11, "type")))
        {
          v27 = objc_opt_new();
          v28 = [v11 startDate];
          [v27 setStartDate:v28];

          v29 = [v11 endDate];
          [v27 setEndDate:v29];

          [(EKUIAvailabilityRowView *)self frameForSpanView:v27];
          objc_msgSend(v27, "setFrame:");
          v30 = [MEMORY[0x1E4FB1618] clearColor];
          v31 = [MEMORY[0x1E4FB1618] systemGray2Color];
          v32 = [v31 colorWithAlphaComponent:0.3];
          v33 = CUIKCreateStripedUIImage();

          v34 = [MEMORY[0x1E4FB1618] colorWithPatternImage:v33];
          [v27 setBackgroundColor:v34];

          [(NSMutableArray *)self->_spanViews addObject:v27];
          [(EKUIAvailabilityRowView *)self addSubview:v27];
          [(EKUIAvailabilityRowView *)self sendSubviewToBack:v27];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v9);
  }

  [(EKUIAvailabilityRowView *)self setNeedsDisplay];
}

+ (double)padInset
{
  return 8.0;
}

+ (double)cornerRadius
{
  return 8.0;
}

- (CGRect)frameForSpanView:(id)a3
{
  id v4 = a3;
  double v5 = 0.0;
  if ([v4 inset])
  {
    +[EKUIAvailabilityRowView padInset];
    double v5 = v6;
  }
  uint64_t v7 = [v4 startDate];
  [(EKUIAvailabilityRowView *)self convertDateIntoOffset:v7];
  double v9 = v8;

  v10 = [v4 endDate];

  [(EKUIAvailabilityRowView *)self convertDateIntoOffset:v10];
  double v12 = v11;

  if (CalTimeDirectionIsLeftToRight()) {
    double v13 = v12 - v9;
  }
  else {
    double v13 = v9 - v12;
  }
  if (!CalTimeDirectionIsLeftToRight()) {
    double v9 = v12;
  }
  [(EKUIAvailabilityRowView *)self frame];
  double v15 = v14 + v5 * -2.0;
  double v16 = v9;
  double v17 = v5;
  double v18 = v13;
  result.size.height = v15;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)EKUIAvailabilityRowView;
  -[EKUIAvailabilityRowView setFrame:](&v14, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = self->_spanViews;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        -[EKUIAvailabilityRowView frameForSpanView:](self, "frameForSpanView:", v9, (void)v10);
        objc_msgSend(v9, "setFrame:");
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
}

- (double)convertDateIntoOffset:(id)a3
{
  [a3 timeIntervalSinceDate:self->_startOfDay];
  double v5 = v4;
  [(EKUIAvailabilityRowView *)self frame];
  double v7 = v6;
  double v8 = v5 / 86400.0 * v6;
  int IsLeftToRight = CalTimeDirectionIsLeftToRight();
  double result = v7 - v8;
  if (IsLeftToRight) {
    return v8;
  }
  return result;
}

- (EKParticipant)participant
{
  return (EKParticipant *)objc_getProperty(self, a2, 448, 1);
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participant, 0);
  objc_storeStrong((id *)&self->_spans, 0);
  objc_storeStrong((id *)&self->_startOfDay, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);

  objc_storeStrong((id *)&self->_spanViews, 0);
}

@end