@interface WorkoutLocationAnnotationView
- (_TtC15JournalSettings29WorkoutLocationAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (_TtC15JournalSettings29WorkoutLocationAnnotationView)initWithCoder:(id)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation WorkoutLocationAnnotationView

- (_TtC15JournalSettings29WorkoutLocationAnnotationView)initWithCoder:(id)a3
{
  return 0;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  sub_6FC9C(x, y, width, height);
}

- (_TtC15JournalSettings29WorkoutLocationAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  swift_unknownObjectRetain();
  result = (_TtC15JournalSettings29WorkoutLocationAnnotationView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end