@interface GEOPlaceTemplate
- (BOOL)hasRichData;
- (BOOL)supportsAreaHighlight;
- (GEOFeatureStyleAttributes)styleAttributes;
- (GEOMapItemIdentifier)mapItemIdentifier;
- (GEOMapItemPhoto)heroImage;
- (GEOPlaceLineTemplate)footerLine;
- (GEOPlaceLineTemplate)subtitleLine;
- (GEOPlaceTemplate)initWithIdentifier:(id)a3 supportsAreaHighlight:(BOOL)a4;
- (GEOPlaceTemplate)initWithPlaceTemplate:(id)a3 attributionMap:(id)a4;
- (NSString)placeName;
@end

@implementation GEOPlaceTemplate

- (GEOPlaceTemplate)initWithIdentifier:(id)a3 supportsAreaHighlight:(BOOL)a4
{
  id v6 = a3;
  v7 = objc_alloc_init(GEOPDTemplateData);
  -[GEOPDTemplateData setMapsId:]((uint64_t)v7, v6);

  if (v7)
  {
    *(_WORD *)&v7->_flags |= 0x200u;
    *(_WORD *)&v7->_flags |= 1u;
    v7->_areaHighlight = a4;
  }
  v8 = [(GEOPlaceTemplate *)self initWithPlaceTemplate:v7 attributionMap:0];

  return v8;
}

- (GEOPlaceTemplate)initWithPlaceTemplate:(id)a3 attributionMap:(id)a4
{
  v7 = (id *)a3;
  id v8 = a4;
  v9 = -[GEOPDTemplateData mapsId](v7);

  if (v9)
  {
    v19.receiver = self;
    v19.super_class = (Class)GEOPlaceTemplate;
    v10 = [(GEOPlaceTemplate *)&v19 init];
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_templateData, a3);
      id v12 = objc_alloc(MEMORY[0x1E4F1CAF0]);
      -[GEOPDTemplateData timezone]((id *)&v11->_templateData->super.super.isa);
      v13 = (id *)objc_claimAutoreleasedReturnValue();
      v14 = -[GEOTimezone identifier](v13);
      uint64_t v15 = [v12 initWithName:v14];
      timeZone = v11->_timeZone;
      v11->_timeZone = (NSTimeZone *)v15;

      objc_storeWeak((id *)&v11->_attributionMap, v8);
    }
    self = v11;
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (GEOMapItemIdentifier)mapItemIdentifier
{
  v3 = [GEOMapItemIdentifier alloc];
  v4 = -[GEOPDTemplateData mapsId]((id *)&self->_templateData->super.super.isa);
  v5 = [(GEOMapItemIdentifier *)v3 initWithMapsIdentifier:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_attributionMap);
  objc_storeStrong((id *)&self->_timeZone, 0);

  objc_storeStrong((id *)&self->_templateData, 0);
}

- (BOOL)supportsAreaHighlight
{
  templateData = self->_templateData;
  return templateData && templateData->_areaHighlight;
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  v3 = [GEOFeatureStyleAttributes alloc];
  v4 = -[GEOPDTemplateData poiIcon]((id *)&self->_templateData->super.super.isa);
  v5 = [(GEOFeatureStyleAttributes *)v3 initWithPlaceDataStyleAttributes:v4];

  return v5;
}

- (NSString)placeName
{
  return (NSString *)[(GEOPDTemplateData *)self->_templateData placeName];
}

- (GEOPlaceLineTemplate)subtitleLine
{
  v3 = [GEOPlaceLineTemplate alloc];
  v4 = -[GEOPDTemplateData subtitle]((id *)&self->_templateData->super.super.isa);
  timeZone = self->_timeZone;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attributionMap);
  v7 = [(GEOPlaceLineTemplate *)v3 initWithDataItem:v4 timeZone:timeZone attributionMap:WeakRetained];

  return v7;
}

- (GEOPlaceLineTemplate)footerLine
{
  v3 = [GEOPlaceLineTemplate alloc];
  v4 = -[GEOPDTemplateData footer]((id *)&self->_templateData->super.super.isa);
  timeZone = self->_timeZone;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attributionMap);
  v7 = [(GEOPlaceLineTemplate *)v3 initWithDataItem:v4 timeZone:timeZone attributionMap:WeakRetained];

  return v7;
}

- (GEOMapItemPhoto)heroImage
{
  v3 = [_GEOPlaceDataPhoto alloc];
  v4 = -[GEOPDTemplateData photo]((id *)&self->_templateData->super.super.isa);
  v5 = [(_GEOPlaceDataPhoto *)v3 initWithPhoto:v4];

  return (GEOMapItemPhoto *)v5;
}

- (BOOL)hasRichData
{
  return self->_hasRichData;
}

@end