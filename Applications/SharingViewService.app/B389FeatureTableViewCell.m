@interface B389FeatureTableViewCell
- (_TtC18SharingViewService24B389FeatureTableViewCell)initWithCoder:(id)a3;
- (_TtC18SharingViewService24B389FeatureTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
@end

@implementation B389FeatureTableViewCell

- (_TtC18SharingViewService24B389FeatureTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  return (_TtC18SharingViewService24B389FeatureTableViewCell *)sub_10001D314(v4, v5);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10001CFF8();
}

- (_TtC18SharingViewService24B389FeatureTableViewCell)initWithCoder:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  sub_10001D2D0(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC18SharingViewService24B389FeatureTableViewCell_glyphConfiguration), *(void *)&self->glyphConfiguration[OBJC_IVAR____TtC18SharingViewService24B389FeatureTableViewCell_glyphConfiguration], *(void *)&self->glyphConfiguration[OBJC_IVAR____TtC18SharingViewService24B389FeatureTableViewCell_glyphConfiguration+ 8], *(void **)&self->glyphConfiguration[OBJC_IVAR____TtC18SharingViewService24B389FeatureTableViewCell_glyphConfiguration+ 16]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService24B389FeatureTableViewCell__backgroundImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService24B389FeatureTableViewCell__detailTextLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService24B389FeatureTableViewCell__glyphImageView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18SharingViewService24B389FeatureTableViewCell__textLabel);
}

@end