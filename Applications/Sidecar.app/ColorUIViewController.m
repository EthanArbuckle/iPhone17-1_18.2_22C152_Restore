@interface ColorUIViewController
- (BOOL)_canShowWhileLocked;
- (_TtC7Sidecar21ColorUIViewController)initWithCoder:(id)a3;
- (_TtC7Sidecar21ColorUIViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
@end

@implementation ColorUIViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  v2 = self;
  sub_100011A28();
}

- (_TtC7Sidecar21ColorUIViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtC7Sidecar21ColorUIViewController *)sub_100011F14((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t))type metadata accessor for ColorUIViewController);
}

- (_TtC7Sidecar21ColorUIViewController)initWithCoder:(id)a3
{
  return (_TtC7Sidecar21ColorUIViewController *)sub_100011F88(a3, type metadata accessor for ColorUIViewController);
}

@end