@interface BVHDescriptor
- (BOOL)canDoPairing;
- (BOOL)primitiveMotion;
- (BOOL)useParallelWideBuild;
- (BOOL)useSpatialSplits;
- (BVHDescriptor)initWithDescriptor:(id)a3;
- (PipelineKey)cachedPipelineKey;
- (id).cxx_construct;
- (unint64_t)actualMaxDepth;
- (unint64_t)buildAlgorithm;
- (unint64_t)maxInnerNodeCount;
- (unint64_t)maxLeafNodeCount;
- (unint64_t)resourceBufferLength;
- (void)setBuildAlgorithm:(unint64_t)a3;
- (void)setResourceBufferContents:(char *)a3 resourceBufferAddress:(unint64_t)a4 instanceBoundingBoxBufferAddress:(unint64_t)a5 useResourcesOnEncoder:(id)a6;
- (void)updateMaxDepth;
- (void)updatePipelineKey;
@end

@implementation BVHDescriptor

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  return self;
}

- (void)setBuildAlgorithm:(unint64_t)a3
{
  self->_buildAlgorithm = a3;
}

- (unint64_t)buildAlgorithm
{
  return self->_buildAlgorithm;
}

- (void)setResourceBufferContents:(char *)a3 resourceBufferAddress:(unint64_t)a4 instanceBoundingBoxBufferAddress:(unint64_t)a5 useResourcesOnEncoder:(id)a6
{
  unint64_t v243 = a4;
  v248 = a3;
  uint64_t v250 = *MEMORY[0x263EF8340];
  unint64_t geometryCount = self->_geometryCount;
  if (!geometryCount) {
    return;
  }
  unsigned int primitiveType = self->_primitiveType;
  primitiveKeyframeCount = (char *)self->_primitiveKeyframeCount;
  uint64_t v10 = primitiveKeyframeCount;
  unsigned int polygonType = self->_polygonType;
  unint64_t v12 = geometryCount << 7;
  unint64_t v249 = self->_geometryCount;
  v247 = primitiveKeyframeCount;
  switch(primitiveType)
  {
    case 0u:
      id v233 = a6;
      v234 = self;
      v13 = (char *)[(MTLAccelerationStructureDescriptor *)self->_mtlDescriptor geometryDescriptors];
      v246 = v13;
      LODWORD(v237) = polygonType;
      if (geometryCount > 0x20)
      {
        v15 = (char *)malloc_type_malloc(32 * geometryCount, 0xE03139CDuLL);
      }
      else
      {
        MEMORY[0x270FA5388](v13);
        v15 = (char *)&v233 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v15, v14);
      }
      v78 = (void *)[v246 objectAtIndexedSubscript:0];
      if (v78)
      {
        v79 = v78;
        MTLAttributeFormat v239 = [v78 vertexFormat];
        uint64_t v236 = [v79 vertexStride];
        if (!v236) {
          uint64_t v236 = MTLAttributeFormatSize(v239);
        }
      }
      else
      {
        uint64_t v236 = 0;
        MTLAttributeFormat v239 = MTLAttributeFormatFloat3;
      }
      uint64_t v155 = 0;
      uint64_t v156 = 0;
      int v157 = 0;
      v158 = v248 + 58;
      LODWORD(v248) = 1;
      LODWORD(v247) = 1;
      BOOL v159 = 1;
      while (1)
      {
        v162 = (void *)[v246 objectAtIndexedSubscript:v155];
        uint64_t v163 = objc_msgSend((id)objc_msgSend(v162, "vertexBuffer"), "gpuAddress");
        *(void *)(v158 - 58) = [v162 vertexBufferOffset] + v163;
        uint64_t v164 = v156 + 1;
        *(void *)&v15[8 * v156] = [v162 vertexBuffer];
        v165 = (void *)[v162 indexBuffer];
        if (v165) {
          break;
        }
        char v169 = 0;
LABEL_172:
        v158[1] = v169;
        uint64_t v173 = [v162 vertexStride];
        MTLAttributeFormat v174 = [v162 vertexFormat];
        if (!v173) {
          LODWORD(v173) = MTLAttributeFormatSize(v174);
        }
        *(_DWORD *)(v158 - 10) = v173;
        *((_WORD *)v158 - 1) = [v162 vertexFormat];
        uint64_t v175 = [v162 transformationMatrixBuffer];
        if (v175)
        {
          uint64_t v176 = v175;
          uint64_t v177 = objc_msgSend((id)objc_msgSend(v162, "transformationMatrixBuffer"), "gpuAddress");
          *(void *)(v158 - 18) = [v162 transformationMatrixBufferOffset] + v177;
          *(void *)&v15[8 * v164++] = v176;
        }
        else
        {
          *(void *)(v158 - 18) = 0;
        }
        *(_DWORD *)(v158 + 26) = [v162 triangleCount];
        uint64_t v178 = [v162 transformationMatrixLayout];
        char *v158 = v178 == 1;
        if (v248) {
          LODWORD(v248) = v236 == *(_DWORD *)(v158 - 10);
        }
        if (v247) {
          LODWORD(v247) = v239 == *((unsigned __int16 *)v158 - 1);
        }
        if (v159) {
          BOOL v159 = v178 != 1;
        }
        *(_DWORD *)(v158 + 34) = [v162 opaque];
        *(_DWORD *)(v158 + 30) = [v162 intersectionFunctionTableOffset];
        uint64_t v179 = [v162 primitiveDataBuffer];
        if (v179)
        {
          uint64_t v180 = v179;
          uint64_t v181 = objc_msgSend((id)objc_msgSend(v162, "primitiveDataBuffer"), "gpuAddress");
          *(void *)(v158 + 46) = [v162 primitiveDataBufferOffset] + v181;
          int v160 = [v162 primitiveDataStride];
          LODWORD(v179) = [v162 primitiveDataElementSize];
          uint64_t v156 = v164 + 1;
          *(void *)&v15[8 * v164] = v180;
          if (v179 < 2)
          {
            int v161 = 1;
          }
          else if (v179 > 0x10)
          {
            int v161 = 32;
          }
          else
          {
            int v161 = 1 << -(char)__clz(v179 - 1);
          }
        }
        else
        {
          int v160 = 0;
          *(void *)(v158 + 46) = 0;
          int v161 = 1;
          uint64_t v156 = v164;
        }
        *(_DWORD *)(v158 + 54) = v160;
        *(_DWORD *)(v158 + 58) = v179;
        *(_DWORD *)(v158 + 38) = (v179 + v161 - 1) & -v161;
        *(_DWORD *)(v158 + 42) = v157;
        v157 += *(_DWORD *)(v158 + 26);
        ++v155;
        v158 += 128;
        if (v249 == v155)
        {
          if (v156) {
            [v233 useResources:v15 count:v156 usage:1];
          }
          if (v249 >= 0x21) {
            free(v15);
          }
          char v153 = v159;
          char v182 = v247 & 1;
          if ((v248 & 1) == 0) {
            goto LABEL_274;
          }
          goto LABEL_199;
        }
      }
      v166 = v165;
      uint64_t v167 = [v165 gpuAddress];
      *(void *)(v158 - 26) = [v162 indexBufferOffset] + v167;
      uint64_t v168 = [v162 indexType];
      if (v237 == 2)
      {
        if (v168) {
          char v169 = 4;
        }
        else {
          char v169 = 2;
        }
        if ([v162 indexBuffer]) {
          goto LABEL_171;
        }
        unint64_t v170 = [v162 maxVertexIndex];
        if (v170 < 0x100)
        {
          char v169 = 1;
LABEL_171:
          *(void *)&v15[8 * v164] = v166;
          uint64_t v164 = v156 + 2;
          goto LABEL_172;
        }
        if (v170 < 0x10000)
        {
          char v169 = 2;
          goto LABEL_171;
        }
        if (!(v170 >> 24))
        {
          char v169 = 3;
          goto LABEL_171;
        }
        BOOL v171 = HIDWORD(v170) == 0;
        char v172 = 8;
      }
      else
      {
        BOOL v171 = v168 == 1;
        char v172 = 2;
      }
      if (v171) {
        char v169 = 4;
      }
      else {
        char v169 = v172;
      }
      goto LABEL_171;
    case 1u:
      id v233 = a6;
      v234 = self;
      unsigned int v27 = primitiveKeyframeCount;
      v28 = (char *)[(MTLAccelerationStructureDescriptor *)self->_mtlDescriptor geometryDescriptors];
      v247 = v28;
      if (v27 <= 1) {
        int v29 = 1;
      }
      else {
        int v29 = v27;
      }
      unint64_t v30 = geometryCount * (v29 + 1);
      if (geometryCount > 0x20)
      {
        v32 = (char *)malloc_type_malloc(8 * v30, 0x9B1E2808uLL);
      }
      else
      {
        MEMORY[0x270FA5388](v28);
        v32 = (char *)&v233 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v32, v31);
      }
      v80 = (void *)[v247 objectAtIndexedSubscript:0];
      if (v80) {
        uint64_t v244 = [v80 boundingBoxStride];
      }
      else {
        uint64_t v244 = 0;
      }
      uint64_t v183 = 0;
      uint64_t v184 = 0;
      int v185 = 0;
      v186 = v248 + 84;
      BOOL v187 = 1;
      do
      {
        v190 = (void *)[v247 objectAtIndexedSubscript:v183];
        uint64_t v191 = objc_msgSend((id)objc_msgSend(v190, "boundingBoxBuffer"), "gpuAddress");
        *(void *)(v186 - 76) = [v190 boundingBoxBufferOffset] + v191;
        *(void *)&v32[8 * v184] = [v190 boundingBoxBuffer];
        *((_DWORD *)v186 - 8) = [v190 boundingBoxStride];
        *(_DWORD *)v186 = [v190 boundingBoxCount];
        if (v187) {
          BOOL v187 = v244 == *((_DWORD *)v186 - 8);
        }
        uint64_t v192 = v184 + 1;
        *((_DWORD *)v186 + 2) = [v190 opaque];
        *((_DWORD *)v186 + 1) = [v190 intersectionFunctionTableOffset];
        uint64_t v193 = [v190 primitiveDataBuffer];
        if (!v193)
        {
          int v196 = 0;
          *(void *)(v186 + 20) = 0;
          int v188 = 1;
          ++v184;
LABEL_212:
          unint64_t v197 = v249;
          goto LABEL_204;
        }
        uint64_t v194 = v193;
        uint64_t v195 = objc_msgSend((id)objc_msgSend(v190, "primitiveDataBuffer"), "gpuAddress");
        *(void *)(v186 + 20) = [v190 primitiveDataBufferOffset] + v195;
        int v196 = [v190 primitiveDataStride];
        LODWORD(v193) = [v190 primitiveDataElementSize];
        v184 += 2;
        *(void *)&v32[8 * v192] = v194;
        if (v193 < 2)
        {
          int v188 = 1;
          goto LABEL_212;
        }
        unint64_t v197 = v249;
        if (v193 <= 0x10) {
          int v188 = 1 << -(char)__clz(v193 - 1);
        }
        else {
          int v188 = 32;
        }
LABEL_204:
        *((_DWORD *)v186 + 7) = v196;
        *((_DWORD *)v186 + 8) = v193;
        *((_DWORD *)v186 + 3) = (v193 + v188 - 1) & -v188;
        *((_DWORD *)v186 + 4) = v185;
        int v189 = *(_DWORD *)v186;
        v186 += 128;
        v185 += v189;
        ++v183;
      }
      while (v197 != v183);
      if (v184) {
        [v233 useResources:v32 count:v184 usage:1];
      }
      if (v197 >= 0x21) {
        free(v32);
      }
      unsigned int v52 = 0;
      v127 = v234;
      v234->_vertexStride = 0;
      if (!v187) {
LABEL_149:
      }
        uint64_t v244 = 0xFFFFFFFFLL;
LABEL_150:
      v127->_boundingBoxStride = v244;
      char v153 = 1;
      uint64_t v154 = 30;
LABEL_151:
      MTLAttributeFormat v239 = v154;
LABEL_152:
      v127->_vertexFormat = v239;
      v127->_allGeometryColumnMajor = v153;
      v127->_controlPointCount = v52;
      return;
    case 2u:
      id v233 = a6;
      v234 = self;
      unsigned int v16 = primitiveKeyframeCount;
      v17 = (char *)[(MTLAccelerationStructureDescriptor *)self->_mtlDescriptor geometryDescriptors];
      v246 = v17;
      if (v16 <= 1) {
        int v18 = 1;
      }
      else {
        int v18 = v16;
      }
      unint64_t v19 = geometryCount * (2 * v18 + 2);
      if (geometryCount > 0x20)
      {
        v247 = (char *)malloc_type_malloc(8 * v19, 0xC3126A1AuLL);
      }
      else
      {
        MEMORY[0x270FA5388](v17);
        v247 = (char *)&v233 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v247, v20);
      }
      unsigned int v52 = 0;
      uint64_t v53 = 0;
      uint64_t v54 = 0;
      int v55 = 0;
      v56 = v248 + 59;
      while (1)
      {
        v58 = (void *)[v246 objectAtIndexedSubscript:v53];
        uint64_t v59 = objc_msgSend((id)objc_msgSend(v58, "controlPointBuffer"), "gpuAddress");
        *(void *)(v56 - 43) = [v58 controlPointBufferOffset] + v59;
        uint64_t v60 = [v58 controlPointBuffer];
        v61 = (uint64_t *)&v247[8 * v54];
        uint64_t *v61 = v60;
        uint64_t v62 = objc_msgSend((id)objc_msgSend(v58, "radiusBuffer"), "gpuAddress");
        *(void *)(v56 - 35) = [v58 radiusBufferOffset] + v62;
        v61[1] = [v58 radiusBuffer];
        uint64_t v63 = objc_msgSend((id)objc_msgSend(v58, "indexBuffer"), "gpuAddress");
        *(void *)(v56 - 27) = [v58 indexBufferOffset] + v63;
        v61[2] = [v58 indexBuffer];
        *(_DWORD *)(v56 + 9) = [v58 controlPointFormat];
        v56[13] = [v58 radiusFormat];
        uint64_t v64 = [v58 controlPointStride];
        if (!v64) {
          LODWORD(v64) = MTLAttributeFormatSize((MTLAttributeFormat)*(unsigned int *)(v56 + 9));
        }
        *(_DWORD *)(v56 + 1) = v64;
        uint64_t v65 = [v58 radiusStride];
        if (!v65) {
          LODWORD(v65) = MTLAttributeFormatSize((MTLAttributeFormat)v56[13]);
        }
        uint64_t v66 = v54 + 3;
        *(_DWORD *)(v56 + 5) = v65;
        unsigned int v67 = v52;
        *(_DWORD *)(v56 + 17) = v52;
        v56[14] = [v58 curveBasis];
        *(_DWORD *)(v56 + 21) = [v58 segmentControlPointCount];
        v56[15] = [v58 curveType];
        v56[16] = [v58 curveEndCaps];
        if ([v58 indexType]) {
          char v68 = 4;
        }
        else {
          char v68 = 2;
        }
        char *v56 = v68;
        int v69 = [v58 controlPointCount];
        *(_DWORD *)(v56 + 25) = [v58 segmentCount];
        *(_DWORD *)(v56 + 33) = [v58 opaque];
        *(_DWORD *)(v56 + 29) = [v58 intersectionFunctionTableOffset];
        uint64_t v70 = [v58 primitiveDataBuffer];
        if (v70)
        {
          uint64_t v71 = v70;
          uint64_t v72 = objc_msgSend((id)objc_msgSend(v58, "primitiveDataBuffer"), "gpuAddress");
          *(void *)(v56 + 45) = [v58 primitiveDataBufferOffset] + v72;
          int v73 = [v58 primitiveDataStride];
          LODWORD(v70) = [v58 primitiveDataElementSize];
          v54 += 4;
          *(void *)&v247[8 * v66] = v71;
          if (v70 >= 2)
          {
            unint64_t v74 = v249;
            unsigned int v75 = v67;
            if (v70 <= 0x10) {
              int v57 = 1 << -(char)__clz(v70 - 1);
            }
            else {
              int v57 = 32;
            }
            goto LABEL_41;
          }
          int v57 = 1;
        }
        else
        {
          int v73 = 0;
          *(void *)(v56 + 45) = 0;
          int v57 = 1;
          v54 += 3;
        }
        unint64_t v74 = v249;
        unsigned int v75 = v67;
LABEL_41:
        unsigned int v52 = v75 + v69;
        *(_DWORD *)(v56 + 53) = v73;
        *(_DWORD *)(v56 + 57) = v70;
        *(_DWORD *)(v56 + 37) = (v70 + v57 - 1) & -v57;
        *(_DWORD *)(v56 + 41) = v55;
        v55 += *(_DWORD *)(v56 + 25);
        ++v53;
        v56 += 128;
        if (v74 == v53)
        {
          if (v54) {
            [v233 useResources:v247 count:v54 usage:1];
          }
          if (v74 >= 0x21)
          {
            v76 = v247;
            goto LABEL_110;
          }
          goto LABEL_111;
        }
      }
    case 3u:
      LODWORD(v237) = polygonType;
      id v233 = a6;
      v234 = self;
      unsigned int v33 = primitiveKeyframeCount;
      v34 = (void *)[(MTLAccelerationStructureDescriptor *)self->_mtlDescriptor geometryDescriptors];
      id v235 = v34;
      if (v33 <= 1) {
        int v35 = 1;
      }
      else {
        int v35 = v33;
      }
      unint64_t v36 = geometryCount * (v35 + 3);
      if (geometryCount > 0x20)
      {
        v246 = (char *)malloc_type_malloc(8 * v36, 0x62C3A23DuLL);
      }
      else
      {
        MEMORY[0x270FA5388](v34);
        v246 = (char *)&v233 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v246, v37);
      }
      v81 = (void *)[v235 objectAtIndexedSubscript:0];
      if (v81)
      {
        v82 = v81;
        MTLAttributeFormat v239 = [v81 vertexFormat];
        uint64_t v83 = [v82 vertexStride];
        if (!v83) {
          uint64_t v83 = MTLAttributeFormatSize(v239);
        }
        uint64_t v236 = v83;
      }
      else
      {
        uint64_t v236 = 0;
        MTLAttributeFormat v239 = MTLAttributeFormatFloat3;
      }
      uint64_t v198 = 0;
      uint64_t v199 = 0;
      int v200 = 0;
      uint64_t v238 = 8 * v10;
      unint64_t v241 = geometryCount << 7;
      v201 = &v248[v12];
      LODWORD(v242) = 1;
      LODWORD(v240) = 1;
      LODWORD(v245) = 1;
      while (1)
      {
        v205 = (void *)[v235 objectAtIndexedSubscript:v198];
        v206 = v205;
        v207 = &v248[128 * v198];
        LODWORD(v244) = v200;
        if (v247 < 2)
        {
          if (v247 == 1)
          {
            v212 = objc_msgSend((id)objc_msgSend(v205, "vertexBuffers"), "objectAtIndexedSubscript:", 0);
            uint64_t v213 = objc_msgSend((id)objc_msgSend(v212, "buffer"), "gpuAddress");
            *(void *)v207 = [v212 offset] + v213;
            uint64_t v214 = [v212 buffer];
            *(void *)&v246[8 * v199++] = v214;
          }
        }
        else
        {
          if (v10)
          {
            uint64_t v208 = 0;
            v209 = &v246[8 * v199];
            do
            {
              v210 = objc_msgSend((id)objc_msgSend(v206, "vertexBuffers"), "objectAtIndexedSubscript:", v208);
              uint64_t v211 = objc_msgSend((id)objc_msgSend(v210, "buffer"), "gpuAddress");
              *(void *)&v201[8 * v208] = [v210 offset] + v211;
              *(void *)&v209[8 * v208++] = [v210 buffer];
            }
            while (v10 != v208);
            v199 += v208;
          }
          *(void *)v207 = v241 + v238 * v198 + v243;
        }
        v215 = (void *)[v206 indexBuffer];
        if (v215) {
          break;
        }
        char v219 = 0;
LABEL_246:
        v207[59] = v219;
        uint64_t v223 = [v206 vertexStride];
        MTLAttributeFormat v224 = [v206 vertexFormat];
        if (!v223) {
          LODWORD(v223) = MTLAttributeFormatSize(v224);
        }
        *((_DWORD *)v207 + 12) = v223;
        *((_WORD *)v207 + 28) = [v206 vertexFormat];
        uint64_t v225 = [v206 transformationMatrixBuffer];
        if (v225)
        {
          uint64_t v226 = v225;
          uint64_t v227 = objc_msgSend((id)objc_msgSend(v206, "transformationMatrixBuffer"), "gpuAddress");
          *((void *)v207 + 5) = [v206 transformationMatrixBufferOffset] + v227;
          *(void *)&v246[8 * v199++] = v226;
        }
        else
        {
          *((void *)v207 + 5) = 0;
        }
        *((_DWORD *)v207 + 21) = [v206 triangleCount];
        uint64_t v228 = [v206 transformationMatrixLayout];
        v207[58] = v228 == 1;
        if (v242) {
          LODWORD(v242) = v236 == *((_DWORD *)v207 + 12);
        }
        if (v240) {
          LODWORD(v240) = v239 == *((unsigned __int16 *)v207 + 28);
        }
        BOOL v229 = v245;
        if (v245) {
          BOOL v229 = v228 != 1;
        }
        LODWORD(v245) = v229;
        *((_DWORD *)v207 + 23) = [v206 opaque];
        *((_DWORD *)v207 + 22) = [v206 intersectionFunctionTableOffset];
        uint64_t v230 = [v206 primitiveDataBuffer];
        if (v230)
        {
          uint64_t v231 = v230;
          uint64_t v232 = objc_msgSend((id)objc_msgSend(v206, "primitiveDataBuffer"), "gpuAddress");
          *((void *)v207 + 13) = [v206 primitiveDataBufferOffset] + v232;
          int v202 = [v206 primitiveDataStride];
          LODWORD(v230) = [v206 primitiveDataElementSize];
          *(void *)&v246[8 * v199] = v231;
          if (v230 < 2)
          {
            int v203 = 1;
          }
          else if (v230 > 0x10)
          {
            int v203 = 32;
          }
          else
          {
            int v203 = 1 << -(char)__clz(v230 - 1);
          }
          ++v199;
        }
        else
        {
          int v202 = 0;
          *((void *)v207 + 13) = 0;
          int v203 = 1;
        }
        *((_DWORD *)v207 + 28) = v202;
        *((_DWORD *)v207 + 29) = v230;
        int v204 = v244;
        *((_DWORD *)v207 + 24) = (v230 + v203 - 1) & -v203;
        *((_DWORD *)v207 + 25) = v204;
        int v200 = *((_DWORD *)v207 + 21) + v204;
        ++v198;
        v201 += v238;
        if (v198 == v249)
        {
          if (v199) {
            [v233 useResources:v246 count:v199 usage:1];
          }
          if (v249 >= 0x21) {
            free(v246);
          }
          char v153 = v245 & 1;
          char v182 = v240 & 1;
          if (v242)
          {
LABEL_199:
            unsigned int v52 = 0;
            v127 = v234;
            *(void *)&v234->_vertexStride = v236;
            if (v182) {
              goto LABEL_152;
            }
          }
          else
          {
LABEL_274:
            unsigned int v52 = 0;
            v127 = v234;
            *(void *)&v234->_vertexStride = 0xFFFFFFFFLL;
            if (v182) {
              goto LABEL_152;
            }
          }
          uint64_t v154 = 0xFFFFFFFFLL;
          goto LABEL_151;
        }
      }
      v216 = v215;
      uint64_t v217 = [v215 gpuAddress];
      *((void *)v207 + 4) = [v206 indexBufferOffset] + v217;
      uint64_t v218 = [v206 indexType];
      if (v237 == 2)
      {
        if (v218) {
          char v219 = 4;
        }
        else {
          char v219 = 2;
        }
        if ([v206 indexBuffer]) {
          goto LABEL_245;
        }
        unint64_t v220 = [v206 maxVertexIndex];
        if (v220 < 0x100)
        {
          char v219 = 1;
LABEL_245:
          *(void *)&v246[8 * v199++] = v216;
          goto LABEL_246;
        }
        if (v220 < 0x10000)
        {
          char v219 = 2;
          goto LABEL_245;
        }
        if (!(v220 >> 24))
        {
          char v219 = 3;
          goto LABEL_245;
        }
        BOOL v221 = HIDWORD(v220) == 0;
        char v222 = 8;
      }
      else
      {
        BOOL v221 = v218 == 1;
        char v222 = 2;
      }
      if (v221) {
        char v219 = 4;
      }
      else {
        char v219 = v222;
      }
      goto LABEL_245;
    case 4u:
      id v233 = a6;
      v234 = self;
      unsigned int v21 = primitiveKeyframeCount;
      v22 = (char *)[(MTLAccelerationStructureDescriptor *)self->_mtlDescriptor geometryDescriptors];
      v242 = v22;
      if (v21 <= 1) {
        int v23 = 1;
      }
      else {
        int v23 = v21;
      }
      unint64_t v24 = geometryCount * (v23 + 1);
      if (geometryCount > 0x20)
      {
        v26 = (char *)malloc_type_malloc(8 * v24, 0x4AE5DD77uLL);
      }
      else
      {
        MEMORY[0x270FA5388](v22);
        v26 = (char *)&v233 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v26, v25);
      }
      v77 = (void *)[v242 objectAtIndexedSubscript:0];
      unint64_t v241 = geometryCount << 7;
      if (v77) {
        uint64_t v244 = [v77 boundingBoxStride];
      }
      else {
        uint64_t v244 = 0;
      }
      uint64_t v132 = 0;
      uint64_t v133 = 0;
      int v134 = 0;
      uint64_t v245 = 8 * v10;
      v135 = &v248[v241];
      LODWORD(v246) = 1;
      MTLAttributeFormat v239 = (MTLAttributeFormat)v26;
      do
      {
        v142 = (void *)[v242 objectAtIndexedSubscript:v132];
        v143 = v142;
        v144 = &v248[128 * v132];
        if (v247 < 2)
        {
          if (v247 == 1)
          {
            v149 = objc_msgSend((id)objc_msgSend(v142, "boundingBoxBuffers"), "objectAtIndexedSubscript:", 0);
            uint64_t v150 = objc_msgSend((id)objc_msgSend(v149, "buffer"), "gpuAddress");
            uint64_t v151 = [v149 offset] + v150;
            v26 = (char *)v239;
            *((void *)v144 + 1) = v151;
            *(void *)&v26[8 * v133++] = [v149 buffer];
          }
        }
        else
        {
          if (v10)
          {
            uint64_t v145 = 0;
            uint64_t v240 = v133;
            v146 = &v26[8 * v133];
            do
            {
              v147 = objc_msgSend((id)objc_msgSend(v143, "boundingBoxBuffers"), "objectAtIndexedSubscript:", v145);
              uint64_t v148 = objc_msgSend((id)objc_msgSend(v147, "buffer"), "gpuAddress");
              *(void *)&v135[8 * v145] = [v147 offset] + v148;
              *(void *)&v146[8 * v145++] = [v147 buffer];
            }
            while (v10 != v145);
            v26 = (char *)v239;
            uint64_t v133 = v240 + v145;
          }
          *((void *)v144 + 1) = v241 + v245 * v132 + v243;
        }
        uint64_t v152 = v133;
        *((_DWORD *)v144 + 13) = [v143 boundingBoxStride];
        *((_DWORD *)v144 + 21) = [v143 boundingBoxCount];
        if (v246) {
          LODWORD(v246) = v244 == *((_DWORD *)v144 + 13);
        }
        *((_DWORD *)v144 + 23) = [v143 opaque];
        *((_DWORD *)v144 + 22) = [v143 intersectionFunctionTableOffset];
        uint64_t v136 = [v143 primitiveDataBuffer];
        if (v136)
        {
          uint64_t v137 = v136;
          uint64_t v138 = objc_msgSend((id)objc_msgSend(v143, "primitiveDataBuffer"), "gpuAddress");
          *((void *)v144 + 13) = [v143 primitiveDataBufferOffset] + v138;
          int v139 = [v143 primitiveDataStride];
          LODWORD(v136) = [v143 primitiveDataElementSize];
          *(void *)&v26[8 * v152] = v137;
          uint64_t v133 = v152 + 1;
          int v140 = 1 << -(char)__clz(v136 - 1);
          if (v136 > 0x10) {
            int v140 = 32;
          }
          if (v136 < 2) {
            int v140 = 1;
          }
        }
        else
        {
          int v139 = 0;
          *((void *)v144 + 13) = 0;
          int v140 = 1;
        }
        *((_DWORD *)v144 + 28) = v139;
        *((_DWORD *)v144 + 29) = v136;
        *((_DWORD *)v144 + 24) = (v136 + v140 - 1) & -v140;
        *((_DWORD *)v144 + 25) = v134;
        v134 += *((_DWORD *)v144 + 21);
        ++v132;
        v135 += v245;
        unint64_t v141 = v249;
      }
      while (v132 != v249);
      if (v133) {
        [v233 useResources:v26 count:v133 usage:1];
      }
      if (v141 >= 0x21) {
        free(v26);
      }
      unsigned int v52 = 0;
      v127 = v234;
      v234->_vertexStride = 0;
      if ((v246 & 1) == 0) {
        goto LABEL_149;
      }
      goto LABEL_150;
    case 5u:
      id v233 = a6;
      v234 = self;
      unsigned int v38 = primitiveKeyframeCount;
      MTLAttributeFormat v39 = [(MTLAccelerationStructureDescriptor *)self->_mtlDescriptor geometryDescriptors];
      MTLAttributeFormat v239 = v39;
      if (v38 <= 1) {
        int v40 = 1;
      }
      else {
        int v40 = v38;
      }
      unint64_t v41 = geometryCount * (2 * v40 + 2);
      if (geometryCount > 0x20)
      {
        v43 = (char *)malloc_type_malloc(8 * v41, 0xDC5405F0uLL);
      }
      else
      {
        MEMORY[0x270FA5388](v39);
        v43 = (char *)&v233 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v43, v42);
      }
      unsigned int v52 = 0;
      uint64_t v84 = 0;
      int v85 = 0;
      uint64_t v240 = 16 * v10;
      unint64_t v241 = v12;
      v86 = &v248[v12];
      uint64_t v87 = 0;
      uint64_t v236 = 8 * v10;
      uint64_t v245 = (uint64_t)v86;
      v88 = &v86[8 * v10];
      v242 = v43;
      break;
    case 6u:
      v44 = self;
      mtlDescriptor = self->_mtlDescriptor;
      if (primitiveKeyframeCount <= 1) {
        LODWORD(primitiveKeyframeCount) = 1;
      }
      unint64_t v50 = geometryCount * (primitiveKeyframeCount + 1);
      if (geometryCount > 0x20)
      {
        v48 = (char *)malloc_type_malloc(8 * v50, 0x4DCB0A7CuLL);
      }
      else
      {
        MEMORY[0x270FA5388](self);
        v48 = (char *)&v233 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v48, v51);
      }
      if (v44->_motion) {
        uint64_t v131 = 56;
      }
      else {
        uint64_t v131 = 24;
      }
      v129 = v248;
      *((void *)v248 + 1) = a5;
      uint64_t v244 = v131;
      *((_DWORD *)v129 + 13) = v131;
      int v130 = [(MTLAccelerationStructureDescriptor *)mtlDescriptor instanceCount];
      goto LABEL_122;
    case 7u:
      v44 = self;
      v45 = self->_mtlDescriptor;
      if (primitiveKeyframeCount <= 1) {
        LODWORD(primitiveKeyframeCount) = 1;
      }
      unint64_t v46 = geometryCount * (primitiveKeyframeCount + 1);
      if (geometryCount > 0x20)
      {
        v48 = (char *)malloc_type_malloc(8 * v46, 0x45282851uLL);
      }
      else
      {
        MEMORY[0x270FA5388](self);
        v48 = (char *)&v233 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v48, v47);
      }
      if (v44->_motion) {
        uint64_t v128 = 56;
      }
      else {
        uint64_t v128 = 24;
      }
      v129 = v248;
      *((void *)v248 + 1) = a5;
      uint64_t v244 = v128;
      *((_DWORD *)v129 + 13) = v128;
      int v130 = [(MTLAccelerationStructureDescriptor *)v45 maxInstanceCount];
LABEL_122:
      *((_DWORD *)v129 + 21) = v130;
      if (geometryCount >= 0x21) {
        free(v48);
      }
      unsigned int v52 = 0;
      v127 = v44;
      v44->_vertexStride = 0;
      goto LABEL_150;
    default:
      return;
  }
  while (1)
  {
    LODWORD(v244) = v85;
    LODWORD(v246) = v52;
    v90 = (void *)[(id)v239 objectAtIndexedSubscript:v87];
    v91 = v90;
    v92 = &v248[128 * v87];
    if (v247 < 2)
    {
      if (v247 == 1)
      {
        v106 = objc_msgSend((id)objc_msgSend(v90, "controlPointBuffers"), "objectAtIndexedSubscript:", 0);
        uint64_t v107 = objc_msgSend((id)objc_msgSend(v106, "buffer"), "gpuAddress");
        *((void *)v92 + 2) = [v106 offset] + v107;
        uint64_t v108 = [v106 buffer];
        v109 = (uint64_t *)&v242[8 * v84];
        uint64_t *v109 = v108;
        v110 = objc_msgSend((id)objc_msgSend(v91, "radiusBuffers"), "objectAtIndexedSubscript:", 0);
        uint64_t v111 = objc_msgSend((id)objc_msgSend(v110, "buffer"), "gpuAddress");
        *((void *)v92 + 3) = [v110 offset] + v111;
        uint64_t v112 = v84 + 2;
        v109[1] = [v110 buffer];
        v43 = v242;
        goto LABEL_92;
      }
    }
    else
    {
      unint64_t v93 = v241 + v240 * v87;
      if (v10)
      {
        unint64_t v237 = v241 + v240 * v87;
        uint64_t v238 = v87;
        uint64_t v94 = 0;
        v95 = &v43[8 * v84];
        uint64_t v96 = v245;
        do
        {
          v97 = objc_msgSend((id)objc_msgSend(v91, "controlPointBuffers"), "objectAtIndexedSubscript:", v94);
          uint64_t v98 = objc_msgSend((id)objc_msgSend(v97, "buffer"), "gpuAddress");
          *(void *)(v96 + 8 * v94) = [v97 offset] + v98;
          *(void *)&v95[8 * v94++] = [v97 buffer];
        }
        while (v10 != v94);
        uint64_t v99 = 0;
        v84 += v94;
        *((void *)v92 + 2) = v237 + v243;
        uint64_t v100 = v10;
        v101 = v242;
        do
        {
          uint64_t v102 = v84;
          v103 = objc_msgSend((id)objc_msgSend(v91, "radiusBuffers"), "objectAtIndexedSubscript:", v99);
          uint64_t v104 = objc_msgSend((id)objc_msgSend(v103, "buffer"), "gpuAddress");
          *(void *)&v88[8 * v99] = [v103 offset] + v104;
          ++v84;
          *(void *)&v101[8 * v102] = [v103 buffer];
          ++v99;
        }
        while (v100 != v99);
        unint64_t v105 = *((void *)v92 + 2);
        v43 = v101;
        uint64_t v10 = v100;
        uint64_t v87 = v238;
      }
      else
      {
        unint64_t v105 = v93 + v243;
        *((void *)v92 + 2) = v93 + v243;
      }
      *((void *)v92 + 3) = v105 + v236;
    }
    uint64_t v112 = v84;
LABEL_92:
    uint64_t v113 = objc_msgSend((id)objc_msgSend(v91, "indexBuffer"), "gpuAddress");
    *((void *)v92 + 4) = [v91 indexBufferOffset] + v113;
    *(void *)&v43[8 * v112] = [v91 indexBuffer];
    *((_DWORD *)v92 + 17) = [v91 controlPointFormat];
    v92[72] = [v91 radiusFormat];
    uint64_t v114 = [v91 controlPointStride];
    if (!v114) {
      LODWORD(v114) = MTLAttributeFormatSize((MTLAttributeFormat)*((unsigned int *)v92 + 17));
    }
    *((_DWORD *)v92 + 15) = v114;
    uint64_t v115 = [v91 radiusStride];
    if (!v115) {
      LODWORD(v115) = MTLAttributeFormatSize((MTLAttributeFormat)v92[72]);
    }
    uint64_t v84 = v112 + 1;
    *((_DWORD *)v92 + 16) = v115;
    *((_DWORD *)v92 + 19) = v246;
    v92[73] = [v91 curveBasis];
    *((_DWORD *)v92 + 20) = [v91 segmentControlPointCount];
    v92[74] = [v91 curveType];
    v92[75] = [v91 curveEndCaps];
    if ([v91 indexType]) {
      char v116 = 4;
    }
    else {
      char v116 = 2;
    }
    v92[59] = v116;
    int v117 = [v91 controlPointCount];
    *((_DWORD *)v92 + 21) = [v91 segmentCount];
    *((_DWORD *)v92 + 23) = [v91 opaque];
    *((_DWORD *)v92 + 22) = [v91 intersectionFunctionTableOffset];
    uint64_t v118 = [v91 primitiveDataBuffer];
    if (v118)
    {
      uint64_t v119 = v118;
      uint64_t v120 = objc_msgSend((id)objc_msgSend(v91, "primitiveDataBuffer"), "gpuAddress");
      *((void *)v92 + 13) = [v91 primitiveDataBufferOffset] + v120;
      int v121 = [v91 primitiveDataStride];
      LODWORD(v118) = [v91 primitiveDataElementSize];
      uint64_t v122 = v112 + 2;
      v123 = v242;
      *(void *)&v242[8 * v84] = v119;
      v43 = v123;
      if (v118 >= 2)
      {
        unint64_t v124 = v249;
        int v125 = (int)v246;
        int v126 = v244;
        if (v118 > 0x10) {
          int v89 = 32;
        }
        else {
          int v89 = 1 << -(char)__clz(v118 - 1);
        }
        uint64_t v84 = v122;
        goto LABEL_79;
      }
      int v89 = 1;
      uint64_t v84 = v112 + 2;
      unint64_t v124 = v249;
      int v125 = (int)v246;
    }
    else
    {
      int v121 = 0;
      *((void *)v92 + 13) = 0;
      int v89 = 1;
      unint64_t v124 = v249;
      int v125 = (int)v246;
      v43 = v242;
    }
    int v126 = v244;
LABEL_79:
    unsigned int v52 = v125 + v117;
    *((_DWORD *)v92 + 28) = v121;
    *((_DWORD *)v92 + 29) = v118;
    *((_DWORD *)v92 + 24) = (v118 + v89 - 1) & -v89;
    *((_DWORD *)v92 + 25) = v126;
    int v85 = *((_DWORD *)v92 + 21) + v126;
    ++v87;
    v245 += v240;
    v88 += v240;
    if (v87 == v124)
    {
      if (v84) {
        [v233 useResources:v43 count:v84 usage:1];
      }
      if (v124 >= 0x21)
      {
        v76 = v43;
LABEL_110:
        free(v76);
      }
LABEL_111:
      uint64_t v244 = 0;
      v127 = v234;
      v234->_vertexStride = 0;
      goto LABEL_150;
    }
  }
}

- (unint64_t)resourceBufferLength
{
  unint64_t geometryCount = self->_geometryCount;
  if (geometryCount && [(BVHDescriptor *)self primitiveMotion])
  {
    unsigned int primitiveType = self->_primitiveType;
    LODWORD(primitiveKeyframeCount) = 1;
    if (primitiveType <= 7)
    {
      if (((1 << primitiveType) & 0xD2) != 0 || ((1 << primitiveType) & 9) != 0) {
        unint64_t primitiveKeyframeCount = self->_primitiveKeyframeCount;
      }
      else {
        unint64_t primitiveKeyframeCount = 2 * self->_primitiveKeyframeCount;
      }
    }
    uint64_t v6 = 8 * primitiveKeyframeCount + 128;
  }
  else
  {
    uint64_t v6 = 128;
  }
  return v6 * geometryCount;
}

- (unint64_t)actualMaxDepth
{
  return self->_maxDepth;
}

- (void)updateMaxDepth
{
  if (!self)
  {
    unint64_t v8 = 0;
    goto LABEL_14;
  }
  if (self->_fragmentCount)
  {
    unint64_t v3 = -[BVHDescriptor maxLeafNodeCount]((unint64_t)self);
    unint64_t maxDepth = self->_maxDepth;
    unint64_t branchingFactor = self->_branchingFactor;
    if (branchingFactor == 2)
    {
      double v6 = (double)maxDepth;
      double v7 = (log((double)v3) / 0.693147181 + 2.0) * 1.35;
    }
    else
    {
      if (self->_buildAlgorithm)
      {
        unint64_t v8 = 16;
        goto LABEL_14;
      }
      double v6 = (double)maxDepth;
      long double v9 = log((double)v3);
      double v7 = (v9 + v9) / log((double)branchingFactor) + 2.0;
    }
    double v10 = ceil(v7);
    if (v10 > v6) {
      double v10 = v6;
    }
    unint64_t v8 = (unint64_t)v10;
    if ((unint64_t)v10 <= 1) {
      LODWORD(v8) = 1;
    }
    unint64_t v8 = v8;
  }
  else
  {
    unint64_t v8 = 1;
  }
LABEL_14:
  self->_clampedMaxDepth = v8;
}

- (unint64_t)maxLeafNodeCount
{
  if (result)
  {
    unint64_t v1 = *(void *)(result + 24);
    uint64_t v2 = *(void *)(result + 40);
    unint64_t v3 = v1;
    if (v2)
    {
      unint64_t v3 = *(void *)(result + 24);
      if (!*(_DWORD *)(result + 136))
      {
        unint64_t v3 = *(void *)(result + 24);
        if (*(_DWORD *)(result + 148) == 3)
        {
          double v4 = *(float *)(result + 152) + -1.0;
          if (v4 < 0.0) {
            double v4 = 0.0;
          }
          unint64_t v3 = v1 + vcvtpd_u64_f64(v4 * (double)v1);
        }
      }
    }
    if (*(unsigned char *)(result + 83))
    {
      unint64_t v5 = *(void *)(result + 200);
      if (v5 >= 2) {
        v3 *= v5 - 1;
      }
    }
    unint64_t v6 = *(void *)(result + 168);
    if (v6 <= -(uint64_t)v3)
    {
      if (v2 && !*(_DWORD *)(result + 136) && *(_DWORD *)(result + 148) == 3)
      {
        double v7 = *(float *)(result + 152) + -1.0;
        if (v7 < 0.0) {
          double v7 = 0.0;
        }
        v1 += vcvtpd_u64_f64(v7 * (double)v1);
      }
      if (*(unsigned char *)(result + 83))
      {
        unint64_t v8 = *(void *)(result + 200);
        if (v8 >= 2) {
          v1 *= v8 - 1;
        }
      }
      return (v6 + v1 - 1) / v6;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (BOOL)canDoPairing
{
  return !self->_primitiveType && self->_allGeometriesHaveIndexBuffers;
}

- (BOOL)primitiveMotion
{
  return self->_primitiveKeyframeCount >= 2 && self->_primitiveType - 3 < 3;
}

- (void)updatePipelineKey
{
  BOOL v3 = [(BVHDescriptor *)self useParallelWideBuild];
  if (self)
  {
    double v4 = &unk_268D5A000;
    {
      double v4 = &unk_268D5A000;
      if (v31)
      {
        -[BVHDescriptor isDeterministic]::forceDeterministic = 0;
        double v4 = (unsigned char *)&unk_268D5A000;
      }
    }
    if (v4[1480]) {
      LODWORD(v5) = 1;
    }
    else {
      unint64_t v5 = ([(MTLAccelerationStructureDescriptor *)self->_mtlDescriptor usage] >> 3) & 1;
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  unint64_t primitiveKeyframeCount = self->_primitiveKeyframeCount;
  uint64_t v7 = primitiveKeyframeCount > 1;
  uint64_t v8 = v7 << 41;
  if (!self->_useTemporalSplits) {
    uint64_t v8 = 0;
  }
  BOOL v9 = v5 == 0;
  uint64_t v10 = 0x80000000000;
  if (!v9) {
    uint64_t v10 = 0;
  }
  uint64_t v11 = 0x10008000000;
  if (!v9) {
    uint64_t v11 = 0x110008000000;
  }
  v12.i64[0] = self->_maxPrimitivesPerInnerNode;
  v12.i64[1] = self->_branchingFactor;
  int8x16_t v13 = vandq_s8((int8x16_t)vshlq_u64(*(uint64x2_t *)&self->_minPrimitivesPerLeaf, (uint64x2_t)xmmword_242EA7900), (int8x16_t)xmmword_242EA84C0);
  int8x16_t v14 = vandq_s8((int8x16_t)vshlq_u64(v12, (uint64x2_t)xmmword_242EA84B0), (int8x16_t)xmmword_242EA84D0);
  if (!v3 || self->_branchingFactor <= 2) {
    uint64_t v10 = 0;
  }
  int8x16_t v15 = vorrq_s8(v13, v14);
  unint64_t v16 = *(void *)&vorr_s8(*(int8x8_t *)v15.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v15, v15, 8uLL)) | v11 | v10 | (v7 << 24) | ((unint64_t)self->_motion << 25) | ((unint64_t)self->_disallowMixingTemporalSplitsAndLeafNodes << 42) | v8;
  if (self->_useTemporalSplits) {
    unint64_t v16 = v16 & 0x87FFFFFFFFFFFFFFLL | ((self->_maxSubKeyframeTemporalSplits & 0xF) << 59);
  }
  unint64_t geometryCount = self->_geometryCount;
  unint64_t fragmentCount = self->_fragmentCount;
  if (fragmentCount >= 0x100)
  {
    if (fragmentCount >= 0x10000)
    {
      if (fragmentCount >> 24)
      {
        uint64_t v19 = 0x4000000000000;
        if (!HIDWORD(fragmentCount)) {
          uint64_t v19 = 0x2000000000000;
        }
        if (geometryCount < 0x100)
        {
LABEL_18:
          unsigned int childIndexStride = self->_childIndexStride;
          uint64_t v21 = 0x8000000000000;
          if (!geometryCount || self->_primitiveType) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
      }
      else
      {
        uint64_t v19 = 0x1800000000000;
        if (geometryCount < 0x100) {
          goto LABEL_18;
        }
      }
    }
    else
    {
      uint64_t v19 = 0x1000000000000;
      if (geometryCount < 0x100) {
        goto LABEL_18;
      }
    }
  }
  else
  {
    uint64_t v19 = 0x800000000000;
    if (geometryCount < 0x100) {
      goto LABEL_18;
    }
  }
  if (geometryCount >= 0x10000)
  {
    if (geometryCount >> 24)
    {
      uint64_t v21 = 0x40000000000000;
      if (!HIDWORD(geometryCount)) {
        uint64_t v21 = 0x20000000000000;
      }
    }
    else
    {
      uint64_t v21 = 0x18000000000000;
    }
  }
  else
  {
    uint64_t v21 = 0x10000000000000;
  }
  unsigned int childIndexStride = self->_childIndexStride;
  if (!self->_primitiveType)
  {
LABEL_37:
    if (self->_splitHeuristic == 3)
    {
      double v22 = self->_splitCapacity + -1.0;
      if (v22 < 0.0) {
        double v22 = 0.0;
      }
      fragmentCount += vcvtpd_u64_f64(v22 * (double)fragmentCount);
    }
  }
LABEL_41:
  if (self->_useTemporalSplits)
  {
    uint64_t v23 = primitiveKeyframeCount - 1;
    if (primitiveKeyframeCount <= 1) {
      uint64_t v23 = 1;
    }
    fragmentCount *= v23;
    if (primitiveKeyframeCount >= 2) {
      fragmentCount *= 1 << LODWORD(self->_maxSubKeyframeTemporalSplits);
    }
  }
  uint64_t v24 = *(void *)&self->_vertexStride;
  int vertexFormat = self->_vertexFormat;
  unsigned int polygonType = self->_polygonType;
  BOOL allGeometryColumnMajor = self->_allGeometryColumnMajor;
  v28 = &unk_268D5A000;
  {
    unint64_t v36 = fragmentCount;
    uint64_t v37 = v19;
    unint64_t v33 = geometryCount;
    uint64_t v34 = v21;
    char v38 = childIndexStride;
    uint64_t v35 = v24;
    int v39 = vertexFormat;
    char v40 = polygonType;
    BOOL v41 = allGeometryColumnMajor;
    LOBYTE(polygonType) = v40;
    BOOL allGeometryColumnMajor = v41;
    v28 = &unk_268D5A000;
    LOBYTE(childIndexStride) = v38;
    int vertexFormat = v39;
    uint64_t v24 = v35;
    unint64_t geometryCount = v33;
    uint64_t v21 = v34;
    unint64_t fragmentCount = v36;
    uint64_t v19 = v37;
    if (v32)
    {
      getBatchThreshold(void)::batchThreshold = 1;
      LOBYTE(polygonType) = v40;
      BOOL allGeometryColumnMajor = v41;
      v28 = (unsigned char *)&unk_268D5A000;
      LOBYTE(childIndexStride) = v38;
      int vertexFormat = v39;
      uint64_t v24 = v35;
      unint64_t geometryCount = v33;
      uint64_t v21 = v34;
      unint64_t fragmentCount = v36;
      uint64_t v19 = v37;
    }
  }
  char v29 = (16 * (geometryCount < 2)) & 0x98 | (32 * (polygonType & 3)) | (8 * allGeometryColumnMajor) | childIndexStride & 7;
  unint64_t v30 = 0x2000;
  if (!v28[1880]) {
    unint64_t v30 = 0;
  }
  *(void *)&self->_pipelineKey.var0 = v16 & 0xF8003FFFFBFFFFFFLL | v19 | v21 | ((unint64_t)(fragmentCount > v30) << 26) | 0x200000000000000;
  *((unsigned char *)&self->_pipelineKey.var0 + 8) = v29;
  *(_WORD *)((char *)&self->_pipelineKey.var0 + 9) = 0;
  *((unsigned char *)&self->_pipelineKey.var0 + 11) = 0;
  *(void *)&self->_pipelineKey.vertexStride = v24;
  self->_pipelineKey.int vertexFormat = vertexFormat;
  self->_pipelineKeyValid = 1;
}

- (PipelineKey)cachedPipelineKey
{
  *retstr = *(PipelineKey *)((char *)self + 56);
  return self;
}

- (BOOL)useSpatialSplits
{
  {
    -[BVHDescriptor useSpatialSplits]::disableSpatialSplits = 0;
  }
  {
    -[BVHDescriptor useSpatialSplits]::enableFastBuildSpatialSplits = 0;
  }
  unint64_t v3 = [(BVHDescriptor *)self buildAlgorithm];
  BOOL result = 0;
  if (!v3 && !-[BVHDescriptor useSpatialSplits]::disableSpatialSplits) {
    return (!self || !self->_motion)
  }
        && self->_multipleIntersectionsAllowed
        && ([(MTLAccelerationStructureDescriptor *)self->_mtlDescriptor usage] & 1) == 0
        && (([(MTLAccelerationStructureDescriptor *)self->_mtlDescriptor usage] & 2) == 0
         || -[BVHDescriptor useSpatialSplits]::enableFastBuildSpatialSplits)
        && self->_geometryCount
        && !self->_primitiveType
        && self->_splitHeuristic == 3;
  return result;
}

- (BOOL)useParallelWideBuild
{
  {
    -[BVHDescriptor useParallelWideBuild]::forceEnableParallelWideBuild = 0;
  }
  if (self->_motion
    && ([(MTLAccelerationStructureDescriptor *)self->_mtlDescriptor usage] & 2) == 0
    && !-[BVHDescriptor useParallelWideBuild]::forceEnableParallelWideBuild
    || self->_branchingFactor < 3)
  {
    return 0;
  }
  unint64_t v3 = &unk_268D5A000;
  {
    unint64_t v3 = &unk_268D5A000;
    if (v5)
    {
      -[BVHDescriptor isDeterministic]::forceDeterministic = 0;
      unint64_t v3 = (unsigned char *)&unk_268D5A000;
    }
  }
  return !v3[1480] && ([(MTLAccelerationStructureDescriptor *)self->_mtlDescriptor usage] & 8) == 0;
}

- (BVHDescriptor)initWithDescriptor:(id)a3
{
  uint64_t v124 = *MEMORY[0x263EF8340];
  v117.receiver = self;
  v117.super_class = (Class)BVHDescriptor;
  unint64_t v3 = [(BVHDescriptor *)&v117 init];
  if (!v3) {
    return (BVHDescriptor *)v3;
  }
  {
    -[BVHDescriptor initWithDescriptor:]::defaultMinOverlap = 925353388;
  }
  *((void *)v3 + 27) = 0;
  double v4 = v3 + 216;
  *((void *)v3 + 23) = 0;
  *((void *)v3 + 24) = 0;
  *((void *)v3 + 22) = 32;
  *(void *)(v3 + 148) = 0x4000000000000003;
  *((_DWORD *)v3 + 39) = -[BVHDescriptor initWithDescriptor:]::defaultMinOverlap;
  *(_OWORD *)(v3 + 92) = xmmword_242EA84E0;
  *(void *)(v3 + 108) = 0x3FA000003F800000;
  v3[84] = 1;
  *((void *)v3 + 3) = 0;
  *((void *)v3 + 4) = 0;
  *((void *)v3 + 17) = 0;
  *((_WORD *)v3 + 44) = 257;
  *((void *)v3 + 28) = 0;
  *((void *)v3 + 29) = 0;
  *((_DWORD *)v3 + 20) = 256;
  *(_OWORD *)(v3 + 120) = xmmword_242EA84F0;
  *((void *)v3 + 5) = 0;
  *(int64x2_t *)(v3 + 200) = vdupq_n_s64(1uLL);
  *((_OWORD *)v3 + 10) = xmmword_242EA8500;
  *(int64x2_t *)(v3 + 8) = vdupq_n_s64(0x20uLL);
  int v5 = objc_opt_class();
  if ([v5 isSubclassOfClass:objc_opt_class()])
  {
    *((void *)v3 + 25) = [a3 motionKeyframeCount];
    [a3 motionStartTime];
    *((_DWORD *)v3 + 26) = v6;
    [a3 motionEndTime];
    *((_DWORD *)v3 + 27) = v7;
    v3[82] = *((void *)v3 + 25) > 1uLL;
    uint64_t v8 = (void *)[a3 geometryDescriptors];
    uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "geometryDescriptors"), "count");
    *((void *)v3 + 5) = v9;
    if (!v9) {
      return (BVHDescriptor *)v3;
    }
    [v8 objectAtIndexedSubscript:0];
    uint64_t v10 = objc_opt_class();
    if ([v10 isSubclassOfClass:objc_opt_class()])
    {
      *((void *)v3 + 17) = 0;
      long long v113 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      obuint64_t j = (id)[a3 geometryDescriptors];
      uint64_t v11 = [obj countByEnumeratingWithState:&v113 objects:v123 count:16];
      if (v11)
      {
        uint64_t v12 = 0;
        uint64_t v13 = *(void *)v114;
        uint64_t v92 = 0;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v114 != v13) {
              objc_enumerationMutation(obj);
            }
            int8x16_t v15 = *(void **)(*((void *)&v113 + 1) + 8 * i);
            if (*((void *)v3 + 25) != 1)
            {
              uint64_t v87 = *((void *)v3 + 25);
              MTLReportFailure();
            }
            if (objc_msgSend(v15, "indexBuffer", v87)) {
              BOOL v16 = v3[88] == 0;
            }
            else {
              BOOL v16 = 1;
            }
            char v17 = !v16;
            v3[88] = v17;
            unsigned int v18 = [v15 triangleCount];
            unsigned int v19 = v18;
            uint64_t v20 = v18;
            unint64_t v21 = *((void *)v3 + 28);
            if (v18 > v21) {
              unint64_t v21 = v18;
            }
            *((void *)v3 + 28) = v21;
            if ([v15 primitiveDataElementSize]) {
              v92 += ([v15 primitiveDataElementSize] * v20 + 255) & 0xFFFFFFFFFFFFFF00;
            }
            if (v3[81] && ([v15 allowDuplicateIntersectionFunctionInvocation] & 1) == 0) {
              v3[81] = 0;
            }
            [v15 triangleCount];
            if ([v15 indexType]) {
              int v22 = 4;
            }
            else {
              int v22 = 2;
            }
            if (![v15 indexBuffer])
            {
              unint64_t v23 = [v15 maxVertexIndex];
              int v24 = 4;
              if (HIDWORD(v23)) {
                int v24 = 8;
              }
              int v25 = 3;
              if (v23 >> 24) {
                int v25 = v24;
              }
              if (v23 < 0x10000) {
                int v25 = 2;
              }
              if (v23 >= 0x100) {
                int v22 = v25;
              }
              else {
                int v22 = 1;
              }
            }
            v12 += v20;
            *v4 += (4 * v19 * v22 + 31) & 0x1FFFFFFE0;
          }
          uint64_t v11 = [obj countByEnumeratingWithState:&v113 objects:v123 count:16];
        }
        while (v11);
        goto LABEL_173;
      }
    }
    else
    {
      unint64_t v30 = objc_opt_class();
      if ([v30 isSubclassOfClass:objc_opt_class()])
      {
        *((_DWORD *)v3 + 34) = 2;
        long long v109 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        int v31 = (void *)[a3 geometryDescriptors];
        uint64_t v32 = [v31 countByEnumeratingWithState:&v109 objects:v122 count:16];
        if (v32)
        {
          uint64_t v92 = 0;
          uint64_t v12 = 0;
          uint64_t v33 = *(void *)v110;
          do
          {
            for (uint64_t j = 0; j != v32; ++j)
            {
              if (*(void *)v110 != v33) {
                objc_enumerationMutation(v31);
              }
              uint64_t v35 = *(void **)(*((void *)&v109 + 1) + 8 * j);
              if (*((void *)v3 + 25) != 1)
              {
                uint64_t v87 = *((void *)v3 + 25);
                MTLReportFailure();
              }
              if (objc_msgSend(v35, "indexBuffer", v87)) {
                BOOL v36 = v3[88] == 0;
              }
              else {
                BOOL v36 = 1;
              }
              char v37 = !v36;
              v3[88] = v37;
              unsigned int v38 = [v35 segmentCount];
              uint64_t v39 = v38;
              unint64_t v40 = *((void *)v3 + 28);
              if (v38 > v40) {
                unint64_t v40 = v38;
              }
              *((void *)v3 + 28) = v40;
              if ([v35 primitiveDataElementSize]) {
                v92 += ([v35 primitiveDataElementSize] * v39 + 255) & 0xFFFFFFFFFFFFFF00;
              }
              if (v3[81] && ([v35 allowDuplicateIntersectionFunctionInvocation] & 1) == 0) {
                v3[81] = 0;
              }
              v12 += v39;
            }
            uint64_t v32 = [v31 countByEnumeratingWithState:&v109 objects:v122 count:16];
          }
          while (v32);
          goto LABEL_173;
        }
      }
      else
      {
        BOOL v41 = objc_opt_class();
        if ([v41 isSubclassOfClass:objc_opt_class()])
        {
          *((_DWORD *)v3 + 34) = 5;
          *(int64x2_t *)(v3 + 168) = vdupq_n_s64(1uLL);
          long long v105 = 0u;
          long long v106 = 0u;
          long long v107 = 0u;
          long long v108 = 0u;
          size_t v42 = (void *)[a3 geometryDescriptors];
          uint64_t v43 = [v42 countByEnumeratingWithState:&v105 objects:v121 count:16];
          if (v43)
          {
            uint64_t v92 = 0;
            uint64_t v12 = 0;
            uint64_t v44 = *(void *)v106;
            do
            {
              for (uint64_t k = 0; k != v43; ++k)
              {
                if (*(void *)v106 != v44) {
                  objc_enumerationMutation(v42);
                }
                unint64_t v46 = *(void **)(*((void *)&v105 + 1) + 8 * k);
                uint64_t v47 = *((void *)v3 + 25);
                if (v47 != objc_msgSend((id)objc_msgSend(v46, "controlPointBuffers"), "count"))
                {
                  uint64_t v87 = *((void *)v3 + 25);
                  uint64_t v88 = objc_msgSend((id)objc_msgSend(v46, "controlPointBuffers"), "count");
                  MTLReportFailure();
                }
                if (objc_msgSend(v46, "indexBuffer", v87, v88)) {
                  BOOL v48 = v3[88] == 0;
                }
                else {
                  BOOL v48 = 1;
                }
                char v49 = !v48;
                v3[88] = v49;
                unsigned int v50 = [v46 segmentCount];
                uint64_t v51 = v50;
                unint64_t v52 = *((void *)v3 + 28);
                if (v50 > v52) {
                  unint64_t v52 = v50;
                }
                *((void *)v3 + 28) = v52;
                if ([v46 primitiveDataElementSize]) {
                  v92 += ([v46 primitiveDataElementSize] * v51 + 255) & 0xFFFFFFFFFFFFFF00;
                }
                if (v3[81] && ([v46 allowDuplicateIntersectionFunctionInvocation] & 1) == 0) {
                  v3[81] = 0;
                }
                v12 += v51;
              }
              uint64_t v43 = [v42 countByEnumeratingWithState:&v105 objects:v121 count:16];
            }
            while (v43);
            goto LABEL_173;
          }
        }
        else
        {
          uint64_t v53 = objc_opt_class();
          if ([v53 isSubclassOfClass:objc_opt_class()])
          {
            *((_DWORD *)v3 + 34) = 3;
            long long v101 = 0u;
            long long v102 = 0u;
            long long v103 = 0u;
            long long v104 = 0u;
            id obja = (id)[a3 geometryDescriptors];
            uint64_t v54 = [obja countByEnumeratingWithState:&v101 objects:v120 count:16];
            if (v54)
            {
              uint64_t v12 = 0;
              uint64_t v55 = *(void *)v102;
              uint64_t v92 = 0;
              do
              {
                for (uint64_t m = 0; m != v54; ++m)
                {
                  if (*(void *)v102 != v55) {
                    objc_enumerationMutation(obja);
                  }
                  uint64_t v60 = *(void **)(*((void *)&v101 + 1) + 8 * m);
                  uint64_t v61 = *((void *)v3 + 25);
                  if (v61 != objc_msgSend((id)objc_msgSend(v60, "vertexBuffers"), "count"))
                  {
                    uint64_t v87 = *((void *)v3 + 25);
                    uint64_t v88 = objc_msgSend((id)objc_msgSend(v60, "vertexBuffers"), "count");
                    MTLReportFailure();
                  }
                  if (objc_msgSend(v60, "indexBuffer", v87, v88)) {
                    BOOL v62 = v3[88] == 0;
                  }
                  else {
                    BOOL v62 = 1;
                  }
                  char v63 = !v62;
                  v3[88] = v63;
                  unsigned int v64 = [v60 triangleCount];
                  unsigned int v65 = v64;
                  uint64_t v66 = v64;
                  unint64_t v67 = *((void *)v3 + 28);
                  if (v64 > v67) {
                    unint64_t v67 = v64;
                  }
                  *((void *)v3 + 28) = v67;
                  if ([v60 primitiveDataElementSize]) {
                    v92 += ([v60 primitiveDataElementSize] * v66 + 255) & 0xFFFFFFFFFFFFFF00;
                  }
                  if (v3[81] && ([v60 allowDuplicateIntersectionFunctionInvocation] & 1) == 0) {
                    v3[81] = 0;
                  }
                  [v60 triangleCount];
                  if ([v60 indexType]) {
                    int v59 = 4;
                  }
                  else {
                    int v59 = 2;
                  }
                  if (![v60 indexBuffer])
                  {
                    unint64_t v68 = [v60 maxVertexIndex];
                    int v57 = 4;
                    if (HIDWORD(v68)) {
                      int v57 = 8;
                    }
                    int v58 = 3;
                    if (v68 >> 24) {
                      int v58 = v57;
                    }
                    if (v68 < 0x10000) {
                      int v58 = 2;
                    }
                    if (v68 >= 0x100) {
                      int v59 = v58;
                    }
                    else {
                      int v59 = 1;
                    }
                  }
                  v12 += v66;
                  *v4 += (4 * v65 * v59 + 31) & 0x1FFFFFFE0;
                }
                uint64_t v54 = [obja countByEnumeratingWithState:&v101 objects:v120 count:16];
              }
              while (v54);
              goto LABEL_173;
            }
          }
          else
          {
            int v69 = objc_opt_class();
            if ([v69 isSubclassOfClass:objc_opt_class()])
            {
              *((_DWORD *)v3 + 34) = 4;
              *(int64x2_t *)(v3 + 168) = vdupq_n_s64(1uLL);
              v3[88] = 0;
              long long v97 = 0u;
              long long v98 = 0u;
              long long v99 = 0u;
              long long v100 = 0u;
              uint64_t v70 = (void *)[a3 geometryDescriptors];
              uint64_t v71 = [v70 countByEnumeratingWithState:&v97 objects:v119 count:16];
              if (v71)
              {
                uint64_t v92 = 0;
                uint64_t v12 = 0;
                uint64_t v72 = *(void *)v98;
                do
                {
                  for (uint64_t n = 0; n != v71; ++n)
                  {
                    if (*(void *)v98 != v72) {
                      objc_enumerationMutation(v70);
                    }
                    unint64_t v74 = *(void **)(*((void *)&v97 + 1) + 8 * n);
                    unsigned int v75 = [v74 boundingBoxCount];
                    uint64_t v76 = v75;
                    unint64_t v77 = *((void *)v3 + 28);
                    if (v75 > v77) {
                      unint64_t v77 = v75;
                    }
                    *((void *)v3 + 28) = v77;
                    if ([v74 primitiveDataElementSize]) {
                      v92 += ([v74 primitiveDataElementSize] * v76 + 255) & 0xFFFFFFFFFFFFFF00;
                    }
                    if (v3[81] && ([v74 allowDuplicateIntersectionFunctionInvocation] & 1) == 0) {
                      v3[81] = 0;
                    }
                    v12 += v76;
                  }
                  uint64_t v71 = [v70 countByEnumeratingWithState:&v97 objects:v119 count:16];
                }
                while (v71);
                goto LABEL_173;
              }
            }
            else
            {
              *((_DWORD *)v3 + 34) = 1;
              *(int64x2_t *)(v3 + 168) = vdupq_n_s64(1uLL);
              v3[88] = 0;
              long long v93 = 0u;
              long long v94 = 0u;
              long long v95 = 0u;
              long long v96 = 0u;
              v78 = (void *)[a3 geometryDescriptors];
              uint64_t v79 = [v78 countByEnumeratingWithState:&v93 objects:v118 count:16];
              if (v79)
              {
                uint64_t v92 = 0;
                uint64_t v12 = 0;
                uint64_t v80 = *(void *)v94;
                do
                {
                  for (iuint64_t i = 0; ii != v79; ++ii)
                  {
                    if (*(void *)v94 != v80) {
                      objc_enumerationMutation(v78);
                    }
                    v82 = *(void **)(*((void *)&v93 + 1) + 8 * ii);
                    if (*((void *)v3 + 25) != 1)
                    {
                      uint64_t v87 = *((void *)v3 + 25);
                      MTLReportFailure();
                    }
                    unsigned int v83 = objc_msgSend(v82, "boundingBoxCount", v87);
                    uint64_t v84 = v83;
                    unint64_t v85 = *((void *)v3 + 28);
                    if (v83 > v85) {
                      unint64_t v85 = v83;
                    }
                    *((void *)v3 + 28) = v85;
                    if ([v82 primitiveDataElementSize]) {
                      v92 += ([v82 primitiveDataElementSize] * v84 + 255) & 0xFFFFFFFFFFFFFF00;
                    }
                    if (v3[81] && ([v82 allowDuplicateIntersectionFunctionInvocation] & 1) == 0) {
                      v3[81] = 0;
                    }
                    v12 += v84;
                  }
                  uint64_t v79 = [v78 countByEnumeratingWithState:&v93 objects:v118 count:16];
                }
                while (v79);
                goto LABEL_173;
              }
            }
          }
        }
      }
    }
    goto LABEL_172;
  }
  v26 = objc_opt_class();
  if ([v26 isSubclassOfClass:objc_opt_class()])
  {
    *((_DWORD *)v3 + 34) = 6;
    *(int64x2_t *)(v3 + 168) = vdupq_n_s64(1uLL);
    v3[88] = 0;
    *((void *)v3 + 5) = 1;
    if ([a3 instanceDescriptorType] == 2 || objc_msgSend(a3, "instanceDescriptorType") == 4) {
      v3[82] = 1;
    }
    unsigned int v27 = [a3 instanceCount];
  }
  else
  {
    v28 = objc_opt_class();
    if (![v28 isSubclassOfClass:objc_opt_class()])
    {
LABEL_172:
      uint64_t v92 = 0;
      uint64_t v12 = 0;
      goto LABEL_173;
    }
    *((_DWORD *)v3 + 34) = 7;
    *(int64x2_t *)(v3 + 168) = vdupq_n_s64(1uLL);
    v3[88] = 0;
    *((void *)v3 + 5) = 1;
    v3[82] = [a3 instanceDescriptorType] == 4;
    unsigned int v27 = [a3 maxInstanceCount];
  }
  uint64_t v92 = 0;
  uint64_t v12 = v27;
  *((void *)v3 + 28) = v27;
  if (v3[82]) {
    int v29 = 56;
  }
  else {
    int v29 = 24;
  }
  *((_DWORD *)v3 + 31) = -1;
  *((_DWORD *)v3 + 32) = v29;
LABEL_173:
  *((void *)v3 + 6) = a3;
  if (!v3[81]
    || v3[82]
    || *((_DWORD *)v3 + 34)
    || (*(void *)(v3 + 148) = 0x4000000000000003, ([v3 useSpatialSplits] & 1) == 0))
  {
    *(void *)(v3 + 148) = 0x3F80000000000002;
  }
  *((void *)v3 + 3) = v12;
  [v3 updateMaxDepth];
  *((void *)v3 + 4) = v92;
  return (BVHDescriptor *)v3;
}

- (unint64_t)maxInnerNodeCount
{
  if (result)
  {
    unint64_t v1 = *(void *)(result + 24);
    unint64_t v2 = v1;
    if (*(void *)(result + 40))
    {
      unint64_t v2 = *(void *)(result + 24);
      if (!*(_DWORD *)(result + 136))
      {
        unint64_t v2 = *(void *)(result + 24);
        if (*(_DWORD *)(result + 148) == 3)
        {
          double v3 = *(float *)(result + 152) + -1.0;
          if (v3 < 0.0) {
            double v3 = 0.0;
          }
          unint64_t v2 = v1 + vcvtpd_u64_f64(v3 * (double)v1);
        }
      }
    }
    if (*(unsigned char *)(result + 83))
    {
      unint64_t v4 = *(void *)(result + 200);
      uint64_t v5 = v4 - 1;
      if (v4 <= 1) {
        uint64_t v5 = 1;
      }
      v2 *= v5;
      if (v4 >= 2) {
        v2 *= 1 << *(_DWORD *)(result + 208);
      }
    }
    uint64_t v6 = *(void *)(result + 240);
    if (v6 == 2)
    {
      unsigned int v9 = *(_DWORD *)(result + 116);
      unsigned int v10 = v9 + v1 - 1;
      int v11 = *(_DWORD *)(result + 184);
      int v12 = v10 / v9;
      if (v9 <= v10)
      {
        unsigned int v13 = 7 * v11;
        unsigned int v14 = (v13 + 8 * v12 - 1) / v13;
      }
      else
      {
        unsigned int v13 = 7 * v11;
        unsigned int v14 = 1;
      }
      unsigned int v15 = ((v1 + 2047) >> 11) * ((v13 + 0x3FFF) / v13);
      if ((v13 + 8 * v9 - 1) / v13 * v12 > v15) {
        unsigned int v15 = (v13 + 8 * v9 - 1) / v13 * v12;
      }
      unint64_t v8 = v14 + v12 + v15;
    }
    else if (v6 == 1)
    {
      if (v1) {
        unint64_t v8 = (7 * *(_DWORD *)(result + 184) + 8 * (int)v1 - 1) / (7 * *(_DWORD *)(result + 184));
      }
      else {
        unint64_t v8 = 1;
      }
    }
    else if (v6 || !v2)
    {
      unint64_t v8 = 0;
    }
    else if (*(void *)(result + 192))
    {
      unint64_t v7 = (v2 + *(void *)(result + 184) - 1) / *(void *)(result + 184);
      unint64_t v8 = (*(void *)(result + 160) * (v7 + 2) - 5) / (2 * *(void *)(result + 160) - 2) + v7;
    }
    else
    {
      uint64_t v16 = *(void *)(result + 160);
      unint64_t v8 = ((-[BVHDescriptor maxLeafNodeCount](result) + 2) * v16 - 5) / (2 * v16 - 2);
    }
    if (v8 <= 1) {
      return 1;
    }
    else {
      return v8;
    }
  }
  return result;
}

@end