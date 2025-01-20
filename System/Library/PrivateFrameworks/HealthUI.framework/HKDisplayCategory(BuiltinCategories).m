@interface HKDisplayCategory(BuiltinCategories)
- (UIColor)color;
- (UIImageSymbolConfiguration)multiColorImageConfiguration;
@end

@implementation HKDisplayCategory(BuiltinCategories)

- (UIImageSymbolConfiguration)multiColorImageConfiguration
{
  unint64_t v2 = [(HKDisplayCategory *)self categoryID];
  v3 = 0;
  if (v2 <= 0x1E && ((1 << v2) & 0x44DFE332) != 0)
  {
    v3 = objc_msgSend(MEMORY[0x1E4FB1830], "hk_prefersMultiColorConfiguration");
  }
  return (UIImageSymbolConfiguration *)v3;
}

- (UIColor)color
{
  int64_t v2 = [(HKDisplayCategory *)self categoryID];
  v3 = 0;
  switch(v2)
  {
    case 1:
      v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_vitalsKeyColor");
      break;
    case 2:
      v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_activityKeyColor");
      break;
    case 4:
      v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_nutritionKeyColor");
      break;
    case 5:
      v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_sleepKeyColor");
      break;
    case 6:
      v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_bodyMeasurementsKeyColor");
      break;
    case 7:
      v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_profileKeyColor");
      break;
    case 8:
      v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_reproductiveHealthKeyColor");
      break;
    case 9:
      v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_clinicalDocumentsKeyColor");
      break;
    case 10:
      v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_mindfulnessKeyColor");
      break;
    case 11:
      v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_heartKeyColor");
      break;
    case 12:
      v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_hearingHealthKeyColor");
      break;
    case 13:
      v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_respiratoryKeyColor");
      break;
    case 14:
      v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_otherKeyColor");
      break;
    case 15:
    case 20:
      v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_labResultsClinicalKeyColor");
      break;
    case 16:
      v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_allergiesClinicalKeyColor");
      break;
    case 17:
      v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_vitalsClinicalKeyColor");
      break;
    case 18:
      v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_conditionsClinicalKeyColor");
      break;
    case 19:
      v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_immunizationsClinicalKeyColor");
      break;
    case 21:
      v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_medicationsClinicalKeyColor");
      break;
    case 22:
      v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_proceduresClinicalKeyColor");
      break;
    case 23:
      v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_mobilityKeyColor");
      break;
    case 26:
      v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_symptomsKeyColor");
      break;
    case 27:
      v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_insuranceClinicalKeyColor");
      break;
    case 30:
      v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_clinicalNotesClinicalKeyColor");
      break;
    case 31:
      v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_medicationTrackingKeyColor");
      break;
    default:
      break;
  }
  return (UIColor *)v3;
}

@end