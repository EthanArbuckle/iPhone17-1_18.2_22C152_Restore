@interface DOCSmartFolderManager
+ (_TtC26DocumentManagerExecutables21DOCSmartFolderManager)sharedManager;
- (_TtC26DocumentManagerExecutables21DOCSmartFolderManager)init;
- (void)dealloc;
@end

@implementation DOCSmartFolderManager

void __43__DOCSmartFolderManager_OBJC_sharedManager__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedManager__sharedManager;
  sharedManager__sharedManager = v0;

  id v2 = +[DOCSmartFolderManager sharedManager];
  [(id)sharedManager__sharedManager setUnderlyingSmartFolderManager:v2];
}

+ (_TtC26DocumentManagerExecutables21DOCSmartFolderManager)sharedManager
{
  if (qword_2684866B0 != -1) {
    swift_once();
  }
  id v2 = (void *)qword_2684866B8;

  return (_TtC26DocumentManagerExecutables21DOCSmartFolderManager *)v2;
}

- (void)dealloc
{
  id v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC26DocumentManagerExecutables21DOCSmartFolderManager_database);
  v3 = self;
  objc_msgSend(v2, sel_close);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for DOCSmartFolderManager();
  [(DOCSmartFolderManager *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables21DOCSmartFolderManager_database));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables21DOCSmartFolderManager_currentUserActivity));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC26DocumentManagerExecutables21DOCSmartFolderManager_defaultSaveLocationItemId);
}

- (_TtC26DocumentManagerExecutables21DOCSmartFolderManager)init
{
  result = (_TtC26DocumentManagerExecutables21DOCSmartFolderManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end