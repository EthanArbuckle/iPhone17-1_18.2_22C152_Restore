@interface IMCTRCSUtilitiesManagerLiveDelegate
- (_TtC17IMSharedUtilitiesP33_CDA2CBCEBC7ECDABD170E61A465583F135IMCTRCSUtilitiesManagerLiveDelegate)init;
- (void)activeSubscriptionsDidChange;
- (void)systemConfigurationChanged:(id)a3 withConfiguration:(id)a4;
@end

@implementation IMCTRCSUtilitiesManagerLiveDelegate

- (_TtC17IMSharedUtilitiesP33_CDA2CBCEBC7ECDABD170E61A465583F135IMCTRCSUtilitiesManagerLiveDelegate)init
{
  return (_TtC17IMSharedUtilitiesP33_CDA2CBCEBC7ECDABD170E61A465583F135IMCTRCSUtilitiesManagerLiveDelegate *)sub_1A0780C4C();
}

- (void).cxx_destruct
{
}

- (void)systemConfigurationChanged:(id)a3 withConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11 = self;
  id v8 = objc_msgSend(v6, sel_labelID);
  if (v8)
  {
    v9 = v8;
    sub_1A09F3E18();

    uint64_t v10 = MEMORY[0x1F4188790](v11);
    MEMORY[0x1F4188790](v10);
    sub_1A09F4408();

    swift_bridgeObjectRelease();
  }
  else
  {
  }
}

- (void)activeSubscriptionsDidChange
{
  v2 = self;
  sub_1A0870A80((uint64_t)sub_1A08731A8, 0, (uint64_t)&unk_1EF2C1C70, (uint64_t)sub_1A0874E6C, (uint64_t)&unk_1EF2C0DD0);
}

@end