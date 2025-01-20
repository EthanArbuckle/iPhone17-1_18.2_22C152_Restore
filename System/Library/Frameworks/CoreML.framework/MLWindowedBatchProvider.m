@interface MLWindowedBatchProvider
- (MLBatchProvider)fullBatch;
- (MLWindowedBatchProvider)initWithBatch:(id)a3 startIndex:(int64_t)a4 windowLength:(int64_t)a5 error:(id *)p_isa;
- (id)featuresAtIndex:(int64_t)a3;
- (int64_t)count;
- (int64_t)startIndex;
- (int64_t)windowLength;
- (void)setFullBatch:(id)a3;
- (void)setStartIndex:(int64_t)a3;
- (void)setWindowLength:(int64_t)a3;
@end

@implementation MLWindowedBatchProvider

- (void).cxx_destruct
{
}

- (void)setWindowLength:(int64_t)a3
{
  self->_windowLength = a3;
}

- (int64_t)windowLength
{
  return self->_windowLength;
}

- (void)setStartIndex:(int64_t)a3
{
  self->_startIndex = a3;
}

- (int64_t)startIndex
{
  return self->_startIndex;
}

- (void)setFullBatch:(id)a3
{
}

- (MLBatchProvider)fullBatch
{
  return self->_fullBatch;
}

- (id)featuresAtIndex:(int64_t)a3
{
  return (id)[(MLBatchProvider *)self->_fullBatch featuresAtIndex:self->_startIndex + a3];
}

- (int64_t)count
{
  return self->_windowLength;
}

- (MLWindowedBatchProvider)initWithBatch:(id)a3 startIndex:(int64_t)a4 windowLength:(int64_t)a5 error:(id *)p_isa
{
  id v11 = a3;
  int64_t v12 = [v11 count];
  int64_t v13 = v12;
  if (a4 < 0 || v12 <= a4 || a5 + a4 > v12)
  {
    if (p_isa)
    {
      v16 = [NSNumber numberWithInteger:a4];
      v17 = [NSNumber numberWithInteger:a5];
      v18 = [NSNumber numberWithInteger:v13];
      *p_isa = +[MLModelErrorUtils errorWithCode:0, @"Invalid window starting at %@ of length %@ for batch size %@", v16, v17, v18 format];

      p_isa = 0;
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)MLWindowedBatchProvider;
    v14 = [(MLWindowedBatchProvider *)&v20 init];
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_fullBatch, a3);
      v15->_startIndex = a4;
      v15->_windowLength = a5;
    }
    self = v15;
    p_isa = (id *)&self->super.isa;
  }

  return (MLWindowedBatchProvider *)p_isa;
}

@end