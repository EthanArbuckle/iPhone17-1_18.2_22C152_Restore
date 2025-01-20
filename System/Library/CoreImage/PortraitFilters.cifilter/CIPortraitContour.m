@interface CIPortraitContour
+ (id)customAttributes;
- (CIImage)inputImage;
- (LightingFacePoints)inputFaceLandmarks;
- (NSNumber)inputBlur;
- (NSNumber)inputScale;
- (NSNumber)inputStrength;
- (id)_drawTriangle;
- (id)_protectEyes;
- (id)outputImage;
- (void)setInputBlur:(id)a3;
- (void)setInputFaceLandmarks:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputScale:(id)a3;
- (void)setInputStrength:(id)a3;
@end

@implementation CIPortraitContour

+ (id)customAttributes
{
  v10[0] = kCIAttributeFilterCategories;
  v9[0] = kCICategoryColorAdjustment;
  v9[1] = kCICategoryVideo;
  v9[2] = kCICategoryStillImage;
  v9[3] = kCICategoryInterlaced;
  v9[4] = kCICategoryNonSquarePixels;
  v9[5] = kCICategoryBuiltIn;
  v9[6] = kCICategoryApplePrivate;
  v11[0] = +[NSArray arrayWithObjects:v9 count:7];
  v11[1] = @"11";
  v10[1] = kCIAttributeFilterAvailable_iOS;
  v10[2] = kCIAttributeFilterAvailable_Mac;
  v11[2] = @"10.12";
  v10[3] = @"inputStrength";
  v7[0] = kCIAttributeMin;
  v7[1] = kCIAttributeMax;
  v8[0] = &off_79B70;
  v8[1] = &off_79B80;
  v7[2] = kCIAttributeDefault;
  v7[3] = kCIAttributeIdentity;
  v8[2] = &off_79B80;
  v8[3] = &off_79B70;
  v7[4] = kCIAttributeType;
  v8[4] = kCIAttributeTypeScalar;
  v11[3] = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:5];
  v10[4] = @"inputScale";
  v5[0] = kCIAttributeMin;
  v5[1] = kCIAttributeMax;
  v6[0] = &off_79B90;
  v6[1] = &off_79B80;
  v5[2] = kCIAttributeDefault;
  v5[3] = kCIAttributeIdentity;
  v6[2] = &off_79B80;
  v6[3] = &off_79B80;
  v5[4] = kCIAttributeType;
  v6[4] = kCIAttributeTypeScalar;
  v11[4] = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:5];
  v10[5] = @"inputBlur";
  v3[0] = kCIAttributeMin;
  v3[1] = kCIAttributeMax;
  v4[0] = &off_79B70;
  v4[1] = &off_79BA0;
  v3[2] = kCIAttributeDefault;
  v3[3] = kCIAttributeIdentity;
  v4[2] = &off_79BB0;
  v4[3] = &off_79B70;
  v3[4] = kCIAttributeType;
  v4[4] = kCIAttributeTypeScalar;
  v11[5] = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:5];
  return +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:6];
}

- (id)_drawTriangle
{
  if (qword_8CBE0 != -1) {
    dispatch_once(&qword_8CBE0, &stru_75040);
  }
  return (id)qword_8CBD8;
}

- (id)_protectEyes
{
  if (qword_8CBF0 != -1) {
    dispatch_once(&qword_8CBF0, &stru_75060);
  }
  return (id)qword_8CBE8;
}

- (id)outputImage
{
  if (!self->inputImage) {
    return 0;
  }
  [(NSNumber *)self->inputStrength floatValue];
  float v4 = v3 * 0.9;
  inputOrigImage = self->inputOrigImage;
  CGAffineTransformMakeScale(&v202, 0.05, 0.05);
  v6 = [[(CIImage *)inputOrigImage imageByApplyingTransform:&v202] imageByInsertingIntermediate];
  id v7 = [(CIPortraitContour *)self _drawTriangle];
  v8 = +[CIVector vectorWithX:*(double *)[(LightingFacePoints *)self->inputFaceLandmarks leftCheekContour] Y:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks leftCheekContour] + 1) Z:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks leftCheekContour] + 2) W:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks leftCheekContour] + 3)];
  v9 = +[CIVector vectorWithX:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks leftCheekContour] + 4) Y:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks leftCheekContour] + 5)];
  [(CIImage *)v6 extent];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v218[0] = v6;
  v218[1] = v8;
  v218[2] = v9;
  v218[3] = &off_79BC0;
  *(float *)&double v10 = v4;
  v218[4] = +[NSNumber numberWithFloat:v10];
  id v18 = objc_msgSend(v7, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v218, 5), v11, v13, v15, v17);
  v19 = +[CIVector vectorWithX:*(double *)[(LightingFacePoints *)self->inputFaceLandmarks leftCheekStrobe] Y:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks leftCheekStrobe] + 1) Z:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks leftCheekStrobe] + 2) W:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks leftCheekStrobe] + 3)];
  v20 = +[CIVector vectorWithX:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks leftCheekStrobe] + 4) Y:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks leftCheekStrobe] + 5)];
  [(CIImage *)v6 extent];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  v217[0] = v6;
  v217[1] = v19;
  v217[2] = v20;
  LODWORD(v21) = 1065772646;
  v217[3] = +[NSNumber numberWithFloat:v21];
  *(float *)&double v29 = v4;
  v217[4] = +[NSNumber numberWithFloat:v29];
  id v30 = objc_msgSend(v18, "imageByCompositingOverImage:", objc_msgSend(v7, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v217, 5), v22, v24, v26, v28));
  v31 = +[CIVector vectorWithX:*(double *)[(LightingFacePoints *)self->inputFaceLandmarks rightCheekContour] Y:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks rightCheekContour] + 1) Z:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks rightCheekContour] + 2) W:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks rightCheekContour] + 3)];
  v32 = +[CIVector vectorWithX:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks rightCheekContour] + 4) Y:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks rightCheekContour] + 5)];
  [(CIImage *)v6 extent];
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  v216[0] = v6;
  v216[1] = v31;
  v216[2] = v32;
  v216[3] = &off_79BC0;
  *(float *)&double v33 = v4;
  v216[4] = +[NSNumber numberWithFloat:v33];
  id v41 = objc_msgSend(v30, "imageByCompositingOverImage:", objc_msgSend(v7, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v216, 5), v34, v36, v38, v40));
  v42 = +[CIVector vectorWithX:*(double *)[(LightingFacePoints *)self->inputFaceLandmarks rightCheekStrobe] Y:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks rightCheekStrobe] + 1) Z:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks rightCheekStrobe] + 2) W:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks rightCheekStrobe] + 3)];
  v43 = +[CIVector vectorWithX:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks rightCheekStrobe] + 4) Y:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks rightCheekStrobe] + 5)];
  [(CIImage *)v6 extent];
  double v45 = v44;
  double v47 = v46;
  double v49 = v48;
  double v51 = v50;
  v215[0] = v6;
  v215[1] = v42;
  v215[2] = v43;
  LODWORD(v44) = 1065772646;
  v215[3] = +[NSNumber numberWithFloat:v44];
  *(float *)&double v52 = v4;
  v215[4] = +[NSNumber numberWithFloat:v52];
  id v53 = objc_msgSend(v41, "imageByCompositingOverImage:", objc_msgSend(v7, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v215, 5), v45, v47, v49, v51));
  v54 = +[CIVector vectorWithX:*(double *)[(LightingFacePoints *)self->inputFaceLandmarks leftChinContour] Y:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks leftChinContour] + 1) Z:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks leftChinContour] + 2) W:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks leftChinContour] + 3)];
  v55 = +[CIVector vectorWithX:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks leftChinContour] + 4) Y:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks leftChinContour] + 5)];
  [(CIImage *)v6 extent];
  double v57 = v56;
  double v59 = v58;
  double v61 = v60;
  double v63 = v62;
  v214[0] = v6;
  v214[1] = v54;
  v214[2] = v55;
  LODWORD(v56) = 1055286886;
  v214[3] = +[NSNumber numberWithFloat:v56];
  *(float *)&double v64 = v4;
  v214[4] = +[NSNumber numberWithFloat:v64];
  id v65 = objc_msgSend(v53, "imageByCompositingOverImage:", objc_msgSend(v7, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v214, 5), v57, v59, v61, v63));
  v66 = +[CIVector vectorWithX:*(double *)[(LightingFacePoints *)self->inputFaceLandmarks leftNoseContour] Y:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks leftNoseContour] + 1) Z:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks leftNoseContour] + 2) W:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks leftNoseContour] + 3)];
  v67 = +[CIVector vectorWithX:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks leftNoseContour] + 4) Y:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks leftNoseContour] + 5)];
  [(CIImage *)v6 extent];
  double v69 = v68;
  double v71 = v70;
  double v73 = v72;
  double v75 = v74;
  v213[0] = v6;
  v213[1] = v66;
  v213[2] = v67;
  LODWORD(v68) = 1055286886;
  v213[3] = +[NSNumber numberWithFloat:v68];
  *(float *)&double v76 = v4;
  v213[4] = +[NSNumber numberWithFloat:v76];
  id v77 = objc_msgSend(v65, "imageByCompositingOverImage:", objc_msgSend(v7, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v213, 5), v69, v71, v73, v75));
  v78 = +[CIVector vectorWithX:*(double *)[(LightingFacePoints *)self->inputFaceLandmarks rightChinContour] Y:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks rightChinContour] + 1) Z:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks rightChinContour] + 2) W:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks rightChinContour] + 3)];
  v79 = +[CIVector vectorWithX:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks rightChinContour] + 4) Y:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks rightChinContour] + 5)];
  [(CIImage *)v6 extent];
  double v81 = v80;
  double v83 = v82;
  double v85 = v84;
  double v87 = v86;
  v212[0] = v6;
  v212[1] = v78;
  v212[2] = v79;
  LODWORD(v80) = 1055286886;
  v212[3] = +[NSNumber numberWithFloat:v80];
  *(float *)&double v88 = v4;
  v212[4] = +[NSNumber numberWithFloat:v88];
  id v89 = objc_msgSend(v77, "imageByCompositingOverImage:", objc_msgSend(v7, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v212, 5), v81, v83, v85, v87));
  v90 = +[CIVector vectorWithX:*(double *)[(LightingFacePoints *)self->inputFaceLandmarks rightNoseContour] Y:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks rightNoseContour] + 1) Z:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks rightNoseContour] + 2) W:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks rightNoseContour] + 3)];
  v91 = +[CIVector vectorWithX:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks rightNoseContour] + 4) Y:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks rightNoseContour] + 5)];
  [(CIImage *)v6 extent];
  double v93 = v92;
  double v95 = v94;
  double v97 = v96;
  double v99 = v98;
  v211[0] = v6;
  v211[1] = v90;
  v211[2] = v91;
  LODWORD(v92) = 1055286886;
  v211[3] = +[NSNumber numberWithFloat:v92];
  *(float *)&double v100 = v4;
  v211[4] = +[NSNumber numberWithFloat:v100];
  id v101 = objc_msgSend(v89, "imageByCompositingOverImage:", objc_msgSend(v7, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v211, 5), v93, v95, v97, v99));
  v102 = +[CIVector vectorWithX:*(double *)[(LightingFacePoints *)self->inputFaceLandmarks leftLipContour] Y:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks leftLipContour] + 1) Z:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks leftLipContour] + 2) W:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks leftLipContour] + 3)];
  v103 = +[CIVector vectorWithX:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks leftLipContour] + 4) Y:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks leftLipContour] + 5)];
  [(CIImage *)v6 extent];
  double v105 = v104;
  double v107 = v106;
  double v109 = v108;
  double v111 = v110;
  v210[0] = v6;
  v210[1] = v102;
  v210[2] = v103;
  v210[3] = &off_79BD0;
  *(float *)&double v104 = v4;
  v210[4] = +[NSNumber numberWithFloat:v104];
  id v112 = objc_msgSend(v101, "imageByCompositingOverImage:", objc_msgSend(v7, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v210, 5), v105, v107, v109, v111));
  v113 = +[CIVector vectorWithX:*(double *)[(LightingFacePoints *)self->inputFaceLandmarks rightLipContour] Y:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks rightLipContour] + 1) Z:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks rightLipContour] + 2) W:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks rightLipContour] + 3)];
  v114 = +[CIVector vectorWithX:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks rightLipContour] + 4) Y:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks rightLipContour] + 5)];
  [(CIImage *)v6 extent];
  double v116 = v115;
  double v118 = v117;
  double v120 = v119;
  double v122 = v121;
  v209[0] = v6;
  v209[1] = v113;
  v209[2] = v114;
  v209[3] = &off_79BD0;
  *(float *)&double v115 = v4;
  v209[4] = +[NSNumber numberWithFloat:v115];
  id v123 = objc_msgSend(v112, "imageByCompositingOverImage:", objc_msgSend(v7, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v209, 5), v116, v118, v120, v122));
  v124 = +[CIVector vectorWithX:*(double *)[(LightingFacePoints *)self->inputFaceLandmarks neckContour1] Y:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks neckContour1] + 1) Z:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks neckContour1] + 2) W:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks neckContour1] + 3)];
  v125 = +[CIVector vectorWithX:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks neckContour1] + 4) Y:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks neckContour1] + 5)];
  [(CIImage *)v6 extent];
  double v127 = v126;
  double v129 = v128;
  double v131 = v130;
  double v133 = v132;
  v208[0] = v6;
  v208[1] = v124;
  v208[2] = v125;
  LODWORD(v126) = 1041865114;
  v208[3] = +[NSNumber numberWithFloat:v126];
  *(float *)&double v134 = v4;
  v208[4] = +[NSNumber numberWithFloat:v134];
  id v135 = objc_msgSend(v123, "imageByCompositingOverImage:", objc_msgSend(v7, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v208, 5), v127, v129, v131, v133));
  v136 = +[CIVector vectorWithX:*(double *)[(LightingFacePoints *)self->inputFaceLandmarks neckContourLeft] Y:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks neckContourLeft] + 1) Z:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks neckContourLeft] + 2) W:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks neckContourLeft] + 3)];
  v137 = +[CIVector vectorWithX:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks neckContourLeft] + 4) Y:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks neckContourLeft] + 5)];
  [(CIImage *)v6 extent];
  double v139 = v138;
  double v141 = v140;
  double v143 = v142;
  double v145 = v144;
  v207[0] = v6;
  v207[1] = v136;
  v207[2] = v137;
  LODWORD(v138) = 1041865114;
  v207[3] = +[NSNumber numberWithFloat:v138];
  *(float *)&double v146 = v4;
  v207[4] = +[NSNumber numberWithFloat:v146];
  id v147 = objc_msgSend(v135, "imageByCompositingOverImage:", objc_msgSend(v7, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v207, 5), v139, v141, v143, v145));
  v148 = +[CIVector vectorWithX:*(double *)[(LightingFacePoints *)self->inputFaceLandmarks neckContourRight] Y:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks neckContourRight] + 1) Z:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks neckContourRight] + 2) W:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks neckContourRight] + 3)];
  v149 = +[CIVector vectorWithX:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks neckContourRight] + 4) Y:*((double *)[(LightingFacePoints *)self->inputFaceLandmarks neckContourRight] + 5)];
  [(CIImage *)v6 extent];
  double v151 = v150;
  double v153 = v152;
  double v155 = v154;
  double v157 = v156;
  v206[0] = v6;
  v206[1] = v148;
  v206[2] = v149;
  LODWORD(v150) = 1041865114;
  v206[3] = +[NSNumber numberWithFloat:v150];
  *(float *)&double v158 = v4;
  v206[4] = +[NSNumber numberWithFloat:v158];
  id v159 = objc_msgSend(objc_msgSend(v147, "imageByCompositingOverImage:", objc_msgSend(v7, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v206, 5), v151, v153, v155, v157)), "imageByClampingToExtent");
  [(NSNumber *)self->inputBlur floatValue];
  double v161 = v160 * 0.05;
  [(NSNumber *)self->inputScale floatValue];
  id v163 = [v159 imageByApplyingGaussianBlurWithSigma:v161 * v162];
  CGAffineTransformMakeScale(&v201, 20.0, 20.0);
  id v164 = [v163 imageByApplyingTransform:&v201];
  [(CIImage *)self->inputImage extent];
  id v165 = objc_msgSend(v164, "imageByCroppingToRect:");
  [(LightingFacePoints *)self->inputFaceLandmarks leftEye];
  double v167 = v166 * 20.0;
  [(LightingFacePoints *)self->inputFaceLandmarks leftEye];
  double v169 = v168 * 20.0;
  [(LightingFacePoints *)self->inputFaceLandmarks rightEye];
  double v171 = v170 * 20.0;
  [(LightingFacePoints *)self->inputFaceLandmarks rightEye];
  v173 = +[CIVector vectorWithX:v167 Y:v169 Z:v171 W:v172 * 20.0];
  [(CIVector *)v173 X];
  double v175 = v174;
  [(CIVector *)v173 Z];
  double v177 = v175 - v176;
  [(CIVector *)v173 X];
  double v179 = v178;
  [(CIVector *)v173 Z];
  double v181 = v179 - v180;
  [(CIVector *)v173 Y];
  double v183 = v182;
  [(CIVector *)v173 W];
  double v185 = v183 - v184;
  [(CIVector *)v173 Y];
  double v187 = v186;
  [(CIVector *)v173 W];
  *(float *)&double v188 = v185 * (v187 - v188) + v177 * v181;
  *(float *)&double v187 = sqrtf(*(float *)&v188) * 4.5;
  id v189 = [(CIPortraitContour *)self _protectEyes];
  [(CIImage *)self->inputImage extent];
  double v191 = v190;
  double v193 = v192;
  double v195 = v194;
  double v197 = v196;
  v205[0] = v165;
  v205[1] = v173;
  LODWORD(v190) = LODWORD(v187);
  v205[2] = +[NSNumber numberWithFloat:v190];
  id v198 = objc_msgSend(v189, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v205, 3), v191, v193, v195, v197);
  inputImage = self->inputImage;
  CFStringRef v203 = @"inputBackgroundImage";
  v204 = inputImage;
  return objc_msgSend(v198, "imageByApplyingFilter:withInputParameters:", @"CIHardLightBlendMode", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v204, &v203, 1));
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputBlur
{
  return self->inputBlur;
}

- (void)setInputBlur:(id)a3
{
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
}

- (NSNumber)inputStrength
{
  return self->inputStrength;
}

- (void)setInputStrength:(id)a3
{
}

- (LightingFacePoints)inputFaceLandmarks
{
  return self->inputFaceLandmarks;
}

- (void)setInputFaceLandmarks:(id)a3
{
}

@end