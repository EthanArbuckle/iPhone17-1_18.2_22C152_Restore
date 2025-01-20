@interface ColorPickerView.ColorPickerCoordinator
- (_TtCV13CalendarUIKit15ColorPickerView22ColorPickerCoordinator)init;
- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5;
- (void)colorPickerViewControllerDidFinish:(id)a3;
@end

@implementation ColorPickerView.ColorPickerCoordinator

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = self;
  MEMORY[0x1C1888840](v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA0E3200);
  sub_1BE070210();
}

- (void)colorPickerViewControllerDidFinish:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_msgSend(v4, sel_dismissViewControllerAnimated_completion_, 1, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA0E31F0);
  sub_1BE070210();
}

- (_TtCV13CalendarUIKit15ColorPickerView22ColorPickerCoordinator)init
{
  result = (_TtCV13CalendarUIKit15ColorPickerView22ColorPickerCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
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