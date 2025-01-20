@interface CHSynthesisStyleInventory
+ (BOOL)clear;
+ (BOOL)isPersonalizedSynthesisModelInitializing;
+ (BOOL)isPersonalizedSynthesisModelReady;
+ (BOOL)shouldBypassGating;
+ (BOOL)supportsSecureCoding;
+ (id)_defaultInventoryStorageURL;
+ (id)_formatVersion;
+ (id)_groupContainerURL;
+ (id)_mathCharacterSet;
+ (id)personalizedSynthesisModelVersion;
+ (id)relativePath;
+ (id)remainingCharacterSetFromPromptCharacterSet:(id)a3 withSample:(id)a4;
+ (id)statusWithInventory:(id)a3;
+ (id)stitchStyleSamples:(id)a3;
+ (int64_t)_longConfigLength;
+ (int64_t)_maxInventorySize;
+ (int64_t)_maxSamplesToStitch;
+ (int64_t)_minimumSampleCountByCharacter;
+ (int64_t)_shortConfigLength;
+ (int64_t)maxStyleSampleLengthForPrompt:(id)a3;
- (BOOL)_unsafeHasLowSampleCountForCharacters:(id)a3 minimumSampleCount:(int64_t)a4;
- (BOOL)containsSampleWithTranscription:(id)a3 strokeIdentifiers:(id)a4;
- (BOOL)hasAllDigits;
- (BOOL)hasInventoryChanged;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPersonalizationAvailable;
- (BOOL)isSimpleMathPattern:(id)a3;
- (BOOL)isTokenAcceptable:(id)a3;
- (BOOL)needsStylePredictionUpdate;
- (BOOL)save;
- (CHSynthesisStyleInventory)init;
- (CHSynthesisStyleInventory)initWithCoder:(id)a3;
- (CHSynthesisStyleInventory)initWithStyles:(id)a3 sampleCountByCharacter:(id)a4 storageURL:(id)a5 synthesisModelHash:(id)a6 currentSamplingTimestep:(int64_t)a7 characterStyleTimestamp:(double)a8 fastPathCharacterStyles:(id)a9 characterInventoryVersion:(int64_t)a10;
- (CHSynthesisStyleInventory)initWithURL:(id)a3;
- (NSDate)lastSavedDate;
- (NSMutableDictionary)fastPathCharacterStyles;
- (NSMutableDictionary)sampleCountByCharacter;
- (NSMutableDictionary)styles;
- (NSString)synthesisModelHash;
- (NSURL)inventoryStorageURL;
- (OS_dispatch_queue)_workQueue;
- (double)characterStyleTimestamp;
- (double)getLastCharacterStyleTimestamp;
- (id)_unsafeSamplesWithStylePrediction;
- (id)characterCoverage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultStyleSample;
- (id)fastPathCharacterStylesWithVariations;
- (id)highestCharacterCoverageStyleSampleForPrompt:(id)a3 styles:(id)a4;
- (id)nearestInventorySamplesToSample:(id)a3 prompt:(id)a4 maxStyleSampleLength:(int64_t)a5;
- (id)samplesWithoutStylePrediction;
- (id)shortStringHeuristicStyleSampleForPrompt:(id)a3 styles:(id)a4 maxNumOfSamples:(unint64_t)a5;
- (id)styleCharCoverageForInputSample:(id)a3 prompt:(id)a4 maxStyleSampleLength:(int64_t)a5;
- (id)styleSampleForInputSample:(id)a3 prompt:(id)a4 samplingAlgorithm:(unint64_t)a5;
- (id)styleSampleForInputSample:(id)a3 prompt:(id)a4 samplingAlgorithm:(unint64_t)a5 maxStyleSampleLength:(int64_t)a6;
- (id)styleSampleOptionsForRequest:(id)a3;
- (id)styleSamplesForInputSample:(id)a3 prompt:(id)a4 samplingAlgorithm:(unint64_t)a5 maxNumOfSamples:(unint64_t)a6;
- (int64_t)characterInventoryVersion;
- (int64_t)currentSamplingTimestep;
- (int64_t)minimumNumberOfSamplesWithStylePrediction;
- (unint64_t)countOfStyleSamples;
- (void)_safelyRunBlock:(id)a3;
- (void)_unsafeAddSample:(id)a3;
- (void)_unsafeRemoveSample:(id)a3;
- (void)_unsafeUpdateCharacterCoverageWithAddedSample:(id)a3;
- (void)_unsafeUpdateCharacterCoverageWithRemovedSample:(id)a3;
- (void)addSample:(id)a3;
- (void)addSampleOfSynthesizedCharacter:(id)a3 transcription:(id)a4 key:(unsigned int)a5;
- (void)addSampleOfSynthesizedCharacter:(id)a3 transcription:(id)a4 key:(unsigned int)a5 version:(int64_t)a6;
- (void)addSamplesIfNeededWithTokenizedMathResult:(id)a3 drawing:(id)a4 strokeIdentifiers:(id)a5;
- (void)addSamplesIfNeededWithTokenizedTextResult:(id)a3 drawing:(id)a4 strokeIdentifiers:(id)a5;
- (void)addSamplesWithArray:(id)a3;
- (void)cleanupFastPathCharacters;
- (void)clearSamplesEmbeddingVector;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateStyleSamplesUsingBlock:(id)a3;
- (void)removeSample:(id)a3;
- (void)removeSamplesContainingStrokeIdentifiers:(id)a3;
- (void)removeStyleSamplesIfNeeded;
- (void)removeStyleSamplesIfNeededWithMaximumSize:(int64_t)a3 minimumSampleCountByCharacter:(int64_t)a4;
- (void)reset;
- (void)resetCurrentSamplingTimestep;
- (void)saveIfNeeded;
- (void)setCharacterInventoryVersion:(int64_t)a3;
- (void)setCurrentSamplingTimestep:(int64_t)a3;
- (void)setFastPathCharacterStyles:(id)a3;
- (void)setHasInventoryChanged:(BOOL)a3;
- (void)setLastSavedDate:(id)a3;
- (void)setSampleCountByCharacter:(id)a3;
- (void)setStyles:(id)a3;
- (void)setSynthesisModelHash:(id)a3;
- (void)updateSamplingCountForSample:(id)a3;
- (void)updateStylePredictionsWithSamples:(id)a3;
- (void)updateSynthesisModelHash:(id)a3;
@end

@implementation CHSynthesisStyleInventory

+ (id)_groupContainerURL
{
  if (qword_1EA3C9170 == -1)
  {
    v2 = (void *)qword_1EA3C9168;
  }
  else
  {
    dispatch_once(&qword_1EA3C9170, &unk_1F2011210);
    v2 = (void *)qword_1EA3C9168;
  }
  return v2;
}

+ (id)relativePath
{
  if (os_variant_has_internal_diagnostics())
  {
    v7 = objc_msgSend_standardUserDefaults(MEMORY[0x1E4F1CB18], v2, v3, v4, v5, v6);
    v12 = objc_msgSend_dictionaryForKey_(v7, v8, @"com.apple.corehandwriting", v9, v10, v11);

    v17 = objc_msgSend_objectForKey_(v12, v13, @"CHCustomStyleInventoryPath", v14, v15, v16);
    if (objc_msgSend_length(v17, v18, v19, v20, v21, v22)) {
      v23 = v17;
    }
    else {
      v23 = @"synthesis/styleInventory.dat";
    }

    v24 = v23;
  }
  else
  {
    v24 = @"synthesis/styleInventory.dat";
  }
  return v24;
}

+ (id)_defaultInventoryStorageURL
{
  uint64_t v6 = objc_msgSend__groupContainerURL(CHSynthesisStyleInventory, a2, v2, v3, v4, v5);
  v12 = objc_msgSend_relativePath(CHSynthesisStyleInventory, v7, v8, v9, v10, v11);
  v17 = objc_msgSend_URLByAppendingPathComponent_(v6, v13, (uint64_t)v12, v14, v15, v16);

  return v17;
}

+ (id)_formatVersion
{
  if (qword_1EA3C9180 == -1)
  {
    uint64_t v2 = (void *)qword_1EA3C9178;
  }
  else
  {
    dispatch_once(&qword_1EA3C9180, &unk_1F2010AA0);
    uint64_t v2 = (void *)qword_1EA3C9178;
  }
  return v2;
}

+ (BOOL)shouldBypassGating
{
  if (!os_variant_has_internal_diagnostics()) {
    return 0;
  }
  v7 = objc_msgSend_standardUserDefaults(MEMORY[0x1E4F1CB18], v2, v3, v4, v5, v6);
  v12 = objc_msgSend_dictionaryForKey_(v7, v8, @"com.apple.corehandwriting", v9, v10, v11);

  v17 = objc_msgSend_objectForKey_(v12, v13, @"kCHInventoryBypassGating", v14, v15, v16);
  char v23 = objc_msgSend_BOOLValue(v17, v18, v19, v20, v21, v22);

  return v23;
}

+ (id)_mathCharacterSet
{
  if (qword_1EA3C9190 == -1)
  {
    uint64_t v2 = (void *)qword_1EA3C9188;
  }
  else
  {
    dispatch_once(&qword_1EA3C9190, &unk_1F2011230);
    uint64_t v2 = (void *)qword_1EA3C9188;
  }
  return v2;
}

+ (int64_t)_maxInventorySize
{
  return 1000;
}

+ (int64_t)_minimumSampleCountByCharacter
{
  return 5;
}

+ (int64_t)_maxSamplesToStitch
{
  return 3;
}

+ (int64_t)_shortConfigLength
{
  return 8;
}

+ (int64_t)_longConfigLength
{
  return 48;
}

+ (int64_t)maxStyleSampleLengthForPrompt:(id)a3
{
  id v3 = a3;
  unint64_t v9 = objc_msgSend_length(v3, v4, v5, v6, v7, v8);
  if (v9 >= objc_msgSend__shortConfigLength(CHSynthesisStyleInventory, v10, v11, v12, v13, v14)) {
    uint64_t v20 = objc_msgSend__longConfigLength(CHSynthesisStyleInventory, v15, v16, v17, v18, v19);
  }
  else {
    uint64_t v20 = objc_msgSend__shortConfigLength(CHSynthesisStyleInventory, v15, v16, v17, v18, v19);
  }
  int64_t v21 = v20;

  return v21;
}

+ (BOOL)clear
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend__defaultInventoryStorageURL(CHSynthesisStyleInventory, a2, v2, v3, v4, v5);
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v7 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v6;
    _os_log_impl(&dword_1C492D000, v7, OS_LOG_TYPE_DEFAULT, "Clearing synthesis style inventory at %@", buf, 0xCu);
  }

  if ((objc_msgSend_checkResourceIsReachableAndReturnError_(v6, v8, 0, v9, v10, v11) & 1) == 0)
  {
    char v21 = 1;
    goto LABEL_13;
  }
  uint64_t v17 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v12, v13, v14, v15, v16);
  id v31 = 0;
  char v21 = objc_msgSend_removeItemAtURL_error_(v17, v18, (uint64_t)v6, (uint64_t)&v31, v19, v20);
  id v22 = v31;

  if ((v21 & 1) == 0)
  {
    if (qword_1EA3CA000 == -1)
    {
      char v23 = (id)qword_1EA3C9FD8;
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      char v23 = (id)qword_1EA3C9FD8;
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
    }
    v29 = objc_msgSend_absoluteString(v6, v24, v25, v26, v27, v28);
    *(_DWORD *)buf = 138412546;
    v33 = v29;
    __int16 v34 = 2112;
    id v35 = v22;
    _os_log_impl(&dword_1C492D000, v23, OS_LOG_TYPE_ERROR, "Style inventory could not be deleted from URL: %@, error: %@", buf, 0x16u);

    goto LABEL_10;
  }
LABEL_11:

LABEL_13:
  return v21;
}

+ (id)remainingCharacterSetFromPromptCharacterSet:(id)a3 withSample:(id)a4
{
  id v5 = a4;
  uint64_t v11 = objc_msgSend_mutableCopy(a3, v6, v7, v8, v9, v10);
  uint64_t v17 = objc_msgSend_characterCoverage(v5, v12, v13, v14, v15, v16);
  objc_msgSend_minusSet_(v11, v18, (uint64_t)v17, v19, v20, v21);

  return v11;
}

- (CHSynthesisStyleInventory)init
{
  uint64_t v7 = objc_msgSend__defaultInventoryStorageURL(CHSynthesisStyleInventory, a2, v2, v3, v4, v5);
  uint64_t v12 = (CHSynthesisStyleInventory *)objc_msgSend_initWithURL_(self, v8, (uint64_t)v7, v9, v10, v11);

  return v12;
}

- (CHSynthesisStyleInventory)initWithURL:(id)a3
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v107 = 0;
  int v10 = objc_msgSend_checkResourceIsReachableAndReturnError_(v5, v6, (uint64_t)&v107, v7, v8, v9);
  id v11 = v107;
  uint64_t v16 = v11;
  if (v10)
  {
    uint64_t v17 = objc_msgSend_dataWithContentsOfURL_(MEMORY[0x1E4F1C9B8], v12, (uint64_t)v5, v13, v14, v15);
    uint64_t v18 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v19 = objc_opt_class();
    id v106 = v16;
    id v22 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v18, v20, v19, (uint64_t)v17, (uint64_t)&v106, v21);
    id v23 = v106;

    if (v22)
    {
      v24 = v22;

      uint64_t v25 = v24;
      goto LABEL_26;
    }
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v26 = (id)qword_1EA3C9FD8;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v32 = objc_msgSend_absoluteString(v5, v27, v28, v29, v30, v31);
      *(_DWORD *)buf = 138412546;
      uint64_t v109 = (uint64_t)v32;
      __int16 v110 = 2112;
      id v111 = v23;
      _os_log_impl(&dword_1C492D000, v26, OS_LOG_TYPE_ERROR, "Error loading Synthesis style inventory from URL %@, error: %@", buf, 0x16u);
    }
  }
  else
  {
    id v23 = v11;
  }
  v105.receiver = self;
  v105.super_class = (Class)CHSynthesisStyleInventory;
  v33 = [(CHSynthesisStyleInventory *)&v105 init];
  if (!v33)
  {
LABEL_20:
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v71 = (id)qword_1EA3C9FD8;
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v109 = (uint64_t)v23;
      _os_log_impl(&dword_1C492D000, v71, OS_LOG_TYPE_ERROR, "Synthesis style inventory was not initialized. error: %@", buf, 0xCu);
    }
    uint64_t v25 = 0;
    v24 = 0;
    goto LABEL_36;
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  __int16 v34 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v34, OS_LOG_TYPE_DEBUG, "Initializing empty inventory", buf, 2u);
  }

  uint64_t v40 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v35, v36, v37, v38, v39);
  styles = v33->_styles;
  v33->_styles = (NSMutableDictionary *)v40;

  uint64_t v47 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v42, v43, v44, v45, v46);
  sampleCountByCharacter = v33->_sampleCountByCharacter;
  v33->_sampleCountByCharacter = (NSMutableDictionary *)v47;

  v33->_characterStyleTimestamp = 0.0;
  uint64_t v54 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v49, v50, v51, v52, v53);
  fastPathCharacterStyles = v33->_fastPathCharacterStyles;
  v33->_fastPathCharacterStyles = (NSMutableDictionary *)v54;

  v33->_characterInventoryVersion = 1;
  v61 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v56, v57, v58, v59, v60);
  v67 = objc_msgSend_URLByDeletingLastPathComponent(v5, v62, v63, v64, v65, v66);
  id v104 = 0;
  objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v61, v68, (uint64_t)v67, 1, 0, (uint64_t)&v104);
  id v69 = v104;

  if (v69)
  {
    if (qword_1EA3CA000 == -1)
    {
      v70 = (id)qword_1EA3C9FD8;
      if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      v70 = (id)qword_1EA3C9FD8;
      if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v109 = (uint64_t)v69;
    _os_log_impl(&dword_1C492D000, v70, OS_LOG_TYPE_ERROR, "Synthesis style inventory folder path could not be created. error: %@", buf, 0xCu);
    goto LABEL_19;
  }
  v24 = 0;
  uint64_t v25 = v33;
LABEL_26:
  objc_storeStrong((id *)&v25->_inventoryStorageURL, a3);
  uint64_t v77 = objc_msgSend_now(MEMORY[0x1E4F1C9C8], v72, v73, v74, v75, v76);
  lastSavedDate = v25->_lastSavedDate;
  v25->_lastSavedDate = (NSDate *)v77;

  v79 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v80 = dispatch_queue_create("com.apple.CoreHandwriting.CHSynthesisStyleInventoryQueue", v79);
  workQueue = v25->__workQueue;
  v25->__workQueue = (OS_dispatch_queue *)v80;

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v82 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
  {
    v88 = objc_msgSend_absoluteString(v25->_inventoryStorageURL, v83, v84, v85, v86, v87);
    *(_DWORD *)buf = 138412290;
    uint64_t v109 = (uint64_t)v88;
    _os_log_impl(&dword_1C492D000, v82, OS_LOG_TYPE_DEFAULT, "Synthesis style inventory URL %@", buf, 0xCu);
  }
  if (qword_1EA3CA000 != -1)
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    v89 = (id)qword_1EA3C9FD8;
    if (!os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  v89 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
  {
LABEL_32:
    uint64_t v95 = objc_msgSend_count(v25->_styles, v90, v91, v92, v93, v94);
    *(_DWORD *)buf = 134217984;
    uint64_t v109 = v95;
    _os_log_impl(&dword_1C492D000, v89, OS_LOG_TYPE_DEFAULT, "Loading synthesis style inventory containing %lu samples", buf, 0xCu);
  }
LABEL_33:

  if (qword_1EA3CA000 != -1)
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    v71 = (id)qword_1EA3C9FD8;
    if (!os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  v71 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
  {
LABEL_35:
    uint64_t v101 = objc_msgSend_count(v25->_fastPathCharacterStyles, v96, v97, v98, v99, v100);
    *(_DWORD *)buf = 134217984;
    uint64_t v109 = v101;
    _os_log_impl(&dword_1C492D000, v71, OS_LOG_TYPE_DEBUG, "Loading synthesis fast path character style inventory containing %lu samples", buf, 0xCu);
  }
LABEL_36:

  v102 = v25;
  return v102;
}

- (CHSynthesisStyleInventory)initWithStyles:(id)a3 sampleCountByCharacter:(id)a4 storageURL:(id)a5 synthesisModelHash:(id)a6 currentSamplingTimestep:(int64_t)a7 characterStyleTimestamp:(double)a8 fastPathCharacterStyles:(id)a9 characterInventoryVersion:(int64_t)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a9;
  v62.receiver = self;
  v62.super_class = (Class)CHSynthesisStyleInventory;
  uint64_t v27 = [(CHSynthesisStyleInventory *)&v62 init];
  if (v27)
  {
    uint64_t v28 = objc_msgSend_mutableCopy(v17, v22, v23, v24, v25, v26);
    styles = v27->_styles;
    v27->_styles = (NSMutableDictionary *)v28;

    uint64_t v35 = objc_msgSend_mutableCopy(v18, v30, v31, v32, v33, v34);
    sampleCountByCharacter = v27->_sampleCountByCharacter;
    v27->_sampleCountByCharacter = (NSMutableDictionary *)v35;

    uint64_t v42 = objc_msgSend_copy(v19, v37, v38, v39, v40, v41);
    inventoryStorageURL = v27->_inventoryStorageURL;
    v27->_inventoryStorageURL = (NSURL *)v42;

    uint64_t v49 = objc_msgSend_copy(v20, v44, v45, v46, v47, v48);
    synthesisModelHash = v27->_synthesisModelHash;
    v27->_synthesisModelHash = (NSString *)v49;

    v27->_currentSamplingTimestep = a7;
    v27->_characterStyleTimestamp = a8;
    uint64_t v56 = objc_msgSend_mutableCopy(v21, v51, v52, v53, v54, v55);
    fastPathCharacterStyles = v27->_fastPathCharacterStyles;
    v27->_fastPathCharacterStyles = (NSMutableDictionary *)v56;

    v27->_characterInventoryVersion = a10;
    uint64_t v58 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v59 = dispatch_queue_create("com.apple.CoreHandwriting.CHSynthesisStyleInventoryQueue", v58);
    workQueue = v27->__workQueue;
    v27->__workQueue = (OS_dispatch_queue *)v59;
  }
  return v27;
}

- (CHSynthesisStyleInventory)initWithCoder:(id)a3
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v94.receiver = self;
  v94.super_class = (Class)CHSynthesisStyleInventory;
  id v5 = [(CHSynthesisStyleInventory *)&v94 init];
  if (!v5) {
    goto LABEL_13;
  }
  uint64_t v6 = objc_opt_class();
  int v10 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"formatVersion", v8, v9);
  id v11 = objc_opt_class();
  id v17 = objc_msgSend__formatVersion(v11, v12, v13, v14, v15, v16);
  char isEqualToString = objc_msgSend_isEqualToString_(v10, v18, (uint64_t)v17, v19, v20, v21);

  if (isEqualToString)
  {
    uint64_t v23 = (void *)MEMORY[0x1E4F1CAD0];
    v95[0] = objc_opt_class();
    v95[1] = objc_opt_class();
    v95[2] = objc_opt_class();
    v95[3] = objc_opt_class();
    v95[4] = objc_opt_class();
    v95[5] = objc_opt_class();
    uint64_t v27 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v24, (uint64_t)v95, 6, v25, v26);
    uint64_t v32 = objc_msgSend_setWithArray_(v23, v28, (uint64_t)v27, v29, v30, v31);

    uint64_t v36 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v33, (uint64_t)v32, @"styleSamples", v34, v35);
    styles = v5->_styles;
    v5->_styles = (NSMutableDictionary *)v36;

    uint64_t v41 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v38, (uint64_t)v32, @"sampleCountByCharacter", v39, v40);
    sampleCountByCharacter = v5->_sampleCountByCharacter;
    v5->_sampleCountByCharacter = (NSMutableDictionary *)v41;

    uint64_t v43 = objc_opt_class();
    uint64_t v47 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v44, v43, @"inventoryStorageURL", v45, v46);
    inventoryStorageURL = v5->_inventoryStorageURL;
    v5->_inventoryStorageURL = (NSURL *)v47;

    uint64_t v49 = objc_opt_class();
    uint64_t v53 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v50, v49, @"synthesisModelHash", v51, v52);
    synthesisModelHash = v5->_synthesisModelHash;
    v5->_synthesisModelHash = (NSString *)v53;

    v5->_currentSamplingTimestep = objc_msgSend_decodeIntegerForKey_(v4, v55, @"currentSamplingTimestep", v56, v57, v58);
    v5->_characterStyleTimestamp = (double)objc_msgSend_decodeIntegerForKey_(v4, v59, @"characterStyleTimestamp", v60, v61, v62);
    uint64_t v66 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v63, (uint64_t)v32, @"fastPathCharacterStyles", v64, v65);
    fastPathCharacterStyles = v5->_fastPathCharacterStyles;
    v5->_fastPathCharacterStyles = (NSMutableDictionary *)v66;

    v5->_int64_t characterInventoryVersion = objc_msgSend_decodeIntegerForKey_(v4, v68, @"fastPathCharacterInventoryVersion", v69, v70, v71);
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v72 = (id)qword_1EA3C9FD8;
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
    {
      int64_t characterInventoryVersion = v5->_characterInventoryVersion;
      *(_DWORD *)buf = 134217984;
      int64_t v97 = characterInventoryVersion;
      _os_log_impl(&dword_1C492D000, v72, OS_LOG_TYPE_DEBUG, "Fast path character inventory version=%li.", buf, 0xCu);
    }

    if (v5->_characterInventoryVersion > 0) {
      goto LABEL_12;
    }
    if (qword_1EA3CA000 == -1)
    {
      uint64_t v74 = (id)qword_1EA3C9FD8;
      if (!os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
LABEL_11:

        objc_msgSend_cleanupFastPathCharacters(v5, v76, v77, v78, v79, v80);
        v5->_int64_t characterInventoryVersion = 1;
LABEL_12:
        v81 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v82 = dispatch_queue_create("com.apple.CoreHandwriting.CHSynthesisStyleInventoryQueue", v81);
        workQueue = v5->__workQueue;
        v5->__workQueue = (OS_dispatch_queue *)v82;

LABEL_13:
        uint64_t v84 = v5;
        goto LABEL_19;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      uint64_t v74 = (id)qword_1EA3C9FD8;
      if (!os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
    }
    int64_t v75 = v5->_characterInventoryVersion;
    *(_DWORD *)buf = 134218240;
    int64_t v97 = v75;
    __int16 v98 = 2048;
    uint64_t v99 = 1;
    _os_log_impl(&dword_1C492D000, v74, OS_LOG_TYPE_DEFAULT, "Fast path character inventory is outdated (version=%li, required=%li). Dropping it.", buf, 0x16u);
    goto LABEL_11;
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v85 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
  {
    uint64_t v86 = objc_opt_class();
    uint64_t v92 = objc_msgSend__formatVersion(v86, v87, v88, v89, v90, v91);
    *(_DWORD *)buf = 138412546;
    int64_t v97 = (int64_t)v10;
    __int16 v98 = 2112;
    uint64_t v99 = (uint64_t)v92;
    _os_log_impl(&dword_1C492D000, v85, OS_LOG_TYPE_ERROR, "Archive version not supported: %@. current version: %@", buf, 0x16u);
  }
  uint64_t v84 = 0;
LABEL_19:

  return v84;
}

- (void)encodeWithCoder:(id)a3
{
  id v38 = a3;
  id v4 = objc_opt_class();
  int v10 = objc_msgSend__formatVersion(v4, v5, v6, v7, v8, v9);
  objc_msgSend_encodeObject_forKey_(v38, v11, (uint64_t)v10, @"formatVersion", v12, v13);

  objc_msgSend_encodeObject_forKey_(v38, v14, (uint64_t)self->_styles, @"styleSamples", v15, v16);
  objc_msgSend_encodeObject_forKey_(v38, v17, (uint64_t)self->_sampleCountByCharacter, @"sampleCountByCharacter", v18, v19);
  objc_msgSend_encodeObject_forKey_(v38, v20, (uint64_t)self->_inventoryStorageURL, @"inventoryStorageURL", v21, v22);
  objc_msgSend_encodeObject_forKey_(v38, v23, (uint64_t)self->_synthesisModelHash, @"synthesisModelHash", v24, v25);
  objc_msgSend_encodeInteger_forKey_(v38, v26, self->_currentSamplingTimestep, @"currentSamplingTimestep", v27, v28);
  objc_msgSend_encodeInteger_forKey_(v38, v29, (uint64_t)self->_characterStyleTimestamp, @"characterStyleTimestamp", v30, v31);
  objc_msgSend_encodeObject_forKey_(v38, v32, (uint64_t)self->_fastPathCharacterStyles, @"fastPathCharacterStyles", v33, v34);
  objc_msgSend_encodeInteger_forKey_(v38, v35, self->_characterInventoryVersion, @"fastPathCharacterInventoryVersion", v36, v37);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)lastSavedDate
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_1C4A0F984;
  uint64_t v12 = sub_1C4A0F994;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C4A0F99C;
  v7[3] = &unk_1E64E1168;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend__safelyRunBlock_(self, a2, (uint64_t)v7, v2, v3, v4);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSDate *)v5;
}

- (void)resetCurrentSamplingTimestep
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1C4A0FA20;
  v5[3] = &unk_1E64E0D48;
  v5[4] = self;
  objc_msgSend__safelyRunBlock_(self, a2, (uint64_t)v5, v2, v3, v4);
}

- (void)updateSamplingCountForSample:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4A0FC28;
  v10[3] = &unk_1E64E11E0;
  v10[4] = self;
  id v11 = v4;
  id v5 = v4;
  objc_msgSend__safelyRunBlock_(self, v6, (uint64_t)v10, v7, v8, v9);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CHSynthesisStyleInventory alloc];
  uint64_t v10 = objc_msgSend_styles(self, v5, v6, v7, v8, v9);
  uint64_t v16 = objc_msgSend_sampleCountByCharacter(self, v11, v12, v13, v14, v15);
  uint64_t v22 = objc_msgSend_inventoryStorageURL(self, v17, v18, v19, v20, v21);
  uint64_t v28 = objc_msgSend_synthesisModelHash(self, v23, v24, v25, v26, v27);
  uint64_t v34 = objc_msgSend_currentSamplingTimestep(self, v29, v30, v31, v32, v33);
  objc_msgSend_characterStyleTimestamp(self, v35, v36, v37, v38, v39);
  double v41 = v40;
  uint64_t v47 = objc_msgSend_fastPathCharacterStyles(self, v42, v43, v44, v45, v46);
  uint64_t v53 = objc_msgSend_characterInventoryVersion(self, v48, v49, v50, v51, v52);
  uint64_t v55 = objc_msgSend_initWithStyles_sampleCountByCharacter_storageURL_synthesisModelHash_currentSamplingTimestep_characterStyleTimestamp_fastPathCharacterStyles_characterInventoryVersion_(v4, v54, (uint64_t)v10, (uint64_t)v16, (uint64_t)v22, (uint64_t)v28, v34, v47, v41, v53);

  return v55;
}

- (BOOL)save
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v3 = (id)qword_1EA3C9FC8;
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  if (qword_1EA3CA000 == -1)
  {
    id v5 = (id)qword_1EA3C9FC8;
    unint64_t v6 = v4 - 1;
    if (v4 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    id v5 = (id)qword_1EA3C9FC8;
    unint64_t v6 = v4 - 1;
    if (v4 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CHStyleInventorySave", "", buf, 2u);
  }
LABEL_7:

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v7 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v7, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHStyleInventorySave\"", buf, 2u);
  }

  *(void *)buf = 0;
  uint64_t v62 = buf;
  uint64_t v63 = 0x3032000000;
  uint64_t v64 = sub_1C4A0F984;
  uint64_t v65 = sub_1C4A0F994;
  id v66 = 0;
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = sub_1C4A10624;
  v60[3] = &unk_1E64E1168;
  v60[4] = self;
  v60[5] = buf;
  objc_msgSend__safelyRunBlock_(self, v8, (uint64_t)v60, v9, v10, v11);
  uint64_t v12 = *((void *)v62 + 5);
  id v59 = 0;
  uint64_t v15 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v13, v12, 1, (uint64_t)&v59, v14);
  id v21 = v59;
  if (v15)
  {
    uint64_t v22 = objc_msgSend_inventoryStorageURL(*((void **)v62 + 5), v16, v17, v18, v19, v20);
    char v26 = objc_msgSend_writeToURL_atomically_(v15, v23, (uint64_t)v22, 1, v24, v25);

    if ((v26 & 1) == 0)
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      uint64_t v32 = (id)qword_1EA3C9FD8;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        uint64_t v38 = objc_msgSend_inventoryStorageURL(*((void **)v62 + 5), v33, v34, v35, v36, v37);
        *(_DWORD *)v67 = 138412290;
        id v68 = v38;
        _os_log_impl(&dword_1C492D000, v32, OS_LOG_TYPE_ERROR, "Could not write inventory to URL: %@", v67, 0xCu);
      }
    }
    uint64_t v39 = objc_msgSend_inventoryStorageURL(*((void **)v62 + 5), v27, v28, v29, v30, v31);
    id v58 = v21;
    char v44 = objc_msgSend_checkResourceIsReachableAndReturnError_(v39, v40, (uint64_t)&v58, v41, v42, v43);
    id v45 = v58;

    if ((v44 & 1) == 0)
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      uint64_t v46 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
      {
        uint64_t v52 = objc_msgSend_inventoryStorageURL(*((void **)v62 + 5), v47, v48, v49, v50, v51);
        *(_DWORD *)v67 = 138412546;
        id v68 = v52;
        __int16 v69 = 2112;
        id v70 = v45;
        _os_log_impl(&dword_1C492D000, v46, OS_LOG_TYPE_FAULT, "Error inventory file not reachable at url: %@, error %@", v67, 0x16u);
      }
    }
    if (qword_1EA3CA000 == -1)
    {
      uint64_t v53 = (id)qword_1EA3C9FC8;
      if (v6 <= 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_26;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      uint64_t v53 = (id)qword_1EA3C9FC8;
      if (v6 <= 0xFFFFFFFFFFFFFFFDLL)
      {
LABEL_26:
        if (os_signpost_enabled(v53))
        {
          *(_WORD *)v67 = 0;
          _os_signpost_emit_with_name_impl(&dword_1C492D000, v53, OS_SIGNPOST_INTERVAL_END, v4, "CHStyleInventorySave", "", v67, 2u);
        }
      }
    }

    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v54 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v67 = 0;
      _os_log_impl(&dword_1C492D000, v54, OS_LOG_TYPE_DEFAULT, "END \"CHStyleInventorySave\"", v67, 2u);
    }
    id v21 = v45;
    goto LABEL_46;
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v55 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v67 = 138412290;
    id v68 = v21;
    _os_log_impl(&dword_1C492D000, v55, OS_LOG_TYPE_ERROR, "Could not encode inventory. error: %@", v67, 0xCu);
  }

  if (qword_1EA3CA000 == -1)
  {
    uint64_t v56 = (id)qword_1EA3C9FC8;
    if (v6 <= 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_39;
    }
  }
  else
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    uint64_t v56 = (id)qword_1EA3C9FC8;
    if (v6 <= 0xFFFFFFFFFFFFFFFDLL)
    {
LABEL_39:
      if (os_signpost_enabled(v56))
      {
        *(_WORD *)v67 = 0;
        _os_signpost_emit_with_name_impl(&dword_1C492D000, v56, OS_SIGNPOST_INTERVAL_END, v4, "CHStyleInventorySave", "", v67, 2u);
      }
    }
  }

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v54 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v67 = 0;
    _os_log_impl(&dword_1C492D000, v54, OS_LOG_TYPE_DEFAULT, "END \"CHStyleInventorySave\"", v67, 2u);
  }
  char v26 = 0;
LABEL_46:

  _Block_object_dispose(buf, 8);
  return v26;
}

- (void)saveIfNeeded
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1C4A106DC;
  v5[3] = &unk_1E64E0D48;
  v5[4] = self;
  objc_msgSend__safelyRunBlock_(self, a2, (uint64_t)v5, v2, v3, v4);
}

- (BOOL)containsSampleWithTranscription:(id)a3 strokeIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1C4A1096C;
  v15[3] = &unk_1E64E2460;
  v15[4] = self;
  id v16 = v7;
  id v17 = v6;
  uint64_t v18 = &v19;
  id v8 = v6;
  id v9 = v7;
  objc_msgSend__safelyRunBlock_(self, v10, (uint64_t)v15, v11, v12, v13);
  LOBYTE(self) = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)self;
}

- (void)removeSamplesContainingStrokeIdentifiers:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_count(v4, v5, v6, v7, v8, v9))
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1C4A10B0C;
    v14[3] = &unk_1E64E11E0;
    v14[4] = self;
    id v15 = v4;
    objc_msgSend__safelyRunBlock_(self, v10, (uint64_t)v14, v11, v12, v13);
  }
}

- (void)reset
{
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v3 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v3, OS_LOG_TYPE_DEFAULT, "Inventory data ingestion: Resetting the style inventory", buf, 2u);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1C4A10D88;
  v8[3] = &unk_1E64E0D48;
  v8[4] = self;
  objc_msgSend__safelyRunBlock_(self, v4, (uint64_t)v8, v5, v6, v7);
}

- (void)_unsafeAddSample:(id)a3
{
  uint64_t v150 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v5 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_msgSend_transcription(v4, v6, v7, v8, v9, v10);
    int v146 = 138739971;
    uint64_t v147 = (uint64_t)v11;
    _os_log_impl(&dword_1C492D000, v5, OS_LOG_TYPE_DEFAULT, "Inventory data ingestion: Initiating style sample addition with string: %{sensitive}@", (uint8_t *)&v146, 0xCu);
  }
  if (!v4)
  {
    if (qword_1EA3CA000 == -1)
    {
      uint64_t v33 = (id)qword_1EA3C9FD8;
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_20;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      uint64_t v33 = (id)qword_1EA3C9FD8;
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_20;
      }
    }
    LOWORD(v146) = 0;
    _os_log_impl(&dword_1C492D000, v33, OS_LOG_TYPE_DEBUG, "Inventory data ingestion: rejecting nil sample", (uint8_t *)&v146, 2u);
    goto LABEL_20;
  }
  id v17 = objc_msgSend_transcription(v4, v12, v13, v14, v15, v16);
  uint64_t v23 = objc_msgSend_strokeIdentifiers(v4, v18, v19, v20, v21, v22);
  int v27 = objc_msgSend_containsSampleWithTranscription_strokeIdentifiers_(self, v24, (uint64_t)v17, (uint64_t)v23, v25, v26);

  if (!v27)
  {
    uint64_t v46 = objc_msgSend_strokeIdentifiers(v4, v28, v29, v30, v31, v32);
    objc_msgSend_removeSamplesContainingStrokeIdentifiers_(self, v47, (uint64_t)v46, v48, v49, v50);

    uint64_t v56 = objc_msgSend_transcription(v4, v51, v52, v53, v54, v55);
    uint64_t v62 = objc_msgSend_drawing(v4, v57, v58, v59, v60, v61);
    id v68 = objc_msgSend_strokeIdentifiers(v4, v63, v64, v65, v66, v67);
    uint64_t v33 = objc_msgSend_sampleWithTranscription_drawing_strokeIdentifiers_(CHSynthesisStyleSample, v69, (uint64_t)v56, (uint64_t)v62, (uint64_t)v68, v70);

    uint64_t v76 = objc_msgSend_currentSamplingTimestep(self, v71, v72, v73, v74, v75);
    objc_msgSend_setCreationTimestep_(v33, v77, v76, v78, v79, v80);
    uint64_t v86 = objc_msgSend_styles(self, v81, v82, v83, v84, v85);
    uint64_t v92 = objc_msgSend_strokeIdentifiers(v33, v87, v88, v89, v90, v91);
    objc_msgSend_setObject_forKeyedSubscript_(v86, v93, (uint64_t)v33, (uint64_t)v92, v94, v95);

    objc_msgSend__unsafeUpdateCharacterCoverageWithAddedSample_(self, v96, (uint64_t)v33, v97, v98, v99);
    objc_msgSend_setHasInventoryChanged_(self, v100, 1, v101, v102, v103);
    if (qword_1EA3CA000 == -1)
    {
      id v104 = (id)qword_1EA3C9FD8;
      if (!os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      id v104 = (id)qword_1EA3C9FD8;
      if (!os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
      {
LABEL_16:

        if (qword_1EA3CA000 == -1)
        {
          id v111 = (id)qword_1EA3C9FD8;
          if (!os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
          {
LABEL_19:

            goto LABEL_20;
          }
        }
        else
        {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          id v111 = (id)qword_1EA3C9FD8;
          if (!os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_19;
          }
        }
        v117 = objc_msgSend_characterCoverage(self, v112, v113, v114, v115, v116);
        uint64_t v123 = objc_msgSend_count(v117, v118, v119, v120, v121, v122);
        v129 = objc_msgSend_characterCoverage(self, v124, v125, v126, v127, v128);
        v135 = objc_msgSend_allObjects(v129, v130, v131, v132, v133, v134);
        v140 = objc_msgSend_sortedArrayUsingSelector_(v135, v136, (uint64_t)sel_compare_, v137, v138, v139);
        v145 = objc_msgSend_componentsJoinedByString_(v140, v141, @",", v142, v143, v144);
        int v146 = 134218242;
        uint64_t v147 = v123;
        __int16 v148 = 2112;
        v149 = v145;
        _os_log_impl(&dword_1C492D000, v111, OS_LOG_TYPE_DEFAULT, "Inventory Style character coverage (len %ld): %@", (uint8_t *)&v146, 0x16u);

        goto LABEL_19;
      }
    }
    __int16 v110 = objc_msgSend_transcription(v33, v105, v106, v107, v108, v109);
    int v146 = 138739971;
    uint64_t v147 = (uint64_t)v110;
    _os_log_impl(&dword_1C492D000, v104, OS_LOG_TYPE_DEFAULT, "Inventory data ingestion: Adding style sample with string: %{sensitive}@", (uint8_t *)&v146, 0xCu);

    goto LABEL_16;
  }
  if (qword_1EA3CA000 != -1)
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    uint64_t v33 = (id)qword_1EA3C9FD8;
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_20;
    }
    goto LABEL_9;
  }
  uint64_t v33 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
LABEL_9:
    uint64_t v39 = objc_msgSend_transcription(v4, v34, v35, v36, v37, v38);
    id v45 = objc_msgSend_strokeIdentifiers(v4, v40, v41, v42, v43, v44);
    int v146 = 138740227;
    uint64_t v147 = (uint64_t)v39;
    __int16 v148 = 2112;
    v149 = v45;
    _os_log_impl(&dword_1C492D000, v33, OS_LOG_TYPE_DEBUG, "Inventory data ingestion: preventing style sample from being added multiple times since it already exists (string: %{sensitive}@, stroke identifiers: %@)", (uint8_t *)&v146, 0x16u);
  }
LABEL_20:
}

- (void)addSample:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4A114D4;
  v10[3] = &unk_1E64E11E0;
  v10[4] = self;
  id v11 = v4;
  id v5 = v4;
  objc_msgSend__safelyRunBlock_(self, v6, (uint64_t)v10, v7, v8, v9);
}

- (void)addSamplesWithArray:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4A1158C;
  v10[3] = &unk_1E64E11E0;
  id v11 = v4;
  uint64_t v12 = self;
  id v5 = v4;
  objc_msgSend__safelyRunBlock_(self, v6, (uint64_t)v10, v7, v8, v9);
}

- (void)removeSample:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4A1174C;
  v10[3] = &unk_1E64E11E0;
  void v10[4] = self;
  id v11 = v4;
  id v5 = v4;
  objc_msgSend__safelyRunBlock_(self, v6, (uint64_t)v10, v7, v8, v9);
}

- (void)_unsafeRemoveSample:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend__unsafeUpdateCharacterCoverageWithRemovedSample_(self, v5, (uint64_t)v4, v6, v7, v8);
  uint64_t v14 = objc_msgSend_styles(self, v9, v10, v11, v12, v13);
  uint64_t v20 = objc_msgSend_strokeIdentifiers(v4, v15, v16, v17, v18, v19);
  objc_msgSend_removeObjectForKey_(v14, v21, (uint64_t)v20, v22, v23, v24);

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v25 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v31 = objc_msgSend_transcription(v4, v26, v27, v28, v29, v30);
    int v32 = 138739971;
    uint64_t v33 = v31;
    _os_log_impl(&dword_1C492D000, v25, OS_LOG_TYPE_DEFAULT, "Inventory data ingestion: removing style sample with string: %{sensitive}@", (uint8_t *)&v32, 0xCu);
  }
}

- (id)characterCoverage
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = sub_1C4A0F984;
  uint64_t v12 = sub_1C4A0F994;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C4A119F0;
  v7[3] = &unk_1E64E1168;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend__safelyRunBlock_(self, a2, (uint64_t)v7, v2, v3, v4);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)_unsafeUpdateCharacterCoverageWithAddedSample:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  objc_msgSend_characterCoverage(a3, a2, (uint64_t)a3, v3, v4, v5);
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v68, (uint64_t)v72, 16, v8);
  if (v14)
  {
    uint64_t v15 = *(void *)v69;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v69 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v68 + 1) + 8 * v16);
        uint64_t v18 = objc_msgSend_sampleCountByCharacter(self, v9, v10, v11, v12, v13);
        uint64_t v23 = objc_msgSend_objectForKey_(v18, v19, v17, v20, v21, v22);
        BOOL v24 = v23 == 0;

        if (v24)
        {
          uint64_t v30 = objc_msgSend_numberWithInteger_(NSNumber, v25, 0, v27, v28, v29);
          uint64_t v36 = objc_msgSend_sampleCountByCharacter(self, v31, v32, v33, v34, v35);
          objc_msgSend_setObject_forKeyedSubscript_(v36, v37, (uint64_t)v30, v17, v38, v39);
        }
        double v40 = NSNumber;
        uint64_t v41 = objc_msgSend_sampleCountByCharacter(self, v25, v26, v27, v28, v29);
        uint64_t v46 = objc_msgSend_objectForKeyedSubscript_(v41, v42, v17, v43, v44, v45);
        uint64_t v52 = objc_msgSend_integerValue(v46, v47, v48, v49, v50, v51);
        uint64_t v57 = objc_msgSend_numberWithInteger_(v40, v53, v52 + 1, v54, v55, v56);
        uint64_t v63 = objc_msgSend_sampleCountByCharacter(self, v58, v59, v60, v61, v62);
        objc_msgSend_setObject_forKeyedSubscript_(v63, v64, (uint64_t)v57, v17, v65, v66);

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v68, (uint64_t)v72, 16, v13);
    }
    while (v14);
  }
}

- (void)_unsafeUpdateCharacterCoverageWithRemovedSample:(id)a3
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  objc_msgSend_characterCoverage(a3, a2, (uint64_t)a3, v3, v4, v5);
  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v118, (uint64_t)v126, 16, v8);
  if (v14)
  {
    uint64_t v16 = *(void *)v119;
    *(void *)&long long v15 = 138412546;
    long long v116 = v15;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v119 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v118 + 1) + 8 * i);
        uint64_t v19 = objc_msgSend_sampleCountByCharacter(self, v9, v10, v11, v12, v13, v116);
        BOOL v24 = objc_msgSend_objectForKeyedSubscript_(v19, v20, v18, v21, v22, v23);
        BOOL v25 = v24 == 0;

        if (v25)
        {
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          uint64_t v31 = (id)qword_1EA3C9F90[0];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
          {
            uint64_t v37 = objc_msgSend_sampleCountByCharacter(self, v32, v33, v34, v35, v36);
            *(_DWORD *)buf = v116;
            uint64_t v123 = v18;
            __int16 v124 = 2112;
            uint64_t v125 = v37;
            _os_log_impl(&dword_1C492D000, v31, OS_LOG_TYPE_FAULT, "Character %@ not is not present in the sampleCountByCharacter dictionary %@", buf, 0x16u);
          }
        }
        uint64_t v38 = NSNumber;
        uint64_t v39 = objc_msgSend_sampleCountByCharacter(self, v26, v27, v28, v29, v30);
        uint64_t v44 = objc_msgSend_objectForKeyedSubscript_(v39, v40, v18, v41, v42, v43);
        uint64_t v50 = objc_msgSend_integerValue(v44, v45, v46, v47, v48, v49);
        uint64_t v55 = objc_msgSend_numberWithInteger_(v38, v51, v50 - 1, v52, v53, v54);
        uint64_t v61 = objc_msgSend_sampleCountByCharacter(self, v56, v57, v58, v59, v60);
        objc_msgSend_setObject_forKeyedSubscript_(v61, v62, (uint64_t)v55, v18, v63, v64);

        long long v70 = objc_msgSend_sampleCountByCharacter(self, v65, v66, v67, v68, v69);
        uint64_t v75 = objc_msgSend_objectForKeyedSubscript_(v70, v71, v18, v72, v73, v74);
        uint64_t v81 = objc_msgSend_integerValue(v75, v76, v77, v78, v79, v80);

        if (v81 < 0)
        {
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          uint64_t v87 = (id)qword_1EA3C9F90[0];
          if (os_log_type_enabled(v87, OS_LOG_TYPE_FAULT))
          {
            uint64_t v93 = objc_msgSend_sampleCountByCharacter(self, v88, v89, v90, v91, v92);
            uint64_t v98 = objc_msgSend_objectForKeyedSubscript_(v93, v94, v18, v95, v96, v97);
            *(_DWORD *)buf = v116;
            uint64_t v123 = v18;
            __int16 v124 = 2112;
            uint64_t v125 = v98;
            _os_log_impl(&dword_1C492D000, v87, OS_LOG_TYPE_FAULT, "Sample count for character %@ is negative %@", buf, 0x16u);
          }
        }
        uint64_t v99 = objc_msgSend_sampleCountByCharacter(self, v82, v83, v84, v85, v86);
        id v104 = objc_msgSend_objectForKeyedSubscript_(v99, v100, v18, v101, v102, v103);
        BOOL v110 = objc_msgSend_integerValue(v104, v105, v106, v107, v108, v109) == 0;

        if (v110)
        {
          id v111 = objc_msgSend_sampleCountByCharacter(self, v9, v10, v11, v12, v13);
          objc_msgSend_removeObjectForKey_(v111, v112, v18, v113, v114, v115);
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v118, (uint64_t)v126, 16, v13);
    }
    while (v14);
  }
}

- (BOOL)_unsafeHasLowSampleCountForCharacters:(id)a3 minimumSampleCount:(int64_t)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v6 = a3;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v32, (uint64_t)v36, 16, v8);
  if (v14)
  {
    uint64_t v15 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v6);
        }
        uint64_t v17 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend_sampleCountByCharacter(self, v9, v10, v11, v12, v13, (void)v32);
        uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v18, v19, v17, v20, v21, v22);
        BOOL v29 = objc_msgSend_integerValue(v23, v24, v25, v26, v27, v28) > a4;

        if (!v29)
        {
          BOOL v30 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v32, (uint64_t)v36, 16, v13);
      if (v14) {
        continue;
      }
      break;
    }
  }
  BOOL v30 = 0;
LABEL_11:

  return v30;
}

- (BOOL)isTokenAcceptable:(id)a3
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v10 = objc_msgSend_properties(v4, v5, v6, v7, v8, v9);
  uint64_t v16 = objc_msgSend_string(v4, v11, v12, v13, v14, v15);
  LOBYTE(self) = objc_msgSend_isSimpleMathPattern_(self, v17, (uint64_t)v16, v18, v19, v20);

  if ((v10 >> 2) & 1 | self & 1)
  {
    uint64_t v26 = objc_msgSend_string(v4, v21, v22, v23, v24, v25);
    unint64_t v32 = objc_msgSend_length(v26, v27, v28, v29, v30, v31);

    if (v32 > 2)
    {
      objc_msgSend_recognitionScore(v4, v33, v34, v35, v36, v37);
      if (v70 >= 0.850000024)
      {
        if (objc_msgSend_isTopOriginal(v4, v65, v66, v67, v68, v69))
        {
          BOOL v63 = 1;
          goto LABEL_12;
        }
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        uint64_t v38 = (id)qword_1EA3C9FD8;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v89 = objc_msgSend_string(v4, v84, v85, v86, v87, v88);
          int v90 = 138739971;
          uint64_t v91 = (uint64_t)v89;
          _os_log_impl(&dword_1C492D000, v38, OS_LOG_TYPE_DEBUG, "Inventory data ingestion: rejecting token it has been post processed. token string: %{sensitive}@", (uint8_t *)&v90, 0xCu);
        }
      }
      else
      {
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        uint64_t v38 = (id)qword_1EA3C9FD8;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend_recognitionScore(v4, v71, v72, v73, v74, v75);
          uint64_t v77 = v76;
          uint64_t v83 = objc_msgSend_string(v4, v78, v79, v80, v81, v82);
          int v90 = 134218499;
          uint64_t v91 = v77;
          __int16 v92 = 2048;
          uint64_t v93 = 0x3FEB333340000000;
          __int16 v94 = 2117;
          uint64_t v95 = v83;
          _os_log_impl(&dword_1C492D000, v38, OS_LOG_TYPE_DEBUG, "Inventory data ingestion: rejecting token due to recognition score (%2.2f) smaller than threshold %2.2f. token string: %{sensitive}@", (uint8_t *)&v90, 0x20u);
        }
      }
    }
    else
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      uint64_t v38 = (id)qword_1EA3C9FD8;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v44 = objc_msgSend_string(v4, v39, v40, v41, v42, v43);
        uint64_t v50 = objc_msgSend_length(v44, v45, v46, v47, v48, v49);
        uint64_t v56 = objc_msgSend_string(v4, v51, v52, v53, v54, v55);
        int v90 = 134218499;
        uint64_t v91 = v50;
        __int16 v92 = 2048;
        uint64_t v93 = 3;
        __int16 v94 = 2117;
        uint64_t v95 = v56;
        _os_log_impl(&dword_1C492D000, v38, OS_LOG_TYPE_DEBUG, "Inventory data ingestion: rejecting token due to length (%ld) smaller than %ld. token string: %{sensitive}@", (uint8_t *)&v90, 0x20u);
      }
    }
  }
  else
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v38 = (id)qword_1EA3C9FD8;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v62 = objc_msgSend_string(v4, v57, v58, v59, v60, v61);
      int v90 = 138739971;
      uint64_t v91 = (uint64_t)v62;
      _os_log_impl(&dword_1C492D000, v38, OS_LOG_TYPE_DEBUG, "Inventory data ingestion: rejecting token as it is out of lexicon and not a accepted math pattern. token string: %{sensitive}@", (uint8_t *)&v90, 0xCu);
    }
  }

  BOOL v63 = 0;
LABEL_12:

  return v63;
}

- (void)addSamplesIfNeededWithTokenizedTextResult:(id)a3 drawing:(id)a4 strokeIdentifiers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1C4A12874;
  v18[3] = &unk_1E64E12D0;
  id v19 = v8;
  id v20 = v10;
  uint64_t v21 = self;
  id v22 = v9;
  id v11 = v9;
  id v12 = v10;
  id v13 = v8;
  objc_msgSend__safelyRunBlock_(self, v14, (uint64_t)v18, v15, v16, v17);
}

- (BOOL)isSimpleMathPattern:(id)a3
{
  uint64_t v3 = (NSString *)a3;
  id v4 = objc_opt_class();
  objc_msgSend__mathCharacterSet(v4, v5, v6, v7, v8, v9);
  id v10 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
  BOOL v11 = isStringEntirelyFromSet(v3, v10);

  return v11;
}

- (void)addSamplesIfNeededWithTokenizedMathResult:(id)a3 drawing:(id)a4 strokeIdentifiers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1C4A12F48;
  v18[3] = &unk_1E64E12D0;
  id v19 = v8;
  id v20 = v10;
  uint64_t v21 = self;
  id v22 = v9;
  id v11 = v9;
  id v12 = v10;
  id v13 = v8;
  objc_msgSend__safelyRunBlock_(self, v14, (uint64_t)v18, v15, v16, v17);
}

- (void)updateStylePredictionsWithSamples:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4A13454;
  v10[3] = &unk_1E64E11E0;
  id v11 = v4;
  id v12 = self;
  id v5 = v4;
  objc_msgSend__safelyRunBlock_(self, v6, (uint64_t)v10, v7, v8, v9);
}

- (id)samplesWithoutStylePrediction
{
  uint64_t v7 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3, v4, v5);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4A13760;
  v16[3] = &unk_1E64E11E0;
  v16[4] = self;
  id v8 = v7;
  id v17 = v8;
  objc_msgSend__safelyRunBlock_(self, v9, (uint64_t)v16, v10, v11, v12);
  id v13 = v17;
  id v14 = v8;

  return v14;
}

- (id)_unsafeSamplesWithStylePrediction
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3, v4, v5);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v13 = objc_msgSend_styles(self, v8, v9, v10, v11, v12, 0);
  id v19 = objc_msgSend_allValues(v13, v14, v15, v16, v17, v18);

  uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v38, (uint64_t)v42, 16, v21);
  if (v27)
  {
    uint64_t v28 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v39 != v28) {
          objc_enumerationMutation(v19);
        }
        uint64_t v30 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if (objc_msgSend_hasEmbeddingVector(v30, v22, v23, v24, v25, v26)) {
          objc_msgSend_addObject_(v7, v22, (uint64_t)v30, v24, v25, v26);
        }
      }
      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v38, (uint64_t)v42, 16, v26);
    }
    while (v27);
  }

  uint64_t v36 = objc_msgSend_copy(v7, v31, v32, v33, v34, v35);
  return v36;
}

- (int64_t)minimumNumberOfSamplesWithStylePrediction
{
  return 100;
}

- (BOOL)needsStylePredictionUpdate
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C4A13BD8;
  v7[3] = &unk_1E64E24D8;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend__safelyRunBlock_(self, a2, (uint64_t)v7, v2, v3, v4);
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

+ (id)stitchStyleSamples:(id)a3
{
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  id v132 = a3;
  if (!objc_msgSend_count(v132, v3, v4, v5, v6, v7))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    id v13 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v13, OS_LOG_TYPE_FAULT, "Style sampling: Stitching Style Samples: Empty array is passed!", buf, 2u);
    }
  }
  if (objc_msgSend_count(v132, v8, v9, v10, v11, v12))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    id v14 = (id)qword_1EA3C9FD8;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = objc_msgSend_count(v132, v15, v16, v17, v18, v19);
      *(_DWORD *)buf = 134217984;
      uint64_t v141 = v20;
      _os_log_impl(&dword_1C492D000, v14, OS_LOG_TYPE_DEFAULT, "Style Sampling: stitching %lu samples", buf, 0xCu);
    }

    uint64_t v21 = objc_alloc_init(CHDrawing);
    uint64_t v134 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v22, v23, v24, v25, v26);
    uint64_t v32 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v27, v28, v29, v30, v31);
    long long v137 = 0u;
    long long v138 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    id obj = v132;
    uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v33, (uint64_t)&v135, (uint64_t)v139, 16, v34);
    if (v40)
    {
      uint64_t v41 = *(void *)v136;
      do
      {
        uint64_t v42 = 0;
        do
        {
          if (*(void *)v136 != v41) {
            objc_enumerationMutation(obj);
          }
          uint64_t v43 = *(void **)(*((void *)&v135 + 1) + 8 * v42);
          uint64_t v44 = objc_msgSend_drawing(v43, v35, v36, v37, v38, v39);
          BOOL v50 = objc_msgSend_strokeCount(v44, v45, v46, v47, v48, v49) == 0;

          if (v50)
          {
            if (qword_1EA3CA000 != -1) {
              dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
            }
            uint64_t v56 = (id)qword_1EA3C9F90[0];
            if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C492D000, v56, OS_LOG_TYPE_FAULT, "Style Sampling: Stitching style samples: Drawing must have > 0 strokes", buf, 2u);
            }
          }
          uint64_t v57 = objc_msgSend_drawing(v43, v51, v52, v53, v54, v55);
          BOOL v63 = objc_msgSend_transcription(v43, v58, v59, v60, v61, v62);
          uint64_t v67 = objc_msgSend_normalizeDrawing_transcription_(CHSynthesisStyleSample, v64, (uint64_t)v57, (uint64_t)v63, v65, v66);

          if (objc_msgSend_strokeCount(v21, v68, v69, v70, v71, v72))
          {
            objc_msgSend_bounds(v21, v73, v74, v75, v76, v77);
            double v79 = v78;
            objc_msgSend_normalizationTextHeight(CHSynthesisStyleSample, v80, v81, v82, v83, v84);
            objc_msgSend_drawingTransformedWithTranslation_scaleFactor_(v67, v86, v87, v88, v89, v90, v79 + v85, 0.0, 1.0);
            id v91 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v91 = v67;
          }
          uint64_t v96 = v91;
          objc_msgSend_appendDrawing_(v21, v92, (uint64_t)v91, v93, v94, v95);
          uint64_t v102 = objc_msgSend_transcription(v43, v97, v98, v99, v100, v101);
          objc_msgSend_addObject_(v134, v103, (uint64_t)v102, v104, v105, v106);

          uint64_t v112 = objc_msgSend_strokeIdentifiers(v43, v107, v108, v109, v110, v111);
          objc_msgSend_unionSet_(v32, v113, (uint64_t)v112, v114, v115, v116);

          ++v42;
        }
        while (v40 != v42);
        uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v135, (uint64_t)v139, 16, v39);
      }
      while (v40);
    }

    v117 = (void *)MEMORY[0x1E4F28E78];
    uint64_t v122 = objc_msgSend_componentsJoinedByString_(v134, v118, @" ", v119, v120, v121);
    uint64_t v127 = objc_msgSend_stringWithString_(v117, v123, (uint64_t)v122, v124, v125, v126);

    v130 = objc_msgSend_sampleWithTranscription_drawing_strokeIdentifiers_(CHSynthesisStyleSample, v128, (uint64_t)v127, (uint64_t)v21, (uint64_t)v32, v129);
  }
  else
  {
    v130 = 0;
  }

  return v130;
}

- (id)nearestInventorySamplesToSample:(id)a3 prompt:(id)a4 maxStyleSampleLength:(int64_t)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v55 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v10, v11, v12, v13, v14);
  uint64_t v19 = objc_msgSend_characterCoverageWithString_(CHSynthesisStyleSample, v15, (uint64_t)v9, v16, v17, v18);
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v20 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = objc_msgSend_transcription(v8, v21, v22, v23, v24, v25);
    uint64_t v32 = objc_msgSend_transcription(v8, v27, v28, v29, v30, v31);
    *(_DWORD *)buf = 138740227;
    uint64_t v62 = (uint64_t)v26;
    __int16 v63 = 2048;
    uint64_t v64 = objc_msgSend_length(v32, v33, v34, v35, v36, v37);
    _os_log_impl(&dword_1C492D000, v20, OS_LOG_TYPE_DEFAULT, "Style Sampling: Get nearest neighbors in style from the inventory for input style sample: %{sensitive}@ with length: %lu", buf, 0x16u);
  }
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = sub_1C4A14518;
  v56[3] = &unk_1E64E2500;
  v56[4] = self;
  id v38 = v8;
  id v57 = v38;
  id v39 = v19;
  id v58 = v39;
  int64_t v60 = a5;
  id v40 = v55;
  id v59 = v40;
  objc_msgSend__safelyRunBlock_(self, v41, (uint64_t)v56, v42, v43, v44);
  if (qword_1EA3CA000 != -1)
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    uint64_t v45 = (id)qword_1EA3C9FD8;
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  uint64_t v45 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
LABEL_7:
    uint64_t v51 = objc_msgSend_count(v40, v46, v47, v48, v49, v50);
    *(_DWORD *)buf = 134217984;
    uint64_t v62 = v51;
    _os_log_impl(&dword_1C492D000, v45, OS_LOG_TYPE_DEFAULT, "Style Sampling: Found %lu nearest neighbors in style from the inventory", buf, 0xCu);
  }
LABEL_8:

  uint64_t v52 = v59;
  id v53 = v40;

  return v53;
}

- (id)highestCharacterCoverageStyleSampleForPrompt:(id)a3 styles:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  id v8 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138740227;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = objc_msgSend_length(v6, v9, v10, v11, v12, v13);
    _os_log_impl(&dword_1C492D000, v8, OS_LOG_TYPE_DEFAULT, "Style Sampling: get highest character coverage style sample for prompt: %{sensitive}@ with length: %lu", buf, 0x16u);
  }

  uint64_t v18 = objc_msgSend_characterCoverageWithString_(CHSynthesisStyleSample, v14, (uint64_t)v6, v15, v16, v17);
  uint64_t v24 = objc_msgSend_characterCoverage(self, v19, v20, v21, v22, v23);
  char v29 = objc_msgSend_intersectsSet_(v18, v25, (uint64_t)v24, v26, v27, v28);

  if (v29)
  {
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    int64_t v60 = sub_1C4A0F984;
    uint64_t v61 = sub_1C4A0F994;
    id v62 = 0;
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = sub_1C4A152DC;
    v53[3] = &unk_1E64E12A8;
    id v54 = v7;
    id v55 = v18;
    uint64_t v56 = buf;
    objc_msgSend__safelyRunBlock_(self, v30, (uint64_t)v53, v31, v32, v33);
    if (qword_1EA3CA000 == -1)
    {
      uint64_t v34 = (id)qword_1EA3C9FD8;
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

        uint64_t v51 = objc_msgSend_normalizeStyleSample_(CHSynthesisStyleSample, v47, *(void *)(*(void *)&buf[8] + 40), v48, v49, v50);

        _Block_object_dispose(buf, 8);
        goto LABEL_11;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      uint64_t v34 = (id)qword_1EA3C9FD8;
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_9;
      }
    }
    id v40 = objc_msgSend_transcription(*(void **)(*(void *)&buf[8] + 40), v35, v36, v37, v38, v39);
    uint64_t v46 = objc_msgSend_length(v40, v41, v42, v43, v44, v45);
    *(_DWORD *)id v57 = 134217984;
    uint64_t v58 = v46;
    _os_log_impl(&dword_1C492D000, v34, OS_LOG_TYPE_DEFAULT, "Style Sampling: found highest character coverage style sample with length: %lu", v57, 0xCu);

    goto LABEL_9;
  }
  uint64_t v51 = 0;
LABEL_11:

  return v51;
}

- (id)shortStringHeuristicStyleSampleForPrompt:(id)a3 styles:(id)a4 maxNumOfSamples:(unint64_t)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v10 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138740227;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = objc_msgSend_length(v8, v11, v12, v13, v14, v15);
    _os_log_impl(&dword_1C492D000, v10, OS_LOG_TYPE_DEFAULT, "Style Sampling: get highest character coverage style sample for prompt: %{sensitive}@ with length: %lu", buf, 0x16u);
  }

  uint64_t v20 = objc_msgSend_characterCoverageWithString_(CHSynthesisStyleSample, v16, (uint64_t)v8, v17, v18, v19);
  uint64_t v26 = objc_msgSend_characterCoverage(self, v21, v22, v23, v24, v25);
  char v31 = objc_msgSend_intersectsSet_(v20, v27, (uint64_t)v26, v28, v29, v30);

  if (v31)
  {
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    uint64_t v58 = sub_1C4A0F984;
    id v59 = sub_1C4A0F994;
    id v60 = 0;
    uint64_t v49 = MEMORY[0x1E4F143A8];
    uint64_t v50 = 3221225472;
    uint64_t v51 = sub_1C4A15798;
    uint64_t v52 = &unk_1E64E2528;
    id v53 = v9;
    id v55 = buf;
    unint64_t v56 = a5;
    id v54 = v20;
    objc_msgSend__safelyRunBlock_(self, v32, (uint64_t)&v49, v33, v34, v35);
    uint64_t v41 = objc_msgSend_reverseObjectEnumerator(*(void **)(*(void *)&buf[8] + 40), v36, v37, v38, v39, v40, v49, v50, v51, v52);
    uint64_t v47 = objc_msgSend_allObjects(v41, v42, v43, v44, v45, v46);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v47 = 0;
  }

  return v47;
}

- (id)defaultStyleSample
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v3 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v3, OS_LOG_TYPE_DEFAULT, "Style Sampling: Since no initial style is part of the request, get an initial style sample from the inventory", buf, 2u);
  }

  *(void *)buf = 0;
  char v31 = buf;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = sub_1C4A0F984;
  uint64_t v34 = sub_1C4A0F994;
  id v35 = 0;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_1C4A163B0;
  v29[3] = &unk_1E64E24D8;
  v29[4] = self;
  v29[5] = buf;
  objc_msgSend__safelyRunBlock_(self, v4, (uint64_t)v29, v5, v6, v7);
  if (qword_1EA3CA000 == -1)
  {
    id v8 = (id)qword_1EA3C9FD8;
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  id v8 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
LABEL_7:
    uint64_t v14 = objc_msgSend_transcription(*((void **)v31 + 5), v9, v10, v11, v12, v13);
    uint64_t v20 = objc_msgSend_transcription(*((void **)v31 + 5), v15, v16, v17, v18, v19);
    uint64_t v26 = objc_msgSend_length(v20, v21, v22, v23, v24, v25);
    *(_DWORD *)uint64_t v36 = 138740227;
    uint64_t v37 = v14;
    __int16 v38 = 2048;
    uint64_t v39 = v26;
    _os_log_impl(&dword_1C492D000, v8, OS_LOG_TYPE_DEFAULT, "Style Sampling: picked up an initial style sample: %{sensitive}@ from the inventory of length: %lu", v36, 0x16u);
  }
LABEL_8:

  id v27 = *((id *)v31 + 5);
  _Block_object_dispose(buf, 8);

  return v27;
}

- (id)styleCharCoverageForInputSample:(id)a3 prompt:(id)a4 maxStyleSampleLength:(int64_t)a5
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v10 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138740227;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = objc_msgSend_length(v9, v11, v12, v13, v14, v15);
    _os_log_impl(&dword_1C492D000, v10, OS_LOG_TYPE_DEFAULT, "Style Sampling: Using style + character coverage algorithm to find style sample for prompt: %{sensitive}@ with length: %lu", buf, 0x16u);
  }

  uint64_t v21 = v8;
  if (!v8)
  {
    uint64_t v21 = objc_msgSend_defaultStyleSample(self, v16, v17, v18, v19, v20);
  }
  id v62 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v16, v17, v18, v19, v20);
  uint64_t v26 = objc_msgSend_characterCoverageWithString_(CHSynthesisStyleSample, v22, (uint64_t)v9, v23, v24, v25);
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  uint64_t v77 = sub_1C4A0F984;
  double v78 = sub_1C4A0F994;
  id v27 = v26;
  id v79 = v27;
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = sub_1C4A170C8;
  v69[3] = &unk_1E64E2550;
  uint64_t v73 = buf;
  v69[4] = self;
  id v28 = v21;
  id v70 = v28;
  id v29 = v9;
  id v71 = v29;
  int64_t v74 = a5;
  id v30 = v62;
  id v72 = v30;
  objc_msgSend__safelyRunBlock_(self, v31, (uint64_t)v69, v32, v33, v34);
  if (v8)
  {
    if (qword_1EA3CA000 == -1)
    {
      uint64_t v40 = (id)qword_1EA3C9FD8;
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
LABEL_11:

        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v41 = v30;
        uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v64, (uint64_t)v75, 16, v43);
        if (v48)
        {
          uint64_t v49 = *(void *)v65;
          do
          {
            for (uint64_t i = 0; i != v48; ++i)
            {
              if (*(void *)v65 != v49) {
                objc_enumerationMutation(v41);
              }
              objc_msgSend_updateSamplingCountForSample_(self, v44, *(void *)(*((void *)&v64 + 1) + 8 * i), v45, v46, v47);
            }
            uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v44, (uint64_t)&v64, (uint64_t)v75, 16, v47);
          }
          while (v48);
        }

        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = sub_1C4A1742C;
        v63[3] = &unk_1E64E0D48;
        v63[4] = self;
        objc_msgSend__safelyRunBlock_(self, v51, (uint64_t)v63, v52, v53, v54);
        goto LABEL_19;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      uint64_t v40 = (id)qword_1EA3C9FD8;
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_11;
      }
    }
    *(_WORD *)uint64_t v68 = 0;
    _os_log_impl(&dword_1C492D000, v40, OS_LOG_TYPE_DEBUG, "Style Sampling: Since input sample was part of the request, updating the sampling count of samples that are used as style sample", v68, 2u);
    goto LABEL_11;
  }
LABEL_19:
  if (objc_msgSend_count(v30, v35, v36, v37, v38, v39))
  {
    objc_msgSend_stitchStyleSamples_(CHSynthesisStyleInventory, v55, (uint64_t)v30, v56, v57, v58);
    id v59 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v59 = v28;
  }
  id v60 = v59;

  _Block_object_dispose(buf, 8);
  return v60;
}

- (id)styleSampleForInputSample:(id)a3 prompt:(id)a4 samplingAlgorithm:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v14 = objc_msgSend_maxStyleSampleLengthForPrompt_(CHSynthesisStyleInventory, v10, (uint64_t)v9, v11, v12, v13);
  uint64_t v16 = objc_msgSend_styleSampleForInputSample_prompt_samplingAlgorithm_maxStyleSampleLength_(self, v15, (uint64_t)v8, (uint64_t)v9, a5, v14);

  return v16;
}

- (id)styleSampleForInputSample:(id)a3 prompt:(id)a4 samplingAlgorithm:(unint64_t)a5 maxStyleSampleLength:(int64_t)a6
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v16 = objc_msgSend_characterCoverageWithString_(CHSynthesisStyleSample, v12, (uint64_t)v11, v13, v14, v15);
  uint64_t v22 = objc_msgSend_characterCoverage(self, v17, v18, v19, v20, v21);
  char v27 = objc_msgSend_intersectsSet_(v16, v23, (uint64_t)v22, v24, v25, v26);

  if (v27)
  {
    switch(a5)
    {
      case 2uLL:
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        uint64_t v46 = (id)qword_1EA3C9FD8;
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v90 = 0;
          _os_log_impl(&dword_1C492D000, v46, OS_LOG_TYPE_DEFAULT, "Style Sampling: Using highest short string heuristic algorithm for style sampling", v90, 2u);
        }

        uint64_t v52 = objc_msgSend_styles(self, v47, v48, v49, v50, v51);
        uint64_t v58 = objc_msgSend_allValues(v52, v53, v54, v55, v56, v57);
        uint64_t v34 = objc_msgSend_shortStringHeuristicStyleSampleForPrompt_styles_maxNumOfSamples_(self, v59, (uint64_t)v11, (uint64_t)v58, 1, v60);

        if (objc_msgSend_count(v34, v61, v62, v63, v64, v65))
        {
          uint64_t v44 = objc_msgSend_firstObject(v34, v66, v67, v68, v69, v70);
        }
        else
        {
          uint64_t v44 = 0;
        }
        goto LABEL_32;
      case 1uLL:
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        id v71 = (id)qword_1EA3C9FD8;
        if (!os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_30;
        }
        *(_WORD *)uint64_t v90 = 0;
        id v72 = "Style Sampling: Using style character coverage algorithm for style sampling";
        uint64_t v73 = v71;
        os_log_type_t v74 = OS_LOG_TYPE_DEFAULT;
        uint32_t v75 = 2;
        break;
      case 0uLL:
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        id v28 = (id)qword_1EA3C9FD8;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v90 = 0;
          _os_log_impl(&dword_1C492D000, v28, OS_LOG_TYPE_DEFAULT, "Style Sampling: Using highest character coverage algorithm for style sampling", v90, 2u);
        }

        uint64_t v34 = objc_msgSend_styles(self, v29, v30, v31, v32, v33);
        uint64_t v40 = objc_msgSend_allValues(v34, v35, v36, v37, v38, v39);
        uint64_t v44 = objc_msgSend_highestCharacterCoverageStyleSampleForPrompt_styles_(self, v41, (uint64_t)v11, (uint64_t)v40, v42, v43);

LABEL_32:
        uint64_t v83 = objc_msgSend_copy(v44, v84, v85, v86, v87, v88, *(_OWORD *)v90);
        goto LABEL_33;
      default:
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        id v71 = (id)qword_1EA3C9F90[0];
        if (!os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
        {
LABEL_30:

          uint64_t v44 = objc_msgSend_styleCharCoverageForInputSample_prompt_maxStyleSampleLength_(self, v76, (uint64_t)v10, (uint64_t)v11, a6, v77);
          uint64_t v83 = objc_msgSend_copy(v44, v78, v79, v80, v81, v82, *(_OWORD *)v90);
LABEL_33:
          uint64_t v45 = (void *)v83;
          goto LABEL_34;
        }
        *(_DWORD *)uint64_t v90 = 134217984;
        *(void *)&v90[4] = a5;
        id v72 = "Style Sampling: algorithm: %lu is not a supported sampling algorithm";
        uint64_t v73 = v71;
        os_log_type_t v74 = OS_LOG_TYPE_FAULT;
        uint32_t v75 = 12;
        break;
    }
    _os_log_impl(&dword_1C492D000, v73, v74, v72, v90, v75);
    goto LABEL_30;
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v44 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v90 = 0;
    _os_log_impl(&dword_1C492D000, v44, OS_LOG_TYPE_DEFAULT, "Style Sampling: No intersection of text prompt with the inventory, returning no style sample", v90, 2u);
  }
  uint64_t v45 = 0;
LABEL_34:

  return v45;
}

- (id)styleSamplesForInputSample:(id)a3 prompt:(id)a4 samplingAlgorithm:(unint64_t)a5 maxNumOfSamples:(unint64_t)a6
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v16 = objc_msgSend_characterCoverageWithString_(CHSynthesisStyleSample, v12, (uint64_t)v11, v13, v14, v15);
  uint64_t v22 = objc_msgSend_characterCoverage(self, v17, v18, v19, v20, v21);
  char v27 = objc_msgSend_intersectsSet_(v16, v23, (uint64_t)v22, v24, v25, v26);

  if (v27)
  {
    if (a5 == 2)
    {
      uint64_t v33 = objc_msgSend_styles(self, v28, v29, v30, v31, v32);
      uint64_t v39 = objc_msgSend_allValues(v33, v34, v35, v36, v37, v38);
      uint64_t v42 = objc_msgSend_shortStringHeuristicStyleSampleForPrompt_styles_maxNumOfSamples_(self, v40, (uint64_t)v11, (uint64_t)v39, a6, v41);

      id v43 = objc_alloc(MEMORY[0x1E4F1C978]);
      uint64_t v47 = objc_msgSend_initWithArray_copyItems_(v43, v44, (uint64_t)v42, 1, v45, v46);
    }
    else
    {
      if (a6 != 1)
      {
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        uint64_t v49 = (id)qword_1EA3C9F90[0];
        if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)uint64_t v56 = 0;
          _os_log_impl(&dword_1C492D000, v49, OS_LOG_TYPE_FAULT, "maxNumOfSamples > 1 supported for CHStyleSampleSamplingCharacterInventorySynthesisShortStringHeuristic only", v56, 2u);
        }
      }
      uint64_t v50 = objc_msgSend_styleSampleForInputSample_prompt_samplingAlgorithm_(self, v28, (uint64_t)v10, (uint64_t)v11, a5, v32);
      uint64_t v54 = (void *)v50;
      if (v50)
      {
        v57[0] = v50;
        uint64_t v47 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v51, (uint64_t)v57, 1, v52, v53);
      }
      else
      {
        uint64_t v47 = 0;
      }
    }
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v48 = (id)qword_1EA3C9FD8;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v56 = 0;
      _os_log_impl(&dword_1C492D000, v48, OS_LOG_TYPE_DEFAULT, "Style Sampling: Using highest short string heuristic algorithm for style sampling", v56, 2u);
    }
  }
  else
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v48 = (id)qword_1EA3C9FD8;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v56 = 0;
      _os_log_impl(&dword_1C492D000, v48, OS_LOG_TYPE_DEFAULT, "Style Sampling: No intersection of text prompt with the inventory, returning no style sample", v56, 2u);
    }
    uint64_t v47 = 0;
  }

  return v47;
}

- (id)styleSampleOptionsForRequest:(id)a3
{
  id v4 = a3;
  id v10 = objc_msgSend_options(v4, v5, v6, v7, v8, v9);
  uint64_t v16 = objc_msgSend_copy(v10, v11, v12, v13, v14, v15);

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1C4A17E34;
  v25[3] = &unk_1E64E2578;
  id v17 = v4;
  id v26 = v17;
  id v18 = v16;
  id v27 = v18;
  id v28 = self;
  uint64_t v29 = 1;
  objc_msgSend__safelyRunBlock_(self, v19, (uint64_t)v25, v20, v21, v22);
  id v23 = v18;

  return v23;
}

- (unint64_t)countOfStyleSamples
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C4A185A8;
  v7[3] = &unk_1E64E1168;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend__safelyRunBlock_(self, a2, (uint64_t)v7, v2, v3, v4);
  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CHSynthesisStyleInventory *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = 0;
      uint64_t v16 = &v15;
      uint64_t v17 = 0x2020000000;
      char v18 = 0;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = sub_1C4A1871C;
      v11[3] = &unk_1E64E12A8;
      uint64_t v12 = v4;
      uint64_t v13 = self;
      uint64_t v14 = &v15;
      objc_msgSend__safelyRunBlock_(self, v5, (uint64_t)v11, v6, v7, v8);
      BOOL v9 = *((unsigned char *)v16 + 24) != 0;

      _Block_object_dispose(&v15, 8);
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (void)clearSamplesEmbeddingVector
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = objc_msgSend_styles(self, a2, v2, v3, v4, v5, 0);
  uint64_t v12 = objc_msgSend_allValues(v6, v7, v8, v9, v10, v11);

  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v23, (uint64_t)v27, 16, v14);
  if (v20)
  {
    uint64_t v21 = *(void *)v24;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend_clearEmbeddingVector(*(void **)(*((void *)&v23 + 1) + 8 * v22++), v15, v16, v17, v18, v19);
      }
      while (v20 != v22);
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v23, (uint64_t)v27, 16, v19);
    }
    while (v20);
  }
}

- (void)updateSynthesisModelHash:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4A18B84;
  v10[3] = &unk_1E64E11E0;
  void v10[4] = self;
  id v11 = v4;
  id v5 = v4;
  objc_msgSend__safelyRunBlock_(self, v6, (uint64_t)v10, v7, v8, v9);
}

- (NSString)synthesisModelHash
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_1C4A0F984;
  uint64_t v12 = sub_1C4A0F994;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C4A18D0C;
  v7[3] = &unk_1E64E1168;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend__safelyRunBlock_(self, a2, (uint64_t)v7, v2, v3, v4);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

- (double)getLastCharacterStyleTimestamp
{
  uint64_t v8 = 0;
  uint64_t v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C4A18DE4;
  v7[3] = &unk_1E64E1168;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend__safelyRunBlock_(self, a2, (uint64_t)v7, v2, v3, v4);
  double v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)fastPathCharacterStylesWithVariations
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_1C4A0F984;
  uint64_t v14 = sub_1C4A0F994;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4A18F18;
  v9[3] = &unk_1E64E24D8;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend__safelyRunBlock_(self, v3, (uint64_t)v9, v4, v5, v6);
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (void)cleanupFastPathCharacters
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1C4A1916C;
  v5[3] = &unk_1E64E0D48;
  v5[4] = self;
  objc_msgSend__safelyRunBlock_(self, a2, (uint64_t)v5, v2, v3, v4);
}

- (void)addSampleOfSynthesizedCharacter:(id)a3 transcription:(id)a4 key:(unsigned int)a5
{
}

- (void)addSampleOfSynthesizedCharacter:(id)a3 transcription:(id)a4 key:(unsigned int)a5 version:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1C4A192A4;
  v18[3] = &unk_1E64E25C8;
  unsigned int v22 = a5;
  void v18[4] = self;
  id v19 = v11;
  id v20 = v10;
  int64_t v21 = a6;
  id v12 = v10;
  id v13 = v11;
  objc_msgSend__safelyRunBlock_(self, v14, (uint64_t)v18, v15, v16, v17);
}

- (void)removeStyleSamplesIfNeeded
{
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v3 = (id)qword_1EA3C9FC8;
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  if (qword_1EA3CA000 == -1)
  {
    uint64_t v5 = (id)qword_1EA3C9FC8;
    unint64_t v6 = v4 - 1;
    if (v4 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    uint64_t v5 = (id)qword_1EA3C9FC8;
    unint64_t v6 = v4 - 1;
    if (v4 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_7;
    }
  }
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CHStyleInventoryRemoveSamplesIfNeeded", "", buf, 2u);
  }
LABEL_7:

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  id v7 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v27 = 0;
    _os_log_impl(&dword_1C492D000, v7, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHStyleInventoryRemoveSamplesIfNeeded\"", v27, 2u);
  }

  uint64_t v13 = objc_msgSend__maxInventorySize(CHSynthesisStyleInventory, v8, v9, v10, v11, v12);
  uint64_t v19 = objc_msgSend__minimumSampleCountByCharacter(CHSynthesisStyleInventory, v14, v15, v16, v17, v18);
  objc_msgSend_removeStyleSamplesIfNeededWithMaximumSize_minimumSampleCountByCharacter_(self, v20, v13, v19, v21, v22);
  if (qword_1EA3CA000 == -1)
  {
    long long v23 = (id)qword_1EA3C9FC8;
    if (v6 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_15;
    }
  }
  else
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    long long v23 = (id)qword_1EA3C9FC8;
    if (v6 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_15;
    }
  }
  if (os_signpost_enabled(v23))
  {
    *(_WORD *)long long v26 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C492D000, v23, OS_SIGNPOST_INTERVAL_END, v4, "CHStyleInventoryRemoveSamplesIfNeeded", "", v26, 2u);
  }
LABEL_15:

  if (qword_1EA3CA000 != -1)
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    long long v24 = (id)qword_1EA3C9F90[0];
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  long long v24 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
LABEL_17:
    *(_WORD *)long long v25 = 0;
    _os_log_impl(&dword_1C492D000, v24, OS_LOG_TYPE_DEFAULT, "END \"CHStyleInventoryRemoveSamplesIfNeeded\"", v25, 2u);
  }
LABEL_18:
}

- (void)removeStyleSamplesIfNeededWithMaximumSize:(int64_t)a3 minimumSampleCountByCharacter:(int64_t)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1C4A197B4;
  v6[3] = &unk_1E64E1230;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  objc_msgSend__safelyRunBlock_(self, a2, (uint64_t)v6, a4, v4, v5);
}

- (BOOL)hasAllDigits
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C4A1A08C;
  v7[3] = &unk_1E64E1168;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend__safelyRunBlock_(self, a2, (uint64_t)v7, v2, v3, v4);
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)isPersonalizationAvailable
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  if (CHHasHandwritingGenerationAllowed((uint64_t)self, a2, v2, v3, v4, v5))
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1C4A1A290;
    v13[3] = &unk_1E64E24D8;
    v13[4] = self;
    v13[5] = &v14;
    objc_msgSend__safelyRunBlock_(self, v7, (uint64_t)v13, v8, v9, v10);
    BOOL v11 = *((unsigned char *)v15 + 24) != 0;
  }
  else
  {
    BOOL v11 = 0;
  }
  _Block_object_dispose(&v14, 8);
  return v11;
}

+ (BOOL)isPersonalizedSynthesisModelReady
{
  if (!CHHasHandwritingGenerationAllowed((uint64_t)a1, a2, v2, v3, v4, v5)) {
    return 0;
  }
  BOOL v11 = objc_msgSend_defaultURLOfModelInThisBundle(CHDiffusionModelE5ML, v6, v7, v8, v9, v10);
  BOOL v12 = v11 != 0;

  return v12;
}

+ (BOOL)isPersonalizedSynthesisModelInitializing
{
  uint64_t v2 = objc_alloc_init(CHModelCatalog);
  char v8 = objc_msgSend_assetDeliveryReady(v2, v3, v4, v5, v6, v7) ^ 1;

  return v8;
}

+ (id)personalizedSynthesisModelVersion
{
  uint64_t v2 = objc_alloc_init(CHModelCatalog);
  uint64_t v7 = objc_msgSend_getModelVersion_(v2, v3, 0, v4, v5, v6);

  return v7;
}

+ (id)statusWithInventory:(id)a3
{
  id v3 = a3;
  uint64_t isPersonalizationAvailable = objc_msgSend_isPersonalizationAvailable(v3, v4, v5, v6, v7, v8);
  if (objc_msgSend_isPersonalizedSynthesisModelReady(CHSynthesisStyleInventory, v10, v11, v12, v13, v14)) {
    uint64_t isPersonalizedSynthesisModelInitializing = 2;
  }
  else {
    uint64_t isPersonalizedSynthesisModelInitializing = objc_msgSend_isPersonalizedSynthesisModelInitializing(CHSynthesisStyleInventory, v15, v16, v17, v18, v19);
  }
  uint64_t v21 = [CHSynthesisStyleInventoryStatus alloc];
  id v27 = objc_msgSend_personalizedSynthesisModelVersion(CHSynthesisStyleInventory, v22, v23, v24, v25, v26);
  IsPersonalizationAvailable_personalizedSynthesisModelState_personalizedSynthesisModelVersion = objc_msgSend_initWithIsPersonalizationAvailable_personalizedSynthesisModelState_personalizedSynthesisModelVersion_(v21, v28, isPersonalizationAvailable, isPersonalizedSynthesisModelInitializing, (uint64_t)v27, v29);

  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v31 = [CHSynthesisStyleInventoryStatus alloc];
    uint64_t v70 = objc_msgSend_personalizedSynthesisModelVersion(CHSynthesisStyleInventory, v32, v33, v34, v35, v36);
    unsigned int hasAllDigits = objc_msgSend_hasAllDigits(v3, v37, v38, v39, v40, v41);
    uint64_t v47 = objc_msgSend_countOfStyleSamples(v3, v42, v43, v44, v45, v46);
    uint64_t v53 = objc_msgSend_characterCoverage(v3, v48, v49, v50, v51, v52);
    id v59 = objc_msgSend_inventoryStorageURL(v3, v54, v55, v56, v57, v58);
    uint64_t v65 = objc_msgSend_relativePath(CHSynthesisStyleInventory, v60, v61, v62, v63, v64);
    uint64_t hasAllDigits_styleSampleCount_samplesWithoutStylePredictionCount_characterCoverage_inventoryStorageURL_inventoryRelativePath = objc_msgSend_initWithIsPersonalizationAvailable_personalizedSynthesisModelState_personalizedSynthesisModelVersion_hasAllDigits_styleSampleCount_samplesWithoutStylePredictionCount_characterCoverage_inventoryStorageURL_inventoryRelativePath_(v31, v66, isPersonalizationAvailable, isPersonalizedSynthesisModelInitializing, (uint64_t)v70, hasAllDigits, v47, -1, v53, v59, v65);

    IsPersonalizationAvailable_personalizedSynthesisModelState_personalizedSynthesisModelVersion = (void *)hasAllDigits_styleSampleCount_samplesWithoutStylePredictionCount_characterCoverage_inventoryStorageURL_inventoryRelativePath;
  }

  return IsPersonalizationAvailable_personalizedSynthesisModelState_personalizedSynthesisModelVersion;
}

- (void)enumerateStyleSamplesUsingBlock:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4A1A878;
  v10[3] = &unk_1E64E26B0;
  void v10[4] = self;
  id v11 = v4;
  id v5 = v4;
  objc_msgSend__safelyRunBlock_(self, v6, (uint64_t)v10, v7, v8, v9);
}

- (void)_safelyRunBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  label = dispatch_queue_get_label(0);
  if (!strcmp(label, "com.apple.CoreHandwriting.CHSynthesisStyleInventoryQueue")
    || (objc_msgSend__workQueue(self, v6, v7, v8, v9, v10),
        id v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        !v11))
  {
    v4[2](v4);
  }
  else
  {
    uint64_t v17 = objc_msgSend__workQueue(self, v12, v13, v14, v15, v16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4A1AA60;
    block[3] = &unk_1E64E11B8;
    uint64_t v19 = v4;
    dispatch_sync(v17, block);
  }
}

- (void)setSynthesisModelHash:(id)a3
{
}

- (void)setLastSavedDate:(id)a3
{
}

- (NSMutableDictionary)styles
{
  return self->_styles;
}

- (void)setStyles:(id)a3
{
}

- (NSMutableDictionary)sampleCountByCharacter
{
  return self->_sampleCountByCharacter;
}

- (void)setSampleCountByCharacter:(id)a3
{
}

- (NSURL)inventoryStorageURL
{
  return self->_inventoryStorageURL;
}

- (BOOL)hasInventoryChanged
{
  return self->_hasInventoryChanged;
}

- (void)setHasInventoryChanged:(BOOL)a3
{
  self->_hasInventoryChanged = a3;
}

- (NSMutableDictionary)fastPathCharacterStyles
{
  return self->_fastPathCharacterStyles;
}

- (void)setFastPathCharacterStyles:(id)a3
{
}

- (int64_t)characterInventoryVersion
{
  return self->_characterInventoryVersion;
}

- (void)setCharacterInventoryVersion:(int64_t)a3
{
  self->_int64_t characterInventoryVersion = a3;
}

- (int64_t)currentSamplingTimestep
{
  return self->_currentSamplingTimestep;
}

- (void)setCurrentSamplingTimestep:(int64_t)a3
{
  self->_currentSamplingTimestep = a3;
}

- (double)characterStyleTimestamp
{
  return self->_characterStyleTimestamp;
}

- (OS_dispatch_queue)_workQueue
{
  return self->__workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__workQueue, 0);
  objc_storeStrong((id *)&self->_fastPathCharacterStyles, 0);
  objc_storeStrong((id *)&self->_inventoryStorageURL, 0);
  objc_storeStrong((id *)&self->_sampleCountByCharacter, 0);
  objc_storeStrong((id *)&self->_styles, 0);
  objc_storeStrong((id *)&self->_lastSavedDate, 0);
  objc_storeStrong((id *)&self->_synthesisModelHash, 0);
}

@end