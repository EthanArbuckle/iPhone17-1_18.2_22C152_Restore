@interface FaceTimeVoicemailManager
- (BOOL)isTranscriptionEnabled;
- (VMVoicemailManager)vmdVoiceMailManager;
- (void)deleteVoicemails:(NSArray *)a3 completion:(id)a4;
- (void)deleteVoicemails:(id)a3;
- (void)markVoicemailsAsRead:(NSArray *)a3 completion:(id)a4;
- (void)markVoicemailsAsRead:(id)a3;
- (void)messageStoreDidAddMessages:(id)a3;
- (void)messageStoreDidDeleteMessages:(id)a3;
- (void)messageStoreDidDeleteMessagesWithUUIDs:(id)a3;
- (void)messageStoreDidReconnect;
- (void)messageStoreDidUpdateMessages:(id)a3;
- (void)messageStoreRequiresRefetch;
- (void)messagesPassingTest:(id)a3 completion:;
- (void)removeVoicemailsFromTrash:(NSArray *)a3 completion:(id)a4;
- (void)removeVoicemailsFromTrash:(id)a3;
- (void)requestInitialStateIfNecessaryAndSendNotifications:(BOOL)a3;
- (void)trashVoicemails:(NSArray *)a3 completion:(id)a4;
- (void)trashVoicemails:(id)a3;
- (void)voicemailWithIdentifier:(MPMessageID *)a3 completion:(id)a4;
@end

@implementation FaceTimeVoicemailManager

- (void)requestInitialStateIfNecessaryAndSendNotifications:(BOOL)a3
{
  if (a3)
  {
    swift_retain();
    FaceTimeVoicemailManager.voicemailsChanged(messageChanges:)(0, 3);
    swift_release();
  }
}

- (void)voicemailWithIdentifier:(MPMessageID *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &async function pointer to partial apply for @objc closure #1 in FaceTimeVoicemailManager.message(for:);
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &_sIeghH_IeAgH_TRTA_236Tu;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v9, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_241Tu, (uint64_t)v14);
  swift_release();
}

- (void)messageStoreDidAddMessages:(id)a3
{
}

- (void)messageStoreDidUpdateMessages:(id)a3
{
}

- (void)messageStoreDidDeleteMessages:(id)a3
{
}

- (void)messageStoreDidDeleteMessagesWithUUIDs:(id)a3
{
}

- (void)messageStoreDidReconnect
{
}

- (void)messageStoreRequiresRefetch
{
}

- (BOOL)isTranscriptionEnabled
{
  return 1;
}

- (VMVoicemailManager)vmdVoiceMailManager
{
  return (VMVoicemailManager *)0;
}

- (void)deleteVoicemails:(NSArray *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &async function pointer to partial apply for @objc closure #1 in FaceTimeVoicemailManager.delete(_:);
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &_sIeghH_IeAgH_TRTA_185Tu;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v9, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_190Tu, (uint64_t)v14);
  swift_release();
}

- (void)markVoicemailsAsRead:(NSArray *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &async function pointer to partial apply for @objc closure #1 in FaceTimeVoicemailManager.markAsRead(_:);
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &_sIeghH_IeAgH_TRTA_170Tu;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v9, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_175Tu, (uint64_t)v14);
  swift_release();
}

- (void)trashVoicemails:(NSArray *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &async function pointer to partial apply for @objc closure #1 in FaceTimeVoicemailManager.moveToTrash(_:);
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &_sIeghH_IeAgH_TRTA_155Tu;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v9, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_160Tu, (uint64_t)v14);
  swift_release();
}

- (void)removeVoicemailsFromTrash:(NSArray *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &async function pointer to partial apply for @objc closure #1 in FaceTimeVoicemailManager.removeFromTrash(_:);
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &_sIeghH_IeAgH_TRTA_140Tu;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v9, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_145Tu, (uint64_t)v14);
  swift_release();
}

- (void)messagesPassingTest:(id)a3 completion:
{
  v4 = v3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a3);
  v11 = _Block_copy(v4);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = v10;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v9, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &async function pointer to partial apply for @objc closure #1 in FaceTimeVoicemailManager.messages(filteredBy:);
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &_sIeghH_IeAgH_TRTATu;
  v15[5] = v14;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v9, (uint64_t)&_sIeAgH_ytIeAgHr_TRTATu, (uint64_t)v15);
  swift_release();
}

- (void)deleteVoicemails:(id)a3
{
}

- (void)markVoicemailsAsRead:(id)a3
{
}

- (void)trashVoicemails:(id)a3
{
}

- (void)removeVoicemailsFromTrash:(id)a3
{
}

@end