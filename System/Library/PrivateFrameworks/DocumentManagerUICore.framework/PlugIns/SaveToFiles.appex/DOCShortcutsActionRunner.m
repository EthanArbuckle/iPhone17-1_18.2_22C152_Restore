@interface DOCShortcutsActionRunner
- (_TtC11SaveToFilesP33_6B3E7195EC6D359C6AEDAEFBFD702A5524DOCShortcutsActionRunner)init;
- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutputFiles:(id)a4 error:(id)a5 cancelled:(BOOL)a6;
@end

@implementation DOCShortcutsActionRunner

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutputFiles:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  uint64_t v7 = (uint64_t)a4;
  if (a4)
  {
    sub_100036804(0, (unint64_t *)&unk_100638650);
    uint64_t v7 = sub_1004D1510();
  }
  v10 = *(void (**)(uint64_t, id))((char *)&self->super.isa
                                           + OBJC_IVAR____TtC11SaveToFilesP33_6B3E7195EC6D359C6AEDAEFBFD702A5524DOCShortcutsActionRunner_completionHandler);
  id v11 = a3;
  id v12 = a5;
  v13 = self;
  swift_retain();
  v10(v7, a5);

  swift_release();
  swift_bridgeObjectRelease();
}

- (_TtC11SaveToFilesP33_6B3E7195EC6D359C6AEDAEFBFD702A5524DOCShortcutsActionRunner)init
{
  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC11SaveToFilesP33_6B3E7195EC6D359C6AEDAEFBFD702A5524DOCShortcutsActionRunner_completionHandler);
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