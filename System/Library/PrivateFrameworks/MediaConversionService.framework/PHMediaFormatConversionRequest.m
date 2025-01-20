@interface PHMediaFormatConversionRequest
+ (BOOL)hasInternalDiagnostics;
+ (double)bitsPerPixelWithImageDimensions:(CGSize)a3 fileLength:(unint64_t)a4;
+ (double)heifToJPEGFactorForBitsPerPixel:(double)a3;
+ (double)heifToJPEGFactorWithImageDimensions:(CGSize)a3 fileLength:(unint64_t)a4;
+ (id)requestForSource:(id)a3 destinationCapabilities:(id)a4 error:(id *)a5;
+ (id)stringForRequestStatus:(int64_t)a3;
- (BOOL)_calculateRequiresFormatConversion;
- (BOOL)destinationCapabilitiesHintsIndicateSupportForSource;
- (BOOL)forceFormatConversion;
- (BOOL)isCompositeRequest;
- (BOOL)preflighted;
- (BOOL)prepareWithError:(id *)a3;
- (BOOL)requiresAccessibilityDescriptionMetadataChange;
- (BOOL)requiresCaptionMetadataChange;
- (BOOL)requiresCreationDateMetadataChange;
- (BOOL)requiresFormatConversion;
- (BOOL)requiresLivePhotoPairingIdentifierChange;
- (BOOL)requiresLocationMetadataChange;
- (BOOL)requiresMetadataChanges;
- (BOOL)requiresPassthroughConversion;
- (BOOL)requiresSinglePassVideoConversion;
- (BOOL)shouldExportAsHDR;
- (BOOL)shouldPadOutputFileToEstimatedLength;
- (BOOL)shouldStripLocation;
- (BOOL)sourceSupportsPassthroughConversion;
- (BOOL)useTransferBehaviorUserPreference;
- (BOOL)userPreferenceProhibitsFormatConversion;
- (CLLocation)location;
- (NSDate)creationDate;
- (NSError)error;
- (NSProgress)progress;
- (NSString)accessibilityDescription;
- (NSString)caption;
- (NSString)description;
- (NSString)livePhotoPairingIdentifier;
- (NSString)outputFileType;
- (NSString)outputFilename;
- (NSString)outputPathExtension;
- (NSString)statusString;
- (NSString)videoExportPreset;
- (NSTimeZone)creationDateTimeZone;
- (NSURL)directoryForTemporaryFiles;
- (NSUUID)identifier;
- (PFMediaCapabilities)destinationCapabilities;
- (PHMediaFormatConversionCompositeRequest)parentRequest;
- (PHMediaFormatConversionDestination)destination;
- (PHMediaFormatConversionRequest)init;
- (PHMediaFormatConversionSource)source;
- (double)formatConversionExpansionFactor;
- (id)singlePassVideoConversionUpdateHandler;
- (id)userInfo;
- (int64_t)accessibilityDescriptionMetadataBehavior;
- (int64_t)backwardsCompatibilityStatus;
- (int64_t)captionMetadataBehavior;
- (int64_t)creationDateMetadataBehavior;
- (int64_t)livePhotoPairingIdentifierBehavior;
- (int64_t)locationMetadataBehavior;
- (int64_t)passthroughConversionAdditionalByteCount;
- (int64_t)status;
- (int64_t)transferBehaviorUserPreference;
- (unint64_t)estimatedOutputFileLength;
- (void)didFinishProcessing;
- (void)enableSinglePassVideoEncodingWithUpdateHandler:(id)a3;
- (void)markAsCancelled;
- (void)padOutputFileToEstimatedLength;
- (void)preflightWithConversionManager:(id)a3;
- (void)setAccessibilityDescriptionMetadataBehavior:(int64_t)a3 withAccessibilityDescription:(id)a4;
- (void)setCaptionMetadataBehavior:(int64_t)a3 withCaption:(id)a4;
- (void)setCreationDateMetadataBehavior:(int64_t)a3 withCreationDate:(id)a4 inTimeZone:(id)a5;
- (void)setDestination:(id)a3;
- (void)setDestinationCapabilities:(id)a3;
- (void)setDirectoryForTemporaryFiles:(id)a3;
- (void)setError:(id)a3;
- (void)setForceFormatConversion:(BOOL)a3;
- (void)setFormatConversionExpansionFactor:(double)a3;
- (void)setLivePhotoPairingIdentifier:(id)a3;
- (void)setLivePhotoPairingIdentifierBehavior:(int64_t)a3;
- (void)setLocationMetadataBehavior:(int64_t)a3 withLocation:(id)a4;
- (void)setOutputFilename:(id)a3;
- (void)setParentRequest:(id)a3;
- (void)setPassthroughConversionAdditionalByteCount:(int64_t)a3;
- (void)setPreflighted:(BOOL)a3;
- (void)setProgress:(id)a3;
- (void)setRequiresSinglePassVideoConversion:(BOOL)a3;
- (void)setShouldExportAsHDR:(BOOL)a3;
- (void)setShouldPadOutputFileToEstimatedLength:(BOOL)a3;
- (void)setShouldStripLocation:(BOOL)a3;
- (void)setSinglePassVideoConversionUpdateHandler:(id)a3;
- (void)setSource:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setTransferBehaviorUserPreference:(int64_t)a3;
- (void)setUseTransferBehaviorUserPreference:(BOOL)a3;
- (void)setUserInfo:(id)a3;
- (void)setVideoExportPreset:(id)a3;
- (void)setupProgress;
- (void)updateSinglePassVideoConversionStatus:(int64_t)a3 addedRange:(_NSRange)a4 error:(id)a5;
@end

@implementation PHMediaFormatConversionRequest

- (int64_t)backwardsCompatibilityStatus
{
  if ([(PHMediaFormatConversionRequest *)self requiresFormatConversion]) {
    return 2;
  }
  if ([(PHMediaFormatConversionRequest *)self requiresPassthroughConversion]) {
    return 2;
  }
  v3 = [(PHMediaFormatConversionRequest *)self videoExportPreset];

  if (v3) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)requiresPassthroughConversion
{
  BOOL v3 = [(PHMediaFormatConversionRequest *)self useTransferBehaviorUserPreference];
  BOOL v4 = [(PHMediaFormatConversionRequest *)self userPreferenceProhibitsFormatConversion];
  if (v3 && v4
    || [(PHMediaFormatConversionRequest *)self requiresFormatConversion]
    || ![(PHMediaFormatConversionRequest *)self requiresMetadataChanges])
  {
    return 0;
  }
  return [(PHMediaFormatConversionRequest *)self sourceSupportsPassthroughConversion];
}

- (BOOL)requiresMetadataChanges
{
  BOOL v3 = [(PHMediaFormatConversionRequest *)self source];
  BOOL v4 = [v3 renderOriginatingSignature];
  BOOL v5 = v4
    || [(PHMediaFormatConversionRequest *)self requiresLivePhotoPairingIdentifierChange]|| [(PHMediaFormatConversionRequest *)self requiresLocationMetadataChange]|| [(PHMediaFormatConversionRequest *)self requiresCreationDateMetadataChange]|| [(PHMediaFormatConversionRequest *)self requiresCaptionMetadataChange]|| [(PHMediaFormatConversionRequest *)self requiresAccessibilityDescriptionMetadataChange];

  return v5;
}

- (BOOL)requiresFormatConversion
{
  if (self->_didCalculateRequiresFormatConversion) {
    return self->_requiresFormatConversion;
  }
  self->_didCalculateRequiresFormatConversion = 1;
  BOOL result = [(PHMediaFormatConversionRequest *)self _calculateRequiresFormatConversion];
  self->_requiresFormatConversion = result;
  return result;
}

- (PHMediaFormatConversionSource)source
{
  return (PHMediaFormatConversionSource *)objc_getProperty(self, a2, 112, 1);
}

- (BOOL)requiresLocationMetadataChange
{
  if ([(PHMediaFormatConversionRequest *)self locationMetadataBehavior] == 1)
  {
    BOOL v3 = [(PHMediaFormatConversionRequest *)self source];
    BOOL v4 = [v3 locationMetadataStatus] == 2;
  }
  else
  {
    BOOL v4 = 0;
  }
  if ([(PHMediaFormatConversionRequest *)self locationMetadataBehavior] == 2)
  {
    BOOL v5 = [(PHMediaFormatConversionRequest *)self location];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  return v4 || v6;
}

- (int64_t)locationMetadataBehavior
{
  return self->_locationMetadataBehavior;
}

- (BOOL)userPreferenceProhibitsFormatConversion
{
  return [(PHMediaFormatConversionRequest *)self transferBehaviorUserPreference] == 1;
}

- (BOOL)destinationCapabilitiesHintsIndicateSupportForSource
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PHMediaFormatConversionRequest *)self destinationCapabilities];
  BOOL v4 = [v3 outOfBandHints];

  if (v4)
  {
    BOOL v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8CF00]];
    BOOL v6 = v5;
    if (v5
      && [v5 integerValue] == 1
      && [(PHMediaFormatConversionSource *)self->_source containsProResVideoWithFormatEligibleForTranscoding])
    {
      LOBYTE(v7) = 1;
    }
    else
    {
      if ([(PHMediaFormatConversionContent *)self->_source isVideo]
        && [(PHMediaFormatConversionSource *)self->_source containsVideoWithFormatEligibleForTranscoding])
      {
        v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8CEF8]];
        if (v8)
        {
          unsigned int v9 = [(PHMediaFormatConversionSource *)self->_source firstVideoTrackCodec];
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v10 = v8;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v29;
            while (2)
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v29 != v13) {
                  objc_enumerationMutation(v10);
                }
                if ([*(id *)(*((void *)&v28 + 1) + 8 * i) unsignedIntValue] == v9)
                {
                  LOBYTE(v7) = 1;
                  v15 = v10;
                  goto LABEL_37;
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }
        }
      }
      v15 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8CEF0]];
      v16 = (void *)MEMORY[0x1E4F8CDF8];
      v17 = [(PHMediaFormatConversionContent *)self->_source fileType];
      id v10 = [v16 typeWithIdentifier:v17];

      if (v15) {
        BOOL v18 = v10 == 0;
      }
      else {
        BOOL v18 = 1;
      }
      if (v18)
      {
        LOBYTE(v7) = 0;
      }
      else
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v19 = v15;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
        uint64_t v7 = v20;
        if (v20)
        {
          uint64_t v21 = *(void *)v25;
          while (2)
          {
            uint64_t v22 = 0;
            do
            {
              if (*(void *)v25 != v21) {
                objc_enumerationMutation(v19);
              }
              if (objc_msgSend(v10, "conformsToType:", *(void *)(*((void *)&v24 + 1) + 8 * v22), (void)v24))
              {
                LOBYTE(v7) = 1;
                goto LABEL_36;
              }
              ++v22;
            }
            while (v7 != v22);
            uint64_t v7 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
            if (v7) {
              continue;
            }
            break;
          }
        }
LABEL_36:
      }
LABEL_37:
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (PFMediaCapabilities)destinationCapabilities
{
  return (PFMediaCapabilities *)objc_getProperty(self, a2, 120, 1);
}

- (BOOL)preflighted
{
  return self->_preflighted;
}

- (BOOL)requiresCaptionMetadataChange
{
  if ([(PHMediaFormatConversionRequest *)self captionMetadataBehavior] == 1)
  {
    BOOL v3 = [(PHMediaFormatConversionRequest *)self source];
    BOOL v4 = [v3 captionMetadataStatus] == 2;
  }
  else
  {
    BOOL v4 = 0;
  }
  if ([(PHMediaFormatConversionRequest *)self captionMetadataBehavior] == 2)
  {
    BOOL v5 = [(PHMediaFormatConversionRequest *)self caption];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  return v4 || v6;
}

- (BOOL)requiresAccessibilityDescriptionMetadataChange
{
  if ([(PHMediaFormatConversionRequest *)self accessibilityDescriptionMetadataBehavior] == 1)
  {
    BOOL v3 = [(PHMediaFormatConversionRequest *)self source];
    BOOL v4 = [v3 accessibilityDescriptionMetadataStatus] == 2;
  }
  else
  {
    BOOL v4 = 0;
  }
  if ([(PHMediaFormatConversionRequest *)self accessibilityDescriptionMetadataBehavior] == 2)
  {
    BOOL v5 = [(PHMediaFormatConversionRequest *)self accessibilityDescription];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  return v4 || v6;
}

- (BOOL)useTransferBehaviorUserPreference
{
  return self->_useTransferBehaviorUserPreference;
}

- (int64_t)transferBehaviorUserPreference
{
  return self->_transferBehaviorUserPreference;
}

- (BOOL)forceFormatConversion
{
  return self->_forceFormatConversion;
}

- (int64_t)captionMetadataBehavior
{
  return self->_captionMetadataBehavior;
}

- (int64_t)accessibilityDescriptionMetadataBehavior
{
  return self->_accessibilityDescriptionMetadataBehavior;
}

- (BOOL)requiresCreationDateMetadataChange
{
  if ([(PHMediaFormatConversionRequest *)self creationDateMetadataBehavior] != 2) {
    return 0;
  }
  BOOL v3 = [(PHMediaFormatConversionRequest *)self creationDate];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)requiresLivePhotoPairingIdentifierChange
{
  BOOL v4 = 1;
  switch([(PHMediaFormatConversionRequest *)self livePhotoPairingIdentifierBehavior])
  {
    case 0:
      BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:1084 description:@"Unexpected invalid live photo pairing identifier behavior value"];

      return 1;
    case 1:
      return 0;
    case 2:
      BOOL v6 = [(PHMediaFormatConversionRequest *)self source];
      uint64_t v7 = [v6 livePhotoPairingIdentifier];
      BOOL v4 = v7 != 0;

      return v4;
    case 4:
      return [(PHMediaFormatConversionRequest *)self requiresFormatConversion];
    case 5:
      unsigned int v9 = [(PHMediaFormatConversionRequest *)self source];
      id v10 = [v9 livePhotoPairingIdentifier];
      if (v10) {
        BOOL v4 = [(PHMediaFormatConversionRequest *)self requiresFormatConversion];
      }
      else {
        BOOL v4 = 0;
      }

      return v4;
    default:
      return v4;
  }
}

- (int64_t)creationDateMetadataBehavior
{
  return self->_creationDateMetadataBehavior;
}

- (int64_t)livePhotoPairingIdentifierBehavior
{
  return self->_livePhotoPairingIdentifierBehavior;
}

+ (id)requestForSource:(id)a3 destinationCapabilities:(id)a4 error:(id *)a5
{
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v10 fileURL];

  if (!v11)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"PHMediaFormatConversion.m", 926, @"Invalid parameter not satisfying: %@", @"source.fileURL" object file lineNumber description];
  }
  [(id)objc_opt_class() requestClass];
  uint64_t v12 = objc_opt_new();
  [v12 setSource:v10];

  [v12 setDestinationCapabilities:v9];
  if ([v12 prepareWithError:a5])
  {
    [v12 setupProgress];
    id v13 = v12;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void)setupProgress
{
  self->_progress = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1];
  MEMORY[0x1F41817F8]();
}

- (void)setSource:(id)a3
{
}

- (void)setDestinationCapabilities:(id)a3
{
}

- (BOOL)prepareWithError:(id *)a3
{
  return 1;
}

- (void)preflightWithConversionManager:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(PHMediaFormatConversionRequest *)self status];
  if (v5 <= 5 && ((1 << v5) & 0x31) != 0)
  {
    BOOL v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = [(PHMediaFormatConversionRequest *)self statusString];
    [v6 handleFailureInMethod:a2, self, @"PHMediaFormatConversion.m", 957, @"Preflight of request in invalid state %@", v7 object file lineNumber description];
  }
  if ([(PHMediaFormatConversionRequest *)self preflighted])
  {
    long long v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:960 description:@"Preflight of already preflighted request"];
  }
  v8 = [(PHMediaFormatConversionRequest *)self source];

  if (!v8)
  {
    long long v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:962 description:@"Preflight of request without source"];
  }
  if ([(PHMediaFormatConversionRequest *)self locationMetadataBehavior] != 1)
  {
    id v9 = [(PHMediaFormatConversionRequest *)self source];
    [v9 markLocationMetadataAsCheckedWithStatus:1];
  }
  if ([(PHMediaFormatConversionRequest *)self captionMetadataBehavior] != 1)
  {
    id v10 = [(PHMediaFormatConversionRequest *)self source];
    [v10 markCaptionMetadataAsCheckedWithStatus:1];
  }
  if ([(PHMediaFormatConversionRequest *)self accessibilityDescriptionMetadataBehavior] != 1)
  {
    uint64_t v11 = [(PHMediaFormatConversionRequest *)self source];
    [v11 markAccessibilityDescriptionMetadataAsCheckedWithStatus:1];
  }
  uint64_t v12 = [(PHMediaFormatConversionRequest *)self source];
  id v26 = 0;
  char v13 = [v12 preflightWithError:&v26];
  id v14 = v26;

  if (v13)
  {
    if (![(PHMediaFormatConversionRequest *)self requiresSinglePassVideoConversion]) {
      goto LABEL_25;
    }
    v15 = [(PHMediaFormatConversionRequest *)self source];
    if ([v15 mediaType] == 1)
    {
      BOOL v16 = [(PHMediaFormatConversionRequest *)self isCompositeRequest];

      if (!v16)
      {
        if ([(PHMediaFormatConversionRequest *)self locationMetadataBehavior]
          || [(PHMediaFormatConversionRequest *)self creationDateMetadataBehavior]
          || [(PHMediaFormatConversionRequest *)self captionMetadataBehavior]
          || [(PHMediaFormatConversionRequest *)self accessibilityDescriptionMetadataBehavior])
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            v17 = [(PHMediaFormatConversionRequest *)self source];
            *(_DWORD *)buf = 138412290;
            long long v28 = v17;
            BOOL v18 = MEMORY[0x1E4F14500];
            id v19 = "Invalid request using single pass encoding option and metadata changes (like location stripping, custo"
                  "m location, custom creation date, custom description) for video source %@";
LABEL_36:
            _os_log_error_impl(&dword_1DD979000, v18, OS_LOG_TYPE_ERROR, v19, buf, 0xCu);

            goto LABEL_32;
          }
          goto LABEL_32;
        }
LABEL_25:
        uint64_t v20 = [(PHMediaFormatConversionRequest *)self destinationCapabilities];
        if ([v20 supportsHDR])
        {
          uint64_t v21 = [(PHMediaFormatConversionRequest *)self source];
          -[PHMediaFormatConversionRequest setShouldExportAsHDR:](self, "setShouldExportAsHDR:", [v21 isHDR]);
        }
        else
        {
          [(PHMediaFormatConversionRequest *)self setShouldExportAsHDR:0];
        }

        [(PHMediaFormatConversionRequest *)self setPreflighted:1];
        uint64_t v22 = [(PHMediaFormatConversionRequest *)self parentRequest];
        v23 = v22;
        if (v22) {
          [v22 didPreflightSubrequest:self];
        }
        goto LABEL_33;
      }
    }
    else
    {
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v17 = [(PHMediaFormatConversionRequest *)self source];
      *(_DWORD *)buf = 138412290;
      long long v28 = v17;
      BOOL v18 = MEMORY[0x1E4F14500];
      id v19 = "Invalid request using single pass encoding option for non-video source %@";
      goto LABEL_36;
    }
LABEL_32:
    [(PHMediaFormatConversionRequest *)self setStatus:5];
    v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PHMediaFormatConversionErrorDomain" code:4 userInfo:0];
    [(PHMediaFormatConversionRequest *)self setError:v23];
LABEL_33:

    goto LABEL_34;
  }
  [(PHMediaFormatConversionRequest *)self setStatus:5];
  [(PHMediaFormatConversionRequest *)self setError:v14];
LABEL_34:
}

- (void)setShouldExportAsHDR:(BOOL)a3
{
  self->_shouldExportAsHDR = a3;
}

- (void)setPreflighted:(BOOL)a3
{
  self->_preflighted = a3;
}

- (BOOL)requiresSinglePassVideoConversion
{
  return self->_requiresSinglePassVideoConversion;
}

- (PHMediaFormatConversionCompositeRequest)parentRequest
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentRequest);
  return (PHMediaFormatConversionCompositeRequest *)WeakRetained;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setTransferBehaviorUserPreference:(int64_t)a3
{
  self->_transferBehaviorUserPreference = a3;
}

- (void)setDirectoryForTemporaryFiles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityDescription, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_creationDateTimeZone, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong(&self->_singlePassVideoConversionUpdateHandler, 0);
  objc_storeStrong((id *)&self->_directoryForTemporaryFiles, 0);
  objc_destroyWeak((id *)&self->_parentRequest);
  objc_storeStrong((id *)&self->_destinationCapabilities, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_videoExportPreset, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_outputFilename, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_livePhotoPairingIdentifier, 0);
}

- (void)setPassthroughConversionAdditionalByteCount:(int64_t)a3
{
  self->_passthroughConversionAdditionalByteCount = a3;
}

- (NSString)accessibilityDescription
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (NSString)caption
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (NSTimeZone)creationDateTimeZone
{
  return (NSTimeZone *)objc_getProperty(self, a2, 192, 1);
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 184, 1);
}

- (CLLocation)location
{
  return (CLLocation *)objc_getProperty(self, a2, 168, 1);
}

- (BOOL)shouldExportAsHDR
{
  return self->_shouldExportAsHDR;
}

- (void)setRequiresSinglePassVideoConversion:(BOOL)a3
{
  self->_requiresSinglePassVideoConversion = a3;
}

- (void)setSinglePassVideoConversionUpdateHandler:(id)a3
{
}

- (id)singlePassVideoConversionUpdateHandler
{
  return objc_getProperty(self, a2, 152, 1);
}

- (NSURL)directoryForTemporaryFiles
{
  return (NSURL *)objc_getProperty(self, a2, 136, 1);
}

- (void)setParentRequest:(id)a3
{
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 104, 1);
}

- (void)setVideoExportPreset:(id)a3
{
}

- (NSString)videoExportPreset
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setUserInfo:(id)a3
{
}

- (id)userInfo
{
  return objc_getProperty(self, a2, 88, 1);
}

- (PHMediaFormatConversionDestination)destination
{
  return self->_destination;
}

- (void)setUseTransferBehaviorUserPreference:(BOOL)a3
{
  self->_useTransferBehaviorUserPreference = a3;
}

- (void)setOutputFilename:(id)a3
{
}

- (NSString)outputFilename
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 64, 1);
}

- (void)setProgress:(id)a3
{
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 56, 1);
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void)setShouldStripLocation:(BOOL)a3
{
  self->_shouldStripLocation = a3;
}

- (BOOL)shouldStripLocation
{
  return self->_shouldStripLocation;
}

- (void)setShouldPadOutputFileToEstimatedLength:(BOOL)a3
{
  self->_shouldPadOutputFileToEstimatedLength = a3;
}

- (BOOL)shouldPadOutputFileToEstimatedLength
{
  return self->_shouldPadOutputFileToEstimatedLength;
}

- (void)setLivePhotoPairingIdentifier:(id)a3
{
}

- (NSString)livePhotoPairingIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLivePhotoPairingIdentifierBehavior:(int64_t)a3
{
  self->_livePhotoPairingIdentifierBehavior = a3;
}

- (void)updateSinglePassVideoConversionStatus:(int64_t)a3 addedRange:(_NSRange)a4 error:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if (!self->_requiresSinglePassVideoConversion)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:1447 description:@"Invalid request configuration for single pass video conversion callback"];
  }
  if (!self->_singlePassVideoConversionUpdateHandler)
  {
    char v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:1448 description:@"Unexpected nil single pass video conversion update handler"];
  }
  int64_t v10 = [(PHMediaFormatConversionRequest *)self status];
  if (v10 == 3)
  {
    -[PHMediaFormatConversionDestination addAvailableRange:](self->_destination, "addAvailableRange:", location, length);
    (*((void (**)(void))self->_singlePassVideoConversionUpdateHandler + 2))();
  }
  else
  {
    int64_t v11 = v10;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134217984;
      int64_t v15 = v11;
      _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Ignoring single pass video conversion status update for request in non-processing state %zd", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)enableSinglePassVideoEncodingWithUpdateHandler:(id)a3
{
  id v8 = a3;
  if ([(PHMediaFormatConversionContent *)self->_source mediaType] != 1
    || [(PHMediaFormatConversionRequest *)self isCompositeRequest])
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:1440 description:@"Invalid request configuration for single pass video conversion"];
  }
  self->_requiresSinglePassVideoConversion = 1;
  unint64_t v5 = (void *)MEMORY[0x1E01C2040](v8);
  id singlePassVideoConversionUpdateHandler = self->_singlePassVideoConversionUpdateHandler;
  self->_id singlePassVideoConversionUpdateHandler = v5;
}

- (void)didFinishProcessing
{
  if ([(PHMediaFormatConversionRequest *)self status] == 4
    && [(PHMediaFormatConversionRequest *)self shouldPadOutputFileToEstimatedLength]&& ![(PHMediaFormatConversionRequest *)self requiresSinglePassVideoConversion])
  {
    [(PHMediaFormatConversionRequest *)self padOutputFileToEstimatedLength];
  }
  if ([(PHMediaFormatConversionRequest *)self status] != 4
    && [(PHMediaFormatConversionRequest *)self requiresSinglePassVideoConversion])
  {
    BOOL v3 = [(PHMediaFormatConversionRequest *)self destination];
    BOOL v4 = [v3 singlePassVideoExportRangeCoordinator];
    [v4 cancel];
  }
  id v5 = [(PHMediaFormatConversionRequest *)self progress];
  [v5 setCompletedUnitCount:1];
}

- (void)padOutputFileToEstimatedLength
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PHMediaFormatConversionRequest *)self destination];
  id v15 = 0;
  char v4 = objc_msgSend(v3, "padToLength:error:", -[PHMediaFormatConversionRequest estimatedOutputFileLength](self, "estimatedOutputFileLength"), &v15);
  id v5 = v15;

  if ((v4 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v14 = [(PHMediaFormatConversionRequest *)self source];
      BOOL v6 = [v14 fileType];
      uint64_t v7 = [(PHMediaFormatConversionRequest *)self destination];
      uint64_t v8 = [v7 length];
      unint64_t v9 = [(PHMediaFormatConversionRequest *)self estimatedOutputFileLength];
      int64_t v10 = [(PHMediaFormatConversionRequest *)self source];
      int64_t v11 = [v10 fileURL];
      uint64_t v12 = [(PHMediaFormatConversionRequest *)self destination];
      char v13 = [v12 fileURL];
      *(_DWORD *)buf = 138544642;
      v17 = v6;
      __int16 v18 = 2048;
      uint64_t v19 = v8;
      __int16 v20 = 2048;
      unint64_t v21 = v9;
      __int16 v22 = 2114;
      id v23 = v5;
      __int16 v24 = 2112;
      long long v25 = v11;
      __int16 v26 = 2112;
      long long v27 = v13;
      _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to pad output file (type %{public}@) of length %llu to estimated length %llu: %{public}@, %@ -> %@", buf, 0x3Eu);
    }
    [(PHMediaFormatConversionRequest *)self setStatus:5];
    [(PHMediaFormatConversionRequest *)self setError:v5];
  }
}

- (int64_t)passthroughConversionAdditionalByteCount
{
  if (self->_passthroughConversionAdditionalByteCount <= 0) {
    return 512;
  }
  else {
    return self->_passthroughConversionAdditionalByteCount;
  }
}

- (double)formatConversionExpansionFactor
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  double formatConversionExpansionFactor = self->_formatConversionExpansionFactor;
  if (formatConversionExpansionFactor <= 0.0)
  {
    if (![(PHMediaFormatConversionRequest *)self preflighted])
    {
      uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:1360 description:@"Request must be preflighted"];
    }
    id v5 = [(PHMediaFormatConversionRequest *)self source];
    int v6 = [v5 isVideo];

    if (v6)
    {
      [(PHMediaFormatConversionRequest *)self requiresSinglePassVideoConversion];
      return 2.2;
    }
    else
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = [(PHMediaFormatConversionRequest *)self source];
      [v8 imageDimensions];
      double v10 = v9;
      double v12 = v11;
      char v13 = [(PHMediaFormatConversionRequest *)self source];
      objc_msgSend(v7, "heifToJPEGFactorWithImageDimensions:fileLength:", objc_msgSend(v13, "length"), v10, v12);
      double formatConversionExpansionFactor = v14;

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        uint64_t v16 = [(PHMediaFormatConversionRequest *)self source];
        [v16 imageDimensions];
        v17 = NSStringFromSize(v27);
        __int16 v18 = [(PHMediaFormatConversionRequest *)self source];
        int v20 = 134218498;
        double v21 = formatConversionExpansionFactor;
        __int16 v22 = 2112;
        id v23 = v17;
        __int16 v24 = 2048;
        uint64_t v25 = [v18 length];
        _os_log_debug_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Calculated formatConversionExpansionFactor: %f (image dimensions: %@, file length: %llu)", (uint8_t *)&v20, 0x20u);
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v20 = 134217984;
    double v21 = formatConversionExpansionFactor;
    _os_log_debug_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Explicit formatConversionExpansionFactor: %f", (uint8_t *)&v20, 0xCu);
    return self->_formatConversionExpansionFactor;
  }
  return formatConversionExpansionFactor;
}

- (void)setFormatConversionExpansionFactor:(double)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    double formatConversionExpansionFactor = self->_formatConversionExpansionFactor;
    int v6 = 134217984;
    double v7 = formatConversionExpansionFactor;
    _os_log_debug_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Setting explicit formatConversionExpansionFactor: %f", (uint8_t *)&v6, 0xCu);
  }
  self->_double formatConversionExpansionFactor = a3;
}

- (unint64_t)estimatedOutputFileLength
{
  if ([(PHMediaFormatConversionRequest *)self requiresFormatConversion])
  {
    BOOL v3 = [(PHMediaFormatConversionRequest *)self source];
    double v4 = (double)(unint64_t)[v3 length];
    [(PHMediaFormatConversionRequest *)self formatConversionExpansionFactor];
    unint64_t v6 = (unint64_t)(v5 * v4);
  }
  else
  {
    BOOL v7 = [(PHMediaFormatConversionRequest *)self requiresPassthroughConversion];
    BOOL v3 = [(PHMediaFormatConversionRequest *)self source];
    unint64_t v6 = [v3 length];
    if (v7) {
      v6 += [(PHMediaFormatConversionRequest *)self passthroughConversionAdditionalByteCount];
    }
  }

  return v6;
}

- (NSString)outputFileType
{
  if (![(PHMediaFormatConversionRequest *)self preflighted])
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:1323 description:@"Request must be preflighted"];
  }
  double v4 = [(PHMediaFormatConversionRequest *)self source];

  if (!v4)
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:1324 description:@"Invalid request for output type identifier on request without source"];
  }
  double v5 = [(PHMediaFormatConversionRequest *)self source];
  if ([v5 mediaType] == 2)
  {
    BOOL v6 = [(PHMediaFormatConversionRequest *)self requiresFormatConversion];

    if (v6)
    {
      BOOL v7 = [(id)*MEMORY[0x1E4F44410] identifier];
      goto LABEL_10;
    }
  }
  else
  {
  }
  uint64_t v8 = [(PHMediaFormatConversionRequest *)self source];
  BOOL v7 = [v8 fileType];

LABEL_10:
  return (NSString *)v7;
}

- (NSString)outputPathExtension
{
  if (![(PHMediaFormatConversionRequest *)self preflighted])
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:1313 description:@"Request must be preflighted"];
  }
  double v4 = [(PHMediaFormatConversionRequest *)self source];

  if (!v4)
  {
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:1314 description:@"Invalid request for output path extension on request without source"];
  }
  double v5 = [(PHMediaFormatConversionRequest *)self source];
  if ([v5 mediaType] == 2)
  {
    BOOL v6 = [(PHMediaFormatConversionRequest *)self requiresFormatConversion];

    if (v6)
    {
      BOOL v7 = @"jpg";
      goto LABEL_10;
    }
  }
  else
  {
  }
  uint64_t v8 = [(PHMediaFormatConversionRequest *)self source];
  double v9 = [v8 fileURL];
  BOOL v7 = [v9 pathExtension];

LABEL_10:
  return (NSString *)v7;
}

- (void)setAccessibilityDescriptionMetadataBehavior:(int64_t)a3 withAccessibilityDescription:(id)a4
{
  id v7 = a4;
  id v12 = v7;
  if (self->_accessibilityDescriptionMetadataBehavior != a3
    || (v8 = [(NSString *)self->_accessibilityDescription isEqualToString:v7], id v7 = v12, !v8))
  {
    self->_accessibilityDescriptionMetadataBehavior = a3;
    if (a3 == 2)
    {
      if (!v7)
      {
        double v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:1304 description:@"caption must not be nil if accessibilityDescriptionMetadataBehavior is PHMediaFormatMetadataBehaviorApply"];

        id v7 = v12;
      }
      double v9 = (NSString *)[v7 copy];
      accessibilityDescription = self->_accessibilityDescription;
      self->_accessibilityDescription = v9;
    }
    else
    {
      accessibilityDescription = self->_accessibilityDescription;
      self->_accessibilityDescription = 0;
    }
  }
  MEMORY[0x1F41817F8]();
}

- (void)setCaptionMetadataBehavior:(int64_t)a3 withCaption:(id)a4
{
  id v7 = a4;
  id v12 = v7;
  if (self->_captionMetadataBehavior != a3
    || (v8 = [(NSString *)self->_caption isEqualToString:v7], id v7 = v12, !v8))
  {
    self->_captionMetadataBehavior = a3;
    if (a3 == 2)
    {
      if (!v7)
      {
        double v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:1290 description:@"caption must not be nil if behavior is PHMediaFormatMetadataBehaviorApply"];

        id v7 = v12;
      }
      double v9 = (NSString *)[v7 copy];
      caption = self->_caption;
      self->_caption = v9;
    }
    else
    {
      caption = self->_caption;
      self->_caption = 0;
    }
  }
  MEMORY[0x1F41817F8]();
}

- (void)setCreationDateMetadataBehavior:(int64_t)a3 withCreationDate:(id)a4 inTimeZone:(id)a5
{
  id v16 = a4;
  id v10 = a5;
  if (a3 == 1)
  {
    double v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:1267 description:@"Stripping creation date metadata is not permitted"];
  }
  if (self->_creationDateMetadataBehavior != a3
    || ![(NSDate *)self->_creationDate isEqualToDate:v16])
  {
    self->_creationDateMetadataBehavior = a3;
    if (a3 == 2)
    {
      if (!v16)
      {
        id v15 = [MEMORY[0x1E4F28B00] currentHandler];
        [v15 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:1274 description:@"creationDate must not be nil if behavior is PHMediaFormatMetadataBehaviorApply"];
      }
      objc_storeStrong((id *)&self->_creationDate, a4);
      double v11 = (NSTimeZone *)v10;
      creationDateTimeZone = self->_creationDateTimeZone;
      self->_creationDateTimeZone = v11;
    }
    else
    {
      creationDate = self->_creationDate;
      self->_creationDate = 0;

      creationDateTimeZone = self->_creationDateTimeZone;
      self->_creationDateTimeZone = 0;
    }
  }
}

- (void)setLocationMetadataBehavior:(int64_t)a3 withLocation:(id)a4
{
  id v7 = a4;
  id v12 = v7;
  if (self->_locationMetadataBehavior != a3
    || (v8 = [(CLLocation *)self->_location isEqual:v7], id v7 = v12, (v8 & 1) == 0))
  {
    self->_locationMetadataBehavior = a3;
    if (a3 == 2)
    {
      if (!v7)
      {
        double v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:1259 description:@"location must not be nil if behavior is PHMediaFormatMetadataBehaviorApply"];

        id v7 = v12;
      }
      double v9 = (CLLocation *)v7;
      NSUInteger location = self->_location;
      self->_NSUInteger location = v9;
    }
    else
    {
      NSUInteger location = self->_location;
      self->_NSUInteger location = 0;
    }
  }
  MEMORY[0x1F41817F8]();
}

- (BOOL)_calculateRequiresFormatConversion
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  if (![(PHMediaFormatConversionRequest *)self preflighted])
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:1128 description:@"Request must be preflighted"];
  }
  BOOL v4 = [(PHMediaFormatConversionRequest *)self forceFormatConversion];
  BOOL v5 = [(PHMediaFormatConversionRequest *)self useTransferBehaviorUserPreference];
  BOOL v6 = [(PHMediaFormatConversionRequest *)self userPreferenceProhibitsFormatConversion];
  int v7 = [(PHMediaFormatConversionRequest *)self destinationCapabilitiesHintsIndicateSupportForSource];
  char v8 = [(PHMediaFormatConversionRequest *)self source];
  int v9 = [v8 isVideo];

  id v10 = [(PHMediaFormatConversionRequest *)self source];
  double v11 = v10;
  if (!v9)
  {
    int v23 = [v10 isImage];

    if (v23)
    {
      __int16 v24 = [(PHMediaFormatConversionRequest *)self source];
      int v25 = [v24 containsImageWithFormatEligibleForTranscoding];

      if (v25)
      {
        uint64_t v26 = [(PHMediaFormatConversionRequest *)self destinationCapabilities];
        NSSize v27 = [(id)*MEMORY[0x1E4F44568] identifier];
        uint64_t v28 = [v26 supportForContainerTypeIdentifier:v27];

        int v18 = ((unint64_t)(v28 + 1) < 2) & ~v7;
LABEL_18:
        int v19 = 1;
        goto LABEL_19;
      }
    }
LABEL_14:
    int v19 = 0;
    int v18 = 0;
LABEL_19:
    [(PHMediaFormatConversionRequest *)self shouldExportAsHDR];
    uint64_t v16 = 0;
    BOOL v20 = 0;
    goto LABEL_20;
  }
  int v12 = [v10 containsVideoWithFormatEligibleForTranscoding];

  if ((v12 ^ 1 | v7)) {
    goto LABEL_14;
  }
  char v13 = [(PHMediaFormatConversionRequest *)self source];
  double v14 = [v13 transcodingEligibleVideoTrackFormatDescription];

  if (!v14)
  {
    uint64_t v29 = [(PHMediaFormatConversionRequest *)self source];
    int v30 = [v29 firstVideoTrackCodec];

    if (v30 == 1752589105)
    {
      long long v31 = [(PHMediaFormatConversionRequest *)self destinationCapabilities];
      uint64_t v32 = [v31 supportForCodec:1752589105];

      int v18 = v32 == -1;
    }
    else
    {
      int v18 = 0;
    }
    goto LABEL_18;
  }
  id v15 = [(PHMediaFormatConversionRequest *)self destinationCapabilities];
  uint64_t v16 = [v15 decodingSupportForFormatDescription:v14];

  BOOL v17 = [(PHMediaFormatConversionRequest *)self shouldExportAsHDR];
  int v18 = 0;
  int v19 = 1;
  BOOL v20 = v16 != 2;
  if (v16 != 2 && v17)
  {
    double v21 = [(PHMediaFormatConversionRequest *)self source];
    char v22 = [v21 containsProResVideoWithFormatEligibleForTranscoding];

    if ((v22 & 1) == 0) {
      [(PHMediaFormatConversionRequest *)self setShouldExportAsHDR:0];
    }
    int v18 = 0;
    BOOL v20 = 1;
  }
LABEL_20:
  BOOL v45 = v20;
  if (([(PHMediaFormatConversionRequest *)self requiresLocationMetadataChange]
     || [(PHMediaFormatConversionRequest *)self requiresAccessibilityDescriptionMetadataChange]|| [(PHMediaFormatConversionRequest *)self requiresCaptionMetadataChange]|| [(PHMediaFormatConversionRequest *)self requiresCreationDateMetadataChange])&& ![(PHMediaFormatConversionRequest *)self sourceSupportsPassthroughConversion])
  {
    int v44 = 1;
    int v33 = 1;
  }
  else
  {
    int v44 = 0;
    int v33 = v19 & (v4 | (v18 | v20) & ~(v5 && v6));
  }
  if ([(id)objc_opt_class() hasInternalDiagnostics]) {
    os_log_type_t v34 = OS_LOG_TYPE_INFO;
  }
  else {
    os_log_type_t v34 = OS_LOG_TYPE_DEBUG;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], v34))
  {
    v42 = [MEMORY[0x1E4F8CC30] stringForSupport:v16];
    BOOL v43 = [(PHMediaFormatConversionRequest *)self shouldExportAsHDR];
    v35 = [(PHMediaFormatConversionRequest *)self source];
    v36 = [v35 fileURL];
    uint64_t v37 = [v36 lastPathComponent];
    int v38 = v18;
    v39 = (void *)v37;
    *(_DWORD *)buf = 67111939;
    int v47 = v33;
    __int16 v48 = 1024;
    int v49 = v19;
    __int16 v50 = 1024;
    BOOL v51 = v4;
    __int16 v52 = 1024;
    BOOL v53 = v6;
    __int16 v54 = 1024;
    BOOL v55 = v5;
    __int16 v56 = 1024;
    int v57 = v38;
    __int16 v58 = 1024;
    BOOL v59 = v45;
    __int16 v60 = 2114;
    v61 = v42;
    __int16 v62 = 1024;
    int v63 = v7;
    __int16 v64 = 1024;
    int v65 = v44;
    __int16 v66 = 1024;
    BOOL v67 = v43;
    __int16 v68 = 2113;
    uint64_t v69 = v37;
    _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], v34, "Media format conversion decision: result=%d containsModernFormat=%d forcedOnRequest=%d prohibitedByUserPreference=%d useTransferBehaviorUserChoice=%d destinationMissingSupport=%d, destinationMissingSupportForAsset=%d (assetSupport=%{public}@), destinationPlatformHintIndicatesSupport=%d, unsupportedUserModifiedMetadataPassthroughConversion=%d shouldExportAsHDR=%d filename=%{private}@", buf, 0x52u);
  }
  return v33;
}

- (BOOL)sourceSupportsPassthroughConversion
{
  v20[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F44568];
  v20[0] = *MEMORY[0x1E4F44410];
  v20[1] = v3;
  v20[2] = *MEMORY[0x1E4F44490];
  [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v10 = (void *)MEMORY[0x1E4F442D8];
        double v11 = [(PHMediaFormatConversionContent *)self->_source fileType];
        int v12 = [v10 typeWithIdentifier:v11];
        LOBYTE(v9) = [v12 conformsToType:v9];

        if (v9)
        {
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (void)markAsCancelled
{
  [(PHMediaFormatConversionRequest *)self setStatus:5];
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PHMediaFormatConversionErrorDomain" code:3 userInfo:0];
  [(PHMediaFormatConversionRequest *)self setError:v3];
}

- (BOOL)isCompositeRequest
{
  return 0;
}

- (NSString)statusString
{
  id v3 = objc_opt_class();
  int64_t v4 = [(PHMediaFormatConversionRequest *)self status];
  return (NSString *)[v3 stringForRequestStatus:v4];
}

- (NSString)description
{
  id v3 = NSString;
  int64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(PHMediaFormatConversionRequest *)self identifier];
  uint64_t v7 = [(PHMediaFormatConversionRequest *)self statusString];
  BOOL v8 = [(PHMediaFormatConversionRequest *)self preflighted];
  uint64_t v9 = [(PHMediaFormatConversionRequest *)self source];
  id v10 = [v9 fileURL];
  double v11 = [v10 path];
  int v12 = [v11 lastPathComponent];
  BOOL v13 = [v3 stringWithFormat:@"<%@ %p identifier=%@ status=%@ preflighted=%d path=%@>", v5, self, v6, v7, v8, v12];

  return (NSString *)v13;
}

- (void)setForceFormatConversion:(BOOL)a3
{
  self->_forceFormatConversion = a3;
  self->_didCalculateRequiresFormatConversion = 0;
}

- (void)setDestination:(id)a3
{
  uint64_t v5 = (PHMediaFormatConversionDestination *)a3;
  if (self->_destination)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:875 description:@"Conversion destination may be set only once"];

    destination = self->_destination;
  }
  else
  {
    destination = 0;
  }
  self->_destination = v5;
}

- (PHMediaFormatConversionRequest)init
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)PHMediaFormatConversionRequest;
  v2 = [(PHMediaFormatConversionRequest *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v3;

    v2->_status = 1;
    v2->_livePhotoPairingIdentifierBehavior = 4;
    uint64_t v5 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v6 = [v5 UUIDString];
    livePhotoPairingIdentifier = v2->_livePhotoPairingIdentifier;
    v2->_livePhotoPairingIdentifier = (NSString *)v6;

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = v2->_identifier;
      id v10 = v2->_livePhotoPairingIdentifier;
      *(_DWORD *)buf = 138543618;
      BOOL v13 = v9;
      __int16 v14 = 2114;
      long long v15 = v10;
      _os_log_debug_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Initial live photo pairing identifier for request %{public}@: %{public}@", buf, 0x16u);
    }
  }
  return v2;
}

+ (double)heifToJPEGFactorForBitsPerPixel:(double)a3
{
  double v3 = 2.3;
  if (a3 > 1.3) {
    double v3 = 2.0;
  }
  BOOL v4 = a3 > 0.7;
  double result = 3.0;
  if (v4) {
    return v3;
  }
  return result;
}

+ (double)bitsPerPixelWithImageDimensions:(CGSize)a3 fileLength:(unint64_t)a4
{
  return (double)a4 / (a3.width * a3.height) * 8.0;
}

+ (double)heifToJPEGFactorWithImageDimensions:(CGSize)a3 fileLength:(unint64_t)a4
{
  BOOL v4 = a3.height == *(double *)(MEMORY[0x1E4F1DB30] + 8) && a3.width == *MEMORY[0x1E4F1DB30];
  if (!a4 || v4) {
    return 2.3;
  }
  objc_msgSend(a1, "bitsPerPixelWithImageDimensions:fileLength:");
  objc_msgSend(a1, "heifToJPEGFactorForBitsPerPixel:");
  return result;
}

+ (BOOL)hasInternalDiagnostics
{
  if (hasInternalDiagnostics_onceToken != -1) {
    dispatch_once(&hasInternalDiagnostics_onceToken, &__block_literal_global_421);
  }
  return hasInternalDiagnostics_hasInternalDiagnostics;
}

uint64_t __56__PHMediaFormatConversionRequest_hasInternalDiagnostics__block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  hasInternalDiagnostics_hasInternalDiagnostics = result;
  return result;
}

+ (id)stringForRequestStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return @"PHMediaFormatRequestStatusUnknown";
  }
  else {
    return off_1E6CFEB88[a3 - 1];
  }
}

@end