@interface AAFPhoneNumberFormatter
- (AAFPhoneNumberFormatter)init;
- (const)defaultCountryCode;
- (id)displayFormatFor:(id)a3;
- (id)normalizedFormatFor:(id)a3;
- (void)setDefaultCountryCode:(const __CFString *)a3;
@end

@implementation AAFPhoneNumberFormatter

- (const)defaultCountryCode
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___AAFPhoneNumberFormatter_defaultCountryCode);
  swift_beginAccess();
  return (const __CFString *)*v2;
}

- (void)setDefaultCountryCode:(const __CFString *)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___AAFPhoneNumberFormatter_defaultCountryCode);
  swift_beginAccess();
  v5 = *v4;
  *v4 = (void *)a3;
  CFStringRef v6 = (id)a3;
}

- (id)normalizedFormatFor:(id)a3
{
  uint64_t v4 = sub_1B8F574D0();
  unint64_t v6 = v5;
  v7 = self;
  sub_1B8F2A4F0(v4, v6);

  swift_bridgeObjectRelease();
  v8 = (void *)sub_1B8F574C0();
  swift_bridgeObjectRelease();
  return v8;
}

- (id)displayFormatFor:(id)a3
{
  uint64_t v4 = sub_1B8F574D0();
  unint64_t v6 = v5;
  v7 = self;
  sub_1B8F2940C(v4, v6);

  swift_bridgeObjectRelease();
  v8 = (void *)sub_1B8F574C0();
  swift_bridgeObjectRelease();
  return v8;
}

- (AAFPhoneNumberFormatter)init
{
  return (AAFPhoneNumberFormatter *)PhoneNumberFormatter.init()();
}

- (void).cxx_destruct
{
}

@end