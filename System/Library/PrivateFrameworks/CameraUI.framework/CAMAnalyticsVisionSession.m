@interface CAMAnalyticsVisionSession
- (BOOL)_isDocumentScanningEnabled;
- (BOOL)_isMRCDetectionEnabled;
- (BOOL)_isTextDetectionEnabled;
- (CAMAnalyticsVisionSession)initWithTextDetectionEnabled:(BOOL)a3 MRCDetectionEnabled:(BOOL)a4 documentScanningEnabled:(BOOL)a5;
- (NSMutableSet)_pressedQRTypes;
- (double)_startTime;
- (id)_analyticsValueForQRType:(int64_t)a3;
- (id)_analyticsValueForQRTypes:(id)a3;
- (id)eventName;
- (int64_t)_bucketedCount:(int64_t)a3;
- (unint64_t)_appClipButtonPressCount;
- (unint64_t)_appClipPillPressCount;
- (unint64_t)_countDocumentScanningCanceledScans;
- (unint64_t)_countDocumentScanningCompletedScans;
- (unint64_t)_countDocumentScanningPressCount;
- (unint64_t)_countObservedDocuments;
- (unint64_t)_maxAppClipCodeCount;
- (unint64_t)_maxQRCodeCount;
- (unint64_t)_maxTextRegionCount;
- (unint64_t)_qrButtonPressCount;
- (unint64_t)_qrPillPressCount;
- (unint64_t)_textButtonPressCount;
- (unint64_t)totalMRCInteractions;
- (void)_countMRCTypeForAction:(id)a3;
- (void)_setAppClipButtonPressCount:(unint64_t)a3;
- (void)_setAppClipPillPressCount:(unint64_t)a3;
- (void)_setCountDocumentScanningCanceleddScans:(unint64_t)a3;
- (void)_setCountDocumentScanningCompletedScans:(unint64_t)a3;
- (void)_setCountDocumentScanningPressCount:(unint64_t)a3;
- (void)_setCountObservedDocuments:(unint64_t)a3;
- (void)_setMaxAppClipCodeCount:(unint64_t)a3;
- (void)_setMaxQRCodeCount:(unint64_t)a3;
- (void)_setMaxTextRegionCount:(unint64_t)a3;
- (void)_setPressedMRCTypes:(id)a3;
- (void)_setQRButtonPressCount:(unint64_t)a3;
- (void)_setQRPillPressCount:(unint64_t)a3;
- (void)_setStartTime:(double)a3;
- (void)_setTextButtonPressCount:(unint64_t)a3;
- (void)countButtonPressForDocumentScanning;
- (void)countButtonPressForMRC:(id)a3 action:(id)a4;
- (void)countDocumentScanningCanceledScans;
- (void)countDocumentScanningCompletedScans;
- (void)countObservedDocumentScanning;
- (void)countObservedSignficantMRCs:(id)a3;
- (void)countObservedSignficantTextRegionCount:(unint64_t)a3;
- (void)countPillPressForMRC:(id)a3 action:(id)a4;
- (void)countTextButtonPress;
- (void)publish;
@end

@implementation CAMAnalyticsVisionSession

- (CAMAnalyticsVisionSession)initWithTextDetectionEnabled:(BOOL)a3 MRCDetectionEnabled:(BOOL)a4 documentScanningEnabled:(BOOL)a5
{
  v11.receiver = self;
  v11.super_class = (Class)CAMAnalyticsVisionSession;
  v8 = [(CAMAnalyticsEvent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->__textDetectionEnabled = a3;
    v8->__MRCDetectionEnabled = a4;
    v8->__documentScanningEnabled = a5;
    v8->__startTime = CFAbsoluteTimeGetCurrent();
  }
  return v9;
}

- (id)eventName
{
  return @"vision.session";
}

- (void)countTextButtonPress
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2099F8000, v2, v3, "%{public}@ called when text detection is disabled", v4, v5, v6, v7, v8);
}

- (void)countButtonPressForMRC:(id)a3 action:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(CAMAnalyticsVisionSession *)self _isMRCDetectionEnabled])
  {
    uint64_t v9 = [v7 mrcType];
    if (v9 == 1)
    {
      [(CAMAnalyticsVisionSession *)self _setAppClipButtonPressCount:[(CAMAnalyticsVisionSession *)self _appClipButtonPressCount] + 1];
    }
    else if (!v9)
    {
      [(CAMAnalyticsVisionSession *)self _setQRButtonPressCount:[(CAMAnalyticsVisionSession *)self _qrButtonPressCount] + 1];
      [(CAMAnalyticsVisionSession *)self _countMRCTypeForAction:v8];
    }
  }
  else
  {
    v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CAMAnalyticsVisionSession countButtonPressForMRC:action:](a2);
    }
  }
}

- (void)countPillPressForMRC:(id)a3 action:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(CAMAnalyticsVisionSession *)self _isMRCDetectionEnabled])
  {
    uint64_t v9 = [v7 mrcType];
    if (v9 == 1)
    {
      [(CAMAnalyticsVisionSession *)self _setAppClipPillPressCount:[(CAMAnalyticsVisionSession *)self _appClipPillPressCount] + 1];
    }
    else if (!v9)
    {
      [(CAMAnalyticsVisionSession *)self _setQRPillPressCount:[(CAMAnalyticsVisionSession *)self _qrPillPressCount] + 1];
      [(CAMAnalyticsVisionSession *)self _countMRCTypeForAction:v8];
    }
  }
  else
  {
    v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CAMAnalyticsVisionSession countButtonPressForMRC:action:](a2);
    }
  }
}

- (void)countObservedSignficantTextRegionCount:(unint64_t)a3
{
  BOOL v6 = [(CAMAnalyticsVisionSession *)self _isTextDetectionEnabled];
  if (!a3 || v6)
  {
    unint64_t v8 = [(CAMAnalyticsVisionSession *)self _maxTextRegionCount];
    if (v8 <= a3) {
      unint64_t v9 = a3;
    }
    else {
      unint64_t v9 = v8;
    }
    [(CAMAnalyticsVisionSession *)self _setMaxTextRegionCount:v9];
  }
  else
  {
    id v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CAMAnalyticsVisionSession countTextButtonPress](a2);
    }
  }
}

- (void)countObservedSignficantMRCs:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (-[CAMAnalyticsVisionSession _isMRCDetectionEnabled](self, "_isMRCDetectionEnabled") || ![v5 count])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      unint64_t v10 = 0;
      unint64_t v11 = 0;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v7);
          }
          uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "mrcType", (void)v19);
          if (v14 == 1)
          {
            ++v10;
          }
          else if (!v14)
          {
            ++v11;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }
    else
    {
      unint64_t v10 = 0;
      unint64_t v11 = 0;
    }

    unint64_t v15 = [(CAMAnalyticsVisionSession *)self _maxQRCodeCount];
    if (v11 <= v15) {
      unint64_t v16 = v15;
    }
    else {
      unint64_t v16 = v11;
    }
    -[CAMAnalyticsVisionSession _setMaxQRCodeCount:](self, "_setMaxQRCodeCount:", v16, (void)v19);
    unint64_t v17 = [(CAMAnalyticsVisionSession *)self _maxAppClipCodeCount];
    if (v10 <= v17) {
      unint64_t v18 = v17;
    }
    else {
      unint64_t v18 = v10;
    }
    [(CAMAnalyticsVisionSession *)self _setMaxAppClipCodeCount:v18];
  }
  else
  {
    BOOL v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CAMAnalyticsVisionSession countButtonPressForMRC:action:](a2);
    }
  }
}

- (void)publish
{
  uint64_t v3 = [(CAMAnalyticsEvent *)self _eventMap];
  double Current = CFAbsoluteTimeGetCurrent();
  [(CAMAnalyticsVisionSession *)self _startTime];
  double v6 = Current - v5;
  id v7 = [NSNumber numberWithDouble:v6];
  [v3 setObject:v7 forKeyedSubscript:@"duration"];

  uint64_t v8 = [(id)objc_opt_class() durationRangeStringForDuration:v6];
  [v3 setObject:v8 forKeyedSubscript:@"durationRange"];

  if ([(CAMAnalyticsVisionSession *)self _isTextDetectionEnabled])
  {
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAMAnalyticsVisionSession _bucketedCount:](self, "_bucketedCount:", -[CAMAnalyticsVisionSession _textButtonPressCount](self, "_textButtonPressCount")));
    [v3 setObject:v9 forKeyedSubscript:@"textButtonPressCount"];

    unint64_t v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAMAnalyticsVisionSession _bucketedCount:](self, "_bucketedCount:", -[CAMAnalyticsVisionSession _maxTextRegionCount](self, "_maxTextRegionCount")));
    [v3 setObject:v10 forKeyedSubscript:@"maxTextRegionCount"];

    unint64_t v11 = objc_msgSend(NSNumber, "numberWithInt:", -[CAMAnalyticsVisionSession _textButtonPressCount](self, "_textButtonPressCount") != 0);
    [v3 setObject:v11 forKeyedSubscript:@"didInteractWithText"];

    uint64_t v12 = objc_msgSend(NSNumber, "numberWithInt:", -[CAMAnalyticsVisionSession _maxTextRegionCount](self, "_maxTextRegionCount") != 0);
    [v3 setObject:v12 forKeyedSubscript:@"didObserveText"];
  }
  if ([(CAMAnalyticsVisionSession *)self _isMRCDetectionEnabled])
  {
    v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAMAnalyticsVisionSession _bucketedCount:](self, "_bucketedCount:", -[CAMAnalyticsVisionSession _qrButtonPressCount](self, "_qrButtonPressCount")));
    [v3 setObject:v13 forKeyedSubscript:@"qrButtonPressCount"];

    uint64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAMAnalyticsVisionSession _bucketedCount:](self, "_bucketedCount:", -[CAMAnalyticsVisionSession _appClipButtonPressCount](self, "_appClipButtonPressCount")));
    [v3 setObject:v14 forKeyedSubscript:@"appClipButtonPressCount"];

    unint64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAMAnalyticsVisionSession _bucketedCount:](self, "_bucketedCount:", -[CAMAnalyticsVisionSession _qrPillPressCount](self, "_qrPillPressCount")));
    [v3 setObject:v15 forKeyedSubscript:@"qrPillPressCount"];

    unint64_t v16 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAMAnalyticsVisionSession _bucketedCount:](self, "_bucketedCount:", -[CAMAnalyticsVisionSession _appClipPillPressCount](self, "_appClipPillPressCount")));
    [v3 setObject:v16 forKeyedSubscript:@"appClipPillPressCount"];

    unint64_t v17 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAMAnalyticsVisionSession _bucketedCount:](self, "_bucketedCount:", -[CAMAnalyticsVisionSession _maxQRCodeCount](self, "_maxQRCodeCount")));
    [v3 setObject:v17 forKeyedSubscript:@"maxQRCodeCount"];

    unint64_t v18 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAMAnalyticsVisionSession _bucketedCount:](self, "_bucketedCount:", -[CAMAnalyticsVisionSession _maxAppClipCodeCount](self, "_maxAppClipCodeCount")));
    [v3 setObject:v18 forKeyedSubscript:@"maxAppClipCodeCount"];

    long long v19 = NSNumber;
    if ([(CAMAnalyticsVisionSession *)self _qrButtonPressCount]) {
      BOOL v20 = 1;
    }
    else {
      BOOL v20 = [(CAMAnalyticsVisionSession *)self _qrPillPressCount] != 0;
    }
    long long v21 = [v19 numberWithInt:v20];
    [v3 setObject:v21 forKeyedSubscript:@"didInteractWithQR"];

    long long v22 = NSNumber;
    if ([(CAMAnalyticsVisionSession *)self _appClipButtonPressCount]) {
      BOOL v23 = 1;
    }
    else {
      BOOL v23 = [(CAMAnalyticsVisionSession *)self _appClipPillPressCount] != 0;
    }
    uint64_t v24 = [v22 numberWithInt:v23];
    [v3 setObject:v24 forKeyedSubscript:@"didInteractWithAppClip"];

    v25 = objc_msgSend(NSNumber, "numberWithInt:", -[CAMAnalyticsVisionSession _maxQRCodeCount](self, "_maxQRCodeCount") != 0);
    [v3 setObject:v25 forKeyedSubscript:@"didObserveQR"];

    v26 = objc_msgSend(NSNumber, "numberWithInt:", -[CAMAnalyticsVisionSession _maxAppClipCodeCount](self, "_maxAppClipCodeCount") != 0);
    [v3 setObject:v26 forKeyedSubscript:@"didObserveAppClip"];

    v27 = [(CAMAnalyticsVisionSession *)self _pressedQRTypes];
    v28 = [(CAMAnalyticsVisionSession *)self _analyticsValueForQRTypes:v27];
    [v3 setObject:v28 forKeyedSubscript:@"pressedQRTypes"];
  }
  if ([(CAMAnalyticsVisionSession *)self _isDocumentScanningEnabled])
  {
    v29 = objc_msgSend(NSNumber, "numberWithInt:", -[CAMAnalyticsVisionSession _countObservedDocuments](self, "_countObservedDocuments") != 0);
    [v3 setObject:v29 forKeyedSubscript:@"didObserveDocuments"];

    v30 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAMAnalyticsVisionSession _bucketedCount:](self, "_bucketedCount:", -[CAMAnalyticsVisionSession _countDocumentScanningPressCount](self, "_countDocumentScanningPressCount")));
    [v3 setObject:v30 forKeyedSubscript:@"documentScanningPressCount"];

    v31 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAMAnalyticsVisionSession _bucketedCount:](self, "_bucketedCount:", -[CAMAnalyticsVisionSession _countDocumentScanningCompletedScans](self, "_countDocumentScanningCompletedScans")));
    [v3 setObject:v31 forKeyedSubscript:@"documentScanningCompletedScans"];

    v32 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAMAnalyticsVisionSession _bucketedCount:](self, "_bucketedCount:", -[CAMAnalyticsVisionSession _countDocumentScanningCanceledScans](self, "_countDocumentScanningCanceledScans")));
    [v3 setObject:v32 forKeyedSubscript:@"documentScaningCanceledScans"];
  }
  v33.receiver = self;
  v33.super_class = (Class)CAMAnalyticsVisionSession;
  [(CAMAnalyticsEvent *)&v33 publish];
}

- (int64_t)_bucketedCount:(int64_t)a3
{
  [(id)objc_opt_class() bucketedPowerOf2ForValue:1 allowZero:(double)a3 minPositiveValue:1.0 maxValue:64.0];
  return (uint64_t)v3;
}

- (void)_countMRCTypeForAction:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(CAMAnalyticsVisionSession *)self _pressedQRTypes];
  if (!v4)
  {
    uint64_t v4 = [MEMORY[0x263EFF9C0] set];
    [(CAMAnalyticsVisionSession *)self _setPressedMRCTypes:v4];
  }
  double v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "payloadDataType"));
  [v4 addObject:v5];
}

- (id)_analyticsValueForQRTypes:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v4 = (void *)MEMORY[0x263F08B30];
    id v5 = a3;
    id v6 = [v4 sortDescriptorWithKey:@"integerValue" ascending:1];
    v18[0] = v6;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    uint64_t v8 = [v5 sortedArrayUsingDescriptors:v7];

    uint64_t v9 = [MEMORY[0x263F089D8] string];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __55__CAMAnalyticsVisionSession__analyticsValueForQRTypes___block_invoke;
    v15[3] = &unk_263FA09C0;
    v15[4] = self;
    id v10 = v9;
    id v16 = v10;
    unint64_t v17 = v8;
    id v11 = v8;
    [v11 enumerateObjectsUsingBlock:v15];
    uint64_t v12 = v17;
    id v13 = v10;
  }
  else
  {
    id v13 = 0;
  }
  return v13;
}

void __55__CAMAnalyticsVisionSession__analyticsValueForQRTypes___block_invoke(id *a1, void *a2, unint64_t a3)
{
  objc_msgSend(a1[4], "_analyticsValueForQRType:", objc_msgSend(a2, "integerValue"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "appendString:");
  if ([a1[6] count] - 1 > a3) {
    [a1[5] appendString:@","];
  }
}

- (id)_analyticsValueForQRType:(int64_t)a3
{
  if ((unint64_t)a3 >= 0xF)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld", a3);
    double v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v3 = off_263FA09E0[a3];
  }
  return v3;
}

- (unint64_t)totalMRCInteractions
{
  unint64_t v3 = [(CAMAnalyticsVisionSession *)self _qrPillPressCount];
  unint64_t v4 = [(CAMAnalyticsVisionSession *)self _appClipPillPressCount] + v3;
  unint64_t v5 = [(CAMAnalyticsVisionSession *)self _qrButtonPressCount];
  return v4 + v5 + [(CAMAnalyticsVisionSession *)self _appClipPillPressCount];
}

- (void)countObservedDocumentScanning
{
  unint64_t v3 = [(CAMAnalyticsVisionSession *)self _countObservedDocuments] + 1;
  [(CAMAnalyticsVisionSession *)self _setCountObservedDocuments:v3];
}

- (void)countButtonPressForDocumentScanning
{
  unint64_t v3 = [(CAMAnalyticsVisionSession *)self _countDocumentScanningPressCount] + 1;
  [(CAMAnalyticsVisionSession *)self _setCountDocumentScanningPressCount:v3];
}

- (void)countDocumentScanningCompletedScans
{
  unint64_t v3 = [(CAMAnalyticsVisionSession *)self _countDocumentScanningCompletedScans]
     + 1;
  [(CAMAnalyticsVisionSession *)self _setCountDocumentScanningCompletedScans:v3];
}

- (void)countDocumentScanningCanceledScans
{
  unint64_t v3 = [(CAMAnalyticsVisionSession *)self _countDocumentScanningCanceledScans] + 1;
  [(CAMAnalyticsVisionSession *)self _setCountDocumentScanningCanceleddScans:v3];
}

- (BOOL)_isTextDetectionEnabled
{
  return self->__textDetectionEnabled;
}

- (BOOL)_isMRCDetectionEnabled
{
  return self->__MRCDetectionEnabled;
}

- (BOOL)_isDocumentScanningEnabled
{
  return self->__documentScanningEnabled;
}

- (double)_startTime
{
  return self->__startTime;
}

- (void)_setStartTime:(double)a3
{
  self->__startTime = a3;
}

- (unint64_t)_textButtonPressCount
{
  return self->__textButtonPressCount;
}

- (void)_setTextButtonPressCount:(unint64_t)a3
{
  self->__textButtonPressCount = a3;
}

- (unint64_t)_qrButtonPressCount
{
  return self->__qrButtonPressCount;
}

- (void)_setQRButtonPressCount:(unint64_t)a3
{
  self->__qrButtonPressCount = a3;
}

- (unint64_t)_appClipButtonPressCount
{
  return self->__appClipButtonPressCount;
}

- (void)_setAppClipButtonPressCount:(unint64_t)a3
{
  self->__appClipButtonPressCount = a3;
}

- (unint64_t)_qrPillPressCount
{
  return self->__qrPillPressCount;
}

- (void)_setQRPillPressCount:(unint64_t)a3
{
  self->__qrPillPressCount = a3;
}

- (unint64_t)_appClipPillPressCount
{
  return self->__appClipPillPressCount;
}

- (void)_setAppClipPillPressCount:(unint64_t)a3
{
  self->__appClipPillPressCount = a3;
}

- (unint64_t)_maxTextRegionCount
{
  return self->__maxTextRegionCount;
}

- (void)_setMaxTextRegionCount:(unint64_t)a3
{
  self->__maxTextRegionCount = a3;
}

- (unint64_t)_maxQRCodeCount
{
  return self->__maxQRCodeCount;
}

- (void)_setMaxQRCodeCount:(unint64_t)a3
{
  self->__maxQRCodeCount = a3;
}

- (unint64_t)_maxAppClipCodeCount
{
  return self->__maxAppClipCodeCount;
}

- (void)_setMaxAppClipCodeCount:(unint64_t)a3
{
  self->__maxAppClipCodeCount = a3;
}

- (NSMutableSet)_pressedQRTypes
{
  return self->__pressedQRTypes;
}

- (void)_setPressedMRCTypes:(id)a3
{
}

- (unint64_t)_countObservedDocuments
{
  return self->__countObservedDocuments;
}

- (void)_setCountObservedDocuments:(unint64_t)a3
{
  self->__countObservedDocuments = a3;
}

- (unint64_t)_countDocumentScanningPressCount
{
  return self->__countDocumentScanningPressCount;
}

- (void)_setCountDocumentScanningPressCount:(unint64_t)a3
{
  self->__countDocumentScanningPressCount = a3;
}

- (unint64_t)_countDocumentScanningCompletedScans
{
  return self->__countDocumentScanningCompletedScans;
}

- (void)_setCountDocumentScanningCompletedScans:(unint64_t)a3
{
  self->__countDocumentScanningCompletedScans = a3;
}

- (unint64_t)_countDocumentScanningCanceledScans
{
  return self->__countDocumentScanningCanceledScans;
}

- (void)_setCountDocumentScanningCanceleddScans:(unint64_t)a3
{
  self->__countDocumentScanningCanceledScans = a3;
}

- (void).cxx_destruct
{
}

- (void)countButtonPressForMRC:(const char *)a1 action:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2099F8000, v2, v3, "%{public}@ called when MRC detection is disabled", v4, v5, v6, v7, v8);
}

@end