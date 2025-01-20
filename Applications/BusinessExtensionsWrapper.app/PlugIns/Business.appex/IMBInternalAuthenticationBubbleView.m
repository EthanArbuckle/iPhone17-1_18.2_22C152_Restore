@interface IMBInternalAuthenticationBubbleView
- (_TtC8Business35IMBInternalAuthenticationBubbleView)initWithCoder:(id)a3;
@end

@implementation IMBInternalAuthenticationBubbleView

- (_TtC8Business35IMBInternalAuthenticationBubbleView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8Business35IMBInternalAuthenticationBubbleView_authenticationManager) = 0;
  id v4 = a3;

  result = (_TtC8Business35IMBInternalAuthenticationBubbleView *)sub_1000BC0B8();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business35IMBInternalAuthenticationBubbleView_authenticationManager));
}

@end