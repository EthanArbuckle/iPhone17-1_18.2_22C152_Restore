@interface CKReportSpamReasonContoller
- (CKReportSpamReasonContoller)initWithCoder:(id)a3;
- (CKReportSpamReasonContoller)initWithConversations:(id)a3 didReportBlock:(id)a4;
- (CKReportSpamReasonContoller)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissReportSpamcontroller;
- (void)reportSpam;
- (void)viewDidLoad;
@end

@implementation CKReportSpamReasonContoller

- (CKReportSpamReasonContoller)initWithConversations:(id)a3 didReportBlock:(id)a4
{
  v5 = _Block_copy(a4);
  sub_18EF3528C(0, (unint64_t *)&qword_1E922B620);
  v6 = (objc_class *)sub_18F7B99C0();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  v8 = (char *)self + OBJC_IVAR___CKReportSpamReasonContoller_reportSpamReson;
  *(void *)v8 = 0;
  v8[8] = 1;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKReportSpamReasonContoller_conversations) = v6;
  *(void *)v8 = 0;
  v8[8] = 1;
  v9 = (uint64_t (**)())((char *)self + OBJC_IVAR___CKReportSpamReasonContoller_didReportBlock);
  *v9 = sub_18F4C1E94;
  v9[1] = (uint64_t (*)())v7;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ReportSpamReasonContoller();
  return [(CKReportSpamReasonContoller *)&v11 initWithNibName:0 bundle:0];
}

- (CKReportSpamReasonContoller)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR___CKReportSpamReasonContoller_reportSpamReson;
  *(void *)v4 = 0;
  v4[8] = 1;
  id v5 = a3;

  result = (CKReportSpamReasonContoller *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_18F620C98();
}

- (void)dismissReportSpamcontroller
{
  v2 = self;
  sub_18F621444();
}

- (void)reportSpam
{
  v2 = self;
  sub_18F621600();
}

- (CKReportSpamReasonContoller)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (CKReportSpamReasonContoller *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

@end