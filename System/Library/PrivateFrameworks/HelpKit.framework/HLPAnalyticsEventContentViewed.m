@interface HLPAnalyticsEventContentViewed
+ (id)eventWithTopicID:(id)a3 topicTitle:(id)a4 source:(id)a5 interfaceStyle:(int64_t)a6;
- (NSString)externalURLString;
- (NSString)fromTopicID;
- (NSString)source;
- (NSString)topicID;
- (NSString)topicTitle;
- (NSString)viewMode;
- (id)_initWithTopicID:(id)a3 topicTitle:(id)a4 source:(id)a5 interfaceStyle:(int64_t)a6;
- (id)caRepresentation;
- (id)eventName;
- (unint64_t)viewNum;
- (void)log;
- (void)setExternalURLString:(id)a3;
- (void)setFromTopicID:(id)a3;
- (void)setSource:(id)a3;
- (void)setTopicID:(id)a3;
- (void)setTopicTitle:(id)a3;
- (void)setViewMode:(id)a3;
- (void)setViewNum:(unint64_t)a3;
@end

@implementation HLPAnalyticsEventContentViewed

- (id)_initWithTopicID:(id)a3 topicTitle:(id)a4 source:(id)a5 interfaceStyle:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HLPAnalyticsEventContentViewed;
  v14 = [(HLPAnalyticsEventContentViewed *)&v19 init];
  p_isa = (id *)&v14->super.super.isa;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_topicID, a3);
    objc_storeStrong(p_isa + 4, a4);
    objc_storeStrong(p_isa + 5, a5);
    v16 = @"unspecified";
    if (a6 == 1) {
      v16 = @"light";
    }
    if (a6 == 2) {
      v17 = @"dark";
    }
    else {
      v17 = v16;
    }
    objc_storeStrong(p_isa + 6, v17);
  }

  return p_isa;
}

+ (id)eventWithTopicID:(id)a3 topicTitle:(id)a4 source:(id)a5 interfaceStyle:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = (void *)[objc_alloc((Class)a1) _initWithTopicID:v12 topicTitle:v11 source:v10 interfaceStyle:a6];

  return v13;
}

- (void)log
{
  v3 = +[HLPAnalyticsEventController sharedInstance];
  [v3 incrementCounterForKey:@"content_viewed_counter"];

  v4.receiver = self;
  v4.super_class = (Class)HLPAnalyticsEventContentViewed;
  [(HLPAnalyticsEvent *)&v4 log];
}

- (id)eventName
{
  return @"ContentViewed";
}

- (id)caRepresentation
{
  v16.receiver = self;
  v16.super_class = (Class)HLPAnalyticsEventContentViewed;
  v3 = [(HLPAnalyticsEvent *)&v16 caRepresentation];
  objc_super v4 = (void *)[v3 mutableCopy];

  v5 = [(HLPAnalyticsEventContentViewed *)self source];
  [v4 setObject:v5 forKeyedSubscript:@"view_src"];

  v6 = [(HLPAnalyticsEventContentViewed *)self viewMode];
  [v4 setObject:v6 forKeyedSubscript:@"mode"];

  v7 = [(HLPAnalyticsEventContentViewed *)self topicID];
  [v4 setObject:v7 forKeyedSubscript:@"topic_ID"];

  v8 = [(HLPAnalyticsEventContentViewed *)self topicTitle];
  [v4 setObject:v8 forKeyedSubscript:@"topic_title"];

  v9 = [(HLPAnalyticsEventContentViewed *)self fromTopicID];

  if (v9)
  {
    id v10 = [(HLPAnalyticsEventContentViewed *)self fromTopicID];
    [v4 setObject:v10 forKeyedSubscript:@"from_topic_ID"];
  }
  id v11 = [(HLPAnalyticsEventContentViewed *)self externalURLString];

  if (v11)
  {
    id v12 = [(HLPAnalyticsEventContentViewed *)self externalURLString];
    [v4 setObject:v12 forKeyedSubscript:@"external_link"];
  }
  id v13 = +[HLPAnalyticsEventController sharedInstance];
  v14 = [v13 counterForKey:@"content_viewed_counter"];
  [v4 setObject:v14 forKeyedSubscript:@"session_view_num"];

  return v4;
}

- (NSString)externalURLString
{
  return self->_externalURLString;
}

- (void)setExternalURLString:(id)a3
{
}

- (NSString)fromTopicID
{
  return self->_fromTopicID;
}

- (void)setFromTopicID:(id)a3
{
}

- (NSString)topicID
{
  return self->_topicID;
}

- (void)setTopicID:(id)a3
{
}

- (NSString)topicTitle
{
  return self->_topicTitle;
}

- (void)setTopicTitle:(id)a3
{
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (NSString)viewMode
{
  return self->_viewMode;
}

- (void)setViewMode:(id)a3
{
}

- (unint64_t)viewNum
{
  return self->_viewNum;
}

- (void)setViewNum:(unint64_t)a3
{
  self->_viewNum = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewMode, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_topicTitle, 0);
  objc_storeStrong((id *)&self->_topicID, 0);
  objc_storeStrong((id *)&self->_fromTopicID, 0);
  objc_storeStrong((id *)&self->_externalURLString, 0);
}

@end