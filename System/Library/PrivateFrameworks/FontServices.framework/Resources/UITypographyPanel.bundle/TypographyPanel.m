@interface TypographyPanel
- (TypographyPanel)initWithCoder:(id)a3;
- (TypographyPanel)initWithNibName:(id)a3 bundle:(id)a4;
- (TypographyPanelDelegate)delegate;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setSelectedFont:(id)a3;
@end

@implementation TypographyPanel

- (void)loadView
{
  v2 = self;
  sub_65A14();
}

- (TypographyPanelDelegate)delegate
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  return (TypographyPanelDelegate *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (void)setSelectedFont:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_66198(v4);
}

- (TypographyPanel)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_681A0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (TypographyPanel *)sub_663C4(v5, v7, a4);
}

- (TypographyPanel)initWithCoder:(id)a3
{
  return (TypographyPanel *)sub_66588(a3);
}

- (void).cxx_destruct
{
  swift_release();

  v3 = (char *)self + OBJC_IVAR___TypographyPanel_delegate;
  sub_2E1CC((uint64_t)v3);
}

@end