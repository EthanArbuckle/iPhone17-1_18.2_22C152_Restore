@interface ASEMetrics
- (_TtC9appstored10ASEMetrics)init;
- (_TtC9appstored10ASEMetrics)initWithType:(int64_t)a3;
- (void)enqueueEvent:(AMSMetricsEvent *)a3 flushEvents:(BOOL)a4 completionHandler:(id)a5;
- (void)enqueueEvents:(NSArray *)a3 flushEvents:(BOOL)a4 completionHandler:(id)a5;
- (void)flushWithCompletionHandler:(id)a3;
@end

@implementation ASEMetrics

- (_TtC9appstored10ASEMetrics)initWithType:(int64_t)a3
{
  return (_TtC9appstored10ASEMetrics *)sub_10005BAD0(a3);
}

- (void)enqueueEvent:(AMSMetricsEvent *)a3 flushEvents:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(unsigned char *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1005A47E8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1005A47F0;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  sub_1000DFAB0((uint64_t)v11, (uint64_t)&unk_1005A47F8, (uint64_t)v16);
  swift_release();
}

- (void)enqueueEvents:(NSArray *)a3 flushEvents:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(unsigned char *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1005A47D8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1005A35C8;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  sub_1000DFAB0((uint64_t)v11, (uint64_t)&unk_1005A35D0, (uint64_t)v16);
  swift_release();
}

- (void)flushWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1005A47C8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1005A35A0;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_1000DFAB0((uint64_t)v7, (uint64_t)&unk_1005A4930, (uint64_t)v12);
  swift_release();
}

- (_TtC9appstored10ASEMetrics)init
{
  result = (_TtC9appstored10ASEMetrics *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end