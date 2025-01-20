@interface RAWTemperatureAdjust
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)customAttributes;
- (id)customAttributes;
- (id)outputImage;
- (id)outputMatrix;
- (void)setInputExposure:(id)a3;
- (void)setInputWhitePoint:(id)a3;
@end

@implementation RAWTemperatureAdjust

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if ((objc_msgSend_isEqualToString_(v4, v5, @"inputExposure", v6, v7) & 1) != 0
    || (objc_msgSend_isEqualToString_(v4, v8, @"inputWhitePoint", v9, v10) & 1) != 0)
  {
    unsigned __int8 v11 = 0;
  }
  else
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_METACLASS___RAWTemperatureAdjust;
    unsigned __int8 v11 = objc_msgSendSuper2(&v13, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v11;
}

- (void)setInputExposure:(id)a3
{
}

- (void)setInputWhitePoint:(id)a3
{
  p_inputWhitePoint = (void **)&self->inputWhitePoint;
  id v31 = a3;
  if (*p_inputWhitePoint != v31)
  {
    objc_msgSend_X(v31, v6, v7, v8, v9);
    double v11 = v10;
    objc_msgSend_X(*p_inputWhitePoint, v12, v13, v14, v15);
    if (v11 != v20
      || (objc_msgSend_Y(v31, v16, v17, v18, v19),
          double v22 = v21,
          objc_msgSend_Y(*p_inputWhitePoint, v23, v24, v25, v26),
          v22 != v27))
    {
      objc_msgSend_willChangeValueForKey_(self, v16, @"inputWhitePoint", v18, v19);
      objc_storeStrong((id *)&self->inputWhitePoint, a3);
      objc_msgSend_didChangeValueForKey_(self, v28, @"inputWhitePoint", v29, v30);
    }
  }
}

+ (id)customAttributes
{
  v39[4] = *MEMORY[0x1E4F143B8];
  v38[0] = @"inputExposure";
  v35[0] = *MEMORY[0x1E4F1E090];
  uint64_t v2 = v35[0];
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = *MEMORY[0x1E4F1E0D8];
  uint64_t v30 = (void *)v4;
  v36[0] = v4;
  v36[1] = &unk_1F39AFEA8;
  uint64_t v6 = *MEMORY[0x1E4F1E0D0];
  v35[1] = v5;
  v35[2] = v6;
  uint64_t v7 = *MEMORY[0x1E4F1E098];
  v36[2] = &unk_1F39AFEB8;
  v36[3] = &unk_1F39AFEC8;
  uint64_t v8 = *MEMORY[0x1E4F1E0F0];
  v35[3] = v7;
  v35[4] = v8;
  uint64_t v37 = *MEMORY[0x1E4F1E158];
  uint64_t v9 = v37;
  uint64_t v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v10, (uint64_t)v36, (uint64_t)v35, 5);
  v39[0] = v29;
  v38[1] = @"inputWhitePoint";
  v33[0] = v2;
  double v11 = (objc_class *)objc_opt_class();
  v28 = NSStringFromClass(v11);
  v34[0] = v28;
  v33[1] = v7;
  v16 = objc_msgSend_vectorWithX_Y_(MEMORY[0x1E4F1E080], v12, v13, v14, v15, 0.332399994, 0.34740001);
  v33[2] = v8;
  uint64_t v17 = *MEMORY[0x1E4F1E140];
  v34[1] = v16;
  v34[2] = v17;
  uint64_t v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v18, (uint64_t)v34, (uint64_t)v33, 3);
  v39[1] = v19;
  v38[2] = @"inputVersion";
  v31[0] = v2;
  double v20 = (objc_class *)objc_opt_class();
  double v21 = NSStringFromClass(v20);
  v32[0] = v21;
  v32[1] = &unk_1F39AFEC8;
  v31[1] = v5;
  v31[2] = v6;
  v32[2] = &unk_1F39AFED8;
  v32[3] = &unk_1F39AFED8;
  v31[3] = v7;
  v31[4] = v8;
  v32[4] = v9;
  v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v22, (uint64_t)v32, (uint64_t)v31, 5);
  v38[3] = @"kCIRAWFilterDoesClip";
  uint64_t v24 = *MEMORY[0x1E4F1CFC8];
  v39[2] = v23;
  v39[3] = v24;
  uint64_t v26 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v25, (uint64_t)v39, (uint64_t)v38, 4);

  return v26;
}

- (id)customAttributes
{
  uint64_t v2 = objc_opt_class();

  return (id)MEMORY[0x1F4181798](v2, sel_customAttributes, v3, v4, v5);
}

- (id)outputMatrix
{
  v79[3] = *MEMORY[0x1E4F143B8];
  sub_1DDAD849C(3u, (uint64_t)&v75);
  objc_msgSend_doubleValue(self->inputExposure, v3, v4, v5, v6);
  double v8 = exp2(v7);
  sub_1DDAD8AE0((unsigned int *)&v75, (uint64_t)&v72, v8);
  sub_1DDAD88E8(&v75, (uint64_t)&v72);
  if (__p)
  {
    v74 = __p;
    operator delete(__p);
  }
  BOOL v13 = objc_msgSend_intValue(self->inputVersion, v9, v10, v11, v12) != 0;
  objc_msgSend_X(self->inputWhitePoint, v14, v15, v16, v17);
  double v19 = v18;
  objc_msgSend_Y(self->inputWhitePoint, v20, v21, v22, v23);
  double v25 = v24;
  sub_1DDAD80E8(&v69, (uint64_t)&v75);
  sub_1DDB9EE0C(v13, &v69, (uint64_t)&v72, v19, v25);
  sub_1DDAD88E8(&v75, (uint64_t)&v72);
  if (__p)
  {
    v74 = __p;
    operator delete(__p);
  }
  if (v70)
  {
    v71 = v70;
    operator delete(v70);
  }
  uint64_t v26 = (void *)MEMORY[0x1E4F1E080];
  uint64_t v72 = sub_1DDAD8560((uint64_t)&v75, 0);
  __p = v27;
  double v28 = *(double *)sub_1DDAD85FC((uint64_t)&v72, 0);
  uint64_t v67 = sub_1DDAD8560((uint64_t)&v75, 0);
  uint64_t v68 = v29;
  double v30 = *(double *)sub_1DDAD85FC((uint64_t)&v67, 1u);
  uint64_t v65 = sub_1DDAD8560((uint64_t)&v75, 0);
  uint64_t v66 = v31;
  v32 = (double *)sub_1DDAD85FC((uint64_t)&v65, 2u);
  uint64_t v37 = objc_msgSend_vectorWithX_Y_Z_(v26, v33, v34, v35, v36, v28, v30, *v32);
  v38 = (void *)MEMORY[0x1E4F1E080];
  uint64_t v72 = sub_1DDAD8560((uint64_t)&v75, 1u);
  __p = v39;
  double v40 = *(double *)sub_1DDAD85FC((uint64_t)&v72, 0);
  uint64_t v67 = sub_1DDAD8560((uint64_t)&v75, 1u);
  uint64_t v68 = v41;
  double v42 = *(double *)sub_1DDAD85FC((uint64_t)&v67, 1u);
  uint64_t v65 = sub_1DDAD8560((uint64_t)&v75, 1u);
  uint64_t v66 = v43;
  v44 = (double *)sub_1DDAD85FC((uint64_t)&v65, 2u);
  v49 = objc_msgSend_vectorWithX_Y_Z_(v38, v45, v46, v47, v48, v40, v42, *v44);
  v50 = (void *)MEMORY[0x1E4F1E080];
  uint64_t v72 = sub_1DDAD8560((uint64_t)&v75, 2u);
  __p = v51;
  double v52 = *(double *)sub_1DDAD85FC((uint64_t)&v72, 0);
  uint64_t v67 = sub_1DDAD8560((uint64_t)&v75, 2u);
  uint64_t v68 = v53;
  double v54 = *(double *)sub_1DDAD85FC((uint64_t)&v67, 1u);
  uint64_t v65 = sub_1DDAD8560((uint64_t)&v75, 2u);
  uint64_t v66 = v55;
  v56 = (double *)sub_1DDAD85FC((uint64_t)&v65, 2u);
  v61 = objc_msgSend_vectorWithX_Y_Z_(v50, v57, v58, v59, v60, v52, v54, *v56);
  v78[0] = @"inputRVector";
  v78[1] = @"inputGVector";
  v79[0] = v37;
  v79[1] = v49;
  v78[2] = @"inputBVector";
  v79[2] = v61;
  v63 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v62, (uint64_t)v79, (uint64_t)v78, 3);

  if (v76)
  {
    v77 = v76;
    operator delete(v76);
  }

  return v63;
}

- (id)outputImage
{
  if (self->inputImage)
  {
    uint64_t v3 = sub_1DDA83E7C();
    uint64_t v4 = v3;
    if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DDA14000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWTemperatureAdjust", (const char *)&unk_1DDC3ACB6, buf, 2u);
    }

    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = sub_1DDB987E4;
    void v33[3] = &unk_1E6D04A58;
    v33[4] = self;
    uint64_t v5 = (void (**)(void))MEMORY[0x1E01C46E0](v33);
    uint64_t v10 = objc_msgSend_outputMatrix(self, v6, v7, v8, v9);
    inputImage = self->inputImage;
    uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v10, v12, @"inputRVector", v13, v14);
    double v19 = objc_msgSend_objectForKeyedSubscript_(v10, v16, @"inputGVector", v17, v18);
    uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v10, v20, @"inputBVector", v21, v22);
    uint64_t v28 = objc_msgSend_colorSpace(self->inputImage, v24, v25, v26, v27);
    CFTypeRef v29 = sub_1DDBEE9BC();
    uint64_t v31 = objc_msgSend_applyMatrixToImage_vectorR_vectorG_vectorB_vectorBias_inSpace_outSpace_(self, v30, (uint64_t)inputImage, (uint64_t)v15, (uint64_t)v19, v23, 0, v28, v29);

    v5[2](v5);
  }
  else
  {
    uint64_t v31 = 0;
  }

  return v31;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->defaultWhitePoint, 0);
  objc_storeStrong((id *)&self->inputVersion, 0);
  objc_storeStrong((id *)&self->inputExposure, 0);
  objc_storeStrong((id *)&self->inputWhitePoint, 0);

  objc_storeStrong((id *)&self->inputImage, 0);
}

@end