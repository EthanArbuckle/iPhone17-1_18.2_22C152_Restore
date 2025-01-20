@interface CITemperatureAndTint
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIVector)inputNeutral;
- (CIVector)inputTargetNeutral;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputNeutral:(id)a3;
- (void)setInputTargetNeutral:(id)a3;
@end

@implementation CITemperatureAndTint

+ (id)customAttributes
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"CIAttributeFilterCategories";
  v7[0] = @"CICategoryColorAdjustment";
  v7[1] = @"CICategoryVideo";
  v7[2] = @"CICategoryStillImage";
  v7[3] = @"CICategoryInterlaced";
  v7[4] = @"CICategoryNonSquarePixels";
  v7[5] = @"CICategoryHighDynamicRange";
  v7[6] = @"CICategoryBuiltIn";
  v9[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:7];
  v9[1] = @"5";
  v8[1] = @"CIAttributeFilterAvailable_iOS";
  v8[2] = @"CIAttributeFilterAvailable_Mac";
  v9[2] = @"10.7";
  v8[3] = @"inputNeutral";
  v5[0] = @"CIAttributeDefault";
  v6[0] = +[CIVector vectorWithX:6500.0 Y:0.0];
  v5[1] = @"CIAttributeIdentity";
  v5[2] = @"CIAttributeType";
  v6[1] = +[CIVector vectorWithX:6500.0 Y:0.0];
  v6[2] = @"CIAttributeTypeOffset";
  v9[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];
  v8[4] = @"inputTargetNeutral";
  v4[0] = +[CIVector vectorWithX:6500.0, 0.0, @"CIAttributeDefault" Y];
  v3[1] = @"CIAttributeIdentity";
  v3[2] = @"CIAttributeType";
  v4[1] = +[CIVector vectorWithX:6500.0 Y:0.0];
  v4[2] = @"CIAttributeTypeOffset";
  v9[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:3];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
}

- (CIVector)inputNeutral
{
  return self->inputNeutral;
}

- (void)setInputNeutral:(id)a3
{
  v96[3] = *(double *)MEMORY[0x1E4F143B8];
  inputNeutral = self->inputNeutral;
  if ([a3 count] == 3)
  {
    [a3 X];
    double v7 = v6;
    [a3 Y];
    double v9 = v8;
    [a3 Z];
    v96[0] = v7 * v7;
    v96[1] = v9 * v9;
    v96[2] = v10 * v10;
    CMatrix::CMatrix((CMatrix *)v89, 3u, 3u, 0.454268, v11, v12, 0x3FD69CBAA49EB5D9, 0x3FC40C03BE7630B2, 0x3FCEF689906AD933, 0x3FE58E8E5F4360FFLL, 0x3FB59E6D9AB61B65, 0x3F8E7F0ABDCF9CFALL, 0x3FB73315A5A6D043, 0x3FE7053603937997);
    CMatrix::CMatrix((CMatrix *)v88, 3u, 3u, 0.8951, v13, v14, 0x3FD10CB295E9E1B1, 0xBFC4A8C154C985F0, 0xBFE801A36E2EB1C4, 0x3FFB6A7EF9DB22D1, 0x3FA2CA57A786C227, 0x3FA3EAB367A0F909, 0xBFB189374BC6A7F0, 0x3FF0793DD97F62B7);
    CMatrix::CMatrix((CMatrix *)v87, 3u, 3u, 0.986993, v15, v16, 0xBFC2D2AA5C5F7C67, 0x3FC479AAE6C8F755, 0x3FDBAAE297396D09, 0x3FE09667B5F1BEF5, 0x3FA93CAB81F969E4, 0xBF8177A7008A697BLL, 0x3FA480841EDE1199, 0x3FEEFDD872F33CA3);
    CMatrix::operator*(v88, v89, v85);
    CMatrix::CMatrix((CMatrix *)v84, 3u, 1u, 1.0, v17, v18, 0x3FF0000000000000, 0x3FF0000000000000);
    CMatrix::operator*(v85, v84, v86);
    CMatrix::operator*(v88, v89, v84);
    CMatrix::CMatrix((CMatrix *)v83, 3u, 1u, v96);
    CMatrix::operator*(v84, v83, v85);
    v83[0] = 0.0;
    v82[0] = 0.0;
    tempTint_to_xy(6500.0, 0.0, v83, v82);
    if (v82[0] >= 1.0e-20) {
      CMatrix::CMatrix((CMatrix *)v84, 3u, 1u, v83[0] / v82[0], v19, v20, 0x3FF0000000000000, (1.0 - v83[0] - v82[0]) / v82[0]);
    }
    else {
      CMatrix::CMatrix((CMatrix *)v84);
    }
    CMatrix::operator*(v88, v84, (unsigned int *)v83);
    v77[0] = CMatrix::operator[]((unsigned int *)v83, 0);
    v77[1] = v22;
    double v23 = *(double *)CMatrixRow::operator[]((uint64_t)v77, 0);
    v76[0] = CMatrix::operator[](v85, 0);
    v76[1] = v24;
    double v25 = *(double *)CMatrixRow::operator[]((uint64_t)v76, 0);
    uint64_t v94 = CMatrix::operator[](v86, 0);
    uint64_t v95 = v26;
    double v27 = *(double *)CMatrixRow::operator[]((uint64_t)&v94, 0);
    uint64_t v92 = CMatrix::operator[]((unsigned int *)v83, 1u);
    uint64_t v93 = v28;
    double v29 = *(double *)CMatrixRow::operator[]((uint64_t)&v92, 0);
    uint64_t v90 = CMatrix::operator[](v85, 1u);
    uint64_t v91 = v30;
    double v31 = *(double *)CMatrixRow::operator[]((uint64_t)&v90, 0);
    v81[0] = CMatrix::operator[](v86, 1u);
    v81[1] = v32;
    double v33 = *(double *)CMatrixRow::operator[]((uint64_t)v81, 0);
    v80[0] = CMatrix::operator[]((unsigned int *)v83, 2u);
    v80[1] = v34;
    double v35 = *(double *)CMatrixRow::operator[]((uint64_t)v80, 0);
    v79[0] = CMatrix::operator[](v85, 2u);
    v79[1] = v36;
    double v37 = *(double *)CMatrixRow::operator[]((uint64_t)v79, 0);
    v78[0] = CMatrix::operator[](v86, 2u);
    v78[1] = v38;
    v39 = (double *)CMatrixRow::operator[]((uint64_t)v78, 0);
    CMatrix::CMatrix((CMatrix *)v82, 3u, 1u, v23 * v25 / v27, v40, v41, v29 * v31 / v33, v35 * v37 / *v39);
    CMatrix::operator*(v87, v82, (unsigned int *)v77);
    CMatrix::CMatrix((CMatrix *)v76, (const CMatrix *)v77);
    uint64_t v94 = CMatrix::operator[]((unsigned int *)v76, 0);
    uint64_t v95 = v42;
    double v43 = *(double *)CMatrixRow::operator[]((uint64_t)&v94, 0);
    uint64_t v92 = CMatrix::operator[]((unsigned int *)v76, 1u);
    uint64_t v93 = v44;
    double v45 = *(double *)CMatrixRow::operator[]((uint64_t)&v92, 0);
    uint64_t v90 = CMatrix::operator[]((unsigned int *)v76, 2u);
    uint64_t v91 = v46;
    double v47 = v43 + v45 + *(double *)CMatrixRow::operator[]((uint64_t)&v90, 0);
    double v48 = 0.0;
    double v49 = 0.0;
    double v50 = 0.0;
    if (v47 >= 1.0e-20)
    {
      uint64_t v94 = CMatrix::operator[]((unsigned int *)v76, 0);
      uint64_t v95 = v51;
      double v52 = *(double *)CMatrixRow::operator[]((uint64_t)&v94, 0);
      uint64_t v94 = CMatrix::operator[]((unsigned int *)v76, 1u);
      uint64_t v95 = v53;
      v54 = (double *)CMatrixRow::operator[]((uint64_t)&v94, 0);
      double v49 = v52 / v47;
      double v50 = *v54 / v47;
    }
    uint64_t v55 = 0;
    double v56 = v49 + v49;
    double v57 = 1.5 - v49 + v50 * 6.0;
    double v58 = v56 / v57;
    double v59 = v50 * 3.0 / v57;
    uint64_t v60 = 0xFFFFFFFF00000000;
    double v61 = 0.0;
    double v62 = 0.0;
    do
    {
      double v63 = v62;
      double v64 = v61;
      double v65 = v48;
      uint64_t v66 = v55;
      v55 += 32;
      double v67 = *(double *)((char *)&kTempTable + v55 + 24);
      double v68 = sqrt(v67 * v67 + 1.0);
      double v48 = 1.0 / v68;
      double v61 = v67 / v68;
      double v70 = *(double *)((char *)&kTempTable + v55 + 8);
      double v69 = *(double *)((char *)&kTempTable + v55 + 16);
      double v62 = (v59 - v69) * v48 - (v58 - v70) * v61;
      v60 += 0x100000000;
    }
    while (v66 != 928 && v62 > 0.0);
    if (v60)
    {
      double v71 = 0.0;
      if (v62 <= 0.0) {
        double v71 = (v59 - v69) * v48 - (v58 - v70) * v61;
      }
      double v72 = -v71 / (v63 - v71);
    }
    else
    {
      double v72 = 0.0;
    }
    double v73 = v65 * v72 + v48 * (1.0 - v72);
    double v74 = v64 * v72 + v61 * (1.0 - v72);
    double v75 = sqrt(v74 * v74 + v73 * v73);
    v21 = +[CIVector vectorWithX:1000000.0/ ((1.0 - v72) * *(double *)((char *)&kTempTable + v55)+ *(double *)((char *)&kTempTable + (v60 >> 27)) * v72) Y:(v74 / v75 * (v59 - (v69 * (1.0 - v72) + *(double *)((char *)&kTempTable + (v60 >> 27) + 16) * v72))+ (v58 - (v70 * (1.0 - v72) + *(double *)((char *)&kTempTable + (v60 >> 27) + 8) * v72)) * (v73 / v75))* -3000.0];
  }
  else
  {
    v21 = (CIVector *)a3;
  }
  self->inputNeutral = v21;
}

- (id)outputImage
{
  if (!self->inputImage) {
    return 0;
  }
  double v49 = 0.0;
  double v50 = 0.0;
  double v47 = 0.0;
  double v48 = 0.0;
  get_input_xy(self->inputNeutral, &v50, &v49);
  get_input_xy(self->inputTargetNeutral, &v48, &v47);
  double v6 = v47;
  double v5 = v48;
  if (vabdd_f64(v50, v48) <= 0.0005 && vabdd_f64(v49, v47) <= 0.0005) {
    return self->inputImage;
  }
  if (v49 >= 1.0e-20) {
    CMatrix::CMatrix((CMatrix *)v55, 3u, 1u, v50 / v49, v3, v4, 0x3FF0000000000000, (1.0 - v50 - v49) / v49);
  }
  else {
    CMatrix::CMatrix((CMatrix *)v55);
  }
  if (v6 >= 1.0e-20) {
    CMatrix::CMatrix((CMatrix *)v54, 3u, 1u, v5 / v6, v7, v8, 0x3FF0000000000000, (1.0 - v5 - v6) / v6);
  }
  else {
    CMatrix::CMatrix((CMatrix *)v54);
  }
  CMatrix::CMatrix((CMatrix *)v52, (const CMatrix *)v55);
  CMatrix::CMatrix((CMatrix *)v51, (const CMatrix *)v54);
  CMatrix::CMatrix((CMatrix *)v67, 3u, 3u, 0.8951, v10, v11, 0x3FD10CB295E9E1B1, 0xBFC4A8C154C985F0, 0xBFE801A36E2EB1C4, 0x3FFB6A7EF9DB22D1, 0x3FA2CA57A786C227, 0x3FA3EAB367A0F909, 0xBFB189374BC6A7F0, 0x3FF0793DD97F62B7);
  CMatrix::CMatrix((CMatrix *)v66, 3u, 3u, 0.986993, v12, v13, 0xBFC2D2AA5C5F7C67, 0x3FC479AAE6C8F755, 0x3FDBAAE297396D09, 0x3FE09667B5F1BEF5, 0x3FA93CAB81F969E4, 0xBF8177A7008A697BLL, 0x3FA480841EDE1199, 0x3FEEFDD872F33CA3);
  CMatrix::operator*((unsigned int *)v67, v52, (unsigned int *)v65);
  CMatrix::operator*((unsigned int *)v67, v51, (unsigned int *)v64);
  uint64_t v56 = CMatrix::operator[]((unsigned int *)v64, 0);
  uint64_t v57 = v14;
  double v15 = *(double *)CMatrixRow::operator[]((uint64_t)&v56, 0);
  v62[0] = CMatrix::operator[]((unsigned int *)v65, 0);
  v62[1] = v16;
  double v17 = *(double *)CMatrixRow::operator[]((uint64_t)v62, 0);
  v61[0] = CMatrix::operator[]((unsigned int *)v64, 1u);
  v61[1] = v18;
  double v19 = *(double *)CMatrixRow::operator[]((uint64_t)v61, 0);
  v60[0] = CMatrix::operator[]((unsigned int *)v65, 1u);
  v60[1] = v20;
  double v21 = *(double *)CMatrixRow::operator[]((uint64_t)v60, 0);
  v59[0] = CMatrix::operator[]((unsigned int *)v64, 2u);
  v59[1] = v22;
  double v23 = *(double *)CMatrixRow::operator[]((uint64_t)v59, 0);
  v58[0] = CMatrix::operator[]((unsigned int *)v65, 2u);
  v58[1] = v24;
  double v25 = (double *)CMatrixRow::operator[]((uint64_t)v58, 0);
  CMatrix::diagonalMatrix((CMatrix *)3, v15 / v17, v63, COERCE__INT64(v19 / v21), v23 / *v25);
  CMatrix::operator*((unsigned int *)v66, v63, (unsigned int *)&v56);
  CMatrix::operator*((unsigned int *)&v56, v67, (unsigned int *)v53);
  CMatrix::CMatrix((CMatrix *)v67, 3u, 3u, 0.454268, v26, v27, 0x3FD69CBAA49EB5D9, 0x3FC40C03BE7630B2, 0x3FCEF689906AD933, 0x3FE58E8E5F4360FFLL, 0x3FB59E6D9AB61B65, 0x3F8E7F0ABDCF9CFALL, 0x3FB73315A5A6D043, 0x3FE7053603937997);
  CMatrix::inverse((CMatrix *)v67, (unsigned int *)v66);
  CMatrix::operator*((unsigned int *)v66, v53, (unsigned int *)v65);
  CMatrix::operator*((unsigned int *)v65, v67, v46);
  inputImage = self->inputImage;
  v67[0] = CMatrix::operator[](v46, 0);
  v67[1] = v29;
  double v30 = *(double *)CMatrixRow::operator[]((uint64_t)v67, 0);
  v66[0] = CMatrix::operator[](v46, 0);
  v66[1] = v31;
  double v32 = *(double *)CMatrixRow::operator[]((uint64_t)v66, 1u);
  v65[0] = CMatrix::operator[](v46, 0);
  v65[1] = v33;
  uint64_t v34 = +[CIVector vectorWithX:v30 Y:v32 Z:*(double *)CMatrixRow::operator[]((uint64_t)v65, 2u)];
  v64[0] = CMatrix::operator[](v46, 1u);
  v64[1] = v35;
  double v36 = *(double *)CMatrixRow::operator[]((uint64_t)v64, 0);
  v63[0] = CMatrix::operator[](v46, 1u);
  v63[1] = v37;
  double v38 = *(double *)CMatrixRow::operator[]((uint64_t)v63, 1u);
  uint64_t v56 = CMatrix::operator[](v46, 1u);
  uint64_t v57 = v39;
  uint64_t v40 = +[CIVector vectorWithX:v36 Y:v38 Z:*(double *)CMatrixRow::operator[]((uint64_t)&v56, 2u)];
  v55[0] = CMatrix::operator[](v46, 2u);
  v55[1] = v41;
  double v42 = *(double *)CMatrixRow::operator[]((uint64_t)v55, 0);
  v54[0] = CMatrix::operator[](v46, 2u);
  v54[1] = v43;
  double v44 = *(double *)CMatrixRow::operator[]((uint64_t)v54, 1u);
  v53[0] = CMatrix::operator[](v46, 2u);
  v53[1] = v45;
  return [(CIImage *)inputImage filteredImage:@"CIColorMatrix", @"inputRVector", v34, @"inputGVector", v40, @"inputBVector", +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v42, v44, *(double *)CMatrixRow::operator[]((uint64_t)v53, 2u)), @"inputAVector", +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 1.0), @"inputBiasVector", +[CIVector vectorWithX:0.0 Y:0.0 Z:0.0], 0 keysAndValues];
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIVector)inputTargetNeutral
{
  return self->inputTargetNeutral;
}

- (void)setInputTargetNeutral:(id)a3
{
}

@end