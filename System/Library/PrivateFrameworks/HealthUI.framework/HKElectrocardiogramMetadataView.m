@interface HKElectrocardiogramMetadataView
- (BOOL)allowExportToPDF;
- (BOOL)displayGraph;
- (BOOL)isSharedData;
- (HKElectrocardiogram)sample;
- (HKElectrocardiogramMetadataView)initWithSample:(id)a3 activeAlgorithmVersion:(int64_t)a4 displayGraph:(BOOL)a5 allowExportToPDF:(BOOL)a6 isSharedData:(BOOL)a7 delegate:(id)a8;
- (HKElectrocardiogramMetadataViewDelegate)delegate;
- (id)_bulletedTextView;
- (id)_ecgChart;
- (id)_footerLabel;
- (id)_separatorLine;
- (id)_sharePDFControl;
- (void)_setupUIWithActiveAlgorithmVersion:(int64_t)a3;
- (void)detailButtonTapped:(id)a3;
- (void)setDelegate:(id)a3;
- (void)sharedPDFControlTapped:(id)a3;
@end

@implementation HKElectrocardiogramMetadataView

- (HKElectrocardiogramMetadataView)initWithSample:(id)a3 activeAlgorithmVersion:(int64_t)a4 displayGraph:(BOOL)a5 allowExportToPDF:(BOOL)a6 isSharedData:(BOOL)a7 delegate:(id)a8
{
  id v15 = a3;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)HKElectrocardiogramMetadataView;
  v17 = -[HKElectrocardiogramMetadataView initWithFrame:](&v20, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v18 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v17->_sample, a3);
    v17->_displayGraph = a5;
    v17->_allowExportToPDF = a6;
    v17->_isSharedData = a7;
    objc_storeWeak((id *)&v17->_delegate, v16);
    [(HKElectrocardiogramMetadataView *)v17 _setupUIWithActiveAlgorithmVersion:a4];
  }
  v18 = v17;
LABEL_6:

  return v18;
}

- (void)_setupUIWithActiveAlgorithmVersion:(int64_t)a3
{
  id v91 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v91 setBackgroundColor:v5];

  [(HKElectrocardiogramMetadataView *)self addSubview:v91];
  [v91 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_msgSend(v91, "hk_alignHorizontalConstraintsWithView:margin:", self, 0.0);
  v6 = [v91 topAnchor];
  v7 = [(HKElectrocardiogramMetadataView *)self topAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  [v8 setActive:1];

  v9 = [(HKElectrocardiogramMetadataView *)self sample];
  v10 = [v9 _localizedClassificationWithActiveAlgorithmVersion:a3];

  v11 = [HKElectrocardiogramMetadataHeaderView alloc];
  v12 = [(HKElectrocardiogramMetadataView *)self sample];
  v13 = [v12 startDate];
  v14 = [(HKElectrocardiogramMetadataHeaderView *)v11 initWithText:v10 date:v13];

  [v91 addSubview:v14];
  [(HKElectrocardiogramMetadataHeaderView *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v15 = [(HKElectrocardiogramMetadataHeaderView *)v14 leadingAnchor];
  id v16 = [(HKElectrocardiogramMetadataView *)self layoutMarginsGuide];
  v17 = [v16 leadingAnchor];
  v18 = [v15 constraintEqualToAnchor:v17 constant:10.0];
  [v18 setActive:1];

  v19 = [(HKElectrocardiogramMetadataView *)self layoutMarginsGuide];
  objc_super v20 = [v19 trailingAnchor];
  v21 = [(HKElectrocardiogramMetadataHeaderView *)v14 trailingAnchor];
  v22 = [v20 constraintEqualToAnchor:v21 constant:10.0];
  [v22 setActive:1];

  v23 = [(HKElectrocardiogramMetadataHeaderView *)v14 topAnchor];
  v24 = [v91 topAnchor];
  v25 = [v23 constraintEqualToAnchor:v24 constant:16.0];
  [v25 setActive:1];

  v26 = [(HKElectrocardiogramMetadataHeaderView *)v14 detailButton];
  [v26 addTarget:self action:sel_detailButtonTapped_ forControlEvents:64];

  v27 = [(HKElectrocardiogramMetadataView *)self sample];
  uint64_t v28 = objc_msgSend(v27, "hk_isClassificationSupported") ^ 1;
  v29 = [(HKElectrocardiogramMetadataHeaderView *)v14 detailButton];
  [v29 setHidden:v28];

  v30 = [(HKElectrocardiogramMetadataHeaderView *)v14 bottomAnchor];
  LODWORD(v27) = [(HKElectrocardiogramMetadataView *)self displayGraph];
  v31 = [(HKElectrocardiogramMetadataView *)self _ecgChart];
  v32 = v31;
  if (v27)
  {
    [v91 addSubview:v31];
    [v32 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_msgSend(v32, "hk_alignHorizontalConstraintsWithView:margin:", v91, 10.0);
    v33 = [v32 topAnchor];
    v34 = [v33 constraintEqualToAnchor:v30 constant:8.0];
  }
  else
  {
    v35 = [v31 infoView];

    [v91 addSubview:v35];
    [v35 setTranslatesAutoresizingMaskIntoConstraints:0];
    v36 = [v35 leadingAnchor];
    v37 = [(HKElectrocardiogramMetadataView *)self layoutMarginsGuide];
    v38 = [v37 leadingAnchor];
    v39 = [v36 constraintEqualToAnchor:v38 constant:10.0];
    [v39 setActive:1];

    v40 = [v35 trailingAnchor];
    v41 = [(HKElectrocardiogramMetadataView *)self trailingAnchor];
    v42 = [v40 constraintEqualToAnchor:v41 constant:-10.0];
    [v42 setActive:1];

    v33 = [v35 topAnchor];
    v34 = [v33 constraintEqualToAnchor:v30];
    v32 = v35;
  }
  [v34 setActive:1];

  v43 = [v32 bottomAnchor];

  v44 = [(HKElectrocardiogramMetadataView *)self sample];
  char v45 = objc_msgSend(v44, "hk_isSymptomsNotSet");

  if ((v45 & 1) == 0)
  {
    v46 = [(HKElectrocardiogramMetadataView *)self _separatorLine];
    [v91 addSubview:v46];
    v47 = [v46 leadingAnchor];
    v48 = [(HKElectrocardiogramMetadataView *)self layoutMarginsGuide];
    v49 = [v48 leadingAnchor];
    v50 = [v47 constraintEqualToAnchor:v49 constant:10.0];
    [v50 setActive:1];

    v51 = [v46 trailingAnchor];
    v52 = [(HKElectrocardiogramMetadataView *)self trailingAnchor];
    v53 = [v51 constraintEqualToAnchor:v52];
    [v53 setActive:1];

    v54 = [v46 topAnchor];
    v55 = [v54 constraintEqualToAnchor:v43];
    [v55 setActive:1];

    v56 = [v46 bottomAnchor];

    v57 = [(HKElectrocardiogramMetadataView *)self _bulletedTextView];
    [v91 addSubview:v57];
    [v57 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_msgSend(v57, "hk_alignHorizontalConstraintsWithView:margin:", v91, 10.0);
    v58 = [v57 topAnchor];
    v59 = [v58 constraintEqualToAnchor:v56];
    [v59 setActive:1];

    v43 = [v57 bottomAnchor];
  }
  if ([(HKElectrocardiogramMetadataView *)self allowExportToPDF])
  {
    v60 = [(HKElectrocardiogramMetadataView *)self _sharePDFControl];
    [v91 addSubview:v60];
    [v60 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_msgSend(v60, "hk_alignHorizontalConstraintsWithView:margin:", v91, 0.0);
    v61 = [v60 topAnchor];
    v62 = [v61 constraintEqualToAnchor:v43];
    [v62 setActive:1];

    uint64_t v63 = [v60 bottomAnchor];

    v43 = (void *)v63;
  }
  v64 = [(HKElectrocardiogramMetadataView *)self _separatorLine];
  [v91 addSubview:v64];
  v65 = [v64 leadingAnchor];
  v66 = [(HKElectrocardiogramMetadataView *)self layoutMarginsGuide];
  v67 = [v66 leadingAnchor];
  v68 = [v65 constraintEqualToAnchor:v67 constant:10.0];
  [v68 setActive:1];

  v69 = [v64 trailingAnchor];
  v70 = [(HKElectrocardiogramMetadataView *)self trailingAnchor];
  v71 = [v69 constraintEqualToAnchor:v70];
  [v71 setActive:1];

  v72 = [v64 topAnchor];
  v73 = [v72 constraintEqualToAnchor:v43];
  [v73 setActive:1];

  v74 = [v64 bottomAnchor];

  v75 = [(HKElectrocardiogramMetadataView *)self _footerLabel];
  [v91 addSubview:v75];
  v76 = [v75 leadingAnchor];
  v77 = [(HKElectrocardiogramMetadataView *)self layoutMarginsGuide];
  v78 = [v77 leadingAnchor];
  v79 = [v76 constraintEqualToAnchor:v78 constant:10.0];
  [v79 setActive:1];

  v80 = [v75 trailingAnchor];
  v81 = [(HKElectrocardiogramMetadataView *)self trailingAnchor];
  v82 = [v80 constraintEqualToAnchor:v81 constant:-10.0];
  [v82 setActive:1];

  v83 = [v75 topAnchor];
  v84 = [v83 constraintEqualToAnchor:v74 constant:10.0];
  [v84 setActive:1];

  v85 = [v91 bottomAnchor];
  v86 = [v75 bottomAnchor];
  v87 = [v85 constraintEqualToAnchor:v86 constant:16.0];
  [v87 setActive:1];

  v88 = [(HKElectrocardiogramMetadataView *)self bottomAnchor];
  v89 = [v91 bottomAnchor];
  v90 = [v88 constraintEqualToAnchor:v89];
  [v90 setActive:1];
}

- (void)detailButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained electrocardiogramMetadataViewDidTapDetailButton:self];
}

- (void)sharedPDFControlTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained electrocardiogramMetadataViewDidSelectShareRow:self];
}

- (id)_ecgChart
{
  v3 = -[HKElectrocardiogramChartMetadataView initWithGridSize:]([HKElectrocardiogramChartMetadataView alloc], "initWithGridSize:", 6.0, 6.0);
  v4 = [(HKElectrocardiogramChartMetadataView *)v3 chartView];
  v5 = [(HKElectrocardiogramMetadataView *)self sample];
  [v4 displayElectrocardiogram:v5 allowsScrolling:1];

  v6 = [(HKElectrocardiogramChartMetadataView *)v3 chartView];
  [v6 setEdgeMaskEnabled:1];

  v7 = [(HKElectrocardiogramMetadataView *)self sample];
  v8 = objc_msgSend(v7, "hk_localizedAverageBPM");
  v9 = [(HKElectrocardiogramChartMetadataView *)v3 infoView];
  [v9 setHeartRateText:v8];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = [(HKElectrocardiogramMetadataView *)self sample];
  v12 = [WeakRetained electrocardiogramMetadataView:self regulatedBodyTextForSample:v11];
  v13 = [(HKElectrocardiogramChartMetadataView *)v3 infoView];
  [v13 setBodyText:v12];

  v14 = [@"SessionDetails" stringByAppendingString:@".Waveform"];
  id v15 = [NSString healthAccessibilityIdentifier:1 suffix:v14];
  [(HKElectrocardiogramChartMetadataView *)v3 setAccessibilityIdentifier:v15];

  return v3;
}

- (id)_bulletedTextView
{
  v3 = objc_alloc_init(HKElectrocardiogramBulletedTextView);
  v4 = HKHealthKitFrameworkBundle();
  v5 = [v4 localizedStringForKey:@"SYMPTOMS_TITLE" value:&stru_1F3B9CF20 table:@"Localizable-Cinnamon"];
  v6 = HKConditionallyRedactedHeartRhythmString();
  [(HKElectrocardiogramBulletedTextView *)v3 setTitleText:v6];

  v7 = [(HKElectrocardiogramMetadataView *)self sample];
  v8 = [v7 _localizedSymptoms];
  [(HKElectrocardiogramBulletedTextView *)v3 setDetailTextWithBullets:v8];

  v9 = [@"SessionDetails" stringByAppendingString:@".Symptoms"];
  v10 = [NSString healthAccessibilityIdentifier:1 suffix:v9];
  [(HKElectrocardiogramBulletedTextView *)v3 setAccessibilityIdentifier:v10];

  return v3;
}

- (id)_sharePDFControl
{
  v3 = [HKExportPDFControl alloc];
  v4 = HKHealthKitFrameworkBundle();
  v5 = [v4 localizedStringForKey:@"ECG_SHARE_PDF_TITLE" value:&stru_1F3B9CF20 table:@"Localizable-Cinnamon"];
  v6 = HKConditionallyRedactedHeartRhythmString();
  v7 = [NSString healthAccessibilityIdentifier:1 suffix:@"SessionDetails"];
  v8 = -[HKExportPDFControl initWithText:layoutMargins:accessibilityIdentifierPrefix:](v3, "initWithText:layoutMargins:accessibilityIdentifierPrefix:", v6, v7, 10.0, 10.0, 10.0, 10.0);

  [(HKExportPDFControl *)v8 addTarget:self action:sel_sharedPDFControlTapped_ forControlEvents:64];
  return v8;
}

- (id)_footerLabel
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];

  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(self) = [(HKElectrocardiogramMetadataView *)self isSharedData];
  v5 = HKHealthKitFrameworkBundle();
  v6 = v5;
  if (self) {
    v7 = @"ECG_IN_CASE_OF_EMERGENCY_SHARED_SUMMARY";
  }
  else {
    v7 = @"ECG_IN_CASE_OF_EMERGENCY";
  }
  v8 = [v5 localizedStringForKey:v7 value:&stru_1F3B9CF20 table:@"Localizable-Cinnamon"];
  v9 = HKConditionallyRedactedHeartRhythmString();
  [v3 setText:v9];

  [v3 setAdjustsFontForContentSizeCategory:1];
  [v3 setTextAlignment:4];
  v10 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v3 setTextColor:v10];

  [v3 setNumberOfLines:0];
  v11 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28F0] addingSymbolicTraits:0x8000 options:0];
  v12 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v11 size:0.0];
  [v3 setFont:v12];

  v13 = [@"SessionDetails" stringByAppendingString:@".HeartAttackWarning"];
  v14 = [NSString healthAccessibilityIdentifier:1 suffix:v13];
  [v3 setAccessibilityIdentifier:v14];

  return v3;
}

- (id)_separatorLine
{
  v2 = objc_alloc_init(HKSeparatorLineView);
  [(HKSeparatorLineView *)v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v3 = [MEMORY[0x1E4FB1618] opaqueSeparatorColor];
  [(HKSeparatorLineView *)v2 setColor:v3];

  [(HKSeparatorLineView *)v2 setSeparatorThickness:HKUIFloorToScreenScale(0.5)];
  return v2;
}

- (HKElectrocardiogram)sample
{
  return self->_sample;
}

- (BOOL)displayGraph
{
  return self->_displayGraph;
}

- (BOOL)allowExportToPDF
{
  return self->_allowExportToPDF;
}

- (BOOL)isSharedData
{
  return self->_isSharedData;
}

- (HKElectrocardiogramMetadataViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKElectrocardiogramMetadataViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sample, 0);
}

@end