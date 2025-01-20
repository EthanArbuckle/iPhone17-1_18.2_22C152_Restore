@interface SecondVCCell
- (BOOL)isHighlighted;
- (_TtC13FTMInternal_412SecondVCCell)initWithCoder:(id)a3;
- (_TtC13FTMInternal_412SecondVCCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation SecondVCCell

- (_TtC13FTMInternal_412SecondVCCell)initWithFrame:(CGRect)a3
{
  return (_TtC13FTMInternal_412SecondVCCell *)sub_10017A6BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13FTMInternal_412SecondVCCell)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC13FTMInternal_412SecondVCCell_metricFavorited) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC13FTMInternal_412SecondVCCell____lazy_storage___leftLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC13FTMInternal_412SecondVCCell____lazy_storage___rightLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC13FTMInternal_412SecondVCCell____lazy_storage___separatorView) = 0;
  id v4 = a3;

  result = (_TtC13FTMInternal_412SecondVCCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
}

- (BOOL)isHighlighted
{
  return sub_10017B094(self, (uint64_t)a2, type metadata accessor for SecondVCCell);
}

- (void)setHighlighted:(BOOL)a3
{
  id v4 = self;
  sub_10017B164(a3, type metadata accessor for SecondVCCell, (uint64_t)&unk_10028BF78, (uint64_t)sub_10017B468, (uint64_t)&unk_10028BF90);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_412SecondVCCell____lazy_storage___leftLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_412SecondVCCell____lazy_storage___rightLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC13FTMInternal_412SecondVCCell____lazy_storage___separatorView);
}

@end