@interface _ANECoreMLModelCompiler
+ (id)compileModelAt:(id)a3 csIdentity:(id)a4 key:(id)a5 optionsFilename:(id)a6 tempDirectory:(id)a7 outputURL:(id)a8 saveSourceModelPath:(id)a9 aotModelBinaryPath:(id)a10 isEncryptedModel:(BOOL)a11 options:(id)a12 ok:(BOOL *)a13 error:(id *)a14;
+ (id)createErrorWithString:(id)a3;
+ (id)pathsForModelURL:(id)a3;
+ (void)initialize;
@end

@implementation _ANECoreMLModelCompiler

+ (void)initialize
{
  qword_100057FC0 = +[_ANELog compiler];
  _objc_release_x1();
}

+ (id)createErrorWithString:(id)a3
{
  v4 = +[NSString stringWithFormat:@"_ANECoreMLModelCompiler : error %@", a3];
  v5 = (void *)qword_100057FC0;
  if (os_log_type_enabled((os_log_t)qword_100057FC0, OS_LOG_TYPE_ERROR)) {
    sub_100032E88(v5, a2, (uint64_t)v4);
  }
  +[_ANEDataReporter addValue:1 forScalarKey:@"ModelFailsEspressoCompilation"];
  v6 = +[_ANEStrings errorDomainEspresso];
  NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
  v11 = v4;
  v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v8 = +[NSError errorWithDomain:v6 code:1 userInfo:v7];

  return v8;
}

+ (id)pathsForModelURL:(id)a3
{
  v3 = [a3 path];
  v4 = +[NSString stringWithFormat:@"%@/", v3];
  v5 = +[NSFileManager defaultManager];
  v6 = [v5 enumeratorAtPath:v3];
  v7 = 0;
  while (1)
  {
    v8 = [v6 nextObject];

    if (!v8) {
      break;
    }
    v7 = v8;
    if ([v8 containsString:@".net"]) {
      goto LABEL_6;
    }
  }
  v8 = +[NSString stringWithFormat:@"model.espresso.net"];
LABEL_6:
  v9 = +[NSString stringWithFormat:@"%@%@", v4, v8];
  NSErrorUserInfoKey v10 = [v4 pathExtension];
  if ([v10 isEqualToString:@"bin"])
  {
    v11 = v4;
LABEL_11:

    goto LABEL_12;
  }
  unsigned __int8 v12 = [v4 containsString:@".bin:"];

  v11 = v4;
  if (v12)
  {
LABEL_12:
    id v13 = v11;

    v9 = v13;
    goto LABEL_13;
  }
  NSErrorUserInfoKey v10 = [v4 pathExtension];
  if ([v10 isEqualToString:@"net"])
  {
    v11 = v3;
    goto LABEL_11;
  }
  v15 = [v4 pathExtension];
  unsigned __int8 v16 = [v15 isEqualToString:@"mil"];

  v11 = v3;
  if (v16) {
    goto LABEL_12;
  }
LABEL_13:

  return v9;
}

+ (id)compileModelAt:(id)a3 csIdentity:(id)a4 key:(id)a5 optionsFilename:(id)a6 tempDirectory:(id)a7 outputURL:(id)a8 saveSourceModelPath:(id)a9 aotModelBinaryPath:(id)a10 isEncryptedModel:(BOOL)a11 options:(id)a12 ok:(BOOL *)a13 error:(id *)a14
{
  id v85 = a3;
  id v84 = a4;
  id v86 = a5;
  v80 = (__CFString *)a6;
  id v76 = a7;
  id v77 = a8;
  id v78 = a9;
  id v69 = a10;
  id v87 = a12;
  v79 = +[NSFileManager defaultManager];
  v88 = [a1 pathsForModelURL:v85];
  v19 = [v85 path];
  v71 = +[NSString stringWithFormat:@"%@/", v19];

  v20 = [v77 path];
  id obj = +[NSString stringWithFormat:@"%@/", v20];

  v21 = +[_ANELog compiler];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v37 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v37;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v88;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = v78;
    _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%@ inputModelPath=%@ sourceModelPath=%@", buf, 0x20u);
  }
  uint64_t v22 = [v87 objectForKeyedSubscript:kANEModelKeyEspressoTranslationOptions[0]];
  v23 = &__NSDictionary0__struct;
  if (v22) {
    v23 = (void *)v22;
  }
  v75 = v23;
  v24 = +[_ANEHashEncoding hexStringForString:v88];
  v25 = +[_ANEHashEncoding hexStringForString:v86];
  v26 = +[NSString stringWithFormat:@"%@/%@/%@/%@/", v76, v84, v24, v25];

  [v79 createDirectoryAtPath:v26 withIntermediateDirectories:1 attributes:0 error:0];
  v82 = +[NSDate date];
  id v92 = 0;
  LODWORD(v24) = +[_ANEEspressoIRTranslator translateModelAt:v88 key:v86 outputPath:v26 isEncryptedModel:a11 translationOptions:v75 error:&v92];
  id v83 = v92;
  v81 = +[NSDate date];
  [v81 timeIntervalSinceDate:v82];
  double v28 = v27;
  if (v24)
  {
    if (v80)
    {
      v29 = objc_msgSend(v71, "stringByAppendingPathComponent:");
    }
    else
    {
      v33 = +[_ANEStrings defaultCompilerOptionsFilename];
      v29 = [v26 stringByAppendingPathComponent:v33];

      char v91 = 0;
      unsigned int v34 = [v79 fileExistsAtPath:v29 isDirectory:&v91];
      if (v91) {
        unsigned int v35 = v34;
      }
      else {
        unsigned int v35 = 0;
      }
      if (v35 == 1)
      {
        v36 = +[NSString stringWithFormat:@"Directory used for optionsFilePath (%@)", v29];
      }
      else if (v34)
      {
        v36 = 0;
      }
      else
      {
        v36 = +[NSString stringWithFormat:@"No compiler options at optionsFilePath (%@)", v29];

        v29 = 0;
      }
      v38 = (void *)qword_100057FC0;
      if (os_log_type_enabled((os_log_t)qword_100057FC0, OS_LOG_TYPE_DEBUG)) {
        sub_100032FEC(v38, a2);
      }
      if (v35)
      {
        v39 = (void *)qword_100057FC0;
        if (os_log_type_enabled((os_log_t)qword_100057FC0, OS_LOG_TYPE_ERROR))
        {
          v66 = v39;
          v67 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138413314;
          *(void *)&buf[4] = v67;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v36;
          *(_WORD *)&buf[22] = 2112;
          *(void *)&buf[24] = v88;
          LOWORD(v96[0]) = 2112;
          *(void *)((char *)v96 + 2) = v86;
          WORD5(v96[0]) = 2112;
          *(void *)((char *)v96 + 12) = v26;
          _os_log_error_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "%@: %@ : FAILED : [_ANEEspressoIRTranslator -translateModelAt:%@ key=%@ outputPath:%@]", buf, 0x34u);
        }
        *a13 = 0;
        uint64_t v40 = [a1 createErrorWithString:v36];

        id v74 = &__NSDictionary0__struct;
        double v31 = 0.0;
        uint64_t v32 = 2;
        id v83 = (id)v40;
        goto LABEL_33;
      }
    }
    v41 = [v87 objectForKeyedSubscript:kANEFAOTCacheUrlIdentifierKey[0]];

    if (v41)
    {
      v42 = [v87 objectForKeyedSubscript:kANEFAOTCacheUrlIdentifierKey[0]];
    }
    else
    {
      v42 = 0;
    }
    memset(v96, 0, sizeof(v96));
    memset(buf, 0, sizeof(buf));
    uint64_t v43 = +[_ANEStrings defaultANECIRFileName];
    v44 = *(void **)buf;
    *(void *)buf = v43;

    objc_storeStrong((id *)&buf[8], v26);
    objc_storeStrong((id *)&buf[16], v29);
    uint64_t v45 = +[_ANEStrings modelBinaryName];
    v46 = *(void **)&buf[24];
    *(void *)&buf[24] = v45;

    objc_storeStrong((id *)v96, obj);
    objc_storeStrong((id *)&v96[1], a9);
    objc_storeStrong((id *)v96 + 1, a10);
    *(_WORD *)((char *)&v96[1] + 9) = a11;
    BYTE8(v96[1]) = v42 != 0;
    if (v42) {
      uint64_t v32 = 18;
    }
    else {
      uint64_t v32 = 2;
    }
    uint64_t v47 = +[NSDate date];

    id v90 = v83;
    id v74 = +[_ANECompiler compileModel:buf options:v87 ok:a13 error:&v90];
    id v48 = v90;

    v49 = +[NSDate date];

    [v49 timeIntervalSinceDate:v47];
    double v51 = v50;
    sub_1000238C4((uint64_t)buf);

    double v31 = v51 * 1000.0;
    v36 = v29;
    v81 = v49;
    v82 = (void *)v47;
    id v83 = v48;
LABEL_33:

    goto LABEL_34;
  }
  *a13 = 0;
  v30 = (void *)qword_100057FC0;
  double v31 = 0.0;
  if (os_log_type_enabled((os_log_t)qword_100057FC0, OS_LOG_TYPE_ERROR))
  {
    v64 = v30;
    v65 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413314;
    *(void *)&buf[4] = v65;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v88;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = v86;
    LOWORD(v96[0]) = 2112;
    *(void *)((char *)v96 + 2) = v26;
    WORD5(v96[0]) = 2112;
    *(void *)((char *)v96 + 12) = v83;
    _os_log_error_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "%@, : [_ANEEspressoIRTranslator -translateModelAt:%@ key=%@ outputPath:%@] FAILED: %@", buf, 0x34u);
  }
  id v74 = &__NSDictionary0__struct;
  uint64_t v32 = 2;
LABEL_34:
  v52 = +[NSURL fileURLWithPath:v78];
  v89 = &stru_10004D218;
  BOOL v53 = +[_ANEStrings trimmedModelPath:v52 trimmedPath:&v89];
  v54 = v89;

  v93[0] = @"csIdentity";
  v93[1] = @"modelURL";
  v94[0] = v84;
  v94[1] = v54;
  v93[2] = @"privacy_score";
  v55 = +[NSNumber numberWithBool:v53];
  v94[2] = v55;
  v93[3] = @"modelType";
  v56 = +[NSNumber numberWithInteger:v32];
  v94[3] = v56;
  CFStringRef v57 = v80;
  if (!v80) {
    CFStringRef v57 = &stru_10004D218;
  }
  v94[4] = v57;
  v93[4] = @"compilationArgs";
  v93[5] = @"modelIRTranslationTime";
  v58 = +[NSNumber numberWithDouble:v28 * 1000.0];
  v94[5] = v58;
  v93[6] = @"modelCompileTime";
  v59 = +[NSNumber numberWithDouble:v31];
  v94[6] = v59;
  v93[7] = @"modelCompiled";
  v60 = +[NSNumber numberWithBool:*a13];
  v94[7] = v60;
  v61 = +[NSDictionary dictionaryWithObjects:v94 forKeys:v93 count:8];
  +[_ANEDataReporter reportTelemetryToPPS:@"modelCompilation" playload:v61];

  if (a14 && !*a13) {
    *a14 = [v83 copy];
  }
  v62 = (void *)qword_100057FC0;
  if (os_log_type_enabled((os_log_t)qword_100057FC0, OS_LOG_TYPE_DEBUG)) {
    sub_100032F48(v62, a2);
  }

  return v74;
}

@end