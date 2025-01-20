@interface HDCodableMedicationShareableModel
+ (Class)ingredientComponentStringsType;
+ (Class)monthHighlightsType;
- (BOOL)archived;
- (BOOL)hasArchived;
- (BOOL)hasAudienceRawValue;
- (BOOL)hasBaseUnitStrength;
- (BOOL)hasBasicDoseForm;
- (BOOL)hasBrandName;
- (BOOL)hasChartSeries;
- (BOOL)hasConceptIdentifier;
- (BOOL)hasEduContentString;
- (BOOL)hasFreeTextMedicationForm;
- (BOOL)hasFreeTextMedicationLoggingUnit;
- (BOOL)hasFreeTextMedicationName;
- (BOOL)hasFreeTextMedicationStrengthQuantity;
- (BOOL)hasGenericName;
- (BOOL)hasIsLactationDescriptionCritical;
- (BOOL)hasIsPregnancyDescriptionCritical;
- (BOOL)hasLactationDescriptionContentString;
- (BOOL)hasLatestSupportedVersion;
- (BOOL)hasManufacturedDoseForm;
- (BOOL)hasMedicationVisualizationConfigJSONString;
- (BOOL)hasMinimumSupportedVersion;
- (BOOL)hasMostRecentDose;
- (BOOL)hasOntologyLoggingUnitPlural;
- (BOOL)hasOntologyLoggingUnitSingular;
- (BOOL)hasPreferredName;
- (BOOL)hasPregnancyDescriptionContentString;
- (BOOL)hasSchedule;
- (BOOL)hasSideEffectsContentString;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLactationDescriptionCritical;
- (BOOL)isPregnancyDescriptionCritical;
- (BOOL)readFrom:(id)a3;
- (HDCodableMedicationChartSeries)chartSeries;
- (HDCodableMedicationDoseEvent)mostRecentDose;
- (HDCodableMedicationSchedule)schedule;
- (HDCodableQuantity)freeTextMedicationStrengthQuantity;
- (NSMutableArray)ingredientComponentStrings;
- (NSMutableArray)monthHighlights;
- (NSString)audienceRawValue;
- (NSString)baseUnitStrength;
- (NSString)basicDoseForm;
- (NSString)brandName;
- (NSString)conceptIdentifier;
- (NSString)eduContentString;
- (NSString)freeTextMedicationName;
- (NSString)genericName;
- (NSString)lactationDescriptionContentString;
- (NSString)manufacturedDoseForm;
- (NSString)medicationVisualizationConfigJSONString;
- (NSString)ontologyLoggingUnitPlural;
- (NSString)ontologyLoggingUnitSingular;
- (NSString)preferredName;
- (NSString)pregnancyDescriptionContentString;
- (NSString)sideEffectsContentString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)ingredientComponentStringsAtIndex:(unint64_t)a3;
- (id)monthHighlightsAtIndex:(unint64_t)a3;
- (int64_t)freeTextMedicationForm;
- (int64_t)freeTextMedicationLoggingUnit;
- (int64_t)latestSupportedVersion;
- (int64_t)minimumSupportedVersion;
- (unint64_t)hash;
- (unint64_t)ingredientComponentStringsCount;
- (unint64_t)monthHighlightsCount;
- (void)addIngredientComponentStrings:(id)a3;
- (void)addMonthHighlights:(id)a3;
- (void)clearIngredientComponentStrings;
- (void)clearMonthHighlights;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArchived:(BOOL)a3;
- (void)setAudienceRawValue:(id)a3;
- (void)setBaseUnitStrength:(id)a3;
- (void)setBasicDoseForm:(id)a3;
- (void)setBrandName:(id)a3;
- (void)setChartSeries:(id)a3;
- (void)setConceptIdentifier:(id)a3;
- (void)setEduContentString:(id)a3;
- (void)setFreeTextMedicationForm:(int64_t)a3;
- (void)setFreeTextMedicationLoggingUnit:(int64_t)a3;
- (void)setFreeTextMedicationName:(id)a3;
- (void)setFreeTextMedicationStrengthQuantity:(id)a3;
- (void)setGenericName:(id)a3;
- (void)setHasArchived:(BOOL)a3;
- (void)setHasFreeTextMedicationForm:(BOOL)a3;
- (void)setHasFreeTextMedicationLoggingUnit:(BOOL)a3;
- (void)setHasIsLactationDescriptionCritical:(BOOL)a3;
- (void)setHasIsPregnancyDescriptionCritical:(BOOL)a3;
- (void)setHasLatestSupportedVersion:(BOOL)a3;
- (void)setHasMinimumSupportedVersion:(BOOL)a3;
- (void)setIngredientComponentStrings:(id)a3;
- (void)setIsLactationDescriptionCritical:(BOOL)a3;
- (void)setIsPregnancyDescriptionCritical:(BOOL)a3;
- (void)setLactationDescriptionContentString:(id)a3;
- (void)setLatestSupportedVersion:(int64_t)a3;
- (void)setManufacturedDoseForm:(id)a3;
- (void)setMedicationVisualizationConfigJSONString:(id)a3;
- (void)setMinimumSupportedVersion:(int64_t)a3;
- (void)setMonthHighlights:(id)a3;
- (void)setMostRecentDose:(id)a3;
- (void)setOntologyLoggingUnitPlural:(id)a3;
- (void)setOntologyLoggingUnitSingular:(id)a3;
- (void)setPreferredName:(id)a3;
- (void)setPregnancyDescriptionContentString:(id)a3;
- (void)setSchedule:(id)a3;
- (void)setSideEffectsContentString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableMedicationShareableModel

- (NSString)audienceRawValue
{
  return self->_audienceRawValue;
}

- (NSString)conceptIdentifier
{
  return self->_conceptIdentifier;
}

- (void)setSideEffectsContentString:(id)a3
{
}

- (void)setSchedule:(id)a3
{
}

- (void)setPregnancyDescriptionContentString:(id)a3
{
}

- (void)setPreferredName:(id)a3
{
}

- (void)setOntologyLoggingUnitSingular:(id)a3
{
}

- (void)setOntologyLoggingUnitPlural:(id)a3
{
}

- (void)setMostRecentDose:(id)a3
{
}

- (void)setMedicationVisualizationConfigJSONString:(id)a3
{
}

- (void)setManufacturedDoseForm:(id)a3
{
}

- (void)setLactationDescriptionContentString:(id)a3
{
}

- (void)setIngredientComponentStrings:(id)a3
{
}

- (void)setGenericName:(id)a3
{
}

- (void)setFreeTextMedicationStrengthQuantity:(id)a3
{
}

- (void)setFreeTextMedicationName:(id)a3
{
}

- (void)setEduContentString:(id)a3
{
}

- (void)setConceptIdentifier:(id)a3
{
}

- (void)setChartSeries:(id)a3
{
}

- (void)setBrandName:(id)a3
{
}

- (void)setBasicDoseForm:(id)a3
{
}

- (void)setBaseUnitStrength:(id)a3
{
}

- (void)setAudienceRawValue:(id)a3
{
}

- (BOOL)hasConceptIdentifier
{
  return self->_conceptIdentifier != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sideEffectsContentString, 0);
  objc_storeStrong((id *)&self->_schedule, 0);
  objc_storeStrong((id *)&self->_pregnancyDescriptionContentString, 0);
  objc_storeStrong((id *)&self->_preferredName, 0);
  objc_storeStrong((id *)&self->_ontologyLoggingUnitSingular, 0);
  objc_storeStrong((id *)&self->_ontologyLoggingUnitPlural, 0);
  objc_storeStrong((id *)&self->_mostRecentDose, 0);
  objc_storeStrong((id *)&self->_monthHighlights, 0);
  objc_storeStrong((id *)&self->_medicationVisualizationConfigJSONString, 0);
  objc_storeStrong((id *)&self->_manufacturedDoseForm, 0);
  objc_storeStrong((id *)&self->_lactationDescriptionContentString, 0);
  objc_storeStrong((id *)&self->_ingredientComponentStrings, 0);
  objc_storeStrong((id *)&self->_genericName, 0);
  objc_storeStrong((id *)&self->_freeTextMedicationStrengthQuantity, 0);
  objc_storeStrong((id *)&self->_freeTextMedicationName, 0);
  objc_storeStrong((id *)&self->_eduContentString, 0);
  objc_storeStrong((id *)&self->_conceptIdentifier, 0);
  objc_storeStrong((id *)&self->_chartSeries, 0);
  objc_storeStrong((id *)&self->_brandName, 0);
  objc_storeStrong((id *)&self->_basicDoseForm, 0);
  objc_storeStrong((id *)&self->_baseUnitStrength, 0);
  objc_storeStrong((id *)&self->_audienceRawValue, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_conceptIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_audienceRawValue) {
    PBDataWriterWriteStringField();
  }
  if (self->_baseUnitStrength) {
    PBDataWriterWriteStringField();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_ingredientComponentStrings;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  if (self->_ontologyLoggingUnitSingular) {
    PBDataWriterWriteStringField();
  }
  if (self->_ontologyLoggingUnitPlural) {
    PBDataWriterWriteStringField();
  }
  if (self->_eduContentString) {
    PBDataWriterWriteStringField();
  }
  if (self->_sideEffectsContentString) {
    PBDataWriterWriteStringField();
  }
  if (self->_medicationVisualizationConfigJSONString) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_schedule) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_mostRecentDose) {
    PBDataWriterWriteSubmessage();
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v10 = self->_monthHighlights;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }

  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_39:
      if ((has & 8) == 0) {
        goto LABEL_41;
      }
      goto LABEL_40;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_39;
  }
  PBDataWriterWriteInt64Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_40:
  }
    PBDataWriterWriteInt64Field();
LABEL_41:
  if (self->_chartSeries) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_preferredName) {
    PBDataWriterWriteStringField();
  }
  if (self->_brandName) {
    PBDataWriterWriteStringField();
  }
  if (self->_genericName) {
    PBDataWriterWriteStringField();
  }
  if (self->_manufacturedDoseForm) {
    PBDataWriterWriteStringField();
  }
  if (self->_basicDoseForm) {
    PBDataWriterWriteStringField();
  }
  if (self->_freeTextMedicationName) {
    PBDataWriterWriteStringField();
  }
  if (self->_freeTextMedicationStrengthQuantity) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_pregnancyDescriptionContentString) {
    PBDataWriterWriteStringField();
  }
  if (self->_lactationDescriptionContentString) {
    PBDataWriterWriteStringField();
  }
  char v16 = (char)self->_has;
  if ((v16 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v16 = (char)self->_has;
  }
  if ((v16 & 0x20) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)setMinimumSupportedVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_minimumSupportedVersion = a3;
}

- (void)setLatestSupportedVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_latestSupportedVersion = a3;
}

- (void)setIsPregnancyDescriptionCritical:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_isPregnancyDescriptionCritical = a3;
}

- (void)setIsLactationDescriptionCritical:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_isLactationDescriptionCritical = a3;
}

- (void)setArchived:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_archived = a3;
}

- (BOOL)hasFreeTextMedicationStrengthQuantity
{
  return self->_freeTextMedicationStrengthQuantity != 0;
}

- (NSString)manufacturedDoseForm
{
  return self->_manufacturedDoseForm;
}

- (NSString)genericName
{
  return self->_genericName;
}

- (NSString)freeTextMedicationName
{
  return self->_freeTextMedicationName;
}

- (NSString)brandName
{
  return self->_brandName;
}

- (NSString)baseUnitStrength
{
  return self->_baseUnitStrength;
}

- (BOOL)hasAudienceRawValue
{
  return self->_audienceRawValue != 0;
}

- (BOOL)hasBaseUnitStrength
{
  return self->_baseUnitStrength != 0;
}

- (void)clearIngredientComponentStrings
{
}

- (void)addIngredientComponentStrings:(id)a3
{
  id v4 = a3;
  ingredientComponentStrings = self->_ingredientComponentStrings;
  id v8 = v4;
  if (!ingredientComponentStrings)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_ingredientComponentStrings;
    self->_ingredientComponentStrings = v6;

    id v4 = v8;
    ingredientComponentStrings = self->_ingredientComponentStrings;
  }
  [(NSMutableArray *)ingredientComponentStrings addObject:v4];
}

- (unint64_t)ingredientComponentStringsCount
{
  return [(NSMutableArray *)self->_ingredientComponentStrings count];
}

- (id)ingredientComponentStringsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_ingredientComponentStrings objectAtIndex:a3];
}

+ (Class)ingredientComponentStringsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasOntologyLoggingUnitSingular
{
  return self->_ontologyLoggingUnitSingular != 0;
}

- (BOOL)hasOntologyLoggingUnitPlural
{
  return self->_ontologyLoggingUnitPlural != 0;
}

- (BOOL)hasEduContentString
{
  return self->_eduContentString != 0;
}

- (BOOL)hasSideEffectsContentString
{
  return self->_sideEffectsContentString != 0;
}

- (BOOL)hasMedicationVisualizationConfigJSONString
{
  return self->_medicationVisualizationConfigJSONString != 0;
}

- (void)setFreeTextMedicationForm:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_freeTextMedicationForm = a3;
}

- (void)setHasFreeTextMedicationForm:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFreeTextMedicationForm
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setFreeTextMedicationLoggingUnit:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_freeTextMedicationLoggingUnit = a3;
}

- (void)setHasFreeTextMedicationLoggingUnit:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFreeTextMedicationLoggingUnit
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasSchedule
{
  return self->_schedule != 0;
}

- (BOOL)hasMostRecentDose
{
  return self->_mostRecentDose != 0;
}

- (void)clearMonthHighlights
{
}

- (void)addMonthHighlights:(id)a3
{
  id v4 = a3;
  monthHighlights = self->_monthHighlights;
  id v8 = v4;
  if (!monthHighlights)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_monthHighlights;
    self->_monthHighlights = v6;

    id v4 = v8;
    monthHighlights = self->_monthHighlights;
  }
  [(NSMutableArray *)monthHighlights addObject:v4];
}

- (unint64_t)monthHighlightsCount
{
  return [(NSMutableArray *)self->_monthHighlights count];
}

- (id)monthHighlightsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_monthHighlights objectAtIndex:a3];
}

+ (Class)monthHighlightsType
{
  return (Class)objc_opt_class();
}

- (void)setHasArchived:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasArchived
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasLatestSupportedVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLatestSupportedVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasMinimumSupportedVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMinimumSupportedVersion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasChartSeries
{
  return self->_chartSeries != 0;
}

- (BOOL)hasPreferredName
{
  return self->_preferredName != 0;
}

- (BOOL)hasBrandName
{
  return self->_brandName != 0;
}

- (BOOL)hasGenericName
{
  return self->_genericName != 0;
}

- (BOOL)hasManufacturedDoseForm
{
  return self->_manufacturedDoseForm != 0;
}

- (BOOL)hasBasicDoseForm
{
  return self->_basicDoseForm != 0;
}

- (BOOL)hasFreeTextMedicationName
{
  return self->_freeTextMedicationName != 0;
}

- (BOOL)hasPregnancyDescriptionContentString
{
  return self->_pregnancyDescriptionContentString != 0;
}

- (BOOL)hasLactationDescriptionContentString
{
  return self->_lactationDescriptionContentString != 0;
}

- (void)setHasIsPregnancyDescriptionCritical:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsPregnancyDescriptionCritical
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasIsLactationDescriptionCritical:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsLactationDescriptionCritical
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableMedicationShareableModel;
  id v4 = [(HDCodableMedicationShareableModel *)&v8 description];
  v5 = [(HDCodableMedicationShareableModel *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  conceptIdentifier = self->_conceptIdentifier;
  if (conceptIdentifier) {
    [v3 setObject:conceptIdentifier forKey:@"conceptIdentifier"];
  }
  audienceRawValue = self->_audienceRawValue;
  if (audienceRawValue) {
    [v4 setObject:audienceRawValue forKey:@"audienceRawValue"];
  }
  baseUnitStrength = self->_baseUnitStrength;
  if (baseUnitStrength) {
    [v4 setObject:baseUnitStrength forKey:@"baseUnitStrength"];
  }
  ingredientComponentStrings = self->_ingredientComponentStrings;
  if (ingredientComponentStrings) {
    [v4 setObject:ingredientComponentStrings forKey:@"ingredientComponentStrings"];
  }
  ontologyLoggingUnitSingular = self->_ontologyLoggingUnitSingular;
  if (ontologyLoggingUnitSingular) {
    [v4 setObject:ontologyLoggingUnitSingular forKey:@"ontologyLoggingUnitSingular"];
  }
  ontologyLoggingUnitPlural = self->_ontologyLoggingUnitPlural;
  if (ontologyLoggingUnitPlural) {
    [v4 setObject:ontologyLoggingUnitPlural forKey:@"ontologyLoggingUnitPlural"];
  }
  eduContentString = self->_eduContentString;
  if (eduContentString) {
    [v4 setObject:eduContentString forKey:@"eduContentString"];
  }
  sideEffectsContentString = self->_sideEffectsContentString;
  if (sideEffectsContentString) {
    [v4 setObject:sideEffectsContentString forKey:@"sideEffectsContentString"];
  }
  medicationVisualizationConfigJSONString = self->_medicationVisualizationConfigJSONString;
  if (medicationVisualizationConfigJSONString) {
    [v4 setObject:medicationVisualizationConfigJSONString forKey:@"medicationVisualizationConfigJSONString"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v15 = [MEMORY[0x1E4F28ED0] numberWithLongLong:self->_freeTextMedicationForm];
    [v4 setObject:v15 forKey:@"freeTextMedicationForm"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    char v16 = [MEMORY[0x1E4F28ED0] numberWithLongLong:self->_freeTextMedicationLoggingUnit];
    [v4 setObject:v16 forKey:@"freeTextMedicationLoggingUnit"];
  }
  schedule = self->_schedule;
  if (schedule)
  {
    long long v18 = [(HDCodableMedicationSchedule *)schedule dictionaryRepresentation];
    [v4 setObject:v18 forKey:@"schedule"];
  }
  mostRecentDose = self->_mostRecentDose;
  if (mostRecentDose)
  {
    long long v20 = [(HDCodableMedicationDoseEvent *)mostRecentDose dictionaryRepresentation];
    [v4 setObject:v20 forKey:@"mostRecentDose"];
  }
  if ([(NSMutableArray *)self->_monthHighlights count])
  {
    long long v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_monthHighlights, "count"));
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v22 = self->_monthHighlights;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v49 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * i), "dictionaryRepresentation", (void)v48);
          [v21 addObject:v27];
        }
        uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v48 objects:v52 count:16];
      }
      while (v24);
    }

    [v4 setObject:v21 forKey:@"monthHighlights"];
  }
  char v28 = (char)self->_has;
  if ((v28 & 0x10) != 0)
  {
    v46 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_archived];
    [v4 setObject:v46 forKey:@"archived"];

    char v28 = (char)self->_has;
    if ((v28 & 4) == 0)
    {
LABEL_38:
      if ((v28 & 8) == 0) {
        goto LABEL_40;
      }
      goto LABEL_39;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_38;
  }
  v47 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", self->_latestSupportedVersion, (void)v48);
  [v4 setObject:v47 forKey:@"latestSupportedVersion"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_39:
    v29 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", self->_minimumSupportedVersion, (void)v48);
    [v4 setObject:v29 forKey:@"minimumSupportedVersion"];
  }
LABEL_40:
  chartSeries = self->_chartSeries;
  if (chartSeries)
  {
    v31 = [(HDCodableMedicationChartSeries *)chartSeries dictionaryRepresentation];
    [v4 setObject:v31 forKey:@"chartSeries"];
  }
  preferredName = self->_preferredName;
  if (preferredName) {
    [v4 setObject:preferredName forKey:@"preferredName"];
  }
  brandName = self->_brandName;
  if (brandName) {
    [v4 setObject:brandName forKey:@"brandName"];
  }
  genericName = self->_genericName;
  if (genericName) {
    [v4 setObject:genericName forKey:@"genericName"];
  }
  manufacturedDoseForm = self->_manufacturedDoseForm;
  if (manufacturedDoseForm) {
    [v4 setObject:manufacturedDoseForm forKey:@"manufacturedDoseForm"];
  }
  basicDoseForm = self->_basicDoseForm;
  if (basicDoseForm) {
    [v4 setObject:basicDoseForm forKey:@"basicDoseForm"];
  }
  freeTextMedicationName = self->_freeTextMedicationName;
  if (freeTextMedicationName) {
    [v4 setObject:freeTextMedicationName forKey:@"freeTextMedicationName"];
  }
  freeTextMedicationStrengthQuantity = self->_freeTextMedicationStrengthQuantity;
  if (freeTextMedicationStrengthQuantity)
  {
    v39 = [(HDCodableQuantity *)freeTextMedicationStrengthQuantity dictionaryRepresentation];
    [v4 setObject:v39 forKey:@"freeTextMedicationStrengthQuantity"];
  }
  pregnancyDescriptionContentString = self->_pregnancyDescriptionContentString;
  if (pregnancyDescriptionContentString) {
    [v4 setObject:pregnancyDescriptionContentString forKey:@"pregnancyDescriptionContentString"];
  }
  lactationDescriptionContentString = self->_lactationDescriptionContentString;
  if (lactationDescriptionContentString) {
    [v4 setObject:lactationDescriptionContentString forKey:@"lactationDescriptionContentString"];
  }
  char v42 = (char)self->_has;
  if ((v42 & 0x40) != 0)
  {
    v43 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isPregnancyDescriptionCritical];
    [v4 setObject:v43 forKey:@"isPregnancyDescriptionCritical"];

    char v42 = (char)self->_has;
  }
  if ((v42 & 0x20) != 0)
  {
    v44 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isLactationDescriptionCritical];
    [v4 setObject:v44 forKey:@"isLactationDescriptionCritical"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableMedicationShareableModelReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v16 = a3;
  if (self->_conceptIdentifier) {
    objc_msgSend(v16, "setConceptIdentifier:");
  }
  if (self->_audienceRawValue) {
    objc_msgSend(v16, "setAudienceRawValue:");
  }
  if (self->_baseUnitStrength) {
    objc_msgSend(v16, "setBaseUnitStrength:");
  }
  if ([(HDCodableMedicationShareableModel *)self ingredientComponentStringsCount])
  {
    [v16 clearIngredientComponentStrings];
    unint64_t v4 = [(HDCodableMedicationShareableModel *)self ingredientComponentStringsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HDCodableMedicationShareableModel *)self ingredientComponentStringsAtIndex:i];
        [v16 addIngredientComponentStrings:v7];
      }
    }
  }
  if (self->_ontologyLoggingUnitSingular) {
    objc_msgSend(v16, "setOntologyLoggingUnitSingular:");
  }
  objc_super v8 = v16;
  if (self->_ontologyLoggingUnitPlural)
  {
    objc_msgSend(v16, "setOntologyLoggingUnitPlural:");
    objc_super v8 = v16;
  }
  if (self->_eduContentString)
  {
    objc_msgSend(v16, "setEduContentString:");
    objc_super v8 = v16;
  }
  if (self->_sideEffectsContentString)
  {
    objc_msgSend(v16, "setSideEffectsContentString:");
    objc_super v8 = v16;
  }
  if (self->_medicationVisualizationConfigJSONString)
  {
    objc_msgSend(v16, "setMedicationVisualizationConfigJSONString:");
    objc_super v8 = v16;
  }
  if (*(unsigned char *)&self->_has)
  {
    v8[1] = self->_freeTextMedicationForm;
    *((unsigned char *)v8 + 220) |= 1u;
  }
  if (self->_schedule) {
    objc_msgSend(v16, "setSchedule:");
  }
  if (self->_mostRecentDose) {
    objc_msgSend(v16, "setMostRecentDose:");
  }
  if ([(HDCodableMedicationShareableModel *)self monthHighlightsCount])
  {
    [v16 clearMonthHighlights];
    unint64_t v9 = [(HDCodableMedicationShareableModel *)self monthHighlightsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(HDCodableMedicationShareableModel *)self monthHighlightsAtIndex:j];
        [v16 addMonthHighlights:v12];
      }
    }
  }
  char has = (char)self->_has;
  v14 = v16;
  if ((has & 0x10) != 0)
  {
    *((unsigned char *)v16 + 216) = self->_archived;
    *((unsigned char *)v16 + 220) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_33:
      if ((has & 8) == 0) {
        goto LABEL_35;
      }
      goto LABEL_34;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_33;
  }
  *((void *)v16 + 3) = self->_latestSupportedVersion;
  *((unsigned char *)v16 + 220) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_34:
    *((void *)v16 + 4) = self->_minimumSupportedVersion;
    *((unsigned char *)v16 + 220) |= 8u;
  }
LABEL_35:
  if (self->_chartSeries)
  {
    objc_msgSend(v16, "setChartSeries:");
    v14 = v16;
  }
  if (self->_preferredName)
  {
    objc_msgSend(v16, "setPreferredName:");
    v14 = v16;
  }
  if (self->_brandName)
  {
    objc_msgSend(v16, "setBrandName:");
    v14 = v16;
  }
  if (self->_genericName)
  {
    objc_msgSend(v16, "setGenericName:");
    v14 = v16;
  }
  if (self->_manufacturedDoseForm)
  {
    objc_msgSend(v16, "setManufacturedDoseForm:");
    v14 = v16;
  }
  if (self->_basicDoseForm)
  {
    objc_msgSend(v16, "setBasicDoseForm:");
    v14 = v16;
  }
  if (self->_freeTextMedicationName)
  {
    objc_msgSend(v16, "setFreeTextMedicationName:");
    v14 = v16;
  }
  if (self->_freeTextMedicationStrengthQuantity)
  {
    objc_msgSend(v16, "setFreeTextMedicationStrengthQuantity:");
    v14 = v16;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v14[2] = self->_freeTextMedicationLoggingUnit;
    *((unsigned char *)v14 + 220) |= 2u;
  }
  if (self->_pregnancyDescriptionContentString)
  {
    objc_msgSend(v16, "setPregnancyDescriptionContentString:");
    v14 = v16;
  }
  if (self->_lactationDescriptionContentString)
  {
    objc_msgSend(v16, "setLactationDescriptionContentString:");
    v14 = v16;
  }
  char v15 = (char)self->_has;
  if ((v15 & 0x40) != 0)
  {
    *((unsigned char *)v14 + 218) = self->_isPregnancyDescriptionCritical;
    *((unsigned char *)v14 + 220) |= 0x40u;
    char v15 = (char)self->_has;
  }
  if ((v15 & 0x20) != 0)
  {
    *((unsigned char *)v14 + 217) = self->_isLactationDescriptionCritical;
    *((unsigned char *)v14 + 220) |= 0x20u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_conceptIdentifier copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v6;

  uint64_t v8 = [(NSString *)self->_audienceRawValue copyWithZone:a3];
  unint64_t v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  uint64_t v10 = [(NSString *)self->_baseUnitStrength copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v12 = self->_ingredientComponentStrings;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v65 objects:v70 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v66 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = (void *)[*(id *)(*((void *)&v65 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addIngredientComponentStrings:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v65 objects:v70 count:16];
    }
    while (v14);
  }

  uint64_t v18 = [(NSString *)self->_ontologyLoggingUnitSingular copyWithZone:a3];
  long long v19 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v18;

  uint64_t v20 = [(NSString *)self->_ontologyLoggingUnitPlural copyWithZone:a3];
  long long v21 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v20;

  uint64_t v22 = [(NSString *)self->_eduContentString copyWithZone:a3];
  uint64_t v23 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v22;

  uint64_t v24 = [(NSString *)self->_sideEffectsContentString copyWithZone:a3];
  uint64_t v25 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v24;

  uint64_t v26 = [(NSString *)self->_medicationVisualizationConfigJSONString copyWithZone:a3];
  uint64_t v27 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v26;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_freeTextMedicationForm;
    *(unsigned char *)(v5 + 220) |= 1u;
  }
  id v28 = [(HDCodableMedicationSchedule *)self->_schedule copyWithZone:a3];
  v29 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v28;

  uint64_t v30 = [(HDCodableMedicationDoseEvent *)self->_mostRecentDose copyWithZone:a3];
  v31 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v30;

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v32 = self->_monthHighlights;
  uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v61 objects:v69 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v62;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v62 != v35) {
          objc_enumerationMutation(v32);
        }
        v37 = objc_msgSend(*(id *)(*((void *)&v61 + 1) + 8 * j), "copyWithZone:", a3, (void)v61);
        [(id)v5 addMonthHighlights:v37];
      }
      uint64_t v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v61 objects:v69 count:16];
    }
    while (v34);
  }

  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 216) = self->_archived;
    *(unsigned char *)(v5 + 220) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_19:
      if ((has & 8) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_19;
  }
  *(void *)(v5 + 24) = self->_latestSupportedVersion;
  *(unsigned char *)(v5 + 220) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_20:
    *(void *)(v5 + 32) = self->_minimumSupportedVersion;
    *(unsigned char *)(v5 + 220) |= 8u;
  }
LABEL_21:
  id v39 = -[HDCodableMedicationChartSeries copyWithZone:](self->_chartSeries, "copyWithZone:", a3, (void)v61);
  v40 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v39;

  uint64_t v41 = [(NSString *)self->_preferredName copyWithZone:a3];
  char v42 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v41;

  uint64_t v43 = [(NSString *)self->_brandName copyWithZone:a3];
  v44 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v43;

  uint64_t v45 = [(NSString *)self->_genericName copyWithZone:a3];
  v46 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v45;

  uint64_t v47 = [(NSString *)self->_manufacturedDoseForm copyWithZone:a3];
  long long v48 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v47;

  uint64_t v49 = [(NSString *)self->_basicDoseForm copyWithZone:a3];
  long long v50 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v49;

  uint64_t v51 = [(NSString *)self->_freeTextMedicationName copyWithZone:a3];
  v52 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v51;

  uint64_t v53 = [(HDCodableQuantity *)self->_freeTextMedicationStrengthQuantity copyWithZone:a3];
  v54 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v53;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_freeTextMedicationLoggingUnit;
    *(unsigned char *)(v5 + 220) |= 2u;
  }
  uint64_t v55 = [(NSString *)self->_pregnancyDescriptionContentString copyWithZone:a3];
  v56 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v55;

  uint64_t v57 = [(NSString *)self->_lactationDescriptionContentString copyWithZone:a3];
  v58 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v57;

  char v59 = (char)self->_has;
  if ((v59 & 0x40) != 0)
  {
    *(unsigned char *)(v5 + 218) = self->_isPregnancyDescriptionCritical;
    *(unsigned char *)(v5 + 220) |= 0x40u;
    char v59 = (char)self->_has;
  }
  if ((v59 & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 217) = self->_isLactationDescriptionCritical;
    *(unsigned char *)(v5 + 220) |= 0x20u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_85;
  }
  conceptIdentifier = self->_conceptIdentifier;
  if ((unint64_t)conceptIdentifier | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](conceptIdentifier, "isEqual:")) {
      goto LABEL_85;
    }
  }
  audienceRawValue = self->_audienceRawValue;
  if ((unint64_t)audienceRawValue | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](audienceRawValue, "isEqual:")) {
      goto LABEL_85;
    }
  }
  baseUnitStrength = self->_baseUnitStrength;
  if ((unint64_t)baseUnitStrength | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](baseUnitStrength, "isEqual:")) {
      goto LABEL_85;
    }
  }
  ingredientComponentStrings = self->_ingredientComponentStrings;
  if ((unint64_t)ingredientComponentStrings | *((void *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](ingredientComponentStrings, "isEqual:")) {
      goto LABEL_85;
    }
  }
  ontologyLoggingUnitSingular = self->_ontologyLoggingUnitSingular;
  if ((unint64_t)ontologyLoggingUnitSingular | *((void *)v4 + 22))
  {
    if (!-[NSString isEqual:](ontologyLoggingUnitSingular, "isEqual:")) {
      goto LABEL_85;
    }
  }
  ontologyLoggingUnitPlural = self->_ontologyLoggingUnitPlural;
  if ((unint64_t)ontologyLoggingUnitPlural | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](ontologyLoggingUnitPlural, "isEqual:")) {
      goto LABEL_85;
    }
  }
  eduContentString = self->_eduContentString;
  if ((unint64_t)eduContentString | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](eduContentString, "isEqual:")) {
      goto LABEL_85;
    }
  }
  sideEffectsContentString = self->_sideEffectsContentString;
  if ((unint64_t)sideEffectsContentString | *((void *)v4 + 26))
  {
    if (!-[NSString isEqual:](sideEffectsContentString, "isEqual:")) {
      goto LABEL_85;
    }
  }
  medicationVisualizationConfigJSONString = self->_medicationVisualizationConfigJSONString;
  if ((unint64_t)medicationVisualizationConfigJSONString | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](medicationVisualizationConfigJSONString, "isEqual:")) {
      goto LABEL_85;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 220) & 1) == 0 || self->_freeTextMedicationForm != *((void *)v4 + 1)) {
      goto LABEL_85;
    }
  }
  else if (*((unsigned char *)v4 + 220))
  {
    goto LABEL_85;
  }
  schedule = self->_schedule;
  if ((unint64_t)schedule | *((void *)v4 + 25)
    && !-[HDCodableMedicationSchedule isEqual:](schedule, "isEqual:"))
  {
    goto LABEL_85;
  }
  mostRecentDose = self->_mostRecentDose;
  if ((unint64_t)mostRecentDose | *((void *)v4 + 20))
  {
    if (!-[HDCodableMedicationDoseEvent isEqual:](mostRecentDose, "isEqual:")) {
      goto LABEL_85;
    }
  }
  monthHighlights = self->_monthHighlights;
  if ((unint64_t)monthHighlights | *((void *)v4 + 19))
  {
    if (!-[NSMutableArray isEqual:](monthHighlights, "isEqual:")) {
      goto LABEL_85;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 220) & 0x10) == 0) {
      goto LABEL_85;
    }
    if (self->_archived)
    {
      if (!*((unsigned char *)v4 + 216)) {
        goto LABEL_85;
      }
    }
    else if (*((unsigned char *)v4 + 216))
    {
      goto LABEL_85;
    }
  }
  else if ((*((unsigned char *)v4 + 220) & 0x10) != 0)
  {
    goto LABEL_85;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 220) & 4) == 0 || self->_latestSupportedVersion != *((void *)v4 + 3)) {
      goto LABEL_85;
    }
  }
  else if ((*((unsigned char *)v4 + 220) & 4) != 0)
  {
    goto LABEL_85;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 220) & 8) == 0 || self->_minimumSupportedVersion != *((void *)v4 + 4)) {
      goto LABEL_85;
    }
  }
  else if ((*((unsigned char *)v4 + 220) & 8) != 0)
  {
    goto LABEL_85;
  }
  chartSeries = self->_chartSeries;
  if ((unint64_t)chartSeries | *((void *)v4 + 9)
    && !-[HDCodableMedicationChartSeries isEqual:](chartSeries, "isEqual:"))
  {
    goto LABEL_85;
  }
  preferredName = self->_preferredName;
  if ((unint64_t)preferredName | *((void *)v4 + 23))
  {
    if (!-[NSString isEqual:](preferredName, "isEqual:")) {
      goto LABEL_85;
    }
  }
  brandName = self->_brandName;
  if ((unint64_t)brandName | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](brandName, "isEqual:")) {
      goto LABEL_85;
    }
  }
  genericName = self->_genericName;
  if ((unint64_t)genericName | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](genericName, "isEqual:")) {
      goto LABEL_85;
    }
  }
  manufacturedDoseForm = self->_manufacturedDoseForm;
  if ((unint64_t)manufacturedDoseForm | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](manufacturedDoseForm, "isEqual:")) {
      goto LABEL_85;
    }
  }
  basicDoseForm = self->_basicDoseForm;
  if ((unint64_t)basicDoseForm | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](basicDoseForm, "isEqual:")) {
      goto LABEL_85;
    }
  }
  freeTextMedicationName = self->_freeTextMedicationName;
  if ((unint64_t)freeTextMedicationName | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](freeTextMedicationName, "isEqual:")) {
      goto LABEL_85;
    }
  }
  freeTextMedicationStrengthQuantity = self->_freeTextMedicationStrengthQuantity;
  if ((unint64_t)freeTextMedicationStrengthQuantity | *((void *)v4 + 13))
  {
    if (!-[HDCodableQuantity isEqual:](freeTextMedicationStrengthQuantity, "isEqual:")) {
      goto LABEL_85;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 220) & 2) == 0 || self->_freeTextMedicationLoggingUnit != *((void *)v4 + 2)) {
      goto LABEL_85;
    }
  }
  else if ((*((unsigned char *)v4 + 220) & 2) != 0)
  {
    goto LABEL_85;
  }
  pregnancyDescriptionContentString = self->_pregnancyDescriptionContentString;
  if ((unint64_t)pregnancyDescriptionContentString | *((void *)v4 + 24)
    && !-[NSString isEqual:](pregnancyDescriptionContentString, "isEqual:"))
  {
    goto LABEL_85;
  }
  lactationDescriptionContentString = self->_lactationDescriptionContentString;
  if ((unint64_t)lactationDescriptionContentString | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](lactationDescriptionContentString, "isEqual:")) {
      goto LABEL_85;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 220) & 0x40) == 0) {
      goto LABEL_85;
    }
    if (self->_isPregnancyDescriptionCritical)
    {
      if (!*((unsigned char *)v4 + 218)) {
        goto LABEL_85;
      }
    }
    else if (*((unsigned char *)v4 + 218))
    {
      goto LABEL_85;
    }
  }
  else if ((*((unsigned char *)v4 + 220) & 0x40) != 0)
  {
    goto LABEL_85;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 220) & 0x20) != 0)
    {
      if (self->_isLactationDescriptionCritical)
      {
        if (!*((unsigned char *)v4 + 217)) {
          goto LABEL_85;
        }
      }
      else if (*((unsigned char *)v4 + 217))
      {
        goto LABEL_85;
      }
      BOOL v27 = 1;
      goto LABEL_86;
    }
LABEL_85:
    BOOL v27 = 0;
    goto LABEL_86;
  }
  BOOL v27 = (*((unsigned char *)v4 + 220) & 0x20) == 0;
LABEL_86:

  return v27;
}

- (unint64_t)hash
{
  NSUInteger v32 = [(NSString *)self->_conceptIdentifier hash];
  NSUInteger v31 = [(NSString *)self->_audienceRawValue hash];
  NSUInteger v30 = [(NSString *)self->_baseUnitStrength hash];
  uint64_t v29 = [(NSMutableArray *)self->_ingredientComponentStrings hash];
  NSUInteger v28 = [(NSString *)self->_ontologyLoggingUnitSingular hash];
  NSUInteger v27 = [(NSString *)self->_ontologyLoggingUnitPlural hash];
  NSUInteger v26 = [(NSString *)self->_eduContentString hash];
  NSUInteger v25 = [(NSString *)self->_sideEffectsContentString hash];
  NSUInteger v24 = [(NSString *)self->_medicationVisualizationConfigJSONString hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v23 = 2654435761 * self->_freeTextMedicationForm;
  }
  else {
    uint64_t v23 = 0;
  }
  unint64_t v22 = [(HDCodableMedicationSchedule *)self->_schedule hash];
  uint64_t v21 = [(HDCodableMedicationDoseEvent *)self->_mostRecentDose hash];
  uint64_t v20 = [(NSMutableArray *)self->_monthHighlights hash];
  if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    uint64_t v19 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v18 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  uint64_t v19 = 2654435761 * self->_archived;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v18 = 2654435761 * self->_latestSupportedVersion;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    uint64_t v17 = 2654435761 * self->_minimumSupportedVersion;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v17 = 0;
LABEL_11:
  unint64_t v16 = [(HDCodableMedicationChartSeries *)self->_chartSeries hash];
  NSUInteger v15 = [(NSString *)self->_preferredName hash];
  NSUInteger v14 = [(NSString *)self->_brandName hash];
  NSUInteger v3 = [(NSString *)self->_genericName hash];
  NSUInteger v4 = [(NSString *)self->_manufacturedDoseForm hash];
  NSUInteger v5 = [(NSString *)self->_basicDoseForm hash];
  NSUInteger v6 = [(NSString *)self->_freeTextMedicationName hash];
  uint64_t v7 = [(HDCodableQuantity *)self->_freeTextMedicationStrengthQuantity hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_freeTextMedicationLoggingUnit;
  }
  else {
    uint64_t v8 = 0;
  }
  NSUInteger v9 = [(NSString *)self->_pregnancyDescriptionContentString hash];
  NSUInteger v10 = [(NSString *)self->_lactationDescriptionContentString hash];
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    uint64_t v11 = 2654435761 * self->_isPregnancyDescriptionCritical;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_16;
    }
LABEL_18:
    uint64_t v12 = 0;
    return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  uint64_t v11 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_18;
  }
LABEL_16:
  uint64_t v12 = 2654435761 * self->_isLactationDescriptionCritical;
  return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 10)) {
    -[HDCodableMedicationShareableModel setConceptIdentifier:](self, "setConceptIdentifier:");
  }
  if (*((void *)v4 + 5)) {
    -[HDCodableMedicationShareableModel setAudienceRawValue:](self, "setAudienceRawValue:");
  }
  if (*((void *)v4 + 6)) {
    -[HDCodableMedicationShareableModel setBaseUnitStrength:](self, "setBaseUnitStrength:");
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = *((id *)v4 + 15);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        [(HDCodableMedicationShareableModel *)self addIngredientComponentStrings:*(void *)(*((void *)&v29 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 22)) {
    -[HDCodableMedicationShareableModel setOntologyLoggingUnitSingular:](self, "setOntologyLoggingUnitSingular:");
  }
  if (*((void *)v4 + 21)) {
    -[HDCodableMedicationShareableModel setOntologyLoggingUnitPlural:](self, "setOntologyLoggingUnitPlural:");
  }
  if (*((void *)v4 + 11)) {
    -[HDCodableMedicationShareableModel setEduContentString:](self, "setEduContentString:");
  }
  if (*((void *)v4 + 26)) {
    -[HDCodableMedicationShareableModel setSideEffectsContentString:](self, "setSideEffectsContentString:");
  }
  if (*((void *)v4 + 18)) {
    -[HDCodableMedicationShareableModel setMedicationVisualizationConfigJSONString:](self, "setMedicationVisualizationConfigJSONString:");
  }
  if (*((unsigned char *)v4 + 220))
  {
    self->_freeTextMedicationForm = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  schedule = self->_schedule;
  uint64_t v11 = *((void *)v4 + 25);
  if (schedule)
  {
    if (v11) {
      -[HDCodableMedicationSchedule mergeFrom:](schedule, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[HDCodableMedicationShareableModel setSchedule:](self, "setSchedule:");
  }
  mostRecentDose = self->_mostRecentDose;
  uint64_t v13 = *((void *)v4 + 20);
  if (mostRecentDose)
  {
    if (v13) {
      -[HDCodableMedicationDoseEvent mergeFrom:](mostRecentDose, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[HDCodableMedicationShareableModel setMostRecentDose:](self, "setMostRecentDose:");
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = *((id *)v4 + 19);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        -[HDCodableMedicationShareableModel addMonthHighlights:](self, "addMonthHighlights:", *(void *)(*((void *)&v25 + 1) + 8 * j), (void)v25);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v16);
  }

  char v19 = *((unsigned char *)v4 + 220);
  if ((v19 & 0x10) != 0)
  {
    self->_archived = *((unsigned char *)v4 + 216);
    *(unsigned char *)&self->_has |= 0x10u;
    char v19 = *((unsigned char *)v4 + 220);
    if ((v19 & 4) == 0)
    {
LABEL_45:
      if ((v19 & 8) == 0) {
        goto LABEL_47;
      }
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 220) & 4) == 0)
  {
    goto LABEL_45;
  }
  self->_latestSupportedVersion = *((void *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 220) & 8) != 0)
  {
LABEL_46:
    self->_minimumSupportedVersion = *((void *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_47:
  chartSeries = self->_chartSeries;
  uint64_t v21 = *((void *)v4 + 9);
  if (chartSeries)
  {
    if (v21) {
      -[HDCodableMedicationChartSeries mergeFrom:](chartSeries, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[HDCodableMedicationShareableModel setChartSeries:](self, "setChartSeries:");
  }
  if (*((void *)v4 + 23)) {
    -[HDCodableMedicationShareableModel setPreferredName:](self, "setPreferredName:");
  }
  if (*((void *)v4 + 8)) {
    -[HDCodableMedicationShareableModel setBrandName:](self, "setBrandName:");
  }
  if (*((void *)v4 + 14)) {
    -[HDCodableMedicationShareableModel setGenericName:](self, "setGenericName:");
  }
  if (*((void *)v4 + 17)) {
    -[HDCodableMedicationShareableModel setManufacturedDoseForm:](self, "setManufacturedDoseForm:");
  }
  if (*((void *)v4 + 7)) {
    -[HDCodableMedicationShareableModel setBasicDoseForm:](self, "setBasicDoseForm:");
  }
  if (*((void *)v4 + 12)) {
    -[HDCodableMedicationShareableModel setFreeTextMedicationName:](self, "setFreeTextMedicationName:");
  }
  freeTextMedicationStrengthQuantity = self->_freeTextMedicationStrengthQuantity;
  uint64_t v23 = *((void *)v4 + 13);
  if (freeTextMedicationStrengthQuantity)
  {
    if (v23) {
      -[HDCodableQuantity mergeFrom:](freeTextMedicationStrengthQuantity, "mergeFrom:");
    }
  }
  else if (v23)
  {
    -[HDCodableMedicationShareableModel setFreeTextMedicationStrengthQuantity:](self, "setFreeTextMedicationStrengthQuantity:");
  }
  if ((*((unsigned char *)v4 + 220) & 2) != 0)
  {
    self->_freeTextMedicationLoggingUnit = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 24)) {
    -[HDCodableMedicationShareableModel setPregnancyDescriptionContentString:](self, "setPregnancyDescriptionContentString:");
  }
  if (*((void *)v4 + 16)) {
    -[HDCodableMedicationShareableModel setLactationDescriptionContentString:](self, "setLactationDescriptionContentString:");
  }
  char v24 = *((unsigned char *)v4 + 220);
  if ((v24 & 0x40) != 0)
  {
    self->_isPregnancyDescriptionCritical = *((unsigned char *)v4 + 218);
    *(unsigned char *)&self->_has |= 0x40u;
    char v24 = *((unsigned char *)v4 + 220);
  }
  if ((v24 & 0x20) != 0)
  {
    self->_isLactationDescriptionCritical = *((unsigned char *)v4 + 217);
    *(unsigned char *)&self->_has |= 0x20u;
  }
}

- (NSMutableArray)ingredientComponentStrings
{
  return self->_ingredientComponentStrings;
}

- (NSString)ontologyLoggingUnitSingular
{
  return self->_ontologyLoggingUnitSingular;
}

- (NSString)ontologyLoggingUnitPlural
{
  return self->_ontologyLoggingUnitPlural;
}

- (NSString)eduContentString
{
  return self->_eduContentString;
}

- (NSString)sideEffectsContentString
{
  return self->_sideEffectsContentString;
}

- (NSString)medicationVisualizationConfigJSONString
{
  return self->_medicationVisualizationConfigJSONString;
}

- (int64_t)freeTextMedicationForm
{
  return self->_freeTextMedicationForm;
}

- (int64_t)freeTextMedicationLoggingUnit
{
  return self->_freeTextMedicationLoggingUnit;
}

- (HDCodableMedicationSchedule)schedule
{
  return self->_schedule;
}

- (HDCodableMedicationDoseEvent)mostRecentDose
{
  return self->_mostRecentDose;
}

- (NSMutableArray)monthHighlights
{
  return self->_monthHighlights;
}

- (void)setMonthHighlights:(id)a3
{
}

- (BOOL)archived
{
  return self->_archived;
}

- (int64_t)latestSupportedVersion
{
  return self->_latestSupportedVersion;
}

- (int64_t)minimumSupportedVersion
{
  return self->_minimumSupportedVersion;
}

- (HDCodableMedicationChartSeries)chartSeries
{
  return self->_chartSeries;
}

- (NSString)preferredName
{
  return self->_preferredName;
}

- (NSString)basicDoseForm
{
  return self->_basicDoseForm;
}

- (HDCodableQuantity)freeTextMedicationStrengthQuantity
{
  return self->_freeTextMedicationStrengthQuantity;
}

- (NSString)pregnancyDescriptionContentString
{
  return self->_pregnancyDescriptionContentString;
}

- (NSString)lactationDescriptionContentString
{
  return self->_lactationDescriptionContentString;
}

- (BOOL)isPregnancyDescriptionCritical
{
  return self->_isPregnancyDescriptionCritical;
}

- (BOOL)isLactationDescriptionCritical
{
  return self->_isLactationDescriptionCritical;
}

@end