@interface URLBagContract
- (AMSMescalBagContract)mescalContract;
- (_TtC9JetEngine14URLBagContract)init;
- (id)TFOSamplingPercentage;
- (id)TFOSamplingSessionDuration;
- (id)TLSSamplingPercentage;
- (id)TLSSamplingSessionDuration;
- (id)apsEnabledPatterns;
- (id)apsSamplingPercent;
- (id)guidRegexes;
- (id)guidSchemes;
- (id)metricsDictionary;
- (id)metricsURL;
- (id)storefrontSuffix;
- (id)trustedDomains;
@end

@implementation URLBagContract

- (id)guidRegexes
{
  return sub_19F1D4630((char *)self, (uint64_t)a2, 0x6C72752D64697567, 0xEF78656765722F73, (SEL *)&selRef_arrayForKey_);
}

- (id)guidSchemes
{
  return sub_19F1D4630((char *)self, (uint64_t)a2, 0xD000000000000011, 0x800000019F276860, (SEL *)&selRef_arrayForKey_);
}

- (id)storefrontSuffix
{
  return sub_19F1D4630((char *)self, (uint64_t)a2, 0xD000000000000018, 0x800000019F276880, (SEL *)&selRef_stringForKey_);
}

- (id)trustedDomains
{
  return sub_19F1D4630((char *)self, (uint64_t)a2, 0x4464657473757274, 0xEE00736E69616D6FLL, (SEL *)&selRef_arrayForKey_);
}

- (AMSMescalBagContract)mescalContract
{
  v2 = (void *)swift_unknownObjectRetain();
  return (AMSMescalBagContract *)v2;
}

- (id)TLSSamplingPercentage
{
  return sub_19F1D4630((char *)self, (uint64_t)a2, 0xD000000000000015, 0x800000019F2768A0, (SEL *)&selRef_doubleForKey_);
}

- (id)TLSSamplingSessionDuration
{
  return sub_19F1D4630((char *)self, (uint64_t)a2, 0xD00000000000001ALL, 0x800000019F2768C0, (SEL *)&selRef_integerForKey_);
}

- (id)TFOSamplingPercentage
{
  return sub_19F1D4630((char *)self, (uint64_t)a2, 0xD000000000000015, 0x800000019F2768E0, (SEL *)&selRef_doubleForKey_);
}

- (id)TFOSamplingSessionDuration
{
  return sub_19F1D4630((char *)self, (uint64_t)a2, 0xD00000000000001ALL, 0x800000019F276900, (SEL *)&selRef_integerForKey_);
}

- (id)apsEnabledPatterns
{
  return sub_19F1D4630((char *)self, (uint64_t)a2, 0xD000000000000014, 0x800000019F276920, (SEL *)&selRef_arrayForKey_);
}

- (id)apsSamplingPercent
{
  return sub_19F1D4630((char *)self, (uint64_t)a2, 0xD000000000000017, 0x800000019F276940, (SEL *)&selRef_integerForKey_);
}

- (id)metricsURL
{
  return sub_19F1D4630((char *)self, (uint64_t)a2, 0xD000000000000012, 0x800000019F276960, (SEL *)&selRef_URLForKey_);
}

- (id)metricsDictionary
{
  return sub_19F1D4630((char *)self, (uint64_t)a2, 0x7363697274656DLL, 0xE700000000000000, (SEL *)&selRef_dictionaryForKey_);
}

- (_TtC9JetEngine14URLBagContract)init
{
  result = (_TtC9JetEngine14URLBagContract *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end