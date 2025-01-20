@interface SimpleContentModule
- (_TtC15ControlCenterUI19SimpleContentModule)init;
- (id)contentViewControllerForContext:(id)a3;
- (unint64_t)supportedGridSizeClasses;
@end

@implementation SimpleContentModule

- (id)contentViewControllerForContext:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC15ControlCenterUI19SimpleContentModule_contentModuleViewController));
}

- (unint64_t)supportedGridSizeClasses
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC15ControlCenterUI19SimpleContentModule_supportedGridSizeClasses);
}

- (_TtC15ControlCenterUI19SimpleContentModule)init
{
  result = (_TtC15ControlCenterUI19SimpleContentModule *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ControlCenterUI19SimpleContentModule_contentModuleViewController));
}

@end