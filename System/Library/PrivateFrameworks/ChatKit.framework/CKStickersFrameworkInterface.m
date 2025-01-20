@interface CKStickersFrameworkInterface
+ (BOOL)updateSavedStickerWithIdentifier:(id)a3 stickerEffectEnum:(int64_t)a4 error:(id *)a5;
+ (id)uiStickerForSTKSticker:(id)a3;
+ (id)uiStickerWithIdentifier:(id)a3;
- (CKStickersFrameworkInterface)init;
@end

@implementation CKStickersFrameworkInterface

+ (BOOL)updateSavedStickerWithIdentifier:(id)a3 stickerEffectEnum:(int64_t)a4 error:(id *)a5
{
  uint64_t v5 = sub_18F7B6220();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18F7B6200();
  sub_18F65A288();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return 1;
}

+ (id)uiStickerWithIdentifier:(id)a3
{
  uint64_t v3 = sub_18F7B6220();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18F7B6200();
  uint64_t v7 = (void *)sub_18F65A4E8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return v7;
}

+ (id)uiStickerForSTKSticker:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)sub_18F658838();

  return v4;
}

- (CKStickersFrameworkInterface)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StickersFrameworkInterface();
  return [(CKStickersFrameworkInterface *)&v3 init];
}

@end