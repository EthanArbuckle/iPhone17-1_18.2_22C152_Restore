@interface PopoverTip.PopoverContainer
- (_TtCV6TipKit10PopoverTipP33_FA7A00E5D8BDD1BDC1C9B8F9105F43F616PopoverContainer)init;
- (void)prepareForPopoverPresentation:(id)a3;
@end

@implementation PopoverTip.PopoverContainer

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  v3 = (char *)self
     + OBJC_IVAR____TtCV6TipKit10PopoverTipP33_FA7A00E5D8BDD1BDC1C9B8F9105F43F616PopoverContainer___observationRegistrar;
  uint64_t v4 = sub_246386110();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (_TtCV6TipKit10PopoverTipP33_FA7A00E5D8BDD1BDC1C9B8F9105F43F616PopoverContainer)init
{
  sub_2463870F0();
  sub_2463870E0();
  sub_2463870D0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v2 = (_TtCV6TipKit10PopoverTipP33_FA7A00E5D8BDD1BDC1C9B8F9105F43F616PopoverContainer *)sub_24632AF24();
  swift_release();
  return v2;
}

- (void)prepareForPopoverPresentation:(id)a3
{
  sub_2463870F0();
  sub_2463870E0();
  sub_2463870D0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a3;
  v6 = self;
  sub_246382EB0(v5);
  swift_release();
}

@end