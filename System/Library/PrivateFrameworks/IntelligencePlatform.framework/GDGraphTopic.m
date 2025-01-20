@interface GDGraphTopic
- (GDGraphTopic)initWithEntityIdentifierField:(id)a3 qidField:(id)a4 allQidField:(id)a5;
- (GDGraphTopicEntityIdentifier)entityIdentifier;
- (NSArray)allQid;
- (NSString)qid;
@end

@implementation GDGraphTopic

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allQid, 0);
  objc_storeStrong((id *)&self->_qid, 0);

  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (NSArray)allQid
{
  return self->_allQid;
}

- (NSString)qid
{
  return self->_qid;
}

- (GDGraphTopicEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (GDGraphTopic)initWithEntityIdentifierField:(id)a3 qidField:(id)a4 allQidField:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)GDGraphTopic;
  v12 = [(GDGraphTopic *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_entityIdentifier, a3);
    objc_storeStrong((id *)&v13->_qid, a4);
    objc_storeStrong((id *)&v13->_allQid, a5);
  }

  return v13;
}

@end