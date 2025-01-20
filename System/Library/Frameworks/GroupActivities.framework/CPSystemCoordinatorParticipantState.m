@interface CPSystemCoordinatorParticipantState
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CPSystemCoordinatorParticipantState)init;
- (CPSystemCoordinatorParticipantState)initWithCoder:(id)a3;
- (NSString)description;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPSystemCoordinatorParticipantState

- (BOOL)isEqual:(id)a3
{
  return @objc SystemCoordinatorState.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))SystemCoordinatorState.ParticipantState.isEqual(_:));
}

- (int64_t)hash
{
  v2 = self;
  Swift::Int v3 = SystemCoordinatorState.ParticipantState.hash.getter();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  SystemCoordinatorState.ParticipantState.encode(with:)((NSCoder)v4);
}

- (CPSystemCoordinatorParticipantState)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (CPSystemCoordinatorParticipantState *)specialized SystemCoordinatorState.ParticipantState.init(coder:)(v3);

  return v4;
}

- (NSString)description
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1A38FAF40;
  *(void *)(v3 + 32) = swift_getKeyPath();
  *(void *)(v3 + 40) = swift_getKeyPath();
  *(void *)(v3 + 48) = swift_getKeyPath();
  *(void *)(v3 + 56) = swift_getKeyPath();
  specialized Array._endMutation()();
  uint64_t v4 = specialized String.init<A>(describing:in:)(v3, self);
  v5 = (void *)MEMORY[0x1A624DFA0](v4);
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (CPSystemCoordinatorParticipantState)init
{
  result = (CPSystemCoordinatorParticipantState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CPSystemCoordinatorParticipantState_xpcWrappedSeat);
}

@end