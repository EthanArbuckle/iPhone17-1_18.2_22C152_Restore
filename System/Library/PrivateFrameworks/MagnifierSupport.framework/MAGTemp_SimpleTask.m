@interface MAGTemp_SimpleTask
- (_TtC16MagnifierSupportP33_FDE17A8A13EC2302EACD66AFCA46C96E18MAGTemp_SimpleTask)init;
@end

@implementation MAGTemp_SimpleTask

- (_TtC16MagnifierSupportP33_FDE17A8A13EC2302EACD66AFCA46C96E18MAGTemp_SimpleTask)init
{
  result = (_TtC16MagnifierSupportP33_FDE17A8A13EC2302EACD66AFCA46C96E18MAGTemp_SimpleTask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupportP33_FDE17A8A13EC2302EACD66AFCA46C96E18MAGTemp_SimpleTask_task));
  sub_235676264(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC16MagnifierSupportP33_FDE17A8A13EC2302EACD66AFCA46C96E18MAGTemp_SimpleTask_stdOutData), *(void *)&self->task[OBJC_IVAR____TtC16MagnifierSupportP33_FDE17A8A13EC2302EACD66AFCA46C96E18MAGTemp_SimpleTask_stdOutData]);
  sub_235676264(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC16MagnifierSupportP33_FDE17A8A13EC2302EACD66AFCA46C96E18MAGTemp_SimpleTask_stdErrorData), *(void *)&self->task[OBJC_IVAR____TtC16MagnifierSupportP33_FDE17A8A13EC2302EACD66AFCA46C96E18MAGTemp_SimpleTask_stdErrorData]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end