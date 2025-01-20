@interface SVSAdjustedImageView
- (_TtC18SharingViewService20SVSAdjustedImageView)initWithCoder:(id)a3;
- (_TtC18SharingViewService20SVSAdjustedImageView)initWithFrame:(CGRect)a3;
- (_TtC18SharingViewService20SVSAdjustedImageView)initWithImage:(id)a3;
- (_TtC18SharingViewService20SVSAdjustedImageView)initWithImage:(id)a3 highlightedImage:(id)a4;
@end

@implementation SVSAdjustedImageView

- (_TtC18SharingViewService20SVSAdjustedImageView)initWithImage:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SVSAdjustedImageView();
  return [(SVSAdjustedImageView *)&v5 initWithImage:a3];
}

- (_TtC18SharingViewService20SVSAdjustedImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SVSAdjustedImageView();
  return [(SVSAdjustedImageView *)&v7 initWithImage:a3 highlightedImage:a4];
}

- (_TtC18SharingViewService20SVSAdjustedImageView)initWithFrame:(CGRect)a3
{
  return (_TtC18SharingViewService20SVSAdjustedImageView *)sub_10002CC58(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, type metadata accessor for SVSAdjustedImageView);
}

- (_TtC18SharingViewService20SVSAdjustedImageView)initWithCoder:(id)a3
{
  return (_TtC18SharingViewService20SVSAdjustedImageView *)sub_10002CCE4(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for SVSAdjustedImageView);
}

@end