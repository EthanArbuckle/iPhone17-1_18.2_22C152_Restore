@interface NSString(MedicationVision)
- (id)normalizeForType:()MedicationVision;
@end

@implementation NSString(MedicationVision)

- (id)normalizeForType:()MedicationVision
{
  v4 = [a1 lowercaseString];
  v5 = [MEMORY[0x263EFF960] currentLocale];
  v6 = [v4 stringByFoldingWithOptions:128 locale:v5];

  v7 = @"abcdefghijklmnopqrstuvwxyz0123456789";
  if (a3 == 2) {
    v7 = @"abcdefghijklmnopqrstuvwxyz0123456789 ";
  }
  if (a3 == 1) {
    v8 = @"abcdefghijklmnopqrstuvwxyz0123456789%";
  }
  else {
    v8 = v7;
  }
  v9 = [MEMORY[0x263F08708] characterSetWithCharactersInString:v8];
  v10 = [v9 invertedSet];
  v11 = [v6 componentsSeparatedByCharactersInSet:v10];
  v12 = [v11 componentsJoinedByString:&stru_26E5DAF10];

  return v12;
}

@end