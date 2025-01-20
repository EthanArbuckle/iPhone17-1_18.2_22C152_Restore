@interface VCPMovieHighlightResult
- ($D854FC4CDD8DDEA9B2859E823A7C8A75)timerange;
- (VCPMovieHighlightResult)initWithTimeRange:(id *)a3 score:(float)a4 andKeyFrame:(id)a5;
- (VCPVideoKeyFrameResult)keyFrame;
- (float)score;
@end

@implementation VCPMovieHighlightResult

- (VCPMovieHighlightResult)initWithTimeRange:(id *)a3 score:(float)a4 andKeyFrame:(id)a5
{
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VCPMovieHighlightResult;
  v10 = [(VCPMovieHighlightResult *)&v15 init];
  v11 = (VCPMovieHighlightResult *)v10;
  if (v10)
  {
    long long v12 = *(_OWORD *)&a3->var0.var0;
    long long v13 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)(v10 + 56) = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)(v10 + 40) = v13;
    *(_OWORD *)(v10 + 24) = v12;
    *((float *)v10 + 2) = a4;
    objc_storeStrong((id *)v10 + 2, a5);
  }

  return v11;
}

- ($D854FC4CDD8DDEA9B2859E823A7C8A75)timerange
{
  long long v3 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var1;
  return self;
}

- (float)score
{
  return self->_score;
}

- (VCPVideoKeyFrameResult)keyFrame
{
  return self->_keyFrame;
}

- (void).cxx_destruct
{
}

@end