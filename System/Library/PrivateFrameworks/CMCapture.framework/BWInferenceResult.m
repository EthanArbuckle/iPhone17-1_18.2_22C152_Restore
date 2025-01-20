@interface BWInferenceResult
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timestamp;
- (BOOL)isValid;
- (BWInferenceResult)initWithInferenceType:(int)a3 inferences:(id)a4 atTimestamp:(id *)a5;
- (BWInferenceResult)initWithInferenceType:(int)a3 preventionReason:(id)a4 atTimestamp:(id *)a5;
- (BWInferenceResult)initWithResult:(id)a3 replacementInferences:(id)a4 replacementPreventionReason:(id)a5;
- (NSDictionary)inferences;
- (NSString)preventionReason;
- (char)initWithInferenceType:(void *)a3 inferences:(void *)a4 preventionReason:(long long *)a5 atTimestamp:;
- (id)description;
- (int)inferenceType;
- (void)dealloc;
@end

@implementation BWInferenceResult

- (BWInferenceResult)initWithInferenceType:(int)a3 preventionReason:(id)a4 atTimestamp:(id *)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a5;
  return (BWInferenceResult *)-[BWInferenceResult initWithInferenceType:inferences:preventionReason:atTimestamp:](self, a3, 0, a4, (long long *)&v6.var0);
}

- (char)initWithInferenceType:(void *)a3 inferences:(void *)a4 preventionReason:(long long *)a5 atTimestamp:
{
  if (!a1) {
    return 0;
  }
  v13.receiver = a1;
  v13.super_class = (Class)BWInferenceResult;
  v9 = (char *)objc_msgSendSuper2(&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    *((_DWORD *)v9 + 2) = a2;
    long long v11 = *a5;
    *(void *)(v9 + 28) = *((void *)a5 + 2);
    *(_OWORD *)(v9 + 12) = v11;
    *((void *)v9 + 5) = [a3 copy];
    *((void *)v10 + 6) = [a4 copy];
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceResult;
  [(BWInferenceResult *)&v3 dealloc];
}

- (NSString)preventionReason
{
  return self->_preventionReason;
}

- (BWInferenceResult)initWithInferenceType:(int)a3 inferences:(id)a4 atTimestamp:(id *)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a5;
  return (BWInferenceResult *)-[BWInferenceResult initWithInferenceType:inferences:preventionReason:atTimestamp:](self, a3, a4, 0, (long long *)&v6.var0);
}

- (BWInferenceResult)initWithResult:(id)a3 replacementInferences:(id)a4 replacementPreventionReason:(id)a5
{
  int v9 = [a3 inferenceType];
  if (a3)
  {
    [a3 timestamp];
  }
  else
  {
    long long v11 = 0uLL;
    uint64_t v12 = 0;
  }
  return (BWInferenceResult *)-[BWInferenceResult initWithInferenceType:inferences:preventionReason:atTimestamp:](self, v9, a4, a5, &v11);
}

- (BOOL)isValid
{
  if (self->_timestamp.timescale)
  {
    NSUInteger v2 = [(NSDictionary *)self->_inferences count];
    if (v2) {
      LOBYTE(v2) = self->_preventionReason == 0;
    }
  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return v2;
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = BWInferenceTypeDescription(self->_inferenceType);
  if ([(BWInferenceResult *)self isValid]) {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = @"YES";
  }
  else {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = @"NO";
  }
  return (id)[v3 stringWithFormat:@"<%@ %p> inferenceType: \"%@\", isValid: %@, inferences: %lu (keys: %@), preventionReason: %@", v4, self, v5, v6, -[NSDictionary count](self->_inferences, "count"), -[NSDictionary allKeys](self->_inferences, "allKeys"), self->_preventionReason];
}

- (int)inferenceType
{
  return self->_inferenceType;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timestamp
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var2;
  retstr->var3 = *(int64_t *)((char *)&self[1].var0 + 4);
  return self;
}

- (NSDictionary)inferences
{
  return self->_inferences;
}

@end