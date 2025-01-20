@interface HMDHomeInviteLogEvent
+ (id)updateWithInvitationState:(int64_t)a3 isFMFDevice:(BOOL)a4;
+ (id)updateWithState:(int64_t)a3 isFMFDevice:(BOOL)a4;
- (BOOL)accepted;
- (BOOL)declined;
- (BOOL)expired;
- (BOOL)filtered;
- (BOOL)ignored;
- (BOOL)isFMFDevice;
- (BOOL)received;
- (BOOL)suppressedNotification;
- (HMDHomeInviteLogEvent)initWithHomeInviteLogEventState:(int64_t)a3 isFMFDevice:(BOOL)a4;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDHomeInviteLogEvent

- (BOOL)isFMFDevice
{
  return self->_isFMFDevice;
}

- (BOOL)expired
{
  return self->_expired;
}

- (BOOL)ignored
{
  return self->_ignored;
}

- (BOOL)declined
{
  return self->_declined;
}

- (BOOL)accepted
{
  return self->_accepted;
}

- (BOOL)suppressedNotification
{
  return self->_suppressedNotification;
}

- (BOOL)filtered
{
  return self->_filtered;
}

- (BOOL)received
{
  return self->_received;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v21[15] = *MEMORY[0x1E4F143B8];
  v20[0] = @"received_BOOL";
  v19 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeInviteLogEvent received](self, "received"));
  v21[0] = v19;
  v20[1] = @"filtered_BOOL";
  v18 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeInviteLogEvent filtered](self, "filtered"));
  v21[1] = v18;
  v20[2] = @"suppressedNotification_BOOL";
  v17 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeInviteLogEvent suppressedNotification](self, "suppressedNotification"));
  v21[2] = v17;
  v20[3] = @"accepted_BOOL";
  v16 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeInviteLogEvent accepted](self, "accepted"));
  v21[3] = v16;
  v20[4] = @"declined_BOOL";
  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeInviteLogEvent declined](self, "declined"));
  v21[4] = v15;
  v20[5] = @"ignored_BOOL";
  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeInviteLogEvent ignored](self, "ignored"));
  v21[5] = v14;
  v20[6] = @"expired_BOOL";
  v3 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeInviteLogEvent expired](self, "expired"));
  v21[6] = v3;
  v20[7] = @"received_INT";
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeInviteLogEvent received](self, "received"));
  v21[7] = v4;
  v20[8] = @"filtered_INT";
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeInviteLogEvent filtered](self, "filtered"));
  v21[8] = v5;
  v20[9] = @"suppressedNotification_INT";
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeInviteLogEvent suppressedNotification](self, "suppressedNotification"));
  v21[9] = v6;
  v20[10] = @"accepted_INT";
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeInviteLogEvent accepted](self, "accepted"));
  v21[10] = v7;
  v20[11] = @"declined_INT";
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeInviteLogEvent declined](self, "declined"));
  v21[11] = v8;
  v20[12] = @"ignored_INT";
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeInviteLogEvent ignored](self, "ignored"));
  v21[12] = v9;
  v20[13] = @"expired_INT";
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeInviteLogEvent expired](self, "expired"));
  v21[13] = v10;
  v20[14] = @"isFMFDevice";
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeInviteLogEvent isFMFDevice](self, "isFMFDevice"));
  v21[14] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:15];

  return (NSDictionary *)v12;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.receiverHomeInvitationState";
}

- (HMDHomeInviteLogEvent)initWithHomeInviteLogEventState:(int64_t)a3 isFMFDevice:(BOOL)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)HMDHomeInviteLogEvent;
  v6 = [(HMMLogEvent *)&v15 init];
  v7 = v6;
  if (v6)
  {
    v6->_expired = 0;
    v6->_ignored = 0;
    v6->_declined = 0;
    v6->_accepted = 0;
    v6->_suppressedNotification = 0;
    v6->_filtered = 0;
    p_received = &v6->_received;
    v6->_received = 0;
    v6->_isFMFDevice = a4;
    switch(a3)
    {
      case 1:
        goto LABEL_12;
      case 2:
        p_received = &v6->_filtered;
        goto LABEL_12;
      case 3:
        p_received = &v6->_suppressedNotification;
        goto LABEL_12;
      case 4:
        p_received = &v6->_accepted;
        goto LABEL_12;
      case 5:
        p_received = &v6->_declined;
        goto LABEL_12;
      case 6:
        p_received = &v6->_ignored;
        goto LABEL_12;
      case 7:
        p_received = &v6->_expired;
LABEL_12:
        BOOL *p_received = 1;
        break;
      default:
        v9 = (void *)MEMORY[0x1D9452090]();
        v10 = v7;
        v11 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v17 = v12;
          _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@No home invitation event to log. Invitation was cancelled or is pending.", buf, 0xCu);
        }
        v13 = 0;
        goto LABEL_14;
    }
  }
  v13 = v6;
LABEL_14:

  return v13;
}

+ (id)updateWithInvitationState:(int64_t)a3 isFMFDevice:(BOOL)a4
{
  if ((unint64_t)(a3 - 3) > 4) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = qword_1D54D3DF8[a3 - 3];
  }
  v5 = [a1 updateWithState:v4 isFMFDevice:a4];
  return v5;
}

+ (id)updateWithState:(int64_t)a3 isFMFDevice:(BOOL)a4
{
  uint64_t v4 = [[HMDHomeInviteLogEvent alloc] initWithHomeInviteLogEventState:a3 isFMFDevice:a4];
  return v4;
}

@end