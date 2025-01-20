@interface CUIKColorDeserializer
+ (id)_deserializeCUIKCalendarColor:(id)a3;
+ (id)_deserializeReminderColor:(id)a3;
+ (id)deserializeColor:(id)a3 providerIdentifier:(id)a4;
@end

@implementation CUIKColorDeserializer

+ (id)_deserializeReminderColor:(id)a3
{
  uint64_t v3 = CUIKReminderColorDeserializer_onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&CUIKReminderColorDeserializer_onceToken, &__block_literal_global_34);
  }
  v5 = [(id)CUIKReminderColorDeserializer_deserializer deserializeColor:v4];

  return v5;
}

+ (id)_deserializeCUIKCalendarColor:(id)a3
{
  return +[CUIKCalendarColor deserializeColor:a3];
}

+ (id)deserializeColor:(id)a3 providerIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_getAssociatedObject(v6, &deserializedColorKeyUniqueAddress);
  if (!v8)
  {
    v9 = +[CUIKCalendarColor providerIdentifier];
    int v10 = [v9 isEqualToString:v7];

    if (v10)
    {
      v11 = [a1 _deserializeCUIKCalendarColor:v6];
    }
    else
    {
      if (![(id)*MEMORY[0x1E4F57910] isEqualToString:v7])
      {
        v8 = 0;
        goto LABEL_9;
      }
      v11 = [a1 _deserializeReminderColor:v6];
    }
    v8 = v11;
    if (v11) {
      objc_setAssociatedObject(v6, &deserializedColorKeyUniqueAddress, v11, (void *)1);
    }
  }
LABEL_9:

  return v8;
}

@end