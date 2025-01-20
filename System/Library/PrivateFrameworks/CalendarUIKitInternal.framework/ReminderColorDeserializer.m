@interface ReminderColorDeserializer
+ (id)deserializeFrom:(id)a3 error:(id *)a4;
- (_TtC21CalendarUIKitInternal25ReminderColorDeserializer)init;
@end

@implementation ReminderColorDeserializer

+ (id)deserializeFrom:(id)a3 error:(id *)a4
{
  id v4 = a3;
  uint64_t v5 = sub_2496F9480();
  unint64_t v7 = v6;

  uint64_t v8 = sub_2496F9820();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2496E0EB4(v5, v7);
  sub_2496F9800();
  v12 = (void *)sub_2496F97E0();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_2496E1190(v5, v7);
  return v12;
}

- (_TtC21CalendarUIKitInternal25ReminderColorDeserializer)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ReminderColorDeserializer();
  return [(ReminderColorDeserializer *)&v3 init];
}

@end