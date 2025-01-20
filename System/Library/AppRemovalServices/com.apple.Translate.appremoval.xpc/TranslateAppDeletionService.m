@interface TranslateAppDeletionService
- (_TtC30com_apple_Translate_appremoval27TranslateAppDeletionService)init;
- (void)removeAppWithReply:(id)a3;
@end

@implementation TranslateAppDeletionService

- (void)removeAppWithReply:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_100003214;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  sub_100003018((uint64_t)v4, v5);
  sub_1000031CC((uint64_t)v4);
}

- (_TtC30com_apple_Translate_appremoval27TranslateAppDeletionService)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TranslateAppDeletionService();
  return [(TranslateAppDeletionService *)&v3 init];
}

@end