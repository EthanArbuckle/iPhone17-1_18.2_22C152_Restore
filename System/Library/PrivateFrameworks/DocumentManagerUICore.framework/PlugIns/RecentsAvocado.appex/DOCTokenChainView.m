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
- (_TtC14RecentsAvocadoP33_E3F153D8993DA00CC31BF704859FD68A17DOCTokenChainView)initWithCoder:(id)a3;
- (_TtC14RecentsAvocadoP33_E3F153D8993DA00CC31BF704859FD68A17DOCTokenChainView)initWithFrame:(CGRect)a3;
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

- (_TtC14RecentsAvocadoP33_E3F153D8993DA00CC31BF704859FD68A17DOCTokenChainView)initWithFrame:(CGRect)a3
{
  return (_TtC14RecentsAvocadoP33_E3F153D8993DA00CC31BF704859FD68A17DOCTokenChainView *)sub_1003598B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC14RecentsAvocadoP33_E3F153D8993DA00CC31BF704859FD68A17DOCTokenChainView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10035E08C();
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  v2 = self;
  unsigned __int8 v3 = sub_100359AE4();

  return v3 & 1;
}

- (BOOL)resignFirstResponder
{
  v2 = self;
  char v3 = sub_100359D9C();

  return v3 & 1;
}

- (NSArray)keyCommands
{
  return (NSArray *)sub_10035C848(self, (uint64_t)a2, sub_100359FA0);
}

- (void)selectAll:(id)a3
{
}

- (BOOL)hasText
{
  v2 = (char *)self + OBJC_IVAR____TtC14RecentsAvocadoP33_E3F153D8993DA00CC31BF704859FD68A17DOCTokenChainView_tokens;
  swift_beginAccess();
  return *(void *)(*(void *)v2 + 16) != 0;
}

- (void)insertText:(id)a3
{
  sub_1004CDB50();
  v4 = self;
  sub_10035A318();

  swift_bridgeObjectRelease();
}

- (void)deleteBackward
{
  v2 = self;
  sub_10035AD90();
}

- (void)tap:(id)a3
{
}

- (void)directionKeyCommand:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10035E2EC();
}

- (void).cxx_destruct
{
  sub_1000391D4((uint64_t)self + OBJC_IVAR____TtC14RecentsAvocadoP33_E3F153D8993DA00CC31BF704859FD68A17DOCTokenChainView_delegate);
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocadoP33_E3F153D8993DA00CC31BF704859FD68A17DOCTokenChainView_font));
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
  sub_1000333C8(0, &qword_100635928);
  v3.super.isa = sub_1004CDE10().super.isa;
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