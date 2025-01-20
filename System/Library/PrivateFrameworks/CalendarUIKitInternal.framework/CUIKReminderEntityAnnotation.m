@interface CUIKReminderEntityAnnotation
+ (id)annotationWithReminderIntegrationEvent:(id)a3;
+ (id)entityIdentifierForReminderIntegrationEvent:(id)a3;
- (CUIKReminderEntityAnnotation)init;
@end

@implementation CUIKReminderEntityAnnotation

+ (id)annotationWithReminderIntegrationEvent:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  v5 = (void *)sub_2496E5400(v4);

  return v5;
}

+ (id)entityIdentifierForReminderIntegrationEvent:(id)a3
{
  swift_getObjCClassMetadata();
  uint64_t v4 = sub_2496F98A0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696CB970);
  MEMORY[0x270FA5388](v8 - 8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = a3;
  sub_2496E56AC(v11, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1)
  {
    sub_2496E44D4((uint64_t)v10, &qword_2696CB970);

    v12 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v10, v4);
    sub_2496F9890();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

    v12 = (void *)sub_2496F9940();
    swift_bridgeObjectRelease();
  }
  return v12;
}

- (CUIKReminderEntityAnnotation)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ReminderEntityAnnotation();
  return [(CUIKReminderEntityAnnotation *)&v3 init];
}

@end