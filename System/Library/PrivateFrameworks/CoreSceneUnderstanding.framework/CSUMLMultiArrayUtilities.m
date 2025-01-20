@interface CSUMLMultiArrayUtilities
+ (BOOL)compareMLMultiArrayShapesForShape1:(id)a3 Shape2:(id)a4;
+ (id)castToFP16WithDeepCopyFromTensor:(const void *)a3;
+ (id)copyFromNSDataAndReshape:(id)a3 shape:(id)a4;
+ (id)deepCopyFromTensor:(const void *)a3;
+ (id)reshapeMLMultiArray:(id)a3 toShape:(id)a4;
+ (id)shallowCopyFromTensor:(const void *)a3;
+ (void)printMLMultiArray:(id)a3;
@end

@implementation CSUMLMultiArrayUtilities

+ (id)shallowCopyFromTensor:(const void *)a3
{
  v119[1] = *MEMORY[0x263EF8340];
  v3 = (void *)*((void *)a3 + 5);
  switch(espresso_buffer_get_rank())
  {
    case 1:
      v7 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v4, v3[11], v5, v6);
      v119[0] = v7;
      v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v8, (uint64_t)v119, 1, v9);
      v11 = &unk_26FEEA410;
      goto LABEL_9;
    case 2:
      v48 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v4, v3[12], v5, v6);
      v118[0] = v48;
      v52 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v49, v3[11], v50, v51);
      v118[1] = v52;
      v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v53, (uint64_t)v118, 2, v54);

      v7 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v55, v3[11], v56, v57);
      v117[0] = v7;
      v117[1] = &unk_26FEEA230;
      v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v58, (uint64_t)v117, 2, v59);
      goto LABEL_9;
    case 3:
      v60 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v4, v3[13], v5, v6);
      v116[0] = v60;
      v64 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v61, v3[12], v62, v63);
      v116[1] = v64;
      v68 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v65, v3[11], v66, v67);
      v116[2] = v68;
      v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v69, (uint64_t)v116, 3, v70);

      v7 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v71, v3[11] * v3[12], v72, v73);
      v115[0] = v7;
      v37 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v74, v3[11], v75, v76);
      v115[1] = v37;
      v115[2] = &unk_26FEEA230;
      v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v77, (uint64_t)v115, 3, v78);
      goto LABEL_8;
    case 4:
      v79 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v4, v3[14], v5, v6);
      v114[0] = v79;
      v83 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v80, v3[13], v81, v82);
      v114[1] = v83;
      v87 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v84, v3[12], v85, v86);
      v114[2] = v87;
      v91 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v88, v3[11], v89, v90);
      v114[3] = v91;
      v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v92, (uint64_t)v114, 4, v93);

      v7 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v94, v3[12] * v3[13] * v3[11], v95, v96);
      v113[0] = v7;
      v37 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v97, v3[11] * v3[12], v98, v99);
      v113[1] = v37;
      v41 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v100, v3[11], v101, v102);
      v113[2] = v41;
      v113[3] = &unk_26FEEA230;
      v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v103, (uint64_t)v113, 4, v104);
      goto LABEL_7;
    default:
      v12 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v4, v3[15], v5, v6);
      v112[0] = v12;
      v16 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v13, v3[14], v14, v15);
      v112[1] = v16;
      v20 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v17, v3[13], v18, v19);
      v112[2] = v20;
      v24 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v21, v3[12], v22, v23);
      v112[3] = v24;
      v28 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v25, v3[11], v26, v27);
      v112[4] = v28;
      v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v29, (uint64_t)v112, 5, v30);

      v7 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v31, v3[13] * v3[14] * v3[12] * v3[11], v32, v33);
      v111[0] = v7;
      v37 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v34, v3[12] * v3[13] * v3[11], v35, v36);
      v111[1] = v37;
      v41 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v38, v3[11] * v3[12], v39, v40);
      v111[2] = v41;
      v45 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v42, v3[11], v43, v44);
      v111[3] = v45;
      v111[4] = &unk_26FEEA230;
      v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v46, (uint64_t)v111, 5, v47);

LABEL_7:
LABEL_8:

LABEL_9:
      id v105 = objc_alloc(MEMORY[0x263F00DA8]);
      uint64_t v106 = v3[1];
      uint64_t v110 = 0;
      v108 = objc_msgSend_initWithDataPointer_shape_dataType_strides_deallocator_error_(v105, v107, v106, (uint64_t)v10, 65568, v11, 0, &v110);

      return v108;
  }
}

+ (id)deepCopyFromTensor:(const void *)a3
{
  v70[1] = *MEMORY[0x263EF8340];
  v3 = (uint64_t *)*((void *)a3 + 5);
  v4 = v3 + 1;
  switch(espresso_buffer_get_rank())
  {
    case 1:
      v8 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v5, v3[11], v6, v7);
      v70[0] = v8;
      v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v9, (uint64_t)v70, 1, v10);
      goto LABEL_10;
    case 2:
      uint64_t v12 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v5, v3[12], v6, v7);
      v69[0] = v12;
      v16 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v32, v3[11], v33, v34);
      v69[1] = v16;
      uint64_t v31 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v35, (uint64_t)v69, 2, v36);
      goto LABEL_9;
    case 3:
      uint64_t v12 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v5, v3[13], v6, v7);
      v68[0] = v12;
      v16 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v37, v3[12], v38, v39);
      v68[1] = v16;
      v20 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v40, v3[11], v41, v42);
      v68[2] = v20;
      uint64_t v31 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v43, (uint64_t)v68, 3, v44);
      goto LABEL_8;
    case 4:
      uint64_t v12 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v5, v3[14], v6, v7);
      v67[0] = v12;
      v16 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v45, v3[13], v46, v47);
      v67[1] = v16;
      v20 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v48, v3[12], v49, v50);
      v67[2] = v20;
      v24 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v51, v3[11], v52, v53);
      v67[3] = v24;
      uint64_t v31 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v54, (uint64_t)v67, 4, v55);
      goto LABEL_7;
    default:
      uint64_t v12 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v5, v3[15], v6, v7);
      v66[0] = v12;
      v16 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v13, v3[14], v14, v15);
      v66[1] = v16;
      v20 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v17, v3[13], v18, v19);
      v66[2] = v20;
      v24 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v21, v3[12], v22, v23);
      v66[3] = v24;
      v28 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v25, v3[11], v26, v27);
      v66[4] = v28;
      uint64_t v31 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v29, (uint64_t)v66, 5, v30);

LABEL_7:
LABEL_8:

LABEL_9:
      v8 = (void *)v12;
      v11 = (void *)v31;
LABEL_10:

      id v56 = objc_alloc(MEMORY[0x263F00DA8]);
      id v65 = 0;
      v58 = objc_msgSend_initWithShape_dataType_error_(v56, v57, (uint64_t)v11, 65568, (uint64_t)&v65);
      id v59 = v65;
      v64[0] = MEMORY[0x263EF8330];
      v64[1] = 3221225472;
      v64[2] = sub_24C697194;
      v64[3] = &unk_2652E7FA0;
      v64[4] = v4;
      objc_msgSend_getMutableBytesWithHandler_(v58, v60, (uint64_t)v64, v61, v62);

      return v58;
  }
}

+ (id)castToFP16WithDeepCopyFromTensor:(const void *)a3
{
  v88[1] = *MEMORY[0x263EF8340];
  v3 = (uint64_t *)*((void *)a3 + 5);
  v4 = v3 + 1;
  uint64_t v6 = (int32x4_t *)*((void *)a3 + 2);
  uint64_t v5 = (int32x4_t *)*((void *)a3 + 3);
  if (v6 != v5)
  {
    unint64_t v7 = (char *)v5 - (char *)v6 - 8;
    if (v7 >= 0x38)
    {
      uint64_t v35 = (v7 >> 3) + 1;
      uint64_t v9 = (int32x4_t *)((char *)v6 + 8 * (v35 & 0x3FFFFFFFFFFFFFF8));
      uint64_t v36 = v6 + 2;
      v37.i64[0] = 0x100000001;
      v37.i64[1] = 0x100000001;
      uint64_t v38 = v35 & 0x3FFFFFFFFFFFFFF8;
      v39.i64[0] = 0x100000001;
      v39.i64[1] = 0x100000001;
      do
      {
        int32x4_t v41 = v36[-2];
        int32x4_t v40 = v36[-1];
        int32x4_t v43 = *v36;
        int32x4_t v42 = v36[1];
        v36 += 4;
        int32x4_t v37 = vmulq_s32(v37, vuzp1q_s32(v41, v40));
        int32x4_t v39 = vmulq_s32(v39, vuzp1q_s32(v43, v42));
        v38 -= 8;
      }
      while (v38);
      int8x16_t v44 = (int8x16_t)vmulq_s32(v39, v37);
      *(int32x2_t *)v44.i8 = vmul_s32(*(int32x2_t *)v44.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v44, v44, 8uLL));
      int v8 = v44.i32[0] * v44.i32[1];
      if (v35 == (v35 & 0x3FFFFFFFFFFFFFF8)) {
        goto LABEL_10;
      }
    }
    else
    {
      int v8 = 1;
      uint64_t v9 = (int32x4_t *)*((void *)a3 + 2);
    }
    do
    {
      int v45 = v9->i32[0];
      uint64_t v9 = (int32x4_t *)((char *)v9 + 8);
      v8 *= v45;
    }
    while (v9 != v5);
LABEL_10:
    uint64_t v10 = v8;
    unint64_t v14 = espresso_buffer_get_rank() - 1;
LABEL_11:
    switch(v14)
    {
      case 0uLL:
        uint64_t v46 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v11, v3[11], v12, v13);
        v88[0] = v46;
        uint64_t v49 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v47, (uint64_t)v88, 1, v48);
        break;
      case 1uLL:
        uint64_t v15 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v11, v3[12], v12, v13);
        v87[0] = v15;
        uint64_t v19 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v50, v3[11], v51, v52);
        v87[1] = v19;
        uint64_t v34 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v53, (uint64_t)v87, 2, v54);
        goto LABEL_18;
      case 2uLL:
        uint64_t v15 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v11, v3[13], v12, v13);
        v86[0] = v15;
        uint64_t v19 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v55, v3[12], v56, v57);
        v86[1] = v19;
        uint64_t v23 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v58, v3[11], v59, v60);
        v86[2] = v23;
        uint64_t v34 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v61, (uint64_t)v86, 3, v62);
        goto LABEL_17;
      case 3uLL:
        uint64_t v15 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v11, v3[14], v12, v13);
        v85[0] = v15;
        uint64_t v19 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v63, v3[13], v64, v65);
        v85[1] = v19;
        uint64_t v23 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v66, v3[12], v67, v68);
        v85[2] = v23;
        uint64_t v27 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v69, v3[11], v70, v71);
        v85[3] = v27;
        uint64_t v34 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v72, (uint64_t)v85, 4, v73);
        goto LABEL_16;
      default:
        goto LABEL_5;
    }
    goto LABEL_19;
  }
  uint64_t v10 = 0;
  unint64_t v14 = espresso_buffer_get_rank() - 1;
  if (v14 <= 3) {
    goto LABEL_11;
  }
LABEL_5:
  uint64_t v15 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v11, v3[15], v12, v13);
  v84[0] = v15;
  uint64_t v19 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v16, v3[14], v17, v18);
  v84[1] = v19;
  uint64_t v23 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v20, v3[13], v21, v22);
  v84[2] = v23;
  uint64_t v27 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v24, v3[12], v25, v26);
  v84[3] = v27;
  uint64_t v31 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v28, v3[11], v29, v30);
  v84[4] = v31;
  uint64_t v34 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v32, (uint64_t)v84, 5, v33);

LABEL_16:
LABEL_17:

LABEL_18:
  uint64_t v46 = (void *)v15;
  uint64_t v49 = (void *)v34;
LABEL_19:

  id v74 = objc_alloc(MEMORY[0x263F00DA8]);
  id v83 = 0;
  uint64_t v76 = objc_msgSend_initWithShape_dataType_error_(v74, v75, (uint64_t)v49, 65552, (uint64_t)&v83);
  id v77 = v83;
  v82[0] = MEMORY[0x263EF8330];
  v82[1] = 3221225472;
  v82[2] = sub_24C6976AC;
  v82[3] = &unk_2652E7FC0;
  v82[4] = v4;
  v82[5] = v10;
  objc_msgSend_getMutableBytesWithHandler_(v76, v78, (uint64_t)v82, v79, v80);

  return v76;
}

+ (void)printMLMultiArray:(id)a3
{
  id v11 = a3;
  uint64_t v7 = objc_msgSend_dataType(v11, v3, v4, v5, v6);
  NSLog(&cfstr_ArrDatatypeLd.isa, v7);
  objc_msgSend_getMutableBytesWithHandler_(v11, v8, (uint64_t)&unk_26FEDDB88, v9, v10);
}

+ (id)copyFromNSDataAndReshape:(id)a3 shape:(id)a4
{
  v216[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  unint64_t v11 = objc_msgSend_length(v5, v7, v8, v9, v10);
  id v12 = v5;
  uint64_t v17 = objc_msgSend_bytes(v12, v13, v14, v15, v16);
  uint64_t v25 = objc_msgSend_count(v6, v18, v19, v20, v21);
  if (!v25)
  {
    if (v11 >> 2 == 1) {
      goto LABEL_5;
    }
LABEL_8:
    uint64_t v36 = 0;
    goto LABEL_16;
  }
  uint64_t v26 = 0;
  uint64_t v27 = 1;
  do
  {
    v28 = objc_msgSend_objectAtIndexedSubscript_(v6, v22, v26, v23, v24);
    v27 *= objc_msgSend_unsignedIntValue(v28, v29, v30, v31, v32);

    ++v26;
  }
  while (v25 != v26);
  if (v27 != v11 >> 2) {
    goto LABEL_8;
  }
LABEL_5:
  uint64_t v33 = &unk_26FEEA428;
  switch(v25)
  {
    case 1:
      goto LABEL_15;
    case 2:
      v210 = objc_msgSend_objectAtIndex_(v6, v22, 1, v23, v24);
      v216[0] = v210;
      v216[1] = &unk_26FEEA230;
      uint64_t v33 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v34, (uint64_t)v216, 2, v35);

      goto LABEL_15;
    case 3:
      v128 = NSNumber;
      v211 = objc_msgSend_objectAtIndex_(v6, v22, 1, v23, v24);
      uint64_t v133 = objc_msgSend_unsignedLongValue(v211, v129, v130, v131, v132);
      v209 = objc_msgSend_objectAtIndex_(v6, v134, 2, v135, v136);
      uint64_t v141 = objc_msgSend_unsignedLongValue(v209, v137, v138, v139, v140);
      v208 = objc_msgSend_numberWithUnsignedLong_(v128, v142, v141 * v133, v143, v144);
      v215[0] = v208;
      v207 = objc_msgSend_objectAtIndex_(v6, v145, 2, v146, v147);
      v215[1] = v207;
      v215[2] = &unk_26FEEA230;
      uint64_t v33 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v148, (uint64_t)v215, 3, v149);
      goto LABEL_13;
    case 4:
      v150 = NSNumber;
      v211 = objc_msgSend_objectAtIndex_(v6, v22, 1, v23, v24);
      uint64_t v155 = objc_msgSend_unsignedLongValue(v211, v151, v152, v153, v154);
      v209 = objc_msgSend_objectAtIndex_(v6, v156, 2, v157, v158);
      uint64_t v163 = objc_msgSend_unsignedLongValue(v209, v159, v160, v161, v162);
      v208 = objc_msgSend_objectAtIndex_(v6, v164, 3, v165, v166);
      uint64_t v171 = objc_msgSend_unsignedLongValue(v208, v167, v168, v169, v170);
      v207 = objc_msgSend_numberWithUnsignedLong_(v150, v172, v163 * v155 * v171, v173, v174);
      v214[0] = v207;
      v175 = NSNumber;
      v206 = objc_msgSend_objectAtIndex_(v6, v176, 2, v177, v178);
      uint64_t v183 = objc_msgSend_unsignedLongValue(v206, v179, v180, v181, v182);
      v205 = objc_msgSend_objectAtIndex_(v6, v184, 3, v185, v186);
      uint64_t v191 = objc_msgSend_unsignedLongValue(v205, v187, v188, v189, v190);
      v204 = objc_msgSend_numberWithUnsignedLong_(v175, v192, v191 * v183, v193, v194);
      v214[1] = v204;
      uint64_t v90 = objc_msgSend_objectAtIndex_(v6, v195, 3, v196, v197);
      v214[2] = v90;
      v214[3] = &unk_26FEEA230;
      uint64_t v33 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v198, (uint64_t)v214, 4, v199);
      goto LABEL_12;
    default:
      int32x4_t v37 = NSNumber;
      v211 = objc_msgSend_objectAtIndex_(v6, v22, 1, v23, v24);
      uint64_t v42 = objc_msgSend_unsignedLongValue(v211, v38, v39, v40, v41);
      v209 = objc_msgSend_objectAtIndex_(v6, v43, 2, v44, v45);
      uint64_t v50 = objc_msgSend_unsignedLongValue(v209, v46, v47, v48, v49);
      v208 = objc_msgSend_objectAtIndex_(v6, v51, 3, v52, v53);
      uint64_t v58 = objc_msgSend_unsignedLongValue(v208, v54, v55, v56, v57);
      v207 = objc_msgSend_objectAtIndex_(v6, v59, 4, v60, v61);
      uint64_t v66 = objc_msgSend_unsignedLongValue(v207, v62, v63, v64, v65);
      v206 = objc_msgSend_numberWithUnsignedLong_(v37, v67, v50 * v42 * v58 * v66, v68, v69);
      v213[0] = v206;
      uint64_t v70 = NSNumber;
      v205 = objc_msgSend_objectAtIndex_(v6, v71, 2, v72, v73);
      uint64_t v78 = objc_msgSend_unsignedLongValue(v205, v74, v75, v76, v77);
      v204 = objc_msgSend_objectAtIndex_(v6, v79, 3, v80, v81);
      uint64_t v86 = objc_msgSend_unsignedLongValue(v204, v82, v83, v84, v85);
      uint64_t v90 = objc_msgSend_objectAtIndex_(v6, v87, 4, v88, v89);
      uint64_t v95 = objc_msgSend_unsignedLongValue(v90, v91, v92, v93, v94);
      v203 = objc_msgSend_numberWithUnsignedLong_(v70, v96, v86 * v78 * v95, v97, v98);
      v213[1] = v203;
      uint64_t v99 = NSNumber;
      v103 = objc_msgSend_objectAtIndex_(v6, v100, 3, v101, v102);
      uint64_t v108 = objc_msgSend_unsignedLongValue(v103, v104, v105, v106, v107);
      v112 = objc_msgSend_objectAtIndex_(v6, v109, 4, v110, v111);
      uint64_t v117 = objc_msgSend_unsignedLongValue(v112, v113, v114, v115, v116);
      v121 = objc_msgSend_numberWithUnsignedLong_(v99, v118, v117 * v108, v119, v120);
      v213[2] = v121;
      v125 = objc_msgSend_objectAtIndex_(v6, v122, 4, v123, v124);
      v213[3] = v125;
      v213[4] = &unk_26FEEA230;
      uint64_t v33 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v126, (uint64_t)v213, 5, v127);

LABEL_12:
LABEL_13:

LABEL_15:
      id v200 = objc_alloc(MEMORY[0x263F00DA8]);
      uint64_t v212 = 0;
      uint64_t v36 = objc_msgSend_initWithDataPointer_shape_dataType_strides_deallocator_error_(v200, v201, v17, (uint64_t)v6, 65568, v33, 0, &v212);

      break;
  }
LABEL_16:

  return v36;
}

+ (id)reshapeMLMultiArray:(id)a3 toShape:(id)a4
{
  v233[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = objc_msgSend_count(v6, v8, v9, v10, v11);
  uint64_t v21 = (char *)objc_msgSend_count(v7, v13, v14, v15, v16);
  if (v21)
  {
    uint64_t v22 = objc_msgSend_shape(v6, v17, v18, v19, v20);
    char v25 = objc_msgSend_compareMLMultiArrayShapesForShape1_Shape2_(a1, v23, (uint64_t)v22, (uint64_t)v7, v24);

    if (v25)
    {
      uint64_t v21 = (char *)v6;
    }
    else
    {
      uint64_t v29 = 0;
      uint64_t v30 = 1;
      do
      {
        uint64_t v31 = objc_msgSend_objectAtIndexedSubscript_(v7, v26, v29, v27, v28);
        v30 *= objc_msgSend_unsignedIntValue(v31, v32, v33, v34, v35);

        ++v29;
      }
      while (v21 != (char *)v29);
      if (v30 == v12)
      {
        uint64_t v36 = v21 - 1;
        int32x4_t v37 = &unk_26FEEA440;
        switch((unint64_t)v36)
        {
          case 0uLL:
            goto LABEL_16;
          case 1uLL:
            v215 = objc_msgSend_objectAtIndex_(v7, v26, 1, v27, v28);
            v233[0] = v215;
            v233[1] = &unk_26FEEA230;
            int32x4_t v37 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v38, (uint64_t)v233, 2, v39);

            goto LABEL_16;
          case 2uLL:
            uint64_t v133 = NSNumber;
            v216 = objc_msgSend_objectAtIndex_(v7, v26, 1, v27, v28);
            uint64_t v138 = objc_msgSend_unsignedLongValue(v216, v134, v135, v136, v137);
            v214 = objc_msgSend_objectAtIndex_(v7, v139, 2, v140, v141);
            uint64_t v146 = objc_msgSend_unsignedLongValue(v214, v142, v143, v144, v145);
            v213 = objc_msgSend_numberWithUnsignedLong_(v133, v147, v146 * v138, v148, v149);
            v232[0] = v213;
            uint64_t v212 = objc_msgSend_objectAtIndex_(v7, v150, 2, v151, v152);
            v232[1] = v212;
            v232[2] = &unk_26FEEA230;
            int32x4_t v37 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v153, (uint64_t)v232, 3, v154);
            goto LABEL_14;
          case 3uLL:
            uint64_t v155 = NSNumber;
            v216 = objc_msgSend_objectAtIndex_(v7, v26, 1, v27, v28);
            uint64_t v160 = objc_msgSend_unsignedLongValue(v216, v156, v157, v158, v159);
            v214 = objc_msgSend_objectAtIndex_(v7, v161, 2, v162, v163);
            uint64_t v168 = objc_msgSend_unsignedLongValue(v214, v164, v165, v166, v167);
            v213 = objc_msgSend_objectAtIndex_(v7, v169, 3, v170, v171);
            uint64_t v176 = objc_msgSend_unsignedLongValue(v213, v172, v173, v174, v175);
            uint64_t v212 = objc_msgSend_numberWithUnsignedLong_(v155, v177, v168 * v160 * v176, v178, v179);
            v231[0] = v212;
            uint64_t v180 = NSNumber;
            v211 = objc_msgSend_objectAtIndex_(v7, v181, 2, v182, v183);
            uint64_t v188 = objc_msgSend_unsignedLongValue(v211, v184, v185, v186, v187);
            v210 = objc_msgSend_objectAtIndex_(v7, v189, 3, v190, v191);
            uint64_t v196 = objc_msgSend_unsignedLongValue(v210, v192, v193, v194, v195);
            uint64_t v85 = objc_msgSend_numberWithUnsignedLong_(v180, v197, v196 * v188, v198, v199);
            v231[1] = v85;
            uint64_t v94 = objc_msgSend_objectAtIndex_(v7, v200, 3, v201, v202);
            v231[2] = v94;
            v231[3] = &unk_26FEEA230;
            int32x4_t v37 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v203, (uint64_t)v231, 4, v204);
            goto LABEL_13;
          default:
            uint64_t v40 = NSNumber;
            v216 = objc_msgSend_objectAtIndex_(v7, v26, 1, v27, v28);
            uint64_t v45 = objc_msgSend_unsignedLongValue(v216, v41, v42, v43, v44);
            v214 = objc_msgSend_objectAtIndex_(v7, v46, 2, v47, v48);
            uint64_t v53 = objc_msgSend_unsignedLongValue(v214, v49, v50, v51, v52);
            v213 = objc_msgSend_objectAtIndex_(v7, v54, 3, v55, v56);
            uint64_t v61 = objc_msgSend_unsignedLongValue(v213, v57, v58, v59, v60);
            uint64_t v212 = objc_msgSend_objectAtIndex_(v7, v62, 4, v63, v64);
            uint64_t v69 = objc_msgSend_unsignedLongValue(v212, v65, v66, v67, v68);
            v211 = objc_msgSend_numberWithUnsignedLong_(v40, v70, v53 * v45 * v61 * v69, v71, v72);
            v230[0] = v211;
            uint64_t v73 = NSNumber;
            v210 = objc_msgSend_objectAtIndex_(v7, v74, 2, v75, v76);
            uint64_t v81 = objc_msgSend_unsignedLongValue(v210, v77, v78, v79, v80);
            uint64_t v85 = objc_msgSend_objectAtIndex_(v7, v82, 3, v83, v84);
            uint64_t v90 = objc_msgSend_unsignedLongValue(v85, v86, v87, v88, v89);
            uint64_t v94 = objc_msgSend_objectAtIndex_(v7, v91, 4, v92, v93);
            uint64_t v99 = objc_msgSend_unsignedLongValue(v94, v95, v96, v97, v98);
            v103 = objc_msgSend_numberWithUnsignedLong_(v73, v100, v90 * v81 * v99, v101, v102);
            v230[1] = v103;
            uint64_t v104 = NSNumber;
            uint64_t v108 = objc_msgSend_objectAtIndex_(v7, v105, 3, v106, v107);
            uint64_t v113 = objc_msgSend_unsignedLongValue(v108, v109, v110, v111, v112);
            uint64_t v117 = objc_msgSend_objectAtIndex_(v7, v114, 4, v115, v116);
            uint64_t v122 = objc_msgSend_unsignedLongValue(v117, v118, v119, v120, v121);
            v126 = objc_msgSend_numberWithUnsignedLong_(v104, v123, v122 * v113, v124, v125);
            v230[2] = v126;
            uint64_t v130 = objc_msgSend_objectAtIndex_(v7, v127, 4, v128, v129);
            v230[3] = v130;
            v230[4] = &unk_26FEEA230;
            int32x4_t v37 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v131, (uint64_t)v230, 5, v132);

LABEL_13:
LABEL_14:

LABEL_16:
            v228[0] = 0;
            v228[1] = v228;
            v228[2] = 0x3032000000;
            v228[3] = sub_24C698798;
            v228[4] = sub_24C6987A8;
            id v229 = 0;
            uint64_t v222 = 0;
            v223 = &v222;
            uint64_t v224 = 0x3032000000;
            v225 = sub_24C698798;
            v226 = sub_24C6987A8;
            id v227 = 0;
            v217[0] = MEMORY[0x263EF8330];
            v217[1] = 3221225472;
            v217[2] = sub_24C6987B0;
            v217[3] = &unk_2652E8008;
            v220 = &v222;
            id v218 = v7;
            id v219 = v37;
            v221 = v228;
            id v205 = v37;
            objc_msgSend_getBytesWithHandler_(v6, v206, (uint64_t)v217, v207, v208);
            uint64_t v21 = (char *)(id)v223[5];

            _Block_object_dispose(&v222, 8);
            _Block_object_dispose(v228, 8);

            break;
        }
      }
      else
      {
        uint64_t v21 = 0;
      }
    }
  }

  return v21;
}

+ (BOOL)compareMLMultiArrayShapesForShape1:(id)a3 Shape2:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v11 = objc_msgSend_count(v5, v7, v8, v9, v10);
  if (v11 == objc_msgSend_count(v6, v12, v13, v14, v15))
  {
    uint64_t v20 = objc_msgSend_count(v5, v16, v17, v18, v19);
    if (v20)
    {
      uint64_t v24 = 0;
      uint64_t v25 = v20 - 1;
      do
      {
        uint64_t v26 = objc_msgSend_objectAtIndexedSubscript_(v5, v21, v24, v22, v23);
        uint64_t v30 = objc_msgSend_objectAtIndexedSubscript_(v6, v27, v24, v28, v29);
        char isEqualToNumber = objc_msgSend_isEqualToNumber_(v26, v31, (uint64_t)v30, v32, v33);

        if (v25 == v24++) {
          char v36 = 0;
        }
        else {
          char v36 = isEqualToNumber;
        }
      }
      while ((v36 & 1) != 0);
    }
    else
    {
      char isEqualToNumber = 1;
    }
  }
  else
  {
    char isEqualToNumber = 0;
  }

  return isEqualToNumber;
}

@end