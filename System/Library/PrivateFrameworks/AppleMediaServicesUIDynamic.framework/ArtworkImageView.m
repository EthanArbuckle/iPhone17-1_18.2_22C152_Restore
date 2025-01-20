@interface ArtworkImageView
- (BOOL)amsuid_wantsArtworkStyle;
- (BOOL)hasContent;
- (_TtC27AppleMediaServicesUIDynamic16ArtworkImageView)init;
- (_TtC27AppleMediaServicesUIDynamic16ArtworkImageView)initWithCoder:(id)a3;
- (_TtC27AppleMediaServicesUIDynamic16ArtworkImageView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ArtworkImageView

- (BOOL)amsuid_wantsArtworkStyle
{
  return 1;
}

- (_TtC27AppleMediaServicesUIDynamic16ArtworkImageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BF3B95F8();
}

- (BOOL)hasContent
{
  return ArtworkImageView.hasContent.getter();
}

- (void)layoutSubviews
{
  v2 = self;
  ArtworkImageView.layoutSubviews()();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  ArtworkImageView.traitCollectionDidChange(_:)(v9);
}

- (_TtC27AppleMediaServicesUIDynamic16ArtworkImageView)init
{
}

- (_TtC27AppleMediaServicesUIDynamic16ArtworkImageView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic16ArtworkImageView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic16ArtworkImageView_underlyingImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic16ArtworkImageView_iapArtowrkBorderView));

  swift_bridgeObjectRelease();
}

@end