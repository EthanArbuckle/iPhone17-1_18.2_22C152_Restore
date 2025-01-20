@interface CNAvatarPosterPairView
- (_TtC10ContactsUI22CNAvatarPosterPairView)initWithCoder:(id)a3;
- (_TtC10ContactsUI22CNAvatarPosterPairView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)layoutSubviews;
@end

@implementation CNAvatarPosterPairView

- (_TtC10ContactsUI22CNAvatarPosterPairView)initWithFrame:(CGRect)a3
{
  return (_TtC10ContactsUI22CNAvatarPosterPairView *)sub_18B66EC48(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10ContactsUI22CNAvatarPosterPairView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18B672098();
}

- (void)dealloc
{
  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10ContactsUI22CNAvatarPosterPairView_viewModelSubscriber))
  {
    id v3 = self;
    swift_retain();
    sub_18B984668();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CNAvatarPosterPairView();
  [(CNAvatarPosterPairView *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI22CNAvatarPosterPairView_viewModel));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI22CNAvatarPosterPairView____lazy_storage___sensitiveContentManager));
  sub_18B66405C((uint64_t)self + OBJC_IVAR____TtC10ContactsUI22CNAvatarPosterPairView_displaySessionUUID, (uint64_t *)&unk_1E913DD20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI22CNAvatarPosterPairView____lazy_storage___posterImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI22CNAvatarPosterPairView____lazy_storage___avatarVC));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10ContactsUI22CNAvatarPosterPairView____lazy_storage___sensitiveContentBlurView);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_18B66F114();
}

@end