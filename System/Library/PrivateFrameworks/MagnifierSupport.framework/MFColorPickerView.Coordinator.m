@interface MFColorPickerView.Coordinator
- (_TtCV16MagnifierSupportP33_128412983A29D0B4093EE0414FDFF2BF17MFColorPickerView11Coordinator)init;
- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5;
- (void)colorPickerViewControllerDidFinish:(void *)a3;
@end

@implementation MFColorPickerView.Coordinator

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = self;
  MEMORY[0x237DE7380](v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268810750);
  sub_235949528();
}

- (void)colorPickerViewControllerDidFinish:(void *)a3
{
  id v4 = a3;
  v5 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268810758);
  sub_235949528();
  v5[OBJC_IVAR____TtCV16MagnifierSupportP33_128412983A29D0B4093EE0414FDFF2BF17MFColorPickerView11Coordinator_didPresent] = 0;
}

- (_TtCV16MagnifierSupportP33_128412983A29D0B4093EE0414FDFF2BF17MFColorPickerView11Coordinator)init
{
  result = (_TtCV16MagnifierSupportP33_128412983A29D0B4093EE0414FDFF2BF17MFColorPickerView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

@end