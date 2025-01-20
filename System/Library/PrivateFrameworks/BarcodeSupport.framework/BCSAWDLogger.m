@interface BCSAWDLogger
+ (id)sharedLogger;
- (id)barcodeDetectedEventForAction:(id)a3;
- (int)_awdBarcodeClientType;
- (int)_awdBarcodeDataTypeFromAction:(id)a3;
- (int)_awdBarcodePreferredAppLinkOpenStrategyFromURLAction:(id)a3;
- (int)_awdBarcodeSourceTypeForAction:(id)a3;
- (int)_awdBarcodeURLTypeFromURLAction:(id)a3;
- (int)_awdInvalidBarcodeDataTypeFromInvalidData:(id)a3;
- (void)logBarcodeActivatedEventForAction:(id)a3;
- (void)logBarcodeDetectedEvent:(id)a3 startTime:(unint64_t)a4;
- (void)logBarcodeDetectedEventForAction:(id)a3 startTime:(unint64_t)a4;
- (void)logBarcodePreviewedEventForContentType:(int64_t)a3;
@end

@implementation BCSAWDLogger

+ (id)sharedLogger
{
  return +[BCSAnalyticsLogger sharedLogger];
}

- (id)barcodeDetectedEventForAction:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(AWDBarcodeSupportCodeDetectedEvent);
  [(AWDBarcodeSupportCodeDetectedEvent *)v5 setClientType:[(BCSAWDLogger *)self _awdBarcodeClientType]];
  [(AWDBarcodeSupportCodeDetectedEvent *)v5 setBarcodeSourceType:[(BCSAWDLogger *)self _awdBarcodeSourceTypeForAction:v4]];
  [(AWDBarcodeSupportCodeDetectedEvent *)v5 setBarcodeDataType:[(BCSAWDLogger *)self _awdBarcodeDataTypeFromAction:v4]];
  v6 = [v4 data];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8 = [v4 data];
    [(AWDBarcodeSupportCodeDetectedEvent *)v5 setInvalidBarcodeDataType:[(BCSAWDLogger *)self _awdInvalidBarcodeDataTypeFromInvalidData:v8]];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v4;
    [(AWDBarcodeSupportCodeDetectedEvent *)v5 setBarcodeURLType:[(BCSAWDLogger *)self _awdBarcodeURLTypeFromURLAction:v9]];
    uint64_t v10 = [(BCSAWDLogger *)self _awdBarcodePreferredAppLinkOpenStrategyFromURLAction:v9];

    [(AWDBarcodeSupportCodeDetectedEvent *)v5 setAppLinkPreferredOpenStrategy:v10];
  }

  return v5;
}

- (void)logBarcodeDetectedEvent:(id)a3 startTime:(unint64_t)a4
{
  id v5 = a3;
  [v5 setDetectionTimeMs:(clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) - a4) / 0xF4240];
  AWDPostMetric();
  LODWORD(a4) = [v5 barcodeDataType];
  BOOL v6 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
  if (a4)
  {
    if (v6) {
      -[BCSAWDLogger logBarcodeDetectedEvent:startTime:](v5);
    }
  }
  else if (v6)
  {
    -[BCSAWDLogger logBarcodeDetectedEvent:startTime:](v5);
  }
}

- (void)logBarcodeDetectedEventForAction:(id)a3 startTime:(unint64_t)a4
{
  id v6 = [(BCSAWDLogger *)self barcodeDetectedEventForAction:a3];
  [(BCSAWDLogger *)self logBarcodeDetectedEvent:v6 startTime:a4];
}

- (void)logBarcodeActivatedEventForAction:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = objc_alloc_init(AWDBarcodeSupportCodeActivatedEvent);
    [(AWDBarcodeSupportCodeActivatedEvent *)v5 setClientType:[(BCSAWDLogger *)self _awdBarcodeClientType]];
    [(AWDBarcodeSupportCodeActivatedEvent *)v5 setBarcodeSourceType:[(BCSAWDLogger *)self _awdBarcodeSourceTypeForAction:v4]];
    [(AWDBarcodeSupportCodeActivatedEvent *)v5 setBarcodeDataType:[(BCSAWDLogger *)self _awdBarcodeDataTypeFromAction:v4]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      [(AWDBarcodeSupportCodeActivatedEvent *)v5 setBarcodeURLType:[(BCSAWDLogger *)self _awdBarcodeURLTypeFromURLAction:v6]];
      uint64_t v7 = [(BCSAWDLogger *)self _awdBarcodePreferredAppLinkOpenStrategyFromURLAction:v6];

      [(AWDBarcodeSupportCodeActivatedEvent *)v5 setAppLinkActivationOpenStrategy:v7];
    }
    AWDPostMetric();
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      -[BCSAWDLogger logBarcodeActivatedEventForAction:](v5);
    }
  }
}

- (void)logBarcodePreviewedEventForContentType:(int64_t)a3
{
  id v4 = objc_alloc_init(AWDBarcodeSupportCodePreviewedEvent);
  [(AWDBarcodeSupportCodePreviewedEvent *)v4 setPreviewContentType:a3];
  AWDPostMetric();
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    -[BCSAWDLogger logBarcodePreviewedEventForContentType:]();
  }
}

- (int)_awdBarcodeDataTypeFromAction:(id)a3
{
  v3 = [a3 data];
  unint64_t v4 = [v3 type];

  if (v4 > 0x10) {
    return 11;
  }
  else {
    return dword_223045490[v4];
  }
}

- (int)_awdBarcodeClientType
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 bundleIdentifier];

  if ([v3 isEqualToString:@"com.apple.BarcodeSupport.BarcodeNotificationService"])
  {
    int v4 = 1;
  }
  else if (_bcs_isCurrentProcessSafari())
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)_awdBarcodeSourceTypeForAction:(id)a3
{
  if (([a3 codeType] & 0xFFFFFFFFFFFFFFFELL) == 2) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int)_awdInvalidBarcodeDataTypeFromInvalidData:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  switch([v3 invalidDataType])
  {
    case 0:
    case 10:
    case 11:
    case 12:
    case 15:
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[BCSAWDLogger _awdInvalidBarcodeDataTypeFromInvalidData:](v3);
      }
      int v4 = 0;
      break;
    case 2:
      int v4 = 2;
      break;
    case 3:
      int v4 = 3;
      break;
    case 4:
      int v4 = 4;
      break;
    case 5:
      int v4 = 5;
      break;
    case 6:
      int v4 = 6;
      break;
    case 7:
      int v4 = 7;
      break;
    case 8:
      int v4 = 8;
      break;
    case 9:
      int v4 = 9;
      break;
    default:
      break;
  }

  return v4;
}

- (int)_awdBarcodeURLTypeFromURLAction:(id)a3
{
  uint64_t v3 = [a3 appLinkCount];
  if (v3 == 1) {
    return 1;
  }
  else {
    return 2 * (v3 != 0);
  }
}

- (int)_awdBarcodePreferredAppLinkOpenStrategyFromURLAction:(id)a3
{
  return [a3 mustOpenAppLinkInApp];
}

- (void)logBarcodeDetectedEvent:(void *)a1 startTime:.cold.1(void *a1)
{
  [a1 barcodeDataType];
  [a1 clientType];
  [a1 barcodeSourceType];
  [a1 detectionTimeMs];
  [a1 barcodeURLType];
  [a1 appLinkPreferredOpenStrategy];
  [a1 invalidBarcodeDataType];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x30u);
}

- (void)logBarcodeDetectedEvent:(void *)a1 startTime:.cold.2(void *a1)
{
  [a1 barcodeDataType];
  [a1 clientType];
  [a1 barcodeSourceType];
  [a1 detectionTimeMs];
  [a1 barcodeURLType];
  [a1 appLinkPreferredOpenStrategy];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x2Au);
}

- (void)logBarcodeActivatedEventForAction:(void *)a1 .cold.1(void *a1)
{
  [a1 barcodeDataType];
  [a1 clientType];
  [a1 barcodeSourceType];
  [a1 barcodeURLType];
  [a1 appLinkActivationOpenStrategy];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x20u);
}

- (void)logBarcodePreviewedEventForContentType:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0xCu);
}

- (void)_awdInvalidBarcodeDataTypeFromInvalidData:(void *)a1 .cold.1(void *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 134217984;
  uint64_t v2 = [a1 invalidDataType];
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSAWDLogger: Encountered invalid invalidDataType: %ld", (uint8_t *)&v1, 0xCu);
}

@end