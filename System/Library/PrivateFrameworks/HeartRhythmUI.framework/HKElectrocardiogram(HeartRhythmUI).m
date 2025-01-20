@interface HKElectrocardiogram(HeartRhythmUI)
- (id)hrui_classificationShortBodyTextWithActiveAlgorithmVersion:()HeartRhythmUI isSharedData:;
@end

@implementation HKElectrocardiogram(HeartRhythmUI)

- (id)hrui_classificationShortBodyTextWithActiveAlgorithmVersion:()HeartRhythmUI isSharedData:
{
  switch([a1 privateClassification])
  {
    case 1:
      if (a3 == 2)
      {
        v7 = @"ATRIAL_FIBRILLATION_V2_CLASSIFICATION_SHORT_BODY_INCONCLUSIVE_POOR_RECORDING";
      }
      else
      {
        if (a3 != 1) {
          goto LABEL_6;
        }
        v7 = @"ATRIAL_FIBRILLATION_CLASSIFICATION_SHORT_BODY_INCONCLUSIVE_POOR_READING";
      }
      goto LABEL_14;
    case 2:
LABEL_6:
      v6 = @"ATRIAL_FIBRILLATION_CLASSIFICATION_SHORT_BODY_INCONCLUSIVE_OTHER";
      goto LABEL_19;
    case 3:
      v7 = @"ATRIAL_FIBRILLATION_CLASSIFICATION_SHORT_BODY_SINUS_RHYTHM_HEART_RATE_50_TO_100";
      goto LABEL_14;
    case 4:
    case 8:
      v6 = @"ATRIAL_FIBRILLATION_CLASSIFICATION_SHORT_BODY_ATRIAL_FIBRILLATION_HEART_RATE_50_TO_120";
      goto LABEL_19;
    case 5:
      v6 = @"ATRIAL_FIBRILLATION_CLASSIFICATION_SHORT_BODY_HEART_RATE_ABOVE_120";
      goto LABEL_19;
    case 6:
      if (a3 == 2)
      {
        v6 = @"ATRIAL_FIBRILLATION_V2_CLASSIFICATION_SHORT_BODY_HEART_RATE_BELOW_50";
        goto LABEL_19;
      }
      if (a3 == 1)
      {
        v6 = @"ATRIAL_FIBRILLATION_CLASSIFICATION_SHORT_BODY_HEART_RATE_BELOW_50";
LABEL_19:
        v9 = [(__CFString *)v6 hrui_appendForSharing:a4];
        v8 = HRUIECGLocalizedString(v9);

        goto LABEL_20;
      }
LABEL_13:
      v7 = @"ATRIAL_FIBRILLATION_CLASSIFICATION_SHORT_BODY_UNKNOWN";
LABEL_14:
      v8 = HRUIECGLocalizedString(v7);
LABEL_20:
      return v8;
    case 7:
      v6 = @"ATRIAL_FIBRILLATION_V2_CLASSIFICATION_SHORT_BODY_SINUS_TACHYCARDIA_HEART_RATE_100_TO_150";
      goto LABEL_19;
    case 9:
      v6 = @"ATRIAL_FIBRILLATION_V2_CLASSIFICATION_SHORT_BODY_ATRIAL_FIBRILLATION_HEART_RATE_100_TO_150";
      goto LABEL_19;
    case 10:
      v6 = @"ATRIAL_FIBRILLATION_V2_CLASSIFICATION_SHORT_BODY_HEART_RATE_ABOVE_150";
      goto LABEL_19;
    default:
      goto LABEL_13;
  }
}

@end