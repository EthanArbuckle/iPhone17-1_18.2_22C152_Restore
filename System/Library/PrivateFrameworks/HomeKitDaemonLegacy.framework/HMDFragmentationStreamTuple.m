@interface HMDFragmentationStreamTuple
+ (id)tupleWithFragmentationStreamForObject:(id)a3 delegate:(id)a4;
- (BOOL)isExpired;
- (HAPFragmentationStream)fragmentationStream;
- (HMDFragmentationStreamTuple)initWithFragmentationStreamForObject:(id)a3 delegate:(id)a4;
- (HMFMessage)lastMessage;
- (NSDate)expirationDate;
- (NSString)objectUUID;
- (void)close;
- (void)setLastMessage:(id)a3;
@end

@implementation HMDFragmentationStreamTuple

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_lastMessage, 0);
  objc_storeStrong((id *)&self->_objectUUID, 0);
  objc_storeStrong((id *)&self->_fragmentationStream, 0);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (HMFMessage)lastMessage
{
  return self->_lastMessage;
}

- (NSString)objectUUID
{
  return self->_objectUUID;
}

- (HAPFragmentationStream)fragmentationStream
{
  return self->_fragmentationStream;
}

- (void)close
{
  id v2 = [(HMDFragmentationStreamTuple *)self fragmentationStream];
  [v2 close];
}

- (BOOL)isExpired
{
  id v2 = [(HMDFragmentationStreamTuple *)self expirationDate];
  [v2 timeIntervalSinceNow];
  BOOL v4 = v3 < 0.0;

  return v4;
}

- (void)setLastMessage:(id)a3
{
  objc_storeStrong((id *)&self->_lastMessage, a3);
  id v7 = a3;
  v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:300.0];
  expirationDate = self->_expirationDate;
  self->_expirationDate = v5;
}

- (HMDFragmentationStreamTuple)initWithFragmentationStreamForObject:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMDFragmentationStreamTuple;
  v9 = [(HMDFragmentationStreamTuple *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_objectUUID, a3);
    v11 = (HAPFragmentationStream *)objc_alloc_init(MEMORY[0x1E4F5BD58]);
    fragmentationStream = v10->_fragmentationStream;
    v10->_fragmentationStream = v11;

    [(HAPFragmentationStream *)v10->_fragmentationStream setDelegate:v8];
    [(HAPFragmentationStream *)v10->_fragmentationStream open];
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:300.0];
    expirationDate = v10->_expirationDate;
    v10->_expirationDate = (NSDate *)v13;
  }
  return v10;
}

+ (id)tupleWithFragmentationStreamForObject:(id)a3 delegate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[HMDFragmentationStreamTuple alloc] initWithFragmentationStreamForObject:v6 delegate:v5];

  return v7;
}

@end