@interface CameraAuthViewModel
- (_TtC15ImagePlayground19CameraAuthViewModel)init;
@end

@implementation CameraAuthViewModel

- (_TtC15ImagePlayground19CameraAuthViewModel)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_2443B5620();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(CameraAuthViewModel *)&v5 init];
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC15ImagePlayground19CameraAuthViewModel___observationRegistrar;
  uint64_t v3 = sub_2443B5630();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end