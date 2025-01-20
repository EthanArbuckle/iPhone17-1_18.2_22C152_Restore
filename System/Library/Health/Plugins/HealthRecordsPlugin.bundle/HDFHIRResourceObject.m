@interface HDFHIRResourceObject
- (id)_codableFHIRResourceWithGatewayExternalID:(id)a3 accountID:(id)a4 receivedDate:(id)a5 receivedDateTimeZoneName:(id)a6 firstSeenDate:(id)a7 firstSeenDateTimeZoneName:(id)a8 extractionHints:(unint64_t)a9 originInformation:(id)a10;
- (id)codableFHIRResourceForNewlyIngestedResourceWithGatewayExternalID:(id)a3 accountID:(id)a4 receivedDateTimeZone:(id)a5 behavior:(id)a6;
- (id)currentCodableMessageVersionWithExtractionHints:(unint64_t)a3;
@end

@implementation HDFHIRResourceObject

- (id)currentCodableMessageVersionWithExtractionHints:(unint64_t)a3
{
  char v3 = a3;
  id v5 = objc_alloc_init((Class)HDCodableMessageVersion);
  id v6 = &dword_0 + 1;
  [v5 setEntityVersion:1];
  if (([(HDFHIRResourceObject *)self isClinicalNoteRecord] & 1) == 0) {
    id v6 = [(HDFHIRResourceObject *)self isDocumentReference];
  }
  [v5 setCompatibilityVersion:v6];
  if ((v3 & 0x10) != 0)
  {
    int v7 = [v5 compatibilityVersion];
    if (v7 <= 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v7;
    }
    [v5 setCompatibilityVersion:v8];
  }

  return v5;
}

- (id)codableFHIRResourceForNewlyIngestedResourceWithGatewayExternalID:(id)a3 accountID:(id)a4 receivedDateTimeZone:(id)a5 behavior:(id)a6
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22 = +[NSAssertionHandler currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"HDFHIRResourceObject+Codable.m" lineNumber:43 description:@"Must not use this method on HDOriginalFHIRResourceObjects"];
  }
  id v15 = objc_alloc((Class)HDHRSOriginInformation);
  if (v11) {
    [v11 currentOSVersionStruct];
  }
  else {
    memset(v23, 0, sizeof(v23));
  }
  v16 = [v11 currentOSBuild];
  id v17 = [v15 initWithOperatingSystemVersion:v23 build:v16];

  v18 = [(HDFHIRResourceObject *)self receivedDate];
  v19 = [v12 name];

  v20 = [(HDFHIRResourceObject *)self _codableFHIRResourceWithGatewayExternalID:v14 accountID:v13 receivedDate:v18 receivedDateTimeZoneName:v19 firstSeenDate:0 firstSeenDateTimeZoneName:0 extractionHints:[(HDFHIRResourceObject *)self extractionHints] originInformation:v17];

  return v20;
}

- (id)_codableFHIRResourceWithGatewayExternalID:(id)a3 accountID:(id)a4 receivedDate:(id)a5 receivedDateTimeZoneName:(id)a6 firstSeenDate:(id)a7 firstSeenDateTimeZoneName:(id)a8 extractionHints:(unint64_t)a9 originInformation:(id)a10
{
  id v41 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a10;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  id v22 = objc_alloc_init((Class)HDCodableFHIRResource);
  v23 = [(HDFHIRResourceObject *)self currentCodableMessageVersionWithExtractionHints:a9];
  [v22 setMessageVersion:v23];

  [v22 setGatewayExternalID:v21];
  v24 = [(HDFHIRResourceObject *)self identifier];
  v25 = [v24 resourceType];
  [v22 setResourceType:v25];

  v26 = [(HDFHIRResourceObject *)self identifier];
  v27 = [v26 identifier];
  [v22 setResourceID:v27];

  v28 = [(HDFHIRResourceObject *)self data];
  [v22 setRawContent:v28];

  v29 = [(HDFHIRResourceObject *)self uniquenessChecksum];
  [v22 setUniquenessChecksum:v29];

  v30 = [(HDFHIRResourceObject *)self sourceURL];
  v31 = [v30 absoluteString];
  [v22 setSourceURL:v31];

  v32 = [(HDFHIRResourceObject *)self FHIRVersion];
  v33 = [v32 stringRepresentation];
  [v22 setFhirVersion:v33];

  v34 = v41;
  [v19 timeIntervalSinceReferenceDate];
  double v36 = v35;

  [v22 setReceivedDate:v36];
  [v22 setReceivedDateTimeZoneName:v41];
  if (v16)
  {
    [v16 timeIntervalSinceReferenceDate];
    objc_msgSend(v22, "setFirstSeenDate:");
    if (v17) {
      id v37 = v17;
    }
    else {
      id v37 = v41;
    }
    objc_msgSend(v22, "setFirstSeenDateTimeZoneName:", v37, v41);
  }
  objc_msgSend(v22, "setExtractionHints:", a9, v41);
  [v22 setAccountIdentifier:v20];

  if (v18)
  {
    [v18 operatingSystemVersion];
    [v22 setOriginVersionMajor:v44];
    [v18 operatingSystemVersion];
    [v22 setOriginVersionMinor:v43];
    [v18 operatingSystemVersion];
    uint64_t v38 = v42;
  }
  else
  {
    [v22 setOriginVersionMajor:0];
    [v22 setOriginVersionMinor:0];
    uint64_t v38 = 0;
  }
  [v22 setOriginVersionPatch:v38];
  v39 = [v18 operatingSystemBuild];
  [v22 setOriginVersionBuild:v39];

  return v22;
}

@end