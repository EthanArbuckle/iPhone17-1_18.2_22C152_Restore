@interface NSPortMessage
- (BOOL)sendBeforeDate:(NSDate *)date;
- (NSArray)components;
- (NSPort)receivePort;
- (NSPort)sendPort;
- (NSPortMessage)initWithReceivePort:(id)a3 sendPort:(id)a4 components:(id)a5;
- (NSPortMessage)initWithSendPort:(NSPort *)sendPort receivePort:(NSPort *)replyPort components:(NSArray *)components;
- (uint32_t)msgid;
- (void)dealloc;
- (void)setMsgid:(uint32_t)msgid;
@end

@implementation NSPortMessage

- (NSPortMessage)initWithSendPort:(NSPort *)sendPort receivePort:(NSPort *)replyPort components:(NSArray *)components
{
  self->localPort = replyPort;
  self->remotePort = sendPort;
  self->components = (NSMutableArray *)components;
  return self;
}

- (NSPortMessage)initWithReceivePort:(id)a3 sendPort:(id)a4 components:(id)a5
{
  return [(NSPortMessage *)self initWithSendPort:a4 receivePort:a3 components:a5];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSPortMessage;
  [(NSPortMessage *)&v3 dealloc];
}

- (NSPort)sendPort
{
  v2 = self->remotePort;

  return v2;
}

- (NSPort)receivePort
{
  v2 = self->localPort;

  return v2;
}

- (uint32_t)msgid
{
  return self->msgid;
}

- (void)setMsgid:(uint32_t)msgid
{
  self->msgid = msgid;
}

- (NSArray)components
{
  v2 = self->components;

  return (NSArray *)v2;
}

- (BOOL)sendBeforeDate:(NSDate *)date
{
  return [(NSPort *)self->remotePort sendBeforeDate:date msgid:self->msgid components:self->components from:self->localPort reserved:0];
}

@end