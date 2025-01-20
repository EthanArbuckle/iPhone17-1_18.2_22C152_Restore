@interface MPSGraph
+ (MPSGraph)new;
- (BOOL)pruneGraph;
- (MPSGraph)init;
- (MPSGraphExecutable)compileWithDevice:(MPSGraphDevice *)device feeds:(MPSGraphTensorShapedTypeDictionary *)feeds targetTensors:(NSArray *)targetTensors targetOperations:(NSArray *)targetOperations compilationDescriptor:(MPSGraphCompilationDescriptor *)compilationDescriptor;
- (MPSGraphOperation)applyStochasticGradientDescentWithLearningRateTensor:(MPSGraphTensor *)learningRateTensor variable:(MPSGraphVariableOp *)variable gradientTensor:(MPSGraphTensor *)gradientTensor name:(NSString *)name;
- (MPSGraphOperation)assignVariable:(MPSGraphTensor *)variable withValueOfTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphOptions)options;
- (MPSGraphTensor)HammingDistanceWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor resultDataType:(MPSDataType)resultDataType name:(NSString *)name;
- (MPSGraphTensor)HermiteanToRealFFTWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes descriptor:(MPSGraphFFTDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)HermiteanToRealFFTWithTensor:(MPSGraphTensor *)tensor axesTensor:(MPSGraphTensor *)axesTensor descriptor:(MPSGraphFFTDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)L2NormPooling4DGradientWithGradientTensor:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling4DOpDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)L2NormPooling4DWithSourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling4DOpDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)absoluteSquareWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)absoluteWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)acosWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)acoshWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)additionWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)argSortWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis descending:(BOOL)descending name:(NSString *)name;
- (MPSGraphTensor)argSortWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name;
- (MPSGraphTensor)argSortWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor descending:(BOOL)descending name:(NSString *)name;
- (MPSGraphTensor)argSortWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor name:(NSString *)name;
- (MPSGraphTensor)asinWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)asinhWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)atan2WithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)atanWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)atanhWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)avgPooling2DGradientWithGradientTensor:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling2DOpDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)avgPooling2DWithSourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling2DOpDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)avgPooling4DGradientWithGradientTensor:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling4DOpDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)avgPooling4DWithSourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling4DOpDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)bandPartWithTensor:(MPSGraphTensor *)inputTensor numLower:(NSInteger)numLower numUpper:(NSInteger)numUpper name:(NSString *)name;
- (MPSGraphTensor)bandPartWithTensor:(MPSGraphTensor *)inputTensor numLowerTensor:(MPSGraphTensor *)numLowerTensor numUpperTensor:(MPSGraphTensor *)numUpperTensor name:(NSString *)name;
- (MPSGraphTensor)batchToSpaceTensor:(MPSGraphTensor *)tensor spatialAxes:(NSArray *)spatialAxes batchAxis:(NSInteger)batchAxis blockDimensions:(NSArray *)blockDimensions usePixelShuffleOrder:(BOOL)usePixelShuffleOrder name:(NSString *)name;
- (MPSGraphTensor)batchToSpaceTensor:(MPSGraphTensor *)tensor spatialAxesTensor:(MPSGraphTensor *)spatialAxesTensor batchAxisTensor:(MPSGraphTensor *)batchAxisTensor blockDimensionsTensor:(MPSGraphTensor *)blockDimensionsTensor usePixelShuffleOrder:(BOOL)usePixelShuffleOrder name:(NSString *)name;
- (MPSGraphTensor)bitwiseANDWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)bitwiseLeftShiftWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)bitwiseNOTWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)bitwiseORWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)bitwisePopulationCountWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)bitwiseRightShiftWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)bitwiseXORWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)bottomKWithGradientTensor:(MPSGraphTensor *)gradient source:(MPSGraphTensor *)source axis:(NSInteger)axis k:(NSUInteger)k name:(NSString *)name;
- (MPSGraphTensor)bottomKWithGradientTensor:(MPSGraphTensor *)gradient source:(MPSGraphTensor *)source axisTensor:(MPSGraphTensor *)axisTensor kTensor:(MPSGraphTensor *)kTensor name:(NSString *)name;
- (MPSGraphTensor)broadcastTensor:(MPSGraphTensor *)tensor toShape:(MPSShape *)shape name:(NSString *)name;
- (MPSGraphTensor)broadcastTensor:(MPSGraphTensor *)tensor toShapeTensor:(MPSGraphTensor *)shapeTensor name:(NSString *)name;
- (MPSGraphTensor)castTensor:(MPSGraphTensor *)tensor toType:(MPSDataType)type name:(NSString *)name;
- (MPSGraphTensor)ceilWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)clampWithTensor:(MPSGraphTensor *)tensor minValueTensor:(MPSGraphTensor *)minValueTensor maxValueTensor:(MPSGraphTensor *)maxValueTensor name:(NSString *)name;
- (MPSGraphTensor)colToImWithSourceTensor:(MPSGraphTensor *)source outputShape:(MPSShape *)outputShape descriptor:(MPSGraphImToColOpDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)complexTensorWithRealTensor:(MPSGraphTensor *)realTensor imaginaryTensor:(MPSGraphTensor *)imaginaryTensor name:(NSString *)name;
- (MPSGraphTensor)concatTensor:(MPSGraphTensor *)tensor withTensor:(MPSGraphTensor *)tensor2 dimension:(NSInteger)dimensionIndex name:(NSString *)name;
- (MPSGraphTensor)concatTensors:(NSArray *)tensors dimension:(NSInteger)dimensionIndex interleave:(BOOL)interleave name:(NSString *)name;
- (MPSGraphTensor)concatTensors:(NSArray *)tensors dimension:(NSInteger)dimensionIndex name:(NSString *)name;
- (MPSGraphTensor)conjugateWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)constantWithData:(NSData *)data shape:(MPSShape *)shape dataType:(MPSDataType)dataType;
- (MPSGraphTensor)constantWithRealPart:(double)realPart imaginaryPart:(double)imaginaryPart;
- (MPSGraphTensor)constantWithRealPart:(double)realPart imaginaryPart:(double)imaginaryPart dataType:(MPSDataType)dataType;
- (MPSGraphTensor)constantWithRealPart:(double)realPart imaginaryPart:(double)imaginaryPart shape:(MPSShape *)shape dataType:(MPSDataType)dataType;
- (MPSGraphTensor)constantWithScalar:(double)scalar dataType:(MPSDataType)dataType;
- (MPSGraphTensor)constantWithScalar:(double)scalar shape:(MPSShape *)shape dataType:(MPSDataType)dataType;
- (MPSGraphTensor)convolution2DDataGradientWithIncomingGradientTensor:(MPSGraphTensor *)gradient weightsTensor:(MPSGraphTensor *)weights outputShapeTensor:(MPSGraphTensor *)outputShapeTensor forwardConvolutionDescriptor:(MPSGraphConvolution2DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name;
- (MPSGraphTensor)convolution2DDataGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradient weightsTensor:(MPSGraphTensor *)weights outputShape:(MPSShape *)outputShape forwardConvolutionDescriptor:(MPSGraphConvolution2DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name;
- (MPSGraphTensor)convolution2DWeightsGradientWithIncomingGradientTensor:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source outputShapeTensor:(MPSGraphTensor *)outputShapeTensor forwardConvolutionDescriptor:(MPSGraphConvolution2DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name;
- (MPSGraphTensor)convolution2DWeightsGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradient sourceTensor:(MPSGraphTensor *)source outputShape:(MPSShape *)outputShape forwardConvolutionDescriptor:(MPSGraphConvolution2DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name;
- (MPSGraphTensor)convolution2DWithSourceTensor:(MPSGraphTensor *)source weightsTensor:(MPSGraphTensor *)weights descriptor:(MPSGraphConvolution2DOpDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)convolution3DDataGradientWithIncomingGradientTensor:(MPSGraphTensor *)gradient weightsTensor:(MPSGraphTensor *)weights outputShapeTensor:(MPSGraphTensor *)outputShapeTensor forwardConvolutionDescriptor:(MPSGraphConvolution3DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name;
- (MPSGraphTensor)convolution3DDataGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradient weightsTensor:(MPSGraphTensor *)weights outputShape:(MPSShape *)outputShape forwardConvolutionDescriptor:(MPSGraphConvolution3DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name;
- (MPSGraphTensor)convolution3DWeightsGradientWithIncomingGradientTensor:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source outputShapeTensor:(MPSGraphTensor *)outputShapeTensor forwardConvolutionDescriptor:(MPSGraphConvolution3DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name;
- (MPSGraphTensor)convolution3DWeightsGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradient sourceTensor:(MPSGraphTensor *)source outputShape:(MPSShape *)outputShape forwardConvolutionDescriptor:(MPSGraphConvolution3DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name;
- (MPSGraphTensor)convolution3DWithSourceTensor:(MPSGraphTensor *)source weightsTensor:(MPSGraphTensor *)weights descriptor:(MPSGraphConvolution3DOpDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)convolutionTranspose2DDataGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradient weightsTensor:(MPSGraphTensor *)weights outputShape:(MPSShape *)outputShape forwardConvolutionDescriptor:(MPSGraphConvolution2DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name;
- (MPSGraphTensor)convolutionTranspose2DDataGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradient weightsTensor:(MPSGraphTensor *)weights outputShapeTensor:(MPSGraphTensor *)outputShape forwardConvolutionDescriptor:(MPSGraphConvolution2DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name;
- (MPSGraphTensor)convolutionTranspose2DWeightsGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradientTensor sourceTensor:(MPSGraphTensor *)source outputShape:(MPSShape *)outputShape forwardConvolutionDescriptor:(MPSGraphConvolution2DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name;
- (MPSGraphTensor)convolutionTranspose2DWeightsGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradientTensor sourceTensor:(MPSGraphTensor *)source outputShapeTensor:(MPSGraphTensor *)outputShape forwardConvolutionDescriptor:(MPSGraphConvolution2DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name;
- (MPSGraphTensor)convolutionTranspose2DWithSourceTensor:(MPSGraphTensor *)source weightsTensor:(MPSGraphTensor *)weights outputShape:(MPSShape *)outputShape descriptor:(MPSGraphConvolution2DOpDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)convolutionTranspose2DWithSourceTensor:(MPSGraphTensor *)source weightsTensor:(MPSGraphTensor *)weights outputShapeTensor:(MPSGraphTensor *)outputShape descriptor:(MPSGraphConvolution2DOpDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)coordinateAlongAxis:(NSInteger)axis withShape:(MPSShape *)shape name:(NSString *)name;
- (MPSGraphTensor)coordinateAlongAxis:(NSInteger)axis withShapeTensor:(MPSGraphTensor *)shapeTensor name:(NSString *)name;
- (MPSGraphTensor)coordinateAlongAxisTensor:(MPSGraphTensor *)axisTensor withShape:(MPSShape *)shape name:(NSString *)name;
- (MPSGraphTensor)coordinateAlongAxisTensor:(MPSGraphTensor *)axisTensor withShapeTensor:(MPSGraphTensor *)shapeTensor name:(NSString *)name;
- (MPSGraphTensor)cosWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)coshWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)cumulativeMaximumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis exclusive:(BOOL)exclusive reverse:(BOOL)reverse name:(NSString *)name;
- (MPSGraphTensor)cumulativeMaximumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name;
- (MPSGraphTensor)cumulativeMaximumWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor exclusive:(BOOL)exclusive reverse:(BOOL)reverse name:(NSString *)name;
- (MPSGraphTensor)cumulativeMaximumWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor name:(NSString *)name;
- (MPSGraphTensor)cumulativeMinimumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis exclusive:(BOOL)exclusive reverse:(BOOL)reverse name:(NSString *)name;
- (MPSGraphTensor)cumulativeMinimumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name;
- (MPSGraphTensor)cumulativeMinimumWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor exclusive:(BOOL)exclusive reverse:(BOOL)reverse name:(NSString *)name;
- (MPSGraphTensor)cumulativeMinimumWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor name:(NSString *)name;
- (MPSGraphTensor)cumulativeProductWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis exclusive:(BOOL)exclusive reverse:(BOOL)reverse name:(NSString *)name;
- (MPSGraphTensor)cumulativeProductWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name;
- (MPSGraphTensor)cumulativeProductWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor exclusive:(BOOL)exclusive reverse:(BOOL)reverse name:(NSString *)name;
- (MPSGraphTensor)cumulativeProductWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor name:(NSString *)name;
- (MPSGraphTensor)cumulativeSumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis exclusive:(BOOL)exclusive reverse:(BOOL)reverse name:(NSString *)name;
- (MPSGraphTensor)cumulativeSumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name;
- (MPSGraphTensor)cumulativeSumWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor exclusive:(BOOL)exclusive reverse:(BOOL)reverse name:(NSString *)name;
- (MPSGraphTensor)cumulativeSumWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor name:(NSString *)name;
- (MPSGraphTensor)depthToSpace2DTensor:(MPSGraphTensor *)tensor widthAxis:(NSUInteger)widthAxis heightAxis:(NSUInteger)heightAxis depthAxis:(NSUInteger)depthAxis blockSize:(NSUInteger)blockSize usePixelShuffleOrder:(BOOL)usePixelShuffleOrder name:(NSString *)name;
- (MPSGraphTensor)depthToSpace2DTensor:(MPSGraphTensor *)tensor widthAxisTensor:(MPSGraphTensor *)widthAxisTensor heightAxisTensor:(MPSGraphTensor *)heightAxisTensor depthAxisTensor:(MPSGraphTensor *)depthAxisTensor blockSize:(NSUInteger)blockSize usePixelShuffleOrder:(BOOL)usePixelShuffleOrder name:(NSString *)name;
- (MPSGraphTensor)depthwiseConvolution2DDataGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradient weightsTensor:(MPSGraphTensor *)weights outputShape:(MPSShape *)outputShape descriptor:(MPSGraphDepthwiseConvolution2DOpDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)depthwiseConvolution2DWeightsGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradient sourceTensor:(MPSGraphTensor *)source outputShape:(MPSShape *)outputShape descriptor:(MPSGraphDepthwiseConvolution2DOpDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)depthwiseConvolution2DWithSourceTensor:(MPSGraphTensor *)source weightsTensor:(MPSGraphTensor *)weights descriptor:(MPSGraphDepthwiseConvolution2DOpDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)depthwiseConvolution3DDataGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradient weightsTensor:(MPSGraphTensor *)weights outputShape:(MPSShape *)outputShape descriptor:(MPSGraphDepthwiseConvolution3DOpDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)depthwiseConvolution3DWeightsGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradient sourceTensor:(MPSGraphTensor *)source outputShape:(MPSShape *)outputShape descriptor:(MPSGraphDepthwiseConvolution3DOpDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)depthwiseConvolution3DWithSourceTensor:(MPSGraphTensor *)source weightsTensor:(MPSGraphTensor *)weights descriptor:(MPSGraphDepthwiseConvolution3DOpDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)dequantizeTensor:(MPSGraphTensor *)tensor scale:(double)scale zeroPoint:(double)zeroPoint dataType:(MPSDataType)dataType name:(NSString *)name;
- (MPSGraphTensor)dequantizeTensor:(MPSGraphTensor *)tensor scaleTensor:(MPSGraphTensor *)scaleTensor zeroPoint:(double)zeroPoint dataType:(MPSDataType)dataType axis:(NSInteger)axis name:(NSString *)name;
- (MPSGraphTensor)dequantizeTensor:(MPSGraphTensor *)tensor scaleTensor:(MPSGraphTensor *)scaleTensor zeroPointTensor:(MPSGraphTensor *)zeroPointTensor dataType:(MPSDataType)dataType axis:(NSInteger)axis name:(NSString *)name;
- (MPSGraphTensor)divisionNoNaNWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)divisionWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)dropoutTensor:(MPSGraphTensor *)tensor rate:(double)rate name:(NSString *)name;
- (MPSGraphTensor)dropoutTensor:(MPSGraphTensor *)tensor rateTensor:(MPSGraphTensor *)rate name:(NSString *)name;
- (MPSGraphTensor)equalWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)erfWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)expandDimsOfTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name;
- (MPSGraphTensor)expandDimsOfTensor:(MPSGraphTensor *)tensor axesTensor:(MPSGraphTensor *)axesTensor name:(NSString *)name;
- (MPSGraphTensor)expandDimsOfTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name;
- (MPSGraphTensor)exponentBase10WithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)exponentBase2WithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)exponentWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)fastFourierTransformWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes descriptor:(MPSGraphFFTDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)fastFourierTransformWithTensor:(MPSGraphTensor *)tensor axesTensor:(MPSGraphTensor *)axesTensor descriptor:(MPSGraphFFTDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)flatten2DTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name;
- (MPSGraphTensor)flatten2DTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor name:(NSString *)name;
- (MPSGraphTensor)floorModuloWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)floorWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)gatherAlongAxis:(NSInteger)axis withUpdatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor name:(NSString *)name;
- (MPSGraphTensor)gatherAlongAxisTensor:(MPSGraphTensor *)axisTensor withUpdatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor name:(NSString *)name;
- (MPSGraphTensor)gatherNDWithUpdatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor batchDimensions:(NSUInteger)batchDimensions name:(NSString *)name;
- (MPSGraphTensor)gatherWithUpdatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor axis:(NSUInteger)axis batchDimensions:(NSUInteger)batchDimensions name:(NSString *)name;
- (MPSGraphTensor)greaterThanOrEqualToWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)greaterThanWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)identityWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)imToColWithSourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphImToColOpDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)imaginaryPartOfTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)inverseOfTensor:(MPSGraphTensor *)inputTensor name:(NSString *)name;
- (MPSGraphTensor)isFiniteWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)isInfiniteWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)isNaNWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)leakyReLUGradientWithIncomingGradient:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source alphaTensor:(MPSGraphTensor *)alphaTensor name:(NSString *)name;
- (MPSGraphTensor)leakyReLUWithTensor:(MPSGraphTensor *)tensor alpha:(double)alpha name:(NSString *)name;
- (MPSGraphTensor)leakyReLUWithTensor:(MPSGraphTensor *)tensor alphaTensor:(MPSGraphTensor *)alphaTensor name:(NSString *)name;
- (MPSGraphTensor)lessThanOrEqualToWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)lessThanWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)logarithmBase10WithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)logarithmBase2WithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)logarithmWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)logicalANDWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)logicalNANDWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)logicalNORWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)logicalORWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)logicalXNORWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)logicalXORWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)matrixMultiplicationWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)maxPooling2DGradientWithGradientTensor:(MPSGraphTensor *)gradient indicesTensor:(MPSGraphTensor *)indices outputShape:(MPSShape *)outputShape descriptor:(MPSGraphPooling2DOpDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)maxPooling2DGradientWithGradientTensor:(MPSGraphTensor *)gradient indicesTensor:(MPSGraphTensor *)indices outputShapeTensor:(MPSGraphTensor *)outputShape descriptor:(MPSGraphPooling2DOpDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)maxPooling2DGradientWithGradientTensor:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling2DOpDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)maxPooling2DWithSourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling2DOpDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)maxPooling4DGradientWithGradientTensor:(MPSGraphTensor *)gradient indicesTensor:(MPSGraphTensor *)indices outputShape:(MPSShape *)outputShape descriptor:(MPSGraphPooling4DOpDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)maxPooling4DGradientWithGradientTensor:(MPSGraphTensor *)gradient indicesTensor:(MPSGraphTensor *)indices outputShapeTensor:(MPSGraphTensor *)outputShape descriptor:(MPSGraphPooling4DOpDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)maxPooling4DGradientWithGradientTensor:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling4DOpDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)maxPooling4DWithSourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling4DOpDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)maximumWithNaNPropagationWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)maximumWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)meanOfTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name;
- (MPSGraphTensor)minimumWithNaNPropagationWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)minimumWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)moduloWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)multiplicationWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)negativeWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)nonMaximumSuppressionWithBoxesTensor:(MPSGraphTensor *)boxesTensor scoresTensor:(MPSGraphTensor *)scoresTensor IOUThreshold:(float)IOUThreshold scoreThreshold:(float)scoreThreshold perClassSuppression:(BOOL)perClassSuppression coordinateMode:(MPSGraphNonMaximumSuppressionCoordinateMode)coordinateMode name:(NSString *)name;
- (MPSGraphTensor)nonMaximumSuppressionWithBoxesTensor:(MPSGraphTensor *)boxesTensor scoresTensor:(MPSGraphTensor *)scoresTensor classIndicesTensor:(MPSGraphTensor *)classIndicesTensor IOUThreshold:(float)IOUThreshold scoreThreshold:(float)scoreThreshold perClassSuppression:(BOOL)perClassSuppression coordinateMode:(MPSGraphNonMaximumSuppressionCoordinateMode)coordinateMode name:(NSString *)name;
- (MPSGraphTensor)nonZeroIndicesOfTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)normalizationBetaGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradientTensor sourceTensor:(MPSGraphTensor *)sourceTensor reductionAxes:(NSArray *)axes name:(NSString *)name;
- (MPSGraphTensor)normalizationGammaGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradientTensor sourceTensor:(MPSGraphTensor *)sourceTensor meanTensor:(MPSGraphTensor *)meanTensor varianceTensor:(MPSGraphTensor *)varianceTensor reductionAxes:(NSArray *)axes epsilon:(float)epsilon name:(NSString *)name;
- (MPSGraphTensor)normalizationGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradientTensor sourceTensor:(MPSGraphTensor *)sourceTensor meanTensor:(MPSGraphTensor *)meanTensor varianceTensor:(MPSGraphTensor *)varianceTensor gammaTensor:(MPSGraphTensor *)gamma gammaGradientTensor:(MPSGraphTensor *)gammaGradient betaGradientTensor:(MPSGraphTensor *)betaGradient reductionAxes:(NSArray *)axes epsilon:(float)epsilon name:(NSString *)name;
- (MPSGraphTensor)normalizationWithTensor:(MPSGraphTensor *)tensor meanTensor:(MPSGraphTensor *)mean varianceTensor:(MPSGraphTensor *)variance gammaTensor:(MPSGraphTensor *)gamma betaTensor:(MPSGraphTensor *)beta epsilon:(float)epsilon name:(NSString *)name;
- (MPSGraphTensor)notEqualWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)notWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)oneHotWithIndicesTensor:(MPSGraphTensor *)indicesTensor depth:(NSUInteger)depth axis:(NSUInteger)axis dataType:(MPSDataType)dataType name:(NSString *)name;
- (MPSGraphTensor)oneHotWithIndicesTensor:(MPSGraphTensor *)indicesTensor depth:(NSUInteger)depth axis:(NSUInteger)axis dataType:(MPSDataType)dataType onValue:(double)onValue offValue:(double)offValue name:(NSString *)name;
- (MPSGraphTensor)oneHotWithIndicesTensor:(MPSGraphTensor *)indicesTensor depth:(NSUInteger)depth axis:(NSUInteger)axis name:(NSString *)name;
- (MPSGraphTensor)oneHotWithIndicesTensor:(MPSGraphTensor *)indicesTensor depth:(NSUInteger)depth dataType:(MPSDataType)dataType name:(NSString *)name;
- (MPSGraphTensor)oneHotWithIndicesTensor:(MPSGraphTensor *)indicesTensor depth:(NSUInteger)depth dataType:(MPSDataType)dataType onValue:(double)onValue offValue:(double)offValue name:(NSString *)name;
- (MPSGraphTensor)oneHotWithIndicesTensor:(MPSGraphTensor *)indicesTensor depth:(NSUInteger)depth name:(NSString *)name;
- (MPSGraphTensor)padGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradientTensor sourceTensor:(MPSGraphTensor *)sourceTensor paddingMode:(MPSGraphPaddingMode)paddingMode leftPadding:(MPSShape *)leftPadding rightPadding:(MPSShape *)rightPadding name:(NSString *)name;
- (MPSGraphTensor)padTensor:(MPSGraphTensor *)tensor withPaddingMode:(MPSGraphPaddingMode)paddingMode leftPadding:(MPSShape *)leftPadding rightPadding:(MPSShape *)rightPadding constantValue:(double)constantValue name:(NSString *)name;
- (MPSGraphTensor)placeholderWithShape:(MPSShape *)shape dataType:(MPSDataType)dataType name:(NSString *)name;
- (MPSGraphTensor)placeholderWithShape:(MPSShape *)shape name:(NSString *)name;
- (MPSGraphTensor)powerWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)quantizeTensor:(MPSGraphTensor *)tensor scale:(double)scale zeroPoint:(double)zeroPoint dataType:(MPSDataType)dataType name:(NSString *)name;
- (MPSGraphTensor)quantizeTensor:(MPSGraphTensor *)tensor scaleTensor:(MPSGraphTensor *)scaleTensor zeroPoint:(double)zeroPoint dataType:(MPSDataType)dataType axis:(NSInteger)axis name:(NSString *)name;
- (MPSGraphTensor)quantizeTensor:(MPSGraphTensor *)tensor scaleTensor:(MPSGraphTensor *)scaleTensor zeroPointTensor:(MPSGraphTensor *)zeroPointTensor dataType:(MPSDataType)dataType axis:(NSInteger)axis name:(NSString *)name;
- (MPSGraphTensor)randomPhiloxStateTensorWithCounterLow:(NSUInteger)counterLow counterHigh:(NSUInteger)counterHigh key:(NSUInteger)key name:(NSString *)name;
- (MPSGraphTensor)randomPhiloxStateTensorWithSeed:(NSUInteger)seed name:(NSString *)name;
- (MPSGraphTensor)randomTensorWithShape:(MPSShape *)shape descriptor:(MPSGraphRandomOpDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)randomTensorWithShape:(MPSShape *)shape descriptor:(MPSGraphRandomOpDescriptor *)descriptor seed:(NSUInteger)seed name:(NSString *)name;
- (MPSGraphTensor)randomTensorWithShapeTensor:(MPSGraphTensor *)shapeTensor descriptor:(MPSGraphRandomOpDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)randomTensorWithShapeTensor:(MPSGraphTensor *)shapeTensor descriptor:(MPSGraphRandomOpDescriptor *)descriptor seed:(NSUInteger)seed name:(NSString *)name;
- (MPSGraphTensor)randomUniformTensorWithShape:(MPSShape *)shape name:(NSString *)name;
- (MPSGraphTensor)randomUniformTensorWithShape:(MPSShape *)shape seed:(NSUInteger)seed name:(NSString *)name;
- (MPSGraphTensor)randomUniformTensorWithShapeTensor:(MPSGraphTensor *)shapeTensor name:(NSString *)name;
- (MPSGraphTensor)randomUniformTensorWithShapeTensor:(MPSGraphTensor *)shapeTensor seed:(NSUInteger)seed name:(NSString *)name;
- (MPSGraphTensor)reLUGradientWithIncomingGradient:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source name:(NSString *)name;
- (MPSGraphTensor)reLUWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)readVariable:(MPSGraphTensor *)variable name:(NSString *)name;
- (MPSGraphTensor)realPartOfTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)realToHermiteanFFTWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes descriptor:(MPSGraphFFTDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)realToHermiteanFFTWithTensor:(MPSGraphTensor *)tensor axesTensor:(MPSGraphTensor *)axesTensor descriptor:(MPSGraphFFTDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)reciprocalWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)reductionAndWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name;
- (MPSGraphTensor)reductionAndWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name;
- (MPSGraphTensor)reductionArgMaximumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name;
- (MPSGraphTensor)reductionArgMinimumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name;
- (MPSGraphTensor)reductionMaximumPropagateNaNWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name;
- (MPSGraphTensor)reductionMaximumPropagateNaNWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name;
- (MPSGraphTensor)reductionMaximumWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name;
- (MPSGraphTensor)reductionMaximumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name;
- (MPSGraphTensor)reductionMinimumPropagateNaNWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name;
- (MPSGraphTensor)reductionMinimumPropagateNaNWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name;
- (MPSGraphTensor)reductionMinimumWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name;
- (MPSGraphTensor)reductionMinimumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name;
- (MPSGraphTensor)reductionOrWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name;
- (MPSGraphTensor)reductionOrWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name;
- (MPSGraphTensor)reductionProductWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name;
- (MPSGraphTensor)reductionProductWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name;
- (MPSGraphTensor)reductionSumWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name;
- (MPSGraphTensor)reductionSumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name;
- (MPSGraphTensor)reinterpretCastTensor:(MPSGraphTensor *)tensor toType:(MPSDataType)type name:(NSString *)name;
- (MPSGraphTensor)reshapeTensor:(MPSGraphTensor *)tensor withShape:(MPSShape *)shape name:(NSString *)name;
- (MPSGraphTensor)reshapeTensor:(MPSGraphTensor *)tensor withShapeTensor:(MPSGraphTensor *)shapeTensor name:(NSString *)name;
- (MPSGraphTensor)resizeBilinearWithGradientTensor:(MPSGraphTensor *)gradient input:(MPSGraphTensor *)input centerResult:(BOOL)centerResult alignCorners:(BOOL)alignCorners layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name;
- (MPSGraphTensor)resizeBilinearWithGradientTensor:(MPSGraphTensor *)gradient input:(MPSGraphTensor *)input scaleOffsetTensor:(MPSGraphTensor *)scaleOffset layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name;
- (MPSGraphTensor)resizeBilinearWithGradientTensor:(MPSGraphTensor *)gradient input:(MPSGraphTensor *)input scaleTensor:(MPSGraphTensor *)scale offsetTensor:(MPSGraphTensor *)offset name:(NSString *)name;
- (MPSGraphTensor)resizeBilinearWithTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size centerResult:(BOOL)centerResult alignCorners:(BOOL)alignCorners layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name;
- (MPSGraphTensor)resizeBilinearWithTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size centerResult:(BOOL)centerResult alignCorners:(BOOL)alignCorners name:(NSString *)name;
- (MPSGraphTensor)resizeBilinearWithTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size scaleOffsetTensor:(MPSGraphTensor *)scaleOffset layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name;
- (MPSGraphTensor)resizeBilinearWithTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size scaleTensor:(MPSGraphTensor *)scale offsetTensor:(MPSGraphTensor *)offset name:(NSString *)name;
- (MPSGraphTensor)resizeNearestWithGradientTensor:(MPSGraphTensor *)gradient input:(MPSGraphTensor *)input nearestRoundingMode:(MPSGraphResizeNearestRoundingMode)nearestRoundingMode centerResult:(BOOL)centerResult alignCorners:(BOOL)alignCorners layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name;
- (MPSGraphTensor)resizeNearestWithGradientTensor:(MPSGraphTensor *)gradient input:(MPSGraphTensor *)input scaleOffsetTensor:(MPSGraphTensor *)scaleOffset nearestRoundingMode:(MPSGraphResizeNearestRoundingMode)nearestRoundingMode layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name;
- (MPSGraphTensor)resizeNearestWithGradientTensor:(MPSGraphTensor *)gradient input:(MPSGraphTensor *)input scaleTensor:(MPSGraphTensor *)scale offsetTensor:(MPSGraphTensor *)offset nearestRoundingMode:(MPSGraphResizeNearestRoundingMode)nearestRoundingMode name:(NSString *)name;
- (MPSGraphTensor)resizeNearestWithTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size nearestRoundingMode:(MPSGraphResizeNearestRoundingMode)nearestRoundingMode centerResult:(BOOL)centerResult alignCorners:(BOOL)alignCorners layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name;
- (MPSGraphTensor)resizeNearestWithTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size nearestRoundingMode:(MPSGraphResizeNearestRoundingMode)nearestRoundingMode centerResult:(BOOL)centerResult alignCorners:(BOOL)alignCorners name:(NSString *)name;
- (MPSGraphTensor)resizeNearestWithTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size scaleOffsetTensor:(MPSGraphTensor *)scaleOffset nearestRoundingMode:(MPSGraphResizeNearestRoundingMode)nearestRoundingMode layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name;
- (MPSGraphTensor)resizeNearestWithTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size scaleTensor:(MPSGraphTensor *)scale offsetTensor:(MPSGraphTensor *)offset nearestRoundingMode:(MPSGraphResizeNearestRoundingMode)nearestRoundingMode name:(NSString *)name;
- (MPSGraphTensor)resizeTensor:(MPSGraphTensor *)imagesTensor size:(MPSShape *)size mode:(MPSGraphResizeMode)mode centerResult:(BOOL)centerResult alignCorners:(BOOL)alignCorners layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name;
- (MPSGraphTensor)resizeTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size mode:(MPSGraphResizeMode)mode centerResult:(BOOL)centerResult alignCorners:(BOOL)alignCorners layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name;
- (MPSGraphTensor)resizeTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size mode:(MPSGraphResizeMode)mode centerResult:(BOOL)centerResult alignCorners:(BOOL)alignCorners name:(NSString *)name;
- (MPSGraphTensor)resizeTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size scaleOffsetTensor:(MPSGraphTensor *)scaleOffset mode:(MPSGraphResizeMode)mode layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name;
- (MPSGraphTensor)resizeTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size scaleTensor:(MPSGraphTensor *)scale offsetTensor:(MPSGraphTensor *)offset mode:(MPSGraphResizeMode)mode name:(NSString *)name;
- (MPSGraphTensor)resizeWithGradientTensor:(MPSGraphTensor *)gradient input:(MPSGraphTensor *)input mode:(MPSGraphResizeMode)mode centerResult:(BOOL)centerResult alignCorners:(BOOL)alignCorners layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name;
- (MPSGraphTensor)resizeWithGradientTensor:(MPSGraphTensor *)gradient input:(MPSGraphTensor *)input scaleOffsetTensor:(MPSGraphTensor *)scaleOffset mode:(MPSGraphResizeMode)mode layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name;
- (MPSGraphTensor)resizeWithGradientTensor:(MPSGraphTensor *)gradient input:(MPSGraphTensor *)input scaleTensor:(MPSGraphTensor *)scale offsetTensor:(MPSGraphTensor *)offset mode:(MPSGraphResizeMode)mode name:(NSString *)name;
- (MPSGraphTensor)reverseSquareRootWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)reverseTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name;
- (MPSGraphTensor)reverseTensor:(MPSGraphTensor *)tensor axesTensor:(MPSGraphTensor *)axesTensor name:(NSString *)name;
- (MPSGraphTensor)reverseTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)rintWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)roundWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)sampleGridWithSourceTensor:(MPSGraphTensor *)source coordinateTensor:(MPSGraphTensor *)coordinates layout:(MPSGraphTensorNamedDataLayout)layout normalizeCoordinates:(BOOL)normalizeCoordinates relativeCoordinates:(BOOL)relativeCoordinates alignCorners:(BOOL)alignCorners paddingMode:(MPSGraphPaddingMode)paddingMode nearestRoundingMode:(MPSGraphResizeNearestRoundingMode)nearestRoundingMode constantValue:(double)constantValue name:(NSString *)name;
- (MPSGraphTensor)sampleGridWithSourceTensor:(MPSGraphTensor *)source coordinateTensor:(MPSGraphTensor *)coordinates layout:(MPSGraphTensorNamedDataLayout)layout normalizeCoordinates:(BOOL)normalizeCoordinates relativeCoordinates:(BOOL)relativeCoordinates alignCorners:(BOOL)alignCorners paddingMode:(MPSGraphPaddingMode)paddingMode samplingMode:(MPSGraphResizeMode)samplingMode constantValue:(double)constantValue name:(NSString *)name;
- (MPSGraphTensor)scatterAlongAxis:(NSInteger)axis withDataTensor:(MPSGraphTensor *)dataTensor updatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor mode:(MPSGraphScatterMode)mode name:(NSString *)name;
- (MPSGraphTensor)scatterAlongAxis:(NSInteger)axis withUpdatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor shape:(MPSShape *)shape mode:(MPSGraphScatterMode)mode name:(NSString *)name;
- (MPSGraphTensor)scatterAlongAxisTensor:(MPSGraphTensor *)axisTensor withDataTensor:(MPSGraphTensor *)dataTensor updatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor mode:(MPSGraphScatterMode)mode name:(NSString *)name;
- (MPSGraphTensor)scatterAlongAxisTensor:(MPSGraphTensor *)axisTensor withUpdatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor shape:(MPSShape *)shape mode:(MPSGraphScatterMode)mode name:(NSString *)name;
- (MPSGraphTensor)scatterNDWithDataTensor:(MPSGraphTensor *)dataTensor updatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor batchDimensions:(NSUInteger)batchDimensions mode:(MPSGraphScatterMode)mode name:(NSString *)name;
- (MPSGraphTensor)scatterNDWithUpdatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor shape:(MPSShape *)shape batchDimensions:(NSUInteger)batchDimensions mode:(MPSGraphScatterMode)mode name:(NSString *)name;
- (MPSGraphTensor)scatterNDWithUpdatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor shape:(MPSShape *)shape batchDimensions:(NSUInteger)batchDimensions name:(NSString *)name;
- (MPSGraphTensor)scatterWithDataTensor:(MPSGraphTensor *)dataTensor updatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor axis:(NSInteger)axis mode:(MPSGraphScatterMode)mode name:(NSString *)name;
- (MPSGraphTensor)scatterWithUpdatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor shape:(MPSShape *)shape axis:(NSInteger)axis mode:(MPSGraphScatterMode)mode name:(NSString *)name;
- (MPSGraphTensor)selectWithPredicateTensor:(MPSGraphTensor *)predicateTensor truePredicateTensor:(MPSGraphTensor *)truePredicateTensor falsePredicateTensor:(MPSGraphTensor *)falseSelectTensor name:(NSString *)name;
- (MPSGraphTensor)shapeOfTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)sigmoidGradientWithIncomingGradient:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source name:(NSString *)name;
- (MPSGraphTensor)sigmoidWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)signWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)signbitWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)sinWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)sinhWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)sliceGradientTensor:(MPSGraphTensor *)inputGradientTensor fwdInShapeTensor:(MPSGraphTensor *)fwdInShapeTensor starts:(NSArray *)starts ends:(NSArray *)ends strides:(NSArray *)strides name:(NSString *)name;
- (MPSGraphTensor)sliceGradientTensor:(MPSGraphTensor *)inputGradientTensor fwdInShapeTensor:(MPSGraphTensor *)fwdInShapeTensor starts:(NSArray *)starts ends:(NSArray *)ends strides:(NSArray *)strides startMask:(uint32_t)startMask endMask:(uint32_t)endMask squeezeMask:(uint32_t)squeezeMask name:(NSString *)name;
- (MPSGraphTensor)sliceTensor:(MPSGraphTensor *)tensor dimension:(NSUInteger)dimensionIndex start:(NSInteger)start length:(NSInteger)length name:(NSString *)name;
- (MPSGraphTensor)sliceTensor:(MPSGraphTensor *)tensor starts:(NSArray *)starts ends:(NSArray *)ends strides:(NSArray *)strides name:(NSString *)name;
- (MPSGraphTensor)sliceTensor:(MPSGraphTensor *)tensor starts:(NSArray *)starts ends:(NSArray *)ends strides:(NSArray *)strides startMask:(uint32_t)startMask endMask:(uint32_t)endMask squeezeMask:(uint32_t)squeezeMask name:(NSString *)name;
- (MPSGraphTensor)softMaxCrossEntropyGradientWithIncomingGradientTensor:(MPSGraphTensor *)gradientTensor sourceTensor:(MPSGraphTensor *)sourceTensor labelsTensor:(MPSGraphTensor *)labelsTensor axis:(NSInteger)axis reductionType:(MPSGraphLossReductionType)reductionType name:(NSString *)name;
- (MPSGraphTensor)softMaxCrossEntropyWithSourceTensor:(MPSGraphTensor *)sourceTensor labelsTensor:(MPSGraphTensor *)labelsTensor axis:(NSInteger)axis reductionType:(MPSGraphLossReductionType)reductionType name:(NSString *)name;
- (MPSGraphTensor)softMaxGradientWithIncomingGradient:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source axis:(NSInteger)axis name:(NSString *)name;
- (MPSGraphTensor)softMaxWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name;
- (MPSGraphTensor)sortWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis descending:(BOOL)descending name:(NSString *)name;
- (MPSGraphTensor)sortWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name;
- (MPSGraphTensor)sortWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor descending:(BOOL)descending name:(NSString *)name;
- (MPSGraphTensor)sortWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor name:(NSString *)name;
- (MPSGraphTensor)spaceToBatchTensor:(MPSGraphTensor *)tensor spatialAxes:(NSArray *)spatialAxes batchAxis:(NSInteger)batchAxis blockDimensions:(NSArray *)blockDimensions usePixelShuffleOrder:(BOOL)usePixelShuffleOrder name:(NSString *)name;
- (MPSGraphTensor)spaceToBatchTensor:(MPSGraphTensor *)tensor spatialAxesTensor:(MPSGraphTensor *)spatialAxesTensor batchAxisTensor:(MPSGraphTensor *)batchAxisTensor blockDimensionsTensor:(MPSGraphTensor *)blockDimensionsTensor usePixelShuffleOrder:(BOOL)usePixelShuffleOrder name:(NSString *)name;
- (MPSGraphTensor)spaceToDepth2DTensor:(MPSGraphTensor *)tensor widthAxis:(NSUInteger)widthAxis heightAxis:(NSUInteger)heightAxis depthAxis:(NSUInteger)depthAxis blockSize:(NSUInteger)blockSize usePixelShuffleOrder:(BOOL)usePixelShuffleOrder name:(NSString *)name;
- (MPSGraphTensor)spaceToDepth2DTensor:(MPSGraphTensor *)tensor widthAxisTensor:(MPSGraphTensor *)widthAxisTensor heightAxisTensor:(MPSGraphTensor *)heightAxisTensor depthAxisTensor:(MPSGraphTensor *)depthAxisTensor blockSize:(NSUInteger)blockSize usePixelShuffleOrder:(BOOL)usePixelShuffleOrder name:(NSString *)name;
- (MPSGraphTensor)sparseTensorWithDescriptor:(MPSGraphCreateSparseOpDescriptor *)sparseDescriptor tensors:(NSArray *)inputTensorArray shape:(MPSShape *)shape name:(NSString *)name;
- (MPSGraphTensor)sparseTensorWithType:(MPSGraphSparseStorageType)sparseStorageType tensors:(NSArray *)inputTensorArray shape:(MPSShape *)shape dataType:(MPSDataType)dataType name:(NSString *)name;
- (MPSGraphTensor)squareRootWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)squareWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)squeezeTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name;
- (MPSGraphTensor)squeezeTensor:(MPSGraphTensor *)tensor axesTensor:(MPSGraphTensor *)axesTensor name:(NSString *)name;
- (MPSGraphTensor)squeezeTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name;
- (MPSGraphTensor)squeezeTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)stackTensors:(NSArray *)inputTensors axis:(NSInteger)axis name:(NSString *)name;
- (MPSGraphTensor)stencilWithSourceTensor:(MPSGraphTensor *)source weightsTensor:(MPSGraphTensor *)weights descriptor:(MPSGraphStencilOpDescriptor *)descriptor name:(NSString *)name;
- (MPSGraphTensor)stochasticGradientDescentWithLearningRateTensor:(MPSGraphTensor *)learningRateTensor valuesTensor:(MPSGraphTensor *)valuesTensor gradientTensor:(MPSGraphTensor *)gradientTensor name:(NSString *)name;
- (MPSGraphTensor)subtractionWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name;
- (MPSGraphTensor)tanWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)tanhWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)tileGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradientTensor sourceTensor:(MPSGraphTensor *)sourceTensor withMultiplier:(MPSShape *)multiplier name:(NSString *)name;
- (MPSGraphTensor)tileTensor:(MPSGraphTensor *)tensor withMultiplier:(MPSShape *)multiplier name:(NSString *)name;
- (MPSGraphTensor)topKWithGradientTensor:(MPSGraphTensor *)gradient source:(MPSGraphTensor *)source axis:(NSInteger)axis k:(NSUInteger)k name:(NSString *)name;
- (MPSGraphTensor)topKWithGradientTensor:(MPSGraphTensor *)gradient source:(MPSGraphTensor *)source axisTensor:(MPSGraphTensor *)axisTensor kTensor:(MPSGraphTensor *)kTensor name:(NSString *)name;
- (MPSGraphTensor)topKWithGradientTensor:(MPSGraphTensor *)gradient source:(MPSGraphTensor *)source k:(NSUInteger)k name:(NSString *)name;
- (MPSGraphTensor)topKWithGradientTensor:(MPSGraphTensor *)gradient source:(MPSGraphTensor *)source kTensor:(MPSGraphTensor *)kTensor name:(NSString *)name;
- (MPSGraphTensor)transposeTensor:(MPSGraphTensor *)tensor dimension:(NSUInteger)dimensionIndex withDimension:(NSUInteger)dimensionIndex2 name:(NSString *)name;
- (MPSGraphTensor)transposeTensor:(MPSGraphTensor *)tensor permutation:(NSArray *)permutation name:(NSString *)name;
- (MPSGraphTensor)truncateWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name;
- (MPSGraphTensor)variableWithData:(NSData *)data shape:(MPSShape *)shape dataType:(MPSDataType)dataType name:(NSString *)name;
- (MPSGraphTensor)varianceOfTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name;
- (MPSGraphTensor)varianceOfTensor:(MPSGraphTensor *)tensor meanTensor:(MPSGraphTensor *)meanTensor axes:(NSArray *)axes name:(NSString *)name;
- (MPSGraphTensorDataDictionary)encodeToCommandBuffer:(MPSCommandBuffer *)commandBuffer feeds:(MPSGraphTensorDataDictionary *)feeds targetTensors:(NSArray *)targetTensors targetOperations:(NSArray *)targetOperations executionDescriptor:(MPSGraphExecutionDescriptor *)executionDescriptor;
- (MPSGraphTensorDataDictionary)runAsyncWithFeeds:(MPSGraphTensorDataDictionary *)feeds targetTensors:(NSArray *)targetTensors targetOperations:(NSArray *)targetOperations executionDescriptor:(MPSGraphExecutionDescriptor *)executionDescriptor;
- (MPSGraphTensorDataDictionary)runAsyncWithMTLCommandQueue:(id)commandQueue feeds:(MPSGraphTensorDataDictionary *)feeds targetTensors:(NSArray *)targetTensors targetOperations:(NSArray *)targetOperations executionDescriptor:(MPSGraphExecutionDescriptor *)executionDescriptor;
- (MPSGraphTensorDataDictionary)runWithFeeds:(MPSGraphTensorDataDictionary *)feeds targetTensors:(NSArray *)targetTensors targetOperations:(NSArray *)targetOperations;
- (MPSGraphTensorDataDictionary)runWithMTLCommandQueue:(id)commandQueue feeds:(MPSGraphTensorDataDictionary *)feeds targetTensors:(NSArray *)targetTensors targetOperations:(NSArray *)targetOperations;
- (NSArray)GRUGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState outputFwd:(MPSGraphTensor *)outputFwd inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias descriptor:(MPSGraphGRUDescriptor *)descriptor name:(NSString *)name;
- (NSArray)GRUGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState outputFwd:(MPSGraphTensor *)outputFwd inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState descriptor:(MPSGraphGRUDescriptor *)descriptor name:(NSString *)name;
- (NSArray)GRUGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState outputFwd:(MPSGraphTensor *)outputFwd stateGradient:(MPSGraphTensor *)stateGradient inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState mask:(MPSGraphTensor *)mask secondaryBias:(MPSGraphTensor *)secondaryBias descriptor:(MPSGraphGRUDescriptor *)descriptor name:(NSString *)name;
- (NSArray)GRUWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias descriptor:(MPSGraphGRUDescriptor *)descriptor name:(NSString *)name;
- (NSArray)GRUWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState descriptor:(MPSGraphGRUDescriptor *)descriptor name:(NSString *)name;
- (NSArray)GRUWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState mask:(MPSGraphTensor *)mask secondaryBias:(MPSGraphTensor *)secondaryBias descriptor:(MPSGraphGRUDescriptor *)descriptor name:(NSString *)name;
- (NSArray)LSTMGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState cellOutputFwd:(MPSGraphTensor *)cellOutputFwd descriptor:(MPSGraphLSTMDescriptor *)descriptor name:(NSString *)name;
- (NSArray)LSTMGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState cellOutputFwd:(MPSGraphTensor *)cellOutputFwd inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState initCell:(MPSGraphTensor *)initCell descriptor:(MPSGraphLSTMDescriptor *)descriptor name:(NSString *)name;
- (NSArray)LSTMGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState cellOutputFwd:(MPSGraphTensor *)cellOutputFwd inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState initCell:(MPSGraphTensor *)initCell mask:(MPSGraphTensor *)mask descriptor:(MPSGraphLSTMDescriptor *)descriptor name:(NSString *)name;
- (NSArray)LSTMGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState cellOutputFwd:(MPSGraphTensor *)cellOutputFwd stateGradient:(MPSGraphTensor *)stateGradient cellGradient:(MPSGraphTensor *)cellGradient inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState initCell:(MPSGraphTensor *)initCell mask:(MPSGraphTensor *)mask peephole:(MPSGraphTensor *)peephole descriptor:(MPSGraphLSTMDescriptor *)descriptor name:(NSString *)name;
- (NSArray)LSTMWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight initState:(MPSGraphTensor *)initState initCell:(MPSGraphTensor *)initCell descriptor:(MPSGraphLSTMDescriptor *)descriptor name:(NSString *)name;
- (NSArray)LSTMWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState initCell:(MPSGraphTensor *)initCell descriptor:(MPSGraphLSTMDescriptor *)descriptor name:(NSString *)name;
- (NSArray)LSTMWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState initCell:(MPSGraphTensor *)initCell mask:(MPSGraphTensor *)mask peephole:(MPSGraphTensor *)peephole descriptor:(MPSGraphLSTMDescriptor *)descriptor name:(NSString *)name;
- (NSArray)adamWithCurrentLearningRateTensor:(MPSGraphTensor *)currentLearningRateTensor beta1Tensor:(MPSGraphTensor *)beta1Tensor beta2Tensor:(MPSGraphTensor *)beta2Tensor epsilonTensor:(MPSGraphTensor *)epsilonTensor valuesTensor:(MPSGraphTensor *)valuesTensor momentumTensor:(MPSGraphTensor *)momentumTensor velocityTensor:(MPSGraphTensor *)velocityTensor maximumVelocityTensor:(MPSGraphTensor *)maximumVelocityTensor gradientTensor:(MPSGraphTensor *)gradientTensor name:(NSString *)name;
- (NSArray)adamWithLearningRateTensor:(MPSGraphTensor *)learningRateTensor beta1Tensor:(MPSGraphTensor *)beta1Tensor beta2Tensor:(MPSGraphTensor *)beta2Tensor epsilonTensor:(MPSGraphTensor *)epsilonTensor beta1PowerTensor:(MPSGraphTensor *)beta1PowerTensor beta2PowerTensor:(MPSGraphTensor *)beta2PowerTensor valuesTensor:(MPSGraphTensor *)valuesTensor momentumTensor:(MPSGraphTensor *)momentumTensor velocityTensor:(MPSGraphTensor *)velocityTensor maximumVelocityTensor:(MPSGraphTensor *)maximumVelocityTensor gradientTensor:(MPSGraphTensor *)gradientTensor name:(NSString *)name;
- (NSArray)bottomKWithSourceTensor:(MPSGraphTensor *)source axis:(NSInteger)axis k:(NSUInteger)k name:(NSString *)name;
- (NSArray)bottomKWithSourceTensor:(MPSGraphTensor *)source axisTensor:(MPSGraphTensor *)axisTensor kTensor:(MPSGraphTensor *)kTensor name:(NSString *)name;
- (NSArray)controlDependencyWithOperations:(NSArray *)operations dependentBlock:(MPSGraphControlFlowDependencyBlock)dependentBlock name:(NSString *)name;
- (NSArray)forLoopWithLowerBound:(MPSGraphTensor *)lowerBound upperBound:(MPSGraphTensor *)upperBound step:(MPSGraphTensor *)step initialBodyArguments:(NSArray *)initialBodyArguments body:(MPSGraphForLoopBodyBlock)body name:(NSString *)name;
- (NSArray)forLoopWithNumberOfIterations:(MPSGraphTensor *)numberOfIterations initialBodyArguments:(NSArray *)initialBodyArguments body:(MPSGraphForLoopBodyBlock)body name:(NSString *)name;
- (NSArray)ifWithPredicateTensor:(MPSGraphTensor *)predicateTensor thenBlock:(MPSGraphIfThenElseBlock)thenBlock elseBlock:(MPSGraphIfThenElseBlock)elseBlock name:(NSString *)name;
- (NSArray)maxPooling2DReturnIndicesWithSourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling2DOpDescriptor *)descriptor name:(NSString *)name;
- (NSArray)maxPooling4DReturnIndicesWithSourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling4DOpDescriptor *)descriptor name:(NSString *)name;
- (NSArray)placeholderTensors;
- (NSArray)randomTensorWithShape:(MPSShape *)shape descriptor:(MPSGraphRandomOpDescriptor *)descriptor stateTensor:(MPSGraphTensor *)state name:(NSString *)name;
- (NSArray)randomTensorWithShapeTensor:(MPSGraphTensor *)shapeTensor descriptor:(MPSGraphRandomOpDescriptor *)descriptor stateTensor:(MPSGraphTensor *)state name:(NSString *)name;
- (NSArray)randomUniformTensorWithShape:(MPSShape *)shape stateTensor:(MPSGraphTensor *)state name:(NSString *)name;
- (NSArray)randomUniformTensorWithShapeTensor:(MPSGraphTensor *)shapeTensor stateTensor:(MPSGraphTensor *)state name:(NSString *)name;
- (NSArray)singleGateRNNGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState initState:(MPSGraphTensor *)initState descriptor:(MPSGraphSingleGateRNNDescriptor *)descriptor name:(NSString *)name;
- (NSArray)singleGateRNNGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState descriptor:(MPSGraphSingleGateRNNDescriptor *)descriptor name:(NSString *)name;
- (NSArray)singleGateRNNGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState mask:(MPSGraphTensor *)mask descriptor:(MPSGraphSingleGateRNNDescriptor *)descriptor name:(NSString *)name;
- (NSArray)singleGateRNNGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState stateGradient:(MPSGraphTensor *)stateGradient inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState mask:(MPSGraphTensor *)mask descriptor:(MPSGraphSingleGateRNNDescriptor *)descriptor name:(NSString *)name;
- (NSArray)singleGateRNNWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight initState:(MPSGraphTensor *)initState descriptor:(MPSGraphSingleGateRNNDescriptor *)descriptor name:(NSString *)name;
- (NSArray)singleGateRNNWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState descriptor:(MPSGraphSingleGateRNNDescriptor *)descriptor name:(NSString *)name;
- (NSArray)singleGateRNNWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState mask:(MPSGraphTensor *)mask descriptor:(MPSGraphSingleGateRNNDescriptor *)descriptor name:(NSString *)name;
- (NSArray)splitTensor:(MPSGraphTensor *)tensor numSplits:(NSUInteger)numSplits axis:(NSInteger)axis name:(NSString *)name;
- (NSArray)splitTensor:(MPSGraphTensor *)tensor splitSizes:(NSArray *)splitSizes axis:(NSInteger)axis name:(NSString *)name;
- (NSArray)splitTensor:(MPSGraphTensor *)tensor splitSizesTensor:(MPSGraphTensor *)splitSizesTensor axis:(NSInteger)axis name:(NSString *)name;
- (NSArray)topKWithSourceTensor:(MPSGraphTensor *)source axis:(NSInteger)axis k:(NSUInteger)k name:(NSString *)name;
- (NSArray)topKWithSourceTensor:(MPSGraphTensor *)source axisTensor:(MPSGraphTensor *)axisTensor kTensor:(MPSGraphTensor *)kTensor name:(NSString *)name;
- (NSArray)topKWithSourceTensor:(MPSGraphTensor *)source k:(NSUInteger)k name:(NSString *)name;
- (NSArray)topKWithSourceTensor:(MPSGraphTensor *)source kTensor:(MPSGraphTensor *)kTensor name:(NSString *)name;
- (NSArray)whileWithInitialInputs:(NSArray *)initialInputs before:(MPSGraphWhileBeforeBlock)before after:(MPSGraphWhileAfterBlock)after name:(NSString *)name;
- (NSDictionary)gradientForPrimaryTensor:(MPSGraphTensor *)primaryTensor withTensors:(NSArray *)tensors name:(NSString *)name;
- (NSMutableDictionary)tensorNameDict;
- (id).cxx_construct;
- (id)absoluteErrorWithPrimaryTensor:(id)a3 secondaryTensor:(id)a4 reductionType:(unint64_t)a5 name:(id)a6;
- (id)adamAssignWithInputVariableTensor:(id)a3 momentumVariableTensor:(id)a4 velocityVariableTensor:(id)a5 maximumVelocityVariableTensor:(id)a6 updates:(id)a7 name:(id)a8;
- (id)adamUpdateWithCurrentLearningRateTensor:(id)a3 beta1Tensor:(id)a4 beta2Tensor:(id)a5 epsilonTensor:(id)a6 valuesTensor:(id)a7 momentumTensor:(id)a8 velocityTensor:(id)a9 maximumVelocityTensor:(id)a10 gradientTensor:(id)a11 name:(id)a12;
- (id)adamUpdateWithLearningRateTensor:(id)a3 beta1Tensor:(id)a4 beta2Tensor:(id)a5 epsilonTensor:(id)a6 beta1PowerTensor:(id)a7 beta2PowerTensor:(id)a8 valuesTensor:(id)a9 momentumTensor:(id)a10 velocityTensor:(id)a11 maximumVelocityTensor:(id)a12 gradientTensor:(id)a13 name:(id)a14;
- (id)adamUpdateWithLearningRateTensor:(id)a3 beta1Tensor:(id)a4 beta2Tensor:(id)a5 epsilonTensor:(id)a6 iterationTensor:(id)a7 valuesTensor:(id)a8 momentumTensor:(id)a9 velocityTensor:(id)a10 gradientTensor:(id)a11 name:(id)a12;
- (id)applyAdamWithCurrentLearningRateTensor:(id)a3 beta1Tensor:(id)a4 beta2Tensor:(id)a5 epsilonTensor:(id)a6 variable:(id)a7 momentumVariable:(id)a8 velocityVariable:(id)a9 maximumVelocityVariable:(id)a10 gradientTensor:(id)a11 name:(id)a12;
- (id)applyAdamWithLearningRateTensor:(id)a3 beta1Tensor:(id)a4 beta2Tensor:(id)a5 epsilonTensor:(id)a6 beta1PowerTensor:(id)a7 beta2PowerTensor:(id)a8 variable:(id)a9 momentumVariable:(id)a10 velocityVariable:(id)a11 gradientTensor:(id)a12 name:(id)a13;
- (id)applyAdamWithLearningRateTensor:(id)a3 beta1Tensor:(id)a4 beta2Tensor:(id)a5 epsilonTensor:(id)a6 iterationTensor:(id)a7 variable:(id)a8 momentumVariable:(id)a9 velocityVariable:(id)a10 gradientTensor:(id)a11 name:(id)a12;
- (id)avgPooling2DLayerWithTensor:(id)a3 kernelSizes:(id)a4 strides:(id)a5 paddingStyle:(unint64_t)a6 dataLayout:(unint64_t)a7 name:(id)a8;
- (id)batchNormalizationLayerWithTensor:(id)a3 batchNormalizationGammaInitializer:(id)a4 batchNormalizationBetaInitializer:(id)a5 batchNormalizationMeanInitializer:(id)a6 batchNormalizationVarianceInitializer:(id)a7 batchNormalizationEpsilon:(double)a8 dataLayout:(unint64_t)a9 name:(id)a10;
- (id)biasAddWithTensor:(id)a3 biases:(id)a4 dataLayout:(unint64_t)a5 name:(id)a6;
- (id)broadcastGradientArgsForPrimaryTensor:(id)a3 withSecondaryTensor:(id)a4 name:(id)a5;
- (id)callSymbolName:(id)a3 inputTensors:(id)a4 outputTypes:(id)a5 name:(id)a6;
- (id)callWithInputTensors:(id)a3 outputTypes:(id)a4 symbolName:(id)a5 inliningOption:(unint64_t)a6 name:(id)a7;
- (id)callWithInputTensors:(id)a3 outputTypes:(id)a4 symbolName:(id)a5 name:(id)a6;
- (id)castBooleansOfInputsTensors:(id)a3;
- (id)compileWithDevice:(id)a3 feeds:(id)a4 targetTensors:(id)a5 targetOperations:(id)a6;
- (id)convolution2DLayerWithTensor:(id)a3 kernelSizes:(id)a4 outputChannelCount:(unint64_t)a5 strides:(id)a6 activationType:(unsigned int)a7 weightsInitializer:(id)a8 biasesInitializer:(id)a9 batchNormalizationGammaInitializer:(id)a10 batchNormalizationBetaInitializer:(id)a11 batchNormalizationMeanInitializer:(id)a12 batchNormalizationVarianceInitializer:(id)a13 batchNormalizationEpsilon:(double)a14 paddingStyle:(unint64_t)a15 dataLayout:(unint64_t)a16 weightsLayout:(unint64_t)a17 name:(id)a18;
- (id)convolution2DLayerWithTensor:(id)a3 kernelSizes:(id)a4 outputChannelCount:(unint64_t)a5 strides:(id)a6 activationType:(unsigned int)a7 weightsInitializer:(id)a8 biasesInitializer:(id)a9 paddingStyle:(unint64_t)a10 dataLayout:(unint64_t)a11 weightsLayout:(unint64_t)a12 name:(id)a13;
- (id)convolution2DLayerWithTensor:(id)a3 kernelSizes:(id)a4 outputChannelCount:(unint64_t)a5 strides:(id)a6 dilationRates:(id)a7 groups:(unint64_t)a8 activationType:(unsigned int)a9 weightsInitializer:(id)a10 biasesInitializer:(id)a11 batchNormalizationGammaInitializer:(id)a12 batchNormalizationBetaInitializer:(id)a13 batchNormalizationMeanInitializer:(id)a14 batchNormalizationVarianceInitializer:(id)a15 batchNormalizationEpsilon:(double)a16 paddingStyle:(unint64_t)a17 dataLayout:(unint64_t)a18 weightsLayout:(unint64_t)a19 name:(id)a20;
- (id)convolution2DWithDefaultBatchNormalizationLayerWithTensor:(id)a3 kernelSizes:(id)a4 outputChannelCount:(unint64_t)a5 strides:(id)a6 activationType:(unsigned int)a7 weightsInitializer:(id)a8 biasesInitializer:(id)a9 paddingStyle:(unint64_t)a10 dataLayout:(unint64_t)a11 weightsLayout:(unint64_t)a12 name:(id)a13;
- (id)costVolumeWithRefTensor:(id)a3 inputTensor:(id)a4 coordinatesTensor:(id)a5 windowSizes:(id)a6 layout:(unint64_t)a7 normalizeCoordinates:(BOOL)a8 relativeCoordinates:(BOOL)a9 coordinateIs1DInWidth:(BOOL)a10 similarityType:(unint64_t)a11 name:(id)a12;
- (id)createTexture:(id)a3 withPixelFormat:(unint64_t)a4 isCompressed:(BOOL)a5 name:(id)a6;
- (id)cropResizeWithImagesTensor:(id)a3 boxesTensor:(id)a4 boxIndicesTensor:(id)a5 descriptor:(id)a6 name:(id)a7;
- (id)cropTensor:(id)a3 dimension:(unint64_t)a4 amount_before:(unint64_t)a5 amount_after:(unint64_t)a6 name:(id)a7;
- (id)cumulativeMaximumReturnIndicesWithTensor:(id)a3 axis:(int64_t)a4 exclusive:(BOOL)a5 reverse:(BOOL)a6 name:(id)a7;
- (id)cumulativeMinimumReturnIndicesWithTensor:(id)a3 axis:(int64_t)a4 exclusive:(BOOL)a5 reverse:(BOOL)a6 name:(id)a7;
- (id)currentLearningRateWithLearningRateTensor:(id)a3 beta1Tensor:(id)a4 beta2Tensor:(id)a5 beta1PowerTensor:(id)a6 beta2PowerTensor:(id)a7 name:(id)a8;
- (id)debugDescription;
- (id)decompositionLUWithTensor:(id)a3 name:(id)a4;
- (id)decompositionWithTensor:(id)a3 descriptor:(id)a4 name:(id)a5;
- (id)deinterleaveTensor:(id)a3 interleaveFactor:(unint64_t)a4 name:(id)a5;
- (id)depthwiseConvolution2DDataGradientWithIncomingGradientTensor:(id)a3 weightsTensor:(id)a4 outputShapeTensor:(id)a5 descriptor:(id)a6 name:(id)a7;
- (id)depthwiseConvolution2DWeightsGradientWithIncomingGradientTensor:(id)a3 sourceTensor:(id)a4 outputShapeTensor:(id)a5 descriptor:(id)a6 name:(id)a7;
- (id)depthwiseConvolution3DDataGradientWithIncomingGradientTensor:(id)a3 weightsTensor:(id)a4 outputShapeTensor:(id)a5 descriptor:(id)a6 name:(id)a7;
- (id)depthwiseConvolution3DWeightsGradientWithIncomingGradientTensor:(id)a3 sourceTensor:(id)a4 outputShapeTensor:(id)a5 descriptor:(id)a6 name:(id)a7;
- (id)dequantizeTensor:(id)a3 LUTTensor:(id)a4 axis:(int64_t)a5 name:(id)a6;
- (id)dequantizeTensor:(id)a3 LUTTensor:(id)a4 name:(id)a5;
- (id)dequantizeTensor:(id)a3 lutTableTensor:(id)a4 axis:(int64_t)a5 name:(id)a6;
- (id)dequantizeTensor:(id)a3 lutTableTensor:(id)a4 name:(id)a5;
- (id)dequantizeTensor:(id)a3 scale:(double)a4 zeroPoint:(double)a5 dtype:(unsigned int)a6 name:(id)a7;
- (id)dequantizeTensor:(id)a3 scaleTensor:(id)a4 dataType:(unsigned int)a5 name:(id)a6;
- (id)dequantizeTensor:(id)a3 scaleTensor:(id)a4 zeroPoint:(double)a5 dtype:(unsigned int)a6 axis:(int)a7 name:(id)a8;
- (id)dequantizeTensor:(id)a3 scaleTensor:(id)a4 zeroPointTensor:(id)a5 dataType:(unsigned int)a6 name:(id)a7;
- (id)dequantizeTensor:(id)a3 scaleTensor:(id)a4 zeroPointTensor:(id)a5 dtype:(unsigned int)a6 axis:(int)a7 name:(id)a8;
- (id)dequantizeTensor:(id)a3 scaleTensor:(id)a4 zeroPointTensor:(id)a5 minTensor:(id)a6 dataType:(unsigned int)a7 axis:(int64_t)a8 name:(id)a9;
- (id)dequantizeTensor:(id)a3 scaleTensor:(id)a4 zeroPointTensor:(id)a5 minTensor:(id)a6 dataType:(unsigned int)a7 name:(id)a8;
- (id)dimensionSizeOfTensor:(id)a3 axes:(id)a4 name:(id)a5;
- (id)dimensionSizeOfTensor:(id)a3 axesTensor:(id)a4 name:(id)a5;
- (id)eluGradientWithIncomingGradient:(id)a3 sourceTensor:(id)a4 alpha:(double)a5 name:(id)a6;
- (id)eluWithTensor:(id)a3 alpha:(double)a4 name:(id)a5;
- (id)expandTensor:(id)a3 dimension:(unint64_t)a4 name:(id)a5;
- (id)expandTensor:(id)a3 dimensionTensor:(id)a4 name:(id)a5;
- (id)fixCastIntTensor:(id)a3 toSignedness:(BOOL)a4 name:(id)a5;
- (id)fixSignednessOfInputsTensors:(id)a3;
- (id)fixTypeOfReductionInput:(id)a3;
- (id)fullyConnectedLayerWithTensor:(id)a3 outputChannelCount:(unint64_t)a4 activationType:(unsigned int)a5 weightsInitializer:(id)a6 biasesInitializer:(id)a7 name:(id)a8;
- (id)gatherAlongAxisWithUpdatesTensor:(id)a3 indicesTensor:(id)a4 axis:(int64_t)a5 name:(id)a6;
- (id)getCoordinateValueWithShapeTensor:(id)a3 axisTensor:(id)a4 name:(id)a5;
- (id)getExecutableForDevice:(id)a3 feeds:(id)a4 targetTensors:(id)a5 targetOperations:(id)a6 resultsDictionary:(id)a7 executionDescriptor:(id)a8;
- (id)gradientForPrimaryTensor:(id)a3 withSecondaryTensor:(id)a4 name:(id)a5;
- (id)interleaveTensor:(id)a3 interleaveFactor:(unint64_t)a4 name:(id)a5;
- (id)kernelPredictorWithSourceTensor:(id)a3 weightsTensor:(id)a4 layout:(unint64_t)a5 kernelShape:(id)a6 dilationRates:(id)a7 name:(id)a8;
- (id)kernelPredictorWithSourceTensor:(id)a3 weightsTensor:(id)a4 layout:(unint64_t)a5 kernelShape:(id)a6 name:(id)a7;
- (id)localConvolutionDataGradientWithIncomingGradientTensor:(id)a3 weightTensor:(id)a4 dataLayout:(unint64_t)a5 kernelShape:(id)a6 dilationRateInX:(unint64_t)a7 dilationRateInY:(unint64_t)a8 name:(id)a9;
- (id)localConvolutionWeightGradientWithIncomingGradientTensor:(id)a3 sourceTensor:(id)a4 dataLayout:(unint64_t)a5 kernelShape:(id)a6 dilationRateInX:(unint64_t)a7 dilationRateInY:(unint64_t)a8 name:(id)a9;
- (id)localConvolutionWithSourceTensor:(id)a3 weightTensor:(id)a4 dataLayout:(unint64_t)a5 kernelShape:(id)a6 dilationRateInX:(unint64_t)a7 dilationRateInY:(unint64_t)a8 name:(id)a9;
- (id)lossReductionWithTensor:(id)a3 reductionType:(unint64_t)a4 axis:(int64_t *)a5 name:(id)a6;
- (id)makeListWithElementType:(id)a3 maxSize:(unint64_t)a4 name:(id)a5;
- (id)makeListWithElementType:(id)a3 name:(id)a4;
- (id)mathOpsWithTensors:(id)a3 mathOpType:(unint64_t)a4 name:(id)a5;
- (id)matrixMultiplicationPrimaryGradientWithIncomingGradientTensor:(id)a3 primaryTensor:(id)a4 secondaryTensor:(id)a5 name:(id)a6;
- (id)matrixMultiplicationSecondaryGradientWithIncomingGradientTensor:(id)a3 primaryTensor:(id)a4 secondaryTensor:(id)a5 name:(id)a6;
- (id)maxPooling2DLayerWithTensor:(id)a3 kernelSizes:(id)a4 strides:(id)a5 paddingStyle:(unint64_t)a6 dataLayout:(unint64_t)a7 name:(id)a8;
- (id)momentumUpdateWithBetaTensor:(id)a3 momentumTensor:(id)a4 gradientTensor:(id)a5 name:(id)a6;
- (id)operationWithName:(id)a3;
- (id)padGradientWithIncomingGradientTensor:(id)a3 inputTensor:(id)a4 paddingMode:(int64_t)a5 paddingTensor:(id)a6 constantValuesTensor:(id)a7 name:(id)a8;
- (id)padGradientWithIncomingGradientTensor:(id)a3 sourceTensor:(id)a4 paddingMode:(int64_t)a5 paddingTensor:(id)a6 name:(id)a7;
- (id)padTensor:(id)a3 paddingMode:(int64_t)a4 paddingTensor:(id)a5 constantValuesTensor:(id)a6 name:(id)a7;
- (id)paddingTensorWithLeftPadding:(id)a3 rightPadding:(id)a4;
- (id)popBackFromList:(id)a3 outputList:(id *)a4 name:(id)a5;
- (id)progressRandomStateTensor:(id)a3 forShape:(id)a4 name:(id)a5;
- (id)progressRandomStateTensor:(id)a3 forShapeTensor:(id)a4 name:(id)a5;
- (id)prunedGradientTensorWithDescriptor:(id)a3 inputTensor:(id)a4 gradientTensor:(id)a5 shape:(id)a6 name:(id)a7;
- (id)prunedTensorWithDescriptor:(id)a3 tensor:(id)a4 shape:(id)a5 name:(id)a6;
- (id)pushBackToList:(id)a3 element:(id)a4 name:(id)a5;
- (id)quantizeTensor:(id)a3 scale:(double)a4 zeroPoint:(double)a5 dtype:(unsigned int)a6 name:(id)a7;
- (id)quantizeTensor:(id)a3 scaleTensor:(id)a4 zeroPoint:(double)a5 dtype:(unsigned int)a6 axis:(int)a7 name:(id)a8;
- (id)quantizeTensor:(id)a3 scaleTensor:(id)a4 zeroPointTensor:(id)a5 dtype:(unsigned int)a6 axis:(int)a7 name:(id)a8;
- (id)quantizedGatherWithUpdatesTensor:(id)a3 indicesTensor:(id)a4 scaleTensor:(id)a5 zeroPointTensor:(id)a6 minTensor:(id)a7 dequantDataType:(unsigned int)a8 axis:(unint64_t)a9 batchDimensions:(unint64_t)a10 name:(id)a11;
- (id)rankOfTensor:(id)a3 name:(id)a4;
- (id)reciprocalSquareRootWithTensor:(id)a3 name:(id)a4;
- (id)reductionSumWithTensor:(id)a3 axesTensor:(id)a4 name:(id)a5;
- (id)resizeTensor:(id)a3 sizeTensor:(id)a4 mode:(unint64_t)a5 nearestRoundingMode:(unint64_t)a6 centerResult:(BOOL)a7 alignCorners:(BOOL)a8 layout:(unint64_t)a9 name:(id)a10;
- (id)resizeTensor:(id)a3 sizeTensor:(id)a4 mode:(unint64_t)a5 nearestRoundingMode:(unint64_t)a6 centerResult:(BOOL)a7 alignCorners:(BOOL)a8 name:(id)a9;
- (id)resizeTensor:(id)a3 sizeTensor:(id)a4 scaleOffsetTensor:(id)a5 mode:(unint64_t)a6 nearestRoundingMode:(unint64_t)a7 layout:(unint64_t)a8 name:(id)a9;
- (id)resizeTensor:(id)a3 sizeTensor:(id)a4 scaleTensor:(id)a5 offsetTensor:(id)a6 mode:(unint64_t)a7 nearestRoundingMode:(unint64_t)a8 name:(id)a9;
- (id)resizeWithGradientTensor:(id)a3 input:(id)a4 mode:(unint64_t)a5 nearestRoundingMode:(unint64_t)a6 centerResult:(BOOL)a7 alignCorners:(BOOL)a8 layout:(unint64_t)a9 name:(id)a10;
- (id)resizeWithGradientTensor:(id)a3 input:(id)a4 scaleOffsetTensor:(id)a5 mode:(unint64_t)a6 nearestRoundingMode:(unint64_t)a7 layout:(unint64_t)a8 name:(id)a9;
- (id)resizeWithGradientTensor:(id)a3 input:(id)a4 scaleTensor:(id)a5 offsetTensor:(id)a6 mode:(unint64_t)a7 nearestRoundingMode:(unint64_t)a8 name:(id)a9;
- (id)runAsyncWithDevice:(id)a3 feeds:(id)a4 targetTensors:(id)a5 targetOperations:(id)a6 executionDescriptor:(id)a7;
- (id)runInternalWithMPSCommandBuffer:(id)a3 feeds:(id)a4 targetTensors:(id)a5 targetOperations:(id)a6 resultsDictionary:(id)a7 executionDescriptor:(id)a8 mpsGraphOwnedCommandBuffer:(BOOL)a9;
- (id)runInternalWithMPSGraphDevice:(id)a3 feeds:(id)a4 targetTensors:(id)a5 targetOperations:(id)a6 resultsDictionary:(id)a7 executionDescriptor:(id)a8;
- (id)runInternalWithMTLCommandQueue:(id)a3 feeds:(id)a4 targetTensors:(id)a5 targetOperations:(id)a6 resultsDictionary:(id)a7 executionDescriptor:(id)a8;
- (id)runWithDevice:(id)a3 feeds:(id)a4 targetTensors:(id)a5 targetOperations:(id)a6 executionDescriptor:(id)a7;
- (id)sampleGridDataGradientWithIncomingGradientTensor:(id)a3 coordinateTensor:(id)a4 outputShape:(id)a5 normalizeCoordinates:(BOOL)a6 relativeCoordinates:(BOOL)a7 paddingMode:(int64_t)a8 samplingMode:(unint64_t)a9 name:(id)a10;
- (id)sampleGridDataGradientWithIncomingGradientTensor:(id)a3 coordinateTensor:(id)a4 outputShapeTensor:(id)a5 normalizeCoordinates:(BOOL)a6 relativeCoordinates:(BOOL)a7 paddingMode:(int64_t)a8 samplingMode:(unint64_t)a9 name:(id)a10;
- (id)sampleGridWithSourceTensor:(id)a3 coordinateTensor:(id)a4 layout:(unint64_t)a5 normalizeCoordinates:(BOOL)a6 relativeCoordinates:(BOOL)a7 alignCorners:(BOOL)a8 paddingMode:(int64_t)a9 samplingMode:(unint64_t)a10 nearestRoundingMode:(unint64_t)a11 constantValue:(double)a12 name:(id)a13;
- (id)sampleGridWithSourceTensor:(id)a3 coordinateTensor:(id)a4 normalizeCoordinates:(BOOL)a5 relativeCoordinates:(BOOL)a6 paddingMode:(int64_t)a7 samplingMode:(unint64_t)a8 constantValue:(double)a9 name:(id)a10;
- (id)scaledDotProductAttentionWithQueryTensor:(id)a3 keyTensor:(id)a4 valueTensor:(id)a5 maskTensor:(id)a6 scale:(float)a7 name:(id)a8;
- (id)scaledDotProductAttentionWithQueryTensor:(id)a3 keyTensor:(id)a4 valueTensor:(id)a5 scale:(float)a6 name:(id)a7;
- (id)scatterAlongAxisWithDataTensor:(id)a3 updatesTensor:(id)a4 indicesTensor:(id)a5 axis:(int64_t)a6 mode:(int64_t)a7 name:(id)a8;
- (id)scatterAlongAxisWithDataTensor:(id)a3 updatesTensor:(id)a4 indicesTensor:(id)a5 axis:(int64_t)a6 name:(id)a7;
- (id)scatterAlongAxisWithUpdatesTensor:(id)a3 indicesTensor:(id)a4 shape:(id)a5 axis:(int64_t)a6 mode:(int64_t)a7 name:(id)a8;
- (id)scatterAlongAxisWithUpdatesTensor:(id)a3 indicesTensor:(id)a4 shape:(id)a5 axis:(int64_t)a6 name:(id)a7;
- (id)scatterWithDataTensor:(id)a3 updatesTensor:(id)a4 indicesTensor:(id)a5 axis:(int64_t)a6 name:(id)a7;
- (id)scatterWithUpdatesTensor:(id)a3 indicesTensor:(id)a4 shape:(id)a5 axis:(int64_t)a6 name:(id)a7;
- (id)sizeOfTensor:(id)a3 name:(id)a4;
- (id)sliceGradientTensor:(id)a3 fwdInShapeTensor:(id)a4 startTensor:(id)a5 endTensor:(id)a6 strideTensor:(id)a7 startMask:(unsigned int)a8 endMask:(unsigned int)a9 squeezeMask:(unsigned int)a10 name:(id)a11;
- (id)sliceGradientTensor:(id)a3 fwdInShapeTensor:(id)a4 startTensor:(id)a5 sizeTensor:(id)a6 squeezeMask:(unsigned int)a7 name:(id)a8;
- (id)sliceTensor:(id)a3 startTensor:(id)a4 endTensor:(id)a5 strideTensor:(id)a6 startMask:(unsigned int)a7 endMask:(unsigned int)a8 squeezeMask:(unsigned int)a9 name:(id)a10;
- (id)sliceTensor:(id)a3 startTensor:(id)a4 sizeTensor:(id)a5 squeezeMask:(unsigned int)a6 name:(id)a7;
- (id)sliceUpdateDataTensor:(id)a3 updateTensor:(id)a4 starts:(id)a5 ends:(id)a6 strides:(id)a7 name:(id)a8;
- (id)sliceUpdateDataTensor:(id)a3 updateTensor:(id)a4 starts:(id)a5 ends:(id)a6 strides:(id)a7 startMask:(unsigned int)a8 endMask:(unsigned int)a9 squeezeMask:(unsigned int)a10 name:(id)a11;
- (id)sliceUpdateDataTensor:(id)a3 updateTensor:(id)a4 startsTensor:(id)a5 endsTensor:(id)a6 stridesTensor:(id)a7 name:(id)a8;
- (id)sliceUpdateDataTensor:(id)a3 updateTensor:(id)a4 startsTensor:(id)a5 endsTensor:(id)a6 stridesTensor:(id)a7 startMask:(unsigned int)a8 endMask:(unsigned int)a9 squeezeMask:(unsigned int)a10 name:(id)a11;
- (id)solveLUWithDecompositionTensor:(id)a3 rhsTensor:(id)a4 name:(id)a5;
- (id)solveWithDecompositionTensor:(id)a3 rhsTensor:(id)a4 descriptor:(id)a5 name:(id)a6;
- (id)squaredErrorWithPrimaryTensor:(id)a3 secondaryTensor:(id)a4 reductionType:(unint64_t)a5 name:(id)a6;
- (id)squeezeTensor:(id)a3 dimension:(unint64_t)a4 name:(id)a5;
- (id)squeezeTensor:(id)a3 dimensionTensor:(id)a4 name:(id)a5;
- (id)stencilWithSourceTensor:(id)a3 weightsTensor:(id)a4 offsets:(id)a5 name:(id)a6;
- (id)stitchedOpsWithBlock:(id)a3 name:(id)a4;
- (id)tileGradientWithIncomingGradientTensor:(id)a3 sourceTensor:(id)a4 multiplierTensor:(id)a5 name:(id)a6;
- (id)tileTensor:(id)a3 multiplierTensor:(id)a4 name:(id)a5;
- (id)tileTensorWithMultiplier:(id)a3;
- (id)traininableHighLevelOpVariables;
- (id)transposeTensor:(id)a3 permute:(id)a4 name:(id)a5;
- (id)varFromTensorWithTensor:(id)a3 name:(id)a4;
- (id)variableFromTensorWithTensor:(id)a3 name:(id)a4;
- (id)variableOps;
- (id)velocityUpdateWithBetaTensor:(id)a3 velocityTensor:(id)a4 gradientTensor:(id)a5 name:(id)a6;
- (unint64_t)compilerOptions;
- (unint64_t)getExecutableCacheSize;
- (void)dealloc;
- (void)dump;
- (void)encodeToCommandBuffer:(MPSCommandBuffer *)commandBuffer feeds:(MPSGraphTensorDataDictionary *)feeds targetOperations:(NSArray *)targetOperations resultsDictionary:(MPSGraphTensorDataDictionary *)resultsDictionary executionDescriptor:(MPSGraphExecutionDescriptor *)executionDescriptor;
- (void)runAsyncWithDevice:(id)a3 feeds:(id)a4 targetOperations:(id)a5 resultsDictionary:(id)a6 executionDescriptor:(id)a7;
- (void)runAsyncWithMTLCommandQueue:(id)commandQueue feeds:(MPSGraphTensorDataDictionary *)feeds targetOperations:(NSArray *)targetOperations resultsDictionary:(MPSGraphTensorDataDictionary *)resultsDictionary executionDescriptor:(MPSGraphExecutionDescriptor *)executionDescriptor;
- (void)runWithDevice:(id)a3 feeds:(id)a4 targetOperations:(id)a5 resultsDictionary:(id)a6 executionDescriptor:(id)a7;
- (void)runWithMTLCommandQueue:(id)commandQueue feeds:(MPSGraphTensorDataDictionary *)feeds targetOperations:(NSArray *)targetOperations resultsDictionary:(MPSGraphTensorDataDictionary *)resultsDictionary;
- (void)setCompilerOptions:(unint64_t)a3;
- (void)setOptions:(MPSGraphOptions)options;
- (void)setPruneGraph:(BOOL)a3;
- (void)setTensorNameDict:(id)a3;
@end

@implementation MPSGraph

- (id)batchNormalizationLayerWithTensor:(id)a3 batchNormalizationGammaInitializer:(id)a4 batchNormalizationBetaInitializer:(id)a5 batchNormalizationMeanInitializer:(id)a6 batchNormalizationVarianceInitializer:(id)a7 batchNormalizationEpsilon:(double)a8 dataLayout:(unint64_t)a9 name:(id)a10
{
  v67[1] = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v63 = a4;
  id v62 = a5;
  id v18 = a6;
  id v61 = a7;
  id v19 = a10;
  id v20 = v17;
  v21 = v20;
  if (v18 || v63 || v62 || (v22 = v20, v61))
  {
    v23 = [v20 shape];
    v57 = v23;
    if (a9)
    {
      if (a9 == 1)
      {
        v24 = [v23 objectAtIndexedSubscript:3];
        uint64_t v25 = [v24 unsignedIntegerValue];
        v26 = &unk_1EC9F1E38;

        if (!v19)
        {
LABEL_8:
          uint64_t v27 = [@"batchNormalization" stringByAppendingString:@"/mean"];
LABEL_15:
          v29 = (void *)v27;
          v59 = [(MPSGraph *)self meanOfTensor:v21 axes:v26 name:v27];

          if (v19) {
            [v19 stringByAppendingString:@"/batchNormalization/variance"];
          }
          else {
          v30 = [@"batchNormalization" stringByAppendingString:@"/variance"];
          }
          v58 = [(MPSGraph *)self varianceOfTensor:v21 meanTensor:v59 axes:v26 name:v30];

          if (v63)
          {
            v31 = [v63 initializedDataWithNumberOfValues:v25 dataType:268435488];
            v32 = [NSNumber numberWithInteger:v25];
            v67[0] = v32;
            v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:1];
            if (v19) {
              [v19 stringByAppendingString:@"/batchNormalization/gammaVariable"];
            }
            else {
            v34 = [@"batchNormalization" stringByAppendingString:@"/gammaVariable"];
            }
            v60 = [(MPSGraph *)self variableWithData:v31 shape:v33 dataType:268435488 name:v34];

            traininableHighLevelOpVariables = self->_traininableHighLevelOpVariables;
            v36 = [v60 operation];
            [(NSMutableArray *)traininableHighLevelOpVariables addObject:v36];
          }
          else
          {
            v60 = 0;
          }
          if (v62)
          {
            v37 = [v62 initializedDataWithNumberOfValues:v25 dataType:268435488];
            v38 = [NSNumber numberWithInteger:v25];
            v66 = v38;
            v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
            if (v19) {
              [v19 stringByAppendingString:@"/batchNormalization/betaVariable"];
            }
            else {
            v41 = [@"batchNormalization" stringByAppendingString:@"/betaVariable"];
            }
            v40 = [(MPSGraph *)self variableWithData:v37 shape:v39 dataType:268435488 name:v41];

            v42 = self->_traininableHighLevelOpVariables;
            v43 = [v40 operation];
            [(NSMutableArray *)v42 addObject:v43];
          }
          else
          {
            v40 = 0;
          }
          if (v18)
          {
            v44 = [v18 initializedDataWithNumberOfValues:v25 dataType:268435488];
            v45 = [NSNumber numberWithInteger:v25];
            v65 = v45;
            v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
            if (v19) {
              [v19 stringByAppendingString:@"/batchNormalization/runningMeanVariable"];
            }
            else {
            v47 = [@"batchNormalization" stringByAppendingString:@"/runningMeanVariable"];
            }
            v56 = [(MPSGraph *)self variableWithData:v44 shape:v46 dataType:268435488 name:v47];
          }
          else
          {
            v56 = 0;
          }
          if (v61)
          {
            v48 = [v61 initializedDataWithNumberOfValues:v25 dataType:268435488];
            v49 = [NSNumber numberWithInteger:v25];
            v64 = v49;
            v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
            if (v19) {
              [v19 stringByAppendingString:@"/batchNormalization/runningVarianceVariable"];
            }
            else {
            v52 = [@"batchNormalization" stringByAppendingString:@"/runningVarianceVariable"];
            }
            v51 = [(MPSGraph *)self variableWithData:v48 shape:v50 dataType:268435488 name:v52];
          }
          else
          {
            v51 = 0;
          }
          if (v19) {
            [v19 stringByAppendingString:@"/batchNormalization/normalization"];
          }
          else {
          v53 = [@"conv2DLayer" stringByAppendingString:@"/batchNormalization/normalization"];
          }
          *(float *)&double v54 = a8;
          v22 = [(MPSGraph *)self normalizationWithTensor:v21 meanTensor:v59 varianceTensor:v58 gammaTensor:v60 betaTensor:v40 epsilon:v53 name:v54];

          goto LABEL_46;
        }
      }
      else
      {
        if (MTLReportFailureTypeEnabled()) {
          MTLReportFailure();
        }
        uint64_t v25 = 0;
        v26 = 0;
        if (!v19) {
          goto LABEL_8;
        }
      }
    }
    else
    {
      v28 = [v23 objectAtIndexedSubscript:1];
      uint64_t v25 = [v28 unsignedIntegerValue];
      v26 = &unk_1EC9F1E20;

      if (!v19) {
        goto LABEL_8;
      }
    }
    uint64_t v27 = [v19 stringByAppendingString:@"/batchNormalization/mean"];
    goto LABEL_15;
  }
LABEL_46:

  return v22;
}

- (id)fullyConnectedLayerWithTensor:(id)a3 outputChannelCount:(unint64_t)a4 activationType:(unsigned int)a5 weightsInitializer:(id)a6 biasesInitializer:(id)a7 name:(id)a8
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v42 = a6;
  id v43 = a7;
  id v14 = a8;
  v40 = [v13 shape];
  v15 = objc_msgSend(v40, "objectAtIndexedSubscript:", objc_msgSend(v40, "count") - 1);
  uint64_t v16 = [v15 unsignedIntegerValue];

  id v17 = [NSNumber numberWithInteger:v16];
  v45[0] = v17;
  id v18 = [NSNumber numberWithInteger:a4];
  v45[1] = v18;
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];

  id v19 = [v42 initializedDataWithNumberOfValues:v16 * a4 dataType:268435488];
  if (v14) {
    [v14 stringByAppendingString:@"/weightsVariable"];
  }
  else {
  id v20 = [@"fullyConnectedLayer" stringByAppendingString:@"/weightsVariable"];
  }
  v21 = [(MPSGraph *)self variableWithData:v19 shape:v41 dataType:268435488 name:v20];

  traininableHighLevelOpVariables = self->_traininableHighLevelOpVariables;
  v23 = [v21 operation];
  [(NSMutableArray *)traininableHighLevelOpVariables addObject:v23];

  if (v14) {
    [v14 stringByAppendingString:@"/matMul"];
  }
  else {
  v24 = [@"fullyConnectedLayer" stringByAppendingString:@"/matMul"];
  }
  uint64_t v25 = [(MPSGraph *)self matrixMultiplicationWithPrimaryTensor:v13 secondaryTensor:v21 name:v24];

  id v26 = v25;
  uint64_t v27 = v26;
  if (v43)
  {
    v28 = [v43 initializedDataWithNumberOfValues:a4 dataType:268435488];
    v29 = [NSNumber numberWithInteger:a4];
    v44 = v29;
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
    if (v14) {
      [v14 stringByAppendingString:@"/biasAddVariable"];
    }
    else {
    v31 = [@"fullyConnectedLayer" stringByAppendingString:@"/biasAddVariable"];
    }
    v32 = [(MPSGraph *)self variableWithData:v28 shape:v30 dataType:268435488 name:v31];

    v33 = self->_traininableHighLevelOpVariables;
    v34 = [v32 operation];
    [(NSMutableArray *)v33 addObject:v34];

    if (v14) {
      [v14 stringByAppendingString:@"/biasAdd"];
    }
    else {
    v35 = [@"fullyConnectedLayer" stringByAppendingString:@"/biasAdd"];
    }
    uint64_t v27 = [(MPSGraph *)self additionWithPrimaryTensor:v26 secondaryTensor:v32 name:v35];
  }
  if (a5 == 1)
  {
    if (v14) {
      [v14 stringByAppendingString:@"/reLU"];
    }
    else {
    v36 = [@"fullyConnectedLayer" stringByAppendingString:@"/reLU"];
    }
    uint64_t v37 = [(MPSGraph *)self reLUWithTensor:v27 name:v36];

    uint64_t v27 = (void *)v37;
  }

  return v27;
}

- (id)avgPooling2DLayerWithTensor:(id)a3 kernelSizes:(id)a4 strides:(id)a5 paddingStyle:(unint64_t)a6 dataLayout:(unint64_t)a7 name:(id)a8
{
  id v27 = a3;
  id v11 = a4;
  id v12 = a5;
  id v26 = a8;
  id v13 = [v11 objectAtIndexedSubscript:1];
  uint64_t v14 = [v13 integerValue];
  v15 = [v11 objectAtIndexedSubscript:0];
  uint64_t v16 = [v15 integerValue];
  id v17 = [v12 objectAtIndexedSubscript:1];
  uint64_t v18 = [v17 integerValue];
  id v19 = [v12 objectAtIndexedSubscript:0];
  id v20 = +[MPSGraphPooling2DOpDescriptor descriptorWithKernelWidth:kernelHeight:strideInX:strideInY:paddingStyle:dataLayout:](MPSGraphPooling2DOpDescriptor, "descriptorWithKernelWidth:kernelHeight:strideInX:strideInY:paddingStyle:dataLayout:", v14, v16, v18, [v19 integerValue], a6, a7);

  v21 = [(MPSGraph *)self avgPooling2DWithSourceTensor:v27 descriptor:v20 name:v26];

  return v21;
}

- (id)convolution2DLayerWithTensor:(id)a3 kernelSizes:(id)a4 outputChannelCount:(unint64_t)a5 strides:(id)a6 dilationRates:(id)a7 groups:(unint64_t)a8 activationType:(unsigned int)a9 weightsInitializer:(id)a10 biasesInitializer:(id)a11 batchNormalizationGammaInitializer:(id)a12 batchNormalizationBetaInitializer:(id)a13 batchNormalizationMeanInitializer:(id)a14 batchNormalizationVarianceInitializer:(id)a15 batchNormalizationEpsilon:(double)a16 paddingStyle:(unint64_t)a17 dataLayout:(unint64_t)a18 weightsLayout:(unint64_t)a19 name:(id)a20
{
  v83[4] = *MEMORY[0x1E4F143B8];
  id v79 = a3;
  id v24 = a4;
  id v78 = a6;
  id v77 = a7;
  id v67 = a10;
  id v75 = a11;
  id v74 = a12;
  id v73 = a13;
  id v72 = a14;
  id v70 = a15;
  id v25 = a20;
  v69 = v24;
  id v26 = [v24 objectAtIndexedSubscript:0];
  uint64_t v27 = [v26 unsignedIntegerValue];

  v28 = [v24 objectAtIndexedSubscript:1];
  uint64_t v29 = [v28 unsignedIntegerValue];

  v66 = [v79 shape];
  if (a18)
  {
    if (a18 != 1)
    {
      if (MTLReportFailureTypeEnabled())
      {
        MTLReportFailure();
        uint64_t v32 = 0;
        if (a19 == 2) {
          goto LABEL_6;
        }
      }
      else
      {
        uint64_t v32 = 0;
        if (a19 == 2) {
          goto LABEL_6;
        }
      }
      goto LABEL_9;
    }
    v30 = [v66 objectAtIndexedSubscript:3];
    uint64_t v31 = [v30 unsignedIntegerValue];
  }
  else
  {
    v30 = [v66 objectAtIndexedSubscript:1];
    uint64_t v31 = [v30 unsignedIntegerValue];
  }
  uint64_t v32 = v31;

  if (a19 == 2)
  {
LABEL_6:
    v33 = [NSNumber numberWithInteger:a5];
    v82[0] = v33;
    v34 = [NSNumber numberWithInteger:v32];
    v82[1] = v34;
    v35 = [NSNumber numberWithInteger:v27];
    v82[2] = v35;
    v36 = [NSNumber numberWithInteger:v29];
    v82[3] = v36;
    v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:4];
LABEL_11:

    goto LABEL_18;
  }
LABEL_9:
  if (a19 == 3)
  {
    v33 = [NSNumber numberWithInteger:v27];
    v83[0] = v33;
    v34 = [NSNumber numberWithInteger:v29];
    v83[1] = v34;
    v35 = [NSNumber numberWithInteger:v32];
    v83[2] = v35;
    v36 = [NSNumber numberWithInteger:a5];
    v83[3] = v36;
    v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:4];
    goto LABEL_11;
  }
  if (MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  v68 = 0;
LABEL_18:
  uint64_t v37 = [v67 initializedDataWithNumberOfValues:v27 * a5 * v29 * v32 dataType:268435488];
  if (v25) {
    [v25 stringByAppendingString:@"/weightsVariable"];
  }
  else {
  v38 = [@"conv2DLayer" stringByAppendingString:@"/weightsVariable"];
  }
  v76 = [(MPSGraph *)self variableWithData:v37 shape:v68 dataType:268435488 name:v38];

  traininableHighLevelOpVariables = self->_traininableHighLevelOpVariables;
  v40 = [v76 operation];
  [(NSMutableArray *)traininableHighLevelOpVariables addObject:v40];

  v41 = [v78 objectAtIndexedSubscript:1];
  uint64_t v42 = [v41 integerValue];
  id v43 = [v78 objectAtIndexedSubscript:0];
  uint64_t v44 = [v43 integerValue];
  v45 = [v77 objectAtIndexedSubscript:1];
  uint64_t v46 = [v45 integerValue];
  v47 = [v77 objectAtIndexedSubscript:0];
  v48 = +[MPSGraphConvolution2DOpDescriptor descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingStyle:dataLayout:weightsLayout:](MPSGraphConvolution2DOpDescriptor, "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingStyle:dataLayout:weightsLayout:", v42, v44, v46, [v47 integerValue], a8, a17, a18, a19);

  if (v25) {
    [v25 stringByAppendingString:@"/conv2D"];
  }
  else {
  v49 = [@"conv2DLayer" stringByAppendingString:@"/conv2D"];
  }
  v50 = [(MPSGraph *)self convolution2DWithSourceTensor:v79 weightsTensor:v76 descriptor:v48 name:v49];

  id v51 = v50;
  v52 = v51;
  if (v75)
  {
    v53 = [v75 initializedDataWithNumberOfValues:a5 dataType:268435488];
    double v54 = [NSNumber numberWithInteger:a5];
    v81 = v54;
    v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
    if (v25) {
      [v25 stringByAppendingString:@"/biasAddVariable"];
    }
    else {
    v56 = [@"conv2DLayer" stringByAppendingString:@"/biasAddVariable"];
    }
    v57 = [(MPSGraph *)self variableWithData:v53 shape:v55 dataType:268435488 name:v56];

    v58 = self->_traininableHighLevelOpVariables;
    v59 = [v57 operation];
    [(NSMutableArray *)v58 addObject:v59];

    if (v25) {
      [v25 stringByAppendingString:@"/biasAdd"];
    }
    else {
    v60 = [@"conv2DLayer" stringByAppendingString:@"/biasAdd"];
    }
    v52 = [(MPSGraph *)self additionWithPrimaryTensor:v51 secondaryTensor:v57 name:v60];
  }
  if (v74 || v73 || v72 || v70)
  {
    uint64_t v61 = [(MPSGraph *)self batchNormalizationLayerWithTensor:v52 batchNormalizationGammaInitializer:v74 batchNormalizationBetaInitializer:v73 batchNormalizationMeanInitializer:v72 batchNormalizationVarianceInitializer:v70 batchNormalizationEpsilon:a18 dataLayout:a16 name:v25];

    v52 = (void *)v61;
    if (a9 != 1) {
      goto LABEL_43;
    }
LABEL_39:
    if (v25) {
      [v25 stringByAppendingString:@"/reLU"];
    }
    else {
    id v62 = [@"conv2DLayer" stringByAppendingString:@"/reLU"];
    }
    uint64_t v63 = [(MPSGraph *)self reLUWithTensor:v52 name:v62];

    v52 = (void *)v63;
    goto LABEL_43;
  }
  if (a9 == 1) {
    goto LABEL_39;
  }
LABEL_43:

  return v52;
}

- (id)convolution2DWithDefaultBatchNormalizationLayerWithTensor:(id)a3 kernelSizes:(id)a4 outputChannelCount:(unint64_t)a5 strides:(id)a6 activationType:(unsigned int)a7 weightsInitializer:(id)a8 biasesInitializer:(id)a9 paddingStyle:(unint64_t)a10 dataLayout:(unint64_t)a11 weightsLayout:(unint64_t)a12 name:(id)a13
{
  id v32 = a3;
  id v31 = a4;
  id v30 = a6;
  id v17 = a8;
  id v18 = a9;
  id v19 = a13;
  uint64_t v29 = v17;
  id v20 = +[MPSGraphVariableInitializer initializerWithOnes];
  v21 = +[MPSGraphVariableInitializer initializerWithZeros];
  v22 = +[MPSGraphVariableInitializer initializerWithZeros];
  v23 = +[MPSGraphVariableInitializer initializerWithZeros];
  LODWORD(v26) = a7;
  -[MPSGraph convolution2DLayerWithTensor:kernelSizes:outputChannelCount:strides:dilationRates:groups:activationType:weightsInitializer:biasesInitializer:batchNormalizationGammaInitializer:batchNormalizationBetaInitializer:batchNormalizationMeanInitializer:batchNormalizationVarianceInitializer:batchNormalizationEpsilon:paddingStyle:dataLayout:weightsLayout:name:](self, "convolution2DLayerWithTensor:kernelSizes:outputChannelCount:strides:dilationRates:groups:activationType:weightsInitializer:biasesInitializer:batchNormalizationGammaInitializer:batchNormalizationBetaInitializer:batchNormalizationMeanInitializer:batchNormalizationVarianceInitializer:batchNormalizationEpsilon:paddingStyle:dataLayout:weightsLayout:name:", v32, v31, a5, v30, &unk_1EC9F1E68, 1, 0.001, v26, v29, v18, v20, v21, v22, v23, a10,
    a11,
    a12,
  id v24 = v19);

  return v24;
}

- (id)decompositionLUWithTensor:(id)a3 name:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MPSGraphMatrixDecompositionOp alloc];
  v13[0] = v6;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v10 = [(MPSGraphOperation *)v8 initWithGraph:self inputTensors:v9 controlDependencies:MEMORY[0x1E4F1CBF0] name:v7];

  id v11 = [(MPSGraphOperation *)v10 outputTensors];

  return v11;
}

- (id)decompositionWithTensor:(id)a3 descriptor:(id)a4 name:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 decompositionType]) {
    __assert_rtn("-[MPSGraph(MPSGraphMatrixDecompositionOps) decompositionWithTensor:descriptor:name:]", "MPSGraphMatrixDecompositionOps.mm", 82, "(desc.decompositionType == MPSGraphMatrixDecompositionLU) && \"unsupported decomposition type\"");
  }
  id v11 = [MPSGraphMatrixDecompositionOp alloc];
  v16[0] = v8;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v13 = [(MPSGraphOperation *)v11 initWithGraph:self inputTensors:v12 controlDependencies:MEMORY[0x1E4F1CBF0] name:v10];

  uint64_t v14 = [(MPSGraphOperation *)v13 outputTensors];

  return v14;
}

- (id)sampleGridWithSourceTensor:(id)a3 coordinateTensor:(id)a4 layout:(unint64_t)a5 normalizeCoordinates:(BOOL)a6 relativeCoordinates:(BOOL)a7 alignCorners:(BOOL)a8 paddingMode:(int64_t)a9 samplingMode:(unint64_t)a10 nearestRoundingMode:(unint64_t)a11 constantValue:(double)a12 name:(id)a13
{
  BOOL v31 = a7;
  BOOL v15 = a6;
  v35[3] = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v33 = a4;
  id v34 = a13;
  if (a9 == 4) {
    int64_t v20 = 0;
  }
  else {
    int64_t v20 = a9;
  }
  id v32 = v19;
  uint64_t v21 = [v19 dataType];
  double v22 = 0.0;
  if (a9 != 4) {
    double v22 = a12;
  }
  v23 = [(MPSGraph *)self constantWithScalar:&unk_1EC9F00F8 shape:v21 dataType:v22];
  id v24 = [MPSGraphSampleGridOp alloc];
  v35[0] = v19;
  v35[1] = v33;
  v35[2] = v23;
  id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];
  LOBYTE(v30) = a8;
  uint64_t v26 = [(MPSGraphSampleGridOp *)v24 initWithGraph:self inputTensors:v25 controlDependencies:MEMORY[0x1E4F1CBF0] layout:a5 normalizeCoordinates:v15 relativeCoordinates:v31 alignCorners:v30 paddingMode:v20 samplingMode:a10 nearestRoundingMode:a11 name:v34];

  uint64_t v27 = [(MPSGraphOperation *)v26 outputTensors];
  v28 = [v27 objectAtIndexedSubscript:0];

  return v28;
}

- (MPSGraphTensor)sampleGridWithSourceTensor:(MPSGraphTensor *)source coordinateTensor:(MPSGraphTensor *)coordinates layout:(MPSGraphTensorNamedDataLayout)layout normalizeCoordinates:(BOOL)normalizeCoordinates relativeCoordinates:(BOOL)relativeCoordinates alignCorners:(BOOL)alignCorners paddingMode:(MPSGraphPaddingMode)paddingMode samplingMode:(MPSGraphResizeMode)samplingMode constantValue:(double)constantValue name:(NSString *)name
{
  id v12 = [(MPSGraph *)self sampleGridWithSourceTensor:source coordinateTensor:coordinates layout:layout normalizeCoordinates:normalizeCoordinates relativeCoordinates:relativeCoordinates alignCorners:alignCorners paddingMode:constantValue samplingMode:paddingMode nearestRoundingMode:samplingMode constantValue:0 name:name];

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)sampleGridWithSourceTensor:(MPSGraphTensor *)source coordinateTensor:(MPSGraphTensor *)coordinates layout:(MPSGraphTensorNamedDataLayout)layout normalizeCoordinates:(BOOL)normalizeCoordinates relativeCoordinates:(BOOL)relativeCoordinates alignCorners:(BOOL)alignCorners paddingMode:(MPSGraphPaddingMode)paddingMode nearestRoundingMode:(MPSGraphResizeNearestRoundingMode)nearestRoundingMode constantValue:(double)constantValue name:(NSString *)name
{
  id v12 = [(MPSGraph *)self sampleGridWithSourceTensor:source coordinateTensor:coordinates layout:layout normalizeCoordinates:normalizeCoordinates relativeCoordinates:relativeCoordinates alignCorners:alignCorners paddingMode:constantValue samplingMode:paddingMode nearestRoundingMode:0 constantValue:nearestRoundingMode name:name];

  return (MPSGraphTensor *)v12;
}

- (id)sampleGridWithSourceTensor:(id)a3 coordinateTensor:(id)a4 normalizeCoordinates:(BOOL)a5 relativeCoordinates:(BOOL)a6 paddingMode:(int64_t)a7 samplingMode:(unint64_t)a8 constantValue:(double)a9 name:(id)a10
{
  id v10 = [(MPSGraph *)self sampleGridWithSourceTensor:a3 coordinateTensor:a4 layout:1 normalizeCoordinates:a5 relativeCoordinates:a6 alignCorners:0 paddingMode:a9 samplingMode:a7 constantValue:a8 name:a10];

  return v10;
}

- (id)sampleGridDataGradientWithIncomingGradientTensor:(id)a3 coordinateTensor:(id)a4 outputShapeTensor:(id)a5 normalizeCoordinates:(BOOL)a6 relativeCoordinates:(BOOL)a7 paddingMode:(int64_t)a8 samplingMode:(unint64_t)a9 name:(id)a10
{
  BOOL v26 = a7;
  BOOL v11 = a6;
  v27[3] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a10;
  if (a8 == 4) {
    a8 = 0;
  }
  id v25 = v15;
  id v19 = [MPSGraphSampleGridDataGradientOp alloc];
  v27[0] = v15;
  v27[1] = v16;
  v27[2] = v17;
  int64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
  uint64_t v21 = [(MPSGraphSampleGridDataGradientOp *)v19 initWithGraph:self inputTensors:v20 controlDependencies:MEMORY[0x1E4F1CBF0] normalizeCoordinates:v11 relativeCoordinates:v26 paddingMode:a8 samplingMode:a9 name:v18];

  double v22 = [(MPSGraphOperation *)v21 outputTensors];
  v23 = [v22 objectAtIndexedSubscript:0];

  return v23;
}

- (id)sampleGridDataGradientWithIncomingGradientTensor:(id)a3 coordinateTensor:(id)a4 outputShape:(id)a5 normalizeCoordinates:(BOOL)a6 relativeCoordinates:(BOOL)a7 paddingMode:(int64_t)a8 samplingMode:(unint64_t)a9 name:(id)a10
{
  BOOL v24 = a7;
  BOOL v11 = a6;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a10;
  unint64_t v18 = 0;
  if (a8 == 4) {
    a8 = 0;
  }
  long long v26 = xmmword_18112A9B0;
  while (v18 < [v16 count])
  {
    id v19 = [v16 objectAtIndexedSubscript:v18];
    *((_DWORD *)&v26 + v18) = [v19 intValue];

    ++v18;
  }
  int64_t v20 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v26 length:16];
  uint64_t v21 = [(MPSGraph *)self constantWithData:v20 shape:&unk_1EC9F0110 dataType:536870944];

  double v22 = [(MPSGraph *)self sampleGridDataGradientWithIncomingGradientTensor:v25 coordinateTensor:v15 outputShapeTensor:v21 normalizeCoordinates:v11 relativeCoordinates:v24 paddingMode:a8 samplingMode:a9 name:v17];

  return v22;
}

- (MPSGraphTensor)imToColWithSourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphImToColOpDescriptor *)descriptor name:(NSString *)name
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = source;
  id v9 = descriptor;
  id v10 = name;
  BOOL v11 = [MPSGraphImToColOp alloc];
  v17[0] = v8;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  id v13 = [(MPSGraphImToColOp *)v11 initWithGraph:self inputTensors:v12 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v9 name:v10];

  uint64_t v14 = [(MPSGraphOperation *)v13 outputTensors];
  id v15 = [v14 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v15;
}

- (MPSGraphTensor)colToImWithSourceTensor:(MPSGraphTensor *)source outputShape:(MPSShape *)outputShape descriptor:(MPSGraphImToColOpDescriptor *)descriptor name:(NSString *)name
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = source;
  BOOL v11 = outputShape;
  id v12 = descriptor;
  id v13 = name;
  uint64_t v14 = [(MPSShape *)v11 objectAtIndexedSubscript:0];
  v27[0] = [v14 intValue];

  id v15 = [(MPSShape *)v11 objectAtIndexedSubscript:1];
  v27[1] = [v15 intValue];

  id v16 = [(MPSShape *)v11 objectAtIndexedSubscript:2];
  v27[2] = [v16 intValue];

  id v17 = [(MPSShape *)v11 objectAtIndexedSubscript:3];
  v27[3] = [v17 intValue];

  unint64_t v18 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v27 length:16];
  id v19 = [(MPSGraph *)self constantWithData:v18 shape:&unk_1EC9F0128 dataType:536870944];

  int64_t v20 = [MPSGraphColToImOp alloc];
  v26[0] = v10;
  v26[1] = v19;
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  double v22 = [(MPSGraphColToImOp *)v20 initWithGraph:self inputTensors:v21 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v12 outputShape:v11 name:v13];

  v23 = [(MPSGraphOperation *)v22 outputTensors];
  BOOL v24 = [v23 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v24;
}

- (MPSGraphTensor)cumulativeSumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis exclusive:(BOOL)exclusive reverse:(BOOL)reverse name:(NSString *)name
{
  BOOL v8 = reverse;
  BOOL v9 = exclusive;
  v21[2] = *MEMORY[0x1E4F143B8];
  id v12 = tensor;
  id v13 = name;
  uint64_t v14 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)axis];
  id v15 = [MPSGraphCumulativeSumOp alloc];
  v21[0] = v12;
  v21[1] = v14;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  id v17 = [(MPSGraphCumulativeBaseOp *)v15 initWithGraph:self inputTensors:v16 controlDependencies:MEMORY[0x1E4F1CBF0] exclusive:v9 reverse:v8 name:v13];

  unint64_t v18 = [(MPSGraphOperation *)v17 outputTensors];
  id v19 = [v18 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v19;
}

- (MPSGraphTensor)cumulativeSumWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor exclusive:(BOOL)exclusive reverse:(BOOL)reverse name:(NSString *)name
{
  BOOL v8 = reverse;
  BOOL v9 = exclusive;
  v21[2] = *MEMORY[0x1E4F143B8];
  id v12 = tensor;
  id v13 = axisTensor;
  uint64_t v14 = name;
  id v15 = [MPSGraphCumulativeSumOp alloc];
  v21[0] = v12;
  v21[1] = v13;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  id v17 = [(MPSGraphCumulativeBaseOp *)v15 initWithGraph:self inputTensors:v16 controlDependencies:MEMORY[0x1E4F1CBF0] exclusive:v9 reverse:v8 name:v14];

  unint64_t v18 = [(MPSGraphOperation *)v17 outputTensors];
  id v19 = [v18 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v19;
}

- (MPSGraphTensor)cumulativeProductWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis exclusive:(BOOL)exclusive reverse:(BOOL)reverse name:(NSString *)name
{
  BOOL v8 = reverse;
  BOOL v9 = exclusive;
  v21[2] = *MEMORY[0x1E4F143B8];
  id v12 = tensor;
  id v13 = name;
  uint64_t v14 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)axis];
  id v15 = [MPSGraphCumulativeProductOp alloc];
  v21[0] = v12;
  v21[1] = v14;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  id v17 = [(MPSGraphCumulativeBaseOp *)v15 initWithGraph:self inputTensors:v16 controlDependencies:MEMORY[0x1E4F1CBF0] exclusive:v9 reverse:v8 name:v13];

  unint64_t v18 = [(MPSGraphOperation *)v17 outputTensors];
  id v19 = [v18 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v19;
}

- (MPSGraphTensor)cumulativeProductWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor exclusive:(BOOL)exclusive reverse:(BOOL)reverse name:(NSString *)name
{
  BOOL v8 = reverse;
  BOOL v9 = exclusive;
  v21[2] = *MEMORY[0x1E4F143B8];
  id v12 = tensor;
  id v13 = axisTensor;
  uint64_t v14 = name;
  id v15 = [MPSGraphCumulativeProductOp alloc];
  v21[0] = v12;
  v21[1] = v13;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  id v17 = [(MPSGraphCumulativeBaseOp *)v15 initWithGraph:self inputTensors:v16 controlDependencies:MEMORY[0x1E4F1CBF0] exclusive:v9 reverse:v8 name:v14];

  unint64_t v18 = [(MPSGraphOperation *)v17 outputTensors];
  id v19 = [v18 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v19;
}

- (MPSGraphTensor)cumulativeMaximumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis exclusive:(BOOL)exclusive reverse:(BOOL)reverse name:(NSString *)name
{
  BOOL v8 = reverse;
  BOOL v9 = exclusive;
  v21[2] = *MEMORY[0x1E4F143B8];
  id v12 = tensor;
  id v13 = name;
  uint64_t v14 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)axis];
  id v15 = [MPSGraphCumulativeMaximumOp alloc];
  v21[0] = v12;
  v21[1] = v14;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  id v17 = [(MPSGraphCumulativeBaseOp *)v15 initWithGraph:self inputTensors:v16 controlDependencies:MEMORY[0x1E4F1CBF0] exclusive:v9 reverse:v8 name:v13];

  unint64_t v18 = [(MPSGraphOperation *)v17 outputTensors];
  id v19 = [v18 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v19;
}

- (MPSGraphTensor)cumulativeMaximumWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor exclusive:(BOOL)exclusive reverse:(BOOL)reverse name:(NSString *)name
{
  BOOL v8 = reverse;
  BOOL v9 = exclusive;
  v21[2] = *MEMORY[0x1E4F143B8];
  id v12 = tensor;
  id v13 = axisTensor;
  uint64_t v14 = name;
  id v15 = [MPSGraphCumulativeMaximumOp alloc];
  v21[0] = v12;
  v21[1] = v13;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  id v17 = [(MPSGraphCumulativeBaseOp *)v15 initWithGraph:self inputTensors:v16 controlDependencies:MEMORY[0x1E4F1CBF0] exclusive:v9 reverse:v8 name:v14];

  unint64_t v18 = [(MPSGraphOperation *)v17 outputTensors];
  id v19 = [v18 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v19;
}

- (MPSGraphTensor)cumulativeMinimumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis exclusive:(BOOL)exclusive reverse:(BOOL)reverse name:(NSString *)name
{
  BOOL v8 = reverse;
  BOOL v9 = exclusive;
  v21[2] = *MEMORY[0x1E4F143B8];
  id v12 = tensor;
  id v13 = name;
  uint64_t v14 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)axis];
  id v15 = [MPSGraphCumulativeMinimumOp alloc];
  v21[0] = v12;
  v21[1] = v14;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  id v17 = [(MPSGraphCumulativeBaseOp *)v15 initWithGraph:self inputTensors:v16 controlDependencies:MEMORY[0x1E4F1CBF0] exclusive:v9 reverse:v8 name:v13];

  unint64_t v18 = [(MPSGraphOperation *)v17 outputTensors];
  id v19 = [v18 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v19;
}

- (MPSGraphTensor)cumulativeMinimumWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor exclusive:(BOOL)exclusive reverse:(BOOL)reverse name:(NSString *)name
{
  BOOL v8 = reverse;
  BOOL v9 = exclusive;
  v21[2] = *MEMORY[0x1E4F143B8];
  id v12 = tensor;
  id v13 = axisTensor;
  uint64_t v14 = name;
  id v15 = [MPSGraphCumulativeMinimumOp alloc];
  v21[0] = v12;
  v21[1] = v13;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  id v17 = [(MPSGraphCumulativeBaseOp *)v15 initWithGraph:self inputTensors:v16 controlDependencies:MEMORY[0x1E4F1CBF0] exclusive:v9 reverse:v8 name:v14];

  unint64_t v18 = [(MPSGraphOperation *)v17 outputTensors];
  id v19 = [v18 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v19;
}

- (MPSGraphTensor)cumulativeSumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  v5 = [(MPSGraph *)self cumulativeSumWithTensor:tensor axis:axis exclusive:0 reverse:0 name:name];

  return (MPSGraphTensor *)v5;
}

- (MPSGraphTensor)cumulativeSumWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor name:(NSString *)name
{
  v5 = [(MPSGraph *)self cumulativeSumWithTensor:tensor axisTensor:axisTensor exclusive:0 reverse:0 name:name];

  return (MPSGraphTensor *)v5;
}

- (MPSGraphTensor)cumulativeProductWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  v5 = [(MPSGraph *)self cumulativeProductWithTensor:tensor axis:axis exclusive:0 reverse:0 name:name];

  return (MPSGraphTensor *)v5;
}

- (MPSGraphTensor)cumulativeProductWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor name:(NSString *)name
{
  v5 = [(MPSGraph *)self cumulativeProductWithTensor:tensor axisTensor:axisTensor exclusive:0 reverse:0 name:name];

  return (MPSGraphTensor *)v5;
}

- (MPSGraphTensor)cumulativeMaximumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  v5 = [(MPSGraph *)self cumulativeMaximumWithTensor:tensor axis:axis exclusive:0 reverse:0 name:name];

  return (MPSGraphTensor *)v5;
}

- (MPSGraphTensor)cumulativeMaximumWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor name:(NSString *)name
{
  v5 = [(MPSGraph *)self cumulativeMaximumWithTensor:tensor axisTensor:axisTensor exclusive:0 reverse:0 name:name];

  return (MPSGraphTensor *)v5;
}

- (MPSGraphTensor)cumulativeMinimumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  v5 = [(MPSGraph *)self cumulativeMinimumWithTensor:tensor axis:axis exclusive:0 reverse:0 name:name];

  return (MPSGraphTensor *)v5;
}

- (MPSGraphTensor)cumulativeMinimumWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor name:(NSString *)name
{
  v5 = [(MPSGraph *)self cumulativeMinimumWithTensor:tensor axisTensor:axisTensor exclusive:0 reverse:0 name:name];

  return (MPSGraphTensor *)v5;
}

- (id)cumulativeMaximumReturnIndicesWithTensor:(id)a3 axis:(int64_t)a4 exclusive:(BOOL)a5 reverse:(BOOL)a6 name:(id)a7
{
  if (MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  return 0;
}

- (id)cumulativeMinimumReturnIndicesWithTensor:(id)a3 axis:(int64_t)a4 exclusive:(BOOL)a5 reverse:(BOOL)a6 name:(id)a7
{
  if (MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  return 0;
}

- (MPSGraphTensor)inverseOfTensor:(MPSGraphTensor *)inputTensor name:(NSString *)name
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = inputTensor;
  id v7 = name;
  BOOL v8 = [MPSGraphMatrixInverseOp alloc];
  v14[0] = v6;
  BOOL v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v10 = [(MPSGraphOperation *)v8 initWithGraph:self inputTensors:v9 controlDependencies:MEMORY[0x1E4F1CBF0] name:v7];

  BOOL v11 = [(MPSGraphOperation *)v10 outputTensors];
  id v12 = [v11 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)oneHotWithIndicesTensor:(MPSGraphTensor *)indicesTensor depth:(NSUInteger)depth axis:(NSUInteger)axis dataType:(MPSDataType)dataType onValue:(double)onValue offValue:(double)offValue name:(NSString *)name
{
  BOOL v9 = oneHotBase(self, indicesTensor, depth, onValue, offValue, axis, *(uint64_t *)&dataType, name);

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)oneHotWithIndicesTensor:(MPSGraphTensor *)indicesTensor depth:(NSUInteger)depth dataType:(MPSDataType)dataType onValue:(double)onValue offValue:(double)offValue name:(NSString *)name
{
  BOOL v8 = oneHotBase(self, indicesTensor, depth, onValue, offValue, 0xFFFFFFFFFFFFFFFFLL, *(uint64_t *)&dataType, name);

  return (MPSGraphTensor *)v8;
}

- (MPSGraphTensor)oneHotWithIndicesTensor:(MPSGraphTensor *)indicesTensor depth:(NSUInteger)depth axis:(NSUInteger)axis dataType:(MPSDataType)dataType name:(NSString *)name
{
  id v12 = indicesTensor;
  id v13 = name;
  if (dataType == MPSDataTypeBFloat16 || dataType == MPSDataTypeFloat32 || dataType == MPSDataTypeFloat16) {
    uint64_t v14 = 268435488;
  }
  else {
    uint64_t v14 = 536870944;
  }
  id v15 = oneHotBase(self, v12, depth, 1.0, 0.0, axis, v14, v13);

  return (MPSGraphTensor *)v15;
}

- (MPSGraphTensor)oneHotWithIndicesTensor:(MPSGraphTensor *)indicesTensor depth:(NSUInteger)depth axis:(NSUInteger)axis name:(NSString *)name
{
  id v6 = oneHotBase(self, indicesTensor, depth, 1.0, 0.0, axis, 268435488, name);

  return (MPSGraphTensor *)v6;
}

- (MPSGraphTensor)oneHotWithIndicesTensor:(MPSGraphTensor *)indicesTensor depth:(NSUInteger)depth dataType:(MPSDataType)dataType name:(NSString *)name
{
  uint64_t v7 = *(void *)&dataType;
  id v10 = indicesTensor;
  BOOL v11 = name;
  if (v7 == -1879048176 || v7 == 268435488 || v7 == 268435472)
  {
    id v12 = oneHotBase(self, v10, depth, 1.0, 0.0, 0xFFFFFFFFFFFFFFFFLL, 268435488, v11);
  }
  else
  {
    id v12 = 0;
  }
  id v13 = oneHotBase(self, v10, depth, 1.0, 0.0, 0xFFFFFFFFFFFFFFFFLL, 536870944, v11);

  if (v11)
  {
    uint64_t v14 = [(NSString *)v11 stringByAppendingFormat:@"/cast"];
  }
  else
  {
    uint64_t v14 = @"/oneHot/cast";
  }
  id v15 = [(MPSGraph *)self castTensor:v13 toType:v7 name:v14];
  if (v11) {

  }
  return (MPSGraphTensor *)v15;
}

- (MPSGraphTensor)oneHotWithIndicesTensor:(MPSGraphTensor *)indicesTensor depth:(NSUInteger)depth name:(NSString *)name
{
  v5 = oneHotBase(self, indicesTensor, depth, 1.0, 0.0, 0xFFFFFFFFFFFFFFFFLL, 268435488, name);

  return (MPSGraphTensor *)v5;
}

- (id)mathOpsWithTensors:(id)a3 mathOpType:(unint64_t)a4 name:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [MPSGraphArithmeticOp alloc];
  BOOL v11 = [(MPSGraphArithmeticOp *)v10 initWithGraph:self inputTensors:v8 controlDependencies:MEMORY[0x1E4F1CBF0] mathOpType:a4 name:v9];
  id v12 = [(MPSGraphOperation *)v11 outputTensors];
  id v13 = [v12 objectAtIndexedSubscript:0];

  return v13;
}

- (id)fixSignednessOfInputsTensors:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v5)
  {
    BOOL v6 = 0;
    uint64_t v7 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(id *)(*((void *)&v32 + 1) + 8 * i);
        uint64_t MLIRElementType = getMLIRElementType(*(mlir::MLIRContext **)self->_builder, (mlir::MLIRContext *)[v9 dataType]);
        if (!*(void *)MLIRElementType) {
          __assert_rtn("getAbstractType", "TypeSupport.h", 160, "abstractType && \"Malformed type storage object.\"");
        }
        if (*(_UNKNOWN **)(*(void *)MLIRElementType + 136) != &mlir::detail::TypeIDResolver<mlir::IntegerType,void>::id)
        {

          id v26 = v4;
          goto LABEL_29;
        }
        BOOL v6 = v6 || !mlir::Type::isUnsignedInteger((mlir::Type *)&MLIRElementType);
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v5) {
        continue;
      }
      break;
    }

    if (v6)
    {
      id v26 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v25 = v4;
      uint64_t v10 = [v25 countByEnumeratingWithState:&v27 objects:v36 count:16];
      if (!v10) {
        goto LABEL_25;
      }
      uint64_t v11 = *(void *)v28;
      while (1)
      {
        for (uint64_t j = 0; j != v10; ++j)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(v25);
          }
          id v13 = *(id *)(*((void *)&v27 + 1) + 8 * j);
          uint64_t v14 = getMLIRElementType(*(mlir::MLIRContext **)self->_builder, (mlir::MLIRContext *)[v13 dataType]);
          if (!*(void *)v14)
          {
            int v21 = 160;
            double v22 = "abstractType && \"Malformed type storage object.\"";
            v23 = "TypeSupport.h";
            BOOL v24 = "getAbstractType";
            goto LABEL_35;
          }
          if (*(_UNKNOWN **)(*(void *)v14 + 136) != &mlir::detail::TypeIDResolver<mlir::IntegerType,void>::id)
          {
            int v21 = 566;
            BOOL v24 = "cast";
            v23 = "Casting.h";
            double v22 = "isa<To>(Val) && \"cast<Ty>() argument of incompatible type!\"";
LABEL_35:
            __assert_rtn(v24, v23, v21, v22);
          }
          uint64_t MLIRElementType = v14;
          id v15 = v13;
          id v16 = v15;
          if (mlir::Type::isUnsignedInteger((mlir::Type *)&MLIRElementType))
          {
            uint64_t v17 = *(void *)self->_builder;
            unsigned int Width = mlir::IntegerType::getWidth((mlir::IntegerType *)&MLIRElementType);
            id v19 = (void *)mlir::IntegerType::get(v17, Width, 1u);
            id v16 = [(MPSGraph *)self castTensor:v15 toType:getMPSDataType(v19) name:0];
          }
          [v26 addObject:v16];
        }
        uint64_t v10 = [v25 countByEnumeratingWithState:&v27 objects:v36 count:16];
        if (!v10)
        {
LABEL_25:

          goto LABEL_29;
        }
      }
    }
  }
  else
  {
  }
  id v26 = v4;
LABEL_29:

  return v26;
}

- (id)castBooleansOfInputsTensors:(id)a3
{
  int v21 = self;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (!v4)
  {

    goto LABEL_25;
  }
  int v5 = 0;
  LOBYTE(v6) = 0;
  uint64_t v7 = *(void *)v28;
  uint64_t v8 = 268435488;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v28 != v7) {
        objc_enumerationMutation(v3);
      }
      id v10 = *(id *)(*((void *)&v27 + 1) + 8 * i);
      int v11 = [v10 dataType];
      int v12 = v11;
      if (!v6)
      {
        BOOL v6 = [v10 dataType] == -2147483640;
        if ((v12 & 0x10000000) == 0) {
          goto LABEL_11;
        }
LABEL_10:
        uint64_t v8 = objc_msgSend(v10, "dataType", v21);
        goto LABEL_11;
      }
      BOOL v6 = 1;
      if ((v11 & 0x10000000) != 0) {
        goto LABEL_10;
      }
LABEL_11:

      v5 |= (v12 & 0x10000000u) >> 28;
    }
    uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v32 count:16];
  }
  while (v4);

  if ((v6 & v5 & 1) == 0)
  {
LABEL_25:
    id v13 = v3;
    goto LABEL_26;
  }
  id v13 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = v3;
  uint64_t v14 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(id *)(*((void *)&v23 + 1) + 8 * j);
        unint64_t v18 = v17;
        if ([v17 dataType] == -2147483640)
        {
          uint64_t v19 = [(MPSGraph *)v21 castTensor:v17 toType:v8 name:0];

          unint64_t v18 = (void *)v19;
        }
        objc_msgSend(v13, "addObject:", v18, v21);
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v14);
  }

LABEL_26:

  return v13;
}

- (MPSGraphTensor)identityWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  BOOL v6 = tensor;
  uint64_t v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:0 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)exponentWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  BOOL v6 = tensor;
  uint64_t v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:1 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)exponentBase2WithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  BOOL v6 = tensor;
  uint64_t v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:2 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)exponentBase10WithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  BOOL v6 = tensor;
  uint64_t v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:3 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)logarithmWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  BOOL v6 = tensor;
  uint64_t v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:4 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)logarithmBase2WithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  BOOL v6 = tensor;
  uint64_t v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:5 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)logarithmBase10WithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  BOOL v6 = tensor;
  uint64_t v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:6 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)squareWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  BOOL v6 = tensor;
  uint64_t v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:7 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)squareRootWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  BOOL v6 = tensor;
  uint64_t v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:8 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)reverseSquareRootWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  BOOL v6 = tensor;
  uint64_t v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:9 name:v7];

  return (MPSGraphTensor *)v9;
}

- (id)reciprocalSquareRootWithTensor:(id)a3 name:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:9 name:v7];

  return v9;
}

- (MPSGraphTensor)reciprocalWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:10 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)absoluteWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:11 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)absoluteSquareWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:12 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)negativeWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:13 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)signWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:14 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)signbitWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:15 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)ceilWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:16 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)floorWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:17 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)roundWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:18 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)rintWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:19 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)sinWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:20 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)cosWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:21 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)tanWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:22 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)sinhWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:23 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)coshWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:24 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)tanhWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:25 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)asinWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:26 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)acosWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:27 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)atanWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:28 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)asinhWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:29 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)acoshWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:30 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)atanhWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:31 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)notWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:32 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)isInfiniteWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:33 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)isFiniteWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:34 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)isNaNWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:35 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)erfWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:36 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)truncateWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:71 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)bitwiseNOTWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:37 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)bitwisePopulationCountWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:38 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)conjugateWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:39 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)additionWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = primaryTensor;
  id v9 = secondaryTensor;
  id v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  int v12 = [(MPSGraph *)self fixSignednessOfInputsTensors:v11];

  id v13 = [(MPSGraph *)self castBooleansOfInputsTensors:v12];

  uint64_t v14 = [(MPSGraph *)self mathOpsWithTensors:v13 mathOpType:42 name:v10];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)subtractionWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = primaryTensor;
  id v9 = secondaryTensor;
  id v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  int v12 = [(MPSGraph *)self fixSignednessOfInputsTensors:v11];

  id v13 = [(MPSGraph *)self castBooleansOfInputsTensors:v12];

  uint64_t v14 = [(MPSGraph *)self mathOpsWithTensors:v13 mathOpType:43 name:v10];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)multiplicationWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = primaryTensor;
  id v9 = secondaryTensor;
  id v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  int v12 = [(MPSGraph *)self fixSignednessOfInputsTensors:v11];

  id v13 = [(MPSGraph *)self castBooleansOfInputsTensors:v12];

  uint64_t v14 = [(MPSGraph *)self mathOpsWithTensors:v13 mathOpType:44 name:v10];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)divisionWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = primaryTensor;
  id v9 = secondaryTensor;
  id v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  int v12 = [(MPSGraph *)self fixSignednessOfInputsTensors:v11];

  id v13 = [(MPSGraph *)self castBooleansOfInputsTensors:v12];

  uint64_t v14 = [(MPSGraph *)self mathOpsWithTensors:v13 mathOpType:45 name:v10];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)moduloWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = primaryTensor;
  id v9 = secondaryTensor;
  id v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  int v12 = [(MPSGraph *)self fixSignednessOfInputsTensors:v11];

  id v13 = [(MPSGraph *)self castBooleansOfInputsTensors:v12];

  uint64_t v14 = [(MPSGraph *)self mathOpsWithTensors:v13 mathOpType:46 name:v10];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)powerWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = primaryTensor;
  id v9 = secondaryTensor;
  id v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  int v12 = [(MPSGraph *)self fixSignednessOfInputsTensors:v11];

  id v13 = [(MPSGraph *)self castBooleansOfInputsTensors:v12];

  uint64_t v14 = [(MPSGraph *)self mathOpsWithTensors:v13 mathOpType:47 name:v10];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)minimumWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = primaryTensor;
  id v9 = secondaryTensor;
  id v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  int v12 = [(MPSGraph *)self fixSignednessOfInputsTensors:v11];

  id v13 = [(MPSGraph *)self castBooleansOfInputsTensors:v12];

  uint64_t v14 = [(MPSGraph *)self mathOpsWithTensors:v13 mathOpType:48 name:v10];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)maximumWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = primaryTensor;
  id v9 = secondaryTensor;
  id v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  int v12 = [(MPSGraph *)self fixSignednessOfInputsTensors:v11];

  id v13 = [(MPSGraph *)self castBooleansOfInputsTensors:v12];

  uint64_t v14 = [(MPSGraph *)self mathOpsWithTensors:v13 mathOpType:49 name:v10];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)equalWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = primaryTensor;
  id v9 = secondaryTensor;
  id v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  int v12 = [(MPSGraph *)self fixSignednessOfInputsTensors:v11];

  id v13 = [(MPSGraph *)self castBooleansOfInputsTensors:v12];

  uint64_t v14 = [(MPSGraph *)self mathOpsWithTensors:v13 mathOpType:50 name:v10];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)notEqualWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = primaryTensor;
  id v9 = secondaryTensor;
  id v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  int v12 = [(MPSGraph *)self fixSignednessOfInputsTensors:v11];

  id v13 = [(MPSGraph *)self castBooleansOfInputsTensors:v12];

  uint64_t v14 = [(MPSGraph *)self mathOpsWithTensors:v13 mathOpType:51 name:v10];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)lessThanWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = primaryTensor;
  id v9 = secondaryTensor;
  id v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  int v12 = [(MPSGraph *)self fixSignednessOfInputsTensors:v11];

  id v13 = [(MPSGraph *)self castBooleansOfInputsTensors:v12];

  uint64_t v14 = [(MPSGraph *)self mathOpsWithTensors:v13 mathOpType:52 name:v10];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)lessThanOrEqualToWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = primaryTensor;
  id v9 = secondaryTensor;
  id v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  int v12 = [(MPSGraph *)self fixSignednessOfInputsTensors:v11];

  id v13 = [(MPSGraph *)self castBooleansOfInputsTensors:v12];

  uint64_t v14 = [(MPSGraph *)self mathOpsWithTensors:v13 mathOpType:53 name:v10];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)greaterThanWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = primaryTensor;
  id v9 = secondaryTensor;
  id v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  int v12 = [(MPSGraph *)self fixSignednessOfInputsTensors:v11];

  id v13 = [(MPSGraph *)self castBooleansOfInputsTensors:v12];

  uint64_t v14 = [(MPSGraph *)self mathOpsWithTensors:v13 mathOpType:54 name:v10];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)greaterThanOrEqualToWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = primaryTensor;
  id v9 = secondaryTensor;
  id v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  int v12 = [(MPSGraph *)self fixSignednessOfInputsTensors:v11];

  id v13 = [(MPSGraph *)self castBooleansOfInputsTensors:v12];

  uint64_t v14 = [(MPSGraph *)self mathOpsWithTensors:v13 mathOpType:55 name:v10];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)logicalANDWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = primaryTensor;
  id v9 = secondaryTensor;
  id v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  int v12 = [(MPSGraph *)self fixSignednessOfInputsTensors:v11];

  id v13 = [(MPSGraph *)self castBooleansOfInputsTensors:v12];

  uint64_t v14 = [(MPSGraph *)self mathOpsWithTensors:v13 mathOpType:56 name:v10];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)logicalORWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = primaryTensor;
  id v9 = secondaryTensor;
  id v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  int v12 = [(MPSGraph *)self fixSignednessOfInputsTensors:v11];

  id v13 = [(MPSGraph *)self castBooleansOfInputsTensors:v12];

  uint64_t v14 = [(MPSGraph *)self mathOpsWithTensors:v13 mathOpType:57 name:v10];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)logicalNANDWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = primaryTensor;
  id v9 = secondaryTensor;
  id v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  int v12 = [(MPSGraph *)self fixSignednessOfInputsTensors:v11];

  id v13 = [(MPSGraph *)self castBooleansOfInputsTensors:v12];

  uint64_t v14 = [(MPSGraph *)self mathOpsWithTensors:v13 mathOpType:58 name:v10];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)logicalNORWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = primaryTensor;
  id v9 = secondaryTensor;
  id v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  int v12 = [(MPSGraph *)self fixSignednessOfInputsTensors:v11];

  id v13 = [(MPSGraph *)self castBooleansOfInputsTensors:v12];

  uint64_t v14 = [(MPSGraph *)self mathOpsWithTensors:v13 mathOpType:59 name:v10];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)logicalXORWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = primaryTensor;
  id v9 = secondaryTensor;
  id v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  int v12 = [(MPSGraph *)self fixSignednessOfInputsTensors:v11];

  id v13 = [(MPSGraph *)self castBooleansOfInputsTensors:v12];

  uint64_t v14 = [(MPSGraph *)self mathOpsWithTensors:v13 mathOpType:60 name:v10];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)logicalXNORWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = primaryTensor;
  id v9 = secondaryTensor;
  id v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  int v12 = [(MPSGraph *)self fixSignednessOfInputsTensors:v11];

  id v13 = [(MPSGraph *)self castBooleansOfInputsTensors:v12];

  uint64_t v14 = [(MPSGraph *)self mathOpsWithTensors:v13 mathOpType:61 name:v10];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)atan2WithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = primaryTensor;
  id v9 = secondaryTensor;
  id v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  int v12 = [(MPSGraph *)self fixSignednessOfInputsTensors:v11];

  id v13 = [(MPSGraph *)self castBooleansOfInputsTensors:v12];

  uint64_t v14 = [(MPSGraph *)self mathOpsWithTensors:v13 mathOpType:62 name:v10];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)bitwiseANDWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = primaryTensor;
  id v9 = secondaryTensor;
  id v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  int v12 = [(MPSGraph *)self fixSignednessOfInputsTensors:v11];

  id v13 = [(MPSGraph *)self castBooleansOfInputsTensors:v12];

  uint64_t v14 = [(MPSGraph *)self mathOpsWithTensors:v13 mathOpType:63 name:v10];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)bitwiseORWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = primaryTensor;
  id v9 = secondaryTensor;
  id v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  int v12 = [(MPSGraph *)self fixSignednessOfInputsTensors:v11];

  id v13 = [(MPSGraph *)self castBooleansOfInputsTensors:v12];

  uint64_t v14 = [(MPSGraph *)self mathOpsWithTensors:v13 mathOpType:64 name:v10];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)bitwiseXORWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = primaryTensor;
  id v9 = secondaryTensor;
  id v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  int v12 = [(MPSGraph *)self fixSignednessOfInputsTensors:v11];

  id v13 = [(MPSGraph *)self castBooleansOfInputsTensors:v12];

  uint64_t v14 = [(MPSGraph *)self mathOpsWithTensors:v13 mathOpType:65 name:v10];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)bitwiseLeftShiftWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = primaryTensor;
  id v9 = secondaryTensor;
  id v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  int v12 = [(MPSGraph *)self fixSignednessOfInputsTensors:v11];

  id v13 = [(MPSGraph *)self castBooleansOfInputsTensors:v12];

  uint64_t v14 = [(MPSGraph *)self mathOpsWithTensors:v13 mathOpType:66 name:v10];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)bitwiseRightShiftWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = primaryTensor;
  id v9 = secondaryTensor;
  id v10 = name;
  v16[0] = v8;
  v16[1] = v9;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  int v12 = [(MPSGraph *)self fixSignednessOfInputsTensors:v11];

  id v13 = [(MPSGraph *)self castBooleansOfInputsTensors:v12];

  uint64_t v14 = [(MPSGraph *)self mathOpsWithTensors:v13 mathOpType:67 name:v10];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)minimumWithNaNPropagationWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  id v7 = primaryTensor;
  uint64_t v8 = secondaryTensor;
  id v9 = [(MPSGraph *)self isNaNWithTensor:v7 name:0];
  id v10 = [(MPSGraph *)self isNaNWithTensor:v8 name:0];
  int v11 = [(MPSGraph *)self logicalORWithPrimaryTensor:v9 secondaryTensor:v10 name:0];
  int v12 = [(MPSGraph *)self minimumWithPrimaryTensor:v7 secondaryTensor:v8 name:0];
  id v13 = -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", [v12 dataType], NAN);
  uint64_t v14 = [(MPSGraph *)self selectWithPredicateTensor:v11 truePredicateTensor:v13 falsePredicateTensor:v12 name:0];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)maximumWithNaNPropagationWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  id v7 = primaryTensor;
  uint64_t v8 = secondaryTensor;
  id v9 = [(MPSGraph *)self isNaNWithTensor:v7 name:0];
  id v10 = [(MPSGraph *)self isNaNWithTensor:v8 name:0];
  int v11 = [(MPSGraph *)self logicalORWithPrimaryTensor:v9 secondaryTensor:v10 name:0];
  int v12 = [(MPSGraph *)self maximumWithPrimaryTensor:v7 secondaryTensor:v8 name:0];
  id v13 = -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", [v12 dataType], NAN);
  uint64_t v14 = [(MPSGraph *)self selectWithPredicateTensor:v11 truePredicateTensor:v13 falsePredicateTensor:v12 name:0];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)selectWithPredicateTensor:(MPSGraphTensor *)predicateTensor truePredicateTensor:(MPSGraphTensor *)truePredicateTensor falsePredicateTensor:(MPSGraphTensor *)falseSelectTensor name:(NSString *)name
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v10 = predicateTensor;
  int v11 = truePredicateTensor;
  int v12 = falseSelectTensor;
  id v13 = name;
  v22[0] = v11;
  v22[1] = v12;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  uint64_t v15 = [(MPSGraph *)self fixSignednessOfInputsTensors:v14];

  id v16 = objc_msgSend(v15, "objectAtIndexedSubscript:", 0, v10);
  v21[1] = v16;
  id v17 = [v15 objectAtIndexedSubscript:1];
  v21[2] = v17;
  unint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
  uint64_t v19 = [(MPSGraph *)self mathOpsWithTensors:v18 mathOpType:69 name:v13];

  return (MPSGraphTensor *)v19;
}

- (MPSGraphTensor)clampWithTensor:(MPSGraphTensor *)tensor minValueTensor:(MPSGraphTensor *)minValueTensor maxValueTensor:(MPSGraphTensor *)maxValueTensor name:(NSString *)name
{
  v18[3] = *MEMORY[0x1E4F143B8];
  id v10 = tensor;
  int v11 = minValueTensor;
  int v12 = maxValueTensor;
  id v13 = name;
  v18[0] = v10;
  v18[1] = v11;
  v18[2] = v12;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
  uint64_t v15 = [(MPSGraph *)self fixSignednessOfInputsTensors:v14];

  id v16 = [(MPSGraph *)self mathOpsWithTensors:v15 mathOpType:70 name:v13];

  return (MPSGraphTensor *)v16;
}

- (MPSGraphTensor)divisionNoNaNWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  uint64_t v8 = primaryTensor;
  id v9 = secondaryTensor;
  id v10 = name;
  int v11 = [(MPSGraph *)self constantWithScalar:&unk_1EC9F1418 shape:268435488 dataType:0.0];
  if (v10) {
    [NSString stringWithFormat:@"%@/division", v10];
  }
  else {
  int v12 = [NSString stringWithFormat:@"divisionNoNaN/division"];
  }
  id v13 = [(MPSGraph *)self divisionWithPrimaryTensor:v8 secondaryTensor:v9 name:v12];

  if (v10) {
    [NSString stringWithFormat:@"%@/select", v10];
  }
  else {
  uint64_t v14 = [NSString stringWithFormat:@"divisionNoNaN/select"];
  }
  uint64_t v15 = [(MPSGraph *)self selectWithPredicateTensor:v9 truePredicateTensor:v13 falsePredicateTensor:v11 name:v14];

  return (MPSGraphTensor *)v15;
}

- (MPSGraphTensor)floorModuloWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  uint64_t v8 = primaryTensor;
  id v9 = secondaryTensor;
  id v10 = name;
  if (v10) {
    [NSString stringWithFormat:@"%@/division", v10];
  }
  else {
  int v11 = [NSString stringWithFormat:@"floorMod/division"];
  }
  int v12 = [(MPSGraph *)self divisionWithPrimaryTensor:v8 secondaryTensor:v9 name:v11];

  if (v10) {
    [NSString stringWithFormat:@"%@/floor", v10];
  }
  else {
  id v13 = [NSString stringWithFormat:@"floorMod/floor"];
  }
  uint64_t v14 = [(MPSGraph *)self floorWithTensor:v12 name:v13];

  if (v10) {
    [NSString stringWithFormat:@"%@/multiply", v10];
  }
  else {
  uint64_t v15 = [NSString stringWithFormat:@"floorMod/multiply"];
  }
  id v16 = [(MPSGraph *)self multiplicationWithPrimaryTensor:v14 secondaryTensor:v9 name:v15];

  if (v10) {
    [NSString stringWithFormat:@"%@/subtract", v10];
  }
  else {
  id v17 = [NSString stringWithFormat:@"floorMod/subtract"];
  }
  unint64_t v18 = [(MPSGraph *)self subtractionWithPrimaryTensor:v8 secondaryTensor:v16 name:v17];

  return (MPSGraphTensor *)v18;
}

- (MPSGraphTensor)realPartOfTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:40 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)imaginaryPartOfTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [(MPSGraph *)self mathOpsWithTensors:v8 mathOpType:41 name:v7];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)complexTensorWithRealTensor:(MPSGraphTensor *)realTensor imaginaryTensor:(MPSGraphTensor *)imaginaryTensor name:(NSString *)name
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = realTensor;
  id v9 = imaginaryTensor;
  id v10 = name;
  v14[0] = v8;
  v14[1] = v9;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  int v12 = [(MPSGraph *)self mathOpsWithTensors:v11 mathOpType:68 name:v10];

  return (MPSGraphTensor *)v12;
}

- (NSArray)singleGateRNNWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState mask:(MPSGraphTensor *)mask descriptor:(MPSGraphSingleGateRNNDescriptor *)descriptor name:(NSString *)name
{
  v82[2] = *MEMORY[0x1E4F143B8];
  id v16 = source;
  id v75 = recurrentWeight;
  id v17 = inputWeight;
  id v74 = bias;
  id v72 = initState;
  id v73 = mask;
  unint64_t v18 = descriptor;
  v76 = name;
  uint64_t v19 = v16;
  id v70 = v19;
  v71 = v17;
  if (v17)
  {
    int64_t v20 = [(MPSGraph *)self transposeTensor:v17 dimension:0 withDimension:1 name:@"W^T"];
    int v21 = [NSString stringWithFormat:@"%@ W^T", v76];
    uint64_t v19 = [(MPSGraph *)self matrixMultiplicationWithPrimaryTensor:v19 secondaryTensor:v20 name:v21];
  }
  if (![(MPSGraphSingleGateRNNDescriptor *)v18 bidirectional])
  {
    if (v74)
    {
      v53 = NSString;
      double v54 = [(MPSGraphTensor *)v19 name];
      v55 = [v53 stringWithFormat:@"%@ + b", v54];
      uint64_t v56 = [(MPSGraph *)self additionWithPrimaryTensor:v19 secondaryTensor:v74 name:v55];

      uint64_t v19 = (MPSGraphTensor *)v56;
    }
    BOOL v31 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
    double v22 = (unsigned char *)[(MPSGraphSingleGateRNNDescriptor *)v18 copy];

    if ([v22 reverse])
    {
      v57 = [(MPSGraphTensor *)v19 name];
      uint64_t v58 = [(MPSGraph *)self reverseTensor:v19 axes:&unk_1EC9F1478 name:v57];

      uint64_t v19 = (MPSGraphTensor *)v58;
    }
    [v22 setReverse:0];
    [v31 addObject:v19];
    [v31 addObject:v75];
    if (v72)
    {
      [v31 addObject:v72];
      v22[9] = 1;
    }
    if (v73)
    {
      [v31 addObject:v73];
      v22[8] = 1;
    }
    v59 = [MPSGraphSingleGateRNNOp alloc];
    v69 = [(MPSGraphSingleGateRNNOp *)v59 initWithGraph:self inputTensors:v31 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v22 name:v76];
    if (![v22 training])
    {
      v68 = [(MPSGraphOperation *)v69 outputTensors];
      id v67 = [v68 objectAtIndexedSubscript:0];
      id v77 = v67;
      v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];
LABEL_30:

      goto LABEL_31;
    }
    v68 = [(MPSGraphOperation *)v69 outputTensors];
    id v67 = [v68 objectAtIndexedSubscript:0];
    v78[0] = v67;
    uint64_t v33 = [(MPSGraphOperation *)v69 outputTensors];
    long long v34 = [v33 objectAtIndexedSubscript:1];
    v78[1] = v34;
    v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:2];
LABEL_29:

    goto LABEL_30;
  }
  double v22 = (unsigned char *)[(MPSGraphSingleGateRNNDescriptor *)v18 copy];

  [v22 setBidirectional:0];
  long long v23 = [(MPSGraphTensor *)v75 shape];
  if (v23)
  {
    long long v24 = [(MPSGraphTensor *)v75 shape];
    long long v25 = [v24 objectAtIndexedSubscript:1];
    uint64_t v26 = [v25 integerValue];

    if ((v26 & 0x8000000000000000) == 0)
    {
      if (v74)
      {
        long long v27 = NSString;
        long long v28 = [(MPSGraphTensor *)v19 name];
        long long v29 = [v27 stringWithFormat:@"%@ + b", v28];
        uint64_t v30 = [(MPSGraph *)self additionWithPrimaryTensor:v19 secondaryTensor:v74 name:v29];

        uint64_t v19 = (MPSGraphTensor *)v30;
      }
      BOOL v31 = [(MPSGraph *)self sliceTensor:v19 dimension:-1 start:0 length:v26 name:0];
      long long v32 = [(MPSGraph *)self sliceTensor:v19 dimension:-1 start:v26 length:v26 name:0];
      v68 = [(MPSGraph *)self sliceTensor:v75 dimension:0 start:0 length:1 name:0];
      id v67 = [(MPSGraph *)self sliceTensor:v75 dimension:0 start:1 length:1 name:0];
      v69 = [(MPSGraph *)self reverseTensor:v32 axes:&unk_1EC9F1430 name:0];

      uint64_t v33 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
      long long v34 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
      [v33 addObject:v31];
      [v33 addObject:v68];
      [v34 addObject:v69];
      [v34 addObject:v67];
      if (v72)
      {
        long long v35 = [(MPSGraph *)self sliceTensor:v72 dimension:-1 start:0 length:v26 name:0];
        v36 = [(MPSGraph *)self sliceTensor:v72 dimension:-1 start:v26 length:v26 name:0];
        [v33 addObject:v35];
        [v34 addObject:v36];
        v22[9] = 1;
      }
      if (v73)
      {
        uint64_t v37 = [(MPSGraph *)self sliceTensor:v73 dimension:-1 start:0 length:v26 name:0];
        uint64_t v38 = [(MPSGraph *)self sliceTensor:v73 dimension:-1 start:v26 length:v26 name:0];
        [v33 addObject:v37];
        [v34 addObject:v38];
        v22[8] = 1;
      }
      v39 = [MPSGraphSingleGateRNNOp alloc];
      v66 = [(MPSGraphSingleGateRNNOp *)v39 initWithGraph:self inputTensors:v33 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v22 name:v76];
      v40 = [MPSGraphSingleGateRNNOp alloc];
      uint64_t v63 = [(MPSGraphSingleGateRNNOp *)v40 initWithGraph:self inputTensors:v34 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v22 name:v76];
      v41 = [(MPSGraphOperation *)v63 outputTensors];
      uint64_t v42 = [v41 objectAtIndexedSubscript:0];
      v65 = [(MPSGraph *)self reverseTensor:v42 axes:&unk_1EC9F1448 name:0];

      id v43 = [(MPSGraphOperation *)v66 outputTensors];
      uint64_t v44 = [v43 objectAtIndexedSubscript:0];
      v82[0] = v44;
      v82[1] = v65;
      v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:2];
      v64 = [(MPSGraph *)self concatTensors:v45 dimension:-1 name:v76];

      if ([v22 training])
      {
        uint64_t v46 = [(MPSGraphOperation *)v63 outputTensors];
        v47 = [v46 objectAtIndexedSubscript:1];
        id v62 = [(MPSGraph *)self reverseTensor:v47 axes:&unk_1EC9F1460 name:0];

        uint64_t v61 = [(MPSGraphOperation *)v66 outputTensors];
        v48 = [v61 objectAtIndexedSubscript:1];
        v81[0] = v48;
        v81[1] = v62;
        v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:2];
        v50 = [NSString stringWithFormat:@"%@ - training state", v76];
        id v51 = [(MPSGraph *)self concatTensors:v49 dimension:-1 name:v50];

        v80[0] = v64;
        v80[1] = v51;
        v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:2];
      }
      else
      {
        id v79 = v64;
        v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
      }

      goto LABEL_29;
    }
  }
  v52 = 0;
  if (MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
LABEL_31:

  return (NSArray *)v52;
}

- (NSArray)singleGateRNNWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState descriptor:(MPSGraphSingleGateRNNDescriptor *)descriptor name:(NSString *)name
{
  id v9 = [(MPSGraph *)self singleGateRNNWithSourceTensor:source recurrentWeight:recurrentWeight inputWeight:inputWeight bias:bias initState:initState mask:0 descriptor:descriptor name:name];

  return (NSArray *)v9;
}

- (NSArray)singleGateRNNWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight initState:(MPSGraphTensor *)initState descriptor:(MPSGraphSingleGateRNNDescriptor *)descriptor name:(NSString *)name
{
  id v7 = [(MPSGraph *)self singleGateRNNWithSourceTensor:source recurrentWeight:recurrentWeight inputWeight:0 bias:0 initState:initState mask:0 descriptor:descriptor name:name];

  return (NSArray *)v7;
}

- (NSArray)singleGateRNNGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState stateGradient:(MPSGraphTensor *)stateGradient inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState mask:(MPSGraphTensor *)mask descriptor:(MPSGraphSingleGateRNNDescriptor *)descriptor name:(NSString *)name
{
  v106[2] = *MEMORY[0x1E4F143B8];
  v93 = source;
  v98 = recurrentWeight;
  v100 = sourceGradient;
  v90 = zState;
  v96 = stateGradient;
  v95 = inputWeight;
  v99 = initState;
  v94 = mask;
  uint64_t v19 = descriptor;
  v101 = name;
  v85 = v19;
  int64_t v20 = (unsigned char *)[(MPSGraphSingleGateRNNDescriptor *)v19 copy];
  if (![v20 bidirectional])
  {
    v97 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:5];
    if (v96)
    {
      uint64_t v37 = [(MPSGraph *)self sliceTensor:v100 dimension:0 start:-1 length:1 name:@"lastSlice"];
      uint64_t v38 = [(MPSGraph *)self additionWithPrimaryTensor:v37 secondaryTensor:v96 name:@"total derivative last state"];
      v39 = [(MPSGraph *)self cropTensor:v100 dimension:0 amount_before:0 amount_after:1 name:0];
      v102[0] = v39;
      v102[1] = v38;
      v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:2];
      uint64_t v41 = [(MPSGraph *)self concatTensors:v40 dimension:0 name:0];

      uint64_t v42 = (MPSGraphTensor *)v41;
    }
    else
    {
      uint64_t v42 = v100;
    }
    v100 = v42;
    objc_msgSend(v97, "addObject:");
    [v97 addObject:v98];
    [v97 addObject:v90];
    if (v99)
    {
      [v97 addObject:v99];
      v20[9] = 1;
    }
    if (v94)
    {
      [v97 addObject:v94];
      v20[8] = 1;
    }
    v88 = [[MPSGraphSingleGateRNNGradientOp alloc] initWithGraph:self inputTensors:v97 controlDependencies:0 descriptor:v20 name:v101];
    uint64_t v44 = [(MPSGraphOperation *)v88 outputTensors];
    v45 = [v44 objectAtIndexedSubscript:0];

    if ([v20 reverse])
    {
      uint64_t v46 = [v45 name];
      uint64_t v47 = [(MPSGraph *)self reverseTensor:v45 axes:&unk_1EC9F14D8 name:v46];

      v45 = (void *)v47;
    }
    v48 = [(MPSGraphOperation *)v88 outputTensors];
    v86 = [v48 objectAtIndexedSubscript:1];

    id v25 = v45;
    if (v99)
    {
      v49 = [(MPSGraphOperation *)v88 outputTensors];
      v89 = [v49 objectAtIndexedSubscript:2];

      unint64_t v50 = 0x1E4F29000uLL;
      if (v95) {
        goto LABEL_23;
      }
    }
    else
    {
      v89 = 0;
      unint64_t v50 = 0x1E4F29000;
      if (v95)
      {
LABEL_23:
        id v51 = [*(id *)(v50 + 24) stringWithFormat:@"%@ dx", v101];
        v92 = [(MPSGraph *)self matrixMultiplicationWithPrimaryTensor:v25 secondaryTensor:v95 name:v51];

        v52 = [(MPSGraph *)self flatten2DTensor:v25 axis:-1 name:0];
        v53 = [(MPSGraph *)self flatten2DTensor:v93 axis:-1 name:0];
        double v54 = [(MPSGraph *)self transposeTensor:v52 dimension:0 withDimension:1 name:0];
        v55 = [*(id *)(v50 + 24) stringWithFormat:@"%@ dW", v101];
        long long v34 = [(MPSGraph *)self matrixMultiplicationWithPrimaryTensor:v54 secondaryTensor:v53 name:v55];

        if (bias)
        {
LABEL_24:
          uint64_t v56 = [*(id *)(v50 + 24) stringWithFormat:@"%@ db", v101];
          v87 = [(MPSGraph *)self reductionSumWithTensor:v25 axes:&unk_1EC9F14F0 name:v56];

LABEL_28:
          id v43 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
          [v43 addObject:v92];
          [v43 addObject:v86];
          if (v34) {
            [v43 addObject:v34];
          }
          if (v87) {
            [v43 addObject:v87];
          }
          if (v89) {
            objc_msgSend(v43, "addObject:");
          }
          else {
            v89 = 0;
          }
          goto LABEL_52;
        }
LABEL_27:
        v87 = 0;
        goto LABEL_28;
      }
    }
    long long v34 = 0;
    v92 = v25;
    if (bias) {
      goto LABEL_24;
    }
    goto LABEL_27;
  }
  [v20 setBidirectional:0];
  int v21 = [(MPSGraphTensor *)v98 shape];
  if (v21)
  {
    double v22 = [(MPSGraphTensor *)v98 shape];
    long long v23 = [v22 objectAtIndexedSubscript:1];
    uint64_t v24 = [v23 integerValue];

    if ((v24 & 0x8000000000000000) == 0)
    {
      v97 = [(MPSGraph *)self sliceTensor:v98 dimension:0 start:0 length:1 name:0];
      v88 = [(MPSGraph *)self sliceTensor:v98 dimension:0 start:1 length:1 name:0];
      id v25 = [(MPSGraph *)self sliceTensor:v100 dimension:-1 start:0 length:v24 name:0];
      uint64_t v26 = [(MPSGraph *)self sliceTensor:v100 dimension:-1 start:v24 length:v24 name:0];
      if (v96)
      {
        v91 = [(MPSGraph *)self sliceTensor:v96 dimension:-1 start:v24 length:v24 name:0];
        long long v27 = [(MPSGraph *)self sliceTensor:v26 dimension:0 start:-1 length:1 name:0];
        long long v28 = [(MPSGraph *)self additionWithPrimaryTensor:v27 secondaryTensor:v91 name:0];
        long long v29 = [(MPSGraph *)self cropTensor:v26 dimension:0 amount_before:0 amount_after:1 name:0];
        v106[0] = v29;
        v106[1] = v28;
        uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:2];
        uint64_t v31 = [(MPSGraph *)self concatTensors:v30 dimension:0 name:0];

        uint64_t v26 = (void *)v31;
      }
      v86 = [(MPSGraph *)self reverseTensor:v26 axes:&unk_1EC9F1490 name:0];

      v89 = [(MPSGraph *)self sliceTensor:v90 dimension:-1 start:0 length:v24 name:0];
      long long v32 = [(MPSGraph *)self sliceTensor:v90 dimension:-1 start:v24 length:v24 name:0];
      v92 = [(MPSGraph *)self reverseTensor:v32 axes:&unk_1EC9F14A8 name:0];

      if (v94)
      {
        uint64_t v33 = v99;
        long long v34 = [(MPSGraph *)self sliceTensor:v94 dimension:-1 start:0 length:v24 name:0];
        v87 = [(MPSGraph *)self sliceTensor:v94 dimension:-1 start:v24 length:v24 name:0];
        if (v99) {
          goto LABEL_8;
        }
      }
      else
      {
        v87 = 0;
        long long v34 = 0;
        uint64_t v33 = v99;
        if (v99)
        {
LABEL_8:
          uint64_t v35 = [(MPSGraph *)self sliceTensor:v33 dimension:-1 start:0 length:v24 name:0];
          id v78 = [(MPSGraph *)self sliceTensor:v33 dimension:-1 start:v24 length:v24 name:0];
          id v79 = (void *)v35;
          v36 = v96;
          if (v96)
          {
LABEL_9:
            v80 = [(MPSGraph *)self sliceTensor:v36 dimension:-1 start:0 length:v24 name:0];
            goto LABEL_38;
          }
LABEL_37:
          v80 = 0;
LABEL_38:
          [v20 setReverse:0];
          v84 = [(MPSGraph *)self singleGateRNNGradientsWithSourceTensor:v93 recurrentWeight:v97 sourceGradient:v25 zState:v89 stateGradient:v80 inputWeight:0 bias:0 initState:v79 mask:v34 descriptor:v20 name:v101];
          [v20 setReverse:1];
          v83 = [(MPSGraph *)self singleGateRNNGradientsWithSourceTensor:v93 recurrentWeight:v88 sourceGradient:v86 zState:v92 stateGradient:0 inputWeight:0 bias:0 initState:v78 mask:v87 descriptor:v20 name:v101];
          v57 = [v84 objectAtIndexedSubscript:0];
          v105[0] = v57;
          uint64_t v58 = [v83 objectAtIndexedSubscript:0];
          v105[1] = v58;
          v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:2];
          v76 = [(MPSGraph *)self concatTensors:v59 dimension:-1 name:@"dz"];

          v60 = [v84 objectAtIndexedSubscript:1];
          v104[0] = v60;
          uint64_t v61 = [v83 objectAtIndexedSubscript:1];
          v104[1] = v61;
          id v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v104 count:2];
          id v77 = [(MPSGraph *)self concatTensors:v62 dimension:0 name:@"dR"];

          id v63 = v76;
          if (v99)
          {
            v64 = [v84 objectAtIndexedSubscript:2];
            v103[0] = v64;
            v65 = [v83 objectAtIndexedSubscript:2];
            v103[1] = v65;
            v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:2];
            v81 = [(MPSGraph *)self concatTensors:v66 dimension:-1 name:@"dh"];

            if (v95) {
              goto LABEL_40;
            }
          }
          else
          {
            v81 = 0;
            if (v95)
            {
LABEL_40:
              id v67 = [NSString stringWithFormat:@"%@ dx", v101];
              v82 = [(MPSGraph *)self matrixMultiplicationWithPrimaryTensor:v63 secondaryTensor:v95 name:v67];

              v68 = [(MPSGraph *)self flatten2DTensor:v63 axis:-1 name:0];
              v69 = [(MPSGraph *)self flatten2DTensor:v93 axis:-1 name:0];
              id v70 = [(MPSGraph *)self transposeTensor:v68 dimension:0 withDimension:1 name:0];
              v71 = [NSString stringWithFormat:@"%@ dW", v101];
              id v72 = [(MPSGraph *)self matrixMultiplicationWithPrimaryTensor:v70 secondaryTensor:v69 name:v71];

              if (bias)
              {
LABEL_41:
                id v73 = [NSString stringWithFormat:@"%@ db", v101];
                id v74 = [(MPSGraph *)self reductionSumWithTensor:v63 axes:&unk_1EC9F14C0 name:v73];

LABEL_45:
                id v43 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
                [v43 addObject:v82];
                [v43 addObject:v77];
                if (v72) {
                  [v43 addObject:v72];
                }
                if (v74) {
                  [v43 addObject:v74];
                }
                if (v81) {
                  [v43 addObject:v81];
                }

LABEL_52:
                goto LABEL_53;
              }
LABEL_44:
              id v74 = 0;
              goto LABEL_45;
            }
          }
          id v72 = 0;
          v82 = v63;
          if (bias) {
            goto LABEL_41;
          }
          goto LABEL_44;
        }
      }
      id v78 = 0;
      id v79 = 0;
      v36 = v96;
      if (v96) {
        goto LABEL_9;
      }
      goto LABEL_37;
    }
  }
  id v43 = 0;
  if (MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
LABEL_53:

  return (NSArray *)v43;
}

- (NSArray)singleGateRNNGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState mask:(MPSGraphTensor *)mask descriptor:(MPSGraphSingleGateRNNDescriptor *)descriptor name:(NSString *)name
{
  int v12 = [(MPSGraph *)self singleGateRNNGradientsWithSourceTensor:source recurrentWeight:recurrentWeight sourceGradient:sourceGradient zState:zState stateGradient:0 inputWeight:inputWeight bias:bias initState:initState mask:mask descriptor:descriptor name:name];

  return (NSArray *)v12;
}

- (NSArray)singleGateRNNGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState descriptor:(MPSGraphSingleGateRNNDescriptor *)descriptor name:(NSString *)name
{
  int v11 = [(MPSGraph *)self singleGateRNNGradientsWithSourceTensor:source recurrentWeight:recurrentWeight sourceGradient:sourceGradient zState:zState stateGradient:0 inputWeight:inputWeight bias:bias initState:initState mask:0 descriptor:descriptor name:name];

  return (NSArray *)v11;
}

- (NSArray)singleGateRNNGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState initState:(MPSGraphTensor *)initState descriptor:(MPSGraphSingleGateRNNDescriptor *)descriptor name:(NSString *)name
{
  id v9 = [(MPSGraph *)self singleGateRNNGradientsWithSourceTensor:source recurrentWeight:recurrentWeight sourceGradient:sourceGradient zState:zState stateGradient:0 inputWeight:0 bias:0 initState:initState mask:0 descriptor:descriptor name:name];

  return (NSArray *)v9;
}

- (NSArray)LSTMWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState initCell:(MPSGraphTensor *)initCell mask:(MPSGraphTensor *)mask peephole:(MPSGraphTensor *)peephole descriptor:(MPSGraphLSTMDescriptor *)descriptor name:(NSString *)name
{
  v100[2] = *MEMORY[0x1E4F143B8];
  unint64_t v18 = source;
  v92 = recurrentWeight;
  uint64_t v19 = inputWeight;
  v91 = bias;
  v89 = initState;
  v87 = initCell;
  int64_t v20 = self;
  v88 = mask;
  v90 = peephole;
  int v21 = descriptor;
  v93 = name;
  double v22 = v18;
  v85 = v22;
  v86 = v19;
  if (v19)
  {
    long long v23 = [(MPSGraph *)self transposeTensor:v19 dimension:0 withDimension:1 name:@"W^T"];
    uint64_t v24 = [NSString stringWithFormat:@"%@ W^T", v93];
    double v22 = [(MPSGraph *)self matrixMultiplicationWithPrimaryTensor:v22 secondaryTensor:v23 name:v24];
  }
  if (![(MPSGraphLSTMDescriptor *)v21 bidirectional])
  {
    if (v91)
    {
      uint64_t v58 = NSString;
      v59 = [(MPSGraphTensor *)v22 name];
      v60 = [v58 stringWithFormat:@"%@ + b", v59];
      uint64_t v61 = [(MPSGraph *)self additionWithPrimaryTensor:v22 secondaryTensor:v91 name:v60];

      double v22 = (MPSGraphTensor *)v61;
    }
    long long v34 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:6];
    id v25 = (unsigned char *)[(MPSGraphLSTMDescriptor *)v21 copy];

    if ([v25 reverse])
    {
      id v62 = [(MPSGraphTensor *)v22 name];
      uint64_t v63 = [(MPSGraph *)self reverseTensor:v22 axes:&unk_1EC9F1568 name:v62];

      double v22 = (MPSGraphTensor *)v63;
    }
    [v25 setReverse:0];
    [v34 addObject:v22];
    [v34 addObject:v92];
    if (v89)
    {
      [v34 addObject:v89];
      v25[9] = 1;
    }
    if (v87)
    {
      [v34 addObject:v87];
      v25[10] = 1;
    }
    if (v88)
    {
      [v34 addObject:v88];
      v25[8] = 1;
    }
    if (v90)
    {
      [v34 addObject:v90];
      v25[11] = 1;
    }
    v64 = [MPSGraphLSTMOp alloc];
    v84 = [(MPSGraphLSTMOp *)v64 initWithGraph:self inputTensors:v34 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v25 name:v93];
    if (([v25 produceCell] & 1) != 0 || objc_msgSend(v25, "training"))
    {
      v65 = [(MPSGraphOperation *)v84 outputTensors];
LABEL_46:

      goto LABEL_47;
    }
    v80 = [(MPSGraphOperation *)v84 outputTensors];
    v81 = [v80 objectAtIndexedSubscript:0];
    v94 = v81;
    v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v94 count:1];
LABEL_45:

    goto LABEL_46;
  }
  id v25 = (unsigned char *)[(MPSGraphLSTMDescriptor *)v21 copy];

  [v25 setBidirectional:0];
  uint64_t v26 = [(MPSGraphTensor *)v92 shape];
  if (v26)
  {
    long long v27 = [(MPSGraphTensor *)v92 shape];
    long long v28 = [v27 lastObject];
    uint64_t v29 = [v28 integerValue];

    if ((v29 & 0x8000000000000000) == 0)
    {
      if (v91)
      {
        uint64_t v30 = NSString;
        uint64_t v31 = [(MPSGraphTensor *)v22 name];
        long long v32 = [v30 stringWithFormat:@"%@ + b", v31];
        uint64_t v33 = [(MPSGraph *)v20 additionWithPrimaryTensor:v22 secondaryTensor:v91 name:v32];

        double v22 = (MPSGraphTensor *)v33;
      }
      long long v34 = [(MPSGraph *)v20 sliceTensor:v22 dimension:-1 start:0 length:4 * v29 name:0];
      uint64_t v35 = [(MPSGraph *)v20 sliceTensor:v22 dimension:-1 start:4 * v29 length:4 * v29 name:0];
      v80 = [(MPSGraph *)v20 sliceTensor:v92 dimension:0 start:0 length:1 name:0];
      v81 = [(MPSGraph *)v20 sliceTensor:v92 dimension:0 start:1 length:1 name:0];
      v84 = [(MPSGraph *)v20 reverseTensor:v35 axes:&unk_1EC9F1508 name:0];

      v82 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:8];
      v83 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:8];
      [v82 addObject:v34];
      [v82 addObject:v80];
      [v83 addObject:v84];
      [v83 addObject:v81];
      if (v89)
      {
        v36 = [(MPSGraph *)v20 sliceTensor:v89 dimension:-1 start:0 length:v29 name:0];
        uint64_t v37 = [(MPSGraph *)v20 sliceTensor:v89 dimension:-1 start:v29 length:v29 name:0];
        [v82 addObject:v36];
        [v83 addObject:v37];
        v25[9] = 1;
      }
      if (v87)
      {
        uint64_t v38 = [(MPSGraph *)v20 sliceTensor:v87 dimension:-1 start:0 length:v29 name:0];
        v39 = [(MPSGraph *)v20 sliceTensor:v87 dimension:-1 start:v29 length:v29 name:0];
        [v82 addObject:v38];
        [v83 addObject:v39];
        v25[10] = 1;
      }
      if (v88)
      {
        v40 = [(MPSGraph *)v20 sliceTensor:v88 dimension:-1 start:0 length:v29 name:0];
        uint64_t v41 = [(MPSGraph *)v20 sliceTensor:v88 dimension:-1 start:v29 length:v29 name:0];
        [v82 addObject:v40];
        [v83 addObject:v41];
        v25[8] = 1;
      }
      if (v90)
      {
        uint64_t v42 = [(MPSGraph *)v20 sliceTensor:v90 dimension:0 start:0 length:1 name:0];
        id v43 = [(MPSGraph *)v20 sliceTensor:v90 dimension:0 start:1 length:1 name:0];
        [v82 addObject:v42];
        [v83 addObject:v43];
        v25[11] = 1;
      }
      uint64_t v44 = [MPSGraphLSTMOp alloc];
      id v79 = [(MPSGraphLSTMOp *)v44 initWithGraph:v20 inputTensors:v82 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v25 name:v93];
      v45 = [MPSGraphLSTMOp alloc];
      id v78 = [(MPSGraphLSTMOp *)v45 initWithGraph:v20 inputTensors:v83 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v25 name:v93];
      uint64_t v46 = [(MPSGraphOperation *)v78 outputTensors];
      uint64_t v47 = [v46 objectAtIndexedSubscript:0];
      id v77 = [(MPSGraph *)v20 reverseTensor:v47 axes:&unk_1EC9F1520 name:0];

      v48 = [(MPSGraphOperation *)v79 outputTensors];
      v49 = [v48 objectAtIndexedSubscript:0];
      v100[0] = v49;
      v100[1] = v77;
      unint64_t v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v100 count:2];
      v76 = [(MPSGraph *)v20 concatTensors:v50 dimension:-1 name:v93];

      if (([v25 produceCell] & 1) != 0 || objc_msgSend(v25, "training"))
      {
        id v51 = [(MPSGraphOperation *)v78 outputTensors];
        v52 = [v51 objectAtIndexedSubscript:1];
        v53 = [(MPSGraph *)v20 reverseTensor:v52 axes:&unk_1EC9F1538 name:0];

        double v54 = [(MPSGraphOperation *)v79 outputTensors];
        v55 = [v54 objectAtIndexedSubscript:1];
        v99[0] = v55;
        v99[1] = v53;
        uint64_t v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:2];
        v57 = [(MPSGraph *)v20 concatTensors:v56 dimension:-1 name:v93];
      }
      else
      {
        v57 = 0;
      }
      if ([v25 training])
      {
        v66 = [(MPSGraphOperation *)v78 outputTensors];
        id v67 = [v66 objectAtIndexedSubscript:2];
        id v75 = [(MPSGraph *)v20 reverseTensor:v67 axes:&unk_1EC9F1550 name:0];

        v68 = [(MPSGraphOperation *)v79 outputTensors];
        v69 = [v68 objectAtIndexedSubscript:2];
        v98[0] = v69;
        v98[1] = v75;
        id v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:2];
        v71 = [NSString stringWithFormat:@"%@ - training state", v93];
        id v72 = [(MPSGraph *)v20 concatTensors:v70 dimension:-1 name:v71];

        v97[0] = v76;
        v97[1] = v57;
        v97[2] = v72;
        v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:3];
      }
      else
      {
        if ([v25 produceCell])
        {
          v96[0] = v76;
          v96[1] = v57;
          uint64_t v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:2];
        }
        else
        {
          v95 = v76;
          uint64_t v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v95 count:1];
        }
        v65 = (void *)v73;
      }

      goto LABEL_45;
    }
  }
  v65 = 0;
  if (MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
LABEL_47:

  return (NSArray *)v65;
}

- (NSArray)LSTMWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState initCell:(MPSGraphTensor *)initCell descriptor:(MPSGraphLSTMDescriptor *)descriptor name:(NSString *)name
{
  id v10 = [(MPSGraph *)self LSTMWithSourceTensor:source recurrentWeight:recurrentWeight inputWeight:inputWeight bias:bias initState:initState initCell:initCell mask:0 peephole:0 descriptor:descriptor name:name];

  return (NSArray *)v10;
}

- (NSArray)LSTMWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight initState:(MPSGraphTensor *)initState initCell:(MPSGraphTensor *)initCell descriptor:(MPSGraphLSTMDescriptor *)descriptor name:(NSString *)name
{
  uint64_t v8 = [(MPSGraph *)self LSTMWithSourceTensor:source recurrentWeight:recurrentWeight inputWeight:0 bias:0 initState:initState initCell:initCell mask:0 peephole:0 descriptor:descriptor name:name];

  return (NSArray *)v8;
}

- (NSArray)LSTMGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState cellOutputFwd:(MPSGraphTensor *)cellOutputFwd stateGradient:(MPSGraphTensor *)stateGradient cellGradient:(MPSGraphTensor *)cellGradient inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState initCell:(MPSGraphTensor *)initCell mask:(MPSGraphTensor *)mask peephole:(MPSGraphTensor *)peephole descriptor:(MPSGraphLSTMDescriptor *)descriptor name:(NSString *)name
{
  v142[2] = *MEMORY[0x1E4F143B8];
  v121 = source;
  v134 = recurrentWeight;
  v135 = sourceGradient;
  v119 = zState;
  v118 = cellOutputFwd;
  v123 = stateGradient;
  v128 = cellGradient;
  v126 = inputWeight;
  v117 = bias;
  v133 = initState;
  v132 = initCell;
  v122 = mask;
  double v22 = peephole;
  long long v23 = descriptor;
  v137 = name;
  v113 = v23;
  v129 = v22;
  uint64_t v24 = (unsigned char *)[(MPSGraphLSTMDescriptor *)v23 copy];
  id v25 = v134;
  if (![v24 bidirectional])
  {
    v136 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:8];
    if (v123)
    {
      unint64_t v50 = [(MPSGraph *)self sliceTensor:v135 dimension:0 start:-1 length:1 name:@"lastSlice"];
      id v51 = [(MPSGraph *)self additionWithPrimaryTensor:v50 secondaryTensor:v123 name:@"total derivative last state"];
      v52 = [(MPSGraph *)self cropTensor:v135 dimension:0 amount_before:0 amount_after:1 name:0];
      v138[0] = v52;
      v138[1] = v51;
      v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v138 count:2];
      uint64_t v54 = [(MPSGraph *)self concatTensors:v53 dimension:0 name:0];

      v55 = (MPSGraphTensor *)v54;
      id v25 = v134;
    }
    else
    {
      v55 = v135;
    }
    v135 = v55;
    objc_msgSend(v136, "addObject:");
    [v136 addObject:v25];
    [v136 addObject:v119];
    [v136 addObject:v118];
    if (v133)
    {
      [v136 addObject:v133];
      v24[9] = 1;
    }
    if (v132)
    {
      [v136 addObject:v132];
      v24[10] = 1;
    }
    if (v122)
    {
      [v136 addObject:v122];
      v24[8] = 1;
    }
    if (v22)
    {
      [v136 addObject:v22];
      v24[11] = 1;
    }
    if (v128)
    {
      [v136 addObject:v128];
      v24[12] = 1;
    }
    v125 = [[MPSGraphLSTMGradientOp alloc] initWithGraph:self inputTensors:v136 controlDependencies:0 descriptor:v24 name:v137];
    v57 = [(MPSGraphOperation *)v125 outputTensors];
    uint64_t v58 = [v57 objectAtIndexedSubscript:0];

    if ([v24 reverse])
    {
      v59 = [v58 name];
      uint64_t v60 = [(MPSGraph *)self reverseTensor:v58 axes:&unk_1EC9F15F8 name:v59];

      uint64_t v58 = (void *)v60;
    }
    uint64_t v61 = [(MPSGraphOperation *)v125 outputTensors];
    v114 = [v61 objectAtIndexedSubscript:1];

    id v30 = v58;
    if (v22)
    {
      id v62 = [(MPSGraphOperation *)v125 outputTensors];
      v120 = [v62 objectAtIndexedSubscript:2];

      uint64_t v63 = 3;
      if (v133) {
        goto LABEL_32;
      }
    }
    else
    {
      v120 = 0;
      uint64_t v63 = 2;
      if (v133)
      {
LABEL_32:
        v64 = [(MPSGraphOperation *)v125 outputTensors];
        v124 = [v64 objectAtIndexedSubscript:v63];

        ++v63;
        if (v132) {
          goto LABEL_33;
        }
        goto LABEL_38;
      }
    }
    v124 = 0;
    if (v132)
    {
LABEL_33:
      v65 = [(MPSGraphOperation *)v125 outputTensors];
      v127 = [v65 objectAtIndexedSubscript:v63];

      unint64_t v66 = 0x1E4F29000uLL;
      if (v126) {
        goto LABEL_34;
      }
      goto LABEL_39;
    }
LABEL_38:
    v127 = 0;
    unint64_t v66 = 0x1E4F29000;
    if (v126)
    {
LABEL_34:
      id v67 = [*(id *)(v66 + 24) stringWithFormat:@"%@ dx", v137];
      v116 = [(MPSGraph *)self matrixMultiplicationWithPrimaryTensor:v30 secondaryTensor:v126 name:v67];

      v68 = [(MPSGraph *)self flatten2DTensor:v30 axis:-1 name:0];
      v69 = [(MPSGraph *)self flatten2DTensor:v121 axis:-1 name:0];
      id v70 = [(MPSGraph *)self transposeTensor:v68 dimension:0 withDimension:1 name:0];
      v71 = [*(id *)(v66 + 24) stringWithFormat:@"%@ dW", v137];
      v130 = [(MPSGraph *)self matrixMultiplicationWithPrimaryTensor:v70 secondaryTensor:v69 name:v71];

      if (v117)
      {
LABEL_35:
        id v72 = [*(id *)(v66 + 24) stringWithFormat:@"%@ db", v137];
        v115 = [(MPSGraph *)self reductionSumWithTensor:v30 axes:&unk_1EC9F1610 name:v72];

LABEL_41:
        uint64_t v56 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:7];
        [v56 addObject:v116];
        [v56 addObject:v114];
        if (v130) {
          [v56 addObject:v130];
        }
        if (v115) {
          [v56 addObject:v115];
        }
        if (v120) {
          [v56 addObject:v120];
        }
        if (v124) {
          [v56 addObject:v124];
        }
        if (v127) {
          objc_msgSend(v56, "addObject:");
        }
        else {
          v127 = 0;
        }
        goto LABEL_73;
      }
LABEL_40:
      v115 = 0;
      goto LABEL_41;
    }
LABEL_39:
    v130 = 0;
    v116 = v30;
    if (v117) {
      goto LABEL_35;
    }
    goto LABEL_40;
  }
  [v24 setBidirectional:0];
  uint64_t v26 = [(MPSGraphTensor *)v134 shape];
  if (v26)
  {
    long long v27 = [(MPSGraphTensor *)v134 shape];
    long long v28 = [v27 lastObject];
    uint64_t v29 = [v28 integerValue];

    if ((v29 & 0x8000000000000000) == 0)
    {
      v136 = [(MPSGraph *)self sliceTensor:v134 dimension:0 start:0 length:1 name:0];
      v125 = [(MPSGraph *)self sliceTensor:v134 dimension:0 start:1 length:1 name:0];
      id v30 = [(MPSGraph *)self sliceTensor:v135 dimension:-1 start:0 length:v29 name:0];
      uint64_t v31 = [(MPSGraph *)self sliceTensor:v135 dimension:-1 start:v29 length:v29 name:0];
      v114 = [(MPSGraph *)self reverseTensor:v31 axes:&unk_1EC9F1580 name:0];

      v124 = [(MPSGraph *)self sliceTensor:v119 dimension:-1 start:0 length:4 * v29 name:0];
      long long v32 = [(MPSGraph *)self sliceTensor:v119 dimension:-1 start:4 * v29 length:4 * v29 name:0];
      v127 = [(MPSGraph *)self reverseTensor:v32 axes:&unk_1EC9F1598 name:0];

      uint64_t v33 = [(MPSGraph *)self sliceTensor:v118 dimension:-1 start:0 length:v29 name:0];
      v116 = (void *)v33;
      long long v34 = [(MPSGraph *)self sliceTensor:v118 dimension:-1 start:v29 length:v29 name:0];
      v130 = [(MPSGraph *)self reverseTensor:v34 axes:&unk_1EC9F15B0 name:0];

      if (v122)
      {
        uint64_t v35 = [(MPSGraph *)self sliceTensor:v122 dimension:-1 start:0 length:v29 name:0];
        v120 = [(MPSGraph *)self sliceTensor:v122 dimension:-1 start:v29 length:v29 name:0];
        v115 = (void *)v35;
        if (v22) {
          goto LABEL_6;
        }
      }
      else
      {
        v120 = 0;
        v115 = 0;
        if (v22)
        {
LABEL_6:
          uint64_t v36 = [(MPSGraph *)self sliceTensor:v22 dimension:0 start:0 length:1 name:0];
          v99 = [(MPSGraph *)self sliceTensor:v22 dimension:0 start:1 length:1 name:0];
          v102 = (void *)v36;
          uint64_t v37 = v133;
          if (v133) {
            goto LABEL_7;
          }
          goto LABEL_55;
        }
      }
      v99 = 0;
      v102 = 0;
      uint64_t v37 = v133;
      if (v133)
      {
LABEL_7:
        uint64_t v38 = [(MPSGraph *)self sliceTensor:v37 dimension:-1 start:0 length:v29 name:0];
        v100 = [(MPSGraph *)self sliceTensor:v37 dimension:-1 start:v29 length:v29 name:0];
        v104 = (void *)v38;
        v39 = v132;
        if (v132) {
          goto LABEL_8;
        }
        goto LABEL_56;
      }
LABEL_55:
      v100 = 0;
      v104 = 0;
      v39 = v132;
      if (v132)
      {
LABEL_8:
        uint64_t v40 = [(MPSGraph *)self sliceTensor:v39 dimension:-1 start:0 length:v29 name:0];
        v101 = [(MPSGraph *)self sliceTensor:v39 dimension:-1 start:v29 length:v29 name:0];
        v106 = (void *)v40;
        uint64_t v41 = v123;
        if (v123) {
          goto LABEL_9;
        }
        goto LABEL_57;
      }
LABEL_56:
      v106 = 0;
      v101 = 0;
      uint64_t v41 = v123;
      if (v123)
      {
LABEL_9:
        uint64_t v42 = [(MPSGraph *)self sliceTensor:v41 dimension:-1 start:0 length:v29 name:0];
        v103 = [(MPSGraph *)self sliceTensor:v41 dimension:-1 start:v29 length:v29 name:0];
        v107 = (void *)v42;
        id v43 = v128;
        if (v128)
        {
LABEL_10:
          uint64_t v44 = [(MPSGraph *)self sliceTensor:v43 dimension:-1 start:0 length:v29 name:0];
          v45 = [(MPSGraph *)self sliceTensor:v128 dimension:-1 start:v29 length:v29 name:0];
          uint64_t v46 = [(MPSGraphTensor *)v128 shape];
          if (v46
            && ([(MPSGraphTensor *)v128 shape],
                uint64_t v47 = objc_claimAutoreleasedReturnValue(),
                unint64_t v48 = [v47 count],
                v47,
                v46,
                v48 >= 3))
          {
            uint64_t v49 = [(MPSGraph *)self reverseTensor:v45 axes:&unk_1EC9F15C8 name:0];

            v105 = (void *)v44;
            v110 = (void *)v49;
          }
          else
          {
            v105 = (void *)v44;
            v110 = v45;
          }
LABEL_59:
          [v24 setReverse:0];
          v112 = [(MPSGraph *)self LSTMGradientsWithSourceTensor:v121 recurrentWeight:v136 sourceGradient:v30 zState:v124 cellOutputFwd:v33 stateGradient:v107 cellGradient:v105 inputWeight:0 bias:0 initState:v104 initCell:v106 mask:v115 peephole:v102 descriptor:v24 name:v137];
          [v24 setReverse:1];
          v111 = [(MPSGraph *)self LSTMGradientsWithSourceTensor:v121 recurrentWeight:v125 sourceGradient:v114 zState:v127 cellOutputFwd:v130 stateGradient:v103 cellGradient:v110 inputWeight:0 bias:0 initState:v100 initCell:v101 mask:v120 peephole:v99 descriptor:v24 name:v137];
          uint64_t v73 = [v112 objectAtIndexedSubscript:0];
          v142[0] = v73;
          id v74 = [v111 objectAtIndexedSubscript:0];
          v142[1] = v74;
          id v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:v142 count:2];
          v97 = [(MPSGraph *)self concatTensors:v75 dimension:-1 name:@"dz"];

          v76 = [v112 objectAtIndexedSubscript:1];
          v141[0] = v76;
          id v77 = [v111 objectAtIndexedSubscript:1];
          v141[1] = v77;
          id v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:v141 count:2];
          v98 = [(MPSGraph *)self concatTensors:v78 dimension:0 name:@"dR"];

          id v79 = v97;
          if (v133)
          {
            v80 = [v112 objectAtIndexedSubscript:2];
            v140[0] = v80;
            v81 = [v111 objectAtIndexedSubscript:2];
            v140[1] = v81;
            v82 = [MEMORY[0x1E4F1C978] arrayWithObjects:v140 count:2];
            v108 = [(MPSGraph *)self concatTensors:v82 dimension:-1 name:@"dh"];

            uint64_t v83 = 3;
            if (v132) {
              goto LABEL_61;
            }
          }
          else
          {
            v108 = 0;
            uint64_t v83 = 2;
            if (v132)
            {
LABEL_61:
              v84 = [v112 objectAtIndexedSubscript:v83];
              v139[0] = v84;
              v85 = [v111 objectAtIndexedSubscript:v83];
              v139[1] = v85;
              v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:v139 count:2];
              v109 = [(MPSGraph *)self concatTensors:v86 dimension:-1 name:@"dc"];

              if (v126) {
                goto LABEL_62;
              }
              goto LABEL_79;
            }
          }
          v109 = 0;
          if (v126)
          {
LABEL_62:
            v87 = [NSString stringWithFormat:@"%@ dx", v137];
            v88 = [(MPSGraph *)self matrixMultiplicationWithPrimaryTensor:v79 secondaryTensor:v126 name:v87];

            v89 = [(MPSGraph *)self flatten2DTensor:v79 axis:-1 name:0];
            v90 = [(MPSGraph *)self flatten2DTensor:v121 axis:-1 name:0];
            v91 = [(MPSGraph *)self transposeTensor:v89 dimension:0 withDimension:1 name:0];
            v92 = [NSString stringWithFormat:@"%@ dW", v137];
            v93 = [(MPSGraph *)self matrixMultiplicationWithPrimaryTensor:v91 secondaryTensor:v90 name:v92];

            if (v117) {
              goto LABEL_63;
            }
            goto LABEL_80;
          }
LABEL_79:
          v93 = 0;
          v88 = v79;
          if (v117)
          {
LABEL_63:
            v94 = [NSString stringWithFormat:@"%@ db", v137];
            v95 = [(MPSGraph *)self reductionSumWithTensor:v79 axes:&unk_1EC9F15E0 name:v94];

            if (!v129)
            {
LABEL_64:
              uint64_t v56 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:7];
              [v56 addObject:v88];
              [v56 addObject:v98];
              if (v93) {
                [v56 addObject:v93];
              }
              if (v95) {
                [v56 addObject:v95];
              }
              if (v108) {
                [v56 addObject:v108];
              }
              if (v109) {
                [v56 addObject:v109];
              }

LABEL_73:
              goto LABEL_74;
            }
LABEL_81:
            __assert_rtn("-[MPSGraph(MPSGraphRNNOps) LSTMGradientsWithSourceTensor:recurrentWeight:sourceGradient:zState:cellOutputFwd:stateGradient:cellGradient:inputWeight:bias:initState:initCell:mask:peephole:descriptor:name:]", "MPSGraphRNNOps.mm", 1685, "!peephole");
          }
LABEL_80:
          v95 = 0;
          if (!v129) {
            goto LABEL_64;
          }
          goto LABEL_81;
        }
LABEL_58:
        v105 = 0;
        v110 = 0;
        goto LABEL_59;
      }
LABEL_57:
      v107 = 0;
      v103 = 0;
      id v43 = v128;
      if (v128) {
        goto LABEL_10;
      }
      goto LABEL_58;
    }
  }
  uint64_t v56 = 0;
  if (MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
LABEL_74:

  return (NSArray *)v56;
}

- (NSArray)LSTMGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState cellOutputFwd:(MPSGraphTensor *)cellOutputFwd inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState initCell:(MPSGraphTensor *)initCell mask:(MPSGraphTensor *)mask descriptor:(MPSGraphLSTMDescriptor *)descriptor name:(NSString *)name
{
  uint64_t v14 = [(MPSGraph *)self LSTMGradientsWithSourceTensor:source recurrentWeight:recurrentWeight sourceGradient:sourceGradient zState:zState cellOutputFwd:cellOutputFwd stateGradient:0 cellGradient:0 inputWeight:inputWeight bias:bias initState:initState initCell:initCell mask:mask peephole:0 descriptor:descriptor name:name];

  return (NSArray *)v14;
}

- (NSArray)LSTMGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState cellOutputFwd:(MPSGraphTensor *)cellOutputFwd inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState initCell:(MPSGraphTensor *)initCell descriptor:(MPSGraphLSTMDescriptor *)descriptor name:(NSString *)name
{
  id v13 = [(MPSGraph *)self LSTMGradientsWithSourceTensor:source recurrentWeight:recurrentWeight sourceGradient:sourceGradient zState:zState cellOutputFwd:cellOutputFwd stateGradient:0 cellGradient:0 inputWeight:inputWeight bias:bias initState:initState initCell:initCell mask:0 peephole:0 descriptor:descriptor name:name];

  return (NSArray *)v13;
}

- (NSArray)LSTMGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState cellOutputFwd:(MPSGraphTensor *)cellOutputFwd descriptor:(MPSGraphLSTMDescriptor *)descriptor name:(NSString *)name
{
  id v9 = [(MPSGraph *)self LSTMGradientsWithSourceTensor:source recurrentWeight:recurrentWeight sourceGradient:sourceGradient zState:zState cellOutputFwd:cellOutputFwd stateGradient:0 cellGradient:0 inputWeight:0 bias:0 initState:0 initCell:0 mask:0 peephole:0 descriptor:descriptor name:name];

  return (NSArray *)v9;
}

- (NSArray)GRUWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState mask:(MPSGraphTensor *)mask secondaryBias:(MPSGraphTensor *)secondaryBias descriptor:(MPSGraphGRUDescriptor *)descriptor name:(NSString *)name
{
  v87[2] = *MEMORY[0x1E4F143B8];
  id v17 = source;
  uint64_t v83 = recurrentWeight;
  unint64_t v18 = inputWeight;
  v82 = bias;
  v80 = initState;
  id v79 = mask;
  v81 = secondaryBias;
  uint64_t v19 = descriptor;
  int64_t v20 = name;
  int v21 = v17;
  double v22 = v21;
  id v78 = v18;
  if (v18)
  {
    long long v23 = [(MPSGraph *)self transposeTensor:v18 dimension:0 withDimension:1 name:@"W^T"];
    uint64_t v24 = [NSString stringWithFormat:@"%@ W^T", v20];
    double v22 = [(MPSGraph *)self matrixMultiplicationWithPrimaryTensor:v21 secondaryTensor:v23 name:v24];
  }
  if ([(MPSGraphGRUDescriptor *)v19 bidirectional])
  {
    id v25 = (unsigned char *)[(MPSGraphGRUDescriptor *)v19 copy];

    [v25 setBidirectional:0];
    uint64_t v26 = [(MPSGraphTensor *)v83 shape];
    if (!v26) {
      goto LABEL_27;
    }
    long long v27 = [(MPSGraphTensor *)v83 shape];
    long long v28 = [v27 lastObject];
    uint64_t v29 = [v28 integerValue];

    if (v29 < 0)
    {
LABEL_27:
      uint64_t v56 = 0;
      if (MTLReportFailureTypeEnabled()) {
        MTLReportFailure();
      }
    }
    else
    {
      if (v82)
      {
        id v30 = NSString;
        uint64_t v31 = [v22 name];
        long long v32 = [v30 stringWithFormat:@"%@ + b", v31];
        uint64_t v33 = [(MPSGraph *)self additionWithPrimaryTensor:v22 secondaryTensor:v82 name:v32];

        double v22 = (void *)v33;
      }
      uint64_t v34 = [(MPSGraph *)self sliceTensor:v22 dimension:-1 start:0 length:3 * v29 name:0];
      uint64_t v35 = [(MPSGraph *)self sliceTensor:v22 dimension:-1 start:3 * v29 length:3 * v29 name:0];
      v71 = (void *)v34;
      uint64_t v73 = [(MPSGraph *)self sliceTensor:v83 dimension:0 start:0 length:1 name:0];
      id v74 = [(MPSGraph *)self sliceTensor:v83 dimension:0 start:1 length:1 name:0];
      id v72 = [(MPSGraph *)self reverseTensor:v35 axes:&unk_1EC9F1628 name:0];

      id v77 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:8];
      v76 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:8];
      [v77 addObject:v34];
      [v77 addObject:v73];
      [v76 addObject:v72];
      [v76 addObject:v74];
      if (v80)
      {
        uint64_t v36 = [(MPSGraph *)self sliceTensor:v80 dimension:-1 start:0 length:v29 name:0];
        uint64_t v37 = [(MPSGraph *)self sliceTensor:v80 dimension:-1 start:v29 length:v29 name:0];
        [v77 addObject:v36];
        [v76 addObject:v37];
        v25[9] = 1;
      }
      if (v79)
      {
        uint64_t v38 = [(MPSGraph *)self sliceTensor:v79 dimension:-1 start:0 length:v29 name:0];
        v39 = [(MPSGraph *)self sliceTensor:v79 dimension:-1 start:v29 length:v29 name:0];
        [v77 addObject:v38];
        [v76 addObject:v39];
        v25[8] = 1;
      }
      if (v81)
      {
        uint64_t v40 = [(MPSGraph *)self sliceTensor:v81 dimension:-1 start:0 length:v29 name:0];
        uint64_t v41 = [(MPSGraph *)self sliceTensor:v81 dimension:-1 start:v29 length:v29 name:0];
        [v77 addObject:v40];
        [v76 addObject:v41];
        v25[10] = 1;
      }
      uint64_t v42 = [MPSGraphGRUOp alloc];
      id v75 = [(MPSGraphGRUOp *)v42 initWithGraph:self inputTensors:v77 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v25 name:v20];
      id v43 = [MPSGraphGRUOp alloc];
      v68 = [(MPSGraphGRUOp *)v43 initWithGraph:self inputTensors:v76 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v25 name:v20];
      uint64_t v44 = [(MPSGraphOperation *)v68 outputTensors];
      v45 = [v44 objectAtIndexedSubscript:0];
      id v70 = [(MPSGraph *)self reverseTensor:v45 axes:&unk_1EC9F1640 name:0];

      uint64_t v46 = [(MPSGraphOperation *)v75 outputTensors];
      uint64_t v47 = [v46 objectAtIndexedSubscript:0];
      v87[0] = v47;
      v87[1] = v70;
      unint64_t v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:2];
      v69 = [(MPSGraph *)self concatTensors:v48 dimension:-1 name:v20];

      if ([v25 training])
      {
        uint64_t v49 = [(MPSGraphOperation *)v68 outputTensors];
        unint64_t v50 = [v49 objectAtIndexedSubscript:1];
        id v67 = [(MPSGraph *)self reverseTensor:v50 axes:&unk_1EC9F1658 name:0];

        id v51 = [(MPSGraphOperation *)v75 outputTensors];
        v52 = [v51 objectAtIndexedSubscript:1];
        v86[0] = v52;
        v86[1] = v67;
        v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:2];
        uint64_t v54 = [NSString stringWithFormat:@"%@ - training state", v20];
        v55 = [(MPSGraph *)self concatTensors:v53 dimension:-1 name:v54];

        v85[0] = v69;
        v85[1] = v55;
        uint64_t v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:2];
      }
      else
      {
        v84 = v69;
        uint64_t v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
      }
    }
  }
  else
  {
    if (v82)
    {
      v57 = NSString;
      uint64_t v58 = [v22 name];
      v59 = [v57 stringWithFormat:@"%@ + b", v58];
      uint64_t v60 = [(MPSGraph *)self additionWithPrimaryTensor:v22 secondaryTensor:v82 name:v59];

      double v22 = (void *)v60;
    }
    uint64_t v61 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:6];
    id v25 = (unsigned char *)[(MPSGraphGRUDescriptor *)v19 copy];

    if ([v25 reverse])
    {
      id v62 = [v22 name];
      uint64_t v63 = [(MPSGraph *)self reverseTensor:v22 axes:&unk_1EC9F1670 name:v62];

      double v22 = (void *)v63;
    }
    [v25 setReverse:0];
    [v61 addObject:v22];
    [v61 addObject:v83];
    if (v80)
    {
      [v61 addObject:v80];
      v25[9] = 1;
    }
    if (v79)
    {
      [v61 addObject:v79];
      v25[8] = 1;
    }
    if (v81)
    {
      [v61 addObject:v81];
      v25[10] = 1;
    }
    v64 = [MPSGraphGRUOp alloc];
    v65 = [(MPSGraphGRUOp *)v64 initWithGraph:self inputTensors:v61 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v25 name:v20];
    uint64_t v56 = [(MPSGraphOperation *)v65 outputTensors];
  }

  return (NSArray *)v56;
}

- (NSArray)GRUWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState descriptor:(MPSGraphGRUDescriptor *)descriptor name:(NSString *)name
{
  id v9 = [(MPSGraph *)self GRUWithSourceTensor:source recurrentWeight:recurrentWeight inputWeight:inputWeight bias:bias initState:initState mask:0 secondaryBias:0 descriptor:descriptor name:name];

  return (NSArray *)v9;
}

- (NSArray)GRUWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias descriptor:(MPSGraphGRUDescriptor *)descriptor name:(NSString *)name
{
  uint64_t v8 = [(MPSGraph *)self GRUWithSourceTensor:source recurrentWeight:recurrentWeight inputWeight:inputWeight bias:bias initState:0 mask:0 secondaryBias:0 descriptor:descriptor name:name];

  return (NSArray *)v8;
}

- (NSArray)GRUGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState outputFwd:(MPSGraphTensor *)outputFwd stateGradient:(MPSGraphTensor *)stateGradient inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState mask:(MPSGraphTensor *)mask secondaryBias:(MPSGraphTensor *)secondaryBias descriptor:(MPSGraphGRUDescriptor *)descriptor name:(NSString *)name
{
  v130[2] = *MEMORY[0x1E4F143B8];
  v112 = source;
  v121 = recurrentWeight;
  v119 = sourceGradient;
  v122 = zState;
  v109 = outputFwd;
  v116 = stateGradient;
  v115 = inputWeight;
  v124 = initState;
  v114 = mask;
  v120 = secondaryBias;
  int64_t v20 = descriptor;
  v123 = name;
  v105 = v20;
  int v21 = (unsigned char *)[(MPSGraphGRUDescriptor *)v20 copy];
  double v22 = v121;
  long long v23 = v122;
  uint64_t v24 = v119;
  id v25 = v124;
  uint64_t v26 = self;
  if (![v21 bidirectional])
  {
    v118 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:7];
    if (v116)
    {
      v45 = [(MPSGraph *)self sliceTensor:v119 dimension:0 start:-1 length:1 name:@"lastSlice"];
      uint64_t v46 = [(MPSGraph *)self additionWithPrimaryTensor:v45 secondaryTensor:v116 name:@"total derivative last state"];
      uint64_t v47 = [(MPSGraph *)self cropTensor:v119 dimension:0 amount_before:0 amount_after:1 name:0];
      v126[0] = v47;
      v126[1] = v46;
      unint64_t v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v126 count:2];
      uint64_t v49 = [(MPSGraph *)self concatTensors:v48 dimension:0 name:0];

      uint64_t v24 = (MPSGraphTensor *)v49;
      double v22 = v121;
      long long v23 = v122;
      id v25 = v124;
      uint64_t v26 = self;
    }
    v119 = v24;
    [v118 addObject:v24];
    [v118 addObject:v22];
    [v118 addObject:v23];
    [v118 addObject:v109];
    if (v25)
    {
      [v118 addObject:v25];
      v21[9] = 1;
    }
    if (v114)
    {
      [v118 addObject:v114];
      v21[8] = 1;
    }
    if (v120)
    {
      [v118 addObject:v120];
      v21[10] = 1;
    }
    v111 = [[MPSGraphGRUGradientOp alloc] initWithGraph:v26 inputTensors:v118 controlDependencies:0 descriptor:v21 name:v123];
    unint64_t v50 = [(MPSGraphOperation *)v111 outputTensors];
    id v51 = [v50 objectAtIndexedSubscript:0];

    v52 = v124;
    if ([v21 reverse])
    {
      v53 = [v51 name];
      uint64_t v54 = [(MPSGraph *)self reverseTensor:v51 axes:&unk_1EC9F16E8 name:v53];

      id v51 = (void *)v54;
      v52 = v124;
    }
    v55 = [(MPSGraphOperation *)v111 outputTensors];
    v106 = [v55 objectAtIndexedSubscript:1];

    id v31 = v51;
    if (v52)
    {
      uint64_t v56 = [(MPSGraphOperation *)v111 outputTensors];
      v110 = [v56 objectAtIndexedSubscript:2];

      uint64_t v57 = 3;
      uint64_t v58 = self;
      if (v120) {
        goto LABEL_23;
      }
    }
    else
    {
      v110 = 0;
      uint64_t v57 = 2;
      uint64_t v58 = self;
      if (v120)
      {
LABEL_23:
        v59 = [(MPSGraphOperation *)v111 outputTensors];
        v113 = [v59 objectAtIndexedSubscript:v57];

        uint64_t v58 = self;
        unint64_t v60 = 0x1E4F29000uLL;
        if (v115) {
          goto LABEL_24;
        }
        goto LABEL_30;
      }
    }
    v113 = 0;
    unint64_t v60 = 0x1E4F29000;
    if (v115)
    {
LABEL_24:
      uint64_t v61 = [*(id *)(v60 + 24) stringWithFormat:@"%@ dx", v123];
      v108 = [(MPSGraph *)v58 matrixMultiplicationWithPrimaryTensor:v31 secondaryTensor:v115 name:v61];

      id v62 = [(MPSGraph *)self flatten2DTensor:v31 axis:-1 name:0];
      uint64_t v63 = [(MPSGraph *)self flatten2DTensor:v112 axis:-1 name:0];
      v64 = [(MPSGraph *)self transposeTensor:v62 dimension:0 withDimension:1 name:0];
      v65 = [*(id *)(v60 + 24) stringWithFormat:@"%@ dW", v123];
      v117 = [(MPSGraph *)self matrixMultiplicationWithPrimaryTensor:v64 secondaryTensor:v63 name:v65];

      uint64_t v58 = self;
      if (bias)
      {
LABEL_25:
        unint64_t v66 = [*(id *)(v60 + 24) stringWithFormat:@"%@ db", v123];
        v107 = [(MPSGraph *)v58 reductionSumWithTensor:v31 axes:&unk_1EC9F1700 name:v66];

LABEL_32:
        id v67 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:7];
        [v67 addObject:v108];
        [v67 addObject:v106];
        if (v117) {
          [v67 addObject:v117];
        }
        if (v107) {
          [v67 addObject:v107];
        }
        if (v110) {
          [v67 addObject:v110];
        }
        if (!v113)
        {

LABEL_64:
          goto LABEL_65;
        }
        objc_msgSend(v67, "addObject:");
LABEL_63:

        goto LABEL_64;
      }
LABEL_31:
      v107 = 0;
      goto LABEL_32;
    }
LABEL_30:
    v117 = 0;
    v108 = v31;
    if (bias) {
      goto LABEL_25;
    }
    goto LABEL_31;
  }
  [v21 setBidirectional:0];
  long long v27 = [(MPSGraphTensor *)v121 shape];
  if (v27)
  {
    long long v28 = [(MPSGraphTensor *)v121 shape];
    uint64_t v29 = [v28 lastObject];
    uint64_t v30 = [v29 integerValue];

    if ((v30 & 0x8000000000000000) == 0)
    {
      v118 = [(MPSGraph *)self sliceTensor:v121 dimension:0 start:0 length:1 name:0];
      v111 = [(MPSGraph *)self sliceTensor:v121 dimension:0 start:1 length:1 name:0];
      id v31 = [(MPSGraph *)self sliceTensor:v119 dimension:-1 start:0 length:v30 name:0];
      long long v32 = [(MPSGraph *)self sliceTensor:v119 dimension:-1 start:v30 length:v30 name:0];
      v106 = [(MPSGraph *)self reverseTensor:v32 axes:&unk_1EC9F1688 name:0];

      int v33 = [v21 resetAfter];
      uint64_t v34 = 3;
      if (v33) {
        uint64_t v34 = 4;
      }
      uint64_t v35 = v34 * v30;
      v110 = [(MPSGraph *)self sliceTensor:v122 dimension:-1 start:0 length:v34 * v30 name:0];
      uint64_t v36 = [(MPSGraph *)self sliceTensor:v122 dimension:-1 start:v35 length:v35 name:0];
      uint64_t v37 = [(MPSGraph *)self reverseTensor:v36 axes:&unk_1EC9F16A0 name:0];

      v117 = [(MPSGraph *)self sliceTensor:v109 dimension:-1 start:0 length:v30 name:0];
      v108 = (void *)v37;
      uint64_t v38 = [(MPSGraph *)self sliceTensor:v109 dimension:-1 start:v30 length:v30 name:0];
      v107 = [(MPSGraph *)self reverseTensor:v38 axes:&unk_1EC9F16B8 name:0];

      if (v114)
      {
        uint64_t v39 = [(MPSGraph *)self sliceTensor:v114 dimension:-1 start:0 length:v30 name:0];
        v95 = [(MPSGraph *)self sliceTensor:v114 dimension:-1 start:v30 length:v30 name:0];
        v113 = (void *)v39;
        uint64_t v40 = v120;
        if (v120) {
          goto LABEL_8;
        }
      }
      else
      {
        v95 = 0;
        v113 = 0;
        uint64_t v40 = v120;
        if (v120)
        {
LABEL_8:
          uint64_t v41 = [(MPSGraph *)self sliceTensor:v40 dimension:-1 start:0 length:v30 name:0];
          v96 = [(MPSGraph *)self sliceTensor:v40 dimension:-1 start:v30 length:v30 name:0];
          v92 = (void *)v41;
          if (v124) {
            goto LABEL_9;
          }
          goto LABEL_43;
        }
      }
      v96 = 0;
      uint64_t v41 = 0;
      v92 = 0;
      if (v124)
      {
LABEL_9:
        uint64_t v42 = [(MPSGraph *)self sliceTensor:v124 dimension:-1 start:0 length:v30 name:0];
        v97 = [(MPSGraph *)self sliceTensor:v124 dimension:-1 start:v30 length:v30 name:0];
        v98 = (void *)v42;
        id v43 = v116;
        if (v116)
        {
LABEL_10:
          uint64_t v44 = [(MPSGraph *)self sliceTensor:v43 dimension:-1 start:0 length:v30 name:0];
          [(MPSGraph *)self sliceTensor:v116 dimension:-1 start:v30 length:v30 name:0];
          v101 = v99 = (void *)v44;
          goto LABEL_45;
        }
LABEL_44:
        v99 = 0;
        v101 = 0;
LABEL_45:
        [v21 setReverse:0];
        v104 = [(MPSGraph *)self GRUGradientsWithSourceTensor:v112 recurrentWeight:v118 sourceGradient:v31 zState:v110 outputFwd:v117 stateGradient:v99 inputWeight:0 bias:0 initState:v98 mask:v113 secondaryBias:v41 descriptor:v21 name:v123];
        [v21 setReverse:1];
        v103 = [(MPSGraph *)self GRUGradientsWithSourceTensor:v112 recurrentWeight:v111 sourceGradient:v106 zState:v37 outputFwd:v107 stateGradient:v101 inputWeight:0 bias:0 initState:v97 mask:v95 secondaryBias:v96 descriptor:v21 name:v123];
        v68 = [v104 objectAtIndexedSubscript:0];
        v130[0] = v68;
        v69 = [v103 objectAtIndexedSubscript:0];
        v130[1] = v69;
        id v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v130 count:2];
        v93 = [(MPSGraph *)self concatTensors:v70 dimension:-1 name:@"dz"];

        v71 = [v104 objectAtIndexedSubscript:1];
        v129[0] = v71;
        id v72 = [v103 objectAtIndexedSubscript:1];
        v129[1] = v72;
        uint64_t v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:v129 count:2];
        v94 = [(MPSGraph *)self concatTensors:v73 dimension:0 name:@"dR"];

        id v74 = v93;
        if (v124)
        {
          id v75 = [v104 objectAtIndexedSubscript:2];
          v128[0] = v75;
          v76 = [v103 objectAtIndexedSubscript:2];
          v128[1] = v76;
          id v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:v128 count:2];
          v100 = [(MPSGraph *)self concatTensors:v77 dimension:-1 name:@"dh"];

          uint64_t v78 = 3;
          if (v120) {
            goto LABEL_47;
          }
        }
        else
        {
          v100 = 0;
          uint64_t v78 = 2;
          if (v120)
          {
LABEL_47:
            id v79 = [v104 objectAtIndexedSubscript:v78];
            v127[0] = v79;
            v80 = [v103 objectAtIndexedSubscript:v78];
            v127[1] = v80;
            v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:v127 count:2];
            v82 = [(MPSGraph *)self concatTensors:v81 dimension:-1 name:@"db2"];

            if (v115) {
              goto LABEL_48;
            }
            goto LABEL_52;
          }
        }
        v82 = 0;
        if (v115)
        {
LABEL_48:
          uint64_t v83 = [NSString stringWithFormat:@"%@ dx", v123];
          v102 = [(MPSGraph *)self matrixMultiplicationWithPrimaryTensor:v74 secondaryTensor:v115 name:v83];

          v84 = [(MPSGraph *)self flatten2DTensor:v74 axis:-1 name:0];
          v85 = [(MPSGraph *)self flatten2DTensor:v112 axis:-1 name:0];
          v86 = [(MPSGraph *)self transposeTensor:v84 dimension:0 withDimension:1 name:0];
          v87 = [NSString stringWithFormat:@"%@ dW", v123];
          v88 = [(MPSGraph *)self matrixMultiplicationWithPrimaryTensor:v86 secondaryTensor:v85 name:v87];

          if (bias)
          {
LABEL_49:
            v89 = [NSString stringWithFormat:@"%@ db", v123];
            v90 = [(MPSGraph *)self reductionSumWithTensor:v74 axes:&unk_1EC9F16D0 name:v89];

LABEL_54:
            id v67 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:7];
            [v67 addObject:v102];
            [v67 addObject:v94];
            if (v88) {
              [v67 addObject:v88];
            }
            if (v90) {
              [v67 addObject:v90];
            }
            if (v100) {
              [v67 addObject:v100];
            }
            if (v82) {
              [v67 addObject:v82];
            }

            goto LABEL_63;
          }
LABEL_53:
          v90 = 0;
          goto LABEL_54;
        }
LABEL_52:
        v88 = 0;
        v102 = v74;
        if (bias) {
          goto LABEL_49;
        }
        goto LABEL_53;
      }
LABEL_43:
      v97 = 0;
      v98 = 0;
      id v43 = v116;
      if (v116) {
        goto LABEL_10;
      }
      goto LABEL_44;
    }
  }
  id v67 = 0;
  if (MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
LABEL_65:

  return (NSArray *)v67;
}

- (NSArray)GRUGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState outputFwd:(MPSGraphTensor *)outputFwd inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias initState:(MPSGraphTensor *)initState descriptor:(MPSGraphGRUDescriptor *)descriptor name:(NSString *)name
{
  int v12 = [(MPSGraph *)self GRUGradientsWithSourceTensor:source recurrentWeight:recurrentWeight sourceGradient:sourceGradient zState:zState outputFwd:outputFwd stateGradient:0 inputWeight:inputWeight bias:bias initState:initState mask:0 secondaryBias:0 descriptor:descriptor name:name];

  return (NSArray *)v12;
}

- (NSArray)GRUGradientsWithSourceTensor:(MPSGraphTensor *)source recurrentWeight:(MPSGraphTensor *)recurrentWeight sourceGradient:(MPSGraphTensor *)sourceGradient zState:(MPSGraphTensor *)zState outputFwd:(MPSGraphTensor *)outputFwd inputWeight:(MPSGraphTensor *)inputWeight bias:(MPSGraphTensor *)bias descriptor:(MPSGraphGRUDescriptor *)descriptor name:(NSString *)name
{
  int v11 = [(MPSGraph *)self GRUGradientsWithSourceTensor:source recurrentWeight:recurrentWeight sourceGradient:sourceGradient zState:zState outputFwd:outputFwd stateGradient:0 inputWeight:inputWeight bias:bias initState:0 mask:0 secondaryBias:0 descriptor:descriptor name:name];

  return (NSArray *)v11;
}

- (NSArray)controlDependencyWithOperations:(NSArray *)operations dependentBlock:(MPSGraphControlFlowDependencyBlock)dependentBlock name:(NSString *)name
{
  id v7 = operations;
  uint64_t v8 = dependentBlock;
  p_graphMutex = &self->_graphMutex;
  pthread_mutex_lock(&self->_graphMutex);
  p_currentControlDependencies = &self->_currentControlDependencies;
  int v11 = (void *)[(NSSet *)self->_currentControlDependencies copy];
  uint64_t v12 = [(NSSet *)*p_currentControlDependencies setByAddingObjectsFromArray:v7];
  id v13 = *p_currentControlDependencies;
  *p_currentControlDependencies = (NSSet *)v12;

  uint64_t v14 = v8[2](v8);
  objc_storeStrong((id *)p_currentControlDependencies, v11);
  pthread_mutex_unlock(p_graphMutex);

  return (NSArray *)v14;
}

- (NSArray)ifWithPredicateTensor:(MPSGraphTensor *)predicateTensor thenBlock:(MPSGraphIfThenElseBlock)thenBlock elseBlock:(MPSGraphIfThenElseBlock)elseBlock name:(NSString *)name
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v10 = predicateTensor;
  MPSGraphIfThenElseBlock v11 = thenBlock;
  MPSGraphIfThenElseBlock v12 = elseBlock;
  id v13 = name;
  uint64_t v14 = [(MPSGraph *)self castTensor:v10 toType:2147483656 name:@"if_cast"];
  uint64_t v15 = [(MPSGraph *)self reshapeTensor:v14 withShape:MEMORY[0x1E4F1CBF0] name:0];
  id v16 = [MPSGraphIfElseOp alloc];
  v21[0] = v15;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  unint64_t v18 = [(MPSGraphIfElseOp *)v16 initWithGraph:self inputTensors:v17 controlDependencies:MEMORY[0x1E4F1CBF0] trueBlock:v11 falseBlock:v12 name:v13];

  uint64_t v19 = [(MPSGraphOperation *)v18 outputTensors];

  return (NSArray *)v19;
}

- (NSArray)whileWithInitialInputs:(NSArray *)initialInputs before:(MPSGraphWhileBeforeBlock)before after:(MPSGraphWhileAfterBlock)after name:(NSString *)name
{
  id v10 = initialInputs;
  MPSGraphWhileBeforeBlock v11 = before;
  MPSGraphWhileAfterBlock v12 = after;
  id v13 = name;
  uint64_t v14 = [MPSGraphWhileOp alloc];
  uint64_t v15 = [(MPSGraphWhileOp *)v14 initWithGraph:self inputTensors:v10 controlDependencies:MEMORY[0x1E4F1CBF0] beforeBlock:v11 afterBlock:v12 name:v13];
  id v16 = [(MPSGraphOperation *)v15 outputTensors];

  return (NSArray *)v16;
}

- (NSArray)forLoopWithNumberOfIterations:(MPSGraphTensor *)numberOfIterations initialBodyArguments:(NSArray *)initialBodyArguments body:(MPSGraphForLoopBodyBlock)body name:(NSString *)name
{
  id v10 = numberOfIterations;
  MPSGraphWhileBeforeBlock v11 = initialBodyArguments;
  MPSGraphForLoopBodyBlock v12 = body;
  id v13 = name;
  uint64_t v14 = [(MPSGraph *)self constantWithScalar:MEMORY[0x1E4F1CBF0] shape:536870944 dataType:0.0];
  uint64_t v15 = [(MPSGraph *)self constantWithScalar:MEMORY[0x1E4F1CBF0] shape:536870944 dataType:1.0];
  id v16 = [(MPSGraph *)self forLoopWithLowerBound:v14 upperBound:v10 step:v15 initialBodyArguments:v11 body:v12 name:v13];

  return (NSArray *)v16;
}

- (NSArray)forLoopWithLowerBound:(MPSGraphTensor *)lowerBound upperBound:(MPSGraphTensor *)upperBound step:(MPSGraphTensor *)step initialBodyArguments:(NSArray *)initialBodyArguments body:(MPSGraphForLoopBodyBlock)body name:(NSString *)name
{
  v34[3] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = lowerBound;
  int v33 = upperBound;
  long long v32 = step;
  uint64_t v15 = initialBodyArguments;
  MPSGraphForLoopBodyBlock v30 = body;
  id v31 = name;
  uint64_t v29 = v14;
  id v16 = [(MPSGraph *)self reshapeTensor:v14 withShape:MEMORY[0x1E4F1CBF0] name:0];
  id v17 = [(MPSGraph *)self castTensor:v16 toType:2147483680 name:@"for_cast"];
  unint64_t v18 = [(MPSGraph *)self reshapeTensor:v33 withShape:MEMORY[0x1E4F1CBF0] name:0];
  uint64_t v19 = [(MPSGraph *)self castTensor:v18 toType:2147483680 name:@"for_cast"];
  int64_t v20 = [(MPSGraph *)self reshapeTensor:v32 withShape:MEMORY[0x1E4F1CBF0] name:0];
  int v21 = [(MPSGraph *)self castTensor:v20 toType:2147483680 name:@"for_cast"];
  double v22 = (void *)MEMORY[0x1E4F1CA48];
  v34[0] = v17;
  v34[1] = v19;
  v34[2] = v21;
  long long v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:3];
  uint64_t v24 = [v22 arrayWithArray:v23];

  [v24 addObjectsFromArray:v15];
  id v25 = [MPSGraphForLoopOp alloc];
  uint64_t v26 = [(MPSGraphForLoopOp *)v25 initWithGraph:self inputTensors:v24 controlDependencies:MEMORY[0x1E4F1CBF0] bodyBlock:v30 iterArgs:v15 name:v31];
  long long v27 = [(MPSGraphOperation *)v26 outputTensors];

  return (NSArray *)v27;
}

- (MPSGraphTensor)depthwiseConvolution2DWithSourceTensor:(MPSGraphTensor *)source weightsTensor:(MPSGraphTensor *)weights descriptor:(MPSGraphDepthwiseConvolution2DOpDescriptor *)descriptor name:(NSString *)name
{
  v110[3] = *MEMORY[0x1E4F143B8];
  id v9 = source;
  v102 = weights;
  id v10 = descriptor;
  v100 = name;
  v101 = v9;
  v99 = v10;
  MPSGraphWhileBeforeBlock v11 = [(MPSGraphTensor *)v9 shape];
  if ([v11 count] != 4)
  {
    MPSGraphForLoopBodyBlock v12 = [(MPSGraphTensor *)v9 shape];
    [v12 count];
  }
  id v13 = [(MPSGraphTensor *)v9 shape];
  if ([v13 count] == 4)
  {
  }
  else
  {
    uint64_t v14 = [(MPSGraphTensor *)v9 shape];
    uint64_t v15 = [v14 count];

    if (v15 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  id v16 = [(MPSGraphTensor *)v102 shape];
  if ([v16 count] != 4)
  {
    id v17 = [(MPSGraphTensor *)v102 shape];
    [v17 count];
  }
  unint64_t v18 = [(MPSGraphTensor *)v102 shape];
  if ([v18 count] == 4)
  {
  }
  else
  {
    uint64_t v19 = [(MPSGraphTensor *)v102 shape];
    uint64_t v20 = [v19 count];

    if (v20 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  uint64_t v21 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v10 strideInX];
  uint64_t v22 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v10 strideInY];
  uint64_t v23 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v10 dilationRateInX];
  uint64_t v24 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v10 dilationRateInY];
  uint64_t v25 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v10 paddingLeft];
  uint64_t v26 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v10 paddingRight];
  uint64_t v27 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v10 paddingTop];
  uint64_t v28 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v10 paddingBottom];
  uint64_t v92 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v10 paddingStyle];
  unint64_t v29 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v10 dataLayout];
  uint64_t v93 = [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v10 weightsLayout];
  v110[0] = &unk_1EC9EFCD8;
  MPSGraphForLoopBodyBlock v30 = [NSNumber numberWithUnsignedInteger:v22];
  v110[1] = v30;
  id v31 = [NSNumber numberWithUnsignedInteger:v21];
  v110[2] = v31;
  v97 = [MEMORY[0x1E4F1C978] arrayWithObjects:v110 count:3];

  v109[0] = &unk_1EC9EFCD8;
  long long v32 = [NSNumber numberWithUnsignedInteger:v24];
  v109[1] = v32;
  int v33 = [NSNumber numberWithUnsignedInteger:v23];
  v109[2] = v33;
  v96 = [MEMORY[0x1E4F1C978] arrayWithObjects:v109 count:3];

  v108[0] = &unk_1EC9EFCF0;
  v108[1] = &unk_1EC9EFCF0;
  uint64_t v34 = [NSNumber numberWithUnsignedInteger:v27];
  v108[2] = v34;
  uint64_t v35 = [NSNumber numberWithUnsignedInteger:v28];
  v108[3] = v35;
  uint64_t v36 = [NSNumber numberWithUnsignedInteger:v25];
  v108[4] = v36;
  uint64_t v37 = [NSNumber numberWithUnsignedInteger:v26];
  v108[5] = v37;
  v95 = [MEMORY[0x1E4F1C978] arrayWithObjects:v108 count:6];

  uint64_t v38 = v102;
  uint64_t v39 = v38;
  if (v29 > 6 || ((1 << v29) & 0x51) == 0)
  {
    if ((v29 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      if (MTLReportFailureTypeEnabled()) {
        MTLReportFailure();
      }
      goto LABEL_45;
    }
    uint64_t v56 = [(MPSGraphTensor *)v38 shape];
    uint64_t v41 = v56;
    if (!v56 || [v56 count] != 4)
    {
LABEL_44:

LABEL_45:
      v81 = [MPSGraphDepthwiseConvolution2DOp alloc];
      v103[0] = v101;
      v103[1] = v39;
      v82 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:2];
      uint64_t v83 = [(MPSGraphDepthwiseConvolution2DBaseOp *)v81 initWithGraph:self inputTensors:v82 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v10 name:v100];

      v84 = [(MPSGraphOperation *)v83 outputTensors];
      v85 = [(MPSGraphDepthwiseConvolution3DOp *)v84 objectAtIndexedSubscript:0];
      uint64_t v54 = v39;
      goto LABEL_46;
    }
    if (v93 == 3)
    {
      uint64_t v57 = [v41 objectAtIndexedSubscript:0];
      uint64_t v58 = [v41 objectAtIndexedSubscript:1];
      v59 = [v41 objectAtIndexedSubscript:2];
      uint64_t v91 = [v59 integerValue];

      unint64_t v60 = [v41 objectAtIndexedSubscript:3];
      uint64_t v61 = [v60 integerValue];

      if (v91 < 0 || (id v62 = (void *)v57, v48 = (void *)v58, v63 = v39, v61 < 0))
      {
        unint64_t v48 = (void *)v58;
        v94 = (void *)v57;
        goto LABEL_43;
      }
    }
    else
    {
      id v75 = [v41 objectAtIndexedSubscript:0];
      uint64_t v61 = [v75 integerValue];

      v76 = [v41 objectAtIndexedSubscript:1];
      uint64_t v91 = [v76 integerValue];

      uint64_t v77 = [v41 objectAtIndexedSubscript:2];
      uint64_t v78 = [v41 objectAtIndexedSubscript:3];
      id v79 = (void *)v78;
      if (v91 < 0 || v61 < 0)
      {
        unint64_t v48 = (void *)v78;
        v94 = (void *)v77;
        goto LABEL_43;
      }
      if (v93 == 2)
      {
        v80 = [(MPSGraphTensor *)v39 name];
        uint64_t v63 = [(MPSGraph *)self transposeTensor:v39 permute:&unk_1EC9F1790 name:v80];

        id v62 = (void *)v77;
        unint64_t v48 = v79;
      }
      else
      {
        id v62 = (void *)v77;
        unint64_t v48 = (void *)v78;
        uint64_t v63 = v39;
      }
    }
    v105[0] = &unk_1EC9EFCD8;
    v105[1] = v62;
    void v105[2] = v48;
    v53 = [NSNumber numberWithInteger:v61 * v91];
    v105[3] = v53;
    v94 = v62;
    uint64_t v87 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:4];
    uint64_t v73 = [v63 name];
    id v74 = (void *)v87;
    uint64_t v54 = [(MPSGraph *)self reshapeTensor:v63 withShape:v87 name:v73];
    uint64_t v55 = -1;
    goto LABEL_51;
  }
  uint64_t v40 = [(MPSGraphTensor *)v38 shape];
  uint64_t v41 = v40;
  if (!v40 || [v40 count] != 4) {
    goto LABEL_44;
  }
  if (v93 == 3)
  {
    uint64_t v42 = [v41 objectAtIndexedSubscript:0];
    uint64_t v43 = [v41 objectAtIndexedSubscript:1];
    uint64_t v44 = [v41 objectAtIndexedSubscript:2];
    v94 = (void *)v42;
    uint64_t v45 = [v44 integerValue];

    uint64_t v46 = [v41 objectAtIndexedSubscript:3];
    uint64_t v47 = [v46 integerValue];

    unint64_t v48 = (void *)v43;
    if ((v45 & 0x8000000000000000) == 0 && (v47 & 0x8000000000000000) == 0)
    {
      v107[0] = &unk_1EC9EFCD8;
      v107[1] = v94;
      v107[2] = v43;
      uint64_t v49 = [NSNumber numberWithInteger:v47 * v45];
      v107[3] = v49;
      unint64_t v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:4];
      id v51 = [(MPSGraphTensor *)v39 name];
      v52 = [(MPSGraph *)self reshapeTensor:v39 withShape:v50 name:v51];

      v53 = [v52 name];
      uint64_t v54 = [(MPSGraph *)self transposeTensor:v52 permute:&unk_1EC9F1760 name:v53];
      uint64_t v55 = -3;
      unint64_t v48 = (void *)v43;
LABEL_52:

      goto LABEL_53;
    }
    goto LABEL_43;
  }
  v64 = [v41 objectAtIndexedSubscript:0];
  unint64_t v65 = [v64 integerValue];

  unint64_t v66 = [v41 objectAtIndexedSubscript:1];
  uint64_t v67 = [v66 integerValue];

  uint64_t v68 = [v41 objectAtIndexedSubscript:2];
  uint64_t v69 = [v41 objectAtIndexedSubscript:3];
  id v70 = (void *)v69;
  v94 = (void *)v68;
  if (v67 < 0)
  {
    unint64_t v48 = (void *)v69;
    goto LABEL_43;
  }
  unint64_t v48 = (void *)v69;
  if ((v65 & 0x8000000000000000) != 0)
  {
LABEL_43:

    goto LABEL_44;
  }
  if (v65 >= 2)
  {
    v71 = [(MPSGraphTensor *)v39 name];
    uint64_t v63 = [(MPSGraph *)self transposeTensor:v39 permute:&unk_1EC9F1778 name:v71];

    v106[0] = &unk_1EC9EFCD8;
    v53 = [NSNumber numberWithInteger:v67 * v65];
    v106[1] = v53;
    v106[2] = v94;
    unint64_t v48 = v70;
    v106[3] = v70;
    uint64_t v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:4];
    uint64_t v73 = [v63 name];
    id v74 = (void *)v72;
    uint64_t v54 = [(MPSGraph *)self reshapeTensor:v63 withShape:v72 name:v73];
    uint64_t v55 = -3;
LABEL_51:

    v52 = v74;
    goto LABEL_52;
  }
  uint64_t v55 = -3;
  uint64_t v54 = v39;
LABEL_53:

  uint64_t v83 = +[MPSGraphDepthwiseConvolution3DOpDescriptor descriptorWithStrides:v97 dilationRates:v96 paddingValues:v95 paddingStyle:v92];
  [(MPSGraphDepthwiseConvolution2DOp *)v83 setChannelDimensionIndex:v55];
  v88 = [MPSGraphDepthwiseConvolution3DOp alloc];
  v104[0] = v101;
  v104[1] = v54;
  v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:v104 count:2];
  v84 = [(MPSGraphDepthwiseConvolution3DBaseOp *)v88 initWithGraph:self inputTensors:v89 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v83 name:v100];

  v90 = [(MPSGraphOperation *)v84 outputTensors];
  v85 = [v90 objectAtIndexedSubscript:0];

LABEL_46:

  return (MPSGraphTensor *)v85;
}

- (id)depthwiseConvolution2DDataGradientWithIncomingGradientTensor:(id)a3 weightsTensor:(id)a4 outputShapeTensor:(id)a5 descriptor:(id)a6 name:(id)a7
{
  v33[3] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [v12 shape];
  if ([v17 count] != 4)
  {
    unint64_t v18 = [v12 shape];
    [v18 count];
  }
  uint64_t v19 = [v12 shape];
  if ([v19 count] == 4)
  {
  }
  else
  {
    uint64_t v20 = [v12 shape];
    uint64_t v21 = [v20 count];

    if (v21 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  uint64_t v22 = [v13 shape];
  if ([v22 count] != 4)
  {
    uint64_t v23 = [v13 shape];
    [v23 count];
  }
  uint64_t v24 = [v13 shape];
  if ([v24 count] == 4)
  {
  }
  else
  {
    uint64_t v25 = [v13 shape];
    uint64_t v26 = [v25 count];

    if (v26 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  uint64_t v27 = [MPSGraphDepthwiseConvolution2DDataGradientOp alloc];
  v33[0] = v12;
  v33[1] = v13;
  v33[2] = v14;
  uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
  unint64_t v29 = [(MPSGraphDepthwiseConvolution2DBaseOp *)v27 initWithGraph:self inputTensors:v28 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v15 name:v16];

  MPSGraphForLoopBodyBlock v30 = [(MPSGraphOperation *)v29 outputTensors];
  id v31 = [v30 objectAtIndexedSubscript:0];

  return v31;
}

- (MPSGraphTensor)depthwiseConvolution2DDataGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradient weightsTensor:(MPSGraphTensor *)weights outputShape:(MPSShape *)outputShape descriptor:(MPSGraphDepthwiseConvolution2DOpDescriptor *)descriptor name:(NSString *)name
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v12 = incomingGradient;
  id v13 = weights;
  id v14 = outputShape;
  id v15 = descriptor;
  id v16 = name;
  [(MPSShape *)v14 count];
  if ([(MPSShape *)v14 count] != 4 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  unint64_t v17 = 0;
  long long v23 = xmmword_18112A9B0;
  while (v17 < [(MPSShape *)v14 count])
  {
    unint64_t v18 = [(MPSShape *)v14 objectAtIndexedSubscript:v17];
    *((_DWORD *)&v23 + v17) = [v18 intValue];

    ++v17;
  }
  uint64_t v19 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v23 length:16];
  uint64_t v20 = [(MPSGraph *)self constantWithData:v19 shape:&unk_1EC9F17A8 dataType:536870944];

  uint64_t v21 = [(MPSGraph *)self depthwiseConvolution2DDataGradientWithIncomingGradientTensor:v12 weightsTensor:v13 outputShapeTensor:v20 descriptor:v15 name:v16];

  return (MPSGraphTensor *)v21;
}

- (id)depthwiseConvolution2DWeightsGradientWithIncomingGradientTensor:(id)a3 sourceTensor:(id)a4 outputShapeTensor:(id)a5 descriptor:(id)a6 name:(id)a7
{
  v38[3] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  unint64_t v17 = [v12 shape];
  if ([v17 count] != 4)
  {
    unint64_t v18 = [v12 shape];
    [v18 count];
  }
  uint64_t v19 = [v12 shape];
  if ([v19 count] == 4)
  {
  }
  else
  {
    uint64_t v20 = [v12 shape];
    uint64_t v21 = [v20 count];

    if (v21 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  uint64_t v22 = [v13 shape];
  if ([v22 count] != 4)
  {
    long long v23 = [v13 shape];
    [v23 count];
  }
  uint64_t v24 = [v13 shape];
  if ([v24 count] == 4)
  {
  }
  else
  {
    uint64_t v25 = [v13 shape];
    uint64_t v26 = [v25 count];

    if (v26 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  uint64_t v27 = [v14 shape];
  if ([v27 count] != 1)
  {
    uint64_t v28 = [v13 shape];
    [v28 count];
  }
  unint64_t v29 = [v14 shape];
  if ([v29 count] == 1)
  {
  }
  else
  {
    MPSGraphForLoopBodyBlock v30 = [v13 shape];
    uint64_t v31 = [v30 count];

    if (v31 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  long long v32 = [MPSGraphDepthwiseConvolution2DWeightsGradientOp alloc];
  v38[0] = v12;
  v38[1] = v13;
  v38[2] = v14;
  int v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];
  uint64_t v34 = [(MPSGraphDepthwiseConvolution2DBaseOp *)v32 initWithGraph:self inputTensors:v33 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v15 name:v16];

  uint64_t v35 = [(MPSGraphOperation *)v34 outputTensors];
  uint64_t v36 = [v35 objectAtIndexedSubscript:0];

  return v36;
}

- (MPSGraphTensor)depthwiseConvolution2DWeightsGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradient sourceTensor:(MPSGraphTensor *)source outputShape:(MPSShape *)outputShape descriptor:(MPSGraphDepthwiseConvolution2DOpDescriptor *)descriptor name:(NSString *)name
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v12 = incomingGradient;
  id v13 = source;
  id v14 = outputShape;
  id v15 = descriptor;
  id v16 = name;
  [(MPSShape *)v14 count];
  if ([(MPSShape *)v14 count] != 4 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  unint64_t v17 = 0;
  long long v23 = xmmword_18112A9B0;
  while (v17 < [(MPSShape *)v14 count])
  {
    unint64_t v18 = [(MPSShape *)v14 objectAtIndexedSubscript:v17];
    *((_DWORD *)&v23 + v17) = [v18 intValue];

    ++v17;
  }
  uint64_t v19 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v23 length:16];
  uint64_t v20 = [(MPSGraph *)self constantWithData:v19 shape:&unk_1EC9F17C0 dataType:32];

  uint64_t v21 = [(MPSGraph *)self depthwiseConvolution2DWeightsGradientWithIncomingGradientTensor:v12 sourceTensor:v13 outputShapeTensor:v20 descriptor:v15 name:v16];

  return (MPSGraphTensor *)v21;
}

- (MPSGraphTensor)depthwiseConvolution3DWithSourceTensor:(MPSGraphTensor *)source weightsTensor:(MPSGraphTensor *)weights descriptor:(MPSGraphDepthwiseConvolution3DOpDescriptor *)descriptor name:(NSString *)name
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v10 = source;
  MPSGraphWhileBeforeBlock v11 = weights;
  id v12 = descriptor;
  id v13 = name;
  id v14 = [(MPSGraphTensor *)v10 shape];
  if ((unint64_t)[v14 count] <= 3)
  {
    id v15 = [(MPSGraphTensor *)v10 shape];
    [v15 count];
  }
  id v16 = [(MPSGraphTensor *)v10 shape];
  if ((unint64_t)[v16 count] >= 4)
  {
  }
  else
  {
    unint64_t v17 = [(MPSGraphTensor *)v10 shape];
    uint64_t v18 = [v17 count];

    if (v18 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  uint64_t v19 = [(MPSGraphTensor *)v11 shape];
  if ([v19 count] != 4)
  {
    uint64_t v20 = [(MPSGraphTensor *)v11 shape];
    [v20 count];
  }
  uint64_t v21 = [(MPSGraphTensor *)v11 shape];
  if ([v21 count] == 4)
  {
  }
  else
  {
    uint64_t v22 = [(MPSGraphTensor *)v11 shape];
    uint64_t v23 = [v22 count];

    if (v23 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  uint64_t v24 = [MPSGraphDepthwiseConvolution3DOp alloc];
  v30[0] = v10;
  v30[1] = v11;
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  uint64_t v26 = [(MPSGraphDepthwiseConvolution3DBaseOp *)v24 initWithGraph:self inputTensors:v25 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v12 name:v13];

  uint64_t v27 = [(MPSGraphOperation *)v26 outputTensors];
  uint64_t v28 = [v27 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v28;
}

- (id)depthwiseConvolution3DDataGradientWithIncomingGradientTensor:(id)a3 weightsTensor:(id)a4 outputShapeTensor:(id)a5 descriptor:(id)a6 name:(id)a7
{
  v35[3] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  unint64_t v17 = [v12 shape];
  if ((unint64_t)[v17 count] <= 3)
  {
    uint64_t v18 = [v12 shape];
    [v18 count];
  }
  uint64_t v19 = [v12 shape];
  if ((unint64_t)[v19 count] >= 4)
  {
  }
  else
  {
    uint64_t v20 = [v12 shape];
    uint64_t v21 = [v20 count];

    if (v21 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  uint64_t v22 = [v13 shape];
  if ([v22 count] != 4)
  {
    uint64_t v23 = [v13 shape];
    [v23 count];
  }
  uint64_t v24 = [v13 shape];
  if ([v24 count] == 4)
  {
  }
  else
  {
    uint64_t v25 = [v13 shape];
    uint64_t v26 = [v25 count];

    if (v26 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  if (v14)
  {
    v35[0] = v12;
    v35[1] = v13;
    v35[2] = v14;
    uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];
  }
  else
  {
    v34[0] = v12;
    v34[1] = v13;
    uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  }
  uint64_t v28 = (void *)v27;
  unint64_t v29 = [MPSGraphDepthwiseConvolution3DDataGradientOp alloc];
  MPSGraphForLoopBodyBlock v30 = [(MPSGraphDepthwiseConvolution3DBaseOp *)v29 initWithGraph:self inputTensors:v28 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v15 name:v16];
  uint64_t v31 = [(MPSGraphOperation *)v30 outputTensors];
  long long v32 = [v31 objectAtIndexedSubscript:0];

  return v32;
}

- (MPSGraphTensor)depthwiseConvolution3DDataGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradient weightsTensor:(MPSGraphTensor *)weights outputShape:(MPSShape *)outputShape descriptor:(MPSGraphDepthwiseConvolution3DOpDescriptor *)descriptor name:(NSString *)name
{
  v33[3] = *MEMORY[0x1E4F143B8];
  uint64_t v28 = incomingGradient;
  id v12 = weights;
  id v13 = outputShape;
  id v14 = descriptor;
  id v15 = name;
  if (!v13)
  {
    uint64_t v25 = 0;
    goto LABEL_14;
  }
  [(MPSShape *)v13 count];
  if ((unint64_t)[(MPSShape *)v13 count] <= 3 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  uint64_t v31 = v33;
  uint64_t v32 = 0x500000000;
  unint64_t v16 = [(MPSShape *)v13 count];
  unint64_t v17 = v16;
  uint64_t v18 = 0;
  if (v16)
  {
    if (v16 >= v32)
    {
      if (v16 > HIDWORD(v32))
      {
        llvm::SmallVectorBase<unsigned int>::grow_pod((uint64_t)&v31, v33, v16, 4);
        uint64_t v18 = v32;
      }
      if (v17 != v18) {
        bzero((char *)v31 + 4 * v18, 4 * (v17 - v18));
      }
      if (v17 <= HIDWORD(v32)) {
        goto LABEL_6;
      }
    }
    else if (v16 <= HIDWORD(v32))
    {
LABEL_6:
      LODWORD(v32) = v17;
      goto LABEL_7;
    }
    __assert_rtn("set_size", "SmallVector.h", 102, "N <= capacity()");
  }
LABEL_7:
  for (unint64_t i = 0; i < [(MPSShape *)v13 count]; ++i)
  {
    uint64_t v20 = [(MPSShape *)v13 objectAtIndexedSubscript:i];
    int v21 = [v20 intValue];
    if (i >= v32) {
      __assert_rtn("operator[]", "SmallVector.h", 294, "idx < size()");
    }
    *((_DWORD *)v31 + i) = v21;
  }
  uint64_t v22 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v31 length:4 * v32];
  uint64_t v23 = [NSNumber numberWithInt:v32];
  MPSGraphForLoopBodyBlock v30 = v23;
  uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  uint64_t v25 = [(MPSGraph *)self constantWithData:v22 shape:v24 dataType:536870944];

  if (v31 != v33) {
    free(v31);
  }
LABEL_14:
  uint64_t v26 = -[MPSGraph depthwiseConvolution3DDataGradientWithIncomingGradientTensor:weightsTensor:outputShapeTensor:descriptor:name:](self, "depthwiseConvolution3DDataGradientWithIncomingGradientTensor:weightsTensor:outputShapeTensor:descriptor:name:", v28, v12, v25, v14, v15, v28);

  return (MPSGraphTensor *)v26;
}

- (id)depthwiseConvolution3DWeightsGradientWithIncomingGradientTensor:(id)a3 sourceTensor:(id)a4 outputShapeTensor:(id)a5 descriptor:(id)a6 name:(id)a7
{
  v38[3] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  unint64_t v17 = [v12 shape];
  if ((unint64_t)[v17 count] <= 3)
  {
    uint64_t v18 = [v12 shape];
    [v18 count];
  }
  uint64_t v19 = [v12 shape];
  if ((unint64_t)[v19 count] >= 4)
  {
  }
  else
  {
    uint64_t v20 = [v12 shape];
    uint64_t v21 = [v20 count];

    if (v21 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  uint64_t v22 = [v13 shape];
  if ((unint64_t)[v22 count] <= 3)
  {
    uint64_t v23 = [v13 shape];
    [v23 count];
  }
  uint64_t v24 = [v13 shape];
  if ((unint64_t)[v24 count] >= 4)
  {
  }
  else
  {
    uint64_t v25 = [v13 shape];
    uint64_t v26 = [v25 count];

    if (v26 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  uint64_t v27 = [v14 shape];
  if ([v27 count] != 1)
  {
    uint64_t v28 = [v13 shape];
    [v28 count];
  }
  id v29 = [v14 shape];
  if ([v29 count] == 1)
  {
  }
  else
  {
    MPSGraphForLoopBodyBlock v30 = [v13 shape];
    uint64_t v31 = [v30 count];

    if (v31 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  uint64_t v32 = [MPSGraphDepthwiseConvolution3DWeightsGradientOp alloc];
  v38[0] = v12;
  v38[1] = v13;
  v38[2] = v14;
  int v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];
  uint64_t v34 = [(MPSGraphDepthwiseConvolution3DBaseOp *)v32 initWithGraph:self inputTensors:v33 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v15 name:v16];

  uint64_t v35 = [(MPSGraphOperation *)v34 outputTensors];
  uint64_t v36 = [v35 objectAtIndexedSubscript:0];

  return v36;
}

- (MPSGraphTensor)depthwiseConvolution3DWeightsGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradient sourceTensor:(MPSGraphTensor *)source outputShape:(MPSShape *)outputShape descriptor:(MPSGraphDepthwiseConvolution3DOpDescriptor *)descriptor name:(NSString *)name
{
  v33[3] = *MEMORY[0x1E4F143B8];
  uint64_t v28 = incomingGradient;
  id v12 = source;
  id v13 = outputShape;
  id v14 = descriptor;
  id v15 = name;
  [(MPSShape *)v13 count];
  if ((unint64_t)[(MPSShape *)v13 count] <= 3 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  uint64_t v31 = v33;
  uint64_t v32 = 0x500000000;
  unint64_t v16 = [(MPSShape *)v13 count];
  unint64_t v17 = v16;
  uint64_t v18 = 0;
  if (v16)
  {
    if (v16 >= v32)
    {
      if (v16 > HIDWORD(v32))
      {
        llvm::SmallVectorBase<unsigned int>::grow_pod((uint64_t)&v31, v33, v16, 4);
        uint64_t v18 = v32;
      }
      if (v17 != v18) {
        bzero((char *)v31 + 4 * v18, 4 * (v17 - v18));
      }
      if (v17 <= HIDWORD(v32)) {
        goto LABEL_5;
      }
    }
    else if (v16 <= HIDWORD(v32))
    {
LABEL_5:
      LODWORD(v32) = v17;
      goto LABEL_6;
    }
    __assert_rtn("set_size", "SmallVector.h", 102, "N <= capacity()");
  }
LABEL_6:
  for (unint64_t i = 0; i < [(MPSShape *)v13 count]; ++i)
  {
    uint64_t v20 = [(MPSShape *)v13 objectAtIndexedSubscript:i];
    int v21 = [v20 intValue];
    if (i >= v32) {
      __assert_rtn("operator[]", "SmallVector.h", 294, "idx < size()");
    }
    *((_DWORD *)v31 + i) = v21;
  }
  uint64_t v22 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v31 length:4 * v32];
  uint64_t v23 = [NSNumber numberWithInt:v32];
  MPSGraphForLoopBodyBlock v30 = v23;
  uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  uint64_t v25 = [(MPSGraph *)self constantWithData:v22 shape:v24 dataType:536870944];

  uint64_t v26 = [(MPSGraph *)self depthwiseConvolution3DWeightsGradientWithIncomingGradientTensor:v29 sourceTensor:v12 outputShapeTensor:v25 descriptor:v14 name:v15];

  if (v31 != v33) {
    free(v31);
  }

  return (MPSGraphTensor *)v26;
}

- (id)fixTypeOfReductionInput:(id)a3
{
  id v4 = a3;
  if ([v4 dataType] == -2147483640)
  {
    uint64_t v5 = [(MPSGraph *)self castTensor:v4 toType:536870944 name:0];

    id v4 = (id)v5;
  }

  return v4;
}

- (MPSGraphTensor)reductionSumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = tensor;
  id v9 = name;
  id v10 = (void *)[objc_alloc(NSNumber) initWithLong:axis];
  v14[0] = v10;
  MPSGraphWhileBeforeBlock v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v12 = [(MPSGraph *)self reductionSumWithTensor:v8 axes:v11 name:v9];

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)reductionSumWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name
{
  v23[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = tensor;
  id v9 = axes;
  id v10 = name;
  if (!v9)
  {
    uint64_t v13 = 0;
    goto LABEL_8;
  }
  MPSShapeToVector<int>(v9, (char **)&__p);
  MPSGraphWhileBeforeBlock v11 = __p;
  id v12 = v22;
  uint64_t v13 = v22 - (unsigned char *)__p;
  if (v22 != __p)
  {
    id v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:__p length:v22 - (unsigned char *)__p];
    id v15 = [NSNumber numberWithUnsignedInteger:v13 >> 2];
    v23[0] = v15;
    unint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    uint64_t v13 = [(MPSGraph *)self constantWithData:v14 shape:v16 dataType:536870944];

    unint64_t v17 = __p;
    if (!__p) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  uint64_t v20 = v8;
  unint64_t v17 = v12;
  if (v12)
  {
LABEL_4:
    uint64_t v22 = v17;
    operator delete(v17);
  }
LABEL_5:
  uint64_t v18 = v8;
  if (v12 != v11)
  {
LABEL_8:
    uint64_t v18 = [(MPSGraph *)self reductionSumWithTensor:v8 axesTensor:v13 name:v10];
  }

  return (MPSGraphTensor *)v18;
}

- (id)reductionSumWithTensor:(id)a3 axesTensor:(id)a4 name:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  MPSGraphWhileBeforeBlock v11 = [(MPSGraph *)self fixTypeOfReductionInput:v8];

  v20[0] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  if (v9)
  {
    v19[0] = v11;
    v19[1] = v9;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];

    id v12 = (void *)v13;
  }
  id v14 = [MPSGraphReductionSumOp alloc];
  id v15 = [(MPSGraphReductionBaseOp *)v14 initWithGraph:self inputTensors:v12 controlDependencies:MEMORY[0x1E4F1CBF0] axes:0 name:v10];
  unint64_t v16 = [(MPSGraphOperation *)v15 outputTensors];
  unint64_t v17 = [v16 objectAtIndexedSubscript:0];

  return v17;
}

- (MPSGraphTensor)reductionMaximumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v8 = tensor;
  id v9 = name;
  id v10 = (void *)[objc_alloc(NSNumber) initWithLong:axis];
  v14[0] = v10;
  MPSGraphWhileBeforeBlock v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v12 = [(MPSGraph *)self reductionMaximumWithTensor:v8 axes:v11 name:v9];

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)reductionMaximumWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = tensor;
  id v9 = axes;
  id v10 = name;
  v27[0] = v8;
  MPSGraphWhileBeforeBlock v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  if (v9)
  {
    MPSShapeToVector<int>(v9, (char **)&__p);
    uint64_t v12 = v24 - (unsigned char *)__p;
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
    id v14 = [NSNumber numberWithUnsignedInteger:v12 >> 2];
    uint64_t v26 = v14;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    unint64_t v16 = [(MPSGraph *)self constantWithData:v13 shape:v15 dataType:536870944];

    v25[0] = v8;
    v25[1] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];

    if (__p)
    {
      uint64_t v24 = __p;
      operator delete(__p);
    }
    MPSGraphWhileBeforeBlock v11 = (void *)v17;
  }
  uint64_t v18 = [MPSGraphReductionMaxOp alloc];
  uint64_t v19 = [(MPSGraphReductionBaseOp *)v18 initWithGraph:self inputTensors:v11 controlDependencies:MEMORY[0x1E4F1CBF0] axes:v9 name:v10];
  uint64_t v20 = [(MPSGraphOperation *)v19 outputTensors];
  int v21 = [v20 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v21;
}

- (MPSGraphTensor)reductionMinimumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v8 = tensor;
  id v9 = name;
  id v10 = (void *)[objc_alloc(NSNumber) initWithLong:axis];
  v14[0] = v10;
  MPSGraphWhileBeforeBlock v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v12 = [(MPSGraph *)self reductionMinimumWithTensor:v8 axes:v11 name:v9];

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)reductionMinimumWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = tensor;
  id v9 = axes;
  id v10 = name;
  v27[0] = v8;
  MPSGraphWhileBeforeBlock v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  if (v9)
  {
    MPSShapeToVector<int>(v9, (char **)&__p);
    uint64_t v12 = v24 - (unsigned char *)__p;
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
    id v14 = [NSNumber numberWithUnsignedInteger:v12 >> 2];
    uint64_t v26 = v14;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    unint64_t v16 = [(MPSGraph *)self constantWithData:v13 shape:v15 dataType:536870944];

    v25[0] = v8;
    v25[1] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];

    if (__p)
    {
      uint64_t v24 = __p;
      operator delete(__p);
    }
    MPSGraphWhileBeforeBlock v11 = (void *)v17;
  }
  uint64_t v18 = [MPSGraphReductionMinOp alloc];
  uint64_t v19 = [(MPSGraphReductionBaseOp *)v18 initWithGraph:self inputTensors:v11 controlDependencies:MEMORY[0x1E4F1CBF0] axes:v9 name:v10];
  uint64_t v20 = [(MPSGraphOperation *)v19 outputTensors];
  int v21 = [v20 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v21;
}

- (MPSGraphTensor)reductionMaximumPropagateNaNWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v8 = tensor;
  id v9 = name;
  id v10 = (void *)[objc_alloc(NSNumber) initWithLong:axis];
  v14[0] = v10;
  MPSGraphWhileBeforeBlock v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v12 = [(MPSGraph *)self reductionMaximumPropagateNaNWithTensor:v8 axes:v11 name:v9];

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)reductionMaximumPropagateNaNWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = tensor;
  id v9 = axes;
  id v10 = name;
  v27[0] = v8;
  MPSGraphWhileBeforeBlock v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  if (v9)
  {
    MPSShapeToVector<int>(v9, (char **)&__p);
    uint64_t v12 = v24 - (unsigned char *)__p;
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
    id v14 = [NSNumber numberWithUnsignedInteger:v12 >> 2];
    uint64_t v26 = v14;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    unint64_t v16 = [(MPSGraph *)self constantWithData:v13 shape:v15 dataType:536870944];

    v25[0] = v8;
    v25[1] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];

    if (__p)
    {
      uint64_t v24 = __p;
      operator delete(__p);
    }
    MPSGraphWhileBeforeBlock v11 = (void *)v17;
  }
  uint64_t v18 = [MPSGraphReductionMaxPropagateNaNOp alloc];
  uint64_t v19 = [(MPSGraphReductionBaseOp *)v18 initWithGraph:self inputTensors:v11 controlDependencies:MEMORY[0x1E4F1CBF0] axes:v9 name:v10];
  uint64_t v20 = [(MPSGraphOperation *)v19 outputTensors];
  int v21 = [v20 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v21;
}

- (MPSGraphTensor)reductionMinimumPropagateNaNWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v8 = tensor;
  id v9 = name;
  id v10 = (void *)[objc_alloc(NSNumber) initWithLong:axis];
  v14[0] = v10;
  MPSGraphWhileBeforeBlock v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v12 = [(MPSGraph *)self reductionMinimumPropagateNaNWithTensor:v8 axes:v11 name:v9];

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)reductionMinimumPropagateNaNWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = tensor;
  id v9 = axes;
  id v10 = name;
  v27[0] = v8;
  MPSGraphWhileBeforeBlock v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  if (v9)
  {
    MPSShapeToVector<int>(v9, (char **)&__p);
    uint64_t v12 = v24 - (unsigned char *)__p;
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
    id v14 = [NSNumber numberWithUnsignedInteger:v12 >> 2];
    uint64_t v26 = v14;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    unint64_t v16 = [(MPSGraph *)self constantWithData:v13 shape:v15 dataType:536870944];

    v25[0] = v8;
    v25[1] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];

    if (__p)
    {
      uint64_t v24 = __p;
      operator delete(__p);
    }
    MPSGraphWhileBeforeBlock v11 = (void *)v17;
  }
  uint64_t v18 = [MPSGraphReductionMinPropagateNaNOp alloc];
  uint64_t v19 = [(MPSGraphReductionBaseOp *)v18 initWithGraph:self inputTensors:v11 controlDependencies:MEMORY[0x1E4F1CBF0] axes:v9 name:v10];
  uint64_t v20 = [(MPSGraphOperation *)v19 outputTensors];
  int v21 = [v20 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v21;
}

- (MPSGraphTensor)reductionProductWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v8 = tensor;
  id v9 = name;
  id v10 = (void *)[objc_alloc(NSNumber) initWithLong:axis];
  v14[0] = v10;
  MPSGraphWhileBeforeBlock v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v12 = [(MPSGraph *)self reductionProductWithTensor:v8 axes:v11 name:v9];

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)reductionProductWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v8 = tensor;
  id v9 = axes;
  id v10 = name;
  MPSGraphWhileBeforeBlock v11 = [(MPSGraph *)self fixTypeOfReductionInput:v8];

  v28[0] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  if (v9)
  {
    MPSShapeToVector<int>(v9, (char **)&__p);
    uint64_t v13 = v25 - (unsigned char *)__p;
    id v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
    id v15 = [NSNumber numberWithUnsignedInteger:v13 >> 2];
    uint64_t v27 = v15;
    unint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
    uint64_t v17 = [(MPSGraph *)self constantWithData:v14 shape:v16 dataType:536870944];

    v26[0] = v11;
    v26[1] = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];

    if (__p)
    {
      uint64_t v25 = __p;
      operator delete(__p);
    }
    uint64_t v12 = (void *)v18;
  }
  uint64_t v19 = [MPSGraphReductionProdOp alloc];
  uint64_t v20 = [(MPSGraphReductionBaseOp *)v19 initWithGraph:self inputTensors:v12 controlDependencies:MEMORY[0x1E4F1CBF0] axes:v9 name:v10];
  int v21 = [(MPSGraphOperation *)v20 outputTensors];
  uint64_t v22 = [v21 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v22;
}

- (MPSGraphTensor)reductionArgMinimumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = tensor;
  id v9 = name;
  v19[0] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  MPSGraphWhileBeforeBlock v11 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)axis];
  v18[0] = v8;
  v18[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];

  uint64_t v13 = [MPSGraphReductionArgMinOp alloc];
  id v14 = [(MPSGraphReductionArgBaseOp *)v13 initWithGraph:self inputTensors:v12 controlDependencies:MEMORY[0x1E4F1CBF0] axis:axis name:v9];
  id v15 = [(MPSGraphOperation *)v14 outputTensors];
  unint64_t v16 = [v15 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v16;
}

- (MPSGraphTensor)reductionArgMaximumWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = tensor;
  id v9 = name;
  v19[0] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  MPSGraphWhileBeforeBlock v11 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)axis];
  v18[0] = v8;
  v18[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];

  uint64_t v13 = [MPSGraphReductionArgMaxOp alloc];
  id v14 = [(MPSGraphReductionArgBaseOp *)v13 initWithGraph:self inputTensors:v12 controlDependencies:MEMORY[0x1E4F1CBF0] axis:axis name:v9];
  id v15 = [(MPSGraphOperation *)v14 outputTensors];
  unint64_t v16 = [v15 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v16;
}

- (MPSGraphTensor)reductionAndWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v8 = tensor;
  id v9 = name;
  id v10 = (void *)[objc_alloc(NSNumber) initWithLong:axis];
  v14[0] = v10;
  MPSGraphWhileBeforeBlock v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v12 = [(MPSGraph *)self reductionAndWithTensor:v8 axes:v11 name:v9];

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)reductionAndWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v8 = tensor;
  id v9 = axes;
  id v10 = name;
  MPSGraphWhileBeforeBlock v11 = [(MPSGraph *)self fixTypeOfReductionInput:v8];

  v28[0] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  if (v9)
  {
    MPSShapeToVector<int>(v9, (char **)&__p);
    uint64_t v13 = v25 - (unsigned char *)__p;
    id v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
    id v15 = [NSNumber numberWithUnsignedInteger:v13 >> 2];
    uint64_t v27 = v15;
    unint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
    uint64_t v17 = [(MPSGraph *)self constantWithData:v14 shape:v16 dataType:536870944];

    v26[0] = v11;
    v26[1] = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];

    if (__p)
    {
      uint64_t v25 = __p;
      operator delete(__p);
    }
    uint64_t v12 = (void *)v18;
  }
  uint64_t v19 = [MPSGraphReductionAndOp alloc];
  uint64_t v20 = [(MPSGraphReductionBaseOp *)v19 initWithGraph:self inputTensors:v12 controlDependencies:MEMORY[0x1E4F1CBF0] axes:v9 name:v10];
  int v21 = [(MPSGraphOperation *)v20 outputTensors];
  uint64_t v22 = [v21 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v22;
}

- (MPSGraphTensor)reductionOrWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v8 = tensor;
  id v9 = name;
  id v10 = (void *)[objc_alloc(NSNumber) initWithLong:axis];
  v14[0] = v10;
  MPSGraphWhileBeforeBlock v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v12 = [(MPSGraph *)self reductionOrWithTensor:v8 axes:v11 name:v9];

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)reductionOrWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = tensor;
  id v9 = axes;
  id v10 = name;
  v27[0] = v8;
  MPSGraphWhileBeforeBlock v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  if (v9)
  {
    MPSShapeToVector<int>(v9, (char **)&__p);
    uint64_t v12 = v24 - (unsigned char *)__p;
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
    id v14 = [NSNumber numberWithUnsignedInteger:v12 >> 2];
    uint64_t v26 = v14;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    unint64_t v16 = [(MPSGraph *)self constantWithData:v13 shape:v15 dataType:536870944];

    v25[0] = v8;
    v25[1] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];

    if (__p)
    {
      uint64_t v24 = __p;
      operator delete(__p);
    }
    MPSGraphWhileBeforeBlock v11 = (void *)v17;
  }
  uint64_t v18 = [MPSGraphReductionOrOp alloc];
  uint64_t v19 = [(MPSGraphReductionBaseOp *)v18 initWithGraph:self inputTensors:v11 controlDependencies:MEMORY[0x1E4F1CBF0] axes:v9 name:v10];
  uint64_t v20 = [(MPSGraphOperation *)v19 outputTensors];
  int v21 = [v20 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v21;
}

- (MPSGraphTensor)meanOfTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = tensor;
  id v9 = axes;
  id v10 = name;
  v27[0] = v8;
  MPSGraphWhileBeforeBlock v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  if (v9)
  {
    MPSShapeToVector<int>(v9, (char **)&__p);
    uint64_t v12 = v24 - (unsigned char *)__p;
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
    id v14 = [NSNumber numberWithUnsignedInteger:v12 >> 2];
    uint64_t v26 = v14;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    unint64_t v16 = [(MPSGraph *)self constantWithData:v13 shape:v15 dataType:536870944];

    v25[0] = v8;
    v25[1] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];

    if (__p)
    {
      uint64_t v24 = __p;
      operator delete(__p);
    }
    MPSGraphWhileBeforeBlock v11 = (void *)v17;
  }
  uint64_t v18 = [MPSGraphReductionMeanOp alloc];
  uint64_t v19 = [(MPSGraphReductionBaseOp *)v18 initWithGraph:self inputTensors:v11 controlDependencies:MEMORY[0x1E4F1CBF0] axes:v9 name:v10];
  uint64_t v20 = [(MPSGraphOperation *)v19 outputTensors];
  int v21 = [v20 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v21;
}

- (MPSGraph)init
{
  v11[10] = *(void **)MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)MPSGraph;
  v2 = [(MPSGraph *)&v10 init];
  if (v2)
  {
    id v3 = operator new(0x20uLL);
    *((void *)v3 + 1) = 0;
    *((void *)v3 + 2) = 0;
    *(void *)id v3 = &unk_1EC9CFE58;
    id v4 = mlir::MLIRContext::MLIRContext((mlir::MLIRContextImpl **)v3 + 3, 0);
    p_context = &v2->_context;
    cntrl = (std::__shared_weak_count *)v2->_context.__cntrl_;
    v2->_context.__ptr_ = (MLIRContext *)v4;
    v2->_context.__cntrl_ = (__shared_weak_count *)v3;
    if (cntrl && !atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
    v11[0] = p_context->__ptr_;
    mlir::MLIRContext::getOrLoadDialect(v11[0], (uint64_t)"mps", 3, (uint64_t)&mlir::detail::TypeIDResolver<mlir::mps::MPSDialect,void>::id, (void (*)(uint64_t *__return_ptr, uint64_t))llvm::function_ref<std::unique_ptr<mlir::Dialect> ()(void)>::callback_fn<mlir::mps::MPSDialect * mlir::MLIRContext::getOrLoadDialect<mlir::mps::MPSDialect>(void)::{lambda(void)#1}>, (uint64_t)v11);
    v11[0] = p_context->__ptr_;
    mlir::MLIRContext::getOrLoadDialect(v11[0], (uint64_t)"mpsx", 4, (uint64_t)&mlir::detail::TypeIDResolver<mlir::mpsx::MPSXDialect,void>::id, (void (*)(uint64_t *__return_ptr, uint64_t))llvm::function_ref<std::unique_ptr<mlir::Dialect> ()(void)>::callback_fn<mlir::mpsx::MPSXDialect * mlir::MLIRContext::getOrLoadDialect<mlir::mpsx::MPSXDialect>(void)::{lambda(void)#1}>, (uint64_t)v11);
    v11[0] = p_context->__ptr_;
    mlir::MLIRContext::getOrLoadDialect(v11[0], (uint64_t)"func", 4, (uint64_t)&mlir::detail::TypeIDResolver<mlir::func::FuncDialect,void>::id, (void (*)(uint64_t *__return_ptr, uint64_t))llvm::function_ref<std::unique_ptr<mlir::Dialect> ()(void)>::callback_fn<mlir::func::FuncDialect * mlir::MLIRContext::getOrLoadDialect<mlir::func::FuncDialect>(void)::{lambda(void)#1}>, (uint64_t)v11);
    v11[0] = p_context->__ptr_;
    mlir::MLIRContext::getOrLoadDialect(v11[0], (uint64_t)"scf", 3, (uint64_t)&mlir::detail::TypeIDResolver<mlir::scf::SCFDialect,void>::id, (void (*)(uint64_t *__return_ptr, uint64_t))llvm::function_ref<std::unique_ptr<mlir::Dialect> ()(void)>::callback_fn<mlir::scf::SCFDialect * mlir::MLIRContext::getOrLoadDialect<mlir::scf::SCFDialect>(void)::{lambda(void)#1}>, (uint64_t)v11);
    v11[0] = p_context->__ptr_;
    mlir::MLIRContext::getOrLoadDialect(v11[0], (uint64_t)"tensor", 6, (uint64_t)&mlir::detail::TypeIDResolver<mlir::tensor::TensorDialect,void>::id, (void (*)(uint64_t *__return_ptr, uint64_t))llvm::function_ref<std::unique_ptr<mlir::Dialect> ()(void)>::callback_fn<mlir::tensor::TensorDialect * mlir::MLIRContext::getOrLoadDialect<mlir::tensor::TensorDialect>(void)::{lambda(void)#1}>, (uint64_t)v11);
    v2->_options = 1;
    v2->_compilerOptions = 1423;
    if (mpsgraph_mlir_onceToken == -1)
    {
      if (!getenv("MPSGRAPH_LOG_INFO")) {
        goto LABEL_8;
      }
    }
    else
    {
      dispatch_once(&mpsgraph_mlir_onceToken, &__block_literal_global_4);
      if (!getenv("MPSGRAPH_LOG_INFO"))
      {
LABEL_8:
        id v7 = getenv("MPSGRAPH_COMPILER_STITCHING");
        if (v7)
        {
          int v8 = atoi(v7);
          if (!v8) {
            v2->_compilerOptions &= ~2uLL;
          }
          printf("MPSGRAPH_COMPILER_STITCHING EV is set to %d.\n", v8);
        }
        operator new();
      }
    }
    v2->_options |= 2uLL;
    puts("MPSGRAPH_LOG_INFO EV is set.");
    goto LABEL_8;
  }

  return 0;
}

void __16__MPSGraph_init__block_invoke(mlir *a1)
{
  mlir::registerAsmPrinterCLOptions(a1);

  ParseEnvironmentOptions("main", "MPSGRAPH_MLIR_CL", "");
}

+ (MPSGraph)new
{
  return objc_alloc_init(MPSGraph);
}

- (NSArray)placeholderTensors
{
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_placeholderArray];
}

- (id)operationWithName:(id)a3
{
  id v4 = a3;
  for (unint64_t i = 0; ; ++i)
  {
    if (i >= [(NSMutableArray *)self->_operations count])
    {
      id v9 = 0;
      goto LABEL_7;
    }
    id v6 = [(NSMutableArray *)self->_operations objectAtIndexedSubscript:i];
    id v7 = [v6 name];
    int v8 = [v7 isEqualToString:v4];

    if (v8) {
      break;
    }
  }
  id v9 = [(NSMutableArray *)self->_operations objectAtIndexedSubscript:i];
LABEL_7:

  return v9;
}

- (void)dealloc
{
  builder = self->_builder;
  if (builder) {
    MEMORY[0x1852FDE70](builder, 0x20C40DC1BFBCFLL);
  }
  symbolTable = (MPSSymbolTable *)self->_symbolTable;
  if (symbolTable)
  {
    MPSSymbolTable::~MPSSymbolTable(symbolTable);
    MEMORY[0x1852FDE70]();
  }
  v5.receiver = self;
  v5.super_class = (Class)MPSGraph;
  [(MPSGraph *)&v5 dealloc];
}

- (void)dump
{
}

- (id)debugDescription
{
  v21[0] = 0;
  v21[1] = 0;
  uint64_t v22 = 0;
  int v13 = 0;
  char v17 = 0;
  uint64_t v18 = 0;
  int v19 = 1;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v14 = 0;
  uint64_t v12 = &unk_1EC9A38B8;
  uint64_t v20 = v21;
  llvm::raw_ostream::SetBufferAndMode((uint64_t)&v12, 0, 0, 0);
  mlir::OpPrintingFlags::OpPrintingFlags((mlir::OpPrintingFlags *)v11);
  mlir::Operation::print(self->_module.op.state, (llvm::raw_ostream *)&v12, (const mlir::OpPrintingFlags *)v11);
  id v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)MPSGraph;
  uint64_t v4 = [(MPSGraph *)&v10 debugDescription];
  objc_super v5 = (void *)v4;
  id v6 = v20;
  if (*((char *)v20 + 23) < 0) {
    id v6 = *v20;
  }
  uint64_t v7 = [v3 stringWithFormat:@"%@ : \n\nIR: %s \n\n", v4, v6];

  llvm::raw_ostream::~raw_ostream((llvm::raw_ostream *)&v12);
  if (SHIBYTE(v22) < 0)
  {
    operator delete(v21[0]);
    int v8 = (void *)v7;
  }
  else
  {
    int v8 = (void *)v7;
  }
  return v8;
}

- (unint64_t)getExecutableCacheSize
{
  return [(NSMutableArray *)self->_executableCache count];
}

- (id)compileWithDevice:(id)a3 feeds:(id)a4 targetTensors:(id)a5 targetOperations:(id)a6
{
  id v6 = [(MPSGraph *)self compileWithDevice:a3 feeds:a4 targetTensors:a5 targetOperations:a6 compilationDescriptor:0];

  return v6;
}

- (MPSGraphExecutable)compileWithDevice:(MPSGraphDevice *)device feeds:(MPSGraphTensorShapedTypeDictionary *)feeds targetTensors:(NSArray *)targetTensors targetOperations:(NSArray *)targetOperations compilationDescriptor:(MPSGraphCompilationDescriptor *)compilationDescriptor
{
  uint64_t v26 = device;
  uint64_t v12 = feeds;
  int v13 = targetTensors;
  uint64_t v14 = targetOperations;
  uint64_t v15 = compilationDescriptor;
  p_graphMutex = &self->_graphMutex;
  pthread_mutex_lock(&self->_graphMutex);
  if (!v15)
  {
    uint64_t v15 = (MPSGraphCompilationDescriptor *)objc_opt_new();
    -[MPSGraphCompilationDescriptor setCompilerOptions:](v15, "setCompilerOptions:", self->_compilerOptions, p_graphMutex);
  }
  uint64_t v16 = 0;
  for (unint64_t i = 0; i < [(NSMutableArray *)self->_executableCache count]; ++i)
  {
    uint64_t v18 = [(NSMutableArray *)self->_executableCache objectAtIndexedSubscript:i];
    int v19 = [v18 isExecutableForFeeds:v12 targetTensors:v13 targetOperations:v14 compilationDescriptor:v15];

    if (v19)
    {
      uint64_t v20 = [(NSMutableArray *)self->_executableCache objectAtIndexedSubscript:i];

      uint64_t v16 = (MPSGraphExecutable *)v20;
    }
  }
  int v21 = objc_opt_new();
  objc_msgSend(v21, "setCompilerOptions:", -[MPSGraphCompilationDescriptor compilerOptions](v15, "compilerOptions"));
  [v21 setCompilationDescriptor:v15];
  if (!v16)
  {
    uint64_t v16 = [[MPSGraphExecutable alloc] initWithGraph:self device:v26 feeds:v12 targetTensors:v13 targetOperations:v14 executableDescriptor:v21];
    unint64_t v22 = [(NSMutableArray *)self->_executableCache count];
    executableCache = self->_executableCache;
    if (v22 >= 0xF)
    {
      [(NSMutableArray *)executableCache removeObjectAtIndex:14];
      executableCache = self->_executableCache;
    }
    [(NSMutableArray *)executableCache insertObject:v16 atIndex:0];
  }
  pthread_mutex_unlock(p_graphMutex);

  return v16;
}

- (MPSGraphTensorDataDictionary)runWithFeeds:(MPSGraphTensorDataDictionary *)feeds targetTensors:(NSArray *)targetTensors targetOperations:(NSArray *)targetOperations
{
  int v8 = feeds;
  id v9 = targetTensors;
  objc_super v10 = targetOperations;
  MPSGraphWhileBeforeBlock v11 = objc_opt_new();
  [v11 setWaitUntilCompleted:1];
  uint64_t v12 = [(MPSGraph *)self runAsyncWithFeeds:v8 targetTensors:v9 targetOperations:v10 executionDescriptor:v11];

  return (MPSGraphTensorDataDictionary *)v12;
}

- (MPSGraphTensorDataDictionary)runWithMTLCommandQueue:(id)commandQueue feeds:(MPSGraphTensorDataDictionary *)feeds targetTensors:(NSArray *)targetTensors targetOperations:(NSArray *)targetOperations
{
  id v10 = commandQueue;
  MPSGraphWhileBeforeBlock v11 = feeds;
  uint64_t v12 = targetTensors;
  int v13 = targetOperations;
  uint64_t v14 = objc_opt_new();
  [v14 setWaitUntilCompleted:1];
  uint64_t v15 = [(MPSGraph *)self runAsyncWithMTLCommandQueue:v10 feeds:v11 targetTensors:v12 targetOperations:v13 executionDescriptor:v14];

  return (MPSGraphTensorDataDictionary *)v15;
}

- (void)runWithMTLCommandQueue:(id)commandQueue feeds:(MPSGraphTensorDataDictionary *)feeds targetOperations:(NSArray *)targetOperations resultsDictionary:(MPSGraphTensorDataDictionary *)resultsDictionary
{
  id v14 = commandQueue;
  id v10 = feeds;
  MPSGraphWhileBeforeBlock v11 = targetOperations;
  uint64_t v12 = resultsDictionary;
  int v13 = objc_opt_new();
  [v13 setWaitUntilCompleted:1];
  [(MPSGraph *)self runAsyncWithMTLCommandQueue:v14 feeds:v10 targetOperations:v11 resultsDictionary:v12 executionDescriptor:v13];
}

- (MPSGraphTensorDataDictionary)runAsyncWithFeeds:(MPSGraphTensorDataDictionary *)feeds targetTensors:(NSArray *)targetTensors targetOperations:(NSArray *)targetOperations executionDescriptor:(MPSGraphExecutionDescriptor *)executionDescriptor
{
  id v10 = feeds;
  MPSGraphWhileBeforeBlock v11 = targetTensors;
  uint64_t v12 = targetOperations;
  int v13 = executionDescriptor;
  if (qword_1E8EBF1E0 == -1)
  {
    if ((_MergedGlobals_6 & 1) == 0) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_once(&qword_1E8EBF1E0, &__block_literal_global_428);
    if ((_MergedGlobals_6 & 1) == 0)
    {
LABEL_3:
      id v14 = MPSGetPreferredDevice(0);
      if (v14) {
        goto LABEL_5;
      }
    }
  }
  id v14 = MTLCreateSystemDefaultDevice();
LABEL_5:
  uint64_t v15 = (void *)[v14 newCommandQueue];
  if (v14)
  {
    if (!v13) {
      int v13 = (MPSGraphExecutionDescriptor *)objc_opt_new();
    }
    uint64_t v16 = [(MPSGraph *)self runAsyncWithMTLCommandQueue:v15 feeds:v10 targetTensors:v11 targetOperations:v12 executionDescriptor:v13];
  }
  else
  {
    if (MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
    uint64_t v16 = 0;
  }

  return (MPSGraphTensorDataDictionary *)v16;
}

char *__81__MPSGraph_runAsyncWithFeeds_targetTensors_targetOperations_executionDescriptor___block_invoke()
{
  result = getenv("OATS_CONFIG_ID");
  if (result) {
    _MergedGlobals_6 = 1;
  }
  return result;
}

- (MPSGraphTensorDataDictionary)runAsyncWithMTLCommandQueue:(id)commandQueue feeds:(MPSGraphTensorDataDictionary *)feeds targetTensors:(NSArray *)targetTensors targetOperations:(NSArray *)targetOperations executionDescriptor:(MPSGraphExecutionDescriptor *)executionDescriptor
{
  id v12 = commandQueue;
  int v13 = feeds;
  id v14 = targetTensors;
  uint64_t v15 = targetOperations;
  uint64_t v16 = executionDescriptor;
  if (!v16) {
    uint64_t v16 = (MPSGraphExecutionDescriptor *)objc_opt_new();
  }
  char v17 = [(MPSGraph *)self runInternalWithMTLCommandQueue:v12 feeds:v13 targetTensors:v14 targetOperations:v15 resultsDictionary:0 executionDescriptor:v16];

  return (MPSGraphTensorDataDictionary *)v17;
}

- (void)runAsyncWithMTLCommandQueue:(id)commandQueue feeds:(MPSGraphTensorDataDictionary *)feeds targetOperations:(NSArray *)targetOperations resultsDictionary:(MPSGraphTensorDataDictionary *)resultsDictionary executionDescriptor:(MPSGraphExecutionDescriptor *)executionDescriptor
{
  id v18 = commandQueue;
  id v12 = feeds;
  int v13 = targetOperations;
  id v14 = resultsDictionary;
  uint64_t v15 = executionDescriptor;
  if (!v15) {
    uint64_t v15 = (MPSGraphExecutionDescriptor *)objc_opt_new();
  }
  uint64_t v16 = [(MPSGraphTensorDataDictionary *)v14 allKeys];
  id v17 = [(MPSGraph *)self runInternalWithMTLCommandQueue:v18 feeds:v12 targetTensors:v16 targetOperations:v13 resultsDictionary:v14 executionDescriptor:v15];
}

- (MPSGraphTensorDataDictionary)encodeToCommandBuffer:(MPSCommandBuffer *)commandBuffer feeds:(MPSGraphTensorDataDictionary *)feeds targetTensors:(NSArray *)targetTensors targetOperations:(NSArray *)targetOperations executionDescriptor:(MPSGraphExecutionDescriptor *)executionDescriptor
{
  id v12 = commandBuffer;
  int v13 = feeds;
  id v14 = targetTensors;
  uint64_t v15 = targetOperations;
  uint64_t v16 = executionDescriptor;
  if (!v16) {
    uint64_t v16 = (MPSGraphExecutionDescriptor *)objc_opt_new();
  }
  LOBYTE(v19) = 0;
  id v17 = [(MPSGraph *)self runInternalWithMPSCommandBuffer:v12 feeds:v13 targetTensors:v14 targetOperations:v15 resultsDictionary:0 executionDescriptor:v16 mpsGraphOwnedCommandBuffer:v19];

  return (MPSGraphTensorDataDictionary *)v17;
}

- (void)encodeToCommandBuffer:(MPSCommandBuffer *)commandBuffer feeds:(MPSGraphTensorDataDictionary *)feeds targetOperations:(NSArray *)targetOperations resultsDictionary:(MPSGraphTensorDataDictionary *)resultsDictionary executionDescriptor:(MPSGraphExecutionDescriptor *)executionDescriptor
{
  uint64_t v19 = commandBuffer;
  id v12 = feeds;
  int v13 = targetOperations;
  id v14 = resultsDictionary;
  uint64_t v15 = executionDescriptor;
  if (!v15) {
    uint64_t v15 = (MPSGraphExecutionDescriptor *)objc_opt_new();
  }
  uint64_t v16 = [(MPSGraphTensorDataDictionary *)v14 allKeys];
  LOBYTE(v18) = 0;
  id v17 = [(MPSGraph *)self runInternalWithMPSCommandBuffer:v19 feeds:v12 targetTensors:v16 targetOperations:v13 resultsDictionary:v14 executionDescriptor:v15 mpsGraphOwnedCommandBuffer:v18];
}

- (id)runInternalWithMTLCommandQueue:(id)a3 feeds:(id)a4 targetTensors:(id)a5 targetOperations:(id)a6 resultsDictionary:(id)a7 executionDescriptor:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  uint64_t v19 = [MEMORY[0x1E4F35520] commandBufferFromCommandQueue:a3];
  LOBYTE(v22) = 1;
  uint64_t v20 = [(MPSGraph *)self runInternalWithMPSCommandBuffer:v19 feeds:v14 targetTensors:v15 targetOperations:v16 resultsDictionary:v17 executionDescriptor:v18 mpsGraphOwnedCommandBuffer:v22];

  return v20;
}

- (id)getExecutableForDevice:(id)a3 feeds:(id)a4 targetTensors:(id)a5 targetOperations:(id)a6 resultsDictionary:(id)a7 executionDescriptor:(id)a8
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v81 = a3;
  id v14 = a4;
  id v86 = a5;
  id v83 = a6;
  id v15 = a7;
  id v84 = a8;
  v82 = v14;
  [v14 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_436];
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v15, "count"));
  v80 = self;
  v96 = 0;
  uint64_t v97 = 0;
  v85 = v95 = &v96;
  if (v15)
  {
    long long v93 = 0uLL;
    long long v94 = 0uLL;
    long long v91 = 0uLL;
    long long v92 = 0uLL;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v91 objects:v99 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v92;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v92 != v18) {
            objc_enumerationMutation(v16);
          }
          uint64_t v20 = *(void **)(*((void *)&v91 + 1) + 8 * v19);
          unint64_t v21 = objc_msgSend(v20, "index", v80, v81);
          unint64_t v22 = v21;
          uint64_t v23 = v96;
          uint64_t v24 = &v96;
          uint64_t v25 = &v96;
          if (v96)
          {
            while (1)
            {
              while (1)
              {
                uint64_t v25 = (void **)v23;
                unint64_t v26 = v23[4];
                if (v21 >= v26) {
                  break;
                }
                uint64_t v23 = *v25;
                uint64_t v24 = v25;
                if (!*v25) {
                  goto LABEL_14;
                }
              }
              if (v26 >= v21) {
                break;
              }
              uint64_t v23 = v25[1];
              if (!v23)
              {
                uint64_t v24 = v25 + 1;
                goto LABEL_14;
              }
            }
            uint64_t v27 = v25;
          }
          else
          {
LABEL_14:
            uint64_t v27 = operator new(0x30uLL);
            *((void *)v27 + 4) = v22;
            *((void *)v27 + 5) = 0;
            *(void *)uint64_t v27 = 0;
            *((void *)v27 + 1) = 0;
            *((void *)v27 + 2) = v25;
            void *v24 = v27;
            uint64_t v28 = v27;
            if (*v95)
            {
              v95 = (void **)*v95;
              uint64_t v28 = (void *)*v24;
            }
            id v29 = v96;
            BOOL v30 = v28 == v96;
            *((unsigned char *)v28 + 24) = v28 == v96;
            if (!v30)
            {
              do
              {
                uint64_t v31 = v28[2];
                if (*(unsigned char *)(v31 + 24)) {
                  break;
                }
                uint64_t v32 = *(void **)(v31 + 16);
                uint64_t v33 = *v32;
                if (*v32 == v31)
                {
                  uint64_t v36 = v32[1];
                  if (!v36 || (int v37 = *(unsigned __int8 *)(v36 + 24), v34 = (unsigned char *)(v36 + 24), v37))
                  {
                    if (*(void **)v31 == v28)
                    {
                      *(unsigned char *)(v31 + 24) = 1;
                      *((unsigned char *)v32 + 24) = 0;
                      uint64_t v40 = *(void *)(v31 + 8);
                      void *v32 = v40;
                      if (v40) {
                        goto LABEL_31;
                      }
                    }
                    else
                    {
                      uint64_t v38 = *(uint64_t **)(v31 + 8);
                      uint64_t v39 = *v38;
                      *(void *)(v31 + 8) = *v38;
                      if (v39)
                      {
                        *(void *)(v39 + 16) = v31;
                        uint64_t v32 = *(void **)(v31 + 16);
                      }
                      v38[2] = (uint64_t)v32;
                      *(void *)(*(void *)(v31 + 16) + 8 * (**(void **)(v31 + 16) != v31)) = v38;
                      uint64_t *v38 = v31;
                      *(void *)(v31 + 16) = v38;
                      uint64_t v32 = (void *)v38[2];
                      uint64_t v31 = *v32;
                      *((unsigned char *)v38 + 24) = 1;
                      *((unsigned char *)v32 + 24) = 0;
                      uint64_t v40 = *(void *)(v31 + 8);
                      void *v32 = v40;
                      if (v40) {
LABEL_31:
                      }
                        *(void *)(v40 + 16) = v32;
                    }
                    *(void *)(v31 + 16) = v32[2];
                    *(void *)(v32[2] + 8 * (*(void *)v32[2] != (void)v32)) = v31;
                    *(void *)(v31 + 8) = v32;
LABEL_38:
                    v32[2] = v31;
                    break;
                  }
                }
                else if (!v33 || (v35 = *(unsigned __int8 *)(v33 + 24), uint64_t v34 = (unsigned char *)(v33 + 24), v35))
                {
                  if (*(void **)v31 == v28)
                  {
                    uint64_t v42 = v28[1];
                    *(void *)uint64_t v31 = v42;
                    if (v42)
                    {
                      *(void *)(v42 + 16) = v31;
                      uint64_t v32 = *(void **)(v31 + 16);
                    }
                    void v28[2] = v32;
                    *(void *)(*(void *)(v31 + 16) + 8 * (**(void **)(v31 + 16) != v31)) = v28;
                    v28[1] = v31;
                    *(void *)(v31 + 16) = v28;
                    uint64_t v32 = (void *)v28[2];
                    *((unsigned char *)v28 + 24) = 1;
                    *((unsigned char *)v32 + 24) = 0;
                    uint64_t v31 = v32[1];
                    uint64_t v41 = *(void **)v31;
                    v32[1] = *(void *)v31;
                    if (v41) {
LABEL_36:
                    }
                      v41[2] = v32;
                  }
                  else
                  {
                    *(unsigned char *)(v31 + 24) = 1;
                    *((unsigned char *)v32 + 24) = 0;
                    uint64_t v31 = v32[1];
                    uint64_t v41 = *(void **)v31;
                    v32[1] = *(void *)v31;
                    if (v41) {
                      goto LABEL_36;
                    }
                  }
                  *(void *)(v31 + 16) = v32[2];
                  *(void *)(v32[2] + 8 * (*(void *)v32[2] != (void)v32)) = v31;
                  *(void *)uint64_t v31 = v32;
                  goto LABEL_38;
                }
                *(unsigned char *)(v31 + 24) = 1;
                uint64_t v28 = v32;
                *((unsigned char *)v32 + 24) = v32 == v29;
                unsigned char *v34 = 1;
              }
              while (v32 != v29);
            }
            ++v97;
          }
          objc_storeStrong((id *)v27 + 5, v20);
          ++v19;
        }
        while (v19 != v17);
        uint64_t v43 = [v16 countByEnumeratingWithState:&v91 objects:v99 count:16];
        uint64_t v17 = v43;
      }
      while (v43);
    }
  }
  else
  {
    long long v89 = 0uLL;
    long long v90 = 0uLL;
    long long v87 = 0uLL;
    long long v88 = 0uLL;
    id v16 = v86;
    uint64_t v44 = [v16 countByEnumeratingWithState:&v87 objects:v98 count:16];
    if (v44)
    {
      uint64_t v45 = *(void *)v88;
      do
      {
        uint64_t v46 = 0;
        do
        {
          if (*(void *)v88 != v45) {
            objc_enumerationMutation(v16);
          }
          uint64_t v47 = *(void **)(*((void *)&v87 + 1) + 8 * v46);
          unint64_t v48 = objc_msgSend(v47, "index", v80, v81);
          unint64_t v49 = v48;
          unint64_t v50 = v96;
          id v51 = &v96;
          v52 = &v96;
          if (v96)
          {
            while (1)
            {
              while (1)
              {
                v52 = (void **)v50;
                unint64_t v53 = v50[4];
                if (v48 >= v53) {
                  break;
                }
                unint64_t v50 = *v52;
                id v51 = v52;
                if (!*v52) {
                  goto LABEL_62;
                }
              }
              if (v53 >= v48) {
                break;
              }
              unint64_t v50 = v52[1];
              if (!v50)
              {
                id v51 = v52 + 1;
                goto LABEL_62;
              }
            }
            uint64_t v54 = v52;
          }
          else
          {
LABEL_62:
            uint64_t v54 = operator new(0x30uLL);
            *((void *)v54 + 4) = v49;
            *((void *)v54 + 5) = 0;
            *(void *)uint64_t v54 = 0;
            *((void *)v54 + 1) = 0;
            *((void *)v54 + 2) = v52;
            void *v51 = v54;
            uint64_t v55 = v54;
            if (*v95)
            {
              v95 = (void **)*v95;
              uint64_t v55 = (void *)*v51;
            }
            uint64_t v56 = v96;
            BOOL v30 = v55 == v96;
            *((unsigned char *)v55 + 24) = v55 == v96;
            if (!v30)
            {
              do
              {
                uint64_t v57 = v55[2];
                if (*(unsigned char *)(v57 + 24)) {
                  break;
                }
                uint64_t v58 = *(void **)(v57 + 16);
                uint64_t v59 = *v58;
                if (*v58 == v57)
                {
                  uint64_t v62 = v58[1];
                  if (!v62 || (int v63 = *(unsigned __int8 *)(v62 + 24), v60 = (unsigned char *)(v62 + 24), v63))
                  {
                    if (*(void **)v57 == v55)
                    {
                      *(unsigned char *)(v57 + 24) = 1;
                      *((unsigned char *)v58 + 24) = 0;
                      uint64_t v66 = *(void *)(v57 + 8);
                      void *v58 = v66;
                      if (v66) {
                        goto LABEL_79;
                      }
                    }
                    else
                    {
                      v64 = *(uint64_t **)(v57 + 8);
                      uint64_t v65 = *v64;
                      *(void *)(v57 + 8) = *v64;
                      if (v65)
                      {
                        *(void *)(v65 + 16) = v57;
                        uint64_t v58 = *(void **)(v57 + 16);
                      }
                      v64[2] = (uint64_t)v58;
                      *(void *)(*(void *)(v57 + 16) + 8 * (**(void **)(v57 + 16) != v57)) = v64;
                      uint64_t *v64 = v57;
                      *(void *)(v57 + 16) = v64;
                      uint64_t v58 = (void *)v64[2];
                      uint64_t v57 = *v58;
                      *((unsigned char *)v64 + 24) = 1;
                      *((unsigned char *)v58 + 24) = 0;
                      uint64_t v66 = *(void *)(v57 + 8);
                      void *v58 = v66;
                      if (v66) {
LABEL_79:
                      }
                        *(void *)(v66 + 16) = v58;
                    }
                    *(void *)(v57 + 16) = v58[2];
                    *(void *)(v58[2] + 8 * (*(void *)v58[2] != (void)v58)) = v57;
                    *(void *)(v57 + 8) = v58;
LABEL_86:
                    v58[2] = v57;
                    break;
                  }
                }
                else if (!v59 || (int v61 = *(unsigned __int8 *)(v59 + 24), v60 = (unsigned char *)(v59 + 24), v61))
                {
                  if (*(void **)v57 == v55)
                  {
                    uint64_t v68 = v55[1];
                    *(void *)uint64_t v57 = v68;
                    if (v68)
                    {
                      *(void *)(v68 + 16) = v57;
                      uint64_t v58 = *(void **)(v57 + 16);
                    }
                    v55[2] = v58;
                    *(void *)(*(void *)(v57 + 16) + 8 * (**(void **)(v57 + 16) != v57)) = v55;
                    v55[1] = v57;
                    *(void *)(v57 + 16) = v55;
                    uint64_t v58 = (void *)v55[2];
                    *((unsigned char *)v55 + 24) = 1;
                    *((unsigned char *)v58 + 24) = 0;
                    uint64_t v57 = v58[1];
                    uint64_t v67 = *(void **)v57;
                    v58[1] = *(void *)v57;
                    if (v67) {
LABEL_84:
                    }
                      void v67[2] = v58;
                  }
                  else
                  {
                    *(unsigned char *)(v57 + 24) = 1;
                    *((unsigned char *)v58 + 24) = 0;
                    uint64_t v57 = v58[1];
                    uint64_t v67 = *(void **)v57;
                    v58[1] = *(void *)v57;
                    if (v67) {
                      goto LABEL_84;
                    }
                  }
                  *(void *)(v57 + 16) = v58[2];
                  *(void *)(v58[2] + 8 * (*(void *)v58[2] != (void)v58)) = v57;
                  *(void *)uint64_t v57 = v58;
                  goto LABEL_86;
                }
                *(unsigned char *)(v57 + 24) = 1;
                uint64_t v55 = v58;
                *((unsigned char *)v58 + 24) = v58 == v56;
                unsigned char *v60 = 1;
              }
              while (v58 != v56);
            }
            ++v97;
          }
          objc_storeStrong((id *)v54 + 5, v47);
          ++v46;
        }
        while (v46 != v44);
        uint64_t v69 = [v16 countByEnumeratingWithState:&v87 objects:v98 count:16];
        uint64_t v44 = v69;
      }
      while (v69);
    }
  }

  id v70 = v95;
  if (v95 != &v96)
  {
    uint64_t v71 = 0;
    do
    {
      objc_msgSend(v85, "setObject:atIndexedSubscript:", v70[5], v71, v80);
      uint64_t v72 = (void *)v70[1];
      if (v72)
      {
        do
        {
          uint64_t v73 = (void **)v72;
          uint64_t v72 = (void *)*v72;
        }
        while (v72);
      }
      else
      {
        do
        {
          uint64_t v73 = (void **)v70[2];
          BOOL v30 = *v73 == v70;
          id v70 = v73;
        }
        while (!v30);
      }
      ++v71;
      id v70 = v73;
    }
    while (v73 != &v96);
  }
  id v74 = v81;
  id v75 = getMPSShapedDictionaryFromDataDictionary(v82);
  v76 = [v84 compilationDescriptor];
  if (v85) {
    id v77 = v85;
  }
  else {
    id v77 = v86;
  }
  uint64_t v78 = -[MPSGraph compileWithDevice:feeds:targetTensors:targetOperations:compilationDescriptor:](v80, "compileWithDevice:feeds:targetTensors:targetOperations:compilationDescriptor:", v74, v75, v77, v83, v76, v80);

  std::__tree<std::__value_type<unsigned long,MPSGraphTensor * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,MPSGraphTensor * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,MPSGraphTensor * {__strong}>>>::destroy(v96);

  return v78;
}

void __110__MPSGraph_getExecutableForDevice_feeds_targetTensors_targetOperations_resultsDictionary_executionDescriptor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v22 = a2;
  id v4 = a3;
  objc_super v5 = [v4 shape];
  id v6 = [v22 shape];
  if (v6)
  {
    uint64_t v7 = [v5 count];
    if (v7 != [v6 count] && objc_msgSend(v6, "count") && objc_msgSend(v5, "count") == 1)
    {
      int v8 = [v5 objectAtIndexedSubscript:0];
      [v8 intValue];
    }
    uint64_t v9 = [v5 count];
    if (v9 != [v6 count])
    {
      if ([v6 count])
      {
        if ([v5 count] != 1
          || ([v5 objectAtIndexedSubscript:0],
              id v10 = objc_claimAutoreleasedReturnValue(),
              int v11 = [v10 intValue],
              v10,
              v11 != 1))
        {
          if (MTLReportFailureTypeEnabled()) {
            MTLReportFailure();
          }
        }
      }
    }
    if ([v5 count] != 1
      || ([v5 objectAtIndexedSubscript:0],
          id v12 = objc_claimAutoreleasedReturnValue(),
          int v13 = [v12 intValue],
          v12,
          v13 != 1))
    {
      for (unint64_t i = 0; i < objc_msgSend(v6, "count", v19, v20, v21); ++i)
      {
        id v15 = [v6 objectAtIndexedSubscript:i];
        uint64_t v16 = [v15 integerValue];

        uint64_t v17 = [v5 objectAtIndexedSubscript:i];
        uint64_t v18 = [v17 integerValue];

        if (v16 != 0x8000000000000000 && v16 != -1 && v16 != v18 && MTLReportFailureTypeEnabled())
        {
          uint64_t v20 = v18;
          unint64_t v21 = i;
          uint64_t v19 = v16;
          MTLReportFailure();
        }
      }
    }
  }
}

- (id)runInternalWithMPSCommandBuffer:(id)a3 feeds:(id)a4 targetTensors:(id)a5 targetOperations:(id)a6 resultsDictionary:(id)a7 executionDescriptor:(id)a8 mpsGraphOwnedCommandBuffer:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  uint64_t v27 = v17;
  unint64_t v21 = [v15 device];
  id v22 = +[MPSGraphDevice deviceWithMTLDevice:v21];

  uint64_t v23 = [(MPSGraph *)self getExecutableForDevice:v22 feeds:v16 targetTensors:v17 targetOperations:v18 resultsDictionary:v19 executionDescriptor:v20];
  uint64_t v24 = [[MPSGraphExecutableExecutionDescriptor alloc] initWithGraphExecutionDescriptor:v20];
  [v23 setOptions:self->_options];
  uint64_t v25 = [v23 runInternalWithDevice:v22 commandBuffer:v15 feedsDictionary:v16 resultsDictionary:v19 executableExecutionDescriptor:v24 mpsGraphOwnedCommandBuffer:a9];
  if (!v20 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }

  return v25;
}

- (id)runWithDevice:(id)a3 feeds:(id)a4 targetTensors:(id)a5 targetOperations:(id)a6 executionDescriptor:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v16)
  {
    id v16 = (id)objc_opt_new();
    [v16 setWaitUntilCompleted:1];
  }
  id v17 = [(MPSGraph *)self runInternalWithMPSGraphDevice:v12 feeds:v13 targetTensors:v14 targetOperations:v15 resultsDictionary:0 executionDescriptor:v16];

  return v17;
}

- (void)runWithDevice:(id)a3 feeds:(id)a4 targetOperations:(id)a5 resultsDictionary:(id)a6 executionDescriptor:(id)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (!v15)
  {
    id v15 = (id)objc_opt_new();
    [v15 setWaitUntilCompleted:1];
  }
  id v16 = [v14 allKeys];
  id v17 = [(MPSGraph *)self runInternalWithMPSGraphDevice:v18 feeds:v12 targetTensors:v16 targetOperations:v13 resultsDictionary:v14 executionDescriptor:v15];
}

- (id)runAsyncWithDevice:(id)a3 feeds:(id)a4 targetTensors:(id)a5 targetOperations:(id)a6 executionDescriptor:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v16)
  {
    id v16 = (id)objc_opt_new();
    [v16 setWaitUntilCompleted:0];
  }
  id v17 = [(MPSGraph *)self runInternalWithMPSGraphDevice:v12 feeds:v13 targetTensors:v14 targetOperations:v15 resultsDictionary:0 executionDescriptor:v16];

  return v17;
}

- (void)runAsyncWithDevice:(id)a3 feeds:(id)a4 targetOperations:(id)a5 resultsDictionary:(id)a6 executionDescriptor:(id)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (!v15)
  {
    id v15 = (id)objc_opt_new();
    [v15 setWaitUntilCompleted:0];
  }
  id v16 = [v14 allKeys];
  id v17 = [(MPSGraph *)self runInternalWithMPSGraphDevice:v18 feeds:v12 targetTensors:v16 targetOperations:v13 resultsDictionary:v14 executionDescriptor:v15];
}

- (id)runInternalWithMPSGraphDevice:(id)a3 feeds:(id)a4 targetTensors:(id)a5 targetOperations:(id)a6 resultsDictionary:(id)a7 executionDescriptor:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!v19)
  {
    id v19 = (id)objc_opt_new();
    [v19 setWaitUntilCompleted:1];
  }
  id v20 = [v19 compilationDescriptor];

  if (!v20)
  {
    unint64_t v21 = objc_opt_new();
    [v21 setCompilerOptions:self->_compilerOptions];
    [v19 setCompilationDescriptor:v21];
  }
  id v22 = [(MPSGraph *)self getExecutableForDevice:v14 feeds:v15 targetTensors:v16 targetOperations:v17 resultsDictionary:v18 executionDescriptor:v19];
  uint64_t v23 = [[MPSGraphExecutableExecutionDescriptor alloc] initWithGraphExecutionDescriptor:v19];
  [v22 setOptions:self->_options];
  uint64_t v24 = [v22 runInternalWithDevice:v14 commandBuffer:0 feedsDictionary:v15 resultsDictionary:v18 executableExecutionDescriptor:v23 mpsGraphOwnedCommandBuffer:0];

  return v24;
}

- (MPSGraphOptions)options
{
  return self->_options;
}

- (void)setOptions:(MPSGraphOptions)options
{
  self->_options = options;
}

- (BOOL)pruneGraph
{
  return self->_pruneGraph;
}

- (void)setPruneGraph:(BOOL)a3
{
  self->_pruneGraph = a3;
}

- (NSMutableDictionary)tensorNameDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 208, 1);
}

- (void)setTensorNameDict:(id)a3
{
}

- (unint64_t)compilerOptions
{
  return self->_compilerOptions;
}

- (void)setCompilerOptions:(unint64_t)a3
{
  self->_compilerOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tensorNameDict, 0);
  objc_storeStrong((id *)&self->_executableCache, 0);
  objc_storeStrong((id *)&self->_traininableHighLevelOpVariables, 0);
  objc_storeStrong((id *)&self->_currentInsertionBlock, 0);
  objc_storeStrong((id *)&self->_currentControlDependencies, 0);
  objc_storeStrong((id *)&self->_operations, 0);
  state = self->_module.op.state;
  if (state) {
    mlir::Operation::erase(state);
  }
  cntrl = self->_context.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_variableOps, 0);
  objc_storeStrong((id *)&self->_variableOpsMap, 0);
  objc_storeStrong((id *)&self->_placeholderArray, 0);

  objc_storeStrong((id *)&self->_placeholderMap, 0);
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 8) = 0;
  return self;
}

- (MPSGraphTensor)resizeTensor:(MPSGraphTensor *)imagesTensor size:(MPSShape *)size mode:(MPSGraphResizeMode)mode centerResult:(BOOL)centerResult alignCorners:(BOOL)alignCorners layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name
{
  BOOL v11 = centerResult;
  v36[1] = *MEMORY[0x1E4F143B8];
  uint64_t v31 = imagesTensor;
  uint64_t v32 = name;
  MPSShapeToVector<int>(size, (char **)&v34);
  if (layout >= MPSGraphTensorNamedDataLayoutHW)
  {
    std::vector<int>::size_type v15 = 0;
    std::vector<int>::size_type v16 = 0;
  }
  else
  {
    std::vector<int>::size_type v15 = qword_181130D60[layout];
    std::vector<int>::size_type v16 = qword_181130D90[layout];
  }
  v17.__i_ = v34.__begin_;
  std::vector<int>::value_type __x = -1;
  std::vector<int>::insert(&v34, v17, v16, &__x);
  v18.__i_ = v34.__end_;
  std::vector<int>::value_type __x = -1;
  std::vector<int>::insert(&v34, v18, v15, &__x);
  int64_t v19 = (char *)v34.__end_ - (char *)v34.__begin_;
  id v20 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
  unint64_t v21 = [NSNumber numberWithUnsignedInteger:v19 >> 2];
  v36[0] = v21;
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  uint64_t v23 = [(MPSGraph *)self constantWithData:v20 shape:v22 dataType:536870944];

  uint64_t v24 = [MPSGraphResizeOp alloc];
  v35[0] = v31;
  v35[1] = v23;
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  LOBYTE(v30) = alignCorners;
  unint64_t v26 = [(MPSGraphResizeBaseOp *)v24 initWithGraph:self inputTensors:v25 controlDependencies:MEMORY[0x1E4F1CBF0] mode:mode nearestRoundingMode:0 centerResult:v11 alignCorners:v30 layout:layout name:v32];

  uint64_t v27 = [(MPSGraphOperation *)v26 outputTensors];
  uint64_t v28 = [v27 objectAtIndexedSubscript:0];

  if (v34.__begin_)
  {
    v34.__end_ = v34.__begin_;
    operator delete(v34.__begin_);
  }

  return (MPSGraphTensor *)v28;
}

- (MPSGraphTensor)resizeTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size mode:(MPSGraphResizeMode)mode centerResult:(BOOL)centerResult alignCorners:(BOOL)alignCorners layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name
{
  uint64_t v9 = [(MPSGraph *)self resizeTensor:imagesTensor sizeTensor:size mode:mode nearestRoundingMode:0 centerResult:centerResult alignCorners:alignCorners layout:layout name:name];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)resizeNearestWithTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size nearestRoundingMode:(MPSGraphResizeNearestRoundingMode)nearestRoundingMode centerResult:(BOOL)centerResult alignCorners:(BOOL)alignCorners layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name
{
  uint64_t v9 = [(MPSGraph *)self resizeTensor:imagesTensor sizeTensor:size mode:0 nearestRoundingMode:nearestRoundingMode centerResult:centerResult alignCorners:alignCorners layout:layout name:name];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)resizeBilinearWithTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size centerResult:(BOOL)centerResult alignCorners:(BOOL)alignCorners layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name
{
  int v8 = [(MPSGraph *)self resizeTensor:imagesTensor sizeTensor:size mode:1 centerResult:centerResult alignCorners:alignCorners layout:layout name:name];

  return (MPSGraphTensor *)v8;
}

- (id)resizeTensor:(id)a3 sizeTensor:(id)a4 mode:(unint64_t)a5 nearestRoundingMode:(unint64_t)a6 centerResult:(BOOL)a7 alignCorners:(BOOL)a8 layout:(unint64_t)a9 name:(id)a10
{
  BOOL v11 = a7;
  v30[2] = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v16 = a4;
  std::vector<int>::const_iterator v17 = (NSString *)a10;
  std::vector<int>::const_iterator v18 = [(MPSGraph *)self fixCastIntTensor:v16 toSignedness:1 name:v17];

  uint64_t v27 = v18;
  id v29 = padSizeScaleOffsetForLayout(self, v18, 0, 0, (MPSGraphTensorNamedDataLayout)a9, v17);
  int64_t v19 = [MPSGraphResizeOp alloc];
  v30[0] = v28;
  id v20 = [v29 objectAtIndexedSubscript:0];
  v30[1] = v20;
  unint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  LOBYTE(v26) = a8;
  id v22 = [(MPSGraphResizeBaseOp *)v19 initWithGraph:self inputTensors:v21 controlDependencies:MEMORY[0x1E4F1CBF0] mode:a5 nearestRoundingMode:a6 centerResult:v11 alignCorners:v26 layout:a9 name:v17];

  uint64_t v23 = [(MPSGraphOperation *)v22 outputTensors];
  uint64_t v24 = [v23 objectAtIndexedSubscript:0];

  return v24;
}

- (MPSGraphTensor)resizeTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size scaleOffsetTensor:(MPSGraphTensor *)scaleOffset mode:(MPSGraphResizeMode)mode layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name
{
  int v8 = [(MPSGraph *)self resizeTensor:imagesTensor sizeTensor:size scaleOffsetTensor:scaleOffset mode:mode nearestRoundingMode:0 layout:layout name:name];

  return (MPSGraphTensor *)v8;
}

- (MPSGraphTensor)resizeNearestWithTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size scaleOffsetTensor:(MPSGraphTensor *)scaleOffset nearestRoundingMode:(MPSGraphResizeNearestRoundingMode)nearestRoundingMode layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name
{
  int v8 = [(MPSGraph *)self resizeTensor:imagesTensor sizeTensor:size scaleOffsetTensor:scaleOffset mode:0 nearestRoundingMode:nearestRoundingMode layout:layout name:name];

  return (MPSGraphTensor *)v8;
}

- (MPSGraphTensor)resizeBilinearWithTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size scaleOffsetTensor:(MPSGraphTensor *)scaleOffset layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name
{
  uint64_t v7 = [(MPSGraph *)self resizeTensor:imagesTensor sizeTensor:size scaleOffsetTensor:scaleOffset mode:1 layout:layout name:name];

  return (MPSGraphTensor *)v7;
}

- (id)resizeTensor:(id)a3 sizeTensor:(id)a4 scaleOffsetTensor:(id)a5 mode:(unint64_t)a6 nearestRoundingMode:(unint64_t)a7 layout:(unint64_t)a8 name:(id)a9
{
  v37[4] = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v15 = a4;
  id v36 = a5;
  id v16 = a9;
  uint64_t v33 = [(MPSGraph *)self fixCastIntTensor:v15 toSignedness:1 name:v16];

  if (v16)
  {
    std::vector<int>::const_iterator v17 = [v16 stringByAppendingString:@"/slice0"];
  }
  else
  {
    std::vector<int>::const_iterator v17 = @"resize/slice0";
  }
  int v35 = [(MPSGraph *)self sliceTensor:v36 dimension:0 start:0 length:2 name:v17];
  if (v16)
  {

    std::vector<int>::const_iterator v18 = [v16 stringByAppendingString:@"/slice1"];
  }
  else
  {
    std::vector<int>::const_iterator v18 = @"resize/slice1";
  }
  std::vector<int> v34 = [(MPSGraph *)self sliceTensor:v36 dimension:0 start:2 length:2 name:v18];
  if (v16) {

  }
  int64_t v19 = padSizeScaleOffsetForLayout(self, v33, v35, v34, (MPSGraphTensorNamedDataLayout)a8, (NSString *)v16);
  id v20 = [MPSGraphResizeOp alloc];
  v37[0] = v32;
  [v19 objectAtIndexedSubscript:0];
  uint64_t v31 = v21 = a8;
  v37[1] = v31;
  id v22 = [v19 objectAtIndexedSubscript:1];
  unint64_t v23 = a7;
  v37[2] = v22;
  uint64_t v24 = [v19 objectAtIndexedSubscript:2];
  v37[3] = v24;
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
  LOBYTE(v30) = 0;
  uint64_t v26 = [(MPSGraphResizeBaseOp *)v20 initWithGraph:self inputTensors:v25 controlDependencies:MEMORY[0x1E4F1CBF0] mode:a6 nearestRoundingMode:v23 centerResult:0 alignCorners:v30 layout:v21 name:v16];

  uint64_t v27 = [(MPSGraphOperation *)v26 outputTensors];
  id v28 = [v27 objectAtIndexedSubscript:0];

  return v28;
}

- (MPSGraphTensor)resizeWithGradientTensor:(MPSGraphTensor *)gradient input:(MPSGraphTensor *)input mode:(MPSGraphResizeMode)mode centerResult:(BOOL)centerResult alignCorners:(BOOL)alignCorners layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name
{
  uint64_t v9 = [(MPSGraph *)self resizeWithGradientTensor:gradient input:input mode:mode nearestRoundingMode:0 centerResult:centerResult alignCorners:alignCorners layout:layout name:name];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)resizeNearestWithGradientTensor:(MPSGraphTensor *)gradient input:(MPSGraphTensor *)input nearestRoundingMode:(MPSGraphResizeNearestRoundingMode)nearestRoundingMode centerResult:(BOOL)centerResult alignCorners:(BOOL)alignCorners layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name
{
  uint64_t v9 = [(MPSGraph *)self resizeWithGradientTensor:gradient input:input mode:0 nearestRoundingMode:nearestRoundingMode centerResult:centerResult alignCorners:alignCorners layout:layout name:name];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)resizeBilinearWithGradientTensor:(MPSGraphTensor *)gradient input:(MPSGraphTensor *)input centerResult:(BOOL)centerResult alignCorners:(BOOL)alignCorners layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name
{
  int v8 = [(MPSGraph *)self resizeWithGradientTensor:gradient input:input mode:1 centerResult:centerResult alignCorners:alignCorners layout:layout name:name];

  return (MPSGraphTensor *)v8;
}

- (id)resizeWithGradientTensor:(id)a3 input:(id)a4 mode:(unint64_t)a5 nearestRoundingMode:(unint64_t)a6 centerResult:(BOOL)a7 alignCorners:(BOOL)a8 layout:(unint64_t)a9 name:(id)a10
{
  BOOL v11 = a7;
  v29[2] = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v28 = a4;
  id v16 = a10;
  std::vector<int>::const_iterator v17 = v16;
  if (v16)
  {
    std::vector<int>::const_iterator v18 = [v16 stringByAppendingString:@"/shapeOf"];
  }
  else
  {
    std::vector<int>::const_iterator v18 = @"resizeGrad/shapeOf";
  }
  int64_t v19 = [(MPSGraph *)self shapeOfTensor:v28 name:v18];
  if (v17) {

  }
  id v20 = [MPSGraphResizeGradientOp alloc];
  v29[0] = v27;
  v29[1] = v19;
  unint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  LOBYTE(v26) = a8;
  id v22 = [(MPSGraphResizeBaseOp *)v20 initWithGraph:self inputTensors:v21 controlDependencies:MEMORY[0x1E4F1CBF0] mode:a5 nearestRoundingMode:a6 centerResult:v11 alignCorners:v26 layout:a9 name:v17];

  unint64_t v23 = [(MPSGraphOperation *)v22 outputTensors];
  uint64_t v24 = [v23 objectAtIndexedSubscript:0];

  return v24;
}

- (MPSGraphTensor)resizeWithGradientTensor:(MPSGraphTensor *)gradient input:(MPSGraphTensor *)input scaleOffsetTensor:(MPSGraphTensor *)scaleOffset mode:(MPSGraphResizeMode)mode layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name
{
  int v8 = [(MPSGraph *)self resizeWithGradientTensor:gradient input:input scaleOffsetTensor:scaleOffset mode:mode nearestRoundingMode:0 layout:layout name:name];

  return (MPSGraphTensor *)v8;
}

- (MPSGraphTensor)resizeNearestWithGradientTensor:(MPSGraphTensor *)gradient input:(MPSGraphTensor *)input scaleOffsetTensor:(MPSGraphTensor *)scaleOffset nearestRoundingMode:(MPSGraphResizeNearestRoundingMode)nearestRoundingMode layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name
{
  int v8 = [(MPSGraph *)self resizeWithGradientTensor:gradient input:input scaleOffsetTensor:scaleOffset mode:0 nearestRoundingMode:nearestRoundingMode layout:layout name:name];

  return (MPSGraphTensor *)v8;
}

- (MPSGraphTensor)resizeBilinearWithGradientTensor:(MPSGraphTensor *)gradient input:(MPSGraphTensor *)input scaleOffsetTensor:(MPSGraphTensor *)scaleOffset layout:(MPSGraphTensorNamedDataLayout)layout name:(NSString *)name
{
  uint64_t v7 = [(MPSGraph *)self resizeWithGradientTensor:gradient input:input scaleOffsetTensor:scaleOffset mode:1 layout:layout name:name];

  return (MPSGraphTensor *)v7;
}

- (id)resizeWithGradientTensor:(id)a3 input:(id)a4 scaleOffsetTensor:(id)a5 mode:(unint64_t)a6 nearestRoundingMode:(unint64_t)a7 layout:(unint64_t)a8 name:(id)a9
{
  v36[4] = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v34 = a4;
  id v35 = a5;
  id v15 = a9;
  id v16 = v15;
  if (v15)
  {
    std::vector<int>::const_iterator v17 = [v15 stringByAppendingString:@"/shapeOf"];
  }
  else
  {
    std::vector<int>::const_iterator v17 = @"resizeGrad/shapeOf";
  }
  uint64_t v31 = [(MPSGraph *)self shapeOfTensor:v34 name:v17];
  if (v16)
  {

    std::vector<int>::const_iterator v18 = [v16 stringByAppendingString:@"/slice0"];
  }
  else
  {
    std::vector<int>::const_iterator v18 = @"resize/slice0";
  }
  uint64_t v33 = [(MPSGraph *)self sliceTensor:v35 dimension:0 start:0 length:2 name:v18];
  if (v16)
  {

    int64_t v19 = [v16 stringByAppendingString:@"/slice1"];
  }
  else
  {
    int64_t v19 = @"resize/slice1";
  }
  id v32 = [(MPSGraph *)self sliceTensor:v35 dimension:0 start:2 length:2 name:v19];
  if (v16) {

  }
  id v20 = padSizeScaleOffsetForLayout(self, 0, v33, v32, (MPSGraphTensorNamedDataLayout)a8, (NSString *)v16);
  unint64_t v21 = [MPSGraphResizeGradientOp alloc];
  v36[0] = v30;
  v36[1] = v31;
  id v22 = [v20 objectAtIndexedSubscript:1];
  void v36[2] = v22;
  unint64_t v23 = [v20 objectAtIndexedSubscript:2];
  v36[3] = v23;
  uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];
  LOBYTE(v29) = 0;
  uint64_t v25 = [(MPSGraphResizeBaseOp *)v21 initWithGraph:self inputTensors:v24 controlDependencies:MEMORY[0x1E4F1CBF0] mode:a6 nearestRoundingMode:a7 centerResult:0 alignCorners:v29 layout:a8 name:v16];

  uint64_t v26 = [(MPSGraphOperation *)v25 outputTensors];
  id v27 = [v26 objectAtIndexedSubscript:0];

  return v27;
}

- (MPSGraphTensor)resizeTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size mode:(MPSGraphResizeMode)mode centerResult:(BOOL)centerResult alignCorners:(BOOL)alignCorners name:(NSString *)name
{
  int v8 = [(MPSGraph *)self resizeTensor:imagesTensor sizeTensor:size mode:mode nearestRoundingMode:0 centerResult:centerResult alignCorners:alignCorners name:name];

  return (MPSGraphTensor *)v8;
}

- (MPSGraphTensor)resizeBilinearWithTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size centerResult:(BOOL)centerResult alignCorners:(BOOL)alignCorners name:(NSString *)name
{
  uint64_t v7 = [(MPSGraph *)self resizeTensor:imagesTensor sizeTensor:size mode:1 centerResult:centerResult alignCorners:alignCorners name:name];

  return (MPSGraphTensor *)v7;
}

- (MPSGraphTensor)resizeNearestWithTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size nearestRoundingMode:(MPSGraphResizeNearestRoundingMode)nearestRoundingMode centerResult:(BOOL)centerResult alignCorners:(BOOL)alignCorners name:(NSString *)name
{
  int v8 = [(MPSGraph *)self resizeTensor:imagesTensor sizeTensor:size mode:0 nearestRoundingMode:nearestRoundingMode centerResult:centerResult alignCorners:alignCorners name:name];

  return (MPSGraphTensor *)v8;
}

- (id)resizeTensor:(id)a3 sizeTensor:(id)a4 mode:(unint64_t)a5 nearestRoundingMode:(unint64_t)a6 centerResult:(BOOL)a7 alignCorners:(BOOL)a8 name:(id)a9
{
  BOOL v10 = a7;
  void v26[2] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a9;
  std::vector<int>::const_iterator v18 = [(MPSGraph *)self fixCastIntTensor:v16 toSignedness:1 name:v17];

  int64_t v19 = [MPSGraphResizeOp alloc];
  v26[0] = v15;
  v26[1] = v18;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  LOBYTE(v25) = a8;
  unint64_t v21 = [(MPSGraphResizeBaseOp *)v19 initWithGraph:self inputTensors:v20 controlDependencies:MEMORY[0x1E4F1CBF0] mode:a5 nearestRoundingMode:a6 centerResult:v10 alignCorners:v25 name:v17];

  id v22 = [(MPSGraphOperation *)v21 outputTensors];
  unint64_t v23 = [v22 objectAtIndexedSubscript:0];

  return v23;
}

- (MPSGraphTensor)resizeTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size scaleTensor:(MPSGraphTensor *)scale offsetTensor:(MPSGraphTensor *)offset mode:(MPSGraphResizeMode)mode name:(NSString *)name
{
  int v8 = [(MPSGraph *)self resizeTensor:imagesTensor sizeTensor:size scaleTensor:scale offsetTensor:offset mode:mode nearestRoundingMode:0 name:name];

  return (MPSGraphTensor *)v8;
}

- (MPSGraphTensor)resizeBilinearWithTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size scaleTensor:(MPSGraphTensor *)scale offsetTensor:(MPSGraphTensor *)offset name:(NSString *)name
{
  uint64_t v7 = [(MPSGraph *)self resizeTensor:imagesTensor sizeTensor:size scaleTensor:scale offsetTensor:offset mode:1 name:name];

  return (MPSGraphTensor *)v7;
}

- (MPSGraphTensor)resizeNearestWithTensor:(MPSGraphTensor *)imagesTensor sizeTensor:(MPSGraphTensor *)size scaleTensor:(MPSGraphTensor *)scale offsetTensor:(MPSGraphTensor *)offset nearestRoundingMode:(MPSGraphResizeNearestRoundingMode)nearestRoundingMode name:(NSString *)name
{
  int v8 = [(MPSGraph *)self resizeTensor:imagesTensor sizeTensor:size scaleTensor:scale offsetTensor:offset mode:0 nearestRoundingMode:nearestRoundingMode name:name];

  return (MPSGraphTensor *)v8;
}

- (id)resizeTensor:(id)a3 sizeTensor:(id)a4 scaleTensor:(id)a5 offsetTensor:(id)a6 mode:(unint64_t)a7 nearestRoundingMode:(unint64_t)a8 name:(id)a9
{
  v28[4] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  id v20 = [(MPSGraph *)self fixCastIntTensor:v16 toSignedness:1 name:v19];

  unint64_t v21 = [MPSGraphResizeOp alloc];
  v28[0] = v15;
  v28[1] = v20;
  void v28[2] = v17;
  v28[3] = v18;
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
  LOBYTE(v27) = 0;
  unint64_t v23 = [(MPSGraphResizeBaseOp *)v21 initWithGraph:self inputTensors:v22 controlDependencies:MEMORY[0x1E4F1CBF0] mode:a7 nearestRoundingMode:a8 centerResult:0 alignCorners:v27 name:v19];

  uint64_t v24 = [(MPSGraphOperation *)v23 outputTensors];
  uint64_t v25 = [v24 objectAtIndexedSubscript:0];

  return v25;
}

- (MPSGraphTensor)resizeWithGradientTensor:(MPSGraphTensor *)gradient input:(MPSGraphTensor *)input scaleTensor:(MPSGraphTensor *)scale offsetTensor:(MPSGraphTensor *)offset mode:(MPSGraphResizeMode)mode name:(NSString *)name
{
  int v8 = [(MPSGraph *)self resizeWithGradientTensor:gradient input:input scaleTensor:scale offsetTensor:offset mode:mode nearestRoundingMode:0 name:name];

  return (MPSGraphTensor *)v8;
}

- (MPSGraphTensor)resizeBilinearWithGradientTensor:(MPSGraphTensor *)gradient input:(MPSGraphTensor *)input scaleTensor:(MPSGraphTensor *)scale offsetTensor:(MPSGraphTensor *)offset name:(NSString *)name
{
  uint64_t v7 = [(MPSGraph *)self resizeWithGradientTensor:gradient input:input scaleTensor:scale offsetTensor:offset mode:1 name:name];

  return (MPSGraphTensor *)v7;
}

- (MPSGraphTensor)resizeNearestWithGradientTensor:(MPSGraphTensor *)gradient input:(MPSGraphTensor *)input scaleTensor:(MPSGraphTensor *)scale offsetTensor:(MPSGraphTensor *)offset nearestRoundingMode:(MPSGraphResizeNearestRoundingMode)nearestRoundingMode name:(NSString *)name
{
  int v8 = [(MPSGraph *)self resizeWithGradientTensor:gradient input:input scaleTensor:scale offsetTensor:offset mode:0 nearestRoundingMode:nearestRoundingMode name:name];

  return (MPSGraphTensor *)v8;
}

- (id)resizeWithGradientTensor:(id)a3 input:(id)a4 scaleTensor:(id)a5 offsetTensor:(id)a6 mode:(unint64_t)a7 nearestRoundingMode:(unint64_t)a8 name:(id)a9
{
  v30[4] = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a9;
  id v19 = v18;
  if (v18)
  {
    id v20 = [v18 stringByAppendingString:@"/shapeOf"];
  }
  else
  {
    id v20 = @"resizeGrad/shapeOf";
  }
  unint64_t v21 = [(MPSGraph *)self shapeOfTensor:v15 name:v20];
  if (v19) {

  }
  id v22 = [MPSGraphResizeGradientOp alloc];
  v30[0] = v29;
  v30[1] = v21;
  v30[2] = v16;
  void v30[3] = v17;
  unint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
  LOBYTE(v28) = 0;
  uint64_t v24 = [(MPSGraphResizeBaseOp *)v22 initWithGraph:self inputTensors:v23 controlDependencies:MEMORY[0x1E4F1CBF0] mode:a7 nearestRoundingMode:a8 centerResult:0 alignCorners:v28 name:v19];

  uint64_t v25 = [(MPSGraphOperation *)v24 outputTensors];
  uint64_t v26 = [v25 objectAtIndexedSubscript:0];

  return v26;
}

- (MPSGraphTensor)varianceOfTensor:(MPSGraphTensor *)tensor meanTensor:(MPSGraphTensor *)meanTensor axes:(NSArray *)axes name:(NSString *)name
{
  BOOL v10 = tensor;
  BOOL v11 = meanTensor;
  id v12 = axes;
  id v13 = name;
  id v14 = v13;
  if (v13)
  {
    id v15 = [(NSString *)v13 stringByAppendingString:@"/subtraction"];
  }
  else
  {
    id v15 = @"variance/subtraction";
  }
  id v16 = [(MPSGraph *)self subtractionWithPrimaryTensor:v10 secondaryTensor:v11 name:v15];
  if (v14)
  {

    id v17 = [(NSString *)v14 stringByAppendingString:@"/square"];
  }
  else
  {
    id v17 = @"variance/square";
  }
  id v18 = [(MPSGraph *)self squareWithTensor:v16 name:v17];
  if (v14)
  {

    id v19 = [(NSString *)v14 stringByAppendingString:@"/mean"];
  }
  else
  {
    id v19 = @"variance/mean";
  }
  id v20 = [(MPSGraph *)self meanOfTensor:v18 axes:v12 name:v19];
  if (v14) {

  }
  return (MPSGraphTensor *)v20;
}

- (MPSGraphTensor)varianceOfTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name
{
  int v8 = tensor;
  uint64_t v9 = axes;
  BOOL v10 = name;
  BOOL v11 = v10;
  if (v10)
  {
    id v12 = [(NSString *)v10 stringByAppendingString:@"/mean"];
  }
  else
  {
    id v12 = @"variance/mean";
  }
  id v13 = [(MPSGraph *)self meanOfTensor:v8 axes:v9 name:v12];
  if (v11) {

  }
  id v14 = [(MPSGraph *)self varianceOfTensor:v8 meanTensor:v13 axes:v9 name:v11];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)normalizationWithTensor:(MPSGraphTensor *)tensor meanTensor:(MPSGraphTensor *)mean varianceTensor:(MPSGraphTensor *)variance gammaTensor:(MPSGraphTensor *)gamma betaTensor:(MPSGraphTensor *)beta epsilon:(float)epsilon name:(NSString *)name
{
  v29[5] = *MEMORY[0x1E4F143B8];
  id v16 = tensor;
  id v17 = mean;
  id v18 = variance;
  id v19 = gamma;
  id v20 = beta;
  unint64_t v21 = name;
  if (v19)
  {
    if (v20) {
      goto LABEL_6;
    }
  }
  else
  {
    id v19 = [(MPSGraph *)self constantWithScalar:[(MPSGraphTensor *)v16 dataType] dataType:1.0];
    if (v20) {
      goto LABEL_6;
    }
  }
  id v20 = [(MPSGraph *)self constantWithScalar:[(MPSGraphTensor *)v16 dataType] dataType:0.0];
LABEL_6:
  id v22 = [MPSGraphNormalizationOp alloc];
  v29[0] = v16;
  v29[1] = v17;
  v29[2] = v18;
  void v29[3] = v19;
  v29[4] = v20;
  unint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:5];
  *(float *)&double v24 = epsilon;
  uint64_t v25 = [(MPSGraphNormalizationOp *)v22 initWithGraph:self inputTensors:v23 controlDependencies:MEMORY[0x1E4F1CBF0] epsilon:v21 name:v24];

  uint64_t v26 = [(MPSGraphOperation *)v25 outputTensors];
  uint64_t v27 = [v26 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v27;
}

- (MPSGraphTensor)normalizationGammaGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradientTensor sourceTensor:(MPSGraphTensor *)sourceTensor meanTensor:(MPSGraphTensor *)meanTensor varianceTensor:(MPSGraphTensor *)varianceTensor reductionAxes:(NSArray *)axes epsilon:(float)epsilon name:(NSString *)name
{
  uint64_t v44 = incomingGradientTensor;
  id v16 = sourceTensor;
  id v17 = meanTensor;
  id v18 = varianceTensor;
  uint64_t v43 = axes;
  id v19 = name;
  uint64_t v41 = v18;
  uint64_t v42 = v17;
  uint64_t v20 = [(MPSGraph *)self constantWithScalar:&unk_1EC9F18E0 shape:268435488 dataType:epsilon];
  uint64_t v40 = (void *)v20;
  uint64_t v21 = [(MPSGraphTensor *)v16 dataType];
  if (v19)
  {
    id v22 = [(NSString *)v19 stringByAppendingFormat:@"/cast"];
  }
  else
  {
    id v22 = @"normalizationGradient/cast";
  }
  unint64_t v23 = [(MPSGraph *)self castTensor:v20 toType:v21 name:v22];
  if (v19)
  {

    double v24 = [(NSString *)v19 stringByAppendingString:@"/addition"];
  }
  else
  {
    double v24 = @"batchNormGammaGradient/addition";
  }
  uint64_t v25 = [(MPSGraph *)self additionWithPrimaryTensor:v18 secondaryTensor:v23 name:v24];
  if (v19)
  {

    uint64_t v26 = [(NSString *)v19 stringByAppendingString:@"/sqrt"];
  }
  else
  {
    uint64_t v26 = @"batchNormGammaGradient/sqrt";
  }
  uint64_t v27 = [(MPSGraph *)self squareRootWithTensor:v25 name:v26];
  if (v19)
  {

    uint64_t v28 = [(NSString *)v19 stringByAppendingString:@"/subtraction"];
  }
  else
  {
    uint64_t v28 = @"batchNormGammaGradient/subtraction";
  }
  id v29 = [(MPSGraph *)self subtractionWithPrimaryTensor:v16 secondaryTensor:v17 name:v28];
  if (v19)
  {

    id v30 = [(NSString *)v19 stringByAppendingString:@"/divison"];
  }
  else
  {
    id v30 = @"batchNormGammaGradient/divison";
  }
  uint64_t v31 = [(MPSGraph *)self divisionWithPrimaryTensor:v29 secondaryTensor:v27 name:v30];
  if (v19)
  {

    id v32 = [(NSString *)v19 stringByAppendingString:@"/multiplication"];
  }
  else
  {
    id v32 = @"batchNormGammaGradient/multiplication";
  }
  uint64_t v33 = [(MPSGraph *)self multiplicationWithPrimaryTensor:v44 secondaryTensor:v31 name:v32];
  id v34 = v33;
  if (v19)
  {

    id v35 = v34;
    id v36 = [(NSString *)v19 stringByAppendingFormat:@"/sum"];
  }
  else
  {
    id v37 = v33;
    id v36 = @"batchNormGammaGradient/sum";
  }
  uint64_t v38 = [(MPSGraph *)self reductionSumWithTensor:v34 axes:v43 name:v36];
  if (v19) {

  }
  return (MPSGraphTensor *)v38;
}

- (MPSGraphTensor)normalizationBetaGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradientTensor sourceTensor:(MPSGraphTensor *)sourceTensor reductionAxes:(NSArray *)axes name:(NSString *)name
{
  BOOL v10 = incomingGradientTensor;
  BOOL v11 = sourceTensor;
  id v12 = axes;
  id v13 = name;
  id v14 = v10;
  if (v13)
  {
    id v15 = [(NSString *)v13 stringByAppendingFormat:@"/sum"];
  }
  else
  {
    id v15 = @"batchNormGammaGradient/sum";
  }
  id v16 = [(MPSGraph *)self reductionSumWithTensor:v14 axes:v12 name:v15];
  if (v13) {

  }
  return (MPSGraphTensor *)v16;
}

- (MPSGraphTensor)normalizationGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradientTensor sourceTensor:(MPSGraphTensor *)sourceTensor meanTensor:(MPSGraphTensor *)meanTensor varianceTensor:(MPSGraphTensor *)varianceTensor gammaTensor:(MPSGraphTensor *)gamma gammaGradientTensor:(MPSGraphTensor *)gammaGradient betaGradientTensor:(MPSGraphTensor *)betaGradient reductionAxes:(NSArray *)axes epsilon:(float)epsilon name:(NSString *)name
{
  v85[1] = *MEMORY[0x1E4F143B8];
  id v77 = incomingGradientTensor;
  uint64_t v20 = sourceTensor;
  id v74 = meanTensor;
  id v75 = varianceTensor;
  v76 = gamma;
  v80 = gammaGradient;
  id v79 = betaGradient;
  id v83 = axes;
  id v84 = name;
  id v81 = v20;
  uint64_t v73 = [(MPSGraph *)self constantWithScalar:&unk_1EC9F18F8 shape:268435488 dataType:epsilon];
  uint64_t v21 = [(MPSGraphTensor *)v20 dataType];
  if (v84)
  {
    id v22 = [(NSString *)v84 stringByAppendingFormat:@"/cast"];
  }
  else
  {
    id v22 = @"normalizationGradient/cast";
  }
  unint64_t v23 = [(MPSGraph *)self castTensor:v73 toType:v21 name:v22];
  uint64_t v65 = v23;
  if (v84)
  {

    double v24 = [(NSString *)v84 stringByAppendingString:@"/addition"];
  }
  else
  {
    double v24 = @"batchNormGradient/addition";
  }
  uint64_t v25 = [(MPSGraph *)self additionWithPrimaryTensor:v75 secondaryTensor:v23 name:v24];
  uint64_t v66 = (void *)v25;
  if (v84)
  {

    uint64_t v26 = [(NSString *)v84 stringByAppendingString:@"/reciprocal"];
  }
  else
  {
    uint64_t v26 = @"batchNormGradient/reciprocal";
  }
  uint64_t v72 = [(MPSGraph *)self reciprocalWithTensor:v25 name:v26];
  if (v84)
  {

    uint64_t v27 = [(NSString *)v84 stringByAppendingString:@"/reciprocal"];
  }
  else
  {
    uint64_t v27 = @"batchNormGradient/reciprocal2";
  }
  uint64_t v78 = [(MPSGraph *)self reciprocalSquareRootWithTensor:v25 name:v27];
  if (v84) {

  }
  v82 = [(MPSGraph *)self constantWithScalar:&unk_1EC9F1910 shape:536870944 dataType:1.0];
  for (unint64_t i = 0; [(NSArray *)v83 count] > i; ++i)
  {
    id v29 = [(NSArray *)v83 objectAtIndexedSubscript:i];
    v85[0] = v29;
    id v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:1];
    if (v84)
    {
      uint64_t v31 = [(NSString *)v84 stringByAppendingFormat:@"/dimSize%d/", i, v65, v66];
      unint64_t v23 = (void *)v31;
    }
    else
    {
      uint64_t v31 = objc_msgSend(@"batchNormGradient/dimSize", "stringByAppendingFormat:", @"%d/", i);
      uint64_t v20 = (MPSGraphTensor *)v31;
    }
    id v32 = [(MPSGraph *)self dimensionSizeOfTensor:v81 axes:v30 name:v31];
    if (v84)
    {

      uint64_t v33 = [(NSString *)v84 stringByAppendingFormat:@"/mul%d/", i];
      uint64_t v27 = (__CFString *)v33;
    }
    else
    {

      uint64_t v33 = objc_msgSend(@"batchNormGradient/mul", "stringByAppendingFormat:", @"%d/", i);
      id v12 = (__CFString *)v33;
    }
    uint64_t v34 = [(MPSGraph *)self multiplicationWithPrimaryTensor:v82 secondaryTensor:v32 name:v33];

    if (v84) {
      id v35 = v27;
    }
    else {
      id v35 = v12;
    }

    v82 = (void *)v34;
  }
  id v36 = v82;
  uint64_t v37 = [(MPSGraphTensor *)v81 dataType];
  if (v84)
  {
    uint64_t v38 = [(NSString *)v84 stringByAppendingFormat:@"/cast"];
  }
  else
  {
    uint64_t v38 = @"batchNormGradient/cast";
  }
  uint64_t v71 = [(MPSGraph *)self castTensor:v36 toType:v37 name:v38];
  if (v84)
  {

    uint64_t v39 = [(NSString *)v84 stringByAppendingString:@"/reciprocal"];
  }
  else
  {
    uint64_t v39 = @"batchNormGradient/reciprocal";
  }
  uint64_t v40 = [(MPSGraph *)self reciprocalWithTensor:v71 name:v39];
  if (v84)
  {

    if (v80)
    {
LABEL_40:
      if (v79)
      {
LABEL_46:
        uint64_t v44 = [(NSString *)v84 stringByAppendingString:@"/multiplication1"];
        goto LABEL_48;
      }
      uint64_t v43 = [(NSString *)v84 stringByAppendingString:@"/betaGradient"];
      goto LABEL_44;
    }
    uint64_t v42 = [(NSString *)v84 stringByAppendingString:@"/gammaGradient"];
  }
  else
  {
    if (v80) {
      goto LABEL_42;
    }
    uint64_t v42 = @"batchNormGradient/gammaGradient";
  }
  *(float *)&double v41 = epsilon;
  v80 = [(MPSGraph *)self normalizationGammaGradientWithIncomingGradientTensor:v77 sourceTensor:v81 meanTensor:v74 varianceTensor:v75 reductionAxes:v83 epsilon:v42 name:v41];
  if (v84)
  {

    goto LABEL_40;
  }
LABEL_42:
  if (v79) {
    goto LABEL_47;
  }
  uint64_t v43 = @"batchNormGradient/betaGradient";
LABEL_44:
  id v79 = [(MPSGraph *)self normalizationBetaGradientWithIncomingGradientTensor:v77 sourceTensor:v81 reductionAxes:v83 name:v43];
  if (v84)
  {

    goto LABEL_46;
  }
LABEL_47:
  uint64_t v44 = @"batchNormGradient/multiplication1";
LABEL_48:
  uint64_t v67 = [(MPSGraph *)self multiplicationWithPrimaryTensor:v77 secondaryTensor:v78 name:v44];
  if (v84)
  {

    uint64_t v45 = [(NSString *)v84 stringByAppendingString:@"/subtraction"];
  }
  else
  {
    uint64_t v45 = @"batchNormGradient/subtraction";
  }
  id v70 = [(MPSGraph *)self subtractionWithPrimaryTensor:v81 secondaryTensor:v74 name:v45];
  if (v84)
  {

    uint64_t v46 = [(NSString *)v84 stringByAppendingString:@"/multiplication2"];
  }
  else
  {
    uint64_t v46 = @"batchNormGradient/multiplication2";
  }
  uint64_t v69 = [(MPSGraph *)self multiplicationWithPrimaryTensor:v40 secondaryTensor:v70 name:v46];
  if (v84)
  {

    uint64_t v47 = [(NSString *)v84 stringByAppendingString:@"/multiplication2"];
  }
  else
  {
    uint64_t v47 = @"batchNormGradient/multiplication2";
  }
  uint64_t v68 = [(MPSGraph *)self multiplicationWithPrimaryTensor:v80 secondaryTensor:v72 name:v47];
  if (v84)
  {

    unint64_t v48 = [(NSString *)v84 stringByAppendingString:@"/multiplication3"];
  }
  else
  {
    unint64_t v48 = @"batchNormGradient/multiplication3";
  }
  unint64_t v49 = [(MPSGraph *)self multiplicationWithPrimaryTensor:v69 secondaryTensor:v68 name:v48];
  if (v84)
  {

    unint64_t v50 = [(NSString *)v84 stringByAppendingString:@"/multiplication4"];
  }
  else
  {
    unint64_t v50 = @"batchNormGradient/multiplication4";
  }
  id v51 = [(MPSGraph *)self multiplicationWithPrimaryTensor:v40 secondaryTensor:v79 name:v50];
  if (v84)
  {

    v52 = [(NSString *)v84 stringByAppendingString:@"/multiplication5"];
  }
  else
  {
    v52 = @"batchNormGradient/multiplication5";
  }
  unint64_t v53 = [(MPSGraph *)self multiplicationWithPrimaryTensor:v51 secondaryTensor:v78 name:v52];
  if (v84)
  {

    uint64_t v54 = [(NSString *)v84 stringByAppendingString:@"/subtraction1"];
  }
  else
  {
    uint64_t v54 = @"batchNormGradient/subtraction1";
  }
  uint64_t v55 = [(MPSGraph *)self subtractionWithPrimaryTensor:v67 secondaryTensor:v49 name:v54];
  if (v84)
  {

    uint64_t v56 = [(NSString *)v84 stringByAppendingString:@"/subtraction2"];
  }
  else
  {
    uint64_t v56 = @"batchNormGradient/subtraction2";
  }
  uint64_t v57 = [(MPSGraph *)self subtractionWithPrimaryTensor:v55 secondaryTensor:v53 name:v56];
  uint64_t v58 = v57;
  if (!v84)
  {
    uint64_t v59 = v57;
    unint64_t v60 = v76;
    if (v76)
    {
      int v61 = @"batchNormGradient/multiplication";
      goto LABEL_77;
    }
LABEL_80:
    int v63 = v59;
    goto LABEL_81;
  }

  uint64_t v59 = v58;
  unint64_t v60 = v76;
  if (!v76) {
    goto LABEL_80;
  }
  int v61 = [(NSString *)v84 stringByAppendingString:@"/multiplication"];
LABEL_77:
  uint64_t v62 = [(MPSGraph *)self multiplicationWithPrimaryTensor:v58 secondaryTensor:v76 name:v61];
  if (v84) {

  }
  int v63 = v62;
  unint64_t v60 = v63;
LABEL_81:

  return v63;
}

- (NSArray)topKWithSourceTensor:(MPSGraphTensor *)source axisTensor:(MPSGraphTensor *)axisTensor kTensor:(MPSGraphTensor *)kTensor name:(NSString *)name
{
  void v21[3] = *MEMORY[0x1E4F143B8];
  BOOL v10 = source;
  BOOL v11 = axisTensor;
  id v12 = kTensor;
  id v13 = name;
  id v14 = [(MPSGraph *)self fixCastIntTensor:v12 toSignedness:1 name:v13];

  id v15 = [(MPSGraph *)self fixCastIntTensor:v11 toSignedness:1 name:v13];

  id v16 = [MPSGraphTopKOp alloc];
  v21[0] = v10;
  v21[1] = v15;
  void v21[2] = v14;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
  id v18 = [(MPSGraphTopKOp *)v16 initWithGraph:self inputTensors:v17 controlDependencies:MEMORY[0x1E4F1CBF0] smallest:0 name:v13];

  id v19 = [(MPSGraphOperation *)v18 outputTensors];

  return (NSArray *)v19;
}

- (NSArray)bottomKWithSourceTensor:(MPSGraphTensor *)source axisTensor:(MPSGraphTensor *)axisTensor kTensor:(MPSGraphTensor *)kTensor name:(NSString *)name
{
  void v21[3] = *MEMORY[0x1E4F143B8];
  BOOL v10 = source;
  BOOL v11 = axisTensor;
  id v12 = kTensor;
  id v13 = name;
  id v14 = [(MPSGraph *)self fixCastIntTensor:v12 toSignedness:1 name:v13];

  id v15 = [(MPSGraph *)self fixCastIntTensor:v11 toSignedness:1 name:v13];

  id v16 = [MPSGraphTopKOp alloc];
  v21[0] = v10;
  v21[1] = v15;
  void v21[2] = v14;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
  id v18 = [(MPSGraphTopKOp *)v16 initWithGraph:self inputTensors:v17 controlDependencies:MEMORY[0x1E4F1CBF0] smallest:1 name:v13];

  id v19 = [(MPSGraphOperation *)v18 outputTensors];

  return (NSArray *)v19;
}

- (NSArray)topKWithSourceTensor:(MPSGraphTensor *)source kTensor:(MPSGraphTensor *)kTensor name:(NSString *)name
{
  int v8 = source;
  uint64_t v9 = kTensor;
  BOOL v10 = name;
  BOOL v11 = [(MPSGraph *)self constantWithScalar:536870944 dataType:-1.0];
  id v12 = [(MPSGraph *)self topKWithSourceTensor:v8 axisTensor:v11 kTensor:v9 name:v10];

  return (NSArray *)v12;
}

- (NSArray)topKWithSourceTensor:(MPSGraphTensor *)source axis:(NSInteger)axis k:(NSUInteger)k name:(NSString *)name
{
  BOOL v10 = source;
  BOOL v11 = name;
  id v12 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)axis];
  id v13 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)k];
  id v14 = [(MPSGraph *)self topKWithSourceTensor:v10 axisTensor:v12 kTensor:v13 name:v11];

  return (NSArray *)v14;
}

- (NSArray)bottomKWithSourceTensor:(MPSGraphTensor *)source axis:(NSInteger)axis k:(NSUInteger)k name:(NSString *)name
{
  BOOL v10 = source;
  BOOL v11 = name;
  id v12 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)axis];
  id v13 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)k];
  id v14 = [(MPSGraph *)self bottomKWithSourceTensor:v10 axisTensor:v12 kTensor:v13 name:v11];

  return (NSArray *)v14;
}

- (NSArray)topKWithSourceTensor:(MPSGraphTensor *)source k:(NSUInteger)k name:(NSString *)name
{
  int v8 = source;
  uint64_t v9 = name;
  BOOL v10 = [(MPSGraph *)self constantWithScalar:536870944 dataType:-1.0];
  BOOL v11 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)k];
  id v12 = [(MPSGraph *)self topKWithSourceTensor:v8 axisTensor:v10 kTensor:v11 name:v9];

  return (NSArray *)v12;
}

- (MPSGraphTensor)topKWithGradientTensor:(MPSGraphTensor *)gradient source:(MPSGraphTensor *)source k:(NSUInteger)k name:(NSString *)name
{
  BOOL v10 = gradient;
  BOOL v11 = source;
  id v12 = name;
  id v13 = [(MPSGraph *)self constantWithScalar:32 dataType:(double)k];
  id v14 = [(MPSGraph *)self topKWithGradientTensor:v10 source:v11 kTensor:v13 name:v12];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)topKWithGradientTensor:(MPSGraphTensor *)gradient source:(MPSGraphTensor *)source axis:(NSInteger)axis k:(NSUInteger)k name:(NSString *)name
{
  id v12 = gradient;
  id v13 = source;
  id v14 = name;
  id v15 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)axis];
  id v16 = [(MPSGraph *)self constantWithScalar:32 dataType:(double)k];
  id v17 = [(MPSGraph *)self topKWithGradientTensor:v12 source:v13 axisTensor:v15 kTensor:v16 name:v14];

  return (MPSGraphTensor *)v17;
}

- (MPSGraphTensor)bottomKWithGradientTensor:(MPSGraphTensor *)gradient source:(MPSGraphTensor *)source axis:(NSInteger)axis k:(NSUInteger)k name:(NSString *)name
{
  id v12 = gradient;
  id v13 = source;
  id v14 = name;
  id v15 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)axis];
  id v16 = [(MPSGraph *)self constantWithScalar:32 dataType:(double)k];
  id v17 = [(MPSGraph *)self bottomKWithGradientTensor:v12 source:v13 axisTensor:v15 kTensor:v16 name:v14];

  return (MPSGraphTensor *)v17;
}

- (MPSGraphTensor)topKWithGradientTensor:(MPSGraphTensor *)gradient source:(MPSGraphTensor *)source kTensor:(MPSGraphTensor *)kTensor name:(NSString *)name
{
  BOOL v10 = gradient;
  BOOL v11 = source;
  id v12 = kTensor;
  id v13 = name;
  id v14 = [(MPSGraph *)self constantWithScalar:536870944 dataType:-1.0];
  id v15 = [(MPSGraph *)self topKWithGradientTensor:v10 source:v11 axisTensor:v14 kTensor:v12 name:v13];

  return (MPSGraphTensor *)v15;
}

- (MPSGraphTensor)topKWithGradientTensor:(MPSGraphTensor *)gradient source:(MPSGraphTensor *)source axisTensor:(MPSGraphTensor *)axisTensor kTensor:(MPSGraphTensor *)kTensor name:(NSString *)name
{
  v24[4] = *MEMORY[0x1E4F143B8];
  id v12 = gradient;
  id v13 = source;
  id v14 = axisTensor;
  id v15 = kTensor;
  id v16 = name;
  id v17 = [(MPSGraph *)self fixCastIntTensor:v15 toSignedness:1 name:v16];

  id v18 = [MPSGraphTopKGradientOp alloc];
  v24[0] = v13;
  v24[1] = v12;
  v24[2] = v14;
  v24[3] = v17;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
  uint64_t v20 = [(MPSGraphTopKGradientOp *)v18 initWithGraph:self inputTensors:v19 controlDependencies:MEMORY[0x1E4F1CBF0] smallest:0 name:v16];

  uint64_t v21 = [(MPSGraphOperation *)v20 outputTensors];
  id v22 = [v21 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v22;
}

- (MPSGraphTensor)bottomKWithGradientTensor:(MPSGraphTensor *)gradient source:(MPSGraphTensor *)source axisTensor:(MPSGraphTensor *)axisTensor kTensor:(MPSGraphTensor *)kTensor name:(NSString *)name
{
  v24[4] = *MEMORY[0x1E4F143B8];
  id v12 = gradient;
  id v13 = source;
  id v14 = axisTensor;
  id v15 = kTensor;
  id v16 = name;
  id v17 = [(MPSGraph *)self fixCastIntTensor:v15 toSignedness:1 name:v16];

  id v18 = [MPSGraphTopKGradientOp alloc];
  v24[0] = v13;
  v24[1] = v12;
  v24[2] = v14;
  v24[3] = v17;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
  uint64_t v20 = [(MPSGraphTopKGradientOp *)v18 initWithGraph:self inputTensors:v19 controlDependencies:MEMORY[0x1E4F1CBF0] smallest:1 name:v16];

  uint64_t v21 = [(MPSGraphOperation *)v20 outputTensors];
  id v22 = [v21 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v22;
}

- (id)costVolumeWithRefTensor:(id)a3 inputTensor:(id)a4 coordinatesTensor:(id)a5 windowSizes:(id)a6 layout:(unint64_t)a7 normalizeCoordinates:(BOOL)a8 relativeCoordinates:(BOOL)a9 coordinateIs1DInWidth:(BOOL)a10 similarityType:(unint64_t)a11 name:(id)a12
{
  BOOL v33 = a8;
  v35[3] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v34 = a12;
  id v30 = v16;
  id v19 = [MPSGraphCostVolumeOp alloc];
  v35[0] = v15;
  v35[1] = v16;
  void v35[2] = v17;
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];
  uint64_t v21 = [v18 objectAtIndexedSubscript:0];
  uint64_t v22 = [v21 integerValue];
  unint64_t v23 = [v18 objectAtIndexedSubscript:1];
  uint64_t v24 = [v23 integerValue];
  BYTE1(v29) = a10;
  LOBYTE(v29) = 1;
  uint64_t v25 = -[MPSGraphCostVolumeOp initWithGraph:inputTensors:controlDependencies:layout:normalizeCoordinates:relativeCoordinates:alignCorners:coordinateIs1DInWidth:paddingMode:samplingMode:nearestRoundingMode:similarityType:windowWidth:windowHeight:name:](v19, "initWithGraph:inputTensors:controlDependencies:layout:normalizeCoordinates:relativeCoordinates:alignCorners:coordinateIs1DInWidth:paddingMode:samplingMode:nearestRoundingMode:similarityType:windowWidth:windowHeight:name:", self, v20, MEMORY[0x1E4F1CBF0], a7, v33, a9, v29, 0, 1, 4, a11, v22, v24, v34);

  uint64_t v26 = [(MPSGraphOperation *)v25 outputTensors];
  uint64_t v27 = [v26 objectAtIndexedSubscript:0];

  return v27;
}

- (MPSGraphTensor)nonMaximumSuppressionWithBoxesTensor:(MPSGraphTensor *)boxesTensor scoresTensor:(MPSGraphTensor *)scoresTensor IOUThreshold:(float)IOUThreshold scoreThreshold:(float)scoreThreshold perClassSuppression:(BOOL)perClassSuppression coordinateMode:(MPSGraphNonMaximumSuppressionCoordinateMode)coordinateMode name:(NSString *)name
{
  BOOL v11 = perClassSuppression;
  v29[4] = *MEMORY[0x1E4F143B8];
  id v16 = boxesTensor;
  id v17 = scoresTensor;
  id v18 = name;
  id v19 = [(MPSGraph *)self constantWithScalar:268435488 dataType:IOUThreshold];
  uint64_t v20 = [(MPSGraph *)self constantWithScalar:268435488 dataType:scoreThreshold];
  uint64_t v21 = [MPSGraphNonMaximumSuppressionOp alloc];
  v29[0] = v16;
  v29[1] = v17;
  v29[2] = v19;
  void v29[3] = v20;
  uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
  *(float *)&double v23 = IOUThreshold;
  *(float *)&double v24 = scoreThreshold;
  uint64_t v25 = [(MPSGraphNonMaximumSuppressionOp *)v21 initWithGraph:self inputTensors:v22 controlDependencies:MEMORY[0x1E4F1CBF0] iouThreshold:v11 scoreThreshold:coordinateMode perClassSuppression:v18 coordinateMode:v23 name:v24];

  uint64_t v26 = [(MPSGraphOperation *)v25 outputTensors];
  uint64_t v27 = [v26 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v27;
}

- (MPSGraphTensor)nonMaximumSuppressionWithBoxesTensor:(MPSGraphTensor *)boxesTensor scoresTensor:(MPSGraphTensor *)scoresTensor classIndicesTensor:(MPSGraphTensor *)classIndicesTensor IOUThreshold:(float)IOUThreshold scoreThreshold:(float)scoreThreshold perClassSuppression:(BOOL)perClassSuppression coordinateMode:(MPSGraphNonMaximumSuppressionCoordinateMode)coordinateMode name:(NSString *)name
{
  BOOL v12 = perClassSuppression;
  v32[5] = *MEMORY[0x1E4F143B8];
  uint64_t v31 = boxesTensor;
  id v18 = scoresTensor;
  id v19 = classIndicesTensor;
  uint64_t v20 = name;
  uint64_t v21 = [(MPSGraph *)self constantWithScalar:268435488 dataType:IOUThreshold];
  uint64_t v22 = [(MPSGraph *)self constantWithScalar:268435488 dataType:scoreThreshold];
  double v23 = [MPSGraphNonMaximumSuppressionOp alloc];
  v32[0] = v31;
  v32[1] = v18;
  v32[2] = v19;
  v32[3] = v21;
  v32[4] = v22;
  double v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:5];
  *(float *)&double v25 = IOUThreshold;
  *(float *)&double v26 = scoreThreshold;
  uint64_t v27 = [(MPSGraphNonMaximumSuppressionOp *)v23 initWithGraph:self inputTensors:v24 controlDependencies:MEMORY[0x1E4F1CBF0] iouThreshold:v12 scoreThreshold:coordinateMode perClassSuppression:v20 coordinateMode:v25 name:v26];

  uint64_t v28 = [(MPSGraphOperation *)v27 outputTensors];
  uint64_t v29 = [v28 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v29;
}

- (MPSGraphTensor)sparseTensorWithType:(MPSGraphSparseStorageType)sparseStorageType tensors:(NSArray *)inputTensorArray shape:(MPSShape *)shape dataType:(MPSDataType)dataType name:(NSString *)name
{
  uint64_t v8 = *(void *)&dataType;
  BOOL v12 = inputTensorArray;
  id v13 = shape;
  id v14 = name;
  id v15 = [[MPSGraphSparseTensorOp alloc] initWithGraph:self sparseStorageType:sparseStorageType inputTensors:v12 shape:v13 dataType:v8 name:v14];
  id v16 = [(MPSGraphOperation *)v15 outputTensors];
  id v17 = [v16 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v17;
}

- (MPSGraphTensor)sparseTensorWithDescriptor:(MPSGraphCreateSparseOpDescriptor *)sparseDescriptor tensors:(NSArray *)inputTensorArray shape:(MPSShape *)shape name:(NSString *)name
{
  BOOL v10 = sparseDescriptor;
  BOOL v11 = inputTensorArray;
  BOOL v12 = shape;
  id v13 = name;
  id v14 = [[MPSGraphSparseTensorOp alloc] initWithGraph:self sparseStorageType:[(MPSGraphCreateSparseOpDescriptor *)v10 sparseStorageType] inputTensors:v11 shape:v12 dataType:[(MPSGraphCreateSparseOpDescriptor *)v10 dataType] name:v13];
  id v15 = [(MPSGraphOperation *)v14 outputTensors];
  id v16 = [v15 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v16;
}

- (MPSGraphTensor)placeholderWithShape:(MPSShape *)shape dataType:(MPSDataType)dataType name:(NSString *)name
{
  uint64_t v6 = *(void *)&dataType;
  uint64_t v8 = shape;
  uint64_t v9 = name;
  BOOL v10 = [[MPSGraphPlaceholderOp alloc] initWithGraph:self shape:v8 dataType:v6 name:v9];
  placeholderMap = self->_placeholderMap;
  BOOL v12 = [(MPSGraphOperation *)v10 outputTensors];
  id v13 = [v12 objectAtIndexedSubscript:0];
  id v14 = [(MPSGraphOperation *)v10 name];
  [(NSMutableDictionary *)placeholderMap setObject:v13 forKey:v14];

  placeholderArray = self->_placeholderArray;
  id v16 = [(MPSGraphOperation *)v10 outputTensors];
  id v17 = [v16 objectAtIndexedSubscript:0];
  [(NSMutableArray *)placeholderArray addObject:v17];

  id v18 = [(MPSGraphOperation *)v10 outputTensors];
  id v19 = [v18 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v19;
}

- (MPSGraphTensor)placeholderWithShape:(MPSShape *)shape name:(NSString *)name
{
  id v4 = [(MPSGraph *)self placeholderWithShape:shape dataType:268435488 name:name];

  return (MPSGraphTensor *)v4;
}

- (MPSGraphTensor)constantWithData:(NSData *)data shape:(MPSShape *)shape dataType:(MPSDataType)dataType
{
  uint64_t v5 = *(void *)&dataType;
  uint64_t v8 = data;
  uint64_t v9 = shape;
  [(MPSShape *)v9 count];
  if (![(MPSShape *)v9 count] && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  for (unint64_t i = 0; i < [(MPSShape *)v9 count]; ++i)
  {
    BOOL v11 = [(MPSShape *)v9 objectAtIndexedSubscript:i];
    [v11 integerValue];

    BOOL v12 = [(MPSShape *)v9 objectAtIndexedSubscript:i];
    uint64_t v13 = [v12 integerValue];

    if (v13 < 0)
    {
      if (MTLReportFailureTypeEnabled())
      {
        id v14 = [(MPSShape *)v9 objectAtIndexedSubscript:i];
        unint64_t v19 = i;
        uint64_t v20 = [v14 integerValue];
        MTLReportFailure();
      }
    }
  }
  id v15 = [[MPSGraphConstantOp alloc] initWithGraph:self data:v8 shape:v9 dataType:v5 isSplat:0 name:0];
  id v16 = [(MPSGraphOperation *)v15 outputTensors];
  id v17 = [v16 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v17;
}

- (MPSGraphTensor)constantWithScalar:(double)scalar dataType:(MPSDataType)dataType
{
  return [(MPSGraph *)self constantWithScalar:MEMORY[0x1E4F1CBF0] shape:*(void *)&dataType dataType:scalar];
}

- (MPSGraphTensor)constantWithScalar:(double)scalar shape:(MPSShape *)shape dataType:(MPSDataType)dataType
{
  uint64_t v5 = *(void *)&dataType;
  uint64_t v8 = shape;
  if ([(MPSShape *)v8 count] == 1)
  {
    uint64_t v9 = [(MPSShape *)v8 objectAtIndexedSubscript:0];
    uint64_t v10 = [v9 integerValue];

    if (v10 == -1)
    {

      uint64_t v8 = (MPSShape *)MEMORY[0x1E4F1CBF0];
    }
  }
  for (unint64_t i = 0; i < [(MPSShape *)v8 count]; ++i)
  {
    BOOL v12 = [(MPSShape *)v8 objectAtIndexedSubscript:i];
    [v12 integerValue];

    uint64_t v13 = [(MPSShape *)v8 objectAtIndexedSubscript:i];
    uint64_t v14 = [v13 integerValue];

    if (v14 <= 0)
    {
      if (MTLReportFailureTypeEnabled())
      {
        id v15 = [(MPSShape *)v8 objectAtIndexedSubscript:i];
        unint64_t v21 = i;
        uint64_t v22 = [v15 integerValue];
        MTLReportFailure();
      }
    }
  }
  id v16 = getConstantDataForScalar(v5, scalar);
  id v17 = [[MPSGraphConstantOp alloc] initWithGraph:self data:v16 shape:v8 dataType:v5 isSplat:1 name:0];
  id v18 = [(MPSGraphOperation *)v17 outputTensors];
  unint64_t v19 = [v18 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v19;
}

- (MPSGraphTensor)constantWithRealPart:(double)realPart imaginaryPart:(double)imaginaryPart
{
  return [(MPSGraph *)self constantWithRealPart:285212736 imaginaryPart:realPart dataType:imaginaryPart];
}

- (MPSGraphTensor)constantWithRealPart:(double)realPart imaginaryPart:(double)imaginaryPart dataType:(MPSDataType)dataType
{
  return [(MPSGraph *)self constantWithRealPart:MEMORY[0x1E4F1CBF0] imaginaryPart:*(void *)&dataType shape:realPart dataType:imaginaryPart];
}

- (MPSGraphTensor)constantWithRealPart:(double)realPart imaginaryPart:(double)imaginaryPart shape:(MPSShape *)shape dataType:(MPSDataType)dataType
{
  uint64_t v6 = *(void *)&dataType;
  uint64_t v10 = shape;
  if ([(MPSShape *)v10 count] == 1)
  {
    BOOL v11 = [(MPSShape *)v10 objectAtIndexedSubscript:0];
    uint64_t v12 = [v11 integerValue];

    if (v12 == -1)
    {

      uint64_t v10 = (MPSShape *)MEMORY[0x1E4F1CBF0];
    }
  }
  for (unint64_t i = 0; i < [(MPSShape *)v10 count]; ++i)
  {
    uint64_t v14 = [(MPSShape *)v10 objectAtIndexedSubscript:i];
    [v14 integerValue];

    id v15 = [(MPSShape *)v10 objectAtIndexedSubscript:i];
    uint64_t v16 = [v15 integerValue];

    if (v16 <= 0)
    {
      if (MTLReportFailureTypeEnabled())
      {
        id v17 = [(MPSShape *)v10 objectAtIndexedSubscript:i];
        unint64_t v23 = i;
        uint64_t v24 = [v17 integerValue];
        MTLReportFailure();
      }
    }
  }
  id v18 = getConstantDataForComplexScalar(v6, realPart, imaginaryPart);
  unint64_t v19 = [[MPSGraphConstantOp alloc] initWithGraph:self data:v18 shape:v10 dataType:v6 isSplat:1 name:0];
  uint64_t v20 = [(MPSGraphOperation *)v19 outputTensors];
  unint64_t v21 = [v20 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v21;
}

- (MPSGraphTensor)variableWithData:(NSData *)data shape:(MPSShape *)shape dataType:(MPSDataType)dataType name:(NSString *)name
{
  uint64_t v7 = *(void *)&dataType;
  uint64_t v10 = data;
  BOOL v11 = shape;
  uint64_t v12 = name;
  uint64_t v13 = [[MPSGraphVariableOp alloc] initWithGraph:self shape:v11 dataType:v7 name:v12];
  uint64_t v14 = [(MPSGraphOperation *)v13 outputTensors];
  id v15 = [v14 objectAtIndexedSubscript:0];
  uint64_t v16 = [v15 value];

  id v17 = [[MPSGraphVariable alloc] initVariableWithData:v10 value:v16];
  variable = v13->_variable;
  v13->_variable = v17;

  variableOpsMap = self->_variableOpsMap;
  uint64_t v20 = [(MPSGraphOperation *)v13 name];
  [(NSMutableDictionary *)variableOpsMap setObject:v13 forKey:v20];

  [(NSMutableArray *)self->_variableOps addObject:v13];
  unint64_t v21 = [(MPSGraphOperation *)v13 outputTensors];
  uint64_t v22 = [v21 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v22;
}

- (id)variableFromTensorWithTensor:(id)a3 name:(id)a4
{
  id v4 = [(MPSGraph *)self varFromTensorWithTensor:a3 name:0];

  return v4;
}

- (MPSGraphTensor)readVariable:(MPSGraphTensor *)variable name:(NSString *)name
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = variable;
  uint64_t v6 = [MPSGraphReadVariableOp alloc];
  v12[0] = v5;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  uint64_t v8 = [(MPSGraphOperation *)v6 initWithGraph:self inputTensors:v7 controlDependencies:MEMORY[0x1E4F1CBF0] name:0];

  uint64_t v9 = [(MPSGraphOperation *)v8 outputTensors];
  uint64_t v10 = [v9 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v10;
}

- (MPSGraphOperation)assignVariable:(MPSGraphTensor *)variable withValueOfTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v15[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = variable;
  uint64_t v9 = tensor;
  uint64_t v10 = name;
  BOOL v11 = [MPSGraphAssignVariableOp alloc];
  v15[0] = v8;
  v15[1] = v9;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  uint64_t v13 = [(MPSGraphOperation *)v11 initWithGraph:self inputTensors:v12 controlDependencies:MEMORY[0x1E4F1CBF0] name:v10];

  return (MPSGraphOperation *)v13;
}

- (id)createTexture:(id)a3 withPixelFormat:(unint64_t)a4 isCompressed:(BOOL)a5 name:(id)a6
{
  BOOL v7 = a5;
  v18[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = [MPSGraphCreateTextureTensorOp alloc];
  v18[0] = v10;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  uint64_t v14 = [(MPSGraphCreateTextureTensorOp *)v12 initWithGraph:self inputTensors:v13 controlDependencies:MEMORY[0x1E4F1CBF0] pixelFormat:a4 isCompressed:v7 name:v11];

  id v15 = [(MPSGraphOperation *)v14 outputTensors];
  uint64_t v16 = [v15 objectAtIndexedSubscript:0];

  return v16;
}

- (MPSGraphTensor)sortWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis descending:(BOOL)descending name:(NSString *)name
{
  BOOL v7 = descending;
  void v19[2] = *MEMORY[0x1E4F143B8];
  id v10 = tensor;
  id v11 = name;
  uint64_t v12 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)axis];
  uint64_t v13 = [MPSGraphSortOp alloc];
  v19[0] = v10;
  v19[1] = v12;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  id v15 = [(MPSGraphSortOp *)v13 initWithGraph:self inputTensors:v14 controlDependencies:MEMORY[0x1E4F1CBF0] descending:v7 name:v11];

  uint64_t v16 = [(MPSGraphOperation *)v15 outputTensors];
  id v17 = [v16 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v17;
}

- (MPSGraphTensor)sortWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor descending:(BOOL)descending name:(NSString *)name
{
  BOOL v7 = descending;
  void v19[2] = *MEMORY[0x1E4F143B8];
  id v10 = tensor;
  id v11 = axisTensor;
  uint64_t v12 = name;
  uint64_t v13 = [MPSGraphSortOp alloc];
  v19[0] = v10;
  v19[1] = v11;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  id v15 = [(MPSGraphSortOp *)v13 initWithGraph:self inputTensors:v14 controlDependencies:MEMORY[0x1E4F1CBF0] descending:v7 name:v12];

  uint64_t v16 = [(MPSGraphOperation *)v15 outputTensors];
  id v17 = [v16 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v17;
}

- (MPSGraphTensor)sortWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  uint64_t v5 = [(MPSGraph *)self sortWithTensor:tensor axis:axis descending:0 name:name];

  return (MPSGraphTensor *)v5;
}

- (MPSGraphTensor)sortWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor name:(NSString *)name
{
  uint64_t v5 = [(MPSGraph *)self sortWithTensor:tensor axisTensor:axisTensor descending:0 name:name];

  return (MPSGraphTensor *)v5;
}

- (MPSGraphTensor)argSortWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis descending:(BOOL)descending name:(NSString *)name
{
  BOOL v7 = descending;
  void v19[2] = *MEMORY[0x1E4F143B8];
  id v10 = tensor;
  id v11 = name;
  uint64_t v12 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)axis];
  uint64_t v13 = [MPSGraphArgSortOp alloc];
  v19[0] = v10;
  v19[1] = v12;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  id v15 = [(MPSGraphArgSortOp *)v13 initWithGraph:self inputTensors:v14 controlDependencies:MEMORY[0x1E4F1CBF0] descending:v7 name:v11];

  uint64_t v16 = [(MPSGraphOperation *)v15 outputTensors];
  id v17 = [v16 objectAtIndexedSubscript:1];

  return (MPSGraphTensor *)v17;
}

- (MPSGraphTensor)argSortWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor descending:(BOOL)descending name:(NSString *)name
{
  BOOL v7 = descending;
  void v19[2] = *MEMORY[0x1E4F143B8];
  id v10 = tensor;
  id v11 = axisTensor;
  uint64_t v12 = name;
  uint64_t v13 = [MPSGraphArgSortOp alloc];
  v19[0] = v10;
  v19[1] = v11;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  id v15 = [(MPSGraphArgSortOp *)v13 initWithGraph:self inputTensors:v14 controlDependencies:MEMORY[0x1E4F1CBF0] descending:v7 name:v12];

  uint64_t v16 = [(MPSGraphOperation *)v15 outputTensors];
  id v17 = [v16 objectAtIndexedSubscript:1];

  return (MPSGraphTensor *)v17;
}

- (MPSGraphTensor)argSortWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  uint64_t v5 = [(MPSGraph *)self argSortWithTensor:tensor axis:axis descending:0 name:name];

  return (MPSGraphTensor *)v5;
}

- (MPSGraphTensor)argSortWithTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor name:(NSString *)name
{
  uint64_t v5 = [(MPSGraph *)self argSortWithTensor:tensor axisTensor:axisTensor descending:0 name:name];

  return (MPSGraphTensor *)v5;
}

- (id)biasAddWithTensor:(id)a3 biases:(id)a4 dataLayout:(unint64_t)a5 name:(id)a6
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [MPSGraphBiasAddOp alloc];
  v19[0] = v10;
  v19[1] = v11;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  id v15 = [(MPSGraphBiasAddOp *)v13 initWithGraph:self inputTensors:v14 controlDependencies:MEMORY[0x1E4F1CBF0] dataLayout:a5 name:v12];

  uint64_t v16 = [(MPSGraphOperation *)v15 outputTensors];
  id v17 = [v16 objectAtIndexedSubscript:0];

  return v17;
}

- (MPSGraphTensor)reLUWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = tensor;
  BOOL v7 = name;
  uint64_t v8 = [MPSGraphReLUOp alloc];
  v14[0] = v6;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v10 = [(MPSGraphOperation *)v8 initWithGraph:self inputTensors:v9 controlDependencies:MEMORY[0x1E4F1CBF0] name:v7];

  id v11 = [(MPSGraphOperation *)v10 outputTensors];
  id v12 = [v11 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)reLUGradientWithIncomingGradient:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source name:(NSString *)name
{
  uint64_t v8 = gradient;
  uint64_t v9 = source;
  id v10 = name;
  id v11 = [(MPSGraph *)self constantWithScalar:&unk_1EC9F1958 shape:[(MPSGraphTensor *)v9 dataType] dataType:0.0];
  if (v10)
  {
    id v12 = [(NSString *)v10 stringByAppendingString:@"/lessThanOrEqualTo"];
  }
  else
  {
    id v12 = @"reLUGrad/lessThanOrEqualTo";
  }
  uint64_t v13 = [(MPSGraph *)self greaterThanWithPrimaryTensor:v9 secondaryTensor:v11 name:v12];
  if (v10)
  {

    uint64_t v14 = [(NSString *)v10 stringByAppendingString:@"/select"];
  }
  else
  {
    uint64_t v14 = @"reLUGrad/multiplication";
  }
  id v15 = [(MPSGraph *)self multiplicationWithPrimaryTensor:v8 secondaryTensor:v13 name:v14];
  if (v10) {

  }
  return (MPSGraphTensor *)v15;
}

- (MPSGraphTensor)leakyReLUWithTensor:(MPSGraphTensor *)tensor alpha:(double)alpha name:(NSString *)name
{
  uint64_t v8 = tensor;
  uint64_t v9 = @"leakyReLU";
  if (name) {
    uint64_t v9 = (__CFString *)name;
  }
  id v10 = v9;
  id v11 = [(MPSGraph *)self constantWithScalar:&unk_1EC9F1970 shape:[(MPSGraphTensor *)v8 dataType] dataType:alpha];
  id v12 = [(MPSGraph *)self leakyReLUWithTensor:v8 alphaTensor:v11 name:v10];

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)leakyReLUWithTensor:(MPSGraphTensor *)tensor alphaTensor:(MPSGraphTensor *)alphaTensor name:(NSString *)name
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = tensor;
  uint64_t v9 = alphaTensor;
  id v10 = name;
  id v11 = [MPSGraphLeakyReLUOp alloc];
  v17[0] = v8;
  v17[1] = v9;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  uint64_t v13 = [(MPSGraphOperation *)v11 initWithGraph:self inputTensors:v12 controlDependencies:MEMORY[0x1E4F1CBF0] name:v10];

  uint64_t v14 = [(MPSGraphOperation *)v13 outputTensors];
  id v15 = [v14 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v15;
}

- (MPSGraphTensor)leakyReLUGradientWithIncomingGradient:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source alphaTensor:(MPSGraphTensor *)alphaTensor name:(NSString *)name
{
  id v10 = gradient;
  id v11 = source;
  id v12 = alphaTensor;
  uint64_t v13 = name;
  uint64_t v14 = [(MPSGraph *)self constantWithScalar:&unk_1EC9F1988 shape:[(MPSGraphTensor *)v10 dataType] dataType:0.0];
  id v15 = [(MPSGraph *)self constantWithScalar:&unk_1EC9F19A0 shape:[(MPSGraphTensor *)v10 dataType] dataType:1.0];
  if (v13)
  {
    uint64_t v16 = [(NSString *)v13 stringByAppendingString:@"/lessThan"];
  }
  else
  {
    uint64_t v16 = @"leakyReLUGrad/lessThan";
  }
  id v17 = [(MPSGraph *)self lessThanWithPrimaryTensor:v11 secondaryTensor:v14 name:v16];
  if (v13)
  {

    id v18 = [(NSString *)v13 stringByAppendingString:@"/select"];
  }
  else
  {
    id v18 = @"leakyReLUGrad/select";
  }
  unint64_t v19 = [(MPSGraph *)self selectWithPredicateTensor:v17 truePredicateTensor:v12 falsePredicateTensor:v15 name:v18];
  if (v13)
  {

    uint64_t v20 = [(NSString *)v13 stringByAppendingString:@"/multiplication_2"];
  }
  else
  {
    uint64_t v20 = @"leakyReLUGrad/multiplication_2";
  }
  unint64_t v21 = [(MPSGraph *)self multiplicationWithPrimaryTensor:v10 secondaryTensor:v19 name:v20];
  if (v13) {

  }
  return (MPSGraphTensor *)v21;
}

- (MPSGraphTensor)sigmoidWithTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = tensor;
  BOOL v7 = name;
  uint64_t v8 = [MPSGraphSigmoidOp alloc];
  v14[0] = v6;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v10 = [(MPSGraphOperation *)v8 initWithGraph:self inputTensors:v9 controlDependencies:MEMORY[0x1E4F1CBF0] name:v7];

  id v11 = [(MPSGraphOperation *)v10 outputTensors];
  id v12 = [v11 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)sigmoidGradientWithIncomingGradient:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source name:(NSString *)name
{
  uint64_t v8 = gradient;
  uint64_t v9 = source;
  id v10 = name;
  int v22 = 1065353216;
  id v11 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:&v22 length:4 freeWhenDone:0];
  id v12 = [(MPSGraph *)self constantWithData:v11 shape:&unk_1EC9F19B8 dataType:[(MPSGraphTensor *)v9 dataType]];

  if (v10)
  {
    uint64_t v13 = [(NSString *)v10 stringByAppendingString:@"/sigmoid"];
  }
  else
  {
    uint64_t v13 = @"sigmoidGrad/sigmoid";
  }
  uint64_t v14 = [(MPSGraph *)self sigmoidWithTensor:v9 name:v13];
  if (v10)
  {

    id v15 = [(NSString *)v10 stringByAppendingString:@"/subtraction"];
  }
  else
  {
    id v15 = @"sigmoidGrad/subtraction";
  }
  uint64_t v16 = [(MPSGraph *)self subtractionWithPrimaryTensor:v12 secondaryTensor:v14 name:v15];
  if (v10)
  {

    id v17 = [(NSString *)v10 stringByAppendingString:@"/multiplication"];
  }
  else
  {
    id v17 = @"sigmoidGrad/multiplication";
  }
  id v18 = [(MPSGraph *)self multiplicationWithPrimaryTensor:v16 secondaryTensor:v14 name:v17];
  if (v10)
  {

    unint64_t v19 = [(NSString *)v10 stringByAppendingString:@"/multiplication_1"];
  }
  else
  {
    unint64_t v19 = @"sigmoidGrad/multiplication_1";
  }
  uint64_t v20 = [(MPSGraph *)self multiplicationWithPrimaryTensor:v8 secondaryTensor:v18 name:v19];
  if (v10) {

  }
  return (MPSGraphTensor *)v20;
}

- (MPSGraphTensor)softMaxWithTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  uint64_t v8 = tensor;
  uint64_t v9 = name;
  id v10 = v9;
  if (v9)
  {
    id v11 = [(NSString *)v9 stringByAppendingString:@"/reductionMaximum"];
  }
  else
  {
    id v11 = @"softMax/reductionMaximum";
  }
  id v12 = [(MPSGraph *)self reductionMaximumWithTensor:v8 axis:axis name:v11];
  if (v10) {

  }
  uint64_t v13 = [v12 operation];
  [v13 setStopGradient:1];

  if (v10)
  {
    uint64_t v14 = [(NSString *)v10 stringByAppendingString:@"/subtraction"];
  }
  else
  {
    uint64_t v14 = @"softMax/subtraction";
  }
  id v15 = [(MPSGraph *)self subtractionWithPrimaryTensor:v8 secondaryTensor:v12 name:v14];
  if (v10)
  {

    uint64_t v16 = [(NSString *)v10 stringByAppendingString:@"/exponent"];
  }
  else
  {
    uint64_t v16 = @"softMax/exponent";
  }
  id v17 = [(MPSGraph *)self exponentWithTensor:v15 name:v16];
  if (v10)
  {

    id v18 = [(NSString *)v10 stringByAppendingString:@"/reductionSum"];
  }
  else
  {
    id v18 = @"softMax/reductionSum";
  }
  unint64_t v19 = [(MPSGraph *)self reductionSumWithTensor:v17 axis:axis name:v18];
  if (v10)
  {

    uint64_t v20 = [(NSString *)v10 stringByAppendingString:@"/division"];
  }
  else
  {
    uint64_t v20 = @"softMax/division";
  }
  unint64_t v21 = [(MPSGraph *)self divisionWithPrimaryTensor:v17 secondaryTensor:v19 name:v20];
  if (v10) {

  }
  return (MPSGraphTensor *)v21;
}

- (MPSGraphTensor)softMaxGradientWithIncomingGradient:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source axis:(NSInteger)axis name:(NSString *)name
{
  id v10 = gradient;
  id v11 = name;
  id v12 = [(MPSGraph *)self softMaxWithTensor:source axis:axis name:@"softMaxGradient/softMax"];
  if (v11)
  {
    uint64_t v13 = [(NSString *)v11 stringByAppendingString:@"/multiplication"];
  }
  else
  {
    uint64_t v13 = @"softMaxGradient/multiplication";
  }
  uint64_t v14 = [(MPSGraph *)self multiplicationWithPrimaryTensor:v12 secondaryTensor:v10 name:v13];
  if (v11)
  {

    id v15 = [(NSString *)v11 stringByAppendingString:@"/subtraction"];
  }
  else
  {
    id v15 = @"softMaxGradient/subtraction";
  }
  uint64_t v16 = [(MPSGraph *)self subtractionWithPrimaryTensor:v10 secondaryTensor:v14 name:v15];
  if (v11)
  {

    id v17 = [(NSString *)v11 stringByAppendingString:@"/multiplication_1"];
  }
  else
  {
    id v17 = @"softMaxGradient/multiplication_1";
  }
  id v18 = [(MPSGraph *)self multiplicationWithPrimaryTensor:v16 secondaryTensor:v12 name:v17];
  if (v11) {

  }
  return (MPSGraphTensor *)v18;
}

- (MPSGraphTensor)fastFourierTransformWithTensor:(MPSGraphTensor *)tensor axesTensor:(MPSGraphTensor *)axesTensor descriptor:(MPSGraphFFTDescriptor *)descriptor name:(NSString *)name
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  id v10 = tensor;
  id v11 = axesTensor;
  id v12 = descriptor;
  uint64_t v13 = name;
  uint64_t v14 = [MPSGraphFFTOp alloc];
  v20[0] = v10;
  v20[1] = v11;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  uint64_t v16 = [(MPSGraphFFTOp *)v14 initWithGraph:self inputTensors:v15 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v12 name:v13];

  id v17 = [(MPSGraphOperation *)v16 outputTensors];
  id v18 = [v17 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v18;
}

- (MPSGraphTensor)fastFourierTransformWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes descriptor:(MPSGraphFFTDescriptor *)descriptor name:(NSString *)name
{
  id v10 = tensor;
  id v11 = descriptor;
  id v12 = name;
  uint64_t v13 = axesToAxesTensor(self, axes);
  if (v13)
  {
    uint64_t v14 = [(MPSGraph *)self fastFourierTransformWithTensor:v10 axesTensor:v13 descriptor:v11 name:v12];
  }
  else
  {
    uint64_t v14 = v10;
  }
  id v15 = v14;

  return v15;
}

- (MPSGraphTensor)realToHermiteanFFTWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes descriptor:(MPSGraphFFTDescriptor *)descriptor name:(NSString *)name
{
  id v10 = tensor;
  id v11 = descriptor;
  id v12 = name;
  uint64_t v13 = axesToAxesTensor(self, axes);
  if (v13)
  {
    uint64_t v14 = [(MPSGraph *)self realToHermiteanFFTWithTensor:v10 axesTensor:v13 descriptor:v11 name:v12];
  }
  else
  {
    uint64_t v14 = v10;
  }
  id v15 = v14;

  return v15;
}

- (MPSGraphTensor)realToHermiteanFFTWithTensor:(MPSGraphTensor *)tensor axesTensor:(MPSGraphTensor *)axesTensor descriptor:(MPSGraphFFTDescriptor *)descriptor name:(NSString *)name
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  id v10 = tensor;
  id v11 = axesTensor;
  id v12 = descriptor;
  uint64_t v13 = name;
  uint64_t v14 = [MPSGraphRealToHermiteanFFTOp alloc];
  v20[0] = v10;
  v20[1] = v11;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  uint64_t v16 = [(MPSGraphRealToHermiteanFFTOp *)v14 initWithGraph:self inputTensors:v15 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v12 name:v13];

  id v17 = [(MPSGraphOperation *)v16 outputTensors];
  id v18 = [v17 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v18;
}

- (MPSGraphTensor)HermiteanToRealFFTWithTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes descriptor:(MPSGraphFFTDescriptor *)descriptor name:(NSString *)name
{
  id v10 = tensor;
  id v11 = descriptor;
  id v12 = name;
  uint64_t v13 = axesToAxesTensor(self, axes);
  if (v13)
  {
    uint64_t v14 = [(MPSGraph *)self HermiteanToRealFFTWithTensor:v10 axesTensor:v13 descriptor:v11 name:v12];
  }
  else
  {
    uint64_t v14 = v10;
  }
  id v15 = v14;

  return v15;
}

- (MPSGraphTensor)HermiteanToRealFFTWithTensor:(MPSGraphTensor *)tensor axesTensor:(MPSGraphTensor *)axesTensor descriptor:(MPSGraphFFTDescriptor *)descriptor name:(NSString *)name
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  id v10 = tensor;
  id v11 = axesTensor;
  id v12 = descriptor;
  uint64_t v13 = name;
  uint64_t v14 = [MPSGraphHermiteanToRealFFTOp alloc];
  v20[0] = v10;
  v20[1] = v11;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  uint64_t v16 = [(MPSGraphHermiteanToRealFFTOp *)v14 initWithGraph:self inputTensors:v15 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v12 name:v13];

  id v17 = [(MPSGraphOperation *)v16 outputTensors];
  id v18 = [v17 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v18;
}

- (MPSGraphTensor)stochasticGradientDescentWithLearningRateTensor:(MPSGraphTensor *)learningRateTensor valuesTensor:(MPSGraphTensor *)valuesTensor gradientTensor:(MPSGraphTensor *)gradientTensor name:(NSString *)name
{
  id v10 = learningRateTensor;
  id v11 = valuesTensor;
  id v12 = gradientTensor;
  uint64_t v13 = name;
  uint64_t v14 = v13;
  if (v13)
  {
    id v15 = [(NSString *)v13 stringByAppendingString:@"/multiplication"];
  }
  else
  {
    id v15 = @"stochasticGradientDescent/multiplication";
  }
  uint64_t v16 = [(MPSGraph *)self multiplicationWithPrimaryTensor:v12 secondaryTensor:v10 name:v15];
  if (v14)
  {

    id v17 = [(NSString *)v14 stringByAppendingString:@"/subtraction"];
  }
  else
  {
    id v17 = @"stochasticGradientDescent/subtraction";
  }
  id v18 = [(MPSGraph *)self subtractionWithPrimaryTensor:v11 secondaryTensor:v16 name:v17];
  if (v14) {

  }
  return (MPSGraphTensor *)v18;
}

- (MPSGraphOperation)applyStochasticGradientDescentWithLearningRateTensor:(MPSGraphTensor *)learningRateTensor variable:(MPSGraphVariableOp *)variable gradientTensor:(MPSGraphTensor *)gradientTensor name:(NSString *)name
{
  id v10 = learningRateTensor;
  id v11 = gradientTensor;
  id v12 = name;
  uint64_t v13 = [(MPSGraphOperation *)variable outputTensors];
  uint64_t v14 = [v13 objectAtIndexedSubscript:0];

  id v15 = [(MPSGraph *)self stochasticGradientDescentWithLearningRateTensor:v10 valuesTensor:v14 gradientTensor:v11 name:v12];
  if (v12)
  {
    uint64_t v16 = [(NSString *)v12 stringByAppendingString:@"/assignUpdate"];
  }
  else
  {
    uint64_t v16 = @"applyStochasticGradient/assignUpdate";
  }
  id v17 = [(MPSGraph *)self assignVariable:v14 withValueOfTensor:v15 name:v16];
  if (v12) {

  }
  return (MPSGraphOperation *)v17;
}

- (id)momentumUpdateWithBetaTensor:(id)a3 momentumTensor:(id)a4 gradientTensor:(id)a5 name:(id)a6
{
  id v10 = a3;
  id v26 = a4;
  id v11 = a5;
  id v12 = (__CFString *)a6;
  uint64_t v13 = v12;
  uint64_t v14 = @"momentumUpdate";
  if (v12) {
    uint64_t v14 = v12;
  }
  id v15 = v14;
  uint64_t v16 = -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1EC9F19D0, [v11 dataType], 1.0);
  id v17 = [(__CFString *)v15 stringByAppendingString:@"/sub"];
  id v18 = [(MPSGraph *)self subtractionWithPrimaryTensor:v16 secondaryTensor:v10 name:v17];

  unint64_t v19 = [(__CFString *)v15 stringByAppendingString:@"/mul"];
  uint64_t v20 = [(MPSGraph *)self multiplicationWithPrimaryTensor:v10 secondaryTensor:v26 name:v19];

  unint64_t v21 = [(__CFString *)v15 stringByAppendingString:@"/mul"];
  int v22 = [(MPSGraph *)self multiplicationWithPrimaryTensor:v18 secondaryTensor:v11 name:v21];

  unint64_t v23 = [(__CFString *)v15 stringByAppendingString:@"/add"];
  uint64_t v24 = [(MPSGraph *)self additionWithPrimaryTensor:v20 secondaryTensor:v22 name:v23];

  return v24;
}

- (id)velocityUpdateWithBetaTensor:(id)a3 velocityTensor:(id)a4 gradientTensor:(id)a5 name:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (__CFString *)a6;
  uint64_t v14 = v13;
  id v15 = @"velocityUpdate";
  if (v13) {
    id v15 = v13;
  }
  uint64_t v16 = v15;
  uint64_t v29 = v11;
  uint64_t v28 = -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1EC9F19E8, [v12 dataType], 1.0);
  id v17 = [(__CFString *)v16 stringByAppendingString:@"/sub"];
  id v18 = [(MPSGraph *)self subtractionWithPrimaryTensor:v28 secondaryTensor:v10 name:v17];

  unint64_t v19 = [(__CFString *)v16 stringByAppendingString:@"/square"];
  uint64_t v20 = [(MPSGraph *)self squareWithTensor:v12 name:v19];

  unint64_t v21 = [(__CFString *)v16 stringByAppendingString:@"/mul"];
  int v22 = [(MPSGraph *)self multiplicationWithPrimaryTensor:v10 secondaryTensor:v11 name:v21];

  unint64_t v23 = [(__CFString *)v16 stringByAppendingString:@"/mul"];
  uint64_t v24 = [(MPSGraph *)self multiplicationWithPrimaryTensor:v18 secondaryTensor:v20 name:v23];

  double v25 = [(__CFString *)v16 stringByAppendingString:@"/add"];
  id v26 = [(MPSGraph *)self additionWithPrimaryTensor:v22 secondaryTensor:v24 name:v25];

  return v26;
}

- (id)adamAssignWithInputVariableTensor:(id)a3 momentumVariableTensor:(id)a4 velocityVariableTensor:(id)a5 maximumVelocityVariableTensor:(id)a6 updates:(id)a7 name:(id)a8
{
  v39[2] = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v34 = a4;
  id v33 = a5;
  id v38 = a6;
  id v14 = a7;
  id v15 = (__CFString *)a8;
  uint64_t v16 = v15;
  id v17 = @"applyAdam";
  if (v15) {
    id v17 = v15;
  }
  id v18 = v17;
  id v35 = [v14 objectAtIndexedSubscript:0];
  uint64_t v37 = [v14 objectAtIndexedSubscript:1];
  id v36 = [v14 objectAtIndexedSubscript:2];
  unint64_t v19 = [(__CFString *)v18 stringByAppendingString:@"/assignAdamUpdate/momentum"];
  uint64_t v20 = [(MPSGraph *)self assignVariable:v34 withValueOfTensor:v37 name:v19];

  unint64_t v21 = [(__CFString *)v18 stringByAppendingString:@"/assignAdamUpdate/velocity"];
  int v22 = [(MPSGraph *)self assignVariable:v33 withValueOfTensor:v36 name:v21];

  unint64_t v23 = [(__CFString *)v18 stringByAppendingString:@"/assignAdamUpdate"];
  uint64_t v24 = [(MPSGraph *)self assignVariable:v32 withValueOfTensor:v35 name:v23];

  id v25 = v24[4];
  v39[0] = v20;
  v39[1] = v22;
  id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  [v25 addObjectsFromArray:v26];

  unint64_t v27 = [v14 count];
  if (v38 && v27 >= 4)
  {
    uint64_t v28 = [v14 objectAtIndexedSubscript:3];
    uint64_t v29 = [(__CFString *)v18 stringByAppendingString:@"/assignAdamUpdate/maximumVelocity"];
    id v30 = [(MPSGraph *)self assignVariable:v38 withValueOfTensor:v28 name:v29];

    [v24[4] addObject:v30];
  }

  return v24;
}

- (NSArray)adamWithCurrentLearningRateTensor:(MPSGraphTensor *)currentLearningRateTensor beta1Tensor:(MPSGraphTensor *)beta1Tensor beta2Tensor:(MPSGraphTensor *)beta2Tensor epsilonTensor:(MPSGraphTensor *)epsilonTensor valuesTensor:(MPSGraphTensor *)valuesTensor momentumTensor:(MPSGraphTensor *)momentumTensor velocityTensor:(MPSGraphTensor *)velocityTensor maximumVelocityTensor:(MPSGraphTensor *)maximumVelocityTensor gradientTensor:(MPSGraphTensor *)gradientTensor name:(NSString *)name
{
  id v12 = [(MPSGraph *)self adamUpdateWithCurrentLearningRateTensor:currentLearningRateTensor beta1Tensor:beta1Tensor beta2Tensor:beta2Tensor epsilonTensor:epsilonTensor valuesTensor:valuesTensor momentumTensor:momentumTensor velocityTensor:velocityTensor maximumVelocityTensor:maximumVelocityTensor gradientTensor:gradientTensor name:name];

  return (NSArray *)v12;
}

- (id)adamUpdateWithCurrentLearningRateTensor:(id)a3 beta1Tensor:(id)a4 beta2Tensor:(id)a5 epsilonTensor:(id)a6 valuesTensor:(id)a7 momentumTensor:(id)a8 velocityTensor:(id)a9 maximumVelocityTensor:(id)a10 gradientTensor:(id)a11 name:(id)a12
{
  v59[4] = *MEMORY[0x1E4F143B8];
  id v50 = a3;
  id v18 = a4;
  id v52 = a5;
  id v51 = a6;
  id v49 = a7;
  id v19 = a8;
  id v53 = a9;
  id v57 = a10;
  id v20 = a11;
  unint64_t v21 = (__CFString *)a12;
  int v22 = @"applyAdam";
  uint64_t v47 = v21;
  if (v21) {
    int v22 = v21;
  }
  unint64_t v23 = v22;
  unint64_t v48 = v18;
  uint64_t v46 = v19;
  uint64_t v54 = v20;
  uint64_t v24 = [(__CFString *)v23 stringByAppendingString:@"/momentumUpdate"];
  uint64_t v56 = [(MPSGraph *)self momentumUpdateWithBetaTensor:v18 momentumTensor:v19 gradientTensor:v20 name:v24];

  id v25 = [(__CFString *)v23 stringByAppendingString:@"/velocityUpdate"];
  id v26 = [(MPSGraph *)self velocityUpdateWithBetaTensor:v52 velocityTensor:v53 gradientTensor:v20 name:v25];

  id v27 = v26;
  uint64_t v28 = v27;
  if (v57)
  {
    uint64_t v29 = [(__CFString *)v23 stringByAppendingString:@"/maxVelocity"];
    id v30 = [(MPSGraph *)self maximumWithPrimaryTensor:v28 secondaryTensor:v57 name:v29];

    id v31 = v30;
    uint64_t v55 = v31;
  }
  else
  {
    id v31 = 0;
    uint64_t v55 = v27;
  }
  id v32 = [(__CFString *)v23 stringByAppendingString:@"/squareRoot"];
  id v33 = [(MPSGraph *)self squareRootWithTensor:v55 name:v32];

  id v34 = [(__CFString *)v23 stringByAppendingString:@"/epsilon_add"];
  id v35 = [(MPSGraph *)self additionWithPrimaryTensor:v33 secondaryTensor:v51 name:v34];

  id v36 = [(__CFString *)v23 stringByAppendingString:@"/multiply"];
  uint64_t v37 = [(MPSGraph *)self multiplicationWithPrimaryTensor:v50 secondaryTensor:v56 name:v36];

  id v38 = [(__CFString *)v23 stringByAppendingString:@"/divide"];
  uint64_t v39 = [(MPSGraph *)self divisionWithPrimaryTensor:v37 secondaryTensor:v35 name:v38];

  uint64_t v40 = [(__CFString *)v23 stringByAppendingString:@"/subtract"];
  double v41 = [(MPSGraph *)self subtractionWithPrimaryTensor:v49 secondaryTensor:v39 name:v40];

  if (v57)
  {
    v59[0] = v41;
    v59[1] = v56;
    uint64_t v42 = v59;
    uint64_t v43 = 4;
    v59[2] = v28;
    v59[3] = v31;
  }
  else
  {
    v58[0] = v41;
    v58[1] = v56;
    uint64_t v42 = v58;
    uint64_t v43 = 3;
    v58[2] = v28;
  }
  uint64_t v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:v43];

  return v44;
}

- (id)applyAdamWithCurrentLearningRateTensor:(id)a3 beta1Tensor:(id)a4 beta2Tensor:(id)a5 epsilonTensor:(id)a6 variable:(id)a7 momentumVariable:(id)a8 velocityVariable:(id)a9 maximumVelocityVariable:(id)a10 gradientTensor:(id)a11 name:(id)a12
{
  id v38 = a3;
  id v37 = a4;
  id v36 = a5;
  id v35 = a6;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  id v22 = a12;
  id v34 = v18;
  unint64_t v23 = [a7 outputTensors];
  uint64_t v24 = [v23 objectAtIndexedSubscript:0];

  id v25 = [v18 outputTensors];
  id v26 = [v25 objectAtIndexedSubscript:0];

  id v27 = [v19 outputTensors];
  uint64_t v28 = [v27 objectAtIndexedSubscript:0];

  if (v20)
  {
    uint64_t v29 = [v20 outputTensors];
    id v30 = [v29 objectAtIndexedSubscript:0];
  }
  else
  {
    id v30 = 0;
  }
  id v31 = [(MPSGraph *)self adamUpdateWithCurrentLearningRateTensor:v38 beta1Tensor:v37 beta2Tensor:v36 epsilonTensor:v35 valuesTensor:v24 momentumTensor:v26 velocityTensor:v28 maximumVelocityTensor:v30 gradientTensor:v21 name:v22];
  id v32 = [(MPSGraph *)self adamAssignWithInputVariableTensor:v24 momentumVariableTensor:v26 velocityVariableTensor:v28 maximumVelocityVariableTensor:v30 updates:v31 name:v22];

  return v32;
}

- (id)currentLearningRateWithLearningRateTensor:(id)a3 beta1Tensor:(id)a4 beta2Tensor:(id)a5 beta1PowerTensor:(id)a6 beta2PowerTensor:(id)a7 name:(id)a8
{
  id v31 = a3;
  id v12 = a6;
  id v13 = a7;
  id v14 = (__CFString *)a8;
  id v15 = v14;
  uint64_t v16 = @"applyAdam";
  if (v14) {
    uint64_t v16 = v14;
  }
  id v17 = v16;
  id v30 = v13;
  id v18 = -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1EC9F1A00, [v12 dataType], 1.0);
  id v19 = [(__CFString *)v17 stringByAppendingString:@"/subPowBeta1"];
  id v20 = [(MPSGraph *)self subtractionWithPrimaryTensor:v18 secondaryTensor:v12 name:v19];

  id v21 = [(__CFString *)v17 stringByAppendingString:@"/subPowBeta2"];
  id v22 = [(MPSGraph *)self subtractionWithPrimaryTensor:v18 secondaryTensor:v13 name:v21];

  unint64_t v23 = [(__CFString *)v17 stringByAppendingString:@"/sqrtBeta2"];
  uint64_t v24 = [(MPSGraph *)self squareRootWithTensor:v22 name:v23];

  id v25 = [(__CFString *)v17 stringByAppendingString:@"/subBeta2"];
  id v26 = [(MPSGraph *)self multiplicationWithPrimaryTensor:v24 secondaryTensor:v31 name:v25];

  id v27 = [(__CFString *)v17 stringByAppendingString:@"/subBeta2"];
  uint64_t v28 = [(MPSGraph *)self divisionWithPrimaryTensor:v26 secondaryTensor:v20 name:v27];

  return v28;
}

- (NSArray)adamWithLearningRateTensor:(MPSGraphTensor *)learningRateTensor beta1Tensor:(MPSGraphTensor *)beta1Tensor beta2Tensor:(MPSGraphTensor *)beta2Tensor epsilonTensor:(MPSGraphTensor *)epsilonTensor beta1PowerTensor:(MPSGraphTensor *)beta1PowerTensor beta2PowerTensor:(MPSGraphTensor *)beta2PowerTensor valuesTensor:(MPSGraphTensor *)valuesTensor momentumTensor:(MPSGraphTensor *)momentumTensor velocityTensor:(MPSGraphTensor *)velocityTensor maximumVelocityTensor:(MPSGraphTensor *)maximumVelocityTensor gradientTensor:(MPSGraphTensor *)gradientTensor name:(NSString *)name
{
  id v14 = [(MPSGraph *)self adamUpdateWithLearningRateTensor:learningRateTensor beta1Tensor:beta1Tensor beta2Tensor:beta2Tensor epsilonTensor:epsilonTensor beta1PowerTensor:beta1PowerTensor beta2PowerTensor:beta2PowerTensor valuesTensor:valuesTensor momentumTensor:momentumTensor velocityTensor:velocityTensor maximumVelocityTensor:maximumVelocityTensor gradientTensor:gradientTensor name:name];

  return (NSArray *)v14;
}

- (id)adamUpdateWithLearningRateTensor:(id)a3 beta1Tensor:(id)a4 beta2Tensor:(id)a5 epsilonTensor:(id)a6 beta1PowerTensor:(id)a7 beta2PowerTensor:(id)a8 valuesTensor:(id)a9 momentumTensor:(id)a10 velocityTensor:(id)a11 maximumVelocityTensor:(id)a12 gradientTensor:(id)a13 name:(id)a14
{
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a9;
  id v21 = self;
  id v34 = a10;
  id v22 = a11;
  id v23 = a12;
  id v24 = a13;
  id v25 = a14;
  id v26 = [(MPSGraph *)self currentLearningRateWithLearningRateTensor:a3 beta1Tensor:v17 beta2Tensor:v18 beta1PowerTensor:a7 beta2PowerTensor:a8 name:v25];
  id v27 = v21;
  uint64_t v28 = v20;
  uint64_t v29 = [(MPSGraph *)v27 adamUpdateWithCurrentLearningRateTensor:v26 beta1Tensor:v17 beta2Tensor:v18 epsilonTensor:v19 valuesTensor:v20 momentumTensor:v34 velocityTensor:v22 maximumVelocityTensor:v23 gradientTensor:v24 name:v25];

  return v29;
}

- (id)applyAdamWithLearningRateTensor:(id)a3 beta1Tensor:(id)a4 beta2Tensor:(id)a5 epsilonTensor:(id)a6 beta1PowerTensor:(id)a7 beta2PowerTensor:(id)a8 variable:(id)a9 momentumVariable:(id)a10 velocityVariable:(id)a11 gradientTensor:(id)a12 name:(id)a13
{
  id v37 = a3;
  id v36 = a4;
  id v35 = a5;
  id v34 = a6;
  id v33 = a7;
  id v18 = a8;
  id v19 = a10;
  id v20 = a11;
  id v21 = a12;
  id v22 = a13;
  id v23 = [a9 outputTensors];
  id v24 = [v23 objectAtIndexedSubscript:0];

  id v25 = [v19 outputTensors];
  id v26 = [v25 objectAtIndexedSubscript:0];

  id v27 = [v20 outputTensors];
  uint64_t v28 = [v27 objectAtIndexedSubscript:0];

  uint64_t v29 = [(MPSGraph *)self adamUpdateWithLearningRateTensor:v37 beta1Tensor:v36 beta2Tensor:v35 epsilonTensor:v34 beta1PowerTensor:v33 beta2PowerTensor:v18 valuesTensor:v24 momentumTensor:v26 velocityTensor:v28 maximumVelocityTensor:0 gradientTensor:v21 name:v22];
  id v30 = [(MPSGraph *)self adamAssignWithInputVariableTensor:v24 momentumVariableTensor:v26 velocityVariableTensor:v28 maximumVelocityVariableTensor:0 updates:v29 name:v22];

  return v30;
}

- (id)adamUpdateWithLearningRateTensor:(id)a3 beta1Tensor:(id)a4 beta2Tensor:(id)a5 epsilonTensor:(id)a6 iterationTensor:(id)a7 valuesTensor:(id)a8 momentumTensor:(id)a9 velocityTensor:(id)a10 gradientTensor:(id)a11 name:(id)a12
{
  id v36 = a3;
  id v18 = a4;
  id v19 = a5;
  id v34 = a6;
  id v20 = a7;
  id v21 = a8;
  id v37 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = (__CFString *)a12;
  id v25 = v24;
  id v26 = @"applyAdam";
  if (v24) {
    id v26 = v24;
  }
  id v38 = v26;
  id v35 = v18;
  id v33 = v21;
  id v27 = [(__CFString *)v38 stringByAppendingString:@"/beta1Power"];
  uint64_t v28 = [(MPSGraph *)self powerWithPrimaryTensor:v18 secondaryTensor:v20 name:v27];

  uint64_t v29 = [(__CFString *)v38 stringByAppendingString:@"/beta2Power"];
  id v30 = [(MPSGraph *)self powerWithPrimaryTensor:v19 secondaryTensor:v20 name:v29];

  id v32 = [(MPSGraph *)self adamUpdateWithLearningRateTensor:v36 beta1Tensor:v35 beta2Tensor:v19 epsilonTensor:v34 beta1PowerTensor:v28 beta2PowerTensor:v30 valuesTensor:v33 momentumTensor:v37 velocityTensor:v22 maximumVelocityTensor:0 gradientTensor:v23 name:v25];

  return v32;
}

- (id)applyAdamWithLearningRateTensor:(id)a3 beta1Tensor:(id)a4 beta2Tensor:(id)a5 epsilonTensor:(id)a6 iterationTensor:(id)a7 variable:(id)a8 momentumVariable:(id)a9 velocityVariable:(id)a10 gradientTensor:(id)a11 name:(id)a12
{
  id v35 = a3;
  id v34 = a4;
  id v33 = a5;
  id v32 = a6;
  id v18 = a7;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  id v22 = a12;
  id v23 = [a8 outputTensors];
  id v24 = [v23 objectAtIndexedSubscript:0];

  id v25 = [v19 outputTensors];
  id v26 = [v25 objectAtIndexedSubscript:0];

  id v27 = [v20 outputTensors];
  uint64_t v28 = [v27 objectAtIndexedSubscript:0];

  uint64_t v29 = [(MPSGraph *)self adamUpdateWithLearningRateTensor:v35 beta1Tensor:v34 beta2Tensor:v33 epsilonTensor:v32 iterationTensor:v18 valuesTensor:v24 momentumTensor:v26 velocityTensor:v28 gradientTensor:v21 name:v22];
  id v30 = [(MPSGraph *)self adamAssignWithInputVariableTensor:v24 momentumVariableTensor:v26 velocityVariableTensor:v28 maximumVelocityVariableTensor:0 updates:v29 name:v22];

  return v30;
}

- (id)solveWithDecompositionTensor:(id)a3 rhsTensor:(id)a4 descriptor:(id)a5 name:(id)a6
{
  void v22[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v12 decompositionType]) {
    __assert_rtn("-[MPSGraph(MPSGraphMatrixSolverOps) solveWithDecompositionTensor:rhsTensor:descriptor:name:]", "MPSGraphMatrixSolveOps.mm", 49, "(descriptor.decompositionType == MPSGraphMatrixDecompositionLU) && \"unsupported decomposition type\"");
  }
  id v14 = [MPSGraphMatrixSolverOp alloc];
  id v15 = [v10 objectAtIndexedSubscript:0];
  uint64_t v16 = objc_msgSend(v10, "objectAtIndexedSubscript:", 1, v15);
  v22[1] = v16;
  v22[2] = v11;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  id v18 = [(MPSGraphOperation *)v14 initWithGraph:self inputTensors:v17 controlDependencies:MEMORY[0x1E4F1CBF0] name:v13];

  id v19 = [(MPSGraphOperation *)v18 outputTensors];
  id v20 = [v19 objectAtIndexedSubscript:0];

  return v20;
}

- (id)solveLUWithDecompositionTensor:(id)a3 rhsTensor:(id)a4 name:(id)a5
{
  void v19[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MPSGraphMatrixSolverOp alloc];
  id v12 = [v8 objectAtIndexedSubscript:0];
  id v13 = objc_msgSend(v8, "objectAtIndexedSubscript:", 1, v12);
  v19[1] = v13;
  void v19[2] = v9;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  id v15 = [(MPSGraphOperation *)v11 initWithGraph:self inputTensors:v14 controlDependencies:MEMORY[0x1E4F1CBF0] name:v10];

  uint64_t v16 = [(MPSGraphOperation *)v15 outputTensors];
  id v17 = [v16 objectAtIndexedSubscript:0];

  return v17;
}

- (MPSGraphTensor)stencilWithSourceTensor:(MPSGraphTensor *)source weightsTensor:(MPSGraphTensor *)weights descriptor:(MPSGraphStencilOpDescriptor *)descriptor name:(NSString *)name
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  id v10 = source;
  id v11 = weights;
  id v12 = descriptor;
  id v13 = name;
  v20[0] = v10;
  v20[1] = v11;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  id v15 = [MPSGraphStencilOp alloc];
  uint64_t v16 = [(MPSGraphStencilOp *)v15 initWithGraph:self inputTensors:v14 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v12 name:v13];
  id v17 = [(MPSGraphOperation *)v16 outputTensors];
  id v18 = [v17 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v18;
}

- (id)stencilWithSourceTensor:(id)a3 weightsTensor:(id)a4 offsets:(id)a5 name:(id)a6
{
  void v21[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21[0] = v10;
  v21[1] = v11;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  id v15 = +[MPSGraphStencilOpDescriptor descriptorWithReductionMode:2 offsets:v12 strides:&unk_1EC9F1AF0 dilationRates:&unk_1EC9F1B08 explicitPadding:&unk_1EC9F1B20 boundaryMode:4 paddingStyle:0.0 paddingConstant:3];
  uint64_t v16 = [MPSGraphStencilOp alloc];
  id v17 = [(MPSGraphStencilOp *)v16 initWithGraph:self inputTensors:v14 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v15 name:v13];
  id v18 = [(MPSGraphOperation *)v17 outputTensors];
  id v19 = [v18 objectAtIndexedSubscript:0];

  return v19;
}

- (id)eluWithTensor:(id)a3 alpha:(double)a4 name:(id)a5
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1EC9F1B68, [v8 dataType], a4);
  id v11 = [MPSGraphEluOp alloc];
  v17[0] = v8;
  v17[1] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  id v13 = [(MPSGraphOperation *)v11 initWithGraph:self inputTensors:v12 controlDependencies:MEMORY[0x1E4F1CBF0] name:v9];

  id v14 = [(MPSGraphOperation *)v13 outputTensors];
  id v15 = [v14 objectAtIndexedSubscript:0];

  return v15;
}

- (id)eluGradientWithIncomingGradient:(id)a3 sourceTensor:(id)a4 alpha:(double)a5 name:(id)a6
{
  id v27 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1EC9F1B80, [v10 dataType], a5);
  id v26 = (void *)v12;
  id v13 = -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1EC9F1B98, [v10 dataType], 0.0);
  id v14 = -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1EC9F1BB0, [v10 dataType], 1.0);
  if (v11)
  {
    id v15 = [v11 stringByAppendingString:@"/lessThanOrEqualTo"];
  }
  else
  {
    id v15 = @"eluGrad/lessThanOrEqualTo";
  }
  uint64_t v16 = [(MPSGraph *)self greaterThanWithPrimaryTensor:v10 secondaryTensor:v13 name:v15];
  if (v11)
  {

    id v17 = [v11 stringByAppendingString:@"/eluResult"];
  }
  else
  {
    id v17 = @"eluGrad/eluResult";
  }
  id v18 = [(MPSGraph *)self eluWithTensor:v10 alpha:v17 name:a5];
  if (v11)
  {

    id v19 = [v11 stringByAppendingString:@"/negativeRegionGradient"];
  }
  else
  {
    id v19 = @"eluGrad/negativeRegionGradient";
  }
  id v20 = [(MPSGraph *)self additionWithPrimaryTensor:v18 secondaryTensor:v12 name:v19];
  if (v11)
  {

    id v21 = [v11 stringByAppendingString:@"/localGradient"];
  }
  else
  {
    id v21 = @"eluGrad/localGradient";
  }
  id v22 = [(MPSGraph *)self selectWithPredicateTensor:v16 truePredicateTensor:v14 falsePredicateTensor:v20 name:v21];
  if (v11)
  {

    id v23 = [v11 stringByAppendingString:@"/select"];
  }
  else
  {
    id v23 = @"eluGrad/multiplication";
  }
  id v24 = [(MPSGraph *)self multiplicationWithPrimaryTensor:v27 secondaryTensor:v22 name:v23];
  if (v11) {

  }
  return v24;
}

- (id)prunedTensorWithDescriptor:(id)a3 tensor:(id)a4 shape:(id)a5 name:(id)a6
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [MPSGraphPruningOp alloc];
  v20[0] = v11;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  uint64_t v16 = [(MPSGraphPruningOp *)v14 initWithGraph:self inputTensors:v15 controlDependencies:MEMORY[0x1E4F1CBF0] shape:v12 descriptor:v10 name:v13];

  id v17 = [(MPSGraphOperation *)v16 outputTensors];
  id v18 = [v17 objectAtIndexedSubscript:0];

  return v18;
}

- (id)prunedGradientTensorWithDescriptor:(id)a3 inputTensor:(id)a4 gradientTensor:(id)a5 shape:(id)a6 name:(id)a7
{
  void v23[2] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [MPSGraphPruningGradientOp alloc];
  v23[0] = v13;
  v23[1] = v14;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  id v19 = [(MPSGraphPruningGradientOp *)v17 initWithGraph:self inputTensors:v18 controlDependencies:MEMORY[0x1E4F1CBF0] shape:v15 descriptor:v12 name:v16];

  id v20 = [(MPSGraphOperation *)v19 outputTensors];
  id v21 = [v20 objectAtIndexedSubscript:0];

  return v21;
}

- (MPSGraphTensor)convolution2DWithSourceTensor:(MPSGraphTensor *)source weightsTensor:(MPSGraphTensor *)weights descriptor:(MPSGraphConvolution2DOpDescriptor *)descriptor name:(NSString *)name
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v10 = source;
  id v11 = weights;
  id v12 = descriptor;
  id v13 = name;
  id v14 = [(MPSGraphTensor *)v10 shape];
  if ([v14 count] != 4)
  {
    id v15 = [(MPSGraphTensor *)v10 shape];
    [v15 count];
  }
  id v16 = [(MPSGraphTensor *)v10 shape];
  if ([v16 count] == 4)
  {
  }
  else
  {
    id v17 = [(MPSGraphTensor *)v10 shape];
    uint64_t v18 = [v17 count];

    if (v18 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  id v19 = [(MPSGraphTensor *)v11 shape];
  if ([v19 count] != 4)
  {
    id v20 = [(MPSGraphTensor *)v11 shape];
    [v20 count];
  }
  id v21 = [(MPSGraphTensor *)v11 shape];
  if ([v21 count] == 4)
  {
  }
  else
  {
    id v22 = [(MPSGraphTensor *)v11 shape];
    uint64_t v23 = [v22 count];

    if (v23 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  id v24 = [MPSGraphConvolution2DOp alloc];
  v30[0] = v10;
  v30[1] = v11;
  id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  id v26 = [(MPSGraphConvolution2DBaseOp *)v24 initWithGraph:self inputTensors:v25 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v12 name:v13];

  id v27 = [(MPSGraphOperation *)v26 outputTensors];
  uint64_t v28 = [v27 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v28;
}

- (MPSGraphTensor)convolution2DDataGradientWithIncomingGradientTensor:(MPSGraphTensor *)gradient weightsTensor:(MPSGraphTensor *)weights outputShapeTensor:(MPSGraphTensor *)outputShapeTensor forwardConvolutionDescriptor:(MPSGraphConvolution2DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name
{
  v33[3] = *MEMORY[0x1E4F143B8];
  id v12 = gradient;
  id v13 = weights;
  id v14 = outputShapeTensor;
  id v15 = forwardConvolutionDescriptor;
  id v16 = name;
  id v17 = [(MPSGraphTensor *)v12 shape];
  if ([v17 count] != 4)
  {
    uint64_t v18 = [(MPSGraphTensor *)v12 shape];
    [v18 count];
  }
  id v19 = [(MPSGraphTensor *)v12 shape];
  if ([v19 count] == 4)
  {
  }
  else
  {
    id v20 = [(MPSGraphTensor *)v12 shape];
    uint64_t v21 = [v20 count];

    if (v21 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  id v22 = [(MPSGraphTensor *)v13 shape];
  if ([v22 count] != 4)
  {
    uint64_t v23 = [(MPSGraphTensor *)v13 shape];
    [v23 count];
  }
  id v24 = [(MPSGraphTensor *)v13 shape];
  if ([v24 count] == 4)
  {
  }
  else
  {
    id v25 = [(MPSGraphTensor *)v13 shape];
    uint64_t v26 = [v25 count];

    if (v26 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  id v27 = [MPSGraphConvolution2DDataGradientOp alloc];
  v33[0] = v12;
  v33[1] = v13;
  v33[2] = v14;
  uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
  uint64_t v29 = [(MPSGraphConvolution2DBaseOp *)v27 initWithGraph:self inputTensors:v28 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v15 name:v16];

  id v30 = [(MPSGraphOperation *)v29 outputTensors];
  id v31 = [v30 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v31;
}

- (MPSGraphTensor)convolution2DDataGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradient weightsTensor:(MPSGraphTensor *)weights outputShape:(MPSShape *)outputShape forwardConvolutionDescriptor:(MPSGraphConvolution2DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v12 = incomingGradient;
  id v13 = weights;
  id v14 = outputShape;
  id v15 = forwardConvolutionDescriptor;
  id v16 = name;
  [(MPSShape *)v14 count];
  if ([(MPSShape *)v14 count] != 4 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  unint64_t v17 = 0;
  long long v23 = xmmword_18112A9B0;
  while (v17 < [(MPSShape *)v14 count])
  {
    uint64_t v18 = [(MPSShape *)v14 objectAtIndexedSubscript:v17];
    *((_DWORD *)&v23 + v17) = [v18 intValue];

    ++v17;
  }
  id v19 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v23 length:16];
  id v20 = [(MPSGraph *)self constantWithData:v19 shape:&unk_1EC9F1BC8 dataType:536870944];

  uint64_t v21 = [(MPSGraph *)self convolution2DDataGradientWithIncomingGradientTensor:v12 weightsTensor:v13 outputShapeTensor:v20 forwardConvolutionDescriptor:v15 name:v16];

  return (MPSGraphTensor *)v21;
}

- (MPSGraphTensor)convolution2DWeightsGradientWithIncomingGradientTensor:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source outputShapeTensor:(MPSGraphTensor *)outputShapeTensor forwardConvolutionDescriptor:(MPSGraphConvolution2DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name
{
  v38[3] = *MEMORY[0x1E4F143B8];
  id v12 = gradient;
  id v13 = source;
  id v14 = outputShapeTensor;
  id v15 = forwardConvolutionDescriptor;
  id v16 = name;
  unint64_t v17 = [(MPSGraphTensor *)v12 shape];
  if ([v17 count] != 4)
  {
    uint64_t v18 = [(MPSGraphTensor *)v12 shape];
    [v18 count];
  }
  id v19 = [(MPSGraphTensor *)v12 shape];
  if ([v19 count] == 4)
  {
  }
  else
  {
    id v20 = [(MPSGraphTensor *)v12 shape];
    uint64_t v21 = [v20 count];

    if (v21 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  id v22 = [(MPSGraphTensor *)v13 shape];
  if ([v22 count] != 4)
  {
    long long v23 = [(MPSGraphTensor *)v13 shape];
    [v23 count];
  }
  uint64_t v24 = [(MPSGraphTensor *)v13 shape];
  if ([v24 count] == 4)
  {
  }
  else
  {
    id v25 = [(MPSGraphTensor *)v13 shape];
    uint64_t v26 = [v25 count];

    if (v26 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  id v27 = [(MPSGraphTensor *)v14 shape];
  if ([v27 count] != 1)
  {
    uint64_t v28 = [(MPSGraphTensor *)v13 shape];
    [v28 count];
  }
  uint64_t v29 = [(MPSGraphTensor *)v14 shape];
  if ([v29 count] == 1)
  {
  }
  else
  {
    id v30 = [(MPSGraphTensor *)v13 shape];
    uint64_t v31 = [v30 count];

    if (v31 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  id v32 = [MPSGraphConvolution2DWeightsGradientOp alloc];
  v38[0] = v12;
  v38[1] = v13;
  v38[2] = v14;
  id v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];
  id v34 = [(MPSGraphConvolution2DBaseOp *)v32 initWithGraph:self inputTensors:v33 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v15 name:v16];

  id v35 = [(MPSGraphOperation *)v34 outputTensors];
  id v36 = [v35 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v36;
}

- (MPSGraphTensor)convolution2DWeightsGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradient sourceTensor:(MPSGraphTensor *)source outputShape:(MPSShape *)outputShape forwardConvolutionDescriptor:(MPSGraphConvolution2DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v12 = incomingGradient;
  id v13 = source;
  id v14 = outputShape;
  id v15 = forwardConvolutionDescriptor;
  id v16 = name;
  [(MPSShape *)v14 count];
  if ([(MPSShape *)v14 count] != 4 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  unint64_t v17 = 0;
  long long v23 = xmmword_18112A9B0;
  while (v17 < [(MPSShape *)v14 count])
  {
    uint64_t v18 = [(MPSShape *)v14 objectAtIndexedSubscript:v17];
    *((_DWORD *)&v23 + v17) = [v18 intValue];

    ++v17;
  }
  id v19 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v23 length:16];
  id v20 = [(MPSGraph *)self constantWithData:v19 shape:&unk_1EC9F1BE0 dataType:32];

  uint64_t v21 = [(MPSGraph *)self convolution2DWeightsGradientWithIncomingGradientTensor:v12 sourceTensor:v13 outputShapeTensor:v20 forwardConvolutionDescriptor:v15 name:v16];

  return (MPSGraphTensor *)v21;
}

- (MPSGraphTensor)convolution3DWithSourceTensor:(MPSGraphTensor *)source weightsTensor:(MPSGraphTensor *)weights descriptor:(MPSGraphConvolution3DOpDescriptor *)descriptor name:(NSString *)name
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v10 = source;
  id v11 = weights;
  id v12 = descriptor;
  id v13 = name;
  id v14 = [(MPSGraphTensor *)v10 shape];
  if ([v14 count] != 5)
  {
    id v15 = [(MPSGraphTensor *)v10 shape];
    [v15 count];
  }
  id v16 = [(MPSGraphTensor *)v10 shape];
  if ([v16 count] == 5)
  {
  }
  else
  {
    unint64_t v17 = [(MPSGraphTensor *)v10 shape];
    uint64_t v18 = [v17 count];

    if (v18 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  id v19 = [(MPSGraphTensor *)v11 shape];
  if ([v19 count] != 5)
  {
    id v20 = [(MPSGraphTensor *)v11 shape];
    [v20 count];
  }
  uint64_t v21 = [(MPSGraphTensor *)v11 shape];
  if ([v21 count] == 5)
  {
  }
  else
  {
    id v22 = [(MPSGraphTensor *)v11 shape];
    uint64_t v23 = [v22 count];

    if (v23 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  uint64_t v24 = [MPSGraphConvolution3DOp alloc];
  v30[0] = v10;
  v30[1] = v11;
  id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  uint64_t v26 = [(MPSGraphConvolution3DBaseOp *)v24 initWithGraph:self inputTensors:v25 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v12 name:v13];

  id v27 = [(MPSGraphOperation *)v26 outputTensors];
  uint64_t v28 = [v27 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v28;
}

- (MPSGraphTensor)convolution3DDataGradientWithIncomingGradientTensor:(MPSGraphTensor *)gradient weightsTensor:(MPSGraphTensor *)weights outputShapeTensor:(MPSGraphTensor *)outputShapeTensor forwardConvolutionDescriptor:(MPSGraphConvolution3DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name
{
  v33[3] = *MEMORY[0x1E4F143B8];
  id v12 = gradient;
  id v13 = weights;
  id v14 = outputShapeTensor;
  id v15 = forwardConvolutionDescriptor;
  id v16 = name;
  unint64_t v17 = [(MPSGraphTensor *)v12 shape];
  if ([v17 count] != 5)
  {
    uint64_t v18 = [(MPSGraphTensor *)v12 shape];
    [v18 count];
  }
  id v19 = [(MPSGraphTensor *)v12 shape];
  if ([v19 count] == 5)
  {
  }
  else
  {
    id v20 = [(MPSGraphTensor *)v12 shape];
    uint64_t v21 = [v20 count];

    if (v21 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  id v22 = [(MPSGraphTensor *)v13 shape];
  if ([v22 count] != 5)
  {
    uint64_t v23 = [(MPSGraphTensor *)v13 shape];
    [v23 count];
  }
  uint64_t v24 = [(MPSGraphTensor *)v13 shape];
  if ([v24 count] == 5)
  {
  }
  else
  {
    id v25 = [(MPSGraphTensor *)v13 shape];
    uint64_t v26 = [v25 count];

    if (v26 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  id v27 = [MPSGraphConvolution3DDataGradientOp alloc];
  v33[0] = v12;
  v33[1] = v13;
  v33[2] = v14;
  uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
  uint64_t v29 = [(MPSGraphConvolution3DBaseOp *)v27 initWithGraph:self inputTensors:v28 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v15 name:v16];

  id v30 = [(MPSGraphOperation *)v29 outputTensors];
  uint64_t v31 = [v30 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v31;
}

- (MPSGraphTensor)convolution3DDataGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradient weightsTensor:(MPSGraphTensor *)weights outputShape:(MPSShape *)outputShape forwardConvolutionDescriptor:(MPSGraphConvolution3DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v12 = incomingGradient;
  id v13 = weights;
  id v14 = outputShape;
  id v15 = forwardConvolutionDescriptor;
  id v16 = name;
  [(MPSShape *)v14 count];
  if ([(MPSShape *)v14 count] != 5 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  unint64_t v17 = 0;
  LODWORD(v24) = 1;
  long long v23 = xmmword_181133C68;
  while (v17 < [(MPSShape *)v14 count])
  {
    uint64_t v18 = [(MPSShape *)v14 objectAtIndexedSubscript:v17];
    *((_DWORD *)&v23 + v17) = [v18 intValue];

    ++v17;
  }
  id v19 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v23 length:20];
  id v20 = [(MPSGraph *)self constantWithData:v19 shape:&unk_1EC9F1BF8 dataType:536870944];

  uint64_t v21 = [(MPSGraph *)self convolution3DDataGradientWithIncomingGradientTensor:v12 weightsTensor:v13 outputShapeTensor:v20 forwardConvolutionDescriptor:v15 name:v16];

  return (MPSGraphTensor *)v21;
}

- (MPSGraphTensor)convolution3DWeightsGradientWithIncomingGradientTensor:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source outputShapeTensor:(MPSGraphTensor *)outputShapeTensor forwardConvolutionDescriptor:(MPSGraphConvolution3DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name
{
  v38[3] = *MEMORY[0x1E4F143B8];
  id v12 = gradient;
  id v13 = source;
  id v14 = outputShapeTensor;
  id v15 = forwardConvolutionDescriptor;
  id v16 = name;
  unint64_t v17 = [(MPSGraphTensor *)v12 shape];
  if ([v17 count] != 5)
  {
    uint64_t v18 = [(MPSGraphTensor *)v12 shape];
    [v18 count];
  }
  id v19 = [(MPSGraphTensor *)v12 shape];
  if ([v19 count] == 5)
  {
  }
  else
  {
    id v20 = [(MPSGraphTensor *)v12 shape];
    uint64_t v21 = [v20 count];

    if (v21 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  id v22 = [(MPSGraphTensor *)v13 shape];
  if ([v22 count] != 5)
  {
    long long v23 = [(MPSGraphTensor *)v13 shape];
    [v23 count];
  }
  uint64_t v24 = [(MPSGraphTensor *)v13 shape];
  if ([v24 count] == 5)
  {
  }
  else
  {
    uint64_t v25 = [(MPSGraphTensor *)v13 shape];
    uint64_t v26 = [v25 count];

    if (v26 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  id v27 = [(MPSGraphTensor *)v14 shape];
  if ([v27 count] != 1)
  {
    uint64_t v28 = [(MPSGraphTensor *)v13 shape];
    [v28 count];
  }
  uint64_t v29 = [(MPSGraphTensor *)v14 shape];
  if ([v29 count] == 1)
  {
  }
  else
  {
    id v30 = [(MPSGraphTensor *)v13 shape];
    uint64_t v31 = [v30 count];

    if (v31 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
  }
  id v32 = [MPSGraphConvolution3DWeightsGradientOp alloc];
  v38[0] = v12;
  v38[1] = v13;
  v38[2] = v14;
  id v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];
  id v34 = [(MPSGraphConvolution3DBaseOp *)v32 initWithGraph:self inputTensors:v33 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v15 name:v16];

  id v35 = [(MPSGraphOperation *)v34 outputTensors];
  id v36 = [v35 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v36;
}

- (MPSGraphTensor)convolution3DWeightsGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradient sourceTensor:(MPSGraphTensor *)source outputShape:(MPSShape *)outputShape forwardConvolutionDescriptor:(MPSGraphConvolution3DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v12 = incomingGradient;
  id v13 = source;
  id v14 = outputShape;
  id v15 = forwardConvolutionDescriptor;
  id v16 = name;
  [(MPSShape *)v14 count];
  if ([(MPSShape *)v14 count] != 5 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  unint64_t v17 = 0;
  LODWORD(v24) = 1;
  long long v23 = xmmword_181133C68;
  while (v17 < [(MPSShape *)v14 count])
  {
    uint64_t v18 = [(MPSShape *)v14 objectAtIndexedSubscript:v17];
    *((_DWORD *)&v23 + v17) = [v18 intValue];

    ++v17;
  }
  id v19 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v23 length:20];
  id v20 = [(MPSGraph *)self constantWithData:v19 shape:&unk_1EC9F1C10 dataType:536870944];

  uint64_t v21 = [(MPSGraph *)self convolution3DWeightsGradientWithIncomingGradientTensor:v12 sourceTensor:v13 outputShapeTensor:v20 forwardConvolutionDescriptor:v15 name:v16];

  return (MPSGraphTensor *)v21;
}

- (MPSGraphTensor)randomPhiloxStateTensorWithSeed:(NSUInteger)seed name:(NSString *)name
{
  uint64_t v6 = name;
  BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4F35858]) initPhiloxStateDescriptorWithSeed:seed];
  id v8 = (void *)[v7 state];
  id v9 = [(MPSGraph *)self randomPhiloxStateTensorWithCounterLow:*v8 counterHigh:v8[1] key:v8[2] name:v6];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)randomPhiloxStateTensorWithCounterLow:(NSUInteger)counterLow counterHigh:(NSUInteger)counterHigh key:(NSUInteger)key name:(NSString *)name
{
  id v10 = name;
  id v11 = [MPSGraphInitRandomPhiloxStateOp alloc];
  id v12 = [(MPSGraphInitRandomPhiloxStateOp *)v11 initWithGraph:self inputTensors:MEMORY[0x1E4F1CBF0] controlDependencies:MEMORY[0x1E4F1CBF0] counterLow:counterLow counterHigh:counterHigh key:key name:v10];
  id v13 = [(MPSGraphOperation *)v12 outputTensors];
  id v14 = [v13 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v14;
}

- (id)progressRandomStateTensor:(id)a3 forShape:(id)a4 name:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = malloc_type_malloc(4 * [v9 count], 0x100004052888210uLL);
  for (unint64_t i = 0; i < [v9 count]; ++i)
  {
    id v13 = [v9 objectAtIndexedSubscript:i];
    v11[i] = [v13 intValue];
  }
  id v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v11, 4 * objc_msgSend(v9, "count"));
  id v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  v20[0] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  unint64_t v17 = [(MPSGraph *)self constantWithData:v14 shape:v16 dataType:32];

  free(v11);
  uint64_t v18 = [(MPSGraph *)self progressRandomStateTensor:v8 forShapeTensor:v17 name:v10];

  return v18;
}

- (id)progressRandomStateTensor:(id)a3 forShapeTensor:(id)a4 name:(id)a5
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MPSGraphUpdateRandomStateOp alloc];
  v17[0] = v8;
  v17[1] = v9;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  id v13 = [(MPSGraphOperation *)v11 initWithGraph:self inputTensors:v12 controlDependencies:MEMORY[0x1E4F1CBF0] name:v10];

  id v14 = [(MPSGraphOperation *)v13 outputTensors];
  id v15 = [v14 objectAtIndexedSubscript:0];

  return v15;
}

- (MPSGraphTensor)randomTensorWithShape:(MPSShape *)shape descriptor:(MPSGraphRandomOpDescriptor *)descriptor name:(NSString *)name
{
  ++randomLayerSeed;
  uint64_t v5 = -[MPSGraph randomTensorWithShape:descriptor:seed:name:](self, "randomTensorWithShape:descriptor:seed:name:", shape, descriptor);

  return (MPSGraphTensor *)v5;
}

- (MPSGraphTensor)randomTensorWithShapeTensor:(MPSGraphTensor *)shapeTensor descriptor:(MPSGraphRandomOpDescriptor *)descriptor name:(NSString *)name
{
  id v8 = shapeTensor;
  id v9 = descriptor;
  id v10 = name;
  id v11 = [(MPSGraph *)self fixCastIntTensor:v8 toSignedness:1 name:v10];

  ++randomLayerSeed;
  id v12 = -[MPSGraph randomTensorWithShapeTensor:descriptor:seed:name:](self, "randomTensorWithShapeTensor:descriptor:seed:name:", v11, v9);

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)randomTensorWithShape:(MPSShape *)shape descriptor:(MPSGraphRandomOpDescriptor *)descriptor seed:(NSUInteger)seed name:(NSString *)name
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v10 = shape;
  id v11 = descriptor;
  id v12 = name;
  id v13 = malloc_type_malloc(4 * [(MPSShape *)v10 count], 0x100004052888210uLL);
  for (unint64_t i = 0; i < [(MPSShape *)v10 count]; ++i)
  {
    id v15 = [(MPSShape *)v10 objectAtIndexedSubscript:i];
    v13[i] = [v15 intValue];
  }
  id v16 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v13, 4 * -[MPSShape count](v10, "count"));
  unint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MPSShape count](v10, "count"));
  v22[0] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  id v19 = [(MPSGraph *)self constantWithData:v16 shape:v18 dataType:32];

  free(v13);
  id v20 = [(MPSGraph *)self randomTensorWithShapeTensor:v19 descriptor:v11 seed:seed name:v12];

  return (MPSGraphTensor *)v20;
}

- (MPSGraphTensor)randomTensorWithShapeTensor:(MPSGraphTensor *)shapeTensor descriptor:(MPSGraphRandomOpDescriptor *)descriptor seed:(NSUInteger)seed name:(NSString *)name
{
  void v33[4] = *MEMORY[0x1E4F143B8];
  id v10 = shapeTensor;
  id v11 = descriptor;
  id v12 = name;
  id v13 = [(MPSGraph *)self fixCastIntTensor:v10 toSignedness:1 name:v12];

  if (v12)
  {
    id v14 = [(NSString *)v12 stringByAppendingFormat:@"/state"];
  }
  else
  {
    id v14 = @"/randomUniform/state";
  }
  id v15 = [(MPSGraph *)self randomPhiloxStateTensorWithSeed:seed name:v14];
  if (v12) {

  }
  uint64_t v16 = [(MPSGraphRandomOpDescriptor *)v11 distribution];
  if (v16)
  {
    if (v16 == 1)
    {
      uint64_t v21 = [MPSGraphRandomNormalOp alloc];
      v31[0] = v15;
      v31[1] = v13;
      uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
      uint64_t v19 = [(MPSGraphRandomNormalOp *)v21 initWithGraph:self inputTensors:v18 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v11 name:v12];
    }
    else
    {
      if (v16 != 2)
      {
        id v22 = 0;
        goto LABEL_18;
      }
      unint64_t v17 = [MPSGraphRandomTruncatedNormalOp alloc];
      v32[0] = v15;
      v32[1] = v13;
      uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
      uint64_t v19 = [(MPSGraphRandomTruncatedNormalOp *)v17 initWithGraph:self inputTensors:v18 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v11 name:v12];
    }
    id v22 = (MPSGraphRandomUniformOp *)v19;
  }
  else
  {
    if (([(MPSGraphRandomOpDescriptor *)v11 dataType] & 0x10000000) != 0)
    {
      [(MPSGraphRandomOpDescriptor *)v11 min];
      uint64_t v20 = [(MPSGraph *)self constantWithScalar:268435488 dataType:v23];
      [(MPSGraphRandomOpDescriptor *)v11 max];
      [(MPSGraph *)self constantWithScalar:268435488 dataType:v24];
    }
    else
    {
      uint64_t v20 = [(MPSGraph *)self constantWithScalar:536870976 dataType:(double)[(MPSGraphRandomOpDescriptor *)v11 minInteger]];
      [(MPSGraph *)self constantWithScalar:536870976 dataType:(double)[(MPSGraphRandomOpDescriptor *)v11 maxInteger]];
    uint64_t v25 = };
    uint64_t v18 = (void *)v20;
    uint64_t v26 = [MPSGraphRandomUniformOp alloc];
    v33[0] = v15;
    v33[1] = v13;
    v33[2] = v18;
    v33[3] = v25;
    id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];
    id v22 = [(MPSGraphRandomUniformOp *)v26 initWithGraph:self inputTensors:v27 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v11 name:v12];
  }
LABEL_18:
  uint64_t v28 = [(MPSGraphOperation *)v22 outputTensors];
  uint64_t v29 = [v28 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v29;
}

- (NSArray)randomTensorWithShape:(MPSShape *)shape descriptor:(MPSGraphRandomOpDescriptor *)descriptor stateTensor:(MPSGraphTensor *)state name:(NSString *)name
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v10 = shape;
  id v11 = descriptor;
  id v12 = state;
  id v13 = name;
  id v14 = malloc_type_malloc(4 * [(MPSShape *)v10 count], 0x100004052888210uLL);
  for (unint64_t i = 0; i < [(MPSShape *)v10 count]; ++i)
  {
    uint64_t v16 = [(MPSShape *)v10 objectAtIndexedSubscript:i];
    v14[i] = [v16 intValue];
  }
  unint64_t v17 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v14, 4 * -[MPSShape count](v10, "count"));
  uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MPSShape count](v10, "count"));
  v23[0] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  uint64_t v20 = [(MPSGraph *)self constantWithData:v17 shape:v19 dataType:536870944];

  free(v14);
  uint64_t v21 = [(MPSGraph *)self randomTensorWithShapeTensor:v20 descriptor:v11 stateTensor:v12 name:v13];

  return (NSArray *)v21;
}

- (NSArray)randomTensorWithShapeTensor:(MPSGraphTensor *)shapeTensor descriptor:(MPSGraphRandomOpDescriptor *)descriptor stateTensor:(MPSGraphTensor *)state name:(NSString *)name
{
  v40[4] = *MEMORY[0x1E4F143B8];
  id v10 = shapeTensor;
  id v11 = descriptor;
  id v12 = state;
  id v13 = name;
  id v35 = [(MPSGraph *)self fixCastIntTensor:v10 toSignedness:1 name:v13];

  uint64_t v14 = [(MPSGraphRandomOpDescriptor *)v11 distribution];
  if (v14)
  {
    if (v14 == 1)
    {
      uint64_t v19 = [MPSGraphRandomNormalOp alloc];
      v38[0] = v12;
      v38[1] = v35;
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
      uint64_t v17 = [(MPSGraphRandomNormalOp *)v19 initWithGraph:self inputTensors:v16 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v11 name:v13];
    }
    else
    {
      if (v14 != 2)
      {
        uint64_t v20 = 0;
        goto LABEL_13;
      }
      id v15 = [MPSGraphRandomTruncatedNormalOp alloc];
      v39[0] = v12;
      v39[1] = v35;
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
      uint64_t v17 = [(MPSGraphRandomTruncatedNormalOp *)v15 initWithGraph:self inputTensors:v16 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v11 name:v13];
    }
    uint64_t v20 = (MPSGraphRandomUniformOp *)v17;
  }
  else
  {
    if (([(MPSGraphRandomOpDescriptor *)v11 dataType] & 0x10000000) != 0)
    {
      [(MPSGraphRandomOpDescriptor *)v11 min];
      uint64_t v18 = [(MPSGraph *)self constantWithScalar:268435488 dataType:v21];
      [(MPSGraphRandomOpDescriptor *)v11 max];
      [(MPSGraph *)self constantWithScalar:268435488 dataType:v22];
    }
    else
    {
      uint64_t v18 = [(MPSGraph *)self constantWithScalar:536870976 dataType:(double)[(MPSGraphRandomOpDescriptor *)v11 minInteger]];
      [(MPSGraph *)self constantWithScalar:536870976 dataType:(double)[(MPSGraphRandomOpDescriptor *)v11 maxInteger]];
    float v23 = };
    uint64_t v16 = (void *)v18;
    float v24 = [MPSGraphRandomUniformOp alloc];
    v40[0] = v12;
    v40[1] = v35;
    v40[2] = v18;
    v40[3] = v23;
    uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:4];
    uint64_t v20 = [(MPSGraphRandomUniformOp *)v24 initWithGraph:self inputTensors:v25 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v11 name:v13];
  }
LABEL_13:
  uint64_t v26 = [MPSGraphUpdateRandomStateOp alloc];
  v37[0] = v12;
  v37[1] = v35;
  id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
  uint64_t v28 = [(MPSGraphOperation *)v26 initWithGraph:self inputTensors:v27 controlDependencies:MEMORY[0x1E4F1CBF0] name:v13];

  uint64_t v29 = [(MPSGraphOperation *)v20 outputTensors];
  id v30 = [v29 objectAtIndexedSubscript:0];
  v36[0] = v30;
  uint64_t v31 = [(MPSGraphOperation *)v28 outputTensors];
  id v32 = [v31 objectAtIndexedSubscript:0];
  v36[1] = v32;
  id v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];

  return (NSArray *)v33;
}

- (MPSGraphTensor)randomUniformTensorWithShape:(MPSShape *)shape name:(NSString *)name
{
  ++randomLayerSeed;
  id v4 = -[MPSGraph randomUniformTensorWithShape:seed:name:](self, "randomUniformTensorWithShape:seed:name:", shape);

  return (MPSGraphTensor *)v4;
}

- (MPSGraphTensor)randomUniformTensorWithShapeTensor:(MPSGraphTensor *)shapeTensor name:(NSString *)name
{
  uint64_t v6 = shapeTensor;
  BOOL v7 = name;
  id v8 = [(MPSGraph *)self fixCastIntTensor:v6 toSignedness:1 name:v7];

  ++randomLayerSeed;
  id v9 = -[MPSGraph randomUniformTensorWithShapeTensor:seed:name:](self, "randomUniformTensorWithShapeTensor:seed:name:", v8);

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)randomUniformTensorWithShape:(MPSShape *)shape seed:(NSUInteger)seed name:(NSString *)name
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = shape;
  id v9 = name;
  id v10 = malloc_type_malloc(4 * [(MPSShape *)v8 count], 0x100004052888210uLL);
  for (unint64_t i = 0; i < [(MPSShape *)v8 count]; ++i)
  {
    id v12 = [(MPSShape *)v8 objectAtIndexedSubscript:i];
    v10[i] = [v12 intValue];
  }
  id v13 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v10, 4 * -[MPSShape count](v8, "count"));
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MPSShape count](v8, "count"));
  v19[0] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  uint64_t v16 = [(MPSGraph *)self constantWithData:v13 shape:v15 dataType:536870944];

  free(v10);
  uint64_t v17 = [(MPSGraph *)self randomUniformTensorWithShapeTensor:v16 seed:seed name:v9];

  return (MPSGraphTensor *)v17;
}

- (MPSGraphTensor)randomUniformTensorWithShapeTensor:(MPSGraphTensor *)shapeTensor seed:(NSUInteger)seed name:(NSString *)name
{
  v24[4] = *MEMORY[0x1E4F143B8];
  id v8 = shapeTensor;
  id v9 = name;
  id v10 = [(MPSGraph *)self fixCastIntTensor:v8 toSignedness:1 name:v9];

  if (v9)
  {
    id v11 = [(NSString *)v9 stringByAppendingFormat:@"/state"];
  }
  else
  {
    id v11 = @"/randomUniform/state";
  }
  id v12 = [(MPSGraph *)self randomPhiloxStateTensorWithSeed:seed name:v11];
  if (v9) {

  }
  id v13 = +[MPSGraphRandomOpDescriptor descriptorWithDistribution:0 dataType:268435488];
  if (([v13 dataType] & 0x10000000) != 0)
  {
    [v13 min];
    uint64_t v14 = [(MPSGraph *)self constantWithScalar:268435488 dataType:v15];
    [v13 max];
    [(MPSGraph *)self constantWithScalar:268435488 dataType:v16];
  }
  else
  {
    uint64_t v14 = -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870976, (double)[v13 minInteger]);
    -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870976, (double)[v13 maxInteger]);
  uint64_t v17 = };
  uint64_t v18 = [MPSGraphRandomUniformOp alloc];
  v24[0] = v12;
  v24[1] = v10;
  v24[2] = v14;
  v24[3] = v17;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
  uint64_t v20 = [(MPSGraphRandomUniformOp *)v18 initWithGraph:self inputTensors:v19 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v13 name:v9];

  float v21 = [(MPSGraphOperation *)v20 outputTensors];
  float v22 = [v21 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v22;
}

- (NSArray)randomUniformTensorWithShape:(MPSShape *)shape stateTensor:(MPSGraphTensor *)state name:(NSString *)name
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = shape;
  id v9 = state;
  id v10 = name;
  id v11 = malloc_type_malloc(4 * [(MPSShape *)v8 count], 0x100004052888210uLL);
  for (unint64_t i = 0; i < [(MPSShape *)v8 count]; ++i)
  {
    id v13 = [(MPSShape *)v8 objectAtIndexedSubscript:i];
    v11[i] = [v13 intValue];
  }
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v11, 4 * -[MPSShape count](v8, "count"));
  float v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MPSShape count](v8, "count"));
  v20[0] = v15;
  float v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  uint64_t v17 = [(MPSGraph *)self constantWithData:v14 shape:v16 dataType:32];

  free(v11);
  uint64_t v18 = [(MPSGraph *)self randomUniformTensorWithShapeTensor:v17 stateTensor:v9 name:v10];

  return (NSArray *)v18;
}

- (NSArray)randomUniformTensorWithShapeTensor:(MPSGraphTensor *)shapeTensor stateTensor:(MPSGraphTensor *)state name:(NSString *)name
{
  v31[4] = *MEMORY[0x1E4F143B8];
  id v8 = shapeTensor;
  id v27 = state;
  uint64_t v28 = name;
  uint64_t v26 = -[MPSGraph fixCastIntTensor:toSignedness:name:](self, "fixCastIntTensor:toSignedness:name:", v8, 1);

  id v9 = +[MPSGraphRandomOpDescriptor descriptorWithDistribution:0 dataType:268435488];
  if (([v9 dataType] & 0x10000000) != 0)
  {
    [v9 min];
    id v10 = [(MPSGraph *)self constantWithScalar:268435488 dataType:v11];
    [v9 max];
    [(MPSGraph *)self constantWithScalar:268435488 dataType:v12];
  }
  else
  {
    id v10 = -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870976, (double)[v9 minInteger]);
    -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", 536870976, (double)[v9 maxInteger]);
  uint64_t v25 = };
  id v13 = [MPSGraphRandomUniformOp alloc];
  v31[0] = v27;
  v31[1] = v26;
  void v31[2] = v10;
  v31[3] = v25;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
  float v15 = [(MPSGraphRandomUniformOp *)v13 initWithGraph:self inputTensors:v14 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v9 name:v28];

  float v16 = [MPSGraphUpdateRandomStateOp alloc];
  v30[0] = v27;
  v30[1] = v26;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  uint64_t v18 = [(MPSGraphOperation *)v16 initWithGraph:self inputTensors:v17 controlDependencies:MEMORY[0x1E4F1CBF0] name:v28];

  uint64_t v19 = [(MPSGraphOperation *)v15 outputTensors];
  uint64_t v20 = [v19 objectAtIndexedSubscript:0];
  v29[0] = v20;
  float v21 = [(MPSGraphOperation *)v18 outputTensors];
  float v22 = [v21 objectAtIndexedSubscript:0];
  v29[1] = v22;
  float v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];

  return (NSArray *)v23;
}

- (MPSGraphTensor)dropoutTensor:(MPSGraphTensor *)tensor rate:(double)rate name:(NSString *)name
{
  id v8 = tensor;
  id v9 = name;
  id v10 = [(MPSGraph *)self constantWithScalar:&unk_1EC9F1C28 shape:268435488 dataType:rate];
  uint64_t v11 = [(MPSGraphTensor *)v8 dataType];
  if (v9)
  {
    float v12 = [(NSString *)v9 stringByAppendingFormat:@"/cast"];
  }
  else
  {
    float v12 = @"dropout/cast";
  }
  id v13 = [(MPSGraph *)self castTensor:v10 toType:v11 name:v12];
  if (v9) {

  }
  uint64_t v14 = [(MPSGraph *)self dropoutTensor:v8 rateTensor:v13 name:v9];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)dropoutTensor:(MPSGraphTensor *)tensor rateTensor:(MPSGraphTensor *)rate name:(NSString *)name
{
  id v8 = tensor;
  id v9 = rate;
  id v10 = name;
  uint64_t v11 = v10;
  if (v10)
  {
    float v12 = [(NSString *)v10 stringByAppendingString:@"/shape"];
  }
  else
  {
    float v12 = @"dropout/shape";
  }
  uint64_t v31 = [(MPSGraph *)self shapeOfTensor:v8 name:v12];
  if (v11)
  {

    id v13 = [(NSString *)v11 stringByAppendingString:@"/randomUniform"];
  }
  else
  {
    id v13 = @"dropout/randomUniform";
  }
  uint64_t v14 = [(MPSGraph *)self randomUniformTensorWithShapeTensor:v31 name:v13];
  if (v11) {

  }
  uint64_t v15 = [(MPSGraphTensor *)v8 dataType];
  if (v11)
  {
    float v16 = [(NSString *)v11 stringByAppendingFormat:@"/randomUniform/cast"];
  }
  else
  {
    float v16 = @"dropout/randomUniform/cast";
  }
  uint64_t v17 = [(MPSGraph *)self castTensor:v14 toType:v15 name:v16];
  if (v11)
  {

    uint64_t v18 = [(NSString *)v11 stringByAppendingString:@"/greaterEqual"];
  }
  else
  {
    uint64_t v18 = @"dropout/greaterEqual";
  }
  uint64_t v19 = [(MPSGraph *)self greaterThanOrEqualToWithPrimaryTensor:v17 secondaryTensor:v9 name:v18];
  if (v11) {

  }
  uint64_t v20 = [(MPSGraphTensor *)v8 dataType];
  if (v11)
  {
    float v21 = [(NSString *)v11 stringByAppendingFormat:@"/randomUniform/cast"];
  }
  else
  {
    float v21 = @"dropout/randomUniform/cast";
  }
  float v22 = [(MPSGraph *)self castTensor:v19 toType:v20 name:v21];
  if (v11)
  {

    float v23 = [(NSString *)v11 stringByAppendingString:@"/reciprocal"];
  }
  else
  {
    float v23 = @"dropout/reciprocal";
  }
  float v24 = [(MPSGraph *)self reciprocalWithTensor:v9 name:v23];
  if (v11)
  {

    uint64_t v25 = [(NSString *)v11 stringByAppendingString:@"/multiplication"];
  }
  else
  {
    uint64_t v25 = @"dropout/multiplication";
  }
  uint64_t v26 = [(MPSGraph *)self multiplicationWithPrimaryTensor:v22 secondaryTensor:v24 name:v25];
  if (v11)
  {

    id v27 = [(NSString *)v11 stringByAppendingString:@"/multiplication_1"];
  }
  else
  {
    id v27 = @"dropout/multiplication_1";
  }
  uint64_t v28 = [(MPSGraph *)self multiplicationWithPrimaryTensor:v8 secondaryTensor:v26 name:v27];
  if (v11) {

  }
  return (MPSGraphTensor *)v28;
}

- (MPSGraphTensor)scatterNDWithUpdatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor shape:(MPSShape *)shape batchDimensions:(NSUInteger)batchDimensions name:(NSString *)name
{
  BOOL v7 = [(MPSGraph *)self scatterNDWithUpdatesTensor:updatesTensor indicesTensor:indicesTensor shape:shape batchDimensions:batchDimensions mode:0 name:name];

  return (MPSGraphTensor *)v7;
}

- (MPSGraphTensor)scatterNDWithUpdatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor shape:(MPSShape *)shape batchDimensions:(NSUInteger)batchDimensions mode:(MPSGraphScatterMode)mode name:(NSString *)name
{
  uint64_t v14 = updatesTensor;
  uint64_t v15 = indicesTensor;
  float v16 = shape;
  uint64_t v17 = name;
  double v18 = 0.0;
  if ((unint64_t)(mode - 2) <= 3) {
    double v18 = dbl_181133F88[mode - 2];
  }
  uint64_t v19 = [(MPSGraph *)self constantWithScalar:v16 shape:[(MPSGraphTensor *)v14 dataType] dataType:v18];
  uint64_t v20 = [(MPSGraph *)self scatterNDWithDataTensor:v19 updatesTensor:v14 indicesTensor:v15 batchDimensions:batchDimensions mode:mode name:v17];

  return (MPSGraphTensor *)v20;
}

- (MPSGraphTensor)scatterNDWithDataTensor:(MPSGraphTensor *)dataTensor updatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor batchDimensions:(NSUInteger)batchDimensions mode:(MPSGraphScatterMode)mode name:(NSString *)name
{
  v24[3] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = dataTensor;
  uint64_t v15 = updatesTensor;
  float v16 = indicesTensor;
  uint64_t v17 = name;
  double v18 = [MPSGraphScatterNDOp alloc];
  v24[0] = v14;
  v24[1] = v15;
  v24[2] = v16;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
  uint64_t v20 = [(MPSGraphScatterNDOp *)v18 initWithGraph:self inputTensors:v19 controlDependencies:MEMORY[0x1E4F1CBF0] batchDimensions:batchDimensions mode:mode name:v17];

  float v21 = [(MPSGraphOperation *)v20 outputTensors];
  float v22 = [v21 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v22;
}

- (id)scatterWithUpdatesTensor:(id)a3 indicesTensor:(id)a4 shape:(id)a5 axis:(int64_t)a6 name:(id)a7
{
  BOOL v7 = [(MPSGraph *)self scatterWithUpdatesTensor:a3 indicesTensor:a4 shape:a5 axis:a6 mode:0 name:a7];

  return v7;
}

- (id)scatterWithDataTensor:(id)a3 updatesTensor:(id)a4 indicesTensor:(id)a5 axis:(int64_t)a6 name:(id)a7
{
  BOOL v7 = [(MPSGraph *)self scatterWithDataTensor:a3 updatesTensor:a4 indicesTensor:a5 axis:a6 mode:0 name:a7];

  return v7;
}

- (MPSGraphTensor)scatterWithUpdatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor shape:(MPSShape *)shape axis:(NSInteger)axis mode:(MPSGraphScatterMode)mode name:(NSString *)name
{
  uint64_t v14 = updatesTensor;
  uint64_t v15 = indicesTensor;
  float v16 = shape;
  uint64_t v17 = name;
  double v18 = 0.0;
  if ((unint64_t)(mode - 2) <= 3) {
    double v18 = dbl_181133F88[mode - 2];
  }
  uint64_t v19 = [(MPSGraph *)self constantWithScalar:v16 shape:[(MPSGraphTensor *)v14 dataType] dataType:v18];
  uint64_t v20 = [(MPSGraph *)self scatterWithDataTensor:v19 updatesTensor:v14 indicesTensor:v15 axis:axis mode:mode name:v17];

  return (MPSGraphTensor *)v20;
}

- (MPSGraphTensor)scatterWithDataTensor:(MPSGraphTensor *)dataTensor updatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor axis:(NSInteger)axis mode:(MPSGraphScatterMode)mode name:(NSString *)name
{
  v25[4] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = dataTensor;
  uint64_t v15 = updatesTensor;
  float v16 = indicesTensor;
  uint64_t v17 = name;
  double v18 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)axis];
  uint64_t v19 = [MPSGraphScatterOp alloc];
  v25[0] = v14;
  v25[1] = v15;
  void v25[2] = v16;
  v25[3] = v18;
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
  float v21 = [(MPSGraphScatterOp *)v19 initWithGraph:self inputTensors:v20 controlDependencies:MEMORY[0x1E4F1CBF0] axis:axis mode:mode name:v17];

  float v22 = [(MPSGraphOperation *)v21 outputTensors];
  float v23 = [v22 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v23;
}

- (MPSGraphTensor)scatterAlongAxis:(NSInteger)axis withUpdatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor shape:(MPSShape *)shape mode:(MPSGraphScatterMode)mode name:(NSString *)name
{
  uint64_t v14 = updatesTensor;
  uint64_t v15 = indicesTensor;
  float v16 = shape;
  uint64_t v17 = name;
  double v18 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)axis];
  uint64_t v19 = [(MPSGraph *)self scatterAlongAxisTensor:v18 withUpdatesTensor:v14 indicesTensor:v15 shape:v16 mode:mode name:v17];

  return (MPSGraphTensor *)v19;
}

- (MPSGraphTensor)scatterAlongAxis:(NSInteger)axis withDataTensor:(MPSGraphTensor *)dataTensor updatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor mode:(MPSGraphScatterMode)mode name:(NSString *)name
{
  uint64_t v14 = dataTensor;
  uint64_t v15 = updatesTensor;
  float v16 = indicesTensor;
  uint64_t v17 = name;
  double v18 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)axis];
  uint64_t v19 = [(MPSGraph *)self scatterAlongAxisTensor:v18 withDataTensor:v14 updatesTensor:v15 indicesTensor:v16 mode:mode name:v17];

  return (MPSGraphTensor *)v19;
}

- (MPSGraphTensor)scatterAlongAxisTensor:(MPSGraphTensor *)axisTensor withUpdatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor shape:(MPSShape *)shape mode:(MPSGraphScatterMode)mode name:(NSString *)name
{
  uint64_t v14 = axisTensor;
  uint64_t v15 = updatesTensor;
  float v16 = indicesTensor;
  uint64_t v17 = shape;
  double v18 = name;
  double v19 = 0.0;
  if ((unint64_t)(mode - 2) <= 3) {
    double v19 = dbl_181133F88[mode - 2];
  }
  uint64_t v20 = [(MPSGraph *)self constantWithScalar:v17 shape:[(MPSGraphTensor *)v15 dataType] dataType:v19];
  float v21 = [(MPSGraph *)self scatterAlongAxisTensor:v14 withDataTensor:v20 updatesTensor:v15 indicesTensor:v16 mode:mode name:v18];

  return (MPSGraphTensor *)v21;
}

- (MPSGraphTensor)scatterAlongAxisTensor:(MPSGraphTensor *)axisTensor withDataTensor:(MPSGraphTensor *)dataTensor updatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor mode:(MPSGraphScatterMode)mode name:(NSString *)name
{
  v26[4] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = axisTensor;
  uint64_t v15 = dataTensor;
  float v16 = updatesTensor;
  uint64_t v17 = indicesTensor;
  double v18 = name;
  double v19 = [(MPSGraph *)self fixCastIntTensor:v14 toSignedness:1 name:v18];

  uint64_t v20 = [MPSGraphScatterAlongAxisOp alloc];
  v26[0] = v15;
  v26[1] = v16;
  void v26[2] = v17;
  void v26[3] = v19;
  float v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
  float v22 = [(MPSGraphScatterAlongAxisOp *)v20 initWithGraph:self inputTensors:v21 controlDependencies:MEMORY[0x1E4F1CBF0] mode:mode name:v18];

  float v23 = [(MPSGraphOperation *)v22 outputTensors];
  float v24 = [v23 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v24;
}

- (id)scatterAlongAxisWithUpdatesTensor:(id)a3 indicesTensor:(id)a4 shape:(id)a5 axis:(int64_t)a6 name:(id)a7
{
  BOOL v7 = [(MPSGraph *)self scatterAlongAxis:a6 withUpdatesTensor:a3 indicesTensor:a4 shape:a5 mode:0 name:a7];

  return v7;
}

- (id)scatterAlongAxisWithUpdatesTensor:(id)a3 indicesTensor:(id)a4 shape:(id)a5 axis:(int64_t)a6 mode:(int64_t)a7 name:(id)a8
{
  id v8 = [(MPSGraph *)self scatterAlongAxis:a6 withUpdatesTensor:a3 indicesTensor:a4 shape:a5 mode:a7 name:a8];

  return v8;
}

- (id)scatterAlongAxisWithDataTensor:(id)a3 updatesTensor:(id)a4 indicesTensor:(id)a5 axis:(int64_t)a6 name:(id)a7
{
  BOOL v7 = [(MPSGraph *)self scatterAlongAxis:a6 withDataTensor:a3 updatesTensor:a4 indicesTensor:a5 mode:0 name:a7];

  return v7;
}

- (id)scatterAlongAxisWithDataTensor:(id)a3 updatesTensor:(id)a4 indicesTensor:(id)a5 axis:(int64_t)a6 mode:(int64_t)a7 name:(id)a8
{
  id v8 = [(MPSGraph *)self scatterAlongAxis:a6 withDataTensor:a3 updatesTensor:a4 indicesTensor:a5 mode:a7 name:a8];

  return v8;
}

- (MPSGraphTensor)nonZeroIndicesOfTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = tensor;
  BOOL v7 = name;
  id v8 = [MPSGraphNonZeroOp alloc];
  v14[0] = v6;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v10 = [(MPSGraphOperation *)v8 initWithGraph:self inputTensors:v9 controlDependencies:MEMORY[0x1E4F1CBF0] name:v7];

  uint64_t v11 = [(MPSGraphOperation *)v10 outputTensors];
  float v12 = [v11 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)gatherNDWithUpdatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor batchDimensions:(NSUInteger)batchDimensions name:(NSString *)name
{
  void v21[2] = *MEMORY[0x1E4F143B8];
  id v10 = updatesTensor;
  uint64_t v11 = indicesTensor;
  float v12 = name;
  id v13 = v11;
  uint64_t v14 = v10;
  uint64_t v15 = [MPSGraphGatherNDOp alloc];
  v21[0] = v14;
  v21[1] = v13;
  float v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  uint64_t v17 = [(MPSGraphGatherNDOp *)v15 initWithGraph:self inputTensors:v16 controlDependencies:MEMORY[0x1E4F1CBF0] batchDimensions:batchDimensions name:v12];

  double v18 = [(MPSGraphOperation *)v17 outputTensors];
  double v19 = [v18 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v19;
}

- (MPSGraphTensor)gatherWithUpdatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor axis:(NSUInteger)axis batchDimensions:(NSUInteger)batchDimensions name:(NSString *)name
{
  void v22[3] = *MEMORY[0x1E4F143B8];
  float v12 = updatesTensor;
  id v13 = indicesTensor;
  uint64_t v14 = name;
  if (axis < batchDimensions) {
    __assert_rtn("-[MPSGraph(MPSGraphGatherOps) gatherWithUpdatesTensor:indicesTensor:axis:batchDimensions:name:]", "MPSGraphGatherOps.mm", 203, "0 && \"axis must be greater than or equal to the number of batch dimensions\"");
  }
  uint64_t v15 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)(uint64_t)axis];
  float v16 = [MPSGraphGatherOp alloc];
  v22[0] = v12;
  v22[1] = v13;
  void v22[2] = v15;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  double v18 = [(MPSGraphGatherOp *)v16 initWithGraph:self inputTensors:v17 controlDependencies:MEMORY[0x1E4F1CBF0] axis:axis batchDimensions:batchDimensions name:v14];

  double v19 = [(MPSGraphOperation *)v18 outputTensors];
  uint64_t v20 = [v19 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v20;
}

- (MPSGraphTensor)gatherAlongAxis:(NSInteger)axis withUpdatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor name:(NSString *)name
{
  id v10 = updatesTensor;
  uint64_t v11 = indicesTensor;
  float v12 = name;
  id v13 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)axis];
  uint64_t v14 = [(MPSGraph *)self gatherAlongAxisTensor:v13 withUpdatesTensor:v10 indicesTensor:v11 name:v12];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)gatherAlongAxisTensor:(MPSGraphTensor *)axisTensor withUpdatesTensor:(MPSGraphTensor *)updatesTensor indicesTensor:(MPSGraphTensor *)indicesTensor name:(NSString *)name
{
  void v21[3] = *MEMORY[0x1E4F143B8];
  id v10 = axisTensor;
  uint64_t v11 = updatesTensor;
  float v12 = indicesTensor;
  id v13 = name;
  uint64_t v14 = [(MPSGraph *)self fixCastIntTensor:v10 toSignedness:1 name:v13];

  uint64_t v15 = [MPSGraphGatherAlongAxisOp alloc];
  v21[0] = v11;
  v21[1] = v12;
  void v21[2] = v14;
  float v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
  uint64_t v17 = [(MPSGraphOperation *)v15 initWithGraph:self inputTensors:v16 controlDependencies:MEMORY[0x1E4F1CBF0] name:v13];

  double v18 = [(MPSGraphOperation *)v17 outputTensors];
  double v19 = [v18 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v19;
}

- (id)gatherAlongAxisWithUpdatesTensor:(id)a3 indicesTensor:(id)a4 axis:(int64_t)a5 name:(id)a6
{
  uint64_t v6 = [(MPSGraph *)self gatherAlongAxis:a5 withUpdatesTensor:a3 indicesTensor:a4 name:a6];

  return v6;
}

- (id)quantizedGatherWithUpdatesTensor:(id)a3 indicesTensor:(id)a4 scaleTensor:(id)a5 zeroPointTensor:(id)a6 minTensor:(id)a7 dequantDataType:(unsigned int)a8 axis:(unint64_t)a9 batchDimensions:(unint64_t)a10 name:(id)a11
{
  uint64_t v11 = *(void *)&a8;
  id v30 = a3;
  id v29 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a11;
  if (a9 < a10) {
    __assert_rtn("-[MPSGraph(MPSGraphQuantizedGatherOpsPrivate) quantizedGatherWithUpdatesTensor:indicesTensor:scaleTensor:zeroPointTensor:minTensor:dequantDataType:axis:batchDimensions:name:]", "MPSGraphGatherOps.mm", 407, "0 && \"axis must be greater than or equal to the number of batch dimensions\"");
  }
  uint64_t v21 = v11;
  float v22 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)a9];
  float v23 = [MEMORY[0x1E4F1CA48] array];
  [v23 addObject:v30];
  [v23 addObject:v29];
  [v23 addObject:v22];
  [v23 addObject:v17];
  if (v18) {
    [v23 addObject:v18];
  }
  if (v19) {
    [v23 addObject:v19];
  }
  float v24 = [MPSGraphQuantizedGatherOp alloc];
  uint64_t v25 = [(MPSGraphQuantizedGatherOp *)v24 initWithGraph:self inputTensors:v23 controlDependencies:MEMORY[0x1E4F1CBF0] hasZeroPoint:v18 != 0 hasMin:v19 != 0 dequantDataType:v21 axis:a9 batchDimensions:a10 name:v20];
  uint64_t v26 = [(MPSGraphOperation *)v25 outputTensors];
  id v27 = [v26 objectAtIndexedSubscript:0];

  return v27;
}

- (MPSGraphTensor)softMaxCrossEntropyWithSourceTensor:(MPSGraphTensor *)sourceTensor labelsTensor:(MPSGraphTensor *)labelsTensor axis:(NSInteger)axis reductionType:(MPSGraphLossReductionType)reductionType name:(NSString *)name
{
  uint64_t v11 = sourceTensor;
  uint64_t v40 = labelsTensor;
  NSInteger v41 = axis;
  float v12 = name;
  id v13 = v12;
  uint64_t v39 = v11;
  if (v12)
  {
    uint64_t v14 = [(NSString *)v12 stringByAppendingString:@"/reductionMaximum"];
  }
  else
  {
    uint64_t v14 = @"softMaxCrossEntropy/reductionMaximum";
  }
  uint64_t v15 = -[MPSGraph reductionMaximumWithTensor:axis:name:](self, "reductionMaximumWithTensor:axis:name:", v11, axis, v14, reductionType);
  if (v13) {

  }
  id v38 = v15;
  float v16 = [v15 operation];
  [v16 setStopGradient:1];

  if (v13)
  {
    id v17 = [(NSString *)v13 stringByAppendingString:@"/subtraction"];
  }
  else
  {
    id v17 = @"softMaxCrossEntropy/subtraction";
  }
  id v18 = [(MPSGraph *)self subtractionWithPrimaryTensor:v11 secondaryTensor:v15 name:v17];
  if (v13)
  {

    id v19 = [(NSString *)v13 stringByAppendingString:@"/exponent"];
  }
  else
  {
    id v19 = @"softMaxCrossEntropy/exponent";
  }
  uint64_t v20 = [(MPSGraph *)self exponentWithTensor:v18 name:v19];
  id v37 = (void *)v20;
  if (v13)
  {

    uint64_t v21 = [(NSString *)v13 stringByAppendingString:@"/reductionSum"];
  }
  else
  {
    uint64_t v21 = @"softMaxCrossEntropy/reductionSum";
  }
  float v22 = [(MPSGraph *)self reductionSumWithTensor:v20 axis:axis name:v21];
  if (v13)
  {

    float v23 = [(NSString *)v13 stringByAppendingString:@"/logarithm"];
  }
  else
  {
    float v23 = @"softMaxCrossEntropy/logarithm";
  }
  float v24 = [(MPSGraph *)self logarithmWithTensor:v22 name:v23];
  if (v13)
  {

    uint64_t v25 = [(NSString *)v13 stringByAppendingString:@"/subtraction2"];
  }
  else
  {
    uint64_t v25 = @"softMaxCrossEntropy/subtraction2";
  }
  uint64_t v26 = [(MPSGraph *)self subtractionWithPrimaryTensor:v18 secondaryTensor:v24 name:v25];
  if (v13)
  {

    id v27 = [(NSString *)v13 stringByAppendingString:@"/logarithm"];
  }
  else
  {
    id v27 = @"softMaxCrossEntropy/multiplication";
  }
  uint64_t v28 = [(MPSGraph *)self multiplicationWithPrimaryTensor:v26 secondaryTensor:v40 name:v27];
  if (v13)
  {

    id v29 = [(NSString *)v13 stringByAppendingString:@"/reductionSum_1"];
  }
  else
  {
    id v29 = @"softMaxCrossEntropy/reductionSum_1";
  }
  id v30 = [(MPSGraph *)self reductionSumWithTensor:v28 axis:axis name:v29];
  if (v13)
  {

    uint64_t v31 = [(NSString *)v13 stringByAppendingString:@"/negative"];
  }
  else
  {
    uint64_t v31 = @"softMaxCrossEntropy/negative";
  }
  id v32 = [(MPSGraph *)self negativeWithTensor:v30 name:v31];
  if (v13) {

  }
  id v33 = [(MPSGraph *)self lossReductionWithTensor:v32 reductionType:v36 axis:&v41 name:v13];

  return (MPSGraphTensor *)v33;
}

- (id)lossReductionWithTensor:(id)a3 reductionType:(unint64_t)a4 axis:(int64_t *)a5 name:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  float v12 = [v10 shape];
  uint64_t v13 = [v12 count];

  if (a5)
  {
    int64_t v14 = (v13 & (*a5 >> 63)) + *a5;
    if (a4 != 2)
    {
LABEL_3:
      if (a4 == 1)
      {
        uint64_t v15 = v13 - 1;
        if (v13 >= 1)
        {
          if (v11)
          {
            do
            {
              if (v14 != v15)
              {
                id v17 = [v11 stringByAppendingString:@"/lossReduction"];
                uint64_t v18 = [(MPSGraph *)self reductionSumWithTensor:v10 axis:v15 name:v17];

                id v10 = (id)v18;
              }
              BOOL v16 = v15-- <= 0;
            }
            while (!v16);
          }
          else
          {
            do
            {
              if (v14 != v15)
              {
                uint64_t v26 = [(MPSGraph *)self reductionSumWithTensor:v10 axis:v15 name:@"lossReduction"];

                id v10 = (id)v26;
              }
              BOOL v16 = v15-- <= 0;
            }
            while (!v16);
          }
        }
      }
      goto LABEL_22;
    }
  }
  else
  {
    int64_t v14 = v13;
    if (a4 != 2) {
      goto LABEL_3;
    }
  }
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v13 >= 1)
  {
    uint64_t v20 = 0;
    unsigned int v21 = 1;
    do
    {
      if (v14 != v20)
      {
        float v22 = [NSNumber numberWithUnsignedInt:v21 - 1];
        [v19 addObject:v22];
      }
      uint64_t v20 = v21++;
    }
    while (v13 > v20);
  }
  if (v11)
  {
    float v23 = [v11 stringByAppendingString:@"/lossReduction"];
  }
  else
  {
    float v23 = @"lossReduction";
  }
  uint64_t v24 = [(MPSGraph *)self meanOfTensor:v10 axes:v19 name:v23];

  if (v11) {
  id v10 = (id)v24;
  }
LABEL_22:

  return v10;
}

- (MPSGraphTensor)softMaxCrossEntropyGradientWithIncomingGradientTensor:(MPSGraphTensor *)gradientTensor sourceTensor:(MPSGraphTensor *)sourceTensor labelsTensor:(MPSGraphTensor *)labelsTensor axis:(NSInteger)axis reductionType:(MPSGraphLossReductionType)reductionType name:(NSString *)name
{
  uint64_t v13 = gradientTensor;
  int64_t v14 = sourceTensor;
  uint64_t v15 = labelsTensor;
  BOOL v16 = name;
  id v17 = v16;
  if (v16)
  {
    uint64_t v18 = [(NSString *)v16 stringByAppendingString:@"/softMax"];
  }
  else
  {
    uint64_t v18 = @"softMaxCrossEntropyGradient/softMax";
  }
  id v19 = [(MPSGraph *)self softMaxWithTensor:v14 axis:axis name:v18];
  if (v17)
  {

    uint64_t v20 = [(NSString *)v17 stringByAppendingString:@"/subtraction"];
  }
  else
  {
    uint64_t v20 = @"softMaxCrossEntropyGradient/subtraction";
  }
  unsigned int v21 = [(MPSGraph *)self subtractionWithPrimaryTensor:v19 secondaryTensor:v15 name:v20];
  if (v17)
  {

    float v22 = [(NSString *)v17 stringByAppendingString:@"/multiplication"];
  }
  else
  {
    float v22 = @"softMaxCrossEntropyGradient/multiplication";
  }
  float v23 = [(MPSGraph *)self multiplicationWithPrimaryTensor:v13 secondaryTensor:v21 name:v22];
  if (v17) {

  }
  return (MPSGraphTensor *)v23;
}

- (NSDictionary)gradientForPrimaryTensor:(MPSGraphTensor *)primaryTensor withTensors:(NSArray *)tensors name:(NSString *)name
{
  v47[1] = *(void **)MEMORY[0x1E4F143B8];
  id v8 = primaryTensor;
  id v9 = tensors;
  id v10 = name;
  id v11 = self;
  float v12 = v8;
  uint64_t v13 = v9;
  int64_t v14 = v10;
  uint64_t v15 = v12;
  uint64_t v39 = v15;
  BOOL v16 = v13;
  uint64_t v40 = v16;
  id v17 = v11;
  NSInteger v41 = v17;
  memset(v43, 0, sizeof(v43));
  int v44 = 1065353216;
  char v45 = 0;
  uint64_t v18 = @"gradient";
  id v38 = v14;
  if (v14) {
    uint64_t v18 = v14;
  }
  uint64_t v42 = v18;
  WeakRetained = (MPSGraphBlock *)objc_loadWeakRetained((id *)&v15->_parentBlock);
  Autodiff::recurseForUses((Autodiff *)&v39, WeakRetained, v15);
  uint64_t v46 = WeakRetained;
  v47[0] = &v46;
  unint64_t v20 = 0;
  unsigned int v21 = std::__hash_table<std::__hash_value_type<mlir::Operation *,std::unordered_map<void *,MPSGraphTensorData * {__strong}>>,std::__unordered_map_hasher<mlir::Operation *,std::__hash_value_type<mlir::Operation *,std::unordered_map<void *,MPSGraphTensorData * {__strong}>>,std::hash<mlir::Operation *>,std::equal_to<mlir::Operation *>,true>,std::__unordered_map_equal<mlir::Operation *,std::__hash_value_type<mlir::Operation *,std::unordered_map<void *,MPSGraphTensorData * {__strong}>>,std::equal_to<mlir::Operation *>,std::hash<mlir::Operation *>,true>,std::allocator<std::__hash_value_type<mlir::Operation *,std::unordered_map<void *,MPSGraphTensorData * {__strong}>>>>::__emplace_unique_key_args<mlir::Operation *,std::piecewise_construct_t const&,std::tuple<mlir::Operation * const&>,std::tuple<>>((uint64_t)v43, (uint64_t *)&v46, (uint64_t)&std::piecewise_construct, v47)+ 24;
  while (v20 < [(NSArray *)v40 count])
  {
    float v22 = [(NSArray *)v40 objectAtIndexedSubscript:v20];
    v47[0] = v22;
    float v23 = std::__hash_table<std::__hash_value_type<mlir::Operation *,std::unordered_map<void *,MPSGraphTensorData * {__strong}>>,std::__unordered_map_hasher<mlir::Operation *,std::__hash_value_type<mlir::Operation *,std::unordered_map<void *,MPSGraphTensorData * {__strong}>>,std::hash<mlir::Operation *>,std::equal_to<mlir::Operation *>,true>,std::__unordered_map_equal<mlir::Operation *,std::__hash_value_type<mlir::Operation *,std::unordered_map<void *,MPSGraphTensorData * {__strong}>>,std::equal_to<mlir::Operation *>,std::hash<mlir::Operation *>,true>,std::allocator<std::__hash_value_type<mlir::Operation *,std::unordered_map<void *,MPSGraphTensorData * {__strong}>>>>::find<mlir::Operation *>(v21, (uint64_t *)v47);

    if (!v23 || !*((unsigned char *)v23 + 48))
    {
      if (MTLReportFailureTypeEnabled()) {
        MTLReportFailure();
      }
    }
    ++v20;
  }
  v47[0] = &v39->super.super.isa;
  uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
  Autodiff::getFilledLike((Autodiff *)&v39, v39, 1.0, &cfstr_Initialgrad.isa);
  uint64_t v25 = (MPSGraphBlock *)objc_claimAutoreleasedReturnValue();
  uint64_t v46 = v25;
  uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];

  Autodiff::computeGradsForBlock((Autodiff *)&v39, WeakRetained, v24, v26);
  if (v45) {
    controlFlowPostAutodiff((Autodiff *)&v39);
  }

  id v27 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v28 = (MPSGraphBlock *)objc_loadWeakRetained((id *)&v15->_parentBlock);
  for (unint64_t i = 0; i < [(NSArray *)v16 count]; ++i)
  {
    id v30 = [(NSArray *)v16 objectAtIndexedSubscript:i];
    uint64_t v31 = Autodiff::getGradientOf((Autodiff *)&v39, v28, v30);

    if (!v31 && MTLReportFailureTypeEnabled())
    {
      id v37 = [(NSArray *)v16 objectAtIndexedSubscript:i];
      id v33 = [v37 operation];
      uint64_t v36 = [v33 name];
      MTLReportFailure();
    }
    id v32 = -[NSArray objectAtIndexedSubscript:](v16, "objectAtIndexedSubscript:", i, v36);
    [v27 setObject:v31 forKey:v32];
  }
  id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v27];

  Autodiff::~Autodiff((Autodiff *)&v39);

  return (NSDictionary *)v34;
}

- (id)gradientForPrimaryTensor:(id)a3 withSecondaryTensor:(id)a4 name:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15[0] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  float v12 = [(MPSGraph *)self gradientForPrimaryTensor:v8 withTensors:v11 name:v10];

  [v12 count];
  if ([v12 count] != 1 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  uint64_t v13 = [v12 objectForKeyedSubscript:v9];

  return v13;
}

- (id)callSymbolName:(id)a3 inputTensors:(id)a4 outputTypes:(id)a5 name:(id)a6
{
  uint64_t v6 = [(MPSGraph *)self callWithInputTensors:a4 outputTypes:a5 symbolName:a3 inliningOption:0 name:a6];

  return v6;
}

- (id)callWithInputTensors:(id)a3 outputTypes:(id)a4 symbolName:(id)a5 name:(id)a6
{
  uint64_t v6 = [(MPSGraph *)self callWithInputTensors:a3 outputTypes:a4 symbolName:a5 inliningOption:0 name:a6];

  return v6;
}

- (id)callWithInputTensors:(id)a3 outputTypes:(id)a4 symbolName:(id)a5 inliningOption:(unint64_t)a6 name:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  BOOL v16 = [MPSGraphCallOp alloc];
  id v17 = [(MPSGraphCallOp *)v16 initWithGraph:self inputTensors:v12 controlDependencies:MEMORY[0x1E4F1CBF0] outputTypes:v13 symbolName:v14 inliningOption:a6 name:v15];
  uint64_t v18 = [(MPSGraphOperation *)v17 outputTensors];

  return v18;
}

- (MPSGraphTensor)bandPartWithTensor:(MPSGraphTensor *)inputTensor numLower:(NSInteger)numLower numUpper:(NSInteger)numUpper name:(NSString *)name
{
  id v10 = inputTensor;
  id v11 = name;
  id v12 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)numLower];
  id v13 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)numUpper];
  id v14 = [(MPSGraph *)self bandPartWithTensor:v10 numLowerTensor:v12 numUpperTensor:v13 name:v11];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)bandPartWithTensor:(MPSGraphTensor *)inputTensor numLowerTensor:(MPSGraphTensor *)numLowerTensor numUpperTensor:(MPSGraphTensor *)numUpperTensor name:(NSString *)name
{
  void v19[3] = *MEMORY[0x1E4F143B8];
  id v10 = inputTensor;
  id v11 = numLowerTensor;
  id v12 = numUpperTensor;
  id v13 = name;
  id v14 = [MPSGraphBandPartOp alloc];
  v19[0] = v10;
  v19[1] = v11;
  void v19[2] = v12;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  BOOL v16 = [(MPSGraphOperation *)v14 initWithGraph:self inputTensors:v15 controlDependencies:MEMORY[0x1E4F1CBF0] name:v13];

  id v17 = [v16[3] objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v17;
}

- (MPSGraphTensor)convolutionTranspose2DWithSourceTensor:(MPSGraphTensor *)source weightsTensor:(MPSGraphTensor *)weights outputShape:(MPSShape *)outputShape descriptor:(MPSGraphConvolution2DOpDescriptor *)descriptor name:(NSString *)name
{
  BOOL v7 = [(MPSGraph *)self convolution2DDataGradientWithIncomingGradientTensor:source weightsTensor:weights outputShape:outputShape forwardConvolutionDescriptor:descriptor name:name];

  return (MPSGraphTensor *)v7;
}

- (MPSGraphTensor)convolutionTranspose2DWithSourceTensor:(MPSGraphTensor *)source weightsTensor:(MPSGraphTensor *)weights outputShapeTensor:(MPSGraphTensor *)outputShape descriptor:(MPSGraphConvolution2DOpDescriptor *)descriptor name:(NSString *)name
{
  BOOL v7 = [(MPSGraph *)self convolution2DDataGradientWithIncomingGradientTensor:source weightsTensor:weights outputShapeTensor:outputShape forwardConvolutionDescriptor:descriptor name:name];

  return (MPSGraphTensor *)v7;
}

- (MPSGraphTensor)convolutionTranspose2DDataGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradient weightsTensor:(MPSGraphTensor *)weights outputShape:(MPSShape *)outputShape forwardConvolutionDescriptor:(MPSGraphConvolution2DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name
{
  BOOL v7 = [(MPSGraph *)self convolution2DWithSourceTensor:incomingGradient weightsTensor:weights descriptor:forwardConvolutionDescriptor name:name];

  return (MPSGraphTensor *)v7;
}

- (MPSGraphTensor)convolutionTranspose2DDataGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradient weightsTensor:(MPSGraphTensor *)weights outputShapeTensor:(MPSGraphTensor *)outputShape forwardConvolutionDescriptor:(MPSGraphConvolution2DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name
{
  BOOL v7 = [(MPSGraph *)self convolution2DWithSourceTensor:incomingGradient weightsTensor:weights descriptor:forwardConvolutionDescriptor name:name];

  return (MPSGraphTensor *)v7;
}

- (MPSGraphTensor)convolutionTranspose2DWeightsGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradientTensor sourceTensor:(MPSGraphTensor *)source outputShape:(MPSShape *)outputShape forwardConvolutionDescriptor:(MPSGraphConvolution2DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name
{
  BOOL v7 = [(MPSGraph *)self convolution2DWeightsGradientWithIncomingGradientTensor:source sourceTensor:incomingGradientTensor outputShape:outputShape forwardConvolutionDescriptor:forwardConvolutionDescriptor name:name];

  return (MPSGraphTensor *)v7;
}

- (MPSGraphTensor)convolutionTranspose2DWeightsGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradientTensor sourceTensor:(MPSGraphTensor *)source outputShapeTensor:(MPSGraphTensor *)outputShape forwardConvolutionDescriptor:(MPSGraphConvolution2DOpDescriptor *)forwardConvolutionDescriptor name:(NSString *)name
{
  BOOL v7 = [(MPSGraph *)self convolution2DWeightsGradientWithIncomingGradientTensor:source sourceTensor:incomingGradientTensor outputShapeTensor:outputShape forwardConvolutionDescriptor:forwardConvolutionDescriptor name:name];

  return (MPSGraphTensor *)v7;
}

- (id)cropResizeWithImagesTensor:(id)a3 boxesTensor:(id)a4 boxIndicesTensor:(id)a5 descriptor:(id)a6 name:(id)a7
{
  void v34[2] = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v33 = a4;
  id v12 = a5;
  id v31 = a6;
  id v13 = a7;
  id v14 = v12;
  LODWORD(a7) = [v14 dataType];
  if (a7 == [v33 dataType])
  {
    id v32 = v14;
    if (!v13)
    {
      id v15 = @"cropResize/expand";
      char v16 = 1;
      id v32 = v14;
      [(MPSGraph *)self expandTensor:v14 dimension:1 name:@"cropResize/expand"];
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v17 = [v33 dataType];
    if (v13)
    {
      uint64_t v18 = [v13 stringByAppendingString:@"/cast"];
    }
    else
    {
      uint64_t v18 = @"cropResize/cast";
    }
    id v32 = [(MPSGraph *)self castTensor:v14 toType:v17 name:v18];

    if (!v13)
    {
      id v15 = @"cropResize/expand";
      char v16 = 1;
      goto LABEL_11;
    }
  }
  id v15 = [v13 stringByAppendingString:@"/expand"];
  char v16 = 0;
LABEL_11:
  [(MPSGraph *)self expandTensor:v32 dimension:1 name:v15];
  id v19 = LABEL_12:;
  if (v16)
  {
    unint64_t v20 = @"cropResize/concat1";
  }
  else
  {

    unint64_t v20 = [v13 stringByAppendingString:@"/concat1"];
  }
  unsigned int v21 = [(MPSGraph *)self concatTensor:v19 withTensor:v33 dimension:1 name:v20];
  if ((v16 & 1) == 0) {

  }
  float v22 = [MPSGraphCropResizeOp alloc];
  v34[0] = v30;
  v34[1] = v21;
  float v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  uint64_t v24 = [(MPSGraphCropResizeOp *)v22 initWithGraph:self inputTensors:v23 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v31 name:v13];

  uint64_t v25 = [(MPSGraphOperation *)v24 outputTensors];
  uint64_t v26 = [v25 objectAtIndexedSubscript:0];
  if (v16)
  {
    id v27 = @"cropResize/reshape0";
  }
  else
  {
    id v27 = [v13 stringByAppendingString:@"/reshape0"];
  }
  uint64_t v28 = [(MPSGraph *)self squeezeTensor:v26 dimension:1 name:v27];
  if ((v16 & 1) == 0) {

  }
  return v28;
}

- (MPSGraphTensor)maxPooling2DWithSourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling2DOpDescriptor *)descriptor name:(NSString *)name
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = source;
  id v9 = name;
  id v10 = (void *)[(MPSGraphPooling2DOpDescriptor *)descriptor copy];
  if ([v10 dataLayout]) {
    uint64_t v11 = 3;
  }
  else {
    uint64_t v11 = 2;
  }
  [v10 setReturnIndicesMode:v11];
  id v12 = [MPSGraphMaxWithIndicesPooling2DOp alloc];
  v18[0] = v8;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  id v14 = [(MPSGraphPooling2DBaseOp *)v12 initWithGraph:self inputTensors:v13 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v10 name:v9];

  id v15 = [(MPSGraphOperation *)v14 outputTensors];
  char v16 = [v15 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v16;
}

- (NSArray)maxPooling2DReturnIndicesWithSourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling2DOpDescriptor *)descriptor name:(NSString *)name
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = source;
  id v9 = descriptor;
  id v10 = name;
  uint64_t v11 = [MPSGraphMaxWithIndicesPooling2DOp alloc];
  v16[0] = v8;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v13 = [(MPSGraphPooling2DBaseOp *)v11 initWithGraph:self inputTensors:v12 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v9 name:v10];

  id v14 = [(MPSGraphOperation *)v13 outputTensors];

  return (NSArray *)v14;
}

- (MPSGraphTensor)avgPooling2DWithSourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling2DOpDescriptor *)descriptor name:(NSString *)name
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = source;
  id v9 = descriptor;
  id v10 = name;
  uint64_t v11 = [MPSGraphAvgPooling2DOp alloc];
  v17[0] = v8;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  id v13 = [(MPSGraphPooling2DBaseOp *)v11 initWithGraph:self inputTensors:v12 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v9 name:v10];

  id v14 = [(MPSGraphOperation *)v13 outputTensors];
  id v15 = [v14 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v15;
}

- (MPSGraphTensor)maxPooling2DGradientWithGradientTensor:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling2DOpDescriptor *)descriptor name:(NSString *)name
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  id v10 = gradient;
  uint64_t v11 = source;
  id v12 = descriptor;
  id v13 = name;
  id v14 = [MPSGraphMaxPooling2DGradientOp alloc];
  v20[0] = v10;
  v20[1] = v11;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  char v16 = [(MPSGraphMaxPooling2DGradientOp *)v14 initWithGraph:self inputTensors:v15 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v12 gradientWithIndices:0 name:v13];

  uint64_t v17 = [(MPSGraphOperation *)v16 outputTensors];
  uint64_t v18 = [v17 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v18;
}

- (MPSGraphTensor)maxPooling2DGradientWithGradientTensor:(MPSGraphTensor *)gradient indicesTensor:(MPSGraphTensor *)indices outputShape:(MPSShape *)outputShape descriptor:(MPSGraphPooling2DOpDescriptor *)descriptor name:(NSString *)name
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = gradient;
  id v13 = indices;
  id v14 = outputShape;
  id v15 = descriptor;
  char v16 = name;
  unint64_t v17 = [(MPSShape *)v14 count];
  uint64_t v18 = 4;
  if (v17 < 4) {
    uint64_t v18 = v17;
  }
  if (v18)
  {
    id v19 = [(MPSShape *)v14 objectAtIndexedSubscript:0];
    LODWORD(v33) = [v19 intValue];

    unint64_t v20 = [(MPSShape *)v14 count];
    unint64_t v21 = 4;
    if (v20 < 4) {
      unint64_t v21 = v20;
    }
    if (v21 >= 2)
    {
      float v22 = [(MPSShape *)v14 objectAtIndexedSubscript:1];
      HIDWORD(v33) = [v22 intValue];

      unint64_t v23 = [(MPSShape *)v14 count];
      unint64_t v24 = 4;
      if (v23 < 4) {
        unint64_t v24 = v23;
      }
      if (v24 >= 3)
      {
        uint64_t v25 = [(MPSShape *)v14 objectAtIndexedSubscript:2];
        int v34 = [v25 intValue];

        unint64_t v26 = [(MPSShape *)v14 count];
        unint64_t v27 = 4;
        if (v26 < 4) {
          unint64_t v27 = v26;
        }
        if (v27 >= 4)
        {
          uint64_t v28 = [(MPSShape *)v14 objectAtIndexedSubscript:3];
          int v35 = [v28 intValue];

          [(MPSShape *)v14 count];
        }
      }
    }
  }
  id v29 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v33 length:16];
  id v30 = [(MPSGraph *)self constantWithData:v29 shape:&unk_1EC9F1CB8 dataType:536870944];

  id v31 = [(MPSGraph *)self maxPooling2DGradientWithGradientTensor:v12 indicesTensor:v13 outputShapeTensor:v30 descriptor:v15 name:v16];

  return (MPSGraphTensor *)v31;
}

- (MPSGraphTensor)maxPooling2DGradientWithGradientTensor:(MPSGraphTensor *)gradient indicesTensor:(MPSGraphTensor *)indices outputShapeTensor:(MPSGraphTensor *)outputShape descriptor:(MPSGraphPooling2DOpDescriptor *)descriptor name:(NSString *)name
{
  void v29[3] = *MEMORY[0x1E4F143B8];
  id v12 = gradient;
  id v13 = indices;
  id v14 = outputShape;
  id v15 = descriptor;
  char v16 = name;
  uint64_t v17 = [(MPSGraphPooling2DOpDescriptor *)v15 dataLayout];
  uint64_t v18 = [(MPSGraphPooling2DOpDescriptor *)v15 returnIndicesMode];
  id v19 = v15;
  if ([(MPSGraphPooling2DOpDescriptor *)v19 dilationRateInX] == 1)
  {
    BOOL v20 = [(MPSGraphPooling2DOpDescriptor *)v19 dilationRateInY] == 1;
    if (!v17)
    {
LABEL_3:
      uint64_t v21 = 2;
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v20 = 0;
    if (!v17) {
      goto LABEL_3;
    }
  }
  if (v17 == 1)
  {
    uint64_t v21 = 3;
LABEL_7:
    BOOL v22 = v18 == v21 && v20;

    if (v22) {
      goto LABEL_11;
    }
    goto LABEL_15;
  }

LABEL_15:
  if (MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
LABEL_11:
  unint64_t v23 = [MPSGraphMaxPooling2DGradientOp alloc];
  v29[0] = v12;
  v29[1] = v13;
  void v29[2] = v14;
  unint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:3];
  uint64_t v25 = [(MPSGraphMaxPooling2DGradientOp *)v23 initWithGraph:self inputTensors:v24 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v19 gradientWithIndices:1 name:v16];

  unint64_t v26 = [(MPSGraphOperation *)v25 outputTensors];
  unint64_t v27 = [v26 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v27;
}

- (MPSGraphTensor)avgPooling2DGradientWithGradientTensor:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling2DOpDescriptor *)descriptor name:(NSString *)name
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  id v10 = gradient;
  uint64_t v11 = source;
  id v12 = descriptor;
  id v13 = name;
  id v14 = [MPSGraphAvgPooling2DGradientOp alloc];
  v20[0] = v10;
  v20[1] = v11;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  char v16 = [(MPSGraphPooling2DBaseOp *)v14 initWithGraph:self inputTensors:v15 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v12 name:v13];

  uint64_t v17 = [(MPSGraphOperation *)v16 outputTensors];
  uint64_t v18 = [v17 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v18;
}

- (MPSGraphTensor)maxPooling4DWithSourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling4DOpDescriptor *)descriptor name:(NSString *)name
{
  v26[1] = *MEMORY[0x1E4F143B8];
  uint64_t v25 = source;
  id v8 = name;
  id v9 = (void *)[(MPSGraphPooling4DOpDescriptor *)descriptor copy];
  id v10 = [v9 kernelSizes];
  uint64_t v11 = [v10 objectAtIndexedSubscript:0];
  if ([v11 intValue] == 1)
  {
    id v12 = [v9 kernelSizes];
    id v13 = [v12 objectAtIndexedSubscript:1];
    if ([v13 intValue] == 1)
    {
      unint64_t v24 = [v9 strides];
      id v14 = [v24 objectAtIndexedSubscript:0];
      if ([v14 intValue] == 1)
      {
        unint64_t v23 = [v9 strides];
        id v15 = [v23 objectAtIndexedSubscript:1];
        if ([v15 intValue] == 1) {
          uint64_t v16 = 2;
        }
        else {
          uint64_t v16 = 3;
        }
      }
      else
      {
        uint64_t v16 = 3;
      }
    }
    else
    {
      uint64_t v16 = 3;
    }
  }
  else
  {
    uint64_t v16 = 3;
  }

  [v9 setReturnIndicesMode:v16];
  uint64_t v17 = [MPSGraphMaxWithIndicesPool4DOp alloc];
  v26[0] = v25;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  id v19 = [(MPSGraphPooling4DBaseOp *)v17 initWithGraph:self inputTensors:v18 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v9 name:v8];

  BOOL v20 = [(MPSGraphOperation *)v19 outputTensors];
  uint64_t v21 = [v20 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v21;
}

- (NSArray)maxPooling4DReturnIndicesWithSourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling4DOpDescriptor *)descriptor name:(NSString *)name
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = source;
  id v9 = descriptor;
  id v10 = name;
  uint64_t v11 = [MPSGraphMaxWithIndicesPool4DOp alloc];
  v16[0] = v8;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v13 = [(MPSGraphPooling4DBaseOp *)v11 initWithGraph:self inputTensors:v12 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v9 name:v10];

  id v14 = [(MPSGraphOperation *)v13 outputTensors];

  return (NSArray *)v14;
}

- (MPSGraphTensor)maxPooling4DGradientWithGradientTensor:(MPSGraphTensor *)gradient indicesTensor:(MPSGraphTensor *)indices outputShape:(MPSShape *)outputShape descriptor:(MPSGraphPooling4DOpDescriptor *)descriptor name:(NSString *)name
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = gradient;
  id v13 = indices;
  id v14 = outputShape;
  id v15 = descriptor;
  uint64_t v16 = name;
  unint64_t v17 = [(MPSShape *)v14 count];
  uint64_t v18 = 4;
  if (v17 < 4) {
    uint64_t v18 = v17;
  }
  if (v18)
  {
    id v19 = [(MPSShape *)v14 objectAtIndexedSubscript:0];
    LODWORD(v33) = [v19 intValue];

    unint64_t v20 = [(MPSShape *)v14 count];
    unint64_t v21 = 4;
    if (v20 < 4) {
      unint64_t v21 = v20;
    }
    if (v21 >= 2)
    {
      BOOL v22 = [(MPSShape *)v14 objectAtIndexedSubscript:1];
      HIDWORD(v33) = [v22 intValue];

      unint64_t v23 = [(MPSShape *)v14 count];
      unint64_t v24 = 4;
      if (v23 < 4) {
        unint64_t v24 = v23;
      }
      if (v24 >= 3)
      {
        uint64_t v25 = [(MPSShape *)v14 objectAtIndexedSubscript:2];
        int v34 = [v25 intValue];

        unint64_t v26 = [(MPSShape *)v14 count];
        unint64_t v27 = 4;
        if (v26 < 4) {
          unint64_t v27 = v26;
        }
        if (v27 >= 4)
        {
          uint64_t v28 = [(MPSShape *)v14 objectAtIndexedSubscript:3];
          int v35 = [v28 intValue];

          [(MPSShape *)v14 count];
        }
      }
    }
  }
  id v29 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v33 length:16];
  id v30 = [(MPSGraph *)self constantWithData:v29 shape:&unk_1EC9F1CD0 dataType:536870944];

  id v31 = [(MPSGraph *)self maxPooling4DGradientWithGradientTensor:v12 indicesTensor:v13 outputShapeTensor:v30 descriptor:v15 name:0];

  return (MPSGraphTensor *)v31;
}

- (MPSGraphTensor)maxPooling4DGradientWithGradientTensor:(MPSGraphTensor *)gradient indicesTensor:(MPSGraphTensor *)indices outputShapeTensor:(MPSGraphTensor *)outputShape descriptor:(MPSGraphPooling4DOpDescriptor *)descriptor name:(NSString *)name
{
  v41[3] = *MEMORY[0x1E4F143B8];
  id v38 = gradient;
  id v37 = indices;
  uint64_t v39 = outputShape;
  uint64_t v11 = descriptor;
  uint64_t v40 = name;
  id v12 = [(MPSGraphPooling4DOpDescriptor *)v11 kernelSizes];
  id v13 = [v12 objectAtIndexedSubscript:0];
  if ([v13 intValue] == 1)
  {
    id v14 = [(MPSGraphPooling4DOpDescriptor *)v11 kernelSizes];
    id v15 = [v14 objectAtIndexedSubscript:1];
    if ([v15 intValue] == 1)
    {
      uint64_t v16 = [(MPSGraphPooling4DOpDescriptor *)v11 strides];
      unint64_t v17 = [v16 objectAtIndexedSubscript:0];
      if ([v17 intValue] == 1)
      {
        uint64_t v18 = [(MPSGraphPooling4DOpDescriptor *)v11 strides];
        id v19 = [v18 objectAtIndexedSubscript:1];
        BOOL v20 = [v19 intValue] == 1;
      }
      else
      {
        BOOL v20 = 0;
      }
    }
    else
    {
      BOOL v20 = 0;
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  unint64_t v21 = [(MPSGraphPooling4DOpDescriptor *)v11 kernelSizes];
  BOOL v22 = [v21 objectAtIndexedSubscript:0];
  if ([v22 intValue] == 1)
  {
    unint64_t v23 = [(MPSGraphPooling4DOpDescriptor *)v11 kernelSizes];
    unint64_t v24 = [v23 objectAtIndexedSubscript:3];
    if ([v24 intValue] == 1)
    {
      uint64_t v25 = [(MPSGraphPooling4DOpDescriptor *)v11 strides];
      unint64_t v26 = [v25 objectAtIndexedSubscript:0];
      if ([v26 intValue] == 1)
      {
        int v35 = [(MPSGraphPooling4DOpDescriptor *)v11 strides];
        unint64_t v27 = [v35 objectAtIndexedSubscript:3];
        BOOL v28 = [v27 intValue] == 1;
      }
      else
      {
        BOOL v28 = 0;
      }
    }
    else
    {
      BOOL v28 = 0;
    }
  }
  else
  {
    BOOL v28 = 0;
  }

  if (!v20 && !v28 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  if ((isValidIndicesInput4D((MPSGraphTensorNamedDataLayout)!v20, [(MPSGraphPooling4DOpDescriptor *)v11 returnIndicesMode], v11) & 1) == 0&& MTLReportFailureTypeEnabled())
  {
    MTLReportFailure();
  }
  id v29 = [MPSGraphMaxPool4DGradientOp alloc];
  v41[0] = v38;
  v41[1] = v37;
  v41[2] = v39;
  id v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:3];
  id v31 = [(MPSGraphMaxPool4DGradientOp *)v29 initWithGraph:self inputTensors:v30 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v11 gradientWithIndices:1 name:v40];

  id v32 = [(MPSGraphOperation *)v31 outputTensors];
  uint64_t v33 = [v32 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v33;
}

- (MPSGraphTensor)maxPooling4DGradientWithGradientTensor:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling4DOpDescriptor *)descriptor name:(NSString *)name
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  id v10 = gradient;
  uint64_t v11 = source;
  id v12 = descriptor;
  id v13 = name;
  id v14 = [MPSGraphMaxPool4DGradientOp alloc];
  v20[0] = v10;
  v20[1] = v11;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  uint64_t v16 = [(MPSGraphMaxPool4DGradientOp *)v14 initWithGraph:self inputTensors:v15 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v12 gradientWithIndices:0 name:v13];

  unint64_t v17 = [(MPSGraphOperation *)v16 outputTensors];
  uint64_t v18 = [v17 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v18;
}

- (MPSGraphTensor)avgPooling4DWithSourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling4DOpDescriptor *)descriptor name:(NSString *)name
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = source;
  id v9 = descriptor;
  id v10 = name;
  uint64_t v11 = [MPSGraphAvgPool4DOp alloc];
  v17[0] = v8;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  id v13 = [(MPSGraphPooling4DBaseOp *)v11 initWithGraph:self inputTensors:v12 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v9 name:v10];

  id v14 = [(MPSGraphOperation *)v13 outputTensors];
  id v15 = [v14 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v15;
}

- (MPSGraphTensor)avgPooling4DGradientWithGradientTensor:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling4DOpDescriptor *)descriptor name:(NSString *)name
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  id v10 = gradient;
  uint64_t v11 = source;
  id v12 = descriptor;
  id v13 = name;
  id v14 = [MPSGraphAvgPool4DGradientOp alloc];
  v20[0] = v10;
  v20[1] = v11;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  uint64_t v16 = [(MPSGraphPooling4DBaseOp *)v14 initWithGraph:self inputTensors:v15 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v12 name:v13];

  unint64_t v17 = [(MPSGraphOperation *)v16 outputTensors];
  uint64_t v18 = [v17 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v18;
}

- (MPSGraphTensor)L2NormPooling4DWithSourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling4DOpDescriptor *)descriptor name:(NSString *)name
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = source;
  id v9 = descriptor;
  id v10 = name;
  uint64_t v11 = [MPSGraphL2NormPool4DOp alloc];
  v17[0] = v8;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  id v13 = [(MPSGraphPooling4DBaseOp *)v11 initWithGraph:self inputTensors:v12 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v9 name:v10];

  id v14 = [(MPSGraphOperation *)v13 outputTensors];
  id v15 = [v14 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v15;
}

- (MPSGraphTensor)L2NormPooling4DGradientWithGradientTensor:(MPSGraphTensor *)gradient sourceTensor:(MPSGraphTensor *)source descriptor:(MPSGraphPooling4DOpDescriptor *)descriptor name:(NSString *)name
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  id v10 = gradient;
  uint64_t v11 = source;
  id v12 = descriptor;
  id v13 = name;
  id v14 = [MPSGraphL2NormPool4DGradientOp alloc];
  v20[0] = v10;
  v20[1] = v11;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  uint64_t v16 = [(MPSGraphPooling4DBaseOp *)v14 initWithGraph:self inputTensors:v15 controlDependencies:MEMORY[0x1E4F1CBF0] descriptor:v12 name:v13];

  unint64_t v17 = [(MPSGraphOperation *)v16 outputTensors];
  uint64_t v18 = [v17 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v18;
}

- (MPSGraphTensor)castTensor:(MPSGraphTensor *)tensor toType:(MPSDataType)type name:(NSString *)name
{
  uint64_t v6 = *(void *)&type;
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = tensor;
  id v9 = name;
  id v10 = [MPSGraphCastOp alloc];
  v16[0] = v8;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v12 = [(MPSGraphCastOp *)v10 initWithGraph:self inputTensors:v11 controlDependencies:MEMORY[0x1E4F1CBF0] destType:v6 name:v9];

  id v13 = [(MPSGraphOperation *)v12 outputTensors];
  id v14 = [v13 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v14;
}

- (MPSGraphTensor)reinterpretCastTensor:(MPSGraphTensor *)tensor toType:(MPSDataType)type name:(NSString *)name
{
  uint64_t v6 = *(void *)&type;
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = tensor;
  id v9 = name;
  id v10 = [MPSGraphReinterpretCastOp alloc];
  v16[0] = v8;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v12 = [(MPSGraphReinterpretCastOp *)v10 initWithGraph:self inputTensors:v11 controlDependencies:MEMORY[0x1E4F1CBF0] destType:v6 name:v9];

  id v13 = [(MPSGraphOperation *)v12 outputTensors];
  id v14 = [v13 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v14;
}

- (id)transposeTensor:(id)a3 permute:(id)a4 name:(id)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  MPSShapeToVector<int>(v9, (char **)&__p);
  uint64_t v11 = v23 - (unsigned char *)__p;
  id v12 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
  id v13 = [NSNumber numberWithUnsignedInteger:v11 >> 2];
  v25[0] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  id v15 = [(MPSGraph *)self constantWithData:v12 shape:v14 dataType:536870944];

  uint64_t v16 = [MPSGraphPermuteOp alloc];
  v24[0] = v8;
  v24[1] = v15;
  unint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  uint64_t v18 = [(MPSGraphPermuteOp *)v16 initWithGraph:self inputTensors:v17 controlDependencies:MEMORY[0x1E4F1CBF0] permute:v9 name:v10];

  id v19 = [(MPSGraphOperation *)v18 outputTensors];
  BOOL v20 = [v19 objectAtIndexedSubscript:0];

  if (__p)
  {
    unint64_t v23 = __p;
    operator delete(__p);
  }

  return v20;
}

- (MPSGraphTensor)transposeTensor:(MPSGraphTensor *)tensor permutation:(NSArray *)permutation name:(NSString *)name
{
  uint64_t v5 = [(MPSGraph *)self transposeTensor:tensor permute:permutation name:name];

  return (MPSGraphTensor *)v5;
}

- (MPSGraphTensor)transposeTensor:(MPSGraphTensor *)tensor dimension:(NSUInteger)dimensionIndex withDimension:(NSUInteger)dimensionIndex2 name:(NSString *)name
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v10 = tensor;
  uint64_t v11 = name;
  if (dimensionIndex == dimensionIndex2)
  {
    id v12 = v10;
  }
  else
  {
    id v13 = [MPSGraphTransposeOp alloc];
    v18[0] = v10;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    id v15 = [(MPSGraphTransposeOp *)v13 initWithGraph:self inputTensors:v14 controlDependencies:MEMORY[0x1E4F1CBF0] dimension:dimensionIndex withDimension:dimensionIndex2 name:v11];

    uint64_t v16 = [(MPSGraphOperation *)v15 outputTensors];
    id v12 = [v16 objectAtIndexedSubscript:0];
  }

  return v12;
}

- (MPSGraphTensor)reshapeTensor:(MPSGraphTensor *)tensor withShapeTensor:(MPSGraphTensor *)shapeTensor name:(NSString *)name
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  id v8 = tensor;
  id v9 = shapeTensor;
  id v10 = name;
  uint64_t v11 = [(MPSGraph *)self fixCastIntTensor:v9 toSignedness:1 name:v10];

  id v12 = [MPSGraphReshapeOp alloc];
  v18[0] = v8;
  v18[1] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  id v14 = [(MPSGraphOperation *)v12 initWithGraph:self inputTensors:v13 controlDependencies:MEMORY[0x1E4F1CBF0] name:v10];

  id v15 = [(MPSGraphOperation *)v14 outputTensors];
  uint64_t v16 = [v15 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v16;
}

- (MPSGraphTensor)reshapeTensor:(MPSGraphTensor *)tensor withShape:(MPSShape *)shape name:(NSString *)name
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = tensor;
  id v9 = name;
  MPSShapeToVector<int>(shape, (char **)&__p);
  uint64_t v10 = v18 - (unsigned char *)__p;
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
  id v12 = [NSNumber numberWithUnsignedInteger:v10 >> 2];
  v19[0] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  id v14 = [(MPSGraph *)self constantWithData:v11 shape:v13 dataType:536870944];

  id v15 = [(MPSGraph *)self reshapeTensor:v8 withShapeTensor:v14 name:v9];

  if (__p)
  {
    uint64_t v18 = __p;
    operator delete(__p);
  }

  return (MPSGraphTensor *)v15;
}

- (MPSGraphTensor)sliceTensor:(MPSGraphTensor *)tensor dimension:(NSUInteger)dimensionIndex start:(NSInteger)start length:(NSInteger)length name:(NSString *)name
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v12 = tensor;
  id v13 = name;
  id v14 = [MPSGraphSliceOp alloc];
  v20[0] = v12;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  uint64_t v16 = [(MPSGraphSliceOp *)v14 initWithGraph:self inputTensors:v15 controlDependencies:MEMORY[0x1E4F1CBF0] dimension:dimensionIndex start:start length:length name:v13];

  unint64_t v17 = [(MPSGraphOperation *)v16 outputTensors];
  uint64_t v18 = [v17 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v18;
}

- (id)cropTensor:(id)a3 dimension:(unint64_t)a4 amount_before:(unint64_t)a5 amount_after:(unint64_t)a6 name:(id)a7
{
  void v21[2] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a7;
  id v14 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)a4];
  id v15 = [MPSGraphCropOp alloc];
  v21[0] = v12;
  v21[1] = v14;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  unint64_t v17 = [(MPSGraphCropOp *)v15 initWithGraph:self inputTensors:v16 controlDependencies:MEMORY[0x1E4F1CBF0] dimension_index:a4 amount_before:a5 amount_after:a6 name:v13];

  uint64_t v18 = [(MPSGraphOperation *)v17 outputTensors];
  id v19 = [v18 objectAtIndexedSubscript:0];

  return v19;
}

- (MPSGraphTensor)sliceTensor:(MPSGraphTensor *)tensor starts:(NSArray *)starts ends:(NSArray *)ends strides:(NSArray *)strides name:(NSString *)name
{
  LODWORD(v9) = 0;
  BOOL v7 = [(MPSGraph *)self sliceTensor:tensor starts:starts ends:ends strides:strides startMask:0 endMask:0 squeezeMask:v9 name:name];

  return (MPSGraphTensor *)v7;
}

- (MPSGraphTensor)sliceTensor:(MPSGraphTensor *)tensor starts:(NSArray *)starts ends:(NSArray *)ends strides:(NSArray *)strides startMask:(uint32_t)startMask endMask:(uint32_t)endMask squeezeMask:(uint32_t)squeezeMask name:(NSString *)name
{
  v46[1] = *MEMORY[0x1E4F143B8];
  int v34 = tensor;
  uint64_t v16 = ends;
  id v37 = strides;
  uint64_t v36 = name;
  uint64_t v33 = v16;
  MPSShapeToVector<int>(starts, (char **)&v42);
  MPSShapeToVector<int>(v16, (char **)&v40);
  MPSShapeToVector<int>(v37, (char **)&__p);
  int64_t v17 = v43 - (unsigned char *)v42;
  uint64_t v18 = (v43 - (unsigned char *)v42) >> 2;
  if ((v18 != (v41 - (unsigned char *)v40) >> 2 || v18 != (v39 - (unsigned char *)__p) >> 2)
    && MTLReportFailureTypeEnabled())
  {
    MTLReportFailure();
  }
  if ((v18 != (v41 - (unsigned char *)v40) >> 2 || v18 != (v39 - (unsigned char *)__p) >> 2)
    && MTLReportFailureTypeEnabled())
  {
    MTLReportFailure();
  }
  id v19 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v42 length:v17];
  BOOL v20 = [NSNumber numberWithUnsignedInteger:v18];
  v46[0] = v20;
  unint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
  int v35 = [(MPSGraph *)self constantWithData:v19 shape:v21 dataType:536870944];

  BOOL v22 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v40 length:v17];
  unint64_t v23 = [NSNumber numberWithUnsignedInteger:v18];
  char v45 = v23;
  unint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
  uint64_t v25 = [(MPSGraph *)self constantWithData:v22 shape:v24 dataType:536870944];

  unint64_t v26 = [MEMORY[0x1E4F1C9B8] dataWithBytes:__p length:v17];
  unint64_t v27 = [NSNumber numberWithUnsignedInteger:v18];
  int v44 = v27;
  BOOL v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
  id v29 = [(MPSGraph *)self constantWithData:v26 shape:v28 dataType:536870944];

  LODWORD(v32) = squeezeMask;
  id v30 = [(MPSGraph *)self sliceTensor:v34 startTensor:v35 endTensor:v25 strideTensor:v29 startMask:startMask endMask:endMask squeezeMask:v32 name:v36];

  if (__p)
  {
    uint64_t v39 = __p;
    operator delete(__p);
  }
  if (v40)
  {
    NSInteger v41 = v40;
    operator delete(v40);
  }
  if (v42)
  {
    uint64_t v43 = v42;
    operator delete(v42);
  }

  return (MPSGraphTensor *)v30;
}

- (id)sliceTensor:(id)a3 startTensor:(id)a4 endTensor:(id)a5 strideTensor:(id)a6 startMask:(unsigned int)a7 endMask:(unsigned int)a8 squeezeMask:(unsigned int)a9 name:(id)a10
{
  uint64_t v10 = *(void *)&a7;
  void v29[4] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a10;
  unint64_t v27 = v18;
  BOOL v20 = [MPSGraphStridedSliceOp alloc];
  v29[0] = v15;
  v29[1] = v16;
  void v29[2] = v17;
  void v29[3] = v18;
  unint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
  LOBYTE(v26) = 0;
  BOOL v22 = [(MPSGraphStridedSliceOp *)v20 initWithGraph:self inputTensors:v21 controlDependencies:MEMORY[0x1E4F1CBF0] startMask:v10 endMask:a8 shrinkAxisMask:a9 endIsSize:v26 name:v19];

  unint64_t v23 = [(MPSGraphOperation *)v22 outputTensors];
  unint64_t v24 = [v23 objectAtIndexedSubscript:0];

  return v24;
}

- (id)sliceTensor:(id)a3 startTensor:(id)a4 sizeTensor:(id)a5 squeezeMask:(unsigned int)a6 name:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  void v24[4] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1EC9F1CE8, [v14 dataType], 1.0);
  id v17 = [MPSGraphStridedSliceOp alloc];
  v24[0] = v12;
  v24[1] = v13;
  void v24[2] = v14;
  v24[3] = v16;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
  LOBYTE(v23) = 1;
  id v19 = [(MPSGraphStridedSliceOp *)v17 initWithGraph:self inputTensors:v18 controlDependencies:MEMORY[0x1E4F1CBF0] startMask:0 endMask:0 shrinkAxisMask:v8 endIsSize:v23 name:v15];

  BOOL v20 = [(MPSGraphOperation *)v19 outputTensors];
  unint64_t v21 = [v20 objectAtIndexedSubscript:0];

  return v21;
}

- (MPSGraphTensor)sliceGradientTensor:(MPSGraphTensor *)inputGradientTensor fwdInShapeTensor:(MPSGraphTensor *)fwdInShapeTensor starts:(NSArray *)starts ends:(NSArray *)ends strides:(NSArray *)strides name:(NSString *)name
{
  uint64_t v8 = -[MPSGraph sliceGradientTensor:fwdInShapeTensor:starts:ends:strides:startMask:endMask:squeezeMask:name:](self, "sliceGradientTensor:fwdInShapeTensor:starts:ends:strides:startMask:endMask:squeezeMask:name:", inputGradientTensor, fwdInShapeTensor, starts, ends, strides, 0, 0, name);

  return (MPSGraphTensor *)v8;
}

- (MPSGraphTensor)sliceGradientTensor:(MPSGraphTensor *)inputGradientTensor fwdInShapeTensor:(MPSGraphTensor *)fwdInShapeTensor starts:(NSArray *)starts ends:(NSArray *)ends strides:(NSArray *)strides startMask:(uint32_t)startMask endMask:(uint32_t)endMask squeezeMask:(uint32_t)squeezeMask name:(NSString *)name
{
  v50[1] = *MEMORY[0x1E4F143B8];
  uint64_t v39 = inputGradientTensor;
  id v17 = fwdInShapeTensor;
  id v18 = ends;
  id v19 = strides;
  NSInteger v41 = name;
  uint64_t v36 = v18;
  id v38 = v19;
  MPSShapeToVector<int>(starts, (char **)&v46);
  MPSShapeToVector<int>(v18, (char **)&v44);
  uint32_t v37 = startMask;
  MPSShapeToVector<int>(v19, (char **)&__p);
  int64_t v20 = v47 - (unsigned char *)v46;
  uint64_t v21 = (v47 - (unsigned char *)v46) >> 2;
  if ((v21 != (v45 - (unsigned char *)v44) >> 2 || v21 != (v43 - (unsigned char *)__p) >> 2)
    && MTLReportFailureTypeEnabled())
  {
    MTLReportFailure();
  }
  if ((v21 != (v45 - (unsigned char *)v44) >> 2 || v21 != (v43 - (unsigned char *)__p) >> 2)
    && MTLReportFailureTypeEnabled())
  {
    MTLReportFailure();
  }
  BOOL v22 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v46 length:v20];
  uint64_t v23 = [NSNumber numberWithUnsignedInteger:v21];
  v50[0] = v23;
  unint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
  uint64_t v40 = [(MPSGraph *)self constantWithData:v22 shape:v24 dataType:536870944];

  uint64_t v25 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v44 length:v20];
  uint64_t v26 = [NSNumber numberWithUnsignedInteger:v21];
  id v49 = v26;
  unint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
  BOOL v28 = [(MPSGraph *)self constantWithData:v25 shape:v27 dataType:536870944];

  id v29 = [MEMORY[0x1E4F1C9B8] dataWithBytes:__p length:v20];
  id v30 = [NSNumber numberWithUnsignedInteger:v21];
  unint64_t v48 = v30;
  id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
  uint64_t v32 = [(MPSGraph *)self constantWithData:v29 shape:v31 dataType:536870944];

  uint64_t v33 = [(MPSGraph *)self fixCastIntTensor:v17 toSignedness:1 name:v41];

  int v34 = -[MPSGraph sliceGradientTensor:fwdInShapeTensor:startTensor:endTensor:strideTensor:startMask:endMask:squeezeMask:name:](self, "sliceGradientTensor:fwdInShapeTensor:startTensor:endTensor:strideTensor:startMask:endMask:squeezeMask:name:", v39, v33, v40, v28, v32, v37, __PAIR64__(squeezeMask, endMask), v41);

  if (__p)
  {
    uint64_t v43 = __p;
    operator delete(__p);
  }
  if (v44)
  {
    char v45 = v44;
    operator delete(v44);
  }
  if (v46)
  {
    uint64_t v47 = v46;
    operator delete(v46);
  }

  return (MPSGraphTensor *)v34;
}

- (id)sliceGradientTensor:(id)a3 fwdInShapeTensor:(id)a4 startTensor:(id)a5 endTensor:(id)a6 strideTensor:(id)a7 startMask:(unsigned int)a8 endMask:(unsigned int)a9 squeezeMask:(unsigned int)a10 name:(id)a11
{
  v32[5] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a11;
  id v29 = v19;
  id v30 = v20;
  BOOL v22 = [MPSGraphStridedSliceGradientOp alloc];
  v32[0] = v16;
  v32[1] = v17;
  void v32[2] = v18;
  v32[3] = v19;
  v32[4] = v20;
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:5];
  LOBYTE(v28) = 0;
  unint64_t v24 = [(MPSGraphStridedSliceGradientOp *)v22 initWithGraph:self inputTensors:v23 controlDependencies:MEMORY[0x1E4F1CBF0] startMask:a8 endMask:a9 shrinkAxisMask:a10 endIsSize:v28 name:v21];

  uint64_t v25 = [(MPSGraphOperation *)v24 outputTensors];
  uint64_t v26 = [v25 objectAtIndexedSubscript:0];

  return v26;
}

- (id)sliceGradientTensor:(id)a3 fwdInShapeTensor:(id)a4 startTensor:(id)a5 sizeTensor:(id)a6 squeezeMask:(unsigned int)a7 name:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  v27[5] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1EC9F1D00, [v17 dataType], 1.0);
  id v20 = [MPSGraphStridedSliceGradientOp alloc];
  v27[0] = v14;
  v27[1] = v15;
  void v27[2] = v16;
  v27[3] = v17;
  void v27[4] = v19;
  id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:5];
  LOBYTE(v26) = 1;
  BOOL v22 = [(MPSGraphStridedSliceGradientOp *)v20 initWithGraph:self inputTensors:v21 controlDependencies:MEMORY[0x1E4F1CBF0] startMask:0 endMask:0 shrinkAxisMask:v9 endIsSize:v26 name:v18];

  uint64_t v23 = [(MPSGraphOperation *)v22 outputTensors];
  unint64_t v24 = [v23 objectAtIndexedSubscript:0];

  return v24;
}

- (id)sliceUpdateDataTensor:(id)a3 updateTensor:(id)a4 starts:(id)a5 ends:(id)a6 strides:(id)a7 startMask:(unsigned int)a8 endMask:(unsigned int)a9 squeezeMask:(unsigned int)a10 name:(id)a11
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v35 = a4;
  id v17 = a6;
  id v38 = a7;
  id v37 = a11;
  uint64_t v33 = v17;
  MPSShapeToVector<int>(a5, (char **)&v43);
  MPSShapeToVector<int>(v17, (char **)&v41);
  MPSShapeToVector<int>(v38, (char **)&__p);
  int64_t v18 = v44 - (unsigned char *)v43;
  uint64_t v19 = (v44 - (unsigned char *)v43) >> 2;
  if ((v19 != (v42 - (unsigned char *)v41) >> 2 || v19 != (v40 - (unsigned char *)__p) >> 2)
    && MTLReportFailureTypeEnabled())
  {
    MTLReportFailure();
  }
  if ((v19 != (v42 - (unsigned char *)v41) >> 2 || v19 != (v40 - (unsigned char *)__p) >> 2)
    && MTLReportFailureTypeEnabled())
  {
    MTLReportFailure();
  }
  id v20 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v43 length:v18];
  id v21 = [NSNumber numberWithUnsignedInteger:v19];
  v47[0] = v21;
  BOOL v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
  uint64_t v36 = [(MPSGraph *)self constantWithData:v20 shape:v22 dataType:536870944];

  uint64_t v23 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v41 length:v18];
  unint64_t v24 = [NSNumber numberWithUnsignedInteger:v19];
  uint64_t v46 = v24;
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
  uint64_t v26 = [(MPSGraph *)self constantWithData:v23 shape:v25 dataType:536870944];

  unint64_t v27 = [MEMORY[0x1E4F1C9B8] dataWithBytes:__p length:v18];
  uint64_t v28 = [NSNumber numberWithUnsignedInteger:v19];
  char v45 = v28;
  id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
  id v30 = [(MPSGraph *)self constantWithData:v27 shape:v29 dataType:536870944];

  id v31 = -[MPSGraph sliceUpdateDataTensor:updateTensor:startsTensor:endsTensor:stridesTensor:startMask:endMask:squeezeMask:name:](self, "sliceUpdateDataTensor:updateTensor:startsTensor:endsTensor:stridesTensor:startMask:endMask:squeezeMask:name:", v34, v35, v36, v26, v30, a8, __PAIR64__(a10, a9), v37);

  if (__p)
  {
    uint64_t v40 = __p;
    operator delete(__p);
  }
  if (v41)
  {
    uint64_t v42 = v41;
    operator delete(v41);
  }
  if (v43)
  {
    int v44 = v43;
    operator delete(v43);
  }

  return v31;
}

- (id)sliceUpdateDataTensor:(id)a3 updateTensor:(id)a4 startsTensor:(id)a5 endsTensor:(id)a6 stridesTensor:(id)a7 startMask:(unsigned int)a8 endMask:(unsigned int)a9 squeezeMask:(unsigned int)a10 name:(id)a11
{
  void v31[5] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a11;
  uint64_t v28 = v19;
  id v29 = v20;
  BOOL v22 = [MPSGraphStridedSliceUpdateOp alloc];
  v31[0] = v16;
  v31[1] = v17;
  void v31[2] = v18;
  v31[3] = v19;
  v31[4] = v20;
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:5];
  unint64_t v24 = [(MPSGraphStridedSliceUpdateOp *)v22 initWithGraph:self inputTensors:v23 controlDependencies:MEMORY[0x1E4F1CBF0] startMask:a8 endMask:a9 shrinkAxisMask:a10 name:v21];

  uint64_t v25 = [(MPSGraphOperation *)v24 outputTensors];
  uint64_t v26 = [v25 objectAtIndexedSubscript:0];

  return v26;
}

- (id)sliceUpdateDataTensor:(id)a3 updateTensor:(id)a4 startsTensor:(id)a5 endsTensor:(id)a6 stridesTensor:(id)a7 name:(id)a8
{
  uint64_t v8 = -[MPSGraph sliceUpdateDataTensor:updateTensor:startsTensor:endsTensor:stridesTensor:startMask:endMask:squeezeMask:name:](self, "sliceUpdateDataTensor:updateTensor:startsTensor:endsTensor:stridesTensor:startMask:endMask:squeezeMask:name:", a3, a4, a5, a6, a7, 0, 0, a8);

  return v8;
}

- (id)sliceUpdateDataTensor:(id)a3 updateTensor:(id)a4 starts:(id)a5 ends:(id)a6 strides:(id)a7 name:(id)a8
{
  uint64_t v8 = -[MPSGraph sliceUpdateDataTensor:updateTensor:starts:ends:strides:startMask:endMask:squeezeMask:name:](self, "sliceUpdateDataTensor:updateTensor:starts:ends:strides:startMask:endMask:squeezeMask:name:", a3, a4, a5, a6, a7, 0, 0, a8);

  return v8;
}

- (MPSGraphTensor)concatTensors:(NSArray *)tensors dimension:(NSInteger)dimensionIndex interleave:(BOOL)interleave name:(NSString *)name
{
  BOOL v7 = interleave;
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = tensors;
  uint64_t v11 = name;
  id v12 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)dimensionIndex];
  v20[0] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  id v14 = [(NSArray *)v10 arrayByAddingObjectsFromArray:v13];

  id v15 = [MPSGraphConcatOp alloc];
  id v16 = [(MPSGraphConcatOp *)v15 initWithGraph:self inputTensors:v14 controlDependencies:MEMORY[0x1E4F1CBF0] dimension:dimensionIndex interleave:v7 name:v11];
  id v17 = [(MPSGraphOperation *)v16 outputTensors];
  id v18 = [v17 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v18;
}

- (MPSGraphTensor)concatTensors:(NSArray *)tensors dimension:(NSInteger)dimensionIndex name:(NSString *)name
{
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = tensors;
  uint64_t v9 = name;
  uint64_t v10 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)dimensionIndex];
  v18[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  id v12 = [(NSArray *)v8 arrayByAddingObjectsFromArray:v11];

  id v13 = [MPSGraphConcatOp alloc];
  id v14 = [(MPSGraphConcatOp *)v13 initWithGraph:self inputTensors:v12 controlDependencies:MEMORY[0x1E4F1CBF0] dimension:dimensionIndex interleave:0 name:v9];
  id v15 = [(MPSGraphOperation *)v14 outputTensors];
  id v16 = [v15 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v16;
}

- (MPSGraphTensor)concatTensor:(MPSGraphTensor *)tensor withTensor:(MPSGraphTensor *)tensor2 dimension:(NSInteger)dimensionIndex name:(NSString *)name
{
  void v20[3] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = tensor;
  uint64_t v11 = tensor2;
  id v12 = name;
  id v13 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)dimensionIndex];
  id v14 = [MPSGraphConcatOp alloc];
  v20[0] = v10;
  v20[1] = v11;
  void v20[2] = v13;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  id v16 = [(MPSGraphConcatOp *)v14 initWithGraph:self inputTensors:v15 controlDependencies:MEMORY[0x1E4F1CBF0] dimension:dimensionIndex interleave:0 name:v12];

  id v17 = [(MPSGraphOperation *)v16 outputTensors];
  id v18 = [v17 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v18;
}

- (id)tileTensorWithMultiplier:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  MPSShapeToVector<unsigned long long>(v4, (uint64_t **)&__p);
  uint64_t v5 = __p;
  id v18 = 0;
  id v19 = 0;
  unint64_t v6 = v21 - (unsigned char *)__p;
  unint64_t v7 = (v21 - (unsigned char *)__p) >> 3;
  if (v21 == __p)
  {
    uint64_t v9 = 0;
  }
  else
  {
    if ((v6 & 0x8000000000000000) != 0) {
      std::vector<int>::__throw_length_error[abi:ne180100]();
    }
    size_t v8 = v6 >> 1;
    uint64_t v9 = (char *)operator new(v6 >> 1);
    id v18 = v9;
    id v19 = &v9[4 * v7];
    bzero(v9, v8);
    uint64_t v10 = 0;
    unint64_t v6 = (unint64_t)&v9[v8];
    if (v7 <= 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v7;
    }
    do
    {
      uint64_t v12 = v5[v10];
      *(_DWORD *)&v9[4 * v10] = v12;
      if (v12 != (int)v12) {
        __assert_rtn("-[MPSGraph(MPSGraphTensorShapeOps) tileTensorWithMultiplier:]", "MPSGraphTensorShapeOps.mm", 2147, "multipleVector[dim] == (int64_t)multipliers[dim]");
      }
      ++v10;
    }
    while (v11 != v10);
  }
  id v13 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v9, v6 - (void)v9, v18, 0, v19);
  id v14 = [NSNumber numberWithUnsignedInteger:v7];
  v22[0] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  id v16 = [(MPSGraph *)self constantWithData:v13 shape:v15 dataType:536870944];

  if (v9) {
    operator delete(v9);
  }
  if (__p)
  {
    id v21 = __p;
    operator delete(__p);
  }

  return v16;
}

- (id)tileTensor:(id)a3 multiplierTensor:(id)a4 name:(id)a5
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MPSGraphTileOp alloc];
  v17[0] = v8;
  v17[1] = v9;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  id v13 = [(MPSGraphOperation *)v11 initWithGraph:self inputTensors:v12 controlDependencies:MEMORY[0x1E4F1CBF0] name:v10];

  id v14 = [(MPSGraphOperation *)v13 outputTensors];
  id v15 = [v14 objectAtIndexedSubscript:0];

  return v15;
}

- (MPSGraphTensor)tileTensor:(MPSGraphTensor *)tensor withMultiplier:(MPSShape *)multiplier name:(NSString *)name
{
  id v8 = tensor;
  id v9 = name;
  id v10 = [(MPSGraph *)self tileTensorWithMultiplier:multiplier];
  uint64_t v11 = [(MPSGraph *)self tileTensor:v8 multiplierTensor:v10 name:v9];

  return (MPSGraphTensor *)v11;
}

- (id)tileGradientWithIncomingGradientTensor:(id)a3 sourceTensor:(id)a4 multiplierTensor:(id)a5 name:(id)a6
{
  void v20[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20[0] = v10;
  v20[1] = v11;
  void v20[2] = v12;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  id v15 = [MPSGraphTileGradientOp alloc];
  id v16 = [(MPSGraphOperation *)v15 initWithGraph:self inputTensors:v14 controlDependencies:MEMORY[0x1E4F1CBF0] name:v13];
  id v17 = [(MPSGraphOperation *)v16 outputTensors];
  id v18 = [v17 objectAtIndexedSubscript:0];

  return v18;
}

- (MPSGraphTensor)tileGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradientTensor sourceTensor:(MPSGraphTensor *)sourceTensor withMultiplier:(MPSShape *)multiplier name:(NSString *)name
{
  id v10 = incomingGradientTensor;
  id v11 = sourceTensor;
  id v12 = name;
  id v13 = [(MPSGraph *)self tileTensorWithMultiplier:multiplier];
  id v14 = [(MPSGraph *)self tileGradientWithIncomingGradientTensor:v10 sourceTensor:v11 multiplierTensor:v13 name:v12];

  return (MPSGraphTensor *)v14;
}

- (id)paddingTensorWithLeftPadding:(id)a3 rightPadding:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  MPSShapeToVector<unsigned long long>(v6, (uint64_t **)&v31);
  MPSShapeToVector<unsigned long long>(v7, (uint64_t **)&__p);
  id v9 = v31;
  id v8 = v32;
  int64_t v10 = v32 - (unsigned char *)v31;
  unint64_t v11 = (v32 - (unsigned char *)v31) >> 3;
  if (v11 != (v34 - (unsigned char *)__p) >> 3 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  unint64_t v27 = 0;
  uint64_t v28 = 0;
  id v29 = 0;
  if (v8 != v9)
  {
    if (v10 < 0) {
      std::vector<int>::__throw_length_error[abi:ne180100]();
    }
    id v12 = (char *)operator new(v10);
    unint64_t v27 = v12;
    id v29 = &v12[4 * (v10 >> 2)];
    bzero(v12, v10);
    uint64_t v13 = 0;
    id v14 = &v12[v10];
    uint64_t v28 = &v12[v10];
    if (v11 <= 1) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = v11;
    }
    id v16 = (char *)v31;
    uint64_t v17 = v15;
    do
    {
      uint64_t v18 = *(void *)&v16[v13];
      *(_DWORD *)&v12[v13] = v18;
      if (v18 != (int)v18) {
        goto LABEL_24;
      }
      v13 += 8;
      --v17;
    }
    while (v17);
    uint64_t v19 = 0;
    id v20 = (char *)__p;
    while (1)
    {
      uint64_t v21 = *(void *)&v20[v19];
      *(_DWORD *)&v12[v19 + 4] = v21;
      if (v21 != (int)v21) {
        break;
      }
      v19 += 8;
      if (!--v15) {
        goto LABEL_15;
      }
    }
LABEL_24:
    __assert_rtn("-[MPSGraph(MPSGraphTensorShapeOps) paddingTensorWithLeftPadding:rightPadding:]", "MPSGraphTensorShapeOps.mm", 2228, "source[dim] == (int64_t)paddings[dim * 2 + side]");
  }
  id v12 = 0;
  id v14 = 0;
LABEL_15:
  BOOL v22 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v12, v14 - v12, v27, v28, v29);
  uint64_t v23 = [NSNumber numberWithUnsignedInteger:v11];
  v30[0] = v23;
  v30[1] = &unk_1EC9EFFF0;
  unint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  uint64_t v25 = [(MPSGraph *)self constantWithData:v22 shape:v24 dataType:536870944];

  if (v12) {
    operator delete(v12);
  }
  if (__p)
  {
    id v34 = __p;
    operator delete(__p);
  }
  if (v31)
  {
    uint64_t v32 = v31;
    operator delete(v31);
  }

  return v25;
}

- (MPSGraphTensor)padTensor:(MPSGraphTensor *)tensor withPaddingMode:(MPSGraphPaddingMode)paddingMode leftPadding:(MPSShape *)leftPadding rightPadding:(MPSShape *)rightPadding constantValue:(double)constantValue name:(NSString *)name
{
  id v14 = tensor;
  uint64_t v15 = name;
  if (paddingMode == MPSGraphPaddingModeZero)
  {
    constantValue = 0.0;
    paddingMode = MPSGraphPaddingModeConstant;
  }
  id v16 = [(MPSGraph *)self paddingTensorWithLeftPadding:leftPadding rightPadding:rightPadding];
  uint64_t v17 = [(MPSGraph *)self constantWithScalar:&unk_1EC9F1D18 shape:[(MPSGraphTensor *)v14 dataType] dataType:constantValue];
  uint64_t v18 = [(MPSGraph *)self padTensor:v14 paddingMode:paddingMode paddingTensor:v16 constantValuesTensor:v17 name:v15];

  return (MPSGraphTensor *)v18;
}

- (id)padTensor:(id)a3 paddingMode:(int64_t)a4 paddingTensor:(id)a5 constantValuesTensor:(id)a6 name:(id)a7
{
  void v22[3] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (a4 == 4) {
    a4 = 0;
  }
  id v16 = [MPSGraphPadOp alloc];
  v22[0] = v12;
  v22[1] = v13;
  void v22[2] = v14;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  uint64_t v18 = [(MPSGraphPadOp *)v16 initWithGraph:self inputTensors:v17 controlDependencies:MEMORY[0x1E4F1CBF0] paddingMode:a4 name:v15];

  uint64_t v19 = [(MPSGraphOperation *)v18 outputTensors];
  id v20 = [v19 objectAtIndexedSubscript:0];

  return v20;
}

- (MPSGraphTensor)spaceToDepth2DTensor:(MPSGraphTensor *)tensor widthAxisTensor:(MPSGraphTensor *)widthAxisTensor heightAxisTensor:(MPSGraphTensor *)heightAxisTensor depthAxisTensor:(MPSGraphTensor *)depthAxisTensor blockSize:(NSUInteger)blockSize usePixelShuffleOrder:(BOOL)usePixelShuffleOrder name:(NSString *)name
{
  BOOL v9 = usePixelShuffleOrder;
  void v29[4] = *MEMORY[0x1E4F143B8];
  uint64_t v28 = tensor;
  id v15 = widthAxisTensor;
  id v16 = heightAxisTensor;
  uint64_t v17 = depthAxisTensor;
  uint64_t v18 = name;
  uint64_t v19 = [(MPSGraph *)self fixCastIntTensor:v15 toSignedness:1 name:v18];

  id v20 = [(MPSGraph *)self fixCastIntTensor:v16 toSignedness:1 name:v18];

  uint64_t v21 = [(MPSGraph *)self fixCastIntTensor:v17 toSignedness:1 name:v18];

  BOOL v22 = [MPSGraphSpaceToDepth2DOp alloc];
  v29[0] = v28;
  v29[1] = v19;
  void v29[2] = v20;
  void v29[3] = v21;
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
  unint64_t v24 = [(MPSGraphSpaceToDepth2DOp *)v22 initWithGraph:self inputTensors:v23 controlDependencies:MEMORY[0x1E4F1CBF0] blockSize:blockSize usePixelShuffleOrder:v9 name:v18];

  uint64_t v25 = [(MPSGraphOperation *)v24 outputTensors];
  uint64_t v26 = [v25 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v26;
}

- (MPSGraphTensor)depthToSpace2DTensor:(MPSGraphTensor *)tensor widthAxisTensor:(MPSGraphTensor *)widthAxisTensor heightAxisTensor:(MPSGraphTensor *)heightAxisTensor depthAxisTensor:(MPSGraphTensor *)depthAxisTensor blockSize:(NSUInteger)blockSize usePixelShuffleOrder:(BOOL)usePixelShuffleOrder name:(NSString *)name
{
  BOOL v9 = usePixelShuffleOrder;
  void v29[4] = *MEMORY[0x1E4F143B8];
  uint64_t v28 = tensor;
  id v15 = widthAxisTensor;
  id v16 = heightAxisTensor;
  uint64_t v17 = depthAxisTensor;
  uint64_t v18 = name;
  uint64_t v19 = [(MPSGraph *)self fixCastIntTensor:v15 toSignedness:1 name:v18];

  id v20 = [(MPSGraph *)self fixCastIntTensor:v16 toSignedness:1 name:v18];

  uint64_t v21 = [(MPSGraph *)self fixCastIntTensor:v17 toSignedness:1 name:v18];

  BOOL v22 = [MPSGraphDepthToSpace2DOp alloc];
  v29[0] = v28;
  v29[1] = v19;
  void v29[2] = v20;
  void v29[3] = v21;
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
  unint64_t v24 = [(MPSGraphDepthToSpace2DOp *)v22 initWithGraph:self inputTensors:v23 controlDependencies:MEMORY[0x1E4F1CBF0] blockSize:blockSize usePixelShuffleOrder:v9 name:v18];

  uint64_t v25 = [(MPSGraphOperation *)v24 outputTensors];
  uint64_t v26 = [v25 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v26;
}

- (MPSGraphTensor)spaceToDepth2DTensor:(MPSGraphTensor *)tensor widthAxis:(NSUInteger)widthAxis heightAxis:(NSUInteger)heightAxis depthAxis:(NSUInteger)depthAxis blockSize:(NSUInteger)blockSize usePixelShuffleOrder:(BOOL)usePixelShuffleOrder name:(NSString *)name
{
  BOOL v9 = usePixelShuffleOrder;
  id v15 = tensor;
  id v16 = name;
  uint64_t v17 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)widthAxis];
  uint64_t v18 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)heightAxis];
  uint64_t v19 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)depthAxis];
  id v20 = [(MPSGraph *)self spaceToDepth2DTensor:v15 widthAxisTensor:v17 heightAxisTensor:v18 depthAxisTensor:v19 blockSize:blockSize usePixelShuffleOrder:v9 name:v16];

  return (MPSGraphTensor *)v20;
}

- (MPSGraphTensor)depthToSpace2DTensor:(MPSGraphTensor *)tensor widthAxis:(NSUInteger)widthAxis heightAxis:(NSUInteger)heightAxis depthAxis:(NSUInteger)depthAxis blockSize:(NSUInteger)blockSize usePixelShuffleOrder:(BOOL)usePixelShuffleOrder name:(NSString *)name
{
  BOOL v9 = usePixelShuffleOrder;
  id v15 = tensor;
  id v16 = name;
  uint64_t v17 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)widthAxis];
  uint64_t v18 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)heightAxis];
  uint64_t v19 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)depthAxis];
  id v20 = [(MPSGraph *)self depthToSpace2DTensor:v15 widthAxisTensor:v17 heightAxisTensor:v18 depthAxisTensor:v19 blockSize:blockSize usePixelShuffleOrder:v9 name:v16];

  return (MPSGraphTensor *)v20;
}

- (MPSGraphTensor)spaceToBatchTensor:(MPSGraphTensor *)tensor spatialAxesTensor:(MPSGraphTensor *)spatialAxesTensor batchAxisTensor:(MPSGraphTensor *)batchAxisTensor blockDimensionsTensor:(MPSGraphTensor *)blockDimensionsTensor usePixelShuffleOrder:(BOOL)usePixelShuffleOrder name:(NSString *)name
{
  BOOL v9 = usePixelShuffleOrder;
  void v27[4] = *MEMORY[0x1E4F143B8];
  id v14 = tensor;
  id v15 = spatialAxesTensor;
  id v16 = batchAxisTensor;
  uint64_t v17 = blockDimensionsTensor;
  uint64_t v18 = name;
  uint64_t v19 = [(MPSGraph *)self fixCastIntTensor:v15 toSignedness:1 name:v18];

  id v20 = [(MPSGraph *)self fixCastIntTensor:v16 toSignedness:1 name:v18];

  uint64_t v21 = [MPSGraphSpaceToBatchOp alloc];
  v27[0] = v14;
  v27[1] = v19;
  void v27[2] = v20;
  v27[3] = v17;
  BOOL v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
  uint64_t v23 = [(MPSGraphSpaceToBatchOp *)v21 initWithGraph:self inputTensors:v22 controlDependencies:MEMORY[0x1E4F1CBF0] usePixelShuffleOrder:v9 name:v18];

  unint64_t v24 = [(MPSGraphOperation *)v23 outputTensors];
  uint64_t v25 = [v24 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v25;
}

- (MPSGraphTensor)spaceToBatchTensor:(MPSGraphTensor *)tensor spatialAxes:(NSArray *)spatialAxes batchAxis:(NSInteger)batchAxis blockDimensions:(NSArray *)blockDimensions usePixelShuffleOrder:(BOOL)usePixelShuffleOrder name:(NSString *)name
{
  BOOL v9 = usePixelShuffleOrder;
  v33[1] = *MEMORY[0x1E4F143B8];
  uint64_t v25 = tensor;
  unint64_t v27 = blockDimensions;
  uint64_t v26 = name;
  MPSShapeToVector<int>(spatialAxes, (char **)&v30);
  id v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v30 length:v31 - (unsigned char *)v30];
  id v15 = [NSNumber numberWithUnsignedInteger:(v31 - (unsigned char *)v30) >> 2];
  v33[0] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  uint64_t v17 = [(MPSGraph *)self constantWithData:v14 shape:v16 dataType:536870944];

  uint64_t v18 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)batchAxis];
  MPSShapeToVector<int>(v27, (char **)&__p);
  uint64_t v19 = [MEMORY[0x1E4F1C9B8] dataWithBytes:__p length:v29 - (unsigned char *)__p];
  id v20 = [NSNumber numberWithUnsignedInteger:(v29 - (unsigned char *)__p) >> 2];
  uint64_t v32 = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  BOOL v22 = [(MPSGraph *)self constantWithData:v19 shape:v21 dataType:536870944];

  uint64_t v23 = [(MPSGraph *)self spaceToBatchTensor:v25 spatialAxesTensor:v17 batchAxisTensor:v18 blockDimensionsTensor:v22 usePixelShuffleOrder:v9 name:v26];

  if (__p)
  {
    id v29 = __p;
    operator delete(__p);
  }

  if (v30)
  {
    id v31 = v30;
    operator delete(v30);
  }

  return (MPSGraphTensor *)v23;
}

- (MPSGraphTensor)batchToSpaceTensor:(MPSGraphTensor *)tensor spatialAxesTensor:(MPSGraphTensor *)spatialAxesTensor batchAxisTensor:(MPSGraphTensor *)batchAxisTensor blockDimensionsTensor:(MPSGraphTensor *)blockDimensionsTensor usePixelShuffleOrder:(BOOL)usePixelShuffleOrder name:(NSString *)name
{
  BOOL v9 = usePixelShuffleOrder;
  void v27[4] = *MEMORY[0x1E4F143B8];
  id v14 = tensor;
  id v15 = spatialAxesTensor;
  id v16 = batchAxisTensor;
  uint64_t v17 = blockDimensionsTensor;
  uint64_t v18 = name;
  uint64_t v19 = [(MPSGraph *)self fixCastIntTensor:v15 toSignedness:1 name:v18];

  id v20 = [(MPSGraph *)self fixCastIntTensor:v16 toSignedness:1 name:v18];

  uint64_t v21 = [MPSGraphBatchToSpaceOp alloc];
  v27[0] = v14;
  v27[1] = v19;
  void v27[2] = v20;
  v27[3] = v17;
  BOOL v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
  uint64_t v23 = [(MPSGraphBatchToSpaceOp *)v21 initWithGraph:self inputTensors:v22 controlDependencies:MEMORY[0x1E4F1CBF0] usePixelShuffleOrder:v9 name:v18];

  unint64_t v24 = [(MPSGraphOperation *)v23 outputTensors];
  uint64_t v25 = [v24 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v25;
}

- (MPSGraphTensor)batchToSpaceTensor:(MPSGraphTensor *)tensor spatialAxes:(NSArray *)spatialAxes batchAxis:(NSInteger)batchAxis blockDimensions:(NSArray *)blockDimensions usePixelShuffleOrder:(BOOL)usePixelShuffleOrder name:(NSString *)name
{
  BOOL v9 = usePixelShuffleOrder;
  v33[1] = *MEMORY[0x1E4F143B8];
  uint64_t v25 = tensor;
  unint64_t v27 = blockDimensions;
  uint64_t v26 = name;
  MPSShapeToVector<int>(spatialAxes, (char **)&v30);
  id v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v30 length:v31 - (unsigned char *)v30];
  id v15 = [NSNumber numberWithUnsignedInteger:(v31 - (unsigned char *)v30) >> 2];
  v33[0] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  uint64_t v17 = [(MPSGraph *)self constantWithData:v14 shape:v16 dataType:536870944];

  uint64_t v18 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)batchAxis];
  MPSShapeToVector<int>(v27, (char **)&__p);
  uint64_t v19 = [MEMORY[0x1E4F1C9B8] dataWithBytes:__p length:v29 - (unsigned char *)__p];
  id v20 = [NSNumber numberWithUnsignedInteger:(v29 - (unsigned char *)__p) >> 2];
  uint64_t v32 = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  BOOL v22 = [(MPSGraph *)self constantWithData:v19 shape:v21 dataType:536870944];

  uint64_t v23 = [(MPSGraph *)self batchToSpaceTensor:v25 spatialAxesTensor:v17 batchAxisTensor:v18 blockDimensionsTensor:v22 usePixelShuffleOrder:v9 name:v26];

  if (__p)
  {
    id v29 = __p;
    operator delete(__p);
  }

  if (v30)
  {
    id v31 = v30;
    operator delete(v30);
  }

  return (MPSGraphTensor *)v23;
}

- (MPSGraphTensor)reverseTensor:(MPSGraphTensor *)tensor axesTensor:(MPSGraphTensor *)axesTensor name:(NSString *)name
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  id v8 = tensor;
  BOOL v9 = axesTensor;
  int64_t v10 = name;
  unint64_t v11 = [(MPSGraph *)self fixCastIntTensor:v9 toSignedness:1 name:v10];

  id v12 = [MPSGraphReverseOp alloc];
  v18[0] = v8;
  v18[1] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  id v14 = [(MPSGraphOperation *)v12 initWithGraph:self inputTensors:v13 controlDependencies:MEMORY[0x1E4F1CBF0] name:v10];

  id v15 = [(MPSGraphOperation *)v14 outputTensors];
  id v16 = [v15 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v16;
}

- (MPSGraphTensor)reverseTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  id v8 = [MPSGraphReverseOp alloc];
  v14[0] = v6;
  BOOL v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  int64_t v10 = [(MPSGraphOperation *)v8 initWithGraph:self inputTensors:v9 controlDependencies:MEMORY[0x1E4F1CBF0] name:v7];

  unint64_t v11 = [(MPSGraphOperation *)v10 outputTensors];
  id v12 = [v11 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)reverseTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = tensor;
  BOOL v9 = axes;
  int64_t v10 = name;
  memset(v24, 0, sizeof(v24));
  unint64_t v11 = [(NSArray *)v9 count];
  if (v11 >= 0x10) {
    uint64_t v12 = 16;
  }
  else {
    uint64_t v12 = v11;
  }
  if (v12)
  {
    for (unint64_t i = 0; ; ++i)
    {
      unint64_t v14 = [(NSArray *)v9 count];
      unint64_t v15 = v14 >= 0x10 ? 16 : v14;
      if (i >= v15) {
        break;
      }
      id v16 = [(NSArray *)v9 objectAtIndexedSubscript:i];
      *((_DWORD *)v24 + i) = [v16 intValue];
    }
    uint64_t v17 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v24 length:4 * v12];
    uint64_t v18 = [NSNumber numberWithUnsignedInteger:v12];
    uint64_t v23 = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    id v20 = [(MPSGraph *)self constantWithData:v17 shape:v19 dataType:536870944];

    uint64_t v21 = [(MPSGraph *)self reverseTensor:v8 axesTensor:v20 name:v10];
  }
  else
  {
    uint64_t v21 = [(MPSGraph *)self reverseTensor:v8 name:v10];
  }

  return (MPSGraphTensor *)v21;
}

- (MPSGraphTensor)flatten2DTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  id v8 = tensor;
  BOOL v9 = name;
  int64_t v10 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)axis];
  unint64_t v11 = [(MPSGraph *)self flatten2DTensor:v8 axisTensor:v10 name:v9];

  return (MPSGraphTensor *)v11;
}

- (MPSGraphTensor)flatten2DTensor:(MPSGraphTensor *)tensor axisTensor:(MPSGraphTensor *)axisTensor name:(NSString *)name
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  id v8 = tensor;
  BOOL v9 = axisTensor;
  int64_t v10 = name;
  unint64_t v11 = [(MPSGraph *)self fixCastIntTensor:v9 toSignedness:1 name:v10];

  uint64_t v12 = [MPSGraphFlatten2DOp alloc];
  v18[0] = v8;
  v18[1] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  unint64_t v14 = [(MPSGraphOperation *)v12 initWithGraph:self inputTensors:v13 controlDependencies:MEMORY[0x1E4F1CBF0] name:v10];

  unint64_t v15 = [(MPSGraphOperation *)v14 outputTensors];
  id v16 = [v15 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v16;
}

- (id)padGradientWithIncomingGradientTensor:(id)a3 sourceTensor:(id)a4 paddingMode:(int64_t)a5 paddingTensor:(id)a6 name:(id)a7
{
  void v23[3] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v23[0] = v12;
  v23[1] = v13;
  void v23[2] = v14;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  uint64_t v17 = [MPSGraphPadGradientOp alloc];
  if (a5 == 4) {
    int64_t v18 = 0;
  }
  else {
    int64_t v18 = a5;
  }
  uint64_t v19 = [(MPSGraphPadGradientOp *)v17 initWithGraph:self inputTensors:v16 controlDependencies:MEMORY[0x1E4F1CBF0] paddingMode:v18 name:v15];
  id v20 = [(MPSGraphOperation *)v19 outputTensors];
  uint64_t v21 = [v20 objectAtIndexedSubscript:0];

  return v21;
}

- (MPSGraphTensor)padGradientWithIncomingGradientTensor:(MPSGraphTensor *)incomingGradientTensor sourceTensor:(MPSGraphTensor *)sourceTensor paddingMode:(MPSGraphPaddingMode)paddingMode leftPadding:(MPSShape *)leftPadding rightPadding:(MPSShape *)rightPadding name:(NSString *)name
{
  id v14 = incomingGradientTensor;
  id v15 = sourceTensor;
  id v16 = name;
  uint64_t v17 = [(MPSGraph *)self paddingTensorWithLeftPadding:leftPadding rightPadding:rightPadding];
  int64_t v18 = [(MPSGraph *)self constantWithScalar:&unk_1EC9F1D30 shape:[(MPSGraphTensor *)v15 dataType] dataType:0.0];
  if (paddingMode == MPSGraphPaddingModeZero) {
    MPSGraphPaddingMode v19 = MPSGraphPaddingModeConstant;
  }
  else {
    MPSGraphPaddingMode v19 = paddingMode;
  }
  id v20 = [(MPSGraph *)self padGradientWithIncomingGradientTensor:v14 inputTensor:v15 paddingMode:v19 paddingTensor:v17 constantValuesTensor:v18 name:v16];

  return (MPSGraphTensor *)v20;
}

- (id)padGradientWithIncomingGradientTensor:(id)a3 inputTensor:(id)a4 paddingMode:(int64_t)a5 paddingTensor:(id)a6 constantValuesTensor:(id)a7 name:(id)a8
{
  void v23[3] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a8;
  if (a5 == 4) {
    a5 = 0;
  }
  uint64_t v17 = [MPSGraphPadGradientOp alloc];
  v23[0] = v13;
  v23[1] = v14;
  void v23[2] = v15;
  int64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  MPSGraphPaddingMode v19 = [(MPSGraphPadGradientOp *)v17 initWithGraph:self inputTensors:v18 controlDependencies:MEMORY[0x1E4F1CBF0] paddingMode:a5 name:v16];

  id v20 = [(MPSGraphOperation *)v19 outputTensors];
  uint64_t v21 = [v20 objectAtIndexedSubscript:0];

  return v21;
}

- (MPSGraphTensor)shapeOfTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  id v8 = [(MPSGraphTensor *)v6 shape];
  int v9 = isStaticShape(v8);

  if (v9)
  {
    int64_t v10 = [(MPSGraphTensor *)v6 shape];
    MPSShapeToVector<unsigned long long>(v10, (uint64_t **)&__p);

    id v12 = (int32x4_t *)__p;
    unint64_t v11 = v38;
    uint64_t v13 = v38 - (unsigned char *)__p;
    uint64_t v14 = (v38 - (unsigned char *)__p) >> 3;
    if (v38 == __p)
    {
      id v16 = 0;
    }
    else
    {
      if (v13 < 0) {
        std::vector<int>::__throw_length_error[abi:ne180100]();
      }
      id v15 = (int32x4_t *)operator new((unint64_t)v13 >> 1);
      id v16 = v15;
      uint64_t v17 = (char *)v12;
      int64_t v18 = v15;
      if ((unint64_t)(v13 - 8) < 0x38) {
        goto LABEL_22;
      }
      unint64_t v19 = ((unint64_t)(v13 - 8) >> 3) + 1;
      uint64_t v17 = &v12->i8[8 * (v19 & 0x3FFFFFFFFFFFFFF8)];
      int64_t v18 = (int32x4_t *)((char *)v15 + 4 * (v19 & 0x3FFFFFFFFFFFFFF8));
      id v20 = v15 + 1;
      uint64_t v21 = v12 + 2;
      uint64_t v22 = v19 & 0x3FFFFFFFFFFFFFF8;
      do
      {
        int32x4_t v24 = v21[-2];
        int32x4_t v23 = v21[-1];
        int32x4_t v26 = *v21;
        int32x4_t v25 = v21[1];
        v21 += 4;
        v20[-1] = vuzp1q_s32(v24, v23);
        *id v20 = vuzp1q_s32(v26, v25);
        v20 += 2;
        v22 -= 8;
      }
      while (v22);
      if (v19 != (v19 & 0x3FFFFFFFFFFFFFF8))
      {
LABEL_22:
        do
        {
          uint64_t v27 = *(void *)v17;
          v17 += 8;
          v18->i32[0] = v27;
          int64_t v18 = (int32x4_t *)((char *)v18 + 4);
        }
        while (v17 != v11);
      }
    }
    uint64_t v33 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v16 length:v13 >> 1];
    id v34 = [NSNumber numberWithUnsignedInteger:v14];
    v40[0] = v34;
    uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
    uint64_t v32 = [(MPSGraph *)self constantWithData:v33 shape:v35 dataType:536870944];

    if (v16) {
      operator delete(v16);
    }
    if (__p)
    {
      id v38 = (char *)__p;
      operator delete(__p);
    }
  }
  else
  {
    uint64_t v28 = [MPSGraphShapeOp alloc];
    uint64_t v39 = v6;
    id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
    id v30 = [(MPSGraphOperation *)v28 initWithGraph:self inputTensors:v29 controlDependencies:MEMORY[0x1E4F1CBF0] name:v7];

    id v31 = [(MPSGraphOperation *)v30 outputTensors];
    uint64_t v32 = [v31 objectAtIndexedSubscript:0];
  }

  return (MPSGraphTensor *)v32;
}

- (id)rankOfTensor:(id)a3 name:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 shape];

  if (v8)
  {
    int v9 = [v6 shape];
    int64_t v10 = -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1EC9F1D48, 536870944, (double)(unint64_t)[v9 count]);
  }
  else
  {
    unint64_t v11 = [MPSGraphRankOp alloc];
    v16[0] = v6;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    uint64_t v13 = [(MPSGraphOperation *)v11 initWithGraph:self inputTensors:v12 controlDependencies:MEMORY[0x1E4F1CBF0] name:v7];

    uint64_t v14 = [(MPSGraphOperation *)v13 outputTensors];
    int64_t v10 = [v14 objectAtIndexedSubscript:0];
  }

  return v10;
}

- (id)sizeOfTensor:(id)a3 name:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 shape];
  int v9 = isStaticShape(v8);

  if (v9)
  {
    unint64_t v10 = 0;
    unint64_t v11 = 1;
    while (1)
    {
      id v12 = [v6 shape];
      unint64_t v13 = [v12 count];

      if (v10 >= v13) {
        break;
      }
      uint64_t v14 = [v6 shape];
      id v15 = [v14 objectAtIndexedSubscript:v10];
      v11 *= [v15 unsignedIntegerValue];

      ++v10;
    }
    id v20 = [(MPSGraph *)self constantWithScalar:&unk_1EC9F1D60 shape:536870944 dataType:(double)v11];
  }
  else
  {
    id v16 = [MPSGraphSizeOp alloc];
    v22[0] = v6;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    int64_t v18 = [(MPSGraphOperation *)v16 initWithGraph:self inputTensors:v17 controlDependencies:MEMORY[0x1E4F1CBF0] name:v7];

    unint64_t v19 = [(MPSGraphOperation *)v18 outputTensors];
    id v20 = [v19 objectAtIndexedSubscript:0];
  }

  return v20;
}

- (id)dimensionSizeOfTensor:(id)a3 axes:(id)a4 name:(id)a5
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  MPSShapeToVector<unsigned long long>(v9, (uint64_t **)&__p);
  id v12 = (int32x4_t *)__p;
  unint64_t v11 = v35;
  uint64_t v13 = v35 - (unsigned char *)__p;
  uint64_t v14 = (v35 - (unsigned char *)__p) >> 3;
  if (v35 == __p)
  {
    id v16 = 0;
    objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", 0, v13 >> 1, 0, 0, 0);
  }
  else
  {
    if (v13 < 0) {
      std::vector<int>::__throw_length_error[abi:ne180100]();
    }
    id v15 = (int32x4_t *)operator new((unint64_t)v13 >> 1);
    id v16 = v15;
    uint64_t v17 = (char *)v12;
    int64_t v18 = v15;
    if ((unint64_t)(v13 - 8) < 0x38) {
      goto LABEL_20;
    }
    unint64_t v19 = ((unint64_t)(v13 - 8) >> 3) + 1;
    uint64_t v17 = &v12->i8[8 * (v19 & 0x3FFFFFFFFFFFFFF8)];
    int64_t v18 = (int32x4_t *)((char *)v15 + 4 * (v19 & 0x3FFFFFFFFFFFFFF8));
    id v20 = v15 + 1;
    uint64_t v21 = v12 + 2;
    uint64_t v22 = v19 & 0x3FFFFFFFFFFFFFF8;
    do
    {
      int32x4_t v24 = v21[-2];
      int32x4_t v23 = v21[-1];
      int32x4_t v26 = *v21;
      int32x4_t v25 = v21[1];
      v21 += 4;
      v20[-1] = vuzp1q_s32(v24, v23);
      *id v20 = vuzp1q_s32(v26, v25);
      v20 += 2;
      v22 -= 8;
    }
    while (v22);
    if (v19 != (v19 & 0x3FFFFFFFFFFFFFF8))
    {
LABEL_20:
      do
      {
        uint64_t v27 = *(void *)v17;
        v17 += 8;
        v18->i32[0] = v27;
        int64_t v18 = (int32x4_t *)((char *)v18 + 4);
      }
      while (v17 != v11);
    }
    objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v15, v13 >> 1, v15, v18, (char *)v15 + 4 * v14);
  uint64_t v28 = };
  id v29 = [NSNumber numberWithUnsignedInteger:v14];
  v36[0] = v29;
  id v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  id v31 = [(MPSGraph *)self constantWithData:v28 shape:v30 dataType:536870944];

  uint64_t v32 = [(MPSGraph *)self dimensionSizeOfTensor:v8 axesTensor:v31 name:v10];

  if (v16) {
    operator delete(v16);
  }
  if (__p)
  {
    uint64_t v35 = (char *)__p;
    operator delete(__p);
  }

  return v32;
}

- (id)dimensionSizeOfTensor:(id)a3 axesTensor:(id)a4 name:(id)a5
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [MPSGraphDimensionSizeOp alloc];
  v17[0] = v8;
  v17[1] = v9;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  uint64_t v13 = [(MPSGraphOperation *)v11 initWithGraph:self inputTensors:v12 controlDependencies:MEMORY[0x1E4F1CBF0] name:v10];

  uint64_t v14 = [(MPSGraphOperation *)v13 outputTensors];
  id v15 = [v14 objectAtIndexedSubscript:0];

  return v15;
}

- (MPSGraphTensor)broadcastTensor:(MPSGraphTensor *)tensor toShapeTensor:(MPSGraphTensor *)shapeTensor name:(NSString *)name
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  id v8 = tensor;
  id v9 = shapeTensor;
  id v10 = name;
  unint64_t v11 = [(MPSGraph *)self fixCastIntTensor:v9 toSignedness:1 name:v10];

  id v12 = [MPSGraphBroadcastOp alloc];
  v18[0] = v8;
  v18[1] = v11;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  uint64_t v14 = [(MPSGraphOperation *)v12 initWithGraph:self inputTensors:v13 controlDependencies:MEMORY[0x1E4F1CBF0] name:v10];

  id v15 = [(MPSGraphOperation *)v14 outputTensors];
  id v16 = [v15 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v16;
}

- (MPSGraphTensor)broadcastTensor:(MPSGraphTensor *)tensor toShape:(MPSShape *)shape name:(NSString *)name
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = tensor;
  id v9 = shape;
  id v10 = name;
  unsigned int v11 = [(MPSShape *)v9 count];
  memset(v33, 0, sizeof(v33));
  if (v11 >= 0x10) {
    uint64_t v12 = 16;
  }
  else {
    uint64_t v12 = v11;
  }
  long long v32 = 0uLL;
  long long v31 = 0uLL;
  int v30 = 1;
  long long v24 = 0uLL;
  long long v25 = 0uLL;
  long long v26 = 0uLL;
  long long v27 = 0uLL;
  uint64_t v13 = v9;
  uint64_t v14 = [(MPSShape *)v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v25;
    id v16 = &v30;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v13);
        }
        *v16++ = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "unsignedIntValue", (void)v24);
      }
      uint64_t v14 = [(MPSShape *)v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v14);
  }

  int64_t v18 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v30 length:(4 * v12)];
  unint64_t v19 = [NSNumber numberWithUnsignedInt:v12];
  uint64_t v28 = v19;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  uint64_t v21 = [(MPSGraph *)self constantWithData:v18 shape:v20 dataType:536870944];

  uint64_t v22 = [(MPSGraph *)self broadcastTensor:v8 toShapeTensor:v21 name:v10];

  return (MPSGraphTensor *)v22;
}

- (id)broadcastGradientArgsForPrimaryTensor:(id)a3 withSecondaryTensor:(id)a4 name:(id)a5
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = [MPSGraphBroadcastGradientArgsOp alloc];
  v17[0] = v8;
  v17[1] = v9;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  uint64_t v13 = [(MPSGraphOperation *)v11 initWithGraph:self inputTensors:v12 controlDependencies:MEMORY[0x1E4F1CBF0] name:v10];

  uint64_t v14 = [(MPSGraphOperation *)v13 outputTensors];
  uint64_t v15 = [v14 objectAtIndexedSubscript:0];

  return v15;
}

- (MPSGraphTensor)squeezeTensor:(MPSGraphTensor *)tensor name:(NSString *)name
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = tensor;
  id v7 = name;
  id v8 = [MPSGraphSqueezeOp alloc];
  v14[0] = v6;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v10 = [(MPSGraphOperation *)v8 initWithGraph:self inputTensors:v9 controlDependencies:MEMORY[0x1E4F1CBF0] name:v7];

  unsigned int v11 = [(MPSGraphOperation *)v10 outputTensors];
  uint64_t v12 = [v11 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v12;
}

- (MPSGraphTensor)squeezeTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  id v7 = tensor;
  id v8 = [(MPSGraph *)self constantWithScalar:&unk_1EC9F1D78 shape:536870944 dataType:(double)axis];
  id v9 = [(MPSGraph *)self squeezeTensor:v7 axesTensor:v8 name:0];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)squeezeTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v8 = tensor;
  id v9 = axes;
  id v10 = name;
  MPSShapeToVector<unsigned long long>(v9, (uint64_t **)&__p);
  uint64_t v12 = (int32x4_t *)__p;
  unsigned int v11 = v35;
  uint64_t v13 = v35 - (unsigned char *)__p;
  uint64_t v14 = (v35 - (unsigned char *)__p) >> 3;
  if (v35 == __p)
  {
    id v16 = 0;
    objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", 0, v13 >> 1, 0, 0, 0);
  }
  else
  {
    if (v13 < 0) {
      std::vector<int>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v15 = (int32x4_t *)operator new((unint64_t)v13 >> 1);
    id v16 = v15;
    uint64_t v17 = (char *)v12;
    int64_t v18 = v15;
    if ((unint64_t)(v13 - 8) < 0x38) {
      goto LABEL_20;
    }
    unint64_t v19 = ((unint64_t)(v13 - 8) >> 3) + 1;
    uint64_t v17 = &v12->i8[8 * (v19 & 0x3FFFFFFFFFFFFFF8)];
    int64_t v18 = (int32x4_t *)((char *)v15 + 4 * (v19 & 0x3FFFFFFFFFFFFFF8));
    id v20 = v15 + 1;
    uint64_t v21 = v12 + 2;
    uint64_t v22 = v19 & 0x3FFFFFFFFFFFFFF8;
    do
    {
      int32x4_t v24 = v21[-2];
      int32x4_t v23 = v21[-1];
      int32x4_t v26 = *v21;
      int32x4_t v25 = v21[1];
      v21 += 4;
      v20[-1] = vuzp1q_s32(v24, v23);
      *id v20 = vuzp1q_s32(v26, v25);
      v20 += 2;
      v22 -= 8;
    }
    while (v22);
    if (v19 != (v19 & 0x3FFFFFFFFFFFFFF8))
    {
LABEL_20:
      do
      {
        uint64_t v27 = *(void *)v17;
        v17 += 8;
        v18->i32[0] = v27;
        int64_t v18 = (int32x4_t *)((char *)v18 + 4);
      }
      while (v17 != v11);
    }
    objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v15, v13 >> 1, v15, v18, (char *)v15 + 4 * v14);
  uint64_t v28 = };
  id v29 = [NSNumber numberWithUnsignedInteger:v14];
  v36[0] = v29;
  int v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  long long v31 = [(MPSGraph *)self constantWithData:v28 shape:v30 dataType:536870944];

  long long v32 = [(MPSGraph *)self squeezeTensor:v8 axesTensor:v31 name:0];

  if (v16) {
    operator delete(v16);
  }
  if (__p)
  {
    uint64_t v35 = (char *)__p;
    operator delete(__p);
  }

  return (MPSGraphTensor *)v32;
}

- (MPSGraphTensor)squeezeTensor:(MPSGraphTensor *)tensor axesTensor:(MPSGraphTensor *)axesTensor name:(NSString *)name
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  id v8 = tensor;
  id v9 = axesTensor;
  id v10 = name;
  unsigned int v11 = [(MPSGraph *)self fixCastIntTensor:v9 toSignedness:1 name:v10];

  uint64_t v12 = [MPSGraphSqueezeOp alloc];
  v18[0] = v8;
  v18[1] = v11;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  uint64_t v14 = [(MPSGraphOperation *)v12 initWithGraph:self inputTensors:v13 controlDependencies:MEMORY[0x1E4F1CBF0] name:v10];

  uint64_t v15 = [(MPSGraphOperation *)v14 outputTensors];
  id v16 = [v15 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v16;
}

- (id)squeezeTensor:(id)a3 dimensionTensor:(id)a4 name:(id)a5
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = [MPSGraphSqueezeOp alloc];
  v17[0] = v8;
  v17[1] = v9;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  uint64_t v13 = [(MPSGraphOperation *)v11 initWithGraph:self inputTensors:v12 controlDependencies:MEMORY[0x1E4F1CBF0] name:v10];

  uint64_t v14 = [(MPSGraphOperation *)v13 outputTensors];
  uint64_t v15 = [v14 objectAtIndexedSubscript:0];

  return v15;
}

- (id)squeezeTensor:(id)a3 dimension:(unint64_t)a4 name:(id)a5
{
  id v7 = a3;
  id v8 = [(MPSGraph *)self constantWithScalar:&unk_1EC9F1D90 shape:536870944 dataType:(double)a4];
  id v9 = [(MPSGraph *)self squeezeTensor:v7 dimensionTensor:v8 name:0];

  return v9;
}

- (MPSGraphTensor)expandDimsOfTensor:(MPSGraphTensor *)tensor axis:(NSInteger)axis name:(NSString *)name
{
  id v7 = tensor;
  id v8 = [(MPSGraph *)self constantWithScalar:&unk_1EC9F1DA8 shape:536870944 dataType:(double)axis];
  id v9 = [(MPSGraph *)self expandDimsOfTensor:v7 axesTensor:v8 name:0];

  return (MPSGraphTensor *)v9;
}

- (MPSGraphTensor)expandDimsOfTensor:(MPSGraphTensor *)tensor axes:(NSArray *)axes name:(NSString *)name
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v8 = tensor;
  id v9 = axes;
  id v10 = name;
  MPSShapeToVector<unsigned long long>(v9, (uint64_t **)&__p);
  uint64_t v12 = (int32x4_t *)__p;
  unsigned int v11 = v35;
  uint64_t v13 = v35 - (unsigned char *)__p;
  uint64_t v14 = (v35 - (unsigned char *)__p) >> 3;
  if (v35 == __p)
  {
    id v16 = 0;
    objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", 0, v13 >> 1, 0, 0, 0);
  }
  else
  {
    if (v13 < 0) {
      std::vector<int>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v15 = (int32x4_t *)operator new((unint64_t)v13 >> 1);
    id v16 = v15;
    uint64_t v17 = (char *)v12;
    int64_t v18 = v15;
    if ((unint64_t)(v13 - 8) < 0x38) {
      goto LABEL_20;
    }
    unint64_t v19 = ((unint64_t)(v13 - 8) >> 3) + 1;
    uint64_t v17 = &v12->i8[8 * (v19 & 0x3FFFFFFFFFFFFFF8)];
    int64_t v18 = (int32x4_t *)((char *)v15 + 4 * (v19 & 0x3FFFFFFFFFFFFFF8));
    id v20 = v15 + 1;
    uint64_t v21 = v12 + 2;
    uint64_t v22 = v19 & 0x3FFFFFFFFFFFFFF8;
    do
    {
      int32x4_t v24 = v21[-2];
      int32x4_t v23 = v21[-1];
      int32x4_t v26 = *v21;
      int32x4_t v25 = v21[1];
      v21 += 4;
      v20[-1] = vuzp1q_s32(v24, v23);
      *id v20 = vuzp1q_s32(v26, v25);
      v20 += 2;
      v22 -= 8;
    }
    while (v22);
    if (v19 != (v19 & 0x3FFFFFFFFFFFFFF8))
    {
LABEL_20:
      do
      {
        uint64_t v27 = *(void *)v17;
        v17 += 8;
        v18->i32[0] = v27;
        int64_t v18 = (int32x4_t *)((char *)v18 + 4);
      }
      while (v17 != v11);
    }
    objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v15, v13 >> 1, v15, v18, (char *)v15 + 4 * v14);
  uint64_t v28 = };
  id v29 = [NSNumber numberWithUnsignedInteger:v14];
  v36[0] = v29;
  int v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  long long v31 = [(MPSGraph *)self constantWithData:v28 shape:v30 dataType:536870944];

  long long v32 = [(MPSGraph *)self expandDimsOfTensor:v8 axesTensor:v31 name:0];

  if (v16) {
    operator delete(v16);
  }
  if (__p)
  {
    uint64_t v35 = (char *)__p;
    operator delete(__p);
  }

  return (MPSGraphTensor *)v32;
}

- (MPSGraphTensor)expandDimsOfTensor:(MPSGraphTensor *)tensor axesTensor:(MPSGraphTensor *)axesTensor name:(NSString *)name
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  id v8 = tensor;
  id v9 = axesTensor;
  id v10 = name;
  unsigned int v11 = [(MPSGraph *)self fixCastIntTensor:v9 toSignedness:1 name:0];

  uint64_t v12 = [MPSGraphExpandOp alloc];
  v18[0] = v8;
  v18[1] = v11;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  uint64_t v14 = [(MPSGraphOperation *)v12 initWithGraph:self inputTensors:v13 controlDependencies:MEMORY[0x1E4F1CBF0] name:v10];

  uint64_t v15 = [(MPSGraphOperation *)v14 outputTensors];
  id v16 = [v15 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v16;
}

- (id)expandTensor:(id)a3 dimensionTensor:(id)a4 name:(id)a5
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = [MPSGraphExpandOp alloc];
  v17[0] = v8;
  v17[1] = v9;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  uint64_t v13 = [(MPSGraphOperation *)v11 initWithGraph:self inputTensors:v12 controlDependencies:MEMORY[0x1E4F1CBF0] name:v10];

  uint64_t v14 = [(MPSGraphOperation *)v13 outputTensors];
  uint64_t v15 = [v14 objectAtIndexedSubscript:0];

  return v15;
}

- (id)expandTensor:(id)a3 dimension:(unint64_t)a4 name:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(MPSGraph *)self constantWithScalar:&unk_1EC9F1DC0 shape:536870944 dataType:(double)a4];
  unsigned int v11 = [(MPSGraph *)self expandTensor:v8 dimensionTensor:v10 name:v9];

  return v11;
}

- (NSArray)splitTensor:(MPSGraphTensor *)tensor splitSizes:(NSArray *)splitSizes axis:(NSInteger)axis name:(NSString *)name
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v10 = tensor;
  unsigned int v11 = name;
  MPSShapeToVector<int>(splitSizes, (char **)&__p);
  uint64_t v12 = v20 - (unsigned char *)__p;
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
  uint64_t v14 = [NSNumber numberWithUnsignedInteger:v12 >> 2];
  v21[0] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  id v16 = [(MPSGraph *)self constantWithData:v13 shape:v15 dataType:536870944];

  uint64_t v17 = [(MPSGraph *)self splitTensor:v10 splitSizesTensor:v16 axis:axis name:v11];

  if (__p)
  {
    id v20 = __p;
    operator delete(__p);
  }

  return (NSArray *)v17;
}

- (NSArray)splitTensor:(MPSGraphTensor *)tensor splitSizesTensor:(MPSGraphTensor *)splitSizesTensor axis:(NSInteger)axis name:(NSString *)name
{
  void v20[3] = *MEMORY[0x1E4F143B8];
  id v10 = tensor;
  unsigned int v11 = splitSizesTensor;
  uint64_t v12 = name;
  uint64_t v13 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)axis];
  uint64_t v14 = [(MPSGraph *)self fixCastIntTensor:v11 toSignedness:1 name:v12];

  uint64_t v15 = [MPSGraphSplitOp alloc];
  v20[0] = v10;
  v20[1] = v13;
  void v20[2] = v14;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  uint64_t v17 = [(MPSGraphSplitOp *)v15 initWithGraph:self inputTensors:v16 controlDependencies:MEMORY[0x1E4F1CBF0] dimension:axis name:v12];

  int64_t v18 = [(MPSGraphOperation *)v17 outputTensors];

  return (NSArray *)v18;
}

- (NSArray)splitTensor:(MPSGraphTensor *)tensor numSplits:(NSUInteger)numSplits axis:(NSInteger)axis name:(NSString *)name
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  id v10 = tensor;
  unsigned int v11 = name;
  uint64_t v12 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)axis];
  uint64_t v13 = [MPSGraphSplitOp alloc];
  v18[0] = v10;
  v18[1] = v12;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  uint64_t v15 = [(MPSGraphSplitOp *)v13 initWithGraph:self inputTensors:v14 controlDependencies:MEMORY[0x1E4F1CBF0] dimension:axis numSplits:numSplits name:v11];

  id v16 = [(MPSGraphOperation *)v15 outputTensors];

  return (NSArray *)v16;
}

- (MPSGraphTensor)stackTensors:(NSArray *)inputTensors axis:(NSInteger)axis name:(NSString *)name
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = inputTensors;
  NSInteger v21 = axis;
  uint64_t v22 = name;
  int32x4_t v24 = [(MPSGraph *)self constantWithScalar:&unk_1EC9F1DD8 shape:536870944 dataType:(double)axis];
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = v8;
  uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v27;
    if (v22) {
      uint64_t v12 = (__CFString *)v22;
    }
    else {
      uint64_t v12 = @"stack";
    }
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(id *)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v15 = [NSString stringWithFormat:@"%@/expand%lu", v12, v10 + i];
        id v16 = [(MPSGraph *)self expandTensor:v14 dimensionTensor:v24 name:v15];

        [v25 addObject:v16];
      }
      uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      v10 += i;
    }
    while (v9);
  }

  uint64_t v17 = (__CFString *)v22;
  if (!v22) {
    uint64_t v17 = @"stack";
  }
  int64_t v18 = [NSString stringWithFormat:@"%@/concat", v17];
  unint64_t v19 = [(MPSGraph *)self concatTensors:v25 dimension:v21 name:v18];

  return (MPSGraphTensor *)v19;
}

- (MPSGraphTensor)coordinateAlongAxis:(NSInteger)axis withShape:(MPSShape *)shape name:(NSString *)name
{
  id v8 = shape;
  uint64_t v9 = name;
  uint64_t v10 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)axis];
  uint64_t v11 = [(MPSGraph *)self coordinateAlongAxisTensor:v10 withShape:v8 name:v9];

  return (MPSGraphTensor *)v11;
}

- (MPSGraphTensor)coordinateAlongAxisTensor:(MPSGraphTensor *)axisTensor withShape:(MPSShape *)shape name:(NSString *)name
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = axisTensor;
  uint64_t v9 = shape;
  uint64_t v10 = name;
  uint64_t v11 = malloc_type_malloc(4 * [(MPSShape *)v9 count], 0x100004052888210uLL);
  for (unint64_t i = 0; i < [(MPSShape *)v9 count]; ++i)
  {
    uint64_t v13 = [(MPSShape *)v9 objectAtIndexedSubscript:i];
    v11[i] = [v13 intValue];
  }
  id v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v11, 4 * -[MPSShape count](v9, "count"));
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MPSShape count](v9, "count"));
  v20[0] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  uint64_t v17 = [(MPSGraph *)self constantWithData:v14 shape:v16 dataType:536870944];

  free(v11);
  int64_t v18 = [(MPSGraph *)self coordinateAlongAxisTensor:v8 withShapeTensor:v17 name:v10];

  return (MPSGraphTensor *)v18;
}

- (MPSGraphTensor)coordinateAlongAxis:(NSInteger)axis withShapeTensor:(MPSGraphTensor *)shapeTensor name:(NSString *)name
{
  id v8 = shapeTensor;
  uint64_t v9 = name;
  uint64_t v10 = [(MPSGraph *)self constantWithScalar:536870944 dataType:(double)axis];
  uint64_t v11 = [(MPSGraph *)self coordinateAlongAxisTensor:v10 withShapeTensor:v8 name:v9];

  return (MPSGraphTensor *)v11;
}

- (MPSGraphTensor)coordinateAlongAxisTensor:(MPSGraphTensor *)axisTensor withShapeTensor:(MPSGraphTensor *)shapeTensor name:(NSString *)name
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = axisTensor;
  uint64_t v9 = shapeTensor;
  uint64_t v10 = name;
  uint64_t v11 = [(MPSGraph *)self fixCastIntTensor:v9 toSignedness:1 name:v10];

  uint64_t v12 = [MPSGraphGetCoordOp alloc];
  v17[0] = v11;
  v17[1] = v8;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  id v14 = [(MPSGraphOperation *)v12 initWithGraph:self inputTensors:v13 controlDependencies:MEMORY[0x1E4F1CBF0] name:v10];

  uint64_t v15 = [v14[3] objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v15;
}

- (id)getCoordinateValueWithShapeTensor:(id)a3 axisTensor:(id)a4 name:(id)a5
{
  uint64_t v5 = [(MPSGraph *)self coordinateAlongAxisTensor:a4 withShapeTensor:a3 name:a5];

  return v5;
}

- (id)fixCastIntTensor:(id)a3 toSignedness:(BOOL)a4 name:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  int v10 = [v8 dataType];
  if (v10 > 536870943)
  {
    if (v10 != 536870944)
    {
      if (v10 != 536870976)
      {
LABEL_11:
        id v12 = v8;
        goto LABEL_17;
      }
      goto LABEL_7;
    }
LABEL_12:
    if (v6) {
      int v13 = 536870944;
    }
    else {
      int v13 = 32;
    }
    if (v10 == v13) {
      goto LABEL_11;
    }
    goto LABEL_16;
  }
  if (v10 == 32) {
    goto LABEL_12;
  }
  if (v10 != 64) {
    goto LABEL_11;
  }
LABEL_7:
  if (v6) {
    int v11 = 536870976;
  }
  else {
    int v11 = 64;
  }
  if (v10 == v11) {
    goto LABEL_11;
  }
LABEL_16:
  -[MPSGraph castTensor:toType:name:](self, "castTensor:toType:name:", v8);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
  id v14 = v12;

  return v14;
}

- (id)interleaveTensor:(id)a3 interleaveFactor:(unint64_t)a4 name:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int v10 = [MPSGraphInterleaveOp alloc];
  v16[0] = v8;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v12 = [(MPSGraphInterleaveOp *)v10 initWithGraph:self inputTensors:v11 controlDependencies:MEMORY[0x1E4F1CBF0] interleaveFactor:a4 name:v9];

  int v13 = [(MPSGraphOperation *)v12 outputTensors];
  id v14 = [v13 objectAtIndexedSubscript:0];

  return v14;
}

- (id)deinterleaveTensor:(id)a3 interleaveFactor:(unint64_t)a4 name:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int v10 = [MPSGraphDeinterleaveOp alloc];
  v16[0] = v8;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v12 = [(MPSGraphDeinterleaveOp *)v10 initWithGraph:self inputTensors:v11 controlDependencies:MEMORY[0x1E4F1CBF0] interleaveFactor:a4 name:v9];

  int v13 = [(MPSGraphOperation *)v12 outputTensors];
  id v14 = [v13 objectAtIndexedSubscript:0];

  return v14;
}

- (id)makeListWithElementType:(id)a3 maxSize:(unint64_t)a4 name:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int v10 = [MPSGraphMakeListOp alloc];
  int v11 = [NSNumber numberWithUnsignedLong:a4];
  id v12 = [(MPSGraphMakeListOp *)v10 initWithGraph:self inputTensors:MEMORY[0x1E4F1CBF0] controlDependencies:MEMORY[0x1E4F1CBF0] elementType:v8 maxSize:v11 name:v9];

  int v13 = [(MPSGraphOperation *)v12 outputTensors];
  id v14 = [v13 objectAtIndexedSubscript:0];

  return v14;
}

- (id)makeListWithElementType:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MPSGraphMakeListOp alloc];
  id v9 = [(MPSGraphMakeListOp *)v8 initWithGraph:self inputTensors:MEMORY[0x1E4F1CBF0] controlDependencies:MEMORY[0x1E4F1CBF0] elementType:v6 maxSize:0 name:v7];
  int v10 = [(MPSGraphOperation *)v9 outputTensors];
  int v11 = [v10 objectAtIndexedSubscript:0];

  return v11;
}

- (id)pushBackToList:(id)a3 element:(id)a4 name:(id)a5
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [MPSGraphListPushBackOp alloc];
  v17[0] = v8;
  v17[1] = v9;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  int v13 = [(MPSGraphOperation *)v11 initWithGraph:self inputTensors:v12 controlDependencies:MEMORY[0x1E4F1CBF0] name:v10];

  id v14 = [(MPSGraphOperation *)v13 outputTensors];
  uint64_t v15 = [v14 objectAtIndexedSubscript:0];

  return v15;
}

- (id)popBackFromList:(id)a3 outputList:(id *)a4 name:(id)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [MPSGraphListPopBackOp alloc];
  v17[0] = v8;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  id v12 = [(MPSGraphOperation *)v10 initWithGraph:self inputTensors:v11 controlDependencies:MEMORY[0x1E4F1CBF0] name:v9];

  int v13 = [(MPSGraphOperation *)v12 outputTensors];
  *a4 = [v13 objectAtIndexedSubscript:0];

  id v14 = [(MPSGraphOperation *)v12 outputTensors];
  uint64_t v15 = [v14 objectAtIndexedSubscript:1];

  return v15;
}

- (id)localConvolutionWithSourceTensor:(id)a3 weightTensor:(id)a4 dataLayout:(unint64_t)a5 kernelShape:(id)a6 dilationRateInX:(unint64_t)a7 dilationRateInY:(unint64_t)a8 name:(id)a9
{
  void v25[2] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a9;
  unint64_t v19 = [MPSGraphLocalConvolutionOp alloc];
  v25[0] = v15;
  v25[1] = v16;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  NSInteger v21 = [(MPSGraphLocalConvolutionOp *)v19 initWithGraph:self inputTensors:v20 controlDependencies:MEMORY[0x1E4F1CBF0] dataLayout:a5 kernelShape:v17 dilationRateInX:a7 dilationRateInY:a8 name:v18];

  uint64_t v22 = [(MPSGraphOperation *)v21 outputTensors];
  int32x4_t v23 = [v22 objectAtIndexedSubscript:0];

  return v23;
}

- (id)localConvolutionWeightGradientWithIncomingGradientTensor:(id)a3 sourceTensor:(id)a4 dataLayout:(unint64_t)a5 kernelShape:(id)a6 dilationRateInX:(unint64_t)a7 dilationRateInY:(unint64_t)a8 name:(id)a9
{
  void v25[2] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a9;
  unint64_t v19 = [MPSGraphLocalConvolutionWeightGradientOp alloc];
  v25[0] = v15;
  v25[1] = v16;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  NSInteger v21 = [(MPSGraphLocalConvolutionWeightGradientOp *)v19 initWithGraph:self inputTensors:v20 controlDependencies:MEMORY[0x1E4F1CBF0] dataLayout:a5 kernelShape:v17 dilationRateInX:a7 dilationRateInY:a8 name:v18];

  uint64_t v22 = [(MPSGraphOperation *)v21 outputTensors];
  int32x4_t v23 = [v22 objectAtIndexedSubscript:0];

  return v23;
}

- (id)localConvolutionDataGradientWithIncomingGradientTensor:(id)a3 weightTensor:(id)a4 dataLayout:(unint64_t)a5 kernelShape:(id)a6 dilationRateInX:(unint64_t)a7 dilationRateInY:(unint64_t)a8 name:(id)a9
{
  void v25[2] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a9;
  unint64_t v19 = [MPSGraphLocalConvolutionDataGradientOp alloc];
  v25[0] = v15;
  v25[1] = v16;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  NSInteger v21 = [(MPSGraphLocalConvolutionDataGradientOp *)v19 initWithGraph:self inputTensors:v20 controlDependencies:MEMORY[0x1E4F1CBF0] dataLayout:a5 kernelShape:v17 dilationRateInX:a7 dilationRateInY:a8 name:v18];

  uint64_t v22 = [(MPSGraphOperation *)v21 outputTensors];
  int32x4_t v23 = [v22 objectAtIndexedSubscript:0];

  return v23;
}

- (id)variableOps
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithArray:self->_variableOps];
}

- (id)traininableHighLevelOpVariables
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithArray:self->_traininableHighLevelOpVariables];
}

- (id)convolution2DLayerWithTensor:(id)a3 kernelSizes:(id)a4 outputChannelCount:(unint64_t)a5 strides:(id)a6 activationType:(unsigned int)a7 weightsInitializer:(id)a8 biasesInitializer:(id)a9 batchNormalizationGammaInitializer:(id)a10 batchNormalizationBetaInitializer:(id)a11 batchNormalizationMeanInitializer:(id)a12 batchNormalizationVarianceInitializer:(id)a13 batchNormalizationEpsilon:(double)a14 paddingStyle:(unint64_t)a15 dataLayout:(unint64_t)a16 weightsLayout:(unint64_t)a17 name:(id)a18
{
  LODWORD(v20) = a7;
  -[MPSGraph convolution2DLayerWithTensor:kernelSizes:outputChannelCount:strides:dilationRates:groups:activationType:weightsInitializer:biasesInitializer:batchNormalizationGammaInitializer:batchNormalizationBetaInitializer:batchNormalizationMeanInitializer:batchNormalizationVarianceInitializer:batchNormalizationEpsilon:paddingStyle:dataLayout:weightsLayout:name:](self, "convolution2DLayerWithTensor:kernelSizes:outputChannelCount:strides:dilationRates:groups:activationType:weightsInitializer:biasesInitializer:batchNormalizationGammaInitializer:batchNormalizationBetaInitializer:batchNormalizationMeanInitializer:batchNormalizationVarianceInitializer:batchNormalizationEpsilon:paddingStyle:dataLayout:weightsLayout:name:", a3, a4, a5, a6, &unk_1EC9F1E50, 1, a14, v20, a8, a9, a10, a11, a12, a13, a15,
    a16,
    a17,
  id v18 = a18);

  return v18;
}

- (id)convolution2DLayerWithTensor:(id)a3 kernelSizes:(id)a4 outputChannelCount:(unint64_t)a5 strides:(id)a6 activationType:(unsigned int)a7 weightsInitializer:(id)a8 biasesInitializer:(id)a9 paddingStyle:(unint64_t)a10 dataLayout:(unint64_t)a11 weightsLayout:(unint64_t)a12 name:(id)a13
{
  LODWORD(v15) = a7;
  -[MPSGraph convolution2DLayerWithTensor:kernelSizes:outputChannelCount:strides:dilationRates:groups:activationType:weightsInitializer:biasesInitializer:batchNormalizationGammaInitializer:batchNormalizationBetaInitializer:batchNormalizationMeanInitializer:batchNormalizationVarianceInitializer:batchNormalizationEpsilon:paddingStyle:dataLayout:weightsLayout:name:](self, "convolution2DLayerWithTensor:kernelSizes:outputChannelCount:strides:dilationRates:groups:activationType:weightsInitializer:biasesInitializer:batchNormalizationGammaInitializer:batchNormalizationBetaInitializer:batchNormalizationMeanInitializer:batchNormalizationVarianceInitializer:batchNormalizationEpsilon:paddingStyle:dataLayout:weightsLayout:name:", a3, a4, a5, a6, &unk_1EC9F1E80, 1, 0.001, v15, a8, a9, 0, 0, 0, 0, a10,
    a11,
    a12,
  int v13 = a13);

  return v13;
}

- (id)maxPooling2DLayerWithTensor:(id)a3 kernelSizes:(id)a4 strides:(id)a5 paddingStyle:(unint64_t)a6 dataLayout:(unint64_t)a7 name:(id)a8
{
  id v27 = a3;
  id v11 = a4;
  id v12 = a5;
  id v26 = a8;
  int v13 = [v11 objectAtIndexedSubscript:1];
  uint64_t v14 = [v13 integerValue];
  uint64_t v15 = [v11 objectAtIndexedSubscript:0];
  uint64_t v16 = [v15 integerValue];
  id v17 = [v12 objectAtIndexedSubscript:1];
  uint64_t v18 = [v17 integerValue];
  unint64_t v19 = [v12 objectAtIndexedSubscript:0];
  uint64_t v20 = +[MPSGraphPooling2DOpDescriptor descriptorWithKernelWidth:kernelHeight:strideInX:strideInY:paddingStyle:dataLayout:](MPSGraphPooling2DOpDescriptor, "descriptorWithKernelWidth:kernelHeight:strideInX:strideInY:paddingStyle:dataLayout:", v14, v16, v18, [v19 integerValue], a6, a7);

  NSInteger v21 = [(MPSGraph *)self maxPooling2DWithSourceTensor:v27 descriptor:v20 name:v26];

  return v21;
}

- (id)absoluteErrorWithPrimaryTensor:(id)a3 secondaryTensor:(id)a4 reductionType:(unint64_t)a5 name:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = @"absoluteError";
  if (a6) {
    id v12 = (__CFString *)a6;
  }
  int v13 = v12;
  uint64_t v14 = [(__CFString *)v13 stringByAppendingString:@"/subtraction"];
  uint64_t v15 = [(MPSGraph *)self subtractionWithPrimaryTensor:v10 secondaryTensor:v11 name:v14];

  uint64_t v16 = [(__CFString *)v13 stringByAppendingString:@"/absolute"];
  id v17 = [(MPSGraph *)self absoluteWithTensor:v15 name:v16];

  uint64_t v18 = [(MPSGraph *)self lossReductionWithTensor:v17 reductionType:a5 axis:0 name:v13];

  return v18;
}

- (id)squaredErrorWithPrimaryTensor:(id)a3 secondaryTensor:(id)a4 reductionType:(unint64_t)a5 name:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = @"squaredError";
  if (a6) {
    id v12 = (__CFString *)a6;
  }
  int v13 = v12;
  uint64_t v14 = [(__CFString *)v13 stringByAppendingString:@"/subtraction"];
  uint64_t v15 = [(MPSGraph *)self subtractionWithPrimaryTensor:v10 secondaryTensor:v11 name:v14];

  uint64_t v16 = [(__CFString *)v13 stringByAppendingString:@"/square"];
  id v17 = [(MPSGraph *)self squareWithTensor:v15 name:v16];

  id v18 = v17;
  unint64_t v19 = v18;
  if (!a5)
  {
    uint64_t v20 = -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", [v10 dataType], 0.5);
    NSInteger v21 = [(__CFString *)v13 stringByAppendingString:@"/mul"];
    unint64_t v19 = [(MPSGraph *)self multiplicationWithPrimaryTensor:v18 secondaryTensor:v20 name:v21];
  }
  uint64_t v22 = [(MPSGraph *)self lossReductionWithTensor:v19 reductionType:a5 axis:0 name:v13];

  return v22;
}

- (id)kernelPredictorWithSourceTensor:(id)a3 weightsTensor:(id)a4 layout:(unint64_t)a5 kernelShape:(id)a6 name:(id)a7
{
  id v7 = [(MPSGraph *)self kernelPredictorWithSourceTensor:a3 weightsTensor:a4 layout:a5 kernelShape:a6 dilationRates:&unk_1EC9F1E98 name:a7];

  return v7;
}

- (id)kernelPredictorWithSourceTensor:(id)a3 weightsTensor:(id)a4 layout:(unint64_t)a5 kernelShape:(id)a6 dilationRates:(id)a7 name:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = @"kernelPredictor";
  if (a8) {
    id v18 = (__CFString *)a8;
  }
  unint64_t v19 = v18;
  uint64_t v20 = [v17 objectAtIndexedSubscript:0];
  uint64_t v21 = [v20 integerValue];
  uint64_t v22 = [v17 objectAtIndexedSubscript:1];
  int32x4_t v23 = -[MPSGraph localConvolutionWithSourceTensor:weightTensor:dataLayout:kernelShape:dilationRateInX:dilationRateInY:name:](self, "localConvolutionWithSourceTensor:weightTensor:dataLayout:kernelShape:dilationRateInX:dilationRateInY:name:", v14, v15, a5, v16, v21, [v22 integerValue], v19);

  return v23;
}

- (id)stitchedOpsWithBlock:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MPSGraphStitchedOp alloc];
  id v9 = [(MPSGraphStitchedOp *)v8 initWithGraph:self withBlock:v6 inputTensors:MEMORY[0x1E4F1CBF0] controlDependencies:MEMORY[0x1E4F1CBF0] name:v7];
  id v10 = [(MPSGraphOperation *)v9 outputTensors];
  id v11 = [v10 objectAtIndexedSubscript:0];

  return v11;
}

- (id)varFromTensorWithTensor:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[MPSGraphVariableFromTensorOp alloc] initWithGraph:self tensor:v6 name:v7];
  id v9 = [(MPSGraphOperation *)v8 outputTensors];
  id v10 = [v9 objectAtIndexedSubscript:0];
  [v10 value];

  id v11 = [(MPSGraphOperation *)v8 outputTensors];
  id v12 = [v11 objectAtIndexedSubscript:0];

  return v12;
}

- (MPSGraphTensor)matrixMultiplicationWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor name:(NSString *)name
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = primaryTensor;
  id v9 = secondaryTensor;
  id v10 = name;
  id v11 = [MPSGraphMatrixMultiplicationOp alloc];
  v17[0] = v8;
  v17[1] = v9;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  int v13 = [(MPSGraphOperation *)v11 initWithGraph:self inputTensors:v12 controlDependencies:MEMORY[0x1E4F1CBF0] name:v10];

  id v14 = [(MPSGraphOperation *)v13 outputTensors];
  id v15 = [v14 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v15;
}

- (id)matrixMultiplicationPrimaryGradientWithIncomingGradientTensor:(id)a3 primaryTensor:(id)a4 secondaryTensor:(id)a5 name:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (v13)
  {
    id v15 = [v13 stringByAppendingString:@"/transpose"];
  }
  else
  {
    id v15 = @"matMulGrad/transpose";
  }
  id v16 = [(MPSGraph *)self transposeTensor:v12 dimension:-1 withDimension:-2 name:v15];
  if (v14) {

  }
  id v17 = [(MPSGraph *)self matrixMultiplicationWithPrimaryTensor:v10 secondaryTensor:v16 name:v14];

  return v17;
}

- (id)matrixMultiplicationSecondaryGradientWithIncomingGradientTensor:(id)a3 primaryTensor:(id)a4 secondaryTensor:(id)a5 name:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (v13)
  {
    id v15 = [v13 stringByAppendingString:@"/transpose"];
  }
  else
  {
    id v15 = @"matMulGrad/transpose";
  }
  id v16 = [(MPSGraph *)self transposeTensor:v11 dimension:-1 withDimension:-2 name:v15];
  if (v14) {

  }
  id v17 = [(MPSGraph *)self matrixMultiplicationWithPrimaryTensor:v16 secondaryTensor:v10 name:v14];

  return v17;
}

- (MPSGraphTensor)HammingDistanceWithPrimaryTensor:(MPSGraphTensor *)primaryTensor secondaryTensor:(MPSGraphTensor *)secondaryTensor resultDataType:(MPSDataType)resultDataType name:(NSString *)name
{
  uint64_t v7 = *(void *)&resultDataType;
  void v19[2] = *MEMORY[0x1E4F143B8];
  id v10 = primaryTensor;
  id v11 = secondaryTensor;
  id v12 = name;
  id v13 = [MPSGraphHammingDistanceOp alloc];
  v19[0] = v10;
  v19[1] = v11;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  id v15 = [(MPSGraphHammingDistanceOp *)v13 initWithGraph:self inputTensors:v14 controlDependencies:MEMORY[0x1E4F1CBF0] resultDataType:v7 name:v12];

  id v16 = [(MPSGraphOperation *)v15 outputTensors];
  id v17 = [v16 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v17;
}

- (id)scaledDotProductAttentionWithQueryTensor:(id)a3 keyTensor:(id)a4 valueTensor:(id)a5 maskTensor:(id)a6 scale:(float)a7 name:(id)a8
{
  void v28[5] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = v17;
  uint64_t v20 = v19;
  if (!v19)
  {
    uint64_t v20 = -[MPSGraph constantWithScalar:shape:dataType:](self, "constantWithScalar:shape:dataType:", &unk_1EC9F1F70, [v14 dataType], 0.0);
  }
  uint64_t v21 = -[MPSGraph constantWithScalar:dataType:](self, "constantWithScalar:dataType:", [v14 dataType], a7);
  uint64_t v22 = [MPSGraphScaledDotProductAttentionOp alloc];
  v28[0] = v14;
  v28[1] = v15;
  void v28[2] = v16;
  v28[3] = v20;
  v28[4] = v21;
  int32x4_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:5];
  int32x4_t v24 = [(MPSGraphOperation *)v22 initWithGraph:self inputTensors:v23 controlDependencies:MEMORY[0x1E4F1CBF0] name:v18];

  id v25 = [(MPSGraphOperation *)v24 outputTensors];
  id v26 = [v25 objectAtIndexedSubscript:0];

  return v26;
}

- (id)scaledDotProductAttentionWithQueryTensor:(id)a3 keyTensor:(id)a4 valueTensor:(id)a5 scale:(float)a6 name:(id)a7
{
  uint64_t v7 = -[MPSGraph scaledDotProductAttentionWithQueryTensor:keyTensor:valueTensor:maskTensor:scale:name:](self, "scaledDotProductAttentionWithQueryTensor:keyTensor:valueTensor:maskTensor:scale:name:", a3, a4, a5, 0, a7);

  return v7;
}

- (MPSGraphTensor)quantizeTensor:(MPSGraphTensor *)tensor scale:(double)scale zeroPoint:(double)zeroPoint dataType:(MPSDataType)dataType name:(NSString *)name
{
  uint64_t v8 = *(void *)&dataType;
  void v22[3] = *MEMORY[0x1E4F143B8];
  id v12 = tensor;
  id v13 = name;
  id v14 = [(MPSGraph *)self constantWithScalar:268435488 dataType:scale];
  id v15 = [(MPSGraph *)self constantWithScalar:536870920 dataType:zeroPoint];
  id v16 = [MPSGraphQuantizeOp alloc];
  v22[0] = v12;
  v22[1] = v14;
  void v22[2] = v15;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  id v18 = [(MPSGraphQuantizeOp *)v16 initWithGraph:self inputTensors:v17 controlDependencies:MEMORY[0x1E4F1CBF0] dataType:v8 axis:0 name:v13];

  id v19 = [(MPSGraphOperation *)v18 outputTensors];
  uint64_t v20 = [v19 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v20;
}

- (MPSGraphTensor)dequantizeTensor:(MPSGraphTensor *)tensor scale:(double)scale zeroPoint:(double)zeroPoint dataType:(MPSDataType)dataType name:(NSString *)name
{
  uint64_t v8 = *(void *)&dataType;
  void v22[3] = *MEMORY[0x1E4F143B8];
  id v12 = tensor;
  id v13 = name;
  id v14 = [(MPSGraph *)self constantWithScalar:268435488 dataType:scale];
  id v15 = [(MPSGraph *)self constantWithScalar:536870944 dataType:zeroPoint];
  id v16 = [MPSGraphDequantizeOp alloc];
  v22[0] = v12;
  v22[1] = v14;
  void v22[2] = v15;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  id v18 = [(MPSGraphDequantizeOp *)v16 initWithGraph:self inputTensors:v17 controlDependencies:MEMORY[0x1E4F1CBF0] dataType:v8 axis:0 name:v13];

  id v19 = [(MPSGraphOperation *)v18 outputTensors];
  uint64_t v20 = [v19 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v20;
}

- (MPSGraphTensor)quantizeTensor:(MPSGraphTensor *)tensor scaleTensor:(MPSGraphTensor *)scaleTensor zeroPoint:(double)zeroPoint dataType:(MPSDataType)dataType axis:(NSInteger)axis name:(NSString *)name
{
  uint64_t v9 = *(void *)&dataType;
  id v13 = tensor;
  id v14 = scaleTensor;
  id v15 = [(MPSGraph *)self constantWithScalar:536870920 dataType:zeroPoint];
  id v16 = [(MPSGraph *)self quantizeTensor:v13 scaleTensor:v14 zeroPointTensor:v15 dataType:v9 axis:axis name:0];

  return (MPSGraphTensor *)v16;
}

- (MPSGraphTensor)dequantizeTensor:(MPSGraphTensor *)tensor scaleTensor:(MPSGraphTensor *)scaleTensor zeroPoint:(double)zeroPoint dataType:(MPSDataType)dataType axis:(NSInteger)axis name:(NSString *)name
{
  uint64_t v9 = *(void *)&dataType;
  id v13 = tensor;
  id v14 = scaleTensor;
  id v15 = [(MPSGraph *)self constantWithScalar:536870944 dataType:zeroPoint];
  id v16 = [(MPSGraph *)self dequantizeTensor:v13 scaleTensor:v14 zeroPointTensor:v15 dataType:v9 axis:axis name:0];

  return (MPSGraphTensor *)v16;
}

- (MPSGraphTensor)quantizeTensor:(MPSGraphTensor *)tensor scaleTensor:(MPSGraphTensor *)scaleTensor zeroPointTensor:(MPSGraphTensor *)zeroPointTensor dataType:(MPSDataType)dataType axis:(NSInteger)axis name:(NSString *)name
{
  uint64_t v10 = *(void *)&dataType;
  void v25[3] = *MEMORY[0x1E4F143B8];
  id v14 = tensor;
  id v15 = scaleTensor;
  id v16 = zeroPointTensor;
  id v17 = name;
  id v18 = [MPSGraphQuantizeOp alloc];
  v25[0] = v14;
  v25[1] = v15;
  void v25[2] = v16;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:3];
  uint64_t v20 = [NSNumber numberWithInteger:axis];
  uint64_t v21 = [(MPSGraphQuantizeOp *)v18 initWithGraph:self inputTensors:v19 controlDependencies:MEMORY[0x1E4F1CBF0] dataType:v10 axis:v20 name:v17];

  uint64_t v22 = [(MPSGraphOperation *)v21 outputTensors];
  int32x4_t v23 = [v22 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v23;
}

- (MPSGraphTensor)dequantizeTensor:(MPSGraphTensor *)tensor scaleTensor:(MPSGraphTensor *)scaleTensor zeroPointTensor:(MPSGraphTensor *)zeroPointTensor dataType:(MPSDataType)dataType axis:(NSInteger)axis name:(NSString *)name
{
  uint64_t v10 = *(void *)&dataType;
  void v25[3] = *MEMORY[0x1E4F143B8];
  id v14 = tensor;
  id v15 = scaleTensor;
  id v16 = zeroPointTensor;
  id v17 = name;
  id v18 = [MPSGraphDequantizeOp alloc];
  v25[0] = v14;
  v25[1] = v15;
  void v25[2] = v16;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:3];
  uint64_t v20 = [NSNumber numberWithInteger:axis];
  uint64_t v21 = [(MPSGraphDequantizeOp *)v18 initWithGraph:self inputTensors:v19 controlDependencies:MEMORY[0x1E4F1CBF0] dataType:v10 axis:v20 name:v17];

  uint64_t v22 = [(MPSGraphOperation *)v21 outputTensors];
  int32x4_t v23 = [v22 objectAtIndexedSubscript:0];

  return (MPSGraphTensor *)v23;
}

- (id)dequantizeTensor:(id)a3 scaleTensor:(id)a4 zeroPointTensor:(id)a5 minTensor:(id)a6 dataType:(unsigned int)a7 axis:(int64_t)a8 name:(id)a9
{
  uint64_t v10 = *(void *)&a7;
  void v27[4] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  uint64_t v20 = [MPSGraphDequantizeOp alloc];
  v27[0] = v15;
  v27[1] = v16;
  void v27[2] = v17;
  v27[3] = v18;
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
  uint64_t v22 = [NSNumber numberWithInteger:a8];
  int32x4_t v23 = [(MPSGraphDequantizeOp *)v20 initWithGraph:self inputTensors:v21 controlDependencies:MEMORY[0x1E4F1CBF0] dataType:v10 axis:v22 name:v19];

  int32x4_t v24 = [(MPSGraphOperation *)v23 outputTensors];
  id v25 = [v24 objectAtIndexedSubscript:0];

  return v25;
}

- (id)dequantizeTensor:(id)a3 scaleTensor:(id)a4 zeroPointTensor:(id)a5 minTensor:(id)a6 dataType:(unsigned int)a7 name:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  void v25[4] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = [MPSGraphDequantizeOp alloc];
  v25[0] = v14;
  v25[1] = v15;
  void v25[2] = v16;
  void v25[3] = v17;
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
  uint64_t v21 = [(MPSGraphDequantizeOp *)v19 initWithGraph:self inputTensors:v20 controlDependencies:MEMORY[0x1E4F1CBF0] dataType:v9 axis:0 name:v18];

  uint64_t v22 = [(MPSGraphOperation *)v21 outputTensors];
  int32x4_t v23 = [v22 objectAtIndexedSubscript:0];

  return v23;
}

- (id)quantizeTensor:(id)a3 scale:(double)a4 zeroPoint:(double)a5 dtype:(unsigned int)a6 name:(id)a7
{
  uint64_t v7 = [(MPSGraph *)self quantizeTensor:a3 scale:*(void *)&a6 zeroPoint:a7 dataType:a4 name:a5];

  return v7;
}

- (id)dequantizeTensor:(id)a3 scale:(double)a4 zeroPoint:(double)a5 dtype:(unsigned int)a6 name:(id)a7
{
  uint64_t v7 = [(MPSGraph *)self dequantizeTensor:a3 scale:*(void *)&a6 zeroPoint:a7 dataType:a4 name:a5];

  return v7;
}

- (id)quantizeTensor:(id)a3 scaleTensor:(id)a4 zeroPoint:(double)a5 dtype:(unsigned int)a6 axis:(int)a7 name:(id)a8
{
  uint64_t v8 = [(MPSGraph *)self quantizeTensor:a3 scaleTensor:a4 zeroPoint:*(void *)&a6 dataType:a7 axis:a8 name:a5];

  return v8;
}

- (id)dequantizeTensor:(id)a3 scaleTensor:(id)a4 zeroPoint:(double)a5 dtype:(unsigned int)a6 axis:(int)a7 name:(id)a8
{
  uint64_t v8 = [(MPSGraph *)self dequantizeTensor:a3 scaleTensor:a4 zeroPoint:*(void *)&a6 dataType:a7 axis:a8 name:a5];

  return v8;
}

- (id)quantizeTensor:(id)a3 scaleTensor:(id)a4 zeroPointTensor:(id)a5 dtype:(unsigned int)a6 axis:(int)a7 name:(id)a8
{
  uint64_t v8 = [(MPSGraph *)self quantizeTensor:a3 scaleTensor:a4 zeroPointTensor:a5 dataType:*(void *)&a6 axis:a7 name:a8];

  return v8;
}

- (id)dequantizeTensor:(id)a3 scaleTensor:(id)a4 zeroPointTensor:(id)a5 dtype:(unsigned int)a6 axis:(int)a7 name:(id)a8
{
  uint64_t v8 = [(MPSGraph *)self dequantizeTensor:a3 scaleTensor:a4 zeroPointTensor:a5 dataType:*(void *)&a6 axis:a7 name:a8];

  return v8;
}

- (id)dequantizeTensor:(id)a3 LUTTensor:(id)a4 name:(id)a5
{
  uint64_t v5 = [(MPSGraph *)self dequantizeTensor:a3 lutTableTensor:a4 name:a5];

  return v5;
}

- (id)dequantizeTensor:(id)a3 LUTTensor:(id)a4 axis:(int64_t)a5 name:(id)a6
{
  id v6 = [(MPSGraph *)self dequantizeTensor:a3 lutTableTensor:a4 axis:a5 name:a6];

  return v6;
}

- (id)dequantizeTensor:(id)a3 scaleTensor:(id)a4 zeroPointTensor:(id)a5 dataType:(unsigned int)a6 name:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  void v22[3] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = [MPSGraphDequantizeOp alloc];
  v22[0] = v12;
  v22[1] = v13;
  void v22[2] = v14;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  id v18 = [(MPSGraphDequantizeOp *)v16 initWithGraph:self inputTensors:v17 controlDependencies:MEMORY[0x1E4F1CBF0] dataType:v8 axis:0 name:v15];

  id v19 = [(MPSGraphOperation *)v18 outputTensors];
  uint64_t v20 = [v19 objectAtIndexedSubscript:0];

  return v20;
}

- (id)dequantizeTensor:(id)a3 scaleTensor:(id)a4 dataType:(unsigned int)a5 name:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  void v20[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(MPSGraph *)self constantWithScalar:536870920 dataType:0.0];
  id v14 = [MPSGraphDequantizeOp alloc];
  v20[0] = v10;
  v20[1] = v11;
  void v20[2] = v13;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  id v16 = [(MPSGraphDequantizeOp *)v14 initWithGraph:self inputTensors:v15 controlDependencies:MEMORY[0x1E4F1CBF0] dataType:v7 axis:0 name:v12];

  id v17 = [(MPSGraphOperation *)v16 outputTensors];
  id v18 = [v17 objectAtIndexedSubscript:0];

  return v18;
}

- (id)dequantizeTensor:(id)a3 lutTableTensor:(id)a4 name:(id)a5
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MPSGraphDequantizeLUTOp alloc];
  v17[0] = v8;
  v17[1] = v9;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  id v13 = [(MPSGraphDequantizeLUTOp *)v11 initWithGraph:self inputTensors:v12 controlDependencies:MEMORY[0x1E4F1CBF0] axis:0 name:v10];

  id v14 = [(MPSGraphOperation *)v13 outputTensors];
  id v15 = [v14 objectAtIndexedSubscript:0];

  return v15;
}

- (id)dequantizeTensor:(id)a3 lutTableTensor:(id)a4 axis:(int64_t)a5 name:(id)a6
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [MPSGraphDequantizeLUTOp alloc];
  v20[0] = v10;
  v20[1] = v11;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  id v15 = [NSNumber numberWithInteger:a5];
  id v16 = [(MPSGraphDequantizeLUTOp *)v13 initWithGraph:self inputTensors:v14 controlDependencies:MEMORY[0x1E4F1CBF0] axis:v15 name:v12];

  id v17 = [(MPSGraphOperation *)v16 outputTensors];
  id v18 = [v17 objectAtIndexedSubscript:0];

  return v18;
}

@end