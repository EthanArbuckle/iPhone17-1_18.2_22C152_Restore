@interface GEONetworkSessionTaskTransactionMetrics
+ (BOOL)isValid:(id)a3;
- (BOOL)hasConnectEnd;
- (BOOL)hasConnectStart;
- (BOOL)hasDomainLookupEnd;
- (BOOL)hasDomainLookupStart;
- (BOOL)hasFetchStart;
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
- (BOOL)isEqual:(id)a3;
- (BOOL)proxyConnection;
- (BOOL)readFrom:(id)a3;
- (BOOL)reusedConnection;
- (GEONetworkSessionTaskTransactionMetrics)initWithDictionary:(id)a3;
- (GEONetworkSessionTaskTransactionMetrics)initWithJSON:(id)a3;
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
- (id)protocolNameAsString:(int)a3;
- (id)resourceFetchTypeAsString:(int)a3;
- (int)StringAsProtocolName:(id)a3;
- (int)StringAsResourceFetchType:(id)a3;
- (int)protocolName;
- (int)resourceFetchType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
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
- (void)writeTo:(id)a3;
@end

@implementation GEONetworkSessionTaskTransactionMetrics

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_84;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v5 = *(_WORD *)(a1 + 108);
  if ((v5 & 0x10) != 0)
  {
    v6 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
    if (a2) {
      v7 = @"fetchStart";
    }
    else {
      v7 = @"fetch_start";
    }
    [v4 setObject:v6 forKey:v7];

    __int16 v5 = *(_WORD *)(a1 + 108);
  }
  if ((v5 & 8) != 0)
  {
    v8 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
    if (a2) {
      v9 = @"domainLookupStart";
    }
    else {
      v9 = @"domain_lookup_start";
    }
    [v4 setObject:v8 forKey:v9];

    __int16 v5 = *(_WORD *)(a1 + 108);
    if ((v5 & 4) == 0)
    {
LABEL_9:
      if ((v5 & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_30;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_9;
  }
  v10 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
  if (a2) {
    v11 = @"domainLookupEnd";
  }
  else {
    v11 = @"domain_lookup_end";
  }
  [v4 setObject:v10 forKey:v11];

  __int16 v5 = *(_WORD *)(a1 + 108);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_34;
  }
LABEL_30:
  v12 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
  if (a2) {
    v13 = @"connectStart";
  }
  else {
    v13 = @"connect_start";
  }
  [v4 setObject:v12 forKey:v13];

  __int16 v5 = *(_WORD *)(a1 + 108);
  if ((v5 & 0x400) == 0)
  {
LABEL_11:
    if ((v5 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_38;
  }
LABEL_34:
  v14 = [NSNumber numberWithDouble:*(double *)(a1 + 88)];
  if (a2) {
    v15 = @"secureConnectStart";
  }
  else {
    v15 = @"secure_connect_start";
  }
  [v4 setObject:v14 forKey:v15];

  __int16 v5 = *(_WORD *)(a1 + 108);
  if ((v5 & 0x200) == 0)
  {
LABEL_12:
    if ((v5 & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_42;
  }
LABEL_38:
  v16 = [NSNumber numberWithDouble:*(double *)(a1 + 80)];
  if (a2) {
    v17 = @"secureConnectEnd";
  }
  else {
    v17 = @"secure_connect_end";
  }
  [v4 setObject:v16 forKey:v17];

  __int16 v5 = *(_WORD *)(a1 + 108);
  if ((v5 & 1) == 0)
  {
LABEL_13:
    if ((v5 & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_46;
  }
LABEL_42:
  v18 = [NSNumber numberWithDouble:*(double *)(a1 + 8)];
  if (a2) {
    v19 = @"connectEnd";
  }
  else {
    v19 = @"connect_end";
  }
  [v4 setObject:v18 forKey:v19];

  __int16 v5 = *(_WORD *)(a1 + 108);
  if ((v5 & 0x40) == 0)
  {
LABEL_14:
    if ((v5 & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_50;
  }
LABEL_46:
  v20 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
  if (a2) {
    v21 = @"requestStart";
  }
  else {
    v21 = @"request_start";
  }
  [v4 setObject:v20 forKey:v21];

  __int16 v5 = *(_WORD *)(a1 + 108);
  if ((v5 & 0x20) == 0)
  {
LABEL_15:
    if ((v5 & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_54;
  }
LABEL_50:
  v22 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  if (a2) {
    v23 = @"requestEnd";
  }
  else {
    v23 = @"request_end";
  }
  [v4 setObject:v22 forKey:v23];

  __int16 v5 = *(_WORD *)(a1 + 108);
  if ((v5 & 0x100) == 0)
  {
LABEL_16:
    if ((v5 & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_58;
  }
LABEL_54:
  v24 = [NSNumber numberWithDouble:*(double *)(a1 + 72)];
  if (a2) {
    v25 = @"responseStart";
  }
  else {
    v25 = @"response_start";
  }
  [v4 setObject:v24 forKey:v25];

  __int16 v5 = *(_WORD *)(a1 + 108);
  if ((v5 & 0x80) == 0)
  {
LABEL_17:
    if ((v5 & 0x800) == 0) {
      goto LABEL_18;
    }
    goto LABEL_62;
  }
LABEL_58:
  v26 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
  if (a2) {
    v27 = @"responseEnd";
  }
  else {
    v27 = @"response_end";
  }
  [v4 setObject:v26 forKey:v27];

  __int16 v5 = *(_WORD *)(a1 + 108);
  if ((v5 & 0x800) == 0)
  {
LABEL_18:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_69;
  }
LABEL_62:
  uint64_t v28 = *(int *)(a1 + 96);
  if (v28 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 96));
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = off_1E53F8908[v28];
  }
  if (a2) {
    v30 = @"protocolName";
  }
  else {
    v30 = @"protocol_name";
  }
  [v4 setObject:v29 forKey:v30];

  __int16 v5 = *(_WORD *)(a1 + 108);
  if ((v5 & 0x2000) == 0)
  {
LABEL_19:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_20;
    }
LABEL_73:
    v33 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 105)];
    if (a2) {
      v34 = @"reusedConnection";
    }
    else {
      v34 = @"reused_connection";
    }
    [v4 setObject:v33 forKey:v34];

    if ((*(_WORD *)(a1 + 108) & 0x1000) == 0) {
      goto LABEL_84;
    }
    goto LABEL_77;
  }
LABEL_69:
  v31 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 104)];
  if (a2) {
    v32 = @"proxyConnection";
  }
  else {
    v32 = @"proxy_connection";
  }
  [v4 setObject:v31 forKey:v32];

  __int16 v5 = *(_WORD *)(a1 + 108);
  if ((v5 & 0x4000) != 0) {
    goto LABEL_73;
  }
LABEL_20:
  if ((v5 & 0x1000) != 0)
  {
LABEL_77:
    uint64_t v35 = *(int *)(a1 + 100);
    if (v35 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 100));
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v36 = off_1E53F8940[v35];
    }
    if (a2) {
      v37 = @"resourceFetchType";
    }
    else {
      v37 = @"resource_fetch_type";
    }
    [v4 setObject:v36 forKey:v37];
  }
LABEL_84:

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_83;
  }
  [(GEONetworkSessionTaskTransactionMetrics *)self readAll:1];
  [v4 readAll:1];
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 54);
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_fetchStart != *((double *)v4 + 5)) {
      goto LABEL_83;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_83;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_domainLookupStart != *((double *)v4 + 4)) {
      goto LABEL_83;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_83;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_domainLookupEnd != *((double *)v4 + 3)) {
      goto LABEL_83;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_83;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_connectStart != *((double *)v4 + 2)) {
      goto LABEL_83;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x400) == 0 || self->_secureConnectStart != *((double *)v4 + 11)) {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x400) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x200) == 0 || self->_secureConnectEnd != *((double *)v4 + 10)) {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x200) != 0)
  {
    goto LABEL_83;
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_connectEnd != *((double *)v4 + 1)) {
      goto LABEL_83;
    }
  }
  else if (v6)
  {
    goto LABEL_83;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_requestStart != *((double *)v4 + 7)) {
      goto LABEL_83;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_83;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_requestEnd != *((double *)v4 + 6)) {
      goto LABEL_83;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x100) == 0 || self->_responseStart != *((double *)v4 + 9)) {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x100) != 0)
  {
    goto LABEL_83;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_responseEnd != *((double *)v4 + 8)) {
      goto LABEL_83;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_flags & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x800) == 0 || self->_protocolName != *((_DWORD *)v4 + 24)) {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x800) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_flags & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x2000) == 0) {
      goto LABEL_83;
    }
    if (self->_proxyConnection)
    {
      if (!*((unsigned char *)v4 + 104)) {
        goto LABEL_83;
      }
    }
    else if (*((unsigned char *)v4 + 104))
    {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x2000) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_flags & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x4000) != 0)
    {
      if (self->_reusedConnection)
      {
        if (!*((unsigned char *)v4 + 105)) {
          goto LABEL_83;
        }
        goto LABEL_78;
      }
      if (!*((unsigned char *)v4 + 105)) {
        goto LABEL_78;
      }
    }
LABEL_83:
    BOOL v7 = 0;
    goto LABEL_84;
  }
  if ((*((_WORD *)v4 + 54) & 0x4000) != 0) {
    goto LABEL_83;
  }
LABEL_78:
  if ((*(_WORD *)&self->_flags & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x1000) == 0 || self->_resourceFetchType != *((_DWORD *)v4 + 25)) {
      goto LABEL_83;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 0x1000) == 0;
  }
LABEL_84:

  return v7;
}

- (double)fetchStart
{
  return self->_fetchStart;
}

- (void)setFetchStart:(double)a3
{
  *(_WORD *)&self->_flags |= 0x10u;
  self->_fetchStart = a3;
}

- (void)setHasFetchStart:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasFetchStart
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (double)domainLookupStart
{
  return self->_domainLookupStart;
}

- (void)setDomainLookupStart:(double)a3
{
  *(_WORD *)&self->_flags |= 8u;
  self->_domainLookupStart = a3;
}

- (void)setHasDomainLookupStart:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasDomainLookupStart
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (double)domainLookupEnd
{
  return self->_domainLookupEnd;
}

- (void)setDomainLookupEnd:(double)a3
{
  *(_WORD *)&self->_flags |= 4u;
  self->_domainLookupEnd = a3;
}

- (void)setHasDomainLookupEnd:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasDomainLookupEnd
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (double)connectStart
{
  return self->_connectStart;
}

- (void)setConnectStart:(double)a3
{
  *(_WORD *)&self->_flags |= 2u;
  self->_connectStart = a3;
}

- (void)setHasConnectStart:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasConnectStart
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (double)secureConnectStart
{
  return self->_secureConnectStart;
}

- (void)setSecureConnectStart:(double)a3
{
  *(_WORD *)&self->_flags |= 0x400u;
  self->_secureConnectStart = a3;
}

- (void)setHasSecureConnectStart:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFBFF | v3;
}

- (BOOL)hasSecureConnectStart
{
  return (*(_WORD *)&self->_flags >> 10) & 1;
}

- (double)secureConnectEnd
{
  return self->_secureConnectEnd;
}

- (void)setSecureConnectEnd:(double)a3
{
  *(_WORD *)&self->_flags |= 0x200u;
  self->_secureConnectEnd = a3;
}

- (void)setHasSecureConnectEnd:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFDFF | v3;
}

- (BOOL)hasSecureConnectEnd
{
  return (*(_WORD *)&self->_flags >> 9) & 1;
}

- (double)connectEnd
{
  return self->_connectEnd;
}

- (void)setConnectEnd:(double)a3
{
  *(_WORD *)&self->_flags |= 1u;
  self->_connectEnd = a3;
}

- (void)setHasConnectEnd:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3;
}

- (BOOL)hasConnectEnd
{
  return *(_WORD *)&self->_flags & 1;
}

- (double)requestStart
{
  return self->_requestStart;
}

- (void)setRequestStart:(double)a3
{
  *(_WORD *)&self->_flags |= 0x40u;
  self->_requestStart = a3;
}

- (void)setHasRequestStart:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasRequestStart
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (double)requestEnd
{
  return self->_requestEnd;
}

- (void)setRequestEnd:(double)a3
{
  *(_WORD *)&self->_flags |= 0x20u;
  self->_requestEnd = a3;
}

- (void)setHasRequestEnd:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasRequestEnd
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (double)responseStart
{
  return self->_responseStart;
}

- (void)setResponseStart:(double)a3
{
  *(_WORD *)&self->_flags |= 0x100u;
  self->_responseStart = a3;
}

- (void)setHasResponseStart:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFEFF | v3;
}

- (BOOL)hasResponseStart
{
  return HIBYTE(*(_WORD *)&self->_flags) & 1;
}

- (double)responseEnd
{
  return self->_responseEnd;
}

- (void)setResponseEnd:(double)a3
{
  *(_WORD *)&self->_flags |= 0x80u;
  self->_responseEnd = a3;
}

- (void)setHasResponseEnd:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasResponseEnd
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (int)protocolName
{
  if ((*(_WORD *)&self->_flags & 0x800) != 0) {
    return self->_protocolName;
  }
  else {
    return 0;
  }
}

- (void)setProtocolName:(int)a3
{
  *(_WORD *)&self->_flags |= 0x800u;
  self->_protocolName = a3;
}

- (void)setHasProtocolName:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xF7FF | v3;
}

- (BOOL)hasProtocolName
{
  return (*(_WORD *)&self->_flags >> 11) & 1;
}

- (id)protocolNameAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53F8908[a3];
  }

  return v3;
}

- (int)StringAsProtocolName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PROTOCOL_TYPE_OTHER"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PROTOCOL_TYPE_HTTP_1_1"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PROTOCOL_TYPE_HTTP_2_TLS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PROTOCOL_TYPE_HTTP_2_TCP"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PROTOCOL_TYPE_SPDY_1"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PROTOCOL_TYPE_SPDY_2"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PROTOCOL_TYPE_SPDY_3"])
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

- (void)setProxyConnection:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2000u;
  self->_proxyConnection = a3;
}

- (void)setHasProxyConnection:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xDFFF | v3;
}

- (BOOL)hasProxyConnection
{
  return (*(_WORD *)&self->_flags >> 13) & 1;
}

- (BOOL)reusedConnection
{
  return self->_reusedConnection;
}

- (void)setReusedConnection:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x4000u;
  self->_reusedConnection = a3;
}

- (void)setHasReusedConnection:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xBFFF | v3;
}

- (BOOL)hasReusedConnection
{
  return (*(_WORD *)&self->_flags >> 14) & 1;
}

- (int)resourceFetchType
{
  if ((*(_WORD *)&self->_flags & 0x1000) != 0) {
    return self->_resourceFetchType;
  }
  else {
    return 0;
  }
}

- (void)setResourceFetchType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1000u;
  self->_resourceFetchType = a3;
}

- (void)setHasResourceFetchType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xEFFF | v3;
}

- (BOOL)hasResourceFetchType
{
  return (*(_WORD *)&self->_flags >> 12) & 1;
}

- (id)resourceFetchTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53F8940[a3];
  }

  return v3;
}

- (int)StringAsResourceFetchType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RESOURCE_FETCH_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RESOURCE_FETCH_TYPE_NETWORK_LOAD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RESOURCE_FETCH_TYPE_SERVER_PUSH"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RESOURCE_FETCH_TYPE_LOCAL_CACHE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEONetworkSessionTaskTransactionMetrics;
  int v4 = [(GEONetworkSessionTaskTransactionMetrics *)&v8 description];
  __int16 v5 = [(GEONetworkSessionTaskTransactionMetrics *)self dictionaryRepresentation];
  __int16 v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONetworkSessionTaskTransactionMetrics _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEONetworkSessionTaskTransactionMetrics _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEONetworkSessionTaskTransactionMetrics)initWithDictionary:(id)a3
{
  return (GEONetworkSessionTaskTransactionMetrics *)-[GEONetworkSessionTaskTransactionMetrics _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        __int16 v6 = @"fetchStart";
      }
      else {
        __int16 v6 = @"fetch_start";
      }
      BOOL v7 = [v5 objectForKeyedSubscript:v6];
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
        v10 = @"domainLookupEnd";
      }
      else {
        v10 = @"domain_lookup_end";
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
        v14 = @"secureConnectStart";
      }
      else {
        v14 = @"secure_connect_start";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
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
        uint64_t v28 = @"protocolName";
      }
      else {
        uint64_t v28 = @"protocol_name";
      }
      v29 = [v5 objectForKeyedSubscript:v28];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v30 = v29;
        if ([v30 isEqualToString:@"PROTOCOL_TYPE_OTHER"])
        {
          uint64_t v31 = 0;
        }
        else if ([v30 isEqualToString:@"PROTOCOL_TYPE_HTTP_1_1"])
        {
          uint64_t v31 = 1;
        }
        else if ([v30 isEqualToString:@"PROTOCOL_TYPE_HTTP_2_TLS"])
        {
          uint64_t v31 = 2;
        }
        else if ([v30 isEqualToString:@"PROTOCOL_TYPE_HTTP_2_TCP"])
        {
          uint64_t v31 = 3;
        }
        else if ([v30 isEqualToString:@"PROTOCOL_TYPE_SPDY_1"])
        {
          uint64_t v31 = 4;
        }
        else if ([v30 isEqualToString:@"PROTOCOL_TYPE_SPDY_2"])
        {
          uint64_t v31 = 5;
        }
        else if ([v30 isEqualToString:@"PROTOCOL_TYPE_SPDY_3"])
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
      uint64_t v35 = [v5 objectForKeyedSubscript:v34];
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
      v37 = [v5 objectForKeyedSubscript:v36];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v38 = v37;
        if ([v38 isEqualToString:@"RESOURCE_FETCH_TYPE_UNKNOWN"])
        {
          uint64_t v39 = 0;
        }
        else if ([v38 isEqualToString:@"RESOURCE_FETCH_TYPE_NETWORK_LOAD"])
        {
          uint64_t v39 = 1;
        }
        else if ([v38 isEqualToString:@"RESOURCE_FETCH_TYPE_SERVER_PUSH"])
        {
          uint64_t v39 = 2;
        }
        else if ([v38 isEqualToString:@"RESOURCE_FETCH_TYPE_LOCAL_CACHE"])
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
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_108:

          goto LABEL_109;
        }
        uint64_t v39 = [v37 intValue];
      }
      [a1 setResourceFetchType:v39];
      goto LABEL_108;
    }
  }
LABEL_109:

  return a1;
}

- (GEONetworkSessionTaskTransactionMetrics)initWithJSON:(id)a3
{
  return (GEONetworkSessionTaskTransactionMetrics *)-[GEONetworkSessionTaskTransactionMetrics _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEONetworkSessionTaskTransactionMetricsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONetworkSessionTaskTransactionMetricsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField();
    __int16 flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteDoubleField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteDoubleField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x400) == 0)
  {
LABEL_6:
    if ((flags & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteDoubleField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_7:
    if ((flags & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteDoubleField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_8:
    if ((flags & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteDoubleField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_9:
    if ((flags & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteDoubleField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_10:
    if ((flags & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteDoubleField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_11:
    if ((flags & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteDoubleField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_12:
    if ((flags & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteDoubleField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x800) == 0)
  {
LABEL_13:
    if ((flags & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteInt32Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x2000) == 0)
  {
LABEL_14:
    if ((flags & 0x4000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteBOOLField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x4000) == 0)
  {
LABEL_15:
    if ((flags & 0x1000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_33:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_flags & 0x1000) != 0) {
LABEL_16:
  }
    PBDataWriterWriteInt32Field();
LABEL_17:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEONetworkSessionTaskTransactionMetrics *)self readAll:0];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    v5[5] = *(void *)&self->_fetchStart;
    *((_WORD *)v5 + 54) |= 0x10u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((flags & 8) == 0)
  {
    goto LABEL_3;
  }
  v5[4] = *(void *)&self->_domainLookupStart;
  *((_WORD *)v5 + 54) |= 8u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  v5[3] = *(void *)&self->_domainLookupEnd;
  *((_WORD *)v5 + 54) |= 4u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  v5[2] = *(void *)&self->_connectStart;
  *((_WORD *)v5 + 54) |= 2u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x400) == 0)
  {
LABEL_6:
    if ((flags & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  v5[11] = *(void *)&self->_secureConnectStart;
  *((_WORD *)v5 + 54) |= 0x400u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_7:
    if ((flags & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  v5[10] = *(void *)&self->_secureConnectEnd;
  *((_WORD *)v5 + 54) |= 0x200u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_8:
    if ((flags & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  v5[1] = *(void *)&self->_connectEnd;
  *((_WORD *)v5 + 54) |= 1u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_9:
    if ((flags & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  v5[7] = *(void *)&self->_requestStart;
  *((_WORD *)v5 + 54) |= 0x40u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_10:
    if ((flags & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  v5[6] = *(void *)&self->_requestEnd;
  *((_WORD *)v5 + 54) |= 0x20u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_11:
    if ((flags & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  v5[9] = *(void *)&self->_responseStart;
  *((_WORD *)v5 + 54) |= 0x100u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_12:
    if ((flags & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  v5[8] = *(void *)&self->_responseEnd;
  *((_WORD *)v5 + 54) |= 0x80u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x800) == 0)
  {
LABEL_13:
    if ((flags & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v5 + 24) = self->_protocolName;
  *((_WORD *)v5 + 54) |= 0x800u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x2000) == 0)
  {
LABEL_14:
    if ((flags & 0x4000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((unsigned char *)v5 + 104) = self->_proxyConnection;
  *((_WORD *)v5 + 54) |= 0x2000u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x4000) == 0)
  {
LABEL_15:
    if ((flags & 0x1000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_33:
  *((unsigned char *)v5 + 105) = self->_reusedConnection;
  *((_WORD *)v5 + 54) |= 0x4000u;
  if ((*(_WORD *)&self->_flags & 0x1000) != 0)
  {
LABEL_16:
    *((_DWORD *)v5 + 25) = self->_resourceFetchType;
    *((_WORD *)v5 + 54) |= 0x1000u;
  }
LABEL_17:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *((void *)result + 5) = *(void *)&self->_fetchStart;
    *((_WORD *)result + 54) |= 0x10u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 4) = *(void *)&self->_domainLookupStart;
  *((_WORD *)result + 54) |= 8u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((void *)result + 3) = *(void *)&self->_domainLookupEnd;
  *((_WORD *)result + 54) |= 4u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((void *)result + 2) = *(void *)&self->_connectStart;
  *((_WORD *)result + 54) |= 2u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x400) == 0)
  {
LABEL_6:
    if ((flags & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((void *)result + 11) = *(void *)&self->_secureConnectStart;
  *((_WORD *)result + 54) |= 0x400u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_7:
    if ((flags & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((void *)result + 10) = *(void *)&self->_secureConnectEnd;
  *((_WORD *)result + 54) |= 0x200u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_8:
    if ((flags & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((void *)result + 1) = *(void *)&self->_connectEnd;
  *((_WORD *)result + 54) |= 1u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_9:
    if ((flags & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((void *)result + 7) = *(void *)&self->_requestStart;
  *((_WORD *)result + 54) |= 0x40u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_10:
    if ((flags & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((void *)result + 6) = *(void *)&self->_requestEnd;
  *((_WORD *)result + 54) |= 0x20u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_11:
    if ((flags & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((void *)result + 9) = *(void *)&self->_responseStart;
  *((_WORD *)result + 54) |= 0x100u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_12:
    if ((flags & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((void *)result + 8) = *(void *)&self->_responseEnd;
  *((_WORD *)result + 54) |= 0x80u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x800) == 0)
  {
LABEL_13:
    if ((flags & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 24) = self->_protocolName;
  *((_WORD *)result + 54) |= 0x800u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x2000) == 0)
  {
LABEL_14:
    if ((flags & 0x4000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((unsigned char *)result + 104) = self->_proxyConnection;
  *((_WORD *)result + 54) |= 0x2000u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x4000) == 0)
  {
LABEL_15:
    if ((flags & 0x1000) == 0) {
      return result;
    }
    goto LABEL_16;
  }
LABEL_31:
  *((unsigned char *)result + 105) = self->_reusedConnection;
  *((_WORD *)result + 54) |= 0x4000u;
  if ((*(_WORD *)&self->_flags & 0x1000) == 0) {
    return result;
  }
LABEL_16:
  *((_DWORD *)result + 25) = self->_resourceFetchType;
  *((_WORD *)result + 54) |= 0x1000u;
  return result;
}

- (unint64_t)hash
{
  [(GEONetworkSessionTaskTransactionMetrics *)self readAll:1];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
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
  if ((flags & 8) != 0)
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
  if ((flags & 4) != 0)
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
  if ((flags & 2) != 0)
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
  if ((flags & 0x400) != 0)
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
  if ((flags & 0x200) != 0)
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
  if (flags)
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
  unint64_t v66 = v24;
  unint64_t v67 = v4;
  if ((flags & 0x40) != 0)
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
  unint64_t v44 = v9;
  if ((flags & 0x20) != 0)
  {
    double requestEnd = self->_requestEnd;
    double v47 = -requestEnd;
    if (requestEnd >= 0.0) {
      double v47 = self->_requestEnd;
    }
    long double v48 = floor(v47 + 0.5);
    double v49 = (v47 - v48) * 1.84467441e19;
    unint64_t v45 = 2654435761u * (unint64_t)fmod(v48, 1.84467441e19);
    if (v49 >= 0.0)
    {
      if (v49 > 0.0) {
        v45 += (unint64_t)v49;
      }
    }
    else
    {
      v45 -= (unint64_t)fabs(v49);
    }
  }
  else
  {
    unint64_t v45 = 0;
  }
  unint64_t v50 = v14;
  if ((flags & 0x100) != 0)
  {
    double responseStart = self->_responseStart;
    double v53 = -responseStart;
    if (responseStart >= 0.0) {
      double v53 = self->_responseStart;
    }
    long double v54 = floor(v53 + 0.5);
    double v55 = (v53 - v54) * 1.84467441e19;
    unint64_t v51 = 2654435761u * (unint64_t)fmod(v54, 1.84467441e19);
    if (v55 >= 0.0)
    {
      if (v55 > 0.0) {
        v51 += (unint64_t)v55;
      }
    }
    else
    {
      v51 -= (unint64_t)fabs(v55);
    }
  }
  else
  {
    unint64_t v51 = 0;
  }
  if ((flags & 0x80) != 0)
  {
    double responseEnd = self->_responseEnd;
    double v58 = -responseEnd;
    if (responseEnd >= 0.0) {
      double v58 = self->_responseEnd;
    }
    long double v59 = floor(v58 + 0.5);
    double v60 = (v58 - v59) * 1.84467441e19;
    unint64_t v56 = 2654435761u * (unint64_t)fmod(v59, 1.84467441e19);
    if (v60 >= 0.0)
    {
      if (v60 > 0.0) {
        v56 += (unint64_t)v60;
      }
    }
    else
    {
      v56 -= (unint64_t)fabs(v60);
    }
  }
  else
  {
    unint64_t v56 = 0;
  }
  if ((flags & 0x800) != 0)
  {
    uint64_t v61 = 2654435761 * self->_protocolName;
    if ((flags & 0x2000) != 0)
    {
LABEL_91:
      uint64_t v62 = 2654435761 * self->_proxyConnection;
      if ((flags & 0x4000) != 0) {
        goto LABEL_92;
      }
LABEL_96:
      uint64_t v63 = 0;
      if ((flags & 0x1000) != 0) {
        goto LABEL_93;
      }
LABEL_97:
      uint64_t v64 = 0;
      return v44 ^ v67 ^ v50 ^ v19 ^ v66 ^ v29 ^ v34 ^ v39 ^ v45 ^ v51 ^ v56 ^ v61 ^ v62 ^ v63 ^ v64;
    }
  }
  else
  {
    uint64_t v61 = 0;
    if ((flags & 0x2000) != 0) {
      goto LABEL_91;
    }
  }
  uint64_t v62 = 0;
  if ((flags & 0x4000) == 0) {
    goto LABEL_96;
  }
LABEL_92:
  uint64_t v63 = 2654435761 * self->_reusedConnection;
  if ((flags & 0x1000) == 0) {
    goto LABEL_97;
  }
LABEL_93:
  uint64_t v64 = 2654435761 * self->_resourceFetchType;
  return v44 ^ v67 ^ v50 ^ v19 ^ v66 ^ v29 ^ v34 ^ v39 ^ v45 ^ v51 ^ v56 ^ v61 ^ v62 ^ v63 ^ v64;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  __int16 v4 = *((_WORD *)v5 + 54);
  if ((v4 & 0x10) != 0)
  {
    self->_double fetchStart = *((double *)v5 + 5);
    *(_WORD *)&self->_flags |= 0x10u;
    __int16 v4 = *((_WORD *)v5 + 54);
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((v4 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_double domainLookupStart = *((double *)v5 + 4);
  *(_WORD *)&self->_flags |= 8u;
  __int16 v4 = *((_WORD *)v5 + 54);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_double domainLookupEnd = *((double *)v5 + 3);
  *(_WORD *)&self->_flags |= 4u;
  __int16 v4 = *((_WORD *)v5 + 54);
  if ((v4 & 2) == 0)
  {
LABEL_5:
    if ((v4 & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_double connectStart = *((double *)v5 + 2);
  *(_WORD *)&self->_flags |= 2u;
  __int16 v4 = *((_WORD *)v5 + 54);
  if ((v4 & 0x400) == 0)
  {
LABEL_6:
    if ((v4 & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_double secureConnectStart = *((double *)v5 + 11);
  *(_WORD *)&self->_flags |= 0x400u;
  __int16 v4 = *((_WORD *)v5 + 54);
  if ((v4 & 0x200) == 0)
  {
LABEL_7:
    if ((v4 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_double secureConnectEnd = *((double *)v5 + 10);
  *(_WORD *)&self->_flags |= 0x200u;
  __int16 v4 = *((_WORD *)v5 + 54);
  if ((v4 & 1) == 0)
  {
LABEL_8:
    if ((v4 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_double connectEnd = *((double *)v5 + 1);
  *(_WORD *)&self->_flags |= 1u;
  __int16 v4 = *((_WORD *)v5 + 54);
  if ((v4 & 0x40) == 0)
  {
LABEL_9:
    if ((v4 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_double requestStart = *((double *)v5 + 7);
  *(_WORD *)&self->_flags |= 0x40u;
  __int16 v4 = *((_WORD *)v5 + 54);
  if ((v4 & 0x20) == 0)
  {
LABEL_10:
    if ((v4 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_double requestEnd = *((double *)v5 + 6);
  *(_WORD *)&self->_flags |= 0x20u;
  __int16 v4 = *((_WORD *)v5 + 54);
  if ((v4 & 0x100) == 0)
  {
LABEL_11:
    if ((v4 & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_double responseStart = *((double *)v5 + 9);
  *(_WORD *)&self->_flags |= 0x100u;
  __int16 v4 = *((_WORD *)v5 + 54);
  if ((v4 & 0x80) == 0)
  {
LABEL_12:
    if ((v4 & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_double responseEnd = *((double *)v5 + 8);
  *(_WORD *)&self->_flags |= 0x80u;
  __int16 v4 = *((_WORD *)v5 + 54);
  if ((v4 & 0x800) == 0)
  {
LABEL_13:
    if ((v4 & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_protocolName = *((_DWORD *)v5 + 24);
  *(_WORD *)&self->_flags |= 0x800u;
  __int16 v4 = *((_WORD *)v5 + 54);
  if ((v4 & 0x2000) == 0)
  {
LABEL_14:
    if ((v4 & 0x4000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_proxyConnection = *((unsigned char *)v5 + 104);
  *(_WORD *)&self->_flags |= 0x2000u;
  __int16 v4 = *((_WORD *)v5 + 54);
  if ((v4 & 0x4000) == 0)
  {
LABEL_15:
    if ((v4 & 0x1000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_33:
  self->_reusedConnection = *((unsigned char *)v5 + 105);
  *(_WORD *)&self->_flags |= 0x4000u;
  if ((*((_WORD *)v5 + 54) & 0x1000) != 0)
  {
LABEL_16:
    self->_resourceFetchType = *((_DWORD *)v5 + 25);
    *(_WORD *)&self->_flags |= 0x1000u;
  }
LABEL_17:
}

@end