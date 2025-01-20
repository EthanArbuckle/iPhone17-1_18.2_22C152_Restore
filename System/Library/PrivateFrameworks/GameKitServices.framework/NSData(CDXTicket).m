@interface NSData(CDXTicket)
- (BOOL)CDXTicketIsRelatedToTicket:()CDXTicket;
- (BOOL)CDXTicketWellFormed;
- (uint64_t)CDXTicketExpirationDate;
- (uint64_t)CDXTicketIsHolePunch;
- (uint64_t)CDXTicketIsReflected;
- (uint64_t)CDXTicketIsStub;
- (uint64_t)CDXTicketPCNT;
- (uint64_t)CDXTicketPID;
- (uint64_t)CDXTicketRevision;
- (uint64_t)CDXTicketTrimmed;
- (unint64_t)CDXTicketSID;
@end

@implementation NSData(CDXTicket)

- (uint64_t)CDXTicketPID
{
  return *(unsigned __int8 *)([a1 bytes] + 2);
}

- (uint64_t)CDXTicketPCNT
{
  return *(unsigned __int8 *)([a1 bytes] + 1);
}

- (uint64_t)CDXTicketExpirationDate
{
  v1 = (void *)MEMORY[0x263EFF910];
  LODWORD(v2) = *(_DWORD *)([a1 bytes] + 12);
  double v3 = (double)v2;
  return [v1 dateWithTimeIntervalSince1970:v3];
}

- (uint64_t)CDXTicketRevision
{
  return bswap32(*(unsigned __int16 *)([a1 bytes] + 10)) >> 16;
}

- (unint64_t)CDXTicketSID
{
  uint64_t v1 = [a1 bytes];
  return *(unsigned int *)(v1 + 4) | ((unint64_t)*(unsigned __int16 *)(v1 + 8) << 32);
}

- (uint64_t)CDXTicketIsReflected
{
  return *(unsigned char *)[a1 bytes] & 1;
}

- (uint64_t)CDXTicketIsHolePunch
{
  return (*(unsigned __int8 *)[a1 bytes] >> 3) & 1;
}

- (uint64_t)CDXTicketIsStub
{
  uint64_t result = [a1 CDXTicketIsReflected];
  if (result) {
    return [a1 CDXTicketIsHolePunch] ^ 1;
  }
  return result;
}

- (uint64_t)CDXTicketTrimmed
{
  unint64_t v2 = (unsigned char *)[a1 bytes];
  if ((*v2 & 9) != 0) {
    uint64_t v3 = 16;
  }
  else {
    uint64_t v3 = 16 * v2[3] + 32;
  }
  return objc_msgSend(a1, "subdataWithRange:", 0, v3);
}

- (BOOL)CDXTicketWellFormed
{
  uint64_t v2 = [a1 bytes];
  if ((unint64_t)[a1 length] < 0x10) {
    return 0;
  }
  if ((*(unsigned char *)v2 & 9) == 0)
  {
    unint64_t v3 = 16 * *(unsigned __int8 *)(v2 + 3) + 32;
    if ((*(unsigned char *)v2 & 8) == 0) {
      goto LABEL_4;
    }
LABEL_9:
    if (*(unsigned char *)(v2 + 2) || *(unsigned char *)(v2 + 3) || *(unsigned char *)(v2 + 1) || *(_DWORD *)(v2 + 12)) {
      return 0;
    }
    return [a1 length] >= v3;
  }
  unint64_t v3 = 16;
  if ((*(unsigned char *)v2 & 8) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if (*(unsigned char *)(v2 + 3)
    && *(unsigned char *)(v2 + 1)
    && *(unsigned __int8 *)(v2 + 2) < *(unsigned __int8 *)(v2 + 1))
  {
    return [a1 length] >= v3;
  }
  return 0;
}

- (BOOL)CDXTicketIsRelatedToTicket:()CDXTicket
{
  uint64_t v5 = [a1 bytes];
  uint64_t v6 = [a3 bytes];
  if (*(_DWORD *)(v5 + 4) != *(_DWORD *)(v6 + 4) || *(unsigned __int16 *)(v5 + 8) != *(unsigned __int16 *)(v6 + 8)) {
    return 0;
  }
  uint64_t v9 = [a1 CDXTicketRevision];
  return (unint64_t)(v9 - [a3 CDXTicketRevision]) < 8;
}

@end