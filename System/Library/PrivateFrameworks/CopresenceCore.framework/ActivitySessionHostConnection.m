@interface ActivitySessionHostConnection
- (void)associateSceneWithSceneID:(id)a3;
- (void)disassociateScene;
- (void)end;
- (void)joinWithAudioSessionID:(id)a3 completion:(id)a4;
- (void)leaveWithCompletion:(id)a3;
- (void)logAttachmentEventWithReport:(id)a3 reportEvent:(id)a4;
- (void)postEventWithEvent:(id)a3;
- (void)presentSessionDismissalAlertWithAllowingCancellation:(BOOL)a3 completion:(id)a4;
- (void)requestEncryptionKeysFor:(id)a3;
- (void)requestEndpointWith:(id)a3 completion:(id)a4;
- (void)requestForegroundPresentation;
- (void)requestParticipantsFor:(id)a3 completion:(id)a4;
- (void)sendResourceAtURL:(id)a3 to:(id)a4 metadata:(id)a5 completion:(id)a6;
- (void)updateActivityWithActivity:(id)a3;
- (void)updateCapabilitiesWithCapabilities:(int64_t)a3;
@end

@implementation ActivitySessionHostConnection

- (void)joinWithAudioSessionID:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  ActivitySessionHostConnection.join(audioSessionID:completion:)(a3, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned PresenceSessionConnectionInfo?, @unowned NSError?) -> (), v7);

  swift_release();
}

- (void)leaveWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  ActivitySessionHostConnection.leave(completion:)((uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply, v5);

  swift_release();
}

- (void)end
{
  v2 = self;
  ActivitySessionHostConnection.end()();
}

- (void)postEventWithEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  ActivitySessionHostConnection.postEvent(event:)(v4);
}

- (void)logAttachmentEventWithReport:(id)a3 reportEvent:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  id v9 = a3;
  v10 = self;
  ActivitySessionHostConnection.logAttachmentEvent(report:reportEvent:)(v9, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)requestEncryptionKeysFor:(id)a3
{
  if (a3) {
    id v4 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    id v4 = 0;
  }
  uint64_t v5 = self;
  v7.value._rawValue = v4;
  ActivitySessionHostConnection.requestEncryptionKeys(for:)(v7);

  swift_bridgeObjectRelease();
}

- (void)requestParticipantsFor:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  uint64_t v8 = self;
  ActivitySessionHostConnection.requestParticipants(for:completion:)(v6, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSSet) -> (), v7);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)updateActivityWithActivity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  ActivitySessionHostConnection.updateActivity(activity:)(v4);
}

- (void)presentSessionDismissalAlertWithAllowingCancellation:(BOOL)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = self;
  ActivitySessionHostConnection.presentSessionDismissalAlert(allowingCancellation:completion:)(a3, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned ObjCBool) -> (), v7);

  swift_release();
}

- (void)requestForegroundPresentation
{
  v2 = self;
  ActivitySessionHostConnection.requestForegroundPresentation()();
}

- (void)associateSceneWithSceneID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  ActivitySessionHostConnection.associateScene(sceneID:)(v8);

  swift_bridgeObjectRelease();
}

- (void)disassociateScene
{
  v2 = self;
  ActivitySessionHostConnection.disassociateScene()();
}

- (void)sendResourceAtURL:(id)a3 to:(id)a4 metadata:(id)a5 completion:(id)a6
{
  id v9 = _Block_copy(a6);
  uint64_t v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  id v12 = a5;
  v13 = self;
  uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v16 = v15;

  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v9;
  ActivitySessionHostConnection.sendResource(atURL:to:metadata:completion:)(v11, v10, v14, v16, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> (), v17);
  swift_release();
  outlined consume of Data._Representation(v14, v16);

  swift_bridgeObjectRelease();
}

- (void)requestEndpointWith:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  uint64_t v10 = self;
  ActivitySessionHostConnection.requestEndpoint(with:completion:)(v6, v8, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSXPCListenerEndpoint?) -> (), v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)updateCapabilitiesWithCapabilities:(int64_t)a3
{
  uint64_t v4 = self;
  ActivitySessionHostConnection.updateCapabilities(capabilities:)(a3);
}

@end