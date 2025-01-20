@interface ATXAnchorModelPredictionOffsetFromAnchorOccurrence
+ (BOOL)supportsSecureCoding;
- (ATXAnchorModelPredictionOffsetFromAnchorOccurrence)initWithCoder:(id)a3;
- (ATXAnchorModelPredictionOffsetFromAnchorOccurrence)initWithStartSecondsAfterAnchor:(double)a3 endSecondsAfterAnchor:(double)a4;
- (BOOL)checkAndReportDecodingFailureIfNeededFordouble:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (double)endSecondsAfterAnchor;
- (double)startSecondsAfterAnchor;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXAnchorModelPredictionOffsetFromAnchorOccurrence

- (ATXAnchorModelPredictionOffsetFromAnchorOccurrence)initWithStartSecondsAfterAnchor:(double)a3 endSecondsAfterAnchor:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ATXAnchorModelPredictionOffsetFromAnchorOccurrence;
  result = [(ATXAnchorModelPredictionOffsetFromAnchorOccurrence *)&v7 init];
  if (result)
  {
    result->_startSecondsAfterAnchor = a3;
    result->_endSecondsAfterAnchor = a4;
  }
  return result;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"Start seconds after anchor: %.2f, End seconds after anchor: %.2f", *(void *)&self->_startSecondsAfterAnchor, *(void *)&self->_endSecondsAfterAnchor];
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXAnchorModelPredictionOffsetFromAnchorOccurrence *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      double startSecondsAfterAnchor = self->_startSecondsAfterAnchor;
      [(ATXAnchorModelPredictionOffsetFromAnchorOccurrence *)v5 startSecondsAfterAnchor];
      if (startSecondsAfterAnchor == v7)
      {
        double endSecondsAfterAnchor = self->_endSecondsAfterAnchor;
        [(ATXAnchorModelPredictionOffsetFromAnchorOccurrence *)v5 endSecondsAfterAnchor];
        BOOL v8 = endSecondsAfterAnchor == v10;
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  return (unint64_t)self->_endSecondsAfterAnchor
       - (unint64_t)self->_startSecondsAfterAnchor
       + 32 * (unint64_t)self->_startSecondsAfterAnchor;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededFordouble:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (a3 == 0.0)
  {
    v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  double startSecondsAfterAnchor = self->_startSecondsAfterAnchor;
  id v5 = a3;
  [v5 encodeDouble:@"startSeconds" forKey:startSecondsAfterAnchor];
  [v5 encodeDouble:@"endSeconds" forKey:self->_endSecondsAfterAnchor];
}

- (ATXAnchorModelPredictionOffsetFromAnchorOccurrence)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"startSeconds"];
  double v6 = v5;
  if (-[ATXAnchorModelPredictionOffsetFromAnchorOccurrence checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", @"startSeconds", v4, @"endSeconds", -1)|| ([v4 decodeDoubleForKey:@"endSeconds"], double v8 = v7, -[ATXAnchorModelPredictionOffsetFromAnchorOccurrence checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", @"endSeconds", v4, @"endSeconds", -1)))
  {
    v9 = 0;
  }
  else
  {
    self = [(ATXAnchorModelPredictionOffsetFromAnchorOccurrence *)self initWithStartSecondsAfterAnchor:v6 endSecondsAfterAnchor:v8];
    v9 = self;
  }

  return v9;
}

- (double)startSecondsAfterAnchor
{
  return self->_startSecondsAfterAnchor;
}

- (double)endSecondsAfterAnchor
{
  return self->_endSecondsAfterAnchor;
}

@end