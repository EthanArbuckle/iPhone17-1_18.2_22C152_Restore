@interface VNValidationUtilities
+ (BOOL)_validateDetectedObjectObservations:(id)a3 forObservationClass:(Class)a4 withMinimumCount:(unint64_t)a5 forOptionalRequest:(id)a6 error:(id *)a7;
+ (BOOL)_validateFaceObservations:(id)a3 withMinimumCount:(unint64_t)a4 forOptionalRequest:(id)a5 error:(id *)a6;
+ (BOOL)getArray:(id *)a3 forKey:(id)a4 inOptions:(id)a5 withElementsOfClass:(Class)a6 requiredMinimumCount:(unint64_t)a7 allowedMaximumCount:(unint64_t)a8 error:(id *)a9;
+ (BOOL)getBOOLValue:(BOOL *)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6;
+ (BOOL)getBOOLValue:(BOOL *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(BOOL)a6 error:(id *)a7;
+ (BOOL)getDoubleValue:(double *)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6;
+ (BOOL)getDoubleValue:(double *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(double)a6 error:(id *)a7;
+ (BOOL)getEspressoPriority:(int *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(int)a6 error:(id *)a7;
+ (BOOL)getFloatValue:(float *)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6;
+ (BOOL)getFloatValue:(float *)a3 forKey:(id)a4 inOptions:(id)a5 minimumValue:(float)a6 maximumValue:(float)a7 error:(id *)a8;
+ (BOOL)getFloatValue:(float *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(float)a6 error:(id *)a7;
+ (BOOL)getIntValue:(int *)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6;
+ (BOOL)getIntValue:(int *)a3 forKey:(id)a4 inOptions:(id)a5 minimumValue:(int)a6 maximumValue:(int)a7 error:(id *)a8;
+ (BOOL)getIntValue:(int *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(int)a6 error:(id *)a7;
+ (BOOL)getMTLGPUPriority:(unint64_t *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(unint64_t)a6 error:(id *)a7;
+ (BOOL)getNSIntegerValue:(int64_t *)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6;
+ (BOOL)getNSIntegerValue:(int64_t *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(int64_t)a6 error:(id *)a7;
+ (BOOL)getNSUIntegerValue:(unint64_t *)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6;
+ (BOOL)getNSUIntegerValue:(unint64_t *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(unint64_t)a6 error:(id *)a7;
+ (BOOL)getOSTypeValue:(unsigned int *)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6;
+ (BOOL)getOSTypeValue:(unsigned int *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(unsigned int)a6 error:(id *)a7;
+ (BOOL)getOptionalArray:(id *)a3 forKey:(id)a4 inOptions:(id)a5 withElementsOfClass:(Class)a6 error:(id *)a7;
+ (BOOL)getOptionalFaceObservation:(id *)a3 inOptions:(id)a4 error:(id *)a5;
+ (BOOL)getOptionalFaceObservations:(id *)a3 inOptions:(id)a4 error:(id *)a5;
+ (BOOL)getOptionalObject:(id *)a3 ofClass:(Class)a4 forKey:(id)a5 inOptions:(id)a6 error:(id *)a7;
+ (BOOL)getOptionalOriginatingRequestSpecifier:(id *)a3 forKey:(id)a4 inOptions:(id)a5 specifyingRequestClass:(Class)a6 error:(id *)a7;
+ (BOOL)getPercentageValue:(double *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(double)a6 error:(id *)a7;
+ (BOOL)validateArray:(id)a3 named:(id)a4 hasElementsOfClass:(Class)a5 requiredMinimumCount:(unint64_t)a6 allowedMaximumCount:(unint64_t)a7 error:(id *)a8;
+ (BOOL)validateAsyncStatusResult:(id)a3 error:(id *)a4;
+ (BOOL)validateAsyncStatusResults:(id)a3 error:(id *)a4;
+ (BOOL)validateAsyncStatusState:(id)a3 error:(id *)a4;
+ (BOOL)validateClassArray:(id)a3 named:(id)a4 hasElementsAncestoredFromClass:(Class)a5 requiredMinimumCount:(unint64_t)a6 allowedMaximumCount:(unint64_t)a7 error:(id *)a8;
+ (BOOL)validateNonNilOptionsDictionary:(id)a3 selector:(SEL)a4 error:(id *)a5;
+ (BOOL)validateNonZeroImageWidth:(unint64_t)a3 height:(unint64_t)a4 componentNameProvidingBlock:(id)a5 error:(id *)a6;
+ (BOOL)validateOptionalDetectedObjectObservations:(id)a3 forObservationClass:(Class)a4 error:(id *)a5;
+ (BOOL)validateOptionalDetectedObjectObservations:(id)a3 forObservationClass:(Class)a4 forRequest:(id)a5 error:(id *)a6;
+ (BOOL)validateOptionalFaceObservations:(id)a3 error:(id *)a4;
+ (BOOL)validateOptionalFaceObservations:(id)a3 forRequest:(id)a4 error:(id *)a5;
+ (BOOL)validateRequiredClusterIDs:(id)a3 error:(id *)a4;
+ (BOOL)validateRequiredDetectedObjectObservations:(id)a3 forObservationClass:(Class)a4 error:(id *)a5;
+ (BOOL)validateRequiredDetectedObjectObservations:(id)a3 forObservationClass:(Class)a4 forRequest:(id)a5 error:(id *)a6;
+ (BOOL)validateRequiredFaceObservations:(id)a3 error:(id *)a4;
+ (BOOL)validateRequiredFaceObservations:(id)a3 forRequest:(id)a4 error:(id *)a5;
+ (BOOL)validateScoreRange:(float)a3 named:(id)a4 error:(id *)a5;
+ (BOOL)validateVNConfidenceRange:(float)a3 error:(id *)a4;
+ (id)computeDeviceForKey:(id)a3 inOptions:(id)a4 error:(id *)a5;
+ (id)originatingRequestSpecifierForKey:(id)a3 inOptions:(id)a4 error:(id *)a5;
+ (id)originatingRequestSpecifierForKey:(id)a3 inOptions:(id)a4 specifyingRequestClass:(Class)a5 error:(id *)a6;
+ (id)originatingRequestSpecifierInOptions:(id)a3 error:(id *)a4;
+ (id)originatingRequestSpecifierInOptions:(id)a3 specifyingRequestClass:(Class)a4 error:(id *)a5;
+ (id)requiredArrayForKey:(id)a3 inOptions:(id)a4 withElementsOfClass:(Class)a5 error:(id *)a6;
+ (id)requiredDetectedObjectObservationInOptions:(id)a3 withOptionName:(id)a4 forObservationClass:(Class)a5 error:(id *)a6;
+ (id)requiredFaceObservationInOptions:(id)a3 error:(id *)a4;
+ (id)requiredFaceObservationsInOptions:(id)a3 error:(id *)a4;
+ (id)requiredObjectConformingToProtocol:(id)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6;
+ (id)requiredObjectOfClass:(Class)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6;
+ (id)requiredSessionInOptions:(id)a3 error:(id *)a4;
+ (int)espressoPriorityForModelExecutionPriority:(unint64_t)a3;
@end

@implementation VNValidationUtilities

+ (id)originatingRequestSpecifierInOptions:(id)a3 specifyingRequestClass:(Class)a4 error:(id *)a5
{
  v5 = [a1 originatingRequestSpecifierForKey:@"VNDetectorOption_OriginatingRequestSpecifier" inOptions:a3 specifyingRequestClass:a4 error:a5];

  return v5;
}

+ (id)originatingRequestSpecifierForKey:(id)a3 inOptions:(id)a4 specifyingRequestClass:(Class)a5 error:(id *)a6
{
  id v10 = a3;
  v11 = [a1 originatingRequestSpecifierForKey:v10 inOptions:a4 error:a6];
  v12 = v11;
  if (v11 && (_validateRequestSpecifierRequestClass(v11, a5, v10, (uint64_t)a6) & 1) != 0) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  return v13;
}

+ (id)originatingRequestSpecifierForKey:(id)a3 inOptions:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v14 = 0;
  v9 = (objc_class *)objc_opt_class();
  LODWORD(a5) = _getObjectFromOptionsDictionary(&v14, v8, v7, 1, v9, (uint64_t)a5);
  id v10 = v14;
  v11 = v10;
  if (!a5) {
    id v10 = 0;
  }
  id v12 = v10;

  return v12;
}

+ (BOOL)validateAsyncStatusState:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = v5;
  if (!v5)
  {
    if (a4)
    {
      v11 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Async status object is nil"];
LABEL_18:
      BOOL v13 = 0;
      *a4 = v11;
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  int v7 = [v5 completed];
  id v8 = [v6 error];

  if (v8) {
    int v9 = v7;
  }
  else {
    int v9 = 0;
  }
  if (v9 == 1)
  {
    if (a4)
    {
      id v10 = @"Async status object reported as completed successfully but with an error";
LABEL_17:
      v11 = +[VNError errorForInternalErrorWithLocalizedDescription:v10];
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if (v8) {
    char v12 = 1;
  }
  else {
    char v12 = v7;
  }
  if ((v12 & 1) == 0)
  {
    if (a4)
    {
      id v10 = @"Async status object reported as failed but without an error";
      goto LABEL_17;
    }
LABEL_19:
    BOOL v13 = 0;
    goto LABEL_20;
  }
  BOOL v13 = 1;
LABEL_20:

  return v13;
}

+ (id)computeDeviceForKey:(id)a3 inOptions:(id)a4 error:(id *)a5
{
  id v5 = [a1 requiredObjectConformingToProtocol:&unk_1EF7D2C18 forKey:a3 inOptions:a4 error:a5];

  return v5;
}

+ (id)requiredObjectConformingToProtocol:(id)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v10;
  BOOL v13 = (Protocol *)v9;
  id v14 = [v11 objectForKey:v12];
  v15 = v14;
  if (v14)
  {
    if ([v14 conformsToProtocol:v13])
    {
      a6 = v15;
      int v16 = 1;
      goto LABEL_10;
    }
    if (a6)
    {
      v19 = NSString;
      v20 = NSStringFromProtocol(v13);
      v17 = [v19 stringWithFormat:@"The %@ option was expected to conform to %@ (%@)", v12, v20, v15];

      v18 = +[VNError errorWithCode:5 message:v17];
      goto LABEL_8;
    }
  }
  else if (a6)
  {
    v17 = [NSString stringWithFormat:@"The %@ required option was not found", v12];
    v18 = +[VNError errorWithCode:7 message:v17];
LABEL_8:
    *a6 = v18;

    a6 = 0;
  }
  int v16 = 0;
LABEL_10:

  v21 = a6;
  v22 = v21;
  if (v16) {
    v23 = v21;
  }
  else {
    v23 = 0;
  }

  return v23;
}

+ (id)originatingRequestSpecifierInOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v11 = 0;
  v6 = (objc_class *)objc_opt_class();
  LODWORD(a4) = _getObjectFromOptionsDictionary(&v11, v5, @"VNDetectorOption_OriginatingRequestSpecifier", 1, v6, (uint64_t)a4);
  id v7 = v11;
  id v8 = v7;
  if (!a4) {
    id v7 = 0;
  }
  id v9 = v7;

  return v9;
}

+ (id)requiredObjectOfClass:(Class)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6
{
  id v11 = 0;
  int ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v11, a5, a4, 1, a3, (uint64_t)a6);
  id v7 = v11;
  id v8 = v7;
  if (!ObjectFromOptionsDictionary) {
    id v7 = 0;
  }
  id v9 = v7;

  return v9;
}

+ (BOOL)validateArray:(id)a3 named:(id)a4 hasElementsOfClass:(Class)a5 requiredMinimumCount:(unint64_t)a6 allowedMaximumCount:(unint64_t)a7 error:(id *)a8
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = (__CFString *)a4;
  if (v14) {
    v15 = v14;
  }
  else {
    v15 = @"array";
  }
  if (!v13)
  {
    if (!a8) {
      goto LABEL_16;
    }
    v17 = [NSString stringWithFormat:@"%@ is nil", v15];
    id v18 = +[VNError errorWithCode:14 message:v17];
    goto LABEL_14;
  }
  unint64_t v16 = [v13 count];
  if (v16 < a6)
  {
    if (!a8) {
      goto LABEL_16;
    }
    v17 = [NSString stringWithFormat:@"The %@ array has %lu items, which is less than the required count of %lu", v15, v16, a6];
    id v18 = +[VNError errorWithCode:5 message:v17];
    goto LABEL_14;
  }
  if (a7 && v16 > a7)
  {
    if (!a8) {
      goto LABEL_16;
    }
    v17 = [NSString stringWithFormat:@"The %@ array has %lu items, which is more than the maximum allowed of %lu", v15, v16, a7];
    id v18 = +[VNError errorWithCode:5 message:v17];
LABEL_14:
    *a8 = v18;

LABEL_15:
    LOBYTE(a8) = 0;
    goto LABEL_16;
  }
  if (a5)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v20 = v13;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(v20);
          }
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a8)
            {
              v24 = NSString;
              v25 = NSStringFromClass(a5);
              v26 = [v24 stringWithFormat:@"All elements in the %@ array must be of class %@ (%@)", v15, v25, v20];

              *a8 = +[VNError errorWithCode:5 message:v26];
            }
            goto LABEL_15;
          }
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }
  }
  LOBYTE(a8) = 1;
LABEL_16:

  return (char)a8;
}

+ (BOOL)getEspressoPriority:(int *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(int)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v18 = 0;
  id v13 = (objc_class *)objc_opt_class();
  char ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v18, v12, v11, 0, v13, (uint64_t)a7);
  id v15 = v18;
  unint64_t v16 = v15;
  if (ObjectFromOptionsDictionary)
  {
    if (v15) {
      a6 = objc_msgSend((id)objc_opt_class(), "espressoPriorityForModelExecutionPriority:", objc_msgSend(v15, "unsignedIntegerValue"));
    }
    if (a3) {
      *a3 = a6;
    }
  }

  return ObjectFromOptionsDictionary;
}

+ (int)espressoPriorityForModelExecutionPriority:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return 0;
  }
  else {
    return dword_1A4111DB8[a3 - 1];
  }
}

+ (BOOL)getOptionalOriginatingRequestSpecifier:(id *)a3 forKey:(id)a4 inOptions:(id)a5 specifyingRequestClass:(Class)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v18 = 0;
  LOBYTE(a1) = [a1 getOptionalObject:&v18 ofClass:objc_opt_class() forKey:v12 inOptions:v13 error:a7];
  id v14 = v18;
  id v15 = v14;
  if ((a1 & 1) != 0
    && (!v14 || _validateRequestSpecifierRequestClass(v14, a6, v12, (uint64_t)a7)))
  {
    *a3 = v15;
    BOOL v16 = 1;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

+ (id)requiredSessionInOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v11 = 0;
  v6 = (objc_class *)objc_opt_class();
  LODWORD(a4) = _getObjectFromOptionsDictionary(&v11, v5, @"VNDetectorProcessOption_Session", 1, v6, (uint64_t)a4);
  id v7 = v11;
  id v8 = v7;
  if (!a4) {
    id v7 = 0;
  }
  id v9 = v7;

  return v9;
}

+ (id)requiredDetectedObjectObservationInOptions:(id)a3 withOptionName:(id)a4 forObservationClass:(Class)a5 error:(id *)a6
{
  id v11 = 0;
  int v6 = [a1 getArray:&v11 forKey:a4 inOptions:a3 withElementsOfClass:a5 requiredMinimumCount:1 allowedMaximumCount:1 error:a6];
  id v7 = v11;
  id v8 = v7;
  id v9 = 0;
  if (v6)
  {
    id v9 = [v7 firstObject];
  }

  return v9;
}

+ (BOOL)getOptionalFaceObservations:(id *)a3 inOptions:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v15 = 0;
  id v9 = (objc_class *)objc_opt_class();
  char ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v15, v8, @"VNDetectorProcessOption_InputFaceObservations", 0, v9, (uint64_t)a5);
  id v11 = v15;
  id v12 = v11;
  if ((ObjectFromOptionsDictionary & 1) != 0
    && (!v11
     || [a1 validateArray:v11 named:@"VNDetectorProcessOption_InputFaceObservations" hasElementsOfClass:objc_opt_class() requiredMinimumCount:0 allowedMaximumCount:0 error:a5]))
  {
    *a3 = v12;
    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

+ (BOOL)getOptionalFaceObservation:(id *)a3 inOptions:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v17 = 0;
  id v9 = (objc_class *)objc_opt_class();
  char ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v17, v8, @"VNDetectorProcessOption_InputFaceObservations", 0, v9, (uint64_t)a5);
  id v11 = v17;
  id v12 = v11;
  if ((ObjectFromOptionsDictionary & 1) == 0) {
    goto LABEL_7;
  }
  if (!v11) {
    goto LABEL_9;
  }
  if ([a1 validateArray:v11 named:@"VNDetectorProcessOption_InputFaceObservations" hasElementsOfClass:objc_opt_class() requiredMinimumCount:0 allowedMaximumCount:0 error:a5])
  {
    unint64_t v13 = [v12 count];
    if (a5 && v13 >= 2)
    {
      id v14 = [NSString stringWithFormat:@"The options dictuionary contains (%lu) more than 1 VNFaceObservation(s) whiile only one is expected for key: %@", objc_msgSend(v12, "count"), @"VNDetectorProcessOption_InputFaceObservations"];
      *a5 = +[VNError errorWithCode:5 message:v14];

      goto LABEL_7;
    }
    +[VNError VNAssert:a3 != 0 log:@"faceObservationOut must not be NULL"];
    *a3 = [v12 firstObject];
LABEL_9:
    BOOL v15 = 1;
    goto LABEL_10;
  }
LABEL_7:
  BOOL v15 = 0;
LABEL_10:

  return v15;
}

+ (id)requiredFaceObservationsInOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v12 = 0;
  id v7 = (objc_class *)objc_opt_class();
  char ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v12, v6, @"VNDetectorProcessOption_InputFaceObservations", 1, v7, (uint64_t)a4);
  id v9 = v12;
  if ((ObjectFromOptionsDictionary & 1) != 0
    && [a1 validateArray:v9 named:@"VNDetectorProcessOption_InputFaceObservations" hasElementsOfClass:objc_opt_class() requiredMinimumCount:0 allowedMaximumCount:0 error:a4])
  {
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)requiredFaceObservationInOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v11 = 0;
  LOBYTE(a4) = [a1 getArray:&v11 forKey:@"VNDetectorProcessOption_InputFaceObservations" inOptions:v6 withElementsOfClass:objc_opt_class() requiredMinimumCount:1 allowedMaximumCount:1 error:a4];
  id v7 = v11;
  id v8 = v7;
  if (a4)
  {
    id v9 = [v7 firstObject];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)requiredArrayForKey:(id)a3 inOptions:(id)a4 withElementsOfClass:(Class)a5 error:(id *)a6
{
  id v11 = 0;
  int v6 = [a1 getArray:&v11 forKey:a3 inOptions:a4 withElementsOfClass:a5 requiredMinimumCount:1 allowedMaximumCount:0 error:a6];
  id v7 = v11;
  id v8 = v7;
  id v9 = 0;
  if (v6) {
    id v9 = v7;
  }

  return v9;
}

+ (BOOL)getOptionalArray:(id *)a3 forKey:(id)a4 inOptions:(id)a5 withElementsOfClass:(Class)a6 error:(id *)a7
{
  return [a1 getArray:a3 forKey:a4 inOptions:a5 withElementsOfClass:a6 requiredMinimumCount:0 allowedMaximumCount:0 error:a7];
}

+ (BOOL)getArray:(id *)a3 forKey:(id)a4 inOptions:(id)a5 withElementsOfClass:(Class)a6 requiredMinimumCount:(unint64_t)a7 allowedMaximumCount:(unint64_t)a8 error:(id *)a9
{
  id v15 = a4;
  id v16 = a5;
  id v25 = 0;
  id v17 = (objc_class *)objc_opt_class();
  char ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v25, v16, v15, a7 != 0, v17, (uint64_t)a9);
  id v19 = v25;
  id v20 = v19;
  if ((ObjectFromOptionsDictionary & 1) == 0) {
    goto LABEL_8;
  }
  if (!v19) {
    id v20 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v21 = [v15 description];
  char v22 = [a1 validateArray:v20 named:v21 hasElementsOfClass:a6 requiredMinimumCount:a7 allowedMaximumCount:a8 error:a9];

  if (v22)
  {
    if (a3) {
      *a3 = (id)[v20 copy];
    }
    BOOL v23 = 1;
  }
  else
  {
LABEL_8:
    BOOL v23 = 0;
  }

  return v23;
}

+ (BOOL)getMTLGPUPriority:(unint64_t *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(unint64_t)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v18 = 0;
  unint64_t v13 = (objc_class *)objc_opt_class();
  char ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v18, v12, v11, 0, v13, (uint64_t)a7);
  id v15 = v18;
  id v16 = v15;
  if (ObjectFromOptionsDictionary)
  {
    if (v15) {
      a6 = [v15 unsignedIntegerValue];
    }
    if (a3) {
      *a3 = a6;
    }
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getOSTypeValue:(unsigned int *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(unsigned int)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v19 = 0;
  unint64_t v13 = (objc_class *)objc_opt_class();
  char ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v19, v12, v11, 0, v13, (uint64_t)a7);
  id v15 = v19;
  id v16 = v15;
  if (a3) {
    char v17 = ObjectFromOptionsDictionary;
  }
  else {
    char v17 = 0;
  }
  if (v17)
  {
    if (v15) {
      a6 = [v15 unsignedIntValue];
    }
    *a3 = a6;
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getOSTypeValue:(unsigned int *)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  id v17 = 0;
  id v11 = (objc_class *)objc_opt_class();
  char ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v17, v10, v9, 1, v11, (uint64_t)a6);
  id v13 = v17;
  id v14 = v13;
  if (a3) {
    char v15 = ObjectFromOptionsDictionary;
  }
  else {
    char v15 = 0;
  }
  if (v15) {
    *a3 = [v13 unsignedIntValue];
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getPercentageValue:(double *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(double)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  if (_validatePercentageValue(@"default value", a7, a6))
  {
    id v22 = 0;
    id v13 = (objc_class *)objc_opt_class();
    char ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v22, v12, v11, 0, v13, (uint64_t)a7);
    id v15 = v22;
    id v16 = v15;
    if ((ObjectFromOptionsDictionary & 1) != 0
      && (!v15
       || ([v15 doubleValue],
           a6 = v17,
           [v11 description],
           id v18 = objc_claimAutoreleasedReturnValue(),
           BOOL v19 = _validatePercentageValue(v18, a7, a6),
           v18,
           v19)))
    {
      if (a3) {
        *a3 = a6;
      }
      BOOL v20 = 1;
    }
    else
    {
      BOOL v20 = 0;
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

+ (BOOL)getFloatValue:(float *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(float)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v20 = 0;
  id v13 = (objc_class *)objc_opt_class();
  char ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v20, v12, v11, 0, v13, (uint64_t)a7);
  id v15 = v20;
  id v16 = v15;
  if (a3) {
    char v17 = ObjectFromOptionsDictionary;
  }
  else {
    char v17 = 0;
  }
  if (v17)
  {
    if (v15)
    {
      [v15 floatValue];
      a6 = v18;
    }
    *a3 = a6;
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getFloatValue:(float *)a3 forKey:(id)a4 inOptions:(id)a5 minimumValue:(float)a6 maximumValue:(float)a7 error:(id *)a8
{
  id v14 = a4;
  float v18 = 0.0;
  if (([a1 getFloatValue:&v18 forKey:v14 inOptions:a5 error:a8] & 1) == 0) {
    goto LABEL_8;
  }
  if (v18 >= a6 && v18 <= a7)
  {
    if (a3) {
      *a3 = v18;
    }
    LOBYTE(a8) = 1;
  }
  else if (a8)
  {
    id v16 = [NSString stringWithFormat:@"%@ is %f which is not in the range [%f..%f]", v14, v18, a6, a7];
    *a8 = +[VNError errorForOutOfBoundsErrorWithLocalizedDescription:v16];

LABEL_8:
    LOBYTE(a8) = 0;
  }

  return (char)a8;
}

+ (BOOL)getFloatValue:(float *)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  id v18 = 0;
  id v11 = (objc_class *)objc_opt_class();
  char ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v18, v10, v9, 1, v11, (uint64_t)a6);
  id v13 = v18;
  id v14 = v13;
  if (a3) {
    char v15 = ObjectFromOptionsDictionary;
  }
  else {
    char v15 = 0;
  }
  if (v15)
  {
    [v13 floatValue];
    *(_DWORD *)a3 = v16;
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getDoubleValue:(double *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(double)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v20 = 0;
  id v13 = (objc_class *)objc_opt_class();
  char ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v20, v12, v11, 0, v13, (uint64_t)a7);
  id v15 = v20;
  int v16 = v15;
  if (a3) {
    char v17 = ObjectFromOptionsDictionary;
  }
  else {
    char v17 = 0;
  }
  if (v17)
  {
    if (v15)
    {
      [v15 doubleValue];
      a6 = v18;
    }
    *a3 = a6;
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getDoubleValue:(double *)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  id v18 = 0;
  id v11 = (objc_class *)objc_opt_class();
  char ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v18, v10, v9, 1, v11, (uint64_t)a6);
  id v13 = v18;
  id v14 = v13;
  if (a3) {
    char v15 = ObjectFromOptionsDictionary;
  }
  else {
    char v15 = 0;
  }
  if (v15)
  {
    [v13 doubleValue];
    *(void *)a3 = v16;
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getIntValue:(int *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(int)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v19 = 0;
  id v13 = (objc_class *)objc_opt_class();
  char ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v19, v12, v11, 0, v13, (uint64_t)a7);
  id v15 = v19;
  uint64_t v16 = v15;
  if (a3) {
    char v17 = ObjectFromOptionsDictionary;
  }
  else {
    char v17 = 0;
  }
  if (v17)
  {
    if (v15) {
      a6 = [v15 intValue];
    }
    *a3 = a6;
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getIntValue:(int *)a3 forKey:(id)a4 inOptions:(id)a5 minimumValue:(int)a6 maximumValue:(int)a7 error:(id *)a8
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v10 = *(void *)&a6;
  id v14 = a4;
  int v18 = 0;
  if (([a1 getIntValue:&v18 forKey:v14 inOptions:a5 error:a8] & 1) == 0) {
    goto LABEL_8;
  }
  if (v18 >= (int)v10 && v18 <= (int)v9)
  {
    if (a3) {
      *a3 = v18;
    }
    LOBYTE(a8) = 1;
  }
  else if (a8)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%@ is %d which is not in the range [%d..%d]", v14, v18, v10, v9];
    *a8 = +[VNError errorForOutOfBoundsErrorWithLocalizedDescription:v16];

LABEL_8:
    LOBYTE(a8) = 0;
  }

  return (char)a8;
}

+ (BOOL)getIntValue:(int *)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  id v17 = 0;
  id v11 = (objc_class *)objc_opt_class();
  char ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v17, v10, v9, 1, v11, (uint64_t)a6);
  id v13 = v17;
  id v14 = v13;
  if (a3) {
    char v15 = ObjectFromOptionsDictionary;
  }
  else {
    char v15 = 0;
  }
  if (v15) {
    *a3 = [v13 intValue];
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getNSUIntegerValue:(unint64_t *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(unint64_t)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v19 = 0;
  id v13 = (objc_class *)objc_opt_class();
  char ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v19, v12, v11, 0, v13, (uint64_t)a7);
  id v15 = v19;
  uint64_t v16 = v15;
  if (a3) {
    char v17 = ObjectFromOptionsDictionary;
  }
  else {
    char v17 = 0;
  }
  if (v17)
  {
    if (v15) {
      a6 = [v15 unsignedIntegerValue];
    }
    *a3 = a6;
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getNSIntegerValue:(int64_t *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(int64_t)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v19 = 0;
  id v13 = (objc_class *)objc_opt_class();
  char ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v19, v12, v11, 0, v13, (uint64_t)a7);
  id v15 = v19;
  uint64_t v16 = v15;
  if (a3) {
    char v17 = ObjectFromOptionsDictionary;
  }
  else {
    char v17 = 0;
  }
  if (v17)
  {
    if (v15) {
      a6 = [v15 integerValue];
    }
    *a3 = a6;
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getNSUIntegerValue:(unint64_t *)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  id v17 = 0;
  id v11 = (objc_class *)objc_opt_class();
  char ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v17, v10, v9, 1, v11, (uint64_t)a6);
  id v13 = v17;
  id v14 = v13;
  if (a3) {
    char v15 = ObjectFromOptionsDictionary;
  }
  else {
    char v15 = 0;
  }
  if (v15) {
    *a3 = [v13 unsignedIntegerValue];
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getNSIntegerValue:(int64_t *)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  id v17 = 0;
  id v11 = (objc_class *)objc_opt_class();
  char ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v17, v10, v9, 1, v11, (uint64_t)a6);
  id v13 = v17;
  id v14 = v13;
  if (a3) {
    char v15 = ObjectFromOptionsDictionary;
  }
  else {
    char v15 = 0;
  }
  if (v15) {
    *a3 = [v13 integerValue];
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getBOOLValue:(BOOL *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(BOOL)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v19 = 0;
  id v13 = (objc_class *)objc_opt_class();
  char ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v19, v12, v11, 0, v13, (uint64_t)a7);
  id v15 = v19;
  uint64_t v16 = v15;
  if (a3) {
    char v17 = ObjectFromOptionsDictionary;
  }
  else {
    char v17 = 0;
  }
  if (v17)
  {
    if (v15) {
      a6 = [v15 BOOLValue];
    }
    *a3 = a6;
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getBOOLValue:(BOOL *)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  id v17 = 0;
  id v11 = (objc_class *)objc_opt_class();
  char ObjectFromOptionsDictionary = _getObjectFromOptionsDictionary(&v17, v10, v9, 1, v11, (uint64_t)a6);
  id v13 = v17;
  id v14 = v13;
  if (a3) {
    char v15 = ObjectFromOptionsDictionary;
  }
  else {
    char v15 = 0;
  }
  if (v15) {
    *a3 = [v13 BOOLValue];
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getOptionalObject:(id *)a3 ofClass:(Class)a4 forKey:(id)a5 inOptions:(id)a6 error:(id *)a7
{
  return _getObjectFromOptionsDictionary(a3, a6, a5, 0, a4, (uint64_t)a7);
}

+ (BOOL)validateAsyncStatusResults:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        if ((objc_msgSend(a1, "validateAsyncStatusResult:error:", *(void *)(*((void *)&v12 + 1) + 8 * i), a4, (void)v12) & 1) == 0)
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

+ (BOOL)validateNonNilOptionsDictionary:(id)a3 selector:(SEL)a4 error:(id *)a5
{
  id v7 = a3;
  if (!v7 && a5)
  {
    uint64_t v8 = NSString;
    id v9 = NSStringFromSelector(a4);
    BOOL v10 = [v8 stringWithFormat:@"%@ cannot be called with nil options", v9];

    *a5 = +[VNError errorForInvalidOperationWithLocalizedDescription:v10];
  }
  return v7 != 0;
}

+ (BOOL)validateAsyncStatusResult:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (+[VNValidationUtilities validateAsyncStatusState:v5 error:a4])
  {
    if ([v5 completed])
    {
      BOOL v6 = 1;
    }
    else if (a4)
    {
      [v5 error];
      BOOL v6 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    +[VNError VNAssert:0 log:@"Invalid async status state"];
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)validateScoreRange:(float)a3 named:(id)a4 error:(id *)a5
{
  id v7 = (__CFString *)a4;
  uint64_t v8 = v7;
  BOOL v9 = a3 <= 1.0 && a3 >= -1.0;
  if (!v9 && a5)
  {
    uint64_t v10 = [(__CFString *)v7 length];
    id v11 = @"score";
    if (v10) {
      id v11 = v8;
    }
    long long v12 = v11;
    long long v13 = [NSString stringWithFormat:@"The %@ value %f must be in the range [-1..1]", v12, a3];
    *a5 = +[VNError errorForOutOfBoundsErrorWithLocalizedDescription:v13];
  }
  return v9;
}

+ (BOOL)validateVNConfidenceRange:(float)a3 error:(id *)a4
{
  BOOL v4 = a3 <= 1.0 && a3 >= 0.0;
  if (!v4 && a4)
  {
    BOOL v6 = objc_msgSend(NSString, "stringWithFormat:", @"The confidence value %f must be in the range [0..1]", a3);
    *a4 = +[VNError errorForOutOfBoundsErrorWithLocalizedDescription:v6];
  }
  return v4;
}

+ (BOOL)validateRequiredClusterIDs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  LOBYTE(a4) = [a1 validateArray:v6 named:@"cluster IDs" hasElementsOfClass:objc_opt_class() requiredMinimumCount:1 allowedMaximumCount:0 error:a4];

  return (char)a4;
}

+ (BOOL)validateOptionalDetectedObjectObservations:(id)a3 forObservationClass:(Class)a4 forRequest:(id)a5 error:(id *)a6
{
  return [a1 _validateDetectedObjectObservations:a3 forObservationClass:a4 withMinimumCount:0 forOptionalRequest:a5 error:a6];
}

+ (BOOL)validateOptionalDetectedObjectObservations:(id)a3 forObservationClass:(Class)a4 error:(id *)a5
{
  return [a1 _validateDetectedObjectObservations:a3 forObservationClass:a4 withMinimumCount:0 forOptionalRequest:0 error:a5];
}

+ (BOOL)validateRequiredDetectedObjectObservations:(id)a3 forObservationClass:(Class)a4 forRequest:(id)a5 error:(id *)a6
{
  return [a1 _validateDetectedObjectObservations:a3 forObservationClass:a4 withMinimumCount:1 forOptionalRequest:a5 error:a6];
}

+ (BOOL)validateRequiredDetectedObjectObservations:(id)a3 forObservationClass:(Class)a4 error:(id *)a5
{
  return [a1 _validateDetectedObjectObservations:a3 forObservationClass:a4 withMinimumCount:1 forOptionalRequest:0 error:a5];
}

+ (BOOL)validateOptionalFaceObservations:(id)a3 forRequest:(id)a4 error:(id *)a5
{
  return [a1 _validateFaceObservations:a3 withMinimumCount:0 forOptionalRequest:a4 error:a5];
}

+ (BOOL)validateOptionalFaceObservations:(id)a3 error:(id *)a4
{
  return [a1 _validateFaceObservations:a3 withMinimumCount:0 forOptionalRequest:0 error:a4];
}

+ (BOOL)validateRequiredFaceObservations:(id)a3 forRequest:(id)a4 error:(id *)a5
{
  return [a1 _validateFaceObservations:a3 withMinimumCount:1 forOptionalRequest:a4 error:a5];
}

+ (BOOL)validateRequiredFaceObservations:(id)a3 error:(id *)a4
{
  return [a1 _validateFaceObservations:a3 withMinimumCount:1 forOptionalRequest:0 error:a4];
}

+ (BOOL)_validateDetectedObjectObservations:(id)a3 forObservationClass:(Class)a4 withMinimumCount:(unint64_t)a5 forOptionalRequest:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a6;
  if (v13)
  {
    long long v14 = NSString;
    long long v15 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v15);
    uint64_t v17 = [v14 stringWithFormat:@"%@ %@", v16, @"detected object observations"];
  }
  else
  {
    uint64_t v17 = @"detected object observations";
  }
  char v18 = [a1 validateArray:v12 named:v17 hasElementsOfClass:a4 requiredMinimumCount:a5 allowedMaximumCount:0 error:a7];

  return v18;
}

+ (BOOL)_validateFaceObservations:(id)a3 withMinimumCount:(unint64_t)a4 forOptionalRequest:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  if (v11)
  {
    id v12 = NSString;
    id v13 = (objc_class *)objc_opt_class();
    long long v14 = NSStringFromClass(v13);
    long long v15 = [v12 stringWithFormat:@"%@ %@", v14, @"face observations"];
  }
  else
  {
    long long v15 = @"face observations";
  }
  char v16 = [a1 validateArray:v10 named:v15 hasElementsOfClass:objc_opt_class() requiredMinimumCount:a4 allowedMaximumCount:0 error:a6];

  return v16;
}

+ (BOOL)validateClassArray:(id)a3 named:(id)a4 hasElementsAncestoredFromClass:(Class)a5 requiredMinimumCount:(unint64_t)a6 allowedMaximumCount:(unint64_t)a7 error:(id *)a8
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  long long v14 = (__CFString *)a4;
  if (a5)
  {
    if (([(objc_class *)a5 isSubclassOfClass:objc_opt_class()] & 1) == 0)
    {
      if (a8)
      {
        +[VNError errorForInvalidArgument:a5 named:@"expectedAncestoralClass"];
        BOOL v15 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
LABEL_19:
      BOOL v15 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    a5 = (Class)objc_opt_class();
  }
  if (!v14) {
    long long v14 = @"array";
  }
  if (!v13)
  {
    if (!a8) {
      goto LABEL_19;
    }
    uint64_t v17 = [NSString stringWithFormat:@"%@ is nil", v14];
    id v18 = +[VNError errorWithCode:14 message:v17];
    goto LABEL_18;
  }
  unint64_t v16 = [v13 count];
  if (v16 < a6)
  {
    if (!a8) {
      goto LABEL_19;
    }
    uint64_t v17 = [NSString stringWithFormat:@"The %@ array has %lu items, which is less than the required count of %lu", v14, v16, a6];
    id v18 = +[VNError errorWithCode:5 message:v17];
LABEL_18:
    *a8 = v18;

    goto LABEL_19;
  }
  if (a7 && v16 > a7)
  {
    if (!a8) {
      goto LABEL_19;
    }
    uint64_t v17 = [NSString stringWithFormat:@"The %@ array has %lu items, which is more than the maximum allowed of %lu", v14, v16, a7];
    id v18 = +[VNError errorWithCode:5 message:v17];
    goto LABEL_18;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v20 = v13;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v21)
  {
    BOOL v15 = 1;
    goto LABEL_38;
  }
  uint64_t v22 = *(void *)v28;
  while (2)
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      if (*(void *)v28 != v22) {
        objc_enumerationMutation(v20);
      }
      v24 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      if (!object_isClass(v24))
      {
        if (a8)
        {
          id v25 = [NSString stringWithFormat:@"All elements in the %@ array must be a Class object (%@)", v14, v20];
          v26 = +[VNError errorWithCode:5 message:v25];
LABEL_36:
          *a8 = v26;
        }
LABEL_37:
        BOOL v15 = 0;
        goto LABEL_38;
      }
      if (([v24 isSubclassOfClass:a5] & 1) == 0)
      {
        if (a8)
        {
          id v25 = [NSString stringWithFormat:@"All elements in the %@ array must be a VNRequest subclass (%@)", v14, v20];
          v26 = +[VNError errorWithCode:5 message:v25];
          goto LABEL_36;
        }
        goto LABEL_37;
      }
    }
    uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
    BOOL v15 = 1;
    if (v21) {
      continue;
    }
    break;
  }
LABEL_38:

LABEL_20:
  return v15;
}

+ (BOOL)validateNonZeroImageWidth:(unint64_t)a3 height:(unint64_t)a4 componentNameProvidingBlock:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = v9;
  if (a3) {
    BOOL v11 = a4 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  BOOL v12 = !v11;
  if (v11 && a6)
  {
    if (v9)
    {
      id v13 = (*((void (**)(id))v9 + 2))(v9);
    }
    else
    {
      id v13 = 0;
    }
    objc_msgSend(NSString, "stringWithFormat:", @"zero-dimensioned image (%ld x %ld)", a3, a4);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    id v15 = v13;
    if ([v15 length])
    {
      id v16 = [NSString stringWithFormat:@"%@ was given %@", v15, v14];
    }
    else
    {
      id v16 = v14;
    }
    uint64_t v17 = v16;

    *a6 = +[VNError errorWithCode:13 message:v17];
  }
  return v12;
}

@end