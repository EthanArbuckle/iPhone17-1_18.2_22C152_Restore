@interface TerminationService
+ (_TtC10CoreAuthUI18TerminationService)shared;
+ (void)setShared:(id)a3;
- (_TtC10CoreAuthUI18TerminationService)init;
- (void)scheduleTermination;
@end

@implementation TerminationService

- (_TtC10CoreAuthUI18TerminationService)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC10CoreAuthUI18TerminationService_terminationScheduled) = 0;
  uint64_t v4 = OBJC_IVAR____TtC10CoreAuthUI18TerminationService_assertions;
  v5 = self;
  v6 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)[v5 weakObjectsHashTable];

  v8.receiver = v6;
  v8.super_class = ObjectType;
  return [(TerminationService *)&v8 init];
}

+ (_TtC10CoreAuthUI18TerminationService)shared
{
  if (qword_10009E490 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return (_TtC10CoreAuthUI18TerminationService *)(id)qword_10009FBF8;
}

+ (void)setShared:(id)a3
{
  uint64_t v3 = qword_10009E490;
  id v4 = a3;
  if (v3 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v5 = (void *)qword_10009FBF8;
  qword_10009FBF8 = (uint64_t)v4;
}

- (void)scheduleTermination
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC10CoreAuthUI18TerminationService_terminationScheduled) = 1;
  v2 = self;
  sub_100031570();
}

- (void).cxx_destruct
{
}

@end