@interface HUHomeStatusDetailsItemAndPriorityTuple
- (HFItem)item;
- (HUHomeStatusDetailsItemAndPriorityTuple)initWithItem:(id)a3 priority:(int64_t)a4;
- (int64_t)priority;
- (void)setItem:(id)a3;
- (void)setPriority:(int64_t)a3;
@end

@implementation HUHomeStatusDetailsItemAndPriorityTuple

- (HUHomeStatusDetailsItemAndPriorityTuple)initWithItem:(id)a3 priority:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUHomeStatusDetailsItemAndPriorityTuple;
  v7 = [(HUHomeStatusDetailsItemAndPriorityTuple *)&v10 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_item, v6);
    v8->_priority = a4;
  }

  return v8;
}

- (HFItem)item
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);

  return (HFItem *)WeakRetained;
}

- (void)setItem:(id)a3
{
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (void).cxx_destruct
{
}

@end