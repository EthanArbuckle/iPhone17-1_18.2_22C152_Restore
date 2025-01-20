@interface VCControlChannel
- (BOOL)sendReliableMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5 timeout:(unsigned int)a6 completion:(id)a7;
- (BOOL)sendReliableMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5 timeout:(unsigned int)a6 withOptions:(id)a7 completion:(id)a8;
- (BOOL)sendReliableMessageAndWait:(id)a3 withTopic:(id)a4;
- (BOOL)sendReliableMessageAndWait:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5;
- (VCControlChannel)init;
- (id)dataReceivedDelegate;
- (id)messageReceivedDelegate;
- (unsigned)reliableMessageResendInterval;
- (void)addOptionalTopic:(id)a3;
- (void)dealloc;
- (void)flushActiveMessages;
- (void)sendReliableMessage:(id)a3 withTopic:(id)a4;
- (void)sendReliableMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5;
- (void)sendUnreliableMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5;
- (void)setDataReceivedDelegate:(id)a3;
- (void)setEncryptionWithEncryptionMaterial:(id *)a3;
- (void)setMessageReceivedDelegate:(id)a3;
- (void)throwNotSupportedExceptionForMethod:(id)a3;
@end

@implementation VCControlChannel

- (VCControlChannel)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCControlChannel;
  v2 = [(VCObject *)&v5 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_USER_INITIATED, 0);
    v2->_asyncProcessingQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AVConference.VCControlChannel.AsyncProcessingQueue", v3);
    v2->_reliableMessageResendInterval = 9;
    v2->_optionalTopics = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v2;
}

- (void)setMessageReceivedDelegate:(id)a3
{
}

- (id)messageReceivedDelegate
{
  return objc_loadWeak(&self->_messageReceivedDelegate);
}

- (void)setDataReceivedDelegate:(id)a3
{
}

- (id)dataReceivedDelegate
{
  return objc_loadWeak(&self->_dataReceivedDelegate);
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];

  objc_storeWeak(&self->_messageReceivedDelegate, 0);
  objc_storeWeak(&self->_dataReceivedDelegate, 0);
  asyncProcessingQueue = self->_asyncProcessingQueue;
  if (asyncProcessingQueue) {
    dispatch_release(asyncProcessingQueue);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCControlChannel;
  [(VCObject *)&v4 dealloc];
}

- (void)addOptionalTopic:(id)a3
{
}

- (void)flushActiveMessages
{
}

- (void)throwNotSupportedExceptionForMethod:(id)a3
{
  uint64_t v3 = [NSString stringWithFormat:@"Not supported method %@", a3];
  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:v3 reason:@"Class VCControlChannel should not be instantiated directly. Use VCControlChannelFaceTime or VCControlChannelMultiWay instead." userInfo:0]);
}

- (BOOL)sendReliableMessageAndWait:(id)a3 withTopic:(id)a4
{
  return 0;
}

- (void)sendReliableMessage:(id)a3 withTopic:(id)a4
{
}

- (BOOL)sendReliableMessageAndWait:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5
{
  return 0;
}

- (void)sendReliableMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5
{
}

- (BOOL)sendReliableMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5 timeout:(unsigned int)a6 completion:(id)a7
{
  return 0;
}

- (BOOL)sendReliableMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5 timeout:(unsigned int)a6 withOptions:(id)a7 completion:(id)a8
{
  return 0;
}

- (void)sendUnreliableMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5
{
}

- (void)setEncryptionWithEncryptionMaterial:(id *)a3
{
}

- (unsigned)reliableMessageResendInterval
{
  return self->_reliableMessageResendInterval;
}

@end