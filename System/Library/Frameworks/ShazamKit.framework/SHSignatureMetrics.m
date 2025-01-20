@interface SHSignatureMetrics
+ (BOOL)supportsSecureCoding;
- (NSDate)sessionStartDate;
- (SHSignatureMetrics)initWithCoder:(id)a3;
- (SHSignatureMetrics)initWithSessionStartDate:(id)a3 signatureRecordingOffset:(double)a4;
- (double)sessionDuration;
- (double)signatureRecordingOffset;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)recordingSource;
- (void)encodeWithCoder:(id)a3;
- (void)setRecordingSource:(int64_t)a3;
@end

@implementation SHSignatureMetrics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SHSignatureMetrics)initWithSessionStartDate:(id)a3 signatureRecordingOffset:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SHSignatureMetrics;
  v8 = [(SHSignatureMetrics *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sessionStartDate, a3);
    v9->_signatureRecordingOffset = a4;
  }

  return v9;
}

- (SHSignatureMetrics)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionStartDate"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"recordingSource"];
  [v4 decodeDoubleForKey:@"signatureRecordingOffset"];
  double v8 = v7;

  v9 = [(SHSignatureMetrics *)self initWithSessionStartDate:v5 signatureRecordingOffset:v8];
  v10 = v9;
  if (v9) {
    v9->_recordingSource = v6;
  }

  return v10;
}

- (double)sessionDuration
{
  v3 = [(SHSignatureMetrics *)self sessionStartDate];
  if (v3)
  {
    id v4 = [MEMORY[0x263EFF910] date];
    v5 = [(SHSignatureMetrics *)self sessionStartDate];
    [v4 timeIntervalSinceDate:v5];
    double v7 = v6;
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(SHSignatureMetrics *)self sessionStartDate];
  [v5 encodeObject:v4 forKey:@"sessionStartDate"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[SHSignatureMetrics recordingSource](self, "recordingSource"), @"recordingSource");
  [(SHSignatureMetrics *)self signatureRecordingOffset];
  objc_msgSend(v5, "encodeDouble:forKey:", @"signatureRecordingOffset");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = +[SHSignatureMetrics allocWithZone:](SHSignatureMetrics, "allocWithZone:");
  double v6 = [(SHSignatureMetrics *)self sessionStartDate];
  double v7 = (void *)[v6 copyWithZone:a3];
  [(SHSignatureMetrics *)self signatureRecordingOffset];
  double v8 = -[SHSignatureMetrics initWithSessionStartDate:signatureRecordingOffset:](v5, "initWithSessionStartDate:signatureRecordingOffset:", v7);

  [(SHSignatureMetrics *)v8 setRecordingSource:[(SHSignatureMetrics *)self recordingSource]];
  return v8;
}

- (int64_t)recordingSource
{
  return self->_recordingSource;
}

- (void)setRecordingSource:(int64_t)a3
{
  self->_recordingSource = a3;
}

- (NSDate)sessionStartDate
{
  return self->_sessionStartDate;
}

- (double)signatureRecordingOffset
{
  return self->_signatureRecordingOffset;
}

- (void).cxx_destruct
{
}

@end