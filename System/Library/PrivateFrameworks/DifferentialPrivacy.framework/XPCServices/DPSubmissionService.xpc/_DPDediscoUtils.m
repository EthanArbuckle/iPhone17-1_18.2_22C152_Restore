@interface _DPDediscoUtils
+ (BOOL)isDataCollectionEnabled;
+ (id)semanticVersionFromDediscoVersion:(unint64_t)a3;
+ (id)toBase64URLEncoded:(id)a3;
+ (unint64_t)dediscoVersionForDonation:(id)a3;
@end

@implementation _DPDediscoUtils

+ (unint64_t)dediscoVersionForDonation:(id)a3
{
  id v4 = a3;
  v5 = [v4 metadata];
  uint64_t v6 = kDPMetadataDediscoTaskConfig;
  v7 = [v5 objectForKeyedSubscript:kDPMetadataDediscoTaskConfig];

  if (v7)
  {
    v8 = [v4 metadata];
    v9 = [v8 objectForKeyedSubscript:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [v4 metadata];
      v11 = [v10 objectForKeyedSubscript:v6];
      uint64_t v12 = kDPMetadataDediscoServerConfiguration;
      v13 = [v11 objectForKeyedSubscript:kDPMetadataDediscoServerConfiguration];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v15 = [v4 metadata];
        v16 = [v15 objectForKeyedSubscript:v6];
        v17 = [v16 objectForKeyedSubscript:v12];

        v18 = [v17 objectForKeyedSubscript:kDPMetadataDediscoServerConfigurationLeader];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v19 = kDPMetadataDediscoServerConfigurationHelpers;
          v20 = [v17 objectForKeyedSubscript:kDPMetadataDediscoServerConfigurationHelpers];
          objc_opt_class();
          char v21 = objc_opt_isKindOfClass();

          if (v21)
          {
            [v17 objectForKeyedSubscript:v19];
            long long v50 = 0u;
            long long v51 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            id v22 = (id)objc_claimAutoreleasedReturnValue();
            v23 = (char *)[v22 countByEnumeratingWithState:&v50 objects:v55 count:16];
            if (v23)
            {
              v24 = v23;
              uint64_t v25 = *(void *)v51;
              while (2)
              {
                for (i = 0; i != v24; ++i)
                {
                  if (*(void *)v51 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    unint64_t v37 = 0;
                    v29 = v22;
                    goto LABEL_42;
                  }
                }
                v24 = (char *)[v22 countByEnumeratingWithState:&v50 objects:v55 count:16];
                if (v24) {
                  continue;
                }
                break;
              }
            }

            v27 = [v4 metadata];
            v28 = [v27 objectForKeyedSubscript:v6];
            v29 = [v28 objectForKeyedSubscript:kDPMetadataDediscoTaskConfigVersion];

            if ([v29 length])
            {
              id v49 = 0;
              v30 = [objc_alloc((Class)_DPSemanticVersion) initWithString:v29 error:&v49];
              id v31 = v49;
              v32 = v31;
              v44 = v30;
              if (v30)
              {
                id v42 = v31;
                v43 = v29;
                long long v47 = 0u;
                long long v48 = 0u;
                long long v45 = 0u;
                long long v46 = 0u;
                id v33 = [&off_1000799D0 countByEnumeratingWithState:&v45 objects:v54 count:16];
                if (v33)
                {
                  id v34 = v33;
                  uint64_t v35 = *(void *)v46;
                  while (2)
                  {
                    for (j = 0; j != v34; j = (char *)j + 1)
                    {
                      if (*(void *)v46 != v35) {
                        objc_enumerationMutation(&off_1000799D0);
                      }
                      unint64_t v37 = (unint64_t)[*(id *)(*((void *)&v45 + 1) + 8 * (void)j) unsignedIntegerValue];
                      v38 = [a1 semanticVersionFromDediscoVersion:v37];
                      if ([v38 isBackwardCompatibleWithVersion:v44])
                      {
                        v40 = +[_DPLog service];
                        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
                          sub_100056B28((uint64_t)v38, v40);
                        }

                        v29 = v43;
                        goto LABEL_36;
                      }
                    }
                    id v34 = [&off_1000799D0 countByEnumeratingWithState:&v45 objects:v54 count:16];
                    if (v34) {
                      continue;
                    }
                    break;
                  }
                }
                v29 = v43;
                v39 = +[NSString stringWithFormat:@"Unable to find a matching PPM version from donation metadata's version string: '%@'", v43];
                v38 = +[_DPDediscoError errorWithCode:400 description:v39];

                [v38 logAndStoreInError:0];
                unint64_t v37 = 0;
LABEL_36:
                v32 = v42;
              }
              else
              {
                v38 = +[_DPLog service];
                if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
                  sub_100056AB0((uint64_t)v32, v38);
                }
                unint64_t v37 = 0;
              }
            }
            else
            {
              unint64_t v37 = 4;
              v32 = [a1 semanticVersionFromDediscoVersion:4];
              v44 = +[_DPLog service];
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              {
                sub_100056A38((uint64_t)v32, v44);
                unint64_t v37 = 4;
              }
            }

LABEL_42:
            goto LABEL_43;
          }
        }
        else
        {
        }
        unint64_t v37 = 0;
LABEL_43:

        goto LABEL_44;
      }
    }
    else
    {
    }
    unint64_t v37 = 0;
  }
  else
  {
    unint64_t v37 = 1;
  }
LABEL_44:

  return v37;
}

+ (id)semanticVersionFromDediscoVersion:(unint64_t)a3
{
  switch(a3)
  {
    case 4uLL:
      id v3 = objc_alloc((Class)_DPSemanticVersion);
      uint64_t v4 = 2;
      uint64_t v5 = 1;
LABEL_8:
      id v6 = [v3 initWithMajorVersion:0 minorVersion:v4 patchVersion:v5];
      goto LABEL_10;
    case 3uLL:
      id v3 = objc_alloc((Class)_DPSemanticVersion);
      uint64_t v4 = 2;
      goto LABEL_7;
    case 2uLL:
      id v3 = objc_alloc((Class)_DPSemanticVersion);
      uint64_t v4 = 1;
LABEL_7:
      uint64_t v5 = 0;
      goto LABEL_8;
  }
  id v6 = 0;
LABEL_10:
  return v6;
}

+ (id)toBase64URLEncoded:(id)a3
{
  id v3 = [a3 base64EncodedStringWithOptions:0];
  uint64_t v4 = [v3 stringByReplacingOccurrencesOfString:@"+" withString:@"-"];
  uint64_t v5 = [v4 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
  id v6 = [v5 stringByReplacingOccurrencesOfString:@"=" withString:&stru_1000780C8];

  return v6;
}

+ (BOOL)isDataCollectionEnabled
{
  if (qword_100082B68 != -1) {
    dispatch_once(&qword_100082B68, &stru_100075148);
  }
  return byte_100082B60;
}

@end