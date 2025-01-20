@interface CIConvolution
- (id)_CIConvolutionAdd_1;
- (id)_CIConvolutionAdd_2;
- (id)_CIConvolutionAdd_3;
- (id)_CIConvolutionAdd_4;
- (id)_CIConvolutionAdd_5;
- (id)_CIConvolutionAdd_6;
- (id)_CIConvolutionAdd_7;
- (id)_CIConvolutionAdd_8;
- (id)doConvolutionPass:(id)a3 weights:(id)a4 sums:(id)a5;
- (id)outputImage;
- (int)samplesPerPass;
@end

@implementation CIConvolution

- (int)samplesPerPass
{
  return 8;
}

- (id)_CIConvolutionAdd_1
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_convolutionAdd_1];
}

- (id)_CIConvolutionAdd_2
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_convolutionAdd_2];
}

- (id)_CIConvolutionAdd_3
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_convolutionAdd_3];
}

- (id)_CIConvolutionAdd_4
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_convolutionAdd_4];
}

- (id)_CIConvolutionAdd_5
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_convolutionAdd_5];
}

- (id)_CIConvolutionAdd_6
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_convolutionAdd_6];
}

- (id)_CIConvolutionAdd_7
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_convolutionAdd_7];
}

- (id)_CIConvolutionAdd_8
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_convolutionAdd_8];
}

- (id)doConvolutionPass:(id)a3 weights:(id)a4 sums:(id)a5
{
  v265[4] = *MEMORY[0x1E4F143B8];
  [(CIImage *)self->inputImage extent];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v17 = boundsForPointArray((NSArray *)a3);
  v266.origin.CGFloat x = v10 - (v17 + v18);
  v266.size.CGFloat width = v14 + v18;
  v266.origin.CGFloat y = v12 - (v19 + v20);
  v266.size.CGFloat height = v16 + v20;
  CGRect v267 = CGRectIntegral(v266);
  CGFloat x = v267.origin.x;
  CGFloat y = v267.origin.y;
  CGFloat width = v267.size.width;
  CGFloat height = v267.size.height;
  switch([a3 count])
  {
    case 1u:
      uint64_t v25 = [(CIConvolution *)self _CIConvolutionAdd];
      [a5 extent];
      v284.origin.CGFloat x = v26;
      v284.origin.CGFloat y = v27;
      v284.size.CGFloat width = v28;
      v284.size.CGFloat height = v29;
      v268.origin.CGFloat x = x;
      v268.origin.CGFloat y = y;
      v268.size.CGFloat width = width;
      v268.size.CGFloat height = height;
      CGRect v269 = CGRectUnion(v268, v284);
      double v30 = v269.origin.x;
      double v31 = v269.origin.y;
      double v32 = v269.size.width;
      double v33 = v269.size.height;
      v257[0] = MEMORY[0x1E4F143A8];
      v257[1] = 3221225472;
      v257[2] = __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke;
      v257[3] = &unk_1E57716D0;
      v257[4] = a3;
      v265[0] = self->inputImage;
      v265[1] = a5;
      v265[2] = [a3 objectAtIndex:0];
      v265[3] = [a4 objectAtIndex:0];
      uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v265 count:4];
      v35 = v257;
      v36 = (void *)v25;
      goto LABEL_12;
    case 2u:
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 0), "floatValue");
      double v39 = v38;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 1), "floatValue");
      v41 = +[CIVector vectorWithX:v39 Y:v40];
      uint64_t v42 = [(CIConvolution *)self _CIConvolutionAdd];
      [a5 extent];
      v285.origin.CGFloat x = v43;
      v285.origin.CGFloat y = v44;
      v285.size.CGFloat width = v45;
      v285.size.CGFloat height = v46;
      v270.origin.CGFloat x = x;
      v270.origin.CGFloat y = y;
      v270.size.CGFloat width = width;
      v270.size.CGFloat height = height;
      CGRect v271 = CGRectUnion(v270, v285);
      double v30 = v271.origin.x;
      double v31 = v271.origin.y;
      double v32 = v271.size.width;
      double v33 = v271.size.height;
      v256[0] = MEMORY[0x1E4F143A8];
      v256[1] = 3221225472;
      v256[2] = __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke_2;
      v256[3] = &unk_1E57716D0;
      v256[4] = a3;
      v264[0] = self->inputImage;
      v264[1] = a5;
      v264[2] = [a3 objectAtIndex:0];
      v264[3] = [a3 objectAtIndex:1];
      v264[4] = v41;
      uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v264 count:5];
      v35 = v256;
      goto LABEL_11;
    case 3u:
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 0), "floatValue");
      double v48 = v47;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 1), "floatValue");
      double v50 = v49;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 2), "floatValue");
      v52 = +[CIVector vectorWithX:v48 Y:v50 Z:v51];
      uint64_t v42 = [(CIConvolution *)self _CIConvolutionAdd];
      [a5 extent];
      v286.origin.CGFloat x = v53;
      v286.origin.CGFloat y = v54;
      v286.size.CGFloat width = v55;
      v286.size.CGFloat height = v56;
      v272.origin.CGFloat x = x;
      v272.origin.CGFloat y = y;
      v272.size.CGFloat width = width;
      v272.size.CGFloat height = height;
      CGRect v273 = CGRectUnion(v272, v286);
      double v30 = v273.origin.x;
      double v31 = v273.origin.y;
      double v32 = v273.size.width;
      double v33 = v273.size.height;
      v255[0] = MEMORY[0x1E4F143A8];
      v255[1] = 3221225472;
      v255[2] = __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke_3;
      v255[3] = &unk_1E57716D0;
      v255[4] = a3;
      v263[0] = self->inputImage;
      v263[1] = a5;
      v263[2] = [a3 objectAtIndex:0];
      v263[3] = [a3 objectAtIndex:1];
      v263[4] = [a3 objectAtIndex:2];
      v263[5] = v52;
      uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v263 count:6];
      v35 = v255;
      goto LABEL_11;
    case 4u:
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "X");
      double v58 = v57;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "Y");
      double v60 = v59;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 1), "X");
      double v62 = v61;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 1), "Y");
      v64 = +[CIVector vectorWithX:v58 Y:v60 Z:v62 W:v63];
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 2), "X");
      double v66 = v65;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 2), "Y");
      double v68 = v67;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 3), "X");
      double v70 = v69;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 3), "Y");
      v72 = +[CIVector vectorWithX:v66 Y:v68 Z:v70 W:v71];
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 0), "floatValue");
      double v74 = v73;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 1), "floatValue");
      double v76 = v75;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 2), "floatValue");
      double v78 = v77;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 3), "floatValue");
      v80 = +[CIVector vectorWithX:v74 Y:v76 Z:v78 W:v79];
      uint64_t v42 = [(CIConvolution *)self _CIConvolutionAdd];
      [a5 extent];
      v287.origin.CGFloat x = v81;
      v287.origin.CGFloat y = v82;
      v287.size.CGFloat width = v83;
      v287.size.CGFloat height = v84;
      v274.origin.CGFloat x = x;
      v274.origin.CGFloat y = y;
      v274.size.CGFloat width = width;
      v274.size.CGFloat height = height;
      CGRect v275 = CGRectUnion(v274, v287);
      double v30 = v275.origin.x;
      double v31 = v275.origin.y;
      double v32 = v275.size.width;
      double v33 = v275.size.height;
      v254[0] = MEMORY[0x1E4F143A8];
      v254[1] = 3221225472;
      v254[2] = __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke_4;
      v254[3] = &unk_1E57716D0;
      v254[4] = a3;
      v262[0] = self->inputImage;
      v262[1] = a5;
      v262[2] = v64;
      v262[3] = v72;
      v262[4] = v80;
      uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v262 count:5];
      v35 = v254;
      goto LABEL_11;
    case 5u:
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "X");
      double v86 = v85;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "Y");
      double v88 = v87;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 1), "X");
      double v90 = v89;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 1), "Y");
      v92 = +[CIVector vectorWithX:v86 Y:v88 Z:v90 W:v91];
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 2), "X");
      double v94 = v93;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 2), "Y");
      double v96 = v95;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 3), "X");
      double v98 = v97;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 3), "Y");
      v100 = +[CIVector vectorWithX:v94 Y:v96 Z:v98 W:v99];
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 0), "floatValue");
      double v102 = v101;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 1), "floatValue");
      double v104 = v103;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 2), "floatValue");
      double v106 = v105;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 3), "floatValue");
      v108 = +[CIVector vectorWithX:v102 Y:v104 Z:v106 W:v107];
      uint64_t v109 = [(CIConvolution *)self _CIConvolutionAdd];
      [a5 extent];
      v288.origin.CGFloat x = v110;
      v288.origin.CGFloat y = v111;
      v288.size.CGFloat width = v112;
      v288.size.CGFloat height = v113;
      v276.origin.CGFloat x = x;
      v276.origin.CGFloat y = y;
      v276.size.CGFloat width = width;
      v276.size.CGFloat height = height;
      CGRect v277 = CGRectUnion(v276, v288);
      double v30 = v277.origin.x;
      double v31 = v277.origin.y;
      double v32 = v277.size.width;
      double v33 = v277.size.height;
      v253[0] = MEMORY[0x1E4F143A8];
      v253[1] = 3221225472;
      v253[2] = __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke_5;
      v253[3] = &unk_1E57716D0;
      v253[4] = a3;
      v261[0] = self->inputImage;
      v261[1] = a5;
      v261[2] = v92;
      v261[3] = v100;
      v261[4] = [a3 objectAtIndex:4];
      v261[5] = v108;
      v261[6] = [a4 objectAtIndex:4];
      uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v261 count:7];
      v35 = v253;
      v36 = (void *)v109;
      goto LABEL_12;
    case 6u:
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "X");
      double v115 = v114;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "Y");
      double v117 = v116;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 1), "X");
      double v119 = v118;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 1), "Y");
      v121 = +[CIVector vectorWithX:v115 Y:v117 Z:v119 W:v120];
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 2), "X");
      double v123 = v122;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 2), "Y");
      double v125 = v124;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 3), "X");
      double v127 = v126;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 3), "Y");
      v129 = +[CIVector vectorWithX:v123 Y:v125 Z:v127 W:v128];
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 4), "X");
      double v131 = v130;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 4), "Y");
      double v133 = v132;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 5), "X");
      double v135 = v134;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 5), "Y");
      v137 = +[CIVector vectorWithX:v131 Y:v133 Z:v135 W:v136];
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 0), "floatValue");
      double v139 = v138;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 1), "floatValue");
      double v141 = v140;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 2), "floatValue");
      double v143 = v142;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 3), "floatValue");
      v145 = +[CIVector vectorWithX:v139 Y:v141 Z:v143 W:v144];
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 4), "floatValue");
      double v147 = v146;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 5), "floatValue");
      v149 = +[CIVector vectorWithX:v147 Y:v148];
      uint64_t v42 = [(CIConvolution *)self _CIConvolutionAdd];
      [a5 extent];
      v289.origin.CGFloat x = v150;
      v289.origin.CGFloat y = v151;
      v289.size.CGFloat width = v152;
      v289.size.CGFloat height = v153;
      v278.origin.CGFloat x = x;
      v278.origin.CGFloat y = y;
      v278.size.CGFloat width = width;
      v278.size.CGFloat height = height;
      CGRect v279 = CGRectUnion(v278, v289);
      double v30 = v279.origin.x;
      double v31 = v279.origin.y;
      double v32 = v279.size.width;
      double v33 = v279.size.height;
      v252[0] = MEMORY[0x1E4F143A8];
      v252[1] = 3221225472;
      v252[2] = __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke_6;
      v252[3] = &unk_1E57716D0;
      v252[4] = a3;
      v260[0] = self->inputImage;
      v260[1] = a5;
      v260[2] = v121;
      v260[3] = v129;
      v260[4] = v137;
      v260[5] = v145;
      v260[6] = v149;
      uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v260 count:7];
      v35 = v252;
      goto LABEL_11;
    case 7u:
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "X");
      double v155 = v154;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "Y");
      double v157 = v156;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 1), "X");
      double v159 = v158;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 1), "Y");
      v161 = +[CIVector vectorWithX:v155 Y:v157 Z:v159 W:v160];
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 2), "X");
      double v163 = v162;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 2), "Y");
      double v165 = v164;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 3), "X");
      double v167 = v166;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 3), "Y");
      v169 = +[CIVector vectorWithX:v163 Y:v165 Z:v167 W:v168];
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 4), "X");
      double v171 = v170;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 4), "Y");
      double v173 = v172;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 5), "X");
      double v175 = v174;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 5), "Y");
      v177 = +[CIVector vectorWithX:v171 Y:v173 Z:v175 W:v176];
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 0), "floatValue");
      double v179 = v178;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 1), "floatValue");
      double v181 = v180;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 2), "floatValue");
      double v183 = v182;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 3), "floatValue");
      v185 = +[CIVector vectorWithX:v179 Y:v181 Z:v183 W:v184];
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 4), "floatValue");
      double v187 = v186;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 5), "floatValue");
      double v189 = v188;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 6), "floatValue");
      v191 = +[CIVector vectorWithX:v187 Y:v189 Z:v190];
      uint64_t v42 = [(CIConvolution *)self _CIConvolutionAdd];
      [a5 extent];
      v290.origin.CGFloat x = v192;
      v290.origin.CGFloat y = v193;
      v290.size.CGFloat width = v194;
      v290.size.CGFloat height = v195;
      v280.origin.CGFloat x = x;
      v280.origin.CGFloat y = y;
      v280.size.CGFloat width = width;
      v280.size.CGFloat height = height;
      CGRect v281 = CGRectUnion(v280, v290);
      double v30 = v281.origin.x;
      double v31 = v281.origin.y;
      double v32 = v281.size.width;
      double v33 = v281.size.height;
      v251[0] = MEMORY[0x1E4F143A8];
      v251[1] = 3221225472;
      v251[2] = __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke_7;
      v251[3] = &unk_1E57716D0;
      inputImage = self->inputImage;
      v251[4] = a3;
      v259[0] = inputImage;
      v259[1] = a5;
      v259[2] = v161;
      v259[3] = v169;
      v259[4] = v177;
      v259[5] = [a3 objectAtIndex:6];
      v259[6] = v185;
      v259[7] = v191;
      uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v259 count:8];
      v35 = v251;
      goto LABEL_11;
    case 8u:
      id v249 = a5;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "X");
      double v198 = v197;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "Y");
      double v200 = v199;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 1), "X");
      double v202 = v201;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 1), "Y");
      v248 = +[CIVector vectorWithX:v198 Y:v200 Z:v202 W:v203];
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 2), "X");
      double v205 = v204;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 2), "Y");
      double v207 = v206;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 3), "X");
      double v209 = v208;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 3), "Y");
      v211 = +[CIVector vectorWithX:v205 Y:v207 Z:v209 W:v210];
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 4), "X");
      double v213 = v212;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 4), "Y");
      double v215 = v214;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 5), "X");
      double v217 = v216;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 5), "Y");
      v219 = +[CIVector vectorWithX:v213 Y:v215 Z:v217 W:v218];
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 6), "X");
      double v221 = v220;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 6), "Y");
      double v223 = v222;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 7), "X");
      double v225 = v224;
      objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 7), "Y");
      v227 = +[CIVector vectorWithX:v221 Y:v223 Z:v225 W:v226];
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 0), "floatValue");
      double v229 = v228;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 1), "floatValue");
      double v231 = v230;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 2), "floatValue");
      double v233 = v232;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 3), "floatValue");
      v235 = +[CIVector vectorWithX:v229 Y:v231 Z:v233 W:v234];
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 4), "floatValue");
      double v237 = v236;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 5), "floatValue");
      double v239 = v238;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 6), "floatValue");
      double v241 = v240;
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 7), "floatValue");
      v243 = +[CIVector vectorWithX:v237 Y:v239 Z:v241 W:v242];
      uint64_t v42 = [(CIConvolution *)self _CIConvolutionAdd];
      [v249 extent];
      v291.origin.CGFloat x = v244;
      v291.origin.CGFloat y = v245;
      v291.size.CGFloat width = v246;
      v291.size.CGFloat height = v247;
      v282.origin.CGFloat x = x;
      v282.origin.CGFloat y = y;
      v282.size.CGFloat width = width;
      v282.size.CGFloat height = height;
      CGRect v283 = CGRectUnion(v282, v291);
      double v30 = v283.origin.x;
      double v31 = v283.origin.y;
      double v32 = v283.size.width;
      double v33 = v283.size.height;
      v250[0] = MEMORY[0x1E4F143A8];
      v250[1] = 3221225472;
      v250[2] = __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke_8;
      v250[3] = &unk_1E57716D0;
      v250[4] = a3;
      v258[0] = self->inputImage;
      v258[1] = v249;
      v258[2] = v248;
      v258[3] = v211;
      v258[4] = v219;
      v258[5] = v227;
      v258[6] = v235;
      v258[7] = v243;
      uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v258 count:8];
      v35 = v250;
LABEL_11:
      v36 = (void *)v42;
LABEL_12:
      id result = (id)objc_msgSend(v36, "applyWithExtent:roiCallback:arguments:", v35, v34, v30, v31, v32, v33);
      break;
    default:
      id result = 0;
      break;
  }
  return result;
}

double __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  return convolutionAddROI(a2, *(CGRect *)&a3, *(NSArray **)(a1 + 32));
}

double __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke_2(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  return convolutionAddROI(a2, *(CGRect *)&a3, *(NSArray **)(a1 + 32));
}

double __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke_3(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  return convolutionAddROI(a2, *(CGRect *)&a3, *(NSArray **)(a1 + 32));
}

double __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke_4(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  return convolutionAddROI(a2, *(CGRect *)&a3, *(NSArray **)(a1 + 32));
}

double __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke_5(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  return convolutionAddROI(a2, *(CGRect *)&a3, *(NSArray **)(a1 + 32));
}

double __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke_6(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  return convolutionAddROI(a2, *(CGRect *)&a3, *(NSArray **)(a1 + 32));
}

double __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke_7(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  return convolutionAddROI(a2, *(CGRect *)&a3, *(NSArray **)(a1 + 32));
}

double __48__CIConvolution_doConvolutionPass_weights_sums___block_invoke_8(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  return convolutionAddROI(a2, *(CGRect *)&a3, *(NSArray **)(a1 + 32));
}

- (id)outputImage
{
  int v3 = [(NSArray *)self->inputPoints count];
  int v4 = [(NSArray *)self->inputWeights count];
  if (v3) {
    BOOL v5 = v4 == v3;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5) {
    return 0;
  }
  v6 = +[CIImage emptyImage];
  if (v3 >= 1)
  {
    uint64_t v7 = 0;
    int v8 = v3;
    do
    {
      int v9 = v8 - 8;
      if (v8 >= 8) {
        int v8 = 8;
      }
      v6 = -[CIConvolution doConvolutionPass:weights:sums:](self, "doConvolutionPass:weights:sums:", -[NSArray subarrayWithRange:](self->inputPoints, "subarrayWithRange:", v7, v8), -[NSArray subarrayWithRange:](self->inputWeights, "subarrayWithRange:", v7, v8), v6);
      v7 += 8;
      int v8 = v9;
    }
    while ((int)v7 < v3);
  }
  return v6;
}

@end