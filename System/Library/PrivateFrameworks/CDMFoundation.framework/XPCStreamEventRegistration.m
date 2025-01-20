@interface XPCStreamEventRegistration
+ (id)registrationWithStream:(id)a3 eventName:(id)a4 dagServiceClass:(Class)a5;
- (Class)dagServiceClass;
- (NSString)eventName;
- (NSString)streamName;
- (id)_initWithStream:(id)a3 eventName:(id)a4 dagServiceClass:(Class)a5;
- (void)invoke:(id)a3 fromStream:(id)a4 withAssets:(id)a5 withSelfMetadata:(id)a6;
@end

@implementation XPCStreamEventRegistration

- (NSString)streamName
{
  return self->_streamName;
}

- (NSString)eventName
{
  return self->_eventName;
}

+ (id)registrationWithStream:(id)a3 eventName:(id)a4 dagServiceClass:(Class)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[XPCStreamEventRegistration alloc] _initWithStream:v8 eventName:v7 dagServiceClass:a5];

  return v9;
}

- (id)_initWithStream:(id)a3 eventName:(id)a4 dagServiceClass:(Class)a5
{
  id v8 = (NSString *)a3;
  id v9 = (NSString *)a4;
  v16.receiver = self;
  v16.super_class = (Class)XPCStreamEventRegistration;
  v10 = [(XPCStreamEventRegistration *)&v16 init];
  streamName = v10->_streamName;
  v10->_streamName = v8;
  v12 = v8;

  eventName = v10->_eventName;
  v10->_eventName = v9;
  v14 = v9;

  objc_storeStrong((id *)&v10->_dagServiceClass, a5);
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dagServiceClass, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_streamName, 0);
}

- (Class)dagServiceClass
{
  return self->_dagServiceClass;
}

- (void)invoke:(id)a3 fromStream:(id)a4 withAssets:(id)a5 withSelfMetadata:(id)a6
{
  id v13 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (objc_opt_respondsToSelector()) {
    [(objc_class *)self->_dagServiceClass handleXPCEvent:v13 fromStream:v10 withAssets:v11 withSelfMetadata:v12];
  }
}

@end