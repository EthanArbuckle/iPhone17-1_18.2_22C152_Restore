@interface ConfusionPairBuilder
+ (void)generateConfusionPairsWithUUID:(id)a3 parameters:(id)a4 language:(id)a5 task:(id)a6 samplingRate:(unint64_t)a7 recognizedNbest:(id)a8 recognizedText:(id)a9 correctedText:(id)a10 selectedAlternatives:(id)a11 completion:(id)a12;
+ (void)initialize;
@end

@implementation ConfusionPairBuilder

+ (void)generateConfusionPairsWithUUID:(id)a3 parameters:(id)a4 language:(id)a5 task:(id)a6 samplingRate:(unint64_t)a7 recognizedNbest:(id)a8 recognizedText:(id)a9 correctedText:(id)a10 selectedAlternatives:(id)a11 completion:(id)a12
{
  id v16 = a3;
  id v17 = a4;
  id v105 = a5;
  id v104 = a6;
  id v107 = a8;
  id v106 = a9;
  id v102 = a10;
  v18 = v17;
  id v103 = a11;
  id v101 = a12;
  v19 = qword_100044450;
  if (os_log_type_enabled((os_log_t)qword_100044450, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v136 = v17;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Confusion Pair Builder: Start generating confusion pairs with parameters:%@", buf, 0xCu);
  }
  v21 = v104;
  v20 = v105;
  if ([v16 length])
  {
    if ([v105 length])
    {
      id v22 = [v104 length];
      if (a7)
      {
        if (v22 && [v107 count])
        {
          v23 = [v107 firstObject];
          if ([v23 count])
          {
            id v24 = [v106 length];

            if (v24)
            {
              v99 = v18;
              id v25 = objc_alloc_init((Class)NSMutableArray);
              id v26 = objc_alloc_init((Class)NSMutableSet);
              id v97 = v16;
              id v27 = v16;
              id v28 = v103;
              id v110 = v26;
              id v114 = v25;
              long long v128 = 0u;
              long long v129 = 0u;
              long long v130 = 0u;
              long long v131 = 0u;
              id v115 = [v28 countByEnumeratingWithState:&v128 objects:buf count:16];
              id v109 = v27;
              if (v115)
              {
                uint64_t v29 = *(void *)v129;
                id v108 = v28;
                uint64_t v111 = *(void *)v129;
                do
                {
                  for (i = 0; i != v115; i = (char *)i + 1)
                  {
                    if (*(void *)v129 != v29) {
                      objc_enumerationMutation(v28);
                    }
                    v31 = *(void **)(*((void *)&v128 + 1) + 8 * i);
                    v32 = objc_msgSend(v31, "objectForKeyedSubscript:", @"replacementText", v97);
                    v33 = [v32 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];

                    v34 = [v31 objectForKeyedSubscript:@"originalText"];
                    v35 = [v34 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];

                    if ([v33 length] && objc_msgSend(v35, "length"))
                    {
                      v36 = [[ConfusionPairAligner alloc] initWithUttId:v27 recognizedText:v35 correctedText:v33 errorType:1 editMethod:1];
                      v37 = v36;
                      v38 = v114;
                      if (v36)
                      {
                        v39 = [(ConfusionPairAligner *)v36 confusionPairs];
                        [v110 addObjectsFromArray:v39];
                        long long v126 = 0u;
                        long long v127 = 0u;
                        long long v124 = 0u;
                        long long v125 = 0u;
                        id v40 = v39;
                        id v41 = [v40 countByEnumeratingWithState:&v124 objects:v134 count:16];
                        if (v41)
                        {
                          id v42 = v41;
                          uint64_t v43 = *(void *)v125;
                          do
                          {
                            for (j = 0; j != v42; j = (char *)j + 1)
                            {
                              if (*(void *)v125 != v43) {
                                objc_enumerationMutation(v40);
                              }
                              v45 = *(void **)(*((void *)&v124 + 1) + 8 * (void)j);
                              [v45 numInsertion];
                              [v45 numDeletion];
                              [v45 numSubstitution];
                            }
                            id v42 = [v40 countByEnumeratingWithState:&v124 objects:v134 count:16];
                          }
                          while (v42);
                        }

                        v38 = v114;
                        id v28 = v108;
                        id v27 = v109;
                      }
                      v46 = [[ConfusionPair alloc] initWithUttId:v27];
                      [(ConfusionPair *)v46 addRecognizedToken:v35 correctedToken:v33];
                      [(ConfusionPair *)v46 setEditMethod:1];
                      [(ConfusionPair *)v46 setErrorType:1];
                      [v38 addObject:v46];

                      uint64_t v29 = v111;
                    }
                  }
                  id v115 = [v28 countByEnumeratingWithState:&v128 objects:buf count:16];
                }
                while (v115);
              }

              v47 = (void *)qword_100044450;
              if (os_log_type_enabled((os_log_t)qword_100044450, OS_LOG_TYPE_INFO))
              {
                v48 = v47;
                id v49 = [v114 count];
                id v50 = [v110 count];
                *(_DWORD *)buf = 134218240;
                id v136 = v49;
                __int16 v137 = 2048;
                id v138 = v50;
                _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "Confusion Pair Builder: Populated confusion pairs for alternative selection, count: %lu, unique count: %lu", buf, 0x16u);
              }
              id v51 = objc_msgSend(v102, "length", v97);
              id v16 = v98;
              v18 = v99;
              v21 = v104;
              v20 = v105;
              if (!v51)
              {
                v58 = qword_100044450;
                if (os_log_type_enabled((os_log_t)qword_100044450, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "Confusion Pair Builder: Corrected text is empty", buf, 2u);
                }
                v59 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:356 userInfo:0];
                v57 = v101;
                v56 = v114;
                (*((void (**)(id, id, void *))v101 + 2))(v101, v114, v59);
                v53 = v102;
                v52 = v106;
                goto LABEL_63;
              }
              v52 = [v106 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];

              v53 = [v102 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];

              if ([v52 isEqualToString:v53])
              {
                v54 = qword_100044450;
                if (os_log_type_enabled((os_log_t)qword_100044450, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "Confusion Pair Builder: Skipping confusion pair building as corrected text is the same as recognized text", buf, 2u);
                }
                uint64_t v55 = 356;
LABEL_62:
                v59 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:v55 userInfo:0];
                v57 = v101;
                v56 = v114;
                (*((void (**)(id, id, void *))v101 + 2))(v101, v114, v59);
LABEL_63:

                goto LABEL_38;
              }
              if ([v99 skipClassification])
              {
                v60 = qword_100044450;
                if (os_log_type_enabled((os_log_t)qword_100044450, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "Confusion Pair Builder: Skipping classification", buf, 2u);
                }
                v61 = [[ConfusionPairAligner alloc] initWithUttId:v109 recognizedText:v52 correctedText:v53 errorType:0 editMethod:0];
                v59 = v61;
                if (v61)
                {
                  v62 = [(ConfusionPairAligner *)v61 confusionPairs];
                  id v63 = [v62 count];

                  if (v63)
                  {
                    long long v122 = 0u;
                    long long v123 = 0u;
                    long long v120 = 0u;
                    long long v121 = 0u;
                    v112 = v59;
                    v64 = [v59 confusionPairs];
                    id v65 = [v64 countByEnumeratingWithState:&v120 objects:v133 count:16];
                    if (v65)
                    {
                      id v66 = v65;
                      uint64_t v67 = *(void *)v121;
                      do
                      {
                        for (k = 0; k != v66; k = (char *)k + 1)
                        {
                          if (*(void *)v121 != v67) {
                            objc_enumerationMutation(v64);
                          }
                          uint64_t v69 = *(void *)(*((void *)&v120 + 1) + 8 * (void)k);
                          if (([v110 containsObject:v69] & 1) == 0) {
                            [v114 addObject:v69];
                          }
                        }
                        id v66 = [v64 countByEnumeratingWithState:&v120 objects:v133 count:16];
                      }
                      while (v66);
                    }

                    v21 = v104;
                    v20 = v105;
                    v59 = v112;
                  }
                }
                v57 = v101;
                v56 = v114;
                (*((void (**)(id, id, void))v101 + 2))(v101, v114, 0);
                goto LABEL_63;
              }
              v70 = [v107 firstObject];
              id v71 = [v70 count];
              id v72 = [v99 uttLengthThreshold];

              if (v71 > v72)
              {
                v73 = (void *)qword_100044450;
                if (os_log_type_enabled((os_log_t)qword_100044450, OS_LOG_TYPE_INFO))
                {
                  v74 = v73;
                  v75 = [v107 firstObject];
                  id v76 = [v75 count];
                  *(_DWORD *)buf = 134217984;
                  id v136 = v76;
                  _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_INFO, "Confusion Pair Builder: Filtered by utterance length: %lu", buf, 0xCu);
                }
                uint64_t v55 = 358;
                goto LABEL_62;
              }
              id v77 = objc_alloc_init((Class)_EAREditDistance);
              v59 = v77;
              v57 = v101;
              if (v77)
              {
                id v113 = v77;
                v78 = [v77 editDistanceWithRefText:v53 hypText:v52 caseInsensitive:1 removeWordSense:1];
                v79 = [(EditClassifier *)v78 objectForKeyedSubscript:@"EditDistance"];
                v80 = v79;
                if (v79)
                {
                  int v81 = [v79 intValue];
                  v82 = (void *)v81;
                  if (v81 < 1)
                  {
                    if (!v81)
                    {
                      v95 = qword_100044450;
                      if (os_log_type_enabled((os_log_t)qword_100044450, OS_LOG_TYPE_INFO))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_INFO, "Confusion Pair Builder: Skipping confusion pair building as corrected text is the same as recognized text", buf, 2u);
                      }
                      uint64_t v84 = 356;
                      goto LABEL_96;
                    }
                  }
                  else if ((unint64_t)[v99 distanceThreshold] < v81)
                  {
                    v83 = qword_100044450;
                    if (os_log_type_enabled((os_log_t)qword_100044450, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 134217984;
                      id v136 = v82;
                      _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_INFO, "Confusion Pair Builder: Filtered by edit distance threshold: %lu", buf, 0xCu);
                    }
                    uint64_t v84 = 357;
LABEL_96:
                    v96 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:v84 userInfo:0];
                    (*((void (**)(id, id, void *))v101 + 2))(v101, v114, v96);

                    v57 = v101;
                    goto LABEL_97;
                  }
                }

                v21 = v104;
                v20 = v105;
                v59 = v113;
              }
              v78 = [[EditClassifier alloc] initWithLanguage:v20 task:v21 samplingRate:a7];
              v85 = qword_100044450;
              if (os_log_type_enabled((os_log_t)qword_100044450, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_INFO, "Confusion Pair Builder: Start edit classification", buf, 2u);
              }
              if (!v78)
              {
                v88 = qword_100044450;
                if (os_log_type_enabled((os_log_t)qword_100044450, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_INFO, "Confusion Pair Builder: Failed to initialize classifier", buf, 2u);
                }
                v80 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:352 userInfo:0];
                (*((void (**)(id, void, void *))v101 + 2))(v101, 0, v80);
                goto LABEL_98;
              }
              uint64_t v86 = [(EditClassifier *)v78 classifyWithUUID:v109 parameters:v99 nbestTokens:v107 recognizedText:v52 correctedText:v53];
              if (v86)
              {
                v80 = (void *)v86;
                v87 = qword_100044450;
                if (os_log_type_enabled((os_log_t)qword_100044450, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_INFO, "Confusion Pair Builder: Failed to classify user edit", buf, 2u);
                }
                v57 = v101;
                (*((void (**)(id, id, void *))v101 + 2))(v101, v114, v80);
                goto LABEL_98;
              }
              id v113 = v59;
              v89 = [(EditClassifier *)v78 confusionPairs];
              long long v116 = 0u;
              long long v117 = 0u;
              long long v118 = 0u;
              long long v119 = 0u;
              id v90 = [v89 countByEnumeratingWithState:&v116 objects:v132 count:16];
              if (v90)
              {
                id v91 = v90;
                uint64_t v92 = *(void *)v117;
                do
                {
                  for (m = 0; m != v91; m = (char *)m + 1)
                  {
                    if (*(void *)v117 != v92) {
                      objc_enumerationMutation(v89);
                    }
                    v94 = *(void **)(*((void *)&v116 + 1) + 8 * (void)m);
                    if (([v110 containsObject:v94] & 1) == 0)
                    {
                      objc_msgSend(v94, "setEditMethod:", 2 * (objc_msgSend(v94, "errorType") == (id)1));
                      [v114 addObject:v94];
                    }
                  }
                  id v91 = [v89 countByEnumeratingWithState:&v116 objects:v132 count:16];
                }
                while (v91);
              }
              v57 = v101;
              (*((void (**)(id, id, void))v101 + 2))(v101, v114, 0);

              v80 = 0;
              v18 = v99;
LABEL_97:
              v59 = v113;
LABEL_98:

              v21 = v104;
              v20 = v105;
              v56 = v114;
              goto LABEL_63;
            }
          }
          else
          {
          }
        }
      }
    }
  }
  v56 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:351 userInfo:0];
  v57 = v101;
  (*((void (**)(id, void, void *))v101 + 2))(v101, 0, v56);
  v53 = v102;
  v52 = v106;
LABEL_38:
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    qword_100044450 = (uint64_t)os_log_create("com.apple.speech.speechmodeltraining", "useredit");
    _objc_release_x1();
  }
}

@end