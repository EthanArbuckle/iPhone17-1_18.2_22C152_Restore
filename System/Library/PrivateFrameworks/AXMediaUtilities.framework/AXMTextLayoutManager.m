@interface AXMTextLayoutManager
- (AXMSemanticTextFactory)semanticTextFactory;
- (AXMTextLayoutManager)initWithSemanticTextFactory:(id)a3;
- (BOOL)hasConsecutiveCharacters:(id)a3 withLength:(unint64_t)a4;
- (BOOL)hasConsecutiveDigits:(id)a3 withLength:(unint64_t)a4;
- (BOOL)isBoundary:(CGRect)a3 withinBoundary:(CGRect)a4 withNormalizedThreshold:(double)a5;
- (BOOL)isBoundary:(CGRect)a3 withinNormalizedDistance:(double)a4 ofBoundary:(CGRect)a5;
- (BOOL)verifyTable:(id)a3 sortedColumns:(id)a4;
- (CGRect)detectCenterContourFromContours:(id)a3 withImageExtent:(CGRect)a4;
- (CGRect)imageRectForNormalizedRect:(CGRect)a3 imageWidth:(unint64_t)a4 imageHeight:(unint64_t)a5;
- (NSMeasurementFormatter)measurementFormatter;
- (NSNumberFormatter)numberFormatter;
- (id)_assembleLayoutCellsWithFeatures:(id)a3;
- (id)_assembleLayoutColumn:(id)a3;
- (id)_assembleLayoutHeader:(id)a3;
- (id)_assembleLayoutLines:(id)a3;
- (id)_assembleLayoutRegions:(id)a3;
- (id)_assembleLayoutRow:(id)a3;
- (id)_assembleLayoutRowFromCell:(id)a3;
- (id)_assembleLayoutSequences:(id)a3;
- (id)_assembleLayoutTable:(id)a3 header:(id)a4 columnItems:(id)a5;
- (id)_assembleNutritionLabelLayoutWithRows:(id)a3;
- (id)_assembleReceipt:(id)a3;
- (id)documentWithNutritionLabel:(id)a3 canvasSize:(CGSize)a4 requestHandler:(id)a5 metrics:(id)a6 error:(id *)a7;
- (id)documentWithReceipt:(id)a3 withTextSkew:(double)a4 canvasSize:(CGSize)a5 preferredLocales:(id)a6 requestHandler:(id)a7 metrics:(id)a8 error:(id *)a9;
- (id)documentWithTable:(id)a3 canvasSize:(CGSize)a4 preferredLocales:(id)a5 requestHandler:(id)a6 metrics:(id)a7 error:(id *)a8;
- (id)documentWithTextFeatures:(id)a3 canvasSize:(CGSize)a4 preferredLocales:(id)a5 applySemanticAnalysis:(BOOL)a6 error:(id *)a7;
- (id)envelopeWithTextFeatures:(id)a3 canvasSize:(CGSize)a4 preferredLocales:(id)a5 applySemanticAnalysis:(BOOL)a6 error:(id *)a7;
- (id)extractDataFromEnvelopeWithFeatures:(id)a3 preferredLocales:(id)a4 canvasSize:(CGSize)a5;
- (id)featureCellsForNutritionLabelRows:(id)a3 withRequestHandler:(id)a4 withCanvasSize:(CGSize)a5;
- (id)filterReceiptForGarbageText:(id)a3;
- (id)fractionDenominatorValues;
- (id)fractionDenominatorValuesWithOneAsNumerator;
- (id)getReceiptRows:(id)a3 preferredLocales:(id)a4 canvasSize:(CGSize)a5;
- (id)getTableColumns:(id)a3;
- (id)getTableRows:(id)a3;
- (id)largestDetectedContoursForImage:(id)a3;
- (id)measurementAbbreviationsToVerboseString;
- (id)nutritionLabelRowsForContourResults:(double)a3 normalizedNutritionLabelFrame:(double)a4 fullImageFrame:(double)a5 processedImageFrame:(double)a6;
- (id)preprocessNutritionLabel:(id)a3 finalFrame:(CGRect *)a4;
- (id)preprocessReceipt:(id)a3 withTextSkew:(double)a4 width:(unint64_t)a5 height:(unint64_t)a6 metrics:(id)a7 requestHandler:(id)a8 finalFrame:(CGRect *)a9;
- (id)preprocessTable:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 metrics:(id)a6;
- (id)processFraction:(id)a3;
- (id)processMeasurement:(id)a3;
- (id)processNutritionLabelText:(id)a3;
- (id)processReceiptText:(id)a3 foundMerchantName:(BOOL *)a4 preferredLocales:(id)a5;
- (id)receiptRegularExpressions;
- (id)sortContourColumnResults:(id)a3 maxWidth:(double)a4 maxHeight:(double)a5;
- (id)sortContourRowResults:(id)a3 maxWidth:(double)a4 maxHeight:(double)a5 minWidth:(double)a6 minHeight:(double)a7;
- (id)textColumnsForTable:(id)a3 sourceImage:(id)a4 requestHandler:(id)a5 canvasSize:(CGSize)a6;
- (id)textRowsForTable:(id)a3 sourceImage:(id)a4 requestHandler:(id)a5 canvasSize:(CGSize)a6;
- (void)setMeasurementFormatter:(id)a3;
- (void)setNumberFormatter:(id)a3;
- (void)setSemanticTextFactory:(id)a3;
@end

@implementation AXMTextLayoutManager

- (AXMTextLayoutManager)initWithSemanticTextFactory:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXMTextLayoutManager;
  v5 = [(AXMTextLayoutManager *)&v8 init];
  v6 = v5;
  if (v5) {
    [(AXMTextLayoutManager *)v5 setSemanticTextFactory:v4];
  }

  return v6;
}

- (NSNumberFormatter)numberFormatter
{
  numberFormatter = self->_numberFormatter;
  if (!numberFormatter)
  {
    id v4 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    v5 = self->_numberFormatter;
    self->_numberFormatter = v4;

    [(NSNumberFormatter *)self->_numberFormatter setNumberStyle:5];
    numberFormatter = self->_numberFormatter;
  }

  return numberFormatter;
}

- (NSMeasurementFormatter)measurementFormatter
{
  measurementFormatter = self->_measurementFormatter;
  if (!measurementFormatter)
  {
    id v4 = (NSMeasurementFormatter *)objc_alloc_init(MEMORY[0x1E4F28E30]);
    v5 = self->_measurementFormatter;
    self->_measurementFormatter = v4;

    [(NSMeasurementFormatter *)self->_measurementFormatter setUnitStyle:3];
    measurementFormatter = self->_measurementFormatter;
  }

  return measurementFormatter;
}

- (id)fractionDenominatorValuesWithOneAsNumerator
{
  v19 = (void *)MEMORY[0x1E4F1C978];
  v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  v24 = [v22 localizedStringForKey:@"image.value.one" value:&stru_1F0E72D10 table:@"Accessibility"];
  v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  v16 = [v21 localizedStringForKey:@"image.value.half" value:&stru_1F0E72D10 table:@"Accessibility"];
  v20 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  v23 = [v20 localizedStringForKey:@"image.value.third" value:&stru_1F0E72D10 table:@"Accessibility"];
  v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  v13 = [v18 localizedStringForKey:@"image.value.fourth" value:&stru_1F0E72D10 table:@"Accessibility"];
  v17 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  v11 = [v17 localizedStringForKey:@"image.value.fifth" value:&stru_1F0E72D10 table:@"Accessibility"];
  v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  v2 = [v15 localizedStringForKey:@"image.value.sixth" value:&stru_1F0E72D10 table:@"Accessibility"];
  v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  v3 = [v14 localizedStringForKey:@"image.value.seventh" value:&stru_1F0E72D10 table:@"Accessibility"];
  v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  id v4 = [v12 localizedStringForKey:@"image.value.eighth" value:&stru_1F0E72D10 table:@"Accessibility"];
  v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  v6 = [v5 localizedStringForKey:@"image.value.nineth" value:&stru_1F0E72D10 table:@"Accessibility"];
  v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  objc_super v8 = [v7 localizedStringForKey:@"image.value.tenth" value:&stru_1F0E72D10 table:@"Accessibility"];
  v9 = objc_msgSend(v19, "arrayWithObjects:", &stru_1F0E72D10, v24, v16, v23, v13, v11, v2, v3, v4, v6, v8, 0);

  return v9;
}

- (id)fractionDenominatorValues
{
  v19 = (void *)MEMORY[0x1E4F1C978];
  v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  v24 = [v22 localizedStringForKey:@"image.value.one" value:&stru_1F0E72D10 table:@"Accessibility"];
  v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  v16 = [v21 localizedStringForKey:@"image.value.halves" value:&stru_1F0E72D10 table:@"Accessibility"];
  v20 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  v23 = [v20 localizedStringForKey:@"image.value.thirds" value:&stru_1F0E72D10 table:@"Accessibility"];
  v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  v13 = [v18 localizedStringForKey:@"image.value.fourths" value:&stru_1F0E72D10 table:@"Accessibility"];
  v17 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  v11 = [v17 localizedStringForKey:@"image.value.fifth" value:&stru_1F0E72D10 table:@"Accessibility"];
  v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  v2 = [v15 localizedStringForKey:@"image.value.sixths" value:&stru_1F0E72D10 table:@"Accessibility"];
  v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  v3 = [v14 localizedStringForKey:@"image.value.sevenths" value:&stru_1F0E72D10 table:@"Accessibility"];
  v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  id v4 = [v12 localizedStringForKey:@"image.value.eighths" value:&stru_1F0E72D10 table:@"Accessibility"];
  v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  v6 = [v5 localizedStringForKey:@"image.value.nineths" value:&stru_1F0E72D10 table:@"Accessibility"];
  v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  objc_super v8 = [v7 localizedStringForKey:@"image.value.tenths" value:&stru_1F0E72D10 table:@"Accessibility"];
  v9 = objc_msgSend(v19, "arrayWithObjects:", &stru_1F0E72D10, v24, v16, v23, v13, v11, v2, v3, v4, v6, v8, 0);

  return v9;
}

- (id)measurementAbbreviationsToVerboseString
{
  v48[6] = *MEMORY[0x1E4F143B8];
  v47[0] = @"g";
  v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = NSString;
  v46 = [(AXMTextLayoutManager *)self measurementFormatter];
  v45 = [MEMORY[0x1E4F291E8] grams];
  v44 = [v46 stringFromUnit:v45];
  v43 = [v4 stringWithFormat:@" %@", v44];
  v42 = [v3 arrayWithObjects:@"[\\d]+ ?g(\\s|\\)|$|,"], @"g", v43, 0);
  v48[0] = v42;
  v47[1] = @"mg";
  v5 = (void *)MEMORY[0x1E4F1C978];
  v6 = NSString;
  v41 = [(AXMTextLayoutManager *)self measurementFormatter];
  v40 = [MEMORY[0x1E4F291E8] milligrams];
  v39 = [v41 stringFromUnit:v40];
  v38 = [v6 stringWithFormat:@" %@", v39];
  v37 = [v5 arrayWithObjects:@"[\\d]+ ?mg(\\s|\\)|$|,"], @"mg", v38, 0);
  v48[1] = v37;
  v47[2] = @"mcg";
  v7 = (void *)MEMORY[0x1E4F1C978];
  objc_super v8 = NSString;
  v36 = [(AXMTextLayoutManager *)self measurementFormatter];
  v35 = [MEMORY[0x1E4F291E8] micrograms];
  v34 = [v36 stringFromUnit:v35];
  v33 = [v8 stringWithFormat:@" %@", v34];
  v32 = [v7 arrayWithObjects:@"[\\d]+ ?mcg(\\s|\\)|$|,"], @"mcg", v33, 0);
  v48[2] = v32;
  v47[3] = @"ml";
  v9 = (void *)MEMORY[0x1E4F1C978];
  v10 = NSString;
  v31 = [(AXMTextLayoutManager *)self measurementFormatter];
  v30 = [MEMORY[0x1E4F29228] milliliters];
  v29 = [v31 stringFromUnit:v30];
  v28 = [v10 stringWithFormat:@" %@", v29];
  v27 = [v9 arrayWithObjects:@"[\\d]+ ?ml(\\s|\\)|$|,"], @"ml", v28, 0);
  v48[3] = v27;
  v47[4] = @"kcal";
  v11 = (void *)MEMORY[0x1E4F1C978];
  v12 = NSString;
  v26 = [(AXMTextLayoutManager *)self measurementFormatter];
  v13 = [MEMORY[0x1E4F291B0] kilocalories];
  v14 = [v26 stringFromUnit:v13];
  v15 = [v12 stringWithFormat:@" %@", v14];
  v16 = [v11 arrayWithObjects:@"[\\d]+ ?kcal(\\s|\\)|$|,"], @"kcal", v15, 0);
  v48[4] = v16;
  v47[5] = @"kg";
  v17 = (void *)MEMORY[0x1E4F1C978];
  v18 = NSString;
  v19 = [(AXMTextLayoutManager *)self measurementFormatter];
  v20 = [MEMORY[0x1E4F291E8] kilograms];
  v21 = [v19 stringFromUnit:v20];
  v22 = [v18 stringWithFormat:@" %@", v21];
  v23 = [v17 arrayWithObjects:@"[\\d]+ ?kg(\\s|\\)|$|,"], @"kg", v22, 0);
  v48[5] = v23;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:6];

  return v24;
}

- (id)receiptRegularExpressions
{
  v2 = (void *)MEMORY[0x1E4F1C978];
  id v22 = 0;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"(?:subtotal|sub total) ?[$|€|R$]? ?[\\d]+\\.[\\d][\\d]" options:1 error:&v22];
  id v4 = v22;
  id v21 = v4;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"(?:sales tax)(?:[\\d][\\d]\\.[\\d][\\d][\\d]?%) ?[$|€|R$]? ?[\\d]+\\.[\\d][\\d]" options:1 error:&v21];
  id v6 = v21;

  id v20 = v6;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"(?:total) ?[$|€|R$]? ?[\\d]+\\.[\\d][\\d]" options:1 error:&v20];
  id v8 = v20;

  id v19 = v8;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"([a-zA-Z 0-9]+)([$|€]?[\\d]+\\.[\\d][\\d]) ([$|€|R$]?[\\d]+\\.[\\d][\\d])" options:1 error:&v19];
  id v10 = v19;

  id v18 = v10;
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"([a-zA-Z 0-9]+) ([\\d]+) ([$|€|R$]?[\\d]+\\.[\\d][\\d]) ([$|€]?[\\d]+\\.[\\d][\\d])" options:1 error:&v18];
  id v12 = v18;

  id v17 = v12;
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"[a-zA-Z 0-9]+ [$|€|R$]?[\\d]+\\.[\\d][\\d]" options:1 error:&v17];
  id v14 = v17;

  v15 = objc_msgSend(v2, "arrayWithObjects:", v3, v5, v7, v9, v11, v13, 0);

  return v15;
}

- (id)_assembleLayoutSequences:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = +[AXMLayoutSequence sequence:](AXMLayoutSequence, "sequence:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_assembleLayoutLines:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = AXMediaLogTextLayout();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[AXMTextLayoutManager _assembleLayoutLines:]();
  }

  id v28 = [MEMORY[0x1E4F1CA48] array];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v3;
  uint64_t v29 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v29)
  {
    uint64_t v27 = *(void *)v39;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v39 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v38 + 1) + 8 * v5);
        uint64_t v7 = AXMediaLogTextLayout();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v43 = v6;
          _os_log_debug_impl(&dword_1B57D5000, v7, OS_LOG_TYPE_DEBUG, "  Next sequence: %@", buf, 0xCu);
        }

        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v8 = v28;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v46 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v35;
LABEL_12:
          uint64_t v12 = 0;
          while (1)
          {
            if (*(void *)v35 != v11) {
              objc_enumerationMutation(v8);
            }
            long long v13 = *(void **)(*((void *)&v34 + 1) + 8 * v12);
            long long v14 = AXMediaLogTextLayout();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v43 = (uint64_t)v13;
              _os_log_debug_impl(&dword_1B57D5000, v14, OS_LOG_TYPE_DEBUG, "   Compare w/ line %@", buf, 0xCu);
            }

            [v13 height];
            double v16 = v15 * 0.3;
            uint64_t v17 = AXMediaLogTextLayout();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218240;
              uint64_t v43 = 0x403E000000000000;
              __int16 v44 = 2048;
              double v45 = v16;
              _os_log_debug_impl(&dword_1B57D5000, v17, OS_LOG_TYPE_DEBUG, "   threshold (%.0f%% of lineItem.height): %.2f", buf, 0x16u);
            }

            unsigned int v18 = [v13 metric:0 inProximityOfMetric:0 item:v6 threshold:v16];
            unsigned int v19 = [v13 metric:1 inProximityOfMetric:1 item:v6 threshold:v16];
            unsigned int v20 = v19;
            if (v18)
            {
              if (v19) {
                break;
              }
            }
            id v21 = AXMediaLogTextLayout();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218240;
              uint64_t v43 = v18;
              __int16 v44 = 2048;
              *(void *)&double v45 = v20;
              _os_log_debug_impl(&dword_1B57D5000, v21, OS_LOG_TYPE_DEBUG, "   sequence and line differ. height:%ld top:%ld", buf, 0x16u);
            }

            if (v10 == ++v12)
            {
              uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v46 count:16];
              if (v10) {
                goto LABEL_12;
              }
              goto LABEL_25;
            }
          }
          id v22 = v13;

          if (!v22) {
            goto LABEL_30;
          }
          v23 = AXMediaLogTextLayout();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
            -[AXMTextLayoutManager _assembleLayoutLines:](&v32, v33);
          }

          [v22 addSequence:v6];
        }
        else
        {
LABEL_25:

LABEL_30:
          v24 = AXMediaLogTextLayout();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
            -[AXMTextLayoutManager _assembleLayoutLines:](&v30, v31);
          }

          id v22 = +[AXMLayoutLine line:v6];
          [v8 addObject:v22];
        }

        ++v5;
      }
      while (v5 != v29);
      uint64_t v29 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v29);
  }

  return v28;
}

- (id)_assembleLayoutRegions:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = AXMediaLogTextLayout();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[AXMTextLayoutManager _assembleLayoutRegions:]();
  }

  id v30 = [MEMORY[0x1E4F1CA48] array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v3;
  uint64_t v31 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v31)
  {
    uint64_t v29 = *(void *)v41;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v41 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v40 + 1) + 8 * v5);
        uint64_t v7 = AXMediaLogTextLayout();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v45 = v6;
          _os_log_debug_impl(&dword_1B57D5000, v7, OS_LOG_TYPE_DEBUG, "  Next line: %@", buf, 0xCu);
        }

        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v8 = v30;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v48 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v37;
LABEL_12:
          uint64_t v12 = 0;
          while (1)
          {
            if (*(void *)v37 != v11) {
              objc_enumerationMutation(v8);
            }
            long long v13 = *(void **)(*((void *)&v36 + 1) + 8 * v12);
            long long v14 = AXMediaLogTextLayout();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v45 = (uint64_t)v13;
              _os_log_debug_impl(&dword_1B57D5000, v14, OS_LOG_TYPE_DEBUG, "   Compare w/ region %@", buf, 0xCu);
            }

            double v15 = [v13 firstLine];
            [v15 height];
            double v17 = v16 * 0.3;

            unsigned int v18 = AXMediaLogTextLayout();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218240;
              uint64_t v45 = 0x403E000000000000;
              __int16 v46 = 2048;
              double v47 = v17;
              _os_log_debug_impl(&dword_1B57D5000, v18, OS_LOG_TYPE_DEBUG, "   threshold (%.0f%% of regionItem.firstLine.height): %.2f", buf, 0x16u);
            }

            unsigned int v19 = [v13 firstLine];
            unsigned int v20 = [v19 metric:0 inProximityOfMetric:0 item:v6 threshold:v17];

            char v21 = [v13 metric:6 inProximityOfMetric:6 item:v6 threshold:v17];
            unsigned int v22 = [v13 metric:4 inProximityOfMetric:4 item:v6 threshold:5.0];
            if (v20)
            {
              if (v21) {
                break;
              }
            }
            v23 = AXMediaLogTextLayout();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218240;
              uint64_t v45 = v20;
              __int16 v46 = 2048;
              *(void *)&double v47 = v22;
              _os_log_debug_impl(&dword_1B57D5000, v23, OS_LOG_TYPE_DEBUG, "   line and region differ. height:%ld left:%ld", buf, 0x16u);
            }

            if (v10 == ++v12)
            {
              uint64_t v10 = [v8 countByEnumeratingWithState:&v36 objects:v48 count:16];
              if (v10) {
                goto LABEL_12;
              }
              goto LABEL_25;
            }
          }
          id v24 = v13;

          if (!v24) {
            goto LABEL_30;
          }
          v25 = AXMediaLogTextLayout();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            -[AXMTextLayoutManager _assembleLayoutRegions:](&v34, v35);
          }

          [v24 addLine:v6];
        }
        else
        {
LABEL_25:

LABEL_30:
          v26 = AXMediaLogTextLayout();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
            -[AXMTextLayoutManager _assembleLayoutRegions:](&v32, v33);
          }

          id v24 = +[AXMLayoutRegion region:v6];
          [v8 addObject:v24];
        }

        ++v5;
      }
      while (v5 != v31);
      uint64_t v31 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v31);
  }

  return v30;
}

- (id)_assembleLayoutCellsWithFeatures:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = +[AXMLayoutCell sequence:](AXMLayoutCell, "sequence:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_assembleLayoutRow:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = AXMediaLogTextLayout();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v20 = v9;
          _os_log_debug_impl(&dword_1B57D5000, v10, OS_LOG_TYPE_DEBUG, "  Next cell: %@", buf, 0xCu);
        }

        if (v9)
        {
          uint64_t v11 = AXMediaLogTextLayout();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            -[AXMTextLayoutManager _assembleLayoutRow:](&v13, v14);
          }

          if (v6)
          {
            [v6 addCell:v9];
          }
          else
          {
            uint64_t v6 = +[AXMLayoutRow row:v9];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_assembleLayoutHeader:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = AXMediaLogTextLayout();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v20 = v9;
          _os_log_debug_impl(&dword_1B57D5000, v10, OS_LOG_TYPE_DEBUG, "  Next cell: %@", buf, 0xCu);
        }

        if (v9)
        {
          uint64_t v11 = AXMediaLogTextLayout();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            -[AXMTextLayoutManager _assembleLayoutHeader:](&v13, v14);
          }

          if (v6)
          {
            [v6 addCell:v9];
          }
          else
          {
            uint64_t v6 = +[AXMLayoutHeader header:v9];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_assembleLayoutColumn:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = a3;
  id v3 = [v14 reverseObjectEnumerator];
  uint64_t v4 = [v3 allObjects];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = AXMediaLogTextLayout();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v22 = v10;
          _os_log_debug_impl(&dword_1B57D5000, v11, OS_LOG_TYPE_DEBUG, "  Next cell: %@", buf, 0xCu);
        }

        if (v10)
        {
          long long v12 = AXMediaLogTextLayout();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
            -[AXMTextLayoutManager _assembleLayoutColumn:](&v15, v16);
          }

          if (v7)
          {
            [v7 addCell:v10];
          }
          else
          {
            uint64_t v7 = +[AXMLayoutColumn column:v10];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_assembleLayoutRowFromCell:(id)a3
{
  id v3 = +[AXMLayoutCell sequence:a3];
  uint64_t v4 = AXMediaLogTextLayout();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[AXMTextLayoutManager _assembleLayoutRowFromCell:]();
  }

  if (v3)
  {
    uint64_t v5 = AXMediaLogTextLayout();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[AXMTextLayoutManager _assembleLayoutRowFromCell:]();
    }

    uint64_t v6 = +[AXMLayoutRow row:v3];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_assembleLayoutTable:(id)a3 header:(id)a4 columnItems:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v29 = a5;
  uint64_t v9 = AXMediaLogTextLayout();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[AXMTextLayoutManager _assembleLayoutTable:header:columnItems:].cold.4();
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    char v13 = 0;
    uint64_t v14 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v41 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        long long v17 = AXMediaLogTextLayout();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v46 = v16;
          _os_log_debug_impl(&dword_1B57D5000, v17, OS_LOG_TYPE_DEBUG, "  Next row: %@", buf, 0xCu);
        }

        long long v18 = AXMediaLogTextLayout();
        BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
        if (v13)
        {
          if (v19) {
            -[AXMTextLayoutManager _assembleLayoutTable:header:columnItems:](&v38, v39);
          }

          [v13 addRow:v16];
        }
        else
        {
          if (v19) {
            -[AXMTextLayoutManager _assembleLayoutTable:header:columnItems:](&v36, v37);
          }

          char v13 = +[AXMLayoutTable region:row:](AXMLayoutTable, "region:row:", v8, v16, v29);
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v12);
  }
  else
  {
    char v13 = 0;
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v20 = v29;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v32 + 1) + 8 * j);
        v26 = AXMediaLogTextLayout();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v46 = v25;
          _os_log_debug_impl(&dword_1B57D5000, v26, OS_LOG_TYPE_DEBUG, "  Next column: %@", buf, 0xCu);
        }

        if (v13)
        {
          uint64_t v27 = AXMediaLogTextLayout();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
            -[AXMTextLayoutManager _assembleLayoutTable:header:columnItems:](&v30, v31);
          }

          [v13 addColumn:v25];
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v22);
  }

  return v13;
}

- (id)_assembleNutritionLabelLayoutWithRows:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = AXMediaLogTextLayout();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[AXMTextLayoutManager _assembleNutritionLabelLayoutWithRows:]();
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v12 = AXMediaLogTextLayout();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v25 = v11;
          _os_log_debug_impl(&dword_1B57D5000, v12, OS_LOG_TYPE_DEBUG, "  Next row: %@", buf, 0xCu);
        }

        char v13 = AXMediaLogTextLayout();
        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
        if (v8)
        {
          if (v14) {
            -[AXMTextLayoutManager _assembleNutritionLabelLayoutWithRows:](&v18, v19);
          }

          [v8 addRow:v11];
        }
        else
        {
          if (v14) {
            -[AXMTextLayoutManager _assembleNutritionLabelLayoutWithRows:](&v16, v17);
          }

          id v8 = +[AXMLayoutNutritionLabel region:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_assembleReceipt:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = AXMediaLogTextLayout();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[AXMTextLayoutManager _assembleReceipt:]();
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v12 = AXMediaLogTextLayout();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v25 = v11;
          _os_log_debug_impl(&dword_1B57D5000, v12, OS_LOG_TYPE_DEBUG, "  Next row: %@", buf, 0xCu);
        }

        char v13 = AXMediaLogTextLayout();
        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
        if (v8)
        {
          if (v14) {
            -[AXMTextLayoutManager _assembleReceipt:](&v18, v19);
          }

          [v8 addRow:v11];
        }
        else
        {
          if (v14) {
            -[AXMTextLayoutManager _assembleReceipt:](&v16, v17);
          }

          id v8 = +[AXMLayoutReceipt region:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)documentWithTextFeatures:(id)a3 canvasSize:(CGSize)a4 preferredLocales:(id)a5 applySemanticAnalysis:(BOOL)a6 error:(id *)a7
{
  BOOL v70 = a6;
  double height = a4.height;
  double width = a4.width;
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v67 = a5;
  if ([v12 count])
  {
    id v65 = v12;
    v64 = [(AXMTextLayoutManager *)self _assembleLayoutSequences:v12];
    [(AXMTextLayoutManager *)self _assembleLayoutLines:"_assembleLayoutLines:"];
    v63 = v66 = self;
    BOOL v19 = [(AXMTextLayoutManager *)self _assembleLayoutRegions:"_assembleLayoutRegions:"];
    v71 = [MEMORY[0x1E4F1CA48] array];
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id obj = v19;
    uint64_t v72 = [obj countByEnumeratingWithState:&v85 objects:v91 count:16];
    if (v72)
    {
      uint64_t v69 = *(void *)v86;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v86 != v69) {
            objc_enumerationMutation(obj);
          }
          uint64_t v74 = v20;
          long long v21 = *(void **)(*((void *)&v85 + 1) + 8 * v20);
          v76 = [MEMORY[0x1E4F1CA48] array];
          long long v81 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          v73 = v21;
          id v75 = [v21 lines];
          uint64_t v22 = [v75 countByEnumeratingWithState:&v81 objects:v90 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v82;
            do
            {
              for (uint64_t i = 0; i != v23; ++i)
              {
                if (*(void *)v82 != v24) {
                  objc_enumerationMutation(v75);
                }
                v26 = *(void **)(*((void *)&v81 + 1) + 8 * i);
                uint64_t v27 = [MEMORY[0x1E4F1CA48] array];
                long long v77 = 0u;
                long long v78 = 0u;
                long long v79 = 0u;
                long long v80 = 0u;
                id v28 = [v26 sequences];
                uint64_t v29 = [v28 countByEnumeratingWithState:&v77 objects:v89 count:16];
                if (v29)
                {
                  uint64_t v30 = v29;
                  uint64_t v31 = *(void *)v78;
                  do
                  {
                    for (uint64_t j = 0; j != v30; ++j)
                    {
                      if (*(void *)v78 != v31) {
                        objc_enumerationMutation(v28);
                      }
                      long long v33 = [*(id *)(*((void *)&v77 + 1) + 8 * j) feature];
                      [v27 addObject:v33];
                    }
                    uint64_t v30 = [v28 countByEnumeratingWithState:&v77 objects:v89 count:16];
                  }
                  while (v30);
                }

                long long v34 = objc_msgSend(v27, "ax_mappedArrayUsingBlock:", &__block_literal_global_14);
                long long v35 = [v34 componentsJoinedByString:@" "];

                [v26 normalizedFrame];
                double v37 = v36;
                double v39 = v38;
                double v41 = v40;
                double v43 = v42;
                __int16 v44 = [v26 recognizedTextFeatures];
                uint64_t v45 = +[AXMVisionFeature textLineWithText:boundingBox:recognizedTextFeatures:canvasSize:](AXMVisionFeature, "textLineWithText:boundingBox:recognizedTextFeatures:canvasSize:", v35, v44, v37, v39, v41, v43, width, height);

                [v76 addObject:v45];
              }
              uint64_t v23 = [v75 countByEnumeratingWithState:&v81 objects:v90 count:16];
            }
            while (v23);
          }

          uint64_t v46 = objc_msgSend(v76, "ax_mappedArrayUsingBlock:", &__block_literal_global_305);
          double v47 = [v46 componentsJoinedByString:@" "];

          if (v70)
          {
            uint64_t v48 = [(AXMTextLayoutManager *)v66 semanticTextFactory];
            v49 = [v67 firstObject];
            uint64_t v50 = [v48 semanticTextForText:v47 withLocale:v49];

            uint64_t v51 = [v50 isSemanticallyComplete];
            uint64_t v52 = [v50 transformedSpeechText];

            double v47 = (void *)v52;
          }
          else
          {
            uint64_t v51 = 1;
          }
          [v73 normalizedFrame];
          v53 = +[AXMVisionFeature textRegionWithText:isSpeakable:boundingBox:lines:canvasSize:](AXMVisionFeature, "textRegionWithText:isSpeakable:boundingBox:lines:canvasSize:", v47, v51, v76);
          [v71 addObject:v53];

          uint64_t v20 = v74 + 1;
        }
        while (v74 + 1 != v72);
        uint64_t v72 = [obj countByEnumeratingWithState:&v85 objects:v91 count:16];
      }
      while (v72);
    }

    v54 = objc_msgSend(v71, "ax_filteredArrayUsingBlock:", &__block_literal_global_308_0);
    v55 = objc_msgSend(v54, "ax_mappedArrayUsingBlock:", &__block_literal_global_310_0);
    v56 = [v55 componentsJoinedByString:@". "];

    BOOL v57 = [v56 length] != 0;
    +[AXMLayoutItem normalizedBoundingFrameForItems:obj];
    +[AXMVisionFeature textDocumentWithText:isSpeakable:boundingBox:regions:canvasSize:](AXMVisionFeature, "textDocumentWithText:isSpeakable:boundingBox:regions:canvasSize:", v56, v57, v71);
    id v58 = (id)objc_claimAutoreleasedReturnValue();

    v59 = v58;
    id v12 = v65;
  }
  else
  {
    v60 = _AXMMakeError(0, @"no source texts provided", v13, v14, v15, v16, v17, v18, v62);
    id v58 = v60;
    if (a7)
    {
      id v58 = v60;
      v59 = 0;
      *a7 = v58;
    }
    else
    {
      v59 = 0;
    }
  }

  return v59;
}

uint64_t __105__AXMTextLayoutManager_documentWithTextFeatures_canvasSize_preferredLocales_applySemanticAnalysis_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 value];
}

uint64_t __105__AXMTextLayoutManager_documentWithTextFeatures_canvasSize_preferredLocales_applySemanticAnalysis_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 value];
}

uint64_t __105__AXMTextLayoutManager_documentWithTextFeatures_canvasSize_preferredLocales_applySemanticAnalysis_error___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isValueSpeakable];
}

uint64_t __105__AXMTextLayoutManager_documentWithTextFeatures_canvasSize_preferredLocales_applySemanticAnalysis_error___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 value];
}

- (id)envelopeWithTextFeatures:(id)a3 canvasSize:(CGSize)a4 preferredLocales:(id)a5 applySemanticAnalysis:(BOOL)a6 error:(id *)a7
{
  BOOL v88 = a6;
  double height = a4.height;
  double width = a4.width;
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v85 = a5;
  if ([v12 count])
  {
    id v83 = v12;
    long long v82 = [(AXMTextLayoutManager *)self _assembleLayoutSequences:v12];
    [(AXMTextLayoutManager *)self _assembleLayoutLines:"_assembleLayoutLines:"];
    long long v81 = v84 = self;
    BOOL v19 = [(AXMTextLayoutManager *)self _assembleLayoutRegions:"_assembleLayoutRegions:"];
    uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id v21 = v19;
    v89 = v21;
    uint64_t v90 = [v21 countByEnumeratingWithState:&v104 objects:v110 count:16];
    if (v90)
    {
      uint64_t v86 = *(void *)v105;
      long long v87 = v20;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v105 != v86) {
            objc_enumerationMutation(v21);
          }
          uint64_t v92 = v22;
          uint64_t v23 = *(void **)(*((void *)&v104 + 1) + 8 * v22);
          v94 = [MEMORY[0x1E4F1CA48] array];
          long long v100 = 0u;
          long long v101 = 0u;
          long long v102 = 0u;
          long long v103 = 0u;
          v91 = v23;
          id obj = [v23 lines];
          uint64_t v24 = [obj countByEnumeratingWithState:&v100 objects:v109 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v101;
            do
            {
              for (uint64_t i = 0; i != v25; ++i)
              {
                if (*(void *)v101 != v26) {
                  objc_enumerationMutation(obj);
                }
                id v28 = *(void **)(*((void *)&v100 + 1) + 8 * i);
                uint64_t v29 = [MEMORY[0x1E4F1CA48] array];
                long long v96 = 0u;
                long long v97 = 0u;
                long long v98 = 0u;
                long long v99 = 0u;
                uint64_t v30 = [v28 sequences];
                uint64_t v31 = [v30 countByEnumeratingWithState:&v96 objects:v108 count:16];
                if (v31)
                {
                  uint64_t v32 = v31;
                  uint64_t v33 = *(void *)v97;
                  do
                  {
                    for (uint64_t j = 0; j != v32; ++j)
                    {
                      if (*(void *)v97 != v33) {
                        objc_enumerationMutation(v30);
                      }
                      long long v35 = [*(id *)(*((void *)&v96 + 1) + 8 * j) feature];
                      [v29 addObject:v35];
                    }
                    uint64_t v32 = [v30 countByEnumeratingWithState:&v96 objects:v108 count:16];
                  }
                  while (v32);
                }

                double v36 = objc_msgSend(v29, "ax_mappedArrayUsingBlock:", &__block_literal_global_316_1);
                double v37 = [v36 componentsJoinedByString:@" "];

                [v28 normalizedFrame];
                double v39 = v38;
                double v41 = v40;
                double v43 = v42;
                double v45 = v44;
                uint64_t v46 = [v28 recognizedTextFeatures];
                double v47 = +[AXMVisionFeature textLineWithText:boundingBox:recognizedTextFeatures:canvasSize:](AXMVisionFeature, "textLineWithText:boundingBox:recognizedTextFeatures:canvasSize:", v37, v46, v39, v41, v43, v45, width, height);

                [v94 addObject:v47];
              }
              uint64_t v25 = [obj countByEnumeratingWithState:&v100 objects:v109 count:16];
            }
            while (v25);
          }

          uint64_t v48 = objc_msgSend(v94, "ax_mappedArrayUsingBlock:", &__block_literal_global_318_0);
          v49 = [v48 componentsJoinedByString:@" "];

          if (v88)
          {
            uint64_t v50 = [(AXMTextLayoutManager *)v84 semanticTextFactory];
            uint64_t v51 = [v85 firstObject];
            uint64_t v52 = [v50 semanticTextForText:v49 withLocale:v51];

            uint64_t v53 = [v52 isSemanticallyComplete];
            uint64_t v54 = [v52 transformedSpeechText];

            v49 = (void *)v54;
          }
          else
          {
            uint64_t v53 = 1;
          }
          uint64_t v20 = v87;
          id v21 = v89;
          [v91 normalizedFrame];
          v55 = +[AXMVisionFeature textRegionWithText:isSpeakable:boundingBox:lines:canvasSize:](AXMVisionFeature, "textRegionWithText:isSpeakable:boundingBox:lines:canvasSize:", v49, v53, v94);
          [v87 addObject:v55];

          uint64_t v22 = v92 + 1;
        }
        while (v92 + 1 != v90);
        uint64_t v90 = [v89 countByEnumeratingWithState:&v104 objects:v110 count:16];
      }
      while (v90);
    }

    v95 = objc_msgSend(v20, "ax_filteredArrayUsingBlock:", &__block_literal_global_320_0);
    v56 = objc_msgSend(v95, "ax_mappedArrayUsingBlock:", &__block_literal_global_322_0);
    BOOL v57 = [v56 componentsJoinedByString:@". "];

    id v58 = -[AXMTextLayoutManager extractDataFromEnvelopeWithFeatures:preferredLocales:canvasSize:](v84, "extractDataFromEnvelopeWithFeatures:preferredLocales:canvasSize:", v83, v85, width, height);
    v59 = [v58 firstObject];
    v60 = [v59 value];

    v61 = [v58 lastObject];
    uint64_t v62 = [v61 value];

    if (v60 && v62)
    {
      v63 = NSString;
      v64 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      id v65 = [v64 localizedStringForKey:@"envelope.address.formatter" value:&stru_1F0E72D10 table:@"Accessibility"];
      v66 = objc_msgSend(v63, "stringWithFormat:", v65, v60, v62);

      id v67 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v66, v57, 0);
      BOOL v68 = [v66 length] != 0;
      uint64_t v69 = v89;
      +[AXMLayoutItem normalizedBoundingFrameForItems:v89];
      BOOL v70 = v67;
      BOOL v71 = v68;
      uint64_t v72 = v58;
    }
    else
    {
      v76 = (void *)MEMORY[0x1E4F1C978];
      v66 = [MEMORY[0x1E4F1CA98] null];
      id v67 = objc_msgSend(v76, "arrayWithObjects:", v66, v57, 0);
      BOOL v77 = [v57 length] != 0;
      uint64_t v69 = v89;
      +[AXMLayoutItem normalizedBoundingFrameForItems:v89];
      BOOL v70 = v67;
      BOOL v71 = v77;
      uint64_t v72 = v20;
    }
    long long v78 = +[AXMVisionFeature envelopeWithText:isSpeakable:boundingBox:regions:canvasSize:](AXMVisionFeature, "envelopeWithText:isSpeakable:boundingBox:regions:canvasSize:", v70, v71, v72);

    id v74 = v78;
    id v75 = v74;
    id v12 = v83;
  }
  else
  {
    v73 = _AXMMakeError(0, @"no source texts provided", v13, v14, v15, v16, v17, v18, v80);
    id v74 = v73;
    if (a7)
    {
      id v74 = v73;
      id v75 = 0;
      *a7 = v74;
    }
    else
    {
      id v75 = 0;
    }
  }

  return v75;
}

uint64_t __105__AXMTextLayoutManager_envelopeWithTextFeatures_canvasSize_preferredLocales_applySemanticAnalysis_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 value];
}

uint64_t __105__AXMTextLayoutManager_envelopeWithTextFeatures_canvasSize_preferredLocales_applySemanticAnalysis_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 value];
}

uint64_t __105__AXMTextLayoutManager_envelopeWithTextFeatures_canvasSize_preferredLocales_applySemanticAnalysis_error___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isValueSpeakable];
}

uint64_t __105__AXMTextLayoutManager_envelopeWithTextFeatures_canvasSize_preferredLocales_applySemanticAnalysis_error___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 value];
}

- (id)extractDataFromEnvelopeWithFeatures:(id)a3 preferredLocales:(id)a4 canvasSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v67 = a4;
  v66 = [MEMORY[0x1E4F1CA48] array];
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v9 = v8;
  uint64_t v74 = [v9 countByEnumeratingWithState:&v77 objects:v81 count:16];
  if (!v74)
  {
    uint64_t v11 = 0;
    goto LABEL_29;
  }
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  double x = *MEMORY[0x1E4F1DB28];
  double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  uint64_t v72 = *(void *)v78;
  double v71 = 0.0;
  double v16 = 0.005;
  double v73 = 0.0;
  double v70 = 0.0;
  double v17 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v74; ++i)
    {
      if (*(void *)v78 != v72) {
        objc_enumerationMutation(v9);
      }
      BOOL v19 = *(void **)(*((void *)&v77 + 1) + 8 * i);
      id v76 = 0;
      uint64_t v20 = [MEMORY[0x1E4F28BE8] dataDetectorWithTypes:16 error:&v76];
      id v21 = v76;
      uint64_t v22 = [v19 value];
      uint64_t v23 = [v19 value];
      uint64_t v24 = objc_msgSend(v20, "numberOfMatchesInString:options:range:", v22, 0, 0, objc_msgSend(v23, "length"));

      if (v24)
      {
        if (v10)
        {
          [v19 normalizedFrame];
          if (vabdd_f64(v25, v73) < v16)
          {
            [v19 normalizedFrame];
            if (v71 - v26 < v70 + 0.01)
            {
              uint64_t v27 = NSString;
              id v28 = [v19 value];
              uint64_t v29 = [v27 stringWithFormat:@"%@, %@", v11, v28];

              [v19 normalizedFrame];
              v88.origin.double x = v30;
              v88.origin.double y = v31;
              v88.size.double width = v32;
              v88.size.double height = v33;
              v84.origin.double x = x;
              v84.origin.double y = y;
              v84.size.double width = v15;
              v84.size.double height = v14;
              CGRect v85 = CGRectUnion(v84, v88);
              double x = v85.origin.x;
              double y = v85.origin.y;
              double v15 = v85.size.width;
              double v14 = v85.size.height;
              goto LABEL_17;
            }
          }
        }
        else
        {
          uint64_t v29 = [v19 value];

          [v19 normalizedFrame];
          double x = v47;
          double y = v48;
          double v15 = v49;
          double v14 = v50;
          [v19 confidence];
          double v17 = v51;
          uint64_t v10 = [v9 indexOfObject:v19];
LABEL_17:
          uint64_t v11 = (void *)v29;
        }
        [v19 normalizedFrame];
        double v70 = v52;
        [v19 normalizedFrame];
        double v73 = v53;
        [v19 normalizedFrame];
        double v71 = v54;
        goto LABEL_25;
      }
      if (!v10) {
        goto LABEL_25;
      }
      long long v34 = [v9 objectAtIndexedSubscript:v10 - 1];
      long long v35 = [v9 objectAtIndexedSubscript:v10];
      [v34 normalizedFrame];
      BOOL v68 = v35;
      uint64_t v69 = v34;
      if (vabdd_f64(x, v36) >= v16)
      {
        double v43 = v11;
      }
      else
      {
        double v65 = v17;
        double v37 = v16;
        double v38 = width;
        double v39 = height;
        [v34 normalizedFrame];
        double v41 = v40 - y;
        [v35 normalizedFrame];
        double v43 = v11;
        if (v41 < v42 + 0.01)
        {
          double v44 = NSString;
          double v45 = [v34 value];
          uint64_t v46 = [v44 stringWithFormat:@"%@, %@", v45, v11];

          [v34 normalizedFrame];
          v89.origin.double x = x;
          v89.origin.double y = y;
          v89.size.double width = v15;
          v89.size.double height = v14;
          CGRect v87 = CGRectUnion(v86, v89);
          double x = v87.origin.x;
          double y = v87.origin.y;
          double v15 = v87.size.width;
          double v14 = v87.size.height;
          double v43 = (void *)v46;
        }
        double height = v39;
        double width = v38;
        double v16 = v37;
        double v17 = v65;
      }
      id v55 = v9;
      v56 = [v67 firstObject];
      BOOL v57 = [v56 localeIdentifier];
      if ([v57 isEqual:@"en-US"])
      {

LABEL_23:
        id v75 = v43;
        +[AXMAddressFormatter replaceDirectionalAbbreviations:&v75];
        id v61 = v75;

        double v43 = v61;
        goto LABEL_24;
      }
      id v58 = [v67 firstObject];
      v59 = [v58 localeIdentifier];
      int v60 = [v59 isEqual:@"en-CA"];

      if (v60) {
        goto LABEL_23;
      }
LABEL_24:
      id v9 = v55;
      uint64_t v11 = v43;
      uint64_t v62 = +[AXMVisionFeature envelopeRegion:boundingBox:confidence:canvasSize:](AXMVisionFeature, "envelopeRegion:boundingBox:confidence:canvasSize:", v43, x, y, v15, v14, v17, width, height);
      [v66 addObject:v62];

      uint64_t v10 = 0;
LABEL_25:
    }
    uint64_t v74 = [v9 countByEnumeratingWithState:&v77 objects:v81 count:16];
  }
  while (v74);
LABEL_29:

  v63 = [v66 sortedArrayUsingComparator:&__block_literal_global_340_0];

  return v63;
}

uint64_t __88__AXMTextLayoutManager_extractDataFromEnvelopeWithFeatures_preferredLocales_canvasSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 normalizedFrame];
  double v7 = v6;
  [v5 normalizedFrame];
  if (v7 >= v8)
  {
    [v4 normalizedFrame];
    double v11 = v10;
    [v5 normalizedFrame];
    if (v11 <= v12) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

- (id)documentWithTable:(id)a3 canvasSize:(CGSize)a4 preferredLocales:(id)a5 requestHandler:(id)a6 metrics:(id)a7 error:(id *)a8
{
  double height = a4.height;
  double width = a4.width;
  v175[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v140 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
  v138 = (void *)v18;
  id v139 = v16;
  id v130 = v17;
  if (!v14)
  {
    double v41 = (void *)v18;
    v127 = 0;
    id v129 = v15;
    v137 = 0;
    double v42 = 0;
    goto LABEL_22;
  }
  [v14 extent];
  unint64_t v20 = (unint64_t)v19;
  [v14 extent];
  uint64_t v22 = [(AXMTextLayoutManager *)self preprocessTable:v14 width:v20 height:(unint64_t)v21 metrics:v17];
  uint64_t v23 = (void *)[objc_alloc((Class)getVNImageRequestHandlerClass_0()) initWithCIImage:v22 options:MEMORY[0x1E4F1CC08]];
  id v24 = objc_alloc_init((Class)getVNDetectContoursRequestClass());
  v175[0] = v24;
  BOOL v25 = 1;
  double v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v175 count:1];
  id v169 = 0;
  int v27 = [v23 performRequests:v26 error:&v169];
  id v145 = v169;

  v147 = v24;
  if (v27)
  {
    id obj = v23;
    id v28 = [v24 results];
    uint64_t v29 = [v28 firstObject];

    v133 = [(AXMTextLayoutManager *)self sortContourRowResults:v29 maxWidth:0.9 maxHeight:0.5 minWidth:0.0 minHeight:0.0];
    CGFloat v30 = -[AXMTextLayoutManager getTableRows:](self, "getTableRows:");
    CGFloat v31 = [v30 reverseObjectEnumerator];
    uint64_t v32 = [v31 allObjects];

    CGFloat v33 = (void *)v32;
    v135 = (void *)v29;
    long long v34 = [(AXMTextLayoutManager *)self sortContourColumnResults:v29 maxWidth:0.5 maxHeight:0.5];
    v137 = [(AXMTextLayoutManager *)self getTableColumns:v34];
    BOOL v25 = -[AXMTextLayoutManager verifyTable:sortedColumns:](self, "verifyTable:sortedColumns:", v33);
    if (v25)
    {
      v124 = v22;
      v126 = v33;
      id v128 = v15;
      id v131 = v14;
      long long v35 = -[AXMTextLayoutManager textRowsForTable:sourceImage:requestHandler:canvasSize:](self, "textRowsForTable:sourceImage:requestHandler:canvasSize:", v33, v14, v139, width, height);
      if ([v35 count])
      {
        unint64_t v36 = 0;
        uint64_t v37 = 0;
        do
        {
          double v38 = [v35 objectAtIndex:v36];
          double v39 = [(AXMTextLayoutManager *)self _assembleLayoutCellsWithFeatures:v38];
          if (v36)
          {
            double v40 = [(AXMTextLayoutManager *)self _assembleLayoutRow:v39];
            [v140 addObject:v40];
          }
          else
          {
            [(AXMTextLayoutManager *)self _assembleLayoutHeader:v39];
            uint64_t v37 = v40 = (void *)v37;
          }

          ++v36;
        }
        while ([v35 count] > v36);
      }
      else
      {
        uint64_t v37 = 0;
      }
      double v44 = -[AXMTextLayoutManager textColumnsForTable:sourceImage:requestHandler:canvasSize:](self, "textColumnsForTable:sourceImage:requestHandler:canvasSize:", v137, v131, v139, width, height);
      if ([v44 count])
      {
        unint64_t v45 = 0;
        do
        {
          uint64_t v46 = [v44 objectAtIndex:v45];
          double v47 = [(AXMTextLayoutManager *)self _assembleLayoutCellsWithFeatures:v46];
          double v48 = [(AXMTextLayoutManager *)self _assembleLayoutColumn:v47];
          [v138 addObject:v48];

          ++v45;
        }
        while ([v44 count] > v45);
      }

      id v17 = v130;
      id v14 = v131;
      CGFloat v33 = v126;
      id v15 = v128;
      double v43 = v139;
      double v42 = (void *)v37;
      uint64_t v22 = v124;
    }
    else
    {
      double v42 = 0;
      double v43 = v139;
    }

    uint64_t v23 = obj;
  }
  else
  {
    v137 = 0;
    CGFloat v33 = 0;
    double v42 = 0;
    double v43 = v139;
  }

  if (v25)
  {
    v127 = v33;
    id v129 = v15;
    double v41 = v138;
LABEL_22:
    double v49 = (void *)[v140 copy];
    double v50 = (void *)[v41 copy];
    double v51 = [(AXMTextLayoutManager *)self _assembleLayoutTable:v49 header:v42 columnItems:v50];

    double v52 = [MEMORY[0x1E4F1CA48] array];
    v148 = [MEMORY[0x1E4F1CA48] array];
    double v53 = [MEMORY[0x1E4F1CA48] array];
    long long v165 = 0u;
    long long v166 = 0u;
    long long v167 = 0u;
    long long v168 = 0u;
    double v54 = [v42 cells];
    uint64_t v55 = [v54 countByEnumeratingWithState:&v165 objects:v174 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v166;
      do
      {
        for (uint64_t i = 0; i != v56; ++i)
        {
          if (*(void *)v166 != v57) {
            objc_enumerationMutation(v54);
          }
          v59 = [*(id *)(*((void *)&v165 + 1) + 8 * i) feature];
          [v53 addObject:v59];
        }
        uint64_t v56 = [v54 countByEnumeratingWithState:&v165 objects:v174 count:16];
      }
      while (v56);
    }
    id v132 = v14;

    double v60 = (double)(unint64_t)[v53 count];
    id v61 = objc_msgSend(v53, "ax_mappedArrayUsingBlock:", &__block_literal_global_342);
    uint64_t v62 = [v61 componentsJoinedByString:@", "];

    v134 = v42;
    [v42 normalizedFrame];
    v123 = (void *)v62;
    v125 = v53;
    v122 = +[AXMVisionFeature tableRowWithText:boundingBox:cells:canvasSize:](AXMVisionFeature, "tableRowWithText:boundingBox:cells:canvasSize:", v62, v53);
    objc_msgSend(v52, "addObject:");
    long long v163 = 0u;
    long long v164 = 0u;
    long long v161 = 0u;
    long long v162 = 0u;
    v136 = v51;
    id obja = [v51 rows];
    uint64_t v63 = [obja countByEnumeratingWithState:&v161 objects:v173 count:16];
    v146 = v52;
    if (v63)
    {
      uint64_t v64 = v63;
      uint64_t v65 = *(void *)v162;
      do
      {
        for (uint64_t j = 0; j != v64; ++j)
        {
          if (*(void *)v162 != v65) {
            objc_enumerationMutation(obja);
          }
          id v67 = *(void **)(*((void *)&v161 + 1) + 8 * j);
          BOOL v68 = [MEMORY[0x1E4F1CA48] array];
          long long v157 = 0u;
          long long v158 = 0u;
          long long v159 = 0u;
          long long v160 = 0u;
          uint64_t v69 = [v67 cells];
          uint64_t v70 = [v69 countByEnumeratingWithState:&v157 objects:v172 count:16];
          if (v70)
          {
            uint64_t v71 = v70;
            uint64_t v72 = *(void *)v158;
            do
            {
              for (uint64_t k = 0; k != v71; ++k)
              {
                if (*(void *)v158 != v72) {
                  objc_enumerationMutation(v69);
                }
                uint64_t v74 = [*(id *)(*((void *)&v157 + 1) + 8 * k) feature];
                [v68 addObject:v74];
              }
              uint64_t v71 = [v69 countByEnumeratingWithState:&v157 objects:v172 count:16];
            }
            while (v71);
          }

          double v60 = v60 + (double)(unint64_t)[v68 count];
          id v75 = objc_msgSend(v68, "ax_mappedArrayUsingBlock:", &__block_literal_global_347);
          id v76 = [v75 componentsJoinedByString:@", "];

          [v67 normalizedFrame];
          long long v77 = +[AXMVisionFeature tableRowWithText:boundingBox:cells:canvasSize:](AXMVisionFeature, "tableRowWithText:boundingBox:cells:canvasSize:", v76, v68);
          double v52 = v146;
          [v146 addObject:v77];
        }
        uint64_t v64 = [obja countByEnumeratingWithState:&v161 objects:v173 count:16];
      }
      while (v64);
    }

    long long v78 = objc_msgSend(v52, "ax_mappedArrayUsingBlock:", &__block_literal_global_349);
    v121 = [v78 componentsJoinedByString:@"; "];

    long long v155 = 0u;
    long long v156 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    id objb = [v136 columns];
    uint64_t v79 = [objb countByEnumeratingWithState:&v153 objects:v171 count:16];
    long long v80 = v148;
    if (v79)
    {
      uint64_t v81 = v79;
      uint64_t v82 = *(void *)v154;
      do
      {
        for (uint64_t m = 0; m != v81; ++m)
        {
          if (*(void *)v154 != v82) {
            objc_enumerationMutation(objb);
          }
          CGRect v84 = *(void **)(*((void *)&v153 + 1) + 8 * m);
          CGRect v85 = [MEMORY[0x1E4F1CA48] array];
          long long v149 = 0u;
          long long v150 = 0u;
          long long v151 = 0u;
          long long v152 = 0u;
          CGRect v86 = [v84 cells];
          uint64_t v87 = [v86 countByEnumeratingWithState:&v149 objects:v170 count:16];
          if (v87)
          {
            uint64_t v88 = v87;
            uint64_t v89 = *(void *)v150;
            do
            {
              for (uint64_t n = 0; n != v88; ++n)
              {
                if (*(void *)v150 != v89) {
                  objc_enumerationMutation(v86);
                }
                v91 = [*(id *)(*((void *)&v149 + 1) + 8 * n) feature];
                [v85 addObject:v91];
              }
              uint64_t v88 = [v86 countByEnumeratingWithState:&v149 objects:v170 count:16];
            }
            while (v88);
          }

          uint64_t v92 = objc_msgSend(v85, "ax_mappedArrayUsingBlock:", &__block_literal_global_354);
          v93 = [v92 componentsJoinedByString:@", "];

          [v84 normalizedFrame];
          v94 = +[AXMVisionFeature tableColumnWithText:boundingBox:cells:canvasSize:](AXMVisionFeature, "tableColumnWithText:boundingBox:cells:canvasSize:", v93, v85);
          long long v80 = v148;
          [v148 addObject:v94];
        }
        uint64_t v81 = [objb countByEnumeratingWithState:&v153 objects:v171 count:16];
      }
      while (v81);
    }

    v95 = NSString;
    long long v96 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    long long v97 = [v96 localizedStringForKey:@"math.table.row.format" value:&stru_1F0E72D10 table:@"Accessibility"];
    uint64_t v98 = objc_msgSend(v95, "localizedStringWithFormat:", v97, objc_msgSend(v146, "count"));

    long long v99 = NSString;
    long long v100 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    long long v101 = [v100 localizedStringForKey:@"math.table.column.format" value:&stru_1F0E72D10 table:@"Accessibility"];
    long long v102 = objc_msgSend(v99, "localizedStringWithFormat:", v101, objc_msgSend(v80, "count"));

    id objc = (id)v98;
    long long v103 = [NSString stringWithFormat:@"%@ %@", v98, v102];
    uint64_t v104 = [v146 count];
    double v105 = v60 / (double)(unint64_t)([v80 count] * v104) * 100.0;
    BOOL v106 = v105 < 100.0 && v105 >= 60.0;
    if (v106)
    {
      long long v107 = NSString;
      v108 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      v109 = [v108 localizedStringForKey:@"table.incomplete" value:&stru_1F0E72D10 table:@"Accessibility"];
      uint64_t v110 = objc_msgSend(v107, "localizedStringWithFormat:", v109, v103);

      long long v103 = (void *)v110;
      id v14 = v132;
      uint64_t v111 = v138;
    }
    else
    {
      id v14 = v132;
      uint64_t v111 = v138;
      if (v105 < 60.0)
      {
        id v112 = 0;
        v113 = v139;
        v114 = v146;
        v115 = v136;
        v116 = v148;
        v117 = v121;
LABEL_65:

        CGFloat v33 = v127;
        id v15 = v129;
        id v17 = v130;
        double v43 = v113;
        goto LABEL_67;
      }
    }
    BOOL v118 = [v121 length] != 0;
    v115 = v136;
    [v136 normalizedFrame];
    BOOL v119 = v118;
    v114 = v146;
    v117 = v121;
    v116 = v148;
    +[AXMVisionFeature tableWithText:isSpeakable:boundingBox:rows:columns:canvasSize:isIncomplete:](AXMVisionFeature, "tableWithText:isSpeakable:boundingBox:rows:columns:canvasSize:isIncomplete:", v103, v119, v146, v148, v106);
    id v112 = (id)objc_claimAutoreleasedReturnValue();
    v113 = v139;
    goto LABEL_65;
  }
  v134 = v42;
  id v112 = 0;
  uint64_t v111 = v138;
LABEL_67:

  return v112;
}

uint64_t __99__AXMTextLayoutManager_documentWithTable_canvasSize_preferredLocales_requestHandler_metrics_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 value];
}

uint64_t __99__AXMTextLayoutManager_documentWithTable_canvasSize_preferredLocales_requestHandler_metrics_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 value];
}

uint64_t __99__AXMTextLayoutManager_documentWithTable_canvasSize_preferredLocales_requestHandler_metrics_error___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 value];
}

uint64_t __99__AXMTextLayoutManager_documentWithTable_canvasSize_preferredLocales_requestHandler_metrics_error___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 value];
}

- (id)documentWithNutritionLabel:(id)a3 canvasSize:(CGSize)a4 requestHandler:(id)a5 metrics:(id)a6 error:(id *)a7
{
  double height = a4.height;
  double width = a4.width;
  v107[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v102 = *MEMORY[0x1E4F1DB28];
  long long v103 = v13;
  id v14 = [v11 properties];
  id v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F2FCA0]];
  uint64_t v16 = [v15 integerValue];

  if (v16 == 6)
  {
    uint64_t v17 = [v11 imageByApplyingOrientation:6];

    id v11 = (id)v17;
  }
  uint64_t v18 = [(AXMTextLayoutManager *)self preprocessNutritionLabel:v11 finalFrame:&v102];
  double v19 = (void *)[objc_alloc((Class)getVNImageRequestHandlerClass_0()) initWithCIImage:v18 options:MEMORY[0x1E4F1CC08]];
  id v20 = objc_alloc_init((Class)getVNDetectContoursRequestClass());
  v107[0] = v20;
  double v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:1];
  int v22 = [v19 performRequests:v21 error:0];

  uint64_t v23 = 0;
  if (v22)
  {
    id v83 = v20;
    CGRect v84 = v19;
    id v24 = [v20 results];
    uint64_t v25 = [v24 firstObject];

    uint64_t v82 = (void *)v25;
    double v26 = [(AXMTextLayoutManager *)self sortContourRowResults:v25 maxWidth:1.0 maxHeight:1.0 minWidth:0.0 minHeight:0.0];
    int v27 = [v26 reverseObjectEnumerator];
    uint64_t v28 = [v27 allObjects];

    id v87 = v11;
    [v11 extent];
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    CGRect v85 = v18;
    [v18 extent];
    uint64_t v81 = (void *)v28;
    long long v80 = -[AXMTextLayoutManager nutritionLabelRowsForContourResults:normalizedNutritionLabelFrame:fullImageFrame:processedImageFrame:](self, "nutritionLabelRowsForContourResults:normalizedNutritionLabelFrame:fullImageFrame:processedImageFrame:", v28, v102, v103, v30, v32, v34, v36, v37, v38, v39, v40);
    id v86 = v12;
    double v41 = -[AXMTextLayoutManager featureCellsForNutritionLabelRows:withRequestHandler:withCanvasSize:](self, "featureCellsForNutritionLabelRows:withRequestHandler:withCanvasSize:", width, height);
    double v42 = [MEMORY[0x1E4F1CA48] array];
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id v43 = v41;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v98 objects:v106 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v99;
      do
      {
        for (uint64_t i = 0; i != v45; ++i)
        {
          if (*(void *)v99 != v46) {
            objc_enumerationMutation(v43);
          }
          double v48 = *(void **)(*((void *)&v98 + 1) + 8 * i);
          double v49 = [v48 value];
          char v50 = [v49 isEqualToString:&stru_1F0E72D10];

          if ((v50 & 1) == 0)
          {
            double v51 = [(AXMTextLayoutManager *)self _assembleLayoutRowFromCell:v48];
            [v42 addObject:v51];
          }
        }
        uint64_t v45 = [v43 countByEnumeratingWithState:&v98 objects:v106 count:16];
      }
      while (v45);
    }
    long long v78 = v43;

    uint64_t v79 = v42;
    double v52 = (void *)[v42 copy];
    double v53 = [(AXMTextLayoutManager *)self _assembleNutritionLabelLayoutWithRows:v52];

    uint64_t v89 = [MEMORY[0x1E4F1CA48] array];
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v77 = v53;
    id obj = [v53 rows];
    uint64_t v54 = [obj countByEnumeratingWithState:&v94 objects:v105 count:16];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v56 = *(void *)v95;
      do
      {
        for (uint64_t j = 0; j != v55; ++j)
        {
          if (*(void *)v95 != v56) {
            objc_enumerationMutation(obj);
          }
          id v58 = *(void **)(*((void *)&v94 + 1) + 8 * j);
          v59 = [MEMORY[0x1E4F1CA48] array];
          long long v90 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          double v60 = [v58 cells];
          uint64_t v61 = [v60 countByEnumeratingWithState:&v90 objects:v104 count:16];
          if (v61)
          {
            uint64_t v62 = v61;
            uint64_t v63 = *(void *)v91;
            do
            {
              for (uint64_t k = 0; k != v62; ++k)
              {
                if (*(void *)v91 != v63) {
                  objc_enumerationMutation(v60);
                }
                uint64_t v65 = [*(id *)(*((void *)&v90 + 1) + 8 * k) feature];
                [v59 addObject:v65];
              }
              uint64_t v62 = [v60 countByEnumeratingWithState:&v90 objects:v104 count:16];
            }
            while (v62);
          }

          v66 = objc_msgSend(v59, "ax_mappedArrayUsingBlock:", &__block_literal_global_368);
          id v67 = [v66 componentsJoinedByString:@", "];

          [v58 normalizedFrame];
          BOOL v68 = +[AXMVisionFeature tableRowWithText:boundingBox:cells:canvasSize:](AXMVisionFeature, "tableRowWithText:boundingBox:cells:canvasSize:", v67, v59);
          [v89 addObject:v68];
        }
        uint64_t v55 = [obj countByEnumeratingWithState:&v94 objects:v105 count:16];
      }
      while (v55);
    }

    uint64_t v69 = NSString;
    uint64_t v70 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    uint64_t v71 = [v70 localizedStringForKey:@"nutrition.label.row.format" value:&stru_1F0E72D10 table:@"Accessibility"];
    uint64_t v72 = objc_msgSend(v69, "stringWithFormat:", v71, objc_msgSend(v89, "count"));

    double v73 = objc_msgSend(v89, "ax_mappedArrayUsingBlock:", &__block_literal_global_373);
    uint64_t v74 = [v73 componentsJoinedByString:@"; "];

    BOOL v75 = [v74 length] != 0;
    [v77 normalizedFrame];
    uint64_t v23 = +[AXMVisionFeature nutritionLabelWithText:isSpeakable:boundingBox:rows:canvasSize:](AXMVisionFeature, "nutritionLabelWithText:isSpeakable:boundingBox:rows:canvasSize:", v72, v75, v89);

    id v12 = v86;
    id v11 = v87;
    double v19 = v84;
    uint64_t v18 = v85;
    id v20 = v83;
  }

  return v23;
}

uint64_t __91__AXMTextLayoutManager_documentWithNutritionLabel_canvasSize_requestHandler_metrics_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 value];
}

uint64_t __91__AXMTextLayoutManager_documentWithNutritionLabel_canvasSize_requestHandler_metrics_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 value];
}

- (id)documentWithReceipt:(id)a3 withTextSkew:(double)a4 canvasSize:(CGSize)a5 preferredLocales:(id)a6 requestHandler:(id)a7 metrics:(id)a8 error:(id *)a9
{
  double height = a5.height;
  double width = a5.width;
  v106[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v75 = a6;
  id v77 = a7;
  id v76 = a8;
  [MEMORY[0x1E4F1CA48] array];
  v79 = long long v78 = v16;
  double v99 = 0.0;
  double v100 = 0.0;
  __asm { FMOV            V0.2D, #1.0 }
  long long v101 = _Q0;
  if (!v16) {
    goto LABEL_20;
  }
  long long v82 = _Q0;
  [v16 extent];
  unint64_t v23 = (unint64_t)v22;
  [v16 extent];
  uint64_t v25 = [(AXMTextLayoutManager *)self preprocessReceipt:v16 withTextSkew:v23 width:(unint64_t)v24 height:v76 metrics:v77 requestHandler:&v99 finalFrame:a4];
  double v26 = (void *)[objc_alloc((Class)getVNImageRequestHandlerClass_0()) initWithCIImage:v25 options:MEMORY[0x1E4F1CC08]];
  id v27 = objc_alloc_init((Class)getVNRecognizeTextRequestClass_0());
  uint64_t v28 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  [v27 setRecognitionLanguages:v28];

  [v27 setRecognitionLevel:0];
  [v27 setUsesLanguageCorrection:0];
  v106[0] = v27;
  double v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:1];
  id v98 = 0;
  int v30 = [v26 performRequests:v29 error:&v98];
  id v31 = v98;

  if (v30)
  {
    double v32 = [v27 results];
    if (![v32 count])
    {
      double v33 = (void *)[objc_alloc((Class)getVNImageRequestHandlerClass_0()) initWithCIImage:v78 options:MEMORY[0x1E4F1CC08]];

      id v105 = v27;
      double v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v105 count:1];
      id v97 = v31;
      int v35 = [v33 performRequests:v34 error:&v97];
      id v36 = v97;

      if (v35)
      {
        uint64_t v37 = [v27 results];

        double v99 = 0.0;
        double v100 = 0.0;
        double v32 = (void *)v37;
        long long v101 = v82;
      }
      goto LABEL_8;
    }
  }
  else
  {
    double v32 = 0;
  }
  id v36 = v31;
  double v33 = v26;
LABEL_8:
  if ([v32 count])
  {
    id v72 = v36;
    double v73 = v33;
    id obj = v27;
    id v83 = v25;
    uint64_t v71 = [v32 sortedArrayUsingComparator:&__block_literal_global_377];
    uint64_t v38 = -[AXMTextLayoutManager getReceiptRows:preferredLocales:canvasSize:](self, "getReceiptRows:preferredLocales:canvasSize:", width, height);
    uint64_t v39 = [MEMORY[0x1E4F1CA48] array];
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    id v40 = v38;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v93 objects:v104 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v94;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v94 != v43) {
            objc_enumerationMutation(v40);
          }
          uint64_t v45 = *(void **)(*((void *)&v93 + 1) + 8 * i);
          uint64_t v46 = [v45 value];
          char v47 = [v46 isEqual:&stru_1F0E72D10];

          if ((v47 & 1) == 0)
          {
            [v39 addObject:v45];
            double v48 = [(AXMTextLayoutManager *)self _assembleLayoutRowFromCell:v45];
            [v79 addObject:v48];
          }
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v93 objects:v104 count:16];
      }
      while (v42);
    }

    id v27 = obj;
    uint64_t v25 = v83;
    double v33 = v73;
    id v36 = v72;
  }

LABEL_20:
  double v49 = (void *)[v79 copy];
  char v50 = [(AXMTextLayoutManager *)self _assembleReceipt:v49];

  CGRect v84 = [MEMORY[0x1E4F1CA48] array];
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  uint64_t v74 = v50;
  id obja = [v50 rows];
  uint64_t v51 = [obja countByEnumeratingWithState:&v89 objects:v103 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v90;
    do
    {
      for (uint64_t j = 0; j != v52; ++j)
      {
        if (*(void *)v90 != v53) {
          objc_enumerationMutation(obja);
        }
        uint64_t v55 = *(void **)(*((void *)&v89 + 1) + 8 * j);
        uint64_t v56 = [MEMORY[0x1E4F1CA48] array];
        long long v85 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        uint64_t v57 = [v55 cells];
        uint64_t v58 = [v57 countByEnumeratingWithState:&v85 objects:v102 count:16];
        if (v58)
        {
          uint64_t v59 = v58;
          uint64_t v60 = *(void *)v86;
          do
          {
            for (uint64_t k = 0; k != v59; ++k)
            {
              if (*(void *)v86 != v60) {
                objc_enumerationMutation(v57);
              }
              uint64_t v62 = [*(id *)(*((void *)&v85 + 1) + 8 * k) feature];
              [v56 addObject:v62];
            }
            uint64_t v59 = [v57 countByEnumeratingWithState:&v85 objects:v102 count:16];
          }
          while (v59);
        }

        uint64_t v63 = objc_msgSend(v56, "ax_mappedArrayUsingBlock:", &__block_literal_global_379);
        uint64_t v64 = [v63 componentsJoinedByString:@", "];

        [v55 normalizedFrame];
        uint64_t v65 = +[AXMVisionFeature tableRowWithText:boundingBox:cells:canvasSize:](AXMVisionFeature, "tableRowWithText:boundingBox:cells:canvasSize:", v64, v56);
        [v84 addObject:v65];
      }
      uint64_t v52 = [obja countByEnumeratingWithState:&v89 objects:v103 count:16];
    }
    while (v52);
  }

  v66 = objc_msgSend(v84, "ax_mappedArrayUsingBlock:", &__block_literal_global_381);
  id v67 = [v66 componentsJoinedByString:@"; "];

  BOOL v68 = [v67 length] != 0;
  uint64_t v69 = +[AXMVisionFeature receiptWithText:isSpeakable:boundingBox:regions:canvasSize:](AXMVisionFeature, "receiptWithText:isSpeakable:boundingBox:regions:canvasSize:", v67, v68, v84, v99, v100, v101, width, height);

  return v69;
}

uint64_t __114__AXMTextLayoutManager_documentWithReceipt_withTextSkew_canvasSize_preferredLocales_requestHandler_metrics_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 boundingBox];
  double MaxY = CGRectGetMaxY(v16);
  [v5 boundingBox];
  if (MaxY >= CGRectGetMaxY(v17))
  {
    [v4 boundingBox];
    double v8 = CGRectGetMaxY(v18);
    [v5 boundingBox];
    if (v8 <= CGRectGetMaxY(v19)
      && ([v4 boundingBox], double v10 = v9, objc_msgSend(v5, "boundingBox"), v10 >= v11))
    {
      [v4 boundingBox];
      double v13 = v12;
      [v5 boundingBox];
      uint64_t v7 = v13 > v14;
    }
    else
    {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

uint64_t __114__AXMTextLayoutManager_documentWithReceipt_withTextSkew_canvasSize_preferredLocales_requestHandler_metrics_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 value];
}

uint64_t __114__AXMTextLayoutManager_documentWithReceipt_withTextSkew_canvasSize_preferredLocales_requestHandler_metrics_error___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 value];
}

- (id)preprocessTable:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 metrics:(id)a6
{
  v86[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v73 = a6;
  uint64_t v74 = v8;
  double v9 = [v8 imageByApplyingFilter:@"CIPhotoEffectNoir"];
  double v10 = [v9 imageByApplyingFilter:@"CIColorInvert"];

  uint64_t v69 = *MEMORY[0x1E4F1E438];
  uint64_t v11 = *MEMORY[0x1E4F1E438];
  uint64_t v70 = *MEMORY[0x1E4F1E458];
  v85[0] = *MEMORY[0x1E4F1E458];
  v85[1] = v11;
  v86[0] = &unk_1F0E93EC0;
  v86[1] = &unk_1F0E93ED0;
  double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:v85 count:2];
  double v13 = [v10 imageByApplyingFilter:@"CIColorControls" withInputParameters:v12];

  double v14 = [v13 imageByApplyingFilter:@"CIColorThresholdOtsu"];

  unint64_t v71 = a5;
  id v15 = v14;
  int v16 = 3;
  float v17 = (float)(a5 / 0x1E);
  CGRect v18 = @"inputHeight";
  unint64_t v19 = 0x1E4F28000uLL;
  id v67 = v15;
  do
  {
    id v20 = v15;
    double v21 = [v15 imageByClampingToExtent];
    v83[1] = v18;
    v84[0] = &unk_1F0E93640;
    v83[0] = @"inputWidth";
    *(float *)&double v22 = v17;
    unint64_t v23 = [*(id *)(v19 + 3792) numberWithFloat:v22];
    v84[1] = v23;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:2];
    unint64_t v24 = v19;
    v26 = uint64_t v25 = v18;
    id v27 = [v21 imageByApplyingFilter:@"AXMCIMorphologyRectangleMinimum" withInputParameters:v26];
    [v8 extent];
    objc_msgSend(v27, "imageByCroppingToRect:");
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    CGRect v18 = v25;
    unint64_t v19 = v24;

    --v16;
  }
  while (v16);
  int v28 = 3;
  do
  {
    double v29 = v15;
    int v30 = [v15 imageByClampingToExtent];
    v81[0] = @"inputWidth";
    v81[1] = @"inputHeight";
    v82[0] = &unk_1F0E93640;
    *(float *)&double v31 = v17;
    double v32 = [*(id *)(v24 + 3792) numberWithFloat:v31];
    v82[1] = v32;
    double v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:2];
    double v34 = [v30 imageByApplyingFilter:@"AXMCIMorphologyRectangleMaximum" withInputParameters:v33];
    [v8 extent];
    objc_msgSend(v34, "imageByCroppingToRect:");
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    --v28;
  }
  while (v28);
  v66 = v15;
  id v35 = v67;
  int v36 = 3;
  BOOL v68 = v35;
  unint64_t v37 = 0x1E4F1C000uLL;
  uint64_t v38 = @"inputWidth";
  uint64_t v39 = &unk_1F0E93640;
  do
  {
    id v40 = v35;
    uint64_t v41 = objc_msgSend(v35, "imageByClampingToExtent", v66);
    v79[0] = v38;
    *(float *)&double v42 = (float)(a4 / 0x28);
    [NSNumber numberWithFloat:v42];
    v44 = uint64_t v43 = v38;
    v79[1] = @"inputHeight";
    v80[0] = v44;
    v80[1] = v39;
    [*(id *)(v37 + 2536) dictionaryWithObjects:v80 forKeys:v79 count:2];
    v46 = unint64_t v45 = v37;
    [v41 imageByApplyingFilter:@"AXMCIMorphologyRectangleMinimum" withInputParameters:v46];
    double v48 = v47 = v39;
    [v74 extent];
    objc_msgSend(v48, "imageByCroppingToRect:");
    id v35 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v39 = v47;
    unint64_t v37 = v45;

    uint64_t v38 = v43;
    --v36;
  }
  while (v36);
  int v49 = 3;
  do
  {
    char v50 = v35;
    uint64_t v51 = [v35 imageByClampingToExtent];
    v77[0] = v38;
    *(float *)&double v52 = (float)(a4 / 0x28);
    uint64_t v53 = [NSNumber numberWithFloat:v52];
    v77[1] = @"inputHeight";
    v78[0] = v53;
    v78[1] = v39;
    uint64_t v54 = [*(id *)(v37 + 2536) dictionaryWithObjects:v78 forKeys:v77 count:2];
    uint64_t v55 = [v51 imageByApplyingFilter:@"AXMCIMorphologyRectangleMaximum" withInputParameters:v54];
    [v74 extent];
    objc_msgSend(v55, "imageByCroppingToRect:");
    id v35 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v39 = v47;
    unint64_t v37 = v45;

    uint64_t v38 = v43;
    --v49;
  }
  while (v49);
  uint64_t v56 = objc_msgSend(v66, "mergeWithImage:withSize:withMetrics:", v35, v73, (double)a4, (double)v71);
  v75[0] = v70;
  v75[1] = v69;
  v76[0] = &unk_1F0E93EC0;
  v76[1] = &unk_1F0E93EE0;
  uint64_t v57 = [*(id *)(v45 + 2536) dictionaryWithObjects:v76 forKeys:v75 count:2];
  uint64_t v58 = [v56 imageByApplyingFilter:@"CIColorControls" withInputParameters:v57];

  uint64_t v59 = [v58 imageByApplyingFilter:@"CIColorInvert"];

  int v60 = 3;
  do
  {
    uint64_t v61 = v59;
    uint64_t v62 = [v59 imageByClampingToExtent];
    uint64_t v63 = [v62 imageByApplyingFilter:@"AXMCIMorphologyRectangleMinimum" withInputParameters:&unk_1F0E94350];
    [v74 extent];
    uint64_t v59 = objc_msgSend(v63, "imageByCroppingToRect:");

    --v60;
  }
  while (v60);
  uint64_t v64 = [v59 imageByApplyingFilter:@"CIColorThresholdOtsu"];

  return v64;
}

- (id)preprocessNutritionLabel:(id)a3 finalFrame:(CGRect *)a4
{
  v61[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x1E4F1E458];
  v60[0] = *MEMORY[0x1E4F1E480];
  v60[1] = v7;
  v61[0] = v6;
  v61[1] = &unk_1F0E93EC0;
  uint64_t v8 = *MEMORY[0x1E4F1E4E8];
  v60[2] = *MEMORY[0x1E4F1E438];
  v60[3] = v8;
  v61[2] = &unk_1F0E93EF0;
  v61[3] = &unk_1F0E93F00;
  unint64_t v9 = 0x1E4F1C000uLL;
  double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:4];
  uint64_t v11 = [v6 imageByApplyingFilter:@"CIColorControls" withInputParameters:v10];

  double v12 = [v11 imageByApplyingFilter:@"CIColorInvert"];

  double v13 = [(AXMTextLayoutManager *)self largestDetectedContoursForImage:v12];
  if ([v13 count])
  {
    [v6 extent];
    -[AXMTextLayoutManager detectCenterContourFromContours:withImageExtent:](self, "detectCenterContourFromContours:withImageExtent:", v13);
    a4->origin.double x = v14;
    a4->origin.double y = v15;
    a4->size.double width = v16;
    a4->size.double height = v17;
    [v6 extent];
    unint64_t v19 = (unint64_t)v18;
    id v55 = v6;
    [v6 extent];
    -[AXMTextLayoutManager imageRectForNormalizedRect:imageWidth:imageHeight:](self, "imageRectForNormalizedRect:imageWidth:imageHeight:", v19, (unint64_t)v20, a4->origin.x, a4->origin.y, a4->size.width, a4->size.height);
    uint64_t v54 = v12;
    double v21 = objc_msgSend(v12, "imageByCroppingToRect:");
    [v21 extent];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    [v21 extent];
    double v31 = v30 / 55.0;
    id v32 = v21;
    int v33 = 6;
    double v34 = @"inputWidth";
    uint64_t v53 = v32;
    do
    {
      id v35 = v32;
      int v36 = objc_msgSend(v32, "imageByClampingToExtent", v53);
      v58[0] = v34;
      [NSNumber numberWithDouble:v31];
      v38 = unint64_t v37 = v34;
      v58[1] = @"inputHeight";
      v59[0] = v38;
      v59[1] = &unk_1F0E93640;
      [*(id *)(v9 + 2536) dictionaryWithObjects:v59 forKeys:v58 count:2];
      v40 = unint64_t v39 = v9;
      uint64_t v41 = [v36 imageByApplyingFilter:@"AXMCIMorphologyRectangleMinimum" withInputParameters:v40];
      objc_msgSend(v41, "imageByCroppingToRect:", v23, v25, v27, v29);
      id v32 = (id)objc_claimAutoreleasedReturnValue();

      unint64_t v9 = v39;
      double v34 = v37;

      --v33;
    }
    while (v33);
    double v42 = v31 + 40.0;
    int v43 = 6;
    do
    {
      uint64_t v44 = v32;
      unint64_t v45 = [v32 imageByClampingToExtent];
      v56[0] = v34;
      uint64_t v46 = [NSNumber numberWithDouble:v42];
      v56[1] = @"inputHeight";
      v57[0] = v46;
      v57[1] = &unk_1F0E93640;
      char v47 = [*(id *)(v9 + 2536) dictionaryWithObjects:v57 forKeys:v56 count:2];
      double v48 = [v45 imageByApplyingFilter:@"AXMCIMorphologyRectangleMaximum" withInputParameters:v47];
      objc_msgSend(v48, "imageByCroppingToRect:", v23, v25, v27, v29);
      id v32 = (id)objc_claimAutoreleasedReturnValue();

      unint64_t v9 = v39;
      double v34 = v37;

      --v43;
    }
    while (v43);
    int v49 = [v32 imageByApplyingFilter:@"CIColorInvert"];

    [v53 extent];
    uint64_t v51 = [v49 addBorderWithBorderSize:v50 * 0.01];

    double v12 = v54;
    id v6 = v55;
  }
  else
  {
    uint64_t v51 = 0;
  }

  return v51;
}

- (id)preprocessReceipt:(id)a3 withTextSkew:(double)a4 width:(unint64_t)a5 height:(unint64_t)a6 metrics:(id)a7 requestHandler:(id)a8 finalFrame:(CGRect *)a9
{
  v48[3] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  CGFloat v14 = [v13 imageByApplyingFilter:@"CIColorThresholdOtsu"];
  uint64_t v15 = *MEMORY[0x1E4F1E438];
  v47[0] = *MEMORY[0x1E4F1E458];
  v47[1] = v15;
  v48[0] = &unk_1F0E93EC0;
  v48[1] = &unk_1F0E93EE0;
  v47[2] = *MEMORY[0x1E4F1E4E8];
  v48[2] = &unk_1F0E93F00;
  CGFloat v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:3];
  CGFloat v17 = [v14 imageByApplyingFilter:@"CIColorControls" withInputParameters:v16];

  double v18 = [(AXMTextLayoutManager *)self largestDetectedContoursForImage:v17];
  uint64_t v19 = [v18 count];
  [v13 extent];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  if (v19)
  {
    -[AXMTextLayoutManager detectCenterContourFromContours:withImageExtent:](self, "detectCenterContourFromContours:withImageExtent:", v18, v21, v23, v25, v27);
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    -[AXMTextLayoutManager imageRectForNormalizedRect:imageWidth:imageHeight:](self, "imageRectForNormalizedRect:imageWidth:imageHeight:", a5, a6);
    double v21 = v36;
    double v23 = v37;
    double v25 = v38;
    double v27 = v39;
  }
  else
  {
    CGFloat v33 = 1.0;
    CGFloat v29 = 0.0;
    CGFloat v31 = 0.0;
    CGFloat v35 = 1.0;
  }
  a9->origin.double x = v29;
  a9->origin.double y = v31;
  a9->size.double width = v33;
  a9->size.double height = v35;
  id v40 = objc_msgSend(v17, "imageByCroppingToRect:", v21, v23, v25, v27);
  long long v41 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v46.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v46.c = v41;
  *(_OWORD *)&v46.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&v45.a = *(_OWORD *)&v46.a;
  *(_OWORD *)&v45.c = v41;
  *(_OWORD *)&v45.tdouble x = *(_OWORD *)&v46.tx;
  CGAffineTransformRotate(&v46, &v45, -a4);
  CGAffineTransform v45 = v46;
  double v42 = [v40 imageByApplyingTransform:&v45];

  return v42;
}

- (id)largestDetectedContoursForImage:(id)a3
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init((Class)getVNDetectContoursRequestClass());
  id v6 = (void *)[objc_alloc((Class)getVNImageRequestHandlerClass_0()) initWithCIImage:v4 options:MEMORY[0x1E4F1CC08]];
  v51[0] = v5;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
  id v48 = 0;
  int v8 = [v6 performRequests:v7 error:&v48];
  id v9 = v48;

  if (v8)
  {
    id v36 = v4;
    double v10 = [v5 results];
    uint64_t v11 = [v10 firstObject];

    double v12 = [MEMORY[0x1E4F1CA48] array];
    id v35 = v5;
    if ([v11 contourCount] >= 1)
    {
      uint64_t v13 = 0;
      CGFloat v14 = v9;
      do
      {
        id v47 = v14;
        uint64_t v15 = [v11 contourAtIndex:v13 error:&v47];
        id v9 = v47;

        [v12 addObject:v15];
        ++v13;
        CGFloat v14 = v9;
      }
      while ([v11 contourCount] > v13);
    }
    CGFloat v33 = v11;
    id v34 = v9;
    CGFloat v16 = [v12 sortedArrayUsingComparator:&__block_literal_global_421];
    double v37 = v12;
    [v12 removeAllObjects];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = v16;
    uint64_t v17 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v44 != v19) {
            objc_enumerationMutation(obj);
          }
          id v21 = *(id *)(*((void *)&v43 + 1) + 8 * i);
          BoundingBodouble x = CGPathGetBoundingBox((CGPathRef)[v21 normalizedPath]);
          double x = BoundingBox.origin.x;
          double y = BoundingBox.origin.y;
          double width = BoundingBox.size.width;
          double height = BoundingBox.size.height;
          if (!-[AXMTextLayoutManager isBoundary:withinNormalizedDistance:ofBoundary:](self, "isBoundary:withinNormalizedDistance:ofBoundary:", 0, 0, 0x3FF0000000000000, 0x3FF0000000000000))
          {
            long long v41 = 0u;
            long long v42 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            id v26 = v37;
            uint64_t v27 = [v26 countByEnumeratingWithState:&v39 objects:v49 count:16];
            if (v27)
            {
              uint64_t v28 = v27;
              uint64_t v29 = *(void *)v40;
              while (2)
              {
                for (uint64_t j = 0; j != v28; ++j)
                {
                  if (*(void *)v40 != v29) {
                    objc_enumerationMutation(v26);
                  }
                  CGRect v54 = CGPathGetBoundingBox((CGPathRef)[*(id *)(*((void *)&v39 + 1) + 8 * j) normalizedPath]);
                  if (-[AXMTextLayoutManager isBoundary:withinNormalizedDistance:ofBoundary:](self, "isBoundary:withinNormalizedDistance:ofBoundary:", x, y, width, height, 0.02, *(void *)&v54.origin.x, *(void *)&v54.origin.y, *(void *)&v54.size.width, *(void *)&v54.size.height))
                  {

                    goto LABEL_21;
                  }
                }
                uint64_t v28 = [v26 countByEnumeratingWithState:&v39 objects:v49 count:16];
                if (v28) {
                  continue;
                }
                break;
              }
            }

            [v26 addObject:v21];
          }
LABEL_21:
          ;
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
      }
      while (v18);
    }

    CGFloat v31 = objc_msgSend(v37, "ax_filteredArrayUsingBlock:", &__block_literal_global_424);

    id v5 = v35;
    id v4 = v36;
    id v9 = v34;
  }
  else
  {
    CGFloat v31 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v31;
}

uint64_t __56__AXMTextLayoutManager_largestDetectedContoursForImage___block_invoke(int a1, id a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  BoundingBodouble x = CGPathGetBoundingBox((CGPathRef)[v4 normalizedPath]);
  double x = BoundingBox.origin.x;
  double y = BoundingBox.origin.y;
  double width = BoundingBox.size.width;
  double height = BoundingBox.size.height;
  id v10 = v5;
  uint64_t v11 = (const CGPath *)[v10 normalizedPath];

  CGRect v17 = CGPathGetBoundingBox(v11);
  if (height > v17.size.height && width > v17.size.width && y < v17.origin.y && x < v17.origin.x) {
    return -1;
  }
  else {
    return 1;
  }
}

BOOL __56__AXMTextLayoutManager_largestDetectedContoursForImage___block_invoke_2(int a1, id a2)
{
  BoundingBoCGFloat x = CGPathGetBoundingBox((CGPathRef)[a2 normalizedPath]);
  CGFloat x = BoundingBox.origin.x;
  CGFloat y = BoundingBox.origin.y;
  CGFloat width = BoundingBox.size.width;
  CGFloat height = BoundingBox.size.height;
  BOOL result = 0;
  if (CGRectGetWidth(BoundingBox) > 0.25)
  {
    v8.origin.CGFloat x = x;
    v8.origin.CGFloat y = y;
    v8.size.CGFloat width = width;
    v8.size.CGFloat height = height;
    if (CGRectGetHeight(v8) > 0.25) {
      return 1;
    }
  }
  return result;
}

- (CGRect)detectCenterContourFromContours:(id)a3 withImageExtent:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat x = a4.origin.x;
  CGFloat y = a4.origin.y;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  CGFloat v8 = *MEMORY[0x1E4F1DB28];
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v12 = [v7 countByEnumeratingWithState:&v50 objects:v54 count:16];
  CGFloat v37 = v10;
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v51;
    CGFloat v38 = width;
    unint64_t v15 = (unint64_t)width;
    unint64_t v16 = (unint64_t)height;
    CGFloat v46 = v10;
    CGFloat v47 = v11;
    CGFloat v35 = v9;
    CGFloat v36 = v11;
    CGFloat v34 = v8;
    CGFloat v17 = height;
    CGFloat v18 = v9;
    double v39 = v17;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v51 != v14) {
          objc_enumerationMutation(v7);
        }
        BoundingBoCGFloat x = CGPathGetBoundingBox((CGPathRef)[*(id *)(*((void *)&v50 + 1) + 8 * i) normalizedPath]);
        CGFloat v44 = BoundingBox.origin.y;
        CGFloat v45 = BoundingBox.origin.x;
        CGFloat v42 = BoundingBox.size.height;
        CGFloat v43 = BoundingBox.size.width;
        -[AXMTextLayoutManager imageRectForNormalizedRect:imageWidth:imageHeight:](self, "imageRectForNormalizedRect:imageWidth:imageHeight:", v15, v16);
        CGFloat v21 = v20;
        CGFloat v48 = v22;
        CGFloat v24 = v23;
        CGFloat v26 = v25;
        double v49 = AXMRectDistance(x, y, v38, v17, v20, v22, v23, v25);
        double v27 = AXMRectDistance(x, y, v38, v17, v8, v18, v47, v46);
        v57.origin.CGFloat x = v8;
        v57.origin.CGFloat y = v18;
        v57.size.double width = v47;
        v57.size.double height = v46;
        v59.origin.CGFloat x = v21;
        v59.origin.CGFloat y = v48;
        v59.size.double width = v24;
        v59.size.double height = v26;
        BOOL v28 = CGRectContainsRect(v57, v59);
        if (v49 < v27 || v28)
        {
          CGFloat v8 = v21;
          CGFloat v18 = v48;
          CGFloat v46 = v26;
          CGFloat v47 = v24;
          CGFloat v36 = v43;
          CGFloat v37 = v42;
          CGFloat v34 = v45;
          CGFloat v35 = v44;
        }
        CGFloat v17 = v39;
      }
      uint64_t v13 = [v7 countByEnumeratingWithState:&v50 objects:v54 count:16];
    }
    while (v13);
  }
  else
  {
    CGFloat v35 = v9;
    CGFloat v36 = v11;
    CGFloat v34 = v8;
  }

  double v30 = v34;
  double v31 = v35;
  double v32 = v36;
  double v33 = v37;
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.CGFloat y = v31;
  result.origin.CGFloat x = v30;
  return result;
}

- (BOOL)isBoundary:(CGRect)a3 withinNormalizedDistance:(double)a4 ofBoundary:(CGRect)a5
{
  BOOL v6 = vabdd_f64(a3.origin.x, a5.origin.x) > a4;
  double v5 = vabdd_f64(a3.origin.y, a5.origin.y);
  BOOL v6 = v6 || v5 > a4;
  double v7 = vabdd_f64(a3.size.width, a5.size.width);
  BOOL v8 = v6 || v7 > a4;
  double v9 = vabdd_f64(a3.size.height, a5.size.height);
  return !v8 && v9 <= a4;
}

- (BOOL)isBoundary:(CGRect)a3 withinBoundary:(CGRect)a4 withNormalizedThreshold:(double)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v9 = a3.origin.y;
  CGFloat v10 = a3.origin.x;
  CGFloat v16 = a3.size.width;
  CGFloat v17 = a3.size.height;
  double MinX = CGRectGetMinX(a3);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  if (MinX < CGRectGetMinX(v18) - a5) {
    return 0;
  }
  v19.origin.CGFloat x = v10;
  v19.origin.CGFloat y = v9;
  v19.size.CGFloat width = v16;
  v19.size.CGFloat height = v17;
  double MinY = CGRectGetMinY(v19);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  if (MinY < CGRectGetMinY(v20) - a5) {
    return 0;
  }
  v21.origin.CGFloat x = v10;
  v21.origin.CGFloat y = v9;
  v21.size.CGFloat width = v16;
  v21.size.CGFloat height = v17;
  double MaxX = CGRectGetMaxX(v21);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  if (MaxX > CGRectGetMaxX(v22) + a5) {
    return 0;
  }
  v23.origin.CGFloat x = v10;
  v23.origin.CGFloat y = v9;
  v23.size.CGFloat width = v16;
  v23.size.CGFloat height = v17;
  double MaxY = CGRectGetMaxY(v23);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  return MaxY <= CGRectGetMaxY(v24) + a5;
}

- (CGRect)imageRectForNormalizedRect:(CGRect)a3 imageWidth:(unint64_t)a4 imageHeight:(unint64_t)a5
{
  double v5 = a3.origin.x * (double)a4;
  double v6 = a3.size.width * (double)a4;
  double v7 = a3.origin.y * (double)a5;
  double v8 = a3.size.height * (double)a5;
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v7;
  result.origin.CGFloat x = v5;
  return result;
}

- (id)processReceiptText:(id)a3 foundMerchantName:(BOOL *)a4 preferredLocales:(id)a5
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v113 = a5;
  uint64_t v111 = v8;
  if (*a4)
  {
    id v115 = 0;
    CGFloat v9 = [MEMORY[0x1E4F28BE8] dataDetectorWithTypes:16 error:&v115];
    id obj = v115;
    if (objc_msgSend(v9, "numberOfMatchesInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length")))
    {
      id v114 = v8;
      id v10 = v8;
      +[AXMAddressFormatter replaceDirectionalAbbreviations:&v114];
      id v11 = v114;

      id v12 = v11;
      id v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      uint64_t v14 = [v13 localizedStringForKey:@"image.text.address" value:&stru_1F0E72D10 table:@"Accessibility"];
      unint64_t v15 = [v14 stringByAppendingFormat:@", %@", v12];
      id v8 = v12;
    }
    else
    {
      v108 = v9;
      id v13 = objc_alloc_init(MEMORY[0x1E4F28E58]);
      CGFloat v35 = [MEMORY[0x1E4F28B88] symbolCharacterSet];
      [v13 formUnionWithCharacterSet:v35];

      CGFloat v36 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
      [v13 formUnionWithCharacterSet:v36];

      id v110 = v13;
      [v13 removeCharactersInString:@",$.€"];
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(v8, "length"));
      if ([v8 length])
      {
        unint64_t v37 = 0;
        do
        {
          uint64_t v38 = [v8 characterAtIndex:v37];
          double v39 = objc_msgSend(NSString, "stringWithFormat:", @"%C", v38);
          if ([v39 rangeOfCharacterFromSet:v13] == 0x7FFFFFFFFFFFFFFFLL) {
            objc_msgSend(v14, "appendFormat:", @"%C", v38);
          }
          else {
            objc_msgSend(v14, "appendFormat:", @"%s", " ");
          }

          ++v37;
          id v8 = v111;
        }
        while (v37 < [v111 length]);
      }
      uint64_t v40 = [v14 length];
      long long v41 = [(AXMTextLayoutManager *)self receiptRegularExpressions];
      CGFloat v42 = [v41 objectAtIndex:0];
      objc_msgSend(v42, "firstMatchInString:options:range:", v14, 0, 0, v40);
      id v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        uint64_t v43 = [v12 range];
        objc_msgSend(v14, "substringWithRange:", v43, v44);
        unint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        CGFloat v45 = [(AXMTextLayoutManager *)self receiptRegularExpressions];
        CGFloat v46 = [v45 objectAtIndex:1];
        CGFloat v47 = objc_msgSend(v46, "firstMatchInString:options:range:", v14, 0, 0, v40);

        if (v47)
        {
          uint64_t v48 = [v47 range];
          objc_msgSend(v14, "substringWithRange:", v48, v49);
          unint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          long long v50 = [(AXMTextLayoutManager *)self receiptRegularExpressions];
          long long v51 = [v50 objectAtIndex:2];
          long long v52 = objc_msgSend(v51, "firstMatchInString:options:range:", v14, 0, 0, v40);

          long long v53 = v52;
          if (v52)
          {
            uint64_t v54 = [v52 range];
            objc_msgSend(v14, "substringWithRange:", v54, v55);
            unint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
            CGFloat v9 = v108;
          }
          else
          {
            uint64_t v56 = [(AXMTextLayoutManager *)self receiptRegularExpressions];
            CGRect v57 = [v56 objectAtIndex:3];
            uint64_t v58 = objc_msgSend(v57, "firstMatchInString:options:range:", v14, 0, 0, v40);

            if (v58)
            {
              uint64_t v59 = [v58 rangeAtIndex:1];
              uint64_t v61 = v60;
              uint64_t v62 = [v58 rangeAtIndex:2];
              uint64_t v104 = v63;
              uint64_t v64 = [v58 rangeAtIndex:3];
              uint64_t v100 = v65;
              uint64_t v102 = v64;
              v66 = NSString;
              BOOL v106 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
              id v67 = [v106 localizedStringForKey:@"receipt.product.unitprice.total.formatter" value:&stru_1F0E72D10 table:@"Accessibility"];
              BOOL v68 = objc_msgSend(v14, "substringWithRange:", v59, v61);
              uint64_t v69 = objc_msgSend(v14, "substringWithRange:", v62, v104);
              uint64_t v70 = objc_msgSend(v14, "substringWithRange:", v102, v100);
              uint64_t v71 = objc_msgSend(v66, "stringWithFormat:", v67, v68, v69, v70);

              id v72 = (void *)v71;
              id v8 = v111;

              unint64_t v15 = [(AXMTextLayoutManager *)self filterReceiptForGarbageText:v71];
              id v73 = v58;
              CGFloat v9 = v108;
              id v13 = v110;
              long long v53 = 0;
            }
            else
            {
              uint64_t v74 = [(AXMTextLayoutManager *)self receiptRegularExpressions];
              id v75 = [v74 objectAtIndex:4];
              id v76 = objc_msgSend(v75, "firstMatchInString:options:range:", v14, 0, 0, v40);

              long long v107 = v76;
              if (v76)
              {
                uint64_t v77 = [v76 rangeAtIndex:1];
                uint64_t v79 = v78;
                uint64_t v80 = [v76 rangeAtIndex:2];
                uint64_t v103 = v81;
                uint64_t v101 = [v76 rangeAtIndex:3];
                uint64_t v99 = v82;
                uint64_t v97 = [v76 rangeAtIndex:4];
                uint64_t v84 = v83;
                id v105 = NSString;
                id v98 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
                long long v85 = [v98 localizedStringForKey:@"receipt.product.qty.unitprice.total.formatter" value:&stru_1F0E72D10 table:@"Accessibility"];
                long long v86 = objc_msgSend(v14, "substringWithRange:", v77, v79);
                long long v87 = objc_msgSend(v14, "substringWithRange:", v80, v103);
                long long v88 = objc_msgSend(v14, "substringWithRange:", v101, v99);
                long long v89 = objc_msgSend(v14, "substringWithRange:", v97, v84);
                long long v90 = objc_msgSend(v105, "stringWithFormat:", v85, v86, v87, v88, v89);

                id v8 = v111;
                unint64_t v15 = [(AXMTextLayoutManager *)self filterReceiptForGarbageText:v90];
              }
              else
              {
                long long v91 = [(AXMTextLayoutManager *)self receiptRegularExpressions];
                long long v92 = [v91 objectAtIndex:5];
                long long v90 = objc_msgSend(v92, "firstMatchInString:options:range:", v14, 0, 0, v40);

                if (v90)
                {
                  uint64_t v93 = [v90 range];
                  long long v95 = objc_msgSend(v14, "substringWithRange:", v93, v94);
                  unint64_t v15 = [(AXMTextLayoutManager *)self filterReceiptForGarbageText:v95];
                }
                else
                {
                  unint64_t v15 = &stru_1F0E72D10;
                }
              }
              CGFloat v9 = v108;
              id v13 = v110;
              long long v53 = 0;

              id v73 = 0;
              id v72 = v107;
            }
          }
        }
      }
    }
  }
  else
  {
    v109 = a4;
    uint64_t v16 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    CGFloat v17 = v8;
    CGRect v18 = (void *)v16;
    CGRect v19 = [v17 componentsSeparatedByCharactersInSet:v16];
    CGRect v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF != ''"];
    CGRect v21 = [v19 filteredArrayUsingPredicate:v20];

    CGRect v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    CGRect v23 = [v22 localizedStringForKey:@"image.text.name" value:&stru_1F0E72D10 table:@"Accessibility"];
    CGRect v24 = [v23 stringByAppendingString:@","];

    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    id obj = v21;
    uint64_t v25 = [obj countByEnumeratingWithState:&v116 objects:v120 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v117;
      while (2)
      {
        uint64_t v28 = 0;
        uint64_t v29 = v24;
        do
        {
          if (*(void *)v117 != v27) {
            objc_enumerationMutation(obj);
          }
          double v30 = *(void **)(*((void *)&v116 + 1) + 8 * v28);
          double v31 = [(AXMTextLayoutManager *)self semanticTextFactory];
          double v32 = [v113 firstObject];
          char v33 = [v31 _textExistsInLexicon:v30 withLocale:v32];

          if ((v33 & 1) == 0 && ![v30 intValue])
          {

            CGRect v24 = &stru_1F0E72D10;
            goto LABEL_23;
          }
          CGFloat v34 = [(__CFString *)v29 stringByAppendingString:@" "];
          CGRect v24 = [v34 stringByAppendingString:v30];

          ++v28;
          uint64_t v29 = v24;
        }
        while (v26 != v28);
        uint64_t v26 = [obj countByEnumeratingWithState:&v116 objects:v120 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }
LABEL_23:

    unint64_t v15 = [(AXMTextLayoutManager *)self filterReceiptForGarbageText:v24];

    if (([(__CFString *)v15 isEqualToString:&stru_1F0E72D10] & 1) == 0) {
      *v109 ^= 1u;
    }
    id v8 = v111;
  }

  return v15;
}

- (id)filterReceiptForGarbageText:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  double v6 = [v4 componentsSeparatedByCharactersInSet:v5];
  double v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF != ''"];
  id v8 = [v6 filteredArrayUsingPredicate:v7];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    id v13 = &stru_1F0E72D10;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        unint64_t v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend(v15, "length", (void)v24) >= 3
          && (unint64_t)[v15 length] <= 0x28
          && ![(AXMTextLayoutManager *)self hasConsecutiveCharacters:v15 withLength:5]&& ![(AXMTextLayoutManager *)self hasConsecutiveDigits:v15 withLength:3])
        {
          uint64_t v16 = [(__CFString *)v13 stringByAppendingString:@" "];
          uint64_t v17 = [v16 stringByAppendingString:v15];

          id v13 = (__CFString *)v17;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }
  else
  {
    id v13 = &stru_1F0E72D10;
  }

  CGRect v18 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  CGRect v19 = [(__CFString *)v13 componentsSeparatedByCharactersInSet:v18];
  CGRect v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF != ''"];
  CGRect v21 = [v19 filteredArrayUsingPredicate:v20];

  if ((unint64_t)[v21 count] >= 2) {
    CGRect v22 = v13;
  }
  else {
    CGRect v22 = &stru_1F0E72D10;
  }

  return v22;
}

- (BOOL)hasConsecutiveCharacters:(id)a3 withLength:(unint64_t)a4
{
  double v5 = (objc_class *)MEMORY[0x1E4F28FD8];
  id v6 = a3;
  id v7 = [v5 alloc];
  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"(.)\\1{%lu}", a4);
  uint64_t v12 = 0;
  id v9 = (void *)[v7 initWithPattern:v8 options:1 error:&v12];

  uint64_t v10 = objc_msgSend(v9, "firstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));

  return v10 != 0;
}

- (BOOL)hasConsecutiveDigits:(id)a3 withLength:(unint64_t)a4
{
  double v5 = (objc_class *)MEMORY[0x1E4F28FD8];
  id v6 = a3;
  id v7 = [v5 alloc];
  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"\\d{%lu}", a4);
  uint64_t v12 = 0;
  id v9 = (void *)[v7 initWithPattern:v8 options:1 error:&v12];

  uint64_t v10 = objc_msgSend(v9, "firstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));

  return v10 != 0;
}

- (id)sortContourRowResults:(id)a3 maxWidth:(double)a4 maxHeight:(double)a5 minWidth:(double)a6 minHeight:(double)a7
{
  id v11 = a3;
  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  if ([v11 contourCount] >= 1)
  {
    uint64_t v13 = 0;
    id v14 = 0;
    do
    {
      unint64_t v15 = v14;
      id v24 = v14;
      uint64_t v16 = [v11 contourAtIndex:v13 error:&v24];
      id v14 = v24;

      id v17 = v16;
      BoundingBodouble x = CGPathGetBoundingBox((CGPathRef)[v17 normalizedPath]);
      double x = BoundingBox.origin.x;
      double y = BoundingBox.origin.y;
      double width = BoundingBox.size.width;
      double height = BoundingBox.size.height;
      if (CGRectGetHeight(BoundingBox) <= a5)
      {
        v27.origin.double x = x;
        v27.origin.double y = y;
        v27.size.double width = width;
        v27.size.double height = height;
        if (CGRectGetHeight(v27) >= a7)
        {
          v28.origin.double x = x;
          v28.origin.double y = y;
          v28.size.double width = width;
          v28.size.double height = height;
          if (CGRectGetWidth(v28) <= a4)
          {
            v29.origin.double x = x;
            v29.origin.double y = y;
            v29.size.double width = width;
            v29.size.double height = height;
            if (CGRectGetWidth(v29) >= a6)
            {
              CGRect v22 = objc_msgSend(MEMORY[0x1E4F29238], "axmValueWithCGRect:", x, y, width, height);
              [v12 addObject:v22];
            }
          }
        }
      }

      ++v13;
    }
    while ([v11 contourCount] > v13);
  }
  [v12 sortUsingComparator:&__block_literal_global_469];

  return v12;
}

uint64_t __84__AXMTextLayoutManager_sortContourRowResults_maxWidth_maxHeight_minWidth_minHeight___block_invoke(uint64_t a1, void *a2, void *a3)
{
  memset(&v9, 0, sizeof(v9));
  id v4 = a3;
  [a2 getValue:&v9];
  memset(&v8, 0, sizeof(v8));
  [v4 getValue:&v8];

  double MinY = CGRectGetMinY(v9);
  if (MinY < CGRectGetMinY(v8)) {
    return -1;
  }
  double v7 = CGRectGetMinY(v9);
  return v7 > CGRectGetMinY(v8);
}

- (id)sortContourColumnResults:(id)a3 maxWidth:(double)a4 maxHeight:(double)a5
{
  id v7 = a3;
  CGRect v8 = [MEMORY[0x1E4F1CA48] array];
  if ([v7 contourCount] >= 1)
  {
    uint64_t v9 = 0;
    id v10 = 0;
    do
    {
      id v11 = v10;
      id v20 = v10;
      uint64_t v12 = [v7 contourAtIndex:v9 error:&v20];
      id v10 = v20;

      id v13 = v12;
      BoundingBodouble x = CGPathGetBoundingBox((CGPathRef)[v13 normalizedPath]);
      double x = BoundingBox.origin.x;
      double y = BoundingBox.origin.y;
      double width = BoundingBox.size.width;
      double height = BoundingBox.size.height;
      if (CGRectGetHeight(BoundingBox) < a5)
      {
        v23.origin.double x = x;
        v23.origin.double y = y;
        v23.size.double width = width;
        v23.size.double height = height;
        if (CGRectGetWidth(v23) < a4)
        {
          CGRect v18 = objc_msgSend(MEMORY[0x1E4F29238], "axmValueWithCGRect:", x, y, width, height);
          [v8 addObject:v18];
        }
      }

      ++v9;
    }
    while ([v7 contourCount] > v9);
  }
  [v8 sortUsingComparator:&__block_literal_global_471];

  return v8;
}

uint64_t __68__AXMTextLayoutManager_sortContourColumnResults_maxWidth_maxHeight___block_invoke(uint64_t a1, void *a2, void *a3)
{
  memset(&v9, 0, sizeof(v9));
  id v4 = a3;
  [a2 getValue:&v9];
  memset(&v8, 0, sizeof(v8));
  [v4 getValue:&v8];

  double MinX = CGRectGetMinX(v9);
  if (MinX < CGRectGetMinX(v8)) {
    return -1;
  }
  double v7 = CGRectGetMinX(v9);
  return v7 > CGRectGetMinX(v8);
}

- (id)getTableRows:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  double v5 = [MEMORY[0x1E4F1CA48] array];
  if ([v3 count])
  {
    unint64_t v6 = 0;
    do
    {
      memset(&v26, 0, sizeof(v26));
      double v7 = [v3 objectAtIndex:v6];
      [v7 getValue:&v26];

      CGRect v8 = NSNumber;
      CGFloat MinY = CGRectGetMinY(v26);
      *(float *)&CGFloat MinY = MinY;
      id v10 = [v8 numberWithFloat:MinY];
      char v11 = [v5 containsObject:v10];

      if ((v11 & 1) == 0)
      {
        uint64_t v12 = NSNumber;
        CGFloat v13 = CGRectGetMinY(v26);
        *(float *)&CGFloat v13 = v13;
        id v14 = [v12 numberWithFloat:v13];
        [v5 addObject:v14];
      }
      ++v6;
    }
    while ([v3 count] > v6);
  }
  unint64_t v15 = (void *)v4;
  if ([v5 count])
  {
    unint64_t v16 = 0;
    do
    {
      id v17 = [v5 objectAtIndex:v16];
      [v17 floatValue];
      double v19 = v18;

      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __37__AXMTextLayoutManager_getTableRows___block_invoke;
      v25[3] = &__block_descriptor_40_e25_B24__0_8__NSDictionary_16l;
      *(double *)&v25[4] = v19;
      id v20 = [MEMORY[0x1E4F28F60] predicateWithBlock:v25];
      CGRect v21 = [v3 filteredArrayUsingPredicate:v20];
      CGRect v22 = [v21 sortedArrayUsingComparator:&__block_literal_global_475];
      [v15 addObject:v22];

      ++v16;
    }
    while ([v5 count] > v16);
  }
  CGRect v23 = (void *)[v15 copy];

  return v23;
}

BOOL __37__AXMTextLayoutManager_getTableRows___block_invoke(uint64_t a1, void *a2)
{
  memset(&v4, 0, sizeof(v4));
  [a2 getValue:&v4];
  return CGRectGetMinY(v4) == *(double *)(a1 + 32);
}

uint64_t __37__AXMTextLayoutManager_getTableRows___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  memset(&v9, 0, sizeof(v9));
  id v4 = a3;
  [a2 getValue:&v9];
  memset(&v8, 0, sizeof(v8));
  [v4 getValue:&v8];

  double MinX = CGRectGetMinX(v9);
  if (MinX < CGRectGetMinX(v8)) {
    return -1;
  }
  double v7 = CGRectGetMinX(v9);
  return v7 > CGRectGetMinX(v8);
}

- (id)getTableColumns:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  double v5 = [MEMORY[0x1E4F1CA48] array];
  if ([v3 count])
  {
    unint64_t v6 = 0;
    do
    {
      memset(&v26, 0, sizeof(v26));
      double v7 = [v3 objectAtIndex:v6];
      [v7 getValue:&v26];

      CGRect v8 = NSNumber;
      CGFloat MinX = CGRectGetMinX(v26);
      *(float *)&CGFloat MinX = MinX;
      id v10 = [v8 numberWithFloat:MinX];
      char v11 = [v5 containsObject:v10];

      if ((v11 & 1) == 0)
      {
        uint64_t v12 = NSNumber;
        CGFloat v13 = CGRectGetMinX(v26);
        *(float *)&CGFloat v13 = v13;
        id v14 = [v12 numberWithFloat:v13];
        [v5 addObject:v14];
      }
      ++v6;
    }
    while ([v3 count] > v6);
  }
  unint64_t v15 = (void *)v4;
  if ([v5 count])
  {
    unint64_t v16 = 0;
    do
    {
      id v17 = [v5 objectAtIndex:v16];
      [v17 floatValue];
      double v19 = v18;

      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __40__AXMTextLayoutManager_getTableColumns___block_invoke;
      v25[3] = &__block_descriptor_40_e25_B24__0_8__NSDictionary_16l;
      *(double *)&v25[4] = v19;
      id v20 = [MEMORY[0x1E4F28F60] predicateWithBlock:v25];
      CGRect v21 = [v3 filteredArrayUsingPredicate:v20];
      CGRect v22 = [v21 sortedArrayUsingComparator:&__block_literal_global_477];
      [v15 addObject:v22];

      ++v16;
    }
    while ([v5 count] > v16);
  }
  CGRect v23 = (void *)[v15 copy];

  return v23;
}

BOOL __40__AXMTextLayoutManager_getTableColumns___block_invoke(uint64_t a1, void *a2)
{
  memset(&v4, 0, sizeof(v4));
  [a2 getValue:&v4];
  return CGRectGetMinX(v4) == *(double *)(a1 + 32);
}

uint64_t __40__AXMTextLayoutManager_getTableColumns___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  memset(&v9, 0, sizeof(v9));
  id v4 = a3;
  [a2 getValue:&v9];
  memset(&v8, 0, sizeof(v8));
  [v4 getValue:&v8];

  double MinY = CGRectGetMinY(v9);
  if (MinY < CGRectGetMinY(v8)) {
    return -1;
  }
  double v7 = CGRectGetMinY(v9);
  return v7 > CGRectGetMinY(v8);
}

- (BOOL)verifyTable:(id)a3 sortedColumns:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((unint64_t)[v5 count] < 2 || (unint64_t)objc_msgSend(v6, "count") < 2) {
    goto LABEL_26;
  }
  if ([v5 count])
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    while (1)
    {
      CGRect v9 = [v5 objectAtIndex:v7];
      if ((unint64_t)[v9 count] < 2) {
        ++v8;
      }
      long long v24 = 0u;
      long long v25 = 0u;
      id v10 = [v9 objectAtIndex:0];
      [v10 getValue:&v24];

      double v11 = *((double *)&v25 + 1);
      if ([v9 count]) {
        break;
      }
LABEL_11:

      if ([v5 count] <= (unint64_t)++v7) {
        goto LABEL_14;
      }
    }
    uint64_t v12 = 0;
    while (1)
    {
      long long v23 = 0u;
      CGFloat v13 = objc_msgSend(v9, "objectAtIndex:", v12, 0, 0, 0);
      [v13 getValue:&v22];

      if (vabdd_f64(*((double *)&v23 + 1), v11) > 0.005) {
        goto LABEL_25;
      }
      if ([v9 count] <= (unint64_t)++v12) {
        goto LABEL_11;
      }
    }
  }
  uint64_t v8 = 0;
LABEL_14:
  if (v8 == [v5 count]) {
    goto LABEL_26;
  }
  if ([v6 count])
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    while (1)
    {
      CGRect v9 = [v6 objectAtIndex:v14];
      if ((unint64_t)[v9 count] < 2) {
        ++v15;
      }
      long long v24 = 0u;
      long long v25 = 0u;
      unint64_t v16 = [v9 objectAtIndex:0];
      [v16 getValue:&v24];

      double v17 = *(double *)&v25;
      if ([v9 count]) {
        break;
      }
LABEL_23:

      if ([v6 count] <= (unint64_t)++v14) {
        goto LABEL_29;
      }
    }
    uint64_t v18 = 0;
    while (1)
    {
      long long v23 = 0u;
      double v19 = objc_msgSend(v9, "objectAtIndex:", v18, 0, 0);
      [v19 getValue:&v22];

      if (vabdd_f64(*(double *)&v23, v17) > 0.005) {
        break;
      }
      if ([v9 count] <= (unint64_t)++v18) {
        goto LABEL_23;
      }
    }
LABEL_25:

LABEL_26:
    BOOL v20 = 0;
    goto LABEL_27;
  }
  uint64_t v15 = 0;
LABEL_29:
  BOOL v20 = v15 != [v6 count];
LABEL_27:

  return v20;
}

- (id)nutritionLabelRowsForContourResults:(double)a3 normalizedNutritionLabelFrame:(double)a4 fullImageFrame:(double)a5 processedImageFrame:(double)a6
{
  id v23 = a11;
  long long v24 = [MEMORY[0x1E4F1CA48] array];
  if ([v23 count])
  {
    unint64_t v25 = 0;
    double v26 = 0.0;
    do
    {
      CGRect v27 = [v23 objectAtIndex:v25];
      [v27 AXMRectValue];
      double v29 = v28;

      if (v25)
      {
        double v30 = [v23 objectAtIndex:v25 - 1];
        [v30 AXMRectValue];
        double v32 = v31;

        double v33 = v32 - v29;
      }
      else
      {
        double v33 = 1.0 - v29 + -0.005;
        double v26 = a4 + a2;
      }
      double v26 = v26 - a15 * v33 / a8;
      CGFloat v34 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", a1, v26, a3 + 0.01);
      [v24 addObject:v34];

      ++v25;
    }
    while ([v23 count] > v25);
  }
  CGFloat v35 = [v24 lastObject];
  [v35 AXMRectValue];
  double v37 = v36 - a2;

  if (v37 > 0.05)
  {
    uint64_t v38 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", a1, a2, a3, v37);
    [v24 addObject:v38];
  }

  return v24;
}

- (id)getReceiptRows:(id)a3 preferredLocales:(id)a4 canvasSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v58 = a4;
  CGRect v9 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v54 = [MEMORY[0x1E4F1CA48] array];
  if ([v8 count])
  {
    unint64_t v10 = 0;
    double MaxY = 1.0;
    do
    {
      uint64_t v12 = [v8 objectAtIndex:v10];
      [v12 boundingBox];
      CGFloat v17 = v13;
      CGFloat v18 = v14;
      CGFloat v19 = v15;
      CGFloat v20 = v16;
      if (v10 && MaxY - CGRectGetMaxY(*(CGRect *)&v13) <= 0.006)
      {
        long long v22 = [v9 lastObject];
        [v22 addObject:v12];
      }
      else
      {
        CGRect v21 = [MEMORY[0x1E4F1CA48] arrayWithObject:v12];
        [v9 addObject:v21];

        v69.origin.double x = v17;
        v69.origin.double y = v18;
        v69.size.double width = v19;
        v69.size.double height = v20;
        double MaxY = CGRectGetMaxY(v69);
      }

      ++v10;
    }
    while ([v8 count] > v10);
  }
  long long v53 = v8;
  char v65 = 0;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = v9;
  uint64_t v59 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
  if (v59)
  {
    uint64_t v56 = *(void *)v62;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v62 != v56) {
          objc_enumerationMutation(obj);
        }
        uint64_t v60 = v23;
        long long v24 = [*(id *)(*((void *)&v61 + 1) + 8 * v23) sortedArrayUsingComparator:&__block_literal_global_479];
        unint64_t v25 = [v24 objectAtIndex:0];
        double v26 = [v25 topCandidates:1];
        CGRect v27 = [v26 firstObject];

        double v28 = [v27 string];
        double v29 = [v24 objectAtIndex:0];
        [v29 boundingBox];
        double x = v30;
        double y = v32;
        double v35 = v34;
        double v37 = v36;

        [v27 confidence];
        double v39 = v38;
        if ((unint64_t)[v24 count] < 2)
        {
          CGFloat v46 = v28;
        }
        else
        {
          unint64_t v40 = 1;
          do
          {
            long long v41 = [v24 objectAtIndex:v40];
            CGFloat v42 = [v41 topCandidates:1];
            uint64_t v43 = [v42 firstObject];

            uint64_t v44 = NSString;
            CGFloat v45 = [v43 string];
            CGFloat v46 = [v44 stringWithFormat:@"%@ %@", v28, v45, v53];

            [v41 boundingBox];
            v72.origin.double x = x;
            v72.origin.double y = y;
            v72.size.double width = v35;
            v72.size.double height = v37;
            CGRect v71 = CGRectUnion(v70, v72);
            double x = v71.origin.x;
            double y = v71.origin.y;
            double v35 = v71.size.width;
            double v37 = v71.size.height;
            [v27 confidence];
            double v39 = v39 + v47;

            ++v40;
            double v28 = v46;
          }
          while ([v24 count] > v40);
        }
        if ([v24 count]) {
          double v39 = v39 / (double)(unint64_t)[v24 count];
        }
        uint64_t v48 = [(AXMTextLayoutManager *)self processReceiptText:v46 foundMerchantName:&v65 preferredLocales:v58];
        uint64_t v49 = +[AXMVisionFeature tableCellWithText:boundingBox:confidence:recognizedTextFeatures:canvasSize:isHeader:](AXMVisionFeature, "tableCellWithText:boundingBox:confidence:recognizedTextFeatures:canvasSize:isHeader:", v48, MEMORY[0x1E4F1CBF0], 0, x, y, v35, v37, v39, width, height);
        [v49 confidence];
        if (v50 > 0.0) {
          [v54 addObject:v49];
        }

        uint64_t v23 = v60 + 1;
      }
      while (v60 + 1 != v59);
      uint64_t v59 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
    }
    while (v59);
  }

  long long v51 = (void *)[v54 copy];

  return v51;
}

uint64_t __67__AXMTextLayoutManager_getReceiptRows_preferredLocales_canvasSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 boundingBox];
  double v7 = v6;
  [v5 boundingBox];
  if (v7 >= v8)
  {
    [v4 boundingBox];
    double v11 = v10;
    [v5 boundingBox];
    uint64_t v9 = v11 > v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

- (id)textRowsForTable:(id)a3 sourceImage:(id)a4 requestHandler:(id)a5 canvasSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  v67[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v46 = [MEMORY[0x1E4F1CA48] array];
  id v11 = objc_alloc_init((Class)getVNRecognizeTextRequestClass_0());
  double v12 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  [v11 setRecognitionLanguages:v12];

  [v11 setRecognitionLevel:0];
  [v11 setUsesLanguageCorrection:0];
  v67[0] = v11;
  CGFloat v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:1];
  id v65 = 0;
  int v14 = [v10 performRequests:v13 error:&v65];
  id v15 = v65;

  if (v14)
  {
    id v43 = v15;
    id v44 = v11;
    id v45 = v10;
    uint64_t v49 = [v11 results];
    if ([v9 count])
    {
      unint64_t v16 = 0;
      float v47 = v9;
      do
      {
        CGFloat v17 = [v9 objectAtIndex:v16];
        uint64_t v48 = [MEMORY[0x1E4F1CA48] array];
        if ([v17 count])
        {
          uint64_t v18 = 0;
          double v50 = v17;
          unint64_t v51 = v16;
          do
          {
            long long v63 = 0u;
            long long v64 = 0u;
            CGFloat v19 = [v17 objectAtIndex:v18];
            [v19 getValue:&v63];

            v60[0] = MEMORY[0x1E4F143A8];
            v60[1] = 3221225472;
            v60[2] = __79__AXMTextLayoutManager_textRowsForTable_sourceImage_requestHandler_canvasSize___block_invoke;
            v60[3] = &__block_descriptor_64_e25_B24__0_8__NSDictionary_16l;
            long long v61 = v63;
            long long v62 = v64;
            uint64_t v20 = [MEMORY[0x1E4F28F60] predicateWithBlock:v60];
            CGRect v21 = [v49 filteredArrayUsingPredicate:v20];
            uint64_t v55 = [MEMORY[0x1E4F1CA48] array];
            long long v56 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            id obj = v21;
            uint64_t v22 = [obj countByEnumeratingWithState:&v56 objects:v66 count:16];
            long long v52 = (void *)v20;
            uint64_t v53 = v18;
            if (v22)
            {
              uint64_t v23 = v22;
              uint64_t v24 = *(void *)v57;
              double v25 = 0.0;
              double v26 = &stru_1F0E72D10;
              do
              {
                uint64_t v27 = 0;
                double v28 = v26;
                do
                {
                  if (*(void *)v57 != v24) {
                    objc_enumerationMutation(obj);
                  }
                  double v29 = [*(id *)(*((void *)&v56 + 1) + 8 * v27) topCandidates:1];
                  double v30 = [v29 firstObject];

                  double v31 = [v30 string];
                  double v32 = [v31 stringByReplacingOccurrencesOfString:@"," withString:&stru_1F0E72D10];

                  double v33 = [v32 stringByReplacingOccurrencesOfString:@";" withString:&stru_1F0E72D10];

                  if ([(__CFString *)v28 length]) {
                    uint64_t v34 = [(__CFString *)v28 length] + 1;
                  }
                  else {
                    uint64_t v34 = 0;
                  }
                  uint64_t v35 = [v33 length];
                  if ([(__CFString *)v28 isEqualToString:&stru_1F0E72D10])
                  {
                    double v36 = v33;
                  }
                  else
                  {
                    double v36 = [NSString stringWithFormat:@"%@ %@", v28, v33];
                  }
                  double v26 = v36;

                  [v30 confidence];
                  double v25 = v25 + v37;
                  float v38 = -[AXMVisionFeatureRecognizedText initWithRecognizedText:range:]([AXMVisionFeatureRecognizedText alloc], "initWithRecognizedText:range:", v30, v34, v35);
                  [v55 addObject:v38];

                  ++v27;
                  double v28 = v26;
                }
                while (v23 != v27);
                uint64_t v23 = [obj countByEnumeratingWithState:&v56 objects:v66 count:16];
              }
              while (v23);
            }
            else
            {
              double v25 = 0.0;
              double v26 = &stru_1F0E72D10;
            }
            unint64_t v16 = v51;

            unint64_t v39 = [obj count];
            unint64_t v40 = +[AXMVisionFeature tableCellWithText:boundingBox:confidence:recognizedTextFeatures:canvasSize:isHeader:](AXMVisionFeature, "tableCellWithText:boundingBox:confidence:recognizedTextFeatures:canvasSize:isHeader:", v26, v55, v51 == 0, v63, v64, v25 / (double)v39, width, height);
            [v40 confidence];
            if (v41 > 0.0) {
              [v48 addObject:v40];
            }

            uint64_t v18 = v53 + 1;
            CGFloat v17 = v50;
          }
          while ([v50 count] > (unint64_t)(v53 + 1));
        }
        if ([v48 count]) {
          [v46 addObject:v48];
        }

        ++v16;
        id v9 = v47;
      }
      while ([v47 count] > v16);
    }

    id v11 = v44;
    id v10 = v45;
    id v15 = v43;
  }

  return v46;
}

BOOL __79__AXMTextLayoutManager_textRowsForTable_sourceImage_requestHandler_canvasSize___block_invoke(CGRect *a1, void *a2)
{
  [a2 boundingBox];
  CGRect v13 = CGRectInset(v12, 0.005, 0.005);
  CGFloat x = v13.origin.x;
  CGFloat y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  double MinX = CGRectGetMinX(v13);
  if (MinX < CGRectGetMinX(a1[1])) {
    return 0;
  }
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v14);
  if (MaxX > CGRectGetMaxX(a1[1])) {
    return 0;
  }
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v15);
  if (MinY < CGRectGetMinY(a1[1])) {
    return 0;
  }
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v16);
  return MaxY <= CGRectGetMaxY(a1[1]);
}

- (id)textColumnsForTable:(id)a3 sourceImage:(id)a4 requestHandler:(id)a5 canvasSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  v69[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v48 = [MEMORY[0x1E4F1CA48] array];
  id v11 = objc_alloc_init((Class)getVNRecognizeTextRequestClass_0());
  CGRect v12 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  [v11 setRecognitionLanguages:v12];

  [v11 setRecognitionLevel:0];
  [v11 setUsesLanguageCorrection:0];
  v69[0] = v11;
  CGRect v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:1];
  id v67 = 0;
  int v14 = [v10 performRequests:v13 error:&v67];
  id v15 = v67;

  if (v14)
  {
    id v45 = v15;
    id v46 = v11;
    id v47 = v10;
    long long v52 = [v11 results];
    if ([v9 count])
    {
      uint64_t v16 = 0;
      CGFloat v17 = &stru_1F0E72D10;
      uint64_t v18 = @",";
      CGFloat v19 = @";";
      uint64_t v49 = v9;
      do
      {
        uint64_t v50 = v16;
        uint64_t v20 = [v9 objectAtIndex:v16];
        unint64_t v51 = [MEMORY[0x1E4F1CA48] array];
        if ([v20 count])
        {
          uint64_t v21 = 0;
          uint64_t v53 = v20;
          do
          {
            long long v65 = 0u;
            long long v66 = 0u;
            uint64_t v55 = v21;
            uint64_t v22 = [v20 objectAtIndex:v21];
            [v22 getValue:&v65];

            v62[0] = MEMORY[0x1E4F143A8];
            v62[1] = 3221225472;
            v62[2] = __82__AXMTextLayoutManager_textColumnsForTable_sourceImage_requestHandler_canvasSize___block_invoke;
            v62[3] = &__block_descriptor_64_e25_B24__0_8__NSDictionary_16l;
            long long v63 = v65;
            long long v64 = v66;
            uint64_t v54 = [MEMORY[0x1E4F28F60] predicateWithBlock:v62];
            uint64_t v23 = objc_msgSend(v52, "filteredArrayUsingPredicate:");
            long long v58 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            id obj = v23;
            uint64_t v24 = [v23 countByEnumeratingWithState:&v58 objects:v68 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = *(void *)v59;
              double v27 = 0.0;
              double v28 = v17;
              do
              {
                uint64_t v29 = 0;
                uint64_t v56 = v25;
                do
                {
                  if (*(void *)v59 != v26) {
                    objc_enumerationMutation(obj);
                  }
                  double v30 = [*(id *)(*((void *)&v58 + 1) + 8 * v29) topCandidates:1];
                  double v31 = [v30 firstObject];

                  if ([v28 isEqualToString:v17])
                  {
                    double v32 = [v31 string];
                    double v33 = [v32 stringByReplacingOccurrencesOfString:v18 withString:v17];
                  }
                  else
                  {
                    uint64_t v34 = NSString;
                    double v32 = [v31 string];
                    [v32 stringByReplacingOccurrencesOfString:v18 withString:v17];
                    uint64_t v35 = v26;
                    double v36 = v17;
                    float v37 = v19;
                    v39 = float v38 = v18;
                    double v33 = [v34 stringWithFormat:@"%@ %@", v28, v39];

                    double v28 = (void *)v39;
                    uint64_t v18 = v38;
                    CGFloat v19 = v37;
                    CGFloat v17 = v36;
                    uint64_t v26 = v35;
                    uint64_t v25 = v56;
                  }

                  double v28 = [v33 stringByReplacingOccurrencesOfString:v19 withString:v17];

                  [v31 confidence];
                  double v27 = v27 + v40;

                  ++v29;
                }
                while (v25 != v29);
                uint64_t v25 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
              }
              while (v25);
            }
            else
            {
              double v27 = 0.0;
              double v28 = v17;
            }
            unint64_t v41 = [obj count];
            CGFloat v42 = +[AXMVisionFeature tableCellWithText:boundingBox:confidence:recognizedTextFeatures:canvasSize:isHeader:](AXMVisionFeature, "tableCellWithText:boundingBox:confidence:recognizedTextFeatures:canvasSize:isHeader:", v28, MEMORY[0x1E4F1CBF0], 0, v65, v66, v27 / (double)v41, width, height);
            [v42 confidence];
            if (v43 > 0.0) {
              [v51 addObject:v42];
            }

            uint64_t v21 = v55 + 1;
            uint64_t v20 = v53;
          }
          while ([v53 count] > (unint64_t)(v55 + 1));
        }
        if ([v51 count]) {
          [v48 addObject:v51];
        }

        id v9 = v49;
        uint64_t v16 = v50 + 1;
      }
      while ([v49 count] > (unint64_t)(v50 + 1));
    }

    id v11 = v46;
    id v10 = v47;
    id v15 = v45;
  }

  return v48;
}

BOOL __82__AXMTextLayoutManager_textColumnsForTable_sourceImage_requestHandler_canvasSize___block_invoke(CGRect *a1, void *a2)
{
  [a2 boundingBox];
  CGRect v13 = CGRectInset(v12, 0.005, 0.005);
  CGFloat x = v13.origin.x;
  CGFloat y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  double MinX = CGRectGetMinX(v13);
  if (MinX < CGRectGetMinX(a1[1])) {
    return 0;
  }
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v14);
  if (MaxX > CGRectGetMaxX(a1[1])) {
    return 0;
  }
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v15);
  if (MinY < CGRectGetMinY(a1[1])) {
    return 0;
  }
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v16);
  return MaxY <= CGRectGetMaxY(a1[1]);
}

- (id)featureCellsForNutritionLabelRows:(id)a3 withRequestHandler:(id)a4 withCanvasSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  v65[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v45 = [MEMORY[0x1E4F1CA48] array];
  id v10 = objc_alloc_init((Class)getVNRecognizeTextRequestClass_0());
  id v11 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  [v10 setRecognitionLanguages:v11];

  [v10 setRecognitionLevel:0];
  [v10 setUsesLanguageCorrection:0];
  v65[0] = v10;
  CGRect v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:1];
  id v63 = 0;
  int v13 = [v9 performRequests:v12 error:&v63];
  id v14 = v63;

  if (v13)
  {
    id v42 = v14;
    id v43 = v10;
    id v44 = v9;
    id v48 = [v10 results];
    if ([v8 count])
    {
      uint64_t v15 = 0;
      id v47 = v8;
      do
      {
        long long v61 = 0u;
        long long v62 = 0u;
        uint64_t v51 = v15;
        CGRect v16 = [v8 objectAtIndex:v15];
        [v16 getValue:&v61];

        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        void v58[2] = __92__AXMTextLayoutManager_featureCellsForNutritionLabelRows_withRequestHandler_withCanvasSize___block_invoke;
        v58[3] = &unk_1E6117E10;
        v58[4] = self;
        long long v59 = v61;
        long long v60 = v62;
        uint64_t v50 = [MEMORY[0x1E4F28F60] predicateWithBlock:v58];
        CGFloat v17 = objc_msgSend(v48, "filteredArrayUsingPredicate:");
        uint64_t v18 = [v17 sortedArrayUsingComparator:&__block_literal_global_486];

        uint64_t v53 = [MEMORY[0x1E4F1CA48] array];
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id obj = v18;
        uint64_t v19 = [obj countByEnumeratingWithState:&v54 objects:v64 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v55;
          double v22 = 0.0;
          uint64_t v23 = &stru_1F0E72D10;
          do
          {
            uint64_t v24 = 0;
            uint64_t v25 = v23;
            do
            {
              if (*(void *)v55 != v21) {
                objc_enumerationMutation(obj);
              }
              uint64_t v26 = [*(id *)(*((void *)&v54 + 1) + 8 * v24) topCandidates:1];
              double v27 = [v26 firstObject];

              double v28 = [v27 string];
              uint64_t v29 = [v28 stringByReplacingOccurrencesOfString:@"," withString:&stru_1F0E72D10];

              double v30 = [v29 stringByReplacingOccurrencesOfString:@";" withString:&stru_1F0E72D10];

              if ([(__CFString *)v25 length]) {
                uint64_t v31 = [(__CFString *)v25 length] + 2;
              }
              else {
                uint64_t v31 = 0;
              }
              uint64_t v32 = [v30 length];
              if ([(__CFString *)v25 isEqualToString:&stru_1F0E72D10])
              {
                double v33 = v30;
              }
              else
              {
                double v33 = [NSString stringWithFormat:@"%@, %@", v25, v30];
              }
              uint64_t v23 = v33;

              [v27 confidence];
              double v22 = v22 + v34;
              uint64_t v35 = -[AXMVisionFeatureRecognizedText initWithRecognizedText:range:]([AXMVisionFeatureRecognizedText alloc], "initWithRecognizedText:range:", v27, v31, v32);
              [v53 addObject:v35];

              ++v24;
              uint64_t v25 = v23;
            }
            while (v20 != v24);
            uint64_t v20 = [obj countByEnumeratingWithState:&v54 objects:v64 count:16];
          }
          while (v20);
        }
        else
        {
          double v22 = 0.0;
          uint64_t v23 = &stru_1F0E72D10;
        }

        char v36 = AXMIsRunningInServiceProcess();
        uint64_t v37 = (uint64_t)v23;
        if ((v36 & 1) == 0)
        {
          uint64_t v37 = [(AXMTextLayoutManager *)self processNutritionLabelText:v23];
          id v46 = (void *)v37;
        }
        unint64_t v38 = [obj count];
        uint64_t v39 = +[AXMVisionFeature tableCellWithText:boundingBox:confidence:recognizedTextFeatures:canvasSize:isHeader:](AXMVisionFeature, "tableCellWithText:boundingBox:confidence:recognizedTextFeatures:canvasSize:isHeader:", v37, v53, 0, v61, v62, v22 / (double)v38, width, height);
        if ((v36 & 1) == 0) {

        }
        [v39 confidence];
        if (v40 > 0.0) {
          [v45 addObject:v39];
        }

        uint64_t v15 = v51 + 1;
        id v8 = v47;
      }
      while ([v47 count] > (unint64_t)(v51 + 1));
    }

    id v10 = v43;
    id v9 = v44;
    id v14 = v42;
  }

  return v45;
}

uint64_t __92__AXMTextLayoutManager_featureCellsForNutritionLabelRows_withRequestHandler_withCanvasSize___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isBoundary:withinBoundary:withNormalizedThreshold:", 0x3F7EB851EB851EB8);
}

uint64_t __92__AXMTextLayoutManager_featureCellsForNutritionLabelRows_withRequestHandler_withCanvasSize___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 topCandidates:1];
  id v3 = [v2 firstObject];

  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"\\d+%" options:1 error:0];
  id v5 = [v3 string];
  double v6 = [v3 string];
  double v7 = objc_msgSend(v4, "firstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v6, "length"));

  if (v7) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = -1;
  }

  return v8;
}

- (id)processNutritionLabelText:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v28 = 0;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"[0-9]/[0-9]" options:1 error:&v28];
  id v6 = v28;
  uint64_t v7 = [v4 length];
  uint64_t v8 = objc_msgSend(v5, "firstMatchInString:options:range:", v4, 0, 0, v7);

  id v9 = v4;
  if (v8)
  {
    id v22 = v6;
    uint64_t v23 = v5;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = objc_msgSend(v5, "matchesInString:options:range:", v4, 0, 0, v7);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    id v9 = v4;
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      id v9 = v4;
      do
      {
        uint64_t v14 = 0;
        uint64_t v15 = v9;
        do
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = [*(id *)(*((void *)&v24 + 1) + 8 * v14) range];
          uint64_t v18 = objc_msgSend(v15, "substringWithRange:", v16, v17);
          uint64_t v19 = [(AXMTextLayoutManager *)self processFraction:v18];
          id v9 = [v15 stringByReplacingOccurrencesOfString:v18 withString:v19];

          ++v14;
          uint64_t v15 = v9;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v12);
    }

    id v6 = v22;
    id v5 = v23;
  }
  uint64_t v20 = [(AXMTextLayoutManager *)self processMeasurement:v9];

  return v20;
}

- (id)processFraction:(id)a3
{
  id v4 = a3;
  id v5 = [v4 componentsSeparatedByString:@"/"];
  id v6 = [v5 objectAtIndex:0];

  if (v6)
  {
    uint64_t v7 = NSNumber;
    uint64_t v8 = [v5 objectAtIndex:0];
    id v9 = objc_msgSend(v7, "numberWithInt:", objc_msgSend(v8, "intValue"));

    id v10 = [(AXMTextLayoutManager *)self numberFormatter];
    uint64_t v11 = [v10 stringFromNumber:v9];

    uint64_t v12 = [v5 objectAtIndex:1];

    if (v12)
    {
      uint64_t v13 = [v5 objectAtIndex:0];
      int v14 = [v13 intValue];

      uint64_t v15 = NSString;
      if (v14 == 1) {
        [(AXMTextLayoutManager *)self fractionDenominatorValuesWithOneAsNumerator];
      }
      else {
      uint64_t v16 = [(AXMTextLayoutManager *)self fractionDenominatorValues];
      }
      uint64_t v17 = [v5 objectAtIndex:1];
      uint64_t v18 = objc_msgSend(v16, "objectAtIndex:", (int)objc_msgSend(v17, "intValue"));
      uint64_t v19 = [v15 stringWithFormat:@"%@ %@", v11, v18];

      uint64_t v11 = (void *)v19;
    }

    id v4 = v11;
  }

  return v4;
}

- (id)processMeasurement:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = [(AXMTextLayoutManager *)self measurementAbbreviationsToVerboseString];
  uint64_t v29 = v4;
  uint64_t v32 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v40;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v40 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = v5;
        uint64_t v6 = *(void *)(*((void *)&v39 + 1) + 8 * v5);
        uint64_t v7 = objc_msgSend(v4, "length", v29);
        id v8 = objc_alloc(MEMORY[0x1E4F28FD8]);
        id v9 = [(AXMTextLayoutManager *)self measurementAbbreviationsToVerboseString];
        id v10 = [v9 objectForKeyedSubscript:v6];
        uint64_t v11 = [v10 objectAtIndex:0];
        id v38 = 0;
        uint64_t v12 = (void *)[v8 initWithPattern:v11 options:1 error:&v38];
        id v33 = v38;

        uint64_t v13 = objc_msgSend(v12, "firstMatchInString:options:range:", v4, 0, 0, v7);

        if (v13)
        {
          int v14 = v4;
          uint64_t v35 = v6;
          do
          {
            uint64_t v37 = objc_msgSend(v12, "firstMatchInString:options:range:", v14, 0, 0, v7);
            uint64_t v15 = [v37 range];
            uint64_t v17 = objc_msgSend(v14, "substringWithRange:", v15, v16);
            char v36 = [(AXMTextLayoutManager *)self measurementAbbreviationsToVerboseString];
            uint64_t v18 = [v36 objectForKeyedSubscript:v6];
            uint64_t v19 = [v18 objectAtIndex:1];
            [(AXMTextLayoutManager *)self measurementAbbreviationsToVerboseString];
            v21 = uint64_t v20 = v12;
            id v22 = [v21 objectForKeyedSubscript:v6];
            [v22 objectAtIndex:2];
            long long v24 = v23 = self;
            long long v25 = [v17 stringByReplacingOccurrencesOfString:v19 withString:v24];

            self = v23;
            uint64_t v12 = v20;

            long long v26 = v17;
            id v4 = [v14 stringByReplacingOccurrencesOfString:v17 withString:v25];

            uint64_t v7 = [v4 length];
            uint64_t v6 = v35;

            long long v27 = objc_msgSend(v20, "firstMatchInString:options:range:", v4, 0, 0, v7);

            int v14 = v4;
          }
          while (v27);
        }

        uint64_t v5 = v34 + 1;
      }
      while (v34 + 1 != v32);
      uint64_t v32 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v32);
  }

  return v4;
}

- (AXMSemanticTextFactory)semanticTextFactory
{
  return self->_semanticTextFactory;
}

- (void)setSemanticTextFactory:(id)a3
{
}

- (void)setNumberFormatter:(id)a3
{
}

- (void)setMeasurementFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_measurementFormatter, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);

  objc_storeStrong((id *)&self->_semanticTextFactory, 0);
}

- (void)_assembleLayoutLines:(unsigned char *)a1 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1_3(a1, a2);
  OUTLINED_FUNCTION_0_5(&dword_1B57D5000, v2, v3, "  Creating new line with sequence", v4);
}

- (void)_assembleLayoutLines:(unsigned char *)a1 .cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1_3(a1, a2);
  OUTLINED_FUNCTION_0_5(&dword_1B57D5000, v2, v3, "  Adding sqeuence to line", v4);
}

- (void)_assembleLayoutLines:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_1B57D5000, v0, v1, "Will assemble lines...", v2);
}

- (void)_assembleLayoutRegions:(unsigned char *)a1 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1_3(a1, a2);
  OUTLINED_FUNCTION_0_5(&dword_1B57D5000, v2, v3, "  Creating new region with line", v4);
}

- (void)_assembleLayoutRegions:(unsigned char *)a1 .cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1_3(a1, a2);
  OUTLINED_FUNCTION_0_5(&dword_1B57D5000, v2, v3, "  Adding line to region", v4);
}

- (void)_assembleLayoutRegions:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_1B57D5000, v0, v1, "Will assemble regions...", v2);
}

- (void)_assembleLayoutRow:(unsigned char *)a1 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1_3(a1, a2);
  OUTLINED_FUNCTION_0_5(&dword_1B57D5000, v2, v3, "  Adding cell to row", v4);
}

- (void)_assembleLayoutHeader:(unsigned char *)a1 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1_3(a1, a2);
  OUTLINED_FUNCTION_0_5(&dword_1B57D5000, v2, v3, "  Adding cell to headeer", v4);
}

- (void)_assembleLayoutColumn:(unsigned char *)a1 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1_3(a1, a2);
  OUTLINED_FUNCTION_0_5(&dword_1B57D5000, v2, v3, "  Adding cell to column", v4);
}

- (void)_assembleLayoutRowFromCell:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_1B57D5000, v0, v1, "  Adding cell to row", v2);
}

- (void)_assembleLayoutRowFromCell:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1B57D5000, v0, OS_LOG_TYPE_DEBUG, "  Next cell: %@", v1, 0xCu);
}

- (void)_assembleLayoutTable:(unsigned char *)a1 header:(unsigned char *)a2 columnItems:.cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1_3(a1, a2);
  OUTLINED_FUNCTION_0_5(&dword_1B57D5000, v2, v3, "  Adding column to table", v4);
}

- (void)_assembleLayoutTable:(unsigned char *)a1 header:(unsigned char *)a2 columnItems:.cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1_3(a1, a2);
  OUTLINED_FUNCTION_0_5(&dword_1B57D5000, v2, v3, "  Creating new table with header", v4);
}

- (void)_assembleLayoutTable:(unsigned char *)a1 header:(unsigned char *)a2 columnItems:.cold.3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1_3(a1, a2);
  OUTLINED_FUNCTION_0_5(&dword_1B57D5000, v2, v3, "  Adding row to table", v4);
}

- (void)_assembleLayoutTable:header:columnItems:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_1B57D5000, v0, v1, "Will assemble table...", v2);
}

- (void)_assembleNutritionLabelLayoutWithRows:(unsigned char *)a1 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1_3(a1, a2);
  OUTLINED_FUNCTION_0_5(&dword_1B57D5000, v2, v3, "  Creating new label with header", v4);
}

- (void)_assembleNutritionLabelLayoutWithRows:(unsigned char *)a1 .cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1_3(a1, a2);
  OUTLINED_FUNCTION_0_5(&dword_1B57D5000, v2, v3, "  Adding row to label", v4);
}

- (void)_assembleNutritionLabelLayoutWithRows:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_1B57D5000, v0, v1, "Will assemble label...", v2);
}

- (void)_assembleReceipt:(unsigned char *)a1 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1_3(a1, a2);
  OUTLINED_FUNCTION_0_5(&dword_1B57D5000, v2, v3, "  Creating new receipt", v4);
}

- (void)_assembleReceipt:(unsigned char *)a1 .cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1_3(a1, a2);
  OUTLINED_FUNCTION_0_5(&dword_1B57D5000, v2, v3, "  Adding row to receipt", v4);
}

- (void)_assembleReceipt:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_1B57D5000, v0, v1, "Will assemble receipt...", v2);
}

@end