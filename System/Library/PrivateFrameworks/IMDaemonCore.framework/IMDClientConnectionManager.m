@interface IMDClientConnectionManager
- (IMDClientConnectionManager)init;
- (IMDaemonListenerAVProtocol)broadcasterForACConferenceListeners;
- (IMDaemonListenerAVProtocol)broadcasterForAVConferenceListeners;
- (IMDaemonListenerAccountsProtocol)broadcasterForAccountListeners;
- (IMDaemonListenerAnyProtocol)broadcasterForAllListeners;
- (IMDaemonListenerChatCountsProtocol)broadcasterForChatCountsListeners;
- (IMDaemonListenerChatDatabaseProtocol)broadcasterForChatDatabaseListeners;
- (IMDaemonListenerChatProtocol)broadcasterForBlackholeChatListeners;
- (IMDaemonListenerChatProtocol)broadcasterForChatListeners;
- (IMDaemonListenerCloudSyncProtocol)broadcasterForCloudSyncListeners;
- (IMDaemonListenerCollaborationProtocol)broadcasterForCollaborationListeners;
- (IMDaemonListenerFileProviderProtocol)broadcasterForFileProviderListeners;
- (IMDaemonListenerFileTransfersProtocol)broadcasterForFileTransferListeners;
- (IMDaemonListenerKeyTransparencyProtocol)broadcasterForKeyTransparencyListeners;
- (IMDaemonListenerSyncedSettingsProtocol)broadcasterForSyncedSettingsListeners;
- (id)broadcasterForACConferenceListenersSupportingService:(id)a3;
- (id)broadcasterForAVConferenceListenersSupportingService:(id)a3;
- (id)broadcasterForBlackholeChatListenersSupportingService:(id)a3;
- (id)broadcasterForChatListenersSupportingService:(id)a3;
- (id)broadcasterForChatListenersUsingBlackholeRegistry:(BOOL)a3;
- (id)broadcasterForCollaborationListenersSupportingService:(id)a3;
- (id)broadcasterForListenersSupportingService:(id)a3;
- (id)broadcasterForNotificationListenersSupportingService:(id)a3;
- (id)broadcasterForSentMessageListenersSupportingService:(id)a3;
- (id)broadcasterForVCConferenceListenersSupportingService:(id)a3;
@end

@implementation IMDClientConnectionManager

- (IMDaemonListenerAnyProtocol)broadcasterForAllListeners
{
  v3 = (void *)swift_allocObject();
  v3[2] = 0;
  v3[3] = self;
  v3[4] = 0;
  v3[5] = 0;
  id v4 = objc_allocWithZone(MEMORY[0x1E4F6E7E8]);
  aBlock[4] = sub_1D968543C;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D9685248;
  aBlock[3] = &unk_1F3395468;
  v5 = _Block_copy(aBlock);
  v6 = self;
  objc_msgSend(v4, sel_initWithProtocol_forwardingHandler_, &unk_1F342B228, v5);
  _Block_release(v5);
  swift_release();
  v7 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return (IMDaemonListenerAnyProtocol *)v7;
}

- (IMDaemonListenerCloudSyncProtocol)broadcasterForCloudSyncListeners
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = 0;
  *(void *)(v3 + 24) = self;
  *(_OWORD *)(v3 + 32) = xmmword_1D991F8D0;
  id v4 = objc_allocWithZone(MEMORY[0x1E4F6E7E8]);
  aBlock[4] = sub_1D968543C;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D9685248;
  aBlock[3] = &unk_1F33953C8;
  v5 = _Block_copy(aBlock);
  v6 = self;
  objc_msgSend(v4, sel_initWithProtocol_forwardingHandler_, &unk_1F342B228, v5);
  _Block_release(v5);
  swift_release();
  v7 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return (IMDaemonListenerCloudSyncProtocol *)v7;
}

- (IMDClientConnectionManager)init
{
  result = (IMDClientConnectionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR___IMDClientConnectionManager_broadcastingQueue;
  uint64_t v4 = sub_1D9906930();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (IMDaemonListenerAccountsProtocol)broadcasterForAccountListeners
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = 0;
  *(void *)(v3 + 24) = self;
  *(_OWORD *)(v3 + 32) = xmmword_1D991F8C0;
  id v4 = objc_allocWithZone(MEMORY[0x1E4F6E7E8]);
  aBlock[4] = sub_1D968543C;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D9685248;
  aBlock[3] = &unk_1F3395418;
  v5 = _Block_copy(aBlock);
  v6 = self;
  objc_msgSend(v4, sel_initWithProtocol_forwardingHandler_, &unk_1F342B228, v5);
  _Block_release(v5);
  swift_release();
  v7 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return (IMDaemonListenerAccountsProtocol *)v7;
}

- (IMDaemonListenerFileTransfersProtocol)broadcasterForFileTransferListeners
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = 0;
  *(void *)(v3 + 24) = self;
  *(_OWORD *)(v3 + 32) = xmmword_1D991F8E0;
  id v4 = objc_allocWithZone(MEMORY[0x1E4F6E7E8]);
  aBlock[4] = sub_1D968543C;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D9685248;
  aBlock[3] = &unk_1F3395378;
  v5 = _Block_copy(aBlock);
  v6 = self;
  objc_msgSend(v4, sel_initWithProtocol_forwardingHandler_, &unk_1F342B228, v5);
  _Block_release(v5);
  swift_release();
  v7 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return (IMDaemonListenerFileTransfersProtocol *)v7;
}

- (id)broadcasterForListenersSupportingService:(id)a3
{
  v5 = (void *)swift_allocObject();
  v5[2] = a3;
  v5[3] = self;
  v5[4] = 0;
  v5[5] = 0;
  id v6 = objc_allocWithZone(MEMORY[0x1E4F6E7E8]);
  aBlock[4] = sub_1D968543C;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D9685248;
  aBlock[3] = &unk_1F3395328;
  v7 = _Block_copy(aBlock);
  id v8 = a3;
  v9 = self;
  id v10 = v8;
  v11 = v9;
  objc_msgSend(v6, sel_initWithProtocol_forwardingHandler_, &unk_1F342B228, v7);
  _Block_release(v7);
  swift_release();
  v12 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return v12;
}

- (IMDaemonListenerKeyTransparencyProtocol)broadcasterForKeyTransparencyListeners
{
  return (IMDaemonListenerKeyTransparencyProtocol *)sub_1D98ECE5C(self, (uint64_t)a2, (uint64_t)&unk_1F33952C0, (uint64_t)sub_1D968543C, (uint64_t)&unk_1F33952D8);
}

- (IMDaemonListenerChatProtocol)broadcasterForChatListeners
{
  return (IMDaemonListenerChatProtocol *)sub_1D98ECE5C(self, (uint64_t)a2, (uint64_t)&unk_1F3395270, (uint64_t)sub_1D968543C, (uint64_t)&unk_1F3395288);
}

- (id)broadcasterForChatListenersSupportingService:(id)a3
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a3;
  *(void *)(v5 + 24) = self;
  *(_OWORD *)(v5 + 32) = xmmword_1D991F8F0;
  id v6 = objc_allocWithZone(MEMORY[0x1E4F6E7E8]);
  aBlock[4] = sub_1D968543C;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D9685248;
  aBlock[3] = &unk_1F3395238;
  v7 = _Block_copy(aBlock);
  id v8 = a3;
  v9 = self;
  id v10 = v8;
  v11 = v9;
  objc_msgSend(v6, sel_initWithProtocol_forwardingHandler_, &unk_1F342B228, v7);
  _Block_release(v7);
  swift_release();
  v12 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return v12;
}

- (id)broadcasterForSentMessageListenersSupportingService:(id)a3
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a3;
  *(void *)(v5 + 24) = self;
  *(_OWORD *)(v5 + 32) = xmmword_1D991F900;
  id v6 = objc_allocWithZone(MEMORY[0x1E4F6E7E8]);
  aBlock[4] = sub_1D968543C;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D9685248;
  aBlock[3] = &unk_1F33951E8;
  v7 = _Block_copy(aBlock);
  id v8 = a3;
  v9 = self;
  id v10 = v8;
  v11 = v9;
  objc_msgSend(v6, sel_initWithProtocol_forwardingHandler_, &unk_1F342B228, v7);
  _Block_release(v7);
  swift_release();
  v12 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return v12;
}

- (IMDaemonListenerChatProtocol)broadcasterForBlackholeChatListeners
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = 0;
  *(void *)(v3 + 24) = self;
  *(_OWORD *)(v3 + 32) = xmmword_1D991F910;
  id v4 = objc_allocWithZone(MEMORY[0x1E4F6E7E8]);
  aBlock[4] = sub_1D968543C;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D9685248;
  aBlock[3] = &unk_1F3395198;
  uint64_t v5 = _Block_copy(aBlock);
  id v6 = self;
  objc_msgSend(v4, sel_initWithProtocol_forwardingHandler_, &unk_1F342B228, v5);
  _Block_release(v5);
  swift_release();
  v7 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return (IMDaemonListenerChatProtocol *)v7;
}

- (id)broadcasterForBlackholeChatListenersSupportingService:(id)a3
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a3;
  *(void *)(v5 + 24) = self;
  *(_OWORD *)(v5 + 32) = xmmword_1D991F910;
  id v6 = objc_allocWithZone(MEMORY[0x1E4F6E7E8]);
  aBlock[4] = sub_1D968543C;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D9685248;
  aBlock[3] = &unk_1F3395148;
  v7 = _Block_copy(aBlock);
  id v8 = a3;
  v9 = self;
  id v10 = v8;
  v11 = v9;
  objc_msgSend(v6, sel_initWithProtocol_forwardingHandler_, &unk_1F342B228, v7);
  _Block_release(v7);
  swift_release();
  v12 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return v12;
}

- (id)broadcasterForChatListenersUsingBlackholeRegistry:(BOOL)a3
{
  id v4 = self;
  uint64_t v5 = (void *)ClientConnectionManager.broadcasterForChatListeners(usingBlackholeRegistry:)(a3);

  return v5;
}

- (IMDaemonListenerChatDatabaseProtocol)broadcasterForChatDatabaseListeners
{
  v2 = self;
  uint64_t v3 = (void *)ClientConnectionManager.broadcasterForChatDatabaseListeners.getter();

  return (IMDaemonListenerChatDatabaseProtocol *)v3;
}

- (IMDaemonListenerChatCountsProtocol)broadcasterForChatCountsListeners
{
  v2 = self;
  uint64_t v3 = (void *)ClientConnectionManager.broadcasterForChatCountsListeners.getter();

  return (IMDaemonListenerChatCountsProtocol *)v3;
}

- (IMDaemonListenerFileProviderProtocol)broadcasterForFileProviderListeners
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = 0;
  *(void *)(v3 + 24) = self;
  *(_OWORD *)(v3 + 32) = xmmword_1D991F940;
  id v4 = objc_allocWithZone(MEMORY[0x1E4F6E7E8]);
  aBlock[4] = sub_1D968543C;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D9685248;
  aBlock[3] = &unk_1F33950F8;
  uint64_t v5 = _Block_copy(aBlock);
  id v6 = self;
  objc_msgSend(v4, sel_initWithProtocol_forwardingHandler_, &unk_1F342B228, v5);
  _Block_release(v5);
  swift_release();
  v7 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return (IMDaemonListenerFileProviderProtocol *)v7;
}

- (id)broadcasterForNotificationListenersSupportingService:(id)a3
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a3;
  *(void *)(v5 + 24) = self;
  *(_OWORD *)(v5 + 32) = xmmword_1D991F8C0;
  id v6 = objc_allocWithZone(MEMORY[0x1E4F6E7E8]);
  aBlock[4] = sub_1D968543C;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D9685248;
  aBlock[3] = &unk_1F33950A8;
  v7 = _Block_copy(aBlock);
  id v8 = a3;
  v9 = self;
  id v10 = v8;
  v11 = v9;
  objc_msgSend(v6, sel_initWithProtocol_forwardingHandler_, &unk_1F342B228, v7);
  _Block_release(v7);
  swift_release();
  v12 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return v12;
}

- (id)broadcasterForAVConferenceListenersSupportingService:(id)a3
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a3;
  *(void *)(v5 + 24) = self;
  *(_OWORD *)(v5 + 32) = xmmword_1D991F950;
  id v6 = objc_allocWithZone(MEMORY[0x1E4F6E7E8]);
  aBlock[4] = sub_1D968543C;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D9685248;
  aBlock[3] = &unk_1F3395058;
  v7 = _Block_copy(aBlock);
  id v8 = a3;
  v9 = self;
  id v10 = v8;
  v11 = v9;
  objc_msgSend(v6, sel_initWithProtocol_forwardingHandler_, &unk_1F342B228, v7);
  _Block_release(v7);
  swift_release();
  v12 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return v12;
}

- (id)broadcasterForACConferenceListenersSupportingService:(id)a3
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a3;
  *(void *)(v5 + 24) = self;
  *(_OWORD *)(v5 + 32) = xmmword_1D991F960;
  id v6 = objc_allocWithZone(MEMORY[0x1E4F6E7E8]);
  aBlock[4] = sub_1D968543C;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D9685248;
  aBlock[3] = &unk_1F3395008;
  v7 = _Block_copy(aBlock);
  id v8 = a3;
  v9 = self;
  id v10 = v8;
  v11 = v9;
  objc_msgSend(v6, sel_initWithProtocol_forwardingHandler_, &unk_1F342B228, v7);
  _Block_release(v7);
  swift_release();
  v12 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return v12;
}

- (id)broadcasterForVCConferenceListenersSupportingService:(id)a3
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a3;
  *(void *)(v5 + 24) = self;
  *(_OWORD *)(v5 + 32) = xmmword_1D991F970;
  id v6 = objc_allocWithZone(MEMORY[0x1E4F6E7E8]);
  aBlock[4] = sub_1D968543C;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D9685248;
  aBlock[3] = &unk_1F3394FB8;
  v7 = _Block_copy(aBlock);
  id v8 = a3;
  v9 = self;
  id v10 = v8;
  v11 = v9;
  objc_msgSend(v6, sel_initWithProtocol_forwardingHandler_, &unk_1F342B228, v7);
  _Block_release(v7);
  swift_release();
  v12 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return v12;
}

- (IMDaemonListenerAVProtocol)broadcasterForAVConferenceListeners
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = 0;
  *(void *)(v3 + 24) = self;
  *(_OWORD *)(v3 + 32) = xmmword_1D991F950;
  id v4 = objc_allocWithZone(MEMORY[0x1E4F6E7E8]);
  aBlock[4] = sub_1D968543C;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D9685248;
  aBlock[3] = &unk_1F3394F68;
  uint64_t v5 = _Block_copy(aBlock);
  id v6 = self;
  objc_msgSend(v4, sel_initWithProtocol_forwardingHandler_, &unk_1F342B228, v5);
  _Block_release(v5);
  swift_release();
  v7 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return (IMDaemonListenerAVProtocol *)v7;
}

- (IMDaemonListenerAVProtocol)broadcasterForACConferenceListeners
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = 0;
  *(void *)(v3 + 24) = self;
  *(_OWORD *)(v3 + 32) = xmmword_1D991F960;
  id v4 = objc_allocWithZone(MEMORY[0x1E4F6E7E8]);
  aBlock[4] = sub_1D968543C;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D9685248;
  aBlock[3] = &unk_1F3394F18;
  uint64_t v5 = _Block_copy(aBlock);
  id v6 = self;
  objc_msgSend(v4, sel_initWithProtocol_forwardingHandler_, &unk_1F342B228, v5);
  _Block_release(v5);
  swift_release();
  v7 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return (IMDaemonListenerAVProtocol *)v7;
}

- (IMDaemonListenerSyncedSettingsProtocol)broadcasterForSyncedSettingsListeners
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = 0;
  *(void *)(v3 + 24) = self;
  *(_OWORD *)(v3 + 32) = xmmword_1D991F980;
  id v4 = objc_allocWithZone(MEMORY[0x1E4F6E7E8]);
  aBlock[4] = sub_1D968543C;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D9685248;
  aBlock[3] = &unk_1F3394EC8;
  uint64_t v5 = _Block_copy(aBlock);
  id v6 = self;
  objc_msgSend(v4, sel_initWithProtocol_forwardingHandler_, &unk_1F342B228, v5);
  _Block_release(v5);
  swift_release();
  v7 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return (IMDaemonListenerSyncedSettingsProtocol *)v7;
}

- (id)broadcasterForCollaborationListenersSupportingService:(id)a3
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a3;
  *(void *)(v5 + 24) = self;
  *(_OWORD *)(v5 + 32) = xmmword_1D991F990;
  id v6 = objc_allocWithZone(MEMORY[0x1E4F6E7E8]);
  aBlock[4] = sub_1D968543C;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D9685248;
  aBlock[3] = &unk_1F3394E78;
  v7 = _Block_copy(aBlock);
  id v8 = a3;
  v9 = self;
  id v10 = v8;
  v11 = v9;
  objc_msgSend(v6, sel_initWithProtocol_forwardingHandler_, &unk_1F342B228, v7);
  _Block_release(v7);
  swift_release();
  v12 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return v12;
}

- (IMDaemonListenerCollaborationProtocol)broadcasterForCollaborationListeners
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = 0;
  *(void *)(v3 + 24) = self;
  *(_OWORD *)(v3 + 32) = xmmword_1D991F990;
  id v4 = objc_allocWithZone(MEMORY[0x1E4F6E7E8]);
  aBlock[4] = sub_1D968543C;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D9685248;
  aBlock[3] = &unk_1F3394E28;
  uint64_t v5 = _Block_copy(aBlock);
  id v6 = self;
  objc_msgSend(v4, sel_initWithProtocol_forwardingHandler_, &unk_1F342B228, v5);
  _Block_release(v5);
  swift_release();
  v7 = (void *)swift_dynamicCastObjCProtocolUnconditional();

  return (IMDaemonListenerCollaborationProtocol *)v7;
}

@end