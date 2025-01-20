@interface BGFastPassSystemTaskRequest
- (BGFastPassSystemTaskRequest)initWithIdentifier:(id)a3;
- (BOOL)reRun;
- (NSArray)processingTaskIdentifiers;
- (NSString)processingTaskIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)semanticVersion;
- (void)setProcessingTaskIdentifier:(id)a3;
- (void)setProcessingTaskIdentifiers:(id)a3;
- (void)setReRun:(BOOL)a3;
- (void)setSemanticVersion:(int64_t)a3;
@end

@implementation BGFastPassSystemTaskRequest

- (BGFastPassSystemTaskRequest)initWithIdentifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BGFastPassSystemTaskRequest;
  return [(BGNonRepeatingSystemTaskRequest *)&v4 initWithIdentifier:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BGFastPassSystemTaskRequest;
  id v5 = -[BGNonRepeatingSystemTaskRequest copyWithZone:](&v9, sel_copyWithZone_);
  v6 = [(BGFastPassSystemTaskRequest *)self processingTaskIdentifiers];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setProcessingTaskIdentifiers:v7];

  objc_msgSend(v5, "setSemanticVersion:", -[BGFastPassSystemTaskRequest semanticVersion](self, "semanticVersion"));
  objc_msgSend(v5, "setReRun:", -[BGFastPassSystemTaskRequest reRun](self, "reRun"));
  return v5;
}

- (NSString)processingTaskIdentifier
{
  return self->_processingTaskIdentifier;
}

- (void)setProcessingTaskIdentifier:(id)a3
{
}

- (NSArray)processingTaskIdentifiers
{
  return self->_processingTaskIdentifiers;
}

- (void)setProcessingTaskIdentifiers:(id)a3
{
}

- (int64_t)semanticVersion
{
  return self->_semanticVersion;
}

- (void)setSemanticVersion:(int64_t)a3
{
  self->_semanticVersion = a3;
}

- (BOOL)reRun
{
  return self->_reRun;
}

- (void)setReRun:(BOOL)a3
{
  self->_reRun = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingTaskIdentifiers, 0);
  objc_storeStrong((id *)&self->_processingTaskIdentifier, 0);
}

@end