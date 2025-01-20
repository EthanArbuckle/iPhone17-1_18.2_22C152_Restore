@interface BWNodeConfigurationLiveMessage
+ (id)newMessageWithConfigurationID:(int64_t)a3;
+ (id)newMessageWithConfigurationID:(int64_t)a3 updatedFormat:(id)a4;
- (BWFormat)updatedFormat;
- (int64_t)configurationID;
- (void)_initWithConfigurationID:(void *)a3 updatedFormat:;
- (void)dealloc;
@end

@implementation BWNodeConfigurationLiveMessage

- (void)_initWithConfigurationID:(void *)a3 updatedFormat:
{
  if (!a1) {
    return 0;
  }
  v8.receiver = a1;
  v8.super_class = (Class)BWNodeConfigurationLiveMessage;
  v5 = objc_msgSendSuper2(&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5[1] = 0x300000001;
    v5[2] = a2;
    v5[3] = a3;
  }
  return v6;
}

+ (id)newMessageWithConfigurationID:(int64_t)a3 updatedFormat:(id)a4
{
  v6 = [BWNodeConfigurationLiveMessage alloc];
  return -[BWNodeConfigurationLiveMessage _initWithConfigurationID:updatedFormat:](v6, a3, a4);
}

- (BWFormat)updatedFormat
{
  return self->_updatedFormat;
}

- (int64_t)configurationID
{
  return self->_configurationID;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWNodeConfigurationLiveMessage;
  [(BWNodeConfigurationLiveMessage *)&v3 dealloc];
}

+ (id)newMessageWithConfigurationID:(int64_t)a3
{
  v4 = [BWNodeConfigurationLiveMessage alloc];
  return -[BWNodeConfigurationLiveMessage _initWithConfigurationID:updatedFormat:](v4, a3, 0);
}

@end