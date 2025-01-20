@interface CAFUIProminentSettingCell
- (_TtC5CAFUI25CAFUIProminentSettingCell)initWithCoder:(id)a3;
- (_TtC5CAFUI25CAFUIProminentSettingCell)initWithFrame:(CGRect)a3;
- (void)buttonClicked;
- (void)prepareForReuse;
@end

@implementation CAFUIProminentSettingCell

- (_TtC5CAFUI25CAFUIProminentSettingCell)initWithCoder:(id)a3
{
  v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC5CAFUI25CAFUIProminentSettingCell_representable);
  void *v5 = 0;
  v5[1] = 0;
  uint64_t v6 = OBJC_IVAR____TtC5CAFUI25CAFUIProminentSettingCell_imageColor;
  v7 = self;
  id v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v6) = (Class)objc_msgSend(v7, sel_systemGrayColor);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5CAFUI25CAFUIProminentSettingCell_customPlatterView) = 0;

  result = (_TtC5CAFUI25CAFUIProminentSettingCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC5CAFUI25CAFUIProminentSettingCell)initWithFrame:(CGRect)a3
{
  return (_TtC5CAFUI25CAFUIProminentSettingCell *)CAFUIProminentSettingCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CAFUIProminentSettingCell();
  v2 = (char *)v4.receiver;
  [(CAFUIProminentSettingCell *)&v4 prepareForReuse];
  v3 = &v2[OBJC_IVAR____TtC5CAFUI25CAFUIProminentSettingCell_representable];
  swift_beginAccess();
  *(void *)v3 = 0;
  *((void *)v3 + 1) = 0;
  swift_unknownObjectRelease();
  if (*(void *)v3) {
    CAFUIProminentSettingCell.configureCell()();
  }
}

- (void)buttonClicked
{
  v2 = self;
  CAFUIProminentSettingCell.buttonClicked()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI25CAFUIProminentSettingCell_imageColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI25CAFUIProminentSettingCell_customPlatterView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI25CAFUIProminentSettingCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI25CAFUIProminentSettingCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI25CAFUIProminentSettingCell_buttonLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI25CAFUIProminentSettingCell_imageButton));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end