@interface UARPStats
- (UARPStats)initWithStatistics:(UARPStatistics *)a3;
- (unsigned)packetsDuplicate;
- (unsigned)packetsMissed;
- (unsigned)packetsNoVersionAgreement;
- (unsigned)packetsOutOfOrder;
@end

@implementation UARPStats

- (UARPStats)initWithStatistics:(UARPStatistics *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UARPStats;
  result = [(UARPStats *)&v5 init];
  if (result)
  {
    result->_packetsNoVersionAgreement = a3->var0;
    result->_packetsMissed = a3->var1;
    result->_packetsDuplicate = a3->var2;
    result->_packetsOutOfOrder = a3->var3;
  }
  return result;
}

- (unsigned)packetsNoVersionAgreement
{
  return self->_packetsNoVersionAgreement;
}

- (unsigned)packetsMissed
{
  return self->_packetsMissed;
}

- (unsigned)packetsDuplicate
{
  return self->_packetsDuplicate;
}

- (unsigned)packetsOutOfOrder
{
  return self->_packetsOutOfOrder;
}

@end