@interface DUDocumentHarvesting
- (void)addSerializedDocument:(id)a3 documentType:(int64_t)a4;
@end

@implementation DUDocumentHarvesting

- (void)addSerializedDocument:(id)a3 documentType:(int64_t)a4
{
  id v5 = a3;
  if (!+[DocumentUnderstandingFeatureFlagReader isSearchAndOrganizationDocumentIngestEnabled])
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_7;
    }
    __int16 v11 = 0;
    v7 = &_os_log_internal;
    v8 = "DocumentUnderstanding: Ingest disabled, skipping XPC call to textunderstandingd from ProactiveHarvesting";
    v9 = (uint8_t *)&v11;
LABEL_9:
    _os_log_debug_impl(&dword_24CF75000, v7, OS_LOG_TYPE_DEBUG, v8, v9, 2u);
    goto LABEL_7;
  }
  if (!+[DocumentUnderstandingFeatureFlagReader isIndexNonfileDocumentsEnabled])
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_7;
    }
    __int16 v10 = 0;
    v7 = &_os_log_internal;
    v8 = "DocumentUnderstanding: Non-file ingest disabled, skipping xpc to textunderstandingd from ProactiveHarvesting";
    v9 = (uint8_t *)&v10;
    goto LABEL_9;
  }
  v6 = +[DUXPCClient sharedInstance];
  [v6 addSerializedDocument:v5 documentType:a4 completion:&unk_26FF53B78];

LABEL_7:
}

@end