@interface INSetBinarySettingIntent
- (id)toDNDIntent;
@end

@implementation INSetBinarySettingIntent

- (id)toDNDIntent
{
  v3 = objc_alloc_init(DNDToggleDoNotDisturbIntent);
  if ([(INSetBinarySettingIntent *)self binaryValue] == (id)1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  [(DNDToggleDoNotDisturbIntent *)v3 setState:v4];
  return v3;
}

@end