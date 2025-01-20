@interface CPLDiagnoseCommand
+ (BOOL)ignoreInCPLStore;
+ (BOOL)isAppleInternal;
+ (id)_syndicationLibraryPath;
+ (id)commandName;
+ (id)help;
+ (id)parameters;
+ (id)shortDescription;
+ (id)supportedFeatureAreas;
- (BOOL)_chooseLibraryInteractively;
- (BOOL)_isUBFExtension:(id)a3;
- (BOOL)_libraryIdentifierMatchesLibraryFilterRegExp:(id)a3;
- (BOOL)_lookForLibrary;
- (BOOL)_path:(id)a3 existsInFileIdentifiersAddIfNot:(id)a4;
- (BOOL)_url:(id)a3 existsInFileIdentifiersAddIfNot:(id)a4;
- (BOOL)_wrapperStatusMatchesLibraryFilterRegExp:(id)a3;
- (BOOL)collectOutputOfCommand:(id)a3 label:(id)a4 filename:(id)a5;
- (BOOL)collectOutputOfCommand:(id)a3 label:(id)a4 filename:(id)a5 outputIsStderr:(BOOL)a6 timeout:(BOOL)a7;
- (BOOL)collectOutputOfCommand:(id)a3 label:(id)a4 filename:(id)a5 timeout:(BOOL)a6;
- (BOOL)collectOutputOfCommandAndArguments:(id)a3 label:(id)a4 filename:(id)a5 outputIsStderr:(BOOL)a6 timeout:(BOOL)a7;
- (BOOL)collectOutputOfTask:(id)a3 label:(id)a4 filename:(id)a5 outputIsStderr:(BOOL)a6 timeout:(BOOL)a7;
- (BOOL)createBaseFolderAndLogFile;
- (BOOL)includeSPL;
- (BOOL)includeSyndication;
- (BOOL)parseCommandOptionsWithArgc:(int)a3 argv:(char *)a4;
- (id)_abbreviatedPathForURL:(id)a3;
- (id)_determineLibraryPathFromDiagnoseBundleIdentifier:(id)a3;
- (id)_goodNameForLibraryIdentifier:(id)a3;
- (id)_libraryURLFromWrapperStatus:(id)a3;
- (id)_photosSpotlightSearchAttributes;
- (id)_readAppPrivateData;
- (id)_simplifiedPathForURL:(id)a3;
- (id)_syndicationLibrarySpotlightSearchAttributes;
- (id)getEngineWrapperStatusesWithError:(id *)a3;
- (id)interestingDatabasesForUBFLibraryPath:(id)a3 isSharingLibrary:(BOOL)a4;
- (id)interestingFilesInDirectoryPath:(id)a3 withPredicate:(id)a4;
- (id)preferencesforDomain:(id)a3 withKeys:(id)a4 currentUser:(BOOL)a5;
- (id)prependPath:(id)a3 toStringsInArray:(id)a4;
- (id)processDetailPath:(id)a3;
- (id)processes;
- (int)execute;
- (void)_collectMemoryCreationFeatureAvailabilityDiagnostics;
- (void)_collectPhotosSearchDiagnostics;
- (void)_collectSearchEntityDonationDiagnostics;
- (void)_collectSharedAlbumFilesAtPath:(id)a3;
- (void)_collectUniversalSearchDiagnostics;
- (void)_collectUniversalSearchFeatureAreaDiagnostics;
- (void)_diagnoseLibraryIdentifier:(id)a3;
- (void)_diagnoseLibraryWrapperStatus:(id)a3;
- (void)_diagnoseWithCPLLibraryIdentifier:(id)a3;
- (void)_printWrapperStatus:(id)a3;
- (void)_removeResourceDataFromFaceCropChangeCPLSerializedRecords:(sqlite3 *)a3;
- (void)_removeShareURLFromCPLScopes:(sqlite3 *)a3;
- (void)_removeShareURLFromPhotosMomentShare:(sqlite3 *)a3;
- (void)addFilesFromVisionCacheToDictionary:(id)a3;
- (void)collectAccountStatus;
- (void)collectAdditionalInformationForDatabaseAtPath:(id)a3 toDirectory:(id)a4;
- (void)collectAppLibraryIdentifiers;
- (void)collectCloudPhotodGlobalStatus;
- (void)collectCloudPhotodStatusWithLibraryIdentifier:(id)a3 subdirectory:(id)a4;
- (void)collectDatabaseAtPath:(id)a3 libraryPath:(id)a4 subdirectory:(id)a5;
- (void)collectDefaults;
- (void)collectDiagnosticLog:(id)a3;
- (void)collectDiagnosticLogs;
- (void)collectDuetInfo;
- (void)collectFeatureAreaDiagnostics;
- (void)collectFileAtPath:(id)a3;
- (void)collectFileAtPath:(id)a3 suffix:(id)a4;
- (void)collectFileAtURL:(id)a3 suffix:(id)a4 destinationDirectory:(id)a5;
- (void)collectFileListingAtPath:(id)a3 label:(id)a4 filename:(id)a5 extendedDetail:(BOOL)a6;
- (void)collectFilePaths:(id)a3 toSubdirectory:(id)a4;
- (void)collectFiles;
- (void)collectLOFetchRecordings;
- (void)collectLocalLibraryMetadataInfo;
- (void)collectMemoryCreationDiagnostics;
- (void)collectPhotosLibraryUpgradeLogs;
- (void)collectPreferences;
- (void)collectSearchDiagnostics;
- (void)collectSilentMover;
- (void)collectStoryDiagnosticsFiles;
- (void)collectSysdiagnose:(id)a3;
- (void)collectTaskInfo;
- (void)copyDatabaseFromPath:(id)a3 toPath:(id)a4;
- (void)determineLibraryPaths;
- (void)displayConsent;
- (void)executeMemoryToolsOnProcess:(id)a3;
- (void)executeTool:(id)a3 onProcess:(id)a4;
- (void)markPurgeable:(id)a3;
- (void)prepareOutputURLs;
- (void)printDiskCapacity:(id)a3;
- (void)printFormat:(id)a3 arguments:(char *)a4;
- (void)revertToRootMode:(BOOL)a3;
- (void)runAsUser:(id)a3;
- (void)sampleProcess:(id)a3;
- (void)sampleProcesses;
- (void)setUserMode:(BOOL)a3;
- (void)signalProcesses;
- (void)startDiagnostic;
- (void)writePreferenceInDomain:(id)a3 withKey:(id)a4 toDirectory:(id)a5 currentUser:(BOOL)a6;
@end

@implementation CPLDiagnoseCommand

+ (id)commandName
{
  return @"diagnose";
}

+ (id)shortDescription
{
  return @"gather diagnostics on cpl.";
}

+ (id)parameters
{
  unsigned int v2 = [a1 isAppleInternal];
  CFStringRef v3 = @" [-c] [-m]";
  if (!v2) {
    CFStringRef v3 = &stru_1000359E8;
  }
  return +[NSString stringWithFormat:@"[-o <outputfile>] [-l <librarypath>] [-s] [-S] [-t] [-d|-D] [-O] [-f <feature>] [-a <annotation>]%@%@", v3, &stru_1000359E8];
}

+ (id)help
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"%@\n\t%@", @"-o <outputfile>", @"save diagnostic to a specific file."];
  [v3 appendString:@"\n"];
  [v3 appendFormat:@"%@\n\t%@", @"-l <librarypath>", @"copy information from the library at path."];
  [v3 appendString:@"\n"];
  [v3 appendFormat:@"%@\n\t%@", @"-i", @"interactively chose the library to copy information from"];
  [v3 appendString:@"\n"];
  [v3 appendFormat:@"%@\n\t%@", @"-r <regexp>", @"automatically pick the first library matching the expression"];
  [v3 appendString:@"\n"];
  [v3 appendFormat:@"%@\n\t%@", @"-b <bundleid>", @"choose the library path using the bundle ID that matches a library container identifier"];
  [v3 appendString:@"\n"];
  [v3 appendFormat:@"%@\n\t%@", @"-S", @"skip appending auto suffix to specified diagnostic file."];
  [v3 appendString:@"\n"];
  [v3 appendFormat:@"%@\n\t%@", @"-s", @"skip sysdiagnose phase."];
  [v3 appendString:@"\n"];
  [v3 appendFormat:@"%@\n\t%@", @"-L", @"request sysdiagnose collect a full logarchive."];
  [v3 appendString:@"\n"];
  [v3 appendFormat:@"%@\n\t%@", @"-t", @"time-out long operations."];
  [v3 appendString:@"\n"];
  [v3 appendFormat:@"%@\n\t%@", @"-O", @"do not strip OCR data from the database."];
  [v3 appendString:@"\n"];
  [v3 appendFormat:@"%@\n\t%@", @"-P", @"run library preprocessing."];
  [v3 appendString:@"\n"];
  [v3 appendFormat:@"%@\n\t%@", @"-d/-D", @"skip database copying. (-d for databases bigger than 1200 MB, -D always)"];
  [v3 appendString:@"\n"];
  v4 = [a1 supportedFeatureAreas];
  v5 = [v4 componentsJoinedByString:@"\n\t"];
  [v3 appendFormat:@"%@\n\t%@\n\t(supported values: %@)", @"-f <feature>", @"capture additional diagnostics for the specified feature area.", v5];

  [v3 appendString:@"\n"];
  [v3 appendFormat:@"%@\n\t%@", @"-a <annotation>", @"annotate output file name (e.g. downloader), ignored if -o used."];
  if ([a1 isAppleInternal])
  {
    [v3 appendString:@"\n"];
    [v3 appendFormat:@"%@\n\t%@", @"-c", @"do not display consent prompt."];
    [v3 appendString:@"\n"];
    [v3 appendFormat:@"%@\n\t%@", @"-m", @"include story diagnostics."];
  }
  [v3 appendString:@"\n"];
  [v3 appendFormat:@"%@\n\t%@", @"-n", @"do not automatically include System Photo Library and Syndication library"];
  return v3;
}

- (BOOL)parseCommandOptionsWithArgc:(int)a3 argv:(char *)a4
{
  v7 = [(CPLCTLCommand *)self defaultLibraryURL];
  v8 = [v7 path];
  p_libraryPath = &self->_libraryPath;
  libraryPath = self->_libraryPath;
  self->_libraryPath = v8;

  unsigned __int8 v11 = [(id)objc_opt_class() isAppleInternal];
  self->_isAppleInternal = v11;
  self->_hasFullShellCommands = v11;
  self->_isRoot = geteuid() == 0;
  self->_optionalTimeOut = 0;
  self->_skipDBCopy = 0;
  self->_skipBigDBCopy = 0;
  self->_skipLibraryPreprocessing = 1;
  self->_noAutoSuffix = 0;
  self->_displayConsent = 1;
  self->_copyRecoverJournals = 1;
  v12 = getenv("CPLCTL_PHOTOSCTL");
  v13 = &CFDictionaryGetTypeID_ptr;
  if (v12)
  {
    v14 = +[NSString stringWithUTF8String:v12];
  }
  else
  {
    v14 = @"/usr/local/bin/photosctl";
  }
  objc_storeStrong((id *)&self->_photosctlCommand, v14);
  if (v12) {

  }
  self->_includeStoryDiagnostics = 0;
  v15 = +[NSDate date];
  id v16 = objc_alloc_init((Class)NSDateFormatter);
  [v16 setDateFormat:@"yyyyMMdd-HHmmss"];
  v17 = +[NSLocale localeWithLocaleIdentifier:@"en_US"];
  [v16 setLocale:v17];

  v18 = [v16 stringFromDate:v15];
  timestamp = self->_timestamp;
  self->_timestamp = v18;

  optreset = 1;
  optind = 1;
  int v20 = getopt(a3, a4, "o:l:tdDa:f:LcsSOmPir:nb:") << 24;
  if (v20 != -16777216)
  {
    id v81 = v16;
    v80 = (void *)CPLDiagnosticsInProgressPrefix;
    uint64_t v21 = 1;
    do
    {
      uint64_t v22 = v21;
      uint64_t v21 = 0;
      switch(v20 >> 24)
      {
        case 'D':
          uint64_t v23 = 449;
          goto LABEL_41;
        case 'L':
          uint64_t v23 = 475;
          goto LABEL_41;
        case 'O':
          uint64_t v23 = 479;
          goto LABEL_41;
        case 'P':
          uint64_t v24 = 451;
          goto LABEL_20;
        case 'S':
          uint64_t v23 = 477;
          goto LABEL_41;
        case 'a':
          v25 = +[NSFileManager defaultManager];
          v26 = [v25 stringWithFileSystemRepresentation:optarg length:strlen(optarg)];

          if ([v26 length])
          {
            v27 = [v13[291] stringWithFormat:@"-%@", v26];
            annotation = self->_annotation;
            self->_annotation = v27;
          }
          else
          {
            uint64_t v22 = 0;
          }

          uint64_t v21 = v22;
          break;
        case 'b':
          if (*p_libraryPath)
          {
            v29 = self;
            CFStringRef v30 = @"-l cannot be used with -b";
            goto LABEL_29;
          }
          v49 = [v13[291] stringWithCString:optarg encoding:4];
          uint64_t v50 = [(CPLDiagnoseCommand *)self _determineLibraryPathFromDiagnoseBundleIdentifier:v49];
          v51 = *p_libraryPath;
          *p_libraryPath = (NSString *)v50;

          uint64_t v21 = (*p_libraryPath != 0) & v22;
          break;
        case 'c':
          if (![(id)objc_opt_class() isAppleInternal]) {
            goto LABEL_42;
          }
          uint64_t v24 = 478;
LABEL_20:
          *((unsigned char *)&self->super.super.isa + v24) = 0;
          goto LABEL_42;
        case 'd':
          uint64_t v23 = 450;
          goto LABEL_41;
        case 'f':
          v31 = [v13[291] stringWithCString:optarg encoding:4];
          v32 = [v31 lowercaseString];

          v33 = [(id)objc_opt_class() supportedFeatureAreas];
          unsigned int v34 = [v33 containsObject:v32];

          if (v34)
          {
            featureAreas = self->_featureAreas;
            if (featureAreas)
            {
              [(NSArray *)featureAreas arrayByAddingObject:v32];
            }
            else
            {
              v87 = v32;
              +[NSArray arrayWithObjects:&v87 count:1];
            }
            v36 = (NSArray *)objc_claimAutoreleasedReturnValue();
            v65 = self->_featureAreas;
            self->_featureAreas = v36;
          }
          else
          {
            [(CPLCTLCommand *)self printFormat:@"Invalid feature area: %@", v32];
            uint64_t v22 = 0;
          }
          goto LABEL_65;
        case 'i':
          uint64_t v23 = 138;
          goto LABEL_41;
        case 'j':
          self->_copyRecoverJournals = 1;
          [(CPLCTLCommand *)self printFormat:@"-j is no longer a required option to capture rebuild journals"];
          goto LABEL_42;
        case 'l':
          if (!*p_libraryPath)
          {
            v52 = +[NSFileManager defaultManager];
            v32 = [v52 stringWithFileSystemRepresentation:optarg length:strlen(optarg)];

            if ([v32 length])
            {
              unsigned __int8 v84 = 0;
              v53 = +[NSFileManager defaultManager];
              unsigned int v54 = [v53 fileExistsAtPath:v32 isDirectory:&v84];
              int v55 = v84;

              BOOL v56 = !v54 || v55 == 0;
              p_libraryPath = &self->_libraryPath;
              if (!v56) {
                objc_storeStrong((id *)&self->_libraryPath, v32);
              }
            }
            if (!*p_libraryPath)
            {
              [(CPLCTLCommand *)self printFormat:@"Invalid library path"];
              uint64_t v22 = 0;
            }
LABEL_65:

            uint64_t v21 = v22;
            goto LABEL_66;
          }
          v29 = self;
          CFStringRef v30 = @"-l used twice";
LABEL_29:
          [(CPLCTLCommand *)v29 printFormat:v30];
          uint64_t v21 = 0;
          break;
        case 'm':
          uint64_t v23 = 480;
          goto LABEL_41;
        case 'n':
          uint64_t v23 = 154;
          goto LABEL_41;
        case 'o':
          v37 = +[NSFileManager defaultManager];
          v38 = [v37 stringWithFileSystemRepresentation:optarg length:strlen(optarg)];

          if ([v38 length])
          {
            v39 = [v38 lastPathComponent];
            v79 = v39;
            if (self->_noAutoSuffix)
            {
              v40 = [v39 stringByDeletingPathExtension];
              [v80 stringByAppendingString:v40];
            }
            else
            {
              v57 = [v39 stringByDeletingPathExtension];
              v40 = +[NSString stringWithFormat:@"%@%@-T%@", v80, v57, self->_timestamp];

              [v40 stringByAppendingPathExtension:@"cpldiagnostics"];
            v58 = };

            v59 = +[NSURL fileURLWithPath:@"/var/tmp" isDirectory:1];
            v60 = [v59 URLByAppendingPathComponent:v58 isDirectory:1];
            outputFolder = self->_outputFolder;
            self->_outputFolder = v60;

            v62 = +[NSURL fileURLWithPath:v38 isDirectory:0];
            outputFile = self->_outputFile;
            self->_outputFile = v62;

            v13 = &CFDictionaryGetTypeID_ptr;
          }
          else
          {
            uint64_t v22 = 0;
          }

          uint64_t v21 = v22;
          p_libraryPath = &self->_libraryPath;
          break;
        case 'p':
          goto LABEL_38;
        case 'r':
          id v41 = objc_alloc((Class)v13[291]);
          id v42 = [v41 initWithUTF8String:optarg];
          if (v42)
          {
            v43 = v42;
            id v44 = objc_alloc((Class)NSRegularExpression);
            id v83 = 0;
            v45 = (NSRegularExpression *)[v44 initWithPattern:v43 options:0 error:&v83];
            id v46 = v83;
            v47 = v46;
            if (v45)
            {
              libraryFilterRegExp = self->_libraryFilterRegExp;
              self->_libraryFilterRegExp = v45;

              p_libraryPath = &self->_libraryPath;
              v13 = &CFDictionaryGetTypeID_ptr;
LABEL_38:
              uint64_t v23 = 152;
LABEL_41:
              *((unsigned char *)&self->super.super.isa + v23) = 1;
LABEL_42:
              uint64_t v21 = v22;
            }
            else
            {
              v64 = [v46 localizedDescription];
              [(CPLCTLCommand *)self printFormat:@"Invalid pattern: %@", v64];

              uint64_t v21 = 0;
              p_libraryPath = &self->_libraryPath;
              v13 = &CFDictionaryGetTypeID_ptr;
            }
          }
          else
          {
            [(CPLCTLCommand *)self printFormat:@"Invalid pattern"];
            uint64_t v21 = 0;
LABEL_66:
            v13 = &CFDictionaryGetTypeID_ptr;
          }
          break;
        case 's':
          uint64_t v23 = 474;
          goto LABEL_41;
        case 't':
          uint64_t v23 = 448;
          goto LABEL_41;
        default:
          break;
      }
      int v20 = getopt(a3, a4, "o:l:tdDa:f:LcsSOmPir:nb:") << 24;
    }
    while (v20 != -16777216);
    id v16 = v81;
    if ((v21 & 1) == 0) {
      goto LABEL_83;
    }
  }
  if (*p_libraryPath)
  {
    if (!self->_pickInteractively && !self->_libraryFilterRegExp) {
      goto LABEL_80;
    }
  }
  else if (!self->_pickInteractively || !self->_libraryFilterRegExp)
  {
    LODWORD(v66) = 1;
    goto LABEL_77;
  }
  [(CPLCTLCommand *)self printFormat:@"-l, -i and -r are mutually exclusive"];
  v66 = *p_libraryPath;
  if (*p_libraryPath)
  {
LABEL_83:
    id v71 = [(id)objc_opt_class() toolName];
    [(CPLCTLCommand *)self printFormat:@"Invalid parameters for %@", v71];
    BOOL v72 = 0;
    goto LABEL_84;
  }
LABEL_77:
  if (self->_noAutoIncludeSPLAndSyndication)
  {
    [(CPLCTLCommand *)self printFormat:@"-l or -b are required if -n is specified"];
    goto LABEL_83;
  }
  if (!v66) {
    goto LABEL_83;
  }
LABEL_80:
  v67 = +[NSFileManager defaultManager];
  v68 = [v67 attributesOfItemAtPath:@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/photos" error:0];

  if (v68
    && ([v68 fileOwnerAccountID],
        v69 = objc_claimAutoreleasedReturnValue(),
        unsigned int v70 = [v69 intValue],
        v69,
        !v70))
  {
    v74 = v15;
    v75 = +[NSFileManager defaultManager];
    NSFileAttributeKey v85 = NSFileOwnerAccountName;
    CFStringRef v86 = @"mobile";
    v76 = +[NSDictionary dictionaryWithObjects:&v86 forKeys:&v85 count:1];
    id v82 = 0;
    unsigned __int8 v77 = [v75 setAttributes:v76 ofItemAtPath:@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/photos" error:&v82];
    id v71 = v82;

    if ((v77 & 1) == 0)
    {
      v78 = [v71 localizedDescription];
      [(CPLCTLCommand *)self printFormat:@"Failed to repair output folder ownership: %@", v78];
    }
    v15 = v74;
  }
  else
  {
    id v71 = 0;
  }

  BOOL v72 = 1;
LABEL_84:

  return v72;
}

- (id)_determineLibraryPathFromDiagnoseBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v23 = 0;
  v5 = [(CPLCTLCommand *)self getLibraryIdentifiersWithDomain:3 error:&v23];
  id v6 = v23;
  v7 = v6;
  if (v5)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v9)
    {
      id v10 = v9;
      v18 = v7;
      uint64_t v11 = *(void *)v20;
      v12 = @"/var/mobile/Media";
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v15 = [v14 containerIdentifier];
          id v16 = [v15 caseInsensitiveCompare:v4];

          if (!v16)
          {
            v12 = [v14 path];
            goto LABEL_12;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v10) {
          continue;
        }
        break;
      }
LABEL_12:
      v7 = v18;
    }
    else
    {
      v12 = @"/var/mobile/Media";
    }
  }
  else
  {
    id v8 = [v6 localizedDescription];
    [(CPLCTLCommand *)self printFormat:@"Failed to get the list of active libraries: %@", v8];
    v12 = 0;
  }

  return v12;
}

+ (BOOL)ignoreInCPLStore
{
  return 1;
}

- (BOOL)includeSPL
{
  return self->_targetLibraryIsSPL || !self->_noAutoIncludeSPLAndSyndication;
}

- (BOOL)includeSyndication
{
  return self->_targetLibraryIsSyndication || !self->_noAutoIncludeSPLAndSyndication;
}

- (id)_simplifiedPathForURL:(id)a3
{
  id v3 = [a3 path];
  if ([v3 hasPrefix:@"/var/mobile/Library/Logs/"])
  {
    id v4 = [v3 substringFromIndex:objc_msgSend(@"/var/mobile/Library/Logs/", "length")];
    uint64_t v5 = +[NSString stringWithFormat:@".../%@", v4];

    id v3 = (void *)v5;
  }
  return v3;
}

- (id)_abbreviatedPathForURL:(id)a3
{
  id v3 = [a3 path];
  if ([v3 hasPrefix:@"/private/"])
  {
    uint64_t v4 = [v3 substringFromIndex:objc_msgSend(@"/private", "length")];

    id v3 = (void *)v4;
  }
  if ([v3 hasPrefix:@"/var/mobile/"])
  {
    uint64_t v5 = [v3 substringFromIndex:objc_msgSend(@"/var/mobile/", "length")];
    uint64_t v6 = +[NSString stringWithFormat:@"~mobile/%@", v5];

    id v3 = (void *)v6;
  }
  return v3;
}

- (id)_libraryURLFromWrapperStatus:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 parameters];
  uint64_t v5 = [v4 libraryIdentifier];
  unsigned __int8 v6 = [v5 isEqualToString:CPLLibraryIdentifierSystemLibrary];

  if (v6)
  {
LABEL_6:
    id v8 = 0;
  }
  else
  {
    v7 = [v3 parameters];
    id v8 = [v7 clientLibraryBaseURL];

    while (1)
    {
      id v9 = [v8 pathExtension];
      unsigned __int8 v10 = [v9 isEqualToString:@"photoslibrary"];

      if (v10) {
        break;
      }
      uint64_t v11 = [v8 URLByDeletingLastPathComponent];

      v12 = [v11 path];
      unsigned int v13 = [v12 isEqualToString:@"/"];

      id v8 = v11;
      if (v13)
      {

        goto LABEL_6;
      }
    }
  }

  return v8;
}

- (void)_diagnoseWithCPLLibraryIdentifier:(id)a3
{
  id v4 = a3;
  if (v4 && ([v4 isEqualToString:CPLLibraryIdentifierSystemLibrary] & 1) == 0)
  {
    uint64_t v5 = CPLContainerIdentifierForLibraryIdentifier();
    annotation = self->_annotation;
    id v7 = objc_alloc((Class)NSString);
    if (annotation) {
      id v8 = (NSString *)[v7 initWithFormat:@"-%@%@", v5, self->_annotation];
    }
    else {
      id v8 = (NSString *)[v7 initWithFormat:@"-%@", v5, v10];
    }
    id v9 = self->_annotation;
    self->_annotation = v8;
  }
  _objc_release_x1();
}

- (void)_diagnoseLibraryWrapperStatus:(id)a3
{
  id v4 = a3;
  id v12 = [(CPLDiagnoseCommand *)self _libraryURLFromWrapperStatus:v4];
  if (v12)
  {
    uint64_t v5 = [v4 parameters];
    unsigned __int8 v6 = [v5 libraryIdentifier];
    [(CPLCTLCommand *)self printFormat:@"Will diagnose library with CPL identifier %@", v6];

    id v7 = [(CPLDiagnoseCommand *)self _abbreviatedPathForURL:v12];
    [(CPLCTLCommand *)self printFormat:@"  path: %@", v7];

    id v8 = [v12 path];
    libraryPath = self->_libraryPath;
    self->_libraryPath = v8;
  }
  else
  {
    [(CPLCTLCommand *)self printFormat:@"Will diagnose the System library"];
  }
  uint64_t v10 = [v4 parameters];

  uint64_t v11 = [v10 libraryIdentifier];
  [(CPLDiagnoseCommand *)self _diagnoseWithCPLLibraryIdentifier:v11];

  [(CPLCTLCommand *)self printFormat:@"============================"];
}

- (id)_goodNameForLibraryIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [v3 path];

  if (v4)
  {
    uint64_t v5 = [v3 name];
    unsigned __int8 v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [v3 containerIdentifier];
    }
    id v8 = v7;
  }
  else
  {
    id v8 = @"System Library";
  }

  return v8;
}

- (void)_diagnoseLibraryIdentifier:(id)a3
{
  id v15 = a3;
  id v4 = [v15 path];
  if (v4)
  {
    id v5 = [objc_alloc((Class)NSURL) initFileURLWithPath:v4 isDirectory:1];
    unsigned __int8 v6 = [(CPLDiagnoseCommand *)self _goodNameForLibraryIdentifier:v15];
    if (v6)
    {
      id v7 = [v15 uuid];
      [(CPLCTLCommand *)self printFormat:@"Will diagnose library %@ (%@)", v6, v7];

      id v8 = [(CPLDiagnoseCommand *)self _abbreviatedPathForURL:v5];
      [(CPLCTLCommand *)self printFormat:@"  path: %@", v8];
    }
    else
    {
      id v8 = [(CPLDiagnoseCommand *)self _abbreviatedPathForURL:v5];
      [(CPLCTLCommand *)self printFormat:@"Will diagnose library at %@", v8];
    }

    objc_storeStrong((id *)&self->_libraryPath, v4);
    if (v6)
    {
      id v9 = [v6 stringByReplacingOccurrencesOfString:@"/" withString:@":"];

      annotation = self->_annotation;
      id v11 = objc_alloc((Class)NSString);
      if (annotation) {
        id v12 = (NSString *)[v11 initWithFormat:@"-%@%@", v9, self->_annotation];
      }
      else {
        id v12 = (NSString *)[v11 initWithFormat:@"-%@", v9, v14];
      }
      unsigned int v13 = self->_annotation;
      self->_annotation = v12;
    }
  }
  else
  {
    [(CPLCTLCommand *)self printFormat:@"Will diagnose the System Library"];
  }
  [(CPLCTLCommand *)self printFormat:@"============================"];
}

- (BOOL)_url:(id)a3 existsInFileIdentifiersAddIfNot:(id)a4
{
  id v5 = a4;
  id v12 = 0;
  unsigned int v6 = [a3 getResourceValue:&v12 forKey:NSURLFileIdentifierKey error:0];
  id v7 = v12;
  id v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    goto LABEL_8;
  }
  if (([v5 containsObject:v7] & 1) == 0)
  {
    [v5 addObject:v8];
LABEL_8:
    BOOL v10 = 0;
    goto LABEL_9;
  }
  BOOL v10 = 1;
LABEL_9:

  return v10;
}

- (BOOL)_path:(id)a3 existsInFileIdentifiersAddIfNot:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)NSURL) initFileURLWithPath:v7];

  LOBYTE(v7) = [(CPLDiagnoseCommand *)self _url:v8 existsInFileIdentifiersAddIfNot:v6];
  return (char)v7;
}

- (BOOL)_chooseLibraryInteractively
{
  id v87 = 0;
  id v3 = [(CPLDiagnoseCommand *)self getEngineWrapperStatusesWithError:&v87];
  id v4 = v87;
  id v5 = v4;
  if (v3)
  {
    if ([v3 count])
    {
      id v71 = objc_alloc_init((Class)NSMutableArray);
      id v67 = objc_alloc_init((Class)NSMutableSet);
      id v86 = v5;
      id v6 = [(CPLCTLCommand *)self getLibraryIdentifiersWithDomain:3 error:&v86];
      id v7 = v86;

      v62 = v6;
      v63 = v3;
      id v61 = v7;
      if (v6)
      {
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        id v8 = v6;
        id v9 = [v8 countByEnumeratingWithState:&v82 objects:v90 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v83;
          do
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v83 != v11) {
                objc_enumerationMutation(v8);
              }
              unsigned int v13 = *(void **)(*((void *)&v82 + 1) + 8 * i);
              uint64_t v14 = [v13 path];
              id v15 = v14;
              if (v14)
              {
                id v16 = [v14 pathExtension];
                if ([v16 isEqualToString:@"photoslibrary"])
                {
                  unsigned __int8 v17 = [(CPLDiagnoseCommand *)self _path:v15 existsInFileIdentifiersAddIfNot:v67];

                  if ((v17 & 1) == 0) {
                    [v71 addObject:v13];
                  }
                }
                else
                {
                }
              }
            }
            id v10 = [v8 countByEnumeratingWithState:&v82 objects:v90 count:16];
          }
          while (v10);
          id v3 = v63;
        }
      }
      else
      {
        id v8 = [v7 localizedDescription];
        [(CPLCTLCommand *)self printFormat:@"WARNING: failed to get libraries from Photos daemon: %@", v8];
      }

      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      id obj = v3;
      id v21 = [obj countByEnumeratingWithState:&v78 objects:v89 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v79;
        uint64_t v24 = CPLLibraryIdentifierSystemLibrary;
        do
        {
          for (j = 0; j != v22; j = (char *)j + 1)
          {
            if (*(void *)v79 != v23) {
              objc_enumerationMutation(obj);
            }
            v26 = *(void **)(*((void *)&v78 + 1) + 8 * (void)j);
            v27 = [(CPLDiagnoseCommand *)self _libraryURLFromWrapperStatus:v26];
            v28 = [v26 parameters];
            v29 = [v28 libraryIdentifier];
            unsigned int v30 = [v29 isEqualToString:v24];

            if (v30)
            {
              [v71 insertObject:v26 atIndex:0];
            }
            else if (v27 {
                   && ![(CPLDiagnoseCommand *)self _url:v27 existsInFileIdentifiersAddIfNot:v67])
            }
            {
              [v71 addObject:v26];
            }
          }
          id v22 = [obj countByEnumeratingWithState:&v78 objects:v89 count:16];
        }
        while (v22);
      }

      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v66 = v71;
      id v31 = [v66 countByEnumeratingWithState:&v74 objects:v88 count:16];
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = 0;
        id obja = *(id *)v75;
        uint64_t v64 = CPLLibraryIdentifierSystemLibrary;
        do
        {
          unsigned int v34 = 0;
          uint64_t v65 = v33;
          do
          {
            if (*(id *)v75 != obja) {
              objc_enumerationMutation(v66);
            }
            v35 = *(void **)(*((void *)&v74 + 1) + 8 * (void)v34);
            objc_opt_class();
            BOOL v72 = v35;
            if (objc_opt_isKindOfClass())
            {
              id v36 = v35;
              uint64_t v37 = [v36 path];
              if (!v37) {
                sub_1000208EC();
              }
              v38 = (void *)v37;
              id v39 = [objc_alloc((Class)NSURL) initFileURLWithPath:v37 isDirectory:1];
              v68 = [(CPLDiagnoseCommand *)self _goodNameForLibraryIdentifier:v36];
              v40 = [v36 uuid];
              uint64_t v41 = [v36 userDescription];
              id v42 = (void *)v41;
              uint64_t v43 = (uint64_t)v34 + v33 + 1;
              id v44 = v32;
              if (v41) {
                CFStringRef v45 = (const __CFString *)v41;
              }
              else {
                CFStringRef v45 = @"(no description)";
              }
              id v46 = [(CPLDiagnoseCommand *)self _abbreviatedPathForURL:v39];
              CFStringRef v60 = v45;
              id v32 = v44;
              v47 = v39;
              [(CPLCTLCommand *)self printFormat:@"%d %@ %@ %@ (from Photos)\n  in %@"], v43, v68, v40, v60, v46);

              uint64_t v33 = v65;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                sub_100020918();
              }
              uint64_t v48 = (uint64_t)v34 + v33 + 1;
              id v49 = v35;
              uint64_t v50 = [v49 parameters];
              v51 = [v50 libraryIdentifier];
              unsigned int v52 = [v51 isEqualToString:v64];

              if (v52)
              {
                v38 = [v49 parameters];
                v47 = [v38 libraryIdentifier];
                [(CPLCTLCommand *)self printFormat:@"%d %@ (from CPL)"], v48, v47);
              }
              else
              {
                v38 = [(CPLDiagnoseCommand *)self _libraryURLFromWrapperStatus:v49];
                v47 = [v49 parameters];
                v53 = [v47 libraryIdentifier];
                unsigned int v54 = [(CPLDiagnoseCommand *)self _abbreviatedPathForURL:v38];
                [(CPLCTLCommand *)self printFormat:@"%d %@ (from CPL)\n  in %@"], v48, v53, v54);
              }
            }

            unsigned int v34 = (char *)v34 + 1;
          }
          while (v32 != v34);
          id v32 = [v66 countByEnumeratingWithState:&v74 objects:v88 count:16];
          uint64_t v33 = (v33 + v34);
        }
        while (v32);
      }

      [(CPLCTLCommand *)self put:@"Pick a library: "];
      if (fgets(v73, 5, __stdinp))
      {
        int v55 = atoi(v73);
        uint64_t v56 = (v55 - 1);
        v57 = v62;
        if (v55 >= 1 && (unint64_t)[v66 count] >= v55)
        {
          [(CPLCTLCommand *)self endLine];
          v59 = [v66 objectAtIndexedSubscript:v56];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [(CPLDiagnoseCommand *)self _diagnoseLibraryWrapperStatus:v59];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              sub_1000208C0();
            }
            [(CPLDiagnoseCommand *)self _diagnoseLibraryIdentifier:v59];
          }
          id v3 = v63;
          long long v20 = v61;

          BOOL v19 = 1;
          goto LABEL_56;
        }
        [(CPLCTLCommand *)self printFormat:@"Invalid choice"];
        BOOL v19 = 0;
        id v3 = v63;
      }
      else
      {
        BOOL v19 = 0;
        v57 = v62;
        id v3 = v63;
      }
      long long v20 = v61;
LABEL_56:

      goto LABEL_57;
    }
    [(CPLCTLCommand *)self printFormat:@"No engines are registered"];
  }
  else
  {
    v18 = [v4 localizedDescription];
    [(CPLCTLCommand *)self printFormat:@"Failed to get the list of registered engines: %@", v18];
  }
  BOOL v19 = 0;
  long long v20 = v5;
LABEL_57:

  return v19;
}

- (BOOL)_wrapperStatusMatchesLibraryFilterRegExp:(id)a3
{
  id v4 = [a3 parameters];
  id v5 = [v4 libraryIdentifier];
  id v6 = -[NSRegularExpression firstMatchInString:options:range:](self->_libraryFilterRegExp, "firstMatchInString:options:range:", v5, 0, 0, [v5 length]);

  if (v6
    || ([v4 mainScopeIdentifier],
        id v7 = objc_claimAutoreleasedReturnValue(),
        -[NSRegularExpression firstMatchInString:options:range:](self->_libraryFilterRegExp, "firstMatchInString:options:range:", v7, 0, 0, [v7 length]), id v8 = objc_claimAutoreleasedReturnValue(), v8, v7, v8))
  {
    BOOL v9 = 1;
  }
  else
  {
    uint64_t v11 = [v4 clientLibraryBaseURL];
    id v12 = [v11 path];

    unsigned int v13 = -[NSRegularExpression firstMatchInString:options:range:](self->_libraryFilterRegExp, "firstMatchInString:options:range:", v12, 0, 0, [v12 length]);

    BOOL v9 = v13 != 0;
  }

  return v9;
}

- (BOOL)_libraryIdentifierMatchesLibraryFilterRegExp:(id)a3
{
  id v4 = a3;
  id v5 = [v4 name];
  id v6 = -[NSRegularExpression firstMatchInString:options:range:](self->_libraryFilterRegExp, "firstMatchInString:options:range:", v5, 0, 0, [v5 length]);

  if (v6) {
    goto LABEL_4;
  }
  id v7 = [v4 containerIdentifier];
  id v8 = -[NSRegularExpression firstMatchInString:options:range:](self->_libraryFilterRegExp, "firstMatchInString:options:range:", v7, 0, 0, [v7 length]);

  if (v8
    || ([v4 uuid],
        BOOL v9 = objc_claimAutoreleasedReturnValue(),
        -[NSRegularExpression firstMatchInString:options:range:](self->_libraryFilterRegExp, "firstMatchInString:options:range:", v9, 0, 0, [v9 length]), id v10 = objc_claimAutoreleasedReturnValue(), v10, v9, v10))
  {
LABEL_4:
    BOOL v11 = 1;
  }
  else
  {
    unsigned int v13 = [v4 path];
    uint64_t v14 = -[NSRegularExpression firstMatchInString:options:range:](self->_libraryFilterRegExp, "firstMatchInString:options:range:", v13, 0, 0, [v13 length]);

    BOOL v11 = v14 != 0;
  }

  return v11;
}

- (BOOL)_lookForLibrary
{
  if (!self->_libraryFilterRegExp) {
    sub_100020944();
  }
  id v36 = 0;
  id v3 = [(CPLDiagnoseCommand *)self getEngineWrapperStatusesWithError:&v36];
  id v4 = v36;
  id v5 = v4;
  if (v3)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v6 = v3;
    id v7 = [v6 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v33;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          if ([(CPLDiagnoseCommand *)self _wrapperStatusMatchesLibraryFilterRegExp:v11])
          {
            [(CPLDiagnoseCommand *)self _diagnoseLibraryWrapperStatus:v11];
            BOOL v23 = 1;
            goto LABEL_25;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v32 objects:v38 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v31 = v5;
    id v6 = [(CPLCTLCommand *)self getLibraryIdentifiersWithDomain:3 error:&v31];
    id v12 = v31;

    if (v6)
    {
      id v25 = v12;
      v26 = v3;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v13 = v6;
      id v14 = [v13 countByEnumeratingWithState:&v27 objects:v37 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v28;
        while (2)
        {
          for (j = 0; j != v15; j = (char *)j + 1)
          {
            if (*(void *)v28 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v27 + 1) + 8 * (void)j);
            BOOL v19 = [v18 path];
            long long v20 = v19;
            if (v19)
            {
              id v21 = [v19 pathExtension];
              unsigned int v22 = [v21 isEqualToString:@"photoslibrary"];

              if (v22)
              {
                if ([(CPLDiagnoseCommand *)self _libraryIdentifierMatchesLibraryFilterRegExp:v18])
                {
                  [(CPLDiagnoseCommand *)self _diagnoseLibraryIdentifier:v18];

                  BOOL v23 = 1;
                  goto LABEL_28;
                }
              }
            }
          }
          id v15 = [v13 countByEnumeratingWithState:&v27 objects:v37 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

      id v13 = [(NSRegularExpression *)self->_libraryFilterRegExp pattern];
      [(CPLCTLCommand *)self printFormat:@"Found no libraries matching '%@'", v13];
      BOOL v23 = 0;
LABEL_28:
      id v12 = v25;
      id v3 = v26;
    }
    else
    {
      id v13 = [v12 localizedDescription];
      [(CPLCTLCommand *)self printFormat:@"Failed to get the list of active libraries: %@", v13];
      BOOL v23 = 0;
    }
  }
  else
  {
    id v6 = [v4 localizedDescription];
    [(CPLCTLCommand *)self printFormat:@"Failed to get the list of registered engines: %@", v6];
    BOOL v23 = 0;
LABEL_25:
    id v12 = v5;
  }

  return v23;
}

- (int)execute
{
  if (self->_skipSysdiagnose
    || !+[Libsysdiagnose isSysdiagnoseInProgressWithError:0])
  {
    id v4 = [(CPLCTLCommand *)self defaultLibraryURL];

    if (v4)
    {
      id v5 = [(CPLCTLCommand *)self defaultLibraryIdentifier];
      [(CPLCTLCommand *)self printFormat:@"Will diagnose library with CPL identifier %@", v5];

      id v6 = [(CPLCTLCommand *)self defaultLibraryURL];
      id v7 = [(CPLDiagnoseCommand *)self _abbreviatedPathForURL:v6];
      [(CPLCTLCommand *)self printFormat:@"  path: %@", v7];

      id v8 = [(CPLCTLCommand *)self defaultLibraryIdentifier];
      [(CPLDiagnoseCommand *)self _diagnoseWithCPLLibraryIdentifier:v8];
    }
    else
    {
      if (self->_pickInteractively)
      {
        uint64_t v9 = [(CPLCTLCommand *)self daemonConnection];
        if (![(CPLDiagnoseCommand *)self _chooseLibraryInteractively]) {
          goto LABEL_37;
        }
        goto LABEL_7;
      }
      if (self->_libraryFilterRegExp)
      {
        uint64_t v9 = [(CPLCTLCommand *)self daemonConnection];
        if (![(CPLDiagnoseCommand *)self _lookForLibrary]) {
          goto LABEL_37;
        }
        goto LABEL_7;
      }
    }
    uint64_t v9 = 0;
LABEL_7:
    if (self->_displayConsent && isatty(1)) {
      [(CPLDiagnoseCommand *)self displayConsent];
    }
    [(CPLDiagnoseCommand *)self prepareOutputURLs];
    if (self->_isRoot)
    {
      id v10 = +[NSDate date];
      uint64_t v11 = +[NSMutableArray arrayWithCapacity:10];
      incompleteTasks = self->incompleteTasks;
      self->incompleteTasks = v11;

      id v13 = [(CPLDiagnoseCommand *)self _simplifiedPathForURL:self->_outputFolder];
      [(CPLCTLCommand *)self printFormat:@"Will gather diagnostics in %@", v13];

      if ([(CPLDiagnoseCommand *)self createBaseFolderAndLogFile])
      {
        if (self->_isAppleInternal) {
          CFStringRef v14 = @" internal";
        }
        else {
          CFStringRef v14 = &stru_1000359E8;
        }
        if (self->_hasFullShellCommands) {
          CFStringRef v15 = &stru_1000359E8;
        }
        else {
          CFStringRef v15 = @" limited";
        }
        uint64_t v16 = __CPLVersion();
        [(CPLCTLCommand *)self printFormat:@"Starting%@ diagnostic - Installed CPL is %@%@", v14, v15, v16];

        unsigned __int8 v17 = +[CPLDateFormatter stringFromDate:v10];
        v18 = +[NSTimeZone defaultTimeZone];
        BOOL v19 = [v18 name];
        [(CPLCTLCommand *)self printFormat:@"Date: %@ (%@)", v17, v19];

        [(CPLDiagnoseCommand *)self startDiagnostic];
        [(CPLCTLCommand *)self printFormat:@"- Waiting for unfinished tasks if necessary"];
        if (!+[CPLTask waitForAllLongTasksToFinish]) {
          [(CPLCTLCommand *)self printFormat:@"  Some diagnostic tasks did not finish!"];
        }
        [v10 timeIntervalSinceNow];
        [(CPLCTLCommand *)self printFormat:@"(TOTAL elapsed time minus archiving: %.2fs)\n", fabs(v20)];
        if ([(NSMutableArray *)self->incompleteTasks count])
        {
          [(CPLCTLCommand *)self printFormat:@"Incomplete Tasks:\n"];
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id v21 = self->incompleteTasks;
          id v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v52 objects:v56 count:16];
          if (v22)
          {
            id v23 = v22;
            uint64_t v24 = *(void *)v53;
            do
            {
              for (i = 0; i != v23; i = (char *)i + 1)
              {
                if (*(void *)v53 != v24) {
                  objc_enumerationMutation(v21);
                }
                [(CPLCTLCommand *)self printFormat:@"   %@", *(void *)(*((void *)&v52 + 1) + 8 * i)];
              }
              id v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v52 objects:v56 count:16];
            }
            while (v23);
          }
        }
        [(CPLDiagnoseCommand *)self printDiskCapacity:@"archive"];
        v26 = [(CPLDiagnoseCommand *)self _simplifiedPathForURL:self->_outputFolder];
        long long v27 = [(CPLDiagnoseCommand *)self _simplifiedPathForURL:self->_outputFile];
        [(CPLCTLCommand *)self printFormat:@"- Archiving %@ to %@", v26, v27];

        +[NSDate timeIntervalSinceReferenceDate];
        double v29 = v28;
        long long v30 = [CPLDiagnoseArchive alloc];
        id v31 = [(NSURL *)self->_outputFile path];
        long long v32 = [(CPLDiagnoseArchive *)v30 initWithPath:v31 shouldCompress:1];

        if (v32)
        {
          long long v33 = [(NSURL *)self->_outputFolder path];
          long long v34 = [v33 lastPathComponent];
          uint64_t v35 = objc_msgSend(v34, "substringFromIndex:", objc_msgSend(CPLDiagnosticsInProgressPrefix, "length"));

          [(CPLDiagnoseArchive *)v32 addDirectoryToArchive:v33 withDirName:v35];
          [(CPLDiagnoseArchive *)v32 closeArchive];
          +[NSDate timeIntervalSinceReferenceDate];
          [(CPLCTLCommand *)self printFormat:@"  elapsed time: %.2fs", v36 - v29];

          [(CPLDiagnoseCommand *)self printDiskCapacity:@"cleanup"];
          uint64_t v37 = [(CPLDiagnoseCommand *)self _simplifiedPathForURL:self->_outputFolder];
          [(CPLCTLCommand *)self printFormat:@"- Removing %@", v37];

          v38 = +[NSFileManager defaultManager];
          outputFolder = self->_outputFolder;
          id v51 = 0;
          LOBYTE(v35) = [v38 removeItemAtURL:outputFolder error:&v51];
          id v40 = v51;

          if ((v35 & 1) == 0)
          {
            uint64_t v41 = [v40 localizedDescription];
            [(CPLCTLCommand *)self printFormat:@"  Failed: %@", v41];
          }
        }
        else
        {
          [(CPLCTLCommand *)self printFormat:@"  Failed"];
        }
        if (self->_isRoot)
        {
          [(CPLCTLCommand *)self printFormat:@"Changing owner of archive to mobile"];
          id v42 = getpwnam("mobile");
          if (v42)
          {
            gid_t pw_uid = v42->pw_uid;
            uid_t pw_gid = v42->pw_gid;
          }
          else
          {
            uid_t pw_gid = 0;
            gid_t pw_uid = 0;
          }
          if (chown([(NSURL *)self->_outputFile fileSystemRepresentation], pw_gid, pw_uid))
          {
            CFStringRef v45 = __error();
            [(CPLCTLCommand *)self printFormat:@"  Failed: %s", strerror(*v45)];
          }
          else
          {
            [(CPLCTLCommand *)self printFormat:@"  Succeeded", v50];
          }
        }
        [(CPLDiagnoseCommand *)self printDiskCapacity:@"complete"];
        [(CPLCTLCommand *)self printFormat:@"- mark output file purgeable"];
        [(CPLDiagnoseCommand *)self markPurgeable:self->_outputFile];
        id v46 = [(NSURL *)self->_outputFile path];
        [(CPLCTLCommand *)self printFormat:@"\nDiagnostic is available at %@", v46];

        [(CPLCTLCommand *)self printFormat:@"\nEnjoy."];
        [v10 timeIntervalSinceNow];
        [(CPLCTLCommand *)self printFormat:@"(TOTAL elapsed time: %.2fs)", fabs(v47)];
        diagnosticLog = self->_diagnosticLog;
        if (diagnosticLog)
        {
          fclose(diagnosticLog);
          self->_diagnosticLog = 0;
        }

        int v3 = 0;
      }
      else
      {
        int v3 = 1;
      }

      goto LABEL_54;
    }
    [(CPLCTLCommand *)self printFormat:@"********************************  WARNING  ************************************"];
    [(CPLCTLCommand *)self printFormat:@"  You need to run this tool as root in order to collect the new-style of logs."];
    [(CPLCTLCommand *)self printFormat:@"                   Please run this tool again as root."];
    [(CPLCTLCommand *)self printFormat:@"*******************************************************************************"];
LABEL_37:
    int v3 = 1;
LABEL_54:

    return v3;
  }
  [(CPLCTLCommand *)self printError:@"sysdiagnose is already in progress!"];
  [(CPLCTLCommand *)self printError:@"  run with -s to skip sysdiagnose"];
  return 1;
}

- (void)printFormat:(id)a3 arguments:(char *)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSString) initWithFormat:v6 arguments:a4];

  id v10 = v7;
  id v8 = (const char *)[v10 UTF8String];
  diagnosticLog = self->_diagnosticLog;
  if (diagnosticLog)
  {
    fprintf(diagnosticLog, "%s\n", v8);
    fflush(self->_diagnosticLog);
  }
  fprintf(__stdoutp, "%s\n", v8);
  fflush(__stdoutp);
}

- (void)printDiskCapacity:(id)a3
{
  id v4 = a3;
  v18[0] = NSURLVolumeAvailableCapacityKey;
  v18[1] = NSURLVolumeAvailableCapacityForImportantUsageKey;
  id v5 = +[NSArray arrayWithObjects:v18 count:2];
  id v6 = [(NSURL *)self->_outputFolder URLByDeletingLastPathComponent];
  id v11 = 0;
  id v7 = [v6 resourceValuesForKeys:v5 error:&v11];
  id v8 = v11;

  if (v7)
  {
    uint64_t v9 = [v7 objectForKeyedSubscript:NSURLVolumeAvailableCapacityKey];
    id v10 = [v7 objectForKeyedSubscript:NSURLVolumeAvailableCapacityForImportantUsageKey];
    [(CPLCTLCommand *)self printFormat:@"- diagnostic volume capacity=%@ importantCapacity=%@ (%@)", v9, v10, v4];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      id v13 = v9;
      __int16 v14 = 2114;
      CFStringRef v15 = v10;
      __int16 v16 = 2114;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "PhotosDiagnostic volume capacity=%{public}@ importantCapacity=%{public}@ (%{public}@)", buf, 0x20u);
    }
  }
  else
  {
    [(CPLCTLCommand *)self printError:@"Error finding disk capacity: %@", v8];
  }
}

- (BOOL)createBaseFolderAndLogFile
{
  int v3 = +[NSFileManager defaultManager];
  v22[0] = NSFilePosixPermissions;
  v22[1] = NSFileOwnerAccountName;
  v23[0] = &off_10003B370;
  v23[1] = @"mobile";
  id v4 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
  id v5 = [(NSURL *)self->_outputFile URLByDeletingLastPathComponent];
  id v21 = 0;
  unsigned __int8 v6 = [v3 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:v4 error:&v21];
  id v7 = v21;
  id v8 = v7;
  if (v6)
  {
    outputFolder = self->_outputFolder;
    id v20 = v7;
    unsigned __int8 v10 = [v3 createDirectoryAtURL:outputFolder withIntermediateDirectories:1 attributes:v4 error:&v20];
    id v11 = v20;

    if (v10)
    {
      id v12 = [(NSURL *)self->_outputFolder URLByAppendingPathComponent:@"diagnostic.log" isDirectory:0];
      id v13 = fopen((const char *)[v12 fileSystemRepresentation], "a+");
      self->_diagnosticLog = v13;
      if (v13)
      {
        [(CPLCTLCommand *)self setLogOutputFd:fileno(v13)];
      }
      else
      {
        id v17 = [(CPLDiagnoseCommand *)self _simplifiedPathForURL:v12];
        v18 = __error();
        [(CPLCTLCommand *)self printFormat:@"Can't create diagnostic log at %@: %s", v17, strerror(*v18)];
      }
      BOOL v15 = 1;
    }
    else
    {
      id v12 = [(CPLDiagnoseCommand *)self _simplifiedPathForURL:self->_outputFolder];
      __int16 v16 = [v11 localizedDescription];
      [(CPLCTLCommand *)self printFormat:@"Can't create %@: %@", v12, v16];

      BOOL v15 = 0;
    }
    id v8 = v11;
  }
  else
  {
    id v12 = [(CPLDiagnoseCommand *)self _simplifiedPathForURL:v5];
    __int16 v14 = [v8 localizedDescription];
    [(CPLCTLCommand *)self printFormat:@"Can't create %@: %@", v12, v14];

    BOOL v15 = 0;
  }

  return v15;
}

- (void)runAsUser:(id)a3
{
}

+ (BOOL)isAppleInternal
{
  if (qword_1000413E8 != -1) {
    dispatch_once(&qword_1000413E8, &stru_100035058);
  }
  return byte_1000413E0;
}

- (void)displayConsent
{
  [(CPLCTLCommand *)self printFormat:@"%@", CPLDiagnosticsConsentText];
  [(CPLCTLCommand *)self printFormat:@"Press 'Enter' to continue. Ctrl+\\ to cancel."];
  do
    int v3 = fgetc(__stdinp) << 24;
  while (v3 != 218103808 && v3 != 167772160);
}

- (id)processDetailPath:(id)a3
{
  return [@"ProcessDetail" stringByAppendingPathComponent:a3];
}

- (id)getEngineWrapperStatusesWithError:(id *)a3
{
  cachedWrapperStatuses = self->_cachedWrapperStatuses;
  if (cachedWrapperStatuses)
  {
    id v4 = cachedWrapperStatuses;
  }
  else
  {
    p_getWrapperStatusesError = &self->_getWrapperStatusesError;
    getWrapperStatusesError = self->_getWrapperStatusesError;
    if (getWrapperStatusesError)
    {
      id v4 = 0;
      if (a3) {
        *a3 = getWrapperStatusesError;
      }
    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)CPLDiagnoseCommand;
      id v15 = 0;
      uint64_t v9 = [(CPLCTLCommand *)&v14 getEngineWrapperStatusesWithError:&v15];
      id v10 = v15;
      id v11 = v15;
      id v12 = self->_cachedWrapperStatuses;
      self->_cachedWrapperStatuses = v9;

      id v13 = self->_cachedWrapperStatuses;
      if (!v13)
      {
        objc_storeStrong((id *)p_getWrapperStatusesError, v10);
        id v13 = self->_cachedWrapperStatuses;
      }
      id v4 = v13;
    }
  }
  return v4;
}

- (void)prepareOutputURLs
{
  if (self->_outputFile || self->_outputFolder) {
    return;
  }
  host = self->host;
  if (gethostname(self->host, 0xFFuLL))
  {
    *(_DWORD *)&self->host[8] = 7631727;
    *(void *)host = *(void *)"UnknownHost";
  }
  for (i = self->host; *i == 47; ++i)
  {
    char *i = 95;
LABEL_11:
    ;
  }
  if (*i) {
    goto LABEL_11;
  }
  CFStringRef annotation = (const __CFString *)self->_annotation;
  if (!annotation) {
    CFStringRef annotation = &stru_1000359E8;
  }
  if (self->_isRoot) {
    unsigned __int8 v6 = "-root";
  }
  else {
    unsigned __int8 v6 = "";
  }
  if (self->_hasFullShellCommands) {
    id v7 = "";
  }
  else {
    id v7 = "-limited";
  }
  id v17 = +[NSString stringWithFormat:@"%@%@-%s%s%s-T%@", @"CPL-diagnostics", annotation, self->host, v6, v7, self->_timestamp];
  id v8 = [v17 stringByAppendingPathExtension:@"cpldiagnostics"];
  uint64_t v9 = +[NSURL fileURLWithPath:@"/var/tmp" isDirectory:1];
  id v10 = [CPLDiagnosticsInProgressPrefix stringByAppendingString:v8];
  id v11 = [v9 URLByAppendingPathComponent:v10 isDirectory:1];
  outputFolder = self->_outputFolder;
  self->_outputFolder = v11;

  id v13 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/photos" isDirectory:1];

  objc_super v14 = [v8 stringByAppendingPathExtension:@"tgz"];
  id v15 = [v13 URLByAppendingPathComponent:v14 isDirectory:0];
  outputFile = self->_outputFile;
  self->_outputFile = v15;
}

- (void)setUserMode:(BOOL)a3
{
  if (a3)
  {
    int v3 = getpwnam("mobile");
    if (v3) {
      uid_t pw_uid = v3->pw_uid;
    }
    else {
      uid_t pw_uid = 501;
    }
    seteuid(pw_uid);
  }
}

- (void)revertToRootMode:(BOOL)a3
{
  if (a3)
  {
    uid_t v3 = getuid();
    seteuid(v3);
  }
}

- (void)markPurgeable:(id)a3
{
  uint64_t v7 = 66053;
  id v4 = [a3 path];
  int v5 = fsctl((const char *)[v4 fileSystemRepresentation], 0xC0084A44uLL, &v7, 0);

  if (v5 == -1)
  {
    unsigned __int8 v6 = __error();
    [(CPLCTLCommand *)self printError:@"  error marking purgeable: %s", strerror(*v6)];
  }
}

- (id)preferencesforDomain:(id)a3 withKeys:(id)a4 currentUser:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = &kCFPreferencesCurrentUser;
  if (!a5) {
    id v8 = &kCFPreferencesAnyUser;
  }
  CFStringRef v9 = *v8;
  if (a3) {
    CFStringRef v10 = (const __CFString *)a3;
  }
  else {
    CFStringRef v10 = kCFPreferencesAnyApplication;
  }
  CFArrayRef v11 = (const __CFArray *)a4;
  id v12 = a3;
  [(CPLDiagnoseCommand *)self setUserMode:v5];
  id v13 = +[NSMutableDictionary dictionary];
  CFDictionaryRef v14 = CFPreferencesCopyMultiple(v11, v10, v9, kCFPreferencesCurrentHost);

  CFTypeID v15 = CFGetTypeID(v14);
  if (v15 == CFDictionaryGetTypeID()) {
    [v13 addEntriesFromDictionary:v14];
  }
  else {
    [(CPLCTLCommand *)self printFormat:@"  Unable to get preferences"];
  }
  CFRelease(v14);
  [(CPLDiagnoseCommand *)self revertToRootMode:v5];
  return v13;
}

- (void)writePreferenceInDomain:(id)a3 withKey:(id)a4 toDirectory:(id)a5 currentUser:(BOOL)a6
{
  BOOL v6 = a6;
  CFStringRef v10 = (__CFString *)a3;
  CFArrayRef v11 = (__CFString *)a4;
  id v12 = a5;
  if (v11)
  {
    double v28 = v11;
    id v13 = +[NSArray arrayWithObjects:&v28 count:1];
    CFStringRef v14 = v11;
  }
  else
  {
    id v13 = 0;
    CFStringRef v14 = @"all";
  }
  if (v10) {
    CFStringRef v15 = v10;
  }
  else {
    CFStringRef v15 = @"global";
  }
  [(CPLCTLCommand *)self printFormat:@"- Collecting preferences for domain: %@, key: %@.", v15, v14];
  __int16 v16 = [(CPLDiagnoseCommand *)self preferencesforDomain:v10 withKeys:v13 currentUser:v6];
  if (v16)
  {
    CFStringRef v17 = @"-";
    CFStringRef v18 = &stru_1000359E8;
    if (v11) {
      CFStringRef v18 = v11;
    }
    else {
      CFStringRef v17 = &stru_1000359E8;
    }
    BOOL v19 = +[NSString stringWithFormat:@"%@%@%@", v15, v17, v18];
    id v20 = [v19 stringByAppendingPathExtension:@"plist"];
    id v26 = v12;
    id v21 = [v12 URLByAppendingPathComponent:v20];

    id v22 = +[NSPropertyListSerialization dataWithPropertyList:v16 format:100 options:0 error:0];
    id v27 = 0;
    unsigned __int8 v23 = [v22 writeToURL:v21 options:0 error:&v27];
    id v24 = v27;
    id v25 = v24;
    if ((v23 & 1) == 0) {
      [(CPLCTLCommand *)self printError:@"Failed to write defaults to file (%@): %@", v21, v24];
    }

    id v12 = v26;
  }
}

- (BOOL)collectOutputOfCommand:(id)a3 label:(id)a4 filename:(id)a5
{
  return [(CPLDiagnoseCommand *)self collectOutputOfCommand:a3 label:a4 filename:a5 outputIsStderr:0 timeout:a5 != 0];
}

- (BOOL)collectOutputOfCommand:(id)a3 label:(id)a4 filename:(id)a5 timeout:(BOOL)a6
{
  return [(CPLDiagnoseCommand *)self collectOutputOfCommand:a3 label:a4 filename:a5 outputIsStderr:0 timeout:a6];
}

- (BOOL)collectOutputOfCommand:(id)a3 label:(id)a4 filename:(id)a5 outputIsStderr:(BOOL)a6 timeout:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a4;
  CFStringRef v14 = +[CPLTask taskWithCommandAndArguments:a3];
  LOBYTE(v7) = [(CPLDiagnoseCommand *)self collectOutputOfTask:v14 label:v13 filename:v12 outputIsStderr:v8 timeout:v7];

  return v7;
}

- (BOOL)collectOutputOfCommandAndArguments:(id)a3 label:(id)a4 filename:(id)a5 outputIsStderr:(BOOL)a6 timeout:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  CFStringRef v15 = objc_alloc_init(CPLTask);
  [(CPLTask *)v15 setArgv:v14];

  LOBYTE(v7) = [(CPLDiagnoseCommand *)self collectOutputOfTask:v15 label:v13 filename:v12 outputIsStderr:v8 timeout:v7];
  return v7;
}

- (BOOL)collectOutputOfTask:(id)a3 label:(id)a4 filename:(id)a5 outputIsStderr:(BOOL)a6 timeout:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!self->_isAppleInternal)
  {
    CFStringRef v15 = [v12 command];
    if ([v15 hasPrefix:@"/bin/"])
    {
    }
    else
    {
      __int16 v16 = [v12 command];
      unsigned __int8 v17 = [v16 hasPrefix:@"/usr/bin/"];

      if ((v17 & 1) == 0)
      {
        CFStringRef v18 = [v12 command];
        [(CPLCTLCommand *)self printFormat:@"  * attempt to run %@ on non-internal system *", v18];
        BOOL v38 = 1;
        goto LABEL_35;
      }
    }
  }
  CFStringRef v18 = +[NSDate date];
  [v12 setCleanupEmptyFiles:1];
  [v12 setCanTimeout:v7];
  if (v14)
  {
    BOOL v19 = [(NSURL *)self->_outputFolder URLByAppendingPathComponent:v14 isDirectory:0];
    id v20 = [v19 path];
    if (v8)
    {
      [v12 setRedirectStderrToFileAtPath:v20];

      diagnosticLog = self->_diagnosticLog;
      if (diagnosticLog) {
        [v12 setRedirectStdoutToFileDescriptor:fileno(diagnosticLog)];
      }
    }
    else
    {
      [v12 setRedirectStdoutToFileAtPath:v20];
    }
    if (v8) {
      goto LABEL_17;
    }
  }
  else
  {
    id v22 = self->_diagnosticLog;
    if (v22) {
      [v12 setRedirectStdoutToFileDescriptor:fileno(v22)];
    }
    if (v8) {
      goto LABEL_17;
    }
  }
  unsigned __int8 v23 = self->_diagnosticLog;
  if (v23) {
    [v12 setRedirectStderrToFileDescriptor:fileno(v23)];
  }
LABEL_17:
  [(CPLCTLCommand *)self printFormat:@"- %@", v13];
  id v24 = self->_diagnosticLog;
  if (v24)
  {
    BOOL isRoot = self->_isRoot;
    id v26 = [v12 argv];
    id v27 = [v26 componentsJoinedByString:@" "];
    double v28 = (const char *)[v27 UTF8String];
    uint64_t v29 = 35;
    if (!isRoot) {
      uint64_t v29 = 37;
    }
    fprintf(v24, "  %c %s\n", v29, v28);

    fflush(self->_diagnosticLog);
  }
  if (v14)
  {
    id v30 = [v12 exec];
  }
  else
  {
    id v31 = self->_diagnosticLog;
    if (v31)
    {
      fwrite("--- Beginning ---\n", 0x12uLL, 1uLL, v31);
      fflush(self->_diagnosticLog);
    }
    id v30 = [v12 exec];
    long long v32 = self->_diagnosticLog;
    if (v32)
    {
      fwrite("--- End ---\n", 0xCuLL, 1uLL, v32);
      fflush(self->_diagnosticLog);
    }
  }
  if (v30 == (id)2)
  {
    long long v33 = [v12 redirectStdoutToFileAtPath];

    if (v33)
    {
      long long v34 = [v12 redirectStdoutToFileAtPath];
      [(CPLCTLCommand *)self printFormat:@"  took too long. %@ might end up being incomplete", v34];
    }
    else
    {
      [(CPLCTLCommand *)self printFormat:@"  took too long."];
    }
    incompleteTasks = self->incompleteTasks;
    double v36 = +[NSString stringWithFormat:@"Timed out %@.", v13];
    [(NSMutableArray *)incompleteTasks addObject:v36];
  }
  else if (v30 == (id)1)
  {
    [(CPLCTLCommand *)self printFormat:@"  failed"];
  }
  [v18 timeIntervalSinceNow];
  [(CPLCTLCommand *)self printFormat:@"  elapsed time: %.2fs", fabs(v37)];
  BOOL v38 = v30 == 0;
LABEL_35:

  return v38;
}

- (void)collectFileListingAtPath:(id)a3 label:(id)a4 filename:(id)a5 extendedDetail:(BOOL)a6
{
  id v9 = a3;
  id v10 = a5;
  if (v9)
  {
    id v11 = a4;
    id v12 = +[NSDate date];
    [(CPLCTLCommand *)self printFormat:@"- %@", v11];

    diagnosticLog = self->_diagnosticLog;
    if (diagnosticLog)
    {
      BOOL isRoot = self->_isRoot;
      id v22 = (const char *)[v9 UTF8String];
      unsigned __int8 v23 = (const char *)[v10 UTF8String];
      uint64_t v15 = 35;
      if (!isRoot) {
        uint64_t v15 = 37;
      }
      fprintf(diagnosticLog, "  %c recursive file listing of %s into %s\n", v15, v22, v23);
      fflush(self->_diagnosticLog);
    }
    uint64_t v16 = [(NSURL *)self->_outputFolder URLByAppendingPathComponent:v10];
    unsigned __int8 v17 = [(id)v16 path];

    LOBYTE(v16) = CPLDiagnoseRecursiveFileListing();
    id v18 = 0;
    BOOL v19 = v18;
    if ((v16 & 1) == 0)
    {
      id v20 = [v18 description];
      [(CPLCTLCommand *)self printFormat:@"  failed: %@", v20];
    }
    [v12 timeIntervalSinceNow];
    [(CPLCTLCommand *)self printFormat:@"  elapsed time: %.2fs", fabs(v21)];
  }
}

- (void)collectFileAtURL:(id)a3 suffix:(id)a4 destinationDirectory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = +[NSDate date];
    id v12 = +[NSFileManager defaultManager];
    id v13 = [v8 path];
    unsigned int v14 = [v12 fileExistsAtPath:v13];

    uint64_t v15 = [(CPLDiagnoseCommand *)self _simplifiedPathForURL:v8];
    uint64_t v16 = (void *)v15;
    if (v14)
    {
      [(CPLCTLCommand *)self printFormat:@"- Collecting %@", v15];

      unsigned __int8 v17 = [v8 lastPathComponent];
      uint64_t v16 = v17;
      if (v9)
      {
        uint64_t v18 = [v17 stringByAppendingString:v9];

        uint64_t v16 = (void *)v18;
      }
      BOOL v19 = [v10 URLByAppendingPathComponent:v16];
      id v28 = 0;
      unsigned __int8 v20 = [v12 copyItemAtURL:v8 toURL:v19 error:&v28];
      id v21 = v28;
      id v22 = v21;
      if ((v20 & 1) == 0)
      {
        unsigned __int8 v23 = [v21 localizedDescription];
        [(CPLCTLCommand *)self printFormat:@"  failed: %@", v23];

        incompleteTasks = self->incompleteTasks;
        +[NSString stringWithFormat:@"Failed collecting %@.", v8];
        v25 = id v24 = v11;
        [(NSMutableArray *)incompleteTasks addObject:v25];

        id v11 = v24;
      }
      [v11 timeIntervalSinceNow];
      [(CPLCTLCommand *)self printFormat:@"  elapsed time: %.2fs", fabs(v26)];
    }
    else
    {
      [(CPLCTLCommand *)self printFormat:@"- %@ does not exist", v15];
    }
  }
}

- (void)collectFileAtPath:(id)a3 suffix:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = +[NSURL fileURLWithPath:a3];
    [(CPLDiagnoseCommand *)self collectFileAtURL:v7 suffix:v6 destinationDirectory:self->_outputFolder];
  }
}

- (void)collectFileAtPath:(id)a3
{
}

- (void)collectDiagnosticLog:(id)a3
{
  if (a3)
  {
    objc_msgSend(@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs", "stringByAppendingPathComponent:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(CPLDiagnoseCommand *)self collectFileAtPath:v4];
  }
}

- (void)sampleProcess:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CPLDiagnoseCommand *)self processDetailPath:v4];
  id v10 = +[NSString stringWithFormat:@"%@-sample.txt", v5];

  id v6 = [(NSURL *)self->_outputFolder URLByAppendingPathComponent:v10];
  id v7 = [v6 path];

  id v8 = +[NSString stringWithFormat:@"/usr/bin/sample %@ 1 -f %@", v4, v7];
  id v9 = +[NSString stringWithFormat:@"Sampling %@", v4];

  [(CPLDiagnoseCommand *)self collectOutputOfCommand:v8 label:v9 filename:0];
}

- (id)processes
{
  if (qword_1000413F8 != -1) {
    dispatch_once(&qword_1000413F8, &stru_100035078);
  }
  unsigned int v2 = (void *)qword_1000413F0;
  return v2;
}

- (void)executeMemoryToolsOnProcess:(id)a3
{
  id v4 = a3;
  if (!qword_100041400)
  {
    if (self->_isAppleInternal) {
      BOOL v5 = &off_10003B508;
    }
    else {
      BOOL v5 = &off_10003B520;
    }
    qword_100041400 = (uint64_t)v5;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = (id)qword_100041400;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[CPLDiagnoseCommand executeTool:onProcess:](self, "executeTool:onProcess:", *(void *)(*((void *)&v11 + 1) + 8 * i), v4, (void)v11);
      }
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)executeTool:(id)a3 onProcess:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  id v7 = +[NSString stringWithFormat:@"Getting %@ for %@", v19, v6];
  unsigned int v8 = [v19 hasPrefix:@"/"];
  uint64_t v9 = @"/usr/bin/";
  if (v8) {
    uint64_t v9 = &stru_1000359E8;
  }
  id v10 = v9;
  if ([v19 isEqualToString:@"leaks"])
  {
    long long v11 = [(NSURL *)self->_outputFolder path];
    long long v12 = [(CPLDiagnoseCommand *)self processDetailPath:v6];
    long long v13 = [v11 stringByAppendingPathComponent:v12];
    long long v14 = [v13 stringByAppendingPathExtension:@"memgraph"];

    uint64_t v15 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@" --forkCorpse --physFootprint --outputGraph=%@", v14];
    uint64_t v16 = 0;
  }
  else
  {
    long long v14 = [(CPLDiagnoseCommand *)self processDetailPath:v6];
    unsigned __int8 v17 = [v19 lastPathComponent];
    uint64_t v16 = +[NSString stringWithFormat:@"%@-%@.txt", v14, v17];

    uint64_t v15 = &stru_1000359E8;
  }

  uint64_t v18 = +[NSString stringWithFormat:@"%@%@%@ %@", v10, v19, v15, v6];

  [(CPLDiagnoseCommand *)self collectOutputOfCommand:v18 label:v7 filename:v16];
}

- (void)collectDiagnosticLogs
{
  [(CPLDiagnoseCommand *)self collectFileAtPath:@"/var/mobile/Media/PhotoData/Caches/changes"];
  [(CPLDiagnoseCommand *)self collectFileAtPath:@"/var/mobile/Library/Logs/com.apple.assetsd/PhotosUpgrade.log"];
  [(CPLDiagnoseCommand *)self collectFileAtPath:@"/var/mobile/Library/Logs/com.apple.assetsd/PhotosUpgrade.aapbz"];
  [(CPLDiagnoseCommand *)self collectFileAtPath:@"/var/mobile/Library/Logs/com.apple.assetsd/PhotosUpgrade.aapbz.old"];
  [(CPLDiagnoseCommand *)self collectFileAtPath:@"/var/mobile/Library/Logs/com.apple.assetsd/PhotosSearch.aapbz"];
  [(CPLDiagnoseCommand *)self collectFileAtPath:@"/var/mobile/Library/Logs/com.apple.assetsd/PhotosSearch.aapbz.old"];
  if (self->_isAppleInternal)
  {
    [(CPLDiagnoseCommand *)self _collectSharedAlbumFilesAtPath:@"/var/mobile/Library/MediaStream/albumshare/"];
  }
}

- (void)collectPhotosLibraryUpgradeLogs
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000159DC;
  v2[3] = &unk_100034BA0;
  v2[4] = self;
  [(CPLDiagnoseCommand *)self runAsUser:v2];
}

- (void)_removeResourceDataFromFaceCropChangeCPLSerializedRecords:(sqlite3 *)a3
{
  if (sqlite3_create_function_v2(a3, "filterCPLSerializedRecord", 1, 2053, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_100015FE8, 0, 0, 0))
  {
    [(CPLCTLCommand *)self printFormat:@"error creating filterCPLSerializedRecord function to remove CPL storage: remove all CPLFaceCropChange records"];
    sqlite3_exec(a3, "update clientCache set serializedRecord = '' where class='CPLFaceCropChange'", 0, 0, 0);
    sqlite3_exec(a3, "update cloudCache set serializedRecord = null, stagedSerializedRecord = null where class='CPLFaceCropChange'", 0, 0, 0);
    sqlite3_exec(a3, "update transientPullRepository set serializedRecord = '' where class='CPLFaceCropChange'", 0, 0, 0);
    sqlite3_exec(a3, "update pullQueue set serializedRecord = '' where class='CPLFaceCropChange'", 0, 0, 0);
  }
  else
  {
    sqlite3_exec(a3, "update clientCache set serializedRecord = filterCPLSerializedRecord(serializedRecord) where class='CPLFaceCropChange'", 0, 0, 0);
    sqlite3_exec(a3, "update pullQueue set serializedRecord = filterCPLSerializedRecord(serializedRecord) where class='CPLFaceCropChange'", 0, 0, 0);
    sqlite3_exec(a3, "update transientPullRepository set serializedRecord = filterCPLSerializedRecord(serializedRecord) where class='CPLFaceCropChange'", 0, 0, 0);
    sqlite3_exec(a3, "update cloudCache set serializedRecord = filterCPLSerializedRecord(serializedRecord), stagedSerializedRecord = filterCPLSerializedRecord(stagedSerializedRecord) where class='CPLFaceCropChange'", 0, 0, 0);
  }
}

- (void)_removeShareURLFromCPLScopes:(sqlite3 *)a3
{
  if (sqlite3_create_function_v2(a3, "filterLibraryInfo", 1, 2053, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_100016314, 0, 0, 0))
  {
    [(CPLCTLCommand *)self printFormat:@"error creating filterShareURL function to remove CPL storage: remove shareURL from scopes"];
    sqlite3_exec(a3, "update scopes set libraryInfo = null", 0, 0, 0);
  }
  else
  {
    sqlite3_exec(a3, "update scopes set libraryInfo = filterLibraryInfo(libraryInfo)", 0, 0, 0);
    [(CPLCTLCommand *)self printFormat:@"  redacted %d scopes", sqlite3_changes(a3)];
  }
}

- (void)_removeShareURLFromPhotosMomentShare:(sqlite3 *)a3
{
  if (sqlite3_create_function_v2(a3, "filterMomentShareURL", 1, 2053, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_100016644, 0, 0, 0))
  {
    [(CPLCTLCommand *)self printFormat:@"error creating filterMomentShare function to remove Photos storage: remove shareURL from MomentShare"];
    sqlite3_exec(a3, "update ZSHARE set ZSHAREURL = null, ZPREVIEWDATA = null", 0, 0, 0);
  }
  else
  {
    sqlite3_exec(a3, "update ZSHARE set ZSHAREURL = filterMomentShareURL(ZSHAREURL), ZPREVIEWDATA = null", 0, 0, 0);
    [(CPLCTLCommand *)self printFormat:@"  redacted %d moment shares", sqlite3_changes(a3)];
  }
}

- (id)_readAppPrivateData
{
  unsigned int v2 = [(NSString *)self->_libraryPath stringByAppendingPathComponent:@"private/com.apple.assetsd"];
  uid_t v3 = [v2 stringByAppendingPathComponent:@"appPrivateData.plist"];
  id v4 = +[NSURL fileURLWithPath:v3];
  BOOL v5 = +[NSDictionary dictionaryWithContentsOfURL:v4];

  return v5;
}

- (void)copyDatabaseFromPath:(id)a3 toPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v7 lastPathComponent];
  unsigned int v9 = [(NSArray *)self->_databasesWithPIIData containsObject:v8];
  id v10 = [v6 pathExtension];
  unsigned __int8 v11 = [&off_10003B538 containsObject:v10];

  if (v11)
  {
    id v25 = 0;
    ppDb = 0;
    id v12 = v6;
    if (!sqlite3_open_v2((const char *)[v12 UTF8String], &ppDb, 1, 0)) {
      goto LABEL_13;
    }
    if (ppDb) {
      sqlite3_close(ppDb);
    }
    long long v13 = +[NSURL fileURLWithPath:v12];
    long long v14 = [v13 absoluteString];
    [v14 stringByAppendingString:@"?readonly_shm=1"];
    id v15 = objc_claimAutoreleasedReturnValue();
    int v16 = sqlite3_open_v2((const char *)[v15 UTF8String], &ppDb, 1, 0);

    if (!v16) {
      goto LABEL_13;
    }
    if (ppDb) {
      sqlite3_close(ppDb);
    }
    [(CPLCTLCommand *)self printFormat:@"couldn't open source database readonly, trying read/write mode"];
    id v17 = v12;
    uint64_t v18 = sqlite3_open_v2((const char *)[v17 UTF8String], &ppDb, 2, 0);
    if (v18)
    {
      uint64_t v19 = v18;
      if (ppDb) {
        sqlite3_close(ppDb);
      }
      [(CPLCTLCommand *)self printFormat:@"Failed to open src db %@: sqlite error %d\n", v17, v19];
    }
    else
    {
LABEL_13:
      id v21 = v7;
      uint64_t v22 = sqlite3_open_v2((const char *)[v21 UTF8String], &v25, 6, 0);
      if (v22)
      {
        uint64_t v23 = v22;
        if (ppDb) {
          sqlite3_close(ppDb);
        }
        if (v25) {
          sqlite3_close(v25);
        }
        [(CPLCTLCommand *)self printFormat:@"Failed to open dst db %@: sqlite error %d\n", v21, v23];
      }
      else
      {
        uint64_t v24 = sqlite3_file_control(v25, 0, 102, ppDb);
        if (v24)
        {
          [(CPLCTLCommand *)self printFormat:@"Failed to replace %@ with %@: sqlite error %d\n", v21, v12, v24];
        }
        else
        {
          if (v9)
          {
            sqlite3_exec(v25, "pragma secure_delete=fast", 0, 0, 0);
            [(CPLCTLCommand *)self printFormat:@"  remove PII image data and obfuscate share URLs from %@", v21];
            if ([v8 hasPrefix:@"Photos.sqlite"])
            {
              [(CPLCTLCommand *)self printFormat:@"  removing ZFACECROP ZRESOURCEDATA and share URL scopes"];
              sqlite3_exec(v25, "update ZFACECROP set ZRESOURCEDATA = null", 0, 0, 0);
              [(CPLDiagnoseCommand *)self _removeShareURLFromPhotosMomentShare:v25];
              if (!self->_doNotStripOCR)
              {
                [(CPLCTLCommand *)self printFormat:@"  removing OCR data"];
                sqlite3_exec(v25, "update ZCHARACTERRECOGNITIONATTRIBUTES set ZCHARACTERRECOGNITIONDATA = null", 0, 0, 0);
                sqlite3_exec(v25, "update ZCHARACTERRECOGNITIONATTRIBUTES set ZMACHINEREADABLECODEDATA = null", 0, 0, 0);
                sqlite3_exec(v25, "update ZVISUALSEARCHATTRIBUTES set ZVISUALSEARCHDATA = null", 0, 0, 0);
              }
            }
            if ([v8 isEqualToString:@"photo.db"])
            {
              [(CPLCTLCommand *)self printFormat:@"  removing RKFaceCrop"];
              sqlite3_exec(v25, "update RKFaceCrop set resourceData = null", 0, 0, 0);
            }
            if ([v8 isEqualToString:@"Faces.db"])
            {
              [(CPLCTLCommand *)self printFormat:@"  removing RKDetectedFaceBlob"];
              sqlite3_exec(v25, "drop table RKDetectedFaceBlob", 0, 0, 0);
            }
            if ([v8 isEqualToString:@"store.cloudphotodb"])
            {
              [(CPLCTLCommand *)self printFormat:@"  removing resource data from serialized CPL records"];
              [(CPLDiagnoseCommand *)self _removeResourceDataFromFaceCropChangeCPLSerializedRecords:v25];
              [(CPLDiagnoseCommand *)self _removeShareURLFromCPLScopes:v25];
            }
            sqlite3_exec(v25, "pragma incremental_vacuum", 0, 0, 0);
          }
          sqlite3_exec(v25, "pragma journal_mode=delete", 0, 0, 0);
        }
        if (ppDb) {
          sqlite3_close(ppDb);
        }
        if (v25) {
          sqlite3_close(v25);
        }
      }
    }
  }
  else
  {
    unsigned __int8 v20 = +[NSFileManager defaultManager];
    [v20 copyItemAtPath:v6 toPath:v7 error:0];
  }
}

- (BOOL)_isUBFExtension:(id)a3
{
  return [a3 isEqualToString:@"photoslibrary"];
}

- (void)collectDatabaseAtPath:(id)a3 libraryPath:(id)a4 subdirectory:(id)a5
{
  id v33 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[NSFileManager defaultManager];
  if ([v10 fileExistsAtPath:v33])
  {
    if (self->_skipDBCopy)
    {
      incompleteTasks = self->incompleteTasks;
      id v12 = +[NSString stringWithFormat:@"Skipped collecting %@.", v33];
      [(NSMutableArray *)incompleteTasks addObject:v12];
    }
    else
    {
      long long v13 = [v10 attributesOfItemAtPath:v33 error:0];
      id v14 = [v13 fileSize];

      id v12 = +[NSByteCountFormatter stringFromByteCount:v14 countStyle:0];
      if ((unint64_t)v14 >= 0x4B000001 && self->_skipBigDBCopy)
      {
        id v15 = +[NSByteCountFormatter stringFromByteCount:1258291200 countStyle:0];
        [(CPLCTLCommand *)self printFormat:@"- Skipping: The size of the database at %@ is bigger than the maximum allowed in this mode (%@): (%@) ", v33, v15, v12];

        int v16 = self->incompleteTasks;
        id v17 = +[NSString stringWithFormat:@"Skipped collecting %@.", v33];
        [(NSMutableArray *)v16 addObject:v17];
      }
      else
      {
        id v17 = +[NSDate date];
        [(CPLCTLCommand *)self printFormat:@"- Collecting database (%@) %@", v12, v33];
        uint64_t v18 = [v8 pathExtension];
        unsigned __int8 v19 = [(CPLDiagnoseCommand *)self _isUBFExtension:v18];

        if (v19)
        {
          if (v8)
          {
            long long v32 = v17;
            id v31 = [v8 stringByDeletingLastPathComponent];
            unsigned __int8 v20 = objc_msgSend(v33, "stringByReplacingOccurrencesOfString:withString:options:range:", v31, &stru_1000359E8, 8, 0, objc_msgSend(v33, "length"));
            if (v9)
            {
              uint64_t v21 = [v9 stringByAppendingPathComponent:v20];

              unsigned __int8 v20 = (void *)v21;
            }
            uint64_t v22 = [(NSURL *)self->_outputFolder URLByAppendingPathComponent:v20];
            uint64_t v23 = [v22 path];

            uint64_t v24 = [v23 stringByDeletingLastPathComponent];
            id v25 = +[NSFileManager defaultManager];
            [v25 createDirectoryAtPath:v24 withIntermediateDirectories:1 attributes:0 error:0];

            id v17 = v32;
            id v26 = v33;
          }
          else
          {
            [(CPLCTLCommand *)self printError:@"Unexpect nil libraryPath for UBF library. Filepath: %@", v33];
            id v26 = v33;
            uint64_t v23 = 0;
          }
        }
        else
        {
          id v27 = +[NSURL fileURLWithPath:v33];
          id v28 = [v27 lastPathComponent];
          uint64_t v29 = [(NSURL *)self->_outputFolder URLByAppendingPathComponent:v28];
          uint64_t v23 = [v29 path];

          id v26 = v33;
        }
        [(CPLDiagnoseCommand *)self copyDatabaseFromPath:v26 toPath:v23];
        [v17 timeIntervalSinceNow];
        [(CPLCTLCommand *)self printFormat:@"  elapsed time: %.2fs", fabs(v30)];
      }
    }
  }
  else
  {
    [(CPLCTLCommand *)self printFormat:@"- %@ does not exist", v33];
  }
}

- (id)interestingDatabasesForUBFLibraryPath:(id)a3 isSharingLibrary:(BOOL)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  id v7 = [v5 stringByAppendingPathComponent:@"Database"];
  id v8 = [v7 stringByAppendingPathComponent:@"apdb"];
  unsigned __int8 v63 = 0;
  id v9 = +[NSFileManager defaultManager];
  unsigned int v10 = [v9 fileExistsAtPath:v8 isDirectory:&v63];
  int v11 = v63;

  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  long long v53 = self;
  if (v12)
  {
    long long v13 = [v5 stringByAppendingPathComponent:@"database"];

    id v8 = v13;
    id v7 = v8;
  }
  uint64_t v50 = [v5 stringByAppendingPathComponent:@"resources/moments"];
  v68[0] = v50;
  id v49 = [v5 stringByAppendingPathComponent:@"private/com.apple.Photos.Migration/appPrivateData.plist"];
  v68[1] = v49;
  uint64_t v48 = [v5 stringByAppendingPathComponent:@"private/com.apple.photolibraryd"];
  v68[2] = v48;
  double v47 = [v5 stringByAppendingPathComponent:@"private/com.apple.assetsd"];
  v68[3] = v47;
  id v14 = [v5 stringByAppendingPathComponent:@"private/com.apple.accountsd"];
  v68[4] = v14;
  id v15 = [v5 stringByAppendingPathComponent:@"private/com.apple.mediaanalysisd/MediaAnalysis/mediaanalysis.db"];
  v68[5] = v15;
  int v16 = [v5 stringByAppendingPathComponent:@"private/com.apple.mediaanalysisd/caches/vision/VUIndex.sqlite"];
  v68[6] = v16;
  id v17 = [v5 stringByAppendingPathComponent:@"private/com.apple.mediaanalysisd/caches/vision/PersonPromoter"];
  v68[7] = v17;
  uint64_t v18 = [v8 stringByAppendingPathComponent:@"search/spotlightProgress.plist"];
  v68[8] = v18;
  long long v54 = v8;
  unsigned __int8 v19 = [v8 stringByAppendingPathComponent:@"search/initialSuggestions.bplist"];
  v68[9] = v19;
  unsigned __int8 v20 = +[NSArray arrayWithObjects:v68 count:10];
  [v6 addObjectsFromArray:v20];

  if (!a4)
  {
    v67[0] = @"resources/cpl/cloudsync.noindex/storage/store.cloudphotodb";
    long long v52 = [@"resources/cpl/cloudsync.noindex/" stringByAppendingPathComponent:@"mobileCPL.plist"];
    v67[1] = v52;
    uint64_t v21 = [@"resources/cpl/cloudsync.noindex/" stringByAppendingPathComponent:@"initialsync_marker"];
    v67[2] = v21;
    uint64_t v22 = [@"resources/cpl/cloudsync.noindex/storage/" stringByAppendingPathComponent:@"cpl-upgrade-events.log"];
    v67[3] = v22;
    uint64_t v23 = [@"resources/cpl/cloudsync.noindex/" stringByAppendingPathComponent:@"cloudphotos-1.0.plist"];
    v67[4] = v23;
    uint64_t v24 = [@"resources/cpl/cloudsync.noindex/" stringByAppendingPathComponent:@"syncstatus.plist"];
    v67[5] = v24;
    id v25 = [@"resources/cpl/cloudsync.noindex/" stringByAppendingPathComponent:@"resetevents.plist"];
    v67[6] = v25;
    id v26 = [@"resources/cpl/cloudsync.noindex/" stringByAppendingPathComponent:@"DownloadCounts.plist"];
    v67[7] = v26;
    v67[8] = @"resources/cpl/cloudsync.noindex/State.plist";
    id v27 = +[NSArray arrayWithObjects:v67 count:9];

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v28 = v27;
    id v29 = [v28 countByEnumeratingWithState:&v59 objects:v66 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v60;
      do
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v60 != v31) {
            objc_enumerationMutation(v28);
          }
          id v33 = [v5 stringByAppendingPathComponent:*(void *)(*((void *)&v59 + 1) + 8 * i)];
          [v6 addObject:v33];
        }
        id v30 = [v28 countByEnumeratingWithState:&v59 objects:v66 count:16];
      }
      while (v30);
    }

    long long v34 = [v5 stringByAppendingPathComponent:@"resources/derivatives/thumbs/thumbnailConfiguration"];
    v65[0] = v34;
    uint64_t v35 = [v5 stringByAppendingPathComponent:@"private/com.apple.photoanalysisd/vision"];
    v65[1] = v35;
    double v36 = [v5 stringByAppendingPathComponent:@"private/com.apple.photoanalysisd/GraphService/PhotoAnalysisServicePreferences.plist"];
    v65[2] = v36;
    double v37 = [v5 stringByAppendingPathComponent:@"database/rebuildHistory"];
    v65[3] = v37;
    BOOL v38 = +[NSArray arrayWithObjects:v65 count:4];
    [v6 addObjectsFromArray:v38];
  }
  if (v53->_copyPlists)
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v39 = [&off_10003B550 countByEnumeratingWithState:&v55 objects:v64 count:16];
    if (v39)
    {
      id v40 = v39;
      uint64_t v41 = *(void *)v56;
      do
      {
        for (j = 0; j != v40; j = (char *)j + 1)
        {
          if (*(void *)v56 != v41) {
            objc_enumerationMutation(&off_10003B550);
          }
          uint64_t v43 = [v7 stringByAppendingPathComponent:*(void *)(*((void *)&v55 + 1) + 8 * (void)j)];
          [v6 addObject:v43];
        }
        id v40 = [&off_10003B550 countByEnumeratingWithState:&v55 objects:v64 count:16];
      }
      while (v40);
    }
  }
  if (v53->_copyRecoverJournals)
  {
    id v44 = [v5 stringByAppendingPathComponent:@"resources/recovery"];
    [v6 addObject:v44];

    CFStringRef v45 = [v5 stringByAppendingPathComponent:@"resources/journals"];
    [v6 addObject:v45];
  }
  return v6;
}

- (id)prependPath:(id)a3 toStringsInArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100017788;
  v12[3] = &unk_1000350A0;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v13 = v7;
  id v14 = v5;
  id v8 = v5;
  [v6 enumerateObjectsUsingBlock:v12];

  id v9 = v14;
  id v10 = v7;

  return v10;
}

- (void)collectFiles
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v4 = [(CPLDiagnoseCommand *)self includeSyndication];
  id v5 = (_UNKNOWN **)&__NSArray0__struct;
  if (v4) {
    id v5 = &off_10003B568;
  }
  id v6 = v5;
  long long v84 = [&off_10003B580 arrayByAddingObjectsFromArray:&off_10003B598];
  id v7 = [&off_10003B580 arrayByAddingObjectsFromArray:&off_10003B5B0];
  id v8 = [@"Photos.sqlite" lastPathComponent];
  v136[0] = v8;
  id v9 = [@"Photos.sqlite.aside" lastPathComponent];
  v136[1] = v9;
  v136[2] = @"store.cloudphotodb";
  id v10 = +[NSArray arrayWithObjects:v136 count:3];
  databasesWithPIIData = self->_databasesWithPIIData;
  self->_databasesWithPIIData = v10;

  BOOL v12 = [(NSArray *)self->_databasesWithPIIData arrayByAddingObjectsFromArray:&off_10003B5E0];
  id v13 = self->_databasesWithPIIData;
  self->_databasesWithPIIData = v12;

  long long v83 = v7;
  if ([(CPLDiagnoseCommand *)self includeSPL])
  {
    id v90 = [(CPLDiagnoseCommand *)self prependPath:@"/var/mobile/Media/PhotoData" toStringsInArray:v7];
    id v14 = [@"/var/mobile/Media/PhotoData/CPL/" stringByAppendingPathComponent:@"mobileCPL.plist"];
    v135[0] = v14;
    id v15 = [@"/var/mobile/Media/PhotoData/CPL/" stringByAppendingPathComponent:@"initialsync_marker"];
    v135[1] = v15;
    int v16 = [@"/var/mobile/Media/PhotoData/CPL/storage/" stringByAppendingPathComponent:@"cpl-upgrade-events.log"];
    v135[2] = v16;
    [@"/var/mobile/Media/PhotoData/CPL/" stringByAppendingPathComponent:@"cloudphotos-1.0.plist"];
    v18 = id v17 = v6;
    v135[3] = v18;
    [@"/var/mobile/Media/PhotoData/CPL/" stringByAppendingPathComponent:@"syncstatus.plist"];
    unsigned __int8 v19 = contexta = v3;
    v135[4] = v19;
    unsigned __int8 v20 = [@"/var/mobile/Media/PhotoData/CPL/" stringByAppendingPathComponent:@"resetevents.plist"];
    v135[5] = v20;
    uint64_t v21 = [@"/var/mobile/Media/PhotoData/CPL/" stringByAppendingPathComponent:@"DownloadCounts.plist"];
    v135[6] = v21;
    v135[7] = @"/var/mobile/Media/PhotoData/Thumbnails/thumbnailConfiguration";
    v135[8] = @"/var/mobile/Media/PhotoData/AlbumsMetadata";
    v135[9] = @"/var/mobile/Media/PhotoData/rebuildHistory";
    v135[10] = @"/var/mobile/Media/PhotoData/Caches/restoreContext.plist";
    v135[11] = @"/var/mobile/Media/PhotoData/Caches/datamigratorfinished";
    v135[12] = @"/var/mobile/Media/PhotoData/Caches/PLDataMigrationInfo.plist";
    v135[13] = @"/var/mobile/Media/PhotoData/Caches/GraphService/PhotoAnalysisServicePreferences.plist";
    v135[14] = @"/var/mobile/Media/PhotoData/Caches/GraphService/PhotoAnalysisMusicPreferences.plist";
    v135[15] = @"/var/mobile/Media/PhotoData/Caches/SmartSharing/camera_smart_sharing_metadata.plist";
    v135[16] = @"/var/mobile/Media/PhotoData/Caches/search/spotlightProgress.plist";
    v135[17] = @"/var/mobile/Media/PhotoData/Caches/search/initialSuggestions.bplist";
    v135[18] = @"/var/mobile/Media/PhotoData/Caches/Restore";
    v135[19] = @"/var/mobile/Media/PhotoData/private/com.apple.assetsd";
    v135[20] = @"/var/mobile/Media/PhotoData/private/com.apple.accountsd";
    v135[21] = @"/var/mobile/Media/PhotoData/Caches/GraphService/PromptSuggestions.plist";
    uint64_t v22 = +[NSArray arrayWithObjects:v135 count:22];

    id v6 = v17;
    id v7 = v83;

    uint64_t v23 = [@"/var/mobile/Media/PhotoData" stringByAppendingPathComponent:@"Caches/GraphService"];
    uint64_t v24 = [(CPLDiagnoseCommand *)self prependPath:v23 toStringsInArray:&off_10003B5C8];
    id v25 = [v90 arrayByAddingObjectsFromArray:v24];

    id v26 = [v25 arrayByAddingObject:@"/var/mobile/Media/MediaAnalysis/mediaanalysis.db"];

    id v3 = contexta;
    [(CPLDiagnoseCommand *)self addFilesFromVisionCacheToDictionary:contexta];
  }
  else
  {
    id v26 = 0;
    uint64_t v22 = 0;
  }
  libraryPath = self->_libraryPath;
  if (!libraryPath || self->_targetLibraryIsSPL || self->_targetLibraryIsSyndication)
  {
    long long v81 = 0;
  }
  else
  {
    long long v75 = [(NSString *)libraryPath stringByAppendingPathComponent:@"database"];
    long long v76 = [(CPLDiagnoseCommand *)self prependPath:v75 toStringsInArray:v84];
    [(CPLDiagnoseCommand *)self interestingDatabasesForUBFLibraryPath:self->_libraryPath isSharingLibrary:0];
    long long v77 = contextb = v3;
    long long v78 = [v76 arrayByAddingObjectsFromArray:v77];

    long long v79 = [(NSString *)self->_libraryPath stringByAppendingPathComponent:@"private/com.apple.photoanalysisd/caches/graph"];
    long long v80 = [(CPLDiagnoseCommand *)self prependPath:v79 toStringsInArray:&off_10003B5C8];
    long long v81 = [v78 arrayByAddingObjectsFromArray:v80];

    id v3 = contextb;
  }
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  id obj = v22;
  id v28 = [obj countByEnumeratingWithState:&v123 objects:v134 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v124;
    do
    {
      for (i = 0; i != v29; i = (char *)i + 1)
      {
        if (*(void *)v124 != v30) {
          objc_enumerationMutation(obj);
        }
        [(CPLDiagnoseCommand *)self collectFileAtPath:*(void *)(*((void *)&v123 + 1) + 8 * i)];
      }
      id v29 = [obj countByEnumeratingWithState:&v123 objects:v134 count:16];
    }
    while (v29);
  }

  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  id v91 = v3;
  id v32 = [v91 countByEnumeratingWithState:&v119 objects:v133 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v120;
    do
    {
      for (j = 0; j != v33; j = (char *)j + 1)
      {
        if (*(void *)v120 != v34) {
          objc_enumerationMutation(v91);
        }
        uint64_t v36 = *(void *)(*((void *)&v119 + 1) + 8 * (void)j);
        double v37 = [v91 objectForKeyedSubscript:v36];
        [(CPLDiagnoseCommand *)self collectFilePaths:v37 toSubdirectory:v36];
      }
      id v33 = [v91 countByEnumeratingWithState:&v119 objects:v133 count:16];
    }
    while (v33);
  }

  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  id v86 = v26;
  id v38 = [v86 countByEnumeratingWithState:&v115 objects:v132 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v116;
    do
    {
      for (k = 0; k != v39; k = (char *)k + 1)
      {
        if (*(void *)v116 != v40) {
          objc_enumerationMutation(v86);
        }
        [(CPLDiagnoseCommand *)self collectDatabaseAtPath:*(void *)(*((void *)&v115 + 1) + 8 * (void)k) libraryPath:0 subdirectory:0];
      }
      id v39 = [v86 countByEnumeratingWithState:&v115 objects:v132 count:16];
    }
    while (v39);
  }

  if (v81)
  {
    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    id v42 = v81;
    id v43 = [v42 countByEnumeratingWithState:&v111 objects:v131 count:16];
    if (v43)
    {
      id v44 = v43;
      uint64_t v45 = *(void *)v112;
      do
      {
        for (m = 0; m != v44; m = (char *)m + 1)
        {
          if (*(void *)v112 != v45) {
            objc_enumerationMutation(v42);
          }
          [(CPLDiagnoseCommand *)self collectDatabaseAtPath:*(void *)(*((void *)&v111 + 1) + 8 * (void)m) libraryPath:self->_libraryPath subdirectory:@"Library"];
        }
        id v44 = [v42 countByEnumeratingWithState:&v111 objects:v131 count:16];
      }
      while (v44);
    }

    [(CPLDiagnoseCommand *)self collectAdditionalInformationForDatabaseAtPath:self->_libraryPath toDirectory:@"Library"];
  }
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v85 = v6;
  id v89 = [v85 countByEnumeratingWithState:&v107 objects:v130 count:16];
  if (v89)
  {
    double v47 = &CFDictionaryGetTypeID_ptr;
    uint64_t v48 = *(void *)v108;
    uint64_t v82 = *(void *)v108;
    do
    {
      for (n = 0; n != v89; n = (char *)n + 1)
      {
        if (*(void *)v108 != v48) {
          objc_enumerationMutation(v85);
        }
        uint64_t v50 = *(void **)(*((void *)&v107 + 1) + 8 * (void)n);
        id v51 = [@"/var/mobile/Library" stringByAppendingPathComponent:v50];
        long long v52 = [v47[275] defaultManager];
        unsigned __int8 v53 = [v52 fileExistsAtPath:v51];

        if (v53)
        {
          long long v54 = [v51 lastPathComponent];
          long long v55 = [v54 stringByDeletingPathExtension];
          long long v56 = [v55 stringByAppendingString:@"Library"];

          uint64_t v57 = [v51 stringByAppendingPathComponent:@"database"];
          long long v103 = 0u;
          long long v104 = 0u;
          long long v105 = 0u;
          long long v106 = 0u;
          v88 = (void *)v57;
          long long v58 = -[CPLDiagnoseCommand prependPath:toStringsInArray:](self, "prependPath:toStringsInArray:");
          id v59 = [v58 countByEnumeratingWithState:&v103 objects:v129 count:16];
          if (v59)
          {
            id v60 = v59;
            uint64_t v61 = *(void *)v104;
            do
            {
              for (ii = 0; ii != v60; ii = (char *)ii + 1)
              {
                if (*(void *)v104 != v61) {
                  objc_enumerationMutation(v58);
                }
                [(CPLDiagnoseCommand *)self collectDatabaseAtPath:*(void *)(*((void *)&v103 + 1) + 8 * (void)ii) libraryPath:v51 subdirectory:v56];
              }
              id v60 = [v58 countByEnumeratingWithState:&v103 objects:v129 count:16];
            }
            while (v60);
          }

          long long v101 = 0u;
          long long v102 = 0u;
          long long v99 = 0u;
          long long v100 = 0u;
          unsigned __int8 v63 = [(CPLDiagnoseCommand *)self interestingDatabasesForUBFLibraryPath:v51 isSharingLibrary:0];
          id v64 = [v63 countByEnumeratingWithState:&v99 objects:v128 count:16];
          if (v64)
          {
            id v65 = v64;
            uint64_t v66 = *(void *)v100;
            do
            {
              for (jj = 0; jj != v65; jj = (char *)jj + 1)
              {
                if (*(void *)v100 != v66) {
                  objc_enumerationMutation(v63);
                }
                [(CPLDiagnoseCommand *)self collectDatabaseAtPath:*(void *)(*((void *)&v99 + 1) + 8 * (void)jj) libraryPath:v51 subdirectory:v56];
              }
              id v65 = [v63 countByEnumeratingWithState:&v99 objects:v128 count:16];
            }
            while (v65);
          }

          v68 = [v51 stringByAppendingPathComponent:@"private/com.apple.photoanalysisd/caches/graph"];
          long long v95 = 0u;
          long long v96 = 0u;
          long long v97 = 0u;
          long long v98 = 0u;
          v69 = [(CPLDiagnoseCommand *)self prependPath:v68 toStringsInArray:&off_10003B5C8];
          id v70 = [v69 countByEnumeratingWithState:&v95 objects:v127 count:16];
          if (v70)
          {
            id v71 = v70;
            uint64_t v72 = *(void *)v96;
            do
            {
              for (kk = 0; kk != v71; kk = (char *)kk + 1)
              {
                if (*(void *)v96 != v72) {
                  objc_enumerationMutation(v69);
                }
                [(CPLDiagnoseCommand *)self collectDatabaseAtPath:*(void *)(*((void *)&v95 + 1) + 8 * (void)kk) libraryPath:v51 subdirectory:v56];
              }
              id v71 = [v69 countByEnumeratingWithState:&v95 objects:v127 count:16];
            }
            while (v71);
          }

          if (([v50 isEqualToString:@"Photos/Libraries/Syndication.photoslibrary"] & 1) == 0)
          {
            long long v74 = [v88 stringByAppendingPathComponent:@"rebuildHistory"];
            [(CPLDiagnoseCommand *)self collectFileAtPath:v74];
          }
          [(CPLDiagnoseCommand *)self collectAdditionalInformationForDatabaseAtPath:v51 toDirectory:v56];

          uint64_t v48 = v82;
          id v7 = v83;
          double v47 = &CFDictionaryGetTypeID_ptr;
        }
        else
        {
          [(CPLCTLCommand *)self printFormat:@"- Well known library does not exist at: %@", v51];
        }
      }
      id v89 = [v85 countByEnumeratingWithState:&v107 objects:v130 count:16];
    }
    while (v89);
  }
}

- (void)collectAdditionalInformationForDatabaseAtPath:(id)a3 toDirectory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSString stringWithFormat:@"Getting %@ listing", v7];
  id v9 = [v7 stringByAppendingPathComponent:@"listing.txt"];
  [(CPLDiagnoseCommand *)self collectFileListingAtPath:v6 label:v8 filename:v9 extendedDetail:1];

  if (self->_hasFullShellCommands && self->_isAppleInternal && !self->_skipLibraryPreprocessing)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000184AC;
    v10[3] = &unk_1000350C8;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    [(CPLDiagnoseCommand *)self runAsUser:v10];
  }
}

- (void)collectLOFetchRecordings
{
  [(CPLCTLCommand *)self printFormat:@"Identifying fetch recordings..."];
  v20[0] = self->_photosctlCommand;
  v20[1] = @"lofr";
  v20[2] = @"list";
  v20[3] = @"-j";
  id v3 = +[NSArray arrayWithObjects:v20 count:4];
  unsigned int v4 = [(CPLDiagnoseCommand *)self collectOutputOfCommandAndArguments:v3 label:@"Finding fetch recordings" filename:@"fetch_recording_paths.json" outputIsStderr:0 timeout:1];

  if (v4)
  {
    id v5 = [(NSURL *)self->_outputFolder URLByAppendingPathComponent:@"fetch_recording_paths.json"];
    id v6 = +[NSData dataWithContentsOfURL:v5];
    if ([v6 length])
    {
      id v7 = +[NSJSONSerialization JSONObjectWithData:v6 options:0 error:0];
      if ([v7 count])
      {
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v14 = v7;
        id v8 = v7;
        id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v16;
          do
          {
            id v12 = 0;
            do
            {
              if (*(void *)v16 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v12) objectForKeyedSubscript:@"filePath"];
              [(CPLCTLCommand *)self printFormat:@"- ... Found recording at: %@", v13];
              if ([v13 length]) {
                [(CPLDiagnoseCommand *)self collectFileAtPath:v13];
              }

              id v12 = (char *)v12 + 1;
            }
            while (v10 != v12);
            id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
          }
          while (v10);
        }

        id v7 = v14;
      }
    }
    else
    {
      [(CPLCTLCommand *)self printFormat:@"- ... No data in path listing file."];
    }
  }
}

- (void)collectSearchDiagnostics
{
  [(CPLCTLCommand *)self printFormat:@"Collecting Search Diagnostics..."];
  [(CPLDiagnoseCommand *)self _collectPhotosSearchDiagnostics];
  [(CPLDiagnoseCommand *)self _collectUniversalSearchDiagnostics];
  [(CPLDiagnoseCommand *)self _collectSearchEntityDonationDiagnostics];
}

- (void)collectMemoryCreationDiagnostics
{
  if (_os_feature_enabled_impl())
  {
    [(CPLCTLCommand *)self printFormat:@"Collecting MC Diagnostics..."];
    [(CPLDiagnoseCommand *)self _collectMemoryCreationFeatureAvailabilityDiagnostics];
  }
}

- (id)_photosSpotlightSearchAttributes
{
  return @"-a photosDonationTimestamp -a photosSceneAnalysisVersion -a photosFaceAnalysisVersion -a photosMediaAnalysisImageVersion -a photosMediaAnalysisVersion -a photosCharacterRecognitionAnalysisVersion -a photosPrivateEncryptedComputeAnalysisVersion -a photosLocationPrivateEncryptedComputeAnalysisVersion -a photosImageEmbeddingVersion -a photosVideoEmbeddingVersion -a kMDItemPhotosResultType -a photosEmbeddingCount";
}

- (id)_syndicationLibrarySpotlightSearchAttributes
{
  unsigned int v2 = [(CPLDiagnoseCommand *)self _photosSpotlightSearchAttributes];
  id v3 = [v2 stringByAppendingFormat:@" -a photosSavedFromAppBundleIdentifier"];

  return v3;
}

- (void)_collectPhotosSearchDiagnostics
{
  v7[0] = self->_photosctlCommand;
  v7[1] = @"search";
  v7[2] = @"index";
  v7[3] = @"s";
  id v3 = +[NSArray arrayWithObjects:v7 count:4];
  [(CPLDiagnoseCommand *)self collectOutputOfCommandAndArguments:v3 label:@"Collecting Photos Search index status" filename:@"search_photos_index_status.txt" outputIsStderr:0 timeout:1];

  unsigned int v4 = [(CPLDiagnoseCommand *)self _photosSpotlightSearchAttributes];
  id v5 = +[NSString stringWithFormat:@"/usr/local/bin/search -b com.apple.mobileslideshow %@", v4];

  [(CPLDiagnoseCommand *)self collectOutputOfCommand:v5 label:@"Collecting Photos Search Spotlight index state" filename:@"search_photos_spotlight_details.txt"];
  id v6 = +[NSString stringWithFormat:@"/usr/local/bin/searchutil -s"];
  [(CPLDiagnoseCommand *)self collectOutputOfCommand:v6 label:@"Collecting Spotlight index status" filename:@"search_photos_searchutil_status.txt"];
  [(CPLDiagnoseCommand *)self collectFileAtPath:@"/var/MobileAsset/AssetsV2/com_apple_MobileAsset_SpotlightResources/com_apple_MobileAsset_SpotlightResources.xml"];
  [(CPLDiagnoseCommand *)self collectFileListingAtPath:@"/var/MobileAsset/AssetsV2 /com_apple_MobileAsset_SpotlightResources/" label:@"Collecting Spotlight Resources listing" filename:@"spotlightResourcesDirectory.txt" extendedDetail:1];
}

- (void)_collectUniversalSearchDiagnostics
{
  if (![(CPLDiagnoseCommand *)self includeSyndication])
  {
    v8[0] = self->_photosctlCommand;
    v8[1] = @"search";
    v8[2] = @"index";
    v8[3] = @"s";
    v8[4] = @"-l";
    v8[5] = @"3";
    id v3 = +[NSArray arrayWithObjects:v8 count:6];
    [(CPLDiagnoseCommand *)self collectOutputOfCommandAndArguments:v3 label:@"Collecting Photos Search index status for Syndication Library" filename:@"search_syndication_index_status.txt" outputIsStderr:0 timeout:1];

    [(CPLDiagnoseCommand *)self collectOutputOfCommand:@"/usr/local/bin/searchutil -s" label:@"Collecting Spotlight index status" filename:@"search_syndication_searchutil_status.txt"];
    [(CPLDiagnoseCommand *)self collectOutputOfCommand:@"/usr/local/bin/search -l '_kMDItemEligibleForPhotosProcessing>0'" label:@"Collecting Universal Search eligible CSSIDs" filename:@"search_syndication_eligible_items.txt"];
    unsigned int v4 = [(CPLDiagnoseCommand *)self _syndicationLibrarySpotlightSearchAttributes];
    id v5 = +[NSString stringWithFormat:@"/usr/local/bin/search -l '_kMDItemEligibleForPhotosProcessing>0 && kMDItemPhotosDonationState>0' %@", v4];

    [(CPLDiagnoseCommand *)self collectOutputOfCommand:v5 label:@"Collecting Universal Search Spotlight index state" filename:@"search_syndication_spotlight_details.txt"];
    id v6 = [(id)objc_opt_class() _syndicationLibraryPath];
    id v7 = [@"jujubectl photos analysisSummary --oneline --photo-library " stringByAppendingString:v6];

    [(CPLDiagnoseCommand *)self collectOutputOfCommand:v7 label:@"Collecting Universal Search Media Analysis Summary" filename:@"search_syndication_mediaanalysis_summary.txt"];
  }
}

- (void)_collectSearchEntityDonationDiagnostics
{
  v8[0] = self->_photosctlCommand;
  v8[1] = @"search-entity-donation";
  v8[2] = @"print-rankings";
  id v3 = +[NSArray arrayWithObjects:v8 count:3];
  [(CPLDiagnoseCommand *)self collectOutputOfCommandAndArguments:v3 label:@"Getting Search Entity Donation Rankings" filename:@"search_entity_donation_rankings.txt" outputIsStderr:0 timeout:1];

  v7[0] = self->_photosctlCommand;
  v7[1] = @"search-entity-donation";
  v7[2] = @"print-moment-info";
  unsigned int v4 = +[NSArray arrayWithObjects:v7 count:3];
  [(CPLDiagnoseCommand *)self collectOutputOfCommandAndArguments:v4 label:@"Getting Search Entity Donation Per-Moment Info" filename:@"search_entity_donation_moment_info.txt" outputIsStderr:0 timeout:1];

  v6[0] = self->_photosctlCommand;
  v6[1] = @"search-entity-donation";
  v6[2] = @"print-person-relationships";
  id v5 = +[NSArray arrayWithObjects:v6 count:3];
  [(CPLDiagnoseCommand *)self collectOutputOfCommandAndArguments:v5 label:@"Getting Search Entity Donation Person Relationships" filename:@"search_entity_donation_person_relationships.txt" outputIsStderr:0 timeout:1];
}

- (void)_collectMemoryCreationFeatureAvailabilityDiagnostics
{
  v6[0] = self->_photosctlCommand;
  v6[1] = @"feature-availability";
  v6[2] = @"read-availability";
  void v6[3] = @"memories-creation";
  id v3 = +[NSArray arrayWithObjects:v6 count:4];
  [(CPLDiagnoseCommand *)self collectOutputOfCommandAndArguments:v3 label:@"Getting mc feature availability" filename:@"feature_availability_mc.txt" outputIsStderr:0 timeout:1];

  v5[0] = self->_photosctlCommand;
  v5[1] = @"story";
  v5[2] = @"availability";
  unsigned int v4 = +[NSArray arrayWithObjects:v5 count:3];
  [(CPLDiagnoseCommand *)self collectOutputOfCommandAndArguments:v4 label:@"Getting story availability" filename:@"story_availability.txt" outputIsStderr:0 timeout:1];
}

- (void)_collectSharedAlbumFilesAtPath:(id)a3
{
  id v4 = a3;
  id v5 = [(NSURL *)self->_outputFolder URLByAppendingPathComponent:@"SharedAlbums"];
  id v6 = +[NSFileManager defaultManager];
  [v6 createDirectoryAtURL:v5 withIntermediateDirectories:0 attributes:0 error:0];

  id v7 = +[NSFileManager defaultManager];
  id v8 = [v7 contentsOfDirectoryAtPath:v4 error:0];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100019060;
  v11[3] = &unk_1000350F0;
  id v12 = v4;
  id v13 = self;
  id v14 = v5;
  id v9 = v5;
  id v10 = v4;
  [v8 enumerateObjectsUsingBlock:v11];
}

- (void)signalProcesses
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  id v4 = [(CPLDiagnoseCommand *)self processes];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100019334;
  void v8[3] = &unk_100035118;
  id v5 = v3;
  id v9 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  if ([v5 length])
  {
    id v6 = [objc_alloc((Class)NSString) initWithFormat:@"%@ -INFO%@", @"/usr/bin/killall", v5];
    id v7 = [objc_alloc((Class)NSString) initWithFormat:@"Sending SIGINFO to%@", v5];
    [(CPLDiagnoseCommand *)self collectOutputOfCommand:v6 label:v7 filename:0];
  }
}

- (void)sampleProcesses
{
  id v3 = +[NSFileManager defaultManager];
  outputFolder = self->_outputFolder;
  id v5 = [(CPLDiagnoseCommand *)self processDetailPath:&stru_1000359E8];
  id v6 = [(NSURL *)outputFolder URLByAppendingPathComponent:v5];
  [v3 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:0];

  id v7 = [(CPLDiagnoseCommand *)self processes];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000194E0;
  v9[3] = &unk_100035118;
  v9[4] = self;
  [v7 enumerateKeysAndObjectsUsingBlock:v9];

  if (!self->_isRoot)
  {
    id v8 = [(id)objc_opt_class() toolName];
    [(CPLCTLCommand *)self printFormat:@"- Can't sample root processes as %@ is not run with root permissions", v8];
  }
}

- (void)collectDefaults
{
  id v3 = [(CPLDiagnoseCommand *)self processes];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100019628;
  v4[3] = &unk_100035118;
  v4[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v4];

  [(CPLDiagnoseCommand *)self collectOutputOfCommand:@"/usr/bin/defaults read /var/mobile/Library/Preferences/com.apple.mediaanalysis.plist" label:@"Getting defaults for com.apple.mediaanalysis" filename:@"com.apple.mediaanalysis-defaults.txt"];
}

- (void)_printWrapperStatus:(id)a3
{
  id v4 = a3;
  id v5 = [v4 parameters];
  uint64_t v6 = [v5 libraryIdentifier];
  if ([v4 isOpened])
  {
LABEL_7:
    CFStringRef v11 = (const __CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @" (%lu clients)", objc_msgSend(v4, "clientCount"));
    goto LABEL_8;
  }
  id v7 = [v4 openError];

  if (v7)
  {
    id v8 = objc_alloc((Class)NSString);
    id v9 = [v4 openError];
    id v10 = [v9 localizedDescription];
    CFStringRef v11 = (const __CFString *)[v8 initWithFormat:@" (%@)", v10];

    if (v11) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if ([v4 clientCount])
  {
    CFStringRef v11 = (const __CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @" (opening with %lu clients)", objc_msgSend(v4, "clientCount"));
    if (v11) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  CFStringRef v11 = @" (opening)";
LABEL_8:
  id v32 = v4;
  id v29 = (__CFString *)v11;
  uint64_t v30 = (void *)v6;
  [(CPLCTLCommand *)self printFormat:@"  * %@%@:", v6, v11];
  uint64_t v31 = v5;
  id v12 = [v5 asPlist];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v13 = [v12 allKeys];
  id v14 = [v13 sortedArrayUsingSelector:"compare:"];

  id v15 = [v14 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v15)
  {
    id v16 = v15;
    CFStringRef v17 = @"libraryIdentifier";
    uint64_t v18 = *(void *)v35;
    uint64_t v33 = *(void *)v35;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(v14);
        }
        unsigned __int8 v20 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if (([v20 isEqualToString:v17] & 1) == 0)
        {
          uint64_t v21 = [v12 objectForKeyedSubscript:v20];
          if ([v20 isEqualToString:@"options"])
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v22 = +[CPLLibraryManager descriptionForLibraryOptions:](CPLLibraryManager, "descriptionForLibraryOptions:", [v21 integerValue]);
              goto LABEL_21;
            }
          }
          if ([v20 hasSuffix:@"Path"]
            && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            CFStringRef v23 = v17;
            uint64_t v24 = v14;
            id v25 = v12;
            id v26 = self;
            id v27 = [objc_alloc((Class)NSURL) initFileURLWithPath:v21 isDirectory:1];
            id v28 = [(CPLDiagnoseCommand *)v26 _simplifiedPathForURL:v27];

            self = v26;
            id v12 = v25;
            id v14 = v24;
            CFStringRef v17 = v23;
          }
          else
          {
            uint64_t v22 = [v21 description];
LABEL_21:
            id v28 = (void *)v22;
          }
          [(CPLCTLCommand *)self printFormat:@"      %@: %@", v20, v28];

          uint64_t v18 = v33;
          continue;
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v16);
  }
}

- (void)collectCloudPhotodGlobalStatus
{
  [(CPLCTLCommand *)self printFormat:@"- Collecting global status for cloudphotod"];
  diagnosticLog = self->_diagnosticLog;
  if (diagnosticLog)
  {
    id v4 = [(NSURL *)self->_outputFolder URLByAppendingPathComponent:@"cloudphotod-status.log" isDirectory:0];
    id v5 = fopen((const char *)[v4 fileSystemRepresentation], "a+");
    if (v5)
    {
      self->_diagnosticLog = v5;
      [(CPLCTLCommand *)self setLogOutputFd:fileno(v5)];
    }
    else
    {
      uint64_t v6 = [(CPLDiagnoseCommand *)self _simplifiedPathForURL:v4];
      id v7 = __error();
      [(CPLCTLCommand *)self printFormat:@"  can't create cloudphotod status log at %@: %s", v6, strerror(*v7)];

      diagnosticLog = 0;
    }
  }
  id v8 = [(CPLCTLCommand *)self daemonConnection];
  [v8 queue];
  uint64_t v59 = 0;
  id v60 = &v59;
  uint64_t v61 = 0x2020000000;
  char v62 = 1;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x2020000000;
  char v58 = 0;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = sub_10001A184;
  v55[4] = sub_10001A194;
  id v56 = 0;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_10001A19C;
  v51[3] = &unk_100034DF0;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v52 = v9;
  unsigned __int8 v53 = v57;
  long long v54 = v55;
  id v10 = objc_retainBlock(v51);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10001A21C;
  v44[3] = &unk_100035190;
  uint64_t v48 = v55;
  id v49 = v57;
  id v27 = v8;
  id v45 = v27;
  CFStringRef v11 = v10;
  id v46 = self;
  id v47 = v11;
  uint64_t v50 = &v59;
  id v12 = objc_retainBlock(v44);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10001A43C;
  v38[3] = &unk_1000351B8;
  id v42 = v55;
  id v13 = v9;
  id v39 = v13;
  id v14 = v11;
  uint64_t v40 = self;
  id v41 = v14;
  id v43 = &v59;
  id v15 = objc_retainBlock(v38);
  [(CPLCTLCommand *)self printFormat:@"- Collecting daemon status"];
  if (*((unsigned char *)v60 + 24))
  {
    id v16 = ((void (*)(void *))v12[2])(v12);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10001A5B4;
    v36[3] = &unk_1000351E0;
    v36[4] = self;
    long long v37 = v14;
    [v16 getDaemonStatusWithCompletionHandler:v36];

    ((void (*)(void *))v15[2])(v15);
  }
  else
  {
    [(CPLCTLCommand *)self printFormat:@"  skipped"];
  }
  [(CPLCTLCommand *)self printFormat:@"- Collecting registered daemon engines"];
  id v35 = 0;
  CFStringRef v17 = [(CPLDiagnoseCommand *)self getEngineWrapperStatusesWithError:&v35];
  id v18 = v35;
  id v28 = v18;
  if (!v17)
  {
    id v19 = [v18 localizedDescription];
    [(CPLCTLCommand *)self printFormat:@"  failed: %@", v19];
LABEL_20:

    goto LABEL_22;
  }
  if ([v17 count])
  {
    [(CPLCTLCommand *)self printFormat:&stru_1000359E8];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v19 = v17;
    id v20 = [v19 countByEnumeratingWithState:&v31 objects:v63 count:16];
    if (v20)
    {
      id v26 = diagnosticLog;
      uint64_t v21 = *(void *)v32;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v19);
          }
          [(CPLDiagnoseCommand *)self _printWrapperStatus:*(void *)(*((void *)&v31 + 1) + 8 * i)];
          [(CPLCTLCommand *)self printFormat:&stru_1000359E8];
        }
        id v20 = [v19 countByEnumeratingWithState:&v31 objects:v63 count:16];
      }
      while (v20);
      diagnosticLog = v26;
    }
    goto LABEL_20;
  }
  [(CPLCTLCommand *)self printFormat:@"    no registered engines"];
LABEL_22:
  [(CPLCTLCommand *)self printFormat:@"- Collecting connected librarymanagers"];
  if (*((unsigned char *)v60 + 24))
  {
    CFStringRef v23 = ((void (*)(void *))v12[2])(v12);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10001A830;
    v29[3] = &unk_100035208;
    v29[4] = self;
    uint64_t v30 = v14;
    [v23 getDaemonLibraryManagerStatusesWithCompletionHandler:v29];

    ((void (*)(void *))v15[2])(v15);
  }
  if (diagnosticLog)
  {
    uint64_t v24 = self->_diagnosticLog;
    if (v24) {
      fclose(v24);
    }
    self->_diagnosticLog = diagnosticLog;
    [(CPLCTLCommand *)self setLogOutputFd:fileno(diagnosticLog)];
  }
  if (*((unsigned char *)v60 + 24)) {
    CFStringRef v25 = @"- Collecting global status for cloudphotod: done";
  }
  else {
    CFStringRef v25 = @"- Collecting global status for cloudphotod: failed";
  }
  [(CPLCTLCommand *)self printFormat:v25];

  _Block_object_dispose(v55, 8);
  _Block_object_dispose(v57, 8);
  _Block_object_dispose(&v59, 8);
}

- (void)collectCloudPhotodStatusWithLibraryIdentifier:(id)a3 subdirectory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CPLCTLCommand *)self printFormat:@"- Collecting %@ status for %@", @"cloudphotod", v6];
  id v38 = 0;
  id v8 = [(CPLCTLCommand *)self openedLibraryManagerWithLibraryIdentifier:v6 timeout:1 withTargetUserIdentifier:0 error:&v38];
  id v9 = v38;
  id v10 = v9;
  if (v8)
  {
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    uint64_t v32 = 0;
    long long v33 = &v32;
    uint64_t v34 = 0x3032000000;
    id v35 = sub_10001A184;
    long long v36 = sub_10001A194;
    id v37 = 0;
    uint64_t v26 = 0;
    id v27 = &v26;
    uint64_t v28 = 0x3032000000;
    id v29 = sub_10001A184;
    uint64_t v30 = sub_10001A194;
    id v31 = 0;
    id v12 = [(NSURL *)self->_outputFile lastPathComponent];
    id v13 = +[NSString stringWithFormat:@"Collecting CPL diagnostics in %@", v12];
    [v8 addInfoToLog:v13];

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    void v22[2] = sub_10001AE58;
    v22[3] = &unk_100035230;
    uint64_t v24 = &v26;
    CFStringRef v25 = &v32;
    id v14 = v11;
    CFStringRef v23 = v14;
    [v8 getStatusForComponents:0 completionHandler:v22];
    dispatch_time_t v15 = dispatch_time(0, 40000000000);
    if (dispatch_semaphore_wait(v14, v15))
    {
      [(CPLCTLCommand *)self printFormat:@"  took too long"];
    }
    else
    {
      id v16 = (void *)v33[5];
      if (v16)
      {
        CFStringRef v17 = [v16 localizedDescription];
        [(CPLCTLCommand *)self printFormat:@"  failed: %@", v17];
      }
      else
      {
        outputFolder = self->_outputFolder;
        if (v7)
        {
          id v19 = [(NSURL *)outputFolder URLByAppendingPathComponent:v7];
        }
        else
        {
          id v19 = outputFolder;
        }
        id v20 = v19;
        uint64_t v21 = +[NSFileManager defaultManager];
        [v21 createDirectoryAtURL:v20 withIntermediateDirectories:1 attributes:0 error:0];

        CFStringRef v17 = [(NSURL *)v20 URLByAppendingPathComponent:@"cplstatus.txt" isDirectory:0];

        [(id)v27[5] writeToURL:v17 atomically:0 encoding:4 error:0];
      }
    }
    [(CPLCTLCommand *)self closeLibraryManager:v8];

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v32, 8);
  }
  else
  {
    id v14 = [v9 localizedDescription];
    [(CPLCTLCommand *)self printFormat:@"  failed to contact %@: %@", @"cloudphotod", v14];
  }
}

- (void)collectAppLibraryIdentifiers
{
  unsigned int v2 = self;
  [(CPLCTLCommand *)self printFormat:@"- Collecting Registered App Libraries"];
  id v36 = 0;
  id v3 = [(CPLCTLCommand *)v2 getLibraryIdentifiersWithDomain:3 error:&v36];
  id v4 = v36;
  id v5 = v4;
  if (v3)
  {
    -[CPLCTLCommand printFormat:](v2, "printFormat:", @"  found %lu libraries", [v3 count]);
    id v6 = [(NSURL *)v2->_outputFolder URLByAppendingPathComponent:@"AppLibraries.txt" isDirectory:0];
    if ([v3 count])
    {
      uint64_t v26 = v6;
      id v27 = v2;
      uint64_t v28 = v5;
      id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v29 = v3;
      id obj = v3;
      id v8 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v33;
        do
        {
          dispatch_semaphore_t v11 = 0;
          do
          {
            if (*(void *)v33 != v10) {
              objc_enumerationMutation(obj);
            }
            id v12 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v11);
            id v13 = objc_alloc((Class)NSString);
            id v14 = [v12 name];
            dispatch_time_t v15 = [v12 uuid];
            id v16 = [v12 containerIdentifier];
            CFStringRef v17 = [v12 path];
            id v18 = [v17 stringByAbbreviatingWithTildeInPath];
            id v19 = [v13 initWithFormat:@"* %@ / %@ - %@\n    path: %@", v14, v15, v16, v18];
            [v7 addObject:v19];

            dispatch_semaphore_t v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          id v9 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
        }
        while (v9);
      }

      id v20 = [v7 componentsJoinedByString:@"\n"];

      id v5 = v28;
      id v3 = v29;
      id v6 = v26;
      unsigned int v2 = v27;
    }
    else
    {
      id v20 = @"* No App Libraries registered";
    }
    [(CPLCTLCommand *)v2 printFormat:@"%@", v20];
    id v21 = [objc_alloc((Class)NSString) initWithFormat:@"Registered App Libraries:\n%@\n", v20];

    id v31 = 0;
    unsigned __int8 v22 = [v21 writeToURL:v6 atomically:1 encoding:4 error:&v31];
    id v23 = v31;
    if ((v22 & 1) == 0)
    {
      uint64_t v24 = [v6 lastPathComponent];
      CFStringRef v25 = [v23 localizedDescription];
      [(CPLCTLCommand *)v2 printFormat:@"  failed to write to %@: %@", v24, v25];
    }
  }
  else
  {
    id v6 = [v4 localizedDescription];
    [(CPLCTLCommand *)v2 printFormat:@"  failed: %@", v6];
  }
}

- (void)collectAccountStatus
{
  [(CPLCTLCommand *)self printFormat:@"- Collecting Account status"];
  id v3 = objc_alloc_init((Class)NSMutableString);
  id v4 = objc_alloc_init((Class)ACAccountStore);
  id v5 = objc_msgSend(v4, "aa_primaryAppleAccount");

  if (!v5)
  {
    CFStringRef v10 = @"Unable to read accounts\n";
    goto LABEL_13;
  }
  unsigned int v6 = [v5 isEnabledForDataclass:kAccountDataclassCloudPhotos];
  unsigned int v7 = [v5 isEnabledForDataclass:kAccountDataclassMediaStream];
  unsigned int v8 = [v5 isEnabledForDataclass:kAccountDataclassSharedStreams];
  unsigned int v9 = [v5 isEnabledForDataclass:@"com.apple.Dataclass.ImagePlayground"];
  if ((v6 & 1) == 0 && (v7 & 1) == 0 && !v8)
  {
    CFStringRef v10 = @"No accounts enabled\n";
    goto LABEL_13;
  }
  [v3 appendString:@"Enabled accounts: "];
  if (v6)
  {
    [v3 appendString:@"CPL "];
    if (!v7)
    {
LABEL_9:
      if (!v8) {
        goto LABEL_10;
      }
LABEL_18:
      [v3 appendString:@"SharedAlbum "];
      if (!v9) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if (!v7)
  {
    goto LABEL_9;
  }
  [v3 appendString:@"MPS "];
  if (v8) {
    goto LABEL_18;
  }
LABEL_10:
  if (v9) {
LABEL_11:
  }
    [v3 appendString:@"ImagePlayground "];
LABEL_12:
  CFStringRef v10 = @"\n";
LABEL_13:
  [v3 appendString:v10];
  dispatch_semaphore_t v11 = [(NSURL *)self->_outputFolder URLByAppendingPathComponent:@"account_status.txt" isDirectory:0];
  id v15 = 0;
  unsigned __int8 v12 = [v3 writeToURL:v11 atomically:0 encoding:4 error:&v15];
  id v13 = v15;
  id v14 = v13;
  if ((v12 & 1) == 0) {
    [(CPLCTLCommand *)self printFormat:@"- Failed to write account_status.txt: %@, error: %@", v11, v13];
  }
}

- (void)collectDuetInfo
{
  if (self->_hasFullShellCommands && self->_isAppleInternal)
  {
    [(CPLDiagnoseCommand *)self collectOutputOfCommand:@"/usr/local/bin/cdattrhist2 -name com.apple.coreduet.attribute.screenLock -t i -q" label:@"Getting screen lock/unlock events" filename:@"screenlocks.txt"];
    [(CPLDiagnoseCommand *)self collectOutputOfCommand:@"/usr/local/bin/cdattrhist2 -name com.apple.coreduet.attribute.sleepWake -t i -q" label:@"Getting sleep/wake events" filename:@"sleepwake.txt"];
  }
}

- (void)collectLocalLibraryMetadataInfo
{
  if (self->_isAppleInternal)
  {
    if (!self->_skipLibraryPreprocessing)
    {
      v16[0] = self->_photosctlCommand;
      v16[1] = @"allmomentsmetadata";
      v16[2] = @"all_moments_details.plist";
      id v3 = +[NSArray arrayWithObjects:v16 count:3];
      [(CPLDiagnoseCommand *)self collectOutputOfCommandAndArguments:v3 label:@"Dumping all moments metadata" filename:0 outputIsStderr:0 timeout:1];

      v15[0] = self->_photosctlCommand;
      v15[1] = @"printchangestore";
      id v4 = +[NSArray arrayWithObjects:v15 count:2];
      [(CPLDiagnoseCommand *)self collectOutputOfCommandAndArguments:v4 label:@"Getting the changestore" filename:@"changestore.txt" outputIsStderr:1 timeout:1];

      v14[0] = self->_photosctlCommand;
      v14[1] = @"listnonsharedphotouuids";
      id v5 = +[NSArray arrayWithObjects:v14 count:2];
      [(CPLDiagnoseCommand *)self collectOutputOfCommandAndArguments:v5 label:@"Getting local photo GUIDs" filename:@"local_photo_guids.txt" outputIsStderr:0 timeout:1];

      v13[0] = self->_photosctlCommand;
      v13[1] = @"hascompletedrestore";
      unsigned int v6 = +[NSArray arrayWithObjects:v13 count:2];
      [(CPLDiagnoseCommand *)self collectOutputOfCommandAndArguments:v6 label:@"Getting assetsd restoring state" filename:0 outputIsStderr:0 timeout:1];

      v12[0] = self->_photosctlCommand;
      v12[1] = @"incompleterestoreprocesses";
      unsigned int v7 = +[NSArray arrayWithObjects:v12 count:2];
      [(CPLDiagnoseCommand *)self collectOutputOfCommandAndArguments:v7 label:@"Getting assetsd incomplete restore processes" filename:0 outputIsStderr:0 timeout:1];

      v11[0] = self->_photosctlCommand;
      v11[1] = @"listincomplete";
      unsigned int v8 = +[NSArray arrayWithObjects:v11 count:2];
      [(CPLDiagnoseCommand *)self collectOutputOfCommandAndArguments:v8 label:@"Getting assetsd incomplete list" filename:@"incompletelist.txt" outputIsStderr:0 timeout:1];
    }
    v10[0] = self->_photosctlCommand;
    v10[1] = @"cpl";
    v10[2] = @"status";
    unsigned int v9 = +[NSArray arrayWithObjects:v10 count:3];
    [(CPLDiagnoseCommand *)self collectOutputOfCommandAndArguments:v9 label:@"Getting cpl state" filename:@"cplstate.txt" outputIsStderr:0 timeout:1];
  }
}

- (void)collectTaskInfo
{
  id v3 = [(CPLDiagnoseCommand *)self processes];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001B830;
  v4[3] = &unk_100035118;
  v4[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

- (void)collectPreferences
{
  id v3 = [(NSURL *)self->_outputFolder URLByAppendingPathComponent:@"Preferences"];
  id v4 = +[NSFileManager defaultManager];
  [v4 createDirectoryAtURL:v3 withIntermediateDirectories:0 attributes:0 error:0];

  [(CPLDiagnoseCommand *)self writePreferenceInDomain:0 withKey:@"AppleLanguages" toDirectory:v3 currentUser:1];
  [(CPLDiagnoseCommand *)self writePreferenceInDomain:0 withKey:@"AppleLocale" toDirectory:v3 currentUser:1];
  id v5 = [(CPLDiagnoseCommand *)self processes];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001BA60;
  void v7[3] = &unk_100035258;
  void v7[4] = self;
  id v8 = v3;
  id v6 = v3;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)collectSysdiagnose:(id)a3
{
  id v4 = a3;
  if (!self->_skipSysdiagnose)
  {
    id v5 = +[NSMutableDictionary dictionary];
    [v5 setObject:&__kCFBooleanFalse forKeyedSubscript:@"coSysdiagnose"];
    [v5 setObject:&__kCFBooleanFalse forKeyedSubscript:@"shouldDisplayTarBall"];
    [v5 setObject:&__kCFBooleanFalse forKeyedSubscript:@"shouldCreateTarBall"];
    [(CPLCTLCommand *)self printFormat:@"- Collecting sysdiagnose (background)"];
    +[NSDate timeIntervalSinceReferenceDate];
    uint64_t v7 = v6;
    if (self->_fullSysdiagnoseLogArchive)
    {
      [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"capOverrideFullLogarchive"];
      [(CPLCTLCommand *)self printFormat:@"  collect full system log archive"];
    }
    id v8 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001BC78;
    block[3] = &unk_100035280;
    uint64_t v13 = v7;
    id v11 = v5;
    unsigned __int8 v12 = self;
    id v9 = v5;
    dispatch_group_async(v4, v8, block);
  }
}

- (void)collectSilentMover
{
  [(CPLDiagnoseCommand *)self setUserMode:1];
  id v15 = [@"/var/mobile/Media/PhotoData/private/com.apple.assetsd" stringByAppendingPathComponent:@"cplprivateengines.plist"];
  +[CPLPrivateEngineAlias setOverridePrivateEngineAliasPath:](CPLPrivateEngineAlias, "setOverridePrivateEngineAliasPath:");
  id v3 = +[CPLPrivateEngineAlias privateEngineAliasWithName:@"silent-mover"];
  id v4 = +[CPLPrivateEngineAlias privateEngineAliasWithName:@"per-device-silent-mover"];
  if (v3)
  {
    id v5 = [v3 cplDirectoryURL];
    if ([v5 checkResourceIsReachableAndReturnError:0])
    {
      [(CPLDiagnoseCommand *)self collectFileAtURL:v5 suffix:0 destinationDirectory:self->_outputFolder];
      uint64_t v6 = +[NSURL fileURLWithPath:@"/AppleInternal/Library/Photos/Backend/CPL/silent-mover.py" isDirectory:0];
      outputFolder = self->_outputFolder;
      id v8 = [v5 lastPathComponent];
      id v9 = [(NSURL *)outputFolder URLByAppendingPathComponent:v8];
      [(CPLDiagnoseCommand *)self collectFileAtURL:v6 suffix:0 destinationDirectory:v9];
    }
  }
  if (v4)
  {
    CFStringRef v10 = [v4 cplDirectoryURL];
    if ([v10 checkResourceIsReachableAndReturnError:0])
    {
      [(CPLDiagnoseCommand *)self collectFileAtURL:v10 suffix:0 destinationDirectory:self->_outputFolder];
      id v11 = +[NSURL fileURLWithPath:@"/AppleInternal/Library/Photos/Backend/CPL/silent-mover.py" isDirectory:0];
      unsigned __int8 v12 = self->_outputFolder;
      uint64_t v13 = [v10 lastPathComponent];
      id v14 = [(NSURL *)v12 URLByAppendingPathComponent:v13];
      [(CPLDiagnoseCommand *)self collectFileAtURL:v11 suffix:0 destinationDirectory:v14];
    }
  }
  [(CPLDiagnoseCommand *)self revertToRootMode:1];
}

+ (id)_syndicationLibraryPath
{
  return @"/var/mobile/Library/Photos/Libraries/Syndication.photoslibrary";
}

- (void)determineLibraryPaths
{
  if (sub_1000043F4((uint64_t)self, self->_libraryPath, @"/var/mobile/Media"))
  {
    [(CPLCTLCommand *)self printFormat:@"  specified library path is the System Library"];
    self->_targetLibraryIsSPL = 1;
  }
  libraryPath = self->_libraryPath;
  id v4 = [(id)objc_opt_class() _syndicationLibraryPath];
  LODWORD(libraryPath) = sub_1000043F4((uint64_t)self, libraryPath, v4);

  if (libraryPath)
  {
    [(CPLCTLCommand *)self printFormat:@"  specified library path is the Syndication library"];
    self->_targetLibraryIsSyndication = 1;
  }
}

- (void)startDiagnostic
{
  id v3 = dispatch_group_create();
  [(CPLCTLCommand *)self printFormat:@"Diagnostics for %s", self->host];
  [(CPLCTLCommand *)self printFormat:@"============================"];
  id v4 = __CPLEnvironmentDictionary();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [v4 allKeys];
  uint64_t v6 = [v5 sortedArrayUsingSelector:"compare:"];

  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        unsigned __int8 v12 = [v4 objectForKey:v11];
        [(CPLCTLCommand *)self printFormat:@"  %@:\t%@", v11, v12];
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  [(CPLDiagnoseCommand *)self printDiskCapacity:@"start"];
  [(CPLDiagnoseCommand *)self collectPreferences];
  [(CPLDiagnoseCommand *)self collectSysdiagnose:v3];
  if (self->_hasFullShellCommands)
  {
    [(CPLDiagnoseCommand *)self sampleProcesses];
    if (self->_isRoot) {
      [(CPLDiagnoseCommand *)self collectTaskInfo];
    }
    [(CPLDiagnoseCommand *)self signalProcesses];
    if (self->_isAppleInternal)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      void v15[2] = sub_10001C57C;
      v15[3] = &unk_100034BA0;
      v15[4] = self;
      [(CPLDiagnoseCommand *)self runAsUser:v15];
    }
  }
  [(CPLDiagnoseCommand *)self determineLibraryPaths];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  void v14[2] = sub_10001C59C;
  v14[3] = &unk_100034BA0;
  v14[4] = self;
  [(CPLDiagnoseCommand *)self runAsUser:v14];
  [(CPLDiagnoseCommand *)self collectFiles];
  [(CPLDiagnoseCommand *)self collectDuetInfo];
  [(CPLDiagnoseCommand *)self collectDiagnosticLogs];
  [(CPLDiagnoseCommand *)self collectStoryDiagnosticsFiles];
  if (self->_hasFullShellCommands)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    void v13[2] = sub_10001C704;
    v13[3] = &unk_100034BA0;
    v13[4] = self;
    [(CPLDiagnoseCommand *)self runAsUser:v13];
  }
  if ([(CPLDiagnoseCommand *)self includeSPL])
  {
    [(CPLDiagnoseCommand *)self collectFileListingAtPath:@"/var/mobile/Media/DCIM" label:@"Getting DCIM contents" filename:@"DCIM_contents.txt" extendedDetail:0];
    [(CPLDiagnoseCommand *)self collectFileListingAtPath:@"/var/mobile/Media/PhotoData" label:@"Getting PhotoData contents" filename:@"PhotoData_contents.txt" extendedDetail:0];
    [(CPLDiagnoseCommand *)self collectFileListingAtPath:@"/var/mobile/Media/Photos" label:@"Getting Photos contents" filename:@"Photos_contents.txt" extendedDetail:0];
    [(CPLDiagnoseCommand *)self collectFileListingAtPath:@"/var/mobile/Media/PhotoStreamsData" label:@"Getting PhotoStreamsData contents" filename:@"PhotoStreamsData_contents.txt" extendedDetail:0];
    [(CPLDiagnoseCommand *)self collectFileListingAtPath:@"/var/mobile/Media/Deferred" label:@"Getting Deferred contents" filename:@"Deferred_contents.txt" extendedDetail:0];
  }
  [(CPLDiagnoseCommand *)self collectFileListingAtPath:@"/var/MobileAsset/AssetsV2/com_apple_MobileAsset_LinguisticData" label:@"Getting Asset Linguistic Data contents" filename:@"MobileAssetLinguisticData_contents.txt" extendedDetail:0];
  if (!self->_skipSysdiagnose) {
    [(CPLCTLCommand *)self printFormat:@"- Wait for sysdiagnose"];
  }
  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  if (!self->_skipSysdiagnose && self->_sysdiagnoseFailed) {
    [(CPLCTLCommand *)self printError:@"- sysdiagnose failed: see earlier error"];
  }
}

- (void)collectFilePaths:(id)a3 toSubdirectory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSURL *)self->_outputFolder URLByAppendingPathComponent:v7 isDirectory:1];
  uint64_t v9 = +[NSFileManager defaultManager];
  CFStringRef v10 = [v8 path];
  id v25 = 0;
  unsigned __int8 v11 = [v9 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:&v25];
  id v12 = v25;

  if (v11)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v13 = v6;
    id v14 = [v13 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v14)
    {
      id v15 = v14;
      id v20 = v6;
      uint64_t v16 = *(void *)v22;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = +[NSURL fileURLWithPath:*(void *)(*((void *)&v21 + 1) + 8 * i)];
          [(CPLDiagnoseCommand *)self collectFileAtURL:v18 suffix:0 destinationDirectory:v8];
        }
        id v15 = [v13 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v15);
      id v6 = v20;
    }
  }
  else
  {
    [(CPLCTLCommand *)self printError:@"Failed to create subdirectory %@: %@", v7, v12];
    incompleteTasks = self->incompleteTasks;
    id v13 = +[NSString stringWithFormat:@"Failed collecting %@.", v6];
    [(NSMutableArray *)incompleteTasks addObject:v13];
  }
}

- (id)interestingFilesInDirectoryPath:(id)a3 withPredicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSFileManager defaultManager];
  id v14 = 0;
  uint64_t v9 = [v8 contentsOfDirectoryAtPath:v6 error:&v14];
  id v10 = v14;

  if (v9)
  {
    unsigned __int8 v11 = [v9 filteredArrayUsingPredicate:v7];
    id v12 = [(CPLDiagnoseCommand *)self prependPath:v6 toStringsInArray:v11];
  }
  else
  {
    [(CPLCTLCommand *)self printError:@"Failed to get contents of %@: %@", v6, v10];
    id v12 = &__NSArray0__struct;
  }

  return v12;
}

- (void)addFilesFromVisionCacheToDictionary:(id)a3
{
  id v4 = a3;
  id v5 = +[NSPredicate predicateWithFormat:@"SELF IN %@", &off_10003B5F8];
  id v6 = +[NSPredicate predicateWithFormat:@"SELF like %@", @"*.cmap"];
  v10[0] = v5;
  v10[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v10 count:2];
  id v8 = +[NSCompoundPredicate orPredicateWithSubpredicates:v7];

  uint64_t v9 = [(CPLDiagnoseCommand *)self interestingFilesInDirectoryPath:@"/var/mobile/Media/PhotoData/Caches/VisionService" withPredicate:v8];
  [v4 setObject:v9 forKeyedSubscript:@"VisionService"];
}

+ (id)supportedFeatureAreas
{
  CFStringRef v4 = @"universalsearch";
  unsigned int v2 = +[NSArray arrayWithObjects:&v4 count:1];
  return v2;
}

- (void)collectFeatureAreaDiagnostics
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = self->_featureAreas;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v7), "isEqualToString:", @"universalsearch", (void)v8))-[CPLDiagnoseCommand _collectUniversalSearchFeatureAreaDiagnostics](self, "_collectUniversalSearchFeatureAreaDiagnostics"); {
        id v7 = (char *)v7 + 1;
        }
      }
      while (v5 != v7);
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_collectUniversalSearchFeatureAreaDiagnostics
{
  [(CPLCTLCommand *)self printFormat:@"- Collecting diagnostics for feature area: %@", @"universalsearch"];
  v4[0] = self->_photosctlCommand;
  v4[1] = @"search";
  v4[2] = @"universalsearchstatus";
  v4[3] = @"details";
  id v3 = +[NSArray arrayWithObjects:v4 count:4];
  [(CPLDiagnoseCommand *)self collectOutputOfCommandAndArguments:v3 label:@"Getting Universal Search status details" filename:@"universalSearchStatus.txt" outputIsStderr:0 timeout:1];
}

- (void)collectStoryDiagnosticsFiles
{
  if (self->_includeStoryDiagnostics && self->_isAppleInternal) {
    [(CPLDiagnoseCommand *)self collectFileAtPath:@"/var/mobile/Media/PhotoData/internal/storydiagnostics"];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_getWrapperStatusesError, 0);
  objc_storeStrong((id *)&self->_cachedWrapperStatuses, 0);
  objc_storeStrong((id *)&self->_photosctlCommand, 0);
  objc_storeStrong((id *)&self->_featureAreas, 0);
  objc_storeStrong((id *)&self->_databasesWithPIIData, 0);
  objc_storeStrong((id *)&self->incompleteTasks, 0);
  objc_storeStrong((id *)&self->_outputFile, 0);
  objc_storeStrong((id *)&self->_outputFolder, 0);
  objc_storeStrong((id *)&self->_annotation, 0);
  objc_storeStrong((id *)&self->_libraryFilterRegExp, 0);
  objc_storeStrong((id *)&self->_libraryPath, 0);
  objc_storeStrong((id *)&self->_systemLibraryPath, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end