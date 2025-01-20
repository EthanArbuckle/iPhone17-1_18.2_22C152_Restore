@interface PHImportAssetMetadataRequest
- (id)completionHandler;
- (id)description;
- (void)setCompletionHandler:(id)a3;
@end

@implementation PHImportAssetMetadataRequest

- (void).cxx_destruct
{
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (id)description
{
  return @"metadata";
}

@end