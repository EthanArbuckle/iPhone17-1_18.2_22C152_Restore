@interface CAMVideoLocalPersistenceResult
+ (BOOL)supportsSecureCoding;
- ($2825F4736939C4A6D3AD43837233062D)dimensions;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillDisplayTime;
- (CAMCaptureCoordinationInfo)coordinationInfo;
- (CAMVideoLocalPersistenceResult)initWithCoder:(id)a3;
- (CAMVideoLocalPersistenceResult)initWithURL:(id)a3 filteredLocalDestinationURL:(id)a4 linkedURL:(id)a5 filteredLinkedURL:(id)a6 videoThumbnailPath:(id)a7 UUID:(id)a8 duration:(id *)a9 dimensions:(id)a10 stillPersistenceUUID:(id)a11 stillDisplayTime:(id *)a12 metadataItems:(id)a13 creationDate:(id)a14 adjustmentsData:(id)a15 coordinationInfo:(id)a16 localPrivateMetadataFileURL:(id)a17 error:(id)a18;
- (NSArray)metadataItems;
- (NSData)adjustmentsData;
- (NSDate)creationDate;
- (NSError)error;
- (NSString)filteredVideoPreviewPath;
- (NSString)localPersistenceUUID;
- (NSString)stillPersistenceUUID;
- (NSURL)filteredLinkedDestinationURL;
- (NSURL)filteredLocalDestinationURL;
- (NSURL)linkedDestinationURL;
- (NSURL)localDestinationURL;
- (NSURL)localPrivateMetadataFileURL;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CAMVideoLocalPersistenceResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CAMVideoLocalPersistenceResult)initWithURL:(id)a3 filteredLocalDestinationURL:(id)a4 linkedURL:(id)a5 filteredLinkedURL:(id)a6 videoThumbnailPath:(id)a7 UUID:(id)a8 duration:(id *)a9 dimensions:(id)a10 stillPersistenceUUID:(id)a11 stillDisplayTime:(id *)a12 metadataItems:(id)a13 creationDate:(id)a14 adjustmentsData:(id)a15 coordinationInfo:(id)a16 localPrivateMetadataFileURL:(id)a17 error:(id)a18
{
  id v52 = a3;
  id v51 = a4;
  id v57 = a5;
  id v56 = a6;
  id v55 = a7;
  id v54 = a8;
  id v22 = a11;
  id v23 = a13;
  id v24 = a14;
  id v25 = a15;
  id v26 = a16;
  id v27 = a17;
  id v28 = a18;
  v58.receiver = self;
  v58.super_class = (Class)CAMVideoLocalPersistenceResult;
  v29 = [(CAMVideoLocalPersistenceResult *)&v58 init];
  if (v29)
  {
    uint64_t v30 = [v52 copy];
    v31 = (void *)*((void *)v29 + 1);
    *((void *)v29 + 1) = v30;

    uint64_t v32 = [v51 copy];
    v33 = (void *)*((void *)v29 + 2);
    *((void *)v29 + 2) = v32;

    uint64_t v34 = [v57 copy];
    v35 = (void *)*((void *)v29 + 3);
    *((void *)v29 + 3) = v34;

    uint64_t v36 = [v56 copy];
    v37 = (void *)*((void *)v29 + 4);
    *((void *)v29 + 4) = v36;

    uint64_t v38 = [v55 copy];
    v39 = (void *)*((void *)v29 + 5);
    *((void *)v29 + 5) = v38;

    uint64_t v40 = [v54 copy];
    v41 = (void *)*((void *)v29 + 6);
    *((void *)v29 + 6) = v40;

    long long v42 = *(_OWORD *)&a9->var0;
    *((void *)v29 + 17) = a9->var3;
    *(_OWORD *)(v29 + 120) = v42;
    *(($2825F4736939C4A6D3AD43837233062D *)v29 + 7) = a10;
    uint64_t v43 = [v22 copy];
    v44 = (void *)*((void *)v29 + 8);
    *((void *)v29 + 8) = v43;

    long long v45 = *(_OWORD *)&a12->var0;
    *((void *)v29 + 20) = a12->var3;
    *((_OWORD *)v29 + 9) = v45;
    objc_storeStrong((id *)v29 + 9, a13);
    objc_storeStrong((id *)v29 + 10, a14);
    objc_storeStrong((id *)v29 + 11, a15);
    objc_storeStrong((id *)v29 + 12, a16);
    uint64_t v46 = [v27 copy];
    v47 = (void *)*((void *)v29 + 13);
    *((void *)v29 + 13) = v46;

    objc_storeStrong((id *)v29 + 14, a18);
    v48 = v29;
  }

  return (CAMVideoLocalPersistenceResult *)v29;
}

- (CAMVideoLocalPersistenceResult)initWithCoder:(id)a3
{
  id v4 = a3;
  id v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAMVideoLocalPersistenceResultLocalDestinationURL"];
  id v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAMVideoLocalPersistenceResultFilteredLocalDestinationURL"];
  id v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAMVideoLocalPersistenceResultLinkedDestinationURL"];
  v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAMVideoLocalPersistenceResultFilteredLinkedDestinationURL"];
  v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAMVideoLocalPersistenceResultVideoThumbnailDestinationPath"];
  v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAMVideoLocalPersistenceResultLocalPersistenceUUID"];
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAMVideoLocalPersistenceResultDuration"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAMVideoLocalPersistenceResultDimensions"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAMVideoLocalPersistenceResultStillPersistenceUUID"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAMVideoLocalPersistenceResultStillDisplayTime"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAMVideoLocalPersistenceResultCreationDate"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAMVideoLocalPersistenceResultAdjustmentsData"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAMVideoLocalPersistenceResultLocalPrivateMetadataFileURL"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAMVideoLocalPersistenceResultError"];

  long long v13 = *MEMORY[0x263F01090];
  long long v32 = *MEMORY[0x263F01090];
  uint64_t v14 = *(void *)(MEMORY[0x263F01090] + 16);
  uint64_t v33 = v14;
  if (v5)
  {
    long long v17 = v13;
    [v5 CMTimeValue];
    long long v13 = v17;
  }
  long long v30 = v13;
  uint64_t v31 = v14;
  if (v8) {
    [v8 CMTimeValue];
  }
  uint64_t v29 = 0;
  if (v6)
  {
    [v6 getValue:&v29];
    uint64_t v15 = v29;
  }
  else
  {
    uint64_t v15 = 0;
  }
  long long v27 = v32;
  uint64_t v28 = v33;
  long long v25 = v30;
  uint64_t v26 = v31;
  v18 = -[CAMVideoLocalPersistenceResult initWithURL:filteredLocalDestinationURL:linkedURL:filteredLinkedURL:videoThumbnailPath:UUID:duration:dimensions:stillPersistenceUUID:stillDisplayTime:metadataItems:creationDate:adjustmentsData:coordinationInfo:localPrivateMetadataFileURL:error:](self, "initWithURL:filteredLocalDestinationURL:linkedURL:filteredLinkedURL:videoThumbnailPath:UUID:duration:dimensions:stillPersistenceUUID:stillDisplayTime:metadataItems:creationDate:adjustmentsData:coordinationInfo:localPrivateMetadataFileURL:error:", v24, v23, v22, v21, v20, v19, &v27, v15, v7, &v25, 0, v9, v10, 0, v11,
          v12);

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08D40];
  $95D729B680665BEAEFA1D6FCA8238556 duration = self->_duration;
  id v5 = a3;
  v6 = [v4 valueWithCMTime:&duration];
  $95D729B680665BEAEFA1D6FCA8238556 duration = self->_stillDisplayTime;
  v7 = [MEMORY[0x263F08D40] valueWithCMTime:&duration];
  v8 = [MEMORY[0x263F08D40] valueWithBytes:&self->_dimensions objCType:"{?=ii}"];
  v9 = [(CAMVideoLocalPersistenceResult *)self localDestinationURL];
  [v5 encodeObject:v9 forKey:@"CAMVideoLocalPersistenceResultLocalDestinationURL"];

  v10 = [(CAMVideoLocalPersistenceResult *)self filteredLocalDestinationURL];
  [v5 encodeObject:v10 forKey:@"CAMVideoLocalPersistenceResultFilteredLocalDestinationURL"];

  v11 = [(CAMVideoLocalPersistenceResult *)self linkedDestinationURL];
  [v5 encodeObject:v11 forKey:@"CAMVideoLocalPersistenceResultLinkedDestinationURL"];

  v12 = [(CAMVideoLocalPersistenceResult *)self filteredLinkedDestinationURL];
  [v5 encodeObject:v12 forKey:@"CAMVideoLocalPersistenceResultFilteredLinkedDestinationURL"];

  long long v13 = [(CAMVideoLocalPersistenceResult *)self filteredVideoPreviewPath];
  [v5 encodeObject:v13 forKey:@"CAMVideoLocalPersistenceResultVideoThumbnailDestinationPath"];

  uint64_t v14 = [(CAMVideoLocalPersistenceResult *)self localPersistenceUUID];
  [v5 encodeObject:v14 forKey:@"CAMVideoLocalPersistenceResultLocalPersistenceUUID"];

  [v5 encodeObject:v6 forKey:@"CAMVideoLocalPersistenceResultDuration"];
  [v5 encodeObject:v8 forKey:@"CAMVideoLocalPersistenceResultDimensions"];
  uint64_t v15 = [(CAMVideoLocalPersistenceResult *)self stillPersistenceUUID];
  [v5 encodeObject:v15 forKey:@"CAMVideoLocalPersistenceResultStillPersistenceUUID"];

  [v5 encodeObject:v7 forKey:@"CAMVideoLocalPersistenceResultStillDisplayTime"];
  v16 = [(CAMVideoLocalPersistenceResult *)self creationDate];
  [v5 encodeObject:v16 forKey:@"CAMVideoLocalPersistenceResultCreationDate"];

  long long v17 = [(CAMVideoLocalPersistenceResult *)self adjustmentsData];
  [v5 encodeObject:v17 forKey:@"CAMVideoLocalPersistenceResultAdjustmentsData"];

  v18 = [(CAMVideoLocalPersistenceResult *)self localPrivateMetadataFileURL];
  [v5 encodeObject:v18 forKey:@"CAMVideoLocalPersistenceResultLocalPrivateMetadataFileURL"];

  v19 = [(CAMVideoLocalPersistenceResult *)self error];
  [v5 encodeObject:v19 forKey:@"CAMVideoLocalPersistenceResultError"];
}

- (NSURL)localDestinationURL
{
  return self->_localDestinationURL;
}

- (NSURL)filteredLocalDestinationURL
{
  return self->_filteredLocalDestinationURL;
}

- (NSURL)linkedDestinationURL
{
  return self->_linkedDestinationURL;
}

- (NSURL)filteredLinkedDestinationURL
{
  return self->_filteredLinkedDestinationURL;
}

- (NSString)filteredVideoPreviewPath
{
  return self->_filteredVideoPreviewPath;
}

- (NSString)localPersistenceUUID
{
  return self->_localPersistenceUUID;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[5];
  return self;
}

- ($2825F4736939C4A6D3AD43837233062D)dimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_dimensions;
}

- (NSString)stillPersistenceUUID
{
  return self->_stillPersistenceUUID;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillDisplayTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[6];
  return self;
}

- (NSArray)metadataItems
{
  return self->_metadataItems;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSData)adjustmentsData
{
  return self->_adjustmentsData;
}

- (CAMCaptureCoordinationInfo)coordinationInfo
{
  return self->_coordinationInfo;
}

- (NSURL)localPrivateMetadataFileURL
{
  return self->_localPrivateMetadataFileURL;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_localPrivateMetadataFileURL, 0);
  objc_storeStrong((id *)&self->_coordinationInfo, 0);
  objc_storeStrong((id *)&self->_adjustmentsData, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_metadataItems, 0);
  objc_storeStrong((id *)&self->_stillPersistenceUUID, 0);
  objc_storeStrong((id *)&self->_localPersistenceUUID, 0);
  objc_storeStrong((id *)&self->_filteredVideoPreviewPath, 0);
  objc_storeStrong((id *)&self->_filteredLinkedDestinationURL, 0);
  objc_storeStrong((id *)&self->_linkedDestinationURL, 0);
  objc_storeStrong((id *)&self->_filteredLocalDestinationURL, 0);
  objc_storeStrong((id *)&self->_localDestinationURL, 0);
}

@end