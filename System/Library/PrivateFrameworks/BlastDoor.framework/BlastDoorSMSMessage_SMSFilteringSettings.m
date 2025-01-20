@interface BlastDoorSMSMessage_SMSFilteringSettings
- (BlastDoorSMSMessage_SMSFilteringSettings)init;
- (NSString)description;
- (NSString)filterExtensionName;
- (unint64_t)smsFilterCapabilitiesOptions;
@end

@implementation BlastDoorSMSMessage_SMSFilteringSettings

- (NSString)description
{
  return (NSString *)sub_1B17AB4D0();
}

- (NSString)filterExtensionName
{
  return (NSString *)sub_1B17AD0C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSMessage_SMSFilteringSettings_sMSMessage_SMSFilteringSettings);
}

- (unint64_t)smsFilterCapabilitiesOptions
{
  return *(void *)&self->sMSMessage_SMSFilteringSettings[OBJC_IVAR___BlastDoorSMSMessage_SMSFilteringSettings_sMSMessage_SMSFilteringSettings
                                                         + 8];
}

- (BlastDoorSMSMessage_SMSFilteringSettings)init
{
  result = (BlastDoorSMSMessage_SMSFilteringSettings *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end