@interface _MKMapItemAttribution
+ (id)attributionFromEncyclopedicInfo:(id)a3;
- (BOOL)requiresAttributionInCallout;
- (BOOL)requiresAttributionInDeveloperPlaceCard;
- (BOOL)shouldOpenInAppStore;
- (NSArray)attributionApps;
- (NSArray)attributionURLs;
- (NSString)appAdamID;
- (NSString)captionDisplayName;
- (NSString)providerID;
- (NSString)providerName;
- (_MKMapItemAttribution)initWithGEOMapItemAttribution:(id)a3;
- (id)providerImageAtPath:(id)a3 scale:(double)a4 isTemplate:(BOOL)a5;
- (id)providerLogoImageForScale:(double)a3;
- (id)providerSnippetLogoImageForScale:(double)a3;
@end

@implementation _MKMapItemAttribution

+ (id)attributionFromEncyclopedicInfo:(id)a3
{
  id v3 = a3;
  v4 = [_MKMapItemAttribution alloc];
  v5 = [v3 encyclopedicAttribution];

  v6 = [(_MKMapItemAttribution *)v4 initWithGEOMapItemAttribution:v5];

  return v6;
}

- (_MKMapItemAttribution)initWithGEOMapItemAttribution:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_MKMapItemAttribution;
  v6 = [(_MKMapItemAttribution *)&v10 init];
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_storeStrong((id *)&v6->_geoAttribution, a3);
    v8 = v7;
  }

  return v8;
}

- (NSString)providerID
{
  return (NSString *)[(GEOMapItemAttribution *)self->_geoAttribution providerID];
}

- (NSString)providerName
{
  return (NSString *)[(GEOMapItemAttribution *)self->_geoAttribution providerName];
}

- (NSString)captionDisplayName
{
  return (NSString *)[(GEOMapItemAttribution *)self->_geoAttribution captionDisplayName];
}

- (NSArray)attributionURLs
{
  return (NSArray *)[(GEOMapItemAttribution *)self->_geoAttribution attributionURLs];
}

- (NSArray)attributionApps
{
  return (NSArray *)[(GEOMapItemAttribution *)self->_geoAttribution attributionApps];
}

- (BOOL)shouldOpenInAppStore
{
  return [(GEOMapItemAttribution *)self->_geoAttribution shouldOpenInAppStore];
}

- (id)providerImageAtPath:(id)a3 scale:(double)a4 isTemplate:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  if (v7)
  {
    v8 = +[_MKMapItemAttributionProviderLogoImageCache sharedInstance];
    v9 = [v8 imageForKey:v7];

    if (v9)
    {
      id v10 = v9;
    }
    else
    {
      v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v7];
      if (v11)
      {
        v12 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithData:v11 scale:a4];
        v13 = v12;
        if (v5)
        {
          uint64_t v14 = [v12 imageWithRenderingMode:2];

          v13 = (void *)v14;
        }
        v15 = +[_MKMapItemAttributionProviderLogoImageCache sharedInstance];
        [v15 setImage:v13 forKey:v7];

        id v10 = v13;
      }
      else
      {
        id v10 = 0;
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)providerLogoImageForScale:(double)a3
{
  uint64_t v5 = -[GEOMapItemAttribution providerLogoPathForScale:](self->_geoAttribution, "providerLogoPathForScale:");
  v6 = (void *)v5;
  if (a3 > 2.0 && v5 == 0) {
    -[_MKMapItemAttribution providerLogoImageForScale:](self, "providerLogoImageForScale:");
  }
  else {
  v8 = [(_MKMapItemAttribution *)self providerImageAtPath:v5 scale:0 isTemplate:a3];
  }

  return v8;
}

- (id)providerSnippetLogoImageForScale:(double)a3
{
  uint64_t v5 = -[GEOMapItemAttribution providerSnippetLogoPathForScale:](self->_geoAttribution, "providerSnippetLogoPathForScale:");
  v6 = (void *)v5;
  if (a3 > 2.0 && v5 == 0) {
    -[_MKMapItemAttribution providerSnippetLogoImageForScale:](self, "providerSnippetLogoImageForScale:");
  }
  else {
  v8 = [(_MKMapItemAttribution *)self providerImageAtPath:v5 scale:1 isTemplate:a3];
  }

  return v8;
}

- (BOOL)requiresAttributionInCallout
{
  return [(GEOMapItemAttribution *)self->_geoAttribution requiresAttributionInCallout];
}

- (BOOL)requiresAttributionInDeveloperPlaceCard
{
  return [(GEOMapItemAttribution *)self->_geoAttribution requiresAttributionInDeveloperPlaceCard];
}

- (NSString)appAdamID
{
  return (NSString *)[(GEOMapItemAttribution *)self->_geoAttribution appAdamID];
}

- (void).cxx_destruct
{
}

@end