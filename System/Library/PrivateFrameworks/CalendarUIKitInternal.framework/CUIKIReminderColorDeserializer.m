@interface CUIKIReminderColorDeserializer
- (id)deserializeColor:(id)a3;
@end

@implementation CUIKIReminderColorDeserializer

- (id)deserializeColor:(id)a3
{
  return +[ReminderColorDeserializer deserializeFrom:a3 error:0];
}

@end