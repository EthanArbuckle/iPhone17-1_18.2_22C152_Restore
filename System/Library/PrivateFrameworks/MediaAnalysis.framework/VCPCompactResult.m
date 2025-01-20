@interface VCPCompactResult
- ($D854FC4CDD8DDEA9B2859E823A7C8A75)timerange;
- (VCPCompactResult)initWithTimerange:(id *)a3 andScore:(float)a4;
- (float)score;
- (void)setScore:(float)a3;
- (void)setTimerange:(id *)a3;
@end

@implementation VCPCompactResult

- (VCPCompactResult)initWithTimerange:(id *)a3 andScore:(float)a4
{
  v12.receiver = self;
  v12.super_class = (Class)VCPCompactResult;
  v6 = [(VCPCompactResult *)&v12 init];
  v7 = (VCPCompactResult *)v6;
  if (v6)
  {
    long long v8 = *(_OWORD *)&a3->var0.var0;
    long long v9 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)(v6 + 44) = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)(v6 + 28) = v9;
    *(_OWORD *)(v6 + 12) = v8;
    *((float *)v6 + 2) = a4;
    v10 = v6;
  }

  return v7;
}

- ($D854FC4CDD8DDEA9B2859E823A7C8A75)timerange
{
  objc_copyStruct(retstr, &self->_score + 1, 48, 1, 0);
  return result;
}

- (void)setTimerange:(id *)a3
{
}

- (float)score
{
  return self->_score;
}

- (void)setScore:(float)a3
{
  self->_score = a3;
}

@end