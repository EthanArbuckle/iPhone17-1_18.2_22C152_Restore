@interface _ACCNowPlayingPBQUpdateRequestAccessory
- (NSString)accessoryUID;
- (NSString)currentRequestID;
- (OS_dispatch_queue)queue;
- (_ACCNowPlayingPBQUpdateRequest)currentRequest;
- (_ACCNowPlayingPBQUpdateRequestAccessory)initWithAccessoryUID:(id)a3;
- (id)description;
- (void)dealloc;
- (void)setCurrentRequest:(id)a3;
- (void)setCurrentRequestID:(id)a3;
@end

@implementation _ACCNowPlayingPBQUpdateRequestAccessory

- (_ACCNowPlayingPBQUpdateRequestAccessory)initWithAccessoryUID:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_ACCNowPlayingPBQUpdateRequestAccessory;
  v6 = [(_ACCNowPlayingPBQUpdateRequestAccessory *)&v12 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.accessory.nowplaying.pbqupdate", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_accessoryUID, a3);
    currentRequestID = v6->_currentRequestID;
    v6->_currentRequestID = 0;

    currentRequest = v6->_currentRequest;
    v6->_currentRequest = 0;
  }
  return v6;
}

- (void)dealloc
{
  accessoryUID = self->_accessoryUID;
  self->_accessoryUID = 0;

  queue = self->_queue;
  self->_queue = 0;

  currentRequestID = self->_currentRequestID;
  self->_currentRequestID = 0;

  currentRequest = self->_currentRequest;
  self->_currentRequest = 0;

  v7.receiver = self;
  v7.super_class = (Class)_ACCNowPlayingPBQUpdateRequestAccessory;
  [(_ACCNowPlayingPBQUpdateRequestAccessory *)&v7 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<_ACCNowPlayingPBQUpdateRequestAccessory %@>[currentRequest:ID=%@ request=(%@)]", self->_accessoryUID, self->_currentRequestID, self->_currentRequest];
}

- (NSString)accessoryUID
{
  return self->_accessoryUID;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)currentRequestID
{
  return self->_currentRequestID;
}

- (void)setCurrentRequestID:(id)a3
{
}

- (_ACCNowPlayingPBQUpdateRequest)currentRequest
{
  return self->_currentRequest;
}

- (void)setCurrentRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_currentRequestID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_accessoryUID, 0);
}

@end