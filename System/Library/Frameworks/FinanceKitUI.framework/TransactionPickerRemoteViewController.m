@interface TransactionPickerRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (_TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B37TransactionPickerRemoteViewController)initWithCoder:(id)a3;
- (_TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B37TransactionPickerRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)cancelled;
- (void)failedWith:(id)a3;
- (void)foundWithTransactions:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation TransactionPickerRemoteViewController

+ (id)serviceViewControllerInterface
{
  id v2 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26F916930);

  return v2;
}

+ (id)exportedInterface
{
  id v2 = (void *)_s12FinanceKitUI35TransactionPickerExportedInterfacesO14remoteProtocolSo14NSXPCInterfaceCyFZ_0();

  return v2;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  v4 = self;
  id v5 = a3;
  sub_243DBA4EC(a3);
}

- (_TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B37TransactionPickerRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_243DFE910();
    v6 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B37TransactionPickerRemoteViewController_delegate);
    void *v6 = 0;
    v6[1] = 0;
    id v7 = a4;
    v8 = (void *)sub_243DFE8E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B37TransactionPickerRemoteViewController_delegate);
    void *v9 = 0;
    v9[1] = 0;
    id v10 = a4;
    v8 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for TransactionPickerRemoteViewController();
  v11 = [(TransactionPickerRemoteViewController *)&v13 initWithNibName:v8 bundle:a4];

  return v11;
}

- (_TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B37TransactionPickerRemoteViewController)initWithCoder:(id)a3
{
  id v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B37TransactionPickerRemoteViewController_delegate);
  v6 = (objc_class *)type metadata accessor for TransactionPickerRemoteViewController();
  *id v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(TransactionPickerRemoteViewController *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

- (void)foundWithTransactions:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_243DBA984(v4);
}

- (void)cancelled
{
  id v2 = self;
  sub_243DBAC80();
}

- (void)failedWith:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_243DBAE40(v4);
}

@end