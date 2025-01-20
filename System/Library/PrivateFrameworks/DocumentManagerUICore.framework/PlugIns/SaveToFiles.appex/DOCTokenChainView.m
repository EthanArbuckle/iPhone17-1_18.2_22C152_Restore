@interface DOCTokenChainView
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)hasText;
- (BOOL)isPosition:(id)a3 atBoundary:(int64_t)a4 inDirection:(int64_t)a5;
- (BOOL)isPosition:(id)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5;
- (BOOL)resignFirstResponder;
- (CGRect)caretRectForPosition:(id)a3;
- (CGRect)firstRectForRange:(id)a3;
- (NSArray)keyCommands;
- (NSDictionary)markedTextStyle;
- (UITextInputDelegate)inputDelegate;
- (UITextRange)markedTextRange;
- (UITextRange)selectedTextRange;
- (_TtC11SaveToFilesP33_30F938DCE92FF5A226C64F1B2890EB4217DOCTokenChainView)initWithCoder:(id)a3;
- (_TtC11SaveToFilesP33_30F938DCE92FF5A226C64F1B2890EB4217DOCTokenChainView)initWithFrame:(CGRect)a3;
- (id)beginningOfDocument;
- (id)characterRangeAtPoint:(CGPoint)a3;
- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4;
- (id)closestPositionToPoint:(CGPoint)a3;
- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4;
- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5;
- (id)positionFromPosition:(id)a3 offset:(int64_t)a4;
- (id)positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5;
- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4;
- (id)rangeEnclosingPosition:(id)a3 withGranularity:(int64_t)a4 inDirection:(int64_t)a5;
- (id)selectionRectsForRange:(id)a3;
- (id)textInRange:(id)a3;
- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4;
- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4;
- (int64_t)comparePosition:(id)a3 toPosition:(id)a4;
- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4;
- (void)deleteBackward;
- (void)directionKeyCommand:(id)a3;
- (void)insertText:(id)a3;
- (void)selectAll:(id)a3;
- (void)tap:(id)a3;
@end

@implementation DOCTokenChainView

- (_TtC11SaveToFilesP33_30F938DCE92FF5A226C64F1B2890EB4217DOCTokenChainView)initWithFrame:(CGRect)a3
{
  return (_TtC11SaveToFilesP33_30F938DCE92FF5A226C64F1B2890EB4217DOCTokenChainView *)sub_10027DFF0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11SaveToFilesP33_30F938DCE92FF5A226C64F1B2890EB4217DOCTokenChainView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002827C8();
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  v2 = self;
  sub_10027E220();
  char v4 = v3;

  return v4 & 1;
}

- (BOOL)resignFirstResponder
{
  v2 = self;
  sub_10027E4D8();
  char v4 = v3;

  return v4 & 1;
}

- (NSArray)keyCommands
{
  return (NSArray *)sub_100280F84(self, (uint64_t)a2, sub_10027E6DC);
}

- (void)selectAll:(id)a3
{
}

- (BOOL)hasText
{
  v2 = (char *)self + OBJC_IVAR____TtC11SaveToFilesP33_30F938DCE92FF5A226C64F1B2890EB4217DOCTokenChainView_tokens;
  swift_beginAccess();
  return *(void *)(*(void *)v2 + 16) != 0;
}

- (void)insertText:(id)a3
{
  sub_1004D1240();
  char v4 = self;
  sub_10027EA54();

  swift_bridgeObjectRelease();
}

- (void)deleteBackward
{
  v2 = self;
  sub_10027F4CC();
}

- (void)tap:(id)a3
{
}

- (void)directionKeyCommand:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100282A28();
}

- (void).cxx_destruct
{
  sub_10003BA48((uint64_t)self + OBJC_IVAR____TtC11SaveToFilesP33_30F938DCE92FF5A226C64F1B2890EB4217DOCTokenChainView_delegate);
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFilesP33_30F938DCE92FF5A226C64F1B2890EB4217DOCTokenChainView_font));
  swift_bridgeObjectRelease();
}

- (id)rangeEnclosingPosition:(id)a3 withGranularity:(int64_t)a4 inDirection:(int64_t)a5
{
  return 0;
}

- (BOOL)isPosition:(id)a3 atBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  return 0;
}

- (id)positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  return 0;
}

- (BOOL)isPosition:(id)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5
{
  return 0;
}

- (UITextInputDelegate)inputDelegate
{
  return (UITextInputDelegate *)0;
}

- (id)textInRange:(id)a3
{
  return 0;
}

- (UITextRange)selectedTextRange
{
  return (UITextRange *)0;
}

- (UITextRange)markedTextRange
{
  return (UITextRange *)0;
}

- (NSDictionary)markedTextStyle
{
  return (NSDictionary *)0;
}

- (id)beginningOfDocument
{
  id v0 = [objc_allocWithZone((Class)UITextPosition) init];
  return v0;
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  return 0;
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  return 0;
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  return 0;
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  return 0;
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  return 0;
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  return 0;
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  return 0;
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  return [(DOCTokenChainView *)self effectiveUserInterfaceLayoutDirection] != 0;
}

- (CGRect)firstRectForRange:(id)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)caretRectForPosition:(id)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)selectionRectsForRange:(id)a3
{
  sub_100036804(0, &qword_100636F28);
  v3.super.isa = sub_1004D14F0().super.isa;
  return v3.super.isa;
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  return 0;
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  return 0;
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  return 0;
}

@end