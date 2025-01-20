@interface FigCaptureCinematographyPipelineConfiguration
- (void)dealloc;
- (void)setObjectMetadataIdentifiers:(void *)a1;
@end

@implementation FigCaptureCinematographyPipelineConfiguration

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureCinematographyPipelineConfiguration;
  [(FigCaptureCinematographyPipelineConfiguration *)&v3 dealloc];
}

- (void)setObjectMetadataIdentifiers:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 8);
  }
}

@end