@interface GDPersonEntityTaggingStatefulFeedback
- (GDPersonEntityTagEventIDSet)eventIds;
- (GDPersonEntityTaggingStatefulFeedback)initWithStatefulFeedbackType:(int64_t)a3 eventIds:(id)a4;
- (int64_t)feedbackType;
@end

@implementation GDPersonEntityTaggingStatefulFeedback

- (void).cxx_destruct
{
}

- (GDPersonEntityTagEventIDSet)eventIds
{
  return self->_eventIds;
}

- (int64_t)feedbackType
{
  return self->_feedbackType;
}

- (GDPersonEntityTaggingStatefulFeedback)initWithStatefulFeedbackType:(int64_t)a3 eventIds:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GDPersonEntityTaggingStatefulFeedback;
  v8 = [(GDPersonEntityTaggingStatefulFeedback *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_feedbackType = a3;
    objc_storeStrong((id *)&v8->_eventIds, a4);
  }

  return v9;
}

@end