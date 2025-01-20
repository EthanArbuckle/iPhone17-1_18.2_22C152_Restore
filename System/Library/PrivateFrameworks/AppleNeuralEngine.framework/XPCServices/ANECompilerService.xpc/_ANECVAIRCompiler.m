@interface _ANECVAIRCompiler
+ (id)compileModelAt:(id)a3 csIdentity:(id)a4 plistFilename:(id)a5 optionsFilename:(id)a6 outputURL:(id)a7 saveSourceURL:(id)a8 aotModelBinaryPath:(id)a9 isEncryptedModel:(BOOL)a10 options:(id)a11 ok:(BOOL *)a12 error:(id *)a13;
@end

@implementation _ANECVAIRCompiler

+ (id)compileModelAt:(id)a3 csIdentity:(id)a4 plistFilename:(id)a5 optionsFilename:(id)a6 outputURL:(id)a7 saveSourceURL:(id)a8 aotModelBinaryPath:(id)a9 isEncryptedModel:(BOOL)a10 options:(id)a11 ok:(BOOL *)a12 error:(id *)a13
{
  id v18 = a3;
  id v63 = a4;
  id v19 = a5;
  id v20 = a6;
  id v61 = a7;
  id v64 = a8;
  id v54 = a9;
  id v65 = a11;
  v21 = [v18 path];
  v22 = +[NSString stringWithFormat:@"%@/", v21];

  v23 = [v61 path];
  id obj = +[NSString stringWithFormat:@"%@/", v23];

  v24 = [v64 path];
  id v62 = +[NSString stringWithFormat:@"%@", v24];

  v25 = +[_ANELog compiler];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    v50 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v50;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v22;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&long long v72 = v62;
    _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%@ inputModelPath=%@ sourceModelPath=%@", buf, 0x20u);
  }
  id v26 = v20;
  v57 = v26;
  if (v26)
  {
    v27 = [v22 stringByAppendingPathComponent:v26];
  }
  else
  {
    v27 = 0;
  }
  if (!v19)
  {
    id v19 = +[_ANEStrings defaultANECIRFileName];
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
  v29 = (__CFString *)v19;
  *(void *)buf = v29;
  id v52 = v22;
  *(void *)&buf[8] = v52;
  id v53 = v27;
  *(void *)&buf[16] = v53;
  uint64_t v30 = +[_ANEStrings modelBinaryName];
  v31 = (void *)v72;
  *(void *)&long long v72 = v30;

  objc_storeStrong((id *)&v72 + 1, obj);
  objc_storeStrong((id *)&v73 + 1, v62);
  objc_storeStrong((id *)&v73, a9);
  *(_WORD *)((char *)&v74 + 1) = a10;
  LOBYTE(v74) = v59 != 0;
  if (v59) {
    uint64_t v32 = 17;
  }
  else {
    uint64_t v32 = 1;
  }
  v33 = +[NSDate date];
  id v67 = 0;
  id v56 = +[_ANECompiler compileModel:buf options:v65 ok:a12 error:&v67];
  id v58 = v67;
  v34 = +[NSDate date];
  [v34 timeIntervalSinceDate:v33];
  double v36 = v35;
  if (!*a12)
  {
    v37 = +[NSString stringWithFormat:@"_ANECVAIRCompiler: for %@ FAILED: lAttr=%@ : lErr=%@", v63, v56, v58];
    v38 = +[_ANELog compiler];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = NSStringFromSelector(a2);
      sub_10003234C(v39, (uint64_t)v37, v70, v38);
    }
  }
  v66 = &stru_10004D218;
  BOOL v40 = +[_ANEStrings trimmedModelPath:v64 trimmedPath:&v66];
  v41 = v66;
  v68[0] = @"csIdentity";
  v68[1] = @"modelURL";
  v69[0] = v63;
  v69[1] = v41;
  v68[2] = @"privacy_score";
  v42 = +[NSNumber numberWithBool:v40];
  v69[2] = v42;
  v68[3] = @"modelType";
  uint64_t v43 = +[NSNumber numberWithInteger:v32];
  v44 = (void *)v43;
  if (v29) {
    CFStringRef v45 = v29;
  }
  else {
    CFStringRef v45 = &stru_10004D218;
  }
  v69[3] = v43;
  v69[4] = v45;
  v68[4] = @"compilationArgs";
  v68[5] = @"modelIRTranslationTime";
  v69[5] = &off_100050508;
  v68[6] = @"modelCompileTime";
  v46 = +[NSNumber numberWithDouble:v36 * 1000.0];
  v69[6] = v46;
  v68[7] = @"modelCompiled";
  v47 = +[NSNumber numberWithBool:*a12];
  v69[7] = v47;
  v48 = +[NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:8];
  +[_ANEDataReporter reportTelemetryToPPS:@"modelCompilation" playload:v48];

  sub_1000238C4((uint64_t)buf);
  if (a13 && !*a12)
  {
    *a13 = +[_ANECompiler createErrorWithUnderlyingError:v58];
  }

  return v56;
}

@end