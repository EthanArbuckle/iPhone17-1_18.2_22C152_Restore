@interface CNPosterSetupAvatarPreviewViewWrapper
- (UIViewController)hostingController;
- (_TtC10ContactsUI37CNPosterSetupAvatarPreviewViewWrapper)init;
- (_TtC10ContactsUI37CNPosterSetupAvatarPreviewViewWrapper)initWithImageData:(id)a3 cropRect:(CGRect)a4 imageType:(unint64_t)a5 delegate:(id)a6;
- (void)setCropRect:(CGRect)a3;
- (void)setHostingController:(id)a3;
- (void)setImageData:(id)a3;
- (void)setImageType:(unint64_t)a3;
@end

@implementation CNPosterSetupAvatarPreviewViewWrapper

- (UIViewController)hostingController
{
  v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC10ContactsUI37CNPosterSetupAvatarPreviewViewWrapper_hostingController);
  swift_beginAccess();
  return (UIViewController *)*v2;
}

- (void)setHostingController:(id)a3
{
  v4 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC10ContactsUI37CNPosterSetupAvatarPreviewViewWrapper_hostingController);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (_TtC10ContactsUI37CNPosterSetupAvatarPreviewViewWrapper)initWithImageData:(id)a3 cropRect:(CGRect)a4 imageType:(unint64_t)a5 delegate:(id)a6
{
  id v6 = a3;
  swift_unknownObjectRetain();
  uint64_t v7 = sub_18B983BD8();
  unint64_t v9 = v8;

  return (_TtC10ContactsUI37CNPosterSetupAvatarPreviewViewWrapper *)CNPosterSetupAvatarPreviewViewWrapper.init(imageData:cropRect:imageType:delegate:)(v7, v9);
}

- (void)setImageData:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = sub_18B983BD8();
  unint64_t v8 = v7;

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain_n();
  sub_18B6533D0(v6, v8);
  sub_18B9846E8();
  sub_18B668888();
  swift_release();
  sub_18B64B8F0(v6, v8);
}

- (void)setCropRect:(CGRect)a3
{
}

- (void)setImageType:(unint64_t)a3
{
}

- (_TtC10ContactsUI37CNPosterSetupAvatarPreviewViewWrapper)init
{
  result = (_TtC10ContactsUI37CNPosterSetupAvatarPreviewViewWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI37CNPosterSetupAvatarPreviewViewWrapper_hostingController));
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC10ContactsUI37CNPosterSetupAvatarPreviewViewWrapper_avatarPreviewView;

  sub_18B66C9E8((uint64_t)v3);
}

@end