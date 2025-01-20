@interface GEOClientNetworkTransactionMetrics
+ (BOOL)isValid:(id)a3;
- (BOOL)hasConnectEnd;
- (BOOL)hasConnectStart;
- (BOOL)hasDomainLookupEnd;
- (BOOL)hasDomainLookupStart;
- (BOOL)hasFetchStart;
- (BOOL)hasIsMultipath;
- (BOOL)hasMultipathServiceType;
- (BOOL)hasProtocolName;
- (BOOL)hasProxyConnection;
- (BOOL)hasRequestEnd;
- (BOOL)hasRequestStart;
- (BOOL)hasResourceFetchType;
- (BOOL)hasResponseEnd;
- (BOOL)hasResponseStart;
- (BOOL)hasReusedConnection;
- (BOOL)hasSecureConnectEnd;
- (BOOL)hasSecureConnectStart;
- (BOOL)hasUsedCellular;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMultipath;
- (BOOL)proxyConnection;
- (BOOL)readFrom:(id)a3;
- (BOOL)reusedConnection;
- (BOOL)usedCellular;
- (GEOClientNetworkTransactionMetrics)initWithDictionary:(id)a3;
- (GEOClientNetworkTransactionMetrics)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (double)connectEnd;
- (double)connectStart;
- (double)domainLookupEnd;
- (double)domainLookupStart;
- (double)fetchStart;
- (double)requestEnd;
- (double)requestStart;
- (double)responseEnd;
- (double)responseStart;
- (double)secureConnectEnd;
- (double)secureConnectStart;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)multipathServiceTypeAsString:(int)a3;
- (id)protocolNameAsString:(int)a3;
- (id)resourceFetchTypeAsString:(int)a3;
- (int)StringAsMultipathServiceType:(id)a3;
- (int)StringAsProtocolName:(id)a3;
- (int)StringAsResourceFetchType:(id)a3;
- (int)multipathServiceType;
- (int)protocolName;
- (int)resourceFetchType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConnectEnd:(double)a3;
- (void)setConnectStart:(double)a3;
- (void)setDomainLookupEnd:(double)a3;
- (void)setDomainLookupStart:(double)a3;
- (void)setFetchStart:(double)a3;
- (void)setHasConnectEnd:(BOOL)a3;
- (void)setHasConnectStart:(BOOL)a3;
- (void)setHasDomainLookupEnd:(BOOL)a3;
- (void)setHasDomainLookupStart:(BOOL)a3;
- (void)setHasFetchStart:(BOOL)a3;
- (void)setHasIsMultipath:(BOOL)a3;
- (void)setHasMultipathServiceType:(BOOL)a3;
- (void)setHasProtocolName:(BOOL)a3;
- (void)setHasProxyConnection:(BOOL)a3;
- (void)setHasRequestEnd:(BOOL)a3;
- (void)setHasRequestStart:(BOOL)a3;
- (void)setHasResourceFetchType:(BOOL)a3;
- (void)setHasResponseEnd:(BOOL)a3;
- (void)setHasResponseStart:(BOOL)a3;
- (void)setHasReusedConnection:(BOOL)a3;
- (void)setHasSecureConnectEnd:(BOOL)a3;
- (void)setHasSecureConnectStart:(BOOL)a3;
- (void)setHasUsedCellular:(BOOL)a3;
- (void)setIsMultipath:(BOOL)a3;
- (void)setMultipathServiceType:(int)a3;
- (void)setProtocolName:(int)a3;
- (void)setProxyConnection:(BOOL)a3;
- (void)setRequestEnd:(double)a3;
- (void)setRequestStart:(double)a3;
- (void)setResourceFetchType:(int)a3;
- (void)setResponseEnd:(double)a3;
- (void)setResponseStart:(double)a3;
- (void)setReusedConnection:(BOOL)a3;
- (void)setSecureConnectEnd:(double)a3;
- (void)setSecureConnectStart:(double)a3;
- (void)setUsedCellular:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOClientNetworkTransactionMetrics

- (void).cxx_destruct
{
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField();
    $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
    if ((*(unsigned char *)&flags & 8) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&flags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)&flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteDoubleField();
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&flags & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteDoubleField();
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&flags & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteDoubleField();
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&flags & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteDoubleField();
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(unsigned char *)&flags & 1) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&flags & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteDoubleField();
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&flags & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteDoubleField();
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&flags & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteDoubleField();
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&flags & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteDoubleField();
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x80) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&flags & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteDoubleField();
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(_WORD *)&flags & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&flags & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteInt32Field();
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(_WORD *)&flags & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&flags & 0x10000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteBOOLField();
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&flags & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteBOOLField();
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(_WORD *)&flags & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&flags & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteInt32Field();
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(_WORD *)&flags & 0x4000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&flags & 0x800) == 0) {
      goto LABEL_18;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteBOOLField();
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&flags & 0x20000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_39:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_flags & 0x20000) != 0) {
LABEL_19:
  }
    PBDataWriterWriteBOOLField();
LABEL_20:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)setUsedCellular:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20000u;
  self->_usedCellular = a3;
}

- (void)setSecureConnectStart:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x400u;
  self->_secureConnectStart = a3;
}

- (void)setSecureConnectEnd:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x200u;
  self->_secureConnectEnd = a3;
}

- (void)setReusedConnection:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10000u;
  self->_reusedConnection = a3;
}

- (void)setResponseStart:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x100u;
  self->_responseStart = a3;
}

- (void)setResponseEnd:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x80u;
  self->_responseEnd = a3;
}

- (void)setResourceFetchType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2000u;
  self->_resourceFetchType = a3;
}

- (void)setRequestStart:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x40u;
  self->_requestStart = a3;
}

- (void)setRequestEnd:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x20u;
  self->_requestEnd = a3;
}

- (void)setProxyConnection:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x8000u;
  self->_proxyConnection = a3;
}

- (void)setProtocolName:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x1000u;
  self->_protocolName = a3;
}

- (void)setIsMultipath:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x4000u;
  self->_isMultipath = a3;
}

- (void)setFetchStart:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x10u;
  self->_fetchStart = a3;
}

- (void)setDomainLookupStart:(double)a3
{
  *(_DWORD *)&self->_flags |= 8u;
  self->_domainLookupStart = a3;
}

- (void)setDomainLookupEnd:(double)a3
{
  *(_DWORD *)&self->_flags |= 4u;
  self->_domainLookupEnd = a3;
}

- (void)setConnectStart:(double)a3
{
  *(_DWORD *)&self->_flags |= 2u;
  self->_connectStart = a3;
}

- (void)setConnectEnd:(double)a3
{
  *(_DWORD *)&self->_flags |= 1u;
  self->_connectEnd = a3;
}

- (void)setMultipathServiceType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x800u;
  self->_multipathServiceType = a3;
}

- (double)fetchStart
{
  return self->_fetchStart;
}

- (void)setHasFetchStart:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_$B5C7CCCB84F8B0E196EE451F642EF20E flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasFetchStart
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (double)domainLookupStart
{
  return self->_domainLookupStart;
}

- (void)setHasDomainLookupStart:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_$B5C7CCCB84F8B0E196EE451F642EF20E flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDomainLookupStart
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (double)domainLookupEnd
{
  return self->_domainLookupEnd;
}

- (void)setHasDomainLookupEnd:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_$B5C7CCCB84F8B0E196EE451F642EF20E flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasDomainLookupEnd
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (double)connectStart
{
  return self->_connectStart;
}

- (void)setHasConnectStart:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_$B5C7CCCB84F8B0E196EE451F642EF20E flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasConnectStart
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (double)secureConnectStart
{
  return self->_secureConnectStart;
}

- (void)setHasSecureConnectStart:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_$B5C7CCCB84F8B0E196EE451F642EF20E flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasSecureConnectStart
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (double)secureConnectEnd
{
  return self->_secureConnectEnd;
}

- (void)setHasSecureConnectEnd:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_$B5C7CCCB84F8B0E196EE451F642EF20E flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
}

- (BOOL)hasSecureConnectEnd
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (double)connectEnd
{
  return self->_connectEnd;
}

- (void)setHasConnectEnd:(BOOL)a3
{
  self->_$B5C7CCCB84F8B0E196EE451F642EF20E flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3);
}

- (BOOL)hasConnectEnd
{
  return *(_DWORD *)&self->_flags & 1;
}

- (double)requestStart
{
  return self->_requestStart;
}

- (void)setHasRequestStart:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_$B5C7CCCB84F8B0E196EE451F642EF20E flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasRequestStart
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (double)requestEnd
{
  return self->_requestEnd;
}

- (void)setHasRequestEnd:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_$B5C7CCCB84F8B0E196EE451F642EF20E flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasRequestEnd
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (double)responseStart
{
  return self->_responseStart;
}

- (void)setHasResponseStart:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_$B5C7CCCB84F8B0E196EE451F642EF20E flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasResponseStart
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (double)responseEnd
{
  return self->_responseEnd;
}

- (void)setHasResponseEnd:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_$B5C7CCCB84F8B0E196EE451F642EF20E flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasResponseEnd
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (int)protocolName
{
  if ((*((unsigned char *)&self->_flags + 1) & 0x10) != 0) {
    return self->_protocolName;
  }
  else {
    return 0;
  }
}

- (void)setHasProtocolName:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_$B5C7CCCB84F8B0E196EE451F642EF20E flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v3);
}

- (BOOL)hasProtocolName
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (id)protocolNameAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53E7880[a3];
  }

  return v3;
}

- (int)StringAsProtocolName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"OTHER"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"HTTP_1_1"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"HTTP_2_TLS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"HTTP_2_TCP"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SPDY_1"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SPDY_2"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SPDY_3"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)proxyConnection
{
  return self->_proxyConnection;
}

- (void)setHasProxyConnection:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_$B5C7CCCB84F8B0E196EE451F642EF20E flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFF7FFF | v3);
}

- (BOOL)hasProxyConnection
{
  return *((unsigned __int8 *)&self->_flags + 1) >> 7;
}

- (BOOL)reusedConnection
{
  return self->_reusedConnection;
}

- (void)setHasReusedConnection:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_$B5C7CCCB84F8B0E196EE451F642EF20E flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFEFFFF | v3);
}

- (BOOL)hasReusedConnection
{
  return *((unsigned char *)&self->_flags + 2) & 1;
}

- (int)resourceFetchType
{
  if ((*((unsigned char *)&self->_flags + 1) & 0x20) != 0) {
    return self->_resourceFetchType;
  }
  else {
    return 0;
  }
}

- (void)setHasResourceFetchType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_$B5C7CCCB84F8B0E196EE451F642EF20E flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFFDFFF | v3);
}

- (BOOL)hasResourceFetchType
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (id)resourceFetchTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53E78B8[a3];
  }

  return v3;
}

- (int)StringAsResourceFetchType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NETWORK_LOAD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SERVER_PUSH"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LOCAL_CACHE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)isMultipath
{
  return self->_isMultipath;
}

- (void)setHasIsMultipath:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_$B5C7CCCB84F8B0E196EE451F642EF20E flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFFBFFF | v3);
}

- (BOOL)hasIsMultipath
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (int)multipathServiceType
{
  if ((*((unsigned char *)&self->_flags + 1) & 8) != 0) {
    return self->_multipathServiceType;
  }
  else {
    return 0;
  }
}

- (void)setHasMultipathServiceType:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_$B5C7CCCB84F8B0E196EE451F642EF20E flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v3);
}

- (BOOL)hasMultipathServiceType
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (id)multipathServiceTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53E78D8[a3];
  }

  return v3;
}

- (int)StringAsMultipathServiceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"HANDOVER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"INTERACTIVE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AGGREGATE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)usedCellular
{
  return self->_usedCellular;
}

- (void)setHasUsedCellular:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_$B5C7CCCB84F8B0E196EE451F642EF20E flags = ($B5C7CCCB84F8B0E196EE451F642EF20E)(*(_DWORD *)&self->_flags & 0xFFFDFFFF | v3);
}

- (BOOL)hasUsedCellular
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 1) & 1;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOClientNetworkTransactionMetrics;
  int v4 = [(GEOClientNetworkTransactionMetrics *)&v8 description];
  id v5 = [(GEOClientNetworkTransactionMetrics *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOClientNetworkTransactionMetrics _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_32;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  int v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 0x10) != 0)
  {
    v6 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
    if (a2) {
      v7 = @"fetchStart";
    }
    else {
      v7 = @"fetch_start";
    }
    [v4 setObject:v6 forKey:v7];

    int v5 = *(_DWORD *)(a1 + 120);
  }
  if ((v5 & 8) != 0)
  {
    v17 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
    if (a2) {
      v18 = @"domainLookupStart";
    }
    else {
      v18 = @"domain_lookup_start";
    }
    [v4 setObject:v17 forKey:v18];

    int v5 = *(_DWORD *)(a1 + 120);
    if ((v5 & 4) == 0)
    {
LABEL_9:
      if ((v5 & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_43;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_9;
  }
  v19 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  if (a2) {
    v20 = @"domainLookupEnd";
  }
  else {
    v20 = @"domain_lookup_end";
  }
  [v4 setObject:v19 forKey:v20];

  int v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_47;
  }
LABEL_43:
  v21 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
  if (a2) {
    v22 = @"connectStart";
  }
  else {
    v22 = @"connect_start";
  }
  [v4 setObject:v21 forKey:v22];

  int v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 0x400) == 0)
  {
LABEL_11:
    if ((v5 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_51;
  }
LABEL_47:
  v23 = [NSNumber numberWithDouble:*(double *)(a1 + 96)];
  if (a2) {
    v24 = @"secureConnectStart";
  }
  else {
    v24 = @"secure_connect_start";
  }
  [v4 setObject:v23 forKey:v24];

  int v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 0x200) == 0)
  {
LABEL_12:
    if ((v5 & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_55;
  }
LABEL_51:
  v25 = [NSNumber numberWithDouble:*(double *)(a1 + 88)];
  if (a2) {
    v26 = @"secureConnectEnd";
  }
  else {
    v26 = @"secure_connect_end";
  }
  [v4 setObject:v25 forKey:v26];

  int v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 1) == 0)
  {
LABEL_13:
    if ((v5 & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_59;
  }
LABEL_55:
  v27 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
  if (a2) {
    v28 = @"connectEnd";
  }
  else {
    v28 = @"connect_end";
  }
  [v4 setObject:v27 forKey:v28];

  int v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 0x40) == 0)
  {
LABEL_14:
    if ((v5 & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_63;
  }
LABEL_59:
  v29 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
  if (a2) {
    v30 = @"requestStart";
  }
  else {
    v30 = @"request_start";
  }
  [v4 setObject:v29 forKey:v30];

  int v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 0x20) == 0)
  {
LABEL_15:
    if ((v5 & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_67;
  }
LABEL_63:
  v31 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
  if (a2) {
    v32 = @"requestEnd";
  }
  else {
    v32 = @"request_end";
  }
  [v4 setObject:v31 forKey:v32];

  int v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 0x100) == 0)
  {
LABEL_16:
    if ((v5 & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_71;
  }
LABEL_67:
  v33 = [NSNumber numberWithDouble:*(double *)(a1 + 80)];
  if (a2) {
    v34 = @"responseStart";
  }
  else {
    v34 = @"response_start";
  }
  [v4 setObject:v33 forKey:v34];

  int v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 0x80) == 0)
  {
LABEL_17:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_75;
  }
LABEL_71:
  v35 = [NSNumber numberWithDouble:*(double *)(a1 + 72)];
  if (a2) {
    v36 = @"responseEnd";
  }
  else {
    v36 = @"response_end";
  }
  [v4 setObject:v35 forKey:v36];

  int v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 0x1000) == 0)
  {
LABEL_18:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_82;
  }
LABEL_75:
  uint64_t v37 = *(int *)(a1 + 108);
  if (v37 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 108));
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v38 = off_1E53E7880[v37];
  }
  if (a2) {
    v39 = @"protocolName";
  }
  else {
    v39 = @"protocol_name";
  }
  [v4 setObject:v38 forKey:v39];

  int v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 0x8000) == 0)
  {
LABEL_19:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_86;
  }
LABEL_82:
  v40 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 117)];
  if (a2) {
    v41 = @"proxyConnection";
  }
  else {
    v41 = @"proxy_connection";
  }
  [v4 setObject:v40 forKey:v41];

  int v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 0x10000) == 0)
  {
LABEL_20:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_90;
  }
LABEL_86:
  v42 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 118)];
  if (a2) {
    v43 = @"reusedConnection";
  }
  else {
    v43 = @"reused_connection";
  }
  [v4 setObject:v42 forKey:v43];

  int v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 0x2000) == 0)
  {
LABEL_21:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_97;
  }
LABEL_90:
  uint64_t v44 = *(int *)(a1 + 112);
  if (v44 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 112));
    v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v45 = off_1E53E78B8[v44];
  }
  if (a2) {
    v46 = @"resourceFetchType";
  }
  else {
    v46 = @"resource_fetch_type";
  }
  [v4 setObject:v45 forKey:v46];

  int v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 0x4000) == 0)
  {
LABEL_22:
    if ((v5 & 0x800) == 0) {
      goto LABEL_23;
    }
    goto LABEL_101;
  }
LABEL_97:
  v47 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 116)];
  if (a2) {
    v48 = @"isMultipath";
  }
  else {
    v48 = @"is_multipath";
  }
  [v4 setObject:v47 forKey:v48];

  int v5 = *(_DWORD *)(a1 + 120);
  if ((v5 & 0x800) == 0)
  {
LABEL_23:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_24;
  }
LABEL_101:
  uint64_t v49 = *(int *)(a1 + 104);
  if (v49 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 104));
    v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v50 = off_1E53E78D8[v49];
  }
  if (a2) {
    v51 = @"multipathServiceType";
  }
  else {
    v51 = @"multipath_service_type";
  }
  [v4 setObject:v50 forKey:v51];

  if ((*(_DWORD *)(a1 + 120) & 0x20000) != 0)
  {
LABEL_24:
    objc_super v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 119)];
    if (a2) {
      v9 = @"usedCellular";
    }
    else {
      v9 = @"used_cellular";
    }
    [v4 setObject:v8 forKey:v9];
  }
LABEL_28:
  v10 = *(void **)(a1 + 8);
  if (v10)
  {
    v11 = [v10 dictionaryRepresentation];
    v12 = v11;
    if (a2)
    {
      v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __64__GEOClientNetworkTransactionMetrics__dictionaryRepresentation___block_invoke;
      v52[3] = &unk_1E53D8860;
      id v14 = v13;
      id v53 = v14;
      [v12 enumerateKeysAndObjectsUsingBlock:v52];
      id v15 = v14;

      v12 = v15;
    }
    [v4 setObject:v12 forKey:@"Unknown Fields"];
  }
LABEL_32:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOClientNetworkTransactionMetrics _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __64__GEOClientNetworkTransactionMetrics__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
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

- (GEOClientNetworkTransactionMetrics)initWithDictionary:(id)a3
{
  return (GEOClientNetworkTransactionMetrics *)-[GEOClientNetworkTransactionMetrics _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_136;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_136;
  }
  if (a3) {
    v6 = @"fetchStart";
  }
  else {
    v6 = @"fetch_start";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 doubleValue];
    objc_msgSend(a1, "setFetchStart:");
  }

  if (a3) {
    objc_super v8 = @"domainLookupStart";
  }
  else {
    objc_super v8 = @"domain_lookup_start";
  }
  v9 = [v5 objectForKeyedSubscript:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v9 doubleValue];
    objc_msgSend(a1, "setDomainLookupStart:");
  }

  if (a3) {
    id v10 = @"domainLookupEnd";
  }
  else {
    id v10 = @"domain_lookup_end";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v11 doubleValue];
    objc_msgSend(a1, "setDomainLookupEnd:");
  }

  if (a3) {
    v12 = @"connectStart";
  }
  else {
    v12 = @"connect_start";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v13 doubleValue];
    objc_msgSend(a1, "setConnectStart:");
  }

  if (a3) {
    id v14 = @"secureConnectStart";
  }
  else {
    id v14 = @"secure_connect_start";
  }
  id v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v15 doubleValue];
    objc_msgSend(a1, "setSecureConnectStart:");
  }

  if (a3) {
    v16 = @"secureConnectEnd";
  }
  else {
    v16 = @"secure_connect_end";
  }
  v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v17 doubleValue];
    objc_msgSend(a1, "setSecureConnectEnd:");
  }

  if (a3) {
    v18 = @"connectEnd";
  }
  else {
    v18 = @"connect_end";
  }
  v19 = [v5 objectForKeyedSubscript:v18];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v19 doubleValue];
    objc_msgSend(a1, "setConnectEnd:");
  }

  if (a3) {
    v20 = @"requestStart";
  }
  else {
    v20 = @"request_start";
  }
  v21 = [v5 objectForKeyedSubscript:v20];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v21 doubleValue];
    objc_msgSend(a1, "setRequestStart:");
  }

  if (a3) {
    v22 = @"requestEnd";
  }
  else {
    v22 = @"request_end";
  }
  v23 = [v5 objectForKeyedSubscript:v22];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v23 doubleValue];
    objc_msgSend(a1, "setRequestEnd:");
  }

  if (a3) {
    v24 = @"responseStart";
  }
  else {
    v24 = @"response_start";
  }
  v25 = [v5 objectForKeyedSubscript:v24];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v25 doubleValue];
    objc_msgSend(a1, "setResponseStart:");
  }

  if (a3) {
    v26 = @"responseEnd";
  }
  else {
    v26 = @"response_end";
  }
  v27 = [v5 objectForKeyedSubscript:v26];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v27 doubleValue];
    objc_msgSend(a1, "setResponseEnd:");
  }

  if (a3) {
    v28 = @"protocolName";
  }
  else {
    v28 = @"protocol_name";
  }
  v29 = [v5 objectForKeyedSubscript:v28];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v30 = v29;
    if ([v30 isEqualToString:@"OTHER"])
    {
      uint64_t v31 = 0;
    }
    else if ([v30 isEqualToString:@"HTTP_1_1"])
    {
      uint64_t v31 = 1;
    }
    else if ([v30 isEqualToString:@"HTTP_2_TLS"])
    {
      uint64_t v31 = 2;
    }
    else if ([v30 isEqualToString:@"HTTP_2_TCP"])
    {
      uint64_t v31 = 3;
    }
    else if ([v30 isEqualToString:@"SPDY_1"])
    {
      uint64_t v31 = 4;
    }
    else if ([v30 isEqualToString:@"SPDY_2"])
    {
      uint64_t v31 = 5;
    }
    else if ([v30 isEqualToString:@"SPDY_3"])
    {
      uint64_t v31 = 6;
    }
    else
    {
      uint64_t v31 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_81;
    }
    uint64_t v31 = [v29 intValue];
  }
  [a1 setProtocolName:v31];
LABEL_81:

  if (a3) {
    v32 = @"proxyConnection";
  }
  else {
    v32 = @"proxy_connection";
  }
  v33 = [v5 objectForKeyedSubscript:v32];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setProxyConnection:", objc_msgSend(v33, "BOOLValue"));
  }

  if (a3) {
    v34 = @"reusedConnection";
  }
  else {
    v34 = @"reused_connection";
  }
  v35 = [v5 objectForKeyedSubscript:v34];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setReusedConnection:", objc_msgSend(v35, "BOOLValue"));
  }

  if (a3) {
    v36 = @"resourceFetchType";
  }
  else {
    v36 = @"resource_fetch_type";
  }
  uint64_t v37 = [v5 objectForKeyedSubscript:v36];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v38 = v37;
    if ([v38 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v39 = 0;
    }
    else if ([v38 isEqualToString:@"NETWORK_LOAD"])
    {
      uint64_t v39 = 1;
    }
    else if ([v38 isEqualToString:@"SERVER_PUSH"])
    {
      uint64_t v39 = 2;
    }
    else if ([v38 isEqualToString:@"LOCAL_CACHE"])
    {
      uint64_t v39 = 3;
    }
    else
    {
      uint64_t v39 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_108;
    }
    uint64_t v39 = [v37 intValue];
  }
  [a1 setResourceFetchType:v39];
LABEL_108:

  if (a3) {
    v40 = @"isMultipath";
  }
  else {
    v40 = @"is_multipath";
  }
  v41 = [v5 objectForKeyedSubscript:v40];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsMultipath:", objc_msgSend(v41, "BOOLValue"));
  }

  if (a3) {
    v42 = @"multipathServiceType";
  }
  else {
    v42 = @"multipath_service_type";
  }
  v43 = [v5 objectForKeyedSubscript:v42];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v44 = v43;
    if ([v44 isEqualToString:@"NONE"])
    {
      uint64_t v45 = 0;
    }
    else if ([v44 isEqualToString:@"HANDOVER"])
    {
      uint64_t v45 = 1;
    }
    else if ([v44 isEqualToString:@"INTERACTIVE"])
    {
      uint64_t v45 = 2;
    }
    else if ([v44 isEqualToString:@"AGGREGATE"])
    {
      uint64_t v45 = 3;
    }
    else
    {
      uint64_t v45 = 0;
    }

    goto LABEL_129;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v45 = [v43 intValue];
LABEL_129:
    [a1 setMultipathServiceType:v45];
  }

  if (a3) {
    v46 = @"usedCellular";
  }
  else {
    v46 = @"used_cellular";
  }
  v47 = [v5 objectForKeyedSubscript:v46];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setUsedCellular:", objc_msgSend(v47, "BOOLValue"));
  }

LABEL_136:
  return a1;
}

- (GEOClientNetworkTransactionMetrics)initWithJSON:(id)a3
{
  return (GEOClientNetworkTransactionMetrics *)-[GEOClientNetworkTransactionMetrics _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOClientNetworkTransactionMetricsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOClientNetworkTransactionMetricsReadAllFrom((uint64_t)self, a3);
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOClientNetworkTransactionMetrics *)self readAll:0];
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    v5[6] = *(void *)&self->_fetchStart;
    *((_DWORD *)v5 + 30) |= 0x10u;
    $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
    if ((*(unsigned char *)&flags & 8) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&flags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)&flags & 8) == 0)
  {
    goto LABEL_3;
  }
  v5[5] = *(void *)&self->_domainLookupStart;
  *((_DWORD *)v5 + 30) |= 8u;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  v5[4] = *(void *)&self->_domainLookupEnd;
  *((_DWORD *)v5 + 30) |= 4u;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&flags & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  v5[3] = *(void *)&self->_connectStart;
  *((_DWORD *)v5 + 30) |= 2u;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&flags & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  v5[12] = *(void *)&self->_secureConnectStart;
  *((_DWORD *)v5 + 30) |= 0x400u;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&flags & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  v5[11] = *(void *)&self->_secureConnectEnd;
  *((_DWORD *)v5 + 30) |= 0x200u;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(unsigned char *)&flags & 1) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&flags & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  v5[2] = *(void *)&self->_connectEnd;
  *((_DWORD *)v5 + 30) |= 1u;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&flags & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  v5[8] = *(void *)&self->_requestStart;
  *((_DWORD *)v5 + 30) |= 0x40u;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&flags & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  v5[7] = *(void *)&self->_requestEnd;
  *((_DWORD *)v5 + 30) |= 0x20u;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&flags & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  v5[10] = *(void *)&self->_responseStart;
  *((_DWORD *)v5 + 30) |= 0x100u;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x80) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&flags & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_34;
  }
LABEL_33:
  v5[9] = *(void *)&self->_responseEnd;
  *((_DWORD *)v5 + 30) |= 0x80u;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(_WORD *)&flags & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&flags & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v5 + 27) = self->_protocolName;
  *((_DWORD *)v5 + 30) |= 0x1000u;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(_WORD *)&flags & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&flags & 0x10000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((unsigned char *)v5 + 117) = self->_proxyConnection;
  *((_DWORD *)v5 + 30) |= 0x8000u;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&flags & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((unsigned char *)v5 + 118) = self->_reusedConnection;
  *((_DWORD *)v5 + 30) |= 0x10000u;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(_WORD *)&flags & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&flags & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v5 + 28) = self->_resourceFetchType;
  *((_DWORD *)v5 + 30) |= 0x2000u;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(_WORD *)&flags & 0x4000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&flags & 0x800) == 0) {
      goto LABEL_18;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((unsigned char *)v5 + 116) = self->_isMultipath;
  *((_DWORD *)v5 + 30) |= 0x4000u;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&flags & 0x20000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_39:
  *((_DWORD *)v5 + 26) = self->_multipathServiceType;
  *((_DWORD *)v5 + 30) |= 0x800u;
  if ((*(_DWORD *)&self->_flags & 0x20000) != 0)
  {
LABEL_19:
    *((unsigned char *)v5 + 119) = self->_usedCellular;
    *((_DWORD *)v5 + 30) |= 0x20000u;
  }
LABEL_20:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    *(double *)(v4 + 48) = self->_fetchStart;
    *(_DWORD *)(v4 + 120) |= 0x10u;
    $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
    if ((*(unsigned char *)&flags & 8) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&flags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v4 + 40) = self->_domainLookupStart;
  *(_DWORD *)(v4 + 120) |= 8u;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(double *)(v4 + 32) = self->_domainLookupEnd;
  *(_DWORD *)(v4 + 120) |= 4u;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&flags & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(double *)(v4 + 24) = self->_connectStart;
  *(_DWORD *)(v4 + 120) |= 2u;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&flags & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(double *)(v4 + 96) = self->_secureConnectStart;
  *(_DWORD *)(v4 + 120) |= 0x400u;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&flags & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(double *)(v4 + 88) = self->_secureConnectEnd;
  *(_DWORD *)(v4 + 120) |= 0x200u;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(unsigned char *)&flags & 1) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&flags & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(double *)(v4 + 16) = self->_connectEnd;
  *(_DWORD *)(v4 + 120) |= 1u;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&flags & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(double *)(v4 + 64) = self->_requestStart;
  *(_DWORD *)(v4 + 120) |= 0x40u;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&flags & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(double *)(v4 + 56) = self->_requestEnd;
  *(_DWORD *)(v4 + 120) |= 0x20u;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&flags & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_31;
  }
LABEL_30:
  *(double *)(v4 + 80) = self->_responseStart;
  *(_DWORD *)(v4 + 120) |= 0x100u;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x80) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&flags & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_32;
  }
LABEL_31:
  *(double *)(v4 + 72) = self->_responseEnd;
  *(_DWORD *)(v4 + 120) |= 0x80u;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(_WORD *)&flags & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&flags & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_33;
  }
LABEL_32:
  *(_DWORD *)(v4 + 108) = self->_protocolName;
  *(_DWORD *)(v4 + 120) |= 0x1000u;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(_WORD *)&flags & 0x8000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&flags & 0x10000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_34;
  }
LABEL_33:
  *(unsigned char *)(v4 + 117) = self->_proxyConnection;
  *(_DWORD *)(v4 + 120) |= 0x8000u;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&flags & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_35;
  }
LABEL_34:
  *(unsigned char *)(v4 + 118) = self->_reusedConnection;
  *(_DWORD *)(v4 + 120) |= 0x10000u;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(_WORD *)&flags & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&flags & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_36;
  }
LABEL_35:
  *(_DWORD *)(v4 + 112) = self->_resourceFetchType;
  *(_DWORD *)(v4 + 120) |= 0x2000u;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(_WORD *)&flags & 0x4000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&flags & 0x800) == 0) {
      goto LABEL_18;
    }
LABEL_37:
    *(_DWORD *)(v4 + 104) = self->_multipathServiceType;
    *(_DWORD *)(v4 + 120) |= 0x800u;
    if ((*(_DWORD *)&self->_flags & 0x20000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_36:
  *(unsigned char *)(v4 + 116) = self->_isMultipath;
  *(_DWORD *)(v4 + 120) |= 0x4000u;
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) != 0) {
    goto LABEL_37;
  }
LABEL_18:
  if ((*(_DWORD *)&flags & 0x20000) != 0)
  {
LABEL_19:
    *(unsigned char *)(v4 + 119) = self->_usedCellular;
    *(_DWORD *)(v4 + 120) |= 0x20000u;
  }
LABEL_20:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_99;
  }
  [(GEOClientNetworkTransactionMetrics *)self readAll:1];
  [v4 readAll:1];
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  int v6 = *((_DWORD *)v4 + 30);
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_fetchStart != *((double *)v4 + 6)) {
      goto LABEL_99;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_99;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_domainLookupStart != *((double *)v4 + 5)) {
      goto LABEL_99;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_99;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_domainLookupEnd != *((double *)v4 + 4)) {
      goto LABEL_99;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_99;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_connectStart != *((double *)v4 + 3)) {
      goto LABEL_99;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_secureConnectStart != *((double *)v4 + 12)) {
      goto LABEL_99;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_secureConnectEnd != *((double *)v4 + 11)) {
      goto LABEL_99;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_99;
  }
  if (*(unsigned char *)&flags)
  {
    if ((v6 & 1) == 0 || self->_connectEnd != *((double *)v4 + 2)) {
      goto LABEL_99;
    }
  }
  else if (v6)
  {
    goto LABEL_99;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_requestStart != *((double *)v4 + 8)) {
      goto LABEL_99;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_99;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_requestEnd != *((double *)v4 + 7)) {
      goto LABEL_99;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_responseStart != *((double *)v4 + 10)) {
      goto LABEL_99;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_99;
  }
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_responseEnd != *((double *)v4 + 9)) {
      goto LABEL_99;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_WORD *)&flags & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_protocolName != *((_DWORD *)v4 + 27)) {
      goto LABEL_99;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_WORD *)&flags & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0) {
      goto LABEL_99;
    }
    if (self->_proxyConnection)
    {
      if (!*((unsigned char *)v4 + 117)) {
        goto LABEL_99;
      }
    }
    else if (*((unsigned char *)v4 + 117))
    {
      goto LABEL_99;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_DWORD *)&flags & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0) {
      goto LABEL_99;
    }
    if (self->_reusedConnection)
    {
      if (!*((unsigned char *)v4 + 118)) {
        goto LABEL_99;
      }
    }
    else if (*((unsigned char *)v4 + 118))
    {
      goto LABEL_99;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_WORD *)&flags & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_resourceFetchType != *((_DWORD *)v4 + 28)) {
      goto LABEL_99;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_WORD *)&flags & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0) {
      goto LABEL_99;
    }
    if (self->_isMultipath)
    {
      if (!*((unsigned char *)v4 + 116)) {
        goto LABEL_99;
      }
    }
    else if (*((unsigned char *)v4 + 116))
    {
      goto LABEL_99;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_multipathServiceType != *((_DWORD *)v4 + 26)) {
      goto LABEL_99;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_DWORD *)&flags & 0x20000) != 0)
  {
    if ((v6 & 0x20000) != 0)
    {
      if (self->_usedCellular)
      {
        if (!*((unsigned char *)v4 + 119)) {
          goto LABEL_99;
        }
      }
      else if (*((unsigned char *)v4 + 119))
      {
        goto LABEL_99;
      }
      BOOL v7 = 1;
      goto LABEL_100;
    }
LABEL_99:
    BOOL v7 = 0;
    goto LABEL_100;
  }
  BOOL v7 = (v6 & 0x20000) == 0;
LABEL_100:

  return v7;
}

- (unint64_t)hash
{
  [(GEOClientNetworkTransactionMetrics *)self readAll:1];
  $B5C7CCCB84F8B0E196EE451F642EF20E flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    double fetchStart = self->_fetchStart;
    double v6 = -fetchStart;
    if (fetchStart >= 0.0) {
      double v6 = self->_fetchStart;
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
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    double domainLookupStart = self->_domainLookupStart;
    double v11 = -domainLookupStart;
    if (domainLookupStart >= 0.0) {
      double v11 = self->_domainLookupStart;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    double domainLookupEnd = self->_domainLookupEnd;
    double v16 = -domainLookupEnd;
    if (domainLookupEnd >= 0.0) {
      double v16 = self->_domainLookupEnd;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    double connectStart = self->_connectStart;
    double v21 = -connectStart;
    if (connectStart >= 0.0) {
      double v21 = self->_connectStart;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    double secureConnectStart = self->_secureConnectStart;
    double v26 = -secureConnectStart;
    if (secureConnectStart >= 0.0) {
      double v26 = self->_secureConnectStart;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    double secureConnectEnd = self->_secureConnectEnd;
    double v31 = -secureConnectEnd;
    if (secureConnectEnd >= 0.0) {
      double v31 = self->_secureConnectEnd;
    }
    long double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  if (*(unsigned char *)&flags)
  {
    double connectEnd = self->_connectEnd;
    double v36 = -connectEnd;
    if (connectEnd >= 0.0) {
      double v36 = self->_connectEnd;
    }
    long double v37 = floor(v36 + 0.5);
    double v38 = (v36 - v37) * 1.84467441e19;
    unint64_t v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0) {
        v34 += (unint64_t)v38;
      }
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    unint64_t v34 = 0;
  }
  unint64_t v71 = v24;
  unint64_t v72 = v4;
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    double requestStart = self->_requestStart;
    double v41 = -requestStart;
    if (requestStart >= 0.0) {
      double v41 = self->_requestStart;
    }
    long double v42 = floor(v41 + 0.5);
    double v43 = (v41 - v42) * 1.84467441e19;
    unint64_t v39 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0) {
        v39 += (unint64_t)v43;
      }
    }
    else
    {
      v39 -= (unint64_t)fabs(v43);
    }
  }
  else
  {
    unint64_t v39 = 0;
  }
  unint64_t v70 = v9;
  unint64_t v44 = v29;
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    double requestEnd = self->_requestEnd;
    double v48 = -requestEnd;
    if (requestEnd >= 0.0) {
      double v48 = self->_requestEnd;
    }
    long double v49 = floor(v48 + 0.5);
    double v50 = (v48 - v49) * 1.84467441e19;
    unint64_t v46 = 2654435761u * (unint64_t)fmod(v49, 1.84467441e19);
    unint64_t v45 = v19;
    if (v50 >= 0.0)
    {
      if (v50 > 0.0) {
        v46 += (unint64_t)v50;
      }
    }
    else
    {
      v46 -= (unint64_t)fabs(v50);
    }
  }
  else
  {
    unint64_t v45 = v19;
    unint64_t v46 = 0;
  }
  unint64_t v51 = v14;
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    double responseStart = self->_responseStart;
    double v54 = -responseStart;
    if (responseStart >= 0.0) {
      double v54 = self->_responseStart;
    }
    long double v55 = floor(v54 + 0.5);
    double v56 = (v54 - v55) * 1.84467441e19;
    unint64_t v52 = 2654435761u * (unint64_t)fmod(v55, 1.84467441e19);
    if (v56 >= 0.0)
    {
      if (v56 > 0.0) {
        v52 += (unint64_t)v56;
      }
    }
    else
    {
      v52 -= (unint64_t)fabs(v56);
    }
  }
  else
  {
    unint64_t v52 = 0;
  }
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    double responseEnd = self->_responseEnd;
    double v59 = -responseEnd;
    if (responseEnd >= 0.0) {
      double v59 = self->_responseEnd;
    }
    long double v60 = floor(v59 + 0.5);
    double v61 = (v59 - v60) * 1.84467441e19;
    unint64_t v57 = 2654435761u * (unint64_t)fmod(v60, 1.84467441e19);
    if (v61 >= 0.0)
    {
      if (v61 > 0.0) {
        v57 += (unint64_t)v61;
      }
    }
    else
    {
      v57 -= (unint64_t)fabs(v61);
    }
  }
  else
  {
    unint64_t v57 = 0;
  }
  if ((*(_WORD *)&flags & 0x1000) != 0)
  {
    uint64_t v62 = 2654435761 * self->_protocolName;
    if ((*(_WORD *)&flags & 0x8000) != 0)
    {
LABEL_91:
      uint64_t v63 = 2654435761 * self->_proxyConnection;
      if ((*(_DWORD *)&flags & 0x10000) != 0) {
        goto LABEL_92;
      }
      goto LABEL_99;
    }
  }
  else
  {
    uint64_t v62 = 0;
    if ((*(_WORD *)&flags & 0x8000) != 0) {
      goto LABEL_91;
    }
  }
  uint64_t v63 = 0;
  if ((*(_DWORD *)&flags & 0x10000) != 0)
  {
LABEL_92:
    uint64_t v64 = 2654435761 * self->_reusedConnection;
    if ((*(_WORD *)&flags & 0x2000) != 0) {
      goto LABEL_93;
    }
    goto LABEL_100;
  }
LABEL_99:
  uint64_t v64 = 0;
  if ((*(_WORD *)&flags & 0x2000) != 0)
  {
LABEL_93:
    uint64_t v65 = 2654435761 * self->_resourceFetchType;
    if ((*(_WORD *)&flags & 0x4000) != 0) {
      goto LABEL_94;
    }
    goto LABEL_101;
  }
LABEL_100:
  uint64_t v65 = 0;
  if ((*(_WORD *)&flags & 0x4000) != 0)
  {
LABEL_94:
    uint64_t v66 = 2654435761 * self->_isMultipath;
    if ((*(_WORD *)&flags & 0x800) != 0) {
      goto LABEL_95;
    }
LABEL_102:
    uint64_t v67 = 0;
    if ((*(_DWORD *)&flags & 0x20000) != 0) {
      goto LABEL_96;
    }
LABEL_103:
    uint64_t v68 = 0;
    return v70 ^ v72 ^ v51 ^ v45 ^ v71 ^ v44 ^ v34 ^ v39 ^ v46 ^ v52 ^ v57 ^ v62 ^ v63 ^ v64 ^ v65 ^ v66 ^ v67 ^ v68;
  }
LABEL_101:
  uint64_t v66 = 0;
  if ((*(_WORD *)&flags & 0x800) == 0) {
    goto LABEL_102;
  }
LABEL_95:
  uint64_t v67 = 2654435761 * self->_multipathServiceType;
  if ((*(_DWORD *)&flags & 0x20000) == 0) {
    goto LABEL_103;
  }
LABEL_96:
  uint64_t v68 = 2654435761 * self->_usedCellular;
  return v70 ^ v72 ^ v51 ^ v45 ^ v71 ^ v44 ^ v34 ^ v39 ^ v46 ^ v52 ^ v57 ^ v62 ^ v63 ^ v64 ^ v65 ^ v66 ^ v67 ^ v68;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  int v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 0x10) != 0)
  {
    self->_double fetchStart = *((double *)v5 + 6);
    *(_DWORD *)&self->_flags |= 0x10u;
    int v4 = *((_DWORD *)v5 + 30);
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((v4 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_double domainLookupStart = *((double *)v5 + 5);
  *(_DWORD *)&self->_flags |= 8u;
  int v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_double domainLookupEnd = *((double *)v5 + 4);
  *(_DWORD *)&self->_flags |= 4u;
  int v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 2) == 0)
  {
LABEL_5:
    if ((v4 & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_double connectStart = *((double *)v5 + 3);
  *(_DWORD *)&self->_flags |= 2u;
  int v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 0x400) == 0)
  {
LABEL_6:
    if ((v4 & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_double secureConnectStart = *((double *)v5 + 12);
  *(_DWORD *)&self->_flags |= 0x400u;
  int v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 0x200) == 0)
  {
LABEL_7:
    if ((v4 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_double secureConnectEnd = *((double *)v5 + 11);
  *(_DWORD *)&self->_flags |= 0x200u;
  int v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 1) == 0)
  {
LABEL_8:
    if ((v4 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_double connectEnd = *((double *)v5 + 2);
  *(_DWORD *)&self->_flags |= 1u;
  int v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 0x40) == 0)
  {
LABEL_9:
    if ((v4 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_double requestStart = *((double *)v5 + 8);
  *(_DWORD *)&self->_flags |= 0x40u;
  int v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 0x20) == 0)
  {
LABEL_10:
    if ((v4 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_double requestEnd = *((double *)v5 + 7);
  *(_DWORD *)&self->_flags |= 0x20u;
  int v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 0x100) == 0)
  {
LABEL_11:
    if ((v4 & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_double responseStart = *((double *)v5 + 10);
  *(_DWORD *)&self->_flags |= 0x100u;
  int v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 0x80) == 0)
  {
LABEL_12:
    if ((v4 & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_double responseEnd = *((double *)v5 + 9);
  *(_DWORD *)&self->_flags |= 0x80u;
  int v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 0x1000) == 0)
  {
LABEL_13:
    if ((v4 & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_protocolName = *((_DWORD *)v5 + 27);
  *(_DWORD *)&self->_flags |= 0x1000u;
  int v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 0x8000) == 0)
  {
LABEL_14:
    if ((v4 & 0x10000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_proxyConnection = *((unsigned char *)v5 + 117);
  *(_DWORD *)&self->_flags |= 0x8000u;
  int v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 0x10000) == 0)
  {
LABEL_15:
    if ((v4 & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_reusedConnection = *((unsigned char *)v5 + 118);
  *(_DWORD *)&self->_flags |= 0x10000u;
  int v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 0x2000) == 0)
  {
LABEL_16:
    if ((v4 & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_resourceFetchType = *((_DWORD *)v5 + 28);
  *(_DWORD *)&self->_flags |= 0x2000u;
  int v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 0x4000) == 0)
  {
LABEL_17:
    if ((v4 & 0x800) == 0) {
      goto LABEL_18;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_isMultipath = *((unsigned char *)v5 + 116);
  *(_DWORD *)&self->_flags |= 0x4000u;
  int v4 = *((_DWORD *)v5 + 30);
  if ((v4 & 0x800) == 0)
  {
LABEL_18:
    if ((v4 & 0x20000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_39:
  self->_multipathServiceType = *((_DWORD *)v5 + 26);
  *(_DWORD *)&self->_flags |= 0x800u;
  if ((*((_DWORD *)v5 + 30) & 0x20000) != 0)
  {
LABEL_19:
    self->_usedCellular = *((unsigned char *)v5 + 119);
    *(_DWORD *)&self->_flags |= 0x20000u;
  }
LABEL_20:
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOClientNetworkTransactionMetrics *)self readAll:0];
  }
}

@end