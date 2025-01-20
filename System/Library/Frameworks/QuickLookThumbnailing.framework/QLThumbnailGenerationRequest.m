@interface QLThumbnailGenerationRequest
+ (BOOL)supportsSecureCoding;
+ (QLThumbnailGenerationRequest)requestWithThumbnailRequest:(id)a3;
+ (id)_basicFileIdentifierForURL:(id)a3 error:(id *)a4;
+ (id)_fileProviderFileIdentifierForFPItem:(id)a3;
+ (id)customExtensionCommunicationEncodedClasses;
- (BOOL)forceGeneration;
- (BOOL)iconMode;
- (BOOL)isCancelled;
- (BOOL)isDataBased;
- (BOOL)isDownloadingAllowed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFileBased;
- (BOOL)isFinished;
- (BOOL)isUbiquitous;
- (BOOL)isValid;
- (BOOL)prepareForSending;
- (BOOL)provideCachedResultsOnly;
- (BOOL)provideFullResolutionThumbnail;
- (BOOL)provideGenericIcon;
- (BOOL)provideLowQualityThumbnail;
- (BOOL)resultShouldBeSavedToDisk;
- (BOOL)shouldUseRestrictedExtension;
- (BOOL)thirdPartyVideoDecodersAllowed;
- (BOOL)thumbnailRepresentationTypeMatchesRequestedMostRepresentativeType:(int64_t)a3;
- (BOOL)wantsBaseline;
- (CGFloat)minimumDimension;
- (CGFloat)scale;
- (CGSize)size;
- (FPItem)item;
- (FPSandboxingURLWrapper)genericSandboxWrapper;
- (FPSandboxingURLWrapper)parentDirectorySandboxWrapper;
- (FPSandboxingURLWrapper)quicklookSandboxWrapper;
- (FPSandboxingURLWrapper)saveURLSandboxWrapper;
- (NSData)data;
- (NSDate)beginDate;
- (NSDictionary)externalThumbnailGeneratorData;
- (NSError)requestIsInvalidError;
- (NSFileHandle)saveFileHandle;
- (NSString)contentTypeUTI;
- (NSString)overriddenContentTypeIdentifier;
- (NSURL)fileURL;
- (NSUUID)uuid;
- (QLCacheBasicVersionedFileIdentifier)basicFileIdentifier;
- (QLCacheFileProviderVersionedFileIdentifier)fileProviderFileIdentifier;
- (QLThumbnailGenerationRequest)initWithCoder:(id)a3;
- (QLThumbnailGenerationRequest)initWithData:(id)a3 contentType:(id)a4 size:(CGSize)a5 scale:(double)a6 representationTypes:(unint64_t)a7;
- (QLThumbnailGenerationRequest)initWithFPItem:(id)a3 size:(CGSize)a4 scale:(double)a5 representationTypes:(unint64_t)a6;
- (QLThumbnailGenerationRequest)initWithFileAtURL:(NSURL *)url size:(CGSize)size scale:(CGFloat)scale representationTypes:(QLThumbnailGenerationRequestRepresentationTypes)representationTypes;
- (QLThumbnailGenerationRequest)initWithSize:(CGSize)a3 scale:(double)a4 representationTypes:(unint64_t)a5;
- (QLThumbnailGenerationRequestRepresentationTypes)representationTypes;
- (QLThumbnailRepresentation)mostRepresentativeThumbnail;
- (UTType)contentType;
- (UTType)overriddenContentType;
- (UTType)saveURLContentType;
- (float)maximumPixelSize;
- (id)_stateDescription;
- (id)completionBlock;
- (id)copyWithSize:(CGSize)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)equivalentFPItemRequestWithItem:(id)a3 representationTypes:(unint64_t)a4;
- (id)fileIdentifier;
- (id)saveURL;
- (id)statusBlock;
- (id)updateBlock;
- (int)interpolationQuality;
- (int64_t)compare:(id)a3;
- (int64_t)generationBehavior;
- (int64_t)iconVariant;
- (int64_t)mostRepresentativeTypeForWhichUpdateBlockHasBeenCalled;
- (int64_t)requestedMostRepresentativeType;
- (unint64_t)badgeType;
- (unint64_t)externalThumbnailGeneratorDataHash;
- (unint64_t)hash;
- (unint64_t)typesForWhichUpdateBlockHasBeenCalled;
- (void)cancel;
- (void)contentType;
- (void)encodeWithCoder:(id)a3;
- (void)finish;
- (void)markDidBegin;
- (void)noteUpdateBlockHasBeenCalledForType:(int64_t)a3;
- (void)prepareForSending;
- (void)setBadgeType:(unint64_t)a3;
- (void)setBasicFileIdentifier:(id)a3;
- (void)setBeginDate:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setContentType:(UTType *)contentType;
- (void)setContentTypeUTI:(id)a3;
- (void)setData:(id)a3;
- (void)setDownloadingAllowed:(BOOL)a3;
- (void)setExternalThumbnailGeneratorData:(id)a3;
- (void)setExternalThumbnailGeneratorDataHash:(unint64_t)a3;
- (void)setFileProviderFileIdentifier:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setGenerationBehavior:(int64_t)a3;
- (void)setGenericSandboxWrapper:(id)a3;
- (void)setIconMode:(BOOL)iconMode;
- (void)setIconVariant:(int64_t)a3;
- (void)setInterpolationQuality:(int)a3;
- (void)setItem:(id)a3;
- (void)setMinimumDimension:(CGFloat)minimumDimension;
- (void)setMostRepresentativeThumbnail:(id)a3;
- (void)setOverriddenContentType:(id)a3;
- (void)setOverriddenContentTypeIdentifier:(id)a3;
- (void)setParentDirectorySandboxWrapper:(id)a3;
- (void)setQuicklookSandboxWrapper:(id)a3;
- (void)setRepresentationTypes:(unint64_t)a3;
- (void)setRequestIsInvalidError:(id)a3;
- (void)setSaveFileHandle:(id)a3;
- (void)setSaveURL:(id)a3;
- (void)setSaveURLContentType:(id)a3;
- (void)setSaveURLSandboxWrapper:(id)a3;
- (void)setScale:(double)a3;
- (void)setShouldUseRestrictedExtension:(BOOL)a3;
- (void)setSize:(CGSize)a3;
- (void)setStatusBlock:(id)a3;
- (void)setThirdPartyVideoDecodersAllowed:(BOOL)a3;
- (void)setTypesForWhichUpdateBlockHasBeenCalled:(unint64_t)a3;
- (void)setUpdateBlock:(id)a3;
- (void)setUuid:(id)a3;
- (void)setWantsBaseline:(BOOL)a3;
@end

@implementation QLThumbnailGenerationRequest

- (BOOL)iconMode
{
  return self->_iconMode;
}

- (id)fileIdentifier
{
  basicFileIdentifier = self->_basicFileIdentifier;
  if (!basicFileIdentifier) {
    basicFileIdentifier = self->_fileProviderFileIdentifier;
  }
  return basicFileIdentifier;
}

- (int)interpolationQuality
{
  return self->_interpolationQuality;
}

- (float)maximumPixelSize
{
  double width = self->_size.width;
  if (width < self->_size.height) {
    double width = self->_size.height;
  }
  return self->_scale * width;
}

- (BOOL)forceGeneration
{
  return [(QLThumbnailGenerationRequest *)self generationBehavior] == 1;
}

- (BOOL)provideCachedResultsOnly
{
  return [(QLThumbnailGenerationRequest *)self generationBehavior] == 0;
}

- (int64_t)generationBehavior
{
  return self->_generationBehavior;
}

- (BOOL)shouldUseRestrictedExtension
{
  return self->_shouldUseRestrictedExtension;
}

- (FPSandboxingURLWrapper)quicklookSandboxWrapper
{
  return self->_quicklookSandboxWrapper;
}

- (CGFloat)minimumDimension
{
  return self->_minimumDimension;
}

- (unint64_t)badgeType
{
  return self->_badgeType;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)finish
{
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (NSError)requestIsInvalidError
{
  return self->_requestIsInvalidError;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (QLThumbnailRepresentation)mostRepresentativeThumbnail
{
  return self->_mostRepresentativeThumbnail;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setUpdateBlock:(id)a3
{
}

- (void)setStatusBlock:(id)a3
{
}

- (void)setCompletionBlock:(id)a3
{
}

- (BOOL)thumbnailRepresentationTypeMatchesRequestedMostRepresentativeType:(int64_t)a3
{
  return ![(QLThumbnailGenerationRequest *)self representationTypes]
      || [(QLThumbnailGenerationRequest *)self requestedMostRepresentativeType] <= a3;
}

- (QLThumbnailGenerationRequestRepresentationTypes)representationTypes
{
  return self->_representationTypes;
}

- (void)markDidBegin
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [(QLThumbnailGenerationRequest *)self setBeginDate:v3];
}

- (void)setBeginDate:(id)a3
{
}

- (int64_t)requestedMostRepresentativeType
{
  if (self->_representationTypes) {
    return flsl(self->_representationTypes & 7) - 1;
  }
  else {
    return 0;
  }
}

- (BOOL)provideGenericIcon
{
  if (self->_representationTypes) {
    return ![(QLThumbnailGenerationRequest *)self resultShouldBeSavedToDisk];
  }
  else {
    return 0;
  }
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UTType)contentType
{
  overriddenContentType = self->_overriddenContentType;
  if (overriddenContentType || (overriddenContentType = self->_contentType) != 0)
  {
    v4 = overriddenContentType;
  }
  else
  {
    v6 = [(QLThumbnailGenerationRequest *)self contentTypeUTI];
    if (v6)
    {
      v7 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v6];
      contentType = self->_contentType;
      self->_contentType = v7;

      v9 = self->_contentType;
      if (!v9)
      {
        v10 = _log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[QLThumbnailGenerationRequest contentType]((uint64_t)v6);
        }

        v9 = self->_contentType;
      }
      v4 = v9;
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (int64_t)iconVariant
{
  return self->_iconVariant;
}

- (CGFloat)scale
{
  return self->_scale;
}

- (NSString)contentTypeUTI
{
  overriddenContentType = self->_overriddenContentType;
  if (overriddenContentType) {
    goto LABEL_3;
  }
  overriddenContentType = self->_contentType;
  if (overriddenContentType) {
    goto LABEL_3;
  }
  overriddenContentTypeIdentifier = self->_overriddenContentTypeIdentifier;
  if (!overriddenContentTypeIdentifier)
  {
    overriddenContentTypeIdentifier = self->_contentTypeUTI;
    if (!overriddenContentTypeIdentifier)
    {
      item = self->_item;
      if (item)
      {
        v8 = [(FPItem *)item contentType];

        if (v8)
        {
          v9 = [(FPItem *)self->_item contentType];
          contentType = self->_contentType;
          self->_contentType = v9;

          overriddenContentType = self->_contentType;
LABEL_3:
          v4 = [(UTType *)overriddenContentType identifier];
          goto LABEL_4;
        }
      }
      else
      {
        v11 = [(QLThumbnailGenerationRequest *)self fileURL];
        if (v11
          || ([(QLThumbnailGenerationRequest *)self genericSandboxWrapper],
              v12 = objc_claimAutoreleasedReturnValue(),
              [v12 url],
              v11 = objc_claimAutoreleasedReturnValue(),
              v12,
              v11))
        {
          if (_CFURLIsItemPromiseAtURL())
          {
            uint64_t v13 = _CFURLCopyLogicalURLOfPromiseAtURL();
            v14 = (void *)v13;
            if (v13) {
              v15 = (void *)v13;
            }
            else {
              v15 = v11;
            }
            id v16 = v15;
          }
          else
          {
            id v16 = v11;
          }
          v17 = +[QLUTIAnalyzer UTIForURL:v16];
          contentTypeUTI = self->_contentTypeUTI;
          self->_contentTypeUTI = v17;
        }
      }
      overriddenContentTypeIdentifier = self->_contentTypeUTI;
    }
  }
  v4 = overriddenContentTypeIdentifier;
LABEL_4:

  return v4;
}

- (QLThumbnailGenerationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"si"];
  double v29 = 0.0;
  double v30 = 0.0;
  [v5 getValue:&v29 size:16];
  v6 = [QLThumbnailGenerationRequest alloc];
  [v4 decodeDoubleForKey:@"sc"];
  double v8 = v7;
  uint64_t v9 = [v4 decodeIntegerForKey:@"rt"];
  v10 = -[QLThumbnailGenerationRequest initWithSize:scale:representationTypes:](v6, "initWithSize:scale:representationTypes:", v9, v29, v30, v8);
  getFPSandboxingURLWrapperClass();
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"quicklookSandboxWrapper"];
  [(QLThumbnailGenerationRequest *)v10 setQuicklookSandboxWrapper:v11];

  getFPSandboxingURLWrapperClass();
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"genericSandboxWrapper"];
  [(QLThumbnailGenerationRequest *)v10 setGenericSandboxWrapper:v12];

  getFPSandboxingURLWrapperClass();
  uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentDirSandboxWrapper"];
  [(QLThumbnailGenerationRequest *)v10 setParentDirectorySandboxWrapper:v13];

  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2050000000;
  v14 = (void *)getFPItemClass_softClass;
  uint64_t v35 = getFPItemClass_softClass;
  if (!getFPItemClass_softClass)
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __getFPItemClass_block_invoke;
    v31[3] = &unk_1E6009910;
    v31[4] = &v32;
    __getFPItemClass_block_invoke((uint64_t)v31);
    v14 = (void *)v33[3];
  }
  id v15 = v14;
  _Block_object_dispose(&v32, 8);
  id v16 = [v4 decodeObjectOfClass:v15 forKey:@"it"];
  [(QLThumbnailGenerationRequest *)v10 setItem:v16];

  v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fpfi"];
  [(QLThumbnailGenerationRequest *)v10 setFileProviderFileIdentifier:v17];

  v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bfi"];
  [(QLThumbnailGenerationRequest *)v10 setBasicFileIdentifier:v18];

  -[QLThumbnailGenerationRequest setIconMode:](v10, "setIconMode:", [v4 decodeBoolForKey:@"i"]);
  -[QLThumbnailGenerationRequest setIconVariant:](v10, "setIconVariant:", [v4 decodeIntegerForKey:@"iv"]);
  -[QLThumbnailGenerationRequest setWantsBaseline:](v10, "setWantsBaseline:", [v4 decodeBoolForKey:@"baseline"]);
  [v4 decodeDoubleForKey:@"ms"];
  -[QLThumbnailGenerationRequest setMinimumDimension:](v10, "setMinimumDimension:");
  v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
  [(QLThumbnailGenerationRequest *)v10 setUuid:v19];

  -[QLThumbnailGenerationRequest setBadgeType:](v10, "setBadgeType:", [v4 decodeIntegerForKey:@"bt"]);
  -[QLThumbnailGenerationRequest setGenerationBehavior:](v10, "setGenerationBehavior:", [v4 decodeIntegerForKey:@"generationBehavior"]);
  v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"oCT"];
  [(QLThumbnailGenerationRequest *)v10 setOverriddenContentType:v20];

  v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"oCTI"];
  [(QLThumbnailGenerationRequest *)v10 setOverriddenContentTypeIdentifier:v21];

  -[QLThumbnailGenerationRequest setInterpolationQuality:](v10, "setInterpolationQuality:", [v4 decodeIntegerForKey:@"interpolationQuality"]);
  -[QLThumbnailGenerationRequest setDownloadingAllowed:](v10, "setDownloadingAllowed:", [v4 decodeBoolForKey:@"downloadingAllowed"]);
  getFPSandboxingURLWrapperClass();
  v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"saveURLSandboxWrapper"];
  [(QLThumbnailGenerationRequest *)v10 setSaveURLSandboxWrapper:v22];

  v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"saveFileHandle"];
  [(QLThumbnailGenerationRequest *)v10 setSaveFileHandle:v23];

  v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"saveURLContentType"];
  [(QLThumbnailGenerationRequest *)v10 setSaveURLContentType:v24];

  v25 = +[QLThumbnailGenerationRequest customExtensionCommunicationEncodedClasses];
  v26 = [v4 decodeObjectOfClasses:v25 forKey:@"etgd"];
  [(QLThumbnailGenerationRequest *)v10 setExternalThumbnailGeneratorData:v26];

  -[QLThumbnailGenerationRequest setShouldUseRestrictedExtension:](v10, "setShouldUseRestrictedExtension:", [v4 decodeBoolForKey:@"shouldUseRestrictedExtension"]);
  v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  [(QLThumbnailGenerationRequest *)v10 setData:v27];

  -[QLThumbnailGenerationRequest setThirdPartyVideoDecodersAllowed:](v10, "setThirdPartyVideoDecodersAllowed:", [v4 decodeBoolForKey:@"thirdPartyVideo"]);
  return v10;
}

- (void)setShouldUseRestrictedExtension:(BOOL)a3
{
  self->_shouldUseRestrictedExtension = a3;
}

- (void)setMinimumDimension:(CGFloat)minimumDimension
{
  self->_minimumDimension = minimumDimension;
}

- (void)setIconVariant:(int64_t)a3
{
  self->_iconVariant = a3;
}

+ (id)_fileProviderFileIdentifierForFPItem:(id)a3
{
  id v3 = a3;
  id v4 = [QLCacheFileProviderFileIdentifier alloc];
  v5 = [v3 itemID];
  v6 = [(QLCacheFileProviderFileIdentifier *)v4 initWithItemID:v5];

  double v7 = [[QLThumbnailVersion alloc] initWithFPItem:v3 automaticallyGenerated:1];
  double v8 = [[QLCacheFileProviderVersionedFileIdentifier alloc] initWithFileIdentifier:v6 version:v7];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveURLContentType, 0);
  objc_storeStrong((id *)&self->_saveFileHandle, 0);
  objc_storeStrong((id *)&self->_saveURLSandboxWrapper, 0);
  objc_storeStrong(&self->_statusBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_mostRepresentativeThumbnail, 0);
  objc_storeStrong((id *)&self->_beginDate, 0);
  objc_storeStrong((id *)&self->_externalThumbnailGeneratorData, 0);
  objc_storeStrong((id *)&self->_requestIsInvalidError, 0);
  objc_storeStrong((id *)&self->_fileProviderFileIdentifier, 0);
  objc_storeStrong((id *)&self->_basicFileIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_parentDirectorySandboxWrapper, 0);
  objc_storeStrong((id *)&self->_genericSandboxWrapper, 0);
  objc_storeStrong((id *)&self->_quicklookSandboxWrapper, 0);
  objc_storeStrong((id *)&self->_overriddenContentType, 0);
  objc_storeStrong((id *)&self->_overriddenContentTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_contentTypeUTI, 0);

  objc_storeStrong((id *)&self->_contentType, 0);
}

- (QLThumbnailGenerationRequest)initWithFPItem:(id)a3 size:(CGSize)a4 scale:(double)a5 representationTypes:(unint64_t)a6
{
  double height = a4.height;
  double width = a4.width;
  id v12 = a3;
  if (!v12) {
    -[QLThumbnailGenerationRequest initWithFPItem:size:scale:representationTypes:]();
  }
  uint64_t v13 = v12;
  v14 = -[QLThumbnailGenerationRequest initWithSize:scale:representationTypes:](self, "initWithSize:scale:representationTypes:", a6, width, height, a5);
  id v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_item, a3);
    uint64_t v16 = [(id)objc_opt_class() _fileProviderFileIdentifierForFPItem:v13];
    fileProviderFileIdentifier = v15->_fileProviderFileIdentifier;
    v15->_fileProviderFileIdentifier = (QLCacheFileProviderVersionedFileIdentifier *)v16;
  }
  return v15;
}

- (QLThumbnailGenerationRequest)initWithSize:(CGSize)a3 scale:(double)a4 representationTypes:(unint64_t)a5
{
  double v6 = a4;
  double height = a3.height;
  double width = a3.width;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  double v10 = round(a3.width * a4 * 1000.0) / 1000.0;
  double v11 = round(a3.height * a4 * 1000.0) / 1000.0;
  double v12 = ceil(v11);
  if (ceil(v10) != v10 || v12 != v11)
  {
    v14 = _log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134219776;
      double v19 = round(width);
      double v20 = round(height);
      double v24 = width;
      double v21 = round(v6);
      __int16 v25 = 2048;
      double v26 = height;
      __int16 v27 = 2048;
      double v28 = v6;
      __int16 v29 = 2048;
      double v30 = v10;
      __int16 v31 = 2048;
      double v32 = v11;
      __int16 v33 = 2048;
      double v34 = v19;
      __int16 v35 = 2048;
      double v36 = v20;
      __int16 v37 = 2048;
      double v38 = v21;
      _os_log_error_impl(&dword_1B281E000, v14, OS_LOG_TYPE_ERROR, "Initialized QLThumbnailGenerationRequest with requested size of non-integer width or height. Passed (%f, %f, %f), making a scaled size of (%f, %f). Will round values to (%f, %f, %f)", buf, 0x52u);
      double v6 = v21;
      double height = v20;
      double width = v19;
    }
    else
    {
      double width = round(width);
      double height = round(height);
      double v6 = round(v6);
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)QLThumbnailGenerationRequest;
  id v15 = [(QLThumbnailGenerationRequest *)&v22 init];
  if (v15)
  {
    uint64_t v16 = [MEMORY[0x1E4F29128] UUID];
    v17 = (void *)*((void *)v15 + 16);
    *((void *)v15 + 16) = v16;

    *((double *)v15 + 34) = width;
    *((double *)v15 + 35) = height;
    *((double *)v15 + 8) = v6;
    *((void *)v15 + 9) = a5;
    *((void *)v15 + 21) = 2;
    *(_OWORD *)(v15 + 152) = xmmword_1B2857830;
    v15[30] = 1;
    v15[27] = 0;
  }
  return (QLThumbnailGenerationRequest *)v15;
}

- (void)setIconMode:(BOOL)iconMode
{
  self->_iconMode = iconMode;
}

- (void)setWantsBaseline:(BOOL)a3
{
  self->_wantsBaseline = a3;
}

- (void)setUuid:(id)a3
{
}

- (void)setThirdPartyVideoDecodersAllowed:(BOOL)a3
{
  self->_thirdPartyVideoDecodersAllowed = a3;
}

- (void)setSaveURLSandboxWrapper:(id)a3
{
}

- (void)setSaveURLContentType:(id)a3
{
  id v10 = a3;
  CFArrayRef v4 = CGImageDestinationCopyTypeIdentifiers();
  if (v10
    && ([v10 identifier],
        v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [(__CFArray *)v4 containsObject:v5],
        v5,
        (v6 & 1) == 0))
  {
    saveURLContentType = [NSString stringWithFormat:@"%@ is not a supported image type", v10];
    uint64_t v9 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"QLThumbnailGeneratorInvalidContentType" reason:saveURLContentType userInfo:0];
    [v9 raise];
  }
  else
  {
    double v7 = (UTType *)v10;
    saveURLContentType = self->_saveURLContentType;
    self->_saveURLContentType = v7;
  }
}

- (void)setSaveFileHandle:(id)a3
{
}

- (void)setQuicklookSandboxWrapper:(id)a3
{
}

- (void)setParentDirectorySandboxWrapper:(id)a3
{
}

- (void)setOverriddenContentTypeIdentifier:(id)a3
{
}

- (void)setOverriddenContentType:(id)a3
{
}

- (void)setItem:(id)a3
{
}

- (void)setInterpolationQuality:(int)a3
{
  self->_interpolationQuality = a3;
}

- (void)setGenericSandboxWrapper:(id)a3
{
}

- (void)setGenerationBehavior:(int64_t)a3
{
  self->_generationBehavior = a3;
}

- (void)setFileProviderFileIdentifier:(id)a3
{
}

- (void)setExternalThumbnailGeneratorData:(id)a3
{
}

- (void)setDownloadingAllowed:(BOOL)a3
{
  self->_downloadingAllowed = a3;
}

- (void)setData:(id)a3
{
}

- (void)setBasicFileIdentifier:(id)a3
{
}

- (void)setBadgeType:(unint64_t)a3
{
  self->_badgeType = a3;
}

+ (id)customExtensionCommunicationEncodedClasses
{
  if (customExtensionCommunicationEncodedClasses_onceToken != -1) {
    dispatch_once(&customExtensionCommunicationEncodedClasses_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)customExtensionCommunicationEncodedClasses__customExtensionCommunicationEncodedClasses;

  return v2;
}

- (BOOL)isDataBased
{
  return self->_data != 0;
}

- (BOOL)resultShouldBeSavedToDisk
{
  id v3 = [(QLThumbnailGenerationRequest *)self saveURL];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(QLThumbnailGenerationRequest *)self saveFileHandle];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (id)saveURL
{
  return (id)[(FPSandboxingURLWrapper *)self->_saveURLSandboxWrapper url];
}

- (NSFileHandle)saveFileHandle
{
  return self->_saveFileHandle;
}

- (BOOL)provideLowQualityThumbnail
{
  if ((self->_representationTypes & 2) != 0
    && ![(QLThumbnailGenerationRequest *)self resultShouldBeSavedToDisk])
  {
    return ![(QLThumbnailGenerationRequest *)self isDataBased];
  }
  else
  {
    return 0;
  }
}

- (BOOL)isValid
{
  if ([(QLThumbnailGenerationRequest *)self isUbiquitous]) {
    return 1;
  }
  BOOL v4 = [(QLThumbnailGenerationRequest *)self quicklookSandboxWrapper];
  if (v4)
  {
    BOOL v3 = 1;
  }
  else
  {
    v5 = [(QLThumbnailGenerationRequest *)self genericSandboxWrapper];
    if (v5) {
      BOOL v3 = 1;
    }
    else {
      BOOL v3 = [(QLThumbnailGenerationRequest *)self isDataBased];
    }
  }
  return v3;
}

- (BOOL)isUbiquitous
{
  v2 = [(QLThumbnailGenerationRequest *)self item];
  BOOL v3 = v2 != 0;

  return v3;
}

- (FPItem)item
{
  return self->_item;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  quicklookSandboxWrapper = self->_quicklookSandboxWrapper;
  id v17 = v4;
  if (quicklookSandboxWrapper) {
    [v4 encodeObject:quicklookSandboxWrapper forKey:@"quicklookSandboxWrapper"];
  }
  genericSandboxWrapper = self->_genericSandboxWrapper;
  if (genericSandboxWrapper) {
    [v17 encodeObject:genericSandboxWrapper forKey:@"genericSandboxWrapper"];
  }
  parentDirectorySandboxWrapper = self->_parentDirectorySandboxWrapper;
  if (parentDirectorySandboxWrapper) {
    [v17 encodeObject:parentDirectorySandboxWrapper forKey:@"parentDirSandboxWrapper"];
  }
  item = self->_item;
  if (item) {
    [v17 encodeObject:item forKey:@"it"];
  }
  fileProviderFileIdentifier = self->_fileProviderFileIdentifier;
  if (fileProviderFileIdentifier) {
    [v17 encodeObject:fileProviderFileIdentifier forKey:@"fpfi"];
  }
  basicFileIdentifier = self->_basicFileIdentifier;
  if (basicFileIdentifier) {
    [v17 encodeObject:basicFileIdentifier forKey:@"bfi"];
  }
  overriddenContentType = self->_overriddenContentType;
  if (overriddenContentType) {
    [v17 encodeObject:overriddenContentType forKey:@"oCT"];
  }
  overriddenContentTypeIdentifier = self->_overriddenContentTypeIdentifier;
  if (overriddenContentTypeIdentifier) {
    [v17 encodeObject:overriddenContentTypeIdentifier forKey:@"oCTI"];
  }
  uint64_t v13 = [MEMORY[0x1E4F29238] valueWithBytes:&self->_size objCType:"{CGSize=dd}"];
  [v17 encodeObject:v13 forKey:@"si"];

  [v17 encodeDouble:@"sc" forKey:self->_scale];
  [v17 encodeBool:self->_iconMode forKey:@"i"];
  [v17 encodeInteger:self->_badgeType forKey:@"bt"];
  [v17 encodeDouble:@"ms" forKey:self->_minimumDimension];
  [v17 encodeInteger:self->_representationTypes forKey:@"rt"];
  [v17 encodeObject:self->_uuid forKey:@"uuid"];
  [v17 encodeInteger:self->_iconVariant forKey:@"iv"];
  [v17 encodeBool:self->_wantsBaseline forKey:@"baseline"];
  [v17 encodeInteger:self->_generationBehavior forKey:@"generationBehavior"];
  [v17 encodeInteger:self->_interpolationQuality forKey:@"interpolationQuality"];
  saveURLSandboxWrapper = self->_saveURLSandboxWrapper;
  if (saveURLSandboxWrapper) {
    [v17 encodeObject:saveURLSandboxWrapper forKey:@"saveURLSandboxWrapper"];
  }
  saveFileHandle = self->_saveFileHandle;
  if (saveFileHandle) {
    [v17 encodeObject:saveFileHandle forKey:@"saveFileHandle"];
  }
  [v17 encodeBool:self->_downloadingAllowed forKey:@"downloadingAllowed"];
  [v17 encodeObject:self->_saveURLContentType forKey:@"saveURLContentType"];
  externalThumbnailGeneratorData = self->_externalThumbnailGeneratorData;
  if (externalThumbnailGeneratorData) {
    [v17 encodeObject:externalThumbnailGeneratorData forKey:@"etgd"];
  }
  [v17 encodeBool:self->_shouldUseRestrictedExtension forKey:@"shouldUseRestrictedExtension"];
  [v17 encodeObject:self->_data forKey:@"data"];
  [v17 encodeBool:self->_thirdPartyVideoDecodersAllowed forKey:@"thirdPartyVideo"];
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setMostRepresentativeThumbnail:(id)a3
{
}

- (NSDate)beginDate
{
  return self->_beginDate;
}

- (unint64_t)externalThumbnailGeneratorDataHash
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  externalThumbnailGeneratorData = self->_externalThumbnailGeneratorData;
  if (externalThumbnailGeneratorData && !self->_externalThumbnailGeneratorDataHash)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = [(NSDictionary *)externalThumbnailGeneratorData allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            self->_externalThumbnailGeneratorDataHash ^= [v9 hash];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
  return self->_externalThumbnailGeneratorDataHash;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)prepareForSending
{
  v68[1] = *MEMORY[0x1E4F143B8];
  if (!self->_item && ![(QLThumbnailGenerationRequest *)self isDataBased])
  {
    uint64_t v61 = 0;
    v62 = (id *)&v61;
    uint64_t v63 = 0x3032000000;
    v64 = __Block_byref_object_copy_;
    v65 = __Block_byref_object_dispose_;
    id v66 = 0;
    uint64_t v58 = 0;
    v59[0] = &v58;
    v59[1] = 0x3032000000;
    v59[2] = __Block_byref_object_copy_;
    v59[3] = __Block_byref_object_dispose_;
    id v60 = 0;
    p_fileURL = &self->_fileURL;
    fileURL = self->_fileURL;
    if (fileURL)
    {
      id v57 = 0;
      BOOL v7 = [(NSURL *)fileURL checkResourceIsReachableAndReturnError:&v57];
      uint64_t v8 = (NSError *)v57;
      if (v7)
      {
        uint64_t v9 = [(NSURL *)*p_fileURL ql_realpathURL];
        [(QLThumbnailGenerationRequest *)self setFileURL:v9];

        if (_CFURLIsItemPromiseAtURL())
        {
          v56 = 0;
          uint64_t v10 = _CFURLCopyLogicalURLOfPromiseAtURL();
          long long v11 = *(void **)(v59[0] + 40);
          *(void *)(v59[0] + 40) = v10;

          if (!*(void *)(v59[0] + 40))
          {
            requestIsInvalidError = self->_requestIsInvalidError;
            self->_requestIsInvalidError = v56;
          }
          objc_storeStrong(v62 + 5, *p_fileURL);
        }
        else
        {
          objc_storeStrong((id *)(v59[0] + 40), *p_fileURL);
          objc_storeStrong(v62 + 5, *p_fileURL);
        }
      }
      else
      {
        int v13 = _CFURLIsItemPromiseAtURL();
        long long v14 = *p_fileURL;
        if (v13)
        {
          objc_storeStrong(v62 + 5, v14);
        }
        else
        {
          objc_storeStrong((id *)(v59[0] + 40), v14);
          uint64_t v15 = _CFURLPromiseCopyPhysicalURL();
          id v16 = v62[5];
          v62[5] = (id)v15;

          id v17 = v62[5];
          if (!v17 || v17 == *(id *)(v59[0] + 40))
          {
            id v18 = objc_alloc_init(MEMORY[0x1E4F28CA0]);
            double v19 = *p_fileURL;
            v54[0] = MEMORY[0x1E4F143A8];
            v54[1] = 3221225472;
            v54[2] = __49__QLThumbnailGenerationRequest_prepareForSending__block_invoke;
            v54[3] = &unk_1E6009938;
            v54[4] = &v58;
            v54[5] = &v61;
            v55 = v8;
            [v18 coordinateReadingItemAtURL:v19 options:5 error:&v55 byAccessor:v54];
            double v20 = v55;
            double v21 = v55;

            if (!*(void *)(v59[0] + 40))
            {
              objc_super v22 = _log();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
                -[QLThumbnailGenerationRequest prepareForSending](&self->_fileURL);
              }

              objc_storeStrong((id *)&self->_requestIsInvalidError, v20);
            }

            uint64_t v8 = v21;
          }
        }
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
    id v23 = v62[5];
    if (!v23 || !*(void *)(v59[0] + 40))
    {
      if (self->_requestIsInvalidError) {
        goto LABEL_41;
      }
      v44 = (void *)MEMORY[0x1E4F28C58];
      v45 = *p_fileURL;
      if (*p_fileURL)
      {
        uint64_t v67 = *MEMORY[0x1E4F289D0];
        v68[0] = v45;
        p_super = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:&v67 count:1];
      }
      else
      {
        p_super = 0;
      }
      v48 = [v44 errorWithDomain:*MEMORY[0x1E4F281F8] code:4 userInfo:p_super];
      v49 = self->_requestIsInvalidError;
      self->_requestIsInvalidError = v48;

      if (!v45) {
        goto LABEL_41;
      }
      goto LABEL_40;
    }
    v53 = v8;
    char v24 = [v23 checkResourceIsReachableAndReturnError:&v53];
    __int16 v25 = v53;

    if (v24)
    {
      double v26 = objc_opt_class();
      id v27 = v62[5];
      v52 = v25;
      double v28 = [v26 _basicFileIdentifierForURL:v27 error:&v52];
      __int16 v29 = v52;

      basicFileIdentifier = self->_basicFileIdentifier;
      self->_basicFileIdentifier = v28;

      if (self->_basicFileIdentifier)
      {
        id FPSandboxingURLWrapperClass = getFPSandboxingURLWrapperClass();
        uint64_t v32 = *(void *)(v59[0] + 40);
        v51 = v29;
        __int16 v33 = [FPSandboxingURLWrapperClass wrapperWithURL:v32 extensionClass:"com.apple.quicklook.readonly" error:&v51];
        double v34 = v51;

        quicklookSandboxWrapper = self->_quicklookSandboxWrapper;
        self->_quicklookSandboxWrapper = v33;

        id v36 = getFPSandboxingURLWrapperClass();
        uint64_t v37 = *(void *)(v59[0] + 40);
        uint64_t v38 = *MEMORY[0x1E4F14000];
        v50 = v34;
        uint64_t v39 = [v36 wrapperWithURL:v37 extensionClass:v38 error:&v50];
        v40 = v50;
        uint64_t v8 = v50;

        genericSandboxWrapper = self->_genericSandboxWrapper;
        self->_genericSandboxWrapper = v39;

        QLTSandboxWrapperForParentURLOf();
        v42 = (FPSandboxingURLWrapper *)objc_claimAutoreleasedReturnValue();
        parentDirectorySandboxWrapper = self->_parentDirectorySandboxWrapper;
        self->_parentDirectorySandboxWrapper = v42;

        if (self->_genericSandboxWrapper && self->_quicklookSandboxWrapper)
        {
          BOOL v3 = 1;
LABEL_42:

          _Block_object_dispose(&v58, 8);
          _Block_object_dispose(&v61, 8);

          return v3;
        }
        objc_storeStrong((id *)&self->_requestIsInvalidError, v40);
        p_super = _log();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
          -[QLThumbnailGenerationRequest prepareForSending]((uint64_t)v59);
        }
        goto LABEL_40;
      }
      v47 = v29;
    }
    else
    {
      v47 = v25;
    }
    uint64_t v8 = v47;
    p_super = &self->_requestIsInvalidError->super;
    self->_requestIsInvalidError = v47;
LABEL_40:

LABEL_41:
    BOOL v3 = 0;
    goto LABEL_42;
  }
  return 1;
}

- (void)cancel
{
}

- (int64_t)mostRepresentativeTypeForWhichUpdateBlockHasBeenCalled
{
  return flsl([(QLThumbnailGenerationRequest *)self typesForWhichUpdateBlockHasBeenCalled])- 1;
}

- (QLThumbnailGenerationRequest)initWithFileAtURL:(NSURL *)url size:(CGSize)size scale:(CGFloat)scale representationTypes:(QLThumbnailGenerationRequestRepresentationTypes)representationTypes
{
  double height = size.height;
  double width = size.width;
  long long v11 = url;
  if (!v11)
  {
    long long v12 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Tried to create QLThumbnailGenerationRequest with a nil url" userInfo:0];
    [v12 raise];
  }
  int v13 = -[QLThumbnailGenerationRequest initWithSize:scale:representationTypes:](self, "initWithSize:scale:representationTypes:", representationTypes, width, height, scale);
  if (v13)
  {
    id v16 = 0;
    [(NSURL *)v11 getResourceValue:&v16 forKey:@"FPUnflattenedPackageURL" error:0];
    if (v16) {
      long long v14 = v16;
    }
    else {
      long long v14 = v11;
    }
    objc_storeStrong((id *)&v13->_fileURL, v14);
  }

  return v13;
}

- (QLThumbnailGenerationRequest)initWithData:(id)a3 contentType:(id)a4 size:(CGSize)a5 scale:(double)a6 representationTypes:(unint64_t)a7
{
  double height = a5.height;
  double width = a5.width;
  id v14 = a3;
  id v15 = a4;
  if (!v14 || (id v16 = v15) == 0) {
    -[QLThumbnailGenerationRequest initWithData:contentType:size:scale:representationTypes:]();
  }
  id v17 = -[QLThumbnailGenerationRequest initWithSize:scale:representationTypes:](self, "initWithSize:scale:representationTypes:", a7, width, height, a6);
  id v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_data, a3);
    [(QLThumbnailGenerationRequest *)v18 setContentTypeUTI:v16];
  }

  return v18;
}

+ (QLThumbnailGenerationRequest)requestWithThumbnailRequest:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v5 = v3;
    uint64_t v6 = [QLThumbnailGenerationRequest alloc];
    if (isKindOfClass)
    {
      BOOL v7 = [v5 item];
      [v5 size];
      double v9 = v8;
      double v11 = v10;
      [v5 scale];
      double v13 = v12;

      id v14 = -[QLThumbnailGenerationRequest initWithFPItem:size:scale:representationTypes:](v6, "initWithFPItem:size:scale:representationTypes:", v7, -1, v9, v11, v13);
    }
    else
    {
      BOOL v7 = [v5 genericSandboxWrapper];
      id v15 = [v7 url];
      [v5 size];
      double v17 = v16;
      double v19 = v18;
      [v5 scale];
      double v21 = v20;

      id v14 = -[QLThumbnailGenerationRequest initWithFileAtURL:size:scale:representationTypes:](v6, "initWithFileAtURL:size:scale:representationTypes:", v15, -1, v17, v19, v21);
    }

    [v5 minimumDimension];
    -[QLThumbnailGenerationRequest setMinimumDimension:](v14, "setMinimumDimension:");
    -[QLThumbnailGenerationRequest setBadgeType:](v14, "setBadgeType:", [v5 badgeType]);
    -[QLThumbnailGenerationRequest setIconMode:](v14, "setIconMode:", [v5 iconMode]);
    -[QLThumbnailGenerationRequest setWantsBaseline:](v14, "setWantsBaseline:", [v5 wantsBaseline]);
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)setSaveURL:(id)a3
{
  id v4 = a3;
  id FPSandboxingURLWrapperClass = getFPSandboxingURLWrapperClass();
  uint64_t v6 = *MEMORY[0x1E4F14008];
  id v12 = 0;
  BOOL v7 = [FPSandboxingURLWrapperClass wrapperWithURL:v4 extensionClass:v6 error:&v12];
  id v8 = v12;
  id v9 = v12;
  saveURLSandboxWrapper = self->_saveURLSandboxWrapper;
  self->_saveURLSandboxWrapper = v7;

  if (!self->_saveURLSandboxWrapper || v9)
  {
    double v11 = _log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[QLThumbnailGenerationRequest setSaveURL:]((uint64_t)v4);
    }

    objc_storeStrong((id *)&self->_requestIsInvalidError, v8);
  }
}

- (void)setContentType:(UTType *)contentType
{
  objc_storeStrong((id *)&self->_overriddenContentType, contentType);
  id v8 = contentType;
  overriddenContentTypeIdentifier = self->_overriddenContentTypeIdentifier;
  self->_overriddenContentTypeIdentifier = 0;

  uint64_t v6 = self->_contentType;
  self->_contentType = 0;

  contentTypeUTI = self->_contentTypeUTI;
  self->_contentTypeUTI = 0;
}

- (void)setContentTypeUTI:(id)a3
{
  id v4 = (NSString *)a3;
  overriddenContentType = self->_overriddenContentType;
  self->_overriddenContentType = 0;

  overriddenContentTypeIdentifier = self->_overriddenContentTypeIdentifier;
  self->_overriddenContentTypeIdentifier = v4;
  id v9 = v4;

  contentType = self->_contentType;
  self->_contentType = 0;

  contentTypeUTI = self->_contentTypeUTI;
  self->_contentTypeUTI = 0;
}

- (BOOL)provideFullResolutionThumbnail
{
  return (LOBYTE(self->_representationTypes) >> 2) & 1;
}

- (BOOL)isFileBased
{
  id v3 = [(FPSandboxingURLWrapper *)self->_quicklookSandboxWrapper url];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(FPSandboxingURLWrapper *)self->_genericSandboxWrapper url];
    if (v5) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = self->_fileURL != 0;
    }
  }
  return v4;
}

- (id)equivalentFPItemRequestWithItem:(id)a3 representationTypes:(unint64_t)a4
{
  id v6 = a3;
  BOOL v7 = [QLThumbnailGenerationRequest alloc];
  [(QLThumbnailGenerationRequest *)self size];
  double v9 = v8;
  double v11 = v10;
  [(QLThumbnailGenerationRequest *)self scale];
  double v13 = -[QLThumbnailGenerationRequest initWithFPItem:size:scale:representationTypes:](v7, "initWithFPItem:size:scale:representationTypes:", v6, a4, v9, v11, v12);

  [(QLThumbnailGenerationRequest *)v13 setIconMode:[(QLThumbnailGenerationRequest *)self iconMode]];
  [(QLThumbnailGenerationRequest *)v13 setIconVariant:[(QLThumbnailGenerationRequest *)self iconVariant]];
  [(QLThumbnailGenerationRequest *)v13 setInterpolationQuality:[(QLThumbnailGenerationRequest *)self interpolationQuality]];
  [(QLThumbnailGenerationRequest *)self minimumDimension];
  -[QLThumbnailGenerationRequest setMinimumDimension:](v13, "setMinimumDimension:");
  [(QLThumbnailGenerationRequest *)v13 setBadgeType:[(QLThumbnailGenerationRequest *)self badgeType]];
  id v14 = [(QLThumbnailGenerationRequest *)self saveURLSandboxWrapper];
  [(QLThumbnailGenerationRequest *)v13 setSaveURLSandboxWrapper:v14];

  id v15 = [(QLThumbnailGenerationRequest *)self saveFileHandle];
  [(QLThumbnailGenerationRequest *)v13 setSaveFileHandle:v15];

  double v16 = [(QLThumbnailGenerationRequest *)self saveURLContentType];
  [(QLThumbnailGenerationRequest *)v13 setSaveURLContentType:v16];

  [(QLThumbnailGenerationRequest *)v13 setDownloadingAllowed:[(QLThumbnailGenerationRequest *)self isDownloadingAllowed]];
  [(QLThumbnailGenerationRequest *)v13 setShouldUseRestrictedExtension:[(QLThumbnailGenerationRequest *)self shouldUseRestrictedExtension]];

  return v13;
}

+ (id)_basicFileIdentifierForURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [[QLCacheBasicFileIdentifier alloc] initWithFileURL:v5 error:a4];
  if (v6)
  {
    BOOL v7 = [[QLThumbnailVersion alloc] initWithFileURL:v5 automaticallyGenerated:1];
    double v8 = [[QLCacheBasicVersionedFileIdentifier alloc] initWithFileIdentifier:v6 version:v7];
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

uint64_t __74__QLThumbnailGenerationRequest_customExtensionCommunicationEncodedClasses__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  customExtensionCommunicationEncodedClasses__customExtensionCommunicationEncodedClasses = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);

  return MEMORY[0x1F41817F8]();
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(QLThumbnailGenerationRequest *)self iconMode];
  int v6 = [v4 iconMode];
  if (!v5 && (v6 & 1) != 0) {
    goto LABEL_3;
  }
  if ((!v5 | v6) != 1) {
    goto LABEL_9;
  }
  unint64_t v8 = [(QLThumbnailGenerationRequest *)self badgeType];
  uint64_t v9 = [v4 badgeType];
  if (!v8 && v9)
  {
LABEL_3:
    int64_t v7 = -1;
    goto LABEL_10;
  }
  if (v8 && !v9)
  {
LABEL_9:
    int64_t v7 = 1;
    goto LABEL_10;
  }
  int64_t v11 = [(QLThumbnailGenerationRequest *)self iconVariant];
  if (v11 == [v4 iconVariant])
  {
    [(QLThumbnailGenerationRequest *)self maximumPixelSize];
    float v13 = v12;
    [v4 maximumPixelSize];
    if (v13 >= v14)
    {
      [(QLThumbnailGenerationRequest *)self maximumPixelSize];
      float v24 = v23;
      [v4 maximumPixelSize];
      if (v24 > v25) {
        goto LABEL_9;
      }
    }
    else
    {
      [(QLThumbnailGenerationRequest *)self minimumDimension];
      double v16 = v15;
      [v4 minimumDimension];
      if (v16 != v17)
      {
        [(QLThumbnailGenerationRequest *)self minimumDimension];
        double v19 = v18;
        [v4 minimumDimension];
        if (v19 > v20) {
          int64_t v7 = 1;
        }
        else {
          int64_t v7 = -1;
        }
        goto LABEL_10;
      }
    }
    int v26 = [(QLThumbnailGenerationRequest *)self interpolationQuality];
    if (v26 == [v4 interpolationQuality])
    {
      int64_t v7 = 0;
      goto LABEL_10;
    }
    int v27 = [(QLThumbnailGenerationRequest *)self interpolationQuality];
    BOOL v22 = v27 < (int)[v4 interpolationQuality];
  }
  else
  {
    uint64_t v21 = [(QLThumbnailGenerationRequest *)self iconVariant];
    BOOL v22 = v21 < [v4 iconVariant];
  }
  if (v22) {
    int64_t v7 = -1;
  }
  else {
    int64_t v7 = 1;
  }
LABEL_10:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSize:scale:representationTypes:", self->_representationTypes, self->_size.width, self->_size.height, self->_scale);
  [v4 setQuicklookSandboxWrapper:self->_quicklookSandboxWrapper];
  [v4 setGenericSandboxWrapper:self->_genericSandboxWrapper];
  [v4 setParentDirectorySandboxWrapper:self->_parentDirectorySandboxWrapper];
  [v4 setItem:self->_item];
  [v4 setOverriddenContentType:self->_overriddenContentType];
  [v4 setOverriddenContentTypeIdentifier:self->_overriddenContentTypeIdentifier];
  [v4 setBasicFileIdentifier:self->_basicFileIdentifier];
  [v4 setFileProviderFileIdentifier:self->_fileProviderFileIdentifier];
  [v4 setIconMode:self->_iconMode];
  [v4 setIconVariant:self->_iconVariant];
  [v4 setWantsBaseline:self->_wantsBaseline];
  [v4 setMinimumDimension:self->_minimumDimension];
  [v4 setUuid:self->_uuid];
  [v4 setBadgeType:self->_badgeType];
  [v4 setGenerationBehavior:self->_generationBehavior];
  [v4 setInterpolationQuality:self->_interpolationQuality];
  [v4 setDownloadingAllowed:self->_downloadingAllowed];
  [v4 setSaveURLSandboxWrapper:self->_saveURLSandboxWrapper];
  [v4 setSaveFileHandle:self->_saveFileHandle];
  [v4 setSaveURLContentType:self->_saveURLContentType];
  [v4 setExternalThumbnailGeneratorData:self->_externalThumbnailGeneratorData];
  [v4 setShouldUseRestrictedExtension:self->_shouldUseRestrictedExtension];
  [v4 setThirdPartyVideoDecodersAllowed:self->_thirdPartyVideoDecodersAllowed];
  [v4 setData:self->_data];
  return v4;
}

- (id)copyWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  BOOL v5 = (void *)[(QLThumbnailGenerationRequest *)self copy];
  objc_msgSend(v5, "setSize:", width, height);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (QLThumbnailGenerationRequest *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = v4;
      int v6 = [(QLThumbnailGenerationRequest *)self fileIdentifier];
      uint64_t v7 = [(QLThumbnailGenerationRequest *)v5 fileIdentifier];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        unint64_t v8 = (void *)v7;
        uint64_t v9 = [(QLThumbnailGenerationRequest *)self fileIdentifier];
        double v10 = [(QLThumbnailGenerationRequest *)v5 fileIdentifier];
        int v11 = [v9 isEqual:v10];

        if (!v11)
        {
          char v12 = 0;
LABEL_25:

          goto LABEL_26;
        }
      }
      uuid = self->_uuid;
      float v14 = [(QLThumbnailGenerationRequest *)v5 uuid];
      if (![(NSUUID *)uuid isEqual:v14]) {
        goto LABEL_23;
      }
      [(QLThumbnailGenerationRequest *)v5 size];
      char v12 = 0;
      if (self->_size.width != v16 || self->_size.height != v15) {
        goto LABEL_24;
      }
      double scale = self->_scale;
      [(QLThumbnailGenerationRequest *)v5 scale];
      if (scale != v18) {
        goto LABEL_23;
      }
      BOOL iconMode = self->_iconMode;
      if (iconMode != [(QLThumbnailGenerationRequest *)v5 iconMode]
        || (unint64_t badgeType = self->_badgeType, badgeType != [(QLThumbnailGenerationRequest *)v5 badgeType])
        || (double minimumDimension = self->_minimumDimension,
            [(QLThumbnailGenerationRequest *)v5 minimumDimension],
            minimumDimension != v22)
        || (unint64_t representationTypes = self->_representationTypes,
            representationTypes != [(QLThumbnailGenerationRequest *)v5 representationTypes])
        || (int64_t iconVariant = self->_iconVariant,
            iconVariant != [(QLThumbnailGenerationRequest *)v5 iconVariant])
        || (BOOL wantsBaseline = self->_wantsBaseline,
            wantsBaseline != [(QLThumbnailGenerationRequest *)v5 wantsBaseline])
        || (int interpolationQuality = self->_interpolationQuality,
            interpolationQuality != [(QLThumbnailGenerationRequest *)v5 interpolationQuality]))
      {
LABEL_23:
        char v12 = 0;
LABEL_24:

        goto LABEL_25;
      }
      externalThumbnailGeneratorData = self->_externalThumbnailGeneratorData;
      double v28 = [(QLThumbnailGenerationRequest *)v5 externalThumbnailGeneratorData];
      if (externalThumbnailGeneratorData != v28)
      {
        __int16 v29 = self->_externalThumbnailGeneratorData;
        double v30 = [(QLThumbnailGenerationRequest *)v5 externalThumbnailGeneratorData];
        if (![(NSDictionary *)v29 isEqual:v30])
        {
          char v12 = 0;
          goto LABEL_39;
        }
        v42 = v30;
      }
      overriddenContentType = self->_overriddenContentType;
      __int16 v33 = [(QLThumbnailGenerationRequest *)v5 overriddenContentType];
      if (overriddenContentType == v33)
      {
        v40 = externalThumbnailGeneratorData;
      }
      else
      {
        double v34 = self->_overriddenContentType;
        v41 = [(QLThumbnailGenerationRequest *)v5 overriddenContentType];
        if (!-[UTType isEqual:](v34, "isEqual:"))
        {
          char v12 = 0;
          double v30 = v42;
          goto LABEL_37;
        }
        v40 = externalThumbnailGeneratorData;
      }
      overriddenContentTypeIdentifier = self->_overriddenContentTypeIdentifier;
      uint64_t v36 = [(QLThumbnailGenerationRequest *)v5 overriddenContentTypeIdentifier];
      if (overriddenContentTypeIdentifier == (NSString *)v36)
      {

        char v12 = 1;
      }
      else
      {
        uint64_t v37 = (void *)v36;
        uint64_t v38 = self->_overriddenContentTypeIdentifier;
        uint64_t v39 = [(QLThumbnailGenerationRequest *)v5 overriddenContentTypeIdentifier];
        char v12 = [(NSString *)v38 isEqual:v39];
      }
      double v30 = v42;
      externalThumbnailGeneratorData = v40;
      if (overriddenContentType == v33)
      {
LABEL_38:

        if (externalThumbnailGeneratorData == v28)
        {
LABEL_40:

          goto LABEL_24;
        }
LABEL_39:

        goto LABEL_40;
      }
LABEL_37:

      goto LABEL_38;
    }
    char v12 = 0;
  }
LABEL_26:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = [(QLThumbnailGenerationRequest *)self fileIdentifier];
  uint64_t v4 = [v3 hash];
  unint64_t width = (unint64_t)self->_size.width;
  unint64_t v6 = v4 ^ [(NSUUID *)self->_uuid hash] ^ width;

  return v6;
}

- (id)description
{
  if ([(QLThumbnailGenerationRequest *)self iconMode])
  {
    uint64_t v3 = [NSString stringWithFormat:@"(icon mode, variant %lu)", -[QLThumbnailGenerationRequest iconVariant](self, "iconVariant")];
  }
  else
  {
    uint64_t v3 = &stru_1F0A8F3F8;
  }
  if ([(QLThumbnailGenerationRequest *)self badgeType])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(badge %lu)", -[QLThumbnailGenerationRequest badgeType](self, "badgeType"));
    uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v4 = &stru_1F0A8F3F8;
  }
  v47 = v4;
  if ([(QLThumbnailGenerationRequest *)self isFileBased])
  {
    id v45 = [NSString alloc];
    BOOL v5 = (objc_class *)objc_opt_class();
    uint64_t v44 = NSStringFromClass(v5);
    uint64_t v6 = [(QLThumbnailGenerationRequest *)self uuid];
    uint64_t v7 = [(QLThumbnailGenerationRequest *)self genericSandboxWrapper];
    unint64_t v8 = [v7 url];
    uint64_t v9 = [v8 lastPathComponent];
    [(QLThumbnailGenerationRequest *)self fileIdentifier];
    v11 = double v10 = v3;
    QLThumbnailGenerationRequestRepresentationTypes v12 = [(QLThumbnailGenerationRequest *)self representationTypes];
    [(QLThumbnailGenerationRequest *)self size];
    uint64_t v14 = v13;
    [(QLThumbnailGenerationRequest *)self size];
    uint64_t v16 = v15;
    double v17 = [(QLThumbnailGenerationRequest *)self _stateDescription];
    double v18 = v47;
    QLThumbnailGenerationRequestRepresentationTypes v42 = v12;
    double v19 = (void *)v6;
    double v20 = (void *)v44;
    uint64_t v21 = (void *)[v45 initWithFormat:@"<%@:%p uuid:%@ %@ (fi:%@) (rt:%lu) {%g,%g} %@ %@ - %@>", v44, self, v19, v9, v11, v42, v14, v16, v10, v47, v17];

    uint64_t v3 = v10;
  }
  else
  {
    BOOL v22 = [(QLThumbnailGenerationRequest *)self isUbiquitous];
    id v46 = [NSString alloc];
    float v23 = (objc_class *)objc_opt_class();
    uint64_t v24 = NSStringFromClass(v23);
    uint64_t v25 = [(QLThumbnailGenerationRequest *)self uuid];
    if (v22)
    {
      uint64_t v7 = [(FPItem *)self->_item providerDomainID];
      unint64_t v8 = [(FPItem *)self->_item itemIdentifier];
      uint64_t v9 = [(FPItem *)self->_item displayName];
      QLThumbnailGenerationRequestRepresentationTypes v26 = [(QLThumbnailGenerationRequest *)self representationTypes];
      [(QLThumbnailGenerationRequest *)self size];
      uint64_t v28 = v27;
      [(QLThumbnailGenerationRequest *)self size];
      uint64_t v30 = v29;
      __int16 v31 = [(QLThumbnailGenerationRequest *)self _stateDescription];
      double v18 = v47;
      QLThumbnailGenerationRequestRepresentationTypes v43 = v26;
      double v19 = (void *)v25;
      uint64_t v39 = v25;
      double v20 = (void *)v24;
      uint64_t v21 = (void *)[v46 initWithFormat:@"<%@:%p uuid:%@ %@/%@ (%@) (rt:%lu) {%g, %g} %@ %@ - %@>", v24, self, v39, v7, v8, v9, v43, v28, v30, v3, v47, v31];
    }
    else
    {
      uint64_t v7 = [(QLThumbnailGenerationRequest *)self data];
      uint64_t v32 = [v7 length];
      unint64_t v8 = [(QLThumbnailGenerationRequest *)self contentTypeUTI];
      QLThumbnailGenerationRequestRepresentationTypes v33 = [(QLThumbnailGenerationRequest *)self representationTypes];
      [(QLThumbnailGenerationRequest *)self size];
      uint64_t v35 = v34;
      [(QLThumbnailGenerationRequest *)self size];
      uint64_t v37 = v36;
      uint64_t v9 = [(QLThumbnailGenerationRequest *)self _stateDescription];
      double v18 = v47;
      uint64_t v40 = v25;
      uint64_t v41 = v32;
      double v19 = (void *)v25;
      double v20 = (void *)v24;
      uint64_t v21 = (void *)[v46 initWithFormat:@"<%@:%p uuid:%@ (data request, l: %lu, %@) (rt:%lu) {%g, %g} %@ %@ - %@>", v24, self, v40, v41, v8, v33, v35, v37, v3, v47, v9];
    }
  }

  return v21;
}

- (id)_stateDescription
{
  if ([(QLThumbnailGenerationRequest *)self isCancelled]) {
    return @"Cancelled";
  }
  if ([(QLThumbnailGenerationRequest *)self isFinished]) {
    return @"Finished";
  }
  uint64_t v4 = [(QLThumbnailGenerationRequest *)self beginDate];

  if (v4) {
    return @"Running";
  }
  else {
    return @"Not started";
  }
}

void __49__QLThumbnailGenerationRequest_prepareForSending__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v3, "ql_realpathURL");
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = _CFURLPromiseCopyPhysicalURL();
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (void)noteUpdateBlockHasBeenCalledForType:(int64_t)a3
{
  self->_typesForWhichUpdateBlockHasBeenCalled |= 1 << a3;
}

- (NSString)overriddenContentTypeIdentifier
{
  return self->_overriddenContentTypeIdentifier;
}

- (UTType)overriddenContentType
{
  return self->_overriddenContentType;
}

- (BOOL)thirdPartyVideoDecodersAllowed
{
  return self->_thirdPartyVideoDecodersAllowed;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void)setScale:(double)a3
{
  self->_double scale = a3;
}

- (void)setRepresentationTypes:(unint64_t)a3
{
  self->_unint64_t representationTypes = a3;
}

- (FPSandboxingURLWrapper)genericSandboxWrapper
{
  return self->_genericSandboxWrapper;
}

- (FPSandboxingURLWrapper)parentDirectorySandboxWrapper
{
  return self->_parentDirectorySandboxWrapper;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (QLCacheBasicVersionedFileIdentifier)basicFileIdentifier
{
  return self->_basicFileIdentifier;
}

- (QLCacheFileProviderVersionedFileIdentifier)fileProviderFileIdentifier
{
  return self->_fileProviderFileIdentifier;
}

- (BOOL)wantsBaseline
{
  return self->_wantsBaseline;
}

- (void)setRequestIsInvalidError:(id)a3
{
}

- (NSDictionary)externalThumbnailGeneratorData
{
  return self->_externalThumbnailGeneratorData;
}

- (void)setExternalThumbnailGeneratorDataHash:(unint64_t)a3
{
  self->_externalThumbnailGeneratorDataHash = a3;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (id)statusBlock
{
  return self->_statusBlock;
}

- (FPSandboxingURLWrapper)saveURLSandboxWrapper
{
  return self->_saveURLSandboxWrapper;
}

- (BOOL)isDownloadingAllowed
{
  return self->_downloadingAllowed;
}

- (UTType)saveURLContentType
{
  return self->_saveURLContentType;
}

- (unint64_t)typesForWhichUpdateBlockHasBeenCalled
{
  return self->_typesForWhichUpdateBlockHasBeenCalled;
}

- (void)setTypesForWhichUpdateBlockHasBeenCalled:(unint64_t)a3
{
  self->_typesForWhichUpdateBlockHasBeenCalled = a3;
}

- (void)initWithFPItem:size:scale:representationTypes:.cold.1()
{
  __assert_rtn("-[QLThumbnailGenerationRequest initWithFPItem:size:scale:representationTypes:]", "QLThumbnailGenerationRequest.m", 126, "item != nil");
}

- (void)initWithData:contentType:size:scale:representationTypes:.cold.1()
{
  __assert_rtn("-[QLThumbnailGenerationRequest initWithData:contentType:size:scale:representationTypes:]", "QLThumbnailGenerationRequest.m", 143, "data != nil && contentType != nil");
}

- (void)setSaveURL:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v1, v2, "Could not create a FPSandboxingURLWrapper for save URL %@ for thumbnail request. Error: %@", (void)v3, DWORD2(v3));
}

- (void)contentType
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v1, v2, "Invalid type identifier %@ set on %@", (void)v3, DWORD2(v3));
}

- (void)prepareForSending
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v1, v2, "Could not coordinate to tag potentially logical URL %@: %@", (void)v3, DWORD2(v3));
}

@end