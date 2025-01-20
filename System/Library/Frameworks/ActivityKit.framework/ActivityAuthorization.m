@interface ActivityAuthorization
- (BOOL)areActivitiesEnabledForBundleId:(id)a3;
- (BOOL)areFrequentPushesEnabledFor:(id)a3;
- (BOOL)clearActivityAuthorizationFor:(id)a3 error:(id *)a4;
- (BOOL)setActivitiesWithEnabled:(BOOL)a3 for:(id)a4 source:(int64_t)a5 error:(id *)a6;
- (BOOL)setActivitiesWithEnabled:(BOOL)a3 forBundleId:(id)a4 error:(id *)a5;
- (BOOL)setFrequentPushesWithEnabled:(BOOL)a3 for:(id)a4 error:(id *)a5;
- (_TtC11ActivityKit21ActivityAuthorization)init;
@end

@implementation ActivityAuthorization

- (_TtC11ActivityKit21ActivityAuthorization)init
{
  return (_TtC11ActivityKit21ActivityAuthorization *)ActivityAuthorization.init()();
}

- (BOOL)setActivitiesWithEnabled:(BOOL)a3 forBundleId:(id)a4 error:(id *)a5
{
  return sub_242F3CD30(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t, uint64_t))sub_242F3C1E8);
}

- (BOOL)setActivitiesWithEnabled:(BOOL)a3 for:(id)a4 source:(int64_t)a5 error:(id *)a6
{
  uint64_t v9 = sub_242FDC0D0();
  uint64_t v11 = v10;
  v12 = self;
  sub_242F3C2E4(a3, v9, v11, a5);
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)clearActivityAuthorizationFor:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_242FDC0D0();
  uint64_t v7 = v6;
  v8 = (os_unfair_lock_s *)(*(void **)((char *)&self->super.isa
                                       + OBJC_IVAR____TtC11ActivityKit21ActivityAuthorization_lock))[2];
  uint64_t v9 = self;
  os_unfair_lock_lock(v8);
  uint64_t v10 = (char *)v9 + OBJC_IVAR____TtC11ActivityKit21ActivityAuthorization_authorizationClient;
  uint64_t v11 = MEMORY[0x245671DD0]((char *)v9 + OBJC_IVAR____TtC11ActivityKit21ActivityAuthorization_authorizationClient);
  if (v11)
  {
    uint64_t v12 = *((void *)v10 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(v5, v7, ObjectType, v12);
    swift_unknownObjectRelease();
    os_unfair_lock_unlock(v8);
    swift_bridgeObjectRelease();

    LOBYTE(v11) = 1;
  }
  else
  {
    __break(1u);
  }
  return v11;
}

- (BOOL)areActivitiesEnabledForBundleId:(id)a3
{
  uint64_t v4 = sub_242FDC0D0();
  uint64_t v6 = v5;
  uint64_t v7 = (os_unfair_lock_s *)(*(void **)((char *)&self->super.isa
                                       + OBJC_IVAR____TtC11ActivityKit21ActivityAuthorization_lock))[2];
  v8 = self;
  os_unfair_lock_lock(v7);
  uint64_t v9 = (char *)v8 + OBJC_IVAR____TtC11ActivityKit21ActivityAuthorization_authorizationClient;
  uint64_t v10 = MEMORY[0x245671DD0]((char *)v8 + OBJC_IVAR____TtC11ActivityKit21ActivityAuthorization_authorizationClient);
  if (v10)
  {
    uint64_t v11 = *((void *)v9 + 1);
    uint64_t ObjectType = swift_getObjectType();
    char v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 40))(v4, v6, ObjectType, v11);
    swift_unknownObjectRelease();
    os_unfair_lock_unlock(v7);

    swift_bridgeObjectRelease();
    LOBYTE(v10) = v13 & 1;
  }
  else
  {
    __break(1u);
  }
  return v10;
}

- (BOOL)areFrequentPushesEnabledFor:(id)a3
{
  uint64_t v4 = sub_242FDC0D0();
  uint64_t v6 = v5;
  uint64_t v7 = (os_unfair_lock_s *)(*(void **)((char *)&self->super.isa
                                       + OBJC_IVAR____TtC11ActivityKit21ActivityAuthorization_lock))[2];
  v8 = self;
  os_unfair_lock_lock(v7);
  uint64_t v9 = (char *)v8 + OBJC_IVAR____TtC11ActivityKit21ActivityAuthorization_authorizationClient;
  uint64_t v10 = MEMORY[0x245671DD0]((char *)v8 + OBJC_IVAR____TtC11ActivityKit21ActivityAuthorization_authorizationClient);
  if (v10)
  {
    uint64_t v11 = *((void *)v9 + 1);
    uint64_t ObjectType = swift_getObjectType();
    char v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 88))(v4, v6, ObjectType, v11);
    swift_unknownObjectRelease();
    os_unfair_lock_unlock(v7);

    swift_bridgeObjectRelease();
    LOBYTE(v10) = v13 & 1;
  }
  else
  {
    __break(1u);
  }
  return v10;
}

- (BOOL)setFrequentPushesWithEnabled:(BOOL)a3 for:(id)a4 error:(id *)a5
{
  return sub_242F3CD30(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t, uint64_t))sub_242F3CC34);
}

- (void).cxx_destruct
{
  sub_242F3D0EC((uint64_t)self + OBJC_IVAR____TtC11ActivityKit21ActivityAuthorization_authorizationClient);

  swift_release();
}

@end