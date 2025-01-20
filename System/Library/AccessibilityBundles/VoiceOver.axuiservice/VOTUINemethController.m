@interface VOTUINemethController
- (BOOL)_canShowWhileLocked;
- (VOTUINemethController)initWithCoder:(id)a3;
- (VOTUINemethController)initWithDismissAction:(id)a3 setBrailleUnicodeTable:(id)a4 unsetBrailleUnicodeTable:(id)a5;
- (VOTUINemethController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation VOTUINemethController

- (VOTUINemethController)initWithDismissAction:(id)a3 setBrailleUnicodeTable:(id)a4 unsetBrailleUnicodeTable:(id)a5
{
  v8 = _Block_copy(a3);
  v9 = _Block_copy(a4);
  v10 = _Block_copy(a5);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v8;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v9;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v10;
  v14 = (uint64_t (**)())((char *)self + OBJC_IVAR___VOTUINemethController_dismissAction);
  *v14 = sub_2321C;
  v14[1] = (uint64_t (*)())v11;
  v15 = (uint64_t (**)())((char *)self + OBJC_IVAR___VOTUINemethController_setBrailleUnicodeTable);
  *v15 = sub_2322C;
  v15[1] = (uint64_t (*)())v12;
  v16 = (uint64_t (**)())((char *)self + OBJC_IVAR___VOTUINemethController_unsetBrailleUnicodeTable);
  *v16 = sub_2322C;
  v16[1] = (uint64_t (*)())v13;
  v18.receiver = self;
  v18.super_class = (Class)type metadata accessor for VOTUINemethController();
  return [(VOTUINemethController *)&v18 initWithNibName:0 bundle:0];
}

- (VOTUINemethController)initWithCoder:(id)a3
{
  result = (VOTUINemethController *)sub_27CD0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for VOTUINemethController();
  [(VOTUINemethController *)&v2 viewDidLoad];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_2299C(a3);
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  id v12 = sub_22F78((uint64_t)v8, (uint64_t)a4);

  return v12;
}

- (BOOL)_canShowWhileLocked
{
  return 0;
}

- (VOTUINemethController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (VOTUINemethController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_release();
}

@end