@interface MAGAngelWindow
+ (BOOL)_isSecure;
- (BOOL)_accessibilityIsIsolatedWindow;
- (_TtC14MagnifierAngel14MAGAngelWindow)initWithCoder:(id)a3;
- (_TtC14MagnifierAngel14MAGAngelWindow)initWithContentRect:(CGRect)a3;
- (_TtC14MagnifierAngel14MAGAngelWindow)initWithFrame:(CGRect)a3;
- (_TtC14MagnifierAngel14MAGAngelWindow)initWithWindowScene:(id)a3;
@end

@implementation MAGAngelWindow

- (_TtC14MagnifierAngel14MAGAngelWindow)initWithWindowScene:(id)a3
{
  return (_TtC14MagnifierAngel14MAGAngelWindow *)sub_10000CB64(a3);
}

- (_TtC14MagnifierAngel14MAGAngelWindow)initWithCoder:(id)a3
{
  result = (_TtC14MagnifierAngel14MAGAngelWindow *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

+ (BOOL)_isSecure
{
  return 1;
}

- (BOOL)_accessibilityIsIsolatedWindow
{
  return 1;
}

- (_TtC14MagnifierAngel14MAGAngelWindow)initWithFrame:(CGRect)a3
{
}

- (_TtC14MagnifierAngel14MAGAngelWindow)initWithContentRect:(CGRect)a3
{
}

@end