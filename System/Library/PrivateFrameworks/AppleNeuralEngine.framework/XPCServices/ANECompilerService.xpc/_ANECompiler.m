@interface _ANECompiler
+ (id)compileModel:(id *)a3 options:(id)a4 ok:(BOOL *)a5 error:(id *)a6;
+ (id)compileModelJIT:(id *)a3 ok:(BOOL *)a4 error:(id *)a5;
+ (id)createErrorWithUnderlyingError:(id)a3;
+ (id)createJITNetworkFromModelAtPath:(id)a3 modelFilename:(id)a4 aotModelAtPath:(id)a5 aotModelFilename:(id)a6;
+ (id)createNetworkFromModelAtPath:(id)a3 modelFilename:(id)a4;
+ (void)initialize;
@end

@implementation _ANECompiler

+ (void)initialize
{
  qword_100057FB8 = +[_ANELog compiler];
  _objc_release_x1();
}

+ (id)createNetworkFromModelAtPath:(id)a3 modelFilename:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [&__NSDictionary0__struct mutableCopy];
  [v7 setObject:v6 forKeyedSubscript:@"NetworkSourceFileName"];
  [v7 setObject:v5 forKeyedSubscript:@"NetworkSourcePath"];
  id v8 = [&__NSArray0__struct mutableCopy];
  [v8 addObject:v7];

  return v8;
}

+ (id)createJITNetworkFromModelAtPath:(id)a3 modelFilename:(id)a4 aotModelAtPath:(id)a5 aotModelFilename:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [&__NSDictionary0__struct mutableCopy];
  [v13 setObject:v12 forKeyedSubscript:@"NetworkSourceFileName"];
  [v13 setObject:v11 forKeyedSubscript:@"NetworkSourcePath"];
  [v13 setObject:v10 forKeyedSubscript:@"NetworkJITShapesName"];
  [v13 setObject:v9 forKeyedSubscript:@"NetworkJITShapesPath"];
  id v14 = [&__NSArray0__struct mutableCopy];
  [v14 addObject:v13];

  return v14;
}

+ (id)createErrorWithUnderlyingError:(id)a3
{
  id v4 = a3;
  id v6 = +[NSString stringWithFormat:@"_ANECompiler : ANECCompile() FAILED"];
  id v7 = (id)qword_100057FB8;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    sub_100032C9C();
  }

  id v8 = +[_ANEStrings errorDomainCompiler];
  if (v4)
  {
    v15[0] = NSLocalizedDescriptionKey;
    v15[1] = NSUnderlyingErrorKey;
    v16[0] = v6;
    v16[1] = v4;
    id v9 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
    uint64_t v10 = +[NSError errorWithDomain:v8 code:1 userInfo:v9];
  }
  else
  {
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    id v14 = v6;
    id v9 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    uint64_t v10 = +[NSError errorWithDomain:v8 code:1 userInfo:v9];
  }
  id v11 = (void *)v10;

  return v11;
}

+ (id)compileModelJIT:(id *)a3 ok:(BOOL *)a4 error:(id *)a5
{
  id v72 = a3->var0;
  id v78 = a3->var1;
  id v79 = a3->var4;
  id v75 = a3->var3;
  v69 = a3->var6;
  id v73 = a3->var5;
  v77 = (uint64_t (*)(uint64_t, uint64_t))a3->var2;
  BOOL var8 = a3->var8;
  uint64_t v10 = (id)qword_100057FB8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    id v55 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v106 = 138413058;
    *(void *)&v106[4] = v55;
    *(_WORD *)&v106[12] = 2080;
    *(void *)&v106[14] = [v73 UTF8String];
    *(_WORD *)&v106[22] = 2080;
    v107 = (uint64_t (*)(uint64_t, uint64_t))[v78 UTF8String];
    LOWORD(v108) = 2080;
    *(void *)((char *)&v108 + 2) = [v72 UTF8String];
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%@: START : compileModelJIT compilerRequest.aotModelBinaryPath=%s : inputModelPath(JIT)=%s modelFilename(JIT)=%s", v106, 0x2Au);
  }
  kdebug_trace();
  id v11 = +[_ANEStrings modelBinaryName];
  v71 = [a1 createJITNetworkFromModelAtPath:v78 modelFilename:v72 aotModelAtPath:v73 aotModelFilename:v11];

  id v12 = [&__NSDictionary0__struct mutableCopy];
  [v12 setObject:v71 forKeyedSubscript:@"InputNetworks"];
  v67 = +[NSString stringWithFormat:@"%@.tmp", v75];
  [v12 setObject:v79 forKeyedSubscript:@"OutputFilePath"];
  [v12 setObject:v67 forKeyedSubscript:@"OutputFileName"];
  id v76 = [&__NSDictionary0__struct mutableCopy];
  NSErrorUserInfoKey v13 = +[_ANEDeviceInfo aneSubType];
  id v14 = +[_ANEDeviceInfo aneSubTypeVariant];
  v15 = +[_ANEDeviceInfo aneSubTypeProductVariant];
  v68 = +[NSString stringWithFormat:@"%@%@%@", v13, v14, v15];

  v16 = (id)qword_100057FB8;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    sub_100032DB4();
  }

  if (var8)
  {
    v17 = (id)qword_100057FB8;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = NSStringFromSelector(a2);
      sub_100032D68(v18, (uint64_t)&v109, v17);
    }
  }
  if (v77)
  {
    [v76 setObject:v77 forKeyedSubscript:@"OptionsFilePath"];
    v19 = (id)qword_100057FB8;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v56 = NSStringFromSelector(a2);
      *(_DWORD *)v106 = 138413058;
      *(void *)&v106[4] = v56;
      *(_WORD *)&v106[12] = 2112;
      *(void *)&v106[14] = v78;
      *(_WORD *)&v106[22] = 2112;
      v107 = v77;
      LOWORD(v108) = 2112;
      *(void *)((char *)&v108 + 2) = v76;
      _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%@: inputModelPath=%@ : optionsFilePath=%@ : compilerOptions=%@", v106, 0x2Au);
    }
  }
  *(void *)v106 = 0;
  *(void *)&v106[8] = v106;
  *(void *)&v106[16] = 0x3032000000;
  v107 = sub_10002B0C4;
  *(void *)&long long v108 = sub_10002B0D4;
  *((void *)&v108 + 1) = 0;
  v88[0] = 0;
  v88[1] = v88;
  v88[2] = 0x2020000000;
  int v89 = 0;
  v86[1] = _NSConcreteStackBlock;
  v86[2] = (id)3221225472;
  v86[3] = sub_10002B0DC;
  v86[4] = &unk_10004D1A8;
  v86[5] = v106;
  v86[6] = v88;
  int v87 = 0;
  int v20 = ANECCompileJIT();
  if (!v20)
  {
    v21 = +[NSFileManager defaultManager];
    *a4 = 1;
    v74 = [v79 stringByAppendingPathComponent:v67];
    uint64_t v25 = [v79 stringByAppendingPathComponent:v75];
    v86[0] = 0;
    v66 = v25;
    int v26 = [v21 removeItemAtPath:v25 error:v86];
    v27 = v86[0];
    if ((v26 & 1) == 0)
    {
      v28 = (id)qword_100057FB8;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        v58 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        v99 = v58;
        __int16 v100 = 2112;
        v101 = v66;
        __int16 v102 = 2112;
        v103 = v27;
        _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%@: FAILED removing %@ : lErr=%@", buf, 0x20u);
      }
      uint64_t v25 = (uint64_t)v66;
    }
    v85 = v27;
    unsigned __int8 v29 = [v21 moveItemAtPath:v74 toPath:v25 error:&v85];
    v30 = v85;

    *a4 = v29;
    if (v29)
    {
      v31 = v66;
      if (!+[_ANEStorageHelper enableApfsPurging]) {
        goto LABEL_32;
      }
      id v84 = 0;
      unsigned __int8 v32 = +[_ANEStorageHelper markPathAndDirectParentPurgeable:v66 error:&v84];
      v33 = v84;
      if ((v32 & 1) == 0)
      {
        v34 = (id)qword_100057FB8;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          v35 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          v99 = v35;
          __int16 v100 = 2112;
          v101 = v66;
          __int16 v102 = 2112;
          v103 = v33;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%@: FAILED make %@ as purgeable : errorForPurgeable=%@", buf, 0x20u);
        }
      }
    }
    else
    {
      v33 = (id)qword_100057FB8;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v59 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138413058;
        v99 = v59;
        __int16 v100 = 2112;
        v101 = v74;
        __int16 v102 = 2112;
        v103 = v66;
        __int16 v104 = 2112;
        v105 = v30;
        _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%@: FAILED moving %@ to %@ : lErr=%@", buf, 0x2Au);
      }
    }

    v31 = v66;
LABEL_32:
    v83 = v30;
    v65 = [v21 attributesOfItemAtPath:v31 error:&v83];
    v36 = v83;

    if (v65)
    {
      v82 = v36;
      v37 = [v21 attributesOfItemAtPath:v69 error:&v82];
      v38 = v82;

      kdebug_trace();
      if (v37)
      {
        v64 = [v65 objectForKeyedSubscript:NSFileCreationDate];
        v62 = [v65 objectForKeyedSubscript:NSFileModificationDate];
        v63 = [v37 objectForKeyedSubscript:NSFileCreationDate];
        v39 = [v37 objectForKeyedSubscript:NSFileModificationDate];
        id v40 = [v64 compare:v63];
        id v41 = [v62 compare:v39];
        if (v40 == (id)-1 || v41 == (id)-1)
        {
          v43 = [v65 mutableCopy];
          [v43 setObject:v63 forKeyedSubscript:NSFileCreationDate];
          [v43 setObject:v39 forKeyedSubscript:NSFileModificationDate];
          v81 = v38;
          unsigned __int8 v44 = [v21 setAttributes:v43 ofItemAtPath:v66 error:&v81];
          v42 = v81;

          if ((v44 & 1) == 0)
          {
            v45 = (id)qword_100057FB8;
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              v61 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138413058;
              v99 = v61;
              __int16 v100 = 2112;
              v101 = v43;
              __int16 v102 = 2112;
              v103 = v66;
              __int16 v104 = 2112;
              v105 = v42;
              _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%@: setAttributes:%@ ofItemAtPath:%@ failed : lErr=%@", buf, 0x2Au);
            }
          }
        }
        else
        {
          v42 = v38;
        }

        v38 = v42;
      }
      else
      {
        v64 = (id)qword_100057FB8;
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          sub_100032D24();
        }
      }

      v36 = v38;
    }
    else
    {
      v37 = (id)qword_100057FB8;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_100032D24();
      }
    }

    v46 = (id)qword_100057FB8;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      v57 = NSStringFromSelector(a2);
      *(_DWORD *)v92 = 138412802;
      v93 = v57;
      __int16 v94 = 2112;
      v95 = v69;
      __int16 v96 = 2112;
      id v97 = v79;
      _os_log_debug_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "%@: Attempt to store %@ to %@", v92, 0x20u);
    }
    if (+[_ANEModelCacheManager saveSourceModelPath:v69 outputModelDirectory:v79])
    {
      if (!+[_ANEStorageHelper enableApfsPurging])
      {
LABEL_60:

        goto LABEL_61;
      }
      kdebug_trace();
      v47 = +[_ANEModelCacheManager cachedSourceModelStoreNameFor:v79];
      id v80 = 0;
      unsigned __int8 v48 = +[_ANEStorageHelper markPathAndDirectParentPurgeable:v47 error:&v80];
      id v49 = v80;
      if ((v48 & 1) == 0)
      {
        v50 = (id)qword_100057FB8;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          v51 = NSStringFromSelector(a2);
          *(_DWORD *)v92 = 138412802;
          v93 = v51;
          __int16 v94 = 2112;
          v95 = v47;
          __int16 v96 = 2112;
          id v97 = v49;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "%@: FAILED make %@ as purgeable : errorForPurgeable=%@", v92, 0x20u);
        }
      }
    }
    else
    {
      *a4 = 0;
      v47 = (id)qword_100057FB8;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v60 = NSStringFromSelector(a2);
        *(_DWORD *)v92 = 138412802;
        v93 = v60;
        __int16 v94 = 2112;
        v95 = v69;
        __int16 v96 = 2112;
        id v97 = v79;
        _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%@: FAILED storing %@ to %@", v92, 0x20u);
      }
    }

    goto LABEL_60;
  }
  *a4 = 0;
  v21 = [*(id *)(*(void *)&v106[8] + 40) objectForKeyedSubscript:@"ErrorList"];
  v74 = +[NSString stringWithFormat:@"ANECCompile(%@) FAILED: err=%@", v78, v21];
  v22 = (id)qword_100057FB8;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    sub_100032C9C();
  }

  if (a5)
  {
    v23 = +[_ANEStrings errorDomainCompiler];
    NSErrorUserInfoKey v90 = NSLocalizedDescriptionKey;
    v91 = v74;
    v24 = +[NSDictionary dictionaryWithObjects:&v91 forKeys:&v90 count:1];
    *a5 = +[NSError errorWithDomain:v23 code:v20 userInfo:v24];
  }
  +[_ANEDataReporter addValue:1 forScalarKey:@"ModelFailsToCompileANECIR"];
LABEL_61:

  v52 = (id)qword_100057FB8;
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    sub_100032CE0();
  }

  kdebug_trace();
  id v53 = *(id *)(*(void *)&v106[8] + 40);
  _Block_object_dispose(v88, 8);
  _Block_object_dispose(v106, 8);

  return v53;
}

+ (id)compileModel:(id *)a3 options:(id)a4 ok:(BOOL *)a5 error:(id *)a6
{
  id v90 = a4;
  if (!a3->var7)
  {
    id v14 = a3->var1;
    v15 = a3->var0;
    v86 = (uint64_t (*)(uint64_t, uint64_t))a3->var2;
    id v87 = a3->var4;
    id v83 = a3->var3;
    v81 = a3->var6;
    BOOL var8 = a3->var8;
    v88 = v14;
    v85 = v15;
    id v79 = [a1 createNetworkFromModelAtPath:v14 modelFilename:v15];
    id v17 = [&__NSDictionary0__struct mutableCopy];
    [v17 setObject:v79 forKeyedSubscript:@"InputNetworks"];
    id v80 = +[NSString stringWithFormat:@"%@.tmp", v83];
    objc_msgSend(v17, "setObject:forKeyedSubscript:");
    [v17 setObject:v87 forKeyedSubscript:@"OutputFilePath"];
    id v89 = [&__NSDictionary0__struct mutableCopy];
    v18 = +[_ANEDeviceInfo aneSubType];
    v19 = +[_ANEDeviceInfo aneSubTypeVariant];
    int v20 = +[_ANEDeviceInfo aneSubTypeProductVariant];
    id v84 = +[NSString stringWithFormat:@"%@%@%@", v18, v19, v20];

    v21 = (id)qword_100057FB8;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_100032DB4();
    }

    [v89 setObject:v84 forKeyedSubscript:@"TargetArchitecture"];
    if (var8)
    {
      v22 = (id)qword_100057FB8;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v23 = NSStringFromSelector(a2);
        sub_100032D68(v23, (uint64_t)&v120, v22);
      }
    }
    if (v86)
    {
      [v89 setObject:v86 forKeyedSubscript:@"OptionsFilePath"];
      v24 = (id)qword_100057FB8;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v68 = NSStringFromSelector(a2);
        *(_DWORD *)v117 = 138413058;
        *(void *)&v117[4] = v68;
        *(_WORD *)&v117[12] = 2112;
        *(void *)&v117[14] = v88;
        *(_WORD *)&v117[22] = 2112;
        v118 = v86;
        LOWORD(v119) = 2112;
        *(void *)((char *)&v119 + 2) = v89;
        _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%@: inputModelPath=%@ : optionsFilePath=%@ : compilerOptions=%@", v117, 0x2Au);
      }
    }
    *(void *)v117 = 0;
    *(void *)&v117[8] = v117;
    *(void *)&v117[16] = 0x3032000000;
    v118 = sub_10002B0C4;
    *(void *)&long long v119 = sub_10002B0D4;
    *((void *)&v119 + 1) = 0;
    v99[0] = 0;
    v99[1] = v99;
    v99[2] = 0x2020000000;
    int v100 = 0;
    v98[1] = _NSConcreteStackBlock;
    v98[2] = (id)3221225472;
    v98[3] = sub_10002C3BC;
    v98[4] = &unk_10004D1D0;
    v98[5] = v117;
    v98[6] = v99;
    int v25 = ANECCompile();
    if (v25)
    {
      *a5 = 0;
      int v26 = [*(id *)(*(void *)&v117[8] + 40) objectForKeyedSubscript:@"ErrorList"];
      v82 = +[NSString stringWithFormat:@"ANECCompile(%@) FAILED: err=%@", v88, v26];
      v27 = (id)qword_100057FB8;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_100032C9C();
      }

      if (a6)
      {
        v28 = +[_ANEStrings errorDomainCompiler];
        NSErrorUserInfoKey v101 = NSLocalizedDescriptionKey;
        __int16 v102 = v82;
        unsigned __int8 v29 = +[NSDictionary dictionaryWithObjects:&v102 forKeys:&v101 count:1];
        *a6 = +[NSError errorWithDomain:v28 code:v25 userInfo:v29];
      }
      +[_ANEDataReporter addValue:1 forScalarKey:@"ModelFailsToCompileANECIR"];
LABEL_75:

      v66 = (id)qword_100057FB8;
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_100032CE0();
      }

      id v13 = *(id *)(*(void *)&v117[8] + 40);
      _Block_object_dispose(v99, 8);
      _Block_object_dispose(v117, 8);

      goto LABEL_78;
    }
    int v26 = +[NSFileManager defaultManager];
    *a5 = 1;
    v82 = [v87 stringByAppendingPathComponent:v80];
    uint64_t v30 = [v87 stringByAppendingPathComponent:v83];
    v98[0] = 0;
    v77 = v30;
    unsigned __int8 v31 = [v26 removeItemAtPath:v30 error:v98];
    unsigned __int8 v32 = v98[0];
    if ((v31 & 1) == 0)
    {
      v33 = (id)qword_100057FB8;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        v70 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        v110 = v70;
        __int16 v111 = 2112;
        v112 = v77;
        __int16 v113 = 2112;
        v114 = v32;
        _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "%@: FAILED removing %@ : lErr=%@", buf, 0x20u);
      }
      uint64_t v30 = (uint64_t)v77;
    }
    id v97 = v32;
    unsigned __int8 v34 = [v26 moveItemAtPath:v82 toPath:v30 error:&v97];
    v35 = v97;

    *a5 = v34;
    if (v34)
    {
      v36 = v77;
      if (!+[_ANEStorageHelper enableApfsPurging]) {
        goto LABEL_36;
      }
      id v96 = 0;
      unsigned __int8 v37 = +[_ANEStorageHelper markPathAndDirectParentPurgeable:v77 error:&v96];
      v38 = v96;
      if ((v37 & 1) == 0)
      {
        v39 = (id)qword_100057FB8;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          id v40 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          v110 = v40;
          __int16 v111 = 2112;
          v112 = v77;
          __int16 v113 = 2112;
          v114 = v38;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "%@: FAILED make %@ as purgeable : errorForPurgeable=%@", buf, 0x20u);
        }
      }
    }
    else
    {
      v38 = (id)qword_100057FB8;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v71 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138413058;
        v110 = v71;
        __int16 v111 = 2112;
        v112 = v82;
        __int16 v113 = 2112;
        v114 = v77;
        __int16 v115 = 2112;
        v116 = v35;
        _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%@: FAILED moving %@ to %@ : lErr=%@", buf, 0x2Au);
      }
    }

    v36 = v77;
LABEL_36:
    v95 = v35;
    id v78 = [v26 attributesOfItemAtPath:v36 error:&v95];
    id v41 = v95;

    if (v78)
    {
      __int16 v94 = v41;
      v42 = [v26 attributesOfItemAtPath:v81 error:&v94];
      v43 = v94;

      if (v42)
      {
        id v76 = [v78 objectForKeyedSubscript:NSFileCreationDate];
        id v75 = [v78 objectForKeyedSubscript:NSFileModificationDate];
        v74 = [v42 objectForKeyedSubscript:NSFileCreationDate];
        unsigned __int8 v44 = [v42 objectForKeyedSubscript:NSFileModificationDate];
        id v45 = [v76 compare:v74];
        id v46 = [v75 compare:v44];
        if (v45 == (id)-1 || v46 == (id)-1)
        {
          unsigned __int8 v48 = [v78 mutableCopy];
          [v48 setObject:v74 forKeyedSubscript:NSFileCreationDate];
          [v48 setObject:v44 forKeyedSubscript:NSFileModificationDate];
          v93 = v43;
          unsigned __int8 v49 = [v26 setAttributes:v48 ofItemAtPath:v77 error:&v93];
          v47 = v93;

          if ((v49 & 1) == 0)
          {
            v50 = (id)qword_100057FB8;
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              id v73 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138413058;
              v110 = v73;
              __int16 v111 = 2112;
              v112 = v48;
              __int16 v113 = 2112;
              v114 = v77;
              __int16 v115 = 2112;
              v116 = v47;
              _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%@: setAttributes:%@ ofItemAtPath:%@ failed : lErr=%@", buf, 0x2Au);
            }
          }
        }
        else
        {
          v47 = v43;
        }

        v43 = v47;
      }
      else
      {
        id v76 = (id)qword_100057FB8;
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          objc_claimAutoreleasedReturnValue();
          sub_100032D24();
        }
      }

      id v41 = v43;
    }
    else
    {
      v42 = (id)qword_100057FB8;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_100032D24();
      }
    }

    v51 = (id)qword_100057FB8;
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      v69 = NSStringFromSelector(a2);
      *(_DWORD *)v103 = 138412802;
      __int16 v104 = v69;
      __int16 v105 = 2112;
      v106 = v81;
      __int16 v107 = 2112;
      id v108 = v87;
      _os_log_debug_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, "%@: Attempt to store %@ to %@", v103, 0x20u);
    }
    if (+[_ANEModelCacheManager saveSourceModelPath:v81 outputModelDirectory:v87])
    {
      if (!+[_ANEStorageHelper enableApfsPurging])
      {
LABEL_64:
        v57 = [v90 objectForKeyedSubscript:kANEFRetainModelsWithoutSourceURLKey[0]];
        unsigned int v58 = [v57 BOOLValue];

        v59 = v78;
        if (v58)
        {
          v60 = (id)qword_100057FB8;
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
          {
            NSStringFromSelector(a2);
            objc_claimAutoreleasedReturnValue();
            sub_100032DF8();
          }

          v59 = v78;
          if (+[_ANEModelCacheManager createModelCacheRetain:](_ANEModelCacheManager, "createModelCacheRetain:", v87)&& +[_ANEStorageHelper enableApfsPurging])
          {
            v61 = +[_ANEModelCacheManager cachedModelRetainNameFor:v87];
            id v91 = 0;
            unsigned __int8 v62 = +[_ANEStorageHelper markPathAndDirectParentPurgeable:v61 error:&v91];
            id v63 = v91;
            if ((v62 & 1) == 0)
            {
              v64 = (id)qword_100057FB8;
              if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
              {
                v65 = NSStringFromSelector(a2);
                *(_DWORD *)v103 = 138412802;
                __int16 v104 = v65;
                __int16 v105 = 2112;
                v106 = v61;
                __int16 v107 = 2112;
                id v108 = v63;
                _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "%@: FAILED make %@ as purgeable : errorForPurgeable=%@", v103, 0x20u);
              }
            }

            v59 = v78;
          }
        }

        goto LABEL_75;
      }
      v52 = +[_ANEModelCacheManager cachedSourceModelStoreNameFor:v87];
      id v92 = 0;
      unsigned __int8 v53 = +[_ANEStorageHelper markPathAndDirectParentPurgeable:v52 error:&v92];
      id v54 = v92;
      if ((v53 & 1) == 0)
      {
        id v55 = (id)qword_100057FB8;
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          v56 = NSStringFromSelector(a2);
          *(_DWORD *)v103 = 138412802;
          __int16 v104 = v56;
          __int16 v105 = 2112;
          v106 = v52;
          __int16 v107 = 2112;
          id v108 = v54;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "%@: FAILED make %@ as purgeable : errorForPurgeable=%@", v103, 0x20u);
        }
      }
    }
    else
    {
      *a5 = 0;
      v52 = (id)qword_100057FB8;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        id v72 = NSStringFromSelector(a2);
        *(_DWORD *)v103 = 138412802;
        __int16 v104 = v72;
        __int16 v105 = 2112;
        v106 = v81;
        __int16 v107 = 2112;
        id v108 = v87;
        _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "%@: FAILED storing %@ to %@", v103, 0x20u);
      }
    }

    goto LABEL_64;
  }
  id v11 = (id)qword_100057FB8;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = NSStringFromSelector(a2);
    sub_100032E3C(v12, (uint64_t)buf, v11);
  }

  id v13 = [a1 compileModelJIT:a3 ok:a5 error:a6];
  if (!*a5)
  {
    v88 = +[NSString stringWithFormat:@"compileModelJIT: FAILED: lAttr=%@ : lErr=%@", v13, *a6];
    v85 = +[_ANELog compiler];
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_100032C9C();
    }
LABEL_78:
  }
  return v13;
}

@end