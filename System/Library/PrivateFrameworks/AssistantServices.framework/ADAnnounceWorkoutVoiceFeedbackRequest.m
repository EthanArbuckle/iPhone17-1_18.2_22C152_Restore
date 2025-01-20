@interface ADAnnounceWorkoutVoiceFeedbackRequest
- (ADAnnounceWorkoutVoiceFeedbackRequest)initWithVoiceFeedbackData:(id)a3 completion:(id)a4;
- (NSDictionary)data;
- (void)setData:(id)a3;
@end

@implementation ADAnnounceWorkoutVoiceFeedbackRequest

- (void).cxx_destruct
{
}

- (void)setData:(id)a3
{
}

- (NSDictionary)data
{
  return self->_data;
}

- (ADAnnounceWorkoutVoiceFeedbackRequest)initWithVoiceFeedbackData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ADAnnounceWorkoutVoiceFeedbackRequest;
  v7 = [(ADAnnouncementRequest *)&v11 initWithAnnouncementRequestType:1 platform:4 completion:a4];
  if (v7)
  {
    v8 = (NSDictionary *)[v6 copy];
    data = v7->_data;
    v7->_data = v8;

    [(ADAnnounceNotificationRequest *)v7 setAnnouncementType:9];
    [(ADAnnouncementRequest *)v7 setShouldSkipTriggerlessReply:1];
    [(ADAnnouncementRequest *)v7 setRequiresOpportuneTime:0];
  }

  return v7;
}

@end