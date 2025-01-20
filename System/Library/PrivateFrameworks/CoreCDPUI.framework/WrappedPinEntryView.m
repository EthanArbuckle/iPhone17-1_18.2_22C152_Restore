@interface WrappedPinEntryView
- (BOOL)canBecomeFirstResponder;
- (BOOL)hasText;
- (BOOL)isSecureTextEntry;
- (_TtC9CoreCDPUI19WrappedPinEntryView)initWithCoder:(id)a3;
- (_TtC9CoreCDPUI19WrappedPinEntryView)initWithFrame:(CGRect)a3;
- (int64_t)keyboardType;
- (void)deleteBackward;
- (void)insertText:(id)a3;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)setKeyboardType:(int64_t)a3;
- (void)setSecureTextEntry:(BOOL)a3;
@end

@implementation WrappedPinEntryView

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)isSecureTextEntry
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC9CoreCDPUI19WrappedPinEntryView_isSecureTextEntry);
}

- (void)setSecureTextEntry:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC9CoreCDPUI19WrappedPinEntryView_isSecureTextEntry) = a3;
}

- (_TtC9CoreCDPUI19WrappedPinEntryView)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC9CoreCDPUI19WrappedPinEntryView_delegate) = 0;
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC9CoreCDPUI19WrappedPinEntryView_isSecureTextEntry) = 1;
  id v5 = a3;

  result = (_TtC9CoreCDPUI19WrappedPinEntryView *)sub_218862320();
  __break(1u);
  return result;
}

- (int64_t)keyboardType
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_currentDevice);
  id v6 = objc_msgSend(v5, sel_userInterfaceIdiom);

  if (v6 == (id)1) {
    return 1;
  }
  else {
    return 4;
  }
}

- (void)setKeyboardType:(int64_t)a3
{
  uint64_t v3 = qword_267BDC0D8;
  v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_218860F60();
  __swift_project_value_buffer(v5, (uint64_t)qword_267BE06E8);
  oslog = sub_218860F40();
  os_log_type_t v6 = sub_218862140();
  if (os_log_type_enabled(oslog, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2187CF000, oslog, v6, "KeyboardType cannot be set.", v7, 2u);
    MEMORY[0x21D475080](v7, -1, -1);
  }
}

- (BOOL)hasText
{
  v2 = self;
  BOOL v3 = sub_218810C94();

  return v3;
}

- (void)insertText:(id)a3
{
  uint64_t v4 = sub_218861F40();
  unint64_t v6 = v5;
  v7 = self;
  sub_218810D10(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)deleteBackward
{
  v2 = self;
  sub_21881103C();
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  sub_218812F1C();
  sub_218814248(&qword_267BDC490, (void (*)(uint64_t))sub_218812F1C);
  uint64_t v6 = sub_2188620F0();
  id v7 = a4;
  v8 = self;
  sub_218812F5C(v6);

  swift_bridgeObjectRelease();
}

- (_TtC9CoreCDPUI19WrappedPinEntryView)initWithFrame:(CGRect)a3
{
  result = (_TtC9CoreCDPUI19WrappedPinEntryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  BOOL v3 = (char *)self + OBJC_IVAR____TtC9CoreCDPUI19WrappedPinEntryView_delegate;

  sub_21880E860((uint64_t)v3);
}

@end