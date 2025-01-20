@interface QLModelDocument
- (BOOL)loadFromContents:(id)a3 ofType:(id)a4 error:(id *)a5;
- (_TtC32com_apple_MLKit_MLPackagePreview15QLModelDocument)initWithFileURL:(id)a3;
- (id)contentsForType:(id)a3 error:(id *)a4;
- (void)handleError:(id)a3 userInteractionPermitted:(BOOL)a4;
@end

@implementation QLModelDocument

- (id)contentsForType:(id)a3 error:(id *)a4
{
  v4 = (void *)sub_100025270();
  return v4;
}

- (BOOL)loadFromContents:(id)a3 ofType:(id)a4 error:(id *)a5
{
  swift_unknownObjectRetain();
  v7 = self;
  id v8 = a4;
  sub_100025130();
  swift_unknownObjectRelease();
  if (v8)
  {
    sub_100025030();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v10);
  swift_bridgeObjectRelease();

  return 1;
}

- (void)handleError:(id)a3 userInteractionPermitted:(BOOL)a4
{
  BOOL v4 = a4;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC32com_apple_MLKit_MLPackagePreview15QLModelDocument_error) = (Class)a3;
  id v6 = a3;
  v7 = self;
  swift_errorRelease();
  id v8 = (void *)sub_100024BD0();
  v9.receiver = v7;
  v9.super_class = (Class)type metadata accessor for QLModelDocument();
  [(QLModelDocument *)&v9 handleError:v8 userInteractionPermitted:v4];
}

- (_TtC32com_apple_MLKit_MLPackagePreview15QLModelDocument)initWithFileURL:(id)a3
{
  uint64_t v4 = sub_100024C60();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100024C40();
  id v8 = (NSURL *)OBJC_IVAR____TtC32com_apple_MLKit_MLPackagePreview15QLModelDocument_error;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC32com_apple_MLKit_MLPackagePreview15QLModelDocument_error) = 0;
  sub_100024C30(v8);
  uint64_t v10 = v9;
  v11 = (objc_class *)type metadata accessor for QLModelDocument();
  v14.receiver = self;
  v14.super_class = v11;
  v12 = [(QLModelDocument *)&v14 initWithFileURL:v10];

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v12;
}

- (void).cxx_destruct
{
}

@end