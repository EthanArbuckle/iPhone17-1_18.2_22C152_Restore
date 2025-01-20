@interface ARUIPipelineFactory
- (ARUIPipelineFactory)initWithDevice:(id)a3 library:(id)a4;
- (ARUIPipelineFactory)initWithDeviceSPI:(id)a3 librarySPI:(id)a4;
@end

@implementation ARUIPipelineFactory

- (ARUIPipelineFactory)initWithDeviceSPI:(id)a3 librarySPI:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ARUIPipelineFactory;
  return [(ARUIPipelineFactory *)&v5 init];
}

- (ARUIPipelineFactory)initWithDevice:(id)a3 library:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ARUIPipelineFactory;
  return [(ARUIPipelineFactory *)&v5 init];
}

@end