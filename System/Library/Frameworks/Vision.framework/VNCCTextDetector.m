@interface VNCCTextDetector
- (BOOL)computeZCVectorHighProbability;
- (BOOL)debugMatlab;
- (BOOL)debugOut;
- (NSString)debugFilename;
- (VNCCCharBoxContext)charBoxContext;
- (VNCCTextDetector)initWithOptions:(id)a3;
- (__CCRange)tightenBox:(vImage_Buffer *)a3 startTop:(unsigned __int16)a4 startBottom:(unsigned __int16)a5 startPosition:(unsigned __int16)a6 stopPosition:(unsigned __int16)a7 imageHeight:(unint64_t)a8 halfWalk:(unsigned __int16)a9;
- (float)createLumaImage:(vImage_Buffer *)a3 lumaImage:(vImage_Buffer *)a4 numCropRows:(unsigned __int16)a5 rowStartLocation:(unsigned __int16)a6;
- (float)createLumaImageAlternative:(vImage_Buffer *)a3 lumaImageAlternative:(vImage_Buffer *)a4 numCropRows:(unsigned __int16)a5 rowStartLocation:(unsigned __int16)a6;
- (float)mmHeightCard;
- (float)mmWidthCard;
- (id)textBoxesForBuffer:(vImage_Buffer *)a3 error:(id *)a4;
- (id)textBoxesForImage:(id)a3 originatingRequestSpecifier:(id)a4 error:(id *)a5;
- (int)_allocateCRCharBoxContext:(unint64_t)a3;
- (int)_allocateSumDerivVectors:(__CCSumDerivVectors *)a3 size:(int)a4;
- (int)_allocateVImageWithWidth:(unint64_t)a3 height:(unint64_t)a4 rowBytes:(unint64_t)a5 imageOut:(vImage_Buffer *)a6;
- (int)_generateAdaptiveBinarization:(vImage_Buffer *)a3 adaptImage:(vImage_Buffer *)a4 useLowLightEnhancement:(unsigned __int8)a5;
- (int)_generateAndApplyColorProfileForImage:(vImage_Buffer *)a3 votingImage:(vImage_Buffer *)a4 textOut:(vImage_Buffer *)a5 minMaxRGB:(__rgbMinMaxU8 *)a6 lowHighRGB:(__rgbMinMaxFloat *)a7 numCropRows:(unsigned __int16)a8 rowStartLocation:(unsigned __int16)a9 rowStopLocation:(unsigned __int16)a10 sumTextOutFirstPass:(unsigned int *)a11 useLowLightEnhancement:(unsigned __int8)a12;
- (int)_generateBoxes:(id)a3 pulseVector:(unint64_t)a4 uImage:(vImage_Buffer *)a5 countBigBoxOut:(unint64_t *)a6 bigBoxes:(__CCBigBox *)a7 bigBoxesA:(__CCBigBox *)a8 useLowLightEnhancement:(unsigned __int8)a9;
- (int)_generateCRCharBoxInformation:(id)a3 inputImage:(vImage_Buffer *)a4 singleVotingImageAddressRef:(char *)a5 bigBoxes:(__CCBigBox *)a6 bigBoxesAdapt:(__CCBigBox *)a7 textOut:(vImage_Buffer *)a8 adaptOut:(vImage_Buffer *)a9 lowHighRGB:(__rgbMinMaxFloat *)a10 countBigBox:(unsigned __int8)a11 useLowLightEnhancement:(unsigned __int8)a12;
- (int)_generateCRCharBoxInformation_TrackBox:(__CCBox *)a3 finalCharBoxCoordCount:(unint64_t *)a4;
- (int)_generateCRCharBoxInformation_extendTextBoxes:(__CCBigBox *)a3 countBigBox:(unsigned __int8)a4 rowStartLocation2:(unsigned __int16)a5 finalCharBoxCoordCount:(unint64_t)a6 finalCoordinatesForStubRevised:(__CCBox *)a7 width:(unint64_t)a8 height:(unsigned __int16)a9 bigBoxIndicator:(char *)a10;
- (int)_generateCRCharBoxInformation_spaceBoxRemovalMagicThresh:(vImage_Buffer *)a3 magicMinHeight:(float)a4 magicMaxHeight:(float)a5 rowStartLocation2:(unsigned __int16)a6 magicThresh:(float *)a7 magicThreshPrev:(float *)a8 useLowLightEnhancement:(unsigned __int8)a9;
- (int)_generateCRCharBoxInformation_zcFinalVectorHighProbability:(vImage_Buffer *)a3 zcFinalRange:(unsigned __int16)a4;
- (int)_generateCRCharBoxInformation_zcFinalVectorOriginate:(vImage_Buffer *)a3 textOut:(vImage_Buffer *)a4 adaptOut:(vImage_Buffer *)a5 bigBoxes:(__CCBigBox *)a6 bigBoxesAdapt:(__CCBigBox *)a7 ccCharBoxesAggr:(__CCCharBox *)a8 ccCharBoxesFiltered:(__CCCharBox *)a9 height:(unsigned __int16)a10 rowStartLocation2:(unsigned __int16)a11 rowStopLocation2:(unsigned __int16)a12 singleVotingImageAddressRef:(char *)a13 countBigBox:(unsigned __int8)a14 filterWalkUpDownCount:(unsigned __int16 *)a15 useLowLightEnhancement:(unsigned __int8)a16;
- (int)_generatePulseVectorOutputs:(vImage_Buffer *)a3 votingImage:(vImage_Buffer *)a4 rowLocationsRef:(unsigned __int16 *)a5;
- (int)_generateSmoothedImage:(vImage_Buffer *)a3 uImage:(vImage_Buffer *)a4;
- (int)_generateVotingImage:(vImage_Buffer *)a3 votingImage:(vImage_Buffer *)a4 useLowLightEnhancement:(char *)a5;
- (int)_getFilterResultOut:(float *)a3 defaultRows:(unsigned __int16)a4 bufferHeight:(unsigned __int16)a5 minHeight:(unsigned __int8)a6 maxHeight:(unsigned __int8)a7 startRange:(unsigned __int16)a8 stopRange:(unsigned __int16)a9 startMaxFind:(unsigned int)a10 stopMaxFind:(unsigned int)a11 bytesPerRow:(unsigned __int16)a12 thresholdSet:(ThresholdSet_t)a13 sampleImageAddressRef:(char *)a14 sampleImageFloatAddressRef:(float *)a15 pulseVectorFlag:(unint64_t)a16;
- (int)_getFilterResultOutBothSumDeriv:(unsigned __int8)a3 floatVectorResult:(float *)a4 bufferHeight:(unsigned __int16)a5 minHeight:(unsigned __int8)a6 maxHeight:(unsigned __int8)a7 config:(__CCFilterSumDerivConfig *)a8 bytesPerRow:(unsigned __int16)a9 thresholdSet:(ThresholdSet_t)a10 sampleImageAddressRef:(char *)a11;
- (int)allocateColorProfileContext:(__CCColorProfileContext *)a3 width:(unsigned __int16)a4 height:(unsigned __int16)a5 rowBytes:(unint64_t)a6;
- (int)computeDependentTopAndBottomComponents:(__CCBox *)a3 finalCharBoxCoordCount:(unint64_t *)a4;
- (int)computeMainStub:(vImage_Buffer *)a3 numCropRows:(unsigned __int16)a4 numCropColsOut:(unsigned __int16 *)a5 maxY:(float)a6 start:(unsigned __int16 *)a7;
- (int)computePulseVectorSum:(char *)a3 start:(unsigned __int16)a4 stop:(unsigned __int16)a5 imageHeight:(unint64_t)a6 imageWidth:(unint64_t)a7 bottomHeight:(unsigned __int16)a8 topHeight:(unsigned __int16)a9;
- (int)extractBoxesForStub:(__CCBigBox *)a3 bigBoxesAdapt:(__CCBigBox *)a4 countBigBox:(unsigned __int8)a5 rowStartLocation2:(unsigned __int16)a6 rowStopLocation2:(unsigned __int16)a7 heightConstraint:(unsigned __int8)a8 imageWidth:(unsigned __int16)a9 height:(unsigned __int16)a10 ccCharBoxesAggr:(__CCCharBox *)a11 ccCharBoxesFiltered:(__CCCharBox *)a12 useLowLightEnhancement:(unsigned __int8)a13;
- (int)generateHistogramBounds:(__rgbaColor *)a3 rgbVector2Ref:(__rgbaColor *)a4 numPixels1:(unsigned int)a5 numPixels2:(unsigned int)a6 minMaxRGB:(__rgbMinMaxU8 *)a7 lowHighRGB:(__rgbMinMaxFloat *)a8;
- (int)generatePulses:(unsigned __int16)a3 minHeight:(unsigned __int8)a4 maxHeight:(unsigned __int8)a5 thresholdSet:(ThresholdSet_t)a6 prodBoostNormalized:(float *)a7 pulseVectorFlag:(unint64_t)a8;
- (int)midRow;
- (unsigned)_extractCharBoxCuts:(__CCBigBox *)a3 heightConstraint:(unsigned __int8)a4 medianHeightTopVector:(unsigned __int16 *)a5 medianHeightBottomVector:(unsigned __int16 *)a6 isAdaptive:(BOOL)a7;
- (unsigned)_generateBinarizationForImage:(vImage_Buffer *)a3 textOut:(vImage_Buffer *)a4 firstOrSecondPassIndicator:(unsigned __int8)a5 minMaxRGB:(__rgbMinMaxFloat *)a6;
- (unsigned)charBoxesFromTextBoxes:(__CCCharBox *)a3 bigBoxes:(__CCBigBox *)a4 ccYTopLocationsForSort:(unsigned __int16 *)a5 ccYBottomLocationsForSort:(unsigned __int16 *)a6;
- (unsigned)computeNumCropCols:(float *)a3 width:(unint64_t)a4 start:(unsigned __int16 *)a5;
- (unsigned)ii;
- (unsigned)maxBoxWidth;
- (unsigned)maxHeight;
- (unsigned)minBoxWidth;
- (unsigned)minHeight;
- (unsigned)pixelHeightCard;
- (unsigned)pixelWidthCard;
- (unsigned)profileNormal;
- (unsigned)startMaxFind;
- (unsigned)startNormal;
- (unsigned)startSensitized;
- (unsigned)stopMaxFind;
- (unsigned)stopNormal;
- (unsigned)stopSensitized;
- (void)_computeColumnSumsOverRange:(__CCRange *)a3 sampleImageAddress:(char *)a4 rowSumOut:(int *)a5 rowDerivOut:(int *)a6;
- (void)_computeProdBoostNormalizedResult:(__CCSumDerivVectors *)a3 size:(int)a4 binOverride:(unsigned __int8)a5;
- (void)_freeCRCharBoxContext;
- (void)_freeSumDerivVectors:(__CCSumDerivVectors *)a3;
- (void)_freeVImage:(vImage_Buffer *)a3;
- (void)_generateCC:(id)a3 ccBigBoxes:(__CCBigBox *)a4 textOut:(vImage_Buffer *)a5 countBigBox:(unsigned __int8)a6 bufferHeight:(unsigned __int16)a7;
- (void)_generateCRCharBoxInformation_spaceBoxRemovalHistogram:(vImage_Buffer *)a3 zcStartLeft:(unsigned __int16)a4 zcStopRight:(unsigned __int16)a5 rowStartLocation2:(unsigned __int16)a6 lowHighRGB:(__rgbMinMaxFloat *)a7 histCompliancePercent:(float *)a8 varSpaceBox:(float *)a9;
- (void)_generateCRCharBoxInformation_spaceBoxRemovalTightenBox:(vImage_Buffer *)a3 singleVotingImageAddressRef:(char *)a4 adaptOut:(vImage_Buffer *)a5 textOut:(vImage_Buffer *)a6 zcStartLeft:(unsigned __int16)a7 zcStopRight:(unsigned __int16)a8 finalCoordinatesForStub:(__CCBox *)a9 finalCoordinatesForStubRevised:(__CCBox *)a10 finalCharBoxCoordCount:(unint64_t *)a11 useLowLightEnhancement:(unsigned __int8)a12;
- (void)_generateCRCharBoxInformation_spaceBoxRemovalTruthFilter:(float *)a3 magicThresh:(float *)a4 zcStartLeft:(unsigned __int16)a5 zcStopRight:(unsigned __int16)a6 isSpaceBoxAccepted:(BOOL *)a7 histCompliancePercent:(float *)a8 useLowLightEnhancement:(unsigned __int8)a9;
- (void)_generateCRCharBoxInformation_zcFinalVectorFillIn:(vImage_Buffer *)a3;
- (void)_generateFilteredPulseVector:(unint64_t)a3 target:(unint64_t)a4 height:(unint64_t)a5;
- (void)_generatePulseAggregate:(unint64_t)a3 pulseVectorMain:(unint64_t)a4 pulseVectorResult:(unint64_t)a5 metricSelection:(unsigned __int8)a6 bufferHeight:(unsigned __int16)a7 bufferWidth:(unsigned __int16)a8;
- (void)_generatePulseAggregateSmallStubs:(unint64_t)a3 pulseVectorResult:(unint64_t)a4 bufferHeight:(unsigned __int16)a5 bufferWidth:(unsigned __int16)a6;
- (void)_generateZeroCrossingVector:(unint64_t)a3 zcVectorFlag:(unint64_t)a4 width:(unint64_t)a5;
- (void)calculateSumProd:(vImage_Buffer *)a3 prodROIRef:(float *)a4 prodROIRotateRef:(float *)a5 rowStartLocation2:(unsigned __int16)a6 height:(unsigned __int16)a7;
- (void)calculateSumProdAlternative:(vImage_Buffer *)a3 prodROIRef:(float *)a4 prodROIRotateRef:(float *)a5 rowStartLocation2:(unsigned __int16)a6 height:(unsigned __int16)a7;
- (void)computeIndependentTopAndBottomComponents:(__CCBox *)a3 finalCharBoxCoordCount:(unint64_t *)a4;
- (void)dealloc;
- (void)determineColorProfileType:(__CCColorProfileContext *)a3;
- (void)examinePulseWindow:(unsigned __int16)a3 prodBoostNormalized:(float *)a4 pwContext:(__CCPulseWindowContext *)a5 minHeight:(unsigned __int8)a6 maxHeight:(unsigned __int8)a7 thresholdSet:(ThresholdSet_t)a8;
- (void)extractCharBoxHeightInfo:(__CCCharBox *)a3 ccCharBoxesFiltered:(__CCCharBox *)a4 ccYTopLocationsForSort:(unsigned __int16 *)a5 ccYBottomLocationsForSort:(unsigned __int16 *)a6 aggregateGreenBoxesForStubCount:(unsigned __int16)a7 imageWidth:(unsigned __int16)a8;
- (void)fillInOneVector:(vImage_Buffer *)a3 checkFlag:(unint64_t)a4 checkHeight:(BOOL)a5;
- (void)freeColorProfileContext:(__CCColorProfileContext *)a3;
- (void)generateDominantPulse:(unint64_t)a3 rowLocationsRef:(unsigned __int16 *)a4 debugOut:(unsigned __int8)a5 bufferHeight:(unsigned __int16)a6 bufferWidth:(unsigned __int16)a7;
- (void)getLumaHistogram:(vImage_Buffer *)a3 startCC:(unsigned __int16)a4 colorProfileContext:(__CCColorProfileContext *)a5;
- (void)getVotingHistogram:(vImage_Buffer *)a3 colorProfileContext:(__CCColorProfileContext *)a4 startCC:(unsigned __int16)a5 rowStartLocation:(unsigned __int16)a6;
- (void)groupEndpoints:(__CCBox *)a3 finalCharBoxCoordCount:(unint64_t *)a4;
- (void)initializeForImage:(vImage_Buffer *)a3;
- (void)setCharBoxContext:(id)a3;
- (void)setComputeZCVectorHighProbability:(BOOL)a3;
- (void)setDebugFilename:(id)a3;
- (void)setDebugMatlab:(BOOL)a3;
- (void)setDebugOut:(BOOL)a3;
- (void)setIi:(unsigned __int8)a3;
- (void)setMaxBoxWidth:(unsigned int)a3;
- (void)setMaxHeight:(unsigned int)a3;
- (void)setMidRow:(int)a3;
- (void)setMinBoxWidth:(unsigned int)a3;
- (void)setMinHeight:(unsigned int)a3;
- (void)setMmHeightCard:(float)a3;
- (void)setMmWidthCard:(float)a3;
- (void)setPixelHeightCard:(unsigned int)a3;
- (void)setPixelWidthCard:(unsigned int)a3;
- (void)setProfileNormal:(unsigned __int8)a3;
- (void)setStartMaxFind:(unsigned int)a3;
- (void)setStartNormal:(unsigned int)a3;
- (void)setStartSensitized:(unsigned int)a3;
- (void)setStopMaxFind:(unsigned int)a3;
- (void)setStopNormal:(unsigned int)a3;
- (void)setStopSensitized:(unsigned int)a3;
@end

@implementation VNCCTextDetector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugFilename, 0);
  objc_storeStrong((id *)&self->_charBoxContext, 0);

  objc_storeStrong((id *)&self->_VNMetalInterface, 0);
}

- (void)setDebugFilename:(id)a3
{
}

- (NSString)debugFilename
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDebugOut:(BOOL)a3
{
  self->_debugOut = a3;
}

- (BOOL)debugOut
{
  return self->_debugOut;
}

- (void)setDebugMatlab:(BOOL)a3
{
  self->_debugMatlab = a3;
}

- (BOOL)debugMatlab
{
  return self->_debugMatlab;
}

- (void)setProfileNormal:(unsigned __int8)a3
{
  self->_profileNormal = a3;
}

- (unsigned)profileNormal
{
  return self->_profileNormal;
}

- (void)setIi:(unsigned __int8)a3
{
  self->_ii = a3;
}

- (unsigned)ii
{
  return self->_ii;
}

- (void)setStopSensitized:(unsigned int)a3
{
  self->_stopSensitized = a3;
}

- (unsigned)stopSensitized
{
  return self->_stopSensitized;
}

- (void)setStartSensitized:(unsigned int)a3
{
  self->_startSensitized = a3;
}

- (unsigned)startSensitized
{
  return self->_startSensitized;
}

- (void)setStopNormal:(unsigned int)a3
{
  self->_stopNormal = a3;
}

- (unsigned)stopNormal
{
  return self->_stopNormal;
}

- (void)setStartNormal:(unsigned int)a3
{
  self->_startNormal = a3;
}

- (unsigned)startNormal
{
  return self->_startNormal;
}

- (void)setMaxBoxWidth:(unsigned int)a3
{
  self->_maxBoxWidth = a3;
}

- (unsigned)maxBoxWidth
{
  return self->_maxBoxWidth;
}

- (void)setMinBoxWidth:(unsigned int)a3
{
  self->_minBoxWidth = a3;
}

- (unsigned)minBoxWidth
{
  return self->_minBoxWidth;
}

- (void)setPixelWidthCard:(unsigned int)a3
{
  self->_pixelWidthCard = a3;
}

- (unsigned)pixelWidthCard
{
  return self->_pixelWidthCard;
}

- (void)setPixelHeightCard:(unsigned int)a3
{
  self->_pixelHeightCard = a3;
}

- (unsigned)pixelHeightCard
{
  return self->_pixelHeightCard;
}

- (void)setMmWidthCard:(float)a3
{
  self->_mmWidthCard = a3;
}

- (float)mmWidthCard
{
  return self->_mmWidthCard;
}

- (void)setMmHeightCard:(float)a3
{
  self->_mmHeightCard = a3;
}

- (float)mmHeightCard
{
  return self->_mmHeightCard;
}

- (void)setStopMaxFind:(unsigned int)a3
{
  self->_stopMaxFind = a3;
}

- (unsigned)stopMaxFind
{
  return self->_stopMaxFind;
}

- (void)setStartMaxFind:(unsigned int)a3
{
  self->_startMaxFind = a3;
}

- (unsigned)startMaxFind
{
  return self->_startMaxFind;
}

- (void)setMaxHeight:(unsigned int)a3
{
  self->_maxHeight = a3;
}

- (unsigned)maxHeight
{
  return self->_maxHeight;
}

- (void)setMinHeight:(unsigned int)a3
{
  self->_minHeight = a3;
}

- (unsigned)minHeight
{
  return self->_minHeight;
}

- (void)setMidRow:(int)a3
{
  self->_midRow = a3;
}

- (int)midRow
{
  return self->_midRow;
}

- (void)setComputeZCVectorHighProbability:(BOOL)a3
{
  self->_computeZCVectorHighProbability = a3;
}

- (BOOL)computeZCVectorHighProbability
{
  return self->_computeZCVectorHighProbability;
}

- (void)setCharBoxContext:(id)a3
{
}

- (VNCCCharBoxContext)charBoxContext
{
  return (VNCCCharBoxContext *)objc_getProperty(self, a2, 96, 1);
}

- (id)textBoxesForImage:(id)a3 originatingRequestSpecifier:(id)a4 error:(id *)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v37 = v8;
  unint64_t v10 = [v8 width];
  unint64_t v11 = [v8 height];
  if (v10 >= v11) {
    uint64_t v12 = 480;
  }
  else {
    uint64_t v12 = 768;
  }
  if (v10 >= v11) {
    uint64_t v13 = 768;
  }
  else {
    uint64_t v13 = 480;
  }
  id v58 = 0;
  v14 = (__CVBuffer *)[v8 bufferWithWidth:v13 height:v12 format:1111970369 options:0 error:&v58];
  id v15 = v58;
  id v16 = v15;
  if (v14)
  {
    CVPixelBufferLockBaseAddress(v14, 1uLL);
    BaseAddress = CVPixelBufferGetBaseAddress(v14);
    size_t Width = CVPixelBufferGetWidth(v14);
    size_t Height = CVPixelBufferGetHeight(v14);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v14);
    [(VNCCTextDetector *)self setComputeZCVectorHighProbability:1];
    pixelBuffer = v14;
    v57[0] = BaseAddress;
    v57[1] = Height;
    v57[2] = Width;
    v57[3] = BytesPerRow;
    id v56 = v16;
    v35 = [(VNCCTextDetector *)self textBoxesForBuffer:v57 error:&v56];
    id v38 = v56;

    CVPixelBufferUnlockBaseAddress(v14, 1uLL);
    if (v38)
    {
      if (a5) {
        *a5 = v38;
      }
      CVPixelBufferRelease(v14);
      v21 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      v40 = [MEMORY[0x1E4F1CA48] array];
      v22 = (void *)MEMORY[0x1E4F1CA48];
      v23 = [v35 objectForKeyedSubscript:@"stubBoxNormalized"];
      v39 = [v22 arrayWithArray:v23];

      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      obuint64_t j = [v35 objectForKeyedSubscript:@"textBoxRevisedNormalized"];
      uint64_t v43 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
      if (v43)
      {
        uint64_t v42 = *(void *)v53;
        do
        {
          for (uint64_t i = 0; i != v43; ++i)
          {
            if (*(void *)v53 != v42) {
              objc_enumerationMutation(obj);
            }
            if (CGRectMakeWithDictionaryRepresentation(*(CFDictionaryRef *)(*((void *)&v52 + 1) + 8 * i), &rect))
            {
              v24 = [VNTextObservation alloc];
              v44 = -[VNRectangleObservation initWithOriginatingRequestSpecifier:boundingBox:](v24, "initWithOriginatingRequestSpecifier:boundingBox:", v9, rect.origin.x, 1.0 - rect.origin.y - rect.size.height, rect.size.width);
              id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              long long v49 = 0u;
              long long v50 = 0u;
              long long v47 = 0u;
              long long v48 = 0u;
              id v27 = v39;
              uint64_t v28 = [v27 countByEnumeratingWithState:&v47 objects:v59 count:16];
              if (v28)
              {
                uint64_t v29 = *(void *)v48;
                do
                {
                  for (uint64_t j = 0; j != v28; ++j)
                  {
                    if (*(void *)v48 != v29) {
                      objc_enumerationMutation(v27);
                    }
                    CFDictionaryRef v31 = *(const __CFDictionary **)(*((void *)&v47 + 1) + 8 * j);
                    if (CGRectMakeWithDictionaryRepresentation(v31, &v46))
                    {
                      CGRect v63 = CGRectIntersection(v46, rect);
                      *(float *)&v63.origin.x = v63.size.width * v63.size.height / (v46.size.width * v46.size.height);
                      if (*(float *)&v63.origin.x >= 0.25)
                      {
                        v32 = [VNRectangleObservation alloc];
                        v33 = -[VNRectangleObservation initWithOriginatingRequestSpecifier:boundingBox:](v32, "initWithOriginatingRequestSpecifier:boundingBox:", v9, v46.origin.x, 1.0 - v46.origin.y - v46.size.height, v46.size.width);
                        [v25 addObject:v33];
                        [v26 addObject:v31];
                      }
                    }
                  }
                  uint64_t v28 = [v27 countByEnumeratingWithState:&v47 objects:v59 count:16];
                }
                while (v28);
              }

              [v27 removeObjectsInArray:v26];
              [(VNTextObservation *)v44 setCharacterBoxes:v25];
              [v40 addObject:v44];
            }
          }
          uint64_t v43 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
        }
        while (v43);
      }

      v21 = [v40 sortedArrayUsingComparator:&__block_literal_global_28575];
      CVPixelBufferRelease(pixelBuffer);
    }
    id v16 = v38;
  }
  else
  {
    v21 = (void *)MEMORY[0x1E4F1CBF0];
    if (a5 && v15)
    {
      id v16 = v15;
      *a5 = v16;
    }
  }

  return v21;
}

uint64_t __72__VNCCTextDetector_textBoxesForImage_originatingRequestSpecifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 characterBoxes];
  int v6 = [v5 count];

  v7 = [v4 characterBoxes];
  int v8 = [v7 count];

  if (v6 > v8) {
    uint64_t v9 = -1;
  }
  else {
    uint64_t v9 = v6 < v8;
  }

  return v9;
}

- (id)textBoxesForBuffer:(vImage_Buffer *)a3 error:(id *)a4
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  uint64_t v75 = 0;
  unsigned __int8 v74 = 0;
  unsigned int v73 = 0;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (a3->width <= a3->height) {
    vImagePixelCount height = a3->height;
  }
  else {
    vImagePixelCount height = a3->width;
  }
  int v10 = [(VNCCTextDetector *)self _allocateCRCharBoxContext:height];
  if (v10 != 1
    || (int v10 = -[VNCCTextDetector _allocateVImageWithWidth:height:rowBytes:imageOut:](self, "_allocateVImageWithWidth:height:rowBytes:imageOut:", a3->width, a3->height, a3->width, &v82), v10 != 1)|| (int v10 = -[VNCCTextDetector _allocateVImageWithWidth:height:rowBytes:imageOut:](self, "_allocateVImageWithWidth:height:rowBytes:imageOut:", a3->width, a3->height, a3->width, &v80), v10 != 1)|| (int v10 = -[VNCCTextDetector _allocateVImageWithWidth:height:rowBytes:imageOut:](self, "_allocateVImageWithWidth:height:rowBytes:imageOut:", a3->width,
                a3->height,
                a3->width,
                &v78),
        v10 != 1)
    || (int v10 = -[VNCCTextDetector _allocateVImageWithWidth:height:rowBytes:imageOut:](self, "_allocateVImageWithWidth:height:rowBytes:imageOut:"), v10 != 1))
  {
    unint64_t v11 = 0;
    uint64_t v12 = 0;
    goto LABEL_18;
  }
  unint64_t v11 = malloc_type_calloc(0xC8uLL, 0x1FCuLL, 0x10000402E06451DuLL);
  if (!v11)
  {
    uint64_t v12 = 0;
    int v10 = 0;
    goto LABEL_18;
  }
  uint64_t v12 = malloc_type_calloc(0xC8uLL, 0x1FCuLL, 0x10000402E06451DuLL);
  int v86 = 0;
  uint64_t v85 = 0;
  memset(v84, 0, sizeof(v84));
  long long v13 = *(_OWORD *)&a3->width;
  v72[0] = *(_OWORD *)&a3->data;
  v72[1] = v13;
  [(VNCCTextDetector *)self initializeForImage:v72];
  long long v14 = *(_OWORD *)&a3->width;
  v71[0] = *(_OWORD *)&a3->data;
  v71[1] = v14;
  v70[0] = v82;
  v70[1] = v83;
  int v10 = [(VNCCTextDetector *)self _generateVotingImage:v71 votingImage:v70 useLowLightEnhancement:&v74];
  if (v10 == 1)
  {
    long long v15 = *(_OWORD *)&a3->width;
    v69[0] = *(_OWORD *)&a3->data;
    v69[1] = v15;
    v68[0] = v82;
    v68[1] = v83;
    int v10 = [(VNCCTextDetector *)self _generatePulseVectorOutputs:v69 votingImage:v68 rowLocationsRef:&v87];
    if (v10 == 1)
    {
      BOOL v16 = [(VNCCTextDetector *)self computeZCVectorHighProbability];
      unsigned int v17 = [(VNCCTextDetector *)self minHeight];
      unsigned __int16 v18 = v88;
      int v19 = v89;
      unsigned __int16 v20 = v90;
      int v50 = v87;
      unsigned int v21 = v88 - v87;
      unsigned int v22 = v90 - v89;
      if (v21 <= v17 && v22 <= v17)
      {
LABEL_14:
        if (v21 > v17 || v22 > v17)
        {
          long long v40 = *(_OWORD *)&a3->width;
          if (v16)
          {
            v56[0] = *(_OWORD *)&a3->data;
            v56[1] = v40;
            v55[0] = v80;
            v55[1] = v81;
            v54[0] = v78;
            v54[1] = v79;
            BYTE1(v44) = v74;
            LOBYTE(v44) = v75;
            int v41 = -[VNCCTextDetector _generateCRCharBoxInformation:inputImage:singleVotingImageAddressRef:bigBoxes:bigBoxesAdapt:textOut:adaptOut:lowHighRGB:countBigBox:useLowLightEnhancement:](self, "_generateCRCharBoxInformation:inputImage:singleVotingImageAddressRef:bigBoxes:bigBoxesAdapt:textOut:adaptOut:lowHighRGB:countBigBox:useLowLightEnhancement:", v8, v56, (void)v82, v11, v12, v55, v54, v84, v44);
          }
          else
          {
            v53[0] = *(_OWORD *)&a3->data;
            v53[1] = v40;
            v52[0] = v80;
            v52[1] = v81;
            v51[0] = v80;
            v51[1] = v81;
            BYTE1(v44) = v74;
            LOBYTE(v44) = v75;
            int v41 = -[VNCCTextDetector _generateCRCharBoxInformation:inputImage:singleVotingImageAddressRef:bigBoxes:bigBoxesAdapt:textOut:adaptOut:lowHighRGB:countBigBox:useLowLightEnhancement:](self, "_generateCRCharBoxInformation:inputImage:singleVotingImageAddressRef:bigBoxes:bigBoxesAdapt:textOut:adaptOut:lowHighRGB:countBigBox:useLowLightEnhancement:", v8, v53, (void)v82, v11, v11, v52, v51, v84, v44);
          }
          int v10 = v41;
        }
        else
        {
          int v10 = 1;
        }
        goto LABEL_18;
      }
      int v45 = v90 - v89;
      BOOL v46 = v16;
      unsigned int v47 = v17;
      char v25 = 0;
      char v26 = 1;
      unsigned __int16 v48 = v90;
      int v49 = v89;
      do
      {
        if ((v26 & 1) == 0) {
          unsigned __int16 v18 = v20;
        }
        int v27 = v50;
        if ((v26 & 1) == 0) {
          int v27 = v19;
        }
        int v50 = v27;
        if ((_WORD)v27) {
          BOOL v28 = v18 == 0;
        }
        else {
          BOOL v28 = 1;
        }
        if (!v28)
        {
          long long v29 = *(_OWORD *)&a3->width;
          v67[0] = *(_OWORD *)&a3->data;
          v67[1] = v29;
          v66[0] = v82;
          v66[1] = v83;
          v65[0] = v80;
          v65[1] = v81;
          LOBYTE(v44) = v74;
          WORD1(v42) = v18;
          LOWORD(v42) = v27;
          int v10 = -[VNCCTextDetector _generateAndApplyColorProfileForImage:votingImage:textOut:minMaxRGB:lowHighRGB:numCropRows:rowStartLocation:rowStopLocation:sumTextOutFirstPass:useLowLightEnhancement:](self, "_generateAndApplyColorProfileForImage:votingImage:textOut:minMaxRGB:lowHighRGB:numCropRows:rowStartLocation:rowStopLocation:sumTextOutFirstPass:useLowLightEnhancement:", v67, v66, v65, &v85, v84, (unsigned __int16)(v18 - v27 + 1), v42, &v73, v44);
          if (v10 != 1) {
            goto LABEL_18;
          }
          char v25 = v26 & ((float)((float)v73 / (float)(a3->width * a3->height)) > 0.667);
          unsigned __int16 v20 = v48;
          int v19 = v49;
        }
        char v26 = 0;
        BOOL v28 = v25 == 0;
        char v25 = 1;
      }
      while (!v28);
      v64[0] = v80;
      v64[1] = v81;
      v63[0] = v76;
      v63[1] = v77;
      int v10 = [(VNCCTextDetector *)self _generateSmoothedImage:v64 uImage:v63];
      if (v10 == 1)
      {
        if (a3->height)
        {
          vImagePixelCount v30 = 0;
          do
            [(VNCCCharBoxContext *)self->_charBoxContext clearFlag:512 atIndex:v30++];
          while (a3->height > v30);
        }
        v62[0] = 0u;
        LOWORD(v62[0]) = [(VNCCTextDetector *)self startSensitized];
        WORD1(v62[0]) = [(VNCCTextDetector *)self stopSensitized];
        v62[1] = 0x200uLL;
        vImagePixelCount v31 = a3->height;
        unsigned __int8 v32 = [(VNCCTextDetector *)self maxHeight];
        LOWORD(v42) = a3->width;
        LODWORD(v33) = 1025758986;
        LODWORD(v34) = 1017370378;
        LODWORD(v35) = 1005961871;
        int v10 = -[VNCCTextDetector _getFilterResultOutBothSumDeriv:floatVectorResult:bufferHeight:minHeight:maxHeight:config:bytesPerRow:thresholdSet:sampleImageAddressRef:](self, "_getFilterResultOutBothSumDeriv:floatVectorResult:bufferHeight:minHeight:maxHeight:config:bytesPerRow:thresholdSet:sampleImageAddressRef:", 1, 0, (unsigned __int16)v31, v47, v32, v62, v33, v34, v35, v42, (void)v76);
        if (v10 == 1)
        {
          [(VNCCTextDetector *)self _generatePulseAggregate:512 pulseVectorMain:0x1000000 pulseVectorResult:0x2000000 metricSelection:1 bufferHeight:LOWORD(a3->height) bufferWidth:LOWORD(a3->width)];
          BOOL v16 = v46;
          if (a3->height >= 2)
          {
            vImagePixelCount v36 = 1;
            do
              [(VNCCCharBoxContext *)self->_charBoxContext copyFlagValue:0x2000000 toTarget:0x1000000 atIndex:v36++];
            while (a3->height > v36);
          }
          v61[0] = v76;
          v61[1] = v77;
          LOBYTE(v43) = v74;
          int v37 = [(VNCCTextDetector *)self _generateBoxes:v8 pulseVector:0x1000000 uImage:v61 countBigBoxOut:&v75 bigBoxes:v11 bigBoxesA:v12 useLowLightEnhancement:v43];
          int v10 = v37;
          if (v37 == 1 && v46)
          {
            long long v39 = *(_OWORD *)&a3->width;
            v60[0] = *(_OWORD *)&a3->data;
            v60[1] = v39;
            v59[0] = v78;
            v59[1] = v79;
            int v10 = [(VNCCTextDetector *)self _generateAdaptiveBinarization:v60 adaptImage:v59 useLowLightEnhancement:v74];
            if (v10 != 1) {
              goto LABEL_18;
            }
            v58[0] = v78;
            v58[1] = v79;
            [(VNCCTextDetector *)self _generateCC:v7 ccBigBoxes:v12 textOut:v58 countBigBox:v75 bufferHeight:LOWORD(a3->height)];
          }
          else if (v37 != 1)
          {
            goto LABEL_18;
          }
          v57[0] = v80;
          v57[1] = v81;
          [(VNCCTextDetector *)self _generateCC:v7 ccBigBoxes:v11 textOut:v57 countBigBox:v75 bufferHeight:LOWORD(a3->height)];
          unsigned int v21 = v18 - (unsigned __int16)v50;
          unsigned int v17 = v47;
          unsigned int v22 = v45;
          goto LABEL_14;
        }
      }
    }
  }
LABEL_18:
  free(v11);
  free(v12);
  [(VNCCTextDetector *)self _freeCRCharBoxContext];
  [(VNCCTextDetector *)self _freeVImage:&v82];
  [(VNCCTextDetector *)self _freeVImage:&v76];
  [(VNCCTextDetector *)self _freeVImage:&v78];
  [(VNCCTextDetector *)self _freeVImage:&v80];
  if (v10)
  {
    id v23 = v8;
  }
  else
  {
    if (a4)
    {
      *a4 = +[VNError errorForInternalErrorWithLocalizedDescription:@"VNCCTextDetector internal error"];
    }
    id v23 = (id)MEMORY[0x1E4F1CC08];
  }

  return v23;
}

- (int)_generatePulseVectorOutputs:(vImage_Buffer *)a3 votingImage:(vImage_Buffer *)a4 rowLocationsRef:(unsigned __int16 *)a5
{
  if (!a5) {
    return 0;
  }
  v21[0] = [(VNCCTextDetector *)self startNormal];
  v21[1] = [(VNCCTextDetector *)self stopNormal];
  v21[2] = [(VNCCTextDetector *)self startSensitized];
  v21[3] = [(VNCCTextDetector *)self stopSensitized];
  long long v22 = xmmword_1A410C410;
  LOWORD(v22) = 257;
  uint64_t v23 = 512;
  uint64_t height_low = LOWORD(a3->height);
  unsigned __int8 v10 = [(VNCCTextDetector *)self minHeight];
  unsigned __int8 v11 = [(VNCCTextDetector *)self maxHeight];
  LOWORD(v20) = a4->rowBytes;
  LODWORD(v12) = 1025758986;
  LODWORD(v13) = 1017370378;
  LODWORD(v14) = 1005961871;
  int result = -[VNCCTextDetector _getFilterResultOutBothSumDeriv:floatVectorResult:bufferHeight:minHeight:maxHeight:config:bytesPerRow:thresholdSet:sampleImageAddressRef:](self, "_getFilterResultOutBothSumDeriv:floatVectorResult:bufferHeight:minHeight:maxHeight:config:bytesPerRow:thresholdSet:sampleImageAddressRef:", 0, 0, height_low, v10, v11, v21, v12, v13, v14, v20, a4->data);
  if (result == 1)
  {
    [(VNCCTextDetector *)self _generatePulseAggregate:256 pulseVectorMain:512 pulseVectorResult:0x100000 metricSelection:0 bufferHeight:LOWORD(a3->height) bufferWidth:LOWORD(a3->width)];
    [(VNCCTextDetector *)self _generatePulseAggregate:1024 pulseVectorMain:2048 pulseVectorResult:0x200000 metricSelection:0 bufferHeight:LOWORD(a3->height) bufferWidth:LOWORD(a3->width)];
    if (a3->height)
    {
      vImagePixelCount v16 = 0;
      do
      {
        [(VNCCCharBoxContext *)self->_charBoxContext copyFlagValue:0x100000 toTarget:0x400000 atIndex:v16];
        [(VNCCCharBoxContext *)self->_charBoxContext copyFlagValue:0x200000 toTarget:0x800000 atIndex:v16++];
        vImagePixelCount height = a3->height;
      }
      while (height > v16);
    }
    else
    {
      vImagePixelCount height = 0;
    }
    [(VNCCTextDetector *)self _generateFilteredPulseVector:0x100000 target:0x400000 height:height];
    [(VNCCTextDetector *)self _generateFilteredPulseVector:0x200000 target:0x800000 height:a3->height];
    [(VNCCTextDetector *)self _generatePulseAggregate:0x200000 pulseVectorMain:0x100000 pulseVectorResult:0x1000000 metricSelection:0 bufferHeight:LOWORD(a3->height) bufferWidth:LOWORD(a3->width)];
    [(VNCCTextDetector *)self _generatePulseAggregate:0x800000 pulseVectorMain:0x400000 pulseVectorResult:0x1000000 metricSelection:0 bufferHeight:LOWORD(a3->height) bufferWidth:LOWORD(a3->width)];
    [(VNCCTextDetector *)self generateDominantPulse:0x1000000 rowLocationsRef:a5 debugOut:[(VNCCTextDetector *)self debugOut] bufferHeight:LOWORD(a3->height) bufferWidth:LOWORD(a3->width)];
    vImagePixelCount v18 = a3->height;
    if (v18)
    {
      for (vImagePixelCount i = 0; i < v18; ++i)
      {
        [(VNCCCharBoxContext *)self->_charBoxContext copyFlagValue:0x1000000 toTarget:0x80000 atIndex:i];
        vImagePixelCount v18 = a3->height;
      }
    }
    [(VNCCTextDetector *)self _generatePulseAggregateSmallStubs:0x80000 pulseVectorResult:0x1000000 bufferHeight:(unsigned __int16)v18 bufferWidth:LOWORD(a3->width)];
    return 1;
  }
  return result;
}

- (int)_generateCRCharBoxInformation:(id)a3 inputImage:(vImage_Buffer *)a4 singleVotingImageAddressRef:(char *)a5 bigBoxes:(__CCBigBox *)a6 bigBoxesAdapt:(__CCBigBox *)a7 textOut:(vImage_Buffer *)a8 adaptOut:(vImage_Buffer *)a9 lowHighRGB:(__rgbMinMaxFloat *)a10 countBigBox:(unsigned __int8)a11 useLowLightEnhancement:(unsigned __int8)a12
{
  id v17 = a3;
  LODWORD(v18) = 0;
  int v19 = 0;
  if (!v17 || !a5 || !a6 || !a7)
  {
    uint64_t v20 = 0;
    unsigned int v21 = 0;
    long long v22 = 0;
    uint64_t v23 = 0;
    goto LABEL_77;
  }
  v128 = a7;
  v129 = a5;
  uint64_t v20 = 0;
  unsigned int v21 = 0;
  long long v22 = 0;
  uint64_t v23 = 0;
  if (a10)
  {
    unsigned int v21 = malloc_type_calloc(0x32uLL, 0xAuLL, 0x100004080B1215BuLL);
    if (v21)
    {
      long long v22 = malloc_type_calloc(0x32uLL, 0xAuLL, 0x100004080B1215BuLL);
      if (v22)
      {
        uint64_t v20 = malloc_type_calloc(0xC8uLL, 8uLL, 0x100004000313F17uLL);
        if (v20)
        {
          uint64_t v23 = (unsigned __int16 *)malloc_type_calloc(0xC8uLL, 8uLL, 0x100004000313F17uLL);
          if (v23)
          {
            vImagePixelCount v18 = (unsigned __int8 *)malloc_type_calloc(0xC8uLL, 1uLL, 0x100004077774924uLL);
            if (v18)
            {
              uint64_t v145 = 0;
              v146[0] = 0;
              char v144 = 0;
              unint64_t v143 = 0;
              __int16 v142 = 0;
              v24 = [v17 objectForKeyedSubscript:@"stubBox"];

              if (!v24)
              {
                char v25 = [MEMORY[0x1E4F1CA48] array];
                [v17 setObject:v25 forKeyedSubscript:@"stubBox"];
              }
              char v26 = [v17 objectForKeyedSubscript:@"stubBoxNormalized"];

              if (!v26)
              {
                int v27 = [MEMORY[0x1E4F1CA48] array];
                [v17 setObject:v27 forKeyedSubscript:@"stubBoxNormalized"];
              }
              unsigned int v120 = [(VNCCTextDetector *)self minHeight];
              unsigned int v119 = [(VNCCTextDetector *)self maxHeight];
              BOOL v113 = [(VNCCTextDetector *)self computeZCVectorHighProbability];
              BOOL v28 = [(VNCCCharBoxContext *)self->_charBoxContext charBoxFlags];
              v121 = v18;
              v112 = v20;
              v115 = v22;
              v116 = v21;
              v122 = (char *)v23;
              if (a4->height < 2)
              {
                LODWORD(v18) = 1;
              }
              else
              {
                v114 = a8;
                int v29 = 0;
                __int16 v30 = 0;
                v109 = v23 + 2;
                uint64_t v31 = 1;
                unint64_t v32 = *v28;
                do
                {
                  double v33 = [(VNCCCharBoxContext *)self->_charBoxContext charBoxFlags];
                  unint64_t v34 = v33[v31];
                  if ((((v32 & 0x1000000) == 0) & BYTE3(v34)) != 0) {
                    int v35 = v31;
                  }
                  else {
                    int v35 = v29;
                  }
                  if ((_WORD)v35) {
                    BOOL v36 = (v33[v31] & 0x1000000) == 0;
                  }
                  else {
                    BOOL v36 = 0;
                  }
                  if (v36) {
                    __int16 v30 = v31 - 1;
                  }
                  if ((_WORD)v35) {
                    BOOL v37 = v30 == 0;
                  }
                  else {
                    BOOL v37 = 1;
                  }
                  if (v37)
                  {
                    LODWORD(v18) = 1;
                  }
                  else
                  {
                    unint64_t v127 = v33[v31];
                    if (v120 <= (unsigned __int16)(v30 - v35 + 1) && v119 >= (unsigned __int16)(v30 - v35 + 1))
                    {
                      long long v39 = *(_OWORD *)&a4->width;
                      v141[0] = *(_OWORD *)&a4->data;
                      v141[1] = v39;
                      long long v40 = *(_OWORD *)&v114->width;
                      v140[0] = *(_OWORD *)&v114->data;
                      v140[1] = v40;
                      long long v41 = *(_OWORD *)&a9->width;
                      v139[0] = *(_OWORD *)&a9->data;
                      v139[1] = v41;
                      LOBYTE(v108) = a12;
                      LOBYTE(v107) = a11;
                      WORD2(v106) = v30;
                      unsigned __int16 v126 = v35;
                      WORD1(v106) = v35;
                      LOWORD(v106) = v30 - v35 + 1;
                      int v42 = -[VNCCTextDetector _generateCRCharBoxInformation_zcFinalVectorOriginate:textOut:adaptOut:bigBoxes:bigBoxesAdapt:ccCharBoxesAggr:ccCharBoxesFiltered:height:rowStartLocation2:rowStopLocation2:singleVotingImageAddressRef:countBigBox:filterWalkUpDownCount:useLowLightEnhancement:](self, "_generateCRCharBoxInformation_zcFinalVectorOriginate:textOut:adaptOut:bigBoxes:bigBoxesAdapt:ccCharBoxesAggr:ccCharBoxesFiltered:height:rowStartLocation2:rowStopLocation2:singleVotingImageAddressRef:countBigBox:filterWalkUpDownCount:useLowLightEnhancement:", v141, v140, v139, a6, v128, v116, v115, v106, v129, v107, &v142, v108);
                      LOWORD(v35) = v126;
                      if (v42 == 1)
                      {
                        int v43 = [(VNCCCharBoxContext *)self->_charBoxContext medianHeightBottom];
                        int v44 = [(VNCCCharBoxContext *)self->_charBoxContext medianHeightTop];
                        int v45 = [(VNCCCharBoxContext *)self->_charBoxContext medianHeightBottom];
                        int v46 = [(VNCCCharBoxContext *)self->_charBoxContext medianHeightTop];
                        if (!v113
                          || (long long v47 = *(_OWORD *)&a4->width,
                              v138[0] = *(_OWORD *)&a4->data,
                              v138[1] = v47,
                              int v48 = [(VNCCTextDetector *)self _generateCRCharBoxInformation_zcFinalVectorHighProbability:v138 zcFinalRange:3], LOWORD(v35) = v126, v48 == 1))
                        {
                          [(VNCCCharBoxContext *)self->_charBoxContext setLoopBigBoxPrev:[(VNCCCharBoxContext *)self->_charBoxContext loopBigBox]];
                          if (!v113 && a4->width >= 2)
                          {
                            vImagePixelCount v49 = 1;
                            do
                              [(VNCCCharBoxContext *)self->_charBoxContext clearFlag:0x8000 atIndex:v49++];
                            while (a4->width > v49);
                          }
                          long long v50 = *(_OWORD *)&a4->width;
                          v137[0] = *(_OWORD *)&a4->data;
                          v137[1] = v50;
                          [(VNCCTextDetector *)self _generateCRCharBoxInformation_zcFinalVectorFillIn:v137];
                          double v51 = (double)(v43 - v44) * 0.25 + -1.0;
                          *(float *)&double v51 = v51;
                          double v52 = (double)(v45 - v46) + (double)(v45 - v46);
                          long long v53 = *(_OWORD *)&a4->width;
                          float v54 = v52;
                          v136[0] = *(_OWORD *)&a4->data;
                          v136[1] = v53;
                          *(float *)&double v52 = v54;
                          int v55 = [(VNCCTextDetector *)self _generateCRCharBoxInformation_spaceBoxRemovalMagicThresh:v136 magicMinHeight:v126 magicMaxHeight:(char *)v146 + 4 rowStartLocation2:v146 magicThresh:a12 magicThreshPrev:v51 useLowLightEnhancement:v52];
                          LOWORD(v35) = v126;
                          if (v55 == 1)
                          {
                            if (a4->width)
                            {
                              vImagePixelCount v56 = 0;
                              unsigned __int16 v57 = 0;
                              unsigned __int16 v58 = 0;
                              do
                              {
                                if ([(VNCCCharBoxContext *)self->_charBoxContext checkFlag:0x8000 atIndex:v56])
                                {
                                  if (v57) {
                                    unsigned __int16 v58 = v56;
                                  }
                                  else {
                                    unsigned __int16 v57 = v56;
                                  }
                                  if (v57 && v58)
                                  {
                                    int v59 = v58 - v57;
                                    if (v59 >= 7
                                      && v54 >= (float)v59
                                      && (long long v60 = *(_OWORD *)&a4->width,
                                          v135[0] = *(_OWORD *)&a4->data,
                                          v135[1] = v60,
                                          -[VNCCTextDetector _generateCRCharBoxInformation_spaceBoxRemovalHistogram:zcStartLeft:zcStopRight:rowStartLocation2:lowHighRGB:histCompliancePercent:varSpaceBox:](self, "_generateCRCharBoxInformation_spaceBoxRemovalHistogram:zcStartLeft:zcStopRight:rowStartLocation2:lowHighRGB:histCompliancePercent:varSpaceBox:", v135, v57, v58, v126, a10, (char *)&v145 + 4, &v145), LOBYTE(v105) = a12, -[VNCCTextDetector _generateCRCharBoxInformation_spaceBoxRemovalTruthFilter:magicThresh:zcStartLeft:zcStopRight:isSpaceBoxAccepted:histCompliancePercent:useLowLightEnhancement:](self, "_generateCRCharBoxInformation_spaceBoxRemovalTruthFilter:magicThresh:zcStartLeft:zcStopRight:isSpaceBoxAccepted:histCompliancePercent:useLowLightEnhancement:", &v145, (char *)v146 + 4, v57, v58,
                                            &v144,
                                            (char *)&v145 + 4,
                                            v105),
                                          v144))
                                    {
                                      long long v61 = *(_OWORD *)&a4->width;
                                      v134[0] = *(_OWORD *)&a4->data;
                                      v134[1] = v61;
                                      long long v62 = *(_OWORD *)&a9->width;
                                      v133[0] = *(_OWORD *)&a9->data;
                                      v133[1] = v62;
                                      long long v63 = *(_OWORD *)&v114->width;
                                      v132[0] = *(_OWORD *)&v114->data;
                                      v132[1] = v63;
                                      LOBYTE(v107) = a12;
                                      [(VNCCTextDetector *)self _generateCRCharBoxInformation_spaceBoxRemovalTightenBox:v134 singleVotingImageAddressRef:v129 adaptOut:v133 textOut:v132 zcStartLeft:v57 zcStopRight:v58 finalCoordinatesForStub:v112 finalCoordinatesForStubRevised:v122 finalCharBoxCoordCount:&v143 useLowLightEnhancement:v107];
                                      unsigned __int16 v57 = v58;
                                    }
                                    else
                                    {
                                      unsigned __int16 v57 = v58;
                                    }
                                  }
                                }
                                ++v56;
                              }
                              while (a4->width > v56);
                            }
                            uint64_t v23 = (unsigned __int16 *)v122;
                            int v64 = [(VNCCTextDetector *)self _generateCRCharBoxInformation_TrackBox:v122 finalCharBoxCoordCount:&v143];
                            LOWORD(v35) = v126;
                            if (v64 == 1)
                            {
                              v111 = [MEMORY[0x1E4F1CA60] dictionary];
                              v124 = [MEMORY[0x1E4F28E78] stringWithString:&stru_1EF75C0C0];
                              v123 = [MEMORY[0x1E4F28E78] stringWithString:&stru_1EF75C0C0];
                              unsigned int v118 = [(VNCCTextDetector *)self pixelHeightCard];
                              unsigned int v117 = [(VNCCTextDetector *)self pixelWidthCard];
                              [(VNCCTextDetector *)self mmHeightCard];
                              float v66 = v65;
                              v110 = a6;
                              [(VNCCTextDetector *)self mmWidthCard];
                              if (v143)
                              {
                                float v68 = v67;
                                unint64_t v69 = 0;
                                char v70 = 1;
                                v71 = v109;
                                v130 = v17;
                                v125 = a4;
                                do
                                {
                                  uint64_t v72 = *(v71 - 2);
                                  __int16 v73 = *(v71 - 1);
                                  uint64_t v74 = *v71;
                                  unsigned __int16 v75 = v71[1];
                                  if ((v70 & 1) == 0)
                                  {
                                    [v124 appendString:@", "];
                                    [v123 appendString:@", "];
                                  }
                                  int v76 = (unsigned __int16)(v73 + v72) - v72;
                                  int v77 = (unsigned __int16)(v75 + v74);
                                  int v78 = v77 - v74;
                                  long long v79 = objc_msgSend(NSString, "stringWithFormat:", @"{{%i,%i},{%i,%i}}", v72, v74, v76, (v77 - v74));
                                  long long v80 = [v130 objectForKey:@"stubBox"];
                                  double v81 = (double)v74;
                                  v147.origin.x = (double)v72;
                                  v147.origin.y = (double)v74;
                                  v147.size.double width = (double)v76;
                                  v147.size.double height = (double)(v77 - (int)v74);
                                  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v147);
                                  [v80 addObject:DictionaryRepresentation];

                                  long long v83 = [v130 objectForKey:@"stubBoxNormalized"];
                                  double width = (double)v125->width;
                                  v148.origin.x = (double)v72 / width;
                                  double height = (double)v125->height;
                                  v148.origin.y = v81 / height;
                                  v148.size.double width = (double)v76 / width;
                                  v148.size.double height = (double)v78 / height;
                                  CFDictionaryRef v86 = CGRectCreateDictionaryRepresentation(v148);
                                  [v83 addObject:v86];

                                  [v124 appendString:v79];
                                  float v87 = v66 * (float)((v118 - v77) / v118);
                                  if (v87 < 0.0) {
                                    float v87 = 0.0;
                                  }
                                  unsigned __int16 v88 = objc_msgSend(NSString, "stringWithFormat:", @"{{%2.4f,%2.4f},{%2.4f,%2.4f}}", (float)(v68 * (float)(v72 / v117)), v87, (float)(v68 * (float)(v76 / v117)), (float)(v66 * (float)(v78 / v118)));
                                  id v17 = v130;
                                  [v123 appendString:v88];
                                  a4 = v125;
                                  uint64_t v23 = (unsigned __int16 *)v122;
                                  v71 += 4;

                                  char v70 = 0;
                                  ++v69;
                                }
                                while (v143 > v69);
                              }
                              [v111 setValue:v124 forKey:@"stubBox"];
                              [v111 setValue:v123 forKey:@"stubBoxMM"];

                              a6 = v110;
                              LOWORD(v35) = v126;
                            }
                          }
                        }
                      }
                    }
                    LOWORD(v104) = a4->height;
                    LODWORD(v18) = [(VNCCTextDetector *)self _generateCRCharBoxInformation_extendTextBoxes:a6 countBigBox:a11 rowStartLocation2:(unsigned __int16)v35 finalCharBoxCoordCount:v143 finalCoordinatesForStubRevised:v23 width:a4->width height:v104 bigBoxIndicator:v121];
                    __int16 v30 = 0;
                    int v35 = 0;
                    unint64_t v143 = 0;
                    LODWORD(v34) = v127;
                  }
                  if (a4->height <= ++v31) {
                    break;
                  }
                  int v29 = v35;
                  LODWORD(v32) = v34;
                }
                while (v18 == 1);
              }
              uint64_t v20 = v112;
              uint64_t v90 = a11;
              if (a11)
              {
                p_var2 = &a6->var2;
                v92 = v121;
                do
                {
                  if (*v92++)
                  {
                    v94 = [v17 objectForKey:@"textBoxRevised"];
                    unsigned int v95 = *p_var2;
                    v149.origin.x = (double)v95;
                    unsigned int v96 = *(p_var2 - 2);
                    v149.origin.y = (double)v96;
                    v149.size.double width = (double)(int)(p_var2[1] - v95);
                    v149.size.double height = (double)(int)(*(p_var2 - 1) - v96);
                    CFDictionaryRef v97 = CGRectCreateDictionaryRepresentation(v149);
                    [v94 addObject:v97];

                    v98 = [v17 objectForKey:@"textBoxRevisedNormalized"];
                    unsigned int v99 = *p_var2;
                    double v100 = (double)a4->width;
                    v150.origin.x = (double)v99 / v100;
                    unsigned int v101 = *(p_var2 - 2);
                    double v102 = (double)a4->height;
                    v150.origin.y = (double)v101 / v102;
                    v150.size.double width = (double)(int)(p_var2[1] - v99) / v100;
                    v150.size.double height = (double)(int)(*(p_var2 - 1) - v101) / v102;
                    CFDictionaryRef v103 = CGRectCreateDictionaryRepresentation(v150);
                    [v98 addObject:v103];
                  }
                  p_var2 += 254;
                  --v90;
                }
                while (v90);
              }
              long long v22 = v115;
              unsigned int v21 = v116;
              int v19 = v121;
              uint64_t v23 = (unsigned __int16 *)v122;
            }
            else
            {
              int v19 = 0;
            }
            goto LABEL_77;
          }
          int v19 = 0;
LABEL_76:
          LODWORD(v18) = 0;
          goto LABEL_77;
        }
        int v19 = 0;
      }
      else
      {
        int v19 = 0;
        uint64_t v20 = 0;
      }
    }
    else
    {
      int v19 = 0;
      uint64_t v20 = 0;
      long long v22 = 0;
    }
    uint64_t v23 = 0;
    goto LABEL_76;
  }
LABEL_77:
  free(v21);
  free(v22);
  free(v20);
  free(v23);
  free(v19);

  return (int)v18;
}

- (int)_generateCRCharBoxInformation_extendTextBoxes:(__CCBigBox *)a3 countBigBox:(unsigned __int8)a4 rowStartLocation2:(unsigned __int16)a5 finalCharBoxCoordCount:(unint64_t)a6 finalCoordinatesForStubRevised:(__CCBox *)a7 width:(unint64_t)a8 height:(unsigned __int16)a9 bigBoxIndicator:(char *)a10
{
  if (a4)
  {
    uint64_t v10 = 0;
    LOBYTE(v11) = 0;
    char v12 = -1;
    double v13 = a3;
    char v14 = -1;
    do
    {
      if (v13->var0 == a5)
      {
        BOOL v15 = v12 == 255;
        if (v12 == 255) {
          char v12 = v10;
        }
        if ((_BYTE)v11) {
          int v11 = 1;
        }
        else {
          int v11 = v15;
        }
        if (v11) {
          char v14 = v10;
        }
      }
      else
      {
        if ((_BYTE)v11) {
          break;
        }
        LOBYTE(v11) = 0;
      }
      ++v13;
      ++v10;
    }
    while (a4 != v10);
  }
  else
  {
    char v14 = -1;
    char v12 = -1;
  }
  if (a6)
  {
    uint64_t v16 = 0;
    int v17 = 0;
    if (v12 <= v14) {
      int v18 = v14;
    }
    else {
      int v18 = v12;
    }
    do
    {
      int v19 = &a7[v16];
      int var0 = (__int16)v19->var0;
      __int16 v21 = v19->var1 + var0;
      if (v12 <= v14)
      {
        p_int var3 = &a3[v12].var3;
        uint64_t v26 = v12;
        while (1)
        {
          int v27 = *(p_var3 - 1);
          int v28 = *p_var3;
          BOOL v29 = var0 >= v27 && v21 <= v28;
          if (v29)
          {
            ++v17;
            goto LABEL_60;
          }
          if (var0 < v27 && v21 >= v27)
          {
            ++v17;
            *(p_var3 - 1) = (var0 - 7) & ~((__int16)(var0 - 7) >> 15);
            goto LABEL_60;
          }
          if (var0 < v28 && v21 > v28) {
            break;
          }
          ++v26;
          p_var3 += 254;
          if (v18 + 1 == v26) {
            goto LABEL_22;
          }
        }
        ++v17;
        unsigned __int16 v37 = v21 + 7;
        if (a8 <= (__int16)(v21 + 7)) {
          unsigned __int16 v37 = a8 - 1;
        }
        unsigned __int16 *p_var3 = v37;
LABEL_60:
        char v38 = 1;
      }
      else
      {
LABEL_22:
        int v22 = v17 + 1;
        unint64_t v23 = (unsigned __int16)++v17;
        while (v23 < a6)
        {
          int v24 = (__int16)a7[v23].var0;
          if (v24 - v21 > 79)
          {
            int v17 = v22;
            break;
          }
          __int16 v21 = a7[v23].var1 + v24;
          unint64_t v23 = (unsigned __int16)++v22;
          int v17 = v22;
        }
        if ((v12 & 0xFFFF) > v14) {
          goto LABEL_73;
        }
        unint64_t v32 = &a3[(unsigned __int16)v12].var3;
        uint64_t v26 = (unsigned __int16)v12;
        while (1)
        {
          int v33 = (__int16)*(v32 - 1);
          unsigned int v34 = *v32;
          if (var0 < v33 && v33 <= v21) {
            break;
          }
          int v35 = (__int16)v34 - var0;
          if (v35 < 0) {
            int v35 = -v35;
          }
          if (v35 <= 0x50)
          {
            unsigned __int16 v40 = v21 + 7;
            if (a8 <= (__int16)(v21 + 7)) {
              unsigned __int16 v40 = a8 - 1;
            }
            unsigned __int16 *v32 = v40;
            goto LABEL_71;
          }
          int v36 = v21 - v33;
          if (v36 < 0) {
            int v36 = -v36;
          }
          if (v36 <= 0x50)
          {
            *(v32 - 1) = (var0 - 7) & ~((__int16)(var0 - 7) >> 15);
            goto LABEL_71;
          }
          ++v26;
          v32 += 254;
          if ((int)v26 > v14) {
            goto LABEL_73;
          }
        }
        *(v32 - 1) = (var0 - 7) & ~((__int16)(var0 - 7) >> 15);
        if (v21 <= (int)v34) {
          unint64_t v39 = v34;
        }
        else {
          unint64_t v39 = v21;
        }
        if (a8 - 1 < v39) {
          LOWORD(v39) = a8 - 1;
        }
        unsigned __int16 *v32 = v39;
LABEL_71:
        char v38 = 2;
      }
      a10[v26] += v38;
LABEL_73:
      uint64_t v16 = (unsigned __int16)v17;
    }
    while ((unsigned __int16)v17 < a6);
  }
  if ((v12 & 0x80) == 0 && v14 >= v12)
  {
    uint64_t v41 = v12;
    p_int var2 = &a7->var2;
    do
    {
      int v43 = &a3[v41];
      unsigned __int16 v44 = v43->var0;
      unsigned __int16 var1 = v43->var1;
      if (a6)
      {
        int v46 = &a3[v41];
        int var3 = v46->var3;
        int var2 = v46->var2;
        vImagePixelCount v49 = p_var2;
        unint64_t v50 = 1;
        unsigned __int16 v51 = v43->var1;
        unsigned __int16 v52 = v43->var0;
        do
        {
          int v53 = (__int16)(*(v49 - 1) + *(v49 - 2));
          if ((__int16)*(v49 - 2) >= var2 && v53 <= var3)
          {
            int v55 = (__int16)*v49;
            if (v55 < v52) {
              unsigned __int16 v52 = *v49;
            }
            if ((__int16)(v49[1] + v55) > (int)v51) {
              unsigned __int16 v51 = v49[1] + v55;
            }
          }
          BOOL v56 = v53 > var3 || v50++ >= a6;
          v49 += 4;
        }
        while (!v56);
      }
      else
      {
        unsigned __int16 v52 = v43->var0;
        unsigned __int16 v51 = v43->var1;
      }
      if (v51 < a9)
      {
        unsigned __int16 v44 = v52;
        unsigned __int16 var1 = v51;
      }
      v43->int var0 = v44;
      v43->unsigned __int16 var1 = var1;
      BOOL v29 = v41++ < v14;
    }
    while (v29);
  }
  return 1;
}

- (void)_freeCRCharBoxContext
{
}

- (int)_allocateCRCharBoxContext:(unint64_t)a3
{
  return [(VNCCCharBoxContext *)self->_charBoxContext makeAllocationsForWidth:a3];
}

- (void)_generateCRCharBoxInformation_zcFinalVectorFillIn:(vImage_Buffer *)a3
{
  BOOL v5 = [(VNCCTextDetector *)self computeZCVectorHighProbability];
  long long v6 = *(_OWORD *)&a3->width;
  v72[0] = *(_OWORD *)&a3->data;
  v72[1] = v6;
  [(VNCCTextDetector *)self fillInOneVector:v72 checkFlag:0x4000 checkHeight:0];
  if (a3->width >= 2)
  {
    __int16 v7 = 0;
    __int16 v8 = 0;
    vImagePixelCount v9 = 1;
    do
    {
      unsigned int v10 = [(VNCCCharBoxContext *)self->_charBoxContext checkFlag:0x2000 atIndex:v9];
      unsigned int v11 = [(VNCCCharBoxContext *)self->_charBoxContext checkFlag:0x2000 atIndex:(v9 - 1)];
      if (v11) {
        BOOL v12 = 1;
      }
      else {
        BOOL v12 = v10 == 0;
      }
      if (!v12 && v8 == 0) {
        __int16 v8 = v9;
      }
      if (v8) {
        BOOL v14 = v11 == 0;
      }
      else {
        BOOL v14 = 1;
      }
      if (!v14 && v10 == 0) {
        __int16 v7 = v9 - 1;
      }
      if (v8) {
        BOOL v16 = v7 == 0;
      }
      else {
        BOOL v16 = 1;
      }
      if (!v16)
      {
        long long v17 = *(_OWORD *)&a3->width;
        v71[0] = *(_OWORD *)&a3->data;
        v71[1] = v17;
        [(VNCCTextDetector *)self fillInOneVector:v71 checkFlag:8 checkHeight:1];
        __int16 v8 = 0;
        __int16 v7 = 0;
      }
      ++v9;
    }
    while (a3->width > v9);
  }
  if (v5)
  {
    long long v18 = *(_OWORD *)&a3->width;
    v70[0] = *(_OWORD *)&a3->data;
    v70[1] = v18;
    [(VNCCTextDetector *)self fillInOneVector:v70 checkFlag:128 checkHeight:0];
    long long v19 = *(_OWORD *)&a3->width;
    v69[0] = *(_OWORD *)&a3->data;
    v69[1] = v19;
    [(VNCCTextDetector *)self fillInOneVector:v69 checkFlag:64 checkHeight:0];
  }
  unsigned int v20 = [(VNCCTextDetector *)self minBoxWidth];
  unsigned int v21 = [(VNCCTextDetector *)self maxBoxWidth];
  if (a3->width)
  {
    vImagePixelCount v22 = 0;
    unsigned __int16 v23 = 0;
    double v24 = (double)v21 * 1.5;
    int v25 = -v20;
    do
    {
      if ([(VNCCCharBoxContext *)self->_charBoxContext checkFlag:0x8000 atIndex:v22])
      {
        if (v24 < (double)((unsigned __int16)v22 - v23) && v23 != 0)
        {
          uint64_t v27 = (unsigned __int16)(v23 + v20);
          if (v27 <= (unsigned __int16)(v22 - v20))
          {
            do
            {
              if ([(VNCCCharBoxContext *)self->_charBoxContext checkFlag:4 atIndex:v27]) {
                [(VNCCCharBoxContext *)self->_charBoxContext setFlag:0x8000 atIndex:v27];
              }
              uint64_t v27 = (v27 + 1);
            }
            while ((unsigned __int16)v25 + 1 != v27);
          }
        }
        unsigned __int16 v23 = v22;
      }
      ++v22;
      vImagePixelCount width = a3->width;
      LOWORD(v25) = v25 + 1;
    }
    while (width > v22);
    if (width >= 2)
    {
      unsigned __int16 v29 = 0;
      unsigned __int16 v30 = 0;
      float v31 = (double)v20 * 1.5;
      float v32 = roundf(v31);
      uint64_t v33 = 1;
      while (1)
      {
        unsigned int v34 = [(VNCCCharBoxContext *)self->_charBoxContext checkFlag:0x2000 atIndex:v33];
        unsigned int v35 = [(VNCCCharBoxContext *)self->_charBoxContext checkFlag:0x2000 atIndex:(v33 - 1)];
        if (v35) {
          BOOL v36 = 1;
        }
        else {
          BOOL v36 = v34 == 0;
        }
        if (!v36 && v30 == 0) {
          unsigned __int16 v30 = v33;
        }
        if (v30) {
          BOOL v38 = v35 == 0;
        }
        else {
          BOOL v38 = 1;
        }
        if (!v38 && v34 == 0) {
          unsigned __int16 v29 = v33 - 1;
        }
        if (v30) {
          BOOL v40 = v29 == 0;
        }
        else {
          BOOL v40 = 1;
        }
        if (v40) {
          goto LABEL_113;
        }
        if (a3->height == 480) {
          break;
        }
        float v58 = (float)v30;
        if (v32 <= v58) {
          uint64_t v59 = (int)(float)(v58 - v32);
        }
        else {
          uint64_t v59 = 0;
        }
        vImagePixelCount v60 = v20 + v30;
        vImagePixelCount v61 = a3->width;
        if (v61 <= v60) {
          LOWORD(v60) = 0;
        }
        if ((unsigned __int16)(v59 - 1) < (unsigned __int16)v60)
        {
          int v62 = (unsigned __int16)v60 + 1;
          do
          {
            [(VNCCCharBoxContext *)self->_charBoxContext checkFlag:0x8000 atIndex:v59];
            uint64_t v59 = (v59 + 1);
          }
          while (v62 != v59);
          vImagePixelCount v61 = a3->width;
        }
        unsigned __int16 v30 = 0;
        unsigned __int16 v63 = v29 - v20;
        if (v20 > v29) {
          unsigned __int16 v63 = 0;
        }
        float v64 = (float)v61;
        float v65 = v32 + (float)v29;
        unsigned int v66 = (int)v65;
        if (v65 >= v64) {
          unsigned int v66 = 0;
        }
        if (!v63 || !v66)
        {
          unsigned __int16 v29 = 0;
          goto LABEL_113;
        }
        unsigned __int16 v29 = 0;
        if (v66 >= v63)
        {
          uint64_t v67 = v63;
          unsigned int v68 = v66 + 1;
          do
          {
            [(VNCCCharBoxContext *)self->_charBoxContext checkFlag:0x8000 atIndex:v67];
            uint64_t v67 = (v67 + 1);
          }
          while (v68 != v67);
LABEL_112:
          unsigned __int16 v30 = 0;
          unsigned __int16 v29 = 0;
        }
LABEL_113:
        if (a3->width <= ++v33) {
          return;
        }
      }
      float v41 = roundf((float)([(VNCCCharBoxContext *)self->_charBoxContext medianHeightBottom]- [(VNCCCharBoxContext *)self->_charBoxContext medianHeightTop])* 0.5);
      float v42 = (float)v30;
      unsigned int v43 = (int)(float)(v42 - v41);
      BOOL v49 = v41 > v42;
      float v44 = v41 + v42;
      float v45 = (float)a3->width;
      if (v49) {
        uint64_t v46 = 0;
      }
      else {
        uint64_t v46 = v43;
      }
      if (v44 >= v45) {
        unsigned int v47 = 0;
      }
      else {
        unsigned int v47 = (int)v44;
      }
      if (v46) {
        BOOL v48 = v47 == 0;
      }
      else {
        BOOL v48 = 1;
      }
      BOOL v49 = v48 || v46 > v47;
      if (!v49)
      {
        unsigned int v50 = v47 + 1;
        do
        {
          [(VNCCCharBoxContext *)self->_charBoxContext checkFlag:0x8000 atIndex:v46];
          uint64_t v46 = (v46 + 1);
        }
        while (v50 != v46);
        float v45 = (float)a3->width;
      }
      unsigned __int16 v30 = 0;
      float v51 = (float)v29;
      if (v41 <= v51) {
        uint64_t v52 = (int)(float)(v51 - v41);
      }
      else {
        uint64_t v52 = 0;
      }
      float v53 = v41 + v51;
      unsigned int v54 = (int)v53;
      if (v53 >= v45) {
        unsigned int v54 = 0;
      }
      if (v52) {
        BOOL v55 = v54 == 0;
      }
      else {
        BOOL v55 = 1;
      }
      BOOL v56 = v55 || v52 > v54;
      unsigned __int16 v29 = 0;
      if (v56) {
        goto LABEL_113;
      }
      unsigned int v57 = v54 + 1;
      do
      {
        [(VNCCCharBoxContext *)self->_charBoxContext checkFlag:0x8000 atIndex:v52];
        uint64_t v52 = (v52 + 1);
      }
      while (v57 != v52);
      goto LABEL_112;
    }
  }
}

- (void)fillInOneVector:(vImage_Buffer *)a3 checkFlag:(unint64_t)a4 checkHeight:(BOOL)a5
{
  BOOL v5 = a5;
  unsigned int v9 = [(VNCCTextDetector *)self minBoxWidth];
  if (a3->width >= 2)
  {
    unsigned int v10 = v9;
    vImagePixelCount v11 = v9;
    for (vImagePixelCount i = 1; a3->width > i; ++i)
    {
      if (v5)
      {
        int v13 = [(VNCCCharBoxContext *)self->_charBoxContext pulseVectorHeightCharBox][i];
        [(VNCCCharBoxContext *)self->_charBoxContext medianHeightBottom];
        [(VNCCCharBoxContext *)self->_charBoxContext medianHeightTop];
        if (!v13) {
          continue;
        }
      }
      if ([(VNCCCharBoxContext *)self->_charBoxContext checkFlag:a4 atIndex:i])
      {
        if (a3->height == 480)
        {
          int v15 = [(VNCCCharBoxContext *)self->_charBoxContext medianHeightBottom];
          int v16 = v15 - [(VNCCCharBoxContext *)self->_charBoxContext medianHeightTop];
          int v17 = [(VNCCCharBoxContext *)self->_charBoxContext medianHeightBottom];
          int v18 = v17 - [(VNCCCharBoxContext *)self->_charBoxContext medianHeightTop];
          float v19 = (float)(int)i;
          if (v16 < 16)
          {
            double v14 = (double)v18 / 3.0;
            *(float *)&double v14 = v14;
          }
          else
          {
            *(float *)&double v14 = (float)v18 * 0.5;
          }
          float v27 = roundf(*(float *)&v14);
          *(float *)&double v14 = v27 + v19;
          if ((float)(v27 + v19) < (float)a3->width)
          {
            uint64_t v28 = v27 <= v19 ? (int)(float)(v19 - v27) : 0;
            unsigned int v29 = (int)*(float *)&v14;
            BOOL v30 = !v28 || v29 == 0;
            if (!v30 && v28 <= v29)
            {
              unsigned int v32 = v29 + 1;
              while (![(VNCCCharBoxContext *)self->_charBoxContext checkFlag:0x8000 atIndex:v28])
              {
                uint64_t v28 = (v28 + 1);
                if (v32 == v28) {
                  goto LABEL_33;
                }
              }
              continue;
            }
          }
        }
        else
        {
          unsigned __int16 v20 = i - v10;
          if (i < v11) {
            unsigned __int16 v20 = 0;
          }
          vImagePixelCount v21 = v10 + i;
          if (a3->width <= v21) {
            LOWORD(v21) = 0;
          }
          if ((unsigned __int16)(v20 - 1) < (unsigned __int16)v21)
          {
            int v22 = 0;
            uint64_t v23 = v20;
            int v24 = (unsigned __int16)v21 + 1;
            do
            {
              unsigned int v25 = [(VNCCCharBoxContext *)self->_charBoxContext checkFlag:0x8000 atIndex:v23];
              int v26 = v22 << 31 >> 31;
              int v22 = v25 != v26;
              uint64_t v23 = (v23 + 1);
            }
            while (v24 != v23);
            if (v25 != v26) {
              continue;
            }
          }
        }
LABEL_33:
        -[VNCCCharBoxContext setFlag:atIndex:](self->_charBoxContext, "setFlag:atIndex:", 0x8000, i, v14);
      }
    }
  }
}

- (int)_generateCRCharBoxInformation_zcFinalVectorHighProbability:(vImage_Buffer *)a3 zcFinalRange:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  __int16 v7 = (char *)malloc_type_calloc(3 * a3->width, 1uLL, 0x100004077774924uLL);
  __int16 v8 = v7;
  if (v7)
  {
    vImagePixelCount width = a3->width;
    unsigned int v10 = &v7[width];
    if (!width) {
      goto LABEL_6;
    }
    vImagePixelCount v11 = 0;
    do
    {
      [(VNCCCharBoxContext *)self->_charBoxContext clearFlag:0x8000 atIndex:v11];
      [(VNCCCharBoxContext *)self->_charBoxContext clearFlag:0x20000 atIndex:v11];
      [(VNCCCharBoxContext *)self->_charBoxContext clearFlag:0x4000000 atIndex:v11++];
      vImagePixelCount v12 = a3->width;
    }
    while (v12 > v11);
    if (v12 != 1)
    {
LABEL_6:
      unint64_t v13 = 0;
      do
      {
        if ([(VNCCCharBoxContext *)self->_charBoxContext checkFlag:128 atIndex:v13]
          && ([(VNCCCharBoxContext *)self->_charBoxContext checkFlag:64 atIndex:(v13 - 1)]|| [(VNCCCharBoxContext *)self->_charBoxContext checkFlag:64 atIndex:v13]|| [(VNCCCharBoxContext *)self->_charBoxContext checkFlag:64 atIndex:(v13 + 1)]))
        {
          [(VNCCCharBoxContext *)self->_charBoxContext setFlag:0x4000000 atIndex:v13];
        }
        ++v13;
        vImagePixelCount v12 = a3->width;
      }
      while (v12 - 1 > v13);
      if (v12 >= 2)
      {
        unint64_t v14 = 1;
        int v15 = &v8[2 * width];
        do
        {
          char v16 = vaddlv_u8((uint8x8_t)vcnt_s8((int8x8_t)([(VNCCCharBoxContext *)self->_charBoxContext charBoxFlags][8 * v14] & 0x400400C)));
          v15[v14] = v16;
          v10[v14] = v16;
          if (v15[v14] >= 2u) {
            v8[v14] = 1;
          }
          ++v14;
          vImagePixelCount v12 = a3->width;
        }
        while (v12 > v14);
      }
    }
    vImagePixelCount v17 = v4 + 1;
    if (v12 - v4 > v17)
    {
      uint64_t v18 = v4;
      unsigned int v19 = v4 + 2;
      while (1)
      {
        int v20 = v4 + 1;
        if (v8[v17] == 1) {
          break;
        }
LABEL_44:
        ++v17;
        ++v19;
        unsigned int v4 = v20;
        if (v12 - v18 <= v17) {
          goto LABEL_49;
        }
      }
      if (v4 + 2 <= (int)v17 + (int)v18)
      {
        uint64_t v23 = 0;
        unsigned __int16 v22 = 0;
        unsigned __int16 v21 = 0;
        do
        {
          if (v8[v4] == 1) {
            unsigned __int16 v21 = v4;
          }
          if (v8[v19 + v23] == 1) {
            unsigned __int16 v22 = v19 + v23;
          }
          ++v23;
          --v4;
        }
        while ((int)v17 + (int)v23 < (v17 + v18));
      }
      else
      {
        unsigned __int16 v21 = 0;
        unsigned __int16 v22 = 0;
      }
      BOOL v24 = (unsigned __int16)v20 != 0;
      if (!v21) {
        BOOL v24 = 0;
      }
      if (!v24 || v22 == 0)
      {
        if (v24)
        {
          int v26 = (unsigned __int16)v20 + v21;
        }
        else
        {
          if (!(_WORD)v20 || !v22)
          {
            float v29 = (float)v20;
            if (!(_WORD)v20) {
              float v29 = 0.0;
            }
            goto LABEL_43;
          }
          int v26 = (unsigned __int16)v20 + v22;
        }
        double v27 = (double)v26 * 0.5;
      }
      else
      {
        double v27 = (double)((unsigned __int16)v20 + v21 + v22) / 3.0;
      }
      float v28 = v27;
      float v29 = roundf(v28);
LABEL_43:
      uint64_t v30 = (int)v29;
      [(VNCCCharBoxContext *)self->_charBoxContext setFlag:0x20000 atIndex:v30];
      [(VNCCCharBoxContext *)self->_charBoxContext setFlag:0x8000 atIndex:v30];
      vImagePixelCount v12 = a3->width;
      goto LABEL_44;
    }
LABEL_49:
    unsigned int v31 = [(VNCCTextDetector *)self minBoxWidth];
    vImagePixelCount v32 = a3->width;
    if (v32 - v31 > (int)(v31 + 1))
    {
      float v45 = v10;
      uint64_t v33 = v31;
      int v34 = 2 * v31;
      unsigned int v35 = 2 * v31 + 2;
      unsigned int v36 = 2;
      int v37 = -2;
      do
      {
        if (v35 <= v36) {
          unsigned int v38 = v36;
        }
        else {
          unsigned int v38 = v35;
        }
        unsigned int v39 = v36 - 1;
        if ([(VNCCCharBoxContext *)self->_charBoxContext checkFlag:0x20000 atIndex:v36 - 1 + v33]&& v39 <= v39 + v34)
        {
          bzero(&v45[v39], v38 + v37 + 1);
        }
        int v40 = v33 + v36;
        vImagePixelCount v32 = a3->width;
        ++v35;
        ++v36;
        --v37;
      }
      while (v32 - v33 > v40);
      unsigned int v10 = v45;
    }
    if (v32 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      uint64_t v41 = 1;
      unsigned __int16 v42 = 1;
      do
      {
        if (v10[v42 - 1] && v10[v41])
        {
          int v43 = v10[v42 + 1];
          [(VNCCCharBoxContext *)self->_charBoxContext setFlag:0x20000 atIndex:v42];
          [(VNCCCharBoxContext *)self->_charBoxContext setFlag:0x8000 atIndex:v42];
          if (v43) {
            ++v42;
          }
          vImagePixelCount v32 = a3->width;
        }
        uint64_t v41 = ++v42;
      }
      while (v32 - 1 > v42);
    }
  }
  free(v8);
  return v8 != 0;
}

- (int)_generateCRCharBoxInformation_zcFinalVectorOriginate:(vImage_Buffer *)a3 textOut:(vImage_Buffer *)a4 adaptOut:(vImage_Buffer *)a5 bigBoxes:(__CCBigBox *)a6 bigBoxesAdapt:(__CCBigBox *)a7 ccCharBoxesAggr:(__CCCharBox *)a8 ccCharBoxesFiltered:(__CCCharBox *)a9 height:(unsigned __int16)a10 rowStartLocation2:(unsigned __int16)a11 rowStopLocation2:(unsigned __int16)a12 singleVotingImageAddressRef:(char *)a13 countBigBox:(unsigned __int8)a14 filterWalkUpDownCount:(unsigned __int16 *)a15 useLowLightEnhancement:(unsigned __int8)a16
{
  int v17 = 0;
  uint64_t v18 = 0;
  if (!a6 || !a7 || !a8 || !a9 || !a13 || !a15) {
    goto LABEL_43;
  }
  vImagePixelCount width = a3->width;
  BOOL v24 = (char *)malloc_type_malloc(8 * a10 * width, 0x12B4ACE5uLL);
  uint64_t v18 = v24;
  if (!v24)
  {
    int v17 = 0;
LABEL_43:
    [(VNCCTextDetector *)self computeZCVectorHighProbability];
    free(v18);
    return v17;
  }
  uint64_t v72 = a8;
  data = (char *)a4->data;
  v71 = (char *)a5->data;
  vImagePixelCount v26 = a3->width;
  double v27 = &v24[4 * v26 * a10];
  if (v26 == 767) {
    int v28 = 15;
  }
  else {
    int v28 = 12;
  }
  unsigned int v73 = v28;
  [(VNCCCharBoxContext *)self->_charBoxContext setMedianHeightTop:a11];
  [(VNCCCharBoxContext *)self->_charBoxContext setMedianHeightBottom:a12];
  [(VNCCCharBoxContext *)self->_charBoxContext resetBoxBounds];
  if (a3->width)
  {
    vImagePixelCount v29 = 0;
    do
    {
      [(VNCCCharBoxContext *)self->_charBoxContext clearFlag:67203327 atIndex:v29];
      [(VNCCCharBoxContext *)self->_charBoxContext pulseVectorHeightCharBox][v29] = 0;
      [(VNCCCharBoxContext *)self->_charBoxContext pulseVectorHeightCharBoxAdaptive][v29++] = 0;
    }
    while (a3->width > v29);
  }
  long long v30 = *(_OWORD *)&a3->width;
  if (a16)
  {
    v76[0] = *(_OWORD *)&a3->data;
    v76[1] = v30;
    [(VNCCTextDetector *)self calculateSumProdAlternative:v76 prodROIRef:v18 prodROIRotateRef:v27 rowStartLocation2:a11 height:a10];
  }
  else
  {
    v77[0] = *(_OWORD *)&a3->data;
    v77[1] = v30;
    [(VNCCTextDetector *)self calculateSumProd:v77 prodROIRef:v18 prodROIRotateRef:v27 rowStartLocation2:a11 height:a10];
  }
  unsigned int v31 = [(VNCCCharBoxContext *)self->_charBoxContext floatVectorSumProd];
  WORD2(v67) = a10;
  HIDWORD(v64) = [(VNCCTextDetector *)self startMaxFind];
  LODWORD(v67) = [(VNCCTextDetector *)self stopMaxFind];
  LOWORD(v64) = a10 - 1;
  LODWORD(v32) = 1028443341;
  LODWORD(v33) = 1003277517;
  LODWORD(v34) = 1008981770;
  int v35 = [(VNCCTextDetector *)self _getFilterResultOut:v31 defaultRows:767 bufferHeight:(unsigned __int16)width minHeight:v73 maxHeight:35 startRange:0 stopRange:v32 startMaxFind:v33 stopMaxFind:v34 bytesPerRow:v64 thresholdSet:v67 sampleImageAddressRef:a13 sampleImageFloatAddressRef:v27 pulseVectorFlag:4096];
  if (v35 != 1)
  {
    int v17 = v35;
    goto LABEL_43;
  }
  if (a11 <= a12)
  {
    vImagePixelCount v37 = a3->width;
    uint64_t v38 = a11 - 1;
    double v36 = 255.0;
    uint64_t v39 = a11;
    do
    {
      if (v37)
      {
        int v40 = 0;
        uint64_t v41 = &data[a4->rowBytes * v38];
        vImagePixelCount v42 = v37;
        do
        {
          unsigned int v43 = *v41++;
          float v44 = (double)v43 * 255.0;
          *(float *)&v27[4 * (a12 - v39) + 4 * v40] = v44;
          v40 += a10;
          --v42;
        }
        while (v42);
      }
      ++v38;
      BOOL v51 = a12 == v39++;
    }
    while (!v51);
  }
  WORD2(v68) = a10;
  HIDWORD(v65) = [(VNCCTextDetector *)self startMaxFind];
  LODWORD(v68) = [(VNCCTextDetector *)self stopMaxFind];
  LOWORD(v65) = a10 - 1;
  LODWORD(v45) = 1028443341;
  LODWORD(v46) = 1003277517;
  LODWORD(v47) = 1008981770;
  int v17 = [(VNCCTextDetector *)self _getFilterResultOut:0 defaultRows:767 bufferHeight:(unsigned __int16)width minHeight:v73 maxHeight:35 startRange:0 stopRange:v45 startMaxFind:v46 stopMaxFind:v47 bytesPerRow:v65 thresholdSet:v68 sampleImageAddressRef:a13 sampleImageFloatAddressRef:v27 pulseVectorFlag:1];
  BOOL v48 = [(VNCCTextDetector *)self computeZCVectorHighProbability];
  BOOL v50 = v48;
  BOOL v51 = v17 != 1 || !v48;
  if (!v51)
  {
    if (a11 <= a12)
    {
      vImagePixelCount v52 = a3->width;
      uint64_t v53 = a11 - 1;
      double v49 = 255.0;
      uint64_t v54 = a11;
      do
      {
        if (v52)
        {
          int v55 = 0;
          BOOL v56 = &v71[a5->rowBytes * v53];
          vImagePixelCount v57 = v52;
          do
          {
            unsigned int v58 = *v56++;
            float v59 = (double)v58 * 255.0;
            *(float *)&v27[4 * (a12 - v54) + 4 * v55] = v59;
            v55 += a10;
            --v57;
          }
          while (v57);
        }
        ++v53;
        BOOL v51 = a12 == v54++;
      }
      while (!v51);
    }
    WORD2(v69) = a10;
    HIDWORD(v66) = [(VNCCTextDetector *)self startMaxFind];
    LODWORD(v69) = [(VNCCTextDetector *)self stopMaxFind];
    LOWORD(v66) = a10 - 1;
    LODWORD(v60) = 1028443341;
    LODWORD(v61) = 1003277517;
    LODWORD(v62) = 1008981770;
    int v17 = [(VNCCTextDetector *)self _getFilterResultOut:0 defaultRows:767 bufferHeight:(unsigned __int16)width minHeight:v73 maxHeight:35 startRange:0 stopRange:v60 startMaxFind:v61 stopMaxFind:v62 bytesPerRow:v66 thresholdSet:v69 sampleImageAddressRef:a13 sampleImageFloatAddressRef:v27 pulseVectorFlag:16];
  }
  free(v18);
  if (v17 == 1)
  {
    [(VNCCTextDetector *)self _generateZeroCrossingVector:4096 zcVectorFlag:0x4000 width:a3->width];
    [(VNCCTextDetector *)self _generateZeroCrossingVector:1 zcVectorFlag:4 width:a3->width];
    if (v50) {
      [(VNCCTextDetector *)self _generateZeroCrossingVector:16 zcVectorFlag:64 width:a3->width];
    }
    if ([(VNCCCharBoxContext *)self->_charBoxContext loopBigBoxPrev] < a14
      && a6[[(VNCCCharBoxContext *)self->_charBoxContext loopBigBoxPrev]].var0 == a11)
    {
      LOBYTE(v70) = a16;
      WORD1(v66) = a10;
      LOWORD(v66) = a3->width;
      return -[VNCCTextDetector extractBoxesForStub:bigBoxesAdapt:countBigBox:rowStartLocation2:rowStopLocation2:heightConstraint:imageWidth:height:ccCharBoxesAggr:ccCharBoxesFiltered:useLowLightEnhancement:](self, "extractBoxesForStub:bigBoxesAdapt:countBigBox:rowStartLocation2:rowStopLocation2:heightConstraint:imageWidth:height:ccCharBoxesAggr:ccCharBoxesFiltered:useLowLightEnhancement:", a6, a7, a14, v66, v72, a9, v70);
    }
    else
    {
      return 1;
    }
  }
  return v17;
}

- (int)extractBoxesForStub:(__CCBigBox *)a3 bigBoxesAdapt:(__CCBigBox *)a4 countBigBox:(unsigned __int8)a5 rowStartLocation2:(unsigned __int16)a6 rowStopLocation2:(unsigned __int16)a7 heightConstraint:(unsigned __int8)a8 imageWidth:(unsigned __int16)a9 height:(unsigned __int16)a10 ccCharBoxesAggr:(__CCCharBox *)a11 ccCharBoxesFiltered:(__CCCharBox *)a12 useLowLightEnhancement:(unsigned __int8)a13
{
  unint64_t v13 = 0;
  int v14 = 0;
  if (a3 && a4)
  {
    unsigned int v57 = a7;
    if (a11 && a12 != 0)
    {
      uint64_t v17 = a8;
      unsigned int v18 = a6;
      int v19 = a5;
      int v22 = [(VNCCCharBoxContext *)self->_charBoxContext loopBigBoxPrev];
      int v23 = [(VNCCCharBoxContext *)self->_charBoxContext loopBigBoxPrev];
      uint64_t v53 = a12;
      int v55 = a4;
      unsigned int v56 = v18;
      if (v23 < v19)
      {
        BOOL v24 = &a3[v22];
        int var0 = v24->var0;
        do
        {
          int v26 = a3[(__int16)v23].var0;
          if (v26 == var0)
          {
            double v27 = &a3[(__int16)v23];
            [(VNCCCharBoxContext *)self->_charBoxContext setFlag:0x10000 atIndex:v27->var2];
            p_int var3 = &v27->var3;
            [(VNCCCharBoxContext *)self->_charBoxContext setFlag:0x10000 atIndex:v27->var3];
            uint64_t var2 = v27->var2;
            if (var2 <= *p_var3)
            {
              do
              {
                -[VNCCCharBoxContext setFlag:atIndex:](self->_charBoxContext, "setFlag:atIndex:", 0x2000, var2, v53);
                BOOL v30 = var2 >= *p_var3;
                uint64_t var2 = (var2 + 1);
              }
              while (!v30);
            }
          }
          if (v26 != v24->var0) {
            break;
          }
          LOWORD(v23) = v23 + 1;
          int var0 = v26;
        }
        while (v19 > (__int16)v23);
      }
      -[VNCCCharBoxContext setLoopBigBox:](self->_charBoxContext, "setLoopBigBox:", (__int16)v23, v53);
      unsigned int v31 = (char *)malloc_type_calloc(0x12CuLL, 2uLL, 0x1000040BDFB0063uLL);
      unint64_t v13 = v31;
      if (v31)
      {
        double v32 = v31 + 100;
        unsigned __int16 v33 = [(VNCCTextDetector *)self _extractCharBoxCuts:a3 heightConstraint:v17 medianHeightTopVector:v31 medianHeightBottomVector:v31 + 100 isAdaptive:0];
        if ([(VNCCTextDetector *)self computeZCVectorHighProbability]) {
          [(VNCCTextDetector *)self _extractCharBoxCuts:v55 heightConstraint:v17 medianHeightTopVector:v13 + 200 medianHeightBottomVector:v13 + 300 isAdaptive:1];
        }
        uint64_t v34 = a10;
        [(VNCCCharBoxContext *)self->_charBoxContext setMedianHeightTop:0];
        [(VNCCCharBoxContext *)self->_charBoxContext setMedianHeightBottom:0];
        if (v33)
        {
          uint64_t v35 = 0;
          double v36 = v13 + 102;
          uint64_t v37 = 1;
          do
          {
            uint64_t v38 = v35 + 1;
            if (v35 + 1 < (unint64_t)v33)
            {
              uint64_t v39 = v36;
              uint64_t v40 = v33;
              do
              {
                unsigned int v41 = (unsigned __int16)*(v39 - 50);
                unsigned int v42 = *(unsigned __int16 *)&v13[2 * v35];
                if (v41 < v42)
                {
                  *(v39 - 50) = v42;
                  *(_WORD *)&v13[2 * v35] = v41;
                }
                unsigned int v43 = (unsigned __int16)*v39;
                unsigned int v44 = *(unsigned __int16 *)&v32[2 * v35];
                if (v43 < v44)
                {
                  _WORD *v39 = v44;
                  *(_WORD *)&v32[2 * v35] = v43;
                }
                --v40;
                ++v39;
              }
              while (v37 != v40);
            }
            ++v37;
            ++v36;
            ++v35;
          }
          while (v38 != v33);
          if (v33 <= 1u)
          {
            uint64_t v47 = 0;
            uint64_t v34 = 0;
          }
          else
          {
            double v45 = (double)v33 * 0.5;
            float v46 = v45;
            *(float *)&double v45 = v45 + -1.0;
            LODWORD(v34) = llroundf(*(float *)&v45);
            uint64_t v47 = (vcvtms_s32_f32(v46) - 1);
          }
          [(VNCCCharBoxContext *)self->_charBoxContext setMedianHeightTop:*(unsigned __int16 *)&v13[2 * v47]];
          [(VNCCCharBoxContext *)self->_charBoxContext setMedianHeightBottom:*(unsigned __int16 *)&v32[2 * v34]];
          if ([(VNCCCharBoxContext *)self->_charBoxContext medianHeightTop] < v56) {
            [(VNCCCharBoxContext *)self->_charBoxContext setMedianHeightTop:v56];
          }
          LODWORD(v34) = a10;
          if ([(VNCCCharBoxContext *)self->_charBoxContext medianHeightBottom] > v57) {
            [(VNCCCharBoxContext *)self->_charBoxContext setMedianHeightBottom:v57];
          }
        }
        int v48 = [(VNCCCharBoxContext *)self->_charBoxContext medianHeightBottom];
        if ((double)v34 * 0.5 > (double)(v48
                                                      - [(VNCCCharBoxContext *)self->_charBoxContext medianHeightTop]))
        {
          [(VNCCCharBoxContext *)self->_charBoxContext setMedianHeightTop:v56];
          [(VNCCCharBoxContext *)self->_charBoxContext setMedianHeightBottom:v57];
        }
        if (a9)
        {
          uint64_t v49 = 0;
          do
          {
            [(VNCCCharBoxContext *)self->_charBoxContext charboxROIFullVectorRowStart][v49] = 0;
            [(VNCCCharBoxContext *)self->_charBoxContext charboxROIFullVectorHeight2][v49] = 0;
            v49 += 2;
          }
          while (2 * a9 != v49);
        }
        if (a13) {
          BOOL v50 = v55;
        }
        else {
          BOOL v50 = a3;
        }
        uint64_t v51 = [(VNCCTextDetector *)self charBoxesFromTextBoxes:a11 bigBoxes:v50 ccYTopLocationsForSort:v13 + 400 ccYBottomLocationsForSort:v13 + 500];
        if (v51) {
          [(VNCCTextDetector *)self extractCharBoxHeightInfo:a11 ccCharBoxesFiltered:v54 ccYTopLocationsForSort:v13 + 400 ccYBottomLocationsForSort:v13 + 500 aggregateGreenBoxesForStubCount:v51 imageWidth:a9];
        }
        int v14 = 1;
      }
      else
      {
        int v14 = 0;
      }
    }
  }
  free(v13);
  return v14;
}

- (unsigned)charBoxesFromTextBoxes:(__CCCharBox *)a3 bigBoxes:(__CCBigBox *)a4 ccYTopLocationsForSort:(unsigned __int16 *)a5 ccYBottomLocationsForSort:(unsigned __int16 *)a6
{
  int v11 = [(VNCCCharBoxContext *)self->_charBoxContext loopBigBoxPrev];
  if (v11 >= [(VNCCCharBoxContext *)self->_charBoxContext loopBigBox]) {
    return 0;
  }
  unsigned __int16 v12 = 0;
  uint64_t v13 = v11;
  int v14 = &a4[v11];
  do
  {
    for (uint64_t i = 0; i != 50; ++i)
    {
      char v16 = (char *)v14 + i * 10;
      if (!v14->var4[i].var0) {
        break;
      }
      uint64_t v17 = &a3[v12];
      v17->int var0 = v14->var4[i].var0;
      *(void *)&v17->unsigned __int16 var1 = *(void *)(v16 + 10);
      a5[v12] = *((_WORD *)v16 + 7);
      a6[v12] = *((_WORD *)v16 + 8);
      if ((unsigned __int16)(v12 + 1) == 50) {
        unsigned __int16 v12 = 49;
      }
      else {
        ++v12;
      }
    }
    ++v13;
    ++v14;
  }
  while (v13 < [(VNCCCharBoxContext *)self->_charBoxContext loopBigBox]);
  return v12;
}

- (void)extractCharBoxHeightInfo:(__CCCharBox *)a3 ccCharBoxesFiltered:(__CCCharBox *)a4 ccYTopLocationsForSort:(unsigned __int16 *)a5 ccYBottomLocationsForSort:(unsigned __int16 *)a6 aggregateGreenBoxesForStubCount:(unsigned __int16)a7 imageWidth:(unsigned __int16)a8
{
  unsigned int v10 = a8;
  unsigned int v11 = a7;
  int v14 = a4;
  int v15 = self;
  if (!a7) {
    goto LABEL_19;
  }
  unsigned int v98 = a8;
  uint64_t v16 = 0;
  p_charBoxContext = &self->_charBoxContext;
  unsigned int v96 = a7;
  unint64_t v18 = a7;
  do
  {
    int v19 = &a3[v16];
    uint64_t var1 = v19->var1;
    uint64_t var2 = v19->var2;
    if (var1 <= var2)
    {
      int v22 = &a3[v16];
      p_int var3 = &v22->var3;
      p_var4 = &v22->var4;
      uint64_t v25 = var2 + 1;
      do
      {
        unsigned __int16 v26 = *p_var3;
        [(VNCCCharBoxContext *)*p_charBoxContext charboxROIFullVectorRowStart][2 * var1] = v26;
        __int16 v27 = *p_var4 - *p_var3;
        [(VNCCCharBoxContext *)*p_charBoxContext charboxROIFullVectorHeight2][2 * var1++] = v27;
      }
      while (v25 != var1);
    }
    ++v16;
  }
  while (v16 != v18);
  uint64_t v28 = 0;
  vImagePixelCount v29 = a6 + 1;
  BOOL v30 = a5 + 1;
  uint64_t v31 = 1;
  unsigned int v10 = v98;
  int v14 = a4;
  unsigned int v11 = v96;
  do
  {
    uint64_t v32 = v28 + 1;
    if (v28 + 1 < v18)
    {
      unsigned __int16 v33 = v30;
      uint64_t v34 = v29;
      unint64_t v35 = v18;
      do
      {
        unsigned int v36 = *v33;
        unsigned int v37 = a5[v28];
        if (v36 < v37)
        {
          unsigned __int16 *v33 = v37;
          a5[v28] = v36;
        }
        unsigned int v38 = *v34;
        unsigned int v39 = a6[v28];
        if (v38 < v39)
        {
          *uint64_t v34 = v39;
          a6[v28] = v38;
        }
        --v35;
        ++v34;
        ++v33;
      }
      while (v31 != v35);
    }
    ++v31;
    ++v29;
    ++v30;
    ++v28;
  }
  while (v32 != v18);
  int v15 = self;
  if (v96 > 1)
  {
    unint64_t v40 = 0.5;
    double v41 = (double)v96 * 0.5;
    *(float *)&double v41 = v41;
    LODWORD(v15) = vcvtms_s32_f32(*(float *)&v41);
    if (v96)
    {
      LOWORD(v40) = a5[(void)v15];
      double v44 = (double)v40;
      LOWORD(v40) = a6[(void)v15];
      double v45 = (double)v40;
    }
    else
    {
      uint64_t v42 = 2 * (void)v15 - 2;
      LOWORD(v41) = *(unsigned __int16 *)((char *)a5 + v42);
      LOWORD(v8) = a5[(void)v15];
      *(double *)&unint64_t v43 = (double)v8;
      double v44 = ((double)*(unint64_t *)&v41 + *(double *)&v43) * 0.5;
      LOWORD(v43) = *(unsigned __int16 *)((char *)a6 + v42);
      LOWORD(v9) = a6[(void)v15];
      double v45 = ((double)v43 + (double)v9) * 0.5;
    }
    double v48 = v45 - v44;
    [(VNCCCharBoxContext *)*p_charBoxContext setFilterWalkUpDownCount:0];
  }
  else
  {
LABEL_19:
    unsigned int v46 = *a5;
    unsigned int v47 = *a6;
    p_charBoxContext = &v15->_charBoxContext;
    [(VNCCCharBoxContext *)v15->_charBoxContext setFilterWalkUpDownCount:0];
    if (!v11) {
      goto LABEL_29;
    }
    double v48 = (double)v47 - (double)v46;
    unint64_t v18 = v11;
  }
  uint64_t v49 = &a3->var4;
  do
  {
    if ((v11 > 6 || vabdd_f64((double)(unsigned __int16)(*v49 - *(v49 - 1)), v48) / v48 < 0.2) && *(v49 - 4) <= 0x1C0u)
    {
      BOOL v50 = &v14[[(VNCCCharBoxContext *)*p_charBoxContext filterWalkUpDownCount]];
      v50->int var0 = *(v49 - 4);
      *(_DWORD *)&v50->int var3 = *(_DWORD *)(v49 - 1);
      [(VNCCCharBoxContext *)*p_charBoxContext setFilterWalkUpDownCount:(unsigned __int16)([(VNCCCharBoxContext *)*p_charBoxContext filterWalkUpDownCount] + 1)];
    }
    v49 += 5;
    --v18;
  }
  while (v18);
LABEL_29:
  if ([(VNCCCharBoxContext *)*p_charBoxContext filterWalkUpDownCount] >= 3)
  {
    double v52 = 0.0;
    double v53 = 0.0;
    double v54 = 0.0;
    double v55 = 0.0;
    if ([(VNCCCharBoxContext *)*p_charBoxContext filterWalkUpDownCount])
    {
      unint64_t v56 = 0;
      unsigned int v57 = &v14->var4;
      do
      {
        LOWORD(v51) = *(v57 - 4);
        *(double *)&unint64_t v58 = (double)v51;
        double v53 = v53 + *(double *)&v58;
        LOWORD(v58) = *(v57 - 1);
        *(double *)&unint64_t v59 = (double)v58;
        double v54 = v54 + *(double *)&v59;
        LOWORD(v59) = *v57;
        double v55 = v55 + (double)v59;
        ++v56;
        v57 += 5;
      }
      while (v56 < [(VNCCCharBoxContext *)*p_charBoxContext filterWalkUpDownCount]);
    }
    double v60 = v53 / (double)[(VNCCCharBoxContext *)*p_charBoxContext filterWalkUpDownCount];
    double v61 = v54 / (double)[(VNCCCharBoxContext *)*p_charBoxContext filterWalkUpDownCount];
    double v62 = v55 / (double)[(VNCCCharBoxContext *)*p_charBoxContext filterWalkUpDownCount];
    if ([(VNCCCharBoxContext *)*p_charBoxContext filterWalkUpDownCount])
    {
      unint64_t v66 = 0;
      uint64_t v67 = &v14->var4;
      double v68 = 0.0;
      double v69 = 1.0;
      double v52 = 0.0;
      do
      {
        LOWORD(v63) = *(v67 - 4);
        float v70 = (double)v63 - v60;
        LOWORD(v64) = *(v67 - 1);
        float v71 = (double)v64 - v61;
        LOWORD(v65) = *v67;
        float v72 = (double)v65 - v62;
        double v52 = v52 + (float)(v70 * v71);
        double v68 = v68 + (float)(v70 * v72);
        double v69 = v69 + (float)(v70 * v70);
        ++v66;
        v67 += 5;
      }
      while (v66 < [(VNCCCharBoxContext *)*p_charBoxContext filterWalkUpDownCount]);
    }
    else
    {
      double v69 = 1.0;
      double v68 = 0.0;
    }
    double v73 = v52 / v69;
    *(float *)&double v73 = v52 / v69;
    [(VNCCCharBoxContext *)*p_charBoxContext setMTop:v73];
    double v74 = v68 / v69;
    *(float *)&double v74 = v68 / v69;
    [(VNCCCharBoxContext *)*p_charBoxContext setMBottom:v74];
    [(VNCCCharBoxContext *)*p_charBoxContext mTop];
    double v76 = v61 - v75 * v60;
    *(float *)&double v76 = v76;
    [(VNCCCharBoxContext *)*p_charBoxContext setBTop:v76];
    [(VNCCCharBoxContext *)*p_charBoxContext mBottom];
    double v78 = v62 - v77 * v60;
    *(float *)&double v78 = v78;
    [(VNCCCharBoxContext *)*p_charBoxContext setBBottom:v78];
    [(VNCCCharBoxContext *)*p_charBoxContext mTop];
    float v80 = v79;
    [(VNCCCharBoxContext *)*p_charBoxContext bTop];
    *(float *)&double v82 = v80 + v81;
    [(VNCCCharBoxContext *)*p_charBoxContext setPosUL:v82];
    [(VNCCCharBoxContext *)*p_charBoxContext mBottom];
    float v84 = v83;
    [(VNCCCharBoxContext *)*p_charBoxContext bBottom];
    *(float *)&double v86 = v84 + v85;
    [(VNCCCharBoxContext *)*p_charBoxContext setPosLL:v86];
    [(VNCCCharBoxContext *)*p_charBoxContext mTop];
    float v88 = v87;
    [(VNCCCharBoxContext *)*p_charBoxContext bTop];
    *(float *)&double v90 = v89 + (float)(v88 * (float)v10);
    [(VNCCCharBoxContext *)*p_charBoxContext setPosUR:v90];
    [(VNCCCharBoxContext *)*p_charBoxContext mBottom];
    float v92 = v91;
    [(VNCCCharBoxContext *)*p_charBoxContext bBottom];
    *(float *)&double v93 = *(float *)&v93 + (float)(v92 * (float)v10);
    v94 = *p_charBoxContext;
    [(VNCCCharBoxContext *)v94 setPosLR:v93];
  }
}

- (void)calculateSumProdAlternative:(vImage_Buffer *)a3 prodROIRef:(float *)a4 prodROIRotateRef:(float *)a5 rowStartLocation2:(unsigned __int16)a6 height:(unsigned __int16)a7
{
  if (a7)
  {
    uint64_t v8 = 0;
    vImagePixelCount width = a3->width;
    size_t rowBytes = a3->rowBytes;
    unsigned int v11 = (char *)a3->data + rowBytes * a6;
    uint64_t v12 = 4 * width;
    float v13 = 0.0;
    int v14 = a4;
    do
    {
      if (width)
      {
        uint64_t v15 = 0;
        vImagePixelCount v16 = width;
        do
        {
          LOBYTE(v7) = v11[v15 * 4 + 2];
          float v7 = (float)LODWORD(v7);
          if (v13 < v7) {
            float v13 = v7;
          }
          v14[v15++] = v7;
          --v16;
        }
        while (v16);
      }
      ++v8;
      v11 += rowBytes;
      int v14 = (float *)((char *)v14 + v12);
    }
    while (v8 != a7);
    uint64_t v17 = 0;
    unint64_t v18 = &a5[a7 - 1];
    float v19 = 1.0 / v13;
    do
    {
      int v20 = a4;
      unsigned __int16 v21 = v18;
      for (vImagePixelCount i = width; i; --i)
      {
        float v23 = *v20++;
        float *v21 = v19 * v23;
        v21 += a7;
      }
      ++v17;
      --v18;
      a4 = (float *)((char *)a4 + v12);
    }
    while (v17 != a7);
  }
}

- (void)calculateSumProd:(vImage_Buffer *)a3 prodROIRef:(float *)a4 prodROIRotateRef:(float *)a5 rowStartLocation2:(unsigned __int16)a6 height:(unsigned __int16)a7
{
  if ((a3->width & 0xF) != 0) {
    __assert_rtn("-[VNCCTextDetector calculateSumProd:prodROIRef:prodROIRotateRef:rowStartLocation2:height:]", "VNCCTextDetector.mm", 5252, "!(inputImage.width & 0xf)");
  }
  unsigned int v7 = a7;
  if (a7)
  {
    unint64_t v9 = a4;
    int v12 = 0;
    float v13 = (char *)a3->data + a3->rowBytes * a6;
    float v14 = 0.0;
    uint64_t v15 = a4;
    do
    {
      int v16 = [(VNCCTextDetector *)self ii];
      vImagePixelCount width = a3->width;
      if (v16 == 1)
      {
        if (width)
        {
          vImagePixelCount v18 = 0;
          float v19 = v13;
          int v20 = (float32x4_t *)v15;
          do
          {
            int8x16x4_t v45 = vld4q_s8(v19);
            v19 += 64;
            uint16x8_t v21 = vmull_u8(*(uint8x8_t *)v45.val[0].i8, *(uint8x8_t *)v45.val[1].i8);
            uint16x8_t v22 = vmull_high_u8((uint8x16_t)v45.val[0], (uint8x16_t)v45.val[1]);
            uint16x8_t v23 = vmovl_u8(*(uint8x8_t *)v45.val[2].i8);
            v45.val[0] = (int8x16_t)vmovl_high_u8((uint8x16_t)v45.val[2]);
            v45.val[2] = (int8x16_t)vmull_high_u16(v21, v23);
            v45.val[3] = (int8x16_t)vmull_u16(*(uint16x4_t *)v22.i8, *(uint16x4_t *)v45.val[0].i8);
            v45.val[0] = (int8x16_t)vmull_high_u16(v22, (uint16x8_t)v45.val[0]);
            float32x4_t v24 = vcvtq_f32_u32(vmull_u16(*(uint16x4_t *)v21.i8, *(uint16x4_t *)v23.i8));
            float32x4_t v25 = vcvtq_f32_u32((uint32x4_t)v45.val[2]);
            float32x4_t v26 = vcvtq_f32_u32((uint32x4_t)v45.val[3]);
            float32x4_t v27 = vcvtq_f32_u32((uint32x4_t)v45.val[0]);
            *int v20 = v24;
            v20[1] = v25;
            v20[2] = v26;
            v20[3] = v27;
            v20 += 4;
            float v28 = vmaxvq_f32(vmaxq_f32(vmaxq_f32(v24, v25), vmaxq_f32(v26, v27)));
            if (v28 > v14) {
              float v14 = v28;
            }
            v18 += 16;
            vImagePixelCount width = a3->width;
          }
          while (width > v18);
        }
      }
      else if (width)
      {
        vImagePixelCount v29 = 0;
        BOOL v30 = (float32x4_t *)v15;
        uint64_t v31 = v13;
        do
        {
          int8x16x4_t v46 = vld4q_s8(v31);
          v31 += 64;
          uint8x16_t v32 = (uint8x16_t)vmvnq_s8(v46.val[0]);
          uint8x16_t v33 = (uint8x16_t)vmvnq_s8(v46.val[1]);
          v46.val[0] = vmvnq_s8(v46.val[2]);
          v46.val[1] = (int8x16_t)vmull_u8(*(uint8x8_t *)v32.i8, *(uint8x8_t *)v33.i8);
          v46.val[2] = (int8x16_t)vmull_high_u8(v32, v33);
          v46.val[3] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v46.val[0].i8);
          v46.val[0] = (int8x16_t)vmovl_high_u8((uint8x16_t)v46.val[0]);
          float32x4_t v34 = vcvtq_f32_u32(vmull_u16(*(uint16x4_t *)v46.val[1].i8, *(uint16x4_t *)v46.val[3].i8));
          float32x4_t v35 = vcvtq_f32_u32(vmull_high_u16((uint16x8_t)v46.val[1], (uint16x8_t)v46.val[3]));
          float32x4_t v36 = vcvtq_f32_u32(vmull_u16(*(uint16x4_t *)v46.val[2].i8, *(uint16x4_t *)v46.val[0].i8));
          float32x4_t v37 = vcvtq_f32_u32(vmull_high_u16((uint16x8_t)v46.val[2], (uint16x8_t)v46.val[0]));
          *BOOL v30 = v34;
          v30[1] = v35;
          v30[2] = v36;
          v30[3] = v37;
          v30 += 4;
          float v38 = vmaxvq_f32(vmaxq_f32(vmaxq_f32(v34, v35), vmaxq_f32(v36, v37)));
          if (v38 > v14) {
            float v14 = v38;
          }
          v29 += 16;
          vImagePixelCount width = a3->width;
        }
        while (width > v29);
      }
      v15 += width;
      ++v12;
      v13 += a3->rowBytes;
    }
    while (v12 != v7);
    uint64_t v39 = 0;
    unint64_t v40 = &a5[v7 - 1];
    do
    {
      double v41 = v9;
      uint64_t v42 = v40;
      for (vImagePixelCount i = width; i; --i)
      {
        float v44 = *v41++;
        *uint64_t v42 = (float)(1.0 / v14) * v44;
        v42 += v7;
      }
      ++v39;
      --v40;
      v9 += width;
    }
    while (v39 != v7);
  }
}

- (void)_generateZeroCrossingVector:(unint64_t)a3 zcVectorFlag:(unint64_t)a4 width:(unint64_t)a5
{
  unint64_t v9 = [(VNCCCharBoxContext *)self->_charBoxContext charBoxFlags];
  if (a5 >= 2)
  {
    uint64_t v10 = 0;
    unint64_t v11 = *v9;
    unint64_t v12 = a5 - 1;
    do
    {
      unint64_t v13 = v11;
      unint64_t v11 = ([(VNCCCharBoxContext *)self->_charBoxContext charBoxFlags] + 8 * v10)[8];
      unint64_t v14 = v13 & a3;
      if ((v11 & a3) != 0 && v14 == 0)
      {
        charBoxContext = self->_charBoxContext;
        uint64_t v19 = (v10 + 1);
        unint64_t v18 = a4;
      }
      else
      {
        if ((v11 & a3) != 0 || v14 == 0) {
          goto LABEL_14;
        }
        charBoxContext = self->_charBoxContext;
        unint64_t v18 = a4;
        uint64_t v19 = v10;
      }
      [(VNCCCharBoxContext *)charBoxContext setFlag:v18 atIndex:v19];
LABEL_14:
      ++v10;
    }
    while (v12 != v10);
  }
}

- (void)_generateFilteredPulseVector:(unint64_t)a3 target:(unint64_t)a4 height:(unint64_t)a5
{
  unsigned int v9 = [(VNCCTextDetector *)self maxHeight];
  uint64_t v10 = [(VNCCCharBoxContext *)self->_charBoxContext charBoxFlags];
  if (a5 >= 2)
  {
    int v11 = 0;
    LODWORD(v12) = 0;
    unint64_t v13 = *v10;
    uint64_t v14 = 1;
    do
    {
      unint64_t v15 = v13;
      unint64_t v13 = [(VNCCCharBoxContext *)self->_charBoxContext charBoxFlags][8 * v14];
      BOOL v16 = (v15 & a3) == 0 || (v13 & a3) != 0;
      if ((v13 & a3) != 0 && (v15 & a3) == 0) {
        uint64_t v12 = v14;
      }
      else {
        uint64_t v12 = v12;
      }
      if (!v16) {
        int v11 = v14 - 1;
      }
      if (v12) {
        BOOL v17 = v11 == 0;
      }
      else {
        BOOL v17 = 1;
      }
      if (!v17)
      {
        if (v11 - (int)v12 + 1 > v9 && v11 >= (int)v12)
        {
          int v19 = v11 + 1;
          do
          {
            [(VNCCCharBoxContext *)self->_charBoxContext clearFlag:a4 atIndex:v12];
            uint64_t v12 = (v12 + 1);
          }
          while (v19 != v12);
        }
        LODWORD(v12) = 0;
        int v11 = 0;
      }
      ++v14;
    }
    while (v14 != a5);
  }
}

- (unsigned)_extractCharBoxCuts:(__CCBigBox *)a3 heightConstraint:(unsigned __int8)a4 medianHeightTopVector:(unsigned __int16 *)a5 medianHeightBottomVector:(unsigned __int16 *)a6 isAdaptive:(BOOL)a7
{
  BOOL v7 = a7;
  int v30 = a4;
  if (a7) {
    char v10 = 4;
  }
  else {
    char v10 = 0;
  }
  uint64_t v31 = [(VNCCCharBoxContext *)self->_charBoxContext pulseVectorHeightCharBox];
  if (v7) {
    uint64_t v31 = [(VNCCCharBoxContext *)self->_charBoxContext pulseVectorHeightCharBoxAdaptive];
  }
  int v11 = [(VNCCCharBoxContext *)self->_charBoxContext loopBigBoxPrev];
  if (v11 >= [(VNCCCharBoxContext *)self->_charBoxContext loopBigBox])
  {
    LOWORD(v32) = 0;
  }
  else
  {
    int v32 = 0;
    uint64_t v12 = 8 << v10;
    uint64_t v13 = 2 << v10;
    uint64_t v14 = v11;
    do
    {
      for (uint64_t i = 0; i != 50; ++i)
      {
        BOOL v16 = (char *)&a3[v14] + 10 * i;
        uint64_t v17 = *((unsigned __int16 *)v16 + 5);
        if (!*((_WORD *)v16 + 5)) {
          break;
        }
        unint64_t v18 = a3;
        int v19 = (char *)&a3[v14] + 10 * i;
        uint64_t v20 = *((unsigned __int16 *)v19 + 6);
        [(VNCCCharBoxContext *)self->_charBoxContext setFlag:v12 atIndex:v17];
        [(VNCCCharBoxContext *)self->_charBoxContext setFlag:v12 atIndex:v20];
        char v22 = v19[14];
        uint16x8_t v21 = v19 + 14;
        uint16x8_t v23 = (unsigned __int16 *)(v21 + 2);
        v31[v17] = v21[2] - v22;
        v31[v20] = v21[2] - *v21;
        if (v17 <= v20)
        {
          int v24 = v20 + 1;
          do
          {
            [(VNCCCharBoxContext *)self->_charBoxContext setFlag:v13 atIndex:v17];
            uint64_t v17 = (v17 + 1);
          }
          while (v24 != v17);
        }
        int v25 = *(unsigned __int16 *)v21;
        if (*v23 - v25 >= v30)
        {
          a5[(unsigned __int16)v32] = v25;
          a6[(unsigned __int16)v32] = *v23;
          if ((unsigned __int16)(v32 + 1) == 50) {
            int v26 = 49;
          }
          else {
            int v26 = v32 + 1;
          }
          int v32 = v26;
        }
        a3 = v18;
      }
      ++v14;
    }
    while (v14 < [(VNCCCharBoxContext *)self->_charBoxContext loopBigBox]);
  }
  return (unsigned __int16)v32;
}

- (int)_generateCRCharBoxInformation_spaceBoxRemovalMagicThresh:(vImage_Buffer *)a3 magicMinHeight:(float)a4 magicMaxHeight:(float)a5 rowStartLocation2:(unsigned __int16)a6 magicThresh:(float *)a7 magicThreshPrev:(float *)a8 useLowLightEnhancement:(unsigned __int8)a9
{
  unsigned int v59 = a6;
  unsigned int v9 = 0;
  int v10 = 0;
  if (!a7)
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    goto LABEL_78;
  }
  int v11 = a8;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  if (a8)
  {
    uint64_t v14 = a7;
    uint64_t v12 = (float *)malloc_type_calloc(0x32uLL, 4uLL, 0x100004052888210uLL);
    if (!v12)
    {
      int v10 = 0;
      unsigned int v9 = 0;
      uint64_t v13 = 0;
      goto LABEL_78;
    }
    uint64_t v13 = malloc_type_calloc(0x32uLL, 4uLL, 0x100004052888210uLL);
    if (!v13)
    {
      int v10 = 0;
      unsigned int v9 = 0;
      goto LABEL_78;
    }
    int v19 = malloc_type_calloc(0x32uLL, 1uLL, 0x100004077774924uLL);
    unsigned int v9 = v19;
    if (!v19)
    {
      int v10 = 0;
      goto LABEL_78;
    }
    if (!a3->width) {
      goto LABEL_59;
    }
    double v52 = v14;
    double v53 = v11;
    double v54 = v13;
    double v55 = v19;
    vImagePixelCount v20 = 0;
    unsigned __int16 v21 = 0;
    LODWORD(v14) = 0;
    LODWORD(v22) = 0;
    unint64_t v51 = (char *)a3->data + a3->rowBytes * v59 + 1;
    do
    {
      if ([(VNCCCharBoxContext *)self->_charBoxContext checkFlag:0x8000 atIndex:v20])
      {
        uint64_t v22 = v22 ? v22 : (unsigned __int16)v20;
        uint64_t v14 = v22 ? (float *)(unsigned __int16)v20 : (float *)v14;
        if (v22 && v14)
        {
          float v23 = (float)((int)v14 - v22);
          BOOL v24 = v23 < a4 || v23 > a5;
          if (!v24
            && [(VNCCTextDetector *)self startSensitized] <= v22
            && [(VNCCTextDetector *)self stopSensitized] >= v14)
          {
            int v57 = [(VNCCCharBoxContext *)self->_charBoxContext medianHeightBottom];
            int v56 = [(VNCCCharBoxContext *)self->_charBoxContext medianHeightTop];
            unsigned int v25 = [(VNCCCharBoxContext *)self->_charBoxContext medianHeightTop];
            unsigned __int16 v58 = v21;
            if (v25 <= [(VNCCCharBoxContext *)self->_charBoxContext medianHeightBottom])
            {
              int v27 = 0;
              int v26 = 0;
              uint64_t v28 = (int)(v25 - v59);
              do
              {
                if (v14 >= v22)
                {
                  vImagePixelCount v29 = &v51[4 * v22 + a3->rowBytes * v28];
                  uint64_t v30 = (uint64_t)v14 - v22 + 1;
                  do
                  {
                    int v31 = *v29;
                    v29 += 4;
                    v26 += v31;
                    v27 += v31 * v31;
                    --v30;
                  }
                  while (v30);
                }
                BOOL v24 = v28++ < (int)([(VNCCCharBoxContext *)self->_charBoxContext medianHeightBottom]- v59);
              }
              while (v24);
            }
            else
            {
              int v26 = 0;
              int v27 = 0;
            }
            float v32 = (float)((int)v14 - v22 + 1 + (v14 - v22 + 1) * (v57 - v56));
            v12[v58] = sqrtf((float)((float)v27 / v32) - (float)((float)((float)v26 / v32) * (float)((float)v26 / v32)));
            if (v14 >= v22)
            {
              int v33 = 0;
              do
              {
                v33 += [(VNCCCharBoxContext *)self->_charBoxContext checkFlag:4096 atIndex:v22];
                uint64_t v22 = (v22 + 1);
              }
              while (v14 + 1 != v22);
            }
            else
            {
              LOWORD(v33) = 0;
            }
            v55[v58] = (float)((float)(unsigned __int16)v33 / v23) > 0.5;
            unsigned int v9 = v55;
            if ((unsigned __int16)(v58 + 1) >= 0x32u) {
              unsigned __int16 v21 = 50;
            }
            else {
              unsigned __int16 v21 = v58 + 1;
            }
          }
          LODWORD(v22) = v14;
        }
      }
      ++v20;
    }
    while (a3->width > v20);
    LODWORD(v34) = v21;
    int v11 = v53;
    uint64_t v13 = v54;
    uint64_t v14 = v52;
    if (v21)
    {
      uint64_t v35 = 0;
      float v36 = 100000.0;
      do
      {
        if (v9[v35] == 1 && v12[v35] < v36) {
          float v36 = v12[v35];
        }
        ++v35;
      }
      while (v21 != v35);
      if (v21 > 1u)
      {
        uint64_t v37 = 0;
        uint64_t v38 = 1;
        do
        {
          float v39 = v12[v37];
          uint64_t v40 = v38;
          do
          {
            float v41 = v12[v40];
            if (v41 < v39)
            {
              v12[v40] = v39;
              v12[v37] = v41;
              float v39 = v41;
            }
            ++v40;
          }
          while (v21 != v40);
          ++v37;
          ++v38;
        }
        while (v37 != v21 - 1);
        *double v54 = 0;
        double v42 = v36 + -0.1;
        float v43 = *v12;
        uint64_t v44 = 1;
        while (1)
        {
          *(float *)&v54[v44] = v12[v44] - v43;
          float v43 = v12[v44];
          if (v42 < v43) {
            break;
          }
          if (v21 == ++v44) {
            goto LABEL_63;
          }
        }
        LODWORD(v34) = v44;
        goto LABEL_63;
      }
      *double v54 = 0;
      unsigned __int16 v21 = 1;
    }
    else
    {
LABEL_59:
      unsigned __int16 v21 = 0;
      *uint64_t v13 = 0;
    }
    LODWORD(v34) = 1;
LABEL_63:
    unsigned __int8 v45 = 0;
    uint64_t v34 = v34;
    if (v34 <= 1uLL) {
      uint64_t v34 = 1;
    }
    uint64_t v46 = -v34;
    float v47 = -1.0;
    uint64_t v48 = 1;
    do
    {
      if (*(float *)&v13[v48] > v47)
      {
        float v47 = *(float *)&v13[v48];
        unsigned __int8 v45 = v48;
      }
      ++v48;
    }
    while (v46 + v48 != 1);
    float *v14 = 0.0;
    float v49 = (float)(v12[v45] + v12[v45 - 1]) * 0.5;
    float *v14 = v49;
    if (v49 < 0.00001)
    {
      float v49 = *v11;
      float *v14 = *v11;
    }
    if (v49 > 19.0)
    {
      float *v14 = 19.0;
      float v49 = 19.0;
    }
    if (v47 < 11.0)
    {
      float v49 = *v12 + -0.1;
      float *v14 = v49;
    }
    int v10 = 1;
    if (v21 >= 8u && v49 > 0.0) {
      *int v11 = v49;
    }
  }
LABEL_78:
  free(v12);
  free(v13);
  free(v9);
  return v10;
}

- (void)_generateCRCharBoxInformation_spaceBoxRemovalHistogram:(vImage_Buffer *)a3 zcStartLeft:(unsigned __int16)a4 zcStopRight:(unsigned __int16)a5 rowStartLocation2:(unsigned __int16)a6 lowHighRGB:(__rgbMinMaxFloat *)a7 histCompliancePercent:(float *)a8 varSpaceBox:(float *)a9
{
  unsigned int v10 = a6;
  int v11 = a5;
  int v52 = a4;
  data = a3->data;
  size_t rowBytes = a3->rowBytes;
  if ([(VNCCTextDetector *)self ii] == 1)
  {
    float v15 = a7->var0 + -15.0;
    float v16 = a7->var1 + 15.0;
    float v17 = a7->var2 + -15.0;
    float v18 = a7->var4 + -15.0;
    float v19 = a7->var5 + 15.0;
    float v20 = v16;
  }
  else
  {
    float v19 = 0.0;
    float v18 = 0.0;
    float v16 = 0.0;
    float v17 = 0.0;
    float v20 = 0.0;
    float v15 = 0.0;
    if ([(VNCCTextDetector *)self ii] == 2)
    {
      if ([(VNCCTextDetector *)self profileNormal] == 1)
      {
        float v15 = a7[1].var0 + -60.0;
        float v17 = a7[1].var2 + -60.0;
        float v18 = a7[1].var4 + -60.0;
        float v20 = fmaxf(a7[1].var1 + 60.0, 100.0);
        float v16 = fmaxf(a7[1].var3 + 60.0, 100.0);
        float v19 = fmaxf(a7[1].var5 + 60.0, 100.0);
      }
      else
      {
        float v15 = a7->var0 + -60.0;
        float v17 = a7->var2 + -60.0;
        float v18 = a7->var4 + -60.0;
        float v20 = a7->var1 + 60.0;
        float v16 = a7->var3 + 60.0;
        float v19 = a7->var5 + 60.0;
      }
    }
  }
  int v49 = [(VNCCCharBoxContext *)self->_charBoxContext medianHeightBottom];
  int v48 = [(VNCCCharBoxContext *)self->_charBoxContext medianHeightTop];
  unsigned int v21 = [(VNCCCharBoxContext *)self->_charBoxContext medianHeightTop];
  unsigned int v22 = v21 - v10;
  int v24 = ~v10;
  int v50 = v11;
  if ((int)(v21 - v10) >= (int)([(VNCCCharBoxContext *)self->_charBoxContext medianHeightBottom]
                               + ~v10))
  {
    int v29 = 0;
    int v27 = 0;
    unsigned __int16 v25 = 0;
  }
  else
  {
    unsigned __int16 v25 = 0;
    int v26 = data;
    int v27 = 0;
    size_t v28 = rowBytes;
    int v29 = 0;
    uint64_t v30 = v10;
    size_t v31 = v28 * v10;
    int v32 = (__int16)(v11 - 2);
    __int16 v33 = v52 + 2;
    if (v32 <= (__int16)(v52 + 2)) {
      int v34 = (__int16)(v52 + 2);
    }
    else {
      int v34 = (__int16)(v11 - 2);
    }
    uint64_t v35 = v21 - v30;
    uint64_t v36 = (int)v22;
    uint64_t v37 = v34 - (uint64_t)v33 + 1;
    uint64_t v53 = (uint64_t)v26 + 4 * v33 + v31 + 2;
    uint64_t v38 = v35 + 1;
    do
    {
      if ((__int16)(v52 + 2) <= v32)
      {
        float v39 = (unsigned char *)(v53 + a3->rowBytes * v38);
        uint64_t v40 = v37;
        do
        {
          unsigned int v41 = *(v39 - 1);
          LOBYTE(v23) = *v39;
          float v42 = (float)LODWORD(v23);
          BOOL v43 = v15 >= v42 || v20 <= v42;
          float v23 = (float)v41;
          if (!v43 && v17 < v23 && v16 > v23)
          {
            float v23 = (float)*(v39 - 2);
            __int16 v46 = v18 < v23;
            if (v19 <= v23) {
              __int16 v46 = 0;
            }
            v25 += v46;
          }
          v39 += 4;
          v29 += v41;
          v27 += v41 * v41;
          --v40;
        }
        while (v40);
      }
      ++v36;
      ++v38;
    }
    while (v36 < [(VNCCCharBoxContext *)self->_charBoxContext medianHeightBottom] + v24);
  }
  float v47 = (float)((~v48 + v49) * (v50 - v52 - 3));
  *a8 = (float)v25 / v47;
  *a9 = (float)((float)v27 / v47) - (float)((float)((float)v29 / v47) * (float)((float)v29 / v47));
}

- (void)_generateCRCharBoxInformation_spaceBoxRemovalTruthFilter:(float *)a3 magicThresh:(float *)a4 zcStartLeft:(unsigned __int16)a5 zcStopRight:(unsigned __int16)a6 isSpaceBoxAccepted:(BOOL *)a7 histCompliancePercent:(float *)a8 useLowLightEnhancement:(unsigned __int8)a9
{
  float v10 = sqrtf(*a3);
  double v11 = *a4 + -0.1;
  BOOL v12 = v11 > v10 && v10 > 4.0;
  if (v12)
  {
    uint64_t v13 = a5;
    double v14 = 0.0;
    double v15 = 0.0;
    double v16 = 0.0;
    __int16 v17 = a6 - a5;
    if (a6 >= a5)
    {
      size_t v28 = a8;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = a6 + 1;
      do
      {
        v19 += -[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", 4096, v13, v14, v15, v16);
        v21 += [(VNCCCharBoxContext *)self->_charBoxContext checkFlag:1 atIndex:v13];
        [(VNCCCharBoxContext *)self->_charBoxContext checkFlag:16 atIndex:v13];
        v20 += [(VNCCCharBoxContext *)self->_charBoxContext checkFlag:2 atIndex:v13];
        [(VNCCCharBoxContext *)self->_charBoxContext checkFlag:32 atIndex:v13];
        uint64_t v13 = (v13 + 1);
      }
      while (v22 != v13);
      *(float *)&double v16 = (float)(unsigned __int16)v19;
      *(float *)&double v14 = (float)(unsigned __int16)v21;
      *(float *)&double v15 = (float)(unsigned __int16)v20;
      a8 = v28;
    }
    float v23 = (float)(__int16)(v17 + 1);
    BOOL v24 = (float)(*(float *)&v16 / v23) > 0.9;
    if ((float)(*(float *)&v14 / v23) > 0.9) {
      BOOL v24 = 1;
    }
    if ((float)(*(float *)&v15 / v23) > 0.9) {
      BOOL v24 = 1;
    }
  }
  else
  {
    BOOL v24 = 0;
  }
  BOOL v25 = v10 > 4.0;
  if (v11 > v10) {
    BOOL v25 = 0;
  }
  if (a9)
  {
    if (v25) {
      BOOL v26 = 1;
    }
    else {
      BOOL v26 = v24 && v12;
    }
  }
  else
  {
    BOOL v27 = v24 && v12;
    BOOL v26 = (v25 || v27) && *a8 > 0.1;
  }
  *a7 = v26;
}

- (void)_generateCRCharBoxInformation_spaceBoxRemovalTightenBox:(vImage_Buffer *)a3 singleVotingImageAddressRef:(char *)a4 adaptOut:(vImage_Buffer *)a5 textOut:(vImage_Buffer *)a6 zcStartLeft:(unsigned __int16)a7 zcStopRight:(unsigned __int16)a8 finalCoordinatesForStub:(__CCBox *)a9 finalCoordinatesForStubRevised:(__CCBox *)a10 finalCharBoxCoordCount:(unint64_t *)a11 useLowLightEnhancement:(unsigned __int8)a12
{
  int v12 = a8;
  int v13 = a7;
  uint64_t v16 = a7;
  uint64_t v17 = a8;
  if (a7 - 2 <= a8) {
    int v18 = a8;
  }
  else {
    int v18 = a7 - 2;
  }
  while (1)
  {
    int v19 = v16 - 2;
    if (v16 - 2 >= v17) {
      break;
    }
    float v20 = *([(VNCCCharBoxContext *)self->_charBoxContext floatVectorSumProd] + 4 * v16 - 4);
    double v21 = (float)(v20
                - *([(VNCCCharBoxContext *)self->_charBoxContext floatVectorSumProd] + 4 * v16++ - 8));
    if (v21 > 0.005)
    {
      int v18 = v19;
      break;
    }
  }
  if (v18 <= v13 || v18 == v12 - 1) {
    unsigned __int16 v23 = v13;
  }
  else {
    unsigned __int16 v23 = v18;
  }
  if (v12 + 2 >= v23) {
    uint64_t v24 = v23;
  }
  else {
    uint64_t v24 = (v12 + 2);
  }
  while (1)
  {
    uint64_t v25 = v17 + 2;
    if (v17 + 2 <= v23) {
      break;
    }
    float v26 = ([(VNCCCharBoxContext *)self->_charBoxContext floatVectorSumProd] + 4 * v17)[4];
    double v27 = (float)(v26
                - ([(VNCCCharBoxContext *)self->_charBoxContext floatVectorSumProd] + 4 * v17--)[8]);
    if (v27 > 0.005)
    {
      uint64_t v24 = v25;
      break;
    }
  }
  if ((int)v24 >= v12 || v24 == v23 + 1) {
    unsigned __int16 v29 = v12;
  }
  else {
    unsigned __int16 v29 = v24;
  }
  int v30 = [(VNCCCharBoxContext *)self->_charBoxContext medianHeightBottom];
  if (v30 - [(VNCCCharBoxContext *)self->_charBoxContext medianHeightTop] <= 34
    && (int v31 = v29, v29 - v23 >= [(VNCCTextDetector *)self minBoxWidth] - 1)
    || (int v32 = [(VNCCCharBoxContext *)self->_charBoxContext medianHeightBottom],
        v32 - [(VNCCCharBoxContext *)self->_charBoxContext medianHeightTop] >= 35)
    && (int v31 = v29, v29 - v23 >= [(VNCCTextDetector *)self minBoxWidth] + 1))
  {
    unsigned __int16 height = a3->height;
    float v34 = (double)(v31 + v23) * 0.5;
    unsigned __int16 v35 = [(VNCCCharBoxContext *)self->_charBoxContext medianHeightBottom];
    unsigned __int16 v88 = [(VNCCCharBoxContext *)self->_charBoxContext medianHeightTop];
    unsigned __int16 v86 = v35;
    if ([(VNCCCharBoxContext *)self->_charBoxContext medianHeightTop] >= 0x15) {
      int v36 = [(VNCCCharBoxContext *)self->_charBoxContext medianHeightTop] - 20;
    }
    else {
      LOWORD(v36) = 1;
    }
    LODWORD(v24) = llroundf(v34);
    vImagePixelCount v37 = a3->height;
    if (v37 >= (unint64_t)[(VNCCCharBoxContext *)self->_charBoxContext medianHeightBottom]
              + 20)
      LODWORD(v38) = [(VNCCCharBoxContext *)self->_charBoxContext medianHeightBottom] + 20;
    else {
      vImagePixelCount v38 = a3->height;
    }
    LOWORD(v83) = v36;
    unsigned int v39 = (unsigned __int16)v38;
    -[VNCCTextDetector computePulseVectorSum:start:stop:imageHeight:imageWidth:bottomHeight:topHeight:](self, "computePulseVectorSum:start:stop:imageHeight:imageWidth:bottomHeight:topHeight:", a4, v23, v29, v83);
    __int16 v85 = v36;
    if (v39 > (unsigned __int16)v36)
    {
      uint64_t v40 = 0;
      __int16 v41 = 0;
      while (1)
      {
        if ([(VNCCCharBoxContext *)self->_charBoxContext checkFlag:0x40000 atIndex:(v40 + 1)])
        {
          if (![(VNCCCharBoxContext *)self->_charBoxContext checkFlag:0x40000 atIndex:v40]) {
            __int16 v41 = v40 + 1;
          }
        }
        else
        {
          if (v41)
          {
            __int16 v43 = v40;
            unsigned __int16 v42 = height;
            goto LABEL_47;
          }
          __int16 v41 = 0;
        }
        uint64_t v40 = (v40 + 1);
        if (v39 - (unsigned __int16)v36 == v40) {
          goto LABEL_46;
        }
      }
    }
    __int16 v41 = 0;
LABEL_46:
    unsigned __int16 v42 = height;
    __int16 v43 = height;
LABEL_47:
    __int16 v44 = v43;
    unsigned __int16 v90 = v29;
    if ([(VNCCCharBoxContext *)self->_charBoxContext charboxROIFullVectorRowStart][2 * v24])
    {
      unsigned __int16 v45 = [(VNCCCharBoxContext *)self->_charBoxContext charboxROIFullVectorRowStart][2 * v24];
      unsigned __int16 v46 = [(VNCCCharBoxContext *)self->_charBoxContext charboxROIFullVectorHeight2][2 * v24]
          + v45;
    }
    else
    {
      unsigned __int16 v45 = 0;
      unsigned __int16 v46 = v42;
    }
    unsigned __int16 v47 = v86 - v88;
    unsigned __int16 v89 = v44 - v41;
    if ([(VNCCCharBoxContext *)self->_charBoxContext filterWalkUpDownCount] < 3
      || ([(VNCCCharBoxContext *)self->_charBoxContext posLL],
          float v49 = v48,
          [(VNCCCharBoxContext *)self->_charBoxContext posUL],
          (float)(v49 - v50) <= 0.0)
      || ([(VNCCCharBoxContext *)self->_charBoxContext posLR],
          float v52 = v51,
          [(VNCCCharBoxContext *)self->_charBoxContext posUR],
          (float)(v52 - v53) <= 0.0))
    {
      __int16 v58 = 1;
    }
    else
    {
      [(VNCCCharBoxContext *)self->_charBoxContext mTop];
      float v55 = v54;
      float v56 = (float)v24;
      [(VNCCCharBoxContext *)self->_charBoxContext bTop];
      __int16 v58 = vcvtms_s32_f32(v57 + (float)(v55 * (float)v24));
      [(VNCCCharBoxContext *)self->_charBoxContext mBottom];
      float v60 = v59;
      [(VNCCCharBoxContext *)self->_charBoxContext bBottom];
      unsigned __int16 v42 = llroundf(v61 + (float)(v60 * v56));
    }
    unsigned __int16 v87 = v42;
    unsigned __int16 v62 = v42 - v58;
    unsigned __int16 v63 = [(VNCCCharBoxContext *)self->_charBoxContext medianHeightTop];
    unsigned __int16 v64 = [(VNCCCharBoxContext *)self->_charBoxContext medianHeightBottom];
    unsigned int v65 = v47 - v89;
    if ((v65 & 0x80000000) != 0) {
      unsigned int v65 = v89 - v47;
    }
    unsigned int v66 = 3 * v47;
    unsigned int v67 = v47 - (unsigned __int16)(v46 - v45);
    if ((v67 & 0x80000000) != 0) {
      unsigned int v67 = (unsigned __int16)(v46 - v45) - v47;
    }
    unsigned int v68 = v47 - v62;
    if ((v68 & 0x80000000) != 0) {
      unsigned int v68 = v62 - v47;
    }
    if (v65 >= v66 || v65 >= v67 || v65 >= v68)
    {
      double v69 = a11;
      if (v67 >= v66 || v67 >= v65 || v67 >= v68)
      {
        BOOL v71 = v68 < v66 && v68 < v65;
        BOOL v72 = v68 < v67;
        if (v72 && v71) {
          unsigned __int16 v45 = v58;
        }
        else {
          unsigned __int16 v45 = v63;
        }
        if (v72 && v71) {
          unsigned __int16 v46 = v87;
        }
        else {
          unsigned __int16 v46 = v64;
        }
      }
    }
    else
    {
      unsigned __int16 v45 = v85 + v41 - 1;
      unsigned __int16 v46 = v45 + v89;
      double v69 = a11;
    }
    __int16 v73 = vcvtmd_s64_f64((double)([(VNCCCharBoxContext *)self->_charBoxContext medianHeightBottom]- [(VNCCCharBoxContext *)self->_charBoxContext medianHeightTop])* 0.5);
    if (a12)
    {
      long long v74 = *(_OWORD *)&a5->width;
      v94[0] = *(_OWORD *)&a5->data;
      v94[1] = v74;
      float v75 = v94;
    }
    else
    {
      long long v76 = *(_OWORD *)&a6->width;
      v95[0] = *(_OWORD *)&a6->data;
      v95[1] = v76;
      float v75 = v95;
    }
    LOWORD(v84) = v73;
    __CCRange v77 = (__CCRange)[(VNCCTextDetector *)self tightenBox:v75 startTop:v45 startBottom:v46 startPosition:v23 stopPosition:v90 imageHeight:a3->height halfWalk:v84];
    unsigned __int16 var0 = v77.var0;
    unsigned int v79 = HIWORD(*(unsigned int *)&v77) - v77.var0;
    if (v79 > [(VNCCTextDetector *)self minHeight])
    {
      unint64_t v80 = *v69;
      float v81 = &a9[*v69];
      v81->unsigned __int16 var0 = v23;
      v81->uint64_t var1 = v90 - v23;
      v81->uint64_t var2 = var0;
      v81->int var3 = v79;
      a10[v80] = *v81;
      unint64_t v82 = *v69;
      if (*v69 != 199) {
        ++v82;
      }
      *double v69 = v82;
    }
  }
}

- (__CCRange)tightenBox:(vImage_Buffer *)a3 startTop:(unsigned __int16)a4 startBottom:(unsigned __int16)a5 startPosition:(unsigned __int16)a6 stopPosition:(unsigned __int16)a7 imageHeight:(unint64_t)a8 halfWalk:(unsigned __int16)a9
{
  unsigned __int16 v9 = a4;
  if (a4)
  {
    if (a5 > a4 && (a4 + 1) < a8)
    {
      unint64_t v10 = (a5 + 1);
      if (v10 < a8)
      {
        data = (char *)a3->data;
        if (a6 > a7) {
          goto LABEL_17;
        }
        __int16 v12 = 0;
        size_t rowBytes = a3->rowBytes;
        unint64_t v14 = a7 - (unint64_t)a6 + 1;
        double v15 = &data[rowBytes * a4 - 1 + a6];
        do
        {
          __int16 v16 = *v15++;
          v12 += v16;
          --v14;
        }
        while (v14);
        if (v12)
        {
          if (a9)
          {
            unsigned __int16 v17 = 1;
            while (a4 != v17)
            {
              __int16 v18 = 0;
              int v19 = &data[a6 - 1 + rowBytes * (a4 - (unint64_t)v17)];
              unint64_t v20 = a7 - (unint64_t)a6 + 1;
              do
              {
                __int16 v21 = *v19++;
                v18 += v21;
                --v20;
              }
              while (v20);
              if (!v18)
              {
                unsigned __int16 v9 = a4 - v17;
                goto LABEL_28;
              }
              if (a9 < ++v17) {
                goto LABEL_28;
              }
            }
          }
        }
        else
        {
LABEL_17:
          if (a9)
          {
            unsigned __int16 v22 = 1;
            while (a4 + v22 + 1 < a8)
            {
              if (a6 <= a7)
              {
                __int16 v23 = 0;
                uint64_t v24 = &data[a6 - 1 + a3->rowBytes * (a4 + (unint64_t)v22)];
                unint64_t v25 = a7 - (unint64_t)a6 + 1;
                do
                {
                  __int16 v26 = *v24++;
                  v23 += v26;
                  --v25;
                }
                while (v25);
                if (v23)
                {
                  unsigned __int16 v9 = a4 + v22 - 1;
                  goto LABEL_28;
                }
              }
              if (a9 < ++v22) {
                goto LABEL_28;
              }
            }
          }
        }
        if (a6 > a7) {
          goto LABEL_41;
        }
LABEL_28:
        __int16 v27 = 0;
        size_t v28 = a3->rowBytes;
        unint64_t v29 = a7 - (unint64_t)a6 + 1;
        int v30 = &data[v28 * a5 - 1 + a6];
        do
        {
          __int16 v31 = *v30++;
          v27 += v31;
          --v29;
        }
        while (v29);
        if (v27)
        {
          if (a9 && (a5 + 2) < a8)
          {
            uint64_t v32 = (uint64_t)&data[a6 - 1];
            unsigned __int16 v33 = 1;
            while (1)
            {
              __int16 v34 = 0;
              unsigned __int16 v35 = (unsigned __int8 *)(v32 + v28 * (a5 + (unint64_t)v33));
              unint64_t v36 = a7 - (unint64_t)a6 + 1;
              do
              {
                __int16 v37 = *v35++;
                v34 += v37;
                --v36;
              }
              while (v36);
              if (!v34) {
                break;
              }
              if (++v33 > a9 || v10 + v33 >= a8) {
                return (__CCRange)(v9 | (a5 << 16));
              }
            }
            a5 += v33;
          }
        }
        else
        {
LABEL_41:
          if (a9)
          {
            uint64_t v38 = (uint64_t)&data[a6 - 1];
            unsigned __int16 v39 = 1;
            while (a5 != v39)
            {
              if (a6 <= a7)
              {
                __int16 v40 = 0;
                __int16 v41 = (unsigned __int8 *)(v38 + a3->rowBytes * (a5 - (unint64_t)v39));
                unint64_t v42 = a7 - (unint64_t)a6 + 1;
                do
                {
                  __int16 v43 = *v41++;
                  v40 += v43;
                  --v42;
                }
                while (v42);
                if (v40)
                {
                  a5 = a5 - v39 + 1;
                  return (__CCRange)(v9 | (a5 << 16));
                }
              }
              if (a9 < ++v39) {
                return (__CCRange)(v9 | (a5 << 16));
              }
            }
          }
        }
      }
    }
  }
  return (__CCRange)(v9 | (a5 << 16));
}

- (int)computePulseVectorSum:(char *)a3 start:(unsigned __int16)a4 stop:(unsigned __int16)a5 imageHeight:(unint64_t)a6 imageWidth:(unint64_t)a7 bottomHeight:(unsigned __int16)a8 topHeight:(unsigned __int16)a9
{
  int v12 = a5;
  unsigned int v13 = a4;
  int v16 = a5 - a4;
  unsigned __int16 v17 = a8 - a9 + 1;
  int v37 = a5 - a4 + 1;
  __int16 v18 = malloc_type_calloc(v37 * v17, 4uLL, 0x100004052888210uLL);
  if (v18)
  {
    if (a6 - 5 >= (unsigned __int16)(a8 + 1)) {
      unsigned __int16 v20 = v17;
    }
    else {
      unsigned __int16 v20 = a6 - 5 - a9;
    }
    uint64_t v21 = v20;
    unsigned __int16 v22 = v18;
    if (v20)
    {
      int v23 = 0;
      uint64_t v24 = &a3[a9 * a7];
      unint64_t v25 = (float *)v18;
      do
      {
        uint64_t v26 = v13;
        if ((v16 & 0x80000000) == 0)
        {
          do
          {
            LOBYTE(v19) = v24[v26];
            float v19 = (float)LODWORD(v19);
            *v25++ = v19;
            ++v26;
          }
          while (v12 + 1 != v26);
        }
        v24 += a7;
        ++v23;
      }
      while (v23 != v21);
      uint64_t v27 = 0;
      do
      {
        [(VNCCCharBoxContext *)self->_charBoxContext clearFlag:0x40000 atIndex:v27];
        uint64_t v27 = (v27 + 1);
      }
      while (v21 != v27);
    }
    unsigned __int8 v28 = [(VNCCTextDetector *)self minHeight];
    unsigned __int8 v29 = [(VNCCTextDetector *)self maxHeight];
    WORD2(v36) = v37;
    HIDWORD(v35) = 1;
    LODWORD(v36) = v37;
    LOWORD(v35) = v37;
    LODWORD(v30) = 1025758986;
    LODWORD(v31) = 1017370378;
    LODWORD(v32) = 1005961871;
    int v33 = [(VNCCTextDetector *)self _getFilterResultOut:0 defaultRows:480 bufferHeight:v21 minHeight:v28 maxHeight:v29 startRange:0 stopRange:v30 startMaxFind:v31 stopMaxFind:v32 bytesPerRow:v35 thresholdSet:v36 sampleImageAddressRef:a3 sampleImageFloatAddressRef:v22 pulseVectorFlag:0x40000];
  }
  else
  {
    int v33 = 0;
    unsigned __int16 v22 = 0;
  }
  free(v22);
  return v33;
}

- (int)_generateCRCharBoxInformation_TrackBox:(__CCBox *)a3 finalCharBoxCoordCount:(unint64_t *)a4
{
  int v4 = 0;
  BOOL v5 = 0;
  if (a3 && a4)
  {
    BOOL v5 = malloc_type_calloc(0xC8uLL, 1uLL, 0x100004077774924uLL);
    if (v5)
    {
      if (*a4 < 3)
      {
LABEL_73:
        int v4 = 1;
        goto LABEL_74;
      }
      int v9 = [(VNCCTextDetector *)self computeDependentTopAndBottomComponents:a3 finalCharBoxCoordCount:a4];
      if (v9 == 1)
      {
        [(VNCCTextDetector *)self computeIndependentTopAndBottomComponents:a3 finalCharBoxCoordCount:a4];
        if (*a4)
        {
          unint64_t v10 = 0;
          do
            v5[v10++] = 1;
          while (*a4 > v10);
          double v11 = (double)*a4;
        }
        else
        {
          double v11 = 0.0;
        }
        unsigned __int16 v12 = [(VNCCCharBoxContext *)self->_charBoxContext medianHeightBottom];
        unsigned __int16 v13 = [(VNCCCharBoxContext *)self->_charBoxContext medianHeightTop];
        unint64_t v15 = *a4;
        if (floor((double)*a4 * 0.5) < v11)
        {
          unsigned int v16 = (unsigned __int16)(v12 - v13);
          float v14 = 0.2;
          do
          {
            if (v15)
            {
              unint64_t v17 = 0;
              p_int var3 = &a3->var3;
              unsigned __int8 v19 = v15;
              do
              {
                int v20 = *p_var3;
                p_var3 += 4;
                int v21 = v16 - v20;
                if ((int)(v16 - v20) < 0) {
                  int v21 = -v21;
                }
                if ((float)(v14 * (float)v16) > (float)v21)
                {
                  v5[v17] = 0;
                  if (v19) {
                    --v19;
                  }
                  else {
                    unsigned __int8 v19 = 0;
                  }
                  unint64_t v15 = *a4;
                }
                ++v17;
              }
              while (v15 > v17);
            }
            else
            {
              unsigned __int8 v19 = 0;
            }
            float v14 = v14 + 0.1;
          }
          while (floor((double)v15 * 0.5) < (double)v19);
        }
        unint64_t v22 = v15 - 1;
        if (v15 - 1 >= 2)
        {
          __int16 v23 = 0;
          unint64_t v24 = 1;
          do
          {
            if (v23 >= -1) {
              __int16 v25 = -1;
            }
            else {
              __int16 v25 = v23;
            }
            if (v5[v24] == 1)
            {
              __int16 v26 = v24;
              while (1)
              {
                unsigned __int16 v27 = v26 - 1;
                if (((v26 - 1) & 0x8000) != 0) {
                  break;
                }
                --v26;
                if (!v5[v27])
                {
                  unsigned __int8 v28 = &a3[v27];
                  int var2 = v28->var2;
                  unsigned __int16 v30 = v28->var3 + var2;
                  __int16 v25 = v26;
                  goto LABEL_39;
                }
              }
              int var2 = 0;
              unsigned __int16 v30 = 0;
LABEL_39:
              unsigned __int16 v31 = v24;
              do
              {
                int v32 = ++v31;
                if (v15 <= v31)
                {
                  int v34 = 0;
                  unsigned __int16 v35 = 0;
                  if (var2) {
                    goto LABEL_45;
                  }
                  goto LABEL_48;
                }
              }
              while (v5[v31]);
              int v33 = &a3[v31];
              int v34 = v33->var2;
              unsigned __int16 v35 = v33->var3 + v34;
              if (!var2) {
                goto LABEL_48;
              }
LABEL_45:
              if (!v34)
              {
                uint64_t v36 = &a3[v24];
                v36->int var2 = var2;
                LOWORD(v37) = v30 - var2;
LABEL_47:
                v36->int var3 = v37;
                goto LABEL_51;
              }
LABEL_48:
              if (var2 || !v34)
              {
                if (var2 && v34)
                {
                  int v39 = v32 - v25;
                  float v40 = (float)((v35 - v30) / v39);
                  uint64_t v36 = &a3[v24];
                  unsigned int v41 = (unsigned __int16)(v36->var3 + v36->var2);
                  LOWORD(v14) = a3[v25].var2;
                  float v42 = (float)((int)v24 - v25);
                  float v14 = (float)LODWORD(v14);
                  unsigned int v43 = (int)(float)(roundf(v42 * (float)((v34 - var2) / v39)) + v14);
                  v36->int var2 = v43;
                  int v37 = (int)(float)((float)(roundf(v42 * v40) + (float)v41) - (float)v43);
                  goto LABEL_47;
                }
              }
              else
              {
                uint64_t v38 = &a3[v24];
                v38->int var2 = v34;
                v38->int var3 = v35 - v34;
              }
LABEL_51:
              v5[v24] = 0;
              unint64_t v15 = *a4;
            }
            ++v24;
            unint64_t v22 = v15 - 1;
            ++v23;
          }
          while (v15 - 1 > v24);
        }
        if (*v5 == 1 && v15 >= 2)
        {
          uint64_t v45 = 1;
          int v46 = 1;
          while (v5[v45])
          {
            uint64_t v45 = (unsigned __int16)++v46;
            if (v15 <= (unsigned __int16)v46) {
              goto LABEL_67;
            }
          }
          *(_DWORD *)&a3->int var2 = *(_DWORD *)&a3[v45].var2;
        }
LABEL_67:
        int v4 = 1;
        if (v5[v22] == 1)
        {
          int v47 = (__int16)(v15 - 2);
          if ((v47 & 0x80000000) == 0)
          {
            while (v5[(unsigned __int16)v47])
            {
              int v48 = (__int16)v47;
              LOWORD(v47) = v47 - 1;
              if (v48 < 1) {
                goto LABEL_74;
              }
            }
            *(_DWORD *)&a3[v22].int var2 = *(_DWORD *)&a3[(unsigned __int16)v47].var2;
            goto LABEL_73;
          }
        }
      }
      else
      {
        int v4 = v9;
      }
    }
    else
    {
      int v4 = 0;
    }
  }
LABEL_74:
  free(v5);
  return v4;
}

- (int)computeDependentTopAndBottomComponents:(__CCBox *)a3 finalCharBoxCoordCount:(unint64_t *)a4
{
  int v4 = 0;
  int v5 = 0;
  if (a3 && a4)
  {
    int v4 = (unsigned __int16 *)malloc_type_malloc(0x640uLL, 0x100004000313F17uLL);
    if (v4)
    {
      unsigned int v9 = [(VNCCTextDetector *)self maxBoxWidth];
      memcpy(v4, a3, 8 * *a4);
      if (*a4 - 1 >= 2)
      {
        unint64_t v10 = *a4 - 2;
        double v11 = v4 + 6;
        p_int var3 = &a3[1].var3;
        unsigned __int16 v13 = v4 + 6;
        while (1)
        {
          unsigned int v14 = *v11;
          int v15 = *(v11 - 4);
          int v17 = v13[4];
          v13 += 4;
          int v16 = v17;
          unsigned __int16 v18 = v11[1] + v14;
          unsigned __int16 v19 = *(v11 - 3) + v15;
          unsigned __int16 v20 = v11[5] + v17;
          int64_t v21 = v11[2] - (unint64_t)(unsigned __int16)(*(v11 - 1) + *(v11 - 2));
          unsigned int v22 = v17 + 5;
          if (v15 + 5 >= v14 || v22 >= v14) {
            break;
          }
          int v24 = v19;
          int v25 = v20;
          if (v19 + 5 >= v18 || v20 + 5 >= v18) {
            break;
          }
          if (v21 < v9) {
            goto LABEL_36;
          }
LABEL_38:
          *(p_var3 - 1) = v15;
          unsigned __int16 *p_var3 = v19 - v15;
LABEL_39:
          p_var3 += 4;
          double v11 = v13;
          if (!--v10) {
            goto LABEL_40;
          }
        }
        BOOL v27 = v15 - 5 <= (int)v14 || v16 - 5 <= (int)v14;
        if (v27 || (int v24 = v19, v19 - 5 <= v18))
        {
          __int16 v30 = 0;
          unsigned __int16 v31 = 0;
          int v29 = 1;
LABEL_30:
          if (v21 < v9)
          {
            LOWORD(v15) = v30;
            unsigned __int16 v19 = v31;
          }
          if (v29 && v21 < v9) {
            goto LABEL_39;
          }
          goto LABEL_38;
        }
        int v25 = v20;
        BOOL v28 = v20 - 5 <= v18;
        int v29 = v28;
        if (v28) {
          __int16 v30 = 0;
        }
        else {
          __int16 v30 = v15;
        }
        if (v28) {
          unsigned __int16 v31 = 0;
        }
        else {
          unsigned __int16 v31 = v19;
        }
        if (v28 || v21 >= v9) {
          goto LABEL_30;
        }
LABEL_36:
        __int16 v32 = vcvtmd_s64_f64((double)(v16 + v15) * 0.5);
        unsigned __int16 v33 = llround((double)(v25 + v24) * 0.5);
        if (v21 < v9)
        {
          LOWORD(v15) = v32;
          unsigned __int16 v19 = v33;
        }
        goto LABEL_38;
      }
LABEL_40:
      [(VNCCTextDetector *)self groupEndpoints:a3 finalCharBoxCoordCount:a4];
      int v5 = 1;
    }
    else
    {
      int v5 = 0;
    }
  }
  free(v4);
  return v5;
}

- (void)computeIndependentTopAndBottomComponents:(__CCBox *)a3 finalCharBoxCoordCount:(unint64_t *)a4
{
  unsigned int v7 = [(VNCCTextDetector *)self maxBoxWidth];
  if (*a4 - 1 >= 2)
  {
    int64_t v8 = v7;
    unint64_t v9 = *a4 - 2;
    p_int var2 = &a3[1].var2;
    while (1)
    {
      unsigned int v11 = *p_var2;
      unsigned int v12 = *(p_var2 - 4);
      unsigned int v13 = p_var2[4];
      unsigned __int16 v14 = p_var2[1] + v11;
      unsigned __int16 v15 = *(p_var2 - 3) + v12;
      unsigned __int16 v16 = p_var2[5] + v13;
      int64_t v17 = p_var2[2] - (unint64_t)(unsigned __int16)(*(p_var2 - 1) + *(p_var2 - 2));
      if (v11 > v12 && v11 > v13) {
        break;
      }
      BOOL v20 = v11 >= v12 || v11 >= v13;
      int v21 = !v20;
      if (v20) {
        unsigned __int16 v22 = 0;
      }
      else {
        unsigned __int16 v22 = *(p_var2 - 4);
      }
      if (!v20 && v17 < v8) {
        goto LABEL_23;
      }
LABEL_24:
      unsigned int v23 = (unsigned __int16)(*(p_var2 - 3) + v12);
      if (v23 < v14 && (unsigned __int16)(p_var2[1] + v11) > v16)
      {
        if (v17 >= v8) {
          goto LABEL_42;
        }
LABEL_40:
        unsigned __int16 v27 = llround((double)(int)(v23 + v16) * 0.5);
        int v26 = 1;
        goto LABEL_41;
      }
LABEL_29:
      BOOL v25 = (unsigned __int16)(p_var2[1] + v11) >= v15
         || (unsigned __int16)(p_var2[1] + v11) >= v16;
      int v26 = !v25;
      if (v25) {
        unsigned __int16 v27 = 0;
      }
      else {
        unsigned __int16 v27 = *(p_var2 - 3) + v12;
      }
      if (!v25 && v17 < v8) {
        goto LABEL_40;
      }
LABEL_41:
      if (v17 >= v8)
      {
LABEL_42:
        BOOL v28 = 1;
        goto LABEL_50;
      }
      BOOL v28 = v21 != 0;
      if (v21 && !v26)
      {
        unsigned __int16 *p_var2 = v22;
        unsigned __int16 v29 = v14 - v22;
LABEL_52:
        p_var2[1] = v29;
        goto LABEL_53;
      }
      BOOL v30 = v26 != 0;
      if (!v21 && v26)
      {
        p_var2[1] = v27 - v11;
        BOOL v30 = 1;
      }
      LOWORD(v12) = v22;
      unsigned __int16 v15 = v27;
      if (!v30) {
        goto LABEL_53;
      }
LABEL_50:
      if (v28)
      {
        unsigned __int16 *p_var2 = v12;
        unsigned __int16 v29 = v15 - v12;
        goto LABEL_52;
      }
LABEL_53:
      p_var2 += 4;
      if (!--v9) {
        goto LABEL_54;
      }
    }
    if (v17 >= v8)
    {
      unsigned int v23 = (unsigned __int16)(*(p_var2 - 3) + v12);
      int v21 = 1;
      if (v23 >= v14)
      {
        unsigned __int16 v22 = *(p_var2 - 4);
      }
      else
      {
        unsigned __int16 v22 = *(p_var2 - 4);
        if ((unsigned __int16)(p_var2[1] + v11) > v16) {
          goto LABEL_42;
        }
      }
      goto LABEL_29;
    }
LABEL_23:
    unsigned __int16 v22 = vcvtmd_s64_f64((double)(int)(v13 + v12) * 0.5);
    int v21 = 1;
    goto LABEL_24;
  }
LABEL_54:

  [(VNCCTextDetector *)self groupEndpoints:a3 finalCharBoxCoordCount:a4];
}

- (void)groupEndpoints:(__CCBox *)a3 finalCharBoxCoordCount:(unint64_t *)a4
{
  *(_DWORD *)&a3->int var2 = *(_DWORD *)&a3[1].var2;
  int v4 = &a3[*a4];
  v4[-1].int var2 = v4[-2].var2;
  v4[-1].int var3 = v4[-2].var3;
}

- (void)_generateCC:(id)a3 ccBigBoxes:(__CCBigBox *)a4 textOut:(vImage_Buffer *)a5 countBigBox:(unsigned __int8)a6 bufferHeight:(unsigned __int16)a7
{
  int v151 = a7;
  unsigned int v7 = a6;
  v188[5] = *MEMORY[0x1E4F143B8];
  id v152 = a3;
  v153 = self;
  memset(v181, 0, sizeof(v181));
  BOOL v158 = [(VNCCTextDetector *)self debugOut];
  if (v158)
  {
    [(VNCCTextDetector *)self _allocateVImageWithWidth:a5->width height:a5->height rowBytes:4 * a5->rowBytes imageOut:v181];
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    c = CGBitmapContextCreate((void *)v181[0].i64[0], v181[1].u64[0], v181[0].u64[1], 8uLL, v181[1].u64[1], DeviceRGB, 0x2006u);
    CGContextSetLineWidth(c, 3.0);
    CGColorSpaceRelease(DeviceRGB);
  }
  else
  {
    c = 0;
  }
  if (v7)
  {
    uint64_t v10 = 0;
    uint64_t v150 = v7;
    while (1)
    {
      uint64_t v160 = v10;
      unsigned int v11 = &a4[v10];
      uint64_t var0 = v11->var0;
      uint64_t var2 = v11->var2;
      unsigned int var1 = v11->var1;
      int v15 = var1 - var0;
      int v16 = v11->var3 - var2;
      int8x16_t v183 = 0uLL;
      v182 = &v183;
      uint64_t v159 = var0;
      int v162 = var2;
      if (((var1 - var0) & 0x80000000) == 0) {
        break;
      }
      v171 = 0;
      BOOL v20 = 0;
      v179 = 0;
      uint64_t v180 = 0;
      uint64_t i = (uint64_t *)&v179;
      if (v158)
      {
        BOOL v20 = 0;
        v171 = 0;
        v176 = 0;
        uint64_t v177 = 0;
        v175 = (uint64_t *)&v176;
        goto LABEL_170;
      }
LABEL_172:
      if (v15 <= 14) {
        int v110 = 12;
      }
      else {
        int v110 = 16;
      }
      if (v151 != 480) {
        int v110 = 16;
      }
      int __pa = v110;
      v173 = [MEMORY[0x1E4F28E78] string];
      v168 = [MEMORY[0x1E4F28E78] string];
      int v111 = [(VNCCTextDetector *)v153 pixelHeightCard];
      int v112 = [(VNCCTextDetector *)v153 pixelWidthCard];
      [(VNCCTextDetector *)v153 mmHeightCard];
      float v114 = v113;
      [(VNCCTextDetector *)v153 mmWidthCard];
      v116 = i;
      if (i == (uint64_t *)&v179) {
        goto LABEL_198;
      }
      float v117 = v115;
      int v118 = 0;
      float v119 = (float)v112;
      do
      {
        int v120 = *((unsigned __int16 *)v116 + 18);
        int v121 = *((unsigned __int16 *)v116 + 17);
        uint64_t v122 = (v120 - v121);
        int v123 = *((unsigned __int16 *)v116 + 20);
        int v124 = *((unsigned __int16 *)v116 + 19);
        uint64_t v125 = (v123 - v124);
        if ((int)v122 >= 6 && (int)v125 >= __pa)
        {
          if (v118 >= 1)
          {
            [v173 appendString:@", "];
            [v168 appendString:@", "];
            LOWORD(v121) = *((_WORD *)v116 + 17);
            LOWORD(v120) = *((_WORD *)v116 + 18);
            LOWORD(v124) = *((_WORD *)v116 + 19);
            LOWORD(v123) = *((_WORD *)v116 + 20);
          }
          unint64_t v127 = (char *)&a4[v160] + 10 * v118;
          *((_WORD *)v127 + 8) = v123 + v159;
          v128 = (unsigned __int16 *)(v127 + 16);
          LOWORD(v134) = v121 + v162;
          *(v128 - 3) = v134;
          v129 = v128 - 3;
          unsigned __int16 v130 = v120 + v162;
          *(v128 - 2) = v120 + v162;
          v131 = v128 - 2;
          unsigned __int16 v132 = v124 + v159;
          *(v128 - 1) = v124 + v159;
          v133 = v128 - 1;
          uint64_t v134 = (unsigned __int16)v134;
          *(v128 - 4) = ((unsigned __int16)v134 + v130 + 1) >> 1;
          if (v158)
          {
            CGContextSetRGBStrokeColor(c, 0.0, 1.0, 0.0, 0.5);
            unsigned int v135 = *v129;
            v190.origin.x = (double)v135;
            uint64_t v136 = *v128;
            v190.origin.y = (double)(unint64_t)(v181[0].i64[1] - v136);
            v190.size.vImagePixelCount width = (double)(int)(*v131 - v135);
            v190.size.unsigned __int16 height = (double)(int)(v136 - *v133);
            CGContextStrokeRect(c, v190);
            uint64_t v134 = *v129;
            unsigned __int16 v132 = *v133;
          }
          v137 = objc_msgSend(NSString, "stringWithFormat:", @"{{%i,%i},{%i,%i}}", v134, v132, v122, v125);
          [v173 appendString:v137];

          int v138 = *v128;
          float v139 = v114 * (float)((v111 - v138) / v111);
          if (v139 < 0.0) {
            float v139 = 0.0;
          }
          v140 = objc_msgSend(NSString, "stringWithFormat:", @"{{%2.4f,%2.4f},{%2.4f,%2.4f}}", (float)(v117 * (float)((float)*v129 / v119)), v139, (float)(v117 * (float)((float)(*v131 - *v129) / v119)), (float)(v114 * (float)((float)(v138 - *v133) / (float)v111)));
          [v168 appendString:v140];

          if (v118 > 48) {
            goto LABEL_199;
          }
          ++v118;
        }
        v141 = (uint64_t *)v116[1];
        if (v141)
        {
          do
          {
            __int16 v142 = v141;
            v141 = (uint64_t *)*v141;
          }
          while (v141);
        }
        else
        {
          do
          {
            __int16 v142 = (uint64_t *)v116[2];
            BOOL v79 = *v142 == (void)v116;
            v116 = v142;
          }
          while (!v79);
        }
        v116 = v142;
      }
      while (v142 != (uint64_t *)&v179);
      if (!v118)
      {
LABEL_198:
        unint64_t v143 = objc_msgSend(NSString, "stringWithFormat:", @"{{%i,%i},{%i,%i}}", 1, 1, 1, 1);
        [v173 appendString:v143];
      }
LABEL_199:
      v187[0] = @"textBox";
      v187[1] = @"textBoxMM";
      v188[1] = &stru_1EF75C0C0;
      v188[2] = v173;
      v187[2] = @"charBox";
      v187[3] = @"charBoxMM";
      v188[0] = &stru_1EF75C0C0;
      v187[4] = @"charConfidence";
      v188[3] = v168;
      v188[4] = @"{{1,1},{1,1}}";
      char v144 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v188 forKeys:v187 count:5];
      [v152 addObject:v144];

      std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v179);
      if (v171) {
        operator delete(v171);
      }
      std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v183.i64[0]);
      if (v20) {
        operator delete(v20);
      }
      uint64_t v10 = v160 + 1;
      if (v160 + 1 == v150) {
        goto LABEL_204;
      }
    }
    unsigned int v149 = var1;
    v171 = 0;
    int64_t v17 = 0;
    v163 = 0;
    unint64_t v18 = 0;
    unsigned __int16 v19 = 0;
    BOOL v20 = 0;
    int v21 = 0;
    unsigned __int16 v22 = (char *)a5->data + a5->rowBytes * var0 + var2;
    int v172 = v16 + 1;
    int v154 = v15;
    int v164 = v15 + 1;
    int v23 = 1;
    int v161 = v16;
LABEL_8:
    if (v16 < 0)
    {
      int64_t v17 = v171;
      goto LABEL_111;
    }
    int v167 = v21;
    __p = 0;
    int v24 = 0;
    unint64_t v25 = 0;
    int v26 = 0;
    v166 = v22;
LABEL_10:
    int v27 = 0;
    int v28 = -1;
    while (1)
    {
      if (*v22)
      {
        if (v28 == -1) {
          int v27 = 1;
        }
        else {
          ++v27;
        }
        if (v28 == -1) {
          int v28 = v26;
        }
      }
      else if ((v28 & 0x80000000) == 0)
      {
        if ((unint64_t)v24 >= v25)
        {
          uint64_t v155 = (v24 - __p) >> 4;
          unint64_t v29 = v155 + 1;
          if ((unint64_t)(v155 + 1) >> 60) {
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          }
          if ((uint64_t)(v25 - (void)__p) >> 3 > v29) {
            unint64_t v29 = (uint64_t)(v25 - (void)__p) >> 3;
          }
          if (v25 - (unint64_t)__p >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v30 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v30 = v29;
          }
          if (v30) {
            unint64_t v30 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vision::mod::DescriptorItemSideInfo>>(v30);
          }
          else {
            uint64_t v31 = 0;
          }
          __int16 v32 = (_DWORD *)(v30 + 16 * v155);
          _DWORD *v32 = 0;
          v32[1] = v167;
          v32[2] = v28;
          v32[3] = v27;
          if (v24 == __p)
          {
            unsigned __int16 v35 = (char *)(v30 + 16 * v155);
            int v34 = __p;
          }
          else
          {
            unint64_t v33 = v30 + 16 * v155;
            int v34 = __p;
            do
            {
              unsigned __int16 v35 = (char *)(v33 - 16);
              *(_OWORD *)(v33 - 16) = *((_OWORD *)v24 - 1);
              v24 -= 16;
              v33 -= 16;
            }
            while (v24 != __p);
          }
          unint64_t v25 = v30 + 16 * v31;
          int v24 = (char *)(v32 + 4);
          if (v34)
          {
            unint64_t v36 = v30 + 16 * v31;
            operator delete(v34);
            unint64_t v25 = v36;
          }
          __p = v35;
        }
        else
        {
          *(_DWORD *)int v24 = 0;
          *((_DWORD *)v24 + 1) = v167;
          *((_DWORD *)v24 + 2) = v28;
          *((_DWORD *)v24 + 3) = v27;
          v24 += 16;
        }
        ++v26;
        ++v22;
        if (v26 == v172)
        {
LABEL_62:
          __int16 v44 = __p;
          uint64_t v45 = (int *)__p;
          if (__p != v24)
          {
            do
            {
              LODWORD(i) = 0;
              int v46 = v171;
              if (v171 == v17) {
                goto LABEL_74;
              }
              do
              {
                int v47 = v45[2];
                int v48 = v46[2];
                if (v47 < v46[3] + v48 && v45[3] + v47 > v48)
                {
                  int v49 = (int)i;
                  int v50 = *v46;
                  if (i)
                  {
                    if (i != v50)
                    {
                      if ((int)i < v50) {
                        *((_DWORD *)std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)&v182, *v46, (unsigned int *)v46)+ 8) = v49;
                      }
                      else {
                        *((_DWORD *)std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)&v182, (int)i, (unsigned int *)&i)+ 8) = v50;
                      }
                    }
                  }
                  else
                  {
                    LODWORD(i) = *v46;
                    *uint64_t v45 = v50;
                  }
                }
                v46 += 4;
              }
              while (v46 != v17);
              if (!i)
              {
LABEL_74:
                LODWORD(i) = v23;
                *uint64_t v45 = v23;
                *((_DWORD *)std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)&v182, (int)i, (unsigned int *)&i)+ 8) = v23++;
              }
              if ((unint64_t)v19 >= v18)
              {
                uint64_t v51 = ((char *)v19 - (char *)v20) >> 4;
                unint64_t v52 = v51 + 1;
                if ((unint64_t)(v51 + 1) >> 60) {
                  std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                }
                if ((uint64_t)(v18 - (void)v20) >> 3 > v52) {
                  unint64_t v52 = (uint64_t)(v18 - (void)v20) >> 3;
                }
                if (v18 - (unint64_t)v20 >= 0x7FFFFFFFFFFFFFF0) {
                  unint64_t v53 = 0xFFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v53 = v52;
                }
                if (v53) {
                  unint64_t v53 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vision::mod::DescriptorItemSideInfo>>(v53);
                }
                else {
                  uint64_t v54 = 0;
                }
                float v55 = (_OWORD *)(v53 + 16 * v51);
                *float v55 = *(_OWORD *)v45;
                if (v19 == v20)
                {
                  float v57 = v19;
                  BOOL v20 = (int *)(v53 + 16 * v51);
                }
                else
                {
                  float v56 = (char *)(v53 + 16 * v51);
                  do
                  {
                    *((_OWORD *)v56 - 1) = *((_OWORD *)v19 - 1);
                    v56 -= 16;
                    v19 -= 4;
                  }
                  while (v19 != v20);
                  float v57 = v20;
                  BOOL v20 = (int *)v56;
                }
                unint64_t v18 = v53 + 16 * v54;
                unsigned __int16 v19 = (int *)(v55 + 1);
                if (v57) {
                  operator delete(v57);
                }
              }
              else
              {
                *(_OWORD *)unsigned __int16 v19 = *(_OWORD *)v45;
                v19 += 4;
              }
              v45 += 4;
            }
            while (v45 != (int *)v24);
            __int16 v44 = v24;
          }
          float v59 = __p;
          __int16 v58 = (char *)v171;
          size_t v60 = v44 - __p;
          unint64_t v61 = (v44 - __p) >> 4;
          uint64_t v62 = (uint64_t)v163;
          if (v61 > (v163 - (char *)v171) >> 4)
          {
            if (v171)
            {
              operator delete(v171);
              uint64_t v62 = 0;
            }
            if ((v60 & 0x8000000000000000) != 0) {
              goto LABEL_208;
            }
            uint64_t v63 = v62 >> 3;
            if (v62 >> 3 <= v61) {
              uint64_t v63 = (v44 - __p) >> 4;
            }
            unint64_t v64 = (unint64_t)v62 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v63;
            if (v64 >> 60) {
LABEL_208:
            }
              std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
            unsigned int v65 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<vision::mod::DescriptorItemSideInfo>>(v64);
            v163 = &v65[16 * v66];
            __int16 v58 = v65;
            float v59 = __p;
          }
          if (v44 != v59) {
            memmove(v58, v59, v60);
          }
          v171 = (int *)v58;
          int64_t v17 = (int *)&v58[16 * v61];
          int v16 = v161;
          if (v59) {
            operator delete(v59);
          }
          int v21 = v167;
          unsigned __int16 v22 = v166;
LABEL_111:
          ++v21;
          v22 += a5->rowBytes;
          if (v21 == v164)
          {
            unsigned int v67 = (uint64_t *)v182;
            if (v182 != &v183)
            {
              do
              {
                unsigned int v68 = (unsigned int *)(v67 + 4);
                __int32 v69 = *((_DWORD *)v67 + 8);
                uint64_t v70 = v183.i64[0];
                if (!v183.i64[0]) {
                  goto LABEL_122;
                }
                BOOL v71 = &v183;
                do
                {
                  BOOL v72 = (int8x16_t *)v70;
                  __int16 v73 = v71;
                  __int32 v74 = *(_DWORD *)(v70 + 28);
                  float v75 = (uint64_t *)(v70 + 8);
                  if (v74 >= v69)
                  {
                    float v75 = (uint64_t *)v72;
                    BOOL v71 = v72;
                  }
                  uint64_t v70 = *v75;
                }
                while (v70);
                if (v71 == &v183) {
                  goto LABEL_122;
                }
                if (v74 < v69) {
                  BOOL v72 = v73;
                }
                if (v69 >= v72[1].i32[3])
                {
                  __int32 v69 = *((_DWORD *)std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)&v182, *((_DWORD *)v67 + 8), v68)+ 8);
                  long long v76 = std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)&v182, *((_DWORD *)v67 + 7), (unsigned int *)v67 + 7);
                }
                else
                {
LABEL_122:
                  long long v76 = std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)&v182, *((_DWORD *)v67 + 8), v68);
                }
                *((_DWORD *)v76 + 8) = v69;
                __CCRange v77 = (int8x16_t *)v67[1];
                if (v77)
                {
                  do
                  {
                    double v78 = v77;
                    __CCRange v77 = (int8x16_t *)v77->i64[0];
                  }
                  while (v77);
                }
                else
                {
                  do
                  {
                    double v78 = (int8x16_t *)v67[2];
                    BOOL v79 = v78->i64[0] == (void)v67;
                    unsigned int v67 = (uint64_t *)v78;
                  }
                  while (!v79);
                }
                unsigned int v67 = (uint64_t *)v78;
              }
              while (v78 != &v183);
            }
            v179 = 0;
            uint64_t v180 = 0;
            unint64_t v80 = v20;
            for (uint64_t i = (uint64_t *)&v179; v80 != v19; v80 += 4)
            {
              LODWORD(v175) = 0;
              int v81 = *((_DWORD *)std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)&v182, *v80, (unsigned int *)v80)+ 8);
              LODWORD(v175) = v81;
              unint64_t v82 = v179;
              if (!v179) {
                goto LABEL_141;
              }
              uint64_t v83 = &v179;
              do
              {
                uint64_t v84 = v82;
                __int16 v85 = v83;
                int v86 = *((_DWORD *)v82 + 7);
                unsigned __int16 v87 = v82 + 1;
                if (v86 >= v81)
                {
                  unsigned __int16 v87 = v84;
                  uint64_t v83 = (void **)v84;
                }
                unint64_t v82 = (void *)*v87;
              }
              while (v82);
              if (v83 == &v179) {
                goto LABEL_141;
              }
              if (v86 < v81) {
                uint64_t v84 = v85;
              }
              if (v81 >= *((_DWORD *)v84 + 7))
              {
                float v92 = (unsigned __int16 *)std::__tree<std::__value_type<int,__CCCharBox>,std::__map_value_compare<int,std::__value_type<int,__CCCharBox>,std::less<int>,true>,std::allocator<std::__value_type<int,__CCCharBox>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(&i, v81, &v175);
                int v93 = v92[17];
                int v94 = v80[2];
                if (v94 < v93) {
                  LOWORD(v93) = v80[2];
                }
                v92[17] = v93;
                int v95 = v92[18];
                int v96 = v94 + v80[3] - 1;
                if (v96 > v95) {
                  LOWORD(v95) = v96;
                }
                v92[18] = v95;
                int v97 = v92[19];
                int v98 = v80[1];
                if (v98 < v97) {
                  LOWORD(v97) = v80[1];
                }
                v92[19] = v97;
                int v99 = v92[20];
                if (v98 > v99) {
                  LOWORD(v99) = v98;
                }
                v92[20] = v99;
              }
              else
              {
LABEL_141:
                int v88 = v80[2];
                int v89 = v80[3];
                int v90 = v80[1];
                float v91 = std::__tree<std::__value_type<int,__CCCharBox>,std::__map_value_compare<int,std::__value_type<int,__CCCharBox>,std::less<int>,true>,std::allocator<std::__value_type<int,__CCCharBox>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(&i, v81, &v175);
                *((_WORD *)v91 + 17) = v88;
                *((_WORD *)v91 + 18) = v89 + v88 - 1;
                *((_WORD *)v91 + 19) = v90;
                *((_WORD *)v91 + 20) = v90;
              }
            }
            if (v158)
            {
              v176 = 0;
              uint64_t v177 = 0;
              v175 = (uint64_t *)&v176;
              if (v20 != v19)
              {
                int v100 = 0;
                unsigned int v101 = v20;
                do
                {
                  int v174 = 0;
                  int v102 = *((_DWORD *)std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)&v182, *v101, (unsigned int *)v101)+ 8);
                  int v174 = v102;
                  CFDictionaryRef v103 = v176;
                  if (!v176) {
                    goto LABEL_165;
                  }
                  uint64_t v104 = &v176;
                  do
                  {
                    uint64_t v105 = v103;
                    uint64_t v106 = v104;
                    int v107 = *((_DWORD *)v103 + 7);
                    uint64_t v108 = v103 + 1;
                    if (v107 >= v102)
                    {
                      uint64_t v108 = v105;
                      uint64_t v104 = (void **)v105;
                    }
                    CFDictionaryRef v103 = (void *)*v108;
                  }
                  while (v103);
                  if (v104 == &v176) {
                    goto LABEL_165;
                  }
                  if (v107 < v102) {
                    uint64_t v105 = v106;
                  }
                  if (v102 < *((_DWORD *)v105 + 7)) {
LABEL_165:
                  }
                    *((unsigned char *)std::__tree<std::__value_type<int,unsigned char>,std::__map_value_compare<int,std::__value_type<int,unsigned char>,std::less<int>,true>,std::allocator<std::__value_type<int,unsigned char>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(&v175, v102, &v174)+ 32) = v100++;
                  v109 = std::__tree<std::__value_type<int,unsigned char>,std::__map_value_compare<int,std::__value_type<int,unsigned char>,std::less<int>,true>,std::allocator<std::__value_type<int,unsigned char>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(&v175, v102, &v174);
                  memset((void *)(v181[0].i64[0] + v181[1].i64[1] * (v101[1] + v159) + 4 * (v101[2] + v162)), ~(5 * *((unsigned __int8 *)v109 + 32)), 4 * v101[3]);
                  v101 += 4;
                }
                while (v101 != v19);
              }
              LODWORD(var2) = v162;
              int v15 = v154;
              unsigned int var1 = v149;
LABEL_170:
              CGContextSetRGBStrokeColor(c, 1.0, 0.0, 0.0, 0.5);
              v189.origin.x = (double)var2;
              v189.origin.y = (double)(v181[0].i64[1] - (unint64_t)var1);
              v189.size.vImagePixelCount width = (double)v16;
              v189.size.unsigned __int16 height = (double)v15;
              CGContextStrokeRect(c, v189);
              std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v176);
            }
            else
            {
              int v15 = v154;
            }
            goto LABEL_172;
          }
          goto LABEL_8;
        }
        goto LABEL_10;
      }
      ++v26;
      ++v22;
      if (v172 == v26)
      {
        if ((v28 & 0x80000000) == 0)
        {
          if ((unint64_t)v24 >= v25)
          {
            uint64_t v37 = (v24 - __p) >> 4;
            unint64_t v38 = v37 + 1;
            if ((unint64_t)(v37 + 1) >> 60) {
              std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
            }
            if ((uint64_t)(v25 - (void)__p) >> 3 > v38) {
              unint64_t v38 = (uint64_t)(v25 - (void)__p) >> 3;
            }
            if (v25 - (unint64_t)__p >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v39 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v39 = v38;
            }
            if (v39) {
              unint64_t v39 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vision::mod::DescriptorItemSideInfo>>(v39);
            }
            float v40 = (_DWORD *)(v39 + 16 * v37);
            _DWORD *v40 = 0;
            v40[1] = v167;
            v40[2] = v28;
            v40[3] = v27;
            if (v24 == __p)
            {
              unsigned int v43 = (char *)(v39 + 16 * v37);
              float v42 = __p;
            }
            else
            {
              unint64_t v41 = v39 + 16 * v37;
              float v42 = __p;
              do
              {
                unsigned int v43 = (char *)(v41 - 16);
                *(_OWORD *)(v41 - 16) = *((_OWORD *)v24 - 1);
                v24 -= 16;
                v41 -= 16;
              }
              while (v24 != __p);
            }
            int v24 = (char *)(v40 + 4);
            if (v42) {
              operator delete(v42);
            }
            __p = v43;
          }
          else
          {
            *(_DWORD *)int v24 = 0;
            *((_DWORD *)v24 + 1) = v167;
            *((_DWORD *)v24 + 2) = v28;
            *((_DWORD *)v24 + 3) = v27;
            v24 += 16;
          }
        }
        goto LABEL_62;
      }
    }
  }
LABEL_204:
  if (v158)
  {
    uint64_t v145 = [(VNCCTextDetector *)v153 debugFilename];
    v146 = [v145 stringByAppendingPathComponent:@"connectedComponents.png"];

    id v147 = v146;
    CGRect v148 = (const char *)[v147 UTF8String];
    uint64_t v186 = 0;
    uint64_t v184 = v181[1].i64[1];
    uint64_t v185 = 7;
    int8x16_t v183 = vextq_s8(*(int8x16_t *)((char *)v181 + 8), *(int8x16_t *)((char *)v181 + 8), 8uLL);
    v182 = (int8x16_t *)v181[0].i64[0];
    saveImage(v148, (uint64_t)&v182);
    CGContextRelease(c);
  }
  [(VNCCTextDetector *)v153 _freeVImage:v181];
}

- (int)_generateBoxes:(id)a3 pulseVector:(unint64_t)a4 uImage:(vImage_Buffer *)a5 countBigBoxOut:(unint64_t *)a6 bigBoxes:(__CCBigBox *)a7 bigBoxesA:(__CCBigBox *)a8 useLowLightEnhancement:(unsigned __int8)a9
{
  id v13 = a3;
  unsigned __int16 v14 = v13;
  int v15 = 0;
  int v16 = 0;
  if (a6 && v13 && a7)
  {
    int64_t v17 = 0;
    if (a8)
    {
      int64_t v17 = (unsigned __int8 *)malloc_type_calloc(a5->width, 1uLL, 0x100004077774924uLL);
      if (v17)
      {
        int v16 = (char *)malloc_type_calloc(a5->width, 2uLL, 0x1000040BDFB0063uLL);
        if (v16)
        {
          BOOL v79 = v14;
          unint64_t v18 = [v14 objectForKeyedSubscript:@"textBoxRevised"];

          if (!v18)
          {
            unsigned __int16 v19 = [MEMORY[0x1E4F1CA48] array];
            [v14 setObject:v19 forKeyedSubscript:@"textBoxRevised"];
          }
          BOOL v20 = [v14 objectForKeyedSubscript:@"textBoxRevisedNormalized"];

          if (!v20)
          {
            int v21 = [MEMORY[0x1E4F1CA48] array];
            [v14 setObject:v21 forKeyedSubscript:@"textBoxRevisedNormalized"];
          }
          unsigned __int16 v22 = [v14 objectForKeyedSubscript:@"stubBox"];

          if (!v22)
          {
            int v23 = [MEMORY[0x1E4F1CA48] array];
            [v14 setObject:v23 forKeyedSubscript:@"stubBox"];
          }
          int v24 = [v14 objectForKeyedSubscript:@"stubBoxNormalized"];

          if (!v24)
          {
            unint64_t v25 = [MEMORY[0x1E4F1CA48] array];
            [v14 setObject:v25 forKeyedSubscript:@"stubBoxNormalized"];
          }
          unsigned int v26 = [(VNCCTextDetector *)self minHeight];
          unsigned int v27 = [(VNCCTextDetector *)self maxHeight];
          int v28 = [(VNCCCharBoxContext *)self->_charBoxContext charBoxFlags];
          double v78 = a6;
          if (a5->height < 2)
          {
            uint64_t v32 = 0;
            goto LABEL_98;
          }
          uint64_t v84 = self;
          unsigned int v29 = v27;
          unsigned __int16 v30 = 0;
          int v31 = 0;
          uint64_t v32 = 0;
          unint64_t v33 = *v28;
          unsigned int v34 = v26;
          vImagePixelCount v35 = 1;
          unint64_t v81 = v34;
          unint64_t v80 = v29;
          while (1)
          {
            unint64_t v36 = [(VNCCCharBoxContext *)v84->_charBoxContext charBoxFlags][8 * v35];
            if ((v33 & a4) != 0 || (v36 & a4) == 0) {
              int v39 = v31;
            }
            else {
              int v39 = v35;
            }
            BOOL v40 = (unsigned __int16)v39 != 0;
            if ((v36 & a4) == 0 && v40) {
              unsigned __int16 v30 = v35 - 1;
            }
            if (!v30) {
              BOOL v40 = 0;
            }
            if (a9 || !v40)
            {
              char v47 = !v40;
              if (!a9) {
                char v47 = 1;
              }
              if (v47)
              {
                int v31 = v39;
                goto LABEL_91;
              }
              unint64_t v48 = v30 - (unint64_t)(unsigned __int16)v39 + 1;
              if (v48 < v81 || v48 > v80)
              {
LABEL_89:
                int v31 = 0;
              }
              else
              {
                int v31 = 0;
                unsigned __int16 width = a5->width;
                uint64_t v51 = &a7[v32];
                v51->uint64_t var0 = v39;
                v51->unsigned int var1 = v30;
                v51->uint64_t var2 = 16;
                width -= 16;
                v51->int var3 = width;
                unint64_t v52 = &a8[v32];
                v52->uint64_t var0 = v39;
                v52->unsigned int var1 = v30;
                v52->uint64_t var2 = 16;
                v52->int var3 = width;
                if (v32 == 199) {
                  uint64_t v32 = 199;
                }
                else {
                  ++v32;
                }
              }
              unsigned __int16 v30 = 0;
              goto LABEL_91;
            }
            unint64_t v41 = v30 - (unsigned __int16)v39 + 1;
            if (v41 < v81 || v41 > v80) {
              goto LABEL_89;
            }
            if (v30 - (unsigned __int16)v39 != -1) {
              bzero(v16, 2 * (v30 - (unsigned __int16)v39) + 2);
            }
            vImagePixelCount v43 = a5->width;
            int v44 = v43 - v41;
            if (v43 > (int)v43 - (int)v41) {
              break;
            }
            if (v43) {
              goto LABEL_51;
            }
LABEL_57:
            int v58 = 0;
            if (v30 - (unsigned __int16)v39 != -1)
            {
              uint64_t v59 = v41;
              size_t v60 = v17;
              do
              {
                int v61 = *v60++;
                v58 += v61;
                --v59;
              }
              while (v59);
            }
            *(_WORD *)&v16[2 * (v41 >> 1)] = v58;
            if (v43 != v41)
            {
              uint64_t v62 = &v16[2 * (v41 >> 1) + 2];
              uint64_t v63 = v17;
              vImagePixelCount v64 = v43;
              do
              {
                int v65 = v63[v41];
                int v66 = *v63++;
                v58 += v65 - v66;
                *(_WORD *)uint64_t v62 = v58;
                v62 += 2;
                --v64;
              }
              while (v41 != v64);
            }
            if (!v43) {
              goto LABEL_89;
            }
            uint64_t v67 = 0;
            unsigned __int16 v68 = 0;
            int v69 = 0;
            do
            {
              LOBYTE(v37) = v17[v67];
              float v37 = (float)LODWORD(v37);
              if ((float)((float)v41 / 5.0) < v37
                && (LOWORD(v37) = *(_WORD *)&v16[2 * v67],
                    float v37 = (float)LODWORD(v37),
                    (float)((float)(unsigned __int16)(v41 * v41) / 12.0) <= v37))
              {
                if (!v69) {
                  int v69 = (unsigned __int16)v67;
                }
              }
              else
              {
                if (!v69) {
                  goto LABEL_79;
                }
                unsigned __int16 v68 = v67 - 1;
              }
              if ((_WORD)v39 && v69 && v68 && v30)
              {
                int v70 = v68 - 16;
                int v71 = v69 + 16;
                if (v70 > v71)
                {
                  BOOL v72 = &a7[v32];
                  v72->uint64_t var0 = v39;
                  v72->unsigned int var1 = v30;
                  v72->uint64_t var2 = v71;
                  v72->int var3 = v70;
                  __int16 v73 = &a8[v32];
                  v73->uint64_t var0 = v39;
                  v73->unsigned int var1 = v30;
                  v73->uint64_t var2 = v71;
                  v73->int var3 = v70;
                  ++v32;
                }
                int v69 = 0;
                unsigned __int16 v68 = 0;
                if (v32 == 200) {
                  uint64_t v32 = 199;
                }
              }
LABEL_79:
              ++v67;
            }
            while (v43 != v67);
            int v31 = 0;
            if ((_WORD)v39 && v69 && !v68 && v30)
            {
              unsigned __int16 v74 = v69 + 16;
              if (v69 + 16 < (unsigned __int16)v43)
              {
                float v75 = &a7[v32];
                v75->uint64_t var0 = v39;
                v75->unsigned int var1 = v30;
                v75->uint64_t var2 = v74;
                v75->int var3 = v43;
                long long v76 = &a8[v32];
                v76->uint64_t var0 = v39;
                v76->unsigned int var1 = v30;
                v76->uint64_t var2 = v74;
                v76->int var3 = v43;
                ++v32;
              }
              int v31 = 0;
              unsigned __int16 v30 = 0;
              if (v32 == 200) {
                uint64_t v32 = 199;
              }
            }
            else
            {
              unsigned __int16 v30 = 0;
            }
LABEL_91:
            ++v35;
            unint64_t v33 = v36;
            if (a5->height <= v35)
            {
LABEL_98:
              *double v78 = v32;
              int v15 = 1;
              unsigned __int16 v14 = v79;
              goto LABEL_99;
            }
          }
          vImagePixelCount v45 = v43 - v44;
          int v46 = &v16[2 * v44];
          do
          {
            *(_WORD *)int v46 = 0;
            v46 += 2;
            --v45;
          }
          while (v45);
LABEL_51:
          vImagePixelCount v53 = 0;
          do
          {
            if ((unsigned __int16)v39 <= v30)
            {
              unsigned __int8 v54 = 0;
              size_t rowBytes = a5->rowBytes;
              float v56 = (char *)a5->data + (unsigned __int16)v39 * rowBytes;
              unint64_t v57 = v30 - (unint64_t)(unsigned __int16)v39 + 1;
              do
              {
                v54 += v56[v53];
                v56 += rowBytes;
                --v57;
              }
              while (v57);
            }
            else
            {
              unsigned __int8 v54 = 0;
            }
            v17[v53++] = v54;
            vImagePixelCount v43 = a5->width;
          }
          while (v43 > v53);
          goto LABEL_57;
        }
      }
      else
      {
        int v16 = 0;
      }
      int v15 = 0;
    }
  }
  else
  {
    int64_t v17 = 0;
  }
LABEL_99:
  free(v17);
  free(v16);

  return v15;
}

- (int)_generateSmoothedImage:(vImage_Buffer *)a3 uImage:(vImage_Buffer *)a4
{
  vImagePixelCount height = a3->height;
  vImagePixelCount width = a3->width;
  unint64_t v9 = (unint64_t *)malloc_type_calloc(4 * width * height + 24, 1uLL, 0x3C7E5A79uLL);
  if (v9)
  {
    uint64_t v10 = v9;
    *unint64_t v9 = width;
    v9[1] = height;
    int v11 = [(VNCCTextDetector *)self midRow];
    if (v11 <= 1) {
      int v12 = 1;
    }
    else {
      int v12 = v11;
    }
    unint64_t v13 = (v12 - 1);
    vImagePixelCount v14 = a3->height;
    if (v14 > v13)
    {
      data = (unsigned __int8 *)a3->data;
      unint64_t v16 = *v10;
      vImagePixelCount v18 = a3->width;
      size_t rowBytes = a3->rowBytes;
      unsigned __int16 v19 = (char *)a3->data + rowBytes * v13 + 1;
      uint64_t v20 = 4 * *v10;
      unsigned int v21 = v12 - 2;
      uint64_t v22 = (uint64_t)v10 + 4 * *v10 * v13 + 20;
      while (1)
      {
        int v23 = data[rowBytes * v13];
        if (v13)
        {
          if (v16) {
            break;
          }
        }
        if (v16)
        {
          unint64_t v24 = v10[1];
          goto LABEL_15;
        }
LABEL_17:
        if (v18 >= 2)
        {
          unint64_t v26 = 0;
          unsigned int v27 = (int *)((char *)v10 + v20 * v21 + 20);
          unint64_t v28 = (v13 - 1);
          unsigned int v29 = (_DWORD *)v22;
          do
          {
            if (v16 <= v26 || v10[1] <= v13) {
              int v30 = 0;
            }
            else {
              int v30 = *(v29 - 1);
            }
            int v31 = 0;
            unint64_t v32 = v26 + 1;
            if (v13 && v16 > v32)
            {
              if (v10[1] <= v28) {
                int v31 = 0;
              }
              else {
                int v31 = *v27;
              }
            }
            int v33 = v30 + v19[v26] + v31;
            if (v13 && v16 > v26 && v10[1] > v28) {
              v33 -= *(v27 - 1);
            }
            if (v16 > v32 && v10[1] > v13) {
              *unsigned int v29 = v33;
            }
            ++v27;
            ++v29;
            ++v26;
          }
          while (v18 - 1 != v32);
        }
        ++v13;
        v19 += rowBytes;
        ++v21;
        v22 += v20;
        if (v13 == v14) {
          goto LABEL_37;
        }
      }
      unint64_t v24 = v10[1];
      if (v24 <= (v13 - 1)) {
        int v25 = 0;
      }
      else {
        int v25 = *((_DWORD *)v10 + v16 * (v13 - 1) + 4);
      }
      v23 += v25;
LABEL_15:
      if (v24 > v13) {
        *((_DWORD *)v10 + v16 * v13 + 4) = v23;
      }
      goto LABEL_17;
    }
LABEL_37:
    if (v11 <= -4) {
      unsigned int v34 = -4;
    }
    else {
      unsigned int v34 = v11;
    }
    uint64_t v35 = v34 + 4;
    if (v14 > v35)
    {
      vImagePixelCount v36 = a3->width;
      uint64_t v37 = v35 - 2;
      do
      {
        if (v36 >= 0x41)
        {
          unint64_t v38 = 0;
          unint64_t v39 = (v35 - 4);
          BOOL v40 = (char *)a4->data + a4->rowBytes * v37 + 32;
          do
          {
            int v41 = 0;
            unint64_t v42 = v38 + 64;
            unint64_t v43 = *v10;
            if ((v35 & 0x8000000000000000) == 0 && v43 > v42)
            {
              if (v10[1] <= v35) {
                int v41 = 0;
              }
              else {
                int v41 = *((_DWORD *)v10 + v38 + v35 * v43 + 68);
              }
            }
            int v44 = 0;
            unint64_t v45 = v38;
            if (v35 >= 4 && v43 > v38)
            {
              if (v10[1] <= v39) {
                int v44 = 0;
              }
              else {
                int v44 = *((_DWORD *)v10 + v38 + v34 * v43 + 4);
              }
            }
            int v46 = 0;
            if ((v35 & 0x8000000000000000) == 0 && v43 > v38)
            {
              if (v10[1] <= v35) {
                int v46 = 0;
              }
              else {
                int v46 = *((_DWORD *)v10 + v38 + v35 * v43 + 4);
              }
            }
            int v47 = 0;
            if (v35 >= 4 && v43 > v42)
            {
              if (v10[1] <= v39) {
                int v47 = 0;
              }
              else {
                int v47 = *((_DWORD *)v10 + v38 + v34 * v43 + 68);
              }
            }
            v40[v38] = v44 + v41 - (v46 + v47) > 2;
            vImagePixelCount v36 = a3->width;
            ++v38;
          }
          while (v36 > v45 + 65);
          vImagePixelCount v14 = a3->height;
        }
        ++v35;
        ++v34;
        ++v37;
      }
      while (v14 > v35);
    }
    free(v10);
    if ([(VNCCTextDetector *)self debugOut])
    {
      unint64_t v48 = [(VNCCTextDetector *)self debugFilename];
      int v49 = [v48 stringByAppendingPathComponent:@"selectedTextOutImageArray.png"];

      id v50 = v49;
      uint64_t v51 = (const char *)[v50 UTF8String];
      long long v52 = *(_OWORD *)&a3->width;
      v60[0] = *(_OWORD *)&a3->data;
      v60[1] = v52;
      saveVImage(v51, (unsigned __int8 **)v60, 1280061496);
      vImagePixelCount v53 = [(VNCCTextDetector *)self debugFilename];
      unsigned __int8 v54 = [v53 stringByAppendingPathComponent:@"uOutImage.png"];

      id v55 = v54;
      float v56 = (const char *)[v55 UTF8String];
      long long v57 = *(_OWORD *)&a4->width;
      v59[0] = *(_OWORD *)&a4->data;
      v59[1] = v57;
      saveVImage(v56, (unsigned __int8 **)v59, 1280061496);
    }
    LODWORD(v9) = 1;
  }
  return (int)v9;
}

- (int)_generateAdaptiveBinarization:(vImage_Buffer *)a3 adaptImage:(vImage_Buffer *)a4 useLowLightEnhancement:(unsigned __int8)a5
{
  int v5 = a5;
  vImagePixelCount width = a3->width;
  uint64_t v10 = (int *)malloc_type_calloc((a3->height + 128) * width, 4uLL, 0x100004052888210uLL);
  if (v10)
  {
    int v11 = (float *)malloc_type_calloc((a3->height + 128) * width, 4uLL, 0x100004052888210uLL);
    if (v11
      && (vImagePixelCount v77 = (a3->width + 63) & 0xFFFFFFFFFFFFFFC0,
          (int v12 = (char *)malloc_type_calloc(v77 * (a3->height + 128), 1uLL, 0x100004077774924uLL)) != 0))
    {
      vImagePixelCount v74 = width;
      float v75 = a4;
      int v14 = 0;
      data = (char *)a3->data;
      vImagePixelCount v16 = a3->width;
      vImagePixelCount v17 = v16;
      long long v76 = v12;
      vImagePixelCount v18 = v12;
      vImagePixelCount v19 = v77;
      do
      {
        if (v17)
        {
          vImagePixelCount v20 = 0;
          unsigned int v21 = data + 2;
          do
          {
            int v22 = [(VNCCTextDetector *)self ii];
            char v23 = *(v21 - 1);
            if (v22 != 1) {
              char v23 = ~v23;
            }
            v18[v20] = v23;
            if (v5) {
              v18[v20] = *v21;
            }
            ++v20;
            vImagePixelCount v16 = a3->width;
            v21 += 4;
          }
          while (v16 > v20);
          vImagePixelCount v17 = a3->width;
          vImagePixelCount v19 = v77;
        }
        ++v14;
        v18 += v19;
        size_t rowBytes = a3->rowBytes;
        data += rowBytes;
      }
      while (v14 != 64);
      unint64_t v26 = (char *)a3->data;
      vImagePixelCount height = a3->height;
      if (height)
      {
        vImagePixelCount v27 = 0;
        unint64_t v28 = &v76[64 * v19];
        vImagePixelCount v29 = v16;
        do
        {
          if (v29)
          {
            vImagePixelCount v30 = 0;
            int v31 = v26 + 2;
            do
            {
              int v32 = [(VNCCTextDetector *)self ii];
              char v33 = *(v31 - 1);
              if (v32 != 1) {
                char v33 = ~v33;
              }
              v28[v30] = v33;
              if (v5) {
                v28[v30] = *v31;
              }
              ++v30;
              vImagePixelCount v16 = a3->width;
              v31 += 4;
            }
            while (v16 > v30);
            size_t rowBytes = a3->rowBytes;
            vImagePixelCount height = a3->height;
            vImagePixelCount v29 = a3->width;
            vImagePixelCount v19 = v77;
          }
          ++v27;
          v28 += v19;
          v26 += rowBytes;
        }
        while (height > v27);
        unint64_t v26 = (char *)a3->data;
      }
      int v34 = 0;
      uint64_t v35 = &v26[rowBytes * (height - 66)];
      vImagePixelCount v36 = &v76[(height + 62) * v19];
      vImagePixelCount v37 = v16;
      do
      {
        if (v37)
        {
          vImagePixelCount v38 = 0;
          unint64_t v39 = v35 + 2;
          do
          {
            int v40 = [(VNCCTextDetector *)self ii];
            char v41 = *(v39 - 1);
            if (v40 != 1) {
              char v41 = ~v41;
            }
            v36[v38] = v41;
            if (v5) {
              v36[v38] = *v39;
            }
            ++v38;
            vImagePixelCount v16 = a3->width;
            v39 += 4;
          }
          while (v16 > v38);
          size_t rowBytes = a3->rowBytes;
          vImagePixelCount v37 = a3->width;
          vImagePixelCount v19 = v77;
        }
        ++v34;
        v36 += v19;
        v35 += rowBytes;
      }
      while (v34 != 64);
      vImagePixelCount v42 = a3->height;
      unint64_t v43 = v75;
      uint64_t v44 = v74;
      unint64_t v45 = v76;
      if (v42 == -127) {
        goto LABEL_42;
      }
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      unint64_t v13 = v76;
      unint64_t v48 = v11;
      int v49 = v10;
      do
      {
        id v50 = &v48[v74];
        uint64_t v51 = &v49[v74];
        int v52 = *v49 + v13[v19];
        *uint64_t v51 = v52;
        float v53 = *v48 + (float)(v13[v19] * v13[v19]);
        *id v50 = v53;
        vImagePixelCount v54 = v19 + 1;
        uint64_t v55 = v46;
        vImagePixelCount v56 = v16 - 1;
        if (v16 >= 2)
        {
          do
          {
            int v52 = v52 + v13[v54] + *(int *)((char *)v10 + v55 + 4) - *(int *)((char *)v10 + v55);
            *(int *)((char *)&v10[v44 + 1] + v55) = v52;
            float v53 = (float)(*(float *)((char *)v11 + v55 + 4)
                        + (float)(v53 + (float)(v13[v54] * v13[v54])))
                - *(float *)((char *)v11 + v55);
            *(float *)((char *)&v11[v44 + 1] + v55) = v53;
            v55 += 4;
            ++v54;
            --v56;
          }
          while (v56);
        }
        ++v47;
        v46 += v44 * 4;
        v13 += v19;
        unint64_t v48 = v50;
        int v49 = v51;
      }
      while (v47 != v42 + 127);
      if (v42 != 1)
      {
LABEL_42:
        uint64_t v57 = 0;
        unint64_t v58 = 0;
        uint64_t v59 = (uint64_t)v75->data + 17;
        uint64_t v60 = (uint64_t)&v76[65 * v19 + 17];
        do
        {
          if (v16 >= 0x22)
          {
            uint64_t v61 = 0;
            uint64_t v62 = v57;
            do
            {
              unint64_t v13 = (char *)*(unsigned int *)((char *)v10 + v62 + 132);
              float v63 = (float)(*(int *)((char *)v10 + v62)
                                        + *(int *)((char *)&v10[129 * v74 + 33] + v62)
                                        - (*(int *)((char *)&v10[129 * v74] + v62)
                                         + v13))
                  * 0.00023491;
              float v64 = *(float *)((char *)v11 + v62 + 132);
              float v65 = sqrtf((float)((float)((float)((float)(*(float *)((char *)&v11[129 * v74 + 33] + v62)+ *(float *)((char *)v11 + v62))- *(float *)((char *)&v11[129 * v74] + v62))- v64)* 0.00023491)- (float)(v63 * v63));
              LOBYTE(v64) = *(unsigned char *)(v60 + v61);
              *(unsigned char *)(v59 + v61) = (float)(v63 + (float)(v65 * 0.2)) < (float)LODWORD(v64);
              vImagePixelCount v16 = a3->width;
              vImagePixelCount v66 = v61 + 34;
              ++v61;
              v62 += 4;
            }
            while (v16 > v66);
            vImagePixelCount v42 = a3->height;
          }
          ++v58;
          v60 += v19;
          v59 += v75->rowBytes;
          v57 += v44 * 4;
        }
        while (v42 - 1 > v58);
      }
      if ([(VNCCTextDetector *)self debugOut])
      {
        uint64_t v67 = [(VNCCTextDetector *)self debugFilename];
        unsigned __int16 v68 = [v67 stringByAppendingPathComponent:@"adaptiveOutImage.png"];

        id v69 = v68;
        int v70 = (const char *)[v69 UTF8String];
        long long v71 = *(_OWORD *)&v43->width;
        v78[0] = *(_OWORD *)&v43->data;
        v78[1] = v71;
        saveVImage(v70, (unsigned __int8 **)v78, 1280061496);
      }
      int v72 = 1;
    }
    else
    {
      int v72 = 0;
      unint64_t v45 = 0;
    }
  }
  else
  {
    int v72 = 0;
    unint64_t v45 = 0;
    int v11 = 0;
  }
  free(v10);
  free(v11);
  free(v45);
  return v72;
}

- (int)_generateAndApplyColorProfileForImage:(vImage_Buffer *)a3 votingImage:(vImage_Buffer *)a4 textOut:(vImage_Buffer *)a5 minMaxRGB:(__rgbMinMaxU8 *)a6 lowHighRGB:(__rgbMinMaxFloat *)a7 numCropRows:(unsigned __int16)a8 rowStartLocation:(unsigned __int16)a9 rowStopLocation:(unsigned __int16)a10 sumTextOutFirstPass:(unsigned int *)a11 useLowLightEnhancement:(unsigned __int8)a12
{
  unint64_t v13 = 0;
  int v14 = 0;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v87 = 0u;
  memset(v86, 0, sizeof(v86));
  long long v84 = 0u;
  long long v85 = 0u;
  int v83 = 0;
  if (!a6 || !a7)
  {
    vImagePixelCount v16 = 0;
    goto LABEL_50;
  }
  vImagePixelCount v16 = 0;
  if (a11)
  {
    uint64_t v17 = a8;
    uint64_t v73 = a8;
    int v22 = -[VNCCTextDetector _allocateVImageWithWidth:height:rowBytes:imageOut:](self, "_allocateVImageWithWidth:height:rowBytes:imageOut:");
    if (v22 != 1) {
      goto LABEL_48;
    }
    long long v23 = *(_OWORD *)&a3->width;
    if (a12)
    {
      v80[0] = *(_OWORD *)&a3->data;
      v80[1] = v23;
      v79[0] = v84;
      v79[1] = v85;
      [(VNCCTextDetector *)self createLumaImageAlternative:v80 lumaImageAlternative:v79 numCropRows:v17 rowStartLocation:a9];
    }
    else
    {
      v82[0] = *(_OWORD *)&a3->data;
      v82[1] = v23;
      v81[0] = v84;
      v81[1] = v85;
      [(VNCCTextDetector *)self createLumaImage:v82 lumaImage:v81 numCropRows:v17 rowStartLocation:a9];
    }
    v78[0] = v84;
    v78[1] = v85;
    int v22 = -[VNCCTextDetector computeMainStub:numCropRows:numCropColsOut:maxY:start:](self, "computeMainStub:numCropRows:numCropColsOut:maxY:start:", v78, v17, (char *)&v83 + 2, &v83);
    if (v22 == 1
      && (int v22 = -[VNCCTextDetector allocateColorProfileContext:width:height:rowBytes:](self, "allocateColorProfileContext:width:height:rowBytes:", v86), v22 == 1))
    {
      long long v24 = *(_OWORD *)&a4->width;
      v77[0] = *(_OWORD *)&a4->data;
      v77[1] = v24;
      [(VNCCTextDetector *)self getVotingHistogram:v77 colorProfileContext:v86 startCC:(unsigned __int16)v83 rowStartLocation:a9];
      v76[0] = v84;
      v76[1] = v85;
      [(VNCCTextDetector *)self getLumaHistogram:v76 startCC:(unsigned __int16)v83 colorProfileContext:v86];
      [(VNCCTextDetector *)self determineColorProfileType:v86];
      unint64_t v13 = malloc_type_malloc(4 * (int)v93, 0x100004052888210uLL);
      if (v13)
      {
        uint64_t v67 = v13;
        int v72 = malloc_type_malloc(4 * SDWORD1(v93), 0x100004052888210uLL);
        if (v72)
        {
          float v64 = a6;
          float v65 = a7;
          uint64_t v62 = a3;
          float v63 = a5;
          vImagePixelCount v66 = self;
          *(void *)&long long v93 = 0;
          if (v17)
          {
            uint64_t v25 = 0;
            unsigned __int8 v26 = 0;
            unsigned __int8 v27 = 0;
            unsigned __int8 v28 = 0;
            unsigned __int8 v29 = 0;
            unsigned __int8 v30 = 0;
            unsigned __int8 v31 = 0;
            uint64_t v32 = 0;
            uint64_t v33 = 0;
            size_t rowBytes = a3->rowBytes;
            int v34 = (char *)a3->data + 4 * (unsigned __int16)v83 + rowBytes * a9;
            uint64_t v35 = (unsigned __int8 *)v87;
            vImagePixelCount v36 = (unsigned char *)v89;
            uint64_t v69 = *((void *)&v88 + 1);
            int v70 = HIWORD(v83);
            uint64_t v37 = 4 * HIWORD(v83);
            uint64_t v68 = *((void *)&v90 + 1);
            unsigned __int8 v38 = -1;
            unint64_t v39 = v72;
            int v40 = v67;
            unsigned __int8 v41 = -1;
            unsigned __int8 v42 = -1;
            unsigned __int8 v43 = -1;
            unsigned __int8 v44 = -1;
            unsigned __int8 v45 = -1;
            do
            {
              if (v70)
              {
                uint64_t v46 = 0;
                uint64_t v47 = v35;
                unint64_t v48 = v36;
                do
                {
                  int v49 = *v47++;
                  if (v49 == 1)
                  {
                    id v50 = &v34[v46];
                    unsigned int v51 = v34[v46];
                    if (v51 < v43) {
                      unsigned __int8 v43 = v34[v46];
                    }
                    unsigned int v52 = v50[1];
                    if (v52 < v44) {
                      unsigned __int8 v44 = v50[1];
                    }
                    unsigned int v53 = v50[2];
                    if (v53 < v45) {
                      unsigned __int8 v45 = v50[2];
                    }
                    if (v51 > v29) {
                      unsigned __int8 v29 = v34[v46];
                    }
                    if (v52 > v30) {
                      unsigned __int8 v30 = v50[1];
                    }
                    if (v53 > v31) {
                      unsigned __int8 v31 = v50[2];
                    }
                    unsigned char *v40 = v53;
                    v40[1] = v50[1];
                    v40[2] = *v50;
                    v40 += 4;
                    uint64_t v32 = (v32 + 1);
                    LODWORD(v93) = v32;
                  }
                  if (*v48 == 1)
                  {
                    vImagePixelCount v54 = &v34[v46];
                    unsigned int v55 = v34[v46];
                    if (v55 < v38) {
                      unsigned __int8 v38 = v34[v46];
                    }
                    unsigned int v56 = v54[1];
                    if (v56 < v41) {
                      unsigned __int8 v41 = v54[1];
                    }
                    unsigned int v57 = v54[2];
                    if (v57 < v42) {
                      unsigned __int8 v42 = v54[2];
                    }
                    if (v55 > v26) {
                      unsigned __int8 v26 = v34[v46];
                    }
                    if (v56 > v27) {
                      unsigned __int8 v27 = v54[1];
                    }
                    if (v57 > v28) {
                      unsigned __int8 v28 = v54[2];
                    }
                    unsigned char *v39 = v57;
                    v39[1] = v54[1];
                    v39[2] = *v54;
                    v39 += 4;
                    uint64_t v33 = (v33 + 1);
                    DWORD1(v93) = v33;
                  }
                  v46 += 4;
                  ++v48;
                }
                while (v37 != v46);
              }
              ++v25;
              vImagePixelCount v16 = v72;
              v34 += rowBytes;
              v36 += v68;
              v35 += v69;
            }
            while (v25 != v73);
          }
          else
          {
            uint64_t v33 = 0;
            uint64_t v32 = 0;
            unsigned __int8 v31 = 0;
            unsigned __int8 v30 = 0;
            unsigned __int8 v29 = 0;
            unsigned __int8 v28 = 0;
            unsigned __int8 v27 = 0;
            unsigned __int8 v26 = 0;
            unsigned __int8 v45 = -1;
            unsigned __int8 v44 = -1;
            unsigned __int8 v43 = -1;
            unsigned __int8 v42 = -1;
            unsigned __int8 v41 = -1;
            unsigned __int8 v38 = -1;
            vImagePixelCount v16 = v72;
          }
          v64->uint64_t var0 = v45;
          v64->unsigned int var1 = v31;
          v64->uint64_t var2 = v44;
          v64->int var3 = v30;
          v64->var4 = v43;
          v64->var5 = v29;
          v64[1].uint64_t var0 = v42;
          v64[1].unsigned int var1 = v28;
          v64[1].uint64_t var2 = v41;
          v64[1].int var3 = v27;
          v64[1].var4 = v38;
          v64[1].var5 = v26;
          self = v66;
          int v14 = -[VNCCTextDetector generateHistogramBounds:rgbVector2Ref:numPixels1:numPixels2:minMaxRGB:lowHighRGB:](v66, "generateHistogramBounds:rgbVector2Ref:numPixels1:numPixels2:minMaxRGB:lowHighRGB:", v67, v16, v32, v33);
          if (v14 == 1)
          {
            uint64_t v59 = &v65[[(VNCCTextDetector *)v66 ii] != 1];
            long long v60 = *(_OWORD *)&v62->width;
            v75[0] = *(_OWORD *)&v62->data;
            v75[1] = v60;
            long long v61 = *(_OWORD *)&v63->width;
            v74[0] = *(_OWORD *)&v63->data;
            v74[1] = v61;
            *a11 = [(VNCCTextDetector *)v66 _generateBinarizationForImage:v75 textOut:v74 firstOrSecondPassIndicator:0 minMaxRGB:v59];
          }
        }
        else
        {
          int v14 = 0;
          vImagePixelCount v16 = 0;
        }
        unint64_t v13 = v67;
        goto LABEL_50;
      }
      int v14 = 0;
    }
    else
    {
LABEL_48:
      int v14 = v22;
      unint64_t v13 = 0;
    }
    vImagePixelCount v16 = 0;
  }
LABEL_50:
  free(v13);
  free(v16);
  [(VNCCTextDetector *)self freeColorProfileContext:v86];
  [(VNCCTextDetector *)self _freeVImage:&v84];
  return v14;
}

- (void)freeColorProfileContext:(__CCColorProfileContext *)a3
{
  if (a3)
  {
    -[VNCCTextDetector _freeVImage:](self, "_freeVImage:");
    [(VNCCTextDetector *)self _freeVImage:&a3->var1];
    [(VNCCTextDetector *)self _freeVImage:&a3->var2];
    [(VNCCTextDetector *)self _freeVImage:&a3->var3];
  }
}

- (int)allocateColorProfileContext:(__CCColorProfileContext *)a3 width:(unsigned __int16)a4 height:(unsigned __int16)a5 rowBytes:(unint64_t)a6
{
  unsigned int v7 = a5;
  unsigned int v8 = a4;
  +[VNError VNAssert:a3 != 0 log:@"color profile context must not be NULL"];
  *(_OWORD *)&a3->var2.data = 0u;
  *(_OWORD *)&a3->var3.data = 0u;
  *(_OWORD *)&a3->var3.vImagePixelCount width = 0u;
  *(_OWORD *)&a3->var2.vImagePixelCount width = 0u;
  *(_OWORD *)&a3->var1.data = 0u;
  *(_OWORD *)&a3->var1.vImagePixelCount width = 0u;
  *(_OWORD *)&a3->var0.data = 0u;
  *(_OWORD *)&a3->var0.vImagePixelCount width = 0u;
  int result = [(VNCCTextDetector *)self _allocateVImageWithWidth:v8 height:v7 rowBytes:a6 imageOut:a3];
  if (result == 1)
  {
    int result = [(VNCCTextDetector *)self _allocateVImageWithWidth:v8 height:v7 rowBytes:a6 imageOut:&a3->var1];
    if (result == 1)
    {
      int result = [(VNCCTextDetector *)self _allocateVImageWithWidth:v8 height:v7 rowBytes:a6 imageOut:&a3->var2];
      if (result == 1)
      {
        int result = [(VNCCTextDetector *)self _allocateVImageWithWidth:v8 height:v7 rowBytes:a6 imageOut:&a3->var3];
        if (result == 1)
        {
          a3->var6 = v8;
          a3->var7 = v7;
        }
      }
    }
  }
  return result;
}

- (void)determineColorProfileType:(__CCColorProfileContext *)a3
{
  if (a3->var7)
  {
    int v4 = 0;
    int v5 = 0;
    int v6 = 0;
    int v7 = 0;
    unsigned int v8 = 0;
    data = (char *)a3->var0.data;
    unsigned int var6 = a3->var6;
    unsigned int v11 = var6 & 0xFFF0;
    int v12 = (char *)a3->var2.data;
    unint64_t v13 = (char *)a3->var3.data;
    int v14 = (char *)a3->var1.data;
    v15.i64[0] = 0x101010101010101;
    v15.i64[1] = 0x101010101010101;
    do
    {
      if ((var6 & 0xFFF0) != 0)
      {
        uint64_t v16 = 0;
        do
        {
          int8x16_t v17 = *(int8x16_t *)&v14[v16];
          int8x16_t v18 = *(int8x16_t *)&v12[v16];
          int8x16_t v19 = *(int8x16_t *)&v13[v16];
          int8x16_t v20 = vceqq_s8(*(int8x16_t *)&data[v16], v15);
          v6 += vaddlvq_u8((uint8x16_t)vandq_s8(v19, vceqq_s8(v17, v15)));
          v7 += vaddlvq_u8((uint8x16_t)vandq_s8(v19, vceqq_s8(v18, v15)));
          v4 += vaddvq_s8(vandq_s8(v17, v20));
          v5 += vaddvq_s8(vandq_s8(v18, v20));
          v16 += 16;
        }
        while (v16 < v11);
        unsigned int v21 = &v14[v16];
        int v22 = &v12[v16];
        long long v23 = &data[v16];
        long long v24 = &v13[v16];
        unsigned int v25 = ((v11 - 1) & 0xFFFFFFF0) + 16;
      }
      else
      {
        unsigned int v25 = 0;
        long long v24 = v13;
        long long v23 = data;
        int v22 = v12;
        unsigned int v21 = v14;
      }
      BOOL v26 = var6 >= v25;
      unsigned int v27 = var6 - v25;
      if (v27 != 0 && v26)
      {
        do
        {
          int v29 = *v21++;
          int v28 = v29;
          int v31 = *v23++;
          int v30 = v31;
          v4 += v31 * v28;
          int v33 = *v22++;
          int v32 = v33;
          v5 += v33 * v30;
          int v34 = *v24++;
          v6 += v34 * v28;
          v7 += v34 * v32;
          --v27;
        }
        while (v27);
      }
      ++v8;
      v14 += a3->var1.rowBytes;
      v12 += a3->var2.rowBytes;
      data += a3->var0.rowBytes;
      v13 += a3->var3.rowBytes;
    }
    while (v8 < a3->var7);
  }
  else
  {
    int v7 = 0;
    int v6 = 0;
    int v5 = 0;
    int v4 = 0;
  }
  float var4 = (float)a3->var4;
  float v36 = (float)v6 / var4;
  float var5 = (float)a3->var5;
  float v38 = (float)v4 / var4;
  float v39 = (float)v5 / var5;
  float v40 = (float)v7 / var5;
  if (v38 <= v39 || v36 <= v40)
  {
    [(VNCCTextDetector *)self setIi:2];
    if (v38 < v39)
    {
      if (v36 <= 115.0 || v40 >= 40.0)
      {
        unsigned __int8 v41 = self;
        uint64_t v42 = 0;
      }
      else
      {
        unsigned __int8 v41 = self;
        uint64_t v42 = 1;
      }
      [(VNCCTextDetector *)v41 setProfileNormal:v42];
    }
  }
  else
  {
    [(VNCCTextDetector *)self setIi:1];
  }
}

- (int)computeMainStub:(vImage_Buffer *)a3 numCropRows:(unsigned __int16)a4 numCropColsOut:(unsigned __int16 *)a5 maxY:(float)a6 start:(unsigned __int16 *)a7
{
  int v7 = 0;
  int v8 = 0;
  if (a5)
  {
    unint64_t v9 = 0;
    if (a7)
    {
      unsigned int v12 = a4;
      *a5 = 0;
      unint64_t v9 = (float *)malloc_type_calloc(a3->width, 4uLL, 0x100004052888210uLL);
      if (v9)
      {
        int8x16_t v15 = malloc_type_calloc(a3->width, 4uLL, 0x100004052888210uLL);
        int v7 = v15;
        if (v15)
        {
          float v17 = 1.0 / (float)((float)((float)v12 * 5.0) * a6);
          float v18 = v17 / a6;
          data = (unsigned __int8 *)a3->data;
          if (v12)
          {
            int v20 = 0;
            size_t rowBytes = a3->rowBytes;
            float v22 = 0.0;
            long long v23 = (unsigned __int8 *)a3->data;
            do
            {
              unsigned int v24 = 0;
              unsigned int v25 = v23;
              do
              {
                unsigned int v26 = *v25++;
                float v22 = v22 + (float)v26;
                BOOL v27 = v24++ >= 4;
              }
              while (!v27);
              ++v20;
              v23 += rowBytes;
            }
            while (v12 > (unsigned __int16)v20);
            int v28 = 0;
            float v16 = v17 * v22;
            v9[2] = v17 * v22;
            float v29 = 0.0;
            int v30 = data;
            do
            {
              unsigned int v31 = 0;
              int v32 = v30;
              do
              {
                unsigned int v33 = *v32++;
                float v29 = v29 + (float)((float)((float)v33 - v16) * (float)((float)v33 - v16));
                BOOL v27 = v31++ >= 4;
              }
              while (!v27);
              ++v28;
              v30 += rowBytes;
            }
            while (v12 > (unsigned __int16)v28);
          }
          else
          {
            float v22 = 0.0;
            v9[2] = v17 * 0.0;
            float v29 = 0.0;
          }
          float v34 = v18 * v29;
          *((float *)v15 + 2) = v34;
          vImagePixelCount v35 = a3->width - 2;
          if (v35 >= 4)
          {
            uint64_t v36 = 0;
            unsigned int v37 = 5;
            for (uint64_t i = 3; i != v35; ++i)
            {
              if (v12)
              {
                int v39 = 0;
                float v40 = data;
                do
                {
                  LOBYTE(v34) = v40[v37];
                  LOBYTE(v16) = v40[v36];
                  float v41 = v22 + (float)LODWORD(v34);
                  float v34 = (float)LODWORD(v16);
                  float v22 = v41 - (float)LODWORD(v16);
                  ++v39;
                  v40 += a3->rowBytes;
                }
                while (v12 > (unsigned __int16)v39);
              }
              float v34 = v17 * v22;
              v9[i] = v17 * v22;
              ++v36;
              ++v37;
            }
            for (uint64_t j = 3; j != v35; ++j)
            {
              if (v12)
              {
                int v43 = 0;
                unint64_t v44 = j + 2;
                float v45 = 0.0;
                uint64_t v46 = data;
                do
                {
                  if (v44 >= (unsigned __int16)(j - 2))
                  {
                    int v47 = j - 2;
                    do
                    {
                      LOBYTE(v34) = v46[(unsigned __int16)v47];
                      float v34 = (float)LODWORD(v34) + (float)((float)-v9[j] * a6);
                      float v45 = v45 + (float)(v34 * v34);
                      ++v47;
                    }
                    while (v44 >= (unsigned __int16)v47);
                  }
                  ++v43;
                  v46 += a3->rowBytes;
                }
                while (v12 > (unsigned __int16)v43);
              }
              else
              {
                float v45 = 0.0;
              }
              *((float *)v15 + j) = v18 * v45;
            }
          }
          *a5 = -[VNCCTextDetector computeNumCropCols:width:start:](self, "computeNumCropCols:width:start:", v15);
          int v8 = 1;
        }
        else
        {
          int v8 = 0;
        }
      }
      else
      {
        int v8 = 0;
        int v7 = 0;
      }
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  free(v9);
  free(v7);
  return v8;
}

- (unsigned)computeNumCropCols:(float *)a3 width:(unint64_t)a4 start:(unsigned __int16 *)a5
{
  if (a4)
  {
    uint64_t v5 = 0;
    unsigned __int16 v6 = 0;
    unsigned __int16 v7 = 0;
    unsigned __int16 v8 = 0;
    unsigned __int16 v9 = 0;
    while (1)
    {
      double v10 = a3[v5];
      if (v10 >= 0.0025) {
        ++v8;
      }
      else {
        unsigned __int16 v8 = 0;
      }
      if (v10 < 0.0025) {
        ++v7;
      }
      else {
        unsigned __int16 v7 = 0;
      }
      unsigned __int16 v11 = v6 - 25;
      if ((unsigned __int16)(v6 - 25) >= 5u) {
        __int16 v12 = v6 - 25;
      }
      else {
        __int16 v12 = 50;
      }
      if (v8 <= 0x19u) {
        __int16 v13 = 0;
      }
      else {
        __int16 v13 = v12;
      }
      if (v6 > 0xAFu) {
        __int16 v13 = 50;
      }
      if (!v9) {
        unsigned __int16 v9 = v13;
      }
      if (v9 && v7 > 0x19u) {
        break;
      }
      uint64_t v5 = ++v6;
      if (v6 >= a4)
      {
        if (v9) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
    }
    double v14 = (double)a4;
    int v15 = (int)((double)a4 * 0.75);
    if (v11) {
      goto LABEL_26;
    }
  }
  else
  {
LABEL_23:
    unsigned __int16 v9 = 50;
LABEL_24:
    double v14 = (double)a4;
    int v15 = (int)((double)a4 * 0.75);
  }
  unsigned __int16 v11 = v15;
LABEL_26:
  if (v11 - v9 >= (int)(v14 * 0.15)) {
    LOWORD(v15) = v11;
  }
  else {
    unsigned __int16 v9 = 50;
  }
  *a5 = v9;
  return v15 - v9 + 1;
}

- (void)getLumaHistogram:(vImage_Buffer *)a3 startCC:(unsigned __int16)a4 colorProfileContext:(__CCColorProfileContext *)a5
{
  unsigned int v6 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  unsigned int var7 = a5->var7;
  unsigned int var6 = a5->var6;
  bzero(v32, 0x400uLL);
  data = (char *)a3->data;
  if (var7)
  {
    int v11 = 0;
    size_t rowBytes = a3->rowBytes;
    __int16 v13 = (unsigned __int8 *)a3->data;
    do
    {
      if (var6)
      {
        int v14 = 0;
        uint64_t v15 = v6;
        do
        {
          ++v32[v13[v15]];
          ++v14;
          ++v15;
        }
        while (var6 > (unsigned __int16)v14);
      }
      ++v11;
      v13 += rowBytes;
    }
    while (var7 > (unsigned __int16)v11);
  }
  int v16 = 0;
  int v17 = (int)((double)var7 * 0.2 * (double)var6);
  int v18 = 255;
  while (1)
  {
    v16 += v32[v18];
    if (v16 >= v17) {
      break;
    }
    BOOL v19 = v18-- != 0;
    if (v18 == 0 || !v19)
    {
      int v18 = 0;
      break;
    }
  }
  uint64_t v20 = 0;
  int v21 = 0;
  do
  {
    v21 += v32[v20];
    if (v21 >= v17) {
      break;
    }
    ++v20;
  }
  while (v20 != 256);
  if (var7)
  {
    int v22 = 0;
    long long v23 = a5->var3.data;
    unsigned int v24 = (BOOL *)a5->var2.data;
    unsigned int v25 = (BOOL *)a5->var1.data;
    do
    {
      if ((_WORD)var6)
      {
        int v26 = 0;
        BOOL v27 = &data[v6];
        int v28 = v23;
        float v29 = v24;
        int v30 = v25;
        do
        {
          unsigned int v31 = *v27++;
          *v30++ = v18 <= (int)v31;
          *v29++ = v20 >= v31;
          *v28++ = v31;
          ++v26;
          unsigned int var6 = a5->var6;
        }
        while (var6 > (unsigned __int16)v26);
        LOWORD(var7) = a5->var7;
      }
      else
      {
        LOWORD(var6) = 0;
      }
      ++v22;
      v25 += a5->var1.rowBytes;
      v24 += a5->var2.rowBytes;
      v23 += a5->var3.rowBytes;
      data += a3->rowBytes;
    }
    while ((unsigned __int16)v22 < (unsigned __int16)var7);
  }
  a5->float var4 = v16;
  a5->float var5 = v21;
}

- (void)getVotingHistogram:(vImage_Buffer *)a3 colorProfileContext:(__CCColorProfileContext *)a4 startCC:(unsigned __int16)a5 rowStartLocation:(unsigned __int16)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  size_t rowBytes = a3->rowBytes;
  unsigned int var7 = a4->var7;
  unsigned int var6 = a4->var6;
  int v11 = (char *)a3->data + rowBytes * a6 + a5;
  bzero(v27, 0x400uLL);
  if (var7)
  {
    int v12 = 0;
    __int16 v13 = v11;
    do
    {
      if (var6)
      {
        uint64_t v14 = 0;
        do
          ++v27[v13[v14++]];
        while (var6 > (unsigned __int16)v14);
      }
      ++v12;
      v13 += rowBytes;
    }
    while (var7 > (unsigned __int16)v12);
  }
  int v15 = 0;
  signed int v16 = 255;
  while (1)
  {
    v15 += v27[v16];
    if (v15 > (int)((double)var7 * 0.2 * (double)var6)) {
      break;
    }
    BOOL v17 = v16-- != 0;
    if (v16 == 0 || !v17)
    {
      signed int v16 = 0;
      break;
    }
  }
  if (var7)
  {
    unsigned int v18 = 0;
    uint8x16_t v19 = (uint8x16_t)vdupq_n_s8(v16);
    data = (BOOL *)a4->var0.data;
    v21.i64[0] = 0x101010101010101;
    v21.i64[1] = 0x101010101010101;
    do
    {
      unsigned int v22 = (unsigned __int16)var6;
      if ((unsigned __int16)var6 < 0x10u)
      {
        LODWORD(v23) = 0;
        unsigned int v25 = v11;
        unsigned int v24 = data;
      }
      else
      {
        uint64_t v23 = 0;
        do
        {
          *(int8x16_t *)&data[v23] = vandq_s8((int8x16_t)vcgeq_u8(*(uint8x16_t *)&v11[v23], v19), v21);
          unsigned int v22 = a4->var6;
          v23 += 16;
        }
        while ((int)v23 < (int)(v22 - 15));
        unsigned int v24 = &data[v23];
        unsigned int v25 = &v11[v23];
        LOWORD(var6) = a4->var6;
      }
      if (v23 < v22)
      {
        do
        {
          signed int v26 = *v25++;
          *v24++ = v16 <= v26;
          LODWORD(v23) = v23 + 1;
          unsigned int var6 = a4->var6;
        }
        while (v23 < var6);
      }
      ++v18;
      v11 += a3->rowBytes;
      data += a4->var0.rowBytes;
    }
    while (v18 < a4->var7);
  }
}

- (float)createLumaImageAlternative:(vImage_Buffer *)a3 lumaImageAlternative:(vImage_Buffer *)a4 numCropRows:(unsigned __int16)a5 rowStartLocation:(unsigned __int16)a6
{
  if (!a5) {
    return 0.0;
  }
  unsigned int v6 = 0;
  data = a4->data;
  vImagePixelCount width = a3->width;
  size_t rowBytes = a3->rowBytes;
  double v10 = (char *)a3->data + rowBytes * a6;
  float result = 0.0;
  do
  {
    if (width)
    {
      vImagePixelCount v12 = 0;
      __int16 v13 = (unsigned __int8 *)(v10 + 2);
      do
      {
        unsigned int v15 = *v13;
        v13 += 4;
        char v14 = v15;
        float v16 = (float)v15;
        if (result < (float)v15) {
          float result = v16;
        }
        data[v12++] = v14;
        vImagePixelCount width = a3->width;
      }
      while (width > v12);
      size_t rowBytes = a3->rowBytes;
    }
    ++v6;
    v10 += rowBytes;
    data += a4->rowBytes;
  }
  while (v6 < a5);
  return result;
}

- (float)createLumaImage:(vImage_Buffer *)a3 lumaImage:(vImage_Buffer *)a4 numCropRows:(unsigned __int16)a5 rowStartLocation:(unsigned __int16)a6
{
  if (!a5) {
    return 0.0;
  }
  unsigned int v6 = 0;
  data = a4->data;
  vImagePixelCount width = a3->width;
  float result = 0.0;
  v10.i64[0] = 0x1D1D1D1D1D1D1D1DLL;
  v10.i64[1] = 0x1D1D1D1D1D1D1D1DLL;
  int v11 = (char *)a3->data + a3->rowBytes * a6;
  v12.i64[0] = 0x9696969696969696;
  v12.i64[1] = 0x9696969696969696;
  v13.i64[0] = 0x4A4A4A4A4A4A4A4ALL;
  v13.i64[1] = 0x4A4A4A4A4A4A4A4ALL;
  do
  {
    if (width == 15)
    {
      LODWORD(v14) = 0;
      unsigned int v15 = data;
      float v16 = v11;
    }
    else
    {
      unint64_t v14 = 0;
      float v16 = v11;
      do
      {
        int8x16x4_t v23 = vld4q_s8(v16);
        v16 += 64;
        v17.i64[0] = 0x80008000800080;
        v17.i64[1] = 0x80008000800080;
        v18.i64[0] = 0x80008000800080;
        v18.i64[1] = 0x80008000800080;
        uint8x16_t v19 = (uint8x16_t)vraddhn_high_s16(vraddhn_s16((int16x8_t)vmlal_u8(vmlal_u8(vmlal_u8(v17, *(uint8x8_t *)v23.val[0].i8, (uint8x8_t)0x1D1D1D1D1D1D1D1DLL), *(uint8x8_t *)v23.val[1].i8, (uint8x8_t)0x9696969696969696), *(uint8x8_t *)v23.val[2].i8, (uint8x8_t)0x4A4A4A4A4A4A4A4ALL), (int16x8_t)0), (int16x8_t)vmlal_high_u8(vmlal_high_u8(vmlal_high_u8(v18, (uint8x16_t)v23.val[0], v10), (uint8x16_t)v23.val[1], v12), (uint8x16_t)v23.val[2], v13), (int16x8_t)0);
        v23.val[1].i8[0] = vmaxvq_u8(v19);
        float v20 = (float)v23.val[1].u32[0];
        if (result < v20) {
          float result = v20;
        }
        *(uint8x16_t *)&data[v14] = v19;
        v14 += 16;
        vImagePixelCount width = a3->width;
      }
      while (width - 15 > v14);
      unsigned int v15 = &data[v14];
    }
    if (width > v14)
    {
      unint64_t v14 = v14;
      int8x16_t v21 = (unsigned __int8 *)(v16 + 2);
      do
      {
        signed int v22 = (301 * *(v21 - 1) + 153 * *v21 + 58 * *(v21 - 2) + 256) >> 9;
        if (result < (float)v22) {
          float result = (float)v22;
        }
        *v15++ = v22;
        ++v14;
        vImagePixelCount width = a3->width;
        v21 += 4;
      }
      while (width > v14);
    }
    ++v6;
    v11 += a3->rowBytes;
    data += a4->rowBytes;
  }
  while (v6 < a5);
  return result;
}

- (unsigned)_generateBinarizationForImage:(vImage_Buffer *)a3 textOut:(vImage_Buffer *)a4 firstOrSecondPassIndicator:(unsigned __int8)a5 minMaxRGB:(__rgbMinMaxFloat *)a6
{
  vImagePixelCount width = a3->width;
  if (width >= 0x1000) {
    __assert_rtn("-[VNCCTextDetector _generateBinarizationForImage:textOut:firstOrSecondPassIndicator:minMaxRGB:]", "VNCCTextDetector.mm", 2516, "image.width < 4096");
  }
  int v15 = a5;
  if (a3->height)
  {
    vImagePixelCount v17 = 0;
    unsigned int v18 = 0;
    unsigned int v19 = vcvtms_s32_f32(a6->var0);
    unsigned int v20 = vcvtps_s32_f32(a6->var1);
    unsigned int v21 = vcvtms_s32_f32(a6->var2);
    unsigned int v22 = vcvtps_s32_f32(a6->var3);
    unsigned int v23 = vcvtms_s32_f32(a6->var4);
    unsigned int v24 = vcvtps_s32_f32(a6->var5);
    uint8x16_t v6 = (uint8x16_t)vdupq_n_s8(v19);
    uint8x16_t v7 = (uint8x16_t)vdupq_n_s8(v20);
    uint8x16_t v8 = (uint8x16_t)vdupq_n_s8(v21);
    uint8x16_t v9 = (uint8x16_t)vdupq_n_s8(v22);
    uint8x16_t v10 = (uint8x16_t)vdupq_n_s8(v23);
    uint8x16_t v11 = (uint8x16_t)vdupq_n_s8(v24);
    data = (const char *)a3->data;
    signed int v26 = a4->data;
    v12.i16[0] = 257;
    v12.i8[2] = 1;
    v12.i8[3] = 1;
    v12.i8[4] = 1;
    v12.i8[5] = 1;
    v12.i8[6] = 1;
    v12.i8[7] = 1;
    v12.i8[8] = 1;
    v12.i8[9] = 1;
    v12.i8[10] = 1;
    v12.i8[11] = 1;
    v12.i8[12] = 1;
    v12.i8[13] = 1;
    v12.i8[14] = 1;
    v12.i8[15] = 1;
    do
    {
      if (width >= 0x10)
      {
        unint64_t v27 = 0;
        float v29 = data;
        do
        {
          int8x16x4_t v45 = vld4q_s8(v29);
          v29 += 64;
          int8x16_t v30 = vandq_s8(vandq_s8(vandq_s8((int8x16_t)vcgtq_u8((uint8x16_t)v45.val[1], v8), (int8x16_t)vcgtq_u8(v9, (uint8x16_t)v45.val[1])), vandq_s8((int8x16_t)vcgtq_u8(v7, (uint8x16_t)v45.val[2]), (int8x16_t)vcgtq_u8((uint8x16_t)v45.val[2], v6))), vandq_s8(vandq_s8((int8x16_t)vcgtq_u8((uint8x16_t)v45.val[0], v10), (int8x16_t)vcgtq_u8(v11, (uint8x16_t)v45.val[0])), v12));
          *(int8x16_t *)&v26[v27] = v30;
          v18 += vaddvq_s8(v30);
          v27 += 16;
          vImagePixelCount width = a3->width;
        }
        while ((width & 0xFFFFFFFFFFFFFFF0) > v27);
        uint64_t v28 = &v26[v27];
      }
      else
      {
        LODWORD(v27) = 0;
        uint64_t v28 = v26;
        float v29 = data;
      }
      if (width > v27)
      {
        unint64_t v27 = v27;
        unsigned int v31 = (unsigned __int8 *)(v29 + 2);
        do
        {
          unsigned int v32 = *(v31 - 2);
          BOOL v33 = v32 <= v23 || v32 >= v24;
          if (v33
            || ((unsigned int v34 = *(v31 - 1), v34 > v21) ? (v35 = v34 >= v22) : (v35 = 1),
                v35 || ((unsigned int v36 = *v31, v36 > v19) ? (v37 = v36 >= v20) : (v37 = 1), v37)))
          {
            *uint64_t v28 = 0;
          }
          else
          {
            *uint64_t v28 = 1;
            ++v18;
          }
          ++v27;
          ++v28;
          vImagePixelCount width = a3->width;
          v31 += 4;
        }
        while (width > v27);
      }
      ++v17;
      v26 += a4->rowBytes;
      data += a3->rowBytes;
    }
    while (a3->height > v17);
  }
  else
  {
    unsigned int v18 = 0;
  }
  if ([(VNCCTextDetector *)self debugOut])
  {
    float v38 = [(VNCCTextDetector *)self debugFilename];
    if (v15) {
      [v38 stringByAppendingPathComponent:@"textOutSecondPassImage.png"];
    }
    else {
    int v39 = [v38 stringByAppendingPathComponent:@"textOutFirstPassImage.png"];
    }

    id v40 = v39;
    float v41 = (const char *)[v40 UTF8String];
    long long v42 = *(_OWORD *)&a4->width;
    v44[0] = *(_OWORD *)&a4->data;
    v44[1] = v42;
    saveVImage(v41, (unsigned __int8 **)v44, 1280061496);
  }
  return v18;
}

- (int)generateHistogramBounds:(__rgbaColor *)a3 rgbVector2Ref:(__rgbaColor *)a4 numPixels1:(unsigned int)a5 numPixels2:(unsigned int)a6 minMaxRGB:(__rgbMinMaxU8 *)a7 lowHighRGB:(__rgbMinMaxFloat *)a8
{
  LODWORD(v8) = 0;
  uint8x16_t v9 = 0;
  if (a3 && a4 && a7 && a8)
  {
    int8x16_t v12 = malloc_type_calloc(0x99uLL, 1uLL, 0x100004077774924uLL);
    uint8x16_t v9 = v12;
    if (v12)
    {
      unint64_t v81 = self;
      BOOL v79 = a4;
      uint64_t v8 = 0;
      uint8x16_t v13 = (char *)v12 + 51;
      unint64_t v14 = (char *)v12 + 102;
      char v15 = 1;
      while (1)
      {
        char v16 = v15;
        vImagePixelCount v17 = &a7[v8];
        *(_OWORD *)((char *)v9 + 137) = 0u;
        v9[7] = 0u;
        v9[8] = 0u;
        v9[5] = 0u;
        v9[6] = 0u;
        v9[3] = 0u;
        v9[4] = 0u;
        v9[1] = 0u;
        v9[2] = 0u;
        *uint8x16_t v9 = 0u;
        unsigned int var0 = v17->var0;
        unsigned int var1 = v17->var1;
        unsigned int var2 = v17->var2;
        unsigned int var3 = v17->var3;
        unsigned int var4 = v17->var4;
        unsigned int var5 = v17->var5;
        float v24 = (float)(int)(var1 - var0) / 50.0;
        float v25 = (float)(int)(var3 - var2) / 50.0;
        if (v16) {
          uint64_t v26 = a5;
        }
        else {
          uint64_t v26 = a6;
        }
        float v27 = (float)(int)(var5 - var4) / 50.0;
        if (v26)
        {
          uint64_t v28 = v79;
          if (v16) {
            uint64_t v28 = a3;
          }
          p_unsigned int var2 = &v28->var2;
          uint64_t v30 = v26;
          do
          {
            float v31 = (float)((float)(int)(*(p_var2 - 2) - var0) / v24) + -0.001;
            double v32 = (float)((float)(int)(*(p_var2 - 1) - var2) / v25) + -0.001;
            int v33 = *p_var2;
            p_var2 += 4;
            *(float *)&double v32 = v32;
            float v34 = (float)((float)(int)(v33 - var4) / v27) + -0.001;
            unsigned int v35 = vcvtms_s32_f32(*(float *)&v32);
            unsigned int v36 = vcvtms_s32_f32(v31);
            unsigned int v37 = vcvtms_s32_f32(v34);
            if (v36 >= 0x32) {
              unsigned int v36 = 50;
            }
            if (v35 >= 0x32) {
              unsigned int v35 = 50;
            }
            char v38 = v13[v35];
            ++*((unsigned char *)v9 + v36);
            if (v37 >= 0x32) {
              unsigned int v39 = 50;
            }
            else {
              unsigned int v39 = v37;
            }
            char v40 = v14[v39];
            v13[v35] = v38 + 1;
            v14[v39] = v40 + 1;
            --v30;
          }
          while (v30);
        }
        uint64_t v41 = 0;
        float v42 = v24 * 0.5;
        float v43 = v25 * 0.5;
        float v44 = v27 * 0.5;
        float v45 = (float)var1;
        float v46 = (float)var3;
        float v47 = (float)var5;
        float v48 = (float)v26;
        float v49 = (float)((float)v26 / 50.0) * 0.5;
        float v89 = (float)var0;
        while (1)
        {
          LOBYTE(v48) = *((unsigned char *)v9 + v41);
          float v48 = (float)LODWORD(v48);
          if (v49 < v48) {
            break;
          }
          if (++v41 == 51)
          {
            float v92 = (float)var0;
            goto LABEL_29;
          }
        }
        float v48 = (float)((float)var0 + (float)((float)(int)v41 * v24)) - v42;
        if (!v41) {
          float v48 = (float)var0;
        }
        float v92 = v48;
LABEL_29:
        uint64_t v50 = 0;
        float v88 = (float)var2;
        while (1)
        {
          LOBYTE(v48) = *((unsigned char *)v9 + v50 + 51);
          float v48 = (float)LODWORD(v48);
          if (v49 < v48) {
            break;
          }
          if (++v50 == 51)
          {
            float v90 = (float)var2;
            goto LABEL_36;
          }
        }
        float v48 = (float)((float)var2 + (float)((float)(int)v50 * v25)) - v43;
        if (!v50) {
          float v48 = (float)var2;
        }
        float v90 = v48;
LABEL_36:
        uint64_t v51 = 0;
        while (1)
        {
          LOBYTE(v48) = *((unsigned char *)v9 + v51 + 102);
          float v48 = (float)LODWORD(v48);
          if (v49 < v48) {
            break;
          }
          if (++v51 == 51)
          {
            float v91 = (float)var4;
            goto LABEL_43;
          }
        }
        float v48 = (float)((float)var4 + (float)((float)(int)v51 * v27)) - v44;
        if (!v51) {
          float v48 = (float)var4;
        }
        float v91 = v48;
LABEL_43:
        unint64_t v52 = 50;
        while (1)
        {
          LOBYTE(v48) = *((unsigned char *)v9 + v52);
          float v48 = (float)LODWORD(v48);
          if (v49 < v48) {
            break;
          }
          if (v52-- <= 1)
          {
            float v54 = (float)var1;
            goto LABEL_49;
          }
        }
        float v54 = (float)var1;
        if (v52 != 50)
        {
          float v24 = v45 - (float)((float)(50 - (int)v52) * v24);
          float v54 = v42 + v24;
        }
LABEL_49:
        uint64_t v55 = 101;
        while (1)
        {
          unint64_t v56 = v55 - 51;
          LOBYTE(v24) = *((unsigned char *)v9 + v55);
          float v24 = (float)LODWORD(v24);
          if (v49 < v24) {
            break;
          }
          --v55;
          if (v56 <= 1)
          {
            float v57 = (float)var3;
            goto LABEL_55;
          }
        }
        float v57 = (float)var3;
        if (v55 != 101)
        {
          float v25 = v46 - (float)((float)(101 - v55) * v25);
          float v57 = v43 + v25;
        }
LABEL_55:
        uint64_t v58 = 152;
        float v82 = v43;
        float v87 = (float)var4;
        while (1)
        {
          unint64_t v59 = v58 - 102;
          LOBYTE(v25) = *((unsigned char *)v9 + v58);
          float v25 = (float)LODWORD(v25);
          if (v49 < v25) {
            break;
          }
          --v58;
          if (v59 <= 1)
          {
            float v60 = v42;
            float v61 = (float)var5;
            goto LABEL_61;
          }
        }
        float v60 = v42;
        float v61 = (float)var5;
        if (v58 != 152) {
          float v61 = v44 + (float)(v47 - (float)((float)(152 - v58) * v27));
        }
LABEL_61:
        float v62 = v27 * 0.5;
        if ([(VNCCTextDetector *)v81 ii] == 1)
        {
          float v63 = v92;
          if ((float)(v54 - v92) < 75.0)
          {
            float v64 = v92 + v92 * -0.2;
            float v63 = v64 >= 0.0 ? v92 + v92 * -0.2 : 0.0;
            float v54 = v54 + v54 * 0.1;
            if (v54 > 255.0) {
              float v54 = 255.0;
            }
          }
          uint64_t v65 = v8;
          float v67 = v90;
          float v66 = v91;
          if ((float)(v57 - v90) < 75.0)
          {
            float v68 = v90 + v90 * -0.2;
            float v67 = v68 >= 0.0 ? v90 + v90 * -0.2 : 0.0;
            float v57 = v57 + v57 * 0.1;
            if (v57 > 255.0) {
              float v57 = 255.0;
            }
          }
          if ((float)(v61 - v91) < 75.0)
          {
            float v69 = v91 + v91 * -0.2;
            if (v69 >= 0.0) {
              float v66 = v91 + v91 * -0.2;
            }
            else {
              float v66 = 0.0;
            }
            float v47 = v61 + v61 * 0.1;
            int v70 = 1132396544;
            if (v47 <= 255.0) {
              goto LABEL_124;
            }
            goto LABEL_123;
          }
          float v47 = v61;
        }
        else
        {
          if ([(VNCCTextDetector *)v81 ii] == 2)
          {
            if ([(VNCCTextDetector *)v81 profileNormal])
            {
              if (var1 > 0x4A)
              {
                float v54 = (float)var1;
                float v63 = v89;
              }
              else
              {
                float v71 = (float)(v60 + v89) + (float)(v60 + v89) * -0.3;
                if (v71 >= 0.0) {
                  float v63 = (float)(v60 + v89) + (float)(v60 + v89) * -0.3;
                }
                else {
                  float v63 = 0.0;
                }
                float v72 = (float)(v45 - v60) + (float)(v45 - v60) * 0.3;
                if (v72 >= 30.0) {
                  float v54 = (float)(v45 - v60) + (float)(v45 - v60) * 0.3;
                }
                else {
                  float v54 = 30.0;
                }
                if (v54 > 75.0) {
                  float v54 = 75.0;
                }
              }
              float v66 = v87;
              float v67 = v88;
              if (var3 > 0x4A)
              {
                float v57 = (float)var3;
              }
              else
              {
                float v73 = (float)(v82 + v88) + (float)(v82 + v88) * -0.3;
                if (v73 >= 0.0) {
                  float v67 = (float)(v82 + v88) + (float)(v82 + v88) * -0.3;
                }
                else {
                  float v67 = 0.0;
                }
                float v74 = (float)(v46 - v82) + (float)(v46 - v82) * 0.3;
                if (v74 >= 30.0) {
                  float v57 = (float)(v46 - v82) + (float)(v46 - v82) * 0.3;
                }
                else {
                  float v57 = 30.0;
                }
                if (v57 > 75.0) {
                  float v57 = 75.0;
                }
              }
              uint64_t v65 = v8;
              if (var5 > 0x4A) {
                goto LABEL_124;
              }
              float v75 = (float)(v62 + v87) + (float)(v62 + v87) * -0.3;
              float v66 = v75 >= 0.0 ? (float)(v62 + v87) + (float)(v62 + v87) * -0.3 : 0.0;
              float v76 = (float)(v47 - v62) + (float)(v47 - v62) * 0.3;
              float v47 = v76 >= 30.0 ? (float)(v47 - v62) + (float)(v47 - v62) * 0.3 : 30.0;
              if (v47 <= 75.0) {
                goto LABEL_124;
              }
              int v70 = 1117126656;
LABEL_123:
              float v47 = *(float *)&v70;
              goto LABEL_124;
            }
            if (var1 <= 0xF5) {
              float v54 = (float)(int)(var1 + 10);
            }
            else {
              float v54 = 255.0;
            }
            if (var3 <= 0xF5) {
              float v57 = (float)(int)(var3 + 10);
            }
            else {
              float v57 = 255.0;
            }
            if (var5 <= 0xF5) {
              float v47 = (float)(int)(var5 + 10);
            }
            else {
              float v47 = 255.0;
            }
          }
          else
          {
            float v54 = (float)var1;
            float v57 = (float)var3;
          }
          uint64_t v65 = v8;
          float v67 = v88;
          float v63 = v89;
          float v66 = v87;
        }
LABEL_124:
        char v15 = 0;
        vImagePixelCount v77 = &a8[v65];
        v77->unsigned int var0 = v63;
        v77->unsigned int var1 = v54;
        v77->unsigned int var2 = v67;
        v77->unsigned int var3 = v57;
        v77->unsigned int var4 = v66;
        v77->unsigned int var5 = v47;
        uint64_t v8 = 1;
        if ((v16 & 1) == 0) {
          goto LABEL_127;
        }
      }
    }
    LODWORD(v8) = 0;
  }
LABEL_127:
  free(v9);
  return v8;
}

- (void)generateDominantPulse:(unint64_t)a3 rowLocationsRef:(unsigned __int16 *)a4 debugOut:(unsigned __int8)a5 bufferHeight:(unsigned __int16)a6 bufferWidth:(unsigned __int16)a7
{
  unsigned int v7 = a6;
  if (a6)
  {
    if (-[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", a3, 0, a5, a6, a7))
    {
      BOOL v11 = 1;
    }
    else
    {
      uint64_t v12 = 1;
      while (v7 != v12)
      {
        unsigned int v13 = [(VNCCCharBoxContext *)self->_charBoxContext checkFlag:a3 atIndex:v12];
        uint64_t v12 = (v12 + 1);
        if (v13)
        {
          unsigned int v14 = v12 - 1;
          goto LABEL_10;
        }
      }
      unsigned int v14 = v7;
LABEL_10:
      BOOL v11 = v14 < v7;
    }
  }
  else
  {
    BOOL v11 = 0;
  }
  unsigned int v15 = [(VNCCTextDetector *)self minHeight];
  unsigned int v16 = [(VNCCTextDetector *)self maxHeight];
  if (!v11)
  {
    LOWORD(v18) = 0;
    unsigned __int16 v19 = 0;
    unsigned __int16 v28 = 0;
    unsigned __int16 v29 = 0;
    goto LABEL_122;
  }
  unsigned int v17 = v16;
  if (v7 != 480)
  {
    if (v7 >= 0x191)
    {
      unsigned __int16 v19 = 0;
      LOWORD(v18) = 0;
      uint64_t v30 = 400;
      unsigned int v31 = 400 - v16;
      do
      {
        unsigned int v32 = [(VNCCCharBoxContext *)self->_charBoxContext checkFlag:a3 atIndex:v30];
        if (v32) {
          BOOL v33 = (unsigned __int16)v18 == 0;
        }
        else {
          BOOL v33 = 0;
        }
        if (v33) {
          LOWORD(v18) = v30;
        }
        if ((_WORD)v18) {
          BOOL v34 = v32 == 0;
        }
        else {
          BOOL v34 = 0;
        }
        if (v34) {
          unsigned __int16 v19 = v30 - 1;
        }
        if ((_WORD)v18) {
          BOOL v35 = v19 == 0;
        }
        else {
          BOOL v35 = 1;
        }
        if (!v35)
        {
          if ((unsigned __int16)v18 <= 0x191u)
          {
            if (v17 <= 0x190)
            {
              uint64_t v38 = 400;
              while ([(VNCCCharBoxContext *)self->_charBoxContext checkFlag:a3 atIndex:v38])
              {
                uint64_t v38 = (v38 - 1);
                if (v38 < v31) {
                  goto LABEL_66;
                }
              }
              int v18 = (unsigned __int16)v38 + 1;
              if ((v18 & 0x10000) == 0) {
                goto LABEL_101;
              }
            }
          }
          else
          {
            unsigned int v36 = v19 - (unsigned __int16)v18;
            if (v36 >= v15 && v36 <= v17) {
              goto LABEL_101;
            }
          }
LABEL_66:
          LOWORD(v18) = 0;
          unsigned __int16 v19 = 0;
        }
        uint64_t v30 = (v30 + 1);
      }
      while (v30 != v7);
    }
    LOWORD(v18) = 0;
    unsigned __int16 v19 = 0;
    goto LABEL_101;
  }
  LOWORD(v18) = 0;
  unsigned __int16 v19 = 0;
  int v20 = 290;
  while (1)
  {
    unsigned int v21 = v20 - 1;
    unsigned int v22 = [(VNCCCharBoxContext *)self->_charBoxContext checkFlag:a3 atIndex:(v20 - 1)];
    if (v22) {
      BOOL v23 = v19 == 0;
    }
    else {
      BOOL v23 = 0;
    }
    if (v23) {
      unsigned __int16 v19 = v20 - 1;
    }
    if (v19) {
      BOOL v24 = v22 == 0;
    }
    else {
      BOOL v24 = 0;
    }
    if (v24) {
      LOWORD(v18) = v20;
    }
    if (v19) {
      BOOL v25 = (unsigned __int16)v18 == 0;
    }
    else {
      BOOL v25 = 1;
    }
    if (v25) {
      goto LABEL_35;
    }
    if (v19 >= 0x121u) {
      break;
    }
    unsigned int v26 = v19 - (unsigned __int16)v18;
    if (v26 >= v15 && v26 <= v17) {
      goto LABEL_101;
    }
    unsigned __int16 v19 = 0;
LABEL_35:
    --v20;
    if (v21 <= 0xF0) {
      goto LABEL_80;
    }
  }
  if (v17 > 0xFFFFFEDE) {
    goto LABEL_80;
  }
  int v39 = -1;
  while (1)
  {
    __int16 v40 = v39 + 290;
    if (![(VNCCCharBoxContext *)self->_charBoxContext checkFlag:a3 atIndex:(v39 + 290)])break; {
    if (v17 == ++v39)
    }
      goto LABEL_80;
  }
  unsigned __int16 v19 = v39 + 289;
  if (v40 == 1 || ((v41 = v19 - (unsigned __int16)v18, v41 >= v15) ? (BOOL v42 = v41 > v17) : (BOOL v42 = 1), v42))
  {
LABEL_80:
    unsigned __int16 v19 = 0;
    LOWORD(v18) = 0;
    uint64_t v43 = 289;
    while (1)
    {
      unsigned int v44 = [(VNCCCharBoxContext *)self->_charBoxContext checkFlag:a3 atIndex:v43];
      if (v44) {
        BOOL v45 = (unsigned __int16)v18 == 0;
      }
      else {
        BOOL v45 = 0;
      }
      if (v45) {
        LOWORD(v18) = v43;
      }
      if (v44) {
        BOOL v46 = 1;
      }
      else {
        BOOL v46 = (unsigned __int16)v18 == 0;
      }
      if (!v46)
      {
        unsigned __int16 v19 = v43 - 1;
        if ((_WORD)v43 == 1)
        {
          unsigned __int16 v19 = 0;
        }
        else
        {
          unsigned int v47 = (unsigned __int16)(v43 - 1) - (unsigned __int16)v18;
          if (v47 >= v15 && v47 <= v17)
          {
LABEL_99:
            if ((unsigned __int16)v18 == 0 || v19 == 0)
            {
              LOWORD(v18) = 0;
              unsigned __int16 v19 = 0;
            }
            break;
          }
          LOWORD(v18) = 0;
        }
      }
      uint64_t v43 = (v43 + 1);
      if (v43 == 480) {
        goto LABEL_99;
      }
    }
  }
LABEL_101:
  unsigned __int16 v49 = 0;
  int v50 = v19 - 1;
  while (v50 + 2 < v7)
  {
    unsigned int v51 = [(VNCCCharBoxContext *)self->_charBoxContext checkFlag:a3 atIndex:(v50 + 2)];
    if (v49) {
      BOOL v52 = 1;
    }
    else {
      BOOL v52 = v51 == 0;
    }
    if (!v52) {
      unsigned __int16 v49 = v50 + 2;
    }
    ++v50;
    if (v51) {
      BOOL v53 = 1;
    }
    else {
      BOOL v53 = v49 == 0;
    }
    if (!v53) {
      goto LABEL_114;
    }
  }
  LOWORD(v50) = 0;
LABEL_114:
  BOOL v54 = v49 == 0;
  if (!(_WORD)v50) {
    BOOL v54 = 1;
  }
  BOOL v55 = !v54;
  if (v54) {
    unsigned __int16 v28 = v18;
  }
  else {
    unsigned __int16 v28 = v49;
  }
  if (v55) {
    unsigned __int16 v29 = v50;
  }
  else {
    unsigned __int16 v29 = v19;
  }
LABEL_122:
  *a4 = v18;
  a4[1] = v19;
  a4[2] = v28;
  a4[3] = v29;
}

- (void)_generatePulseAggregateSmallStubs:(unint64_t)a3 pulseVectorResult:(unint64_t)a4 bufferHeight:(unsigned __int16)a5 bufferWidth:(unsigned __int16)a6
{
  if (a5)
  {
    int v6 = a5;
    uint64_t v10 = 0;
    do
    {
      [(VNCCCharBoxContext *)self->_charBoxContext clearFlag:a4 atIndex:v10];
      uint64_t v10 = (v10 + 1);
    }
    while (v6 != v10);
    if (v6 == 480)
    {
      int v11 = 0;
      int v12 = 0;
      unsigned __int16 v13 = 0;
      int v14 = 0;
      int v15 = 0;
      uint64_t v16 = 1;
      unint64_t v34 = a3;
LABEL_6:
      while (2)
      {
        LODWORD(v33) = v14;
        HIDWORD(v33) = (unsigned __int16)v14 + 57;
        while (1)
        {
          unsigned int v17 = -[VNCCCharBoxContext checkFlag:atIndex:](self->_charBoxContext, "checkFlag:atIndex:", v34, v16, v33);
          unsigned int v18 = [(VNCCCharBoxContext *)self->_charBoxContext checkFlag:v34 atIndex:(v16 - 1)];
          if (v18) {
            BOOL v19 = 1;
          }
          else {
            BOOL v19 = v17 == 0;
          }
          if (v19) {
            int v20 = v12;
          }
          else {
            int v20 = v16;
          }
          uint64_t v21 = (unsigned __int16)v20;
          if (v18) {
            BOOL v22 = v17 == 0;
          }
          else {
            BOOL v22 = 0;
          }
          if (!v22 || (unsigned __int16)v20 == 0) {
            int v24 = v11;
          }
          else {
            int v24 = v16 - 1;
          }
          if ((_WORD)v20) {
            BOOL v25 = (unsigned __int16)v24 == 0;
          }
          else {
            BOOL v25 = 1;
          }
          if (v25) {
            goto LABEL_38;
          }
          if ((unsigned __int16)v24 - (unsigned __int16)v20 >= 19) {
            break;
          }
          if (!v15)
          {
            int v11 = 0;
            int v12 = 0;
            uint64_t v16 = (v16 + 1);
            int v15 = 1;
            unsigned __int16 v13 = v24;
            int v14 = v20;
            if (v16 != 480) {
              goto LABEL_6;
            }
            goto LABEL_56;
          }
          if ((unsigned __int16)v20 - v13 >= 11)
          {
            if ((unsigned __int16)v20 <= (unsigned __int16)v24)
            {
              int v27 = (unsigned __int16)v24 + 1;
              do
              {
                [(VNCCCharBoxContext *)self->_charBoxContext setFlag:a4 atIndex:v21];
                uint64_t v21 = (v21 + 1);
              }
              while (v27 != v21);
            }
            uint64_t v28 = (unsigned __int16)v33;
            if ((unsigned __int16)v33 <= v13)
            {
              do
              {
                [(VNCCCharBoxContext *)self->_charBoxContext setFlag:a4 atIndex:v28];
                uint64_t v28 = (v28 + 1);
              }
              while (v13 + 1 != v28);
            }
LABEL_49:
            int v15 = 0;
            int v14 = 0;
            unsigned __int16 v13 = 0;
            int v20 = 0;
            int v24 = 0;
            goto LABEL_50;
          }
          int v11 = 0;
          int v12 = 0;
          if ((unsigned __int16)v24 < SHIDWORD(v33)) {
            unsigned __int16 v13 = v24;
          }
          uint64_t v16 = (v16 + 1);
          int v15 = 1;
          if (v16 == 480)
          {
            LOWORD(v20) = v33;
            LOWORD(v24) = v13;
LABEL_56:
            uint64_t v31 = (unsigned __int16)v20;
            if ((unsigned __int16)v20 <= (unsigned __int16)v24)
            {
              int v32 = (unsigned __int16)v24 + 1;
              do
              {
                [(VNCCCharBoxContext *)self->_charBoxContext setFlag:a4 atIndex:v31];
                uint64_t v31 = (v31 + 1);
              }
              while (v32 != v31);
            }
            return;
          }
        }
        if ((unsigned __int16)v20 <= (unsigned __int16)v24)
        {
          int v26 = (unsigned __int16)v24 + 1;
          do
          {
            [(VNCCCharBoxContext *)self->_charBoxContext setFlag:a4 atIndex:v21];
            uint64_t v21 = (v21 + 1);
          }
          while (v26 != v21);
        }
        if (v15)
        {
          uint64_t v29 = (unsigned __int16)v33;
          if ((unsigned __int16)v33 <= v13)
          {
            do
            {
              [(VNCCCharBoxContext *)self->_charBoxContext setFlag:a4 atIndex:v29];
              uint64_t v29 = (v29 + 1);
            }
            while (v13 + 1 != v29);
          }
          goto LABEL_49;
        }
        int v20 = 0;
        int v24 = 0;
LABEL_38:
        int v14 = v33;
LABEL_50:
        uint64_t v16 = (v16 + 1);
        int v11 = v24;
        int v12 = v20;
        if (v16 != 480) {
          continue;
        }
        break;
      }
      LOWORD(v20) = v14;
      LOWORD(v24) = v13;
      if (v15) {
        goto LABEL_56;
      }
    }
    else
    {
      uint64_t v30 = 0;
      do
      {
        [(VNCCCharBoxContext *)self->_charBoxContext copyFlagValue:a3 toTarget:a4 atIndex:v30];
        uint64_t v30 = (v30 + 1);
      }
      while (v6 != v30);
    }
  }
}

- (void)_generatePulseAggregate:(unint64_t)a3 pulseVectorMain:(unint64_t)a4 pulseVectorResult:(unint64_t)a5 metricSelection:(unsigned __int8)a6 bufferHeight:(unsigned __int16)a7 bufferWidth:(unsigned __int16)a8
{
  if (a7 == 480)
  {
    uint64_t v12 = 0;
    do
    {
      -[VNCCCharBoxContext copyFlagValue:toTarget:atIndex:](self->_charBoxContext, "copyFlagValue:toTarget:atIndex:", a3, 0x80000, v12, a6);
      uint64_t v12 = (v12 + 1);
    }
    while (v12 != 480);
    unsigned __int16 v13 = 0;
    unsigned __int16 v14 = 0;
    uint64_t v15 = 1;
    do
    {
      unsigned int v16 = [(VNCCCharBoxContext *)self->_charBoxContext checkFlag:a4 atIndex:v15];
      unsigned int v17 = [(VNCCCharBoxContext *)self->_charBoxContext checkFlag:a4 atIndex:(v15 - 1)];
      if (v17) {
        BOOL v18 = 1;
      }
      else {
        BOOL v18 = v16 == 0;
      }
      if (!v18) {
        unsigned __int16 v14 = v15;
      }
      if (v17) {
        BOOL v19 = v16 == 0;
      }
      else {
        BOOL v19 = 0;
      }
      if (v19 && v14 != 0) {
        unsigned __int16 v13 = v15 - 1;
      }
      if (v14) {
        BOOL v21 = v13 == 0;
      }
      else {
        BOOL v21 = 1;
      }
      if (!v21)
      {
        if (v14 <= v13)
        {
          uint64_t v22 = v14;
          do
          {
            [(VNCCCharBoxContext *)self->_charBoxContext clearFlag:0x80000 atIndex:v22];
            uint64_t v22 = (v22 + 1);
          }
          while (v13 + 1 != v22);
        }
        if (v14 >= 2u)
        {
          int v23 = v14 + 1;
          do
          {
            if (![(VNCCCharBoxContext *)self->_charBoxContext checkFlag:0x80000 atIndex:(v23 - 2)])break; {
            [(VNCCCharBoxContext *)self->_charBoxContext clearFlag:0x80000 atIndex:(v23 - 2)];
            }
            --v23;
          }
          while (v23 > 2);
        }
        if (v13 <= 0x1DEu)
        {
          uint64_t v24 = v13 + 1;
          do
          {
            if (![(VNCCCharBoxContext *)self->_charBoxContext checkFlag:0x80000 atIndex:v24]) {
              break;
            }
            [(VNCCCharBoxContext *)self->_charBoxContext clearFlag:0x80000 atIndex:v24];
            uint64_t v24 = (v24 + 1);
          }
          while (v24 != 480);
        }
        unsigned __int16 v14 = 0;
        unsigned __int16 v13 = 0;
      }
      uint64_t v15 = (v15 + 1);
    }
    while (v15 != 480);
    uint64_t v25 = 0;
    unint64_t v26 = a4 | 0x80000;
    do
    {
      [(VNCCCharBoxContext *)self->_charBoxContext copyFlagValue:v26 toTarget:a5 atIndex:v25];
      uint64_t v25 = (v25 + 1);
    }
    while (v25 != 480);
  }
  else
  {
    int v27 = a7;
    if (a6)
    {
      if (a6 == 1 && a7)
      {
        uint64_t v28 = 0;
        do
        {
          [(VNCCCharBoxContext *)self->_charBoxContext copyFlagValue:a4 toTarget:a5 atIndex:v28];
          uint64_t v28 = (v28 + 1);
        }
        while (v27 != v28);
      }
    }
    else if (a7)
    {
      uint64_t v29 = 0;
      unint64_t v30 = a4 | a3;
      do
      {
        [(VNCCCharBoxContext *)self->_charBoxContext copyFlagValue:v30 toTarget:a5 atIndex:v29];
        uint64_t v29 = (v29 + 1);
      }
      while (v27 != v29);
    }
  }
}

- (int)_getFilterResultOut:(float *)a3 defaultRows:(unsigned __int16)a4 bufferHeight:(unsigned __int16)a5 minHeight:(unsigned __int8)a6 maxHeight:(unsigned __int8)a7 startRange:(unsigned __int16)a8 stopRange:(unsigned __int16)a9 startMaxFind:(unsigned int)a10 stopMaxFind:(unsigned int)a11 bytesPerRow:(unsigned __int16)a12 thresholdSet:(ThresholdSet_t)a13 sampleImageAddressRef:(char *)a14 sampleImageFloatAddressRef:(float *)a15 pulseVectorFlag:(unint64_t)a16
{
  unsigned int v16 = a15;
  if (a14) {
    BOOL v17 = a15 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17) {
    goto LABEL_18;
  }
  float var2 = a13.var2;
  float var1 = a13.var1;
  float var0 = a13.var0;
  unsigned int v21 = a8;
  unsigned int v22 = a7;
  unsigned int v23 = a6;
  uint64_t v24 = a5;
  int v25 = a4;
  uint64_t v28 = (const float *)malloc_type_calloc(3 * a5, 4uLL, 0x100004052888210uLL);
  if (!v28)
  {
LABEL_18:
    unsigned int v37 = 0;
    int v38 = 0;
  }
  else
  {
    unsigned int v29 = a10;
    vDSP_Length v30 = v24;
    __dst = (float *)&v28[v24 + v24];
    unsigned int v87 = v23;
    long long v85 = self;
    uint64_t v86 = v24;
    int v83 = (float *)&v28[v24];
    if (v24)
    {
      uint64_t v31 = v28;
      unint64_t v32 = 0;
      vDSP_Length v33 = a9 - (unint64_t)v21;
      float v34 = 0.0;
      do
      {
        __C[0] = 0.0;
        vDSP_sve(v16, 1, __C, v33);
        v31[v32] = __C[0];
        if (__C[0] > v34 && v32 >= a10 - 1 && v32 <= a11 - 1) {
          float v34 = __C[0];
        }
        ++v32;
        v16 += a12;
      }
      while (v30 != v32);
    }
    else
    {
      float v34 = 0.0;
      uint64_t v31 = v28;
    }
    float __B = 1.0 / v34;
    vDSP_vsmul(v31, 1, &__B, v83, 1, v30);
    uint64_t __n = 4 * v30;
    memcpy(__dst, v83, 4 * v30);
    BOOL v42 = v83;
    unsigned int v37 = (float *)v31;
    if (v86 == v25)
    {
      double v40 = 0.0;
      if (a10 < a11)
      {
        uint64_t v43 = (float *)&v31[(int)a10 + (unint64_t)__n / 4];
        float v44 = 0.0;
        do
        {
          float v45 = *v43++;
          float v46 = v45;
          if (v45 > v44) {
            float v44 = v46;
          }
          ++v29;
        }
        while (v29 < a11);
        double v40 = v44;
      }
      if (v86)
      {
        double v41 = 0.0;
        unsigned int v47 = -501;
        float v48 = v83;
        vDSP_Length v49 = v30;
        float v50 = 0.0;
        float v51 = 0.0;
        float v52 = 0.0;
        float v53 = 0.0;
        while (v47 + 401 > 0x64)
        {
          if (v47 + 300 > 0x63)
          {
            if (v47 + 200 > 0x63)
            {
              if (v47 < 0xFFFFFF9C)
              {
                if (v47 > 0x63 || *v48 <= *(float *)&v41) {
                  goto LABEL_44;
                }
                float v54 = v53;
                *(float *)&double v41 = *v48;
              }
              else
              {
                if (*v48 <= v50) {
                  goto LABEL_44;
                }
                float v54 = v53;
                float v50 = *v48;
              }
            }
            else
            {
              if (*v48 <= v51) {
                goto LABEL_44;
              }
              float v54 = v53;
              float v51 = *v48;
            }
          }
          else
          {
            if (*v48 <= v52) {
              goto LABEL_44;
            }
            float v54 = v53;
            float v52 = *v48;
          }
LABEL_45:
          ++v48;
          ++v47;
          float v53 = v54;
          if (!--v49) {
            goto LABEL_48;
          }
        }
        float v54 = *v48;
        if (*v48 > v53) {
          goto LABEL_45;
        }
LABEL_44:
        float v54 = v53;
        goto LABEL_45;
      }
      float v54 = 0.0;
      float v52 = 0.0;
      float v51 = 0.0;
      float v50 = 0.0;
      double v41 = 0.0;
LABEL_48:
      BOOL v55 = 0;
      HIDWORD(v39) = 1070805811;
      if (v52 < 0.3 && v51 < 0.3) {
        BOOL v55 = v50 < 0.3;
      }
      BOOL v56 = v54 < v52;
      BOOL v57 = v54 > v52;
      if (v52 >= v51) {
        BOOL v56 = 0;
      }
      if (v52 <= v51) {
        BOOL v57 = 0;
      }
      if (v51 >= v50) {
        BOOL v56 = 0;
      }
      BOOL v58 = v51 > v50 && v57;
      BOOL v59 = v50 < *(float *)&v41 && v56;
      BOOL v60 = v50 > *(float *)&v41 && v58;
      if (v40 < 0.3 || v55 || v59 || v60)
      {
        float v61 = 0.9 / v40;
        float v62 = 1.0;
        if (v61 >= 1.0) {
          float v63 = v61;
        }
        else {
          float v63 = 1.0;
        }
        float v64 = 0.0;
        double v41 = 0.0;
        float v65 = 0.0;
        float v66 = 0.0;
        float v67 = 0.0;
        double v40 = 0.0;
        if (v86)
        {
          unsigned int v68 = -501;
          float v69 = v83;
          vDSP_Length v70 = v30;
          do
          {
            float v71 = v63 * *v69;
            *float v69 = v71;
            if (v68 + 401 > 0x64)
            {
              if (v68 + 300 > 0x63)
              {
                if (v68 + 200 > 0x63)
                {
                  if (v68 < 0xFFFFFF9C)
                  {
                    if (v71 > *(float *)&v40 && v68 < 0x64) {
                      *(float *)&double v40 = v71;
                    }
                  }
                  else if (v71 > v67)
                  {
                    float v67 = v71;
                  }
                }
                else if (v71 > v66)
                {
                  float v66 = v71;
                }
              }
              else if (v71 > v65)
              {
                float v65 = v71;
              }
            }
            else if (v71 > *(float *)&v41)
            {
              *(float *)&double v41 = v71;
            }
            ++v68;
            ++v69;
            --v70;
          }
          while (v70);
        }
        if (v67 >= *(float *)&v40) {
          float v62 = 0.0;
        }
        if (v66 < v67 && v65 < v66 && *(float *)&v41 < v65) {
          float v64 = v62;
        }
        if (v64 != 0.0 && *(float *)&v41 < 0.3) {
          goto LABEL_118;
        }
        float v75 = 1.0;
        if (v67 <= *(float *)&v40) {
          float v75 = 0.0;
        }
        BOOL v76 = v66 <= v67 || v65 <= v66;
        BOOL v77 = v76 || *(float *)&v41 <= v65;
        float v78 = v77 ? 0.0 : v75;
        if (v78 != 0.0)
        {
          double v40 = *(float *)&v40;
          if (v40 < 0.3)
          {
LABEL_118:
            float v88 = 3.0;
            vDSP_vsmul(v83, 1, &v88, v83, 1, v30);
            BOOL v42 = v83;
          }
        }
        if (v86)
        {
          BOOL v79 = __dst;
          do
          {
            float v80 = *v42++;
            *v79++ = fminf(v80, 1.0);
            --v30;
          }
          while (v30);
        }
      }
    }
    if (a3) {
      memcpy(a3, __dst, __n);
    }
    *(float *)&double v39 = var0;
    *(float *)&double v40 = var1;
    *(float *)&double v41 = var2;
    int v38 = -[VNCCTextDetector generatePulses:minHeight:maxHeight:thresholdSet:prodBoostNormalized:pulseVectorFlag:](v85, "generatePulses:minHeight:maxHeight:thresholdSet:prodBoostNormalized:pulseVectorFlag:", v86, v87, v22, __dst, a16, v39, v40, v41, __n);
  }
  free(v37);
  return v38;
}

- (int)_getFilterResultOutBothSumDeriv:(unsigned __int8)a3 floatVectorResult:(float *)a4 bufferHeight:(unsigned __int16)a5 minHeight:(unsigned __int8)a6 maxHeight:(unsigned __int8)a7 config:(__CCFilterSumDerivConfig *)a8 bytesPerRow:(unsigned __int16)a9 thresholdSet:(ThresholdSet_t)a10 sampleImageAddressRef:(char *)a11
{
  float var0 = a10.var0;
  int v14 = 0;
  v78[0] = 0;
  *(_OWORD *)__C = 0u;
  long long v77 = 0u;
  *(_OWORD *)__A = 0u;
  uint64_t v74 = 0;
  *(_OWORD *)float v72 = 0u;
  long long v73 = 0u;
  *(_OWORD *)float v71 = 0u;
  if (!a5) {
    goto LABEL_64;
  }
  if (!a8) {
    goto LABEL_64;
  }
  uint64_t v15 = a11;
  if (!a11) {
    goto LABEL_64;
  }
  unsigned int v16 = a7;
  unsigned int v17 = a6;
  uint64_t v18 = a5;
  float var2 = a10.var2;
  float var1 = a10.var1;
  unsigned int v22 = a3;
  int v14 = [(VNCCTextDetector *)self _allocateSumDerivVectors:__A size:a5];
  if (v14 != 1) {
    goto LABEL_64;
  }
  BOOL var3 = a8->var3;
  if (a8->var3)
  {
    int v14 = [(VNCCTextDetector *)self _allocateSumDerivVectors:v71 size:v18];
    if (v14 != 1) {
      goto LABEL_64;
    }
    __dst = a4;
    unsigned int v66 = v22;
    unsigned int v67 = v17;
    unsigned int v68 = v16;
    BOOL var3 = a8->var3;
  }
  else
  {
    __dst = a4;
    unsigned int v66 = v22;
    unsigned int v67 = v17;
    unsigned int v68 = v16;
  }
  uint64_t v24 = 0;
  if (v18 <= 1) {
    uint64_t v25 = 1;
  }
  else {
    uint64_t v25 = v18;
  }
  do
  {
    v78[0] = 0;
    if (!var3)
    {
      [(VNCCTextDetector *)self _computeColumnSumsOverRange:a8 sampleImageAddress:v15 rowSumOut:v78 rowDerivOut:(char *)v78 + 4];
      int v30 = v78[0];
      goto LABEL_30;
    }
    uint64_t __B = 0;
    uint64_t v74 = 0;
    int v69 = 0;
    if (!v24)
    {
      int v31 = a8->var1.var1;
      int v27 = a8->var1.var0 + 250;
      int v32 = a8->var0.var1 - 1;
      if (v27 >= v32) {
        LOWORD(v27) = a8->var0.var1 - 1;
      }
      a8->var1.float var0 = v27;
      int v29 = v31 + 250;
      if (v29 >= v32) {
        LOWORD(v29) = v32;
      }
      goto LABEL_24;
    }
    if (v24 == 196)
    {
      int v26 = a8->var1.var1;
      int v27 = a8->var1.var0 - 250;
      int v28 = a8->var0.var0;
      if (v27 <= v28) {
        LOWORD(v27) = a8->var0.var0;
      }
      a8->var1.float var0 = v27;
      int v29 = v26 - 250;
      if (v29 <= v28) {
        LOWORD(v29) = v28;
      }
LABEL_24:
      a8->var1.float var1 = v29;
      goto LABEL_26;
    }
    LOWORD(v27) = a8->var1.var0;
LABEL_26:
    if ((_WORD)v27 && a8->var0.var0 != (unsigned __int16)v27)
    {
      WORD2(__B) = a8->var0.var0;
      HIWORD(__B) = v27 - 1;
      [(VNCCTextDetector *)self _computeColumnSumsOverRange:(char *)&__B + 4 sampleImageAddress:v15 rowSumOut:&__B rowDerivOut:&v69];
      LODWORD(v78[0]) += __B;
      HIDWORD(v78[0]) += v69;
    }
    -[VNCCTextDetector _computeColumnSumsOverRange:sampleImageAddress:rowSumOut:rowDerivOut:](self, "_computeColumnSumsOverRange:sampleImageAddress:rowSumOut:rowDerivOut:", &a8->var1, v15, &__B, &v69, __dst);
    LODWORD(v78[0]) += __B;
    HIDWORD(v78[0]) += v69;
    LODWORD(v74) = v74 + __B;
    HIDWORD(v74) += v69;
    WORD2(__B) = a8->var1.var1 + 1;
    HIWORD(__B) = a8->var0.var1;
    [(VNCCTextDetector *)self _computeColumnSumsOverRange:(char *)&__B + 4 sampleImageAddress:v15 rowSumOut:&__B rowDerivOut:&v69];
    int v30 = LODWORD(v78[0]) + __B;
    LODWORD(v78[0]) += __B;
    HIDWORD(v78[0]) += v69;
LABEL_30:
    vDSP_Length v33 = __A[0];
    __A[0][v24] = (float)v30;
    if (*((float *)&v77 + 2) < (float)v30) {
      *((float *)&v77 + 2) = (float)v30;
    }
    float v34 = (float)SHIDWORD(v78[0]);
    __A[1][v24] = (float)SHIDWORD(v78[0]);
    if (*((float *)&v77 + 3) < v34) {
      *((float *)&v77 + 3) = v34;
    }
    BOOL var3 = a8->var3;
    if (a8->var3)
    {
      float v35 = (float)(int)v74;
      v71[0][v24] = (float)(int)v74;
      if (*((float *)&v73 + 2) < v35) {
        *((float *)&v73 + 2) = v35;
      }
      float v36 = (float)SHIDWORD(v74);
      v71[1][v24] = (float)SHIDWORD(v74);
      if (*((float *)&v73 + 3) < v36) {
        *((float *)&v73 + 3) = v36;
      }
    }
    v15 += a9;
    ++v24;
  }
  while (v25 != v24);
  *((float *)&__B + 1) = 1.0 / *((float *)&v77 + 2);
  vDSP_vsmul(v33, 1, (const float *)&__B + 1, __C[0], 1, v18);
  *(float *)&uint64_t __B = 1.0 / *((float *)&v77 + 3);
  vDSP_vsmul(__A[1], 1, (const float *)&__B, __C[1], 1, v18);
  if (__dst) {
    memcpy(__dst, __C[0], 4 * v18);
  }
  if (a8->var3)
  {
    *((float *)&__B + 1) = 1.0 / *((float *)&v77 + 2);
    vDSP_vsmul(v71[0], 1, (const float *)&__B + 1, v72[0], 1, v18);
    *(float *)&uint64_t __B = 1.0 / *((float *)&v77 + 3);
    vDSP_vsmul(v71[1], 1, (const float *)&__B, v72[1], 1, v18);
  }
  -[VNCCTextDetector _computeProdBoostNormalizedResult:size:binOverride:](self, "_computeProdBoostNormalizedResult:size:binOverride:", __A, v18, v66, __dst);
  if (a8->var3) {
    [(VNCCTextDetector *)self _computeProdBoostNormalizedResult:v71 size:v18 binOverride:v66];
  }
  *(float *)&double v37 = var0;
  *(float *)&double v38 = var1;
  *(float *)&double v39 = var2;
  int v14 = -[VNCCTextDetector generatePulses:minHeight:maxHeight:thresholdSet:prodBoostNormalized:pulseVectorFlag:](self, "generatePulses:minHeight:maxHeight:thresholdSet:prodBoostNormalized:pulseVectorFlag:", v18, v67, v68, (void)v77, a8->var4, v37, v38, v39);
  if (v14 == 1)
  {
    if (!a8->var3
      || (*(float *)&double v40 = var0,
          *(float *)&double v41 = var1,
          *(float *)&double v42 = var2,
          int v14 = -[VNCCTextDetector generatePulses:minHeight:maxHeight:thresholdSet:prodBoostNormalized:pulseVectorFlag:](self, "generatePulses:minHeight:maxHeight:thresholdSet:prodBoostNormalized:pulseVectorFlag:", v18, v67, v68, (void)v73, a8->var5, v40, v41, v42), v14 == 1))
    {
      if (a8->var2)
      {
        uint64_t v43 = (float *)malloc_type_calloc(v18, 4uLL, 0x100004052888210uLL);
        unsigned int v47 = v43;
        if (v43)
        {
          unint64_t v48 = 4 * a8->var4;
          uint64_t v49 = (v18 - 3);
          if (v18 >= 7)
          {
            float v50 = v43 + 3;
            float v51 = (float *)(v77 + 12);
            uint64_t v52 = v49 - 3;
            float v53 = (float *)(v77 + 12);
            do
            {
              float v54 = v53[1];
              ++v53;
              *v50++ = (float)((float)((float)((float)(*(v51 - 2) + *(v51 - 1)) + *v51) + v54) + v51[2]) / 5.0;
              float v51 = v53;
              --v52;
            }
            while (v52);
          }
          *(float *)&double v44 = var0;
          *(float *)&double v45 = var1;
          *(float *)&double v46 = var2;
          int v14 = -[VNCCTextDetector generatePulses:minHeight:maxHeight:thresholdSet:prodBoostNormalized:pulseVectorFlag:](self, "generatePulses:minHeight:maxHeight:thresholdSet:prodBoostNormalized:pulseVectorFlag:", v18, v67, v68, v43, v48, v44, v45, v46);
          if (v14 == 1)
          {
            if (a8->var3)
            {
              unint64_t v58 = 4 * a8->var5;
              if (v18 >= 7)
              {
                BOOL v59 = v47 + 3;
                BOOL v60 = (float *)(v73 + 12);
                uint64_t v61 = v49 - 3;
                float v62 = (float *)(v73 + 12);
                do
                {
                  float v63 = v62[1];
                  ++v62;
                  *v59++ = (float)((float)((float)((float)(*(v60 - 2) + *(v60 - 1)) + *v60) + v63) + v60[2]) / 5.0;
                  BOOL v60 = v62;
                  --v61;
                }
                while (v61);
              }
              *(float *)&double v55 = var0;
              *(float *)&double v56 = var1;
              *(float *)&double v57 = var2;
              int v14 = -[VNCCTextDetector generatePulses:minHeight:maxHeight:thresholdSet:prodBoostNormalized:pulseVectorFlag:](self, "generatePulses:minHeight:maxHeight:thresholdSet:prodBoostNormalized:pulseVectorFlag:", v18, v67, v68, v47, v58, v55, v56, v57);
            }
            else
            {
              int v14 = 1;
            }
          }
        }
        else
        {
          int v14 = 0;
        }
        free(v47);
      }
      else
      {
        int v14 = 1;
      }
    }
  }
LABEL_64:
  -[VNCCTextDetector _freeSumDerivVectors:](self, "_freeSumDerivVectors:", __A, a4);
  if (a8->var3) {
    [(VNCCTextDetector *)self _freeSumDerivVectors:v71];
  }
  return v14;
}

- (void)_computeProdBoostNormalizedResult:(__CCSumDerivVectors *)a3 size:(int)a4 binOverride:(unsigned __int8)a5
{
  if (a5) {
    memcpy(a3->var4, a3->var2, 4 * a4);
  }
  else {
    vDSP_vmul(a3->var2, 1, a3->var3, 1, a3->var4, 1, a4);
  }
  if (a4 == 480)
  {
    int v8 = [(VNCCTextDetector *)self midRow];
    if (v8 >= 460)
    {
      unsigned int var4 = a3->var4;
      double v12 = 0.0;
    }
    else
    {
      unsigned int var4 = a3->var4;
      uint64_t v10 = v8 + 10;
      float v11 = 0.0;
      do
      {
        if (var4[v10] > v11) {
          float v11 = var4[v10];
        }
        ++v10;
      }
      while (v10 != 470);
      double v12 = v11;
    }
    uint64_t v13 = 0;
    float v14 = 0.9 / v12;
    if (v14 < 1.0) {
      float v14 = 1.0;
    }
    __asm { FMOV            V1.4S, #1.0 }
    do
    {
      int8x16_t v20 = *(int8x16_t *)&var4[v13];
      int8x16_t v21 = (int8x16_t)vmulq_n_f32((float32x4_t)v20, v14);
      *(float32x4_t *)&var4[v13] = vaddq_f32((float32x4_t)v21, (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(_Q1, (float32x4_t)v21), v21, v20));
      v13 += 4;
    }
    while (v13 != 480);
  }
}

- (void)_freeSumDerivVectors:(__CCSumDerivVectors *)a3
{
  if (a3)
  {
    free(a3->var0);
    a3->float var0 = 0;
  }
}

- (int)_allocateSumDerivVectors:(__CCSumDerivVectors *)a3 size:(int)a4
{
  if (a3)
  {
    int v6 = (float *)malloc_type_calloc(5 * a4, 4uLL, 0x100004052888210uLL);
    a3->float var0 = v6;
    if (v6)
    {
      unsigned int v7 = &v6[a4];
      int v8 = &v7[a4];
      a3->float var1 = v7;
      a3->float var2 = v8;
      uint8x16_t v9 = &v8[a4];
      a3->BOOL var3 = v9;
      a3->unsigned int var4 = &v9[a4];
      *(void *)&a3->unsigned int var5 = 0;
      *(void *)&a3->unsigned int var7 = 0;
      LODWORD(v6) = 1;
    }
  }
  else
  {
    LODWORD(v6) = 0;
  }
  return (int)v6;
}

- (void)_computeColumnSumsOverRange:(__CCRange *)a3 sampleImageAddress:(char *)a4 rowSumOut:(int *)a5 rowDerivOut:(int *)a6
{
  uint64_t var0 = a3->var0;
  unsigned int v7 = &a4[var0];
  int var1 = a3->var1;
  if (((unint64_t)&a4[var0] & 0xF) != 0)
  {
    int v9 = 0;
    int v10 = 0;
    do
    {
      if ((int)var0 > var1 - 2) {
        break;
      }
      int v11 = a4[var0];
      v9 += v11;
      int v12 = a4[var0 + 2] - v11;
      if (v12 < 0) {
        int v12 = v11 - a4[var0 + 2];
      }
      v10 += v12;
      char v13 = (_BYTE)a4 + 1 + var0++;
    }
    while ((v13 & 0xF) != 0);
    unsigned int v7 = &a4[var0];
  }
  else
  {
    int v10 = 0;
    int v9 = 0;
  }
  int v14 = var1 - var0;
  if (var1 - (int)var0 >= 4127) {
    __assert_rtn("-[VNCCTextDetector _computeColumnSumsOverRange:sampleImageAddress:rowSumOut:rowDerivOut:]", "VNCCTextDetector.mm", 1202, "numNeonIter < 128");
  }
  int v15 = (v14 + 1) >> 5;
  int v16 = v15 - 1;
  int16x8_t v17 = 0uLL;
  if (v14 < 63)
  {
    int16x8_t v22 = 0uLL;
  }
  else
  {
    uint64_t v18 = (int8x16_t *)(v7 + 32);
    int8x16_t v19 = *(int8x16_t *)v7;
    if (v16 <= 1) {
      int v20 = 1;
    }
    else {
      int v20 = v15 - 1;
    }
    uint64_t v21 = 32 * (v20 - 1) + 32;
    int16x8_t v22 = 0uLL;
    do
    {
      int8x16_t v23 = v18[-1];
      int8x16_t v24 = *v18;
      int16x8_t v22 = (int16x8_t)vaddw_u8(vaddw_high_u8((uint16x8_t)vaddq_s16((int16x8_t)vaddw_high_u8(vmovl_u8(*(uint8x8_t *)v19.i8), (uint8x16_t)v19), v22), (uint8x16_t)v23), *(uint8x8_t *)v23.i8);
      uint8x16_t v25 = (uint8x16_t)vextq_s8(v19, v23, 2uLL);
      uint8x16_t v26 = (uint8x16_t)vextq_s8(v23, *v18, 2uLL);
      int16x8_t v17 = (int16x8_t)vabal_high_u8(vabal_high_u8(vabal_u8(vabal_u8((uint16x8_t)v17, *(uint8x8_t *)v25.i8, *(uint8x8_t *)v19.i8), *(uint8x8_t *)v26.i8, *(uint8x8_t *)v23.i8), v25, (uint8x16_t)v19), v26, (uint8x16_t)v23);
      v18 += 2;
      int8x16_t v19 = v24;
      --v20;
    }
    while (v20);
    v7 += v21;
  }
  int v27 = v9 + (unsigned __int16)vaddvq_s16(v22);
  int v28 = v10 + (unsigned __int16)vaddvq_s16(v17);
  if (v15 != 1)
  {
    int v10 = v28;
    int v9 = v27;
  }
  int v29 = var0 + 32 * v16;
  if (v29 <= var1 - 2)
  {
    int v30 = var0 + 32 * v15 - 33;
    do
    {
      int v31 = *v7;
      v9 += v31;
      int v32 = v7[2] - v31;
      if (v32 < 0) {
        int v32 = -v32;
      }
      v10 += v32;
      ++v7;
      ++v30;
    }
    while (v30 < var1 - 2);
    int v29 = var1 - 1;
  }
  else if (v29 > var1)
  {
    goto LABEL_30;
  }
  int v33 = var1 - v29 + 1;
  do
  {
    int v34 = *v7++;
    v9 += v34;
    --v33;
  }
  while (v33);
LABEL_30:
  *a5 = v9;
  *a6 = v10;
}

- (int)generatePulses:(unsigned __int16)a3 minHeight:(unsigned __int8)a4 maxHeight:(unsigned __int8)a5 thresholdSet:(ThresholdSet_t)a6 prodBoostNormalized:(float *)a7 pulseVectorFlag:(unint64_t)a8
{
  int v8 = 0;
  int v9 = 0;
  uint64_t v52 = 0x5C00000000;
  if (a3 && a7)
  {
    float var2 = a6.var2;
    float var1 = a6.var1;
    float var0 = a6.var0;
    uint64_t v15 = a5;
    uint64_t v16 = a4;
    uint64_t v17 = a3;
    int8x16_t v19 = (char *)malloc_type_calloc((11 * a3), 4uLL, 0x100004052888210uLL);
    int v8 = v19;
    if (v19)
    {
      float v51 = v19;
      WORD1(v52) = 11 * v17 - 1;
      do
      {
        *(float *)&double v20 = var0;
        *(float *)&double v21 = var1;
        *(float *)&double v22 = var2;
        -[VNCCTextDetector examinePulseWindow:prodBoostNormalized:pwContext:minHeight:maxHeight:thresholdSet:](self, "examinePulseWindow:prodBoostNormalized:pwContext:minHeight:maxHeight:thresholdSet:", v17, a7, &v51, v16, v15, v20, v21, v22);
        WORD2(v52) -= 10;
      }
      while (SWORD2(v52) > 1);
      BYTE6(v52) = 1;
      WORD1(v52) = v17;
      WORD2(v52) = 2;
      do
      {
        *(float *)&double v20 = var0;
        *(float *)&double v21 = var1;
        *(float *)&double v22 = var2;
        -[VNCCTextDetector examinePulseWindow:prodBoostNormalized:pwContext:minHeight:maxHeight:thresholdSet:](self, "examinePulseWindow:prodBoostNormalized:pwContext:minHeight:maxHeight:thresholdSet:", v17, a7, &v51, v16, v15, v20, v21, v22);
        --WORD2(v52);
      }
      while (SWORD2(v52) > 0);
      unsigned int v23 = (unsigned __int16)v52;
      if ((_WORD)v52)
      {
        unint64_t v24 = 0;
        int v25 = v17 - 3;
        do
        {
          uint8x16_t v26 = &v8[4 * v24];
          uint64_t v27 = *(unsigned __int16 *)v26;
          uint64_t v28 = *((unsigned __int16 *)v26 + 1);
          if (v27 >= 4 && v25 > (int)v28)
          {
            float v30 = a7[*(unsigned __int16 *)v26];
            float v31 = a7[(v27 - 1)];
            if ((float)(v30 - v31) > var2
              || (int v32 = &a7[v27], v33 = v32[1], (float)(v33 - v30) > var2)
              || (float)(v32[2] - v33) > var2)
            {
              int v34 = &a7[v28];
              float v35 = *(v34 - 1);
              if ((float)(*(v34 - 2) - v35) > var2
                || (float v36 = a7[v28], (float)(v35 - v36) > var2)
                || (float)(v36 - a7[v28 + 1]) > var2)
              {
                float v37 = fmaxf(a7[(v27 - 2)], 0.0);
                if (v31 <= v37) {
                  float v31 = v37;
                }
                float v38 = v34[2];
                if (v34[1] > v31) {
                  float v31 = v34[1];
                }
                uint64_t v39 = (v28 - v27);
                if (v38 > v31) {
                  float v31 = v38;
                }
                float v40 = (double)v39 * 0.6;
                float v41 = roundf((float)((float)v39 - roundf(v40)) * 0.5);
                if (v41 < 3.0) {
                  float v41 = 3.0;
                }
                unsigned int v42 = vcvtms_s32_f32(v41 + (float)v27);
                LODWORD(v39) = vcvtps_s32_f32((float)v28 - v41);
                float v43 = 1.0;
                if (v42 <= v39)
                {
                  uint64_t v44 = v39 - v42 + 1;
                  double v45 = &a7[v42];
                  do
                  {
                    float v46 = *v45++;
                    float v47 = v46;
                    if (v46 < v43) {
                      float v43 = v47;
                    }
                    --v44;
                  }
                  while (v44);
                }
                uint64_t v48 = (v27 + 1);
                if ((float)(v43 - v31) > var1 && v48 < v28)
                {
                  do
                  {
                    -[VNCCCharBoxContext setFlag:atIndex:](self->_charBoxContext, "setFlag:atIndex:", a8, v48, v51);
                    uint64_t v48 = (v48 + 1);
                  }
                  while (v28 != v48);
                  unsigned int v23 = (unsigned __int16)v52;
                }
              }
            }
          }
          ++v24;
        }
        while (v24 < v23);
      }
      int v9 = 1;
    }
    else
    {
      int v9 = 0;
    }
  }
  free(v8);
  return v9;
}

- (void)examinePulseWindow:(unsigned __int16)a3 prodBoostNormalized:(float *)a4 pwContext:(__CCPulseWindowContext *)a5 minHeight:(unsigned __int8)a6 maxHeight:(unsigned __int8)a7 thresholdSet:(ThresholdSet_t)a8
{
  double v8 = dbl_1A410C420[!a5->var4];
  double v9 = (double)a5->var3 / 100.0;
  float v10 = v9 - v8;
  if (v10 < 0.0) {
    float v10 = 0.0;
  }
  if (a3 >= 3u)
  {
    int v11 = 0;
    int v12 = 0;
    float v13 = v8 + v9;
    unint64_t v14 = (a3 - 1);
    uint64_t v15 = &a4[a6 + 1];
    uint64_t v16 = 1;
    uint64_t v17 = a6;
    do
    {
      float v18 = a4[v16];
      if (v18 >= v10)
      {
        BOOL v20 = v18 == v13;
        BOOL v19 = v18 >= v13;
      }
      else
      {
        BOOL v19 = 1;
        BOOL v20 = 0;
      }
      if (!v20 && v19)
      {
        if (v11 >= 1)
        {
          int v21 = v16 + a7;
          if (v16 + (unint64_t)a7 >= v14) {
            int v21 = a3 - 2;
          }
          if (v16 + a6 > v21) {
            goto LABEL_24;
          }
          float v22 = 0.0;
          unsigned int v23 = v15;
          uint64_t v24 = v17;
          do
          {
            if ((float)(v23[1] - *(v23 - 1)) < -0.001)
            {
              float v22 = (float)(v24 + 1);
              if (*v23 <= a4[v11]) {
                break;
              }
            }
            ++v24;
            ++v23;
          }
          while (v24 < v21);
          if (v22 == 0.0)
          {
LABEL_24:
            int v12 = 0;
            int v11 = 0;
          }
          else
          {
            int v12 = (int)v22;
          }
        }
      }
      else if ((float)(a4[v16 + 1] - a4[v16 - 1]) <= 0.0)
      {
        if (v11) {
          int v12 = v16;
        }
      }
      else
      {
        int v11 = v16;
      }
      if (v12 - v11 >= a6 && v12 - v11 <= a7)
      {
        float v25 = 0.0;
        if (v12 >= v11)
        {
          int v26 = v12 - v11 + 1;
          uint64_t v27 = &a4[v11];
          do
          {
            float v28 = *v27++;
            float v29 = v28;
            if (v28 > v25) {
              float v25 = v29;
            }
            --v26;
          }
          while (v26);
        }
        if ((float)(v25 - a4[v11]) <= a8.var0
          || (float)(v25 - a4[v12]) <= a8.var0
          || (float var0 = a5->var0, var0->float var0 = v11, var0->var1 = v12, var1 = a5->var1, var1 >= a5->var2))
        {
          int v12 = 0;
          int v11 = 0;
        }
        else
        {
          int v12 = 0;
          int v11 = 0;
          a5->unsigned int var1 = var1 + 1;
          a5->float var0 = var0 + 1;
        }
      }
      ++v17;
      ++v16;
      ++v15;
    }
    while (v16 != v14);
  }
}

- (int)_generateVotingImage:(vImage_Buffer *)a3 votingImage:(vImage_Buffer *)a4 useLowLightEnhancement:(char *)a5
{
  vImagePixelCount v9 = (a3->height - 81) / 0x50;
  if ((unsigned __int16)v9 <= 0xAuLL) {
    unsigned __int16 v10 = v9;
  }
  else {
    unsigned __int16 v10 = 10;
  }
  if ((((a3->width - 81) / 0x50) & 0xFFF0) != 0) {
    unsigned __int16 v11 = 15;
  }
  else {
    unsigned __int16 v11 = (a3->width - 81) / 0x50;
  }
  uint64_t v12 = v10;
  int v13 = v11 * v10;
  unint64_t v14 = malloc_type_calloc(v13, 4uLL, 0x100004052888210uLL);
  uint64_t v16 = v14;
  if (v14)
  {
    if (v12)
    {
      int v17 = 0;
      size_t rowBytes = a3->rowBytes;
      BOOL v19 = (char *)a3->data + 79 * rowBytes;
      uint64_t v20 = 80 * rowBytes;
      double v21 = 0.0;
      float v22 = v14;
      double v23 = 0.0;
      float v24 = 0.0;
      do
      {
        if (v11)
        {
          uint64_t v25 = 0;
          do
          {
            v22[2] = v19[v25 + 316];
            v22[1] = v19[v25 + 317];
            unsigned char *v22 = v19[v25 + 318];
            v22[3] = v19[v25 + 319];
            LOBYTE(v15) = v19[v25 + 318];
            *(float *)&unsigned int v26 = (float)LODWORD(v15);
            *(float *)&double v21 = *(float *)&v21 + *(float *)&v26;
            LOBYTE(v26) = v19[v25 + 317];
            *(float *)&unsigned int v27 = (float)v26;
            *(float *)&double v23 = *(float *)&v23 + *(float *)&v27;
            LOBYTE(v27) = v19[v25 + 316];
            float v15 = (float)v27;
            float v24 = v24 + v15;
            v22 += 4;
            v25 += 320;
          }
          while (320 * v11 != v25);
        }
        v19 += v20;
        ++v17;
      }
      while (v17 != v12);
    }
    else
    {
      int v13 = 0;
      float v24 = 0.0;
      double v23 = 0.0;
      double v21 = 0.0;
    }
    float v28 = (float)v13;
    float v29 = v24 / (float)v13;
    if (v29 < 100.0
      && ((*(float *)&double v23 = *(float *)&v23 / v28,
           BOOL v30 = (float)((float)(*(float *)&v21 / v28) * 3.0) < v29,
           LODWORD(v21) = 1117782016,
           v30)
        ? (BOOL v30 = *(float *)&v23 < 80.0)
        : (BOOL v30 = 0),
          v30))
    {
      char v31 = 1;
      *a5 = 1;
      int v61 = [(VNCCTextDetector *)self midRow];
      vImagePixelCount height = a3->height;
      if (height > v61)
      {
        vImagePixelCount v63 = v61;
        float v64 = (char *)a4->data + a4->rowBytes * v61;
        vImagePixelCount width = a3->width;
        size_t v66 = a3->rowBytes;
        unsigned int v67 = (char *)a3->data + v66 * v61;
        do
        {
          if (width)
          {
            vImagePixelCount v68 = 0;
            int v69 = v67 + 2;
            do
            {
              char v70 = *v69;
              v69 += 4;
              v64[v68++] = v70;
              vImagePixelCount width = a3->width;
            }
            while (width > v68);
            v64 += v68;
            size_t v66 = a3->rowBytes;
            vImagePixelCount height = a3->height;
          }
          v67 += v66;
          ++v63;
        }
        while (height > v63);
        char v31 = 1;
      }
    }
    else
    {
      char v31 = 0;
    }
    if ([(VNCCTextDetector *)self debugOut])
    {
      int v32 = [(VNCCTextDetector *)self debugFilename];
      float v33 = [v32 stringByAppendingPathComponent:@"creditCardSubsampleImage.png"];

      id v34 = v33;
      float v35 = (const char *)[v34 UTF8String];
      v36.i64[0] = v11;
      v36.i64[1] = v12;
      uint64_t v77 = 0;
      uint64_t v76 = 2;
      int8x16_t v74 = v36;
      long long v73 = v16;
      uint64_t v75 = 4 * v11;
      saveImage(v35, (uint64_t)&v73);
    }
    if ((v31 & 1) == 0)
    {
      uint64_t v37 = [(VNCCTextDetector *)self midRow];
      vImagePixelCount v39 = a3->width;
      size_t v38 = a3->rowBytes;
      data = (char *)a4->data;
      size_t v41 = a4->rowBytes;
      vImagePixelCount v42 = a3->height - v37;
      VNMetalInterface = self->_VNMetalInterface;
      v72[0] = (char *)a3->data + v38 * v37;
      v72[1] = v42;
      _OWORD v72[2] = v39;
      v72[3] = v38;
      uint64_t v44 = [VNMetalInterface textureWithPixelData:v72 format:73];
      double v45 = [self->_VNMetalInterface textureWithWidth:a4->width height:a4->height - v37 format:13 usage:2];
      [self->_VNMetalInterface performVotingImage:v44 outputTex:v45 subBuffer:v16];
      memset(v71, 0, 24);
      vImagePixelCount v46 = a4->height - v37;
      size_t v47 = a4->rowBytes;
      v71[3] = a4->width;
      v71[4] = v46;
      v71[5] = 1;
      [v45 getBytes:&data[v41 * v37] bytesPerRow:v47 fromRegion:v71 mipmapLevel:0];
      if ([(VNCCTextDetector *)self debugOut])
      {
        uint64_t v48 = [(VNCCTextDetector *)self debugFilename];
        uint64_t v49 = [v48 stringByAppendingPathComponent:@"inverseVotingImage.png"];

        id v50 = v49;
        float v51 = (const char *)[v50 UTF8String];
        uint64_t v52 = a4->data;
        int8x16_t v53 = *(int8x16_t *)&a4->height;
        size_t v54 = a4->rowBytes;
        uint64_t v77 = 0;
        uint64_t v76 = 1;
        int8x16_t v74 = vextq_s8(v53, v53, 8uLL);
        long long v73 = v52;
        uint64_t v75 = v54;
        saveY(v51, (uint64_t)&v73);
      }
    }
    if ([(VNCCTextDetector *)self debugOut])
    {
      id v55 = [@"/var/mobile/Media/DCIM/ccOutDebug/" stringByAppendingPathComponent:@"inverseVotingImage.png"];
      double v56 = (const char *)[v55 UTF8String];
      double v57 = a4->data;
      int8x16_t v58 = *(int8x16_t *)&a4->height;
      size_t v59 = a4->rowBytes;
      uint64_t v77 = 0;
      uint64_t v76 = 1;
      int8x16_t v74 = vextq_s8(v58, v58, 8uLL);
      long long v73 = v57;
      uint64_t v75 = v59;
      saveY(v56, (uint64_t)&v73);
    }
  }
  free(v16);
  return v16 != 0;
}

- (void)_freeVImage:(vImage_Buffer *)a3
{
  if (a3)
  {
    free(a3->data);
    *(_OWORD *)&a3->data = 0u;
    *(_OWORD *)&a3->vImagePixelCount width = 0u;
  }
}

- (int)_allocateVImageWithWidth:(unint64_t)a3 height:(unint64_t)a4 rowBytes:(unint64_t)a5 imageOut:(vImage_Buffer *)a6
{
  if (a6)
  {
    unint64_t v8 = a5 * a4;
    if (a5 * a4)
    {
      unint64_t v8 = (unint64_t)malloc_type_calloc(v8, 1uLL, 0x100004077774924uLL);
      a6->data = (void *)v8;
      if (v8)
      {
        a6->vImagePixelCount height = a4;
        a6->vImagePixelCount width = a3;
        LODWORD(v8) = 1;
        a6->size_t rowBytes = a5;
      }
      else
      {
        a6->vImagePixelCount height = 0;
        a6->vImagePixelCount width = 0;
        a6->size_t rowBytes = 0;
      }
    }
  }
  else
  {
    LODWORD(v8) = 0;
  }
  return v8;
}

- (void)initializeForImage:(vImage_Buffer *)a3
{
  [(VNCCTextDetector *)self setComputeZCVectorHighProbability:1];
  if (a3->height == 480) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 370;
  }
  if (a3->height == 480) {
    uint64_t v6 = 57;
  }
  else {
    uint64_t v6 = 45;
  }
  if (a3->height == 480) {
    uint64_t v7 = 10;
  }
  else {
    uint64_t v7 = 1;
  }
  if (a3->height == 480) {
    uint64_t v8 = 600;
  }
  else {
    uint64_t v8 = 480;
  }
  if (a3->height == 480) {
    float v9 = 54.05;
  }
  else {
    float v9 = 85.685;
  }
  if (a3->height == 480) {
    float v10 = 85.685;
  }
  else {
    float v10 = 54.05;
  }
  if (a3->height == 480) {
    uint64_t v11 = 480;
  }
  else {
    uint64_t v11 = 767;
  }
  if (a3->height == 480) {
    uint64_t v12 = 767;
  }
  else {
    uint64_t v12 = 480;
  }
  if (a3->height == 480) {
    uint64_t v13 = 40;
  }
  else {
    uint64_t v13 = 30;
  }
  if (a3->height == 480) {
    uint64_t v14 = 767;
  }
  else {
    uint64_t v14 = 479;
  }
  if (a3->height == 480) {
    uint64_t v15 = 25;
  }
  else {
    uint64_t v15 = 0;
  }
  if (a3->height == 480) {
    uint64_t v16 = 499;
  }
  else {
    uint64_t v16 = 329;
  }
  [(VNCCTextDetector *)self setMidRow:v5];
  [(VNCCTextDetector *)self setMinHeight:11];
  [(VNCCTextDetector *)self setMaxHeight:v6];
  [(VNCCTextDetector *)self setStartMaxFind:v7];
  [(VNCCTextDetector *)self setStopMaxFind:v8];
  *(float *)&double v17 = v9;
  [(VNCCTextDetector *)self setMmHeightCard:v17];
  *(float *)&double v18 = v10;
  [(VNCCTextDetector *)self setMmWidthCard:v18];
  [(VNCCTextDetector *)self setPixelHeightCard:v11];
  [(VNCCTextDetector *)self setPixelWidthCard:v12];
  [(VNCCTextDetector *)self setMinBoxWidth:7];
  [(VNCCTextDetector *)self setMaxBoxWidth:v13];
  [(VNCCTextDetector *)self setStartNormal:0];
  [(VNCCTextDetector *)self setStopNormal:v14];
  [(VNCCTextDetector *)self setStartSensitized:v15];

  [(VNCCTextDetector *)self setStopSensitized:v16];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)VNCCTextDetector;
  [(VNCCTextDetector *)&v2 dealloc];
}

- (VNCCTextDetector)initWithOptions:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VNCCTextDetector;
  uint64_t v5 = [(VNCCTextDetector *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"VNCCTextDetector_EnableDebug"];
    if ([v6 BOOLValue])
    {
      uint64_t v7 = [v4 objectForKeyedSubscript:@"VNCCTextDetector_DebugPathname"];
      if ([v7 length])
      {
        [v5 setDebugOut:1];
        [v5 setDebugFilename:v7];
        uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
        char v16 = 0;
        char v9 = [v8 fileExistsAtPath:v7 isDirectory:&v16];
        if (v16) {
          char v10 = v9;
        }
        else {
          char v10 = 0;
        }
        if ((v10 & 1) == 0
          && ([v8 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:0] & 1) == 0)
        {
          [v5 setDebugOut:0];
          [v5 setDebugFilename:0];
        }
      }
    }
    uint64_t v11 = objc_alloc_init(VNCCCharBoxContext);
    uint64_t v12 = (void *)*((void *)v5 + 12);
    *((void *)v5 + 12) = v11;

    *(_WORD *)(v5 + 25) = 257;
    *((_DWORD *)v5 + 2) = 0;
    uint64_t v13 = objc_alloc_init(VNMetalInterface);
    uint64_t v14 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v13;
  }
  return (VNCCTextDetector *)v5;
}

@end