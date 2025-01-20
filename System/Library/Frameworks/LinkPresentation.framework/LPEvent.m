@interface LPEvent
- (BOOL)_childrenAreComplete;
- (BOOL)isComplete;
- (LPEvent)init;
- (LPEvent)initWithType:(int64_t)a3 subtitle:(id)a4;
- (LPEvent)parent;
- (NSArray)children;
- (NSString)subtitle;
- (NSURL)URL;
- (double)duration;
- (double)endTime;
- (double)startTime;
- (id)childWithType:(int64_t)a3 subtitle:(id)a4;
- (int64_t)status;
- (int64_t)type;
- (unint64_t)specialization;
- (void)didCompleteWithErrorCode:(int64_t)a3;
- (void)didCompleteWithStatus:(int64_t)a3;
- (void)setSpecialization:(unint64_t)a3;
- (void)setURL:(id)a3;
@end

@implementation LPEvent

- (LPEvent)init
{
  return 0;
}

- (LPEvent)initWithType:(int64_t)a3 subtitle:(id)a4
{
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)LPEvent;
  v8 = [(LPEvent *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v10 = v8;
    objc_sync_enter(v10);
    v10->_type = a3;
    objc_storeStrong((id *)&v10->_subtitle, a4);
    v10->_startTime = CACurrentMediaTime();
    v10->_status = 0;
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    children = v10->_children;
    v10->_children = v11;

    v10->_specialization = 0;
    objc_sync_exit(v10);

    v13 = v10;
  }

  return v9;
}

- (id)childWithType:(int64_t)a3 subtitle:(id)a4
{
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  v8 = [[LPEvent alloc] initWithType:a3 subtitle:v6];
  [(NSMutableArray *)v7->_children addObject:v8];
  objc_storeWeak((id *)&v8->_parent, v7);
  objc_sync_exit(v7);

  return v8;
}

- (void)didCompleteWithErrorCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = qword_1A3711950[a3 - 1];
  }
  [(LPEvent *)self didCompleteWithStatus:v3];
}

- (void)didCompleteWithStatus:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_status = a3;
  obj->_endTime = CACurrentMediaTime();
  +[LPStatistics recordEvent:](LPStatistics, "recordEvent:");
  objc_sync_exit(obj);
}

- (BOOL)_childrenAreComplete
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = v2->_children;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        if ((objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "isComplete", (void)v9) & 1) == 0)
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  objc_sync_exit(v2);
  return v7;
}

- (BOOL)isComplete
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_status) {
    BOOL v3 = [(LPEvent *)v2 _childrenAreComplete];
  }
  else {
    BOOL v3 = 0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (double)duration
{
  v2 = self;
  objc_sync_enter(v2);
  double v3 = v2->_endTime - v2->_startTime;
  objc_sync_exit(v2);

  return v3;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)endTime
{
  return self->_endTime;
}

- (int64_t)status
{
  return self->_status;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (unint64_t)specialization
{
  return self->_specialization;
}

- (void)setSpecialization:(unint64_t)a3
{
  self->_specialization = a3;
}

- (LPEvent)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  return (LPEvent *)WeakRetained;
}

- (NSArray)children
{
  return &self->_children->super;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_children, 0);
}

@end