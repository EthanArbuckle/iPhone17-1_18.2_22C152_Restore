@interface AAProxCardsInfo
+ (BOOL)supportsSecureCoding;
- (AAProxCardsInfo)initWithBluetoothAddress:(id)a3;
- (AAProxCardsInfo)initWithCoder:(id)a3;
- (NSString)bluetoothAddress;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (unint64_t)caseDoubleTapVersion;
- (unint64_t)headGesturesVersion;
- (unint64_t)hearingAssistVersion;
- (unint64_t)hearingTestVersion;
- (unint64_t)heartRateVersion;
- (unint64_t)voiceQualityVersion;
- (unint64_t)whatsNewVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setCaseDoubleTapVersion:(unint64_t)a3;
- (void)setHeadGesturesVersion:(unint64_t)a3;
- (void)setHearingAssistVersion:(unint64_t)a3;
- (void)setHearingTestVersion:(unint64_t)a3;
- (void)setHeartRateVersion:(unint64_t)a3;
- (void)setVoiceQualityVersion:(unint64_t)a3;
- (void)setWhatsNewVersion:(unint64_t)a3;
@end

@implementation AAProxCardsInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AAProxCardsInfo)initWithBluetoothAddress:(id)a3
{
  id v4 = a3;
  v5 = [(AAProxCardsInfo *)self init];
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
  return [(AAProxCardsInfo *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  v17 = [(id)objc_opt_class() description];
  NSAppendPrintF_safe();
  id v5 = 0;

  bluetoothAddress = self->_bluetoothAddress;
  if (bluetoothAddress)
  {
    v18 = bluetoothAddress;
    NSAppendPrintF_safe();
    id v7 = v5;

    id v5 = v7;
  }
  if (self->_caseDoubleTapVersion)
  {
    NSAppendPrintF_safe();
    id v8 = v5;

    id v5 = v8;
  }
  if (self->_headGesturesVersion)
  {
    NSAppendPrintF_safe();
    id v9 = v5;

    id v5 = v9;
  }
  if (self->_hearingAssistVersion)
  {
    NSAppendPrintF_safe();
    id v10 = v5;

    id v5 = v10;
  }
  if (self->_hearingTestVersion)
  {
    NSAppendPrintF_safe();
    id v11 = v5;

    id v5 = v11;
  }
  if (self->_heartRateVersion)
  {
    NSAppendPrintF_safe();
    id v12 = v5;

    id v5 = v12;
  }
  if (self->_voiceQualityVersion)
  {
    NSAppendPrintF_safe();
    id v13 = v5;

    id v5 = v13;
  }
  if (self->_whatsNewVersion)
  {
    NSAppendPrintF_safe();
    id v14 = v5;

    id v5 = v14;
  }
  if (a3 < 21)
  {
    NSAppendPrintF_safe();
    id v15 = v5;

    id v5 = v15;
  }

  return v5;
}

- (AAProxCardsInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AAProxCardsInfo *)self init];
  if (v5)
  {
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v7 = v6;
    if ([v7 containsValueForKey:@"caDT"]) {
      v5->_caseDoubleTapVersion = [v7 decodeInt64ForKey:@"caDT"];
    }

    id v8 = v7;
    if ([v8 containsValueForKey:@"hGes"]) {
      v5->_headGesturesVersion = [v8 decodeInt64ForKey:@"hGes"];
    }

    id v9 = v8;
    if ([v9 containsValueForKey:@"hgAs"]) {
      v5->_hearingAssistVersion = [v9 decodeInt64ForKey:@"hgAs"];
    }

    id v10 = v9;
    if ([v10 containsValueForKey:@"hgTs"]) {
      v5->_hearingTestVersion = [v10 decodeInt64ForKey:@"hgTs"];
    }

    id v11 = v10;
    if ([v11 containsValueForKey:@"heRa"]) {
      v5->_heartRateVersion = [v11 decodeInt64ForKey:@"heRa"];
    }

    id v12 = v11;
    if ([v12 containsValueForKey:@"voQu"]) {
      v5->_voiceQualityVersion = [v12 decodeInt64ForKey:@"voQu"];
    }

    id v13 = v12;
    if ([v13 containsValueForKey:@"wNew"]) {
      v5->_whatsNewVersion = [v13 decodeInt64ForKey:@"wNew"];
    }

    id v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  bluetoothAddress = self->_bluetoothAddress;
  id v13 = v4;
  if (bluetoothAddress)
  {
    [v4 encodeObject:bluetoothAddress forKey:@"btAd"];
    id v4 = v13;
  }
  unint64_t caseDoubleTapVersion = self->_caseDoubleTapVersion;
  if (caseDoubleTapVersion)
  {
    [v13 encodeInt64:caseDoubleTapVersion forKey:@"caDT"];
    id v4 = v13;
  }
  unint64_t headGesturesVersion = self->_headGesturesVersion;
  if (headGesturesVersion)
  {
    [v13 encodeInt64:headGesturesVersion forKey:@"hGes"];
    id v4 = v13;
  }
  unint64_t hearingAssistVersion = self->_hearingAssistVersion;
  if (hearingAssistVersion)
  {
    [v13 encodeInt64:hearingAssistVersion forKey:@"hgAs"];
    id v4 = v13;
  }
  unint64_t hearingTestVersion = self->_hearingTestVersion;
  if (hearingTestVersion)
  {
    [v13 encodeInt64:hearingTestVersion forKey:@"hgTs"];
    id v4 = v13;
  }
  unint64_t heartRateVersion = self->_heartRateVersion;
  if (heartRateVersion)
  {
    [v13 encodeInt64:heartRateVersion forKey:@"heRa"];
    id v4 = v13;
  }
  unint64_t voiceQualityVersion = self->_voiceQualityVersion;
  if (voiceQualityVersion)
  {
    [v13 encodeInt64:voiceQualityVersion forKey:@"voQu"];
    id v4 = v13;
  }
  unint64_t whatsNewVersion = self->_whatsNewVersion;
  if (whatsNewVersion)
  {
    [v13 encodeInt64:whatsNewVersion forKey:@"wNew"];
    id v4 = v13;
  }
}

- (NSString)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (unint64_t)caseDoubleTapVersion
{
  return self->_caseDoubleTapVersion;
}

- (void)setCaseDoubleTapVersion:(unint64_t)a3
{
  self->_unint64_t caseDoubleTapVersion = a3;
}

- (unint64_t)headGesturesVersion
{
  return self->_headGesturesVersion;
}

- (void)setHeadGesturesVersion:(unint64_t)a3
{
  self->_unint64_t headGesturesVersion = a3;
}

- (unint64_t)hearingAssistVersion
{
  return self->_hearingAssistVersion;
}

- (void)setHearingAssistVersion:(unint64_t)a3
{
  self->_unint64_t hearingAssistVersion = a3;
}

- (unint64_t)hearingTestVersion
{
  return self->_hearingTestVersion;
}

- (void)setHearingTestVersion:(unint64_t)a3
{
  self->_unint64_t hearingTestVersion = a3;
}

- (unint64_t)heartRateVersion
{
  return self->_heartRateVersion;
}

- (void)setHeartRateVersion:(unint64_t)a3
{
  self->_unint64_t heartRateVersion = a3;
}

- (unint64_t)voiceQualityVersion
{
  return self->_voiceQualityVersion;
}

- (void)setVoiceQualityVersion:(unint64_t)a3
{
  self->_unint64_t voiceQualityVersion = a3;
}

- (unint64_t)whatsNewVersion
{
  return self->_whatsNewVersion;
}

- (void)setWhatsNewVersion:(unint64_t)a3
{
  self->_unint64_t whatsNewVersion = a3;
}

- (void).cxx_destruct
{
}

@end