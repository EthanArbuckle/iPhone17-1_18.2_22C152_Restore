@interface EKUIAvailabilityParticipantList
+ (double)listWidthForCompact:(BOOL)a3 orientation:(int64_t)a4;
- (EKUIAvailabilityParticipantList)initWithParticipants:(id)a3 viewController:(id)a4;
- (void)layoutSubviews;
- (void)setBusyParticipants:(id)a3;
- (void)setRowHeight:(double)a3;
- (void)setVerticalScrollOffset:(double)a3;
@end

@implementation EKUIAvailabilityParticipantList

- (EKUIAvailabilityParticipantList)initWithParticipants:(id)a3 viewController:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)EKUIAvailabilityParticipantList;
  v8 = [(EKUIAvailabilityParticipantList *)&v24 init];
  if (v8)
  {
    uint64_t v9 = objc_opt_new();
    containers = v8->_containers;
    v8->_containers = (NSMutableArray *)v9;

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * v15);
          v17 = [EKUIParticipantContainer alloc];
          v18 = -[EKUIParticipantContainer initWithParticipant:viewController:](v17, "initWithParticipant:viewController:", v16, v7, (void)v20);
          [(NSMutableArray *)v8->_containers addObject:v18];
          [(EKUIAvailabilityParticipantList *)v8 addSubview:v18];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v13);
    }
  }
  return v8;
}

- (void)setBusyParticipants:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = self->_containers;
  uint64_t v19 = [(NSMutableArray *)obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v19)
  {
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v6 = v18;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v7)
        {
          uint64_t v20 = i;
          uint64_t v8 = *(void *)v22;
          while (2)
          {
            for (uint64_t j = 0; j != v7; ++j)
            {
              if (*(void *)v22 != v8) {
                objc_enumerationMutation(v6);
              }
              v10 = *(void **)(*((void *)&v21 + 1) + 8 * j);
              id v11 = [v5 participant];
              uint64_t v12 = [v11 UUID];
              uint64_t v13 = [v10 participant];
              uint64_t v14 = [v13 UUID];
              char v15 = [v12 isEqualToString:v14];

              if (v15)
              {
                uint64_t v7 = 1;
                goto LABEL_16;
              }
            }
            uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v7) {
              continue;
            }
            break;
          }
LABEL_16:
          uint64_t i = v20;
        }

        [v5 setBusy:v7];
      }
      uint64_t v19 = [(NSMutableArray *)obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v19);
  }
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)EKUIAvailabilityParticipantList;
  [(EKUIAvailabilityParticipantList *)&v5 layoutSubviews];
  containers = self->_containers;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__EKUIAvailabilityParticipantList_layoutSubviews__block_invoke;
  v4[3] = &unk_1E60896D0;
  v4[4] = self;
  [(NSMutableArray *)containers enumerateObjectsWithOptions:0 usingBlock:v4];
}

void __49__EKUIAvailabilityParticipantList_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  v3 = *(double **)(a1 + 32);
  double v4 = v3[259] * (double)a3;
  id v5 = a2;
  [v3 frame];
  objc_msgSend(v5, "setFrame:", 0.0, v4);
}

- (void)setRowHeight:(double)a3
{
  self->_rowHeight = a3;
  [(EKUIAvailabilityParticipantList *)self layoutSubviews];
}

- (void)setVerticalScrollOffset:(double)a3
{
  self->_scrollOffset = a3;
  -[EKUIAvailabilityParticipantList setContentOffset:](self, "setContentOffset:", 0.0, a3);
}

+ (double)listWidthForCompact:(BOOL)a3 orientation:(int64_t)a4
{
  double result = 168.0;
  if ((unint64_t)(a4 - 3) < 2) {
    double result = 336.0;
  }
  if (!a3) {
    return 240.0;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end