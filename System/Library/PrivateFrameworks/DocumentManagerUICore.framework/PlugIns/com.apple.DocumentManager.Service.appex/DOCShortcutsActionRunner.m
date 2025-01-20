@interface DOCShortcutsActionRunner
- (_TtC33com_apple_DocumentManager_ServiceP33_337C17BBCD1F24BE828FD645792FAE1724DOCShortcutsActionRunner)init;
- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutputFiles:(id)a4 error:(id)a5 cancelled:(BOOL)a6;
@end

@implementation DOCShortcutsActionRunner

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutputFiles:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  uint64_t v7 = (uint64_t)a4;
  if (a4)
  {
    sub_10003AE74(0, &qword_100632918);
    uint64_t v7 = sub_1004CD5C0();
  }
  v10 = *(void (**)(uint64_t, id))((char *)&self->super.isa
                                           + OBJC_IVAR____TtC33com_apple_DocumentManager_ServiceP33_337C17BBCD1F24BE828FD645792FAE1724DOCShortcutsActionRunner_completionHandler);
  id v11 = a3;
  id v12 = a5;
  v13 = self;
  swift_retain();
  v10(v7, a5);

  swift_release();
  swift_bridgeObjectRelease();
}

- (_TtC33com_apple_DocumentManager_ServiceP33_337C17BBCD1F24BE828FD645792FAE1724DOCShortcutsActionRunner)init
{
  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC33com_apple_DocumentManager_ServiceP33_337C17BBCD1F24BE828FD645792FAE1724DOCShortcutsActionRunner_completionHandler);
  void *v2 = DOCSplitBrowserViewController.didCommitPreview(of:);
  v2[1] = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCShortcutsActionRunner();
  return [(DOCShortcutsActionRunner *)&v4 init];
}

- (void).cxx_destruct
{
}

@end