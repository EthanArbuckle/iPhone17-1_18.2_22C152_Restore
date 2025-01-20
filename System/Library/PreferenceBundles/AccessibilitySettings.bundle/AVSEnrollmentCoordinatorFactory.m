@interface AVSEnrollmentCoordinatorFactory
+ (id)createWithCompletionHandler:(id)a3;
- (_TtC21AccessibilitySettings31AVSEnrollmentCoordinatorFactory)init;
@end

@implementation AVSEnrollmentCoordinatorFactory

+ (id)createWithCompletionHandler:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  v5 = (void *)sub_145374((uint64_t)sub_144414, v4);
  swift_release();

  return v5;
}

- (_TtC21AccessibilitySettings31AVSEnrollmentCoordinatorFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AVSEnrollmentCoordinatorFactory();
  return [(AVSEnrollmentCoordinatorFactory *)&v3 init];
}

@end