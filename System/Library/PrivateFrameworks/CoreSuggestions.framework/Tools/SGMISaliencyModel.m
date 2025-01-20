@interface SGMISaliencyModel
+ (id)description;
+ (id)inferenceIntrospectionOnFeatureVector:(id)a3;
+ (id)introspection;
@end

@implementation SGMISaliencyModel

+ (id)inferenceIntrospectionOnFeatureVector:(id)a3
{
  id v63 = a3;
  v61 = objc_opt_new();
  v62 = +[SGMISaliencyModel introspection];
  v60 = +[SGMISaliencyModelConfig defaultConfig];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  v3 = [v60 saliencyOverrideRules];
  id v4 = [v3 countByEnumeratingWithState:&v73 objects:v78 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v74;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v74 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        v8 = [v7 strictLowerBound];
        [v8 floatValue];
        float v10 = v9;

        v11 = [v7 strictUpperBound];
        [v11 floatValue];
        float v13 = v12;

        v14 = [v7 featureName];
        v15 = objc_msgSend(v63, "feature:", (int)objc_msgSend(v14, "intValue"));
        [v15 floatValue];
        float v17 = v16;

        if (v10 < v17 && v17 < v13)
        {
          id v23 = objc_alloc((Class)NSString);
          v24 = [v7 featureName];
          v25 = +[SGMIFeature prettyName:](SGMIFeature, "prettyName:", (int)[v24 intValue]);
          v26 = [v7 output];
          unsigned int v27 = [v26 BOOLValue];
          CFStringRef v28 = @"\x1B[31m Regular mail ✘ \x1B[0m";
          if (v27) {
            CFStringRef v28 = @"\x1B[32m Salient mail ✔ \x1B[0m";
          }
          id v22 = [v23 initWithFormat:@"Saliency override rule on %@ matched: %@", v25, v28];

          goto LABEL_17;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v73 objects:v78 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  v19 = [v62 objectForKeyedSubscript:@"introspection error"];

  if (v19)
  {
    id v20 = objc_alloc((Class)NSString);
    v21 = [v62 objectForKeyedSubscript:@"introspection error"];
    id v22 = [v20 initWithFormat:@"SGMISaliencyModel is not interpretable: %@", v21];
  }
  else
  {
    uint64_t v69 = 0;
    v70 = &v69;
    uint64_t v71 = 0x2020000000;
    int v72 = 0;
    v30 = [v62 allKeys];
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_10003B96C;
    v68[3] = &unk_10005ADA8;
    v68[4] = &v69;
    [v30 enumerateObjectsUsingBlock:v68];

    id v31 = objc_alloc((Class)NSString);
    id v32 = objc_msgSend(v31, "initWithFormat:", @"%*s | raw value | contribution |\n", *((unsigned int *)v70 + 6), "Feature name");
    [v61 appendString:v32];

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    v33 = [v62 keysSortedByValueUsingSelector:"compare:"];
    id v34 = [v33 countByEnumeratingWithState:&v64 objects:v77 count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v65;
      float v36 = 0.0;
      do
      {
        for (j = 0; j != v34; j = (char *)j + 1)
        {
          if (*(void *)v65 != v35) {
            objc_enumerationMutation(v33);
          }
          v38 = *(void **)(*((void *)&v64 + 1) + 8 * (void)j);
          v39 = objc_msgSend(v63, "feature:", (int)objc_msgSend(v38, "intValue"));
          [v39 floatValue];
          float v41 = v40;

          v42 = [v62 objectForKeyedSubscript:v38];
          [v42 floatValue];
          float v44 = v43;

          id v45 = objc_alloc((Class)NSString);
          uint64_t v46 = *((unsigned int *)v70 + 6);
          +[SGMIFeature prettyName:](SGMIFeature, "prettyName:", (int)[v38 intValue]);
          id v47 = objc_claimAutoreleasedReturnValue();
          float v48 = v41 * v44;
          id v49 = objc_msgSend(v45, "initWithFormat:", @"%*s | %+9.2f | %+12.2f |\n", v46, objc_msgSend(v47, "UTF8String"), v41, v48);
          [v61 appendString:v49];

          float v36 = v36 + v48;
        }
        id v34 = [v33 countByEnumeratingWithState:&v64 objects:v77 count:16];
      }
      while (v34);
    }
    else
    {
      float v36 = 0.0;
    }

    id v50 = objc_alloc((Class)NSString);
    id v51 = objc_msgSend(v50, "initWithFormat:", @"%*s |     -     | %+12.2f | \n\n", *((unsigned int *)v70 + 6), "SUM", v36);
    [v61 appendString:v51];

    v52 = [v60 threshold];
    [v52 floatValue];
    float v54 = v53;

    id v55 = objc_alloc((Class)NSString);
    float v56 = logf(v54 / (float)(1.0 - v54));
    CFStringRef v57 = @"\x1B[31m Regular mail ✘ \x1B[0m";
    float v58 = v56 * 0.5;
    if (v36 > v58) {
      CFStringRef v57 = @"\x1B[32m Salient mail ✔ \x1B[0m";
    }
    id v59 = [v55 initWithFormat:@"%@ (Threshold for saliency is %+0.2f)\n", v57, v58];
    [v61 appendString:v59];

    id v22 = v61;
    _Block_object_dispose(&v69, 8);
  }
LABEL_17:

  return v22;
}

+ (id)introspection
{
  v2 = +[SGMISaliencyModel defaultModel];
  if (v2)
  {
    v3 = +[SGMISaliencyModelConfig defaultConfig];
    id v4 = [v3 featureNames];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    uint64_t v5 = [v3 mean];
    id v6 = [v5 countByEnumeratingWithState:&v57 objects:v66 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v58;
      v8 = &off_100064F68;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v58 != v7) {
          objc_enumerationMutation(v5);
        }
        if (![*(id *)(*((void *)&v57 + 1) + 8 * v9) isEqualToNumber:&off_100064C80]) {
          break;
        }
        if (v6 == (id)++v9)
        {
          id v6 = [v5 countByEnumeratingWithState:&v57 objects:v66 count:16];
          if (v6) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      uint64_t v5 = [v3 std];
      id v10 = [v5 countByEnumeratingWithState:&v53 objects:v65 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v54;
        v8 = &off_100064F90;
LABEL_12:
        uint64_t v12 = 0;
        while (1)
        {
          if (*(void *)v54 != v11) {
            objc_enumerationMutation(v5);
          }
          if (![*(id *)(*((void *)&v53 + 1) + 8 * v12) isEqualToNumber:&off_100064C98]) {
            break;
          }
          if (v10 == (id)++v12)
          {
            id v10 = [v5 countByEnumeratingWithState:&v53 objects:v65 count:16];
            if (v10) {
              goto LABEL_12;
            }
            goto LABEL_18;
          }
        }
      }
      else
      {
LABEL_18:

        uint64_t v5 = objc_opt_new();
        if ([v4 count])
        {
          unint64_t v13 = 0;
          do
          {
            [v5 addObject:&off_100064C80];
            ++v13;
          }
          while (v13 < (unint64_t)[v4 count]);
        }
        uint64_t v47 = 0;
        float v48 = &v47;
        uint64_t v49 = 0x3032000000;
        id v50 = sub_1000397D4;
        id v51 = sub_1000397E4;
        id v52 = 0;
        id v52 = +[SGMISaliencyModel getSaliencyOutputOf:v2 forArray:v5];
        v14 = (void *)v48[5];
        if (v14)
        {
          [v14 salientScore];
          if (fabs(v15) <= 0.001 && ([(id)v48[5] regularScore], fabs(v16) <= 0.001))
          {
            float v17 = objc_opt_new();
            uint64_t v41 = 0;
            v42 = &v41;
            uint64_t v43 = 0x3032000000;
            float v44 = sub_1000397D4;
            id v45 = sub_1000397E4;
            id v46 = 0;
            v35[0] = _NSConcreteStackBlock;
            v35[1] = 3221225472;
            v35[2] = sub_10003BFBC;
            v35[3] = &unk_10005ADD0;
            id v18 = v5;
            id v36 = v18;
            v39 = &v47;
            id v19 = v2;
            id v37 = v19;
            float v40 = &v41;
            id v20 = v17;
            id v38 = v20;
            [v4 enumerateObjectsUsingBlock:v35];
            uint64_t v21 = v42[5];
            if (v21)
            {
              CFStringRef v63 = @"introspection error";
              uint64_t v64 = v21;
              v8 = +[NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
            }
            else
            {
              v33[0] = 0;
              v33[1] = v33;
              v33[2] = 0x3032000000;
              v33[3] = sub_1000397D4;
              v33[4] = sub_1000397E4;
              id v34 = 0;
              v26[0] = _NSConcreteStackBlock;
              v26[1] = 3221225472;
              v26[2] = sub_10003C184;
              v26[3] = &unk_10005ADF8;
              id v27 = v18;
              v30 = &v47;
              id v28 = v19;
              id v31 = &v41;
              id v22 = v20;
              id v29 = v22;
              id v32 = v33;
              [v4 enumerateObjectsUsingBlock:v26];
              uint64_t v23 = v42[5];
              if (v23)
              {
                CFStringRef v61 = @"introspection error";
                uint64_t v62 = v23;
                v24 = +[NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
              }
              else
              {
                v24 = (_UNKNOWN **)v22;
              }
              v8 = v24;

              _Block_object_dispose(v33, 8);
            }

            _Block_object_dispose(&v41, 8);
          }
          else
          {
            v8 = &off_100064FE0;
          }
        }
        else
        {
          v8 = &off_100064FB8;
        }
        _Block_object_dispose(&v47, 8);
      }
    }
  }
  else
  {
    v8 = &off_100064F40;
  }

  return v8;
}

+ (id)description
{
  id v93 = (id)objc_opt_new();
  uint64_t v115 = 0;
  v116 = &v115;
  uint64_t v117 = 0x2020000000;
  int v118 = 0;
  v87 = +[SGMISaliencyModelConfig defaultConfig];
  [v93 appendString:@"\n\x1B[1mVersions\x1B[0m\n"];
  id v2 = objc_alloc((Class)NSString);
  v3 = +[SGMISaliencyModelConfig groundTruthVersion];
  id v4 = [v2 initWithFormat:@"groundTruthVersion: %@\n", v3];
  [v93 appendString:v4];

  id v5 = objc_alloc((Class)NSString);
  id v6 = +[SGMISaliencyModelConfig inferenceVersion];
  id v7 = [v5 initWithFormat:@"inferenceVersion: %@\n", v6];
  [v93 appendString:v7];

  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  v8 = [v87 saliencyOverrideRules];
  id v9 = [v8 countByEnumeratingWithState:&v111 objects:v123 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v112;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v112 != v10) {
          objc_enumerationMutation(v8);
        }
        signed int v12 = *((_DWORD *)v116 + 6);
        unint64_t v13 = [*(id *)(*((void *)&v111 + 1) + 8 * i) featureName];
        v14 = +[SGMIFeature prettyName:](SGMIFeature, "prettyName:", (int)[v13 intValue]);
        signed int v15 = [v14 length];

        if (v12 <= v15) {
          signed int v16 = v15;
        }
        else {
          signed int v16 = v12;
        }
        *((_DWORD *)v116 + 6) = v16;
      }
      id v9 = [v8 countByEnumeratingWithState:&v111 objects:v123 count:16];
    }
    while (v9);
  }

  v88 = +[SGMISaliencyModel introspection];
  float v17 = [v88 objectForKeyedSubscript:@"introspection error"];
  BOOL v18 = v17 == 0;

  if (v18)
  {
    id v19 = [v88 allKeys];
    v110[0] = _NSConcreteStackBlock;
    v110[1] = 3221225472;
    v110[2] = sub_10003CD48;
    v110[3] = &unk_10005ADA8;
    v110[4] = &v115;
    [v19 enumerateObjectsUsingBlock:v110];
  }
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id v20 = [v87 groundTruthEstimatorRules];
  id v21 = [v20 countByEnumeratingWithState:&v106 objects:v122 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v107;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v107 != v22) {
          objc_enumerationMutation(v20);
        }
        signed int v24 = *((_DWORD *)v116 + 6);
        v25 = [*(id *)(*((void *)&v106 + 1) + 8 * (void)j) featureName];
        v26 = +[SGMIFeature prettyName:](SGMIFeature, "prettyName:", (int)[v25 intValue]);
        signed int v27 = [v26 length];

        if (v24 <= v27) {
          signed int v28 = v27;
        }
        else {
          signed int v28 = v24;
        }
        *((_DWORD *)v116 + 6) = v28;
      }
      id v21 = [v20 countByEnumeratingWithState:&v106 objects:v122 count:16];
    }
    while (v21);
  }

  [v93 appendString:@"\n\x1B[1mSGMI saliency override rules\x1B[0m\n"];
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id v29 = [v87 saliencyOverrideRules];
  id v30 = [v29 countByEnumeratingWithState:&v102 objects:v121 count:16];
  if (v30)
  {
    id obj = v29;
    uint64_t v91 = *(void *)v103;
    do
    {
      for (k = 0; k != v30; k = (char *)k + 1)
      {
        if (*(void *)v103 != v91) {
          objc_enumerationMutation(obj);
        }
        id v32 = *(void **)(*((void *)&v102 + 1) + 8 * (void)k);
        id v33 = objc_alloc((Class)NSString);
        uint64_t v34 = *((unsigned int *)v116 + 6);
        uint64_t v35 = [v32 featureName];
        +[SGMIFeature prettyName:](SGMIFeature, "prettyName:", (int)[v35 intValue]);
        id v36 = objc_claimAutoreleasedReturnValue();
        id v37 = [v36 UTF8String];
        id v38 = [v32 strictLowerBound];
        [v38 floatValue];
        float v40 = v39;
        uint64_t v41 = [v32 strictUpperBound];
        [v41 floatValue];
        float v43 = v42;
        float v44 = [v32 output];
        unsigned int v45 = [v44 BOOLValue];
        CFStringRef v46 = @"\x1B[31m ✘ \x1B[0m";
        if (v45) {
          CFStringRef v46 = @"\x1B[32m ✔ \x1B[0m";
        }
        id v47 = [v33 initWithFormat:@"%*s in % 5.2g - % 5.2g -> %@\n", v34, v37, v40, v43, v46];
        [v93 appendString:v47];
      }
      id v29 = obj;
      id v30 = [obj countByEnumeratingWithState:&v102 objects:v121 count:16];
    }
    while (v30);
  }

  [v93 appendString:@"\n\x1B[1mSGMI Model\x1B[0m\n"];
  float v48 = [v88 objectForKeyedSubscript:@"introspection error"];

  if (v48)
  {
    id v49 = objc_alloc((Class)NSString);
    id v50 = [v88 objectForKeyedSubscript:@"introspection error"];
    id v51 = [v49 initWithFormat:@"SGMISaliencyModel is not interpretable: %@", v50];
    [v93 appendString:v51];
  }
  else
  {
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id v50 = [v88 keysSortedByValueUsingSelector:"compare:"];
    id v52 = [v50 countByEnumeratingWithState:&v98 objects:v120 count:16];
    if (v52)
    {
      uint64_t v53 = *(void *)v99;
      do
      {
        for (m = 0; m != v52; m = (char *)m + 1)
        {
          if (*(void *)v99 != v53) {
            objc_enumerationMutation(v50);
          }
          long long v55 = *(void **)(*((void *)&v98 + 1) + 8 * (void)m);
          id v56 = objc_alloc((Class)NSString);
          uint64_t v57 = *((unsigned int *)v116 + 6);
          +[SGMIFeature prettyName:](SGMIFeature, "prettyName:", (int)[v55 intValue]);
          id v58 = objc_claimAutoreleasedReturnValue();
          id v59 = [v58 UTF8String];
          long long v60 = [v88 objectForKeyedSubscript:v55];
          [v60 floatValue];
          id v62 = objc_msgSend(v56, "initWithFormat:", @"%*s %+0.2f\n", v57, v59, v61);
          [v93 appendString:v62];
        }
        id v52 = [v50 countByEnumeratingWithState:&v98 objects:v120 count:16];
      }
      while (v52);
    }
  }

  [v93 appendString:@"\n\x1B[1mGround truth estimator rules\x1B[0m\n"];
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  CFStringRef v63 = [v87 groundTruthEstimatorRules];
  id v64 = [v63 countByEnumeratingWithState:&v94 objects:v119 count:16];
  if (v64)
  {
    id obja = v63;
    uint64_t v92 = *(void *)v95;
    do
    {
      for (n = 0; n != v64; n = (char *)n + 1)
      {
        if (*(void *)v95 != v92) {
          objc_enumerationMutation(obja);
        }
        long long v66 = *(void **)(*((void *)&v94 + 1) + 8 * (void)n);
        id v67 = objc_alloc((Class)NSString);
        uint64_t v68 = *((unsigned int *)v116 + 6);
        uint64_t v69 = [v66 featureName];
        +[SGMIFeature prettyName:](SGMIFeature, "prettyName:", (int)[v69 intValue]);
        id v70 = objc_claimAutoreleasedReturnValue();
        id v71 = [v70 UTF8String];
        int v72 = [v66 strictLowerBound];
        [v72 floatValue];
        float v74 = v73;
        long long v75 = [v66 strictUpperBound];
        [v75 floatValue];
        id v77 = objc_msgSend(v67, "initWithFormat:", @"%*s in % 5.2g - % 5.2g -> \x1B[32m ✔ \x1B[0m\n", v68, v71, v74, v76);
        [v93 appendString:v77];
      }
      CFStringRef v63 = obja;
      id v64 = [obja countByEnumeratingWithState:&v94 objects:v119 count:16];
    }
    while (v64);
  }

  [v93 appendString:@"\n\x1B[1mHigh/Extreme ratio for stats logging\x1B[0m\n"];
  id v78 = objc_alloc((Class)NSString);
  id v79 = [v87 minCountToConsiderATokenAsHighlyDiscriminant];
  [v87 ratioToConsiderATokenAsHighlyDiscriminant];
  id v81 = objc_msgSend(v78, "initWithFormat:", @"HighlyDiscriminant: at least %lu mails with a ratio of %.0f %%\n", v79, v80 * 100.0);
  [v93 appendString:v81];

  id v82 = objc_alloc((Class)NSString);
  id v83 = [v87 minCountToConsiderATokenAsExtremelyDiscriminant];
  [v87 ratioToConsiderATokenAsExtremelyDiscriminant];
  id v85 = objc_msgSend(v82, "initWithFormat:", @"ExtremelyDiscriminant: at least %lu mails with a ratio of %.0f %%\n", v83, v84 * 100.0);
  [v93 appendString:v85];

  _Block_object_dispose(&v115, 8);

  return v93;
}

@end