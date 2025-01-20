@interface DEDEncryptorFactory
+ (id)getEncryptorForExtensionIdentifier:(id)a3;
@end

@implementation DEDEncryptorFactory

+ (id)getEncryptorForExtensionIdentifier:(id)a3
{
  v9[10] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263EFFA08]);
  v9[0] = @"com.apple.DiagnosticExtensions.Cinnamon";
  v9[1] = @"com.apple.DiagnosticExtensions.sysdiagnose";
  v9[2] = @"com.apple.AppleElementsSupport.AppleElementsSleepDiagnostic";
  v9[3] = @"com.apple.AppleElementsSupport.AppleElementsDiagnostic";
  v9[4] = @"com.apple.HealthAlgorithms.CycleTrackingDiagnosticExtension";
  v9[5] = @"com.apple.HeartRhythmAlgorithms.IRNDiagnosticExtension";
  v9[6] = @"com.apple.HealthLite.KaliDiagnosticExtension";
  v9[7] = @"com.apple.AfibBurden.AfibBurdenDiagnosticExtension";
  v9[8] = @"healthwrap";
  v9[9] = @"AppleEncryptedArchive";
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:10];
  v6 = (void *)[v4 initWithArray:v5];

  if ([v6 containsObject:v3])
  {
    [v3 isEqualToString:@"AppleEncryptedArchive"];
    v7 = objc_opt_new();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end