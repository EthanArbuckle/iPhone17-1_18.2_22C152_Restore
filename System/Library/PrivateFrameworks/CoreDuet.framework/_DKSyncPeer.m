@interface _DKSyncPeer
- (BOOL)isCompanion;
- (BOOL)me;
- (NSDate)lastSeenDate;
- (NSString)identifier;
- (NSString)idsDeviceIdentifier;
- (NSString)model;
- (NSString)name;
- (NSString)sourceDeviceID;
- (NSString)version;
- (NSString)zoneName;
- (NSUUID)sourceDeviceUUID;
- (NSUUID)uuid;
- (_DKSyncPeer)init;
- (_DKSyncPeer)initWithIDSDeviceIdentifier:(id)a3;
- (_DKSyncPeer)initWithIDSDeviceIdentifier:(id)a3 zoneName:(id)a4;
- (_DKSyncPeer)initWithZoneName:(id)a3;
- (id)description;
- (void)setCompanion:(BOOL)a3;
- (void)setIdsDeviceIdentifier:(id)a3;
- (void)setLastSeenDate:(id)a3;
- (void)setMe:(BOOL)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setSourceDeviceID:(id)a3;
- (void)setUuid:(id)a3;
- (void)setVersion:(id)a3;
- (void)setZoneName:(id)a3;
@end

@implementation _DKSyncPeer

- (_DKSyncPeer)init
{
  return [(_DKSyncPeer *)self initWithIDSDeviceIdentifier:0 zoneName:0];
}

- (_DKSyncPeer)initWithIDSDeviceIdentifier:(id)a3
{
  return [(_DKSyncPeer *)self initWithIDSDeviceIdentifier:a3 zoneName:0];
}

- (_DKSyncPeer)initWithZoneName:(id)a3
{
  return [(_DKSyncPeer *)self initWithIDSDeviceIdentifier:0 zoneName:a3];
}

- (_DKSyncPeer)initWithIDSDeviceIdentifier:(id)a3 zoneName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_DKSyncPeer;
  v9 = [(_DKSyncPeer *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_idsDeviceIdentifier, a3);
    objc_storeStrong((id *)&v10->_zoneName, a4);
  }

  return v10;
}

- (NSUUID)sourceDeviceUUID
{
  if (self->_sourceDeviceID) {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:self->_sourceDeviceID];
  }
  else {
    v2 = 0;
  }
  return (NSUUID *)v2;
}

- (NSString)identifier
{
  p_sourceDeviceID = &self->_sourceDeviceID;
  if (self->_sourceDeviceID)
  {
    v3 = @"%@";
LABEL_7:
    v6 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", v3, *p_sourceDeviceID);
    goto LABEL_8;
  }
  p_sourceDeviceID = &self->_idsDeviceIdentifier;
  if (self->_idsDeviceIdentifier)
  {
    v3 = @"rapport:%@";
    goto LABEL_7;
  }
  zoneName = self->_zoneName;
  p_zoneName = &self->_zoneName;
  if (zoneName)
  {
    v3 = @"cloud:%@";
    p_sourceDeviceID = p_zoneName;
    goto LABEL_7;
  }
  v6 = @"UNKNOWN";
LABEL_8:
  return (NSString *)v6;
}

- (id)description
{
  BOOL me = self->_me;
  id v4 = [NSString alloc];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  if (me)
  {
    if (self->_me) {
      id v7 = @"YES";
    }
    else {
      id v7 = @"NO";
    }
    id v8 = [(_DKSyncPeer *)self identifier];
    v9 = (void *)[v4 initWithFormat:@"<%@ %p: me=%@, identifier=%@, name=%@, model=%@, sourceDeviceID=%@, zoneName=%@>", v6, self, v7, v8, self->_name, self->_model, self->_sourceDeviceID, self->_zoneName];
  }
  else
  {
    id v8 = [(_DKSyncPeer *)self identifier];
    long long v16 = *(_OWORD *)&self->_name;
    version = self->_version;
    sourceDeviceID = self->_sourceDeviceID;
    idsDeviceIdentifier = self->_idsDeviceIdentifier;
    zoneNaBOOL me = self->_zoneName;
    v14 = -[NSDate dk_localtimeString](self->_lastSeenDate);
    v9 = (void *)[v4 initWithFormat:@"<%@ %p: identifier=%@, name=%@, model=%@, version=%@, sourceDeviceID=%@, idsDeviceIdentifier=%@, zoneName=%@, lastSeenDate=%@>", v6, self, v8, v16, version, sourceDeviceID, idsDeviceIdentifier, zoneName, v14];
  }
  return v9;
}

- (NSString)sourceDeviceID
{
  return self->_sourceDeviceID;
}

- (void)setSourceDeviceID:(id)a3
{
}

- (NSString)idsDeviceIdentifier
{
  return self->_idsDeviceIdentifier;
}

- (void)setIdsDeviceIdentifier:(id)a3
{
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
}

- (NSDate)lastSeenDate
{
  return self->_lastSeenDate;
}

- (void)setLastSeenDate:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (BOOL)isCompanion
{
  return self->_companion;
}

- (void)setCompanion:(BOOL)a3
{
  self->_companion = a3;
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (BOOL)me
{
  return self->_me;
}

- (void)setMe:(BOOL)a3
{
  self->_BOOL me = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lastSeenDate, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_idsDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceDeviceID, 0);
}

@end