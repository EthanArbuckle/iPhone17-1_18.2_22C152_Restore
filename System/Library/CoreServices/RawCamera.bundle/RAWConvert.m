@interface RAWConvert
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)customAttributes;
- (CCameraProfile)cameraProfile;
- (CMatrix)matrixFromArray:(SEL)a3 rowCount:(id)a4 columnCount:(unint64_t)a5;
- (CWhitePoint)neutralWhitePointWithProfile:(void *)a3;
- (id)blendFactor;
- (id)customAttributes;
- (id)inputNeutralXY;
- (id)outputImage;
- (id)outputMatrix;
- (void)setInputNeutral:(id)a3;
@end

@implementation RAWConvert

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isEqualToString_(v4, v5, @"inputNeutral", v6, v7))
  {
    unsigned __int8 v8 = 0;
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___RAWConvert;
    unsigned __int8 v8 = objc_msgSendSuper2(&v10, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v8;
}

- (void)setInputNeutral:(id)a3
{
  p_inputNeutral = (uint64_t *)&self->inputNeutral;
  id v12 = a3;
  if ((id)*p_inputNeutral != v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_msgSend_isEqualToArray_(v12, v6, *p_inputNeutral, v7, v8) & 1) == 0)
    {
      objc_msgSend_willChangeValueForKey_(self, v6, @"inputNeutral", v7, v8);
      objc_storeStrong((id *)&self->inputNeutral, a3);
      objc_msgSend_didChangeValueForKey_(self, v9, @"inputNeutral", v10, v11);
    }
  }
}

+ (id)customAttributes
{
  v174[19] = *MEMORY[0x1E4F143B8];
  v173[0] = @"inputColorSpace";
  uint64_t v171 = *MEMORY[0x1E4F1E098];
  uint64_t v2 = v171;
  CFTypeRef v172 = sub_1DDBEE9BC();
  v135 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v3, (uint64_t)&v172, (uint64_t)&v171, 1);
  v174[0] = v135;
  v173[1] = @"inputNeutral";
  v169[0] = *MEMORY[0x1E4F1E090];
  uint64_t v4 = v169[0];
  v5 = (objc_class *)objc_opt_class();
  v134 = NSStringFromClass(v5);
  v170[0] = v134;
  v169[1] = v2;
  v133 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v6, v7, v8, v9);
  v170[1] = v133;
  v132 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v10, (uint64_t)v170, (uint64_t)v169, 2);
  v174[1] = v132;
  v173[2] = @"inputRange";
  v166[0] = v4;
  uint64_t v11 = (objc_class *)objc_opt_class();
  v130 = NSStringFromClass(v11);
  v167[0] = v130;
  v167[1] = &unk_1F39AFF48;
  uint64_t v12 = *MEMORY[0x1E4F1E0F0];
  v166[1] = v2;
  v166[2] = v12;
  uint64_t v168 = *MEMORY[0x1E4F1E158];
  uint64_t v13 = v168;
  v131 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v14, (uint64_t)v167, (uint64_t)v166, 3);
  v174[2] = v131;
  v173[3] = @"inputFactor";
  v164[0] = v4;
  v15 = (objc_class *)objc_opt_class();
  v128 = NSStringFromClass(v15);
  v165[0] = v128;
  v165[1] = &unk_1F39AFF48;
  v164[1] = v2;
  v164[2] = v12;
  v165[2] = v13;
  v129 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v16, (uint64_t)v165, (uint64_t)v164, 3);
  v174[3] = v129;
  v173[4] = @"inputCalibrationIlluminant1";
  v162[0] = v4;
  v17 = (objc_class *)objc_opt_class();
  v126 = NSStringFromClass(v17);
  v163[0] = v126;
  v163[1] = v13;
  v162[1] = v12;
  v162[2] = v2;
  v163[2] = &unk_1F39AFA28;
  v127 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v18, (uint64_t)v163, (uint64_t)v162, 3);
  v174[4] = v127;
  v173[5] = @"inputCalibrationIlluminant2";
  v160[0] = v4;
  v19 = (objc_class *)objc_opt_class();
  v124 = NSStringFromClass(v19);
  v161[0] = v124;
  v161[1] = v13;
  v160[1] = v12;
  v160[2] = v2;
  v161[2] = &unk_1F39AFA40;
  v125 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v20, (uint64_t)v161, (uint64_t)v160, 3);
  v174[5] = v125;
  v173[6] = @"inputXYZtoCamera1";
  v158[0] = v4;
  v21 = (objc_class *)objc_opt_class();
  v121 = NSStringFromClass(v21);
  v159[0] = v121;
  v158[1] = v2;
  v122 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v22, v23, v24, v25);
  v159[1] = v122;
  v123 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v26, (uint64_t)v159, (uint64_t)v158, 2);
  v174[6] = v123;
  v173[7] = @"inputXYZtoCamera2";
  v156[0] = v4;
  v27 = (objc_class *)objc_opt_class();
  v118 = NSStringFromClass(v27);
  v157[0] = v118;
  v156[1] = v2;
  v119 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v28, v29, v30, v31);
  v157[1] = v119;
  v120 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v32, (uint64_t)v157, (uint64_t)v156, 2);
  v174[7] = v120;
  v173[8] = @"inputCameraCalibration1";
  v154[0] = v4;
  v33 = (objc_class *)objc_opt_class();
  v115 = NSStringFromClass(v33);
  v155[0] = v115;
  v154[1] = v2;
  v116 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v34, v35, v36, v37);
  v155[1] = v116;
  v117 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v38, (uint64_t)v155, (uint64_t)v154, 2);
  v174[8] = v117;
  v173[9] = @"inputCameraCalibration2";
  v152[0] = v4;
  v39 = (objc_class *)objc_opt_class();
  v112 = NSStringFromClass(v39);
  v153[0] = v112;
  v152[1] = v2;
  v113 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v40, v41, v42, v43);
  v153[1] = v113;
  v114 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v44, (uint64_t)v153, (uint64_t)v152, 2);
  v174[9] = v114;
  v173[10] = @"inputReduction1";
  v150[0] = v4;
  v45 = (objc_class *)objc_opt_class();
  v109 = NSStringFromClass(v45);
  v151[0] = v109;
  v150[1] = v2;
  v110 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v46, v47, v48, v49);
  v151[1] = v110;
  v111 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v50, (uint64_t)v151, (uint64_t)v150, 2);
  v174[10] = v111;
  v173[11] = @"inputReduction2";
  v148[0] = v4;
  v51 = (objc_class *)objc_opt_class();
  v106 = NSStringFromClass(v51);
  v149[0] = v106;
  v148[1] = v2;
  v107 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v52, v53, v54, v55);
  v149[1] = v107;
  v108 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v56, (uint64_t)v149, (uint64_t)v148, 2);
  v174[11] = v108;
  v173[12] = @"inputForwardMatrix1";
  v146[0] = v4;
  v57 = (objc_class *)objc_opt_class();
  v103 = NSStringFromClass(v57);
  v146[1] = v2;
  v147[0] = v103;
  v104 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v58, v59, v60, v61);
  v147[1] = v104;
  v105 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v62, (uint64_t)v147, (uint64_t)v146, 2);
  v174[12] = v105;
  v173[13] = @"inputForwardMatrix2";
  v144[0] = v4;
  v63 = (objc_class *)objc_opt_class();
  v100 = NSStringFromClass(v63);
  v144[1] = v2;
  v145[0] = v100;
  v101 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v64, v65, v66, v67);
  v145[1] = v101;
  v102 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v68, (uint64_t)v145, (uint64_t)v144, 2);
  v174[13] = v102;
  v173[14] = @"inputShouldUseForwardMatrix";
  v142[0] = v4;
  v69 = (objc_class *)objc_opt_class();
  v99 = NSStringFromClass(v69);
  v142[1] = v2;
  v143[0] = v99;
  v74 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v70, v71, v72, v73);
  v143[1] = v74;
  v76 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v75, (uint64_t)v143, (uint64_t)v142, 2);
  v174[14] = v76;
  v173[15] = @"inputShouldRecoverHighlights";
  v140[0] = v4;
  v77 = (objc_class *)objc_opt_class();
  v78 = NSStringFromClass(v77);
  v140[1] = v2;
  uint64_t v79 = MEMORY[0x1E4F1CC28];
  v141[0] = v78;
  v141[1] = MEMORY[0x1E4F1CC28];
  v81 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v80, (uint64_t)v141, (uint64_t)v140, 2);
  v174[15] = v81;
  v173[16] = @"inputShouldLinearize";
  v138[0] = v4;
  v82 = (objc_class *)objc_opt_class();
  v83 = NSStringFromClass(v82);
  v139[0] = v83;
  v139[1] = v79;
  uint64_t v84 = *MEMORY[0x1E4F1E0A0];
  v138[1] = v2;
  v138[2] = v84;
  v139[2] = @"ShouldLinearize";
  v86 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v85, (uint64_t)v139, (uint64_t)v138, 3);
  v174[16] = v86;
  v174[17] = v79;
  v173[17] = @"kCIRAWFilterDoesClip";
  v173[18] = @"inputBlacks";
  v136[0] = v4;
  v87 = (objc_class *)objc_opt_class();
  v88 = NSStringFromClass(v87);
  v136[1] = v2;
  v137[0] = v88;
  v93 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v89, v90, v91, v92);
  v137[1] = v93;
  v95 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v94, (uint64_t)v137, (uint64_t)v136, 2);
  v174[18] = v95;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v96, (uint64_t)v174, (uint64_t)v173, 19);
  id v98 = (id)objc_claimAutoreleasedReturnValue();

  return v98;
}

- (id)customAttributes
{
  uint64_t v2 = objc_opt_class();

  return (id)MEMORY[0x1F4181798](v2, sel_customAttributes, v3, v4, v5);
}

- (CMatrix)matrixFromArray:(SEL)a3 rowCount:(id)a4 columnCount:(unint64_t)a5
{
  id v9 = a4;
  if (v9
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (uint64_t v14 = objc_msgSend_count(v9, v10, v11, v12, v13), a6 <= 0xA)
    && a5 <= 0xA
    && v14)
  {
    sub_1DDAD823C((uint64_t)retstr, a5, a6);
    if (a5)
    {
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      while (!a6)
      {
LABEL_14:
        ++v20;
        v19 += a6;
        if (v20 == a5) {
          goto LABEL_17;
        }
      }
      uint64_t v21 = 0;
      while (v19 + v21 < (unint64_t)objc_msgSend_count(v9, v15, v16, v17, v18))
      {
        uint64_t v25 = objc_msgSend_objectAtIndexedSubscript_(v9, v22, v19 + v21, v23, v24);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend_doubleValue(v25, v26, v27, v28, v29);
          uint64_t v31 = v30;
          v34[0] = sub_1DDAD8560((uint64_t)retstr, v20);
          v34[1] = v32;
          *(void *)sub_1DDAD85FC((uint64_t)v34, v21) = v31;
        }

        if (++v21 >= a6) {
          goto LABEL_14;
        }
      }
    }
  }
  else
  {
    sub_1DDAD869C(retstr);
  }
LABEL_17:

  return result;
}

- (id)inputNeutralXY
{
  v26[2] = *MEMORY[0x1E4F143B8];
  objc_msgSend_cameraProfile(self, a2, v2, v3, v4);
  objc_msgSend_neutralWhitePointWithProfile_(self, v6, (uint64_t)v25, v7, v8);
  double v10 = v9;
  v15 = objc_msgSend_numberWithDouble_(NSNumber, v11, v12, v13, v14);
  v26[0] = v15;
  uint64_t v20 = objc_msgSend_numberWithDouble_(NSNumber, v16, v17, v18, v19, v10);
  v26[1] = v20;
  uint64_t v23 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v21, (uint64_t)v26, 2, v22);

  sub_1DDACB228(v25);

  return v23;
}

- (id)outputMatrix
{
  gamma[3] = *(CGFloat *)MEMORY[0x1E4F143B8];
  objc_msgSend_cameraProfile(self, a2, v2, v3, v4);
  objc_msgSend_neutralWhitePointWithProfile_(self, v6, (uint64_t)v95, v7, v8);
  v94[0] = v9;
  v94[1] = v10;
  sub_1DDAD8240((uint64_t)&v91, 3u, 3u, 0.6097, v11, v12, v13, v14, v15, 0x3FCA474538EF34D7);
  CFTypeRef v16 = self->inputColorSpace;
  if (v16 != sub_1DDBEE9BC())
  {
    gamma[2] = 1.0;
    *(_OWORD *)gamma = xmmword_1DDBFFBB0;
    *(_OWORD *)whitePoint = xmmword_1DDBFFBC8;
    whitePoint[2] = 0.824899971;
    CGFloat blackPoint = 0.0;
    uint64_t v118 = 0;
    uint64_t v119 = 0;
    uint64_t v112 = 0;
    long long v114 = 0u;
    long long v111 = 0u;
    CGFloat matrix = 1.0;
    uint64_t v113 = 0x3FF0000000000000;
    uint64_t v115 = 0;
    uint64_t v116 = 0x3FF0000000000000;
    uint64_t v105 = 0;
    long long v107 = 0u;
    long long v104 = 0u;
    uint64_t v103 = 0x3FF0000000000000;
    uint64_t v106 = 0x3FF0000000000000;
    uint64_t v108 = 0;
    uint64_t v109 = 0x3FF0000000000000;
    uint64_t v102 = 0;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    uint64_t v17 = CGColorSpaceCreateCalibratedRGB(whitePoint, &blackPoint, gamma, &matrix);
    MEMORY[0x1E01C3600](v17, 0);
    CGColorTransformConvertColorComponents();
    CGColorTransformConvertColorComponents();
    CGColorTransformConvertColorComponents();
    CGColorSpaceRelease(v17);
    CGColorTransformRelease();
    sub_1DDAD8240((uint64_t)&v89, 3u, 3u, *(double *)&v98 * 0.9642, v18, v19, v20, v21, v22, COERCE__INT64(*((double *)&v99 + 1) * 0.9642));
    sub_1DDAD88E8(&v91, (uint64_t)&v89);
    if (*((void *)&v89 + 1))
    {
      uint64_t v90 = *((void *)&v89 + 1);
      operator delete(*((void **)&v89 + 1));
    }
  }
  sub_1DDAD80E8(&v86, (uint64_t)&v91);
  sub_1DDB121FC((uint64_t)v95, v94, (unsigned int *)&v86, &matrix);
  if (v87)
  {
    v88 = v87;
    operator delete(v87);
  }
  sub_1DDAD8240((uint64_t)&v103, 3u, 1u, 1.0, v23, v24, v25, v26, v27, 0x3FF0000000000000);
  sub_1DDAD8FBC((unsigned int *)&matrix, &v89);
  sub_1DDAD8BC8((unsigned int *)&v89, &v103, (uint64_t)&v98);
  if (*((void *)&v89 + 1))
  {
    uint64_t v90 = *((void *)&v89 + 1);
    operator delete(*((void **)&v89 + 1));
  }
  double v28 = sub_1DDAD97A4((unsigned int *)&v98);
  *(void *)&long long v89 = sub_1DDAD8560((uint64_t)&v98, 0);
  *((void *)&v89 + 1) = v29;
  double v30 = *(double *)sub_1DDAD85FC((uint64_t)&v89, 0);
  double v31 = sub_1DDAD97A4((unsigned int *)&v98);
  *(void *)&long long v89 = sub_1DDAD8560((uint64_t)&v98, 1u);
  *((void *)&v89 + 1) = v32;
  double v33 = *(double *)sub_1DDAD85FC((uint64_t)&v89, 0);
  double v34 = sub_1DDAD97A4((unsigned int *)&v98);
  *(void *)&long long v89 = sub_1DDAD8560((uint64_t)&v98, 2u);
  *((void *)&v89 + 1) = v35;
  double v36 = *(double *)sub_1DDAD85FC((uint64_t)&v89, 0);
  v96[0] = @"inputRVector";
  uint64_t v37 = (void *)MEMORY[0x1E4F1E080];
  *(void *)&long long v89 = sub_1DDAD8560((uint64_t)&matrix, 0);
  *((void *)&v89 + 1) = v38;
  double v39 = *(double *)sub_1DDAD85FC((uint64_t)&v89, 0);
  *(void *)&gamma[0] = sub_1DDAD8560((uint64_t)&matrix, 0);
  gamma[1] = v40;
  double v41 = *(double *)sub_1DDAD85FC((uint64_t)gamma, 1u);
  *(void *)&whitePoint[0] = sub_1DDAD8560((uint64_t)&matrix, 0);
  whitePoint[1] = v42;
  uint64_t v43 = (double *)sub_1DDAD85FC((uint64_t)whitePoint, 2u);
  uint64_t v48 = objc_msgSend_vectorWithX_Y_Z_(v37, v44, v45, v46, v47, v39, v41, *v43);
  v97[0] = v48;
  v96[1] = @"inputGVector";
  uint64_t v49 = (void *)MEMORY[0x1E4F1E080];
  *(void *)&CGFloat blackPoint = sub_1DDAD8560((uint64_t)&matrix, 1u);
  uint64_t v118 = v50;
  double v51 = *(double *)sub_1DDAD85FC((uint64_t)&blackPoint, 0);
  v85[0] = sub_1DDAD8560((uint64_t)&matrix, 1u);
  v85[1] = v52;
  double v53 = *(double *)sub_1DDAD85FC((uint64_t)v85, 1u);
  v84[0] = sub_1DDAD8560((uint64_t)&matrix, 1u);
  v84[1] = v54;
  uint64_t v55 = (double *)sub_1DDAD85FC((uint64_t)v84, 2u);
  uint64_t v60 = objc_msgSend_vectorWithX_Y_Z_(v49, v56, v57, v58, v59, v51, v53, *v55);
  v97[1] = v60;
  v96[2] = @"inputBVector";
  uint64_t v61 = (void *)MEMORY[0x1E4F1E080];
  v83[0] = sub_1DDAD8560((uint64_t)&matrix, 2u);
  v83[1] = v62;
  double v63 = *(double *)sub_1DDAD85FC((uint64_t)v83, 0);
  v82[0] = sub_1DDAD8560((uint64_t)&matrix, 2u);
  v82[1] = v64;
  double v65 = *(double *)sub_1DDAD85FC((uint64_t)v82, 1u);
  v81[0] = sub_1DDAD8560((uint64_t)&matrix, 2u);
  v81[1] = v66;
  uint64_t v67 = (double *)sub_1DDAD85FC((uint64_t)v81, 2u);
  uint64_t v72 = objc_msgSend_vectorWithX_Y_Z_(v61, v68, v69, v70, v71, v63, v65, *v67);
  v97[2] = v72;
  v96[3] = @"inputFactors";
  v77 = objc_msgSend_vectorWithX_Y_Z_(MEMORY[0x1E4F1E080], v73, v74, v75, v76, v28 / v30, v31 / v33, v34 / v36);
  v97[3] = v77;
  uint64_t v79 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v78, (uint64_t)v97, (uint64_t)v96, 4);

  if (*((void *)&v98 + 1))
  {
    *(void *)&long long v99 = *((void *)&v98 + 1);
    operator delete(*((void **)&v98 + 1));
  }
  if ((void)v104)
  {
    *((void *)&v104 + 1) = v104;
    operator delete((void *)v104);
  }
  if ((void)v111)
  {
    *((void *)&v111 + 1) = v111;
    operator delete((void *)v111);
  }
  if (v92)
  {
    v93 = v92;
    operator delete(v92);
  }
  sub_1DDACB228(v95);

  return v79;
}

- (id)blendFactor
{
  objc_msgSend_cameraProfile(self, a2, v2, v3, v4);
  objc_msgSend_neutralWhitePointWithProfile_(self, v6, (uint64_t)v19, v7, v8);
  v18[0] = v9;
  v18[1] = v10;
  double v11 = sub_1DDB13200((uint64_t)v19, v18);
  CFTypeRef v16 = objc_msgSend_numberWithDouble_(NSNumber, v12, v13, v14, v15, v11);
  sub_1DDACB228(v19);

  return v16;
}

- (id)outputImage
{
  v266[3] = *MEMORY[0x1E4F143B8];
  if (self->inputImage)
  {
    uint64_t v6 = objc_msgSend_outputMatrix(self, a2, v2, v3, v4);
    uint64_t v7 = (void *)v6;
    if (v6)
    {
      v263 = (void *)v6;
      uint64_t v8 = sub_1DDA83E7C();
      double v9 = v8;
      if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DDA14000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWConvert", (const char *)&unk_1DDC3ACB6, buf, 2u);
      }

      v264[0] = MEMORY[0x1E4F143A8];
      v264[1] = 3221225472;
      v264[2] = sub_1DDB9BFF8;
      v264[3] = &unk_1E6D04A58;
      v264[4] = self;
      v261 = (void (**)(void))MEMORY[0x1E01C46E0](v264);
      double v10 = self->inputImage;
      uint64_t v262 = sub_1DDBEE610(v10);
      if (objc_msgSend_BOOLValue(self->inputShouldLinearize, v11, v12, v13, v14))
      {
        uint64_t v19 = objc_msgSend_kernelWithName_(RAWKernels, v15, @"raw_srgb_to_linear", v17, v18);
        uint64_t v21 = objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v20, (uint64_t)v19, (uint64_t)v10, 0, v262, 1);

        double v10 = (CIImage *)v21;
      }
      inputBlacks = self->inputBlacks;
      objc_msgSend_null(MEMORY[0x1E4F1CA98], v15, v16, v17, v18);
      uint64_t v27 = (CIVector *)objc_claimAutoreleasedReturnValue();
      if (inputBlacks == v27
        || (objc_msgSend_X(self->inputBlacks, v23, v24, v25, v26), v32 == 0.0)
        || (objc_msgSend_Y(self->inputBlacks, v28, v29, v30, v31), v37 == 0.0))
      {
        BOOL v39 = 0;
      }
      else
      {
        objc_msgSend_Z(self->inputBlacks, v33, v34, v35, v36);
        BOOL v39 = v38 != 0.0;
      }

      int v44 = objc_msgSend_intValue(self->inputTargetRange, v40, v41, v42, v43);
      int v49 = objc_msgSend_intValue(self->inputRange, v45, v46, v47, v48);
      if ((int)objc_msgSend_intValue(self->inputTargetRange, v50, v51, v52, v53) <= 0
        || (int)objc_msgSend_intValue(self->inputRange, v54, v55, v56, v57) <= 0
        || (objc_msgSend_floatValue(self->inputFactor, v58, v59, v60, v61), v66 <= 0.0))
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x1E01C3B90](exception, "RawCameraException");
        __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      int v67 = v44 != v49 || v39;
      if (v67 == 1)
      {
        if (v39)
        {
          v68 = self->inputBlacks;
        }
        else
        {
          objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v62, v63, v64, v65, 0.0, 0.0, 0.0, 0.0);
          v68 = (CIVector *)objc_claimAutoreleasedReturnValue();
        }
        uint64_t v75 = v68;
        objc_msgSend_floatValue(self->inputTargetRange, v69, v70, v71, v72);
        float v77 = v76;
        objc_msgSend_floatValue(self->inputRange, v78, v79, v80, v81);
        float v83 = v82;
        objc_msgSend_floatValue(self->inputFactor, v84, v85, v86, v87);
        float v89 = v88;
        uint64_t v90 = (void *)MEMORY[0x1E4F1E080];
        objc_msgSend_X(v75, v91, v92, v93, v94);
        double v96 = v95;
        objc_msgSend_Y(v75, v97, v98, v99, v100);
        double v102 = v101;
        objc_msgSend_Z(v75, v103, v104, v105, v106);
        double v107 = (float)(v77 / (float)(v83 * v89));
        uint64_t v113 = objc_msgSend_vectorWithX_Y_Z_W_(v90, v109, v110, v111, v112, v107 * v96 / -65535.0, -(v102 * v107) / 65535.0, -(v108 * v107) / 65535.0, 0.0);
        uint64_t v118 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v114, v115, v116, v117, v107, 0.0, 0.0, 0.0);
        v123 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v119, v120, v121, v122, 0.0, v107, 0.0, 0.0);
        v128 = objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E4F1E080], v124, v125, v126, v127, 0.0, 0.0, v107, 0.0);
        uint64_t v130 = objc_msgSend_applyMatrixToImage_vectorR_vectorG_vectorB_vectorBias_inSpace_outSpace_(self, v129, (uint64_t)v10, (uint64_t)v118, (uint64_t)v123, v128, v113, v262);

        v131 = (void *)MEMORY[0x1E4F1E080];
        objc_msgSend_floatValue(self->inputRange, v132, v133, v134, v135);
        LODWORD(v107) = v136;
        objc_msgSend_floatValue(self->inputRange, v137, v138, v139, v140);
        float v142 = v141;
        objc_msgSend_X(v75, v143, v144, v145, v146);
        double v148 = v147;
        objc_msgSend_floatValue(self->inputRange, v149, v150, v151, v152);
        LODWORD(v96) = v153;
        objc_msgSend_floatValue(self->inputRange, v154, v155, v156, v157);
        LODWORD(v102) = v158;
        objc_msgSend_Y(v75, v159, v160, v161, v162);
        double v164 = v163;
        objc_msgSend_floatValue(self->inputRange, v165, v166, v167, v168);
        float v170 = v169;
        objc_msgSend_floatValue(self->inputRange, v171, v172, v173, v174);
        float v176 = v175;
        objc_msgSend_Z(v75, v177, v178, v179, v180);
        uint64_t v74 = objc_msgSend_vectorWithX_Y_Z_W_(v131, v182, v183, v184, v185, *(float *)&v107 / (v148 + v142), *(float *)&v96 / (v164 + *(float *)&v102), v170 / (v181 + v176), 0.0);

        double v10 = (CIImage *)v130;
      }
      else
      {
        uint64_t v74 = 0;
      }
      if (objc_msgSend_BOOLValue(self->inputShouldRecoverHighlights, v62, v63, v64, v65))
      {
        v189 = objc_msgSend_objectForKeyedSubscript_(v263, v186, @"inputFactors", v187, v188);
        objc_msgSend_X(v189, v190, v191, v192, v193);
        double v195 = v194;
        objc_msgSend_Y(v189, v196, v197, v198, v199);
        double v201 = v200;
        objc_msgSend_Z(v189, v202, v203, v204, v205);
        float v210 = v195;
        float v211 = v201;
        float v213 = v212;
        float v214 = v210;
        float v215 = v211;
        float v216 = v213;
        if (v74)
        {
          objc_msgSend_X(v74, v206, v207, v208, v209);
          double v218 = v217;
          objc_msgSend_Y(v74, v219, v220, v221, v222);
          double v224 = v223;
          objc_msgSend_Z(v74, v225, v226, v227, v228);
          float v229 = v218;
          float v214 = v210 * v229;
          float v230 = v224;
          float v215 = v211 * v230;
          *(float *)&double v231 = v231;
          float v216 = v213 * *(float *)&v231;
        }
        float v232 = v215 * 0.9;
        if ((float)(v215 * 0.9) > v214) {
          float v232 = v214;
        }
        if (v232 <= v216) {
          float v233 = v232;
        }
        else {
          float v233 = v216;
        }
        v234 = objc_msgSend_vectorWithX_Y_Z_(MEMORY[0x1E4F1E080], v206, v207, v208, v209, v214, v233, v216);
        v239 = objc_msgSend_vectorWithX_Y_Z_(MEMORY[0x1E4F1E080], v235, v236, v237, v238, 1.0 / v210, 1.0 / v211, 1.0 / v213);
        v243 = objc_msgSend_kernelWithName_(RAWKernels, v240, @"RAWRecoverHighlightsV2", v241, v242);
        v266[0] = v189;
        v266[1] = v234;
        v266[2] = v239;
        v246 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v244, (uint64_t)v266, 3, v245);
        uint64_t v248 = objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v247, (uint64_t)v243, (uint64_t)v10, (uint64_t)v246, v262, 1);

        double v10 = (CIImage *)v248;
      }
      v249 = objc_msgSend_objectForKeyedSubscript_(v263, v186, @"inputRVector", v187, v188);
      v253 = objc_msgSend_objectForKeyedSubscript_(v263, v250, @"inputGVector", v251, v252);
      v257 = objc_msgSend_objectForKeyedSubscript_(v263, v254, @"inputBVector", v255, v256);
      objc_msgSend_applyMatrixToImage_vectorR_vectorG_vectorB_vectorBias_inSpace_outSpace_(self, v258, (uint64_t)v10, (uint64_t)v249, (uint64_t)v253, v257, 0, v262, self->inputColorSpace);
      uint64_t v73 = (CIImage *)objc_claimAutoreleasedReturnValue();

      v261[2](v261);
      uint64_t v7 = v263;
    }
    else
    {
      uint64_t v73 = self->inputImage;
    }
  }
  else
  {
    uint64_t v73 = 0;
  }

  return v73;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputTargetRange, 0);
  objc_storeStrong((id *)&self->inputBlacks, 0);
  objc_storeStrong((id *)&self->inputShouldLinearize, 0);
  objc_storeStrong((id *)&self->inputShouldRecoverHighlights, 0);
  objc_storeStrong((id *)&self->inputShouldUseForwardMatrix, 0);
  objc_storeStrong((id *)&self->inputForwardMatrix2, 0);
  objc_storeStrong((id *)&self->inputForwardMatrix1, 0);
  objc_storeStrong((id *)&self->inputReduction2, 0);
  objc_storeStrong((id *)&self->inputReduction1, 0);
  objc_storeStrong((id *)&self->inputCameraCalibration2, 0);
  objc_storeStrong((id *)&self->inputCameraCalibration1, 0);
  objc_storeStrong((id *)&self->inputXYZtoCamera2, 0);
  objc_storeStrong((id *)&self->inputXYZtoCamera1, 0);
  objc_storeStrong((id *)&self->inputCalibrationIlluminant2, 0);
  objc_storeStrong((id *)&self->inputCalibrationIlluminant1, 0);
  objc_storeStrong((id *)&self->inputFactor, 0);
  objc_storeStrong((id *)&self->inputRange, 0);
  objc_storeStrong((id *)&self->inputNeutral, 0);
  objc_storeStrong(&self->inputColorSpace, 0);

  objc_storeStrong((id *)&self->inputImage, 0);
}

- (CCameraProfile)cameraProfile
{
  sub_1DDB0B8CC((uint64_t)&v35);
  unint64_t v9 = objc_msgSend_count(self->inputXYZtoCamera1, v5, v6, v7, v8);
  int v36 = objc_msgSend_intValue(self->inputCalibrationIlluminant1, v10, v11, v12, v13);
  unint64_t v18 = v9 / 3;
  int v37 = objc_msgSend_intValue(self->inputCalibrationIlluminant2, v14, v15, v16, v17);
  objc_msgSend_matrixFromArray_rowCount_columnCount_(self, v19, (uint64_t)self->inputXYZtoCamera1, v18, 3);
  sub_1DDAD88E8(v38, (uint64_t)v32);
  if (__p)
  {
    uint64_t v34 = __p;
    operator delete(__p);
  }
  objc_msgSend_matrixFromArray_rowCount_columnCount_(self, v20, (uint64_t)self->inputXYZtoCamera2, v18, 3);
  sub_1DDAD88E8(v39, (uint64_t)v32);
  if (__p)
  {
    uint64_t v34 = __p;
    operator delete(__p);
  }
  objc_msgSend_matrixFromArray_rowCount_columnCount_(self, v21, (uint64_t)self->inputCameraCalibration1, v18, v18);
  sub_1DDAD88E8(v40, (uint64_t)v32);
  if (__p)
  {
    uint64_t v34 = __p;
    operator delete(__p);
  }
  objc_msgSend_matrixFromArray_rowCount_columnCount_(self, v22, (uint64_t)self->inputCameraCalibration2, v18, v18);
  sub_1DDAD88E8(v41, (uint64_t)v32);
  if (__p)
  {
    uint64_t v34 = __p;
    operator delete(__p);
  }
  objc_msgSend_matrixFromArray_rowCount_columnCount_(self, v23, (uint64_t)self->inputReduction1, 3, v18);
  sub_1DDAD88E8(v45, (uint64_t)v32);
  if (__p)
  {
    uint64_t v34 = __p;
    operator delete(__p);
  }
  objc_msgSend_matrixFromArray_rowCount_columnCount_(self, v24, (uint64_t)self->inputReduction2, 3, v18);
  sub_1DDAD88E8(v46, (uint64_t)v32);
  if (__p)
  {
    uint64_t v34 = __p;
    operator delete(__p);
  }
  objc_msgSend_matrixFromArray_rowCount_columnCount_(self, v25, (uint64_t)self->inputForwardMatrix1, 3, v18);
  sub_1DDAD88E8(v42, (uint64_t)v32);
  if (__p)
  {
    uint64_t v34 = __p;
    operator delete(__p);
  }
  objc_msgSend_matrixFromArray_rowCount_columnCount_(self, v26, (uint64_t)self->inputForwardMatrix2, 3, v18);
  sub_1DDAD88E8(v43, (uint64_t)v32);
  if (__p)
  {
    uint64_t v34 = __p;
    operator delete(__p);
  }
  __int16 v44 = objc_msgSend_intValue(self->inputShouldUseForwardMatrix, v27, v28, v29, v30);
  sub_1DDB9C93C((uint64_t)retstr, (uint64_t)&v35);
  return (CCameraProfile *)sub_1DDACB228(&v35);
}

- (CWhitePoint)neutralWhitePointWithProfile:(void *)a3
{
  double v71 = 0.0;
  double v72 = 0.0;
  unint64_t v10 = objc_msgSend_count(self->inputNeutral, a2, (uint64_t)a3, v3, v4);
  double v11 = 0.0;
  if (v10)
  {
    uint64_t v12 = objc_msgSend_objectAtIndexedSubscript_(self->inputNeutral, v7, 0, v8, v9);
    objc_msgSend_doubleValue(v12, v13, v14, v15, v16);
    double v18 = v17;

    if (v10 < 2)
    {
      double v28 = 0.0;
    }
    else
    {
      uint64_t v22 = objc_msgSend_objectAtIndexedSubscript_(self->inputNeutral, v19, 1, v20, v21);
      objc_msgSend_doubleValue(v22, v23, v24, v25, v26);
      double v28 = v27;

      if (v10 >= 3)
      {
        double v32 = objc_msgSend_objectAtIndexedSubscript_(self->inputNeutral, v29, 2, v30, v31);
        objc_msgSend_doubleValue(v32, v33, v34, v35, v36);
        double v11 = v37;
      }
    }
  }
  else
  {
    double v28 = 0.0;
    double v18 = 0.0;
  }
  if (v10 == 2 && v18 < 1.0)
  {
    BOOL v39 = v18 > 0.0 && v28 < 1.0;
    if (v39 && v28 > 0.0)
    {
      double v40 = v18;
      double v41 = v28;
      goto LABEL_63;
    }
  }
  if (v10 == 2 && v18 >= 2000.0 && v18 <= 50000.0)
  {
    sub_1DDB1112C(&v71, v18, v28);
    double v40 = v71;
    double v41 = v72;
    goto LABEL_63;
  }
  double v40 = 0.0;
  if (v10 != 3 || v18 <= 0.0 || v28 <= 0.0)
  {
    double v41 = 0.0;
    goto LABEL_63;
  }
  double v41 = 0.0;
  if (v11 > 0.0)
  {
    unint64_t v70 = 0;
    uint64_t v42 = (double *)sub_1DDA1814C((uint64_t)&v70, 1uLL);
    unint64_t v44 = (unint64_t)&v42[v43];
    *uint64_t v42 = v18;
    uint64_t v45 = v42 + 1;
    __p = v42;
    unint64_t v70 = v44;
    uint64_t v69 = v42 + 1;
    if ((unint64_t)(v42 + 1) >= v44)
    {
      uint64_t v47 = (double *)__p;
      uint64_t v48 = ((char *)v45 - (unsigned char *)__p) >> 3;
      unint64_t v49 = v48 + 1;
      if ((unint64_t)(v48 + 1) >> 61) {
        goto LABEL_61;
      }
      uint64_t v50 = v44 - (void)__p;
      if (v50 >> 2 > v49) {
        unint64_t v49 = v50 >> 2;
      }
      if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v51 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v51 = v49;
      }
      if (v51)
      {
        uint64_t v52 = (char *)sub_1DDA1814C((uint64_t)&v70, v51);
        uint64_t v47 = (double *)__p;
        uint64_t v45 = v69;
      }
      else
      {
        uint64_t v52 = 0;
      }
      uint64_t v53 = (double *)&v52[8 * v48];
      unint64_t v44 = (unint64_t)&v52[8 * v51];
      *uint64_t v53 = v28;
      uint64_t v46 = v53 + 1;
      while (v45 != v47)
      {
        uint64_t v54 = *((void *)v45-- - 1);
        *((void *)v53-- - 1) = v54;
      }
      __p = v53;
      uint64_t v69 = v46;
      unint64_t v70 = v44;
      if (v47)
      {
        operator delete(v47);
        unint64_t v44 = v70;
      }
    }
    else
    {
      v42[1] = v28;
      uint64_t v46 = v42 + 2;
    }
    uint64_t v69 = v46;
    if ((unint64_t)v46 < v44)
    {
      double *v46 = v11;
      uint64_t v55 = v46 + 1;
LABEL_59:
      uint64_t v69 = v55;
      double v40 = sub_1DDB13638((unsigned int *)a3, (uint64_t *)&__p);
      double v41 = v65;
      if (__p)
      {
        uint64_t v69 = (double *)__p;
        operator delete(__p);
      }
      goto LABEL_63;
    }
    uint64_t v56 = (double *)__p;
    uint64_t v57 = ((char *)v46 - (unsigned char *)__p) >> 3;
    unint64_t v58 = v57 + 1;
    if (!((unint64_t)(v57 + 1) >> 61))
    {
      uint64_t v59 = v44 - (void)__p;
      if (v59 >> 2 > v58) {
        unint64_t v58 = v59 >> 2;
      }
      if ((unint64_t)v59 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v60 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v60 = v58;
      }
      if (v60)
      {
        uint64_t v61 = (char *)sub_1DDA1814C((uint64_t)&v70, v60);
        uint64_t v56 = (double *)__p;
        uint64_t v46 = v69;
      }
      else
      {
        uint64_t v61 = 0;
      }
      uint64_t v62 = (double *)&v61[8 * v57];
      uint64_t v63 = &v61[8 * v60];
      double *v62 = v11;
      uint64_t v55 = v62 + 1;
      while (v46 != v56)
      {
        uint64_t v64 = *((void *)v46-- - 1);
        *((void *)v62-- - 1) = v64;
      }
      __p = v62;
      uint64_t v69 = v55;
      unint64_t v70 = (unint64_t)v63;
      if (v56) {
        operator delete(v56);
      }
      goto LABEL_59;
    }
LABEL_61:
    sub_1DDA17F78();
  }
LABEL_63:
  double v66 = v40;
  double v67 = v41;
  result.var1 = v67;
  result.var0 = v66;
  return result;
}

@end