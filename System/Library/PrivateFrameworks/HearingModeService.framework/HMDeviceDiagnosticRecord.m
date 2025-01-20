@interface HMDeviceDiagnosticRecord
+ (BOOL)supportsSecureCoding;
+ (int)getHMDiagnosticMeasurementStatusForValue:(unsigned __int8)a3;
+ (int)getHMDiagnosticStatusForValue:(unsigned __int8)a3;
- (BOOL)_hasValidMeasurementForSide:(id)a3;
- (BOOL)_isANCScoreSupported;
- (BOOL)_isComponentDiagnosticSupported;
- (BOOL)_isDate:(id)a3 lesserThanOrEqualToMonths:(unsigned __int8)a4;
- (BOOL)_isFirstTimeOfUseSupported;
- (BOOL)hasMeasurementChangedForSide:(id)a3 withRecord:(id)a4;
- (BOOL)isDeviceUsedFor3MonthsOrLess;
- (BOOL)isNewPairing;
- (BOOL)isOcclusionDetectionSupported;
- (BOOL)updateFaultCountsFromCloudRecord:(id)a3;
- (HMDeviceDiagnosticRecord)initWithCoder:(id)a3;
- (HMDeviceDiagnosticRecord)initWithHMDeviceRecord:(id)a3 isNewPairing:(BOOL)a4;
- (NSDate)firstTimeUseTimestampLeft;
- (NSDate)firstTimeUseTimestampRight;
- (NSDate)lastMeasurementTimestampLeft;
- (NSDate)lastMeasurementTimestampRight;
- (NSNumber)ancCleanLossScoreLeft;
- (NSNumber)ancCleanLossScoreRight;
- (NSNumber)ancFullLossScoreLeft;
- (NSNumber)ancFullLossScoreRight;
- (NSNumber)ancSevereLossScoreLeft;
- (NSNumber)ancSevereLossScoreRight;
- (NSNumber)daysSinceLastHarmonicMeasurementLeft;
- (NSNumber)daysSinceLastHarmonicMeasurementRight;
- (NSNumber)daysSinceLastMeasurementLeft;
- (NSNumber)daysSinceLastMeasurementRight;
- (NSNumber)version;
- (NSString)bluetoothAddress;
- (NSString)bluetoothUUID;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)getCloudRecordForCurrentFaultCount;
- (id)getOnDemandRetestReason;
- (id)measurementInvalidReason;
- (int)ancLossTypeLeft;
- (int)ancLossTypeRight;
- (int)computeOcclusionResultForHearingProtection;
- (int)computeOcclusionResultForHearingTest;
- (int)errMicStatusLeft;
- (int)errMicStatusRight;
- (int)frequencyAccuracyLeft;
- (int)frequencyAccuracyRight;
- (int)frontVentStatusLeft;
- (int)frontVentStatusRight;
- (int)generalSystemStatusLeft;
- (int)generalSystemStatusRight;
- (int)latestMeasurementResultLeft;
- (int)latestMeasurementResultRight;
- (int)rearVentStatusLeft;
- (int)rearVentStatusRight;
- (int)refMicStatusLeft;
- (int)refMicStatusRight;
- (int)speakerStatusLeft;
- (int)speakerStatusRight;
- (int)totalHarmonicDistortionLeft;
- (int)totalHarmonicDistortionRight;
- (int)vceMicStatusLeft;
- (int)vceMicStatusRight;
- (int64_t)_minutesSinceTimestamp:(id)a3;
- (unsigned)_getMinimumRequiredPayloadLength;
- (unsigned)bottomMicFaultCountLeft;
- (unsigned)bottomMicFaultCountRight;
- (unsigned)diagnosticMeasurementsCount;
- (unsigned)freqAccuracyFaultCountLeft;
- (unsigned)freqAccuracyFaultCountRight;
- (unsigned)frontVentFaultCountLeft;
- (unsigned)frontVentFaultCountRight;
- (unsigned)innerMicFaultCountLeft;
- (unsigned)innerMicFaultCountRight;
- (unsigned)rearVentFaultCountLeft;
- (unsigned)rearVentFaultCountRight;
- (unsigned)speakerFaultCountLeft;
- (unsigned)speakerFaultCountRight;
- (unsigned)topMicFaultCountLeft;
- (unsigned)topMicFaultCountRight;
- (unsigned)totalHarmonicDistortionFaultCountLeft;
- (unsigned)totalHarmonicDistortionFaultCountRight;
- (void)_prefsLoadOcclusionStats;
- (void)_prefsResetOcclusionStatsForFeatureID:(int)a3 type:(int)a4;
- (void)_prefsSaveOcclusionStats;
- (void)_resetAllOcclusionStats;
- (void)_submitMetricsForOcclusionIndicationType:(int)a3 action:(int)a4 previousIndicationCount:(unsigned int)a5 timeSinceFirstIndicationMins:(int64_t)a6;
- (void)_updateLeftSideFaultCountWithCloudRecord:(id)a3;
- (void)_updateRightSideFaultCountWithCloudRecord:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)occlusionIndicationShownForFeatureID:(int)a3 type:(int)a4 action:(int)a5;
- (void)resetFaultCounts;
- (void)setBottomMicFaultCountLeft:(unsigned int)a3;
- (void)setBottomMicFaultCountRight:(unsigned int)a3;
- (void)setDiagnosticMeasurementsCount:(unsigned int)a3;
- (void)setFirstTimeUseTimestampLeft:(id)a3;
- (void)setFirstTimeUseTimestampRight:(id)a3;
- (void)setFreqAccuracyFaultCountLeft:(unsigned int)a3;
- (void)setFreqAccuracyFaultCountRight:(unsigned int)a3;
- (void)setFrontVentFaultCountLeft:(unsigned int)a3;
- (void)setFrontVentFaultCountRight:(unsigned int)a3;
- (void)setInnerMicFaultCountLeft:(unsigned int)a3;
- (void)setInnerMicFaultCountRight:(unsigned int)a3;
- (void)setIsNewPairing:(BOOL)a3;
- (void)setRearVentFaultCountLeft:(unsigned int)a3;
- (void)setRearVentFaultCountRight:(unsigned int)a3;
- (void)setSpeakerFaultCountLeft:(unsigned int)a3;
- (void)setSpeakerFaultCountRight:(unsigned int)a3;
- (void)setTopMicFaultCountLeft:(unsigned int)a3;
- (void)setTopMicFaultCountRight:(unsigned int)a3;
- (void)setTotalHarmonicDistortionFaultCountLeft:(unsigned int)a3;
- (void)setTotalHarmonicDistortionFaultCountRight:(unsigned int)a3;
- (void)submitMetricsForOcclusionPolicy;
- (void)updateWithANCLossScores:(id)a3;
- (void)updateWithDiagnosticData:(id)a3;
- (void)updateWithMeasurementData:(id)a3;
- (void)updateWithMeasurementDataLegacyVersion:(id)a3;
- (void)updateWithMeasurementResultLeft:(unsigned int)a3;
- (void)updateWithMeasurementResultRight:(unsigned int)a3;
@end

@implementation HMDeviceDiagnosticRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMDeviceDiagnosticRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDeviceDiagnosticRecord *)self init];
  if (v5)
  {
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_ancLossTypeLeft = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_ancLossTypeRight = 0;
    }
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_errMicStatusLeft = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_errMicStatusRight = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_frequencyAccuracyLeft = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_frequencyAccuracyRight = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_frontVentStatusLeft = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_frontVentStatusRight = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_generalSystemStatusLeft = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_generalSystemStatusRight = 0;
    }
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_latestMeasurementResultLeft = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_latestMeasurementResultRight = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_rearVentStatusLeft = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_rearVentStatusRight = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_refMicStatusLeft = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_refMicStatusRight = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_speakerStatusLeft = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_speakerStatusRight = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_totalHarmonicDistortionLeft = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_totalHarmonicDistortionRight = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_vceMicStatusLeft = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_vceMicStatusRight = 0;
    }
    objc_opt_class();
    NSDecodeObjectIfPresent();
    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  bluetoothUUID = self->_bluetoothUUID;
  id v42 = v4;
  if (bluetoothUUID)
  {
    [v4 encodeObject:bluetoothUUID forKey:@"btUUID"];
    id v4 = v42;
  }
  bluetoothAddress = self->_bluetoothAddress;
  if (bluetoothAddress)
  {
    [v42 encodeObject:bluetoothAddress forKey:@"btAdS"];
    id v4 = v42;
  }
  uint64_t ancLossTypeLeft = self->_ancLossTypeLeft;
  if (ancLossTypeLeft)
  {
    [v42 encodeInteger:ancLossTypeLeft forKey:@"ancL"];
    id v4 = v42;
  }
  uint64_t ancLossTypeRight = self->_ancLossTypeRight;
  if (ancLossTypeRight)
  {
    [v42 encodeInteger:ancLossTypeRight forKey:@"ancR"];
    id v4 = v42;
  }
  ancCleanLossScoreLeft = self->_ancCleanLossScoreLeft;
  if (ancCleanLossScoreLeft)
  {
    [v42 encodeObject:ancCleanLossScoreLeft forKey:@"cLSL"];
    id v4 = v42;
  }
  ancCleanLossScoreRight = self->_ancCleanLossScoreRight;
  if (ancCleanLossScoreRight)
  {
    [v42 encodeObject:ancCleanLossScoreRight forKey:@"cLSR"];
    id v4 = v42;
  }
  ancFullLossScoreLeft = self->_ancFullLossScoreLeft;
  if (ancFullLossScoreLeft)
  {
    [v42 encodeObject:ancFullLossScoreLeft forKey:@"fLSL"];
    id v4 = v42;
  }
  ancFullLossScoreRight = self->_ancFullLossScoreRight;
  if (ancFullLossScoreRight)
  {
    [v42 encodeObject:ancFullLossScoreRight forKey:@"fLSR"];
    id v4 = v42;
  }
  ancSevereLossScoreLeft = self->_ancSevereLossScoreLeft;
  if (ancSevereLossScoreLeft)
  {
    [v42 encodeObject:ancSevereLossScoreLeft forKey:@"sLSL"];
    id v4 = v42;
  }
  ancSevereLossScoreRight = self->_ancSevereLossScoreRight;
  if (ancSevereLossScoreRight)
  {
    [v42 encodeObject:ancSevereLossScoreRight forKey:@"sLSR"];
    id v4 = v42;
  }
  daysSinceLastMeasurementLeft = self->_daysSinceLastMeasurementLeft;
  if (daysSinceLastMeasurementLeft)
  {
    [v42 encodeObject:daysSinceLastMeasurementLeft forKey:@"dslml"];
    id v4 = v42;
  }
  daysSinceLastMeasurementRight = self->_daysSinceLastMeasurementRight;
  if (daysSinceLastMeasurementRight)
  {
    [v42 encodeObject:daysSinceLastMeasurementRight forKey:@"dslmr"];
    id v4 = v42;
  }
  daysSinceLastHarmonicMeasurementLeft = self->_daysSinceLastHarmonicMeasurementLeft;
  if (daysSinceLastHarmonicMeasurementLeft)
  {
    [v42 encodeObject:daysSinceLastHarmonicMeasurementLeft forKey:@"dsHml"];
    id v4 = v42;
  }
  daysSinceLastHarmonicMeasurementRight = self->_daysSinceLastHarmonicMeasurementRight;
  if (daysSinceLastHarmonicMeasurementRight)
  {
    [v42 encodeObject:daysSinceLastHarmonicMeasurementRight forKey:@"dsHmr"];
    id v4 = v42;
  }
  uint64_t errMicStatusLeft = self->_errMicStatusLeft;
  if (errMicStatusLeft)
  {
    [v42 encodeInteger:errMicStatusLeft forKey:@"errFL"];
    id v4 = v42;
  }
  uint64_t errMicStatusRight = self->_errMicStatusRight;
  if (errMicStatusRight)
  {
    [v42 encodeInteger:errMicStatusRight forKey:@"errFR"];
    id v4 = v42;
  }
  uint64_t frequencyAccuracyLeft = self->_frequencyAccuracyLeft;
  if (frequencyAccuracyLeft)
  {
    [v42 encodeInteger:frequencyAccuracyLeft forKey:@"fqAcL"];
    id v4 = v42;
  }
  uint64_t frequencyAccuracyRight = self->_frequencyAccuracyRight;
  if (frequencyAccuracyRight)
  {
    [v42 encodeInteger:frequencyAccuracyRight forKey:@"fqAcR"];
    id v4 = v42;
  }
  uint64_t frontVentStatusLeft = self->_frontVentStatusLeft;
  if (frontVentStatusLeft)
  {
    [v42 encodeInteger:frontVentStatusLeft forKey:@"fvnFL"];
    id v4 = v42;
  }
  uint64_t frontVentStatusRight = self->_frontVentStatusRight;
  if (frontVentStatusRight)
  {
    [v42 encodeInteger:frontVentStatusRight forKey:@"fvnFR"];
    id v4 = v42;
  }
  uint64_t generalSystemStatusLeft = self->_generalSystemStatusLeft;
  if (generalSystemStatusLeft)
  {
    [v42 encodeInteger:generalSystemStatusLeft forKey:@"gnrFL"];
    id v4 = v42;
  }
  uint64_t generalSystemStatusRight = self->_generalSystemStatusRight;
  if (generalSystemStatusRight)
  {
    [v42 encodeInteger:generalSystemStatusRight forKey:@"gnrFR"];
    id v4 = v42;
  }
  lastMeasurementTimestampLeft = self->_lastMeasurementTimestampLeft;
  if (lastMeasurementTimestampLeft)
  {
    [v42 encodeObject:lastMeasurementTimestampLeft forKey:@"lmTsL"];
    id v4 = v42;
  }
  lastMeasurementTimestampRight = self->_lastMeasurementTimestampRight;
  if (lastMeasurementTimestampRight)
  {
    [v42 encodeObject:lastMeasurementTimestampRight forKey:@"lmTsR"];
    id v4 = v42;
  }
  uint64_t latestMeasurementResultLeft = self->_latestMeasurementResultLeft;
  if (latestMeasurementResultLeft)
  {
    [v42 encodeInteger:latestMeasurementResultLeft forKey:@"lmRsL"];
    id v4 = v42;
  }
  uint64_t latestMeasurementResultRight = self->_latestMeasurementResultRight;
  if (latestMeasurementResultRight)
  {
    [v42 encodeInteger:latestMeasurementResultRight forKey:@"lmRsR"];
    id v4 = v42;
  }
  uint64_t rearVentStatusLeft = self->_rearVentStatusLeft;
  if (rearVentStatusLeft)
  {
    [v42 encodeInteger:rearVentStatusLeft forKey:@"rvnFL"];
    id v4 = v42;
  }
  uint64_t rearVentStatusRight = self->_rearVentStatusRight;
  if (rearVentStatusRight)
  {
    [v42 encodeInteger:rearVentStatusRight forKey:@"rvnFR"];
    id v4 = v42;
  }
  uint64_t refMicStatusLeft = self->_refMicStatusLeft;
  if (refMicStatusLeft)
  {
    [v42 encodeInteger:refMicStatusLeft forKey:@"refFL"];
    id v4 = v42;
  }
  uint64_t refMicStatusRight = self->_refMicStatusRight;
  if (refMicStatusRight)
  {
    [v42 encodeInteger:refMicStatusRight forKey:@"refFR"];
    id v4 = v42;
  }
  uint64_t speakerStatusLeft = self->_speakerStatusLeft;
  if (speakerStatusLeft)
  {
    [v42 encodeInteger:speakerStatusLeft forKey:@"sprFL"];
    id v4 = v42;
  }
  uint64_t speakerStatusRight = self->_speakerStatusRight;
  if (speakerStatusRight)
  {
    [v42 encodeInteger:speakerStatusRight forKey:@"sprFR"];
    id v4 = v42;
  }
  uint64_t totalHarmonicDistortionLeft = self->_totalHarmonicDistortionLeft;
  if (totalHarmonicDistortionLeft)
  {
    [v42 encodeInteger:totalHarmonicDistortionLeft forKey:@"thdL"];
    id v4 = v42;
  }
  uint64_t totalHarmonicDistortionRight = self->_totalHarmonicDistortionRight;
  if (totalHarmonicDistortionRight)
  {
    [v42 encodeInteger:totalHarmonicDistortionRight forKey:@"thdR"];
    id v4 = v42;
  }
  uint64_t vceMicStatusLeft = self->_vceMicStatusLeft;
  if (vceMicStatusLeft)
  {
    [v42 encodeInteger:vceMicStatusLeft forKey:@"vceFL"];
    id v4 = v42;
  }
  uint64_t vceMicStatusRight = self->_vceMicStatusRight;
  if (vceMicStatusRight)
  {
    [v42 encodeInteger:vceMicStatusRight forKey:@"vceFR"];
    id v4 = v42;
  }
  version = self->_version;
  if (version)
  {
    [v42 encodeObject:version forKey:@"versn"];
    id v4 = v42;
  }
}

- (id)description
{
  return [(HMDeviceDiagnosticRecord *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  v75 = [(id)objc_opt_class() description];
  NSAppendPrintF_safe();
  id v5 = 0;

  if (a3 <= 20)
  {
    NSAppendPrintF_safe();
    id v6 = v5;

    id v5 = v6;
  }
  id v7 = self->_bluetoothAddress;
  v8 = v7;
  if (v7)
  {
    v75 = v7;
    NSAppendPrintF_safe();
    id v9 = v5;

    id v5 = v9;
  }

  v10 = self->_bluetoothUUID;
  v11 = v10;
  if (v10)
  {
    v75 = v10;
    NSAppendPrintF_safe();
    id v12 = v5;

    id v5 = v12;
  }

  signed int productID = self->_productID;
  if (productID)
  {
    if (productID > 665)
    {
      if (productID <= 799)
      {
        if (productID > 776)
        {
          switch(productID)
          {
            case 777:
              v14 = objc_msgSend(MEMORY[0x263F086E0], "bundleWithIdentifier:", @"com.apple.CoreBluetooth", v75);
              v15 = v14;
              v16 = @"apple_wireless_mouse";
              goto LABEL_45;
            case 780:
              v14 = objc_msgSend(MEMORY[0x263F086E0], "bundleWithIdentifier:", @"com.apple.CoreBluetooth", v75);
              v15 = v14;
              v16 = @"apple_mighty_mouse";
              goto LABEL_45;
            case 781:
LABEL_40:
              v14 = objc_msgSend(MEMORY[0x263F086E0], "bundleWithIdentifier:", @"com.apple.CoreBluetooth", v75);
              v15 = v14;
              v16 = @"apple_magic_mouse";
              goto LABEL_45;
            case 782:
LABEL_31:
              v14 = objc_msgSend(MEMORY[0x263F086E0], "bundleWithIdentifier:", @"com.apple.CoreBluetooth", v75);
              v15 = v14;
              v16 = @"apple_magic_trackpad";
              goto LABEL_45;
            default:
              goto LABEL_127;
          }
        }
        switch(productID)
        {
          case 666:
LABEL_124:
            v14 = objc_msgSend(MEMORY[0x263F086E0], "bundleWithIdentifier:", @"com.apple.CoreBluetooth", v75);
            v15 = v14;
            v16 = @"apple_magic_keyboard_touch";
            break;
          case 668:
LABEL_41:
            v14 = objc_msgSend(MEMORY[0x263F086E0], "bundleWithIdentifier:", @"com.apple.CoreBluetooth", v75);
            v15 = v14;
            v16 = @"apple_magic_keyboard";
            break;
          case 671:
LABEL_39:
            v14 = objc_msgSend(MEMORY[0x263F086E0], "bundleWithIdentifier:", @"com.apple.CoreBluetooth", v75);
            v15 = v14;
            v16 = @"apple_magic_keyboard_touch_keypad";
            break;
          default:
LABEL_127:
            v15 = [MEMORY[0x263EFEF68] productInfoWithProductID:v75];
            uint64_t v17 = [v15 productName];
            goto LABEL_46;
        }
      }
      else
      {
        if (productID <= 8212)
        {
          switch(productID)
          {
            case 800:
              goto LABEL_41;
            case 801:
              goto LABEL_124;
            case 802:
              goto LABEL_39;
            case 803:
              goto LABEL_40;
            case 804:
              goto LABEL_31;
            default:
              goto LABEL_127;
          }
        }
        if (productID != 8220 && productID != 8216 && productID != 8213) {
          goto LABEL_127;
        }
        v14 = objc_msgSend(MEMORY[0x263F086E0], "bundleWithIdentifier:", @"com.apple.CoreBluetooth", v75);
        v15 = v14;
        v16 = @"apple_airpods_case";
      }
    }
    else
    {
      if (productID > 570)
      {
        if (productID > 598)
        {
          switch(productID)
          {
            case 613:
              goto LABEL_31;
            case 614:
            case 616:
            case 618:
            case 619:
              goto LABEL_127;
            case 615:
              goto LABEL_41;
            case 617:
              goto LABEL_40;
            case 620:
              v14 = objc_msgSend(MEMORY[0x263F086E0], "bundleWithIdentifier:", @"com.apple.CoreBluetooth", v75);
              v15 = v14;
              v16 = @"apple_magic_keyboard_keypad";
              goto LABEL_45;
            default:
              if (productID != 599) {
                goto LABEL_127;
              }
              goto LABEL_44;
          }
        }
        if (productID != 571 && productID != 597 && productID != 598) {
          goto LABEL_127;
        }
      }
      else if (productID > 556)
      {
        if (productID <= 568 && productID != 557 && productID != 558) {
          goto LABEL_127;
        }
      }
      else if (productID > 521)
      {
        if (productID != 522 && productID != 556) {
          goto LABEL_127;
        }
      }
      else if (productID != 520 && productID != 521)
      {
        goto LABEL_127;
      }
LABEL_44:
      v14 = objc_msgSend(MEMORY[0x263F086E0], "bundleWithIdentifier:", @"com.apple.CoreBluetooth", v75);
      v15 = v14;
      v16 = @"apple_wireless_keyboard";
    }
LABEL_45:
    uint64_t v17 = [v14 localizedStringForKey:v16 value:&stru_27020DE28 table:@"CBLocalizable"];
LABEL_46:
    v18 = (void *)v17;

    NSAppendPrintF_safe();
    id v19 = v5;

    id v5 = v19;
  }
  v20 = self->_lastMeasurementTimestampLeft;
  if (v20)
  {
    NSAppendPrintF_safe();
    id v21 = v5;

    id v5 = v21;
  }

  v22 = self->_lastMeasurementTimestampRight;
  if (v22)
  {
    NSAppendPrintF_safe();
    id v23 = v5;

    id v5 = v23;
  }

  if (self->_ancLossTypeLeft)
  {
    NSAppendPrintF_safe();
    id v24 = v5;

    id v5 = v24;
  }
  if (self->_ancLossTypeRight)
  {
    NSAppendPrintF_safe();
    id v25 = v5;

    id v5 = v25;
  }
  v26 = self->_ancCleanLossScoreLeft;
  if (v26)
  {
    NSAppendPrintF_safe();
    id v27 = v5;

    id v5 = v27;
  }

  v28 = self->_ancCleanLossScoreRight;
  if (v28)
  {
    NSAppendPrintF_safe();
    id v29 = v5;

    id v5 = v29;
  }

  v30 = self->_ancFullLossScoreLeft;
  if (v30)
  {
    NSAppendPrintF_safe();
    id v31 = v5;

    id v5 = v31;
  }

  v32 = self->_ancFullLossScoreRight;
  if (v32)
  {
    NSAppendPrintF_safe();
    id v33 = v5;

    id v5 = v33;
  }

  v34 = self->_ancSevereLossScoreLeft;
  if (v34)
  {
    NSAppendPrintF_safe();
    id v35 = v5;

    id v5 = v35;
  }

  v36 = self->_ancSevereLossScoreRight;
  if (v36)
  {
    NSAppendPrintF_safe();
    id v37 = v5;

    id v5 = v37;
  }

  v38 = self->_daysSinceLastMeasurementLeft;
  if (v38)
  {
    NSAppendPrintF_safe();
    id v39 = v5;

    id v5 = v39;
  }

  v40 = self->_daysSinceLastMeasurementRight;
  if (v40)
  {
    NSAppendPrintF_safe();
    id v41 = v5;

    id v5 = v41;
  }

  id v42 = self->_daysSinceLastHarmonicMeasurementLeft;
  if (v42)
  {
    NSAppendPrintF_safe();
    id v43 = v5;

    id v5 = v43;
  }

  v44 = self->_daysSinceLastHarmonicMeasurementRight;
  if (v44)
  {
    NSAppendPrintF_safe();
    id v45 = v5;

    id v5 = v45;
  }

  if (self->_errMicStatusLeft)
  {
    NSAppendPrintF_safe();
    id v46 = v5;

    id v5 = v46;
  }
  if (self->_errMicStatusRight)
  {
    NSAppendPrintF_safe();
    id v47 = v5;

    id v5 = v47;
  }
  v48 = self->_firstTimeUseTimestampLeft;
  if (v48)
  {
    NSAppendPrintF_safe();
    id v49 = v5;

    id v5 = v49;
  }

  v50 = self->_firstTimeUseTimestampRight;
  if (v50)
  {
    NSAppendPrintF_safe();
    id v51 = v5;

    id v5 = v51;
  }

  if (self->_frequencyAccuracyLeft)
  {
    NSAppendPrintF_safe();
    id v52 = v5;

    id v5 = v52;
  }
  if (self->_frequencyAccuracyRight)
  {
    NSAppendPrintF_safe();
    id v53 = v5;

    id v5 = v53;
  }
  if (self->_frontVentStatusLeft)
  {
    NSAppendPrintF_safe();
    id v54 = v5;

    id v5 = v54;
  }
  if (self->_frontVentStatusRight)
  {
    NSAppendPrintF_safe();
    id v55 = v5;

    id v5 = v55;
  }
  if (self->_generalSystemStatusLeft)
  {
    NSAppendPrintF_safe();
    id v56 = v5;

    id v5 = v56;
  }
  if (self->_generalSystemStatusRight)
  {
    NSAppendPrintF_safe();
    id v57 = v5;

    id v5 = v57;
  }
  if (self->_latestMeasurementResultLeft)
  {
    NSAppendPrintF_safe();
    id v58 = v5;

    id v5 = v58;
  }
  if (self->_latestMeasurementResultRight)
  {
    NSAppendPrintF_safe();
    id v59 = v5;

    id v5 = v59;
  }
  if (self->_rearVentStatusLeft)
  {
    NSAppendPrintF_safe();
    id v60 = v5;

    id v5 = v60;
  }
  if (self->_rearVentStatusRight)
  {
    NSAppendPrintF_safe();
    id v61 = v5;

    id v5 = v61;
  }
  if (self->_refMicStatusLeft)
  {
    NSAppendPrintF_safe();
    id v62 = v5;

    id v5 = v62;
  }
  if (self->_refMicStatusRight)
  {
    NSAppendPrintF_safe();
    id v63 = v5;

    id v5 = v63;
  }
  if (self->_speakerStatusLeft)
  {
    NSAppendPrintF_safe();
    id v64 = v5;

    id v5 = v64;
  }
  if (self->_speakerStatusRight)
  {
    NSAppendPrintF_safe();
    id v65 = v5;

    id v5 = v65;
  }
  if (self->_totalHarmonicDistortionLeft)
  {
    NSAppendPrintF_safe();
    id v66 = v5;

    id v5 = v66;
  }
  if (self->_totalHarmonicDistortionRight)
  {
    NSAppendPrintF_safe();
    id v67 = v5;

    id v5 = v67;
  }
  if (self->_vceMicStatusLeft)
  {
    NSAppendPrintF_safe();
    id v68 = v5;

    id v5 = v68;
  }
  if (self->_vceMicStatusRight)
  {
    NSAppendPrintF_safe();
    id v69 = v5;

    id v5 = v69;
  }
  v70 = self->_version;
  if (v70)
  {
    NSAppendPrintF_safe();
    id v71 = v5;

    id v5 = v71;
  }

  if (a3 < 21)
  {
    NSAppendPrintF_safe();
    id v72 = v5;

    id v5 = v72;
  }
  id v73 = v5;

  return v73;
}

- (HMDeviceDiagnosticRecord)initWithHMDeviceRecord:(id)a3 isNewPairing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDeviceDiagnosticRecord;
  id v7 = [(HMDeviceDiagnosticRecord *)&v17 init];
  if (v7)
  {
    v8 = [v6 bluetoothAddress];
    objc_storeStrong((id *)&v7->_bluetoothAddress, v8);
    id v9 = [v6 bluetoothUUID];
    objc_storeStrong((id *)&v7->_bluetoothUUID, v9);
    v10 = [v6 aaDevice];
    v11 = [v10 coreBluetoothDevice];
    unsigned int v12 = [v11 productID];

    v7->_signed int productID = v12;
    v13 = [v6 aaDevice];
    uint64_t v14 = [v13 firmwareVersion];
    firmwareVersion = v7->_firmwareVersion;
    v7->_firmwareVersion = (NSString *)v14;

    [(HMDeviceDiagnosticRecord *)v7 _prefsLoadOcclusionStats];
    if (v4) {
      [(HMDeviceDiagnosticRecord *)v7 _resetAllOcclusionStats];
    }
  }
  return v7;
}

- (void)setIsNewPairing:(BOOL)a3
{
  if (a3) {
    [(HMDeviceDiagnosticRecord *)self _resetAllOcclusionStats];
  }
}

+ (int)getHMDiagnosticMeasurementStatusForValue:(unsigned __int8)a3
{
  if (a3 < 8u) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

+ (int)getHMDiagnosticStatusForValue:(unsigned __int8)a3
{
  if (a3 < 5u) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

- (BOOL)_hasValidMeasurementForSide:(id)a3
{
  BOOL v4 = (__CFString *)a3;
  id v5 = v4;
  if (v4 == @"left") {
    goto LABEL_4;
  }
  if (!v4)
  {
LABEL_9:
    BOOL v8 = 0;
    goto LABEL_10;
  }
  char v6 = [(__CFString *)v4 isEqual:@"left"];

  if ((v6 & 1) == 0)
  {
    id v9 = v5;
    if (v9 == @"right"
      || (v10 = v9, int v11 = [(__CFString *)v9 isEqual:@"right"], v10, v11))
    {
      uint64_t v7 = 104;
      goto LABEL_5;
    }
    goto LABEL_9;
  }
LABEL_4:
  uint64_t v7 = 100;
LABEL_5:
  BOOL v8 = (*(_DWORD *)((char *)&self->super.isa + v7) - 1) < 2;
LABEL_10:

  return v8;
}

- (BOOL)_isANCScoreSupported
{
  return self->_productID == 8219 && [(NSNumber *)self->_version intValue] > 3;
}

- (BOOL)_isComponentDiagnosticSupported
{
  return ((self->_productID - 8212) & 0xFFFFFFEF) == 0;
}

- (BOOL)_isFirstTimeOfUseSupported
{
  return [(NSNumber *)self->_version intValue] > 4;
}

- (BOOL)_isDate:(id)a3 lesserThanOrEqualToMonths:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  id v5 = a3;
  if (v5)
  {
    char v6 = [MEMORY[0x263EFF910] date];
    uint64_t v7 = [MEMORY[0x263EFF8F0] currentCalendar];
    BOOL v8 = [v7 components:28 fromDate:v5 toDate:v6 options:0];
    if (gLogCategory_HMDeviceDiagnosticRecord <= 10
      && (gLogCategory_HMDeviceDiagnosticRecord != -1 || _LogCategory_Initialize()))
    {
      uint64_t v9 = [v8 day];
      uint64_t v14 = [v8 month];
      uint64_t v15 = [v8 year];
      id v12 = v5;
      uint64_t v13 = v9;
      LogPrintF();
    }
    BOOL v10 = objc_msgSend(v8, "year", v12, v13, v14, v15) <= 0 && objc_msgSend(v8, "month") <= v4;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unsigned)_getMinimumRequiredPayloadLength
{
  if ([(NSNumber *)self->_version intValue] < 5) {
    return 33;
  }
  if ([(NSNumber *)self->_version intValue] <= 4) {
    return 0;
  }
  return 57;
}

- (int64_t)_minutesSinceTimestamp:(id)a3
{
  if (!a3) {
    return 0;
  }
  v3 = (void *)MEMORY[0x263EFF910];
  id v4 = a3;
  id v5 = [v3 now];
  char v6 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v7 = [v6 components:224 fromDate:v4 toDate:v5 options:0];

  int64_t v8 = [v7 minute];
  return v8;
}

- (id)getCloudRecordForCurrentFaultCount
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F28968]) initWithBluetoothAddress:self->_bluetoothAddress];
  id v4 = [NSNumber numberWithUnsignedInt:self->_bottomMicFaultCountLeft];
  [v3 setBottomMicFaultCountLeft:v4];

  id v5 = [NSNumber numberWithUnsignedInt:self->_topMicFaultCountLeft];
  [v3 setTopMicFaultCountLeft:v5];

  char v6 = [NSNumber numberWithUnsignedInt:self->_innerMicFaultCountLeft];
  [v3 setInnerMicFaultCountLeft:v6];

  uint64_t v7 = [NSNumber numberWithUnsignedInt:self->_speakerFaultCountLeft];
  [v3 setSpeakerFaultCountLeft:v7];

  int64_t v8 = [NSNumber numberWithUnsignedInt:self->_frontVentFaultCountLeft];
  [v3 setFrontVentFaultCountLeft:v8];

  uint64_t v9 = [NSNumber numberWithUnsignedInt:self->_rearVentFaultCountLeft];
  [v3 setRearVentFaultCountLeft:v9];

  BOOL v10 = [NSNumber numberWithUnsignedInt:self->_totalHarmonicDistortionFaultCountLeft];
  [v3 setTotalHarmonicDistortionFaultCountLeft:v10];

  int v11 = [NSNumber numberWithUnsignedInt:self->_freqAccuracyFaultCountLeft];
  [v3 setFreqAccuracyFaultCountLeft:v11];

  [v3 setLatestDiagnosticTimestampLeft:self->_lastMeasurementTimestampLeft];
  id v12 = [NSNumber numberWithUnsignedInt:self->_bottomMicFaultCountRight];
  [v3 setBottomMicFaultCountRight:v12];

  uint64_t v13 = [NSNumber numberWithUnsignedInt:self->_topMicFaultCountRight];
  [v3 setTopMicFaultCountRight:v13];

  uint64_t v14 = [NSNumber numberWithUnsignedInt:self->_innerMicFaultCountRight];
  [v3 setInnerMicFaultCountRight:v14];

  uint64_t v15 = [NSNumber numberWithUnsignedInt:self->_speakerFaultCountRight];
  [v3 setSpeakerFaultCountRight:v15];

  v16 = [NSNumber numberWithUnsignedInt:self->_frontVentFaultCountRight];
  [v3 setFrontVentFaultCountRight:v16];

  objc_super v17 = [NSNumber numberWithUnsignedInt:self->_rearVentFaultCountRight];
  [v3 setRearVentFaultCountRight:v17];

  v18 = [NSNumber numberWithUnsignedInt:self->_totalHarmonicDistortionFaultCountRight];
  [v3 setTotalHarmonicDistortionFaultCountRight:v18];

  id v19 = [NSNumber numberWithUnsignedInt:self->_freqAccuracyFaultCountRight];
  [v3 setFreqAccuracyFaultCountRight:v19];

  [v3 setLatestDiagnosticTimestampRight:self->_lastMeasurementTimestampRight];
  v20 = [NSNumber numberWithUnsignedInt:self->_diagnosticMeasurementsCount];
  [v3 setDiagnosticMeasurementsCount:v20];

  return v3;
}

- (void)resetFaultCounts
{
  self->_totalHarmonicDistortionFaultCountRight = 0;
  *(_OWORD *)&self->_speakerFaultCountRight = 0u;
  *(_OWORD *)&self->_innerMicFaultCountRight = 0u;
  *(_OWORD *)&self->_freqAccuracyFaultCountRight = 0u;
  *(_OWORD *)&self->_bottomMicFaultCountLeft = 0u;
}

- (BOOL)updateFaultCountsFromCloudRecord:(id)a3
{
  id v4 = a3;
  if (![(HMDeviceDiagnosticRecord *)self isOcclusionDetectionSupported])
  {
LABEL_15:
    BOOL v9 = 0;
    goto LABEL_16;
  }
  BOOL v5 = [(HMDeviceDiagnosticRecord *)self hasMeasurementChangedForSide:@"left" withRecord:v4];
  if (v5) {
    [(HMDeviceDiagnosticRecord *)self _updateLeftSideFaultCountWithCloudRecord:v4];
  }
  if ([(HMDeviceDiagnosticRecord *)self hasMeasurementChangedForSide:@"right" withRecord:v4])
  {
    [(HMDeviceDiagnosticRecord *)self _updateRightSideFaultCountWithCloudRecord:v4];
    BOOL v5 = 1;
  }
  char v6 = [v4 diagnosticMeasurementsCount];
  self->_unsigned int diagnosticMeasurementsCount = [v6 unsignedIntValue];

  if (!v5)
  {
    if (gLogCategory_HMDeviceDiagnosticRecord <= 30
      && (gLogCategory_HMDeviceDiagnosticRecord != -1 || _LogCategory_Initialize()))
    {
      BOOL v10 = [v4 latestDiagnosticTimestampLeft];
      id v12 = [v4 latestDiagnosticTimestampRight];
      LogPrintF();
    }
    goto LABEL_15;
  }
  unsigned int diagnosticMeasurementsCount = self->_diagnosticMeasurementsCount;
  if (diagnosticMeasurementsCount + 1 < 3) {
    unsigned int v8 = diagnosticMeasurementsCount + 1;
  }
  else {
    unsigned int v8 = 3;
  }
  self->_unsigned int diagnosticMeasurementsCount = v8;
  BOOL v9 = 1;
LABEL_16:

  return v9;
}

- (void)_updateLeftSideFaultCountWithCloudRecord:(id)a3
{
  id v4 = a3;
  id v38 = v4;
  if (self->_vceMicStatusLeft == 1)
  {
    unsigned int v5 = 0;
  }
  else
  {
    char v6 = [v4 bottomMicFaultCountLeft];
    int v7 = [v6 unsignedIntValue];

    if (v7 >= 2) {
      int v8 = 2;
    }
    else {
      int v8 = v7;
    }
    if (self->_vceMicStatusLeft == 2) {
      unsigned int v5 = v8 + 1;
    }
    else {
      unsigned int v5 = v7;
    }
  }
  self->_bottomMicFaultCountLeft = v5;
  if (self->_refMicStatusLeft == 1)
  {
    unsigned int v9 = 0;
  }
  else
  {
    BOOL v10 = [v38 topMicFaultCountLeft];
    int v11 = [v10 unsignedIntValue];

    if (v11 >= 2) {
      int v12 = 2;
    }
    else {
      int v12 = v11;
    }
    if (self->_refMicStatusLeft == 2) {
      unsigned int v9 = v12 + 1;
    }
    else {
      unsigned int v9 = v11;
    }
  }
  self->_topMicFaultCountLeft = v9;
  if (self->_errMicStatusLeft == 1)
  {
    unsigned int v13 = 0;
  }
  else
  {
    uint64_t v14 = [v38 innerMicFaultCountLeft];
    int v15 = [v14 unsignedIntValue];

    if (v15 >= 2) {
      int v16 = 2;
    }
    else {
      int v16 = v15;
    }
    if (self->_errMicStatusLeft == 2) {
      unsigned int v13 = v16 + 1;
    }
    else {
      unsigned int v13 = v15;
    }
  }
  self->_innerMicFaultCountLeft = v13;
  if (self->_speakerStatusLeft == 1)
  {
    unsigned int v17 = 0;
  }
  else
  {
    v18 = [v38 speakerFaultCountLeft];
    int v19 = [v18 unsignedIntValue];

    if (v19 >= 2) {
      int v20 = 2;
    }
    else {
      int v20 = v19;
    }
    if (self->_speakerStatusLeft == 2) {
      unsigned int v17 = v20 + 1;
    }
    else {
      unsigned int v17 = v19;
    }
  }
  self->_speakerFaultCountLeft = v17;
  if (self->_frontVentStatusLeft == 1)
  {
    unsigned int v21 = 0;
  }
  else
  {
    v22 = [v38 frontVentFaultCountLeft];
    int v23 = [v22 unsignedIntValue];

    if (v23 >= 2) {
      int v24 = 2;
    }
    else {
      int v24 = v23;
    }
    if (self->_frontVentStatusLeft == 2) {
      unsigned int v21 = v24 + 1;
    }
    else {
      unsigned int v21 = v23;
    }
  }
  self->_frontVentFaultCountLeft = v21;
  if (self->_rearVentStatusLeft == 1)
  {
    unsigned int v25 = 0;
  }
  else
  {
    v26 = [v38 rearVentFaultCountLeft];
    int v27 = [v26 unsignedIntValue];

    if (v27 >= 2) {
      int v28 = 2;
    }
    else {
      int v28 = v27;
    }
    if (self->_rearVentStatusLeft == 2) {
      unsigned int v25 = v28 + 1;
    }
    else {
      unsigned int v25 = v27;
    }
  }
  self->_rearVentFaultCountLeft = v25;
  if (self->_totalHarmonicDistortionLeft == 1)
  {
    unsigned int v29 = 0;
  }
  else
  {
    v30 = [v38 totalHarmonicDistortionFaultCountLeft];
    int v31 = [v30 unsignedIntValue];

    if (v31 >= 2) {
      int v32 = 2;
    }
    else {
      int v32 = v31;
    }
    if (self->_totalHarmonicDistortionLeft == 2) {
      unsigned int v29 = v32 + 1;
    }
    else {
      unsigned int v29 = v31;
    }
  }
  self->_totalHarmonicDistortionFaultCountLeft = v29;
  if (self->_frequencyAccuracyLeft == 1)
  {
    unsigned int v33 = 0;
    v34 = v38;
  }
  else
  {
    id v35 = [v38 freqAccuracyFaultCountLeft];
    int v36 = [v35 unsignedIntValue];

    v34 = v38;
    if (v36 >= 2) {
      int v37 = 2;
    }
    else {
      int v37 = v36;
    }
    if (self->_frequencyAccuracyLeft == 2) {
      unsigned int v33 = v37 + 1;
    }
    else {
      unsigned int v33 = v36;
    }
  }
  self->_freqAccuracyFaultCountLeft = v33;
}

- (void)_updateRightSideFaultCountWithCloudRecord:(id)a3
{
  id v4 = a3;
  id v38 = v4;
  if (self->_vceMicStatusRight == 1)
  {
    unsigned int v5 = 0;
  }
  else
  {
    char v6 = [v4 bottomMicFaultCountRight];
    int v7 = [v6 unsignedIntValue];

    if (v7 >= 2) {
      int v8 = 2;
    }
    else {
      int v8 = v7;
    }
    if (self->_vceMicStatusRight == 2) {
      unsigned int v5 = v8 + 1;
    }
    else {
      unsigned int v5 = v7;
    }
  }
  self->_bottomMicFaultCountRight = v5;
  if (self->_refMicStatusRight == 1)
  {
    unsigned int v9 = 0;
  }
  else
  {
    BOOL v10 = [v38 topMicFaultCountRight];
    int v11 = [v10 unsignedIntValue];

    if (v11 >= 2) {
      int v12 = 2;
    }
    else {
      int v12 = v11;
    }
    if (self->_refMicStatusRight == 2) {
      unsigned int v9 = v12 + 1;
    }
    else {
      unsigned int v9 = v11;
    }
  }
  self->_topMicFaultCountRight = v9;
  if (self->_errMicStatusRight == 1)
  {
    unsigned int v13 = 0;
  }
  else
  {
    uint64_t v14 = [v38 innerMicFaultCountRight];
    int v15 = [v14 unsignedIntValue];

    if (v15 >= 2) {
      int v16 = 2;
    }
    else {
      int v16 = v15;
    }
    if (self->_errMicStatusRight == 2) {
      unsigned int v13 = v16 + 1;
    }
    else {
      unsigned int v13 = v15;
    }
  }
  self->_innerMicFaultCountRight = v13;
  if (self->_speakerStatusRight == 1)
  {
    unsigned int v17 = 0;
  }
  else
  {
    v18 = [v38 speakerFaultCountRight];
    int v19 = [v18 unsignedIntValue];

    if (v19 >= 2) {
      int v20 = 2;
    }
    else {
      int v20 = v19;
    }
    if (self->_speakerStatusRight == 2) {
      unsigned int v17 = v20 + 1;
    }
    else {
      unsigned int v17 = v19;
    }
  }
  self->_speakerFaultCountRight = v17;
  if (self->_frontVentStatusRight == 1)
  {
    unsigned int v21 = 0;
  }
  else
  {
    v22 = [v38 frontVentFaultCountRight];
    int v23 = [v22 unsignedIntValue];

    if (v23 >= 2) {
      int v24 = 2;
    }
    else {
      int v24 = v23;
    }
    if (self->_frontVentStatusRight == 2) {
      unsigned int v21 = v24 + 1;
    }
    else {
      unsigned int v21 = v23;
    }
  }
  self->_frontVentFaultCountRight = v21;
  if (self->_rearVentStatusRight == 1)
  {
    unsigned int v25 = 0;
  }
  else
  {
    v26 = [v38 rearVentFaultCountRight];
    int v27 = [v26 unsignedIntValue];

    if (v27 >= 2) {
      int v28 = 2;
    }
    else {
      int v28 = v27;
    }
    if (self->_rearVentStatusRight == 2) {
      unsigned int v25 = v28 + 1;
    }
    else {
      unsigned int v25 = v27;
    }
  }
  self->_rearVentFaultCountRight = v25;
  if (self->_totalHarmonicDistortionRight == 1)
  {
    unsigned int v29 = 0;
  }
  else
  {
    v30 = [v38 totalHarmonicDistortionFaultCountRight];
    int v31 = [v30 unsignedIntValue];

    if (v31 >= 2) {
      int v32 = 2;
    }
    else {
      int v32 = v31;
    }
    if (self->_totalHarmonicDistortionRight == 2) {
      unsigned int v29 = v32 + 1;
    }
    else {
      unsigned int v29 = v31;
    }
  }
  self->_totalHarmonicDistortionFaultCountRight = v29;
  if (self->_frequencyAccuracyRight == 1)
  {
    unsigned int v33 = 0;
    v34 = v38;
  }
  else
  {
    id v35 = [v38 freqAccuracyFaultCountRight];
    int v36 = [v35 unsignedIntValue];

    v34 = v38;
    if (v36 >= 2) {
      int v37 = 2;
    }
    else {
      int v37 = v36;
    }
    if (self->_frequencyAccuracyRight == 2) {
      unsigned int v33 = v37 + 1;
    }
    else {
      unsigned int v33 = v36;
    }
  }
  self->_freqAccuracyFaultCountRight = v33;
}

- (void)updateWithANCLossScores:(id)a3
{
  if ([(HMDeviceDiagnosticRecord *)self _isANCScoreSupported])
  {
    if ([(HMDeviceDiagnosticRecord *)self _hasValidMeasurementForSide:@"left"])
    {
      unsigned int v5 = [NSNumber numberWithUnsignedChar:a3.var4];
      ancCleanLossScoreLeft = self->_ancCleanLossScoreLeft;
      self->_ancCleanLossScoreLeft = v5;

      int v7 = [NSNumber numberWithUnsignedChar:a3.var2];
      ancFullLossScoreLeft = self->_ancFullLossScoreLeft;
      self->_ancFullLossScoreLeft = v7;

      unsigned int v9 = [NSNumber numberWithUnsignedChar:a3.var6];
      ancSevereLossScoreLeft = self->_ancSevereLossScoreLeft;
      self->_ancSevereLossScoreLeft = v9;
    }
    if ([(HMDeviceDiagnosticRecord *)self _hasValidMeasurementForSide:@"right"])
    {
      int v11 = [NSNumber numberWithUnsignedChar:a3.var5];
      ancCleanLossScoreRight = self->_ancCleanLossScoreRight;
      self->_ancCleanLossScoreRight = v11;

      unsigned int v13 = [NSNumber numberWithUnsignedChar:a3.var3];
      ancFullLossScoreRight = self->_ancFullLossScoreRight;
      self->_ancFullLossScoreRight = v13;

      self->_ancSevereLossScoreRight = [NSNumber numberWithUnsignedChar:HIBYTE(*(unint64_t *)&a3)];
      MEMORY[0x270F9A758]();
    }
  }
}

- (void)updateWithDiagnosticData:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (v4 && [v4 length])
  {
    unsigned __int8 v8 = 0;
    [v5 getBytes:&v8 length:1];
    char v6 = [NSNumber numberWithUnsignedChar:v8];
    version = self->_version;
    self->_version = v6;

    if (v8 == 2)
    {
      [(HMDeviceDiagnosticRecord *)self updateWithMeasurementDataLegacyVersion:v5];
    }
    else if (v8 >= 3u)
    {
      [(HMDeviceDiagnosticRecord *)self updateWithMeasurementData:v5];
    }
  }
  else if (gLogCategory_HMDeviceDiagnosticRecord <= 90 {
         && (gLogCategory_HMDeviceDiagnosticRecord != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)updateWithMeasurementDataLegacyVersion:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 length] > 0x18)
  {
    memset(v13, 0, sizeof(v13));
    char v14 = 0;
    [v4 getBytes:v13 length:25];
    unsigned int v5 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)((char *)v13 + 1)];
    daysSinceLastMeasurementLeft = self->_daysSinceLastMeasurementLeft;
    self->_daysSinceLastMeasurementLeft = v5;

    int v7 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)((char *)v13 + 3)];
    daysSinceLastMeasurementRight = self->_daysSinceLastMeasurementRight;
    self->_daysSinceLastMeasurementRight = v7;

    unsigned int v9 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)((char *)&v13[1] + 5)];
    daysSinceLastHarmonicMeasurementLeft = self->_daysSinceLastHarmonicMeasurementLeft;
    self->_daysSinceLastHarmonicMeasurementLeft = v9;

    int v11 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)((char *)&v13[1] + 7)];
    daysSinceLastHarmonicMeasurementRight = self->_daysSinceLastHarmonicMeasurementRight;
    self->_daysSinceLastHarmonicMeasurementRight = v11;

    [(HMDeviceDiagnosticRecord *)self updateWithMeasurementResultLeft:*(unsigned int *)((char *)v13 + 5)];
    [(HMDeviceDiagnosticRecord *)self updateWithMeasurementResultRight:*(unsigned int *)((char *)&v13[1] + 1)];
  }
  else if (gLogCategory_HMDeviceDiagnosticRecord <= 90 {
         && (gLogCategory_HMDeviceDiagnosticRecord != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)updateWithMeasurementData:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 length];
  if (v5 >= [(HMDeviceDiagnosticRecord *)self _getMinimumRequiredPayloadLength])
  {
    memset(v14, 0, 57);
    [v4 getBytes:v14 length:57];
    if (*(void *)((char *)v14 + 1))
    {
      char v6 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)*(unint64_t *)((char *)v14 + 1)];
      lastMeasurementTimestampLeft = self->_lastMeasurementTimestampLeft;
      self->_lastMeasurementTimestampLeft = v6;
    }
    if (*(void *)((char *)v14 + 9))
    {
      unsigned __int8 v8 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)*(unint64_t *)((char *)v14 + 9)];
      lastMeasurementTimestampRight = self->_lastMeasurementTimestampRight;
      self->_lastMeasurementTimestampRight = v8;
    }
    [(HMDeviceDiagnosticRecord *)self updateWithMeasurementResultLeft:*(unsigned int *)((char *)&v14[1] + 1)];
    [(HMDeviceDiagnosticRecord *)self updateWithMeasurementResultRight:*(unsigned int *)((char *)&v14[1] + 5)];
    if ([(HMDeviceDiagnosticRecord *)self _isANCScoreSupported]) {
      [(HMDeviceDiagnosticRecord *)self updateWithANCLossScores:*(void *)((char *)&v14[1] + 9)];
    }
    if ([(HMDeviceDiagnosticRecord *)self _isFirstTimeOfUseSupported])
    {
      if (*(_DWORD *)((char *)&v14[2] + 1))
      {
        BOOL v10 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)*(unsigned int *)((char *)&v14[2] + 1)];
        firstTimeUseTimestampLeft = self->_firstTimeUseTimestampLeft;
        self->_firstTimeUseTimestampLeft = v10;
      }
      if (*(_DWORD *)((char *)&v14[2] + 5))
      {
        int v12 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)*(unsigned int *)((char *)&v14[2] + 5)];
        firstTimeUseTimestampRight = self->_firstTimeUseTimestampRight;
        self->_firstTimeUseTimestampRight = v12;
      }
    }
  }
  else if (gLogCategory_HMDeviceDiagnosticRecord <= 90 {
         && (gLogCategory_HMDeviceDiagnosticRecord != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)updateWithMeasurementResultLeft:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (gLogCategory_HMDeviceDiagnosticRecord <= 30
    && (gLogCategory_HMDeviceDiagnosticRecord != -1 || _LogCategory_Initialize()))
  {
    bluetoothUUID = self->_bluetoothUUID;
    uint64_t v7 = v3;
    LogPrintF();
  }
  self->_int generalSystemStatusLeft = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:](HMDeviceDiagnosticRecord, "getHMDiagnosticStatusForValue:", v3 & 7, bluetoothUUID, v7);
  self->_uint64_t latestMeasurementResultLeft = +[HMDeviceDiagnosticRecord getHMDiagnosticMeasurementStatusForValue:(v3 >> 3) & 7];
  if ([(HMDeviceDiagnosticRecord *)self _hasValidMeasurementForSide:@"left"])
  {
    if ([(HMDeviceDiagnosticRecord *)self _isComponentDiagnosticSupported])
    {
      self->_uint64_t totalHarmonicDistortionLeft = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:(v3 >> 7) & 1];
      self->_uint64_t frequencyAccuracyLeft = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:(v3 >> 8) & 1];
      self->_uint64_t speakerStatusLeft = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:(v3 >> 9) & 1];
      self->_uint64_t rearVentStatusLeft = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:(v3 >> 10) & 1];
      self->_uint64_t frontVentStatusLeft = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:(v3 >> 11) & 1];
      self->_uint64_t vceMicStatusLeft = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:(v3 >> 12) & 1];
      self->_uint64_t refMicStatusLeft = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:(v3 >> 13) & 1];
      self->_uint64_t errMicStatusLeft = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:(v3 >> 14) & 1];
    }
    if ([(HMDeviceDiagnosticRecord *)self _isANCScoreSupported])
    {
      int generalSystemStatusLeft = self->_generalSystemStatusLeft;
      if (generalSystemStatusLeft != 1)
      {
        if (generalSystemStatusLeft != 2) {
          return;
        }
        if ((v3 & 0x8000) != 0) {
          int generalSystemStatusLeft = 3;
        }
      }
      self->_uint64_t ancLossTypeLeft = generalSystemStatusLeft;
    }
  }
}

- (void)updateWithMeasurementResultRight:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (gLogCategory_HMDeviceDiagnosticRecord <= 30
    && (gLogCategory_HMDeviceDiagnosticRecord != -1 || _LogCategory_Initialize()))
  {
    bluetoothUUID = self->_bluetoothUUID;
    uint64_t v7 = v3;
    LogPrintF();
  }
  self->_int generalSystemStatusRight = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:](HMDeviceDiagnosticRecord, "getHMDiagnosticStatusForValue:", v3 & 7, bluetoothUUID, v7);
  self->_uint64_t latestMeasurementResultRight = +[HMDeviceDiagnosticRecord getHMDiagnosticMeasurementStatusForValue:(v3 >> 3) & 7];
  if ([(HMDeviceDiagnosticRecord *)self _hasValidMeasurementForSide:@"right"])
  {
    if ([(HMDeviceDiagnosticRecord *)self _isComponentDiagnosticSupported])
    {
      self->_uint64_t totalHarmonicDistortionRight = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:(v3 >> 7) & 1];
      self->_uint64_t frequencyAccuracyRight = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:(v3 >> 8) & 1];
      self->_uint64_t speakerStatusRight = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:(v3 >> 9) & 1];
      self->_uint64_t rearVentStatusRight = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:(v3 >> 10) & 1];
      self->_uint64_t frontVentStatusRight = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:(v3 >> 11) & 1];
      self->_uint64_t vceMicStatusRight = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:(v3 >> 12) & 1];
      self->_uint64_t refMicStatusRight = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:(v3 >> 13) & 1];
      self->_uint64_t errMicStatusRight = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:(v3 >> 14) & 1];
    }
    if ([(HMDeviceDiagnosticRecord *)self _isANCScoreSupported])
    {
      int generalSystemStatusRight = self->_generalSystemStatusRight;
      if (generalSystemStatusRight != 1)
      {
        if (generalSystemStatusRight != 2) {
          return;
        }
        if ((v3 & 0x8000) != 0) {
          int generalSystemStatusRight = 3;
        }
      }
      self->_uint64_t ancLossTypeRight = generalSystemStatusRight;
    }
  }
}

- (int)computeOcclusionResultForHearingTest
{
  unsigned int diagnosticMeasurementsCount = self->_diagnosticMeasurementsCount;
  if (!diagnosticMeasurementsCount) {
    return 0;
  }
  if (diagnosticMeasurementsCount < 3) {
    unsigned int v3 = 1;
  }
  else {
    unsigned int v3 = 3;
  }
  BOOL v4 = self->_innerMicFaultCountLeft >= v3 || self->_innerMicFaultCountRight >= v3;
  BOOL v5 = self->_speakerFaultCountLeft >= v3 || self->_speakerFaultCountRight >= v3;
  BOOL v6 = self->_frontVentFaultCountLeft >= v3 || self->_frontVentFaultCountRight >= v3;
  BOOL v7 = self->_totalHarmonicDistortionFaultCountLeft >= v3 || self->_totalHarmonicDistortionFaultCountRight >= v3;
  BOOL v8 = self->_freqAccuracyFaultCountLeft >= v3 || self->_freqAccuracyFaultCountRight >= v3;
  if (v4
    || v5
    || v6
    || v7
    || v8
    || (*(int32x2_t *)v9.i8 = vrev64_s32(*(int32x2_t *)&self->_topMicFaultCountLeft),
        v9.i64[1] = *(void *)&self->_bottomMicFaultCountLeft,
        (vmaxv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)vdupq_n_s32(v3), v9)), 0xFuLL))) & 1) == 0))
  {
    if (diagnosticMeasurementsCount >= 3)
    {
      if (self->_htCleaningAlertCount)
      {
        if (gLogCategory_HMDeviceDiagnosticRecord <= 30
          && (gLogCategory_HMDeviceDiagnosticRecord != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        return 7;
      }
      else
      {
        return 2;
      }
    }
    else
    {
      return 1;
    }
  }
  else
  {
    unsigned int rearVentFaultCountLeft = self->_rearVentFaultCountLeft;
    unsigned int rearVentFaultCountRight = self->_rearVentFaultCountRight;
    if (rearVentFaultCountLeft < v3 || rearVentFaultCountRight < v3)
    {
      if (rearVentFaultCountRight >= v3) {
        int v13 = 5;
      }
      else {
        int v13 = 3;
      }
      if (rearVentFaultCountLeft >= v3) {
        return 4;
      }
      else {
        return v13;
      }
    }
    else
    {
      return 6;
    }
  }
}

- (int)computeOcclusionResultForHearingProtection
{
  unsigned int diagnosticMeasurementsCount = self->_diagnosticMeasurementsCount;
  if (!diagnosticMeasurementsCount) {
    return 0;
  }
  if (diagnosticMeasurementsCount < 3) {
    unsigned int v3 = 1;
  }
  else {
    unsigned int v3 = 3;
  }
  BOOL v4 = self->_innerMicFaultCountLeft >= v3 || self->_innerMicFaultCountRight >= v3;
  BOOL v5 = self->_speakerFaultCountLeft >= v3 || self->_speakerFaultCountRight >= v3;
  BOOL v6 = 1;
  if (self->_frontVentFaultCountLeft < v3) {
    BOOL v6 = self->_frontVentFaultCountRight >= v3;
  }
  if (diagnosticMeasurementsCount < 3) {
    int v7 = 1;
  }
  else {
    int v7 = 2;
  }
  if (v4 || v5 || v6) {
    return v7;
  }
  else {
    return 3;
  }
}

- (id)getOnDemandRetestReason
{
  uint64_t diagnosticMeasurementsCount = self->_diagnosticMeasurementsCount;
  if (diagnosticMeasurementsCount <= 2)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Insufficient Results: %d", diagnosticMeasurementsCount);
    int v19 = LABEL_35:;
    goto LABEL_36;
  }
  uint64_t bottomMicFaultCountLeft = self->_bottomMicFaultCountLeft;
  if ((bottomMicFaultCountLeft - 1) <= 1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Left Bottom Mic Fault with count: %d", bottomMicFaultCountLeft);
    goto LABEL_35;
  }
  uint64_t bottomMicFaultCountRight = self->_bottomMicFaultCountRight;
  if ((bottomMicFaultCountRight - 1) <= 1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Right Bottom Mic Fault with count: %d", bottomMicFaultCountRight);
    goto LABEL_35;
  }
  uint64_t topMicFaultCountLeft = self->_topMicFaultCountLeft;
  if ((topMicFaultCountLeft - 1) <= 1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Left Top Mic Fault with count: %d", topMicFaultCountLeft);
    goto LABEL_35;
  }
  uint64_t topMicFaultCountRight = self->_topMicFaultCountRight;
  if ((topMicFaultCountRight - 1) <= 1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Right Top Mic Fault with count: %d", topMicFaultCountRight);
    goto LABEL_35;
  }
  uint64_t innerMicFaultCountLeft = self->_innerMicFaultCountLeft;
  if ((innerMicFaultCountLeft - 1) <= 1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Left Inner Mic Fault with count: %d", innerMicFaultCountLeft);
    goto LABEL_35;
  }
  uint64_t innerMicFaultCountRight = self->_innerMicFaultCountRight;
  if ((innerMicFaultCountRight - 1) <= 1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Right Inner Mic Fault with count: %d", innerMicFaultCountRight);
    goto LABEL_35;
  }
  uint64_t speakerFaultCountLeft = self->_speakerFaultCountLeft;
  if ((speakerFaultCountLeft - 1) <= 1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Left Speaker Fault with count: %d", speakerFaultCountLeft);
    goto LABEL_35;
  }
  uint64_t speakerFaultCountRight = self->_speakerFaultCountRight;
  if ((speakerFaultCountRight - 1) <= 1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Right Speaker Fault with count: %d", speakerFaultCountRight);
    goto LABEL_35;
  }
  uint64_t frontVentFaultCountLeft = self->_frontVentFaultCountLeft;
  if ((frontVentFaultCountLeft - 1) <= 1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Left Front Vent Fault with count: %d", frontVentFaultCountLeft);
    goto LABEL_35;
  }
  uint64_t frontVentFaultCountRight = self->_frontVentFaultCountRight;
  if ((frontVentFaultCountRight - 1) <= 1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Right Front Vent Fault with count: %d", frontVentFaultCountRight);
    goto LABEL_35;
  }
  uint64_t rearVentFaultCountLeft = self->_rearVentFaultCountLeft;
  if ((rearVentFaultCountLeft - 1) <= 1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Left Rear Vent Fault with count: %d", rearVentFaultCountLeft);
    goto LABEL_35;
  }
  uint64_t rearVentFaultCountRight = self->_rearVentFaultCountRight;
  if ((rearVentFaultCountRight - 1) <= 1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Right Rear Vent Fault with count: %d", rearVentFaultCountRight);
    goto LABEL_35;
  }
  uint64_t totalHarmonicDistortionFaultCountLeft = self->_totalHarmonicDistortionFaultCountLeft;
  if ((totalHarmonicDistortionFaultCountLeft - 1) <= 1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Left THD Fault with count: %d", totalHarmonicDistortionFaultCountLeft);
    goto LABEL_35;
  }
  uint64_t totalHarmonicDistortionFaultCountRight = self->_totalHarmonicDistortionFaultCountRight;
  if ((totalHarmonicDistortionFaultCountRight - 1) <= 1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Right THD Fault with count: %d", totalHarmonicDistortionFaultCountRight);
    goto LABEL_35;
  }
  uint64_t freqAccuracyFaultCountLeft = self->_freqAccuracyFaultCountLeft;
  if ((freqAccuracyFaultCountLeft - 1) <= 1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Left freq Acc Fault with count: %d", freqAccuracyFaultCountLeft);
    goto LABEL_35;
  }
  uint64_t freqAccuracyFaultCountRight = self->_freqAccuracyFaultCountRight;
  if ((freqAccuracyFaultCountRight - 1) <= 1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Right freq Acc with count: %d", freqAccuracyFaultCountRight);
    goto LABEL_35;
  }
  int v19 = 0;
LABEL_36:
  return v19;
}

- (BOOL)hasMeasurementChangedForSide:(id)a3 withRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  version = self->_version;
  if (!version || [(NSNumber *)version intValue] > 2)
  {
    BOOL v10 = (__CFString *)v6;
    int v11 = (NSDate *)v10;
    if (v10 == @"left") {
      goto LABEL_8;
    }
    if (!v10) {
      goto LABEL_22;
    }
    int v12 = [(__CFString *)v10 isEqual:@"left"];

    if (v12)
    {
LABEL_8:
      lastMeasurementTimestampLeft = self->_lastMeasurementTimestampLeft;
      char v14 = [v7 latestDiagnosticTimestampLeft];
      int v15 = lastMeasurementTimestampLeft;
      int v16 = v14;
      if (v15 == v16)
      {
      }
      else
      {
        unsigned int v17 = v16;
        if ((v15 == 0) == (v16 != 0))
        {

          goto LABEL_25;
        }
        char v18 = [(NSDate *)v15 isEqual:v16];

        if ((v18 & 1) == 0) {
          goto LABEL_25;
        }
      }
    }
    int v19 = v11;
    if (v19 != @"right")
    {
      int v11 = (NSDate *)v19;
      if (!v19) {
        goto LABEL_22;
      }
      int v20 = [(__CFString *)v19 isEqual:@"right"];

      if (!v20) {
        goto LABEL_23;
      }
    }
    lastMeasurementTimestampRight = self->_lastMeasurementTimestampRight;
    v22 = [v7 latestDiagnosticTimestampRight];
    int v11 = lastMeasurementTimestampRight;
    int v23 = v22;
    if (v11 != v23)
    {
      int v24 = v23;
      if ((v11 == 0) != (v23 != 0))
      {
        char v25 = [(NSDate *)v11 isEqual:v23];

        if ((v25 & 1) == 0) {
          goto LABEL_25;
        }
        goto LABEL_23;
      }

LABEL_25:
      BOOL v26 = 1;
      goto LABEL_26;
    }

LABEL_22:
    goto LABEL_23;
  }
  uint32x4_t v9 = [v7 diagnosticMeasurementsCount];

  if (!v9) {
    goto LABEL_25;
  }
LABEL_23:
  BOOL v26 = 0;
LABEL_26:

  return v26;
}

- (BOOL)isDeviceUsedFor3MonthsOrLess
{
  BOOL v3 = [(HMDeviceDiagnosticRecord *)self _isDate:self->_firstTimeUseTimestampLeft lesserThanOrEqualToMonths:3];
  if (v3)
  {
    firstTimeUseTimestampRight = self->_firstTimeUseTimestampRight;
    LOBYTE(v3) = [(HMDeviceDiagnosticRecord *)self _isDate:firstTimeUseTimestampRight lesserThanOrEqualToMonths:3];
  }
  return v3;
}

- (BOOL)isOcclusionDetectionSupported
{
  return ((self->_productID - 8212) & 0xFFFFFFEF) == 0;
}

- (id)measurementInvalidReason
{
  int generalSystemStatusLeft = self->_generalSystemStatusLeft;
  if (generalSystemStatusLeft == 4) {
    return @"no UTP connection";
  }
  int generalSystemStatusRight = self->_generalSystemStatusRight;
  if (generalSystemStatusRight == 4) {
    return @"no UTP connection";
  }
  if (generalSystemStatusLeft == 5 || generalSystemStatusRight == 5) {
    return @"no data + >1 year out of factory";
  }
  if ([(NSNumber *)self->_version intValue] > 2)
  {
    if (self->_lastMeasurementTimestampLeft && self->_lastMeasurementTimestampRight)
    {
      if (-[HMDeviceDiagnosticRecord _isDate:lesserThanOrEqualToMonths:](self, "_isDate:lesserThanOrEqualToMonths:"))
      {
        if ([(HMDeviceDiagnosticRecord *)self _isDate:self->_lastMeasurementTimestampRight lesserThanOrEqualToMonths:12])
        {
          return 0;
        }
        else
        {
          return @"right measurement older than 1 year";
        }
      }
      else
      {
        return @"left measurement older than 1 year";
      }
    }
    else
    {
      return @"missing measurement timestamp";
    }
  }
  else
  {
    daysSinceLastMeasurementLeft = self->_daysSinceLastMeasurementLeft;
    if (daysSinceLastMeasurementLeft && self->_daysSinceLastMeasurementRight)
    {
      if ([(NSNumber *)daysSinceLastMeasurementLeft intValue] <= 365
        && [(NSNumber *)self->_daysSinceLastMeasurementRight intValue] < 366)
      {
        return 0;
      }
      else
      {
        return @"measurement older than 1 year";
      }
    }
    else
    {
      return @"missing days since last measurement";
    }
  }
}

- (void)occlusionIndicationShownForFeatureID:(int)a3 type:(int)a4 action:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  if (gLogCategory_HMDeviceDiagnosticRecord <= 30
    && (gLogCategory_HMDeviceDiagnosticRecord != -1 || _LogCategory_Initialize()))
  {
    if (v6 > 8) {
      uint32x4_t v9 = "?";
    }
    else {
      uint32x4_t v9 = off_2653611C0[(int)v6];
    }
    if (a3 > 3) {
      BOOL v10 = "?";
    }
    else {
      BOOL v10 = off_265361208[a3];
    }
    if (v5 > 4) {
      int v11 = "?";
    }
    else {
      int v11 = off_265361228[(int)v5];
    }
    BOOL v26 = v10;
    int v27 = v11;
    bluetoothUUID = self->_bluetoothUUID;
    char v25 = v9;
    LogPrintF();
  }
  if (a3 == 3)
  {
    if ((v6 - 3) <= 1)
    {
      uint64_t htCleaningAlertCount = self->_htCleaningAlertCount;
      if ((htCleaningAlertCount + 1) < 0xFFFFFFFE) {
        unsigned int v16 = htCleaningAlertCount + 1;
      }
      else {
        unsigned int v16 = -2;
      }
      self->_uint64_t htCleaningAlertCount = v16;
      p_htCleaningAlertFirstTimestamp = &self->_htCleaningAlertFirstTimestamp;
      htCleaningAlertFirstTimestamp = self->_htCleaningAlertFirstTimestamp;
      goto LABEL_28;
    }
    if (v6 == 5)
    {
      uint64_t htCleaningAlertCount = self->_htCleaningAlertCount;
      int64_t v17 = [(HMDeviceDiagnosticRecord *)self _minutesSinceTimestamp:self->_htCleaningAlertFirstTimestamp];
      int v20 = self;
      uint64_t v21 = 3;
      uint64_t v22 = 3;
      goto LABEL_44;
    }
LABEL_45:
    uint64_t htCleaningAlertCount = 0;
    int64_t v17 = 0;
    goto LABEL_46;
  }
  if (a3 != 2) {
    return;
  }
  if (v6 == 1 && !v5)
  {
    uint64_t htCleaningAlertCount = self->_hpActiveNotificationCount;
    if ((htCleaningAlertCount + 1) < 0xFFFFFFFE) {
      unsigned int v13 = htCleaningAlertCount + 1;
    }
    else {
      unsigned int v13 = -2;
    }
    self->_hpActiveNotificationCount = v13;
    p_htCleaningAlertFirstTimestamp = &self->_hpActiveNotificationFirstTimestamp;
    htCleaningAlertFirstTimestamp = self->_hpActiveNotificationFirstTimestamp;
LABEL_28:
    int64_t v17 = -[HMDeviceDiagnosticRecord _minutesSinceTimestamp:](self, "_minutesSinceTimestamp:", htCleaningAlertFirstTimestamp, bluetoothUUID, v25, v26, v27);
    if (!*p_htCleaningAlertFirstTimestamp)
    {
      uint64_t v18 = [MEMORY[0x263EFF910] now];
      int v19 = *p_htCleaningAlertFirstTimestamp;
      *p_htCleaningAlertFirstTimestamp = (NSDate *)v18;
    }
    [(HMDeviceDiagnosticRecord *)self _prefsSaveOcclusionStats];
    goto LABEL_46;
  }
  if (v6 != 2)
  {
    if (v6 == 7 && !v5)
    {
      uint64_t htCleaningAlertCount = self->_hpPlacardCount;
      if ((htCleaningAlertCount + 1) < 0xFFFFFFFE) {
        unsigned int v23 = htCleaningAlertCount + 1;
      }
      else {
        unsigned int v23 = -2;
      }
      self->_hpPlacardCount = v23;
      p_htCleaningAlertFirstTimestamp = &self->_hpPlacardFirstTimestamp;
      htCleaningAlertFirstTimestamp = self->_hpPlacardFirstTimestamp;
      goto LABEL_28;
    }
    if (v6 == 8)
    {
      uint64_t htCleaningAlertCount = self->_hpPlacardCount;
      int64_t v17 = [(HMDeviceDiagnosticRecord *)self _minutesSinceTimestamp:self->_hpPlacardFirstTimestamp];
      int v20 = self;
      uint64_t v21 = 2;
      uint64_t v22 = 7;
      goto LABEL_44;
    }
    goto LABEL_45;
  }
  uint64_t htCleaningAlertCount = self->_hpActiveNotificationCount;
  int64_t v17 = [(HMDeviceDiagnosticRecord *)self _minutesSinceTimestamp:self->_hpActiveNotificationFirstTimestamp];
  int v20 = self;
  uint64_t v21 = 2;
  uint64_t v22 = 1;
LABEL_44:
  -[HMDeviceDiagnosticRecord _prefsResetOcclusionStatsForFeatureID:type:](v20, "_prefsResetOcclusionStatsForFeatureID:type:", v21, v22, bluetoothUUID, v25, v26, v27);
LABEL_46:
  [(HMDeviceDiagnosticRecord *)self _submitMetricsForOcclusionIndicationType:v6 action:v5 previousIndicationCount:htCleaningAlertCount timeSinceFirstIndicationMins:v17];
}

- (void)_prefsLoadOcclusionStats
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  CFArrayGetTypeID();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v3 = (id)CFPrefs_CopyTypedValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    id v23 = v3;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          CFStringGetTypeID();
          BOOL v8 = CFDictionaryGetTypedValue();
          bluetoothAddress = self->_bluetoothAddress;
          BOOL v10 = v8;
          int v11 = bluetoothAddress;
          if (v10 != v11)
          {
            int v12 = v11;
            if ((v10 == 0) == (v11 != 0))
            {
              char v14 = v10;
            }
            else
            {
              int v13 = [(NSString *)v10 isEqual:v11];

              if (!v13) {
                goto LABEL_25;
              }
LABEL_12:
              self->_hpActiveNotificationCount = CFDictionaryGetInt64Ranged();
              self->_hpPlacardCount = CFDictionaryGetInt64Ranged();
              self->_uint64_t htCleaningAlertCount = CFDictionaryGetInt64Ranged();
              char v14 = (NSString *)objc_alloc_init(MEMORY[0x263F08790]);
              [(NSString *)v14 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
              CFStringGetTypeID();
              int v12 = CFDictionaryGetTypedValue();
              if (v12)
              {
                int v15 = [(NSString *)v14 dateFromString:v12];
                hpActiveNotificationFirstTimestamp = self->_hpActiveNotificationFirstTimestamp;
                self->_hpActiveNotificationFirstTimestamp = v15;
              }
              CFStringGetTypeID();
              int64_t v17 = CFDictionaryGetTypedValue();
              if (v17)
              {
                uint64_t v18 = [(NSString *)v14 dateFromString:v17];
                hpPlacardFirstTimestamp = self->_hpPlacardFirstTimestamp;
                self->_hpPlacardFirstTimestamp = v18;
              }
              CFStringGetTypeID();
              int v20 = CFDictionaryGetTypedValue();
              if (v20)
              {
                uint64_t v21 = [(NSString *)v14 dateFromString:v20];
                htCleaningAlertFirstTimestamp = self->_htCleaningAlertFirstTimestamp;
                self->_htCleaningAlertFirstTimestamp = v21;
              }
              if (gLogCategory_HMDeviceDiagnosticRecord <= 30
                && (gLogCategory_HMDeviceDiagnosticRecord != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }

              id v3 = v23;
            }

LABEL_25:
            continue;
          }

          goto LABEL_12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v5);
  }
}

- (void)_prefsResetOcclusionStatsForFeatureID:(int)a3 type:(int)a4
{
  if (a3 == 2 && a4 == 1)
  {
    p_hpActiveNotificationFirstTimestamp = &self->_hpActiveNotificationFirstTimestamp;
    hpActiveNotificationFirstTimestamp = self->_hpActiveNotificationFirstTimestamp;
    if (!hpActiveNotificationFirstTimestamp && !self->_hpActiveNotificationCount) {
      return;
    }
    uint64_t v7 = 20;
  }
  else if (a3 == 2 && a4 == 7)
  {
    p_hpActiveNotificationFirstTimestamp = &self->_hpPlacardFirstTimestamp;
    hpActiveNotificationFirstTimestamp = self->_hpPlacardFirstTimestamp;
    if (!hpActiveNotificationFirstTimestamp && !self->_hpPlacardCount) {
      return;
    }
    uint64_t v7 = 32;
  }
  else
  {
    if (a3 != 3) {
      return;
    }
    if (a4 != 3) {
      return;
    }
    p_hpActiveNotificationFirstTimestamp = &self->_htCleaningAlertFirstTimestamp;
    hpActiveNotificationFirstTimestamp = self->_htCleaningAlertFirstTimestamp;
    if (!hpActiveNotificationFirstTimestamp && !self->_htCleaningAlertCount) {
      return;
    }
    uint64_t v7 = 48;
  }
  *p_hpActiveNotificationFirstTimestamp = 0;

  *(_DWORD *)((char *)&self->super.isa + v7) = 0;
  [(HMDeviceDiagnosticRecord *)self _prefsSaveOcclusionStats];
  if (gLogCategory_HMDeviceDiagnosticRecord <= 30
    && (gLogCategory_HMDeviceDiagnosticRecord != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_prefsSaveOcclusionStats
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  CFArrayGetTypeID();
  v2 = (void *)CFPrefs_CopyTypedValue();
  id v3 = v2;
  if (v2) {
    id v4 = (id)[v2 mutableCopy];
  }
  else {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = v4;
  id v6 = (id)[v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
  uint64_t v7 = &OBJC_IVAR___HMDeviceDiagnosticRecord__daysSinceLastHarmonicMeasurementRight;
  if (!v6)
  {

    goto LABEL_27;
  }
  uint64_t v29 = v3;
  uint64_t v8 = *(void *)v32;
LABEL_6:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v32 != v8) {
      objc_enumerationMutation(v5);
    }
    BOOL v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
LABEL_16:
    if (v6 == (id)++v9)
    {
      id v6 = (id)[v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v6) {
        goto LABEL_6;
      }

      goto LABEL_25;
    }
  }
  int v11 = v5;
  CFStringGetTypeID();
  int v12 = CFDictionaryGetTypedValue();
  bluetoothAddress = self->_bluetoothAddress;
  char v14 = v12;
  int v15 = bluetoothAddress;
  if (v14 != v15)
  {
    unsigned int v16 = v15;
    if ((v14 == 0) != (v15 != 0))
    {
      char v17 = [(NSString *)v14 isEqual:v15];

      if (v17) {
        goto LABEL_20;
      }
    }
    else
    {
    }
    id v5 = v11;
    goto LABEL_16;
  }

LABEL_20:
  id v6 = v10;

  id v5 = v11;
  if (!v6)
  {
LABEL_25:
    id v3 = v29;
    uint64_t v7 = &OBJC_IVAR___HMDeviceDiagnosticRecord__daysSinceLastHarmonicMeasurementRight;
    goto LABEL_27;
  }
  [v11 removeObject:v6];
  uint64_t v7 = &OBJC_IVAR___HMDeviceDiagnosticRecord__daysSinceLastHarmonicMeasurementRight;
  id v3 = v29;
  if (gLogCategory_HMDeviceDiagnosticRecord <= 10
    && (gLogCategory_HMDeviceDiagnosticRecord != -1 || _LogCategory_Initialize()))
  {
    bluetoothUUID = self->_bluetoothUUID;
    id v28 = v6;
    LogPrintF();
  }
LABEL_27:
  id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v18 setObject:self->_bluetoothAddress forKeyedSubscript:@"address"];
  int v19 = [NSNumber numberWithUnsignedInt:self->_hpActiveNotificationCount];
  [v18 setObject:v19 forKeyedSubscript:@"HPActiveNotificationCount"];

  int v20 = [NSNumber numberWithUnsignedInt:self->_hpPlacardCount];
  [v18 setObject:v20 forKeyedSubscript:@"HPPlacardCount"];

  uint64_t v21 = [NSNumber numberWithUnsignedInt:self->_htCleaningAlertCount];
  [v18 setObject:v21 forKeyedSubscript:@"HTCleaningAlertCount"];

  id v22 = objc_alloc_init(MEMORY[0x263F08790]);
  [v22 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  if (self->_hpActiveNotificationFirstTimestamp)
  {
    id v23 = objc_msgSend(v22, "stringFromDate:");
    [v18 setObject:v23 forKeyedSubscript:@"HPActiveNotificationFirstTimestamp"];
  }
  if (self->_hpPlacardFirstTimestamp)
  {
    long long v24 = objc_msgSend(v22, "stringFromDate:");
    [v18 setObject:v24 forKeyedSubscript:@"HPPlacardFirstTimestamp"];
  }
  if (self->_htCleaningAlertFirstTimestamp)
  {
    long long v25 = objc_msgSend(v22, "stringFromDate:");
    [v18 setObject:v25 forKeyedSubscript:@"HTCleaningAlertFirstTimestamp"];
  }
  objc_msgSend(v5, "addObject:", v18, bluetoothUUID, v28);
  CFPrefs_SetValue();
  int v26 = v7[262];
  if (v26 <= 30 && (v26 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)submitMetricsForOcclusionPolicy
{
}

- (void)_submitMetricsForOcclusionIndicationType:(int)a3 action:(int)a4 previousIndicationCount:(unsigned int)a5 timeSinceFirstIndicationMins:(int64_t)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = *(void *)&a3;
  v42[27] = *MEMORY[0x263EF8340];
  v41[0] = @"DiagnosticMeasurementCount";
  uint64_t v11 = [NSNumber numberWithUnsignedInt:self->_diagnosticMeasurementsCount];
  v40 = (void *)v11;
  firmwareVersion = (__CFString *)self->_firmwareVersion;
  if (!firmwareVersion) {
    firmwareVersion = @"unknown";
  }
  v42[0] = v11;
  v42[1] = firmwareVersion;
  v41[1] = @"FirmwareVersion";
  v41[2] = @"FirstTimeOfUse";
  BOOL v13 = [(HMDeviceDiagnosticRecord *)self isDeviceUsedFor3MonthsOrLess];
  char v14 = &unk_2702111E8;
  if (v13) {
    char v14 = &unk_2702111D0;
  }
  v42[2] = v14;
  v41[3] = @"HearingProtectionOcclusionResult";
  id v39 = objc_msgSend(NSNumber, "numberWithInt:", -[HMDeviceDiagnosticRecord computeOcclusionResultForHearingProtection](self, "computeOcclusionResultForHearingProtection"));
  v42[3] = v39;
  v41[4] = @"HearingTestOcclusionResult";
  id v38 = objc_msgSend(NSNumber, "numberWithInt:", -[HMDeviceDiagnosticRecord computeOcclusionResultForHearingTest](self, "computeOcclusionResultForHearingTest"));
  v42[4] = v38;
  v41[5] = @"IndicationAction";
  int v37 = [NSNumber numberWithInt:v8];
  v42[5] = v37;
  v41[6] = @"IndicationType";
  uint64_t v36 = [NSNumber numberWithInt:v9];
  v42[6] = v36;
  v41[7] = @"LeftBottomMicFaultCount";
  id v35 = [NSNumber numberWithUnsignedInt:self->_bottomMicFaultCountLeft];
  v42[7] = v35;
  v41[8] = @"LeftFreqAccFaultCount";
  long long v34 = [NSNumber numberWithUnsignedInt:self->_freqAccuracyFaultCountLeft];
  v42[8] = v34;
  v41[9] = @"LeftFrontVentFaultCount";
  long long v33 = [NSNumber numberWithUnsignedInt:self->_frontVentFaultCountLeft];
  v42[9] = v33;
  v41[10] = @"LeftInnerMicFaultCount";
  long long v32 = [NSNumber numberWithUnsignedInt:self->_innerMicFaultCountLeft];
  v42[10] = v32;
  v41[11] = @"LeftRearVentFaultCount";
  long long v31 = [NSNumber numberWithUnsignedInt:self->_rearVentFaultCountLeft];
  v42[11] = v31;
  v41[12] = @"LeftSpeakerFaultCount";
  v30 = [NSNumber numberWithUnsignedInt:self->_speakerFaultCountLeft];
  v42[12] = v30;
  v41[13] = @"LeftTHDFaultCount";
  uint64_t v29 = [NSNumber numberWithUnsignedInt:self->_totalHarmonicDistortionFaultCountLeft];
  v42[13] = v29;
  v41[14] = @"LeftTopMicFaultCount";
  id v28 = [NSNumber numberWithUnsignedInt:self->_topMicFaultCountLeft];
  v42[14] = v28;
  v41[15] = @"previousIndicationCount";
  long long v27 = [NSNumber numberWithUnsignedInt:v7];
  v42[15] = v27;
  v41[16] = @"ProductID";
  int v26 = [NSNumber numberWithUnsignedInt:self->_productID];
  v42[16] = v26;
  v41[17] = @"RightBottomMicFaultCount";
  long long v25 = [NSNumber numberWithUnsignedInt:self->_bottomMicFaultCountRight];
  v42[17] = v25;
  v41[18] = @"RightFreqAccFaultCount";
  int v15 = [NSNumber numberWithUnsignedInt:self->_freqAccuracyFaultCountRight];
  v42[18] = v15;
  v41[19] = @"RightFrontVentFaultCount";
  unsigned int v16 = [NSNumber numberWithUnsignedInt:self->_frontVentFaultCountRight];
  v42[19] = v16;
  v41[20] = @"RightInnerMicFaultCount";
  char v17 = [NSNumber numberWithUnsignedInt:self->_innerMicFaultCountRight];
  v42[20] = v17;
  v41[21] = @"RightRearVentFaultCount";
  id v18 = [NSNumber numberWithUnsignedInt:self->_rearVentFaultCountRight];
  v42[21] = v18;
  v41[22] = @"RightSpeakerFaultCount";
  int v19 = [NSNumber numberWithUnsignedInt:self->_speakerFaultCountRight];
  v42[22] = v19;
  v41[23] = @"RightTHDFaultCount";
  int v20 = [NSNumber numberWithUnsignedInt:self->_totalHarmonicDistortionFaultCountRight];
  v42[23] = v20;
  v41[24] = @"RightTopMicFaultCount";
  uint64_t v21 = [NSNumber numberWithUnsignedInt:self->_topMicFaultCountRight];
  v42[24] = v21;
  v41[25] = @"TimeSinceFirstIndication";
  id v22 = [NSNumber numberWithInteger:a6];
  v42[25] = v22;
  v41[26] = @"TimeSinceFirstUse";
  id v23 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDeviceDiagnosticRecord _minutesSinceTimestamp:](self, "_minutesSinceTimestamp:", self->_firstTimeUseTimestampLeft));
  v42[26] = v23;
  long long v24 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:27];
  CUMetricsLog();
}

- (void)_resetAllOcclusionStats
{
  [(HMDeviceDiagnosticRecord *)self _prefsResetOcclusionStatsForFeatureID:2 type:1];
  [(HMDeviceDiagnosticRecord *)self _prefsResetOcclusionStatsForFeatureID:2 type:7];
  [(HMDeviceDiagnosticRecord *)self _prefsResetOcclusionStatsForFeatureID:3 type:3];
}

- (NSString)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (NSString)bluetoothUUID
{
  return self->_bluetoothUUID;
}

- (int)ancLossTypeLeft
{
  return self->_ancLossTypeLeft;
}

- (int)ancLossTypeRight
{
  return self->_ancLossTypeRight;
}

- (NSNumber)ancCleanLossScoreLeft
{
  return self->_ancCleanLossScoreLeft;
}

- (NSNumber)ancCleanLossScoreRight
{
  return self->_ancCleanLossScoreRight;
}

- (NSNumber)ancFullLossScoreLeft
{
  return self->_ancFullLossScoreLeft;
}

- (NSNumber)ancFullLossScoreRight
{
  return self->_ancFullLossScoreRight;
}

- (NSNumber)ancSevereLossScoreLeft
{
  return self->_ancSevereLossScoreLeft;
}

- (NSNumber)ancSevereLossScoreRight
{
  return self->_ancSevereLossScoreRight;
}

- (NSNumber)daysSinceLastMeasurementLeft
{
  return self->_daysSinceLastMeasurementLeft;
}

- (NSNumber)daysSinceLastMeasurementRight
{
  return self->_daysSinceLastMeasurementRight;
}

- (NSNumber)daysSinceLastHarmonicMeasurementLeft
{
  return self->_daysSinceLastHarmonicMeasurementLeft;
}

- (NSNumber)daysSinceLastHarmonicMeasurementRight
{
  return self->_daysSinceLastHarmonicMeasurementRight;
}

- (int)errMicStatusLeft
{
  return self->_errMicStatusLeft;
}

- (int)errMicStatusRight
{
  return self->_errMicStatusRight;
}

- (int)frequencyAccuracyLeft
{
  return self->_frequencyAccuracyLeft;
}

- (int)frequencyAccuracyRight
{
  return self->_frequencyAccuracyRight;
}

- (int)frontVentStatusLeft
{
  return self->_frontVentStatusLeft;
}

- (int)frontVentStatusRight
{
  return self->_frontVentStatusRight;
}

- (int)generalSystemStatusLeft
{
  return self->_generalSystemStatusLeft;
}

- (int)generalSystemStatusRight
{
  return self->_generalSystemStatusRight;
}

- (NSDate)lastMeasurementTimestampLeft
{
  return self->_lastMeasurementTimestampLeft;
}

- (NSDate)lastMeasurementTimestampRight
{
  return self->_lastMeasurementTimestampRight;
}

- (int)latestMeasurementResultLeft
{
  return self->_latestMeasurementResultLeft;
}

- (int)latestMeasurementResultRight
{
  return self->_latestMeasurementResultRight;
}

- (int)rearVentStatusLeft
{
  return self->_rearVentStatusLeft;
}

- (int)rearVentStatusRight
{
  return self->_rearVentStatusRight;
}

- (int)refMicStatusLeft
{
  return self->_refMicStatusLeft;
}

- (int)refMicStatusRight
{
  return self->_refMicStatusRight;
}

- (int)speakerStatusLeft
{
  return self->_speakerStatusLeft;
}

- (int)speakerStatusRight
{
  return self->_speakerStatusRight;
}

- (int)totalHarmonicDistortionLeft
{
  return self->_totalHarmonicDistortionLeft;
}

- (int)totalHarmonicDistortionRight
{
  return self->_totalHarmonicDistortionRight;
}

- (int)vceMicStatusLeft
{
  return self->_vceMicStatusLeft;
}

- (int)vceMicStatusRight
{
  return self->_vceMicStatusRight;
}

- (NSNumber)version
{
  return self->_version;
}

- (NSDate)firstTimeUseTimestampLeft
{
  return self->_firstTimeUseTimestampLeft;
}

- (void)setFirstTimeUseTimestampLeft:(id)a3
{
}

- (NSDate)firstTimeUseTimestampRight
{
  return self->_firstTimeUseTimestampRight;
}

- (void)setFirstTimeUseTimestampRight:(id)a3
{
}

- (unsigned)bottomMicFaultCountLeft
{
  return self->_bottomMicFaultCountLeft;
}

- (void)setBottomMicFaultCountLeft:(unsigned int)a3
{
  self->_uint64_t bottomMicFaultCountLeft = a3;
}

- (unsigned)bottomMicFaultCountRight
{
  return self->_bottomMicFaultCountRight;
}

- (void)setBottomMicFaultCountRight:(unsigned int)a3
{
  self->_uint64_t bottomMicFaultCountRight = a3;
}

- (unsigned)diagnosticMeasurementsCount
{
  return self->_diagnosticMeasurementsCount;
}

- (void)setDiagnosticMeasurementsCount:(unsigned int)a3
{
  self->_uint64_t diagnosticMeasurementsCount = a3;
}

- (unsigned)freqAccuracyFaultCountLeft
{
  return self->_freqAccuracyFaultCountLeft;
}

- (void)setFreqAccuracyFaultCountLeft:(unsigned int)a3
{
  self->_uint64_t freqAccuracyFaultCountLeft = a3;
}

- (unsigned)freqAccuracyFaultCountRight
{
  return self->_freqAccuracyFaultCountRight;
}

- (void)setFreqAccuracyFaultCountRight:(unsigned int)a3
{
  self->_uint64_t freqAccuracyFaultCountRight = a3;
}

- (unsigned)frontVentFaultCountLeft
{
  return self->_frontVentFaultCountLeft;
}

- (void)setFrontVentFaultCountLeft:(unsigned int)a3
{
  self->_uint64_t frontVentFaultCountLeft = a3;
}

- (unsigned)frontVentFaultCountRight
{
  return self->_frontVentFaultCountRight;
}

- (void)setFrontVentFaultCountRight:(unsigned int)a3
{
  self->_uint64_t frontVentFaultCountRight = a3;
}

- (unsigned)innerMicFaultCountLeft
{
  return self->_innerMicFaultCountLeft;
}

- (void)setInnerMicFaultCountLeft:(unsigned int)a3
{
  self->_uint64_t innerMicFaultCountLeft = a3;
}

- (unsigned)innerMicFaultCountRight
{
  return self->_innerMicFaultCountRight;
}

- (void)setInnerMicFaultCountRight:(unsigned int)a3
{
  self->_uint64_t innerMicFaultCountRight = a3;
}

- (unsigned)rearVentFaultCountLeft
{
  return self->_rearVentFaultCountLeft;
}

- (void)setRearVentFaultCountLeft:(unsigned int)a3
{
  self->_uint64_t rearVentFaultCountLeft = a3;
}

- (unsigned)rearVentFaultCountRight
{
  return self->_rearVentFaultCountRight;
}

- (void)setRearVentFaultCountRight:(unsigned int)a3
{
  self->_uint64_t rearVentFaultCountRight = a3;
}

- (unsigned)speakerFaultCountLeft
{
  return self->_speakerFaultCountLeft;
}

- (void)setSpeakerFaultCountLeft:(unsigned int)a3
{
  self->_uint64_t speakerFaultCountLeft = a3;
}

- (unsigned)speakerFaultCountRight
{
  return self->_speakerFaultCountRight;
}

- (void)setSpeakerFaultCountRight:(unsigned int)a3
{
  self->_uint64_t speakerFaultCountRight = a3;
}

- (unsigned)topMicFaultCountLeft
{
  return self->_topMicFaultCountLeft;
}

- (void)setTopMicFaultCountLeft:(unsigned int)a3
{
  self->_uint64_t topMicFaultCountLeft = a3;
}

- (unsigned)topMicFaultCountRight
{
  return self->_topMicFaultCountRight;
}

- (void)setTopMicFaultCountRight:(unsigned int)a3
{
  self->_uint64_t topMicFaultCountRight = a3;
}

- (unsigned)totalHarmonicDistortionFaultCountLeft
{
  return self->_totalHarmonicDistortionFaultCountLeft;
}

- (void)setTotalHarmonicDistortionFaultCountLeft:(unsigned int)a3
{
  self->_uint64_t totalHarmonicDistortionFaultCountLeft = a3;
}

- (unsigned)totalHarmonicDistortionFaultCountRight
{
  return self->_totalHarmonicDistortionFaultCountRight;
}

- (void)setTotalHarmonicDistortionFaultCountRight:(unsigned int)a3
{
  self->_uint64_t totalHarmonicDistortionFaultCountRight = a3;
}

- (BOOL)isNewPairing
{
  return self->_isNewPairing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstTimeUseTimestampRight, 0);
  objc_storeStrong((id *)&self->_firstTimeUseTimestampLeft, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_lastMeasurementTimestampRight, 0);
  objc_storeStrong((id *)&self->_lastMeasurementTimestampLeft, 0);
  objc_storeStrong((id *)&self->_daysSinceLastHarmonicMeasurementRight, 0);
  objc_storeStrong((id *)&self->_daysSinceLastHarmonicMeasurementLeft, 0);
  objc_storeStrong((id *)&self->_daysSinceLastMeasurementRight, 0);
  objc_storeStrong((id *)&self->_daysSinceLastMeasurementLeft, 0);
  objc_storeStrong((id *)&self->_ancSevereLossScoreRight, 0);
  objc_storeStrong((id *)&self->_ancSevereLossScoreLeft, 0);
  objc_storeStrong((id *)&self->_ancFullLossScoreRight, 0);
  objc_storeStrong((id *)&self->_ancFullLossScoreLeft, 0);
  objc_storeStrong((id *)&self->_ancCleanLossScoreRight, 0);
  objc_storeStrong((id *)&self->_ancCleanLossScoreLeft, 0);
  objc_storeStrong((id *)&self->_bluetoothUUID, 0);
  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
  objc_storeStrong((id *)&self->_htCleaningAlertFirstTimestamp, 0);
  objc_storeStrong((id *)&self->_hpPlacardFirstTimestamp, 0);
  objc_storeStrong((id *)&self->_hpActiveNotificationFirstTimestamp, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
}

@end