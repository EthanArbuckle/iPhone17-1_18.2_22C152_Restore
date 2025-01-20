@interface LPDownloadProgress
- (BOOL)isFinished;
- (LPDownloadProgress)initWithProgress:(double)a3 subtitle:(id)a4 isFinished:(BOOL)a5;
- (NSString)subtitle;
- (double)progress;
- (void)setIsFinished:(BOOL)a3;
- (void)setProgress:(double)a3;
- (void)setSubtitle:(id)a3;
@end

@implementation LPDownloadProgress

- (LPDownloadProgress)initWithProgress:(double)a3 subtitle:(id)a4 isFinished:(BOOL)a5
{
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)LPDownloadProgress;
  v10 = [(LPDownloadProgress *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->_progress = a3;
    objc_storeStrong((id *)&v10->_subtitle, a4);
    v11->_isFinished = a5;
    v12 = v11;
  }

  return v11;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)setIsFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

- (void).cxx_destruct
{
}

@end