@interface ASTUIGazeEnrollmentStore
- (BOOL)enrollmentComplete;
- (NSArray)calibratedArray;
- (id)_retrieveDictionary;
- (void)clearStore;
- (void)saveCalibratedArray:(id)a3;
- (void)saveEnrollmentCompleted:(BOOL)a3;
- (void)saveEnrollmentPoint:(CGPoint)a3 withGazePoint:(CGPoint)a4;
@end

@implementation ASTUIGazeEnrollmentStore

- (NSArray)calibratedArray
{
  v2 = [MEMORY[0x263F22938] sharedInstance];
  v3 = [v2 assistiveTouchMouseOnDeviceEyeTrackingCalibratedValues];

  return (NSArray *)v3;
}

- (BOOL)enrollmentComplete
{
  v2 = [MEMORY[0x263F22938] sharedInstance];
  char v3 = [v2 assistiveTouchMouseOnDeviceEyeTrackingEnrollmentCompleted];

  return v3;
}

- (void)saveEnrollmentPoint:(CGPoint)a3 withGazePoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", a3.x, a3.y);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", x, y);
  v7 = [MEMORY[0x263F22938] sharedInstance];
  v8 = [v7 assistiveTouchMouseOnDeviceEyeTrackingEnrollmentPointToGazePointMap];
  v9 = (void *)[v8 mutableCopy];

  if (!v9)
  {
    v9 = [MEMORY[0x263EFF9A0] dictionary];
  }
  v10 = [MEMORY[0x263F08910] archivedDataWithRootObject:v15 requiringSecureCoding:1 error:0];
  v11 = [MEMORY[0x263F08910] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
  v12 = [v10 base64EncodedStringWithOptions:0];
  v13 = [v11 base64EncodedStringWithOptions:0];
  [v9 setObject:v13 forKey:v12];
  v14 = [MEMORY[0x263F22938] sharedInstance];
  [v14 setAssistiveTouchMouseOnDeviceEyeTrackingEnrollmentPointToGazePointMap:v9];
}

- (void)saveCalibratedArray:(id)a3
{
  char v3 = (void *)MEMORY[0x263F22938];
  id v4 = a3;
  v5 = [v3 sharedInstance];
  [v5 setAssistiveTouchMouseOnDeviceEyeTrackingCalibratedValues:v4];

  id v6 = [MEMORY[0x263F22938] sharedInstance];
  [v6 setAssistiveTouchMouseOnDeviceEyeTrackingEnrollmentPointToGazePointMap:0];
}

- (void)saveEnrollmentCompleted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x263F22938] sharedInstance];
  [v4 setAssistiveTouchMouseOnDeviceEyeTrackingEnrollmentCompleted:v3];
}

- (void)clearStore
{
  v2 = [MEMORY[0x263F22938] sharedInstance];
  [v2 setAssistiveTouchMouseOnDeviceEyeTrackingEnrollmentCompleted:0];

  BOOL v3 = [MEMORY[0x263F22938] sharedInstance];
  [v3 setAssistiveTouchMouseOnDeviceEyeTrackingCalibratedValues:0];

  id v4 = [MEMORY[0x263F22938] sharedInstance];
  [v4 setAssistiveTouchMouseOnDeviceEyeTrackingEnrollmentPointToGazePointMap:0];
}

- (id)_retrieveDictionary
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F22938] sharedInstance];
  BOOL v3 = [v2 assistiveTouchMouseOnDeviceEyeTrackingEnrollmentPointToGazePointMap];

  id v18 = [MEMORY[0x263EFF9A0] dictionary];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v19 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v19) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v9 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v8 options:0];
        id v10 = objc_alloc(MEMORY[0x263EFF8F8]);
        v11 = [v4 objectForKeyedSubscript:v8];
        v12 = (void *)[v10 initWithBase64EncodedString:v11 options:0];

        v13 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:0];
        uint64_t v14 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v12 error:0];
        id v15 = (void *)v14;
        if (v13) {
          BOOL v16 = v14 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (!v16) {
          [v18 setObject:v14 forKey:v13];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  return v18;
}

@end