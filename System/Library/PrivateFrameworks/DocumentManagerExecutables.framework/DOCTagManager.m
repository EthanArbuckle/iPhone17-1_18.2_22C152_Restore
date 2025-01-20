@interface DOCTagManager
- (_TtC26DocumentManagerExecutables13DOCTagManager)init;
@end

@implementation DOCTagManager

- (_TtC26DocumentManagerExecutables13DOCTagManager)init
{
  return (_TtC26DocumentManagerExecutables13DOCTagManager *)DOCTagManager.init()();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC26DocumentManagerExecutables13DOCTagManager_setTagsOperationTimeout;
  uint64_t v4 = sub_22BE92AD8();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end