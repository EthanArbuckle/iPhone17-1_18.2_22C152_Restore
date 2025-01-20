@interface ConversationTimer
- (_TtC10DropInCore17ConversationTimer)initWithInterval:(double)a3 queue:(id)a4 identifier:(id)a5 label:(id)a6 handler:(id)a7;
@end

@implementation ConversationTimer

- (_TtC10DropInCore17ConversationTimer)initWithInterval:(double)a3 queue:(id)a4 identifier:(id)a5 label:(id)a6 handler:(id)a7
{
  uint64_t v9 = sub_24D0F0130();
  MEMORY[0x270FA5388](v9 - 8);
  _Block_copy(a7);
  sub_24D0F0110();
  sub_24D0F05A0();
  swift_allocObject();
  id v10 = a4;
  sub_24D0A95F0();
}

@end