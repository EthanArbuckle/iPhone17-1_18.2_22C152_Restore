@interface TimerClass
- (_TtC15MapsSuggestions10TimerClass)initWithName:(id)a3;
- (_TtC15MapsSuggestions10TimerClass)initWithName:(id)a3 queue:(id)a4;
- (_TtC15MapsSuggestions10TimerClass)initWithName:(id)a3 queue:(id)a4 block:(id)a5;
- (_TtC15MapsSuggestions10TimerClass)initWithName:(id)a3 queue:(id)a4 timerReturningBlock:(id)a5;
@end

@implementation TimerClass

- (_TtC15MapsSuggestions10TimerClass)initWithName:(id)a3
{
  sub_1A721EFC0();
  v4 = (void *)sub_1A721EFB0();
  swift_bridgeObjectRelease();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TimerClass();
  v5 = [(MapsSuggestionsBaseTrigger *)&v7 initWithName:v4];

  return v5;
}

- (_TtC15MapsSuggestions10TimerClass)initWithName:(id)a3 queue:(id)a4
{
  sub_1A721EFC0();
  id v6 = a4;
  objc_super v7 = (void *)sub_1A721EFB0();
  swift_bridgeObjectRelease();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TimerClass();
  v8 = [(MapsSuggestionsBaseTrigger *)&v10 initWithName:v7 queue:v6];

  return v8;
}

- (_TtC15MapsSuggestions10TimerClass)initWithName:(id)a3 queue:(id)a4 block:(id)a5
{
  objc_super v7 = _Block_copy(a5);
  sub_1A721EFC0();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  id v9 = a4;
  objc_super v10 = (void *)sub_1A721EFB0();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_1A714555C;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A713C63C;
  aBlock[3] = &block_descriptor_168;
  v11 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for TimerClass();
  v12 = [(MapsSuggestionsGCDTimer *)&v14 initWithName:v10 queue:v9 block:v11];

  swift_release();
  _Block_release(v11);

  return v12;
}

- (_TtC15MapsSuggestions10TimerClass)initWithName:(id)a3 queue:(id)a4 timerReturningBlock:(id)a5
{
  objc_super v7 = _Block_copy(a5);
  sub_1A721EFC0();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  id v9 = a4;
  objc_super v10 = (void *)sub_1A721EFB0();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_1A714515C;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A713C990;
  aBlock[3] = &block_descriptor_161;
  v11 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for TimerClass();
  v12 = [(MapsSuggestionsGCDTimer *)&v14 initWithName:v10 queue:v9 timerReturningBlock:v11];

  swift_release();
  _Block_release(v11);

  return v12;
}

@end