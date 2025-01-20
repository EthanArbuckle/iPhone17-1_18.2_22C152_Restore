@interface AVOutputDeviceGroupMembershipChangeResult
- (AVOutputDeviceGroupMembershipChangeResult)initWithStatus:(int64_t)a3 cancellationReason:(id)a4;
- (NSString)cancellationReason;
- (int64_t)status;
- (void)dealloc;
@end

@implementation AVOutputDeviceGroupMembershipChangeResult

- (AVOutputDeviceGroupMembershipChangeResult)initWithStatus:(int64_t)a3 cancellationReason:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)AVOutputDeviceGroupMembershipChangeResult;
  v6 = [(AVOutputDeviceGroupMembershipChangeResult *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_status = a3;
    v6->_cancellationReason = (NSString *)[a4 copy];
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVOutputDeviceGroupMembershipChangeResult;
  [(AVOutputDeviceGroupMembershipChangeResult *)&v3 dealloc];
}

- (int64_t)status
{
  return self->_status;
}

- (NSString)cancellationReason
{
  return self->_cancellationReason;
}

@end