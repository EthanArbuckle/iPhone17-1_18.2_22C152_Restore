@interface CNHostingPosterSnapshotImageView
- (BOOL)isSensitiveContent;
- (UIImage)image;
- (UIView)view;
- (_TtC10ContactsUI32CNHostingPosterSnapshotImageView)init;
- (void)setImage:(id)a3;
- (void)setIsSensitiveContent:(BOOL)a3;
@end

@implementation CNHostingPosterSnapshotImageView

- (UIImage)image
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  swift_retain();
  sub_18B9846D8();

  swift_release();
  swift_release();
  swift_release();

  return (UIImage *)v5;
}

- (void)setImage:(id)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = a3;
  swift_retain();
  sub_18B9846E8();
}

- (BOOL)isSensitiveContent
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  swift_retain();
  sub_18B9846D8();

  swift_release();
  swift_release();
  swift_release();
  return v5;
}

- (void)setIsSensitiveContent:(BOOL)a3
{
}

- (UIView)view
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10ContactsUI32CNHostingPosterSnapshotImageView_hostingController);
  v3 = self;
  result = (UIView *)objc_msgSend(v2, sel_view);
  if (result)
  {
    BOOL v5 = result;

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC10ContactsUI32CNHostingPosterSnapshotImageView)init
{
  return (_TtC10ContactsUI32CNHostingPosterSnapshotImageView *)CNHostingPosterSnapshotImageView.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI32CNHostingPosterSnapshotImageView_hostingController));

  swift_release();
}

@end