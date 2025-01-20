@interface GEOPairedDeviceMessage
+ (BOOL)isValid:(id)a3;
- (BOOL)hasMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest)checkinWithSubscriptionStateSummary;
- (GEOPairedDeviceConfigureSubscriptionShouldSyncRequest)configureSubscriptionShouldSync;
- (GEOPairedDeviceGetStorageInfoRequest)getStorageInfo;
- (GEOPairedDeviceMessage)init;
- (GEOPairedDeviceMessage)initWithData:(id)a3;
- (GEOPairedDeviceMessage)initWithDictionary:(id)a3;
- (GEOPairedDeviceMessage)initWithJSON:(id)a3;
- (GEOPairedDeviceMessageMetadata)metadata;
- (GEOPairedDevicePingRequest)ping;
- (GEOPairedDeviceSubscriptionStartStopDownloadRequest)startStopSubscriptionDownload;
- (GEOPairedDeviceSubscriptionStateSynchronizationRequest)setObservedSubscriptionIdentifiers;
- (GEOPairedDeviceSubscriptionStateUpdate)updateSubscriptionState;
- (GEOPairedDeviceSubscriptionStatesSummary)setSubscriptionStateSummary;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (unint64_t)whichPayload;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readMetadata;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)resetPayload;
- (void)setCheckinWithSubscriptionStateSummary:(id)a3;
- (void)setConfigureSubscriptionShouldSync:(id)a3;
- (void)setGetStorageInfo:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setPing:(id)a3;
- (void)setSetObservedSubscriptionIdentifiers:(id)a3;
- (void)setSetSubscriptionStateSummary:(id)a3;
- (void)setStartStopSubscriptionDownload:(id)a3;
- (void)setType:(int)a3;
- (void)setUpdateSubscriptionState:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPairedDeviceMessage

- (GEOPairedDeviceMessage)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPairedDeviceMessage;
  v2 = [(GEOPairedDeviceMessage *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPairedDeviceMessage)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPairedDeviceMessage;
  v3 = [(GEOPairedDeviceMessage *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)resetPayload
{
  ping = self->_ping;
  self->_ping = 0;

  getStorageInfo = self->_getStorageInfo;
  self->_getStorageInfo = 0;

  configureSubscriptionShouldSync = self->_configureSubscriptionShouldSync;
  self->_configureSubscriptionShouldSync = 0;

  startStopSubscriptionDownload = self->_startStopSubscriptionDownload;
  self->_startStopSubscriptionDownload = 0;

  checkinWithSubscriptionStateSummary = self->_checkinWithSubscriptionStateSummary;
  self->_checkinWithSubscriptionStateSummary = 0;

  setSubscriptionStateSummary = self->_setSubscriptionStateSummary;
  self->_setSubscriptionStateSummary = 0;

  setObservedSubscriptionIdentifiers = self->_setObservedSubscriptionIdentifiers;
  self->_setObservedSubscriptionIdentifiers = 0;

  updateSubscriptionState = self->_updateSubscriptionState;
  self->_updateSubscriptionState = 0;

  self->_whichPayload = 0;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x400u;
  self->_type = a3;
}

- (id)typeAsString:(int)a3
{
  if (a3 <= 99)
  {
    if (a3)
    {
      if (a3 == 1)
      {
        v4 = @"PING";
      }
      else if (a3 == 2)
      {
        v4 = @"GET_STORAGE_INFO";
      }
      else
      {
LABEL_33:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v4 = @"INVALID";
    }
  }
  else
  {
    switch(a3)
    {
      case 'd':
        v4 = @"CONFIGURE_SUBSCRIPTION_SHOULD_SYNC";
        break;
      case 'e':
        v4 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
        break;
      case 'f':
        v4 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
        break;
      case 'g':
        v4 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
        break;
      case 'h':
        v4 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
        break;
      case 'i':
        v4 = @"UPDATE_SUBSCRIPTION_STATE";
        break;
      default:
        goto LABEL_33;
    }
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"INVALID"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GET_STORAGE_INFO"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CONFIGURE_SUBSCRIPTION_SHOULD_SYNC"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"START_STOP_SUBSCRIPTION_DOWNLOAD"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY"])
  {
    int v4 = 102;
  }
  else if ([v3 isEqualToString:@"SET_SUBSCRIPTION_STATE_SUMMARY"])
  {
    int v4 = 103;
  }
  else if ([v3 isEqualToString:@"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS"])
  {
    int v4 = 104;
  }
  else if ([v3 isEqualToString:@"UPDATE_SUBSCRIPTION_STATE"])
  {
    int v4 = 105;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPairedDeviceMessageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMetadata_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (GEOPairedDeviceMessageMetadata)metadata
{
  -[GEOPairedDeviceMessage _readMetadata]((uint64_t)self);
  metadata = self->_metadata;

  return metadata;
}

- (void)setMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x410u;
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (GEOPairedDevicePingRequest)ping
{
  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x20) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        int v4 = reader;
        objc_sync_enter(v4);
        GEOPairedDeviceMessageReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readPing_tags);
        objc_sync_exit(v4);
      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  if (self->_whichPayload == 1) {
    v5 = self->_ping;
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (void)setPing:(id)a3
{
  int v4 = (GEOPairedDevicePingRequest *)a3;
  *(_WORD *)&self->_flags |= 0x420u;
  [(GEOPairedDeviceMessage *)self resetPayload];
  ping = self->_ping;
  self->_ping = v4;

  if (v4) {
    self->_whichPayload = 1;
  }
}

- (GEOPairedDeviceGetStorageInfoRequest)getStorageInfo
{
  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 8) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        int v4 = reader;
        objc_sync_enter(v4);
        GEOPairedDeviceMessageReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readGetStorageInfo_tags);
        objc_sync_exit(v4);
      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  if (self->_whichPayload == 2) {
    v5 = self->_getStorageInfo;
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (void)setGetStorageInfo:(id)a3
{
  int v4 = (GEOPairedDeviceGetStorageInfoRequest *)a3;
  *(_WORD *)&self->_flags |= 0x408u;
  [(GEOPairedDeviceMessage *)self resetPayload];
  getStorageInfo = self->_getStorageInfo;
  self->_getStorageInfo = v4;

  if (v4) {
    self->_whichPayload = 2;
  }
}

- (GEOPairedDeviceConfigureSubscriptionShouldSyncRequest)configureSubscriptionShouldSync
{
  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 4) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        int v4 = reader;
        objc_sync_enter(v4);
        GEOPairedDeviceMessageReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readConfigureSubscriptionShouldSync_tags);
        objc_sync_exit(v4);
      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  if (self->_whichPayload == 3) {
    v5 = self->_configureSubscriptionShouldSync;
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (void)setConfigureSubscriptionShouldSync:(id)a3
{
  int v4 = (GEOPairedDeviceConfigureSubscriptionShouldSyncRequest *)a3;
  *(_WORD *)&self->_flags |= 0x404u;
  [(GEOPairedDeviceMessage *)self resetPayload];
  configureSubscriptionShouldSync = self->_configureSubscriptionShouldSync;
  self->_configureSubscriptionShouldSync = v4;

  if (v4) {
    self->_whichPayload = 3;
  }
}

- (GEOPairedDeviceSubscriptionStartStopDownloadRequest)startStopSubscriptionDownload
{
  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        int v4 = reader;
        objc_sync_enter(v4);
        GEOPairedDeviceMessageReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readStartStopSubscriptionDownload_tags);
        objc_sync_exit(v4);
      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  if (self->_whichPayload == 4) {
    v5 = self->_startStopSubscriptionDownload;
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (void)setStartStopSubscriptionDownload:(id)a3
{
  int v4 = (GEOPairedDeviceSubscriptionStartStopDownloadRequest *)a3;
  *(_WORD *)&self->_flags |= 0x500u;
  [(GEOPairedDeviceMessage *)self resetPayload];
  startStopSubscriptionDownload = self->_startStopSubscriptionDownload;
  self->_startStopSubscriptionDownload = v4;

  if (v4) {
    self->_whichPayload = 4;
  }
}

- (GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest)checkinWithSubscriptionStateSummary
{
  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 2) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        int v4 = reader;
        objc_sync_enter(v4);
        GEOPairedDeviceMessageReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readCheckinWithSubscriptionStateSummary_tags);
        objc_sync_exit(v4);
      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  if (self->_whichPayload == 5) {
    v5 = self->_checkinWithSubscriptionStateSummary;
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (void)setCheckinWithSubscriptionStateSummary:(id)a3
{
  int v4 = (GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest *)a3;
  *(_WORD *)&self->_flags |= 0x402u;
  [(GEOPairedDeviceMessage *)self resetPayload];
  checkinWithSubscriptionStateSummary = self->_checkinWithSubscriptionStateSummary;
  self->_checkinWithSubscriptionStateSummary = v4;

  if (v4) {
    self->_whichPayload = 5;
  }
}

- (GEOPairedDeviceSubscriptionStatesSummary)setSubscriptionStateSummary
{
  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x80) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        int v4 = reader;
        objc_sync_enter(v4);
        GEOPairedDeviceMessageReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readSetSubscriptionStateSummary_tags);
        objc_sync_exit(v4);
      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  if (self->_whichPayload == 6) {
    v5 = self->_setSubscriptionStateSummary;
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (void)setSetSubscriptionStateSummary:(id)a3
{
  int v4 = (GEOPairedDeviceSubscriptionStatesSummary *)a3;
  *(_WORD *)&self->_flags |= 0x480u;
  [(GEOPairedDeviceMessage *)self resetPayload];
  setSubscriptionStateSummary = self->_setSubscriptionStateSummary;
  self->_setSubscriptionStateSummary = v4;

  if (v4) {
    self->_whichPayload = 6;
  }
}

- (GEOPairedDeviceSubscriptionStateSynchronizationRequest)setObservedSubscriptionIdentifiers
{
  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x40) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        int v4 = reader;
        objc_sync_enter(v4);
        GEOPairedDeviceMessageReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readSetObservedSubscriptionIdentifiers_tags);
        objc_sync_exit(v4);
      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  if (self->_whichPayload == 7) {
    v5 = self->_setObservedSubscriptionIdentifiers;
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (void)setSetObservedSubscriptionIdentifiers:(id)a3
{
  int v4 = (GEOPairedDeviceSubscriptionStateSynchronizationRequest *)a3;
  *(_WORD *)&self->_flags |= 0x440u;
  [(GEOPairedDeviceMessage *)self resetPayload];
  setObservedSubscriptionIdentifiers = self->_setObservedSubscriptionIdentifiers;
  self->_setObservedSubscriptionIdentifiers = v4;

  if (v4) {
    self->_whichPayload = 7;
  }
}

- (GEOPairedDeviceSubscriptionStateUpdate)updateSubscriptionState
{
  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        int v4 = reader;
        objc_sync_enter(v4);
        GEOPairedDeviceMessageReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readUpdateSubscriptionState_tags);
        objc_sync_exit(v4);
      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  if (self->_whichPayload == 8) {
    v5 = self->_updateSubscriptionState;
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (void)setUpdateSubscriptionState:(id)a3
{
  int v4 = (GEOPairedDeviceSubscriptionStateUpdate *)a3;
  *(_WORD *)&self->_flags |= 0x600u;
  [(GEOPairedDeviceMessage *)self resetPayload];
  updateSubscriptionState = self->_updateSubscriptionState;
  self->_updateSubscriptionState = v4;

  if (v4) {
    self->_whichPayload = 8;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPairedDeviceMessage;
  int v4 = [(GEOPairedDeviceMessage *)&v8 description];
  v5 = [(GEOPairedDeviceMessage *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPairedDeviceMessage _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    switch(*(void *)(a1 + 120))
    {
      case 1:
        v5 = [(id)a1 ping];
        objc_super v6 = v5;
        if (!v5) {
          goto LABEL_37;
        }
        if (a2) {
          [v5 jsonRepresentation];
        }
        else {
        objc_super v8 = [v5 dictionaryRepresentation];
        }
        v9 = @"ping";
        break;
      case 2:
        objc_super v7 = [(id)a1 getStorageInfo];
        objc_super v6 = v7;
        if (!v7) {
          goto LABEL_37;
        }
        if (a2)
        {
          objc_super v8 = [v7 jsonRepresentation];
          v9 = @"getStorageInfo";
        }
        else
        {
          objc_super v8 = [v7 dictionaryRepresentation];
          v9 = @"get_storage_info";
        }
        break;
      case 3:
        v10 = [(id)a1 configureSubscriptionShouldSync];
        objc_super v6 = v10;
        if (!v10) {
          goto LABEL_37;
        }
        if (a2)
        {
          objc_super v8 = [v10 jsonRepresentation];
          v9 = @"configureSubscriptionShouldSync";
        }
        else
        {
          objc_super v8 = [v10 dictionaryRepresentation];
          v9 = @"configure_subscription_should_sync";
        }
        break;
      case 4:
        v11 = [(id)a1 startStopSubscriptionDownload];
        objc_super v6 = v11;
        if (!v11) {
          goto LABEL_37;
        }
        if (a2)
        {
          objc_super v8 = [v11 jsonRepresentation];
          v9 = @"startStopSubscriptionDownload";
        }
        else
        {
          objc_super v8 = [v11 dictionaryRepresentation];
          v9 = @"start_stop_subscription_download";
        }
        break;
      case 5:
        v12 = [(id)a1 checkinWithSubscriptionStateSummary];
        objc_super v6 = v12;
        if (!v12) {
          goto LABEL_37;
        }
        if (a2)
        {
          objc_super v8 = [v12 jsonRepresentation];
          v9 = @"checkinWithSubscriptionStateSummary";
        }
        else
        {
          objc_super v8 = [v12 dictionaryRepresentation];
          v9 = @"checkin_with_subscription_state_summary";
        }
        break;
      case 6:
        v13 = [(id)a1 setSubscriptionStateSummary];
        objc_super v6 = v13;
        if (!v13) {
          goto LABEL_37;
        }
        if (a2)
        {
          objc_super v8 = [v13 jsonRepresentation];
          v9 = @"setSubscriptionStateSummary";
        }
        else
        {
          objc_super v8 = [v13 dictionaryRepresentation];
          v9 = @"set_subscription_state_summary";
        }
        break;
      case 7:
        v14 = [(id)a1 setObservedSubscriptionIdentifiers];
        objc_super v6 = v14;
        if (!v14) {
          goto LABEL_37;
        }
        if (a2)
        {
          objc_super v8 = [v14 jsonRepresentation];
          v9 = @"setObservedSubscriptionIdentifiers";
        }
        else
        {
          objc_super v8 = [v14 dictionaryRepresentation];
          v9 = @"set_observed_subscription_identifiers";
        }
        break;
      case 8:
        v15 = [(id)a1 updateSubscriptionState];
        objc_super v6 = v15;
        if (!v15) {
          goto LABEL_37;
        }
        if (a2)
        {
          objc_super v8 = [v15 jsonRepresentation];
          v9 = @"updateSubscriptionState";
        }
        else
        {
          objc_super v8 = [v15 dictionaryRepresentation];
          v9 = @"update_subscription_state";
        }
        break;
      default:
        goto LABEL_38;
    }
    [v4 setObject:v8 forKey:v9];

LABEL_37:
LABEL_38:
    int v16 = *(_DWORD *)(a1 + 108);
    if (v16 <= 99)
    {
      if (v16)
      {
        if (v16 == 1)
        {
          v17 = @"PING";
        }
        else if (v16 == 2)
        {
          v17 = @"GET_STORAGE_INFO";
        }
        else
        {
LABEL_52:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 108));
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v17 = @"INVALID";
      }
    }
    else
    {
      switch(v16)
      {
        case 'd':
          v17 = @"CONFIGURE_SUBSCRIPTION_SHOULD_SYNC";
          break;
        case 'e':
          v17 = @"START_STOP_SUBSCRIPTION_DOWNLOAD";
          break;
        case 'f':
          v17 = @"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY";
          break;
        case 'g':
          v17 = @"SET_SUBSCRIPTION_STATE_SUMMARY";
          break;
        case 'h':
          v17 = @"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS";
          break;
        case 'i':
          v17 = @"UPDATE_SUBSCRIPTION_STATE";
          break;
        default:
          goto LABEL_52;
      }
    }
    [v4 setObject:v17 forKey:@"type"];

    v18 = [(id)a1 metadata];
    v19 = v18;
    if (v18)
    {
      if (a2) {
        [v18 jsonRepresentation];
      }
      else {
      v20 = [v18 dictionaryRepresentation];
      }
      [v4 setObject:v20 forKey:@"metadata"];
    }
    v21 = *(void **)(a1 + 16);
    if (v21)
    {
      v22 = [v21 dictionaryRepresentation];
      v23 = v22;
      if (a2)
      {
        v24 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __52__GEOPairedDeviceMessage__dictionaryRepresentation___block_invoke;
        v28[3] = &unk_1E53D8860;
        id v25 = v24;
        id v29 = v25;
        [v23 enumerateKeysAndObjectsUsingBlock:v28];
        id v26 = v25;

        v23 = v26;
      }
      [v4 setObject:v23 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPairedDeviceMessage _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __52__GEOPairedDeviceMessage__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPairedDeviceMessage)initWithDictionary:(id)a3
{
  return (GEOPairedDeviceMessage *)-[GEOPairedDeviceMessage _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_33;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_33;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"INVALID"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"PING"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"GET_STORAGE_INFO"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"CONFIGURE_SUBSCRIPTION_SHOULD_SYNC"])
    {
      uint64_t v8 = 100;
    }
    else if ([v7 isEqualToString:@"START_STOP_SUBSCRIPTION_DOWNLOAD"])
    {
      uint64_t v8 = 101;
    }
    else if ([v7 isEqualToString:@"CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY"])
    {
      uint64_t v8 = 102;
    }
    else if ([v7 isEqualToString:@"SET_SUBSCRIPTION_STATE_SUMMARY"])
    {
      uint64_t v8 = 103;
    }
    else if ([v7 isEqualToString:@"SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS"])
    {
      uint64_t v8 = 104;
    }
    else if ([v7 isEqualToString:@"UPDATE_SUBSCRIPTION_STATE"])
    {
      uint64_t v8 = 105;
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_26:
    [a1 setType:v8];
  }

  v9 = [v5 objectForKeyedSubscript:@"metadata"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [GEOPairedDeviceMessageMetadata alloc];
    if (a3) {
      uint64_t v11 = [(GEOPairedDeviceMessageMetadata *)v10 initWithJSON:v9];
    }
    else {
      uint64_t v11 = [(GEOPairedDeviceMessageMetadata *)v10 initWithDictionary:v9];
    }
    v12 = (void *)v11;
    [a1 setMetadata:v11];
  }
LABEL_33:

  return a1;
}

- (GEOPairedDeviceMessage)initWithJSON:(id)a3
{
  return (GEOPairedDeviceMessage *)-[GEOPairedDeviceMessage _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_77;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_77;
    }
    GEOPairedDeviceMessageReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPairedDeviceMessageCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPairedDeviceMessageIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPairedDeviceMessageReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOPairedDeviceMessageIsDirty((uint64_t)self))
  {
    id v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPairedDeviceMessage *)self readAll:0];
    PBDataWriterWriteInt32Field();
    if (self->_metadata) {
      PBDataWriterWriteSubmessage();
    }
    unint64_t whichPayload = self->_whichPayload;
    if (whichPayload == 1)
    {
      PBDataWriterWriteSubmessage();
      unint64_t whichPayload = self->_whichPayload;
    }
    id v6 = v9;
    if (whichPayload == 2)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
      unint64_t whichPayload = self->_whichPayload;
    }
    if (whichPayload == 3)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
      unint64_t whichPayload = self->_whichPayload;
    }
    if (whichPayload == 4)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
      unint64_t whichPayload = self->_whichPayload;
    }
    if (whichPayload == 5)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
      unint64_t whichPayload = self->_whichPayload;
    }
    if (whichPayload == 6)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
      unint64_t whichPayload = self->_whichPayload;
    }
    if (whichPayload == 7)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
      unint64_t whichPayload = self->_whichPayload;
    }
    if (whichPayload == 8)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v6];
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOPairedDeviceMessage *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 24) = self->_readerMarkPos;
  *((_DWORD *)v8 + 25) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPairedDeviceMessage *)self resetPayload];
  unint64_t whichPayload = self->_whichPayload;
  if (whichPayload - 1 <= 7)
  {
    uint64_t v5 = *off_1E53ED478[whichPayload - 1];
    id v6 = *(id *)((char *)&self->super.super.isa + v5);
    id v7 = *(id *)((char *)v8 + v5);
    *(id *)((char *)v8 + v5) = v6;

    unint64_t whichPayload = self->_whichPayload;
  }
  v8[15] = (id)whichPayload;
  *((_DWORD *)v8 + 27) = self->_type;
  if (self->_metadata) {
    objc_msgSend(v8, "setMetadata:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPairedDeviceMessageReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPairedDeviceMessage *)self readAll:0];
  unint64_t whichPayload = self->_whichPayload;
  switch(whichPayload)
  {
    case 1uLL:
      uint64_t v9 = 56;
      goto LABEL_14;
    case 2uLL:
      uint64_t v9 = 40;
      goto LABEL_14;
    case 3uLL:
      uint64_t v9 = 32;
      goto LABEL_14;
    case 4uLL:
      uint64_t v9 = 80;
      goto LABEL_14;
    case 5uLL:
      uint64_t v9 = 24;
      goto LABEL_14;
    case 6uLL:
      uint64_t v9 = 72;
      goto LABEL_14;
    case 7uLL:
      uint64_t v9 = 64;
      goto LABEL_14;
    case 8uLL:
      uint64_t v9 = 88;
LABEL_14:
      uint64_t v10 = [*(id *)((char *)&self->super.super.isa + v9) copyWithZone:a3];
      uint64_t v11 = *(void **)(v5 + v9);
      *(void *)(v5 + v9) = v10;

      unint64_t whichPayload = self->_whichPayload;
      break;
    default:
      break;
  }
  *(void *)(v5 + 120) = whichPayload;
  *(_DWORD *)(v5 + 108) = self->_type;
  id v12 = [(GEOPairedDeviceMessageMetadata *)self->_metadata copyWithZone:a3];
  v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ([(GEOPairedDeviceMessage *)self readAll:1],
        [v4 readAll:1],
        unint64_t whichPayload = self->_whichPayload,
        whichPayload == v4[15]))
  {
    switch(whichPayload)
    {
      case 1uLL:
        uint64_t v6 = 7;
        goto LABEL_11;
      case 2uLL:
        uint64_t v6 = 5;
        goto LABEL_11;
      case 3uLL:
        uint64_t v6 = 4;
        goto LABEL_11;
      case 4uLL:
        uint64_t v6 = 10;
        goto LABEL_11;
      case 5uLL:
        uint64_t v6 = 3;
        goto LABEL_11;
      case 6uLL:
        uint64_t v6 = 9;
        goto LABEL_11;
      case 7uLL:
        uint64_t v6 = 8;
LABEL_11:
        if ([*(id *)((char *)&self->super.super.isa + v6 * 8) isEqual:v4[v6]]) {
          goto LABEL_12;
        }
        goto LABEL_17;
      case 8uLL:
        if (![(GEOPairedDeviceSubscriptionStateUpdate *)self->_updateSubscriptionState isEqual:v4[11]]) {
          goto LABEL_17;
        }
        goto LABEL_12;
      default:
LABEL_12:
        if (self->_type != *((_DWORD *)v4 + 27)) {
          goto LABEL_17;
        }
        metadata = self->_metadata;
        if ((unint64_t)metadata | v4[6]) {
          char v8 = -[GEOPairedDeviceMessageMetadata isEqual:](metadata, "isEqual:");
        }
        else {
          char v8 = 1;
        }
        break;
    }
  }
  else
  {
LABEL_17:
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  [(GEOPairedDeviceMessage *)self readAll:1];
  unint64_t whichPayload = self->_whichPayload;
  uint64_t v4 = 2654435761u * whichPayload;
  unint64_t v5 = whichPayload - 1;
  if (v5 <= 7) {
    v4 ^= [*(id *)((char *)&self->super.super.isa + *off_1E53ED408[v5]) hash];
  }
  uint64_t v6 = 2654435761 * self->_type;
  return v6 ^ v4 ^ [(GEOPairedDeviceMessageMetadata *)self->_metadata hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v11 = a3;
  [v11 readAll:0];
  [(GEOPairedDeviceMessage *)self resetPayload];
  uint64_t v4 = v11;
  unint64_t v5 = v11[15];
  if (v5 - 1 <= 7)
  {
    uint64_t v6 = *off_1E53ED4B8[v5 - 1];
    id v7 = (objc_class *)*(id *)((char *)v11 + v6);
    char v8 = *(Class *)((char *)&self->super.super.isa + v6);
    *(Class *)((char *)&self->super.super.isa + v6) = v7;

    uint64_t v4 = v11;
    unint64_t v5 = v11[15];
  }
  self->_unint64_t whichPayload = v5;
  self->_type = *((_DWORD *)v4 + 27);
  metadata = self->_metadata;
  uint64_t v10 = v4[6];
  if (metadata)
  {
    if (!v10) {
      goto LABEL_9;
    }
    -[GEOPairedDeviceMessageMetadata mergeFrom:](metadata, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_9;
    }
    -[GEOPairedDeviceMessage setMetadata:](self, "setMetadata:");
  }
  uint64_t v4 = v11;
LABEL_9:
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      unint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOPairedDeviceMessageReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_15);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x401u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPairedDeviceMessage *)self readAll:0];
    [(GEOPairedDeviceMessageMetadata *)self->_metadata clearUnknownFields:1];
    [(GEOPairedDevicePingRequest *)self->_ping clearUnknownFields:1];
    [(GEOPairedDeviceGetStorageInfoRequest *)self->_getStorageInfo clearUnknownFields:1];
    [(GEOPairedDeviceConfigureSubscriptionShouldSyncRequest *)self->_configureSubscriptionShouldSync clearUnknownFields:1];
    [(GEOPairedDeviceSubscriptionStartStopDownloadRequest *)self->_startStopSubscriptionDownload clearUnknownFields:1];
    [(GEOPairedDeviceCheckinWithSubscriptionStateSummaryRequest *)self->_checkinWithSubscriptionStateSummary clearUnknownFields:1];
    [(GEOPairedDeviceSubscriptionStatesSummary *)self->_setSubscriptionStateSummary clearUnknownFields:1];
    [(GEOPairedDeviceSubscriptionStateSynchronizationRequest *)self->_setObservedSubscriptionIdentifiers clearUnknownFields:1];
    updateSubscriptionState = self->_updateSubscriptionState;
    [(GEOPairedDeviceSubscriptionStateUpdate *)updateSubscriptionState clearUnknownFields:1];
  }
}

- (unint64_t)whichPayload
{
  return self->_whichPayload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateSubscriptionState, 0);
  objc_storeStrong((id *)&self->_startStopSubscriptionDownload, 0);
  objc_storeStrong((id *)&self->_setSubscriptionStateSummary, 0);
  objc_storeStrong((id *)&self->_setObservedSubscriptionIdentifiers, 0);
  objc_storeStrong((id *)&self->_ping, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_getStorageInfo, 0);
  objc_storeStrong((id *)&self->_configureSubscriptionShouldSync, 0);
  objc_storeStrong((id *)&self->_checkinWithSubscriptionStateSummary, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end