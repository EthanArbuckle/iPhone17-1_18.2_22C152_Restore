@interface GDTopicViewTopic
- (GDTopicViewTopic)initWithTopicIdentifier:(id)a3 topicScore:(double)a4 mostRecentDocumentId:(id)a5;
- (NSString)mostRecentDocumentId;
- (NSString)topicIdentifier;
- (double)topicScore;
@end

@implementation GDTopicViewTopic

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentDocumentId, 0);

  objc_storeStrong((id *)&self->_topicIdentifier, 0);
}

- (NSString)mostRecentDocumentId
{
  return self->_mostRecentDocumentId;
}

- (double)topicScore
{
  return self->_topicScore;
}

- (NSString)topicIdentifier
{
  return self->_topicIdentifier;
}

- (GDTopicViewTopic)initWithTopicIdentifier:(id)a3 topicScore:(double)a4 mostRecentDocumentId:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)GDTopicViewTopic;
  v11 = [(GDTopicViewTopic *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_topicIdentifier, a3);
    v12->_topicScore = a4;
    objc_storeStrong((id *)&v12->_mostRecentDocumentId, a5);
  }

  return v12;
}

@end