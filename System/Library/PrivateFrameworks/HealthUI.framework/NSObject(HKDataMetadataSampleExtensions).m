@interface NSObject(HKDataMetadataSampleExtensions)
- (id)hk_localizedStringForAssociatedDistanceQuantity:()HKDataMetadataSampleExtensions displayTypeController:unitController:;
- (uint64_t)fetchDetailedReportWithHealthStore:()HKDataMetadataSampleExtensions reportDataBlock:;
- (uint64_t)hasAssociatedReport;
- (uint64_t)hk_defaultDistanceQuantityType;
@end

@implementation NSObject(HKDataMetadataSampleExtensions)

- (uint64_t)hk_defaultDistanceQuantityType
{
  return [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7E0]];
}

- (id)hk_localizedStringForAssociatedDistanceQuantity:()HKDataMetadataSampleExtensions displayTypeController:unitController:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_msgSend(a1, "hk_defaultDistanceQuantityType");
  v12 = [v9 displayTypeForObjectType:v11];

  v13 = [v8 unitForDisplayType:v12];
  v14 = objc_msgSend(v12, "hk_numberFormatterForUnit:formattingContext:", v13, 1);
  v15 = NSNumber;
  [v10 doubleValueForUnit:v13];
  double v17 = v16;

  v18 = [v15 numberWithDouble:v17];
  v19 = [v14 stringFromNumber:v18 displayType:v12 unitController:v8];

  return v19;
}

- (uint64_t)hasAssociatedReport
{
  return 0;
}

- (uint64_t)fetchDetailedReportWithHealthStore:()HKDataMetadataSampleExtensions reportDataBlock:
{
  return (*(uint64_t (**)(uint64_t, void, void))(a4 + 16))(a4, 0, 0);
}

@end