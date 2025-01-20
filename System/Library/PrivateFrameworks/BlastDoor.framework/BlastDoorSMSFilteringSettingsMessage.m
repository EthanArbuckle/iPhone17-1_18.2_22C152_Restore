@interface BlastDoorSMSFilteringSettingsMessage
- (BlastDoorSMSFilteringSettingsMessage)init;
- (NSString)description;
- (NSString)filterExtensionName;
- (unint64_t)smsFilterCapabilitiesOptions;
@end

@implementation BlastDoorSMSFilteringSettingsMessage

- (NSString)description
{
  return (NSString *)sub_1B17AB4D0();
}

- (NSString)filterExtensionName
{
  return (NSString *)sub_1B17AD0C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSFilteringSettingsMessage_sMSFilteringSettingsMessage);
}

- (unint64_t)smsFilterCapabilitiesOptions
{
  return *(void *)&self->sMSFilteringSettingsMessage[OBJC_IVAR___BlastDoorSMSFilteringSettingsMessage_sMSFilteringSettingsMessage
                                                     + 8];
}

- (BlastDoorSMSFilteringSettingsMessage)init
{
  result = (BlastDoorSMSFilteringSettingsMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end