@interface MDLMesh(SCNModelIO)
+ (id)meshWithSCNGeometry:()SCNModelIO bufferAllocator:;
+ (uint64_t)meshWithSCNGeometry:()SCNModelIO;
@end

@implementation MDLMesh(SCNModelIO)

+ (uint64_t)meshWithSCNGeometry:()SCNModelIO
{
  return [a1 meshWithSCNGeometry:a3 bufferAllocator:0];
}

+ (id)meshWithSCNGeometry:()SCNModelIO bufferAllocator:
{
  uint64_t v169 = *MEMORY[0x263EF8340];
  if (([a3 isMemberOfClass:objc_opt_class()] & 1) == 0) {
    +[SCNTransaction flush];
  }
  v108 = a3;
  {
    +[MDLMesh(SCNModelIO) meshWithSCNGeometry:bufferAllocator:]::defaultAllocator = objc_opt_new();
  }
  uint64_t v5 = +[MDLMesh(SCNModelIO) meshWithSCNGeometry:bufferAllocator:]::defaultAllocator;
  if (a4) {
    uint64_t v5 = a4;
  }
  v130 = (void *)v5;
  v163 = 0;
  __p = 0;
  v164 = 0;
  v160 = 0;
  v159 = 0;
  v161 = 0;
  v157 = 0;
  v156 = 0;
  v158 = 0;
  v153 = 0;
  v154 = 0;
  v155 = 0;
  unint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "geometrySourceChannels"), "count");
  if (v6)
  {
    unint64_t v7 = 0;
    int v129 = 0;
    while (v7 < objc_msgSend((id)objc_msgSend(v108, "geometrySources"), "count") && v7 < v6)
    {
      v8 = objc_msgSend((id)objc_msgSend(v108, "geometrySources"), "objectAtIndexedSubscript:", v7);
      int v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v108, "geometrySourceChannels"), "objectAtIndexedSubscript:", v7), "unsignedIntegerValue");
      if (objc_msgSend((id)objc_msgSend(v8, "semantic"), "isEqualToString:", @"kGeometrySourceSemanticVertex"))
      {
        v10 = v163;
        if (v163 >= v164)
        {
          v14 = (char *)__p;
          uint64_t v15 = (v163 - (unsigned char *)__p) >> 2;
          unint64_t v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 62) {
            goto LABEL_197;
          }
          uint64_t v17 = v164 - (unsigned char *)__p;
          if ((v164 - (unsigned char *)__p) >> 1 > v16) {
            unint64_t v16 = v17 >> 1;
          }
          if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v18 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v18 = v16;
          }
          if (v18)
          {
            v19 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)&v164, v18);
            v10 = v163;
            v14 = (char *)__p;
          }
          else
          {
            v19 = 0;
          }
          v30 = &v19[4 * v15];
          *(_DWORD *)v30 = v9;
          v11 = v30 + 4;
          while (v10 != v14)
          {
            int v31 = *((_DWORD *)v10 - 1);
            v10 -= 4;
            *((_DWORD *)v30 - 1) = v31;
            v30 -= 4;
          }
          __p = v30;
          v163 = v11;
          v164 = &v19[4 * v18];
          if (v14) {
            operator delete(v14);
          }
        }
        else
        {
          *(_DWORD *)v163 = v9;
          v11 = v10 + 4;
        }
        v163 = v11;
      }
      else if (objc_msgSend((id)objc_msgSend(v8, "semantic"), "isEqualToString:", @"kGeometrySourceSemanticNormal"))
      {
        v12 = v160;
        if (v160 >= v161)
        {
          v22 = (char *)v159;
          uint64_t v23 = (v160 - (unsigned char *)v159) >> 2;
          unint64_t v24 = v23 + 1;
          if ((unint64_t)(v23 + 1) >> 62) {
            goto LABEL_197;
          }
          uint64_t v25 = v161 - (unsigned char *)v159;
          if ((v161 - (unsigned char *)v159) >> 1 > v24) {
            unint64_t v24 = v25 >> 1;
          }
          if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v26 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v26 = v24;
          }
          if (v26)
          {
            v27 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)&v161, v26);
            v12 = v160;
            v22 = (char *)v159;
          }
          else
          {
            v27 = 0;
          }
          v38 = &v27[4 * v23];
          *(_DWORD *)v38 = v9;
          v13 = v38 + 4;
          while (v12 != v22)
          {
            int v39 = *((_DWORD *)v12 - 1);
            v12 -= 4;
            *((_DWORD *)v38 - 1) = v39;
            v38 -= 4;
          }
          v159 = v38;
          v160 = v13;
          v161 = &v27[4 * v26];
          if (v22) {
            operator delete(v22);
          }
        }
        else
        {
          *(_DWORD *)v160 = v9;
          v13 = v12 + 4;
        }
        v160 = v13;
      }
      else if (objc_msgSend((id)objc_msgSend(v8, "semantic"), "isEqualToString:", @"kGeometrySourceSemanticTexcoord"))
      {
        v20 = v157;
        if (v157 >= v158)
        {
          v32 = (char *)v156;
          uint64_t v33 = (v157 - (unsigned char *)v156) >> 2;
          unint64_t v34 = v33 + 1;
          if ((unint64_t)(v33 + 1) >> 62) {
            goto LABEL_197;
          }
          uint64_t v35 = v158 - (unsigned char *)v156;
          if ((v158 - (unsigned char *)v156) >> 1 > v34) {
            unint64_t v34 = v35 >> 1;
          }
          if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v36 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v36 = v34;
          }
          if (v36)
          {
            v37 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)&v158, v36);
            v20 = v157;
            v32 = (char *)v156;
          }
          else
          {
            v37 = 0;
          }
          v46 = &v37[4 * v33];
          *(_DWORD *)v46 = v9;
          v21 = v46 + 4;
          while (v20 != v32)
          {
            int v47 = *((_DWORD *)v20 - 1);
            v20 -= 4;
            *((_DWORD *)v46 - 1) = v47;
            v46 -= 4;
          }
          v156 = v46;
          v157 = v21;
          v158 = &v37[4 * v36];
          if (v32) {
            operator delete(v32);
          }
        }
        else
        {
          *(_DWORD *)v157 = v9;
          v21 = v20 + 4;
        }
        v157 = v21;
      }
      else if (objc_msgSend((id)objc_msgSend(v8, "semantic"), "isEqualToString:", @"kGeometrySourceSemanticColor"))
      {
        v28 = v154;
        if (v154 >= v155)
        {
          v40 = (char *)v153;
          uint64_t v41 = (v154 - (unsigned char *)v153) >> 2;
          unint64_t v42 = v41 + 1;
          if ((unint64_t)(v41 + 1) >> 62) {
LABEL_197:
          }
            abort();
          uint64_t v43 = v155 - (unsigned char *)v153;
          if ((v155 - (unsigned char *)v153) >> 1 > v42) {
            unint64_t v42 = v43 >> 1;
          }
          if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v44 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v44 = v42;
          }
          if (v44)
          {
            v45 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)&v155, v44);
            v40 = (char *)v153;
            v28 = v154;
          }
          else
          {
            v45 = 0;
          }
          v48 = &v45[4 * v41];
          *(_DWORD *)v48 = v9;
          v29 = v48 + 4;
          while (v28 != v40)
          {
            int v49 = *((_DWORD *)v28 - 1);
            v28 -= 4;
            *((_DWORD *)v48 - 1) = v49;
            v48 -= 4;
          }
          v153 = v48;
          v154 = v29;
          v155 = &v45[4 * v44];
          if (v40) {
            operator delete(v40);
          }
        }
        else
        {
          *(_DWORD *)v154 = v9;
          v29 = v28 + 4;
        }
        v154 = v29;
      }
      if (!(v9 | v129)) {
        int v129 = [v8 vectorCount];
      }
      ++v7;
    }
    if (v163 == __p)
    {
LABEL_88:
      id v52 = 0;
      goto LABEL_188;
    }
  }
  else
  {
    uint64_t v50 = objc_msgSend((id)objc_msgSend(a3, "geometrySources"), "indexOfObjectPassingTest:", &__block_literal_global_6);
    int v51 = v50;
    if (v50 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_88;
    }
    uint64_t v53 = (v163 - (unsigned char *)__p) >> 2;
    unint64_t v54 = v53 + 1;
    if ((unint64_t)(v53 + 1) >> 62) {
      abort();
    }
    uint64_t v55 = v164 - (unsigned char *)__p;
    if ((v164 - (unsigned char *)__p) >> 1 > v54) {
      unint64_t v54 = v55 >> 1;
    }
    if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v56 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v56 = v54;
    }
    if (v56) {
      v57 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)&v164, v56);
    }
    else {
      v57 = 0;
    }
    v58 = &v57[4 * v53];
    *(_DWORD *)v58 = v51;
    __p = v58;
    v164 = &v57[4 * v56];
    int v129 = 0;
    v163 = v58 + 4;
  }
  id v59 = objc_alloc_init(MEMORY[0x263F136A8]);
  v131 = objc_opt_new();
  obuint64_t j = (id)[v108 geometrySourcesForSemantic:@"kGeometrySourceSemanticVertex"];
  unint64_t v127 = objc_msgSend((id)objc_msgSend(obj, "objectAtIndexedSubscript:", 0), "vectorCount");
  memset(&v152, 0, sizeof(v152));
  *(_DWORD *)&v149[8] = 0;
  uint64_t v150 = 0;
  uint64_t v151 = 0;
  *(void *)v149 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v108, "geometryElements"), "objectAtIndexedSubscript:", 0), "indicesChannelCount");
  id v60 = uniqueIndexBufferWithSCNGeometryElements((void *)[v108 geometryElements], v129, &v152, (uint64_t)&v149[4], v149);
  uint64_t v132 = [v60 count];
  if (v132)
  {
    unint64_t v127 = v129 + (((v150 - *(void *)&v149[4]) >> 2) / (unint64_t)(*(int *)v149 + 1));
    unint64_t v128 = ((v150 - *(void *)&v149[4]) >> 2) / (unint64_t)(*(int *)v149 + 1);
  }
  else
  {
    LODWORD(v128) = 0;
  }
  long long v147 = 0u;
  long long v148 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  uint64_t v61 = [obj countByEnumeratingWithState:&v145 objects:v168 count:16];
  v106 = v60;
  int v62 = 0;
  if (v61)
  {
    uint64_t v63 = 0;
    uint64_t v123 = *(void *)v146;
    uint64_t v64 = *MEMORY[0x263F135C8];
    int v117 = *(_DWORD *)v149;
    do
    {
      for (uint64_t i = 0; i != v61; ++i)
      {
        if (*(void *)v146 != v123) {
          objc_enumerationMutation(obj);
        }
        v66 = *(void **)(*((void *)&v145 + 1) + 8 * i);
        uint64_t v67 = v64;
        if (v63) {
          uint64_t v67 = objc_msgSend(NSString, "stringWithFormat:", @"blendShape%d", v63);
        }
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v59, "attributes"), "objectAtIndexedSubscript:", v62), "setName:", v67);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v59, "attributes"), "objectAtIndexedSubscript:", v62), "setFormat:", 786435);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v59, "attributes"), "objectAtIndexedSubscript:", v62), "setBufferIndex:", v62);
        if (v132)
        {
          v68 = (void *)[v130 newBuffer:12 * v127 type:1];
          remapVertexAttributeBuffer(v66, *((_DWORD *)__p + (int)v63), &v152, &v149[4], v117, v129, v128, (char *)objc_msgSend((id)objc_msgSend(v68, "map"), "bytes"));
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v59, "attributes"), "objectAtIndexedSubscript:", v62), "setOffset:", 0);
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v59, "layouts"), "objectAtIndexedSubscript:", v62), "setStride:", 12);
        }
        else
        {
          if ([v66 vectorCount] != v127) {
            continue;
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v59, "attributes"), "objectAtIndexedSubscript:", v62), "setOffset:", objc_msgSend(v66, "dataOffset"));
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v59, "layouts"), "objectAtIndexedSubscript:", v62), "setStride:", objc_msgSend(v66, "dataStride"));
          v68 = objc_msgSend(v130, "newBufferWithData:type:", objc_msgSend(v66, "data"), 1);
        }
        [v131 addObject:v68];

        ++v62;
        uint64_t v63 = (v63 + 1);
      }
      uint64_t v61 = [obj countByEnumeratingWithState:&v145 objects:v168 count:16];
    }
    while (v61);
  }
  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  id obja = (id)[v108 geometrySourcesForSemantic:@"kGeometrySourceSemanticNormal"];
  uint64_t v69 = [obja countByEnumeratingWithState:&v141 objects:v167 count:16];
  if (v69)
  {
    uint64_t v70 = 0;
    uint64_t v124 = *(void *)v142;
    uint64_t v71 = *MEMORY[0x263F135B8];
    int v118 = *(_DWORD *)v149;
    do
    {
      for (uint64_t j = 0; j != v69; ++j)
      {
        if (*(void *)v142 != v124) {
          objc_enumerationMutation(obja);
        }
        v73 = *(void **)(*((void *)&v141 + 1) + 8 * j);
        uint64_t v74 = v71;
        if (v70) {
          uint64_t v74 = objc_msgSend(NSString, "stringWithFormat:", @"normal%d", v70);
        }
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v59, "attributes"), "objectAtIndexedSubscript:", v62), "setName:", v74);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v59, "attributes"), "objectAtIndexedSubscript:", v62), "setFormat:", 786435);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v59, "attributes"), "objectAtIndexedSubscript:", v62), "setBufferIndex:", v62);
        if (v132)
        {
          v75 = (void *)[v130 newBuffer:12 * v127 type:1];
          remapVertexAttributeBuffer(v73, *((_DWORD *)v159 + (int)v70), &v152, &v149[4], v118, v129, v128, (char *)objc_msgSend((id)objc_msgSend(v75, "map"), "bytes"));
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v59, "attributes"), "objectAtIndexedSubscript:", v62), "setOffset:", 0);
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v59, "layouts"), "objectAtIndexedSubscript:", v62), "setStride:", 12);
        }
        else
        {
          if ([v73 vectorCount] != v127) {
            continue;
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v59, "attributes"), "objectAtIndexedSubscript:", v62), "setOffset:", objc_msgSend(v73, "dataOffset"));
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v59, "layouts"), "objectAtIndexedSubscript:", v62), "setStride:", objc_msgSend(v73, "dataStride"));
          v75 = objc_msgSend(v130, "newBufferWithData:type:", objc_msgSend(v73, "data"), 1);
        }
        [v131 addObject:v75];

        ++v62;
        uint64_t v70 = (v70 + 1);
      }
      uint64_t v69 = [obja countByEnumeratingWithState:&v141 objects:v167 count:16];
    }
    while (v69);
  }
  if ([v108 firstMaterial]
    && ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v108, "firstMaterial"), "multiply"), "contents"),
         objc_opt_class(),
         (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v108, "firstMaterial"), "multiply"), "contents"),
         objc_opt_class(),
         (objc_opt_isKindOfClass() & 1) != 0)))
  {
    uint64_t v121 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v108, "firstMaterial"), "multiply"), "mappingChannel");
  }
  else
  {
    uint64_t v121 = -1;
  }
  if ([v108 firstMaterial]
    && ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v108, "firstMaterial"), "selfIllumination"), "contents"),
         objc_opt_class(),
         (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v108, "firstMaterial"), "selfIllumination"), "contents"),
         objc_opt_class(),
         (objc_opt_isKindOfClass() & 1) != 0)))
  {
    uint64_t v119 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v108, "firstMaterial"), "selfIllumination"), "mappingChannel");
  }
  else
  {
    uint64_t v119 = -1;
  }
  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id v109 = (id)[v108 geometrySourcesForSemantic:@"kGeometrySourceSemanticTexcoord"];
  uint64_t v125 = [v109 countByEnumeratingWithState:&v137 objects:v166 count:16];
  if (!v125)
  {
    int v77 = v62;
    goto LABEL_164;
  }
  uint64_t v76 = 0;
  id objb = *(id *)v138;
  uint64_t v113 = *MEMORY[0x263F135D8];
  uint64_t v112 = *MEMORY[0x263F13578];
  uint64_t v111 = *MEMORY[0x263F135B0];
  int v110 = *(_DWORD *)v149;
  int v77 = v62;
  do
  {
    for (uint64_t k = 0; k != v125; ++k)
    {
      if (*(id *)v138 != objb) {
        objc_enumerationMutation(v109);
      }
      v79 = *(void **)(*((void *)&v137 + 1) + 8 * k);
      uint64_t v80 = v113;
      if (v76) {
        uint64_t v80 = objc_msgSend(NSString, "stringWithFormat:", @"textureCoordinate%d", v76);
      }
      uint64_t v81 = v112;
      if (v121 != (int)v76) {
        uint64_t v81 = v80;
      }
      if (v119 == (int)v76) {
        uint64_t v82 = v111;
      }
      else {
        uint64_t v82 = v81;
      }
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v59, "attributes"), "objectAtIndexedSubscript:", v77), "setName:", v82);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v59, "attributes"), "objectAtIndexedSubscript:", v77), "setFormat:", 786434);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v59, "attributes"), "objectAtIndexedSubscript:", v77), "setBufferIndex:", v77);
      if (v132)
      {
        v83 = (void *)[v130 newBuffer:8 * v127 type:1];
        remapVertexAttributeBuffer(v79, *((_DWORD *)v156 + (int)v76), &v152, &v149[4], v110, v129, v128, (char *)objc_msgSend((id)objc_msgSend(v83, "map"), "bytes"));
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v59, "attributes"), "objectAtIndexedSubscript:", v77), "setOffset:", 0);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v59, "layouts"), "objectAtIndexedSubscript:", v77), "setStride:", 8);
      }
      else
      {
        if ([v79 vectorCount] != v127) {
          continue;
        }
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v59, "attributes"), "objectAtIndexedSubscript:", v77), "setOffset:", objc_msgSend(v79, "dataOffset"));
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v59, "layouts"), "objectAtIndexedSubscript:", v77), "setStride:", objc_msgSend(v79, "dataStride"));
        v83 = objc_msgSend(v130, "newBufferWithData:type:", objc_msgSend(v79, "data"), 1);
      }
      if ((C3DWasLinkedBeforeMajorOSYear2018() & 1) == 0 && objc_msgSend((id)objc_msgSend(v83, "map"), "bytes"))
      {
        v84 = objc_msgSend((id)objc_msgSend(v59, "attributes"), "objectAtIndexedSubscript:", v77);
        flip_UVs((MDLVertexFormat)[v84 format], (char *)objc_msgSend((id)objc_msgSend(v83, "map"), "bytes"), objc_msgSend(v84, "offset"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v59, "layouts"), "objectAtIndexedSubscript:", objc_msgSend(v84, "bufferIndex")), "stride"), v127);
      }
      [v131 addObject:v83];

      ++v77;
      uint64_t v76 = (v76 + 1);
    }
    uint64_t v125 = [v109 countByEnumeratingWithState:&v137 objects:v166 count:16];
  }
  while (v125);
LABEL_164:
  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  id v120 = (id)[v108 geometrySourcesForSemantic:@"kGeometrySourceSemanticColor"];
  uint64_t v85 = [v120 countByEnumeratingWithState:&v133 objects:v165 count:16];
  if (v85)
  {
    LODWORD(v86) = 0;
    uint64_t v126 = *(void *)v134;
    uint64_t v87 = *MEMORY[0x263F13598];
    int v122 = *(_DWORD *)v149;
    int v88 = v77;
    do
    {
      uint64_t v89 = 0;
      uint64_t v90 = v88;
      uint64_t v86 = (int)v86;
      do
      {
        if (*(void *)v134 != v126) {
          objc_enumerationMutation(v120);
        }
        v91 = *(void **)(*((void *)&v133 + 1) + 8 * v89);
        uint64_t v92 = v87;
        if (v86) {
          uint64_t v92 = objc_msgSend(NSString, "stringWithFormat:", @"color%d", v86);
        }
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v59, "attributes"), "objectAtIndexedSubscript:", v90 + v89), "setName:", v92);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v59, "attributes"), "objectAtIndexedSubscript:", v90 + v89), "setFormat:", objc_msgSend(v91, "componentsPerVector") | 0xC0000);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v59, "attributes"), "objectAtIndexedSubscript:", v90 + v89), "setBufferIndex:", v90 + v89);
        if (v132)
        {
          v93 = objc_msgSend(v130, "newBuffer:type:", objc_msgSend(v91, "dataStride") * v127, 1);
          remapVertexAttributeBuffer(v91, *((_DWORD *)v153 + v86), &v152, &v149[4], v122, v129, v128, (char *)objc_msgSend((id)objc_msgSend(v93, "map"), "bytes"));
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v59, "attributes"), "objectAtIndexedSubscript:", v90 + v89), "setOffset:", 0);
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v59, "layouts"), "objectAtIndexedSubscript:", v90 + v89), "setStride:", objc_msgSend(v91, "dataStride"));
        }
        else
        {
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v59, "attributes"), "objectAtIndexedSubscript:", v90 + v89), "setOffset:", objc_msgSend(v91, "dataOffset"));
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v59, "layouts"), "objectAtIndexedSubscript:", v90 + v89), "setStride:", objc_msgSend(v91, "dataStride"));
          v93 = objc_msgSend(v130, "newBufferWithData:type:", objc_msgSend(v91, "data"), 1);
        }
        [v131 addObject:v93];

        ++v86;
        ++v89;
      }
      while (v85 != v89);
      uint64_t v85 = [v120 countByEnumeratingWithState:&v133 objects:v165 count:16];
      int v88 = v90 + v89;
    }
    while (v85);
  }
  v152.__end_ = v152.__begin_;
  uint64_t v150 = *(void *)&v149[4];
  v94 = objc_opt_new();
  uint64_t v95 = [v108 geometryElementCount];
  uint64_t v96 = objc_msgSend((id)objc_msgSend(v108, "materials"), "count");
  if (v95)
  {
    unint64_t v97 = v96;
    for (unint64_t m = 0; m != v95; ++m)
    {
      uint64_t v99 = [v108 geometryElementAtIndex:m];
      if (v132) {
        uint64_t v100 = objc_msgSend(MEMORY[0x263F13668], "submeshWithUniquedIndexData:andSCNGeometryElement:bufferAllocator:", objc_msgSend(v106, "objectAtIndexedSubscript:", m), v99, a4);
      }
      else {
        uint64_t v100 = [MEMORY[0x263F13668] submeshWithSCNGeometryElement:v99 bufferAllocator:a4 positionSourceChannel:*(int *)__p];
      }
      v101 = (void *)v100;
      [v94 addObject:v100];
      if (v97)
      {
        uint64_t v102 = objc_msgSend((id)objc_msgSend(v108, "materials"), "objectAtIndexedSubscript:", m % v97);
        objc_msgSend(v101, "setMaterial:", objc_msgSend(MEMORY[0x263F13608], "materialWithSCNMaterial:", v102));
      }
    }
  }
  v103 = (void *)[[a1 alloc] initWithVertexBuffers:v131 vertexCount:v127 descriptor:v59 submeshes:v94];

  objc_msgSend(v103, "setName:", objc_msgSend(v108, "name"));
  objc_setAssociatedObject(v103, @"SCNSceneKitAssociatedObject", v108, (void *)0x301);
  id v52 = v103;
  if (*(void *)&v149[4])
  {
    uint64_t v150 = *(void *)&v149[4];
    operator delete(*(void **)&v149[4]);
  }
  if (v152.__begin_)
  {
    v152.__end_ = v152.__begin_;
    operator delete(v152.__begin_);
  }
LABEL_188:
  if (v153)
  {
    v154 = (char *)v153;
    operator delete(v153);
  }
  if (v156)
  {
    v157 = (char *)v156;
    operator delete(v156);
  }
  if (v159)
  {
    v160 = (char *)v159;
    operator delete(v159);
  }
  if (__p)
  {
    v163 = (char *)__p;
    operator delete(__p);
  }
  return v52;
}

@end