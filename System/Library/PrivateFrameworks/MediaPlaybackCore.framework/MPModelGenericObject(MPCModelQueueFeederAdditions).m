@interface MPModelGenericObject(MPCModelQueueFeederAdditions)
+ (id)mqf_requiredItemPlaybackProperties;
+ (id)mqf_requiredSectionPlaybackProperties;
@end

@implementation MPModelGenericObject(MPCModelQueueFeederAdditions)

+ (id)mqf_requiredSectionPlaybackProperties
{
  v13[8] = *MEMORY[0x263EF8340];
  id v0 = objc_alloc(MEMORY[0x263F12180]);
  v12[0] = *MEMORY[0x263F119D8];
  v1 = objc_msgSend(MEMORY[0x263F11F98], "mqf_requiredSectionPlaybackProperties");
  v13[0] = v1;
  v12[1] = *MEMORY[0x263F11998];
  v2 = objc_msgSend(MEMORY[0x263F11E80], "mqf_requiredSectionPlaybackProperties");
  v13[1] = v2;
  v12[2] = *MEMORY[0x263F119A0];
  v3 = objc_msgSend(MEMORY[0x263F11E90], "mqf_requiredSectionPlaybackProperties");
  v13[2] = v3;
  v12[3] = *MEMORY[0x263F119B8];
  v4 = objc_msgSend(MEMORY[0x263F11EE8], "mqf_requiredSectionPlaybackProperties");
  v13[3] = v4;
  v12[4] = *MEMORY[0x263F11A28];
  v5 = objc_msgSend(MEMORY[0x263F12088], "mqf_requiredSectionPlaybackProperties");
  v13[4] = v5;
  v12[5] = *MEMORY[0x263F11A30];
  v6 = objc_msgSend(MEMORY[0x263F12098], "mqf_requiredSectionPlaybackProperties");
  v13[5] = v6;
  v12[6] = *MEMORY[0x263F119E8];
  v7 = objc_msgSend(MEMORY[0x263F11FC0], "mqf_requiredSectionPlaybackProperties");
  v13[6] = v7;
  v12[7] = *MEMORY[0x263F119F8];
  v8 = objc_msgSend(MEMORY[0x263F11FD8], "mqf_requiredSectionPlaybackProperties");
  v13[7] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:8];
  v10 = (void *)[v0 initWithProperties:MEMORY[0x263EFFA68] relationships:v9];

  return v10;
}

+ (id)mqf_requiredItemPlaybackProperties
{
  v11[6] = *MEMORY[0x263EF8340];
  id v0 = objc_alloc(MEMORY[0x263F12180]);
  v10[0] = *MEMORY[0x263F119E0];
  v1 = objc_msgSend(MEMORY[0x263F11FA0], "mqf_requiredItemPlaybackProperties");
  v11[0] = v1;
  v10[1] = *MEMORY[0x263F119C8];
  v2 = objc_msgSend(MEMORY[0x263F11F60], "mqf_requiredItemPlaybackProperties");
  v11[1] = v2;
  v10[2] = *MEMORY[0x263F119D0];
  v3 = objc_msgSend(MEMORY[0x263F11F68], "mqf_requiredItemPlaybackProperties");
  v11[2] = v3;
  v10[3] = *MEMORY[0x263F11A18];
  v4 = objc_msgSend(MEMORY[0x263F12028], "mqf_requiredItemPlaybackProperties");
  v11[3] = v4;
  v10[4] = *MEMORY[0x263F11A20];
  v5 = objc_msgSend(MEMORY[0x263F12078], "mqf_requiredItemPlaybackProperties");
  v11[4] = v5;
  v10[5] = *MEMORY[0x263F119F0];
  v6 = objc_msgSend(MEMORY[0x263F11FC8], "mqf_requiredItemPlaybackProperties");
  v11[5] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:6];
  v8 = (void *)[v0 initWithProperties:MEMORY[0x263EFFA68] relationships:v7];

  return v8;
}

@end