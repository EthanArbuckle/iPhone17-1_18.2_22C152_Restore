@interface MKMapItemMetadataRequest
- (MKMapItem)mapItem;
- (NSURL)url;
- (NSURLRequest)urlRequest;
- (void)setMapItem:(id)a3;
@end

@implementation MKMapItemMetadataRequest

- (NSURL)url
{
  return 0;
}

- (NSURLRequest)urlRequest
{
  v3 = [(MKMapItemMetadataRequest *)self url];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F290D0];
    v5 = [(MKMapItemMetadataRequest *)self url];
    v6 = [v4 requestWithURL:v5];
  }
  else
  {
    v6 = 0;
  }

  return (NSURLRequest *)v6;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end