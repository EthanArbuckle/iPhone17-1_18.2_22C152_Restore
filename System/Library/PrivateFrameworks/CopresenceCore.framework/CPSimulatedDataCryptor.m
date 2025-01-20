@interface CPSimulatedDataCryptor
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (CPSimulatedDataCryptor)init;
- (CPSimulatedDataCryptor)initWithCoder:(id)a3;
- (NSArray)decryptionKeyIDSet;
- (NSUUID)encryptionKeyID;
- (id)decryptData:(id)a3 keyID:(id)a4 seqNum:(unint64_t)a5 error:(id *)a6;
- (id)encryptData:(id)a3 seqNum:(unint64_t)a4 error:(id *)a5;
- (void)setDecryptionKeyIDSet:(id)a3;
- (void)setEncryptionKeyID:(id)a3;
@end

@implementation CPSimulatedDataCryptor

- (NSUUID)encryptionKeyID
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR___CPSimulatedDataCryptor_encryptionKeyID;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8.super.isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)v8.super.isa;
}

- (void)setEncryptionKeyID:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  NSUUID v8 = (char *)self + OBJC_IVAR___CPSimulatedDataCryptor_encryptionKeyID;
  swift_beginAccess();
  v9 = *(void (**)(char *, char *, uint64_t))(v5 + 40);
  uint64_t v10 = self;
  v9(v8, v7, v4);
  swift_endAccess();
}

- (NSArray)decryptionKeyIDSet
{
  swift_beginAccess();
  type metadata accessor for UUID();
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v2.super.isa;
}

- (void)setDecryptionKeyIDSet:(id)a3
{
  type metadata accessor for UUID();
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR___CPSimulatedDataCryptor_decryptionKeyIDSet);
  swift_beginAccess();
  *uint64_t v5 = v4;
  swift_bridgeObjectRelease();
}

- (id)encryptData:(id)a3 seqNum:(unint64_t)a4 error:(id *)a5
{
  if (a3)
  {
    id v6 = self;
    id v7 = a3;
    uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v10 = v9;

    v11.super.isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data._Representation(v8, v10);
    return v11.super.isa;
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (id)decryptData:(id)a3 keyID:(id)a4 seqNum:(unint64_t)a5 error:(id *)a6
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1F4188790](v9 - 8);
  NSData v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    id v12 = a4;
    v13 = self;
    id v14 = a3;
    a3 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v16 = v15;

    if (a4)
    {
LABEL_3:
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v17 = type metadata accessor for UUID();
      id result = (id)(*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 0, 1, v17);
      goto LABEL_6;
    }
  }
  else
  {
    id v19 = a4;
    v20 = self;
    unint64_t v16 = 0xF000000000000000;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v21 = type metadata accessor for UUID();
  id result = (id)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v11, 1, 1, v21);
LABEL_6:
  if (v16 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    outlined copy of Data._Representation((uint64_t)a3, v16);
    outlined destroy of UUID?((uint64_t)v11);

    outlined consume of Data?((uint64_t)a3, v16);
    v22.super.isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data?((uint64_t)a3, v16);
    return v22.super.isa;
  }
  return result;
}

- (CPSimulatedDataCryptor)init
{
  NSArray v2 = self;
  UUID.init()();
  uint64_t v3 = OBJC_IVAR___CPSimulatedDataCryptor_decryptionKeyIDSet;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UUID>);
  type metadata accessor for UUID();
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1B1138A80;
  UUID.init()();
  *(Class *)((char *)&v2->super.isa + v3) = (Class)v4;

  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for SimulatedDataCryptor();
  return [(CPSimulatedDataCryptor *)&v6 init];
}

+ (BOOL)supportsSecureCoding
{
  return static SimulatedDataCryptor.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static SimulatedDataCryptor.supportsSecureCoding = a3;
}

- (CPSimulatedDataCryptor)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  UUID.init()();
  uint64_t v6 = OBJC_IVAR___CPSimulatedDataCryptor_decryptionKeyIDSet;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UUID>);
  type metadata accessor for UUID();
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1B1138A80;
  UUID.init()();
  *(Class *)((char *)&v5->super.isa + v6) = (Class)v7;

  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for SimulatedDataCryptor();
  uint64_t v8 = [(CPSimulatedDataCryptor *)&v10 init];

  return v8;
}

- (void).cxx_destruct
{
  NSArray v2 = (char *)self + OBJC_IVAR___CPSimulatedDataCryptor_encryptionKeyID;
  uint64_t v3 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

@end