@interface MagnifyRepresentable.Coordinator
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (_TtCV11CalculateUI20MagnifyRepresentable11Coordinator)init;
@end

@implementation MagnifyRepresentable.Coordinator

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  BOOL v9 = sub_2496449A8(v7);

  return v9;
}

- (_TtCV11CalculateUI20MagnifyRepresentable11Coordinator)init
{
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCV11CalculateUI20MagnifyRepresentable11Coordinator_initialLocation);
  v4 = (objc_class *)type metadata accessor for MagnifyRepresentable.Coordinator();
  void *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(MagnifyRepresentable.Coordinator *)&v6 init];
}

@end