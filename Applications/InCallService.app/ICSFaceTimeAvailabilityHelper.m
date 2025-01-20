@interface ICSFaceTimeAvailabilityHelper
- (ICSFaceTimeAvailabilityHelper)init;
- (void)isHandleAvailableForFaceTime:(TUHandle *)a3 completionHandler:(id)a4;
@end

@implementation ICSFaceTimeAvailabilityHelper

- (ICSFaceTimeAvailabilityHelper)init
{
  return (ICSFaceTimeAvailabilityHelper *)sub_1001971C0();
}

- (void)isHandleAvailableForFaceTime:(TUHandle *)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;

  sub_1001BB654((uint64_t)&unk_100323A08, (uint64_t)v7);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSFaceTimeAvailabilityHelper_preferredFromID);
}

@end