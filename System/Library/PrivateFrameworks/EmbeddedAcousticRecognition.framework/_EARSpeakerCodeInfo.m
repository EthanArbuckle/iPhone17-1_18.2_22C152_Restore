@interface _EARSpeakerCodeInfo
- (BOOL)isSpeakerCodeUsed;
- (NSNumber)nnetVersion;
- (NSNumber)numFrames;
- (NSNumber)recognitionOffset;
- (NSNumber)trainingOffset;
- (NSString)accumulatedGradient;
- (NSString)inferenceSpeakerCode;
- (NSString)trainingSpeakerCode;
- (_EARSpeakerCodeInfo)initWithLanguage:(id)a3;
- (void)setInferenceSpeakerCode:(id)a3;
- (void)setIsSpeakerCodeUsed:(BOOL)a3;
- (void)setNumFrames:(id)a3;
@end

@implementation _EARSpeakerCodeInfo

- (_EARSpeakerCodeInfo)initWithLanguage:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)_EARSpeakerCodeInfo;
  v5 = [(_EARSpeakerCodeInfo *)&v40 init];
  if (v5)
  {
    id v32 = v4;
    v6 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:0];
    v7 = (void *)[objc_alloc(NSNumber) initWithUnsignedLong:0];
    v8 = (void *)[objc_alloc(NSNumber) initWithUnsignedLong:0];
    v9 = (void *)[objc_alloc(NSNumber) initWithUnsignedLong:0];
    id v38 = 0;
    id v39 = 0;
    id v36 = v6;
    id v37 = 0;
    id v34 = v8;
    id v35 = v7;
    id v33 = v9;
    v31 = objc_alloc_init(_EARSpeakerCodeReader);
    [(_EARSpeakerCodeReader *)v31 getTrainingSpeakerCode:&v39 inferenceSpeakerCode:&v38 accumulatedGradient:&v37 nnetVersion:&v36 numFrames:&v35 trainingOffset:&v34 recognitionOffset:&v33 language:v4];
    v10 = (NSString *)v39;
    v11 = (NSString *)v38;
    v30 = (NSString *)v37;
    v12 = (NSNumber *)v36;

    v13 = (NSNumber *)v35;
    v14 = (NSNumber *)v34;

    v15 = (NSNumber *)v33;
    nnetVersion = v5->_nnetVersion;
    v5->_nnetVersion = v12;
    v17 = v12;

    numFrames = v5->_numFrames;
    v5->_numFrames = v13;
    v19 = v13;

    trainingOffset = v5->_trainingOffset;
    v5->_trainingOffset = v14;
    v21 = v14;

    recognitionOffset = v5->_recognitionOffset;
    v5->_recognitionOffset = v15;
    v23 = v15;

    trainingSpeakerCode = v5->_trainingSpeakerCode;
    v5->_trainingSpeakerCode = v10;
    v25 = v10;

    inferenceSpeakerCode = v5->_inferenceSpeakerCode;
    v5->_inferenceSpeakerCode = v11;
    v27 = v11;

    accumulatedGradient = v5->_accumulatedGradient;
    v5->_accumulatedGradient = v30;

    id v4 = v32;
  }

  return v5;
}

- (NSString)trainingSpeakerCode
{
  return self->_trainingSpeakerCode;
}

- (NSString)inferenceSpeakerCode
{
  return self->_inferenceSpeakerCode;
}

- (void)setInferenceSpeakerCode:(id)a3
{
}

- (NSString)accumulatedGradient
{
  return self->_accumulatedGradient;
}

- (NSNumber)numFrames
{
  return self->_numFrames;
}

- (void)setNumFrames:(id)a3
{
}

- (NSNumber)nnetVersion
{
  return self->_nnetVersion;
}

- (NSNumber)trainingOffset
{
  return self->_trainingOffset;
}

- (NSNumber)recognitionOffset
{
  return self->_recognitionOffset;
}

- (BOOL)isSpeakerCodeUsed
{
  return self->_isSpeakerCodeUsed;
}

- (void)setIsSpeakerCodeUsed:(BOOL)a3
{
  self->_isSpeakerCodeUsed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognitionOffset, 0);
  objc_storeStrong((id *)&self->_trainingOffset, 0);
  objc_storeStrong((id *)&self->_nnetVersion, 0);
  objc_storeStrong((id *)&self->_numFrames, 0);
  objc_storeStrong((id *)&self->_accumulatedGradient, 0);
  objc_storeStrong((id *)&self->_inferenceSpeakerCode, 0);
  objc_storeStrong((id *)&self->_trainingSpeakerCode, 0);
}

@end