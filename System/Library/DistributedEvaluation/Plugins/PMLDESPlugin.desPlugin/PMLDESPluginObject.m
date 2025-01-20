@interface PMLDESPluginObject
+ (id)encryptUpdates:(id)a3 totalParameters:(unint64_t)a4 haruspexKeyBase64:(id)a5 encryptor:(id)a6 error:(id *)a7;
- (BOOL)shouldDownloadAttachmentWithURL:(id)a3 recipe:(id)a4 recordInfo:(id)a5;
- (PMLDESPluginObject)init;
- (PMLDESPluginObject)initWithSuggestionsClient:(id)a3 encryptor:(id)a4;
- (id)_getPFLIdentifierForLogging:(id)a3;
- (id)evaluateRecipe:(id)a3 matchingRecordSet:(id)a4 binaryResult:(id *)a5 error:(id *)a6;
@end

@implementation PMLDESPluginObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptor, 0);

  objc_storeStrong((id *)&self->_suggestionsClient, 0);
}

- (id)evaluateRecipe:(id)a3 matchingRecordSet:(id)a4 binaryResult:(id *)a5 error:(id *)a6
{
  SEL v81 = a2;
  id v86 = a3;
  id v8 = a4;
  uint64_t v131 = 0;
  v132 = &v131;
  uint64_t v133 = 0x3032000000;
  v134 = sub_56CC;
  v135 = sub_56DC;
  id v136 = 0;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x3032000000;
  v128 = sub_56CC;
  v129 = sub_56DC;
  id v130 = (id)objc_opt_new();
  uint64_t v119 = 0;
  v120 = &v119;
  uint64_t v121 = 0x3032000000;
  v122 = sub_56CC;
  v123 = sub_56DC;
  v82 = a5;
  v83 = v8;
  id v124 = (id)objc_opt_new();
  uint64_t v115 = 0;
  v116 = &v115;
  uint64_t v117 = 0x2020000000;
  uint64_t v118 = 0;
  uint64_t v111 = 0;
  v112 = &v111;
  uint64_t v113 = 0x2020000000;
  char v114 = 0;
  v9 = [v86 attachments];
  LODWORD(a5) = [v9 count] == 0;

  if (!a5)
  {
    v10 = [v86 recipeUserInfo];
    v84 = [v10 objectForKeyedSubscript:@"isEspressoTraining"];

    if (v84 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v84 BOOLValue])
    {
      v11 = sub_56E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_0, v11, OS_LOG_TYPE_DEBUG, "PMLDESPlugin running training with Espresso", buf, 2u);
      }

      dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
      id v13 = objc_alloc((Class)NSMutableDictionary);
      v14 = [v86 recipeUserInfo];
      id v15 = [v13 initWithDictionary:v14];

      v16 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v86 pluginShouldAddNoiseAndEncryptResult]);
      [v15 setObject:v16 forKeyedSubscript:@"PLUGIN_SHOULD_ADD_NOISE_AND_ENCRYPT_RESULT"];

      suggestionsClient = self->_suggestionsClient;
      v18 = [v86 attachments];
      v104[0] = _NSConcreteStackBlock;
      v104[1] = 3221225472;
      v104[2] = sub_5738;
      v104[3] = &unk_8218;
      v106 = &v111;
      v107 = &v115;
      v108 = &v119;
      v109 = &v125;
      v110 = &v131;
      v19 = v12;
      v105 = v19;
      [(SGSuggestionsServiceFidesProtocol *)suggestionsClient evaluateRecipe:v15 attachments:v18 completion:v104];

      dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v20 = v132[5];
      if (v20)
      {
        v21 = sub_56E4();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v80 = (void *)v132[5];
          *(_DWORD *)buf = 138412290;
          id v140 = v80;
          _os_log_error_impl(&dword_0, v21, OS_LOG_TYPE_ERROR, "PMLDESPlugin got error when calling evaluateRecipe: %@", buf, 0xCu);
        }

        if (a6) {
          *a6 = (id) v132[5];
        }
      }
      else
      {
        uint64_t v51 = v116[3];
        v52 = sub_56E4();
        BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG);
        if (v51)
        {
          if (v53)
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_0, v52, OS_LOG_TYPE_DEBUG, "PMLDESPlugin successfully sent payload to suggestd/PML.", buf, 2u);
          }
        }
        else if (v53)
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_0, v52, OS_LOG_TYPE_DEBUG, "PMLDESPlugin sent payload to suggestd/PML with no result or error.", buf, 2u);
        }
      }
      if (v20) {
        goto LABEL_46;
      }
      uint64_t v85 = v116[3];
      if (v85)
      {
LABEL_71:
        id v56 = [objc_alloc((Class)NSMutableData) initWithCapacity:4 * v85];
        long long v91 = 0u;
        long long v92 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        v57 = [(id)v120[5] allKeys];
        v58 = [v57 sortedArrayUsingSelector:"compare:"];

        id v59 = [v58 countByEnumeratingWithState:&v89 objects:v137 count:16];
        if (v59)
        {
          uint64_t v60 = *(void *)v90;
          do
          {
            for (i = 0; i != v59; i = (char *)i + 1)
            {
              if (*(void *)v90 != v60) {
                objc_enumerationMutation(v58);
              }
              uint64_t v62 = *(void *)(*((void *)&v89 + 1) + 8 * i);
              v63 = objc_msgSend((id)v120[5], "objectForKeyedSubscript:", v62, v81);
              v64 = +[NSNull null];
              unsigned int v65 = [v63 isEqual:v64];

              if (v65)
              {
                v66 = +[NSMutableData dataWithLength:4 * v116[3]];
                if (!v66)
                {
                  v67 = +[NSAssertionHandler currentHandler];
                  [v67 handleFailureInMethod:v81 object:self file:@"PMLDESPlugin.m" lineNumber:297 description:@"Failed to allocate data."];
                }
                [v56 appendData:v66];
              }
              else
              {
                v66 = [(id)v120[5] objectForKeyedSubscript:v62];
                [v56 appendData:v66];
              }
            }
            id v59 = [v58 countByEnumeratingWithState:&v89 objects:v137 count:16];
          }
          while (v59);
        }

        id v68 = v56;
        v69 = [v68 bytes];
        if ([v86 pluginShouldAddNoiseAndEncryptResult])
        {
          v70 = [v86 recipeUserInfo];
          v71 = [v70 objectForKeyedSubscript:@"iCloudAggServiceKey"];
          v72 = +[PMLDESPluginObject encryptUpdates:v68 totalParameters:v85 haruspexKeyBase64:v71 encryptor:self->_encryptor error:a6];

          if (!v72)
          {
            id v46 = 0;
LABEL_90:

            goto LABEL_47;
          }
          id v73 = v72;
          id *v82 = v73;
        }
        else
        {
          id *v82 = v68;
        }
        for (id j = objc_alloc_init((Class)NSMutableArray); v85; --v85)
        {
          LODWORD(v75) = *v69;
          v76 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v75, v81);
          [j addObject:v76];

          ++v69;
        }
        objc_msgSend((id)v126[5], "setObject:forKey:", j, @"$local_only.FoundInAppsModelUpdate", v81);
        v77 = [(id)v120[5] allKeys];
        v78 = [v77 firstObject];
        v79 = [(PMLDESPluginObject *)self _getPFLIdentifierForLogging:v78];

        [(id)v126[5] setObject:&stru_84B0 forKey:@"localPrivacyParameters"];
        id v46 = (id)v126[5];

        goto LABEL_90;
      }
      int v48 = 1;
    }
    else
    {
      long long v102 = 0u;
      long long v103 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      v22 = objc_msgSend(v86, "attachments", v81);
      id v23 = [v22 countByEnumeratingWithState:&v100 objects:v138 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v101;
        while (2)
        {
          for (k = 0; k != v23; k = (char *)k + 1)
          {
            if (*(void *)v101 != v24) {
              objc_enumerationMutation(v22);
            }
            v26 = *(void **)(*((void *)&v100 + 1) + 8 * (void)k);
            v27 = sub_56E4();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              v37 = [v26 absoluteString];
              *(_DWORD *)buf = 138412290;
              id v140 = v37;
              _os_log_debug_impl(&dword_0, v27, OS_LOG_TYPE_DEBUG, "PMLDESPlugin running attachment at %@.", buf, 0xCu);
            }
            v28 = +[NSData dataWithContentsOfURL:v26];
            if (![v28 length])
            {
              if (a6)
              {
                *a6 = +[NSError errorWithDomain:@"PMLDESPluginErrorDomain" code:2 userInfo:0];
              }

LABEL_45:
              goto LABEL_46;
            }
            dispatch_semaphore_t v29 = dispatch_semaphore_create(0);
            v30 = self->_suggestionsClient;
            v93[0] = _NSConcreteStackBlock;
            v93[1] = 3221225472;
            v93[2] = sub_5908;
            v93[3] = &unk_8218;
            v95 = &v111;
            v96 = &v115;
            v97 = &v119;
            v98 = &v125;
            v99 = &v131;
            v31 = v29;
            v94 = v31;
            [(SGSuggestionsServiceFidesProtocol *)v30 planReceivedFromServerWithPayload:v28 completion:v93];
            dispatch_semaphore_wait(v31, 0xFFFFFFFFFFFFFFFFLL);
            uint64_t v32 = v132[5];
            if (v32)
            {
              v33 = sub_56E4();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                v38 = (void *)v132[5];
                *(_DWORD *)buf = 138412290;
                id v140 = v38;
                _os_log_error_impl(&dword_0, v33, OS_LOG_TYPE_ERROR, "PMLDESPlugin got error when calling planReceivedFromServerWithPayload: %@", buf, 0xCu);
              }

              if (a6) {
                *a6 = (id) v132[5];
              }
            }
            else
            {
              uint64_t v34 = v116[3];
              v35 = sub_56E4();
              BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG);
              if (v34)
              {
                if (v36)
                {
                  *(_WORD *)buf = 0;
                  _os_log_debug_impl(&dword_0, v35, OS_LOG_TYPE_DEBUG, "PMLDESPlugin successfully sent payload to suggestd/PML.", buf, 2u);
                }
              }
              else if (v36)
              {
                *(_WORD *)buf = 0;
                _os_log_debug_impl(&dword_0, v35, OS_LOG_TYPE_DEBUG, "PMLDESPlugin sent payload to suggestd/PML with no result or error.", buf, 2u);
              }
            }
            if (v32) {
              goto LABEL_45;
            }
          }
          id v23 = [v22 countByEnumeratingWithState:&v100 objects:v138 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }

      uint64_t v39 = v116[3];
      if (v39)
      {
        uint64_t v40 = [v86 attachments];
        id v41 = [(id)v40 count];

        v42 = [v86 attachments];
        id v43 = [v42 count];
        v44 = [(id)v120[5] allKeys];
        LOBYTE(v40) = v43 == [v44 count];

        if (v40)
        {
          uint64_t v85 = (void)v41 * v39;
          goto LABEL_71;
        }
        if (a6)
        {
          id v50 = +[NSError errorWithDomain:@"PMLDESPluginErrorDomain" code:4 userInfo:0];
          goto LABEL_58;
        }
LABEL_46:
        id v46 = 0;
LABEL_47:

        goto LABEL_48;
      }
      int v48 = 0;
    }
    v49 = (void *)v132[5];
    if (v49)
    {
      if (a6)
      {
        id v50 = v49;
LABEL_58:
        id v46 = 0;
        *a6 = v50;
        goto LABEL_47;
      }
    }
    else if (*((unsigned char *)v112 + 24))
    {
      if ([(id)v126[5] count])
      {
        id v46 = (id)v126[5];
        goto LABEL_47;
      }
      if (a6)
      {
        id v50 = +[NSError errorWithDomain:@"PMLDESPluginErrorDomain" code:5 userInfo:0];
        goto LABEL_58;
      }
    }
    else
    {
      if (!v48)
      {
        id v46 = &__NSDictionary0__struct;
        goto LABEL_47;
      }
      if (a6)
      {
        id v50 = +[NSError errorWithDomain:@"PMLDESPluginErrorDomain" code:5 userInfo:&off_8568];
        goto LABEL_58;
      }
    }
    goto LABEL_46;
  }
  v45 = sub_56E4();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
  {
    v54 = [v86 attachments];
    id v55 = [v54 count];
    *(_DWORD *)buf = 134217984;
    id v140 = v55;
    _os_log_error_impl(&dword_0, v45, OS_LOG_TYPE_ERROR, "Expected > 0 attachment but got %lu", buf, 0xCu);
  }
  if (a6)
  {
    +[NSError errorWithDomain:@"PMLDESPluginErrorDomain" code:1 userInfo:0];
    id v46 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v46 = 0;
  }
LABEL_48:
  _Block_object_dispose(&v111, 8);
  _Block_object_dispose(&v115, 8);
  _Block_object_dispose(&v119, 8);

  _Block_object_dispose(&v125, 8);
  _Block_object_dispose(&v131, 8);

  return v46;
}

- (id)_getPFLIdentifierForLogging:(id)a3
{
  if ([a3 hasPrefix:@"QuickResponsesClassification_label"]) {
    return @"com.apple.proactive.responses";
  }
  else {
    return @"com.apple.proactive.fia.phone.en";
  }
}

- (BOOL)shouldDownloadAttachmentWithURL:(id)a3 recipe:(id)a4 recordInfo:(id)a5
{
  return 1;
}

- (PMLDESPluginObject)initWithSuggestionsClient:(id)a3 encryptor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PMLDESPluginObject;
  v9 = [(PMLDESPluginObject *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_suggestionsClient, a3);
    objc_storeStrong((id *)&v10->_encryptor, a4);
  }

  return v10;
}

- (PMLDESPluginObject)init
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2050000000;
  v3 = (void *)qword_C798;
  uint64_t v19 = qword_C798;
  if (!qword_C798)
  {
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    id v13 = sub_5DC0;
    v14 = &unk_8240;
    id v15 = &v16;
    sub_5DC0((uint64_t)&v11);
    v3 = (void *)v17[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v16, 8);
  v5 = [v4 serviceForFides];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2050000000;
  v6 = (void *)qword_C7A8;
  uint64_t v19 = qword_C7A8;
  if (!qword_C7A8)
  {
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    id v13 = sub_5FAC;
    v14 = &unk_8240;
    id v15 = &v16;
    sub_5FAC((uint64_t)&v11);
    v6 = (void *)v17[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v16, 8);
  id v8 = objc_opt_new();
  v9 = [(PMLDESPluginObject *)self initWithSuggestionsClient:v5 encryptor:v8];

  return v9;
}

+ (id)encryptUpdates:(id)a3 totalParameters:(unint64_t)a4 haruspexKeyBase64:(id)a5 encryptor:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (v12)
  {
    id v14 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v12 options:0];
    if (!v14)
    {
      if (a7)
      {
        *a7 = +[NSError errorWithDomain:@"PMLDESPluginErrorDomain" code:7 userInfo:0];
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to init NSData for provided Haruspex key", buf, 2u);
      }
      id v18 = 0;
      goto LABEL_24;
    }
    id v20 = 0;
    id v15 = objc_msgSend(v13, "encryptedDataWithPublicKey:dataFloatNumbers:count:error:", v14, objc_msgSend(v11, "bytes"), a4, &v20);
    id v16 = v20;
    id v17 = v16;
    if (v15)
    {
      if (!v16)
      {
        id v18 = v15;
        goto LABEL_23;
      }
      if (a7) {
        goto LABEL_6;
      }
LABEL_21:
      id v18 = 0;
      goto LABEL_23;
    }
    if (!v16)
    {
      id v17 = +[NSError errorWithDomain:@"PMLDESPluginErrorDomain" code:8 userInfo:0];
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v17;
      _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not privatize/encrypt data: %@", buf, 0xCu);
      if (!a7) {
        goto LABEL_21;
      }
    }
    else if (!a7)
    {
      goto LABEL_21;
    }
LABEL_6:
    id v17 = v17;
    id v18 = 0;
    *a7 = v17;
LABEL_23:

LABEL_24:
    goto LABEL_25;
  }
  if (a7)
  {
    *a7 = +[NSError errorWithDomain:@"PMLDESPluginErrorDomain" code:6 userInfo:0];
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Haruspex key not found in recipe", buf, 2u);
  }
  id v18 = 0;
LABEL_25:

  return v18;
}

@end