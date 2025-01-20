@interface SiriLightHostWindow
+ (BOOL)_isSecure;
- (_TtC16IntelligentLight19SiriLightHostWindow)initWithCoder:(id)a3;
- (_TtC16IntelligentLight19SiriLightHostWindow)initWithContentRect:(CGRect)a3;
- (_TtC16IntelligentLight19SiriLightHostWindow)initWithFrame:(CGRect)a3;
- (_TtC16IntelligentLight19SiriLightHostWindow)initWithWindowScene:(id)a3;
@end

@implementation SiriLightHostWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (_TtC16IntelligentLight19SiriLightHostWindow)initWithWindowScene:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SiriLightHostWindow();
  return [(SiriLightHostWindow *)&v5 initWithWindowScene:a3];
}

- (_TtC16IntelligentLight19SiriLightHostWindow)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SiriLightHostWindow();
  return -[SiriLightHostWindow initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC16IntelligentLight19SiriLightHostWindow)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SiriLightHostWindow();
  return [(SiriLightHostWindow *)&v5 initWithCoder:a3];
}

- (_TtC16IntelligentLight19SiriLightHostWindow)initWithContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SiriLightHostWindow();
  return -[SiriLightHostWindow initWithContentRect:](&v8, "initWithContentRect:", x, y, width, height);
}

@end