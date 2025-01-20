@interface AmbientMatchView
- (_TtC16MusicRecognition16AmbientMatchView)initWithCoder:(id)a3;
- (_TtC16MusicRecognition16AmbientMatchView)initWithFrame:(CGRect)a3;
@end

@implementation AmbientMatchView

- (_TtC16MusicRecognition16AmbientMatchView)initWithFrame:(CGRect)a3
{
  sub_100108EC4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC16MusicRecognition16AmbientMatchView)initWithCoder:(id)a3
{
  sub_10010A8F0(a3);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_placeholderArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_albumArtContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_albumArtImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_artistLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_shazamLogoImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_shazamCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_trackDetailsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_shazamCountStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView_appleMusicButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView____lazy_storage___albumArtImageViewCenterYConstraint));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicRecognition16AmbientMatchView____lazy_storage___placeholderViewCenterYConstraint);
}

@end