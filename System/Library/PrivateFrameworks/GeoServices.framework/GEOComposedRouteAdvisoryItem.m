@interface GEOComposedRouteAdvisoryItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isNonTransitIncident;
- (GEOAdvisoryCardAction)cardAction;
- (GEOComposedRouteAdvisoryItem)initWithAdvisoryItem:(id)a3 routeIncidents:(id)a4 fallbackIcon:(id)a5;
- (GEOComposedRouteAdvisoryItem)initWithAdvisoryItem:(id)a3 transitIncidents:(id)a4 fallbackIcon:(id)a5;
- (GEOComposedRouteAdvisoryItem)initWithCoder:(id)a3;
- (GEOComposedString)attributionString;
- (GEOComposedString)dateOfLastUpdateString;
- (GEOComposedString)subtitleString;
- (GEOComposedString)titleString;
- (GEOPBTransitArtwork)artwork;
- (GEOServerFormattedString)attribution;
- (GEOServerFormattedString)dateOfLastUpdateDescription;
- (GEOServerFormattedString)subtitle;
- (GEOServerFormattedString)title;
- (NSArray)analyticsMessageValues;
- (NSArray)details;
- (NSDate)dateOfLastUpdate;
- (id)_detailsForIncident:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOComposedRouteAdvisoryItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOServerFormattedString)attribution
{
  return self->_attribution;
}

- (GEOComposedRouteAdvisoryItem)initWithAdvisoryItem:(id)a3 routeIncidents:(id)a4 fallbackIcon:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v78.receiver = self;
  v78.super_class = (Class)GEOComposedRouteAdvisoryItem;
  v11 = [(GEOComposedRouteAdvisoryItem *)&v78 init];
  if (!v11) {
    goto LABEL_18;
  }
  if (([v8 hasAdvisoryCard] & 1) == 0 && (objc_msgSend(v8, "hasIncidentIndex") & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_23;
    }
    *(_WORD *)v77 = 0;
    v75 = MEMORY[0x1E4F14500];
    v76 = "Assertion failed: advisoryItem.hasAdvisoryCard || advisoryItem.hasIncidentIndex";
    goto LABEL_25;
  }
  if (![v8 hasAdvisoryCard])
  {
    unint64_t v45 = [v9 count];
    if (v45 >= [v8 incidentIndex])
    {
      v12 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v8, "incidentIndex"));
      v46 = [v12 restrictionInfo];
      v47 = [v46 titleString];
      uint64_t v48 = [v47 copy];
      title = v11->_title;
      v11->_title = (GEOServerFormattedString *)v48;

      v50 = [GEOComposedString alloc];
      v51 = [v12 restrictionInfo];
      v52 = [v51 titleString];
      uint64_t v53 = [(GEOComposedString *)v50 initWithGeoFormattedString:v52];
      titleString = v11->_titleString;
      v11->_titleString = (GEOComposedString *)v53;

      v55 = [v12 restrictionInfo];
      v56 = [v55 subTitleString];
      uint64_t v57 = [v56 copy];
      subtitle = v11->_subtitle;
      v11->_subtitle = (GEOServerFormattedString *)v57;

      v59 = [GEOComposedString alloc];
      v60 = [v12 restrictionInfo];
      v61 = [v60 subTitleString];
      uint64_t v62 = [(GEOComposedString *)v59 initWithGeoFormattedString:v61];
      subtitleString = v11->_subtitleString;
      v11->_subtitleString = (GEOComposedString *)v62;

      if ([v12 hasUpdateTime])
      {
        uint64_t v64 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v12, "updateTime"));
        dateOfLastUpdate = v11->_dateOfLastUpdate;
        v11->_dateOfLastUpdate = (NSDate *)v64;
      }
      else
      {
        dateOfLastUpdate = v11->_dateOfLastUpdate;
        v11->_dateOfLastUpdate = 0;
      }

      uint64_t v66 = [v12 artwork];
      v67 = (void *)v66;
      if (v66) {
        v68 = (void *)v66;
      }
      else {
        v68 = v10;
      }
      objc_storeStrong((id *)&v11->_artwork, v68);

      v11->_isNonTransitIncident = 1;
      uint64_t v69 = [(GEOComposedRouteAdvisoryItem *)v11 _detailsForIncident:v12];
      details = v11->_details;
      v11->_details = (NSArray *)v69;
      goto LABEL_17;
    }
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
LABEL_23:
      v73 = 0;
      goto LABEL_19;
    }
    *(_WORD *)v77 = 0;
    v75 = MEMORY[0x1E4F14500];
    v76 = "Assertion failed: incidents.count >= advisoryItem.incidentIndex";
LABEL_25:
    _os_log_fault_impl(&dword_188D96000, v75, OS_LOG_TYPE_FAULT, v76, v77, 2u);
    goto LABEL_23;
  }
  v12 = [v8 advisoryCard];
  v13 = [v12 title];
  uint64_t v14 = [v13 copy];
  v15 = v11->_title;
  v11->_title = (GEOServerFormattedString *)v14;

  v16 = [GEOComposedString alloc];
  v17 = [v12 title];
  uint64_t v18 = [(GEOComposedString *)v16 initWithGeoFormattedString:v17];
  v19 = v11->_titleString;
  v11->_titleString = (GEOComposedString *)v18;

  v20 = [v12 details];
  uint64_t v21 = [v20 copy];
  v22 = v11->_subtitle;
  v11->_subtitle = (GEOServerFormattedString *)v21;

  v23 = [GEOComposedString alloc];
  v24 = [v12 details];
  uint64_t v25 = [(GEOComposedString *)v23 initWithGeoFormattedString:v24];
  v26 = v11->_subtitleString;
  v11->_subtitleString = (GEOComposedString *)v25;

  uint64_t v27 = [v12 artworkOverride];
  v28 = (void *)v27;
  if (v27) {
    v29 = (void *)v27;
  }
  else {
    v29 = v10;
  }
  objc_storeStrong((id *)&v11->_artwork, v29);

  uint64_t v30 = [v12 timeString];
  dateOfLastUpdateDescription = v11->_dateOfLastUpdateDescription;
  v11->_dateOfLastUpdateDescription = (GEOServerFormattedString *)v30;

  v32 = [GEOComposedString alloc];
  v33 = [v12 timeString];
  uint64_t v34 = [(GEOComposedString *)v32 initWithGeoFormattedString:v33];
  dateOfLastUpdateString = v11->_dateOfLastUpdateString;
  v11->_dateOfLastUpdateString = (GEOComposedString *)v34;

  v36 = [v12 metadata];
  uint64_t v37 = [v36 copy];
  attribution = v11->_attribution;
  v11->_attribution = (GEOServerFormattedString *)v37;

  v39 = [GEOComposedString alloc];
  v40 = [v12 metadata];
  uint64_t v41 = [(GEOComposedString *)v39 initWithGeoFormattedString:v40];
  attributionString = v11->_attributionString;
  v11->_attributionString = (GEOComposedString *)v41;

  uint64_t v43 = [v12 action];
  details = v11->_cardAction;
  v11->_cardAction = (GEOAdvisoryCardAction *)v43;
LABEL_17:

  v70 = [v8 analyticsMessageValues];
  uint64_t v71 = [v70 copy];
  analyticsMessageValues = v11->_analyticsMessageValues;
  v11->_analyticsMessageValues = (NSArray *)v71;

LABEL_18:
  v73 = v11;
LABEL_19:

  return v73;
}

- (GEOComposedRouteAdvisoryItem)initWithAdvisoryItem:(id)a3 transitIncidents:(id)a4 fallbackIcon:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 hasAdvisoryCard])
  {
    v11 = [(GEOComposedRouteAdvisoryItem *)self initWithAdvisoryItem:v8 routeIncidents:0 fallbackIcon:v10];
LABEL_11:
    v12 = v11;
    v38 = v11;
    goto LABEL_12;
  }
  v41.receiver = self;
  v41.super_class = (Class)GEOComposedRouteAdvisoryItem;
  v12 = [(GEOComposedRouteAdvisoryItem *)&v41 init];
  if (!v12)
  {
LABEL_10:
    v11 = v12;
    goto LABEL_11;
  }
  if ([v8 hasTransitIncidentIndex])
  {
    unint64_t v13 = [v9 count];
    if (v13 >= [v8 transitIncidentIndex])
    {
      objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v8, "transitIncidentIndex"));
      uint64_t v14 = (id *)objc_claimAutoreleasedReturnValue();
      v15 = [[_GEOTransitIncident alloc] initWithIncident:v14];
      v16 = [(_GEOTransitIncident *)v15 title];
      uint64_t v17 = objc_msgSend(v16, "_geo_formattedString");
      title = v12->_title;
      v12->_title = (GEOServerFormattedString *)v17;

      v19 = [GEOComposedString alloc];
      v20 = [(_GEOTransitIncident *)v15 title];
      uint64_t v21 = [(GEOComposedString *)v19 initWithString:v20];
      titleString = v12->_titleString;
      v12->_titleString = (GEOComposedString *)v21;

      v23 = [(_GEOTransitIncident *)v15 fullDescription];
      uint64_t v24 = objc_msgSend(v23, "_geo_formattedString");
      subtitle = v12->_subtitle;
      v12->_subtitle = (GEOServerFormattedString *)v24;

      v26 = [GEOComposedString alloc];
      uint64_t v27 = [(_GEOTransitIncident *)v15 fullDescription];
      uint64_t v28 = [(GEOComposedString *)v26 initWithString:v27];
      subtitleString = v12->_subtitleString;
      v12->_subtitleString = (GEOComposedString *)v28;

      uint64_t v30 = [(_GEOTransitIncident *)v15 lastUpdated];
      dateOfLastUpdate = v12->_dateOfLastUpdate;
      v12->_dateOfLastUpdate = (NSDate *)v30;

      uint64_t v32 = -[GEOPBTransitIncident incidentTypeArtwork](v14);
      v33 = (void *)v32;
      if (v32) {
        uint64_t v34 = (void *)v32;
      }
      else {
        uint64_t v34 = v10;
      }
      objc_storeStrong((id *)&v12->_artwork, v34);

      v35 = [v8 analyticsMessageValues];
      uint64_t v36 = [v35 copy];
      analyticsMessageValues = v12->_analyticsMessageValues;
      v12->_analyticsMessageValues = (NSArray *)v36;

      goto LABEL_10;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v40 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: advisoryItem.hasTransitIncidentIndex && transitIncidents.count >= advisoryItem.transitIncidentIndex", v40, 2u);
  }
  v38 = 0;
LABEL_12:

  return v38;
}

- (id)_detailsForIncident:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 restrictionInfo];
  v5 = [v4 restrictionDetails];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F1CA48] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = objc_msgSend(v3, "restrictionInfo", 0);
    id v9 = [v8 restrictionDetails];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [[GEOComposedRouteAdvisoryItemDetail alloc] initWithRestrictionDetails:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          if (v14) {
            [v7 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    v15 = (void *)[v7 copy];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (GEOComposedRouteAdvisoryItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)GEOComposedRouteAdvisoryItem;
  v5 = [(GEOComposedRouteAdvisoryItem *)&v33 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_title"];
    title = v5->_title;
    v5->_title = (GEOServerFormattedString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_titleString"];
    titleString = v5->_titleString;
    v5->_titleString = (GEOComposedString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_subtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (GEOServerFormattedString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_subtitleString"];
    subtitleString = v5->_subtitleString;
    v5->_subtitleString = (GEOComposedString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_dateOfLastUpdate"];
    dateOfLastUpdate = v5->_dateOfLastUpdate;
    v5->_dateOfLastUpdate = (NSDate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_dateOfLastUpdateDescription"];
    dateOfLastUpdateDescription = v5->_dateOfLastUpdateDescription;
    v5->_dateOfLastUpdateDescription = (GEOServerFormattedString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_dateOfLastUpdateString"];
    dateOfLastUpdateString = v5->_dateOfLastUpdateString;
    v5->_dateOfLastUpdateString = (GEOComposedString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_artwork"];
    artwork = v5->_artwork;
    v5->_artwork = (GEOPBTransitArtwork *)v20;

    uint64_t v22 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_details"];
    details = v5->_details;
    v5->_details = (NSArray *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_attribution"];
    attribution = v5->_attribution;
    v5->_attribution = (GEOServerFormattedString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_attributionString"];
    attributionString = v5->_attributionString;
    v5->_attributionString = (GEOComposedString *)v26;

    v5->_isNonTransitIncident = [v4 decodeBoolForKey:@"_isNonTransitIncident"];
    uint64_t v28 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_analyticsMessageValues"];
    analyticsMessageValues = v5->_analyticsMessageValues;
    v5->_analyticsMessageValues = (NSArray *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_cardAction"];
    cardAction = v5->_cardAction;
    v5->_cardAction = (GEOAdvisoryCardAction *)v30;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"_title"];
  [v5 encodeObject:self->_titleString forKey:@"_titleString"];
  [v5 encodeObject:self->_subtitle forKey:@"_subtitle"];
  [v5 encodeObject:self->_subtitleString forKey:@"_subtitleString"];
  [v5 encodeObject:self->_dateOfLastUpdate forKey:@"_dateOfLastUpdate"];
  [v5 encodeObject:self->_dateOfLastUpdateDescription forKey:@"_dateOfLastUpdateDescription"];
  [v5 encodeObject:self->_dateOfLastUpdateString forKey:@"_dateOfLastUpdateString"];
  [v5 encodeObject:self->_artwork forKey:@"_artwork"];
  [v5 encodeObject:self->_details forKey:@"_details"];
  [v5 encodeObject:self->_attribution forKey:@"_attribution"];
  [v5 encodeObject:self->_attributionString forKey:@"_attributionString"];
  [v5 encodeBool:self->_isNonTransitIncident forKey:@"_isNonTransitIncident"];
  [v5 encodeObject:self->_analyticsMessageValues forKey:@"_analyticsMessageValues"];
  [v5 encodeObject:self->_cardAction forKey:@"_cardAction"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 24), self->_title);
  uint64_t v5 = [(GEOComposedString *)self->_titleString copy];
  uint64_t v6 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v5;

  objc_storeStrong((id *)(v4 + 40), self->_subtitle);
  uint64_t v7 = [(GEOComposedString *)self->_subtitleString copy];
  uint64_t v8 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = v7;

  uint64_t v9 = [(NSDate *)self->_dateOfLastUpdate copy];
  uint64_t v10 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v9;

  objc_storeStrong((id *)(v4 + 64), self->_dateOfLastUpdateDescription);
  uint64_t v11 = [(GEOComposedString *)self->_dateOfLastUpdateString copy];
  uint64_t v12 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = v11;

  objc_storeStrong((id *)(v4 + 16), self->_artwork);
  uint64_t v13 = [(NSArray *)self->_details copy];
  uint64_t v14 = *(void **)(v4 + 80);
  *(void *)(v4 + 80) = v13;

  objc_storeStrong((id *)(v4 + 88), self->_attribution);
  uint64_t v15 = [(GEOComposedString *)self->_attributionString copy];
  uint64_t v16 = *(void **)(v4 + 96);
  *(void *)(v4 + 96) = v15;

  *(unsigned char *)(v4 + 8) = self->_isNonTransitIncident;
  objc_storeStrong((id *)(v4 + 112), self->_cardAction);
  return (id)v4;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@ title: %@, isNonTransitIncident: %ld, subtitle: %@, dateOfLastUpdate: %@, dateOfLastUpdateDescription: %@, artwork: %@, details: %@, attribution: %@, cardAction: %@>", v5, self->_titleString, self->_isNonTransitIncident, self->_subtitleString, self->_dateOfLastUpdate, self->_dateOfLastUpdateString, self->_artwork, self->_details, self->_attributionString, self->_cardAction];

  return v6;
}

- (GEOPBTransitArtwork)artwork
{
  return self->_artwork;
}

- (GEOServerFormattedString)title
{
  return self->_title;
}

- (GEOComposedString)titleString
{
  return self->_titleString;
}

- (GEOServerFormattedString)subtitle
{
  return self->_subtitle;
}

- (GEOComposedString)subtitleString
{
  return self->_subtitleString;
}

- (NSDate)dateOfLastUpdate
{
  return self->_dateOfLastUpdate;
}

- (GEOServerFormattedString)dateOfLastUpdateDescription
{
  return self->_dateOfLastUpdateDescription;
}

- (GEOComposedString)dateOfLastUpdateString
{
  return self->_dateOfLastUpdateString;
}

- (NSArray)details
{
  return self->_details;
}

- (GEOComposedString)attributionString
{
  return self->_attributionString;
}

- (BOOL)isNonTransitIncident
{
  return self->_isNonTransitIncident;
}

- (NSArray)analyticsMessageValues
{
  return self->_analyticsMessageValues;
}

- (GEOAdvisoryCardAction)cardAction
{
  return self->_cardAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardAction, 0);
  objc_storeStrong((id *)&self->_analyticsMessageValues, 0);
  objc_storeStrong((id *)&self->_attributionString, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_dateOfLastUpdateString, 0);
  objc_storeStrong((id *)&self->_dateOfLastUpdateDescription, 0);
  objc_storeStrong((id *)&self->_dateOfLastUpdate, 0);
  objc_storeStrong((id *)&self->_subtitleString, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_artwork, 0);
}

@end