@interface WDExportManager
+ (id)allSupportedMedicalTypes;
- (BOOL)_addSourceDirectory:(id)a3 asPath:(id)a4 archive:(id)a5 fileManager:(id)a6;
- (BOOL)_writeElectrocardiogramsToDisk:(id)a3 header:(id)a4 version:(id)a5;
- (BOOL)exportFailed;
- (BOOL)exportInProgress;
- (HKApplicationProviding)applicationProvider;
- (WDExportManager)initWithProfile:(id)a3;
- (id)_electrocardiogramHeaderWithName:(id)a3 dateOfBirth:(id)a4;
- (id)_formatBPMForBeatToBeatReading:(id)a3;
- (id)_formatTimeForBeatToBeatReading:(id)a3;
- (id)_preferredUnitForObjectType:(id)a3;
- (void)_archiveExportDirectory:(id)a3 toFile:(id)a4;
- (void)_completeAndCloseStreamingXML;
- (void)_exportElectrocardiogramsWithName:(id)a3 dateOfBirth:(id)a4;
- (void)_exportHealthRecords;
- (void)_getAllOrdinaryDataTypesOfCategory:(int64_t)a3 withArray:(id)a4;
- (void)_getAllOrdinaryDataTypesOfClass:(Class)a3 withArray:(id)a4;
- (void)_outputSerialQueue_beginWritingQuantityType:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (void)_outputSerialQueue_finishWritingQuantityType:(id)a3 count:(unint64_t)a4;
- (void)_outputSerialQueue_writeSamples:(id)a3 forQuantityType:(id)a4;
- (void)_queryForDateRanges;
- (void)_queryForSamplesOfType:(id)a3 batchHandler:(id)a4;
- (void)_writeActivitySummaries;
- (void)_writeAudiogramType;
- (void)_writeCDAEntryWithValue:(id)a3 type:(id)a4 sourceName:(id)a5 sourceVersion:(id)a6 device:(id)a7 unit:(id)a8 metadata:(id)a9 startDate:(id)a10 endDate:(id)a11;
- (void)_writeCDAHeaderWithName:(id)a3 birthData:(id)a4 biologicalSex:(int64_t)a5;
- (void)_writeCDAOrganizerEnd;
- (void)_writeCDAResultsHeader;
- (void)_writeCDAResultsOrganizerStart;
- (void)_writeCDASectionFooter;
- (void)_writeCDAVitalHeader;
- (void)_writeCDAVitalsOrganizerStartWithStartDate:(id)a3 endDate:(id)a4;
- (void)_writeCategoryType:(id)a3;
- (void)_writeContactsRx:(id)a3;
- (void)_writeContactsRxSphere:(id)a3 cylinder:(id)a4 axis:(id)a5 add:(id)a6 baseCurve:(id)a7 diameter:(id)a8;
- (void)_writeCorrelationType:(id)a3;
- (void)_writeDataForActivitySummaries;
- (void)_writeDataForAudiogramType;
- (void)_writeDataForCategoryType:(id)a3;
- (void)_writeDataForCorrelationType:(id)a3;
- (void)_writeDataForHRVAndTachograms;
- (void)_writeDataForMedicalRecords:(id)a3;
- (void)_writeDataForVisionRx;
- (void)_writeDataForWorkoutRoutes:(id)a3 semaphore:(id)a4;
- (void)_writeDataForWorkoutType;
- (void)_writeGlassesRx:(id)a3;
- (void)_writeGlassesRxSphere:(id)a3 cylinder:(id)a4 axis:(id)a5 add:(id)a6 vertex:(id)a7 prismAmount:(id)a8 prismAngle:(id)a9 farPD:(id)a10 nearPD:(id)a11;
- (void)_writeHRVAndTachograms;
- (void)_writeHealthRecord:(id)a3 documentDirectory:(id)a4 fileNamesInUse:(id)a5;
- (void)_writeMedicalRecords;
- (void)_writePrescriptionType;
- (void)_writeQuantityType:(id)a3;
- (void)_writeVisionRx:(id)a3;
- (void)_writeVisionRxDevice:(id)a3 metadata:(id)a4;
- (void)_writeVisionRxSphere:(id)a3 cylinder:(id)a4 axis:(id)a5 add:(id)a6;
- (void)_writeVisionRxType:(unint64_t)a3 dateIssued:(id)a4 expirationDate:(id)a5;
- (void)_writeWorkoutRouteForWorkout:(id)a3 semaphore:(id)a4;
- (void)_writeWorkoutType;
- (void)_writeXMLActivitySummary:(id)a3 activeEnergyBurnedUnit:(id)a4;
- (void)_writeXMLAudiogramEnd;
- (void)_writeXMLAudiogramSensitivityPoint:(id)a3;
- (void)_writeXMLAudiogramStartWithAudiogram:(id)a3;
- (void)_writeXMLCorrelationEnd;
- (void)_writeXMLCorrelationStartWithType:(id)a3 sourceName:(id)a4 sourceVersion:(id)a5 device:(id)a6 metadata:(id)a7 creationDate:(id)a8 startDate:(id)a9 endDate:(id)a10;
- (void)_writeXMLMedicalRecordWithType:(id)a3 identifier:(id)a4 sourceName:(id)a5 sourceURL:(id)a6 fhirVersion:(id)a7 receivedDate:(id)a8 jsonFilePath:(id)a9;
- (void)_writeXMLMetadataEntries:(id)a3;
- (void)_writeXMLObjectAttributes:(id)a3;
- (void)_writeXMLPersonWithDateOfBirth:(id)a3 biologicalSex:(int64_t)a4 bloodType:(int64_t)a5 skinType:(int64_t)a6 cardioFitnessMedicationsUse:(id)a7;
- (void)_writeXMLRecordWithType:(id)a3 sourceName:(id)a4 sourceVersion:(id)a5 device:(id)a6 unit:(id)a7 metadata:(id)a8 hrvMetadataList:(id)a9 creationDate:(id)a10 startDate:(id)a11 endDate:(id)a12 value:(id)a13;
- (void)_writeXMLSampleAttributes:(id)a3;
- (void)_writeXMLWorkoutActivity:(id)a3;
- (void)_writeXMLWorkoutEnd;
- (void)_writeXMLWorkoutEvent:(id)a3;
- (void)_writeXMLWorkoutRouteEnd;
- (void)_writeXMLWorkoutRouteFileReference:(id)a3;
- (void)_writeXMLWorkoutRouteStart:(id)a3;
- (void)_writeXMLWorkoutStartWithActivityType:(id)a3 duration:(id)a4 durationUnit:(id)a5 sourceName:(id)a6 sourceVersion:(id)a7 device:(id)a8 metadata:(id)a9 creationDate:(id)a10 startDate:(id)a11 endDate:(id)a12;
- (void)_writeXMLWorkoutStatistics:(id)a3;
- (void)cancelCurrentExport;
- (void)cleanupExportFilesWithError:(id)a3;
- (void)createExportFileWithCompletion:(id)a3;
- (void)setApplicationProvider:(id)a3;
- (void)setExportFailed:(BOOL)a3;
- (void)setExportInProgress:(BOOL)a3;
@end

@implementation WDExportManager

- (WDExportManager)initWithProfile:(id)a3
{
  id v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)WDExportManager;
  v6 = [(WDExportManager *)&v37 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    uint64_t v8 = HKCreateSerialDispatchQueue();
    outputSerialQueue = v7->_outputSerialQueue;
    v7->_outputSerialQueue = (OS_dispatch_queue *)v8;

    v10 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
    uint64_t v11 = [v10 firstObject];
    documentsPath = v7->_documentsPath;
    v7->_documentsPath = (NSString *)v11;

    v13 = v7->_documentsPath;
    v14 = WDBundle();
    v15 = [v14 localizedStringForKey:@"EXPORT_DATA_DIRECTORY" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
    uint64_t v16 = [(NSString *)v13 stringByAppendingPathComponent:v15];
    exportPath = v7->_exportPath;
    v7->_exportPath = (NSString *)v16;

    v18 = v7->_exportPath;
    v19 = WDBundle();
    v20 = [v19 localizedStringForKey:@"EXPORT_DATA_FILE_XML" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
    v21 = [v20 stringByAppendingString:@".xml"];
    uint64_t v22 = [(NSString *)v18 stringByAppendingPathComponent:v21];
    filePath = v7->_filePath;
    v7->_filePath = (NSString *)v22;

    v24 = v7->_exportPath;
    v25 = WDBundle();
    v26 = [v25 localizedStringForKey:@"EXPORT_DATA_FILE_CDA" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
    v27 = [v26 stringByAppendingString:@".xml"];
    uint64_t v28 = [(NSString *)v24 stringByAppendingPathComponent:v27];
    CDAFilePath = v7->_CDAFilePath;
    v7->_CDAFilePath = (NSString *)v28;

    v30 = v7->_documentsPath;
    v31 = WDBundle();
    v32 = [v31 localizedStringForKey:@"EXPORT_DATE_FILE_ZIP" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
    v33 = [v32 stringByAppendingString:@".zip"];
    uint64_t v34 = [(NSString *)v30 stringByAppendingPathComponent:v33];
    archivePath = v7->_archivePath;
    v7->_archivePath = (NSString *)v34;

    [(WDExportManager *)v7 setExportInProgress:0];
    [(WDExportManager *)v7 setExportFailed:0];
  }

  return v7;
}

- (void)cancelCurrentExport
{
  if ([(WDExportManager *)self exportInProgress])
  {
    [(WDExportManager *)self setExportFailed:1];
  }
}

- (void)cleanupExportFilesWithError:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F08850] defaultManager];
  if ([v5 fileExistsAtPath:self->_exportPath])
  {
    exportPath = self->_exportPath;
    id v11 = v4;
    [v5 removeItemAtPath:exportPath error:&v11];
    id v7 = v11;

    id v4 = v7;
  }
  if ([v5 fileExistsAtPath:self->_archivePath])
  {
    archivePath = self->_archivePath;
    id v10 = v4;
    [v5 removeItemAtPath:archivePath error:&v10];
    id v9 = v10;

    id v4 = v9;
  }
}

- (void)createExportFileWithCompletion:(id)a3
{
  id v4 = a3;
  if (![(WDExportManager *)self exportInProgress])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationProvider);
    v6 = [WeakRetained application];
    [v6 setIdleTimerDisabled:1];

    [(WDExportManager *)self setExportInProgress:1];
    id v7 = (void *)MEMORY[0x263EFFA18];
    uint64_t v8 = [MEMORY[0x263EFFA18] localTimeZone];
    id v9 = objc_msgSend(v7, "timeZoneForSecondsFromGMT:", objc_msgSend(v8, "secondsFromGMT"));

    id v10 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
    id v11 = (NSDateFormatter *)objc_opt_new();
    xmlDateFormatter = self->_xmlDateFormatter;
    self->_xmlDateFormatter = v11;

    [(NSDateFormatter *)self->_xmlDateFormatter setLocale:v10];
    [(NSDateFormatter *)self->_xmlDateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss ZZZ"];
    [(NSDateFormatter *)self->_xmlDateFormatter setTimeZone:v9];
    v13 = (NSDateFormatter *)objc_opt_new();
    cdaDateFormatter = self->_cdaDateFormatter;
    self->_cdaDateFormatter = v13;

    [(NSDateFormatter *)self->_cdaDateFormatter setLocale:v10];
    [(NSDateFormatter *)self->_cdaDateFormatter setDateFormat:@"yyyyMMddHHmmssZZZ"];
    [(NSDateFormatter *)self->_cdaDateFormatter setTimeZone:v9];
    id v15 = v4;
    HKDispatchAsyncOnGlobalConcurrentQueue();
  }
}

void __50__WDExportManager_createExportFileWithCompletion___block_invoke(uint64_t a1)
{
  v119[1] = *MEMORY[0x263EF8340];
  v84 = [MEMORY[0x263F08850] defaultManager];
  v1 = (id *)(a1 + 32);
  if ([v84 fileExistsAtPath:*(void *)(*(void *)(a1 + 32) + 80)])
  {
    uint64_t v2 = *((void *)*v1 + 10);
    id v114 = 0;
    [v84 removeItemAtPath:v2 error:&v114];
    id v3 = v114;
  }
  else
  {
    id v3 = 0;
  }
  uint64_t v4 = *((void *)*v1 + 10);
  uint64_t v5 = *MEMORY[0x263F08080];
  uint64_t v6 = *MEMORY[0x263F080A8];
  id v7 = [NSDictionary dictionaryWithObject:*MEMORY[0x263F08080] forKey:*MEMORY[0x263F080A8]];
  [v84 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:v7 error:0];

  uint64_t v8 = *((void *)*v1 + 11);
  id v9 = [NSDictionary dictionaryWithObject:v5 forKey:v6];
  [v84 createFileAtPath:v8 contents:0 attributes:v9];

  uint64_t v10 = *((void *)*v1 + 12);
  id v11 = [NSDictionary dictionaryWithObject:v5 forKey:v6];
  [v84 createFileAtPath:v10 contents:0 attributes:v11];

  uint64_t v12 = *((void *)*v1 + 13);
  v13 = [NSDictionary dictionaryWithObject:v5 forKey:v6];
  [v84 createFileAtPath:v12 contents:0 attributes:v13];

  int v14 = [v84 fileExistsAtPath:*((void *)*v1 + 11)];
  id v15 = (os_log_t *)MEMORY[0x263F09968];
  if (v14 && ([v84 fileExistsAtPath:*((void *)*v1 + 12)] & 1) != 0)
  {
    uint64_t v16 = v3;
  }
  else
  {
    _HKInitializeLogging();
    v17 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR)) {
      __50__WDExportManager_createExportFileWithCompletion___block_invoke_cold_6((uint64_t)v1, v17);
    }
    uint64_t v118 = *MEMORY[0x263F08320];
    v119[0] = @"Export file(s) could not be created.";
    v18 = [NSDictionary dictionaryWithObjects:v119 forKeys:&v118 count:1];
    uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:@"HealthExport" code:100 userInfo:v18];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
  v20 = (void *)*((void *)*v1 + 5);
  *((void *)*v1 + 5) = v19;

  [*v1 _queryForDateRanges];
  *((void *)*v1 + 3) = xmlNewTextWriterFilename((const char *)[*((id *)*v1 + 11) UTF8String], 0);
  xmlTextWriterSetIndent(*((xmlTextWriterPtr *)*v1 + 3), 1);
  xmlTextWriterSetIndentString(*((xmlTextWriterPtr *)*v1 + 3), (const xmlChar *)" ");
  xmlTextWriterStartDocument(*((xmlTextWriterPtr *)*v1 + 3), 0, "UTF-8", 0);
  xmlTextWriterWriteDTD(*((xmlTextWriterPtr *)*v1 + 3), (const xmlChar *)"HealthData", 0, 0, (const xmlChar *)aHealthkitExpor);
  xmlTextWriterStartElement(*((xmlTextWriterPtr *)*v1 + 3), (const xmlChar *)"HealthData");
  v21 = (xmlTextWriter *)*((void *)*v1 + 3);
  uint64_t v22 = [MEMORY[0x263EFF960] currentLocale];
  id v23 = [v22 localeIdentifier];
  xmlTextWriterWriteAttribute(v21, (const xmlChar *)"locale", (const xmlChar *)[v23 UTF8String]);

  *((void *)*v1 + 4) = xmlNewTextWriterFilename((const char *)[*((id *)*v1 + 12) UTF8String], 0);
  xmlTextWriterSetIndent(*((xmlTextWriterPtr *)*v1 + 4), 1);
  xmlTextWriterSetIndentString(*((xmlTextWriterPtr *)*v1 + 4), (const xmlChar *)" ");
  xmlTextWriterStartDocument(*((xmlTextWriterPtr *)*v1 + 4), 0, 0, 0);
  xmlTextWriterStartPI(*((xmlTextWriterPtr *)*v1 + 4), (const xmlChar *)"xml-stylesheet");
  xmlTextWriterWriteString(*((xmlTextWriterPtr *)*v1 + 4), (const xmlChar *)"type=\"text/xsl\"");
  xmlTextWriterWriteString(*((xmlTextWriterPtr *)*v1 + 4), (const xmlChar *)" ");
  xmlTextWriterWriteString(*((xmlTextWriterPtr *)*v1 + 4), (const xmlChar *)"href=\"CDA.xsl\"");
  xmlTextWriterEndPI(*((xmlTextWriterPtr *)*v1 + 4));
  xmlTextWriterStartElement(*((xmlTextWriterPtr *)*v1 + 4), (const xmlChar *)"ClinicalDocument");
  xmlTextWriterWriteAttributeNS(*((xmlTextWriterPtr *)*v1 + 4), (const xmlChar *)"xmlns", (const xmlChar *)"xsi", 0, (const xmlChar *)"http://www.w3.org/2001/XMLSchema-instance");
  xmlTextWriterWriteAttributeNS(*((xmlTextWriterPtr *)*v1 + 4), (const xmlChar *)"xsi", (const xmlChar *)"schemaLocation", 0, (const xmlChar *)"urn:hl7-org:v3 ../../../CDA%20R2/cda-schemas-and-samples/infrastructure/cda/CDA.xsd");
  xmlTextWriterWriteAttribute(*((xmlTextWriterPtr *)*v1 + 4), (const xmlChar *)"xmlns", (const xmlChar *)"urn:hl7-org:v3");
  xmlTextWriterWriteAttributeNS(*((xmlTextWriterPtr *)*v1 + 4), (const xmlChar *)"xmlns", (const xmlChar *)"cda", 0, (const xmlChar *)"urn:hl7-org:v3");
  xmlTextWriterWriteAttributeNS(*((xmlTextWriterPtr *)*v1 + 4), (const xmlChar *)"xmlns", (const xmlChar *)"sdtc", 0, (const xmlChar *)"urn:l7-org:sdtc");
  xmlTextWriterWriteAttributeNS(*((xmlTextWriterPtr *)*v1 + 4), (const xmlChar *)"xmlns", (const xmlChar *)"fhir", 0, (const xmlChar *)"http://hl7.org/fhir/v3");

  v24 = [*((id *)*v1 + 1) healthStore];
  id v113 = 0;
  v79 = [v24 dateOfBirthComponentsWithError:&v113];
  id v25 = v113;

  v26 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF3F8]];
  v27 = [v26 dateFromComponents:v79];

  if (!v27)
  {
    if (v25)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR)) {
        __50__WDExportManager_createExportFileWithCompletion___block_invoke_cold_5();
      }
    }
  }

  uint64_t v28 = [*((id *)*v1 + 1) healthStore];
  id v112 = 0;
  v29 = [v28 biologicalSexWithError:&v112];
  id v30 = v112;

  if (!v29)
  {
    if (v30)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR)) {
        __50__WDExportManager_createExportFileWithCompletion___block_invoke_cold_4();
      }
    }
  }

  v31 = [*((id *)*v1 + 1) healthStore];
  id v111 = 0;
  v82 = [v31 bloodTypeWithError:&v111];
  id v32 = v111;

  if (!v82)
  {
    if (v32)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR)) {
        __50__WDExportManager_createExportFileWithCompletion___block_invoke_cold_3();
      }
    }
  }

  v33 = [*((id *)*v1 + 1) healthStore];
  id v110 = 0;
  v81 = [v33 fitzpatrickSkinTypeWithError:&v110];
  id v34 = v110;

  if (!v81)
  {
    if (v34)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR)) {
        __50__WDExportManager_createExportFileWithCompletion___block_invoke_cold_2();
      }
    }
  }

  v35 = [*((id *)*v1 + 1) healthStore];
  id v109 = 0;
  v36 = [v35 _cardioFitnessMedicationsUseWithError:&v109];
  id v83 = v109;

  if (!v36)
  {
    if (v83)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR)) {
        __50__WDExportManager_createExportFileWithCompletion___block_invoke_cold_1();
      }
    }
  }
  id v37 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v36 takingCalciumChannelBlockers])
  {
    v38 = WDBundle();
    v39 = [v38 localizedStringForKey:@"CALCIUM_CHANNEL_USE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
    [v37 addObject:v39];
  }
  if ([v36 takingBetaBlockers])
  {
    v40 = WDBundle();
    v41 = [v40 localizedStringForKey:@"BETA_BLOCKERS" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
    [v37 addObject:v41];
  }
  if (([v36 medicationsAreSet] & 1) == 0)
  {
    v42 = WDBundle();
    v43 = [v42 localizedStringForKey:@"NONE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
    [v37 addObject:v43];
  }
  v78 = [v37 componentsJoinedByString:@", "];
  objc_msgSend(*v1, "_writeXMLPersonWithDateOfBirth:biologicalSex:bloodType:skinType:cardioFitnessMedicationsUse:", v27, objc_msgSend(v29, "biologicalSex"), objc_msgSend(v82, "bloodType"), objc_msgSend(v81, "skinType"), v78);
  uint64_t v103 = 0;
  v104 = &v103;
  uint64_t v105 = 0x3032000000;
  v106 = __Block_byref_object_copy_;
  v107 = __Block_byref_object_dispose_;
  id v108 = 0;
  id v44 = objc_alloc(MEMORY[0x263F0A4C8]);
  v45 = [*((id *)*v1 + 1) healthStore];
  v46 = (void *)[v44 initWithHealthStore:v45];

  v99[0] = MEMORY[0x263EF8330];
  v99[1] = 3221225472;
  v99[2] = __50__WDExportManager_createExportFileWithCompletion___block_invoke_355;
  v99[3] = &unk_26458E090;
  id v47 = *v1;
  v102 = &v103;
  v99[4] = v47;
  id v77 = v27;
  id v100 = v77;
  id v76 = v29;
  id v101 = v76;
  [v46 fetchMedicalIDDataWithCompletion:v99];
  dispatch_semaphore_wait(*((dispatch_semaphore_t *)*v1 + 5), 0xFFFFFFFFFFFFFFFFLL);
  id v48 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v49 = objc_alloc_init(MEMORY[0x263EFF980]);
  v50 = (void *)*((void *)*v1 + 6);
  *((void *)*v1 + 6) = v49;

  [*v1 _getAllOrdinaryDataTypesOfCategory:1 withArray:*((void *)*v1 + 6)];
  [v48 addObjectsFromArray:*((void *)*v1 + 6)];
  id v51 = objc_alloc_init(MEMORY[0x263EFF980]);
  v52 = (void *)*((void *)*v1 + 7);
  *((void *)*v1 + 7) = v51;

  [*v1 _getAllOrdinaryDataTypesOfCategory:0 withArray:*((void *)*v1 + 7)];
  [v48 addObjectsFromArray:*((void *)*v1 + 7)];
  [*v1 _getAllOrdinaryDataTypesOfCategory:2 withArray:v48];
  if (([*v1 exportFailed] & 1) == 0)
  {
    id v53 = v37;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    id v54 = v48;
    uint64_t v55 = [v54 countByEnumeratingWithState:&v95 objects:v117 count:16];
    if (v55)
    {
      uint64_t v56 = *(void *)v96;
LABEL_39:
      uint64_t v57 = 0;
      while (1)
      {
        if (*(void *)v96 != v56) {
          objc_enumerationMutation(v54);
        }
        [*v1 _writeQuantityType:*(void *)(*((void *)&v95 + 1) + 8 * v57)];
        if ([*v1 exportFailed]) {
          break;
        }
        if (v55 == ++v57)
        {
          uint64_t v55 = [v54 countByEnumeratingWithState:&v95 objects:v117 count:16];
          if (v55) {
            goto LABEL_39;
          }
          break;
        }
      }
    }

    id v37 = v53;
  }
  if (([*v1 exportFailed] & 1) == 0)
  {
    id v58 = objc_alloc_init(MEMORY[0x263EFF980]);
    [*v1 _getAllOrdinaryDataTypesOfClass:objc_opt_class() withArray:v58];
    id v59 = v37;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id v60 = v58;
    uint64_t v61 = [v60 countByEnumeratingWithState:&v91 objects:v116 count:16];
    if (v61)
    {
      uint64_t v62 = *(void *)v92;
LABEL_49:
      uint64_t v63 = 0;
      while (1)
      {
        if (*(void *)v92 != v62) {
          objc_enumerationMutation(v60);
        }
        [*v1 _writeCategoryType:*(void *)(*((void *)&v91 + 1) + 8 * v63)];
        dispatch_semaphore_wait(*((dispatch_semaphore_t *)*v1 + 5), 0xFFFFFFFFFFFFFFFFLL);
        if ([*v1 exportFailed]) {
          break;
        }
        if (v61 == ++v63)
        {
          uint64_t v61 = [v60 countByEnumeratingWithState:&v91 objects:v116 count:16];
          if (v61) {
            goto LABEL_49;
          }
          break;
        }
      }
    }

    id v37 = v59;
  }
  if (([*v1 exportFailed] & 1) == 0)
  {
    id v64 = objc_alloc_init(MEMORY[0x263EFF980]);
    [*v1 _getAllOrdinaryDataTypesOfClass:objc_opt_class() withArray:v64];
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v65 = v64;
    uint64_t v66 = [v65 countByEnumeratingWithState:&v87 objects:v115 count:16];
    if (v66)
    {
      uint64_t v67 = *(void *)v88;
LABEL_59:
      uint64_t v68 = 0;
      while (1)
      {
        if (*(void *)v88 != v67) {
          objc_enumerationMutation(v65);
        }
        [*v1 _writeCorrelationType:*(void *)(*((void *)&v87 + 1) + 8 * v68)];
        dispatch_semaphore_wait(*((dispatch_semaphore_t *)*v1 + 5), 0xFFFFFFFFFFFFFFFFLL);
        if ([*v1 exportFailed]) {
          break;
        }
        if (v66 == ++v68)
        {
          uint64_t v66 = [v65 countByEnumeratingWithState:&v87 objects:v115 count:16];
          if (v66) {
            goto LABEL_59;
          }
          break;
        }
      }
    }
  }
  if (([*v1 exportFailed] & 1) == 0)
  {
    [*v1 _writeAudiogramType];
    dispatch_semaphore_wait(*((dispatch_semaphore_t *)*v1 + 5), 0xFFFFFFFFFFFFFFFFLL);
  }
  if (([*v1 exportFailed] & 1) == 0)
  {
    [*v1 _writeWorkoutType];
    dispatch_semaphore_wait(*((dispatch_semaphore_t *)*v1 + 5), 0xFFFFFFFFFFFFFFFFLL);
  }
  if (([*v1 exportFailed] & 1) == 0)
  {
    [*v1 _writeActivitySummaries];
    dispatch_semaphore_wait(*((dispatch_semaphore_t *)*v1 + 5), 0xFFFFFFFFFFFFFFFFLL);
  }
  if (([*v1 exportFailed] & 1) == 0)
  {
    [*v1 _writeHRVAndTachograms];
    dispatch_semaphore_wait(*((dispatch_semaphore_t *)*v1 + 5), 0xFFFFFFFFFFFFFFFFLL);
  }
  if (([*v1 exportFailed] & 1) == 0)
  {
    [*v1 _writePrescriptionType];
    dispatch_semaphore_wait(*((dispatch_semaphore_t *)*v1 + 5), 0xFFFFFFFFFFFFFFFFLL);
  }
  if (([*v1 exportFailed] & 1) == 0)
  {
    [*v1 _writeMedicalRecords];
    dispatch_semaphore_wait(*((dispatch_semaphore_t *)*v1 + 5), 0xFFFFFFFFFFFFFFFFLL);
  }
  [*v1 _completeAndCloseStreamingXML];
  [*v1 _exportHealthRecords];
  [*v1 _exportElectrocardiogramsWithName:v104[5] dateOfBirth:v77];
  v69 = [MEMORY[0x263F08A48] mainQueue];
  v86[0] = MEMORY[0x263EF8330];
  v86[1] = 3221225472;
  v86[2] = __50__WDExportManager_createExportFileWithCompletion___block_invoke_3;
  v86[3] = &unk_26458DC98;
  v86[4] = *v1;
  [v69 addOperationWithBlock:v86];

  int v70 = [*v1 exportFailed];
  v71 = *v1;
  if (v70)
  {
    [v71 cleanupExportFilesWithError:v83];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    [v71 _archiveExportDirectory:v71[10] toFile:v71[13]];
    uint64_t v72 = *(void *)(a1 + 40);
    v73 = [NSURL fileURLWithPath:*(void *)(*(void *)(a1 + 32) + 104)];
    (*(void (**)(uint64_t, void *, id))(v72 + 16))(v72, v73, v83);
  }
  id v74 = *v1;
  v75 = *((void *)*v1 + 2);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__WDExportManager_createExportFileWithCompletion___block_invoke_4;
  block[3] = &unk_26458DC98;
  block[4] = v74;
  dispatch_async(v75, block);

  _Block_object_dispose(&v103, 8);
}

void __50__WDExportManager_createExportFileWithCompletion___block_invoke_355(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 name];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(NSObject **)(v7 + 16);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__WDExportManager_createExportFileWithCompletion___block_invoke_2;
  v10[3] = &unk_26458E068;
  v10[4] = v7;
  id v11 = v3;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v9 = v3;
  dispatch_async(v8, v10);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 40));
}

void __50__WDExportManager_createExportFileWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) name];
  objc_msgSend(v2, "_writeCDAHeaderWithName:birthData:biologicalSex:", v3, *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "biologicalSex"));
}

void __50__WDExportManager_createExportFileWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  v1 = [WeakRetained application];
  [v1 setIdleTimerDisabled:0];
}

uint64_t __50__WDExportManager_createExportFileWithCompletion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setExportInProgress:0];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 setExportFailed:0];
}

+ (id)allSupportedMedicalTypes
{
  if (allSupportedMedicalTypes_onceToken != -1) {
    dispatch_once(&allSupportedMedicalTypes_onceToken, &__block_literal_global_3);
  }
  uint64_t v2 = (void *)allSupportedMedicalTypes_sampleTypes;

  return v2;
}

uint64_t __43__WDExportManager_allSupportedMedicalTypes__block_invoke()
{
  allSupportedMedicalTypes_sampleTypes = [MEMORY[0x263F0A6E8] medicalRecordTypesWithOptions:3];

  return MEMORY[0x270F9A758]();
}

- (void)_queryForDateRanges
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = objc_alloc(MEMORY[0x263F0A9A8]);
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __38__WDExportManager__queryForDateRanges__block_invoke;
  id v12 = &unk_26458E0E0;
  id v13 = self;
  dispatch_semaphore_t v14 = v3;
  uint64_t v5 = v3;
  uint64_t v6 = (void *)[v4 initWithDateIntervalHandler:&v9];
  uint64_t v7 = [(WDProfile *)self->_profile healthStore];
  [v7 executeQuery:v6];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v8 = [(WDProfile *)self->_profile healthStore];
  [v8 stopQuery:v6];
}

void __38__WDExportManager__queryForDateRanges__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(id **)(a1 + 32);
  if (v7)
  {
    objc_storeStrong(v9 + 16, a3);
  }
  else
  {
    [v9 setExportFailed:1];
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      __38__WDExportManager__queryForDateRanges__block_invoke_cold_1();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_queryForSamplesOfType:(id)a3 batchHandler:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  id v39 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  do
  {
    _HKInitializeLogging();
    uint64_t v9 = *MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v35[5];
      *(_DWORD *)buf = 138543618;
      id v41 = v6;
      __int16 v42 = 2114;
      uint64_t v43 = v10;
      _os_log_impl(&dword_2210D2000, v9, OS_LOG_TYPE_DEFAULT, "Querying for %{public}@ starting with anchor: %{public}@", buf, 0x16u);
    }
    id v11 = objc_alloc(MEMORY[0x263F0A0C8]);
    uint64_t v12 = v35[5];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __55__WDExportManager__queryForSamplesOfType_batchHandler___block_invoke;
    v19[3] = &unk_26458E108;
    id v13 = v6;
    id v20 = v13;
    id v23 = &v30;
    v24 = &v26;
    id v25 = &v34;
    id v14 = v7;
    id v22 = v14;
    id v15 = v8;
    v21 = v15;
    uint64_t v16 = (void *)[v11 initWithType:v13 predicate:0 anchor:v12 limit:2000 resultsHandler:v19];
    v17 = [(WDProfile *)self->_profile healthStore];
    [v17 executeQuery:v16];

    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    v18 = [(WDProfile *)self->_profile healthStore];
    [v18 stopQuery:v16];
  }
  while (!*((unsigned char *)v31 + 24) && ![(WDExportManager *)self exportFailed]);
  if (*((unsigned char *)v27 + 24)) {
    [(WDExportManager *)self setExportFailed:1];
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
}

void __55__WDExportManager__queryForSamplesOfType_batchHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  _HKInitializeLogging();
  id v14 = (void *)*MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v14;
    int v17 = 134218242;
    uint64_t v18 = [v10 count];
    __int16 v19 = 2114;
    id v20 = v12;
    _os_log_impl(&dword_2210D2000, v15, OS_LOG_TYPE_DEFAULT, "Got %lld samples with anchor: %{public}@", (uint8_t *)&v17, 0x16u);
  }
  if (v13)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_ERROR)) {
      __55__WDExportManager__queryForSamplesOfType_batchHandler___block_invoke_cold_1();
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a5);
    if ([v10 count])
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_11;
    }
    if ([v11 count]) {
      goto LABEL_11;
    }
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
  }
  *(unsigned char *)(v16 + 24) = 1;
LABEL_11:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_writeQuantityType:(id)a3
{
  id v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __38__WDExportManager__writeQuantityType___block_invoke;
  v10[3] = &unk_26458E158;
  id v12 = &v16;
  id v13 = v15;
  v10[4] = self;
  id v14 = v20;
  id v5 = v4;
  id v11 = v5;
  [(WDExportManager *)self _queryForSamplesOfType:v5 batchHandler:v10];
  if (v17[3] && ![(WDExportManager *)self exportFailed])
  {
    outputSerialQueue = self->_outputSerialQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __38__WDExportManager__writeQuantityType___block_invoke_4;
    v7[3] = &unk_26458E180;
    v7[4] = self;
    id v8 = v5;
    uint64_t v9 = &v16;
    dispatch_async(outputSerialQueue, v7);
  }
  dispatch_sync((dispatch_queue_t)self->_outputSerialQueue, &__block_literal_global_371);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

void __38__WDExportManager__writeQuantityType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v3 count];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v3 count];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 16);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__WDExportManager__writeQuantityType___block_invoke_2;
  v7[3] = &unk_26458E130;
  uint64_t v10 = *(void *)(a1 + 64);
  v7[4] = v4;
  id v8 = *(id *)(a1 + 40);
  id v6 = v3;
  id v9 = v6;
  dispatch_async(v5, v7);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) >> 4 >= 0x271uLL)
  {
    dispatch_sync(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 16), &__block_literal_global_368);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

uint64_t __38__WDExportManager__writeQuantityType___block_invoke_2(void *a1)
{
  uint64_t v2 = *(void *)(a1[7] + 8);
  if (!*(unsigned char *)(v2 + 24))
  {
    *(unsigned char *)(v2 + 24) = 1;
    id v3 = [*(id *)(a1[4] + 128) objectForKeyedSubscript:a1[5]];
    uint64_t v4 = (void *)a1[4];
    uint64_t v5 = a1[5];
    id v6 = [v3 startDate];
    id v7 = [v3 endDate];
    objc_msgSend(v4, "_outputSerialQueue_beginWritingQuantityType:startDate:endDate:", v5, v6, v7);
  }
  uint64_t v9 = a1[5];
  uint64_t v8 = a1[6];
  uint64_t v10 = (void *)a1[4];

  return objc_msgSend(v10, "_outputSerialQueue_writeSamples:forQuantityType:", v8, v9);
}

uint64_t __38__WDExportManager__writeQuantityType___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_outputSerialQueue_finishWritingQuantityType:count:", *(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
}

- (void)_writeCategoryType:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F08B30]);
  id v6 = (void *)[v5 initWithKey:*MEMORY[0x263F09F80] ascending:1];
  id v7 = objc_alloc(MEMORY[0x263F0A6E0]);
  v18[0] = v6;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __38__WDExportManager__writeCategoryType___block_invoke;
  id v15 = &unk_26458E1A8;
  uint64_t v16 = self;
  id v17 = v4;
  id v9 = v4;
  uint64_t v10 = (void *)[v7 initWithSampleType:v9 predicate:0 limit:0 sortDescriptors:v8 resultsHandler:&v12];

  id v11 = [(WDProfile *)self->_profile healthStore];
  [v11 executeQuery:v10];
}

void __38__WDExportManager__writeCategoryType___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  if (v6 || !a4)
  {
    uint64_t v8 = v7[2];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38__WDExportManager__writeCategoryType___block_invoke_2;
    block[3] = &unk_26458DB80;
    block[4] = v7;
    id v10 = v6;
    id v11 = *(id *)(a1 + 40);
    dispatch_async(v8, block);
  }
  else
  {
    [v7 setExportFailed:1];
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 40));
  }
}

uint64_t __38__WDExportManager__writeCategoryType___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 _writeDataForCategoryType:v3];
}

- (void)_writeCorrelationType:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F0A270]);
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __41__WDExportManager__writeCorrelationType___block_invoke;
  uint64_t v12 = &unk_26458E1D0;
  uint64_t v13 = self;
  id v14 = v4;
  id v6 = v4;
  id v7 = (void *)[v5 initWithType:v6 predicate:0 samplePredicates:0 completion:&v9];
  uint64_t v8 = [(WDProfile *)self->_profile healthStore];
  [v8 executeQuery:v7];
}

void __41__WDExportManager__writeCorrelationType___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  if (v6 || !a4)
  {
    uint64_t v8 = v7[2];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__WDExportManager__writeCorrelationType___block_invoke_2;
    block[3] = &unk_26458DB80;
    block[4] = v7;
    id v10 = v6;
    id v11 = *(id *)(a1 + 40);
    dispatch_async(v8, block);
  }
  else
  {
    [v7 setExportFailed:1];
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 40));
  }
}

uint64_t __41__WDExportManager__writeCorrelationType___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 _writeDataForCorrelationType:v3];
}

- (void)_writeAudiogramType
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F08B30]);
  id v4 = (void *)[v3 initWithKey:*MEMORY[0x263F09F80] ascending:1];
  id v5 = objc_alloc(MEMORY[0x263F0A6E0]);
  id v6 = [MEMORY[0x263F0A598] audiogramSampleType];
  v11[0] = v4;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __38__WDExportManager__writeAudiogramType__block_invoke;
  v10[3] = &unk_26458DEE8;
  v10[4] = self;
  uint64_t v8 = (void *)[v5 initWithSampleType:v6 predicate:0 limit:0 sortDescriptors:v7 resultsHandler:v10];

  uint64_t v9 = [(WDProfile *)self->_profile healthStore];
  [v9 executeQuery:v8];
}

void __38__WDExportManager__writeAudiogramType__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  if (v6 || !a4)
  {
    uint64_t v8 = v7[2];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __38__WDExportManager__writeAudiogramType__block_invoke_2;
    v9[3] = &unk_26458DB58;
    v9[4] = v7;
    id v10 = v6;
    dispatch_async(v8, v9);
  }
  else
  {
    [v7 setExportFailed:1];
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 40));
  }
}

uint64_t __38__WDExportManager__writeAudiogramType__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _writeDataForAudiogramType];
}

- (void)_writeWorkoutType
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F08B30]);
  id v4 = (void *)[v3 initWithKey:*MEMORY[0x263F09F80] ascending:1];
  id v5 = objc_alloc(MEMORY[0x263F0A6E0]);
  id v6 = [MEMORY[0x263F0A598] workoutType];
  v11[0] = v4;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __36__WDExportManager__writeWorkoutType__block_invoke;
  v10[3] = &unk_26458DEE8;
  v10[4] = self;
  uint64_t v8 = (void *)[v5 initWithSampleType:v6 predicate:0 limit:0 sortDescriptors:v7 resultsHandler:v10];

  uint64_t v9 = [(WDProfile *)self->_profile healthStore];
  [v9 executeQuery:v8];
}

void __36__WDExportManager__writeWorkoutType__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  if (v6 || !a4)
  {
    uint64_t v8 = v7[2];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __36__WDExportManager__writeWorkoutType__block_invoke_2;
    v9[3] = &unk_26458DB58;
    v9[4] = v7;
    id v10 = v6;
    dispatch_async(v8, v9);
  }
  else
  {
    [v7 setExportFailed:1];
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 40));
  }
}

uint64_t __36__WDExportManager__writeWorkoutType__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _writeDataForWorkoutType];
}

- (void)_writeWorkoutRouteForWorkout:(id)a3 semaphore:(id)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = HKCreateSerialDispatchQueue();
  id v9 = objc_alloc(MEMORY[0x263F08B30]);
  id v10 = (void *)[v9 initWithKey:*MEMORY[0x263F09F80] ascending:1];
  id v11 = objc_alloc(MEMORY[0x263F0A6E0]);
  uint64_t v12 = [MEMORY[0x263F0A708] workoutRouteType];
  uint64_t v13 = [MEMORY[0x263F0A668] predicateForObjectsFromWorkout:v7];

  v22[0] = v10;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __58__WDExportManager__writeWorkoutRouteForWorkout_semaphore___block_invoke;
  v19[3] = &unk_26458E1F8;
  void v19[4] = self;
  id v20 = v6;
  id v21 = v8;
  id v15 = v8;
  id v16 = v6;
  id v17 = (void *)[v11 initWithSampleType:v12 predicate:v13 limit:0 sortDescriptors:v14 resultsHandler:v19];

  uint64_t v18 = [(WDProfile *)self->_profile healthStore];
  [v18 executeQuery:v17];
}

void __58__WDExportManager__writeWorkoutRouteForWorkout_semaphore___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  id v7 = v6;
  if (v6 || !a4)
  {
    uint64_t v8 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__WDExportManager__writeWorkoutRouteForWorkout_semaphore___block_invoke_2;
    block[3] = &unk_26458DB80;
    block[4] = *(void *)(a1 + 32);
    id v10 = v6;
    id v11 = *(id *)(a1 + 40);
    dispatch_async(v8, block);
  }
  else
  {
    [*(id *)(a1 + 32) setExportFailed:1];
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
}

uint64_t __58__WDExportManager__writeWorkoutRouteForWorkout_semaphore___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _writeDataForWorkoutRoutes:*(void *)(a1 + 40) semaphore:*(void *)(a1 + 48)];
}

- (void)_writeActivitySummaries
{
  id v3 = objc_alloc(MEMORY[0x263F0A098]);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__WDExportManager__writeActivitySummaries__block_invoke;
  v6[3] = &unk_26458E220;
  v6[4] = self;
  id v4 = (void *)[v3 initWithPredicate:0 resultsHandler:v6];
  id v5 = [(WDProfile *)self->_profile healthStore];
  [v5 executeQuery:v4];
}

void __42__WDExportManager__writeActivitySummaries__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  if (v6 || !a4)
  {
    uint64_t v8 = v7[2];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __42__WDExportManager__writeActivitySummaries__block_invoke_2;
    v9[3] = &unk_26458DB58;
    v9[4] = v7;
    id v10 = v6;
    dispatch_async(v8, v9);
  }
  else
  {
    [v7 setExportFailed:1];
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 40));
  }
}

uint64_t __42__WDExportManager__writeActivitySummaries__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _writeDataForActivitySummaries];
}

- (void)_writeHRVAndTachograms
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F08B30]);
  id v4 = (void *)[v3 initWithKey:*MEMORY[0x263F09F80] ascending:1];
  id v5 = objc_alloc(MEMORY[0x263F0A6E0]);
  id v6 = [MEMORY[0x263F0A658] dataTypeWithCode:139];
  v11[0] = v4;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __41__WDExportManager__writeHRVAndTachograms__block_invoke;
  v10[3] = &unk_26458DEE8;
  v10[4] = self;
  uint64_t v8 = (void *)[v5 initWithSampleType:v6 predicate:0 limit:0 sortDescriptors:v7 resultsHandler:v10];

  id v9 = [(WDProfile *)self->_profile healthStore];
  [v9 executeQuery:v8];
}

void __41__WDExportManager__writeHRVAndTachograms__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  if (v6 || !a4)
  {
    uint64_t v8 = v7[2];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __41__WDExportManager__writeHRVAndTachograms__block_invoke_2;
    v9[3] = &unk_26458DB58;
    v9[4] = v7;
    id v10 = v6;
    dispatch_async(v8, v9);
  }
  else
  {
    [v7 setExportFailed:1];
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 40));
  }
}

uint64_t __41__WDExportManager__writeHRVAndTachograms__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _writeDataForHRVAndTachograms];
}

- (void)_writePrescriptionType
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F08B30]);
  id v4 = (void *)[v3 initWithKey:*MEMORY[0x263F09F80] ascending:1];
  id v5 = objc_alloc(MEMORY[0x263F0A6E0]);
  id v6 = [MEMORY[0x263F0A600] visionPrescriptionType];
  v11[0] = v4;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __41__WDExportManager__writePrescriptionType__block_invoke;
  v10[3] = &unk_26458DEE8;
  v10[4] = self;
  uint64_t v8 = (void *)[v5 initWithSampleType:v6 predicate:0 limit:0 sortDescriptors:v7 resultsHandler:v10];

  id v9 = [(WDProfile *)self->_profile healthStore];
  [v9 executeQuery:v8];
}

void __41__WDExportManager__writePrescriptionType__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  if (v6 || !a4)
  {
    uint64_t v8 = v7[2];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __41__WDExportManager__writePrescriptionType__block_invoke_2;
    v9[3] = &unk_26458DB58;
    v9[4] = v7;
    id v10 = v6;
    dispatch_async(v8, v9);
  }
  else
  {
    [v7 setExportFailed:1];
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 40));
  }
}

uint64_t __41__WDExportManager__writePrescriptionType__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _writeDataForVisionRx];
}

- (void)_writeMedicalRecords
{
    a5,
    a6,
    a7,
    a8,
    0);
}

void __39__WDExportManager__writeMedicalRecords__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void **)(a1 + 32);
  if (v6 || !v7)
  {
    id v9 = v8[2];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__WDExportManager__writeMedicalRecords__block_invoke_385;
    block[3] = &unk_26458DB80;
    block[4] = v8;
    id v11 = v6;
    id v12 = *(id *)(a1 + 48);
    dispatch_async(v9, block);
  }
  else
  {
    [v8 setExportFailed:1];
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      __39__WDExportManager__writeMedicalRecords__block_invoke_cold_1();
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
}

intptr_t __39__WDExportManager__writeMedicalRecords__block_invoke_385(uint64_t a1)
{
  [*(id *)(a1 + 32) _writeDataForMedicalRecords:*(void *)(a1 + 40)];
  uint64_t v2 = *(NSObject **)(a1 + 48);

  return dispatch_semaphore_signal(v2);
}

- (void)_outputSerialQueue_beginWritingQuantityType:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(NSMutableArray *)self->_resultsTypes firstObject];

  if (v10 == v13) {
    [(WDExportManager *)self _writeCDAResultsHeader];
  }
  id v11 = [(NSMutableArray *)self->_vitalsTypes firstObject];

  id v12 = v13;
  if (v11 == v13)
  {
    [(WDExportManager *)self _writeCDAVitalHeader];
    id v12 = v13;
  }
  if (getCategoryOfType(v12))
  {
    if (getCategoryOfType(v13) == 1) {
      [(WDExportManager *)self _writeCDAResultsOrganizerStart];
    }
  }
  else
  {
    [(WDExportManager *)self _writeCDAVitalsOrganizerStartWithStartDate:v8 endDate:v9];
  }
}

- (void)_outputSerialQueue_writeSamples:(id)a3 forQuantityType:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v34 = self;
  id v41 = a4;
  v31 = -[WDExportManager _preferredUnitForObjectType:](self, "_preferredUnitForObjectType:");
  char v33 = [v31 description];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v6;
  uint64_t v32 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v32)
  {
    uint64_t v30 = *(void *)v44;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v44 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v40 = v7;
        id v8 = *(void **)(*((void *)&v43 + 1) + 8 * v7);
        id v9 = NSNumber;
        id v10 = [v8 quantity];
        [v10 doubleValueForUnit:v31];
        uint64_t v11 = objc_msgSend(v9, "numberWithDouble:");

        v35 = [v41 identifier];
        v38 = [v8 sourceRevision];
        id v37 = [v38 source];
        id v12 = [v37 name];
        uint64_t v36 = [v8 sourceRevision];
        id v13 = [v36 version];
        id v14 = [v8 device];
        id v15 = [v14 description];
        id v16 = [v8 metadata];
        id v17 = [v8 _creationDate];
        uint64_t v18 = [v8 startDate];
        uint64_t v19 = [v8 endDate];
        __int16 v42 = (void *)v11;
        [(WDExportManager *)v34 _writeXMLRecordWithType:v35 sourceName:v12 sourceVersion:v13 device:v15 unit:v33 metadata:v16 hrvMetadataList:0 creationDate:v17 startDate:v18 endDate:v19 value:v11];

        if (!getCategoryOfType(v41) || getCategoryOfType(v41) == 1)
        {
          id v39 = [v8 sourceRevision];
          id v20 = [v39 source];
          id v21 = [v20 name];
          id v22 = [v8 sourceRevision];
          id v23 = [v22 version];
          v24 = [v8 device];
          id v25 = [v24 description];
          uint64_t v26 = [v8 metadata];
          v27 = [v8 startDate];
          uint64_t v28 = [v8 endDate];
          [(WDExportManager *)v34 _writeCDAEntryWithValue:v42 type:v41 sourceName:v21 sourceVersion:v23 device:v25 unit:v33 metadata:v26 startDate:v27 endDate:v28];
        }
        uint64_t v7 = v40 + 1;
      }
      while (v32 != v40 + 1);
      uint64_t v32 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v32);
  }

  if ([(NSArray *)v34->_completedRecords count] && (!getCategoryOfType(v41) || getCategoryOfType(v41) == 1)) {
    [(WDExportManager *)v34 _writeCDAOrganizerEnd];
  }
}

- (void)_outputSerialQueue_finishWritingQuantityType:(id)a3 count:(unint64_t)a4
{
  id v10 = a3;
  unint64_t CategoryOfType = getCategoryOfType(v10);
  if (a4 && CategoryOfType <= 1) {
    [(WDExportManager *)self _writeCDAOrganizerEnd];
  }
  id v7 = [(NSMutableArray *)self->_resultsTypes lastObject];
  if (v7 == v10)
  {
  }
  else
  {
    id v8 = [(NSMutableArray *)self->_vitalsTypes lastObject];

    id v9 = v10;
    if (v8 != v10) {
      goto LABEL_9;
    }
  }
  [(WDExportManager *)self _writeCDASectionFooter];
  id v9 = v10;
LABEL_9:
}

- (void)_writeDataForCategoryType:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v17 = a3;
  uint64_t v18 = self;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = self->_completedRecords;
  uint64_t v19 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v19)
  {
    uint64_t v16 = *(void *)v27;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v26 + 1) + 8 * v4);
        id v25 = [v17 identifier];
        v24 = [v5 sourceRevision];
        id v23 = [v24 source];
        id v6 = [v23 name];
        id v22 = [v5 sourceRevision];
        id v7 = [v22 version];
        id v21 = [v5 device];
        id v20 = [v21 description];
        id v8 = [v5 metadata];
        id v9 = [v5 _creationDate];
        id v10 = [v5 startDate];
        uint64_t v11 = [v5 endDate];
        id v12 = [v5 sampleType];
        id v13 = stringForCategoryValue([v12 code], objc_msgSend(v5, "value"));
        [(WDExportManager *)v18 _writeXMLRecordWithType:v25 sourceName:v6 sourceVersion:v7 device:v20 unit:0 metadata:v8 hrvMetadataList:0 creationDate:v9 startDate:v10 endDate:v11 value:v13];

        ++v4;
      }
      while (v19 != v4);
      uint64_t v19 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v19);
  }

  completedRecords = v18->_completedRecords;
  v18->_completedRecords = 0;

  dispatch_semaphore_signal((dispatch_semaphore_t)v18->_sem);
}

- (void)_writeDataForCorrelationType:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = self->_completedRecords;
  uint64_t v33 = [(NSArray *)obj countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (v33)
  {
    uint64_t v32 = *(void *)v55;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v55 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = v3;
        uint64_t v4 = *(void **)(*((void *)&v54 + 1) + 8 * v3);
        uint64_t v48 = [v4 sampleType];
        id v5 = [v48 identifier];
        long long v46 = [v4 sourceRevision];
        long long v44 = [v46 source];
        id v6 = [v44 name];
        __int16 v42 = [v4 sourceRevision];
        id v7 = [v42 version];
        id v8 = [v4 device];
        id v9 = [v8 description];
        id v10 = [v4 metadata];
        uint64_t v11 = [v4 _creationDate];
        id v12 = [v4 startDate];
        id v13 = [v4 endDate];
        [(WDExportManager *)self _writeXMLCorrelationStartWithType:v5 sourceName:v6 sourceVersion:v7 device:v9 metadata:v10 creationDate:v11 startDate:v12 endDate:v13];

        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v35 = [v4 objects];
        uint64_t v37 = [v35 countByEnumeratingWithState:&v50 objects:v58 count:16];
        if (v37)
        {
          uint64_t v36 = *(void *)v51;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v51 != v36) {
                objc_enumerationMutation(v35);
              }
              id v15 = *(void **)(*((void *)&v50 + 1) + 8 * v14);
              objc_opt_class();
              uint64_t v47 = v14;
              if (objc_opt_isKindOfClass())
              {
                uint64_t v16 = [v15 sampleType];
                id v17 = [(WDExportManager *)self _preferredUnitForObjectType:v16];

                uint64_t v18 = NSNumber;
                uint64_t v19 = [v15 quantity];
                [v19 doubleValueForUnit:v17];
                id v49 = objc_msgSend(v18, "numberWithDouble:");
LABEL_15:

                goto LABEL_17;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v19 = [v15 sampleType];
                id v49 = stringForCategoryValue([v19 code], objc_msgSend(v15, "value"));
                id v17 = 0;
                goto LABEL_15;
              }
              id v49 = 0;
              id v17 = 0;
LABEL_17:
              id v39 = v17;
              long long v45 = [v15 sampleType];
              id v20 = [v45 identifier];
              long long v43 = [v15 sourceRevision];
              id v41 = [v43 source];
              id v21 = [v41 name];
              uint64_t v40 = [v15 sourceRevision];
              id v22 = [v40 version];
              id v23 = [v15 device];
              v24 = [v23 description];
              id v25 = [v17 description];
              long long v26 = [v15 metadata];
              long long v27 = [v15 _creationDate];
              long long v28 = [v15 startDate];
              long long v29 = [v15 endDate];
              [(WDExportManager *)self _writeXMLRecordWithType:v20 sourceName:v21 sourceVersion:v22 device:v24 unit:v25 metadata:v26 hrvMetadataList:0 creationDate:v27 startDate:v28 endDate:v29 value:v49];

              uint64_t v14 = v47 + 1;
            }
            while (v37 != v47 + 1);
            uint64_t v37 = [v35 countByEnumeratingWithState:&v50 objects:v58 count:16];
          }
          while (v37);
        }

        [(WDExportManager *)self _writeXMLCorrelationEnd];
        uint64_t v3 = v34 + 1;
      }
      while (v34 + 1 != v33);
      uint64_t v33 = [(NSArray *)obj countByEnumeratingWithState:&v54 objects:v59 count:16];
    }
    while (v33);
  }

  completedRecords = self->_completedRecords;
  self->_completedRecords = 0;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sem);
}

- (void)_writeDataForAudiogramType
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = self->_completedRecords;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v17 = *(void *)v23;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v22 + 1) + 8 * v5);
        id v7 = (void *)MEMORY[0x223C79660]();
        [(WDExportManager *)self _writeXMLAudiogramStartWithAudiogram:v6];
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v8 = [v6 sensitivityPoints];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v19;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v19 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * v12);
              uint64_t v14 = (void *)MEMORY[0x223C79660]();
              [(WDExportManager *)self _writeXMLAudiogramSensitivityPoint:v13];
              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v10);
        }

        [(WDExportManager *)self _writeXMLAudiogramEnd];
        ++v5;
      }
      while (v5 != v4);
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v4);
  }

  completedRecords = self->_completedRecords;
  self->_completedRecords = 0;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sem);
}

- (void)_writeDataForWorkoutType
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = self->_completedRecords;
  uint64_t v43 = [(NSArray *)obj countByEnumeratingWithState:&v65 objects:v72 count:16];
  if (v43)
  {
    uint64_t v42 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v43; uint64_t i = v26 + 1)
      {
        if (*(void *)v66 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v49 = i;
        uint64_t v4 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        [v4 workoutActivityType];
        long long v52 = _HKWorkoutActivityNameForActivityType();
        uint64_t v5 = NSNumber;
        [v4 duration];
        long long v51 = [v5 numberWithDouble:v6 / 60.0];
        uint64_t v48 = [MEMORY[0x263F0A830] minuteUnit];
        long long v50 = [v48 description];
        uint64_t v47 = [v4 sourceRevision];
        long long v46 = [v47 source];
        id v7 = [v46 name];
        long long v45 = [v4 sourceRevision];
        id v8 = [v45 version];
        long long v44 = [v4 device];
        uint64_t v9 = [v44 description];
        uint64_t v10 = [v4 metadata];
        uint64_t v11 = [v4 _creationDate];
        uint64_t v12 = [v4 startDate];
        uint64_t v13 = [v4 endDate];
        [(WDExportManager *)self _writeXMLWorkoutStartWithActivityType:v52 duration:v51 durationUnit:v50 sourceName:v7 sourceVersion:v8 device:v9 metadata:v10 creationDate:v11 startDate:v12 endDate:v13];

        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        uint64_t v14 = [v4 workoutEvents];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v61 objects:v71 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v62;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v62 != v17) {
                objc_enumerationMutation(v14);
              }
              [(WDExportManager *)self _writeXMLWorkoutEvent:*(void *)(*((void *)&v61 + 1) + 8 * j)];
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v61 objects:v71 count:16];
          }
          while (v16);
        }

        long long v19 = [v4 workoutActivities];
        if ((unint64_t)[v19 count] >= 2)
        {

          uint64_t v26 = v49;
LABEL_18:
          long long v59 = 0u;
          long long v60 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          long long v19 = [v4 workoutActivities];
          uint64_t v27 = [v19 countByEnumeratingWithState:&v57 objects:v70 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v58;
            do
            {
              for (uint64_t k = 0; k != v28; ++k)
              {
                if (*(void *)v58 != v29) {
                  objc_enumerationMutation(v19);
                }
                [(WDExportManager *)self _writeXMLWorkoutActivity:*(void *)(*((void *)&v57 + 1) + 8 * k)];
              }
              uint64_t v28 = [v19 countByEnumeratingWithState:&v57 objects:v70 count:16];
            }
            while (v28);
          }
LABEL_27:

          goto LABEL_28;
        }
        long long v20 = [v4 workoutActivities];
        if ([v20 count] != 1)
        {

          uint64_t v26 = v49;
          goto LABEL_27;
        }
        long long v21 = [v4 workoutActivities];
        long long v22 = [v21 objectAtIndexedSubscript:0];
        long long v23 = [v22 UUID];
        long long v24 = [v4 UUID];
        char v25 = [v23 isEqual:v24];

        uint64_t v26 = v49;
        if ((v25 & 1) == 0) {
          goto LABEL_18;
        }
LABEL_28:
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        uint64_t v31 = [v4 allStatistics];
        uint64_t v32 = [v31 allValues];

        uint64_t v33 = [v32 countByEnumeratingWithState:&v53 objects:v69 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v54;
          do
          {
            for (uint64_t m = 0; m != v34; ++m)
            {
              if (*(void *)v54 != v35) {
                objc_enumerationMutation(v32);
              }
              uint64_t v37 = *(void *)(*((void *)&v53 + 1) + 8 * m);
              xmlTextWriterStartElement(self->_writer, (const xmlChar *)"WorkoutStatistics");
              [(WDExportManager *)self _writeXMLWorkoutStatistics:v37];
              xmlTextWriterEndElement(self->_writer);
            }
            uint64_t v34 = [v32 countByEnumeratingWithState:&v53 objects:v69 count:16];
          }
          while (v34);
        }

        v38 = dispatch_semaphore_create(0);
        [(WDExportManager *)self _writeWorkoutRouteForWorkout:v4 semaphore:v38];
        dispatch_semaphore_wait(v38, 0xFFFFFFFFFFFFFFFFLL);
        id v39 = [v4 metadata];
        [(WDExportManager *)self _writeXMLMetadataEntries:v39];

        [(WDExportManager *)self _writeXMLWorkoutEnd];
      }
      uint64_t v43 = [(NSArray *)obj countByEnumeratingWithState:&v65 objects:v72 count:16];
    }
    while (v43);
  }

  completedRecords = self->_completedRecords;
  self->_completedRecords = 0;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sem);
}

- (void)_writeDataForWorkoutRoutes:(id)a3 semaphore:(id)a4
{
  v52[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v51 = *MEMORY[0x263F080A8];
  v52[0] = *MEMORY[0x263F08088];
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v52 forKeys:&v51 count:1];
  v38 = self;
  [(NSString *)self->_exportPath stringByAppendingPathComponent:@"workout-routes"];
  v35 = uint64_t v47 = 0;
  LODWORD(a4) = objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
  id v10 = 0;
  uint64_t v11 = v10;
  if (a4)
  {
    id v29 = v10;
    uint64_t v30 = v9;
    uint64_t v31 = v7;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v32 = v6;
    id obj = v6;
    uint64_t v36 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
    if (v36)
    {
      uint64_t v34 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v44 != v34) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          [(WDExportManager *)v38 _writeXMLWorkoutRouteStart:v13];
          uint64_t v37 = [MEMORY[0x263F0A3E0] fileNameForRoute:v13];
          uint64_t v14 = objc_msgSend(v35, "stringByAppendingPathComponent:");
          uint64_t v15 = [NSURL fileURLWithPath:v14];
          uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F0A3E0]) initWithURL:v15 route:v13];
          uint64_t v17 = WDBundle();
          long long v18 = [v17 localizedStringForKey:@"EXPORT_DATA_DIRECTORY" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
          long long v19 = [v14 componentsSeparatedByString:v18];
          long long v20 = [v19 lastObject];

          [(WDExportManager *)v38 _writeXMLWorkoutRouteFileReference:v20];
          dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
          id v22 = objc_alloc(MEMORY[0x263F0A938]);
          v40[0] = MEMORY[0x263EF8330];
          v40[1] = 3221225472;
          v40[2] = __56__WDExportManager__writeDataForWorkoutRoutes_semaphore___block_invoke;
          v40[3] = &unk_26458E248;
          id v23 = v16;
          id v41 = v23;
          long long v24 = v21;
          uint64_t v42 = v24;
          char v25 = (void *)[v22 initWithRoute:v13 dataHandler:v40];
          uint64_t v26 = [(WDProfile *)v38->_profile healthStore];
          [v26 executeQuery:v25];

          dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
          id v39 = 0;
          LOBYTE(v22) = [v23 finishWithError:&v39];
          id v27 = v39;
          if ((v22 & 1) == 0)
          {
            _HKInitializeLogging();
            uint64_t v28 = *MEMORY[0x263F098F8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v49 = v27;
              _os_log_error_impl(&dword_2210D2000, v28, OS_LOG_TYPE_ERROR, "Error exporting workout route to GPX: %{public}@", buf, 0xCu);
            }
          }
          [(WDExportManager *)v38 _writeXMLWorkoutRouteEnd];
        }
        uint64_t v36 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
      }
      while (v36);
    }

    id v7 = v31;
    id v6 = v32;
    uint64_t v9 = v30;
    uint64_t v11 = v29;
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_ERROR)) {
      -[WDExportManager _writeDataForWorkoutRoutes:semaphore:]();
    }
  }
  dispatch_semaphore_signal(v7);
}

intptr_t __56__WDExportManager__writeDataForWorkoutRoutes_semaphore___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  intptr_t result = [*(id *)(a1 + 32) appendLocations:a3 error:0];
  if (a5 || (a4 & 1) != 0 || !result)
  {
    uint64_t v9 = *(NSObject **)(a1 + 40);
    return dispatch_semaphore_signal(v9);
  }
  return result;
}

- (void)_writeDataForActivitySummaries
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F0A598] quantityTypeForIdentifier:*MEMORY[0x263F09BC0]];
  uint64_t v4 = [(WDExportManager *)self _preferredUnitForObjectType:v3];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_completedRecords;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[WDExportManager _writeXMLActivitySummary:activeEnergyBurnedUnit:](self, "_writeXMLActivitySummary:activeEnergyBurnedUnit:", *(void *)(*((void *)&v11 + 1) + 8 * v9++), v4, (void)v11);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  completedRecords = self->_completedRecords;
  self->_completedRecords = 0;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sem);
}

- (void)_writeDataForHRVAndTachograms
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v15 = [MEMORY[0x263F0A658] dataTypeWithCode:139];
  uint64_t v3 = -[WDExportManager _preferredUnitForObjectType:](self, "_preferredUnitForObjectType:");
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = self->_completedRecords;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v21 + 1) + 8 * v7);
        dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
        id v10 = (void *)MEMORY[0x263F0A440];
        long long v11 = [(WDProfile *)self->_profile healthStore];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __48__WDExportManager__writeDataForHRVAndTachograms__block_invoke;
        v16[3] = &unk_26458E270;
        v16[4] = self;
        id v17 = v15;
        uint64_t v18 = v8;
        id v19 = v3;
        dispatch_semaphore_t v20 = v9;
        long long v12 = v9;
        [v10 queryForParentSequenceOfHRV:v8 healthStore:v11 completion:v16];

        dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }

  completedRecords = self->_completedRecords;
  self->_completedRecords = 0;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sem);
}

void __48__WDExportManager__writeDataForHRVAndTachograms__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    dispatch_semaphore_t v20 = [MEMORY[0x263F0A440] instantaneousBPMsForHeartbeatSeriesSample:a2];
  }
  else
  {
    dispatch_semaphore_t v20 = 0;
  }
  uint64_t v3 = *(void **)(a1 + 32);
  id v19 = [*(id *)(a1 + 40) identifier];
  uint64_t v18 = [*(id *)(a1 + 48) sourceRevision];
  id v17 = [v18 source];
  uint64_t v4 = [v17 name];
  uint64_t v16 = [*(id *)(a1 + 48) sourceRevision];
  uint64_t v5 = [v16 version];
  uint64_t v15 = [*(id *)(a1 + 48) device];
  long long v14 = [v15 description];
  long long v13 = [*(id *)(a1 + 56) description];
  uint64_t v6 = [*(id *)(a1 + 48) metadata];
  long long v12 = [*(id *)(a1 + 48) _creationDate];
  uint64_t v7 = [*(id *)(a1 + 48) startDate];
  uint64_t v8 = [*(id *)(a1 + 48) endDate];
  dispatch_semaphore_t v9 = NSNumber;
  id v10 = [*(id *)(a1 + 48) quantity];
  [v10 doubleValueForUnit:*(void *)(a1 + 56)];
  long long v11 = objc_msgSend(v9, "numberWithDouble:");
  [v3 _writeXMLRecordWithType:v19 sourceName:v4 sourceVersion:v5 device:v14 unit:v13 metadata:v6 hrvMetadataList:v20 creationDate:v12 startDate:v7 endDate:v8 value:v11];

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

- (void)_writeDataForVisionRx
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2210D2000, v0, v1, "Unable to create attachment directory: %{public}@", v2, v3, v4, v5, v6);
}

void __40__WDExportManager__writeDataForVisionRx__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (v6 || !a3) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  else {
    [*(id *)(a1 + 32) setExportFailed:1];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __40__WDExportManager__writeDataForVisionRx__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (!v6 && v5 || ([v6 writeToFile:*(void *)(a1 + 40) atomically:1] & 1) == 0) {
    [*(id *)(a1 + 32) setExportFailed:1];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)_writeDataForMedicalRecords:(id)a3
{
  v46[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F08850] defaultManager];
  exportPath = self->_exportPath;
  uint64_t v7 = WDBundle();
  uint64_t v8 = [v7 localizedStringForKey:@"EXPORT_DATA_CR_DIRECTORY" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  dispatch_semaphore_t v9 = [(NSString *)exportPath stringByAppendingPathComponent:v8];

  uint64_t v45 = *MEMORY[0x263F080A8];
  v46[0] = *MEMORY[0x263F08080];
  id v10 = [NSDictionary dictionaryWithObjects:v46 forKeys:&v45 count:1];
  id v43 = 0;
  char v11 = [v5 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:v10 error:&v43];
  id v12 = v43;
  long long v13 = v12;
  if (v11)
  {
    id v31 = v12;
    id v32 = v5;
    id v33 = v4;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = v4;
    uint64_t v14 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v40;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v40 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          if ([(WDExportManager *)self exportFailed])
          {
            _HKInitializeLogging();
            long long v23 = *MEMORY[0x263F09968];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
              -[WDExportManager _writeDataForMedicalRecords:](v23, v24, v25, v26, v27, v28, v29, v30);
            }
            goto LABEL_16;
          }
          dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
          v35[0] = MEMORY[0x263EF8330];
          v35[1] = 3221225472;
          v35[2] = __47__WDExportManager__writeDataForMedicalRecords___block_invoke;
          v35[3] = &unk_26458E2E8;
          v35[4] = self;
          dispatch_semaphore_t v36 = v19;
          uint64_t v37 = v18;
          id v38 = v9;
          dispatch_semaphore_t v20 = v19;
          long long v21 = (void *)MEMORY[0x223C798A0](v35);
          long long v22 = [(WDProfile *)self->_profile healthRecordsStore];
          [v22 fetchExportedPropertiesForHealthRecord:v18 completion:v21];

          dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
LABEL_16:

    id v5 = v32;
    id v4 = v33;
    long long v13 = v31;
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_ERROR)) {
      -[WDExportManager _writeDataForMedicalRecords:]();
    }
    [(WDExportManager *)self setExportFailed:1];
  }
}

void __47__WDExportManager__writeDataForMedicalRecords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    uint64_t v8 = [*(id *)(a1 + 48) sourceRevision];
    dispatch_semaphore_t v9 = [v8 source];
    id v38 = [v9 name];

    id v10 = [*(id *)(a1 + 48) UUID];
    long long v39 = [v10 UUIDString];

    char v11 = [v5 objectForKeyedSubscript:*MEMORY[0x263F099C0]];
    objc_opt_class();
    id v12 = HKSafeObject();
    id v13 = 0;

    if (v13)
    {
      uint64_t v14 = 0;
    }
    else
    {
      uint64_t v15 = [v5 objectForKeyedSubscript:*MEMORY[0x263F099B8]];
      objc_opt_class();
      uint64_t v14 = HKSafeObject();
      id v13 = 0;

      if (!v13)
      {
        uint64_t v28 = [v5 objectForKeyedSubscript:*MEMORY[0x263F099C8]];
        objc_opt_class();
        uint64_t v16 = HKSafeObject();
        id v13 = 0;

        if (!v13)
        {
          uint64_t v29 = [v5 objectForKeyedSubscript:*MEMORY[0x263F099B0]];
          objc_opt_class();
          id v17 = HKSafeObject();
          id v13 = 0;

          if (!v13)
          {
            uint64_t v30 = [v5 objectForKeyedSubscript:*MEMORY[0x263F099A0]];
            objc_opt_class();
            uint64_t v18 = HKSafeObject();
            id v13 = 0;

            if (!v13)
            {
              dispatch_semaphore_t v36 = [v5 objectForKeyedSubscript:*MEMORY[0x263F099A8]];
              objc_opt_class();
              dispatch_semaphore_t v19 = HKSafeObject();
              id v13 = 0;

              if (!v13)
              {
                id v13 = [NSString stringWithFormat:@"%@-%@.json", v12, v39];
                uint64_t v37 = [*(id *)(a1 + 56) stringByAppendingPathComponent:v13];
                objc_msgSend(v19, "writeToFile:atomically:encoding:error:");
                id v7 = 0;
                if (v7)
                {
                  _HKInitializeLogging();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
                    __47__WDExportManager__writeDataForMedicalRecords___block_invoke_cold_1();
                  }
                  [*(id *)(a1 + 32) setExportFailed:1];
                  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
                }
                else
                {
                  uint64_t v35 = [*(id *)(*(void *)(a1 + 32) + 112) stringFromDate:v17];
                  id v33 = WDBundle();
                  id v32 = [v33 localizedStringForKey:@"EXPORT_DATA_DIRECTORY" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
                  id v31 = [v37 componentsSeparatedByString:v32];
                  uint64_t v34 = [v31 lastObject];

                  [*(id *)(a1 + 32) _writeXMLMedicalRecordWithType:v12 identifier:v14 sourceName:v38 sourceURL:v16 fhirVersion:v18 receivedDate:v35 jsonFilePath:v34];
                  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
                }
                goto LABEL_15;
              }
LABEL_12:
              _HKInitializeLogging();
              dispatch_semaphore_t v20 = *MEMORY[0x263F09968];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
                __47__WDExportManager__writeDataForMedicalRecords___block_invoke_cold_2(v20, v21, v22, v23, v24, v25, v26, v27);
              }
              [*(id *)(a1 + 32) setExportFailed:1];
              dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
              id v7 = 0;
LABEL_15:

              goto LABEL_16;
            }
LABEL_11:
            dispatch_semaphore_t v19 = 0;
            goto LABEL_12;
          }
LABEL_10:
          uint64_t v18 = 0;
          goto LABEL_11;
        }
LABEL_9:
        id v17 = 0;
        goto LABEL_10;
      }
    }
    uint64_t v16 = 0;
    goto LABEL_9;
  }
  id v7 = v6;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
    __47__WDExportManager__writeDataForMedicalRecords___block_invoke_cold_3();
  }
  [*(id *)(a1 + 32) setExportFailed:1];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
LABEL_16:
}

- (void)_writeXMLRecordWithType:(id)a3 sourceName:(id)a4 sourceVersion:(id)a5 device:(id)a6 unit:(id)a7 metadata:(id)a8 hrvMetadataList:(id)a9 creationDate:(id)a10 startDate:(id)a11 endDate:(id)a12 value:(id)a13
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id obja = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v57 = a8;
  id v23 = a9;
  id v55 = a10;
  id v24 = a11;
  id v56 = a12;
  id v58 = a13;
  xmlTextWriterStartElement(self->_writer, (const xmlChar *)"Record");
  writer = self->_writer;
  id v26 = obja;
  xmlTextWriterWriteAttribute(writer, (const xmlChar *)"type", (const xmlChar *)[v26 UTF8String]);
  uint64_t v27 = self->_writer;
  id v54 = v19;
  xmlTextWriterWriteAttribute(v27, (const xmlChar *)"sourceName", (const xmlChar *)[v54 UTF8String]);
  if ([v20 length]) {
    xmlTextWriterWriteAttribute(self->_writer, (const xmlChar *)"sourceVersion", (const xmlChar *)[v20 UTF8String]);
  }
  if ([v21 length]) {
    xmlTextWriterWriteAttribute(self->_writer, (const xmlChar *)"device", (const xmlChar *)[v21 UTF8String]);
  }
  uint64_t v28 = v55;
  if ([v22 length]) {
    xmlTextWriterWriteAttribute(self->_writer, (const xmlChar *)"unit", (const xmlChar *)[v22 UTF8String]);
  }
  if (v55)
  {
    uint64_t v29 = self->_writer;
    id v30 = [(NSDateFormatter *)self->_xmlDateFormatter stringFromDate:v55];
    xmlTextWriterWriteAttribute(v29, (const xmlChar *)"creationDate", (const xmlChar *)[v30 UTF8String]);
  }
  id v31 = self->_writer;
  id v32 = [(NSDateFormatter *)self->_xmlDateFormatter stringFromDate:v24];
  xmlTextWriterWriteAttribute(v31, (const xmlChar *)"startDate", (const xmlChar *)[v32 UTF8String]);

  id v33 = self->_writer;
  id v34 = [(NSDateFormatter *)self->_xmlDateFormatter stringFromDate:v56];
  xmlTextWriterWriteAttribute(v33, (const xmlChar *)"endDate", (const xmlChar *)[v34 UTF8String]);

  objc_opt_class();
  uint64_t v35 = v58;
  if (objc_opt_isKindOfClass())
  {
    dispatch_semaphore_t v36 = self->_writer;
    uint64_t v37 = NSString;
    [v58 doubleValue];
    objc_msgSend(v37, "stringWithFormat:", @"%g", v38);
    id v39 = objc_claimAutoreleasedReturnValue();
    xmlTextWriterWriteAttribute(v36, (const xmlChar *)"value", (const xmlChar *)[v39 UTF8String]);

    uint64_t v35 = v58;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      xmlTextWriterWriteAttribute(self->_writer, (const xmlChar *)"value", (const xmlChar *)[v58 UTF8String]);
    }
  }
  [(WDExportManager *)self _writeXMLMetadataEntries:v57];
  if (v23)
  {
    id v49 = v26;
    id v51 = v22;
    id v52 = v21;
    id v53 = v20;
    xmlTextWriterStartElement(self->_writer, (const xmlChar *)"HeartRateVariabilityMetadataList");
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v50 = v23;
    id obj = v23;
    uint64_t v40 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v62 != v42) {
            objc_enumerationMutation(obj);
          }
          uint64_t v44 = *(void *)(*((void *)&v61 + 1) + 8 * i);
          xmlTextWriterStartElement(self->_writer, (const xmlChar *)"InstantaneousBeatsPerMinute");
          uint64_t v45 = self->_writer;
          id v46 = [(WDExportManager *)self _formatBPMForBeatToBeatReading:v44];
          xmlTextWriterWriteAttribute(v45, (const xmlChar *)"bpm", (const xmlChar *)[v46 UTF8String]);

          uint64_t v47 = self->_writer;
          id v48 = [(WDExportManager *)self _formatTimeForBeatToBeatReading:v44];
          xmlTextWriterWriteAttribute(v47, (const xmlChar *)"time", (const xmlChar *)[v48 UTF8String]);

          xmlTextWriterEndElement(self->_writer);
        }
        uint64_t v41 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
      }
      while (v41);
    }

    xmlTextWriterEndElement(self->_writer);
    id v21 = v52;
    id v20 = v53;
    id v23 = v50;
    id v22 = v51;
    uint64_t v28 = v55;
    id v26 = v49;
    uint64_t v35 = v58;
  }
  xmlTextWriterEndElement(self->_writer);
}

- (void)_writeXMLCorrelationStartWithType:(id)a3 sourceName:(id)a4 sourceVersion:(id)a5 device:(id)a6 metadata:(id)a7 creationDate:(id)a8 startDate:(id)a9 endDate:(id)a10
{
  id v37 = a5;
  id v16 = a6;
  id v17 = a8;
  id v18 = a9;
  writer = self->_writer;
  id v20 = a10;
  id v21 = a7;
  id v22 = a4;
  id v23 = a3;
  xmlTextWriterStartElement(writer, (const xmlChar *)"Correlation");
  id v24 = self->_writer;
  id v25 = v23;
  id v26 = (const xmlChar *)[v25 UTF8String];

  xmlTextWriterWriteAttribute(v24, (const xmlChar *)"type", v26);
  uint64_t v27 = self->_writer;
  id v28 = v22;
  uint64_t v29 = (const xmlChar *)[v28 UTF8String];

  xmlTextWriterWriteAttribute(v27, (const xmlChar *)"sourceName", v29);
  if ([v37 length]) {
    xmlTextWriterWriteAttribute(self->_writer, (const xmlChar *)"sourceVersion", (const xmlChar *)[v37 UTF8String]);
  }
  if ([v16 length]) {
    xmlTextWriterWriteAttribute(self->_writer, (const xmlChar *)"device", (const xmlChar *)[v16 UTF8String]);
  }
  if (v17)
  {
    id v30 = self->_writer;
    id v31 = [(NSDateFormatter *)self->_xmlDateFormatter stringFromDate:v17];
    xmlTextWriterWriteAttribute(v30, (const xmlChar *)"creationDate", (const xmlChar *)[v31 UTF8String]);
  }
  id v32 = self->_writer;
  id v33 = [(NSDateFormatter *)self->_xmlDateFormatter stringFromDate:v18];
  xmlTextWriterWriteAttribute(v32, (const xmlChar *)"startDate", (const xmlChar *)[v33 UTF8String]);

  id v34 = self->_writer;
  uint64_t v35 = [(NSDateFormatter *)self->_xmlDateFormatter stringFromDate:v20];

  id v36 = v35;
  xmlTextWriterWriteAttribute(v34, (const xmlChar *)"endDate", (const xmlChar *)[v36 UTF8String]);

  [(WDExportManager *)self _writeXMLMetadataEntries:v21];
}

- (void)_writeXMLCorrelationEnd
{
}

- (void)_writeXMLAudiogramStartWithAudiogram:(id)a3
{
  id v37 = a3;
  xmlTextWriterStartElement(self->_writer, (const xmlChar *)"Audiogram");
  writer = self->_writer;
  id v5 = [v37 sampleType];
  id v6 = [v5 identifier];
  xmlTextWriterWriteAttribute(writer, (const xmlChar *)"type", (const xmlChar *)[v6 UTF8String]);

  id v7 = self->_writer;
  uint64_t v8 = [v37 sourceRevision];
  dispatch_semaphore_t v9 = [v8 source];
  id v10 = [v9 name];
  xmlTextWriterWriteAttribute(v7, (const xmlChar *)"sourceName", (const xmlChar *)[v10 UTF8String]);

  char v11 = [v37 sourceRevision];
  id v12 = [v11 version];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    uint64_t v14 = self->_writer;
    uint64_t v15 = [v37 sourceRevision];
    id v16 = [v15 version];
    xmlTextWriterWriteAttribute(v14, (const xmlChar *)"sourceVersion", (const xmlChar *)[v16 UTF8String]);
  }
  id v17 = [v37 device];
  id v18 = [v17 description];
  uint64_t v19 = [v18 length];

  if (v19)
  {
    id v20 = self->_writer;
    id v21 = [v37 device];
    id v22 = [v21 description];
    xmlTextWriterWriteAttribute(v20, (const xmlChar *)"device", (const xmlChar *)[v22 UTF8String]);
  }
  id v23 = [v37 _creationDate];

  if (v23)
  {
    id v24 = self->_writer;
    xmlDateFormatter = self->_xmlDateFormatter;
    id v26 = [v37 _creationDate];
    id v27 = [(NSDateFormatter *)xmlDateFormatter stringFromDate:v26];
    xmlTextWriterWriteAttribute(v24, (const xmlChar *)"creationDate", (const xmlChar *)[v27 UTF8String]);
  }
  id v28 = self->_writer;
  uint64_t v29 = self->_xmlDateFormatter;
  id v30 = [v37 startDate];
  id v31 = [(NSDateFormatter *)v29 stringFromDate:v30];
  xmlTextWriterWriteAttribute(v28, (const xmlChar *)"startDate", (const xmlChar *)[v31 UTF8String]);

  id v32 = self->_writer;
  id v33 = self->_xmlDateFormatter;
  id v34 = [v37 endDate];
  id v35 = [(NSDateFormatter *)v33 stringFromDate:v34];
  xmlTextWriterWriteAttribute(v32, (const xmlChar *)"endDate", (const xmlChar *)[v35 UTF8String]);

  id v36 = [v37 metadata];
  [(WDExportManager *)self _writeXMLMetadataEntries:v36];
}

- (void)_writeXMLAudiogramSensitivityPoint:(id)a3
{
  id v72 = a3;
  xmlTextWriterStartElement(self->_writer, (const xmlChar *)"SensitivityPoint");
  id v4 = [v72 frequency];
  id v5 = [v4 _unit];

  id v6 = [v72 frequency];
  [v6 doubleValueForUnit:v5];
  uint64_t v8 = v7;

  writer = self->_writer;
  objc_msgSend(NSString, "stringWithFormat:", @"%g", v8);
  id v10 = objc_claimAutoreleasedReturnValue();
  xmlTextWriterWriteAttribute(writer, (const xmlChar *)"frequencyValue", (const xmlChar *)[v10 UTF8String]);

  char v11 = self->_writer;
  id v12 = [v5 unitString];
  xmlTextWriterWriteAttribute(v11, (const xmlChar *)"frequencyUnit", (const xmlChar *)[v12 UTF8String]);

  uint64_t v13 = [v72 tests];
  uint64_t v14 = objc_msgSend(v13, "hk_filter:", &__block_literal_global_461);

  v71 = v14;
  uint64_t v15 = [v14 firstObject];
  id v16 = v15;
  int v70 = v15;
  if (v15)
  {
    id v17 = [v15 sensitivity];
    id v18 = [v17 _unit];
    [v17 doubleValueForUnit:v18];
    uint64_t v19 = self->_writer;
    objc_msgSend(NSString, "stringWithFormat:", @"%g", v20);
    id v21 = objc_claimAutoreleasedReturnValue();
    xmlTextWriterWriteAttribute(v19, (const xmlChar *)"leftEarValue", (const xmlChar *)[v21 UTF8String]);

    id v22 = self->_writer;
    id v23 = [v18 unitString];
    xmlTextWriterWriteAttribute(v22, (const xmlChar *)"leftEarUnit", (const xmlChar *)[v23 UTF8String]);

    id v24 = self->_writer;
    id v25 = NSString;
    if ([v16 masked]) {
      id v26 = @"YES";
    }
    else {
      id v26 = @"NO";
    }
    id v27 = [v25 stringWithFormat:@"%@", v26];
    xmlTextWriterWriteAttribute(v24, (const xmlChar *)"leftEarMasked", (const xmlChar *)[v27 UTF8String]);

    id v28 = [v16 clampingRange];
    uint64_t v29 = v28;
    if (v28)
    {
      id v30 = [v28 lowerBound];
      id v31 = v30;
      if (v30)
      {
        [v30 doubleValueForUnit:v18];
        id v32 = self->_writer;
        objc_msgSend(NSString, "stringWithFormat:", @"%g", v33);
        id v34 = objc_claimAutoreleasedReturnValue();
        xmlTextWriterWriteAttribute(v32, (const xmlChar *)"leftEarClampingRangeLowerBound", (const xmlChar *)[v34 UTF8String]);
      }
      id v35 = [v29 upperBound];
      id v36 = v35;
      if (v35)
      {
        [v35 doubleValueForUnit:v18];
        id v37 = self->_writer;
        objc_msgSend(NSString, "stringWithFormat:", @"%g", v38);
        id v39 = v5;
        id v40 = objc_claimAutoreleasedReturnValue();
        xmlTextWriterWriteAttribute(v37, (const xmlChar *)"leftEarClampingRangeUpperBound", (const xmlChar *)[v40 UTF8String]);

        id v5 = v39;
      }

      id v16 = v70;
    }
  }
  uint64_t v41 = [v72 tests];
  uint64_t v42 = objc_msgSend(v41, "hk_filter:", &__block_literal_global_477);

  id v43 = [v42 firstObject];
  uint64_t v44 = v43;
  if (v43)
  {
    uint64_t v45 = [v43 sensitivity];
    id v46 = [v45 _unit];
    v69 = v45;
    [v45 doubleValueForUnit:v46];
    uint64_t v47 = self->_writer;
    objc_msgSend(NSString, "stringWithFormat:", @"%g", v48);
    id v49 = v5;
    id v50 = objc_claimAutoreleasedReturnValue();
    xmlTextWriterWriteAttribute(v47, (const xmlChar *)"rightEarValue", (const xmlChar *)[v50 UTF8String]);

    id v51 = self->_writer;
    id v52 = [v46 unitString];
    xmlTextWriterWriteAttribute(v51, (const xmlChar *)"rightEarUnit", (const xmlChar *)[v52 UTF8String]);

    id v53 = self->_writer;
    id v54 = NSString;
    if ([v44 masked]) {
      id v55 = @"YES";
    }
    else {
      id v55 = @"NO";
    }
    id v56 = [v54 stringWithFormat:@"%@", v55];
    xmlTextWriterWriteAttribute(v53, (const xmlChar *)"rightEarMasked", (const xmlChar *)[v56 UTF8String]);

    id v57 = [v44 clampingRange];
    id v58 = v57;
    if (v57)
    {
      long long v59 = [v57 lowerBound];
      long long v60 = v59;
      if (v59)
      {
        [v59 doubleValueForUnit:v46];
        long long v61 = self->_writer;
        objc_msgSend(NSString, "stringWithFormat:", @"%g", v62);
        id v63 = objc_claimAutoreleasedReturnValue();
        xmlTextWriterWriteAttribute(v61, (const xmlChar *)"rightEarClampingRangeLowerBound", (const xmlChar *)[v63 UTF8String]);
      }
      long long v64 = [v58 upperBound];
      long long v65 = v64;
      if (v64)
      {
        [v64 doubleValueForUnit:v46];
        uint64_t v66 = self->_writer;
        objc_msgSend(NSString, "stringWithFormat:", @"%g", v67);
        id v68 = objc_claimAutoreleasedReturnValue();
        xmlTextWriterWriteAttribute(v66, (const xmlChar *)"rightEarClampingRangeUpperBound", (const xmlChar *)[v68 UTF8String]);
      }
      id v5 = v49;
    }

    id v16 = v70;
  }
  xmlTextWriterEndElement(self->_writer);
}

BOOL __54__WDExportManager__writeXMLAudiogramSensitivityPoint___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 type]) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = [v2 side] == 0;
  }

  return v3;
}

BOOL __54__WDExportManager__writeXMLAudiogramSensitivityPoint___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 type]) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = [v2 side] == 1;
  }

  return v3;
}

- (void)_writeXMLAudiogramEnd
{
}

- (void)_writeXMLWorkoutStartWithActivityType:(id)a3 duration:(id)a4 durationUnit:(id)a5 sourceName:(id)a6 sourceVersion:(id)a7 device:(id)a8 metadata:(id)a9 creationDate:(id)a10 startDate:(id)a11 endDate:(id)a12
{
  id v40 = a3;
  id v18 = a4;
  id v39 = a5;
  id v19 = a6;
  id v20 = a7;
  id v38 = a8;
  id v21 = a10;
  id v37 = a11;
  writer = self->_writer;
  id v23 = a12;
  id v36 = a9;
  xmlTextWriterStartElement(writer, (const xmlChar *)"Workout");
  if ([v40 length]) {
    xmlTextWriterWriteAttribute(self->_writer, (const xmlChar *)"workoutActivityType", (const xmlChar *)[v40 UTF8String]);
  }
  id v24 = v18;
  if (v18 && [v39 length])
  {
    id v25 = self->_writer;
    id v26 = [v18 description];
    xmlTextWriterWriteAttribute(v25, (const xmlChar *)"duration", (const xmlChar *)[v26 UTF8String]);

    xmlTextWriterWriteAttribute(self->_writer, (const xmlChar *)"durationUnit", (const xmlChar *)[v39 UTF8String]);
  }
  id v27 = self->_writer;
  id v28 = v19;
  xmlTextWriterWriteAttribute(v27, (const xmlChar *)"sourceName", (const xmlChar *)[v28 UTF8String]);
  if ([v20 length]) {
    xmlTextWriterWriteAttribute(self->_writer, (const xmlChar *)"sourceVersion", (const xmlChar *)[v20 UTF8String]);
  }
  if ([v38 length]) {
    xmlTextWriterWriteAttribute(self->_writer, (const xmlChar *)"device", (const xmlChar *)[v38 UTF8String]);
  }
  if (v21)
  {
    uint64_t v29 = self->_writer;
    id v30 = [(NSDateFormatter *)self->_xmlDateFormatter stringFromDate:v21];
    xmlTextWriterWriteAttribute(v29, (const xmlChar *)"creationDate", (const xmlChar *)[v30 UTF8String]);
  }
  id v31 = self->_writer;
  id v32 = [(NSDateFormatter *)self->_xmlDateFormatter stringFromDate:v37];
  xmlTextWriterWriteAttribute(v31, (const xmlChar *)"startDate", (const xmlChar *)[v32 UTF8String]);

  uint64_t v33 = self->_writer;
  id v34 = [(NSDateFormatter *)self->_xmlDateFormatter stringFromDate:v23];

  id v35 = v34;
  xmlTextWriterWriteAttribute(v33, (const xmlChar *)"endDate", (const xmlChar *)[v35 UTF8String]);

  [(WDExportManager *)self _writeXMLMetadataEntries:v36];
}

- (void)_writeXMLWorkoutEvent:(id)a3
{
  id v22 = a3;
  xmlTextWriterStartElement(self->_writer, (const xmlChar *)"WorkoutEvent");
  writer = self->_writer;
  unint64_t v5 = [v22 type] - 2;
  if (v5 > 6) {
    id v6 = @"HKWorkoutEventTypePause";
  }
  else {
    id v6 = off_26458E4E8[v5];
  }
  xmlTextWriterWriteAttribute(writer, (const xmlChar *)"type", (const xmlChar *)[(__CFString *)v6 UTF8String]);
  uint64_t v7 = self->_writer;
  xmlDateFormatter = self->_xmlDateFormatter;
  dispatch_semaphore_t v9 = [v22 dateInterval];
  id v10 = [v9 startDate];
  id v11 = [(NSDateFormatter *)xmlDateFormatter stringFromDate:v10];
  xmlTextWriterWriteAttribute(v7, (const xmlChar *)"date", (const xmlChar *)[v11 UTF8String]);

  id v12 = NSNumber;
  uint64_t v13 = [v22 dateInterval];
  [v13 duration];
  uint64_t v15 = [v12 numberWithDouble:v14 / 60.0];

  id v16 = [MEMORY[0x263F0A830] minuteUnit];
  id v17 = [v16 description];

  [v15 doubleValue];
  if (fabs(v18) > 2.22044605e-16 && [v17 length])
  {
    id v19 = self->_writer;
    id v20 = [v15 description];
    xmlTextWriterWriteAttribute(v19, (const xmlChar *)"duration", (const xmlChar *)[v20 UTF8String]);

    xmlTextWriterWriteAttribute(self->_writer, (const xmlChar *)"durationUnit", (const xmlChar *)[v17 UTF8String]);
  }
  id v21 = [v22 metadata];
  [(WDExportManager *)self _writeXMLMetadataEntries:v21];

  xmlTextWriterEndElement(self->_writer);
}

- (void)_writeXMLWorkoutActivity:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  xmlTextWriterStartElement(self->_writer, (const xmlChar *)"WorkoutActivity");
  writer = self->_writer;
  id v6 = [v4 UUID];
  id v7 = [v6 UUIDString];
  xmlTextWriterWriteAttribute(writer, (const xmlChar *)"uuid", (const xmlChar *)[v7 UTF8String]);

  uint64_t v8 = self->_writer;
  xmlDateFormatter = self->_xmlDateFormatter;
  id v10 = [v4 startDate];
  id v11 = [(NSDateFormatter *)xmlDateFormatter stringFromDate:v10];
  xmlTextWriterWriteAttribute(v8, (const xmlChar *)"startDate", (const xmlChar *)[v11 UTF8String]);

  id v12 = self->_writer;
  uint64_t v13 = self->_xmlDateFormatter;
  double v14 = [v4 endDate];
  id v15 = [(NSDateFormatter *)v13 stringFromDate:v14];
  xmlTextWriterWriteAttribute(v12, (const xmlChar *)"endDate", (const xmlChar *)[v15 UTF8String]);

  id v16 = NSNumber;
  [v4 duration];
  double v18 = [v16 numberWithDouble:v17 / 60.0];
  id v19 = [MEMORY[0x263F0A830] minuteUnit];
  id v20 = [v19 description];

  [v18 doubleValue];
  if (fabs(v21) > 2.22044605e-16 && [v20 length])
  {
    id v22 = self->_writer;
    id v23 = [v18 description];
    xmlTextWriterWriteAttribute(v22, (const xmlChar *)"duration", (const xmlChar *)[v23 UTF8String]);

    xmlTextWriterWriteAttribute(self->_writer, (const xmlChar *)"durationUnit", (const xmlChar *)[v20 UTF8String]);
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v24 = [v4 workoutEvents];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v42 != v27) {
          objc_enumerationMutation(v24);
        }
        [(WDExportManager *)self _writeXMLWorkoutEvent:*(void *)(*((void *)&v41 + 1) + 8 * i)];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v26);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v29 = objc_msgSend(v4, "allStatistics", 0);
  id v30 = [v29 allValues];

  uint64_t v31 = [v30 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v38 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = *(void *)(*((void *)&v37 + 1) + 8 * j);
        xmlTextWriterStartElement(self->_writer, (const xmlChar *)"WorkoutStatistics");
        [(WDExportManager *)self _writeXMLWorkoutStatistics:v35];
        xmlTextWriterEndElement(self->_writer);
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v32);
  }

  id v36 = [v4 metadata];
  [(WDExportManager *)self _writeXMLMetadataEntries:v36];

  xmlTextWriterEndElement(self->_writer);
}

- (void)_writeXMLWorkoutEnd
{
}

- (void)_writeXMLObjectAttributes:(id)a3
{
  id v19 = a3;
  id v4 = [v19 sourceRevision];
  unint64_t v5 = [v4 source];
  writer = self->_writer;
  id v7 = [v5 name];
  xmlTextWriterWriteAttribute(writer, (const xmlChar *)"sourceName", (const xmlChar *)[v7 UTF8String]);

  uint64_t v8 = [v4 version];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    id v10 = self->_writer;
    id v11 = [v4 version];
    xmlTextWriterWriteAttribute(v10, (const xmlChar *)"sourceVersion", (const xmlChar *)[v11 UTF8String]);
  }
  id v12 = [v19 device];
  uint64_t v13 = [v12 description];

  if ([v13 length]) {
    xmlTextWriterWriteAttribute(self->_writer, (const xmlChar *)"device", (const xmlChar *)[v13 UTF8String]);
  }
  double v14 = [v19 _creationDate];

  if (v14)
  {
    id v15 = self->_writer;
    xmlDateFormatter = self->_xmlDateFormatter;
    double v17 = [v19 _creationDate];
    id v18 = [(NSDateFormatter *)xmlDateFormatter stringFromDate:v17];
    xmlTextWriterWriteAttribute(v15, (const xmlChar *)"creationDate", (const xmlChar *)[v18 UTF8String]);
  }
}

- (void)_writeXMLSampleAttributes:(id)a3
{
  id v4 = a3;
  [(WDExportManager *)self _writeXMLObjectAttributes:v4];
  writer = self->_writer;
  xmlDateFormatter = self->_xmlDateFormatter;
  id v7 = [v4 startDate];
  id v8 = [(NSDateFormatter *)xmlDateFormatter stringFromDate:v7];
  xmlTextWriterWriteAttribute(writer, (const xmlChar *)"startDate", (const xmlChar *)[v8 UTF8String]);

  uint64_t v9 = self->_writer;
  id v10 = self->_xmlDateFormatter;
  id v12 = [v4 endDate];

  id v11 = [(NSDateFormatter *)v10 stringFromDate:v12];
  xmlTextWriterWriteAttribute(v9, (const xmlChar *)"endDate", (const xmlChar *)[v11 UTF8String]);
}

- (void)_writeXMLMetadataEntries:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
          if ((_HKMetadataKeyIsPrivate() & 1) == 0)
          {
            xmlTextWriterStartElement(self->_writer, (const xmlChar *)"MetadataEntry");
            writer = self->_writer;
            id v12 = v10;
            xmlTextWriterWriteAttribute(writer, (const xmlChar *)"key", (const xmlChar *)[v12 UTF8String]);
            uint64_t v13 = [v5 valueForKey:v12];
            double v14 = self->_writer;
            id v15 = [v13 description];
            xmlTextWriterWriteAttribute(v14, (const xmlChar *)"value", (const xmlChar *)[v15 UTF8String]);

            xmlTextWriterEndElement(self->_writer);
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }
  }
}

- (void)_writeXMLWorkoutRouteStart:(id)a3
{
  writer = self->_writer;
  id v5 = a3;
  xmlTextWriterStartElement(writer, (const xmlChar *)"WorkoutRoute");
  [(WDExportManager *)self _writeXMLSampleAttributes:v5];
  id v6 = [v5 metadata];

  [(WDExportManager *)self _writeXMLMetadataEntries:v6];
}

- (void)_writeXMLWorkoutRouteFileReference:(id)a3
{
  writer = self->_writer;
  id v5 = a3;
  xmlTextWriterStartElement(writer, (const xmlChar *)"FileReference");
  id v6 = self->_writer;
  id v7 = v5;
  uint64_t v8 = (const xmlChar *)[v7 UTF8String];

  xmlTextWriterWriteAttribute(v6, (const xmlChar *)"path", v8);
  uint64_t v9 = self->_writer;

  xmlTextWriterEndElement(v9);
}

- (void)_writeXMLWorkoutRouteEnd
{
}

- (void)_writeXMLWorkoutStatistics:(id)a3
{
  id v43 = a3;
  writer = self->_writer;
  id v5 = [v43 quantityType];
  id v6 = [v5 identifier];
  xmlTextWriterWriteAttribute(writer, (const xmlChar *)"type", (const xmlChar *)[v6 UTF8String]);

  id v7 = self->_writer;
  xmlDateFormatter = self->_xmlDateFormatter;
  uint64_t v9 = [v43 startDate];
  id v10 = [(NSDateFormatter *)xmlDateFormatter stringFromDate:v9];
  xmlTextWriterWriteAttribute(v7, (const xmlChar *)"startDate", (const xmlChar *)[v10 UTF8String]);

  id v11 = self->_writer;
  id v12 = self->_xmlDateFormatter;
  uint64_t v13 = [v43 endDate];
  id v14 = [(NSDateFormatter *)v12 stringFromDate:v13];
  xmlTextWriterWriteAttribute(v11, (const xmlChar *)"endDate", (const xmlChar *)[v14 UTF8String]);

  id v15 = [v43 quantityType];
  long long v16 = [(WDExportManager *)self _preferredUnitForObjectType:v15];

  long long v17 = [v43 averageQuantity];

  if (v17)
  {
    long long v18 = self->_writer;
    long long v19 = NSString;
    id v20 = [v43 averageQuantity];
    [v20 doubleValueForUnit:v16];
    objc_msgSend(v19, "stringWithFormat:", @"%g", v21);
    id v22 = objc_claimAutoreleasedReturnValue();
    xmlTextWriterWriteAttribute(v18, (const xmlChar *)"average", (const xmlChar *)[v22 UTF8String]);
  }
  id v23 = [v43 minimumQuantity];

  if (v23)
  {
    id v24 = self->_writer;
    uint64_t v25 = NSString;
    uint64_t v26 = [v43 minimumQuantity];
    [v26 doubleValueForUnit:v16];
    objc_msgSend(v25, "stringWithFormat:", @"%g", v27);
    id v28 = objc_claimAutoreleasedReturnValue();
    xmlTextWriterWriteAttribute(v24, (const xmlChar *)"minimum", (const xmlChar *)[v28 UTF8String]);
  }
  uint64_t v29 = [v43 maximumQuantity];

  if (v29)
  {
    id v30 = self->_writer;
    uint64_t v31 = NSString;
    uint64_t v32 = [v43 maximumQuantity];
    [v32 doubleValueForUnit:v16];
    objc_msgSend(v31, "stringWithFormat:", @"%g", v33);
    id v34 = objc_claimAutoreleasedReturnValue();
    xmlTextWriterWriteAttribute(v30, (const xmlChar *)"maximum", (const xmlChar *)[v34 UTF8String]);
  }
  uint64_t v35 = [v43 sumQuantity];

  if (v35)
  {
    id v36 = self->_writer;
    long long v37 = NSString;
    long long v38 = [v43 sumQuantity];
    [v38 doubleValueForUnit:v16];
    objc_msgSend(v37, "stringWithFormat:", @"%g", v39);
    id v40 = objc_claimAutoreleasedReturnValue();
    xmlTextWriterWriteAttribute(v36, (const xmlChar *)"sum", (const xmlChar *)[v40 UTF8String]);
  }
  long long v41 = self->_writer;
  id v42 = [v16 unitString];
  xmlTextWriterWriteAttribute(v41, (const xmlChar *)"unit", (const xmlChar *)[v42 UTF8String]);
}

- (void)_writeXMLActivitySummary:(id)a3 activeEnergyBurnedUnit:(id)a4
{
  id v69 = a3;
  id v6 = a4;
  xmlTextWriterStartElement(self->_writer, (const xmlChar *)"ActivitySummary");
  id v7 = [v69 _gregorianDateComponents];
  uint64_t v8 = v7;
  if (v7)
  {
    writer = self->_writer;
    objc_msgSend(NSString, "stringWithFormat:", @"%04ld-%02ld-%02ld", objc_msgSend(v7, "year"), objc_msgSend(v7, "month"), objc_msgSend(v7, "day"));
    id v10 = objc_claimAutoreleasedReturnValue();
    xmlTextWriterWriteAttribute(writer, (const xmlChar *)"dateComponents", (const xmlChar *)[v10 UTF8String]);
  }
  id v11 = [v69 activeEnergyBurned];

  if (v11)
  {
    id v12 = self->_writer;
    uint64_t v13 = NSString;
    id v14 = [v69 activeEnergyBurned];
    [v14 doubleValueForUnit:v6];
    objc_msgSend(v13, "stringWithFormat:", @"%g", v15);
    id v16 = objc_claimAutoreleasedReturnValue();
    xmlTextWriterWriteAttribute(v12, (const xmlChar *)"activeEnergyBurned", (const xmlChar *)[v16 UTF8String]);
  }
  long long v17 = [v69 activeEnergyBurnedGoal];

  if (v17)
  {
    long long v18 = self->_writer;
    long long v19 = NSString;
    id v20 = [v69 activeEnergyBurnedGoal];
    [v20 doubleValueForUnit:v6];
    objc_msgSend(v19, "stringWithFormat:", @"%g", v21);
    id v22 = objc_claimAutoreleasedReturnValue();
    xmlTextWriterWriteAttribute(v18, (const xmlChar *)"activeEnergyBurnedGoal", (const xmlChar *)[v22 UTF8String]);
  }
  id v23 = [v69 activeEnergyBurned];
  if (v23)
  {
  }
  else
  {
    id v24 = [v69 activeEnergyBurnedGoal];

    if (!v24) {
      goto LABEL_11;
    }
  }
  uint64_t v25 = self->_writer;
  id v26 = [v6 unitString];
  xmlTextWriterWriteAttribute(v25, (const xmlChar *)"activeEnergyBurnedUnit", (const xmlChar *)[v26 UTF8String]);

LABEL_11:
  uint64_t v27 = [v69 appleMoveTime];

  if (v27)
  {
    id v28 = self->_writer;
    uint64_t v29 = NSString;
    id v30 = [v69 appleMoveTime];
    uint64_t v31 = [MEMORY[0x263F0A830] minuteUnit];
    [v30 doubleValueForUnit:v31];
    objc_msgSend(v29, "stringWithFormat:", @"%g", v32);
    id v33 = objc_claimAutoreleasedReturnValue();
    xmlTextWriterWriteAttribute(v28, (const xmlChar *)"appleMoveTime", (const xmlChar *)[v33 UTF8String]);
  }
  id v34 = [v69 appleMoveTimeGoal];

  if (v34)
  {
    uint64_t v35 = self->_writer;
    id v36 = NSString;
    long long v37 = [v69 appleMoveTimeGoal];
    long long v38 = [MEMORY[0x263F0A830] minuteUnit];
    [v37 doubleValueForUnit:v38];
    objc_msgSend(v36, "stringWithFormat:", @"%g", v39);
    id v40 = objc_claimAutoreleasedReturnValue();
    xmlTextWriterWriteAttribute(v35, (const xmlChar *)"appleMoveTimeGoal", (const xmlChar *)[v40 UTF8String]);
  }
  long long v41 = [v69 appleExerciseTime];

  if (v41)
  {
    id v42 = self->_writer;
    id v43 = NSString;
    long long v44 = [v69 appleExerciseTime];
    uint64_t v45 = [MEMORY[0x263F0A830] minuteUnit];
    [v44 doubleValueForUnit:v45];
    objc_msgSend(v43, "stringWithFormat:", @"%g", v46);
    id v47 = objc_claimAutoreleasedReturnValue();
    xmlTextWriterWriteAttribute(v42, (const xmlChar *)"appleExerciseTime", (const xmlChar *)[v47 UTF8String]);
  }
  uint64_t v48 = [v69 appleExerciseTimeGoal];

  if (v48)
  {
    id v49 = self->_writer;
    id v50 = NSString;
    id v51 = [v69 appleExerciseTimeGoal];
    id v52 = [MEMORY[0x263F0A830] minuteUnit];
    [v51 doubleValueForUnit:v52];
    objc_msgSend(v50, "stringWithFormat:", @"%g", v53);
    id v54 = objc_claimAutoreleasedReturnValue();
    xmlTextWriterWriteAttribute(v49, (const xmlChar *)"appleExerciseTimeGoal", (const xmlChar *)[v54 UTF8String]);
  }
  id v55 = [v69 appleStandHours];

  if (v55)
  {
    id v56 = self->_writer;
    id v57 = NSString;
    id v58 = [v69 appleStandHours];
    long long v59 = [MEMORY[0x263F0A830] countUnit];
    [v58 doubleValueForUnit:v59];
    objc_msgSend(v57, "stringWithFormat:", @"%g", v60);
    id v61 = objc_claimAutoreleasedReturnValue();
    xmlTextWriterWriteAttribute(v56, (const xmlChar *)"appleStandHours", (const xmlChar *)[v61 UTF8String]);
  }
  uint64_t v62 = [v69 appleStandHoursGoal];

  if (v62)
  {
    id v63 = self->_writer;
    long long v64 = NSString;
    long long v65 = [v69 appleStandHoursGoal];
    uint64_t v66 = [MEMORY[0x263F0A830] countUnit];
    [v65 doubleValueForUnit:v66];
    objc_msgSend(v64, "stringWithFormat:", @"%g", v67);
    id v68 = objc_claimAutoreleasedReturnValue();
    xmlTextWriterWriteAttribute(v63, (const xmlChar *)"appleStandHoursGoal", (const xmlChar *)[v68 UTF8String]);
  }
  xmlTextWriterEndElement(self->_writer);
}

- (void)_writeCDAVitalsOrganizerStartWithStartDate:(id)a3 endDate:(id)a4
{
  writerCDA = self->_writerCDA;
  id v7 = a4;
  id v8 = a3;
  xmlTextWriterStartElement(writerCDA, (const xmlChar *)"entry");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"typeCode", (const xmlChar *)"DRIV");
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"organizer");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"classCode", (const xmlChar *)"CLUSTER");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"moodCode", (const xmlChar *)"EVN");
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"templateId");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"root", (const xmlChar *)"2.16.840.1.113883.10.20.22.4.26");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"id");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"root", (const xmlChar *)"c6f88320-67ad-11db-bd13-0800200c9a66");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"code");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"code", (const xmlChar *)"46680005");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"codeSystem", (const xmlChar *)"2.16.840.1.113883.6.96");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"codeSystemName", (const xmlChar *)"SNOMED CT");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"displayName", (const xmlChar *)"Vital signs");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"statusCode");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"code", (const xmlChar *)"completed");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"effectiveTime");
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"low");
  uint64_t v9 = self->_writerCDA;
  id v10 = [(NSDateFormatter *)self->_cdaDateFormatter stringFromDate:v8];

  id v11 = v10;
  xmlTextWriterWriteAttribute(v9, (const xmlChar *)"value", (const xmlChar *)[v11 UTF8String]);

  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"high");
  id v12 = self->_writerCDA;
  uint64_t v13 = [(NSDateFormatter *)self->_cdaDateFormatter stringFromDate:v7];

  id v14 = v13;
  xmlTextWriterWriteAttribute(v12, (const xmlChar *)"value", (const xmlChar *)[v14 UTF8String]);

  xmlTextWriterEndElement(self->_writerCDA);
  uint64_t v15 = self->_writerCDA;

  xmlTextWriterEndElement(v15);
}

- (void)_writeCDAResultsOrganizerStart
{
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"entry");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"typeCode", (const xmlChar *)"DRIV");
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"organizer");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"classCode", (const xmlChar *)"BATTERY");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"moodCode", (const xmlChar *)"EVN");
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"templateId");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"root", (const xmlChar *)"2.16.840.1.113883.10.20.22.4.1");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"id");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"root", (const xmlChar *)"7d5a02b0-67a4-11db-bd13-0800200c9a66");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"code");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"xsi:type", (const xmlChar *)"CE");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"code", (const xmlChar *)"386053000");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"displayName", (const xmlChar *)"Result");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"codeSystem", (const xmlChar *)"2.16.840.1.113883.6.96");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"codeSystemName", (const xmlChar *)"SNOMED CT");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"statusCode");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"code", (const xmlChar *)"completed");
  writerCDA = self->_writerCDA;

  xmlTextWriterEndElement(writerCDA);
}

- (void)_writeCDAOrganizerEnd
{
  xmlTextWriterEndElement(self->_writerCDA);
  writerCDA = self->_writerCDA;

  xmlTextWriterEndElement(writerCDA);
}

- (void)_writeCDAEntryWithValue:(id)a3 type:(id)a4 sourceName:(id)a5 sourceVersion:(id)a6 device:(id)a7 unit:(id)a8 metadata:(id)a9 startDate:(id)a10 endDate:(id)a11
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v78 = a3;
  id v17 = a4;
  id v18 = a5;
  long long v19 = v17;
  id v20 = v18;
  id v77 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v75 = a10;
  id v79 = a11;
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"component");
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"observation");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"classCode", (const xmlChar *)"OBS");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"moodCode", (const xmlChar *)"EVN");
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"templateId");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"root", (const xmlChar *)"2.16.840.1.113883.10.20.22.4.27");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"id");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"root", (const xmlChar *)"c6f88321-67ad-11db-bd13-0800200c9a66");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"code");
  writerCDA = self->_writerCDA;
  uint64_t v25 = [v19 code];
  uint64_t v26 = v25;
  if (v25 > 61)
  {
    id v30 = @"8310-5";
    uint64_t v31 = @"251853006";
    if (v25 != 87) {
      uint64_t v31 = 0;
    }
    if (v25 != 62) {
      id v30 = v31;
    }
    if ((unint64_t)(v25 - 71) >= 3) {
      uint64_t v27 = v30;
    }
    else {
      uint64_t v27 = @"106048009";
    }
LABEL_11:
    uint64_t v29 = v77;
    id v28 = v78;
  }
  else
  {
    uint64_t v27 = 0;
    uint64_t v29 = v77;
    id v28 = v78;
    switch(v26)
    {
      case 0:
        uint64_t v27 = @"39156-5";
        break;
      case 1:
      case 4:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
        break;
      case 2:
        uint64_t v27 = @"8302-2";
        break;
      case 3:
        uint64_t v27 = @"3141-9";
        break;
      case 5:
        uint64_t v27 = @"8867-4";
        break;
      case 14:
        uint64_t v27 = @"2710-2";
        break;
      case 15:
        uint64_t v27 = @"365812005";
        break;
      case 16:
        uint64_t v27 = @"8480-6";
        break;
      case 17:
        uint64_t v27 = @"8462-4";
        break;
      case 18:
        uint64_t v27 = @"274776000";
        break;
      case 19:
        uint64_t v27 = @"248750004";
        break;
      default:
        if (v26 == 61) {
          uint64_t v27 = @"9279-1";
        }
        else {
          uint64_t v27 = 0;
        }
        goto LABEL_11;
    }
  }
  xmlTextWriterWriteAttribute(writerCDA, (const xmlChar *)"code", (const xmlChar *)[(__CFString *)v27 UTF8String]);
  if (getCategoryOfType(v19))
  {
    if (getCategoryOfType(v19) != 1) {
      goto LABEL_17;
    }
    uint64_t v32 = "SNOMED CT";
    id v33 = "2.16.840.1.113883.6.96";
  }
  else
  {
    uint64_t v32 = "LOINC";
    id v33 = "2.16.840.1.113883.6.1";
  }
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"codeSystem", (const xmlChar *)v33);
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"codeSystemName", (const xmlChar *)v32);
LABEL_17:
  id v34 = self->_writerCDA;
  uint64_t v35 = [v19 code];
  uint64_t v36 = v35;
  if (v35 > 61)
  {
    long long v38 = @"Body Temperature";
    uint64_t v39 = @"Oral fluid input";
    if (v35 != 87) {
      uint64_t v39 = 0;
    }
    if (v35 != 62) {
      long long v38 = v39;
    }
    if ((unint64_t)(v35 - 71) >= 3) {
      long long v37 = v38;
    }
    else {
      long long v37 = @"Respiratory finding";
    }
  }
  else
  {
    long long v37 = 0;
    switch(v36)
    {
      case 0:
        long long v37 = @"Body mass index";
        break;
      case 1:
      case 4:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
        break;
      case 2:
        long long v37 = @"Height";
        break;
      case 3:
        long long v37 = @"Body weight Measured";
        break;
      case 5:
        long long v37 = @"Heart rate";
        break;
      case 14:
        long long v37 = @"Oxygen saturation";
        break;
      case 15:
        long long v37 = @"Blood glucose level";
        break;
      case 16:
        long long v37 = @"Sysstolic blood pressure";
        break;
      case 17:
        long long v37 = @"Diastolic blood pressure";
        break;
      case 18:
        long long v37 = @"Finding of alcohol in blood";
        break;
      case 19:
        long long v37 = @"Peripheral blood flow";
        break;
      default:
        if (v36 == 61) {
          long long v37 = @"Respiratory rate";
        }
        else {
          long long v37 = 0;
        }
        break;
    }
  }
  xmlTextWriterWriteAttribute(v34, (const xmlChar *)"displayName", (const xmlChar *)[(__CFString *)v37 UTF8String]);
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"text");
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"sourceName");
  id v40 = self->_writerCDA;
  id v41 = v20;
  xmlTextWriterWriteString(v40, (const xmlChar *)[v41 UTF8String]);
  xmlTextWriterEndElement(self->_writerCDA);
  if ([v29 length])
  {
    xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"sourceVersion");
    xmlTextWriterWriteString(self->_writerCDA, (const xmlChar *)[v29 UTF8String]);
    xmlTextWriterEndElement(self->_writerCDA);
  }
  if ([v21 length])
  {
    xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"device");
    xmlTextWriterWriteString(self->_writerCDA, (const xmlChar *)[v21 UTF8String]);
    xmlTextWriterEndElement(self->_writerCDA);
  }
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"value");
  objc_opt_class();
  id v76 = v21;
  if (objc_opt_isKindOfClass())
  {
    id v42 = self->_writerCDA;
    id v43 = NSString;
    [v28 doubleValue];
    objc_msgSend(v43, "stringWithFormat:", @"%g", v44);
    id v45 = objc_claimAutoreleasedReturnValue();
    xmlTextWriterWriteString(v42, (const xmlChar *)[v45 UTF8String]);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      xmlTextWriterWriteString(self->_writerCDA, (const xmlChar *)[v28 UTF8String]);
    }
  }
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"type");
  uint64_t v46 = self->_writerCDA;
  id v47 = [v19 identifier];
  xmlTextWriterWriteString(v46, (const xmlChar *)[v47 UTF8String]);

  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"unit");
  uint64_t v48 = self->_writerCDA;
  id v74 = v22;
  xmlTextWriterWriteString(v48, (const xmlChar *)[v74 UTF8String]);
  xmlTextWriterEndElement(self->_writerCDA);
  if (v23)
  {
    id v71 = v41;
    id v72 = v23;
    uint64_t v73 = v19;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v49 = v23;
    uint64_t v50 = [v49 countByEnumeratingWithState:&v80 objects:v84 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v81;
      do
      {
        for (uint64_t i = 0; i != v51; ++i)
        {
          if (*(void *)v81 != v52) {
            objc_enumerationMutation(v49);
          }
          id v54 = *(void **)(*((void *)&v80 + 1) + 8 * i);
          if ((_HKMetadataKeyIsPrivate() & 1) == 0)
          {
            xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"metadataEntry");
            xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"key");
            id v55 = self->_writerCDA;
            id v56 = v54;
            xmlTextWriterWriteString(v55, (const xmlChar *)[v56 UTF8String]);
            xmlTextWriterEndElement(self->_writerCDA);
            id v57 = [v49 valueForKey:v56];
            xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"value");
            id v58 = self->_writerCDA;
            id v59 = [v57 description];
            xmlTextWriterWriteString(v58, (const xmlChar *)[v59 UTF8String]);

            xmlTextWriterEndElement(self->_writerCDA);
            xmlTextWriterEndElement(self->_writerCDA);
          }
        }
        uint64_t v51 = [v49 countByEnumeratingWithState:&v80 objects:v84 count:16];
      }
      while (v51);
    }

    uint64_t v29 = v77;
    id v28 = v78;
    id v23 = v72;
    long long v19 = v73;
    id v41 = v71;
  }
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"statusCode");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"code", (const xmlChar *)"completed");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"effectiveTime");
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"low");
  uint64_t v60 = self->_writerCDA;
  id v61 = [(NSDateFormatter *)self->_cdaDateFormatter stringFromDate:v75];
  xmlTextWriterWriteAttribute(v60, (const xmlChar *)"value", (const xmlChar *)[v61 UTF8String]);

  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"high");
  uint64_t v62 = self->_writerCDA;
  id v63 = [(NSDateFormatter *)self->_cdaDateFormatter stringFromDate:v79];
  xmlTextWriterWriteAttribute(v62, (const xmlChar *)"value", (const xmlChar *)[v63 UTF8String]);

  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"value");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"xsi:type", (const xmlChar *)"PQ");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v64 = self->_writerCDA;
    long long v65 = NSString;
    [v28 doubleValue];
    objc_msgSend(v65, "stringWithFormat:", @"%g", v66);
    id v67 = objc_claimAutoreleasedReturnValue();
    xmlTextWriterWriteAttribute(v64, (const xmlChar *)"value", (const xmlChar *)[v67 UTF8String]);

    id v68 = v76;
  }
  else
  {
    objc_opt_class();
    id v68 = v76;
    if (objc_opt_isKindOfClass()) {
      xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"value", (const xmlChar *)[v28 UTF8String]);
    }
  }
  id v69 = self->_writerCDA;
  id v70 = v74;
  xmlTextWriterWriteAttribute(v69, (const xmlChar *)"unit", (const xmlChar *)[v70 UTF8String]);
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"interpretationCode");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"code", (const xmlChar *)"N");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"codeSystem", (const xmlChar *)"2.16.840.1.113883.5.83");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterEndElement(self->_writerCDA);
}

- (void)_writeXMLMedicalRecordWithType:(id)a3 identifier:(id)a4 sourceName:(id)a5 sourceURL:(id)a6 fhirVersion:(id)a7 receivedDate:(id)a8 jsonFilePath:(id)a9
{
  writer = self->_writer;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  xmlTextWriterStartElement(writer, (const xmlChar *)"ClinicalRecord");
  id v24 = self->_writer;
  id v25 = v23;
  uint64_t v26 = (const xmlChar *)[v25 UTF8String];

  xmlTextWriterWriteAttribute(v24, (const xmlChar *)"type", v26);
  uint64_t v27 = self->_writer;
  id v28 = v22;
  uint64_t v29 = (const xmlChar *)[v28 UTF8String];

  xmlTextWriterWriteAttribute(v27, (const xmlChar *)"identifier", v29);
  id v30 = self->_writer;
  id v31 = v21;
  uint64_t v32 = (const xmlChar *)[v31 UTF8String];

  xmlTextWriterWriteAttribute(v30, (const xmlChar *)"sourceName", v32);
  id v33 = self->_writer;
  id v34 = v20;
  uint64_t v35 = (const xmlChar *)[v34 UTF8String];

  xmlTextWriterWriteAttribute(v33, (const xmlChar *)"sourceURL", v35);
  uint64_t v36 = self->_writer;
  id v37 = v19;
  long long v38 = (const xmlChar *)[v37 UTF8String];

  xmlTextWriterWriteAttribute(v36, (const xmlChar *)"fhirVersion", v38);
  uint64_t v39 = self->_writer;
  id v40 = v18;
  id v41 = (const xmlChar *)[v40 UTF8String];

  xmlTextWriterWriteAttribute(v39, (const xmlChar *)"receivedDate", v41);
  id v42 = self->_writer;
  id v43 = v17;
  uint64_t v44 = (const xmlChar *)[v43 UTF8String];

  xmlTextWriterWriteAttribute(v42, (const xmlChar *)"resourceFilePath", v44);
  id v45 = self->_writer;

  xmlTextWriterEndElement(v45);
}

- (void)_writeXMLPersonWithDateOfBirth:(id)a3 biologicalSex:(int64_t)a4 bloodType:(int64_t)a5 skinType:(int64_t)a6 cardioFitnessMedicationsUse:(id)a7
{
  writer = self->_writer;
  id v13 = a7;
  id v14 = a3;
  xmlTextWriterStartElement(writer, (const xmlChar *)"ExportDate");
  uint64_t v15 = self->_writer;
  xmlDateFormatter = self->_xmlDateFormatter;
  id v17 = [MEMORY[0x263EFF910] date];
  id v18 = [(NSDateFormatter *)xmlDateFormatter stringFromDate:v17];
  xmlTextWriterWriteAttribute(v15, (const xmlChar *)"value", (const xmlChar *)[v18 UTF8String]);

  xmlTextWriterEndElement(self->_writer);
  xmlTextWriterStartElement(self->_writer, (const xmlChar *)"Me");
  id v36 = (id)objc_opt_new();
  [v36 setDateFormat:@"yyyy-MM-dd"];
  id v19 = self->_writer;
  id v20 = (const xmlChar *)[(id)*MEMORY[0x263F09468] UTF8String];
  id v21 = [v36 stringFromDate:v14];

  id v22 = v21;
  xmlTextWriterWriteAttribute(v19, v20, (const xmlChar *)[v22 UTF8String]);

  id v23 = self->_writer;
  id v24 = (const xmlChar *)[(id)*MEMORY[0x263F09458] UTF8String];
  if ((unint64_t)a4 > 3) {
    id v25 = 0;
  }
  else {
    id v25 = off_26458E520[a4];
  }
  xmlTextWriterWriteAttribute(v23, v24, (const xmlChar *)[(__CFString *)v25 UTF8String]);
  uint64_t v26 = self->_writer;
  uint64_t v27 = (const xmlChar *)[(id)*MEMORY[0x263F09460] UTF8String];
  if ((unint64_t)a5 > 8) {
    id v28 = 0;
  }
  else {
    id v28 = off_26458E540[a5];
  }
  xmlTextWriterWriteAttribute(v26, v27, (const xmlChar *)[(__CFString *)v28 UTF8String]);
  uint64_t v29 = self->_writer;
  id v30 = (const xmlChar *)[(id)*MEMORY[0x263F09470] UTF8String];
  if ((unint64_t)a6 > 6) {
    id v31 = 0;
  }
  else {
    id v31 = off_26458E588[a6];
  }
  xmlTextWriterWriteAttribute(v29, v30, (const xmlChar *)[(__CFString *)v31 UTF8String]);
  uint64_t v32 = self->_writer;
  id v33 = (const xmlChar *)[(id)*MEMORY[0x263F0AA68] UTF8String];
  id v34 = v13;
  uint64_t v35 = (const xmlChar *)[v34 UTF8String];

  xmlTextWriterWriteAttribute(v32, v33, v35);
  xmlTextWriterEndElement(self->_writer);
}

- (void)_writeCDAHeaderWithName:(id)a3 birthData:(id)a4 biologicalSex:(int64_t)a5
{
  id v29 = a3;
  writerCDA = self->_writerCDA;
  id v9 = a4;
  xmlTextWriterStartElement(writerCDA, (const xmlChar *)"realmCode");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"code", (const xmlChar *)"US");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"typeId");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"root", (const xmlChar *)"2.16.840.1.113883.1.3");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"extension", (const xmlChar *)"POCD_HD000040");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"templateId");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"root", (const xmlChar *)"2.16.840.1.113883.10.20.22.1.2");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"id");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"extension", (const xmlChar *)"Health Export CDA");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"root", (const xmlChar *)"1.1.1.1.1.1.1.1.1");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"code");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"codeSystem", (const xmlChar *)"2.16.840.1.113883.6.1");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"codeSystemName", (const xmlChar *)"LOINC");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"code", (const xmlChar *)"34109-9");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"displayName", (const xmlChar *)"Note");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"title");
  xmlTextWriterWriteString(self->_writerCDA, (const xmlChar *)"Health Data Export");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"effectiveTime");
  id v10 = self->_writerCDA;
  cdaDateFormatter = self->_cdaDateFormatter;
  id v12 = [MEMORY[0x263EFF910] date];
  id v13 = [(NSDateFormatter *)cdaDateFormatter stringFromDate:v12];
  xmlTextWriterWriteAttribute(v10, (const xmlChar *)"value", (const xmlChar *)[v13 UTF8String]);

  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"confidentialityCode");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"code", (const xmlChar *)"N");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"codeSystem", (const xmlChar *)"2.16.840.1.113883.5.25");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"recordTarget");
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"patientRole");
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"id");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"root", (const xmlChar *)"2.16.840.1.113883.4.6");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"nullFlavor", (const xmlChar *)"NA");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"patient");
  if (v29)
  {
    xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"name");
    xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"use", (const xmlChar *)"CL");
    xmlTextWriterWriteString(self->_writerCDA, (const xmlChar *)[v29 UTF8String]);
    xmlTextWriterEndElement(self->_writerCDA);
  }
  if (a5 && a5 != 3)
  {
    if (a5 == 1) {
      id v14 = @"F";
    }
    else {
      id v14 = @"M";
    }
    uint64_t v15 = @"Male";
    if (a5 == 1) {
      uint64_t v15 = @"Female";
    }
    id v16 = self->_writerCDA;
    id v17 = v15;
    id v18 = v14;
    xmlTextWriterStartElement(v16, (const xmlChar *)"administrativeGenderCode");
    id v19 = self->_writerCDA;
    id v20 = v18;
    id v21 = (const xmlChar *)[(__CFString *)v20 UTF8String];

    xmlTextWriterWriteAttribute(v19, (const xmlChar *)"code", v21);
    xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"codeSystem", (const xmlChar *)"2.16.840.1.113883.5.1");
    id v22 = self->_writerCDA;
    id v23 = v17;
    id v24 = (const xmlChar *)[(__CFString *)v23 UTF8String];

    xmlTextWriterWriteAttribute(v22, (const xmlChar *)"displayName", v24);
    xmlTextWriterEndElement(self->_writerCDA);
  }
  id v25 = objc_opt_new();
  [v25 setDateFormat:@"yyyyMMdd"];
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"birthTime");
  uint64_t v26 = self->_writerCDA;
  uint64_t v27 = [v25 stringFromDate:v9];

  id v28 = v27;
  xmlTextWriterWriteAttribute(v26, (const xmlChar *)"value", (const xmlChar *)[v28 UTF8String]);

  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterEndElement(self->_writerCDA);
}

- (void)_writeCDAVitalHeader
{
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"component");
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"section");
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"templateId");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"root", (const xmlChar *)"2.16.840.1.113883.10.20.22.2.4.1");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"code");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"codeSystem", (const xmlChar *)"2.16.840.1.113883.6.1");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"codeSystemName", (const xmlChar *)"LOINC");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"code", (const xmlChar *)"8716-3");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"displayName", (const xmlChar *)"VITAL SIGNS");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"title");
  xmlTextWriterWriteString(self->_writerCDA, (const xmlChar *)"Vital Signs");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"text");
  writerCDA = self->_writerCDA;

  xmlTextWriterEndElement(writerCDA);
}

- (void)_writeCDAResultsHeader
{
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"component");
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"section");
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"templateId");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"root", (const xmlChar *)"2.16.840.1.113883.10.20.22.2.3.1");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"code");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"codeSystem", (const xmlChar *)"2.16.840.1.113883.6.1");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"codeSystemName", (const xmlChar *)"LOINC");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"code", (const xmlChar *)"30954-2");
  xmlTextWriterWriteAttribute(self->_writerCDA, (const xmlChar *)"displayName", (const xmlChar *)"RESULTS");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"title");
  xmlTextWriterWriteString(self->_writerCDA, (const xmlChar *)"Results");
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterStartElement(self->_writerCDA, (const xmlChar *)"text");
  writerCDA = self->_writerCDA;

  xmlTextWriterEndElement(writerCDA);
}

- (void)_writeCDASectionFooter
{
  xmlTextWriterEndElement(self->_writerCDA);
  writerCDA = self->_writerCDA;

  xmlTextWriterEndElement(writerCDA);
}

- (void)_writeVisionRx:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 prescriptionType];
  id v6 = [v4 dateIssued];
  id v7 = [v4 expirationDate];
  [(WDExportManager *)self _writeVisionRxType:v5 dateIssued:v6 expirationDate:v7];

  id v9 = [v4 device];
  id v8 = [v4 metadata];

  [(WDExportManager *)self _writeVisionRxDevice:v9 metadata:v8];
}

- (void)_writeGlassesRx:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 prescriptionType];
  id v6 = [v4 dateIssued];
  id v7 = [v4 expirationDate];
  [(WDExportManager *)self _writeVisionRxType:v5 dateIssued:v6 expirationDate:v7];

  xmlTextWriterStartElement(self->_writer, (const xmlChar *)"RightEye");
  id v41 = [v4 rightEye];
  id v47 = [v41 sphere];
  uint64_t v39 = [v4 rightEye];
  id v45 = [v39 cylinder];
  id v37 = [v4 rightEye];
  id v43 = [v37 axis];
  uint64_t v35 = [v4 rightEye];
  id v8 = [v35 addPower];
  id v33 = [v4 rightEye];
  id v9 = [v33 vertexDistance];
  id v31 = [v4 rightEye];
  id v29 = [v31 prism];
  id v10 = [v29 amount];
  uint64_t v27 = [v4 rightEye];
  id v11 = [v27 prism];
  id v12 = [v11 angle];
  id v13 = [v4 rightEye];
  id v14 = [v13 farPupillaryDistance];
  uint64_t v15 = [v4 rightEye];
  id v16 = [v15 nearPupillaryDistance];
  [(WDExportManager *)self _writeGlassesRxSphere:v47 cylinder:v45 axis:v43 add:v8 vertex:v9 prismAmount:v10 prismAngle:v12 farPD:v14 nearPD:v16];

  xmlTextWriterEndElement(self->_writer);
  xmlTextWriterStartElement(self->_writer, (const xmlChar *)"LeftEye");
  id v42 = [v4 leftEye];
  uint64_t v48 = [v42 sphere];
  id v40 = [v4 leftEye];
  uint64_t v46 = [v40 cylinder];
  long long v38 = [v4 leftEye];
  uint64_t v44 = [v38 axis];
  id v36 = [v4 leftEye];
  id v17 = [v36 addPower];
  id v34 = [v4 leftEye];
  id v18 = [v34 vertexDistance];
  uint64_t v32 = [v4 leftEye];
  id v30 = [v32 prism];
  id v19 = [v30 amount];
  id v28 = [v4 leftEye];
  id v20 = [v28 prism];
  id v21 = [v20 angle];
  id v22 = [v4 leftEye];
  id v23 = [v22 farPupillaryDistance];
  id v24 = [v4 rightEye];
  id v25 = [v24 nearPupillaryDistance];
  [(WDExportManager *)self _writeGlassesRxSphere:v48 cylinder:v46 axis:v44 add:v17 vertex:v18 prismAmount:v19 prismAngle:v21 farPD:v23 nearPD:v25];

  xmlTextWriterEndElement(self->_writer);
  id v49 = [v4 device];
  uint64_t v26 = [v4 metadata];

  [(WDExportManager *)self _writeVisionRxDevice:v49 metadata:v26];
}

- (void)_writeContactsRx:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 prescriptionType];
  id v6 = [v4 dateIssued];
  id v7 = [v4 expirationDate];
  [(WDExportManager *)self _writeVisionRxType:v5 dateIssued:v6 expirationDate:v7];

  writer = self->_writer;
  id v9 = [v4 brand];
  xmlTextWriterWriteAttribute(writer, (const xmlChar *)"brand", (const xmlChar *)[v9 UTF8String]);

  xmlTextWriterStartElement(self->_writer, (const xmlChar *)"RightEye");
  id v33 = [v4 rightEye];
  id v10 = [v33 sphere];
  id v31 = [v4 rightEye];
  id v11 = [v31 cylinder];
  id v29 = [v4 rightEye];
  id v12 = [v29 axis];
  uint64_t v27 = [v4 rightEye];
  id v13 = [v27 addPower];
  id v14 = [v4 rightEye];
  uint64_t v15 = [v14 baseCurve];
  id v16 = [v4 rightEye];
  id v17 = [v16 diameter];
  [(WDExportManager *)self _writeContactsRxSphere:v10 cylinder:v11 axis:v12 add:v13 baseCurve:v15 diameter:v17];

  xmlTextWriterEndElement(self->_writer);
  xmlTextWriterStartElement(self->_writer, (const xmlChar *)"LeftEye");
  id v34 = [v4 leftEye];
  id v18 = [v34 sphere];
  uint64_t v32 = [v4 leftEye];
  id v19 = [v32 cylinder];
  id v30 = [v4 leftEye];
  id v20 = [v30 axis];
  id v28 = [v4 leftEye];
  id v21 = [v28 addPower];
  id v22 = [v4 leftEye];
  id v23 = [v22 baseCurve];
  id v24 = [v4 leftEye];
  id v25 = [v24 diameter];
  [(WDExportManager *)self _writeContactsRxSphere:v18 cylinder:v19 axis:v20 add:v21 baseCurve:v23 diameter:v25];

  xmlTextWriterEndElement(self->_writer);
  id v35 = [v4 device];
  uint64_t v26 = [v4 metadata];

  [(WDExportManager *)self _writeVisionRxDevice:v35 metadata:v26];
}

- (void)_writeVisionRxType:(unint64_t)a3 dateIssued:(id)a4 expirationDate:(id)a5
{
  id v18 = a5;
  if (a3 == 1) {
    id v8 = @"glasses";
  }
  else {
    id v8 = @"contacts";
  }
  writer = self->_writer;
  id v10 = v8;
  id v11 = a4;
  xmlTextWriterWriteAttribute(writer, (const xmlChar *)"type", (const xmlChar *)[(__CFString *)v10 UTF8String]);
  id v12 = self->_writer;
  id v13 = [(NSDateFormatter *)self->_xmlDateFormatter stringFromDate:v11];

  id v14 = v13;
  xmlTextWriterWriteAttribute(v12, (const xmlChar *)"dateIssued", (const xmlChar *)[v14 UTF8String]);

  uint64_t v15 = v18;
  if (v18)
  {
    id v16 = self->_writer;
    id v17 = [(NSDateFormatter *)self->_xmlDateFormatter stringFromDate:v18];
    xmlTextWriterWriteAttribute(v16, (const xmlChar *)"expirationDate", (const xmlChar *)[v17 UTF8String]);

    uint64_t v15 = v18;
  }
}

- (void)_writeVisionRxDevice:(id)a3 metadata:(id)a4
{
  id v8 = a4;
  if (a3)
  {
    writer = self->_writer;
    id v7 = [a3 description];
    xmlTextWriterWriteAttribute(writer, (const xmlChar *)"device", (const xmlChar *)[v7 UTF8String]);
  }
  [(WDExportManager *)self _writeXMLMetadataEntries:v8];
}

- (void)_writeGlassesRxSphere:(id)a3 cylinder:(id)a4 axis:(id)a5 add:(id)a6 vertex:(id)a7 prismAmount:(id)a8 prismAngle:(id)a9 farPD:(id)a10 nearPD:(id)a11
{
  id v61 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  [(WDExportManager *)self _writeVisionRxSphere:a3 cylinder:a4 axis:a5 add:a6];
  if (v61)
  {
    writer = self->_writer;
    id v22 = NSString;
    id v23 = [v61 _unit];
    [v61 doubleValueForUnit:v23];
    objc_msgSend(v22, "stringWithFormat:", @"%g", v24);
    id v25 = objc_claimAutoreleasedReturnValue();
    xmlTextWriterWriteAttribute(writer, (const xmlChar *)"vertex", (const xmlChar *)[v25 UTF8String]);

    uint64_t v26 = self->_writer;
    uint64_t v27 = [v61 _unit];
    id v28 = [v27 description];
    xmlTextWriterWriteAttribute(v26, (const xmlChar *)"vertexUnit", (const xmlChar *)[v28 UTF8String]);
  }
  if (v17)
  {
    id v29 = self->_writer;
    id v30 = NSString;
    id v31 = [v17 _unit];
    [v17 doubleValueForUnit:v31];
    objc_msgSend(v30, "stringWithFormat:", @"%g", v32);
    id v33 = objc_claimAutoreleasedReturnValue();
    xmlTextWriterWriteAttribute(v29, (const xmlChar *)"prismAmount", (const xmlChar *)[v33 UTF8String]);

    id v34 = self->_writer;
    id v35 = [v17 _unit];
    id v36 = [v35 description];
    xmlTextWriterWriteAttribute(v34, (const xmlChar *)"prismAmountUnit", (const xmlChar *)[v36 UTF8String]);
  }
  if (v18)
  {
    id v37 = self->_writer;
    long long v38 = NSString;
    uint64_t v39 = [v18 _unit];
    [v18 doubleValueForUnit:v39];
    objc_msgSend(v38, "stringWithFormat:", @"%g", v40);
    id v41 = objc_claimAutoreleasedReturnValue();
    xmlTextWriterWriteAttribute(v37, (const xmlChar *)"prismAngle", (const xmlChar *)[v41 UTF8String]);

    id v42 = self->_writer;
    id v43 = [v18 _unit];
    id v44 = [v43 description];
    xmlTextWriterWriteAttribute(v42, (const xmlChar *)"prismAngleUnit", (const xmlChar *)[v44 UTF8String]);
  }
  if (v19)
  {
    id v45 = self->_writer;
    uint64_t v46 = NSString;
    id v47 = [v19 _unit];
    [v19 doubleValueForUnit:v47];
    objc_msgSend(v46, "stringWithFormat:", @"%g", v48);
    id v49 = objc_claimAutoreleasedReturnValue();
    xmlTextWriterWriteAttribute(v45, (const xmlChar *)"farPD", (const xmlChar *)[v49 UTF8String]);

    uint64_t v50 = self->_writer;
    uint64_t v51 = [v19 _unit];
    id v52 = [v51 description];
    xmlTextWriterWriteAttribute(v50, (const xmlChar *)"farPDUnit", (const xmlChar *)[v52 UTF8String]);
  }
  if (v20)
  {
    uint64_t v53 = self->_writer;
    id v54 = NSString;
    id v55 = [v20 _unit];
    [v20 doubleValueForUnit:v55];
    objc_msgSend(v54, "stringWithFormat:", @"%g", v56);
    id v57 = objc_claimAutoreleasedReturnValue();
    xmlTextWriterWriteAttribute(v53, (const xmlChar *)"nearPD", (const xmlChar *)[v57 UTF8String]);

    id v58 = self->_writer;
    id v59 = [v20 _unit];
    id v60 = [v59 description];
    xmlTextWriterWriteAttribute(v58, (const xmlChar *)"nearPDUnit", (const xmlChar *)[v60 UTF8String]);
  }
}

- (void)_writeContactsRxSphere:(id)a3 cylinder:(id)a4 axis:(id)a5 add:(id)a6 baseCurve:(id)a7 diameter:(id)a8
{
  id v31 = a7;
  id v14 = a8;
  [(WDExportManager *)self _writeVisionRxSphere:a3 cylinder:a4 axis:a5 add:a6];
  if (v31)
  {
    writer = self->_writer;
    id v16 = NSString;
    id v17 = [v31 _unit];
    [v31 doubleValueForUnit:v17];
    objc_msgSend(v16, "stringWithFormat:", @"%g", v18);
    id v19 = objc_claimAutoreleasedReturnValue();
    xmlTextWriterWriteAttribute(writer, (const xmlChar *)"baseCurve", (const xmlChar *)[v19 UTF8String]);

    id v20 = self->_writer;
    id v21 = [v31 _unit];
    id v22 = [v21 description];
    xmlTextWriterWriteAttribute(v20, (const xmlChar *)"baseCurveUnit", (const xmlChar *)[v22 UTF8String]);
  }
  if (v14)
  {
    id v23 = self->_writer;
    uint64_t v24 = NSString;
    id v25 = [v14 _unit];
    [v14 doubleValueForUnit:v25];
    objc_msgSend(v24, "stringWithFormat:", @"%g", v26);
    id v27 = objc_claimAutoreleasedReturnValue();
    xmlTextWriterWriteAttribute(v23, (const xmlChar *)"diameter", (const xmlChar *)[v27 UTF8String]);

    id v28 = self->_writer;
    id v29 = [v14 _unit];
    id v30 = [v29 description];
    xmlTextWriterWriteAttribute(v28, (const xmlChar *)"diameterUnit", (const xmlChar *)[v30 UTF8String]);
  }
}

- (void)_writeVisionRxSphere:(id)a3 cylinder:(id)a4 axis:(id)a5 add:(id)a6
{
  id v45 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v45)
  {
    writer = self->_writer;
    id v14 = NSString;
    uint64_t v15 = [v45 _unit];
    [v45 doubleValueForUnit:v15];
    objc_msgSend(v14, "stringWithFormat:", @"%g", v16);
    id v17 = objc_claimAutoreleasedReturnValue();
    xmlTextWriterWriteAttribute(writer, (const xmlChar *)"sphere", (const xmlChar *)[v17 UTF8String]);

    uint64_t v18 = self->_writer;
    id v19 = [v45 _unit];
    id v20 = [v19 description];
    xmlTextWriterWriteAttribute(v18, (const xmlChar *)"sphereUnit", (const xmlChar *)[v20 UTF8String]);
  }
  if (v10)
  {
    id v21 = self->_writer;
    id v22 = NSString;
    id v23 = [v10 _unit];
    [v10 doubleValueForUnit:v23];
    objc_msgSend(v22, "stringWithFormat:", @"%g", v24);
    id v25 = objc_claimAutoreleasedReturnValue();
    xmlTextWriterWriteAttribute(v21, (const xmlChar *)"cylinder", (const xmlChar *)[v25 UTF8String]);

    uint64_t v26 = self->_writer;
    id v27 = [v10 _unit];
    id v28 = [v27 description];
    xmlTextWriterWriteAttribute(v26, (const xmlChar *)"cylinderUnit", (const xmlChar *)[v28 UTF8String]);
  }
  if (v11)
  {
    id v29 = self->_writer;
    id v30 = NSString;
    id v31 = [v11 _unit];
    [v11 doubleValueForUnit:v31];
    objc_msgSend(v30, "stringWithFormat:", @"%g", v32);
    id v33 = objc_claimAutoreleasedReturnValue();
    xmlTextWriterWriteAttribute(v29, (const xmlChar *)"axis", (const xmlChar *)[v33 UTF8String]);

    id v34 = self->_writer;
    id v35 = [v11 _unit];
    id v36 = [v35 description];
    xmlTextWriterWriteAttribute(v34, (const xmlChar *)"axisUnit", (const xmlChar *)[v36 UTF8String]);
  }
  if (v12)
  {
    id v37 = self->_writer;
    long long v38 = NSString;
    uint64_t v39 = [v12 _unit];
    [v12 doubleValueForUnit:v39];
    objc_msgSend(v38, "stringWithFormat:", @"%g", v40);
    id v41 = objc_claimAutoreleasedReturnValue();
    xmlTextWriterWriteAttribute(v37, (const xmlChar *)"add", (const xmlChar *)[v41 UTF8String]);

    id v42 = self->_writer;
    id v43 = [v12 _unit];
    id v44 = [v43 description];
    xmlTextWriterWriteAttribute(v42, (const xmlChar *)"addUnit", (const xmlChar *)[v44 UTF8String]);
  }
}

- (void)_writeHealthRecord:(id)a3 documentDirectory:(id)a4 fileNamesInUse:(id)a5
{
  id v19 = a3;
  id v18 = a4;
  id v7 = a5;
  id v8 = [v19 endDate];
  id v9 = objc_alloc(MEMORY[0x263EFF8F0]);
  id v10 = (void *)[v9 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  id v11 = [v10 components:30 fromDate:v8];
  id v12 = objc_msgSend(NSString, "stringWithFormat:", @"cda_%ld%02ld%02ld.xml", objc_msgSend(v11, "year"), objc_msgSend(v11, "month"), objc_msgSend(v11, "day"));
  if ([v7 containsObject:v12])
  {
    uint64_t v13 = 1;
    do
    {
      id v14 = objc_msgSend(NSString, "stringWithFormat:", @"cda_%ld%02ld%02ld_%02ld.xml", objc_msgSend(v11, "year"), objc_msgSend(v11, "month"), objc_msgSend(v11, "day"), v13);

      ++v13;
      id v12 = v14;
    }
    while (([v7 containsObject:v14] & 1) != 0);
  }
  else
  {
    id v14 = v12;
  }
  [v7 addObject:v14];
  uint64_t v15 = [v18 stringByAppendingPathComponent:v14];
  uint64_t v16 = [v19 document];
  id v17 = [v16 documentData];

  [v17 writeToFile:v15 atomically:1];
}

- (void)_exportHealthRecords
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2210D2000, v0, v1, "Unable to create document directory: %{public}@", v2, v3, v4, v5, v6);
}

void __39__WDExportManager__exportHealthRecords__block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (!v10)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_ERROR)) {
      __39__WDExportManager__exportHealthRecords__block_invoke_cold_1();
    }
    id v17 = *(void **)(a1 + 32);
    uint64_t v16 = a1 + 32;
    [v17 setExportFailed:1];
    goto LABEL_14;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(a1 + 32) _writeHealthRecord:*(void *)(*((void *)&v18 + 1) + 8 * v15++) documentDirectory:*(void *)(a1 + 40) fileNamesInUse:*(void *)(a1 + 48)];
      }
      while (v13 != v15);
      uint64_t v13 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }
  if (a4)
  {
    uint64_t v16 = a1 + 32;
LABEL_14:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)v16 + 40));
  }
}

- (id)_electrocardiogramHeaderWithName:(id)a3 dateOfBirth:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263F089D8]);
  id v8 = WDBundle();
  id v9 = [v8 localizedStringForKey:@"ECG_CSV_NAME_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
  id v10 = HKConditionallyRedactedHeartRhythmString();
  [v7 appendString:v10];

  if (v5)
  {
    [v7 appendString:@","];
    [v7 appendString:v5];
  }
  [v7 appendString:@"\n"];
  id v11 = WDBundle();
  uint64_t v12 = [v11 localizedStringForKey:@"ECG_CSV_DOB_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
  uint64_t v13 = HKConditionallyRedactedHeartRhythmString();
  [v7 appendString:v13];

  if (v6)
  {
    id v14 = objc_alloc_init(MEMORY[0x263F08790]);
    [v14 setDateStyle:2];
    [v7 appendString:@","];
    uint64_t v15 = NSString;
    uint64_t v16 = [v14 stringFromDate:v6];
    id v17 = [v15 stringWithFormat:@"\"%@\"", v16];
    [v7 appendString:v17];
  }
  [v7 appendString:@"\n"];

  return v7;
}

- (BOOL)_writeElectrocardiogramsToDisk:(id)a3 header:(id)a4 version:(id)a5
{
  v60[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v49 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x263F08850] defaultManager];
  id v47 = self;
  uint64_t v11 = [(NSString *)self->_exportPath stringByAppendingPathComponent:@"electrocardiograms"];
  uint64_t v59 = *MEMORY[0x263F080A8];
  v60[0] = *MEMORY[0x263F08080];
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v60 forKeys:&v59 count:1];
  id v57 = 0;
  uint64_t v48 = (void *)v11;
  LOBYTE(v11) = [v10 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:v12 error:&v57];
  id v13 = v57;

  if (v11)
  {
    id v14 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    id v15 = objc_alloc(MEMORY[0x263EFF8F0]);
    uint64_t v46 = (void *)[v15 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = v8;
    uint64_t v45 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v45)
    {
      id v39 = v13;
      uint64_t v40 = v10;
      id v41 = v8;
      uint64_t v43 = *(void *)v54;
      id v44 = v9;
      while (2)
      {
        for (uint64_t i = 0; i != v45; ++i)
        {
          if (*(void *)v54 != v43) {
            objc_enumerationMutation(obj);
          }
          id v17 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          context = (void *)MEMORY[0x223C79660]();
          long long v18 = [v17 startDate];
          long long v19 = [v46 components:28 fromDate:v18];

          uint64_t v50 = v19;
          objc_msgSend(NSString, "stringWithFormat:", @"ecg_%ld-%02ld-%02ld", objc_msgSend(v19, "year"), objc_msgSend(v19, "month"), objc_msgSend(v19, "day"));
          id v20 = (id)objc_claimAutoreleasedReturnValue();
          long long v21 = v20;
          if ([v14 containsObject:v20])
          {
            uint64_t v22 = 1;
            uint64_t v23 = v20;
            do
            {
              long long v21 = [NSString stringWithFormat:@"%@_%ld", v20, v22];

              ++v22;
              uint64_t v23 = v21;
            }
            while (([v14 containsObject:v21] & 1) != 0);
          }
          [v14 addObject:v21];
          id v24 = objc_alloc_init(MEMORY[0x263F089D8]);
          [v24 appendString:v49];
          id v25 = WDBundle();
          uint64_t v26 = [v25 localizedStringForKey:@"ECG_CSV_RECORDING_DATE_TITLE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable-Cinnamon"];
          id v27 = HKConditionallyRedactedHeartRhythmString();
          [v24 appendString:v27];

          [v24 appendString:@","];
          xmlDateFormatter = v47->_xmlDateFormatter;
          id v29 = [v17 startDate];
          id v30 = [(NSDateFormatter *)xmlDateFormatter stringFromDate:v29];
          [v24 appendString:v30];

          [v24 appendString:@"\n"];
          id v9 = v44;
          if (v44)
          {
            id v31 = objc_msgSend(v17, "wd_commaSeparatedHeaderWithActiveAlgorithmVersion:", objc_msgSend(v44, "integerValue"));
            [v24 appendString:v31];

            [v24 appendString:@"\n"];
          }
          uint64_t v32 = objc_msgSend(v17, "wd_commaSeparatedData");
          [v24 appendString:v32];

          uint64_t v33 = [v48 stringByAppendingPathComponent:v21];
          id v34 = [(id)v33 stringByAppendingPathExtension:@"csv"];

          id v52 = 0;
          LOBYTE(v33) = [v24 writeToFile:v34 atomically:1 encoding:4 error:&v52];
          id v35 = v52;
          id v36 = v35;
          if ((v33 & 1) == 0)
          {
            _HKInitializeLogging();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
              -[WDExportManager _writeElectrocardiogramsToDisk:header:version:]();
            }

            BOOL v37 = 0;
            goto LABEL_22;
          }
        }
        uint64_t v45 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
        if (v45) {
          continue;
        }
        break;
      }
      BOOL v37 = 1;
LABEL_22:
      id v10 = v40;
      id v8 = v41;
      id v13 = v39;
    }
    else
    {
      BOOL v37 = 1;
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      -[WDExportManager _writeElectrocardiogramsToDisk:header:version:]();
    }
    BOOL v37 = 0;
  }

  return v37;
}

- (void)_exportElectrocardiogramsWithName:(id)a3 dateOfBirth:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263F0A348];
  id v9 = [(WDProfile *)self->_profile healthStore];
  id v23 = 0;
  id v10 = [v8 versionWithHealthStore:v9 error:&v23];
  id v11 = v23;

  if (!v10)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      -[WDExportManager _exportElectrocardiogramsWithName:dateOfBirth:]();
    }
  }
  uint64_t v12 = [MEMORY[0x263F0A358] electrocardiogramType];
  id v13 = objc_alloc(MEMORY[0x263F0A6E0]);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __65__WDExportManager__exportElectrocardiogramsWithName_dateOfBirth___block_invoke;
  v19[3] = &unk_26458E358;
  void v19[4] = self;
  id v20 = v6;
  id v21 = v7;
  id v22 = v10;
  id v14 = v10;
  id v15 = v7;
  id v16 = v6;
  id v17 = (void *)[v13 initWithSampleType:v12 predicate:0 limit:0 sortDescriptors:0 resultsHandler:v19];
  long long v18 = [(WDProfile *)self->_profile healthStore];
  [v18 executeQuery:v17];

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sem, 0xFFFFFFFFFFFFFFFFLL);
}

void __65__WDExportManager__exportElectrocardiogramsWithName_dateOfBirth___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [*(id *)(a1 + 32) _electrocardiogramHeaderWithName:*(void *)(a1 + 40) dateOfBirth:*(void *)(a1 + 48)];
    objc_msgSend(*(id *)(a1 + 32), "setExportFailed:", objc_msgSend(*(id *)(a1 + 32), "_writeElectrocardiogramsToDisk:header:version:", v6, v8, *(void *)(a1 + 56)) ^ 1);
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      __65__WDExportManager__exportElectrocardiogramsWithName_dateOfBirth___block_invoke_cold_1();
    }
    [*(id *)(a1 + 32) setExportFailed:1];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 40));
}

- (BOOL)_addSourceDirectory:(id)a3 asPath:(id)a4 archive:(id)a5 fileManager:(id)a6
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v31 = a5;
  id v11 = a6;
  id v38 = 0;
  uint64_t v12 = [v11 contentsOfDirectoryAtURL:v9 includingPropertiesForKeys:MEMORY[0x263EFFA68] options:4 error:&v38];
  id v13 = v38;
  if (v12)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = v12;
    uint64_t v14 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      id v26 = v13;
      id v27 = v12;
      id v28 = v9;
      uint64_t v32 = *(void *)v35;
      id v16 = obj;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v35 != v32) {
            objc_enumerationMutation(v16);
          }
          long long v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          long long v19 = (void *)MEMORY[0x223C79660]();
          id v20 = [v18 path];
          id v21 = [v18 pathComponents];
          id v22 = [v21 lastObject];

          id v23 = [v10 URLByAppendingPathComponent:v22];
          char v33 = 0;
          if ([v11 fileExistsAtPath:v20 isDirectory:&v33])
          {
            if (v33)
            {
              if (![(WDExportManager *)self _addSourceDirectory:v18 asPath:v23 archive:v31 fileManager:v11])goto LABEL_18; {
            }
              }
            else
            {
              [v31 addFileToArchive:v18 pathInArchive:v23];
              id v16 = obj;
              if (![v31 archiveIsValid])
              {
LABEL_18:

                BOOL v24 = 0;
                goto LABEL_19;
              }
            }
          }
        }
        uint64_t v15 = [v16 countByEnumeratingWithState:&v34 objects:v39 count:16];
        if (v15) {
          continue;
        }
        break;
      }
      BOOL v24 = 1;
LABEL_19:
      uint64_t v12 = v27;
      id v9 = v28;
      id v13 = v26;
    }
    else
    {
      BOOL v24 = 1;
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_ERROR)) {
      -[WDExportManager _addSourceDirectory:asPath:archive:fileManager:]();
    }
    BOOL v24 = 0;
  }

  return v24;
}

- (void)_archiveExportDirectory:(id)a3 toFile:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x263F0A970];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  id v10 = [NSURL fileURLWithPath:v7];

  id v11 = (void *)[v9 initWithURL:v10 archiveType:0];
  uint64_t v12 = [MEMORY[0x263F08850] defaultManager];
  id v13 = [NSURL fileURLWithPath:v8];

  uint64_t v14 = [v13 pathComponents];
  uint64_t v15 = [v14 lastObject];

  id v16 = [NSURL fileURLWithPath:v15];
  if (![(WDExportManager *)self _addSourceDirectory:v13 asPath:v16 archive:v11 fileManager:v12])
  {
    _HKInitializeLogging();
    id v17 = *MEMORY[0x263F098F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_ERROR)) {
      -[WDExportManager _archiveExportDirectory:toFile:](v17, v18, v19, v20, v21, v22, v23, v24);
    }
    [(WDExportManager *)self setExportFailed:1];
  }
  [v11 closeArchive];
}

- (void)_completeAndCloseStreamingXML
{
  xmlTextWriterEndElement(self->_writer);
  xmlTextWriterEndElement(self->_writerCDA);
  xmlTextWriterEndDocument(self->_writer);
  xmlFreeTextWriter(self->_writer);
  xmlTextWriterEndDocument(self->_writerCDA);
  writerCDA = self->_writerCDA;

  xmlFreeTextWriter(writerCDA);
}

- (void)_getAllOrdinaryDataTypesOfClass:(Class)a3 withArray:(id)a4
{
  id v8 = a4;
  for (uint64_t i = 0; i != 317; ++i)
  {
    id v5 = [MEMORY[0x263F0A598] dataTypeWithCode:i];
    if (v5 && (objc_opt_isKindOfClass() & 1) != 0 && [v5 supportsExport])
    {
      uint64_t v6 = [v5 code];
      BOOL v7 = (unint64_t)(v6 - 100) > 0x2C || ((1 << (v6 - 100)) & 0x108000000001) == 0;
      if (v7 && v6 != 79) {
        [v8 addObject:v5];
      }
    }
  }
}

- (void)_getAllOrdinaryDataTypesOfCategory:(int64_t)a3 withArray:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(WDExportManager *)self _getAllOrdinaryDataTypesOfClass:objc_opt_class() withArray:v7];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (getCategoryOfType(v13) == a3) {
          objc_msgSend(v6, "addObject:", v13, (void)v14);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (id)_preferredUnitForObjectType:(id)a3
{
  profile = self->_profile;
  id v5 = a3;
  id v6 = [(WDProfile *)profile displayTypeController];
  id v7 = [v6 displayTypeForObjectTypeUnifyingBloodPressureTypes:v5];

  id v8 = [(WDProfile *)self->_profile unitController];
  uint64_t v9 = [v8 unitForDisplayType:v7];

  return v9;
}

- (id)_formatBPMForBeatToBeatReading:(id)a3
{
  profile = self->_profile;
  id v5 = a3;
  id v6 = [(WDProfile *)profile displayTypeController];
  id v7 = [v6 displayTypeWithIdentifier:&unk_26D2FD2C0];

  id v8 = NSNumber;
  [v5 bpm];
  double v10 = v9;

  uint64_t v11 = [v8 numberWithDouble:v10];
  uint64_t v12 = [(WDProfile *)self->_profile unitController];
  id v13 = HKFormattedStringFromValueForContext();

  return v13;
}

- (id)_formatTimeForBeatToBeatReading:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF910];
  [a3 time];
  uint64_t v4 = objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  id v5 = HKLocalizedStringForDateAndTemplate();

  return v5;
}

- (HKApplicationProviding)applicationProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationProvider);

  return (HKApplicationProviding *)WeakRetained;
}

- (void)setApplicationProvider:(id)a3
{
}

- (BOOL)exportInProgress
{
  return self->_exportInProgress;
}

- (void)setExportInProgress:(BOOL)a3
{
  self->_exportInProgress = a3;
}

- (BOOL)exportFailed
{
  return self->_exportFailed;
}

- (void)setExportFailed:(BOOL)a3
{
  self->_exportFailed = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_applicationProvider);
  objc_storeStrong((id *)&self->_dateIntervalsBySampleType, 0);
  objc_storeStrong((id *)&self->_cdaDateFormatter, 0);
  objc_storeStrong((id *)&self->_xmlDateFormatter, 0);
  objc_storeStrong((id *)&self->_archivePath, 0);
  objc_storeStrong((id *)&self->_CDAFilePath, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_exportPath, 0);
  objc_storeStrong((id *)&self->_documentsPath, 0);
  objc_storeStrong((id *)&self->_completedRecords, 0);
  objc_storeStrong((id *)&self->_vitalsTypes, 0);
  objc_storeStrong((id *)&self->_resultsTypes, 0);
  objc_storeStrong((id *)&self->_sem, 0);
  objc_storeStrong((id *)&self->_outputSerialQueue, 0);

  objc_storeStrong((id *)&self->_profile, 0);
}

void __50__WDExportManager_createExportFileWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2210D2000, v0, v1, "Error getting cardio fitness medications use: %{public}@", v2, v3, v4, v5, v6);
}

void __50__WDExportManager_createExportFileWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2210D2000, v0, v1, "Error getting fitzpatrick skin type: %{public}@", v2, v3, v4, v5, v6);
}

void __50__WDExportManager_createExportFileWithCompletion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2210D2000, v0, v1, "Error getting blood type: %{public}@", v2, v3, v4, v5, v6);
}

void __50__WDExportManager_createExportFileWithCompletion___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2210D2000, v0, v1, "Error getting biological sex: %{public}@", v2, v3, v4, v5, v6);
}

void __50__WDExportManager_createExportFileWithCompletion___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2210D2000, v0, v1, "Error getting birth date: %{public}@", v2, v3, v4, v5, v6);
}

void __50__WDExportManager_createExportFileWithCompletion___block_invoke_cold_6(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(*(void *)a1 + 88);
  uint64_t v2 = *(void *)(*(void *)a1 + 96);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = v2;
  _os_log_error_impl(&dword_2210D2000, a2, OS_LOG_TYPE_ERROR, "File(s) not created: %{public}@; %{public}@",
    (uint8_t *)&v4,
    0x16u);
}

void __38__WDExportManager__queryForDateRanges__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2210D2000, v0, v1, "Failed to retrieve date ranges during export: %{public}@", v2, v3, v4, v5, v6);
}

void __55__WDExportManager__queryForSamplesOfType_batchHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_2210D2000, v0, v1, "Query for '%@' failed during export attempt: %{public}@");
}

void __39__WDExportManager__writeMedicalRecords__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_2210D2000, v0, v1, "Medical type query failed for type %{public}@ (%{public}@)");
}

- (void)_writeDataForWorkoutRoutes:semaphore:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2210D2000, v0, v1, "Error creating workout-route export directory: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_writeDataForMedicalRecords:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    0);
}

- (void)_writeDataForMedicalRecords:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2210D2000, v0, v1, "Unable to create directory for medical records (%{public}@)", v2, v3, v4, v5, v6);
}

void __47__WDExportManager__writeDataForMedicalRecords___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2210D2000, v0, v1, "Unable to write JSON file for medical record (%{public}@)", v2, v3, v4, v5, v6);
}

void __47__WDExportManager__writeDataForMedicalRecords___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __47__WDExportManager__writeDataForMedicalRecords___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2210D2000, v0, v1, "Unable to export properties for medical record (%{public}@)", v2, v3, v4, v5, v6);
}

void __39__WDExportManager__exportHealthRecords__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2210D2000, v0, v1, "Query for health record documents failed: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_writeElectrocardiogramsToDisk:header:version:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2210D2000, v0, v1, "Failed to write electrocardiogram content: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_writeElectrocardiogramsToDisk:header:version:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2210D2000, v0, v1, "Unable to create electrocardiograms export directory: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_exportElectrocardiogramsWithName:dateOfBirth:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2210D2000, v0, v1, "Failed to lookup active electrocardiogram version: %{public}@", v2, v3, v4, v5, v6);
}

void __65__WDExportManager__exportElectrocardiogramsWithName_dateOfBirth___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2210D2000, v0, v1, "Query for electrocardiogram samples failed: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_addSourceDirectory:asPath:archive:fileManager:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2210D2000, v0, v1, "Unable to list archive directory: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_archiveExportDirectory:(uint64_t)a3 toFile:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end