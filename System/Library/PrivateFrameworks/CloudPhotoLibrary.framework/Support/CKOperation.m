@interface CKOperation
+ (id)cplOperationClassDescription;
- (id)cplOperationClassDescription;
- (id)cpl_task;
- (void)cpl_setTask:(id)a3;
@end

@implementation CKOperation

- (id)cpl_task
{
  return objc_getAssociatedObject(self, &off_100278928);
}

- (void)cpl_setTask:(id)a3
{
}

+ (id)cplOperationClassDescription
{
  swift_getObjCClassMetadata();
  sub_1000D0514(&qword_1002CA370);
  String.init<A>(describing:)();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v2;
}

- (id)cplOperationClassDescription
{
  swift_getObjectType();
  sub_1000D0514(&qword_1002CA370);
  String.init<A>(describing:)();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v2;
}

@end