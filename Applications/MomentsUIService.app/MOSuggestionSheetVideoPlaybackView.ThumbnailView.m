@interface MOSuggestionSheetVideoPlaybackView.ThumbnailView
- (_TtCC16MomentsUIService34MOSuggestionSheetVideoPlaybackView13ThumbnailView)initWithCoder:(id)a3;
- (_TtCC16MomentsUIService34MOSuggestionSheetVideoPlaybackView13ThumbnailView)initWithFrame:(CGRect)a3;
@end

@implementation MOSuggestionSheetVideoPlaybackView.ThumbnailView

- (_TtCC16MomentsUIService34MOSuggestionSheetVideoPlaybackView13ThumbnailView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtCC16MomentsUIService34MOSuggestionSheetVideoPlaybackView13ThumbnailView_imageView;
  id v6 = objc_allocWithZone((Class)UIImageView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtCC16MomentsUIService34MOSuggestionSheetVideoPlaybackView13ThumbnailView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtCC16MomentsUIService34MOSuggestionSheetVideoPlaybackView13ThumbnailView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MomentsUIService34MOSuggestionSheetVideoPlaybackView13ThumbnailView_imageView));
}

@end