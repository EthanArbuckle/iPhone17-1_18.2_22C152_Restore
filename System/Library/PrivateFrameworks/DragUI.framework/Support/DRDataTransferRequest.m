@interface DRDataTransferRequest
- (NSProgress)progress;
- (NSString)typeIdentifier;
- (PBItem)sourceItem;
- (id)completionHandler;
- (void)setCompletionHandler:(id)a3;
- (void)setProgress:(id)a3;
- (void)setSourceItem:(id)a3;
- (void)setTypeIdentifier:(id)a3;
@end

@implementation DRDataTransferRequest

- (PBItem)sourceItem
{
  return self->_sourceItem;
}

- (void)setSourceItem:(id)a3
{
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (void)setTypeIdentifier:(id)a3
{
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);
}

@end