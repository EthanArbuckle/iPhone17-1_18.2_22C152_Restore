@interface MLProbabilityDictionaryFloat64Storage
- (MLProbabilityDictionaryFloat64Storage)initWithFloat64CArray:(const double *)a3 count:(unint64_t)a4;
- (id)probabilityAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)maxElementIndex;
@end

@implementation MLProbabilityDictionaryFloat64Storage

- (void).cxx_destruct
{
}

- (unint64_t)count
{
  return [(NSData *)self->_data length] >> 3;
}

- (unint64_t)maxElementIndex
{
  if (![(MLProbabilityDictionaryFloat64Storage *)self count]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v3 = [(NSData *)self->_data bytes];
  v4 = [(NSData *)self->_data bytes];
  v5 = (double *)&v4[[(NSData *)self->_data length]];
  v6 = v3 + 1;
  if (v3 == v5 || v6 == v5)
  {
    v10 = v3;
  }
  else
  {
    double v9 = *v3;
    v10 = v3;
    v11 = v3 + 1;
    do
    {
      double v12 = *v11++;
      double v13 = v12;
      if (v9 < v12)
      {
        double v9 = v13;
        v10 = v6;
      }
      v6 = v11;
    }
    while (v11 != v5);
  }
  return v10 - v3;
}

- (id)probabilityAtIndex:(unint64_t)a3
{
  if ([(MLProbabilityDictionaryFloat64Storage *)self count] <= a3) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C4A8], @"Probability index %tu is out of range because there are only %tu classes.", a3, -[MLProbabilityDictionaryFloat64Storage count](self, "count"));
  }
  v5 = NSNumber;
  double v6 = *(double *)([(NSData *)self->_data bytes] + 8 * a3);

  return (id)[v5 numberWithDouble:v6];
}

- (MLProbabilityDictionaryFloat64Storage)initWithFloat64CArray:(const double *)a3 count:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)MLProbabilityDictionaryFloat64Storage;
  double v6 = [(MLProbabilityDictionaryFloat64Storage *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a3 length:8 * a4];
    data = v6->_data;
    v6->_data = (NSData *)v7;
  }
  return v6;
}

@end