@interface AudioSettingsControlCenterModule
- (_TtC34AudioConferenceControlCenterModule32AudioSettingsControlCenterModule)init;
- (id)contentViewControllerForContext:(id)a3;
- (void)setContentModuleContext:(id)a3;
@end

@implementation AudioSettingsControlCenterModule

- (void)setContentModuleContext:(id)a3
{
  v5 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC34AudioConferenceControlCenterModule32AudioSettingsControlCenterModule_contentModuleContext);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  id v7 = a3;
  v8 = self;

  sub_17FDC();
}

- (id)contentViewControllerForContext:(id)a3
{
  id v5 = a3;
  v6 = self;
  id v7 = sub_183F0(a3);

  return v7;
}

- (_TtC34AudioConferenceControlCenterModule32AudioSettingsControlCenterModule)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC34AudioConferenceControlCenterModule32AudioSettingsControlCenterModule_contentModuleContext) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(AudioSettingsControlCenterModule *)&v5 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC34AudioConferenceControlCenterModule32AudioSettingsControlCenterModule_contentModuleContext));
}

@end