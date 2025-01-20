@interface MapsSyncMutableAnonymousCredential
- (NSData)anonymousId;
- (NSData)mapsToken;
- (NSDate)mapsTokenCreatedAt;
- (_TtC8MapsSync34MapsSyncMutableAnonymousCredential)initWithProxyObject:(id)a3;
- (unint64_t)mapsTokenTTL;
- (void)setAnonymousId:(id)a3;
- (void)setMapsToken:(id)a3;
- (void)setMapsTokenCreatedAt:(id)a3;
- (void)setMapsTokenTTL:(unint64_t)a3;
@end

@implementation MapsSyncMutableAnonymousCredential

- (_TtC8MapsSync34MapsSyncMutableAnonymousCredential)initWithProxyObject:(id)a3
{
  type metadata accessor for MapsSyncManagedAnonymousCredential();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnonymousCredential__proxyObject) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  id v5 = a3;
  return [(MapsSyncMutableBaseItem *)&v7 init];
}

- (NSData)anonymousId
{
  return (NSData *)sub_1A704FD74((char *)self, (uint64_t)a2, (SEL *)&selRef_anonymousId);
}

- (void)setAnonymousId:(id)a3
{
}

- (NSData)mapsToken
{
  return (NSData *)sub_1A704FD74((char *)self, (uint64_t)a2, (SEL *)&selRef_mapsToken);
}

- (void)setMapsToken:(id)a3
{
}

- (NSDate)mapsTokenCreatedAt
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  uint64_t v4 = MEMORY[0x1F4188790](v3 - 8);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  v8 = (char *)&v17 - v7;
  v9 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnonymousCredential__proxyObject);
  v10 = self;
  id v11 = objc_msgSend(v9, sel_mapsTokenCreatedAt);
  if (v11)
  {
    v12 = v11;
    sub_1A709D1D8();

    uint64_t v13 = sub_1A709D1F8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v6, 0, 1, v13);
  }
  else
  {
    uint64_t v13 = sub_1A709D1F8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v6, 1, 1, v13);
  }
  sub_1A6F0EF6C((uint64_t)v6, (uint64_t)v8);

  sub_1A709D1F8();
  uint64_t v14 = *(void *)(v13 - 8);
  v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v8, 1, v13) != 1)
  {
    v15 = (void *)sub_1A709D1B8();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v13);
  }
  return (NSDate *)v15;
}

- (void)setMapsTokenCreatedAt:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1A709D1D8();
    uint64_t v8 = sub_1A709D1F8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_1A709D1F8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  sub_1A70505E0((uint64_t)v7);
}

- (unint64_t)mapsTokenTTL
{
  return (unint64_t)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnonymousCredential__proxyObject), sel_mapsTokenTTL);
}

- (void)setMapsTokenTTL:(unint64_t)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8MapsSync34MapsSyncMutableAnonymousCredential__proxyObject));
}

@end