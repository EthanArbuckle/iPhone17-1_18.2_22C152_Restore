@interface HMDeviceCloudRecordInfo
+ (BOOL)supportsSecureCoding;
- (HMDeviceCloudRecordInfo)initWithBluetoothAddress:(id)a3;
- (HMDeviceCloudRecordInfo)initWithCoder:(id)a3;
- (NSDate)latestDiagnosticTimestampLeft;
- (NSDate)latestDiagnosticTimestampRight;
- (NSNumber)bottomMicFaultCountLeft;
- (NSNumber)bottomMicFaultCountRight;
- (NSNumber)diagnosticMeasurementsCount;
- (NSNumber)freqAccuracyFaultCountLeft;
- (NSNumber)freqAccuracyFaultCountRight;
- (NSNumber)frontVentFaultCountLeft;
- (NSNumber)frontVentFaultCountRight;
- (NSNumber)innerMicFaultCountLeft;
- (NSNumber)innerMicFaultCountRight;
- (NSNumber)rearVentFaultCountLeft;
- (NSNumber)rearVentFaultCountRight;
- (NSNumber)speakerFaultCountLeft;
- (NSNumber)speakerFaultCountRight;
- (NSNumber)topMicFaultCountLeft;
- (NSNumber)topMicFaultCountRight;
- (NSNumber)totalHarmonicDistortionFaultCountLeft;
- (NSNumber)totalHarmonicDistortionFaultCountRight;
- (NSString)bluetoothAddress;
- (char)mediaAssistEnabled;
- (char)pmeMediaEnabled;
- (char)pmeVoiceEnabled;
- (char)swipeGainEnabled;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (unsigned)haRegionStatus;
- (unsigned)hpRegionStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setBottomMicFaultCountLeft:(id)a3;
- (void)setBottomMicFaultCountRight:(id)a3;
- (void)setDiagnosticMeasurementsCount:(id)a3;
- (void)setFreqAccuracyFaultCountLeft:(id)a3;
- (void)setFreqAccuracyFaultCountRight:(id)a3;
- (void)setFrontVentFaultCountLeft:(id)a3;
- (void)setFrontVentFaultCountRight:(id)a3;
- (void)setHaRegionStatus:(unsigned __int8)a3;
- (void)setHpRegionStatus:(unsigned __int8)a3;
- (void)setInnerMicFaultCountLeft:(id)a3;
- (void)setInnerMicFaultCountRight:(id)a3;
- (void)setLatestDiagnosticTimestampLeft:(id)a3;
- (void)setLatestDiagnosticTimestampRight:(id)a3;
- (void)setMediaAssistEnabled:(char)a3;
- (void)setPmeMediaEnabled:(char)a3;
- (void)setPmeVoiceEnabled:(char)a3;
- (void)setRearVentFaultCountLeft:(id)a3;
- (void)setRearVentFaultCountRight:(id)a3;
- (void)setSpeakerFaultCountLeft:(id)a3;
- (void)setSpeakerFaultCountRight:(id)a3;
- (void)setSwipeGainEnabled:(char)a3;
- (void)setTopMicFaultCountLeft:(id)a3;
- (void)setTopMicFaultCountRight:(id)a3;
- (void)setTotalHarmonicDistortionFaultCountLeft:(id)a3;
- (void)setTotalHarmonicDistortionFaultCountRight:(id)a3;
@end

@implementation HMDeviceCloudRecordInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMDeviceCloudRecordInfo)initWithBluetoothAddress:(id)a3
{
  id v4 = a3;
  v5 = [(HMDeviceCloudRecordInfo *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 uppercaseString];
    bluetoothAddress = v5->_bluetoothAddress;
    v5->_bluetoothAddress = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)description
{
  return [(HMDeviceCloudRecordInfo *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  v54 = [(id)objc_opt_class() description];
  NSAppendPrintF_safe();
  id v5 = 0;

  bluetoothAddress = self->_bluetoothAddress;
  if (bluetoothAddress)
  {
    v55 = bluetoothAddress;
    NSAppendPrintF_safe();
    id v7 = v5;

    id v5 = v7;
  }
  if (self->_haRegionStatus)
  {
    NSAppendPrintF_safe();
    id v8 = v5;

    id v5 = v8;
  }
  if (self->_hpRegionStatus)
  {
    NSAppendPrintF_safe();
    id v9 = v5;

    id v5 = v9;
  }
  if (self->_mediaAssistEnabled)
  {
    NSAppendPrintF_safe();
    id v10 = v5;

    id v5 = v10;
  }
  if (self->_pmeMediaEnabled)
  {
    NSAppendPrintF_safe();
    id v11 = v5;

    id v5 = v11;
  }
  if (self->_pmeVoiceEnabled)
  {
    NSAppendPrintF_safe();
    id v12 = v5;

    id v5 = v12;
  }
  if (self->_swipeGainEnabled)
  {
    NSAppendPrintF_safe();
    id v13 = v5;

    id v5 = v13;
  }
  bottomMicFaultCountLeft = self->_bottomMicFaultCountLeft;
  if (bottomMicFaultCountLeft)
  {
    v56 = bottomMicFaultCountLeft;
    NSAppendPrintF_safe();
    id v15 = v5;

    id v5 = v15;
  }
  bottomMicFaultCountRight = self->_bottomMicFaultCountRight;
  if (bottomMicFaultCountRight)
  {
    v57 = bottomMicFaultCountRight;
    NSAppendPrintF_safe();
    id v17 = v5;

    id v5 = v17;
  }
  diagnosticMeasurementsCount = self->_diagnosticMeasurementsCount;
  if (diagnosticMeasurementsCount)
  {
    v58 = diagnosticMeasurementsCount;
    NSAppendPrintF_safe();
    id v19 = v5;

    id v5 = v19;
  }
  freqAccuracyFaultCountLeft = self->_freqAccuracyFaultCountLeft;
  if (freqAccuracyFaultCountLeft)
  {
    v59 = freqAccuracyFaultCountLeft;
    NSAppendPrintF_safe();
    id v21 = v5;

    id v5 = v21;
  }
  freqAccuracyFaultCountRight = self->_freqAccuracyFaultCountRight;
  if (freqAccuracyFaultCountRight)
  {
    v60 = freqAccuracyFaultCountRight;
    NSAppendPrintF_safe();
    id v23 = v5;

    id v5 = v23;
  }
  frontVentFaultCountLeft = self->_frontVentFaultCountLeft;
  if (frontVentFaultCountLeft)
  {
    v61 = frontVentFaultCountLeft;
    NSAppendPrintF_safe();
    id v25 = v5;

    id v5 = v25;
  }
  frontVentFaultCountRight = self->_frontVentFaultCountRight;
  if (frontVentFaultCountRight)
  {
    v62 = frontVentFaultCountRight;
    NSAppendPrintF_safe();
    id v27 = v5;

    id v5 = v27;
  }
  innerMicFaultCountLeft = self->_innerMicFaultCountLeft;
  if (innerMicFaultCountLeft)
  {
    v63 = innerMicFaultCountLeft;
    NSAppendPrintF_safe();
    id v29 = v5;

    id v5 = v29;
  }
  innerMicFaultCountRight = self->_innerMicFaultCountRight;
  if (innerMicFaultCountRight)
  {
    v64 = innerMicFaultCountRight;
    NSAppendPrintF_safe();
    id v31 = v5;

    id v5 = v31;
  }
  latestDiagnosticTimestampLeft = self->_latestDiagnosticTimestampLeft;
  if (latestDiagnosticTimestampLeft)
  {
    v65 = latestDiagnosticTimestampLeft;
    NSAppendPrintF_safe();
    id v33 = v5;

    id v5 = v33;
  }
  latestDiagnosticTimestampRight = self->_latestDiagnosticTimestampRight;
  if (latestDiagnosticTimestampRight)
  {
    v66 = latestDiagnosticTimestampRight;
    NSAppendPrintF_safe();
    id v35 = v5;

    id v5 = v35;
  }
  rearVentFaultCountLeft = self->_rearVentFaultCountLeft;
  if (rearVentFaultCountLeft)
  {
    v67 = rearVentFaultCountLeft;
    NSAppendPrintF_safe();
    id v37 = v5;

    id v5 = v37;
  }
  rearVentFaultCountRight = self->_rearVentFaultCountRight;
  if (rearVentFaultCountRight)
  {
    v68 = rearVentFaultCountRight;
    NSAppendPrintF_safe();
    id v39 = v5;

    id v5 = v39;
  }
  speakerFaultCountLeft = self->_speakerFaultCountLeft;
  if (speakerFaultCountLeft)
  {
    v69 = speakerFaultCountLeft;
    NSAppendPrintF_safe();
    id v41 = v5;

    id v5 = v41;
  }
  speakerFaultCountRight = self->_speakerFaultCountRight;
  if (speakerFaultCountRight)
  {
    v70 = speakerFaultCountRight;
    NSAppendPrintF_safe();
    id v43 = v5;

    id v5 = v43;
  }
  topMicFaultCountLeft = self->_topMicFaultCountLeft;
  if (topMicFaultCountLeft)
  {
    v71 = topMicFaultCountLeft;
    NSAppendPrintF_safe();
    id v45 = v5;

    id v5 = v45;
  }
  topMicFaultCountRight = self->_topMicFaultCountRight;
  if (topMicFaultCountRight)
  {
    v72 = topMicFaultCountRight;
    NSAppendPrintF_safe();
    id v47 = v5;

    id v5 = v47;
  }
  totalHarmonicDistortionFaultCountLeft = self->_totalHarmonicDistortionFaultCountLeft;
  if (totalHarmonicDistortionFaultCountLeft)
  {
    v73 = totalHarmonicDistortionFaultCountLeft;
    NSAppendPrintF_safe();
    id v49 = v5;

    id v5 = v49;
  }
  totalHarmonicDistortionFaultCountRight = self->_totalHarmonicDistortionFaultCountRight;
  if (totalHarmonicDistortionFaultCountRight)
  {
    v74 = totalHarmonicDistortionFaultCountRight;
    NSAppendPrintF_safe();
    id v51 = v5;

    id v5 = v51;
  }
  if (a3 < 21)
  {
    NSAppendPrintF_safe();
    id v52 = v5;

    id v5 = v52;
  }

  return v5;
}

- (HMDeviceCloudRecordInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDeviceCloudRecordInfo *)self init];
  if (v5)
  {
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_haRegionStatus = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_hpRegionStatus = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_mediaAssistEnabled = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_pmeMediaEnabled = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_pmeVoiceEnabled = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_swipeGainEnabled = 0;
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
    id v7 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  bluetoothAddress = self->_bluetoothAddress;
  id v25 = v4;
  if (bluetoothAddress)
  {
    [v4 encodeObject:bluetoothAddress forKey:@"btAd"];
    id v4 = v25;
  }
  if (self->_haRegionStatus)
  {
    objc_msgSend(v25, "encodeInteger:forKey:");
    id v4 = v25;
  }
  if (self->_hpRegionStatus)
  {
    objc_msgSend(v25, "encodeInteger:forKey:");
    id v4 = v25;
  }
  if (self->_mediaAssistEnabled)
  {
    objc_msgSend(v25, "encodeInteger:forKey:");
    id v4 = v25;
  }
  if (self->_pmeMediaEnabled)
  {
    objc_msgSend(v25, "encodeInteger:forKey:");
    id v4 = v25;
  }
  if (self->_pmeVoiceEnabled)
  {
    objc_msgSend(v25, "encodeInteger:forKey:");
    id v4 = v25;
  }
  if (self->_swipeGainEnabled)
  {
    objc_msgSend(v25, "encodeInteger:forKey:");
    id v4 = v25;
  }
  bottomMicFaultCountLeft = self->_bottomMicFaultCountLeft;
  if (bottomMicFaultCountLeft)
  {
    [v25 encodeObject:bottomMicFaultCountLeft forKey:@"bmfl"];
    id v4 = v25;
  }
  bottomMicFaultCountRight = self->_bottomMicFaultCountRight;
  if (bottomMicFaultCountRight)
  {
    [v25 encodeObject:bottomMicFaultCountRight forKey:@"bmfr"];
    id v4 = v25;
  }
  diagnosticMeasurementsCount = self->_diagnosticMeasurementsCount;
  if (diagnosticMeasurementsCount)
  {
    [v25 encodeObject:diagnosticMeasurementsCount forKey:@"dimc"];
    id v4 = v25;
  }
  freqAccuracyFaultCountLeft = self->_freqAccuracyFaultCountLeft;
  if (freqAccuracyFaultCountLeft)
  {
    [v25 encodeObject:freqAccuracyFaultCountLeft forKey:@"fafl"];
    id v4 = v25;
  }
  freqAccuracyFaultCountRight = self->_freqAccuracyFaultCountRight;
  if (freqAccuracyFaultCountRight)
  {
    [v25 encodeObject:freqAccuracyFaultCountRight forKey:@"fafr"];
    id v4 = v25;
  }
  frontVentFaultCountLeft = self->_frontVentFaultCountLeft;
  if (frontVentFaultCountLeft)
  {
    [v25 encodeObject:frontVentFaultCountLeft forKey:@"fvfl"];
    id v4 = v25;
  }
  frontVentFaultCountRight = self->_frontVentFaultCountRight;
  if (frontVentFaultCountRight)
  {
    [v25 encodeObject:frontVentFaultCountRight forKey:@"fvfr"];
    id v4 = v25;
  }
  innerMicFaultCountLeft = self->_innerMicFaultCountLeft;
  if (innerMicFaultCountLeft)
  {
    [v25 encodeObject:innerMicFaultCountLeft forKey:@"imfl"];
    id v4 = v25;
  }
  innerMicFaultCountRight = self->_innerMicFaultCountRight;
  if (innerMicFaultCountRight)
  {
    [v25 encodeObject:innerMicFaultCountRight forKey:@"imfr"];
    id v4 = v25;
  }
  latestDiagnosticTimestampLeft = self->_latestDiagnosticTimestampLeft;
  if (latestDiagnosticTimestampLeft)
  {
    [v25 encodeObject:latestDiagnosticTimestampLeft forKey:@"ldtl"];
    id v4 = v25;
  }
  latestDiagnosticTimestampRight = self->_latestDiagnosticTimestampRight;
  if (latestDiagnosticTimestampRight)
  {
    [v25 encodeObject:latestDiagnosticTimestampRight forKey:@"ldtr"];
    id v4 = v25;
  }
  rearVentFaultCountLeft = self->_rearVentFaultCountLeft;
  if (rearVentFaultCountLeft)
  {
    [v25 encodeObject:rearVentFaultCountLeft forKey:@"rvfl"];
    id v4 = v25;
  }
  rearVentFaultCountRight = self->_rearVentFaultCountRight;
  if (rearVentFaultCountRight)
  {
    [v25 encodeObject:rearVentFaultCountRight forKey:@"rvfr"];
    id v4 = v25;
  }
  speakerFaultCountLeft = self->_speakerFaultCountLeft;
  if (speakerFaultCountLeft)
  {
    [v25 encodeObject:speakerFaultCountLeft forKey:@"sfcl"];
    id v4 = v25;
  }
  speakerFaultCountRight = self->_speakerFaultCountRight;
  if (speakerFaultCountRight)
  {
    [v25 encodeObject:speakerFaultCountRight forKey:@"sfcr"];
    id v4 = v25;
  }
  topMicFaultCountLeft = self->_topMicFaultCountLeft;
  if (topMicFaultCountLeft)
  {
    [v25 encodeObject:topMicFaultCountLeft forKey:@"tmfl"];
    id v4 = v25;
  }
  topMicFaultCountRight = self->_topMicFaultCountRight;
  if (topMicFaultCountRight)
  {
    [v25 encodeObject:topMicFaultCountRight forKey:@"tmfr"];
    id v4 = v25;
  }
  totalHarmonicDistortionFaultCountLeft = self->_totalHarmonicDistortionFaultCountLeft;
  if (totalHarmonicDistortionFaultCountLeft)
  {
    [v25 encodeObject:totalHarmonicDistortionFaultCountLeft forKey:@"thdl"];
    id v4 = v25;
  }
  totalHarmonicDistortionFaultCountRight = self->_totalHarmonicDistortionFaultCountRight;
  if (totalHarmonicDistortionFaultCountRight)
  {
    [v25 encodeObject:totalHarmonicDistortionFaultCountRight forKey:@"thdr"];
    id v4 = v25;
  }
}

- (NSString)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (unsigned)haRegionStatus
{
  return self->_haRegionStatus;
}

- (void)setHaRegionStatus:(unsigned __int8)a3
{
  self->_haRegionStatus = a3;
}

- (unsigned)hpRegionStatus
{
  return self->_hpRegionStatus;
}

- (void)setHpRegionStatus:(unsigned __int8)a3
{
  self->_hpRegionStatus = a3;
}

- (char)mediaAssistEnabled
{
  return self->_mediaAssistEnabled;
}

- (void)setMediaAssistEnabled:(char)a3
{
  self->_mediaAssistEnabled = a3;
}

- (char)pmeMediaEnabled
{
  return self->_pmeMediaEnabled;
}

- (void)setPmeMediaEnabled:(char)a3
{
  self->_pmeMediaEnabled = a3;
}

- (char)pmeVoiceEnabled
{
  return self->_pmeVoiceEnabled;
}

- (void)setPmeVoiceEnabled:(char)a3
{
  self->_pmeVoiceEnabled = a3;
}

- (char)swipeGainEnabled
{
  return self->_swipeGainEnabled;
}

- (void)setSwipeGainEnabled:(char)a3
{
  self->_swipeGainEnabled = a3;
}

- (NSNumber)bottomMicFaultCountLeft
{
  return self->_bottomMicFaultCountLeft;
}

- (void)setBottomMicFaultCountLeft:(id)a3
{
}

- (NSNumber)bottomMicFaultCountRight
{
  return self->_bottomMicFaultCountRight;
}

- (void)setBottomMicFaultCountRight:(id)a3
{
}

- (NSNumber)diagnosticMeasurementsCount
{
  return self->_diagnosticMeasurementsCount;
}

- (void)setDiagnosticMeasurementsCount:(id)a3
{
}

- (NSNumber)freqAccuracyFaultCountLeft
{
  return self->_freqAccuracyFaultCountLeft;
}

- (void)setFreqAccuracyFaultCountLeft:(id)a3
{
}

- (NSNumber)freqAccuracyFaultCountRight
{
  return self->_freqAccuracyFaultCountRight;
}

- (void)setFreqAccuracyFaultCountRight:(id)a3
{
}

- (NSNumber)frontVentFaultCountLeft
{
  return self->_frontVentFaultCountLeft;
}

- (void)setFrontVentFaultCountLeft:(id)a3
{
}

- (NSNumber)frontVentFaultCountRight
{
  return self->_frontVentFaultCountRight;
}

- (void)setFrontVentFaultCountRight:(id)a3
{
}

- (NSNumber)innerMicFaultCountLeft
{
  return self->_innerMicFaultCountLeft;
}

- (void)setInnerMicFaultCountLeft:(id)a3
{
}

- (NSNumber)innerMicFaultCountRight
{
  return self->_innerMicFaultCountRight;
}

- (void)setInnerMicFaultCountRight:(id)a3
{
}

- (NSDate)latestDiagnosticTimestampLeft
{
  return self->_latestDiagnosticTimestampLeft;
}

- (void)setLatestDiagnosticTimestampLeft:(id)a3
{
}

- (NSDate)latestDiagnosticTimestampRight
{
  return self->_latestDiagnosticTimestampRight;
}

- (void)setLatestDiagnosticTimestampRight:(id)a3
{
}

- (NSNumber)rearVentFaultCountLeft
{
  return self->_rearVentFaultCountLeft;
}

- (void)setRearVentFaultCountLeft:(id)a3
{
}

- (NSNumber)rearVentFaultCountRight
{
  return self->_rearVentFaultCountRight;
}

- (void)setRearVentFaultCountRight:(id)a3
{
}

- (NSNumber)speakerFaultCountLeft
{
  return self->_speakerFaultCountLeft;
}

- (void)setSpeakerFaultCountLeft:(id)a3
{
}

- (NSNumber)speakerFaultCountRight
{
  return self->_speakerFaultCountRight;
}

- (void)setSpeakerFaultCountRight:(id)a3
{
}

- (NSNumber)topMicFaultCountLeft
{
  return self->_topMicFaultCountLeft;
}

- (void)setTopMicFaultCountLeft:(id)a3
{
}

- (NSNumber)topMicFaultCountRight
{
  return self->_topMicFaultCountRight;
}

- (void)setTopMicFaultCountRight:(id)a3
{
}

- (NSNumber)totalHarmonicDistortionFaultCountLeft
{
  return self->_totalHarmonicDistortionFaultCountLeft;
}

- (void)setTotalHarmonicDistortionFaultCountLeft:(id)a3
{
}

- (NSNumber)totalHarmonicDistortionFaultCountRight
{
  return self->_totalHarmonicDistortionFaultCountRight;
}

- (void)setTotalHarmonicDistortionFaultCountRight:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalHarmonicDistortionFaultCountRight, 0);
  objc_storeStrong((id *)&self->_totalHarmonicDistortionFaultCountLeft, 0);
  objc_storeStrong((id *)&self->_topMicFaultCountRight, 0);
  objc_storeStrong((id *)&self->_topMicFaultCountLeft, 0);
  objc_storeStrong((id *)&self->_speakerFaultCountRight, 0);
  objc_storeStrong((id *)&self->_speakerFaultCountLeft, 0);
  objc_storeStrong((id *)&self->_rearVentFaultCountRight, 0);
  objc_storeStrong((id *)&self->_rearVentFaultCountLeft, 0);
  objc_storeStrong((id *)&self->_latestDiagnosticTimestampRight, 0);
  objc_storeStrong((id *)&self->_latestDiagnosticTimestampLeft, 0);
  objc_storeStrong((id *)&self->_innerMicFaultCountRight, 0);
  objc_storeStrong((id *)&self->_innerMicFaultCountLeft, 0);
  objc_storeStrong((id *)&self->_frontVentFaultCountRight, 0);
  objc_storeStrong((id *)&self->_frontVentFaultCountLeft, 0);
  objc_storeStrong((id *)&self->_freqAccuracyFaultCountRight, 0);
  objc_storeStrong((id *)&self->_freqAccuracyFaultCountLeft, 0);
  objc_storeStrong((id *)&self->_diagnosticMeasurementsCount, 0);
  objc_storeStrong((id *)&self->_bottomMicFaultCountRight, 0);
  objc_storeStrong((id *)&self->_bottomMicFaultCountLeft, 0);

  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
}

@end