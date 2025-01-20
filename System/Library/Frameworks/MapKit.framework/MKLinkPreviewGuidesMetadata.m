@interface MKLinkPreviewGuidesMetadata
- (NSArray)addresses;
- (NSString)name;
- (NSString)publisherName;
- (UIImage)publisherIcon;
- (unsigned)numberOfItems;
- (void)setAddresses:(id)a3;
- (void)setName:(id)a3;
- (void)setNumberOfItems:(unsigned int)a3;
- (void)setPublisherIcon:(id)a3;
- (void)setPublisherName:(id)a3;
@end

@implementation MKLinkPreviewGuidesMetadata

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unsigned)numberOfItems
{
  return self->_numberOfItems;
}

- (void)setNumberOfItems:(unsigned int)a3
{
  self->_numberOfItems = a3;
}

- (NSArray)addresses
{
  return self->_addresses;
}

- (void)setAddresses:(id)a3
{
}

- (NSString)publisherName
{
  return self->_publisherName;
}

- (void)setPublisherName:(id)a3
{
}

- (UIImage)publisherIcon
{
  return self->_publisherIcon;
}

- (void)setPublisherIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherIcon, 0);
  objc_storeStrong((id *)&self->_publisherName, 0);
  objc_storeStrong((id *)&self->_addresses, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end