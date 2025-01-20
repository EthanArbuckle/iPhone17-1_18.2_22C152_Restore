@interface _APSTopicMove
- (NSString)topic;
- (unint64_t)fromListID;
- (unint64_t)toListID;
- (void)setFromListID:(unint64_t)a3;
- (void)setToListID:(unint64_t)a3;
- (void)setTopic:(id)a3;
@end

@implementation _APSTopicMove

- (void).cxx_destruct
{
}

- (void)setTopic:(id)a3
{
}

- (void)setToListID:(unint64_t)a3
{
  self->_toListID = a3;
}

- (void)setFromListID:(unint64_t)a3
{
  self->_fromListID = a3;
}

- (NSString)topic
{
  return self->_topic;
}

- (unint64_t)toListID
{
  return self->_toListID;
}

- (unint64_t)fromListID
{
  return self->_fromListID;
}

@end