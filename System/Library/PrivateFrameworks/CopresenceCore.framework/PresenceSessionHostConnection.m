@interface PresenceSessionHostConnection
- (void)joinWithCompletion:(id)a3;
- (void)leaveWithCompletion:(id)a3;
- (void)updateMembers:(id)a3 completion:(id)a4;
@end

@implementation PresenceSessionHostConnection

- (void)joinWithCompletion:(id)a3
{
}

- (void)leaveWithCompletion:(id)a3
{
}

- (void)updateMembers:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  type metadata accessor for TUHandle();
  _s8Dispatch0A13WorkItemFlagsVACs10SetAlgebraAAWlTm_4((unint64_t *)&lazy protocol witness table cache variable for type TUHandle and conformance NSObject, (void (*)(uint64_t))type metadata accessor for TUHandle);
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  v8 = self;
  PresenceSessionHostConnection.updateMembers(_:completion:)(v6, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> (), v7);

  swift_bridgeObjectRelease();
  swift_release();
}

@end