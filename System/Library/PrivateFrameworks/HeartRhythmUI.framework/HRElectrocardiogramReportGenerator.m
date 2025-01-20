@interface HRElectrocardiogramReportGenerator
- (BOOL)_didMultilineBulletFlowIntoSectionThree:(id)a3 remainingRange:(_NSRange)a4;
- (CGContext)pdfContext;
- (CGPoint)_birthdateLeadingOrigin;
- (CGPoint)_nameLeadingOrigin;
- (CGPoint)_sampleDateTrailingOrigin;
- (CGRect)_chartRowOneAxisBox;
- (CGRect)_chartRowOneGridBox;
- (CGRect)_chartRowThreeAxisBox;
- (CGRect)_chartRowThreeGridBox;
- (CGRect)_chartRowTwoAxisBox;
- (CGRect)_chartRowTwoGridBox;
- (CGRect)_footerBox;
- (CGRect)_pdfCropBox;
- (CGRect)_pdfMediaBox;
- (CGRect)_sectionOneBox;
- (CGRect)_sectionThreeBox;
- (CGRect)_sectionTwoBox;
- (HRElectrocardiogramReportDataSource)dataSource;
- (HRElectrocardiogramReportGenerator)initWithDataSource:(id)a3;
- (NSArray)waveformPaths;
- (_NSRange)_drawAttributedText:(id)a3 inRect:(CGRect)a4 distanceToFirstBaseline:(double)a5 drawHeartGlyph:(BOOL)a6 mustFitInRect:(BOOL)a7;
- (double)_horizontalSeparatorY;
- (double)descriptionTextSizeAdjustment;
- (id)_appleWatchModelText;
- (id)_averageHeartRateSectionTitleAttributedTextWithText:(id)a3;
- (id)_averageHeartRateTitleText;
- (id)_birthdateAttributedText;
- (id)_birthdateText;
- (id)_blackColorWithFraction:(double)a3;
- (id)_bulletedDescriptionAttributedTextWithBullets:(id)a3;
- (id)_bulletedDescriptionTextAttributes;
- (id)_descriptionAttributedTextWithText:(id)a3;
- (id)_footerAttributedText;
- (id)_horizontalChartResolutionText;
- (id)_iOSVersionText;
- (id)_informationalText;
- (id)_leadNameText;
- (id)_nameAttributedText;
- (id)_nameText;
- (id)_rhythmClassificationDescriptionText;
- (id)_rhythmClassificationTitleText;
- (id)_sampleAlgorithmVersionText;
- (id)_sampleDateAttributedText;
- (id)_sampleDateText;
- (id)_samplingRateText;
- (id)_sectionOneAttributedText;
- (id)_sectionThreeAttributedTextWithRemainingSectionTwoAttributedText:(id)a3;
- (id)_sectionTitleAttributedTextWithText:(id)a3;
- (id)_sectionTwoAttributedText;
- (id)_symptomsContinuedTitleText;
- (id)_symptomsDescriptionText;
- (id)_symtpomsTitleText;
- (id)_verticalChartResolutionText;
- (id)_watchOSVersionText;
- (id)generatePDF;
- (unint64_t)heartGlyphPositionInFirstSectionText;
- (void)_drawAttributedText:(id)a3 atOrigin:(CGPoint)a4 leftAligned:(BOOL)a5;
- (void)_drawElectrocardiogramChartWithWaveformPathIndex:(int64_t)a3 gridRect:(CGRect)a4 axisRect:(CGRect)a5 axisStartingIndex:(int64_t)a6 displayControlSignal:(BOOL)a7;
- (void)_drawHorizontalSeparatorAt:(double)a3;
- (void)_drawRect:(CGRect)a3;
- (void)_drawUIKitContentAtDocumentOrigin:(CGPoint)a3 drawingBlock:(id)a4;
- (void)setDescriptionTextSizeAdjustment:(double)a3;
- (void)setHeartGlyphPositionInFirstSectionText:(unint64_t)a3;
- (void)setPdfContext:(CGContext *)a3;
- (void)setWaveformPaths:(id)a3;
@end

@implementation HRElectrocardiogramReportGenerator

- (HRElectrocardiogramReportGenerator)initWithDataSource:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HRElectrocardiogramReportGenerator;
  v5 = [(HRElectrocardiogramReportGenerator *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_dataSource, v4);
  }

  return v6;
}

- (id)generatePDF
{
  v3 = (__CFData *)objc_alloc_init(MEMORY[0x263EFF990]);
  id v4 = CGDataConsumerCreateWithCFData(v3);
  [(HRElectrocardiogramReportGenerator *)self _pdfMediaBox];
  v79.origin.x = v5;
  v79.origin.y = v6;
  v79.size.width = v7;
  v79.size.height = v8;
  v9 = CGPDFContextCreate(v4, &v79, 0);
  [(HRElectrocardiogramReportGenerator *)self setPdfContext:v9];
  CGPDFContextBeginPage(v9, 0);
  v10 = [(HRElectrocardiogramReportGenerator *)self _nameAttributedText];
  [(HRElectrocardiogramReportGenerator *)self _nameLeadingOrigin];
  -[HRElectrocardiogramReportGenerator _drawAttributedText:atOrigin:leftAligned:](self, "_drawAttributedText:atOrigin:leftAligned:", v10, 1);

  v11 = [(HRElectrocardiogramReportGenerator *)self _birthdateAttributedText];
  [(HRElectrocardiogramReportGenerator *)self _birthdateLeadingOrigin];
  -[HRElectrocardiogramReportGenerator _drawAttributedText:atOrigin:leftAligned:](self, "_drawAttributedText:atOrigin:leftAligned:", v11, 1);

  v12 = [(HRElectrocardiogramReportGenerator *)self _sampleDateAttributedText];
  [(HRElectrocardiogramReportGenerator *)self _sampleDateTrailingOrigin];
  -[HRElectrocardiogramReportGenerator _drawAttributedText:atOrigin:leftAligned:](self, "_drawAttributedText:atOrigin:leftAligned:", v12, 0);

  [(HRElectrocardiogramReportGenerator *)self _horizontalSeparatorY];
  -[HRElectrocardiogramReportGenerator _drawHorizontalSeparatorAt:](self, "_drawHorizontalSeparatorAt:");
  [(HRElectrocardiogramReportGenerator *)self descriptionTextSizeAdjustment];
  if (v13 < -4.0)
  {
LABEL_4:
    v19 = [(HRElectrocardiogramReportGenerator *)self _sectionOneAttributedText];
    [(HRElectrocardiogramReportGenerator *)self _sectionOneBox];
    -[HRElectrocardiogramReportGenerator _drawAttributedText:inRect:distanceToFirstBaseline:drawHeartGlyph:mustFitInRect:](self, "_drawAttributedText:inRect:distanceToFirstBaseline:drawHeartGlyph:mustFitInRect:", v19, 1, 0);
  }
  else
  {
    while (1)
    {
      v14 = [(HRElectrocardiogramReportGenerator *)self _sectionOneAttributedText];
      [(HRElectrocardiogramReportGenerator *)self _sectionOneBox];
      -[HRElectrocardiogramReportGenerator _drawAttributedText:inRect:distanceToFirstBaseline:drawHeartGlyph:mustFitInRect:](self, "_drawAttributedText:inRect:distanceToFirstBaseline:drawHeartGlyph:mustFitInRect:", v14, 1, 1);
      uint64_t v16 = v15;

      if (!v16) {
        break;
      }
      [(HRElectrocardiogramReportGenerator *)self descriptionTextSizeAdjustment];
      [(HRElectrocardiogramReportGenerator *)self setDescriptionTextSizeAdjustment:v17 + -0.5];
      [(HRElectrocardiogramReportGenerator *)self descriptionTextSizeAdjustment];
      if (v18 < -4.0) {
        goto LABEL_4;
      }
    }
  }
  [(HRElectrocardiogramReportGenerator *)self setDescriptionTextSizeAdjustment:0.0];
  v20 = [(HRElectrocardiogramReportGenerator *)self _sectionTwoAttributedText];
  [(HRElectrocardiogramReportGenerator *)self _sectionTwoBox];
  uint64_t v21 = -[HRElectrocardiogramReportGenerator _drawAttributedText:inRect:distanceToFirstBaseline:drawHeartGlyph:mustFitInRect:](self, "_drawAttributedText:inRect:distanceToFirstBaseline:drawHeartGlyph:mustFitInRect:", v20, 0, 0);
  if (v22)
  {
    uint64_t v23 = v21;
    uint64_t v24 = v22;
    v25 = objc_msgSend(v20, "attributedSubstringFromRange:", v21, v22);
    if (-[HRElectrocardiogramReportGenerator _didMultilineBulletFlowIntoSectionThree:remainingRange:](self, "_didMultilineBulletFlowIntoSectionThree:remainingRange:", v20, v23, v24))
    {
      v26 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithAttributedString:v25];
      id v27 = objc_alloc(MEMORY[0x263F086A0]);
      v28 = [(HRElectrocardiogramReportGenerator *)self _bulletedDescriptionTextAttributes];
      v29 = (void *)[v27 initWithString:@"\t" attributes:v28];
      [v26 insertAttributedString:v29 atIndex:0];

      uint64_t v30 = [v26 copy];
      v25 = (void *)v30;
    }
    v31 = [(HRElectrocardiogramReportGenerator *)self _sectionThreeAttributedTextWithRemainingSectionTwoAttributedText:v25];
    [(HRElectrocardiogramReportGenerator *)self _sectionThreeBox];
    -[HRElectrocardiogramReportGenerator _drawAttributedText:inRect:distanceToFirstBaseline:drawHeartGlyph:mustFitInRect:](self, "_drawAttributedText:inRect:distanceToFirstBaseline:drawHeartGlyph:mustFitInRect:", v31, 0, 0);
  }
  [(HRElectrocardiogramReportGenerator *)self _chartRowOneGridBox];
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  [(HRElectrocardiogramReportGenerator *)self _chartRowOneAxisBox];
  -[HRElectrocardiogramReportGenerator _drawElectrocardiogramChartWithWaveformPathIndex:gridRect:axisRect:axisStartingIndex:displayControlSignal:](self, "_drawElectrocardiogramChartWithWaveformPathIndex:gridRect:axisRect:axisStartingIndex:displayControlSignal:", 0, 0, 1, v33, v35, v37, v39, v40, v41, v42, v43);
  [(HRElectrocardiogramReportGenerator *)self _chartRowTwoGridBox];
  double v45 = v44;
  double v47 = v46;
  double v49 = v48;
  double v51 = v50;
  [(HRElectrocardiogramReportGenerator *)self _chartRowTwoAxisBox];
  -[HRElectrocardiogramReportGenerator _drawElectrocardiogramChartWithWaveformPathIndex:gridRect:axisRect:axisStartingIndex:displayControlSignal:](self, "_drawElectrocardiogramChartWithWaveformPathIndex:gridRect:axisRect:axisStartingIndex:displayControlSignal:", 1, 10, 0, v45, v47, v49, v51, v52, v53, v54, v55);
  [(HRElectrocardiogramReportGenerator *)self _chartRowThreeGridBox];
  double v57 = v56;
  double v59 = v58;
  double v61 = v60;
  double v63 = v62;
  [(HRElectrocardiogramReportGenerator *)self _chartRowThreeAxisBox];
  -[HRElectrocardiogramReportGenerator _drawElectrocardiogramChartWithWaveformPathIndex:gridRect:axisRect:axisStartingIndex:displayControlSignal:](self, "_drawElectrocardiogramChartWithWaveformPathIndex:gridRect:axisRect:axisStartingIndex:displayControlSignal:", 2, 20, 0, v57, v59, v61, v63, v64, v65, v66, v67);
  [(HRElectrocardiogramReportGenerator *)self _footerBox];
  double v69 = v68;
  double v71 = v70;
  double v73 = v72;
  double v75 = v74;
  v76 = [(HRElectrocardiogramReportGenerator *)self _footerAttributedText];
  -[HRElectrocardiogramReportGenerator _drawAttributedText:inRect:distanceToFirstBaseline:drawHeartGlyph:mustFitInRect:](self, "_drawAttributedText:inRect:distanceToFirstBaseline:drawHeartGlyph:mustFitInRect:", v76, 0, 0, v69, v71, v73, v75, 26.0);

  CGPDFContextEndPage(v9);
  CGContextRelease(v9);
  CGDataConsumerRelease(v4);
  v77 = [MEMORY[0x263EFF8F8] dataWithData:v3];

  return v77;
}

- (CGRect)_pdfMediaBox
{
  double v2 = 792.0;
  double v3 = 612.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.size.height = v3;
  result.size.width = v2;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)_pdfCropBox
{
  double v2 = 40.0;
  double v3 = 712.0;
  double v4 = 532.0;
  double v5 = 40.0;
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v5;
  result.origin.x = v2;
  return result;
}

- (CGPoint)_nameLeadingOrigin
{
  [(HRElectrocardiogramReportGenerator *)self _pdfCropBox];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  CGFloat MinX = CGRectGetMinX(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  double v7 = CGRectGetMaxY(v11) + -14.0;
  double v8 = MinX;
  result.CGFloat y = v7;
  result.CGFloat x = v8;
  return result;
}

- (CGPoint)_birthdateLeadingOrigin
{
  [(HRElectrocardiogramReportGenerator *)self _nameLeadingOrigin];
  double v4 = v3 + -14.0;
  result.CGFloat y = v4;
  result.CGFloat x = v2;
  return result;
}

- (CGPoint)_sampleDateTrailingOrigin
{
  [(HRElectrocardiogramReportGenerator *)self _birthdateLeadingOrigin];
  double v4 = v3;
  [(HRElectrocardiogramReportGenerator *)self _pdfCropBox];
  double MaxX = CGRectGetMaxX(v8);
  double v6 = v4;
  result.CGFloat y = v6;
  result.CGFloat x = MaxX;
  return result;
}

- (double)_horizontalSeparatorY
{
  [(HRElectrocardiogramReportGenerator *)self _birthdateLeadingOrigin];
  return v2 + -9.0;
}

- (CGRect)_sectionOneBox
{
  [(HRElectrocardiogramReportGenerator *)self _horizontalSeparatorY];
  double v4 = v3;
  [(HRElectrocardiogramReportGenerator *)self _birthdateLeadingOrigin];
  double v6 = v4 + -122.0;
  double v7 = 210.0;
  double v8 = 122.0;
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (CGRect)_sectionTwoBox
{
  [(HRElectrocardiogramReportGenerator *)self _horizontalSeparatorY];
  double v4 = v3;
  [(HRElectrocardiogramReportGenerator *)self _sectionOneBox];
  double v5 = CGRectGetMaxX(v9) + 40.0;
  double v6 = v4 + -122.0;
  double v7 = 210.0;
  double v8 = 122.0;
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (CGRect)_sectionThreeBox
{
  [(HRElectrocardiogramReportGenerator *)self _horizontalSeparatorY];
  double v4 = v3;
  [(HRElectrocardiogramReportGenerator *)self _sectionTwoBox];
  double v5 = CGRectGetMaxX(v9) + 40.0;
  double v6 = v4 + -122.0;
  double v7 = 210.0;
  double v8 = 122.0;
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (CGRect)_chartRowOneGridBox
{
  [(HRElectrocardiogramReportGenerator *)self _sectionOneBox];
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  CGFloat v6 = CGRectGetMinY(v11) + -20.0;
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v12);
  double v8 = v6 + -85.0395;
  double v9 = 708.6625;
  double v10 = 85.0395;
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = MinX;
  return result;
}

- (CGRect)_chartRowOneAxisBox
{
  [(HRElectrocardiogramReportGenerator *)self _chartRowOneGridBox];
  double v4 = v3 + -8.50395;
  double v5 = 708.6625;
  double v6 = 8.50395;
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v2;
  return result;
}

- (CGRect)_chartRowTwoGridBox
{
  [(HRElectrocardiogramReportGenerator *)self _chartRowOneGridBox];
  double v6 = v5 + -104.54345;
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v2;
  return result;
}

- (CGRect)_chartRowTwoAxisBox
{
  [(HRElectrocardiogramReportGenerator *)self _chartRowTwoGridBox];
  double v4 = v3 + -8.50395;
  double v5 = 708.6625;
  double v6 = 8.50395;
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v2;
  return result;
}

- (CGRect)_chartRowThreeGridBox
{
  [(HRElectrocardiogramReportGenerator *)self _chartRowTwoGridBox];
  double v6 = v5 + -104.54345;
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v2;
  return result;
}

- (CGRect)_chartRowThreeAxisBox
{
  [(HRElectrocardiogramReportGenerator *)self _chartRowThreeGridBox];
  double v4 = v3 + -8.50395;
  double v5 = 708.6625;
  double v6 = 8.50395;
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v2;
  return result;
}

- (CGRect)_footerBox
{
  [(HRElectrocardiogramReportGenerator *)self _chartRowThreeAxisBox];
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  CGFloat MinX = CGRectGetMinX(v11);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  double v7 = CGRectGetWidth(v12);
  double v8 = 0.0;
  double v9 = MinX;
  double v10 = y;
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v9;
  return result;
}

- (id)_blackColorWithFraction:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 1.0 - a3);
}

- (id)_nameAttributedText
{
  v11[2] = *MEMORY[0x263EF8340];
  v10[0] = *MEMORY[0x263F1C238];
  double v3 = [MEMORY[0x263F1C658] systemFontOfSize:14.0 weight:*MEMORY[0x263F1D340]];
  v11[0] = v3;
  v10[1] = *MEMORY[0x263F1C240];
  double v4 = [(HRElectrocardiogramReportGenerator *)self _blackColorWithFraction:1.0];
  v11[1] = v4;
  double v5 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  id v6 = objc_alloc(MEMORY[0x263F086A0]);
  double v7 = [(HRElectrocardiogramReportGenerator *)self _nameText];
  double v8 = (void *)[v6 initWithString:v7 attributes:v5];

  return v8;
}

- (id)_nameText
{
  double v3 = [(HRElectrocardiogramReportGenerator *)self dataSource];
  double v4 = [v3 firstName];
  if (v4)
  {

LABEL_4:
    id v7 = objc_alloc_init(MEMORY[0x263F08A78]);
    [v7 setStyle:0];
    id v8 = objc_alloc_init(MEMORY[0x263F08A68]);
    double v9 = [(HRElectrocardiogramReportGenerator *)self dataSource];
    double v10 = [v9 firstName];
    [v8 setGivenName:v10];

    CGRect v11 = [(HRElectrocardiogramReportGenerator *)self dataSource];
    CGRect v12 = [v11 lastName];
    [v8 setFamilyName:v12];

    double v13 = [v7 stringFromPersonNameComponents:v8];

    goto LABEL_5;
  }
  double v5 = [(HRElectrocardiogramReportGenerator *)self dataSource];
  id v6 = [v5 lastName];

  if (v6) {
    goto LABEL_4;
  }
  double v13 = HRUIECGLocalizedString(@"NAME_BLANK");
LABEL_5:
  return v13;
}

- (id)_birthdateAttributedText
{
  v11[2] = *MEMORY[0x263EF8340];
  v10[0] = *MEMORY[0x263F1C238];
  double v3 = [MEMORY[0x263F1C658] systemFontOfSize:10.0 weight:*MEMORY[0x263F1D338]];
  v11[0] = v3;
  v10[1] = *MEMORY[0x263F1C240];
  double v4 = [(HRElectrocardiogramReportGenerator *)self _blackColorWithFraction:0.6];
  v11[1] = v4;
  double v5 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  id v6 = objc_alloc(MEMORY[0x263F086A0]);
  id v7 = [(HRElectrocardiogramReportGenerator *)self _birthdateText];
  id v8 = (void *)[v6 initWithString:v7 attributes:v5];

  return v8;
}

- (id)_birthdateText
{
  double v2 = [(HRElectrocardiogramReportGenerator *)self dataSource];
  double v3 = [v2 dateOfBirthComponents];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F08790]);
    [v4 setDateStyle:2];
    [v4 setTimeStyle:0];
    double v5 = [v3 calendar];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF3F8]];
    }
    double v9 = v7;

    double v10 = [v9 dateFromComponents:v3];
    CGRect v11 = [v4 stringFromDate:v10];
    id v12 = objc_alloc_init(MEMORY[0x263F08A30]);
    double v13 = [MEMORY[0x263EFF910] date];
    v14 = [v9 components:4 fromDate:v10 toDate:v13 options:0];

    uint64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "year"));
    uint64_t v16 = [v12 stringFromNumber:v15];

    double v17 = HRUIECGLocalizedString(@"DATE_OF_BIRTH_%@_AGE_%@");
    id v8 = objc_msgSend(NSString, "stringWithFormat:", v17, v11, v16);
  }
  else
  {
    id v8 = HRUIECGLocalizedString(@"DATE_OF_BIRTH_BLANK");
  }

  return v8;
}

- (id)_sampleDateAttributedText
{
  v11[2] = *MEMORY[0x263EF8340];
  v10[0] = *MEMORY[0x263F1C238];
  double v3 = [MEMORY[0x263F1C658] systemFontOfSize:10.0 weight:*MEMORY[0x263F1D338]];
  v11[0] = v3;
  v10[1] = *MEMORY[0x263F1C240];
  id v4 = [(HRElectrocardiogramReportGenerator *)self _blackColorWithFraction:0.6];
  v11[1] = v4;
  double v5 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  id v6 = objc_alloc(MEMORY[0x263F086A0]);
  id v7 = [(HRElectrocardiogramReportGenerator *)self _sampleDateText];
  id v8 = (void *)[v6 initWithString:v7 attributes:v5];

  return v8;
}

- (id)_sampleDateText
{
  double v2 = [(HRElectrocardiogramReportGenerator *)self dataSource];
  double v3 = [v2 sample];
  id v4 = [v3 startDate];

  double v5 = HKLocalizedStringForDateAndTemplateWithFormattingContext();
  id v6 = HKLocalizedStringForDateAndTemplateWithFormattingContext();
  id v7 = objc_alloc_init(MEMORY[0x263F08790]);
  [v7 setDateStyle:0];
  [v7 setTimeStyle:1];
  [v7 setFormattingContext:5];
  [v7 setLocalizedDateFormatFromTemplate:@"j"];
  id v8 = [v7 stringFromDate:v4];
  double v9 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
  double v10 = [v9 invertedSet];

  CGRect v11 = [v8 componentsSeparatedByCharactersInSet:v10];
  id v12 = [v11 componentsJoinedByString:&stru_26D2B53D0];

  id v13 = objc_alloc(MEMORY[0x263F08A30]);
  v14 = [v13 numberFromString:v12];

  if (v14)
  {
    uint64_t v15 = [v14 integerValue];
  }
  else
  {
    uint64_t v16 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v15 = [v16 component:32 fromDate:v4];
  }
  if (v15 == 1) {
    double v17 = @"SAMPLE_RECORDED_DATE_TIME_SINGULAR_HOUR_%@_%@";
  }
  else {
    double v17 = @"SAMPLE_RECORDED_DATE_TIME_PLURAL_HOUR_%@_%@";
  }
  double v18 = HRUIECGLocalizedString(v17);
  v19 = objc_msgSend(NSString, "stringWithFormat:", v18, v5, v6);

  return v19;
}

- (id)_sectionOneAttributedText
{
  double v3 = [(HRElectrocardiogramReportGenerator *)self _rhythmClassificationTitleText];
  id v4 = HRUIECGLocalizedString(@"CLASSIFICATION_AND_AVG_HEART_RATE_SEPARATOR");
  double v5 = [v3 stringByAppendingString:v4];

  id v6 = [(HRElectrocardiogramReportGenerator *)self _averageHeartRateTitleText];
  id v7 = [v6 stringByAppendingString:@"\n"];

  -[HRElectrocardiogramReportGenerator setHeartGlyphPositionInFirstSectionText:](self, "setHeartGlyphPositionInFirstSectionText:", [v5 length]);
  id v8 = objc_alloc_init(MEMORY[0x263F089B8]);
  double v9 = [(HRElectrocardiogramReportGenerator *)self _sectionTitleAttributedTextWithText:v5];
  [v8 appendAttributedString:v9];

  double v10 = [(HRElectrocardiogramReportGenerator *)self _averageHeartRateSectionTitleAttributedTextWithText:v7];
  [v8 appendAttributedString:v10];

  CGRect v11 = [(HRElectrocardiogramReportGenerator *)self _rhythmClassificationDescriptionText];
  id v12 = [(HRElectrocardiogramReportGenerator *)self _descriptionAttributedTextWithText:v11];
  [v8 appendAttributedString:v12];

  id v13 = (void *)[v8 copy];
  return v13;
}

- (id)_sectionTwoAttributedText
{
  id v3 = objc_alloc_init(MEMORY[0x263F089B8]);
  id v4 = [(HRElectrocardiogramReportGenerator *)self _symptomsDescriptionText];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [(HRElectrocardiogramReportGenerator *)self _symtpomsTitleText];
    id v7 = [v6 stringByAppendingString:@"\n"];
    id v8 = [(HRElectrocardiogramReportGenerator *)self _sectionTitleAttributedTextWithText:v7];
    [v3 appendAttributedString:v8];

    double v9 = [(HRElectrocardiogramReportGenerator *)self _symptomsDescriptionText];
    double v10 = [(HRElectrocardiogramReportGenerator *)self _bulletedDescriptionAttributedTextWithBullets:v9];
    [v3 appendAttributedString:v10];

    id v11 = (id)[v3 copy];
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x263F086A0]);
  }
  id v12 = v11;

  return v12;
}

- (id)_sectionThreeAttributedTextWithRemainingSectionTwoAttributedText:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F089B8];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [(HRElectrocardiogramReportGenerator *)self _symptomsContinuedTitleText];
  id v8 = [v7 stringByAppendingString:@"\n"];
  double v9 = [(HRElectrocardiogramReportGenerator *)self _sectionTitleAttributedTextWithText:v8];
  [v6 appendAttributedString:v9];

  [v6 appendAttributedString:v5];
  double v10 = (void *)[v6 copy];

  return v10;
}

- (id)_sectionTitleAttributedTextWithText:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  v12[0] = *MEMORY[0x263F1C238];
  id v4 = (void *)MEMORY[0x263F1C658];
  double v5 = *MEMORY[0x263F1D318];
  id v6 = a3;
  id v7 = [v4 systemFontOfSize:10.0 weight:v5];
  v13[0] = v7;
  v12[1] = *MEMORY[0x263F1C240];
  id v8 = [(HRElectrocardiogramReportGenerator *)self _blackColorWithFraction:1.0];
  v13[1] = v8;
  double v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

  double v10 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v6 attributes:v9];
  return v10;
}

- (id)_averageHeartRateSectionTitleAttributedTextWithText:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  *(_OWORD *)&v16.version = xmmword_220CE4810;
  v16.getAscent = (CTRunDelegateGetAscentCallback)HeartGlyphAscent;
  v16.getDescent = (CTRunDelegateGetDescentCallback)HeartGlyphDescent;
  v16.getWidth = (CTRunDelegateGetWidthCallback)HeartGlyphWidth;
  id v4 = a3;
  CTRunDelegateRef v5 = CTRunDelegateCreate(&v16, 0);
  uint64_t v19 = *MEMORY[0x263F03CA8];
  v20[0] = v5;
  id v6 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, &v19, 1, *(_OWORD *)&v16.version, v16.getAscent, v16.getDescent, v16.getWidth);
  id v7 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@" " attributes:v6];
  id v8 = [@" " stringByAppendingString:v4];

  v17[0] = *MEMORY[0x263F1C238];
  double v9 = [MEMORY[0x263F1C658] systemFontOfSize:10.0 weight:*MEMORY[0x263F1D318]];
  v18[0] = v9;
  v17[1] = *MEMORY[0x263F1C240];
  double v10 = [(HRElectrocardiogramReportGenerator *)self _blackColorWithFraction:0.6];
  v18[1] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

  id v12 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v8 attributes:v11];
  id v13 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithAttributedString:v7];
  [v13 appendAttributedString:v12];
  v14 = (void *)[v13 copy];

  return v14;
}

- (id)_rhythmClassificationTitleText
{
  id v3 = [(HRElectrocardiogramReportGenerator *)self dataSource];
  id v4 = [v3 sample];
  CTRunDelegateRef v5 = [(HRElectrocardiogramReportGenerator *)self dataSource];
  objc_msgSend(v4, "_localizedClassificationWithActiveAlgorithmVersion:", objc_msgSend(v5, "activeAlgorithmVersion"));
  id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  if (!v6) {
    id v6 = &stru_26D2B53D0;
  }
  id v8 = v6;

  return v8;
}

- (id)_averageHeartRateTitleText
{
  double v2 = [(HRElectrocardiogramReportGenerator *)self dataSource];
  id v3 = [v2 sample];
  objc_msgSend(v3, "hk_localizedAverageBPM");
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CTRunDelegateRef v5 = v4;
  if (!v4) {
    id v4 = &stru_26D2B53D0;
  }
  id v6 = v4;

  return v6;
}

- (id)_symtpomsTitleText
{
  return HRUIECGLocalizedString(@"SYMPTOMS_COLUMN_TITLE");
}

- (id)_symptomsContinuedTitleText
{
  return HRUIECGLocalizedString(@"SYMPTOMS_CONTINUED_COLUMN_TITLE");
}

- (id)_descriptionAttributedTextWithText:(id)a3
{
  v16[3] = *MEMORY[0x263EF8340];
  id v4 = (objc_class *)MEMORY[0x263F1C350];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setParagraphSpacingBefore:5.0];
  [v6 setLineSpacing:3.0];
  v15[0] = *MEMORY[0x263F1C238];
  id v7 = (void *)MEMORY[0x263F1C658];
  [(HRElectrocardiogramReportGenerator *)self descriptionTextSizeAdjustment];
  double v9 = [v7 systemFontOfSize:v8 + 10.0 weight:*MEMORY[0x263F1D338]];
  v16[0] = v9;
  v15[1] = *MEMORY[0x263F1C240];
  double v10 = [(HRElectrocardiogramReportGenerator *)self _blackColorWithFraction:0.6];
  v16[1] = v10;
  v15[2] = *MEMORY[0x263F1C268];
  id v11 = (void *)[v6 copy];
  v16[2] = v11;
  id v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];

  id v13 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v5 attributes:v12];
  return v13;
}

- (id)_bulletedDescriptionAttributedTextWithBullets:(id)a3
{
  id v4 = a3;
  id v5 = [(HRElectrocardiogramReportGenerator *)self _bulletedDescriptionTextAttributes];
  id v6 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@"•" attributes:v5];
  id v7 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@"\t" attributes:v5];
  double v8 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@"\n" attributes:v5];
  id v9 = objc_alloc_init(MEMORY[0x263F089B8]);
  if ([v4 count])
  {
    unint64_t v10 = 0;
    do
    {
      [v9 appendAttributedString:v6];
      [v9 appendAttributedString:v7];
      id v11 = objc_alloc(MEMORY[0x263F086A0]);
      id v12 = [v4 objectAtIndexedSubscript:v10];
      id v13 = (void *)[v11 initWithString:v12 attributes:v5];
      [v9 appendAttributedString:v13];

      [v9 appendAttributedString:v8];
      ++v10;
    }
    while (v10 < [v4 count]);
  }

  return v9;
}

- (id)_rhythmClassificationDescriptionText
{
  id v3 = [(HRElectrocardiogramReportGenerator *)self dataSource];
  id v4 = [v3 sample];
  id v5 = [(HRElectrocardiogramReportGenerator *)self dataSource];
  objc_msgSend(v4, "hrui_classificationShortBodyTextWithActiveAlgorithmVersion:isSharedData:", objc_msgSend(v5, "activeAlgorithmVersion"), 0);
  id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  if (!v6) {
    id v6 = &stru_26D2B53D0;
  }
  double v8 = v6;

  return v8;
}

- (id)_symptomsDescriptionText
{
  double v2 = [(HRElectrocardiogramReportGenerator *)self dataSource];
  id v3 = [v2 sample];
  id v4 = [v3 _localizedSymptoms];

  return v4;
}

- (id)_footerAttributedText
{
  v21[2] = *MEMORY[0x263EF8340];
  v20[0] = *MEMORY[0x263F1C238];
  id v3 = [MEMORY[0x263F1C658] systemFontOfSize:8.0 weight:*MEMORY[0x263F1D338]];
  v21[0] = v3;
  v20[1] = *MEMORY[0x263F1C240];
  id v4 = [(HRElectrocardiogramReportGenerator *)self _blackColorWithFraction:0.6];
  v21[1] = v4;
  double v18 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];

  uint64_t v19 = HRUIECGLocalizedString(@"FOOTER_FORMAT_STRING_V2_%1$@_%2$@_%3$@_%4$@_%5$@_%6$@_%7$@_%8$@_%9$@");
  double v17 = NSString;
  id v5 = [(HRElectrocardiogramReportGenerator *)self _horizontalChartResolutionText];
  id v6 = [(HRElectrocardiogramReportGenerator *)self _verticalChartResolutionText];
  id v7 = [(HRElectrocardiogramReportGenerator *)self _leadNameText];
  double v8 = [(HRElectrocardiogramReportGenerator *)self _samplingRateText];
  id v9 = [(HRElectrocardiogramReportGenerator *)self _iOSVersionText];
  unint64_t v10 = [(HRElectrocardiogramReportGenerator *)self _watchOSVersionText];
  id v11 = [(HRElectrocardiogramReportGenerator *)self _appleWatchModelText];
  id v12 = [(HRElectrocardiogramReportGenerator *)self _sampleAlgorithmVersionText];
  id v13 = [(HRElectrocardiogramReportGenerator *)self _informationalText];
  v14 = objc_msgSend(v17, "stringWithFormat:", v19, v5, v6, v7, v8, v9, v10, v11, v12, v13);

  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v14 attributes:v18];
  return v15;
}

- (id)_horizontalChartResolutionText
{
  return HRUIECGLocalizedString(@"HORIZONTAL_CHART_RESOLUTION");
}

- (id)_verticalChartResolutionText
{
  return HRUIECGLocalizedString(@"VERTICAL_CHART_RESOLUTION");
}

- (id)_leadNameText
{
  return HRUIECGLocalizedString(@"LEAD_I_NAME");
}

- (id)_samplingRateText
{
  double v2 = [(HRElectrocardiogramReportGenerator *)self dataSource];
  id v3 = [v2 sample];
  id v4 = [v3 samplingFrequency];
  id v5 = [v4 _foundationMeasurement];

  id v6 = objc_alloc_init(MEMORY[0x263F08988]);
  id v7 = HKIntegerFormatter();
  [v6 setNumberFormatter:v7];

  [v6 setUnitStyle:1];
  [v6 setUnitOptions:1];
  if (v5)
  {
    double v8 = [v6 stringFromMeasurement:v5];
  }
  else
  {
    double v8 = &stru_26D2B53D0;
  }

  return v8;
}

- (id)_appleWatchModelText
{
  id v3 = objc_msgSend(MEMORY[0x263EFFA40], "hk_heartRhythmDefaults");
  char v4 = objc_msgSend(v3, "hk_hfeModeEnabled");

  if (v4)
  {
    id v5 = &stru_26D2B53D0;
  }
  else
  {
    id v6 = [(HRElectrocardiogramReportGenerator *)self dataSource];
    id v7 = [v6 sample];
    double v8 = [v7 device];
    id v9 = [v8 hardwareVersion];
    unint64_t v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      HRUIECGLocalizedString(@"UNKNOWN_WATCH_MODEL");
      id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    id v5 = v11;
  }
  return v5;
}

- (id)_iOSVersionText
{
  double v2 = objc_msgSend(MEMORY[0x263EFFA40], "hk_heartRhythmDefaults");
  char v3 = objc_msgSend(v2, "hk_hfeModeEnabled");

  if (v3)
  {
    char v4 = &stru_26D2B53D0;
  }
  else
  {
    id v5 = NSString;
    id v6 = HRUIECGLocalizedString(@"IOS_VERSION_PREFIX");
    id v7 = [MEMORY[0x263F0A980] currentOSVersion];
    char v4 = [v5 stringWithFormat:@"%@ %@", v6, v7];
  }
  return v4;
}

- (id)_sampleAlgorithmVersionText
{
  double v2 = [(HRElectrocardiogramReportGenerator *)self dataSource];
  char v3 = [v2 sample];
  char v4 = [v3 _algorithmVersion];

  if (!v4)
  {
    char v4 = [NSNumber numberWithInt:1];
  }
  id v5 = NSString;
  id v6 = HRUIECGLocalizedString(@"ALGORITHM_VERSION_PREFIX");
  id v7 = [v5 stringWithFormat:@"%@ %@", v6, v4];

  return v7;
}

- (id)_watchOSVersionText
{
  char v3 = objc_msgSend(MEMORY[0x263EFFA40], "hk_heartRhythmDefaults");
  char v4 = objc_msgSend(v3, "hk_hfeModeEnabled");

  if (v4)
  {
    id v5 = &stru_26D2B53D0;
  }
  else
  {
    id v6 = [(HRElectrocardiogramReportGenerator *)self dataSource];
    id v7 = [v6 sample];
    double v8 = [v7 device];
    id v9 = [v8 softwareVersion];

    if (v9)
    {
      unint64_t v10 = NSString;
      id v11 = HRUIECGLocalizedString(@"WATCHOS_VERSION_PREFIX");
      id v12 = [(HRElectrocardiogramReportGenerator *)self dataSource];
      id v13 = [v12 sample];
      v14 = [v13 device];
      uint64_t v15 = [v14 softwareVersion];
      id v5 = [v10 stringWithFormat:@"%@ %@", v11, v15];
    }
    else
    {
      id v5 = 0;
    }
  }
  return v5;
}

- (id)_informationalText
{
  return HRUIECGLocalizedString(@"INFORMATIONAL_TEXT");
}

- (void)_drawHorizontalSeparatorAt:(double)a3
{
  id v5 = [(HRElectrocardiogramReportGenerator *)self pdfContext];
  id v6 = [(HRElectrocardiogramReportGenerator *)self _blackColorWithFraction:0.2];
  CGContextSetStrokeColorWithColor(v5, (CGColorRef)[v6 CGColor]);

  CGContextSetLineWidth([(HRElectrocardiogramReportGenerator *)self pdfContext], 0.5);
  CGContextBeginPath([(HRElectrocardiogramReportGenerator *)self pdfContext]);
  id v7 = [(HRElectrocardiogramReportGenerator *)self pdfContext];
  [(HRElectrocardiogramReportGenerator *)self _pdfCropBox];
  CGFloat MinX = CGRectGetMinX(v13);
  CGContextMoveToPoint(v7, MinX, a3);
  id v9 = [(HRElectrocardiogramReportGenerator *)self pdfContext];
  [(HRElectrocardiogramReportGenerator *)self _pdfCropBox];
  CGFloat MaxX = CGRectGetMaxX(v14);
  CGContextAddLineToPoint(v9, MaxX, a3);
  id v11 = [(HRElectrocardiogramReportGenerator *)self pdfContext];
  CGContextDrawPath(v11, kCGPathStroke);
}

- (void)_drawAttributedText:(id)a3 atOrigin:(CGPoint)a4 leftAligned:(BOOL)a5
{
  CGFloat y = a4.y;
  double x = a4.x;
  id v9 = CTLineCreateWithAttributedString((CFAttributedStringRef)a3);
  unint64_t v10 = v9;
  if (!a5) {
    double x = x - CTLineGetTypographicBounds(v9, 0, 0, 0);
  }
  CGContextSetTextPosition([(HRElectrocardiogramReportGenerator *)self pdfContext], x, y);
  CTLineDraw(v10, [(HRElectrocardiogramReportGenerator *)self pdfContext]);
  CFRelease(v10);
}

- (_NSRange)_drawAttributedText:(id)a3 inRect:(CGRect)a4 distanceToFirstBaseline:(double)a5 drawHeartGlyph:(BOOL)a6 mustFitInRect:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  double height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v15 = a3;
  CTRunDelegateCallbacks v16 = [(HRElectrocardiogramReportGenerator *)self pdfContext];
  long long v17 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v63.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v63.c = v17;
  *(_OWORD *)&v63.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  CGContextSetTextMatrix(v16, &v63);
  id v61 = v15;
  double v18 = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)v15);
  v71.origin.double x = x;
  v71.origin.double y = y;
  v71.size.CGFloat width = width;
  v71.size.double height = height;
  uint64_t v19 = CGPathCreateWithRect(v71, 0);
  v66.CFIndex location = 0;
  v66.CFIndex length = 0;
  Frame = CTFramesetterCreateFrame(v18, v66, v19, 0);
  CFArrayRef Lines = CTFrameGetLines(Frame);
  CFIndex Count = CFArrayGetCount(Lines);
  double v60 = v18;
  if (Count < 1)
  {
    CFIndex v25 = Count;
    double v59 = v19;
  }
  else
  {
    *(_OWORD *)&v63.a = *MEMORY[0x263F00148];
    v67.CFIndex location = 0;
    v67.CFIndex length = 1;
    CTFrameGetLineOrigins(Frame, v67, (CGPoint *)&v63);
    v72.origin.double x = x;
    v72.origin.double y = y;
    v72.size.CGFloat width = width;
    v72.size.double height = height;
    CGFloat v23 = height - (a5 - (CGRectGetHeight(v72) - v63.b));
    CFRelease(Frame);
    CFRelease(v19);
    v73.origin.double x = x;
    v73.origin.double y = y;
    v73.size.CGFloat width = width;
    v73.size.double height = v23;
    CGPathRef v24 = CGPathCreateWithRect(v73, 0);
    v68.CFIndex location = 0;
    v68.CFIndex length = 0;
    double v59 = v24;
    Frame = CTFramesetterCreateFrame(v18, v68, v24, 0);
    CFArrayRef Lines = CTFrameGetLines(Frame);
    CFIndex v25 = CFArrayGetCount(Lines);
  }
  CFIndex length = CTFrameGetStringRange(Frame).length;
  CFRange VisibleStringRange = CTFrameGetVisibleStringRange(Frame);
  CFIndex location = VisibleStringRange.location;
  CFIndex v28 = VisibleStringRange.length;
  if (!v7 || length == VisibleStringRange.length)
  {
    CTFrameDraw(Frame, [(HRElectrocardiogramReportGenerator *)self pdfContext]);
    if (v8 && v25 >= 1)
    {
      CFIndex v29 = 0;
      CFIndex v56 = VisibleStringRange.length;
      CFIndex v57 = length;
      CFIndex v55 = v25;
      while (1)
      {
        ValueAtIndedouble x = (CTLineRef)CFArrayGetValueAtIndex(Lines, v29);
        CFArrayRef GlyphRuns = CTLineGetGlyphRuns(ValueAtIndex);
        CFIndex v31 = CFArrayGetCount(GlyphRuns);
        if (v31 >= 1) {
          break;
        }
LABEL_14:
        ++v29;
        CFIndex v28 = v56;
        CFIndex length = v57;
        if (v29 >= v55) {
          goto LABEL_17;
        }
      }
      CFIndex v32 = v31;
      CFIndex v33 = 0;
      while (1)
      {
        double v34 = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, v33);
        CFRange StringRange = CTRunGetStringRange(v34);
        if (StringRange.location <= [(HRElectrocardiogramReportGenerator *)self heartGlyphPositionInFirstSectionText]&& StringRange.location + StringRange.length > [(HRElectrocardiogramReportGenerator *)self heartGlyphPositionInFirstSectionText])
        {
          break;
        }
        if (++v33 >= v32) {
          goto LABEL_14;
        }
      }
      CGFloat descent = 0.0;
      v63.a = 0.0;
      v69.CFIndex location = 0;
      v69.CFIndex length = 0;
      double TypographicBounds = CTRunGetTypographicBounds(v34, v69, &v63.a, &descent, 0);
      CGFloat v37 = v63.a + descent;
      CFIndex v38 = CTRunGetStringRange(v34).location;
      OffsetForStringIndedouble x = CTLineGetOffsetForStringIndex(ValueAtIndex, v38, 0);
      MEMORY[0x270FA5388]();
      double v41 = (CGPoint *)(&v53 - 2 * v40);
      v70.CFIndex location = 0;
      v70.CFIndex length = 0;
      CTFrameGetLineOrigins(Frame, v70, v41);
      p_double x = &v41[v29].x;
      CGFloat v43 = OffsetForStringIndex + x + *p_x;
      CGFloat v44 = y + p_x[1] - descent;
      double v45 = (void *)MEMORY[0x263F1C6B0];
      double v46 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      double v47 = [v45 imageNamed:@"bpm.pdf" inBundle:v46 compatibleWithTraitCollection:0];

      double v48 = [(HRElectrocardiogramReportGenerator *)self pdfContext];
      id v49 = v47;
      double v50 = (CGImage *)[v49 CGImage];
      v74.origin.double x = v43;
      v74.origin.double y = v44;
      v74.size.CGFloat width = TypographicBounds;
      v74.size.double height = v37;
      CGContextDrawImage(v48, v74, v50);

      CFIndex v28 = v56;
      CFIndex length = v57;
    }
  }
LABEL_17:
  CFRelease(Frame);
  CFRelease(v60);
  CFRelease(v59);

  NSUInteger v51 = length - v28;
  NSUInteger v52 = location + v28;
  result.CFIndex length = v51;
  result.CFIndex location = v52;
  return result;
}

- (void)_drawElectrocardiogramChartWithWaveformPathIndex:(int64_t)a3 gridRect:(CGRect)a4 axisRect:(CGRect)a5 axisStartingIndex:(int64_t)a6 displayControlSignal:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a5.size.height;
  double y = a5.origin.y;
  double width = a5.size.width;
  double x = a5.origin.x;
  double v10 = a4.size.height;
  double v11 = a4.size.width;
  double v12 = a4.origin.y;
  double v13 = a4.origin.x;
  id v16 = objc_alloc(MEMORY[0x263F46720]);
  long long v17 = [MEMORY[0x263F46720] printedGridOptions];
  double v18 = objc_msgSend(v16, "initWithGridSize:gridOptions:", v17, 2.83465, 2.83465);

  uint64_t v19 = [(HRElectrocardiogramReportGenerator *)self waveformPaths];

  if (!v19)
  {
    double v52 = height;
    v20 = [(HRElectrocardiogramReportGenerator *)self dataSource];
    uint64_t v21 = [v20 sample];
    [v18 pointsPerSecond];
    double v23 = v22;
    [v18 pointsPerMillivolt];
    double v27 = v26;
    double v28 = 0.0;
    if (v7)
    {
      [v18 controlSignalDuration];
      double v28 = v29;
    }
    LODWORD(v24) = *MEMORY[0x263F46348];
    LODWORD(v25) = *MEMORY[0x263F46340];
    uint64_t v30 = objc_msgSend(v21, "hk_waveformPathsWithPointsPerSecond:pointsPerMillivolt:wrappingDuration:omittingInitialDuration:minimumValueInMillivolts:maximumValueInMillivolts:", v23, v27, 10.0, v28, v24, v25);
    [(HRElectrocardiogramReportGenerator *)self setWaveformPaths:v30];

    double height = v52;
  }
  CFIndex v31 = [(HRElectrocardiogramReportGenerator *)self waveformPaths];
  if ([v31 count] <= (unint64_t)a3)
  {
    id v33 = objc_alloc_init(MEMORY[0x263F1C478]);
  }
  else
  {
    CFIndex v32 = [(HRElectrocardiogramReportGenerator *)self waveformPaths];
    id v33 = [v32 objectAtIndexedSubscript:a3];
  }
  uint64_t v53 = v33;

  [v18 setWaveformPath:v33];
  [v18 setDisplayControlSignal:v7];
  [v18 setLineWidth:1.0];
  double v34 = [MEMORY[0x263F1C550] colorWithRed:0.803921569 green:0.0392156863 blue:0.125490196 alpha:1.0];
  [v18 setLineColor:v34];

  objc_msgSend(v18, "setFrame:", v13, v12, v11, v10);
  [v18 setNeedsLayout];
  [v18 layoutIfNeeded];
  v63.origin.double x = v13;
  v63.origin.double y = v12;
  v63.size.double width = v11;
  v63.size.double height = v10;
  double MaxY = CGRectGetMaxY(v63);
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = __144__HRElectrocardiogramReportGenerator__drawElectrocardiogramChartWithWaveformPathIndex_gridRect_axisRect_axisStartingIndex_displayControlSignal___block_invoke;
  v60[3] = &unk_2645813B0;
  id v61 = v18;
  double v62 = self;
  id v36 = v18;
  -[HRElectrocardiogramReportGenerator _drawUIKitContentAtDocumentOrigin:drawingBlock:](self, "_drawUIKitContentAtDocumentOrigin:drawingBlock:", v60, v13, MaxY);
  NSUInteger v51 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:1];
  CGFloat v37 = objc_msgSend(MEMORY[0x263F1C550], "hk_chartAxisLabelColor");
  CFIndex v38 = [v37 resolvedColorWithTraitCollection:v51];

  id v39 = objc_alloc(MEMORY[0x263F46708]);
  uint64_t v40 = [MEMORY[0x263F1C658] systemFontOfSize:5.0 weight:*MEMORY[0x263F1D340]];
  double v41 = [v36 gridOptions];
  double v42 = [v41 firstObject];
  CGFloat v43 = [v42 lineColor];
  CGFloat v44 = [v36 gridOptions];
  double v45 = [v44 firstObject];
  [v45 lineWidth];
  double v46 = objc_msgSend(v39, "initWithAxisLabelFont:axisLabelTextColor:scaleMetricsAutomatically:lineColor:lineWidth:axisLineToLabelSpacing:topBaselineMargin:bottomBaselineMargin:", v40, v38, 0, v43);

  id v47 = objc_alloc(MEMORY[0x263F46710]);
  [v36 pointsPerSecond];
  double v48 = objc_msgSend(v47, "initWithAxisSpacing:options:startingIndex:", v46, a6);
  objc_msgSend(v48, "setFrame:", x, y, width, height);
  [v48 setNeedsLayout];
  [v48 layoutIfNeeded];
  v64.origin.double x = x;
  v64.origin.double y = y;
  v64.size.double width = width;
  v64.size.double height = height;
  double v49 = CGRectGetMaxY(v64);
  v57[0] = MEMORY[0x263EF8330];
  v57[1] = 3221225472;
  v57[2] = __144__HRElectrocardiogramReportGenerator__drawElectrocardiogramChartWithWaveformPathIndex_gridRect_axisRect_axisStartingIndex_displayControlSignal___block_invoke_2;
  v57[3] = &unk_2645813B0;
  id v58 = v48;
  double v59 = self;
  id v50 = v48;
  -[HRElectrocardiogramReportGenerator _drawUIKitContentAtDocumentOrigin:drawingBlock:](self, "_drawUIKitContentAtDocumentOrigin:drawingBlock:", v57, x, v49);
}

void __144__HRElectrocardiogramReportGenerator__drawElectrocardiogramChartWithWaveformPathIndex_gridRect_axisRect_axisStartingIndex_displayControlSignal___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) layer];
  objc_msgSend(v2, "renderInContext:", objc_msgSend(*(id *)(a1 + 40), "pdfContext"));
}

void __144__HRElectrocardiogramReportGenerator__drawElectrocardiogramChartWithWaveformPathIndex_gridRect_axisRect_axisStartingIndex_displayControlSignal___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) layer];
  objc_msgSend(v2, "renderInContext:", objc_msgSend(*(id *)(a1 + 40), "pdfContext"));
}

- (void)_drawUIKitContentAtDocumentOrigin:(CGPoint)a3 drawingBlock:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  BOOL v7 = (void (**)(void))a4;
  CGContextTranslateCTM([(HRElectrocardiogramReportGenerator *)self pdfContext], 0.0, 612.0);
  CGContextScaleCTM([(HRElectrocardiogramReportGenerator *)self pdfContext], 1.0, -1.0);
  CGFloat v8 = 612.0 - y;
  CGContextTranslateCTM([(HRElectrocardiogramReportGenerator *)self pdfContext], x, v8);
  v7[2](v7);

  CGContextTranslateCTM([(HRElectrocardiogramReportGenerator *)self pdfContext], -x, -v8);
  CGContextScaleCTM([(HRElectrocardiogramReportGenerator *)self pdfContext], 1.0, -1.0);
  id v9 = [(HRElectrocardiogramReportGenerator *)self pdfContext];
  CGContextTranslateCTM(v9, 0.0, -612.0);
}

- (void)_drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGContextSetRGBStrokeColor([(HRElectrocardiogramReportGenerator *)self pdfContext], 1.0, 0.0, 0.0, 1.0);
  CGFloat v8 = [(HRElectrocardiogramReportGenerator *)self pdfContext];
  CGFloat v9 = x;
  CGFloat v10 = y;
  CGFloat v11 = width;
  CGFloat v12 = height;
  CGContextStrokeRectWithWidth(v8, *(CGRect *)&v9, 2.0);
}

- (id)_bulletedDescriptionTextAttributes
{
  v14[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F1C350]);
  [v3 setParagraphSpacingBefore:5.0];
  [v3 setLineSpacing:3.0];
  [v3 setHeadIndent:8.0];
  id v4 = objc_alloc(MEMORY[0x263F1C388]);
  id v5 = (void *)[v4 initWithTextAlignment:4 location:MEMORY[0x263EFFA78] options:8.0];
  v14[0] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  [v3 setTabStops:v6];

  BOOL v7 = objc_msgSend(MEMORY[0x263F1C658], "systemFontOfSize:weight:", 10.0, *MEMORY[0x263F1D338], *MEMORY[0x263F1C238]);
  v13[0] = v7;
  v12[1] = *MEMORY[0x263F1C240];
  CGFloat v8 = [(HRElectrocardiogramReportGenerator *)self _blackColorWithFraction:0.6];
  v13[1] = v8;
  void v12[2] = *MEMORY[0x263F1C268];
  CGFloat v9 = (void *)[v3 copy];
  v13[2] = v9;
  CGFloat v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

  return v10;
}

- (BOOL)_didMultilineBulletFlowIntoSectionThree:(id)a3 remainingRange:(_NSRange)a4
{
  if (!a4.length) {
    return 0;
  }
  id v4 = objc_msgSend(a3, "attributedSubstringFromRange:", 0, a4.location);
  id v5 = [v4 string];

  unint64_t v6 = [v5 rangeOfString:@"\n" options:4];
  unint64_t v7 = [v5 rangeOfString:@"•" options:4];
  BOOL v10 = v7 != 0x7FFFFFFFFFFFFFFFLL && v6 != 0x7FFFFFFFFFFFFFFFLL && v7 > v6;

  return v10;
}

- (HRElectrocardiogramReportDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HRElectrocardiogramReportDataSource *)WeakRetained;
}

- (CGContext)pdfContext
{
  return self->_pdfContext;
}

- (void)setPdfContext:(CGContext *)a3
{
  self->_pdfContext = a3;
}

- (NSArray)waveformPaths
{
  return self->_waveformPaths;
}

- (void)setWaveformPaths:(id)a3
{
}

- (unint64_t)heartGlyphPositionInFirstSectionText
{
  return self->_heartGlyphPositionInFirstSectionText;
}

- (void)setHeartGlyphPositionInFirstSectionText:(unint64_t)a3
{
  self->_heartGlyphPositionInFirstSectionText = a3;
}

- (double)descriptionTextSizeAdjustment
{
  return self->_descriptionTextSizeAdjustment;
}

- (void)setDescriptionTextSizeAdjustment:(double)a3
{
  self->_descriptionTextSizeAdjustment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waveformPaths, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end