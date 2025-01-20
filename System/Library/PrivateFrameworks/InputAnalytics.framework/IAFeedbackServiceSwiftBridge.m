@interface IAFeedbackServiceSwiftBridge
- (IAFeedbackServiceSwiftBridge)init;
- (IAFeedbackServiceSwiftBridge)initWithFeatureDomain:(int64_t)a3 action:(int64_t)a4 originalContent:(id)a5 generatedContent:(id)a6 modelInfo:(id)a7;
- (NSString)generatedContent;
- (NSString)modelInfo;
- (NSString)originalContent;
- (int64_t)action;
- (int64_t)featureDomain;
- (void)launchFeedbackWithCompletionHandler:(id)a3;
- (void)reportPresentedWithCompletionHandler:(id)a3;
- (void)setAction:(int64_t)a3;
- (void)setFeatureDomain:(int64_t)a3;
- (void)setGeneratedContent:(id)a3;
- (void)setModelInfo:(id)a3;
- (void)setOriginalContent:(id)a3;
@end

@implementation IAFeedbackServiceSwiftBridge

- (int64_t)featureDomain
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IAFeedbackServiceSwiftBridge_featureDomain);
}

- (void)setFeatureDomain:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IAFeedbackServiceSwiftBridge_featureDomain) = (Class)a3;
}

- (int64_t)action
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IAFeedbackServiceSwiftBridge_action);
}

- (void)setAction:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IAFeedbackServiceSwiftBridge_action) = (Class)a3;
}

- (NSString)originalContent
{
  return (NSString *)sub_252A0C4D0();
}

- (void)setOriginalContent:(id)a3
{
}

- (NSString)generatedContent
{
  return (NSString *)sub_252A0C4D0();
}

- (void)setGeneratedContent:(id)a3
{
}

- (NSString)modelInfo
{
  if (*(void *)&self->featureDomain[OBJC_IVAR___IAFeedbackServiceSwiftBridge_modelInfo])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_252A12290();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (void)setModelInfo:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_252A122A0();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___IAFeedbackServiceSwiftBridge_modelInfo);
  uint64_t *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease();
}

- (IAFeedbackServiceSwiftBridge)initWithFeatureDomain:(int64_t)a3 action:(int64_t)a4 originalContent:(id)a5 generatedContent:(id)a6 modelInfo:(id)a7
{
  uint64_t v8 = (uint64_t)a6;
  if (a5)
  {
    uint64_t v11 = sub_252A122A0();
    unint64_t v13 = v12;
    if (v8) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v15 = 0;
    if (a7) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v16 = 0;
    uint64_t v18 = 0;
    return (IAFeedbackServiceSwiftBridge *)sub_252A0C658(a3, a4, v11, v13, v8, v15, v16, v18);
  }
  uint64_t v11 = 0;
  unint64_t v13 = 0;
  if (!a6) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v8 = sub_252A122A0();
  unint64_t v15 = v14;
  if (!a7) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v16 = sub_252A122A0();
  uint64_t v18 = v17;
  return (IAFeedbackServiceSwiftBridge *)sub_252A0C658(a3, a4, v11, v13, v8, v15, v16, v18);
}

- (void)reportPresentedWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_252A0E788(&qword_269C401B8);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_252A122F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_269C40230;
  v11[5] = v9;
  unint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_269C40238;
  v12[5] = v11;
  unint64_t v13 = self;
  sub_252A0EBA8((uint64_t)v7, (uint64_t)&unk_269C40240, (uint64_t)v12);
  swift_release();
}

- (void)launchFeedbackWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_252A0E788(&qword_269C401B8);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_252A122F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_269C401C8;
  v11[5] = v9;
  unint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_269C401D8;
  v12[5] = v11;
  unint64_t v13 = self;
  sub_252A0EBA8((uint64_t)v7, (uint64_t)&unk_269C401E8, (uint64_t)v12);
  swift_release();
}

- (IAFeedbackServiceSwiftBridge)init
{
  result = (IAFeedbackServiceSwiftBridge *)_swift_stdlib_reportUnimplementedInitializer();
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