@interface SRApplication
+ (id)sharedApplication;
- (CGRect)applicationFrame;
- (SRApplicationDataSource)dataSource;
- (int64_t)_frontMostAppOrientation;
- (int64_t)launchOrientation;
- (void)setDataSource:(id)a3;
- (void)setFrontMostAppOrientation:(int64_t)a3;
@end

@implementation SRApplication

+ (id)sharedApplication
{
  return +[UIApplication sharedApplication];
}

- (CGRect)applicationFrame
{
  v3 = [(SRApplication *)self dataSource];
  [v3 frameForApplication:self];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (int64_t)launchOrientation
{
  return self->_frontMostAppOrientation;
}

- (int64_t)_frontMostAppOrientation
{
  return self->_frontMostAppOrientation;
}

- (void)setFrontMostAppOrientation:(int64_t)a3
{
  self->_frontMostAppOrientation = a3;
}

- (SRApplicationDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (SRApplicationDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end