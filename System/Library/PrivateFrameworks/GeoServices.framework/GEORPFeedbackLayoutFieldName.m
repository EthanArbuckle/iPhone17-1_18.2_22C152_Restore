@interface GEORPFeedbackLayoutFieldName
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAddressFieldName;
- (BOOL)hasCuratedCollectionFieldName;
- (BOOL)hasGroundviewFieldName;
- (BOOL)hasIncidentField;
- (BOOL)hasIncidentType;
- (BOOL)hasOtherFieldName;
- (BOOL)hasPoiFieldName;
- (BOOL)hasPoiImageCorrectionType;
- (BOOL)hasWorkflowFieldName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackLayoutFieldName)initWithDictionary:(id)a3;
- (GEORPFeedbackLayoutFieldName)initWithJSON:(id)a3;
- (GEORPIncidentField)incidentField;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)addressFieldNameAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)curatedCollectionFieldNameAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)groundviewFieldNameAsString:(int)a3;
- (id)incidentTypeAsString:(int)a3;
- (id)jsonRepresentation;
- (id)otherFieldNameAsString:(int)a3;
- (id)poiFieldNameAsString:(int)a3;
- (id)poiImageCorrectionTypeAsString:(int)a3;
- (id)workflowFieldNameAsString:(int)a3;
- (int)StringAsAddressFieldName:(id)a3;
- (int)StringAsCuratedCollectionFieldName:(id)a3;
- (int)StringAsGroundviewFieldName:(id)a3;
- (int)StringAsIncidentType:(id)a3;
- (int)StringAsOtherFieldName:(id)a3;
- (int)StringAsPoiFieldName:(id)a3;
- (int)StringAsPoiImageCorrectionType:(id)a3;
- (int)StringAsWorkflowFieldName:(id)a3;
- (int)addressFieldName;
- (int)curatedCollectionFieldName;
- (int)groundviewFieldName;
- (int)incidentType;
- (int)otherFieldName;
- (int)poiFieldName;
- (int)poiImageCorrectionType;
- (int)workflowFieldName;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAddressFieldName:(int)a3;
- (void)setCuratedCollectionFieldName:(int)a3;
- (void)setGroundviewFieldName:(int)a3;
- (void)setHasAddressFieldName:(BOOL)a3;
- (void)setHasCuratedCollectionFieldName:(BOOL)a3;
- (void)setHasGroundviewFieldName:(BOOL)a3;
- (void)setHasIncidentType:(BOOL)a3;
- (void)setHasOtherFieldName:(BOOL)a3;
- (void)setHasPoiFieldName:(BOOL)a3;
- (void)setHasPoiImageCorrectionType:(BOOL)a3;
- (void)setHasWorkflowFieldName:(BOOL)a3;
- (void)setIncidentField:(id)a3;
- (void)setIncidentType:(int)a3;
- (void)setOtherFieldName:(int)a3;
- (void)setPoiFieldName:(int)a3;
- (void)setPoiImageCorrectionType:(int)a3;
- (void)setWorkflowFieldName:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackLayoutFieldName

- (int)workflowFieldName
{
  if ((*(unsigned char *)&self->_flags & 0x80000000) != 0) {
    return self->_workflowFieldName;
  }
  else {
    return 0;
  }
}

- (void)setWorkflowFieldName:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x80u;
  self->_workflowFieldName = a3;
}

- (void)setHasWorkflowFieldName:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = v3 & 0x80 | *(unsigned char *)&self->_flags & 0x7F;
}

- (BOOL)hasWorkflowFieldName
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (id)workflowFieldNameAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53EB070[a3];
  }

  return v3;
}

- (int)StringAsWorkflowFieldName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_WORKFLOW_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_WORKFLOW_LABEL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_WORKFLOW_SEARCH"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_WORKFLOW_NAVIGATION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_WORKFLOW_TRANSIT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_WORKFLOW_PLACE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_WORKFLOW_ADDRESS"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_WORKFLOW_HOME"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_WORKFLOW_WORK"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_WORKFLOW_OTHER"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)poiFieldName
{
  if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
    return self->_poiFieldName;
  }
  else {
    return 0;
  }
}

- (void)setPoiFieldName:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x20u;
  self->_poiFieldName = a3;
}

- (void)setHasPoiFieldName:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasPoiFieldName
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (id)poiFieldNameAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53EB0C0[a3];
  }

  return v3;
}

- (int)StringAsPoiFieldName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_POI_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_POI_NAME"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_POI_CATEGORY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_POI_HOURS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_POI_WEBSITE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_POI_PHONE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_POI_AMENITIES"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_POI_PARENT_CONTAINMENT"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_POI_CHILD_CONTAINMENT"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)addressFieldName
{
  if (*(unsigned char *)&self->_flags) {
    return self->_addressFieldName;
  }
  else {
    return 0;
  }
}

- (void)setAddressFieldName:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_addressFieldName = a3;
}

- (void)setHasAddressFieldName:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAddressFieldName
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)addressFieldNameAsString:(int)a3
{
  if a3 < 8 && ((0xFDu >> a3))
  {
    id v3 = off_1E53EB108[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (int)StringAsAddressFieldName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_ADDRESS_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_ADDRESS_LOCATION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_ADDRESS_LOCATION_ENTRY_POINT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_ADDRESS_BASIC"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_ADDRESS_UNIT"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_ADDRESS_FLOOR"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_ADDRESS_BLDG"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)otherFieldName
{
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
    return self->_otherFieldName;
  }
  else {
    return 0;
  }
}

- (void)setOtherFieldName:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_otherFieldName = a3;
}

- (void)setHasOtherFieldName:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasOtherFieldName
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)otherFieldNameAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53EB148[a3];
  }

  return v3;
}

- (int)StringAsOtherFieldName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_OTHER_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_OTHER_PHOTO"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_OTHER_COMMENTS"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)groundviewFieldName
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return self->_groundviewFieldName;
  }
  else {
    return 0;
  }
}

- (void)setGroundviewFieldName:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_groundviewFieldName = a3;
}

- (void)setHasGroundviewFieldName:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasGroundviewFieldName
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)groundviewFieldNameAsString:(int)a3
{
  if a3 < 0xD && ((0x10FFu >> a3))
  {
    char v3 = off_1E53EB160[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (int)StringAsGroundviewFieldName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_GROUNDVIEW_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_GROUNDVIEW_TITLE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_GROUNDVIEW_LOCATION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_GROUNDVIEW_SUBTYPE_BAD_IMAGERY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_GROUNDVIEW_SUBTYPE_BLUR_FACE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_GROUNDVIEW_SUBTYPE_BLUR_ADDRESS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_GROUNDVIEW_SUBTYPE_BAD_LABEL"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_GROUNDVIEW_SUBTYPE_OTHER"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_GROUNDVIEW_CONTACT_INFO"])
  {
    int v4 = 12;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)incidentType
{
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    return self->_incidentType;
  }
  else {
    return 0;
  }
}

- (void)setIncidentType:(int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_incidentType = a3;
}

- (void)setHasIncidentType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasIncidentType
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)incidentTypeAsString:(int)a3
{
  if (a3 >= 0x12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53EB2A0[a3];
  }

  return v3;
}

- (int)StringAsIncidentType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ROAD_CLOSURE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LANE_CLOSURE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WEATHER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"EVENT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ACCIDENT"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"HAZARD"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ROADWORKS"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"RAMP_CLOSURE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"OTHER"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"TRAFFIC"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"WALKING_CLOSURE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"MANEUVER_CLOSURE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"AREA_ADVISORY"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"AREA_CLOSURE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"CONGESTION_ZONE"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"SPEED_CHECK"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"NO_THOROUGHFARE_CLOSURE"])
  {
    int v4 = 17;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)poiImageCorrectionType
{
  if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
    return self->_poiImageCorrectionType;
  }
  else {
    return 0;
  }
}

- (void)setPoiImageCorrectionType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x40u;
  self->_poiImageCorrectionType = a3;
}

- (void)setHasPoiImageCorrectionType:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xBF | v3;
}

- (BOOL)hasPoiImageCorrectionType
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (id)poiImageCorrectionTypeAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53EB1C8[a3];
  }

  return v3;
}

- (int)StringAsPoiImageCorrectionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"POI_IMAGE_CORRECTION_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"POI_IMAGE_CORRECTION_OTHER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"POI_IMAGE_CORRECTION_IRRELEVANT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"POI_IMAGE_CORRECTION_OFFENSIVE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"POI_IMAGE_CORRECTION_POOR_QUALITY"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"POI_IMAGE_CORRECTION_PRIVACY_ISSUE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"POI_IMAGE_CORRECTION_LEGAL_ISSUE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"POI_IMAGE_CORRECTION_COPYRIGHT_VIOLATION"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"POI_IMAGE_CORRECTION_INAPPROPRIATE_ATTRIBUTION"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)curatedCollectionFieldName
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_curatedCollectionFieldName;
  }
  else {
    return 0;
  }
}

- (void)setCuratedCollectionFieldName:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_curatedCollectionFieldName = a3;
}

- (void)setHasCuratedCollectionFieldName:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasCuratedCollectionFieldName
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)curatedCollectionFieldNameAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53EB210[a3];
  }

  return v3;
}

- (int)StringAsCuratedCollectionFieldName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_CURATED_COLLECTION_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_CURATED_COLLECTION_BAD_URL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_CURATED_COLLECTION_BAD_DESCRIPTION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_CURATED_COLLECTION_OTHER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_CURATED_COLLECTION_PLACE_INACCURATE_DETAILS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_CURATED_COLLECTION_PLACE_BAD_URL"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_CURATED_COLLECTION_PLACE_BAD_DESCRIPTION"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"FEEDBACK_LAYOUT_CURATED_COLLECTION_PLACE_OTHER"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasIncidentField
{
  return self->_incidentField != 0;
}

- (GEORPIncidentField)incidentField
{
  return self->_incidentField;
}

- (void)setIncidentField:(id)a3
{
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackLayoutFieldName;
  int v4 = [(GEORPFeedbackLayoutFieldName *)&v8 description];
  v5 = [(GEORPFeedbackLayoutFieldName *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackLayoutFieldName _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_75;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 48);
  if (v5 < 0)
  {
    uint64_t v6 = *(int *)(a1 + 44);
    if (v6 >= 0xA)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 44));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E53EB070[v6];
    }
    if (a2) {
      objc_super v8 = @"workflowFieldName";
    }
    else {
      objc_super v8 = @"workflow_field_name";
    }
    [v4 setObject:v7 forKey:v8];

    char v5 = *(unsigned char *)(a1 + 48);
    if ((v5 & 0x20) == 0)
    {
LABEL_4:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)(a1 + 48) & 0x20) == 0)
  {
    goto LABEL_4;
  }
  uint64_t v9 = *(int *)(a1 + 36);
  if (v9 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 36));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E53EB0C0[v9];
  }
  if (a2) {
    v11 = @"poiFieldName";
  }
  else {
    v11 = @"poi_field_name";
  }
  [v4 setObject:v10 forKey:v11];

  char v5 = *(unsigned char *)(a1 + 48);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_33;
  }
LABEL_25:
  uint64_t v12 = *(int *)(a1 + 16);
  if v12 < 8 && ((0xFDu >> v12))
  {
    v13 = off_1E53EB108[v12];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (a2) {
    v14 = @"addressFieldName";
  }
  else {
    v14 = @"address_field_name";
  }
  [v4 setObject:v13 forKey:v14];

  char v5 = *(unsigned char *)(a1 + 48);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_40;
  }
LABEL_33:
  uint64_t v15 = *(int *)(a1 + 32);
  if (v15 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 32));
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = off_1E53EB148[v15];
  }
  if (a2) {
    v17 = @"otherFieldName";
  }
  else {
    v17 = @"other_field_name";
  }
  [v4 setObject:v16 forKey:v17];

  char v5 = *(unsigned char *)(a1 + 48);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_48;
  }
LABEL_40:
  uint64_t v18 = *(int *)(a1 + 24);
  if v18 < 0xD && ((0x10FFu >> v18))
  {
    v19 = off_1E53EB160[v18];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (a2) {
    v20 = @"groundviewFieldName";
  }
  else {
    v20 = @"groundview_field_name";
  }
  [v4 setObject:v19 forKey:v20];

  char v5 = *(unsigned char *)(a1 + 48);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x40) == 0) {
      goto LABEL_9;
    }
LABEL_55:
    uint64_t v24 = *(int *)(a1 + 40);
    if (v24 >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 40));
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = off_1E53EB1C8[v24];
    }
    if (a2) {
      v26 = @"poiImageCorrectionType";
    }
    else {
      v26 = @"poi_image_correction_type";
    }
    [v4 setObject:v25 forKey:v26];

    if ((*(unsigned char *)(a1 + 48) & 2) == 0) {
      goto LABEL_69;
    }
    goto LABEL_62;
  }
LABEL_48:
  uint64_t v21 = *(int *)(a1 + 28);
  if (v21 >= 0x12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 28));
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = off_1E53EB2A0[v21];
  }
  if (a2) {
    v23 = @"incidentType";
  }
  else {
    v23 = @"incident_type";
  }
  [v4 setObject:v22 forKey:v23];

  char v5 = *(unsigned char *)(a1 + 48);
  if ((v5 & 0x40) != 0) {
    goto LABEL_55;
  }
LABEL_9:
  if ((v5 & 2) != 0)
  {
LABEL_62:
    uint64_t v27 = *(int *)(a1 + 20);
    if (v27 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 20));
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = off_1E53EB210[v27];
    }
    if (a2) {
      v29 = @"curatedCollectionFieldName";
    }
    else {
      v29 = @"curated_collection_field_name";
    }
    [v4 setObject:v28 forKey:v29];
  }
LABEL_69:
  v30 = [(id)a1 incidentField];
  v31 = v30;
  if (v30)
  {
    if (a2)
    {
      v32 = [v30 jsonRepresentation];
      v33 = @"incidentField";
    }
    else
    {
      v32 = [v30 dictionaryRepresentation];
      v33 = @"incident_field";
    }
    [v4 setObject:v32 forKey:v33];
  }
LABEL_75:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackLayoutFieldName _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPFeedbackLayoutFieldName)initWithDictionary:(id)a3
{
  return (GEORPFeedbackLayoutFieldName *)-[GEORPFeedbackLayoutFieldName _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_230;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_230;
  }
  if (a3) {
    uint64_t v6 = @"workflowFieldName";
  }
  else {
    uint64_t v6 = @"workflow_field_name";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"FEEDBACK_LAYOUT_WORKFLOW_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"FEEDBACK_LAYOUT_WORKFLOW_LABEL"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"FEEDBACK_LAYOUT_WORKFLOW_SEARCH"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"FEEDBACK_LAYOUT_WORKFLOW_NAVIGATION"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"FEEDBACK_LAYOUT_WORKFLOW_TRANSIT"])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"FEEDBACK_LAYOUT_WORKFLOW_PLACE"])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:@"FEEDBACK_LAYOUT_WORKFLOW_ADDRESS"])
    {
      uint64_t v9 = 6;
    }
    else if ([v8 isEqualToString:@"FEEDBACK_LAYOUT_WORKFLOW_HOME"])
    {
      uint64_t v9 = 7;
    }
    else if ([v8 isEqualToString:@"FEEDBACK_LAYOUT_WORKFLOW_WORK"])
    {
      uint64_t v9 = 8;
    }
    else if ([v8 isEqualToString:@"FEEDBACK_LAYOUT_WORKFLOW_OTHER"])
    {
      uint64_t v9 = 9;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_32;
    }
    uint64_t v9 = [v7 intValue];
  }
  [a1 setWorkflowFieldName:v9];
LABEL_32:

  if (a3) {
    v10 = @"poiFieldName";
  }
  else {
    v10 = @"poi_field_name";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    if ([v12 isEqualToString:@"FEEDBACK_LAYOUT_POI_UNKNOWN"])
    {
      uint64_t v13 = 0;
    }
    else if ([v12 isEqualToString:@"FEEDBACK_LAYOUT_POI_NAME"])
    {
      uint64_t v13 = 1;
    }
    else if ([v12 isEqualToString:@"FEEDBACK_LAYOUT_POI_CATEGORY"])
    {
      uint64_t v13 = 2;
    }
    else if ([v12 isEqualToString:@"FEEDBACK_LAYOUT_POI_HOURS"])
    {
      uint64_t v13 = 3;
    }
    else if ([v12 isEqualToString:@"FEEDBACK_LAYOUT_POI_WEBSITE"])
    {
      uint64_t v13 = 4;
    }
    else if ([v12 isEqualToString:@"FEEDBACK_LAYOUT_POI_PHONE"])
    {
      uint64_t v13 = 5;
    }
    else if ([v12 isEqualToString:@"FEEDBACK_LAYOUT_POI_AMENITIES"])
    {
      uint64_t v13 = 6;
    }
    else if ([v12 isEqualToString:@"FEEDBACK_LAYOUT_POI_PARENT_CONTAINMENT"])
    {
      uint64_t v13 = 7;
    }
    else if ([v12 isEqualToString:@"FEEDBACK_LAYOUT_POI_CHILD_CONTAINMENT"])
    {
      uint64_t v13 = 8;
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_59;
    }
    uint64_t v13 = [v11 intValue];
  }
  [a1 setPoiFieldName:v13];
LABEL_59:

  if (a3) {
    v14 = @"addressFieldName";
  }
  else {
    v14 = @"address_field_name";
  }
  uint64_t v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v15;
    if ([v16 isEqualToString:@"FEEDBACK_LAYOUT_ADDRESS_UNKNOWN"])
    {
      uint64_t v17 = 0;
    }
    else if ([v16 isEqualToString:@"FEEDBACK_LAYOUT_ADDRESS_LOCATION"])
    {
      uint64_t v17 = 2;
    }
    else if ([v16 isEqualToString:@"FEEDBACK_LAYOUT_ADDRESS_LOCATION_ENTRY_POINT"])
    {
      uint64_t v17 = 3;
    }
    else if ([v16 isEqualToString:@"FEEDBACK_LAYOUT_ADDRESS_BASIC"])
    {
      uint64_t v17 = 4;
    }
    else if ([v16 isEqualToString:@"FEEDBACK_LAYOUT_ADDRESS_UNIT"])
    {
      uint64_t v17 = 5;
    }
    else if ([v16 isEqualToString:@"FEEDBACK_LAYOUT_ADDRESS_FLOOR"])
    {
      uint64_t v17 = 6;
    }
    else if ([v16 isEqualToString:@"FEEDBACK_LAYOUT_ADDRESS_BLDG"])
    {
      uint64_t v17 = 7;
    }
    else
    {
      uint64_t v17 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_82;
    }
    uint64_t v17 = [v15 intValue];
  }
  [a1 setAddressFieldName:v17];
LABEL_82:

  if (a3) {
    uint64_t v18 = @"otherFieldName";
  }
  else {
    uint64_t v18 = @"other_field_name";
  }
  v19 = [v5 objectForKeyedSubscript:v18];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = v19;
    if ([v20 isEqualToString:@"FEEDBACK_LAYOUT_OTHER_UNKNOWN"])
    {
      uint64_t v21 = 0;
    }
    else if ([v20 isEqualToString:@"FEEDBACK_LAYOUT_OTHER_PHOTO"])
    {
      uint64_t v21 = 1;
    }
    else if ([v20 isEqualToString:@"FEEDBACK_LAYOUT_OTHER_COMMENTS"])
    {
      uint64_t v21 = 2;
    }
    else
    {
      uint64_t v21 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_97;
    }
    uint64_t v21 = [v19 intValue];
  }
  [a1 setOtherFieldName:v21];
LABEL_97:

  if (a3) {
    v22 = @"groundviewFieldName";
  }
  else {
    v22 = @"groundview_field_name";
  }
  v23 = [v5 objectForKeyedSubscript:v22];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v24 = v23;
    if ([v24 isEqualToString:@"FEEDBACK_LAYOUT_GROUNDVIEW_UNKNOWN"])
    {
      uint64_t v25 = 0;
    }
    else if ([v24 isEqualToString:@"FEEDBACK_LAYOUT_GROUNDVIEW_TITLE"])
    {
      uint64_t v25 = 1;
    }
    else if ([v24 isEqualToString:@"FEEDBACK_LAYOUT_GROUNDVIEW_LOCATION"])
    {
      uint64_t v25 = 2;
    }
    else if ([v24 isEqualToString:@"FEEDBACK_LAYOUT_GROUNDVIEW_SUBTYPE_BAD_IMAGERY"])
    {
      uint64_t v25 = 3;
    }
    else if ([v24 isEqualToString:@"FEEDBACK_LAYOUT_GROUNDVIEW_SUBTYPE_BLUR_FACE"])
    {
      uint64_t v25 = 4;
    }
    else if ([v24 isEqualToString:@"FEEDBACK_LAYOUT_GROUNDVIEW_SUBTYPE_BLUR_ADDRESS"])
    {
      uint64_t v25 = 5;
    }
    else if ([v24 isEqualToString:@"FEEDBACK_LAYOUT_GROUNDVIEW_SUBTYPE_BAD_LABEL"])
    {
      uint64_t v25 = 6;
    }
    else if ([v24 isEqualToString:@"FEEDBACK_LAYOUT_GROUNDVIEW_SUBTYPE_OTHER"])
    {
      uint64_t v25 = 7;
    }
    else if ([v24 isEqualToString:@"FEEDBACK_LAYOUT_GROUNDVIEW_CONTACT_INFO"])
    {
      uint64_t v25 = 12;
    }
    else
    {
      uint64_t v25 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_124;
    }
    uint64_t v25 = [v23 intValue];
  }
  [a1 setGroundviewFieldName:v25];
LABEL_124:

  if (a3) {
    v26 = @"incidentType";
  }
  else {
    v26 = @"incident_type";
  }
  uint64_t v27 = [v5 objectForKeyedSubscript:v26];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v28 = v27;
    if ([v28 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v29 = 0;
    }
    else if ([v28 isEqualToString:@"ROAD_CLOSURE"])
    {
      uint64_t v29 = 1;
    }
    else if ([v28 isEqualToString:@"LANE_CLOSURE"])
    {
      uint64_t v29 = 2;
    }
    else if ([v28 isEqualToString:@"WEATHER"])
    {
      uint64_t v29 = 3;
    }
    else if ([v28 isEqualToString:@"EVENT"])
    {
      uint64_t v29 = 4;
    }
    else if ([v28 isEqualToString:@"ACCIDENT"])
    {
      uint64_t v29 = 5;
    }
    else if ([v28 isEqualToString:@"HAZARD"])
    {
      uint64_t v29 = 6;
    }
    else if ([v28 isEqualToString:@"ROADWORKS"])
    {
      uint64_t v29 = 7;
    }
    else if ([v28 isEqualToString:@"RAMP_CLOSURE"])
    {
      uint64_t v29 = 8;
    }
    else if ([v28 isEqualToString:@"OTHER"])
    {
      uint64_t v29 = 9;
    }
    else if ([v28 isEqualToString:@"TRAFFIC"])
    {
      uint64_t v29 = 10;
    }
    else if ([v28 isEqualToString:@"WALKING_CLOSURE"])
    {
      uint64_t v29 = 11;
    }
    else if ([v28 isEqualToString:@"MANEUVER_CLOSURE"])
    {
      uint64_t v29 = 12;
    }
    else if ([v28 isEqualToString:@"AREA_ADVISORY"])
    {
      uint64_t v29 = 13;
    }
    else if ([v28 isEqualToString:@"AREA_CLOSURE"])
    {
      uint64_t v29 = 14;
    }
    else if ([v28 isEqualToString:@"CONGESTION_ZONE"])
    {
      uint64_t v29 = 15;
    }
    else if ([v28 isEqualToString:@"SPEED_CHECK"])
    {
      uint64_t v29 = 16;
    }
    else if ([v28 isEqualToString:@"NO_THOROUGHFARE_CLOSURE"])
    {
      uint64_t v29 = 17;
    }
    else
    {
      uint64_t v29 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_169;
    }
    uint64_t v29 = [v27 intValue];
  }
  [a1 setIncidentType:v29];
LABEL_169:

  if (a3) {
    v30 = @"poiImageCorrectionType";
  }
  else {
    v30 = @"poi_image_correction_type";
  }
  v31 = [v5 objectForKeyedSubscript:v30];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v32 = v31;
    if ([v32 isEqualToString:@"POI_IMAGE_CORRECTION_UNKNOWN"])
    {
      uint64_t v33 = 0;
    }
    else if ([v32 isEqualToString:@"POI_IMAGE_CORRECTION_OTHER"])
    {
      uint64_t v33 = 1;
    }
    else if ([v32 isEqualToString:@"POI_IMAGE_CORRECTION_IRRELEVANT"])
    {
      uint64_t v33 = 2;
    }
    else if ([v32 isEqualToString:@"POI_IMAGE_CORRECTION_OFFENSIVE"])
    {
      uint64_t v33 = 3;
    }
    else if ([v32 isEqualToString:@"POI_IMAGE_CORRECTION_POOR_QUALITY"])
    {
      uint64_t v33 = 4;
    }
    else if ([v32 isEqualToString:@"POI_IMAGE_CORRECTION_PRIVACY_ISSUE"])
    {
      uint64_t v33 = 5;
    }
    else if ([v32 isEqualToString:@"POI_IMAGE_CORRECTION_LEGAL_ISSUE"])
    {
      uint64_t v33 = 6;
    }
    else if ([v32 isEqualToString:@"POI_IMAGE_CORRECTION_COPYRIGHT_VIOLATION"])
    {
      uint64_t v33 = 7;
    }
    else if ([v32 isEqualToString:@"POI_IMAGE_CORRECTION_INAPPROPRIATE_ATTRIBUTION"])
    {
      uint64_t v33 = 8;
    }
    else
    {
      uint64_t v33 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_196;
    }
    uint64_t v33 = [v31 intValue];
  }
  [a1 setPoiImageCorrectionType:v33];
LABEL_196:

  if (a3) {
    v34 = @"curatedCollectionFieldName";
  }
  else {
    v34 = @"curated_collection_field_name";
  }
  v35 = [v5 objectForKeyedSubscript:v34];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v36 = v35;
    if ([v36 isEqualToString:@"FEEDBACK_LAYOUT_CURATED_COLLECTION_UNKNOWN"])
    {
      uint64_t v37 = 0;
    }
    else if ([v36 isEqualToString:@"FEEDBACK_LAYOUT_CURATED_COLLECTION_BAD_URL"])
    {
      uint64_t v37 = 1;
    }
    else if ([v36 isEqualToString:@"FEEDBACK_LAYOUT_CURATED_COLLECTION_BAD_DESCRIPTION"])
    {
      uint64_t v37 = 2;
    }
    else if ([v36 isEqualToString:@"FEEDBACK_LAYOUT_CURATED_COLLECTION_OTHER"])
    {
      uint64_t v37 = 3;
    }
    else if ([v36 isEqualToString:@"FEEDBACK_LAYOUT_CURATED_COLLECTION_PLACE_INACCURATE_DETAILS"])
    {
      uint64_t v37 = 4;
    }
    else if ([v36 isEqualToString:@"FEEDBACK_LAYOUT_CURATED_COLLECTION_PLACE_BAD_URL"])
    {
      uint64_t v37 = 5;
    }
    else if ([v36 isEqualToString:@"FEEDBACK_LAYOUT_CURATED_COLLECTION_PLACE_BAD_DESCRIPTION"])
    {
      uint64_t v37 = 6;
    }
    else if ([v36 isEqualToString:@"FEEDBACK_LAYOUT_CURATED_COLLECTION_PLACE_OTHER"])
    {
      uint64_t v37 = 7;
    }
    else
    {
      uint64_t v37 = 0;
    }

    goto LABEL_220;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v37 = [v35 intValue];
LABEL_220:
    [a1 setCuratedCollectionFieldName:v37];
  }

  if (a3) {
    v38 = @"incidentField";
  }
  else {
    v38 = @"incident_field";
  }
  v39 = [v5 objectForKeyedSubscript:v38];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v40 = [GEORPIncidentField alloc];
    if (a3) {
      uint64_t v41 = [(GEORPIncidentField *)v40 initWithJSON:v39];
    }
    else {
      uint64_t v41 = [(GEORPIncidentField *)v40 initWithDictionary:v39];
    }
    v42 = (void *)v41;
    [a1 setIncidentField:v41];
  }
LABEL_230:

  return a1;
}

- (GEORPFeedbackLayoutFieldName)initWithJSON:(id)a3
{
  return (GEORPFeedbackLayoutFieldName *)-[GEORPFeedbackLayoutFieldName _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackLayoutFieldNameIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackLayoutFieldNameReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if (flags < 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_6:
    if ((flags & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_7:
    if ((flags & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_8:
    if ((flags & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_21:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_9:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_10:
  if (self->_incidentField)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v6 = a3;
  [(GEORPFeedbackLayoutFieldName *)self readAll:0];
  $D205515FC21CC39D9BB1EA96C5051829 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x80000000) == 0)
  {
    id v5 = v6;
    if ((*(unsigned char *)&flags & 0x20) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v5 = v6;
  v6[11] = self->_workflowFieldName;
  *((unsigned char *)v6 + 48) |= 0x80u;
  *(unsigned char *)&$D205515FC21CC39D9BB1EA96C5051829 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
LABEL_3:
    v5[9] = self->_poiFieldName;
    *((unsigned char *)v5 + 48) |= 0x20u;
    *(unsigned char *)&$D205515FC21CC39D9BB1EA96C5051829 flags = self->_flags;
  }
LABEL_4:
  if (*(unsigned char *)&flags)
  {
    v5[4] = self->_addressFieldName;
    *((unsigned char *)v5 + 48) |= 1u;
    *(unsigned char *)&$D205515FC21CC39D9BB1EA96C5051829 flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x10) == 0)
    {
LABEL_6:
      if ((*(unsigned char *)&flags & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&flags & 0x10) == 0)
  {
    goto LABEL_6;
  }
  v5[8] = self->_otherFieldName;
  *((unsigned char *)v5 + 48) |= 0x10u;
  *(unsigned char *)&$D205515FC21CC39D9BB1EA96C5051829 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&flags & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  v5[6] = self->_groundviewFieldName;
  *((unsigned char *)v5 + 48) |= 4u;
  *(unsigned char *)&$D205515FC21CC39D9BB1EA96C5051829 flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&flags & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  v5[7] = self->_incidentType;
  *((unsigned char *)v5 + 48) |= 8u;
  *(unsigned char *)&$D205515FC21CC39D9BB1EA96C5051829 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&flags & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_20:
  v5[10] = self->_poiImageCorrectionType;
  *((unsigned char *)v5 + 48) |= 0x40u;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_10:
    v5[5] = self->_curatedCollectionFieldName;
    *((unsigned char *)v5 + 48) |= 2u;
  }
LABEL_11:
  if (self->_incidentField)
  {
    objc_msgSend(v6, "setIncidentField:");
    id v5 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char flags = (char)self->_flags;
  if (flags < 0)
  {
    *(_DWORD *)(v5 + 44) = self->_workflowFieldName;
    *(unsigned char *)(v5 + 48) |= 0x80u;
    char flags = (char)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 36) = self->_poiFieldName;
  *(unsigned char *)(v5 + 48) |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *(_DWORD *)(v5 + 16) = self->_addressFieldName;
  *(unsigned char *)(v5 + 48) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *(_DWORD *)(v5 + 32) = self->_otherFieldName;
  *(unsigned char *)(v5 + 48) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_6:
    if ((flags & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *(_DWORD *)(v5 + 24) = self->_groundviewFieldName;
  *(unsigned char *)(v5 + 48) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_7:
    if ((flags & 0x40) == 0) {
      goto LABEL_8;
    }
LABEL_17:
    *(_DWORD *)(v5 + 40) = self->_poiImageCorrectionType;
    *(unsigned char *)(v5 + 48) |= 0x40u;
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_16:
  *(_DWORD *)(v5 + 28) = self->_incidentType;
  *(unsigned char *)(v5 + 48) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 0x40) != 0) {
    goto LABEL_17;
  }
LABEL_8:
  if ((flags & 2) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 20) = self->_curatedCollectionFieldName;
    *(unsigned char *)(v5 + 48) |= 2u;
  }
LABEL_10:
  id v8 = [(GEORPIncidentField *)self->_incidentField copyWithZone:a3];
  uint64_t v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_44;
  }
  [(GEORPFeedbackLayoutFieldName *)self readAll:1];
  [v4 readAll:1];
  $D205515FC21CC39D9BB1EA96C5051829 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x80000000) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 0x80) == 0 || self->_workflowFieldName != *((_DWORD *)v4 + 11)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 0x80) != 0)
  {
LABEL_44:
    char v7 = 0;
    goto LABEL_45;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 0x20) == 0 || self->_poiFieldName != *((_DWORD *)v4 + 9)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 0x20) != 0)
  {
    goto LABEL_44;
  }
  if (*(unsigned char *)&flags)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_addressFieldName != *((_DWORD *)v4 + 4)) {
      goto LABEL_44;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 0x10) == 0 || self->_otherFieldName != *((_DWORD *)v4 + 8)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 0x10) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_groundviewFieldName != *((_DWORD *)v4 + 6)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) == 0 || self->_incidentType != *((_DWORD *)v4 + 7)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 8) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 0x40) == 0 || self->_poiImageCorrectionType != *((_DWORD *)v4 + 10)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 0x40) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_curatedCollectionFieldName != *((_DWORD *)v4 + 5)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_44;
  }
  incidentField = self->_incidentField;
  if ((unint64_t)incidentField | *((void *)v4 + 1)) {
    char v7 = -[GEORPIncidentField isEqual:](incidentField, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_45:

  return v7;
}

- (unint64_t)hash
{
  [(GEORPFeedbackLayoutFieldName *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 0x80000000) != 0)
  {
    uint64_t v3 = 2654435761 * self->_workflowFieldName;
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
LABEL_3:
      uint64_t v4 = 0;
      if (*(unsigned char *)&self->_flags) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 0x20) == 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 2654435761 * self->_poiFieldName;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_addressFieldName;
    if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_otherFieldName;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_groundviewFieldName;
    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_incidentType;
    if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_9;
    }
LABEL_17:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(GEORPIncidentField *)self->_incidentField hash];
  }
LABEL_15:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_flags & 0x40) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v9 = 2654435761 * self->_poiImageCorrectionType;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  uint64_t v10 = 2654435761 * self->_curatedCollectionFieldName;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(GEORPIncidentField *)self->_incidentField hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v8 = (int *)a3;
  [v8 readAll:0];
  uint64_t v4 = v8;
  int v5 = *((char *)v8 + 48);
  if ((v5 & 0x80000000) == 0)
  {
    if ((v5 & 0x20) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  self->_workflowFieldName = v8[11];
  *(unsigned char *)&self->_flags |= 0x80u;
  LOBYTE(v5) = *((unsigned char *)v8 + 48);
  if ((v5 & 0x20) != 0)
  {
LABEL_3:
    self->_poiFieldName = v8[9];
    *(unsigned char *)&self->_flags |= 0x20u;
    LOBYTE(v5) = *((unsigned char *)v8 + 48);
  }
LABEL_4:
  if (v5)
  {
    self->_addressFieldName = v8[4];
    *(unsigned char *)&self->_flags |= 1u;
    LOBYTE(v5) = *((unsigned char *)v8 + 48);
    if ((v5 & 0x10) == 0)
    {
LABEL_6:
      if ((v5 & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_16;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_6;
  }
  self->_otherFieldName = v8[8];
  *(unsigned char *)&self->_flags |= 0x10u;
  LOBYTE(v5) = *((unsigned char *)v8 + 48);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_groundviewFieldName = v8[6];
  *(unsigned char *)&self->_flags |= 4u;
  LOBYTE(v5) = *((unsigned char *)v8 + 48);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_incidentType = v8[7];
  *(unsigned char *)&self->_flags |= 8u;
  LOBYTE(v5) = *((unsigned char *)v8 + 48);
  if ((v5 & 0x40) == 0)
  {
LABEL_9:
    if ((v5 & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_18:
  self->_poiImageCorrectionType = v8[10];
  *(unsigned char *)&self->_flags |= 0x40u;
  if ((v8[12] & 2) != 0)
  {
LABEL_10:
    self->_curatedCollectionFieldName = v8[5];
    *(unsigned char *)&self->_flags |= 2u;
  }
LABEL_11:
  incidentField = self->_incidentField;
  uint64_t v7 = *((void *)v8 + 1);
  if (incidentField)
  {
    if (!v7) {
      goto LABEL_25;
    }
    -[GEORPIncidentField mergeFrom:](incidentField, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_25;
    }
    -[GEORPFeedbackLayoutFieldName setIncidentField:](self, "setIncidentField:");
  }
  uint64_t v4 = v8;
LABEL_25:
}

- (void).cxx_destruct
{
}

@end