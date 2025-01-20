@interface Main
+ (BOOL)createZipFileAtPath:(id)a3 withContentsOfDirectory:(id)a4;
+ (BOOL)createZipFileAtPath:(id)a3 withContentsOfDirectory:(id)a4 keepParentDirectory:(BOOL)a5;
+ (BOOL)createZipFileAtPath:(id)a3 withFilesAtPaths:(id)a4;
+ (BOOL)unzipFileAtPath:(id)a3 toDestination:(id)a4;
+ (BOOL)unzipFileAtPath:(id)a3 toDestination:(id)a4 delegate:(id)a5;
+ (BOOL)unzipFileAtPath:(id)a3 toDestination:(id)a4 overwrite:(BOOL)a5 password:(id)a6 error:(id *)a7;
+ (BOOL)unzipFileAtPath:(id)a3 toDestination:(id)a4 overwrite:(BOOL)a5 password:(id)a6 error:(id *)a7 delegate:(id)a8;
+ (BOOL)unzipFileAtPath:(id)a3 toDestination:(id)a4 overwrite:(BOOL)a5 password:(id)a6 error:(id *)a7 delegate:(id)a8 progressHandler:(id)a9 completionHandler:(id)a10;
+ (BOOL)unzipFileAtPath:(id)a3 toDestination:(id)a4 overwrite:(BOOL)a5 password:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8;
+ (BOOL)unzipFileAtPath:(id)a3 toDestination:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
+ (id)dateWithMicrosoftDOSFormat:(unsigned int)a3;
- (BOOL)close;
- (BOOL)open;
- (BOOL)writeData:(id)a3 fileName:(id)a4;
- (BOOL)writeFile:(id)a3;
- (BOOL)writeFileAtPath:(id)a3 withFileName:(id)a4;
- (BOOL)writeFolderAtPath:(id)a3 withFolderName:(id)a4;
- (Main)initWithPath:(id)a3;
- (void)zipInformation:(id *)a3 setDate:(id)a4;
@end

@implementation Main

+ (BOOL)unzipFileAtPath:(id)a3 toDestination:(id)a4
{
  id v9 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  char v6 = [v9 unzipFileAtPath:location[0] toDestination:v7 delegate:0];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

+ (BOOL)unzipFileAtPath:(id)a3 toDestination:(id)a4 overwrite:(BOOL)a5 password:(id)a6 error:(id *)a7
{
  id v17 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  BOOL v14 = a5;
  id v13 = 0;
  objc_storeStrong(&v13, a6);
  char v12 = [v17 unzipFileAtPath:location[0] toDestination:v15 overwrite:v14 password:v13 error:a7 delegate:0 progressHandler:0 completionHandler:0];
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v12 & 1;
}

+ (BOOL)unzipFileAtPath:(id)a3 toDestination:(id)a4 delegate:(id)a5
{
  id v12 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v9 = 0;
  objc_storeStrong(&v9, a5);
  char v8 = [v12 unzipFileAtPath:location[0] toDestination:v10 overwrite:1 password:0 error:0 delegate:v9 progressHandler:0 completionHandler:0];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v8 & 1;
}

+ (BOOL)unzipFileAtPath:(id)a3 toDestination:(id)a4 overwrite:(BOOL)a5 password:(id)a6 error:(id *)a7 delegate:(id)a8
{
  id v21 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v19 = 0;
  objc_storeStrong(&v19, a4);
  BOOL v18 = a5;
  id v17 = 0;
  objc_storeStrong(&v17, a6);
  v16 = a7;
  id v15 = 0;
  objc_storeStrong(&v15, a8);
  char v14 = [v21 unzipFileAtPath:location[0] toDestination:v19 overwrite:v18 password:v17 error:v16 delegate:v15 progressHandler:0 completionHandler:0];
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return v14 & 1;
}

+ (BOOL)unzipFileAtPath:(id)a3 toDestination:(id)a4 overwrite:(BOOL)a5 password:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8
{
  id v21 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v19 = 0;
  objc_storeStrong(&v19, a4);
  BOOL v18 = a5;
  id v17 = 0;
  objc_storeStrong(&v17, a6);
  id v16 = 0;
  objc_storeStrong(&v16, a7);
  id v15 = 0;
  objc_storeStrong(&v15, a8);
  char v14 = objc_msgSend(v21, "unzipFileAtPath:toDestination:overwrite:password:error:delegate:progressHandler:completionHandler:", location[0], v19, v18, v17, 0, v16, v15);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return v14 & 1;
}

+ (BOOL)unzipFileAtPath:(id)a3 toDestination:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v15 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v12 = 0;
  objc_storeStrong(&v12, a5);
  id v11 = 0;
  objc_storeStrong(&v11, a6);
  char v10 = objc_msgSend(v15, "unzipFileAtPath:toDestination:overwrite:password:error:delegate:progressHandler:completionHandler:", location[0], v13, 1, 0, 0, v12, v11);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v10 & 1;
}

+ (BOOL)unzipFileAtPath:(id)a3 toDestination:(id)a4 overwrite:(BOOL)a5 password:(id)a6 error:(id *)a7 delegate:(id)a8 progressHandler:(id)a9 completionHandler:(id)a10
{
  v137[1] = *MEMORY[0x263EF8340];
  id v122 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v120 = 0;
  objc_storeStrong(&v120, a4);
  BOOL v119 = a5;
  id v118 = 0;
  objc_storeStrong(&v118, a6);
  v117 = a7;
  id v116 = 0;
  objc_storeStrong(&v116, a8);
  id v115 = 0;
  objc_storeStrong(&v115, a9);
  id v114 = 0;
  objc_storeStrong(&v114, a10);
  v113 = (uint64_t *)unzOpen([location[0] UTF8String]);
  if (v113)
  {
    id v56 = (id)[MEMORY[0x263F08850] defaultManager];
    id v109 = (id)[v56 attributesOfItemAtPath:location[0] error:0];

    uint64_t v108 = 0;
    id v57 = (id)[v109 objectForKeyedSubscript:*MEMORY[0x263F080B8]];
    uint64_t v58 = [v57 unsignedLongLongValue];

    uint64_t v108 = v58;
    uint64_t v107 = 0;
    uint64_t v105 = 0;
    uint64_t v106 = 0;
    unzGetGlobalInfo((uint64_t)v113, &v105);
    if (unzGoToFirstFile(v113))
    {
      uint64_t v134 = *MEMORY[0x263F08320];
      v135 = @"Failed to open the first file in Zip.";
      id v104 = (id)[NSDictionary dictionaryWithObjects:&v135 forKeys:&v134 count:1];
      id v103 = (id)[MEMORY[0x263F087E8] errorWithDomain:@"ZipArchiveErrorDomain" code:-2 userInfo:v104];
      if (v117)
      {
        id v11 = v103;
        id *v117 = v11;
      }
      if (v114) {
        (*((void (**)(id, void, void, id))v114 + 2))(v114, 0, 0, v103);
      }
      char v123 = 0;
      int v110 = 1;
      objc_storeStrong(&v103, 0);
      objc_storeStrong(&v104, 0);
    }
    else
    {
      id v102 = (id)[MEMORY[0x263F08850] defaultManager];
      id v101 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      char v100 = 1;
      char v99 = 0;
      int CurrentFileInfo = 0;
      bzero(__ptr, 0x1000uLL);
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(v116, "zipArchiveWillUnzipArchiveAtPath:zipInformation:", location[0], v105, v106);
      }
      if (objc_opt_respondsToSelector()) {
        [v116 zipArchiveProgressEvent:v107 total:v108];
      }
      uint64_t v97 = 0;
      do
      {
        context = (void *)MEMORY[0x22A6B1950]();
        if ([v118 length]) {
          int CurrentFileInfo = unzOpenCurrentFilePassword(v113, [v118 cStringUsingEncoding:1]);
        }
        else {
          int CurrentFileInfo = unzOpenCurrentFile(v113);
        }
        if (CurrentFileInfo)
        {
          char v100 = 0;
          int v110 = 2;
        }
        else
        {
          memset(__b, 0, sizeof(__b));
          int CurrentFileInfo = unzGetCurrentFileInfo(v113, (uint64_t)__b, 0, 0, 0, 0, 0, 0);
          if (CurrentFileInfo)
          {
            char v100 = 0;
            unzCloseCurrentFile((uint64_t)v113);
            int v110 = 2;
          }
          else
          {
            v107 += __b[6];
            if (objc_opt_respondsToSelector())
            {
              memcpy(__dst, __b, sizeof(__dst));
              if (([v116 zipArchiveShouldUnzipFileAtIndex:v97 totalFiles:v105 archivePath:location[0] fileInformation:__dst] & 1) == 0)
              {
                char v100 = 0;
                char v99 = 1;
              }
            }
            if (objc_opt_respondsToSelector())
            {
              memcpy(v94, __b, sizeof(v94));
              [v116 zipArchiveWillUnzipFileAtIndex:v97 totalFiles:v105 archivePath:location[0] fileInformation:v94];
            }
            if (objc_opt_respondsToSelector()) {
              [v116 zipArchiveProgressEvent:v107 total:v108];
            }
            v93 = 0;
            v93 = malloc_type_malloc(__b[8] + 1, 0xC1C6D33DuLL);
            unzGetCurrentFileInfo(v113, (uint64_t)__b, (uint64_t)v93, __b[8] + 1, 0, 0, 0, 0);
            *((unsigned char *)v93 + __b[8]) = 0;
            uint64_t v92 = 3;
            uint64_t v91 = 61440;
            uint64_t v90 = 40960;
            char v89 = 0;
            if (__b[0] >> 8 == 3 && ((__b[13] >> 16) & 0xF000) == 0xA000) {
              char v89 = 0;
            }
            id v88 = (id)[NSString stringWithUTF8String:v93];
            char v87 = 0;
            if (*((unsigned char *)v93 + __b[8] - 1) == 47 || *((unsigned char *)v93 + __b[8] - 1) == 92) {
              char v87 = 1;
            }
            free(v93);
            id v52 = v88;
            id v53 = (id)[MEMORY[0x263F08708] characterSetWithCharactersInString:@"/\\""];
            uint64_t v85 = objc_msgSend(v52, "rangeOfCharacterFromSet:");
            uint64_t v86 = v12;
            BOOL v54 = v85 == 0x7FFFFFFFFFFFFFFFLL;

            if (!v54)
            {
              id v13 = (id)[v88 stringByReplacingOccurrencesOfString:@"\\" withString:@"/""];
              id v14 = v88;
              id v88 = v13;
            }
            id v84 = (id)[v120 stringByAppendingPathComponent:v88];
            id v83 = 0;
            id v82 = (id)[(id)objc_opt_class() dateWithMicrosoftDOSFormat:__b[4]];
            v131[0] = *MEMORY[0x263F08008];
            v132[0] = v82;
            v131[1] = *MEMORY[0x263F08048];
            v132[1] = v82;
            id v81 = (id)[NSDictionary dictionaryWithObjects:v132 forKeys:v131 count:2];
            if (v87)
            {
              id v80 = v83;
              [v102 createDirectoryAtPath:v84 withIntermediateDirectories:1 attributes:v81 error:&v80];
              objc_storeStrong(&v83, v80);
            }
            else
            {
              id v50 = v102;
              id v51 = (id)[v84 stringByDeletingLastPathComponent];
              id v79 = v83;
              objc_msgSend(v50, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
              objc_storeStrong(&v83, v79);
            }
            if (v83)
            {
              id v49 = (id)[v83 localizedDescription];
              NSLog(&cfstr_ZiparchiveErro.isa, v49);
            }
            if ((v89 & 1) == 0)
            {
              id v47 = v101;
              v129[0] = @"path";
              v130[0] = v84;
              v129[1] = @"modDate";
              v130[1] = v82;
              id v48 = (id)[NSDictionary dictionaryWithObjects:v130 forKeys:v129 count:2];
              objc_msgSend(v47, "addObject:");
            }
            if (([v102 fileExistsAtPath:v84] & 1) == 0 || (v87 & 1) != 0 || v119)
            {
              if (v89)
              {
                id v72 = (id)[MEMORY[0x263F089D8] string];
                int CurrentFile = 0;
                while (1)
                {
                  int CurrentFile = unzReadCurrentFile((uint64_t)v113, (uint64_t)__ptr, 0x1000u);
                  if (CurrentFile <= 0) {
                    break;
                  }
                  __ptr[CurrentFile] = 0;
                  id v34 = v72;
                  id v35 = (id)objc_msgSend(NSString, "stringWithUTF8String:");
                  objc_msgSend(v34, "appendString:");
                }
                int v70 = 0;
                v33 = (char *)objc_msgSend(v72, "cStringUsingEncoding:");
                int v70 = symlink(v33, (const char *)[v84 cStringUsingEncoding:4]);
                if (v70)
                {
                  id v31 = v84;
                  id v32 = v72;
                  id v15 = __error();
                  NSLog(&cfstr_FailedToCreate.isa, v31, v32, *v15);
                }
                objc_storeStrong(&v72, 0);
              }
              else
              {
                *(void *)&__size[1] = 0;
                *(void *)&__size[1] = fopen((const char *)[v84 UTF8String], "wb");
                while (*(void *)&__size[1])
                {
                  __size[0] = 0;
                  __size[0] = unzReadCurrentFile((uint64_t)v113, (uint64_t)__ptr, 0x1000u);
                  if (__size[0] <= 0) {
                    break;
                  }
                  fwrite(__ptr, __size[0], 1uLL, *(FILE **)&__size[1]);
                }
                if (*(void *)&__size[1])
                {
                  id v45 = (id)[v84 pathExtension];
                  id v44 = (id)[v45 lowercaseString];
                  char v46 = [v44 isEqualToString:@"zip"];

                  if (v46)
                  {
                    id v39 = (id)[v84 lastPathComponent];
                    NSLog(&cfstr_UnzippingNeste.isa, v39);

                    v41 = v122;
                    id v40 = v84;
                    id v42 = (id)[v84 stringByDeletingLastPathComponent];
                    char v43 = objc_msgSend(v41, "unzipFileAtPath:toDestination:overwrite:password:error:delegate:", v40);

                    if (v43)
                    {
                      id v38 = (id)[MEMORY[0x263F08850] defaultManager];
                      [v38 removeItemAtPath:v84 error:0];
                    }
                  }
                  fclose(*(FILE **)&__size[1]);
                  if (__b[4])
                  {
                    id v77 = (id)[(id)objc_opt_class() dateWithMicrosoftDOSFormat:__b[4]];
                    uint64_t v127 = *MEMORY[0x263F08048];
                    id v128 = v77;
                    id v76 = (id)[NSDictionary dictionaryWithObjects:&v128 forKeys:&v127 count:1];
                    if (v76 && ([v102 setAttributes:v76 ofItemAtPath:v84 error:0] & 1) == 0) {
                      NSLog(&cfstr_ZiparchiveFail.isa);
                    }
                    objc_storeStrong(&v76, 0);
                    objc_storeStrong(&v77, 0);
                  }
                  uint64_t v75 = __b[13] >> 16;
                  if (__b[13] >> 16)
                  {
                    id v74 = (id)[NSNumber numberWithUnsignedLong:v75];
                    id v36 = objc_alloc(MEMORY[0x263EFF9A0]);
                    id v37 = (id)objc_msgSend(v102, "attributesOfItemAtPath:error:", v84);
                    id v73 = (id)objc_msgSend(v36, "initWithDictionary:");

                    [v73 setObject:v74 forKeyedSubscript:*MEMORY[0x263F08078]];
                    if (([v102 setAttributes:v73 ofItemAtPath:v84 error:0] & 1) == 0) {
                      NSLog(&cfstr_ZiparchiveFail_0.isa);
                    }
                    objc_storeStrong(&v73, 0);
                    objc_storeStrong(&v74, 0);
                  }
                }
              }
              unzCloseCurrentFile((uint64_t)v113);
              int CurrentFileInfo = unzGoToNextFile(v113);
              if (objc_opt_respondsToSelector())
              {
                memcpy(v69, __b, sizeof(v69));
                [v116 zipArchiveDidUnzipFileAtIndex:v97 totalFiles:v105 archivePath:location[0] fileInformation:v69];
              }
              else if (objc_opt_respondsToSelector())
              {
                [v116 zipArchiveDidUnzipFileAtIndex:v97 totalFiles:v105 archivePath:location[0] unzippedFilePath:v84];
              }
              ++v97;
              if (v115)
              {
                v30 = (void (*)(id, id, unsigned char *, uint64_t, uint64_t))*((void *)v115 + 2);
                memcpy(v68, __b, sizeof(v68));
                v30(v115, v88, v68, v97, v105);
              }
              int v110 = 0;
            }
            else
            {
              unzCloseCurrentFile((uint64_t)v113);
              int CurrentFileInfo = unzGoToNextFile(v113);
              int v110 = 3;
            }
            objc_storeStrong(&v81, 0);
            objc_storeStrong(&v82, 0);
            objc_storeStrong(&v83, 0);
            objc_storeStrong(&v84, 0);
            objc_storeStrong(&v88, 0);
          }
        }
      }
      while (v110 != 2 && !CurrentFileInfo);
      unzClose((uint64_t)v113);
      id v67 = 0;
      memset(v65, 0, sizeof(v65));
      id v28 = v101;
      uint64_t v29 = [v28 countByEnumeratingWithState:v65 objects:v126 count:16];
      if (v29)
      {
        uint64_t v25 = *(void *)v65[2];
        uint64_t v26 = 0;
        unint64_t v27 = v29;
        while (1)
        {
          uint64_t v24 = v26;
          if (*(void *)v65[2] != v25) {
            objc_enumerationMutation(v28);
          }
          id v66 = *(id *)(v65[1] + 8 * v26);
          id v22 = (id)[MEMORY[0x263F08850] defaultManager];
          uint64_t v124 = *MEMORY[0x263F08048];
          id v21 = (id)[v66 objectForKeyedSubscript:@"modDate"];
          id v125 = v21;
          id v20 = (id)[NSDictionary dictionaryWithObjects:&v125 forKeys:&v124 count:1];
          id v19 = (id)[v66 objectForKeyedSubscript:@"path"];
          id v64 = v67;
          char v23 = objc_msgSend(v22, "setAttributes:ofItemAtPath:error:", v20);
          objc_storeStrong(&v67, v64);

          if ((v23 & 1) == 0)
          {
            id v18 = (id)[v66 objectForKeyedSubscript:@"path"];
            NSLog(&cfstr_ZiparchiveSetA.isa, v18);
          }
          if (v67)
          {
            id v17 = (id)[v67 localizedDescription];
            NSLog(&cfstr_ZiparchiveErro_0.isa, v17);
          }
          ++v26;
          if (v24 + 1 >= v27)
          {
            uint64_t v26 = 0;
            unint64_t v27 = [v28 countByEnumeratingWithState:v65 objects:v126 count:16];
            if (!v27) {
              break;
            }
          }
        }
      }

      if (v100 & 1) != 0 && (objc_opt_respondsToSelector()) {
        objc_msgSend(v116, "zipArchiveDidUnzipArchiveAtPath:zipInformation:unzippedPath:", location[0], v105, v106, v120);
      }
      if (v99 & 1) == 0 && (objc_opt_respondsToSelector()) {
        [v116 zipArchiveProgressEvent:v108 total:v108];
      }
      if (v114) {
        (*((void (**)(id, id, uint64_t, void))v114 + 2))(v114, location[0], 1, 0);
      }
      char v123 = v100 & 1;
      int v110 = 1;
      objc_storeStrong(&v67, 0);
      objc_storeStrong(&v101, 0);
      objc_storeStrong(&v102, 0);
    }
    objc_storeStrong(&v109, 0);
  }
  else
  {
    uint64_t v136 = *MEMORY[0x263F08320];
    v137[0] = @"Failed to unzip file";
    id v112 = (id)[NSDictionary dictionaryWithObjects:v137 forKeys:&v136 count:1];
    id v111 = (id)[MEMORY[0x263F087E8] errorWithDomain:@"ZipArchiveErrorDomain" code:-1 userInfo:v112];
    if (v117)
    {
      id v10 = v111;
      id *v117 = v10;
    }
    if (v114) {
      (*((void (**)(id, void, void, id))v114 + 2))(v114, 0, 0, v111);
    }
    char v123 = 0;
    int v110 = 1;
    objc_storeStrong(&v111, 0);
    objc_storeStrong(&v112, 0);
  }
  objc_storeStrong(&v114, 0);
  objc_storeStrong(&v115, 0);
  objc_storeStrong(&v116, 0);
  objc_storeStrong(&v118, 0);
  objc_storeStrong(&v120, 0);
  objc_storeStrong(location, 0);
  return v123 & 1;
}

+ (BOOL)createZipFileAtPath:(id)a3 withFilesAtPaths:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  char v17 = 0;
  v4 = [Main alloc];
  id v16 = [(Main *)v4 initWithPath:location[0]];
  if ([v16 open])
  {
    memset(__b, 0, sizeof(__b));
    id v11 = v18;
    uint64_t v12 = [v11 countByEnumeratingWithState:__b objects:v20 count:16];
    if (v12)
    {
      uint64_t v8 = *(void *)__b[2];
      uint64_t v9 = 0;
      unint64_t v10 = v12;
      while (1)
      {
        uint64_t v7 = v9;
        if (*(void *)__b[2] != v8) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(__b[1] + 8 * v9);
        [v16 writeFile:v15];
        ++v9;
        if (v7 + 1 >= v10)
        {
          uint64_t v9 = 0;
          unint64_t v10 = [v11 countByEnumeratingWithState:__b objects:v20 count:16];
          if (!v10) {
            break;
          }
        }
      }
    }

    char v17 = [v16 close] & 1;
  }
  char v6 = v17;
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

+ (BOOL)createZipFileAtPath:(id)a3 withContentsOfDirectory:(id)a4
{
  id v9 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  char v6 = [v9 createZipFileAtPath:location[0] withContentsOfDirectory:v7 keepParentDirectory:0];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

+ (BOOL)createZipFileAtPath:(id)a3 withContentsOfDirectory:(id)a4 keepParentDirectory:(BOOL)a5
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v33 = 0;
  objc_storeStrong(&v33, a4);
  BOOL v32 = a5;
  char v31 = 0;
  id v30 = 0;
  v5 = [Main alloc];
  id v29 = [(Main *)v5 initWithPath:location[0]];
  if ([v29 open])
  {
    id v6 = objc_alloc_init(MEMORY[0x263F08850]);
    id v7 = v30;
    id v30 = v6;

    id v28 = (id)[v30 enumeratorAtPath:v33];
    id v27 = 0;
    while (1)
    {
      id v21 = (id)[v28 nextObject];
      id v8 = v27;
      id v27 = v21;

      if (!v21) {
        break;
      }
      char v26 = 0;
      id v25 = (id)[v33 stringByAppendingPathComponent:v27];
      [v30 fileExistsAtPath:v25 isDirectory:&v26];
      if (v26)
      {
        id v18 = (id)[MEMORY[0x263F08850] defaultManager];
        id v17 = (id)[v18 subpathsOfDirectoryAtPath:v25 error:0];
        BOOL v19 = [v17 count] != 0;

        if (!v19)
        {
          id v24 = (id)objc_msgSend(v25, "stringByAppendingPathComponent:");
          objc_msgSend(&stru_26DD585A8, "writeToFile:atomically:encoding:error:", v24, 1, 4);
          id v14 = v29;
          id v13 = v24;
          id v15 = (id)[v27 stringByAppendingPathComponent:@".DS_Store"];
          objc_msgSend(v14, "writeFileAtPath:withFileName:", v13);

          id v16 = (id)[MEMORY[0x263F08850] defaultManager];
          [v16 removeItemAtPath:v24 error:0];

          objc_storeStrong(&v24, 0);
        }
      }
      else
      {
        if (v32)
        {
          id v20 = (id)[v33 lastPathComponent];
          id v9 = (id)[v20 stringByAppendingPathComponent:v27];
          id v10 = v27;
          id v27 = v9;
        }
        [v29 writeFileAtPath:v25 withFileName:v27];
      }
      objc_storeStrong(&v25, 0);
    }
    char v31 = [v29 close] & 1;
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v28, 0);
  }
  char v12 = v31;
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
  return v12 & 1;
}

- (Main)initWithPath:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v11;
  id v11 = 0;
  v9.receiver = v3;
  v9.super_class = (Class)Main;
  id v8 = [(Main *)&v9 init];
  id v11 = v8;
  objc_storeStrong((id *)&v11, v8);
  if (v8)
  {
    uint64_t v4 = [location[0] copy];
    path = v11->_path;
    v11->_path = (NSString *)v4;
  }
  id v7 = v11;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v7;
}

- (BOOL)open
{
  self->_zip = zipOpen();
  return self->_zip != 0;
}

- (void)zipInformation:(id *)a3 setDate:(id)a4
{
  id v16 = self;
  SEL v15 = a2;
  id v14 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v12 = (id)[MEMORY[0x263EFF8F0] currentCalendar];
  int v11 = 252;
  id v10 = (id)[v12 components:252 fromDate:location];
  unsigned int v4 = [v10 second];
  v14->var0.var0 = v4;
  unsigned int v5 = [v10 minute];
  v14->var0.var1 = v5;
  unsigned int v6 = [v10 hour];
  v14->var0.var2 = v6;
  unsigned int v7 = [v10 day];
  v14->var0.var3 = v7;
  int v8 = [v10 month];
  v14->var0.var4 = v8 - 1;
  unsigned int v9 = [v10 year];
  v14->var0.var5 = v9;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&location, 0);
}

- (BOOL)writeFolderAtPath:(id)a3 withFolderName:(id)a4
{
  id v21 = (uint64_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v19 = 0;
  objc_storeStrong(&v19, a4);
  memset(__b, 0, sizeof(__b));
  id v9 = (id)[MEMORY[0x263F08850] defaultManager];
  id v17 = (id)[v9 attributesOfItemAtPath:location[0] error:0];

  if (v17)
  {
    id v16 = (id)[v17 objectForKeyedSubscript:*MEMORY[0x263F08048]];
    if (v16) {
      [v21 zipInformation:__b setDate:v16];
    }
    id v15 = (id)[v17 objectForKeyedSubscript:*MEMORY[0x263F08078]];
    if (v15)
    {
      __int16 v14 = [v15 shortValue];
      uint64_t v13 = v14 + 0x8000;
      id v7 = (id)[NSNumber numberWithInteger:v13];
      unint64_t v8 = [v7 unsignedLongValue];

      unint64_t v12 = v8;
      __b[5] = v8 < 0x10;
    }
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
  }
  int v11 = 0;
  uint64_t v5 = v21[3];
  id v6 = (id)[v19 stringByAppendingString:@"/"];
  zipOpenNewFileInZip(v5, (const char *)[v6 UTF8String], (uint64_t)__b, 0, 0, 0, 0, 0, 8, 0);

  zipWriteInFileInZip(v21[3], (const Bytef *)&v11, 0);
  zipCloseFileInZip(v21[3]);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return 1;
}

- (BOOL)writeFile:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v4 = [(Main *)v6 writeFileAtPath:location[0] withFileName:0];
  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)writeFileAtPath:(id)a3 withFileName:(id)a4
{
  id v22 = (uint64_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  objc_storeStrong(&v20, a4);
  id v19 = fopen((const char *)[location[0] UTF8String], "r");
  if (v19)
  {
    id v17 = 0;
    if (v20)
    {
      id v17 = (const char *)[v20 UTF8String];
    }
    else
    {
      id v8 = (id)[location[0] lastPathComponent];
      id v17 = (const char *)[v8 UTF8String];
    }
    memset(__b, 0, sizeof(__b));
    id v7 = (id)[MEMORY[0x263F08850] defaultManager];
    id v15 = (id)[v7 attributesOfItemAtPath:location[0] error:0];

    if (v15)
    {
      id v14 = (id)[v15 objectForKeyedSubscript:*MEMORY[0x263F08048]];
      if (v14) {
        [v22 zipInformation:__b setDate:v14];
      }
      id v13 = (id)[v15 objectForKeyedSubscript:*MEMORY[0x263F08078]];
      if (v13)
      {
        uint64_t v12 = (__int16)[v13 shortValue] + 0x8000;
        id v5 = (id)[NSNumber numberWithInteger:v12];
        uint64_t v6 = [v5 unsignedLongValue];

        __b[5] = v6 << 16;
      }
      objc_storeStrong(&v13, 0);
      objc_storeStrong(&v14, 0);
    }
    zipOpenNewFileInZip(v22[3], v17, (uint64_t)__b, 0, 0, 0, 0, 0, 8, -1);
    __ptr = malloc_type_malloc(0x4000uLL, 0xF1B2600CuLL);
    while (!feof(v19))
    {
      uInt v10 = fread(__ptr, 1uLL, 0x4000uLL, v19);
      zipWriteInFileInZip(v22[3], (const Bytef *)__ptr, v10);
    }
    zipCloseFileInZip(v22[3]);
    free(__ptr);
    char v23 = 1;
    int v18 = 1;
    objc_storeStrong(&v15, 0);
  }
  else
  {
    char v23 = 0;
    int v18 = 1;
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v23 & 1;
}

- (BOOL)writeData:(id)a3 fileName:(id)a4
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  if (v14->_zip)
  {
    if (location[0])
    {
      memset(__b, 0, 0x30uLL);
      id v5 = v14;
      id v6 = (id)[MEMORY[0x263EFF910] date];
      -[Main zipInformation:setDate:](v5, "zipInformation:setDate:", __b);

      zipOpenNewFileInZip((uint64_t)v14->_zip, (const char *)[v12 UTF8String], (uint64_t)__b, 0, 0, 0, 0, 0, 8, -1);
      uint64_t zip = (uint64_t)v14->_zip;
      id v7 = (const Bytef *)[location[0] bytes];
      zipWriteInFileInZip(zip, v7, [location[0] length]);
      zipCloseFileInZip((uint64_t)v14->_zip);
      char v15 = 1;
    }
    else
    {
      char v15 = 0;
    }
    int v11 = 1;
  }
  else
  {
    char v15 = 0;
    int v11 = 1;
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v15 & 1;
}

- (BOOL)close
{
  return 1;
}

+ (id)dateWithMicrosoftDOSFormat:(unsigned int)a3
{
  id v11 = a1;
  SEL v10 = a2;
  unsigned int v9 = a3;
  id v13 = (dispatch_once_t *)&dateWithMicrosoftDOSFormat__onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_3);
  if (*v13 != -1) {
    dispatch_once(v13, location);
  }
  objc_storeStrong(&location, 0);
  id v8 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v8 setYear:((v9 & 0xFE000000) >> 25) + 1980];
  [v8 setMonth:(v9 & 0x1E00000) >> 21];
  [v8 setDay:(v9 & 0x1F0000) >> 16];
  [v8 setHour:(unsigned __int16)(v9 & 0xF800) >> 11];
  [v8 setMinute:(unsigned __int16)(v9 & 0x7E0) >> 5];
  [v8 setSecond:2 * (v9 & 0x1F)];
  BOOL v4 = (void *)MEMORY[0x263EFF910];
  id v5 = (id)[(id)dateWithMicrosoftDOSFormat__gregorian dateFromComponents:v8];
  id v7 = (id)objc_msgSend(v4, "dateWithTimeInterval:sinceDate:", 0.0);

  id v6 = v7;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  return v6;
}

void __35__Main_dateWithMicrosoftDOSFormat___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263EFF8F0]);
  uint64_t v1 = [v0 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  v2 = (void *)dateWithMicrosoftDOSFormat__gregorian;
  dateWithMicrosoftDOSFormat__gregorian = v1;
}

- (void).cxx_destruct
{
}

@end