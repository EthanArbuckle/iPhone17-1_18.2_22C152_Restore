@interface BandCollectionViewCell
- (_TtC12CoreAudioKit22BandCollectionViewCell)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit22BandCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BandCollectionViewCell

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BandCollectionViewCell();
  id v2 = v3.receiver;
  [(BandCollectionViewCell *)&v3 layoutSubviews];
  sub_21E59EC9C();
}

- (_TtC12CoreAudioKit22BandCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit22BandCollectionViewCell *)sub_21E59F014(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit22BandCollectionViewCell)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit22BandCollectionViewCell *)sub_21E59F168(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit22BandCollectionViewCell_label));
}

@end