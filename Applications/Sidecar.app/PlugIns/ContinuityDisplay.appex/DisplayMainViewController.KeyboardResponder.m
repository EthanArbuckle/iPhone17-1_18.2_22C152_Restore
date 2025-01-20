@interface DisplayMainViewController.KeyboardResponder
- (BOOL)_canShowWhileLocked;
- (BOOL)acceptsFloatingKeyboard;
- (BOOL)canBecomeFirstResponder;
- (BOOL)disableInputBars;
- (BOOL)forceFloatingKeyboard;
- (BOOL)hasText;
- (UIEdgeInsets)floatingKeyboardEdgeInsets;
- (_TtCC17ContinuityDisplay25DisplayMainViewController17KeyboardResponder)initWithCoder:(id)a3;
- (_TtCC17ContinuityDisplay25DisplayMainViewController17KeyboardResponder)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)autocapitalizationType;
- (int64_t)autocorrectionType;
- (int64_t)keyboardAppearance;
- (int64_t)keyboardType;
- (int64_t)returnKeyType;
- (int64_t)smartDashesType;
- (int64_t)smartInsertDeleteType;
- (int64_t)smartQuotesType;
- (int64_t)spellCheckingType;
- (void)copy:(id)a3;
- (void)cut:(id)a3;
- (void)deleteBackward;
- (void)insertText:(id)a3;
- (void)loadView;
- (void)paste:(id)a3;
@end

@implementation DisplayMainViewController.KeyboardResponder

- (BOOL)disableInputBars
{
  return 1;
}

- (UIEdgeInsets)floatingKeyboardEdgeInsets
{
  v2 = self;
  double v3 = sub_10003AFA0();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (BOOL)forceFloatingKeyboard
{
  return 1;
}

- (BOOL)acceptsFloatingKeyboard
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)cut:(id)a3
{
}

- (void)copy:(id)a3
{
}

- (void)paste:(id)a3
{
}

- (void)loadView
{
  v2 = self;
  sub_10003B130();
}

- (BOOL)hasText
{
  return 0;
}

- (void)insertText:(id)a3
{
  sub_10005E920();
  double v4 = self;
  sub_10003B1E0();

  swift_bridgeObjectRelease();
}

- (void)deleteBackward
{
  v2 = self;
  sub_10003B3D8();
}

- (int64_t)keyboardType
{
  return 1;
}

- (int64_t)autocapitalizationType
{
  return 0;
}

- (int64_t)autocorrectionType
{
  return 1;
}

- (int64_t)spellCheckingType
{
  return 1;
}

- (int64_t)smartQuotesType
{
  return 1;
}

- (int64_t)smartDashesType
{
  return 1;
}

- (int64_t)smartInsertDeleteType
{
  return 1;
}

- (int64_t)keyboardAppearance
{
  return 1;
}

- (int64_t)returnKeyType
{
  return 0;
}

- (_TtCC17ContinuityDisplay25DisplayMainViewController17KeyboardResponder)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtCC17ContinuityDisplay25DisplayMainViewController17KeyboardResponder *)sub_10003B6B0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))sub_10003B604);
}

- (_TtCC17ContinuityDisplay25DisplayMainViewController17KeyboardResponder)initWithCoder:(id)a3
{
  return (_TtCC17ContinuityDisplay25DisplayMainViewController17KeyboardResponder *)sub_10003B724(a3);
}

- (void).cxx_destruct
{
}

@end