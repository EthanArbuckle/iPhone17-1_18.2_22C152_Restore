@interface APFeatureSemioticsManager
+ (APFeatureSemioticsManager)sharedManager;
- (APFeatureSemioticsManager)init;
- (id)localizedDescriptionForCurrentBestAuthenticationMechanism;
- (id)systemImageNameForCurrentBestAuthenticationMechanism;
- (id)systemImageNameForEnablementAction:(unint64_t)a3 ofFeature:(unint64_t)a4;
- (id)titleForEnablementAction:(unint64_t)a3 ofFeature:(unint64_t)a4;
@end

@implementation APFeatureSemioticsManager

+ (APFeatureSemioticsManager)sharedManager
{
  if (qword_26B13A248 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26B13A240;

  return (APFeatureSemioticsManager *)v2;
}

- (id)titleForEnablementAction:(unint64_t)a3 ofFeature:(unint64_t)a4
{
  return sub_247E1086C((uint64_t)self, (uint64_t)a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_247E10B4C);
}

- (id)systemImageNameForEnablementAction:(unint64_t)a3 ofFeature:(unint64_t)a4
{
  return sub_247E1086C((uint64_t)self, (uint64_t)a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_247E10F18);
}

- (id)systemImageNameForCurrentBestAuthenticationMechanism
{
  v2 = self;
  switch(APGetPreferredAuthenticationMechanism())
  {
    case 0:

      v3 = 0;
      break;
    case 1:
    case 2:
    case 3:

      v3 = (void *)sub_247E1A248();
      swift_bridgeObjectRelease();
      break;
    default:
      type metadata accessor for APAuthenticationMechanism(0);
      sub_247E1A4A8();
      __break(1u);
      JUMPOUT(0x247E109BCLL);
  }

  return v3;
}

- (id)localizedDescriptionForCurrentBestAuthenticationMechanism
{
  v2 = self;
  uint64_t v3 = APGetPreferredAuthenticationMechanism();
  if ((unint64_t)(v3 - 1) >= 3)
  {
    if (v3)
    {
      type metadata accessor for APAuthenticationMechanism(0);
      id result = (id)sub_247E1A4A8();
      __break(1u);
      return result;
    }

    v5 = 0;
  }
  else
  {
    id v4 = APGetAuthenticationMechanismLocalizedDescription(v3);
    sub_247E1A258();

    v5 = (void *)sub_247E1A248();
    swift_bridgeObjectRelease();
  }

  return v5;
}

- (APFeatureSemioticsManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)APFeatureSemioticsManager;
  return [(APFeatureSemioticsManager *)&v3 init];
}

@end