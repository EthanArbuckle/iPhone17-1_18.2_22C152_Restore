@interface LoggingCardTableView
- (CGSize)previousContentSize;
- (LoggingCardTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (LoggingCardTableViewObserver)loggingCardTableViewObserver;
- (_TtC24MenstrualCyclesAppPluginP33_CF600760015F1B1EB9BB714E5E29173820LoggingCardTableView)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPluginP33_CF600760015F1B1EB9BB714E5E29173820LoggingCardTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (void)layoutSubviews;
- (void)setLoggingCardTableViewObserver:(id)a3;
- (void)setPreviousContentSize:(CGSize)a3;
@end

@implementation LoggingCardTableView

- (LoggingCardTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  -[LoggingCardTableView setPreviousContentSize:](self, "setPreviousContentSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8), a3.size.width, a3.size.height);
  v7.receiver = self;
  v7.super_class = (Class)LoggingCardTableView;
  return -[LoggingCardTableView initWithFrame:style:](&v7, sel_initWithFrame_style_, a4, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2411F56DC();
}

- (CGSize)previousContentSize
{
  double width = self->_previousContentSize.width;
  double height = self->_previousContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreviousContentSize:(CGSize)a3
{
  self->_previousContentSize = a3;
}

- (LoggingCardTableViewObserver)loggingCardTableViewObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_loggingCardTableViewObserver);

  return (LoggingCardTableViewObserver *)WeakRetained;
}

- (void)setLoggingCardTableViewObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

- (_TtC24MenstrualCyclesAppPluginP33_CF600760015F1B1EB9BB714E5E29173820LoggingCardTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10 = (Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_CF600760015F1B1EB9BB714E5E29173820LoggingCardTableView_previousContentSize);
  void *v10 = 0;
  v10[1] = 0;
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_CF600760015F1B1EB9BB714E5E29173820LoggingCardTableView_loggingCardTableViewObserver) = 0;
  swift_unknownObjectWeakInit();
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for LoggingCardTableView();
  return -[LoggingCardTableView initWithFrame:style:](&v12, sel_initWithFrame_style_, a4, x, y, width, height);
}

- (_TtC24MenstrualCyclesAppPluginP33_CF600760015F1B1EB9BB714E5E29173820LoggingCardTableView)initWithCoder:(id)a3
{
  v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_CF600760015F1B1EB9BB714E5E29173820LoggingCardTableView_previousContentSize);
  void *v5 = 0;
  v5[1] = 0;
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_CF600760015F1B1EB9BB714E5E29173820LoggingCardTableView_loggingCardTableViewObserver) = 0;
  swift_unknownObjectWeakInit();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for LoggingCardTableView();
  return [(LoggingCardTableView *)&v7 initWithCoder:a3];
}

@end