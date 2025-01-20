@interface _ANEMILCompiler
+ (id)compileModelAt:(id)a3 modelName:(id)a4 csIdentity:(id)a5 optionsFilename:(id)a6 outputURL:(id)a7 saveSourceURL:(id)a8 aotModelBinaryPath:(id)a9 isEncryptedModel:(BOOL)a10 options:(id)a11 ok:(BOOL *)a12 error:(id *)a13;
@end

@implementation _ANEMILCompiler

+ (id)compileModelAt:(id)a3 modelName:(id)a4 csIdentity:(id)a5 optionsFilename:(id)a6 outputURL:(id)a7 saveSourceURL:(id)a8 aotModelBinaryPath:(id)a9 isEncryptedModel:(BOOL)a10 options:(id)a11 ok:(BOOL *)a12 error:(id *)a13
{
  id v18 = a3;
  id v19 = a4;
  id v63 = a5;
  id v20 = a6;
  id v61 = a7;
  id v64 = a8;
  id v55 = a9;
  id v65 = a11;
  v53 = v18;
  v21 = [v18 path];
  v22 = +[NSString stringWithFormat:@"%@/", v21];

  v23 = [v61 path];
  id obj = +[NSString stringWithFormat:@"%@/", v23];

  v24 = [v64 path];
  id v62 = +[NSString stringWithFormat:@"%@", v24];

  v25 = (__CFString *)v20;
  if (v25)
  {
    v26 = [v22 stringByAppendingPathComponent:v25];
  }
  else
  {
    v26 = 0;
  }
  v27 = +[_ANELog compiler];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    v49 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v49;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v22;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&long long v72 = v62;
    _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%@ inputModelPath=%@ sourceModelPath=%@", buf, 0x20u);
  }
  v28 = [v65 objectForKeyedSubscript:kANEFAOTCacheUrlIdentifierKey[0]];

  if (v28)
  {
    v59 = [v65 objectForKeyedSubscript:kANEFAOTCacheUrlIdentifierKey[0]];
  }
  else
  {
    v59 = 0;
  }
  uint64_t v74 = 0;
  long long v73 = 0u;
  long long v72 = 0u;
  id v51 = v19;
  *(void *)buf = v51;
  id v52 = v22;
  *(void *)&buf[8] = v52;
  id v54 = v26;
  *(void *)&buf[16] = v54;
  uint64_t v29 = +[_ANEStrings modelBinaryName];
  v30 = (void *)v72;
  *(void *)&long long v72 = v29;

  objc_storeStrong((id *)&v72 + 1, obj);
  objc_storeStrong((id *)&v73 + 1, v62);
  objc_storeStrong((id *)&v73, a9);
  BYTE1(v74) = a10;
  BYTE2(v74) = 1;
  LOBYTE(v74) = v59 != 0;
  if (v59) {
    uint64_t v31 = 19;
  }
  else {
    uint64_t v31 = 3;
  }
  v32 = +[NSDate date];
  id v67 = 0;
  id v57 = +[_ANECompiler compileModel:buf options:v65 ok:a12 error:&v67];
  id v58 = v67;
  v33 = +[NSDate date];
  [v33 timeIntervalSinceDate:v32];
  double v35 = v34;
  if (!*a12)
  {
    v36 = +[NSString stringWithFormat:@"_ANEMILCompiler: for %@ FAILED: lAttr=%@ : lErr=%@", v63, v57, v58];
    v37 = +[_ANELog compiler];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = NSStringFromSelector(a2);
      sub_10003234C(v38, (uint64_t)v36, v70, v37);
    }
  }
  v66 = &stru_10004D218;
  BOOL v39 = +[_ANEStrings trimmedModelPath:v64 trimmedPath:&v66];
  v40 = v66;
  v68[0] = @"csIdentity";
  v68[1] = @"modelURL";
  v69[0] = v63;
  v69[1] = v40;
  v68[2] = @"privacy_score";
  v41 = +[NSNumber numberWithBool:v39];
  v69[2] = v41;
  v68[3] = @"modelType";
  uint64_t v42 = +[NSNumber numberWithInteger:v31];
  v43 = (void *)v42;
  if (v25) {
    CFStringRef v44 = v25;
  }
  else {
    CFStringRef v44 = &stru_10004D218;
  }
  v69[3] = v42;
  v69[4] = v44;
  v68[4] = @"compilationArgs";
  v68[5] = @"modelIRTranslationTime";
  v69[5] = &off_100050538;
  v68[6] = @"modelCompileTime";
  v45 = +[NSNumber numberWithDouble:v35 * 1000.0];
  v69[6] = v45;
  v68[7] = @"modelCompiled";
  v46 = +[NSNumber numberWithBool:*a12];
  v69[7] = v46;
  v47 = +[NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:8];
  +[_ANEDataReporter reportTelemetryToPPS:@"modelCompilation" playload:v47];

  sub_1000238C4((uint64_t)buf);
  if (a13 && !*a12)
  {
    *a13 = +[_ANECompiler createErrorWithUnderlyingError:v58];
  }

  return v57;
}

@end