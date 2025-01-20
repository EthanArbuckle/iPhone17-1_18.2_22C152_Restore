@interface IDSTransportLog
+ (OS_os_log)IDSConnection;
+ (OS_os_log)IDSDataChannels;
+ (OS_os_log)IDSDeviceConnection;
+ (OS_os_log)IDSLocalSetup;
+ (OS_os_log)IDSReportSpam;
+ (OS_os_log)IDSService;
+ (OS_os_log)NRPairing;
+ (OS_os_log)QRAllocator;
@end

@implementation IDSTransportLog

+ (OS_os_log)IDSService
{
  if (qword_1EB2BD688 != -1) {
    dispatch_once(&qword_1EB2BD688, &unk_1EE245E48);
  }
  v2 = (void *)qword_1EB2BD680;

  return (OS_os_log *)v2;
}

+ (OS_os_log)QRAllocator
{
  if (qword_1E92DE330 != -1) {
    dispatch_once(&qword_1E92DE330, &unk_1EE246DA8);
  }
  v2 = (void *)qword_1E92DE328;

  return (OS_os_log *)v2;
}

+ (OS_os_log)IDSConnection
{
  if (qword_1EB2BD670 != -1) {
    dispatch_once(&qword_1EB2BD670, &unk_1EE246A28);
  }
  v2 = (void *)qword_1EB2BD668;

  return (OS_os_log *)v2;
}

+ (OS_os_log)IDSDeviceConnection
{
  if (qword_1E92DE340 != -1) {
    dispatch_once(&qword_1E92DE340, &unk_1EE246AE8);
  }
  v2 = (void *)qword_1E92DE338;

  return (OS_os_log *)v2;
}

+ (OS_os_log)IDSDataChannels
{
  if (qword_1E92DE350 != -1) {
    dispatch_once(&qword_1E92DE350, &unk_1EE245D08);
  }
  v2 = (void *)qword_1E92DE348;

  return (OS_os_log *)v2;
}

+ (OS_os_log)IDSLocalSetup
{
  if (qword_1E92DE360 != -1) {
    dispatch_once(&qword_1E92DE360, &unk_1EE246BC8);
  }
  v2 = (void *)qword_1E92DE358;

  return (OS_os_log *)v2;
}

+ (OS_os_log)IDSReportSpam
{
  if (qword_1E92DE128 != -1) {
    dispatch_once(&qword_1E92DE128, &unk_1EE245DC8);
  }
  v2 = (void *)qword_1E92DE150;

  return (OS_os_log *)v2;
}

+ (OS_os_log)NRPairing
{
  if (qword_1E92DE118 != -1) {
    dispatch_once(&qword_1E92DE118, &unk_1EE246C08);
  }
  v2 = (void *)qword_1E92DE110;

  return (OS_os_log *)v2;
}

@end