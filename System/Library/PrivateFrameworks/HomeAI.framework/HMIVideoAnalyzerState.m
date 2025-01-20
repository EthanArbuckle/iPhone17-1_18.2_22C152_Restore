@interface HMIVideoAnalyzerState
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentPTS;
- (BOOL)encode;
- (BOOL)encoder;
- (BOOL)isThermalAndSystemResourceUsageLevelIgnored;
- (BOOL)monitored;
- (HMIVideoAnalyzerConfiguration)configuration;
- (HMIVideoAnalyzerDynamicConfiguration)dynamicConfiguration;
- (HMIVideoAnalyzerState)initWithConfiguration:(id)a3 dynamicConfiguration:(id)a4 identifier:(id)a5 monitored:(BOOL)a6 analysisFPS:(double)a7 timeSinceAnalyzerStarted:(double)a8 timeSinceLastFragmentWasReceived:(double)a9 bufferFillRatio:(double)a10 bufferSize:(unint64_t)a11 delay:(double)a12 currentPTS:(id *)a13 numDecodedSamples:(unint64_t)a14 numDidAnalyzeFrames:(unint64_t)a15 numDidAnalyzeFragments:(unint64_t)a16 numDidAnalyzePackages:(unint64_t)a17 numDidCreateTimelapseFragments:(unint64_t)a18 averageAnalysisTime:(double)a19 encode:(BOOL)a20 encoder:(BOOL)a21;
- (NSArray)tableColumns;
- (NSArray)tableValues;
- (NSDictionary)JSONObject;
- (NSUUID)identifier;
- (double)analysisFPS;
- (double)averageAnalysisTime;
- (double)bufferFillRatio;
- (double)delay;
- (double)timeSinceAnalyzerStarted;
- (double)timeSinceLastFragmentWasReceived;
- (int64_t)systemResourceUsageLevel;
- (unint64_t)activeAnalyzersCount;
- (unint64_t)bufferSize;
- (unint64_t)numDecodedSamples;
- (unint64_t)numDidAnalyzeFragments;
- (unint64_t)numDidAnalyzeFrames;
- (unint64_t)numDidAnalyzePackages;
- (unint64_t)numDidCreateTimelapseFragments;
- (unint64_t)thermalLevel;
- (void)check;
@end

@implementation HMIVideoAnalyzerState

- (HMIVideoAnalyzerState)initWithConfiguration:(id)a3 dynamicConfiguration:(id)a4 identifier:(id)a5 monitored:(BOOL)a6 analysisFPS:(double)a7 timeSinceAnalyzerStarted:(double)a8 timeSinceLastFragmentWasReceived:(double)a9 bufferFillRatio:(double)a10 bufferSize:(unint64_t)a11 delay:(double)a12 currentPTS:(id *)a13 numDecodedSamples:(unint64_t)a14 numDidAnalyzeFrames:(unint64_t)a15 numDidAnalyzeFragments:(unint64_t)a16 numDidAnalyzePackages:(unint64_t)a17 numDidCreateTimelapseFragments:(unint64_t)a18 averageAnalysisTime:(double)a19 encode:(BOOL)a20 encoder:(BOOL)a21
{
  id v34 = a3;
  id v35 = a4;
  id v36 = a5;
  v46.receiver = self;
  v46.super_class = (Class)HMIVideoAnalyzerState;
  v37 = [(HMIVideoAnalyzerState *)&v46 init];
  v38 = v37;
  if (v37)
  {
    objc_storeStrong((id *)&v37->_configuration, a3);
    objc_storeStrong((id *)&v38->_dynamicConfiguration, a4);
    objc_storeStrong((id *)&v38->_identifier, a5);
    v38->_monitored = a6;
    v38->_analysisFPS = a7;
    v38->_timeSinceAnalyzerStarted = a8;
    v38->_timeSinceLastFragmentWasReceived = a9;
    v38->_bufferFillRatio = a10;
    v38->_bufferSize = a11;
    v38->_delay = a12;
    int64_t var3 = a13->var3;
    *(_OWORD *)&v38->_currentPTS.value = *(_OWORD *)&a13->var0;
    v38->_currentPTS.epoch = var3;
    v38->_numDecodedSamples = a14;
    v38->_numDidAnalyzeFrames = a15;
    v38->_numDidAnalyzeFragments = a16;
    v38->_numDidAnalyzePackages = a17;
    v38->_numDidCreateTimelapseFragments = a18;
    v38->_averageAnalysisTime = a19;
    v40 = +[HMIVideoAnalyzerScheduler sharedInstance];
    v41 = [v40 analyzers];
    v38->_activeAnalyzersCount = [v41 count];

    v42 = +[HMIVideoAnalyzerScheduler sharedInstance];
    v38->_systemResourceUsageLevel = [v42 usageLevel];

    v43 = +[HMIThermalMonitor sharedInstance];
    v38->_thermalLevel = [v43 thermalLevel];

    v44 = +[HMIVideoAnalyzerScheduler sharedInstance];
    v38->_thermalAndSystemResourceUsageLevelIgnored = [v44 ignoreThermalAndSystemResourceUsageLevel];

    v38->_encode = a20;
    v38->_encoder = a21;
  }

  return v38;
}

- (NSArray)tableColumns
{
  return (NSArray *)&unk_26D9A98B8;
}

- (NSArray)tableValues
{
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [(HMIVideoAnalyzerState *)self identifier];
  v5 = HMIUUIDShortDescription(v4);
  [v3 addObject:v5];

  v6 = NSString;
  v7 = [(HMIVideoAnalyzerState *)self configuration];
  v8 = [v7 camera];
  v9 = [v8 name];
  v10 = [(HMIVideoAnalyzerState *)self configuration];
  v11 = [v10 camera];
  v12 = [v11 model];
  v13 = [v6 stringWithFormat:@"%@/%@", v9, v12];
  [v3 addObject:v13];

  v14 = NSString;
  BOOL v15 = [(HMIVideoAnalyzerState *)self monitored];
  v16 = @"N";
  if (v15) {
    v16 = @"Y";
  }
  v17 = [v14 stringWithFormat:@"%@", v16];
  [v3 addObject:v17];

  v18 = [(HMIVideoAnalyzerState *)self configuration];
  unint64_t v19 = [v18 decodeMode];

  if (v19 <= 2) {
    [v3 addObject:off_26477EBB8[v19]];
  }
  v20 = NSString;
  [(HMIVideoAnalyzerState *)self analysisFPS];
  v22 = [v20 stringWithFormat:@"%.2f", v21];
  [v3 addObject:v22];

  v23 = NSString;
  [(HMIVideoAnalyzerState *)self timeSinceAnalyzerStarted];
  v25 = objc_msgSend(v23, "stringWithFormat:", @"%ld", (unint64_t)v24);
  [v3 addObject:v25];

  v26 = NSString;
  [(HMIVideoAnalyzerState *)self timeSinceLastFragmentWasReceived];
  v28 = objc_msgSend(v26, "stringWithFormat:", @"%ld", (unint64_t)v27);
  [v3 addObject:v28];

  v29 = [MEMORY[0x263F089D8] string];
  [(HMIVideoAnalyzerState *)self bufferFillRatio];
  int v31 = (int)(v30 * 10.0);
  v32 = [&stru_26D98B6C8 stringByPaddingToLength:v31 withString:@"=" startingAtIndex:0];
  [v29 appendFormat:@"[%@", v32];

  v33 = [&stru_26D98B6C8 stringByPaddingToLength:10 - v31 withString:@" " startingAtIndex:0];
  [v29 appendFormat:@"%@", v33];

  objc_msgSend(v29, "appendFormat:", @"] %5ld KB", -[HMIVideoAnalyzerState bufferSize](self, "bufferSize") >> 10);
  v77 = v29;
  [v3 addObject:v29];
  id v34 = NSString;
  [(HMIVideoAnalyzerState *)self delay];
  id v36 = objc_msgSend(v34, "stringWithFormat:", @"%.1f", v35);
  [v3 addObject:v36];

  v37 = NSString;
  unint64_t v38 = [(HMIVideoAnalyzerState *)self numDecodedSamples];
  [(HMIVideoAnalyzerState *)self currentPTS];
  v39 = objc_msgSend(v37, "stringWithFormat:", @"%4ld:%.1f", v38, CMTimeGetSeconds(&time));
  [v3 addObject:v39];

  v40 = [NSString stringWithFormat:@"%ld, %ld", -[HMIVideoAnalyzerState numDidAnalyzeFrames](self, "numDidAnalyzeFrames"), -[HMIVideoAnalyzerState numDidAnalyzeFragments](self, "numDidAnalyzeFragments")];
  [v3 addObject:v40];

  v41 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", self->_numDidAnalyzePackages);
  [v3 addObject:v41];

  v42 = NSString;
  [(HMIVideoAnalyzerState *)self averageAnalysisTime];
  v44 = [v42 stringWithFormat:@"%.2f", v43];
  [v3 addObject:v44];

  v75 = NSString;
  v76 = [(HMIVideoAnalyzerState *)self configuration];
  int v45 = [v76 transcode];
  BOOL v46 = [(HMIVideoAnalyzerState *)self encode];
  BOOL v47 = [(HMIVideoAnalyzerState *)self encoder];
  v48 = [(HMIVideoAnalyzerState *)self configuration];
  v49 = HMIFourCCString([v48 transcodeCodecType]);
  v50 = [(HMIVideoAnalyzerState *)self configuration];
  v51 = v50;
  v52 = @"T";
  if (v50)
  {
    v53 = @"t";
    [v50 timelapseInterval];
    if (v78) {
      v53 = @"T";
    }
  }
  else
  {
    v53 = @"t";
  }
  if (v47) {
    v54 = @"C";
  }
  else {
    v54 = @"c";
  }
  if (v46) {
    v55 = @"E";
  }
  else {
    v55 = @"e";
  }
  if (!v45) {
    v52 = @"t";
  }
  v56 = [v75 stringWithFormat:@"%@%@%@ %@, %@:%ld", v52, v55, v54, v49, v53, -[HMIVideoAnalyzerState numDidCreateTimelapseFragments](self, "numDidCreateTimelapseFragments")];
  [v3 addObject:v56];

  v57 = [(HMIVideoAnalyzerState *)self dynamicConfiguration];
  v58 = NSString;
  int v59 = [v57 recognizeFaces];
  v60 = @"N";
  if (v59) {
    v60 = @"Y";
  }
  v61 = [v58 stringWithFormat:@"%@", v60];
  [v3 addObject:v61];

  v62 = NSString;
  v63 = [v57 activityZones];
  v64 = objc_msgSend(v62, "stringWithFormat:", @"%lu", objc_msgSend(v63, "count"));
  [v3 addObject:v64];

  v65 = [MEMORY[0x263F089D8] string];
  char v66 = [v57 eventTriggers];
  if (v66) {
    v67 = @"M";
  }
  else {
    v67 = @"m";
  }
  [v65 appendString:v67];
  if ((v66 & 2) != 0) {
    v68 = @"P";
  }
  else {
    v68 = @"p";
  }
  [v65 appendString:v68];
  if ((v66 & 4) != 0) {
    v69 = @"A";
  }
  else {
    v69 = @"a";
  }
  [v65 appendString:v69];
  if ((v66 & 8) != 0) {
    v70 = @"V";
  }
  else {
    v70 = @"v";
  }
  [v65 appendString:v70];
  if ((v66 & 0x10) != 0) {
    v71 = @"K";
  }
  else {
    v71 = @"k";
  }
  [v65 appendString:v71];
  v72 = [NSString stringWithFormat:@"%@", v65];
  [v3 addObject:v72];

  v73 = (void *)[v3 copy];
  return (NSArray *)v73;
}

- (NSDictionary)JSONObject
{
  v64[21] = *MEMORY[0x263EF8340];
  v63[0] = @"identifier";
  v60 = [(HMIVideoAnalyzerState *)self identifier];
  int v59 = [v60 UUIDString];
  v64[0] = v59;
  v63[1] = @"monitored";
  v58 = objc_msgSend(NSNumber, "numberWithBool:", -[HMIVideoAnalyzerState monitored](self, "monitored"));
  v64[1] = v58;
  v63[2] = @"analysisFPS";
  v3 = NSNumber;
  [(HMIVideoAnalyzerState *)self analysisFPS];
  v57 = objc_msgSend(v3, "numberWithDouble:");
  v56 = HMIJSONDecimalNumberForNumber(v57, 3);
  v64[2] = v56;
  v63[3] = @"timeSinceAnalyzerStarted";
  v4 = NSNumber;
  [(HMIVideoAnalyzerState *)self timeSinceAnalyzerStarted];
  v55 = objc_msgSend(v4, "numberWithDouble:");
  v54 = HMIJSONDecimalNumberForNumber(v55, 3);
  v64[3] = v54;
  v63[4] = @"timeSinceLastFragmentWasReceived";
  v5 = NSNumber;
  [(HMIVideoAnalyzerState *)self timeSinceLastFragmentWasReceived];
  v53 = objc_msgSend(v5, "numberWithDouble:");
  v52 = HMIJSONDecimalNumberForNumber(v53, 3);
  v64[4] = v52;
  v63[5] = @"bufferFillRatio";
  v6 = NSNumber;
  [(HMIVideoAnalyzerState *)self bufferFillRatio];
  v51 = objc_msgSend(v6, "numberWithDouble:");
  v50 = HMIJSONDecimalNumberForNumber(v51, 3);
  v64[5] = v50;
  v63[6] = @"bufferSize";
  v49 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMIVideoAnalyzerState bufferSize](self, "bufferSize"));
  v64[6] = v49;
  v63[7] = @"delay";
  v7 = NSNumber;
  [(HMIVideoAnalyzerState *)self delay];
  v48 = objc_msgSend(v7, "numberWithDouble:");
  BOOL v47 = HMIJSONDecimalNumberForNumber(v48, 3);
  v64[7] = v47;
  v63[8] = @"numDecodedSamples";
  BOOL v46 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMIVideoAnalyzerState numDecodedSamples](self, "numDecodedSamples"));
  v64[8] = v46;
  v63[9] = @"numDidAnalyzeFrames";
  int v45 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMIVideoAnalyzerState numDidAnalyzeFrames](self, "numDidAnalyzeFrames"));
  v64[9] = v45;
  v63[10] = @"numDidAnalyzePackages";
  v44 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMIVideoAnalyzerState numDidAnalyzePackages](self, "numDidAnalyzePackages"));
  v64[10] = v44;
  v63[11] = @"numDidCreateTimelapseFragments";
  uint64_t v43 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMIVideoAnalyzerState numDidCreateTimelapseFragments](self, "numDidCreateTimelapseFragments"));
  v64[11] = v43;
  v63[12] = @"averageAnalysisTime";
  v8 = NSNumber;
  [(HMIVideoAnalyzerState *)self averageAnalysisTime];
  v42 = objc_msgSend(v8, "numberWithDouble:");
  v41 = HMIJSONDecimalNumberForNumber(v42, 3);
  v64[12] = v41;
  v63[13] = @"decodeMode";
  v40 = [(HMIVideoAnalyzerState *)self configuration];
  v39 = HMIVideoAnalyzerDecodeModeAsString([v40 decodeMode]);
  v64[13] = v39;
  v63[14] = @"transcode";
  v9 = NSNumber;
  unint64_t v38 = [(HMIVideoAnalyzerState *)self configuration];
  v37 = objc_msgSend(v9, "numberWithBool:", objc_msgSend(v38, "transcode"));
  v64[14] = v37;
  v63[15] = @"transcodeCodecType";
  id v36 = [(HMIVideoAnalyzerState *)self configuration];
  uint64_t v35 = HMIFourCCString([v36 transcodeCodecType]);
  v64[15] = v35;
  v63[16] = @"encode";
  id v34 = objc_msgSend(NSNumber, "numberWithBool:", -[HMIVideoAnalyzerState encode](self, "encode"));
  v64[16] = v34;
  v63[17] = @"encoder";
  v33 = objc_msgSend(NSNumber, "numberWithBool:", -[HMIVideoAnalyzerState encoder](self, "encoder"));
  v64[17] = v33;
  v63[18] = @"recognizeFaces";
  v10 = NSNumber;
  v11 = [(HMIVideoAnalyzerState *)self dynamicConfiguration];
  v12 = objc_msgSend(v10, "numberWithBool:", objc_msgSend(v11, "recognizeFaces"));
  v64[18] = v12;
  v63[19] = @"activityZones";
  v13 = NSNumber;
  v14 = [(HMIVideoAnalyzerState *)self dynamicConfiguration];
  BOOL v15 = [v14 activityZones];
  v16 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
  v64[19] = v16;
  v63[20] = @"eventTriggers";
  v17 = NSNumber;
  v18 = [(HMIVideoAnalyzerState *)self dynamicConfiguration];
  unint64_t v19 = objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v18, "eventTriggers"));
  v64[20] = v19;
  v20 = [NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:21];
  uint64_t v21 = (void *)[v20 mutableCopy];

  v22 = [(HMIVideoAnalyzerState *)self configuration];
  v23 = [v22 camera];

  if (v23)
  {
    v61[0] = @"name";
    double v24 = [(HMIVideoAnalyzerState *)self configuration];
    v25 = [v24 camera];
    v26 = [v25 name];
    v61[1] = @"manufacturer";
    v62[0] = v26;
    double v27 = [(HMIVideoAnalyzerState *)self configuration];
    v28 = [v27 camera];
    v29 = [v28 manufacturer];
    v62[1] = v29;
    double v30 = [NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:2];
    [v21 setObject:v30 forKeyedSubscript:@"camera"];
  }
  int v31 = (void *)[v21 copy];

  return (NSDictionary *)v31;
}

- (void)check
{
  id v6 = [MEMORY[0x263EFF980] array];
  [(HMIVideoAnalyzerState *)self timeSinceLastFragmentWasReceived];
  if (v3 > 60.0)
  {
    v4 = [NSString stringWithFormat:@"Session has not received any new data for over 60 seconds."];
    [v6 addObject:v4];
  }
  if ([v6 count])
  {
    v5 = [v6 componentsJoinedByString:@"\n"];
    HMISimulateCrash(@"Session Check", v5, 1);
  }
}

- (HMIVideoAnalyzerConfiguration)configuration
{
  return (HMIVideoAnalyzerConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (HMIVideoAnalyzerDynamicConfiguration)dynamicConfiguration
{
  return (HMIVideoAnalyzerDynamicConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)monitored
{
  return self->_monitored;
}

- (double)analysisFPS
{
  return self->_analysisFPS;
}

- (double)timeSinceAnalyzerStarted
{
  return self->_timeSinceAnalyzerStarted;
}

- (double)timeSinceLastFragmentWasReceived
{
  return self->_timeSinceLastFragmentWasReceived;
}

- (double)bufferFillRatio
{
  return self->_bufferFillRatio;
}

- (unint64_t)bufferSize
{
  return self->_bufferSize;
}

- (double)delay
{
  return self->_delay;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentPTS
{
  objc_copyStruct(retstr, &self->_currentPTS, 24, 1, 0);
  return result;
}

- (unint64_t)numDecodedSamples
{
  return self->_numDecodedSamples;
}

- (unint64_t)numDidAnalyzeFrames
{
  return self->_numDidAnalyzeFrames;
}

- (unint64_t)numDidAnalyzeFragments
{
  return self->_numDidAnalyzeFragments;
}

- (unint64_t)numDidAnalyzePackages
{
  return self->_numDidAnalyzePackages;
}

- (unint64_t)numDidCreateTimelapseFragments
{
  return self->_numDidCreateTimelapseFragments;
}

- (double)averageAnalysisTime
{
  return self->_averageAnalysisTime;
}

- (unint64_t)activeAnalyzersCount
{
  return self->_activeAnalyzersCount;
}

- (int64_t)systemResourceUsageLevel
{
  return self->_systemResourceUsageLevel;
}

- (unint64_t)thermalLevel
{
  return self->_thermalLevel;
}

- (BOOL)isThermalAndSystemResourceUsageLevelIgnored
{
  return self->_thermalAndSystemResourceUsageLevelIgnored;
}

- (BOOL)encode
{
  return self->_encode;
}

- (BOOL)encoder
{
  return self->_encoder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dynamicConfiguration, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end