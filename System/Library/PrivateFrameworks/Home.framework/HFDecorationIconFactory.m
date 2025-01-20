@interface HFDecorationIconFactory
+ (id)iconDescriptorForCharacteristicType:(id)a3 effectiveServiceType:(id)a4 primaryState:(int64_t)a5;
@end

@implementation HFDecorationIconFactory

+ (id)iconDescriptorForCharacteristicType:(id)a3 effectiveServiceType:(id)a4 primaryState:(int64_t)a5
{
  v26[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if ([v7 isEqualToString:*MEMORY[0x263F0BF68]]) {
    goto LABEL_2;
  }
  v9 = HFSymbolIconIdentifierDecorationFan;
  if (([v7 isEqualToString:*MEMORY[0x263F0C378]] & 1) == 0)
  {
    if ([v7 isEqualToString:*MEMORY[0x263F0C328]])
    {
      if ([v8 isEqualToString:*MEMORY[0x263F0D780]])
      {
LABEL_2:
        v9 = HFSymbolIconIdentifierDecorationLightbulb;
        goto LABEL_21;
      }
      v10 = (void *)MEMORY[0x263F0D6C8];
      goto LABEL_7;
    }
    if ([v7 isEqualToString:*MEMORY[0x263F0C4A8]])
    {
      int v11 = [v8 isEqualToString:*MEMORY[0x263F0D6F8]];
      v12 = HFSymbolIconIdentifierDecorationGarageDoor;
LABEL_18:
      if (v11) {
        v9 = v12;
      }
      else {
        v9 = HFSymbolIconIdentifierDecorationDoor;
      }
      goto LABEL_21;
    }
    if ([v7 isEqualToString:*MEMORY[0x263F0C520]])
    {
      if ([v8 isEqualToString:*MEMORY[0x263F0D8A8]])
      {
        v9 = HFSymbolIconIdentifierDecorationWindow;
        goto LABEL_21;
      }
      int v11 = [v8 isEqualToString:*MEMORY[0x263F0D8B8]];
      v12 = HFSymbolIconIdentifierDecorationWindowCovering;
      goto LABEL_18;
    }
    if ([v7 isEqualToString:*MEMORY[0x263F0C510]])
    {
      v9 = HFSymbolIconIdentifierDecorationLock;
      goto LABEL_21;
    }
    if ([v7 isEqualToString:*MEMORY[0x263F0C370]])
    {
      v9 = HFSymbolIconIdentifierDecorationRotationDirection;
      goto LABEL_21;
    }
    if ([v7 isEqualToString:*MEMORY[0x263F0C488]])
    {
      v9 = HFImageIconIdentifierDecorationSwing;
      goto LABEL_21;
    }
    if ([v7 isEqualToString:*MEMORY[0x263F0BEF8]])
    {
      v10 = (void *)MEMORY[0x263F0D890];
LABEL_7:
      if (![v8 isEqualToString:*v10]) {
        v9 = HFSymbolIconIdentifierDecorationPower;
      }
      goto LABEL_21;
    }
    if ([v7 isEqualToString:*MEMORY[0x263F0C4D8]])
    {
      v9 = HFSymbolIconIdentifierDecorationPower;
    }
    else
    {
      if (![v7 isEqualToString:*MEMORY[0x263F0C548]]) {
        goto LABEL_38;
      }
      v9 = &HFSymbolIconIdentifierDecorationSecuritySystem;
    }
  }
LABEL_21:
  v13 = *v9;
  if (!v13)
  {
LABEL_38:
    v21 = 0;
    goto LABEL_39;
  }
  v14 = v13;
  if (qword_26AB2F208 != -1) {
    dispatch_once(&qword_26AB2F208, &__block_literal_global_120);
  }
  v15 = [(id)_MergedGlobals_267 objectForKeyedSubscript:v14];
  if (!v15)
  {
    v16 = [MEMORY[0x263F1C6C8] configurationWithPointSize:5 weight:32.0];
    v17 = [[HFSymbolIconConfiguration alloc] initWithSystemImageName:v14 configuration:v16];
    v25 = &unk_26C0F6B88;
    v26[0] = v17;
    v18 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
    v15 = [[HFMultistateImageIconDescriptor alloc] initWithSymbolIconConfigurationsKeyedByPrimaryState:v18];

    if (!v15)
    {
      NSLog(&cfstr_Icondescriptor_1.isa, v14);
      v19 = [HFMultistateImageIconDescriptor alloc];
      v23 = &unk_26C0F6B88;
      v24 = v14;
      v20 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      v15 = [(HFMultistateImageIconDescriptor *)v19 initWithImageIdentifiersKeyedByPrimaryState:v20];
    }
  }

  v21 = [(HFMultistateImageIconDescriptor *)v15 iconDescriptorForPrimaryState:a5];

LABEL_39:
  return v21;
}

@end