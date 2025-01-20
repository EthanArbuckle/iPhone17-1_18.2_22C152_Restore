@interface CHRecentCallPb
+ (Class)remoteParticipantHandlesType;
+ (id)protoRecentCallWithRecentCall:(id)a3;
- (BOOL)hasAutoAnsweredReason;
- (BOOL)hasBytesOfDataUsed;
- (BOOL)hasCallCategory;
- (BOOL)hasCallStatus;
- (BOOL)hasCallType;
- (BOOL)hasCallerId;
- (BOOL)hasCallerIdAvailability;
- (BOOL)hasCallerIdLocation;
- (BOOL)hasCallerName;
- (BOOL)hasConversationID;
- (BOOL)hasDate;
- (BOOL)hasDevicePhoneId;
- (BOOL)hasDuration;
- (BOOL)hasHandleType;
- (BOOL)hasIsoCountryCode;
- (BOOL)hasJunkConfidence;
- (BOOL)hasLocalParticipantHandle;
- (BOOL)hasLocalParticipantUUIDString;
- (BOOL)hasMobileCountryCode;
- (BOOL)hasMobileNetworkCode;
- (BOOL)hasOutgoingLocalParticipantUUIDString;
- (BOOL)hasParticipantGroupUUIDString;
- (BOOL)hasRead;
- (BOOL)hasScreenSharingType;
- (BOOL)hasServiceProvider;
- (BOOL)hasTimeToEstablish;
- (BOOL)hasTransaction;
- (BOOL)hasUniqueId;
- (BOOL)hasUnreadCount;
- (BOOL)hasVerificationStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)read;
- (BOOL)readFrom:(id)a3;
- (CHHandlePb)localParticipantHandle;
- (CHRecentCall)chRecentCall;
- (NSMutableArray)remoteParticipantHandles;
- (NSSet)chRemoteParticipantHandles;
- (NSString)callerId;
- (NSString)callerIdLocation;
- (NSString)callerName;
- (NSString)conversationID;
- (NSString)devicePhoneId;
- (NSString)isoCountryCode;
- (NSString)localParticipantUUIDString;
- (NSString)outgoingLocalParticipantUUIDString;
- (NSString)participantGroupUUIDString;
- (NSString)serviceProvider;
- (NSString)transaction;
- (NSString)uniqueId;
- (NSUUID)localParticipantUUID;
- (NSUUID)outgoingLocalParticipantUUID;
- (NSUUID)participantGroupUUID;
- (double)date;
- (double)duration;
- (double)timeToEstablish;
- (float)bytesOfDataUsed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)remoteParticipantHandlesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)remoteParticipantHandlesCount;
- (unsigned)autoAnsweredReason;
- (unsigned)callCategory;
- (unsigned)callStatus;
- (unsigned)callType;
- (unsigned)callerIdAvailability;
- (unsigned)handleType;
- (unsigned)junkConfidence;
- (unsigned)mobileCountryCode;
- (unsigned)mobileNetworkCode;
- (unsigned)screenSharingType;
- (unsigned)unreadCount;
- (unsigned)verificationStatus;
- (void)addRemoteParticipantHandles:(id)a3;
- (void)clearRemoteParticipantHandles;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAutoAnsweredReason:(unsigned int)a3;
- (void)setBytesOfDataUsed:(float)a3;
- (void)setCallCategory:(unsigned int)a3;
- (void)setCallStatus:(unsigned int)a3;
- (void)setCallType:(unsigned int)a3;
- (void)setCallerId:(id)a3;
- (void)setCallerIdAvailability:(unsigned int)a3;
- (void)setCallerIdLocation:(id)a3;
- (void)setCallerName:(id)a3;
- (void)setChRemoteParticipantHandles:(id)a3;
- (void)setConversationID:(id)a3;
- (void)setDate:(double)a3;
- (void)setDevicePhoneId:(id)a3;
- (void)setDuration:(double)a3;
- (void)setHandleType:(unsigned int)a3;
- (void)setHasAutoAnsweredReason:(BOOL)a3;
- (void)setHasBytesOfDataUsed:(BOOL)a3;
- (void)setHasCallCategory:(BOOL)a3;
- (void)setHasCallStatus:(BOOL)a3;
- (void)setHasCallType:(BOOL)a3;
- (void)setHasCallerIdAvailability:(BOOL)a3;
- (void)setHasDate:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasHandleType:(BOOL)a3;
- (void)setHasJunkConfidence:(BOOL)a3;
- (void)setHasMobileCountryCode:(BOOL)a3;
- (void)setHasMobileNetworkCode:(BOOL)a3;
- (void)setHasRead:(BOOL)a3;
- (void)setHasScreenSharingType:(BOOL)a3;
- (void)setHasTimeToEstablish:(BOOL)a3;
- (void)setHasUnreadCount:(BOOL)a3;
- (void)setHasVerificationStatus:(BOOL)a3;
- (void)setIsoCountryCode:(id)a3;
- (void)setJunkConfidence:(unsigned int)a3;
- (void)setLocalParticipantHandle:(id)a3;
- (void)setLocalParticipantUUID:(id)a3;
- (void)setLocalParticipantUUIDString:(id)a3;
- (void)setMobileCountryCode:(unsigned int)a3;
- (void)setMobileNetworkCode:(unsigned int)a3;
- (void)setOutgoingLocalParticipantUUID:(id)a3;
- (void)setOutgoingLocalParticipantUUIDString:(id)a3;
- (void)setParticipantGroupUUID:(id)a3;
- (void)setParticipantGroupUUIDString:(id)a3;
- (void)setRead:(BOOL)a3;
- (void)setRemoteParticipantHandles:(id)a3;
- (void)setScreenSharingType:(unsigned int)a3;
- (void)setServiceProvider:(id)a3;
- (void)setTimeToEstablish:(double)a3;
- (void)setTransaction:(id)a3;
- (void)setUniqueId:(id)a3;
- (void)setUnreadCount:(unsigned int)a3;
- (void)setVerificationStatus:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CHRecentCallPb

+ (id)protoRecentCallWithRecentCall:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(CHRecentCallPb);
  v5 = [v3 bytesOfDataUsed];
  [v5 floatValue];
  -[CHRecentCallPb setBytesOfDataUsed:](v4, "setBytesOfDataUsed:");

  v6 = [v3 name];
  [(CHRecentCallPb *)v4 setCallerName:v6];

  -[CHRecentCallPb setCallStatus:](v4, "setCallStatus:", [v3 callStatus]);
  v7 = [v3 date];
  [v7 timeIntervalSince1970];
  -[CHRecentCallPb setDate:](v4, "setDate:");

  [v3 duration];
  -[CHRecentCallPb setDuration:](v4, "setDuration:");
  v8 = [v3 isoCountryCode];
  [(CHRecentCallPb *)v4 setIsoCountryCode:v8];

  v9 = [v3 localParticipantUUID];
  [(CHRecentCallPb *)v4 setLocalParticipantUUID:v9];

  v10 = [v3 outgoingLocalParticipantUUID];
  [(CHRecentCallPb *)v4 setOutgoingLocalParticipantUUID:v10];

  v11 = [v3 participantGroupUUID];
  [(CHRecentCallPb *)v4 setParticipantGroupUUID:v11];

  v12 = [v3 serviceProvider];
  [(CHRecentCallPb *)v4 setServiceProvider:v12];

  v13 = [v3 timeToEstablish];
  [v13 doubleValue];
  -[CHRecentCallPb setTimeToEstablish:](v4, "setTimeToEstablish:");

  v14 = [v3 remoteParticipantHandles];
  [(CHRecentCallPb *)v4 setChRemoteParticipantHandles:v14];

  -[CHRecentCallPb setJunkConfidence:](v4, "setJunkConfidence:", [v3 junkConfidence]);
  -[CHRecentCallPb setVerificationStatus:](v4, "setVerificationStatus:", [v3 verificationStatus]);
  v15 = [v3 conversationID];
  v16 = [v15 UUIDString];
  [(CHRecentCallPb *)v4 setConversationID:v16];

  -[CHRecentCallPb setAutoAnsweredReason:](v4, "setAutoAnsweredReason:", [v3 autoAnsweredReason]);
  -[CHRecentCallPb setScreenSharingType:](v4, "setScreenSharingType:", [v3 screenSharingType]);
  -[CHRecentCallPb setCallCategory:](v4, "setCallCategory:", [v3 callCategory]);
  v17 = [v3 callerId];
  [(CHRecentCallPb *)v4 setCallerId:v17];

  -[CHRecentCallPb setCallType:](v4, "setCallType:", [v3 callType]);
  -[CHRecentCallPb setHandleType:](v4, "setHandleType:", [v3 handleType]);
  v18 = [v3 uniqueId];

  [(CHRecentCallPb *)v4 setUniqueId:v18];
  return v4;
}

- (NSUUID)localParticipantUUID
{
  id v3 = [(CHRecentCallPb *)self localParticipantUUIDString];
  if (v3)
  {
    id v4 = objc_alloc((Class)NSUUID);
    v5 = [(CHRecentCallPb *)self localParticipantUUIDString];
    id v6 = [v4 initWithUUIDString:v5];
  }
  else
  {
    id v6 = 0;
  }

  return (NSUUID *)v6;
}

- (void)setLocalParticipantUUID:(id)a3
{
  id v4 = [a3 UUIDString];
  [(CHRecentCallPb *)self setLocalParticipantUUIDString:v4];
}

- (NSUUID)outgoingLocalParticipantUUID
{
  id v3 = [(CHRecentCallPb *)self outgoingLocalParticipantUUIDString];
  if (v3)
  {
    id v4 = objc_alloc((Class)NSUUID);
    v5 = [(CHRecentCallPb *)self outgoingLocalParticipantUUIDString];
    id v6 = [v4 initWithUUIDString:v5];
  }
  else
  {
    id v6 = 0;
  }

  return (NSUUID *)v6;
}

- (void)setOutgoingLocalParticipantUUID:(id)a3
{
  id v4 = [a3 UUIDString];
  [(CHRecentCallPb *)self setOutgoingLocalParticipantUUIDString:v4];
}

- (NSUUID)participantGroupUUID
{
  id v3 = [(CHRecentCallPb *)self participantGroupUUIDString];
  if (v3)
  {
    id v4 = objc_alloc((Class)NSUUID);
    v5 = [(CHRecentCallPb *)self participantGroupUUIDString];
    id v6 = [v4 initWithUUIDString:v5];
  }
  else
  {
    id v6 = 0;
  }

  return (NSUUID *)v6;
}

- (void)setParticipantGroupUUID:(id)a3
{
  id v4 = [a3 UUIDString];
  [(CHRecentCallPb *)self setParticipantGroupUUIDString:v4];
}

- (NSSet)chRemoteParticipantHandles
{
  id v3 = [(CHRecentCallPb *)self remoteParticipantHandles];
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(CHRecentCallPb *)self remoteParticipantHandles];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) chHandle];
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = +[NSSet setWithArray:v4];

  return (NSSet *)v11;
}

- (void)setChRemoteParticipantHandles:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = +[CHHandlePb handleWithCHHandle:](CHHandlePb, "handleWithCHHandle:", *(void *)(*((void *)&v13 + 1) + 8 * (void)v10), (void)v13);
        [v5 addObject:v11];

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  id v12 = [v5 copy];
  [(CHRecentCallPb *)self setRemoteParticipantHandles:v12];
}

- (CHRecentCall)chRecentCall
{
  id v3 = objc_alloc_init((Class)CHRecentCall);
  [(CHRecentCallPb *)self bytesOfDataUsed];
  id v4 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [v3 setBytesOfDataUsed:v4];

  objc_msgSend(v3, "setCallStatus:", -[CHRecentCallPb callStatus](self, "callStatus"));
  id v5 = objc_alloc((Class)NSDate);
  [(CHRecentCallPb *)self date];
  id v6 = objc_msgSend(v5, "initWithTimeIntervalSince1970:");
  [v3 setDate:v6];

  [(CHRecentCallPb *)self duration];
  objc_msgSend(v3, "setDuration:");
  id v7 = [(CHRecentCallPb *)self isoCountryCode];
  [v3 setIsoCountryCode:v7];

  id v8 = [(CHRecentCallPb *)self localParticipantUUID];
  [v3 setLocalParticipantUUID:v8];

  uint64_t v9 = [(CHRecentCallPb *)self callerName];
  [v3 setName:v9];

  v10 = [(CHRecentCallPb *)self outgoingLocalParticipantUUID];
  [v3 setOutgoingLocalParticipantUUID:v10];

  v11 = [(CHRecentCallPb *)self participantGroupUUID];
  [v3 setParticipantGroupUUID:v11];

  id v12 = [(CHRecentCallPb *)self chRemoteParticipantHandles];
  [v3 setRemoteParticipantHandles:v12];

  long long v13 = [(CHRecentCallPb *)self serviceProvider];
  [v3 setServiceProvider:v13];

  if ([(CHRecentCallPb *)self hasConversationID])
  {
    id v14 = objc_alloc((Class)NSUUID);
    long long v15 = [(CHRecentCallPb *)self conversationID];
    id v16 = [v14 initWithUUIDString:v15];
    [v3 setConversationID:v16];
  }
  [(CHRecentCallPb *)self timeToEstablish];
  if (v17 != 0.0)
  {
    [(CHRecentCallPb *)self timeToEstablish];
    v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v3 setTimeToEstablish:v18];
  }
  if ([(CHRecentCallPb *)self hasJunkConfidence]) {
    uint64_t v19 = [(CHRecentCallPb *)self junkConfidence];
  }
  else {
    uint64_t v19 = 0;
  }
  [v3 setJunkConfidence:v19];
  if ([(CHRecentCallPb *)self verificationStatus]) {
    uint64_t v20 = [(CHRecentCallPb *)self verificationStatus];
  }
  else {
    uint64_t v20 = 0;
  }
  [v3 setVerificationStatus:v20];
  if ([(CHRecentCallPb *)self autoAnsweredReason]) {
    uint64_t v21 = [(CHRecentCallPb *)self autoAnsweredReason];
  }
  else {
    uint64_t v21 = 0;
  }
  [v3 setAutoAnsweredReason:v21];
  if ([(CHRecentCallPb *)self screenSharingType]) {
    uint64_t v22 = [(CHRecentCallPb *)self screenSharingType];
  }
  else {
    uint64_t v22 = 0;
  }
  [v3 setScreenSharingType:v22];
  objc_msgSend(v3, "setCallCategory:", -[CHRecentCallPb callCategory](self, "callCategory"));
  v23 = [(CHRecentCallPb *)self callerId];
  [v3 setCallerId:v23];

  objc_msgSend(v3, "setCallType:", -[CHRecentCallPb callType](self, "callType"));
  v24 = [(CHRecentCallPb *)self uniqueId];
  [v3 setUniqueId:v24];

  if ([(CHRecentCallPb *)self hasHandleType])
  {
    objc_msgSend(v3, "setHandleType:", -[CHRecentCallPb handleType](self, "handleType"));
  }
  else
  {
    v25 = [(CHRecentCallPb *)self callerId];
    objc_msgSend(v3, "setHandleType:", +[CHHandle handleTypeForValue:](CHHandle, "handleTypeForValue:", v25));
  }
  v26 = [v3 dictionaryRepresentation];
  v29 = v26;
  v27 = +[NSArray arrayWithObjects:&v29 count:1];
  [v3 setCallOccurrences:v27];

  return (CHRecentCall *)v3;
}

- (BOOL)hasUniqueId
{
  return self->_uniqueId != 0;
}

- (BOOL)hasCallerId
{
  return self->_callerId != 0;
}

- (void)setDate:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_date = a3;
}

- (void)setHasDate:(BOOL)a3
{
  self->_has = ($220AD77DD0F5442585F523FC729D513D)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasDate
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setCallType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_callType = a3;
}

- (void)setHasCallType:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($220AD77DD0F5442585F523FC729D513D)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasCallType
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setCallStatus:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_callStatus = a3;
}

- (void)setHasCallStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($220AD77DD0F5442585F523FC729D513D)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasCallStatus
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setCallerIdAvailability:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_callerIdAvailability = a3;
}

- (void)setHasCallerIdAvailability:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($220AD77DD0F5442585F523FC729D513D)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasCallerIdAvailability
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setRead:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_read = a3;
}

- (void)setHasRead:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($220AD77DD0F5442585F523FC729D513D)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasRead
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setUnreadCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_unreadCount = a3;
}

- (void)setHasUnreadCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($220AD77DD0F5442585F523FC729D513D)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasUnreadCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setDuration:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($220AD77DD0F5442585F523FC729D513D)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setBytesOfDataUsed:(float)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_bytesOfDataUsed = a3;
}

- (void)setHasBytesOfDataUsed:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($220AD77DD0F5442585F523FC729D513D)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasBytesOfDataUsed
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setMobileCountryCode:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_mobileCountryCode = a3;
}

- (void)setHasMobileCountryCode:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($220AD77DD0F5442585F523FC729D513D)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasMobileCountryCode
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setMobileNetworkCode:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_mobileNetworkCode = a3;
}

- (void)setHasMobileNetworkCode:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($220AD77DD0F5442585F523FC729D513D)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasMobileNetworkCode
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasDevicePhoneId
{
  return self->_devicePhoneId != 0;
}

- (BOOL)hasTransaction
{
  return self->_transaction != 0;
}

- (BOOL)hasIsoCountryCode
{
  return self->_isoCountryCode != 0;
}

- (BOOL)hasCallerIdLocation
{
  return self->_callerIdLocation != 0;
}

- (void)setCallCategory:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_callCategory = a3;
}

- (void)setHasCallCategory:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($220AD77DD0F5442585F523FC729D513D)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasCallCategory
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)hasServiceProvider
{
  return self->_serviceProvider != 0;
}

- (void)setHandleType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_handleType = a3;
}

- (void)setHasHandleType:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($220AD77DD0F5442585F523FC729D513D)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasHandleType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setTimeToEstablish:(double)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_timeToEstablish = a3;
}

- (void)setHasTimeToEstablish:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($220AD77DD0F5442585F523FC729D513D)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasTimeToEstablish
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasLocalParticipantHandle
{
  return self->_localParticipantHandle != 0;
}

- (void)clearRemoteParticipantHandles
{
}

- (void)addRemoteParticipantHandles:(id)a3
{
  id v4 = a3;
  remoteParticipantHandles = self->_remoteParticipantHandles;
  id v8 = v4;
  if (!remoteParticipantHandles)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    id v7 = self->_remoteParticipantHandles;
    self->_remoteParticipantHandles = v6;

    id v4 = v8;
    remoteParticipantHandles = self->_remoteParticipantHandles;
  }
  [(NSMutableArray *)remoteParticipantHandles addObject:v4];
}

- (unint64_t)remoteParticipantHandlesCount
{
  return (unint64_t)[(NSMutableArray *)self->_remoteParticipantHandles count];
}

- (id)remoteParticipantHandlesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_remoteParticipantHandles objectAtIndex:a3];
}

+ (Class)remoteParticipantHandlesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasLocalParticipantUUIDString
{
  return self->_localParticipantUUIDString != 0;
}

- (BOOL)hasOutgoingLocalParticipantUUIDString
{
  return self->_outgoingLocalParticipantUUIDString != 0;
}

- (void)setJunkConfidence:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_junkConfidence = a3;
}

- (void)setHasJunkConfidence:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($220AD77DD0F5442585F523FC729D513D)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasJunkConfidence
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setVerificationStatus:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_verificationStatus = a3;
}

- (void)setHasVerificationStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($220AD77DD0F5442585F523FC729D513D)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasVerificationStatus
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (BOOL)hasCallerName
{
  return self->_callerName != 0;
}

- (BOOL)hasParticipantGroupUUIDString
{
  return self->_participantGroupUUIDString != 0;
}

- (BOOL)hasConversationID
{
  return self->_conversationID != 0;
}

- (void)setAutoAnsweredReason:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_autoAnsweredReason = a3;
}

- (void)setHasAutoAnsweredReason:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($220AD77DD0F5442585F523FC729D513D)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasAutoAnsweredReason
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setScreenSharingType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_screenSharingType = a3;
}

- (void)setHasScreenSharingType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($220AD77DD0F5442585F523FC729D513D)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasScreenSharingType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CHRecentCallPb;
  int v3 = [(CHRecentCallPb *)&v7 description];
  id v4 = [(CHRecentCallPb *)self dictionaryRepresentation];
  id v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  int v3 = +[NSMutableDictionary dictionary];
  id v5 = v3;
  uniqueId = self->_uniqueId;
  if (uniqueId) {
    [v3 setObject:uniqueId forKey:@"uniqueId"];
  }
  callerId = self->_callerId;
  if (callerId) {
    [v5 setObject:callerId forKey:@"callerId"];
  }
  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if (*(unsigned char *)&has)
  {
    v41 = +[NSNumber numberWithDouble:self->_date];
    [v5 setObject:v41 forKey:@"date"];

    $220AD77DD0F5442585F523FC729D513D has = self->_has;
    if ((*(unsigned char *)&has & 0x80) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&has & 0x40) == 0) {
        goto LABEL_8;
      }
      goto LABEL_64;
    }
  }
  else if ((*(unsigned char *)&has & 0x80) == 0)
  {
    goto LABEL_7;
  }
  v42 = +[NSNumber numberWithUnsignedInt:self->_callType];
  [v5 setObject:v42 forKey:@"callType"];

  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_65;
  }
LABEL_64:
  v43 = +[NSNumber numberWithUnsignedInt:self->_callStatus];
  [v5 setObject:v43 forKey:@"callStatus"];

  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_66;
  }
LABEL_65:
  v44 = +[NSNumber numberWithUnsignedInt:self->_callerIdAvailability];
  [v5 setObject:v44 forKey:@"callerIdAvailability"];

  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_67;
  }
LABEL_66:
  v45 = +[NSNumber numberWithBool:self->_read];
  [v5 setObject:v45 forKey:@"read"];

  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_68;
  }
LABEL_67:
  v46 = +[NSNumber numberWithUnsignedInt:self->_unreadCount];
  [v5 setObject:v46 forKey:@"unreadCount"];

  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_69;
  }
LABEL_68:
  v47 = +[NSNumber numberWithDouble:self->_duration];
  [v5 setObject:v47 forKey:@"duration"];

  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_70;
  }
LABEL_69:
  *(float *)&double v4 = self->_bytesOfDataUsed;
  v48 = +[NSNumber numberWithFloat:v4];
  [v5 setObject:v48 forKey:@"bytesOfDataUsed"];

  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_70:
  v49 = +[NSNumber numberWithUnsignedInt:self->_mobileCountryCode];
  [v5 setObject:v49 forKey:@"mobileCountryCode"];

  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_15:
    uint64_t v9 = +[NSNumber numberWithUnsignedInt:self->_mobileNetworkCode];
    [v5 setObject:v9 forKey:@"mobileNetworkCode"];
  }
LABEL_16:
  devicePhoneId = self->_devicePhoneId;
  if (devicePhoneId) {
    [v5 setObject:devicePhoneId forKey:@"devicePhoneId"];
  }
  transaction = self->_transaction;
  if (transaction) {
    [v5 setObject:transaction forKey:@"transaction"];
  }
  isoCountryCode = self->_isoCountryCode;
  if (isoCountryCode) {
    [v5 setObject:isoCountryCode forKey:@"isoCountryCode"];
  }
  callerIdLocation = self->_callerIdLocation;
  if (callerIdLocation) {
    [v5 setObject:callerIdLocation forKey:@"callerIdLocation"];
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    id v14 = +[NSNumber numberWithUnsignedInt:self->_callCategory];
    [v5 setObject:v14 forKey:@"callCategory"];
  }
  serviceProvider = self->_serviceProvider;
  if (serviceProvider) {
    [v5 setObject:serviceProvider forKey:@"serviceProvider"];
  }
  $220AD77DD0F5442585F523FC729D513D v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x200) != 0)
  {
    double v17 = +[NSNumber numberWithUnsignedInt:self->_handleType];
    [v5 setObject:v17 forKey:@"handleType"];

    $220AD77DD0F5442585F523FC729D513D v16 = self->_has;
  }
  if ((*(unsigned char *)&v16 & 4) != 0)
  {
    v18 = +[NSNumber numberWithDouble:self->_timeToEstablish];
    [v5 setObject:v18 forKey:@"timeToEstablish"];
  }
  localParticipantHandle = self->_localParticipantHandle;
  if (localParticipantHandle)
  {
    uint64_t v20 = [(CHHandlePb *)localParticipantHandle dictionaryRepresentation];
    [v5 setObject:v20 forKey:@"localParticipantHandle"];
  }
  if ([(NSMutableArray *)self->_remoteParticipantHandles count])
  {
    id v21 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_remoteParticipantHandles, "count"));
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    uint64_t v22 = self->_remoteParticipantHandles;
    id v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v50 objects:v54 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v51;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v51 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = objc_msgSend(*(id *)(*((void *)&v50 + 1) + 8 * i), "dictionaryRepresentation", (void)v50);
          [v21 addObject:v27];
        }
        id v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v50 objects:v54 count:16];
      }
      while (v24);
    }

    [v5 setObject:v21 forKey:@"remoteParticipantHandles"];
  }
  localParticipantUUIDString = self->_localParticipantUUIDString;
  if (localParticipantUUIDString) {
    [v5 setObject:localParticipantUUIDString forKey:@"localParticipantUUIDString"];
  }
  outgoingLocalParticipantUUIDString = self->_outgoingLocalParticipantUUIDString;
  if (outgoingLocalParticipantUUIDString) {
    [v5 setObject:outgoingLocalParticipantUUIDString forKey:@"outgoingLocalParticipantUUIDString"];
  }
  $220AD77DD0F5442585F523FC729D513D v30 = self->_has;
  if ((*(_WORD *)&v30 & 0x400) != 0)
  {
    v31 = +[NSNumber numberWithUnsignedInt:self->_junkConfidence];
    [v5 setObject:v31 forKey:@"junkConfidence"];

    $220AD77DD0F5442585F523FC729D513D v30 = self->_has;
  }
  if ((*(_WORD *)&v30 & 0x8000) != 0)
  {
    v32 = +[NSNumber numberWithUnsignedInt:self->_verificationStatus];
    [v5 setObject:v32 forKey:@"verificationStatus"];
  }
  callerName = self->_callerName;
  if (callerName) {
    [v5 setObject:callerName forKey:@"callerName"];
  }
  participantGroupUUIDString = self->_participantGroupUUIDString;
  if (participantGroupUUIDString) {
    [v5 setObject:participantGroupUUIDString forKey:@"participantGroupUUIDString"];
  }
  conversationID = self->_conversationID;
  if (conversationID) {
    [v5 setObject:conversationID forKey:@"conversationID"];
  }
  $220AD77DD0F5442585F523FC729D513D v36 = self->_has;
  if ((*(unsigned char *)&v36 & 8) != 0)
  {
    v37 = +[NSNumber numberWithUnsignedInt:self->_autoAnsweredReason];
    [v5 setObject:v37 forKey:@"autoAnsweredReason"];

    $220AD77DD0F5442585F523FC729D513D v36 = self->_has;
  }
  if ((*(_WORD *)&v36 & 0x2000) != 0)
  {
    v38 = +[NSNumber numberWithUnsignedInt:self->_screenSharingType];
    [v5 setObject:v38 forKey:@"screenSharingType"];
  }
  id v39 = v5;

  return v39;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100022D40((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_uniqueId) {
    PBDataWriterWriteStringField();
  }
  if (self->_callerId) {
    PBDataWriterWriteStringField();
  }
  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteDoubleField();
    $220AD77DD0F5442585F523FC729D513D has = self->_has;
    if ((*(unsigned char *)&has & 0x80) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&has & 0x40) == 0) {
        goto LABEL_8;
      }
      goto LABEL_62;
    }
  }
  else if ((*(unsigned char *)&has & 0x80) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint32Field();
  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint32Field();
  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteBOOLField();
  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint32Field();
  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteDoubleField();
  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteFloatField();
  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_68:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x1000) != 0) {
LABEL_15:
  }
    PBDataWriterWriteUint32Field();
LABEL_16:
  if (self->_devicePhoneId) {
    PBDataWriterWriteStringField();
  }
  if (self->_transaction) {
    PBDataWriterWriteStringField();
  }
  if (self->_isoCountryCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_callerIdLocation) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_serviceProvider) {
    PBDataWriterWriteStringField();
  }
  $220AD77DD0F5442585F523FC729D513D v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) != 0)
  {
    PBDataWriterWriteUint32Field();
    $220AD77DD0F5442585F523FC729D513D v6 = self->_has;
  }
  if ((*(unsigned char *)&v6 & 4) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_localParticipantHandle) {
    PBDataWriterWriteSubmessage();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v7 = self->_remoteParticipantHandles;
  id v8 = (char *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = (char *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  if (self->_localParticipantUUIDString) {
    PBDataWriterWriteStringField();
  }
  if (self->_outgoingLocalParticipantUUIDString) {
    PBDataWriterWriteStringField();
  }
  $220AD77DD0F5442585F523FC729D513D v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x400) != 0)
  {
    PBDataWriterWriteUint32Field();
    $220AD77DD0F5442585F523FC729D513D v12 = self->_has;
  }
  if ((*(_WORD *)&v12 & 0x8000) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_callerName) {
    PBDataWriterWriteStringField();
  }
  if (self->_participantGroupUUIDString) {
    PBDataWriterWriteStringField();
  }
  if (self->_conversationID) {
    PBDataWriterWriteStringField();
  }
  $220AD77DD0F5442585F523FC729D513D v13 = self->_has;
  if ((*(unsigned char *)&v13 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    $220AD77DD0F5442585F523FC729D513D v13 = self->_has;
  }
  if ((*(_WORD *)&v13 & 0x2000) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v14 = v4;
  if (self->_uniqueId)
  {
    objc_msgSend(v4, "setUniqueId:");
    id v4 = v14;
  }
  if (self->_callerId)
  {
    objc_msgSend(v14, "setCallerId:");
    id v4 = v14;
  }
  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if (*(unsigned char *)&has)
  {
    *((void *)v4 + 1) = *(void *)&self->_date;
    *((_DWORD *)v4 + 55) |= 1u;
    $220AD77DD0F5442585F523FC729D513D has = self->_has;
    if ((*(unsigned char *)&has & 0x80) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&has & 0x40) == 0) {
        goto LABEL_8;
      }
      goto LABEL_61;
    }
  }
  else if ((*(unsigned char *)&has & 0x80) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 12) = self->_callType;
  *((_DWORD *)v4 + 55) |= 0x80u;
  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)v4 + 11) = self->_callStatus;
  *((_DWORD *)v4 + 55) |= 0x40u;
  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((_DWORD *)v4 + 16) = self->_callerIdAvailability;
  *((_DWORD *)v4 + 55) |= 0x100u;
  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((unsigned char *)v4 + 216) = self->_read;
  *((_DWORD *)v4 + 55) |= 0x10000u;
  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((_DWORD *)v4 + 52) = self->_unreadCount;
  *((_DWORD *)v4 + 55) |= 0x4000u;
  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((void *)v4 + 2) = *(void *)&self->_duration;
  *((_DWORD *)v4 + 55) |= 2u;
  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((_DWORD *)v4 + 9) = LODWORD(self->_bytesOfDataUsed);
  *((_DWORD *)v4 + 55) |= 0x10u;
  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_67:
  *((_DWORD *)v4 + 36) = self->_mobileCountryCode;
  *((_DWORD *)v4 + 55) |= 0x800u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_15:
    *((_DWORD *)v4 + 37) = self->_mobileNetworkCode;
    *((_DWORD *)v4 + 55) |= 0x1000u;
  }
LABEL_16:
  if (self->_devicePhoneId)
  {
    objc_msgSend(v14, "setDevicePhoneId:");
    id v4 = v14;
  }
  if (self->_transaction)
  {
    objc_msgSend(v14, "setTransaction:");
    id v4 = v14;
  }
  if (self->_isoCountryCode)
  {
    objc_msgSend(v14, "setIsoCountryCode:");
    id v4 = v14;
  }
  if (self->_callerIdLocation)
  {
    objc_msgSend(v14, "setCallerIdLocation:");
    id v4 = v14;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_callCategory;
    *((_DWORD *)v4 + 55) |= 0x20u;
  }
  if (self->_serviceProvider)
  {
    objc_msgSend(v14, "setServiceProvider:");
    id v4 = v14;
  }
  $220AD77DD0F5442585F523FC729D513D v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) != 0)
  {
    *((_DWORD *)v4 + 26) = self->_handleType;
    *((_DWORD *)v4 + 55) |= 0x200u;
    $220AD77DD0F5442585F523FC729D513D v6 = self->_has;
  }
  if ((*(unsigned char *)&v6 & 4) != 0)
  {
    *((void *)v4 + 3) = *(void *)&self->_timeToEstablish;
    *((_DWORD *)v4 + 55) |= 4u;
  }
  if (self->_localParticipantHandle) {
    objc_msgSend(v14, "setLocalParticipantHandle:");
  }
  if ([(CHRecentCallPb *)self remoteParticipantHandlesCount])
  {
    [v14 clearRemoteParticipantHandles];
    unint64_t v7 = [(CHRecentCallPb *)self remoteParticipantHandlesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v10 = [(CHRecentCallPb *)self remoteParticipantHandlesAtIndex:i];
        [v14 addRemoteParticipantHandles:v10];
      }
    }
  }
  if (self->_localParticipantUUIDString) {
    objc_msgSend(v14, "setLocalParticipantUUIDString:");
  }
  v11 = v14;
  if (self->_outgoingLocalParticipantUUIDString)
  {
    objc_msgSend(v14, "setOutgoingLocalParticipantUUIDString:");
    v11 = v14;
  }
  $220AD77DD0F5442585F523FC729D513D v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x400) != 0)
  {
    v11[30] = self->_junkConfidence;
    v11[55] |= 0x400u;
    $220AD77DD0F5442585F523FC729D513D v12 = self->_has;
  }
  if ((*(_WORD *)&v12 & 0x8000) != 0)
  {
    v11[53] = self->_verificationStatus;
    v11[55] |= 0x8000u;
  }
  if (self->_callerName)
  {
    objc_msgSend(v14, "setCallerName:");
    v11 = v14;
  }
  if (self->_participantGroupUUIDString)
  {
    objc_msgSend(v14, "setParticipantGroupUUIDString:");
    v11 = v14;
  }
  if (self->_conversationID)
  {
    objc_msgSend(v14, "setConversationID:");
    v11 = v14;
  }
  $220AD77DD0F5442585F523FC729D513D v13 = self->_has;
  if ((*(unsigned char *)&v13 & 8) != 0)
  {
    v11[8] = self->_autoAnsweredReason;
    v11[55] |= 8u;
    $220AD77DD0F5442585F523FC729D513D v13 = self->_has;
  }
  if ((*(_WORD *)&v13 & 0x2000) != 0)
  {
    v11[44] = self->_screenSharingType;
    v11[55] |= 0x2000u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_uniqueId copyWithZone:a3];
  unint64_t v7 = (void *)v5[25];
  v5[25] = v6;

  id v8 = [(NSString *)self->_callerId copyWithZone:a3];
  uint64_t v9 = (void *)v5[7];
  v5[7] = v8;

  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if (*(unsigned char *)&has)
  {
    v5[1] = *(void *)&self->_date;
    *((_DWORD *)v5 + 55) |= 1u;
    $220AD77DD0F5442585F523FC729D513D has = self->_has;
    if ((*(unsigned char *)&has & 0x80) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_36;
    }
  }
  else if ((*(unsigned char *)&has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 12) = self->_callType;
  *((_DWORD *)v5 + 55) |= 0x80u;
  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v5 + 11) = self->_callStatus;
  *((_DWORD *)v5 + 55) |= 0x40u;
  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v5 + 16) = self->_callerIdAvailability;
  *((_DWORD *)v5 + 55) |= 0x100u;
  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((unsigned char *)v5 + 216) = self->_read;
  *((_DWORD *)v5 + 55) |= 0x10000u;
  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v5 + 52) = self->_unreadCount;
  *((_DWORD *)v5 + 55) |= 0x4000u;
  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_41;
  }
LABEL_40:
  v5[2] = *(void *)&self->_duration;
  *((_DWORD *)v5 + 55) |= 2u;
  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v5 + 9) = LODWORD(self->_bytesOfDataUsed);
  *((_DWORD *)v5 + 55) |= 0x10u;
  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_42:
  *((_DWORD *)v5 + 36) = self->_mobileCountryCode;
  *((_DWORD *)v5 + 55) |= 0x800u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_11:
    *((_DWORD *)v5 + 37) = self->_mobileNetworkCode;
    *((_DWORD *)v5 + 55) |= 0x1000u;
  }
LABEL_12:
  id v11 = [(NSString *)self->_devicePhoneId copyWithZone:a3];
  $220AD77DD0F5442585F523FC729D513D v12 = (void *)v5[12];
  v5[12] = v11;

  id v13 = [(NSString *)self->_transaction copyWithZone:a3];
  id v14 = (void *)v5[24];
  v5[24] = v13;

  id v15 = [(NSString *)self->_isoCountryCode copyWithZone:a3];
  long long v16 = (void *)v5[14];
  v5[14] = v15;

  id v17 = [(NSString *)self->_callerIdLocation copyWithZone:a3];
  v18 = (void *)v5[9];
  v5[9] = v17;

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)v5 + 10) = self->_callCategory;
    *((_DWORD *)v5 + 55) |= 0x20u;
  }
  id v19 = [(NSString *)self->_serviceProvider copyWithZone:a3];
  uint64_t v20 = (void *)v5[23];
  v5[23] = v19;

  $220AD77DD0F5442585F523FC729D513D v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x200) != 0)
  {
    *((_DWORD *)v5 + 26) = self->_handleType;
    *((_DWORD *)v5 + 55) |= 0x200u;
    $220AD77DD0F5442585F523FC729D513D v21 = self->_has;
  }
  if ((*(unsigned char *)&v21 & 4) != 0)
  {
    v5[3] = *(void *)&self->_timeToEstablish;
    *((_DWORD *)v5 + 55) |= 4u;
  }
  id v22 = [(CHHandlePb *)self->_localParticipantHandle copyWithZone:a3];
  id v23 = (void *)v5[16];
  v5[16] = v22;

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v24 = self->_remoteParticipantHandles;
  id v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v44;
    do
    {
      v28 = 0;
      do
      {
        if (*(void *)v44 != v27) {
          objc_enumerationMutation(v24);
        }
        id v29 = objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * (void)v28), "copyWithZone:", a3, (void)v43);
        [v5 addRemoteParticipantHandles:v29];

        v28 = (char *)v28 + 1;
      }
      while (v26 != v28);
      id v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v26);
  }

  id v30 = [(NSString *)self->_localParticipantUUIDString copyWithZone:a3];
  v31 = (void *)v5[17];
  v5[17] = v30;

  id v32 = [(NSString *)self->_outgoingLocalParticipantUUIDString copyWithZone:a3];
  v33 = (void *)v5[19];
  v5[19] = v32;

  $220AD77DD0F5442585F523FC729D513D v34 = self->_has;
  if ((*(_WORD *)&v34 & 0x400) != 0)
  {
    *((_DWORD *)v5 + 30) = self->_junkConfidence;
    *((_DWORD *)v5 + 55) |= 0x400u;
    $220AD77DD0F5442585F523FC729D513D v34 = self->_has;
  }
  if ((*(_WORD *)&v34 & 0x8000) != 0)
  {
    *((_DWORD *)v5 + 53) = self->_verificationStatus;
    *((_DWORD *)v5 + 55) |= 0x8000u;
  }
  id v35 = -[NSString copyWithZone:](self->_callerName, "copyWithZone:", a3, (void)v43);
  $220AD77DD0F5442585F523FC729D513D v36 = (void *)v5[10];
  v5[10] = v35;

  id v37 = [(NSString *)self->_participantGroupUUIDString copyWithZone:a3];
  v38 = (void *)v5[20];
  v5[20] = v37;

  id v39 = [(NSString *)self->_conversationID copyWithZone:a3];
  v40 = (void *)v5[11];
  v5[11] = v39;

  $220AD77DD0F5442585F523FC729D513D v41 = self->_has;
  if ((*(unsigned char *)&v41 & 8) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_autoAnsweredReason;
    *((_DWORD *)v5 + 55) |= 8u;
    $220AD77DD0F5442585F523FC729D513D v41 = self->_has;
  }
  if ((*(_WORD *)&v41 & 0x2000) != 0)
  {
    *((_DWORD *)v5 + 44) = self->_screenSharingType;
    *((_DWORD *)v5 + 55) |= 0x2000u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_119;
  }
  uniqueId = self->_uniqueId;
  if ((unint64_t)uniqueId | *((void *)v4 + 25))
  {
    if (!-[NSString isEqual:](uniqueId, "isEqual:")) {
      goto LABEL_119;
    }
  }
  callerId = self->_callerId;
  if ((unint64_t)callerId | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](callerId, "isEqual:")) {
      goto LABEL_119;
    }
  }
  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  int v8 = *((_DWORD *)v4 + 55);
  if (*(unsigned char *)&has)
  {
    if ((v8 & 1) == 0 || self->_date != *((double *)v4 + 1)) {
      goto LABEL_119;
    }
  }
  else if (v8)
  {
    goto LABEL_119;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_callType != *((_DWORD *)v4 + 12)) {
      goto LABEL_119;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_119;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_callStatus != *((_DWORD *)v4 + 11)) {
      goto LABEL_119;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_119;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v8 & 0x100) == 0 || self->_callerIdAvailability != *((_DWORD *)v4 + 16)) {
      goto LABEL_119;
    }
  }
  else if ((v8 & 0x100) != 0)
  {
    goto LABEL_119;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v8 & 0x10000) == 0) {
      goto LABEL_119;
    }
    if (self->_read)
    {
      if (!*((unsigned char *)v4 + 216)) {
        goto LABEL_119;
      }
    }
    else if (*((unsigned char *)v4 + 216))
    {
      goto LABEL_119;
    }
  }
  else if ((v8 & 0x10000) != 0)
  {
    goto LABEL_119;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v8 & 0x4000) == 0 || self->_unreadCount != *((_DWORD *)v4 + 52)) {
      goto LABEL_119;
    }
  }
  else if ((v8 & 0x4000) != 0)
  {
    goto LABEL_119;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_duration != *((double *)v4 + 2)) {
      goto LABEL_119;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_119;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_bytesOfDataUsed != *((float *)v4 + 9)) {
      goto LABEL_119;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_119;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v8 & 0x800) == 0 || self->_mobileCountryCode != *((_DWORD *)v4 + 36)) {
      goto LABEL_119;
    }
  }
  else if ((v8 & 0x800) != 0)
  {
    goto LABEL_119;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v8 & 0x1000) == 0 || self->_mobileNetworkCode != *((_DWORD *)v4 + 37)) {
      goto LABEL_119;
    }
  }
  else if ((v8 & 0x1000) != 0)
  {
    goto LABEL_119;
  }
  devicePhoneId = self->_devicePhoneId;
  if ((unint64_t)devicePhoneId | *((void *)v4 + 12)
    && !-[NSString isEqual:](devicePhoneId, "isEqual:"))
  {
    goto LABEL_119;
  }
  transaction = self->_transaction;
  if ((unint64_t)transaction | *((void *)v4 + 24))
  {
    if (!-[NSString isEqual:](transaction, "isEqual:")) {
      goto LABEL_119;
    }
  }
  isoCountryCode = self->_isoCountryCode;
  if ((unint64_t)isoCountryCode | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](isoCountryCode, "isEqual:")) {
      goto LABEL_119;
    }
  }
  callerIdLocation = self->_callerIdLocation;
  if ((unint64_t)callerIdLocation | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](callerIdLocation, "isEqual:")) {
      goto LABEL_119;
    }
  }
  $220AD77DD0F5442585F523FC729D513D v13 = self->_has;
  int v14 = *((_DWORD *)v4 + 55);
  if ((*(unsigned char *)&v13 & 0x20) != 0)
  {
    if ((v14 & 0x20) == 0 || self->_callCategory != *((_DWORD *)v4 + 10)) {
      goto LABEL_119;
    }
  }
  else if ((v14 & 0x20) != 0)
  {
    goto LABEL_119;
  }
  serviceProvider = self->_serviceProvider;
  if ((unint64_t)serviceProvider | *((void *)v4 + 23))
  {
    if (-[NSString isEqual:](serviceProvider, "isEqual:"))
    {
      $220AD77DD0F5442585F523FC729D513D v13 = self->_has;
      goto LABEL_75;
    }
LABEL_119:
    BOOL v28 = 0;
    goto LABEL_120;
  }
LABEL_75:
  int v16 = *((_DWORD *)v4 + 55);
  if ((*(_WORD *)&v13 & 0x200) != 0)
  {
    if ((v16 & 0x200) == 0 || self->_handleType != *((_DWORD *)v4 + 26)) {
      goto LABEL_119;
    }
  }
  else if ((v16 & 0x200) != 0)
  {
    goto LABEL_119;
  }
  if ((*(unsigned char *)&v13 & 4) != 0)
  {
    if ((v16 & 4) == 0 || self->_timeToEstablish != *((double *)v4 + 3)) {
      goto LABEL_119;
    }
  }
  else if ((v16 & 4) != 0)
  {
    goto LABEL_119;
  }
  localParticipantHandle = self->_localParticipantHandle;
  if ((unint64_t)localParticipantHandle | *((void *)v4 + 16)
    && !-[CHHandlePb isEqual:](localParticipantHandle, "isEqual:"))
  {
    goto LABEL_119;
  }
  remoteParticipantHandles = self->_remoteParticipantHandles;
  if ((unint64_t)remoteParticipantHandles | *((void *)v4 + 21))
  {
    if (!-[NSMutableArray isEqual:](remoteParticipantHandles, "isEqual:")) {
      goto LABEL_119;
    }
  }
  localParticipantUUIDString = self->_localParticipantUUIDString;
  if ((unint64_t)localParticipantUUIDString | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](localParticipantUUIDString, "isEqual:")) {
      goto LABEL_119;
    }
  }
  outgoingLocalParticipantUUIDString = self->_outgoingLocalParticipantUUIDString;
  if ((unint64_t)outgoingLocalParticipantUUIDString | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](outgoingLocalParticipantUUIDString, "isEqual:")) {
      goto LABEL_119;
    }
  }
  $220AD77DD0F5442585F523FC729D513D v21 = self->_has;
  int v22 = *((_DWORD *)v4 + 55);
  if ((*(_WORD *)&v21 & 0x400) != 0)
  {
    if ((v22 & 0x400) == 0 || self->_junkConfidence != *((_DWORD *)v4 + 30)) {
      goto LABEL_119;
    }
  }
  else if ((v22 & 0x400) != 0)
  {
    goto LABEL_119;
  }
  if ((*(_WORD *)&v21 & 0x8000) != 0)
  {
    if ((v22 & 0x8000) == 0 || self->_verificationStatus != *((_DWORD *)v4 + 53)) {
      goto LABEL_119;
    }
  }
  else if ((v22 & 0x8000) != 0)
  {
    goto LABEL_119;
  }
  callerName = self->_callerName;
  if ((unint64_t)callerName | *((void *)v4 + 10)
    && !-[NSString isEqual:](callerName, "isEqual:"))
  {
    goto LABEL_119;
  }
  participantGroupUUIDString = self->_participantGroupUUIDString;
  if ((unint64_t)participantGroupUUIDString | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](participantGroupUUIDString, "isEqual:")) {
      goto LABEL_119;
    }
  }
  conversationID = self->_conversationID;
  if ((unint64_t)conversationID | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](conversationID, "isEqual:")) {
      goto LABEL_119;
    }
  }
  $220AD77DD0F5442585F523FC729D513D v26 = self->_has;
  int v27 = *((_DWORD *)v4 + 55);
  if ((*(unsigned char *)&v26 & 8) != 0)
  {
    if ((v27 & 8) == 0 || self->_autoAnsweredReason != *((_DWORD *)v4 + 8)) {
      goto LABEL_119;
    }
  }
  else if ((v27 & 8) != 0)
  {
    goto LABEL_119;
  }
  if ((*(_WORD *)&v26 & 0x2000) != 0)
  {
    if ((v27 & 0x2000) == 0 || self->_screenSharingType != *((_DWORD *)v4 + 44)) {
      goto LABEL_119;
    }
    BOOL v28 = 1;
  }
  else
  {
    BOOL v28 = (*((_DWORD *)v4 + 55) & 0x2000) == 0;
  }
LABEL_120:

  return v28;
}

- (unint64_t)hash
{
  NSUInteger v57 = [(NSString *)self->_uniqueId hash];
  NSUInteger v56 = [(NSString *)self->_callerId hash];
  $220AD77DD0F5442585F523FC729D513D has = self->_has;
  if (*(unsigned char *)&has)
  {
    double date = self->_date;
    double v6 = -date;
    if (date >= 0.0) {
      double v6 = self->_date;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    uint64_t v54 = 2654435761 * self->_callType;
    if ((*(unsigned char *)&has & 0x40) != 0)
    {
LABEL_11:
      uint64_t v53 = 2654435761 * self->_callStatus;
      if ((*(_WORD *)&has & 0x100) != 0) {
        goto LABEL_12;
      }
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v54 = 0;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_11;
    }
  }
  uint64_t v53 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_12:
    uint64_t v52 = 2654435761 * self->_callerIdAvailability;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v52 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_13:
    uint64_t v51 = 2654435761 * self->_read;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_14;
    }
LABEL_23:
    uint64_t v50 = 0;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_15;
    }
LABEL_24:
    unint64_t v13 = 0;
    goto LABEL_27;
  }
LABEL_22:
  uint64_t v51 = 0;
  if ((*(_WORD *)&has & 0x4000) == 0) {
    goto LABEL_23;
  }
LABEL_14:
  uint64_t v50 = 2654435761 * self->_unreadCount;
  if ((*(unsigned char *)&has & 2) == 0) {
    goto LABEL_24;
  }
LABEL_15:
  double duration = self->_duration;
  double v10 = -duration;
  if (duration >= 0.0) {
    double v10 = self->_duration;
  }
  long double v11 = floor(v10 + 0.5);
  double v12 = (v10 - v11) * 1.84467441e19;
  unint64_t v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0) {
      v13 += (unint64_t)v12;
    }
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_27:
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    float bytesOfDataUsed = self->_bytesOfDataUsed;
    float v16 = -bytesOfDataUsed;
    if (bytesOfDataUsed >= 0.0) {
      float v16 = self->_bytesOfDataUsed;
    }
    float v17 = floorf(v16 + 0.5);
    float v18 = (float)(v16 - v17) * 1.8447e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((*(_WORD *)&has & 0x800) != 0) {
    uint64_t v47 = 2654435761 * self->_mobileCountryCode;
  }
  else {
    uint64_t v47 = 0;
  }
  unint64_t v48 = v14;
  if ((*(_WORD *)&has & 0x1000) != 0) {
    uint64_t v46 = 2654435761 * self->_mobileNetworkCode;
  }
  else {
    uint64_t v46 = 0;
  }
  NSUInteger v45 = [(NSString *)self->_devicePhoneId hash];
  NSUInteger v44 = [(NSString *)self->_transaction hash];
  NSUInteger v43 = [(NSString *)self->_isoCountryCode hash];
  NSUInteger v42 = [(NSString *)self->_callerIdLocation hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v41 = 2654435761 * self->_callCategory;
  }
  else {
    uint64_t v41 = 0;
  }
  NSUInteger v40 = [(NSString *)self->_serviceProvider hash];
  $220AD77DD0F5442585F523FC729D513D v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x200) != 0) {
    uint64_t v39 = 2654435761 * self->_handleType;
  }
  else {
    uint64_t v39 = 0;
  }
  unint64_t v55 = v4;
  if ((*(unsigned char *)&v19 & 4) != 0)
  {
    double timeToEstablish = self->_timeToEstablish;
    double v22 = -timeToEstablish;
    if (timeToEstablish >= 0.0) {
      double v22 = self->_timeToEstablish;
    }
    long double v23 = floor(v22 + 0.5);
    double v24 = (v22 - v23) * 1.84467441e19;
    unint64_t v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0) {
        v20 += (unint64_t)v24;
      }
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    unint64_t v20 = 0;
  }
  unint64_t v49 = v13;
  unint64_t v38 = [(CHHandlePb *)self->_localParticipantHandle hash];
  unint64_t v37 = (unint64_t)[(NSMutableArray *)self->_remoteParticipantHandles hash];
  NSUInteger v25 = [(NSString *)self->_localParticipantUUIDString hash];
  NSUInteger v26 = [(NSString *)self->_outgoingLocalParticipantUUIDString hash];
  $220AD77DD0F5442585F523FC729D513D v27 = self->_has;
  if ((*(_WORD *)&v27 & 0x400) != 0)
  {
    uint64_t v28 = 2654435761 * self->_junkConfidence;
    if ((*(_WORD *)&v27 & 0x8000) != 0) {
      goto LABEL_57;
    }
  }
  else
  {
    uint64_t v28 = 0;
    if ((*(_WORD *)&v27 & 0x8000) != 0)
    {
LABEL_57:
      uint64_t v29 = 2654435761 * self->_verificationStatus;
      goto LABEL_60;
    }
  }
  uint64_t v29 = 0;
LABEL_60:
  NSUInteger v30 = [(NSString *)self->_callerName hash];
  NSUInteger v31 = [(NSString *)self->_participantGroupUUIDString hash];
  NSUInteger v32 = [(NSString *)self->_conversationID hash];
  $220AD77DD0F5442585F523FC729D513D v33 = self->_has;
  if ((*(unsigned char *)&v33 & 8) != 0)
  {
    uint64_t v34 = 2654435761 * self->_autoAnsweredReason;
    if ((*(_WORD *)&v33 & 0x2000) != 0) {
      goto LABEL_62;
    }
LABEL_64:
    uint64_t v35 = 0;
    return v56 ^ v57 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v20 ^ v38 ^ v37 ^ v25 ^ v26 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32 ^ v34 ^ v35;
  }
  uint64_t v34 = 0;
  if ((*(_WORD *)&v33 & 0x2000) == 0) {
    goto LABEL_64;
  }
LABEL_62:
  uint64_t v35 = 2654435761 * self->_screenSharingType;
  return v56 ^ v57 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v20 ^ v38 ^ v37 ^ v25 ^ v26 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32 ^ v34 ^ v35;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 25)) {
    -[CHRecentCallPb setUniqueId:](self, "setUniqueId:");
  }
  if (*((void *)v4 + 7)) {
    -[CHRecentCallPb setCallerId:](self, "setCallerId:");
  }
  int v5 = *((_DWORD *)v4 + 55);
  if (v5)
  {
    self->_double date = *((double *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    int v5 = *((_DWORD *)v4 + 55);
    if ((v5 & 0x80) == 0)
    {
LABEL_7:
      if ((v5 & 0x40) == 0) {
        goto LABEL_8;
      }
      goto LABEL_37;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_7;
  }
  self->_callType = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x80u;
  int v5 = *((_DWORD *)v4 + 55);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_callStatus = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x40u;
  int v5 = *((_DWORD *)v4 + 55);
  if ((v5 & 0x100) == 0)
  {
LABEL_9:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_callerIdAvailability = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x100u;
  int v5 = *((_DWORD *)v4 + 55);
  if ((v5 & 0x10000) == 0)
  {
LABEL_10:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_read = *((unsigned char *)v4 + 216);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v5 = *((_DWORD *)v4 + 55);
  if ((v5 & 0x4000) == 0)
  {
LABEL_11:
    if ((v5 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_unreadCount = *((_DWORD *)v4 + 52);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v5 = *((_DWORD *)v4 + 55);
  if ((v5 & 2) == 0)
  {
LABEL_12:
    if ((v5 & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_double duration = *((double *)v4 + 2);
  *(_DWORD *)&self->_has |= 2u;
  int v5 = *((_DWORD *)v4 + 55);
  if ((v5 & 0x10) == 0)
  {
LABEL_13:
    if ((v5 & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_float bytesOfDataUsed = *((float *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x10u;
  int v5 = *((_DWORD *)v4 + 55);
  if ((v5 & 0x800) == 0)
  {
LABEL_14:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_43:
  self->_mobileCountryCode = *((_DWORD *)v4 + 36);
  *(_DWORD *)&self->_has |= 0x800u;
  if ((*((_DWORD *)v4 + 55) & 0x1000) != 0)
  {
LABEL_15:
    self->_mobileNetworkCode = *((_DWORD *)v4 + 37);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
LABEL_16:
  if (*((void *)v4 + 12)) {
    -[CHRecentCallPb setDevicePhoneId:](self, "setDevicePhoneId:");
  }
  if (*((void *)v4 + 24)) {
    -[CHRecentCallPb setTransaction:](self, "setTransaction:");
  }
  if (*((void *)v4 + 14)) {
    -[CHRecentCallPb setIsoCountryCode:](self, "setIsoCountryCode:");
  }
  if (*((void *)v4 + 9)) {
    -[CHRecentCallPb setCallerIdLocation:](self, "setCallerIdLocation:");
  }
  if ((*((unsigned char *)v4 + 220) & 0x20) != 0)
  {
    self->_callCategory = *((_DWORD *)v4 + 10);
    *(_DWORD *)&self->_has |= 0x20u;
  }
  if (*((void *)v4 + 23)) {
    -[CHRecentCallPb setServiceProvider:](self, "setServiceProvider:");
  }
  int v6 = *((_DWORD *)v4 + 55);
  if ((v6 & 0x200) != 0)
  {
    self->_handleType = *((_DWORD *)v4 + 26);
    *(_DWORD *)&self->_has |= 0x200u;
    int v6 = *((_DWORD *)v4 + 55);
  }
  if ((v6 & 4) != 0)
  {
    self->_double timeToEstablish = *((double *)v4 + 3);
    *(_DWORD *)&self->_has |= 4u;
  }
  localParticipantHandle = self->_localParticipantHandle;
  uint64_t v8 = *((void *)v4 + 16);
  if (localParticipantHandle)
  {
    if (v8) {
      -[CHHandlePb mergeFrom:](localParticipantHandle, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[CHRecentCallPb setLocalParticipantHandle:](self, "setLocalParticipantHandle:");
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = *((id *)v4 + 21);
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        -[CHRecentCallPb addRemoteParticipantHandles:](self, "addRemoteParticipantHandles:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  if (*((void *)v4 + 17)) {
    -[CHRecentCallPb setLocalParticipantUUIDString:](self, "setLocalParticipantUUIDString:");
  }
  if (*((void *)v4 + 19)) {
    -[CHRecentCallPb setOutgoingLocalParticipantUUIDString:](self, "setOutgoingLocalParticipantUUIDString:");
  }
  int v14 = *((_DWORD *)v4 + 55);
  if ((v14 & 0x400) != 0)
  {
    self->_junkConfidence = *((_DWORD *)v4 + 30);
    *(_DWORD *)&self->_has |= 0x400u;
    int v14 = *((_DWORD *)v4 + 55);
  }
  if ((v14 & 0x8000) != 0)
  {
    self->_verificationStatus = *((_DWORD *)v4 + 53);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
  if (*((void *)v4 + 10)) {
    -[CHRecentCallPb setCallerName:](self, "setCallerName:");
  }
  if (*((void *)v4 + 20)) {
    -[CHRecentCallPb setParticipantGroupUUIDString:](self, "setParticipantGroupUUIDString:");
  }
  if (*((void *)v4 + 11)) {
    -[CHRecentCallPb setConversationID:](self, "setConversationID:");
  }
  int v15 = *((_DWORD *)v4 + 55);
  if ((v15 & 8) != 0)
  {
    self->_autoAnsweredReason = *((_DWORD *)v4 + 8);
    *(_DWORD *)&self->_has |= 8u;
    int v15 = *((_DWORD *)v4 + 55);
  }
  if ((v15 & 0x2000) != 0)
  {
    self->_screenSharingType = *((_DWORD *)v4 + 44);
    *(_DWORD *)&self->_has |= 0x2000u;
  }
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (void)setUniqueId:(id)a3
{
}

- (NSString)callerId
{
  return self->_callerId;
}

- (void)setCallerId:(id)a3
{
}

- (double)date
{
  return self->_date;
}

- (unsigned)callType
{
  return self->_callType;
}

- (unsigned)callStatus
{
  return self->_callStatus;
}

- (unsigned)callerIdAvailability
{
  return self->_callerIdAvailability;
}

- (BOOL)read
{
  return self->_read;
}

- (unsigned)unreadCount
{
  return self->_unreadCount;
}

- (double)duration
{
  return self->_duration;
}

- (float)bytesOfDataUsed
{
  return self->_bytesOfDataUsed;
}

- (unsigned)mobileCountryCode
{
  return self->_mobileCountryCode;
}

- (unsigned)mobileNetworkCode
{
  return self->_mobileNetworkCode;
}

- (NSString)devicePhoneId
{
  return self->_devicePhoneId;
}

- (void)setDevicePhoneId:(id)a3
{
}

- (NSString)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (void)setIsoCountryCode:(id)a3
{
}

- (NSString)callerIdLocation
{
  return self->_callerIdLocation;
}

- (void)setCallerIdLocation:(id)a3
{
}

- (unsigned)callCategory
{
  return self->_callCategory;
}

- (NSString)serviceProvider
{
  return self->_serviceProvider;
}

- (void)setServiceProvider:(id)a3
{
}

- (unsigned)handleType
{
  return self->_handleType;
}

- (double)timeToEstablish
{
  return self->_timeToEstablish;
}

- (CHHandlePb)localParticipantHandle
{
  return self->_localParticipantHandle;
}

- (void)setLocalParticipantHandle:(id)a3
{
}

- (NSMutableArray)remoteParticipantHandles
{
  return self->_remoteParticipantHandles;
}

- (void)setRemoteParticipantHandles:(id)a3
{
}

- (NSString)localParticipantUUIDString
{
  return self->_localParticipantUUIDString;
}

- (void)setLocalParticipantUUIDString:(id)a3
{
}

- (NSString)outgoingLocalParticipantUUIDString
{
  return self->_outgoingLocalParticipantUUIDString;
}

- (void)setOutgoingLocalParticipantUUIDString:(id)a3
{
}

- (unsigned)junkConfidence
{
  return self->_junkConfidence;
}

- (unsigned)verificationStatus
{
  return self->_verificationStatus;
}

- (NSString)callerName
{
  return self->_callerName;
}

- (void)setCallerName:(id)a3
{
}

- (NSString)participantGroupUUIDString
{
  return self->_participantGroupUUIDString;
}

- (void)setParticipantGroupUUIDString:(id)a3
{
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
}

- (unsigned)autoAnsweredReason
{
  return self->_autoAnsweredReason;
}

- (unsigned)screenSharingType
{
  return self->_screenSharingType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_serviceProvider, 0);
  objc_storeStrong((id *)&self->_remoteParticipantHandles, 0);
  objc_storeStrong((id *)&self->_participantGroupUUIDString, 0);
  objc_storeStrong((id *)&self->_outgoingLocalParticipantUUIDString, 0);
  objc_storeStrong((id *)&self->_localParticipantUUIDString, 0);
  objc_storeStrong((id *)&self->_localParticipantHandle, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_devicePhoneId, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_callerName, 0);
  objc_storeStrong((id *)&self->_callerIdLocation, 0);
  objc_storeStrong((id *)&self->_callerId, 0);
}

@end