@interface GEOPlaceExternalActionLinkQuickLinkParams
- (GEOPlaceExternalActionLinkQuickLinkParams)initWithQuickLinkParams:(id)a3;
- (NSString)appAdamId;
- (NSURL)url;
@end

@implementation GEOPlaceExternalActionLinkQuickLinkParams

- (GEOPlaceExternalActionLinkQuickLinkParams)initWithQuickLinkParams:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)GEOPlaceExternalActionLinkQuickLinkParams;
    v6 = [(GEOPlaceExternalActionLinkQuickLinkParams *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_quickLinkParams, a3);
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
  v3 = -[GEOPDQuickLinkActionDataParams url]((id *)&self->_quickLinkParams->super.super.isa);
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CB10]);
    v6 = -[GEOPDQuickLinkActionDataParams url]((id *)&self->_quickLinkParams->super.super.isa);
    v7 = (void *)[v5 initWithString:v6];
  }
  else
  {
    v7 = 0;
  }

  return (NSURL *)v7;
}

- (NSString)appAdamId
{
  return -[GEOPDQuickLinkActionDataParams appAdamId]((id *)&self->_quickLinkParams->super.super.isa);
}

- (void).cxx_destruct
{
}

@end