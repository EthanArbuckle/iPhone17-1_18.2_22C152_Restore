@interface HFMutablePriorityQueueEntry
- (HFMutablePriorityQueueEntry)initWithValue:(id)a3;
- (HFMutablePriorityQueueEntry)initWithValue:(id)a3 priority:(int64_t)a4;
- (id)value;
- (unint64_t)priority;
- (void)setPriority:(unint64_t)a3;
@end

@implementation HFMutablePriorityQueueEntry

- (unint64_t)priority
{
  return self->_priority;
}

- (void).cxx_destruct
{
}

- (HFMutablePriorityQueueEntry)initWithValue:(id)a3 priority:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFMutablePriorityQueueEntry;
  v8 = [(HFMutablePriorityQueueEntry *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_value, a3);
    v9->_priority = a4;
  }

  return v9;
}

- (HFMutablePriorityQueueEntry)initWithValue:(id)a3
{
  return [(HFMutablePriorityQueueEntry *)self initWithValue:a3 priority:0];
}

- (id)value
{
  return self->_value;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

@end