@interface LACUIAuthenticatorServiceConfigurationRequirementBuilder
+ (id)_biometryEvents;
+ (id)extractAvailableMechanisms:(unint64_t)a3;
+ (unint64_t)buildWithAvailableMechanisms:(id)a3;
@end

@implementation LACUIAuthenticatorServiceConfigurationRequirementBuilder

+ (unint64_t)buildWithAvailableMechanisms:(id)a3
{
  id v3 = a3;
  v4 = [[LACUIAvailableMechanismsWrapper alloc] initWithMechanismEvents:v3];

  if ([(LACUIAvailableMechanismsWrapper *)v4 isEmpty]) {
    goto LABEL_2;
  }
  if ([(LACUIAvailableMechanismsWrapper *)v4 count] != 1)
  {
    if ([(LACUIAvailableMechanismsWrapper *)v4 count] == 2)
    {
      if ([(LACUIAvailableMechanismsWrapper *)v4 allowsPasscode]
        && [(LACUIAvailableMechanismsWrapper *)v4 allowsBiometry])
      {
        unint64_t v5 = 4;
        goto LABEL_3;
      }
      if (![(LACUIAvailableMechanismsWrapper *)v4 allowsPasscode]
        || ![(LACUIAvailableMechanismsWrapper *)v4 allowsWatch])
      {
        goto LABEL_2;
      }
    }
    else if ([(LACUIAvailableMechanismsWrapper *)v4 count] != 3 {
           || ![(LACUIAvailableMechanismsWrapper *)v4 allowsWatch]
    }
           || ![(LACUIAvailableMechanismsWrapper *)v4 allowsBiometry]
           || ![(LACUIAvailableMechanismsWrapper *)v4 allowsPasscode])
    {
LABEL_2:
      unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_3;
    }
    unint64_t v5 = 6;
    goto LABEL_3;
  }
  if ([(LACUIAvailableMechanismsWrapper *)v4 allowsBiometry])
  {
    unint64_t v5 = 1;
  }
  else if ([(LACUIAvailableMechanismsWrapper *)v4 allowsPasscode])
  {
    unint64_t v5 = 2;
  }
  else
  {
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_3:

  return v5;
}

+ (id)extractAvailableMechanisms:(unint64_t)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263EFFA68];
  switch(a3)
  {
    case 1uLL:
      id v3 = +[LACUIAuthenticatorServiceConfigurationRequirementBuilder _biometryEvents]();
      break;
    case 2uLL:
      v4 = [NSNumber numberWithInteger:*MEMORY[0x263F52388]];
      v12[0] = v4;
      id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
      goto LABEL_7;
    case 4uLL:
      v4 = +[LACUIAuthenticatorServiceConfigurationRequirementBuilder _biometryEvents]();
      unint64_t v5 = [NSNumber numberWithInteger:*MEMORY[0x263F52388]];
      v11 = v5;
      v6 = (void *)MEMORY[0x263EFF8C0];
      v7 = &v11;
      goto LABEL_6;
    case 6uLL:
      v4 = +[LACUIAuthenticatorServiceConfigurationRequirementBuilder _biometryEvents]();
      unint64_t v5 = [NSNumber numberWithInteger:*MEMORY[0x263F52388]];
      v10 = v5;
      v6 = (void *)MEMORY[0x263EFF8C0];
      v7 = &v10;
LABEL_6:
      v8 = objc_msgSend(v6, "arrayWithObjects:count:", v7, 1, v10, v11);
      id v3 = [v4 arrayByAddingObjectsFromArray:v8];

LABEL_7:
      break;
    default:
      break;
  }
  return v3;
}

+ (id)_biometryEvents
{
  v4[2] = *MEMORY[0x263EF8340];
  self;
  v0 = [NSNumber numberWithInteger:*MEMORY[0x263F52398]];
  v4[0] = v0;
  v1 = [NSNumber numberWithInteger:*MEMORY[0x263F52390]];
  v4[1] = v1;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];

  return v2;
}

@end