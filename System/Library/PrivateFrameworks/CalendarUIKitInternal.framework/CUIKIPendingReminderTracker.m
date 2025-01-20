@interface CUIKIPendingReminderTracker
- (CUIKIPendingReminderTracker)initWithEventStore:(id)a3;
- (id)impl;
- (id)optimisticReminderForEvent:(id)a3;
- (void)addPendingEvent:(id)a3 sequenceNumber:(int)a4;
- (void)setOptimisticReminder:(id)a3 forEvent:(id)a4 sequenceNumber:(int)a5;
@end

@implementation CUIKIPendingReminderTracker

- (CUIKIPendingReminderTracker)initWithEventStore:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CUIKIPendingReminderTracker;
  v5 = [(CUIKIPendingReminderTracker *)&v9 init];
  if (v5)
  {
    v6 = [[_TtC21CalendarUIKitInternal22PendingReminderTracker alloc] initWithEventStore:v4];
    impl = v5->_impl;
    v5->_impl = v6;
  }
  return v5;
}

- (id)impl
{
  return self->_impl;
}

- (void)addPendingEvent:(id)a3 sequenceNumber:(int)a4
{
}

- (void)setOptimisticReminder:(id)a3 forEvent:(id)a4 sequenceNumber:(int)a5
{
}

- (id)optimisticReminderForEvent:(id)a3
{
  return [(PendingReminderTracker *)self->_impl optimisticReminderFor:a3];
}

- (void).cxx_destruct
{
}

@end