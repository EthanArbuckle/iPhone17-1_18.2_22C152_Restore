@interface AudioSystemInputsCommon
- (BOOL)isAccessoryDetectorActive;
- (BOOL)isHeadphonesDetectorActive;
- (BOOL)isMotionDetectorActive;
- (BOOL)isOrientationDetectorActive;
- (BOOL)isUsingDBValuesFromSystem;
- (BOOL)isUsingMeasurementMode;
- (BOOL)saveRawRecording;
- (BOOL)validateAndInitializeParameters:(id)a3;
- (BOOL)validateAndInitializeSpecifications:(id)a3;
- (Class)outputsClass;
- (NSArray)accessoryDetectorModelNumbers;
- (NSArray)sources;
- (NSMutableArray)sequences;
- (NSMutableDictionary)inputValueToName;
- (NSMutableDictionary)outputSpecifications;
- (NSNumber)fileDownloadTimeout;
- (NSNumber)motionDetectorThreshold;
- (NSNumber)orientationDetectorXThreshold;
- (NSNumber)orientationDetectorZThreshold;
- (NSNumber)sequenceTimeout;
- (id)makeOutputFromDictionary:(id)a3 validationFailed:(BOOL *)a4;
- (id)validOutputDeviceSet;
@end

@implementation AudioSystemInputsCommon

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4 = a3;
  char v54 = 0;
  v5 = &AudioServicesPlaySystemSoundWithOptions_ptr;
  v6 = +[NSSet setWithObject:objc_opt_class()];
  [v4 dk_arrayFromRequiredKey:@"sources" types:v6 maxLength:80 failed:&v54 validator:&stru_10001C6A8];
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  sources = self->_sources;
  self->_sources = v7;

  if (![(NSArray *)self->_sources count]) {
    char v54 = 1;
  }
  dword_100024418 = [(NSArray *)self->_sources count] - 1;
  v9 = +[NSSet setWithObject:objc_opt_class()];
  v48 = v4;
  v10 = [v4 dk_arrayFromRequiredKey:@"sequence" types:v9 maxLength:70 failed:&v54];

  v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  sequences = self->_sequences;
  self->_sequences = v11;

  v49 = v10;
  if ([v10 count])
  {
    unint64_t v13 = 0;
    do
    {
      v14 = [v10 objectAtIndexedSubscript:v13];
      id v15 = objc_alloc_init((Class)NSMutableArray);
      v16 = v5;
      v17 = [v5[151] setWithObject:objc_opt_class()];
      v18 = [v14 dk_arrayFromRequiredKey:@"outputs" types:v17 maxLength:70 failed:&v54];

      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v19 = v18;
      id v20 = [v19 countByEnumeratingWithState:&v50 objects:v57 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v51;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v51 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = [(AudioSystemInputsCommon *)self makeOutputFromDictionary:*(void *)(*((void *)&v50 + 1) + 8 * i) validationFailed:&v54];
            [v15 addObject:v24];
          }
          id v21 = [v19 countByEnumeratingWithState:&v50 objects:v57 count:16];
        }
        while (v21);
      }

      v25 = objc_alloc_init(Sequence);
      v26 = +[NSNumber numberWithInteger:v13];
      [(Sequence *)v25 setIndex:v26];

      [(Sequence *)v25 setOutputs:v15];
      [(NSMutableArray *)self->_sequences addObject:v25];

      ++v13;
      v10 = v49;
      v5 = v16;
    }
    while (v13 < (unint64_t)[v49 count]);
  }
  v27 = [v48 dk_dictionaryFromRequiredKey:@"interruptDetectors" failed:&v54];
  CFStringRef v55 = @"active";
  v56 = &__kCFBooleanFalse;
  v28 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
  v29 = [v27 dk_dictionaryFromKey:@"motion" defaultValue:v28 failed:&v54];
  self->_motionDetectorActive = [v29 dk_BOOLFromRequiredKey:@"active" failed:&v54];
  if (!v54 && [(AudioSystemInputsCommon *)self isMotionDetectorActive])
  {
    [v29 dk_numberFromRequiredKey:@"threshold" lowerBound:&off_10001DA50 upperBound:&off_10001DA60 failed:&v54];
    v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    motionDetectorThreshold = self->_motionDetectorThreshold;
    self->_motionDetectorThreshold = v30;
  }
  v32 = [v27 dk_dictionaryFromKey:@"headphones" defaultValue:v28 failed:&v54];
  self->_headphonesDetectorActive = [v32 dk_BOOLFromRequiredKey:@"active" failed:&v54];
  v33 = [v27 dk_dictionaryFromKey:@"accessory" defaultValue:v28 failed:&v54];
  self->_accessoryDetectorActive = [v33 dk_BOOLFromRequiredKey:@"active" failed:&v54];
  if (!v54 && [(AudioSystemInputsCommon *)self isAccessoryDetectorActive])
  {
    v34 = [v5[151] setWithObject:objc_opt_class()];
    [v33 dk_arrayFromRequiredKey:@"modelNumbers" types:v34 maxLength:50 failed:&v54 validator:&stru_10001C6C8];
    v35 = (NSArray *)objc_claimAutoreleasedReturnValue();
    accessoryDetectorModelNumbers = self->_accessoryDetectorModelNumbers;
    self->_accessoryDetectorModelNumbers = v35;
  }
  v37 = [v27 dk_dictionaryFromKey:@"orientation" defaultValue:v28 failed:&v54];
  self->_orientationDetectorActive = [v37 dk_BOOLFromRequiredKey:@"active" failed:&v54];
  if (!v54 && [(AudioSystemInputsCommon *)self isOrientationDetectorActive])
  {
    [v37 dk_numberFromRequiredKey:@"xThreshold" lowerBound:&off_10001DA70 upperBound:&off_10001DA80 failed:&v54];
    v38 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    orientationDetectorXThreshold = self->_orientationDetectorXThreshold;
    self->_orientationDetectorXThreshold = v38;

    [v37 dk_numberFromRequiredKey:@"zThreshold" lowerBound:&off_10001DA70 upperBound:&off_10001DA80 failed:&v54];
    v40 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    orientationDetectorZThreshold = self->_orientationDetectorZThreshold;
    self->_orientationDetectorZThreshold = v40;
  }
  self->_saveRawRecording = [v48 dk_BOOLFromRequiredKey:@"saveRawRecording" failed:&v54];
  [v48 dk_numberFromRequiredKey:@"fileDownloadTimeout" lowerBound:&off_10001D7D8 upperBound:&off_10001D7F0 failed:&v54];
  v42 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  fileDownloadTimeout = self->_fileDownloadTimeout;
  self->_fileDownloadTimeout = v42;

  [v48 dk_numberFromRequiredKey:@"sequenceTimeout" lowerBound:&off_10001D7D8 upperBound:&off_10001D7F0 failed:&v54];
  v44 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  sequenceTimeout = self->_sequenceTimeout;
  self->_sequenceTimeout = v44;

  self->_useDBValuesFromSystem = [v48 dk_BOOLFromKey:@"useDBValuesFromSystem" defaultValue:0 failed:&v54];
  self->_useMeasurementMode = [v48 dk_BOOLFromKey:@"useMeasurementMode" defaultValue:0 failed:&v54];
  BOOL v46 = v54 == 0;

  return v46;
}

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  v23[0] = 0;
  v5 = [v4 dk_dictionaryFromRequiredKey:@"inputComponents" failed:v23];
  v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  inputValueToName = self->_inputValueToName;
  self->_inputValueToName = v6;

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000E7C0;
  v16[3] = &unk_10001C6F0;
  id v8 = v5;
  v18 = self;
  id v19 = &v20;
  id v17 = v8;
  [v8 enumerateKeysAndObjectsUsingBlock:v16];
  if (!*((unsigned char *)v21 + 24))
  {
    id v9 = [v8 count];
    if (v9 != [(NSMutableDictionary *)self->_inputValueToName count]) {
      *((unsigned char *)v21 + 24) = 1;
    }
  }
  v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  outputSpecifications = self->_outputSpecifications;
  self->_outputSpecifications = v10;

  v12 = [v4 dk_dictionaryFromRequiredKey:@"outputComponents" failed:v21 + 3];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000E868;
  v15[3] = &unk_10001C740;
  v15[4] = self;
  v15[5] = &v20;
  [v12 enumerateKeysAndObjectsUsingBlock:v15];
  BOOL v13 = *((unsigned char *)v21 + 24) == 0;

  _Block_object_dispose(&v20, 8);
  return v13;
}

- (id)makeOutputFromDictionary:(id)a3 validationFailed:(BOOL *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init([(AudioSystemInputsCommon *)self outputsClass]);
  id v8 = [(AudioSystemInputsCommon *)self validOutputDeviceSet];
  id v9 = [v6 dk_stringFromRequiredKey:@"output" inSet:v8 failed:a4];
  [v7 setOutputDevice:v9];

  v10 = +[NSNumber numberWithInt:dword_100024418];
  v11 = [v6 dk_numberFromRequiredKey:@"source" lowerBound:&off_10001D808 upperBound:v10 failed:a4];
  [v7 setSource:v11];

  v12 = [v6 dk_numberFromRequiredKey:@"volume" lowerBound:&off_10001DA90 upperBound:&off_10001DAA0 failed:a4];

  [v7 setVolume:v12];

  return v7;
}

- (Class)outputsClass
{
  return (Class)objc_opt_class();
}

- (id)validOutputDeviceSet
{
  return +[NSSet setWithObjects:@"Receiver", @"Top", @"Bottom", 0];
}

- (NSArray)sources
{
  return self->_sources;
}

- (NSMutableArray)sequences
{
  return self->_sequences;
}

- (BOOL)saveRawRecording
{
  return self->_saveRawRecording;
}

- (NSNumber)fileDownloadTimeout
{
  return self->_fileDownloadTimeout;
}

- (NSNumber)sequenceTimeout
{
  return self->_sequenceTimeout;
}

- (BOOL)isMotionDetectorActive
{
  return self->_motionDetectorActive;
}

- (NSNumber)motionDetectorThreshold
{
  return self->_motionDetectorThreshold;
}

- (BOOL)isHeadphonesDetectorActive
{
  return self->_headphonesDetectorActive;
}

- (BOOL)isAccessoryDetectorActive
{
  return self->_accessoryDetectorActive;
}

- (NSArray)accessoryDetectorModelNumbers
{
  return self->_accessoryDetectorModelNumbers;
}

- (BOOL)isOrientationDetectorActive
{
  return self->_orientationDetectorActive;
}

- (NSNumber)orientationDetectorXThreshold
{
  return self->_orientationDetectorXThreshold;
}

- (NSNumber)orientationDetectorZThreshold
{
  return self->_orientationDetectorZThreshold;
}

- (BOOL)isUsingMeasurementMode
{
  return self->_useMeasurementMode;
}

- (BOOL)isUsingDBValuesFromSystem
{
  return self->_useDBValuesFromSystem;
}

- (NSMutableDictionary)inputValueToName
{
  return self->_inputValueToName;
}

- (NSMutableDictionary)outputSpecifications
{
  return self->_outputSpecifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputSpecifications, 0);
  objc_storeStrong((id *)&self->_inputValueToName, 0);
  objc_storeStrong((id *)&self->_orientationDetectorZThreshold, 0);
  objc_storeStrong((id *)&self->_orientationDetectorXThreshold, 0);
  objc_storeStrong((id *)&self->_accessoryDetectorModelNumbers, 0);
  objc_storeStrong((id *)&self->_motionDetectorThreshold, 0);
  objc_storeStrong((id *)&self->_sequenceTimeout, 0);
  objc_storeStrong((id *)&self->_fileDownloadTimeout, 0);
  objc_storeStrong((id *)&self->_sequences, 0);

  objc_storeStrong((id *)&self->_sources, 0);
}

@end