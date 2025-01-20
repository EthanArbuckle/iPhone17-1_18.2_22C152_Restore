@interface MigratorConfig
- (BOOL)isDataSeparated;
- (BOOL)shouldPrepareForBackgroundRestore;
- (BOOL)shouldRegisterSafeHarbors;
- (BOOL)shouldResetTetheredSyncAnchors;
- (MBServiceAccount)account;
- (NSString)description;
- (NSString)placeholderRestoreDirectory;
- (NSString)safeHarborDirectory;
- (NSURL)demotedAppsPlist;
- (NSURL)migratorCacheURL;
- (_TtC18RestorePostProcess14MigratorConfig)init;
- (_TtC18RestorePostProcess14MigratorConfig)initWithDataSeparatedAccount:(id)a3;
- (_TtC18RestorePostProcess14MigratorConfig)initWithPersonaID:(id)a3 didRestoreFromBackup:(BOOL)a4 didRestoreFromCloudBackup:(BOOL)a5 error:(id *)a6;
@end

@implementation MigratorConfig

- (NSString)safeHarborDirectory
{
  sub_19F90();
  NSString v2 = sub_19F80();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)placeholderRestoreDirectory
{
  NSString v2 = (char *)self + OBJC_IVAR____TtC18RestorePostProcess14MigratorConfig_state;
  if (self->state[OBJC_IVAR____TtC18RestorePostProcess14MigratorConfig_state + 8] == 1)
  {
    v4 = *(void **)v2;
    v3 = (void *)*((void *)v2 + 1);
    v5 = self;
    sub_16B48(v4, v3, 1);
    id v6 = [v4 persona];
    id v7 = [v6 placeholderRestoreDirectory];

    sub_19F90();
    sub_16B78(v4, v3, 1);
  }
  NSString v8 = sub_19F80();
  swift_bridgeObjectRelease();

  return (NSString *)v8;
}

- (NSURL)migratorCacheURL
{
  sub_173AC(&qword_2E888);
  __chkstk_darwin();
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18RestorePostProcess14MigratorConfig_state);
  id v6 = *(void **)&self->state[OBJC_IVAR____TtC18RestorePostProcess14MigratorConfig_state];
  char v7 = self->state[OBJC_IVAR____TtC18RestorePostProcess14MigratorConfig_state + 8];
  NSString v8 = self;
  sub_15D38(v5, v6, v7, (uint64_t)v4);

  uint64_t v9 = sub_19F40();
  uint64_t v10 = *(void *)(v9 - 8);
  v12 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v4, 1, v9) != 1)
  {
    sub_19F00(v11);
    v12 = v13;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v4, v9);
  }

  return (NSURL *)v12;
}

- (NSURL)demotedAppsPlist
{
  uint64_t v3 = sub_19F40();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  id v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v7 = self;
  sub_16608();

  sub_19F00(v8);
  uint64_t v10 = v9;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (NSURL *)v10;
}

- (MBServiceAccount)account
{
  if (self->state[OBJC_IVAR____TtC18RestorePostProcess14MigratorConfig_state + 8] == 1) {
    id v2 = *(id *)((char *)&self->super.isa + OBJC_IVAR____TtC18RestorePostProcess14MigratorConfig_state);
  }
  else {
    id v2 = 0;
  }

  return (MBServiceAccount *)v2;
}

- (BOOL)shouldPrepareForBackgroundRestore
{
  return self->state[OBJC_IVAR____TtC18RestorePostProcess14MigratorConfig_state + 8] == 0;
}

- (BOOL)shouldResetTetheredSyncAnchors
{
  return self->state[OBJC_IVAR____TtC18RestorePostProcess14MigratorConfig_state + 8] != 1;
}

- (BOOL)isDataSeparated
{
  if (self->state[OBJC_IVAR____TtC18RestorePostProcess14MigratorConfig_state + 8] != 1) {
    return 0;
  }
  id v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18RestorePostProcess14MigratorConfig_state);
  uint64_t v3 = self;
  id v4 = [v2 persona];
  unsigned __int8 v5 = [v4 isDataSeparatedPersona];

  return v5;
}

- (BOOL)shouldRegisterSafeHarbors
{
  return self->state[OBJC_IVAR____TtC18RestorePostProcess14MigratorConfig_state + 8] != 1;
}

- (NSString)description
{
  id v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18RestorePostProcess14MigratorConfig_state);
  uint64_t v3 = *(void **)&self->state[OBJC_IVAR____TtC18RestorePostProcess14MigratorConfig_state];
  char v4 = self->state[OBJC_IVAR____TtC18RestorePostProcess14MigratorConfig_state + 8];
  unsigned __int8 v5 = self;
  sub_160BC(v2, v3, v4);

  NSString v6 = sub_19F80();
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (_TtC18RestorePostProcess14MigratorConfig)initWithPersonaID:(id)a3 didRestoreFromBackup:(BOOL)a4 didRestoreFromCloudBackup:(BOOL)a5 error:(id *)a6
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    a3 = (id)sub_19F90();
    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v12 = 0;
  }
  v13 = self;
  uint64_t v14 = sub_17054((uint64_t)a3, v12, a4, a5);
  uint64_t v15 = (char *)v13 + OBJC_IVAR____TtC18RestorePostProcess14MigratorConfig_state;
  *(void *)uint64_t v15 = v14;
  *((void *)v15 + 1) = v16;
  v15[16] = v17;

  v19.receiver = v13;
  v19.super_class = ObjectType;
  return [(MigratorConfig *)&v19 init];
}

- (_TtC18RestorePostProcess14MigratorConfig)initWithDataSeparatedAccount:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  NSString v6 = (char *)self + OBJC_IVAR____TtC18RestorePostProcess14MigratorConfig_state;
  *(void *)NSString v6 = a3;
  *((void *)v6 + 1) = 0;
  v6[16] = 1;
  v9.receiver = self;
  v9.super_class = ObjectType;
  id v7 = a3;
  return [(MigratorConfig *)&v9 init];
}

- (_TtC18RestorePostProcess14MigratorConfig)init
{
  result = (_TtC18RestorePostProcess14MigratorConfig *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end