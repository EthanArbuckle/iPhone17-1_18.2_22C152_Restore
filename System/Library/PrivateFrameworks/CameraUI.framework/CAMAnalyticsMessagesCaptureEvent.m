@interface CAMAnalyticsMessagesCaptureEvent
- (CAMAnalyticsMessagesCaptureEvent)init;
- (id)eventName;
- (void)populateFromReviewAsset:(id)a3 withSourceType:(unint64_t)a4;
@end

@implementation CAMAnalyticsMessagesCaptureEvent

- (CAMAnalyticsMessagesCaptureEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)CAMAnalyticsMessagesCaptureEvent;
  v2 = [(CAMAnalyticsEvent *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)populateFromReviewAsset:(id)a3 withSourceType:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(CAMAnalyticsEvent *)self _eventMap];
  id v13 = v7;
  v8 = @"MessagesCamera";
  if (a4 != 2) {
    v8 = 0;
  }
  if (a4 == 4) {
    v9 = @"FunCam";
  }
  else {
    v9 = v8;
  }
  [v7 setObject:v9 forKeyedSubscript:@"Origin"];
  uint64_t v10 = [v6 mediaType];

  v11 = @"Photo";
  if (v10 != 1) {
    v11 = 0;
  }
  if (v10 == 2) {
    v12 = @"Video";
  }
  else {
    v12 = v11;
  }
  [v13 setObject:v12 forKeyedSubscript:@"CaptureType"];
}

- (id)eventName
{
  return @"messages.capture";
}

@end