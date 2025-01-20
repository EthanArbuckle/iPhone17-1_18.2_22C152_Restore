@interface PlayerView
+ (Class)layerClass;
- (_TtC11MediaCoreUIP33_5C0FCAEC7E121FD01840555B36210BDC10PlayerView)initWithCoder:(id)a3;
@end

@implementation PlayerView

+ (Class)layerClass
{
  sub_255A43740(0, &qword_269F22520);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC11MediaCoreUIP33_5C0FCAEC7E121FD01840555B36210BDC10PlayerView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PlayerView();
  return [(GeometryTrackingView *)&v5 initWithCoder:a3];
}

@end