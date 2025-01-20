@interface ATXFeedback
@end

@implementation ATXFeedback

void __51___ATXFeedback_initWithDataStore_histogramManager___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained removeFeedbackForBundles:v3];
}

void __30___ATXFeedback_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_26;
  sharedInstance__pasExprOnceResult_26 = v1;
}

void __49___ATXFeedback_loadHistogramsInMemoryIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 48);
  v4 = a2;
  uint64_t v5 = [v3 categoricalHistogramForLaunchType:45];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:46];
  v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:47];
  v10 = (void *)v4[3];
  v4[3] = v9;

  uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:48];
  v12 = (void *)v4[4];
  v4[4] = v11;

  uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:53];
  v14 = (void *)v4[5];
  v4[5] = v13;

  uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:54];
  v16 = (void *)v4[6];
  v4[6] = v15;

  uint64_t v17 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:55];
  v18 = (void *)v4[7];
  v4[7] = v17;

  uint64_t v19 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:56];
  v20 = (void *)v4[8];
  v4[8] = v19;

  uint64_t v21 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:57];
  v22 = (void *)v4[9];
  v4[9] = v21;

  uint64_t v23 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:58];
  v24 = (void *)v4[10];
  v4[10] = v23;

  uint64_t v25 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:59];
  v26 = (void *)v4[11];
  v4[11] = v25;

  uint64_t v27 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:60];
  v28 = (void *)v4[12];
  v4[12] = v27;

  uint64_t v29 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:87];
  v30 = (void *)v4[13];
  v4[13] = v29;

  uint64_t v31 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:63];
  v32 = (void *)v4[14];
  v4[14] = v31;

  uint64_t v33 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:64];
  v34 = (void *)v4[15];
  v4[15] = v33;

  uint64_t v35 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:65];
  v36 = (void *)v4[16];
  v4[16] = v35;

  uint64_t v37 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:66];
  v38 = (void *)v4[17];
  v4[17] = v37;

  uint64_t v39 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:67];
  v40 = (void *)v4[18];
  v4[18] = v39;

  uint64_t v41 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:68];
  v42 = (void *)v4[19];
  v4[19] = v41;

  uint64_t v43 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:69];
  v44 = (void *)v4[20];
  v4[20] = v43;

  uint64_t v45 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:70];
  v46 = (void *)v4[21];
  v4[21] = v45;

  uint64_t v47 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:71];
  v48 = (void *)v4[22];
  v4[22] = v47;

  uint64_t v49 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:72];
  v50 = (void *)v4[23];
  v4[23] = v49;

  uint64_t v51 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:73];
  v52 = (void *)v4[24];
  v4[24] = v51;

  uint64_t v53 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:74];
  v54 = (void *)v4[25];
  v4[25] = v53;

  uint64_t v55 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:88];
  v56 = (void *)v4[26];
  v4[26] = v55;

  uint64_t v57 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:75];
  v58 = (void *)v4[27];
  v4[27] = v57;

  uint64_t v59 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:76];
  v60 = (void *)v4[28];
  v4[28] = v59;

  uint64_t v61 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:77];
  v62 = (void *)v4[29];
  v4[29] = v61;

  uint64_t v63 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:78];
  v64 = (void *)v4[30];
  v4[30] = v63;

  uint64_t v65 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:79];
  v66 = (void *)v4[31];
  v4[31] = v65;

  uint64_t v67 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:80];
  v68 = (void *)v4[32];
  v4[32] = v67;

  uint64_t v69 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:81];
  v70 = (void *)v4[33];
  v4[33] = v69;

  uint64_t v71 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:82];
  v72 = (void *)v4[34];
  v4[34] = v71;

  uint64_t v73 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:83];
  v74 = (void *)v4[35];
  v4[35] = v73;

  uint64_t v75 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:84];
  v76 = (void *)v4[36];
  v4[36] = v75;

  uint64_t v77 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:85];
  v78 = (void *)v4[37];
  v4[37] = v77;

  uint64_t v79 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:86];
  v80 = (void *)v4[38];
  v4[38] = v79;

  uint64_t v81 = [*(id *)(*(void *)(a1 + 32) + 48) categoricalHistogramForLaunchType:89];
  id v82 = (id)v4[39];
  v4[39] = v81;
}

void __38___ATXFeedback_unloadCachedHistograms__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v43 = a2;
  id v3 = (void *)MEMORY[0x1D25F6CC0]();
  v4 = (void *)v43[1];
  v43[1] = 0;

  uint64_t v5 = (void *)v43[2];
  v43[2] = 0;

  v6 = (void *)v43[3];
  v43[3] = 0;

  uint64_t v7 = (void *)v43[4];
  v43[4] = 0;

  v8 = (void *)v43[5];
  v43[5] = 0;

  uint64_t v9 = (void *)v43[6];
  v43[6] = 0;

  v10 = (void *)v43[7];
  v43[7] = 0;

  uint64_t v11 = (void *)v43[8];
  v43[8] = 0;

  v12 = (void *)v43[9];
  v43[9] = 0;

  uint64_t v13 = (void *)v43[10];
  v43[10] = 0;

  v14 = (void *)v43[11];
  v43[11] = 0;

  uint64_t v15 = (void *)v43[12];
  v43[12] = 0;

  v16 = (void *)v43[13];
  v43[13] = 0;

  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:45];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:46];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:47];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:48];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:53];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:54];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:55];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:56];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:57];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:58];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:59];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:60];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:87];
  uint64_t v17 = (void *)v43[14];
  v43[14] = 0;

  v18 = (void *)v43[15];
  v43[15] = 0;

  uint64_t v19 = (void *)v43[16];
  v43[16] = 0;

  v20 = (void *)v43[17];
  v43[17] = 0;

  uint64_t v21 = (void *)v43[18];
  v43[18] = 0;

  v22 = (void *)v43[19];
  v43[19] = 0;

  uint64_t v23 = (void *)v43[20];
  v43[20] = 0;

  v24 = (void *)v43[21];
  v43[21] = 0;

  uint64_t v25 = (void *)v43[22];
  v43[22] = 0;

  v26 = (void *)v43[23];
  v43[23] = 0;

  uint64_t v27 = (void *)v43[24];
  v43[24] = 0;

  v28 = (void *)v43[25];
  v43[25] = 0;

  uint64_t v29 = (void *)v43[26];
  v43[26] = 0;

  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:63];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:64];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:65];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:66];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:67];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:68];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:69];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:70];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:71];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:72];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:73];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:74];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:88];
  v30 = (void *)v43[27];
  v43[27] = 0;

  uint64_t v31 = (void *)v43[28];
  v43[28] = 0;

  v32 = (void *)v43[29];
  v43[29] = 0;

  uint64_t v33 = (void *)v43[30];
  v43[30] = 0;

  v34 = (void *)v43[31];
  v43[31] = 0;

  uint64_t v35 = (void *)v43[32];
  v43[32] = 0;

  v36 = (void *)v43[33];
  v43[33] = 0;

  uint64_t v37 = (void *)v43[34];
  v43[34] = 0;

  v38 = (void *)v43[35];
  v43[35] = 0;

  uint64_t v39 = (void *)v43[36];
  v43[36] = 0;

  v40 = (void *)v43[37];
  v43[37] = 0;

  uint64_t v41 = (void *)v43[38];
  v43[38] = 0;

  v42 = (void *)v43[39];
  v43[39] = 0;

  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:75];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:76];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:77];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:78];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:79];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:80];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:81];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:82];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:83];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:84];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:85];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:86];
  [*(id *)(*(void *)(a1 + 32) + 48) purgeHistogramForLaunchType:89];
}

void __30___ATXFeedback_doDecayAtTime___block_invoke(uint64_t a1, double *a2)
{
  double v4 = *(double *)(a1 + 40);
  double v5 = v4 - *a2;
  if (*a2 > 0.0 && v5 > 30.0)
  {
    +[_ATXFeedbackConstants decayHalfLifeSeconds];
    *(long double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = exp2(-v5 / v7);
    double v4 = *(double *)(a1 + 40);
  }
  *a2 = v4;
  double v8 = a2[2];
  a2[1] = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) * a2[1];
  a2[2] = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) * v8;
}

double __30___ATXFeedback_doDecayAtTime___block_invoke_2(uint64_t a1, uint64_t a2, double *a3)
{
  double v3 = a3[1];
  *a3 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) * *a3;
  double result = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) * v3;
  a3[1] = result;
  return result;
}

void __97___ATXFeedback_feedbackLaunchedWithConsumerType_forBundleId_rejected_explicitlyRejected_context___block_invoke(uint64_t a1, void *a2, double *a3)
{
  id v11 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:"))
  {
    if ([(id)objc_opt_class() isWidgetOrSpotlight:*(void *)(a1 + 88)])
    {
      *a3 = *a3 + 1.0;
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    v6 = WeakRetained;
    uint64_t v7 = *(void *)(a1 + 88);
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = v11;
    uint64_t v10 = 0;
  }
  else if ([*(id *)(a1 + 56) containsObject:v11])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    v6 = WeakRetained;
    uint64_t v7 = *(void *)(a1 + 88);
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = v11;
    uint64_t v10 = 2;
  }
  else
  {
    if ([(id)objc_opt_class() isWidgetOrSpotlight:*(void *)(a1 + 88)])
    {
      a3[1] = a3[1] + 1.0;
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    v6 = WeakRetained;
    uint64_t v7 = *(void *)(a1 + 88);
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = v11;
    uint64_t v10 = 1;
  }
  [WeakRetained populateFeedbackForConsumerType:v7 forBundleId:v9 withContext:v8 forFeedbackCategory:v10];
}

double __97___ATXFeedback_feedbackLaunchedWithConsumerType_forBundleId_rejected_explicitlyRejected_context___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)(a2 + 16);
  *(double *)(a2 + 8) = *(double *)(a2 + 8) + (double)*(int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  double result = v2 + (double)*(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  *(double *)(a2 + 16) = result;
  return result;
}

void __92___ATXFeedback_populateFeedbackForConsumerType_forBundleId_withContext_forFeedbackCategory___block_invoke(uint64_t a1, void *a2)
{
  double v3 = a2;
  double v4 = v3;
  uint64_t v5 = *(void *)(a1 + 96);
  if ((unint64_t)(v5 - 1) < 2)
  {
    uint64_t v7 = (void *)(a1 + 104);
    uint64_t v29 = *(void *)(a1 + 104);
    if (v29 != 2)
    {
      if (v29 == 1)
      {
        uint64_t v71 = (void *)v3[3];
        uint64_t v72 = *(void *)(a1 + 32);
        uint64_t v73 = [*(id *)(a1 + 40) timeContext];
        v74 = [v73 date];
        [v71 addLaunchWithBundleId:v72 date:v74 category:*(void *)(a1 + 48)];

        uint64_t v75 = (void *)v4[4];
        uint64_t v76 = *(void *)(a1 + 32);
        uint64_t v77 = [*(id *)(a1 + 40) timeContext];
        v78 = [v77 date];
        [v75 addLaunchWithBundleId:v76 date:v78 category:*(void *)(a1 + 56)];

        uint64_t v79 = (void *)v4[6];
        uint64_t v80 = *(void *)(a1 + 32);
        uint64_t v81 = [*(id *)(a1 + 40) timeContext];
        id v82 = [v81 date];
        [v79 addLaunchWithBundleId:v80 date:v82 category:*(void *)(a1 + 64)];

        v83 = (void *)v4[8];
        uint64_t v84 = *(void *)(a1 + 32);
        v85 = [*(id *)(a1 + 40) timeContext];
        v86 = [v85 date];
        [v83 addLaunchWithBundleId:v84 date:v86 category:*(void *)(a1 + 72)];

        v87 = (void *)v4[10];
        uint64_t v88 = *(void *)(a1 + 32);
        v89 = [*(id *)(a1 + 40) timeContext];
        v90 = [v89 date];
        [v87 addLaunchWithBundleId:v88 date:v90 category:*(void *)(a1 + 80)];

        v28 = (void *)v4[12];
        goto LABEL_27;
      }
      if (!v29)
      {
        v30 = (void *)v3[1];
        uint64_t v31 = *(void *)(a1 + 32);
        v32 = [*(id *)(a1 + 40) timeContext];
        uint64_t v33 = [v32 date];
        [v30 addLaunchWithBundleId:v31 date:v33 category:*(void *)(a1 + 48)];

        v34 = (void *)v4[2];
        uint64_t v35 = *(void *)(a1 + 32);
        v36 = [*(id *)(a1 + 40) timeContext];
        uint64_t v37 = [v36 date];
        [v34 addLaunchWithBundleId:v35 date:v37 category:*(void *)(a1 + 56)];

        v38 = (void *)v4[5];
        uint64_t v39 = *(void *)(a1 + 32);
        v40 = [*(id *)(a1 + 40) timeContext];
        uint64_t v41 = [v40 date];
        [v38 addLaunchWithBundleId:v39 date:v41 category:*(void *)(a1 + 64)];

        v42 = (void *)v4[7];
        uint64_t v43 = *(void *)(a1 + 32);
        v44 = [*(id *)(a1 + 40) timeContext];
        uint64_t v45 = [v44 date];
        [v42 addLaunchWithBundleId:v43 date:v45 category:*(void *)(a1 + 72)];

        v46 = (void *)v4[9];
        uint64_t v47 = *(void *)(a1 + 32);
        v48 = [*(id *)(a1 + 40) timeContext];
        uint64_t v49 = [v48 date];
        [v46 addLaunchWithBundleId:v47 date:v49 category:*(void *)(a1 + 80)];

        v28 = (void *)v4[11];
        goto LABEL_27;
      }
      v91 = __atxlog_handle_default();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR)) {
        goto LABEL_30;
      }
      goto LABEL_31;
    }
    v28 = (void *)v3[13];
    goto LABEL_25;
  }
  if (v5 == 15)
  {
    uint64_t v7 = (void *)(a1 + 104);
    uint64_t v50 = *(void *)(a1 + 104);
    if (v50 != 2)
    {
      if (v50 == 1)
      {
        v122 = (void *)v3[33];
        uint64_t v123 = *(void *)(a1 + 32);
        v124 = [*(id *)(a1 + 40) timeContext];
        v125 = [v124 date];
        [v122 addLaunchWithBundleId:v123 date:v125 category:*(void *)(a1 + 48)];

        v126 = (void *)v4[34];
        uint64_t v127 = *(void *)(a1 + 32);
        v128 = [*(id *)(a1 + 40) timeContext];
        v129 = [v128 date];
        [v126 addLaunchWithBundleId:v127 date:v129 category:*(void *)(a1 + 56)];

        v130 = (void *)v4[35];
        uint64_t v131 = *(void *)(a1 + 32);
        v132 = [*(id *)(a1 + 40) timeContext];
        v133 = [v132 date];
        [v130 addLaunchWithBundleId:v131 date:v133 category:*(void *)(a1 + 64)];

        v134 = (void *)v4[36];
        uint64_t v135 = *(void *)(a1 + 32);
        v136 = [*(id *)(a1 + 40) timeContext];
        v137 = [v136 date];
        [v134 addLaunchWithBundleId:v135 date:v137 category:*(void *)(a1 + 72)];

        v138 = (void *)v4[37];
        uint64_t v139 = *(void *)(a1 + 32);
        v140 = [*(id *)(a1 + 40) timeContext];
        v141 = [v140 date];
        [v138 addLaunchWithBundleId:v139 date:v141 category:*(void *)(a1 + 80)];

        v28 = (void *)v4[38];
        goto LABEL_27;
      }
      if (!v50)
      {
        uint64_t v51 = (void *)v3[27];
        uint64_t v52 = *(void *)(a1 + 32);
        uint64_t v53 = [*(id *)(a1 + 40) timeContext];
        v54 = [v53 date];
        [v51 addLaunchWithBundleId:v52 date:v54 category:*(void *)(a1 + 48)];

        uint64_t v55 = (void *)v4[28];
        uint64_t v56 = *(void *)(a1 + 32);
        uint64_t v57 = [*(id *)(a1 + 40) timeContext];
        v58 = [v57 date];
        [v55 addLaunchWithBundleId:v56 date:v58 category:*(void *)(a1 + 56)];

        uint64_t v59 = (void *)v4[29];
        uint64_t v60 = *(void *)(a1 + 32);
        uint64_t v61 = [*(id *)(a1 + 40) timeContext];
        v62 = [v61 date];
        [v59 addLaunchWithBundleId:v60 date:v62 category:*(void *)(a1 + 64)];

        uint64_t v63 = (void *)v4[30];
        uint64_t v64 = *(void *)(a1 + 32);
        uint64_t v65 = [*(id *)(a1 + 40) timeContext];
        v66 = [v65 date];
        [v63 addLaunchWithBundleId:v64 date:v66 category:*(void *)(a1 + 72)];

        uint64_t v67 = (void *)v4[31];
        uint64_t v68 = *(void *)(a1 + 32);
        uint64_t v69 = [*(id *)(a1 + 40) timeContext];
        v70 = [v69 date];
        [v67 addLaunchWithBundleId:v68 date:v70 category:*(void *)(a1 + 80)];

        v28 = (void *)v4[32];
        goto LABEL_27;
      }
      v91 = __atxlog_handle_default();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR)) {
LABEL_30:
      }
        __92___ATXFeedback_populateFeedbackForConsumerType_forBundleId_withContext_forFeedbackCategory___block_invoke_cold_1((uint64_t)v7, v91, v92, v93, v94, v95, v96, v97);
LABEL_31:

      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"populateFeedbackForConsumerType called with invalid _ATXFeedbackCategory value of %lu", *v7);
      goto LABEL_32;
    }
    v28 = (void *)v3[39];
LABEL_25:
    uint64_t v118 = *(void *)(a1 + 32);
    v119 = [*(id *)(a1 + 40) timeContext];
    v120 = [v119 date];
    uint64_t v121 = *(void *)(a1 + 48);
LABEL_28:
    [v28 addLaunchWithBundleId:v118 date:v120 category:v121];

    goto LABEL_32;
  }
  if (v5 == 14)
  {
    uint64_t v7 = (void *)(a1 + 104);
    uint64_t v6 = *(void *)(a1 + 104);
    if (v6 != 2)
    {
      if (v6 == 1)
      {
        v98 = (void *)v3[20];
        uint64_t v99 = *(void *)(a1 + 32);
        v100 = [*(id *)(a1 + 40) timeContext];
        v101 = [v100 date];
        [v98 addLaunchWithBundleId:v99 date:v101 category:*(void *)(a1 + 48)];

        v102 = (void *)v4[21];
        uint64_t v103 = *(void *)(a1 + 32);
        v104 = [*(id *)(a1 + 40) timeContext];
        v105 = [v104 date];
        [v102 addLaunchWithBundleId:v103 date:v105 category:*(void *)(a1 + 56)];

        v106 = (void *)v4[22];
        uint64_t v107 = *(void *)(a1 + 32);
        v108 = [*(id *)(a1 + 40) timeContext];
        v109 = [v108 date];
        [v106 addLaunchWithBundleId:v107 date:v109 category:*(void *)(a1 + 64)];

        v110 = (void *)v4[23];
        uint64_t v111 = *(void *)(a1 + 32);
        v112 = [*(id *)(a1 + 40) timeContext];
        v113 = [v112 date];
        [v110 addLaunchWithBundleId:v111 date:v113 category:*(void *)(a1 + 72)];

        v114 = (void *)v4[24];
        uint64_t v115 = *(void *)(a1 + 32);
        v116 = [*(id *)(a1 + 40) timeContext];
        v117 = [v116 date];
        [v114 addLaunchWithBundleId:v115 date:v117 category:*(void *)(a1 + 80)];

        v28 = (void *)v4[25];
        goto LABEL_27;
      }
      if (!v6)
      {
        uint64_t v8 = (void *)v3[14];
        uint64_t v9 = *(void *)(a1 + 32);
        uint64_t v10 = [*(id *)(a1 + 40) timeContext];
        id v11 = [v10 date];
        [v8 addLaunchWithBundleId:v9 date:v11 category:*(void *)(a1 + 48)];

        v12 = (void *)v4[15];
        uint64_t v13 = *(void *)(a1 + 32);
        v14 = [*(id *)(a1 + 40) timeContext];
        uint64_t v15 = [v14 date];
        [v12 addLaunchWithBundleId:v13 date:v15 category:*(void *)(a1 + 56)];

        v16 = (void *)v4[16];
        uint64_t v17 = *(void *)(a1 + 32);
        v18 = [*(id *)(a1 + 40) timeContext];
        uint64_t v19 = [v18 date];
        [v16 addLaunchWithBundleId:v17 date:v19 category:*(void *)(a1 + 64)];

        v20 = (void *)v4[17];
        uint64_t v21 = *(void *)(a1 + 32);
        v22 = [*(id *)(a1 + 40) timeContext];
        uint64_t v23 = [v22 date];
        [v20 addLaunchWithBundleId:v21 date:v23 category:*(void *)(a1 + 72)];

        v24 = (void *)v4[18];
        uint64_t v25 = *(void *)(a1 + 32);
        v26 = [*(id *)(a1 + 40) timeContext];
        uint64_t v27 = [v26 date];
        [v24 addLaunchWithBundleId:v25 date:v27 category:*(void *)(a1 + 80)];

        v28 = (void *)v4[19];
LABEL_27:
        uint64_t v118 = *(void *)(a1 + 32);
        v119 = [*(id *)(a1 + 40) timeContext];
        v120 = [v119 date];
        uint64_t v121 = *(void *)(a1 + 88);
        goto LABEL_28;
      }
      v91 = __atxlog_handle_default();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR)) {
        goto LABEL_30;
      }
      goto LABEL_31;
    }
    v28 = (void *)v3[26];
    goto LABEL_25;
  }
LABEL_32:
}

double __69___ATXFeedback_putFeedbackScoresForApps_intoScores_confirms_rejects___block_invoke(uint64_t a1, uint64_t a2)
{
  *(double *)(*(void *)(a1 + 32) + 24) = *(double *)(a1 + 40)
                                           * ((*(double *)(a1 + 48) + *(double *)(a2 + 8))
                                            / (*(double *)(a1 + 40) + *(double *)(a2 + 8) + *(double *)(a2 + 16)));
  uint64_t v2 = *(void *)(a1 + 32);
  double result = *(double *)(a1 + 40) - *(double *)(v2 + 24);
  *(double *)(v2 + 32) = result;
  return result;
}

void __69___ATXFeedback_putFeedbackScoresForApps_intoScores_confirms_rejects___block_invoke_2(void *a1, void *a2, double *a3)
{
  id v5 = a2;
  +[_ATXFeedbackConstants alphaForBundleId:v5];
  double v7 = v6;
  +[_ATXFeedbackConstants betaForBundleId:v5];
  double v9 = v8;

  double v10 = _ATXFeedbackComputeBetaMean(v7 + *(double *)(a1[4] + 24), v9 + *(double *)(a1[4] + 32));
  double v11 = _ATXFeedbackComputeBetaMean(v7 + *a3 + *(double *)(a1[4] + 24), v9 + a3[1] + *(double *)(a1[4] + 32));
  if (a1[8])
  {
    uint64_t v12 = *(void *)(a1[5] + 8);
    uint64_t v13 = *(double **)(v12 + 24);
    *uint64_t v13 = v11 / v10;
    *(void *)(v12 + 24) = v13 + 1;
  }
  if (a1[9])
  {
    uint64_t v14 = *(void *)(a1[6] + 8);
    uint64_t v15 = *(void **)(v14 + 24);
    *uint64_t v15 = *(void *)a3;
    *(void *)(v14 + 24) = v15 + 1;
  }
  if (a1[10])
  {
    uint64_t v16 = *(void *)(a1[7] + 8);
    uint64_t v17 = *(void **)(v16 + 24);
    *uint64_t v17 = *((void *)a3 + 1);
    *(void *)(v16 + 24) = v17 + 1;
  }
}

void __92___ATXFeedback_populateFeedbackForConsumerType_forBundleId_withContext_forFeedbackCategory___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end