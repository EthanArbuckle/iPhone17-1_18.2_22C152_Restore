@interface BCPreloader
+ (BCPreloader)shared;
- (BCPreloader)init;
- (void)preloadResourcesWithCompletion:(id)a3;
@end

@implementation BCPreloader

+ (BCPreloader)shared
{
  if (qword_26B12B838 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26B12B930;
  return (BCPreloader *)v2;
}

- (BCPreloader)init
{
  v2 = (_OWORD *)((char *)self + OBJC_IVAR___BCPreloader_resourceLoadToken);
  _OWORD *v2 = 0u;
  v2[1] = 0u;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BCPreloader_cancellableBag) = (Class)MEMORY[0x263F8EE88];
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for Preloader();
  return [(BCPreloader *)&v4 init];
}

- (void)preloadResourcesWithCompletion:(id)a3
{
  objc_super v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_2473E6C10;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_2473E6504((uint64_t)v7, v6);
  sub_2473D81A0((uint64_t)v7);
}

- (void).cxx_destruct
{
  sub_2473D34E0((uint64_t)self + OBJC_IVAR___BCPreloader_resourceLoadToken, (uint64_t *)&unk_26B12BBE0);
  swift_bridgeObjectRelease();
}

@end