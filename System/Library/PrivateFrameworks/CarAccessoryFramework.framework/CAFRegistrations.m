@interface CAFRegistrations
+ (NSDictionary)MTBF;
+ (NSDictionary)autoSettings;
+ (NSDictionary)cafTool;
+ (NSDictionary)carCamera;
+ (NSDictionary)carInspector;
+ (NSDictionary)carPlayApp;
+ (NSDictionary)caraccessoryd;
+ (NSDictionary)charge;
+ (NSDictionary)climate;
+ (NSDictionary)closures;
+ (NSDictionary)fastStartup;
+ (NSDictionary)iOSOnly;
+ (NSDictionary)media;
+ (NSDictionary)noLargePayload;
+ (NSDictionary)settings;
+ (NSDictionary)siriCommands;
+ (NSDictionary)siriDonations;
+ (NSDictionary)testing;
+ (NSDictionary)tirePressure;
+ (NSDictionary)trip;
+ (NSDictionary)vitals;
+ (id)registrationDictionaryForIdentifier:(id)a3;
@end

@implementation CAFRegistrations

+ (id)registrationDictionaryForIdentifier:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"com.apple.caraccessoryd"] & 1) != 0
    || ![v4 caseInsensitiveCompare:@"caraccessoryd"])
  {
    uint64_t v7 = [a1 caraccessoryd];
LABEL_52:
    v6 = (void *)v7;
    goto LABEL_53;
  }
  if (([v4 isEqualToString:@"com.apple.CarClimate"] & 1) != 0
    || ![v4 caseInsensitiveCompare:@"Climate"])
  {
    uint64_t v7 = [a1 climate];
    goto LABEL_52;
  }
  if (([v4 isEqualToString:@"com.apple.CarRadio"] & 1) != 0
    || ![v4 caseInsensitiveCompare:@"Media"])
  {
    uint64_t v7 = [a1 media];
    goto LABEL_52;
  }
  if (([v4 isEqualToString:@"com.apple.AutoSettings"] & 1) != 0
    || ![v4 caseInsensitiveCompare:@"AutoSettings"])
  {
    uint64_t v7 = [a1 autoSettings];
    goto LABEL_52;
  }
  if (([v4 isEqualToString:@"com.apple.CarTrip"] & 1) != 0
    || ![v4 caseInsensitiveCompare:@"Trip"])
  {
    uint64_t v7 = [a1 trip];
    goto LABEL_52;
  }
  if (([v4 isEqualToString:@"com.apple.CarTirePressure"] & 1) != 0
    || ![v4 caseInsensitiveCompare:@"TirePressure"])
  {
    uint64_t v7 = [a1 tirePressure];
    goto LABEL_52;
  }
  if (([v4 isEqualToString:@"com.apple.CarClosures"] & 1) != 0
    || ![v4 caseInsensitiveCompare:@"Closures"])
  {
    uint64_t v7 = [a1 closures];
    goto LABEL_52;
  }
  if (([v4 isEqualToString:@"com.apple.CarCharge"] & 1) != 0
    || ![v4 caseInsensitiveCompare:@"Charge"])
  {
    uint64_t v7 = [a1 charge];
    goto LABEL_52;
  }
  if (([v4 isEqualToString:@"com.apple.CarVitals"] & 1) != 0
    || ![v4 caseInsensitiveCompare:@"Vitals"])
  {
    uint64_t v7 = [a1 vitals];
    goto LABEL_52;
  }
  if (([v4 isEqualToString:@"com.apple.CarPlayApp"] & 1) != 0
    || ![v4 caseInsensitiveCompare:@"CarPlayApp"])
  {
    uint64_t v7 = [a1 carPlayApp];
    goto LABEL_52;
  }
  if (([v4 isEqualToString:@"com.apple.CarCamera"] & 1) != 0
    || ![v4 caseInsensitiveCompare:@"CarCamera"])
  {
    uint64_t v7 = [a1 carCamera];
    goto LABEL_52;
  }
  if (([v4 isEqualToString:@"com.apple.CarPlaySettings"] & 1) != 0
    || ![v4 caseInsensitiveCompare:@"Settings"])
  {
    uint64_t v7 = [a1 settings];
    goto LABEL_52;
  }
  if (![v4 caseInsensitiveCompare:@"Testing"])
  {
    uint64_t v7 = [a1 testing];
    goto LABEL_52;
  }
  if (([v4 isEqualToString:@"com.apple.SiriAudioApp"] & 1) != 0
    || ![v4 caseInsensitiveCompare:@"CarInspector"])
  {
    uint64_t v7 = [a1 carInspector];
    goto LABEL_52;
  }
  if (![v4 caseInsensitiveCompare:@"CAFTool"])
  {
    uint64_t v7 = [a1 cafTool];
    goto LABEL_52;
  }
  if (([v4 isEqualToString:@"com.apple.AssistantServices"] & 1) != 0
    || ![v4 caseInsensitiveCompare:@"SiriCommands"])
  {
    uint64_t v7 = [a1 siriCommands];
    goto LABEL_52;
  }
  if (([v4 isEqualToString:@"com.apple.siriknowledged"] & 1) != 0
    || ![v4 caseInsensitiveCompare:@"SiriDonations"])
  {
    uint64_t v7 = [a1 siriDonations];
    goto LABEL_52;
  }
  if (![v4 caseInsensitiveCompare:@"MTBF"])
  {
    uint64_t v7 = [a1 MTBF];
    goto LABEL_52;
  }
  if (![v4 caseInsensitiveCompare:@"FastStartup"])
  {
    uint64_t v7 = [a1 fastStartup];
    goto LABEL_52;
  }
  if (![v4 caseInsensitiveCompare:@"NoLargePayload"])
  {
    uint64_t v7 = [a1 noLargePayload];
    goto LABEL_52;
  }
  if (![v4 caseInsensitiveCompare:@"iOSOnly"])
  {
    uint64_t v7 = [a1 iOSOnly];
    goto LABEL_52;
  }
  v5 = CAFRegistrationLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[CAFRegistrations registrationDictionaryForIdentifier:]((uint64_t)v4, v5);
  }

  v6 = &unk_26FD90EE8;
LABEL_53:

  return v6;
}

+ (NSDictionary)fastStartup
{
  return (NSDictionary *)&unk_26FD914B0;
}

+ (NSDictionary)noLargePayload
{
  return (NSDictionary *)&unk_26FD922E8;
}

+ (NSDictionary)iOSOnly
{
  return (NSDictionary *)&unk_26FD92DB0;
}

+ (NSDictionary)caraccessoryd
{
  return (NSDictionary *)&unk_26FD92EC8;
}

+ (NSDictionary)climate
{
  return (NSDictionary *)&unk_26FD93210;
}

+ (NSDictionary)media
{
  return (NSDictionary *)&unk_26FD93418;
}

+ (NSDictionary)autoSettings
{
  return (NSDictionary *)&unk_26FD937B0;
}

+ (NSDictionary)trip
{
  return (NSDictionary *)&unk_26FD938C8;
}

+ (NSDictionary)tirePressure
{
  return (NSDictionary *)&unk_26FD93968;
}

+ (NSDictionary)closures
{
  return (NSDictionary *)&unk_26FD93A30;
}

+ (NSDictionary)charge
{
  return (NSDictionary *)&unk_26FD93B70;
}

+ (NSDictionary)vitals
{
  return (NSDictionary *)&unk_26FD93B98;
}

+ (NSDictionary)carPlayApp
{
  return (NSDictionary *)&unk_26FD93E68;
}

+ (NSDictionary)carCamera
{
  return (NSDictionary *)&unk_26FD93F08;
}

+ (NSDictionary)settings
{
  return (NSDictionary *)&unk_26FD93FA8;
}

+ (NSDictionary)testing
{
  return (NSDictionary *)&unk_26FD94160;
}

+ (NSDictionary)carInspector
{
  return (NSDictionary *)MEMORY[0x263EFFA78];
}

+ (NSDictionary)cafTool
{
  return (NSDictionary *)MEMORY[0x263EFFA78];
}

+ (NSDictionary)siriCommands
{
  return (NSDictionary *)&unk_26FD946D8;
}

+ (NSDictionary)siriDonations
{
  return (NSDictionary *)&unk_26FD94750;
}

+ (NSDictionary)MTBF
{
  return (NSDictionary *)&unk_26FD94C78;
}

+ (void)registrationDictionaryForIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_249710000, a2, OS_LOG_TYPE_ERROR, "Unknown registration identifier %@", (uint8_t *)&v2, 0xCu);
}

@end