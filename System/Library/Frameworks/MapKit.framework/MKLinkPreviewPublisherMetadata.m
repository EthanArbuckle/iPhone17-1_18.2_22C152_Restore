@interface MKLinkPreviewPublisherMetadata
- (NSString)name;
- (unsigned)numberOfPublishedCollections;
- (void)setName:(id)a3;
- (void)setNumberOfPublishedCollections:(unsigned int)a3;
@end

@implementation MKLinkPreviewPublisherMetadata

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unsigned)numberOfPublishedCollections
{
  return self->_numberOfPublishedCollections;
}

- (void)setNumberOfPublishedCollections:(unsigned int)a3
{
  self->_numberOfPublishedCollections = a3;
}

- (void).cxx_destruct
{
}

@end