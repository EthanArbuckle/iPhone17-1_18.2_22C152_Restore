@interface CIMeshGenerator
+ (id)customAttributes;
- (CGRect)extentOfMeshStart:(int)a3 count:(int)a4 halfWidth:(double)a5;
- (CIColor)inputColor;
- (NSArray)inputMesh;
- (NSNumber)inputWidth;
- (id)_CIMesh1;
- (id)_CIMesh16;
- (id)_CIMesh2;
- (id)_CIMesh32;
- (id)_CIMesh4;
- (id)_CIMesh8;
- (id)outputImage;
- (void)setInputColor:(id)a3;
- (void)setInputMesh:(id)a3;
- (void)setInputWidth:(id)a3;
@end

@implementation CIMeshGenerator

+ (id)customAttributes
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"CIAttributeFilterCategories";
  v7[0] = @"CICategoryGenerator";
  v7[1] = @"CICategoryVideo";
  v7[2] = @"CICategoryStillImage";
  v7[3] = @"CICategoryHighDynamicRange";
  v7[4] = @"CICategoryBuiltIn";
  v9[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:5];
  v9[1] = @"12";
  v8[1] = @"CIAttributeFilterAvailable_iOS";
  v8[2] = @"CIAttributeFilterAvailable_Mac";
  v9[2] = @"10.14";
  v8[3] = @"inputWidth";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A9330;
  v6[1] = &unk_1EE4A9340;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4A9350;
  v6[3] = &unk_1EE4A9360;
  v5[4] = @"CIAttributeType";
  v6[4] = @"CIAttributeTypeDistance";
  v9[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];
  v8[4] = @"inputColor";
  v4 = +[CIColor colorWithRed:1.0, 1.0, 1.0, 1.0, @"CIAttributeDefault" green blue alpha];
  v9[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v4 forKeys:&v3 count:1];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
}

- (id)_CIMesh1
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_mesh1];
}

- (id)_CIMesh2
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_mesh2];
}

- (id)_CIMesh4
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_mesh4];
}

- (id)_CIMesh8
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_mesh8];
}

- (id)_CIMesh16
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_mesh16];
}

- (id)_CIMesh32
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_mesh32];
}

- (CGRect)extentOfMeshStart:(int)a3 count:(int)a4 halfWidth:(double)a5
{
  if (a4 < 1)
  {
    double v39 = 0.0;
    double v40 = 0.0;
    double v41 = 0.0;
    double v42 = 0.0;
  }
  else
  {
    uint64_t v45 = v20;
    uint64_t v46 = v19;
    uint64_t v47 = v18;
    uint64_t v48 = v17;
    uint64_t v49 = v16;
    uint64_t v50 = v15;
    uint64_t v51 = v14;
    uint64_t v52 = v13;
    uint64_t v53 = v10;
    uint64_t v54 = v9;
    uint64_t v55 = v8;
    uint64_t v56 = v7;
    uint64_t v57 = v6;
    uint64_t v58 = v5;
    uint64_t v59 = v11;
    uint64_t v60 = v12;
    uint64_t v23 = 0;
    uint64_t v24 = a3;
    uint64_t v25 = a4;
    double v26 = 0.0;
    double v27 = 0.0;
    double v28 = 0.0;
    double v29 = 0.0;
    do
    {
      id v30 = -[NSArray objectAtIndexedSubscript:](self->inputMesh, "objectAtIndexedSubscript:", v24 + v23, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60);
      [v30 X];
      double v32 = v31;
      [v30 Y];
      double v34 = v33;
      [v30 Z];
      double v36 = v35;
      [v30 W];
      double v38 = v37;
      double v39 = fmin(v32, v36) - a5;
      double v40 = fmax(v32, v36) + a5;
      double v41 = fmin(v34, v38) - a5;
      double v42 = fmax(v34, v38) + a5;
      if (v23)
      {
        if (v39 >= v29) {
          double v39 = v29;
        }
        if (v40 <= v28) {
          double v40 = v28;
        }
        if (v41 >= v27) {
          double v41 = v27;
        }
        if (v42 <= v26) {
          double v42 = v26;
        }
      }
      ++v23;
      double v26 = v42;
      double v27 = v41;
      double v28 = v40;
      double v29 = v39;
    }
    while (v25 != v23);
  }
  double v43 = v40 - v39;
  double v44 = v42 - v41;
  result.size.height = v44;
  result.size.width = v43;
  result.origin.y = v41;
  result.origin.x = v39;
  return result;
}

- (id)outputImage
{
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputWidth floatValue];
  float v4 = v3 * 0.5;
  if ((float)(v3 * 0.5) < 0.001
    || ([(CIColor *)self->inputColor alpha], *(float *)&double v5 = v5, *(float *)&v5 < 0.00001)
    || (v4 >= 1.0 ? (float v6 = v4) : (float v6 = 1.0), v7 = [(NSArray *)self->inputMesh count], v8 = v7, v7 < 1))
  {
    return +[CIImage emptyImage];
  }
  else
  {
    float v9 = fminf(v4, 1.0);
    if (v7 >= 0x20)
    {
      uint64_t v11 = 0;
      uint64_t v10 = 0;
      do
      {
        [(CIMeshGenerator *)self extentOfMeshStart:v11 count:32 halfWidth:v6];
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;
        for (uint64_t i = 0; i != 32; ++i)
          *((void *)&v118 + i) = [(NSArray *)self->inputMesh objectAtIndexedSubscript:v11 + i];
        id v23 = [(CIMeshGenerator *)self _CIMesh32];
        v114[0] = v118;
        v114[1] = v119;
        v114[2] = v120;
        v114[3] = v121;
        v114[4] = v122;
        v114[5] = v123;
        v114[6] = v124;
        v114[7] = v125;
        v114[8] = v126;
        v114[9] = v127;
        v114[10] = v128;
        v114[11] = v129;
        v114[12] = v130;
        v114[13] = v131;
        v114[14] = v132;
        v114[15] = v133;
        uint64_t v24 = [NSNumber numberWithDouble:v6 + v6];
        inputColor = self->inputColor;
        uint64_t v115 = v24;
        v116 = inputColor;
        *(float *)&double v26 = v9;
        uint64_t v117 = [NSNumber numberWithFloat:v26];
        double v27 = objc_msgSend(v23, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v114, 35), v15, v17, v19, v21);
        if (v10) {
          double v27 = (void *)[v27 imageByCompositingOverImage:v10];
        }
        uint64_t v10 = v27;
        v11 += 32;
        int v12 = v8 - v11;
      }
      while (v8 > (int)v11 && v12 > 31);
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      int v12 = v7;
    }
    if (v12 >= 16)
    {
      [(CIMeshGenerator *)self extentOfMeshStart:v11 count:16 halfWidth:v6];
      double v29 = v28;
      double v31 = v30;
      double v33 = v32;
      double v35 = v34;
      for (uint64_t j = 0; j != 16; ++j)
        *((void *)&v118 + j) = [(NSArray *)self->inputMesh objectAtIndexedSubscript:v11 + j];
      id v37 = [(CIMeshGenerator *)self _CIMesh16];
      v110[0] = v118;
      v110[1] = v119;
      v110[2] = v120;
      v110[3] = v121;
      v110[4] = v122;
      v110[5] = v123;
      v110[6] = v124;
      v110[7] = v125;
      uint64_t v38 = [NSNumber numberWithDouble:v6 + v6];
      double v39 = self->inputColor;
      uint64_t v111 = v38;
      v112 = v39;
      *(float *)&double v40 = v9;
      uint64_t v113 = [NSNumber numberWithFloat:v40];
      double v41 = objc_msgSend(v37, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v110, 19), v29, v31, v33, v35);
      if (v10) {
        double v41 = (void *)[v41 imageByCompositingOverImage:v10];
      }
      v12 -= 16;
      uint64_t v11 = v11 | 0x10;
      uint64_t v10 = v41;
    }
    if (v12 >= 8)
    {
      [(CIMeshGenerator *)self extentOfMeshStart:v11 count:8 halfWidth:v6];
      double v43 = v42;
      double v45 = v44;
      double v47 = v46;
      double v49 = v48;
      for (uint64_t k = 0; k != 8; ++k)
        *((void *)&v118 + k) = [(NSArray *)self->inputMesh objectAtIndexedSubscript:(int)v11 + k];
      id v51 = [(CIMeshGenerator *)self _CIMesh8];
      v106[0] = v118;
      v106[1] = v119;
      v106[2] = v120;
      v106[3] = v121;
      uint64_t v52 = [NSNumber numberWithDouble:v6 + v6];
      uint64_t v53 = self->inputColor;
      uint64_t v107 = v52;
      v108 = v53;
      *(float *)&double v54 = v9;
      uint64_t v109 = [NSNumber numberWithFloat:v54];
      uint64_t v55 = objc_msgSend(v51, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v106, 11), v43, v45, v47, v49);
      if (v10) {
        uint64_t v55 = (void *)[v55 imageByCompositingOverImage:v10];
      }
      v12 -= 8;
      uint64_t v11 = (v11 + 8);
      uint64_t v10 = v55;
    }
    if (v12 >= 4)
    {
      [(CIMeshGenerator *)self extentOfMeshStart:v11 count:4 halfWidth:v6];
      double v57 = v56;
      double v59 = v58;
      double v61 = v60;
      double v63 = v62;
      for (uint64_t m = 0; m != 4; ++m)
        *((void *)&v118 + m) = [(NSArray *)self->inputMesh objectAtIndexedSubscript:(int)v11 + m];
      id v65 = [(CIMeshGenerator *)self _CIMesh4];
      v102[0] = v118;
      v102[1] = v119;
      uint64_t v66 = [NSNumber numberWithDouble:v6 + v6];
      v67 = self->inputColor;
      uint64_t v103 = v66;
      v104 = v67;
      *(float *)&double v68 = v9;
      uint64_t v105 = [NSNumber numberWithFloat:v68];
      v69 = objc_msgSend(v65, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v102, 7), v57, v59, v61, v63);
      if (v10) {
        v69 = (void *)[v69 imageByCompositingOverImage:v10];
      }
      v12 -= 4;
      uint64_t v11 = (v11 + 4);
      uint64_t v10 = v69;
    }
    if (v12 > 1)
    {
      [(CIMeshGenerator *)self extentOfMeshStart:v11 count:2 halfWidth:v6];
      double v71 = v70;
      double v73 = v72;
      double v75 = v74;
      double v77 = v76;
      *(void *)&long long v118 = [(NSArray *)self->inputMesh objectAtIndexedSubscript:(int)v11];
      *((void *)&v118 + 1) = [(NSArray *)self->inputMesh objectAtIndexedSubscript:(int)v11 + 1];
      id v78 = [(CIMeshGenerator *)self _CIMesh2];
      long long v98 = v118;
      uint64_t v79 = [NSNumber numberWithDouble:v6 + v6];
      v80 = self->inputColor;
      uint64_t v99 = v79;
      v100 = v80;
      *(float *)&double v81 = v9;
      uint64_t v101 = [NSNumber numberWithFloat:v81];
      v82 = objc_msgSend(v78, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v98, 5), v71, v73, v75, v77);
      if (v10) {
        v82 = (void *)[v82 imageByCompositingOverImage:v10];
      }
      uint64_t v11 = (v11 + 2);
      v12 -= 2;
      uint64_t v10 = v82;
    }
    if (v12 >= 1)
    {
      [(CIMeshGenerator *)self extentOfMeshStart:v11 count:1 halfWidth:v6];
      double v84 = v83;
      double v86 = v85;
      double v88 = v87;
      double v90 = v89;
      id v91 = [(NSArray *)self->inputMesh objectAtIndexedSubscript:(int)v11];
      *(void *)&long long v118 = v91;
      id v92 = [(CIMeshGenerator *)self _CIMesh1];
      v97[0] = v91;
      uint64_t v93 = [NSNumber numberWithDouble:v6 + v6];
      v94 = self->inputColor;
      v97[1] = v93;
      v97[2] = v94;
      *(float *)&double v95 = v9;
      v97[3] = [NSNumber numberWithFloat:v95];
      v96 = objc_msgSend(v92, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v97, 4), v84, v86, v88, v90);
      if (v10) {
        return (id)[v96 imageByCompositingOverImage:v10];
      }
      return v96;
    }
    return v10;
  }
}

- (NSNumber)inputWidth
{
  return self->inputWidth;
}

- (void)setInputWidth:(id)a3
{
}

- (CIColor)inputColor
{
  return self->inputColor;
}

- (void)setInputColor:(id)a3
{
}

- (NSArray)inputMesh
{
  return self->inputMesh;
}

- (void)setInputMesh:(id)a3
{
}

@end