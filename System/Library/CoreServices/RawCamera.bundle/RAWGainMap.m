@interface RAWGainMap
- (id)makeMapSampler;
- (id)outputImage;
- (void)setDefaults;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation RAWGainMap

- (void)setDefaults
{
  inputGainMapRowPitch = self->inputGainMapRowPitch;
  self->inputGainMapRowPitch = (NSNumber *)&unk_1F39AFB00;

  inputGainMapColPitch = self->inputGainMapColPitch;
  self->inputGainMapColPitch = (NSNumber *)&unk_1F39AFB00;

  gainMapImg = self->_gainMapImg;
  self->_gainMapImg = 0;

  v7 = sub_1DDBEE610(v6);
  id inputColorSpace = self->inputColorSpace;
  self->id inputColorSpace = v7;

  MEMORY[0x1F41817F8](v7, inputColorSpace);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_hasPrefix_(v7, v8, @"inputGainMapData", v9, v10))
  {
    gainMapImg = self->_gainMapImg;
    self->_gainMapImg = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)RAWGainMap;
  [(RAWGainMap *)&v12 setValue:v6 forKey:v7];
}

- (id)makeMapSampler
{
  v68[3] = *MEMORY[0x1E4F143B8];
  objc_msgSend_X(self->inputGainMapSize, a2, v2, v3, v4);
  unint64_t v7 = (unint64_t)v6;
  objc_msgSend_Y(self->inputGainMapSize, v8, v9, v10, v11);
  unint64_t v13 = (unint64_t)v12;
  int v18 = objc_msgSend_intValue(self->inputGainMapNumPlanes, v14, v15, v16, v17);
  unint64_t v19 = v13 * v7;
  v27 = (char *)objc_msgSend_bytes(self->inputGainMapData, v20, v21, v22, v23);
  if (v18 == 1)
  {
    uint64_t v28 = 2 * v7;
    objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v24, 2 * v7 * v13, v25, v26);
    id v29 = objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend_mutableBytes(v29, v30, v31, v32, v33);
    src.data = v27;
    src.height = 1;
    src.width = v13 * v7;
    src.rowBytes = objc_msgSend_length(self->inputGainMapData, v35, v36, v37, v38);
    dest.data = v34;
    dest.height = 1;
    dest.width = v13 * v7;
    dest.rowBytes = objc_msgSend_length(v29, v39, v40, v41, v42);
    vImageConvert_PlanarFtoPlanar16F(&src, &dest, 0x10u);
    v47 = (unsigned int *)MEMORY[0x1E4F1E318];
  }
  else
  {
    uint64_t v28 = 8 * v7;
    objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v24, 8 * v7 * v13, v25, v26);
    id v29 = objc_claimAutoreleasedReturnValue();
    uint64_t v52 = objc_msgSend_mutableBytes(v29, v48, v49, v50, v51);
    if (v19)
    {
      v53 = (_WORD *)v52;
      long long v64 = xmmword_1DDC0DE10;
      do
      {
        dest.rowBytes = 6;
        src.data = v27;
        *(_OWORD *)&src.height = xmmword_1DDC0DE10;
        src.rowBytes = 12;
        dest.data = v53;
        *(_OWORD *)&dest.height = xmmword_1DDC0DE10;
        vImageConvert_PlanarFtoPlanar16F(&src, &dest, 0);
        v53[3] = 15360;
        v27 += 12;
        v53 += 4;
        --v19;
      }
      while (v19);
    }
    v47 = (unsigned int *)MEMORY[0x1E4F1E300];
  }
  uint64_t v54 = *v47;
  v67[0] = *MEMORY[0x1E4F1E390];
  v55 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v43, v44, v45, v46, v64);
  uint64_t v56 = *MEMORY[0x1E4F1E558];
  uint64_t v57 = *MEMORY[0x1E4F1E550];
  v68[0] = v55;
  v68[1] = v57;
  uint64_t v58 = *MEMORY[0x1E4F1E548];
  v67[1] = v56;
  v67[2] = v58;
  v68[2] = *MEMORY[0x1E4F1E540];
  v60 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v59, (uint64_t)v68, (uint64_t)v67, 3);

  v62 = objc_msgSend_imageWithBitmapData_bytesPerRow_size_format_options_(MEMORY[0x1E4F1E050], v61, (uint64_t)v29, v28, v54, v60, (double)v7, (double)v13);

  return v62;
}

- (id)outputImage
{
  v173[2] = *MEMORY[0x1E4F143B8];
  if (self->inputImage)
  {
    objc_msgSend_X(self->inputGainMapSize, a2, v2, v3, v4);
    double v7 = v6;
    objc_msgSend_Y(self->inputGainMapSize, v8, v9, v10, v11);
    double v13 = v12;
    int v18 = objc_msgSend_intValue(self->inputGainMapNumPlanes, v14, v15, v16, v17);
    int v23 = objc_msgSend_intValue(self->inputGainMapRowPitch, v19, v20, v21, v22);
    int v28 = objc_msgSend_intValue(self->inputGainMapColPitch, v24, v25, v26, v27);
    if (!objc_msgSend_BOOLValue(self->inputGainMapExecute, v29, v30, v31, v32) || !self->inputGainMapData) {
      goto LABEL_20;
    }
    unint64_t v37 = (unint64_t)v7;
    unint64_t v38 = (unint64_t)v13;
    if ((unint64_t)v7 < 2 || v38 < 2 || v23 == 0 || v28 == 0 || (v18 & 0xFFFFFFFD) != 1)
    {
      NSLog(&cfstr_RawgainmapDisa.isa);
LABEL_20:
      uint64_t v51 = self->inputImage;
      goto LABEL_37;
    }
    objc_msgSend_extent(self->inputImage, v33, v34, v35, v36);
    CGFloat x = v175.origin.x;
    CGFloat y = v175.origin.y;
    double width = v175.size.width;
    double height = v175.size.height;
    if (CGRectIsInfinite(v175))
    {
      NSLog(&cfstr_RawgainmapDisa_0.isa);
      goto LABEL_20;
    }
    objc_msgSend_CGRectValue(self->inputGainMapApplyRegion, v47, v48, v49, v50);
    double v53 = width * v52;
    double v55 = height * v54;
    v176.size.double width = width * v56;
    v176.size.double height = height * v57;
    v176.origin.CGFloat x = width * v52;
    v176.origin.CGFloat y = height * v54;
    CGFloat v164 = v176.size.height;
    CGFloat v165 = v176.size.width;
    v181.origin.CGFloat x = x;
    v181.origin.CGFloat y = y;
    v181.size.double width = width;
    v181.size.double height = height;
    BOOL v58 = CGRectContainsRect(v176, v181);
    v59 = sub_1DDA83E7C();
    v60 = v59;
    if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v59))
    {
      LOWORD(v170.a) = 0;
      _os_signpost_emit_with_name_impl(&dword_1DDA14000, v60, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWGainMap", (const char *)&unk_1DDC3ACB6, (uint8_t *)&v170, 2u);
    }

    v171[0] = MEMORY[0x1E4F143A8];
    v171[1] = 3221225472;
    v171[2] = sub_1DDBF0414;
    v171[3] = &unk_1E6D04A58;
    v171[4] = self;
    v166 = (void (**)(void))MEMORY[0x1E01C46E0](v171);
    if (!self->_gainMapImg)
    {
      objc_msgSend_makeMapSampler(self, v61, v62, v63, v64);
      v65 = (CIImage *)objc_claimAutoreleasedReturnValue();
      gainMapImg = self->_gainMapImg;
      self->_gainMapImg = v65;
    }
    v67 = self->inputImage;
    id v68 = self->inputColorSpace;
    uint64_t v73 = (uint64_t)v68;
    if (v68)
    {
      CFAutorelease(v68);
      uint64_t v77 = objc_msgSend_imageByColorMatchingWorkingSpaceToColorSpace_(v67, v74, v73, v75, v76);

      v67 = (CIImage *)v77;
    }
    objc_msgSend_CGRectValue(self->inputGainMapRegion, v69, v70, v71, v72);
    double v79 = v78;
    double v81 = v80;
    double v83 = v82;
    double v85 = v84;
    v90 = objc_msgSend_imageByClampingToExtent(self->_gainMapImg, v86, v87, v88, v89);
    double v91 = height * v85;
    memset(&v170, 0, sizeof(v170));
    CGAffineTransformMakeScale(&v170, width * v83 / (double)(v37 - 1), v91 / (double)(v38 - 1));
    CGAffineTransformMakeTranslation(&v169, -0.5, -0.5);
    v95 = objc_msgSend_imageByApplyingTransform_(v90, v92, (uint64_t)&v169, v93, v94);
    CGAffineTransform v168 = v170;
    v99 = objc_msgSend_imageByApplyingTransform_(v95, v96, (uint64_t)&v168, v97, v98);

    CGAffineTransformMakeTranslation(&v167, width * v79, height - v91 - height * v81);
    v103 = objc_msgSend_imageByApplyingTransform_(v99, v100, (uint64_t)&v167, v101, v102);

    if (v23 == 1 && v28 == 1 && v58)
    {
      v107 = objc_msgSend_kernelWithName_(GainMapKernels, v104, @"GainMap", v105, v106);
      objc_msgSend_extent(v67, v108, v109, v110, v111);
      double v113 = v112;
      double v115 = v114;
      double v117 = v116;
      double v119 = v118;
      v173[0] = v67;
      v173[1] = v103;
      v122 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v120, (uint64_t)v173, 2, v121);
      objc_msgSend_applyWithExtent_arguments_(v107, v123, (uint64_t)v122, v124, v125, v113, v115, v117, v119);
      v126 = v67;
      uint64_t v51 = (CIImage *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v107 = objc_msgSend_kernelWithName_(GainMapKernels, v104, @"GainMapWithPitch", v105, v106);
      v122 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v127, v128, v129, v130, (double)(unint64_t)v23, (double)(unint64_t)v28);
      v131 = (void *)MEMORY[0x1E4F1E080];
      v177.origin.CGFloat x = v53;
      v177.origin.CGFloat y = v55;
      v177.size.double width = v165;
      v177.size.double height = v164;
      double MinX = CGRectGetMinX(v177);
      v178.origin.CGFloat x = v53;
      v178.origin.CGFloat y = v55;
      v178.size.double width = v165;
      v178.size.double height = v164;
      double MaxY = CGRectGetMaxY(v178);
      v179.origin.CGFloat x = v53;
      v179.origin.CGFloat y = v55;
      v179.size.double width = v165;
      v179.size.double height = v164;
      double MaxX = CGRectGetMaxX(v179);
      v180.origin.CGFloat x = v53;
      v180.origin.CGFloat y = v55;
      v180.size.double width = v165;
      v180.size.double height = v164;
      CGFloat MinY = CGRectGetMinY(v180);
      v126 = objc_msgSend_vectorWithX_Y_Z_W_(v131, v136, v137, v138, v139, MinX, height - MaxY, MaxX, height - MinY);
      objc_msgSend_extent(v67, v140, v141, v142, v143);
      double v145 = v144;
      double v147 = v146;
      double v149 = v148;
      double v151 = v150;
      v172[0] = v67;
      v172[1] = v103;
      v172[2] = v122;
      v172[3] = v126;
      v154 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v152, (uint64_t)v172, 4, v153);
      uint64_t v158 = objc_msgSend_applyWithExtent_arguments_(v107, v155, (uint64_t)v154, v156, v157, v145, v147, v149, v151);

      uint64_t v51 = (CIImage *)v158;
    }

    if (v73)
    {
      uint64_t v162 = objc_msgSend_imageByColorMatchingColorSpaceToWorkingSpace_(v51, v159, v73, v160, v161);

      uint64_t v51 = (CIImage *)v162;
    }

    v166[2](v166);
  }
  else
  {
    uint64_t v51 = 0;
  }
LABEL_37:

  return v51;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gainMapImg, 0);
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputGainMapExecute, 0);
  objc_storeStrong((id *)&self->inputGainMapNumPlanes, 0);
  objc_storeStrong((id *)&self->inputGainMapColPitch, 0);
  objc_storeStrong((id *)&self->inputGainMapRowPitch, 0);
  objc_storeStrong((id *)&self->inputGainMapSize, 0);
  objc_storeStrong((id *)&self->inputGainMapRegion, 0);
  objc_storeStrong((id *)&self->inputGainMapApplyRegion, 0);
  objc_storeStrong((id *)&self->inputGainMapData, 0);

  objc_storeStrong((id *)&self->inputImage, 0);
}

@end