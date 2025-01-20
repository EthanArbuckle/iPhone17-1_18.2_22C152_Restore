@interface CIRAWGamutMapping
- (id)outputImage;
@end

@implementation CIRAWGamutMapping

- (id)outputImage
{
  v132[3] = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  inputRAWDictionary = self->inputRAWDictionary;
  if (inputRAWDictionary)
  {
    id v5 = [(NSDictionary *)inputRAWDictionary valueForKey:@"version"];
    if (v5) {
      int v6 = [v5 intValue];
    }
    else {
      int v6 = 9999;
    }
    id v9 = [(NSDictionary *)self->inputRAWDictionary valueForKey:@"mc00"];
    if (v9)
    {
      [v9 floatValue];
      float v126 = v10;
      objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", @"mc01"), "floatValue");
      float v12 = v11;
      objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", @"mc02"), "floatValue");
      float v14 = v13;
      objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", @"mc10"), "floatValue");
      float v16 = v15;
      objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", @"mc11"), "floatValue");
      float v18 = v17;
      objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", @"mc12"), "floatValue");
      float v20 = v19;
      objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", @"mc20"), "floatValue");
      float v22 = v21;
      objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", @"mc21"), "floatValue");
      float v24 = v23;
      objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", @"mc22"), "floatValue");
      float v26 = v25;
      v27 = +[CIKernel kernelWithInternalRepresentation:&CI::_convertUsingColorMatrix];
      v132[0] = +[CIVector vectorWithX:v126 Y:v16 Z:v22];
      v132[1] = +[CIVector vectorWithX:v12 Y:v18 Z:v24];
      v132[2] = +[CIVector vectorWithX:v14 Y:v20 Z:v26];
      uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v132 count:3];
      if (GetLinearAdobeRGB(void)::onceToken != -1) {
        dispatch_once(&GetLinearAdobeRGB(void)::onceToken, &__block_literal_global_58);
      }
      inputImage = [(CIFilter *)self apply:v27 image:inputImage arguments:v28 inoutSpace:GetLinearAdobeRGB(void)::space];
    }
    id v29 = [(NSDictionary *)self->inputRAWDictionary valueForKey:@"bknd"];
    if (v29)
    {
      int v30 = [v29 intValue];
    }
    else
    {
      NSLog(&cfstr_Cirawgamutmapp.isa, @"bknd");
      int v30 = 0;
    }
    id v31 = [(NSDictionary *)self->inputRAWDictionary valueForKey:@"btpnt"];
    if (v31)
    {
      [v31 floatValue];
      float v33 = v32;
    }
    else
    {
      NSLog(&cfstr_Cirawgamutmapp.isa, @"btpnt");
      float v33 = 0.25;
    }
    id v34 = [(NSDictionary *)self->inputRAWDictionary valueForKey:@"btwid"];
    if (v34)
    {
      [v34 floatValue];
      float v36 = v35;
    }
    else
    {
      NSLog(&cfstr_Cirawgamutmapp.isa, @"btwid");
      float v36 = 0.25;
    }
    id v37 = [(NSDictionary *)self->inputRAWDictionary valueForKey:@"blamt"];
    if (v37)
    {
      [v37 floatValue];
    }
    else
    {
      NSLog(&cfstr_Cirawgamutmapp.isa, @"blamt");
      float v38 = 1.0;
    }
    float v118 = v38;
    id v39 = [(NSDictionary *)self->inputRAWDictionary valueForKey:@"bamt"];
    float v116 = v36;
    float v117 = v33;
    if (v39)
    {
      [v39 floatValue];
      float v41 = v40;
    }
    else
    {
      NSLog(&cfstr_Cirawgamutmapp.isa, @"bamt");
      float v41 = 1.0;
    }
    objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", @"otrcS0"), "floatValue");
    float v43 = v42;
    objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", @"otrcS1"), "floatValue");
    float v45 = v44;
    objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", @"otrcS2"), "floatValue");
    float v47 = v46;
    objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", @"otrcS3"), "floatValue");
    float v49 = v48;
    objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", @"otrcS4"), "floatValue");
    float v51 = v50;
    objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", @"otrcY1"), "floatValue");
    float v53 = v52;
    objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", @"otrcY2"), "floatValue");
    float v55 = v54;
    objc_msgSend(-[NSDictionary valueForKey:](self->inputRAWDictionary, "valueForKey:", @"otrcY3"), "floatValue");
    double v56 = 1.0 - v41;
    float v57 = v56 + (float)(v41 * v43);
    float v58 = v56 + (float)(v41 * v45);
    float v59 = v56 + (float)(v41 * v47);
    float v60 = (float)(v41 * v53) + v56 * 0.1;
    float v61 = v56 + (float)(v41 * v49);
    float v62 = v56 + (float)(v41 * v51);
    float v63 = (float)(v41 * v55) + v56 * 0.2;
    float v65 = (float)(v41 * v64) + v56 * 0.5;
    float v66 = v57 * 0.1 / v60;
    double v67 = v58 * 0.1;
    float v68 = v67 / v60 + v66 + -2.0;
    float v69 = v60 * 1000.0 * v68;
    float v70 = v60 * 100.0 * (float)(1.0 - (float)(v66 + v68));
    float v125 = v70;
    float v127 = v69;
    float v71 = v60 * 10.0 * v66;
    double v72 = (float)(v63 - v60);
    *(float *)&double v67 = v67 / v72;
    double v73 = v59;
    float v74 = v73 * 0.1 / v72 + *(float *)&v67 + -2.0;
    float v75 = 1.0 - (float)(*(float *)&v67 + v74);
    float v123 = (float)((float)(v63 - v60) * v74) * 1000.0;
    float v124 = v71;
    float v76 = (v75 * 100.0 + v74 * -300.0) * v72;
    *(float *)&double v72 = (v75 * -20.0 + v74 * 30.0 + *(float *)&v67 * 10.0) * v72;
    float v121 = *(float *)&v72;
    float v122 = v76;
    float v120 = v60 + (float)((float)(v63 - v60) * (float)((float)(v75 - v74) - *(float *)&v67));
    double v77 = (float)(v65 - v63);
    *(float *)&double v73 = v73 * 0.3 / v77;
    double v78 = v61;
    double v79 = *(float *)&v73;
    float v80 = v78 * 0.3 / v77 + *(float *)&v73 + -2.0;
    float v81 = (float)((float)(v65 - v63) * v80) * 1000.0 / 27.0;
    float v119 = v81;
    double v82 = (float)-v80;
    double v83 = (float)(1.0 - (float)(*(float *)&v73 + v80));
    float v84 = (v82 * 200.0 / 9.0 + v83 * 100.0 / 9.0) * v77;
    float v85 = (v79 * 10.0 / 3.0 + v80 * 40.0 / 9.0 - v83 * 40.0 / 9.0) * v77;
    float v86 = v63 + v77 * (v82 * 8.0 / 27.0 + v83 * 4.0 / 9.0 - (v79 + v79) / 3.0);
    double v87 = v65;
    float v88 = v78 * 0.5 / (1.0 - v87);
    float v89 = v62 * 0.5 / (1.0 - v87) + v88 + -2.0;
    float v90 = 1.0 - (float)(v88 + v89);
    float v91 = (1.0 - v87) * v89 * 8.0;
    double v92 = v90 * 4.0;
    float v93 = (1.0 - v87) * (v92 + v89 * -12.0);
    float v94 = (1.0 - v87) * (v88 * 2.0 - (v92 - v89 * 6.0));
    float v95 = v87 + (1.0 - v87) * (float)((float)(v90 - v89) - v88);
    v96 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:");
    v97 = +[CIVector vectorWithX:v127 Y:v125 Z:v124 W:0.0];
    v98 = +[CIVector vectorWithX:v123 Y:v122 Z:v121 W:v120];
    v99 = +[CIVector vectorWithX:v119 Y:v84 Z:v85 W:v86];
    v100 = +[CIVector vectorWithX:v91 Y:v93 Z:v94 W:v95];
    *(float *)&double v101 = v62;
    uint64_t v102 = [NSNumber numberWithFloat:v101];
    if (!v6)
    {
      v103 = +[CIKernel kernelWithInternalRepresentation:&CI::_localBoost];
      v131[0] = v96;
      v131[1] = v97;
      v131[2] = v98;
      v131[3] = v99;
      v131[4] = v100;
      v131[5] = v102;
      uint64_t v104 = [MEMORY[0x1E4F1C978] arrayWithObjects:v131 count:6];
      if (GetLinearAdobeRGB(void)::onceToken == -1)
      {
LABEL_33:
        v105 = inputImage;
        uint64_t v106 = GetLinearAdobeRGB(void)::space;
        v107 = self;
        v108 = v103;
        return [(CIFilter *)v107 apply:v108 image:v105 arguments:v104 inoutSpace:v106];
      }
LABEL_41:
      dispatch_once(&GetLinearAdobeRGB(void)::onceToken, &__block_literal_global_58);
      goto LABEL_33;
    }
    if (v30 == 1)
    {
      v109 = +[CIKernel kernelWithInternalRepresentation:&CI::_boostRGBLNoGamma];
      v129[0] = v96;
      v129[1] = v97;
      v129[2] = v98;
      v129[3] = v99;
      v129[4] = v100;
      v129[5] = v102;
      uint64_t v110 = [MEMORY[0x1E4F1C978] arrayWithObjects:v129 count:6];
      if (GetLinearAdobeRGB(void)::onceToken != -1) {
        dispatch_once(&GetLinearAdobeRGB(void)::onceToken, &__block_literal_global_58);
      }
      id v111 = [(CIFilter *)self apply:v109 image:inputImage arguments:v110 inSpace:GetLinearAdobeRGB(void)::space];
      v112 = +[CIKernel kernelWithInternalRepresentation:&CI::_boostHybrid];
      v128[0] = v111;
      *(float *)&double v113 = v117;
      v128[1] = [NSNumber numberWithFloat:v113];
      *(float *)&double v114 = v116;
      v128[2] = [NSNumber numberWithFloat:v114];
      *(float *)&double v115 = v118;
      v128[3] = [NSNumber numberWithFloat:v115];
      uint64_t v104 = [MEMORY[0x1E4F1C978] arrayWithObjects:v128 count:4];
      if (GetLinearAdobeRGB(void)::onceToken != -1) {
        dispatch_once(&GetLinearAdobeRGB(void)::onceToken, &__block_literal_global_58);
      }
      uint64_t v106 = GetLinearAdobeRGB(void)::space;
      v107 = self;
      v108 = (CIColorKernel *)v112;
      v105 = inputImage;
      return [(CIFilter *)v107 apply:v108 image:v105 arguments:v104 inoutSpace:v106];
    }
    if (!v30)
    {
      v103 = +[CIKernel kernelWithInternalRepresentation:&CI::_boostRGB];
      v130[0] = v96;
      v130[1] = v97;
      v130[2] = v98;
      v130[3] = v99;
      v130[4] = v100;
      v130[5] = v102;
      uint64_t v104 = [MEMORY[0x1E4F1C978] arrayWithObjects:v130 count:6];
      if (GetLinearAdobeRGB(void)::onceToken == -1) {
        goto LABEL_33;
      }
      goto LABEL_41;
    }
    return 0;
  }
  else
  {
    v7 = inputImage;
    return v7;
  }
}

@end