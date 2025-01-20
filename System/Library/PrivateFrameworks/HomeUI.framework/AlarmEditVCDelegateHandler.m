@interface AlarmEditVCDelegateHandler
- (_TtC6HomeUIP33_248B7B14B6FEE0F07C50E5A087FE91DE26AlarmEditVCDelegateHandler)init;
- (void)alarmEditController:(id)a3 didAddAlarm:(id)a4;
- (void)alarmEditController:(id)a3 didDeleteAlarm:(id)a4;
- (void)alarmEditController:(id)a3 didEditAlarm:(id)a4;
- (void)alarmEditControllerDidCancel:(id)a3;
@end

@implementation AlarmEditVCDelegateHandler

- (void)alarmEditController:(id)a3 didAddAlarm:(id)a4
{
}

- (void)alarmEditController:(id)a3 didEditAlarm:(id)a4
{
}

- (void)alarmEditController:(id)a3 didDeleteAlarm:(id)a4
{
}

- (void)alarmEditControllerDidCancel:(id)a3
{
  uint64_t v5 = MEMORY[0x1C1898E00]((char *)self + OBJC_IVAR____TtC6HomeUIP33_248B7B14B6FEE0F07C50E5A087FE91DE26AlarmEditVCDelegateHandler_vc, a2);
  if (v5)
  {
    id v8 = (id)v5;
    id v6 = a3;
    v7 = self;
    objc_msgSend(v8, sel_dismissViewControllerAnimated_completion_, 1, 0);
  }
}

- (_TtC6HomeUIP33_248B7B14B6FEE0F07C50E5A087FE91DE26AlarmEditVCDelegateHandler)init
{
  result = (_TtC6HomeUIP33_248B7B14B6FEE0F07C50E5A087FE91DE26AlarmEditVCDelegateHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end