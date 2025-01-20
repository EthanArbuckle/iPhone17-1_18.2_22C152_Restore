@interface FBKData
- (id)uploadTasksFromDatabaseWithContext:(id)a3;
- (void)allUploadTasksWithUser:(id)a3 completion:(id)a4;
- (void)beginObservingAllUploadTasks;
@end

@implementation FBKData

- (void)beginObservingAllUploadTasks
{
  v2 = self;
  sub_100061EE0();
}

- (void)allUploadTasksWithUser:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = (objc_class *)a3;
  v8 = self;
  sub_100064E30(v7, (char **)v8, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (id)uploadTasksFromDatabaseWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100065954();

  sub_100056B94(0, &qword_100122958);
  sub_100065D48((unint64_t *)&unk_100122960, &qword_100122958);
  v6.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

@end