@interface BRCFSEventsPersistedState
+ (BOOL)supportsSecureCoding;
+ (id)loadFromClientStateInSession:(id)a3 options:(id)a4;
- (BRCFSEventsPersistedState)initWithCoder:(id)a3;
- (BRCFSEventsPersistedState)initWithLatestEventID:(unint64_t)a3 streamUUID:(id)a4 rootID:(unint64_t)a5;
- (NSUUID)streamUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)latestEventID;
- (unint64_t)rootID;
- (void)encodeWithCoder:(id)a3;
- (void)setLatestEventID:(unint64_t)a3;
- (void)setRootID:(unint64_t)a3;
- (void)setStreamUUID:(id)a3;
@end

@implementation BRCFSEventsPersistedState

+ (id)loadFromClientStateInSession:(id)a3 options:(id)a4
{
  id v5 = a3;
  v6 = [a4 objectForKeyedSubscript:@"name"];
  v7 = [v5 clientState];
  if (v6)
  {
    v8 = [@"fsevents" stringByAppendingPathComponent:v6];
  }
  else
  {
    v8 = @"fsevents";
  }
  v9 = [v7 objectForKeyedSubscript:v8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v12 = objc_opt_new();

    [v7 setObject:v12 forKeyedSubscript:v8];
    v9 = (void *)v12;
  }
  v10 = [v5 clientTruthWorkloop];
  [v9 setAssertionQueue:v10];

  return v9;
}

- (BRCFSEventsPersistedState)initWithLatestEventID:(unint64_t)a3 streamUUID:(id)a4 rootID:(unint64_t)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BRCFSEventsPersistedState;
  v10 = [(BRCFSEventsPersistedState *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_latestEventID = a3;
    objc_storeStrong((id *)&v10->_streamUUID, a4);
    v11->_rootID = a5;
  }

  return v11;
}

- (void)setLatestEventID:(unint64_t)a3
{
  if (self->_latestEventID < a3) {
    self->_latestEventID = a3;
  }
}

- (void)setStreamUUID:(id)a3
{
  id v5 = a3;
  if ((-[NSUUID isEqual:](self->_streamUUID, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_streamUUID, a3);
    self->_latestEventID = 0;
  }
}

- (void)setRootID:(unint64_t)a3
{
  if (self->_rootID != a3)
  {
    streamUUID = self->_streamUUID;
    self->_streamUUID = 0;

    self->_latestEventID = 0;
    self->_rootID = a3;
  }
}

- (id)description
{
  v3 = NSString;
  v4 = [(NSUUID *)self->_streamUUID UUIDString];
  id v5 = [v3 stringWithFormat:@"streamUUID:%@ event:%llu root:%llu", v4, self->_latestEventID, self->_rootID];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [BRCFSEventsPersistedState alloc];
  unint64_t v5 = [(BRCFSEventsPersistedState *)self latestEventID];
  v6 = [(BRCFSEventsPersistedState *)self streamUUID];
  v7 = [(BRCFSEventsPersistedState *)v4 initWithLatestEventID:v5 streamUUID:v6 rootID:[(BRCFSEventsPersistedState *)self rootID]];

  v8 = [(BRCPersistedState *)self assertionQueue];
  [(BRCPersistedState *)v7 setAssertionQueue:v8];

  return v7;
}

- (BRCFSEventsPersistedState)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCFSEventsPersistedState;
  unint64_t v5 = [(BRCFSEventsPersistedState *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"streamUUID"];
    streamUUID = v5->_streamUUID;
    v5->_streamUUID = (NSUUID *)v6;

    v5->_latestEventID = [v4 decodeInt64ForKey:@"event"];
    v5->_rootID = [v4 decodeInt64ForKey:@"root"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BRCFSEventsPersistedState;
  [(BRCPersistedState *)&v6 encodeWithCoder:v4];
  streamUUID = self->_streamUUID;
  if (streamUUID) {
    [v4 encodeObject:streamUUID forKey:@"streamUUID"];
  }
  [v4 encodeInt64:self->_latestEventID forKey:@"event"];
  [v4 encodeInt64:self->_rootID forKey:@"root"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSUUID)streamUUID
{
  return self->_streamUUID;
}

- (unint64_t)latestEventID
{
  return self->_latestEventID;
}

- (unint64_t)rootID
{
  return self->_rootID;
}

- (void).cxx_destruct
{
}

@end