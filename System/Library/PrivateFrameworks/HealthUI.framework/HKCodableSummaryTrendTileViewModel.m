@interface HKCodableSummaryTrendTileViewModel
+ (Class)visualizationPointsType;
- (BOOL)hasBaseTrendLine;
- (BOOL)hasCellHeaderViewModel;
- (BOOL)hasChangeTrendLine;
- (BOOL)hasChangeTypeRawValue;
- (BOOL)hasCoveredDateRangeRawValue;
- (BOOL)hasDiagramStyle;
- (BOOL)hasDiscoveryDateData;
- (BOOL)hasNotificationIdentifier;
- (BOOL)hasObjectTypeIdentifier;
- (BOOL)hasOriginalEventDateData;
- (BOOL)hasPregnancyLabelValue;
- (BOOL)hasTrendDescription;
- (BOOL)hasTrendDescriptionSharingPreviewOverride;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableCellHeaderViewModel)cellHeaderViewModel;
- (HKCodableSummaryTrendLineViewModel)baseTrendLine;
- (HKCodableSummaryTrendLineViewModel)changeTrendLine;
- (NSMutableArray)visualizationPoints;
- (NSString)changeTypeRawValue;
- (NSString)coveredDateRangeRawValue;
- (NSString)notificationIdentifier;
- (NSString)objectTypeIdentifier;
- (NSString)pregnancyLabelValue;
- (NSString)trendDescription;
- (NSString)trendDescriptionSharingPreviewOverride;
- (double)discoveryDateData;
- (double)originalEventDateData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)diagramStyleAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)visualizationPointsAtIndex:(unint64_t)a3;
- (int)StringAsDiagramStyle:(id)a3;
- (int)diagramStyle;
- (unint64_t)hash;
- (unint64_t)visualizationPointsCount;
- (void)addVisualizationPoints:(id)a3;
- (void)clearVisualizationPoints;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBaseTrendLine:(id)a3;
- (void)setCellHeaderViewModel:(id)a3;
- (void)setChangeTrendLine:(id)a3;
- (void)setChangeTypeRawValue:(id)a3;
- (void)setCoveredDateRangeRawValue:(id)a3;
- (void)setDiagramStyle:(int)a3;
- (void)setDiscoveryDateData:(double)a3;
- (void)setHasDiagramStyle:(BOOL)a3;
- (void)setHasDiscoveryDateData:(BOOL)a3;
- (void)setHasOriginalEventDateData:(BOOL)a3;
- (void)setNotificationIdentifier:(id)a3;
- (void)setObjectTypeIdentifier:(id)a3;
- (void)setOriginalEventDateData:(double)a3;
- (void)setPregnancyLabelValue:(id)a3;
- (void)setTrendDescription:(id)a3;
- (void)setTrendDescriptionSharingPreviewOverride:(id)a3;
- (void)setVisualizationPoints:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSummaryTrendTileViewModel

- (BOOL)hasTrendDescription
{
  return self->_trendDescription != 0;
}

- (BOOL)hasChangeTypeRawValue
{
  return self->_changeTypeRawValue != 0;
}

- (int)diagramStyle
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_diagramStyle;
  }
  else {
    return 0;
  }
}

- (void)setDiagramStyle:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_diagramStyle = a3;
}

- (void)setHasDiagramStyle:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDiagramStyle
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)diagramStyleAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E6D51550[a3];
  }
  return v3;
}

- (int)StringAsDiagramStyle:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"bar"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"line"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"minMax"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"distribution"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"bloodPressure"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasObjectTypeIdentifier
{
  return self->_objectTypeIdentifier != 0;
}

- (BOOL)hasCoveredDateRangeRawValue
{
  return self->_coveredDateRangeRawValue != 0;
}

- (BOOL)hasBaseTrendLine
{
  return self->_baseTrendLine != 0;
}

- (BOOL)hasChangeTrendLine
{
  return self->_changeTrendLine != 0;
}

- (void)clearVisualizationPoints
{
}

- (void)addVisualizationPoints:(id)a3
{
  id v4 = a3;
  visualizationPoints = self->_visualizationPoints;
  id v8 = v4;
  if (!visualizationPoints)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_visualizationPoints;
    self->_visualizationPoints = v6;

    id v4 = v8;
    visualizationPoints = self->_visualizationPoints;
  }
  [(NSMutableArray *)visualizationPoints addObject:v4];
}

- (unint64_t)visualizationPointsCount
{
  return [(NSMutableArray *)self->_visualizationPoints count];
}

- (id)visualizationPointsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_visualizationPoints objectAtIndex:a3];
}

+ (Class)visualizationPointsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasNotificationIdentifier
{
  return self->_notificationIdentifier != 0;
}

- (void)setDiscoveryDateData:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_discoveryDateData = a3;
}

- (void)setHasDiscoveryDateData:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDiscoveryDateData
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setOriginalEventDateData:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_originalEventDateData = a3;
}

- (void)setHasOriginalEventDateData:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOriginalEventDateData
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasTrendDescriptionSharingPreviewOverride
{
  return self->_trendDescriptionSharingPreviewOverride != 0;
}

- (BOOL)hasCellHeaderViewModel
{
  return self->_cellHeaderViewModel != 0;
}

- (BOOL)hasPregnancyLabelValue
{
  return self->_pregnancyLabelValue != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSummaryTrendTileViewModel;
  id v4 = [(HKCodableSummaryTrendTileViewModel *)&v8 description];
  v5 = [(HKCodableSummaryTrendTileViewModel *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  trendDescription = self->_trendDescription;
  if (trendDescription) {
    [v3 setObject:trendDescription forKey:@"trendDescription"];
  }
  changeTypeRawValue = self->_changeTypeRawValue;
  if (changeTypeRawValue) {
    [v4 setObject:changeTypeRawValue forKey:@"changeTypeRawValue"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t diagramStyle = self->_diagramStyle;
    if (diagramStyle >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_diagramStyle);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E6D51550[diagramStyle];
    }
    [v4 setObject:v8 forKey:@"diagramStyle"];
  }
  objectTypeIdentifier = self->_objectTypeIdentifier;
  if (objectTypeIdentifier) {
    [v4 setObject:objectTypeIdentifier forKey:@"objectTypeIdentifier"];
  }
  coveredDateRangeRawValue = self->_coveredDateRangeRawValue;
  if (coveredDateRangeRawValue) {
    [v4 setObject:coveredDateRangeRawValue forKey:@"coveredDateRangeRawValue"];
  }
  baseTrendLine = self->_baseTrendLine;
  if (baseTrendLine)
  {
    v12 = [(HKCodableSummaryTrendLineViewModel *)baseTrendLine dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"baseTrendLine"];
  }
  changeTrendLine = self->_changeTrendLine;
  if (changeTrendLine)
  {
    v14 = [(HKCodableSummaryTrendLineViewModel *)changeTrendLine dictionaryRepresentation];
    [v4 setObject:v14 forKey:@"changeTrendLine"];
  }
  if ([(NSMutableArray *)self->_visualizationPoints count])
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_visualizationPoints, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v16 = self->_visualizationPoints;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v32 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v31 + 1) + 8 * i) dictionaryRepresentation];
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v18);
    }

    [v4 setObject:v15 forKey:@"visualizationPoints"];
  }
  notificationIdentifier = self->_notificationIdentifier;
  if (notificationIdentifier) {
    [v4 setObject:notificationIdentifier forKey:@"notificationIdentifier"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v24 = [NSNumber numberWithDouble:self->_discoveryDateData];
    [v4 setObject:v24 forKey:@"discoveryDateData"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v25 = [NSNumber numberWithDouble:self->_originalEventDateData];
    [v4 setObject:v25 forKey:@"originalEventDateData"];
  }
  trendDescriptionSharingPreviewOverride = self->_trendDescriptionSharingPreviewOverride;
  if (trendDescriptionSharingPreviewOverride) {
    [v4 setObject:trendDescriptionSharingPreviewOverride forKey:@"trendDescriptionSharingPreviewOverride"];
  }
  cellHeaderViewModel = self->_cellHeaderViewModel;
  if (cellHeaderViewModel)
  {
    v28 = [(HKCodableCellHeaderViewModel *)cellHeaderViewModel dictionaryRepresentation];
    [v4 setObject:v28 forKey:@"cellHeaderViewModel"];
  }
  pregnancyLabelValue = self->_pregnancyLabelValue;
  if (pregnancyLabelValue) {
    [v4 setObject:pregnancyLabelValue forKey:@"pregnancyLabelValue"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryTrendTileViewModelReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_trendDescription) {
    PBDataWriterWriteStringField();
  }
  if (self->_changeTypeRawValue) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_objectTypeIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_coveredDateRangeRawValue) {
    PBDataWriterWriteStringField();
  }
  if (self->_baseTrendLine) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_changeTrendLine) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_visualizationPoints;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_notificationIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_trendDescriptionSharingPreviewOverride) {
    PBDataWriterWriteStringField();
  }
  if (self->_cellHeaderViewModel) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_pregnancyLabelValue) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_trendDescription)
  {
    objc_msgSend(v4, "setTrendDescription:");
    id v4 = v10;
  }
  if (self->_changeTypeRawValue)
  {
    objc_msgSend(v10, "setChangeTypeRawValue:");
    id v4 = v10;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_diagramStyle;
    *((unsigned char *)v4 + 120) |= 4u;
  }
  if (self->_objectTypeIdentifier) {
    objc_msgSend(v10, "setObjectTypeIdentifier:");
  }
  if (self->_coveredDateRangeRawValue) {
    objc_msgSend(v10, "setCoveredDateRangeRawValue:");
  }
  if (self->_baseTrendLine) {
    objc_msgSend(v10, "setBaseTrendLine:");
  }
  if (self->_changeTrendLine) {
    objc_msgSend(v10, "setChangeTrendLine:");
  }
  if ([(HKCodableSummaryTrendTileViewModel *)self visualizationPointsCount])
  {
    [v10 clearVisualizationPoints];
    unint64_t v5 = [(HKCodableSummaryTrendTileViewModel *)self visualizationPointsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(HKCodableSummaryTrendTileViewModel *)self visualizationPointsAtIndex:i];
        [v10 addVisualizationPoints:v8];
      }
    }
  }
  if (self->_notificationIdentifier) {
    objc_msgSend(v10, "setNotificationIdentifier:");
  }
  uint64_t v9 = v10;
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v10 + 1) = *(void *)&self->_discoveryDateData;
    *((unsigned char *)v10 + 120) |= 1u;
  }
  if (self->_trendDescriptionSharingPreviewOverride)
  {
    objc_msgSend(v10, "setTrendDescriptionSharingPreviewOverride:");
    uint64_t v9 = v10;
  }
  if (self->_cellHeaderViewModel)
  {
    objc_msgSend(v10, "setCellHeaderViewModel:");
    uint64_t v9 = v10;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v9[2] = *(void *)&self->_originalEventDateData;
    *((unsigned char *)v9 + 120) |= 2u;
  }
  if (self->_pregnancyLabelValue)
  {
    objc_msgSend(v10, "setPregnancyLabelValue:");
    uint64_t v9 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_trendDescription copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v6;

  uint64_t v8 = [(NSString *)self->_changeTypeRawValue copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_diagramStyle;
    *(unsigned char *)(v5 + 120) |= 4u;
  }
  uint64_t v10 = [(NSString *)self->_objectTypeIdentifier copyWithZone:a3];
  long long v11 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v10;

  uint64_t v12 = [(NSString *)self->_coveredDateRangeRawValue copyWithZone:a3];
  long long v13 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v12;

  id v14 = [(HKCodableSummaryTrendLineViewModel *)self->_baseTrendLine copyWithZone:a3];
  uint64_t v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  id v16 = [(HKCodableSummaryTrendLineViewModel *)self->_changeTrendLine copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v16;

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v18 = self->_visualizationPoints;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v34;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * v22), "copyWithZone:", a3, (void)v33);
        [(id)v5 addVisualizationPoints:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v20);
  }

  uint64_t v24 = [(NSString *)self->_notificationIdentifier copyWithZone:a3];
  v25 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v24;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_discoveryDateData;
    *(unsigned char *)(v5 + 120) |= 1u;
  }
  uint64_t v26 = -[NSString copyWithZone:](self->_trendDescriptionSharingPreviewOverride, "copyWithZone:", a3, (void)v33);
  v27 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v26;

  id v28 = [(HKCodableCellHeaderViewModel *)self->_cellHeaderViewModel copyWithZone:a3];
  v29 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v28;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_originalEventDateData;
    *(unsigned char *)(v5 + 120) |= 2u;
  }
  uint64_t v30 = [(NSString *)self->_pregnancyLabelValue copyWithZone:a3];
  long long v31 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v30;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_39;
  }
  trendDescription = self->_trendDescription;
  if ((unint64_t)trendDescription | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](trendDescription, "isEqual:")) {
      goto LABEL_39;
    }
  }
  changeTypeRawValue = self->_changeTypeRawValue;
  if ((unint64_t)changeTypeRawValue | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](changeTypeRawValue, "isEqual:")) {
      goto LABEL_39;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 120) & 4) == 0 || self->_diagramStyle != *((_DWORD *)v4 + 16)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 120) & 4) != 0)
  {
LABEL_39:
    char v16 = 0;
    goto LABEL_40;
  }
  objectTypeIdentifier = self->_objectTypeIdentifier;
  if ((unint64_t)objectTypeIdentifier | *((void *)v4 + 10)
    && !-[NSString isEqual:](objectTypeIdentifier, "isEqual:"))
  {
    goto LABEL_39;
  }
  coveredDateRangeRawValue = self->_coveredDateRangeRawValue;
  if ((unint64_t)coveredDateRangeRawValue | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](coveredDateRangeRawValue, "isEqual:")) {
      goto LABEL_39;
    }
  }
  baseTrendLine = self->_baseTrendLine;
  if ((unint64_t)baseTrendLine | *((void *)v4 + 3))
  {
    if (!-[HKCodableSummaryTrendLineViewModel isEqual:](baseTrendLine, "isEqual:")) {
      goto LABEL_39;
    }
  }
  changeTrendLine = self->_changeTrendLine;
  if ((unint64_t)changeTrendLine | *((void *)v4 + 5))
  {
    if (!-[HKCodableSummaryTrendLineViewModel isEqual:](changeTrendLine, "isEqual:")) {
      goto LABEL_39;
    }
  }
  visualizationPoints = self->_visualizationPoints;
  if ((unint64_t)visualizationPoints | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](visualizationPoints, "isEqual:")) {
      goto LABEL_39;
    }
  }
  notificationIdentifier = self->_notificationIdentifier;
  if ((unint64_t)notificationIdentifier | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](notificationIdentifier, "isEqual:")) {
      goto LABEL_39;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 120) & 1) == 0 || self->_discoveryDateData != *((double *)v4 + 1)) {
      goto LABEL_39;
    }
  }
  else if (*((unsigned char *)v4 + 120))
  {
    goto LABEL_39;
  }
  trendDescriptionSharingPreviewOverride = self->_trendDescriptionSharingPreviewOverride;
  if ((unint64_t)trendDescriptionSharingPreviewOverride | *((void *)v4 + 13)
    && !-[NSString isEqual:](trendDescriptionSharingPreviewOverride, "isEqual:"))
  {
    goto LABEL_39;
  }
  cellHeaderViewModel = self->_cellHeaderViewModel;
  if ((unint64_t)cellHeaderViewModel | *((void *)v4 + 4))
  {
    if (!-[HKCodableCellHeaderViewModel isEqual:](cellHeaderViewModel, "isEqual:")) {
      goto LABEL_39;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 120) & 2) == 0 || self->_originalEventDateData != *((double *)v4 + 2)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 120) & 2) != 0)
  {
    goto LABEL_39;
  }
  pregnancyLabelValue = self->_pregnancyLabelValue;
  if ((unint64_t)pregnancyLabelValue | *((void *)v4 + 11)) {
    char v16 = -[NSString isEqual:](pregnancyLabelValue, "isEqual:");
  }
  else {
    char v16 = 1;
  }
LABEL_40:

  return v16;
}

- (unint64_t)hash
{
  NSUInteger v24 = [(NSString *)self->_trendDescription hash];
  NSUInteger v23 = [(NSString *)self->_changeTypeRawValue hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v22 = 2654435761 * self->_diagramStyle;
  }
  else {
    uint64_t v22 = 0;
  }
  NSUInteger v21 = [(NSString *)self->_objectTypeIdentifier hash];
  NSUInteger v20 = [(NSString *)self->_coveredDateRangeRawValue hash];
  unint64_t v3 = [(HKCodableSummaryTrendLineViewModel *)self->_baseTrendLine hash];
  unint64_t v4 = [(HKCodableSummaryTrendLineViewModel *)self->_changeTrendLine hash];
  uint64_t v5 = [(NSMutableArray *)self->_visualizationPoints hash];
  NSUInteger v6 = [(NSString *)self->_notificationIdentifier hash];
  if (*(unsigned char *)&self->_has)
  {
    double discoveryDateData = self->_discoveryDateData;
    double v9 = -discoveryDateData;
    if (discoveryDateData >= 0.0) {
      double v9 = self->_discoveryDateData;
    }
    long double v10 = floor(v9 + 0.5);
    double v11 = (v9 - v10) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v7 += (unint64_t)v11;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  NSUInteger v12 = [(NSString *)self->_trendDescriptionSharingPreviewOverride hash];
  unint64_t v13 = [(HKCodableCellHeaderViewModel *)self->_cellHeaderViewModel hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    double originalEventDateData = self->_originalEventDateData;
    double v16 = -originalEventDateData;
    if (originalEventDateData >= 0.0) {
      double v16 = self->_originalEventDateData;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  return v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v12 ^ v13 ^ v14 ^ [(NSString *)self->_pregnancyLabelValue hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 12)) {
    -[HKCodableSummaryTrendTileViewModel setTrendDescription:](self, "setTrendDescription:");
  }
  if (*((void *)v4 + 6)) {
    -[HKCodableSummaryTrendTileViewModel setChangeTypeRawValue:](self, "setChangeTypeRawValue:");
  }
  if ((*((unsigned char *)v4 + 120) & 4) != 0)
  {
    self->_uint64_t diagramStyle = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 10)) {
    -[HKCodableSummaryTrendTileViewModel setObjectTypeIdentifier:](self, "setObjectTypeIdentifier:");
  }
  if (*((void *)v4 + 7)) {
    -[HKCodableSummaryTrendTileViewModel setCoveredDateRangeRawValue:](self, "setCoveredDateRangeRawValue:");
  }
  baseTrendLine = self->_baseTrendLine;
  uint64_t v6 = *((void *)v4 + 3);
  if (baseTrendLine)
  {
    if (v6) {
      -[HKCodableSummaryTrendLineViewModel mergeFrom:](baseTrendLine, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[HKCodableSummaryTrendTileViewModel setBaseTrendLine:](self, "setBaseTrendLine:");
  }
  changeTrendLine = self->_changeTrendLine;
  uint64_t v8 = *((void *)v4 + 5);
  if (changeTrendLine)
  {
    if (v8) {
      -[HKCodableSummaryTrendLineViewModel mergeFrom:](changeTrendLine, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[HKCodableSummaryTrendTileViewModel setChangeTrendLine:](self, "setChangeTrendLine:");
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = *((id *)v4 + 14);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        -[HKCodableSummaryTrendTileViewModel addVisualizationPoints:](self, "addVisualizationPoints:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  if (*((void *)v4 + 9)) {
    -[HKCodableSummaryTrendTileViewModel setNotificationIdentifier:](self, "setNotificationIdentifier:");
  }
  if (*((unsigned char *)v4 + 120))
  {
    self->_double discoveryDateData = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 13)) {
    -[HKCodableSummaryTrendTileViewModel setTrendDescriptionSharingPreviewOverride:](self, "setTrendDescriptionSharingPreviewOverride:");
  }
  cellHeaderViewModel = self->_cellHeaderViewModel;
  uint64_t v15 = *((void *)v4 + 4);
  if (cellHeaderViewModel)
  {
    if (v15) {
      -[HKCodableCellHeaderViewModel mergeFrom:](cellHeaderViewModel, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[HKCodableSummaryTrendTileViewModel setCellHeaderViewModel:](self, "setCellHeaderViewModel:");
  }
  if ((*((unsigned char *)v4 + 120) & 2) != 0)
  {
    self->_double originalEventDateData = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 11)) {
    -[HKCodableSummaryTrendTileViewModel setPregnancyLabelValue:](self, "setPregnancyLabelValue:");
  }
}

- (NSString)trendDescription
{
  return self->_trendDescription;
}

- (void)setTrendDescription:(id)a3
{
}

- (NSString)changeTypeRawValue
{
  return self->_changeTypeRawValue;
}

- (void)setChangeTypeRawValue:(id)a3
{
}

- (NSString)objectTypeIdentifier
{
  return self->_objectTypeIdentifier;
}

- (void)setObjectTypeIdentifier:(id)a3
{
}

- (NSString)coveredDateRangeRawValue
{
  return self->_coveredDateRangeRawValue;
}

- (void)setCoveredDateRangeRawValue:(id)a3
{
}

- (HKCodableSummaryTrendLineViewModel)baseTrendLine
{
  return self->_baseTrendLine;
}

- (void)setBaseTrendLine:(id)a3
{
}

- (HKCodableSummaryTrendLineViewModel)changeTrendLine
{
  return self->_changeTrendLine;
}

- (void)setChangeTrendLine:(id)a3
{
}

- (NSMutableArray)visualizationPoints
{
  return self->_visualizationPoints;
}

- (void)setVisualizationPoints:(id)a3
{
}

- (NSString)notificationIdentifier
{
  return self->_notificationIdentifier;
}

- (void)setNotificationIdentifier:(id)a3
{
}

- (double)discoveryDateData
{
  return self->_discoveryDateData;
}

- (double)originalEventDateData
{
  return self->_originalEventDateData;
}

- (NSString)trendDescriptionSharingPreviewOverride
{
  return self->_trendDescriptionSharingPreviewOverride;
}

- (void)setTrendDescriptionSharingPreviewOverride:(id)a3
{
}

- (HKCodableCellHeaderViewModel)cellHeaderViewModel
{
  return self->_cellHeaderViewModel;
}

- (void)setCellHeaderViewModel:(id)a3
{
}

- (NSString)pregnancyLabelValue
{
  return self->_pregnancyLabelValue;
}

- (void)setPregnancyLabelValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualizationPoints, 0);
  objc_storeStrong((id *)&self->_trendDescriptionSharingPreviewOverride, 0);
  objc_storeStrong((id *)&self->_trendDescription, 0);
  objc_storeStrong((id *)&self->_pregnancyLabelValue, 0);
  objc_storeStrong((id *)&self->_objectTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationIdentifier, 0);
  objc_storeStrong((id *)&self->_coveredDateRangeRawValue, 0);
  objc_storeStrong((id *)&self->_changeTypeRawValue, 0);
  objc_storeStrong((id *)&self->_changeTrendLine, 0);
  objc_storeStrong((id *)&self->_cellHeaderViewModel, 0);
  objc_storeStrong((id *)&self->_baseTrendLine, 0);
}

@end