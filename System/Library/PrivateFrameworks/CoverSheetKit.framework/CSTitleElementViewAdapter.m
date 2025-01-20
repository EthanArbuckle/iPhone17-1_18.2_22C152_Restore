@interface CSTitleElementViewAdapter
- (BOOL)animatesChanges;
- (BOOL)visible;
- (CGRect)frame;
- (CSTitleElementViewAdapter)init;
- (CSTitleElementViewAdapter)initWithFrame:(CGRect)a3;
- (NSString)text;
- (UIColor)textColor;
- (UIFont)font;
- (UIViewController)viewController;
- (double)minimumScaleFactor;
- (id)view;
- (int64_t)textAlignment;
- (void)setAnimatesChanges:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setMinimumScaleFactor:(double)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
- (void)setView:(id)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation CSTitleElementViewAdapter

- (id)view
{
  v2 = [(CSTitleElementViewAdapter *)self viewController];
  v3 = [v2 view];

  return v3;
}

- (void)setView:(id)a3
{
  id v4 = a3;
  id v5 = [(CSTitleElementViewAdapter *)self viewController];
  [v5 setView:v4];
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___CSTitleElementViewAdapter_hostingController));
}

- (BOOL)animatesChanges
{
  v2 = (BOOL *)self + OBJC_IVAR___CSTitleElementViewAdapter_animatesChanges;
  swift_beginAccess();
  return *v2;
}

- (void)setAnimatesChanges:(BOOL)a3
{
  id v4 = (BOOL *)self + OBJC_IVAR___CSTitleElementViewAdapter_animatesChanges;
  swift_beginAccess();
  *id v4 = a3;
}

- (NSString)text
{
  v2 = *(void (**)(uint64_t))(**(void **)((char *)&self->super.isa
                                                    + OBJC_IVAR___CSTitleElementViewAdapter_coordinator)
                                      + 152);
  v3 = self;
  uint64_t v4 = swift_retain();
  v2(v4);

  swift_release();
  id v5 = (void *)sub_1ADA3FC20();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (void)setText:(id)a3
{
  uint64_t v4 = sub_1ADA3FC30();
  uint64_t v6 = v5;
  v7 = self;
  sub_1ADA3A024(v4, v6);
}

- (UIColor)textColor
{
  v2 = *(uint64_t (**)(uint64_t))(**(void **)((char *)&self->super.isa
                                                       + OBJC_IVAR___CSTitleElementViewAdapter_coordinator)
                                         + 200);
  v3 = self;
  uint64_t v4 = swift_retain();
  uint64_t v5 = (void *)v2(v4);

  swift_release();

  return (UIColor *)v5;
}

- (void)setTextColor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1ADA3A6FC(v4);
}

- (UIFont)font
{
  v2 = *(uint64_t (**)(uint64_t))(**(void **)((char *)&self->super.isa
                                                       + OBJC_IVAR___CSTitleElementViewAdapter_coordinator)
                                         + 248);
  v3 = self;
  uint64_t v4 = swift_retain();
  uint64_t v5 = (void *)v2(v4);

  swift_release();

  return (UIFont *)v5;
}

- (void)setFont:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1ADA3AD64(v4);
}

- (int64_t)textAlignment
{
  v2 = *(uint64_t (**)(uint64_t))(**(void **)((char *)&self->super.isa
                                                       + OBJC_IVAR___CSTitleElementViewAdapter_coordinator)
                                         + 296);
  v3 = self;
  uint64_t v4 = swift_retain();
  int64_t v5 = v2(v4);

  swift_release();
  return v5;
}

- (void)setTextAlignment:(int64_t)a3
{
  uint64_t v4 = *(void (**)(int64_t))(**(void **)((char *)&self->super.isa
                                                           + OBJC_IVAR___CSTitleElementViewAdapter_coordinator)
                                             + 304);
  int64_t v5 = self;
  swift_retain();
  v4(a3);

  swift_release();
}

- (double)minimumScaleFactor
{
  v2 = *(double (**)(uint64_t))(**(void **)((char *)&self->super.isa
                                                      + OBJC_IVAR___CSTitleElementViewAdapter_coordinator)
                                        + 344);
  v3 = self;
  uint64_t v4 = swift_retain();
  double v5 = v2(v4);

  swift_release();
  return v5;
}

- (void)setMinimumScaleFactor:(double)a3
{
  uint64_t v4 = *(void (**)(uint64_t, double))(**(void **)((char *)&self->super.isa
                                                            + OBJC_IVAR___CSTitleElementViewAdapter_coordinator)
                                              + 352);
  double v5 = self;
  uint64_t v6 = swift_retain();
  v4(v6, a3);

  swift_release();
}

- (CGRect)frame
{
  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x70);
  v3 = self;
  uint64_t v4 = (void *)v2();
  id v5 = objc_msgSend(v4, sel_view);

  if (v5)
  {
    objc_msgSend(v5, sel_frame);
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    double v6 = v11;
    double v7 = v13;
    double v8 = v15;
    double v9 = v17;
  }
  else
  {
    __break(1u);
  }
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x70);
  double v8 = self;
  double v9 = (void *)v7();
  id v10 = objc_msgSend(v9, sel_view);

  if (v10)
  {
    objc_msgSend(v10, sel_setFrame_, x, y, width, height);
  }
  else
  {
    __break(1u);
  }
}

- (BOOL)visible
{
  v2 = (BOOL *)self + OBJC_IVAR___CSTitleElementViewAdapter_visible;
  swift_beginAccess();
  return *v2;
}

- (void)setVisible:(BOOL)a3
{
  id v5 = (BOOL *)self + OBJC_IVAR___CSTitleElementViewAdapter_visible;
  swift_beginAccess();
  *id v5 = a3;
  double v6 = self;
  sub_1ADA3C4C8(a3);
}

- (CSTitleElementViewAdapter)initWithFrame:(CGRect)a3
{
  return (CSTitleElementViewAdapter *)_s13CoverSheetKit23TitleElementViewAdapterC5frameACSo6CGRectV_tcfc_0();
}

- (CSTitleElementViewAdapter)init
{
  CGRect result = (CSTitleElementViewAdapter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end