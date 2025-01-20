@interface AFRequestInfo
+ (BOOL)supportsSecureCoding;
+ (id)testRequestWithStartLocalRequest:(id)a3;
+ (id)testRequestWithText:(id)a3 speechRequestOptions:(id)a4 testOptions:(id)a5;
- (AFRequestCompletionOptions)requestCompletionOptions;
- (AFRequestInfo)init;
- (AFRequestInfo)initWithCoder:(id)a3;
- (AFRequestInfo)initWithTimestamp:(unint64_t)a3;
- (AFSpeechRequestOptions)speechRequestOptions;
- (AFTestRequestOptions)testRequestOptions;
- (BOOL)handoffRequiresUserInteraction;
- (BOOL)isATVHandoff;
- (BOOL)isSiriXRequest;
- (BOOL)isSpeechRequest;
- (BOOL)requiresUserInteraction;
- (NSData)handoffRequestData;
- (NSDictionary)correctedSpeechContext;
- (NSDictionary)nonspeakerConfidenceScores;
- (NSNumber)combinedRank;
- (NSNumber)combinedScore;
- (NSNumber)notifyState;
- (NSNumber)onDeviceUtterancesPresent;
- (NSNumber)originalRank;
- (NSNumber)originalScore;
- (NSString)correctedSpeech;
- (NSString)directActionAppId;
- (NSString)expectedSpeakerSharedUserID;
- (NSString)handoffNotification;
- (NSString)handoffOriginDeviceName;
- (NSString)handoffURLString;
- (NSString)interactionId;
- (NSString)legacyDirectActionIdentifier;
- (NSString)previousUtterance;
- (NSString)sessionId;
- (NSString)text;
- (NSString)utteranceSource;
- (NSUUID)requestIdentifier;
- (NSUUID)turnIdentifier;
- (NSUUID)uuid;
- (SAStartLocalRequest)startLocalRequest;
- (SAStartRequest)startRequest;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)activationEvent;
- (int64_t)directActionEvent;
- (unint64_t)expectedSpeakerConfidenceScore;
- (unint64_t)options;
- (unint64_t)timestamp;
- (void)encodeWithCoder:(id)a3;
- (void)setActivationEvent:(int64_t)a3;
- (void)setCombinedRank:(id)a3;
- (void)setCombinedScore:(id)a3;
- (void)setCorrectedSpeech:(id)a3;
- (void)setCorrectedSpeechContext:(id)a3;
- (void)setDirectActionAppId:(id)a3;
- (void)setDirectActionEvent:(int64_t)a3;
- (void)setExpectedSpeakerConfidenceScore:(unint64_t)a3;
- (void)setExpectedSpeakerSharedUserID:(id)a3;
- (void)setHandoffNotification:(id)a3;
- (void)setHandoffOriginDeviceName:(id)a3;
- (void)setHandoffRequestData:(id)a3;
- (void)setHandoffRequiresUserInteraction:(BOOL)a3;
- (void)setHandoffURLString:(id)a3;
- (void)setInteractionId:(id)a3;
- (void)setIsATVHandoff:(BOOL)a3;
- (void)setIsSiriXRequest:(BOOL)a3;
- (void)setLegacyDirectActionIdentifier:(id)a3;
- (void)setNonspeakerConfidenceScores:(id)a3;
- (void)setNotifyState:(id)a3;
- (void)setOnDeviceUtterancesPresent:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setOriginalRank:(id)a3;
- (void)setOriginalScore:(id)a3;
- (void)setPreviousUtterance:(id)a3;
- (void)setRequestCompletionOptions:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setSessionId:(id)a3;
- (void)setSpeechRequestOptions:(id)a3;
- (void)setStartLocalRequest:(id)a3;
- (void)setStartRequest:(id)a3;
- (void)setTestRequestOptions:(id)a3;
- (void)setText:(id)a3;
- (void)setTurnIdentifier:(id)a3;
- (void)setUtteranceSource:(id)a3;
@end

@implementation AFRequestInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonspeakerConfidenceScores, 0);
  objc_storeStrong((id *)&self->_expectedSpeakerSharedUserID, 0);
  objc_storeStrong((id *)&self->_utteranceSource, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_previousUtterance, 0);
  objc_storeStrong((id *)&self->_originalScore, 0);
  objc_storeStrong((id *)&self->_originalRank, 0);
  objc_storeStrong((id *)&self->_onDeviceUtterancesPresent, 0);
  objc_storeStrong((id *)&self->_interactionId, 0);
  objc_storeStrong((id *)&self->_combinedScore, 0);
  objc_storeStrong((id *)&self->_combinedRank, 0);
  objc_storeStrong((id *)&self->_testRequestOptions, 0);
  objc_storeStrong((id *)&self->_directActionAppId, 0);
  objc_storeStrong((id *)&self->_startRequest, 0);
  objc_storeStrong((id *)&self->_correctedSpeechContext, 0);
  objc_storeStrong((id *)&self->_correctedSpeech, 0);
  objc_storeStrong((id *)&self->_handoffNotification, 0);
  objc_storeStrong((id *)&self->_handoffURLString, 0);
  objc_storeStrong((id *)&self->_handoffRequestData, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_notifyState, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_requestCompletionOptions, 0);
  objc_storeStrong((id *)&self->_legacyDirectActionIdentifier, 0);
  objc_storeStrong((id *)&self->_startLocalRequest, 0);
  objc_storeStrong((id *)&self->_speechRequestOptions, 0);
  objc_storeStrong((id *)&self->_handoffOriginDeviceName, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_turnIdentifier, 0);
}

- (void)setIsSiriXRequest:(BOOL)a3
{
  self->_isSiriXRequest = a3;
}

- (BOOL)isSiriXRequest
{
  return self->_isSiriXRequest;
}

- (void)setNonspeakerConfidenceScores:(id)a3
{
}

- (NSDictionary)nonspeakerConfidenceScores
{
  return self->_nonspeakerConfidenceScores;
}

- (void)setExpectedSpeakerConfidenceScore:(unint64_t)a3
{
  self->_expectedSpeakerConfidenceScore = a3;
}

- (unint64_t)expectedSpeakerConfidenceScore
{
  return self->_expectedSpeakerConfidenceScore;
}

- (void)setExpectedSpeakerSharedUserID:(id)a3
{
}

- (NSString)expectedSpeakerSharedUserID
{
  return self->_expectedSpeakerSharedUserID;
}

- (void)setUtteranceSource:(id)a3
{
}

- (NSString)utteranceSource
{
  return self->_utteranceSource;
}

- (void)setSessionId:(id)a3
{
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setPreviousUtterance:(id)a3
{
}

- (NSString)previousUtterance
{
  return self->_previousUtterance;
}

- (void)setOriginalScore:(id)a3
{
}

- (NSNumber)originalScore
{
  return self->_originalScore;
}

- (void)setOriginalRank:(id)a3
{
}

- (NSNumber)originalRank
{
  return self->_originalRank;
}

- (void)setOnDeviceUtterancesPresent:(id)a3
{
}

- (NSNumber)onDeviceUtterancesPresent
{
  return self->_onDeviceUtterancesPresent;
}

- (void)setInteractionId:(id)a3
{
}

- (NSString)interactionId
{
  return self->_interactionId;
}

- (void)setCombinedScore:(id)a3
{
}

- (NSNumber)combinedScore
{
  return self->_combinedScore;
}

- (void)setCombinedRank:(id)a3
{
}

- (NSNumber)combinedRank
{
  return self->_combinedRank;
}

- (void)setTestRequestOptions:(id)a3
{
}

- (AFTestRequestOptions)testRequestOptions
{
  return self->_testRequestOptions;
}

- (void)setDirectActionEvent:(int64_t)a3
{
  self->_directActionEvent = a3;
}

- (int64_t)directActionEvent
{
  return self->_directActionEvent;
}

- (void)setDirectActionAppId:(id)a3
{
}

- (NSString)directActionAppId
{
  return self->_directActionAppId;
}

- (void)setStartRequest:(id)a3
{
}

- (SAStartRequest)startRequest
{
  return self->_startRequest;
}

- (void)setCorrectedSpeechContext:(id)a3
{
}

- (NSDictionary)correctedSpeechContext
{
  return self->_correctedSpeechContext;
}

- (void)setCorrectedSpeech:(id)a3
{
}

- (NSString)correctedSpeech
{
  return self->_correctedSpeech;
}

- (void)setHandoffNotification:(id)a3
{
}

- (NSString)handoffNotification
{
  return self->_handoffNotification;
}

- (void)setIsATVHandoff:(BOOL)a3
{
  self->_isATVHandoff = a3;
}

- (BOOL)isATVHandoff
{
  return self->_isATVHandoff;
}

- (void)setHandoffRequiresUserInteraction:(BOOL)a3
{
  self->_handoffRequiresUserInteraction = a3;
}

- (BOOL)handoffRequiresUserInteraction
{
  return self->_handoffRequiresUserInteraction;
}

- (void)setHandoffURLString:(id)a3
{
}

- (NSString)handoffURLString
{
  return self->_handoffURLString;
}

- (void)setHandoffRequestData:(id)a3
{
}

- (NSData)handoffRequestData
{
  return self->_handoffRequestData;
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setNotifyState:(id)a3
{
}

- (NSNumber)notifyState
{
  return self->_notifyState;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setRequestCompletionOptions:(id)a3
{
}

- (AFRequestCompletionOptions)requestCompletionOptions
{
  return self->_requestCompletionOptions;
}

- (void)setLegacyDirectActionIdentifier:(id)a3
{
}

- (void)setStartLocalRequest:(id)a3
{
}

- (void)setSpeechRequestOptions:(id)a3
{
}

- (void)setActivationEvent:(int64_t)a3
{
  self->_activationEvent = a3;
}

- (void)setHandoffOriginDeviceName:(id)a3
{
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setTurnIdentifier:(id)a3
{
}

- (NSUUID)turnIdentifier
{
  return self->_turnIdentifier;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[AFRequestInfo allocWithZone:a3] initWithTimestamp:self->_timestamp];
  uint64_t v5 = [(NSUUID *)self->_uuid copy];
  uuid = v4->_uuid;
  v4->_uuid = (NSUUID *)v5;

  [(AFRequestInfo *)v4 setRequestIdentifier:self->_requestIdentifier];
  [(AFRequestInfo *)v4 setTurnIdentifier:self->_turnIdentifier];
  [(AFRequestInfo *)v4 setOptions:self->_options];
  [(AFRequestInfo *)v4 setNotifyState:self->_notifyState];
  [(AFRequestInfo *)v4 setText:self->_text];
  [(AFRequestInfo *)v4 setLegacyDirectActionIdentifier:self->_legacyDirectActionIdentifier];
  [(AFRequestInfo *)v4 setHandoffOriginDeviceName:self->_handoffOriginDeviceName];
  [(AFRequestInfo *)v4 setHandoffRequestData:self->_handoffRequestData];
  [(AFRequestInfo *)v4 setHandoffURLString:self->_handoffURLString];
  [(AFRequestInfo *)v4 setHandoffRequiresUserInteraction:self->_handoffRequiresUserInteraction];
  [(AFRequestInfo *)v4 setHandoffNotification:self->_handoffNotification];
  [(AFRequestInfo *)v4 setCorrectedSpeech:self->_correctedSpeech];
  [(AFRequestInfo *)v4 setCorrectedSpeechContext:self->_correctedSpeechContext];
  [(AFRequestInfo *)v4 setStartRequest:self->_startRequest];
  [(AFRequestInfo *)v4 setStartLocalRequest:self->_startLocalRequest];
  [(AFRequestInfo *)v4 setDirectActionAppId:self->_directActionAppId];
  [(AFRequestInfo *)v4 setDirectActionEvent:self->_directActionEvent];
  [(AFRequestInfo *)v4 setActivationEvent:self->_activationEvent];
  [(AFRequestInfo *)v4 setSpeechRequestOptions:self->_speechRequestOptions];
  [(AFRequestInfo *)v4 setTestRequestOptions:self->_testRequestOptions];
  [(AFRequestInfo *)v4 setCombinedRank:self->_combinedRank];
  [(AFRequestInfo *)v4 setCombinedScore:self->_combinedScore];
  [(AFRequestInfo *)v4 setInteractionId:self->_interactionId];
  [(AFRequestInfo *)v4 setOnDeviceUtterancesPresent:self->_onDeviceUtterancesPresent];
  [(AFRequestInfo *)v4 setOriginalRank:self->_originalRank];
  [(AFRequestInfo *)v4 setOriginalScore:self->_originalScore];
  [(AFRequestInfo *)v4 setPreviousUtterance:self->_previousUtterance];
  [(AFRequestInfo *)v4 setSessionId:self->_sessionId];
  [(AFRequestInfo *)v4 setUtteranceSource:self->_utteranceSource];
  [(AFRequestInfo *)v4 setRequestCompletionOptions:self->_requestCompletionOptions];
  [(AFRequestInfo *)v4 setExpectedSpeakerSharedUserID:self->_expectedSpeakerSharedUserID];
  [(AFRequestInfo *)v4 setExpectedSpeakerConfidenceScore:self->_expectedSpeakerConfidenceScore];
  [(AFRequestInfo *)v4 setNonspeakerConfidenceScores:self->_nonspeakerConfidenceScores];
  return v4;
}

- (AFRequestInfo)initWithCoder:(id)a3
{
  v76[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
  uint64_t v6 = [v5 unsignedLongLongValue];

  v7 = [(AFRequestInfo *)self initWithTimestamp:v6];
  if (v7)
  {
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_uuid"];
    uuid = v7->_uuid;
    v7->_uuid = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_requestIdentifier"];
    requestIdentifier = v7->_requestIdentifier;
    v7->_requestIdentifier = (NSUUID *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_turnIdentifier"];
    turnIdentifier = v7->_turnIdentifier;
    v7->_turnIdentifier = (NSUUID *)v12;

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_options"];
    v7->_options = [v14 unsignedIntegerValue];

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_notifyState"];
    notifyState = v7->_notifyState;
    v7->_notifyState = (NSNumber *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_text"];
    text = v7->_text;
    v7->_text = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_legacyDirectActionIdentifier"];
    legacyDirectActionIdentifier = v7->_legacyDirectActionIdentifier;
    v7->_legacyDirectActionIdentifier = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_handoffOriginDeviceName"];
    handoffOriginDeviceName = v7->_handoffOriginDeviceName;
    v7->_handoffOriginDeviceName = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_handoffRequestData"];
    handoffRequestData = v7->_handoffRequestData;
    v7->_handoffRequestData = (NSData *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_handoffURLString"];
    handoffURLString = v7->_handoffURLString;
    v7->_handoffURLString = (NSString *)v25;

    v7->_handoffRequiresUserInteraction = [v4 decodeBoolForKey:@"_handoffRequiresUserInteraction"];
    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_handoffNotification"];
    handoffNotification = v7->_handoffNotification;
    v7->_handoffNotification = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_correctedSpeech"];
    correctedSpeech = v7->_correctedSpeech;
    v7->_correctedSpeech = (NSString *)v29;

    v31 = (void *)MEMORY[0x1E4F1CAD0];
    v76[0] = objc_opt_class();
    v76[1] = objc_opt_class();
    v76[2] = objc_opt_class();
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:3];
    v33 = [v31 setWithArray:v32];
    uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"_correctedSpeechContext"];
    correctedSpeechContext = v7->_correctedSpeechContext;
    v7->_correctedSpeechContext = (NSDictionary *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_startRequest"];
    startRequest = v7->_startRequest;
    v7->_startRequest = (SAStartRequest *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_startLocalRequest"];
    startLocalRequest = v7->_startLocalRequest;
    v7->_startLocalRequest = (SAStartLocalRequest *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_directActionAppId"];
    directActionAppId = v7->_directActionAppId;
    v7->_directActionAppId = (NSString *)v40;

    v7->_directActionEvent = [v4 decodeIntegerForKey:@"_directActionEvent"];
    v7->_activationEvent = [v4 decodeIntegerForKey:@"_activationEvent"];
    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_speechRequestOptions"];
    speechRequestOptions = v7->_speechRequestOptions;
    v7->_speechRequestOptions = (AFSpeechRequestOptions *)v42;

    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_testRequestOptions"];
    testRequestOptions = v7->_testRequestOptions;
    v7->_testRequestOptions = (AFTestRequestOptions *)v44;

    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_combinedRank"];
    combinedRank = v7->_combinedRank;
    v7->_combinedRank = (NSNumber *)v46;

    uint64_t v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_combinedScore"];
    combinedScore = v7->_combinedScore;
    v7->_combinedScore = (NSNumber *)v48;

    uint64_t v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_interactionId"];
    interactionId = v7->_interactionId;
    v7->_interactionId = (NSString *)v50;

    uint64_t v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_onDeviceUtterancesPresent"];
    onDeviceUtterancesPresent = v7->_onDeviceUtterancesPresent;
    v7->_onDeviceUtterancesPresent = (NSNumber *)v52;

    uint64_t v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_originalRank"];
    originalRank = v7->_originalRank;
    v7->_originalRank = (NSNumber *)v54;

    uint64_t v56 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_originalScore"];
    originalScore = v7->_originalScore;
    v7->_originalScore = (NSNumber *)v56;

    uint64_t v58 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_previousUtterance"];
    previousUtterance = v7->_previousUtterance;
    v7->_previousUtterance = (NSString *)v58;

    uint64_t v60 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sessionId"];
    sessionId = v7->_sessionId;
    v7->_sessionId = (NSString *)v60;

    uint64_t v62 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_utteranceSource"];
    utteranceSource = v7->_utteranceSource;
    v7->_utteranceSource = (NSString *)v62;

    uint64_t v64 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_requestCompletionOptions"];
    requestCompletionOptions = v7->_requestCompletionOptions;
    v7->_requestCompletionOptions = (AFRequestCompletionOptions *)v64;

    uint64_t v66 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_expectedSpeakerSharedUserID"];
    expectedSpeakerSharedUserID = v7->_expectedSpeakerSharedUserID;
    v7->_expectedSpeakerSharedUserID = (NSString *)v66;

    v68 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_expectedSpeakerConfidenceScore"];
    v7->_expectedSpeakerConfidenceScore = [v68 unsignedIntegerValue];

    v69 = (void *)MEMORY[0x1E4F1CAD0];
    v75[0] = objc_opt_class();
    v75[1] = objc_opt_class();
    v75[2] = objc_opt_class();
    v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:3];
    v71 = [v69 setWithArray:v70];
    uint64_t v72 = [v4 decodeObjectOfClasses:v71 forKey:@"_nonspeakerConfidenceScores"];
    nonspeakerConfidenceScores = v7->_nonspeakerConfidenceScores;
    v7->_nonspeakerConfidenceScores = (NSDictionary *)v72;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uuid = self->_uuid;
  id v8 = a3;
  [v8 encodeObject:uuid forKey:@"_uuid"];
  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_timestamp];
  [v8 encodeObject:v5 forKey:@"_timestamp"];

  [v8 encodeObject:self->_requestIdentifier forKey:@"_requestIdentifier"];
  [v8 encodeObject:self->_turnIdentifier forKey:@"_turnIdentifier"];
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_options];
  [v8 encodeObject:v6 forKey:@"_options"];

  [v8 encodeObject:self->_notifyState forKey:@"_notifyState"];
  [v8 encodeObject:self->_text forKey:@"_text"];
  [v8 encodeObject:self->_legacyDirectActionIdentifier forKey:@"_legacyDirectActionIdentifier"];
  [v8 encodeObject:self->_handoffOriginDeviceName forKey:@"_handoffOriginDeviceName"];
  [v8 encodeObject:self->_handoffRequestData forKey:@"_handoffRequestData"];
  [v8 encodeObject:self->_handoffURLString forKey:@"_handoffURLString"];
  [v8 encodeBool:self->_handoffRequiresUserInteraction forKey:@"_handoffRequiresUserInteraction"];
  [v8 encodeObject:self->_handoffNotification forKey:@"_handoffNotification"];
  [v8 encodeObject:self->_correctedSpeech forKey:@"_correctedSpeech"];
  [v8 encodeObject:self->_correctedSpeechContext forKey:@"_correctedSpeechContext"];
  [v8 encodeObject:self->_startRequest forKey:@"_startRequest"];
  [v8 encodeObject:self->_startLocalRequest forKey:@"_startLocalRequest"];
  [v8 encodeObject:self->_directActionAppId forKey:@"_directActionAppId"];
  [v8 encodeInteger:self->_directActionEvent forKey:@"_directActionEvent"];
  [v8 encodeInteger:self->_activationEvent forKey:@"_activationEvent"];
  [v8 encodeObject:self->_speechRequestOptions forKey:@"_speechRequestOptions"];
  [v8 encodeObject:self->_testRequestOptions forKey:@"_testRequestOptions"];
  [v8 encodeObject:self->_combinedRank forKey:@"_combinedRank"];
  [v8 encodeObject:self->_combinedScore forKey:@"_combinedScore"];
  [v8 encodeObject:self->_interactionId forKey:@"_interactionId"];
  [v8 encodeObject:self->_onDeviceUtterancesPresent forKey:@"_onDeviceUtterancesPresent"];
  [v8 encodeObject:self->_originalRank forKey:@"_originalRank"];
  [v8 encodeObject:self->_originalScore forKey:@"_originalScore"];
  [v8 encodeObject:self->_previousUtterance forKey:@"_previousUtterance"];
  [v8 encodeObject:self->_sessionId forKey:@"_sessionId"];
  [v8 encodeObject:self->_utteranceSource forKey:@"_utteranceSource"];
  [v8 encodeObject:self->_requestCompletionOptions forKey:@"_requestCompletionOptions"];
  [v8 encodeObject:self->_expectedSpeakerSharedUserID forKey:@"_expectedSpeakerSharedUserID"];
  v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_expectedSpeakerConfidenceScore];
  [v8 encodeObject:v7 forKey:@"_expectedSpeakerConfidenceScore"];

  [v8 encodeObject:self->_nonspeakerConfidenceScores forKey:@"_nonspeakerConfidenceScores"];
}

- (id)description
{
  v29.receiver = self;
  v29.super_class = (Class)AFRequestInfo;
  uint64_t v3 = [(AFRequestInfo *)&v29 description];
  turnIdentifier = self->_turnIdentifier;
  requestIdentifier = self->_requestIdentifier;
  uuid = self->_uuid;
  unint64_t timestamp = self->_timestamp;
  notifyState = self->_notifyState;
  unint64_t options = self->_options;
  text = self->_text;
  legacyDirectActionIdentifier = self->_legacyDirectActionIdentifier;
  uint64_t v5 = (__CFString *)legacyDirectActionIdentifier;
  if (!legacyDirectActionIdentifier)
  {
    unint64_t directActionEvent = self->_directActionEvent;
    if (directActionEvent > 0x12) {
      v7 = @"Invalid direct action event";
    }
    else {
      v7 = off_1E592A9C8[directActionEvent];
    }
    uint64_t v5 = v7;
  }
  v20 = v5;
  v28 = (void *)v3;
  startRequest = self->_startRequest;
  if (!startRequest) {
    startRequest = self->_startLocalRequest;
  }
  handoffRequestData = self->_handoffRequestData;
  handoffURLString = self->_handoffURLString;
  BOOL handoffRequiresUserInteraction = self->_handoffRequiresUserInteraction;
  handoffNotification = self->_handoffNotification;
  correctedSpeech = self->_correctedSpeech;
  handoffOriginDeviceName = self->_handoffOriginDeviceName;
  unint64_t activationEvent = self->_activationEvent;
  if (activationEvent > 0xB) {
    v16 = @"Unknown";
  }
  else {
    v16 = off_1E5925920[activationEvent];
  }
  uint64_t v17 = v16;
  objc_msgSend(v28, "stringByAppendingFormat:", @"uuid: %@, timestamp: %llu, requestId: %@, turnId: %@, options: %lu, notifyState: %@ text: %@ directAction: %@ handoffOriginDeviceName: %@ handOffData: %@ handoffURL: %@ handoffRequiresUserInteraction ? %d handoffNotification %@ correctedSpeech: %@ startRequest: %@ activationEvent: %@ speechRequestOptions: %@ testRequestOptions: %@ requestCompletionOptions: %@ sharedUserID: %@ confidenceScore: %lu nonspeakerConfidenceScores: %@", uuid, timestamp, requestIdentifier, turnIdentifier, options, notifyState, text, v20, handoffOriginDeviceName, handoffRequestData, handoffURLString, handoffRequiresUserInteraction, handoffNotification, correctedSpeech, startRequest, v17,
    self->_speechRequestOptions,
    self->_testRequestOptions,
    self->_requestCompletionOptions,
    self->_expectedSpeakerSharedUserID,
    self->_expectedSpeakerConfidenceScore,
  v18 = self->_nonspeakerConfidenceScores);

  if (!legacyDirectActionIdentifier) {
  return v18;
  }
}

- (NSString)legacyDirectActionIdentifier
{
  return self->_legacyDirectActionIdentifier;
}

- (SAStartLocalRequest)startLocalRequest
{
  return self->_startLocalRequest;
}

- (AFSpeechRequestOptions)speechRequestOptions
{
  v2 = (void *)[(AFSpeechRequestOptions *)self->_speechRequestOptions copy];
  return (AFSpeechRequestOptions *)v2;
}

- (BOOL)isSpeechRequest
{
  speechRequestOptions = self->_speechRequestOptions;
  if (speechRequestOptions) {
    LOBYTE(speechRequestOptions) = [(AFSpeechRequestOptions *)speechRequestOptions activationEvent] != 28;
  }
  return (char)speechRequestOptions;
}

- (int64_t)activationEvent
{
  return self->_activationEvent;
}

- (NSString)handoffOriginDeviceName
{
  return self->_handoffOriginDeviceName;
}

- (BOOL)requiresUserInteraction
{
  return self->_handoffRequiresUserInteraction;
}

- (AFRequestInfo)initWithTimestamp:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AFRequestInfo;
  id v4 = [(AFRequestInfo *)&v8 init];
  if (v4)
  {
    uint64_t v5 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    uuid = v4->_uuid;
    v4->_uuid = v5;

    v4->_unint64_t timestamp = a3;
  }
  return v4;
}

- (AFRequestInfo)init
{
  uint64_t v3 = mach_absolute_time();
  return [(AFRequestInfo *)self initWithTimestamp:v3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)testRequestWithStartLocalRequest:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(AFRequestInfo);
  [(AFRequestInfo *)v4 setStartLocalRequest:v3];

  return v4;
}

+ (id)testRequestWithText:(id)a3 speechRequestOptions:(id)a4 testOptions:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_alloc_init(AFRequestInfo);
  [(AFRequestInfo *)v10 setActivationEvent:8];
  [(AFRequestInfo *)v10 setText:v9];

  [(AFRequestInfo *)v10 setSpeechRequestOptions:v8];
  [(AFRequestInfo *)v10 setTestRequestOptions:v7];

  return v10;
}

@end