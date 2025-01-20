@interface HMDFamiliarFacesBulletinLogEvent
- (BOOL)containsFaceClassification;
- (BOOL)doorbellPressed;
- (HMDFamiliarFacesBulletinLogEvent)initWithContainsFaceClassification:(BOOL)a3 numberOfKnownPersons:(int64_t)a4 numberOfUnknownPersons:(int64_t)a5 bulletinReason:(id)a6 doorbellPressed:(BOOL)a7 secondsFromDoorbellToFaceClassification:(double)a8;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)bulletinReason;
- (NSString)coreAnalyticsEventName;
- (double)secondsFromDoorbellToFaceClassification;
- (int64_t)numberOfKnownPersons;
- (int64_t)numberOfUnknownPersons;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDFamiliarFacesBulletinLogEvent

- (void).cxx_destruct
{
}

- (double)secondsFromDoorbellToFaceClassification
{
  return self->_secondsFromDoorbellToFaceClassification;
}

- (BOOL)doorbellPressed
{
  return self->_doorbellPressed;
}

- (NSString)bulletinReason
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (int64_t)numberOfUnknownPersons
{
  return self->_numberOfUnknownPersons;
}

- (int64_t)numberOfKnownPersons
{
  return self->_numberOfKnownPersons;
}

- (BOOL)containsFaceClassification
{
  return self->_containsFaceClassification;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v18[7] = *MEMORY[0x1E4F143B8];
  v17[0] = @"containsFaceClassification_BOOL";
  v3 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDFamiliarFacesBulletinLogEvent containsFaceClassification](self, "containsFaceClassification"));
  v18[0] = v3;
  v17[1] = @"containsFaceClassification_INT";
  BOOL v4 = [(HMDFamiliarFacesBulletinLogEvent *)self containsFaceClassification];
  v5 = &unk_1F2DC73D8;
  if (v4) {
    v5 = &unk_1F2DC73C0;
  }
  v18[1] = v5;
  v17[2] = @"numberOfKnownPersons";
  v6 = +[HMDLogEventHistograms lowVolumeHistogram];
  v7 = objc_msgSend(v6, "intervalIndexForValue:", -[HMDFamiliarFacesBulletinLogEvent numberOfKnownPersons](self, "numberOfKnownPersons"));
  v18[2] = v7;
  v17[3] = @"numberOfUnknownPersons";
  v8 = +[HMDLogEventHistograms lowVolumeHistogram];
  v9 = objc_msgSend(v8, "intervalIndexForValue:", -[HMDFamiliarFacesBulletinLogEvent numberOfUnknownPersons](self, "numberOfUnknownPersons"));
  v18[3] = v9;
  v17[4] = @"bulletinReason";
  v10 = [(HMDFamiliarFacesBulletinLogEvent *)self bulletinReason];
  v18[4] = v10;
  v17[5] = @"doorbellPressed";
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDFamiliarFacesBulletinLogEvent doorbellPressed](self, "doorbellPressed"));
  v18[5] = v11;
  v17[6] = @"secondsFromDoorbellToFaceClassification";
  v12 = +[HMDLogEventHistograms lowVolumeHistogram];
  [(HMDFamiliarFacesBulletinLogEvent *)self secondsFromDoorbellToFaceClassification];
  v14 = [v12 intervalIndexForValue:(unint64_t)v13];
  v18[6] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:7];

  return (NSDictionary *)v15;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.familiarFacesBulletin";
}

- (HMDFamiliarFacesBulletinLogEvent)initWithContainsFaceClassification:(BOOL)a3 numberOfKnownPersons:(int64_t)a4 numberOfUnknownPersons:(int64_t)a5 bulletinReason:(id)a6 doorbellPressed:(BOOL)a7 secondsFromDoorbellToFaceClassification:(double)a8
{
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMDFamiliarFacesBulletinLogEvent;
  v15 = [(HMMLogEvent *)&v20 init];
  v16 = v15;
  if (v15)
  {
    v15->_containsFaceClassification = a3;
    v15->_numberOfKnownPersons = a4;
    v15->_numberOfUnknownPersons = a5;
    uint64_t v17 = [v14 copy];
    bulletinReason = v16->_bulletinReason;
    v16->_bulletinReason = (NSString *)v17;

    v16->_doorbellPressed = a7;
    v16->_secondsFromDoorbellToFaceClassification = a8;
  }

  return v16;
}

@end