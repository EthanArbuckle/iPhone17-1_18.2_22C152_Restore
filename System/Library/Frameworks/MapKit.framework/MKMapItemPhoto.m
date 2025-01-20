@interface MKMapItemPhoto
- (BOOL)displayFullScreenPhotoGallery;
- (BOOL)needsObfuscationWhenRenderedInFullScreen;
- (BOOL)useGallery;
- (GEOMapItemPhoto)geoMapItemPhoto;
- (MKMapItemPhoto)initWithGeoMapItemPhoto:(id)a3;
- (MKMapItemPhoto)initWithGeoMapItemPhoto:(id)a3 fallbackTitle:(id)a4;
- (MKMapItemPhoto)initWithGeoMapItemPhoto:(id)a3 title:(id)a4 subtitle:(id)a5;
- (MKMapItemPhoto)initWithPictureItem:(id)a3;
- (NSString)license;
- (NSString)photoID;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)largestPhotoURL;
- (_MKMapItemPhotosAttribution)attribution;
- (id)urlForBestPhotoForSize:(CGSize)a3;
- (int64_t)format;
- (int64_t)photoStyle;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MKMapItemPhoto

- (MKMapItemPhoto)initWithGeoMapItemPhoto:(id)a3 title:(id)a4 subtitle:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MKMapItemPhoto;
  v12 = [(MKMapItemPhoto *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_geoMapItemPhoto, a3);
    uint64_t v14 = [v10 copy];
    title = v13->_title;
    v13->_title = (NSString *)v14;

    objc_storeStrong((id *)&v13->_subtitle, a5);
    v16 = [_MKMapItemPhotosAttribution alloc];
    v17 = [v9 attribution];
    uint64_t v18 = [(_MKMapItemPhotosAttribution *)v16 initWithGEOMapItemAttribution:v17];
    attribution = v13->_attribution;
    v13->_attribution = (_MKMapItemPhotosAttribution *)v18;

    v13->_photoStyle = 0;
  }

  return v13;
}

- (MKMapItemPhoto)initWithPictureItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 photo];
  v6 = [v4 primaryText];
  v7 = [v4 secondaryText];
  if ([v7 length])
  {
    v8 = [v4 secondaryText];
    id v9 = [(MKMapItemPhoto *)self initWithGeoMapItemPhoto:v5 title:v6 subtitle:v8];
  }
  else
  {
    id v9 = [(MKMapItemPhoto *)self initWithGeoMapItemPhoto:v5 title:v6 subtitle:0];
  }

  if (v9) {
    v9->_photoStyle = 1;
  }

  return v9;
}

- (MKMapItemPhoto)initWithGeoMapItemPhoto:(id)a3
{
  return [(MKMapItemPhoto *)self initWithGeoMapItemPhoto:a3 title:0 subtitle:0];
}

- (MKMapItemPhoto)initWithGeoMapItemPhoto:(id)a3 fallbackTitle:(id)a4
{
  return [(MKMapItemPhoto *)self initWithGeoMapItemPhoto:a3 title:a4 subtitle:0];
}

- (NSString)license
{
  return (NSString *)[(GEOMapItemPhoto *)self->_geoMapItemPhoto licenseDescription];
}

- (NSURL)largestPhotoURL
{
  v2 = [(GEOMapItemPhoto *)self->_geoMapItemPhoto largestPhoto];
  v3 = [v2 url];

  return (NSURL *)v3;
}

- (NSString)photoID
{
  return (NSString *)[(GEOMapItemPhoto *)self->_geoMapItemPhoto uid];
}

- (BOOL)useGallery
{
  return [(GEOMapItemPhoto *)self->_geoMapItemPhoto useGallery];
}

- (int64_t)format
{
  [(GEOMapItemPhoto *)self->_geoMapItemPhoto sizeRatio];
  if (v2 < 1.0) {
    return 1;
  }
  else {
    return 2 * (v2 > 1.0);
  }
}

- (id)urlForBestPhotoForSize:(CGSize)a3
{
  v3 = -[GEOMapItemPhoto bestPhotoForSize:allowSmaller:](self->_geoMapItemPhoto, "bestPhotoForSize:allowSmaller:", 1, a3.width, a3.height);
  id v4 = [v3 url];

  return v4;
}

- (BOOL)displayFullScreenPhotoGallery
{
  return [(GEOMapItemPhoto *)self->_geoMapItemPhoto displayFullScreenPhotoGallery];
}

- (BOOL)needsObfuscationWhenRenderedInFullScreen
{
  return [(GEOMapItemPhoto *)self->_geoMapItemPhoto needsObfuscationWhenRenderedInFullScreen];
}

- (int64_t)photoStyle
{
  return self->_photoStyle;
}

- (_MKMapItemPhotosAttribution)attribution
{
  return self->_attribution;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (GEOMapItemPhoto)geoMapItemPhoto
{
  return self->_geoMapItemPhoto;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoMapItemPhoto, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_attribution, 0);
}

@end