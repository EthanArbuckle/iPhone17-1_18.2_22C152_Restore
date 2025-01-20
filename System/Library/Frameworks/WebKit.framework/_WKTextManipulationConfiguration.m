@interface _WKTextManipulationConfiguration
- (BOOL)includeSubframes;
- (NSArray)exclusionRules;
- (void)dealloc;
- (void)setExclusionRules:(id)a3;
- (void)setIncludeSubframes:(BOOL)a3;
@end

@implementation _WKTextManipulationConfiguration

- (void)dealloc
{
  self->_exclusionRules = 0;
  v3.receiver = self;
  v3.super_class = (Class)_WKTextManipulationConfiguration;
  [(_WKTextManipulationConfiguration *)&v3 dealloc];
}

- (NSArray)exclusionRules
{
  return self->_exclusionRules;
}

- (void)setExclusionRules:(id)a3
{
}

- (BOOL)includeSubframes
{
  return self->_includeSubframes;
}

- (void)setIncludeSubframes:(BOOL)a3
{
  self->_includeSubframes = a3;
}

@end