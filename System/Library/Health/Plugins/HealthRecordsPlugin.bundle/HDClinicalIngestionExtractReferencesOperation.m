@interface HDClinicalIngestionExtractReferencesOperation
- (HDClinicalIngestionExtractReferencesOperation)initWithTask:(id)a3 account:(id)a4 resourceData:(id)a5 sourceResourceObjects:(id)a6 nextOperation:(id)a7;
- (HDReferenceExtractionResult)extractionResult;
- (NSArray)FHIRResourceData;
- (NSArray)sourceResourceObjects;
- (NSError)resolutionError;
- (void)main;
- (void)setExtractionResult:(id)a3;
- (void)setResolutionError:(id)a3;
- (void)setSourceResourceObjects:(id)a3;
@end

@implementation HDClinicalIngestionExtractReferencesOperation

- (HDClinicalIngestionExtractReferencesOperation)initWithTask:(id)a3 account:(id)a4 resourceData:(id)a5 sourceResourceObjects:(id)a6 nextOperation:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HDClinicalIngestionExtractReferencesOperation;
  v14 = [(HDClinicalIngestionPerAccountOperation *)&v20 initWithTask:a3 account:a4 nextOperation:a7];
  if (v14)
  {
    v15 = (NSArray *)[v12 copy];
    FHIRResourceData = v14->_FHIRResourceData;
    v14->_FHIRResourceData = v15;

    v17 = (NSArray *)[v13 copy];
    sourceResourceObjects = v14->_sourceResourceObjects;
    v14->_sourceResourceObjects = v17;
  }
  return v14;
}

- (void)main
{
  _HKInitializeLogging();
  v3 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = [(HDClinicalIngestionPerAccountOperation *)self debugDescription];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ beginning reference resolution", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v41 = 0x3032000000;
  v42 = sub_2AE14;
  v43 = sub_2AE24;
  id v44 = 0;
  uint64_t v32 = 0;
  v33[0] = &v32;
  v33[1] = 0x3032000000;
  v33[2] = sub_2AE14;
  v33[3] = sub_2AE24;
  id v34 = 0;
  v6 = [(HDClinicalIngestionOperation *)self healthRecordsServiceClient];
  NSUInteger v7 = [(NSArray *)self->_sourceResourceObjects count];
  if ((char *)[(NSArray *)self->_FHIRResourceData count] + v7)
  {
    id v8 = objc_alloc((Class)HDReferenceExtractionRequest);
    sourceResourceObjects = self->_sourceResourceObjects;
    FHIRResourceData = self->_FHIRResourceData;
    v11 = [(HDClinicalIngestionPerAccountOperation *)self account];
    id v12 = [v11 gateway];
    id v13 = [v12 baseURL];
    id v14 = [v8 initWithResources:sourceResourceObjects FHIRResourceData:FHIRResourceData serverBaseURL:v13];

    if (v14)
    {
      if (v6)
      {
        v15 = dispatch_group_create();
        dispatch_group_enter(v15);
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_2AE2C;
        v28[3] = &unk_112A60;
        p_long long buf = &buf;
        v31 = &v32;
        v16 = v15;
        v29 = v16;
        [v6 executeFHIRReferenceExtractionRequest:v14 completion:v28];
        dispatch_group_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

LABEL_14:
        goto LABEL_15;
      }
      _HKInitializeLogging();
      objc_super v20 = HKLogHealthRecords;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = [(HDClinicalIngestionPerAccountOperation *)self debugDescription];
        sub_ACAA0(v21, v39, v20);
      }

      uint64_t v19 = +[NSError hk_error:100 description:@"Unable to extract references because there is no extraction service client"];
    }
    else
    {
      _HKInitializeLogging();
      v17 = HKLogHealthRecords;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = [(HDClinicalIngestionPerAccountOperation *)self debugDescription];
        sub_ACA48(v18, v39, v17);
      }

      uint64_t v19 = +[NSError hk_error:100 description:@"Failed to instantiate reference extraction request. Are all resources of the same FHIR release?"];
    }
    v16 = *(NSObject **)(v33[0] + 40);
    *(void *)(v33[0] + 40) = v19;
    goto LABEL_14;
  }
LABEL_15:
  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    -[HDClinicalIngestionExtractReferencesOperation setExtractionResult:](self, "setExtractionResult:");
    _HKInitializeLogging();
    v22 = HKLogHealthRecords;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = [(HDClinicalIngestionPerAccountOperation *)self debugDescription];
      v24 = [*(id *)(*((void *)&buf + 1) + 40) debugDescription];
      v25 = HKSensitiveLogItem();
      *(_DWORD *)v35 = 138543618;
      v36 = v23;
      __int16 v37 = 2112;
      v38 = v25;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ done, %@", v35, 0x16u);
    }
  }
  else
  {
    [(HDClinicalIngestionExtractReferencesOperation *)self setResolutionError:*(void *)(v33[0] + 40)];
    _HKInitializeLogging();
    v26 = HKLogHealthRecords;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = [(HDClinicalIngestionPerAccountOperation *)self debugDescription];
      sub_AC9D8(v27, (uint64_t)v33, v35, v26);
    }

    [(HDClinicalIngestionExtractReferencesOperation *)self cancel];
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&buf, 8);
}

- (HDReferenceExtractionResult)extractionResult
{
  return self->_extractionResult;
}

- (void)setExtractionResult:(id)a3
{
}

- (NSError)resolutionError
{
  return self->_resolutionError;
}

- (void)setResolutionError:(id)a3
{
}

- (NSArray)FHIRResourceData
{
  return self->_FHIRResourceData;
}

- (NSArray)sourceResourceObjects
{
  return self->_sourceResourceObjects;
}

- (void)setSourceResourceObjects:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceResourceObjects, 0);
  objc_storeStrong((id *)&self->_FHIRResourceData, 0);
  objc_storeStrong((id *)&self->_resolutionError, 0);

  objc_storeStrong((id *)&self->_extractionResult, 0);
}

@end