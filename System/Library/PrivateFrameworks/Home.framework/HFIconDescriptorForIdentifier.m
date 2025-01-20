@interface HFIconDescriptorForIdentifier
@end

@implementation HFIconDescriptorForIdentifier

void ___HFIconDescriptorForIdentifier_block_invoke()
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  v46[0] = @"lightbulb.fill";
  v0 = [MEMORY[0x263F1C6C8] configurationWithPointSize:5 weight:32.0];
  v1 = [[HFSymbolIconConfiguration alloc] initWithSystemImageName:@"lightbulb.fill" configuration:v0];
  v2 = [[HFSymbolIconConfiguration alloc] initWithSystemImageName:@"lightbulb.slash.fill" configuration:v0];
  v48 = &unk_26C0F6BA0;
  v49 = &unk_26C0F6B88;
  v50 = v1;
  v51 = v2;
  v3 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v48 count:2];
  v45 = [[HFMultistateImageIconDescriptor alloc] initWithSymbolIconConfigurationsKeyedByPrimaryState:v3];

  v47[0] = v45;
  v46[1] = @"fanblades.fill";
  v4 = [MEMORY[0x263F1C6C8] configurationWithPointSize:5 weight:32.0];
  v5 = [[HFSymbolIconConfiguration alloc] initWithSystemImageName:@"fanblades.fill" configuration:v4];
  v6 = [[HFSymbolIconConfiguration alloc] initWithSystemImageName:@"fanblades.slash.fill" configuration:v4];
  v48 = &unk_26C0F6BA0;
  v49 = &unk_26C0F6B88;
  v50 = v5;
  v51 = v6;
  v7 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v48 count:2];
  v44 = [[HFMultistateImageIconDescriptor alloc] initWithSymbolIconConfigurationsKeyedByPrimaryState:v7];

  v47[1] = v44;
  v46[2] = @"arrow.clockwise";
  v8 = [MEMORY[0x263F1C6C8] configurationWithPointSize:5 weight:32.0];
  v9 = [[HFSymbolIconConfiguration alloc] initWithSystemImageName:@"arrow.clockwise" configuration:v8];
  v10 = [[HFSymbolIconConfiguration alloc] initWithSystemImageName:@"arrow.counterclockwise" configuration:v8];
  v48 = &unk_26C0F6BA0;
  v49 = &unk_26C0F6B88;
  v50 = v9;
  v51 = v10;
  v11 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v48 count:2];
  v43 = [[HFMultistateImageIconDescriptor alloc] initWithSymbolIconConfigurationsKeyedByPrimaryState:v11];

  v47[2] = v43;
  v46[3] = @"lock.fill";
  v12 = [MEMORY[0x263F1C6C8] configurationWithPointSize:5 weight:32.0];
  v13 = [[HFSymbolIconConfiguration alloc] initWithSystemImageName:@"lock.open.fill" configuration:v12];
  v14 = [[HFSymbolIconConfiguration alloc] initWithSystemImageName:@"lock.fill" configuration:v12];
  v48 = &unk_26C0F6BA0;
  v49 = &unk_26C0F6B88;
  v50 = v13;
  v51 = v14;
  v15 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v48 count:2];
  v42 = [[HFMultistateImageIconDescriptor alloc] initWithSymbolIconConfigurationsKeyedByPrimaryState:v15];

  v47[3] = v42;
  v46[4] = @"door.garage.closed";
  v16 = [MEMORY[0x263F1C6C8] configurationWithPointSize:5 weight:32.0];
  v17 = [[HFSymbolIconConfiguration alloc] initWithSystemImageName:@"door.garage.open" configuration:v16];
  v18 = [[HFSymbolIconConfiguration alloc] initWithSystemImageName:@"door.garage.closed" configuration:v16];
  v48 = &unk_26C0F6BA0;
  v49 = &unk_26C0F6B88;
  v50 = v17;
  v51 = v18;
  v19 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v48 count:2];
  v41 = [[HFMultistateImageIconDescriptor alloc] initWithSymbolIconConfigurationsKeyedByPrimaryState:v19];

  v47[4] = v41;
  v46[5] = @"door.right.hand.closed";
  v20 = [MEMORY[0x263F1C6C8] configurationWithPointSize:5 weight:32.0];
  v21 = [[HFSymbolIconConfiguration alloc] initWithSystemImageName:@"door.right.hand.open" configuration:v20];
  v22 = [[HFSymbolIconConfiguration alloc] initWithSystemImageName:@"door.right.hand.closed" configuration:v20];
  v48 = &unk_26C0F6BA0;
  v49 = &unk_26C0F6B88;
  v50 = v21;
  v51 = v22;
  v23 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v48 count:2];
  v40 = [[HFMultistateImageIconDescriptor alloc] initWithSymbolIconConfigurationsKeyedByPrimaryState:v23];

  v47[5] = v40;
  v46[6] = @"window.awning.closed";
  v24 = [MEMORY[0x263F1C6C8] configurationWithPointSize:5 weight:32.0];
  v25 = [[HFSymbolIconConfiguration alloc] initWithSystemImageName:@"window.vertical.open" configuration:v24];
  v26 = [[HFSymbolIconConfiguration alloc] initWithSystemImageName:@"window.awning.closed" configuration:v24];
  v48 = &unk_26C0F6BA0;
  v49 = &unk_26C0F6B88;
  v50 = v25;
  v51 = v26;
  v27 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v48 count:2];
  v28 = [[HFMultistateImageIconDescriptor alloc] initWithSymbolIconConfigurationsKeyedByPrimaryState:v27];

  v47[6] = v28;
  v46[7] = @"roller.shade.closed";
  v29 = [MEMORY[0x263F1C6C8] configurationWithPointSize:5 weight:32.0];
  v30 = [[HFSymbolIconConfiguration alloc] initWithSystemImageName:@"roller.shade.open" configuration:v29];
  v31 = [[HFSymbolIconConfiguration alloc] initWithSystemImageName:@"roller.shade.closed" configuration:v29];
  v48 = &unk_26C0F6BA0;
  v49 = &unk_26C0F6B88;
  v50 = v30;
  v51 = v31;
  v32 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v48 count:2];
  v33 = [[HFMultistateImageIconDescriptor alloc] initWithSymbolIconConfigurationsKeyedByPrimaryState:v32];

  v47[7] = v33;
  v46[8] = @"light.beacon.min.fill";
  v34 = [MEMORY[0x263F1C6C8] configurationWithPointSize:5 weight:32.0];
  v35 = [[HFSymbolIconConfiguration alloc] initWithSystemImageName:@"light.beacon.min.fill" configuration:v34];
  v48 = &unk_26C0F6BA0;
  v49 = &unk_26C0F6B88;
  v50 = v35;
  v51 = v35;
  v36 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v48 count:2];
  v37 = [[HFMultistateImageIconDescriptor alloc] initWithSymbolIconConfigurationsKeyedByPrimaryState:v36];

  v47[8] = v37;
  uint64_t v38 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:9];
  v39 = (void *)_MergedGlobals_267;
  _MergedGlobals_267 = v38;
}

@end