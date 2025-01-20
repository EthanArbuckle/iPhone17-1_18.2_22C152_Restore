@interface HMEThreadSafePendingEventsCollection
- (BOOL)hasEventItem;
- (BOOL)isFinishedAddingItems;
- (HMEThreadSafePendingEventsCollection)initWithEvents:(id)a3;
- (HMEThreadSafePendingEventsCollectionDelegate)delegate;
- (id)eventItems;
- (id)popEventItemsUpWithFragments:(BOOL)a3 toSizeInBytes:(unint64_t)a4 usedBytes:(unint64_t *)a5;
- (void)addEventInfo:(id)a3;
- (void)addEventInfoItems:(id)a3;
- (void)combinePreviousEvents:(id)a3;
- (void)didFinishAddingAdditionalEvents;
- (void)resetItems;
- (void)setDelegate:(id)a3;
- (void)setIsFinishedAddingItems:(BOOL)a3;
- (void)willAddAdditionalEvents;
@end

@implementation HMEThreadSafePendingEventsCollection

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (HMEThreadSafePendingEventsCollectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMEThreadSafePendingEventsCollectionDelegate *)WeakRetained;
}

- (void)setIsFinishedAddingItems:(BOOL)a3
{
  self->_isFinishedAddingItems = a3;
}

- (void)resetItems
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4.receiver = self;
  v4.super_class = (Class)HMEThreadSafePendingEventsCollection;
  [(HMEPendingEventsCollection *)&v4 resetItems];
  os_unfair_lock_unlock(p_lock);
}

- (id)popEventItemsUpWithFragments:(BOOL)a3 toSizeInBytes:(unint64_t)a4 usedBytes:(unint64_t *)a5
{
  BOOL v7 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v12.receiver = self;
  v12.super_class = (Class)HMEThreadSafePendingEventsCollection;
  v10 = [(HMEPendingEventsCollection *)&v12 popEventItemsUpWithFragments:v7 toSizeInBytes:a4 usedBytes:a5];
  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (BOOL)hasEventItem
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5.receiver = v2;
  v5.super_class = (Class)HMEThreadSafePendingEventsCollection;
  LOBYTE(v2) = [(HMEPendingEventsCollection *)&v5 hasEventItem];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)addEventInfoItems:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v7.receiver = self;
  v7.super_class = (Class)HMEThreadSafePendingEventsCollection;
  [(HMEPendingEventsCollection *)&v7 addEventInfoItems:v5];

  os_unfair_lock_unlock(p_lock);
  v6 = [(HMEThreadSafePendingEventsCollection *)self delegate];
  [v6 pendingEventsCollectionDidAddItems:self];
}

- (void)addEventInfo:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v7.receiver = self;
  v7.super_class = (Class)HMEThreadSafePendingEventsCollection;
  [(HMEPendingEventsCollection *)&v7 addEventInfo:v5];

  os_unfair_lock_unlock(p_lock);
  v6 = [(HMEThreadSafePendingEventsCollection *)self delegate];
  [v6 pendingEventsCollectionDidAddItems:self];
}

- (void)combinePreviousEvents:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v7.receiver = self;
  v7.super_class = (Class)HMEThreadSafePendingEventsCollection;
  [(HMEPendingEventsCollection *)&v7 combinePreviousEvents:v5];

  os_unfair_lock_unlock(p_lock);
  v6 = [(HMEThreadSafePendingEventsCollection *)self delegate];
  [v6 pendingEventsCollectionDidAddItems:self];
}

- (BOOL)isFinishedAddingItems
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_expectedEventAdditionCount == 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)didFinishAddingAdditionalEvents
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t v4 = self->_expectedEventAdditionCount - 1;
  self->_expectedEventAdditionCount = v4;
  os_unfair_lock_unlock(p_lock);
  if (!v4)
  {
    id v5 = [(HMEThreadSafePendingEventsCollection *)self delegate];
    [v5 pendingEventCollectionDidComplete:self];
  }
}

- (void)willAddAdditionalEvents
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  ++self->_expectedEventAdditionCount;
  os_unfair_lock_unlock(p_lock);
}

- (HMEThreadSafePendingEventsCollection)initWithEvents:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMEThreadSafePendingEventsCollection;
  result = [(HMEPendingEventsCollection *)&v4 initWithEvents:a3];
  if (result)
  {
    result->_lock._os_unfair_lock_opaque = 0;
    result->_expectedEventAdditionCount = 0;
  }
  return result;
}

- (id)eventItems
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6.receiver = self;
  v6.super_class = (Class)HMEThreadSafePendingEventsCollection;
  objc_super v4 = [(HMEPendingEventsCollection *)&v6 eventItems];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

@end