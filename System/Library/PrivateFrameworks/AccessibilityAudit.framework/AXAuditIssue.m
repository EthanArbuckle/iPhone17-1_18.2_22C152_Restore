@interface AXAuditIssue
+ (Class)_auditIssueClassForType:(int64_t)a3;
+ (id)auditIssueForClassification:(int64_t)a3;
+ (void)registerTransportableObjectWithManager:(id)a3;
- (AXAuditElement)auditElement;
- (AXAuditIssue)init;
- (AXAuditIssueDescriptionManager)descManager;
- (BOOL)_isSameRelativeLocationAsAuditIssue:(id)a3;
- (BOOL)isDuplicate;
- (BOOL)isEqual:(id)a3;
- (CGPoint)containerOrigin;
- (CGRect)elementRect;
- (NSArray)longDescExtraInfo;
- (NSArray)suggestedSelectorsToFix;
- (NSNumber)imageIdentifier;
- (NSString)auditTestType;
- (NSString)backgroundColor;
- (NSString)description;
- (NSString)elementDescription;
- (NSString)elementText;
- (NSString)foregroundColor;
- (NSString)mlGeneratedDescription;
- (NSString)screenGroupId;
- (NSString)timeStamp;
- (double)fontSize;
- (id)copyWithZone:(_NSZone *)a3;
- (id)foundLogMessage;
- (int64_t)_platformForClassification:(int64_t)a3;
- (int64_t)compare:(id)a3;
- (int64_t)issueClassification;
- (int64_t)platform;
- (unint64_t)hash;
- (void)setAuditElement:(id)a3;
- (void)setAuditTestType:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setContainerOrigin:(CGPoint)a3;
- (void)setDescManager:(id)a3;
- (void)setElementDescription:(id)a3;
- (void)setElementRect:(CGRect)a3;
- (void)setElementText:(id)a3;
- (void)setFontSize:(double)a3;
- (void)setForegroundColor:(id)a3;
- (void)setImageIdentifier:(id)a3;
- (void)setIsDuplicate:(BOOL)a3;
- (void)setIssueClassification:(int64_t)a3;
- (void)setLongDescExtraInfo:(id)a3;
- (void)setMlGeneratedDescription:(id)a3;
- (void)setPlatform:(int64_t)a3;
- (void)setScreenGroupId:(id)a3;
- (void)setSuggestedSelectorsToFix:(id)a3;
- (void)setTimeStamp:(id)a3;
@end

@implementation AXAuditIssue

+ (Class)_auditIssueClassForType:(int64_t)a3
{
  return (Class)objc_opt_class();
}

+ (id)auditIssueForClassification:(int64_t)a3
{
  v4 = objc_msgSend(objc_allocWithZone((Class)objc_msgSend(a1, "_auditIssueClassForType:")), "init");
  [v4 setIssueClassification:a3];
  v5 = +[AXAuditIssueDescriptionManager auditIssueTypeToAuditTestTypeMapping];
  v6 = [NSNumber numberWithLong:a3];
  v7 = [v5 objectForKey:v6];

  [v4 setAuditTestType:v7];

  return v4;
}

- (AXAuditIssue)init
{
  v3.receiver = self;
  v3.super_class = (Class)AXAuditIssue;
  result = [(AXAuditIssue *)&v3 init];
  if (result)
  {
    result->_containerOrigin = (CGPoint)*MEMORY[0x263F08668];
    result->_fontSize = 0.0;
  }
  return result;
}

- (void)setIssueClassification:(int64_t)a3
{
  self->_issueClassification = a3;
  int64_t v4 = -[AXAuditIssue _platformForClassification:](self, "_platformForClassification:");

  [(AXAuditIssue *)self setPlatform:v4];
}

- (int64_t)_platformForClassification:(int64_t)a3
{
  return a3 < 100000;
}

- (id)foundLogMessage
{
  objc_super v3 = [MEMORY[0x263F089D8] string];
  int64_t v4 = +[AXAuditIssueDescriptionManager sharedManager];
  [(AXAuditIssue *)self setDescManager:v4];

  v5 = [(AXAuditIssue *)self descManager];
  v6 = [v5 longDescriptionForAuditIssue:self];

  v7 = [(AXAuditIssue *)self descManager];
  v8 = [v7 longDescExtraInfoForAuditIssue:self];

  v9 = [(AXAuditIssue *)self auditElement];
  objc_msgSend(v3, "appendFormat:", @"Found Issue %li:", -[AXAuditIssue issueClassification](self, "issueClassification"));
  v10 = [(AXAuditIssue *)self auditTestType];

  if (v10)
  {
    v11 = [(AXAuditIssue *)self auditTestType];
    [v3 appendFormat:@" %@", v11];
  }
  if ([v6 length]) {
    [v3 appendFormat:@" %@", v6];
  }
  if ([v8 length]) {
    [v3 appendFormat:@" %@", v8];
  }
  if (v9) {
    [v3 appendFormat:@" %@", v9];
  }
  [(AXAuditIssue *)self elementRect];
  v12 = NSStringFromRect(v32);
  [v3 appendFormat:@" %@", v12];

  v13 = [(AXAuditIssue *)self suggestedSelectorsToFix];
  if ([v13 count]) {
    [v3 appendFormat:@", Suggested selectors to fix: %@", v13];
  }
  v14 = [(AXAuditIssue *)self foregroundColor];

  if (v14)
  {
    v15 = [(AXAuditIssue *)self foregroundColor];
    [v3 appendFormat:@" ForegroundColor:%@", v15];
  }
  v16 = [(AXAuditIssue *)self backgroundColor];

  if (v16)
  {
    v17 = [(AXAuditIssue *)self backgroundColor];
    [v3 appendFormat:@" BackgroundColor:%@", v17];
  }
  [(AXAuditIssue *)self fontSize];
  if (v18 > 0.0)
  {
    [(AXAuditIssue *)self fontSize];
    objc_msgSend(v3, "appendFormat:", @" FontSize:%.1f", v19);
  }
  v20 = [(AXAuditIssue *)self elementText];

  if (v20)
  {
    v21 = [(AXAuditIssue *)self elementText];
    [v3 appendFormat:@" ElementText :%@", v21];
  }
  v22 = [(AXAuditIssue *)self screenGroupId];

  if (v22)
  {
    v23 = [(AXAuditIssue *)self screenGroupId];
    [v3 appendFormat:@" ScreenGroupID :%@", v23];
  }
  if ([(AXAuditIssue *)self isDuplicate]) {
    v24 = @" Known Duplicate ";
  }
  else {
    v24 = @" New Issue ";
  }
  [v3 appendFormat:v24];
  v25 = [(AXAuditIssue *)self mlGeneratedDescription];

  if (v25)
  {
    v26 = [(AXAuditIssue *)self mlGeneratedDescription];
    [v3 appendFormat:@" ML Generated Description :%@", v26];
  }
  v27 = [(AXAuditIssue *)self timeStamp];

  if (v27)
  {
    v28 = [(AXAuditIssue *)self timeStamp];
    [v3 appendFormat:@" timestamp :%@", v28];
  }
  v29 = (void *)[v3 copy];

  return v29;
}

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3 = a3;
  v20 = [[AXAuditObjectTransportInfoPropertyBased alloc] initWithClass:objc_opt_class() transportKey:@"AXAuditIssue_v1"];
  uint64_t v19 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v20 addPropertyEntry:v19];
  [(AXAuditObjectTransportPropertyEntry *)v19 setTransportKey:@"IssueClassificationValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v19 setLocalValueToTransportValue:&__block_literal_global_12];
  [(AXAuditObjectTransportPropertyEntry *)v19 setPopulateLocalObjectWithTransportValue:&__block_literal_global_48_0];
  double v18 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v20 addPropertyEntry:v18];
  [(AXAuditObjectTransportPropertyEntry *)v18 setTransportKey:@"auditTestTypeValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v18 setLocalValueToTransportValue:&__block_literal_global_54];
  [(AXAuditObjectTransportPropertyEntry *)v18 setPopulateLocalObjectWithTransportValue:&__block_literal_global_57_0];
  v17 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v20 addPropertyEntry:v17];
  [(AXAuditObjectTransportPropertyEntry *)v17 setTransportKey:@"ElementRectValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v17 setLocalValueToTransportValue:&__block_literal_global_64_1];
  [(AXAuditObjectTransportPropertyEntry *)v17 setPopulateLocalObjectWithTransportValue:&__block_literal_global_68];
  v16 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v20 addPropertyEntry:v16];
  [(AXAuditObjectTransportPropertyEntry *)v16 setTransportKey:@"ElementDescriptionValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v16 setLocalValueToTransportValue:&__block_literal_global_73];
  [(AXAuditObjectTransportPropertyEntry *)v16 setPopulateLocalObjectWithTransportValue:&__block_literal_global_75];
  v15 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v20 addPropertyEntry:v15];
  [(AXAuditObjectTransportPropertyEntry *)v15 setTransportKey:@"ElementLongDescExtraInfo_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v15 setLocalValueToTransportValue:&__block_literal_global_81];
  [(AXAuditObjectTransportPropertyEntry *)v15 setPopulateLocalObjectWithTransportValue:&__block_literal_global_84];
  v14 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v20 addPropertyEntry:v14];
  [(AXAuditObjectTransportPropertyEntry *)v14 setTransportKey:@"AuditElementValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v14 setLocalValueToTransportValue:&__block_literal_global_91];
  [(AXAuditObjectTransportPropertyEntry *)v14 setPopulateLocalObjectWithTransportValue:&__block_literal_global_94];
  v13 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v20 addPropertyEntry:v13];
  [(AXAuditObjectTransportPropertyEntry *)v13 setTransportKey:@"suggestedSelectorsToFix_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v13 setLocalValueToTransportValue:&__block_literal_global_100];
  [(AXAuditObjectTransportPropertyEntry *)v13 setPopulateLocalObjectWithTransportValue:&__block_literal_global_102];
  int64_t v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v20 addPropertyEntry:v4];
  [(AXAuditObjectTransportPropertyEntry *)v4 setTransportKey:@"ForegroundColorValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v4 setLocalValueToTransportValue:&__block_literal_global_107];
  [(AXAuditObjectTransportPropertyEntry *)v4 setPopulateLocalObjectWithTransportValue:&__block_literal_global_109];
  v5 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v20 addPropertyEntry:v5];
  [(AXAuditObjectTransportPropertyEntry *)v5 setTransportKey:@"BackgroundColorValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v5 setLocalValueToTransportValue:&__block_literal_global_114];
  [(AXAuditObjectTransportPropertyEntry *)v5 setPopulateLocalObjectWithTransportValue:&__block_literal_global_116];
  v6 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v20 addPropertyEntry:v6];
  [(AXAuditObjectTransportPropertyEntry *)v6 setTransportKey:@"FontSizeValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v6 setLocalValueToTransportValue:&__block_literal_global_121];
  [(AXAuditObjectTransportPropertyEntry *)v6 setPopulateLocalObjectWithTransportValue:&__block_literal_global_123];
  v7 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v20 addPropertyEntry:v7];
  [(AXAuditObjectTransportPropertyEntry *)v7 setTransportKey:@"ElementTextValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v7 setLocalValueToTransportValue:&__block_literal_global_128];
  [(AXAuditObjectTransportPropertyEntry *)v7 setPopulateLocalObjectWithTransportValue:&__block_literal_global_130];
  v8 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v20 addPropertyEntry:v8];
  [(AXAuditObjectTransportPropertyEntry *)v8 setTransportKey:@"ScreenGroupIDValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v8 setLocalValueToTransportValue:&__block_literal_global_135];
  [(AXAuditObjectTransportPropertyEntry *)v8 setPopulateLocalObjectWithTransportValue:&__block_literal_global_137];
  v9 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v20 addPropertyEntry:v9];
  [(AXAuditObjectTransportPropertyEntry *)v9 setTransportKey:@"IsDuplicateValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v9 setLocalValueToTransportValue:&__block_literal_global_142];
  [(AXAuditObjectTransportPropertyEntry *)v9 setPopulateLocalObjectWithTransportValue:&__block_literal_global_144];
  v10 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v20 addPropertyEntry:v10];
  [(AXAuditObjectTransportPropertyEntry *)v10 setTransportKey:@"MLGeneratedDescriptionValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v10 setLocalValueToTransportValue:&__block_literal_global_149];
  [(AXAuditObjectTransportPropertyEntry *)v10 setPopulateLocalObjectWithTransportValue:&__block_literal_global_151];
  v11 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v20 addPropertyEntry:v11];
  [(AXAuditObjectTransportPropertyEntry *)v11 setTransportKey:@"ImageIdentifierValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v11 setLocalValueToTransportValue:&__block_literal_global_156];
  [(AXAuditObjectTransportPropertyEntry *)v11 setPopulateLocalObjectWithTransportValue:&__block_literal_global_158];
  v12 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v20 addPropertyEntry:v12];
  [(AXAuditObjectTransportPropertyEntry *)v12 setTransportKey:@"TimeStampValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v12 setLocalValueToTransportValue:&__block_literal_global_163];
  [(AXAuditObjectTransportPropertyEntry *)v12 setPopulateLocalObjectWithTransportValue:&__block_literal_global_165];
  [v3 registerTransportInfoPropertyBased:v20];
}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 issueClassification];

  return [v2 numberWithLong:v3];
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setIssueClassification:", objc_msgSend(v4, "integerValue"));
  }
}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 auditTestType];
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setAuditTestType:v4];
  }
}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F08D40];
  [a2 elementRect];

  return objc_msgSend(v2, "valueWithRect:");
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 rectValue];
    objc_msgSend(v5, "setElementRect:");
  }
}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 elementDescription];
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setElementDescription:v4];
  }
}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 longDescExtraInfo];
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setLongDescExtraInfo:v4];
  }
}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_11(uint64_t a1, void *a2)
{
  return [a2 auditElement];
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setAuditElement:v4];
  }
}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_13(uint64_t a1, void *a2)
{
  return [a2 suggestedSelectorsToFix];
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setSuggestedSelectorsToFix:v4];
  }
}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_15(uint64_t a1, void *a2)
{
  return [a2 foregroundColor];
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setForegroundColor:v4];
  }
}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_17(uint64_t a1, void *a2)
{
  return [a2 backgroundColor];
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setBackgroundColor:v4];
  }
}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_19(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  [a2 fontSize];

  return objc_msgSend(v2, "numberWithDouble:");
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 doubleValue];
    objc_msgSend(v5, "setFontSize:");
  }
}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_21(uint64_t a1, void *a2)
{
  return [a2 elementText];
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setElementText:v4];
  }
}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_23(uint64_t a1, void *a2)
{
  return [a2 screenGroupId];
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setScreenGroupId:v4];
  }
}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_25(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 isDuplicate];

  return [v2 numberWithBool:v3];
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setIsDuplicate:", objc_msgSend(v4, "BOOLValue"));
  }
}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_27(uint64_t a1, void *a2)
{
  return [a2 mlGeneratedDescription];
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setMlGeneratedDescription:v4];
  }
}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_29(uint64_t a1, void *a2)
{
  return [a2 imageIdentifier];
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setImageIdentifier:v4];
  }
}

uint64_t __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_31(uint64_t a1, void *a2)
{
  return [a2 timeStamp];
}

void __55__AXAuditIssue_registerTransportableObjectWithManager___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setTimeStamp:v4];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIssueClassification:", -[AXAuditIssue issueClassification](self, "issueClassification"));
  id v5 = [(AXAuditIssue *)self auditTestType];
  [v4 setAuditTestType:v5];

  v6 = [(AXAuditIssue *)self auditElement];
  [v4 setAuditElement:v6];

  v7 = [(AXAuditIssue *)self elementDescription];
  [v4 setElementDescription:v7];

  [(AXAuditIssue *)self elementRect];
  objc_msgSend(v4, "setElementRect:");
  v8 = [(AXAuditIssue *)self suggestedSelectorsToFix];
  [v4 setSuggestedSelectorsToFix:v8];

  v9 = [(AXAuditIssue *)self longDescExtraInfo];
  [v4 setLongDescExtraInfo:v9];

  v10 = [(AXAuditIssue *)self foregroundColor];
  [v4 setForegroundColor:v10];

  v11 = [(AXAuditIssue *)self backgroundColor];
  [v4 setBackgroundColor:v11];

  [(AXAuditIssue *)self fontSize];
  objc_msgSend(v4, "setFontSize:");
  v12 = [(AXAuditIssue *)self elementText];
  [v4 setElementText:v12];

  v13 = [(AXAuditIssue *)self screenGroupId];
  [v4 setScreenGroupId:v13];

  objc_msgSend(v4, "setIsDuplicate:", -[AXAuditIssue isDuplicate](self, "isDuplicate"));
  v14 = [(AXAuditIssue *)self mlGeneratedDescription];
  [v4 setMlGeneratedDescription:v14];

  v15 = [(AXAuditIssue *)self imageIdentifier];
  [v4 setImageIdentifier:v15];

  v16 = [(AXAuditIssue *)self timeStamp];
  [v4 setTimeStamp:v16];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AXAuditIssue *)a3;
  if (self == v4)
  {
    char v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(AXAuditIssue *)v5 issueClassification];
      if (v6 != [(AXAuditIssue *)self issueClassification])
      {
        char v15 = 0;
LABEL_21:

        goto LABEL_22;
      }
      uint64_t v7 = [(AXAuditIssue *)self elementDescription];
      uint64_t v8 = [(AXAuditIssue *)v5 elementDescription];
      uint64_t v9 = [(AXAuditIssue *)self elementText];
      uint64_t v10 = [(AXAuditIssue *)v5 elementText];
      uint64_t v11 = [(AXAuditIssue *)self screenGroupId];
      uint64_t v67 = [(AXAuditIssue *)v5 screenGroupId];
      uint64_t v12 = [(AXAuditIssue *)self mlGeneratedDescription];
      *((void *)&v68 + 1) = [(AXAuditIssue *)self auditTestType];
      *(void *)&long long v68 = [(AXAuditIssue *)v5 auditTestType];
      uint64_t v13 = [(AXAuditIssue *)v5 mlGeneratedDescription];
      [(AXAuditIssue *)self isDuplicate];
      [(AXAuditIssue *)v5 isDuplicate];
      if (v7 | v8 && ![(id)v7 isEqual:v8]
        || v9 | v10 && ![(id)v9 isEqual:v10]
        || v12 | v13 && ![(id)v12 isEqual:v13]
        || v68 != 0 && ![*((id *)&v68 + 1) isEqual:(void)v68]
        || v11 | v67 && ![(id)v11 isEqualToString:v67])
      {
        char v15 = 0;
        goto LABEL_20;
      }
      uint64_t v66 = v11;
      BOOL v14 = [(AXAuditIssue *)self isDuplicate];
      if (v14 != [(AXAuditIssue *)v5 isDuplicate])
      {
        char v15 = 0;
        uint64_t v11 = v66;
LABEL_20:

        goto LABEL_21;
      }
      uint64_t v64 = v12;
      uint64_t v17 = [(AXAuditIssue *)self auditElement];
      uint64_t v18 = [(AXAuditIssue *)v5 auditElement];
      v65 = (void *)v17;
      uint64_t v19 = v17 | v18;
      uint64_t v11 = v66;
      if (v19 && ![v65 isEqual:v18])
      {
        char v15 = 0;
LABEL_57:

        uint64_t v12 = v64;
        goto LABEL_20;
      }
      uint64_t v62 = v18;
      [(AXAuditIssue *)self elementRect];
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      [(AXAuditIssue *)v5 elementRect];
      v72.origin.x = v28;
      v72.origin.y = v29;
      CGFloat v31 = v30;
      CGFloat v33 = v32;
      v71.origin.x = v21;
      v71.origin.y = v23;
      v71.size.width = v25;
      v71.size.height = v27;
      v72.size.width = v31;
      v72.size.height = v33;
      if (!NSEqualRects(v71, v72))
      {
        v69.width = v25;
        v69.height = v27;
        v70.width = v31;
        v70.height = v33;
        if (!NSEqualSizes(v69, v70)
          || ![(AXAuditIssue *)self _isSameRelativeLocationAsAuditIssue:v5])
        {
          char v15 = 0;
LABEL_56:
          uint64_t v18 = v62;
          goto LABEL_57;
        }
      }
      v34 = [(AXAuditIssue *)self suggestedSelectorsToFix];
      v63 = [(AXAuditIssue *)v5 suggestedSelectorsToFix];
      v61 = v34;
      if (([v34 count] || objc_msgSend(v63, "count"))
        && ![v34 isEqual:v63])
      {
        goto LABEL_54;
      }
      uint64_t v35 = [(AXAuditIssue *)self longDescExtraInfo];
      if (v35
        || ([(AXAuditIssue *)v5 longDescExtraInfo],
            (v51 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        [(AXAuditIssue *)self longDescExtraInfo];
        v36 = v54 = (void *)v35;
        v37 = [(AXAuditIssue *)v5 longDescExtraInfo];
        int v57 = [v36 isEqualToArray:v37];

        if (v54)
        {

          uint64_t v11 = v66;
          if (!v57) {
            goto LABEL_54;
          }
        }
        else
        {

          uint64_t v11 = v66;
          if ((v57 & 1) == 0) {
            goto LABEL_54;
          }
        }
      }
      uint64_t v38 = [(AXAuditIssue *)self foregroundColor];
      if (v38
        || ([(AXAuditIssue *)v5 foregroundColor],
            (v52 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        [(AXAuditIssue *)self foregroundColor];
        v39 = v55 = (void *)v38;
        v40 = [(AXAuditIssue *)v5 foregroundColor];
        int v58 = [v39 isEqualToString:v40];

        if (v55)
        {

          uint64_t v11 = v66;
          if (!v58) {
            goto LABEL_54;
          }
        }
        else
        {

          uint64_t v11 = v66;
          if ((v58 & 1) == 0) {
            goto LABEL_54;
          }
        }
      }
      uint64_t v41 = [(AXAuditIssue *)self backgroundColor];
      if (v41
        || ([(AXAuditIssue *)v5 backgroundColor],
            (v53 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        [(AXAuditIssue *)self backgroundColor];
        v42 = v56 = (void *)v41;
        v43 = [(AXAuditIssue *)v5 backgroundColor];
        int v59 = [v42 isEqualToString:v43];

        if (v56)
        {

          uint64_t v11 = v66;
          if (!v59) {
            goto LABEL_54;
          }
        }
        else
        {

          uint64_t v11 = v66;
          if ((v59 & 1) == 0) {
            goto LABEL_54;
          }
        }
      }
      [(AXAuditIssue *)self fontSize];
      double v45 = v44;
      [(AXAuditIssue *)v5 fontSize];
      if (vabdd_f64(v45, v46) < 0.000001)
      {
        v47 = [(AXAuditIssue *)self imageIdentifier];
        v48 = [(AXAuditIssue *)v5 imageIdentifier];
        uint64_t v60 = [v47 compare:v48];

        if (v60)
        {
          char v15 = 0;
        }
        else
        {
          v49 = [(AXAuditIssue *)self timeStamp];
          v50 = [(AXAuditIssue *)v5 timeStamp];
          char v15 = [v49 isEqualToString:v50];
        }
        uint64_t v11 = v66;
        goto LABEL_55;
      }
LABEL_54:
      char v15 = 0;
LABEL_55:

      goto LABEL_56;
    }
    char v15 = 0;
  }
LABEL_22:

  return v15;
}

- (BOOL)_isSameRelativeLocationAsAuditIssue:(id)a3
{
  id v4 = a3;
  [(AXAuditIssue *)self containerOrigin];
  double v6 = v5;
  double v8 = v7;
  [v4 containerOrigin];
  double v10 = v9;
  double v12 = v11;
  [(AXAuditIssue *)self elementRect];
  double v14 = v13;
  double v16 = v15;
  [v4 elementRect];
  double v18 = v17;
  double v20 = v19;

  return vabdd_f64(v14 - v6, v18 - v10) < 0.100000001 && vabdd_f64(v16 - v8, v20 - v12) < 0.100000001;
}

- (unint64_t)hash
{
  [(AXAuditIssue *)self elementRect];
  unint64_t v7 = (unint64_t)(v6 + v5 + v3 + v4);
  int64_t v8 = [(AXAuditIssue *)self issueClassification];
  double v9 = [(AXAuditIssue *)self auditElement];
  uint64_t v10 = [v9 hash];
  double v11 = [(AXAuditIssue *)self elementDescription];
  unint64_t v12 = v10 ^ v8 ^ [v11 hash] ^ v7;

  return v12;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(AXAuditIssue *)self issueClassification];
  uint64_t v6 = [v4 issueClassification];

  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)AXAuditIssue;
  double v3 = [(AXAuditIssue *)&v7 description];
  id v4 = [(AXAuditIssue *)self foundLogMessage];
  int64_t v5 = [v3 stringByAppendingFormat:@" %@", v4];

  return (NSString *)v5;
}

- (int64_t)issueClassification
{
  return self->_issueClassification;
}

- (NSString)auditTestType
{
  return self->_auditTestType;
}

- (void)setAuditTestType:(id)a3
{
}

- (AXAuditElement)auditElement
{
  return self->_auditElement;
}

- (void)setAuditElement:(id)a3
{
}

- (NSString)elementDescription
{
  return self->_elementDescription;
}

- (void)setElementDescription:(id)a3
{
}

- (NSArray)longDescExtraInfo
{
  return self->_longDescExtraInfo;
}

- (void)setLongDescExtraInfo:(id)a3
{
}

- (CGRect)elementRect
{
  double x = self->_elementRect.origin.x;
  double y = self->_elementRect.origin.y;
  double width = self->_elementRect.size.width;
  double height = self->_elementRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setElementRect:(CGRect)a3
{
  self->_elementRect = a3;
}

- (CGPoint)containerOrigin
{
  double x = self->_containerOrigin.x;
  double y = self->_containerOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setContainerOrigin:(CGPoint)a3
{
  self->_containerOrigin = a3;
}

- (NSString)elementText
{
  return self->_elementText;
}

- (void)setElementText:(id)a3
{
}

- (NSString)mlGeneratedDescription
{
  return self->_mlGeneratedDescription;
}

- (void)setMlGeneratedDescription:(id)a3
{
}

- (BOOL)isDuplicate
{
  return self->_isDuplicate;
}

- (void)setIsDuplicate:(BOOL)a3
{
  self->_isDuplicate = a3;
}

- (NSString)screenGroupId
{
  return self->_screenGroupId;
}

- (void)setScreenGroupId:(id)a3
{
}

- (NSString)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(id)a3
{
}

- (NSString)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (NSString)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(id)a3
{
}

- (int64_t)platform
{
  return self->_platform;
}

- (void)setPlatform:(int64_t)a3
{
  self->_platform = a3;
}

- (NSArray)suggestedSelectorsToFix
{
  return self->_suggestedSelectorsToFix;
}

- (void)setSuggestedSelectorsToFix:(id)a3
{
}

- (NSNumber)imageIdentifier
{
  return self->_imageIdentifier;
}

- (void)setImageIdentifier:(id)a3
{
}

- (AXAuditIssueDescriptionManager)descManager
{
  return self->_descManager;
}

- (void)setDescManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descManager, 0);
  objc_storeStrong((id *)&self->_imageIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestedSelectorsToFix, 0);
  objc_storeStrong((id *)&self->_timeStamp, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_screenGroupId, 0);
  objc_storeStrong((id *)&self->_mlGeneratedDescription, 0);
  objc_storeStrong((id *)&self->_elementText, 0);
  objc_storeStrong((id *)&self->_longDescExtraInfo, 0);
  objc_storeStrong((id *)&self->_elementDescription, 0);
  objc_storeStrong((id *)&self->_auditElement, 0);

  objc_storeStrong((id *)&self->_auditTestType, 0);
}

@end