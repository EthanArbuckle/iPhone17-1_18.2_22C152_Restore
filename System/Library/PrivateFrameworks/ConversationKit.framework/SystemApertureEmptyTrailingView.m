@interface SystemApertureEmptyTrailingView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4;
- (_TtC15ConversationKit31SystemApertureEmptyTrailingView)initWithCoder:(id)a3;
- (_TtC15ConversationKit31SystemApertureEmptyTrailingView)initWithFrame:(CGRect)a3;
- (void)dealloc;
@end

@implementation SystemApertureEmptyTrailingView

- (_TtC15ConversationKit31SystemApertureEmptyTrailingView)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit31SystemApertureEmptyTrailingView *)SystemApertureEmptyTrailingView.init(frame:)();
}

- (_TtC15ConversationKit31SystemApertureEmptyTrailingView)initWithCoder:(id)a3
{
}

- (void)dealloc
{
  v2 = self;
  SystemApertureEmptyTrailingView.__deallocating_deinit();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 1.0;
  double v4 = 1.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  double v4 = self;
  SystemApertureEmptyTrailingView.sizeThatFits(_:for:)();
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

@end