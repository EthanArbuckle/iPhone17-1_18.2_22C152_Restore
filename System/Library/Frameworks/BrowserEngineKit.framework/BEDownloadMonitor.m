@interface BEDownloadMonitor
+ (id)createAccessToken;
- (BEDownloadMonitor)init;
- (BEDownloadMonitor)initWithSourceURL:(id)a3 destinationURL:(id)a4 observedProgress:(id)a5 liveActivityAccessToken:(id)a6;
- (NSURL)destinationURL;
- (NSURL)sourceURL;
- (NSUUID)identifier;
- (void)beginMonitoring:(id)a3;
- (void)dealloc;
- (void)resumeMonitoring:(NSURL *)a3 completionHandler:(id)a4;
- (void)useDownloadsFolderWithPlaceholderType:(id)a3 finalFileCreatedHandler:(id)a4;
@end

@implementation BEDownloadMonitor

- (BEDownloadMonitor)initWithSourceURL:(id)a3 destinationURL:(id)a4 observedProgress:(id)a5 liveActivityAccessToken:(id)a6
{
  uint64_t v8 = sub_243259760();
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  v13 = (char *)&v21 - v12;
  sub_243259730();
  sub_243259730();
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = sub_2432597A0();
  unint64_t v18 = v17;

  v19 = (BEDownloadMonitor *)sub_24324DC34((uint64_t)v13, (uint64_t)v11, v14, v16, v18);
  sub_24324DF00(v16, v18);

  return v19;
}

- (void)useDownloadsFolderWithPlaceholderType:(id)a3 finalFileCreatedHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8F400);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  if (a3)
  {
    v11 = self;
    id v12 = a3;
    sub_243259970();

    uint64_t v13 = sub_243259990();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v9, 0, 1, v13);
  }
  else
  {
    uint64_t v14 = sub_243259990();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v9, 1, 1, v14);
    id v15 = self;
  }
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v10;
  sub_2432453B0((uint64_t)v9, (uint64_t)sub_243250684, v16);
  swift_release();

  sub_24324F70C((uint64_t)v9, &qword_268D8F400);
}

- (void)beginMonitoring:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C2380);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_243259B90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_268D8F5A8;
  v11[5] = v9;
  id v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_268D8F5B0;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_24324D420((uint64_t)v7, (uint64_t)&unk_268D8F5B8, (uint64_t)v12);
  swift_release();
}

- (void)resumeMonitoring:(NSURL *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C2380);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_243259B90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268D8F588;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268D8F590;
  v14[5] = v13;
  id v15 = a3;
  uint64_t v16 = self;
  sub_24324D420((uint64_t)v9, (uint64_t)&unk_268D8F598, (uint64_t)v14);
  swift_release();
}

+ (id)createAccessToken
{
  uint64_t v2 = _s16BrowserEngineKit17BEDownloadMonitorC17createAccessToken10Foundation4DataVSgyFZ_0();
  if (v3 >> 60 == 15)
  {
    v4 = 0;
  }
  else
  {
    uint64_t v5 = v2;
    unint64_t v6 = v3;
    v4 = (void *)sub_243259790();
    sub_24324E78C(v5, v6);
  }

  return v4;
}

- (void)dealloc
{
  uint64_t v2 = self;
  sandbox_extension_release();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for BEDownloadMonitor(0);
  [(BEDownloadMonitor *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_super v3 = (char *)self + OBJC_IVAR___BEDownloadMonitor_id;
  uint64_t v4 = sub_2432597E0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR___BEDownloadMonitor_sourceURL;
  uint64_t v6 = sub_243259760();
  uint64_t v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v7((char *)self + OBJC_IVAR___BEDownloadMonitor_destinationURL, v6);

  sub_24324F8D8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BEDownloadMonitor_finalFileCreatedHandler));
  uint64_t v8 = (char *)self + OBJC_IVAR___BEDownloadMonitor_placeholderType;
  uint64_t v9 = sub_243259990();
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);

  sub_24324E78C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BEDownloadMonitor_placeholderURLBookmarkData), *(void *)&self->_anon_0[OBJC_IVAR___BEDownloadMonitor_placeholderURLBookmarkData]);
  uint64_t v10 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BEDownloadMonitor_liveActivityAccessToken);
  unint64_t v11 = *(void *)&self->_anon_0[OBJC_IVAR___BEDownloadMonitor_liveActivityAccessToken];

  sub_24324DF00(v10, v11);
}

- (NSUUID)identifier
{
  uint64_t v2 = (void *)sub_2432597C0();

  return (NSUUID *)v2;
}

- (NSURL)sourceURL
{
  uint64_t v2 = (void *)sub_243259700();

  return (NSURL *)v2;
}

- (NSURL)destinationURL
{
  uint64_t v2 = (void *)sub_243259700();

  return (NSURL *)v2;
}

- (BEDownloadMonitor)init
{
  result = (BEDownloadMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end