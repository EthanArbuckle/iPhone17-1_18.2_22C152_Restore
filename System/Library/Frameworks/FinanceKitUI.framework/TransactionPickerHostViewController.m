@interface TransactionPickerHostViewController
- (_TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B35TransactionPickerHostViewController)initWithCoder:(id)a3;
- (_TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B35TransactionPickerHostViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_UIRemoteViewController)_containedRemoteViewController;
- (void)dealloc;
- (void)viewWillLayoutSubviews;
@end

@implementation TransactionPickerHostViewController

- (_TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B35TransactionPickerHostViewController)initWithCoder:(id)a3
{
  v3 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B35TransactionPickerHostViewController_delegate);
  void *v3 = 0;
  v3[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B35TransactionPickerHostViewController_remoteViewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B35TransactionPickerHostViewController_cancelRequestHandler) = 0;

  result = (_TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B35TransactionPickerHostViewController *)sub_243DFF2A0();
  __break(1u);
  return result;
}

- (void)dealloc
{
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B35TransactionPickerHostViewController_cancelRequestHandler);
  v4 = self;
  if (v3) {

  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TransactionPickerHostViewController();
  [(TransactionPickerHostViewController *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B35TransactionPickerHostViewController_remoteViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B35TransactionPickerHostViewController_cancelRequestHandler));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B35TransactionPickerHostViewController_activityIndicator);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_243DB99AC();
}

- (_TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B35TransactionPickerHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B35TransactionPickerHostViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  return (_UIRemoteViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                            + OBJC_IVAR____TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B35TransactionPickerHostViewController_remoteViewController));
}

@end