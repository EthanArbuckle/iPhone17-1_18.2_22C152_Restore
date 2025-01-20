@interface CKCloudTipViewModel
+ (_TtC7ChatKit19CKCloudTipViewModel)sharedInstance;
+ (void)enableCloudSyncing;
- (_TtC7ChatKit19CKCloudTipViewModel)init;
- (_TtC7ChatKit20CKCloudTipDescriptor)currentTipDescriptor;
- (id)onCloudTipChanged;
- (int64_t)displayContext;
- (void)configureCloudTipManagerWithCompletionHandler:(id)a3;
- (void)setCurrentTipDescriptor:(id)a3;
- (void)setDisplayContext:(int64_t)a3;
- (void)setOnCloudTipChanged:(id)a3;
@end

@implementation CKCloudTipViewModel

+ (_TtC7ChatKit19CKCloudTipViewModel)sharedInstance
{
  if (qword_1E922AA30 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E922AE58;

  return (_TtC7ChatKit19CKCloudTipViewModel *)v2;
}

- (void)setOnCloudTipChanged:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_18F4CCAC8;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC7ChatKit19CKCloudTipViewModel_onCloudTipChanged);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_18EF6E880(v7);
}

- (void)configureCloudTipManagerWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB442C50);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_18F7B9AE0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = aDxi;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = a0nu;
  v12[5] = v11;
  v13 = self;
  sub_18EF277D4((uint64_t)v7, (uint64_t)&unk_1E9239EF0, (uint64_t)v12);
  swift_release();
}

- (_TtC7ChatKit19CKCloudTipViewModel)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit19CKCloudTipViewModel_currentTipDescriptor) = 0;
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit19CKCloudTipViewModel_onCloudTipChanged);
  void *v2 = 0;
  v2[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit19CKCloudTipViewModel_displayContext) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CKCloudTipViewModel();
  return [(CKCloudTipViewModel *)&v4 init];
}

- (_TtC7ChatKit20CKCloudTipDescriptor)currentTipDescriptor
{
  return (_TtC7ChatKit20CKCloudTipDescriptor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                       + OBJC_IVAR____TtC7ChatKit19CKCloudTipViewModel_currentTipDescriptor));
}

- (void)setCurrentTipDescriptor:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit19CKCloudTipViewModel_currentTipDescriptor);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit19CKCloudTipViewModel_currentTipDescriptor) = (Class)a3;
  id v3 = a3;
}

- (id)onCloudTipChanged
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit19CKCloudTipViewModel_onCloudTipChanged);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_18F4C1910;
    aBlock[3] = &block_descriptor_6;
    id v4 = _Block_copy(aBlock);
    sub_18F7B5790();
    swift_release();
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (int64_t)displayContext
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC7ChatKit19CKCloudTipViewModel_displayContext);
  swift_beginAccess();
  return *v2;
}

- (void)setDisplayContext:(int64_t)a3
{
  id v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC7ChatKit19CKCloudTipViewModel_displayContext);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit19CKCloudTipViewModel_onCloudTipChanged);

  sub_18EF6E880(v3);
}

+ (void)enableCloudSyncing
{
  v2 = self;
  id v3 = objc_msgSend(v2, sel_sharedInstance);
  if (!v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return;
  }
  id v4 = v3;
  unsigned __int8 v5 = objc_msgSend(v3, sel_isEnabled);

  if (v5) {
    return;
  }
  id v6 = objc_msgSend(v2, sel_sharedInstance);
  if (!v6) {
    goto LABEL_8;
  }
  id v7 = v6;
  objc_msgSend(v6, sel_setEnabled_, 1);
}

@end