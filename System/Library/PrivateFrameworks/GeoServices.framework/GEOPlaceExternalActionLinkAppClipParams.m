@interface GEOPlaceExternalActionLinkAppClipParams
- (GEOPlaceExternalActionLinkAppClipParams)initWithAppClipParams:(id)a3;
- (NSString)bundleId;
- (NSURL)url;
@end

@implementation GEOPlaceExternalActionLinkAppClipParams

- (GEOPlaceExternalActionLinkAppClipParams)initWithAppClipParams:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)GEOPlaceExternalActionLinkAppClipParams;
    v6 = [(GEOPlaceExternalActionLinkAppClipParams *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_appClipParams, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSURL)url
{
  v3 = -[GEOPDAppClipParams url]((id *)&self->_appClipParams->super.super.isa);
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CB10]);
    v6 = -[GEOPDAppClipParams url]((id *)&self->_appClipParams->super.super.isa);
    v7 = (void *)[v5 initWithString:v6];
  }
  else
  {
    v7 = 0;
  }

  return (NSURL *)v7;
}

- (NSString)bundleId
{
  return -[GEOPDAppClipParams bundleId]((id *)&self->_appClipParams->super.super.isa);
}

- (void).cxx_destruct
{
}

@end