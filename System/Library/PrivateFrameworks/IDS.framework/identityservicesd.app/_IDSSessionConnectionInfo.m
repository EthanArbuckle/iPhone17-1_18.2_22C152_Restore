@interface _IDSSessionConnectionInfo
- (BOOL)inviteNeedsDelivery;
- (BOOL)isAudioPaused;
- (BOOL)isBeingHandedOff;
- (BOOL)isFinished;
- (BOOL)isReinitiate;
- (BOOL)isVideoPaused;
- (NSData)localCallInfoData;
- (NSData)localICEData;
- (NSData)localNATIP;
- (NSData)localSKEData;
- (NSData)remoteCallInfoData;
- (NSData)remoteICEData;
- (NSData)remoteNATIP;
- (NSData)remoteSKEData;
- (NSDictionary)relayCancel;
- (NSDictionary)relayInitiate;
- (NSDictionary)relayUpdate;
- (NSNumber)localNATType;
- (NSNumber)remoteNATType;
- (NSString)localCN;
- (NSString)peerCN;
- (_IDSSessionConnectionInfo)init;
- (id)description;
- (int64_t)state;
- (unint64_t)localConnectionType;
- (unint64_t)remoteConnectionType;
- (unsigned)_numberOfOutagesSinceInterval:(double)a3;
- (unsigned)callID;
- (void)_addRemotePacketOutage;
- (void)setCallID:(unsigned int)a3;
- (void)setInviteNeedsDelivery:(BOOL)a3;
- (void)setIsBeingHandedOff:(BOOL)a3;
- (void)setIsReinitiate:(BOOL)a3;
- (void)setIsVideoPaused:(BOOL)a3;
- (void)setLocalCN:(id)a3;
- (void)setLocalCallInfoData:(id)a3;
- (void)setLocalConnectionType:(unint64_t)a3;
- (void)setLocalICEData:(id)a3;
- (void)setLocalNATIP:(id)a3;
- (void)setLocalNATType:(id)a3;
- (void)setLocalSKEData:(id)a3;
- (void)setPeerCN:(id)a3;
- (void)setRelayCancel:(id)a3;
- (void)setRelayInitiate:(id)a3;
- (void)setRelayUpdate:(id)a3;
- (void)setRemoteCallInfoData:(id)a3;
- (void)setRemoteConnectionType:(unint64_t)a3;
- (void)setRemoteICEData:(id)a3;
- (void)setRemoteNATIP:(id)a3;
- (void)setRemoteNATType:(id)a3;
- (void)setRemoteSKEData:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation _IDSSessionConnectionInfo

- (_IDSSessionConnectionInfo)init
{
  v13.receiver = self;
  v13.super_class = (Class)_IDSSessionConnectionInfo;
  v2 = [(_IDSSessionConnectionInfo *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_state = 0;
    if (qword_100A4C4C8 != -1) {
      dispatch_once(&qword_100A4C4C8, &stru_100987A60);
    }
    id v4 = [(id)qword_100A4C4D0 copyIdentity];
    if (v4)
    {
      CFTypeRef cf = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
      if (qword_100A4C4E0 != -1) {
        dispatch_once(&qword_100A4C4E0, &stru_100987A80);
      }
      v5 = 0;
      if (!off_100A4C4D8(v4, &cf) && cf)
      {
        if (qword_100A4C4F0 != -1) {
          dispatch_once(&qword_100A4C4F0, &stru_100987AA0);
        }
        v6 = (NSString *)off_100A4C4E8(cf);
        v7 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v16 = v6;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "array_ref = %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          v12 = v6;
          _IDSLogV();
        }
        v8 = [(NSString *)v6 firstObject];
        v5 = (NSString *)[v8 copy];

        if (v6) {
          CFRelease(v6);
        }
        CFRelease(cf);
      }
      CFRelease(v4);
    }
    else
    {
      v5 = 0;
    }
    v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "firstCommonName = %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    localCN = v3->_localCN;
    v3->_localCN = v5;
  }
  return v3;
}

- (BOOL)isFinished
{
  return self->_state == 4;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)_IDSSessionConnectionInfo;
  v3 = [(_IDSSessionConnectionInfo *)&v6 description];
  id v4 = +[NSString stringWithFormat:@"%@:state = %d, isFinished = %d, isBeingHandedOff = %d, callID = %d, state = %d, inviteNeedsDelivery = %d", v3, [(_IDSSessionConnectionInfo *)self state], [(_IDSSessionConnectionInfo *)self isFinished], [(_IDSSessionConnectionInfo *)self isBeingHandedOff], self->_callID, self->_state, self->_inviteNeedsDelivery];

  return v4;
}

- (void)_addRemotePacketOutage
{
  remotePacketOutageTimes = self->_remotePacketOutageTimes;
  if (!remotePacketOutageTimes)
  {
    id v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v5 = self->_remotePacketOutageTimes;
    self->_remotePacketOutageTimes = v4;

    remotePacketOutageTimes = self->_remotePacketOutageTimes;
  }
  IMTimeOfDay();
  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableArray *)remotePacketOutageTimes addObject:v6];
}

- (unsigned)_numberOfOutagesSinceInterval:(double)a3
{
  if (!self->_remotePacketOutageTimes)
  {
    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    remotePacketOutageTimes = self->_remotePacketOutageTimes;
    self->_remotePacketOutageTimes = v5;
  }
  IMTimeOfDay();
  double v8 = v7;
  id v9 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v10 = self->_remotePacketOutageTimes;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_msgSend(v15, "doubleValue", (void)v19);
        if (v8 - v16 > a3) {
          [v9 addObject:v15];
        }
      }
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  [(NSMutableArray *)self->_remotePacketOutageTimes removeObjectsInArray:v9];
  unsigned int v17 = [(NSMutableArray *)self->_remotePacketOutageTimes count];

  return v17;
}

- (NSDictionary)relayInitiate
{
  return self->_relayInitiate;
}

- (void)setRelayInitiate:(id)a3
{
}

- (NSDictionary)relayUpdate
{
  return self->_relayUpdate;
}

- (void)setRelayUpdate:(id)a3
{
}

- (NSDictionary)relayCancel
{
  return self->_relayCancel;
}

- (void)setRelayCancel:(id)a3
{
}

- (unsigned)callID
{
  return self->_callID;
}

- (void)setCallID:(unsigned int)a3
{
  self->_callID = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)isBeingHandedOff
{
  return self->_isBeingHandedOff;
}

- (void)setIsBeingHandedOff:(BOOL)a3
{
  self->_isBeingHandedOff = a3;
}

- (NSData)remoteICEData
{
  return self->_remoteICEData;
}

- (void)setRemoteICEData:(id)a3
{
}

- (NSData)localICEData
{
  return self->_localICEData;
}

- (void)setLocalICEData:(id)a3
{
}

- (NSData)localSKEData
{
  return self->_localSKEData;
}

- (void)setLocalSKEData:(id)a3
{
}

- (NSData)remoteSKEData
{
  return self->_remoteSKEData;
}

- (void)setRemoteSKEData:(id)a3
{
}

- (NSData)localCallInfoData
{
  return self->_localCallInfoData;
}

- (void)setLocalCallInfoData:(id)a3
{
}

- (NSData)remoteCallInfoData
{
  return self->_remoteCallInfoData;
}

- (void)setRemoteCallInfoData:(id)a3
{
}

- (NSString)localCN
{
  return self->_localCN;
}

- (void)setLocalCN:(id)a3
{
}

- (NSString)peerCN
{
  return self->_peerCN;
}

- (void)setPeerCN:(id)a3
{
}

- (NSNumber)localNATType
{
  return self->_localNATType;
}

- (void)setLocalNATType:(id)a3
{
}

- (NSNumber)remoteNATType
{
  return self->_remoteNATType;
}

- (void)setRemoteNATType:(id)a3
{
}

- (NSData)localNATIP
{
  return self->_localNATIP;
}

- (void)setLocalNATIP:(id)a3
{
}

- (NSData)remoteNATIP
{
  return self->_remoteNATIP;
}

- (void)setRemoteNATIP:(id)a3
{
}

- (BOOL)isAudioPaused
{
  return self->_isAudioPaused;
}

- (BOOL)isVideoPaused
{
  return self->_isVideoPaused;
}

- (void)setIsVideoPaused:(BOOL)a3
{
  self->_isVideoPaused = a3;
}

- (BOOL)isReinitiate
{
  return self->_isReinitiate;
}

- (void)setIsReinitiate:(BOOL)a3
{
  self->_isReinitiate = a3;
}

- (unint64_t)localConnectionType
{
  return self->_localConnectionType;
}

- (void)setLocalConnectionType:(unint64_t)a3
{
  self->_localConnectionType = a3;
}

- (unint64_t)remoteConnectionType
{
  return self->_remoteConnectionType;
}

- (void)setRemoteConnectionType:(unint64_t)a3
{
  self->_remoteConnectionType = a3;
}

- (BOOL)inviteNeedsDelivery
{
  return self->_inviteNeedsDelivery;
}

- (void)setInviteNeedsDelivery:(BOOL)a3
{
  self->_inviteNeedsDelivery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteCallInfoData, 0);
  objc_storeStrong((id *)&self->_localCallInfoData, 0);
  objc_storeStrong((id *)&self->_remoteSKEData, 0);
  objc_storeStrong((id *)&self->_localSKEData, 0);
  objc_storeStrong((id *)&self->_remotePacketOutageTimes, 0);
  objc_storeStrong((id *)&self->_remoteNATType, 0);
  objc_storeStrong((id *)&self->_localNATType, 0);
  objc_storeStrong((id *)&self->_peerCN, 0);
  objc_storeStrong((id *)&self->_localCN, 0);
  objc_storeStrong((id *)&self->_localICEData, 0);
  objc_storeStrong((id *)&self->_remoteICEData, 0);
  objc_storeStrong((id *)&self->_localNATIP, 0);
  objc_storeStrong((id *)&self->_remoteNATIP, 0);
  objc_storeStrong((id *)&self->_relayCancel, 0);
  objc_storeStrong((id *)&self->_relayUpdate, 0);

  objc_storeStrong((id *)&self->_relayInitiate, 0);
}

@end