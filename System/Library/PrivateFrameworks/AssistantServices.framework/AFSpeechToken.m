@interface AFSpeechToken
+ (BOOL)supportsSecureCoding;
- (AFSpeechToken)initWithCoder:(id)a3;
- (AFSpeechToken)initWithDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)removeSpaceAfter;
- (BOOL)removeSpaceBefore;
- (NSNumber)acousticCost;
- (NSNumber)graphCost;
- (NSString)ipaPhoneSequence;
- (NSString)phoneSequence;
- (NSString)text;
- (double)endTime;
- (double)silenceStartTime;
- (double)startTime;
- (id)aceToken;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)confidenceScore;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAcousticCost:(id)a3;
- (void)setConfidenceScore:(int64_t)a3;
- (void)setEndTime:(double)a3;
- (void)setGraphCost:(id)a3;
- (void)setIpaPhoneSequence:(id)a3;
- (void)setPhoneSequence:(id)a3;
- (void)setRemoveSpaceAfter:(BOOL)a3;
- (void)setRemoveSpaceBefore:(BOOL)a3;
- (void)setSilenceStartTime:(double)a3;
- (void)setStartTime:(double)a3;
- (void)setText:(id)a3;
@end

@implementation AFSpeechToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acousticCost, 0);
  objc_storeStrong((id *)&self->_graphCost, 0);
  objc_storeStrong((id *)&self->_ipaPhoneSequence, 0);
  objc_storeStrong((id *)&self->_phoneSequence, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (void)setAcousticCost:(id)a3
{
}

- (NSNumber)acousticCost
{
  return self->_acousticCost;
}

- (void)setGraphCost:(id)a3
{
}

- (NSNumber)graphCost
{
  return self->_graphCost;
}

- (void)setRemoveSpaceAfter:(BOOL)a3
{
  self->_removeSpaceAfter = a3;
}

- (BOOL)removeSpaceAfter
{
  return self->_removeSpaceAfter;
}

- (void)setRemoveSpaceBefore:(BOOL)a3
{
  self->_removeSpaceBefore = a3;
}

- (BOOL)removeSpaceBefore
{
  return self->_removeSpaceBefore;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setSilenceStartTime:(double)a3
{
  self->_silenceStartTime = a3;
}

- (double)silenceStartTime
{
  return self->_silenceStartTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setConfidenceScore:(int64_t)a3
{
  self->_confidenceScore = a3;
}

- (int64_t)confidenceScore
{
  return self->_confidenceScore;
}

- (void)setIpaPhoneSequence:(id)a3
{
}

- (NSString)ipaPhoneSequence
{
  return self->_ipaPhoneSequence;
}

- (void)setPhoneSequence:(id)a3
{
}

- (NSString)phoneSequence
{
  return self->_phoneSequence;
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (id)dictionaryRepresentation
{
  v25[11] = *MEMORY[0x1E4F143B8];
  uint64_t text = (uint64_t)self->_text;
  uint64_t v23 = text;
  v24[0] = @"text";
  if (!text)
  {
    uint64_t text = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)text;
  v25[0] = text;
  v24[1] = @"phoneSequence";
  uint64_t phoneSequence = (uint64_t)self->_phoneSequence;
  uint64_t v22 = phoneSequence;
  if (!phoneSequence)
  {
    uint64_t phoneSequence = [MEMORY[0x1E4F1CA98] null];
  }
  v18 = (void *)phoneSequence;
  v25[1] = phoneSequence;
  v24[2] = @"ipaPhoneSequence";
  ipaPhoneSequence = self->_ipaPhoneSequence;
  uint64_t v6 = (uint64_t)ipaPhoneSequence;
  if (!ipaPhoneSequence)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v17 = (void *)v6;
  v25[2] = v6;
  v24[3] = @"confidence";
  v21 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_confidenceScore];
  v25[3] = v21;
  v24[4] = @"startTime";
  v20 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_startTime];
  v25[4] = v20;
  v24[5] = @"silenceStartTime";
  v7 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_silenceStartTime];
  v25[5] = v7;
  v24[6] = @"endTime";
  v8 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_endTime];
  v25[6] = v8;
  v24[7] = @"removeSpaceBefore";
  v9 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_removeSpaceBefore];
  v25[7] = v9;
  v24[8] = @"removeSpaceAfter";
  v10 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_removeSpaceAfter];
  v25[8] = v10;
  v24[9] = @"graphCost";
  graphCost = self->_graphCost;
  v12 = graphCost;
  if (!graphCost)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[9] = v12;
  v24[10] = @"acousticCost";
  acousticCost = self->_acousticCost;
  v14 = acousticCost;
  if (!acousticCost)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[10] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:11];
  if (acousticCost)
  {
    if (graphCost) {
      goto LABEL_13;
    }
  }
  else
  {

    if (graphCost) {
      goto LABEL_13;
    }
  }

LABEL_13:
  if (!ipaPhoneSequence) {

  }
  if (!v22) {
  if (!v23)
  }

  return v15;
}

- (AFSpeechToken)initWithDictionary:(id)a3
{
  id v4 = a3;
  v106.receiver = self;
  v106.super_class = (Class)AFSpeechToken;
  v5 = [(AFSpeechToken *)&v106 init];
  if (!v5) {
    goto LABEL_94;
  }
  uint64_t v6 = [v4 objectForKey:@"text"];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  id v9 = v6;
  if (!v9 || (NSClassFromString((NSString *)v8), (objc_opt_isKindOfClass() & 1) == 0))
  {

LABEL_14:
    goto LABEL_15;
  }

  objc_storeStrong((id *)&v5->_text, v6);
  v10 = [v4 objectForKey:@"phoneSequence"];
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  id v13 = v10;
  id v14 = v12;
  if (!v13
    || ([MEMORY[0x1E4F1CA98] null],
        v15 = objc_claimAutoreleasedReturnValue(),
        int v16 = [v13 isEqual:v15],
        v15,
        v16))
  {

    goto LABEL_7;
  }
  NSClassFromString((NSString *)v14);
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {

    goto LABEL_14;
  }
LABEL_7:
  v17 = [MEMORY[0x1E4F1CA98] null];
  if ([v13 isEqual:v17]) {
    v18 = 0;
  }
  else {
    v18 = v13;
  }
  objc_storeStrong((id *)&v5->_phoneSequence, v18);

  v19 = [v4 objectForKey:@"confidence"];
  v20 = (objc_class *)objc_opt_class();
  v21 = NSStringFromClass(v20);
  id v22 = v19;
  id v23 = v21;
  v24 = v23;
  if (v22)
  {
    v25 = [MEMORY[0x1E4F1CA98] null];
    char v26 = [v22 isEqual:v25];

    if (v26)
    {
    }
    else
    {
      NSClassFromString((NSString *)v24);
      char v29 = objc_opt_isKindOfClass();

      if ((v29 & 1) == 0)
      {
        int v44 = 1;
        goto LABEL_93;
      }
    }
    v30 = [MEMORY[0x1E4F1CA98] null];
    if ([v22 isEqual:v30]) {
      int v31 = 0;
    }
    else {
      int v31 = [v22 intValue];
    }
    v5->_confidenceScore = v31;
  }
  else
  {

    v5->_confidenceScore = 0;
  }
  v32 = [v4 objectForKey:@"startTime"];
  v33 = (objc_class *)objc_opt_class();
  v34 = NSStringFromClass(v33);
  id v35 = v32;
  id v36 = v34;
  v37 = v36;
  if (!v35)
  {

    v5->_startTime = 0.0;
    goto LABEL_33;
  }
  v38 = [MEMORY[0x1E4F1CA98] null];
  char v39 = [v35 isEqual:v38];

  if (v39)
  {

    goto LABEL_29;
  }
  NSClassFromString((NSString *)v37);
  char v40 = objc_opt_isKindOfClass();

  if (v40)
  {
LABEL_29:
    v41 = [MEMORY[0x1E4F1CA98] null];
    char v42 = [v35 isEqual:v41];
    double v43 = 0.0;
    if ((v42 & 1) == 0) {
      objc_msgSend(v35, "doubleValue", 0.0);
    }
    v5->_startTime = v43;

    if (v5->_startTime < 0.0) {
      goto LABEL_32;
    }
LABEL_33:
    v45 = [v4 objectForKey:@"silenceStartTime"];
    v46 = (objc_class *)objc_opt_class();
    v47 = NSStringFromClass(v46);
    id v48 = v45;
    id v49 = v47;
    v50 = v49;
    if (v48)
    {
      v51 = [MEMORY[0x1E4F1CA98] null];
      char v52 = [v48 isEqual:v51];

      if (v52)
      {
      }
      else
      {
        NSClassFromString((NSString *)v50);
        char v53 = objc_opt_isKindOfClass();

        if ((v53 & 1) == 0)
        {
LABEL_41:
          int v44 = 1;
LABEL_91:

          goto LABEL_92;
        }
      }
      v54 = [MEMORY[0x1E4F1CA98] null];
      char v55 = [v48 isEqual:v54];
      double v56 = 0.0;
      if ((v55 & 1) == 0) {
        objc_msgSend(v48, "doubleValue", 0.0);
      }
      v5->_silenceStartTime = v56;

      if (v5->_silenceStartTime < 0.0) {
        goto LABEL_41;
      }
    }
    else
    {

      v5->_silenceStartTime = 0.0;
    }
    id v105 = v35;
    v57 = [v4 objectForKey:@"endTime"];
    v58 = (objc_class *)objc_opt_class();
    v59 = NSStringFromClass(v58);
    id v60 = v57;
    id v61 = v59;
    v62 = v61;
    if (v60)
    {
      v63 = [MEMORY[0x1E4F1CA98] null];
      char v64 = [v60 isEqual:v63];

      if (v64)
      {

        v65 = v60;
      }
      else
      {
        NSClassFromString((NSString *)v62);
        char v66 = objc_opt_isKindOfClass();

        v65 = v60;
        if ((v66 & 1) == 0)
        {
          int v44 = 1;
          id v35 = v105;
          goto LABEL_90;
        }
      }
      v67 = [MEMORY[0x1E4F1CA98] null];
      char v68 = [v65 isEqual:v67];
      double v69 = 0.0;
      if ((v68 & 1) == 0) {
        objc_msgSend(v65, "doubleValue", 0.0);
      }
      v5->_endTime = v69;

      if (v5->_endTime < 0.0)
      {
        int v44 = 1;
        id v35 = v105;
LABEL_90:

        goto LABEL_91;
      }
    }
    else
    {

      v5->_endTime = 0.0;
      v65 = 0;
    }
    v104 = v65;
    v70 = [v4 objectForKey:@"removeSpaceBefore"];
    v71 = (objc_class *)objc_opt_class();
    v72 = NSStringFromClass(v71);
    int v73 = validationOfObjectWithClassType(v70, v72);

    if (v73)
    {
      if (v70)
      {
        v74 = [MEMORY[0x1E4F1CA98] null];
        if ([v70 isEqual:v74]) {
          char v75 = 0;
        }
        else {
          char v75 = [v70 BOOLValue];
        }
        v5->_removeSpaceBefore = v75;
      }
      else
      {
        v5->_removeSpaceBefore = 0;
      }
      v76 = [v4 objectForKey:@"removeSpaceAfter"];
      v77 = (objc_class *)objc_opt_class();
      v78 = NSStringFromClass(v77);
      int v79 = validationOfObjectWithClassType(v76, v78);

      v103 = v76;
      if (v79)
      {
        if (v76)
        {
          v80 = [MEMORY[0x1E4F1CA98] null];
          if ([v76 isEqual:v80]) {
            char v81 = 0;
          }
          else {
            char v81 = [v76 BOOLValue];
          }
          v5->_removeSpaceAfter = v81;
        }
        else
        {
          v5->_removeSpaceAfter = 0;
        }
        v82 = [v4 objectForKey:@"ipaPhoneSequence"];
        v83 = (objc_class *)objc_opt_class();
        v84 = NSStringFromClass(v83);
        int v85 = validationOfObjectWithClassType(v82, v84);

        v102 = v82;
        if (v85)
        {
          v86 = [MEMORY[0x1E4F1CA98] null];
          if ([v82 isEqual:v86]) {
            v87 = 0;
          }
          else {
            v87 = v82;
          }
          objc_storeStrong((id *)&v5->_ipaPhoneSequence, v87);

          v88 = [v4 objectForKey:@"graphCost"];
          v89 = (objc_class *)objc_opt_class();
          v90 = NSStringFromClass(v89);
          v101 = v88;
          LODWORD(v88) = validationOfObjectWithClassType(v88, v90);

          if (v88)
          {
            v91 = [MEMORY[0x1E4F1CA98] null];
            if ([v101 isEqual:v91]) {
              v92 = 0;
            }
            else {
              v92 = v101;
            }
            objc_storeStrong((id *)&v5->_graphCost, v92);

            v93 = [v4 objectForKey:@"acousticCost"];
            v94 = (objc_class *)objc_opt_class();
            v95 = NSStringFromClass(v94);
            v100 = v93;
            LODWORD(v93) = validationOfObjectWithClassType(v93, v95);

            if (v93)
            {
              v96 = [MEMORY[0x1E4F1CA98] null];
              v97 = v100;
              if ([v100 isEqual:v96]) {
                v98 = 0;
              }
              else {
                v98 = v100;
              }
              objc_storeStrong((id *)&v5->_acousticCost, v98);

              int v44 = 0;
            }
            else
            {
              int v44 = 1;
              v97 = v100;
            }
          }
          else
          {
            int v44 = 1;
          }
          v65 = v104;
          id v35 = v105;
        }
        else
        {
          int v44 = 1;
          v65 = v104;
          id v35 = v105;
        }
      }
      else
      {
        int v44 = 1;
        v65 = v104;
        id v35 = v105;
      }
    }
    else
    {
      int v44 = 1;
      v65 = v104;
      id v35 = v105;
    }

    goto LABEL_90;
  }
LABEL_32:
  int v44 = 1;
LABEL_92:

LABEL_93:
  if (!v44)
  {
LABEL_94:
    v27 = v5;
    goto LABEL_95;
  }
LABEL_15:
  v27 = 0;
LABEL_95:

  return v27;
}

- (id)aceToken
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F969D0]);
  id v4 = [(AFSpeechToken *)self text];
  [v3 setText:v4];

  v5 = [(AFSpeechToken *)self phoneSequence];
  [v3 setPhoneSequence:v5];

  uint64_t v6 = (void *)MEMORY[0x1E4F28ED0];
  [(AFSpeechToken *)self startTime];
  v8 = [v6 numberWithDouble:v7 * 1000.0];
  [v3 setStartTime:v8];

  id v9 = (void *)MEMORY[0x1E4F28ED0];
  [(AFSpeechToken *)self silenceStartTime];
  v11 = [v9 numberWithDouble:v10 * 1000.0];
  [v3 setSilenceStartTime:v11];

  v12 = (void *)MEMORY[0x1E4F28ED0];
  [(AFSpeechToken *)self endTime];
  id v14 = [v12 numberWithDouble:v13 * 1000.0];
  [v3 setEndTime:v14];

  objc_msgSend(v3, "setAddSpaceAfter:", -[AFSpeechToken removeSpaceAfter](self, "removeSpaceAfter") ^ 1);
  objc_msgSend(v3, "setRemoveSpaceAfter:", -[AFSpeechToken removeSpaceAfter](self, "removeSpaceAfter"));
  objc_msgSend(v3, "setRemoveSpaceBefore:", -[AFSpeechToken removeSpaceBefore](self, "removeSpaceBefore"));
  v15 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AFSpeechToken confidenceScore](self, "confidenceScore"));
  [v3 setConfidenceScore:v15];

  return v3;
}

- (AFSpeechToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AFSpeechToken;
  v5 = [(AFSpeechToken *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    uint64_t text = v5->_text;
    v5->_uint64_t text = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneSequence"];
    uint64_t phoneSequence = v5->_phoneSequence;
    v5->_uint64_t phoneSequence = (NSString *)v8;

    v5->_confidenceScore = [v4 decodeIntegerForKey:@"confidence"];
    [v4 decodeDoubleForKey:@"startTime"];
    v5->_startTime = v10;
    [v4 decodeDoubleForKey:@"silenceStartTime"];
    v5->_silenceStartTime = v11;
    [v4 decodeDoubleForKey:@"endTime"];
    v5->_endTime = v12;
    v5->_removeSpaceBefore = [v4 decodeBoolForKey:@"removeSpaceBefore"];
    v5->_removeSpaceAfter = [v4 decodeBoolForKey:@"removeSpaceAfter"];
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ipaPhoneSequence"];
    ipaPhoneSequence = v5->_ipaPhoneSequence;
    v5->_ipaPhoneSequence = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"graphCost"];
    graphCost = v5->_graphCost;
    v5->_graphCost = (NSNumber *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"acousticCost"];
    acousticCost = v5->_acousticCost;
    v5->_acousticCost = (NSNumber *)v17;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t text = self->_text;
  id v5 = a3;
  [v5 encodeObject:text forKey:@"text"];
  [v5 encodeObject:self->_phoneSequence forKey:@"phoneSequence"];
  [v5 encodeInteger:self->_confidenceScore forKey:@"confidence"];
  [v5 encodeDouble:@"startTime" forKey:self->_startTime];
  [v5 encodeDouble:@"silenceStartTime" forKey:self->_silenceStartTime];
  [v5 encodeDouble:@"endTime" forKey:self->_endTime];
  [v5 encodeBool:self->_removeSpaceBefore forKey:@"removeSpaceBefore"];
  [v5 encodeBool:self->_removeSpaceAfter forKey:@"removeSpaceAfter"];
  [v5 encodeObject:self->_ipaPhoneSequence forKey:@"ipaPhoneSequence"];
  [v5 encodeObject:self->_graphCost forKey:@"graphCost"];
  [v5 encodeObject:self->_acousticCost forKey:@"acousticCost"];
}

- (id)description
{
  v15.receiver = self;
  v15.super_class = (Class)AFSpeechToken;
  id v3 = [(AFSpeechToken *)&v15 description];
  long long v13 = *(_OWORD *)&self->_startTime;
  long long v14 = *(_OWORD *)&self->_text;
  double endTime = self->_endTime;
  if (self->_removeSpaceBefore) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  if (self->_removeSpaceAfter) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  ipaPhoneSequence = self->_ipaPhoneSequence;
  int64_t confidenceScore = self->_confidenceScore;
  id v9 = [(NSNumber *)self->_graphCost stringValue];
  double v10 = [(NSNumber *)self->_acousticCost stringValue];
  double v11 = [v3 stringByAppendingFormat:@"text: %@, phoneSequence: %@, score: %ld, start: %lf, silenceStart: %lf, end: %lf, remove space before: %@ after: %@, ipaPhoneSequence: %@, graphCost: %@, acousticCost: %@", v14, confidenceScore, v13, *(void *)&endTime, v5, v6, ipaPhoneSequence, v9, v10];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  BOOL v6 = (objc_opt_isKindOfClass() & 1) != 0
    && ((id v5 = (NSString *)*((void *)v4 + 2), v5 == self->_text) || -[NSString isEqualToString:](v5, "isEqualToString:"))&& (([*((id *)v4 + 3) isEqualToString:self->_phoneSequence] & 1) != 0|| (NSString *)*((void *)v4 + 3) == self->_phoneSequence)&& *((void *)v4 + 5) == self->_confidenceScore&& *((double *)v4 + 6) == self->_startTime&& *((double *)v4 + 7) == self->_silenceStartTime&& *((double *)v4 + 8) == self->_endTime&& v4[8] == self->_removeSpaceBefore&& v4[9] == self->_removeSpaceAfter&& ((objc_msgSend(*((id *)v4 + 4), "isEqualToString:", self->_ipaPhoneSequence) & 1) != 0|| (NSString *)*((void *)v4 + 3) == self->_phoneSequence)&& ((objc_msgSend(*((id *)v4 + 9), "isEqual:", self->_graphCost) & 1) != 0|| (NSNumber *)*((void *)v4 + 9) == self->_graphCost)&& ((objc_msgSend(*((id *)v4 + 10), "isEqual:", self->_acousticCost) & 1) != 0|| (NSNumber *)*((void *)v4 + 10) == self->_acousticCost);

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_text hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end