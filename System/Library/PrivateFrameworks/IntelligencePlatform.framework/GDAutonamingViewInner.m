@interface GDAutonamingViewInner
- (GDAutonamingViewInner)init;
- (GDAutonamingViewInner)initWithViewName:(id)a3 error:(id *)a4;
- (id)objCPersonFor:(id)a3;
- (void)_reset;
- (void)confirmWithIdentifier:(id)a3 person:(id)a4 confirmationType:(int64_t)a5;
- (void)didUpdateUserFeedback;
- (void)rejectWithIdentifier:(id)a3 person:(id)a4 confirmationType:(int64_t)a5;
@end

@implementation GDAutonamingViewInner

- (id)objCPersonFor:(id)a3
{
  sub_1B2E82378();
  v4 = self;
  v5 = (void *)sub_1B29FCA6C();

  swift_bridgeObjectRelease();

  return v5;
}

- (void)didUpdateUserFeedback
{
  v2 = self;
  sub_1B29FCDD4();
}

- (void)confirmWithIdentifier:(id)a3 person:(id)a4 confirmationType:(int64_t)a5
{
}

- (void)rejectWithIdentifier:(id)a3 person:(id)a4 confirmationType:(int64_t)a5
{
}

- (GDAutonamingViewInner)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
}

- (GDAutonamingViewInner)initWithViewName:(id)a3 error:(id *)a4
{
  uint64_t v4 = sub_1B2E82378();
  return (GDAutonamingViewInner *)AutonamingView.init(viewName:)(v4, v5);
}

- (void)_reset
{
  v2 = self;
  AutonamingView._reset()();
}

@end