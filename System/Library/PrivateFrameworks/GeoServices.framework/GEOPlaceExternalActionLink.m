@interface GEOPlaceExternalActionLink
- (GEOAttributionApp)attributionAppForMapsExtension;
- (GEOPlaceExternalActionLink)initWithLinkData:(id)a3 attributionMap:(id)a4;
- (GEOPlaceExternalActionLinkAppClipParams)appClipParams;
- (GEOPlaceExternalActionLinkExtensionParams)siriExtensionParams;
- (GEOPlaceExternalActionLinkQuickLinkParams)quickLinkParams;
- (GEOPlaceExternalActionWebLinkParams)webLinkParams;
- (GEOQuickLink)appClipRepresentedAsQuickLink;
- (GEOQuickLink)quickLink;
- (id)appClipUsingArtworkURL:(id)a3 title:(id)a4;
- (int)type;
@end

@implementation GEOPlaceExternalActionLink

- (GEOPlaceExternalActionLink)initWithLinkData:(id)a3 attributionMap:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7 && -[GEOPDLink linkType]((uint64_t)v7))
  {
    v13.receiver = self;
    v13.super_class = (Class)GEOPlaceExternalActionLink;
    v9 = [(GEOPlaceExternalActionLink *)&v13 init];
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_actionLink, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (int)type
{
  unsigned int v2 = -[GEOPDLink linkType]((uint64_t)self->_actionLink) - 1;
  if (v2 > 3) {
    return 0;
  }
  else {
    return dword_18A640B80[v2];
  }
}

- (GEOPlaceExternalActionLinkQuickLinkParams)quickLinkParams
{
  v3 = [GEOPlaceExternalActionLinkQuickLinkParams alloc];
  v4 = -[GEOPDLink quickLinkParams]((id *)&self->_actionLink->super.super.isa);
  v5 = [(GEOPlaceExternalActionLinkQuickLinkParams *)v3 initWithQuickLinkParams:v4];

  return v5;
}

- (GEOPlaceExternalActionLinkAppClipParams)appClipParams
{
  v3 = [GEOPlaceExternalActionLinkAppClipParams alloc];
  v4 = -[GEOPDLink appClipParams]((id *)&self->_actionLink->super.super.isa);
  v5 = [(GEOPlaceExternalActionLinkAppClipParams *)v3 initWithAppClipParams:v4];

  return v5;
}

- (GEOPlaceExternalActionLinkExtensionParams)siriExtensionParams
{
  v3 = [GEOPlaceExternalActionLinkExtensionParams alloc];
  v4 = -[GEOPDLink extensionParams]((id *)&self->_actionLink->super.super.isa);
  v5 = [(GEOPlaceExternalActionLinkExtensionParams *)v3 initWithExtensionParams:v4 attributionMap:self->_attributionMap];

  return v5;
}

- (GEOPlaceExternalActionWebLinkParams)webLinkParams
{
  v3 = [GEOPlaceExternalActionWebLinkParams alloc];
  v4 = -[GEOPDLink webLinkParams]((id *)&self->_actionLink->super.super.isa);
  v5 = [(GEOPlaceExternalActionWebLinkParams *)v3 initWithWebLinkParams:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionMap, 0);

  objc_storeStrong((id *)&self->_actionLink, 0);
}

- (GEOQuickLink)quickLink
{
  v3 = [(GEOPlaceExternalActionLink *)self quickLinkParams];

  if (v3)
  {
    v4 = objc_alloc_init(GEOPDQuickLinkItem);
    v5 = [(GEOPlaceExternalActionLink *)self quickLinkParams];
    v6 = [v5 url];
    id v7 = [v6 absoluteString];
    -[GEOPDQuickLinkItem setUrl:]((uint64_t)v4, v7);

    id v8 = [(GEOPlaceExternalActionLink *)self quickLinkParams];
    v9 = [v8 appAdamId];
    -[GEOPDQuickLinkItem setAppAdamId:]((uint64_t)v4, v9);

    if (v4)
    {
      *(_WORD *)&v4->_flags |= 0x100u;
      *(_WORD *)&v4->_flags |= 1u;
      v4->_linkType = 1;
    }
    v10 = [[GEOQuickLink alloc] initWithQuickLink:v4];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (GEOQuickLink)appClipRepresentedAsQuickLink
{
  v3 = [(GEOPlaceExternalActionLink *)self appClipParams];

  if (v3)
  {
    v4 = objc_alloc_init(GEOPDQuickLinkItem);
    v5 = [(GEOPlaceExternalActionLink *)self appClipParams];
    v6 = [v5 url];
    id v7 = [v6 absoluteString];
    -[GEOPDQuickLinkItem setUrl:]((uint64_t)v4, v7);

    id v8 = [(GEOPlaceExternalActionLink *)self appClipParams];
    v9 = [v8 bundleId];
    -[GEOPDQuickLinkItem setBundleId:]((uint64_t)v4, v9);

    if (v4)
    {
      *(_WORD *)&v4->_flags |= 0x100u;
      *(_WORD *)&v4->_flags |= 1u;
      v4->_linkType = 2;
    }
    v10 = [[GEOQuickLink alloc] initWithQuickLink:v4];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)appClipUsingArtworkURL:(id)a3 title:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(GEOPlaceExternalActionLink *)self appClipParams];

  if (v8)
  {
    v9 = [GEOAppStoreAppClip alloc];
    v10 = [(GEOPlaceExternalActionLink *)self appClipParams];
    v11 = [v10 bundleId];
    v12 = [(GEOPlaceExternalActionLink *)self appClipParams];
    objc_super v13 = [v12 url];
    v14 = [(GEOAppStoreAppClip *)v9 initWithBundleID:v11 title:v7 subtitle:&stru_1ED51F370 appShortName:&stru_1ED51F370 appClipURL:v13 artworkURL:v6 providerName:&stru_1ED51F370];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (GEOAttributionApp)attributionAppForMapsExtension
{
  v3 = [(GEOPlaceExternalActionLink *)self siriExtensionParams];

  if (v3)
  {
    v4 = [(GEOPlaceExternalActionLink *)self siriExtensionParams];
    v5 = [v4 attributionApp];
  }
  else
  {
    v5 = 0;
  }

  return (GEOAttributionApp *)v5;
}

@end