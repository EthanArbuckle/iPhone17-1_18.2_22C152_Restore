@interface PHAssetCreationCameraIngestOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)isEligibleForQuickFaceAnalysis;
- (BOOL)isExpectingPairedVideo;
- (BOOL)isRearFacingCamera;
- (NSData)previewImageData;
- (NSDate)creationDate;
- (NSString)backupAdjustmentsFile;
- (NSString)cameraMetadataPath;
- (NSString)captureID;
- (NSString)dbgFilePath;
- (NSString)deferredPhotoIdentifier;
- (NSString)jobType;
- (NSString)portraitEffectFilterName;
- (PHAssetCreationCameraIngestOptions)initWithCameraMetadataPath:(id)a3 isCameraRearFacing:(BOOL)a4 isExpectingPairedVideo:(BOOL)a5 finalAssetHeight:(double)a6 finalAssetWidth:(double)a7 dbgFilePath:(id)a8 previewImgSurfaceRef:(void *)a9 creationDate:(id)a10 jobType:(id)a11 placeholderHeight:(double)a12 placeholderWidth:(double)a13 previewImageData:(id)a14 deferredIdentifier:(id)a15 captureID:(id)a16;
- (PHAssetCreationCameraIngestOptions)initWithCoder:(id)a3;
- (PHAssetCreationCameraIngestOptions)initWithXPCDict:(id)a3;
- (double)finalAssetHeight;
- (double)finalAssetWidth;
- (double)placeholderHeight;
- (double)placeholderWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initFromJobDictionary:(id)a3 withPreviewImgSurfaceRef:(__IOSurface *)a4;
- (unsigned)candidateOptions;
- (void)dealloc;
- (void)encodeToXPCDict:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)previewImgSurfaceRef;
- (void)setBackupAdjustmentsFile:(id)a3;
- (void)setCameraMetadataPath:(id)a3;
- (void)setCandidateOptions:(unsigned __int16)a3;
- (void)setCaptureID:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setDbgFilePath:(id)a3;
- (void)setDeferredPhotoIdentifier:(id)a3;
- (void)setFinalAssetHeight:(double)a3;
- (void)setFinalAssetWidth:(double)a3;
- (void)setIsExpectingPairedVideo:(BOOL)a3;
- (void)setIsRearFacingCamera:(BOOL)a3;
- (void)setJobType:(id)a3;
- (void)setPlaceholderHeight:(double)a3;
- (void)setPlaceholderWidth:(double)a3;
- (void)setPortraitEffectFilterName:(id)a3;
- (void)setPreviewImageData:(id)a3;
- (void)setPreviewImgSurfaceRef:(void *)a3;
@end

@implementation PHAssetCreationCameraIngestOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewImageData, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_deferredPhotoIdentifier, 0);
  objc_storeStrong((id *)&self->_backupAdjustmentsFile, 0);
  objc_storeStrong((id *)&self->_captureID, 0);
  objc_storeStrong((id *)&self->_portraitEffectFilterName, 0);
  objc_storeStrong((id *)&self->_jobType, 0);
  objc_storeStrong((id *)&self->_dbgFilePath, 0);

  objc_storeStrong((id *)&self->_cameraMetadataPath, 0);
}

- (void)setCandidateOptions:(unsigned __int16)a3
{
  self->_candidateOptions = a3;
}

- (unsigned)candidateOptions
{
  return self->_candidateOptions;
}

- (void)setPlaceholderWidth:(double)a3
{
  self->_placeholderWidth = a3;
}

- (double)placeholderWidth
{
  return self->_placeholderWidth;
}

- (void)setPlaceholderHeight:(double)a3
{
  self->_placeholderHeight = a3;
}

- (double)placeholderHeight
{
  return self->_placeholderHeight;
}

- (void)setFinalAssetWidth:(double)a3
{
  self->_finalAssetWidth = a3;
}

- (double)finalAssetWidth
{
  return self->_finalAssetWidth;
}

- (void)setFinalAssetHeight:(double)a3
{
  self->_finalAssetHeight = a3;
}

- (double)finalAssetHeight
{
  return self->_finalAssetHeight;
}

- (void)setIsExpectingPairedVideo:(BOOL)a3
{
  self->_isExpectingPairedVideo = a3;
}

- (BOOL)isExpectingPairedVideo
{
  return self->_isExpectingPairedVideo;
}

- (void)setIsRearFacingCamera:(BOOL)a3
{
  self->_isRearFacingCamera = a3;
}

- (BOOL)isRearFacingCamera
{
  return self->_isRearFacingCamera;
}

- (void)setPreviewImgSurfaceRef:(void *)a3
{
  self->_previewImgSurfaceRef = a3;
}

- (void)previewImgSurfaceRef
{
  return self->_previewImgSurfaceRef;
}

- (void)setPreviewImageData:(id)a3
{
}

- (NSData)previewImageData
{
  return self->_previewImageData;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setDeferredPhotoIdentifier:(id)a3
{
}

- (NSString)deferredPhotoIdentifier
{
  return self->_deferredPhotoIdentifier;
}

- (void)setBackupAdjustmentsFile:(id)a3
{
}

- (NSString)backupAdjustmentsFile
{
  return self->_backupAdjustmentsFile;
}

- (void)setCaptureID:(id)a3
{
}

- (NSString)captureID
{
  return self->_captureID;
}

- (void)setPortraitEffectFilterName:(id)a3
{
}

- (NSString)portraitEffectFilterName
{
  return self->_portraitEffectFilterName;
}

- (void)setJobType:(id)a3
{
}

- (NSString)jobType
{
  return self->_jobType;
}

- (void)setDbgFilePath:(id)a3
{
}

- (NSString)dbgFilePath
{
  return self->_dbgFilePath;
}

- (void)setCameraMetadataPath:(id)a3
{
}

- (NSString)cameraMetadataPath
{
  return self->_cameraMetadataPath;
}

- (void)dealloc
{
  previewImgSurfaceRef = self->_previewImgSurfaceRef;
  if (previewImgSurfaceRef)
  {
    CFRelease(previewImgSurfaceRef);
    self->_previewImgSurfaceRef = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PHAssetCreationCameraIngestOptions;
  [(PHAssetCreationCameraIngestOptions *)&v4 dealloc];
}

- (PHAssetCreationCameraIngestOptions)initWithXPCDict:(id)a3
{
  objc_super v4 = xpc_dictionary_get_value(a3, "cameraIngestOptions");
  v5 = v4;
  if (v4)
  {
    size_t length = 0;
    data = xpc_dictionary_get_data(v4, "previewImageData", &length);
    v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length];
    v8 = PLStringFromXPCDictionary();
    BOOL v23 = xpc_dictionary_get_BOOL(v5, "isRearFacingCamera");
    BOOL v22 = xpc_dictionary_get_BOOL(v5, "isExpectingPairedVideo");
    double v9 = xpc_dictionary_get_double(v5, "assetFinalHeight");
    double v10 = xpc_dictionary_get_double(v5, "assetFinalWidth");
    v11 = PLStringFromXPCDictionary();
    uint64_t v12 = PLCreateIOSurfaceFromXPCDictionary();
    v13 = PLDateFromXPCDictionary();
    v14 = PLStringFromXPCDictionary();
    double v15 = xpc_dictionary_get_double(v5, "placeholderHeight");
    double v16 = xpc_dictionary_get_double(v5, "placeholderWidth");
    v17 = PLStringFromXPCDictionary();
    v18 = PLStringFromXPCDictionary();
    self = [(PHAssetCreationCameraIngestOptions *)self initWithCameraMetadataPath:v8 isCameraRearFacing:v23 isExpectingPairedVideo:v22 finalAssetHeight:v11 finalAssetWidth:v12 dbgFilePath:v13 previewImgSurfaceRef:v9 creationDate:v10 jobType:v15 placeholderHeight:v16 placeholderWidth:v14 previewImageData:v7 deferredIdentifier:v17 captureID:v18];

    [(PHAssetCreationCameraIngestOptions *)self setCandidateOptions:(unsigned __int16)xpc_dictionary_get_int64(v5, "processingCandidateOption")];
    v19 = PLStringFromXPCDictionary();
    [(PHAssetCreationCameraIngestOptions *)self setPortraitEffectFilterName:v19];

    v20 = PLStringFromXPCDictionary();
    [(PHAssetCreationCameraIngestOptions *)self setBackupAdjustmentsFile:v20];
  }
  return self;
}

- (PHAssetCreationCameraIngestOptions)initWithCoder:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  v44 = [v3 stringWithUTF8String:"cameraMetadataPath"];
  v39 = [v4 decodeObjectForKey:v44];
  v43 = [NSString stringWithUTF8String:"isRearFacingCamera"];
  uint64_t v5 = [v4 decodeBoolForKey:v43];
  v42 = [NSString stringWithUTF8String:"isExpectingPairedVideo"];
  unsigned int v36 = [v4 decodeBoolForKey:v42];
  v41 = [NSString stringWithUTF8String:"assetFinalHeight"];
  [v4 decodeDoubleForKey:v41];
  double v7 = v6;
  v40 = [NSString stringWithUTF8String:"assetFinalWidth"];
  [v4 decodeDoubleForKey:v40];
  double v9 = v8;
  v38 = [NSString stringWithUTF8String:"dbgPath"];
  v32 = [v4 decodeObjectForKey:v38];
  v35 = [NSString stringWithUTF8String:"previewImgSurfaceRef"];
  uint64_t v30 = [v4 decodeObjectForKey:v35];
  v34 = [NSString stringWithUTF8String:"creationDate"];
  double v10 = [v4 decodeObjectForKey:v34];
  v33 = [NSString stringWithUTF8String:"jobType"];
  v27 = [v4 decodeObjectForKey:v33];
  v29 = [NSString stringWithUTF8String:"placeholderHeight"];
  [v4 decodeDoubleForKey:v29];
  double v12 = v11;
  v28 = [NSString stringWithUTF8String:"placeholderWidth"];
  [v4 decodeDoubleForKey:v28];
  double v14 = v13;
  double v15 = [NSString stringWithUTF8String:"previewImageData"];
  double v16 = [v4 decodeObjectForKey:v15];
  v17 = [NSString stringWithUTF8String:"deferredPhotoIdentifier"];
  v18 = [v4 decodeObjectForKey:v17];
  v19 = [NSString stringWithUTF8String:"captureID"];
  v20 = [v4 decodeObjectForKey:v19];
  v37 = [(PHAssetCreationCameraIngestOptions *)self initWithCameraMetadataPath:v39 isCameraRearFacing:v5 isExpectingPairedVideo:v36 finalAssetHeight:v32 finalAssetWidth:v30 dbgFilePath:v10 previewImgSurfaceRef:v7 creationDate:v9 jobType:v12 placeholderHeight:v14 placeholderWidth:v27 previewImageData:v16 deferredIdentifier:v18 captureID:v20];

  v21 = [NSString stringWithUTF8String:"processingCandidateOption"];
  -[PHAssetCreationCameraIngestOptions setCandidateOptions:](v37, "setCandidateOptions:", (unsigned __int16)[v4 decodeIntForKey:v21]);

  BOOL v22 = [NSString stringWithUTF8String:"portraitEffectFilterName"];
  BOOL v23 = [v4 decodeObjectForKey:v22];
  [(PHAssetCreationCameraIngestOptions *)v37 setPortraitEffectFilterName:v23];

  v24 = [NSString stringWithUTF8String:"backupAdjustmentsFile"];
  v25 = [v4 decodeObjectForKey:v24];

  [(PHAssetCreationCameraIngestOptions *)v37 setBackupAdjustmentsFile:v25];
  return v37;
}

- (void)encodeToXPCDict:(id)a3
{
  id v4 = a3;
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v4, "cameraIngestOptions", xdict);

  xpc_dictionary_set_BOOL(xdict, "isRearFacingCamera", self->_isRearFacingCamera);
  xpc_dictionary_set_BOOL(xdict, "isExpectingPairedVideo", self->_isExpectingPairedVideo);
  PLXPCDictionarySetString();
  PLXPCDictionarySetString();
  xpc_dictionary_set_double(xdict, "assetFinalHeight", self->_finalAssetHeight);
  xpc_dictionary_set_double(xdict, "assetFinalWidth", self->_finalAssetWidth);
  xpc_dictionary_set_double(xdict, "placeholderHeight", self->_placeholderHeight);
  xpc_dictionary_set_double(xdict, "placeholderWidth", self->_placeholderWidth);
  PLXPCDictionarySetString();
  PLXPCDictionarySetIOSurface();
  PLXPCDictionarySetDate();
  PLXPCDictionarySetData();
  xpc_dictionary_set_int64(xdict, "processingCandidateOption", self->_candidateOptions);
  PLXPCDictionarySetString();
  PLXPCDictionarySetString();
  PLXPCDictionarySetString();
  PLXPCDictionarySetString();
}

- (void)encodeWithCoder:(id)a3
{
  BOOL isRearFacingCamera = self->_isRearFacingCamera;
  uint64_t v5 = NSString;
  id v6 = a3;
  double v7 = [v5 stringWithUTF8String:"isRearFacingCamera"];
  [v6 encodeBool:isRearFacingCamera forKey:v7];

  BOOL isExpectingPairedVideo = self->_isExpectingPairedVideo;
  double v9 = [NSString stringWithUTF8String:"isExpectingPairedVideo"];
  [v6 encodeBool:isExpectingPairedVideo forKey:v9];

  jobType = self->_jobType;
  double v11 = [NSString stringWithUTF8String:"jobType"];
  [v6 encodeObject:jobType forKey:v11];

  cameraMetadataPath = self->_cameraMetadataPath;
  double v13 = [NSString stringWithUTF8String:"cameraMetadataPath"];
  [v6 encodeObject:cameraMetadataPath forKey:v13];

  uint64_t finalAssetHeight = (uint64_t)self->_finalAssetHeight;
  double v15 = [NSString stringWithUTF8String:"assetFinalHeight"];
  [v6 encodeInteger:finalAssetHeight forKey:v15];

  uint64_t finalAssetWidth = (uint64_t)self->_finalAssetWidth;
  v17 = [NSString stringWithUTF8String:"assetFinalWidth"];
  [v6 encodeInteger:finalAssetWidth forKey:v17];

  uint64_t placeholderHeight = (uint64_t)self->_placeholderHeight;
  v19 = [NSString stringWithUTF8String:"placeholderHeight"];
  [v6 encodeInteger:placeholderHeight forKey:v19];

  uint64_t placeholderWidth = (uint64_t)self->_placeholderWidth;
  v21 = [NSString stringWithUTF8String:"placeholderWidth"];
  [v6 encodeInteger:placeholderWidth forKey:v21];

  dbgFilePath = self->_dbgFilePath;
  BOOL v23 = [NSString stringWithUTF8String:"dbgPath"];
  [v6 encodeObject:dbgFilePath forKey:v23];

  previewImgSurfaceRef = self->_previewImgSurfaceRef;
  v25 = [NSString stringWithUTF8String:"previewImgSurfaceRef"];
  [v6 encodeObject:previewImgSurfaceRef forKey:v25];

  creationDate = self->_creationDate;
  v27 = [NSString stringWithUTF8String:"creationDate"];
  [v6 encodeObject:creationDate forKey:v27];

  previewImageData = self->_previewImageData;
  v29 = [NSString stringWithUTF8String:"previewImageData"];
  [v6 encodeObject:previewImageData forKey:v29];

  uint64_t candidateOptions = self->_candidateOptions;
  v31 = [NSString stringWithUTF8String:"processingCandidateOption"];
  [v6 encodeInt:candidateOptions forKey:v31];

  deferredPhotoIdentifier = self->_deferredPhotoIdentifier;
  v33 = [NSString stringWithUTF8String:"deferredPhotoIdentifier"];
  [v6 encodeObject:deferredPhotoIdentifier forKey:v33];

  portraitEffectFilterName = self->_portraitEffectFilterName;
  v35 = [NSString stringWithUTF8String:"portraitEffectFilterName"];
  [v6 encodeObject:portraitEffectFilterName forKey:v35];

  captureID = self->_captureID;
  v37 = [NSString stringWithUTF8String:"captureID"];
  [v6 encodeObject:captureID forKey:v37];

  backupAdjustmentsFile = self->_backupAdjustmentsFile;
  id v39 = [NSString stringWithUTF8String:"backupAdjustmentsFile"];
  [v6 encodeObject:backupAdjustmentsFile forKey:v39];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[PHAssetCreationCameraIngestOptions alloc] initWithCameraMetadataPath:self->_cameraMetadataPath isCameraRearFacing:self->_isRearFacingCamera isExpectingPairedVideo:self->_isExpectingPairedVideo finalAssetHeight:self->_dbgFilePath finalAssetWidth:self->_previewImgSurfaceRef dbgFilePath:self->_creationDate previewImgSurfaceRef:self->_finalAssetHeight creationDate:self->_finalAssetWidth jobType:self->_placeholderHeight placeholderHeight:self->_placeholderWidth placeholderWidth:self->_jobType previewImageData:self->_previewImageData deferredIdentifier:self->_deferredPhotoIdentifier captureID:self->_captureID];
  [(PHAssetCreationCameraIngestOptions *)v4 setCandidateOptions:self->_candidateOptions];
  [(PHAssetCreationCameraIngestOptions *)v4 setBackupAdjustmentsFile:self->_backupAdjustmentsFile];
  return v4;
}

- (BOOL)isEligibleForQuickFaceAnalysis
{
  return [(NSString *)self->_jobType isEqual:*MEMORY[0x1E4F8C9B8]];
}

- (id)initFromJobDictionary:(id)a3 withPreviewImgSurfaceRef:(__IOSurface *)a4
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F8C8D0];
  id v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8C8D0]];
  if (!v6)
  {
    double v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8C928]];
    id v6 = [v7 objectForKeyedSubscript:v5];
  }
  v26 = v6;
  double v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8C8D8]];
  unsigned int v27 = [v6 BOOLValue];
  v31 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8CA50]];
  unsigned int v28 = [v31 BOOLValue];
  uint64_t v30 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8C940]];
  [v30 floatValue];
  double v10 = v9;
  v29 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8C950]];
  [v29 floatValue];
  double v12 = v11;
  double v13 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8CA30]];
  double v14 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8C8F8]];
  double v15 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8C970]];
  double v16 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8CA80]];
  [v16 floatValue];
  double v18 = v17;
  v19 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8CA88]];
  [v19 floatValue];
  double v21 = v20;
  BOOL v22 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8CA90]];
  BOOL v23 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8C910]];
  v24 = [v4 objectForKeyedSubscript:@"captureLogID"];
  v34 = [(PHAssetCreationCameraIngestOptions *)self initWithCameraMetadataPath:v8 isCameraRearFacing:v27 isExpectingPairedVideo:v28 finalAssetHeight:v13 finalAssetWidth:a4 dbgFilePath:v14 previewImgSurfaceRef:v10 creationDate:v12 jobType:v18 placeholderHeight:v21 placeholderWidth:v15 previewImageData:v22 deferredIdentifier:v23 captureID:v24];

  return v34;
}

- (PHAssetCreationCameraIngestOptions)initWithCameraMetadataPath:(id)a3 isCameraRearFacing:(BOOL)a4 isExpectingPairedVideo:(BOOL)a5 finalAssetHeight:(double)a6 finalAssetWidth:(double)a7 dbgFilePath:(id)a8 previewImgSurfaceRef:(void *)a9 creationDate:(id)a10 jobType:(id)a11 placeholderHeight:(double)a12 placeholderWidth:(double)a13 previewImageData:(id)a14 deferredIdentifier:(id)a15 captureID:(id)a16
{
  id v36 = a3;
  id v35 = a8;
  id v34 = a10;
  id v33 = a11;
  id v32 = a14;
  id v31 = a15;
  id v25 = a16;
  v37.receiver = self;
  v37.super_class = (Class)PHAssetCreationCameraIngestOptions;
  v26 = [(PHAssetCreationCameraIngestOptions *)&v37 init];
  if (v26)
  {
    if (a9) {
      v26->_previewImgSurfaceRef = (void *)CFRetain(a9);
    }
    v26->_BOOL isRearFacingCamera = a4;
    objc_storeStrong((id *)&v26->_cameraMetadataPath, a3);
    v26->_uint64_t finalAssetHeight = a6;
    v26->_uint64_t finalAssetWidth = a7;
    objc_storeStrong((id *)&v26->_dbgFilePath, a8);
    objc_storeStrong((id *)&v26->_creationDate, a10);
    objc_storeStrong((id *)&v26->_jobType, a11);
    v26->_uint64_t placeholderHeight = a12;
    v26->_uint64_t placeholderWidth = a13;
    objc_storeStrong((id *)&v26->_previewImageData, a14);
    v26->_uint64_t candidateOptions = 0;
    objc_storeStrong((id *)&v26->_deferredPhotoIdentifier, a15);
    objc_storeStrong((id *)&v26->_captureID, a16);
    v26->_BOOL isExpectingPairedVideo = a5;
    backupAdjustmentsFile = v26->_backupAdjustmentsFile;
    v26->_backupAdjustmentsFile = 0;
  }
  return v26;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end