@interface MKMapItemMetadata
- (GEOBusiness)business;
- (MKMapItemMetadata)initWithBusiness:(id)a3;
- (NSMutableDictionary)imageCache;
- (id)description;
- (id)imageForURL:(id)a3;
- (void)addImage:(id)a3 forURL:(id)a4;
- (void)setImageCache:(id)a3;
@end

@implementation MKMapItemMetadata

- (MKMapItemMetadata)initWithBusiness:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MKMapItemMetadata;
  v6 = [(MKMapItemMetadata *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_business, a3);
    v8 = v7;
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)MKMapItemMetadata;
  v4 = [(MKMapItemMetadata *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@: business: %@ imageCache: %@", v4, self->_business, self->_imageCache];

  return v5;
}

- (NSMutableDictionary)imageCache
{
  imageCache = self->_imageCache;
  if (!imageCache)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v5 = self->_imageCache;
    self->_imageCache = v4;

    imageCache = self->_imageCache;
  }

  return imageCache;
}

- (void)addImage:(id)a3 forURL:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(MKMapItemMetadata *)self imageCache];
    [v8 setObject:v7 forKey:v6];
  }
}

- (id)imageForURL:(id)a3
{
  id v4 = a3;
  id v5 = [(MKMapItemMetadata *)self imageCache];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (GEOBusiness)business
{
  return self->_business;
}

- (void)setImageCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);

  objc_storeStrong((id *)&self->_business, 0);
}

@end