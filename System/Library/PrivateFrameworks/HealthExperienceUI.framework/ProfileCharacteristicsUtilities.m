@interface ProfileCharacteristicsUtilities
+ (id)displayStringForBiologicalSex:(int64_t)a3;
+ (id)displayStringForBloodType:(int64_t)a3;
+ (id)displayStringForFitzpatrickSkinType:(int64_t)a3;
+ (id)displayStringForWheelchairUse:(int64_t)a3;
+ (int64_t)characteristicsTypeCountForDisplayType:(id)a3;
@end

@implementation ProfileCharacteristicsUtilities

+ (int64_t)characteristicsTypeCountForDisplayType:(id)a3
{
  uint64_t v3 = [a3 displayTypeIdentifier];
  if (v3 > 87)
  {
    if (v3 != 88)
    {
      if (v3 == 103) {
        return 3;
      }
      return 0;
    }
    return 7;
  }
  else
  {
    if (v3 != 64)
    {
      if (v3 == 66) {
        return 9;
      }
      return 0;
    }
    return 4;
  }
}

+ (id)displayStringForBiologicalSex:(int64_t)a3
{
  switch(a3)
  {
    case 3:
      uint64_t v3 = WDBundle();
      v4 = v3;
      v5 = @"OTHER";
      break;
    case 2:
      uint64_t v3 = WDBundle();
      v4 = v3;
      v5 = @"MALE";
      break;
    case 1:
      uint64_t v3 = WDBundle();
      v4 = v3;
      v5 = @"FEMALE";
      break;
    default:
      uint64_t v3 = WDBundle();
      v4 = v3;
      v5 = @"BIOLOGICAL_SEX_NOT_SET";
      break;
  }
  v6 = [v3 localizedStringForKey:v5 value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable"];

  return v6;
}

+ (id)displayStringForBloodType:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      uint64_t v3 = WDBundle();
      v4 = v3;
      v5 = @"blood_type_a+";
      break;
    case 2:
      uint64_t v3 = WDBundle();
      v4 = v3;
      v5 = @"blood_type_a-";
      break;
    case 3:
      uint64_t v3 = WDBundle();
      v4 = v3;
      v5 = @"blood_type_b+";
      break;
    case 4:
      uint64_t v3 = WDBundle();
      v4 = v3;
      v5 = @"blood_type_b-";
      break;
    case 5:
      uint64_t v3 = WDBundle();
      v4 = v3;
      v5 = @"blood_type_ab+";
      break;
    case 6:
      uint64_t v3 = WDBundle();
      v4 = v3;
      v5 = @"blood_type_ab-";
      break;
    case 7:
      uint64_t v3 = WDBundle();
      v4 = v3;
      v5 = @"blood_type_o+";
      break;
    case 8:
      uint64_t v3 = WDBundle();
      v4 = v3;
      v5 = @"blood_type_o-";
      break;
    default:
      uint64_t v3 = WDBundle();
      v4 = v3;
      v5 = @"BLOOD_TYPE_NOT_SET";
      break;
  }
  v6 = [v3 localizedStringForKey:v5 value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable"];

  return v6;
}

+ (id)displayStringForFitzpatrickSkinType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      uint64_t v3 = WDBundle();
      v4 = v3;
      v5 = @"FITZPATRICK_SKIN_TYPE_NOT_SET";
      goto LABEL_10;
    case 1:
      uint64_t v3 = WDBundle();
      v4 = v3;
      v5 = @"fitzpatrick_skin_type_I";
      goto LABEL_10;
    case 2:
      uint64_t v3 = WDBundle();
      v4 = v3;
      v5 = @"fitzpatrick_skin_type_II";
      goto LABEL_10;
    case 3:
      uint64_t v3 = WDBundle();
      v4 = v3;
      v5 = @"fitzpatrick_skin_type_III";
      goto LABEL_10;
    case 4:
      uint64_t v3 = WDBundle();
      v4 = v3;
      v5 = @"fitzpatrick_skin_type_IV";
      goto LABEL_10;
    case 5:
      uint64_t v3 = WDBundle();
      v4 = v3;
      v5 = @"fitzpatrick_skin_type_V";
      goto LABEL_10;
    case 6:
      uint64_t v3 = WDBundle();
      v4 = v3;
      v5 = @"fitzpatrick_skin_type_VI";
LABEL_10:
      v6 = [v3 localizedStringForKey:v5 value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable"];

      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

+ (id)displayStringForWheelchairUse:(int64_t)a3
{
  if (a3)
  {
    uint64_t v3 = HKWheelchairUseDisplayName();
  }
  else
  {
    v4 = WDBundle();
    uint64_t v3 = [v4 localizedStringForKey:@"WHEELCHAIR_USE_NOT_SET" value:&stru_1F04402E8 table:@"WellnessDashboard-Localizable"];
  }
  return v3;
}

@end