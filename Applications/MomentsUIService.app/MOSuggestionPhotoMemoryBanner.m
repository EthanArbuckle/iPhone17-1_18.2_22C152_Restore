@interface MOSuggestionPhotoMemoryBanner
- (_TtC16MomentsUIService29MOSuggestionPhotoMemoryBanner)initWithCoder:(id)a3;
- (_TtC16MomentsUIService29MOSuggestionPhotoMemoryBanner)initWithFrame:(CGRect)a3;
@end

@implementation MOSuggestionPhotoMemoryBanner

- (_TtC16MomentsUIService29MOSuggestionPhotoMemoryBanner)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService29MOSuggestionPhotoMemoryBanner *)MOSuggestionPhotoMemoryBanner.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MomentsUIService29MOSuggestionPhotoMemoryBanner)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC16MomentsUIService29MOSuggestionPhotoMemoryBanner_bannerLabel;
  id v6 = objc_allocWithZone((Class)UILabel);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC16MomentsUIService29MOSuggestionPhotoMemoryBanner *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService29MOSuggestionPhotoMemoryBanner_bannerLabel));
}

@end