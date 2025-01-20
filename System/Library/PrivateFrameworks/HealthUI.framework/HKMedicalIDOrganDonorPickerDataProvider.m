@interface HKMedicalIDOrganDonorPickerDataProvider
+ (id)displayValueForOrganDonorStatus:(unint64_t)a3;
+ (id)medicalIDOrganDonorStatus:(unint64_t)a3;
+ (int64_t)numberOfRowsWithDonateLifeSignup:(BOOL)a3;
+ (unint64_t)emergencyCardOrganDonorStatus:(id)a3;
@end

@implementation HKMedicalIDOrganDonorPickerDataProvider

+ (id)displayValueForOrganDonorStatus:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v5 = v4;
      v6 = @"organ_donor_not_set";
      goto LABEL_9;
    case 1uLL:
      v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v5 = v4;
      v6 = @"organ_donor_yes";
      goto LABEL_9;
    case 2uLL:
      v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v5 = v4;
      v6 = @"organ_donor_no";
      goto LABEL_9;
    case 3uLL:
      BOOL v7 = +[HKOrganDonationConnectionManager hasStoredRegistrant];
      v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v5 = v4;
      if (v7) {
        v6 = @"organ_donor_registered";
      }
      else {
        v6 = @"organ_donor_register";
      }
LABEL_9:
      v3 = [v4 localizedStringForKey:v6 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

      break;
    default:
      break;
  }
  return v3;
}

+ (unint64_t)emergencyCardOrganDonorStatus:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && (unint64_t v5 = [v3 integerValue], v5 <= 2)) {
    unint64_t v6 = qword_1E0F05A90[v5];
  }
  else {
    unint64_t v6 = 0;
  }

  return v6;
}

+ (id)medicalIDOrganDonorStatus:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return 0;
  }
  else {
    return (id)qword_1E6D53FF8[a3 - 1];
  }
}

+ (int64_t)numberOfRowsWithDonateLifeSignup:(BOOL)a3
{
  if (a3) {
    return 4;
  }
  if (+[HKOrganDonationConnectionManager hasStoredRegistrant])
  {
    return 4;
  }
  return 3;
}

@end