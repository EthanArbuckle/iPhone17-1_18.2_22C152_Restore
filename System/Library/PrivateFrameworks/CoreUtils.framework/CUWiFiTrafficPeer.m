@interface CUWiFiTrafficPeer
- ($9D4F243E34B80324A1B90A38B57CFE16)peerIP;
- (BOOL)active;
- (NSData)peerMACData;
- (NSString)sessionID;
- (id)peerMACAddressData;
- (unsigned)trafficFlags;
- (void)setActive:(BOOL)a3;
- (void)setPeerIP:(id *)a3;
- (void)setPeerMACData:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setTrafficFlags:(unsigned int)a3;
@end

@implementation CUWiFiTrafficPeer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_peerMACData, 0);
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setTrafficFlags:(unsigned int)a3
{
  self->_trafficFlags = a3;
}

- (unsigned)trafficFlags
{
  return self->_trafficFlags;
}

- (void)setSessionID:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setPeerMACData:(id)a3
{
}

- (NSData)peerMACData
{
  return self->_peerMACData;
}

- (void)setPeerIP:(id *)a3
{
  sockaddr var0 = a3->var0;
  *(in6_addr *)((char *)&self->_peerIP.v6.sin6_addr + 4) = *(in6_addr *)((char *)&a3->var2.sin6_addr + 4);
  self->_peerIP.sa = var0;
}

- ($9D4F243E34B80324A1B90A38B57CFE16)peerIP
{
  retstr->sockaddr var0 = *(sockaddr *)&self[1].var2.sin6_flowinfo;
  *(in6_addr *)((char *)&retstr->var2.sin6_addr + 4) = *(in6_addr *)((char *)&self[1].var2.sin6_addr + 8);
  return self;
}

- (id)peerMACAddressData
{
  if ([(NSData *)self->_peerMACData length] == 6)
  {
    v3 = self->_peerMACData;
    goto LABEL_12;
  }
  if (self->_peerIP.sa.sa_family != 30) {
    goto LABEL_11;
  }
  int v4 = self->_peerIP.v6.sin6_addr.__u6_addr8[0];
  if (v4 == 254)
  {
    if ((self->_peerIP.sa.sa_data[7] & 0xC0) != 0x80) {
      goto LABEL_11;
    }
  }
  else if ((v4 & 0xFE) != 0xFC)
  {
    goto LABEL_11;
  }
  __uint32_t sin6_scope_id = self->_peerIP.v6.sin6_scope_id;
  if (sin6_scope_id && sin6_scope_id == if_nametoindex("awdl0"))
  {
    char v7 = self->_peerIP.v6.sin6_addr.__u6_addr8[8] ^ 2;
    __int16 v8 = *(__uint16_t *)((char *)&self->_peerIP.v6.sin6_addr.__u6_addr16[4] + 1);
    __uint8_t v9 = self->_peerIP.v6.sin6_addr.__u6_addr8[13];
    __uint16_t v10 = self->_peerIP.v6.sin6_addr.__u6_addr16[7];
    v3 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v7 length:6];
    goto LABEL_12;
  }
LABEL_11:
  v3 = 0;
LABEL_12:
  return v3;
}

@end