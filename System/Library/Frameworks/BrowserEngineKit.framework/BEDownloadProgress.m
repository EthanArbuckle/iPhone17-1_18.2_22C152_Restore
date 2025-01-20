@interface BEDownloadProgress
- (BEDownloadProgress)initWithSourceURL:(id)a3 destinationURL:(id)a4 observedProgress:(id)a5 liveActivityAccessToken:(id)a6;
- (BEDownloadProgress)initWithSourceURL:(id)a3 destinationURL:(id)a4 progress:(id)a5 liveActivityAccessToken:(id)a6;
- (NSProgress)progress;
- (void)begin:(id)a3;
- (void)resumeWithCompletionHandler:(NSURL *)a3 completionHandler:(id)a4;
- (void)setUsePlaceholder:(BOOL)a3 type:(id)a4 fileCreatedHandler:(id)a5;
@end

@implementation BEDownloadProgress

- (BEDownloadProgress)initWithSourceURL:(id)a3 destinationURL:(id)a4 progress:(id)a5 liveActivityAccessToken:(id)a6
{
  v31[1] = self;
  uint64_t v8 = sub_243259760();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v12 = (char *)v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  v15 = (char *)v31 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  v18 = (char *)v31 - v17;
  MEMORY[0x270FA5388](v16);
  v20 = (char *)v31 - v19;
  sub_243259730();
  sub_243259730();
  v31[0] = a5;
  id v21 = a6;
  uint64_t v22 = sub_2432597A0();
  unint64_t v24 = v23;

  v25 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v25(v15, v20, v8);
  v25(v12, v18, v8);
  uint64_t v26 = (uint64_t)v12;
  v27 = v31[0];
  v28 = (BEDownloadProgress *)sub_24324DC34((uint64_t)v15, v26, v31[0], v22, v24);
  sub_24324DF00(v22, v24);

  v29 = *(void (**)(char *, uint64_t))(v9 + 8);
  v29(v18, v8);
  v29(v20, v8);
  return v28;
}

- (void)setUsePlaceholder:(BOOL)a3 type:(id)a4 fileCreatedHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8F400);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  if (!a4)
  {
    uint64_t v17 = sub_243259990();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 1, 1, v17);
    v18 = self;
    if (v12) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v16 = 0;
    goto LABEL_6;
  }
  uint64_t v13 = self;
  id v14 = a4;
  sub_243259970();

  uint64_t v15 = sub_243259990();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v11, 0, 1, v15);
  if (!v12) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v12;
  v12 = sub_24324F920;
LABEL_6:
  sub_24324BDD8(a3, (uint64_t)v11, (uint64_t)v12, v16);
  sub_24324F8D8((uint64_t)v12);

  sub_24324F70C((uint64_t)v11, &qword_268D8F400);
}

- (void)begin:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C2380);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_243259B90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_268D8F568;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_268D8F570;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_24324D420((uint64_t)v7, (uint64_t)&unk_268D8F578, (uint64_t)v12);
  swift_release();
}

- (void)resumeWithCompletionHandler:(NSURL *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C2380);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_243259B90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268D8F528;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268D8F538;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  sub_24324D420((uint64_t)v9, (uint64_t)&unk_268D8F548, (uint64_t)v14);
  swift_release();
}

- (NSProgress)progress
{
  return (NSProgress *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                               + OBJC_IVAR___BEDownloadMonitor_observedProgress));
}

- (BEDownloadProgress)initWithSourceURL:(id)a3 destinationURL:(id)a4 observedProgress:(id)a5 liveActivityAccessToken:(id)a6
{
  uint64_t v8 = sub_243259760();
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  MEMORY[0x270FA5388](v9);
  sub_243259730();
  sub_243259730();
  id v10 = a5;
  id v11 = a6;
  sub_2432597A0();

  result = (BEDownloadProgress *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end