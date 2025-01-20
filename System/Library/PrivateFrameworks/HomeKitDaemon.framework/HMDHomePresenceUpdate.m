@interface HMDHomePresenceUpdate
- (BOOL)isUpdate;
- (HMDDevice)causingDevice;
- (HMDHomePresence)homePresence;
- (HMDHomePresenceUpdate)initWithHomePresence:(id)a3 userPresence:(id)a4 update:(BOOL)a5 causingDevice:(id)a6;
- (HMDUserPresence)userPresence;
- (id)description;
@end

@implementation HMDHomePresenceUpdate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_causingDevice, 0);
  objc_storeStrong((id *)&self->_userPresence, 0);
  objc_storeStrong((id *)&self->_homePresence, 0);
}

- (HMDDevice)causingDevice
{
  return self->_causingDevice;
}

- (BOOL)isUpdate
{
  return self->_update;
}

- (HMDUserPresence)userPresence
{
  return self->_userPresence;
}

- (HMDHomePresence)homePresence
{
  return self->_homePresence;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMDHomePresenceUpdate *)self homePresence];
  v5 = [(HMDHomePresenceUpdate *)self userPresence];
  [(HMDHomePresenceUpdate *)self isUpdate];
  v6 = HMFBooleanToString();
  v7 = [(HMDHomePresenceUpdate *)self causingDevice];
  v8 = [v3 stringWithFormat:@"[Home-Presence-Update: %@/%@/%@/%@", v4, v5, v6, v7];

  return v8;
}

- (HMDHomePresenceUpdate)initWithHomePresence:(id)a3 userPresence:(id)a4 update:(BOOL)a5 causingDevice:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HMDHomePresenceUpdate;
  v14 = [(HMDHomePresenceUpdate *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_homePresence, a3);
    objc_storeStrong((id *)&v15->_userPresence, a4);
    v15->_update = a5;
    objc_storeStrong((id *)&v15->_causingDevice, a6);
  }

  return v15;
}

@end