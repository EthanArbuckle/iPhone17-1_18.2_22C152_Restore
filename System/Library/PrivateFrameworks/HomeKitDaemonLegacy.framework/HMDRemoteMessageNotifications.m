@interface HMDRemoteMessageNotifications
+ (BOOL)messageExpectsNotificationResponse:(id)a3;
+ (id)messagesWithNotificationResponses;
+ (void)initialize;
- (HMDRemoteMessageNotifications)init;
- (NSMapTable)sessionNotificationPayloads;
- (id)_notificationPayloadsForDevice:(id)a3;
- (id)description;
- (id)notificationPayloadWithIdentifier:(id)a3 device:(id)a4;
- (void)addNotificationPayload:(id)a3 identifier:(id)a4 device:(id)a5;
- (void)clearNotificationsForDevice:(id)a3;
- (void)removeNotificationPayloadWithIdentifier:(id)a3 device:(id)a4;
- (void)setSessionNotificationPayloads:(id)a3;
@end

@implementation HMDRemoteMessageNotifications

- (void).cxx_destruct
{
}

- (void)setSessionNotificationPayloads:(id)a3
{
}

- (NSMapTable)sessionNotificationPayloads
{
  return self->_sessionNotificationPayloads;
}

- (id)description
{
  v2 = NSString;
  v3 = [(HMDRemoteMessageNotifications *)self sessionNotificationPayloads];
  v4 = [v2 stringWithFormat:@"Session notifications: %@", v3];

  return v4;
}

- (void)clearNotificationsForDevice:(id)a3
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = [(HMDRemoteMessageNotifications *)self sessionNotificationPayloads];
  [v5 removeObjectForKey:v6];

  os_unfair_lock_unlock(&p_lock->lock);
}

- (id)notificationPayloadWithIdentifier:(id)a3 device:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v9 = [(HMDRemoteMessageNotifications *)self _notificationPayloadsForDevice:v7];
  v10 = [v9 objectForKeyedSubscript:v6];

  os_unfair_lock_unlock(&p_lock->lock);
  return v10;
}

- (void)removeNotificationPayloadWithIdentifier:(id)a3 device:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v8 = [(HMDRemoteMessageNotifications *)self _notificationPayloadsForDevice:v6];
  [v8 removeObjectForKey:v9];

  os_unfair_lock_unlock(&p_lock->lock);
}

- (void)addNotificationPayload:(id)a3 identifier:(id)a4 device:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v11 = [(HMDRemoteMessageNotifications *)self _notificationPayloadsForDevice:v9];
  [v11 setObject:v12 forKeyedSubscript:v8];

  os_unfair_lock_unlock(&p_lock->lock);
}

- (id)_notificationPayloadsForDevice:(id)a3
{
  id v4 = a3;
  v5 = [(HMDRemoteMessageNotifications *)self sessionNotificationPayloads];
  id v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
    id v7 = [(HMDRemoteMessageNotifications *)self sessionNotificationPayloads];
    [v7 setObject:v6 forKey:v4];
  }
  return v6;
}

- (HMDRemoteMessageNotifications)init
{
  v7.receiver = self;
  v7.super_class = (Class)HMDRemoteMessageNotifications;
  v2 = [(HMDRemoteMessageNotifications *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock.lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    sessionNotificationPayloads = v3->_sessionNotificationPayloads;
    v3->_sessionNotificationPayloads = (NSMapTable *)v4;
  }
  return v3;
}

+ (BOOL)messageExpectsNotificationResponse:(id)a3
{
  id v4 = a3;
  v5 = [a1 messagesWithNotificationResponses];
  id v6 = [v4 name];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

+ (id)messagesWithNotificationResponses
{
  return (id)_messagesWithNotificationResponses;
}

+ (void)initialize
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"kCharacteristicWriteRequestKey";
  v4[1] = @"kCharacteristicReadRequestKey";
  v4[2] = @"kMultipleCharacteristicWriteRequestKey";
  v4[3] = @"kMultipleCharacteristicReadRequestKey";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  v3 = (void *)_messagesWithNotificationResponses;
  _messagesWithNotificationResponses = v2;
}

@end