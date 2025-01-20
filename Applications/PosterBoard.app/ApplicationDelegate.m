@interface ApplicationDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (_TtC11PosterBoard19ApplicationDelegate)init;
@end

@implementation ApplicationDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (_TtC11PosterBoard19ApplicationDelegate)init
{
  uint64_t v3 = OBJC_IVAR____TtC11PosterBoard19ApplicationDelegate_glue;
  v4 = self;
  v5 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)[v4 sharedInstance];

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for ApplicationDelegate();
  return [(ApplicationDelegate *)&v7 init];
}

- (void).cxx_destruct
{
}

@end