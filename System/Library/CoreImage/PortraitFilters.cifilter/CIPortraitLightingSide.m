@interface CIPortraitLightingSide
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIVector)inputPt1;
- (CIVector)inputPt2;
- (CIVector)inputPt3;
- (CIVector)inputPt4;
- (CIVector)inputPt5;
- (CIVector)inputPt6;
- (NSNumber)inputCenterBottom;
- (NSNumber)inputOrientation;
- (NSNumber)inputRotate;
- (NSNumber)inputStrength;
- (NSNumber)inputWidth;
- (id)_kickLightKernel_neg;
- (id)_kickLightKernel_pos;
- (id)outputImage;
- (void)setInputCenterBottom:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputOrientation:(id)a3;
- (void)setInputPt1:(id)a3;
- (void)setInputPt2:(id)a3;
- (void)setInputPt3:(id)a3;
- (void)setInputPt4:(id)a3;
- (void)setInputPt5:(id)a3;
- (void)setInputPt6:(id)a3;
- (void)setInputRotate:(id)a3;
- (void)setInputStrength:(id)a3;
- (void)setInputWidth:(id)a3;
@end

@implementation CIPortraitLightingSide

+ (id)customAttributes
{
  v14[0] = kCIAttributeFilterCategories;
  v13[0] = kCICategoryColorAdjustment;
  v13[1] = kCICategoryVideo;
  v13[2] = kCICategoryStillImage;
  v13[3] = kCICategoryInterlaced;
  v13[4] = kCICategoryNonSquarePixels;
  v13[5] = kCICategoryBuiltIn;
  v13[6] = kCICategoryApplePrivate;
  v15[0] = +[NSArray arrayWithObjects:v13 count:7];
  v15[1] = @"11";
  v14[1] = kCIAttributeFilterAvailable_iOS;
  v14[2] = kCIAttributeFilterAvailable_Mac;
  v15[2] = @"10.12";
  v14[3] = @"inputStrength";
  v11[0] = kCIAttributeMin;
  v11[1] = kCIAttributeSliderMin;
  v12[0] = &off_79A10;
  v12[1] = &off_79A10;
  v11[2] = kCIAttributeSliderMax;
  v11[3] = kCIAttributeDefault;
  v12[2] = &off_79A20;
  v12[3] = &off_79A30;
  v11[4] = kCIAttributeIdentity;
  v11[5] = kCIAttributeType;
  v12[4] = &off_79A30;
  v12[5] = kCIAttributeTypeScalar;
  v15[3] = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:6];
  v14[4] = @"inputWidth";
  v9[0] = kCIAttributeMin;
  v9[1] = kCIAttributeSliderMin;
  v10[0] = &off_79A30;
  v10[1] = &off_79A30;
  v9[2] = kCIAttributeSliderMax;
  v9[3] = kCIAttributeDefault;
  v10[2] = &off_79A40;
  v10[3] = &off_79A50;
  v9[4] = kCIAttributeIdentity;
  v9[5] = kCIAttributeType;
  v10[4] = &off_79A30;
  v10[5] = kCIAttributeTypeScalar;
  v15[4] = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:6];
  v14[5] = @"inputRotate";
  v7[0] = kCIAttributeMin;
  v7[1] = kCIAttributeSliderMin;
  v8[0] = &off_79A60;
  v8[1] = &off_79A30;
  v7[2] = kCIAttributeSliderMax;
  v7[3] = kCIAttributeDefault;
  v8[2] = &off_79A70;
  v8[3] = &off_79A30;
  v7[4] = kCIAttributeIdentity;
  v7[5] = kCIAttributeType;
  v8[4] = &off_79A30;
  v8[5] = kCIAttributeTypeScalar;
  v15[5] = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:6];
  v14[6] = @"inputOrientation";
  v5[0] = kCIAttributeMin;
  v5[1] = kCIAttributeSliderMin;
  v6[0] = &off_79A80;
  v6[1] = &off_79A80;
  v5[2] = kCIAttributeSliderMax;
  v5[3] = kCIAttributeDefault;
  v6[2] = &off_79A90;
  v6[3] = &off_79A80;
  v5[4] = kCIAttributeIdentity;
  v5[5] = kCIAttributeType;
  v6[4] = &off_79A80;
  v6[5] = kCIAttributeTypeScalar;
  v15[6] = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:6];
  v14[7] = @"inputCenterBottom";
  v3[0] = kCIAttributeMin;
  v3[1] = kCIAttributeSliderMin;
  v4[0] = &off_79A30;
  v4[1] = &off_79A30;
  v3[2] = kCIAttributeSliderMax;
  v3[3] = kCIAttributeDefault;
  v4[2] = &off_79A80;
  v4[3] = &off_79A30;
  v3[4] = kCIAttributeIdentity;
  v3[5] = kCIAttributeType;
  v4[4] = &off_79A30;
  v4[5] = kCIAttributeTypeScalar;
  v15[7] = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:6];
  return +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:8];
}

- (id)_kickLightKernel_pos
{
  if (qword_8CA60 != -1) {
    dispatch_once(&qword_8CA60, &stru_74D40);
  }
  return (id)qword_8CA58;
}

- (id)_kickLightKernel_neg
{
  if (qword_8CA70 != -1) {
    dispatch_once(&qword_8CA70, &stru_74D60);
  }
  return (id)qword_8CA68;
}

- (id)outputImage
{
  if (!self->inputImage) {
    return 0;
  }
  [(NSNumber *)self->inputWidth floatValue];
  float v4 = v3;
  [(NSNumber *)self->inputStrength floatValue];
  float v6 = v5;
  [(NSNumber *)self->inputRotate floatValue];
  float v8 = v7;
  unsigned int v9 = [(NSNumber *)self->inputOrientation intValue];
  unsigned int v10 = [(NSNumber *)self->inputCenterBottom intValue];
  if (v4 == 0.0 || v6 == 0.0) {
    return self->inputImage;
  }
  unsigned int v11 = v10;
  [(CIVector *)self->inputPt1 X];
  double v13 = v12;
  [(CIVector *)self->inputPt2 X];
  float v15 = (v13 + v14) * 0.5;
  [(CIVector *)self->inputPt1 Y];
  double v17 = v16;
  [(CIVector *)self->inputPt2 Y];
  *(float *)&double v18 = (v17 + v18) * 0.5;
  unsigned int v19 = v9 - 5;
  inputPt2 = self->inputPt2;
  float v171 = v6;
  float v172 = v8;
  float v168 = v15;
  float v166 = *(float *)&v18;
  if (v9 - 5 > 3)
  {
    [(CIVector *)inputPt2 Y];
    double v32 = v31;
    [(CIVector *)self->inputPt1 Y];
    *(float *)&double v33 = v32 - v33;
    float v24 = *(float *)&v33 * 0.5;
    [(CIVector *)self->inputPt2 X];
    double v35 = v34;
    [(CIVector *)self->inputPt1 X];
    *(float *)&double v36 = v35 - v36;
    float v29 = v8 + atan2f(v24, -*(float *)&v36);
  }
  else
  {
    [(CIVector *)inputPt2 X];
    double v22 = v21;
    [(CIVector *)self->inputPt1 X];
    *(float *)&double v23 = v22 - v23;
    float v24 = *(float *)&v23 * 0.5;
    [(CIVector *)self->inputPt2 Y];
    double v26 = v25;
    [(CIVector *)self->inputPt1 Y];
    float v28 = v26 - v27;
    float v29 = atan2f(v24, v28);
  }
  double v37 = v29;
  __double2 v38 = __sincos_stret(v29);
  double v39 = v4;
  double v40 = (v39 + v39) * v39;
  double v41 = v24;
  double v42 = (v41 + v41) * v41;
  float v43 = v38.__cosval * v38.__cosval / v40 + v38.__sinval * v38.__sinval / v42;
  long double v44 = sin(v37 + v37);
  double v173 = v39 * 4.0 * v39;
  float v45 = v44 / (v41 * 4.0 * v41) - v44 / v173;
  float v46 = v38.__sinval * v38.__sinval / v40 + v38.__cosval * v38.__cosval / v42;
  v47 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v43, v45, v46);
  v48 = +[CIVector vectorWithX:v168 Y:v166];
  [(CIVector *)self->inputPt2 X];
  double v50 = v49;
  [(CIVector *)self->inputPt3 X];
  double v52 = (v50 + v51) * 0.5;
  if (v11)
  {
    [(CIVector *)self->inputPt3 Y];
  }
  else
  {
    [(CIVector *)self->inputPt2 Y];
    double v55 = v54;
    [(CIVector *)self->inputPt3 Y];
    double v53 = (v55 + v56) * 0.5;
  }
  float v57 = v52;
  float v58 = v53;
  inputPt3 = self->inputPt3;
  v169 = v48;
  v170 = v47;
  float v167 = v58;
  if (v19 > 3)
  {
    [(CIVector *)inputPt3 Y];
    double v70 = v69;
    [(CIVector *)self->inputPt2 Y];
    *(float *)&double v71 = v70 - v71;
    float v63 = *(float *)&v71 * 0.5;
    [(CIVector *)self->inputPt3 X];
    double v73 = v72;
    [(CIVector *)self->inputPt2 X];
    *(float *)&double v74 = v73 - v74;
    float v68 = v172 + atan2f(v63, -*(float *)&v74);
  }
  else
  {
    [(CIVector *)inputPt3 X];
    double v61 = v60;
    [(CIVector *)self->inputPt2 X];
    *(float *)&double v62 = v61 - v62;
    float v63 = *(float *)&v62 * 0.5;
    [(CIVector *)self->inputPt3 Y];
    double v65 = v64;
    [(CIVector *)self->inputPt2 Y];
    float v67 = v65 - v66;
    float v68 = atan2f(v63, v67);
  }
  double v75 = v68;
  __double2 v76 = __sincos_stret(v68);
  double v77 = v63;
  double v78 = (v77 + v77) * v77;
  float v79 = v76.__cosval * v76.__cosval / v40 + v76.__sinval * v76.__sinval / v78;
  long double v80 = sin(v75 + v75);
  float v81 = v80 / (v77 * 4.0 * v77) - v80 / v173;
  float v82 = v76.__sinval * v76.__sinval / v40 + v76.__cosval * v76.__cosval / v78;
  v83 = +[CIVector vectorWithX:v79 Y:v81 Z:v82 W:0.35];
  v84 = +[CIVector vectorWithX:v57 Y:v167];
  [(CIVector *)self->inputPt4 X];
  double v86 = v85;
  [(CIVector *)self->inputPt5 X];
  float v88 = (v86 + v87) * 0.5;
  [(CIVector *)self->inputPt4 Y];
  double v90 = v89;
  [(CIVector *)self->inputPt5 Y];
  *(float *)&double v91 = (v90 + v91) * 0.5;
  inputPt5 = self->inputPt5;
  float v164 = *(float *)&v91;
  if (v19 > 3)
  {
    [(CIVector *)inputPt5 Y];
    double v103 = v102;
    [(CIVector *)self->inputPt4 Y];
    *(float *)&double v104 = v103 - v104;
    float v96 = *(float *)&v104 * 0.5;
    [(CIVector *)self->inputPt5 X];
    double v106 = v105;
    [(CIVector *)self->inputPt4 X];
    *(float *)&double v107 = v106 - v107;
    float v101 = v172 + atan2f(v96, -*(float *)&v107);
  }
  else
  {
    [(CIVector *)inputPt5 X];
    double v94 = v93;
    [(CIVector *)self->inputPt4 X];
    *(float *)&double v95 = v94 - v95;
    float v96 = *(float *)&v95 * 0.5;
    [(CIVector *)self->inputPt5 Y];
    double v98 = v97;
    [(CIVector *)self->inputPt4 Y];
    float v100 = v98 - v99;
    float v101 = atan2f(v96, v100);
  }
  double v108 = v101;
  __double2 v109 = __sincos_stret(v101);
  double v110 = v96;
  double v111 = (v110 + v110) * v110;
  float v112 = v109.__cosval * v109.__cosval / v40 + v109.__sinval * v109.__sinval / v111;
  long double v113 = sin(v108 + v108);
  float v114 = v113 / (v110 * 4.0 * v110) - v113 / v173;
  float v115 = v109.__sinval * v109.__sinval / v40 + v109.__cosval * v109.__cosval / v111;
  v116 = +[CIVector vectorWithX:v112 Y:v114 Z:v115 W:0.35];
  v117 = +[CIVector vectorWithX:v88 Y:v164];
  [(CIVector *)self->inputPt5 X];
  double v119 = v118;
  [(CIVector *)self->inputPt6 X];
  double v121 = (v119 + v120) * 0.5;
  if (v11)
  {
    [(CIVector *)self->inputPt6 Y];
  }
  else
  {
    [(CIVector *)self->inputPt5 Y];
    double v124 = v123;
    [(CIVector *)self->inputPt6 Y];
    double v122 = (v124 + v125) * 0.5;
  }
  float v126 = v121;
  float v127 = v122;
  inputPt6 = self->inputPt6;
  float v165 = v126;
  if (v19 > 3)
  {
    [(CIVector *)inputPt6 Y];
    double v139 = v138;
    [(CIVector *)self->inputPt5 Y];
    *(float *)&double v140 = v139 - v140;
    float v132 = *(float *)&v140 * 0.5;
    [(CIVector *)self->inputPt6 X];
    double v142 = v141;
    [(CIVector *)self->inputPt5 X];
    *(float *)&double v143 = v142 - v143;
    float v137 = v172 + atan2f(v132, -*(float *)&v143);
  }
  else
  {
    [(CIVector *)inputPt6 X];
    double v130 = v129;
    [(CIVector *)self->inputPt5 X];
    *(float *)&double v131 = v130 - v131;
    float v132 = *(float *)&v131 * 0.5;
    [(CIVector *)self->inputPt6 Y];
    double v134 = v133;
    [(CIVector *)self->inputPt5 Y];
    float v136 = v134 - v135;
    float v137 = atan2f(v132, v136);
  }
  double v144 = v137;
  __double2 v145 = __sincos_stret(v137);
  double v146 = v132;
  double v147 = (v146 + v146) * v146;
  float v148 = v145.__cosval * v145.__cosval / v40 + v145.__sinval * v145.__sinval / v147;
  long double v149 = sin(v144 + v144);
  float v150 = v149 / (v146 * 4.0 * v146) - v149 / v173;
  float v151 = v145.__sinval * v145.__sinval / v40 + v145.__cosval * v145.__cosval / v147;
  v152 = +[CIVector vectorWithX:v148 Y:v150 Z:v151 W:0.35];
  v153 = +[CIVector vectorWithX:v165 Y:v127];
  if (v171 <= 0.0) {
    id v154 = [(CIPortraitLightingSide *)self _kickLightKernel_neg];
  }
  else {
    id v154 = [(CIPortraitLightingSide *)self _kickLightKernel_pos];
  }
  v155 = v154;
  [(CIImage *)self->inputImage extent];
  double v157 = v156;
  double v159 = v158;
  double v161 = v160;
  double v163 = v162;
  v174[0] = self->inputImage;
  v174[1] = v169;
  v174[2] = v170;
  v174[3] = v84;
  v174[4] = v83;
  v174[5] = v117;
  v174[6] = v116;
  v174[7] = v153;
  v174[8] = v152;
  *(float *)&double v156 = v171;
  v174[9] = +[NSNumber numberWithFloat:v156];
  return objc_msgSend(v155, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v174, 10), v157, v159, v161, v163);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputWidth
{
  return self->inputWidth;
}

- (void)setInputWidth:(id)a3
{
}

- (NSNumber)inputStrength
{
  return self->inputStrength;
}

- (void)setInputStrength:(id)a3
{
}

- (NSNumber)inputRotate
{
  return self->inputRotate;
}

- (void)setInputRotate:(id)a3
{
}

- (CIVector)inputPt1
{
  return self->inputPt1;
}

- (void)setInputPt1:(id)a3
{
}

- (CIVector)inputPt2
{
  return self->inputPt2;
}

- (void)setInputPt2:(id)a3
{
}

- (CIVector)inputPt3
{
  return self->inputPt3;
}

- (void)setInputPt3:(id)a3
{
}

- (CIVector)inputPt4
{
  return self->inputPt4;
}

- (void)setInputPt4:(id)a3
{
}

- (CIVector)inputPt5
{
  return self->inputPt5;
}

- (void)setInputPt5:(id)a3
{
}

- (CIVector)inputPt6
{
  return self->inputPt6;
}

- (void)setInputPt6:(id)a3
{
}

- (NSNumber)inputOrientation
{
  return self->inputOrientation;
}

- (void)setInputOrientation:(id)a3
{
}

- (NSNumber)inputCenterBottom
{
  return self->inputCenterBottom;
}

- (void)setInputCenterBottom:(id)a3
{
}

@end