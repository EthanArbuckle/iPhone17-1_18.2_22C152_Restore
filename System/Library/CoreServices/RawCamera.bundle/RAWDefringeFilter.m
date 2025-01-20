@interface RAWDefringeFilter
- (id)outputImage;
@end

@implementation RAWDefringeFilter

- (id)outputImage
{
  v232[3] = *MEMORY[0x1E4F143B8];
  if (self->inputImage)
  {
    v3 = sub_1DDA83E7C();
    v4 = v3;
    if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DDA14000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWDefringeFilter", (const char *)&unk_1DDC3ACB6, buf, 2u);
    }
    exception_object = self;

    v225[0] = MEMORY[0x1E4F143A8];
    v225[1] = 3221225472;
    v225[2] = sub_1DDB9EBF0;
    v225[3] = &unk_1E6D04A58;
    v225[4] = self;
    v203 = (void (**)(void))MEMORY[0x1E01C46E0](v225);
    v207 = objc_msgSend_kernelWithName_(DeFringeKernels, v5, @"deFringeNlimited", v6, v7);
    v204 = objc_msgSend_kernelWithName_(DeFringeKernels, v8, @"deFringeAxial", v9, v10);
    v214 = objc_msgSend_kernelWithName_(FringeDirectionsKernels, v11, @"boostAndGamma", v12, v13);
    v213 = objc_msgSend_kernelWithName_(FringeDirectionsKernels, v14, @"fringeDirections1_7", v15, v16);
    v212 = objc_msgSend_kernelWithName_(FringeDirectionsKernels, v17, @"fringeDirections2_7", v18, v19);
    v211 = objc_msgSend_kernelWithName_(FringeDirectionsKernels, v20, @"fringeDisplacementLimited", v21, v22);
    v210 = objc_msgSend_kernelWithName_(FringeDirectionsKernels, v23, @"filterDisplacements", v24, v25);
    v208 = objc_msgSend_kernelWithName_(FringeDirectionsKernels, v26, @"displace", v27, v28);
    v209 = objc_msgSend_kernelWithName_(FringeEdgesKernels, v29, @"fringeEdges", v30, v31);
    v216 = objc_msgSend_kernelWithName_(FringeEdgesKernels, v32, @"fringeEdgeThicken", v33, v34);
    objc_msgSend_floatValue(self->inputWidth, v35, v36, v37, v38);
    float v40 = v39;
    objc_msgSend_floatValue(self->inputAxialWidth, v41, v42, v43, v44);
    float v49 = v48;
    if (v48 > v40) {
      float v40 = v48;
    }
    double v50 = v40;
    if (v40 >= 4.5)
    {
      if (v50 >= 5.207)
      {
        if (v50 >= 5.707)
        {
          if (v50 >= 6.118)
          {
            if (v50 >= 6.532)
            {
              if (v50 >= 6.914)
              {
                if (v50 >= 7.082)
                {
                  if (v50 >= 7.384)
                  {
                    if (v50 >= 7.803)
                    {
                      if (v50 >= 8.062)
                      {
                        if (v50 >= 8.183)
                        {
                          if (v50 >= 8.357)
                          {
                            if (v50 >= 8.736) {
                              uint64_t v51 = 14;
                            }
                            else {
                              uint64_t v51 = 13;
                            }
                          }
                          else
                          {
                            uint64_t v51 = 12;
                          }
                        }
                        else
                        {
                          uint64_t v51 = 11;
                        }
                      }
                      else
                      {
                        uint64_t v51 = 10;
                      }
                    }
                    else
                    {
                      uint64_t v51 = 9;
                    }
                  }
                  else
                  {
                    uint64_t v51 = 8;
                  }
                }
                else
                {
                  uint64_t v51 = 7;
                }
              }
              else
              {
                uint64_t v51 = 6;
              }
            }
            else
            {
              uint64_t v51 = 5;
            }
          }
          else
          {
            uint64_t v51 = 4;
          }
        }
        else
        {
          uint64_t v51 = 3;
        }
      }
      else
      {
        uint64_t v51 = 2;
      }
    }
    else
    {
      uint64_t v51 = 1;
    }
    v52 = objc_msgSend_stringWithFormat_(NSString, v45, @"thickenDirections%02d", v46, v47, v51);
    v206 = objc_msgSend_kernelWithName_(FringeDirectionsKernels, v53, (uint64_t)v52, v54, v55);

    inputImage = self->inputImage;
    objc_msgSend_extent(inputImage, v57, v58, v59, v60);
    v62 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v61, (uint64_t)v214, (uint64_t)inputImage, (uint64_t)&unk_1F39865A0, 0, self->inputColorSpace);
    objc_msgSend_extent(v62, v63, v64, v65, v66);
    CGRect v235 = CGRectInset(v234, -3.0, -3.0);
    v68 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v67, (uint64_t)v213, (uint64_t)v62, (uint64_t)&unk_1F39865C0, 0, self->inputColorSpace, v235.origin.x, v235.origin.y, v235.size.width, v235.size.height);
    objc_msgSend_extent(v62, v69, v70, v71, v72);
    CGRect v237 = CGRectInset(v236, -3.0, -3.0);
    uint64_t v74 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(self, v73, (uint64_t)v212, (uint64_t)v62, (uint64_t)&unk_1F39865E0, 0, self->inputColorSpace, v237.origin.x, v237.origin.y, v237.size.width, v237.size.height);
    objc_msgSend_extent(v68, v75, v76, v77, v78);
    CGRect v239 = CGRectInset(v238, -4.0, -4.0);
    double x = v239.origin.x;
    double y = v239.origin.y;
    double width = v239.size.width;
    double height = v239.size.height;
    inputWidth = self->inputWidth;
    v232[0] = v74;
    v232[1] = inputWidth;
    v232[2] = &unk_1F39B4DD0;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v84, (uint64_t)v232, 3, v85);
    v217 = v62;
    v218 = (void *)v74;
    v86 = v202 = v68;
    v88 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(exception_object, v87, (uint64_t)v211, (uint64_t)v68, (uint64_t)&unk_1F3986600, x, y, width, height);

    objc_msgSend_extent(v88, v89, v90, v91, v92);
    CGRect v241 = CGRectInset(v240, -1.0, -1.0);
    v215 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(exception_object, v93, (uint64_t)v210, (uint64_t)v88, (uint64_t)&unk_1F3986620, 0, exception_object->inputColorSpace, v241.origin.x, v241.origin.y, v241.size.width, v241.size.height);

    v94 = exception_object->inputImage;
    v95 = v68;
    objc_msgSend_extent(v94, v96, v97, v98, v99);
    CGRect v243 = CGRectInset(v242, -1.0, -1.0);
    v101 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(exception_object, v100, (uint64_t)v209, (uint64_t)v94, (uint64_t)&unk_1F3986640, 0, exception_object->inputColorSpace, v243.origin.x, v243.origin.y, v243.size.width, v243.size.height);
    v102 = exception_object->inputImage;
    objc_msgSend_extent(v102, v103, v104, v105, v106);
    double v108 = v107;
    double v110 = v109;
    double v112 = v111;
    double v114 = v113;
    v231[0] = v101;
    v231[1] = v95;
    v231[2] = v215;
    v117 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v115, (uint64_t)v231, 3, v116);
    v118 = v101;
    v205 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(exception_object, v119, (uint64_t)v208, (uint64_t)v102, (uint64_t)&unk_1F3986660, v117, exception_object->inputColorSpace, v108, v110, v112, v114);

    CGFloat v124 = -5.0;
    if (v50 < 8.736)
    {
      CGFloat v124 = -4.0;
      if (v50 < 7.803)
      {
        CGFloat v124 = -3.0;
        if (v50 < 6.914)
        {
          CGFloat v124 = -2.0;
          if (v50 < 5.707)
          {
            CGFloat v124 = 0.0;
            if (v40 >= 4.5) {
              CGFloat v124 = -1.0;
            }
          }
        }
      }
    }
    objc_msgSend_extent(v202, v120, v121, v122, v123);
    v125 = exception_object;
    CGRect v245 = CGRectInset(v244, v124, v124);
    v224[0] = MEMORY[0x1E4F143A8];
    v224[1] = 3221225472;
    v224[2] = sub_1DDB9ECBC;
    v224[3] = &unk_1E6D05AE0;
    *(CGFloat *)&v224[4] = v124;
    v127 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(v125, v126, (uint64_t)v206, (uint64_t)v202, (uint64_t)v224, 0, v125->inputColorSpace, v245.origin.x, v245.origin.y, v245.size.width, v245.size.height);
    objc_msgSend_extent(v101, v128, v129, v130, v131);
    CGRect v247 = CGRectInset(v246, -5.0, -5.0);
    double v132 = v247.origin.x;
    double v133 = v247.origin.y;
    double v134 = v247.size.width;
    double v135 = v247.size.height;
    v230[0] = v127;
    *(float *)&v247.origin.double x = v40 + -2.0;
    v140 = objc_msgSend_numberWithFloat_(NSNumber, v136, v137, v138, v139, v247.origin.x);
    v230[1] = v140;
    v143 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v141, (uint64_t)v230, 2, v142);
    v145 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(v125, v144, (uint64_t)v216, (uint64_t)v118, (uint64_t)&unk_1F3986680, v143, v125->inputColorSpace, v132, v133, v134, v135);

    v146 = exception_object->inputImage;
    objc_msgSend_extent(v146, v147, v148, v149, v150);
    CGRect v249 = CGRectInset(v248, (float)-v40, (float)-v40);
    double v151 = v249.origin.x;
    double v152 = v249.origin.y;
    double v153 = v249.size.width;
    double v154 = v249.size.height;
    v222[0] = MEMORY[0x1E4F143A8];
    v222[1] = 3221225472;
    v222[2] = sub_1DDB9ECF4;
    v222[3] = &unk_1E6D04BA8;
    float v223 = v40;
    v229[0] = v145;
    v229[1] = v127;
    v229[2] = v205;
    *(float *)&v249.origin.double x = v40;
    v159 = objc_msgSend_numberWithFloat_(NSNumber, v155, v156, v157, v158, v249.origin.x);
    v229[3] = v159;
    v162 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v160, (uint64_t)v229, 4, v161);
    v164 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(exception_object, v163, (uint64_t)v207, (uint64_t)v146, (uint64_t)v222, v162, exception_object->inputColorSpace, v151, v152, v153, v154);

    if (v49 <= 0.0)
    {
      v182 = v145;
    }
    else
    {
      objc_msgSend_extent(v118, v165, v166, v167, v168);
      CGRect v251 = CGRectInset(v250, -5.0, -5.0);
      double v169 = v251.origin.x;
      double v170 = v251.origin.y;
      double v171 = v251.size.width;
      CGFloat v172 = v251.size.height;
      v228[0] = v127;
      *(float *)&v251.origin.double x = v49 + -2.0;
      v177 = objc_msgSend_numberWithFloat_(NSNumber, v173, v174, v175, v176, v251.origin.x);
      v228[1] = v177;
      v180 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v178, (uint64_t)v228, 2, v179);
      v182 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(exception_object, v181, (uint64_t)v216, (uint64_t)v118, (uint64_t)&unk_1F39866A0, v180, exception_object->inputColorSpace, v169, v170, v171, v172);

      objc_msgSend_floatValue(exception_object->inputAxialWidth, v183, v184, v185, v186);
      LODWORD(v172) = v187;
      objc_msgSend_extent(v164, v188, v189, v190, v191);
      CGRect v253 = CGRectInset(v252, (float)-*(float *)&v172, (float)-*(float *)&v172);
      double v192 = v253.origin.x;
      double v193 = v253.origin.y;
      double v194 = v253.size.width;
      double v195 = v253.size.height;
      v220[0] = MEMORY[0x1E4F143A8];
      v220[1] = 3221225472;
      v220[2] = sub_1DDB9ED58;
      v220[3] = &unk_1E6D04BA8;
      int v221 = LODWORD(v172);
      v227[0] = v182;
      v227[1] = v127;
      v227[2] = exception_object->inputAxialWidth;
      v198 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v196, (uint64_t)v227, 3, v197);
      uint64_t v200 = objc_msgSend_apply_image_extent_roiCallback_arguments_inoutSpace_(exception_object, v199, (uint64_t)v204, (uint64_t)v164, (uint64_t)v220, v198, exception_object->inputColorSpace, v192, v193, v194, v195);

      v164 = (void *)v200;
    }

    v203[2](v203);
  }
  else
  {
    v164 = 0;
  }

  return v164;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputAxialWidth, 0);
  objc_storeStrong((id *)&self->inputWidth, 0);

  objc_storeStrong((id *)&self->inputImage, 0);
}

@end