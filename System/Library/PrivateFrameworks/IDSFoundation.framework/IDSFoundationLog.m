@interface IDSFoundationLog
+ (OS_os_log)BTLink;
+ (OS_os_log)ClientChannel;
+ (OS_os_log)ClientChannelAgent;
+ (OS_os_log)ClientChannelManager;
+ (OS_os_log)ConnectivityMonitor;
+ (OS_os_log)ContactsUtilities;
+ (OS_os_log)CrossLayerLogging;
+ (OS_os_log)FTGL;
+ (OS_os_log)FeatureToggler;
+ (OS_os_log)GFTGL;
+ (OS_os_log)GlobalLink;
+ (OS_os_log)GlobalLink_oversize;
+ (OS_os_log)GroupSessionDataCryptor;
+ (OS_os_log)GroupSessionKeyValueDelivery;
+ (OS_os_log)GroupStatus_oversized;
+ (OS_os_log)IDSDSession;
+ (OS_os_log)IDSFirewall;
+ (OS_os_log)IDSMessageStore;
+ (OS_os_log)IDSNWLink;
+ (OS_os_log)IDSOffGridMessenger;
+ (OS_os_log)IDSOffGridStateManager;
+ (OS_os_log)IDSOffGridStateManager_oversized;
+ (OS_os_log)IDSPinnedIdentity;
+ (OS_os_log)IDSSKStatusClient;
+ (OS_os_log)IDSServerMessaging;
+ (OS_os_log)IDSSession;
+ (OS_os_log)IDSUDPLink;
+ (OS_os_log)IPsecLink;
+ (OS_os_log)KeyTransparency;
+ (OS_os_log)Metrics;
+ (OS_os_log)Multiplexer;
+ (OS_os_log)NWPathUtils;
+ (OS_os_log)NonFTGL;
+ (OS_os_log)OTRController;
+ (OS_os_log)PeerLookup_DBCache;
+ (OS_os_log)QRAllocator;
+ (OS_os_log)QRAllocator_oversized;
+ (OS_os_log)QRProto;
+ (OS_os_log)QRProto_oversize;
+ (OS_os_log)RealTimeEncryptionController;
+ (OS_os_log)RealTimeEncryptionController_oversize;
+ (OS_os_log)ServerMaterialExchange;
+ (OS_os_log)ServerMaterialExchange_oversize;
+ (OS_os_log)SessionController;
+ (OS_os_log)SimulatorProxy;
+ (OS_os_log)StableEncryptionController;
+ (OS_os_log)Stun;
+ (OS_os_log)System;
+ (OS_os_log)TransportLevelAgent;
+ (OS_os_log)UTunConnection;
+ (OS_os_log)UTunPeer;
+ (OS_os_log)accountIdentity;
+ (OS_os_log)bonjourDeliveryController;
+ (OS_os_log)cloudKit;
+ (OS_os_log)delivery;
+ (OS_os_log)deliveryController;
+ (OS_os_log)delivery_keyTransparency;
+ (OS_os_log)delivery_oversized;
+ (OS_os_log)encryptionController;
+ (OS_os_log)groupCrypto;
+ (OS_os_log)interface;
+ (OS_os_log)localDeliveryQueue;
+ (OS_os_log)opportunistic;
+ (OS_os_log)query;
+ (OS_os_log)socketPairConnection;
+ (OS_os_log)stewieMessaging;
+ (OS_os_log)stewieProvisioning;
+ (OS_os_log)utilities;
+ (OS_os_log)utunController;
+ (OS_os_log)xpc;
@end

@implementation IDSFoundationLog

+ (OS_os_log)delivery
{
  if (qword_1E944EED8 != -1) {
    dispatch_once(&qword_1E944EED8, &unk_1EEFCE098);
  }
  v2 = (void *)qword_1E944EED0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)Multiplexer
{
  if (qword_1E944EE28 != -1) {
    dispatch_once(&qword_1E944EE28, &unk_1EEFCDDF8);
  }
  v2 = (void *)qword_1E944EE20;
  return (OS_os_log *)v2;
}

+ (OS_os_log)cloudKit
{
  if (qword_1E944F6B8 != -1) {
    dispatch_once(&qword_1E944F6B8, &unk_1EEFCD738);
  }
  v2 = (void *)qword_1E944F6B0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)accountIdentity
{
  if (qword_1E944EEC8 != -1) {
    dispatch_once(&qword_1E944EEC8, &unk_1EEFCDCB8);
  }
  v2 = (void *)qword_1E944EEC0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)groupCrypto
{
  if (qword_1E944F6C8 != -1) {
    dispatch_once(&qword_1E944F6C8, &unk_1EEFCDE58);
  }
  v2 = (void *)qword_1E944F6C0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)delivery_oversized
{
  if (qword_1E944EEE8 != -1) {
    dispatch_once(&qword_1E944EEE8, &unk_1EEFCE0D8);
  }
  v2 = (void *)qword_1E944EEE0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)delivery_keyTransparency
{
  if (qword_1E944F200 != -1) {
    dispatch_once(&qword_1E944F200, &unk_1EEFCE118);
  }
  v2 = (void *)qword_1E944F1F8;
  return (OS_os_log *)v2;
}

+ (OS_os_log)query
{
  if (qword_1E944F6D8 != -1) {
    dispatch_once(&qword_1E944F6D8, &unk_1EEFCE178);
  }
  v2 = (void *)qword_1E944F6D0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)UTunPeer
{
  if (qword_1E944F2A8 != -1) {
    dispatch_once(&qword_1E944F2A8, &unk_1EEFCE1B8);
  }
  v2 = (void *)qword_1E944F2A0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)UTunConnection
{
  if (qword_1E944EE48 != -1) {
    dispatch_once(&qword_1E944EE48, &unk_1EEFCE1F8);
  }
  v2 = (void *)qword_1E944EE40;
  return (OS_os_log *)v2;
}

+ (OS_os_log)localDeliveryQueue
{
  if (qword_1E944F6E8 != -1) {
    dispatch_once(&qword_1E944F6E8, &unk_1EEFCE2B8);
  }
  v2 = (void *)qword_1E944F6E0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)socketPairConnection
{
  if (qword_1E944F320 != -1) {
    dispatch_once(&qword_1E944F320, &unk_1EEFCE318);
  }
  v2 = (void *)qword_1E944F318;
  return (OS_os_log *)v2;
}

+ (OS_os_log)OTRController
{
  if (qword_1E944F6F8 != -1) {
    dispatch_once(&qword_1E944F6F8, &unk_1EEFCE3B8);
  }
  v2 = (void *)qword_1E944F6F0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)encryptionController
{
  if (qword_1E944F708 != -1) {
    dispatch_once(&qword_1E944F708, &unk_1EEFCE418);
  }
  v2 = (void *)qword_1E944F700;
  return (OS_os_log *)v2;
}

+ (OS_os_log)BTLink
{
  if (qword_1E944F718 != -1) {
    dispatch_once(&qword_1E944F718, &unk_1EEFCE498);
  }
  v2 = (void *)qword_1E944F710;
  return (OS_os_log *)v2;
}

+ (OS_os_log)utunController
{
  if (qword_1E944F0A8 != -1) {
    dispatch_once(&qword_1E944F0A8, &unk_1EEFCE4D8);
  }
  v2 = (void *)qword_1E944F0A0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)deliveryController
{
  if (qword_1E944F728 != -1) {
    dispatch_once(&qword_1E944F728, &unk_1EEFCE538);
  }
  v2 = (void *)qword_1E944F720;
  return (OS_os_log *)v2;
}

+ (OS_os_log)stewieProvisioning
{
  if (qword_1E944F1D0 != -1) {
    dispatch_once(&qword_1E944F1D0, &unk_1EEFCE578);
  }
  v2 = (void *)qword_1E944F1C8;
  return (OS_os_log *)v2;
}

+ (OS_os_log)stewieMessaging
{
  if (qword_1E944F1C0 != -1) {
    dispatch_once(&qword_1E944F1C0, &unk_1EEFCE5B8);
  }
  v2 = (void *)qword_1E944F1B8;
  return (OS_os_log *)v2;
}

+ (OS_os_log)IDSOffGridMessenger
{
  if (qword_1E944F348 != -1) {
    dispatch_once(&qword_1E944F348, &unk_1EEFCE5D8);
  }
  v2 = (void *)qword_1E944F340;
  return (OS_os_log *)v2;
}

+ (OS_os_log)IDSOffGridStateManager
{
  if (qword_1E944F3C0 != -1) {
    dispatch_once(&qword_1E944F3C0, &unk_1EEFCE618);
  }
  v2 = (void *)qword_1E944F3B8;
  return (OS_os_log *)v2;
}

+ (OS_os_log)IDSOffGridStateManager_oversized
{
  if (qword_1E944F1E0 != -1) {
    dispatch_once(&qword_1E944F1E0, &unk_1EEFCE658);
  }
  v2 = (void *)qword_1E944F1D8;
  return (OS_os_log *)v2;
}

+ (OS_os_log)IDSSKStatusClient
{
  if (qword_1E944F180 != -1) {
    dispatch_once(&qword_1E944F180, &unk_1EEFCE6B8);
  }
  v2 = (void *)qword_1E944F178;
  return (OS_os_log *)v2;
}

+ (OS_os_log)opportunistic
{
  if (qword_1E944F0C0 != -1) {
    dispatch_once(&qword_1E944F0C0, &unk_1EEFCE6F8);
  }
  v2 = (void *)qword_1E944F0E8;
  return (OS_os_log *)v2;
}

+ (OS_os_log)bonjourDeliveryController
{
  if (qword_1E944F738 != -1) {
    dispatch_once(&qword_1E944F738, &unk_1EEFCE738);
  }
  v2 = (void *)qword_1E944F730;
  return (OS_os_log *)v2;
}

+ (OS_os_log)utilities
{
  if (qword_1EB2BB760 != -1) {
    dispatch_once(&qword_1EB2BB760, &unk_1EEFCE7D8);
  }
  v2 = (void *)qword_1EB2BB758;
  return (OS_os_log *)v2;
}

+ (OS_os_log)IPsecLink
{
  if (qword_1E944F748 != -1) {
    dispatch_once(&qword_1E944F748, &unk_1EEFCE818);
  }
  v2 = (void *)qword_1E944F740;
  return (OS_os_log *)v2;
}

+ (OS_os_log)xpc
{
  if (qword_1EB2BB7F0 != -1) {
    dispatch_once(&qword_1EB2BB7F0, &unk_1EEFCE858);
  }
  v2 = (void *)qword_1EB2BB7E8;
  return (OS_os_log *)v2;
}

+ (OS_os_log)IDSSession
{
  if (qword_1E944F758 != -1) {
    dispatch_once(&qword_1E944F758, &unk_1EEFCE8B8);
  }
  v2 = (void *)qword_1E944F750;
  return (OS_os_log *)v2;
}

+ (OS_os_log)IDSDSession
{
  if (qword_1E944F768 != -1) {
    dispatch_once(&qword_1E944F768, &unk_1EEFCE958);
  }
  v2 = (void *)qword_1E944F760;
  return (OS_os_log *)v2;
}

+ (OS_os_log)GroupStatus_oversized
{
  if (qword_1E944F778 != -1) {
    dispatch_once(&qword_1E944F778, &unk_1EEFCD958);
  }
  v2 = (void *)qword_1E944F770;
  return (OS_os_log *)v2;
}

+ (OS_os_log)QRAllocator
{
  if (qword_1E944EE38 != -1) {
    dispatch_once(&qword_1E944EE38, &unk_1EEFCD9B8);
  }
  v2 = (void *)qword_1E944EE30;
  return (OS_os_log *)v2;
}

+ (OS_os_log)QRAllocator_oversized
{
  if (qword_1E944F278 != -1) {
    dispatch_once(&qword_1E944F278, &unk_1EEFCDA18);
  }
  v2 = (void *)qword_1E944F270;
  return (OS_os_log *)v2;
}

+ (OS_os_log)Stun
{
  if (qword_1E944F298 != -1) {
    dispatch_once(&qword_1E944F298, &unk_1EEFCDA78);
  }
  v2 = (void *)qword_1E944F290;
  return (OS_os_log *)v2;
}

+ (OS_os_log)ServerMaterialExchange
{
  if (qword_1E944F788 != -1) {
    dispatch_once(&qword_1E944F788, &unk_1EEFCDAB8);
  }
  v2 = (void *)qword_1E944F780;
  return (OS_os_log *)v2;
}

+ (OS_os_log)ServerMaterialExchange_oversize
{
  if (qword_1E944F798 != -1) {
    dispatch_once(&qword_1E944F798, &unk_1EEFCDAD8);
  }
  v2 = (void *)qword_1E944F790;
  return (OS_os_log *)v2;
}

+ (OS_os_log)Metrics
{
  if (qword_1E944F7A8 != -1) {
    dispatch_once(&qword_1E944F7A8, &unk_1EEFCDAF8);
  }
  v2 = (void *)qword_1E944F7A0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)GlobalLink
{
  if (qword_1E944F228 != -1) {
    dispatch_once(&qword_1E944F228, &unk_1EEFCDB18);
  }
  v2 = (void *)qword_1E944F220;
  return (OS_os_log *)v2;
}

+ (OS_os_log)GlobalLink_oversize
{
  if (qword_1E944F238 != -1) {
    dispatch_once(&qword_1E944F238, &unk_1EEFCDB38);
  }
  v2 = (void *)qword_1E944F230;
  return (OS_os_log *)v2;
}

+ (OS_os_log)FTGL
{
  if (qword_1E944F7B8 != -1) {
    dispatch_once(&qword_1E944F7B8, &unk_1EEFCDB58);
  }
  v2 = (void *)qword_1E944F7B0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)GFTGL
{
  if (qword_1E944F7C8 != -1) {
    dispatch_once(&qword_1E944F7C8, &unk_1EEFCDB98);
  }
  v2 = (void *)qword_1E944F7C0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)NonFTGL
{
  if (qword_1E944F268 != -1) {
    dispatch_once(&qword_1E944F268, &unk_1EEFCDBB8);
  }
  v2 = (void *)qword_1E944F260;
  return (OS_os_log *)v2;
}

+ (OS_os_log)SessionController
{
  if (qword_1E944F7D8 != -1) {
    dispatch_once(&qword_1E944F7D8, &unk_1EEFCDBF8);
  }
  v2 = (void *)qword_1E944F7D0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)RealTimeEncryptionController
{
  if (qword_1E944F7E8 != -1) {
    dispatch_once(&qword_1E944F7E8, &unk_1EEFCDC18);
  }
  v2 = (void *)qword_1E944F7E0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)RealTimeEncryptionController_oversize
{
  if (qword_1E944F7F8 != -1) {
    dispatch_once(&qword_1E944F7F8, &unk_1EEFCDC38);
  }
  v2 = (void *)qword_1E944F7F0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)StableEncryptionController
{
  if (qword_1E944F808 != -1) {
    dispatch_once(&qword_1E944F808, &unk_1EEFCDC58);
  }
  v2 = (void *)qword_1E944F800;
  return (OS_os_log *)v2;
}

+ (OS_os_log)GroupSessionDataCryptor
{
  if (qword_1E944F818 != -1) {
    dispatch_once(&qword_1E944F818, &unk_1EEFCDC78);
  }
  v2 = (void *)qword_1E944F810;
  return (OS_os_log *)v2;
}

+ (OS_os_log)IDSMessageStore
{
  if (qword_1E944EE18 != -1) {
    dispatch_once(&qword_1E944EE18, &unk_1EEFCD238);
  }
  v2 = (void *)qword_1E944EE10;
  return (OS_os_log *)v2;
}

+ (OS_os_log)KeyTransparency
{
  if (qword_1E944F330 != -1) {
    dispatch_once(&qword_1E944F330, &unk_1EEFCD258);
  }
  v2 = (void *)qword_1E944F328;
  return (OS_os_log *)v2;
}

+ (OS_os_log)FeatureToggler
{
  if (qword_1E944F828 != -1) {
    dispatch_once(&qword_1E944F828, &unk_1EEFCD278);
  }
  v2 = (void *)qword_1E944F820;
  return (OS_os_log *)v2;
}

+ (OS_os_log)CrossLayerLogging
{
  if (qword_1EB2BB7D8 != -1) {
    dispatch_once(&qword_1EB2BB7D8, &unk_1EEFCDCF8);
  }
  v2 = (void *)qword_1EB2BB7D0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)IDSUDPLink
{
  if (qword_1E944F838 != -1) {
    dispatch_once(&qword_1E944F838, &unk_1EEFCDD18);
  }
  v2 = (void *)qword_1E944F830;
  return (OS_os_log *)v2;
}

+ (OS_os_log)IDSNWLink
{
  if (qword_1E944F248 != -1) {
    dispatch_once(&qword_1E944F248, &unk_1EEFCDD38);
  }
  v2 = (void *)qword_1E944F240;
  return (OS_os_log *)v2;
}

+ (OS_os_log)QRProto
{
  if (qword_1E944F848 != -1) {
    dispatch_once(&qword_1E944F848, &unk_1EEFCDD58);
  }
  v2 = (void *)qword_1E944F840;
  return (OS_os_log *)v2;
}

+ (OS_os_log)QRProto_oversize
{
  if (qword_1E944F288 != -1) {
    dispatch_once(&qword_1E944F288, &unk_1EEFCDD78);
  }
  v2 = (void *)qword_1E944F280;
  return (OS_os_log *)v2;
}

+ (OS_os_log)interface
{
  if (qword_1E944F858 != -1) {
    dispatch_once(&qword_1E944F858, &unk_1EEFCDD98);
  }
  v2 = (void *)qword_1E944F850;
  return (OS_os_log *)v2;
}

+ (OS_os_log)ConnectivityMonitor
{
  if (qword_1E944F868 != -1) {
    dispatch_once(&qword_1E944F868, &unk_1EEFCDDB8);
  }
  v2 = (void *)qword_1E944F860;
  return (OS_os_log *)v2;
}

+ (OS_os_log)TransportLevelAgent
{
  if (qword_1E944F128 != -1) {
    dispatch_once(&qword_1E944F128, &unk_1EEFCDDD8);
  }
  v2 = (void *)qword_1E944F120;
  return (OS_os_log *)v2;
}

+ (OS_os_log)IDSServerMessaging
{
  if (qword_1E944F878 != -1) {
    dispatch_once(&qword_1E944F878, &unk_1EEFCDE18);
  }
  v2 = (void *)qword_1E944F870;
  return (OS_os_log *)v2;
}

+ (OS_os_log)ClientChannel
{
  if (qword_1E944F888 != -1) {
    dispatch_once(&qword_1E944F888, &unk_1EEFCDE98);
  }
  v2 = (void *)qword_1E944F880;
  return (OS_os_log *)v2;
}

+ (OS_os_log)ClientChannelAgent
{
  if (qword_1E944F898 != -1) {
    dispatch_once(&qword_1E944F898, &unk_1EEFCDEB8);
  }
  v2 = (void *)qword_1E944F890;
  return (OS_os_log *)v2;
}

+ (OS_os_log)ClientChannelManager
{
  if (qword_1E944F0F8 != -1) {
    dispatch_once(&qword_1E944F0F8, &unk_1EEFCDEF8);
  }
  v2 = (void *)qword_1E944F0F0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)IDSFirewall
{
  if (qword_1E944F150 != -1) {
    dispatch_once(&qword_1E944F150, &unk_1EEFCDF18);
  }
  v2 = (void *)qword_1E944F148;
  return (OS_os_log *)v2;
}

+ (OS_os_log)NWPathUtils
{
  if (qword_1E944F8A8 != -1) {
    dispatch_once(&qword_1E944F8A8, &unk_1EEFCDF38);
  }
  v2 = (void *)qword_1E944F8A0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)GroupSessionKeyValueDelivery
{
  if (qword_1E944F8B8 != -1) {
    dispatch_once(&qword_1E944F8B8, &unk_1EEFCDF58);
  }
  v2 = (void *)qword_1E944F8B0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)System
{
  if (qword_1E944F8C8 != -1) {
    dispatch_once(&qword_1E944F8C8, &unk_1EEFCDFB8);
  }
  v2 = (void *)qword_1E944F8C0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)SimulatorProxy
{
  if (qword_1E944F8D8 != -1) {
    dispatch_once(&qword_1E944F8D8, &unk_1EEFCD298);
  }
  v2 = (void *)qword_1E944F8D0;
  return (OS_os_log *)v2;
}

+ (OS_os_log)ContactsUtilities
{
  if (qword_1E944F218 != -1) {
    dispatch_once(&qword_1E944F218, &unk_1EEFCDFF8);
  }
  v2 = (void *)qword_1E944F210;
  return (OS_os_log *)v2;
}

+ (OS_os_log)IDSPinnedIdentity
{
  if (qword_1E944F358 != -1) {
    dispatch_once(&qword_1E944F358, &unk_1EEFCE058);
  }
  v2 = (void *)qword_1E944F350;
  return (OS_os_log *)v2;
}

+ (OS_os_log)PeerLookup_DBCache
{
  if (qword_1E944F1F0 != -1) {
    dispatch_once(&qword_1E944F1F0, &unk_1EEFCD2B8);
  }
  v2 = (void *)qword_1E944F1E8;
  return (OS_os_log *)v2;
}

@end