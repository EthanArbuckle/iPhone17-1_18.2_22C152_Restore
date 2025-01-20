@interface AFSpeechPackage
+ (BOOL)supportsSecureCoding;
- (AFSpeechAudioAnalytics)audioAnalytics;
- (AFSpeechLatticeMitigatorResult)latticeMitigatorResult;
- (AFSpeechPackage)init;
- (AFSpeechPackage)initWithCoder:(id)a3;
- (AFSpeechPackage)initWithDictionary:(id)a3;
- (AFSpeechPackage)initWithRecognition:(id)a3 rawRecognition:(id)a4 audioAnalytics:(id)a5 isFinal:(BOOL)a6 utteranceStart:(double)a7;
- (AFSpeechPackage)initWithRecognition:(id)a3 rawRecognition:(id)a4 audioAnalytics:(id)a5 isFinal:(BOOL)a6 utteranceStart:(double)a7 latticeMitigatorResult:(id)a8;
- (AFSpeechPackage)initWithRecognition:(id)a3 unfilteredRecognition:(id)a4 rawRecognition:(id)a5 audioAnalytics:(id)a6 isFinal:(BOOL)a7 utteranceStart:(double)a8;
- (AFSpeechPackage)initWithRecognition:(id)a3 unfilteredRecognition:(id)a4 rawRecognition:(id)a5 audioAnalytics:(id)a6 isFinal:(BOOL)a7 utteranceStart:(double)a8 latticeMitigatorResult:(id)a9;
- (AFSpeechPackage)initWithRecognition:(id)a3 unfilteredRecognition:(id)a4 rawRecognition:(id)a5 audioAnalytics:(id)a6 isFinal:(BOOL)a7 utteranceStart:(double)a8 latticeMitigatorResult:(id)a9 recognitionPaused:(BOOL)a10;
- (AFSpeechPackage)initWithRecognition:(id)a3 unfilteredRecognition:(id)a4 rawRecognition:(id)a5 audioAnalytics:(id)a6 isFinal:(BOOL)a7 utteranceStart:(double)a8 latticeMitigatorResult:(id)a9 recognitionPaused:(BOOL)a10 speechProfileUsed:(BOOL)a11;
- (AFSpeechPackage)initWithRecognition:(id)a3 unfilteredRecognition:(id)a4 rawRecognition:(id)a5 audioAnalytics:(id)a6 isFinal:(BOOL)a7 utteranceStart:(double)a8 latticeMitigatorResult:(id)a9 recognitionPaused:(BOOL)a10 speechProfileUsed:(BOOL)a11 resultCandidateId:(int64_t)a12;
- (AFSpeechPackage)initWithRecognition:(id)a3 unfilteredRecognition:(id)a4 rawRecognition:(id)a5 audioAnalytics:(id)a6 isFinal:(BOOL)a7 utteranceStart:(double)a8 latticeMitigatorResult:(id)a9 recognitionPaused:(BOOL)a10 speechProfileUsed:(BOOL)a11 resultCandidateId:(int64_t)a12 endOfSentenceLikelihood:(id)a13;
- (AFSpeechPackage)initWithRecognition:(id)a3 unfilteredRecognition:(id)a4 rawRecognition:(id)a5 audioAnalytics:(id)a6 isFinal:(BOOL)a7 utteranceStart:(double)a8 latticeMitigatorResult:(id)a9 recognitionPaused:(BOOL)a10 speechProfileUsed:(BOOL)a11 resultCandidateId:(int64_t)a12 endOfSentenceLikelihood:(id)a13 modelVersion:(id)a14 acousticModelVersion:(id)a15;
- (AFSpeechPackage)initWithRecognition:(id)a3 unfilteredRecognition:(id)a4 rawRecognition:(id)a5 audioAnalytics:(id)a6 isFinal:(BOOL)a7 utteranceStart:(double)a8 latticeMitigatorResult:(id)a9 recognitionPaused:(BOOL)a10 speechProfileUsed:(BOOL)a11 resultCandidateId:(int64_t)a12 endOfSentenceLikelihood:(id)a13 modelVersion:(id)a14 acousticModelVersion:(id)a15 potentialCommandPrecedingUtterance:(id)a16 potentialCommandUtterance:(id)a17;
- (AFSpeechPackage)initWithRecognition:(id)a3 unfilteredRecognition:(id)a4 rawRecognition:(id)a5 audioAnalytics:(id)a6 isFinal:(BOOL)a7 utteranceStart:(double)a8 latticeMitigatorResult:(id)a9 recognitionPaused:(BOOL)a10 speechProfileUsed:(BOOL)a11 resultCandidateId:(int64_t)a12 endOfSentenceLikelihood:(id)a13 modelVersion:(id)a14 acousticModelVersion:(id)a15 potentialCommandPrecedingUtterance:(id)a16 potentialCommandUtterance:(id)a17 numOneBestTokensExcludingTriggerPhrase:(int64_t)a18;
- (AFSpeechPackage)potentialCommandPrecedingUtterance;
- (AFSpeechPackage)potentialCommandUtterance;
- (AFSpeechRecognition)rawRecognition;
- (AFSpeechRecognition)recognition;
- (AFSpeechRecognition)unfilteredRecognition;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFinal;
- (BOOL)recognitionPaused;
- (BOOL)speechProfileUsed;
- (NSNumber)endOfSentenceLikelihood;
- (NSString)acousticModelVersion;
- (NSString)modelVersion;
- (double)utteranceStart;
- (id)dictionaryRepresentation;
- (int64_t)numOneBestTokensExcludingTriggerPhrase;
- (int64_t)resultCandidateId;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPotentialCommandPrecedingUtterance:(id)a3;
- (void)setPotentialCommandUtterance:(id)a3;
@end

@implementation AFSpeechPackage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acousticModelVersion, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_potentialCommandUtterance, 0);
  objc_storeStrong((id *)&self->_potentialCommandPrecedingUtterance, 0);
  objc_storeStrong((id *)&self->_endOfSentenceLikelihood, 0);
  objc_storeStrong((id *)&self->_latticeMitigatorResult, 0);
  objc_storeStrong((id *)&self->_audioAnalytics, 0);
  objc_storeStrong((id *)&self->_rawRecognition, 0);
  objc_storeStrong((id *)&self->_unfilteredRecognition, 0);
  objc_storeStrong((id *)&self->_recognition, 0);
}

- (int64_t)numOneBestTokensExcludingTriggerPhrase
{
  return self->_numOneBestTokensExcludingTriggerPhrase;
}

- (NSString)acousticModelVersion
{
  return self->_acousticModelVersion;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (int64_t)resultCandidateId
{
  return self->_resultCandidateId;
}

- (AFSpeechPackage)potentialCommandUtterance
{
  return self->_potentialCommandUtterance;
}

- (AFSpeechPackage)potentialCommandPrecedingUtterance
{
  return self->_potentialCommandPrecedingUtterance;
}

- (NSNumber)endOfSentenceLikelihood
{
  return self->_endOfSentenceLikelihood;
}

- (BOOL)speechProfileUsed
{
  return self->_speechProfileUsed;
}

- (BOOL)recognitionPaused
{
  return self->_recognitionPaused;
}

- (AFSpeechLatticeMitigatorResult)latticeMitigatorResult
{
  return self->_latticeMitigatorResult;
}

- (double)utteranceStart
{
  return self->_utteranceStart;
}

- (BOOL)isFinal
{
  return self->_isFinal;
}

- (AFSpeechAudioAnalytics)audioAnalytics
{
  return self->_audioAnalytics;
}

- (AFSpeechRecognition)rawRecognition
{
  return self->_rawRecognition;
}

- (AFSpeechRecognition)unfilteredRecognition
{
  return self->_unfilteredRecognition;
}

- (AFSpeechRecognition)recognition
{
  return self->_recognition;
}

- (void)setPotentialCommandUtterance:(id)a3
{
}

- (void)setPotentialCommandPrecedingUtterance:(id)a3
{
}

- (unint64_t)hash
{
  unint64_t v3 = [(AFSpeechRecognition *)self->_recognition hash];
  unint64_t v4 = [(AFSpeechRecognition *)self->_rawRecognition hash] ^ v3;
  v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_resultCandidateId];
  uint64_t v6 = v4 ^ [v5 hash] ^ (16 * (self->_isFinal ^ self->_recognitionPaused ^ self->_speechProfileUsed));
  v7 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_utteranceStart];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  BOOL v11 = (objc_opt_isKindOfClass() & 1) != 0
     && ((v5 = (AFSpeechRecognition *)*((void *)v4 + 2), v5 == self->_recognition)
      || -[AFSpeechRecognition isEqual:](v5, "isEqual:"))
     && ((uint64_t v6 = (AFSpeechRecognition *)*((void *)v4 + 3), v6 == self->_unfilteredRecognition)
      || -[AFSpeechRecognition isEqual:](v6, "isEqual:"))
     && ((v7 = (AFSpeechRecognition *)*((void *)v4 + 4), v7 == self->_rawRecognition)
      || -[AFSpeechRecognition isEqual:](v7, "isEqual:"))
     && v4[8] == self->_isFinal
     && *((double *)v4 + 6) == self->_utteranceStart
     && v4[9] == self->_recognitionPaused
     && v4[10] == self->_speechProfileUsed
     && *((void *)v4 + 11) == self->_resultCandidateId
     && ((unint64_t v8 = (NSNumber *)*((void *)v4 + 8), v8 == self->_endOfSentenceLikelihood)
      || -[NSNumber isEqual:](v8, "isEqual:"))
     && ((v9 = (NSString *)*((void *)v4 + 12), v9 == self->_modelVersion)
      || -[NSString isEqualToString:](v9, "isEqualToString:"))
     && ((v10 = (NSString *)*((void *)v4 + 13), v10 == self->_acousticModelVersion)
      || -[NSString isEqualToString:](v10, "isEqualToString:"))
     && *((void *)v4 + 14) == self->_numOneBestTokensExcludingTriggerPhrase;

  return v11;
}

- (id)dictionaryRepresentation
{
  v21[12] = *MEMORY[0x1E4F143B8];
  v20[0] = @"recognition";
  v19 = [(AFSpeechRecognition *)self->_recognition dictionaryRepresentation];
  v21[0] = v19;
  v20[1] = @"unfilteredRecognition";
  v18 = [(AFSpeechRecognition *)self->_unfilteredRecognition dictionaryRepresentation];
  v21[1] = v18;
  v20[2] = @"rawRecognition";
  v17 = [(AFSpeechRecognition *)self->_rawRecognition dictionaryRepresentation];
  v21[2] = v17;
  v20[3] = @"isFinal";
  v16 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isFinal];
  v21[3] = v16;
  v20[4] = @"utteranceStart";
  v15 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_utteranceStart];
  v21[4] = v15;
  v20[5] = @"recognitionPaused";
  v14 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_recognitionPaused];
  v21[5] = v14;
  v20[6] = @"speechProfileUsed";
  unint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_speechProfileUsed];
  v21[6] = v3;
  v20[7] = @"resultCandidateId";
  unint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_resultCandidateId];
  v21[7] = v4;
  v20[8] = @"endOfSentenceLikelihood";
  endOfSentenceLikelihood = self->_endOfSentenceLikelihood;
  uint64_t v6 = endOfSentenceLikelihood;
  if (!endOfSentenceLikelihood)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[8] = v6;
  v20[9] = @"modelVersion";
  modelVersion = self->_modelVersion;
  unint64_t v8 = modelVersion;
  if (!modelVersion)
  {
    unint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[9] = v8;
  v20[10] = @"acousticModelVersion";
  acousticModelVersion = self->_acousticModelVersion;
  v10 = acousticModelVersion;
  if (!acousticModelVersion)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[10] = v10;
  v20[11] = @"numOneBestTokensExcludingTriggerPhrase";
  BOOL v11 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_numOneBestTokensExcludingTriggerPhrase];
  v21[11] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:12];

  if (acousticModelVersion)
  {
    if (modelVersion) {
      goto LABEL_9;
    }
LABEL_14:

    if (endOfSentenceLikelihood) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!modelVersion) {
    goto LABEL_14;
  }
LABEL_9:
  if (endOfSentenceLikelihood) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:
  return v12;
}

- (AFSpeechPackage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"recognition"];
  uint64_t v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (AFSpeechRecognition *)objc_claimAutoreleasedReturnValue();
  id v8 = v5;
  if (!v8)
  {
    id v12 = 0;
    v51 = 0;
LABEL_39:

    goto LABEL_40;
  }
  NSClassFromString((NSString *)&v7->super.isa);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v51 = 0;
    id v12 = v8;
    goto LABEL_39;
  }

  v7 = [[AFSpeechRecognition alloc] initWithDictionary:v8];
  if (v7)
  {
    v9 = [v4 objectForKey:@"unfilteredRecognition"];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    BOOL v11 = (AFSpeechRecognition *)objc_claimAutoreleasedReturnValue();
    id v12 = v9;
    if (v12)
    {
      NSClassFromString((NSString *)&v11->super.isa);
      if (objc_opt_isKindOfClass())
      {

        BOOL v11 = [[AFSpeechRecognition alloc] initWithDictionary:v12];
        if (!v11)
        {
          v51 = 0;
LABEL_38:

          goto LABEL_39;
        }
        v13 = [v4 objectForKey:@"rawRecognition"];
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        p_isa = (NSString *)objc_claimAutoreleasedReturnValue();
        id v16 = v13;
        if (v16)
        {
          NSClassFromString(p_isa);
          if (objc_opt_isKindOfClass())
          {

            v17 = [[AFSpeechRecognition alloc] initWithDictionary:v16];
            if (!v17)
            {
              p_isa = 0;
              v51 = 0;
LABEL_36:

              goto LABEL_37;
            }
            v64 = v17;
            v18 = [v4 objectForKey:@"isFinal"];
            v19 = (objc_class *)objc_opt_class();
            NSStringFromClass(v19);
            v20 = (NSString *)objc_claimAutoreleasedReturnValue();
            id v21 = v18;
            if (v21)
            {
              NSClassFromString(v20);
              if (objc_opt_isKindOfClass())
              {
                v62 = v21;

                v22 = [v4 objectForKey:@"utteranceStart"];
                v23 = (objc_class *)objc_opt_class();
                v24 = NSStringFromClass(v23);
                v63 = v22;
                LODWORD(v22) = strictValidationOfObjectWithClassType(v22, v24);

                if (!v22)
                {
                  v51 = 0;
                  id v21 = v62;
                  p_isa = (NSString *)&v64->super.isa;
                  goto LABEL_34;
                }
                v25 = [v4 objectForKey:@"recognitionPaused"];
                v26 = (objc_class *)objc_opt_class();
                v27 = NSStringFromClass(v26);
                v61 = v25;
                BOOL v28 = strictValidationOfObjectWithClassType(v25, v27);

                p_isa = (NSString *)&v64->super.isa;
                if (v28)
                {
                  v29 = [v4 objectForKey:@"speechProfileUsed"];
                  v30 = (objc_class *)objc_opt_class();
                  v31 = NSStringFromClass(v30);
                  v60 = v29;
                  LODWORD(v29) = strictValidationOfObjectWithClassType(v29, v31);

                  if (v29)
                  {
                    v32 = [v4 objectForKey:@"resultCandidateId"];
                    v33 = (objc_class *)objc_opt_class();
                    v34 = NSStringFromClass(v33);
                    v59 = v32;
                    LODWORD(v32) = strictValidationOfObjectWithClassType(v32, v34);

                    if (v32)
                    {
                      v35 = [v4 objectForKey:@"endOfSentenceLikelihood"];
                      v36 = (objc_class *)objc_opt_class();
                      v37 = NSStringFromClass(v36);
                      v58 = v35;
                      LODWORD(v35) = strictValidationOfObjectWithClassType(v35, v37);

                      if (v35)
                      {
                        v38 = [v4 objectForKey:@"modelVersion"];
                        v39 = (objc_class *)objc_opt_class();
                        v40 = NSStringFromClass(v39);
                        BOOL v41 = strictValidationOfObjectWithClassType(v38, v40);

                        if (v41)
                        {
                          v42 = [v4 objectForKey:@"acousticModelVersion"];
                          v43 = (objc_class *)objc_opt_class();
                          v44 = NSStringFromClass(v43);
                          v57 = v42;
                          LODWORD(v42) = strictValidationOfObjectWithClassType(v42, v44);

                          if (v42)
                          {
                            v45 = [v4 objectForKey:@"numOneBestTokensExcludingTriggerPhrase"];
                            v46 = (objc_class *)objc_opt_class();
                            v47 = NSStringFromClass(v46);
                            v56 = v45;
                            LODWORD(v45) = strictValidationOfObjectWithClassType(v45, v47);

                            if (v45)
                            {
                              uint64_t v48 = [v62 BOOLValue];
                              [(NSString *)v63 doubleValue];
                              double v50 = v49;
                              char v55 = [v61 BOOLValue];
                              BYTE1(v54) = [v60 BOOLValue];
                              LOBYTE(v54) = v55;
                              self = objc_retain(-[AFSpeechPackage initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:endOfSentenceLikelihood:modelVersion:acousticModelVersion:potentialCommandPrecedingUtterance:potentialCommandUtterance:numOneBestTokensExcludingTriggerPhrase:](self, "initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:endOfSentenceLikelihood:modelVersion:acousticModelVersion:potentialCommandPrecedingUtterance:potentialCommandUtterance:numOneBestTokensExcludingTriggerPhrase:", v7, v11, v64, 0, v48, 0, v50, v54, (int)[v59 intValue], v58, v38, v57, 0,
                                         0,
                                         (int)[v56 intValue]));
                              v51 = self;
                            }
                            else
                            {
                              v51 = 0;
                            }
                          }
                          else
                          {
                            v51 = 0;
                          }
                        }
                        else
                        {
                          v51 = 0;
                        }

                        id v21 = v62;
                        p_isa = (NSString *)&v64->super.isa;
                      }
                      else
                      {
                        v51 = 0;
                        id v21 = v62;
                      }
                    }
                    else
                    {
                      v51 = 0;
                      id v21 = v62;
                    }
                  }
                  else
                  {
                    v51 = 0;
                    id v21 = v62;
                  }
                }
                else
                {
                  v51 = 0;
                  id v21 = v62;
                }
                v52 = v61;
LABEL_33:

LABEL_34:
                goto LABEL_35;
              }
              v63 = v20;
              v51 = 0;
              v52 = v21;
            }
            else
            {
              v63 = v20;
              v52 = 0;
              v51 = 0;
            }
            p_isa = (NSString *)&v64->super.isa;
            goto LABEL_33;
          }
          v51 = 0;
          id v21 = v16;
        }
        else
        {
          id v21 = 0;
          v51 = 0;
        }
LABEL_35:

        goto LABEL_36;
      }
      v51 = 0;
      id v16 = v12;
    }
    else
    {
      id v16 = 0;
      v51 = 0;
    }
LABEL_37:

    goto LABEL_38;
  }
  v51 = 0;
LABEL_40:

  return v51;
}

- (AFSpeechPackage)initWithRecognition:(id)a3 unfilteredRecognition:(id)a4 rawRecognition:(id)a5 audioAnalytics:(id)a6 isFinal:(BOOL)a7 utteranceStart:(double)a8 latticeMitigatorResult:(id)a9 recognitionPaused:(BOOL)a10 speechProfileUsed:(BOOL)a11 resultCandidateId:(int64_t)a12 endOfSentenceLikelihood:(id)a13 modelVersion:(id)a14 acousticModelVersion:(id)a15 potentialCommandPrecedingUtterance:(id)a16 potentialCommandUtterance:(id)a17 numOneBestTokensExcludingTriggerPhrase:(int64_t)a18
{
  id v50 = a3;
  id v49 = a4;
  id v48 = a5;
  id v47 = a6;
  id v24 = a9;
  id v25 = a13;
  id v46 = a14;
  id v45 = a15;
  id v26 = a16;
  id v27 = a17;
  v51.receiver = self;
  v51.super_class = (Class)AFSpeechPackage;
  BOOL v28 = [(AFSpeechPackage *)&v51 init];
  if (v28)
  {
    uint64_t v29 = [v50 copy];
    recognition = v28->_recognition;
    v28->_recognition = (AFSpeechRecognition *)v29;

    uint64_t v31 = [v49 copy];
    unfilteredRecognition = v28->_unfilteredRecognition;
    v28->_unfilteredRecognition = (AFSpeechRecognition *)v31;

    uint64_t v33 = [v48 copy];
    rawRecognition = v28->_rawRecognition;
    v28->_rawRecognition = (AFSpeechRecognition *)v33;

    uint64_t v35 = [v47 copy];
    audioAnalytics = v28->_audioAnalytics;
    v28->_audioAnalytics = (AFSpeechAudioAnalytics *)v35;

    v28->_isFinal = a7;
    v28->_utteranceStart = a8;
    objc_storeStrong((id *)&v28->_latticeMitigatorResult, a9);
    v28->_recognitionPaused = a10;
    v28->_speechProfileUsed = a11;
    v28->_resultCandidateId = a12;
    uint64_t v37 = [v25 copy];
    endOfSentenceLikelihood = v28->_endOfSentenceLikelihood;
    v28->_endOfSentenceLikelihood = (NSNumber *)v37;

    objc_storeStrong((id *)&v28->_modelVersion, a14);
    objc_storeStrong((id *)&v28->_acousticModelVersion, a15);
    uint64_t v39 = [v26 copy];
    potentialCommandPrecedingUtterance = v28->_potentialCommandPrecedingUtterance;
    v28->_potentialCommandPrecedingUtterance = (AFSpeechPackage *)v39;

    uint64_t v41 = [v27 copy];
    potentialCommandUtterance = v28->_potentialCommandUtterance;
    v28->_potentialCommandUtterance = (AFSpeechPackage *)v41;

    v28->_numOneBestTokensExcludingTriggerPhrase = a18;
  }

  return v28;
}

- (AFSpeechPackage)initWithRecognition:(id)a3 unfilteredRecognition:(id)a4 rawRecognition:(id)a5 audioAnalytics:(id)a6 isFinal:(BOOL)a7 utteranceStart:(double)a8 latticeMitigatorResult:(id)a9 recognitionPaused:(BOOL)a10 speechProfileUsed:(BOOL)a11 resultCandidateId:(int64_t)a12 endOfSentenceLikelihood:(id)a13 modelVersion:(id)a14 acousticModelVersion:(id)a15 potentialCommandPrecedingUtterance:(id)a16 potentialCommandUtterance:(id)a17
{
  LOWORD(v18) = __PAIR16__(a11, a10);
  return -[AFSpeechPackage initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:endOfSentenceLikelihood:modelVersion:acousticModelVersion:potentialCommandPrecedingUtterance:potentialCommandUtterance:numOneBestTokensExcludingTriggerPhrase:](self, "initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:endOfSentenceLikelihood:modelVersion:acousticModelVersion:potentialCommandPrecedingUtterance:potentialCommandUtterance:numOneBestTokensExcludingTriggerPhrase:", a3, a4, a5, a6, a7, a9, a8, v18, a12, a13, a14, a15, a16, a17, 0);
}

- (AFSpeechPackage)initWithRecognition:(id)a3 unfilteredRecognition:(id)a4 rawRecognition:(id)a5 audioAnalytics:(id)a6 isFinal:(BOOL)a7 utteranceStart:(double)a8 latticeMitigatorResult:(id)a9 recognitionPaused:(BOOL)a10 speechProfileUsed:(BOOL)a11 resultCandidateId:(int64_t)a12 endOfSentenceLikelihood:(id)a13 modelVersion:(id)a14 acousticModelVersion:(id)a15
{
  LOWORD(v16) = __PAIR16__(a11, a10);
  return -[AFSpeechPackage initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:endOfSentenceLikelihood:modelVersion:acousticModelVersion:potentialCommandPrecedingUtterance:potentialCommandUtterance:](self, "initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:endOfSentenceLikelihood:modelVersion:acousticModelVersion:potentialCommandPrecedingUtterance:potentialCommandUtterance:", a3, a4, a5, a6, a7, a9, a8, v16, a12, a13, a14, a15, 0, 0);
}

- (AFSpeechPackage)initWithRecognition:(id)a3 unfilteredRecognition:(id)a4 rawRecognition:(id)a5 audioAnalytics:(id)a6 isFinal:(BOOL)a7 utteranceStart:(double)a8 latticeMitigatorResult:(id)a9 recognitionPaused:(BOOL)a10 speechProfileUsed:(BOOL)a11 resultCandidateId:(int64_t)a12 endOfSentenceLikelihood:(id)a13
{
  LOWORD(v14) = __PAIR16__(a11, a10);
  return -[AFSpeechPackage initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:endOfSentenceLikelihood:modelVersion:acousticModelVersion:](self, "initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:endOfSentenceLikelihood:modelVersion:acousticModelVersion:", a3, a4, a5, a6, a7, a9, a8, v14, a12, a13, 0, 0);
}

- (AFSpeechPackage)initWithRecognition:(id)a3 unfilteredRecognition:(id)a4 rawRecognition:(id)a5 audioAnalytics:(id)a6 isFinal:(BOOL)a7 utteranceStart:(double)a8 latticeMitigatorResult:(id)a9 recognitionPaused:(BOOL)a10 speechProfileUsed:(BOOL)a11 resultCandidateId:(int64_t)a12
{
  LOWORD(v13) = __PAIR16__(a11, a10);
  return -[AFSpeechPackage initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:endOfSentenceLikelihood:](self, "initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:endOfSentenceLikelihood:", a3, a4, a5, a6, a7, a9, a8, v13, a12, 0);
}

- (AFSpeechPackage)initWithRecognition:(id)a3 unfilteredRecognition:(id)a4 rawRecognition:(id)a5 audioAnalytics:(id)a6 isFinal:(BOOL)a7 utteranceStart:(double)a8 latticeMitigatorResult:(id)a9 recognitionPaused:(BOOL)a10 speechProfileUsed:(BOOL)a11
{
  LOWORD(v12) = __PAIR16__(a11, a10);
  return -[AFSpeechPackage initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:](self, "initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:", a3, a4, a5, a6, a7, a9, a8, v12, 0);
}

- (AFSpeechPackage)initWithRecognition:(id)a3 unfilteredRecognition:(id)a4 rawRecognition:(id)a5 audioAnalytics:(id)a6 isFinal:(BOOL)a7 utteranceStart:(double)a8 latticeMitigatorResult:(id)a9 recognitionPaused:(BOOL)a10
{
  LOWORD(v11) = a10;
  return -[AFSpeechPackage initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:](self, "initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:", a3, a4, a5, a6, a7, a9, a8, v11, 0);
}

- (AFSpeechPackage)initWithRecognition:(id)a3 unfilteredRecognition:(id)a4 rawRecognition:(id)a5 audioAnalytics:(id)a6 isFinal:(BOOL)a7 utteranceStart:(double)a8 latticeMitigatorResult:(id)a9
{
  LOWORD(v10) = 0;
  return -[AFSpeechPackage initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:](self, "initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:", a3, a4, a5, a6, a7, a9, a8, v10, 0);
}

- (AFSpeechPackage)initWithRecognition:(id)a3 rawRecognition:(id)a4 audioAnalytics:(id)a5 isFinal:(BOOL)a6 utteranceStart:(double)a7 latticeMitigatorResult:(id)a8
{
  LOWORD(v9) = 0;
  return -[AFSpeechPackage initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:](self, "initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:", a3, a3, a4, a5, a6, a8, a7, v9, 0);
}

- (AFSpeechPackage)initWithRecognition:(id)a3 unfilteredRecognition:(id)a4 rawRecognition:(id)a5 audioAnalytics:(id)a6 isFinal:(BOOL)a7 utteranceStart:(double)a8
{
  LOWORD(v9) = 0;
  return -[AFSpeechPackage initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:](self, "initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:", a3, a4, a5, a6, a7, 0, a8, v9, 0);
}

- (AFSpeechPackage)initWithRecognition:(id)a3 rawRecognition:(id)a4 audioAnalytics:(id)a5 isFinal:(BOOL)a6 utteranceStart:(double)a7
{
  LOWORD(v8) = 0;
  return -[AFSpeechPackage initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:](self, "initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:", a3, a3, a4, a5, a6, 0, a7, v8, 0);
}

- (AFSpeechPackage)init
{
  LOWORD(v3) = 0;
  return -[AFSpeechPackage initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:](self, "initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:", 0, 0, 0, 0, 0, 0, 0.0, v3, 0);
}

- (AFSpeechPackage)initWithCoder:(id)a3
{
  id v3 = a3;
  v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"recognition"];
  uint64_t v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"unfilteredRecognition"];
  id v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"rawRecognition"];
  v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"audioAnalytics"];
  unsigned int v16 = [v3 decodeBoolForKey:@"isFinal"];
  [v3 decodeDoubleForKey:@"utteranceStart"];
  double v5 = v4;
  v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"latMitRes"];
  char v17 = [v3 decodeBoolForKey:@"recognitionPaused"];
  char v6 = [v3 decodeBoolForKey:@"speechProfileUsed"];
  uint64_t v7 = [v3 decodeIntegerForKey:@"resultCandidateId"];
  uint64_t v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"endOfSentenceLikelihood"];
  uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"modelVersion"];
  uint64_t v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"acousticModelVersion"];
  uint64_t v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"potentialCommandPrecedingUtterance"];
  uint64_t v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"potentialCommandUtterance"];
  uint64_t v13 = [v3 decodeIntegerForKey:@"numOneBestTokensExcludingTriggerPhrase"];

  BYTE1(v15) = v6;
  LOBYTE(v15) = v17;
  id v24 = -[AFSpeechPackage initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:endOfSentenceLikelihood:modelVersion:acousticModelVersion:potentialCommandPrecedingUtterance:potentialCommandUtterance:numOneBestTokensExcludingTriggerPhrase:](self, "initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:endOfSentenceLikelihood:modelVersion:acousticModelVersion:potentialCommandPrecedingUtterance:potentialCommandUtterance:numOneBestTokensExcludingTriggerPhrase:", v22, v18, v21, v20, v16, v19, v5, v15, v7, v8, v9, v10, v11, v12, v13);

  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  recognition = self->_recognition;
  id v5 = a3;
  [v5 encodeObject:recognition forKey:@"recognition"];
  [v5 encodeObject:self->_unfilteredRecognition forKey:@"unfilteredRecognition"];
  [v5 encodeObject:self->_rawRecognition forKey:@"rawRecognition"];
  [v5 encodeObject:self->_audioAnalytics forKey:@"audioAnalytics"];
  [v5 encodeBool:self->_isFinal forKey:@"isFinal"];
  [v5 encodeDouble:@"utteranceStart" forKey:self->_utteranceStart];
  [v5 encodeObject:self->_latticeMitigatorResult forKey:@"latMitRes"];
  [v5 encodeBool:self->_recognitionPaused forKey:@"recognitionPaused"];
  [v5 encodeBool:self->_speechProfileUsed forKey:@"speechProfileUsed"];
  [v5 encodeInteger:self->_resultCandidateId forKey:@"resultCandidateId"];
  [v5 encodeObject:self->_endOfSentenceLikelihood forKey:@"endOfSentenceLikelihood"];
  [v5 encodeObject:self->_modelVersion forKey:@"modelVersion"];
  [v5 encodeObject:self->_acousticModelVersion forKey:@"acousticModelVersion"];
  [v5 encodeObject:self->_potentialCommandPrecedingUtterance forKey:@"potentialCommandPrecedingUtterance"];
  [v5 encodeObject:self->_potentialCommandUtterance forKey:@"potentialCommandUtterance"];
  [v5 encodeInteger:self->_numOneBestTokensExcludingTriggerPhrase forKey:@"numOneBestTokensExcludingTriggerPhrase"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end