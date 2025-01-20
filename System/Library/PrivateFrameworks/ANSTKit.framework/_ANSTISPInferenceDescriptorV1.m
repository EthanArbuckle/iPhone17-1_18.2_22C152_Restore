@interface _ANSTISPInferenceDescriptorV1
+ (BOOL)_getInputDescriptors:(id *)a3 outputDescriptors:(id *)a4 forConfiguration:(id)a5 withError:(id *)a6;
+ (id)_assetURLForConfiguration:(id)a3 withError:(id *)a4;
+ (id)_nameForConfiguration:(id)a3 withError:(id *)a4;
- (id)inputImageDescriptor;
- (id)inputLastMaskDescriptor;
- (id)inputLastSalientMaskDescriptor;
- (id)newPostprocessorWithError:(id *)a3;
- (id)outputBoxRegressionDescriptor;
- (id)outputCenternessDescriptor;
- (id)outputFaceAttributesDescriptor;
- (id)outputFaceLandmarkDescriptor;
- (id)outputFacePoseDescriptor;
- (id)outputHairMapDescriptor;
- (id)outputHandAssociationDescriptor;
- (id)outputHandBoxRegressionDescriptor;
- (id)outputHandCenternessDescriptor;
- (id)outputHandLogitsDescriptor;
- (id)outputHandPoseDescriptor;
- (id)outputLogitsDescriptor;
- (id)outputPersonMapDescriptor;
- (id)outputPriorMaskMapDescriptor;
- (id)outputSaliencyDescriptor;
- (id)outputSalientFaceBoxRegressionDescriptor;
- (id)outputSalientFaceCenternessDescriptor;
- (id)outputSalientFaceLogitsDescriptor;
- (id)outputSalientPersonMapDescriptor;
- (id)outputSalientPersonPriorMaskDescriptor;
- (id)outputSemanticMapDescriptor;
- (id)outputSkinMapDescriptor;
- (id)outputSkinToneDescriptor;
- (id)outputSkyMapDescriptor;
- (id)outputSmudgeConfidenceDescriptor;
- (id)outputSubjectIDMapDescriptor;
@end

@implementation _ANSTISPInferenceDescriptorV1

+ (id)_nameForConfiguration:(id)a3 withError:(id *)a4
{
  return @"anst";
}

+ (id)_assetURLForConfiguration:(id)a3 withError:(id *)a4
{
  v39[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v8 = objc_msgSend_bundleForClass_(MEMORY[0x263F086E0], v7, (uint64_t)a1);
  v10 = objc_msgSend_URLForResource_withExtension_subdirectory_(v8, v9, @"anst", @"mlmodelc", @"Models");

  if (v10)
  {
    if (objc_msgSend_useE5(v6, v11, v12)) {
      objc_msgSend_URLByAppendingPathComponent_(v10, v13, @"v2_4.espresso.net");
    }
    else {
      objc_msgSend_URLByAppendingPathComponent_(v10, v13, @"model.espresso.net");
    }
    v14 = (id *)objc_claimAutoreleasedReturnValue();
    v16 = v14;
    if (v14)
    {
      v16 = v14;
      a4 = v16;
    }
    else
    {
      if (a4)
      {
        v26 = (void *)MEMORY[0x263F087E8];
        uint64_t v27 = *MEMORY[0x263F07F70];
        uint64_t v28 = *MEMORY[0x263F08590];
        v36[0] = *MEMORY[0x263F07F80];
        v36[1] = v28;
        v37[0] = @"Unable to retrieve the asset URL.";
        v37[1] = v10;
        v36[2] = *MEMORY[0x263F08068];
        v29 = objc_msgSend_stringByAppendingPathExtension_(@"anst", v15, @"mlmodelc");
        v31 = objc_msgSend_stringByAppendingPathComponent_(@"Models", v30, (uint64_t)v29);
        v37[2] = v31;
        v33 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v32, (uint64_t)v37, v36, 3);
        objc_msgSend_errorWithDomain_code_userInfo_(v26, v34, v27, 4, v33);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      a4 = 0;
    }
  }
  else
  {
    if (!a4) {
      goto LABEL_13;
    }
    v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F07F70];
    uint64_t v19 = *MEMORY[0x263F07F80];
    v39[0] = @"Unable to retrieve the base URL for the asset.";
    uint64_t v20 = *MEMORY[0x263F08068];
    v38[0] = v19;
    v38[1] = v20;
    objc_msgSend_stringByAppendingPathExtension_(@"anst", v11, @"mlmodelc");
    v16 = (id *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend_stringByAppendingPathComponent_(@"Models", v21, (uint64_t)v16);
    v39[1] = v22;
    v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v23, (uint64_t)v39, v38, 2);
    objc_msgSend_errorWithDomain_code_userInfo_(v17, v25, v18, 4, v24);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

LABEL_13:
  return a4;
}

+ (BOOL)_getInputDescriptors:(id *)a3 outputDescriptors:(id *)a4 forConfiguration:(id)a5 withError:(id *)a6
{
  uint64_t v325 = *MEMORY[0x263EF8340];
  id v9 = a5;
  uint64_t v12 = v9;
  if (!((unint64_t)a3 | (unint64_t)a4))
  {
    LOBYTE(a6) = 1;
    goto LABEL_12;
  }
  objc_msgSend_useE5(v9, v10, v11);
  v289 = 0;
  bzero(v288, 0x960uLL);
  bzero(v324, 0x316B0uLL);
  char v287 = 0;
  uint64_t v14 = AcANSTCreate((uint64_t)&v289, (uint64_t)&v287);
  if (!v14)
  {
    uint64_t v14 = AcANSTGetParams(v289, v324, (uint64_t)v288);
    if (!v14)
    {
      id v21 = objc_alloc(MEMORY[0x263EFF980]);
      v16 = objc_msgSend_initWithCapacity_(v21, v22, 25);
      for (uint64_t i = 0; i != 1600; i += 64)
      {
        v25 = objc_msgSend_stringWithUTF8String_(NSString, v23, (uint64_t)&v288[i + 776]);
        objc_msgSend_addObject_(v16, v26, (uint64_t)v25);
      }
      if (v289) {
        AcANSTDestroy((uint64_t)v289);
      }
      if (a3)
      {
        uint64_t v27 = [ANSTPixelBufferDescriptor alloc];
        uint64_t v320 = *MEMORY[0x263F04130];
        uint64_t v321 = MEMORY[0x263EFFA78];
        v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v28, (uint64_t)&v321, &v320, 1);
        uint64_t v18 = objc_msgSend_initWithName_width_height_pixelFormatType_pixelBufferAttributes_error_(v27, v30, @"input_image", 512, 384, 1111970369, v29, a6);

        if (!v18) {
          goto LABEL_10;
        }
        v31 = [ANSTTensorDescriptor alloc];
        if (objc_msgSend_useE5(v12, v32, v33)) {
          uint64_t v36 = 104;
        }
        else {
          uint64_t v36 = 102;
        }
        v319[0] = xmmword_246D9F010;
        v319[1] = unk_246D9F020;
        if (objc_msgSend_useE5(v12, v34, v35)) {
          uint64_t v38 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v31, v37, @"last_mask", v36, 4, v319, 64, a6);
        }
        else {
          uint64_t v38 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v31, v37, @"last_mask", v36, 4, v319, 1, a6);
        }
        if (!v38)
        {
LABEL_9:

LABEL_10:
          LOBYTE(a6) = 0;
LABEL_11:

          goto LABEL_12;
        }
        v39 = (void *)v38;
        v40 = [ANSTTensorDescriptor alloc];
        if (objc_msgSend_useE5(v12, v41, v42)) {
          uint64_t v45 = 104;
        }
        else {
          uint64_t v45 = 102;
        }
        v318[0] = xmmword_246D9F010;
        v318[1] = unk_246D9F020;
        if (objc_msgSend_useE5(v12, v43, v44)) {
          uint64_t v47 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v40, v46, @"last_salient_mask", v45, 4, v318, 64, a6);
        }
        else {
          uint64_t v47 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v40, v46, @"last_salient_mask", v45, 4, v318, 1, a6);
        }
        if (!v47)
        {

          goto LABEL_9;
        }
        v49 = (void *)v47;
        v317[0] = v18;
        v317[1] = v39;
        v317[2] = v47;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v48, (uint64_t)v317, 3);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (a4)
      {
        v50 = [ANSTTensorDescriptor alloc];
        if (objc_msgSend_useE5(v12, v51, v52)) {
          uint64_t v55 = 104;
        }
        else {
          uint64_t v55 = 102;
        }
        v316[0] = xmmword_246D9EE90;
        v316[1] = unk_246D9EEA0;
        if (objc_msgSend_useE5(v12, v53, v54)) {
          uint64_t v57 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v50, v56, @"logits@output", v55, 4, v316, 64, a6);
        }
        else {
          uint64_t v57 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v50, v56, @"logits@output", v55, 4, v316, 1, a6);
        }
        if (!v57) {
          goto LABEL_10;
        }
        v58 = (void *)v57;
        v59 = [ANSTTensorDescriptor alloc];
        if (objc_msgSend_useE5(v12, v60, v61)) {
          uint64_t v64 = 104;
        }
        else {
          uint64_t v64 = 102;
        }
        v315[0] = xmmword_246D9EFF0;
        v315[1] = unk_246D9F000;
        if (objc_msgSend_useE5(v12, v62, v63)) {
          uint64_t v66 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v59, v65, @"centerness@output", v64, 4, v315, 64, a6);
        }
        else {
          uint64_t v66 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v59, v65, @"centerness@output", v64, 4, v315, 1, a6);
        }
        if (!v66)
        {

          goto LABEL_10;
        }
        v67 = (void *)v66;
        v68 = [ANSTTensorDescriptor alloc];
        if (objc_msgSend_useE5(v12, v69, v70)) {
          uint64_t v73 = 104;
        }
        else {
          uint64_t v73 = 102;
        }
        v314[0] = xmmword_246D9EF70;
        v314[1] = unk_246D9EF80;
        if (objc_msgSend_useE5(v12, v71, v72)) {
          uint64_t v75 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v68, v74, @"bbox_reg@output", v73, 4, v314, 64, a6);
        }
        else {
          uint64_t v75 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v68, v74, @"bbox_reg@output", v73, 4, v314, 1, a6);
        }
        v76 = (void *)v75;
        if (v75)
        {
          v77 = [ANSTTensorDescriptor alloc];
          if (objc_msgSend_useE5(v12, v78, v79)) {
            uint64_t v82 = 104;
          }
          else {
            uint64_t v82 = 102;
          }
          v313[0] = xmmword_246D9EED0;
          v313[1] = unk_246D9EEE0;
          if (objc_msgSend_useE5(v12, v80, v81)) {
            uint64_t v84 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v77, v83, @"face_pose@output", v82, 4, v313, 64, a6);
          }
          else {
            uint64_t v84 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v77, v83, @"face_pose@output", v82, 4, v313, 1, a6);
          }
          v85 = (void *)v84;
          if (v84)
          {
            v281 = v76;
            v86 = [ANSTTensorDescriptor alloc];
            if (objc_msgSend_useE5(v12, v87, v88)) {
              uint64_t v91 = 104;
            }
            else {
              uint64_t v91 = 102;
            }
            v312[0] = xmmword_246D9EEB0;
            v312[1] = unk_246D9EEC0;
            if (objc_msgSend_useE5(v12, v89, v90)) {
              v93 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v86, v92, @"face_attributes@output", v91, 4, v312, 64, a6);
            }
            else {
              v93 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v86, v92, @"face_attributes@output", v91, 4, v312, 1, a6);
            }
            if (v93)
            {
              id v280 = v93;
              v94 = [ANSTTensorDescriptor alloc];
              if (objc_msgSend_useE5(v12, v95, v96)) {
                uint64_t v99 = 104;
              }
              else {
                uint64_t v99 = 102;
              }
              v311[0] = xmmword_246D9EED0;
              v311[1] = unk_246D9EEE0;
              if (objc_msgSend_useE5(v12, v97, v98)) {
                v101 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v94, v100, @"face_skintone@output", v99, 4, v311, 64, a6);
              }
              else {
                v101 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v94, v100, @"face_skintone@output", v99, 4, v311, 1, a6);
              }
              if (v101)
              {
                v283 = v101;
                v102 = [ANSTTensorDescriptor alloc];
                if (objc_msgSend_useE5(v12, v103, v104)) {
                  uint64_t v107 = 104;
                }
                else {
                  uint64_t v107 = 102;
                }
                v310[0] = xmmword_246D9EEF0;
                v310[1] = unk_246D9EF00;
                if (objc_msgSend_useE5(v12, v105, v106)) {
                  v109 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v102, v108, @"id_map@output", v107, 4, v310, 64, a6);
                }
                else {
                  v109 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v102, v108, @"id_map@output", v107, 4, v310, 1, a6);
                }
                if (v109)
                {
                  v282 = v109;
                  v110 = [ANSTTensorDescriptor alloc];
                  if (objc_msgSend_useE5(v12, v111, v112)) {
                    uint64_t v115 = 104;
                  }
                  else {
                    uint64_t v115 = 102;
                  }
                  v309[0] = xmmword_246D9EFF0;
                  v309[1] = unk_246D9F000;
                  if (objc_msgSend_useE5(v12, v113, v114)) {
                    v117 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v110, v116, @"hand_logits@output", v115, 4, v309, 64, a6);
                  }
                  else {
                    v117 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v110, v116, @"hand_logits@output", v115, 4, v309, 1, a6);
                  }
                  if (v117)
                  {
                    id v279 = v117;
                    v118 = [ANSTTensorDescriptor alloc];
                    if (objc_msgSend_useE5(v12, v119, v120)) {
                      uint64_t v123 = 104;
                    }
                    else {
                      uint64_t v123 = 102;
                    }
                    v308[0] = xmmword_246D9EFF0;
                    v308[1] = unk_246D9F000;
                    if (objc_msgSend_useE5(v12, v121, v122)) {
                      v125 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v118, v124, @"hand_ctrness@output", v123, 4, v308, 64, a6);
                    }
                    else {
                      v125 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v118, v124, @"hand_ctrness@output", v123, 4, v308, 1, a6);
                    }
                    if (v125)
                    {
                      id v278 = v125;
                      v126 = [ANSTTensorDescriptor alloc];
                      if (objc_msgSend_useE5(v12, v127, v128)) {
                        uint64_t v131 = 104;
                      }
                      else {
                        uint64_t v131 = 102;
                      }
                      v307[0] = xmmword_246D9EF70;
                      v307[1] = unk_246D9EF80;
                      if (objc_msgSend_useE5(v12, v129, v130)) {
                        v133 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v126, v132, @"hand_bbox_reg@output", v131, 4, v307, 64, a6);
                      }
                      else {
                        v133 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v126, v132, @"hand_bbox_reg@output", v131, 4, v307, 1, a6);
                      }
                      if (v133)
                      {
                        id v277 = v133;
                        v134 = [ANSTTensorDescriptor alloc];
                        if (objc_msgSend_useE5(v12, v135, v136)) {
                          uint64_t v139 = 104;
                        }
                        else {
                          uint64_t v139 = 102;
                        }
                        v306[0] = xmmword_246D9EFF0;
                        v306[1] = unk_246D9F000;
                        if (objc_msgSend_useE5(v12, v137, v138)) {
                          v141 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v134, v140, @"hand_pose@output", v139, 4, v306, 64, a6);
                        }
                        else {
                          v141 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v134, v140, @"hand_pose@output", v139, 4, v306, 1, a6);
                        }
                        if (v141)
                        {
                          id v276 = v141;
                          v142 = [ANSTTensorDescriptor alloc];
                          if (objc_msgSend_useE5(v12, v143, v144)) {
                            uint64_t v147 = 104;
                          }
                          else {
                            uint64_t v147 = 102;
                          }
                          v305[0] = xmmword_246D9EF10;
                          v305[1] = unk_246D9EF20;
                          if (objc_msgSend_useE5(v12, v145, v146)) {
                            uint64_t v149 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v142, v148, @"sf_cls_logits@output", v147, 4, v305, 64, a6);
                          }
                          else {
                            uint64_t v149 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v142, v148, @"sf_cls_logits@output", v147, 4, v305, 1, a6);
                          }
                          v275 = (void *)v149;
                          if (v149)
                          {
                            v150 = [ANSTTensorDescriptor alloc];
                            if (objc_msgSend_useE5(v12, v151, v152)) {
                              uint64_t v155 = 104;
                            }
                            else {
                              uint64_t v155 = 102;
                            }
                            v304[0] = xmmword_246D9EF10;
                            v304[1] = unk_246D9EF20;
                            if (objc_msgSend_useE5(v12, v153, v154)) {
                              uint64_t v157 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v150, v156, @"sf_ctrness@output", v155, 4, v304, 64, a6);
                            }
                            else {
                              uint64_t v157 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v150, v156, @"sf_ctrness@output", v155, 4, v304, 1, a6);
                            }
                            v274 = (void *)v157;
                            if (v157)
                            {
                              v158 = [ANSTTensorDescriptor alloc];
                              if (objc_msgSend_useE5(v12, v159, v160)) {
                                uint64_t v163 = 104;
                              }
                              else {
                                uint64_t v163 = 102;
                              }
                              v303[0] = xmmword_246D9EF30;
                              v303[1] = unk_246D9EF40;
                              if (objc_msgSend_useE5(v12, v161, v162)) {
                                uint64_t v165 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v158, v164, @"sf_bbox_reg@output", v163, 4, v303, 64, a6);
                              }
                              else {
                                uint64_t v165 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v158, v164, @"sf_bbox_reg@output", v163, 4, v303, 1, a6);
                              }
                              v166 = (void *)v165;
                              if (v165)
                              {
                                v167 = [ANSTTensorDescriptor alloc];
                                if (objc_msgSend_useE5(v12, v168, v169)) {
                                  uint64_t v172 = 104;
                                }
                                else {
                                  uint64_t v172 = 102;
                                }
                                v302[0] = xmmword_246D9EF50;
                                v302[1] = unk_246D9EF60;
                                if (objc_msgSend_useE5(v12, v170, v171)) {
                                  uint64_t v174 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v167, v173, @"face_landmark@output", v172, 4, v302, 64, a6);
                                }
                                else {
                                  uint64_t v174 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v167, v173, @"face_landmark@output", v172, 4, v302, 1, a6);
                                }
                                v273 = (void *)v174;
                                if (v174)
                                {
                                  v175 = [ANSTTensorDescriptor alloc];
                                  if (objc_msgSend_useE5(v12, v176, v177)) {
                                    uint64_t v180 = 104;
                                  }
                                  else {
                                    uint64_t v180 = 102;
                                  }
                                  v301[0] = xmmword_246D9EF70;
                                  v301[1] = unk_246D9EF80;
                                  if (objc_msgSend_useE5(v12, v178, v179)) {
                                    uint64_t v182 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v175, v181, @"hand_associations@output", v180, 4, v301, 64, a6);
                                  }
                                  else {
                                    uint64_t v182 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v175, v181, @"hand_associations@output", v180, 4, v301, 1, a6);
                                  }
                                  v285 = (void *)v182;
                                  if (v182)
                                  {
                                    v183 = [ANSTTensorDescriptor alloc];
                                    if (objc_msgSend_useE5(v12, v184, v185)) {
                                      uint64_t v188 = 104;
                                    }
                                    else {
                                      uint64_t v188 = 102;
                                    }
                                    v300[0] = xmmword_246D9EF90;
                                    v300[1] = unk_246D9EFA0;
                                    if (objc_msgSend_useE5(v12, v186, v187)) {
                                      uint64_t v190 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v183, v189, @"smudge_predict@output", v188, 4, v300, 64, a6);
                                    }
                                    else {
                                      uint64_t v190 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v183, v189, @"smudge_predict@output", v188, 4, v300, 1, a6);
                                    }
                                    v284 = (void *)v190;
                                    if (v190)
                                    {
                                      v191 = [ANSTTensorDescriptor alloc];
                                      if (objc_msgSend_useE5(v12, v192, v193)) {
                                        uint64_t v196 = 104;
                                      }
                                      else {
                                        uint64_t v196 = 102;
                                      }
                                      v299[0] = xmmword_246D9F010;
                                      v299[1] = unk_246D9F020;
                                      if (objc_msgSend_useE5(v12, v194, v195)) {
                                        uint64_t v198 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v191, v197, @"prior_mask@output", v196, 4, v299, 64, a6);
                                      }
                                      else {
                                        uint64_t v198 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v191, v197, @"prior_mask@output", v196, 4, v299, 1, a6);
                                      }
                                      v272 = (void *)v198;
                                      if (v198)
                                      {
                                        v199 = [ANSTTensorDescriptor alloc];
                                        if (objc_msgSend_useE5(v12, v200, v201)) {
                                          uint64_t v204 = 104;
                                        }
                                        else {
                                          uint64_t v204 = 102;
                                        }
                                        v298[0] = xmmword_246D9EFB0;
                                        v298[1] = unk_246D9EFC0;
                                        if (objc_msgSend_useE5(v12, v202, v203)) {
                                          uint64_t v206 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v199, v205, @"person@output", v204, 4, v298, 64, a6);
                                        }
                                        else {
                                          uint64_t v206 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v199, v205, @"person@output", v204, 4, v298, 1, a6);
                                        }
                                        v269 = (void *)v206;
                                        if (v206)
                                        {
                                          v207 = [ANSTTensorDescriptor alloc];
                                          if (objc_msgSend_useE5(v12, v208, v209)) {
                                            uint64_t v212 = 104;
                                          }
                                          else {
                                            uint64_t v212 = 102;
                                          }
                                          v297[0] = xmmword_246D9EFB0;
                                          v297[1] = unk_246D9EFC0;
                                          if (objc_msgSend_useE5(v12, v210, v211)) {
                                            uint64_t v214 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v207, v213, @"salient_person@output", v212, 4, v297, 64, a6);
                                          }
                                          else {
                                            uint64_t v214 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v207, v213, @"salient_person@output", v212, 4, v297, 1, a6);
                                          }
                                          v268 = (void *)v214;
                                          if (v214)
                                          {
                                            v215 = [ANSTTensorDescriptor alloc];
                                            if (objc_msgSend_useE5(v12, v216, v217)) {
                                              uint64_t v220 = 104;
                                            }
                                            else {
                                              uint64_t v220 = 102;
                                            }
                                            v296[0] = xmmword_246D9EFB0;
                                            v296[1] = unk_246D9EFC0;
                                            if (objc_msgSend_useE5(v12, v218, v219)) {
                                              uint64_t v222 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v215, v221, @"skin@output", v220, 4, v296, 64, a6);
                                            }
                                            else {
                                              uint64_t v222 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v215, v221, @"skin@output", v220, 4, v296, 1, a6);
                                            }
                                            v267 = (void *)v222;
                                            if (v222)
                                            {
                                              v223 = [ANSTTensorDescriptor alloc];
                                              if (objc_msgSend_useE5(v12, v224, v225)) {
                                                uint64_t v228 = 104;
                                              }
                                              else {
                                                uint64_t v228 = 102;
                                              }
                                              v295[0] = xmmword_246D9EFB0;
                                              v295[1] = unk_246D9EFC0;
                                              if (objc_msgSend_useE5(v12, v226, v227)) {
                                                uint64_t v230 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v223, v229, @"hair@output", v228, 4, v295, 64, a6);
                                              }
                                              else {
                                                uint64_t v230 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v223, v229, @"hair@output", v228, 4, v295, 1, a6);
                                              }
                                              v266 = (void *)v230;
                                              if (v230)
                                              {
                                                v231 = [ANSTTensorDescriptor alloc];
                                                if (objc_msgSend_useE5(v12, v232, v233)) {
                                                  uint64_t v236 = 104;
                                                }
                                                else {
                                                  uint64_t v236 = 102;
                                                }
                                                v294[0] = xmmword_246D9EFB0;
                                                v294[1] = unk_246D9EFC0;
                                                if (objc_msgSend_useE5(v12, v234, v235)) {
                                                  uint64_t v238 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v231, v237, @"sky@output", v236, 4, v294, 64, a6);
                                                }
                                                else {
                                                  uint64_t v238 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v231, v237, @"sky@output", v236, 4, v294, 1, a6);
                                                }
                                                v271 = (void *)v238;
                                                if (v238)
                                                {
                                                  v239 = [ANSTTensorDescriptor alloc];
                                                  if (objc_msgSend_useE5(v12, v240, v241)) {
                                                    uint64_t v244 = 104;
                                                  }
                                                  else {
                                                    uint64_t v244 = 102;
                                                  }
                                                  v293[0] = xmmword_246D9EFD0;
                                                  v293[1] = unk_246D9EFE0;
                                                  if (objc_msgSend_useE5(v12, v242, v243)) {
                                                    uint64_t v246 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v239, v245, @"viseg@output", v244, 4, v293, 64, a6);
                                                  }
                                                  else {
                                                    uint64_t v246 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v239, v245, @"viseg@output", v244, 4, v293, 1, a6);
                                                  }
                                                  v270 = (void *)v246;
                                                  if (v246)
                                                  {
                                                    v247 = [ANSTTensorDescriptor alloc];
                                                    if (objc_msgSend_useE5(v12, v248, v249)) {
                                                      uint64_t v252 = 104;
                                                    }
                                                    else {
                                                      uint64_t v252 = 102;
                                                    }
                                                    v292[0] = xmmword_246D9EFF0;
                                                    v292[1] = unk_246D9F000;
                                                    if (objc_msgSend_useE5(v12, v250, v251)) {
                                                      uint64_t v254 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v247, v253, @"saliency@output", v252, 4, v292, 64, a6);
                                                    }
                                                    else {
                                                      uint64_t v254 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v247, v253, @"saliency@output", v252, 4, v292, 1, a6);
                                                    }
                                                    v286 = (void *)v254;
                                                    if (v254)
                                                    {
                                                      v255 = [ANSTTensorDescriptor alloc];
                                                      if (objc_msgSend_useE5(v12, v256, v257)) {
                                                        uint64_t v260 = 104;
                                                      }
                                                      else {
                                                        uint64_t v260 = 102;
                                                      }
                                                      v291[0] = xmmword_246D9F010;
                                                      v291[1] = unk_246D9F020;
                                                      if (objc_msgSend_useE5(v12, v258, v259)) {
                                                        uint64_t v262 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v255, v261, @"salient_person_prior_mask@output", v260, 4, v291, 64, a6);
                                                      }
                                                      else {
                                                        uint64_t v262 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v255, v261, @"salient_person_prior_mask@output", v260, 4, v291, 1, a6);
                                                      }
                                                      v264 = (void *)v262;
                                                      if (v262)
                                                      {
                                                        v290[0] = v58;
                                                        v290[1] = v67;
                                                        v290[2] = v281;
                                                        v290[3] = v85;
                                                        v290[4] = v280;
                                                        v290[5] = v283;
                                                        v290[6] = v282;
                                                        v290[7] = v279;
                                                        v290[8] = v278;
                                                        v290[9] = v277;
                                                        v290[10] = v276;
                                                        v290[11] = v275;
                                                        v290[12] = v274;
                                                        v290[13] = v166;
                                                        v290[14] = v273;
                                                        v290[15] = v285;
                                                        v290[16] = v284;
                                                        v290[17] = v272;
                                                        v290[18] = v269;
                                                        v290[19] = v268;
                                                        v290[20] = v267;
                                                        v290[21] = v266;
                                                        v290[22] = v271;
                                                        v290[23] = v270;
                                                        v290[24] = v286;
                                                        v290[25] = v262;
                                                        objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v263, (uint64_t)v290, 26);
                                                        int v265 = 0;
                                                        *a4 = (id)objc_claimAutoreleasedReturnValue();
                                                      }
                                                      else
                                                      {
                                                        int v265 = 1;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      int v265 = 1;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    int v265 = 1;
                                                  }
                                                }
                                                else
                                                {
                                                  int v265 = 1;
                                                }
                                              }
                                              else
                                              {
                                                int v265 = 1;
                                              }
                                            }
                                            else
                                            {
                                              int v265 = 1;
                                            }
                                          }
                                          else
                                          {
                                            int v265 = 1;
                                          }
                                        }
                                        else
                                        {
                                          int v265 = 1;
                                        }
                                      }
                                      else
                                      {
                                        int v265 = 1;
                                      }
                                    }
                                    else
                                    {
                                      int v265 = 1;
                                    }
                                  }
                                  else
                                  {
                                    int v265 = 1;
                                  }
                                }
                                else
                                {
                                  int v265 = 1;
                                }
                              }
                              else
                              {
                                int v265 = 1;
                              }
                            }
                            else
                            {
                              int v265 = 1;
                            }
                          }
                          else
                          {
                            int v265 = 1;
                          }
                          v76 = v281;

                          v141 = v276;
                        }
                        else
                        {
                          int v265 = 1;
                          v76 = v281;
                        }

                        v133 = v277;
                      }
                      else
                      {
                        int v265 = 1;
                        v76 = v281;
                      }

                      v125 = v278;
                    }
                    else
                    {
                      int v265 = 1;
                      v76 = v281;
                    }

                    v117 = v279;
                  }
                  else
                  {
                    int v265 = 1;
                    v76 = v281;
                  }

                  v109 = v282;
                }
                else
                {
                  int v265 = 1;
                  v76 = v281;
                }

                v101 = v283;
              }
              else
              {
                int v265 = 1;
                v76 = v281;
              }

              v93 = v280;
            }
            else
            {
              int v265 = 1;
              v76 = v281;
            }
          }
          else
          {
            int v265 = 1;
          }
        }
        else
        {
          int v265 = 1;
        }

        if (v265) {
          goto LABEL_10;
        }
      }
      LOBYTE(a6) = 1;
      goto LABEL_11;
    }
  }
  if (v289) {
    AcANSTDestroy((uint64_t)v289);
  }
  if (a6)
  {
    v15 = (void *)MEMORY[0x263F087E8];
    v322[0] = *MEMORY[0x263F07F80];
    v323[0] = @"Unable to get underlying network metadata.";
    v322[1] = @"AcReturn";
    v16 = objc_msgSend_numberWithInt_(NSNumber, v13, v14);
    v323[1] = v16;
    uint64_t v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v17, (uint64_t)v323, v322, 2);
    objc_msgSend_errorWithDomain_code_userInfo_(v15, v19, @"ANSTErrorDomain", 3, v18);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_12:

  return (char)a6;
}

- (id)newPostprocessorWithError:(id *)a3
{
  v4 = [_ANSTISPInferencePostprocessorV1 alloc];
  return (id)MEMORY[0x270F9A6D0](v4, sel_initWithInferenceDescriptor_error_, self);
}

- (id)inputImageDescriptor
{
  return (id)MEMORY[0x270F9A6D0](self, sel_inputPixelBufferDescriptorNamed_, @"input_image");
}

- (id)inputLastMaskDescriptor
{
  return (id)MEMORY[0x270F9A6D0](self, sel_inputTensorDescriptorNamed_, @"last_mask");
}

- (id)inputLastSalientMaskDescriptor
{
  return (id)MEMORY[0x270F9A6D0](self, sel_inputTensorDescriptorNamed_, @"last_salient_mask");
}

- (id)outputLogitsDescriptor
{
  v3 = objc_msgSend_outputDescriptors(self, a2, v2);
  v5 = objc_msgSend_objectAtIndex_(v3, v4, 0);

  return v5;
}

- (id)outputCenternessDescriptor
{
  v3 = objc_msgSend_outputDescriptors(self, a2, v2);
  v5 = objc_msgSend_objectAtIndex_(v3, v4, 1);

  return v5;
}

- (id)outputBoxRegressionDescriptor
{
  v3 = objc_msgSend_outputDescriptors(self, a2, v2);
  v5 = objc_msgSend_objectAtIndex_(v3, v4, 2);

  return v5;
}

- (id)outputFacePoseDescriptor
{
  v3 = objc_msgSend_outputDescriptors(self, a2, v2);
  v5 = objc_msgSend_objectAtIndex_(v3, v4, 3);

  return v5;
}

- (id)outputFaceAttributesDescriptor
{
  v3 = objc_msgSend_outputDescriptors(self, a2, v2);
  v5 = objc_msgSend_objectAtIndex_(v3, v4, 4);

  return v5;
}

- (id)outputSkinToneDescriptor
{
  v3 = objc_msgSend_outputDescriptors(self, a2, v2);
  v5 = objc_msgSend_objectAtIndex_(v3, v4, 5);

  return v5;
}

- (id)outputSubjectIDMapDescriptor
{
  v3 = objc_msgSend_outputDescriptors(self, a2, v2);
  v5 = objc_msgSend_objectAtIndex_(v3, v4, 6);

  return v5;
}

- (id)outputHandLogitsDescriptor
{
  v3 = objc_msgSend_outputDescriptors(self, a2, v2);
  v5 = objc_msgSend_objectAtIndex_(v3, v4, 7);

  return v5;
}

- (id)outputHandCenternessDescriptor
{
  v3 = objc_msgSend_outputDescriptors(self, a2, v2);
  v5 = objc_msgSend_objectAtIndex_(v3, v4, 8);

  return v5;
}

- (id)outputHandBoxRegressionDescriptor
{
  v3 = objc_msgSend_outputDescriptors(self, a2, v2);
  v5 = objc_msgSend_objectAtIndex_(v3, v4, 9);

  return v5;
}

- (id)outputHandPoseDescriptor
{
  v3 = objc_msgSend_outputDescriptors(self, a2, v2);
  v5 = objc_msgSend_objectAtIndex_(v3, v4, 10);

  return v5;
}

- (id)outputSalientFaceLogitsDescriptor
{
  v3 = objc_msgSend_outputDescriptors(self, a2, v2);
  v5 = objc_msgSend_objectAtIndex_(v3, v4, 11);

  return v5;
}

- (id)outputSalientFaceCenternessDescriptor
{
  v3 = objc_msgSend_outputDescriptors(self, a2, v2);
  v5 = objc_msgSend_objectAtIndex_(v3, v4, 12);

  return v5;
}

- (id)outputSalientFaceBoxRegressionDescriptor
{
  v3 = objc_msgSend_outputDescriptors(self, a2, v2);
  v5 = objc_msgSend_objectAtIndex_(v3, v4, 13);

  return v5;
}

- (id)outputFaceLandmarkDescriptor
{
  v3 = objc_msgSend_outputDescriptors(self, a2, v2);
  v5 = objc_msgSend_objectAtIndex_(v3, v4, 14);

  return v5;
}

- (id)outputHandAssociationDescriptor
{
  v3 = objc_msgSend_outputDescriptors(self, a2, v2);
  v5 = objc_msgSend_objectAtIndex_(v3, v4, 15);

  return v5;
}

- (id)outputSmudgeConfidenceDescriptor
{
  v3 = objc_msgSend_outputDescriptors(self, a2, v2);
  v5 = objc_msgSend_objectAtIndex_(v3, v4, 16);

  return v5;
}

- (id)outputPriorMaskMapDescriptor
{
  v3 = objc_msgSend_outputDescriptors(self, a2, v2);
  v5 = objc_msgSend_objectAtIndex_(v3, v4, 17);

  return v5;
}

- (id)outputPersonMapDescriptor
{
  v3 = objc_msgSend_outputDescriptors(self, a2, v2);
  v5 = objc_msgSend_objectAtIndex_(v3, v4, 18);

  return v5;
}

- (id)outputSalientPersonMapDescriptor
{
  v3 = objc_msgSend_outputDescriptors(self, a2, v2);
  v5 = objc_msgSend_objectAtIndex_(v3, v4, 19);

  return v5;
}

- (id)outputSkinMapDescriptor
{
  v3 = objc_msgSend_outputDescriptors(self, a2, v2);
  v5 = objc_msgSend_objectAtIndex_(v3, v4, 20);

  return v5;
}

- (id)outputHairMapDescriptor
{
  v3 = objc_msgSend_outputDescriptors(self, a2, v2);
  v5 = objc_msgSend_objectAtIndex_(v3, v4, 21);

  return v5;
}

- (id)outputSkyMapDescriptor
{
  v3 = objc_msgSend_outputDescriptors(self, a2, v2);
  v5 = objc_msgSend_objectAtIndex_(v3, v4, 22);

  return v5;
}

- (id)outputSemanticMapDescriptor
{
  v3 = objc_msgSend_outputDescriptors(self, a2, v2);
  v5 = objc_msgSend_objectAtIndex_(v3, v4, 23);

  return v5;
}

- (id)outputSaliencyDescriptor
{
  v3 = objc_msgSend_outputDescriptors(self, a2, v2);
  v5 = objc_msgSend_objectAtIndex_(v3, v4, 24);

  return v5;
}

- (id)outputSalientPersonPriorMaskDescriptor
{
  return (id)MEMORY[0x270F9A6D0](self, sel_outputTensorDescriptorNamed_, @"salient_person_prior_mask@output");
}

@end