@interface WDMedicalRecordTableViewUtility
+ (id)medicalRecordCellWithTableView:(id)a3 displayItem:(id)a4 clinicalAccount:(id)a5 accountOwner:(id)a6 clinicalDataSourcesProvider:(id)a7;
+ (void)registerReuseIdentifiersWithTableView:(id)a3;
@end

@implementation WDMedicalRecordTableViewUtility

+ (void)registerReuseIdentifiersWithTableView:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  v5 = +[HRTimelineHeaderView reuseIdentifier];
  [v3 registerClass:v4 forHeaderFooterViewReuseIdentifier:v5];

  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"Cell"];
  uint64_t v6 = objc_opt_class();
  v7 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
  [v3 registerClass:v6 forCellReuseIdentifier:v7];

  uint64_t v8 = objc_opt_class();
  v9 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
  [v3 registerClass:v8 forCellReuseIdentifier:v9];

  uint64_t v10 = objc_opt_class();
  v11 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
  [v3 registerClass:v10 forCellReuseIdentifier:v11];

  uint64_t v12 = objc_opt_class();
  v13 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
  [v3 registerClass:v12 forCellReuseIdentifier:v13];

  uint64_t v14 = objc_opt_class();
  v15 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
  [v3 registerClass:v14 forCellReuseIdentifier:v15];

  uint64_t v16 = objc_opt_class();
  v17 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
  [v3 registerClass:v16 forCellReuseIdentifier:v17];

  uint64_t v18 = objc_opt_class();
  v19 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
  [v3 registerClass:v18 forCellReuseIdentifier:v19];

  uint64_t v20 = objc_opt_class();
  v21 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
  [v3 registerClass:v20 forCellReuseIdentifier:v21];

  uint64_t v22 = objc_opt_class();
  v23 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
  [v3 registerClass:v22 forCellReuseIdentifier:v23];

  uint64_t v24 = objc_opt_class();
  v25 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
  [v3 registerClass:v24 forCellReuseIdentifier:v25];

  uint64_t v26 = objc_opt_class();
  v27 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
  [v3 registerClass:v26 forCellReuseIdentifier:v27];

  uint64_t v28 = objc_opt_class();
  v29 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
  [v3 registerClass:v28 forCellReuseIdentifier:v29];

  uint64_t v30 = objc_opt_class();
  v31 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
  [v3 registerClass:v30 forCellReuseIdentifier:v31];

  uint64_t v32 = objc_opt_class();
  v33 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
  [v3 registerClass:v32 forCellReuseIdentifier:v33];

  uint64_t v34 = objc_opt_class();
  v35 = +[HRConceptHeaderCell defaultReuseIdentifier];
  [v3 registerClass:v34 forCellReuseIdentifier:v35];

  uint64_t v36 = objc_opt_class();
  id v37 = +[WDMedicalRecordSpacerTextCell defaultReuseIdentifier];
  [v3 registerClass:v36 forCellReuseIdentifier:v37];
}

+ (id)medicalRecordCellWithTableView:(id)a3 displayItem:(id)a4 clinicalAccount:(id)a5 accountOwner:(id)a6 clinicalDataSourcesProvider:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  switch([v13 displayItemType])
  {
    case 1:
      v21 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
      uint64_t v18 = [v12 dequeueReusableCellWithIdentifier:v21];

      [v18 setIntendedPlacement:1];
      uint64_t v20 = [v13 brandableObject];
      uint64_t v22 = [v20 title];
      [v18 setTitle:v22];

      goto LABEL_24;
    case 2:
      v23 = +[WDMedicalRecordSpacerTextCell defaultReuseIdentifier];
      uint64_t v18 = [v12 dequeueReusableCellWithIdentifier:v23];

      uint64_t v24 = [v13 title];
      [v18 setTitle:v24];

      objc_msgSend(v18, "setUseTallTopPadding:", objc_msgSend(v13, "extraTopPadding"));
      break;
    case 3:
      v25 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
      uint64_t v18 = [v12 dequeueReusableCellWithIdentifier:v25];

      objc_msgSend(v18, "setIntendedPlacement:", objc_msgSend(v13, "placement"));
      [v13 separatorInsets];
      objc_msgSend(v18, "setSeparatorInsets:");
      objc_msgSend(v18, "setExtraTopPadding:", objc_msgSend(v13, "extraTopPadding"));
      uint64_t v26 = [v13 metricColors];
      v27 = [v26 keyColor];

      uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F67AE0]) initWithTopColor:v27 bottomColor:v27];
      [v18 setGradient:v28];

      objc_msgSend(v18, "setSeparatorDashStyle:hidden:", objc_msgSend(v13, "separatorStyle"), objc_msgSend(v13, "separatorHidden"));
      goto LABEL_38;
    case 4:
      id v29 = v15;
      uint64_t v30 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
      uint64_t v18 = [v12 dequeueReusableCellWithIdentifier:v30];

      objc_msgSend(v18, "setIntendedPlacement:", objc_msgSend(v13, "placement"));
      v31 = [v13 title];
      [v18 setTitle:v31];

      [v13 separatorInsets];
      objc_msgSend(v18, "setSeparatorInsets:");
      objc_msgSend(v18, "setExtraTopPadding:", objc_msgSend(v13, "extraTopPadding"));
      objc_msgSend(v18, "setShowDisclosureIndicator:", objc_msgSend(v13, "showDisclosureIndicator"));
      objc_msgSend(v18, "setUseRegularFontForSubtitle:", objc_msgSend(v13, "useRegularFontForSubtitle"));
      objc_msgSend(v18, "setSeparatorDashStyle:hidden:", objc_msgSend(v13, "separatorStyle"), objc_msgSend(v13, "separatorHidden"));
      uint64_t v32 = [v13 medicalRecord];
      uint64_t v33 = [v32 medicalRecordOriginType];

      if (v33 == 3)
      {
        uint64_t v34 = [v13 medicalRecord];
        v35 = [v34 originIdentifier];

        uint64_t v36 = [v35 signedClinicalDataRecordIdentifier];
        if (v16)
        {
          [v18 setCurrentSignedClinicalDataRecordIdentifier:v36];
          v97[0] = MEMORY[0x1E4F143A8];
          v97[1] = 3221225472;
          v97[2] = __135__WDMedicalRecordTableViewUtility_medicalRecordCellWithTableView_displayItem_clinicalAccount_accountOwner_clinicalDataSourcesProvider___block_invoke;
          v97[3] = &unk_1E644AB48;
          id v98 = v18;
          id v99 = v36;
          id v100 = v13;
          id v101 = a1;
          [v16 fetchSignedClinicalDataRecordWithIdentifier:v99 completion:v97];
        }
        else
        {
          _HKInitializeLogging();
          v93 = *MEMORY[0x1E4F29F38];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_FAULT)) {
            +[WDMedicalRecordTableViewUtility medicalRecordCellWithTableView:displayItem:clinicalAccount:accountOwner:clinicalDataSourcesProvider:]((uint64_t)v35, v93);
          }
        }
      }
      else
      {
        v86 = [v13 subtitle];
        [v18 setSubtitle:v86];
      }
      id v15 = v29;
      break;
    case 5:
      id v94 = v16;
      id v37 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
      uint64_t v18 = [v12 dequeueReusableCellWithIdentifier:v37];

      objc_msgSend(v18, "setIntendedPlacement:", objc_msgSend(v13, "placement"));
      v38 = [v13 title];
      [v18 setTitle:v38];

      v39 = [v13 valueString];
      v40 = [v13 unitString];
      [v18 setValue:v39 unit:v40];

      [v13 separatorInsets];
      objc_msgSend(v18, "setSeparatorInsets:");
      objc_msgSend(v18, "setSeparatorDashStyle:hidden:", objc_msgSend(v13, "separatorStyle"), objc_msgSend(v13, "separatorHidden"));
      v41 = [v13 medicalRecord];
      uint64_t v42 = [v41 medicalRecordOriginType];

      id v95 = v15;
      id v43 = v14;
      if (v42 == 3)
      {
        v44 = [MEMORY[0x1E4FB1818] checkmarkSymbol];
      }
      else
      {
        v44 = 0;
      }
      v87 = (void *)MEMORY[0x1E4F28E48];
      v88 = [v13 subtitle];
      v89 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      v90 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      v91 = [v87 attributedStringText:v88 textColor:v89 symbol:v44 symbolColor:v90 useLargeSpacing:0];

      [v18 setAttributedSubtitleText:v91];
      id v14 = v43;
      id v16 = v94;
      id v15 = v95;
      break;
    case 6:
      v45 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
      uint64_t v18 = [v12 dequeueReusableCellWithIdentifier:v45];

      objc_msgSend(v18, "setIntendedPlacement:", objc_msgSend(v13, "placement"));
      v46 = [v13 subtitle];
      [v18 setSubtitle:v46];

      v47 = [v13 chartValueWithRange];
      [v18 setValueInRange:v47];

      [v13 separatorInsets];
      objc_msgSend(v18, "setSeparatorInsets:");
      objc_msgSend(v18, "setSeparatorDashStyle:hidden:", objc_msgSend(v13, "separatorStyle"), objc_msgSend(v13, "separatorHidden"));
      v48 = [v13 medicalRecord];
      uint64_t v49 = [v48 medicalRecordOriginType];

      if (v49 == 3)
      {
        v50 = (void *)MEMORY[0x1E4F28E48];
        v51 = [v13 subtitle];
        [MEMORY[0x1E4FB1618] secondaryLabelColor];
        v52 = id v96 = v15;
        [MEMORY[0x1E4FB1818] checkmarkSymbol];
        id v53 = v16;
        v55 = id v54 = v14;
        v56 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        v57 = [v50 attributedStringText:v51 textColor:v52 symbol:v55 symbolColor:v56 useLargeSpacing:0];

        id v14 = v54;
        id v16 = v53;

        id v15 = v96;
        [v18 setAttributedSubtitleText:v57];
      }
      else
      {
        v57 = [v13 subtitle];
        [v18 setSubtitle:v57];
      }

      break;
    case 7:
      v58 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
      uint64_t v18 = [v12 dequeueReusableCellWithIdentifier:v58];

      objc_msgSend(v18, "setIntendedPlacement:", objc_msgSend(v13, "placement"));
      v59 = [v13 title];
      [v18 setTitle:v59];
      goto LABEL_15;
    case 8:
      v60 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
      uint64_t v18 = [v12 dequeueReusableCellWithIdentifier:v60];

      objc_msgSend(v18, "setIntendedPlacement:", objc_msgSend(v13, "placement"));
      v61 = [v13 title];
      [v18 setTitle:v61];

      v59 = [v13 subtitle];
      [v18 setSubtitle:v59];
LABEL_15:

      [v13 separatorInsets];
      objc_msgSend(v18, "setSeparatorInsets:");
      objc_msgSend(v18, "setExtraTopPadding:", objc_msgSend(v13, "extraTopPadding"));
      uint64_t v62 = [v13 separatorStyle];
      uint64_t v63 = [v13 separatorHidden];
      v64 = v18;
      uint64_t v65 = v62;
      goto LABEL_25;
    case 9:
      v66 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
      uint64_t v18 = [v12 dequeueReusableCellWithIdentifier:v66];

      objc_msgSend(v18, "setIntendedPlacement:", objc_msgSend(v13, "placement"));
      uint64_t v20 = [v13 title];
      [v18 setTitle:v20];
      goto LABEL_24;
    case 10:
      v67 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
      v27 = [v12 dequeueReusableCellWithIdentifier:v67];

      objc_msgSend(v27, "setIntendedPlacement:", objc_msgSend(v13, "placement"));
      [v13 separatorInsets];
      objc_msgSend(v27, "setSeparatorInsets:");
      objc_msgSend(v27, "setExtraTopPadding:", objc_msgSend(v13, "extraTopPadding"));
      if (v14 && v16)
      {
        [v27 setBrandable:v14 dataProvider:v16];
        v68 = [v16 nameAndFormattedBirthDateForAccountOwner:v15];
        v69 = [v27 brandDetailLabel];
        [v69 setText:v68];

        [v27 _updateLabelVisibility];
        id v70 = v27;
      }
      else
      {
        v92 = (objc_class *)objc_opt_class();
        v68 = NSStringFromClass(v92);
        HKErrorTableViewCell();
        id v70 = (id)objc_claimAutoreleasedReturnValue();
      }
      uint64_t v18 = v70;

LABEL_38:
      break;
    case 11:
      v71 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
      uint64_t v18 = [v12 dequeueReusableCellWithIdentifier:v71];

      objc_msgSend(v18, "setIntendedPlacement:", objc_msgSend(v13, "placement"));
      v72 = [v13 title];
      [v18 setTitle:v72];

      [v13 separatorInsets];
      objc_msgSend(v18, "setSeparatorInsets:");
      goto LABEL_30;
    case 14:
      v75 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
      uint64_t v18 = [v12 dequeueReusableCellWithIdentifier:v75];

      objc_msgSend(v18, "setIntendedPlacement:", objc_msgSend(v13, "placement"));
      v76 = [v13 title];
      [v18 setTitle:v76];

      uint64_t v20 = [v13 subtitle];
      [v18 setDateSubtitle:v20];
      goto LABEL_24;
    case 15:
      v77 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
      uint64_t v18 = [v12 dequeueReusableCellWithIdentifier:v77];

      objc_msgSend(v18, "setIntendedPlacement:", objc_msgSend(v13, "placement"));
      v78 = [v13 title];
      [v18 setTitle:v78];

      uint64_t v20 = [v13 subtitle];
      [v18 setSubtitle:v20];
      goto LABEL_24;
    case 16:
    case 17:
      v17 = +[WDMedicalRecordGroupableCell defaultReuseIdentifier];
      uint64_t v18 = [v12 dequeueReusableCellWithIdentifier:v17];

      objc_msgSend(v18, "setIntendedPlacement:", objc_msgSend(v13, "placement"));
      v19 = [v13 title];
      [v18 setTitle:v19];

      uint64_t v20 = [v13 attributedSubtitle];
      [v18 setAttributedSubtitle:v20];
LABEL_24:

      [v13 separatorInsets];
      objc_msgSend(v18, "setSeparatorInsets:");
      objc_msgSend(v18, "setExtraTopPadding:", objc_msgSend(v13, "extraTopPadding"));
      uint64_t v79 = [v13 separatorStyle];
      uint64_t v63 = [v13 separatorHidden];
      v64 = v18;
      uint64_t v65 = v79;
LABEL_25:
      [v64 setSeparatorDashStyle:v65 hidden:v63];
      break;
    case 18:
      v81 = +[HRConceptHeaderCell defaultReuseIdentifier];
      uint64_t v18 = [v12 dequeueReusableCellWithIdentifier:v81];

      objc_msgSend(v18, "setIntendedPlacement:", objc_msgSend(v13, "placement"));
      v82 = [v13 image];
      [v18 setHeaderImage:v82];

      v83 = [v13 title];
      [v18 setTitle:v83];

      v84 = [v13 metricColors];
      v85 = [v84 keyColor];
      [v18 setCategoryColor:v85];

LABEL_30:
      objc_msgSend(v18, "setExtraTopPadding:", objc_msgSend(v13, "extraTopPadding"));
      break;
    default:
      v73 = (objc_class *)objc_opt_class();
      v74 = NSStringFromClass(v73);
      uint64_t v18 = HKErrorTableViewCell();

      break;
  }

  return v18;
}

void __135__WDMedicalRecordTableViewUtility_medicalRecordCellWithTableView_displayItem_clinicalAccount_accountOwner_clinicalDataSourcesProvider___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __135__WDMedicalRecordTableViewUtility_medicalRecordCellWithTableView_displayItem_clinicalAccount_accountOwner_clinicalDataSourcesProvider___block_invoke_2;
    v8[3] = &unk_1E644A710;
    id v9 = a1[4];
    id v10 = a1[5];
    id v11 = v5;
    id v12 = a1[6];
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E4F29F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_ERROR)) {
      __135__WDMedicalRecordTableViewUtility_medicalRecordCellWithTableView_displayItem_clinicalAccount_accountOwner_clinicalDataSourcesProvider___block_invoke_cold_1((uint64_t)a1, (uint64_t)v6, v7);
    }
  }
}

void __135__WDMedicalRecordTableViewUtility_medicalRecordCellWithTableView_displayItem_clinicalAccount_accountOwner_clinicalDataSourcesProvider___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) currentSignedClinicalDataRecordIdentifier];
  int v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = *(void **)(a1 + 48);
    id v7 = [*(id *)(a1 + 56) subtitle];
    id v6 = [v5 attributedMeaningfulDateStringWithDateTitle:v7];
    [v4 setAttributedSubtitleText:v6];
  }
}

+ (void)medicalRecordCellWithTableView:(uint64_t)a1 displayItem:(NSObject *)a2 clinicalAccount:accountOwner:clinicalDataSourcesProvider:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1C21A1000, a2, OS_LOG_TYPE_FAULT, "%{public}@ has no ClinicalSourcesDataProvider", (uint8_t *)&v2, 0xCu);
}

void __135__WDMedicalRecordTableViewUtility_medicalRecordCellWithTableView_displayItem_clinicalAccount_accountOwner_clinicalDataSourcesProvider___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 56);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1C21A1000, log, OS_LOG_TYPE_ERROR, "%{public}@ failed to fetch SCD record with error: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end