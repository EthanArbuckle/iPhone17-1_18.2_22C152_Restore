@interface WDClinicalOnboardingSearchResultCell
- (HKClinicalProviderSearchResult)searchResult;
- (NSArray)searchTerms;
- (WDClinicalOnboardingSearchResultCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_setAccessibilityIdentifier;
- (void)_updateContentWithSearchResult:(id)a3 dataProvider:(id)a4 searchTerms:(id)a5;
- (void)_updateForContentSizeCategory:(id)a3;
- (void)_updateLabelVisibility;
- (void)setSearchResult:(id)a3;
- (void)setSearchResult:(id)a3 dataProvider:(id)a4 searchTerms:(id)a5;
- (void)setSearchTerms:(id)a3;
@end

@implementation WDClinicalOnboardingSearchResultCell

- (WDClinicalOnboardingSearchResultCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)WDClinicalOnboardingSearchResultCell;
  v4 = [(WDMedicalRecordBrandLogoCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(WDClinicalOnboardingSearchResultCell *)v4 setAccessoryType:1];
    v6 = [(WDMedicalRecordBrandCell *)v5 brandTitleLabel];
    [v6 setAccessibilityIdentifier:@"UIA.Health.ClinicalOnboarding.Search.SearchResult.Name"];

    searchTerms = v5->_searchTerms;
    v5->_searchTerms = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

- (void)setSearchResult:(id)a3 dataProvider:(id)a4 searchTerms:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(WDClinicalOnboardingSearchResultCell *)self setSearchResult:v10];
  [(WDClinicalOnboardingSearchResultCell *)self setSearchTerms:v8];
  [(WDClinicalOnboardingSearchResultCell *)self _updateContentWithSearchResult:v10 dataProvider:v9 searchTerms:v8];

  v11.receiver = self;
  v11.super_class = (Class)WDClinicalOnboardingSearchResultCell;
  [(WDMedicalRecordBrandCell *)&v11 setBrandable:v10 dataProvider:v9];
}

- (void)_updateLabelVisibility
{
  v3 = [(WDMedicalRecordBrandCell *)self brandTitleLabel];
  v4 = [v3 attributedText];
  BOOL v5 = [v4 length] == 0;
  v6 = [(WDMedicalRecordBrandCell *)self brandTitleLabel];
  [v6 setHidden:v5];

  v7 = [(WDMedicalRecordBrandCell *)self brandSubtitleLabel];
  id v8 = [v7 attributedText];
  BOOL v9 = [v8 length] == 0;
  id v10 = [(WDMedicalRecordBrandCell *)self brandSubtitleLabel];
  [v10 setHidden:v9];

  objc_super v11 = [(WDMedicalRecordBrandCell *)self brandDetailLabel];
  v12 = [v11 attributedText];
  BOOL v13 = [v12 length] == 0;
  v14 = [(WDMedicalRecordBrandCell *)self brandDetailLabel];
  [v14 setHidden:v13];

  [(WDClinicalOnboardingSearchResultCell *)self setNeedsUpdateConstraints];
}

- (void)_updateContentWithSearchResult:(id)a3 dataProvider:(id)a4 searchTerms:(id)a5
{
  v6 = [(WDClinicalOnboardingSearchResultCell *)self searchResult];

  v7 = [(WDMedicalRecordBrandCell *)self brandTitleLabel];
  id v8 = v7;
  if (v6)
  {
    BOOL v9 = [v7 font];
    id v10 = objc_msgSend(v9, "hk_fontByAddingSymbolicTraits:", 2);

    objc_super v11 = (void *)MEMORY[0x1E4F28E48];
    id v12 = v10;
    BOOL v13 = [(WDClinicalOnboardingSearchResultCell *)self searchResult];
    v14 = [v13 title];
    v15 = [(WDClinicalOnboardingSearchResultCell *)self searchTerms];
    v16 = [MEMORY[0x1E4FB1618] labelColor];
    v17 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v18 = [MEMORY[0x1E4FB1618] labelColor];
    v19 = objc_msgSend(v11, "wd_stringWithString:highlightingStrings:baseColor:baseFont:highlightingBaseColor:highlightColor:highlightFont:", v14, v15, v16, v12, v17, v18, v12);

    v20 = [(WDMedicalRecordBrandCell *)self brandTitleLabel];
    [v20 setAttributedText:v19];

    v21 = [(WDClinicalOnboardingSearchResultCell *)self searchResult];
    v22 = [v21 subtitle];

    if (v22)
    {
      v23 = [(WDMedicalRecordBrandCell *)self brandSubtitleLabel];
      v24 = [v23 font];

      v25 = objc_msgSend(v24, "hk_fontByAddingSymbolicTraits:", 2);
      v26 = (void *)MEMORY[0x1E4F28E48];
      v48 = [(WDClinicalOnboardingSearchResultCell *)self searchResult];
      v27 = [v48 subtitle];
      v28 = [(WDClinicalOnboardingSearchResultCell *)self searchTerms];
      v29 = [MEMORY[0x1E4FB1618] labelColor];
      v30 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      v31 = [MEMORY[0x1E4FB1618] labelColor];
      v32 = objc_msgSend(v26, "wd_stringWithString:highlightingStrings:baseColor:baseFont:highlightingBaseColor:highlightColor:highlightFont:", v27, v28, v29, v24, v30, v31, v25);
      v33 = [(WDMedicalRecordBrandCell *)self brandSubtitleLabel];
      [v33 setAttributedText:v32];
    }
    v34 = [(WDClinicalOnboardingSearchResultCell *)self searchResult];
    v35 = [v34 location];

    v36 = [(WDMedicalRecordBrandCell *)self brandDetailLabel];
    v37 = v36;
    if (v35)
    {
      v38 = [v36 font];
      v39 = objc_msgSend(v38, "hk_fontByAddingSymbolicTraits:", 2);
      v40 = (void *)MEMORY[0x1E4F28E48];
      v41 = [(WDClinicalOnboardingSearchResultCell *)self searchTerms];
      v42 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      v43 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      v44 = [MEMORY[0x1E4FB1618] labelColor];
      v45 = objc_msgSend(v40, "wd_stringWithString:highlightingStrings:baseColor:baseFont:highlightingBaseColor:highlightColor:highlightFont:", v35, v41, v42, v38, v43, v44, v39);
      [v37 setAttributedText:v45];
    }
    [(WDClinicalOnboardingSearchResultCell *)self _updateLabelVisibility];
    [(WDClinicalOnboardingSearchResultCell *)self _setAccessibilityIdentifier];
  }
  else
  {
    [v7 setAttributedText:0];

    v46 = [(WDMedicalRecordBrandCell *)self brandSubtitleLabel];
    [v46 setAttributedText:0];

    v47 = [(WDMedicalRecordBrandCell *)self brandDetailLabel];
    [v47 setAttributedText:0];

    [(WDClinicalOnboardingSearchResultCell *)self _updateLabelVisibility];
  }
}

- (void)_updateForContentSizeCategory:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WDClinicalOnboardingSearchResultCell;
  [(WDMedicalRecordBrandCell *)&v7 _updateForContentSizeCategory:a3];
  v4 = [(WDClinicalOnboardingSearchResultCell *)self searchResult];
  BOOL v5 = [(WDMedicalRecordBrandLogoCell *)self dataProvider];
  v6 = [(WDClinicalOnboardingSearchResultCell *)self searchTerms];
  [(WDClinicalOnboardingSearchResultCell *)self _updateContentWithSearchResult:v4 dataProvider:v5 searchTerms:v6];
}

- (void)_setAccessibilityIdentifier
{
  v34[2] = *MEMORY[0x1E4F143B8];
  v3 = HKUIJoinStringsForAutomationIdentifier();
  v34[0] = v3;
  v4 = [(WDMedicalRecordBrandCell *)self brandTitleLabel];
  BOOL v5 = [v4 text];
  v6 = v5;
  if (!v5) {
    BOOL v5 = &stru_1F1D9FF30;
  }
  objc_super v7 = [(__CFString *)v5 removeSpecialCharactersAndWhiteSpaces];
  v34[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  BOOL v9 = HKUIJoinStringsForAutomationIdentifier();
  id v10 = [(WDMedicalRecordBrandCell *)self brandTitleLabel];
  [v10 setAccessibilityIdentifier:v9];

  v33[0] = v3;
  objc_super v11 = [(WDMedicalRecordBrandCell *)self brandSubtitleLabel];
  id v12 = [v11 text];
  BOOL v13 = v12;
  if (!v12) {
    id v12 = &stru_1F1D9FF30;
  }
  v14 = [(__CFString *)v12 removeSpecialCharactersAndWhiteSpaces];
  v33[1] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  v16 = HKUIJoinStringsForAutomationIdentifier();
  v17 = [(WDMedicalRecordBrandCell *)self brandSubtitleLabel];
  [v17 setAccessibilityIdentifier:v16];

  v32[0] = v3;
  v18 = [(WDMedicalRecordBrandCell *)self brandDetailLabel];
  v19 = [v18 text];
  v20 = v19;
  if (!v19) {
    v19 = &stru_1F1D9FF30;
  }
  v21 = [(__CFString *)v19 removeSpecialCharactersAndWhiteSpaces];
  v32[1] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  v23 = HKUIJoinStringsForAutomationIdentifier();
  v24 = [(WDMedicalRecordBrandCell *)self brandDetailLabel];
  [v24 setAccessibilityIdentifier:v23];

  v25 = [(WDClinicalOnboardingSearchResultCell *)self searchResult];
  v26 = [v25 title];
  v27 = v26;
  if (!v26) {
    v26 = &stru_1F1D9FF30;
  }
  v28 = [(__CFString *)v26 removeSpecialCharactersAndWhiteSpaces];
  v31[1] = v28;
  v31[2] = @"tableCell";
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:3];
  v30 = HKUIJoinStringsForAutomationIdentifier();
  [(WDClinicalOnboardingSearchResultCell *)self setAccessibilityIdentifier:v30];
}

- (HKClinicalProviderSearchResult)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
{
}

- (NSArray)searchTerms
{
  return self->_searchTerms;
}

- (void)setSearchTerms:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerms, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
}

@end