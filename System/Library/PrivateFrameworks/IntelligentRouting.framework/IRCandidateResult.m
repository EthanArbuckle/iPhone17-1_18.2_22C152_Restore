@interface IRCandidateResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isCallToAction;
- (BOOL)isConservativeFiltered;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLockScreenControl;
- (IRCandidate)candidate;
- (IRCandidateResult)initWithCandidate:(id)a3 classification:(int64_t)a4 andClassificationDescription:(id)a5;
- (IRCandidateResult)initWithCandidate:(id)a3 classification:(int64_t)a4 classificationDescription:(id)a5 sortingHint:(id)a6 isCallToAction:(BOOL)a7 isLockScreenControl:(BOOL)a8 isConservativeFiltered:(BOOL)a9;
- (IRCandidateResult)initWithCoder:(id)a3;
- (NSNumber)sortingHint;
- (NSString)classificationDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)classification;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setClassification:(int64_t)a3 withDescription:(id)a4;
- (void)setIsCallToAction:(BOOL)a3;
- (void)setIsConservativeFiltered:(BOOL)a3;
- (void)setIsLockScreenControl:(BOOL)a3;
- (void)setSortingHint:(id)a3;
@end

@implementation IRCandidateResult

- (IRCandidateResult)initWithCandidate:(id)a3 classification:(int64_t)a4 andClassificationDescription:(id)a5
{
  LOBYTE(v6) = 0;
  return [(IRCandidateResult *)self initWithCandidate:a3 classification:a4 classificationDescription:a5 sortingHint:0 isCallToAction:0 isLockScreenControl:0 isConservativeFiltered:v6];
}

- (IRCandidateResult)initWithCandidate:(id)a3 classification:(int64_t)a4 classificationDescription:(id)a5 sortingHint:(id)a6 isCallToAction:(BOOL)a7 isLockScreenControl:(BOOL)a8 isConservativeFiltered:(BOOL)a9
{
  id v16 = a3;
  v17 = (__CFString *)a5;
  id v18 = a6;
  v23.receiver = self;
  v23.super_class = (Class)IRCandidateResult;
  v19 = [(IRCandidateResult *)&v23 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_candidate, a3);
    v20->_classification = a4;
    if (v17) {
      v21 = v17;
    }
    else {
      v21 = @"Classification not assigned";
    }
    objc_storeStrong((id *)&v20->_classificationDescription, v21);
    objc_storeStrong((id *)&v20->_sortingHint, a6);
    v20->_isCallToAction = a7;
    v20->_isLockScreenControl = a8;
    v20->_isConservativeFiltered = a9;
  }

  return v20;
}

- (void)setClassification:(int64_t)a3 withDescription:(id)a4
{
  self->_classification = a3;
  objc_storeStrong((id *)&self->_classificationDescription, a4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [objc_alloc((Class)objc_opt_class()) initWithCandidate:self->_candidate classification:self->_classification andClassificationDescription:self->_classificationDescription];
  id v6 = [(IRCandidate *)self->_candidate copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(void *)(v5 + 24) = [(IRCandidateResult *)self classification];
  uint64_t v8 = [(NSString *)self->_classificationDescription copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  uint64_t v10 = [(NSNumber *)self->_sortingHint copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  *(unsigned char *)(v5 + 8) = [(IRCandidateResult *)self isCallToAction];
  *(unsigned char *)(v5 + 9) = [(IRCandidateResult *)self isLockScreenControl];
  *(unsigned char *)(v5 + 10) = [(IRCandidateResult *)self isConservativeFiltered];
  return (id)v5;
}

- (void)encodeWithCoder:(id)a3
{
  candidate = self->_candidate;
  id v5 = a3;
  [v5 encodeObject:candidate forKey:@"candidate"];
  id v6 = [NSNumber numberWithInteger:self->_classification];
  [v5 encodeObject:v6 forKey:@"classification"];

  [v5 encodeObject:self->_classificationDescription forKey:@"classificationDescription"];
  [v5 encodeObject:self->_sortingHint forKey:@"sortingHint"];
  v7 = [NSNumber numberWithBool:self->_isCallToAction];
  [v5 encodeObject:v7 forKey:@"isCallToAction"];

  uint64_t v8 = [NSNumber numberWithBool:self->_isLockScreenControl];
  [v5 encodeObject:v8 forKey:@"isLockScreenControl"];

  id v9 = [NSNumber numberWithBool:self->_isConservativeFiltered];
  [v5 encodeObject:v9 forKey:@"isConservativeFiltered"];
}

- (IRCandidateResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)IRCandidateResult;
  id v5 = [(IRCandidateResult *)&v23 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"candidate"];
    if (v6)
    {
      uint64_t v7 = self;

      candidate = v5->_candidate;
      v5->_candidate = (IRCandidate *)v7;

      id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"classification"];
      id v6 = v9;
      if (v9)
      {
        int64_t v10 = (int)[(IRCandidateResult *)v9 intValue];

        v5->_classification = v10;
        id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"classificationDescription"];
        if (v6)
        {
          uint64_t v11 = self;

          classificationDescription = v5->_classificationDescription;
          v5->_classificationDescription = (NSString *)v11;

          v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sortingHint"];
          uint64_t v14 = self;

          sortingHint = v5->_sortingHint;
          v5->_sortingHint = (NSNumber *)v14;

          id v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isCallToAction"];
          id v6 = v16;
          if (v16)
          {
            char v17 = [(IRCandidateResult *)v16 BOOLValue];

            v5->_isCallToAction = v17;
            id v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isLockScreenControl"];
            id v6 = v18;
            if (v18)
            {
              char v19 = [(IRCandidateResult *)v18 BOOLValue];

              v5->_isLockScreenControl = v19;
              v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isConservativeFiltered"];
              id v6 = v20;
              if (v20)
              {
                char v21 = [(IRCandidateResult *)v20 BOOLValue];

                v5->_isConservativeFiltered = v21;
                id v6 = v5;
              }
            }
          }
        }
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = (void *)[v3 initWithFormat:@"<%@: ", v5];

  [v6 appendFormat:@", candidate: %@", self->_candidate];
  unint64_t classification = self->_classification;
  if (classification > 4) {
    uint64_t v8 = @"Invalid";
  }
  else {
    uint64_t v8 = off_26539E720[classification];
  }
  [v6 appendFormat:@", classification: %@", v8];
  [v6 appendFormat:@", classificationDescription: %@", self->_classificationDescription];
  [v6 appendFormat:@", sortingHint: %@", self->_sortingHint];
  id v9 = [NSNumber numberWithBool:self->_isCallToAction];
  [v6 appendFormat:@", isCallToAction: %@", v9];

  int64_t v10 = [NSNumber numberWithBool:self->_isLockScreenControl];
  [v6 appendFormat:@", isLockScreenControl: %@", v10];

  uint64_t v11 = [NSNumber numberWithBool:self->_isConservativeFiltered];
  [v6 appendFormat:@", isConservativeFiltered: %@", v11];

  [v6 appendString:@">"];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(IRCandidateResult *)self candidate];
    uint64_t v7 = [v5 candidate];
    if ([v6 isEqual:v7])
    {
    }
    else
    {
      id v9 = [(IRCandidateResult *)self candidate];
      int64_t v10 = [v5 candidate];

      if (v9 != v10) {
        goto LABEL_12;
      }
    }
    int64_t v11 = [(IRCandidateResult *)self classification];
    if (v11 == [v5 classification])
    {
      v12 = [(IRCandidateResult *)self sortingHint];
      v13 = [v5 sortingHint];
      if ([v12 isEqual:v13])
      {
      }
      else
      {
        uint64_t v14 = [(IRCandidateResult *)self sortingHint];
        v15 = [v5 sortingHint];

        if (v14 != v15) {
          goto LABEL_12;
        }
      }
      int v16 = [(IRCandidateResult *)self isCallToAction];
      if (v16 == [v5 isCallToAction])
      {
        int v17 = [(IRCandidateResult *)self isLockScreenControl];
        if (v17 == [v5 isLockScreenControl])
        {
          BOOL v19 = [(IRCandidateResult *)self isConservativeFiltered];
          int v8 = v19 ^ [v5 isConservativeFiltered] ^ 1;
          goto LABEL_13;
        }
      }
    }
LABEL_12:
    LOBYTE(v8) = 0;
LABEL_13:

    goto LABEL_14;
  }
  LOBYTE(v8) = 0;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(IRCandidate *)self->_candidate hash];
  int64_t classification = self->_classification;
  return v3 ^ classification ^ [(NSNumber *)self->_sortingHint hash] ^ self->_isCallToAction ^ self->_isLockScreenControl ^ (unint64_t)self->_isConservativeFiltered ^ 0x1F;
}

- (IRCandidate)candidate
{
  return self->_candidate;
}

- (int64_t)classification
{
  return self->_classification;
}

- (NSNumber)sortingHint
{
  return self->_sortingHint;
}

- (void)setSortingHint:(id)a3
{
}

- (BOOL)isCallToAction
{
  return self->_isCallToAction;
}

- (void)setIsCallToAction:(BOOL)a3
{
  self->_isCallToAction = a3;
}

- (BOOL)isLockScreenControl
{
  return self->_isLockScreenControl;
}

- (void)setIsLockScreenControl:(BOOL)a3
{
  self->_isLockScreenControl = a3;
}

- (BOOL)isConservativeFiltered
{
  return self->_isConservativeFiltered;
}

- (void)setIsConservativeFiltered:(BOOL)a3
{
  self->_isConservativeFiltered = a3;
}

- (NSString)classificationDescription
{
  return self->_classificationDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classificationDescription, 0);
  objc_storeStrong((id *)&self->_sortingHint, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
}

@end