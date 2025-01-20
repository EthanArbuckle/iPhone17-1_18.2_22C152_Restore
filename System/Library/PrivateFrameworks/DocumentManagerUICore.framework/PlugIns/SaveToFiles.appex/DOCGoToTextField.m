@interface DOCGoToTextField
- (NSArray)keyCommands;
- (UIResponder)nextResponder;
- (_TtC11SaveToFilesP33_761F1A5B3C97BD752A060DF95FF50AFF16DOCGoToTextField)initWithFrame:(CGRect)a3;
@end

@implementation DOCGoToTextField

- (_TtC11SaveToFilesP33_761F1A5B3C97BD752A060DF95FF50AFF16DOCGoToTextField)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11SaveToFilesP33_761F1A5B3C97BD752A060DF95FF50AFF16DOCGoToTextField_customPlaceholderColor) = 0;
  v7 = (char *)self
     + OBJC_IVAR____TtC11SaveToFilesP33_761F1A5B3C97BD752A060DF95FF50AFF16DOCGoToTextField_customBlendMode;
  *(_DWORD *)v7 = 0;
  v7[4] = 1;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11SaveToFilesP33_761F1A5B3C97BD752A060DF95FF50AFF16DOCGoToTextField_coresponder) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCGoToTextField();
  return -[DOCTokenTextField initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (NSArray)keyCommands
{
  v2 = self;
  uint64_t v3 = sub_1003E9ACC();

  if (v3)
  {
    sub_100036804(0, (unint64_t *)&unk_10062F4D0);
    v4.super.isa = sub_1004D14F0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (UIResponder)nextResponder
{
  uint64_t v3 = *(UIResponder **)((char *)&self->super.super.super.super.super.super.isa
                       + OBJC_IVAR____TtC11SaveToFilesP33_761F1A5B3C97BD752A060DF95FF50AFF16DOCGoToTextField_coresponder);
  if (v3)
  {
    NSArray v4 = self;
    v5 = v3;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)type metadata accessor for DOCGoToTextField();
    v6 = self;
    v5 = [(DOCGoToTextField *)&v9 nextResponder];
  }
  v7 = v3;

  return v5;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFilesP33_761F1A5B3C97BD752A060DF95FF50AFF16DOCGoToTextField_customPlaceholderColor));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC11SaveToFilesP33_761F1A5B3C97BD752A060DF95FF50AFF16DOCGoToTextField_coresponder);
}

@end