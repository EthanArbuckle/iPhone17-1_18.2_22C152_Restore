@interface IDSCoalesceMessageQueue
- (BOOL)isEmpty;
- (IDSCoalesceMessageQueue)initWithTopic:(id)a3 sendMode:(id)a4;
- (NSMutableArray)infos;
- (NSNumber)sendMode;
- (NSString)topic;
- (unint64_t)count;
- (void)setInfos:(id)a3;
- (void)setSendMode:(id)a3;
- (void)setTopic:(id)a3;
@end

@implementation IDSCoalesceMessageQueue

- (IDSCoalesceMessageQueue)initWithTopic:(id)a3 sendMode:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSCoalesceMessageQueue;
  v9 = [(IDSCoalesceMessageQueue *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_topic, a3);
    objc_storeStrong((id *)&v10->_sendMode, a4);
  }

  return v10;
}

- (BOOL)isEmpty
{
  v2 = [(IDSCoalesceMessageQueue *)self infos];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (unint64_t)count
{
  v2 = [(IDSCoalesceMessageQueue *)self infos];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
}

- (NSNumber)sendMode
{
  return self->_sendMode;
}

- (void)setSendMode:(id)a3
{
}

- (NSMutableArray)infos
{
  return self->_infos;
}

- (void)setInfos:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infos, 0);
  objc_storeStrong((id *)&self->_sendMode, 0);

  objc_storeStrong((id *)&self->_topic, 0);
}

@end