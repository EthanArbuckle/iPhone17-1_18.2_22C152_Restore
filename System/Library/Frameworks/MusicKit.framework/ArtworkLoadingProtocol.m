@interface ArtworkLoadingProtocol
+ (BOOL)canInitWithRequest:(id)a3;
+ (id)canonicalRequestForRequest:(id)a3;
- (_TtC8MusicKit22ArtworkLoadingProtocol)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5;
- (void)startLoading;
@end

@implementation ArtworkLoadingProtocol

+ (BOOL)canInitWithRequest:(id)a3
{
  uint64_t v3 = sub_21D2EDCD0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21D2EDC80();
  swift_getObjCClassMetadata();
  char v7 = sub_21D09C0A0(v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7 & 1;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  uint64_t v3 = sub_21D2EDCD0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  char v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v13 - v8;
  sub_21D2EDC80();
  sub_21D09C49C((uint64_t)v7, (uint64_t)v9);
  v10 = *(void (**)(char *, uint64_t))(v4 + 8);
  v10(v7, v3);
  v11 = (void *)sub_21D2EDC60();
  v10(v9, v3);

  return v11;
}

- (void)startLoading
{
  v2 = self;
  sub_21D09C630();
}

- (_TtC8MusicKit22ArtworkLoadingProtocol)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5
{
  uint64_t v7 = sub_21D2EDCD0();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21D2EDC80();
  id v10 = a4;
  swift_unknownObjectRetain();
  return (_TtC8MusicKit22ArtworkLoadingProtocol *)sub_21D09DA28((uint64_t)v9, a4, (uint64_t)a5);
}

@end