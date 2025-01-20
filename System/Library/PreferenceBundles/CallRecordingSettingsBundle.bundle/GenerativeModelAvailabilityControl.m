@interface GenerativeModelAvailabilityControl
- (_TtC27CallRecordingSettingsBundle34GenerativeModelAvailabilityControl)init;
- (int64_t)getAvailability;
@end

@implementation GenerativeModelAvailabilityControl

- (int64_t)getAvailability
{
  uint64_t v3 = sub_6930();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, (char *)self + OBJC_IVAR____TtC27CallRecordingSettingsBundle34GenerativeModelAvailabilityControl_available, v3);
  int v7 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v6, v3);
  if (&enum case for GenerativeModelsAvailability.Availability.restricted(_:)
    && v7 == enum case for GenerativeModelsAvailability.Availability.restricted(_:))
  {
    int64_t v8 = 1;
LABEL_7:
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return v8;
  }
  if (&enum case for GenerativeModelsAvailability.Availability.unavailable(_:)
    && v7 == enum case for GenerativeModelsAvailability.Availability.unavailable(_:))
  {
    int64_t v8 = 2;
    goto LABEL_7;
  }
  if (&enum case for GenerativeModelsAvailability.Availability.available(_:)
    && v7 == enum case for GenerativeModelsAvailability.Availability.available(_:))
  {
    return 0;
  }
  v10 = self;
  int64_t result = sub_6990();
  __break(1u);
  return result;
}

- (_TtC27CallRecordingSettingsBundle34GenerativeModelAvailabilityControl)init
{
  uint64_t v3 = sub_6980();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_6950();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = self;
  sub_6940();
  sub_6970();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_6960();

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v12 = (objc_class *)type metadata accessor for GenerativeModelAvailabilityControl();
  v14.receiver = v11;
  v14.super_class = v12;
  return [(GenerativeModelAvailabilityControl *)&v14 init];
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC27CallRecordingSettingsBundle34GenerativeModelAvailabilityControl_available;
  uint64_t v3 = sub_6930();
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end