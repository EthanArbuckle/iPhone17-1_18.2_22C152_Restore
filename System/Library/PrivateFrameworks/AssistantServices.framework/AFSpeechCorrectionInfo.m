@interface AFSpeechCorrectionInfo
+ (BOOL)supportsSecureCoding;
- (AFSpeechCorrectionInfo)initWithCoder:(id)a3;
- (NSArray)selectedAlternativesInfo;
- (NSDictionary)alternativesSelectedInfo;
- (NSDictionary)recognizedTextInfo;
- (NSString)correctedText;
- (int64_t)alternativeSelectionCount;
- (int64_t)characterDeletionCount;
- (int64_t)characterInsertionCount;
- (int64_t)characterModificationCount;
- (int64_t)characterSubstitutionCount;
- (void)encodeWithCoder:(id)a3;
- (void)setAlternativeSelectionCount:(int64_t)a3;
- (void)setAlternativesSelectedInfo:(id)a3;
- (void)setCharacterDeletionCount:(int64_t)a3;
- (void)setCharacterInsertionCount:(int64_t)a3;
- (void)setCharacterModificationCount:(int64_t)a3;
- (void)setCharacterSubstitutionCount:(int64_t)a3;
- (void)setCorrectedText:(id)a3;
- (void)setRecognizedTextInfo:(id)a3;
- (void)setSelectedAlternativesInfo:(id)a3;
@end

@implementation AFSpeechCorrectionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAlternativesInfo, 0);
  objc_storeStrong((id *)&self->_alternativesSelectedInfo, 0);
  objc_storeStrong((id *)&self->_recognizedTextInfo, 0);
  objc_storeStrong((id *)&self->_correctedText, 0);
}

- (void)setSelectedAlternativesInfo:(id)a3
{
}

- (NSArray)selectedAlternativesInfo
{
  return self->_selectedAlternativesInfo;
}

- (void)setAlternativesSelectedInfo:(id)a3
{
}

- (NSDictionary)alternativesSelectedInfo
{
  return self->_alternativesSelectedInfo;
}

- (void)setRecognizedTextInfo:(id)a3
{
}

- (NSDictionary)recognizedTextInfo
{
  return self->_recognizedTextInfo;
}

- (void)setCorrectedText:(id)a3
{
}

- (NSString)correctedText
{
  return self->_correctedText;
}

- (void)setCharacterDeletionCount:(int64_t)a3
{
  self->_characterDeletionCount = a3;
}

- (int64_t)characterDeletionCount
{
  return self->_characterDeletionCount;
}

- (void)setCharacterSubstitutionCount:(int64_t)a3
{
  self->_characterSubstitutionCount = a3;
}

- (int64_t)characterSubstitutionCount
{
  return self->_characterSubstitutionCount;
}

- (void)setCharacterInsertionCount:(int64_t)a3
{
  self->_characterInsertionCount = a3;
}

- (int64_t)characterInsertionCount
{
  return self->_characterInsertionCount;
}

- (void)setCharacterModificationCount:(int64_t)a3
{
  self->_characterModificationCount = a3;
}

- (int64_t)characterModificationCount
{
  return self->_characterModificationCount;
}

- (void)setAlternativeSelectionCount:(int64_t)a3
{
  self->_alternativeSelectionCount = a3;
}

- (int64_t)alternativeSelectionCount
{
  return self->_alternativeSelectionCount;
}

- (AFSpeechCorrectionInfo)initWithCoder:(id)a3
{
  v29[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)AFSpeechCorrectionInfo;
  v5 = [(AFSpeechCorrectionInfo *)&v28 init];
  if (v5)
  {
    v5->_alternativeSelectionCount = [v4 decodeIntegerForKey:@"alternativeSelectionCount"];
    v5->_characterModificationCount = [v4 decodeIntegerForKey:@"characterModificationCount"];
    v5->_characterInsertionCount = [v4 decodeIntegerForKey:@"characterInsertionCount"];
    v5->_characterSubstitutionCount = [v4 decodeIntegerForKey:@"characterSubstitutionCount"];
    v5->_characterDeletionCount = [v4 decodeIntegerForKey:@"characterDeletionCount"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"correctedText"];
    correctedText = v5->_correctedText;
    v5->_correctedText = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    v29[2] = objc_opt_class();
    v29[3] = objc_opt_class();
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
    v10 = [v8 setWithArray:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_recognizedTextInfo"];
    recognizedTextInfo = v5->_recognizedTextInfo;
    v5->_recognizedTextInfo = (NSDictionary *)v11;

    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v13, "setWithObjects:", v14, v15, v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"_alternativesSelectedInfo"];
    alternativesSelectedInfo = v5->_alternativesSelectedInfo;
    v5->_alternativesSelectedInfo = (NSDictionary *)v18;

    v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    v24 = objc_msgSend(v20, "setWithObjects:", v21, v22, v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"_selectedAlternativesInfo"];
    selectedAlternativesInfo = v5->_selectedAlternativesInfo;
    v5->_selectedAlternativesInfo = (NSArray *)v25;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t alternativeSelectionCount = self->_alternativeSelectionCount;
  id v5 = a3;
  [v5 encodeInteger:alternativeSelectionCount forKey:@"alternativeSelectionCount"];
  [v5 encodeInteger:self->_characterModificationCount forKey:@"characterModificationCount"];
  [v5 encodeInteger:self->_characterInsertionCount forKey:@"characterInsertionCount"];
  [v5 encodeInteger:self->_characterSubstitutionCount forKey:@"characterSubstitutionCount"];
  [v5 encodeInteger:self->_characterDeletionCount forKey:@"characterDeletionCount"];
  [v5 encodeObject:self->_correctedText forKey:@"correctedText"];
  [v5 encodeObject:self->_recognizedTextInfo forKey:@"_recognizedTextInfo"];
  [v5 encodeObject:self->_alternativesSelectedInfo forKey:@"_alternativesSelectedInfo"];
  [v5 encodeObject:self->_selectedAlternativesInfo forKey:@"_selectedAlternativesInfo"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end