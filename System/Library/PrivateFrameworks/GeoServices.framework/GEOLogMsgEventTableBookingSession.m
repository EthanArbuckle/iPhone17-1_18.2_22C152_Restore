@interface GEOLogMsgEventTableBookingSession
+ (BOOL)isValid:(id)a3;
+ (Class)errorMessageType;
- (BOOL)addedSpecialRequest;
- (BOOL)hasAddedSpecialRequest;
- (BOOL)hasBlurredBookingTimestamp;
- (BOOL)hasBlurredReservationTimestamp;
- (BOOL)hasBookTableAppId;
- (BOOL)hasBookTableSessionId;
- (BOOL)hasDurationOfSessionInSeconds;
- (BOOL)hasEndState;
- (BOOL)hasEndView;
- (BOOL)hasInstallCompleted;
- (BOOL)hasInstallNeeded;
- (BOOL)hasInstallNeededTappedAppId;
- (BOOL)hasMuid;
- (BOOL)hasSwipedAvailableTimes;
- (BOOL)hasTableSize;
- (BOOL)hasTappedDatePicker;
- (BOOL)installCompleted;
- (BOOL)installNeeded;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)swipedAvailableTimes;
- (BOOL)tappedDatePicker;
- (GEOLogMsgEventTableBookingSession)init;
- (GEOLogMsgEventTableBookingSession)initWithData:(id)a3;
- (GEOLogMsgEventTableBookingSession)initWithDictionary:(id)a3;
- (GEOLogMsgEventTableBookingSession)initWithJSON:(id)a3;
- (NSMutableArray)errorMessages;
- (NSString)bookTableAppId;
- (NSString)bookTableSessionId;
- (NSString)installNeededTappedAppId;
- (double)durationOfSessionInSeconds;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)endStateAsString:(int)a3;
- (id)endViewAsString:(int)a3;
- (id)errorMessageAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (int)StringAsEndState:(id)a3;
- (int)StringAsEndView:(id)a3;
- (int)endState;
- (int)endView;
- (int64_t)blurredBookingTimestamp;
- (int64_t)blurredReservationTimestamp;
- (unint64_t)errorMessagesCount;
- (unint64_t)hash;
- (unint64_t)muid;
- (unsigned)tableSize;
- (void)_addNoFlagsErrorMessage:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readBookTableAppId;
- (void)_readBookTableSessionId;
- (void)_readErrorMessages;
- (void)_readInstallNeededTappedAppId;
- (void)addErrorMessage:(id)a3;
- (void)clearErrorMessages;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAddedSpecialRequest:(BOOL)a3;
- (void)setBlurredBookingTimestamp:(int64_t)a3;
- (void)setBlurredReservationTimestamp:(int64_t)a3;
- (void)setBookTableAppId:(id)a3;
- (void)setBookTableSessionId:(id)a3;
- (void)setDurationOfSessionInSeconds:(double)a3;
- (void)setEndState:(int)a3;
- (void)setEndView:(int)a3;
- (void)setErrorMessages:(id)a3;
- (void)setHasAddedSpecialRequest:(BOOL)a3;
- (void)setHasBlurredBookingTimestamp:(BOOL)a3;
- (void)setHasBlurredReservationTimestamp:(BOOL)a3;
- (void)setHasDurationOfSessionInSeconds:(BOOL)a3;
- (void)setHasEndState:(BOOL)a3;
- (void)setHasEndView:(BOOL)a3;
- (void)setHasInstallCompleted:(BOOL)a3;
- (void)setHasInstallNeeded:(BOOL)a3;
- (void)setHasMuid:(BOOL)a3;
- (void)setHasSwipedAvailableTimes:(BOOL)a3;
- (void)setHasTableSize:(BOOL)a3;
- (void)setHasTappedDatePicker:(BOOL)a3;
- (void)setInstallCompleted:(BOOL)a3;
- (void)setInstallNeeded:(BOOL)a3;
- (void)setInstallNeededTappedAppId:(id)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setSwipedAvailableTimes:(BOOL)a3;
- (void)setTableSize:(unsigned int)a3;
- (void)setTappedDatePicker:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventTableBookingSession

- (GEOLogMsgEventTableBookingSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventTableBookingSession;
  v2 = [(GEOLogMsgEventTableBookingSession *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventTableBookingSession)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventTableBookingSession;
  v3 = [(GEOLogMsgEventTableBookingSession *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readBookTableSessionId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 113) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventTableBookingSessionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBookTableSessionId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasBookTableSessionId
{
  return self->_bookTableSessionId != 0;
}

- (NSString)bookTableSessionId
{
  -[GEOLogMsgEventTableBookingSession _readBookTableSessionId]((uint64_t)self);
  bookTableSessionId = self->_bookTableSessionId;

  return bookTableSessionId;
}

- (void)setBookTableSessionId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x12000u;
  objc_storeStrong((id *)&self->_bookTableSessionId, a3);
}

- (int)endState
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $9F9A2A9579ABD3305E4426CE4C6AFAEE flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x10) != 0) {
    return self->_endState;
  }
  else {
    return 0;
  }
}

- (void)setEndState:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10010u;
  self->_endState = a3;
}

- (void)setHasEndState:(BOOL)a3
{
  if (a3) {
    int v3 = 65552;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$9F9A2A9579ABD3305E4426CE4C6AFAEE flags = ($9F9A2A9579ABD3305E4426CE4C6AFAEE)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasEndState
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)endStateAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53ED8F0[a3];
  }

  return v3;
}

- (int)StringAsEndState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"BTES_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BTES_BOOKED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"BTES_ABANDONED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BTES_SUSPENDED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"BTES_PUNCHED_OUT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"BTES_ERROR"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)endView
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $9F9A2A9579ABD3305E4426CE4C6AFAEE flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x20) != 0) {
    return self->_endView;
  }
  else {
    return 0;
  }
}

- (void)setEndView:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10020u;
  self->_endView = a3;
}

- (void)setHasEndView:(BOOL)a3
{
  if (a3) {
    int v3 = 65568;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$9F9A2A9579ABD3305E4426CE4C6AFAEE flags = ($9F9A2A9579ABD3305E4426CE4C6AFAEE)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasEndView
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (id)endViewAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53ED920[a3];
  }

  return v3;
}

- (int)StringAsEndView:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"BTV_NOT_SET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BTV_INSTALL_NEEDED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"BTV_PRE_ENABLE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BTV_PICK_TIME"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"BTV_PICK_DETAILS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"BTV_PRE_RESERVE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"BTV_RESERVING"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"BTV_RESERVED"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readBookTableAppId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 113) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventTableBookingSessionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBookTableAppId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasBookTableAppId
{
  return self->_bookTableAppId != 0;
}

- (NSString)bookTableAppId
{
  -[GEOLogMsgEventTableBookingSession _readBookTableAppId]((uint64_t)self);
  bookTableAppId = self->_bookTableAppId;

  return bookTableAppId;
}

- (void)setBookTableAppId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x11000u;
  objc_storeStrong((id *)&self->_bookTableAppId, a3);
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x10008u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  if (a3) {
    int v3 = 65544;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$9F9A2A9579ABD3305E4426CE4C6AFAEE flags = ($9F9A2A9579ABD3305E4426CE4C6AFAEE)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasMuid
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (int64_t)blurredReservationTimestamp
{
  return self->_blurredReservationTimestamp;
}

- (void)setBlurredReservationTimestamp:(int64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x10002u;
  self->_blurredReservationTimestamp = a3;
}

- (void)setHasBlurredReservationTimestamp:(BOOL)a3
{
  if (a3) {
    int v3 = 65538;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$9F9A2A9579ABD3305E4426CE4C6AFAEE flags = ($9F9A2A9579ABD3305E4426CE4C6AFAEE)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasBlurredReservationTimestamp
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (int64_t)blurredBookingTimestamp
{
  return self->_blurredBookingTimestamp;
}

- (void)setBlurredBookingTimestamp:(int64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x10001u;
  self->_blurredBookingTimestamp = a3;
}

- (void)setHasBlurredBookingTimestamp:(BOOL)a3
{
  self->_$9F9A2A9579ABD3305E4426CE4C6AFAEE flags = ($9F9A2A9579ABD3305E4426CE4C6AFAEE)(*(_DWORD *)&self->_flags & 0xFFFEFFFE | a3 | 0x10000);
}

- (BOOL)hasBlurredBookingTimestamp
{
  return *(_DWORD *)&self->_flags & 1;
}

- (double)durationOfSessionInSeconds
{
  return self->_durationOfSessionInSeconds;
}

- (void)setDurationOfSessionInSeconds:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x10004u;
  self->_durationOfSessionInSeconds = a3;
}

- (void)setHasDurationOfSessionInSeconds:(BOOL)a3
{
  if (a3) {
    int v3 = 65540;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$9F9A2A9579ABD3305E4426CE4C6AFAEE flags = ($9F9A2A9579ABD3305E4426CE4C6AFAEE)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasDurationOfSessionInSeconds
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)installNeeded
{
  return self->_installNeeded;
}

- (void)setInstallNeeded:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10200u;
  self->_installNeeded = a3;
}

- (void)setHasInstallNeeded:(BOOL)a3
{
  if (a3) {
    int v3 = 66048;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$9F9A2A9579ABD3305E4426CE4C6AFAEE flags = ($9F9A2A9579ABD3305E4426CE4C6AFAEE)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
}

- (BOOL)hasInstallNeeded
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (void)_readInstallNeededTappedAppId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 113) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventTableBookingSessionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInstallNeededTappedAppId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasInstallNeededTappedAppId
{
  return self->_installNeededTappedAppId != 0;
}

- (NSString)installNeededTappedAppId
{
  -[GEOLogMsgEventTableBookingSession _readInstallNeededTappedAppId]((uint64_t)self);
  installNeededTappedAppId = self->_installNeededTappedAppId;

  return installNeededTappedAppId;
}

- (void)setInstallNeededTappedAppId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x18000u;
  objc_storeStrong((id *)&self->_installNeededTappedAppId, a3);
}

- (BOOL)installCompleted
{
  return self->_installCompleted;
}

- (void)setInstallCompleted:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10100u;
  self->_installCompleted = a3;
}

- (void)setHasInstallCompleted:(BOOL)a3
{
  if (a3) {
    int v3 = 65792;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$9F9A2A9579ABD3305E4426CE4C6AFAEE flags = ($9F9A2A9579ABD3305E4426CE4C6AFAEE)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasInstallCompleted
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (unsigned)tableSize
{
  return self->_tableSize;
}

- (void)setTableSize:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x10040u;
  self->_tableSize = a3;
}

- (void)setHasTableSize:(BOOL)a3
{
  if (a3) {
    int v3 = 65600;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$9F9A2A9579ABD3305E4426CE4C6AFAEE flags = ($9F9A2A9579ABD3305E4426CE4C6AFAEE)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasTableSize
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (BOOL)addedSpecialRequest
{
  return self->_addedSpecialRequest;
}

- (void)setAddedSpecialRequest:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10080u;
  self->_addedSpecialRequest = a3;
}

- (void)setHasAddedSpecialRequest:(BOOL)a3
{
  if (a3) {
    int v3 = 65664;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$9F9A2A9579ABD3305E4426CE4C6AFAEE flags = ($9F9A2A9579ABD3305E4426CE4C6AFAEE)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasAddedSpecialRequest
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (BOOL)swipedAvailableTimes
{
  return self->_swipedAvailableTimes;
}

- (void)setSwipedAvailableTimes:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10400u;
  self->_swipedAvailableTimes = a3;
}

- (void)setHasSwipedAvailableTimes:(BOOL)a3
{
  if (a3) {
    int v3 = 66560;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$9F9A2A9579ABD3305E4426CE4C6AFAEE flags = ($9F9A2A9579ABD3305E4426CE4C6AFAEE)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasSwipedAvailableTimes
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (BOOL)tappedDatePicker
{
  return self->_tappedDatePicker;
}

- (void)setTappedDatePicker:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10800u;
  self->_tappedDatePicker = a3;
}

- (void)setHasTappedDatePicker:(BOOL)a3
{
  if (a3) {
    int v3 = 67584;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$9F9A2A9579ABD3305E4426CE4C6AFAEE flags = ($9F9A2A9579ABD3305E4426CE4C6AFAEE)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v3);
}

- (BOOL)hasTappedDatePicker
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (void)_readErrorMessages
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 113) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventTableBookingSessionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readErrorMessages_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)errorMessages
{
  -[GEOLogMsgEventTableBookingSession _readErrorMessages]((uint64_t)self);
  errorMessages = self->_errorMessages;

  return errorMessages;
}

- (void)setErrorMessages:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  errorMessages = self->_errorMessages;
  self->_errorMessages = v4;
}

- (void)clearErrorMessages
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  errorMessages = self->_errorMessages;

  [(NSMutableArray *)errorMessages removeAllObjects];
}

- (void)addErrorMessage:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgEventTableBookingSession _readErrorMessages]((uint64_t)self);
  -[GEOLogMsgEventTableBookingSession _addNoFlagsErrorMessage:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (void)_addNoFlagsErrorMessage:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      id v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)errorMessagesCount
{
  -[GEOLogMsgEventTableBookingSession _readErrorMessages]((uint64_t)self);
  errorMessages = self->_errorMessages;

  return [(NSMutableArray *)errorMessages count];
}

- (id)errorMessageAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventTableBookingSession _readErrorMessages]((uint64_t)self);
  errorMessages = self->_errorMessages;

  return (id)[(NSMutableArray *)errorMessages objectAtIndex:a3];
}

+ (Class)errorMessageType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventTableBookingSession;
  id v4 = [(GEOLogMsgEventTableBookingSession *)&v8 description];
  id v5 = [(GEOLogMsgEventTableBookingSession *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventTableBookingSession _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_56;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [(id)a1 bookTableSessionId];
  if (v5)
  {
    if (a2) {
      objc_super v6 = @"bookTableSessionId";
    }
    else {
      objc_super v6 = @"book_table_session_id";
    }
    [v4 setObject:v5 forKey:v6];
  }

  int v7 = *(_DWORD *)(a1 + 112);
  if ((v7 & 0x10) != 0)
  {
    uint64_t v8 = *(int *)(a1 + 92);
    if (v8 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 92));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E53ED8F0[v8];
    }
    if (a2) {
      v10 = @"endState";
    }
    else {
      v10 = @"end_state";
    }
    [v4 setObject:v9 forKey:v10];

    int v7 = *(_DWORD *)(a1 + 112);
  }
  if ((v7 & 0x20) != 0)
  {
    uint64_t v11 = *(int *)(a1 + 96);
    if (v11 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 96));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E53ED920[v11];
    }
    if (a2) {
      v13 = @"endView";
    }
    else {
      v13 = @"end_view";
    }
    [v4 setObject:v12 forKey:v13];
  }
  v14 = [(id)a1 bookTableAppId];
  if (v14)
  {
    if (a2) {
      v15 = @"bookTableAppId";
    }
    else {
      v15 = @"book_table_app_id";
    }
    [v4 setObject:v14 forKey:v15];
  }

  int v16 = *(_DWORD *)(a1 + 112);
  if ((v16 & 8) != 0)
  {
    v27 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 72)];
    [v4 setObject:v27 forKey:@"muid"];

    int v16 = *(_DWORD *)(a1 + 112);
    if ((v16 & 2) == 0)
    {
LABEL_30:
      if ((v16 & 1) == 0) {
        goto LABEL_31;
      }
      goto LABEL_64;
    }
  }
  else if ((v16 & 2) == 0)
  {
    goto LABEL_30;
  }
  v28 = [NSNumber numberWithLongLong:*(void *)(a1 + 24)];
  if (a2) {
    v29 = @"blurredReservationTimestamp";
  }
  else {
    v29 = @"blurred_reservation_timestamp";
  }
  [v4 setObject:v28 forKey:v29];

  int v16 = *(_DWORD *)(a1 + 112);
  if ((v16 & 1) == 0)
  {
LABEL_31:
    if ((v16 & 4) == 0) {
      goto LABEL_32;
    }
    goto LABEL_68;
  }
LABEL_64:
  v30 = [NSNumber numberWithLongLong:*(void *)(a1 + 16)];
  if (a2) {
    v31 = @"blurredBookingTimestamp";
  }
  else {
    v31 = @"blurred_booking_timestamp";
  }
  [v4 setObject:v30 forKey:v31];

  int v16 = *(_DWORD *)(a1 + 112);
  if ((v16 & 4) == 0)
  {
LABEL_32:
    if ((v16 & 0x200) == 0) {
      goto LABEL_37;
    }
    goto LABEL_33;
  }
LABEL_68:
  v32 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  if (a2) {
    v33 = @"durationOfSessionInSeconds";
  }
  else {
    v33 = @"duration_of_session_in_seconds";
  }
  [v4 setObject:v32 forKey:v33];

  if ((*(_DWORD *)(a1 + 112) & 0x200) != 0)
  {
LABEL_33:
    v17 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 106)];
    if (a2) {
      v18 = @"installNeeded";
    }
    else {
      v18 = @"install_needed";
    }
    [v4 setObject:v17 forKey:v18];
  }
LABEL_37:
  v19 = [(id)a1 installNeededTappedAppId];
  if (v19)
  {
    if (a2) {
      v20 = @"installNeededTappedAppId";
    }
    else {
      v20 = @"install_needed_tapped_app_id";
    }
    [v4 setObject:v19 forKey:v20];
  }

  int v21 = *(_DWORD *)(a1 + 112);
  if ((v21 & 0x100) != 0)
  {
    v34 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 105)];
    if (a2) {
      v35 = @"installCompleted";
    }
    else {
      v35 = @"install_completed";
    }
    [v4 setObject:v34 forKey:v35];

    int v21 = *(_DWORD *)(a1 + 112);
    if ((v21 & 0x40) == 0)
    {
LABEL_44:
      if ((v21 & 0x80) == 0) {
        goto LABEL_45;
      }
      goto LABEL_81;
    }
  }
  else if ((v21 & 0x40) == 0)
  {
    goto LABEL_44;
  }
  v36 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 100)];
  if (a2) {
    v37 = @"tableSize";
  }
  else {
    v37 = @"table_size";
  }
  [v4 setObject:v36 forKey:v37];

  int v21 = *(_DWORD *)(a1 + 112);
  if ((v21 & 0x80) == 0)
  {
LABEL_45:
    if ((v21 & 0x400) == 0) {
      goto LABEL_46;
    }
    goto LABEL_85;
  }
LABEL_81:
  v38 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 104)];
  if (a2) {
    v39 = @"addedSpecialRequest";
  }
  else {
    v39 = @"added_special_request";
  }
  [v4 setObject:v38 forKey:v39];

  int v21 = *(_DWORD *)(a1 + 112);
  if ((v21 & 0x400) == 0)
  {
LABEL_46:
    if ((v21 & 0x800) == 0) {
      goto LABEL_51;
    }
    goto LABEL_47;
  }
LABEL_85:
  v40 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 107)];
  if (a2) {
    v41 = @"swipedAvailableTimes";
  }
  else {
    v41 = @"swiped_available_times";
  }
  [v4 setObject:v40 forKey:v41];

  if ((*(_DWORD *)(a1 + 112) & 0x800) != 0)
  {
LABEL_47:
    v22 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 108)];
    if (a2) {
      v23 = @"tappedDatePicker";
    }
    else {
      v23 = @"tapped_date_picker";
    }
    [v4 setObject:v22 forKey:v23];
  }
LABEL_51:
  if (*(void *)(a1 + 56))
  {
    v24 = [(id)a1 errorMessages];
    if (a2) {
      v25 = @"errorMessage";
    }
    else {
      v25 = @"error_message";
    }
    [v4 setObject:v24 forKey:v25];
  }
LABEL_56:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventTableBookingSession _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventTableBookingSession)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventTableBookingSession *)-[GEOLogMsgEventTableBookingSession _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_126;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_126;
  }
  if (a3) {
    objc_super v6 = @"bookTableSessionId";
  }
  else {
    objc_super v6 = @"book_table_session_id";
  }
  int v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = (void *)[v7 copy];
    [a1 setBookTableSessionId:v8];
  }
  if (a3) {
    v9 = @"endState";
  }
  else {
    v9 = @"end_state";
  }
  v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;
    if ([v11 isEqualToString:@"BTES_UNKNOWN"])
    {
      uint64_t v12 = 0;
    }
    else if ([v11 isEqualToString:@"BTES_BOOKED"])
    {
      uint64_t v12 = 1;
    }
    else if ([v11 isEqualToString:@"BTES_ABANDONED"])
    {
      uint64_t v12 = 2;
    }
    else if ([v11 isEqualToString:@"BTES_SUSPENDED"])
    {
      uint64_t v12 = 3;
    }
    else if ([v11 isEqualToString:@"BTES_PUNCHED_OUT"])
    {
      uint64_t v12 = 4;
    }
    else if ([v11 isEqualToString:@"BTES_ERROR"])
    {
      uint64_t v12 = 5;
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_29;
    }
    uint64_t v12 = [v10 intValue];
  }
  [a1 setEndState:v12];
LABEL_29:

  if (a3) {
    v13 = @"endView";
  }
  else {
    v13 = @"end_view";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v14;
    if ([v15 isEqualToString:@"BTV_NOT_SET"])
    {
      uint64_t v16 = 0;
    }
    else if ([v15 isEqualToString:@"BTV_INSTALL_NEEDED"])
    {
      uint64_t v16 = 1;
    }
    else if ([v15 isEqualToString:@"BTV_PRE_ENABLE"])
    {
      uint64_t v16 = 2;
    }
    else if ([v15 isEqualToString:@"BTV_PICK_TIME"])
    {
      uint64_t v16 = 3;
    }
    else if ([v15 isEqualToString:@"BTV_PICK_DETAILS"])
    {
      uint64_t v16 = 4;
    }
    else if ([v15 isEqualToString:@"BTV_PRE_RESERVE"])
    {
      uint64_t v16 = 5;
    }
    else if ([v15 isEqualToString:@"BTV_RESERVING"])
    {
      uint64_t v16 = 6;
    }
    else if ([v15 isEqualToString:@"BTV_RESERVED"])
    {
      uint64_t v16 = 7;
    }
    else
    {
      uint64_t v16 = 0;
    }

    goto LABEL_53;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = [v14 intValue];
LABEL_53:
    [a1 setEndView:v16];
  }

  if (a3) {
    v17 = @"bookTableAppId";
  }
  else {
    v17 = @"book_table_app_id";
  }
  v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19 = (void *)[v18 copy];
    [a1 setBookTableAppId:v19];
  }
  v20 = [v5 objectForKeyedSubscript:@"muid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setMuid:", objc_msgSend(v20, "unsignedLongLongValue"));
  }

  if (a3) {
    int v21 = @"blurredReservationTimestamp";
  }
  else {
    int v21 = @"blurred_reservation_timestamp";
  }
  v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setBlurredReservationTimestamp:", objc_msgSend(v22, "longLongValue"));
  }

  if (a3) {
    v23 = @"blurredBookingTimestamp";
  }
  else {
    v23 = @"blurred_booking_timestamp";
  }
  v24 = [v5 objectForKeyedSubscript:v23];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setBlurredBookingTimestamp:", objc_msgSend(v24, "longLongValue"));
  }

  if (a3) {
    v25 = @"durationOfSessionInSeconds";
  }
  else {
    v25 = @"duration_of_session_in_seconds";
  }
  v26 = [v5 objectForKeyedSubscript:v25];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v26 doubleValue];
    objc_msgSend(a1, "setDurationOfSessionInSeconds:");
  }

  if (a3) {
    v27 = @"installNeeded";
  }
  else {
    v27 = @"install_needed";
  }
  v28 = [v5 objectForKeyedSubscript:v27];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setInstallNeeded:", objc_msgSend(v28, "BOOLValue"));
  }

  if (a3) {
    v29 = @"installNeededTappedAppId";
  }
  else {
    v29 = @"install_needed_tapped_app_id";
  }
  v30 = [v5 objectForKeyedSubscript:v29];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v31 = (void *)[v30 copy];
    [a1 setInstallNeededTappedAppId:v31];
  }
  if (a3) {
    v32 = @"installCompleted";
  }
  else {
    v32 = @"install_completed";
  }
  v33 = [v5 objectForKeyedSubscript:v32];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setInstallCompleted:", objc_msgSend(v33, "BOOLValue"));
  }

  if (a3) {
    v34 = @"tableSize";
  }
  else {
    v34 = @"table_size";
  }
  v35 = [v5 objectForKeyedSubscript:v34];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTableSize:", objc_msgSend(v35, "unsignedIntValue"));
  }

  if (a3) {
    v36 = @"addedSpecialRequest";
  }
  else {
    v36 = @"added_special_request";
  }
  v37 = [v5 objectForKeyedSubscript:v36];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setAddedSpecialRequest:", objc_msgSend(v37, "BOOLValue"));
  }

  if (a3) {
    v38 = @"swipedAvailableTimes";
  }
  else {
    v38 = @"swiped_available_times";
  }
  v39 = [v5 objectForKeyedSubscript:v38];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setSwipedAvailableTimes:", objc_msgSend(v39, "BOOLValue"));
  }

  if (a3) {
    v40 = @"tappedDatePicker";
  }
  else {
    v40 = @"tapped_date_picker";
  }
  v41 = [v5 objectForKeyedSubscript:v40];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTappedDatePicker:", objc_msgSend(v41, "BOOLValue"));
  }

  if (a3) {
    v42 = @"errorMessage";
  }
  else {
    v42 = @"error_message";
  }
  v43 = [v5 objectForKeyedSubscript:v42];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v44 = v43;
    uint64_t v45 = [v44 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v53;
      do
      {
        uint64_t v48 = 0;
        do
        {
          if (*(void *)v53 != v47) {
            objc_enumerationMutation(v44);
          }
          v49 = *(void **)(*((void *)&v52 + 1) + 8 * v48);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v50 = objc_msgSend(v49, "copy", (void)v52);
            [a1 addErrorMessage:v50];
          }
          ++v48;
        }
        while (v46 != v48);
        uint64_t v46 = [v44 countByEnumeratingWithState:&v52 objects:v56 count:16];
      }
      while (v46);
    }
  }
LABEL_126:

  return a1;
}

- (GEOLogMsgEventTableBookingSession)initWithJSON:(id)a3
{
  return (GEOLogMsgEventTableBookingSession *)-[GEOLogMsgEventTableBookingSession _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    int v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_350;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_351;
    }
    GEOLogMsgEventTableBookingSessionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventTableBookingSessionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventTableBookingSessionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_DWORD *)&self->_flags & 0x1F000) == 0)
    {
      v13 = self->_reader;
      objc_sync_enter(v13);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      v14 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v4 writeData:v14];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v13);
      goto LABEL_44;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgEventTableBookingSession *)self readAll:0];
  if (self->_bookTableSessionId) {
    PBDataWriterWriteStringField();
  }
  $9F9A2A9579ABD3305E4426CE4C6AFAEE flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    $9F9A2A9579ABD3305E4426CE4C6AFAEE flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_bookTableAppId) {
    PBDataWriterWriteStringField();
  }
  $9F9A2A9579ABD3305E4426CE4C6AFAEE v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    $9F9A2A9579ABD3305E4426CE4C6AFAEE v7 = self->_flags;
    if ((*(unsigned char *)&v7 & 2) == 0)
    {
LABEL_13:
      if ((*(unsigned char *)&v7 & 1) == 0) {
        goto LABEL_14;
      }
      goto LABEL_35;
    }
  }
  else if ((*(unsigned char *)&v7 & 2) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteInt64Field();
  $9F9A2A9579ABD3305E4426CE4C6AFAEE v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 1) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&v7 & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteInt64Field();
  $9F9A2A9579ABD3305E4426CE4C6AFAEE v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 4) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v7 & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_36:
  PBDataWriterWriteDoubleField();
  if ((*(_DWORD *)&self->_flags & 0x200) != 0) {
LABEL_16:
  }
    PBDataWriterWriteBOOLField();
LABEL_17:
  if (self->_installNeededTappedAppId) {
    PBDataWriterWriteStringField();
  }
  $9F9A2A9579ABD3305E4426CE4C6AFAEE v8 = self->_flags;
  if ((*(_WORD *)&v8 & 0x100) != 0)
  {
    PBDataWriterWriteBOOLField();
    $9F9A2A9579ABD3305E4426CE4C6AFAEE v8 = self->_flags;
    if ((*(unsigned char *)&v8 & 0x40) == 0)
    {
LABEL_21:
      if ((*(unsigned char *)&v8 & 0x80) == 0) {
        goto LABEL_22;
      }
      goto LABEL_40;
    }
  }
  else if ((*(unsigned char *)&v8 & 0x40) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteUint32Field();
  $9F9A2A9579ABD3305E4426CE4C6AFAEE v8 = self->_flags;
  if ((*(unsigned char *)&v8 & 0x80) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v8 & 0x400) == 0) {
      goto LABEL_23;
    }
LABEL_41:
    PBDataWriterWriteBOOLField();
    if ((*(_DWORD *)&self->_flags & 0x800) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_40:
  PBDataWriterWriteBOOLField();
  $9F9A2A9579ABD3305E4426CE4C6AFAEE v8 = self->_flags;
  if ((*(_WORD *)&v8 & 0x400) != 0) {
    goto LABEL_41;
  }
LABEL_23:
  if ((*(_WORD *)&v8 & 0x800) != 0) {
LABEL_24:
  }
    PBDataWriterWriteBOOLField();
LABEL_25:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v9 = self->_errorMessages;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

LABEL_44:
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = (id *)a3;
  [(GEOLogMsgEventTableBookingSession *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 20) = self->_readerMarkPos;
  *((_DWORD *)v12 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_bookTableSessionId) {
    objc_msgSend(v12, "setBookTableSessionId:");
  }
  $9F9A2A9579ABD3305E4426CE4C6AFAEE flags = self->_flags;
  id v5 = v12;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    *((_DWORD *)v12 + 23) = self->_endState;
    *((_DWORD *)v12 + 28) |= 0x10u;
    $9F9A2A9579ABD3305E4426CE4C6AFAEE flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    *((_DWORD *)v12 + 24) = self->_endView;
    *((_DWORD *)v12 + 28) |= 0x20u;
  }
  if (self->_bookTableAppId)
  {
    objc_msgSend(v12, "setBookTableAppId:");
    id v5 = v12;
  }
  $9F9A2A9579ABD3305E4426CE4C6AFAEE v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 8) != 0)
  {
    v5[9] = self->_muid;
    *((_DWORD *)v5 + 28) |= 8u;
    $9F9A2A9579ABD3305E4426CE4C6AFAEE v6 = self->_flags;
    if ((*(unsigned char *)&v6 & 2) == 0)
    {
LABEL_11:
      if ((*(unsigned char *)&v6 & 1) == 0) {
        goto LABEL_12;
      }
      goto LABEL_32;
    }
  }
  else if ((*(unsigned char *)&v6 & 2) == 0)
  {
    goto LABEL_11;
  }
  v5[3] = self->_blurredReservationTimestamp;
  *((_DWORD *)v5 + 28) |= 2u;
  $9F9A2A9579ABD3305E4426CE4C6AFAEE v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 1) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&v6 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  v5[2] = self->_blurredBookingTimestamp;
  *((_DWORD *)v5 + 28) |= 1u;
  $9F9A2A9579ABD3305E4426CE4C6AFAEE v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 4) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v6 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_33:
  v5[6] = *(id *)&self->_durationOfSessionInSeconds;
  *((_DWORD *)v5 + 28) |= 4u;
  if ((*(_DWORD *)&self->_flags & 0x200) != 0)
  {
LABEL_14:
    *((unsigned char *)v5 + 106) = self->_installNeeded;
    *((_DWORD *)v5 + 28) |= 0x200u;
  }
LABEL_15:
  if (self->_installNeededTappedAppId)
  {
    objc_msgSend(v12, "setInstallNeededTappedAppId:");
    id v5 = v12;
  }
  $9F9A2A9579ABD3305E4426CE4C6AFAEE v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x100) != 0)
  {
    *((unsigned char *)v5 + 105) = self->_installCompleted;
    *((_DWORD *)v5 + 28) |= 0x100u;
    $9F9A2A9579ABD3305E4426CE4C6AFAEE v7 = self->_flags;
    if ((*(unsigned char *)&v7 & 0x40) == 0)
    {
LABEL_19:
      if ((*(unsigned char *)&v7 & 0x80) == 0) {
        goto LABEL_20;
      }
      goto LABEL_37;
    }
  }
  else if ((*(unsigned char *)&v7 & 0x40) == 0)
  {
    goto LABEL_19;
  }
  *((_DWORD *)v5 + 25) = self->_tableSize;
  *((_DWORD *)v5 + 28) |= 0x40u;
  $9F9A2A9579ABD3305E4426CE4C6AFAEE v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 0x80) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v7 & 0x400) == 0) {
      goto LABEL_21;
    }
LABEL_38:
    *((unsigned char *)v5 + 107) = self->_swipedAvailableTimes;
    *((_DWORD *)v5 + 28) |= 0x400u;
    if ((*(_DWORD *)&self->_flags & 0x800) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_37:
  *((unsigned char *)v5 + 104) = self->_addedSpecialRequest;
  *((_DWORD *)v5 + 28) |= 0x80u;
  $9F9A2A9579ABD3305E4426CE4C6AFAEE v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x400) != 0) {
    goto LABEL_38;
  }
LABEL_21:
  if ((*(_WORD *)&v7 & 0x800) != 0)
  {
LABEL_22:
    *((unsigned char *)v5 + 108) = self->_tappedDatePicker;
    *((_DWORD *)v5 + 28) |= 0x800u;
  }
LABEL_23:
  if ([(GEOLogMsgEventTableBookingSession *)self errorMessagesCount])
  {
    [v12 clearErrorMessages];
    unint64_t v8 = [(GEOLogMsgEventTableBookingSession *)self errorMessagesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t i = 0; i != v9; ++i)
      {
        uint64_t v11 = [(GEOLogMsgEventTableBookingSession *)self errorMessageAtIndex:i];
        [v12 addErrorMessage:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    $9F9A2A9579ABD3305E4426CE4C6AFAEE v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 2) & 1) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLogMsgEventTableBookingSessionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      unint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_28;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgEventTableBookingSession *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_bookTableSessionId copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  $9F9A2A9579ABD3305E4426CE4C6AFAEE flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_endState;
    *(_DWORD *)(v5 + 112) |= 0x10u;
    $9F9A2A9579ABD3305E4426CE4C6AFAEE flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_endView;
    *(_DWORD *)(v5 + 112) |= 0x20u;
  }
  uint64_t v12 = [(NSString *)self->_bookTableAppId copyWithZone:a3];
  v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  $9F9A2A9579ABD3305E4426CE4C6AFAEE v14 = self->_flags;
  if ((*(unsigned char *)&v14 & 8) != 0)
  {
    *(void *)(v5 + 72) = self->_muid;
    *(_DWORD *)(v5 + 112) |= 8u;
    $9F9A2A9579ABD3305E4426CE4C6AFAEE v14 = self->_flags;
    if ((*(unsigned char *)&v14 & 2) == 0)
    {
LABEL_11:
      if ((*(unsigned char *)&v14 & 1) == 0) {
        goto LABEL_12;
      }
      goto LABEL_31;
    }
  }
  else if ((*(unsigned char *)&v14 & 2) == 0)
  {
    goto LABEL_11;
  }
  *(void *)(v5 + 24) = self->_blurredReservationTimestamp;
  *(_DWORD *)(v5 + 112) |= 2u;
  $9F9A2A9579ABD3305E4426CE4C6AFAEE v14 = self->_flags;
  if ((*(unsigned char *)&v14 & 1) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&v14 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_32;
  }
LABEL_31:
  *(void *)(v5 + 16) = self->_blurredBookingTimestamp;
  *(_DWORD *)(v5 + 112) |= 1u;
  $9F9A2A9579ABD3305E4426CE4C6AFAEE v14 = self->_flags;
  if ((*(unsigned char *)&v14 & 4) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v14 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_32:
  *(double *)(v5 + 48) = self->_durationOfSessionInSeconds;
  *(_DWORD *)(v5 + 112) |= 4u;
  if ((*(_DWORD *)&self->_flags & 0x200) != 0)
  {
LABEL_14:
    *(unsigned char *)(v5 + 106) = self->_installNeeded;
    *(_DWORD *)(v5 + 112) |= 0x200u;
  }
LABEL_15:
  uint64_t v15 = [(NSString *)self->_installNeededTappedAppId copyWithZone:a3];
  long long v16 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v15;

  $9F9A2A9579ABD3305E4426CE4C6AFAEE v17 = self->_flags;
  if ((*(_WORD *)&v17 & 0x100) != 0)
  {
    *(unsigned char *)(v5 + 105) = self->_installCompleted;
    *(_DWORD *)(v5 + 112) |= 0x100u;
    $9F9A2A9579ABD3305E4426CE4C6AFAEE v17 = self->_flags;
    if ((*(unsigned char *)&v17 & 0x40) == 0)
    {
LABEL_17:
      if ((*(unsigned char *)&v17 & 0x80) == 0) {
        goto LABEL_18;
      }
      goto LABEL_36;
    }
  }
  else if ((*(unsigned char *)&v17 & 0x40) == 0)
  {
    goto LABEL_17;
  }
  *(_DWORD *)(v5 + 100) = self->_tableSize;
  *(_DWORD *)(v5 + 112) |= 0x40u;
  $9F9A2A9579ABD3305E4426CE4C6AFAEE v17 = self->_flags;
  if ((*(unsigned char *)&v17 & 0x80) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v17 & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_37;
  }
LABEL_36:
  *(unsigned char *)(v5 + 104) = self->_addedSpecialRequest;
  *(_DWORD *)(v5 + 112) |= 0x80u;
  $9F9A2A9579ABD3305E4426CE4C6AFAEE v17 = self->_flags;
  if ((*(_WORD *)&v17 & 0x400) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v17 & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_37:
  *(unsigned char *)(v5 + 107) = self->_swipedAvailableTimes;
  *(_DWORD *)(v5 + 112) |= 0x400u;
  if ((*(_DWORD *)&self->_flags & 0x800) != 0)
  {
LABEL_20:
    *(unsigned char *)(v5 + 108) = self->_tappedDatePicker;
    *(_DWORD *)(v5 + 112) |= 0x800u;
  }
LABEL_21:
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  unint64_t v8 = self->_errorMessages;
  uint64_t v18 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v8);
        }
        int v21 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "copyWithZone:", a3, (void)v23);
        [(id)v5 addErrorMessage:v21];
      }
      uint64_t v18 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v18);
  }
LABEL_28:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_81;
  }
  [(GEOLogMsgEventTableBookingSession *)self readAll:1];
  [v4 readAll:1];
  bookTableSessionId = self->_bookTableSessionId;
  if ((unint64_t)bookTableSessionId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](bookTableSessionId, "isEqual:")) {
      goto LABEL_81;
    }
  }
  $9F9A2A9579ABD3305E4426CE4C6AFAEE flags = self->_flags;
  int v7 = *((_DWORD *)v4 + 28);
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_endState != *((_DWORD *)v4 + 23)) {
      goto LABEL_81;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_81;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_endView != *((_DWORD *)v4 + 24)) {
      goto LABEL_81;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_81;
  }
  bookTableAppId = self->_bookTableAppId;
  if ((unint64_t)bookTableAppId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](bookTableAppId, "isEqual:")) {
      goto LABEL_81;
    }
    $9F9A2A9579ABD3305E4426CE4C6AFAEE flags = self->_flags;
    int v7 = *((_DWORD *)v4 + 28);
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_muid != *((void *)v4 + 9)) {
      goto LABEL_81;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_81;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_blurredReservationTimestamp != *((void *)v4 + 3)) {
      goto LABEL_81;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_81;
  }
  if (*(unsigned char *)&flags)
  {
    if ((v7 & 1) == 0 || self->_blurredBookingTimestamp != *((void *)v4 + 2)) {
      goto LABEL_81;
    }
  }
  else if (v7)
  {
    goto LABEL_81;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_durationOfSessionInSeconds != *((double *)v4 + 6)) {
      goto LABEL_81;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0) {
      goto LABEL_81;
    }
    if (self->_installNeeded)
    {
      if (!*((unsigned char *)v4 + 106)) {
        goto LABEL_81;
      }
    }
    else if (*((unsigned char *)v4 + 106))
    {
      goto LABEL_81;
    }
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_81;
  }
  installNeededTappedAppId = self->_installNeededTappedAppId;
  if ((unint64_t)installNeededTappedAppId | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](installNeededTappedAppId, "isEqual:")) {
      goto LABEL_81;
    }
    $9F9A2A9579ABD3305E4426CE4C6AFAEE flags = self->_flags;
    int v7 = *((_DWORD *)v4 + 28);
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0) {
      goto LABEL_81;
    }
    if (self->_installCompleted)
    {
      if (!*((unsigned char *)v4 + 105)) {
        goto LABEL_81;
      }
    }
    else if (*((unsigned char *)v4 + 105))
    {
      goto LABEL_81;
    }
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_81;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_tableSize != *((_DWORD *)v4 + 25)) {
      goto LABEL_81;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_81;
  }
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0) {
      goto LABEL_81;
    }
    if (self->_addedSpecialRequest)
    {
      if (!*((unsigned char *)v4 + 104)) {
        goto LABEL_81;
      }
    }
    else if (*((unsigned char *)v4 + 104))
    {
      goto LABEL_81;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0) {
      goto LABEL_81;
    }
    if (self->_swipedAvailableTimes)
    {
      if (!*((unsigned char *)v4 + 107)) {
        goto LABEL_81;
      }
    }
    else if (*((unsigned char *)v4 + 107))
    {
      goto LABEL_81;
    }
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&flags & 0x800) == 0)
  {
    if ((v7 & 0x800) == 0) {
      goto LABEL_87;
    }
LABEL_81:
    char v10 = 0;
    goto LABEL_82;
  }
  if ((v7 & 0x800) == 0) {
    goto LABEL_81;
  }
  if (!self->_tappedDatePicker)
  {
    if (!*((unsigned char *)v4 + 108)) {
      goto LABEL_87;
    }
    goto LABEL_81;
  }
  if (!*((unsigned char *)v4 + 108)) {
    goto LABEL_81;
  }
LABEL_87:
  errorMessages = self->_errorMessages;
  if ((unint64_t)errorMessages | *((void *)v4 + 7)) {
    char v10 = -[NSMutableArray isEqual:](errorMessages, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_82:

  return v10;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventTableBookingSession *)self readAll:1];
  NSUInteger v26 = [(NSString *)self->_bookTableSessionId hash];
  $9F9A2A9579ABD3305E4426CE4C6AFAEE flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    uint64_t v24 = 2654435761 * self->_endState;
    if ((*(unsigned char *)&flags & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v24 = 0;
    if ((*(unsigned char *)&flags & 0x20) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_endView;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_bookTableAppId hash];
  $9F9A2A9579ABD3305E4426CE4C6AFAEE v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 8) != 0)
  {
    unint64_t v7 = 2654435761u * self->_muid;
    if ((*(unsigned char *)&v6 & 2) != 0)
    {
LABEL_8:
      uint64_t v8 = 2654435761 * self->_blurredReservationTimestamp;
      if (*(unsigned char *)&v6) {
        goto LABEL_9;
      }
LABEL_16:
      uint64_t v9 = 0;
      if ((*(unsigned char *)&v6 & 4) != 0) {
        goto LABEL_10;
      }
LABEL_17:
      unint64_t v14 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    unint64_t v7 = 0;
    if ((*(unsigned char *)&v6 & 2) != 0) {
      goto LABEL_8;
    }
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&v6 & 1) == 0) {
    goto LABEL_16;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_blurredBookingTimestamp;
  if ((*(unsigned char *)&v6 & 4) == 0) {
    goto LABEL_17;
  }
LABEL_10:
  double durationOfSessionInSeconds = self->_durationOfSessionInSeconds;
  double v11 = -durationOfSessionInSeconds;
  if (durationOfSessionInSeconds >= 0.0) {
    double v11 = self->_durationOfSessionInSeconds;
  }
  long double v12 = floor(v11 + 0.5);
  double v13 = (v11 - v12) * 1.84467441e19;
  unint64_t v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0) {
      v14 += (unint64_t)v13;
    }
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_20:
  if ((*(_WORD *)&v6 & 0x200) != 0) {
    uint64_t v15 = 2654435761 * self->_installNeeded;
  }
  else {
    uint64_t v15 = 0;
  }
  NSUInteger v16 = [(NSString *)self->_installNeededTappedAppId hash];
  $9F9A2A9579ABD3305E4426CE4C6AFAEE v17 = self->_flags;
  if ((*(_WORD *)&v17 & 0x100) != 0)
  {
    uint64_t v18 = 2654435761 * self->_installCompleted;
    if ((*(unsigned char *)&v17 & 0x40) != 0)
    {
LABEL_25:
      uint64_t v19 = 2654435761 * self->_tableSize;
      if ((*(unsigned char *)&v17 & 0x80) != 0) {
        goto LABEL_26;
      }
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v18 = 0;
    if ((*(unsigned char *)&v17 & 0x40) != 0) {
      goto LABEL_25;
    }
  }
  uint64_t v19 = 0;
  if ((*(unsigned char *)&v17 & 0x80) != 0)
  {
LABEL_26:
    uint64_t v20 = 2654435761 * self->_addedSpecialRequest;
    if ((*(_WORD *)&v17 & 0x400) != 0) {
      goto LABEL_27;
    }
LABEL_32:
    uint64_t v21 = 0;
    if ((*(_WORD *)&v17 & 0x800) != 0) {
      goto LABEL_28;
    }
LABEL_33:
    uint64_t v22 = 0;
    return v25 ^ v26 ^ v4 ^ v5 ^ v7 ^ v8 ^ v9 ^ v14 ^ v15 ^ v16 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ [(NSMutableArray *)self->_errorMessages hash];
  }
LABEL_31:
  uint64_t v20 = 0;
  if ((*(_WORD *)&v17 & 0x400) == 0) {
    goto LABEL_32;
  }
LABEL_27:
  uint64_t v21 = 2654435761 * self->_swipedAvailableTimes;
  if ((*(_WORD *)&v17 & 0x800) == 0) {
    goto LABEL_33;
  }
LABEL_28:
  uint64_t v22 = 2654435761 * self->_tappedDatePicker;
  return v25 ^ v26 ^ v4 ^ v5 ^ v7 ^ v8 ^ v9 ^ v14 ^ v15 ^ v16 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ [(NSMutableArray *)self->_errorMessages hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 5)) {
    -[GEOLogMsgEventTableBookingSession setBookTableSessionId:](self, "setBookTableSessionId:");
  }
  int v5 = *((_DWORD *)v4 + 28);
  if ((v5 & 0x10) != 0)
  {
    self->_endState = *((_DWORD *)v4 + 23);
    *(_DWORD *)&self->_flags |= 0x10u;
    int v5 = *((_DWORD *)v4 + 28);
  }
  if ((v5 & 0x20) != 0)
  {
    self->_endView = *((_DWORD *)v4 + 24);
    *(_DWORD *)&self->_flags |= 0x20u;
  }
  if (*((void *)v4 + 4)) {
    -[GEOLogMsgEventTableBookingSession setBookTableAppId:](self, "setBookTableAppId:");
  }
  int v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 8) != 0)
  {
    self->_muid = *((void *)v4 + 9);
    *(_DWORD *)&self->_flags |= 8u;
    int v6 = *((_DWORD *)v4 + 28);
    if ((v6 & 2) == 0)
    {
LABEL_11:
      if ((v6 & 1) == 0) {
        goto LABEL_12;
      }
      goto LABEL_33;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_11;
  }
  self->_blurredReservationTimestamp = *((void *)v4 + 3);
  *(_DWORD *)&self->_flags |= 2u;
  int v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 1) == 0)
  {
LABEL_12:
    if ((v6 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_blurredBookingTimestamp = *((void *)v4 + 2);
  *(_DWORD *)&self->_flags |= 1u;
  int v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 4) == 0)
  {
LABEL_13:
    if ((v6 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_34:
  self->_double durationOfSessionInSeconds = *((double *)v4 + 6);
  *(_DWORD *)&self->_flags |= 4u;
  if ((*((_DWORD *)v4 + 28) & 0x200) != 0)
  {
LABEL_14:
    self->_installNeeded = *((unsigned char *)v4 + 106);
    *(_DWORD *)&self->_flags |= 0x200u;
  }
LABEL_15:
  if (*((void *)v4 + 8)) {
    -[GEOLogMsgEventTableBookingSession setInstallNeededTappedAppId:](self, "setInstallNeededTappedAppId:");
  }
  int v7 = *((_DWORD *)v4 + 28);
  if ((v7 & 0x100) != 0)
  {
    self->_installCompleted = *((unsigned char *)v4 + 105);
    *(_DWORD *)&self->_flags |= 0x100u;
    int v7 = *((_DWORD *)v4 + 28);
    if ((v7 & 0x40) == 0)
    {
LABEL_19:
      if ((v7 & 0x80) == 0) {
        goto LABEL_20;
      }
      goto LABEL_38;
    }
  }
  else if ((v7 & 0x40) == 0)
  {
    goto LABEL_19;
  }
  self->_tableSize = *((_DWORD *)v4 + 25);
  *(_DWORD *)&self->_flags |= 0x40u;
  int v7 = *((_DWORD *)v4 + 28);
  if ((v7 & 0x80) == 0)
  {
LABEL_20:
    if ((v7 & 0x400) == 0) {
      goto LABEL_21;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_addedSpecialRequest = *((unsigned char *)v4 + 104);
  *(_DWORD *)&self->_flags |= 0x80u;
  int v7 = *((_DWORD *)v4 + 28);
  if ((v7 & 0x400) == 0)
  {
LABEL_21:
    if ((v7 & 0x800) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_39:
  self->_swipedAvailableTimes = *((unsigned char *)v4 + 107);
  *(_DWORD *)&self->_flags |= 0x400u;
  if ((*((_DWORD *)v4 + 28) & 0x800) != 0)
  {
LABEL_22:
    self->_tappedDatePicker = *((unsigned char *)v4 + 108);
    *(_DWORD *)&self->_flags |= 0x800u;
  }
LABEL_23:
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *((id *)v4 + 7);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[GEOLogMsgEventTableBookingSession addErrorMessage:](self, "addErrorMessage:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installNeededTappedAppId, 0);
  objc_storeStrong((id *)&self->_errorMessages, 0);
  objc_storeStrong((id *)&self->_bookTableSessionId, 0);
  objc_storeStrong((id *)&self->_bookTableAppId, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end