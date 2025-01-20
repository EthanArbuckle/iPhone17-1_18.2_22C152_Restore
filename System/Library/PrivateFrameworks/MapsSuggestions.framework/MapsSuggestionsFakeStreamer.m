@interface MapsSuggestionsFakeStreamer
- (BOOL)alreadyStartedEvent;
- (BOOL)doubleEvent;
- (BOOL)simpleCallBack;
- (BOOL)tenSecondEvent;
- (_TtC15MapsSuggestions27MapsSuggestionsFakeStreamer)initWithLookAheadPeriod:(double)a3 pingInterval:(double)a4 notificationName:(id)a5 callBackBlock:(id)a6 simpleCallBack:(BOOL)a7 tenSecondEvent:(BOOL)a8 alreadyStartedEvent:(BOOL)a9 doubleEvent:(BOOL)a10;
- (_TtC15MapsSuggestions27MapsSuggestionsFakeStreamer)initWithLookAheadPeriod:(double)a3 pingInterval:(double)a4 notificationName:(id)a5 identifyingName:(id)a6;
- (id)callBackBlock;
- (void)scanForStreamableEvents;
- (void)setAlreadyStartedEvent:(BOOL)a3;
- (void)setCallBackBlock:(id)a3;
- (void)setDoubleEvent:(BOOL)a3;
- (void)setSimpleCallBack:(BOOL)a3;
- (void)setTenSecondEvent:(BOOL)a3;
@end

@implementation MapsSuggestionsFakeStreamer

- (id)callBackBlock
{
  v2 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC15MapsSuggestions27MapsSuggestionsFakeStreamer_callBackBlock);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1A713C63C;
    aBlock[3] = &block_descriptor_155;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setCallBackBlock:(id)a3
{
  v4 = (uint64_t (*)())_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1A714555C;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15MapsSuggestions27MapsSuggestionsFakeStreamer_callBackBlock);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1A713FAB0(v7);
}

- (BOOL)simpleCallBack
{
  return *((unsigned char *)&self->super.super.isa
         + OBJC_IVAR____TtC15MapsSuggestions27MapsSuggestionsFakeStreamer_simpleCallBack);
}

- (void)setSimpleCallBack:(BOOL)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC15MapsSuggestions27MapsSuggestionsFakeStreamer_simpleCallBack) = a3;
}

- (BOOL)tenSecondEvent
{
  return *((unsigned char *)&self->super.super.isa
         + OBJC_IVAR____TtC15MapsSuggestions27MapsSuggestionsFakeStreamer_tenSecondEvent);
}

- (void)setTenSecondEvent:(BOOL)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC15MapsSuggestions27MapsSuggestionsFakeStreamer_tenSecondEvent) = a3;
}

- (BOOL)alreadyStartedEvent
{
  return *((unsigned char *)&self->super.super.isa
         + OBJC_IVAR____TtC15MapsSuggestions27MapsSuggestionsFakeStreamer_alreadyStartedEvent);
}

- (void)setAlreadyStartedEvent:(BOOL)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC15MapsSuggestions27MapsSuggestionsFakeStreamer_alreadyStartedEvent) = a3;
}

- (BOOL)doubleEvent
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC15MapsSuggestions27MapsSuggestionsFakeStreamer_doubleEvent);
}

- (void)setDoubleEvent:(BOOL)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC15MapsSuggestions27MapsSuggestionsFakeStreamer_doubleEvent) = a3;
}

- (_TtC15MapsSuggestions27MapsSuggestionsFakeStreamer)initWithLookAheadPeriod:(double)a3 pingInterval:(double)a4 notificationName:(id)a5 callBackBlock:(id)a6 simpleCallBack:(BOOL)a7 tenSecondEvent:(BOOL)a8 alreadyStartedEvent:(BOOL)a9 doubleEvent:(BOOL)a10
{
  v16 = _Block_copy(a6);
  uint64_t v17 = sub_1A721EFC0();
  uint64_t v19 = v18;
  if (v16)
  {
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v16;
    v16 = sub_1A7145154;
  }
  else
  {
    uint64_t v20 = 0;
  }
  v21 = sub_1A71449E0(v17, v19, (uint64_t)v16, v20, a7, a8, a9, a10, a3, a4);
  sub_1A713FAB0((uint64_t)v16);
  return (_TtC15MapsSuggestions27MapsSuggestionsFakeStreamer *)v21;
}

- (void)scanForStreamableEvents
{
  v2 = self;
  MapsSuggestionsFakeStreamer.scanForStreamableEvents()();
}

- (_TtC15MapsSuggestions27MapsSuggestionsFakeStreamer)initWithLookAheadPeriod:(double)a3 pingInterval:(double)a4 notificationName:(id)a5 identifyingName:(id)a6
{
}

- (void).cxx_destruct
{
  sub_1A713FAB0(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC15MapsSuggestions27MapsSuggestionsFakeStreamer_callBackBlock));
}

@end