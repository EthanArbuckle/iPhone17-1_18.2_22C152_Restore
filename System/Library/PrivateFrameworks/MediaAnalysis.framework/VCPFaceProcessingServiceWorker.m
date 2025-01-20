@interface VCPFaceProcessingServiceWorker
+ (BOOL)_includeTorsoOnlyFaces;
+ (float)_similarityScoreThreshold;
+ (id)newAllFacesFetchOptionsWithPhotoLibrary:(id)a3;
+ (id)newAllPersonsWithAtLeastOneFaceFetchOptionsWithPhotoLibrary:(id)a3;
+ (id)workerWithPhotoLibrary:(id)a3 andContext:(id)a4;
- (BOOL)_deleteAllVerifiedPersonsWithError:(id *)a3;
- (VCPFaceProcessingServiceWorker)initWithPhotoLibrary:(id)a3 andContext:(id)a4;
- (id)_suggestionsForPersonLocalIdentifier:(id)a3 clusterSequenceNumbers:(id)a4 excludePersonLocalIdentifiers:(id)a5 context:(id)a6 cancelOrExtendTimeoutBlock:(id)a7 error:(id *)a8;
- (id)_suggestionsForPersonWithLocalIdentifier:(id)a3 toBeConfirmedPersonSuggestions:(id)a4 toBeRejectedPersonSuggestions:(id)a5 cancelOrExtendTimeoutBlock:(id)a6 error:(id *)a7;
- (void)_appendToSuggestionsLog:(id)a3;
- (void)_closeSuggestionsLoggingSession;
- (void)_copyImageAtURLToSuggestionsLoggingSession:(id)a3;
- (void)_finalizeSuggestionsLog;
- (void)_logFaceToSuggestionsLog:(id)a3;
- (void)_openSuggestionsLoggingSession;
- (void)_startAndSyncClusterCacheWithLibrary:(BOOL)a3 reply:(id)a4;
- (void)faceCandidatesforKeyFaceForPersonsWithLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5;
- (void)personPromoterStatusWithContext:(id)a3 reply:(id)a4;
- (void)rebuildPersonsWithContext:(id)a3 reply:(id)a4 extendTimeout:(id)a5 cancel:(id)a6;
- (void)reclusterFacesWithContext:(id)a3 reply:(id)a4 extendTimeout:(id)a5 cancel:(id)a6;
- (void)requestSuggestedMePersonIdentifierWithContext:(id)a3 reply:(id)a4;
- (void)resetFaceClusteringStateWithContext:(id)a3 reply:(id)a4;
- (void)resetPersonPromoterStatusWithReply:(id)a3;
- (void)resetPersonsModelWithReply:(id)a3;
- (void)resetPetsModelWithReply:(id)a3;
- (void)suggestPersonsForPersonWithLocalIdentifier:(id)a3 toBeConfirmedPersonSuggestions:(id)a4 toBeRejectedPersonSuggestions:(id)a5 context:(id)a6 cancelOrExtendTimeoutBlock:(id)a7 reply:(id)a8;
- (void)updateKeyFacesOfPersonsWithLocalIdentifiers:(id)a3 forceUpdate:(BOOL)a4 context:(id)a5 cancelOrExtendTimeoutBlock:(id)a6 reply:(id)a7;
- (void)validateClusterCacheWithContext:(id)a3 cancelOrExtendTimeoutBlock:(id)a4 reply:(id)a5;
@end

@implementation VCPFaceProcessingServiceWorker

- (VCPFaceProcessingServiceWorker)initWithPhotoLibrary:(id)a3 andContext:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)VCPFaceProcessingServiceWorker;
  v9 = [(VCPFaceProcessingServiceWorker *)&v31 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    objc_storeStrong((id *)&v10->_context, a4);
    v11 = [[VCPPhotosPersistenceDelegate alloc] initWithPhotoLibrary:v7];
    persistenceDelegate = v10->_persistenceDelegate;
    v10->_persistenceDelegate = v11;

    if (objc_msgSend(v7, "mad_useVUGallery"))
    {
      clusterer = objc_msgSend(v7, "vcp_visionCacheStorageDirectoryURL");
      uint64_t v32 = 0;
      v33 = &v32;
      uint64_t v34 = 0x2050000000;
      v14 = (void *)getGDVUVisualUnderstandingServiceClass_softClass;
      uint64_t v35 = getGDVUVisualUnderstandingServiceClass_softClass;
      if (!getGDVUVisualUnderstandingServiceClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getGDVUVisualUnderstandingServiceClass_block_invoke;
        v37 = &unk_1E629B028;
        v38 = &v32;
        __getGDVUVisualUnderstandingServiceClass_block_invoke((uint64_t)buf);
        v14 = (void *)v33[3];
      }
      v15 = v14;
      _Block_object_dispose(&v32, 8);
      id v16 = [v15 alloc];
      uint64_t v32 = 0;
      v33 = &v32;
      uint64_t v34 = 0x2050000000;
      v17 = (void *)getGDVUEntityRecognitionClientClass_softClass;
      uint64_t v35 = getGDVUEntityRecognitionClientClass_softClass;
      if (!getGDVUEntityRecognitionClientClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getGDVUEntityRecognitionClientClass_block_invoke;
        v37 = &unk_1E629B028;
        v38 = &v32;
        __getGDVUEntityRecognitionClientClass_block_invoke((uint64_t)buf);
        v17 = (void *)v33[3];
      }
      id v18 = v17;
      _Block_object_dispose(&v32, 8);
      v19 = [v18 photos];
      id v30 = 0;
      uint64_t v20 = [v16 initWithClient:v19 version:1 url:clusterer error:&v30];
      id v21 = v30;
      vuService = v10->_vuService;
      v10->_vuService = (GDVUVisualUnderstandingService *)v20;

      if (!v10->_vuService)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v27 = VCPLogInstance();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            v28 = (objc_class *)objc_opt_class();
            v29 = NSStringFromClass(v28);
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v29;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v21;
            _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_ERROR, "[%@] Failed to create GDVUVisualUnderstandingService - %@", buf, 0x16u);
          }
        }

        v23 = 0;
        goto LABEL_12;
      }
    }
    else
    {
      v24 = [[VCPClusterer alloc] initWithPhotoLibrary:v7 andContext:v8];
      clusterer = v10->_clusterer;
      v10->_clusterer = v24;
    }
    v23 = v10;
LABEL_12:

    goto LABEL_13;
  }
  v23 = 0;
LABEL_13:
  v25 = v23;

  return v25;
}

+ (id)workerWithPhotoLibrary:(id)a3 andContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPhotoLibrary:v6 andContext:v5];

  return v7;
}

- (void)_openSuggestionsLoggingSession
{
  if (!self->_suggestionLoggingSessionOpen)
  {
    if (_openSuggestionsLoggingSession_onceToken != -1) {
      dispatch_once(&_openSuggestionsLoggingSession_onceToken, &__block_literal_global_46);
    }
    v3 = [(PHPhotoLibrary *)self->_photoLibrary vcp_visionCacheStorageDirectoryURL];
    v4 = [v3 absoluteURL];

    id v5 = (void *)sDateFormatter;
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    id v7 = [v5 stringForObjectValue:v6];

    id v8 = [@"suggestionLog_" stringByAppendingString:v7];
    if (v4)
    {
      v9 = [v4 URLByAppendingPathComponent:v8];
      p_suggestionLoggingDirectory = &self->_suggestionLoggingDirectory;
      suggestionLoggingDirectory = self->_suggestionLoggingDirectory;
      self->_suggestionLoggingDirectory = v9;
    }
    else
    {
      p_suggestionLoggingDirectory = &self->_suggestionLoggingDirectory;
      suggestionLoggingDirectory = self->_suggestionLoggingDirectory;
      self->_suggestionLoggingDirectory = 0;
    }

    v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    v13 = *p_suggestionLoggingDirectory;
    uint64_t v15 = 0;
    [v12 createDirectoryAtURL:v13 withIntermediateDirectories:0 attributes:0 error:&v15];
    uint64_t v14 = v15;

    if (!v14) {
      self->_suggestionLoggingSessionOpen = 1;
    }
  }
}

uint64_t __64__VCPFaceProcessingServiceWorker__openSuggestionsLoggingSession__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)sDateFormatter;
  sDateFormatter = (uint64_t)v0;

  v2 = (void *)sDateFormatter;
  return [v2 setDateFormat:@"yyyy-MM-dd-HH-mm-ss"];
}

- (void)_closeSuggestionsLoggingSession
{
  suggestionLoggingDirectory = self->_suggestionLoggingDirectory;
  self->_suggestionLoggingDirectory = 0;

  self->_suggestionLoggingSessionOpen = 0;
}

- (void)_appendToSuggestionsLog:(id)a3
{
  id v4 = a3;
  if (v4 && self->_suggestionLoggingSessionOpen)
  {
    id v9 = v4;
    id v5 = [(NSURL *)self->_suggestionLoggingDirectory URLByAppendingPathComponent:@"suggestions.html"];
    id v6 = v5;
    if (v5)
    {
      id v7 = fopen((const char *)[v5 fileSystemRepresentation], "a");
      if (v7)
      {
        id v8 = v7;
        fprintf(v7, "%s\n", (const char *)[v9 UTF8String]);
        fclose(v8);
      }
    }

    id v4 = v9;
  }
}

- (void)_copyImageAtURLToSuggestionsLoggingSession:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && self->_suggestionLoggingSessionOpen)
  {
    suggestionLoggingDirectory = self->_suggestionLoggingDirectory;
    id v7 = [v4 lastPathComponent];
    id v8 = [(NSURL *)suggestionLoggingDirectory URLByAppendingPathComponent:v7];

    id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v11 = 0;
    [v9 copyItemAtURL:v5 toURL:v8 error:&v11];
    id v10 = v11;
  }
}

+ (BOOL)_includeTorsoOnlyFaces
{
  return 1;
}

+ (id)newAllFacesFetchOptionsWithPhotoLibrary:(id)a3
{
  v3 = [a3 librarySpecificFetchOptions];
  [v3 setIncludeNonvisibleFaces:1];
  [v3 setIncludeTorsoOnlyDetectionData:1];
  if (objc_msgSend(MEMORY[0x1E4F39220], "mad_clusterVideoFaces")) {
    [v3 setIncludeMediaAnalysisProcessingRangeTypes:3];
  }
  [v3 setIncludedDetectionTypes:&unk_1F15EE370];
  return v3;
}

+ (id)newAllPersonsWithAtLeastOneFaceFetchOptionsWithPhotoLibrary:(id)a3
{
  v3 = [a3 librarySpecificFetchOptions];
  [v3 setMinimumUnverifiedFaceCount:1];
  [v3 setMinimumVerifiedFaceCount:1];
  [v3 setIncludedDetectionTypes:&unk_1F15EE388];
  return v3;
}

- (void)_logFaceToSuggestionsLog:(id)a3
{
  id v3 = (id)[(id)objc_opt_class() newAllFacesFetchOptionsWithPhotoLibrary:self->_photoLibrary];
  [v3 setIncludeHiddenAssets:1];
  [v3 setIncludeAllBurstAssets:1];
}

- (void)_finalizeSuggestionsLog
{
  objc_msgSend(@"];\n\n\t\tfunction addPlaceHolders() {\n",
    "stringByAppendingString:",
  id v3 = @"\t\t\taddPlaceholdersForSet(\"visionInput\", inputFaces)\n");;
  id v4 = [v3 stringByAppendingString:@"\t\t\taddPlaceholdersForSet(\"visionOutput\", outputFaces);\n"];

  id v5 = [v4 stringByAppendingString:@"\t\t\taddPlaceholdersForSet(\"visionFiltered\", filteredFaces);\n\t\t}\n\n"];

  id v6 = [v5 stringByAppendingString:@"\t\tfunction isElementHidden(element) {\n\t\t\tvar style = window.getComputedStyle(element)\n"];;

  id v7 = [v6 stringByAppendingString:@"\t\t\treturn (style.display === 'none')\n\t\t}\n"];

  id v8 = [v7 stringByAppendingString:@"\t\tfunction updateVisibility() {\n"];

  id v9 = [v8 stringByAppendingString:@"\t\t\tvar allDivs = document.getElementsByTagName(\"div\""];

  id v10 = [v9 stringByAppendingString:@"\t\t\tfor (var i = 0 i < allDivs.length; i++) {\n"];;

  id v11 = [v10 stringByAppendingString:@"\t\t\t\tvar d = allDivs[i]\n\t\t\t\tif (!d.attributes[\"img\"]) continue;\n"];;

  v12 = objc_msgSend(v11, "stringByAppendingString:", @"\t\t\t\tvar rect = d.getBoundingClientRect()\n\t\t\t\tif (\n");;

  v13 = [v12 stringByAppendingString:@"\t\t\t\t\t\trect.top >= -100 &&\n\t\t\t\t\t\trect.left >= -100 &&\n"];

  uint64_t v14 = [v13 stringByAppendingString:@"\t\t\t\t\t\trect.bottom - 100 <= (window.innerHeight || document.documentElement.clientHeight) &&\n"];

  uint64_t v15 = [v14 stringByAppendingString:@"\t\t\t\t\t\trect.right - 100 <= (window.innerWidth || document.documentElement.clientWidth)\n"];

  id v16 = [v15 stringByAppendingString:@"\t\t\t\t {\n\t\t\t\t\tif (d.childNodes.length == 0) {\n"]);

  v17 = [v16 stringByAppendingString:@"\t\t\t\t\t\td.innerHTML = \"<img src='\" + d.attributes[\"img\"].value + \"' width='100' height='100'>\"\n"];;

  id v18 = [v17 stringByAppendingString:@"\t\t\t\t\t}\n\t\t\t\t}\n\t\t\t\telse {\n\t\t\t\t\tif (d.childNodes.length != 0) {\n\t\t\t\t\t\td.innerHTML = \"\"\n\t\t\t\t\t}\n\t\t\t\t}\n\t\t\t}\n\t\t}\n"];;

  v19 = [v18 stringByAppendingString:@"\t\tfunction addPlaceholdersForSet(containerId, elements) {\n"];

  uint64_t v20 = [v19 stringByAppendingString:@"\t\t\tvar content = \"\"\n\t\t\tfor (var i = 0; i < elements.length; i++) {\n"];;

  id v21 = [v20 stringByAppendingString:@"\t\t\t\tcontent += \"<div style='float: left width: 100px; height: 100px; margin: 3px; background-color: darkgray' img='\" + elements[i] + \"'></div>\"\n\t\t\t}\n"];;

  v22 = [v21 stringByAppendingString:@"\t\t\tdocument.getElementById(containerId).innerHTML = content\n"];;

  v23 = [v22 stringByAppendingString:@"\t\t\tdocument.onscroll = function (e) {\n\t\t\t\tupdateVisibility()\n\t\t\t}\n\t\t}\n"];;

  v24 = [v23 stringByAppendingString:@"</script>\n</head>\n<body>\n<p>Vision input:</p>\n"];

  v25 = [v24 stringByAppendingString:@"<div id=\"visionInput\">\n</div>\n"];

  v26 = [v25 stringByAppendingString:@"<p style=\"clear: both\">Vision output:</p>\n<div id=\"visionOutput\">\n</div>\n\n"];;

  v27 = [v26 stringByAppendingString:@"<p style=\"clear: both\">Vision filtered output:</p>\n<div id=\"visionFiltered\">\n"];;

  v28 = [v27 stringByAppendingString:@"</div>\n\n</div>\n<script>\n"];

  v29 = objc_msgSend(v28, "stringByAppendingString:", @"document.addEventListener(\"DOMContentLoaded\", function (event) {\n");

  [v29 stringByAppendingString:@"addPlaceHolders();\n};\n\n</script>\n</body>\n</html>\n"]);
  id v30 = (id)objc_claimAutoreleasedReturnValue();

  [(VCPFaceProcessingServiceWorker *)self _appendToSuggestionsLog:v30];
}

- (void)_startAndSyncClusterCacheWithLibrary:(BOOL)a3 reply:(id)a4
{
  id v6 = a4;
  qos_class_t v7 = qos_class_self();
  id v8 = dispatch_get_global_queue(v7, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__VCPFaceProcessingServiceWorker__startAndSyncClusterCacheWithLibrary_reply___block_invoke;
  block[3] = &unk_1E629AEC8;
  BOOL v12 = a3;
  block[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(v8, block);
}

void __77__VCPFaceProcessingServiceWorker__startAndSyncClusterCacheWithLibrary_reply___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  id v13 = 0;
  uint64_t v4 = [v2 restoreClusterCacheAndSyncWithLibrary:v3 cancelOrExtendTimeoutBlock:&__block_literal_global_379 error:&v13];
  id v5 = v13;
  int v6 = MediaAnalysisLogLevel();
  if (v5)
  {
    if (v6 < 4) {
      goto LABEL_10;
    }
    qos_class_t v7 = VCPLogInstance();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 134218242;
    uint64_t v15 = v4;
    __int16 v16 = 2112;
    id v17 = v5;
    id v8 = "Restore clusterer error (ClusterState = %ld): %@";
    id v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    uint32_t v11 = 22;
    goto LABEL_8;
  }
  if (v6 < 6) {
    goto LABEL_10;
  }
  qos_class_t v7 = VCPLogInstance();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v15 = v4;
    id v8 = "Restored clusterer, ClusterState = %ld";
    id v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_INFO;
    uint32_t v11 = 12;
LABEL_8:
    _os_log_impl(&dword_1BBEDA000, v9, v10, v8, buf, v11);
  }
LABEL_9:

LABEL_10:
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, v4);
  }
}

uint64_t __77__VCPFaceProcessingServiceWorker__startAndSyncClusterCacheWithLibrary_reply___block_invoke_2()
{
  return 0;
}

- (void)updateKeyFacesOfPersonsWithLocalIdentifiers:(id)a3 forceUpdate:(BOOL)a4 context:(id)a5 cancelOrExtendTimeoutBlock:(id)a6 reply:(id)a7
{
  BOOL v9 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  id v13 = (void (**)(id, uint64_t, id))a7;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    uint64_t v14 = VCPLogInstance();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v11;
      _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_DEBUG, "UpdateKeyFaces for: '%@'", buf, 0xCu);
    }
  }
  persistenceDelegate = self->_persistenceDelegate;
  id v18 = 0;
  uint64_t v16 = [(VCPPhotosPersistenceDelegate *)persistenceDelegate updateKeyFacesOfPersonsWithLocalIdentifiers:v11 forceUpdate:v9 cancelOrExtendTimeoutBlock:v12 error:&v18];
  id v17 = v18;
  v13[2](v13, v16, v17);
}

- (id)_suggestionsForPersonLocalIdentifier:(id)a3 clusterSequenceNumbers:(id)a4 excludePersonLocalIdentifiers:(id)a5 context:(id)a6 cancelOrExtendTimeoutBlock:(id)a7 error:(id *)a8
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v19 = v18;
  photoLibrary = self->_photoLibrary;
  if (photoLibrary)
  {
    v40 = a8;
    id v41 = v18;
    id v42 = v17;
    id v44 = v15;
    id v45 = v14;
    id v43 = v16;
    uint64_t v21 = -[PHPhotoLibrary suggestionsForPersonLocalIdentifier:clusterSequenceNumbers:excludePersonLocalIdentifiers:minimumSuggestionFaceCount:](photoLibrary, "suggestionsForPersonLocalIdentifier:clusterSequenceNumbers:excludePersonLocalIdentifiers:minimumSuggestionFaceCount:", v14, v15, v16, [v17 minimumSuggestionSize]);
    v22 = [MEMORY[0x1E4F1CA48] array];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v23 = v21;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v47 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          v29 = [v28 objectForKeyedSubscript:@"faceIdentifier"];

          if (!v29)
          {
            id v30 = [v28 objectForKeyedSubscript:@"personIdentifier"];
            if (v30) {
              [v22 addObject:v30];
            }
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v46 objects:v52 count:16];
      }
      while (v25);
    }

    v19 = v41;
    if ([v22 count]) {
      [(VCPFaceProcessingServiceWorker *)self updateKeyFacesOfPersonsWithLocalIdentifiers:v22 forceUpdate:0 context:MEMORY[0x1E4F1CC08] cancelOrExtendTimeoutBlock:v41 reply:&__block_literal_global_389];
    }
    if (v23)
    {
      id v23 = v23;
      objc_super v31 = v23;
    }
    else
    {
      if (v40)
      {
        uint64_t v35 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v36 = *MEMORY[0x1E4F28760];
        uint64_t v50 = *MEMORY[0x1E4F28568];
        v37 = [NSString stringWithFormat:@"photo library could not provide suggestions"];
        v51 = v37;
        v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
        id *v40 = [v35 errorWithDomain:v36 code:-18 userInfo:v38];
      }
      objc_super v31 = 0;
    }
    id v15 = v44;
    id v14 = v45;
    id v17 = v42;
    id v16 = v43;
    goto LABEL_23;
  }
  if (a8)
  {
    uint64_t v32 = a8;
    v33 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F28760];
    uint64_t v53 = *MEMORY[0x1E4F28568];
    id v23 = [NSString stringWithFormat:@"could not obtain access to the photo library"];
    v54[0] = v23;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:&v53 count:1];
    [v33 errorWithDomain:v34 code:-50 userInfo:v22];
    objc_super v31 = 0;
    *uint64_t v32 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

    goto LABEL_24;
  }
  objc_super v31 = 0;
LABEL_24:

  return v31;
}

void __165__VCPFaceProcessingServiceWorker__suggestionsForPersonLocalIdentifier_clusterSequenceNumbers_excludePersonLocalIdentifiers_context_cancelOrExtendTimeoutBlock_error___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 4)
  {
    id v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEFAULT, "could not update key faces for suggestions: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

+ (float)_similarityScoreThreshold
{
  return 0.75;
}

- (id)_suggestionsForPersonWithLocalIdentifier:(id)a3 toBeConfirmedPersonSuggestions:(id)a4 toBeRejectedPersonSuggestions:(id)a5 cancelOrExtendTimeoutBlock:(id)a6 error:(id *)a7
{
  v254[1] = *MEMORY[0x1E4F143B8];
  id v169 = a3;
  id v168 = a4;
  id v167 = a5;
  v170 = (unsigned int (**)(void))a6;
  v171 = self;
  if (v170[2]())
  {
    if (a7)
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v253 = *MEMORY[0x1E4F28568];
      id v13 = [NSString stringWithFormat:@"_suggestionsForPersonWithLocalIdentifier cancelled"];
      v254[0] = v13;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v254 forKeys:&v253 count:1];
      *a7 = [v12 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v14];
    }
    if (self->_suggestionLoggingSessionOpen) {
      [(VCPFaceProcessingServiceWorker *)self _closeSuggestionsLoggingSession];
    }
LABEL_21:
    uint64_t v21 = 0;
    goto LABEL_35;
  }
  type = a7;
  if ([(PHPhotoLibrary *)self->_photoLibrary mad_useVUGallery])
  {
LABEL_9:
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v17 = VCPLogInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_DEBUG, "suggestions first phase query start", buf, 2u);
      }
    }
    if (self->_suggestionsLoggingEnabled)
    {
      [(VCPFaceProcessingServiceWorker *)self _openSuggestionsLoggingSession];
      if (self->_suggestionLoggingSessionOpen) {
        [(VCPFaceProcessingServiceWorker *)self _appendToSuggestionsLog:@"<html>\n<head>\n<script>\n var inputFaces = [\n"];
      }
    }
    if (v170[2]())
    {
      if (type)
      {
        id v18 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v251 = *MEMORY[0x1E4F28568];
        v19 = [NSString stringWithFormat:@"_suggestionsForPersonWithLocalIdentifier cancelled"];
        v252 = v19;
        id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v252 forKeys:&v251 count:1];
        id *type = [v18 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v20];
      }
      if (self->_suggestionLoggingSessionOpen) {
        [(VCPFaceProcessingServiceWorker *)self _closeSuggestionsLoggingSession];
      }
      goto LABEL_21;
    }
    v161 = (void *)[(id)objc_opt_class() newAllPersonsWithAtLeastOneFaceFetchOptionsWithPhotoLibrary:self->_photoLibrary];
    [v161 setMinimumUnverifiedFaceCount:1];
    [v161 setMinimumVerifiedFaceCount:1];
    v160 = [(VCPPhotosPersistenceDelegate *)self->_persistenceDelegate fetchPersonWithLocalIdentifier:v169 options:v161 error:type];
    if (!v160) {
      goto LABEL_28;
    }
    if (v170[2]())
    {
      if (type)
      {
        v22 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v249 = *MEMORY[0x1E4F28568];
        id v23 = [NSString stringWithFormat:@"_suggestionsForPersonWithLocalIdentifier cancelled"];
        v250 = v23;
        uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v250 forKeys:&v249 count:1];
        id *type = [v22 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v24];
      }
      if (self->_suggestionLoggingSessionOpen) {
        [(VCPFaceProcessingServiceWorker *)self _closeSuggestionsLoggingSession];
      }
LABEL_28:
      uint64_t v21 = 0;
LABEL_29:

      goto LABEL_35;
    }
    if ([(PHPhotoLibrary *)self->_photoLibrary mad_useVUGallery])
    {
      v27 = [v160 mdID];
      BOOL v28 = v27 == 0;

      if (v28)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v74 = VCPLogInstance();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          {
            v75 = [v160 localIdentifier];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v75;
            _os_log_impl(&dword_1BBEDA000, v74, OS_LOG_TYPE_ERROR, "[PersonSuggestionVU] Person %@ does not have mdID", buf, 0xCu);
          }
        }
        goto LABEL_28;
      }
      v29 = [MEMORY[0x1E4F1CA60] dictionary];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __169__VCPFaceProcessingServiceWorker__suggestionsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_cancelOrExtendTimeoutBlock_error___block_invoke_402;
      aBlock[3] = &unk_1E629AF38;
      aBlock[4] = self;
      id v158 = v29;
      id v222 = v158;
      id v30 = v170;
      v223 = v30;
      v157 = _Block_copy(aBlock);
      id v31 = objc_alloc((Class)getGDEntityIdentifierClass());
      uint64_t v32 = [v160 mdID];
      v156 = (void *)[v31 initWithString:v32];

      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v33 = VCPLogInstance();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v34 = [v160 localIdentifier];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v34;
          _os_log_impl(&dword_1BBEDA000, v33, OS_LOG_TYPE_DEBUG, "[PersonSuggestionVU] Retrieving similar entities to %@", buf, 0xCu);
        }
      }
      vuService = self->_vuService;
      id v220 = 0;
      char v36 = [(GDVUVisualUnderstandingService *)vuService similarEntitiesTo:v156 error:&v220 body:v157];
      id v155 = v220;
      int v37 = MediaAnalysisLogLevel();
      if ((v36 & 1) == 0)
      {
        if (v37 >= 3)
        {
          v76 = VCPLogInstance();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
          {
            v77 = [v160 localIdentifier];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v77;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v155;
            _os_log_impl(&dword_1BBEDA000, v76, OS_LOG_TYPE_ERROR, "[PersonSuggestionVU] Failed to retrieve similar entities to %@ - %@", buf, 0x16u);
          }
        }
        goto LABEL_118;
      }
      if (v37 >= 7)
      {
        v38 = VCPLogInstance();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v39 = [v158 count];
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v39;
          _os_log_impl(&dword_1BBEDA000, v38, OS_LOG_TYPE_DEBUG, "[PersonSuggestionVU] Retrieved %lu similar entitiy(ies)", buf, 0xCu);
        }
      }
      if (((unsigned int (*)(unsigned int (**)(void)))v170[2])(v30))
      {
        if (type)
        {
          v40 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v247 = *MEMORY[0x1E4F28568];
          id v41 = [NSString stringWithFormat:@"_suggestionsForPersonWithLocalIdentifier cancelled"];
          v248 = v41;
          id v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v248 forKeys:&v247 count:1];
          id *type = [v40 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v42];
        }
        if (self->_suggestionLoggingSessionOpen) {
          [(VCPFaceProcessingServiceWorker *)self _closeSuggestionsLoggingSession];
        }
LABEL_118:
        uint64_t v21 = 0;
LABEL_119:

        goto LABEL_29;
      }
      if (![v158 count])
      {
        uint64_t v21 = (void *)MEMORY[0x1E4F1CBF0];
        goto LABEL_119;
      }
      id v80 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v218 = 0u;
      long long v219 = 0u;
      long long v216 = 0u;
      long long v217 = 0u;
      id v81 = v168;
      uint64_t v82 = [v81 countByEnumeratingWithState:&v216 objects:v246 count:16];
      if (v82)
      {
        uint64_t v83 = *(void *)v217;
        do
        {
          for (uint64_t i = 0; i != v82; ++i)
          {
            if (*(void *)v217 != v83) {
              objc_enumerationMutation(v81);
            }
            v85 = [*(id *)(*((void *)&v216 + 1) + 8 * i) objectForKeyedSubscript:@"personIdentifier"];
            if (v85) {
              [v80 addObject:v85];
            }
          }
          uint64_t v82 = [v81 countByEnumeratingWithState:&v216 objects:v246 count:16];
        }
        while (v82);
      }

      long long v214 = 0u;
      long long v215 = 0u;
      long long v212 = 0u;
      long long v213 = 0u;
      id v86 = v167;
      uint64_t v87 = [v86 countByEnumeratingWithState:&v212 objects:v245 count:16];
      if (v87)
      {
        uint64_t v88 = *(void *)v213;
        do
        {
          for (uint64_t j = 0; j != v87; ++j)
          {
            if (*(void *)v213 != v88) {
              objc_enumerationMutation(v86);
            }
            v90 = [*(id *)(*((void *)&v212 + 1) + 8 * j) objectForKeyedSubscript:@"personIdentifier"];
            if (v90) {
              [v80 addObject:v90];
            }
          }
          uint64_t v87 = [v86 countByEnumeratingWithState:&v212 objects:v245 count:16];
        }
        while (v87);
      }

      v153 = [(PHPhotoLibrary *)v171->_photoLibrary mad_allFacesFetchOptions];
      v165 = [MEMORY[0x1E4F39048] fetchRejectedFacesForPerson:v160 options:v153];
      if ([v165 count])
      {
        unint64_t v91 = 0;
        do
        {
          v92 = (void *)MEMORY[0x1C186D320]();
          v93 = [v165 objectAtIndexedSubscript:v91];
          v94 = [v93 personLocalIdentifier];

          if (v94) {
            [v80 addObject:v94];
          }

          ++v91;
        }
        while (v91 < [v165 count]);
      }
      uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
      v154 = [(PHPhotoLibrary *)v171->_photoLibrary mad_allPersonsFetchOptions];
      v95 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"verifiedType = %@", &unk_1F15ED110];
      [v154 setInternalPredicate:v95];

      v96 = (void *)MEMORY[0x1E4F391F8];
      v97 = [v158 allKeys];
      v172 = [v96 fetchPersonsWithMdIDs:v97 options:v154];

      if (![v172 count])
      {
LABEL_164:
        [v21 sortUsingComparator:&__block_literal_global_421];

        goto LABEL_119;
      }
      uint64_t v98 = 0;
      while (1)
      {
        contexta = (void *)MEMORY[0x1C186D320]();
        v99 = [v172 objectAtIndexedSubscript:v98];
        v100 = [v99 localIdentifier];
        int v101 = [v80 containsObject:v100];

        if (!v101) {
          break;
        }
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v102 = VCPLogInstance();
          if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
          {
            v103 = [v99 localIdentifier];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v103;
            _os_log_impl(&dword_1BBEDA000, v102, OS_LOG_TYPE_DEBUG, "[PersonSuggestionVU] Ignoring person %@ from the exclusion list", buf, 0xCu);
          }
          goto LABEL_162;
        }
LABEL_163:

        if (++v98 >= (unint64_t)[v172 count]) {
          goto LABEL_164;
        }
      }
      v104 = [MEMORY[0x1E4F39048] fetchKeyFaceForPerson:v99 options:0];
      v102 = [v104 firstObject];

      if (v102)
      {
        v105 = [MEMORY[0x1E4F1CA60] dictionary];
        v106 = [v99 localIdentifier];
        [v105 setObject:v106 forKeyedSubscript:@"personIdentifier"];

        v107 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v99, "faceCount"));
        [v105 setObject:v107 forKeyedSubscript:@"personFaceCount"];

        [v105 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"confirmed"];
        v108 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSObject vuObservationID](v102, "vuObservationID"));
        [v105 setObject:v108 forKeyedSubscript:@"faceCSN"];

        v109 = [v102 localIdentifier];
        [v105 setObject:v109 forKeyedSubscript:@"faceIdentifier"];

        v110 = [v99 mdID];
        uint64_t v111 = [v158 objectForKeyedSubscript:v110];
        v112 = (void *)v111;
        v113 = &unk_1F15ED128;
        if (v111) {
          v113 = (void *)v111;
        }
        id v114 = v113;

        [v105 setObject:v114 forKeyedSubscript:@"similarityScore"];
        [v21 addObject:v105];
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v115 = VCPLogInstance();
          if (os_log_type_enabled(v115, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v105;
            _os_log_impl(&dword_1BBEDA000, v115, OS_LOG_TYPE_DEBUG, "[PersonSuggestionVU] Adding suggestion %@", buf, 0xCu);
          }
        }
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() < 7)
        {
LABEL_162:

          goto LABEL_163;
        }
        v105 = VCPLogInstance();
        if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
        {
          v116 = [v99 localIdentifier];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v116;
          _os_log_impl(&dword_1BBEDA000, v105, OS_LOG_TYPE_DEBUG, "[PersonSuggestionVU] Ignoring person %@ without keyface", buf, 0xCu);
        }
      }

      goto LABEL_162;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v43 = VCPLogInstance();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v43, OS_LOG_TYPE_DEBUG, "suggestions first phase query end", buf, 2u);
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v44 = VCPLogInstance();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v44, OS_LOG_TYPE_DEBUG, "suggestions middle phase query start (includes face groups for person query)", buf, 2u);
      }
    }
    id v45 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id context = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v159 = [(PHPhotoLibrary *)self->_photoLibrary faceClusterSequenceNumbersOfKeyFacesInAlgorithmicFaceGroupsForPerson:v160 verifiedClusterSequenceNumbers:v45];
    if ([v160 verifiedType] == 1 || objc_msgSend(v160, "verifiedType") == 2) {
      [v45 unionSet:v159];
    }
    if ([v168 count])
    {
      long long v46 = (void *)[v159 mutableCopy];
      long long v210 = 0u;
      long long v211 = 0u;
      long long v208 = 0u;
      long long v209 = 0u;
      id v47 = v168;
      uint64_t v48 = [v47 countByEnumeratingWithState:&v208 objects:v244 count:16];
      if (v48)
      {
        uint64_t v49 = *(void *)v209;
        do
        {
          for (uint64_t k = 0; k != v48; ++k)
          {
            if (*(void *)v209 != v49) {
              objc_enumerationMutation(v47);
            }
            v51 = [*(id *)(*((void *)&v208 + 1) + 8 * k) objectForKeyedSubscript:@"faceCSN"];
            if (v51)
            {
              [v45 addObject:v51];
              [v46 addObject:v51];
            }
          }
          uint64_t v48 = [v47 countByEnumeratingWithState:&v208 objects:v244 count:16];
        }
        while (v48);
      }

      uint64_t v52 = [v46 copy];
      v159 = (void *)v52;
    }
    if (v170[2]())
    {
      if (type)
      {
        uint64_t v53 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v242 = *MEMORY[0x1E4F28568];
        v54 = [NSString stringWithFormat:@"_suggestionsForPersonWithLocalIdentifier cancelled"];
        v243 = v54;
        v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v243 forKeys:&v242 count:1];
        id *type = [v53 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v55];
      }
      if (v171->_suggestionLoggingSessionOpen) {
        [(VCPFaceProcessingServiceWorker *)v171 _closeSuggestionsLoggingSession];
      }
      uint64_t v21 = 0;
      goto LABEL_218;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v56 = VCPLogInstance();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v56, OS_LOG_TYPE_DEBUG, "suggestions middle phase query end", buf, 2u);
      }
    }
    v57 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v159, "count"));
    v58 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v159, "count"));
    long long v206 = 0u;
    long long v207 = 0u;
    long long v204 = 0u;
    long long v205 = 0u;
    id v59 = v159;
    uint64_t v60 = [v59 countByEnumeratingWithState:&v204 objects:v241 count:16];
    if (v60)
    {
      uint64_t v61 = *(void *)v205;
      do
      {
        for (uint64_t m = 0; m != v60; ++m)
        {
          if (*(void *)v205 != v61) {
            objc_enumerationMutation(v59);
          }
          uint64_t v63 = *(void *)(*((void *)&v204 + 1) + 8 * m);
          [v58 addObject:v63];
          v64 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v45, "containsObject:", v63) ^ 1);
          [v57 addObject:v64];
        }
        uint64_t v60 = [v59 countByEnumeratingWithState:&v204 objects:v241 count:16];
      }
      while (v60);
    }

    v65 = v171;
    if (v171->_suggestionLoggingSessionOpen)
    {
      long long v202 = 0u;
      long long v203 = 0u;
      long long v200 = 0u;
      long long v201 = 0u;
      id v66 = v45;
      uint64_t v67 = [v66 countByEnumeratingWithState:&v200 objects:v240 count:16];
      if (v67)
      {
        uint64_t v68 = *(void *)v201;
        do
        {
          for (uint64_t n = 0; n != v67; ++n)
          {
            if (*(void *)v201 != v68) {
              objc_enumerationMutation(v66);
            }
            v70 = [(VCPPhotosPersistenceDelegate *)v171->_persistenceDelegate fetchFaceWithClusterSequenceNumber:*(void *)(*((void *)&v200 + 1) + 8 * n) error:0];
            if (v70) {
              [(VCPFaceProcessingServiceWorker *)v171 _logFaceToSuggestionsLog:v70];
            }
          }
          uint64_t v67 = [v66 countByEnumeratingWithState:&v200 objects:v240 count:16];
        }
        while (v67);
      }

      v65 = v171;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v237 = __Block_byref_object_copy__30;
    v238 = __Block_byref_object_dispose__30;
    id v239 = 0;
    uint64_t v194 = 0;
    v195 = &v194;
    uint64_t v196 = 0x3032000000;
    v197 = __Block_byref_object_copy__30;
    v198 = __Block_byref_object_dispose__30;
    id v199 = 0;
    if ([v58 count])
    {
      if (v170[2]())
      {
        if (type)
        {
          v71 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v234 = *MEMORY[0x1E4F28568];
          v72 = [NSString stringWithFormat:@"_suggestionsForPersonWithLocalIdentifier cancelled"];
          v235 = v72;
          v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v235 forKeys:&v234 count:1];
          id *type = [v71 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v73];

          v65 = v171;
        }
        if (v65->_suggestionLoggingSessionOpen) {
          [(VCPFaceProcessingServiceWorker *)v65 _closeSuggestionsLoggingSession];
        }
        goto LABEL_216;
      }
      dispatch_semaphore_t v117 = dispatch_semaphore_create(0);
      v190[0] = MEMORY[0x1E4F143A8];
      v190[1] = 3221225472;
      v190[2] = __169__VCPFaceProcessingServiceWorker__suggestionsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_cancelOrExtendTimeoutBlock_error___block_invoke_422;
      v190[3] = &unk_1E629AF60;
      v192 = buf;
      v193 = &v194;
      v79 = v117;
      v191 = v79;
      v118 = _Block_copy(v190);
      v119 = [(VCPClusterer *)v171->_clusterer requestSuggestionsForFaceClusterSequenceNumbers:v58 withClusteringFlags:v57 updateHandler:v118 error:type];
      if (!v119)
      {

        goto LABEL_216;
      }
      dispatch_semaphore_wait(v79, 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      uint64_t v78 = [v59 allObjects];
      v79 = *(NSObject **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v78;
    }

    v120 = *(void **)(*(void *)&buf[8] + 40);
    v121 = v171;
    if (v120)
    {
      if (v171->_suggestionLoggingSessionOpen)
      {
        [(VCPFaceProcessingServiceWorker *)v171 _appendToSuggestionsLog:@"];\n\nvar outputFaces = [\n"];
        long long v188 = 0u;
        long long v189 = 0u;
        long long v186 = 0u;
        long long v187 = 0u;
        id v122 = *(id *)(*(void *)&buf[8] + 40);
        uint64_t v123 = [v122 countByEnumeratingWithState:&v186 objects:v233 count:16];
        if (v123)
        {
          uint64_t v124 = *(void *)v187;
          do
          {
            for (iuint64_t i = 0; ii != v123; ++ii)
            {
              if (*(void *)v187 != v124) {
                objc_enumerationMutation(v122);
              }
              v126 = [(VCPPhotosPersistenceDelegate *)v121->_persistenceDelegate fetchFaceWithClusterSequenceNumber:*(void *)(*((void *)&v186 + 1) + 8 * ii) error:0];
              if (v126) {
                [(VCPFaceProcessingServiceWorker *)v121 _logFaceToSuggestionsLog:v126];
              }

              v121 = v171;
            }
            uint64_t v123 = [v122 countByEnumeratingWithState:&v186 objects:v233 count:16];
          }
          while (v123);
        }

        v120 = *(void **)(*(void *)&buf[8] + 40);
        v121 = v171;
      }
      if (![v120 count])
      {
        if (v121->_suggestionLoggingSessionOpen) {
          [(VCPFaceProcessingServiceWorker *)v121 _closeSuggestionsLoggingSession];
        }
        uint64_t v21 = [MEMORY[0x1E4F1C978] array];
        goto LABEL_217;
      }
      if (v170[2]())
      {
        if (!type) {
          goto LABEL_214;
        }
        v127 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v231 = *MEMORY[0x1E4F28568];
        v128 = [NSString stringWithFormat:@"_suggestionsForPersonWithLocalIdentifier cancelled"];
        v232 = v128;
        v129 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v232 forKeys:&v231 count:1];
        id *type = [v127 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v129];
      }
      else
      {
        long long v184 = 0u;
        long long v185 = 0u;
        long long v182 = 0u;
        long long v183 = 0u;
        id v130 = v168;
        uint64_t v131 = [v130 countByEnumeratingWithState:&v182 objects:v230 count:16];
        if (v131)
        {
          uint64_t v132 = *(void *)v183;
          do
          {
            for (juint64_t j = 0; jj != v131; ++jj)
            {
              if (*(void *)v183 != v132) {
                objc_enumerationMutation(v130);
              }
              v134 = [*(id *)(*((void *)&v182 + 1) + 8 * jj) objectForKeyedSubscript:@"personIdentifier"];
              if (v134) {
                [context addObject:v134];
              }
            }
            uint64_t v131 = [v130 countByEnumeratingWithState:&v182 objects:v230 count:16];
          }
          while (v131);
        }

        long long v180 = 0u;
        long long v181 = 0u;
        long long v178 = 0u;
        long long v179 = 0u;
        id v135 = v167;
        uint64_t v136 = [v135 countByEnumeratingWithState:&v178 objects:v229 count:16];
        if (v136)
        {
          uint64_t v137 = *(void *)v179;
          do
          {
            for (kuint64_t k = 0; kk != v136; ++kk)
            {
              if (*(void *)v179 != v137) {
                objc_enumerationMutation(v135);
              }
              v139 = [*(id *)(*((void *)&v178 + 1) + 8 * kk) objectForKeyedSubscript:@"personIdentifier"];
              if (v139) {
                [context addObject:v139];
              }
            }
            uint64_t v136 = [v135 countByEnumeratingWithState:&v178 objects:v229 count:16];
          }
          while (v136);
        }

        v121 = v171;
        if (!v170[2]())
        {
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v143 = VCPLogInstance();
            if (os_log_type_enabled(v143, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)v177 = 0;
              _os_log_impl(&dword_1BBEDA000, v143, OS_LOG_TYPE_DEBUG, "suggestions last phase query start", v177, 2u);
            }

            v121 = v171;
          }
          v144 = [(VCPFaceProcessingServiceWorker *)v121 _suggestionsForPersonLocalIdentifier:v169 clusterSequenceNumbers:*(void *)(*(void *)&buf[8] + 40) excludePersonLocalIdentifiers:context context:v121->_context cancelOrExtendTimeoutBlock:v170 error:type];
          uint64_t v21 = (void *)[v144 mutableCopy];

          v145 = v171;
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v146 = VCPLogInstance();
            if (os_log_type_enabled(v146, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)v177 = 0;
              _os_log_impl(&dword_1BBEDA000, v146, OS_LOG_TYPE_DEBUG, "suggestions last phase query end", v177, 2u);
            }

            v145 = v171;
          }
          if (v21)
          {
            if ((_personSuggestionsAreAllSingletons(v21) & 1) == 0) {
              _removeAllSingletonPersonSuggestionsInArray(v21);
            }
            if (v145->_suggestionLoggingSessionOpen)
            {
              [(VCPFaceProcessingServiceWorker *)v145 _appendToSuggestionsLog:@"];\n\nvar filteredFaces = [\n"];
              long long v175 = 0u;
              long long v176 = 0u;
              long long v173 = 0u;
              long long v174 = 0u;
              id v147 = v21;
              uint64_t v148 = [v147 countByEnumeratingWithState:&v173 objects:v226 count:16];
              if (v148)
              {
                uint64_t v166 = *(void *)v174;
                do
                {
                  for (muint64_t m = 0; mm != v148; ++mm)
                  {
                    if (*(void *)v174 != v166) {
                      objc_enumerationMutation(v147);
                    }
                    v150 = [*(id *)(*((void *)&v173 + 1) + 8 * mm) objectForKeyedSubscript:@"faceIdentifier"];
                    if (v150)
                    {
                      v151 = [(VCPPhotosPersistenceDelegate *)v171->_persistenceDelegate fetchFaceWithLocalIdentifier:v150 error:0];
                      if (v151) {
                        [(VCPFaceProcessingServiceWorker *)v171 _logFaceToSuggestionsLog:v151];
                      }
                    }
                  }
                  uint64_t v148 = [v147 countByEnumeratingWithState:&v173 objects:v226 count:16];
                }
                while (v148);
              }

              [(VCPFaceProcessingServiceWorker *)v171 _finalizeSuggestionsLog];
              [(VCPFaceProcessingServiceWorker *)v171 _closeSuggestionsLoggingSession];
            }
            id v152 = v21;
          }

          goto LABEL_217;
        }
        if (!type) {
          goto LABEL_214;
        }
        v140 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v227 = *MEMORY[0x1E4F28568];
        v141 = [NSString stringWithFormat:@"_suggestionsForPersonWithLocalIdentifier cancelled"];
        v228 = v141;
        v142 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v228 forKeys:&v227 count:1];
        id *type = [v140 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v142];
      }
      v121 = v171;
LABEL_214:
      if (v121->_suggestionLoggingSessionOpen) {
        [(VCPFaceProcessingServiceWorker *)v121 _closeSuggestionsLoggingSession];
      }
      goto LABEL_216;
    }
    if (v171->_suggestionLoggingSessionOpen) {
      [(VCPFaceProcessingServiceWorker *)v171 _closeSuggestionsLoggingSession];
    }
    if (type)
    {
      uint64_t v21 = 0;
      id *type = (id) v195[5];
LABEL_217:
      _Block_object_dispose(&v194, 8);

      _Block_object_dispose(buf, 8);
LABEL_218:

      goto LABEL_29;
    }
LABEL_216:
    uint64_t v21 = 0;
    goto LABEL_217;
  }
  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  v224[0] = MEMORY[0x1E4F143A8];
  v224[1] = 3221225472;
  v224[2] = __169__VCPFaceProcessingServiceWorker__suggestionsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_cancelOrExtendTimeoutBlock_error___block_invoke;
  v224[3] = &unk_1E629AF10;
  id v16 = v15;
  v225 = v16;
  [(VCPFaceProcessingServiceWorker *)self _startAndSyncClusterCacheWithLibrary:1 reply:v224];
  dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  if ([(VCPClusterer *)self->_clusterer isReadyToReturnSuggestions])
  {

    goto LABEL_9;
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v25 = VCPLogInstance();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_INFO, "Returning no suggestions because the clusterer is working", buf, 2u);
    }
  }
  uint64_t v21 = [MEMORY[0x1E4F1C978] array];

LABEL_35:
  return v21;
}

void __169__VCPFaceProcessingServiceWorker__suggestionsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_cancelOrExtendTimeoutBlock_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    uint64_t v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v4 = 134217984;
      uint64_t v5 = a2;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEBUG, "Loaded clustererState: %ld", (uint8_t *)&v4, 0xCu);
    }
  }
}

uint64_t __169__VCPFaceProcessingServiceWorker__suggestionsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_cancelOrExtendTimeoutBlock_error___block_invoke_402(uint64_t a1, void *a2, double a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  [(id)objc_opt_class() _similarityScoreThreshold];
  double v7 = v6;
  int v8 = MediaAnalysisLogLevel();
  if (v7 <= a3)
  {
    if (v8 >= 7)
    {
      id v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        id v13 = [v5 stringValue];
        int v18 = 138412546;
        v19 = v13;
        __int16 v20 = 2048;
        double v21 = a3;
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEBUG, "[PersonSuggestionVU] Receiving person %@ (similarityScore: %.3f)", (uint8_t *)&v18, 0x16u);
      }
    }
    BOOL v9 = [NSNumber numberWithDouble:a3];
    id v14 = *(void **)(a1 + 40);
    os_log_type_t v10 = [v5 stringValue];
    [v14 setObject:v9 forKeyedSubscript:v10];
    goto LABEL_10;
  }
  if (v8 < 7) {
    goto LABEL_12;
  }
  BOOL v9 = VCPLogInstance();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    os_log_type_t v10 = [v5 stringValue];
    [(id)objc_opt_class() _similarityScoreThreshold];
    int v18 = 138412802;
    v19 = v10;
    __int16 v20 = 2048;
    double v21 = a3;
    __int16 v22 = 2048;
    double v23 = v11;
    _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEBUG, "[PersonSuggestionVU] Ignoring person %@ (similarityScore: %.3f < %.3f)", (uint8_t *)&v18, 0x20u);
LABEL_10:
  }
LABEL_12:
  uint64_t v15 = *(void *)(a1 + 48);
  if (v15) {
    uint64_t v16 = (*(unsigned int (**)(void))(v15 + 16))() ^ 1;
  }
  else {
    uint64_t v16 = 1;
  }

  return v16;
}

uint64_t __169__VCPFaceProcessingServiceWorker__suggestionsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_cancelOrExtendTimeoutBlock_error___block_invoke_418(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 objectForKeyedSubscript:@"personFaceCount"];
  uint64_t v6 = [v5 integerValue];

  double v7 = [v4 objectForKeyedSubscript:@"personFaceCount"];

  uint64_t v8 = [v7 integerValue];
  if (v6 > v8) {
    return -1;
  }
  else {
    return v6 < v8;
  }
}

void __169__VCPFaceProcessingServiceWorker__suggestionsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_cancelOrExtendTimeoutBlock_error___block_invoke_422(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v14 = a2;
  id v7 = a3;
  id v8 = a4;
  if (@"VCPSuggestionUpdateFinished" == v14)
  {
    if (v7)
    {
      uint64_t v9 = [v7 copy];
      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
      float v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
    else
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
      id v13 = v8;
      float v11 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v13;
    }
  }
  else if (@"VCPSuggestionUpdateCancelled" != v14)
  {
    goto LABEL_9;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
LABEL_9:
}

- (void)suggestPersonsForPersonWithLocalIdentifier:(id)a3 toBeConfirmedPersonSuggestions:(id)a4 toBeRejectedPersonSuggestions:(id)a5 context:(id)a6 cancelOrExtendTimeoutBlock:(id)a7 reply:(id)a8
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  int v18 = (unsigned int (**)(void))a7;
  v19 = (void (**)(id, void, void *))a8;
  if (v18 && v18[2](v18))
  {
    __int16 v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28760];
    uint64_t v44 = *MEMORY[0x1E4F28568];
    id v22 = [NSString stringWithFormat:@"suggestPersonsForPersonWithLocalIdentifier cancelled"];
    v45[0] = v22;
    double v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
    uint64_t v24 = [v20 errorWithDomain:v21 code:-128 userInfo:v23];
    v19[2](v19, 0, v24);
  }
  else
  {
    id v34 = v17;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint64_t v25 = VCPLogInstance();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v39 = (uint64_t)v14;
        __int16 v40 = 2112;
        id v41 = v15;
        __int16 v42 = 2112;
        id v43 = v16;
        _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_DEBUG, "Querying suggestions for person %@ (Photos: %@ to-be-confirmed, %@ to-be-rejected suggestions)", buf, 0x20u);
      }
    }
    id v35 = 0;
    double v23 = [(VCPFaceProcessingServiceWorker *)self _suggestionsForPersonWithLocalIdentifier:v14 toBeConfirmedPersonSuggestions:v15 toBeRejectedPersonSuggestions:v16 cancelOrExtendTimeoutBlock:v18 error:&v35];
    id v22 = v35;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint64_t v26 = VCPLogInstance();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v27 = [v23 count];
        *(_DWORD *)buf = 134218242;
        uint64_t v39 = v27;
        __int16 v40 = 2112;
        id v41 = v14;
        _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_DEBUG, "Returning %lu suggestions for person %@", buf, 0x16u);
      }
    }
    if (v18 && v18[2](v18))
    {
      v33 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v28 = *MEMORY[0x1E4F28760];
      uint64_t v36 = *MEMORY[0x1E4F28568];
      v29 = [NSString stringWithFormat:@"suggestPersonsForPersonWithLocalIdentifier cancelled"];
      int v37 = v29;
      id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      id v31 = [v33 errorWithDomain:v28 code:-128 userInfo:v30];
      v19[2](v19, 0, v31);
    }
    else
    {
      if (v23) {
        id v32 = 0;
      }
      else {
        id v32 = v22;
      }
      ((void (**)(id, void *, void *))v19)[2](v19, v23, v32);
    }
    id v17 = v34;
  }
}

- (void)faceCandidatesforKeyFaceForPersonsWithLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, void *))a5;
  float v11 = [MEMORY[0x1E4F1CA48] array];
  if ([v8 count])
  {
    uint64_t v12 = (void *)[(id)objc_opt_class() newAllPersonsWithAtLeastOneFaceFetchOptionsWithPhotoLibrary:self->_photoLibrary];
    id v13 = [MEMORY[0x1E4F391F8] fetchPersonsWithLocalIdentifiers:v8 options:v12];
    id v14 = [v13 fetchedObjects];
    __int16 v42 = v14;
    if ([v14 count])
    {
      int v37 = v13;
      v38 = v12;
      uint64_t v39 = v10;
      id v40 = v9;
      id v41 = v8;
      dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __103__VCPFaceProcessingServiceWorker_faceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_context_reply___block_invoke;
      v47[3] = &unk_1E629AF10;
      id v16 = v15;
      uint64_t v48 = v16;
      [(VCPFaceProcessingServiceWorker *)self _startAndSyncClusterCacheWithLibrary:1 reply:v47];
      uint64_t v36 = v16;
      dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v17 = v14;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v43 objects:v49 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v44;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v44 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v43 + 1) + 8 * v21);
            double v23 = (void *)MEMORY[0x1C186D320]();
            uint64_t v24 = [MEMORY[0x1E4F1CA48] array];
            [v11 addObject:v24];
            id v25 = [(VCPPhotosPersistenceDelegate *)self->_persistenceDelegate bestRepresentativeFaceForPerson:v22 qualityMeasureByFace:0 candidateFaces:v24 cancelOrExtendTimeoutBlock:&__block_literal_global_441];

            ++v21;
          }
          while (v19 != v21);
          uint64_t v19 = [v17 countByEnumeratingWithState:&v43 objects:v49 count:16];
        }
        while (v19);
      }

      uint64_t v10 = v39;
      ((void (**)(id, void *, void *))v39)[2](v39, v11, 0);

      uint64_t v26 = 0;
      id v9 = v40;
      id v8 = v41;
      id v13 = v37;
      uint64_t v12 = v38;
    }
    else
    {
      id v32 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v33 = *MEMORY[0x1E4F28760];
      uint64_t v50 = *MEMORY[0x1E4F28568];
      id v34 = [NSString stringWithFormat:@"Failed to find persons with local identifiers: '%@'", v8];
      v51 = v34;
      id v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      uint64_t v26 = [v32 errorWithDomain:v33 code:-18 userInfo:v35];

      v10[2](v10, 0, v26);
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint64_t v27 = VCPLogInstance();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v55 = v8;
        _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_DEBUG, "Input parameter is empty or nil: '%@'", buf, 0xCu);
      }
    }
    uint64_t v28 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28760];
    uint64_t v52 = *MEMORY[0x1E4F28568];
    id v30 = [NSString stringWithFormat:@"Input parameter is empty or nil: '%@'", v8];
    uint64_t v53 = v30;
    id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    uint64_t v26 = [v28 errorWithDomain:v29 code:-50 userInfo:v31];

    v10[2](v10, 0, v26);
  }
}

void __103__VCPFaceProcessingServiceWorker_faceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_context_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    uint64_t v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v4 = 134217984;
      uint64_t v5 = a2;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEBUG, "Loaded clustererState: %ld", (uint8_t *)&v4, 0xCu);
    }
  }
}

uint64_t __103__VCPFaceProcessingServiceWorker_faceCandidatesforKeyFaceForPersonsWithLocalIdentifiers_context_reply___block_invoke_439()
{
  return 0;
}

- (void)resetPersonsModelWithReply:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v4 = (void (**)(id, uint64_t, void *))a3;
  photoLibrary = self->_photoLibrary;
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] distantPast];
  [(PHPhotoLibrary *)photoLibrary vcp_setAnalysisPreferencesValue:v6 forKey:@"FaceIDModelLastGenerationKey"];

  id v7 = [(PHPhotoLibrary *)self->_photoLibrary vcp_vipModelFilepathForVIPType:0];
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v16 = 0;
  char v9 = [v8 removeItemAtPath:v7 error:&v16];
  uint64_t v10 = v16;
  float v11 = v10;
  if (v9)
  {
    uint64_t v12 = 1;
  }
  else
  {
    if ([v10 code] == 4
      && ([v11 domain],
          id v13 = objc_claimAutoreleasedReturnValue(),
          char v14 = [v13 isEqualToString:*MEMORY[0x1E4F281F8]],
          v13,
          (v14 & 1) != 0))
    {
      uint64_t v12 = 1;
      dispatch_semaphore_t v15 = v11;
      float v11 = 0;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        uint64_t v12 = 0;
        goto LABEL_12;
      }
      dispatch_semaphore_t v15 = VCPLogInstance();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v18 = v7;
        __int16 v19 = 2112;
        uint64_t v20 = v11;
        _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_ERROR, "Persons Model: Failed to remove model at %@ - %@", buf, 0x16u);
      }
      uint64_t v12 = 0;
    }
  }
LABEL_12:
  v4[2](v4, v12, v11);
}

- (void)resetPetsModelWithReply:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v4 = (void (**)(id, uint64_t, void *))a3;
  photoLibrary = self->_photoLibrary;
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] distantPast];
  [(PHPhotoLibrary *)photoLibrary vcp_setAnalysisPreferencesValue:v6 forKey:@"PetIDModelLastGenerationKey"];

  uint64_t v7 = 1;
  id v8 = [(PHPhotoLibrary *)self->_photoLibrary vcp_vipModelFilepathForVIPType:1];
  char v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v16 = 0;
  char v10 = [v9 removeItemAtPath:v8 error:&v16];
  float v11 = v16;
  uint64_t v12 = v11;
  if ((v10 & 1) == 0)
  {
    if ([v11 code] == 4
      && ([v12 domain],
          id v13 = objc_claimAutoreleasedReturnValue(),
          char v14 = [v13 isEqualToString:*MEMORY[0x1E4F281F8]],
          v13,
          (v14 & 1) != 0))
    {
      uint64_t v7 = 1;
      dispatch_semaphore_t v15 = v12;
      uint64_t v12 = 0;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        uint64_t v7 = 0;
        goto LABEL_11;
      }
      dispatch_semaphore_t v15 = VCPLogInstance();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v18 = v8;
        __int16 v19 = 2112;
        uint64_t v20 = v12;
        _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_ERROR, "Pets Model: Failed to remove model at %@ - %@", buf, 0x16u);
      }
      uint64_t v7 = 0;
    }
  }
LABEL_11:
  v4[2](v4, v7, v12);
}

- (void)requestSuggestedMePersonIdentifierWithContext:(id)a3 reply:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void (**)(id, void, void *))a4;
  photoLibrary = self->_photoLibrary;
  if (!photoLibrary)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F28760];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    char v9 = [NSString stringWithFormat:@"could not obtain access to the photo library"];
    v17[0] = v9;
    char v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    float v11 = [v7 errorWithDomain:v8 code:-50 userInfo:v10];
    v5[2](v5, 0, v11);

    photoLibrary = self->_photoLibrary;
  }
  uint64_t v12 = [(PHPhotoLibrary *)photoLibrary vcp_visionCacheStorageDirectoryURL];
  id v15 = 0;
  id v13 = [MEMORY[0x1E4F8E818] requestSuggestedMePersonIdentifierAtURL:v12 withError:&v15];
  id v14 = v15;
  ((void (**)(id, void *, void *))v5)[2](v5, v13, v14);
}

- (void)personPromoterStatusWithContext:(id)a3 reply:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  if (!self->_photoLibrary)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28760];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    char v10 = [NSString stringWithFormat:@"could not obtain access to the photo library"];
    v21[0] = v10;
    float v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v12 = [v8 errorWithDomain:v9 code:-50 userInfo:v11];
    v7[2](v7, 0, v12);
  }
  id v13 = objc_opt_new();
  if ([MEMORY[0x1E4F8E818] hasProcessedForLibrary:self->_photoLibrary]) {
    uint64_t v14 = [(VCPPhotosPersistenceDelegate *)self->_persistenceDelegate needsPersonBuilding] ^ 1;
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = [NSNumber numberWithBool:v14];
  [v13 setObject:v15 forKey:@"status"];

  uint64_t v16 = [v6 objectForKeyedSubscript:@"requestAdvancedStatus"];
  int v17 = [v16 BOOLValue];

  if (v17)
  {
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F8E818]) initWithPhotoLibrary:self->_photoLibrary andDelegate:self->_persistenceDelegate];
    __int16 v19 = [v18 advancedStatus];
    [v13 setObject:v19 forKey:@"advancedStatus"];
  }
  ((void (**)(id, void *, void *))v7)[2](v7, v13, 0);
}

- (void)validateClusterCacheWithContext:(id)a3 cancelOrExtendTimeoutBlock:(id)a4 reply:(id)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = (void (**)(id, void, void *))a5;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __99__VCPFaceProcessingServiceWorker_validateClusterCacheWithContext_cancelOrExtendTimeoutBlock_reply___block_invoke;
  v26[3] = &unk_1E629AF10;
  char v10 = v9;
  uint64_t v27 = v10;
  [(VCPFaceProcessingServiceWorker *)self _startAndSyncClusterCacheWithLibrary:0 reply:v26];
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  clusterer = self->_clusterer;
  if (!clusterer)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28760];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    uint64_t v14 = [NSString stringWithFormat:@"VCPClusterer is nil"];
    v29[0] = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    uint64_t v16 = [v12 errorWithDomain:v13 code:-18 userInfo:v15];
    v8[2](v8, 0, v16);

    clusterer = self->_clusterer;
  }
  id v24 = 0;
  id v25 = 0;
  int v17 = [(VCPClusterer *)clusterer differencesBetweenClusterCacheAndLibrary:&v25 excludedL0ClustersByL1ClusterId:&v24 cancelOrExtendTimeoutBlock:v7];
  id v18 = v25;
  id v19 = v24;
  if ([v17 count])
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __99__VCPFaceProcessingServiceWorker_validateClusterCacheWithContext_cancelOrExtendTimeoutBlock_reply___block_invoke_446;
    v22[3] = &unk_1E629AFB0;
    id v21 = v20;
    id v23 = v21;
    [v17 enumerateKeysAndObjectsUsingBlock:v22];
  }
  else
  {
    id v21 = 0;
  }
  ((void (**)(id, id, void *))v8)[2](v8, v21, v18);
}

void __99__VCPFaceProcessingServiceWorker_validateClusterCacheWithContext_cancelOrExtendTimeoutBlock_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    uint64_t v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v4 = 134217984;
      uint64_t v5 = a2;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEBUG, "Loaded clustererState: %ld", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __99__VCPFaceProcessingServiceWorker_validateClusterCacheWithContext_cancelOrExtendTimeoutBlock_reply___block_invoke_446(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __99__VCPFaceProcessingServiceWorker_validateClusterCacheWithContext_cancelOrExtendTimeoutBlock_reply___block_invoke_2;
  v10[3] = &unk_1E629AF88;
  id v11 = v8;
  id v9 = v8;
  [v6 enumerateObjectsUsingBlock:v10];
}

void __99__VCPFaceProcessingServiceWorker_validateClusterCacheWithContext_cancelOrExtendTimeoutBlock_reply___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 allObjects];
  [v2 addObject:v3];
}

- (void)resetFaceClusteringStateWithContext:(id)a3 reply:(id)a4
{
  uint64_t v5 = (void (**)(id, BOOL, void))a4;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __76__VCPFaceProcessingServiceWorker_resetFaceClusteringStateWithContext_reply___block_invoke;
  v20[3] = &unk_1E629AF10;
  id v7 = v6;
  id v21 = v7;
  [(VCPFaceProcessingServiceWorker *)self _startAndSyncClusterCacheWithLibrary:1 reply:v20];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  clusterer = self->_clusterer;
  if (clusterer)
  {
    [(VCPClusterer *)self->_clusterer terminate];
    id v9 = self->_clusterer;
    self->_clusterer = 0;
  }
  char v10 = [(PHPhotoLibrary *)self->_photoLibrary vcp_visionCacheStorageDirectoryURL];
  id v19 = 0;
  BOOL v11 = +[VCPClusterer removeClusteringStateCacheWithURL:v10 error:&v19];
  id v12 = v19;
  if (clusterer)
  {
    uint64_t v13 = [[VCPClusterer alloc] initWithPhotoLibrary:self->_photoLibrary andContext:self->_context];
    uint64_t v14 = self->_clusterer;
    self->_clusterer = v13;

    id v15 = self->_clusterer;
    id v18 = v12;
    [(VCPClusterer *)v15 restoreClusterCacheAndSyncWithLibrary:1 cancelOrExtendTimeoutBlock:&__block_literal_global_451 error:&v18];
    id v16 = v18;

    BOOL v11 = v16 == 0;
    id v12 = v16;
  }
  [MEMORY[0x1E4F8E818] setProcessed:0 forLibrary:self->_photoLibrary];
  if (v11) {
    id v17 = 0;
  }
  else {
    id v17 = v12;
  }
  ((void (**)(id, BOOL, id))v5)[2](v5, v11, v17);
}

void __76__VCPFaceProcessingServiceWorker_resetFaceClusteringStateWithContext_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v4 = 134217984;
      uint64_t v5 = a2;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEBUG, "Loaded clustererState: %ld", (uint8_t *)&v4, 0xCu);
    }
  }
}

uint64_t __76__VCPFaceProcessingServiceWorker_resetFaceClusteringStateWithContext_reply___block_invoke_449()
{
  return 0;
}

- (BOOL)_deleteAllVerifiedPersonsWithError:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_INFO, "Person Processing: Starting Deleting Persons", buf, 2u);
    }
  }
  uint64_t v6 = mach_absolute_time();
  id v7 = VCPSignPostLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  id v9 = VCPSignPostLog();
  char v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "VCPFaceProcessingDeleteAllVerifiedPersons", "", buf, 2u);
  }

  BOOL v11 = (void *)[(id)objc_opt_class() newAllPersonsWithAtLeastOneFaceFetchOptionsWithPhotoLibrary:self->_photoLibrary];
  [v11 setMinimumVerifiedFaceCount:0];
  [v11 setMinimumUnverifiedFaceCount:0];
  [v11 setIncludeTorsoOnlyPerson:1];
  id v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"verifiedType != %d", 0);
  [v11 setPredicate:v12];

  uint64_t v13 = [MEMORY[0x1E4F391F8] fetchPersonsWithOptions:v11];
  photoLibrary = self->_photoLibrary;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __69__VCPFaceProcessingServiceWorker__deleteAllVerifiedPersonsWithError___block_invoke;
  v22[3] = &unk_1E6296FD0;
  id v15 = v13;
  id v23 = v15;
  BOOL v16 = [(PHPhotoLibrary *)photoLibrary performChangesAndWait:v22 error:a3];
  id v17 = VCPSignPostLog();
  id v18 = v17;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v18, OS_SIGNPOST_INTERVAL_END, v8, "VCPFaceProcessingDeleteAllVerifiedPersons", "", buf, 2u);
  }

  if (v6)
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v19 = VCPLogInstance();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = @"failed";
      if (v16) {
        uint64_t v20 = @"succeeded";
      }
      *(_DWORD *)buf = 138412290;
      id v25 = v20;
      _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_INFO, "Person Processing: Deleting Persons %@", buf, 0xCu);
    }
  }
  return v16;
}

uint64_t __69__VCPFaceProcessingServiceWorker__deleteAllVerifiedPersonsWithError___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F39208] deletePersons:*(void *)(a1 + 32)];
}

- (void)reclusterFacesWithContext:(id)a3 reply:(id)a4 extendTimeout:(id)a5 cancel:(id)a6
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  BOOL v11 = (void (**)(id, uint64_t, void))a4;
  id v75 = a5;
  id v74 = a6;
  id v12 = [v10 objectForKeyedSubscript:@"PersonProcessingDeletePersons"];
  LODWORD(a5) = [v12 BOOLValue];

  if (a5)
  {
    id v80 = 0;
    BOOL v13 = [(VCPFaceProcessingServiceWorker *)self _deleteAllVerifiedPersonsWithError:&v80];
    id v14 = v80;
    id v15 = v14;
    if (!v13)
    {
      uint64_t v16 = 0;
      id v17 = v14;
      goto LABEL_74;
    }
  }
  else
  {
    id v15 = 0;
  }
  [MEMORY[0x1E4F8E818] setProcessed:0 forLibrary:self->_photoLibrary];
  uint64_t v18 = [v10 objectForKeyedSubscript:@"PLPhotoAnalysisVisionServiceFaceReclusteringThreshold"];
  id v19 = [v10 objectForKeyedSubscript:@"PLPhotoAnalysisVisionServiceFaceReclusteringShouldRecluster"];
  v73 = v11;
  v72 = v19;
  if (v19) {
    uint64_t v20 = [v19 BOOLValue];
  }
  else {
    uint64_t v20 = 1;
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v21 = VCPLogInstance();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_INFO, "Person Processing: Starting Face Reclustering", buf, 2u);
    }
  }
  uint64_t v22 = mach_absolute_time();
  id v23 = VCPSignPostLog();
  os_signpost_id_t v24 = os_signpost_id_generate(v23);

  id v25 = VCPSignPostLog();
  uint64_t v26 = v25;
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "VCPFaceProcessingReclusterFacesWithThreshold", "", buf, 2u);
  }

  uint64_t v27 = [VCPFaceClusterer alloc];
  v71 = self;
  photoLibrary = self->_photoLibrary;
  id context = self->_context;
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __87__VCPFaceProcessingServiceWorker_reclusterFacesWithContext_reply_extendTimeout_cancel___block_invoke;
  v77[3] = &unk_1E629AFD8;
  id v70 = v74;
  id v78 = v70;
  id v30 = v75;
  id v79 = v30;
  id v31 = [(VCPFaceClusterer *)v27 initWithPhotoLibrary:photoLibrary context:context cancelOrExtendTimeoutBlock:v77];
  id v76 = v15;
  id v32 = (void *)v18;
  BOOL v33 = [(VCPFaceClusterer *)v31 reclusterFacesWithThreshold:v18 shouldRecluster:v20 error:&v76];
  id v34 = v76;

  id v35 = VCPSignPostLog();
  uint64_t v36 = v35;
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v36, OS_SIGNPOST_INTERVAL_END, v24, "VCPFaceProcessingReclusterFacesWithThreshold", "", buf, 2u);
  }

  if (v22)
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    int v37 = VCPLogInstance();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      v38 = @"failed";
      if (v33) {
        v38 = @"succeeded";
      }
      *(_DWORD *)buf = 138412290;
      id v86 = v38;
      _os_log_impl(&dword_1BBEDA000, v37, OS_LOG_TYPE_INFO, "Person Processing: Face Clustering %@", buf, 0xCu);
    }
  }
  if (v33)
  {
    uint64_t v39 = v31;
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v40 = VCPLogInstance();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v40, OS_LOG_TYPE_INFO, "Person Processing: Starting Person Building", buf, 2u);
      }
    }
    uint64_t v41 = mach_absolute_time();
    __int16 v42 = VCPSignPostLog();
    os_signpost_id_t v43 = os_signpost_id_generate(v42);

    long long v44 = VCPSignPostLog();
    long long v45 = v44;
    if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v45, OS_SIGNPOST_INTERVAL_BEGIN, v43, "VCPFaceProcessingBuildPersons", "", buf, 2u);
    }

    uint64_t v46 = VCPBuildPersons(v71->_photoLibrary, v39, v71->_context, v30, v70);
    id v47 = VCPSignPostLog();
    uint64_t v48 = v47;
    if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v48, OS_SIGNPOST_INTERVAL_END, v43, "VCPFaceProcessingBuildPersons", "", buf, 2u);
    }

    if (v41)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      uint64_t v49 = VCPLogInstance();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        uint64_t v50 = @"failed";
        if (!v46) {
          uint64_t v50 = @"succeeded";
        }
        *(_DWORD *)buf = 138412290;
        id v86 = v50;
        _os_log_impl(&dword_1BBEDA000, v49, OS_LOG_TYPE_INFO, "Person Processing: Person Building %@", buf, 0xCu);
      }
    }
    if (v46)
    {
      v51 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v52 = *MEMORY[0x1E4F28760];
      uint64_t v83 = *MEMORY[0x1E4F28568];
      uint64_t v53 = objc_msgSend(NSString, "stringWithFormat:", @"VCPBuildPersons failed %d", v46);
      v84 = v53;
      v54 = (void *)MEMORY[0x1E4F1C9E8];
      id v55 = &v84;
      uint64_t v56 = &v83;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v57 = VCPLogInstance();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v57, OS_LOG_TYPE_INFO, "Person Processing: Starting Person Promotion", buf, 2u);
        }
      }
      uint64_t v58 = mach_absolute_time();
      id v59 = VCPSignPostLog();
      os_signpost_id_t v60 = os_signpost_id_generate(v59);

      uint64_t v61 = VCPSignPostLog();
      v62 = v61;
      if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v62, OS_SIGNPOST_INTERVAL_BEGIN, v60, "VCPFaceProcessingPromotePersons", "", buf, 2u);
      }

      uint64_t v63 = VCPPromotePersons(v71->_photoLibrary, v30, v70);
      v64 = VCPSignPostLog();
      v65 = v64;
      if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v65, OS_SIGNPOST_INTERVAL_END, v60, "VCPFaceProcessingPromotePersons", "", buf, 2u);
      }

      if (v58)
      {
        mach_absolute_time();
        VCPPerformance_LogMeasurement();
      }
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        id v66 = VCPLogInstance();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
        {
          uint64_t v67 = @"failed";
          if (!v63) {
            uint64_t v67 = @"succeeded";
          }
          *(_DWORD *)buf = 138412290;
          id v86 = v67;
          _os_log_impl(&dword_1BBEDA000, v66, OS_LOG_TYPE_INFO, "Person Processing: Person Promotion %@", buf, 0xCu);
        }
      }
      if (!v63)
      {
        uint64_t v16 = 1;
        [MEMORY[0x1E4F8E818] setProcessed:1 forLibrary:v71->_photoLibrary];
        goto LABEL_69;
      }
      v51 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v52 = *MEMORY[0x1E4F28760];
      uint64_t v81 = *MEMORY[0x1E4F28568];
      uint64_t v53 = objc_msgSend(NSString, "stringWithFormat:", @"VCPPromotePersons failed %d", v63);
      uint64_t v82 = v53;
      v54 = (void *)MEMORY[0x1E4F1C9E8];
      id v55 = &v82;
      uint64_t v56 = &v81;
    }
    uint64_t v68 = [v54 dictionaryWithObjects:v55 forKeys:v56 count:1];
    uint64_t v69 = [v51 errorWithDomain:v52 code:-18 userInfo:v68];

    uint64_t v16 = 0;
    id v34 = (id)v69;
LABEL_69:
    id v31 = v39;
    goto LABEL_70;
  }
  uint64_t v16 = 0;
LABEL_70:

  if (v16) {
    id v17 = 0;
  }
  else {
    id v17 = v34;
  }
  id v15 = v34;
  BOOL v11 = v73;
LABEL_74:
  ((void (**)(id, uint64_t, id))v11)[2](v11, v16, v17);
}

uint64_t __87__VCPFaceProcessingServiceWorker_reclusterFacesWithContext_reply_extendTimeout_cancel___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && ((*(uint64_t (**)(void))(v2 + 16))() & 1) != 0) {
    return 1;
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    (*(void (**)(void))(result + 16))();
    return 0;
  }
  return result;
}

- (void)rebuildPersonsWithContext:(id)a3 reply:(id)a4 extendTimeout:(id)a5 cancel:(id)a6
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v10 = (void (**)(id, void, id))a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2020000000;
  int v41 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__VCPFaceProcessingServiceWorker_rebuildPersonsWithContext_reply_extendTimeout_cancel___block_invoke;
  aBlock[3] = &unk_1E629B000;
  id v31 = v12;
  id v35 = v31;
  int v37 = &v38;
  id v30 = v11;
  id v36 = v30;
  id v32 = _Block_copy(aBlock);
  uint64_t v29 = [v28 objectForKeyedSubscript:@"personLocalIdentifier"];
  persistenceDelegate = self->_persistenceDelegate;
  id v33 = 0;
  LOBYTE(a6) = [(VCPPhotosPersistenceDelegate *)persistenceDelegate removeAutoAssignedFacesFromVerifiedPersonsAndPrepareForPersonBuilding:v29 cancelOrExtendTimeoutBlock:v32 error:&v33];
  id v14 = v33;
  if ((a6 & 1) == 0) {
    v10[2](v10, 0, v14);
  }
  id v15 = [[VCPPhotosFaceProcessingContext alloc] initWithPhotoLibrary:self->_photoLibrary];
  uint64_t v27 = [[VCPFaceClusterer alloc] initWithPhotoLibrary:self->_photoLibrary context:v15 cancelOrExtendTimeoutBlock:v32];
  uint64_t v16 = VCPBuildPersons(self->_photoLibrary, v27, v15, v30, v31);
  *((_DWORD *)v39 + 6) = v16;
  if (v16)
  {
    id v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = (uint64_t *)MEMORY[0x1E4F28568];
    uint64_t v44 = *MEMORY[0x1E4F28568];
    id v19 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to rebuild persons (error: %d)", v16);
    v45[0] = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
    uint64_t v21 = [v17 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v20];

    v10[2](v10, 0, (id)v21);
    id v14 = (id)v21;
  }
  else
  {
    uint64_t v18 = (uint64_t *)MEMORY[0x1E4F28568];
  }
  uint64_t v22 = VCPPromotePersons(self->_photoLibrary, v30, v31);
  *((_DWORD *)v39 + 6) = v22;
  if (v22)
  {
    id v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v42 = *v18;
    os_signpost_id_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to promote persons (error: %d)", v22);
    os_signpost_id_t v43 = v24;
    id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    uint64_t v26 = [v23 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v25];

    v10[2](v10, 0, (id)v26);
    id v14 = (id)v26;
  }
  v10[2](v10, 1, 0);

  _Block_object_dispose(&v38, 8);
}

uint64_t __87__VCPFaceProcessingServiceWorker_rebuildPersonsWithContext_reply_extendTimeout_cancel___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2 && (*(unsigned int (**)(void))(v2 + 16))())
  {
    *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = -128;
    return 1;
  }
  else
  {
    uint64_t result = a1[5];
    if (result)
    {
      (*(void (**)(void))(result + 16))();
      return 0;
    }
  }
  return result;
}

- (void)resetPersonPromoterStatusWithReply:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  int v4 = (void (**)(id, void, void *))a3;
  photoLibrary = self->_photoLibrary;
  if (!photoLibrary)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F28760];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    os_signpost_id_t v8 = [NSString stringWithFormat:@"could not obtain access to the photo library"];
    v12[0] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v10 = [v6 errorWithDomain:v7 code:-50 userInfo:v9];
    v4[2](v4, 0, v10);

    photoLibrary = self->_photoLibrary;
  }
  [MEMORY[0x1E4F8E818] setProcessed:0 forLibrary:photoLibrary];
  v4[2](v4, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionLoggingDirectory, 0);
  objc_storeStrong((id *)&self->_vuService, 0);
  objc_storeStrong((id *)&self->_persistenceDelegate, 0);
  objc_storeStrong((id *)&self->_clusterer, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end