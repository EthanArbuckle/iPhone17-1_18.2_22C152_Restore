@interface ASDJobManagerOptions
+ (BOOL)supportsSecureCoding;
- (ASDJobManagerOptions)initWithCoder:(id)a3;
- (BOOL)shouldFilterExternalOriginatedDownloads;
- (BOOL)shouldReportDownloadProgress;
- (NSString)persistenceIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setPersistenceIdentifier:(id)a3;
- (void)setShouldFilterExternalOriginatedDownloads:(BOOL)a3;
- (void)setShouldReportDownloadProgress:(BOOL)a3;
@end

@implementation ASDJobManagerOptions

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[ASDJobManagerOptions allocWithZone:](ASDJobManagerOptions, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_persistenceIdentifier copyWithZone:a3];
  persistenceIdentifier = v5->_persistenceIdentifier;
  v5->_persistenceIdentifier = (NSString *)v6;

  v5->_shouldFilterExternalOriginatedDownloads = self->_shouldFilterExternalOriginatedDownloads;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDJobManagerOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASDJobManagerOptions *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"persistenceIdentifier"];
    persistenceIdentifier = v5->_persistenceIdentifier;
    v5->_persistenceIdentifier = (NSString *)v6;

    v5->_shouldFilterExternalOriginatedDownloads = [v4 decodeBoolForKey:@"shouldFilterExternalOriginatedDownloads"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  persistenceIdentifier = self->_persistenceIdentifier;
  id v5 = a3;
  [v5 encodeObject:persistenceIdentifier forKey:@"persistenceIdentifier"];
  [v5 encodeBool:self->_shouldFilterExternalOriginatedDownloads forKey:@"shouldFilterExternalOriginatedDownloads"];
}

- (NSString)persistenceIdentifier
{
  return self->_persistenceIdentifier;
}

- (void)setPersistenceIdentifier:(id)a3
{
}

- (BOOL)shouldFilterExternalOriginatedDownloads
{
  return self->_shouldFilterExternalOriginatedDownloads;
}

- (void)setShouldFilterExternalOriginatedDownloads:(BOOL)a3
{
  self->_shouldFilterExternalOriginatedDownloads = a3;
}

- (BOOL)shouldReportDownloadProgress
{
  return self->_shouldReportDownloadProgress;
}

- (void)setShouldReportDownloadProgress:(BOOL)a3
{
  self->_shouldReportDownloadProgress = a3;
}

- (void).cxx_destruct
{
}

@end