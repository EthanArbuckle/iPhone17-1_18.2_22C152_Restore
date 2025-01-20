@interface _WKArchiveConfiguration
- (NSArray)exclusionRules;
- (NSString)suggestedFileName;
- (NSURL)directory;
- (void)dealloc;
- (void)setDirectory:(id)a3;
- (void)setExclusionRules:(id)a3;
- (void)setSuggestedFileName:(id)a3;
@end

@implementation _WKArchiveConfiguration

- (void)dealloc
{
  self->_directory = 0;
  self->_suggestedFileName = 0;

  self->_exclusionRules = 0;
  v3.receiver = self;
  v3.super_class = (Class)_WKArchiveConfiguration;
  [(_WKArchiveConfiguration *)&v3 dealloc];
}

- (NSURL)directory
{
  return self->_directory;
}

- (void)setDirectory:(id)a3
{
}

- (NSString)suggestedFileName
{
  return self->_suggestedFileName;
}

- (void)setSuggestedFileName:(id)a3
{
}

- (NSArray)exclusionRules
{
  return self->_exclusionRules;
}

- (void)setExclusionRules:(id)a3
{
}

@end