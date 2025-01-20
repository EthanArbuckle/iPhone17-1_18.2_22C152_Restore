@interface IDSLogging
+ (OS_os_log)Accounts;
+ (OS_os_log)CFS;
+ (OS_os_log)Connection;
+ (OS_os_log)DaemonController;
+ (OS_os_log)DaemonListener;
+ (OS_os_log)DaemonProxy;
+ (OS_os_log)GUIDTRACE;
+ (OS_os_log)IDQuery;
+ (OS_os_log)IDSAccountController;
+ (OS_os_log)IDSConnection;
+ (OS_os_log)IDSConnection_oversize;
+ (OS_os_log)IDSDataChannels;
+ (OS_os_log)IDSDevice;
+ (OS_os_log)IDSDeviceConnection;
+ (OS_os_log)IDSDirectMessagingConnection;
+ (OS_os_log)IDSRealTimeEncryptionProxy;
+ (OS_os_log)IDSService;
+ (OS_os_log)IDSSession;
+ (OS_os_log)IDSiCloudSignInHack;
+ (OS_os_log)RegistrationManager;
+ (OS_os_log)ServiceAvailability;
+ (OS_os_log)_IDSGroupSession;
+ (OS_os_log)_IDSGroupSession_oversize;
+ (OS_os_log)_IDSService;
+ (OS_os_log)_IDSSession;
+ (OS_os_log)continuity;
+ (OS_os_log)general;
+ (OS_os_log)transactionLog;
@end

@implementation IDSLogging

+ (OS_os_log)IDSAccountController
{
  if (qword_1EB2BD7B0 != -1) {
    dispatch_once(&qword_1EB2BD7B0, &unk_1EE245B68);
  }
  v2 = (void *)qword_1EB2BD7C0;

  return (OS_os_log *)v2;
}

+ (OS_os_log)_IDSService
{
  if (qword_1EB2BD798 != -1) {
    dispatch_once(&qword_1EB2BD798, &unk_1EE247068);
  }
  v2 = (void *)qword_1EB2BD778;

  return (OS_os_log *)v2;
}

+ (OS_os_log)DaemonController
{
  if (qword_1EB2BD7E8 != -1) {
    dispatch_once(&qword_1EB2BD7E8, &unk_1EE245F68);
  }
  v2 = (void *)qword_1EB2BD7D8;

  return (OS_os_log *)v2;
}

+ (OS_os_log)IDQuery
{
  if (qword_1EB2BD700 != -1) {
    dispatch_once(&qword_1EB2BD700, &unk_1EE246AC8);
  }
  v2 = (void *)qword_1EB2BD6F8;

  return (OS_os_log *)v2;
}

+ (OS_os_log)Connection
{
  if (qword_1EB2BD7F0 != -1) {
    dispatch_once(&qword_1EB2BD7F0, &unk_1EE2460C8);
  }
  v2 = (void *)qword_1EB2BD7E0;

  return (OS_os_log *)v2;
}

+ (OS_os_log)Accounts
{
  if (qword_1EB2BD7A8 != -1) {
    dispatch_once(&qword_1EB2BD7A8, &unk_1EE245B48);
  }
  v2 = (void *)qword_1EB2BD7A0;

  return (OS_os_log *)v2;
}

+ (OS_os_log)general
{
  if (qword_1E92DE370 != -1) {
    dispatch_once(&qword_1E92DE370, &unk_1EE246C88);
  }
  v2 = (void *)qword_1E92DE368;

  return (OS_os_log *)v2;
}

+ (OS_os_log)transactionLog
{
  if (qword_1E92DE380 != -1) {
    dispatch_once(&qword_1E92DE380, &unk_1EE245EE8);
  }
  v2 = (void *)qword_1E92DE378;

  return (OS_os_log *)v2;
}

+ (OS_os_log)DaemonListener
{
  if (qword_1EB2BD750 != -1) {
    dispatch_once(&qword_1EB2BD750, &unk_1EE245F88);
  }
  v2 = (void *)qword_1EB2BD758;

  return (OS_os_log *)v2;
}

+ (OS_os_log)RegistrationManager
{
  if (qword_1EB2BD710 != -1) {
    dispatch_once(&qword_1EB2BD710, &unk_1EE245FA8);
  }
  v2 = (void *)qword_1EB2BD708;

  return (OS_os_log *)v2;
}

+ (OS_os_log)IDSService
{
  if (qword_1E92DE230 != -1) {
    dispatch_once(&qword_1E92DE230, &unk_1EE246D68);
  }
  v2 = (void *)qword_1E92DE238;

  return (OS_os_log *)v2;
}

+ (OS_os_log)IDSConnection
{
  if (qword_1EB2BD748 != -1) {
    dispatch_once(&qword_1EB2BD748, &unk_1EE246028);
  }
  v2 = (void *)qword_1EB2BD728;

  return (OS_os_log *)v2;
}

+ (OS_os_log)IDSConnection_oversize
{
  if (qword_1EB2BD528 != -1) {
    dispatch_once(&qword_1EB2BD528, &unk_1EE246068);
  }
  v2 = (void *)qword_1EB2BD530;

  return (OS_os_log *)v2;
}

+ (OS_os_log)IDSDirectMessagingConnection
{
  if (qword_1EB2BD6F0 != -1) {
    dispatch_once(&qword_1EB2BD6F0, &unk_1EE246088);
  }
  v2 = (void *)qword_1EB2BD6E8;

  return (OS_os_log *)v2;
}

+ (OS_os_log)continuity
{
  if (qword_1E92DE390 != -1) {
    dispatch_once(&qword_1E92DE390, &unk_1EE246DE8);
  }
  v2 = (void *)qword_1E92DE388;

  return (OS_os_log *)v2;
}

+ (OS_os_log)IDSSession
{
  if (qword_1E92DE120 != -1) {
    dispatch_once(&qword_1E92DE120, &unk_1EE2460E8);
  }
  v2 = (void *)qword_1E92DE398;

  return (OS_os_log *)v2;
}

+ (OS_os_log)CFS
{
  if (qword_1E92DE3A8 != -1) {
    dispatch_once(&qword_1E92DE3A8, &unk_1EE246108);
  }
  v2 = (void *)qword_1E92DE3A0;

  return (OS_os_log *)v2;
}

+ (OS_os_log)_IDSGroupSession
{
  if (qword_1E92DE3B8 != -1) {
    dispatch_once(&qword_1E92DE3B8, &unk_1EE246148);
  }
  v2 = (void *)qword_1E92DE3B0;

  return (OS_os_log *)v2;
}

+ (OS_os_log)_IDSGroupSession_oversize
{
  if (qword_1E92DE3C8 != -1) {
    dispatch_once(&qword_1E92DE3C8, &unk_1EE246168);
  }
  v2 = (void *)qword_1E92DE3C0;

  return (OS_os_log *)v2;
}

+ (OS_os_log)DaemonProxy
{
  if (qword_1E92DE3D8 != -1) {
    dispatch_once(&qword_1E92DE3D8, &unk_1EE246E68);
  }
  v2 = (void *)qword_1E92DE3D0;

  return (OS_os_log *)v2;
}

+ (OS_os_log)GUIDTRACE
{
  if (qword_1EB2BD698 != -1) {
    dispatch_once(&qword_1EB2BD698, &unk_1EE2461C8);
  }
  v2 = (void *)qword_1EB2BD690;

  return (OS_os_log *)v2;
}

+ (OS_os_log)IDSDevice
{
  if (qword_1E92DE3E8 != -1) {
    dispatch_once(&qword_1E92DE3E8, &unk_1EE247088);
  }
  v2 = (void *)qword_1E92DE3E0;

  return (OS_os_log *)v2;
}

+ (OS_os_log)IDSDeviceConnection
{
  if (qword_1E92DE3F8 != -1) {
    dispatch_once(&qword_1E92DE3F8, &unk_1EE245968);
  }
  v2 = (void *)qword_1E92DE3F0;

  return (OS_os_log *)v2;
}

+ (OS_os_log)IDSDataChannels
{
  if (qword_1E92DE408 != -1) {
    dispatch_once(&qword_1E92DE408, &unk_1EE2470A8);
  }
  v2 = (void *)qword_1E92DE400;

  return (OS_os_log *)v2;
}

+ (OS_os_log)ServiceAvailability
{
  if (qword_1E92DE228 != -1) {
    dispatch_once(&qword_1E92DE228, &unk_1EE245BC8);
  }
  v2 = (void *)qword_1E92DE220;

  return (OS_os_log *)v2;
}

+ (OS_os_log)IDSRealTimeEncryptionProxy
{
  if (qword_1E92DE418 != -1) {
    dispatch_once(&qword_1E92DE418, &unk_1EE245BE8);
  }
  v2 = (void *)qword_1E92DE410;

  return (OS_os_log *)v2;
}

+ (OS_os_log)IDSiCloudSignInHack
{
  if (qword_1E92DE428 != -1) {
    dispatch_once(&qword_1E92DE428, &unk_1EE245C08);
  }
  v2 = (void *)qword_1E92DE420;

  return (OS_os_log *)v2;
}

+ (OS_os_log)_IDSSession
{
  if (qword_1E92DE438 != -1) {
    dispatch_once(&qword_1E92DE438, &unk_1EE245C68);
  }
  v2 = (void *)qword_1E92DE430;

  return (OS_os_log *)v2;
}

@end