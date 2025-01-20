@interface ATXAmbientSuggestionProvider
- (ATXAmbientSuggestionProvider)init;
- (ATXAmbientSuggestionProviderDelegate)delegate;
- (NSArray)stackSuggestions;
- (void)ambientConfigurationManagerCacheDidUpdate;
- (void)dealloc;
- (void)logStackDidChangeToWidget:(id)a3 reason:(unint64_t)a4;
- (void)logUserDidTapWidget:(id)a3;
- (void)logViewDidAppear;
- (void)logViewDidDisappear;
- (void)logWidgetStack:(id)a3 didChangeToWidget:(id)a4 reason:(unint64_t)a5;
- (void)readStacksWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)writeStacks:(NSArray *)a3 completion:(id)a4;
@end

@implementation ATXAmbientSuggestionProvider

- (NSArray)stackSuggestions
{
  v2 = *(os_unfair_lock_s **)((char *)&self->super.isa + OBJC_IVAR___ATXAmbientSuggestionProvider_lock);
  uint64_t v3 = (uint64_t)&v2[4];
  v4 = v2 + 6;
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_24A7ABD24(v3, &v9);
  os_unfair_lock_unlock(v4);
  uint64_t v6 = v9;

  if (v6)
  {
    type metadata accessor for ATXWidgetStackSuggestion(0);
    v7 = (void *)sub_24A7B3408();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return (NSArray *)v7;
}

- (ATXAmbientSuggestionProvider)init
{
  return (ATXAmbientSuggestionProvider *)ATXAmbientSuggestionProvider.init()();
}

- (void)dealloc
{
  v2 = self;
  sub_24A7ADCF8();
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();

  uint64_t v3 = (char *)self + OBJC_IVAR___ATXAmbientSuggestionProvider_delegate;
  sub_24A7AA10C((uint64_t)v3);
}

- (ATXAmbientSuggestionProviderDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___ATXAmbientSuggestionProvider_delegate;
  swift_beginAccess();
  uint64_t v3 = (void *)MEMORY[0x24C5D0680](v2);
  return (ATXAmbientSuggestionProviderDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (void)logViewDidAppear
{
  v2 = self;
  uint64_t v3 = sub_24A7ABB80();
  (*(void (**)(uint64_t))(*(void *)v3 + 128))(v3);

  swift_release();
}

- (void)logViewDidDisappear
{
  v2 = self;
  uint64_t v3 = sub_24A7ABB80();
  (*(void (**)(uint64_t))(*(void *)v3 + 136))(v3);

  swift_release();
}

- (void)logUserDidTapWidget:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = sub_24A7ABB80();
  (*(void (**)(id))(*(void *)v6 + 144))(v4);

  swift_release();
}

- (void)logStackDidChangeToWidget:(id)a3 reason:(unint64_t)a4
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17A390);
  MEMORY[0x270FA5388](v8 - 8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24A7B3498();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = self;
  v12[5] = a3;
  v12[6] = a4;
  v12[7] = ObjectType;
  id v13 = a3;
  v14 = self;
  id v15 = v13;
  sub_24A79A8AC((uint64_t)v10, (uint64_t)&unk_2697BA6E8, (uint64_t)v12);

  swift_release();
}

- (void)logWidgetStack:(id)a3 didChangeToWidget:(id)a4 reason:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  ATXAmbientSuggestionProvider.logWidgetStack(_:didChangeTo:reason:)((uint64_t)v8, v9, a5);
}

- (void)ambientConfigurationManagerCacheDidUpdate
{
  v2 = self;
  ATXAmbientSuggestionProvider.ambientConfigurationManagerCacheDidUpdate()();
}

- (void)readStacksWithCompletion:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17A390);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_24A7B3498();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2697BA6D0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2697BA6D8;
  v12[5] = v11;
  id v13 = self;
  sub_24A7857A8((uint64_t)v7, (uint64_t)&unk_2697BA6E0, (uint64_t)v12);
  swift_release();
}

- (void)writeStacks:(NSArray *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17A390);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_24A7B3498();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  id v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2697BA6A8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2697BA6B0;
  v14[5] = v13;
  id v15 = a3;
  uint64_t v16 = self;
  sub_24A7857A8((uint64_t)v9, (uint64_t)&unk_2697BA6B8, (uint64_t)v14);
  swift_release();
}

@end