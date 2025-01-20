@interface NWPBParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)writeTo:(id)a3;
@end

@implementation NWPBParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_requiredInterface, 0);
  objc_storeStrong((id *)&self->_requiredAgents, 0);
  objc_storeStrong((id *)&self->_realProcessUUID, 0);
  objc_storeStrong((id *)&self->_prohibitedInterfaces, 0);
  objc_storeStrong((id *)&self->_prohibitedAgents, 0);
  objc_storeStrong((id *)&self->_preferredAgents, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_localEndpoint, 0);
  objc_storeStrong((id *)&self->_effectiveProcessUUID, 0);
  objc_storeStrong((id *)&self->_effectiveBundleID, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_account hash];
  NSUInteger v4 = [(NSString *)self->_effectiveBundleID hash];
  NSUInteger v5 = [(NSString *)self->_effectiveProcessUUID hash];
  NSUInteger v6 = [(NSString *)self->_realProcessUUID hash];
  NSUInteger v7 = [(NSString *)self->_url hash];
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t v9 = 2654435761 * self->_ipProtocol;
    if (has)
    {
LABEL_3:
      uint64_t v10 = 2654435761 * self->_addressFamily;
      if ((has & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if (has) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_4:
    uint64_t v11 = 2654435761 * self->_trafficClass;
    if ((has & 2) != 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v11 = 0;
  if ((has & 2) != 0)
  {
LABEL_5:
    uint64_t v12 = 2654435761 * self->_dataMode;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v12 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v13 = 2654435761 * self->_requiredInterfaceType;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v13 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_7:
    uint64_t v14 = 2654435761 * self->_prohibitExpensive;
    if ((has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v14 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v15 = 2654435761 * self->_fastOpen;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v15 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_9:
    uint64_t v16 = 2654435761 * self->_reduceBuffering;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v16 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    uint64_t v17 = 2654435761 * self->_longOutstandingQueries;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v17 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_11:
    uint64_t v18 = 2654435761 * self->_useAWDL;
    if ((*(_WORD *)&self->_has & 0x4000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v18 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_12:
    uint64_t v19 = 2654435761 * self->_useP2P;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v19 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_13:
    uint64_t v20 = 2654435761 * self->_reuseLocalAddress;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v20 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_14:
    uint64_t v21 = 2654435761 * self->_noFallback;
    if ((has & 8) != 0) {
      goto LABEL_15;
    }
LABEL_30:
    uint64_t v22 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_16;
    }
LABEL_31:
    uint64_t v23 = 0;
    goto LABEL_32;
  }
LABEL_29:
  uint64_t v21 = 0;
  if ((has & 8) == 0) {
    goto LABEL_30;
  }
LABEL_15:
  uint64_t v22 = 2654435761 * self->_multipathService;
  if ((has & 0x80) == 0) {
    goto LABEL_31;
  }
LABEL_16:
  uint64_t v23 = 2654435761 * self->_keepalive;
LABEL_32:
  NSUInteger v24 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10;
  unint64_t v25 = v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ [(NWPBEndpoint *)self->_localEndpoint hash];
  unint64_t v26 = v24 ^ v25 ^ [(NWPBInterface *)self->_requiredInterface hash];
  uint64_t v27 = PBRepeatedInt32Hash();
  uint64_t v28 = v27 ^ PBRepeatedInt32Hash();
  uint64_t v29 = v28 ^ [(NSMutableArray *)self->_prohibitedInterfaces hash];
  uint64_t v30 = v29 ^ [(NSMutableArray *)self->_prohibitedAgents hash];
  uint64_t v31 = v30 ^ [(NSMutableArray *)self->_requiredAgents hash];
  uint64_t v32 = v26 ^ v31 ^ [(NSMutableArray *)self->_preferredAgents hash];
  return v32 ^ [(NSData *)self->_metadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_130;
  }
  account = self->_account;
  if ((unint64_t)account | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](account, "isEqual:")) {
      goto LABEL_130;
    }
  }
  effectiveBundleID = self->_effectiveBundleID;
  if ((unint64_t)effectiveBundleID | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](effectiveBundleID, "isEqual:")) {
      goto LABEL_130;
    }
  }
  effectiveProcessUUID = self->_effectiveProcessUUID;
  if ((unint64_t)effectiveProcessUUID | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](effectiveProcessUUID, "isEqual:")) {
      goto LABEL_130;
    }
  }
  realProcessUUID = self->_realProcessUUID;
  if ((unint64_t)realProcessUUID | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](realProcessUUID, "isEqual:")) {
      goto LABEL_130;
    }
  }
  url = self->_url;
  if ((unint64_t)url | *((void *)v4 + 22))
  {
    if (!-[NSString isEqual:](url, "isEqual:")) {
      goto LABEL_130;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v11 = *((_WORD *)v4 + 98);
  if ((has & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_ipProtocol != *((_DWORD *)v4 + 22)) {
      goto LABEL_130;
    }
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_130;
  }
  if (has)
  {
    if ((v11 & 1) == 0 || self->_addressFamily != *((_DWORD *)v4 + 16)) {
      goto LABEL_130;
    }
  }
  else if (v11)
  {
    goto LABEL_130;
  }
  if ((has & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0 || self->_trafficClass != *((_DWORD *)v4 + 43)) {
      goto LABEL_130;
    }
  }
  else if ((v11 & 0x20) != 0)
  {
    goto LABEL_130;
  }
  if ((has & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_dataMode != *((_DWORD *)v4 + 17)) {
      goto LABEL_130;
    }
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_130;
  }
  if ((has & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_requiredInterfaceType != *((_DWORD *)v4 + 42)) {
      goto LABEL_130;
    }
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x400) == 0) {
      goto LABEL_130;
    }
    if (self->_prohibitExpensive)
    {
      if (!*((unsigned char *)v4 + 188)) {
        goto LABEL_130;
      }
    }
    else if (*((unsigned char *)v4 + 188))
    {
      goto LABEL_130;
    }
  }
  else if ((*((_WORD *)v4 + 98) & 0x400) != 0)
  {
    goto LABEL_130;
  }
  if ((has & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0) {
      goto LABEL_130;
    }
    if (self->_fastOpen)
    {
      if (!*((unsigned char *)v4 + 184)) {
        goto LABEL_130;
      }
    }
    else if (*((unsigned char *)v4 + 184))
    {
      goto LABEL_130;
    }
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x800) == 0) {
      goto LABEL_130;
    }
    if (self->_reduceBuffering)
    {
      if (!*((unsigned char *)v4 + 189)) {
        goto LABEL_130;
      }
    }
    else if (*((unsigned char *)v4 + 189))
    {
      goto LABEL_130;
    }
  }
  else if ((*((_WORD *)v4 + 98) & 0x800) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x100) == 0) {
      goto LABEL_130;
    }
    if (self->_longOutstandingQueries)
    {
      if (!*((unsigned char *)v4 + 186)) {
        goto LABEL_130;
      }
    }
    else if (*((unsigned char *)v4 + 186))
    {
      goto LABEL_130;
    }
  }
  else if ((*((_WORD *)v4 + 98) & 0x100) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x2000) == 0) {
      goto LABEL_130;
    }
    if (self->_useAWDL)
    {
      if (!*((unsigned char *)v4 + 191)) {
        goto LABEL_130;
      }
    }
    else if (*((unsigned char *)v4 + 191))
    {
      goto LABEL_130;
    }
  }
  else if ((*((_WORD *)v4 + 98) & 0x2000) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x4000) == 0) {
      goto LABEL_130;
    }
    if (self->_useP2P)
    {
      if (!*((unsigned char *)v4 + 192)) {
        goto LABEL_130;
      }
    }
    else if (*((unsigned char *)v4 + 192))
    {
      goto LABEL_130;
    }
  }
  else if ((*((_WORD *)v4 + 98) & 0x4000) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x1000) == 0) {
      goto LABEL_130;
    }
    if (self->_reuseLocalAddress)
    {
      if (!*((unsigned char *)v4 + 190)) {
        goto LABEL_130;
      }
    }
    else if (*((unsigned char *)v4 + 190))
    {
      goto LABEL_130;
    }
  }
  else if ((*((_WORD *)v4 + 98) & 0x1000) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x200) == 0) {
      goto LABEL_130;
    }
    if (self->_noFallback)
    {
      if (!*((unsigned char *)v4 + 187)) {
        goto LABEL_130;
      }
    }
    else if (*((unsigned char *)v4 + 187))
    {
      goto LABEL_130;
    }
  }
  else if ((*((_WORD *)v4 + 98) & 0x200) != 0)
  {
    goto LABEL_130;
  }
  if ((has & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_multipathService != *((_DWORD *)v4 + 28)) {
      goto LABEL_130;
    }
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_130;
  }
  if ((has & 0x80) == 0)
  {
    if ((v11 & 0x80) == 0) {
      goto LABEL_114;
    }
LABEL_130:
    char v19 = 0;
    goto LABEL_131;
  }
  if ((v11 & 0x80) == 0) {
    goto LABEL_130;
  }
  if (!self->_keepalive)
  {
    if (!*((unsigned char *)v4 + 185)) {
      goto LABEL_114;
    }
    goto LABEL_130;
  }
  if (!*((unsigned char *)v4 + 185)) {
    goto LABEL_130;
  }
LABEL_114:
  localEndpoint = self->_localEndpoint;
  if ((unint64_t)localEndpoint | *((void *)v4 + 12) && !-[NWPBEndpoint isEqual:](localEndpoint, "isEqual:")) {
    goto LABEL_130;
  }
  requiredInterface = self->_requiredInterface;
  if ((unint64_t)requiredInterface | *((void *)v4 + 20))
  {
    if (!-[NWPBInterface isEqual:](requiredInterface, "isEqual:")) {
      goto LABEL_130;
    }
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_130;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_130;
  }
  prohibitedInterfaces = self->_prohibitedInterfaces;
  if ((unint64_t)prohibitedInterfaces | *((void *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](prohibitedInterfaces, "isEqual:")) {
      goto LABEL_130;
    }
  }
  prohibitedAgents = self->_prohibitedAgents;
  if ((unint64_t)prohibitedAgents | *((void *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](prohibitedAgents, "isEqual:")) {
      goto LABEL_130;
    }
  }
  requiredAgents = self->_requiredAgents;
  if ((unint64_t)requiredAgents | *((void *)v4 + 19))
  {
    if (!-[NSMutableArray isEqual:](requiredAgents, "isEqual:")) {
      goto LABEL_130;
    }
  }
  preferredAgents = self->_preferredAgents;
  if ((unint64_t)preferredAgents | *((void *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](preferredAgents, "isEqual:")) {
      goto LABEL_130;
    }
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((void *)v4 + 13)) {
    char v19 = -[NSData isEqual:](metadata, "isEqual:");
  }
  else {
    char v19 = 1;
  }
LABEL_131:

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_account copyWithZone:a3];
  NSUInteger v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  uint64_t v8 = [(NSString *)self->_effectiveBundleID copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v8;

  uint64_t v10 = [(NSString *)self->_effectiveProcessUUID copyWithZone:a3];
  __int16 v11 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v10;

  uint64_t v12 = [(NSString *)self->_realProcessUUID copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v12;

  uint64_t v14 = [(NSString *)self->_url copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v14;

  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_ipProtocol;
    *(_WORD *)(v5 + 196) |= 4u;
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_56;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 64) = self->_addressFamily;
  *(_WORD *)(v5 + 196) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_57;
  }
LABEL_56:
  *(_DWORD *)(v5 + 172) = self->_trafficClass;
  *(_WORD *)(v5 + 196) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_58;
  }
LABEL_57:
  *(_DWORD *)(v5 + 68) = self->_dataMode;
  *(_WORD *)(v5 + 196) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_59;
  }
LABEL_58:
  *(_DWORD *)(v5 + 168) = self->_requiredInterfaceType;
  *(_WORD *)(v5 + 196) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_60;
  }
LABEL_59:
  *(unsigned char *)(v5 + 188) = self->_prohibitExpensive;
  *(_WORD *)(v5 + 196) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_61;
  }
LABEL_60:
  *(unsigned char *)(v5 + 184) = self->_fastOpen;
  *(_WORD *)(v5 + 196) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_62;
  }
LABEL_61:
  *(unsigned char *)(v5 + 189) = self->_reduceBuffering;
  *(_WORD *)(v5 + 196) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x2000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_63;
  }
LABEL_62:
  *(unsigned char *)(v5 + 186) = self->_longOutstandingQueries;
  *(_WORD *)(v5 + 196) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_11:
    if ((has & 0x4000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_64;
  }
LABEL_63:
  *(unsigned char *)(v5 + 191) = self->_useAWDL;
  *(_WORD *)(v5 + 196) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_12:
    if ((has & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_65;
  }
LABEL_64:
  *(unsigned char *)(v5 + 192) = self->_useP2P;
  *(_WORD *)(v5 + 196) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_13:
    if ((has & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_66;
  }
LABEL_65:
  *(unsigned char *)(v5 + 190) = self->_reuseLocalAddress;
  *(_WORD *)(v5 + 196) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_14:
    if ((has & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_67;
  }
LABEL_66:
  *(unsigned char *)(v5 + 187) = self->_noFallback;
  *(_WORD *)(v5 + 196) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_15:
    if ((has & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_67:
  *(_DWORD *)(v5 + 112) = self->_multipathService;
  *(_WORD *)(v5 + 196) |= 8u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_16:
    *(unsigned char *)(v5 + 185) = self->_keepalive;
    *(_WORD *)(v5 + 196) |= 0x80u;
  }
LABEL_17:
  id v17 = [(NWPBEndpoint *)self->_localEndpoint copyWithZone:a3];
  uint64_t v18 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v17;

  id v19 = [(NWPBInterface *)self->_requiredInterface copyWithZone:a3];
  uint64_t v20 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v19;

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  uint64_t v21 = self->_prohibitedInterfaces;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v73 objects:v80 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v74 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = (id)[*(id *)(*((void *)&v73 + 1) + 8 * i) copyWithZone:a3];
        uint64_t v27 = *(void **)(v5 + 136);
        if (!v27)
        {
          id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          uint64_t v29 = *(void **)(v5 + 136);
          *(void *)(v5 + 136) = v28;

          uint64_t v27 = *(void **)(v5 + 136);
        }
        [v27 addObject:v26];
      }
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v73 objects:v80 count:16];
    }
    while (v23);
  }

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  uint64_t v30 = self->_prohibitedAgents;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v69 objects:v79 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v70;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v70 != v33) {
          objc_enumerationMutation(v30);
        }
        id v35 = (id)[*(id *)(*((void *)&v69 + 1) + 8 * j) copyWithZone:a3];
        v36 = *(void **)(v5 + 128);
        if (!v36)
        {
          id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v38 = *(void **)(v5 + 128);
          *(void *)(v5 + 128) = v37;

          v36 = *(void **)(v5 + 128);
        }
        [v36 addObject:v35];
      }
      uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v69 objects:v79 count:16];
    }
    while (v32);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v39 = self->_requiredAgents;
  uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v65 objects:v78 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v66;
    do
    {
      for (uint64_t k = 0; k != v41; ++k)
      {
        if (*(void *)v66 != v42) {
          objc_enumerationMutation(v39);
        }
        id v44 = (id)[*(id *)(*((void *)&v65 + 1) + 8 * k) copyWithZone:a3];
        v45 = *(void **)(v5 + 152);
        if (!v45)
        {
          id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v47 = *(void **)(v5 + 152);
          *(void *)(v5 + 152) = v46;

          v45 = *(void **)(v5 + 152);
        }
        [v45 addObject:v44];
      }
      uint64_t v41 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v65 objects:v78 count:16];
    }
    while (v41);
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v48 = self->_preferredAgents;
  uint64_t v49 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v61 objects:v77 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v62;
    if (v5)
    {
      do
      {
        for (uint64_t m = 0; m != v50; ++m)
        {
          if (*(void *)v62 != v51) {
            objc_enumerationMutation(v48);
          }
          id v53 = (id)objc_msgSend(*(id *)(*((void *)&v61 + 1) + 8 * m), "copyWithZone:", a3, (void)v61);
          v54 = *(void **)(v5 + 120);
          if (!v54)
          {
            id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            v56 = *(void **)(v5 + 120);
            *(void *)(v5 + 120) = v55;

            v54 = *(void **)(v5 + 120);
          }
          [v54 addObject:v53];
        }
        uint64_t v50 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v61 objects:v77 count:16];
      }
      while (v50);
    }
    else
    {
      do
      {
        for (uint64_t n = 0; n != v50; ++n)
        {
          if (*(void *)v62 != v51) {
            objc_enumerationMutation(v48);
          }
        }
        uint64_t v50 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v61 objects:v77 count:16];
      }
      while (v50);
    }
  }

  uint64_t v58 = [(NSData *)self->_metadata copyWithZone:a3];
  v59 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v58;

  return (id)v5;
}

- (void)writeTo:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_account) {
    PBDataWriterWriteStringField();
  }
  if (self->_effectiveBundleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_effectiveProcessUUID) {
    PBDataWriterWriteStringField();
  }
  if (self->_realProcessUUID) {
    PBDataWriterWriteStringField();
  }
  if (self->_url) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_13:
      if ((has & 0x20) == 0) {
        goto LABEL_14;
      }
      goto LABEL_70;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_14:
    if ((has & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_16:
    if ((has & 0x400) == 0) {
      goto LABEL_17;
    }
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_17:
    if ((has & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_18:
    if ((has & 0x800) == 0) {
      goto LABEL_19;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_19:
    if ((has & 0x100) == 0) {
      goto LABEL_20;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_20:
    if ((has & 0x2000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_21:
    if ((has & 0x4000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_22:
    if ((has & 0x1000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_23:
    if ((has & 0x200) == 0) {
      goto LABEL_24;
    }
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_24:
    if ((has & 8) == 0) {
      goto LABEL_25;
    }
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_25:
    if ((has & 0x80) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_81:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
LABEL_26:
  }
    PBDataWriterWriteBOOLField();
LABEL_27:
  if (self->_localEndpoint) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_requiredInterface) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_prohibitedInterfaceTypes.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v6;
    }
    while (v6 < self->_prohibitedInterfaceTypes.count);
  }
  if (self->_prohibitedInterfaceSubTypes.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v7;
    }
    while (v7 < self->_prohibitedInterfaceSubTypes.count);
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v8 = self->_prohibitedInterfaces;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v10);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v13 = self->_prohibitedAgents;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v36 objects:v46 count:16];
    }
    while (v15);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v18 = self->_requiredAgents;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v32 objects:v45 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v33;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(v18);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v32 objects:v45 count:16];
    }
    while (v20);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v23 = self->_preferredAgents;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v28 objects:v44 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v29;
    do
    {
      for (uint64_t m = 0; m != v25; ++m)
      {
        if (*(void *)v29 != v26) {
          objc_enumerationMutation(v23);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v28 objects:v44 count:16];
    }
    while (v25);
  }

  if (self->_metadata) {
    PBDataWriterWriteDataField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NWPBParametersReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  account = self->_account;
  if (account) {
    [v3 setObject:account forKey:@"account"];
  }
  effectiveBundleID = self->_effectiveBundleID;
  if (effectiveBundleID) {
    [v4 setObject:effectiveBundleID forKey:@"effectiveBundleID"];
  }
  effectiveProcessUUID = self->_effectiveProcessUUID;
  if (effectiveProcessUUID) {
    [v4 setObject:effectiveProcessUUID forKey:@"effectiveProcessUUID"];
  }
  realProcessUUID = self->_realProcessUUID;
  if (realProcessUUID) {
    [v4 setObject:realProcessUUID forKey:@"realProcessUUID"];
  }
  url = self->_url;
  if (url) {
    [v4 setObject:url forKey:@"url"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    v57 = [NSNumber numberWithUnsignedInt:self->_ipProtocol];
    [v4 setObject:v57 forKey:@"ipProtocol"];

    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_13:
      if ((has & 0x20) == 0) {
        goto LABEL_14;
      }
      goto LABEL_88;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_13;
  }
  uint64_t v58 = [NSNumber numberWithUnsignedInt:self->_addressFamily];
  [v4 setObject:v58 forKey:@"addressFamily"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_14:
    if ((has & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_89;
  }
LABEL_88:
  v59 = [NSNumber numberWithUnsignedInt:self->_trafficClass];
  [v4 setObject:v59 forKey:@"trafficClass"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_93;
  }
LABEL_89:
  uint64_t dataMode = self->_dataMode;
  if (dataMode >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_dataMode);
    long long v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    long long v61 = off_1E5240888[dataMode];
  }
  [v4 setObject:v61 forKey:@"dataMode"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_16:
    if ((has & 0x400) == 0) {
      goto LABEL_17;
    }
    goto LABEL_97;
  }
LABEL_93:
  uint64_t requiredInterfaceType = self->_requiredInterfaceType;
  if (requiredInterfaceType >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_requiredInterfaceType);
    long long v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    long long v63 = off_1E52408A0[requiredInterfaceType];
  }
  [v4 setObject:v63 forKey:@"requiredInterfaceType"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_17:
    if ((has & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_98;
  }
LABEL_97:
  long long v64 = [NSNumber numberWithBool:self->_prohibitExpensive];
  [v4 setObject:v64 forKey:@"prohibitExpensive"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_18:
    if ((has & 0x800) == 0) {
      goto LABEL_19;
    }
    goto LABEL_99;
  }
LABEL_98:
  long long v65 = [NSNumber numberWithBool:self->_fastOpen];
  [v4 setObject:v65 forKey:@"fastOpen"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_19:
    if ((has & 0x100) == 0) {
      goto LABEL_20;
    }
    goto LABEL_100;
  }
LABEL_99:
  long long v66 = [NSNumber numberWithBool:self->_reduceBuffering];
  [v4 setObject:v66 forKey:@"reduceBuffering"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_20:
    if ((has & 0x2000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_101;
  }
LABEL_100:
  long long v67 = [NSNumber numberWithBool:self->_longOutstandingQueries];
  [v4 setObject:v67 forKey:@"longOutstandingQueries"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_21:
    if ((has & 0x4000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_102;
  }
LABEL_101:
  long long v68 = [NSNumber numberWithBool:self->_useAWDL];
  [v4 setObject:v68 forKey:@"useAWDL"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_22:
    if ((has & 0x1000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_103;
  }
LABEL_102:
  long long v69 = [NSNumber numberWithBool:self->_useP2P];
  [v4 setObject:v69 forKey:@"useP2P"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_23:
    if ((has & 0x200) == 0) {
      goto LABEL_24;
    }
    goto LABEL_104;
  }
LABEL_103:
  long long v70 = [NSNumber numberWithBool:self->_reuseLocalAddress];
  [v4 setObject:v70 forKey:@"reuseLocalAddress"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_24:
    if ((has & 8) == 0) {
      goto LABEL_25;
    }
    goto LABEL_105;
  }
LABEL_104:
  long long v71 = [NSNumber numberWithBool:self->_noFallback];
  [v4 setObject:v71 forKey:@"noFallback"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_25:
    if ((has & 0x80) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_105:
  long long v72 = [NSNumber numberWithUnsignedInt:self->_multipathService];
  [v4 setObject:v72 forKey:@"multipathService"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_26:
    uint64_t v11 = [NSNumber numberWithBool:self->_keepalive];
    [v4 setObject:v11 forKey:@"keepalive"];
  }
LABEL_27:
  localEndpoint = self->_localEndpoint;
  if (localEndpoint)
  {
    uint64_t v13 = [(NWPBEndpoint *)localEndpoint dictionaryRepresentation];
    [v4 setObject:v13 forKey:@"localEndpoint"];
  }
  requiredInterface = self->_requiredInterface;
  if (requiredInterface)
  {
    uint64_t v15 = [(NWPBInterface *)requiredInterface dictionaryRepresentation];
    [v4 setObject:v15 forKey:@"requiredInterface"];
  }
  p_prohibitedInterfaceTypes = &self->_prohibitedInterfaceTypes;
  if (self->_prohibitedInterfaceTypes.count)
  {
    id v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    if (self->_prohibitedInterfaceTypes.count)
    {
      unint64_t v18 = 0;
      do
      {
        uint64_t v20 = p_prohibitedInterfaceTypes->list[v18];
        if (v20 < 5)
        {
          uint64_t v19 = off_1E52408A0[v20];
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", p_prohibitedInterfaceTypes->list[v18]);
          uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        [v17 addObject:v19];

        ++v18;
      }
      while (v18 < self->_prohibitedInterfaceTypes.count);
    }
    [v4 setObject:v17 forKey:@"prohibitedInterfaceTypes"];
  }
  p_prohibitedInterfaceSubTypes = &self->_prohibitedInterfaceSubTypes;
  if (self->_prohibitedInterfaceSubTypes.count)
  {
    uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    if (self->_prohibitedInterfaceSubTypes.count)
    {
      unint64_t v23 = 0;
      do
      {
        uint64_t v25 = p_prohibitedInterfaceSubTypes->list[v23];
        if (v25 < 3)
        {
          uint64_t v24 = off_1E52408C8[v25];
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", p_prohibitedInterfaceSubTypes->list[v23]);
          uint64_t v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        [v22 addObject:v24];

        ++v23;
      }
      while (v23 < self->_prohibitedInterfaceSubTypes.count);
    }
    [v4 setObject:v22 forKey:@"prohibitedInterfaceSubTypes"];
  }
  if ([(NSMutableArray *)self->_prohibitedInterfaces count])
  {
    uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_prohibitedInterfaces, "count"));
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    uint64_t v27 = self->_prohibitedInterfaces;
    uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v85 objects:v92 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v86;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v86 != v30) {
            objc_enumerationMutation(v27);
          }
          long long v32 = [*(id *)(*((void *)&v85 + 1) + 8 * i) dictionaryRepresentation];
          [v26 addObject:v32];
        }
        uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v85 objects:v92 count:16];
      }
      while (v29);
    }

    [v4 setObject:v26 forKey:@"prohibitedInterfaces"];
  }
  if ([(NSMutableArray *)self->_prohibitedAgents count])
  {
    long long v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_prohibitedAgents, "count"));
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v34 = self->_prohibitedAgents;
    uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v81 objects:v91 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v82;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v82 != v37) {
            objc_enumerationMutation(v34);
          }
          long long v39 = [*(id *)(*((void *)&v81 + 1) + 8 * j) dictionaryRepresentation];
          [v33 addObject:v39];
        }
        uint64_t v36 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v81 objects:v91 count:16];
      }
      while (v36);
    }

    [v4 setObject:v33 forKey:@"prohibitedAgents"];
  }
  if ([(NSMutableArray *)self->_requiredAgents count])
  {
    long long v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_requiredAgents, "count"));
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v41 = self->_requiredAgents;
    uint64_t v42 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v77 objects:v90 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v78;
      do
      {
        for (uint64_t k = 0; k != v43; ++k)
        {
          if (*(void *)v78 != v44) {
            objc_enumerationMutation(v41);
          }
          id v46 = [*(id *)(*((void *)&v77 + 1) + 8 * k) dictionaryRepresentation];
          [v40 addObject:v46];
        }
        uint64_t v43 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v77 objects:v90 count:16];
      }
      while (v43);
    }

    [v4 setObject:v40 forKey:@"requiredAgents"];
  }
  if ([(NSMutableArray *)self->_preferredAgents count])
  {
    v47 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_preferredAgents, "count"));
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    uint64_t v48 = self->_preferredAgents;
    uint64_t v49 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v73 objects:v89 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v74;
      do
      {
        for (uint64_t m = 0; m != v50; ++m)
        {
          if (*(void *)v74 != v51) {
            objc_enumerationMutation(v48);
          }
          id v53 = [*(id *)(*((void *)&v73 + 1) + 8 * m) dictionaryRepresentation];
          [v47 addObject:v53];
        }
        uint64_t v50 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v73 objects:v89 count:16];
      }
      while (v50);
    }

    [v4 setObject:v47 forKey:@"preferredAgents"];
  }
  metadata = self->_metadata;
  if (metadata) {
    [v4 setObject:metadata forKey:@"metadata"];
  }
  id v55 = v4;

  return v55;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NWPBParameters;
  id v4 = [(NWPBParameters *)&v8 description];
  uint64_t v5 = [(NWPBParameters *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)NWPBParameters;
  [(NWPBParameters *)&v3 dealloc];
}

@end