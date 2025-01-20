@interface APSTTLCollectionItemInfo
- (APSTTLCollectionItemInfo)initWithTTLInSeconds:(double)a3 state:(unsigned int)a4;
- (APSTTLCollectionItemInfo)initWithTTLInSeconds:(double)a3 state:(unsigned int)a4 withTopic:(id)a5;
- (NSDate)evictionDate;
- (NSString)topic;
- (id)description;
- (unsigned)itemState;
- (void)setEvictionDate:(id)a3;
- (void)setItemState:(unsigned int)a3;
- (void)setTopic:(id)a3;
@end

@implementation APSTTLCollectionItemInfo

- (APSTTLCollectionItemInfo)initWithTTLInSeconds:(double)a3 state:(unsigned int)a4
{
  return [(APSTTLCollectionItemInfo *)self initWithTTLInSeconds:*(void *)&a4 state:0 withTopic:a3];
}

- (APSTTLCollectionItemInfo)initWithTTLInSeconds:(double)a3 state:(unsigned int)a4 withTopic:(id)a5
{
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)APSTTLCollectionItemInfo;
  v10 = [(APSTTLCollectionItemInfo *)&v14 init];
  if (v10)
  {
    v11 = (NSDate *)[objc_alloc((Class)NSDate) initWithTimeIntervalSinceNow:a3];
    evictionDate = v10->_evictionDate;
    v10->_evictionDate = v11;

    v10->_itemState = a4;
    objc_storeStrong((id *)&v10->_topic, a5);
  }

  return v10;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@: %p> eviction date: %@, topic:%@", objc_opt_class(), self, self->_evictionDate, self->_topic];
}

- (NSDate)evictionDate
{
  return self->_evictionDate;
}

- (void)setEvictionDate:(id)a3
{
}

- (unsigned)itemState
{
  return self->_itemState;
}

- (void)setItemState:(unsigned int)a3
{
  self->_itemState = a3;
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_evictionDate, 0);
}

@end