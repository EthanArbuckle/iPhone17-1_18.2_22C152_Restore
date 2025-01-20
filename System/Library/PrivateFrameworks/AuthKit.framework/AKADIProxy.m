@interface AKADIProxy
+ (int)destroyProvisioningSession:(unsigned int)a3;
+ (int)dispose:(void *)a3;
+ (int)endProvisioningWithSession:(unsigned int)a3 PTM:(const char *)a4 PTMLength:(unsigned int)a5 TK:(const char *)a6 TKLength:(unsigned int)a7;
+ (int)eraseProvisioningForDSID:(unint64_t)a3;
+ (int)getIDMSRoutingInfo:(unint64_t *)a3 forDSID:(unint64_t)a4;
+ (int)isMachineProvisioned:(unint64_t)a3;
+ (int)requestOTPForDSID:(unint64_t)a3 outMID:(char *)a4 outMIDSize:(unsigned int *)a5 outOTP:(char *)a6 outOTPSize:(unsigned int *)a7;
+ (int)setIDMSRoutingInfo:(unint64_t)a3 forDSID:(unint64_t)a4;
+ (int)startProvisioningWithDSID:(unint64_t)a3 SPIM:(const char *)a4 SPIMLength:(unsigned int)a5 outCPIM:(char *)a6 outCPIMLength:(unsigned int *)a7 outSession:(unsigned int *)a8;
+ (int)synchronizeWithDSID:(unint64_t)a3 SIM:(const char *)a4 SIMLength:(unsigned int)a5 outMID:(char *)a6 outMIDLength:(unsigned int *)a7 outSRM:(char *)a8 outSRMLength:(unsigned int *)a9;
@end

@implementation AKADIProxy

+ (int)getIDMSRoutingInfo:(unint64_t *)a3 forDSID:(unint64_t)a4
{
  return sub_1000069E0(a4, (uint64_t)a3);
}

+ (int)dispose:(void *)a3
{
  sub_10000AA88((uint64_t)a3);
  return result;
}

+ (int)requestOTPForDSID:(unint64_t)a3 outMID:(char *)a4 outMIDSize:(unsigned int *)a5 outOTP:(char *)a6 outOTPSize:(unsigned int *)a7
{
  sub_10000AAE4(a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7);
  return result;
}

+ (int)setIDMSRoutingInfo:(unint64_t)a3 forDSID:(unint64_t)a4
{
  return sub_100173798(a4);
}

+ (int)isMachineProvisioned:(unint64_t)a3
{
  sub_100176D34();
  return result;
}

+ (int)startProvisioningWithDSID:(unint64_t)a3 SPIM:(const char *)a4 SPIMLength:(unsigned int)a5 outCPIM:(char *)a6 outCPIMLength:(unsigned int *)a7 outSession:(unsigned int *)a8
{
  sub_10016F7FC(a3, (uint64_t)a4, *(uint64_t *)&a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8);
  return result;
}

+ (int)endProvisioningWithSession:(unsigned int)a3 PTM:(const char *)a4 PTMLength:(unsigned int)a5 TK:(const char *)a6 TKLength:(unsigned int)a7
{
  sub_100159BF4();
  return result;
}

+ (int)destroyProvisioningSession:(unsigned int)a3
{
  sub_10016862C();
  return result;
}

+ (int)synchronizeWithDSID:(unint64_t)a3 SIM:(const char *)a4 SIMLength:(unsigned int)a5 outMID:(char *)a6 outMIDLength:(unsigned int *)a7 outSRM:(char *)a8 outSRMLength:(unsigned int *)a9
{
  sub_100164534(a3, (uint64_t)a4, *(uint64_t *)&a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, (uint64_t)a9);
  return result;
}

+ (int)eraseProvisioningForDSID:(unint64_t)a3
{
  sub_100160A28();
  return result;
}

@end