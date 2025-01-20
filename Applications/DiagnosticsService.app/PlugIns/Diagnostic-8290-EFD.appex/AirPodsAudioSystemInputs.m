@interface AirPodsAudioSystemInputs
- (BOOL)unpairAirPodsOnFinish;
- (BOOL)useBundledAudioStimulus;
- (BOOL)validateAndInitializeParameters:(id)a3;
- (BOOL)validateAndInitializeSpecifications:(id)a3;
- (Class)outputsClass;
- (DAChamberInputs)chamberInputs;
- (NSArray)crackleFilterCoeffs;
- (NSArray)frequencyBins;
- (NSArray)micBufferNumbers;
- (NSDictionary)inputNameToValue;
- (NSNumber)crackleBaseFrequency;
- (NSNumber)crackleNeighborDistance;
- (NSNumber)crackleNumberOfStages;
- (NSNumber)crackleSamplingRate;
- (NSNumber)dataCroppingLength;
- (NSNumber)dataFrontCroppingLength;
- (NSNumber)stimulusCroppingLength;
- (NSNumber)stimulusFrontCroppingLength;
- (id)makeOutputFromDictionary:(id)a3 validationFailed:(BOOL *)a4;
- (id)validOutputDeviceSet;
- (int64_t)micRecordingsType;
- (void)setChamberInputs:(id)a3;
- (void)setMicBufferNumbers:(id)a3;
- (void)setMicRecordingsType:(int64_t)a3;
- (void)setUnpairAirPodsOnFinish:(BOOL)a3;
- (void)setUseBundledAudioStimulus:(BOOL)a3;
@end

@implementation AirPodsAudioSystemInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)AirPodsAudioSystemInputs;
  if ([(AudioSystemInputsCommon *)&v50 validateAndInitializeParameters:v4])
  {
    v5 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v55 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Validating 8290 parameters: %@", buf, 0xCu);
    }

    v6 = [(AirPodsAudioSystemInputs *)self chamberInputs];

    if (!v6)
    {
      v7 = objc_alloc_init(DAChamberInputs);
      [(AirPodsAudioSystemInputs *)self setChamberInputs:v7];
    }
    v8 = [(AirPodsAudioSystemInputs *)self chamberInputs];
    uint8_t v9 = [v8 validateAndInitializeParameters:v4] ^ 1;
    buf[0] = v9;

    if ((v9 & 1) == 0)
    {
      v10 = +[NSSet setWithObject:objc_opt_class()];
      [v4 dk_arrayFromRequiredKey:@"energyBins" types:v10 maxLength:1000 failed:buf];
      v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
      frequencyBins = self->_frequencyBins;
      self->_frequencyBins = v11;

      [(NSArray *)self->_frequencyBins count];
      if ([(NSArray *)self->_frequencyBins count] <= 1) {
        buf[0] = 1;
      }
      [v4 dk_numberFromKey:@"stimulusFrontCroppingLength" lowerBound:&off_10001D910 upperBound:&off_10001D928 defaultValue:&off_10001D910 failed:buf];
      v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      stimulusFrontCroppingLength = self->_stimulusFrontCroppingLength;
      self->_stimulusFrontCroppingLength = v13;

      [v4 dk_numberFromKey:@"stimulusCroppingLength" lowerBound:&off_10001D910 upperBound:&off_10001D928 defaultValue:&off_10001D940 failed:buf];
      v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      stimulusCroppingLength = self->_stimulusCroppingLength;
      self->_stimulusCroppingLength = v15;

      [v4 dk_numberFromKey:@"dataFrontCroppingLength" lowerBound:&off_10001D910 upperBound:&off_10001D928 defaultValue:&off_10001D910 failed:buf];
      v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      dataFrontCroppingLength = self->_dataFrontCroppingLength;
      self->_dataFrontCroppingLength = v17;

      [v4 dk_numberFromKey:@"dataCroppingLength" lowerBound:&off_10001D910 upperBound:&off_10001D928 defaultValue:&off_10001D940 failed:buf];
      v19 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      dataCroppingLength = self->_dataCroppingLength;
      self->_dataCroppingLength = v19;

      [v4 dk_numberFromKey:@"crackleBaseFrequency" lowerBound:&off_10001D958 upperBound:&off_10001D928 defaultValue:&off_10001D970 failed:buf];
      v21 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      crackleBaseFrequency = self->_crackleBaseFrequency;
      self->_crackleBaseFrequency = v21;

      [v4 dk_numberFromKey:@"crackleSamplingRate" lowerBound:&off_10001D958 upperBound:&off_10001D928 defaultValue:&off_10001D988 failed:buf];
      v23 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      crackleSamplingRate = self->_crackleSamplingRate;
      self->_crackleSamplingRate = v23;

      [v4 dk_numberFromKey:@"crackleNeighborDistance" lowerBound:&off_10001D958 upperBound:&off_10001D928 defaultValue:&off_10001D9A0 failed:buf];
      v25 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      crackleNeighborDistance = self->_crackleNeighborDistance;
      self->_crackleNeighborDistance = v25;

      [v4 dk_numberFromKey:@"crackleNumberOfStages" lowerBound:&off_10001D958 upperBound:&off_10001D928 defaultValue:&off_10001D9B8 failed:buf];
      v27 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      crackleNumberOfStages = self->_crackleNumberOfStages;
      self->_crackleNumberOfStages = v27;

      v29 = +[NSSet setWithObject:objc_opt_class()];
      [v4 dk_arrayFromRequiredKey:@"crackleFilterCoeffs" types:v29 maxLength:70 failed:buf];
      v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
      crackleFilterCoeffs = self->_crackleFilterCoeffs;
      self->_crackleFilterCoeffs = v30;

      if (![(NSArray *)self->_crackleFilterCoeffs count]) {
        buf[0] = 1;
      }
      v32 = [v4 dk_numberFromKey:@"micRecordingsType" lowerBound:&off_10001D958 upperBound:&off_10001D9D0 defaultValue:&off_10001D958 failed:buf];
      self->_int64_t micRecordingsType = (int)[v32 intValue];

      int64_t micRecordingsType = self->_micRecordingsType;
      switch(micRecordingsType)
      {
        case 3:
          v51[0] = @"Bottom";
          v51[1] = @"Back";
          v51[2] = @"Top";
          v51[3] = @"BNC";
          v34 = +[NSArray arrayWithObjects:v51 count:4];
          v35 = objc_opt_new();
          if ([v34 count])
          {
            unint64_t v38 = 0;
            do
            {
              v39 = [(AirPodsAudioSystemInputs *)self inputNameToValue];
              v40 = [v34 objectAtIndexedSubscript:v38];
              v41 = [v39 objectForKeyedSubscript:v40];

              if (v41)
              {
                v42 = [(AirPodsAudioSystemInputs *)self inputNameToValue];
                v43 = [v34 objectAtIndexedSubscript:v38];
                v44 = [v42 objectForKeyedSubscript:v43];
                [v35 addObject:v44];
              }
              ++v38;
            }
            while ((unint64_t)[v34 count] > v38);
          }
          v36 = (NSArray *)[v35 copy];
          break;
        case 2:
          v34 = [(AirPodsAudioSystemInputs *)self inputNameToValue];
          v35 = [v34 objectForKeyedSubscript:@"Bottom"];
          v52[0] = v35;
          v45 = [(AirPodsAudioSystemInputs *)self inputNameToValue];
          v46 = [v45 objectForKeyedSubscript:@"BNC"];
          v52[1] = v46;
          v47 = +[NSArray arrayWithObjects:v52 count:2];
          micBufferNumbers = self->_micBufferNumbers;
          self->_micBufferNumbers = v47;

          goto LABEL_24;
        case 1:
          v34 = [(AirPodsAudioSystemInputs *)self inputNameToValue];
          v35 = [v34 objectForKeyedSubscript:@"Bottom"];
          v53 = v35;
          v36 = +[NSArray arrayWithObjects:&v53 count:1];
          break;
        default:
LABEL_25:
          self->_unpairAirPodsOnFinish = [v4 dk_BOOLFromKey:@"unpairDeviceOnFinish" defaultValue:0 failed:buf];
          self->_useBundledAudioStimulus = [v4 dk_BOOLFromKey:@"useBundledAudioStimulus" defaultValue:1 failed:buf];
          BOOL v37 = buf[0] == 0;
          goto LABEL_26;
      }
      v45 = self->_micBufferNumbers;
      self->_micBufferNumbers = v36;
LABEL_24:

      goto LABEL_25;
    }
  }
  BOOL v37 = 0;
LABEL_26:

  return v37;
}

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AirPodsAudioSystemInputs;
  id v4 = a3;
  char v9 = ![(AudioSystemInputsCommon *)&v8 validateAndInitializeSpecifications:v4];
  [v4 dk_dictionaryFromRequiredKey:@"inputComponents" failed:&v9];
  v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  inputNameToValue = self->_inputNameToValue;
  self->_inputNameToValue = v5;

  return v9 == 0;
}

- (id)makeOutputFromDictionary:(id)a3 validationFailed:(BOOL *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)AirPodsAudioSystemInputs;
  id v5 = a3;
  v6 = [(AudioSystemInputsCommon *)&v10 makeOutputFromDictionary:v5 validationFailed:a4];
  v7 = [v5 dk_numberFromRequiredKey:@"numberOfChannels" lowerBound:&off_10001DAB0 upperBound:&off_10001DAC0 failed:a4 v10.receiver, v10.super_class];
  [v6 setNumberOfChannels:[v7 intValue]];

  objc_super v8 = [v5 dk_numberFromKey:@"audioTestType" lowerBound:&off_10001D910 upperBound:&off_10001D958 defaultValue:&off_10001D910 failed:a4];

  [v6 setAudioTestType:[v8 intValue]];

  return v6;
}

- (Class)outputsClass
{
  return (Class)objc_opt_class();
}

- (id)validOutputDeviceSet
{
  id v3 = objc_alloc((Class)NSMutableSet);
  v7.receiver = self;
  v7.super_class = (Class)AirPodsAudioSystemInputs;
  id v4 = [(AudioSystemInputsCommon *)&v7 validOutputDeviceSet];
  id v5 = [v3 initWithSet:v4];

  [v5 addObject:@"LeftBud"];
  [v5 addObject:@"RightBud"];

  return v5;
}

- (DAChamberInputs)chamberInputs
{
  return self->_chamberInputs;
}

- (void)setChamberInputs:(id)a3
{
}

- (NSDictionary)inputNameToValue
{
  return self->_inputNameToValue;
}

- (BOOL)unpairAirPodsOnFinish
{
  return self->_unpairAirPodsOnFinish;
}

- (void)setUnpairAirPodsOnFinish:(BOOL)a3
{
  self->_unpairAirPodsOnFinish = a3;
}

- (BOOL)useBundledAudioStimulus
{
  return self->_useBundledAudioStimulus;
}

- (void)setUseBundledAudioStimulus:(BOOL)a3
{
  self->_useBundledAudioStimulus = a3;
}

- (int64_t)micRecordingsType
{
  return self->_micRecordingsType;
}

- (void)setMicRecordingsType:(int64_t)a3
{
  self->_int64_t micRecordingsType = a3;
}

- (NSArray)micBufferNumbers
{
  return self->_micBufferNumbers;
}

- (void)setMicBufferNumbers:(id)a3
{
}

- (NSArray)frequencyBins
{
  return self->_frequencyBins;
}

- (NSNumber)stimulusFrontCroppingLength
{
  return self->_stimulusFrontCroppingLength;
}

- (NSNumber)stimulusCroppingLength
{
  return self->_stimulusCroppingLength;
}

- (NSNumber)dataFrontCroppingLength
{
  return self->_dataFrontCroppingLength;
}

- (NSNumber)dataCroppingLength
{
  return self->_dataCroppingLength;
}

- (NSNumber)crackleBaseFrequency
{
  return self->_crackleBaseFrequency;
}

- (NSNumber)crackleSamplingRate
{
  return self->_crackleSamplingRate;
}

- (NSNumber)crackleNeighborDistance
{
  return self->_crackleNeighborDistance;
}

- (NSNumber)crackleNumberOfStages
{
  return self->_crackleNumberOfStages;
}

- (NSArray)crackleFilterCoeffs
{
  return self->_crackleFilterCoeffs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crackleFilterCoeffs, 0);
  objc_storeStrong((id *)&self->_crackleNumberOfStages, 0);
  objc_storeStrong((id *)&self->_crackleNeighborDistance, 0);
  objc_storeStrong((id *)&self->_crackleSamplingRate, 0);
  objc_storeStrong((id *)&self->_crackleBaseFrequency, 0);
  objc_storeStrong((id *)&self->_dataCroppingLength, 0);
  objc_storeStrong((id *)&self->_dataFrontCroppingLength, 0);
  objc_storeStrong((id *)&self->_stimulusCroppingLength, 0);
  objc_storeStrong((id *)&self->_stimulusFrontCroppingLength, 0);
  objc_storeStrong((id *)&self->_frequencyBins, 0);
  objc_storeStrong((id *)&self->_micBufferNumbers, 0);
  objc_storeStrong((id *)&self->_inputNameToValue, 0);

  objc_storeStrong((id *)&self->_chamberInputs, 0);
}

@end