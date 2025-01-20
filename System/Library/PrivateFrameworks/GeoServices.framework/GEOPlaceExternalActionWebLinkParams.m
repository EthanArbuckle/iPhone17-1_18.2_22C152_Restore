@interface GEOPlaceExternalActionWebLinkParams
- (BOOL)supportsEmbeddedWebBrowser;
- (GEOMapItemPhoto)icon;
- (GEOPlaceExternalActionWebLinkParams)initWithWebLinkParams:(id)a3;
- (NSString)displayName;
- (NSURL)url;
@end

@implementation GEOPlaceExternalActionWebLinkParams

- (GEOPlaceExternalActionWebLinkParams)initWithWebLinkParams:(id)a3
{
  v5 = (id *)a3;
  v6 = v5;
  if (v5 && (-[GEOPDWebLinkParams url](v5), v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    v12.receiver = self;
    v12.super_class = (Class)GEOPlaceExternalActionWebLinkParams;
    v8 = [(GEOPlaceExternalActionWebLinkParams *)&v12 init];
    v9 = v8;
    if (v8) {
      objc_storeStrong((id *)&v8->_params, a3);
    }
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)displayName
{
  return -[GEOPDWebLinkParams title]((id *)&self->_params->super.super.isa);
}

- (NSURL)url
{
  url = self->_url;
  if (!url)
  {
    v4 = (void *)MEMORY[0x1E4F1CB10];
    v5 = -[GEOPDWebLinkParams url]((id *)&self->_params->super.super.isa);
    v6 = [v4 URLWithString:v5];
    v7 = self->_url;
    self->_url = v6;

    url = self->_url;
  }

  return url;
}

- (GEOMapItemPhoto)icon
{
  -[GEOPDWebLinkParams icon]((id *)&self->_params->super.super.isa);
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  v4 = -[GEOPDIcon image](v3);

  if (v4)
  {
    photo = self->_photo;
    if (!photo)
    {
      v6 = [_GEOPlaceDataPhoto alloc];
      -[GEOPDWebLinkParams icon]((id *)&self->_params->super.super.isa);
      v7 = (id *)objc_claimAutoreleasedReturnValue();
      v8 = -[GEOPDIcon image](v7);
      v9 = [(_GEOPlaceDataPhoto *)v6 initWithPhoto:v8];
      v10 = self->_photo;
      self->_photo = v9;

      photo = self->_photo;
    }
    v11 = photo;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)supportsEmbeddedWebBrowser
{
  params = self->_params;
  return params && params->_supportsEmbeddedWebBrowser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_params, 0);
}

@end