@interface CSUSmileySpotterModelOutput
- (BOOL)generateBlobFace;
- (CSUSmileySpotterModelOutput)initWithOutput:(BOOL)a3 Probability:(id)a4 smileySpotterRevision:(int64_t)a5;
- (MLMultiArray)generateBlobFaceProb;
- (int64_t)smileySpotterRevision;
@end

@implementation CSUSmileySpotterModelOutput

- (CSUSmileySpotterModelOutput)initWithOutput:(BOOL)a3 Probability:(id)a4 smileySpotterRevision:(int64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)CSUSmileySpotterModelOutput;
  v8 = [(CSUSmileySpotterModelOutput *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_generateBlobFace = a3;
    v8->_generateBlobFaceProb = (MLMultiArray *)a4;
    v8->_smileySpotterRevision = a5;
    v10 = v8;
  }

  return v9;
}

- (BOOL)generateBlobFace
{
  return self->_generateBlobFace;
}

- (MLMultiArray)generateBlobFaceProb
{
  return self->_generateBlobFaceProb;
}

- (int64_t)smileySpotterRevision
{
  return self->_smileySpotterRevision;
}

@end