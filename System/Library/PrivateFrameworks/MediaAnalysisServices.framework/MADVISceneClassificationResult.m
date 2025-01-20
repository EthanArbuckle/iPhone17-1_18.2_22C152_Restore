@interface MADVISceneClassificationResult
+ (BOOL)supportsSecureCoding;
- (MADVISceneClassificationResult)initWithCoder:(id)a3;
- (NSArray)classificationObservations;
- (NSArray)nsfwObservations;
- (NSArray)recognizedObjectObservations;
- (NSArray)saliencyObservations;
- (NSArray)significantEventObservations;
- (double)executionTimeInterval;
- (id)description;
- (unint64_t)executionNanoseconds;
- (void)encodeWithCoder:(id)a3;
- (void)setClassificationObservations:(id)a3;
- (void)setNSFWObservations:(id)a3;
- (void)setRecognizedObjectObservations:(id)a3;
- (void)setSaliencyObservations:(id)a3;
- (void)setSignificantEventObservations:(id)a3;
@end

@implementation MADVISceneClassificationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setClassificationObservations:(id)a3
{
}

- (void)setNSFWObservations:(id)a3
{
}

- (void)setSignificantEventObservations:(id)a3
{
}

- (void)setRecognizedObjectObservations:(id)a3
{
}

- (void)setSaliencyObservations:(id)a3
{
}

- (MADVISceneClassificationResult)initWithCoder:(id)a3
{
  v36[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MADVISceneClassificationResult;
  v5 = [(MADResult *)&v26 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v36[0] = objc_opt_class();
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2050000000;
    v7 = (void *)getVNClassificationObservationClass_softClass;
    uint64_t v35 = getVNClassificationObservationClass_softClass;
    if (!getVNClassificationObservationClass_softClass)
    {
      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      v29 = __getVNClassificationObservationClass_block_invoke;
      v30 = &unk_1E6CAD0C8;
      v31 = &v32;
      __getVNClassificationObservationClass_block_invoke((uint64_t)&v27);
      v7 = (void *)v33[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v32, 8);
    v36[1] = objc_opt_class();
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2050000000;
    v9 = (void *)getVNRecognizedObjectObservationClass_softClass;
    uint64_t v35 = getVNRecognizedObjectObservationClass_softClass;
    if (!getVNRecognizedObjectObservationClass_softClass)
    {
      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      v29 = __getVNRecognizedObjectObservationClass_block_invoke;
      v30 = &unk_1E6CAD0C8;
      v31 = &v32;
      __getVNRecognizedObjectObservationClass_block_invoke((uint64_t)&v27);
      v9 = (void *)v33[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v32, 8);
    v36[2] = objc_opt_class();
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2050000000;
    v11 = (void *)getVNSaliencyImageObservationClass_softClass;
    uint64_t v35 = getVNSaliencyImageObservationClass_softClass;
    if (!getVNSaliencyImageObservationClass_softClass)
    {
      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      v29 = __getVNSaliencyImageObservationClass_block_invoke;
      v30 = &unk_1E6CAD0C8;
      v31 = &v32;
      __getVNSaliencyImageObservationClass_block_invoke((uint64_t)&v27);
      v11 = (void *)v33[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v32, 8);
    v36[3] = objc_opt_class();
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];
    v14 = [v6 setWithArray:v13];

    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"ClassificationObservations"];
    classificationObservations = v5->_classificationObservations;
    v5->_classificationObservations = (NSArray *)v15;

    uint64_t v17 = [v4 decodeObjectOfClasses:v14 forKey:@"NSFWObservations"];
    nsfwObservations = v5->_nsfwObservations;
    v5->_nsfwObservations = (NSArray *)v17;

    uint64_t v19 = [v4 decodeObjectOfClasses:v14 forKey:@"SignificantEventObservations"];
    significantEventObservations = v5->_significantEventObservations;
    v5->_significantEventObservations = (NSArray *)v19;

    uint64_t v21 = [v4 decodeObjectOfClasses:v14 forKey:@"RecognizedObjectObservations"];
    recognizedObjectObservations = v5->_recognizedObjectObservations;
    v5->_recognizedObjectObservations = (NSArray *)v21;

    uint64_t v23 = [v4 decodeObjectOfClasses:v14 forKey:@"SaliencyObservations"];
    saliencyObservations = v5->_saliencyObservations;
    v5->_saliencyObservations = (NSArray *)v23;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADVISceneClassificationResult;
  id v4 = a3;
  [(MADResult *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_classificationObservations, @"ClassificationObservations", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_nsfwObservations forKey:@"NSFWObservations"];
  [v4 encodeObject:self->_significantEventObservations forKey:@"SignificantEventObservations"];
  [v4 encodeObject:self->_recognizedObjectObservations forKey:@"RecognizedObjectObservations"];
  [v4 encodeObject:self->_saliencyObservations forKey:@"SaliencyObservations"];
}

- (unint64_t)executionNanoseconds
{
  v3.receiver = self;
  v3.super_class = (Class)MADVISceneClassificationResult;
  return [(MADResult *)&v3 executionNanoseconds];
}

- (double)executionTimeInterval
{
  v3.receiver = self;
  v3.super_class = (Class)MADVISceneClassificationResult;
  [(MADResult *)&v3 executionTimeInterval];
  return result;
}

- (id)description
{
  objc_super v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"\nclassification observations:\n "];
  if ([(NSArray *)self->_classificationObservations count])
  {
    unint64_t v6 = 0;
    do
    {
      v7 = [(NSArray *)self->_classificationObservations objectAtIndexedSubscript:v6];
      id v8 = [v7 identifier];

      if (v6) {
        v9 = ",";
      }
      else {
        v9 = (const char *)&unk_1DCCCB393;
      }
      id v10 = [(NSArray *)self->_classificationObservations objectAtIndexedSubscript:v6];
      [v3 appendFormat:@"%s%@ classification identifier=\"%@\"", v9, v10, v8];

      ++v6;
    }
    while (v6 < [(NSArray *)self->_classificationObservations count]);
  }
  [v3 appendFormat:@"\nnsfw observations:\n "];
  if ([(NSArray *)self->_nsfwObservations count])
  {
    unint64_t v11 = 0;
    do
    {
      id v12 = [(NSArray *)self->_nsfwObservations objectAtIndexedSubscript:v11];
      v13 = [v12 identifier];

      if (v11) {
        v14 = ",";
      }
      else {
        v14 = (const char *)&unk_1DCCCB393;
      }
      uint64_t v15 = [(NSArray *)self->_nsfwObservations objectAtIndexedSubscript:v11];
      [v3 appendFormat:@"%s%@ nsfw identifier=\"%@\"", v14, v15, v13];

      ++v11;
    }
    while (v11 < [(NSArray *)self->_nsfwObservations count]);
  }
  [v3 appendFormat:@"\nsignificant event observations:\n "];
  if ([(NSArray *)self->_significantEventObservations count])
  {
    unint64_t v16 = 0;
    do
    {
      uint64_t v17 = [(NSArray *)self->_significantEventObservations objectAtIndexedSubscript:v16];
      v18 = [v17 identifier];

      if (v16) {
        uint64_t v19 = ",";
      }
      else {
        uint64_t v19 = (const char *)&unk_1DCCCB393;
      }
      v20 = [(NSArray *)self->_significantEventObservations objectAtIndexedSubscript:v16];
      [v3 appendFormat:@"%s%@ significant event identifier=\"%@\"", v19, v20, v18];

      ++v16;
    }
    while (v16 < [(NSArray *)self->_significantEventObservations count]);
  }
  [v3 appendFormat:@"\nrecognized object observations:\n "];
  if ([(NSArray *)self->_recognizedObjectObservations count])
  {
    unint64_t v21 = 0;
    do
    {
      v22 = [(NSArray *)self->_recognizedObjectObservations objectAtIndexedSubscript:v21];
      uint64_t v23 = [v22 labels];

      if (v21) {
        v24 = ",";
      }
      else {
        v24 = (const char *)&unk_1DCCCB393;
      }
      v25 = [(NSArray *)self->_recognizedObjectObservations objectAtIndexedSubscript:v21];
      [v3 appendFormat:@"%s%@ recognized object labels=\"%@\"", v24, v25, v23];

      ++v21;
    }
    while (v21 < [(NSArray *)self->_recognizedObjectObservations count]);
  }
  [v3 appendFormat:@"\nsalient object observations:\n "];
  if ([(NSArray *)self->_saliencyObservations count])
  {
    unint64_t v26 = 0;
    do
    {
      uint64_t v27 = [(NSArray *)self->_saliencyObservations objectAtIndexedSubscript:v26];
      uint64_t v28 = [v27 salientObjects];

      if (v26) {
        v29 = ",";
      }
      else {
        v29 = (const char *)&unk_1DCCCB393;
      }
      v30 = [(NSArray *)self->_saliencyObservations objectAtIndexedSubscript:v26];
      [v3 appendFormat:@"%s%@ salient objects=\"%@\"", v29, v30, v28];

      ++v26;
    }
    while (v26 < [(NSArray *)self->_saliencyObservations count]);
  }
  [v3 appendFormat:@">"];
  return v3;
}

- (NSArray)classificationObservations
{
  return self->_classificationObservations;
}

- (NSArray)nsfwObservations
{
  return self->_nsfwObservations;
}

- (NSArray)significantEventObservations
{
  return self->_significantEventObservations;
}

- (NSArray)recognizedObjectObservations
{
  return self->_recognizedObjectObservations;
}

- (NSArray)saliencyObservations
{
  return self->_saliencyObservations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saliencyObservations, 0);
  objc_storeStrong((id *)&self->_recognizedObjectObservations, 0);
  objc_storeStrong((id *)&self->_significantEventObservations, 0);
  objc_storeStrong((id *)&self->_nsfwObservations, 0);
  objc_storeStrong((id *)&self->_classificationObservations, 0);
}

@end