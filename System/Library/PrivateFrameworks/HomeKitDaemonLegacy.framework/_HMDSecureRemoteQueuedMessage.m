@interface _HMDSecureRemoteQueuedMessage
- (HMDRemoteMessage)message;
- (HMFTimer)timer;
- (NSString)propertyDescription;
- (NSString)shortDescription;
- (_HMDSecureRemoteQueuedMessage)init;
- (_HMDSecureRemoteQueuedMessage)initWithMessage:(id)a3;
@end

@implementation _HMDSecureRemoteQueuedMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

- (HMFTimer)timer
{
  return self->_timer;
}

- (HMDRemoteMessage)message
{
  return self->_message;
}

- (NSString)propertyDescription
{
  v2 = NSString;
  v3 = [(_HMDSecureRemoteQueuedMessage *)self message];
  v4 = [v2 stringWithFormat:@", Message = %@", v3];

  return (NSString *)v4;
}

- (NSString)shortDescription
{
  v3 = NSString;
  v4 = [(id)objc_opt_class() shortDescription];
  v5 = [(_HMDSecureRemoteQueuedMessage *)self message];
  v6 = [v5 identifier];
  v7 = [v6 UUIDString];
  v8 = [v3 stringWithFormat:@"%@ %@", v4, v7];

  return (NSString *)v8;
}

- (_HMDSecureRemoteQueuedMessage)initWithMessage:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_HMDSecureRemoteQueuedMessage;
  v6 = [(_HMDSecureRemoteQueuedMessage *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_message, a3);
    [v5 timeout];
    if (v8 <= 0.0)
    {
      double v10 = *(double *)&secureSessionMessageTimeout;
    }
    else
    {
      [v5 timeout];
      double v10 = v9;
    }
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:1 options:v10];
    timer = v7->_timer;
    v7->_timer = (HMFTimer *)v11;
  }
  return v7;
}

- (_HMDSecureRemoteQueuedMessage)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end