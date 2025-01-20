@interface CSUCaptionResult
- (CSUCaptionResult)initWithCaption:(id)a3 score:(float)a4;
- (NSString)caption;
- (float)score;
@end

@implementation CSUCaptionResult

- (CSUCaptionResult)initWithCaption:(id)a3 score:(float)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSUCaptionResult;
  v8 = [(CSUCaptionResult *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_score = a4;
    objc_storeStrong((id *)&v8->_caption, a3);
    v10 = v9;
  }

  return v9;
}

- (float)score
{
  return self->_score;
}

- (NSString)caption
{
  return self->_caption;
}

- (void).cxx_destruct
{
}

@end