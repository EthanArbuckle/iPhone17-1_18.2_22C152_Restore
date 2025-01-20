@interface PhotoLibrary
- (_TtC15ClarityPhotosUI12PhotoLibrary)init;
- (void)dealloc;
- (void)photoLibraryDidChange:(id)a3;
@end

@implementation PhotoLibrary

- (_TtC15ClarityPhotosUI12PhotoLibrary)init
{
  return (_TtC15ClarityPhotosUI12PhotoLibrary *)sub_10000FF70();
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15ClarityPhotosUI12PhotoLibrary_photoLibrary);
  v3 = self;
  [v2 unregisterChangeObserver:v3];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for PhotoLibrary();
  [(PhotoLibrary *)&v4 dealloc];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC15ClarityPhotosUI12PhotoLibrary__collection;
  uint64_t v4 = sub_100005A74(&qword_10001D058);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15ClarityPhotosUI12PhotoLibrary_photoLibrary);
}

- (void)photoLibraryDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  sub_1000103B8();
}

@end