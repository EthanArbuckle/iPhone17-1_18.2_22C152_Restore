@interface CDPEscapeOffersLedger
- (BOOL)canOfferEDPRPD;
- (BOOL)canOfferRPD;
- (CDPEscapeOffersLedger)init;
- (CDPEscapeOffersLedger)initWithExpectedEscapeOffers:(unint64_t)a3 recoveryFlowContext:(id)a4 deviceHasPasscode:(BOOL)a5 probationChecker:(id)a6 deviceIsVM:(BOOL)a7 isICDPEnabled:(BOOL)a8;
- (NSError)edpRPDBlockingError;
- (NSError)manateeRPDBlockingError;
- (NSError)rpdBlockingError;
- (NSString)description;
- (unint64_t)escapeOffersPresented;
- (void)insert:(unint64_t)a3;
- (void)satisfyManateeRequirementsForEDPRPD;
@end

@implementation CDPEscapeOffersLedger

- (unint64_t)escapeOffersPresented
{
  return *(unint64_t *)((unsigned char *)&self->super.isa + OBJC_IVAR___CDPEscapeOffersLedger__escapeOffersPresented) & 0xFFFFFFFFFFFFFFE2;
}

- (NSString)description
{
  v2 = self;
  CDPEscapeOffersLedger.description.getter();

  v3 = (void *)sub_2186D1A20();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)canOfferEDPRPD
{
  v2 = self;
  BOOL v3 = sub_2186BD7CC();

  return v3;
}

- (NSError)edpRPDBlockingError
{
  return (NSError *)sub_2186BEA28(self, (uint64_t)a2, (SEL *)&selRef__forceEDPReset, "Ledger: CLI asked for a force EDP reset. Overriding all other checks.", (void (*)(void))sub_2186BD910, "Ledger: edpRPDBlockingError - Finding first unsatisfied requirement in conditions: %s");
}

- (BOOL)canOfferRPD
{
  v2 = self;
  BOOL v3 = sub_2186BE37C();

  return v3;
}

- (NSError)rpdBlockingError
{
  v2 = self;
  id v3 = sub_2186BE564();

  if (v3)
  {
    v4 = (void *)sub_2186D1960();
  }
  else
  {
    v4 = 0;
  }
  return (NSError *)v4;
}

- (NSError)manateeRPDBlockingError
{
  return (NSError *)sub_2186BEA28(self, (uint64_t)a2, (SEL *)&selRef__forceManateeReset, "Ledger: CLI asked for a force Manatee reset. Overriding all other checks.", (void (*)(void))sub_2186BE070, "Ledger: manateeRPDBlockingError - Finding first unsatisfied requirement in conditions: %s");
}

- (CDPEscapeOffersLedger)initWithExpectedEscapeOffers:(unint64_t)a3 recoveryFlowContext:(id)a4 deviceHasPasscode:(BOOL)a5 probationChecker:(id)a6 deviceIsVM:(BOOL)a7 isICDPEnabled:(BOOL)a8
{
  id v13 = a4;
  swift_unknownObjectRetain();
  return (CDPEscapeOffersLedger *)sub_2186BF030(a3, v13, a5, (uint64_t)a6, a7, a8);
}

- (void)insert:(unint64_t)a3
{
  v4 = self;
  sub_2186BF35C(a3);
}

- (void)satisfyManateeRequirementsForEDPRPD
{
  v2 = self;
  sub_2186BF554();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CDPEscapeOffersLedger_recoveryFlowContext);
}

- (CDPEscapeOffersLedger)init
{
  result = (CDPEscapeOffersLedger *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end