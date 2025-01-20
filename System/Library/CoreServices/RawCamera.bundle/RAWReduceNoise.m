@interface RAWReduceNoise
+ (id)customAttributes;
+ (id)smartNoiseAdjustmentsForValue:(double)a3 andStatistics:(id)a4;
+ (id)smartNoiseStatistics:(id)a3;
- (BOOL)isBayerGreenAlignedforImage:(id)a3 andPattern:(int)a4;
- (float)adjustedRNAmount;
- (id)V8OutputImage;
- (id)YAndRGBGather:(id)a3 cnrRGB:(id)a4 sushiFactors:(id)a5 crop:(CGRect)a6 lumFactors:(id)a7;
- (id)YAndRGBGatherOpponentColor:(id)a3 cnrRGB:(id)a4 originalY:(id)a5 sushiFactors:(id)a6 crop:(CGRect)a7 lumFactors:(id)a8;
- (id)addNoise:(id)a3 noise:(id)a4 amount:(float)a5;
- (id)blurGradient:(id)a3 lothresh:(float)a4 factor:(float)a5;
- (id)blurGradientPlusCurvature:(id)a3 lothresh:(float)a4 factor:(float)a5 cthresh:(float)a6 cfactor:(float)a7;
- (id)compositeThroughGradientMask:(id)a3 fullSize:(id)a4 fullSizeMask:(id)a5;
- (id)customAttributes;
- (id)directionsToCurvature:(id)a3 threshold:(float)a4;
- (id)expandAndAddDetailsThroughGradientMask2:(id)a3 halfSize:(id)a4 fullSizeDetails:(id)a5 soften:(float)a6 sharpen:(float)a7;
- (id)expandAndAddDetailsThroughGradientMask3:(id)a3 fullSize:(id)a4 fullSizeDetails:(id)a5 fullSizeMask:(id)a6 amount:(float)a7 sharpen:(float)a8 interpolant:(float)a9;
- (id)expandAndAddDetailsThroughGradientMask:(id)a3 fullSize:(id)a4 fullSizeDetails:(id)a5 fullSizeMask:(id)a6 amount:(float)a7 contrastOverdrive:(float)a8 interpolant:(float)a9;
- (id)expandAndAddDetailsWithOverdrive:(id)a3 fullSize:(id)a4 contrast:(float)a5;
- (id)expandAndMakeDetails:(id)a3 halfSize:(id)a4;
- (id)expandAndSharpenDetailsThroughGradientMaskGather:(id)a3 halfSizeY:(id)a4 cnrRGB:(id)a5 sharpen:(float)a6 soften:(float)a7 floor:(float)a8 sushiFactors:(id)a9 crop:(CGRect)a10 lumFactors:(id)a11;
- (id)expandAndSharpenDetailsThroughGradientMaskGatherOpponentColor:(id)a3 halfSizeY:(id)a4 cnrRGB:(id)a5 originalY:(id)a6 sharpen:(float)a7 soften:(float)a8 floor:(float)a9 sushiFactors:(id)a10 crop:(CGRect)a11 lumFactors:(id)a12;
- (id)expandAndSharpenThroughGradientMask:(id)a3 fullSizeY:(id)a4 sharpen:(float)a5;
- (id)expandAndSharpenThroughGradientMaskGather:(id)a3 halfSizeY:(id)a4 cnrRGB:(id)a5 sharpen:(float)a6 floor:(float)a7 sushiFactors:(id)a8 crop:(CGRect)a9 lumFactors:(id)a10;
- (id)expandAndSharpenThroughGradientMaskGatherOpponentColor:(id)a3 halfSizeY:(id)a4 cnrRGB:(id)a5 originalY:(id)a6 sharpen:(float)a7 floor:(float)a8 sushiFactors:(id)a9 crop:(CGRect)a10 lumFactors:(id)a11;
- (id)expandHalfSizeRGB:(id)a3;
- (id)extractHalfSizeRGB:(id)a3 neutralFactors:(id)a4;
- (id)extractHalfSizeRGBHF:(id)a3 neutralFactors:(id)a4 threshold:(float)a5;
- (id)extractY:(id)a3 neutralFactors:(id)a4;
- (id)extractYOpponentColor:(id)a3 neutralFactors:(id)a4 luminanceFactors:(id)a5 noiseVector:(id)a6;
- (id)fineGrainNoise2:(id)a3 tinyBlurFactor:(float)a4;
- (id)fineGrainNoise:(id)a3;
- (id)gaborFiltersToLuminanceAndVectorField:(id)a3 thresh:(float)a4;
- (id)gaborFiltersToSmoothedLuminanceAndGradient:(id)a3 smoothAmt:(float)a4 tinyBlurFactor:(float)a5;
- (id)gaborFiltersToVectorField:(id)a3;
- (id)highFrequencyIntoAlpha:(id)a3 threshold:(float)a4 neutralFactors:(id)a5;
- (id)image:(id)a3 croppedTo:(CGRect)a4;
- (id)kernelArrayWithResourceName:(id)a3;
- (id)kernelWithName:(id)a3 inArray:(id)a4;
- (id)mergeHalfSizeCurvature:(id)a3 intoFullSizeCurvature:(id)a4;
- (id)multiply:(id)a3 byNeutralFactors:(id)a4;
- (id)outputBoost:(id)a3;
- (id)outputCNR:(id)a3 E0:(CGRect)a4 E1:(CGRect)a5;
- (id)outputCNR:(id)a3 extent:(CGRect)a4 returningDebugProduct:(BOOL *)a5;
- (id)outputImage;
- (id)outputUnboost:(id)a3;
- (id)perceptualToLinear:(id)a3;
- (id)powerBlur:(id)a3 threshold:(float)a4 scale:(float)a5;
- (id)powerBlurDespeckle:(id)a3 threshold:(float)a4 scale:(float)a5 countThreshold:(int)a6 luminanceThreshold:(float)a7 diffAmount:(float)a8;
- (id)powerBlurDespeckleHF:(id)a3 threshold:(float)a4 moireAmount:(float)a5 scale:(float)a6 countThreshold:(int)a7 luminanceThreshold:(float)a8 diffAmount:(float)a9;
- (id)powerBlurEarlyOut2:(id)a3 threshold:(float)a4 scale:(float)a5 neutralThreshold:(float)a6 thresholdScale:(float)a7;
- (id)powerBlurEarlyOut2HF:(id)a3 threshold:(float)a4 moireAmount:(float)a5 scale:(float)a6 neutralThreshold:(float)a7 thresholdScale:(float)a8;
- (id)powerBlurEarlyOut:(id)a3 threshold:(float)a4 scale:(float)a5;
- (id)powerBlurEarlyOutHF:(id)a3 threshold:(float)a4 moireAmount:(float)a5 scale:(float)a6;
- (id)powerBlurFS:(id)a3 threshold:(float)a4 neutralFactors:(id)a5;
- (id)powerBlurFSHF:(id)a3 threshold:(float)a4 moireAmount:(float)a5 neutralFactors:(id)a6;
- (id)powerBlurHF:(id)a3 threshold:(float)a4 moireAmount:(float)a5 scale:(float)a6;
- (id)powerBlurY:(id)a3 threshold:(float)a4;
- (id)reduce:(id)a3;
- (id)samplerForImage:(id)a3;
- (id)smoothDetailsAlongDirections:(id)a3 directions:(id)a4 amount:(float)a5;
- (id)smoothDetailsAlongDirectionsAtScale:(id)a3 directions:(id)a4 scale:(float)a5 thresh:(float)a6 smooth:(float)a7;
- (id)smoothDetailsAlongDirectionsAtScaleAntiBloom:(id)a3 directions:(id)a4 scale:(float)a5 thresh:(float)a6 smooth:(float)a7 maxContrast:(float)a8;
- (id)smoothDetailsAlongDirectionsAtScaleWithSharpen:(id)a3 directions:(id)a4 scale:(float)a5 thresh:(float)a6 smooth:(float)a7 sharp:(float)a8 pscale:(float)a9 coringThreshold:(float)a10;
- (id)smoothDetailsAlongDirectionsAtScaleWithSharpenAntiBloom:(id)a3 directions:(id)a4 scale:(float)a5 thresh:(float)a6 smooth:(float)a7 sharp:(float)a8 pscale:(float)a9 coringThreshold:(float)a10 maxContrast:(float)a11;
- (id)smoothVectorFieldAlongVectors:(id)a3;
- (id)vectorFieldToDirectionsAndGradients:(id)a3;
- (id)viewBlend:(id)a3 sushiFactors:(id)a4 crop:(CGRect)a5;
- (id)viewC:(id)a3 crop:(CGRect)a4;
- (id)viewD:(id)a3 factor:(float)a4 crop:(CGRect)a5;
- (id)viewDIR:(id)a3 do360:(BOOL)a4 crop:(CGRect)a5;
- (id)viewG:(id)a3 scale:(float)a4 crop:(CGRect)a5;
- (id)viewGDIR:(id)a3 do360:(BOOL)a4 crop:(CGRect)a5;
- (id)viewHue:(id)a3 sushiFactors:(id)a4 crop:(CGRect)a5;
- (id)viewRGB:(id)a3 sushiFactors:(id)a4 crop:(CGRect)a5;
- (id)viewTG:(id)a3 lothresh:(float)a4 factor:(float)a5 crop:(CGRect)a6;
- (id)viewTGDIR:(id)a3 lothresh:(float)a4 factor:(float)a5 do360:(BOOL)a6 crop:(CGRect)a7;
- (id)viewVF:(id)a3 crop:(CGRect)a4;
- (id)viewY:(id)a3 sushiFactors:(id)a4 crop:(CGRect)a5;
- (void)computeLowThreshold:(float *)a3 andFactor:(float *)a4 withThreshold:(float)a5 andSoftness:(float)a6;
- (void)computeScaleA:(float *)a3 B:(float *)a4 withSmoothingAmount:(float)a5;
@end

@implementation RAWReduceNoise

+ (id)customAttributes
{
  v103[14] = *MEMORY[0x1E4F143B8];
  v102[0] = @"inputLNRAmount";
  v99[0] = *MEMORY[0x1E4F1E090];
  uint64_t v2 = v99[0];
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = *MEMORY[0x1E4F1E098];
  v74 = (void *)v4;
  v101[0] = v4;
  v101[1] = &unk_1F39B4D40;
  uint64_t v6 = *MEMORY[0x1E4F1E0D8];
  v99[1] = v5;
  v99[2] = v6;
  uint64_t v7 = *MEMORY[0x1E4F1E0D0];
  v101[2] = &unk_1F39B4D40;
  v101[3] = &unk_1F39B4D50;
  uint64_t v8 = *MEMORY[0x1E4F1E0F0];
  v99[3] = v7;
  v99[4] = v8;
  uint64_t v9 = *MEMORY[0x1E4F1E158];
  uint64_t v100 = *MEMORY[0x1E4F1E0A0];
  uint64_t v10 = v100;
  v101[4] = v9;
  v101[5] = @"inputLNRAmount";
  v73 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v11, (uint64_t)v101, (uint64_t)v99, 6);
  v103[0] = v73;
  v102[1] = @"inputCNRAmount";
  v97[0] = v2;
  v12 = (objc_class *)objc_opt_class();
  v72 = NSStringFromClass(v12);
  v98[0] = v72;
  v98[1] = &unk_1F39B4D60;
  v97[1] = v5;
  v97[2] = v6;
  v98[2] = &unk_1F39B4D40;
  v98[3] = &unk_1F39B4D50;
  v97[3] = v7;
  v97[4] = v8;
  v97[5] = v10;
  v98[4] = v9;
  v98[5] = @"inputCNRAmount";
  v70 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v13, (uint64_t)v98, (uint64_t)v97, 6);
  v103[1] = v70;
  v102[2] = @"inputSharpenAmount";
  v95[0] = v2;
  v14 = (objc_class *)objc_opt_class();
  v71 = NSStringFromClass(v14);
  v96[0] = v71;
  v96[1] = &unk_1F39B4D60;
  v95[1] = v5;
  v95[2] = v6;
  v96[2] = &unk_1F39B4D40;
  v96[3] = &unk_1F39B4D50;
  v95[3] = v7;
  v95[4] = v8;
  v95[5] = v10;
  v96[4] = v9;
  v96[5] = @"inputSharpenAmount";
  v69 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v15, (uint64_t)v96, (uint64_t)v95, 6);
  v103[2] = v69;
  v102[3] = @"inputSharpenThreshold";
  v93[0] = v2;
  v16 = (objc_class *)objc_opt_class();
  v67 = NSStringFromClass(v16);
  v94[0] = v67;
  v94[1] = &unk_1F39B4D40;
  v93[1] = v5;
  v93[2] = v6;
  v94[2] = &unk_1F39B4D70;
  v94[3] = &unk_1F39B4D80;
  v93[3] = v7;
  v93[4] = v8;
  v93[5] = v10;
  v94[4] = v9;
  v94[5] = @"inputSharpenThreshold";
  v68 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v17, (uint64_t)v94, (uint64_t)v93, 6);
  v103[3] = v68;
  v102[4] = @"inputContrastAmount";
  v91[0] = v2;
  v18 = (objc_class *)objc_opt_class();
  v65 = NSStringFromClass(v18);
  v92[0] = v65;
  v92[1] = &unk_1F39B4D40;
  v91[1] = v5;
  v91[2] = v6;
  v92[2] = &unk_1F39B4D40;
  v92[3] = &unk_1F39B4D50;
  v91[3] = v7;
  v91[4] = v8;
  v91[5] = v10;
  v92[4] = v9;
  v92[5] = @"inputContrastAmount";
  v66 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v19, (uint64_t)v92, (uint64_t)v91, 6);
  v103[4] = v66;
  v102[5] = @"inputDetailAmount";
  v89[0] = v2;
  v20 = (objc_class *)objc_opt_class();
  v63 = NSStringFromClass(v20);
  v90[0] = v63;
  v90[1] = &unk_1F39B4D40;
  v89[1] = v5;
  v89[2] = v6;
  v90[2] = &unk_1F39B4D40;
  v90[3] = &unk_1F39B4D90;
  v89[3] = v7;
  v89[4] = v8;
  v89[5] = v10;
  v90[4] = v9;
  v90[5] = @"inputDetailAmount";
  v64 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v21, (uint64_t)v90, (uint64_t)v89, 6);
  v103[5] = v64;
  v102[6] = @"inputNeutralFactors";
  v87[0] = v2;
  v22 = (objc_class *)objc_opt_class();
  v60 = NSStringFromClass(v22);
  v88[0] = v60;
  v87[1] = v5;
  uint64_t v27 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v23, v24, v25, v26, 1.0, 1.0, 1.0, 1.0);
  uint64_t v28 = *MEMORY[0x1E4F1E148];
  v61 = (void *)v27;
  v88[1] = v27;
  v88[2] = v28;
  v87[2] = v8;
  v87[3] = v10;
  v88[3] = @"inputNeutralFactors";
  v62 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v29, (uint64_t)v88, (uint64_t)v87, 4);
  v103[6] = v62;
  v102[7] = @"inputRepresentativeNoise";
  v85[0] = v2;
  v30 = (objc_class *)objc_opt_class();
  v58 = NSStringFromClass(v30);
  v86[0] = v58;
  v86[1] = &unk_1F39B4D60;
  v85[1] = v5;
  v85[2] = v8;
  v85[3] = v10;
  v86[2] = v9;
  v86[3] = @"inputRepresentativeNoise";
  v59 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v31, (uint64_t)v86, (uint64_t)v85, 4);
  v103[7] = v59;
  v102[8] = @"inputScaleFactor";
  v83[0] = v2;
  v32 = (objc_class *)objc_opt_class();
  v56 = NSStringFromClass(v32);
  v84[0] = v56;
  v84[1] = &unk_1F39B4D40;
  v83[1] = v6;
  v83[2] = v7;
  v84[2] = &unk_1F39B4D50;
  v84[3] = &unk_1F39B4D50;
  v83[3] = v5;
  v83[4] = v8;
  v83[5] = v10;
  v84[4] = v9;
  v84[5] = @"inputScaleFactor";
  v57 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v33, (uint64_t)v84, (uint64_t)v83, 6);
  v103[8] = v57;
  v102[9] = @"inputMoireRadius";
  v81[0] = v2;
  v34 = (objc_class *)objc_opt_class();
  v54 = NSStringFromClass(v34);
  v82[0] = v54;
  v82[1] = &unk_1F39B4D40;
  v81[1] = v6;
  v81[2] = v7;
  v82[2] = &unk_1F39B4DA0;
  v82[3] = &unk_1F39B4DB0;
  v81[3] = v5;
  v81[4] = v8;
  uint64_t v35 = *MEMORY[0x1E4F1E118];
  v81[5] = v10;
  v82[4] = v35;
  v82[5] = @"inputMoireRadius";
  v55 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v36, (uint64_t)v82, (uint64_t)v81, 6);
  v103[9] = v55;
  v102[10] = @"inputMoireAmount";
  v79[0] = v2;
  v37 = (objc_class *)objc_opt_class();
  v53 = NSStringFromClass(v37);
  v80[0] = v53;
  v80[1] = &unk_1F39B4D40;
  v79[1] = v6;
  v79[2] = v7;
  v80[2] = &unk_1F39B4D50;
  v80[3] = &unk_1F39B4D60;
  v79[3] = v5;
  v79[4] = v8;
  v79[5] = v10;
  v80[4] = v9;
  v80[5] = @"inputMoireAmount";
  v39 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v38, (uint64_t)v80, (uint64_t)v79, 6);
  v103[10] = v39;
  v102[11] = @"inputOpponentColorEnabled";
  v77[0] = v2;
  v40 = (objc_class *)objc_opt_class();
  v41 = NSStringFromClass(v40);
  v78[0] = v41;
  v78[1] = MEMORY[0x1E4F1CC38];
  v77[1] = v5;
  v77[2] = v8;
  uint64_t v42 = *MEMORY[0x1E4F1E100];
  v77[3] = v10;
  v78[2] = v42;
  v78[3] = @"inputOpponentColorEnabled";
  v44 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v43, (uint64_t)v78, (uint64_t)v77, 4);
  v103[11] = v44;
  v102[12] = @"inputShowHF";
  v75[0] = v2;
  v45 = (objc_class *)objc_opt_class();
  v46 = NSStringFromClass(v45);
  v76[0] = v46;
  v76[1] = MEMORY[0x1E4F1CC28];
  v75[1] = v5;
  v75[2] = v8;
  v75[3] = v10;
  v76[2] = v42;
  v76[3] = @"inputShowHF";
  v48 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v47, (uint64_t)v76, (uint64_t)v75, 4);
  v102[13] = @"kCIRAWFilterDoesClip";
  uint64_t v49 = *MEMORY[0x1E4F1CFC8];
  v103[12] = v48;
  v103[13] = v49;
  v51 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v50, (uint64_t)v103, (uint64_t)v102, 14);

  return v51;
}

- (id)customAttributes
{
  uint64_t v2 = objc_opt_class();

  return (id)MEMORY[0x1F4181798](v2, sel_customAttributes, v3, v4, v5);
}

+ (id)smartNoiseStatistics:(id)a3
{
  v28[6] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(v3, v4, @"kCGImageSourceLuminanceNoiseReductionAmount", v5, v6);
  v11 = objc_msgSend_objectForKeyedSubscript_(v3, v8, @"kCGImageSourceColorNoiseReductionAmount", v9, v10);
  v15 = objc_msgSend_objectForKeyedSubscript_(v3, v12, @"kCGImageSourceNoiseReductionSharpnessAmount", v13, v14);
  v19 = objc_msgSend_objectForKeyedSubscript_(v3, v16, @"kCGImageSourceNoiseReductionContrastAmount", v17, v18);
  v23 = objc_msgSend_objectForKeyedSubscript_(v3, v20, @"kCGImageSourceNoiseReductionDetailAmount", v21, v22);
  v27[0] = @"autoValue";
  v27[1] = @"lnramt";
  v28[0] = &unk_1F39AFE98;
  v28[1] = v7;
  v27[2] = @"cnramt";
  v27[3] = @"sharpening";
  v28[2] = v11;
  v28[3] = v15;
  v27[4] = @"contrast";
  v27[5] = @"detail";
  v28[4] = v19;
  v28[5] = v23;
  uint64_t v25 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v24, (uint64_t)v28, (uint64_t)v27, 6);

  return v25;
}

+ (id)smartNoiseAdjustmentsForValue:(double)a3 andStatistics:(id)a4
{
  v55[5] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"lnramt", v7, v8);
  objc_msgSend_doubleValue(v9, v10, v11, v12, v13);
  double v15 = v14;
  v19 = objc_msgSend_objectForKeyedSubscript_(v5, v16, @"cnramt", v17, v18);
  objc_msgSend_doubleValue(v19, v20, v21, v22, v23);
  double v25 = v24;
  v29 = objc_msgSend_objectForKeyedSubscript_(v5, v26, @"sharpening", v27, v28);
  v33 = objc_msgSend_objectForKeyedSubscript_(v5, v30, @"contrast", v31, v32);
  double v34 = a3 + -0.5;
  double v35 = fmax(v15 + (a3 + -0.5) * (1.0 - v15 + 1.0 - v15), 0.0);
  v54[0] = @"lnramt";
  v40 = objc_msgSend_numberWithDouble_(NSNumber, v36, v37, v38, v39, v35);
  v55[0] = v40;
  v54[1] = @"cnramt";
  v45 = objc_msgSend_numberWithDouble_(NSNumber, v41, v42, v43, v44, v25 + v34 * 0.35);
  v55[1] = v45;
  v55[2] = v29;
  v54[2] = @"sharpening";
  v54[3] = @"contrast";
  v55[3] = v33;
  v54[4] = @"detail";
  v50 = objc_msgSend_numberWithDouble_(NSNumber, v46, v47, v48, v49, fmax(v35 + -0.75, 0.0) * 4.0 * 0.5);
  v55[4] = v50;
  v52 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v51, (uint64_t)v55, (uint64_t)v54, 5);

  return v52;
}

- (id)samplerForImage:(id)a3
{
  uint64_t v4 = objc_msgSend_samplerWithImage_keysAndValues_(MEMORY[0x1E4F1E078], a2, (uint64_t)a3, *MEMORY[0x1E4F1E538], v3, self->inputColorSpace, 0);

  return v4;
}

- (id)extractY:(id)a3 neutralFactors:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_kernelWithName_(NRKernels, v8, @"extractY", v9, v10);
  v18[0] = v7;
  double v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v12, (uint64_t)v18, 1, v13);
  v16 = objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_isAlphaOne_(self, v15, (uint64_t)v11, (uint64_t)v6, (uint64_t)v14, self->inputColorSpace, 0, 1);

  return v16;
}

- (id)extractYOpponentColor:(id)a3 neutralFactors:(id)a4 luminanceFactors:(id)a5 noiseVector:(id)a6
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v17 = objc_msgSend_kernelWithName_(NRKernels, v14, @"extractYOpponentColor", v15, v16);
  v24[0] = v11;
  v24[1] = v12;
  v24[2] = v13;
  v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v18, (uint64_t)v24, 3, v19);
  uint64_t v22 = objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v21, (uint64_t)v17, (uint64_t)v10, (uint64_t)v20, self->inputColorSpace, 0);

  return v22;
}

- (id)extractHalfSizeRGB:(id)a3 neutralFactors:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(&v27, 0, sizeof(v27));
  CGAffineTransformMakeScale(&v27, 0.5, 0.5);
  id v11 = objc_msgSend_kernelWithName_(NRKernels, v8, @"extractHalfSizeRGB", v9, v10);
  objc_msgSend_extent(v6, v12, v13, v14, v15);
  CGAffineTransform v26 = v27;
  CGRect v31 = CGRectApplyAffineTransform(v30, &v26);
  double x = v31.origin.x;
  double y = v31.origin.y;
  double width = v31.size.width;
  double height = v31.size.height;
  v28[0] = v7;
  uint64_t v22 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v20, (uint64_t)v28, 1, v21);
  double v24 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v23, (uint64_t)v11, (uint64_t)v6, (uint64_t)&unk_1F3985AA0, v22, self->inputColorSpace, 1, x, y, width, height);

  return v24;
}

- (id)extractHalfSizeRGBHF:(id)a3 neutralFactors:(id)a4 threshold:(float)a5
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  memset(&v44, 0, sizeof(v44));
  CGAffineTransformMakeScale(&v44, 0.5, 0.5);
  objc_msgSend_adjustedRNAmount(self, v10, v11, v12, v13);
  if (v18 <= 2.0)
  {
    objc_msgSend_adjustedRNAmount(self, v14, v15, v16, v17);
    float v19 = flt_1DDBFF700[v20 > 1.0];
  }
  else
  {
    float v19 = 0.6;
  }
  uint64_t v21 = objc_msgSend_kernelWithName_(NRKernels, v14, @"extractHalfSizeRGBHF", v16, v17);
  objc_msgSend_extent(v8, v22, v23, v24, v25);
  float v26 = v19 * 0.5;
  CGAffineTransform v43 = v44;
  float v27 = 1.0 / v19;
  CGRect v48 = CGRectApplyAffineTransform(v47, &v43);
  double x = v48.origin.x;
  double y = v48.origin.y;
  double width = v48.size.width;
  double height = v48.size.height;
  v45[0] = v9;
  v36 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v32, v33, v34, v35, a5, v26, v27, 0.0);
  v45[1] = v36;
  uint64_t v39 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v37, (uint64_t)v45, 2, v38);
  v41 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v40, (uint64_t)v21, (uint64_t)v8, (uint64_t)&unk_1F3985AC0, v39, self->inputColorSpace, x, y, width, height);

  return v41;
}

- (id)highFrequencyIntoAlpha:(id)a3 threshold:(float)a4 neutralFactors:(id)a5
{
  v41[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  objc_msgSend_adjustedRNAmount(self, v10, v11, v12, v13);
  if (v18 <= 2.0)
  {
    objc_msgSend_adjustedRNAmount(self, v14, v15, v16, v17);
    float v19 = flt_1DDBFF708[v20 > 1.0];
  }
  else
  {
    float v19 = 0.04;
  }
  uint64_t v21 = objc_msgSend_kernelWithName_(NRKernels, v14, @"highFrequencyIntoAlpha", v16, v17);
  objc_msgSend_extent(v8, v22, v23, v24, v25);
  CGRect v44 = CGRectInset(v43, -1.0, -1.0);
  double x = v44.origin.x;
  double y = v44.origin.y;
  double width = v44.size.width;
  double height = v44.size.height;
  uint64_t v34 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v30, v31, v32, v33, a4, (float)(v19 * 0.5), (float)(1.0 / v19), 0.0);
  v41[0] = v34;
  v41[1] = v9;
  uint64_t v37 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v35, (uint64_t)v41, 2, v36);
  uint64_t v39 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v38, (uint64_t)v21, (uint64_t)v8, (uint64_t)&unk_1F3985AE0, v37, self->inputColorSpace, x, y, width, height);

  return v39;
}

- (id)multiply:(id)a3 byNeutralFactors:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_kernelWithName_(NRKernels, v8, @"multiplyByNeutralFactors", v9, v10);
  v18[0] = v7;
  uint64_t v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v12, (uint64_t)v18, 1, v13);
  uint64_t v16 = objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v15, (uint64_t)v11, (uint64_t)v6, (uint64_t)v14, self->inputColorSpace, 0);

  return v16;
}

- (id)powerBlur:(id)a3 threshold:(float)a4 scale:(float)a5
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v12 = objc_msgSend_kernelWithName_(NRKernels, v9, @"powerBlur", v10, v11);
  objc_msgSend_extent(v8, v13, v14, v15, v16);
  CGRect v37 = CGRectInset(v36, (double)(int)(float)(a5 * -2.0), (double)(int)(float)(a5 * -2.0));
  double x = v37.origin.x;
  double y = v37.origin.y;
  double width = v37.size.width;
  double height = v37.size.height;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = sub_1DDB7A0F8;
  v32[3] = &unk_1E6D04BA8;
  float v33 = a5;
  uint64_t v25 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v21, v22, v23, v24, a4, a5, 0.0, 0.0);
  v34[0] = v25;
  uint64_t v28 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v26, (uint64_t)v34, 1, v27);
  CGRect v30 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v29, (uint64_t)v12, (uint64_t)v8, (uint64_t)v32, v28, self->inputColorSpace, 1, x, y, width, height);

  return v30;
}

- (id)powerBlurDespeckle:(id)a3 threshold:(float)a4 scale:(float)a5 countThreshold:(int)a6 luminanceThreshold:(float)a7 diffAmount:(float)a8
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  float v18 = objc_msgSend_kernelWithName_(NRKernels, v15, @"powerBlurDespeckle", v16, v17);
  objc_msgSend_extent(v14, v19, v20, v21, v22);
  CGRect v48 = CGRectInset(v47, (double)(int)(float)(a5 * -2.0), (double)(int)(float)(a5 * -2.0));
  double x = v48.origin.x;
  double y = v48.origin.y;
  double width = v48.size.width;
  double height = v48.size.height;
  *(float *)&uint64_t v44 = a5;
  uint64_t v31 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v27, v28, v29, v30, a4, a5, 0.0, 0.0, MEMORY[0x1E4F143A8], 3221225472, sub_1DDB7A358, &unk_1E6D04BA8, v44);
  v45[0] = v31;
  CGRect v36 = objc_msgSend_vectorWithX_Y_Z_(MEMORY[0x1E4F1E080], v32, v33, v34, v35, (float)a6, a7, a8);
  v45[1] = v36;
  uint64_t v39 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v37, (uint64_t)v45, 2, v38);
  v41 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v40, (uint64_t)v18, (uint64_t)v14, (uint64_t)&v43, v39, self->inputColorSpace, x, y, width, height);

  return v41;
}

- (id)powerBlurEarlyOut:(id)a3 threshold:(float)a4 scale:(float)a5
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v12 = objc_msgSend_kernelWithName_(NRKernels, v9, @"powerBlurEarlyOut", v10, v11);
  objc_msgSend_extent(v8, v13, v14, v15, v16);
  CGRect v37 = CGRectInset(v36, (double)(int)(float)(a5 * -2.0), (double)(int)(float)(a5 * -2.0));
  double x = v37.origin.x;
  double y = v37.origin.y;
  double width = v37.size.width;
  double height = v37.size.height;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = sub_1DDB7A570;
  v32[3] = &unk_1E6D04BA8;
  float v33 = a5;
  uint64_t v25 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v21, v22, v23, v24, a4, a5, 0.0, 0.0);
  v34[0] = v25;
  uint64_t v28 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v26, (uint64_t)v34, 1, v27);
  uint64_t v30 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v29, (uint64_t)v12, (uint64_t)v8, (uint64_t)v32, v28, self->inputColorSpace, x, y, width, height);

  return v30;
}

- (id)powerBlurEarlyOut2:(id)a3 threshold:(float)a4 scale:(float)a5 neutralThreshold:(float)a6 thresholdScale:(float)a7
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  uint64_t v16 = objc_msgSend_kernelWithName_(NRKernels, v13, @"powerBlurEarlyOut2", v14, v15);
  objc_msgSend_extent(v12, v17, v18, v19, v20);
  CGRect v41 = CGRectInset(v40, (double)(int)(float)(a5 * -2.0), (double)(int)(float)(a5 * -2.0));
  double x = v41.origin.x;
  double y = v41.origin.y;
  double width = v41.size.width;
  double height = v41.size.height;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = sub_1DDB7A798;
  v36[3] = &unk_1E6D04BA8;
  float v37 = a5;
  uint64_t v29 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v25, v26, v27, v28, a4, a5, a7, a6);
  v38[0] = v29;
  uint64_t v32 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v30, (uint64_t)v38, 1, v31);
  uint64_t v34 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v33, (uint64_t)v16, (uint64_t)v12, (uint64_t)v36, v32, self->inputColorSpace, x, y, width, height);

  return v34;
}

- (id)powerBlurFS:(id)a3 threshold:(float)a4 neutralFactors:(id)a5
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v13 = objc_msgSend_kernelWithName_(NRKernels, v10, @"powerBlurFS", v11, v12);
  objc_msgSend_extent(v8, v14, v15, v16, v17);
  CGRect v36 = CGRectInset(v35, -4.0, -4.0);
  double x = v36.origin.x;
  double y = v36.origin.y;
  double width = v36.size.width;
  double height = v36.size.height;
  *(float *)&v36.origin.double x = a4;
  uint64_t v26 = objc_msgSend_numberWithFloat_(NSNumber, v22, v23, v24, v25, v36.origin.x);
  v33[0] = v26;
  v33[1] = v9;
  uint64_t v29 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v33, 2, v28);
  uint64_t v31 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v30, (uint64_t)v13, (uint64_t)v8, (uint64_t)&unk_1F3985B00, v29, self->inputColorSpace, x, y, width, height);

  return v31;
}

- (id)powerBlurHF:(id)a3 threshold:(float)a4 moireAmount:(float)a5 scale:(float)a6
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v14 = objc_msgSend_kernelWithName_(NRKernels, v11, @"powerBlurHF", v12, v13);
  objc_msgSend_extent(v10, v15, v16, v17, v18);
  CGRect v39 = CGRectInset(v38, (double)(int)(float)(a6 * -2.0), (double)(int)(float)(a6 * -2.0));
  double x = v39.origin.x;
  double y = v39.origin.y;
  double width = v39.size.width;
  double height = v39.size.height;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  void v34[2] = sub_1DDB7AB7C;
  v34[3] = &unk_1E6D04BA8;
  float v35 = a6;
  uint64_t v27 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v23, v24, v25, v26, a4, a6, a5, 0.0);
  v36[0] = v27;
  uint64_t v30 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v28, (uint64_t)v36, 1, v29);
  uint64_t v32 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v31, (uint64_t)v14, (uint64_t)v10, (uint64_t)v34, v30, self->inputColorSpace, x, y, width, height);

  return v32;
}

- (id)powerBlurDespeckleHF:(id)a3 threshold:(float)a4 moireAmount:(float)a5 scale:(float)a6 countThreshold:(int)a7 luminanceThreshold:(float)a8 diffAmount:(float)a9
{
  v47[2] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  uint64_t v19 = objc_msgSend_kernelWithName_(NRKernels, v16, @"powerBlurDespeckleHF", v17, v18);
  objc_msgSend_extent(v15, v20, v21, v22, v23);
  CGRect v50 = CGRectInset(v49, (double)(int)(float)(a6 * -2.0), (double)(int)(float)(a6 * -2.0));
  double x = v50.origin.x;
  double y = v50.origin.y;
  double width = v50.size.width;
  double height = v50.size.height;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = sub_1DDB7ADE4;
  void v45[3] = &unk_1E6D04BA8;
  float v46 = a6;
  uint64_t v32 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v28, v29, v30, v31, a4, a6, a5, 0.0);
  v47[0] = v32;
  float v37 = objc_msgSend_vectorWithX_Y_Z_(MEMORY[0x1E4F1E080], v33, v34, v35, v36, (float)a7, a8, a9);
  v47[1] = v37;
  CGRect v40 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v38, (uint64_t)v47, 2, v39);
  uint64_t v42 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v41, (uint64_t)v19, (uint64_t)v15, (uint64_t)v45, v40, self->inputColorSpace, x, y, width, height);

  return v42;
}

- (id)powerBlurEarlyOutHF:(id)a3 threshold:(float)a4 moireAmount:(float)a5 scale:(float)a6
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v14 = objc_msgSend_kernelWithName_(NRKernels, v11, @"powerBlurEarlyOutHF", v12, v13);
  objc_msgSend_extent(v10, v15, v16, v17, v18);
  CGRect v39 = CGRectInset(v38, (double)(int)(float)(a6 * -2.0), (double)(int)(float)(a6 * -2.0));
  double x = v39.origin.x;
  double y = v39.origin.y;
  double width = v39.size.width;
  double height = v39.size.height;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  void v34[2] = sub_1DDB7B008;
  v34[3] = &unk_1E6D04BA8;
  float v35 = a6;
  uint64_t v27 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v23, v24, v25, v26, a4, a6, a5, 0.0);
  v36[0] = v27;
  uint64_t v30 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v28, (uint64_t)v36, 1, v29);
  uint64_t v32 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v31, (uint64_t)v14, (uint64_t)v10, (uint64_t)v34, v30, self->inputColorSpace, x, y, width, height);

  return v32;
}

- (id)powerBlurEarlyOut2HF:(id)a3 threshold:(float)a4 moireAmount:(float)a5 scale:(float)a6 neutralThreshold:(float)a7 thresholdScale:(float)a8
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  uint64_t v18 = objc_msgSend_kernelWithName_(NRKernels, v15, @"powerBlurEarlyOut2HF", v16, v17);
  objc_msgSend_extent(v14, v19, v20, v21, v22);
  CGRect v48 = CGRectInset(v47, (double)(int)(float)(a6 * -2.0), (double)(int)(float)(a6 * -2.0));
  double x = v48.origin.x;
  double y = v48.origin.y;
  double width = v48.size.width;
  double height = v48.size.height;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = sub_1DDB7B268;
  v43[3] = &unk_1E6D04BA8;
  float v44 = a6;
  uint64_t v30 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v26, v27, v28, v29, a4, a6, a8, a7);
  v45[0] = v30;
  float v35 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v31, v32, v33, v34, a5, 0.0, 0.0, 0.0);
  v45[1] = v35;
  CGRect v38 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v36, (uint64_t)v45, 2, v37);
  CGRect v40 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v39, (uint64_t)v18, (uint64_t)v14, (uint64_t)v43, v38, self->inputColorSpace, x, y, width, height);

  return v40;
}

- (id)powerBlurFSHF:(id)a3 threshold:(float)a4 moireAmount:(float)a5 neutralFactors:(id)a6
{
  v40[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v15 = objc_msgSend_kernelWithName_(NRKernels, v12, @"powerBlurFSHF", v13, v14);
  objc_msgSend_extent(v10, v16, v17, v18, v19);
  CGRect v43 = CGRectInset(v42, -4.0, -4.0);
  double x = v43.origin.x;
  double y = v43.origin.y;
  double width = v43.size.width;
  double height = v43.size.height;
  *(float *)&v43.origin.double x = a4;
  uint64_t v28 = objc_msgSend_numberWithFloat_(NSNumber, v24, v25, v26, v27, v43.origin.x);
  uint64_t v33 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v29, v30, v31, v32, a5, 0.0, 0.0, 0.0, v28, v11);
  v40[2] = v33;
  uint64_t v36 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v34, (uint64_t)v40, 3, v35);
  CGRect v38 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v37, (uint64_t)v15, (uint64_t)v10, (uint64_t)&unk_1F3985B20, v36, self->inputColorSpace, x, y, width, height);

  return v38;
}

- (id)perceptualToLinear:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_kernelWithName_(NRKernels, v5, @"perceptualToLinear", v6, v7);
  id v10 = objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v9, (uint64_t)v8, (uint64_t)v4, MEMORY[0x1E4F1CBF0], self->inputColorSpace, 0);

  return v10;
}

- (id)expandHalfSizeRGB:(id)a3
{
  id v4 = a3;
  memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeScale(&v17, 2.0, 2.0);
  id v8 = objc_msgSend_kernelWithName_(NRKernels, v5, @"expandHalfSizeRGB", v6, v7);
  objc_msgSend_extent(v4, v9, v10, v11, v12);
  CGAffineTransform v16 = v17;
  CGRect v20 = CGRectApplyAffineTransform(v19, &v16);
  CGRect v21 = CGRectInset(v20, -1.0, -1.0);
  uint64_t v14 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v13, (uint64_t)v8, (uint64_t)v4, (uint64_t)&unk_1F3985B40, 0, self->inputColorSpace, v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);

  return v14;
}

- (id)powerBlurY:(id)a3 threshold:(float)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v10 = objc_msgSend_kernelWithName_(NRKernels, v7, @"powerBlurY", v8, v9);
  objc_msgSend_extent(v6, v11, v12, v13, v14);
  CGRect v33 = CGRectInset(v32, -2.0, -2.0);
  double x = v33.origin.x;
  double y = v33.origin.y;
  double width = v33.size.width;
  double height = v33.size.height;
  *(float *)&v33.origin.double x = a4;
  uint64_t v23 = objc_msgSend_numberWithFloat_(NSNumber, v19, v20, v21, v22, v33.origin.x);
  v30[0] = v23;
  uint64_t v26 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v24, (uint64_t)v30, 1, v25);
  uint64_t v28 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v27, (uint64_t)v10, (uint64_t)v6, (uint64_t)&unk_1F3985B60, v26, self->inputColorSpace, 1, x, y, width, height);

  return v28;
}

- (id)expandAndMakeDetails:(id)a3 halfSize:(id)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(&v39, 0, sizeof(v39));
  CGAffineTransformMakeScale(&v39, 2.0, 2.0);
  uint64_t v11 = objc_msgSend_kernelWithName_(NRKernels, v8, @"expandAndMakeDetails", v9, v10);
  objc_msgSend_extent(v6, v12, v13, v14, v15);
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  objc_msgSend_extent(v7, v24, v25, v26, v27);
  CGAffineTransform v38 = v39;
  CGRect v43 = CGRectApplyAffineTransform(v42, &v38);
  CGRect v46 = CGRectInset(v43, -1.0, -1.0);
  v44.origin.double x = v17;
  v44.origin.double y = v19;
  v44.size.double width = v21;
  v44.size.double height = v23;
  CGRect v45 = CGRectUnion(v44, v46);
  double x = v45.origin.x;
  double y = v45.origin.y;
  double width = v45.size.width;
  double height = v45.size.height;
  v40[0] = v7;
  uint64_t v34 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v32, (uint64_t)v40, 1, v33);
  uint64_t v36 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v35, (uint64_t)v11, (uint64_t)v6, (uint64_t)&unk_1F3985B80, v34, self->inputColorSpace, 1, x, y, width, height);

  return v36;
}

- (id)reduce:(id)a3
{
  id v4 = a3;
  memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeScale(&v17, 0.5, 0.5);
  uint64_t v8 = objc_msgSend_kernelWithName_(NRKernels, v5, @"reduce", v6, v7);
  objc_msgSend_extent(v4, v9, v10, v11, v12);
  CGAffineTransform v16 = v17;
  CGRect v20 = CGRectApplyAffineTransform(v19, &v16);
  CGRect v21 = CGRectInset(v20, -1.0, -1.0);
  uint64_t v14 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v13, (uint64_t)v8, (uint64_t)v4, (uint64_t)&unk_1F3985BA0, 0, self->inputColorSpace, 1, v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);

  return v14;
}

- (id)gaborFiltersToSmoothedLuminanceAndGradient:(id)a3 smoothAmt:(float)a4 tinyBlurFactor:(float)a5
{
  v42[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v12 = objc_msgSend_kernelWithName_(NRKernels, v9, @"gaborFiltersToSmoothedLuminanceAndGradient", v10, v11);
  objc_msgSend_extent(v8, v13, v14, v15, v16);
  CGRect v45 = CGRectInset(v44, -3.0, -3.0);
  double x = v45.origin.x;
  double y = v45.origin.y;
  double width = v45.size.width;
  double height = v45.size.height;
  *(float *)&v45.origin.double x = a4;
  uint64_t v25 = objc_msgSend_numberWithFloat_(NSNumber, v21, v22, v23, v24, v45.origin.x);
  uint64_t v30 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v26, v27, v28, v29, (float)((float)((float)(a5 * -4.0) + 1.0) + -0.14062), (float)(a5 + -0.09375), -0.0625, -0.0234375, v25);
  v42[1] = v30;
  uint64_t v35 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v31, v32, v33, v34, -0.015625, -0.00390625, 0.0, 0.0);
  v42[2] = v35;
  CGAffineTransform v38 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v36, (uint64_t)v42, 3, v37);
  CGRect v40 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v39, (uint64_t)v12, (uint64_t)v8, (uint64_t)&unk_1F3985BC0, v38, self->inputColorSpace, 1, x, y, width, height);

  return v40;
}

- (id)gaborFiltersToLuminanceAndVectorField:(id)a3 thresh:(float)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v10 = objc_msgSend_kernelWithName_(NRKernels, v7, @"gaborFiltersToLuminanceAndVectorField", v8, v9);
  objc_msgSend_extent(v6, v11, v12, v13, v14);
  CGRect v33 = CGRectInset(v32, -3.0, -3.0);
  double x = v33.origin.x;
  double y = v33.origin.y;
  double width = v33.size.width;
  double height = v33.size.height;
  *(float *)&v33.origin.double x = a4;
  uint64_t v23 = objc_msgSend_numberWithFloat_(NSNumber, v19, v20, v21, v22, v33.origin.x);
  v30[0] = v23;
  uint64_t v26 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v24, (uint64_t)v30, 1, v25);
  uint64_t v28 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v27, (uint64_t)v10, (uint64_t)v6, (uint64_t)&unk_1F3985BE0, v26, self->inputColorSpace, 1, x, y, width, height);

  return v28;
}

- (id)gaborFiltersToVectorField:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_kernelWithName_(NRKernels, v5, @"gaborFiltersToVectorField", v6, v7);
  objc_msgSend_extent(v4, v9, v10, v11, v12);
  CGRect v18 = CGRectInset(v17, -3.0, -3.0);
  uint64_t v14 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v13, (uint64_t)v8, (uint64_t)v4, (uint64_t)&unk_1F3985C00, 0, self->inputColorSpace, 1, v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);

  return v14;
}

- (id)smoothDetailsAlongDirections:(id)a3 directions:(id)a4 amount:(float)a5
{
  v55[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v54 = 0;
  *(float *)&double v10 = a5;
  objc_msgSend_computeScaleA_B_withSmoothingAmount_(self, v11, (uint64_t)&v54 + 4, (uint64_t)&v54, v12, v10);
  uint64_t v16 = objc_msgSend_kernelWithName_(NRKernels, v13, @"smoothDetailsAlongDirections", v14, v15);
  objc_msgSend_extent(v9, v17, v18, v19, v20);
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  objc_msgSend_extent(v8, v29, v30, v31, v32);
  CGRect v60 = CGRectInset(v57, -2.0, -2.0);
  v58.origin.double x = v22;
  v58.origin.double y = v24;
  v58.size.double width = v26;
  v58.size.double height = v28;
  CGRect v59 = CGRectUnion(v58, v60);
  double x = v59.origin.x;
  double y = v59.origin.y;
  double width = v59.size.width;
  double height = v59.size.height;
  v55[0] = v9;
  LODWORD(v59.origin.x) = HIDWORD(v54);
  CGRect v41 = objc_msgSend_numberWithFloat_(NSNumber, v37, v38, v39, v40, v59.origin.x);
  v55[1] = v41;
  LODWORD(v42) = v54;
  CGRect v47 = objc_msgSend_numberWithFloat_(NSNumber, v43, v44, v45, v46, v42);
  v55[2] = v47;
  CGRect v50 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v48, (uint64_t)v55, 3, v49);
  v52 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v51, (uint64_t)v16, (uint64_t)v8, (uint64_t)&unk_1F3985C20, v50, self->inputColorSpace, 1, x, y, width, height);

  return v52;
}

- (id)smoothDetailsAlongDirectionsAtScale:(id)a3 directions:(id)a4 scale:(float)a5 thresh:(float)a6 smooth:(float)a7
{
  v51[2] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  CGRect v17 = objc_msgSend_kernelWithName_(NRKernels, v14, @"smoothDetailsAlongDirectionsAtScale", v15, v16);
  objc_msgSend_extent(v12, v18, v19, v20, v21);
  CGRect v54 = CGRectInset(v53, (double)(int)(float)-a5, (double)(int)(float)-a5);
  CGFloat x = v54.origin.x;
  CGFloat y = v54.origin.y;
  CGFloat width = v54.size.width;
  CGFloat height = v54.size.height;
  objc_msgSend_extent(v13, v26, v27, v28, v29);
  v57.origin.CGFloat x = v30;
  v57.origin.CGFloat y = v31;
  v57.size.CGFloat width = v32;
  v57.size.CGFloat height = v33;
  v55.origin.CGFloat x = x;
  v55.origin.CGFloat y = y;
  v55.size.CGFloat width = width;
  v55.size.CGFloat height = height;
  CGRect v56 = CGRectUnion(v55, v57);
  double v34 = v56.origin.x;
  double v35 = v56.origin.y;
  double v36 = v56.size.width;
  double v37 = v56.size.height;
  *(float *)&uint64_t v50 = a5;
  double v42 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v38, v39, v40, v41, a5, a6, a7, 0.0, MEMORY[0x1E4F143A8], 3221225472, sub_1DDB7C5A4, &unk_1E6D04BA8, v50, v13);
  v51[1] = v42;
  uint64_t v45 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v43, (uint64_t)v51, 2, v44);
  CGRect v47 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v46, (uint64_t)v17, (uint64_t)v12, (uint64_t)&v49, v45, self->inputColorSpace, v34, v35, v36, v37);

  return v47;
}

- (id)smoothDetailsAlongDirectionsAtScaleAntiBloom:(id)a3 directions:(id)a4 scale:(float)a5 thresh:(float)a6 smooth:(float)a7 maxContrast:(float)a8
{
  v53[2] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  uint64_t v19 = objc_msgSend_kernelWithName_(NRKernels, v16, @"smoothDetailsAlongDirectionsAtScaleAntiBloom", v17, v18);
  objc_msgSend_extent(v14, v20, v21, v22, v23);
  CGRect v56 = CGRectInset(v55, (double)(int)(float)-a5, (double)(int)(float)-a5);
  CGFloat x = v56.origin.x;
  CGFloat y = v56.origin.y;
  CGFloat width = v56.size.width;
  CGFloat height = v56.size.height;
  objc_msgSend_extent(v15, v28, v29, v30, v31);
  v59.origin.CGFloat x = v32;
  v59.origin.CGFloat y = v33;
  v59.size.CGFloat width = v34;
  v59.size.CGFloat height = v35;
  v57.origin.CGFloat x = x;
  v57.origin.CGFloat y = y;
  v57.size.CGFloat width = width;
  v57.size.CGFloat height = height;
  CGRect v58 = CGRectUnion(v57, v59);
  double v36 = v58.origin.x;
  double v37 = v58.origin.y;
  double v38 = v58.size.width;
  double v39 = v58.size.height;
  *(float *)&uint64_t v52 = a5;
  uint64_t v44 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v40, v41, v42, v43, a5, a6, a7, a8, MEMORY[0x1E4F143A8], 3221225472, sub_1DDB7C838, &unk_1E6D04BA8, v52, v15);
  v53[1] = v44;
  CGRect v47 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v45, (uint64_t)v53, 2, v46);
  uint64_t v49 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v48, (uint64_t)v19, (uint64_t)v14, (uint64_t)&v51, v47, self->inputColorSpace, v36, v37, v38, v39);

  return v49;
}

- (id)smoothDetailsAlongDirectionsAtScaleWithSharpen:(id)a3 directions:(id)a4 scale:(float)a5 thresh:(float)a6 smooth:(float)a7 sharp:(float)a8 pscale:(float)a9 coringThreshold:(float)a10
{
  v62[3] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  uint64_t v21 = objc_msgSend_kernelWithName_(NRKernels, v18, @"smoothDetailsAlongDirectionsAtScaleWithSharpen", v19, v20);
  objc_msgSend_extent(v16, v22, v23, v24, v25);
  CGRect v65 = CGRectInset(v64, (double)(int)(float)(a5 * -2.0), (double)(int)(float)(a5 * -2.0));
  CGFloat x = v65.origin.x;
  CGFloat y = v65.origin.y;
  CGFloat width = v65.size.width;
  CGFloat height = v65.size.height;
  objc_msgSend_extent(v17, v30, v31, v32, v33);
  v68.origin.CGFloat x = v34;
  v68.origin.CGFloat y = v35;
  v68.size.CGFloat width = v36;
  v68.size.CGFloat height = v37;
  v66.origin.CGFloat x = x;
  v66.origin.CGFloat y = y;
  v66.size.CGFloat width = width;
  v66.size.CGFloat height = height;
  CGRect v67 = CGRectUnion(v66, v68);
  double v38 = v67.origin.x;
  double v39 = v67.origin.y;
  double v40 = v67.size.width;
  double v41 = v67.size.height;
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = sub_1DDB7CB24;
  v60[3] = &unk_1E6D04BA8;
  float v61 = a5;
  v62[0] = v17;
  uint64_t v46 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v42, v43, v44, v45, a5, a6, a7, a8);
  v62[1] = v46;
  uint64_t v51 = objc_msgSend_vectorWithX_Y_Z_(MEMORY[0x1E4F1E080], v47, v48, v49, v50, a9, (float)(a10 * 0.75), (float)(2.0 / a10));
  v62[2] = v51;
  CGRect v54 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v52, (uint64_t)v62, 3, v53);
  CGRect v56 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v55, (uint64_t)v21, (uint64_t)v16, (uint64_t)v60, v54, self->inputColorSpace, v38, v39, v40, v41);

  return v56;
}

- (id)smoothDetailsAlongDirectionsAtScaleWithSharpenAntiBloom:(id)a3 directions:(id)a4 scale:(float)a5 thresh:(float)a6 smooth:(float)a7 sharp:(float)a8 pscale:(float)a9 coringThreshold:(float)a10 maxContrast:(float)a11
{
  v64[3] = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  uint64_t v22 = objc_msgSend_kernelWithName_(NRKernels, v19, @"smoothDetailsAlongDirectionsAtScaleWithSharpenAntiBloom", v20, v21);
  objc_msgSend_extent(v17, v23, v24, v25, v26);
  CGRect v67 = CGRectInset(v66, (double)(int)(float)(a5 * -2.0), (double)(int)(float)(a5 * -2.0));
  CGFloat x = v67.origin.x;
  CGFloat y = v67.origin.y;
  CGFloat width = v67.size.width;
  CGFloat height = v67.size.height;
  objc_msgSend_extent(v18, v31, v32, v33, v34);
  v70.origin.CGFloat x = v35;
  v70.origin.CGFloat y = v36;
  v70.size.CGFloat width = v37;
  v70.size.CGFloat height = v38;
  v68.origin.CGFloat x = x;
  v68.origin.CGFloat y = y;
  v68.size.CGFloat width = width;
  v68.size.CGFloat height = height;
  CGRect v69 = CGRectUnion(v68, v70);
  double v39 = v69.origin.x;
  double v40 = v69.origin.y;
  double v41 = v69.size.width;
  double v42 = v69.size.height;
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = sub_1DDB7CE1C;
  v62[3] = &unk_1E6D04BA8;
  float v63 = a5;
  v64[0] = v18;
  CGRect v47 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v43, v44, v45, v46, a5, a6, a7, a8);
  v64[1] = v47;
  uint64_t v52 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v48, v49, v50, v51, a9, (float)(a10 * 0.75), (float)(2.0 / a10), a11);
  v64[2] = v52;
  CGRect v55 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v53, (uint64_t)v64, 3, v54);
  CGRect v57 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v56, (uint64_t)v22, (uint64_t)v17, (uint64_t)v62, v55, self->inputColorSpace, v39, v40, v41, v42);

  return v57;
}

- (id)blurGradient:(id)a3 lothresh:(float)a4 factor:(float)a5
{
  void v38[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v12 = objc_msgSend_kernelWithName_(NRKernels, v9, @"blurGradient", v10, v11);
  objc_msgSend_extent(v8, v13, v14, v15, v16);
  CGRect v41 = CGRectInset(v40, -1.0, -1.0);
  double x = v41.origin.x;
  double y = v41.origin.y;
  double width = v41.size.width;
  double height = v41.size.height;
  *(float *)&v41.origin.double x = a4;
  uint64_t v25 = objc_msgSend_numberWithFloat_(NSNumber, v21, v22, v23, v24, v41.origin.x);
  v38[0] = v25;
  *(float *)&double v26 = a5;
  uint64_t v31 = objc_msgSend_numberWithFloat_(NSNumber, v27, v28, v29, v30, v26);
  v38[1] = v31;
  uint64_t v34 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v32, (uint64_t)v38, 2, v33);
  CGFloat v36 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v35, (uint64_t)v12, (uint64_t)v8, (uint64_t)&unk_1F3985C40, v34, self->inputColorSpace, x, y, width, height);

  return v36;
}

- (id)blurGradientPlusCurvature:(id)a3 lothresh:(float)a4 factor:(float)a5 cthresh:(float)a6 cfactor:(float)a7
{
  v54[4] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  uint64_t v16 = objc_msgSend_kernelWithName_(NRKernels, v13, @"blurGradientPlusCurvature", v14, v15);
  objc_msgSend_extent(v12, v17, v18, v19, v20);
  CGRect v57 = CGRectInset(v56, -1.0, -1.0);
  double x = v57.origin.x;
  double y = v57.origin.y;
  double width = v57.size.width;
  double height = v57.size.height;
  *(float *)&v57.origin.double x = a4;
  uint64_t v29 = objc_msgSend_numberWithFloat_(NSNumber, v25, v26, v27, v28, v57.origin.x);
  v54[0] = v29;
  *(float *)&double v30 = a5;
  CGFloat v35 = objc_msgSend_numberWithFloat_(NSNumber, v31, v32, v33, v34, v30);
  v54[1] = v35;
  *(float *)&double v36 = a6;
  CGRect v41 = objc_msgSend_numberWithFloat_(NSNumber, v37, v38, v39, v40, v36);
  v54[2] = v41;
  *(float *)&double v42 = a7;
  CGRect v47 = objc_msgSend_numberWithFloat_(NSNumber, v43, v44, v45, v46, v42);
  v54[3] = v47;
  uint64_t v50 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v48, (uint64_t)v54, 4, v49);
  uint64_t v52 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v51, (uint64_t)v16, (uint64_t)v12, (uint64_t)&unk_1F3985C60, v50, self->inputColorSpace, x, y, width, height);

  return v52;
}

- (id)expandAndSharpenDetailsThroughGradientMaskGather:(id)a3 halfSizeY:(id)a4 cnrRGB:(id)a5 sharpen:(float)a6 soften:(float)a7 floor:(float)a8 sushiFactors:(id)a9 crop:(CGRect)a10 lumFactors:(id)a11
{
  double height = a10.size.height;
  double width = a10.size.width;
  double y = a10.origin.y;
  double x = a10.origin.x;
  v62[8] = *MEMORY[0x1E4F143B8];
  id v61 = a3;
  id v23 = a4;
  id v24 = a5;
  id v25 = a9;
  id v26 = a11;
  CGRect v60 = v23;
  double v30 = objc_msgSend_kernelWithName_(NRKernels, v27, @"expandAndSharpenDetailsThroughGradientMaskGather", v28, v29);
  v62[0] = v23;
  v62[1] = v24;
  *(float *)&double v31 = a6;
  double v36 = objc_msgSend_numberWithFloat_(NSNumber, v32, v33, v34, v35, v31);
  v62[2] = v36;
  *(float *)&double v37 = a7;
  double v42 = objc_msgSend_numberWithFloat_(NSNumber, v38, v39, v40, v41, v37);
  v62[3] = v42;
  *(float *)&double v43 = a8;
  uint64_t v48 = objc_msgSend_numberWithFloat_(NSNumber, v44, v45, v46, v47, v43);
  void v62[4] = v48;
  v62[5] = v25;
  uint64_t v53 = objc_msgSend_vectorWithCGRect_(MEMORY[0x1E4F1E080], v49, v50, v51, v52, x, y, width, height);
  v62[6] = v53;
  v62[7] = v26;
  CGRect v56 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v54, (uint64_t)v62, 8, v55);
  CGRect v58 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v57, (uint64_t)v30, (uint64_t)v61, (uint64_t)&unk_1F3985C80, v56, self->inputColorSpace, 1, x, y, width, height);

  return v58;
}

- (id)expandAndSharpenDetailsThroughGradientMaskGatherOpponentColor:(id)a3 halfSizeY:(id)a4 cnrRGB:(id)a5 originalY:(id)a6 sharpen:(float)a7 soften:(float)a8 floor:(float)a9 sushiFactors:(id)a10 crop:(CGRect)a11 lumFactors:(id)a12
{
  double height = a11.size.height;
  double width = a11.size.width;
  double y = a11.origin.y;
  double x = a11.origin.x;
  v66[9] = *MEMORY[0x1E4F143B8];
  id v65 = a3;
  id v25 = a4;
  id v26 = a5;
  id v27 = a6;
  id v28 = a10;
  id v29 = a12;
  float v63 = v25;
  CGRect v64 = v26;
  uint64_t v33 = objc_msgSend_kernelWithName_(NRKernels, v30, @"expandAndSharpenDetailsThroughGradientMaskGatherOpponentColor", v31, v32);
  v66[0] = v25;
  v66[1] = v26;
  v66[2] = v27;
  *(float *)&double v34 = a7;
  uint64_t v39 = objc_msgSend_numberWithFloat_(NSNumber, v35, v36, v37, v38, v34);
  v66[3] = v39;
  *(float *)&double v40 = a8;
  uint64_t v45 = objc_msgSend_numberWithFloat_(NSNumber, v41, v42, v43, v44, v40);
  v66[4] = v45;
  *(float *)&double v46 = a9;
  uint64_t v51 = objc_msgSend_numberWithFloat_(NSNumber, v47, v48, v49, v50, v46);
  v66[5] = v51;
  v66[6] = v28;
  CGRect v56 = objc_msgSend_vectorWithCGRect_(MEMORY[0x1E4F1E080], v52, v53, v54, v55, x, y, width, height);
  v66[7] = v56;
  v66[8] = v29;
  CGRect v59 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v57, (uint64_t)v66, 9, v58);
  id v61 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v60, (uint64_t)v33, (uint64_t)v65, (uint64_t)&unk_1F3985CA0, v59, self->inputColorSpace, 1, x, y, width, height);

  return v61;
}

- (id)expandAndSharpenThroughGradientMaskGather:(id)a3 halfSizeY:(id)a4 cnrRGB:(id)a5 sharpen:(float)a6 floor:(float)a7 sushiFactors:(id)a8 crop:(CGRect)a9 lumFactors:(id)a10
{
  double height = a9.size.height;
  double width = a9.size.width;
  double y = a9.origin.y;
  double x = a9.origin.x;
  v53[7] = *MEMORY[0x1E4F143B8];
  id v52 = a3;
  id v21 = a4;
  id v22 = a5;
  id v23 = a8;
  id v24 = a10;
  id v28 = objc_msgSend_kernelWithName_(NRKernels, v25, @"expandAndSharpenThroughGradientMaskGather", v26, v27);
  v53[0] = v21;
  v53[1] = v22;
  *(float *)&double v29 = a6;
  double v34 = objc_msgSend_numberWithFloat_(NSNumber, v30, v31, v32, v33, v29);
  v53[2] = v34;
  *(float *)&double v35 = a7;
  double v40 = objc_msgSend_numberWithFloat_(NSNumber, v36, v37, v38, v39, v35);
  void v53[3] = v40;
  v53[4] = v23;
  uint64_t v45 = objc_msgSend_vectorWithCGRect_(MEMORY[0x1E4F1E080], v41, v42, v43, v44, x, y, width, height);
  v53[5] = v45;
  v53[6] = v24;
  uint64_t v48 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v46, (uint64_t)v53, 7, v47);
  uint64_t v50 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v49, (uint64_t)v28, (uint64_t)v52, (uint64_t)&unk_1F3985CC0, v48, self->inputColorSpace, 1, x, y, width, height);

  return v50;
}

- (id)expandAndSharpenThroughGradientMaskGatherOpponentColor:(id)a3 halfSizeY:(id)a4 cnrRGB:(id)a5 originalY:(id)a6 sharpen:(float)a7 floor:(float)a8 sushiFactors:(id)a9 crop:(CGRect)a10 lumFactors:(id)a11
{
  double height = a10.size.height;
  double width = a10.size.width;
  double y = a10.origin.y;
  double x = a10.origin.x;
  v57[8] = *MEMORY[0x1E4F143B8];
  id v56 = a3;
  id v23 = a4;
  id v24 = a5;
  id v25 = a6;
  id v26 = a9;
  id v27 = a11;
  uint64_t v55 = v23;
  uint64_t v31 = objc_msgSend_kernelWithName_(NRKernels, v28, @"expandAndSharpenThroughGradientMaskGatherOpponentColor", v29, v30);
  v57[0] = v23;
  v57[1] = v24;
  v57[2] = v25;
  *(float *)&double v32 = a7;
  uint64_t v37 = objc_msgSend_numberWithFloat_(NSNumber, v33, v34, v35, v36, v32);
  v57[3] = v37;
  *(float *)&double v38 = a8;
  uint64_t v43 = objc_msgSend_numberWithFloat_(NSNumber, v39, v40, v41, v42, v38);
  v57[4] = v43;
  v57[5] = v26;
  uint64_t v48 = objc_msgSend_vectorWithCGRect_(MEMORY[0x1E4F1E080], v44, v45, v46, v47, x, y, width, height);
  v57[6] = v48;
  v57[7] = v27;
  uint64_t v51 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v49, (uint64_t)v57, 8, v50);
  uint64_t v53 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v52, (uint64_t)v31, (uint64_t)v56, (uint64_t)&unk_1F3985CE0, v51, self->inputColorSpace, 1, x, y, width, height);

  return v53;
}

- (id)expandAndSharpenThroughGradientMask:(id)a3 fullSizeY:(id)a4 sharpen:(float)a5
{
  v47[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  memset(&v46, 0, sizeof(v46));
  CGAffineTransformMakeScale(&v46, 2.0, 2.0);
  id v13 = objc_msgSend_kernelWithName_(NRKernels, v10, @"expandAndSharpenThroughGradientMask", v11, v12);
  objc_msgSend_extent(v9, v14, v15, v16, v17);
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  objc_msgSend_extent(v8, v26, v27, v28, v29);
  CGAffineTransform v45 = v46;
  CGRect v53 = CGRectApplyAffineTransform(v49, &v45);
  v50.origin.double x = v19;
  v50.origin.double y = v21;
  v50.size.double width = v23;
  v50.size.double height = v25;
  CGRect v51 = CGRectUnion(v50, v53);
  CGRect v52 = CGRectInset(v51, -1.0, -1.0);
  double x = v52.origin.x;
  double y = v52.origin.y;
  double width = v52.size.width;
  double height = v52.size.height;
  v47[0] = v9;
  *(float *)&v52.origin.double x = a5;
  double v38 = objc_msgSend_numberWithFloat_(NSNumber, v34, v35, v36, v37, v52.origin.x);
  v47[1] = v38;
  uint64_t v41 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v39, (uint64_t)v47, 2, v40);
  uint64_t v43 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v42, (uint64_t)v13, (uint64_t)v8, (uint64_t)&unk_1F3985D00, v41, self->inputColorSpace, 1, x, y, width, height);

  return v43;
}

- (id)YAndRGBGather:(id)a3 cnrRGB:(id)a4 sushiFactors:(id)a5 crop:(CGRect)a6 lumFactors:(id)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  v35[4] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  double v22 = objc_msgSend_kernelWithName_(NRKernels, v19, @"YAndRGBGather", v20, v21);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  void v34[2] = sub_1DDB7E190;
  v34[3] = &unk_1E6D05A98;
  *(double *)&void v34[4] = x;
  *(double *)&v34[5] = y;
  *(double *)&v34[6] = width;
  *(double *)&v34[7] = height;
  v35[0] = v16;
  v35[1] = v17;
  uint64_t v27 = objc_msgSend_vectorWithCGRect_(MEMORY[0x1E4F1E080], v23, v24, v25, v26, x, y, width, height);
  v35[2] = v27;
  v35[3] = v18;
  uint64_t v30 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v28, (uint64_t)v35, 4, v29);
  double v32 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v31, (uint64_t)v22, (uint64_t)v15, (uint64_t)v34, v30, self->inputColorSpace, x, y, width, height);

  return v32;
}

- (id)YAndRGBGatherOpponentColor:(id)a3 cnrRGB:(id)a4 originalY:(id)a5 sushiFactors:(id)a6 crop:(CGRect)a7 lumFactors:(id)a8
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  v38[5] = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a8;
  uint64_t v25 = objc_msgSend_kernelWithName_(NRKernels, v22, @"YAndRGBGatherOpponentColor", v23, v24);
  objc_msgSend_vectorWithCGRect_(MEMORY[0x1E4F1E080], v26, v27, v28, v29, x, y, width, height, MEMORY[0x1E4F143A8], 3221225472, sub_1DDB7E3DC, &unk_1E6D05A98, *(void *)&x, *(void *)&y, *(void *)&width, *(void *)&height, v18, v19,
  uint64_t v30 = v20);
  void v38[3] = v30;
  v38[4] = v21;
  uint64_t v33 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v31, (uint64_t)v38, 5, v32);
  uint64_t v35 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v34, (uint64_t)v25, (uint64_t)v17, (uint64_t)&v37, v33, self->inputColorSpace, x, y, width, height);

  return v35;
}

- (id)expandAndAddDetailsWithOverdrive:(id)a3 fullSize:(id)a4 contrast:(float)a5
{
  v47[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  memset(&v46, 0, sizeof(v46));
  CGAffineTransformMakeScale(&v46, 2.0, 2.0);
  id v13 = objc_msgSend_kernelWithName_(NRKernels, v10, @"expandAndAddDetailsWithOverdrive", v11, v12);
  objc_msgSend_extent(v9, v14, v15, v16, v17);
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  objc_msgSend_extent(v8, v26, v27, v28, v29);
  CGAffineTransform v45 = v46;
  CGRect v50 = CGRectApplyAffineTransform(v49, &v45);
  CGRect v53 = CGRectInset(v50, -1.0, -1.0);
  v51.origin.double x = v19;
  v51.origin.double y = v21;
  v51.size.double width = v23;
  v51.size.double height = v25;
  CGRect v52 = CGRectUnion(v51, v53);
  double x = v52.origin.x;
  double y = v52.origin.y;
  double width = v52.size.width;
  double height = v52.size.height;
  v47[0] = v9;
  *(float *)&v52.origin.double x = a5;
  double v38 = objc_msgSend_numberWithFloat_(NSNumber, v34, v35, v36, v37, v52.origin.x);
  v47[1] = v38;
  uint64_t v41 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v39, (uint64_t)v47, 2, v40);
  uint64_t v43 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v42, (uint64_t)v13, (uint64_t)v8, (uint64_t)&unk_1F3985D20, v41, self->inputColorSpace, 1, x, y, width, height);

  return v43;
}

- (id)fineGrainNoise:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_kernelWithName_(NRKernels, v5, @"FineGrainNoise", v6, v7);
  objc_msgSend_extent(v4, v9, v10, v11, v12);
  CGRect v18 = CGRectInset(v17, -1.0, -1.0);
  uint64_t v14 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v13, (uint64_t)v8, (uint64_t)v4, (uint64_t)&unk_1F3985D40, 0, self->inputColorSpace, 1, v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);

  return v14;
}

- (id)fineGrainNoise2:(id)a3 tinyBlurFactor:(float)a4
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v10 = objc_msgSend_kernelWithName_(NRKernels, v7, @"FineGrainNoise2", v8, v9);
  objc_msgSend_extent(v6, v11, v12, v13, v14);
  CGRect v38 = CGRectInset(v37, -2.0, -2.0);
  double x = v38.origin.x;
  double y = v38.origin.y;
  double width = v38.size.width;
  double height = v38.size.height;
  CGFloat v23 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v19, v20, v21, v22, (float)((float)((float)(a4 * -4.0) + 1.0) + -0.14062), (float)(a4 + -0.09375), -0.0625, -0.0234375);
  v35[0] = v23;
  uint64_t v28 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v24, v25, v26, v27, -0.015625, -0.00390625, 0.0, 0.0);
  v35[1] = v28;
  uint64_t v31 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v29, (uint64_t)v35, 2, v30);
  uint64_t v33 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v32, (uint64_t)v10, (uint64_t)v6, (uint64_t)&unk_1F3985D60, v31, self->inputColorSpace, 1, x, y, width, height);

  return v33;
}

- (id)expandAndAddDetailsThroughGradientMask:(id)a3 fullSize:(id)a4 fullSizeDetails:(id)a5 fullSizeMask:(id)a6 amount:(float)a7 contrastOverdrive:(float)a8 interpolant:(float)a9
{
  v81[4] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  memset(&v80, 0, sizeof(v80));
  CGAffineTransformMakeScale(&v80, 2.0, 2.0);
  uint64_t v20 = objc_msgSend_kernelWithName_(NRKernels, v17, @"expandAndAddDetailsThroughGradientMask", v18, v19);
  objc_msgSend_extent(v14, v21, v22, v23, v24);
  CGFloat v74 = v26;
  CGFloat v75 = v25;
  CGFloat v72 = v28;
  CGFloat v73 = v27;
  objc_msgSend_extent(v15, v29, v30, v31, v32);
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  objc_msgSend_extent(v16, v41, v42, v43, v44);
  CGFloat v46 = v45;
  CGFloat v48 = v47;
  CGFloat v50 = v49;
  CGFloat v52 = v51;
  objc_msgSend_extent(v13, v53, v54, v55, v56);
  CGAffineTransform v79 = v80;
  CGRect v84 = CGRectApplyAffineTransform(v83, &v79);
  CGRect v89 = CGRectInset(v84, -1.0, -1.0);
  v85.origin.double x = v46;
  v85.origin.double y = v48;
  v85.size.double width = v50;
  v85.size.double height = v52;
  CGRect v90 = CGRectUnion(v85, v89);
  v86.origin.double x = v34;
  v86.origin.double y = v36;
  v86.size.double width = v38;
  v86.size.double height = v40;
  CGRect v91 = CGRectUnion(v86, v90);
  v87.origin.double y = v74;
  v87.origin.double x = v75;
  v87.size.double height = v72;
  v87.size.double width = v73;
  CGRect v88 = CGRectUnion(v87, v91);
  double x = v88.origin.x;
  double y = v88.origin.y;
  double width = v88.size.width;
  double height = v88.size.height;
  v81[0] = v14;
  v81[1] = v15;
  v81[2] = v16;
  id v65 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v61, v62, v63, v64, a7, a8, a9, 0.0);
  v81[3] = v65;
  CGRect v68 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v66, (uint64_t)v81, 4, v67);
  CGRect v70 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v69, (uint64_t)v20, (uint64_t)v13, (uint64_t)&unk_1F3985D80, v68, self->inputColorSpace, 1, x, y, width, height);

  return v70;
}

- (id)compositeThroughGradientMask:(id)a3 fullSize:(id)a4 fullSizeMask:(id)a5
{
  v57[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v14 = objc_msgSend_kernelWithName_(NRKernels, v11, @"compositeThroughGradientMask", v12, v13);
  objc_msgSend_extent(v9, v15, v16, v17, v18);
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  objc_msgSend_extent(v10, v27, v28, v29, v30);
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  objc_msgSend_extent(v8, v39, v40, v41, v42);
  v62.origin.double x = v43;
  v62.origin.double y = v44;
  v62.size.double width = v45;
  v62.size.double height = v46;
  v59.origin.double x = v32;
  v59.origin.double y = v34;
  v59.size.double width = v36;
  v59.size.double height = v38;
  CGRect v63 = CGRectUnion(v59, v62);
  v60.origin.double x = v20;
  v60.origin.double y = v22;
  v60.size.double width = v24;
  v60.size.double height = v26;
  CGRect v61 = CGRectUnion(v60, v63);
  double x = v61.origin.x;
  double y = v61.origin.y;
  double width = v61.size.width;
  double height = v61.size.height;
  v57[0] = v9;
  v57[1] = v10;
  CGRect v53 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v51, (uint64_t)v57, 2, v52);
  uint64_t v55 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v54, (uint64_t)v14, (uint64_t)v8, 0, v53, self->inputColorSpace, 1, x, y, width, height);

  return v55;
}

- (id)expandAndAddDetailsThroughGradientMask2:(id)a3 halfSize:(id)a4 fullSizeDetails:(id)a5 soften:(float)a6 sharpen:(float)a7
{
  v70[4] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  memset(&v69, 0, sizeof(v69));
  CGAffineTransformMakeScale(&v69, 2.0, 2.0);
  uint64_t v16 = objc_msgSend_kernelWithName_(NRKernels, v13, @"expandAndAddDetailsThroughGradientMask2", v14, v15);
  objc_msgSend_extent(v10, v17, v18, v19, v20);
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  objc_msgSend_extent(v12, v29, v30, v31, v32);
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  objc_msgSend_extent(v11, v41, v42, v43, v44);
  CGAffineTransform v68 = v69;
  CGRect v73 = CGRectApplyAffineTransform(v72, &v68);
  CGRect v77 = CGRectInset(v73, -1.0, -1.0);
  v74.origin.double x = v34;
  v74.origin.double y = v36;
  v74.size.double width = v38;
  v74.size.double height = v40;
  CGRect v78 = CGRectUnion(v74, v77);
  v75.origin.double x = v22;
  v75.origin.double y = v24;
  v75.size.double width = v26;
  v75.size.double height = v28;
  CGRect v76 = CGRectUnion(v75, v78);
  double x = v76.origin.x;
  double y = v76.origin.y;
  double width = v76.size.width;
  double height = v76.size.height;
  v70[0] = v11;
  v70[1] = v12;
  *(float *)&v76.origin.double x = a6;
  CGRect v53 = objc_msgSend_numberWithFloat_(NSNumber, v49, v50, v51, v52, v76.origin.x);
  v70[2] = v53;
  *(float *)&double v54 = a7;
  CGRect v59 = objc_msgSend_numberWithFloat_(NSNumber, v55, v56, v57, v58, v54);
  v70[3] = v59;
  CGRect v62 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v60, (uint64_t)v70, 4, v61);
  uint64_t v64 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v63, (uint64_t)v16, (uint64_t)v10, (uint64_t)&unk_1F3985DA0, v62, self->inputColorSpace, 1, x, y, width, height);

  return v64;
}

- (id)expandAndAddDetailsThroughGradientMask3:(id)a3 fullSize:(id)a4 fullSizeDetails:(id)a5 fullSizeMask:(id)a6 amount:(float)a7 sharpen:(float)a8 interpolant:(float)a9
{
  v81[4] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  memset(&v80, 0, sizeof(v80));
  CGAffineTransformMakeScale(&v80, 2.0, 2.0);
  uint64_t v20 = objc_msgSend_kernelWithName_(NRKernels, v17, @"expandAndAddDetailsThroughGradientMask3", v18, v19);
  objc_msgSend_extent(v14, v21, v22, v23, v24);
  CGFloat v74 = v26;
  CGFloat v75 = v25;
  CGFloat v72 = v28;
  CGFloat v73 = v27;
  objc_msgSend_extent(v15, v29, v30, v31, v32);
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  objc_msgSend_extent(v16, v41, v42, v43, v44);
  CGFloat v46 = v45;
  CGFloat v48 = v47;
  CGFloat v50 = v49;
  CGFloat v52 = v51;
  objc_msgSend_extent(v13, v53, v54, v55, v56);
  CGAffineTransform v79 = v80;
  CGRect v84 = CGRectApplyAffineTransform(v83, &v79);
  CGRect v89 = CGRectInset(v84, -1.0, -1.0);
  v85.origin.double x = v46;
  v85.origin.double y = v48;
  v85.size.double width = v50;
  v85.size.double height = v52;
  CGRect v90 = CGRectUnion(v85, v89);
  v86.origin.double x = v34;
  v86.origin.double y = v36;
  v86.size.double width = v38;
  v86.size.double height = v40;
  CGRect v91 = CGRectUnion(v86, v90);
  v87.origin.double y = v74;
  v87.origin.double x = v75;
  v87.size.double height = v72;
  v87.size.double width = v73;
  CGRect v88 = CGRectUnion(v87, v91);
  double x = v88.origin.x;
  double y = v88.origin.y;
  double width = v88.size.width;
  double height = v88.size.height;
  v81[0] = v14;
  v81[1] = v15;
  v81[2] = v16;
  id v65 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v61, v62, v63, v64, a7, a8, a9, 0.0);
  v81[3] = v65;
  CGAffineTransform v68 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v66, (uint64_t)v81, 4, v67);
  CGRect v70 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v69, (uint64_t)v20, (uint64_t)v13, (uint64_t)&unk_1F3985DC0, v68, self->inputColorSpace, 1, x, y, width, height);

  return v70;
}

- (id)addNoise:(id)a3 noise:(id)a4 amount:(float)a5
{
  v49[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v12 = a4;
  if (v12 && a5 >= 0.001)
  {
    id v13 = objc_msgSend_kernelWithName_(NRKernels, v9, @"AddNoise", v10, v11, a5);
    objc_msgSend_extent(v8, v14, v15, v16, v17);
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    objc_msgSend_extent(v12, v26, v27, v28, v29);
    v53.origin.double x = v30;
    v53.origin.double y = v31;
    v53.size.double width = v32;
    v53.size.double height = v33;
    v51.origin.double x = v19;
    v51.origin.double y = v21;
    v51.size.double width = v23;
    v51.size.double height = v25;
    CGRect v52 = CGRectUnion(v51, v53);
    double x = v52.origin.x;
    double y = v52.origin.y;
    double width = v52.size.width;
    double height = v52.size.height;
    v49[0] = v12;
    *(float *)&v52.origin.double x = a5;
    uint64_t v42 = objc_msgSend_numberWithFloat_(NSNumber, v38, v39, v40, v41, v52.origin.x);
    v49[1] = v42;
    double v45 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v43, (uint64_t)v49, 2, v44);
    objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v46, (uint64_t)v13, (uint64_t)v8, 0, v45, self->inputColorSpace, 1, x, y, width, height);
    id v47 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v47 = v8;
  }

  return v47;
}

- (id)vectorFieldToDirectionsAndGradients:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_kernelWithName_(NRKernels, v5, @"vectorFieldToDirectionsAndGradients", v6, v7);
  uint64_t v10 = objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_isAlphaOne_(self, v9, (uint64_t)v8, (uint64_t)v4, 0, self->inputColorSpace, 0, 1);

  return v10;
}

- (id)smoothVectorFieldAlongVectors:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_kernelWithName_(NRKernels, v5, @"smoothVectorFieldAlongVectors", v6, v7);
  objc_msgSend_extent(v4, v9, v10, v11, v12);
  CGRect v18 = CGRectInset(v17, -3.0, -3.0);
  id v14 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_isAlphaOne_(self, v13, (uint64_t)v8, (uint64_t)v4, (uint64_t)&unk_1F3985DE0, 0, self->inputColorSpace, 1, v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);

  return v14;
}

- (id)directionsToCurvature:(id)a3 threshold:(float)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v10 = objc_msgSend_kernelWithName_(NRKernels, v7, @"directionsToCurvature", v8, v9);
  objc_msgSend_extent(v6, v11, v12, v13, v14);
  CGRect v33 = CGRectInset(v32, -4.0, -4.0);
  double x = v33.origin.x;
  double y = v33.origin.y;
  double width = v33.size.width;
  double height = v33.size.height;
  *(float *)&v33.origin.double x = a4;
  CGFloat v23 = objc_msgSend_numberWithFloat_(NSNumber, v19, v20, v21, v22, v33.origin.x);
  v30[0] = v23;
  double v26 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v24, (uint64_t)v30, 1, v25);
  uint64_t v28 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v27, (uint64_t)v10, (uint64_t)v6, (uint64_t)&unk_1F3985E00, v26, self->inputColorSpace, x, y, width, height);

  return v28;
}

- (id)mergeHalfSizeCurvature:(id)a3 intoFullSizeCurvature:(id)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(&v39, 0, sizeof(v39));
  CGAffineTransformMakeScale(&v39, 2.0, 2.0);
  uint64_t v11 = objc_msgSend_kernelWithName_(NRKernels, v8, @"mergeHalfSizeCurvature", v9, v10);
  objc_msgSend_extent(v7, v12, v13, v14, v15);
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  objc_msgSend_extent(v6, v24, v25, v26, v27);
  CGAffineTransform v38 = v39;
  CGRect v46 = CGRectApplyAffineTransform(v42, &v38);
  v43.origin.double x = v17;
  v43.origin.double y = v19;
  v43.size.double width = v21;
  v43.size.double height = v23;
  CGRect v44 = CGRectUnion(v43, v46);
  CGRect v45 = CGRectInset(v44, -1.0, -1.0);
  double x = v45.origin.x;
  double y = v45.origin.y;
  double width = v45.size.width;
  double height = v45.size.height;
  v40[0] = v6;
  CGFloat v34 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v32, (uint64_t)v40, 1, v33);
  CGFloat v36 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v35, (uint64_t)v11, (uint64_t)v7, (uint64_t)&unk_1F3985E20, v34, self->inputColorSpace, x, y, width, height);

  return v36;
}

- (id)viewY:(id)a3 sushiFactors:(id)a4 crop:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  void v28[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  double v16 = objc_msgSend_kernelWithName_(NRKernels, v13, @"viewY", v14, v15);
  v28[0] = v12;
  CGFloat v21 = objc_msgSend_vectorWithCGRect_(MEMORY[0x1E4F1E080], v17, v18, v19, v20, x, y, width, height);
  v28[1] = v21;
  double v24 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v22, (uint64_t)v28, 2, v23);
  uint64_t v26 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v25, (uint64_t)v16, (uint64_t)v11, 0, v24, self->inputColorSpace, x, y, width, height);

  return v26;
}

- (id)viewBlend:(id)a3 sushiFactors:(id)a4 crop:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  void v28[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  double v16 = objc_msgSend_kernelWithName_(NRKernels, v13, @"viewBlend", v14, v15);
  v28[0] = v12;
  CGFloat v21 = objc_msgSend_vectorWithCGRect_(MEMORY[0x1E4F1E080], v17, v18, v19, v20, x, y, width, height);
  v28[1] = v21;
  double v24 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v22, (uint64_t)v28, 2, v23);
  uint64_t v26 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v25, (uint64_t)v16, (uint64_t)v11, 0, v24, self->inputColorSpace, x, y, width, height);

  return v26;
}

- (id)viewD:(id)a3 factor:(float)a4 crop:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v33[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  uint64_t v15 = objc_msgSend_kernelWithName_(NRKernels, v12, @"viewD", v13, v14);
  *(float *)&double v16 = a4;
  CGFloat v21 = objc_msgSend_numberWithFloat_(NSNumber, v17, v18, v19, v20, v16);
  v33[0] = v21;
  uint64_t v26 = objc_msgSend_vectorWithCGRect_(MEMORY[0x1E4F1E080], v22, v23, v24, v25, x, y, width, height);
  v33[1] = v26;
  uint64_t v29 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v33, 2, v28);
  CGFloat v31 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v30, (uint64_t)v15, (uint64_t)v11, 0, v29, self->inputColorSpace, x, y, width, height);

  return v31;
}

- (id)viewTG:(id)a3 lothresh:(float)a4 factor:(float)a5 crop:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  void v41[3] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  CGFloat v17 = objc_msgSend_kernelWithName_(NRKernels, v14, @"viewTG", v15, v16);
  *(float *)&double v18 = a4;
  uint64_t v23 = objc_msgSend_numberWithFloat_(NSNumber, v19, v20, v21, v22, v18);
  *(float *)&double v24 = a5;
  uint64_t v29 = objc_msgSend_numberWithFloat_(NSNumber, v25, v26, v27, v28, v24, v23);
  v41[1] = v29;
  CGFloat v34 = objc_msgSend_vectorWithCGRect_(MEMORY[0x1E4F1E080], v30, v31, v32, v33, x, y, width, height);
  v41[2] = v34;
  double v37 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v35, (uint64_t)v41, 3, v36);
  CGAffineTransform v39 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v38, (uint64_t)v17, (uint64_t)v13, 0, v37, self->inputColorSpace, x, y, width, height);

  return v39;
}

- (id)viewVF:(id)a3 crop:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v25[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v13 = objc_msgSend_kernelWithName_(NRKernels, v10, @"viewVF", v11, v12);
  double v18 = objc_msgSend_vectorWithCGRect_(MEMORY[0x1E4F1E080], v14, v15, v16, v17, x, y, width, height);
  v25[0] = v18;
  uint64_t v21 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v19, (uint64_t)v25, 1, v20);
  uint64_t v23 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v22, (uint64_t)v13, (uint64_t)v9, 0, v21, self->inputColorSpace, x, y, width, height);

  return v23;
}

- (id)viewG:(id)a3 scale:(float)a4 crop:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v33[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  uint64_t v15 = objc_msgSend_kernelWithName_(NRKernels, v12, @"viewG", v13, v14);
  *(float *)&double v16 = a4;
  uint64_t v21 = objc_msgSend_numberWithFloat_(NSNumber, v17, v18, v19, v20, v16);
  v33[0] = v21;
  uint64_t v26 = objc_msgSend_vectorWithCGRect_(MEMORY[0x1E4F1E080], v22, v23, v24, v25, x, y, width, height);
  v33[1] = v26;
  uint64_t v29 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v33, 2, v28);
  uint64_t v31 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v30, (uint64_t)v15, (uint64_t)v11, 0, v29, self->inputColorSpace, x, y, width, height);

  return v31;
}

- (id)viewDIR:(id)a3 do360:(BOOL)a4 crop:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  BOOL v9 = a4;
  v36[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  if (v9)
  {
    uint64_t v15 = objc_msgSend_kernelWithName_(NRKernels, v11, @"viewDIR360", v12, v13);
    uint64_t v20 = objc_msgSend_vectorWithCGRect_(MEMORY[0x1E4F1E080], v16, v17, v18, v19, x, y, width, height);
    v36[0] = v20;
    uint64_t v23 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v21, (uint64_t)v36, 1, v22);
    uint64_t v25 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v24, (uint64_t)v15, (uint64_t)v14, 0, v23, self->inputColorSpace, 0.0, 0.0, width, height);
  }
  else
  {
    uint64_t v15 = objc_msgSend_kernelWithName_(NRKernels, v11, @"viewDIR180", v12, v13);
    uint64_t v20 = objc_msgSend_vectorWithCGRect_(MEMORY[0x1E4F1E080], v26, v27, v28, v29, x, y, width, height);
    double v35 = v20;
    uint64_t v23 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v30, (uint64_t)&v35, 1, v31);
    uint64_t v25 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v32, (uint64_t)v15, (uint64_t)v14, 0, v23, self->inputColorSpace, 0.0, 0.0, width, height);
  }
  uint64_t v33 = (void *)v25;

  return v33;
}

- (id)viewC:(id)a3 crop:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v25[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v13 = objc_msgSend_kernelWithName_(NRKernels, v10, @"viewC", v11, v12);
  uint64_t v18 = objc_msgSend_vectorWithCGRect_(MEMORY[0x1E4F1E080], v14, v15, v16, v17, x, y, width, height);
  v25[0] = v18;
  uint64_t v21 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v19, (uint64_t)v25, 1, v20);
  uint64_t v23 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v22, (uint64_t)v13, (uint64_t)v9, 0, v21, self->inputColorSpace, 0.0, 0.0, width, height);

  return v23;
}

- (id)viewGDIR:(id)a3 do360:(BOOL)a4 crop:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  BOOL v9 = a4;
  v36[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  if (v9)
  {
    uint64_t v15 = objc_msgSend_kernelWithName_(NRKernels, v11, @"viewGDIR360", v12, v13);
    uint64_t v20 = objc_msgSend_vectorWithCGRect_(MEMORY[0x1E4F1E080], v16, v17, v18, v19, x, y, width, height);
    v36[0] = v20;
    uint64_t v23 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v21, (uint64_t)v36, 1, v22);
    uint64_t v25 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v24, (uint64_t)v15, (uint64_t)v14, 0, v23, self->inputColorSpace, 0.0, 0.0, width, height);
  }
  else
  {
    uint64_t v15 = objc_msgSend_kernelWithName_(NRKernels, v11, @"viewGDIR180", v12, v13);
    uint64_t v20 = objc_msgSend_vectorWithCGRect_(MEMORY[0x1E4F1E080], v26, v27, v28, v29, x, y, width, height);
    double v35 = v20;
    uint64_t v23 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v30, (uint64_t)&v35, 1, v31);
    uint64_t v25 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v32, (uint64_t)v15, (uint64_t)v14, 0, v23, self->inputColorSpace, 0.0, 0.0, width, height);
  }
  uint64_t v33 = (void *)v25;

  return v33;
}

- (id)viewTGDIR:(id)a3 lothresh:(float)a4 factor:(float)a5 do360:(BOOL)a6 crop:(CGRect)a7
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  BOOL v11 = a6;
  v62[3] = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  if (v11)
  {
    uint64_t v19 = objc_msgSend_kernelWithName_(NRKernels, v15, @"viewTGDIR360", v16, v17);
    *(float *)&double v20 = a4;
    uint64_t v25 = objc_msgSend_numberWithFloat_(NSNumber, v21, v22, v23, v24, v20);
    v62[0] = v25;
    *(float *)&double v26 = a5;
    uint64_t v31 = objc_msgSend_numberWithFloat_(NSNumber, v27, v28, v29, v30, v26);
    v62[1] = v31;
    uint64_t v36 = objc_msgSend_vectorWithCGRect_(MEMORY[0x1E4F1E080], v32, v33, v34, v35, x, y, width, height);
    v62[2] = v36;
    CGAffineTransform v39 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v37, (uint64_t)v62, 3, v38);
    uint64_t v41 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v40, (uint64_t)v19, (uint64_t)v18, 0, v39, self->inputColorSpace, 0.0, 0.0, width, height);
  }
  else
  {
    uint64_t v19 = objc_msgSend_kernelWithName_(NRKernels, v15, @"viewTGDIR180", v16, v17);
    *(float *)&double v42 = a4;
    uint64_t v25 = objc_msgSend_numberWithFloat_(NSNumber, v43, v44, v45, v46, v42);
    v61[0] = v25;
    *(float *)&double v47 = a5;
    uint64_t v31 = objc_msgSend_numberWithFloat_(NSNumber, v48, v49, v50, v51, v47);
    v61[1] = v31;
    uint64_t v36 = objc_msgSend_vectorWithCGRect_(MEMORY[0x1E4F1E080], v52, v53, v54, v55, x, y, width, height);
    v61[2] = v36;
    CGAffineTransform v39 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v56, (uint64_t)v61, 3, v57);
    uint64_t v41 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v58, (uint64_t)v19, (uint64_t)v18, 0, v39, self->inputColorSpace, 0.0, 0.0, width, height);
  }
  CGRect v59 = (void *)v41;

  return v59;
}

- (id)viewRGB:(id)a3 sushiFactors:(id)a4 crop:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  void v28[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  uint64_t v16 = objc_msgSend_kernelWithName_(NRKernels, v13, @"viewRGB", v14, v15);
  v28[0] = v12;
  uint64_t v21 = objc_msgSend_vectorWithCGRect_(MEMORY[0x1E4F1E080], v17, v18, v19, v20, x, y, width, height);
  v28[1] = v21;
  uint64_t v24 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v22, (uint64_t)v28, 2, v23);
  double v26 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v25, (uint64_t)v16, (uint64_t)v11, 0, v24, self->inputColorSpace, 0.0, 0.0, width, height);

  return v26;
}

- (id)viewHue:(id)a3 sushiFactors:(id)a4 crop:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  void v28[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  uint64_t v16 = objc_msgSend_kernelWithName_(NRKernels, v13, @"viewHue", v14, v15);
  v28[0] = v12;
  uint64_t v21 = objc_msgSend_vectorWithCGRect_(MEMORY[0x1E4F1E080], v17, v18, v19, v20, x, y, width, height);
  v28[1] = v21;
  uint64_t v24 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v22, (uint64_t)v28, 2, v23);
  double v26 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v25, (uint64_t)v16, (uint64_t)v11, 0, v24, self->inputColorSpace, 0.0, 0.0, width, height);

  return v26;
}

- (void)computeLowThreshold:(float *)a3 andFactor:(float *)a4 withThreshold:(float)a5 andSoftness:(float)a6
{
  if (a5 < 0.00065) {
    a5 = 0.00065;
  }
  float v6 = a5 * a6;
  float v7 = a5 - (float)(v6 * 0.5);
  *a3 = v7;
  *a4 = 1.0 / (float)((float)(a5 + (float)(v6 * 0.5)) - v7);
}

- (void)computeScaleA:(float *)a3 B:(float *)a4 withSmoothingAmount:(float)a5
{
  *a3 = (float)(a5 * -0.5) + 1.0;
  *a4 = a5 * 0.25;
}

- (id)outputUnboost:(id)a3
{
  v61[9] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_intValue(self->inputBoostMethod, v5, v6, v7, v8))
  {
    uint64_t v58 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v9, v10, v11, v12, 0.0106899999, 0.0437199995, 0.146479994, 0.667469978);
    CGRect v60 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v13, v14, v15, v16, 654.581604, -28.2951641, 1.25156403, 0.0);
    CGRect v59 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v17, v18, v19, v20, 68.604454, -10.1250257, 1.06397295, 0.000645000022);
    uint64_t v25 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v21, v22, v23, v24, 5.20553207, -2.30455089, 0.743704975, 0.0049970001);
    uint64_t v30 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v26, v27, v28, v29, 0.753764987, -0.49348101, 0.499689013, 0.015873);
    uint64_t v35 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v31, v32, v33, v34, 6.54402304, -12.7344961, 9.10175419, -1.99401903);
    uint64_t v40 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v36, v37, v38, v39, 232.470688, -640.049011, 589.582336, -181.004013);
    LODWORD(v41) = 1074885725;
    uint64_t v46 = objc_msgSend_numberWithFloat_(NSNumber, v42, v43, v44, v45, v41);
    id v47 = v4;
    uint64_t v51 = objc_msgSend_kernelWithName_(NRKernels, v48, @"inverseBoost", v49, v50);
    v61[0] = v58;
    v61[1] = &unk_1F39B4DC0;
    v61[2] = v60;
    void v61[3] = v59;
    v61[4] = v25;
    v61[5] = v30;
    v61[6] = v35;
    v61[7] = v40;
    v61[8] = v46;
    uint64_t v54 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v52, (uint64_t)v61, 9, v53);
    objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v55, (uint64_t)v51, (uint64_t)v47, (uint64_t)v54, self->inputColorSpace, 1);
    id v56 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v56 = v4;
  }

  return v56;
}

- (id)outputBoost:(id)a3
{
  v51[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_intValue(self->inputBoostMethod, v5, v6, v7, v8))
  {
    uint64_t v50 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v9, v10, v11, v12, 0.100000001, 0.200000003, 0.5, 1.0);
    uint64_t v17 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v13, v14, v15, v16, -53.0999899, 16.819998, 0.799000025, 0.0);
    uint64_t v22 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v18, v19, v20, v21, -12.3000026, 2.62000144, 2.41499972, -0.0603999913);
    uint64_t v27 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v23, v24, v25, v26, 2.64814695, -4.82888758, 3.60077739, -0.11918516);
    uint64_t v32 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v28, v29, v30, v31, 0.492000163, -1.72000039, 2.10900028, 0.118999943);
    LODWORD(v33) = 1054951342;
    uint64_t v38 = objc_msgSend_numberWithFloat_(NSNumber, v34, v35, v36, v37, v33);
    id v39 = v4;
    uint64_t v43 = objc_msgSend_kernelWithName_(NRKernels, v40, @"boost", v41, v42);
    v51[0] = v50;
    v51[1] = v17;
    v51[2] = v22;
    void v51[3] = v27;
    v51[4] = v32;
    v51[5] = v38;
    uint64_t v46 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v44, (uint64_t)v51, 6, v45);
    objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v47, (uint64_t)v43, (uint64_t)v39, (uint64_t)v46, self->inputColorSpace, 1);
    id v48 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v48 = v4;
  }

  return v48;
}

- (float)adjustedRNAmount
{
  objc_msgSend_floatValue(self->inputScaleFactor, a2, v2, v3, v4);
  float v7 = fminf(fmaxf(v6, 0.0), 1.0);
  objc_msgSend_floatValue(self->inputRepresentativeNoise, v8, v9, v10, v11);
  return v7 * v12;
}

- (id)outputCNR:(id)a3 extent:(CGRect)a4 returningDebugProduct:(BOOL *)a5
{
  id v11 = a3;
  if (a5) {
    *a5 = 0;
  }
  objc_msgSend_adjustedRNAmount(self, v7, v8, v9, v10);
  float v13 = v12;
  objc_msgSend_floatValue(self->inputCNRAmount, v14, v15, v16, v17);
  float v19 = v18;
  objc_msgSend_floatValue(self->inputBaselineExposure, v20, v21, v22, v23);
  float v25 = v24;
  uint64_t v26 = (void *)MEMORY[0x1E4F1E080];
  objc_msgSend_X(self->inputNeutralFactors, v27, v28, v29, v30);
  double v32 = v31;
  float v33 = exp2f(v25);
  objc_msgSend_Y(self->inputNeutralFactors, v34, v35, v36, v37);
  double v39 = v38;
  objc_msgSend_Z(self->inputNeutralFactors, v40, v41, v42, v43);
  uint64_t v53 = objc_msgSend_vectorWithX_Y_Z_W_(v26, v45, v46, v47, v48, v32 * v33, v39 * v33, v44 * v33, 1.0);
  float v54 = 1.0;
  if (v13 > 1.5) {
    float v54 = 5.0;
  }
  float v55 = (float)(v13 * 0.024249) * v19;
  if ((float)(v55 * 3.5) >= 0.0051961) {
    float v56 = v55 * 3.5;
  }
  else {
    float v56 = 0.0;
  }
  if ((float)(v55 * 1.3) >= 0.0051961) {
    float v57 = v55 * 1.3;
  }
  else {
    float v57 = 0.0;
  }
  if ((float)(v55 * 0.75) >= 0.0051961) {
    float v58 = v55 * 0.75;
  }
  else {
    float v58 = 0.0;
  }
  float v59 = v55 * 0.2;
  if ((float)(v54 * v59) >= 0.0051961) {
    float v60 = v59;
  }
  else {
    float v60 = 0.0;
  }
  objc_msgSend_floatValue(self->inputMoireRadius, v49, v50, v51, v52);
  float v62 = v61;
  objc_msgSend_floatValue(self->inputMoireAmount, v63, v64, v65, v66);
  float v71 = *(float *)&v72 * 0.04;
  HIDWORD(v72) = 0;
  if ((float)(*(float *)&v72 * 0.04) == 0.0) {
    float v62 = 0.0;
  }
  if (v56 == 0.0 && v62 == 0.0 && (objc_msgSend_BOOLValue(self->inputShowHF, v67, v68, v69, v70) & 1) == 0)
  {
    objc_msgSend_multiply_byNeutralFactors_(self, v67, (uint64_t)v11, (uint64_t)v53, v70);
    id v87 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_78;
  }
  if (v62 <= 0.0 && !objc_msgSend_BOOLValue(self->inputShowHF, v67, v68, v69, v70))
  {
    if (v57 != 0.0)
    {
      v97 = objc_msgSend_extractHalfSizeRGB_neutralFactors_(self, v67, (uint64_t)v11, (uint64_t)v53, v70);

      if (v56 <= 0.0)
      {
        CGRect v88 = v97;
      }
      else
      {
        LODWORD(v99) = 1.0;
        *(float *)&double v98 = v56;
        uint64_t v102 = objc_msgSend_powerBlur_threshold_scale_(self, v79, (uint64_t)v97, v80, v81, v98, v99);

        CGRect v88 = (void *)v102;
      }
      if (v57 > 0.0)
      {
        LODWORD(v100) = 1033650332;
        LODWORD(v101) = 1076258406;
        LODWORD(v99) = 3.0;
        *(float *)&double v98 = v57;
        uint64_t v109 = objc_msgSend_powerBlurDespeckle_threshold_scale_countThreshold_luminanceThreshold_diffAmount_(self, v79, (uint64_t)v88, 5, v81, v98, v99, v100, v101);

        CGRect v88 = (void *)v109;
      }
      if (v58 > 0.0)
      {
        LODWORD(v99) = 7.0;
        *(float *)&double v98 = v58;
        uint64_t v110 = objc_msgSend_powerBlurEarlyOut_threshold_scale_(self, v79, (uint64_t)v88, v80, v81, v98, v99);

        CGRect v88 = (void *)v110;
      }
      if (v13 <= 1.5)
      {
        if (v60 <= 0.0) {
          goto LABEL_75;
        }
        LODWORD(v99) = 14.0;
        *(float *)&double v98 = v60;
        uint64_t v111 = objc_msgSend_powerBlurEarlyOut_threshold_scale_(self, v79, (uint64_t)v88, v80, v81, v98, v99);
      }
      else
      {
        if (v60 <= 0.0) {
          goto LABEL_75;
        }
        LODWORD(v100) = 1041865114;
        LODWORD(v99) = 14.0;
        LODWORD(v101) = 5.0;
        *(float *)&double v98 = v60;
        uint64_t v111 = objc_msgSend_powerBlurEarlyOut2_threshold_scale_neutralThreshold_thresholdScale_(self, v79, (uint64_t)v88, v80, v81, v98, v99, v100, v101);
      }
      v112 = (void *)v111;

      CGRect v88 = v112;
      goto LABEL_75;
    }
    *(float *)&double v72 = v56;
    CGRect v89 = objc_msgSend_powerBlurFS_threshold_neutralFactors_(self, v67, (uint64_t)v11, (uint64_t)v53, v70, v72);
    CGRect v90 = v11;
LABEL_76:

    id v87 = v89;
    goto LABEL_77;
  }
  BOOL v73 = v57 != 0.0 || v62 > 2.0;
  if (!v73 && (objc_msgSend_BOOLValue(self->inputShowHF, v67, v68, v69, v70) & 1) == 0)
  {
    *(float *)&double v72 = v56;
    CGRect v90 = objc_msgSend_highFrequencyIntoAlpha_threshold_neutralFactors_(self, v67, (uint64_t)v11, (uint64_t)v53, v70, v72);
    *(float *)&double v91 = v56;
    *(float *)&double v92 = v71;
    CGRect v89 = objc_msgSend_powerBlurFSHF_threshold_moireAmount_neutralFactors_(self, v93, (uint64_t)v90, (uint64_t)v53, v94, v91, v92);

    goto LABEL_76;
  }
  *(float *)&double v72 = v56;
  CGFloat v74 = objc_msgSend_extractHalfSizeRGBHF_neutralFactors_threshold_(self, v67, (uint64_t)v11, (uint64_t)v53, v70, v72);

  if (!objc_msgSend_BOOLValue(self->inputShowHF, v75, v76, v77, v78))
  {
    if (v56 > 0.0 || v62 > 0.0)
    {
      LODWORD(v84) = 1.0;
      *(float *)&double v82 = v56;
      *(float *)&double v83 = v71;
      uint64_t v95 = objc_msgSend_powerBlurHF_threshold_moireAmount_scale_(self, v79, (uint64_t)v74, v80, v81, v82, v83, v84);

      CGRect v88 = (void *)v95;
    }
    else
    {
      CGRect v88 = v74;
    }
    if (v57 > 0.0 || v62 >= 3.0)
    {
      if (v57 > 0.0)
      {
        LODWORD(v85) = 1033650332;
        LODWORD(v86) = 1076258406;
        LODWORD(v84) = 3.0;
        *(float *)&double v82 = v57;
        *(float *)&double v83 = v71;
        objc_msgSend_powerBlurDespeckleHF_threshold_moireAmount_scale_countThreshold_luminanceThreshold_diffAmount_(self, v79, (uint64_t)v88, 5, v81, v82, v83, v84, v85, v86);
      }
      else
      {
        LODWORD(v84) = 3.0;
        *(float *)&double v82 = v57;
        *(float *)&double v83 = v71;
        objc_msgSend_powerBlurHF_threshold_moireAmount_scale_(self, v79, (uint64_t)v88, v80, v81, v82, v83, v84);
      uint64_t v103 = };

      CGRect v88 = (void *)v103;
    }
    if (v58 > 0.0 || v62 >= 7.0)
    {
      LODWORD(v84) = 7.0;
      *(float *)&double v82 = v58;
      *(float *)&double v83 = v71;
      uint64_t v105 = objc_msgSend_powerBlurEarlyOutHF_threshold_moireAmount_scale_(self, v79, (uint64_t)v88, v80, v81, v82, v83, v84);

      CGRect v88 = (void *)v105;
    }
    BOOL v106 = v62 < 14.0 && v60 <= 0.0;
    if (v13 <= 1.5)
    {
      if (!v106)
      {
        LODWORD(v84) = 14.0;
        *(float *)&double v82 = v60;
        *(float *)&double v83 = v71;
        uint64_t v107 = objc_msgSend_powerBlurEarlyOutHF_threshold_moireAmount_scale_(self, v79, (uint64_t)v88, v80, v81, v82, v83, v84);
        goto LABEL_62;
      }
    }
    else if (!v106)
    {
      LODWORD(v85) = 1041865114;
      LODWORD(v84) = 14.0;
      LODWORD(v86) = 5.0;
      *(float *)&double v82 = v60;
      *(float *)&double v83 = v71;
      uint64_t v107 = objc_msgSend_powerBlurEarlyOut2HF_threshold_moireAmount_scale_neutralThreshold_thresholdScale_(self, v79, (uint64_t)v88, v80, v81, v82, v83, v84, v85, v86);
LABEL_62:
      v108 = (void *)v107;

      CGRect v88 = v108;
    }
LABEL_75:
    CGRect v90 = objc_msgSend_perceptualToLinear_(self, v79, (uint64_t)v88, v80, v81);

    CGRect v89 = objc_msgSend_expandHalfSizeRGB_(self, v113, (uint64_t)v90, v114, v115);
    goto LABEL_76;
  }
  id v87 = v74;
LABEL_77:
  id v11 = v87;
LABEL_78:
  v116 = v87;

  return v116;
}

- (id)outputImage
{
  if (self->inputImage)
  {
    objc_msgSend_doubleValue(self->inputLNRAmount, a2, v2, v3, v4);
    if (v10 == 0.0)
    {
      objc_msgSend_doubleValue(self->inputCNRAmount, v6, v7, v8, v9);
      if (v15 == 0.0)
      {
        objc_msgSend_doubleValue(self->inputSharpenAmount, v11, v12, v13, v14);
        if (v20 == 0.0)
        {
          objc_msgSend_doubleValue(self->inputContrastAmount, v16, v17, v18, v19);
          if (v25 == 0.0)
          {
            objc_msgSend_doubleValue(self->inputDetailAmount, v21, v22, v23, v24);
            if (v30 == 0.0)
            {
              objc_msgSend_doubleValue(self->inputMoireAmount, v26, v27, v28, v29);
              if (v31 == 0.0)
              {
                double v32 = self->inputImage;
                goto LABEL_213;
              }
            }
          }
        }
      }
    }
    float v33 = sub_1DDA83E7C();
    uint64_t v34 = v33;
    if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v33))
    {
      *(_WORD *)&buf[4] = 0;
      _os_signpost_emit_with_name_impl(&dword_1DDA14000, v34, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWReduceNoise", (const char *)&unk_1DDC3ACB6, &buf[4], 2u);
    }

    v792[0] = MEMORY[0x1E4F143A8];
    v792[1] = 3221225472;
    v792[2] = sub_1DDB865DC;
    v792[3] = &unk_1E6D04A58;
    v792[4] = self;
    uint64_t v35 = (void (**)(void))MEMORY[0x1E01C46E0](v792);
    if ((int)objc_msgSend_intValue(self->inputVersion, v36, v37, v38, v39) >= 8)
    {
      if (self->inputISODictionary)
      {
        objc_msgSend_V8OutputImage(self, v40, v41, v42, v43);
        double v32 = (CIImage *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        NSLog(&cfstr_V8NoiseReducti.isa);
        double v32 = 0;
      }
      goto LABEL_112;
    }
    *(void *)buf = 0;
    objc_msgSend_floatValue(self->inputScaleFactor, v40, v41, v42, v43);
    float v45 = v44;
    objc_msgSend_adjustedRNAmount(self, v46, v47, v48, v49);
    float v51 = v50;
    objc_msgSend_floatValue(self->inputLNRAmount, v52, v53, v54, v55);
    float v57 = v56;
    objc_msgSend_floatValue(self->inputSharpenAmount, v58, v59, v60, v61);
    float v63 = v62;
    objc_msgSend_floatValue(self->inputSharpenThreshold, v64, v65, v66, v67);
    float v786 = exp2f(fminf(fmaxf((float)(0.6 - v57) * 2.5, 0.0), 1.0) * v68);
    objc_msgSend_floatValue(self->inputContrastAmount, v69, v70, v71, v72);
    float v74 = v73;
    objc_msgSend_floatValue(self->inputDetailAmount, v75, v76, v77, v78);
    float v783 = v79;
    int v754 = objc_msgSend_BOOLValue(self->inputOpponentColorEnabled, v80, v81, v82, v83);
    float v84 = fminf(fmaxf(v45, 0.0), 1.0);
    float v85 = v84 * v63;
    float v90 = log2f(v84);
    unsigned int v91 = vcvtms_s32_f32(v90);
    if ((v91 & 0x80000000) == 0)
    {
      float v747 = v74;
      goto LABEL_30;
    }
    float v92 = v74;
    float v93 = v90 - (float)(int)floorf(v90);
    float v74 = 0.0;
    if (v91 == -3)
    {
      float v85 = v93 * v92;
    }
    else
    {
      if (v91 != -2)
      {
        float v94 = v92;
        float v95 = v92 + (float)((float)(v85 - v92) * v93);
        float v96 = v92 + (float)((float)(v92 - v92) * v93);
        float v97 = v93 * v94;
        if (v91 != -1) {
          float v97 = 0.0;
        }
        float v747 = v97;
        if (v91 == -1) {
          float v85 = v95;
        }
        else {
          float v85 = 0.0;
        }
        if (v91 == -1) {
          float v74 = v96;
        }
LABEL_30:
        if (v51 < 1.0619)
        {
          float v734 = (float)(v51 / 1.0619) * 0.0113;
          float v98 = 7.0;
          float v99 = 0.381;
          float v100 = 0.3;
LABEL_38:
          float v736 = v100;
          goto LABEL_39;
        }
        if (v51 >= 1.1953)
        {
          if (v51 >= 1.3487)
          {
            if (v51 >= 1.4304)
            {
              if (v51 >= 1.6138)
              {
                if (v51 < 1.8297)
                {
                  float v101 = (float)(v51 + -1.6138) / 0.2159;
                  float v98 = 11.0 - v101;
                  float v734 = (float)(v101 * 0.012) + 0.035;
                  float v102 = 0.278;
                  float v103 = -0.115;
                  goto LABEL_37;
                }
                if (v51 < 2.8337)
                {
                  float v101 = (float)(v51 + -1.8297) / 1.004;
                  float v98 = (float)(v101 * -3.0) + 10.0;
                  float v734 = (float)(v101 * 0.034) + 0.047;
                  float v102 = 0.163;
                  float v103 = 0.077;
                  goto LABEL_37;
                }
                if (v51 < 3.9856)
                {
                  float v101 = (float)(v51 + -2.8337) / 1.1519;
                  float v98 = (float)(v101 * -3.0) + 7.0;
                  float v734 = (float)(v101 * 0.008) + 0.081;
                  float v102 = 0.24;
                  float v103 = 0.06;
                  goto LABEL_37;
                }
                float v736 = 1.0;
                if (v51 >= 6.1675)
                {
                  float v98 = 3.5;
                  float v99 = 0.333;
                  float v734 = 0.206;
                }
                else
                {
                  float v113 = (float)(v51 + -3.9856) / 2.1819;
                  float v98 = (float)(v113 * -0.5) + 4.0;
                  float v734 = (float)(v113 * 0.117) + 0.089;
                  float v99 = (float)(v113 * 0.033) + 0.3;
                }
              }
              else
              {
                float v108 = (float)(v51 + -1.4304) / 0.1834;
                float v734 = (float)(v108 * 0.007) + 0.028;
                float v99 = (float)(v108 * -0.077) + 0.355;
                float v736 = 1.0;
                float v98 = 11.0;
              }
LABEL_39:
              if (v51 < 1.135)
              {
                float v104 = 0.03;
                goto LABEL_62;
              }
              if (v51 >= 1.2804)
              {
                if (v51 >= 1.5949)
                {
                  if (v51 >= 1.7695)
                  {
                    if (v51 >= 2.5961)
                    {
                      if (v51 >= 3.8895)
                      {
                        if (v51 >= 5.9267)
                        {
                          float v104 = 0.08;
LABEL_62:
                          if (v51 > 3.5) {
                            float v98 = 1.0;
                          }
                          float v732 = v98;
                          float v738 = v99;
                          float v729 = v104;
                          if (v57 >= 0.5)
                          {
                            if (v51 > 5.3079)
                            {
                              float v109 = 0.04;
                              goto LABEL_106;
                            }
                            if (v51 <= 3.7633)
                            {
                              if (v51 <= 2.1287)
                              {
                                if (v51 <= 1.6717)
                                {
                                  if (v51 <= 0.9414)
                                  {
                                    if (v51 <= 0.5)
                                    {
                                      float v109 = 0.0021;
                                      goto LABEL_106;
                                    }
                                    float v110 = (float)(v51 + -0.5) / 0.3968;
                                    float v111 = 0.0021;
                                    float v112 = 0.0025;
                                  }
                                  else
                                  {
                                    float v110 = (float)(v51 + -0.9414) / 0.7303;
                                    float v111 = 0.0046;
                                    float v112 = 0.0052;
                                  }
                                }
                                else
                                {
                                  float v110 = (float)(v51 + -1.6717) / 0.457;
                                  float v111 = 0.0098;
                                  float v112 = 0.0085;
                                }
                              }
                              else
                              {
                                float v110 = (float)(v51 + -2.1287) / 1.6346;
                                float v111 = 0.0183;
                                float v112 = 0.0067;
                              }
                            }
                            else
                            {
                              float v110 = (float)(v51 + -3.7633) / 1.5446;
                              float v111 = 0.025;
                              float v112 = 0.015;
                            }
                          }
                          else
                          {
                            if (v51 > 5.9267)
                            {
                              float v109 = 0.13;
                              goto LABEL_106;
                            }
                            if (v51 <= 3.8895)
                            {
                              if (v51 <= 2.5961)
                              {
                                if (v51 <= 1.7695)
                                {
                                  if (v51 <= 1.5949)
                                  {
                                    if (v51 <= 1.4104)
                                    {
                                      if (v51 <= 1.2804)
                                      {
                                        if (v51 <= 1.135)
                                        {
                                          if (v51 <= 1.0083)
                                          {
                                            if (v51 <= 0.8954)
                                            {
                                              float v110 = v51 / 0.8954;
                                              float v111 = 0.0087;
                                              float v112 = 0.0108;
                                            }
                                            else
                                            {
                                              float v110 = (float)(v51 + -0.8954) / 0.1129;
                                              float v111 = 0.0195;
                                              float v112 = 0.0025;
                                            }
                                          }
                                          else
                                          {
                                            float v110 = (float)(v51 + -1.0083) / 0.1267;
                                            float v111 = 0.022;
                                            float v112 = 0.002;
                                          }
                                        }
                                        else
                                        {
                                          float v110 = (float)(v51 + -1.135) / 0.1454;
                                          float v111 = 0.024;
                                          float v112 = 0.004;
                                        }
                                      }
                                      else
                                      {
                                        float v110 = (float)(v51 + -1.2804) / 0.13;
                                        float v111 = 0.028;
                                        float v112 = 0.005;
                                      }
                                    }
                                    else
                                    {
                                      float v110 = (float)(v51 + -1.4104) / 0.1845;
                                      float v111 = 0.033;
                                      float v112 = 0.003;
                                    }
                                  }
                                  else
                                  {
                                    float v110 = (float)(v51 + -1.5949) / 0.1746;
                                    float v111 = 0.036;
                                    float v112 = 0.014;
                                  }
                                }
                                else
                                {
                                  float v110 = (float)(v51 + -1.7695) / 0.8266;
                                  float v111 = 0.05;
                                  float v112 = 0.015;
                                }
                              }
                              else
                              {
                                float v110 = (float)(v51 + -2.5961) / 1.2934;
                                float v111 = 0.065;
                                float v112 = 0.025;
                              }
                            }
                            else
                            {
                              float v110 = (float)(v51 + -3.8895) / 2.0372;
                              float v111 = 0.09;
                              float v112 = 0.04;
                            }
                          }
                          float v109 = v111 + (float)(v110 * v112);
LABEL_106:
                          float v780 = v109;
                          uint64_t v114 = (void *)MEMORY[0x1E4F1E080];
                          objc_msgSend_X(self->inputNeutralFactors, v86, v87, v88, v89);
                          double v116 = v115;
                          objc_msgSend_Y(self->inputNeutralFactors, v117, v118, v119, v120);
                          double v122 = v121;
                          objc_msgSend_Z(self->inputNeutralFactors, v123, v124, v125, v126);
                          v788 = objc_msgSend_vectorWithX_Y_Z_W_(v114, v128, v129, v130, v131, 1.0 / v116, 1.0 / v122, 1.0 / v127, 1.0);
                          float v752 = v74;
                          float v750 = v51;
                          v136 = objc_msgSend_imageByClampingToExtent(self->inputImage, v132, v133, v134, v135);
                          objc_msgSend_extent(self->inputImage, v137, v138, v139, v140);
                          double v142 = v141;
                          double v144 = v143;
                          double v146 = v145;
                          double v148 = v147;
                          v149 = v788;
                          v153 = objc_msgSend_outputUnboost_(self, v150, (uint64_t)v136, v151, v152);

                          id v154 = v153;
                          char v790 = 0;
                          v789 = objc_msgSend_outputCNR_extent_returningDebugProduct_(self, v155, (uint64_t)v154, (uint64_t)&v790, v156, v142, v144, v146, v148);
                          if (objc_msgSend_BOOLValue(self->inputShowHF, v157, v158, v159, v160))
                          {
                            uint64_t v165 = sub_1DDB86664(v789, v788, v142 * 0.5, v144 * 0.5, v146 * 0.5, v148 * 0.5);
                          }
                          else
                          {
                            if (!v790)
                            {
                              double v714 = v142;
                              objc_msgSend_X(self->inputNeutralFactors, v161, v162, v163, v164);
                              double v167 = v166;
                              double v713 = v144;
                              objc_msgSend_Y(self->inputNeutralFactors, v168, v169, v170, v171);
                              double v173 = v172;
                              objc_msgSend_Z(self->inputNeutralFactors, v174, v175, v176, v177);
                              double v179 = v178;
                              double v711 = v146;
                              double v712 = v148;
                              float v724 = v85;
                              objc_msgSend_floatValue(self->inputBaselineExposure, v180, v181, v182, v183);
                              float v185 = exp2f(v184);
                              v186 = (void *)MEMORY[0x1E4F1E080];
                              objc_msgSend_X(self->inputLumFactors, v187, v188, v189, v190);
                              double v192 = v191;
                              objc_msgSend_Y(self->inputLumFactors, v193, v194, v195, v196);
                              double v198 = v197;
                              objc_msgSend_Z(self->inputLumFactors, v199, v200, v201, v202);
                              v208 = objc_msgSend_vectorWithX_Y_Z_W_(v186, v204, v205, v206, v207, v192 * v185, v198 * v185, v203 * v185, 1.0);
                              v209 = (void *)MEMORY[0x1E4F1E080];
                              v728 = v208;
                              objc_msgSend_X(v208, v210, v211, v212, v213);
                              double v215 = v214;
                              objc_msgSend_Y(v728, v216, v217, v218, v219);
                              double v221 = v220;
                              objc_msgSend_Z(v728, v222, v223, v224, v225);
                              uint64_t v235 = objc_msgSend_vectorWithX_Y_Z_W_(v209, v227, v228, v229, v230, v167 * v215, v173 * v221, v179 * v226, 1.0);
                              v718 = (void *)v235;
                              if (v754)
                              {
                                float v236 = (float)((float)(v750 * 0.01) * (float)(v750 * 0.01)) / 0.15;
                                v237 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v231, v232, v233, v234, v167 * (float)(v236 * 100.0), v167 / (float)((float)(v236 * 200.0) - (float)(v236 * 100.0)), v173 * (float)(v236 * 100.0), v173 / (float)((float)(v236 * 200.0) - (float)(v236 * 100.0)));
                                v727 = objc_msgSend_extractYOpponentColor_neutralFactors_luminanceFactors_noiseVector_(self, v238, (uint64_t)v154, (uint64_t)self->inputNeutralFactors, (uint64_t)v728, v237);
                              }
                              else
                              {
                                v727 = objc_msgSend_extractY_neutralFactors_(self, v231, (uint64_t)v154, v235, v234);
                              }
                              float v243 = v84 * v783;
                              float v722 = v786 * v780;
                              float v244 = v722 + v722;
                              if (v57 >= 0.5) {
                                float v245 = (float)(v57 + -0.5) + (float)(v57 + -0.5);
                              }
                              else {
                                float v245 = 0.0;
                              }
                              if (v57 >= 0.5) {
                                float v246 = 1.0;
                              }
                              else {
                                float v246 = v57 + v57;
                              }
                              if (v750 >= 0.5) {
                                float v247 = 0.0;
                              }
                              else {
                                float v247 = v243;
                              }
                              if (v750 >= 0.5) {
                                float v248 = v243;
                              }
                              else {
                                float v248 = 0.0;
                              }
                              float v719 = v245;
                              if (v57 == 0.0 && v752 == 0.0 && v747 == 0.0 && v248 == 0.0)
                              {
                                int v249 = 0;
                              }
                              else if (v245 == 0.0)
                              {
                                if (v248 == 0.0) {
                                  int v250 = 2;
                                }
                                else {
                                  int v250 = 3;
                                }
                                HIDWORD(v241) = 0;
                                if (v747 == 0.0 && v752 == 0.0) {
                                  int v249 = v250;
                                }
                                else {
                                  int v249 = 4;
                                }
                              }
                              else
                              {
                                int v249 = 5;
                              }
                              LODWORD(v242) = 0.75;
                              *(float *)&double v241 = v722 + v722;
                              objc_msgSend_computeLowThreshold_andFactor_withThreshold_andSoftness_(self, v239, (uint64_t)&buf[4], (uint64_t)buf, v240, v241, v242);
                              switch(v249)
                              {
                                case 0:
                                  LODWORD(v255) = 1.0;
                                  uint64_t v256 = objc_msgSend_gaborFiltersToSmoothedLuminanceAndGradient_smoothAmt_tinyBlurFactor_(self, v252, (uint64_t)v727, v253, v254, v255, 0.0);
                                  uint64_t v260 = objc_msgSend_reduce_(self, v257, v256, v258, v259);
                                  LODWORD(v262) = *(_DWORD *)buf;
                                  LODWORD(v261) = *(_DWORD *)&buf[4];
                                  v753 = objc_msgSend_blurGradient_lothresh_factor_(self, v263, v256, v264, v265, v261, v262);
                                  v733 = (void *)v260;
                                  v715 = (void *)v256;
                                  id v267 = 0;
                                  *(float *)&double v268 = v724;
                                  *(float *)&double v269 = v247;
                                  if (v754) {
                                    objc_msgSend_expandAndSharpenThroughGradientMaskGatherOpponentColor_halfSizeY_cnrRGB_originalY_sharpen_floor_sushiFactors_crop_lumFactors_(self, v266, (uint64_t)v753, v260, (uint64_t)v789, v727, v788, v728, v268, v269, v714, v713, v711, v712);
                                  }
                                  else {
                                    objc_msgSend_expandAndSharpenThroughGradientMaskGather_halfSizeY_cnrRGB_sharpen_floor_sushiFactors_crop_lumFactors_(self, v266, (uint64_t)v753, v260, (uint64_t)v789, v788, v728, v268, v269, v714, v713, v711, v712);
                                  }
                                  goto LABEL_147;
                                case 1:
                                  LODWORD(v255) = 1.0;
                                  objc_msgSend_gaborFiltersToSmoothedLuminanceAndGradient_smoothAmt_tinyBlurFactor_(self, v252, (uint64_t)v727, v253, v254, v255, 0.0);
                                  id v354 = (id)objc_claimAutoreleasedReturnValue();
                                  id v768 = v354;
                                  id v267 = 0;
                                  if (v754) {
                                    objc_msgSend_YAndRGBGatherOpponentColor_cnrRGB_originalY_sushiFactors_crop_lumFactors_(self, v355, (uint64_t)v354, (uint64_t)v789, (uint64_t)v727, v788, v728, v714, v713, v711, v712);
                                  }
                                  else {
                                  v435 = objc_msgSend_YAndRGBGather_cnrRGB_sushiFactors_crop_lumFactors_(self, v355, (uint64_t)v354, (uint64_t)v789, (uint64_t)v788, v728, v714, v713, v711, v712);
                                  }
                                  v765 = 0;
                                  v766 = 0;
                                  id v762 = 0;
                                  v763 = 0;
                                  v720 = 0;
                                  v721 = 0;
                                  v773 = 0;
                                  v775 = 0;
                                  v771 = 0;
                                  v772 = 0;
                                  v770 = 0;
                                  v737 = 0;
                                  v739 = 0;
                                  v723 = 0;
                                  v778 = 0;
                                  v779 = 0;
                                  v436 = 0;
                                  v776 = 0;
                                  v777 = 0;
                                  v733 = 0;
                                  v735 = 0;
                                  v438 = 0;
                                  v731 = 0;
                                  v784 = 0;
                                  v787 = 0;
                                  v781 = 0;
                                  v748 = 0;
                                  v753 = 0;
                                  v439 = 0;
                                  v440 = 0;
                                  v437 = v768;
                                  v715 = v768;
                                  goto LABEL_167;
                                case 2:
                                  LODWORD(v255) = 1.0;
                                  uint64_t v315 = objc_msgSend_gaborFiltersToSmoothedLuminanceAndGradient_smoothAmt_tinyBlurFactor_(self, v252, (uint64_t)v727, v253, v254, v255, 0.0);
                                  uint64_t v319 = objc_msgSend_reduce_(self, v316, v315, v317, v318);
                                  LODWORD(v321) = *(_DWORD *)buf;
                                  LODWORD(v320) = *(_DWORD *)&buf[4];
                                  v753 = objc_msgSend_blurGradient_lothresh_factor_(self, v322, v315, v323, v324, v320, v321);
                                  v733 = (void *)v319;
                                  v715 = (void *)v315;
                                  id v267 = 0;
                                  *(float *)&double v326 = v724;
                                  *(float *)&double v327 = v246;
                                  *(float *)&double v328 = v247;
                                  if (v754) {
                                    objc_msgSend_expandAndSharpenDetailsThroughGradientMaskGatherOpponentColor_halfSizeY_cnrRGB_originalY_sharpen_soften_floor_sushiFactors_crop_lumFactors_(self, v325, (uint64_t)v753, v319, (uint64_t)v789, v727, v788, v728, v326, v327, v328, v714, v713, v711, v712);
                                  }
                                  else {
                                    objc_msgSend_expandAndSharpenDetailsThroughGradientMaskGather_halfSizeY_cnrRGB_sharpen_soften_floor_sushiFactors_crop_lumFactors_(self, v325, (uint64_t)v753, v319, (uint64_t)v789, v788, v728, v326, v327, v328, v714, v713, v711, v712);
                                  }
                                  uint64_t v270 = LABEL_147:;
                                  v435 = (void *)v270;
                                  v765 = 0;
                                  v766 = 0;
                                  id v762 = 0;
                                  v763 = 0;
                                  v720 = 0;
                                  v721 = 0;
                                  v773 = 0;
                                  v775 = 0;
                                  v771 = 0;
                                  v772 = 0;
                                  v770 = 0;
                                  v737 = 0;
                                  v739 = 0;
                                  v723 = 0;
                                  v778 = 0;
                                  v779 = 0;
                                  v436 = 0;
                                  v776 = 0;
                                  v777 = 0;
                                  v735 = 0;
                                  v437 = 0;
                                  v438 = 0;
                                  v731 = 0;
                                  v784 = 0;
                                  v787 = 0;
                                  v781 = 0;
                                  v748 = 0;
                                  v439 = 0;
                                  v440 = 0;
LABEL_167:
                                  v726 = 0;
                                  v751 = 0;
                                  goto LABEL_210;
                                case 3:
                                  LODWORD(v255) = 1.0;
                                  uint64_t v329 = objc_msgSend_gaborFiltersToSmoothedLuminanceAndGradient_smoothAmt_tinyBlurFactor_(self, v252, (uint64_t)v727, v253, v254, v255, 0.0);
                                  uint64_t v333 = objc_msgSend_reduce_(self, v330, v329, v331, v332);
                                  LODWORD(v335) = *(_DWORD *)buf;
                                  LODWORD(v334) = *(_DWORD *)&buf[4];
                                  v753 = objc_msgSend_blurGradient_lothresh_factor_(self, v336, v329, v337, v338, v334, v335);
                                  uint64_t v341 = objc_msgSend_expandAndMakeDetails_halfSize_(self, v339, (uint64_t)v753, v333, v340);
                                  v748 = objc_msgSend_fineGrainNoise2_tinyBlurFactor_(self, v342, v341, v343, v344, 0.0);
                                  *(float *)&double v345 = v246;
                                  *(float *)&double v346 = v724;
                                  v731 = objc_msgSend_expandAndAddDetailsThroughGradientMask2_halfSize_fullSizeDetails_soften_sharpen_(self, v347, (uint64_t)v753, v333, v341, v345, v346);
                                  *(float *)&double v348 = v248;
                                  uint64_t v351 = objc_msgSend_addNoise_noise_amount_(self, v349, (uint64_t)v731, (uint64_t)v748, v350, v348);
                                  v353 = (void *)v351;
                                  v751 = (void *)v341;
                                  v733 = (void *)v333;
                                  v715 = (void *)v329;
                                  id v267 = 0;
                                  if (v754) {
                                    objc_msgSend_YAndRGBGatherOpponentColor_cnrRGB_originalY_sushiFactors_crop_lumFactors_(self, v352, v351, (uint64_t)v789, (uint64_t)v727, v788, v728, v714, v713, v711, v712);
                                  }
                                  else {
                                  v435 = objc_msgSend_YAndRGBGather_cnrRGB_sushiFactors_crop_lumFactors_(self, v352, v351, (uint64_t)v789, (uint64_t)v788, v728, v714, v713, v711, v712);
                                  }
                                  v765 = 0;
                                  v766 = 0;
                                  id v762 = 0;
                                  v763 = 0;
                                  v720 = 0;
                                  v721 = 0;
                                  v773 = 0;
                                  v775 = 0;
                                  v771 = 0;
                                  v772 = 0;
                                  v770 = 0;
                                  v737 = 0;
                                  v739 = 0;
                                  v723 = 0;
                                  v778 = 0;
                                  v779 = 0;
                                  v436 = 0;
                                  v776 = 0;
                                  v777 = 0;
                                  v735 = 0;
                                  v437 = v353;
                                  goto LABEL_173;
                                case 4:
                                  LODWORD(v255) = 1.0;
                                  uint64_t v274 = objc_msgSend_gaborFiltersToSmoothedLuminanceAndGradient_smoothAmt_tinyBlurFactor_(self, v252, (uint64_t)v727, v253, v254, v255, 0.0);
                                  uint64_t v278 = objc_msgSend_reduce_(self, v275, v274, v276, v277);
                                  v751 = objc_msgSend_expandAndMakeDetails_halfSize_(self, v279, v274, v278, v280);
                                  uint64_t v284 = objc_msgSend_reduce_(self, v281, v278, v282, v283);
                                  v739 = objc_msgSend_expandAndMakeDetails_halfSize_(self, v285, v278, v284, v286);
                                  uint64_t v290 = objc_msgSend_reduce_(self, v287, v284, v288, v289);
                                  v737 = objc_msgSend_expandAndMakeDetails_halfSize_(self, v291, v284, v290, v292);
                                  *(float *)&double v293 = v747;
                                  uint64_t v296 = objc_msgSend_expandAndAddDetailsWithOverdrive_fullSize_contrast_(self, v294, v290, (uint64_t)v737, v295, v293);
                                  *(float *)&double v297 = v752;
                                  v735 = objc_msgSend_expandAndAddDetailsWithOverdrive_fullSize_contrast_(self, v298, v296, (uint64_t)v739, v299, v297);
                                  v748 = objc_msgSend_fineGrainNoise2_tinyBlurFactor_(self, v300, (uint64_t)v751, v301, v302, 0.0);
                                  LODWORD(v304) = *(_DWORD *)buf;
                                  LODWORD(v303) = *(_DWORD *)&buf[4];
                                  v753 = objc_msgSend_blurGradient_lothresh_factor_(self, v305, v274, v306, v307, v303, v304);
                                  *(float *)&double v308 = v246;
                                  *(float *)&double v309 = v724;
                                  v731 = objc_msgSend_expandAndAddDetailsThroughGradientMask2_halfSize_fullSizeDetails_soften_sharpen_(self, v310, (uint64_t)v753, (uint64_t)v735, (uint64_t)v751, v308, v309);
                                  *(float *)&double v311 = v248;
                                  uint64_t v725 = objc_msgSend_addNoise_noise_amount_(self, v312, (uint64_t)v731, (uint64_t)v748, v313, v311);
                                  v720 = (void *)v296;
                                  v721 = (void *)v290;
                                  v723 = (void *)v284;
                                  v733 = (void *)v278;
                                  v715 = (void *)v274;
                                  id v267 = 0;
                                  if (v754) {
                                    objc_msgSend_YAndRGBGatherOpponentColor_cnrRGB_originalY_sushiFactors_crop_lumFactors_(self, v314, v725, (uint64_t)v789, (uint64_t)v727, v788, v728, v714, v713, v711, v712);
                                  }
                                  else {
                                  v435 = objc_msgSend_YAndRGBGather_cnrRGB_sushiFactors_crop_lumFactors_(self, v314, v725, (uint64_t)v789, (uint64_t)v788, v728, v714, v713, v711, v712);
                                  }
                                  v765 = 0;
                                  v766 = 0;
                                  id v762 = 0;
                                  v763 = 0;
                                  v773 = 0;
                                  v775 = 0;
                                  v771 = 0;
                                  v772 = 0;
                                  v770 = 0;
                                  v778 = 0;
                                  v779 = 0;
                                  v436 = 0;
                                  v776 = 0;
                                  v777 = 0;
                                  v437 = (void *)v725;
LABEL_173:
                                  v438 = 0;
                                  v784 = 0;
                                  v787 = 0;
                                  v781 = 0;
                                  v439 = 0;
                                  v440 = 0;
                                  v726 = 0;
                                  goto LABEL_210;
                                case 5:
                                  double v356 = v244;
                                  if (v244 <= 0.003)
                                  {
                                    LODWORD(v356) = 1.0;
                                    v357 = objc_msgSend_gaborFiltersToSmoothedLuminanceAndGradient_smoothAmt_tinyBlurFactor_(self, v252, (uint64_t)v727, v253, v254, v356, 0.0);
                                    v740 = v357;
                                    v741 = 0;
                                  }
                                  else
                                  {
                                    *(float *)&double v356 = v729;
                                    v357 = objc_msgSend_gaborFiltersToLuminanceAndVectorField_thresh_(self, v252, (uint64_t)v727, v253, v254, v356);
                                    v740 = 0;
                                    v741 = v357;
                                  }
                                  id v742 = v357;
                                  uint64_t v743 = objc_msgSend_reduce_(self, v358, (uint64_t)v742, v359, v360);
                                  uint64_t v744 = objc_msgSend_expandAndMakeDetails_halfSize_(self, v361, (uint64_t)v742, v743, v362);
                                  uint64_t v746 = objc_msgSend_reduce_(self, v363, v743, v364, v365);
                                  uint64_t v745 = objc_msgSend_expandAndMakeDetails_halfSize_(self, v366, v743, v746, v367);
                                  uint64_t v371 = objc_msgSend_reduce_(self, v368, v746, v369, v370);
                                  uint64_t v374 = v371;
                                  if ((float)(v722 * 0.25) <= 0.0025)
                                  {
                                    id v267 = 0;
                                    v765 = 0;
                                    v766 = 0;
                                    id v762 = 0;
                                    v763 = 0;
                                  }
                                  else
                                  {
                                    v755 = (void *)v371;
                                    v730 = objc_msgSend_gaborFiltersToVectorField_(self, v372, v371, v371, v373);
                                    *(float *)&double v378 = v750;
                                    float v379 = fminf(fmaxf((float)(v750 * 0.69444) + -1.0, 0.0), 1.0);
                                    LODWORD(v380) = 2.5;
                                    if (v750 <= 2.5)
                                    {
                                      id v441 = v730;
                                      LODWORD(v442) = 0.75;
                                      id v762 = v441;
                                      *(float *)&double v443 = v722 * 0.25;
                                      objc_msgSend_computeLowThreshold_andFactor_withThreshold_andSoftness_(self, v444, (uint64_t)&buf[4], (uint64_t)buf, v445, v443, v442);
                                      uint64_t v449 = objc_msgSend_vectorFieldToDirectionsAndGradients_(self, v446, (uint64_t)v762, v447, v448);
                                      *(float *)&double v450 = v379;
                                      uint64_t v453 = objc_msgSend_smoothDetailsAlongDirections_directions_amount_(self, v451, (uint64_t)v755, v449, v452, v450);
                                      LODWORD(v455) = *(_DWORD *)buf;
                                      LODWORD(v454) = *(_DWORD *)&buf[4];
                                      objc_msgSend_blurGradient_lothresh_factor_(self, v456, v449, v457, v458, v454, v455);
                                      v765 = v430 = (void *)v453;
                                      v763 = (void *)v449;
                                    }
                                    else
                                    {
                                      uint64_t v381 = objc_msgSend_smoothVectorFieldAlongVectors_(self, v375, (uint64_t)v730, v376, v377, v380, v378);
                                      LODWORD(v382) = 0.75;
                                      *(float *)&double v383 = v722 * 0.25;
                                      objc_msgSend_computeLowThreshold_andFactor_withThreshold_andSoftness_(self, v384, (uint64_t)&buf[4], (uint64_t)buf, v385, v383, v382);
                                      v389 = objc_msgSend_vectorFieldToDirectionsAndGradients_(self, v386, v381, v387, v388);
                                      *(float *)&double v390 = v734 * 0.03;
                                      uint64_t v394 = objc_msgSend_directionsToCurvature_threshold_(self, v391, (uint64_t)v389, v392, v393, v390);

                                      LODWORD(v396) = *(_DWORD *)buf;
                                      LODWORD(v395) = *(_DWORD *)&buf[4];
                                      *(float *)&double v397 = v732;
                                      uint64_t v401 = objc_msgSend_blurGradientPlusCurvature_lothresh_factor_cthresh_cfactor_(self, v398, v394, v399, v400, v395, v396, 0.0, v397);
                                      *(float *)&double v402 = v379 * v736;
                                      LODWORD(v403) = 1.0;
                                      LODWORD(v404) = 1.0;
                                      *(float *)&double v405 = v738;
                                      *(float *)&double v406 = v750 * 0.02054;
                                      LODWORD(v407) = 1036831949;
                                      v410 = objc_msgSend_smoothDetailsAlongDirectionsAtScaleWithSharpenAntiBloom_directions_scale_thresh_smooth_sharp_pscale_coringThreshold_maxContrast_(self, v408, (uint64_t)v755, v401, v409, v403, 0.0, v402, v405, v404, v406, v407);
                                      *(float *)&double v411 = v379 * (float)((float)(v736 * 0.66667) + 0.33333);
                                      LODWORD(v412) = 2.0;
                                      LODWORD(v413) = 0.25;
                                      LODWORD(v414) = 2.0;
                                      *(float *)&double v415 = v738 * 0.6;
                                      *(float *)&double v416 = v750 * 0.02054;
                                      LODWORD(v417) = 1036831949;
                                      v420 = objc_msgSend_smoothDetailsAlongDirectionsAtScaleWithSharpenAntiBloom_directions_scale_thresh_smooth_sharp_pscale_coringThreshold_maxContrast_(self, v418, (uint64_t)v410, v401, v419, v412, v413, v411, v415, v414, v416, v417);

                                      *(float *)&double v421 = (float)(v738 * 0.6) * 0.6;
                                      LODWORD(v422) = 4.0;
                                      LODWORD(v423) = 0.5;
                                      LODWORD(v424) = 3.0;
                                      *(float *)&double v425 = v379 * (float)((float)(v736 * 0.33333) + 0.66667);
                                      *(float *)&double v426 = v750 * 0.02054;
                                      LODWORD(v427) = 1036831949;
                                      v430 = objc_msgSend_smoothDetailsAlongDirectionsAtScaleWithSharpenAntiBloom_directions_scale_thresh_smooth_sharp_pscale_coringThreshold_maxContrast_(self, v428, (uint64_t)v420, v401, v429, v422, v423, v425, v421, v424, v426, v427);

                                      v765 = (void *)v401;
                                      id v762 = (id)v381;
                                      v763 = (void *)v394;
                                    }
                                    *(float *)&double v434 = v722 * 0.25;
                                    v459 = objc_msgSend_powerBlurY_threshold_(self, v431, (uint64_t)v755, v432, v433, v434);

                                    v461 = objc_msgSend_compositeThroughGradientMask_fullSize_fullSizeMask_(self, v460, (uint64_t)v459, (uint64_t)v430, (uint64_t)v765);

                                    id v267 = v461;
                                    v766 = v730;
                                    uint64_t v374 = (uint64_t)v267;
                                  }
                                  uint64_t v756 = v374;
                                  uint64_t v462 = objc_msgSend_expandAndMakeDetails_halfSize_(self, v372, v746, v374, v373);
                                  uint64_t v757 = v462;
                                  if ((float)(v722 * 0.5) <= 0.003)
                                  {
                                    *(float *)&double v466 = v747;
                                    uint64_t v758 = objc_msgSend_expandAndAddDetailsWithOverdrive_fullSize_contrast_(self, v463, v756, v462, v465, v466);
                                    uint64_t v491 = 0;
                                    v772 = 0;
                                    v773 = 0;
                                    v770 = 0;
                                    uint64_t v520 = 0;
                                  }
                                  else
                                  {
                                    v716 = objc_msgSend_gaborFiltersToVectorField_(self, v463, v746, v464, v465);
                                    *(float *)&double v470 = v750;
                                    float v708 = fminf(fmaxf((float)(v750 * 1.3889) + -1.0, 0.0), 1.0);
                                    LODWORD(v471) = 1071225242;
                                    if (v750 <= 1.7)
                                    {
                                      id v529 = v716;
                                      LODWORD(v530) = 0.75;
                                      uint64_t v774 = (uint64_t)v529;
                                      *(float *)&double v531 = v722 * 0.5;
                                      objc_msgSend_computeLowThreshold_andFactor_withThreshold_andSoftness_(self, v532, (uint64_t)&buf[4], (uint64_t)buf, v533, v531, v530);
                                      uint64_t v709 = objc_msgSend_vectorFieldToDirectionsAndGradients_(self, v534, v774, v535, v536);
                                      *(float *)&double v537 = v708;
                                      uint64_t v520 = objc_msgSend_smoothDetailsAlongDirections_directions_amount_(self, v538, v757, v709, v539, v537);
                                      LODWORD(v541) = *(_DWORD *)buf;
                                      LODWORD(v540) = *(_DWORD *)&buf[4];
                                      uint64_t v491 = objc_msgSend_blurGradient_lothresh_factor_(self, v542, v709, v543, v544, v540, v541);
                                      uint64_t v472 = v774;
                                    }
                                    else
                                    {
                                      uint64_t v472 = objc_msgSend_smoothVectorFieldAlongVectors_(self, v467, (uint64_t)v716, v468, v469, v471, v470);
                                      LODWORD(v473) = 0.75;
                                      *(float *)&double v474 = v722 * 0.5;
                                      objc_msgSend_computeLowThreshold_andFactor_withThreshold_andSoftness_(self, v475, (uint64_t)&buf[4], (uint64_t)buf, v476, v474, v473);
                                      v480 = objc_msgSend_vectorFieldToDirectionsAndGradients_(self, v477, v472, v478, v479);
                                      *(float *)&double v481 = v734 * 0.1111;
                                      uint64_t v709 = objc_msgSend_directionsToCurvature_threshold_(self, v482, (uint64_t)v480, v483, v484, v481);

                                      LODWORD(v486) = *(_DWORD *)buf;
                                      LODWORD(v485) = *(_DWORD *)&buf[4];
                                      *(float *)&double v487 = v732;
                                      uint64_t v491 = objc_msgSend_blurGradientPlusCurvature_lothresh_factor_cthresh_cfactor_(self, v488, v709, v489, v490, v485, v486, 0.0, v487);
                                      *(float *)&double v492 = v708 * v736;
                                      LODWORD(v493) = 1.0;
                                      LODWORD(v494) = 1.0;
                                      *(float *)&double v495 = v738;
                                      *(float *)&double v496 = v750 * 0.02054;
                                      LODWORD(v497) = 1036831949;
                                      v500 = objc_msgSend_smoothDetailsAlongDirectionsAtScaleWithSharpenAntiBloom_directions_scale_thresh_smooth_sharp_pscale_coringThreshold_maxContrast_(self, v498, v757, v491, v499, v493, 0.0, v492, v495, v494, v496, v497);
                                      *(float *)&double v501 = v708 * (float)((float)(v736 * 0.66667) + 0.33333);
                                      LODWORD(v502) = 2.0;
                                      LODWORD(v503) = 0.25;
                                      LODWORD(v504) = 2.0;
                                      *(float *)&double v505 = v738 * 0.6;
                                      *(float *)&double v506 = v750 * 0.02054;
                                      LODWORD(v507) = 1036831949;
                                      v510 = objc_msgSend_smoothDetailsAlongDirectionsAtScaleWithSharpenAntiBloom_directions_scale_thresh_smooth_sharp_pscale_coringThreshold_maxContrast_(self, v508, (uint64_t)v500, v491, v509, v502, v503, v501, v505, v504, v506, v507);

                                      *(float *)&double v511 = (float)(v738 * 0.6) * 0.6;
                                      LODWORD(v512) = 4.0;
                                      LODWORD(v513) = 0.5;
                                      LODWORD(v514) = 3.0;
                                      *(float *)&double v515 = v708 * (float)((float)(v736 * 0.33333) + 0.66667);
                                      *(float *)&double v516 = v750 * 0.02054;
                                      LODWORD(v517) = 1036831949;
                                      uint64_t v520 = objc_msgSend_smoothDetailsAlongDirectionsAtScaleWithSharpenAntiBloom_directions_scale_thresh_smooth_sharp_pscale_coringThreshold_maxContrast_(self, v518, (uint64_t)v510, v491, v519, v512, v513, v515, v511, v514, v516, v517);
                                    }
                                    *(float *)&double v524 = fminf(v719 / 0.5625, 1.0);
                                    *(float *)&double v522 = 1.0 - v708;
                                    *(float *)&double v523 = v747;
                                    uint64_t v758 = objc_msgSend_expandAndAddDetailsThroughGradientMask_fullSize_fullSizeDetails_fullSizeMask_amount_contrastOverdrive_interpolant_(self, v521, v756, v757, v520, v491, v522, v523, v524, LODWORD(v708));
                                    v772 = (void *)v709;
                                    v773 = (void *)v472;
                                    v770 = v716;
                                  }
                                  v771 = (void *)v520;
                                  v775 = (void *)v491;
                                  if (v722 <= 0.003)
                                  {
                                    v778 = 0;
                                    *(float *)&double v528 = v752;
                                    objc_msgSend_expandAndAddDetailsWithOverdrive_fullSize_contrast_(self, v525, v758, v745, v527, v528);
                                    v779 = 0;
                                    uint64_t v761 = v759 = 0;
                                    v776 = 0;
                                    v777 = 0;
                                  }
                                  else
                                  {
                                    *(float *)&double v528 = v786 * v780;
                                    v749 = objc_msgSend_gaborFiltersToVectorField_(self, v525, v743, v526, v527, v528);
                                    *(float *)&double v548 = v750;
                                    float v710 = fminf(fmaxf((float)(v750 * 2.7778) + -1.0, 0.0), 1.0);
                                    LODWORD(v549) = 1068708659;
                                    if (v750 <= 1.4)
                                    {
                                      id v609 = v749;
                                      LODWORD(v610) = 0.75;
                                      uint64_t v760 = (uint64_t)v609;
                                      *(float *)&double v611 = v786 * v780;
                                      objc_msgSend_computeLowThreshold_andFactor_withThreshold_andSoftness_(self, v612, (uint64_t)&buf[4], (uint64_t)buf, v613, v611, v610);
                                      v594 = objc_msgSend_vectorFieldToDirectionsAndGradients_(self, v614, v760, v615, v616);
                                      *(float *)&double v617 = v710;
                                      uint64_t v603 = objc_msgSend_smoothDetailsAlongDirections_directions_amount_(self, v618, v745, (uint64_t)v594, v619, v617);
                                      LODWORD(v621) = *(_DWORD *)buf;
                                      LODWORD(v620) = *(_DWORD *)&buf[4];
                                      uint64_t v568 = objc_msgSend_blurGradient_lothresh_factor_(self, v622, (uint64_t)v594, v623, v624, v620, v621);
                                      v604 = 0;
                                      uint64_t v717 = v760;
                                    }
                                    else
                                    {
                                      uint64_t v717 = objc_msgSend_smoothVectorFieldAlongVectors_(self, v545, (uint64_t)v749, v546, v547, v549, v548);
                                      LODWORD(v550) = 0.75;
                                      *(float *)&double v551 = v786 * v780;
                                      objc_msgSend_computeLowThreshold_andFactor_withThreshold_andSoftness_(self, v552, (uint64_t)&buf[4], (uint64_t)buf, v553, v551, v550);
                                      v557 = objc_msgSend_vectorFieldToDirectionsAndGradients_(self, v554, v717, v555, v556);
                                      *(float *)&double v558 = v734 * 0.3333;
                                      uint64_t v707 = objc_msgSend_directionsToCurvature_threshold_(self, v559, (uint64_t)v557, v560, v561, v558);

                                      LODWORD(v563) = *(_DWORD *)buf;
                                      LODWORD(v562) = *(_DWORD *)&buf[4];
                                      *(float *)&double v564 = v732;
                                      uint64_t v568 = objc_msgSend_blurGradientPlusCurvature_lothresh_factor_cthresh_cfactor_(self, v565, v707, v566, v567, v562, v563, 0.0, v564);
                                      *(float *)&double v569 = v710 * v736;
                                      LODWORD(v570) = 1.0;
                                      LODWORD(v571) = 1.0;
                                      *(float *)&double v572 = v738;
                                      *(float *)&double v573 = v750 * 0.02054;
                                      v576 = objc_msgSend_smoothDetailsAlongDirectionsAtScaleWithSharpen_directions_scale_thresh_smooth_sharp_pscale_coringThreshold_(self, v574, v745, v568, v575, v570, 0.0, v569, v572, v571, v573);
                                      *(float *)&double v577 = v710 * (float)((float)(v736 * 0.66667) + 0.33333);
                                      LODWORD(v578) = 2.0;
                                      LODWORD(v579) = 0.25;
                                      LODWORD(v580) = 2.0;
                                      *(float *)&double v581 = v738 * 0.6;
                                      *(float *)&double v582 = v750 * 0.02054;
                                      v585 = objc_msgSend_smoothDetailsAlongDirectionsAtScaleWithSharpen_directions_scale_thresh_smooth_sharp_pscale_coringThreshold_(self, v583, (uint64_t)v576, v568, v584, v578, v579, v577, v581, v580, v582);

                                      LODWORD(v586) = 4.0;
                                      LODWORD(v587) = 0.5;
                                      LODWORD(v588) = 3.0;
                                      *(float *)&double v589 = v710 * (float)((float)(v736 * 0.33333) + 0.66667);
                                      *(float *)&double v590 = (float)(v738 * 0.6) * 0.6;
                                      *(float *)&double v591 = v750 * 0.02054;
                                      v594 = objc_msgSend_smoothDetailsAlongDirectionsAtScaleWithSharpen_directions_scale_thresh_smooth_sharp_pscale_coringThreshold_(self, v592, (uint64_t)v585, v568, v593, v586, v587, v589, v590, v588, v591);

                                      *(float *)&double v595 = (float)((float)(v738 * 0.6) * 0.6) * 0.6;
                                      LODWORD(v596) = 8.0;
                                      LODWORD(v597) = 0.75;
                                      LODWORD(v598) = 4.0;
                                      *(float *)&double v599 = v710 * (float)((float)(v736 * 0.0) + 1.0);
                                      *(float *)&double v600 = v750 * 0.02054;
                                      uint64_t v603 = objc_msgSend_smoothDetailsAlongDirectionsAtScaleWithSharpen_directions_scale_thresh_smooth_sharp_pscale_coringThreshold_(self, v601, (uint64_t)v594, v568, v602, v596, v597, v599, v595, v598, v600);
                                      v604 = (void *)v707;
                                    }

                                    *(float *)&double v625 = fminf(v719 / 0.75, 1.0);
                                    *(float *)&double v626 = 1.0 - v710;
                                    *(float *)&double v627 = v752;
                                    objc_msgSend_expandAndAddDetailsThroughGradientMask_fullSize_fullSizeDetails_fullSizeMask_amount_contrastOverdrive_interpolant_(self, v628, v758, v745, v603, v568, v626, v627, v625);
                                    v778 = (void *)v568;
                                    v779 = v604;
                                    uint64_t v761 = v759 = (void *)v717;
                                    v776 = v749;
                                    v777 = (void *)v603;
                                  }
                                  LODWORD(v608) = 0.75;
                                  *(float *)&double v607 = v722 + v722;
                                  objc_msgSend_computeLowThreshold_andFactor_withThreshold_andSoftness_(self, v605, (uint64_t)&buf[4], (uint64_t)buf, v606, v607, v608, v707);
                                  if (v244 <= 0.003)
                                  {
                                    if (v248 <= 0.0)
                                    {
                                      uint64_t v650 = 0;
                                    }
                                    else
                                    {
                                      uint64_t v650 = objc_msgSend_fineGrainNoise2_tinyBlurFactor_(self, v629, v744, v630, v631, 0.0);
                                    }
                                    LODWORD(v633) = *(_DWORD *)buf;
                                    LODWORD(v632) = *(_DWORD *)&buf[4];
                                    uint64_t v651 = objc_msgSend_blurGradient_lothresh_factor_(self, v629, (uint64_t)v742, v630, v631, v632, v633);
                                    *(float *)&double v695 = v246;
                                    *(float *)&double v696 = v724;
                                    v698 = objc_msgSend_expandAndAddDetailsThroughGradientMask2_halfSize_fullSizeDetails_soften_sharpen_(self, v697, v651, v761, v744, v695, v696);
                                    v784 = 0;
                                    v699 = 0;
                                    v726 = 0;
                                  }
                                  else
                                  {
                                    uint64_t v782 = objc_msgSend_smoothVectorFieldAlongVectors_(self, v629, (uint64_t)v742, v630, v631);
                                    v785 = objc_msgSend_vectorFieldToDirectionsAndGradients_(self, v634, v782, v635, v636);
                                    *(float *)&double v637 = v734;
                                    v641 = objc_msgSend_directionsToCurvature_threshold_(self, v638, (uint64_t)v785, v639, v640, v637);

                                    if (v750 > 1.4 && v750 > 3.5 && (*(float *)&double v645 = v722, v722 > 0.003) && v779)
                                    {
                                      uint64_t v648 = objc_msgSend_mergeHalfSizeCurvature_intoFullSizeCurvature_(self, v642, (uint64_t)v779, (uint64_t)v641, v644, v645);

                                      uint64_t v649 = v648;
                                    }
                                    else
                                    {
                                      uint64_t v649 = (uint64_t)v641;
                                    }
                                    v784 = (void *)v649;
                                    LODWORD(v646) = *(_DWORD *)buf;
                                    LODWORD(v645) = *(_DWORD *)&buf[4];
                                    *(float *)&double v647 = v732;
                                    uint64_t v651 = objc_msgSend_blurGradientPlusCurvature_lothresh_factor_cthresh_cfactor_(self, v642, v649, v643, v644, v645, v646, 0.0, v647);
                                    float v652 = fminf(fmaxf((float)(v750 * 5.5556) + -1.0, 0.0), 1.0);
                                    *(float *)&double v653 = v652 * v736;
                                    LODWORD(v654) = 1.0;
                                    LODWORD(v655) = 1.0;
                                    *(float *)&double v656 = v738;
                                    *(float *)&double v657 = v750 * 0.02054;
                                    v660 = objc_msgSend_smoothDetailsAlongDirectionsAtScaleWithSharpen_directions_scale_thresh_smooth_sharp_pscale_coringThreshold_(self, v658, v744, v651, v659, v654, 0.0, v653, v656, v655, v657);
                                    *(float *)&double v661 = v652 * (float)((float)(v736 * 0.66667) + 0.33333);
                                    LODWORD(v662) = 2.0;
                                    LODWORD(v663) = 0.25;
                                    LODWORD(v664) = 2.0;
                                    *(float *)&double v665 = v738 * 0.6;
                                    *(float *)&double v666 = v750 * 0.02054;
                                    v669 = objc_msgSend_smoothDetailsAlongDirectionsAtScaleWithSharpen_directions_scale_thresh_smooth_sharp_pscale_coringThreshold_(self, v667, (uint64_t)v660, v651, v668, v662, v663, v661, v665, v664, v666);

                                    LODWORD(v670) = 4.0;
                                    LODWORD(v671) = 0.5;
                                    LODWORD(v672) = 3.0;
                                    *(float *)&double v673 = v652 * (float)((float)(v736 * 0.33333) + 0.66667);
                                    *(float *)&double v674 = (float)(v738 * 0.6) * 0.6;
                                    *(float *)&double v675 = v750 * 0.02054;
                                    v678 = objc_msgSend_smoothDetailsAlongDirectionsAtScaleWithSharpen_directions_scale_thresh_smooth_sharp_pscale_coringThreshold_(self, v676, (uint64_t)v669, v651, v677, v670, v671, v673, v674, v672, v675);

                                    *(float *)&double v679 = (float)((float)(v738 * 0.6) * 0.6) * 0.6;
                                    LODWORD(v680) = 8.0;
                                    LODWORD(v681) = 0.75;
                                    LODWORD(v682) = 4.0;
                                    *(float *)&double v683 = v652 * (float)((float)(v736 * 0.0) + 1.0);
                                    *(float *)&double v684 = v750 * 0.02054;
                                    uint64_t v687 = objc_msgSend_smoothDetailsAlongDirectionsAtScaleWithSharpen_directions_scale_thresh_smooth_sharp_pscale_coringThreshold_(self, v685, (uint64_t)v678, v651, v686, v680, v681, v683, v679, v682, v684);

                                    if (v248 <= 0.0)
                                    {
                                      uint64_t v650 = 0;
                                      *(float *)&double v692 = v719;
                                    }
                                    else
                                    {
                                      uint64_t v694 = objc_msgSend_fineGrainNoise2_tinyBlurFactor_(self, v688, v744, v689, v690, 0.0);
                                      *(float *)&double v692 = v719;
                                      uint64_t v650 = v694;
                                    }
                                    *(float *)&double v693 = 1.0 - *(float *)&v692;
                                    *(float *)&double v691 = v652;
                                    *(float *)&double v692 = v724;
                                    v698 = objc_msgSend_expandAndAddDetailsThroughGradientMask3_fullSize_fullSizeDetails_fullSizeMask_amount_sharpen_interpolant_(self, v688, v761, v744, v687, v651, v691, v692, v693);
                                    v726 = (void *)v687;
                                    v699 = (void *)v782;
                                  }
                                  id v700 = v698;
                                  v781 = v699;
                                  v787 = (void *)v651;
                                  id v767 = v700;
                                  v764 = (void *)v650;
                                  if (v248 <= 0.0)
                                  {
                                    id v705 = v700;
                                  }
                                  else
                                  {
                                    *(float *)&double v703 = v248;
                                    objc_msgSend_addNoise_noise_amount_(self, v701, (uint64_t)v700, v650, v702, v703);
                                    id v705 = (id)objc_claimAutoreleasedReturnValue();
                                  }
                                  id v769 = v705;
                                  if (v754) {
                                    objc_msgSend_YAndRGBGatherOpponentColor_cnrRGB_originalY_sushiFactors_crop_lumFactors_(self, v704, (uint64_t)v705, (uint64_t)v789, (uint64_t)v727, v788, v728, v714, v713, v711, v712);
                                  }
                                  else {
                                  v435 = objc_msgSend_YAndRGBGather_cnrRGB_sushiFactors_crop_lumFactors_(self, v704, (uint64_t)v705, (uint64_t)v789, (uint64_t)v788, v728, v714, v713, v711, v712);
                                  }
                                  v720 = (void *)v758;
                                  v721 = (void *)v756;
                                  v723 = (void *)v746;
                                  v737 = (void *)v757;
                                  v739 = (void *)v745;
                                  v436 = v759;
                                  v439 = v742;
                                  v733 = (void *)v743;
                                  v735 = (void *)v761;
                                  v438 = v767;
                                  v731 = v767;
                                  v437 = v769;
                                  v753 = 0;
                                  v440 = v741;
                                  v715 = v740;
                                  v748 = v764;
                                  v751 = (void *)v744;
LABEL_210:
                                  objc_msgSend_outputBoost_(self, v271, (uint64_t)v435, v272, v273);
                                  break;
                                default:
                                  v435 = 0;
                                  id v267 = 0;
                                  v765 = 0;
                                  v766 = 0;
                                  id v762 = 0;
                                  v763 = 0;
                                  v720 = 0;
                                  v721 = 0;
                                  v773 = 0;
                                  v775 = 0;
                                  v771 = 0;
                                  v772 = 0;
                                  v770 = 0;
                                  v737 = 0;
                                  v739 = 0;
                                  v723 = 0;
                                  v778 = 0;
                                  v779 = 0;
                                  v436 = 0;
                                  v776 = 0;
                                  v777 = 0;
                                  v733 = 0;
                                  v735 = 0;
                                  v437 = 0;
                                  v438 = 0;
                                  v731 = 0;
                                  v784 = 0;
                                  v787 = 0;
                                  v781 = 0;
                                  v748 = 0;
                                  v751 = 0;
                                  v753 = 0;
                                  v439 = 0;
                                  v440 = 0;
                                  v715 = 0;
                                  v726 = 0;
                                  objc_msgSend_outputBoost_(self, v252, 0, v253, v254);
                                  break;
                              }
                              double v32 = (CIImage *)(id)objc_claimAutoreleasedReturnValue();

                              v149 = v788;
                              goto LABEL_111;
                            }
                            uint64_t v165 = objc_msgSend_viewRGB_sushiFactors_crop_(self, v161, (uint64_t)v789, (uint64_t)v788, v164, v142, v144, v146, v148);
                          }
                          double v32 = (CIImage *)v165;
LABEL_111:

LABEL_112:
                          v35[2](v35);

                          goto LABEL_213;
                        }
                        float v105 = (float)(v51 + -3.8895) / 2.0372;
                        float v106 = 0.07;
                        float v107 = 0.01;
                      }
                      else
                      {
                        float v105 = (float)(v51 + -2.5961) / 1.2934;
                        float v106 = 0.051;
                        float v107 = 0.019;
                      }
                    }
                    else
                    {
                      float v105 = (float)(v51 + -1.7695) / 0.8266;
                      float v106 = 0.05;
                      float v107 = 0.001;
                    }
                  }
                  else
                  {
                    float v105 = (float)(v51 + -1.5949) / 0.1746;
                    float v106 = 0.038;
                    float v107 = 0.012;
                  }
                }
                else
                {
                  float v105 = (float)(v51 + -1.2804) / 0.3145;
                  float v106 = 0.0308;
                  float v107 = 0.0072;
                }
              }
              else
              {
                float v105 = (float)(v51 + -1.135) / 0.1454;
                float v106 = 0.03;
                float v107 = 0.0008;
              }
              float v104 = v106 + (float)(v105 * v107);
              goto LABEL_62;
            }
            float v101 = (float)(v51 + -1.3487) / 0.0817;
            float v98 = v101 + 10.0;
            float v734 = (float)(v101 * 0.002) + 0.026;
            float v102 = 0.355;
            float v103 = 0.0;
LABEL_37:
            float v99 = v102 + (float)(v101 * v103);
            float v100 = 1.0;
            goto LABEL_38;
          }
          float v101 = (float)(v51 + -1.1953) / 0.1534;
          float v98 = (float)(v101 * 2.0) + 8.0;
          float v734 = (float)(v101 * 0.008) + 0.02;
          float v102 = 0.368;
        }
        else
        {
          float v101 = (float)(v51 + -1.0619) / 0.1334;
          float v98 = v101 + 7.0;
          float v734 = (float)(v101 * 0.0087) + 0.0113;
          float v102 = 0.381;
        }
        float v103 = -0.013;
        goto LABEL_37;
      }
      float v85 = v92 + (float)((float)(v92 - v92) * v93);
      float v74 = v93 * v92;
    }
    float v747 = 0.0;
    goto LABEL_30;
  }
  double v32 = 0;
LABEL_213:

  return v32;
}

- (id)image:(id)a3 croppedTo:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v8 = a3;
  uint64_t v9 = (void *)MEMORY[0x1E4F1E040];
  uint64_t v14 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v10, v11, v12, v13, x, y, width, height);
  uint64_t v17 = objc_msgSend_filterWithName_keysAndValues_(v9, v15, @"CICrop", @"inputImage", v16, v8, @"inputRectangle", v14, 0);

  uint64_t v21 = objc_msgSend_valueForKey_(v17, v18, @"outputImage", v19, v20);

  return v21;
}

- (BOOL)isBayerGreenAlignedforImage:(id)a3 andPattern:(int)a4
{
  id v5 = a3;
  objc_msgSend_extent(v5, v6, v7, v8, v9);
  CGRect v15 = CGRectIntegral(v14);
  int v10 = ~(int)v15.origin.x;
  if (a4 == 1633771873 || a4 == 1229539657) {
    LOBYTE(v10) = v10 + 1;
  }
  BOOL v12 = (v10 + ~(int)v15.origin.y) & 1;

  return v12;
}

- (id)outputCNR:(id)a3 E0:(CGRect)a4 E1:(CGRect)a5
{
  v1176[2] = *MEMORY[0x1E4F143B8];
  id v1161 = a3;
  objc_msgSend_floatValue(self->inputScaleFactor, v6, v7, v8, v9);
  float v11 = v10;
  int v16 = objc_msgSend_intValue(self->inputISO, v12, v13, v14, v15);
  v1160 = objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v17, @"ISOList", v18, v19);
  uint64_t v27 = objc_msgSend_count(v1160, v20, v21, v22, v23);
  float v1130 = v11;
  if (v27)
  {
    uint64_t v28 = 0;
    while (1)
    {
      uint64_t v29 = objc_msgSend_objectAtIndexedSubscript_(v1160, v24, v28, v25, v26);
      int v34 = objc_msgSend_intValue(v29, v30, v31, v32, v33);

      BOOL v35 = v16 != v34;
      if (v16 == v34)
      {
        float v36 = 0.0;
        goto LABEL_10;
      }
      if (v16 < v34) {
        break;
      }
      if (v27 == ++v28) {
        goto LABEL_6;
      }
    }
    if (!v28)
    {
      BOOL v35 = 0;
      float v36 = 0.0;
      goto LABEL_12;
    }
    uint64_t v37 = objc_msgSend_objectAtIndexedSubscript_(v1160, v24, --v28, v25, v26);
    int v42 = objc_msgSend_intValue(v37, v38, v39, v40, v41);

    float v36 = (float)(v16 - v42) / (float)(v34 - v42);
LABEL_10:
    if (v28 != 100000) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_6:
    BOOL v35 = 0;
    float v36 = 0.0;
  }
  uint64_t v28 = v27 - 1;
LABEL_12:
  v1129 = self->inputTrimParameters;
  uint64_t v46 = objc_msgSend_objectForKeyedSubscript_(v1129, v43, @"color", v44, v45);
  float v50 = objc_msgSend_objectAtIndexedSubscript_(v46, v47, 0, v48, v49);
  objc_msgSend_floatValue(v50, v51, v52, v53, v54);
  float v1145 = v55;

  uint64_t v59 = objc_msgSend_objectAtIndexedSubscript_(v46, v56, 1, v57, v58);
  objc_msgSend_floatValue(v59, v60, v61, v62, v63);
  float v1140 = v64;

  objc_msgSend_adjustedRNAmount(self, v65, v66, v67, v68);
  float v1122 = v69;
  objc_msgSend_floatValue(self->inputCNRAmount, v70, v71, v72, v73);
  float v1127 = v74;
  uint64_t v78 = objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v75, @"FCNRa", v76, v77);
  uint64_t v82 = objc_msgSend_objectAtIndexedSubscript_(v78, v79, v28, v80, v81);
  objc_msgSend_floatValue(v82, v83, v84, v85, v86);
  float v1153 = v87;

  if (v35)
  {
    unsigned int v91 = objc_msgSend_objectAtIndexedSubscript_(v78, v88, v28 + 1, v89, v90);
    objc_msgSend_floatValue(v91, v92, v93, v94, v95);
    float v97 = v96;

    float v1153 = v1153 + (float)((float)(v97 - v1153) * v36);
  }
  float v98 = objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v88, @"FCNRb", v89, v90);

  float v102 = objc_msgSend_objectAtIndexedSubscript_(v98, v99, v28, v100, v101);
  objc_msgSend_floatValue(v102, v103, v104, v105, v106);
  float v1158 = v107;

  if (v35)
  {
    float v111 = objc_msgSend_objectAtIndexedSubscript_(v98, v108, v28 + 1, v109, v110);
    objc_msgSend_floatValue(v111, v112, v113, v114, v115);
    float v117 = v116;

    float v1158 = v1158 + (float)((float)(v117 - v1158) * v36);
  }
  uint64_t v118 = objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v108, @"FCNRc", v109, v110);

  double v122 = objc_msgSend_objectAtIndexedSubscript_(v118, v119, v28, v120, v121);
  objc_msgSend_floatValue(v122, v123, v124, v125, v126);
  float v1151 = v127;

  if (v35)
  {
    uint64_t v131 = objc_msgSend_objectAtIndexedSubscript_(v118, v128, v28 + 1, v129, v130);
    objc_msgSend_floatValue(v131, v132, v133, v134, v135);
    float v137 = v136;

    float v1151 = v1151 + (float)((float)(v137 - v1151) * v36);
  }
  uint64_t v138 = objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v128, @"FCNDa", v129, v130);

  double v142 = objc_msgSend_objectAtIndexedSubscript_(v138, v139, v28, v140, v141);
  objc_msgSend_floatValue(v142, v143, v144, v145, v146);
  float v1148 = v147;

  if (v35)
  {
    uint64_t v151 = objc_msgSend_objectAtIndexedSubscript_(v138, v148, v28 + 1, v149, v150);
    objc_msgSend_floatValue(v151, v152, v153, v154, v155);
    float v157 = v156;

    float v1148 = v1148 + (float)((float)(v157 - v1148) * v36);
  }
  uint64_t v158 = objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v148, @"FCNDb", v149, v150);

  uint64_t v162 = objc_msgSend_objectAtIndexedSubscript_(v158, v159, v28, v160, v161);
  objc_msgSend_floatValue(v162, v163, v164, v165, v166);
  float v1155 = v167;

  if (v35)
  {
    uint64_t v171 = objc_msgSend_objectAtIndexedSubscript_(v158, v168, v28 + 1, v169, v170);
    objc_msgSend_floatValue(v171, v172, v173, v174, v175);
    float v177 = v176;

    float v1155 = v1155 + (float)((float)(v177 - v1155) * v36);
  }
  double v178 = objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v168, @"FCNDc", v169, v170);

  uint64_t v182 = objc_msgSend_objectAtIndexedSubscript_(v178, v179, v28, v180, v181);
  objc_msgSend_floatValue(v182, v183, v184, v185, v186);
  float v1146 = v187;

  if (v35)
  {
    double v191 = objc_msgSend_objectAtIndexedSubscript_(v178, v188, v28 + 1, v189, v190);
    objc_msgSend_floatValue(v191, v192, v193, v194, v195);
    float v197 = v196;

    float v1146 = v1146 + (float)((float)(v197 - v1146) * v36);
  }
  double v198 = objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v188, @"HCNRa", v189, v190);

  uint64_t v202 = objc_msgSend_objectAtIndexedSubscript_(v198, v199, v28, v200, v201);
  objc_msgSend_floatValue(v202, v203, v204, v205, v206);
  float v1144 = v207;

  if (v35)
  {
    uint64_t v211 = objc_msgSend_objectAtIndexedSubscript_(v198, v208, v28 + 1, v209, v210);
    objc_msgSend_floatValue(v211, v212, v213, v214, v215);
    float v217 = v216;

    float v1144 = v1144 + (float)((float)(v217 - v1144) * v36);
  }
  uint64_t v218 = objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v208, @"HCNRb", v209, v210);

  v222 = objc_msgSend_objectAtIndexedSubscript_(v218, v219, v28, v220, v221);
  objc_msgSend_floatValue(v222, v223, v224, v225, v226);
  float v228 = v227;

  if (v35)
  {
    uint64_t v232 = objc_msgSend_objectAtIndexedSubscript_(v218, v229, v28 + 1, v230, v231);
    objc_msgSend_floatValue(v232, v233, v234, v235, v236);
    float v238 = v237;

    float v228 = v228 + (float)((float)(v238 - v228) * v36);
  }
  v239 = objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v229, @"HCNRc", v230, v231);

  float v243 = objc_msgSend_objectAtIndexedSubscript_(v239, v240, v28, v241, v242);
  objc_msgSend_floatValue(v243, v244, v245, v246, v247);
  float v1143 = v248;

  if (v35)
  {
    v252 = objc_msgSend_objectAtIndexedSubscript_(v239, v249, v28 + 1, v250, v251);
    objc_msgSend_floatValue(v252, v253, v254, v255, v256);
    float v258 = v257;

    float v1143 = v1143 + (float)((float)(v258 - v1143) * v36);
  }
  uint64_t v259 = objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v249, @"HCNDa", v250, v251);

  v263 = objc_msgSend_objectAtIndexedSubscript_(v259, v260, v28, v261, v262);
  objc_msgSend_floatValue(v263, v264, v265, v266, v267);
  float v1142 = v268;

  if (v35)
  {
    uint64_t v272 = objc_msgSend_objectAtIndexedSubscript_(v259, v269, v28 + 1, v270, v271);
    objc_msgSend_floatValue(v272, v273, v274, v275, v276);
    float v278 = v277;

    float v1142 = v1142 + (float)((float)(v278 - v1142) * v36);
  }
  v279 = objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v269, @"HCNDb", v270, v271);

  uint64_t v283 = objc_msgSend_objectAtIndexedSubscript_(v279, v280, v28, v281, v282);
  objc_msgSend_floatValue(v283, v284, v285, v286, v287);
  float v289 = v288;

  if (v35)
  {
    double v293 = objc_msgSend_objectAtIndexedSubscript_(v279, v290, v28 + 1, v291, v292);
    objc_msgSend_floatValue(v293, v294, v295, v296, v297);
    float v299 = v298;

    float v289 = v289 + (float)((float)(v299 - v289) * v36);
  }
  v300 = objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v290, @"HCNDc", v291, v292);

  double v304 = objc_msgSend_objectAtIndexedSubscript_(v300, v301, v28, v302, v303);
  objc_msgSend_floatValue(v304, v305, v306, v307, v308);
  float v1141 = v309;

  if (v35)
  {
    uint64_t v313 = objc_msgSend_objectAtIndexedSubscript_(v300, v310, v28 + 1, v311, v312);
    objc_msgSend_floatValue(v313, v314, v315, v316, v317);
    float v319 = v318;

    float v1141 = v1141 + (float)((float)(v319 - v1141) * v36);
  }
  double v320 = objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v310, @"QCNRa", v311, v312);

  uint64_t v324 = objc_msgSend_objectAtIndexedSubscript_(v320, v321, v28, v322, v323);
  objc_msgSend_floatValue(v324, v325, v326, v327, v328);
  float v1139 = v329;

  if (v35)
  {
    uint64_t v333 = objc_msgSend_objectAtIndexedSubscript_(v320, v330, v28 + 1, v331, v332);
    objc_msgSend_floatValue(v333, v334, v335, v336, v337);
    float v339 = v338;

    float v1139 = v1139 + (float)((float)(v339 - v1139) * v36);
  }
  uint64_t v340 = objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v330, @"QCNRb", v331, v332);

  uint64_t v344 = objc_msgSend_objectAtIndexedSubscript_(v340, v341, v28, v342, v343);
  objc_msgSend_floatValue(v344, v345, v346, v347, v348);
  float v350 = v349;

  if (v35)
  {
    id v354 = objc_msgSend_objectAtIndexedSubscript_(v340, v351, v28 + 1, v352, v353);
    objc_msgSend_floatValue(v354, v355, v356, v357, v358);
    float v360 = v359;

    float v350 = v350 + (float)((float)(v360 - v350) * v36);
  }
  v361 = objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v351, @"QCNRc", v352, v353);

  uint64_t v365 = objc_msgSend_objectAtIndexedSubscript_(v361, v362, v28, v363, v364);
  objc_msgSend_floatValue(v365, v366, v367, v368, v369);
  float v1138 = v370;

  if (v35)
  {
    uint64_t v374 = objc_msgSend_objectAtIndexedSubscript_(v361, v371, v28 + 1, v372, v373);
    objc_msgSend_floatValue(v374, v375, v376, v377, v378);
    float v380 = v379;

    float v1138 = v1138 + (float)((float)(v380 - v1138) * v36);
  }
  uint64_t v381 = objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v371, @"QCNDa", v372, v373);

  uint64_t v385 = objc_msgSend_objectAtIndexedSubscript_(v381, v382, v28, v383, v384);
  objc_msgSend_floatValue(v385, v386, v387, v388, v389);
  float v1137 = v390;

  if (v35)
  {
    uint64_t v394 = objc_msgSend_objectAtIndexedSubscript_(v381, v391, v28 + 1, v392, v393);
    objc_msgSend_floatValue(v394, v395, v396, v397, v398);
    float v400 = v399;

    float v1137 = v1137 + (float)((float)(v400 - v1137) * v36);
  }
  uint64_t v401 = objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v391, @"QCNDb", v392, v393);

  double v405 = objc_msgSend_objectAtIndexedSubscript_(v401, v402, v28, v403, v404);
  objc_msgSend_floatValue(v405, v406, v407, v408, v409);
  float v411 = v410;

  if (v35)
  {
    double v415 = objc_msgSend_objectAtIndexedSubscript_(v401, v412, v28 + 1, v413, v414);
    objc_msgSend_floatValue(v415, v416, v417, v418, v419);
    float v421 = v420;

    float v411 = v411 + (float)((float)(v421 - v411) * v36);
  }
  double v422 = objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v412, @"QCNDc", v413, v414);

  double v426 = objc_msgSend_objectAtIndexedSubscript_(v422, v423, v28, v424, v425);
  objc_msgSend_floatValue(v426, v427, v428, v429, v430);
  float v1136 = v431;

  if (v35)
  {
    v435 = objc_msgSend_objectAtIndexedSubscript_(v422, v432, v28 + 1, v433, v434);
    objc_msgSend_floatValue(v435, v436, v437, v438, v439);
    float v441 = v440;

    float v1136 = v1136 + (float)((float)(v441 - v1136) * v36);
  }
  double v442 = objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v432, @"ECNRa", v433, v434);

  v446 = objc_msgSend_objectAtIndexedSubscript_(v442, v443, v28, v444, v445);
  objc_msgSend_floatValue(v446, v447, v448, v449, v450);
  float v1135 = v451;

  if (v35)
  {
    double v455 = objc_msgSend_objectAtIndexedSubscript_(v442, v452, v28 + 1, v453, v454);
    objc_msgSend_floatValue(v455, v456, v457, v458, v459);
    float v461 = v460;

    float v1135 = v1135 + (float)((float)(v461 - v1135) * v36);
  }
  uint64_t v462 = objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v452, @"ECNRb", v453, v454);

  double v466 = objc_msgSend_objectAtIndexedSubscript_(v462, v463, v28, v464, v465);
  objc_msgSend_floatValue(v466, v467, v468, v469, v470);
  float v472 = v471;

  if (v35)
  {
    uint64_t v476 = objc_msgSend_objectAtIndexedSubscript_(v462, v473, v28 + 1, v474, v475);
    objc_msgSend_floatValue(v476, v477, v478, v479, v480);
    float v482 = v481;

    float v472 = v472 + (float)((float)(v482 - v472) * v36);
  }
  uint64_t v483 = objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v473, @"ECNRc", v474, v475);

  double v487 = objc_msgSend_objectAtIndexedSubscript_(v483, v484, v28, v485, v486);
  objc_msgSend_floatValue(v487, v488, v489, v490, v491);
  float v1134 = v492;

  if (v35)
  {
    double v496 = objc_msgSend_objectAtIndexedSubscript_(v483, v493, v28 + 1, v494, v495);
    objc_msgSend_floatValue(v496, v497, v498, v499, v500);
    float v502 = v501;

    float v1134 = v1134 + (float)((float)(v502 - v1134) * v36);
  }
  double v503 = objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v493, @"ECNDa", v494, v495);

  double v507 = objc_msgSend_objectAtIndexedSubscript_(v503, v504, v28, v505, v506);
  objc_msgSend_floatValue(v507, v508, v509, v510, v511);
  float v1133 = v512;

  if (v35)
  {
    double v516 = objc_msgSend_objectAtIndexedSubscript_(v503, v513, v28 + 1, v514, v515);
    objc_msgSend_floatValue(v516, v517, v518, v519, v520);
    float v522 = v521;

    float v1133 = v1133 + (float)((float)(v522 - v1133) * v36);
  }
  double v523 = objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v513, @"ECNDb", v514, v515);

  uint64_t v527 = objc_msgSend_objectAtIndexedSubscript_(v523, v524, v28, v525, v526);
  objc_msgSend_floatValue(v527, v528, v529, v530, v531);
  float v533 = v532;

  if (v35)
  {
    double v537 = objc_msgSend_objectAtIndexedSubscript_(v523, v534, v28 + 1, v535, v536);
    objc_msgSend_floatValue(v537, v538, v539, v540, v541);
    float v543 = v542;

    float v533 = v533 + (float)((float)(v543 - v533) * v36);
  }
  uint64_t v544 = objc_msgSend_objectForKeyedSubscript_(self->inputISODictionary, v534, @"ECNDc", v535, v536);

  double v548 = objc_msgSend_objectAtIndexedSubscript_(v544, v545, v28, v546, v547);
  objc_msgSend_floatValue(v548, v549, v550, v551, v552);
  float v1132 = v553;

  if (v35)
  {
    v557 = objc_msgSend_objectAtIndexedSubscript_(v544, v554, v28 + 1, v555, v556);
    objc_msgSend_floatValue(v557, v558, v559, v560, v561);
    float v563 = v562;

    float v1132 = v1132 + (float)((float)(v563 - v1132) * v36);
  }
  v1125 = v46;
  v1126 = v544;
  float v1121 = (float)(v1140 * 0.33333) + (float)(v1145 * 0.66667);
  float v1117 = (float)(v1140 * 0.66667) + (float)(v1145 * 0.33333);
  float v564 = v472 + (float)(v1140 * v533);
  float v565 = fminf(fmaxf(v1130, 0.0), 1.0) * (float)(v1127 + v1127);
  float v566 = v565 * v564;
  float v1156 = v565 * (float)(v1158 + (float)(v1145 * v1155));
  float v1120 = v565 * (float)(v228 + (float)(v1121 * v289));
  int v567 = v1120 >= 0.00001 && v1156 >= 0.00001;
  float v1118 = v565 * (float)(v350 + (float)(v1117 * v411));
  if (v1118 >= 0.00001) {
    int v568 = v567;
  }
  else {
    int v568 = 0;
  }
  int v1128 = v568;
  if (v566 < 0.00001) {
    int v568 = 0;
  }
  int v1123 = v568;
  double v569 = self->inputDespeckleParameters;
  double v573 = objc_msgSend_objectForKeyedSubscript_(v569, v570, @"enabled", v571, v572);
  int v1119 = objc_msgSend_BOOLValue(v573, v574, v575, v576, v577);

  double v581 = objc_msgSend_objectForKeyedSubscript_(v569, v578, @"SCSEnabled", v579, v580);
  unsigned int v1116 = objc_msgSend_BOOLValue(v581, v582, v583, v584, v585);

  double v589 = objc_msgSend_objectForKeyedSubscript_(v569, v586, @"SCSLuminanceThreshold", v587, v588);
  objc_msgSend_floatValue(v589, v590, v591, v592, v593);
  float v1115 = v594;

  double v598 = objc_msgSend_objectForKeyedSubscript_(v569, v595, @"SCSSparkleThreshold", v596, v597);
  objc_msgSend_floatValue(v598, v599, v600, v601, v602);
  float v1114 = v603;

  double v607 = objc_msgSend_objectForKeyedSubscript_(v569, v604, @"NCSEnabled", v605, v606);
  unsigned int v1113 = objc_msgSend_BOOLValue(v607, v608, v609, v610, v611);

  uint64_t v615 = objc_msgSend_objectForKeyedSubscript_(v569, v612, @"NCSSaturationThreshold", v613, v614);
  objc_msgSend_floatValue(v615, v616, v617, v618, v619);
  float v1112 = v620;

  uint64_t v624 = objc_msgSend_objectForKeyedSubscript_(v569, v621, @"NCSRedBluePop", v622, v623);
  objc_msgSend_floatValue(v624, v625, v626, v627, v628);
  float v1111 = v629;

  double v633 = objc_msgSend_objectForKeyedSubscript_(v569, v630, @"NCSContrastThreshold", v631, v632);
  objc_msgSend_floatValue(v633, v634, v635, v636, v637);
  float v1110 = v638;

  v642 = objc_msgSend_objectForKeyedSubscript_(v569, v639, @"NCSCountThreshold", v640, v641);
  int v1109 = objc_msgSend_intValue(v642, v643, v644, v645, v646);

  uint64_t v650 = objc_msgSend_objectForKeyedSubscript_(v569, v647, @"BCSEnabled", v648, v649);
  unsigned int v1108 = objc_msgSend_BOOLValue(v650, v651, v652, v653, v654);

  v658 = objc_msgSend_objectForKeyedSubscript_(v569, v655, @"BCSRedPop", v656, v657);
  objc_msgSend_floatValue(v658, v659, v660, v661, v662);
  float v1107 = v663;

  v667 = objc_msgSend_objectForKeyedSubscript_(v569, v664, @"BCSBlueness", v665, v666);
  objc_msgSend_floatValue(v667, v668, v669, v670, v671);
  float v1106 = v672;

  v676 = objc_msgSend_objectForKeyedSubscript_(v569, v673, @"BCSContrastThreshold", v674, v675);
  objc_msgSend_floatValue(v676, v677, v678, v679, v680);
  float v1105 = v681;

  objc_msgSend_X(self->inputNeutralFactors, v682, v683, v684, v685);
  double v687 = v686;
  objc_msgSend_Y(self->inputNeutralFactors, v688, v689, v690, v691);
  double v693 = v692;
  objc_msgSend_Z(self->inputNeutralFactors, v694, v695, v696, v697);
  float v698 = v687;
  float v699 = v693;
  float v701 = v700;
  v706 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v702, v703, v704, v705, v698, v699, v701, 1.0);
  uint64_t v711 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v707, v708, v709, v710, (float)(1.0 / v698), (float)(1.0 / v699), (float)(1.0 / v701), 1.0);
  CGAffineTransformMakeScale(&v1165, 0.5, 0.5);
  CGAffineTransformMakeScale(&v1164, 2.0, 2.0);
  objc_msgSend_floatValue(self->inputMoireRadius, v712, v713, v714, v715);
  float v717 = v716;
  objc_msgSend_floatValue(self->inputMoireAmount, v718, v719, v720, v721);
  v1159 = (void *)v711;
  float v1131 = v726 * 0.04;
  if ((float)(v726 * 0.04) == 0.0) {
    float v727 = 0.0;
  }
  else {
    float v727 = v717;
  }
  if (v727 <= 0.0)
  {
    int v729 = objc_msgSend_BOOLValue(self->inputShowHF, v722, v723, v724, v725);
    int v728 = v729;
    *(float *)&double v730 = v1156;
    if (v1156 >= 0.00001) {
      char v731 = 1;
    }
    else {
      char v731 = v729;
    }
    if ((v731 & 1) == 0)
    {
      v879 = objc_msgSend_kernelWithName_(V8CNRKernels, v722, @"multiplyByNeutralFactors", v724, v725, v730);
      objc_msgSend_extent(v1161, v880, v881, v882, v883);
      double v885 = v884;
      double v887 = v886;
      double v889 = v888;
      double v891 = v890;
      v1176[0] = v1161;
      v1176[1] = v706;
      v894 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v892, (uint64_t)v1176, 2, v893);
      float v783 = objc_msgSend_applyWithExtent_arguments_(v879, v895, (uint64_t)v894, v896, v897, v885, v887, v889, v891);

      v784 = 0;
      goto LABEL_142;
    }
  }
  else
  {
    int v728 = 1;
  }
  float v1104 = v566;
  inputImage = self->inputImage;
  uint64_t v733 = objc_msgSend_intValue(self->inputSensorPattern, v722, v723, v724, v725);
  int isBayerGreenAlignedforImage_andPattern = objc_msgSend_isBayerGreenAlignedforImage_andPattern_(self, v734, (uint64_t)inputImage, v733, v735);
  float v741 = v565 * (float)(v1151 + (float)(v1145 * v1146));
  float v1147 = v565 * (float)(v1153 + (float)(v1145 * v1148));
  float v1149 = v741;
  if (isBayerGreenAlignedforImage_andPattern) {
    float v742 = -1.0;
  }
  else {
    float v742 = 1.0;
  }
  if (v727 > 2.0) {
    char v743 = 1;
  }
  else {
    char v743 = v567;
  }
  float v1152 = v699 / v701;
  float v1154 = v699 / v698;
  if (v743 & 1) != 0 || (objc_msgSend_BOOLValue(self->inputShowHF, v737, v738, v739, v740))
  {
    if (v728) {
      objc_msgSend_stringWithFormat_(NSString, v737, @"%s%s", v739, v740, "extractHRGB", "HF");
    }
    else {
    uint64_t v744 = objc_msgSend_stringWithFormat_(NSString, v737, @"%s%s", v739, v740, "extractHRGB", "");
    }
    v748 = objc_msgSend_kernelWithName_(V8CNRKernels, v745, (uint64_t)v744, v746, v747);

    objc_msgSend_extent(v1161, v749, v750, v751, v752);
    CGAffineTransform v1163 = v1165;
    CGRect v1179 = CGRectApplyAffineTransform(v1178, &v1163);
    double x = v1179.origin.x;
    double y = v1179.origin.y;
    double width = v1179.size.width;
    double height = v1179.size.height;
    v1173[0] = v1161;
    v1173[1] = v706;
    uint64_t v757 = (void *)MEMORY[0x1E4F1E080];
    objc_msgSend_floatValue(self->inputHighFrequencyFactor, v758, v759, v760, v761);
    id v767 = objc_msgSend_vectorWithX_Y_Z_W_(v757, v763, v764, v765, v766, v762, v742, 0.0, 0.0);
    v1173[2] = v767;
    v770 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v768, (uint64_t)v1173, 3, v769);
    v773 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v748, v771, (uint64_t)&unk_1F3985E80, (uint64_t)v770, v772, x, y, width, height);

    id v1161 = v773;
    if (objc_msgSend_BOOLValue(self->inputShowHF, v774, v775, v776, v777))
    {
      float v783 = sub_1DDB86664(v773, v1159, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
      v784 = v748;
      goto LABEL_142;
    }
    if (v1156 >= 0.00001 || v727 > 0.0)
    {
      if (v727 >= 1.0) {
        *(float *)&double v782 = 0.0;
      }
      else {
        *(float *)&double v782 = v727;
      }
      v785 = "i";
      if (v727 >= 1.0) {
        v785 = "";
      }
      float v786 = "HF";
      if (v727 == 0.0)
      {
        float v786 = "";
        float v787 = 0.0;
      }
      else
      {
        float v787 = *(float *)&v782;
      }
      if (v727 == 0.0) {
        v785 = "";
      }
      v788 = objc_msgSend_stringWithFormat_(NSString, v778, @"%s%s%s", v779, v780, 0.0, v782, "powerBlurL", v786, v785);
      v792 = objc_msgSend_kernelWithName_(V8CNRKernels, v789, (uint64_t)v788, v790, v791);

      objc_msgSend_extent(v773, v793, v794, v795, v796);
      CGRect v1181 = CGRectInset(v1180, -2.0, -2.0);
      double v797 = v1181.origin.x;
      double v798 = v1181.origin.y;
      double v799 = v1181.size.width;
      double v800 = v1181.size.height;
      v1172[0] = v773;
      v805 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v801, v802, v803, v804, v1154, 1.0, v1152, 1.0);
      v1172[1] = v805;
      v810 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v806, v807, v808, v809, v1147, v1156, v1149, v1131);
      v1172[2] = v810;
      *(float *)&double v811 = v787;
      v816 = objc_msgSend_numberWithFloat_(NSNumber, v812, v813, v814, v815, v811);
      v1172[3] = v816;
      v819 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v817, (uint64_t)v1172, 4, v818);
      uint64_t v822 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v792, v820, (uint64_t)&unk_1F3985EA0, (uint64_t)v819, v821, v797, v798, v799, v800);

      v748 = v792;
      id v1161 = (id)v822;
    }
    if (((v727 < 1.0) & ~v567) == 0)
    {
      float v823 = v565 * (float)(v1144 + (float)(v1121 * v1142));
      float v824 = v565 * (float)(v1143 + (float)(v1121 * v1141));
      BOOL v825 = v727 < 3.0;
      BOOL v826 = v727 > 1.0;
      float v827 = (float)(v727 + -1.0) * 0.5;
      v828 = "HF";
      if (v727 <= 1.0) {
        v828 = "";
      }
      BOOL v829 = !v826 || !v825;
      if (!v826 || !v825) {
        float v827 = 0.0;
      }
      float v1157 = v827;
      v830 = "i";
      if (v829) {
        v830 = "";
      }
      if (v1119)
      {
        v831 = objc_msgSend_stringWithFormat_(NSString, v778, @"%s%s%s", v779, v780, "powerBlurDespeckleL", v828, v830);
        v835 = objc_msgSend_kernelWithName_(V8CNRKernels, v832, (uint64_t)v831, v833, v834);

        objc_msgSend_extent(v1161, v836, v837, v838, v839);
        CGRect v1183 = CGRectInset(v1182, -6.0, -6.0);
        double v840 = v1183.origin.x;
        double v841 = v1183.origin.y;
        double v842 = v1183.size.width;
        double v843 = v1183.size.height;
        v1171[0] = v1161;
        v1150 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v844, v845, v846, v847, v1154, 1.0, v1152, 3.0);
        v1171[1] = v1150;
        v852 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v848, v849, v850, v851, v823, v1120, v824, v1131);
        v1171[2] = v852;
        v857 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v853, v854, v855, v856, 0.0, (double)v1116, v1115, v1114);
        v1171[3] = v857;
        v862 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v858, v859, v860, v861, (double)v1113, v1112, v1111, v1110);
        v1171[4] = v862;
        v867 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v863, v864, v865, v866, (double)v1109, (double)v1108, v1107, v1106);
        v1171[5] = v867;
        v872 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v868, v869, v870, v871, v1105, v1157, 0.0, 0.0);
        v1171[6] = v872;
        v875 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v873, (uint64_t)v1171, 7, v874);
        uint64_t v878 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v835, v876, (uint64_t)&unk_1F3985EC0, (uint64_t)v875, v877, v840, v841, v842, v843);

        id v1161 = (id)v878;
      }
      else
      {
        v955 = objc_msgSend_stringWithFormat_(NSString, v778, @"%s%s%s", v779, v780, "powerBlurL", v828, v830);
        v835 = objc_msgSend_kernelWithName_(V8CNRKernels, v956, (uint64_t)v955, v957, v958);

        objc_msgSend_extent(v1161, v959, v960, v961, v962);
        CGRect v1187 = CGRectInset(v1186, -6.0, -6.0);
        double v963 = v1187.origin.x;
        double v964 = v1187.origin.y;
        double v965 = v1187.size.width;
        double v966 = v1187.size.height;
        v1170[0] = v1161;
        v1150 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v967, v968, v969, v970, v1154, 1.0, v1152, 3.0);
        v1170[1] = v1150;
        v852 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v971, v972, v973, v974, v823, v1120, v824, v1131);
        v1170[2] = v852;
        *(float *)&double v975 = v1157;
        v857 = objc_msgSend_numberWithFloat_(NSNumber, v976, v977, v978, v979, v975);
        v1170[3] = v857;
        v862 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v980, (uint64_t)v1170, 4, v981);
        objc_msgSend_applyWithExtent_roiCallback_arguments_(v835, v982, (uint64_t)&unk_1F3985EE0, (uint64_t)v862, v983, v963, v964, v965, v966);
        v867 = v1161;
        id v1161 = (id)objc_claimAutoreleasedReturnValue();
      }

      v748 = v835;
    }
    if (((v727 < 3.0) & ~v1128) == 0)
    {
      float v984 = 0.0;
      if (v727 <= 3.0)
      {
        objc_msgSend_stringWithFormat_(NSString, v778, @"%s%s%s", v779, v780, "powerBlurEarlyOutL", ", ");
      }
      else if (v727 >= 7.0)
      {
        objc_msgSend_stringWithFormat_(NSString, v778, @"%s%s%s", v779, v780, "powerBlurEarlyOutL", "HF", "");
      }
      else
      {
        float v984 = (float)(v727 + -3.0) * 0.25;
        objc_msgSend_stringWithFormat_(NSString, v778, @"%s%s%s", v779, v780, "powerBlurEarlyOutL", "HF", "i");
      v985 = };
      v989 = objc_msgSend_kernelWithName_(V8CNRKernels, v986, (uint64_t)v985, v987, v988);

      objc_msgSend_extent(v1161, v990, v991, v992, v993);
      CGRect v1189 = CGRectInset(v1188, -14.0, -14.0);
      double v994 = v1189.origin.x;
      double v995 = v1189.origin.y;
      double v996 = v1189.size.width;
      double v997 = v1189.size.height;
      v1169[0] = v1161;
      v1002 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v998, v999, v1000, v1001, v1154, 1.0, v1152, 7.0);
      v1169[1] = v1002;
      v1007 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v1003, v1004, v1005, v1006, (float)(v565 * (float)(v1139 + (float)(v1117 * v1137))), v1118, (float)(v565 * (float)(v1138 + (float)(v1117 * v1136))), v1131);
      v1169[2] = v1007;
      *(float *)&double v1008 = v984;
      v1013 = objc_msgSend_numberWithFloat_(NSNumber, v1009, v1010, v1011, v1012, v1008);
      v1169[3] = v1013;
      v1016 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1014, (uint64_t)v1169, 4, v1015);
      uint64_t v1019 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v989, v1017, (uint64_t)&unk_1F3985F00, (uint64_t)v1016, v1018, v994, v995, v996, v997);

      v748 = v989;
      id v1161 = (id)v1019;
    }
    if (((v727 < 7.0) & ~v1123) == 0)
    {
      float v1020 = v565 * (float)(v1135 + (float)(v1140 * v1133));
      float v1021 = v565 * (float)(v1134 + (float)(v1140 * v1132));
      v1022 = "HF";
      if (v727 <= 7.0) {
        v1022 = "";
      }
      HIDWORD(v1023) = 0;
      v1024 = "i";
      if (v727 > 7.0 && v727 < 14.0) {
        float v1025 = (float)(v727 + -7.0) * 0.14286;
      }
      else {
        float v1025 = 0.0;
      }
      if (v727 <= 7.0 || v727 >= 14.0) {
        v1024 = "";
      }
      LODWORD(v781) = 1.5;
      *(float *)&double v1023 = v1122;
      if (v1122 <= 1.5)
      {
        v1059 = objc_msgSend_stringWithFormat_(NSString, v778, @"%s%s%s", v779, v780, v781, v1023, "powerBlurEarlyOutL", v1022, v1024);
        v1030 = objc_msgSend_kernelWithName_(V8CNRKernels, v1060, (uint64_t)v1059, v1061, v1062);

        objc_msgSend_extent(v1161, v1063, v1064, v1065, v1066);
        CGRect v1193 = CGRectInset(v1192, -28.0, -28.0);
        double v1067 = v1193.origin.x;
        double v1068 = v1193.origin.y;
        double v1069 = v1193.size.width;
        double v1070 = v1193.size.height;
        v1167[0] = v1161;
        v1043 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v1071, v1072, v1073, v1074, v1154, 1.0, v1152, 14.0);
        v1167[1] = v1043;
        v1048 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v1075, v1076, v1077, v1078, v1020, v1104, v1021, v1131);
        v1167[2] = v1048;
        *(float *)&double v1079 = v1025;
        v1053 = objc_msgSend_numberWithFloat_(NSNumber, v1080, v1081, v1082, v1083, v1079);
        v1167[3] = v1053;
        v1056 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1084, (uint64_t)v1167, 4, v1085);
        objc_msgSend_applyWithExtent_roiCallback_arguments_(v1030, v1086, (uint64_t)&unk_1F3985F40, (uint64_t)v1056, v1087, v1067, v1068, v1069, v1070);
      }
      else
      {
        v1026 = objc_msgSend_stringWithFormat_(NSString, v778, @"%s%s%s", v779, v780, v781, v1023, "powerBlurEarlyOut2L", v1022, v1024);
        v1030 = objc_msgSend_kernelWithName_(V8CNRKernels, v1027, (uint64_t)v1026, v1028, v1029);

        objc_msgSend_extent(v1161, v1031, v1032, v1033, v1034);
        CGRect v1191 = CGRectInset(v1190, -28.0, -28.0);
        double v1035 = v1191.origin.x;
        double v1036 = v1191.origin.y;
        double v1037 = v1191.size.width;
        double v1038 = v1191.size.height;
        v1168[0] = v1161;
        v1043 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v1039, v1040, v1041, v1042, v1154, 1.0, v1152, 14.0);
        v1168[1] = v1043;
        v1048 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v1044, v1045, v1046, v1047, v1020, v1104, v1021, v1131);
        v1168[2] = v1048;
        v1053 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v1049, v1050, v1051, v1052, 5.0, 0.150000006, v1025, 0.0);
        v1168[3] = v1053;
        v1056 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1054, (uint64_t)v1168, 4, v1055);
        objc_msgSend_applyWithExtent_roiCallback_arguments_(v1030, v1057, (uint64_t)&unk_1F3985F20, (uint64_t)v1056, v1058, v1035, v1036, v1037, v1038);
      uint64_t v1088 = };

      v748 = v1030;
      id v1161 = (id)v1088;
    }
    v784 = objc_msgSend_kernelWithName_(V8CNRKernels, v778, @"expandHRGB", v779, v780);

    objc_msgSend_extent(v1161, v1089, v1090, v1091, v1092);
    CGAffineTransform v1162 = v1164;
    CGRect v1195 = CGRectApplyAffineTransform(v1194, &v1162);
    double v1093 = v1195.origin.x;
    double v1094 = v1195.origin.y;
    double v1095 = v1195.size.width;
    double v1096 = v1195.size.height;
    id v1166 = v1161;
    v1099 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1097, (uint64_t)&v1166, 1, v1098);
    v1102 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v784, v1100, (uint64_t)&unk_1F3985F60, (uint64_t)v1099, v1101, v1093, v1094, v1095, v1096);

    id v954 = v1102;
  }
  else
  {
    if (v728)
    {
      v898 = objc_msgSend_kernelWithName_(V8CNRKernels, v737, @"highFrequencyIntoAlpha", v739, v740);
      objc_msgSend_extent(v1161, v899, v900, v901, v902);
      double v904 = v903;
      double v906 = v905;
      double v908 = v907;
      double v910 = v909;
      v1175[0] = v1161;
      v1175[1] = v706;
      v1175[2] = self->inputHighFrequencyFactor;
      *(float *)&double v903 = v742;
      v915 = objc_msgSend_numberWithFloat_(NSNumber, v911, v912, v913, v914, v903);
      v1175[3] = v915;
      v918 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v916, (uint64_t)v1175, 4, v917);
      uint64_t v921 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v898, v919, (uint64_t)&unk_1F3985E40, (uint64_t)v918, v920, v904, v906, v908, v910);

      v922 = v898;
      id v1161 = (id)v921;
      objc_msgSend_stringWithFormat_(NSString, v923, @"%s%s", v924, v925, "powerBlurLFS", "HF");
    }
    else
    {
      v922 = 0;
      objc_msgSend_stringWithFormat_(NSString, v737, @"%s%s", v739, v740, "powerBlurLFS", "");
    v926 = };
    v784 = objc_msgSend_kernelWithName_(V8CNRKernels, v927, (uint64_t)v926, v928, v929);

    objc_msgSend_extent(v1161, v930, v931, v932, v933);
    CGRect v1185 = CGRectInset(v1184, -4.0, -4.0);
    double v934 = v1185.origin.x;
    double v935 = v1185.origin.y;
    double v936 = v1185.size.width;
    double v937 = v1185.size.height;
    v1174[0] = v1161;
    v942 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v938, v939, v940, v941, v1154, 1.0, v1152, 0.0);
    v1174[1] = v942;
    v947 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v943, v944, v945, v946, v1147, v1156, v1149, v1131);
    v1174[2] = v947;
    v1174[3] = v706;
    v950 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v948, (uint64_t)v1174, 4, v949);
    v953 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v784, v951, (uint64_t)&unk_1F3985E60, (uint64_t)v950, v952, v934, v935, v936, v937);

    id v954 = v953;
  }
  float v783 = v954;
  id v1161 = v954;
LABEL_142:

  return v783;
}

- (id)kernelWithName:(id)a3 inArray:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = a4;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v26, (uint64_t)v30, 16);
  if (v8)
  {
    id v9 = 0;
    uint64_t v10 = *(void *)v27;
    while (2)
    {
      uint64_t v11 = 0;
      BOOL v12 = v9;
      do
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v6);
        }
        id v9 = *(id *)(*((void *)&v26 + 1) + 8 * v11);

        uint64_t v17 = objc_msgSend_name(v9, v13, v14, v15, v16);
        char isEqualToString = objc_msgSend_isEqualToString_(v17, v18, (uint64_t)v5, v19, v20);

        if (isEqualToString)
        {
          id v24 = v9;

          goto LABEL_12;
        }
        ++v11;
        BOOL v12 = v9;
      }
      while (v8 != v11);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v22, (uint64_t)&v26, (uint64_t)v30, 16);
      if (v8) {
        continue;
      }
      break;
    }
  }
  objc_msgSend_getCString_maxLength_encoding_(v5, v23, (uint64_t)v31, 256, 30);
  printf("kernel %s not found\n", v31);
  id v24 = 0;
LABEL_12:

  return v24;
}

- (id)kernelArrayWithResourceName:(id)a3
{
  id v3 = a3;
  uint64_t v8 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v4, v5, v6, v7);
  uint64_t v11 = objc_msgSend_pathForResource_ofType_(v8, v9, (uint64_t)v3, @"cikernel", v10);

  uint64_t v15 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x1E4F1C9B8], v12, (uint64_t)v11, v13, v14);
  uint64_t v20 = objc_msgSend_length(v15, v16, v17, v18, v19);
  uint64_t v21 = malloc_type_malloc(v20 + 1, 0x74E3DEDBuLL);
  objc_msgSend_getBytes_range_(v15, v22, (uint64_t)v21, 0, v20);
  v21[v20] = 0;
  uint64_t v25 = objc_msgSend_stringWithCString_encoding_(NSString, v23, (uint64_t)v21, 30, v24);
  long long v28 = objc_msgSend_kernelsWithString_messageLog_(MEMORY[0x1E4F1E058], v26, (uint64_t)v25, 0, v27);
  free(v21);

  return v28;
}

- (id)V8OutputImage
{
  v3282[2] = *MEMORY[0x1E4F143B8];
  objc_msgSend_floatValue(self->inputBaselineExposure, a2, v2, v3, v4);
  float v3059 = exp2f(v6);
  v3182 = self;
  v2992 = self->inputTrimParameters;
  v2993 = objc_msgSend_objectForKeyedSubscript_(v2992, v7, @"noise", v8, v9);
  uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(v2993, v10, 0, v11, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16, v17);
  float v19 = v18;

  uint64_t v23 = objc_msgSend_objectAtIndexedSubscript_(v2993, v20, 1, v21, v22);
  objc_msgSend_floatValue(v23, v24, v25, v26, v27);
  float v3170 = v28;

  v3027 = objc_msgSend_objectForKeyedSubscript_(v2992, v29, @"smoothing", v30, v31);
  BOOL v35 = objc_msgSend_objectAtIndexedSubscript_(v3027, v32, 0, v33, v34);
  objc_msgSend_floatValue(v35, v36, v37, v38, v39);
  float v3023 = v40;

  uint64_t v44 = objc_msgSend_objectAtIndexedSubscript_(v3027, v41, 1, v42, v43);
  objc_msgSend_floatValue(v44, v45, v46, v47, v48);
  float v3041 = v49;

  v3028 = objc_msgSend_objectForKeyedSubscript_(v2992, v50, @"contrast", v51, v52);
  float v56 = objc_msgSend_objectAtIndexedSubscript_(v3028, v53, 0, v54, v55);
  objc_msgSend_floatValue(v56, v57, v58, v59, v60);
  float v62 = v61;

  uint64_t v66 = objc_msgSend_objectAtIndexedSubscript_(v3028, v63, 1, v64, v65);
  objc_msgSend_floatValue(v66, v67, v68, v69, v70);
  float v72 = v71;

  v3029 = objc_msgSend_objectForKeyedSubscript_(v2992, v73, @"outmaskDetailAmount", v74, v75);
  float v79 = objc_msgSend_objectAtIndexedSubscript_(v3029, v76, 0, v77, v78);
  objc_msgSend_floatValue(v79, v80, v81, v82, v83);
  float v85 = v84;

  uint64_t v89 = objc_msgSend_objectAtIndexedSubscript_(v3029, v86, 1, v87, v88);
  objc_msgSend_floatValue(v89, v90, v91, v92, v93);
  float v95 = v94;

  v3030 = objc_msgSend_objectForKeyedSubscript_(v2992, v96, @"outmaskDetailAttenuation", v97, v98);
  float v102 = objc_msgSend_objectAtIndexedSubscript_(v3030, v99, 0, v100, v101);
  objc_msgSend_floatValue(v102, v103, v104, v105, v106);
  float v3025 = v107;

  float v111 = objc_msgSend_objectAtIndexedSubscript_(v3030, v108, 1, v109, v110);
  objc_msgSend_floatValue(v111, v112, v113, v114, v115);
  float v3036 = v116;

  int v121 = objc_msgSend_intValue(v3182->inputISO, v117, v118, v119, v120);
  v3035 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v122, @"ISOList", v123, v124);
  uint64_t v132 = objc_msgSend_count(v3035, v125, v126, v127, v128);
  float v3104 = v62;
  float v3100 = v85;
  float v3102 = v72;
  if (v132)
  {
    uint64_t v133 = 0;
    while (1)
    {
      uint64_t v134 = objc_msgSend_objectAtIndexedSubscript_(v3035, v129, v133, v130, v131);
      int v139 = objc_msgSend_intValue(v134, v135, v136, v137, v138);

      BOOL v140 = v121 != v139;
      if (v121 == v139)
      {
        float v141 = 0.0;
        goto LABEL_10;
      }
      if (v121 < v139) {
        break;
      }
      if (v132 == ++v133) {
        goto LABEL_6;
      }
    }
    if (!v133)
    {
      BOOL v140 = 0;
      float v141 = 0.0;
      goto LABEL_12;
    }
    double v142 = objc_msgSend_objectAtIndexedSubscript_(v3035, v129, --v133, v130, v131);
    int v147 = objc_msgSend_intValue(v142, v143, v144, v145, v146);

    float v141 = (float)(v121 - v147) / (float)(v139 - v147);
LABEL_10:
    if (v133 != 100000) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_6:
    BOOL v140 = 0;
    float v141 = 0.0;
  }
  uint64_t v133 = v132 - 1;
LABEL_12:
  double v148 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v129, @"FYMa", v130, v131);
  uint64_t v152 = objc_msgSend_objectAtIndexedSubscript_(v148, v149, v133, v150, v151);
  objc_msgSend_floatValue(v152, v153, v154, v155, v156);
  float v3175 = v157;

  if (v140)
  {
    uint64_t v161 = objc_msgSend_objectAtIndexedSubscript_(v148, v158, v133 + 1, v159, v160);
    objc_msgSend_floatValue(v161, v162, v163, v164, v165);
    float v167 = v166;

    float v3175 = v3175 + (float)((float)(v167 - v3175) * v141);
  }
  v3183 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v158, @"FYMb", v159, v160);

  uint64_t v171 = objc_msgSend_objectAtIndexedSubscript_(v3183, v168, v133, v169, v170);
  objc_msgSend_floatValue(v171, v172, v173, v174, v175);
  float v3165 = v176;

  if (v140)
  {
    uint64_t v180 = objc_msgSend_objectAtIndexedSubscript_(v3183, v177, v133 + 1, v178, v179);
    objc_msgSend_floatValue(v180, v181, v182, v183, v184);
    float v186 = v185;

    float v3165 = v3165 + (float)((float)(v186 - v3165) * v141);
  }
  float v187 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v177, @"FYMc", v178, v179);

  double v191 = objc_msgSend_objectAtIndexedSubscript_(v187, v188, v133, v189, v190);
  objc_msgSend_floatValue(v191, v192, v193, v194, v195);
  float v3160 = v196;

  if (v140)
  {
    uint64_t v200 = objc_msgSend_objectAtIndexedSubscript_(v187, v197, v133 + 1, v198, v199);
    objc_msgSend_floatValue(v200, v201, v202, v203, v204);
    float v206 = v205;

    float v3160 = v3160 + (float)((float)(v206 - v3160) * v141);
  }
  v3184 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v197, @"FYSDa", v198, v199);

  uint64_t v210 = objc_msgSend_objectAtIndexedSubscript_(v3184, v207, v133, v208, v209);
  objc_msgSend_floatValue(v210, v211, v212, v213, v214);
  float r1 = v215;

  if (v140)
  {
    uint64_t v219 = objc_msgSend_objectAtIndexedSubscript_(v3184, v216, v133 + 1, v217, v218);
    objc_msgSend_floatValue(v219, v220, v221, v222, v223);
    float v225 = v224;

    float r1 = r1 + (float)((float)(v225 - r1) * v141);
  }
  uint64_t v226 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v216, @"FYSDb", v217, v218);

  uint64_t v230 = objc_msgSend_objectAtIndexedSubscript_(v226, v227, v133, v228, v229);
  objc_msgSend_floatValue(v230, v231, v232, v233, v234);
  float v3152 = v235;

  if (v140)
  {
    v239 = objc_msgSend_objectAtIndexedSubscript_(v226, v236, v133 + 1, v237, v238);
    objc_msgSend_floatValue(v239, v240, v241, v242, v243);
    float v245 = v244;

    float v3152 = v3152 + (float)((float)(v245 - v3152) * v141);
  }
  v3185 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v236, @"FYSDc", v237, v238);

  int v249 = objc_msgSend_objectAtIndexedSubscript_(v3185, v246, v133, v247, v248);
  objc_msgSend_floatValue(v249, v250, v251, v252, v253);
  float v3147 = v254;

  if (v140)
  {
    float v258 = objc_msgSend_objectAtIndexedSubscript_(v3185, v255, v133 + 1, v256, v257);
    objc_msgSend_floatValue(v258, v259, v260, v261, v262);
    float v264 = v263;

    float v3147 = v3147 + (float)((float)(v264 - v3147) * v141);
  }
  uint64_t v265 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v255, @"HYMa", v256, v257);

  double v269 = objc_msgSend_objectAtIndexedSubscript_(v265, v266, v133, v267, v268);
  objc_msgSend_floatValue(v269, v270, v271, v272, v273);
  float v3145 = v274;

  if (v140)
  {
    float v278 = objc_msgSend_objectAtIndexedSubscript_(v265, v275, v133 + 1, v276, v277);
    objc_msgSend_floatValue(v278, v279, v280, v281, v282);
    float v284 = v283;

    float v3145 = v3145 + (float)((float)(v284 - v3145) * v141);
  }
  v3186 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v275, @"HYMb", v276, v277);

  float v288 = objc_msgSend_objectAtIndexedSubscript_(v3186, v285, v133, v286, v287);
  objc_msgSend_floatValue(v288, v289, v290, v291, v292);
  float v3143 = v293;

  if (v140)
  {
    uint64_t v297 = objc_msgSend_objectAtIndexedSubscript_(v3186, v294, v133 + 1, v295, v296);
    objc_msgSend_floatValue(v297, v298, v299, v300, v301);
    float v303 = v302;

    float v3143 = v3143 + (float)((float)(v303 - v3143) * v141);
  }
  double v304 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v294, @"HYMc", v295, v296);

  uint64_t v308 = objc_msgSend_objectAtIndexedSubscript_(v304, v305, v133, v306, v307);
  objc_msgSend_floatValue(v308, v309, v310, v311, v312);
  float v3141 = v313;

  if (v140)
  {
    uint64_t v317 = objc_msgSend_objectAtIndexedSubscript_(v304, v314, v133 + 1, v315, v316);
    objc_msgSend_floatValue(v317, v318, v319, v320, v321);
    float v323 = v322;

    float v3141 = v3141 + (float)((float)(v323 - v3141) * v141);
  }
  v3187 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v314, @"HYSDa", v315, v316);

  uint64_t v327 = objc_msgSend_objectAtIndexedSubscript_(v3187, v324, v133, v325, v326);
  objc_msgSend_floatValue(v327, v328, v329, v330, v331);
  float v3138 = v332;

  if (v140)
  {
    uint64_t v336 = objc_msgSend_objectAtIndexedSubscript_(v3187, v333, v133 + 1, v334, v335);
    objc_msgSend_floatValue(v336, v337, v338, v339, v340);
    float v342 = v341;

    float v3138 = v3138 + (float)((float)(v342 - v3138) * v141);
  }
  uint64_t v343 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v333, @"HYSDb", v334, v335);

  uint64_t v347 = objc_msgSend_objectAtIndexedSubscript_(v343, v344, v133, v345, v346);
  objc_msgSend_floatValue(v347, v348, v349, v350, v351);
  float v3136 = v352;

  if (v140)
  {
    uint64_t v356 = objc_msgSend_objectAtIndexedSubscript_(v343, v353, v133 + 1, v354, v355);
    objc_msgSend_floatValue(v356, v357, v358, v359, v360);
    float v362 = v361;

    float v3136 = v3136 + (float)((float)(v362 - v3136) * v141);
  }
  v3188 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v353, @"HYSDc", v354, v355);

  v366 = objc_msgSend_objectAtIndexedSubscript_(v3188, v363, v133, v364, v365);
  objc_msgSend_floatValue(v366, v367, v368, v369, v370);
  float v3134 = v371;

  if (v140)
  {
    v375 = objc_msgSend_objectAtIndexedSubscript_(v3188, v372, v133 + 1, v373, v374);
    objc_msgSend_floatValue(v375, v376, v377, v378, v379);
    float v381 = v380;

    float v3134 = v3134 + (float)((float)(v381 - v3134) * v141);
  }
  float v382 = logf(v19);
  float v383 = logf(v3170);
  float v3077 = expf((float)(v383 * 0.33333) + (float)(v382 * 0.66667));
  uint64_t v387 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v384, @"QYMa", v385, v386);

  v391 = objc_msgSend_objectAtIndexedSubscript_(v387, v388, v133, v389, v390);
  objc_msgSend_floatValue(v391, v392, v393, v394, v395);
  float v3132 = v396;

  if (v140)
  {
    float v400 = objc_msgSend_objectAtIndexedSubscript_(v387, v397, v133 + 1, v398, v399);
    objc_msgSend_floatValue(v400, v401, v402, v403, v404);
    float v406 = v405;

    float v3132 = v3132 + (float)((float)(v406 - v3132) * v141);
  }
  v3189 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v397, @"QYMb", v398, v399);

  float v410 = objc_msgSend_objectAtIndexedSubscript_(v3189, v407, v133, v408, v409);
  objc_msgSend_floatValue(v410, v411, v412, v413, v414);
  float v3129 = v415;

  if (v140)
  {
    uint64_t v419 = objc_msgSend_objectAtIndexedSubscript_(v3189, v416, v133 + 1, v417, v418);
    objc_msgSend_floatValue(v419, v420, v421, v422, v423);
    float v425 = v424;

    float v3129 = v3129 + (float)((float)(v425 - v3129) * v141);
  }
  double v426 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v416, @"QYMc", v417, v418);

  uint64_t v430 = objc_msgSend_objectAtIndexedSubscript_(v426, v427, v133, v428, v429);
  objc_msgSend_floatValue(v430, v431, v432, v433, v434);
  float v3127 = v435;

  if (v140)
  {
    uint64_t v439 = objc_msgSend_objectAtIndexedSubscript_(v426, v436, v133 + 1, v437, v438);
    objc_msgSend_floatValue(v439, v440, v441, v442, v443);
    float v445 = v444;

    float v3127 = v3127 + (float)((float)(v445 - v3127) * v141);
  }
  v3190 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v436, @"QYSDa", v437, v438);

  uint64_t v449 = objc_msgSend_objectAtIndexedSubscript_(v3190, v446, v133, v447, v448);
  objc_msgSend_floatValue(v449, v450, v451, v452, v453);
  float v3124 = v454;

  if (v140)
  {
    uint64_t v458 = objc_msgSend_objectAtIndexedSubscript_(v3190, v455, v133 + 1, v456, v457);
    objc_msgSend_floatValue(v458, v459, v460, v461, v462);
    float v464 = v463;

    float v3124 = v3124 + (float)((float)(v464 - v3124) * v141);
  }
  uint64_t v465 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v455, @"QYSDb", v456, v457);

  uint64_t v469 = objc_msgSend_objectAtIndexedSubscript_(v465, v466, v133, v467, v468);
  objc_msgSend_floatValue(v469, v470, v471, v472, v473);
  float v3121 = v474;

  if (v140)
  {
    uint64_t v478 = objc_msgSend_objectAtIndexedSubscript_(v465, v475, v133 + 1, v476, v477);
    objc_msgSend_floatValue(v478, v479, v480, v481, v482);
    float v484 = v483;

    float v3121 = v3121 + (float)((float)(v484 - v3121) * v141);
  }
  v3191 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v475, @"QYSDc", v476, v477);

  v488 = objc_msgSend_objectAtIndexedSubscript_(v3191, v485, v133, v486, v487);
  objc_msgSend_floatValue(v488, v489, v490, v491, v492);
  float v3119 = v493;

  if (v140)
  {
    double v497 = objc_msgSend_objectAtIndexedSubscript_(v3191, v494, v133 + 1, v495, v496);
    objc_msgSend_floatValue(v497, v498, v499, v500, v501);
    float v503 = v502;

    float v3119 = v3119 + (float)((float)(v503 - v3119) * v141);
  }
  float v3075 = expf((float)(v383 * 0.66667) + (float)(v382 * 0.33333));
  double v507 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v504, @"EYMa", v505, v506);

  uint64_t v511 = objc_msgSend_objectAtIndexedSubscript_(v507, v508, v133, v509, v510);
  objc_msgSend_floatValue(v511, v512, v513, v514, v515);
  float v3117 = v516;

  if (v140)
  {
    uint64_t v520 = objc_msgSend_objectAtIndexedSubscript_(v507, v517, v133 + 1, v518, v519);
    objc_msgSend_floatValue(v520, v521, v522, v523, v524);
    float v526 = v525;

    float v3117 = v3117 + (float)((float)(v526 - v3117) * v141);
  }
  v3192 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v517, @"EYMb", v518, v519);

  uint64_t v530 = objc_msgSend_objectAtIndexedSubscript_(v3192, v527, v133, v528, v529);
  objc_msgSend_floatValue(v530, v531, v532, v533, v534);
  float v3115 = v535;

  if (v140)
  {
    uint64_t v539 = objc_msgSend_objectAtIndexedSubscript_(v3192, v536, v133 + 1, v537, v538);
    objc_msgSend_floatValue(v539, v540, v541, v542, v543);
    float v545 = v544;

    float v3115 = v3115 + (float)((float)(v545 - v3115) * v141);
  }
  uint64_t v546 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v536, @"EYMc", v537, v538);

  uint64_t v550 = objc_msgSend_objectAtIndexedSubscript_(v546, v547, v133, v548, v549);
  objc_msgSend_floatValue(v550, v551, v552, v553, v554);
  float v3113 = v555;

  if (v140)
  {
    uint64_t v559 = objc_msgSend_objectAtIndexedSubscript_(v546, v556, v133 + 1, v557, v558);
    objc_msgSend_floatValue(v559, v560, v561, v562, v563);
    float v565 = v564;

    float v3113 = v3113 + (float)((float)(v565 - v3113) * v141);
  }
  v3193 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v556, @"EYSDa", v557, v558);

  double v569 = objc_msgSend_objectAtIndexedSubscript_(v3193, v566, v133, v567, v568);
  objc_msgSend_floatValue(v569, v570, v571, v572, v573);
  float v3111 = v574;

  if (v140)
  {
    double v578 = objc_msgSend_objectAtIndexedSubscript_(v3193, v575, v133 + 1, v576, v577);
    objc_msgSend_floatValue(v578, v579, v580, v581, v582);
    float v584 = v583;

    float v3111 = v3111 + (float)((float)(v584 - v3111) * v141);
  }
  uint64_t v585 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v575, @"EYSDb", v576, v577);

  double v589 = objc_msgSend_objectAtIndexedSubscript_(v585, v586, v133, v587, v588);
  objc_msgSend_floatValue(v589, v590, v591, v592, v593);
  float v3109 = v594;

  if (v140)
  {
    double v598 = objc_msgSend_objectAtIndexedSubscript_(v585, v595, v133 + 1, v596, v597);
    objc_msgSend_floatValue(v598, v599, v600, v601, v602);
    float v604 = v603;

    float v3109 = v3109 + (float)((float)(v604 - v3109) * v141);
  }
  v3194 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v595, @"EYSDc", v596, v597);

  double v608 = objc_msgSend_objectAtIndexedSubscript_(v3194, v605, v133, v606, v607);
  objc_msgSend_floatValue(v608, v609, v610, v611, v612);
  float v3107 = v613;

  if (v140)
  {
    uint64_t v617 = objc_msgSend_objectAtIndexedSubscript_(v3194, v614, v133 + 1, v615, v616);
    objc_msgSend_floatValue(v617, v618, v619, v620, v621);
    float v623 = v622;

    float v3107 = v3107 + (float)((float)(v623 - v3107) * v141);
  }
  uint64_t v624 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v614, @"FullCMa", v615, v616);

  uint64_t v628 = objc_msgSend_objectAtIndexedSubscript_(v624, v625, v133, v626, v627);
  objc_msgSend_floatValue(v628, v629, v630, v631, v632);
  float v3022 = v633;

  if (v140)
  {
    uint64_t v637 = objc_msgSend_objectAtIndexedSubscript_(v624, v634, v133 + 1, v635, v636);
    objc_msgSend_floatValue(v637, v638, v639, v640, v641);
    float v643 = v642;

    float v3022 = v3022 + (float)((float)(v643 - v3022) * v141);
  }
  v3195 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v634, @"FullCMb", v635, v636);

  double v647 = objc_msgSend_objectAtIndexedSubscript_(v3195, v644, v133, v645, v646);
  objc_msgSend_floatValue(v647, v648, v649, v650, v651);
  float v3021 = v652;

  if (v140)
  {
    uint64_t v656 = objc_msgSend_objectAtIndexedSubscript_(v3195, v653, v133 + 1, v654, v655);
    objc_msgSend_floatValue(v656, v657, v658, v659, v660);
    float v662 = v661;

    float v3021 = v3021 + (float)((float)(v662 - v3021) * v141);
  }
  float v663 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v653, @"FullCMc", v654, v655);

  v667 = objc_msgSend_objectAtIndexedSubscript_(v663, v664, v133, v665, v666);
  objc_msgSend_floatValue(v667, v668, v669, v670, v671);
  float v3020 = v672;

  if (v140)
  {
    v676 = objc_msgSend_objectAtIndexedSubscript_(v663, v673, v133 + 1, v674, v675);
    objc_msgSend_floatValue(v676, v677, v678, v679, v680);
    float v682 = v681;

    float v3020 = v3020 + (float)((float)(v682 - v3020) * v141);
  }
  v3196 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v673, @"FullCSDa", v674, v675);

  double v686 = objc_msgSend_objectAtIndexedSubscript_(v3196, v683, v133, v684, v685);
  objc_msgSend_floatValue(v686, v687, v688, v689, v690);
  float v3019 = v691;

  if (v140)
  {
    uint64_t v695 = objc_msgSend_objectAtIndexedSubscript_(v3196, v692, v133 + 1, v693, v694);
    objc_msgSend_floatValue(v695, v696, v697, v698, v699);
    float v701 = v700;

    float v3019 = v3019 + (float)((float)(v701 - v3019) * v141);
  }
  uint64_t v702 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v692, @"FullCSDb", v693, v694);

  v706 = objc_msgSend_objectAtIndexedSubscript_(v702, v703, v133, v704, v705);
  objc_msgSend_floatValue(v706, v707, v708, v709, v710);
  float v3018 = v711;

  if (v140)
  {
    uint64_t v715 = objc_msgSend_objectAtIndexedSubscript_(v702, v712, v133 + 1, v713, v714);
    objc_msgSend_floatValue(v715, v716, v717, v718, v719);
    float v721 = v720;

    float v3018 = v3018 + (float)((float)(v721 - v3018) * v141);
  }
  v3197 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v712, @"FullCSDc", v713, v714);

  uint64_t v725 = objc_msgSend_objectAtIndexedSubscript_(v3197, v722, v133, v723, v724);
  objc_msgSend_floatValue(v725, v726, v727, v728, v729);
  float v3017 = v730;

  if (v140)
  {
    float v734 = objc_msgSend_objectAtIndexedSubscript_(v3197, v731, v133 + 1, v732, v733);
    objc_msgSend_floatValue(v734, v735, v736, v737, v738);
    float v740 = v739;

    float v3017 = v3017 + (float)((float)(v740 - v3017) * v141);
  }
  float v741 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v731, @"HalfCMa", v732, v733);

  uint64_t v745 = objc_msgSend_objectAtIndexedSubscript_(v741, v742, v133, v743, v744);
  objc_msgSend_floatValue(v745, v746, v747, v748, v749);
  float v3033 = v750;

  if (v140)
  {
    int v754 = objc_msgSend_objectAtIndexedSubscript_(v741, v751, v133 + 1, v752, v753);
    objc_msgSend_floatValue(v754, v755, v756, v757, v758);
    float v760 = v759;

    float v3033 = v3033 + (float)((float)(v760 - v3033) * v141);
  }
  v3198 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v751, @"HalfCMb", v752, v753);

  uint64_t v764 = objc_msgSend_objectAtIndexedSubscript_(v3198, v761, v133, v762, v763);
  objc_msgSend_floatValue(v764, v765, v766, v767, v768);
  float v3031 = v769;

  if (v140)
  {
    v773 = objc_msgSend_objectAtIndexedSubscript_(v3198, v770, v133 + 1, v771, v772);
    objc_msgSend_floatValue(v773, v774, v775, v776, v777);
    float v779 = v778;

    float v3031 = v3031 + (float)((float)(v779 - v3031) * v141);
  }
  uint64_t v780 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v770, @"HalfCMc", v771, v772);

  v784 = objc_msgSend_objectAtIndexedSubscript_(v780, v781, v133, v782, v783);
  objc_msgSend_floatValue(v784, v785, v786, v787, v788);
  float v3014 = v789;

  if (v140)
  {
    v793 = objc_msgSend_objectAtIndexedSubscript_(v780, v790, v133 + 1, v791, v792);
    objc_msgSend_floatValue(v793, v794, v795, v796, v797);
    float v799 = v798;

    float v3014 = v3014 + (float)((float)(v799 - v3014) * v141);
  }
  v3199 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v790, @"HalfCSDa", v791, v792);

  uint64_t v803 = objc_msgSend_objectAtIndexedSubscript_(v3199, v800, v133, v801, v802);
  objc_msgSend_floatValue(v803, v804, v805, v806, v807);
  float v3013 = v808;

  if (v140)
  {
    v812 = objc_msgSend_objectAtIndexedSubscript_(v3199, v809, v133 + 1, v810, v811);
    objc_msgSend_floatValue(v812, v813, v814, v815, v816);
    float v818 = v817;

    float v3013 = v3013 + (float)((float)(v818 - v3013) * v141);
  }
  v819 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v809, @"HalfCSDb", v810, v811);

  float v823 = objc_msgSend_objectAtIndexedSubscript_(v819, v820, v133, v821, v822);
  objc_msgSend_floatValue(v823, v824, v825, v826, v827);
  float v3012 = v828;

  if (v140)
  {
    v832 = objc_msgSend_objectAtIndexedSubscript_(v819, v829, v133 + 1, v830, v831);
    objc_msgSend_floatValue(v832, v833, v834, v835, v836);
    float v838 = v837;

    float v3012 = v3012 + (float)((float)(v838 - v3012) * v141);
  }
  v3200 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v829, @"HalfCSDc", v830, v831);

  double v842 = objc_msgSend_objectAtIndexedSubscript_(v3200, v839, v133, v840, v841);
  objc_msgSend_floatValue(v842, v843, v844, v845, v846);
  float v3008 = v847;

  if (v140)
  {
    uint64_t v851 = objc_msgSend_objectAtIndexedSubscript_(v3200, v848, v133 + 1, v849, v850);
    objc_msgSend_floatValue(v851, v852, v853, v854, v855);
    float v857 = v856;

    float v3008 = v3008 + (float)((float)(v857 - v3008) * v141);
  }
  float v858 = logf(v3023);
  float v859 = logf(v3041);
  float v2969 = expf((float)(v859 * 0.33333) + (float)(v858 * 0.66667));
  v863 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v860, @"QuarterCMa", v861, v862);

  v867 = objc_msgSend_objectAtIndexedSubscript_(v863, v864, v133, v865, v866);
  objc_msgSend_floatValue(v867, v868, v869, v870, v871);
  float v3009 = v872;

  if (v140)
  {
    v876 = objc_msgSend_objectAtIndexedSubscript_(v863, v873, v133 + 1, v874, v875);
    objc_msgSend_floatValue(v876, v877, v878, v879, v880);
    float v882 = v881;

    float v3009 = v3009 + (float)((float)(v882 - v3009) * v141);
  }
  v3201 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v873, @"QuarterCMb", v874, v875);

  double v886 = objc_msgSend_objectAtIndexedSubscript_(v3201, v883, v133, v884, v885);
  objc_msgSend_floatValue(v886, v887, v888, v889, v890);
  float v3006 = v891;

  if (v140)
  {
    v895 = objc_msgSend_objectAtIndexedSubscript_(v3201, v892, v133 + 1, v893, v894);
    objc_msgSend_floatValue(v895, v896, v897, v898, v899);
    float v901 = v900;

    float v3006 = v3006 + (float)((float)(v901 - v3006) * v141);
  }
  uint64_t v902 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v892, @"QuarterCMc", v893, v894);

  double v906 = objc_msgSend_objectAtIndexedSubscript_(v902, v903, v133, v904, v905);
  objc_msgSend_floatValue(v906, v907, v908, v909, v910);
  float v3004 = v911;

  if (v140)
  {
    v915 = objc_msgSend_objectAtIndexedSubscript_(v902, v912, v133 + 1, v913, v914);
    objc_msgSend_floatValue(v915, v916, v917, v918, v919);
    float v921 = v920;

    float v3004 = v3004 + (float)((float)(v921 - v3004) * v141);
  }
  v3202 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v912, @"QuarterCSDa", v913, v914);

  uint64_t v925 = objc_msgSend_objectAtIndexedSubscript_(v3202, v922, v133, v923, v924);
  objc_msgSend_floatValue(v925, v926, v927, v928, v929);
  float v3003 = v930;

  if (v140)
  {
    double v934 = objc_msgSend_objectAtIndexedSubscript_(v3202, v931, v133 + 1, v932, v933);
    objc_msgSend_floatValue(v934, v935, v936, v937, v938);
    float v940 = v939;

    float v3003 = v3003 + (float)((float)(v940 - v3003) * v141);
  }
  uint64_t v941 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v931, @"QuarterCSDb", v932, v933);

  uint64_t v945 = objc_msgSend_objectAtIndexedSubscript_(v941, v942, v133, v943, v944);
  objc_msgSend_floatValue(v945, v946, v947, v948, v949);
  float v3002 = v950;

  if (v140)
  {
    id v954 = objc_msgSend_objectAtIndexedSubscript_(v941, v951, v133 + 1, v952, v953);
    objc_msgSend_floatValue(v954, v955, v956, v957, v958);
    float v960 = v959;

    float v3002 = v3002 + (float)((float)(v960 - v3002) * v141);
  }
  v3203 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v951, @"QuarterCSDc", v952, v953);

  double v964 = objc_msgSend_objectAtIndexedSubscript_(v3203, v961, v133, v962, v963);
  objc_msgSend_floatValue(v964, v965, v966, v967, v968);
  float v2999 = v969;

  if (v140)
  {
    uint64_t v973 = objc_msgSend_objectAtIndexedSubscript_(v3203, v970, v133 + 1, v971, v972);
    objc_msgSend_floatValue(v973, v974, v975, v976, v977);
    float v979 = v978;

    float v2999 = v2999 + (float)((float)(v979 - v2999) * v141);
  }
  float v2968 = expf((float)(v859 * 0.66667) + (float)(v858 * 0.33333));
  uint64_t v983 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v980, @"EighthCMa", v981, v982);

  uint64_t v987 = objc_msgSend_objectAtIndexedSubscript_(v983, v984, v133, v985, v986);
  objc_msgSend_floatValue(v987, v988, v989, v990, v991);
  float v3000 = v992;

  if (v140)
  {
    double v996 = objc_msgSend_objectAtIndexedSubscript_(v983, v993, v133 + 1, v994, v995);
    objc_msgSend_floatValue(v996, v997, v998, v999, v1000);
    float v1002 = v1001;

    float v3000 = v3000 + (float)((float)(v1002 - v3000) * v141);
  }
  v3204 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v993, @"EighthCMb", v994, v995);

  uint64_t v1006 = objc_msgSend_objectAtIndexedSubscript_(v3204, v1003, v133, v1004, v1005);
  objc_msgSend_floatValue(v1006, v1007, v1008, v1009, v1010);
  float v2998 = v1011;

  if (v140)
  {
    uint64_t v1015 = objc_msgSend_objectAtIndexedSubscript_(v3204, v1012, v133 + 1, v1013, v1014);
    objc_msgSend_floatValue(v1015, v1016, v1017, v1018, v1019);
    float v1021 = v1020;

    float v2998 = v2998 + (float)((float)(v1021 - v2998) * v141);
  }
  v1022 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v1012, @"EighthCMc", v1013, v1014);

  v1026 = objc_msgSend_objectAtIndexedSubscript_(v1022, v1023, v133, v1024, v1025);
  objc_msgSend_floatValue(v1026, v1027, v1028, v1029, v1030);
  float v2997 = v1031;

  if (v140)
  {
    double v1035 = objc_msgSend_objectAtIndexedSubscript_(v1022, v1032, v133 + 1, v1033, v1034);
    objc_msgSend_floatValue(v1035, v1036, v1037, v1038, v1039);
    float v1041 = v1040;

    float v2997 = v2997 + (float)((float)(v1041 - v2997) * v141);
  }
  v3205 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v1032, @"EighthCSDa", v1033, v1034);

  uint64_t v1045 = objc_msgSend_objectAtIndexedSubscript_(v3205, v1042, v133, v1043, v1044);
  objc_msgSend_floatValue(v1045, v1046, v1047, v1048, v1049);
  float v2996 = v1050;

  if (v140)
  {
    v1054 = objc_msgSend_objectAtIndexedSubscript_(v3205, v1051, v133 + 1, v1052, v1053);
    objc_msgSend_floatValue(v1054, v1055, v1056, v1057, v1058);
    float v1060 = v1059;

    float v2996 = v2996 + (float)((float)(v1060 - v2996) * v141);
  }
  uint64_t v1061 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v1051, @"EighthCSDb", v1052, v1053);

  uint64_t v1065 = objc_msgSend_objectAtIndexedSubscript_(v1061, v1062, v133, v1063, v1064);
  objc_msgSend_floatValue(v1065, v1066, v1067, v1068, v1069);
  float v2995 = v1070;

  if (v140)
  {
    uint64_t v1074 = objc_msgSend_objectAtIndexedSubscript_(v1061, v1071, v133 + 1, v1072, v1073);
    objc_msgSend_floatValue(v1074, v1075, v1076, v1077, v1078);
    float v1080 = v1079;

    float v2995 = v2995 + (float)((float)(v1080 - v2995) * v141);
  }
  v3206 = objc_msgSend_objectForKeyedSubscript_(v3182->inputISODictionary, v1071, @"EighthCSDc", v1072, v1073);

  v1084 = objc_msgSend_objectAtIndexedSubscript_(v3206, v1081, v133, v1082, v1083);
  objc_msgSend_floatValue(v1084, v1085, v1086, v1087, v1088);
  float v2994 = v1089;

  if (v140)
  {
    double v1093 = objc_msgSend_objectAtIndexedSubscript_(v3206, v1090, v133 + 1, v1091, v1092);
    objc_msgSend_floatValue(v1093, v1094, v1095, v1096, v1097);
    float v1099 = v1098;

    float v2994 = v2994 + (float)((float)(v1099 - v2994) * v141);
  }
  if (v3104 == 0.0) {
    float v1100 = 0.01;
  }
  else {
    float v1100 = v3104;
  }
  if (v3102 == 0.0) {
    float v1101 = 0.01;
  }
  else {
    float v1101 = v3102;
  }
  float v1102 = logf(v1100);
  float v1103 = logf(v1101);
  float v3105 = expf((float)(v1103 * 0.5) + (float)(v1102 * 0.5));
  objc_msgSend_floatValue(v3182->inputLNRAmount, v1104, v1105, v1106, v1107);
  float v3026 = v1108;
  float v1109 = (float)((float)(v1108 + -0.75) * -4.0) + 1.0;
  if (v3026 <= 0.75) {
    float v1109 = 1.0;
  }
  float v1110 = v19;
  float v1111 = v95 * v1109;
  float v2975 = v3100 * v1109;
  float v1112 = logf(v3100 * v1109);
  float v2965 = v1111;
  float v1113 = logf(v1111);
  float v2960 = expf((float)(v1113 * 0.33333) + (float)(v1112 * 0.66667));
  float v2962 = expf((float)(v1113 * 0.66667) + (float)(v1112 * 0.33333));
  float v1114 = logf(v3025);
  float v1115 = logf(v3036);
  float v2959 = expf((float)(v1115 * 0.33333) + (float)(v1114 * 0.66667));
  float v1116 = expf((float)(v1115 * 0.66667) + (float)(v1114 * 0.33333));
  objc_msgSend_floatValue(v3182->inputScaleFactor, v1117, v1118, v1119, v1120);
  float v1122 = v1121;
  objc_msgSend_adjustedRNAmount(v3182, v1123, v1124, v1125, v1126);
  float v3053 = v1131;
  float v1132 = v3145 + (float)(v3077 * v3138);
  float v1133 = v3143 + (float)(v3077 * v3136);
  float v1134 = v3141 + (float)(v3077 * v3134);
  float v1135 = v3129 + (float)(v3075 * v3121);
  float v1136 = v3117 + (float)(v3170 * v3111);
  float v1137 = fminf(fmaxf(v1122, 0.0), 1.0);
  float v3046 = v1137;
  if (v1137 >= 1.0)
  {
    float v3044 = v3175 + (float)(v1110 * r1);
    float v3078 = v3165 + (float)(v1110 * v3152);
    float v3122 = v3160 + (float)(v1110 * v3147);
    float v3055 = v3115 + (float)(v3170 * v3109);
    float v3067 = v3113 + (float)(v3170 * v3107);
    float v2982 = v1135;
    float v2966 = v3127 + (float)(v3075 * v3119);
    float v2967 = v3132 + (float)(v3075 * v3124);
    float v2980 = v1133;
    float v2963 = v1134;
    float v2964 = v1132;
  }
  else
  {
    float v3044 = (float)(v3175 + (float)(v1110 * r1)) * (float)(v1137 * v1137);
    float v3078 = (float)(v3165 + (float)(v1110 * v3152)) * (float)(v1137 * v1137);
    float v3122 = (float)(v3160 + (float)(v1110 * v3147)) * (float)(v1137 * v1137);
    float v2980 = v1133 * (float)(v1137 * v1137);
    float v2963 = v1134 * (float)(v1137 * v1137);
    float v2964 = v1132 * (float)(v1137 * v1137);
    float v2982 = v1135 * (float)(v1137 * v1137);
    float v2966 = (float)(v3127 + (float)(v3075 * v3119)) * (float)(v1137 * v1137);
    float v2967 = (float)(v3132 + (float)(v3075 * v3124)) * (float)(v1137 * v1137);
    float v1136 = v1136 * (float)(v1137 * v1137);
    float v3055 = (float)(v3115 + (float)(v3170 * v3109)) * (float)(v1137 * v1137);
    float v3067 = (float)(v3113 + (float)(v3170 * v3107)) * (float)(v1137 * v1137);
  }
  objc_msgSend_floatValue(v3182->inputSharpenAmount, v1127, v1128, v1129, v1130);
  float v1139 = v1138;
  objc_msgSend_floatValue(v3182->inputSharpenThreshold, v1140, v1141, v1142, v1143);
  float v3061 = exp2f(v1144);
  objc_msgSend_floatValue(v3182->inputContrastAmount, v1145, v1146, v1147, v1148);
  float v1150 = v1149;
  objc_msgSend_floatValue(v3182->inputDetailAmount, v1151, v1152, v1153, v1154);
  float v2977 = v1155;
  float v2961 = v1116;
  float v1156 = v1100 * v1150;
  float v1157 = v3105 * v1150;
  float v2987 = v3046 * v1139;
  float v1158 = log2f(v3046);
  unsigned int v1159 = vcvtms_s32_f32(v1158);
  if ((v1159 & 0x80000000) != 0)
  {
    float v1328 = v1158 - (float)(int)floorf(v1158);
    float v2981 = 0.0;
    switch(v1159)
    {
      case 0xFFFFFFFD:
        float v2987 = v1328 * v1157;
        float v2978 = 0.0;
        float v2979 = 0.0;
        break;
      case 0xFFFFFFFE:
        float v2987 = v1157 + (float)((float)(v1156 - v1157) * v1328);
        float v2978 = v1328 * v1157;
        float v2979 = 0.0;
        break;
      case 0xFFFFFFFF:
        float v2987 = v1156 + (float)((float)(v2987 - v1156) * v1328);
        float v2978 = v1157 + (float)((float)(v1156 - v1157) * v1328);
        float v2979 = v1328 * v1157;
        break;
      default:
        float v2978 = 0.0;
        float v2979 = 0.0;
        float v2987 = 0.0;
        break;
    }
  }
  else
  {
    float v2978 = v1100 * v1150;
    float v2979 = v3105 * v1150;
    float v2981 = v1101 * v1150;
  }
  float v1160 = 0.3;
  if (v3053 >= 1.0619) {
    float v1160 = 1.0;
  }
  float v3024 = v1160;
  float v2990 = sub_1DDB97484(flt_1DDBFFB10, flt_1DDBFFB34, v3053);
  float v2989 = sub_1DDB97484(flt_1DDBFFB10, flt_1DDBFFB58, v3053);
  CGAffineTransform v1164 = objc_msgSend_objectAtIndexedSubscript_(v3182->inputLowCurvatureThreshold, v1161, 0, v1162, v1163);
  objc_msgSend_floatValue(v1164, v1165, v1166, v1167, v1168);

  v1172 = objc_msgSend_objectAtIndexedSubscript_(v3182->inputLowCurvatureThreshold, v1169, 1, v1170, v1171);
  objc_msgSend_floatValue(v1172, v1173, v1174, v1175, v1176);
  float v2970 = v1177;

  CGRect v1181 = objc_msgSend_objectAtIndexedSubscript_(v3182->inputLowCurvatureThreshold, v1178, 2, v1179, v1180);
  objc_msgSend_floatValue(v1181, v1182, v1183, v1184, v1185);
  float v2976 = v1186;

  CGRect v1190 = objc_msgSend_objectAtIndexedSubscript_(v3182->inputLowCurvatureThreshold, v1187, 3, v1188, v1189);
  objc_msgSend_floatValue(v1190, v1191, v1192, v1193, v1194);
  float v2988 = v1195;

  v3146 = objc_msgSend_imageByClampingToExtent(v3182->inputImage, v1196, v1197, v1198, v1199);
  objc_msgSend_X(v3182->inputNeutralFactors, v1200, v1201, v1202, v1203);
  double v1205 = v1204;
  objc_msgSend_Y(v3182->inputNeutralFactors, v1206, v1207, v1208, v1209);
  double v1211 = v1210;
  objc_msgSend_Z(v3182->inputNeutralFactors, v1212, v1213, v1214, v1215);
  float v1216 = v1205;
  float v1217 = v1211;
  float v1219 = v1218;
  double v3125 = v1216;
  double v2985 = v1217;
  double v2983 = v1219;
  v3137 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v1220, v1221, v1222, v1223, 1.0 / v1216, 1.0 / v1217, 1.0 / v1219, 1.0);
  float v2991 = v1136;
  objc_msgSend_extent(v3182->inputImage, v1224, v1225, v1226, v1227);
  double v1229 = v1228;
  double v1231 = v1230;
  double v1233 = v1232;
  double v1235 = v1234;
  CGAffineTransformMakeScale(&v3228, 0.5, 0.5);
  CGAffineTransform v3226 = v3228;
  v3284.origin.double x = v1229;
  v3284.origin.double y = v1231;
  v3284.size.double width = v1233;
  v3284.size.double height = v1235;
  CGRect v3285 = CGRectApplyAffineTransform(v3284, &v3226);
  double x = v3285.origin.x;
  double y = v3285.origin.y;
  double width = v3285.size.width;
  double height = v3285.size.height;
  CGAffineTransform v3225 = v3228;
  CGRect v3286 = CGRectApplyAffineTransform(v3285, &v3225);
  CGAffineTransform v3224 = v3228;
  CGRect v3287 = CGRectApplyAffineTransform(v3286, &v3224);
  CGAffineTransform v3223 = v3228;
  CGRectApplyAffineTransform(v3287, &v3223);
  CGAffineTransformMakeScale(&v3227, 2.0, 2.0);
  double v2973 = v1231;
  double v2974 = v1229;
  double v2971 = v1235;
  double v2972 = v1233;
  v3135 = objc_msgSend_outputCNR_E0_E1_(v3182, v1240, (uint64_t)v3146, v1241, v1242, v1229, v1231, v1233, v1235, x, y, width, height);
  if (objc_msgSend_BOOLValue(v3182->inputShowHF, v1243, v1244, v1245, v1246))
  {
    id v1251 = v3135;
    v3123 = 0;
    v3042 = 0;
    v3054 = 0;
    v3056 = 0;
    v3068 = 0;
    v3071 = 0;
    v3072 = 0;
    v3126 = 0;
    v1252 = 0;
    id v3181 = 0;
    v3108 = 0;
    v3106 = 0;
    v3103 = 0;
    v3101 = 0;
    v3099 = 0;
    id v3110 = 0;
    v3076 = 0;
    v3112 = 0;
    v3073 = 0;
    v3128 = 0;
    v3120 = 0;
    v3118 = 0;
    v3116 = 0;
    v3114 = 0;
    id v3130 = 0;
    v3074 = 0;
    v3133 = 0;
    v3069 = 0;
    v3070 = 0;
    v3153 = 0;
    v3032 = 0;
    v3034 = 0;
    v3144 = 0;
    v3142 = 0;
    id v3176 = 0;
    v1253 = 0;
    id v3064 = 0;
    v3065 = 0;
    v3060 = 0;
    id v3062 = 0;
    v1254 = 0;
    v3037 = 0;
    v3045 = 0;
    v3047 = 0;
    v3051 = 0;
    v3052 = 0;
    v3066 = 0;
    v3050 = 0;
  }
  else
  {
    v1255 = (void *)MEMORY[0x1E4F1E080];
    objc_msgSend_X(v3182->inputLumFactors, v1247, v1248, v1249, v1250);
    double v1257 = v1256;
    objc_msgSend_Y(v3182->inputLumFactors, v1258, v1259, v1260, v1261);
    double v1263 = v1262;
    objc_msgSend_Z(v3182->inputLumFactors, v1264, v1265, v1266, v1267);
    v3126 = objc_msgSend_vectorWithX_Y_Z_W_(v1255, v1269, v1270, v1271, v1272, v1257 * v3125, v1263 * v2985, v1268 * v2983, 1.0);
    v1276 = objc_msgSend_kernelWithName_(V8LNRKernels, v1273, @"extractY", v1274, v1275);
    objc_msgSend_extent(v3146, v1277, v1278, v1279, v1280);
    double v1282 = v1281;
    double v1284 = v1283;
    double v1286 = v1285;
    double v1288 = v1287;
    v3282[0] = v3146;
    v3282[1] = v3126;
    v1291 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1289, (uint64_t)v3282, 2, v1290);
    v3050 = objc_msgSend_applyWithExtent_arguments_(v1276, v1292, (uint64_t)v1291, v1293, v1294, v1282, v1284, v1286, v1288);

    float v2984 = v3078 * v3061;
    v3123 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v1295, v1296, v1297, v1298, (float)(v3044 * v3061), (float)(v3078 * v3061), (float)(v3122 * v3061), 0.0);
    if ((float)(v3078 * v3061) <= 0.00001)
    {
      uint64_t v1329 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v1299, v1300, v1301, v1302, 0.859375, -0.09375, -0.0625, -0.0234375);
      uint64_t v1334 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v1330, v1331, v1332, v1333, -0.015625, -0.00390625, 0.0, 0.0);
      v3080 = objc_msgSend_kernelWithName_(V8LNRKernels, v1335, @"gaborToSYAndG", v1336, v1337);
      objc_msgSend_extent(v3050, v1338, v1339, v1340, v1341);
      double v1343 = v1342;
      double v1345 = v1344;
      double v1347 = v1346;
      double v1349 = v1348;
      v3280[0] = v3050;
      v3280[1] = &unk_1F39B4D50;
      v3280[2] = v1329;
      v3280[3] = v1334;
      v1320 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1350, (uint64_t)v3280, 4, v1351);
      v1327 = v3080;
      v1326 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v3080, v1352, (uint64_t)&unk_1F3985FA0, (uint64_t)v1320, v1353, v1343, v1345, v1347, v1349);
      v3051 = v1326;
      v3052 = 0;
      v3071 = (void *)v1334;
      v3072 = (void *)v1329;
    }
    else
    {
      *(float *)&double v1303 = v3078 * v3061;
      v3079 = objc_msgSend_kernelWithName_(V8LNRKernels, v1299, @"gaborToYAndVF", v1301, v1302, v1303);
      objc_msgSend_extent(v3050, v1304, v1305, v1306, v1307);
      double v1309 = v1308;
      double v1311 = v1310;
      double v1313 = v1312;
      double v1315 = v1314;
      v3281[0] = v3050;
      LODWORD(v1308) = 0.5;
      v1320 = objc_msgSend_numberWithFloat_(NSNumber, v1316, v1317, v1318, v1319, v1308);
      v3281[1] = v1320;
      v1323 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1321, (uint64_t)v3281, 2, v1322);
      v1326 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v3079, v1324, (uint64_t)&unk_1F3985F80, (uint64_t)v1323, v1325, v1309, v1311, v1313, v1315);

      v3071 = 0;
      v3072 = 0;
      v3051 = 0;
      v3052 = v1326;
      v1327 = v3079;
    }

    id v3064 = v1326;
    v3081 = objc_msgSend_kernelWithName_(V8LNRKernels, v1354, @"reduce", v1355, v1356);

    objc_msgSend_extent(v3064, v1357, v1358, v1359, v1360);
    CGAffineTransform v3222 = v3228;
    CGRect v3289 = CGRectApplyAffineTransform(v3288, &v3222);
    double v1361 = v3289.origin.x;
    double v1362 = v3289.origin.y;
    double v1363 = v3289.size.width;
    double v1364 = v3289.size.height;
    id v3279 = v3064;
    v1367 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1365, (uint64_t)&v3279, 1, v1366);
    v3065 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v3081, v1368, (uint64_t)&unk_1F3985FC0, (uint64_t)v1367, v1369, v1361, v1362, v1363, v1364);

    v1373 = objc_msgSend_kernelWithName_(V8LNRKernels, v1370, @"expandAndMakeD", v1371, v1372);

    objc_msgSend_extent(v3064, v1374, v1375, v1376, v1377);
    CGFloat v1379 = v1378;
    CGFloat v1381 = v1380;
    CGFloat v1383 = v1382;
    CGFloat v1385 = v1384;
    objc_msgSend_extent(v3065, v1386, v1387, v1388, v1389);
    CGAffineTransform v3221 = v3227;
    CGRect v3291 = CGRectApplyAffineTransform(v3290, &v3221);
    CGRect v3449 = CGRectInset(v3291, -1.0, -1.0);
    v3292.origin.double x = v1379;
    v3292.origin.double y = v1381;
    v3292.size.double width = v1383;
    v3292.size.double height = v1385;
    CGRect v3293 = CGRectUnion(v3292, v3449);
    double v1390 = v3293.origin.x;
    double v1391 = v3293.origin.y;
    double v1392 = v3293.size.width;
    double v1393 = v3293.size.height;
    v3278[0] = v3064;
    v3278[1] = v3065;
    v1396 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1394, (uint64_t)v3278, 2, v1395);
    v3066 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v1373, v1397, (uint64_t)&unk_1F3985FE0, (uint64_t)v1396, v1398, v1390, v1391, v1392, v1393);

    v3082 = objc_msgSend_kernelWithName_(V8LNRKernels, v1399, @"reduce", v1400, v1401);

    objc_msgSend_extent(v3065, v1402, v1403, v1404, v1405);
    CGAffineTransform v3220 = v3228;
    CGRect v3295 = CGRectApplyAffineTransform(v3294, &v3220);
    double v1406 = v3295.origin.x;
    double v1407 = v3295.origin.y;
    double v1408 = v3295.size.width;
    double v1409 = v3295.size.height;
    v3277 = v3065;
    v1412 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1410, (uint64_t)&v3277, 1, v1411);
    v3069 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v3082, v1413, (uint64_t)&unk_1F3986000, (uint64_t)v1412, v1414, v1406, v1407, v1408, v1409);

    v1418 = objc_msgSend_kernelWithName_(V8LNRKernels, v1415, @"expandAndMakeD", v1416, v1417);

    objc_msgSend_extent(v3065, v1419, v1420, v1421, v1422);
    CGFloat v1424 = v1423;
    CGFloat v1426 = v1425;
    CGFloat v1428 = v1427;
    CGFloat v1430 = v1429;
    objc_msgSend_extent(v3069, v1431, v1432, v1433, v1434);
    CGAffineTransform v3219 = v3227;
    CGRect v3297 = CGRectApplyAffineTransform(v3296, &v3219);
    CGRect v3450 = CGRectInset(v3297, -1.0, -1.0);
    v3298.origin.double x = v1424;
    v3298.origin.double y = v1426;
    v3298.size.double width = v1428;
    v3298.size.double height = v1430;
    CGRect v3299 = CGRectUnion(v3298, v3450);
    double v1435 = v3299.origin.x;
    double v1436 = v3299.origin.y;
    double v1437 = v3299.size.width;
    double v1438 = v3299.size.height;
    v3276[0] = v3065;
    v3276[1] = v3069;
    v1441 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1439, (uint64_t)v3276, 2, v1440);
    v3070 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v1418, v1442, (uint64_t)&unk_1F3986020, (uint64_t)v1441, v1443, v1435, v1436, v1437, v1438);

    v3083 = objc_msgSend_kernelWithName_(V8LNRKernels, v1444, @"reduce", v1445, v1446);

    objc_msgSend_extent(v3069, v1447, v1448, v1449, v1450);
    CGAffineTransform v3218 = v3228;
    CGRect v3301 = CGRectApplyAffineTransform(v3300, &v3218);
    double v1451 = v3301.origin.x;
    double v1452 = v3301.origin.y;
    double v1453 = v3301.size.width;
    double v1454 = v3301.size.height;
    v3275 = v3069;
    v1457 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1455, (uint64_t)&v3275, 1, v1456);
    v3073 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v3083, v1458, (uint64_t)&unk_1F3986040, (uint64_t)v1457, v1459, v1451, v1452, v1453, v1454);

    v1463 = objc_msgSend_kernelWithName_(V8LNRKernels, v1460, @"expandAndMakeD", v1461, v1462);

    objc_msgSend_extent(v3069, v1464, v1465, v1466, v1467);
    CGFloat v1469 = v1468;
    CGFloat v1471 = v1470;
    CGFloat v1473 = v1472;
    CGFloat v1475 = v1474;
    objc_msgSend_extent(v3073, v1476, v1477, v1478, v1479);
    CGAffineTransform v3217 = v3227;
    CGRect v3303 = CGRectApplyAffineTransform(v3302, &v3217);
    CGRect v3451 = CGRectInset(v3303, -1.0, -1.0);
    v3304.origin.double x = v1469;
    v3304.origin.double y = v1471;
    v3304.size.double width = v1473;
    v3304.size.double height = v1475;
    CGRect v3305 = CGRectUnion(v3304, v3451);
    double v1480 = v3305.origin.x;
    double v1481 = v3305.origin.y;
    double v1482 = v3305.size.width;
    double v1483 = v3305.size.height;
    v3274[0] = v3069;
    v3274[1] = v3073;
    v1486 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1484, (uint64_t)v3274, 2, v1485);
    v3074 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v1463, v1487, (uint64_t)&unk_1F3986060, (uint64_t)v1486, v1488, v1480, v1481, v1482, v1483);

    v3084 = objc_msgSend_kernelWithName_(V8LNRKernels, v1489, @"reduce", v1490, v1491);

    objc_msgSend_extent(v3073, v1492, v1493, v1494, v1495);
    CGAffineTransform v3216 = v3228;
    CGRect v3307 = CGRectApplyAffineTransform(v3306, &v3216);
    double v1496 = v3307.origin.x;
    double v1497 = v3307.origin.y;
    double v1498 = v3307.size.width;
    double v1499 = v3307.size.height;
    v3273 = v3073;
    v1502 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1500, (uint64_t)&v3273, 1, v1501);
    v3148 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v3084, v1503, (uint64_t)&unk_1F3986080, (uint64_t)v1502, v1504, v1496, v1497, v1498, v1499);

    v1508 = objc_msgSend_kernelWithName_(V8LNRKernels, v1505, @"expandAndMakeD", v1506, v1507);

    objc_msgSend_extent(v3073, v1509, v1510, v1511, v1512);
    CGFloat v1514 = v1513;
    CGFloat v1516 = v1515;
    CGFloat v1518 = v1517;
    CGFloat v1520 = v1519;
    objc_msgSend_extent(v3148, v1521, v1522, v1523, v1524);
    CGAffineTransform v3215 = v3227;
    CGRect v3309 = CGRectApplyAffineTransform(v3308, &v3215);
    CGRect v3452 = CGRectInset(v3309, -1.0, -1.0);
    v3310.origin.double x = v1514;
    v3310.origin.double y = v1516;
    v3310.size.double width = v1518;
    v3310.size.double height = v1520;
    CGRect v3311 = CGRectUnion(v3310, v3452);
    double v1525 = v3311.origin.x;
    double v1526 = v3311.origin.y;
    double v1527 = v3311.size.width;
    double v1528 = v3311.size.height;
    v3272[0] = v3073;
    v3272[1] = v3148;
    v1531 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1529, (uint64_t)v3272, 2, v1530);
    v3076 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v1508, v1532, (uint64_t)&unk_1F39860A0, (uint64_t)v1531, v1533, v1525, v1526, v1527, v1528);

    float v1534 = v3055 * v3061;
    float v2986 = 0.81 / v3059;
    id v3181 = v3148;
    if ((float)(v3055 * v3061) <= 0.00001)
    {
      v3087 = objc_msgSend_kernelWithName_(V8LNRKernels, v1535, @"expandPlusDWithOverdrive", v1536, v1537);

      objc_msgSend_extent(v3076, v1714, v1715, v1716, v1717);
      CGFloat v1719 = v1718;
      CGFloat v1721 = v1720;
      CGFloat v1723 = v1722;
      CGFloat v1725 = v1724;
      objc_msgSend_extent(v3181, v1726, v1727, v1728, v1729);
      CGAffineTransform v3213 = v3227;
      CGRect v3329 = CGRectApplyAffineTransform(v3328, &v3213);
      CGRect v3457 = CGRectInset(v3329, -1.0, -1.0);
      v3330.origin.double x = v1719;
      v3330.origin.double y = v1721;
      v3330.size.double width = v1723;
      v3330.size.double height = v1725;
      CGRect v3331 = CGRectUnion(v3330, v3457);
      double v1730 = v3331.origin.x;
      double v1731 = v3331.origin.y;
      double v1732 = v3331.size.width;
      double v1733 = v3331.size.height;
      v3265[0] = v3181;
      v3265[1] = v3076;
      *(float *)&v3331.origin.double x = v2981;
      v1698 = objc_msgSend_numberWithFloat_(NSNumber, v1734, v1735, v1736, v1737, v3331.origin.x);
      v3265[2] = v1698;
      v1703 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1738, (uint64_t)v3265, 3, v1739);
      v1653 = v3087;
      v3112 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v3087, v1740, (uint64_t)&unk_1F3986160, (uint64_t)v1703, v1741, v1730, v1731, v1732, v1733);
      v3068 = 0;
      v3108 = 0;
      v3106 = 0;
      v3103 = 0;
      v3101 = 0;
      v3099 = 0;
      id v3110 = 0;
      v3139 = v1276;
    }
    else
    {
      v3085 = objc_msgSend_kernelWithName_(V8LNRKernels, v1535, @"gaborToVF", v1536, v1537);

      objc_msgSend_extent(v3073, v1538, v1539, v1540, v1541);
      CGRect v3313 = CGRectInset(v3312, -3.0, -3.0);
      double v1542 = v3313.origin.x;
      double v1543 = v3313.origin.y;
      double v1544 = v3313.size.width;
      double v1545 = v3313.size.height;
      v3271 = v3073;
      v1548 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1546, (uint64_t)&v3271, 1, v1547);
      v3099 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v3085, v1549, (uint64_t)&unk_1F39860C0, (uint64_t)v1548, v1550, v1542, v1543, v1544, v1545);

      v3068 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v1551, v1552, v1553, v1554, (float)(v2991 * v3061), v1534, (float)(v3067 * v3061), 0.0);
      v1558 = objc_msgSend_kernelWithName_(V8LNRKernels, v1555, @"smoothVF", v1556, v1557);

      objc_msgSend_extent(v3099, v1559, v1560, v1561, v1562);
      CGRect v3315 = CGRectInset(v3314, -3.0, -3.0);
      double v1563 = v3315.origin.x;
      double v1564 = v3315.origin.y;
      double v1565 = v3315.size.width;
      double v1566 = v3315.size.height;
      v3270 = v3099;
      v1569 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1567, (uint64_t)&v3270, 1, v1568);
      v3101 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v1558, v1570, (uint64_t)&unk_1F39860E0, (uint64_t)v1569, v1571, v1563, v1564, v1565, v1566);

      v3057 = objc_msgSend_kernelWithName_(V8LNRKernels, v1572, @"VFToGDIR", v1573, v1574);

      objc_msgSend_extent(v3101, v1575, v1576, v1577, v1578);
      double v1580 = v1579;
      double v1582 = v1581;
      double v1584 = v1583;
      double v1586 = v1585;
      v3269 = v3101;
      v1589 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1587, (uint64_t)&v3269, 1, v1588);
      v3103 = objc_msgSend_applyWithExtent_arguments_(v3057, v1590, (uint64_t)v1589, v1591, v1592, v1580, v1582, v1584, v1586);

      v3086 = objc_msgSend_kernelWithName_(V8LNRKernels, v1593, @"DIRToC", v1594, v1595);

      objc_msgSend_extent(v3103, v1596, v1597, v1598, v1599);
      CGRect v3317 = CGRectInset(v3316, -8.0, -8.0);
      double v1600 = v3317.origin.x;
      double v1601 = v3317.origin.y;
      double v1602 = v3317.size.width;
      double v1603 = v3317.size.height;
      v3268[0] = v3103;
      v3268[1] = v3073;
      v1608 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v1604, v1605, v1606, v1607, (float)(v3000 + (float)(v3041 * v2996)), (float)(v2998 + (float)(v3041 * v2995)), (float)(v2997 + (float)(v3041 * v2994)), 0.0);
      v3268[2] = v1608;
      v1611 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1609, (uint64_t)v3268, 3, v1610);
      v3106 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v3086, v1612, (uint64_t)&unk_1F3986100, (uint64_t)v1611, v1613, v1600, v1601, v1602, v1603);

      v1617 = objc_msgSend_kernelWithName_(V8LNRKernels, v1614, @"annealGAndC", v1615, v1616);

      objc_msgSend_extent(v3106, v1618, v1619, v1620, v1621);
      CGRect v3319 = CGRectInset(v3318, -1.0, -1.0);
      CGFloat v1622 = v3319.origin.x;
      CGFloat v1623 = v3319.origin.y;
      CGFloat v1624 = v3319.size.width;
      CGFloat v1625 = v3319.size.height;
      objc_msgSend_extent(v3073, v1626, v1627, v1628, v1629);
      v3453.origin.double x = v1630;
      v3453.origin.double y = v1631;
      v3453.size.double width = v1632;
      v3453.size.double height = v1633;
      v3320.origin.double x = v1622;
      v3320.origin.double y = v1623;
      v3320.size.double width = v1624;
      v3320.size.double height = v1625;
      CGRect v3321 = CGRectUnion(v3320, v3453);
      double v1634 = v3321.origin.x;
      double v1635 = v3321.origin.y;
      double v1636 = v3321.size.width;
      double v1637 = v3321.size.height;
      v3267[0] = v3106;
      v3267[1] = v3073;
      v3267[2] = v3068;
      *(float *)&v3321.origin.double x = v2990;
      v1642 = objc_msgSend_numberWithFloat_(NSNumber, v1638, v1639, v1640, v1641, v3321.origin.x);
      v3267[3] = v1642;
      v1645 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1643, (uint64_t)v3267, 4, v1644);
      v3108 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v1617, v1646, (uint64_t)&unk_1F3986120, (uint64_t)v1645, v1647, v1634, v1635, v1636, v1637);

      id v3110 = v3076;
      float v1651 = (float)(v1534 + -0.00003) / 0.00004;
      float v1652 = 0.0;
      if (v1651 >= 0.0)
      {
        float v1652 = (float)(v1534 + -0.00003) / 0.00004;
        if (v1651 > 1.0) {
          float v1652 = 1.0;
        }
      }
      float v3177 = v1652;
      v1653 = objc_msgSend_kernelWithName_(V8LNRKernels, v1648, @"expandPlusDThruG", v1649, v1650);

      objc_msgSend_extent(v3110, v1654, v1655, v1656, v1657);
      CGFloat v3171 = v1658;
      CGFloat v3166 = v1659;
      CGFloat v3161 = v1660;
      CGFloat r1a = v1661;
      objc_msgSend_extent(v3110, v1662, v1663, v1664, v1665);
      CGFloat v1667 = v1666;
      CGFloat v1669 = v1668;
      CGFloat v1671 = v1670;
      CGFloat v1673 = v1672;
      objc_msgSend_extent(v3108, v1674, v1675, v1676, v1677);
      CGFloat v1679 = v1678;
      CGFloat v1681 = v1680;
      CGFloat v1683 = v1682;
      CGFloat v1685 = v1684;
      objc_msgSend_extent(v3181, v1686, v1687, v1688, v1689);
      CGAffineTransform v3214 = v3227;
      CGRect v3323 = CGRectApplyAffineTransform(v3322, &v3214);
      CGRect v3454 = CGRectInset(v3323, -1.0, -1.0);
      v3324.origin.double x = v1679;
      v3324.origin.double y = v1681;
      v3324.size.double width = v1683;
      v3324.size.double height = v1685;
      CGRect v3455 = CGRectUnion(v3324, v3454);
      v3325.origin.double x = v1667;
      v3325.origin.double y = v1669;
      v3325.size.double width = v1671;
      v3325.size.double height = v1673;
      CGRect v3456 = CGRectUnion(v3325, v3455);
      v3326.origin.double x = v3171;
      v3326.origin.double y = v3166;
      v3326.size.double width = v3161;
      v3326.size.double height = r1a;
      CGRect v3327 = CGRectUnion(v3326, v3456);
      double v1690 = v3327.origin.x;
      double v1691 = v3327.origin.y;
      double v1692 = v3327.size.width;
      double v1693 = v3327.size.height;
      *(float *)&v3327.size.double height = fminf(v3026 / 0.42188, 1.0);
      v3266[0] = v3181;
      v3266[1] = v3110;
      v3266[2] = v3110;
      v3266[3] = v3108;
      v1698 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v1694, v1695, v1696, v1697, 0.0, v2981, *(float *)&v3327.size.height, (float)((float)((float)((float)(v3026 * 0.75) * 0.75) * 0.75)+ (float)((float)(*(float *)&v3327.size.height - (float)((float)((float)(v3026 * 0.75) * 0.75) * 0.75))* v3177)));
      v3266[4] = v1698;
      v1703 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v1699, v1700, v1701, v1702, (float)(v2986 * 0.0003), (float)(v2986 * 0.0009), (float)(v2986 * 0.0006), 0.0);
      v3266[5] = v1703;
      v1708 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v1704, v1705, v1706, v1707, v2965, v3036, 0.0, 0.0);
      v3266[6] = v1708;
      v1711 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1709, (uint64_t)v3266, 7, v1710);
      v3112 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v1653, v1712, (uint64_t)&unk_1F3986140, (uint64_t)v1711, v1713, v1690, v1691, v1692, v1693);

      v3139 = v3057;
    }

    float v3001 = v3053 * 0.02054;
    float v3038 = v3059 * v3053;
    *(float *)&double v1745 = v2982 * v3061;
    LODWORD(v1746) = 925353388;
    float v3043 = v2982 * v3061;
    if ((float)(v2982 * v3061) <= 0.00001)
    {
      v3092 = objc_msgSend_kernelWithName_(V8LNRKernels, v1742, @"expandPlusDWithOverdrive", v1743, v1744, v1746, v1745);

      objc_msgSend_extent(v3074, v1979, v1980, v1981, v1982);
      CGFloat v1984 = v1983;
      CGFloat v1986 = v1985;
      CGFloat v1988 = v1987;
      CGFloat v1990 = v1989;
      objc_msgSend_extent(v3112, v1991, v1992, v1993, v1994);
      CGAffineTransform v3211 = v3227;
      CGRect v3355 = CGRectApplyAffineTransform(v3354, &v3211);
      CGRect v3462 = CGRectInset(v3355, -1.0, -1.0);
      v3356.origin.double x = v1984;
      v3356.origin.double y = v1986;
      v3356.size.double width = v1988;
      v3356.size.double height = v1990;
      CGRect v3357 = CGRectUnion(v3356, v3462);
      double v1995 = v3357.origin.x;
      double v1996 = v3357.origin.y;
      double v1997 = v3357.size.width;
      double v1998 = v3357.size.height;
      v3255[0] = v3112;
      v3255[1] = v3074;
      *(float *)&v3357.origin.double x = v2979;
      v2003 = objc_msgSend_numberWithFloat_(NSNumber, v1999, v2000, v2001, v2002, v3357.origin.x);
      v3255[2] = v2003;
      v2006 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2004, (uint64_t)v3255, 3, v2005);
      v2007 = v3092;
      v3133 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v3092, v2008, (uint64_t)&unk_1F3986280, (uint64_t)v2006, v2009, v1995, v1996, v1997, v1998);
      v3054 = 0;
      v3128 = 0;
      v3120 = 0;
      v3118 = 0;
      v3116 = 0;
      v3114 = 0;
      id v3130 = 0;
    }
    else
    {
      v3088 = objc_msgSend_kernelWithName_(V8LNRKernels, v1742, @"gaborToVF", v1743, v1744, v1746, v1745);

      objc_msgSend_extent(v3069, v1747, v1748, v1749, v1750);
      CGRect v3333 = CGRectInset(v3332, -3.0, -3.0);
      double v1751 = v3333.origin.x;
      double v1752 = v3333.origin.y;
      double v1753 = v3333.size.width;
      double v1754 = v3333.size.height;
      v3264 = v3069;
      v1757 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1755, (uint64_t)&v3264, 1, v1756);
      v3114 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v3088, v1758, (uint64_t)&unk_1F3986180, (uint64_t)v1757, v1759, v1751, v1752, v1753, v1754);

      v3054 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v1760, v1761, v1762, v1763, (float)(v2967 * v3061), v3043, (float)(v2966 * v3061), 0.0);
      v1767 = objc_msgSend_kernelWithName_(V8LNRKernels, v1764, @"smoothVF", v1765, v1766);

      objc_msgSend_extent(v3114, v1768, v1769, v1770, v1771);
      CGRect v3335 = CGRectInset(v3334, -3.0, -3.0);
      double v1772 = v3335.origin.x;
      double v1773 = v3335.origin.y;
      double v1774 = v3335.size.width;
      double v1775 = v3335.size.height;
      v3263 = v3114;
      v1778 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1776, (uint64_t)&v3263, 1, v1777);
      v3116 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v1767, v1779, (uint64_t)&unk_1F39861A0, (uint64_t)v1778, v1780, v1772, v1773, v1774, v1775);

      v3058 = objc_msgSend_kernelWithName_(V8LNRKernels, v1781, @"VFToGDIR", v1782, v1783);

      objc_msgSend_extent(v3116, v1784, v1785, v1786, v1787);
      double v1789 = v1788;
      double v1791 = v1790;
      double v1793 = v1792;
      double v1795 = v1794;
      v3262 = v3116;
      v1798 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1796, (uint64_t)&v3262, 1, v1797);
      v3118 = objc_msgSend_applyWithExtent_arguments_(v3058, v1799, (uint64_t)v1798, v1800, v1801, v1789, v1791, v1793, v1795);

      v3089 = objc_msgSend_kernelWithName_(V8LNRKernels, v1802, @"DIRToC", v1803, v1804);

      objc_msgSend_extent(v3118, v1805, v1806, v1807, v1808);
      CGRect v3337 = CGRectInset(v3336, -8.0, -8.0);
      double v1809 = v3337.origin.x;
      double v1810 = v3337.origin.y;
      double v1811 = v3337.size.width;
      double v1812 = v3337.size.height;
      v3261[0] = v3118;
      v3261[1] = v3069;
      v1817 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v1813, v1814, v1815, v1816, (float)(v3009 + (float)(v2968 * v3003)), (float)(v3006 + (float)(v2968 * v3002)), (float)(v3004 + (float)(v2968 * v2999)), 0.0);
      v3261[2] = v1817;
      v1820 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1818, (uint64_t)v3261, 3, v1819);
      v3120 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v3089, v1821, (uint64_t)&unk_1F39861C0, (uint64_t)v1820, v1822, v1809, v1810, v1811, v1812);

      v1826 = objc_msgSend_kernelWithName_(V8LNRKernels, v1823, @"annealGAndC", v1824, v1825);

      objc_msgSend_extent(v3120, v1827, v1828, v1829, v1830);
      CGRect v3339 = CGRectInset(v3338, -1.0, -1.0);
      CGFloat v1831 = v3339.origin.x;
      CGFloat v1832 = v3339.origin.y;
      CGFloat v1833 = v3339.size.width;
      CGFloat v1834 = v3339.size.height;
      objc_msgSend_extent(v3069, v1835, v1836, v1837, v1838);
      v3458.origin.double x = v1839;
      v3458.origin.double y = v1840;
      v3458.size.double width = v1841;
      v3458.size.double height = v1842;
      v3340.origin.double x = v1831;
      v3340.origin.double y = v1832;
      v3340.size.double width = v1833;
      v3340.size.double height = v1834;
      CGRect v3341 = CGRectUnion(v3340, v3458);
      double v1843 = v3341.origin.x;
      double v1844 = v3341.origin.y;
      double v1845 = v3341.size.width;
      double v1846 = v3341.size.height;
      v3260[0] = v3120;
      v3260[1] = v3069;
      v3260[2] = v3054;
      *(float *)&v3341.origin.double x = v2990;
      v1851 = objc_msgSend_numberWithFloat_(NSNumber, v1847, v1848, v1849, v1850, v3341.origin.x);
      v3260[3] = v1851;
      v1854 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1852, (uint64_t)v3260, 4, v1853);
      v3128 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v1826, v1855, (uint64_t)&unk_1F39861E0, (uint64_t)v1854, v1856, v1843, v1844, v1845, v1846);

      if (v3038 <= 2.4)
      {
        id v3130 = v3074;
        v3091 = v1826;
      }
      else
      {
        v3090 = objc_msgSend_kernelWithName_(V8LNRKernels, v1857, @"smoothDSharpenAntiBloom", v1858, v1859);

        v1864 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v1860, v1861, v1862, v1863, 1.0, v2970, v3024, v2989);

        double v3005 = (float)(2.0 / v3001);
        double v3007 = (float)(v3001 * 0.75);
        v1869 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v1865, v1866, v1867, v1868, 1.0);

        objc_msgSend_extent(v3074, v1870, v1871, v1872, v1873);
        CGRect v3343 = CGRectInset(v3342, -2.0, -2.0);
        CGFloat v1874 = v3343.origin.x;
        CGFloat v1875 = v3343.origin.y;
        CGFloat v1876 = v3343.size.width;
        CGFloat v1877 = v3343.size.height;
        objc_msgSend_extent(v3128, v1878, v1879, v1880, v1881);
        v3459.origin.double x = v1882;
        v3459.origin.double y = v1883;
        v3459.size.double width = v1884;
        v3459.size.double height = v1885;
        v3344.origin.double x = v1874;
        v3344.origin.double y = v1875;
        v3344.size.double width = v1876;
        v3344.size.double height = v1877;
        CGRect v3345 = CGRectUnion(v3344, v3459);
        double v1886 = v3345.origin.x;
        double v1887 = v3345.origin.y;
        double v1888 = v3345.size.width;
        double v1889 = v3345.size.height;
        v3259[0] = v3074;
        v3259[1] = v3128;
        v3259[2] = v1864;
        v3259[3] = v1869;
        v1892 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1890, (uint64_t)v3259, 4, v1891);
        v3131 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v3090, v1893, (uint64_t)&unk_1F3986200, (uint64_t)v1892, v1894, v1886, v1887, v1888, v1889);

        uint64_t v1899 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v1895, v1896, v1897, v1898, 2.0, (float)(v2970 + (float)((float)(1.0 - v2970) * 0.25)), (float)((float)(v3024 * 0.66667) + 0.33333), (float)(v2989 * 0.6));

        uint64_t v1904 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v1900, v1901, v1902, v1903, 2.0, v3007, v3005, 0.100000001);

        v3010 = objc_msgSend_kernelWithName_(V8LNRKernels, v1905, @"smoothDSharpenAntiBloom", v1906, v1907);

        v1908 = (void *)v1899;
        objc_msgSend_extent(v3131, v1909, v1910, v1911, v1912);
        CGRect v3347 = CGRectInset(v3346, -4.0, -4.0);
        CGFloat v1913 = v3347.origin.x;
        CGFloat v1914 = v3347.origin.y;
        CGFloat v1915 = v3347.size.width;
        CGFloat v1916 = v3347.size.height;
        objc_msgSend_extent(v3128, v1917, v1918, v1919, v1920);
        v3460.origin.double x = v1921;
        v3460.origin.double y = v1922;
        v3460.size.double width = v1923;
        v3460.size.double height = v1924;
        v3348.origin.double x = v1913;
        v3348.origin.double y = v1914;
        v3348.size.double width = v1915;
        v3348.size.double height = v1916;
        CGRect v3349 = CGRectUnion(v3348, v3460);
        double v1925 = v3349.origin.x;
        double v1926 = v3349.origin.y;
        double v1927 = v3349.size.width;
        double v1928 = v3349.size.height;
        v3258[0] = v3131;
        v3258[1] = v3128;
        v3258[2] = v1899;
        v3258[3] = v1904;
        v1931 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1929, (uint64_t)v3258, 4, v1930);
        v1934 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v3010, v1932, (uint64_t)&unk_1F3986220, (uint64_t)v1931, v1933, v1925, v1926, v1927, v1928);

        v1935 = v1908;
        v1936 = (void *)v1904;
        uint64_t v1941 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v1937, v1938, v1939, v1940, 4.0, (float)(v2970 + (float)((float)(1.0 - v2970) * 0.5)), (float)((float)(v3024 * 0.33333) + 0.66667), (float)((float)(v2989 * 0.6) * 0.6));

        v1942 = v1936;
        uint64_t v1947 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v1943, v1944, v1945, v1946, 3.0, v3007, v3005, 0.100000001);

        v3091 = objc_msgSend_kernelWithName_(V8LNRKernels, v1948, @"smoothDSharpenAntiBloom", v1949, v1950);

        objc_msgSend_extent(v1934, v1951, v1952, v1953, v1954);
        CGRect v3351 = CGRectInset(v3350, -8.0, -8.0);
        CGFloat v1955 = v3351.origin.x;
        CGFloat v1956 = v3351.origin.y;
        CGFloat v1957 = v3351.size.width;
        CGFloat v1958 = v3351.size.height;
        objc_msgSend_extent(v3128, v1959, v1960, v1961, v1962);
        v3461.origin.double x = v1963;
        v3461.origin.double y = v1964;
        v3461.size.double width = v1965;
        v3461.size.double height = v1966;
        v3352.origin.double x = v1955;
        v3352.origin.double y = v1956;
        v3352.size.double width = v1957;
        v3352.size.double height = v1958;
        CGRect v3353 = CGRectUnion(v3352, v3461);
        double v1967 = v3353.origin.x;
        double v1968 = v3353.origin.y;
        double v1969 = v3353.size.width;
        double v1970 = v3353.size.height;
        v3257[0] = v1934;
        v3257[1] = v3128;
        v3257[2] = v1941;
        v3257[3] = v1947;
        v1973 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v1971, (uint64_t)v3257, 4, v1972);
        objc_msgSend_applyWithExtent_roiCallback_arguments_(v3091, v1974, (uint64_t)&unk_1F3986240, (uint64_t)v1973, v1975, v1967, v1968, v1969, v1970);
        id v3130 = (id)objc_claimAutoreleasedReturnValue();

        v3071 = (void *)v1947;
        v3072 = (void *)v1941;
      }
      float v2010 = (float)(v3043 + -0.00003) / 0.00004;
      float v2011 = 0.0;
      if (v2010 >= 0.0)
      {
        float v2011 = (float)(v3043 + -0.00003) / 0.00004;
        if (v2010 > 1.0) {
          float v2011 = 1.0;
        }
      }
      float v3178 = v2011;
      v2007 = objc_msgSend_kernelWithName_(V8LNRKernels, v1976, @"expandPlusDThruG", v1977, v1978);

      objc_msgSend_extent(v3074, v2012, v2013, v2014, v2015);
      CGFloat v3172 = v2016;
      CGFloat v3167 = v2017;
      CGFloat v3162 = v2018;
      CGFloat r1b = v2019;
      objc_msgSend_extent(v3130, v2020, v2021, v2022, v2023);
      CGFloat v2025 = v2024;
      CGFloat v2027 = v2026;
      CGFloat v2029 = v2028;
      CGFloat v2031 = v2030;
      objc_msgSend_extent(v3128, v2032, v2033, v2034, v2035);
      CGFloat v2037 = v2036;
      CGFloat v2039 = v2038;
      CGFloat v2041 = v2040;
      CGFloat v2043 = v2042;
      objc_msgSend_extent(v3112, v2044, v2045, v2046, v2047);
      CGAffineTransform v3212 = v3227;
      CGRect v3359 = CGRectApplyAffineTransform(v3358, &v3212);
      CGRect v3463 = CGRectInset(v3359, -1.0, -1.0);
      v3360.origin.double x = v2037;
      v3360.origin.double y = v2039;
      v3360.size.double width = v2041;
      v3360.size.double height = v2043;
      CGRect v3464 = CGRectUnion(v3360, v3463);
      v3361.origin.double x = v2025;
      v3361.origin.double y = v2027;
      v3361.size.double width = v2029;
      v3361.size.double height = v2031;
      CGRect v3465 = CGRectUnion(v3361, v3464);
      v3362.origin.double x = v3172;
      v3362.origin.double y = v3167;
      v3362.size.double width = v3162;
      v3362.size.double height = r1b;
      CGRect v3363 = CGRectUnion(v3362, v3465);
      double v2048 = v3363.origin.x;
      double v2049 = v3363.origin.y;
      double v2050 = v3363.size.width;
      double v2051 = v3363.size.height;
      *(float *)&v3363.origin.double x = fminf(v3026 / 0.5625, 1.0);
      v3256[0] = v3112;
      v3256[1] = v3074;
      v3256[2] = v3130;
      v3256[3] = v3128;
      v2003 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2052, v2053, v2054, v2055, 0.0, v2979, *(float *)&v3363.origin.x, (float)((float)((float)(v3026 * 0.75) * 0.75)+ (float)((float)(*(float *)&v3363.origin.x - (float)((float)(v3026 * 0.75) * 0.75)) * v3178)));
      v3256[4] = v2003;
      v2006 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2056, v2057, v2058, v2059, (float)(v2986 * 0.0005), (float)(v2986 * 0.0015), (float)(v2986 * 0.001), 0.0);
      v3256[5] = v2006;
      v2064 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2060, v2061, v2062, v2063, v2962, v2961, 0.0, 0.0);
      v3256[6] = v2064;
      v2067 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2065, (uint64_t)v3256, 7, v2066);
      v3133 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v2007, v2068, (uint64_t)&unk_1F3986260, (uint64_t)v2067, v2069, v2048, v2049, v2050, v2051);

      v3139 = v3058;
    }

    *(float *)&double v2073 = v2980 * v3061;
    LODWORD(v2074) = 925353388;
    float v3011 = v2980 * v3061;
    if ((float)(v2980 * v3061) <= 0.00001)
    {
      v3097 = objc_msgSend_kernelWithName_(V8LNRKernels, v2070, @"expandPlusDWithOverdrive", v2071, v2072, v2074, v2073);

      objc_msgSend_extent(v3070, v2353, v2354, v2355, v2356);
      CGFloat v2358 = v2357;
      CGFloat v2360 = v2359;
      CGFloat v2362 = v2361;
      CGFloat v2364 = v2363;
      objc_msgSend_extent(v3133, v2365, v2366, v2367, v2368);
      CGAffineTransform v3209 = v3227;
      CGRect v3391 = CGRectApplyAffineTransform(v3390, &v3209);
      CGRect v3471 = CGRectInset(v3391, -1.0, -1.0);
      v3392.origin.double x = v2358;
      v3392.origin.double y = v2360;
      v3392.size.double width = v2362;
      v3392.size.double height = v2364;
      CGRect v3393 = CGRectUnion(v3392, v3471);
      double v2369 = v3393.origin.x;
      double v2370 = v3393.origin.y;
      double v2371 = v3393.size.width;
      double v2372 = v3393.size.height;
      v3244[0] = v3133;
      v3244[1] = v3070;
      *(float *)&v3393.origin.double x = v2978;
      v2377 = objc_msgSend_numberWithFloat_(NSNumber, v2373, v2374, v2375, v2376, v3393.origin.x);
      v3244[2] = v2377;
      v2380 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2378, (uint64_t)v3244, 3, v2379);
      v1253 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v3097, v2381, (uint64_t)&unk_1F39863C0, (uint64_t)v2380, v2382, v2369, v2370, v2371, v2372);
      v3042 = 0;
      v3153 = 0;
      v3032 = 0;
      v3144 = 0;
      v3142 = 0;
      id v3176 = 0;
      v3056 = v3139;
    }
    else
    {
      v3093 = objc_msgSend_kernelWithName_(V8LNRKernels, v2070, @"gaborToVF", v2071, v2072, v2074, v2073);

      objc_msgSend_extent(v3065, v2075, v2076, v2077, v2078);
      CGRect v3365 = CGRectInset(v3364, -3.0, -3.0);
      double v2079 = v3365.origin.x;
      double v2080 = v3365.origin.y;
      double v2081 = v3365.size.width;
      double v2082 = v3365.size.height;
      v3254 = v3065;
      v2085 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2083, (uint64_t)&v3254, 1, v2084);
      v3142 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v3093, v2086, (uint64_t)&unk_1F39862A0, (uint64_t)v2085, v2087, v2079, v2080, v2081, v2082);

      v3042 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2088, v2089, v2090, v2091, (float)(v2964 * v3061), v3011, (float)(v2963 * v3061), 0.0);
      v2095 = objc_msgSend_kernelWithName_(V8LNRKernels, v2092, @"smoothVF", v2093, v2094);

      objc_msgSend_extent(v3142, v2096, v2097, v2098, v2099);
      CGRect v3367 = CGRectInset(v3366, -3.0, -3.0);
      double v2100 = v3367.origin.x;
      double v2101 = v3367.origin.y;
      double v2102 = v3367.size.width;
      double v2103 = v3367.size.height;
      v3253 = v3142;
      v2106 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2104, (uint64_t)&v3253, 1, v2105);
      v3144 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v2095, v2107, (uint64_t)&unk_1F39862C0, (uint64_t)v2106, v2108, v2100, v2101, v2102, v2103);

      v3056 = objc_msgSend_kernelWithName_(V8LNRKernels, v2109, @"VFToGDIR", v2110, v2111);

      objc_msgSend_extent(v3144, v2112, v2113, v2114, v2115);
      double v2117 = v2116;
      double v2119 = v2118;
      double v2121 = v2120;
      double v2123 = v2122;
      v3252 = v3144;
      v2126 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2124, (uint64_t)&v3252, 1, v2125);
      v2130 = objc_msgSend_applyWithExtent_arguments_(v3056, v2127, (uint64_t)v2126, v2128, v2129, v2117, v2119, v2121, v2123);

      v3094 = objc_msgSend_kernelWithName_(V8LNRKernels, v2131, @"DIRToC", v2132, v2133);

      objc_msgSend_extent(v2130, v2134, v2135, v2136, v2137);
      CGRect v3369 = CGRectInset(v3368, -8.0, -8.0);
      double v2138 = v3369.origin.x;
      double v2139 = v3369.origin.y;
      double v2140 = v3369.size.width;
      double v2141 = v3369.size.height;
      v3251[0] = v2130;
      v3251[1] = v3065;
      v2146 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2142, v2143, v2144, v2145, (float)(v3033 + (float)(v2969 * v3013)), (float)(v3031 + (float)(v2969 * v3012)), (float)(v3014 + (float)(v2969 * v3008)), 0.0);
      v3251[2] = v2146;
      v2149 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2147, (uint64_t)v3251, 3, v2148);
      v3032 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v3094, v2150, (uint64_t)&unk_1F39862E0, (uint64_t)v2149, v2151, v2138, v2139, v2140, v2141);

      v2155 = objc_msgSend_kernelWithName_(V8LNRKernels, v2152, @"annealGAndC", v2153, v2154);

      objc_msgSend_extent(v3032, v2156, v2157, v2158, v2159);
      CGRect v3371 = CGRectInset(v3370, -1.0, -1.0);
      CGFloat v2160 = v3371.origin.x;
      CGFloat v2161 = v3371.origin.y;
      CGFloat v2162 = v3371.size.width;
      CGFloat v2163 = v3371.size.height;
      objc_msgSend_extent(v3065, v2164, v2165, v2166, v2167);
      v3466.origin.double x = v2168;
      v3466.origin.double y = v2169;
      v3466.size.double width = v2170;
      v3466.size.double height = v2171;
      v3372.origin.double x = v2160;
      v3372.origin.double y = v2161;
      v3372.size.double width = v2162;
      v3372.size.double height = v2163;
      CGRect v3373 = CGRectUnion(v3372, v3466);
      double v2172 = v3373.origin.x;
      double v2173 = v3373.origin.y;
      double v2174 = v3373.size.width;
      double v2175 = v3373.size.height;
      v3250[0] = v3032;
      v3250[1] = v3065;
      v3250[2] = v3042;
      *(float *)&v3373.origin.double x = v2990;
      v2180 = objc_msgSend_numberWithFloat_(NSNumber, v2176, v2177, v2178, v2179, v3373.origin.x);
      v3250[3] = v2180;
      v2183 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2181, (uint64_t)v3250, 4, v2182);
      v3153 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v2155, v2184, (uint64_t)&unk_1F3986300, (uint64_t)v2183, v2185, v2172, v2173, v2174, v2175);

      if (v3038 <= 1.7)
      {
        id v3176 = v3070;
      }
      else
      {
        v3095 = objc_msgSend_kernelWithName_(V8LNRKernels, v2186, @"smoothDSharpen", v2187, v2188);

        v2193 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2189, v2190, v2191, v2192, 1.0, v2976, v3024, v2989);

        double v3063 = (float)(v3001 * 0.75);
        double v3039 = (float)(2.0 / v3001);
        v2198 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2194, v2195, v2196, v2197, 1.0);

        objc_msgSend_extent(v3070, v2199, v2200, v2201, v2202);
        CGRect v3375 = CGRectInset(v3374, -2.0, -2.0);
        CGFloat v2203 = v3375.origin.x;
        CGFloat v2204 = v3375.origin.y;
        CGFloat v2205 = v3375.size.width;
        CGFloat v2206 = v3375.size.height;
        objc_msgSend_extent(v3153, v2207, v2208, v2209, v2210);
        v3467.origin.double x = v2211;
        v3467.origin.double y = v2212;
        v3467.size.double width = v2213;
        v3467.size.double height = v2214;
        v3376.origin.double x = v2203;
        v3376.origin.double y = v2204;
        v3376.size.double width = v2205;
        v3376.size.double height = v2206;
        CGRect v3377 = CGRectUnion(v3376, v3467);
        double v2215 = v3377.origin.x;
        double v2216 = v3377.origin.y;
        double v2217 = v3377.size.width;
        double v2218 = v3377.size.height;
        v3249[0] = v3070;
        v3249[1] = v3153;
        v3249[2] = v2193;
        v3249[3] = v2198;
        v2221 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2219, (uint64_t)v3249, 4, v2220);
        v3179 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v3095, v2222, (uint64_t)&unk_1F3986320, (uint64_t)v2221, v2223, v2215, v2216, v2217, v2218);

        v3015 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2224, v2225, v2226, v2227, 2.0, (float)(v2976 + (float)((float)(1.0 - v2976) * 0.25)), (float)((float)(v3024 * 0.66667) + 0.33333), (float)(v2989 * 0.6));

        uint64_t v2232 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2228, v2229, v2230, v2231, 2.0, v3063, v3039, 0.0);

        v2236 = objc_msgSend_kernelWithName_(V8LNRKernels, v2233, @"smoothDSharpen", v2234, v2235);

        v2237 = (void *)v2232;
        objc_msgSend_extent(v3179, v2238, v2239, v2240, v2241);
        CGRect v3379 = CGRectInset(v3378, -4.0, -4.0);
        CGFloat v2242 = v3379.origin.x;
        CGFloat v2243 = v3379.origin.y;
        CGFloat v2244 = v3379.size.width;
        CGFloat v2245 = v3379.size.height;
        objc_msgSend_extent(v3153, v2246, v2247, v2248, v2249);
        v3468.origin.double x = v2250;
        v3468.origin.double y = v2251;
        v3468.size.double width = v2252;
        v3468.size.double height = v2253;
        v3380.origin.double x = v2242;
        v3380.origin.double y = v2243;
        v3380.size.double width = v2244;
        v3380.size.double height = v2245;
        CGRect v3381 = CGRectUnion(v3380, v3468);
        double v2254 = v3381.origin.x;
        double v2255 = v3381.origin.y;
        double v2256 = v3381.size.width;
        double v2257 = v3381.size.height;
        v3248[0] = v3179;
        v3248[1] = v3153;
        v3248[2] = v3015;
        v3248[3] = v2232;
        v2260 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2258, (uint64_t)v3248, 4, v2259);
        v2261 = v2237;
        uint64_t v2264 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v2236, v2262, (uint64_t)&unk_1F3986340, (uint64_t)v2260, v2263, v2254, v2255, v2256, v2257);

        float v2265 = (float)(v2989 * 0.6) * 0.6;
        v2266 = v2236;
        uint64_t v2271 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2267, v2268, v2269, v2270, 4.0, (float)(v2976 + (float)((float)(1.0 - v2976) * 0.5)), (float)((float)(v3024 * 0.33333) + 0.66667), v2265);

        v3016 = (void *)v2271;
        v2272 = (void *)v2264;
        uint64_t v2277 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2273, v2274, v2275, v2276, 3.0, v3063, v3039, 0.0);

        uint64_t v2278 = v2277;
        v2279 = v2272;
        v3096 = objc_msgSend_kernelWithName_(V8LNRKernels, v2280, @"smoothDSharpen", v2281, v2282);

        objc_msgSend_extent(v2272, v2283, v2284, v2285, v2286);
        CGRect v3383 = CGRectInset(v3382, -8.0, -8.0);
        CGFloat v2287 = v3383.origin.x;
        CGFloat v2288 = v3383.origin.y;
        CGFloat v2289 = v3383.size.width;
        CGFloat v2290 = v3383.size.height;
        objc_msgSend_extent(v3153, v2291, v2292, v2293, v2294);
        v3469.origin.double x = v2295;
        v3469.origin.double y = v2296;
        v3469.size.double width = v2297;
        v3469.size.double height = v2298;
        v3384.origin.double x = v2287;
        v3384.origin.double y = v2288;
        v3384.size.double width = v2289;
        v3384.size.double height = v2290;
        CGRect v3385 = CGRectUnion(v3384, v3469);
        double v2299 = v3385.origin.x;
        double v2300 = v3385.origin.y;
        double v2301 = v3385.size.width;
        double v2302 = v3385.size.height;
        v3247[0] = v2272;
        v3247[1] = v3153;
        v3247[2] = v3016;
        v3247[3] = v2278;
        v2305 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2303, (uint64_t)v3247, 4, v2304);
        v3180 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v3096, v2306, (uint64_t)&unk_1F3986360, (uint64_t)v2305, v2307, v2299, v2300, v2301, v2302);

        v2308 = (void *)v2278;
        uint64_t v2313 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2309, v2310, v2311, v2312, 8.0, (float)(v2976 + (float)((float)(1.0 - v2976) * 0.75)), 1.0, (float)(v2265 * 0.6));

        v2314 = v2308;
        v2315 = (void *)v2313;
        uint64_t v2320 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2316, v2317, v2318, v2319, 4.0, v3063, v3039, 0.0);

        v2155 = objc_msgSend_kernelWithName_(V8LNRKernels, v2321, @"smoothDSharpen", v2322, v2323);

        objc_msgSend_extent(v3180, v2324, v2325, v2326, v2327);
        CGRect v3387 = CGRectInset(v3386, -16.0, -16.0);
        CGFloat v2328 = v3387.origin.x;
        CGFloat v2329 = v3387.origin.y;
        CGFloat v2330 = v3387.size.width;
        CGFloat v2331 = v3387.size.height;
        objc_msgSend_extent(v3153, v2332, v2333, v2334, v2335);
        v3470.origin.double x = v2336;
        v3470.origin.double y = v2337;
        v3470.size.double width = v2338;
        v3470.size.double height = v2339;
        v3388.origin.double x = v2328;
        v3388.origin.double y = v2329;
        v3388.size.double width = v2330;
        v3388.size.double height = v2331;
        CGRect v3389 = CGRectUnion(v3388, v3470);
        double v2340 = v3389.origin.x;
        double v2341 = v3389.origin.y;
        double v2342 = v3389.size.width;
        double v2343 = v3389.size.height;
        v3246[0] = v3180;
        v3246[1] = v3153;
        v3246[2] = v2315;
        v3246[3] = v2320;
        v2346 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2344, (uint64_t)v3246, 4, v2345);
        uint64_t v2349 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v2155, v2347, (uint64_t)&unk_1F3986380, (uint64_t)v2346, v2348, v2340, v2341, v2342, v2343);

        v3071 = (void *)v2320;
        v3072 = v2315;
        id v3176 = (id)v2349;
      }
      float v2383 = (float)(v3011 + -0.00003) / 0.00004;
      float v2384 = 0.0;
      if (v2383 >= 0.0)
      {
        float v2384 = (float)(v3011 + -0.00003) / 0.00004;
        if (v2383 > 1.0) {
          float v2384 = 1.0;
        }
      }
      float v3173 = v2384;
      v3097 = objc_msgSend_kernelWithName_(V8LNRKernels, v2350, @"expandPlusDThruG", v2351, v2352);

      objc_msgSend_extent(v3070, v2385, v2386, v2387, v2388);
      CGFloat v3168 = v2389;
      CGFloat v3163 = v2390;
      CGFloat r1c = v2391;
      CGFloat v3149 = v2392;
      objc_msgSend_extent(v3176, v2393, v2394, v2395, v2396);
      CGFloat v2398 = v2397;
      CGFloat v2400 = v2399;
      CGFloat v2402 = v2401;
      CGFloat v2404 = v2403;
      objc_msgSend_extent(v3153, v2405, v2406, v2407, v2408);
      CGFloat v2410 = v2409;
      CGFloat v2412 = v2411;
      CGFloat v2414 = v2413;
      CGFloat v2416 = v2415;
      objc_msgSend_extent(v3133, v2417, v2418, v2419, v2420);
      CGAffineTransform v3210 = v3227;
      CGRect v3395 = CGRectApplyAffineTransform(v3394, &v3210);
      CGRect v3472 = CGRectInset(v3395, -1.0, -1.0);
      v3396.origin.double x = v2410;
      v3396.origin.double y = v2412;
      v3396.size.double width = v2414;
      v3396.size.double height = v2416;
      CGRect v3473 = CGRectUnion(v3396, v3472);
      v3397.origin.double x = v2398;
      v3397.origin.double y = v2400;
      v3397.size.double width = v2402;
      v3397.size.double height = v2404;
      CGRect v3474 = CGRectUnion(v3397, v3473);
      v3398.origin.double x = v3168;
      v3398.origin.double y = v3163;
      v3398.size.double width = r1c;
      v3398.size.double height = v3149;
      CGRect v3399 = CGRectUnion(v3398, v3474);
      double v2421 = v3399.origin.x;
      double v2422 = v3399.origin.y;
      double v2423 = v3399.size.width;
      double v2424 = v3399.size.height;
      *(float *)&v3399.size.double width = fminf(v3026 / 0.75, 1.0);
      v3245[0] = v3133;
      v3245[1] = v3070;
      v3245[2] = v3176;
      v3245[3] = v3153;
      v2377 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2425, v2426, v2427, v2428, 0.0, v2978, *(float *)&v3399.size.width, (float)((float)(v3026 * 0.75) + (float)((float)(*(float *)&v3399.size.width - (float)(v3026 * 0.75)) * v3173)));
      v3245[4] = v2377;
      v2380 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2429, v2430, v2431, v2432, (float)(v2986 * 0.0007), (float)(v2986 * 0.0021), (float)(v2986 * 0.0014), 0.0);
      v3245[5] = v2380;
      v2437 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2433, v2434, v2435, v2436, v2960, v2959, 0.0, 0.0);
      v3245[6] = v2437;
      v2440 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2438, (uint64_t)v3245, 7, v2439);
      v1253 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v3097, v2441, (uint64_t)&unk_1F39863A0, (uint64_t)v2440, v2442, v2421, v2422, v2423, v2424);
    }
    float v2446 = (float)(1.0 / v3059) * 0.00175;
    float v3174 = v3046 * v2977;
    float v3164 = 1.0 / (float)((float)((float)((float)(1.0 / v3059) * 0.014) / v2446) + -1.0);
    float v3169 = v2446 * (float)(v3164 + 1.0);
    if (v2984 <= 0.00001)
    {
      if ((float)(v3046 * v2977) <= 0.0)
      {
        v3045 = 0;
      }
      else
      {
        v2717 = objc_msgSend_kernelWithName_(V8LNRKernels, v2443, @"FGN", v2444, v2445);

        objc_msgSend_extent(v3066, v2718, v2719, v2720, v2721);
        CGRect v3427 = CGRectInset(v3426, -2.0, -2.0);
        double v2722 = v3427.origin.x;
        double v2723 = v3427.origin.y;
        double v2724 = v3427.size.width;
        double v2725 = v3427.size.height;
        v3233 = v3066;
        v2728 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2726, (uint64_t)&v3233, 1, v2727);
        v3045 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v2717, v2729, (uint64_t)&unk_1F3986500, (uint64_t)v2728, v2730, v2722, v2723, v2724, v2725);

        v3097 = v2717;
      }
      v2731 = objc_msgSend_kernelWithName_(V8LNRKernels, v2443, @"annealG", v2444, v2445);

      objc_msgSend_extent(v3064, v2732, v2733, v2734, v2735);
      CGRect v3429 = CGRectInset(v3428, -1.0, -1.0);
      CGFloat v2736 = v3429.origin.x;
      CGFloat v2737 = v3429.origin.y;
      CGFloat v2738 = v3429.size.width;
      CGFloat v2739 = v3429.size.height;
      objc_msgSend_extent(v3064, v2740, v2741, v2742, v2743);
      v3480.origin.double x = v2744;
      v3480.origin.double y = v2745;
      v3480.size.double width = v2746;
      v3480.size.double height = v2747;
      v3430.origin.double x = v2736;
      v3430.origin.double y = v2737;
      v3430.size.double width = v2738;
      v3430.size.double height = v2739;
      CGRect v3431 = CGRectUnion(v3430, v3480);
      double v2748 = v3431.origin.x;
      double v2749 = v3431.origin.y;
      double v2750 = v3431.size.width;
      double v2751 = v3431.size.height;
      v3232[0] = v3064;
      v3232[1] = v3064;
      v3232[2] = v3123;
      v2754 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2752, (uint64_t)v3232, 3, v2753);
      v1254 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v2731, v2755, (uint64_t)&unk_1F3986520, (uint64_t)v2754, v2756, v2748, v2749, v2750, v2751);

      v2760 = objc_msgSend_kernelWithName_(V8LNRKernels, v2757, @"expandPlusDThruG2", v2758, v2759);

      objc_msgSend_extent(v1254, v2761, v2762, v2763, v2764);
      CGFloat v2766 = v2765;
      CGFloat v2768 = v2767;
      CGFloat v2770 = v2769;
      CGFloat v2772 = v2771;
      objc_msgSend_extent(v3066, v2773, v2774, v2775, v2776);
      CGFloat v2778 = v2777;
      CGFloat v2780 = v2779;
      CGFloat v2782 = v2781;
      CGFloat v2784 = v2783;
      objc_msgSend_extent(v1253, v2785, v2786, v2787, v2788);
      CGAffineTransform v3207 = v3227;
      CGRect v3433 = CGRectApplyAffineTransform(v3432, &v3207);
      CGRect v3481 = CGRectInset(v3433, -1.0, -1.0);
      v3434.origin.double x = v2778;
      v3434.origin.double y = v2780;
      v3434.size.double width = v2782;
      v3434.size.double height = v2784;
      CGRect v3482 = CGRectUnion(v3434, v3481);
      v3435.origin.double x = v2766;
      v3435.origin.double y = v2768;
      v3435.size.double width = v2770;
      v3435.size.double height = v2772;
      CGRect v3436 = CGRectUnion(v3435, v3482);
      double v2789 = v3436.origin.x;
      double v2790 = v3436.origin.y;
      double v2791 = v3436.size.width;
      double v2792 = v3436.size.height;
      v3231[0] = v1253;
      v3231[1] = v3066;
      v3231[2] = v1254;
      v2797 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2793, v2794, v2795, v2796, v2987, 1.0, v3169, v3164);
      v3231[3] = v2797;
      v2802 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2798, v2799, v2800, v2801, (float)(v2986 * 0.004), (float)(v2986 * 0.012), (float)(v2986 * 0.008), 0.0);
      v3231[4] = v2802;
      v2807 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2803, v2804, v2805, v2806, v2975, v3025, 0.0, 0.0);
      v3231[5] = v2807;
      v2810 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2808, (uint64_t)v3231, 6, v2809);
      v2813 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v2760, v2811, (uint64_t)&unk_1F3986540, (uint64_t)v2810, v2812, v2789, v2790, v2791, v2792);
      v3037 = 0;
      v3034 = 0;
      v3047 = 0;
    }
    else
    {
      v2447 = objc_msgSend_kernelWithName_(V8LNRKernels, v2443, @"smoothVF", v2444, v2445);

      objc_msgSend_extent(v3064, v2448, v2449, v2450, v2451);
      CGRect v3401 = CGRectInset(v3400, -3.0, -3.0);
      double v2452 = v3401.origin.x;
      double v2453 = v3401.origin.y;
      double v2454 = v3401.size.width;
      double v2455 = v3401.size.height;
      id v3243 = v3064;
      v2458 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2456, (uint64_t)&v3243, 1, v2457);
      v3034 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v2447, v2459, (uint64_t)&unk_1F39863E0, (uint64_t)v2458, v2460, v2452, v2453, v2454, v2455);

      uint64_t v2464 = objc_msgSend_kernelWithName_(V8LNRKernels, v2461, @"VFToGDIR", v2462, v2463);

      v3056 = (void *)v2464;
      objc_msgSend_extent(v3034, v2465, v2466, v2467, v2468);
      double v2470 = v2469;
      double v2472 = v2471;
      double v2474 = v2473;
      double v2476 = v2475;
      v3242 = v3034;
      v2479 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2477, (uint64_t)&v3242, 1, v2478);
      v3040 = objc_msgSend_applyWithExtent_arguments_(v3056, v2480, (uint64_t)v2479, v2481, v2482, v2470, v2472, v2474, v2476);

      v2486 = objc_msgSend_kernelWithName_(V8LNRKernels, v2483, @"DIRToC", v2484, v2485);

      objc_msgSend_extent(v3040, v2487, v2488, v2489, v2490);
      CGRect v3403 = CGRectInset(v3402, -8.0, -8.0);
      double v2491 = v3403.origin.x;
      double v2492 = v3403.origin.y;
      double v2493 = v3403.size.width;
      double v2494 = v3403.size.height;
      v3241[0] = v3040;
      v3241[1] = v3064;
      v2499 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2495, v2496, v2497, v2498, (float)(v3022 + (float)(v3023 * v3019)), (float)(v3021 + (float)(v3023 * v3018)), (float)(v3020 + (float)(v3023 * v3017)), 0.0);
      v3241[2] = v2499;
      v2502 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2500, (uint64_t)v3241, 3, v2501);
      v2505 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v2486, v2503, (uint64_t)&unk_1F3986400, (uint64_t)v2502, v2504, v2491, v2492, v2493, v2494);

      v3037 = v2505;
      v2509 = objc_msgSend_kernelWithName_(V8LNRKernels, v2506, @"annealGAndC", v2507, v2508);

      objc_msgSend_extent(v2505, v2510, v2511, v2512, v2513);
      CGRect v3405 = CGRectInset(v3404, -1.0, -1.0);
      CGFloat v2514 = v3405.origin.x;
      CGFloat v2515 = v3405.origin.y;
      CGFloat v2516 = v3405.size.width;
      CGFloat v2517 = v3405.size.height;
      objc_msgSend_extent(v3064, v2518, v2519, v2520, v2521);
      v3475.origin.double x = v2522;
      v3475.origin.double y = v2523;
      v3475.size.double width = v2524;
      v3475.size.double height = v2525;
      v3406.origin.double x = v2514;
      v3406.origin.double y = v2515;
      v3406.size.double width = v2516;
      v3406.size.double height = v2517;
      CGRect v3407 = CGRectUnion(v3406, v3475);
      double v2526 = v3407.origin.x;
      double v2527 = v3407.origin.y;
      CGFloat v2528 = v3407.size.width;
      double v2529 = v3407.size.height;
      v3240[0] = v2505;
      v3240[1] = v3064;
      v3240[2] = v3123;
      *(float *)&v3407.origin.double x = v2990;
      v2534 = objc_msgSend_numberWithFloat_(NSNumber, v2530, v2531, v2532, v2533, v3407.origin.x);
      v3240[3] = v2534;
      v2537 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2535, (uint64_t)v3240, 4, v2536);
      v1254 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v2509, v2538, (uint64_t)&unk_1F3986420, (uint64_t)v2537, v2539, v2526, v2527, v2528, v2529);

      v2543 = objc_msgSend_kernelWithName_(V8LNRKernels, v2540, @"smoothDSharpen", v2541, v2542);

      v2548 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2544, v2545, v2546, v2547, 1.0, v2988, v3024, v2989);

      double r1d = (float)(v3001 * 0.75);
      double v3150 = (float)(2.0 / v3001);
      v2553 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2549, v2550, v2551, v2552, 1.0);

      objc_msgSend_extent(v3066, v2554, v2555, v2556, v2557);
      CGRect v3409 = CGRectInset(v3408, -2.0, -2.0);
      CGFloat v2558 = v3409.origin.x;
      CGFloat v2559 = v3409.origin.y;
      CGFloat v2560 = v3409.size.width;
      CGFloat v2561 = v3409.size.height;
      objc_msgSend_extent(v1254, v2562, v2563, v2564, v2565);
      v3476.origin.double x = v2566;
      v3476.origin.double y = v2567;
      v3476.size.double width = v2568;
      v3476.size.double height = v2569;
      v3410.origin.double x = v2558;
      v3410.origin.double y = v2559;
      v3410.size.double width = v2560;
      v3410.size.double height = v2561;
      CGRect v3411 = CGRectUnion(v3410, v3476);
      double v2570 = v3411.origin.x;
      double v2571 = v3411.origin.y;
      double v2572 = v3411.size.width;
      double v2573 = v3411.size.height;
      v3239[0] = v3066;
      v3239[1] = v1254;
      v3239[2] = v2548;
      v3239[3] = v2553;
      v2576 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2574, (uint64_t)v3239, 4, v2575);
      v3048 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v2543, v2577, (uint64_t)&unk_1F3986440, (uint64_t)v2576, v2578, v2570, v2571, v2572, v2573);

      v2583 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2579, v2580, v2581, v2582, 2.0, (float)(v2988 + (float)((float)(1.0 - v2988) * 0.25)), (float)((float)(v3024 * 0.66667) + 0.33333), (float)(v2989 * 0.6));

      v2588 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2584, v2585, v2586, v2587, 2.0, r1d, v3150, 0.0);

      v2592 = objc_msgSend_kernelWithName_(V8LNRKernels, v2589, @"smoothDSharpen", v2590, v2591);

      objc_msgSend_extent(v3048, v2593, v2594, v2595, v2596);
      CGRect v3413 = CGRectInset(v3412, -4.0, -4.0);
      CGFloat v2597 = v3413.origin.x;
      CGFloat v2598 = v3413.origin.y;
      CGFloat v2599 = v3413.size.width;
      CGFloat v2600 = v3413.size.height;
      objc_msgSend_extent(v1254, v2601, v2602, v2603, v2604);
      v3477.origin.double x = v2605;
      v3477.origin.double y = v2606;
      v3477.size.double width = v2607;
      v3477.size.double height = v2608;
      v3414.origin.double x = v2597;
      v3414.origin.double y = v2598;
      v3414.size.double width = v2599;
      v3414.size.double height = v2600;
      CGRect v3415 = CGRectUnion(v3414, v3477);
      double v2609 = v3415.origin.x;
      double v2610 = v3415.origin.y;
      double v2611 = v3415.size.width;
      double v2612 = v3415.size.height;
      v3238[0] = v3048;
      v3238[1] = v1254;
      v3238[2] = v2583;
      v3238[3] = v2588;
      v2615 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2613, (uint64_t)v3238, 4, v2614);
      v2618 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v2592, v2616, (uint64_t)&unk_1F3986460, (uint64_t)v2615, v2617, v2609, v2610, v2611, v2612);

      *(float *)&CGFloat v2528 = (float)(v2989 * 0.6) * 0.6;
      v2623 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2619, v2620, v2621, v2622, 4.0, (float)(v2988 + (float)((float)(1.0 - v2988) * 0.5)), (float)((float)(v3024 * 0.33333) + 0.66667), *(float *)&v2528);

      v2628 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2624, v2625, v2626, v2627, 3.0, r1d, v3150, 0.0);

      v2632 = objc_msgSend_kernelWithName_(V8LNRKernels, v2629, @"smoothDSharpen", v2630, v2631);

      objc_msgSend_extent(v2618, v2633, v2634, v2635, v2636);
      CGRect v3417 = CGRectInset(v3416, -8.0, -8.0);
      CGFloat v2637 = v3417.origin.x;
      CGFloat v2638 = v3417.origin.y;
      CGFloat v2639 = v3417.size.width;
      CGFloat v2640 = v3417.size.height;
      objc_msgSend_extent(v1254, v2641, v2642, v2643, v2644);
      v3478.origin.double x = v2645;
      v3478.origin.double y = v2646;
      v3478.size.double width = v2647;
      v3478.size.double height = v2648;
      v3418.origin.double x = v2637;
      v3418.origin.double y = v2638;
      v3418.size.double width = v2639;
      v3418.size.double height = v2640;
      CGRect v3419 = CGRectUnion(v3418, v3478);
      double v2649 = v3419.origin.x;
      double v2650 = v3419.origin.y;
      double v2651 = v3419.size.width;
      double v2652 = v3419.size.height;
      v3237[0] = v2618;
      v3237[1] = v1254;
      v3237[2] = v2623;
      v3237[3] = v2628;
      v2655 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2653, (uint64_t)v3237, 4, v2654);
      v3049 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v2632, v2656, (uint64_t)&unk_1F3986480, (uint64_t)v2655, v2657, v2649, v2650, v2651, v2652);

      uint64_t v2662 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2658, v2659, v2660, v2661, 8.0, (float)(v2988 + (float)((float)(1.0 - v2988) * 0.75)), 1.0, (float)(*(float *)&v2528 * 0.6));

      v3072 = (void *)v2662;
      uint64_t v2667 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2663, v2664, v2665, v2666, 4.0, r1d, v3150, 0.0);

      v3071 = (void *)v2667;
      v2671 = objc_msgSend_kernelWithName_(V8LNRKernels, v2668, @"smoothDSharpen", v2669, v2670);

      objc_msgSend_extent(v3049, v2672, v2673, v2674, v2675);
      CGRect v3421 = CGRectInset(v3420, -16.0, -16.0);
      CGFloat v2676 = v3421.origin.x;
      CGFloat v2677 = v3421.origin.y;
      CGFloat v2678 = v3421.size.width;
      CGFloat v2679 = v3421.size.height;
      objc_msgSend_extent(v1254, v2680, v2681, v2682, v2683);
      v3479.origin.double x = v2684;
      v3479.origin.double y = v2685;
      v3479.size.double width = v2686;
      v3479.size.double height = v2687;
      v3422.origin.double x = v2676;
      v3422.origin.double y = v2677;
      v3422.size.double width = v2678;
      v3422.size.double height = v2679;
      CGRect v3423 = CGRectUnion(v3422, v3479);
      double v2688 = v3423.origin.x;
      double v2689 = v3423.origin.y;
      double v2690 = v3423.size.width;
      double v2691 = v3423.size.height;
      v3236[0] = v3049;
      v3236[1] = v1254;
      v3236[2] = v3072;
      v3236[3] = v2667;
      v2694 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2692, (uint64_t)v3236, 4, v2693);
      v2697 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v2671, v2695, (uint64_t)&unk_1F39864A0, (uint64_t)v2694, v2696, v2688, v2689, v2690, v2691);

      v3047 = v2697;
      *(float *)&double v2701 = v3174;
      if (v3174 <= 0.0)
      {
        v3045 = 0;
        v2716 = v2671;
      }
      else
      {
        v2702 = objc_msgSend_kernelWithName_(V8LNRKernels, v2698, @"FGN", v2699, v2700, v2701);

        objc_msgSend_extent(v3066, v2703, v2704, v2705, v2706);
        CGRect v3425 = CGRectInset(v3424, -2.0, -2.0);
        double v2707 = v3425.origin.x;
        double v2708 = v3425.origin.y;
        double v2709 = v3425.size.width;
        double v2710 = v3425.size.height;
        v3235 = v3066;
        v2713 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2711, (uint64_t)&v3235, 1, v2712);
        v3045 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v2702, v2714, (uint64_t)&unk_1F39864C0, (uint64_t)v2713, v2715, v2707, v2708, v2709, v2710);

        v2716 = v2702;
      }
      v2760 = objc_msgSend_kernelWithName_(V8LNRKernels, v2698, @"expandPlusDThruG3", v2699, v2700);

      objc_msgSend_extent(v3066, v2814, v2815, v2816, v2817);
      CGFloat r1e = v2818;
      CGFloat v3151 = v2819;
      CGFloat v3140 = v2820;
      CGFloat v3098 = v2821;
      objc_msgSend_extent(v2697, v2822, v2823, v2824, v2825);
      CGFloat v2827 = v2826;
      CGFloat v2829 = v2828;
      CGFloat v2831 = v2830;
      CGFloat v2833 = v2832;
      objc_msgSend_extent(v1254, v2834, v2835, v2836, v2837);
      CGFloat v2839 = v2838;
      CGFloat v2841 = v2840;
      CGFloat v2843 = v2842;
      CGFloat v2845 = v2844;
      objc_msgSend_extent(v1253, v2846, v2847, v2848, v2849);
      CGAffineTransform v3208 = v3227;
      CGRect v3438 = CGRectApplyAffineTransform(v3437, &v3208);
      CGRect v3483 = CGRectInset(v3438, -1.0, -1.0);
      v3439.origin.double x = v2839;
      v3439.origin.double y = v2841;
      v3439.size.double width = v2843;
      v3439.size.double height = v2845;
      CGRect v3484 = CGRectUnion(v3439, v3483);
      v3440.origin.double x = v2827;
      v3440.origin.double y = v2829;
      v3440.size.double width = v2831;
      v3440.size.double height = v2833;
      CGRect v3485 = CGRectUnion(v3440, v3484);
      v3441.origin.double x = r1e;
      v3441.origin.double y = v3151;
      v3441.size.double width = v3140;
      v3441.size.double height = v3098;
      CGRect v3442 = CGRectUnion(v3441, v3485);
      double v2850 = v3442.origin.x;
      double v2851 = v3442.origin.y;
      double v2852 = v3442.size.width;
      double v2853 = v3442.size.height;
      v3234[0] = v1253;
      v3234[1] = v3066;
      v3234[2] = v2697;
      v3234[3] = v1254;
      v2797 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2854, v2855, v2856, v2857, v3169, v2987, (float)(1.0 - v3026), 1.0);
      v3234[4] = v2797;
      v2802 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2858, v2859, v2860, v2861, (float)(v2986 * 0.004), (float)(v2986 * 0.012), (float)(v2986 * 0.008), v3164);
      v3234[5] = v2802;
      v2807 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v2862, v2863, v2864, v2865, v2975, v3025, 0.0, 0.0);
      v3234[6] = v2807;
      v2810 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2866, (uint64_t)v3234, 7, v2867);
      v2813 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v2760, v2868, (uint64_t)&unk_1F39864E0, (uint64_t)v2810, v2869, v2850, v2851, v2852, v2853);
    }
    v2870 = v2760;

    id v2871 = v2813;
    v3060 = v2871;
    if (v3174 > 0.0 && v3174 >= 0.001 && v3045)
    {
      v2875 = objc_msgSend_kernelWithName_(V8LNRKernels, v2872, @"addFGN", v2873, v2874);

      objc_msgSend_extent(v3060, v2876, v2877, v2878, v2879);
      CGFloat v2881 = v2880;
      CGFloat v2883 = v2882;
      CGFloat v2885 = v2884;
      CGFloat v2887 = v2886;
      objc_msgSend_extent(v3045, v2888, v2889, v2890, v2891);
      v3486.origin.double x = v2892;
      v3486.origin.double y = v2893;
      v3486.size.double width = v2894;
      v3486.size.double height = v2895;
      v3443.origin.double x = v2881;
      v3443.origin.double y = v2883;
      v3443.size.double width = v2885;
      v3443.size.double height = v2887;
      CGRect v3444 = CGRectUnion(v3443, v3486);
      double v2896 = v3444.origin.x;
      double v2897 = v3444.origin.y;
      double v2898 = v3444.size.width;
      double v2899 = v3444.size.height;
      v3230[0] = v3060;
      v3230[1] = v3045;
      v3230[2] = v1254;
      *(float *)&v3444.origin.double x = v3174;
      v2904 = objc_msgSend_numberWithFloat_(NSNumber, v2900, v2901, v2902, v2903, v3444.origin.x);
      v3230[3] = v2904;
      v2907 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2905, (uint64_t)v3230, 4, v2906);
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v2875, v2908, (uint64_t)&unk_1F3986560, (uint64_t)v2907, v2909, v2896, v2897, v2898, v2899);
      id v3062 = (id)objc_claimAutoreleasedReturnValue();

      v2870 = v2875;
    }
    else
    {
      id v3062 = v2871;
    }
    v1252 = objc_msgSend_kernelWithName_(V8LNRKernels, v2910, @"YAndRGBGather", v2911, v2912);

    objc_msgSend_extent(v3062, v2913, v2914, v2915, v2916);
    CGFloat v2918 = v2917;
    CGFloat v2920 = v2919;
    CGFloat v2922 = v2921;
    CGFloat v2924 = v2923;
    objc_msgSend_extent(v3050, v2925, v2926, v2927, v2928);
    v3487.origin.double x = v2929;
    v3487.origin.double y = v2930;
    v3487.size.double width = v2931;
    v3487.size.double height = v2932;
    v3445.origin.double x = v2918;
    v3445.origin.double y = v2920;
    v3445.size.double width = v2922;
    v3445.size.double height = v2924;
    CGRect v3446 = CGRectUnion(v3445, v3487);
    CGFloat v2933 = v3446.origin.x;
    CGFloat v2934 = v3446.origin.y;
    CGFloat v2935 = v3446.size.width;
    CGFloat v2936 = v3446.size.height;
    objc_msgSend_extent(v3135, v2937, v2938, v2939, v2940);
    v3488.origin.double x = v2941;
    v3488.origin.double y = v2942;
    v3488.size.double width = v2943;
    v3488.size.double height = v2944;
    v3447.origin.double x = v2933;
    v3447.origin.double y = v2934;
    v3447.size.double width = v2935;
    v3447.size.double height = v2936;
    CGRect v3448 = CGRectUnion(v3447, v3488);
    double v2945 = v3448.origin.x;
    double v2946 = v3448.origin.y;
    double v2947 = v3448.size.width;
    double v2948 = v3448.size.height;
    v3229[0] = v3062;
    v3229[1] = v3050;
    v3229[2] = v3135;
    v3229[3] = v3137;
    v3229[4] = v3182->inputLumFactors;
    v2951 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2949, (uint64_t)v3229, 5, v2950);
    v2954 = objc_msgSend_applyWithExtent_roiCallback_arguments_(v1252, v2952, (uint64_t)&unk_1F3986580, (uint64_t)v2951, v2953, v2945, v2946, v2947, v2948);
    objc_msgSend_image_croppedTo_(v3182, v2955, (uint64_t)v2954, v2956, v2957, v2974, v2973, v2972, v2971);
    id v1251 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v1251;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputVersion, 0);
  objc_storeStrong((id *)&self->inputShowHF, 0);
  objc_storeStrong((id *)&self->inputHighFrequencyFactor, 0);
  objc_storeStrong((id *)&self->inputDespeckleParameters, 0);
  objc_storeStrong((id *)&self->inputLowCurvatureThreshold, 0);
  objc_storeStrong((id *)&self->inputTrimParameters, 0);
  objc_storeStrong((id *)&self->inputISODictionary, 0);
  objc_storeStrong((id *)&self->inputSensorPattern, 0);
  objc_storeStrong((id *)&self->inputISO, 0);
  objc_storeStrong((id *)&self->inputBaselineExposure, 0);
  objc_storeStrong((id *)&self->inputLumFactors, 0);
  objc_storeStrong((id *)&self->inputBoostMethod, 0);
  objc_storeStrong((id *)&self->inputScaleFactor, 0);
  objc_storeStrong((id *)&self->inputRepresentativeNoise, 0);
  objc_storeStrong((id *)&self->inputNeutralFactors, 0);
  objc_storeStrong((id *)&self->inputOpponentColorEnabled, 0);
  objc_storeStrong((id *)&self->inputMoireAmount, 0);
  objc_storeStrong((id *)&self->inputMoireRadius, 0);
  objc_storeStrong((id *)&self->inputDetailAmount, 0);
  objc_storeStrong((id *)&self->inputContrastAmount, 0);
  objc_storeStrong((id *)&self->inputSharpenThreshold, 0);
  objc_storeStrong((id *)&self->inputSharpenAmount, 0);
  objc_storeStrong((id *)&self->inputCNRAmount, 0);
  objc_storeStrong((id *)&self->inputLNRAmount, 0);

  objc_storeStrong((id *)&self->inputImage, 0);
}

@end