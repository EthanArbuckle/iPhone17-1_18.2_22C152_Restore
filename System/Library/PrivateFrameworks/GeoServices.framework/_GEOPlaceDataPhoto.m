@interface _GEOPlaceDataPhoto
- (BOOL)businessProvided;
- (BOOL)displayFullScreenPhotoGallery;
- (BOOL)highQuality;
- (BOOL)isBackgroundJoeColorCurated;
- (BOOL)needsObfuscationWhenRenderedInFullScreen;
- (BOOL)useGallery;
- (GEOMapItemPhotosAttribution)attribution;
- (NSDate)dateCreated;
- (NSString)author;
- (NSString)backgroundJoeColor;
- (NSString)caption;
- (NSString)licenseDescription;
- (NSString)uid;
- (NSURL)licenseURL;
- (_GEOPlaceDataPhoto)initWithCaptionedPhoto:(id)a3;
- (_GEOPlaceDataPhoto)initWithCaptionedPhoto:(id)a3 attribution:(id)a4;
- (_GEOPlaceDataPhoto)initWithPhoto:(id)a3;
- (_GEOPlaceDataPhoto)initWithPhoto:(id)a3 attribution:(id)a4;
- (double)sizeRatio;
- (id)bestPhotoForFrameSize:(CGSize)a3 displayScale:(double)a4 options:(id)a5;
- (id)bestPhotoForSize:(CGSize)a3 allowSmaller:(BOOL)a4;
- (id)bestPhotoForSize:(CGSize)a3 options:(id)a4;
- (id)largestPhoto;
@end

@implementation _GEOPlaceDataPhoto

- (id)bestPhotoForSize:(CGSize)a3 allowSmaller:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = +[GEOMapItemPhotoOptions defaultPhotoOptionsWithAllowSmaller:a4];
  v8 = -[_GEOPlaceDataPhoto bestPhotoForSize:options:](self, "bestPhotoForSize:options:", v7, width, height);

  return v8;
}

- (id)bestPhotoForSize:(CGSize)a3 options:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  if (v7)
  {
    v8 = -[GEOPhotoInfoSource bestPhotoForSize:options:](self->_photoInfoSource, "bestPhotoForSize:options:", v7, width, height);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: options != ((void *)0)", v10, 2u);
    }
    v8 = 0;
  }

  return v8;
}

- (_GEOPlaceDataPhoto)initWithCaptionedPhoto:(id)a3 attribution:(id)a4
{
  id v7 = a4;
  v8 = [(_GEOPlaceDataPhoto *)self initWithCaptionedPhoto:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_attribution, a4);
    v10 = v9;
  }

  return v9;
}

- (_GEOPlaceDataPhoto)initWithCaptionedPhoto:(id)a3
{
  v5 = (id *)a3;
  v15.receiver = self;
  v15.super_class = (Class)_GEOPlaceDataPhoto;
  v6 = [(_GEOPlaceDataPhoto *)&v15 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_captionedPhoto, a3);
    v8 = [GEOPhotoInfoSource alloc];
    -[GEOPDCaptionedPhoto photo](v5);
    v9 = (id *)objc_claimAutoreleasedReturnValue();
    v10 = -[GEOPDPhoto photoVersions](v9);
    uint64_t v11 = [(GEOPhotoInfoSource *)v8 initWithPhotoContent:v10];
    photoInfoSource = v7->_photoInfoSource;
    v7->_photoInfoSource = (GEOPhotoInfoSource *)v11;

    v13 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_photoInfoSource, 0);
  objc_storeStrong((id *)&self->_captionedPhoto, 0);

  objc_storeStrong((id *)&self->_photo, 0);
}

- (NSString)backgroundJoeColor
{
  -[GEOPDCaptionedPhoto joeColor]((id *)&self->_captionedPhoto->super.super.isa);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = -[GEOPDJoeColor backgroundColor](v2);

  return (NSString *)v3;
}

- (_GEOPlaceDataPhoto)initWithPhoto:(id)a3 attribution:(id)a4
{
  id v7 = a4;
  v8 = [(_GEOPlaceDataPhoto *)self initWithPhoto:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_attribution, a4);
    v10 = v9;
  }

  return v9;
}

- (_GEOPlaceDataPhoto)initWithPhoto:(id)a3
{
  v5 = (id *)a3;
  v14.receiver = self;
  v14.super_class = (Class)_GEOPlaceDataPhoto;
  v6 = [(_GEOPlaceDataPhoto *)&v14 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photo, a3);
    v8 = [GEOPhotoInfoSource alloc];
    v9 = -[GEOPDPhoto photoVersions](v5);
    uint64_t v10 = [(GEOPhotoInfoSource *)v8 initWithPhotoContent:v9];
    photoInfoSource = v7->_photoInfoSource;
    v7->_photoInfoSource = (GEOPhotoInfoSource *)v10;

    v12 = v7;
  }

  return v7;
}

- (NSString)author
{
  return -[GEOPDCaptionedPhoto author]((id *)&self->_captionedPhoto->super.super.isa);
}

- (NSString)caption
{
  return -[GEOPDCaptionedPhoto caption]((id *)&self->_captionedPhoto->super.super.isa);
}

- (NSString)licenseDescription
{
  return -[GEOPDCaptionedPhoto licenseDescription]((id *)&self->_captionedPhoto->super.super.isa);
}

- (NSURL)licenseURL
{
  captionedPhoto = self->_captionedPhoto;
  if (captionedPhoto
    && (-[GEOPDCaptionedPhoto _readLicenseUrl]((uint64_t)self->_captionedPhoto), captionedPhoto->_licenseUrl))
  {
    v4 = (void *)MEMORY[0x1E4F1CB10];
    v5 = -[GEOPDCaptionedPhoto licenseUrl]((id *)&self->_captionedPhoto->super.super.isa);
    v6 = [v4 URLWithString:v5];
  }
  else
  {
    v6 = 0;
  }

  return (NSURL *)v6;
}

- (NSDate)dateCreated
{
  captionedPhoto = self->_captionedPhoto;
  if (captionedPhoto && (*(_WORD *)&captionedPhoto->_flags & 1) != 0)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    v6 = self->_captionedPhoto;
    if (v6) {
      double dateAdded = v6->_dateAdded;
    }
    else {
      double dateAdded = 0.0;
    }
    v3 = (void *)[v5 initWithTimeIntervalSinceReferenceDate:dateAdded];
  }
  else
  {
    v3 = 0;
  }

  return (NSDate *)v3;
}

- (BOOL)displayFullScreenPhotoGallery
{
  captionedPhoto = self->_captionedPhoto;
  if (!captionedPhoto) {
    return 0;
  }
  if (captionedPhoto->_displayFullScreenPhotoGallery) {
    return 1;
  }
  return captionedPhoto->_displayFullPhotoInline;
}

- (BOOL)useGallery
{
  captionedPhoto = self->_captionedPhoto;
  return captionedPhoto && (*(_WORD *)&captionedPhoto->_flags & 0x40) != 0 && captionedPhoto->_useGallery;
}

- (NSString)uid
{
  captionedPhoto = self->_captionedPhoto;
  if (captionedPhoto)
  {
    -[GEOPDCaptionedPhoto photo]((id *)&captionedPhoto->super.super.isa);
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    id v5 = -[GEOPDPhoto photoId](v4);
  }
  else
  {
    id v5 = -[GEOPDPhoto photoId]((id *)&self->_photo->super.super.isa);
  }

  return (NSString *)v5;
}

- (id)largestPhoto
{
  return [(GEOPhotoInfoSource *)self->_photoInfoSource largestPhoto];
}

- (id)bestPhotoForFrameSize:(CGSize)a3 displayScale:(double)a4 options:(id)a5
{
  double v5 = fmax(a4, 1.0);
  return -[_GEOPlaceDataPhoto bestPhotoForSize:options:](self, "bestPhotoForSize:options:", a5, a3.width * v5, a3.height * v5);
}

- (double)sizeRatio
{
  [(GEOPhotoInfoSource *)self->_photoInfoSource sizeRatio];
  return result;
}

- (BOOL)highQuality
{
  captionedPhoto = self->_captionedPhoto;
  return captionedPhoto && (*(_WORD *)&captionedPhoto->_flags & 8) != 0 && captionedPhoto->_highQuality;
}

- (BOOL)businessProvided
{
  captionedPhoto = self->_captionedPhoto;
  return captionedPhoto && (*(_WORD *)&captionedPhoto->_flags & 0x10) != 0 && captionedPhoto->_isBusinessOwned;
}

- (BOOL)isBackgroundJoeColorCurated
{
  -[GEOPDCaptionedPhoto joeColor]((id *)&self->_captionedPhoto->super.super.isa);
  v2 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (v2) {
    BOOL v3 = v2[76] != 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (GEOMapItemPhotosAttribution)attribution
{
  return self->_attribution;
}

- (BOOL)needsObfuscationWhenRenderedInFullScreen
{
  captionedPhoto = self->_captionedPhoto;
  return captionedPhoto && (*(_WORD *)&captionedPhoto->_flags & 0x20) != 0 && captionedPhoto->_obfuscateFullScreenPhoto;
}

@end