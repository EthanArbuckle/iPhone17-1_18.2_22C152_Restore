@interface IMRGLog
+ (OS_os_log)ACKTracker;
+ (OS_os_log)FTMessageDelivery_oversized;
+ (OS_os_log)GDR;
+ (OS_os_log)GDR_oversized;
+ (OS_os_log)IDSService;
+ (OS_os_log)IDSService_oversized;
+ (OS_os_log)IMMacNotificationCenterManager;
+ (OS_os_log)NRPairing;
+ (OS_os_log)NSUUID;
+ (OS_os_log)OTRStore;
+ (OS_os_log)accountCleanup;
+ (OS_os_log)accountEnabled;
+ (OS_os_log)accountSync;
+ (OS_os_log)accountUpdate;
+ (OS_os_log)accountsDebugging;
+ (OS_os_log)activeID;
+ (OS_os_log)appleCare;
+ (OS_os_log)classKeys;
+ (OS_os_log)dataProtectionClass;
+ (OS_os_log)deviceHeartbeat;
+ (OS_os_log)deviceIDMap;
+ (OS_os_log)deviceState;
+ (OS_os_log)engram;
+ (OS_os_log)healthDebug;
+ (OS_os_log)healthDebugging;
+ (OS_os_log)iCloud;
+ (OS_os_log)iMessageSpam;
+ (OS_os_log)internalCleanup;
+ (OS_os_log)isActive;
+ (OS_os_log)keyRoll;
+ (OS_os_log)keychain;
+ (OS_os_log)keychainManager;
+ (OS_os_log)liveMigration;
+ (OS_os_log)messageDelivery_oversized;
+ (OS_os_log)migration;
+ (OS_os_log)nonce;
+ (OS_os_log)pairedDeviceRepo;
+ (OS_os_log)pairedIdentities;
+ (OS_os_log)pairing;
+ (OS_os_log)pairingIdentities;
+ (OS_os_log)pairingProtocolDebug;
+ (OS_os_log)phoneRepair;
+ (OS_os_log)pushToken;
+ (OS_os_log)queryRetry;
+ (OS_os_log)regeneration;
+ (OS_os_log)registration;
+ (OS_os_log)registrationAuthKit;
+ (OS_os_log)registrationListener;
+ (OS_os_log)registration_oversized;
+ (OS_os_log)reloadAccounts;
+ (OS_os_log)serverBag;
+ (OS_os_log)signInController;
+ (OS_os_log)sms;
+ (OS_os_log)spamReporting;
+ (OS_os_log)sub_services;
+ (OS_os_log)sysdiagnose_keyTransparency;
+ (OS_os_log)sysdiagnose_oversized;
+ (OS_os_log)timing;
+ (OS_os_log)uniqueID;
+ (OS_os_log)vm;
+ (OS_os_log)voicemailSync;
+ (OS_os_log)warning;
+ (OS_os_log)watchPairing;
@end

@implementation IMRGLog

+ (OS_os_log)registration
{
  if (qword_1EB273C28 != -1) {
    dispatch_once(&qword_1EB273C28, &unk_1EE22FBF8);
  }
  v2 = (void *)qword_1EB273C20;
  return (OS_os_log *)v2;
}

+ (OS_os_log)timing
{
  if (qword_1EB273C00 != -1) {
    dispatch_once(&qword_1EB273C00, &unk_1EE230658);
  }
  v2 = (void *)qword_1EB273BF8;
  return (OS_os_log *)v2;
}

+ (OS_os_log)registration_oversized
{
  if (qword_1E92DAE18 != -1) {
    dispatch_once(&qword_1E92DAE18, &unk_1EE230C58);
  }
  v2 = (void *)qword_1E92DAE10;
  return (OS_os_log *)v2;
}

+ (OS_os_log)warning
{
  if (qword_1EB273858 != -1) {
    dispatch_once(&qword_1EB273858, &unk_1EE2311F8);
  }
  v2 = (void *)qword_1EB273850;
  return (OS_os_log *)v2;
}

+ (OS_os_log)ACKTracker
{
  if (qword_1E92DB628 != -1) {
    dispatch_once(&qword_1E92DB628, &unk_1EE22FED8);
  }
  v2 = (void *)qword_1E92DB620;
  return (OS_os_log *)v2;
}

+ (OS_os_log)engram
{
  if (qword_1E92DB638 != -1) {
    dispatch_once(&qword_1E92DB638, &unk_1EE2301F8);
  }
  v2 = (void *)qword_1E92DB630;
  return (OS_os_log *)v2;
}

+ (OS_os_log)FTMessageDelivery_oversized
{
  if (qword_1E92DACC0 != -1) {
    dispatch_once(&qword_1E92DACC0, &unk_1EE230478);
  }
  v2 = (void *)qword_1E92DACB8;
  return (OS_os_log *)v2;
}

+ (OS_os_log)GDR
{
  if (qword_1E92DACD0 != -1) {
    dispatch_once(&qword_1E92DACD0, &unk_1EE230678);
  }
  v2 = (void *)qword_1E92DACC8;
  return (OS_os_log *)v2;
}

+ (OS_os_log)GDR_oversized
{
  if (qword_1E92DACE0 != -1) {
    dispatch_once(&qword_1E92DACE0, &unk_1EE230778);
  }
  v2 = (void *)qword_1E92DACD8;
  return (OS_os_log *)v2;
}

+ (OS_os_log)IDSService
{
  if (qword_1E92DB170 != -1) {
    dispatch_once(&qword_1E92DB170, &unk_1EE230858);
  }
  v2 = (void *)qword_1E92DB188;
  return (OS_os_log *)v2;
}

+ (OS_os_log)IDSService_oversized
{
  if (qword_1EB273A20 != -1) {
    dispatch_once(&qword_1EB273A20, &unk_1EE2308F8);
  }
  v2 = (void *)qword_1EB273A18;
  return (OS_os_log *)v2;
}

+ (OS_os_log)NRPairing
{
  if (qword_1E92DB070 != -1) {
    dispatch_once(&qword_1E92DB070, &unk_1EE2309F8);
  }
  v2 = (void *)qword_1E92DB068;
  return (OS_os_log *)v2;
}

+ (OS_os_log)NSUUID
{
  if (qword_1EB2739D8 != -1) {
    dispatch_once(&qword_1EB2739D8, &unk_1EE230B38);
  }
  v2 = (void *)qword_1EB2739B8;
  return (OS_os_log *)v2;
}

+ (OS_os_log)OTRStore
{
  if (qword_1E92DB648 != -1) {
    dispatch_once(&qword_1E92DB648, &unk_1EE230B98);
  }
  v2 = (void *)qword_1E92DB640;
  return (OS_os_log *)v2;
}

+ (OS_os_log)accountCleanup
{
  if (qword_1E92DAF98 != -1) {
    dispatch_once(&qword_1E92DAF98, &unk_1EE230CF8);
  }
  v2 = (void *)qword_1E92DAF90;
  return (OS_os_log *)v2;
}

+ (OS_os_log)accountEnabled
{
  if (qword_1EB273B50 != -1) {
    dispatch_once(&qword_1EB273B50, &unk_1EE230D78);
  }
  v2 = (void *)qword_1EB273B48;
  return (OS_os_log *)v2;
}

+ (OS_os_log)accountSync
{
  if (qword_1E92DACF0 != -1) {
    dispatch_once(&qword_1E92DACF0, &unk_1EE230DB8);
  }
  v2 = (void *)qword_1E92DACE8;
  return (OS_os_log *)v2;
}

+ (OS_os_log)accountUpdate
{
  if (qword_1E92DAD00 != -1) {
    dispatch_once(&qword_1E92DAD00, &unk_1EE230E98);
  }
  v2 = (void *)qword_1E92DACF8;
  return (OS_os_log *)v2;
}

+ (OS_os_log)accountsDebugging
{
  if (qword_1E92DAFE8 != -1) {
    dispatch_once(&qword_1E92DAFE8, &unk_1EE230ED8);
  }
  v2 = (void *)qword_1E92DAFE0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)activeID
{
  if (qword_1EB2739F0 != -1) {
    dispatch_once(&qword_1EB2739F0, &unk_1EE230F98);
  }
  v2 = (void *)qword_1EB2739E8;
  return (OS_os_log *)v2;
}

+ (OS_os_log)appleCare
{
  if (qword_1E92DB658 != -1) {
    dispatch_once(&qword_1E92DB658, &unk_1EE231018);
  }
  v2 = (void *)qword_1E92DB650;
  return (OS_os_log *)v2;
}

+ (OS_os_log)classKeys
{
  if (qword_1E92DB668 != -1) {
    dispatch_once(&qword_1E92DB668, &unk_1EE2310D8);
  }
  v2 = (void *)qword_1E92DB660;
  return (OS_os_log *)v2;
}

+ (OS_os_log)dataProtectionClass
{
  if (qword_1E92DAD30 != -1) {
    dispatch_once(&qword_1E92DAD30, &unk_1EE231158);
  }
  v2 = (void *)qword_1E92DAD28;
  return (OS_os_log *)v2;
}

+ (OS_os_log)deviceHeartbeat
{
  if (qword_1E92DAD40 != -1) {
    dispatch_once(&qword_1E92DAD40, &unk_1EE231198);
  }
  v2 = (void *)qword_1E92DAD38;
  return (OS_os_log *)v2;
}

+ (OS_os_log)deviceIDMap
{
  if (qword_1E92DB678 != -1) {
    dispatch_once(&qword_1E92DB678, &unk_1EE231238);
  }
  v2 = (void *)qword_1E92DB670;
  return (OS_os_log *)v2;
}

+ (OS_os_log)deviceState
{
  if (qword_1E92DAD50 != -1) {
    dispatch_once(&qword_1E92DAD50, &unk_1EE231258);
  }
  v2 = (void *)qword_1E92DAD48;
  return (OS_os_log *)v2;
}

+ (OS_os_log)healthDebug
{
  if (qword_1E92DAD60 != -1) {
    dispatch_once(&qword_1E92DAD60, &unk_1EE231298);
  }
  v2 = (void *)qword_1E92DAD58;
  return (OS_os_log *)v2;
}

+ (OS_os_log)healthDebugging
{
  if (qword_1E92DAFB8 != -1) {
    dispatch_once(&qword_1E92DAFB8, &unk_1EE2312D8);
  }
  v2 = (void *)qword_1E92DAFB0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)iCloud
{
  if (qword_1E92DB050 != -1) {
    dispatch_once(&qword_1E92DB050, &unk_1EE231338);
  }
  v2 = (void *)qword_1E92DB048;
  return (OS_os_log *)v2;
}

+ (OS_os_log)IMMacNotificationCenterManager
{
  if (qword_1E92DB688 != -1) {
    dispatch_once(&qword_1E92DB688, &unk_1EE231398);
  }
  v2 = (void *)qword_1E92DB680;
  return (OS_os_log *)v2;
}

+ (OS_os_log)iMessageSpam
{
  if (qword_1E92DB698 != -1) {
    dispatch_once(&qword_1E92DB698, &unk_1EE2313B8);
  }
  v2 = (void *)qword_1E92DB690;
  return (OS_os_log *)v2;
}

+ (OS_os_log)spamReporting
{
  if (qword_1E92DB6A8 != -1) {
    dispatch_once(&qword_1E92DB6A8, &unk_1EE2313D8);
  }
  v2 = (void *)qword_1E92DB6A0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)internalCleanup
{
  if (qword_1E92DAD70 != -1) {
    dispatch_once(&qword_1E92DAD70, &unk_1EE231458);
  }
  v2 = (void *)qword_1E92DAD68;
  return (OS_os_log *)v2;
}

+ (OS_os_log)isActive
{
  if (qword_1E92DB6B8 != -1) {
    dispatch_once(&qword_1E92DB6B8, &unk_1EE231498);
  }
  v2 = (void *)qword_1E92DB6B0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)keyRoll
{
  if (qword_1E92DB6C8 != -1) {
    dispatch_once(&qword_1E92DB6C8, &unk_1EE22FF58);
  }
  v2 = (void *)qword_1E92DB6C0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)keychain
{
  if (qword_1E92DADA8 != -1) {
    dispatch_once(&qword_1E92DADA8, &unk_1EE22FFB8);
  }
  v2 = (void *)qword_1E92DADA0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)keychainManager
{
  if (qword_1E92DB390 != -1) {
    dispatch_once(&qword_1E92DB390, &unk_1EE22FFF8);
  }
  v2 = (void *)qword_1E92DB378;
  return (OS_os_log *)v2;
}

+ (OS_os_log)liveMigration
{
  if (qword_1E92DADB8 != -1) {
    dispatch_once(&qword_1E92DADB8, &unk_1EE230038);
  }
  v2 = (void *)qword_1E92DADB0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)messageDelivery_oversized
{
  if (qword_1E92DADC8 != -1) {
    dispatch_once(&qword_1E92DADC8, &unk_1EE230078);
  }
  v2 = (void *)qword_1E92DADC0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)migration
{
  if (qword_1E92DADD8 != -1) {
    dispatch_once(&qword_1E92DADD8, &unk_1EE2300F8);
  }
  v2 = (void *)qword_1E92DADD0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)nonce
{
  if (qword_1E92DB180 != -1) {
    dispatch_once(&qword_1E92DB180, &unk_1EE230118);
  }
  v2 = (void *)qword_1E92DB178;
  return (OS_os_log *)v2;
}

+ (OS_os_log)pairedDeviceRepo
{
  if (qword_1E92DB6D8 != -1) {
    dispatch_once(&qword_1E92DB6D8, &unk_1EE230158);
  }
  v2 = (void *)qword_1E92DB6D0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)pairedIdentities
{
  if (qword_1E92DB6E8 != -1) {
    dispatch_once(&qword_1E92DB6E8, &unk_1EE230198);
  }
  v2 = (void *)qword_1E92DB6E0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)pairing
{
  if (qword_1E92DB6F8 != -1) {
    dispatch_once(&qword_1E92DB6F8, &unk_1EE2301B8);
  }
  v2 = (void *)qword_1E92DB6F0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)pairingIdentities
{
  if (qword_1E92DB708 != -1) {
    dispatch_once(&qword_1E92DB708, &unk_1EE230258);
  }
  v2 = (void *)qword_1E92DB700;
  return (OS_os_log *)v2;
}

+ (OS_os_log)pairingProtocolDebug
{
  if (qword_1E92DAFF8 != -1) {
    dispatch_once(&qword_1E92DAFF8, &unk_1EE230278);
  }
  v2 = (void *)qword_1E92DAFF0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)phoneRepair
{
  if (qword_1E92DADE8 != -1) {
    dispatch_once(&qword_1E92DADE8, &unk_1EE230298);
  }
  v2 = (void *)qword_1E92DADE0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)pushToken
{
  if (qword_1E92DADF8 != -1) {
    dispatch_once(&qword_1E92DADF8, &unk_1EE2302D8);
  }
  v2 = (void *)qword_1E92DADF0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)queryRetry
{
  if (qword_1E92DB718 != -1) {
    dispatch_once(&qword_1E92DB718, &unk_1EE2302F8);
  }
  v2 = (void *)qword_1E92DB710;
  return (OS_os_log *)v2;
}

+ (OS_os_log)regeneration
{
  if (qword_1E92DB728 != -1) {
    dispatch_once(&qword_1E92DB728, &unk_1EE230318);
  }
  v2 = (void *)qword_1E92DB720;
  return (OS_os_log *)v2;
}

+ (OS_os_log)registrationAuthKit
{
  if (qword_1E92DAF68 != -1) {
    dispatch_once(&qword_1E92DAF68, &unk_1EE230338);
  }
  v2 = (void *)qword_1E92DAF60;
  return (OS_os_log *)v2;
}

+ (OS_os_log)registrationListener
{
  if (qword_1E92DAE08 != -1) {
    dispatch_once(&qword_1E92DAE08, &unk_1EE230398);
  }
  v2 = (void *)qword_1E92DAE00;
  return (OS_os_log *)v2;
}

+ (OS_os_log)reloadAccounts
{
  if (qword_1E92DB738 != -1) {
    dispatch_once(&qword_1E92DB738, &unk_1EE2303D8);
  }
  v2 = (void *)qword_1E92DB730;
  return (OS_os_log *)v2;
}

+ (OS_os_log)serverBag
{
  if (qword_1EB273A00 != -1) {
    dispatch_once(&qword_1EB273A00, &unk_1EE230418);
  }
  v2 = (void *)qword_1EB2739F8;
  return (OS_os_log *)v2;
}

+ (OS_os_log)sms
{
  if (qword_1EB273990 != -1) {
    dispatch_once(&qword_1EB273990, &unk_1EE2304B8);
  }
  v2 = (void *)qword_1EB273970;
  return (OS_os_log *)v2;
}

+ (OS_os_log)sub_services
{
  if (qword_1E92DAE30 != -1) {
    dispatch_once(&qword_1E92DAE30, &unk_1EE230518);
  }
  v2 = (void *)qword_1E92DAE28;
  return (OS_os_log *)v2;
}

+ (OS_os_log)sysdiagnose_oversized
{
  if (qword_1E92DAE40 != -1) {
    dispatch_once(&qword_1E92DAE40, &unk_1EE230538);
  }
  v2 = (void *)qword_1E92DAE38;
  return (OS_os_log *)v2;
}

+ (OS_os_log)sysdiagnose_keyTransparency
{
  if (qword_1E92DAFD0 != -1) {
    dispatch_once(&qword_1E92DAFD0, &unk_1EE230578);
  }
  v2 = (void *)qword_1E92DAFC8;
  return (OS_os_log *)v2;
}

+ (OS_os_log)uniqueID
{
  if (qword_1E92DB748 != -1) {
    dispatch_once(&qword_1E92DB748, &unk_1EE2305B8);
  }
  v2 = (void *)qword_1E92DB740;
  return (OS_os_log *)v2;
}

+ (OS_os_log)voicemailSync
{
  if (qword_1E92DB758 != -1) {
    dispatch_once(&qword_1E92DB758, &unk_1EE2305D8);
  }
  v2 = (void *)qword_1E92DB750;
  return (OS_os_log *)v2;
}

+ (OS_os_log)watchPairing
{
  if (qword_1E92DB110 != -1) {
    dispatch_once(&qword_1E92DB110, &unk_1EE230618);
  }
  v2 = (void *)qword_1E92DB108;
  return (OS_os_log *)v2;
}

+ (OS_os_log)signInController
{
  if (qword_1EB273778 != -1) {
    dispatch_once(&qword_1EB273778, &unk_1EE230638);
  }
  v2 = (void *)qword_1E92DB3B8;
  return (OS_os_log *)v2;
}

+ (OS_os_log)vm
{
  if (qword_1E92DB768 != -1) {
    dispatch_once(&qword_1E92DB768, &unk_1EE22FA18);
  }
  v2 = (void *)qword_1E92DB760;
  return (OS_os_log *)v2;
}

@end