@interface BWInferenceSchedulerFramebufferBuilder
+ (void)initialize;
- (BOOL)_validToDeriveFormat:(BOOL)result fromFormat:(void *)a2 vendingProvider:(void *)a3;
- (BWInferenceSchedulerFramebufferBuilder)initWithInferenceRequirements:(id)a3 dependencyProvider:(id)a4 formatProvider:(id)a5;
- (id)_connectNodesExpectingInputs:(void *)a3 toNodesProvidingOutput:(void *)a4 dependencyProvider:(void *)a5 nodeForExternalRequirement:;
- (id)_newScalingNodesForScalingRequirement:(unsigned int)a3 fencedMedia:;
- (id)newFramebuffer;
- (uint64_t)_addScalingNodesForNodesExpectingInputs:(void *)a3 nodesProvidingOutput:(void *)a4 dependencyProvider:(void *)a5 nodesForExternalRequirements:(void *)a6 fencedMediaKeys:(uint64_t)a7 iterations:;
- (void)_populateJobList:(void *)a3 fromGraphEdges:(uint64_t)a4 withHeadNode:(void *)a5 jobTypes:;
- (void)_prepareToConnectNode:(uint64_t)a1;
- (void)dealloc;
@end

@implementation BWInferenceSchedulerFramebufferBuilder

- (id)_connectNodesExpectingInputs:(void *)a3 toNodesProvidingOutput:(void *)a4 dependencyProvider:(void *)a5 nodeForExternalRequirement:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v31 = result;
  if (result)
  {
    v6 = a2;
    id v33 = (id)[a2 copy];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v34 = [a3 countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (v34)
    {
      uint64_t v28 = *(void *)v47;
      v29 = v6;
      v30 = a3;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v47 != v28) {
            objc_enumerationMutation(a3);
          }
          uint64_t v35 = v7;
          v8 = *(void **)(*((void *)&v46 + 1) + 8 * v7);
          uint64_t v9 = objc_msgSend(a3, "objectForKey:", v8, v28);
          v10 = objc_msgSend((id)objc_msgSend(v6, "objectForKey:", v8), "allObjects");
          v11 = (void *)[v31[4] objectForKey:v9];
          v12 = (void *)[a4 dependenciesForInputVideoRequirement:v8];
          id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          obuint64_t j = v12;
          uint64_t v14 = [v12 countByEnumeratingWithState:&v42 objects:v51 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v43;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v43 != v16) {
                  objc_enumerationMutation(obj);
                }
                v18 = *(void **)(*((void *)&v42 + 1) + 8 * i);
                v19 = (void *)[v18 dataRequirement];
                v20 = objc_msgSend(a5, "objectForKey:", objc_msgSend(v18, "inferenceRequirement"));
                if ([v10 containsObject:v20])
                {
                  v21 = malloc_type_calloc(1uLL, 0x20uLL, 0x108004097C26A9CuLL);
                  void *v21 = v8;
                  v21[1] = v19;
                  v21[2] = v20;
                  [v11 addPointer:v21];
                  [v13 addObject:v20];
                }
              }
              uint64_t v15 = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
            }
            while (v15);
          }
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          uint64_t v22 = [v10 countByEnumeratingWithState:&v38 objects:v50 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v39;
            do
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v39 != v24) {
                  objc_enumerationMutation(v10);
                }
                v26 = *(void **)(*((void *)&v38 + 1) + 8 * j);
                if (([v13 containsObject:v26] & 1) == 0)
                {
                  v27 = malloc_type_calloc(1uLL, 0x20uLL, 0x108004097C26A9CuLL);
                  void *v27 = v8;
                  v27[1] = v8;
                  v27[2] = v26;
                  [v11 addPointer:v27];
                }
              }
              uint64_t v23 = [v10 countByEnumeratingWithState:&v38 objects:v50 count:16];
            }
            while (v23);
          }

          [v33 removeObjectForKey:v8];
          uint64_t v7 = v35 + 1;
          v6 = v29;
          a3 = v30;
        }
        while (v35 + 1 != v34);
        uint64_t v34 = [v30 countByEnumeratingWithState:&v46 objects:v52 count:16];
      }
      while (v34);
    }
    return (id *)v33;
  }
  return result;
}

- (void)_populateJobList:(void *)a3 fromGraphEdges:(uint64_t)a4 withHeadNode:(void *)a5 jobTypes:
{
  uint64_t v47 = a2;
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v5 = a3;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E10]), "initWithKeyOptions:valueOptions:capacity:", 258, 0, objc_msgSend(a3, "count"));
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E10]), "initWithKeyOptions:valueOptions:capacity:", 258, 0, objc_msgSend(v5, "count"));
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    v55 = v5;
    obuint64_t j = (id)[v5 countByEnumeratingWithState:&v80 objects:v89 count:16];
    if (obj)
    {
      uint64_t v53 = *(void *)v81;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v81 != v53) {
            objc_enumerationMutation(v5);
          }
          uint64_t v58 = v8;
          uint64_t v9 = *(void *)(*((void *)&v80 + 1) + 8 * v8);
          long long v76 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          v10 = objc_msgSend(v5, "objectForKey:", v9, v47);
          uint64_t v11 = [v10 countByEnumeratingWithState:&v76 objects:v88 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v77;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v77 != v13) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v15 = *(void *)(*((void *)&v76 + 1) + 8 * i);
                uint64_t v16 = *(void *)(v15 + 16);
                v17 = (void *)[v6 objectForKey:v16];
                if (!v17)
                {
                  v17 = (void *)[MEMORY[0x1E4F1CA80] set];
                  [v6 setObject:v17 forKey:v16];
                }
                [v17 addObject:v9];
                v18 = (void *)[v7 objectForKey:v16];
                if (!v18)
                {
                  v18 = (void *)[MEMORY[0x1E4F28F50] pointerArrayWithOptions:258];
                  [v7 setObject:v18 forKey:v16];
                }
                [v18 addPointer:v15 + 24];
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v76 objects:v88 count:16];
            }
            while (v12);
          }
          uint64_t v8 = v58 + 1;
          v5 = v55;
        }
        while ((id)(v58 + 1) != obj);
        obuint64_t j = (id)[v55 countByEnumeratingWithState:&v80 objects:v89 count:16];
      }
      while (obj);
    }
    v59 = objc_msgSend(MEMORY[0x1E4F28BD0], "set", v47);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v5, "count"));
    [v19 addObject:a4];
    if ([v19 count])
    {
      int v20 = 0;
      id obja = v19;
      do
      {
        int v50 = v20;
        if ((unint64_t)[v19 count] < 2)
        {
          uint64_t v22 = (void *)[v19 anyObject];
        }
        else
        {
          v21 = (void *)[MEMORY[0x1E4F1CA80] set];
          long long v72 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          uint64_t v54 = [v19 countByEnumeratingWithState:&v72 objects:v87 count:16];
          uint64_t v22 = 0;
          if (v54)
          {
            uint64_t v52 = *(void *)v73;
            float v23 = 0.0;
            do
            {
              for (uint64_t j = 0; j != v54; ++j)
              {
                if (*(void *)v73 != v52) {
                  objc_enumerationMutation(obja);
                }
                v25 = *(void **)(*((void *)&v72 + 1) + 8 * j);
                v26 = (void *)[v5 objectForKey:v25];
                long long v68 = 0u;
                long long v69 = 0u;
                long long v70 = 0u;
                long long v71 = 0u;
                uint64_t v27 = [v26 countByEnumeratingWithState:&v68 objects:v86 count:16];
                if (v27)
                {
                  uint64_t v28 = v27;
                  uint64_t v29 = *(void *)v69;
                  do
                  {
                    for (uint64_t k = 0; k != v28; ++k)
                    {
                      if (*(void *)v69 != v29) {
                        objc_enumerationMutation(v26);
                      }
                      objc_msgSend(v21, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v6, "objectForKey:", *(void *)(*(void *)(*((void *)&v68 + 1) + 8 * k) + 16)), "allObjects"));
                    }
                    uint64_t v28 = [v26 countByEnumeratingWithState:&v68 objects:v86 count:16];
                  }
                  while (v28);
                }
                float v31 = (float)(unint64_t)[v21 count];
                unint64_t v32 = [v26 count];
                if ((float)(v31 / (float)v32) < v23 || v22 == 0)
                {
                  uint64_t v22 = v25;
                  float v23 = v31 / (float)v32;
                }
                [v21 removeAllObjects];
                v5 = v55;
              }
              v19 = obja;
              uint64_t v54 = [obja countByEnumeratingWithState:&v72 objects:v87 count:16];
            }
            while (v54);
          }
        }
        [v19 removeObject:v22];
        uint64_t v34 = [v48 jobAtIndex:v50];
        *(void *)uint64_t v34 = v22;
        *(unsigned char *)(v34 + 21) = [v59 countForObject:v22];
        *(unsigned char *)(v34 + 20) = [a5 objectForKey:v22];
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        uint64_t v35 = (void *)[v7 objectForKey:v22];
        uint64_t v36 = [v35 countByEnumeratingWithState:&v64 objects:v85 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v65;
          do
          {
            for (uint64_t m = 0; m != v37; ++m)
            {
              if (*(void *)v65 != v38) {
                objc_enumerationMutation(v35);
              }
              **(unsigned char **)(*((void *)&v64 + 1) + 8 * m) = v50;
            }
            uint64_t v37 = [v35 countByEnumeratingWithState:&v64 objects:v85 count:16];
          }
          while (v37);
        }
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v40 = (void *)[v5 objectForKey:v22];
        uint64_t v41 = [v40 countByEnumeratingWithState:&v60 objects:v84 count:16];
        if (v41)
        {
          uint64_t v42 = v41;
          uint64_t v43 = *(void *)v61;
          do
          {
            for (uint64_t n = 0; n != v42; ++n)
            {
              if (*(void *)v61 != v43) {
                objc_enumerationMutation(v40);
              }
              uint64_t v45 = *(void *)(*(void *)(*((void *)&v60 + 1) + 8 * n) + 16);
              [v59 addObject:v45];
              long long v46 = (void *)[v6 objectForKey:v45];
              [v46 removeObject:v22];
              if (![v46 count]) {
                [obja addObject:v45];
              }
            }
            uint64_t v42 = [v40 countByEnumeratingWithState:&v60 objects:v84 count:16];
          }
          while (v42);
        }
        int v20 = v50 + 1;
        v19 = obja;
      }
      while ([obja count]);
    }
  }
}

- (BWInferenceSchedulerFramebufferBuilder)initWithInferenceRequirements:(id)a3 dependencyProvider:(id)a4 formatProvider:(id)a5
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  v106.receiver = self;
  v106.super_class = (Class)BWInferenceSchedulerFramebufferBuilder;
  uint64_t v8 = [(BWInferenceSchedulerFramebufferBuilder *)&v106 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend((id)objc_msgSend(a4, "allInputVideoDependencies"), "count");
    uint64_t v10 = objc_msgSend((id)objc_msgSend(a4, "allOutputVideoDependencies"), "count") + v9;
    v8->_directedEdgesByNode = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:v10];
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28E10], "bw_strongVideoRequirementToStrongObjectsMapTable");
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28E10], "bw_strongVideoRequirementToStrongObjectsMapTable");
    id v74 = a3;
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E10]), "initWithKeyOptions:valueOptions:capacity:", 258, 1282, objc_msgSend(a3, "count"));
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v15 = [[BWInferenceSchedulerGraphInputNode alloc] initWithVideoPropagatedToStorage:v14];
    long long v65 = v8;
    uint64_t v16 = (uint64_t)v8;
    v17 = v14;
    -[BWInferenceSchedulerFramebufferBuilder _prepareToConnectNode:](v16, (uint64_t)v15);
    long long v69 = v13;
    [v13 setObject:1 forKey:v15];
    id v73 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    id v77 = a4;
    obuint64_t j = (id)[a4 consumedVideoAttachedMediaKeys];
    uint64_t v18 = [obj countByEnumeratingWithState:&v102 objects:v113 count:16];
    uint64_t v66 = (uint64_t)v15;
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v103;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v103 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void **)(*((void *)&v102 + 1) + 8 * i);
          float v23 = (BWInferenceVideoFormat *)[a5 inputInferenceVideoFormatForAttachedMediaKey:v22];
          if (!v23)
          {
            uint64_t v24 = [a5 inputVideoFormatForAttachedMediaKey:v22];
            if (!v24) {
              goto LABEL_64;
            }
            LODWORD(v63) = 0;
            float v23 = -[BWInferenceVideoFormat initWithUnderlyingFormat:isDeviceOriented:videoContentMode:includesInvalidContent:cropDescriptor:histogramRequest:rotationDegrees:]([BWInferenceVideoFormat alloc], "initWithUnderlyingFormat:isDeviceOriented:videoContentMode:includesInvalidContent:cropDescriptor:histogramRequest:rotationDegrees:", v24, 0, 0, [v22 isEqualToString:@"PrimaryFormat"], 0, 0, v63);
            uint64_t v15 = (BWInferenceSchedulerGraphInputNode *)v66;
          }
          v25 = [[BWInferenceVideoRequirement alloc] initWithAttachedMediaKey:v22 videoFormat:v23];
          [v17 addObject:v25];
          [v11 setObject:v15 forKey:v25];

          if (([v73 containsObject:v22] & 1) == 0
            && [a5 intermediateResourceTrackingAllowedForAttachedMediaKey:v22])
          {
            [v73 addObject:v22];
          }
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v102 objects:v113 count:16];
      }
      while (v19);
    }
    long long v64 = v17;
    id v26 = (id)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    uint64_t v27 = [v74 countByEnumeratingWithState:&v98 objects:v112 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v99;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v99 != v29) {
            objc_enumerationMutation(v74);
          }
          uint64_t v31 = *(void *)(*((void *)&v98 + 1) + 8 * j);
          unint64_t v32 = [[BWInferenceSchedulerInference alloc] initWithInferenceRequirement:v31];
          -[BWInferenceSchedulerFramebufferBuilder _prepareToConnectNode:]((uint64_t)v65, (uint64_t)v32);
          [v69 setObject:2 forKey:v32];
          [v26 setObject:v32 forKey:v31];
        }
        uint64_t v28 = [v74 countByEnumeratingWithState:&v98 objects:v112 count:16];
      }
      while (v28);
    }
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id v33 = v77;
    id v67 = (id)[v77 allInputVideoDependencies];
    id obja = (char *)[v67 countByEnumeratingWithState:&v94 objects:v111 count:16];
    if (obja)
    {
      uint64_t v68 = *(void *)v95;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v95 != v68) {
            objc_enumerationMutation(v67);
          }
          long long v75 = v34;
          uint64_t v35 = *(void *)(*((void *)&v94 + 1) + 8 * (void)v34);
          long long v90 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          uint64_t v36 = (void *)[v33 dependenciesForInputVideoRequirement:v35];
          uint64_t v37 = [v36 countByEnumeratingWithState:&v90 objects:v110 count:16];
          if (v37)
          {
            uint64_t v38 = v37;
            uint64_t v39 = *(void *)v91;
            do
            {
              for (uint64_t k = 0; k != v38; ++k)
              {
                if (*(void *)v91 != v39) {
                  objc_enumerationMutation(v36);
                }
                uint64_t v41 = objc_msgSend(v26, "objectForKey:", objc_msgSend(*(id *)(*((void *)&v90 + 1) + 8 * k), "inferenceRequirement"));
                id v42 = (id)[v12 objectForKey:v35];
                if (!v42)
                {
                  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                  [v12 setObject:v42 forKey:v35];
                }
                [v42 addObject:v41];
              }
              uint64_t v38 = [v36 countByEnumeratingWithState:&v90 objects:v110 count:16];
            }
            while (v38);
          }
          id v33 = v77;
          uint64_t v34 = v75 + 1;
        }
        while (v75 + 1 != obja);
        id obja = (char *)[v67 countByEnumeratingWithState:&v94 objects:v111 count:16];
      }
      while (obja);
    }
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id objb = (id)[v33 allOutputVideoDependencies];
    uint64_t v43 = [objb countByEnumeratingWithState:&v86 objects:v109 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      id v76 = *(id *)v87;
      do
      {
        for (uint64_t m = 0; m != v44; ++m)
        {
          if (*(id *)v87 != v76) {
            objc_enumerationMutation(objb);
          }
          uint64_t v46 = *(void *)(*((void *)&v86 + 1) + 8 * m);
          long long v82 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          uint64_t v47 = (void *)[v33 dependenciesForOutputVideoRequirement:v46];
          uint64_t v48 = [v47 countByEnumeratingWithState:&v82 objects:v108 count:16];
          if (v48)
          {
            uint64_t v49 = v48;
            uint64_t v50 = *(void *)v83;
            do
            {
              for (uint64_t n = 0; n != v49; ++n)
              {
                if (*(void *)v83 != v50) {
                  objc_enumerationMutation(v47);
                }
                objc_msgSend(v11, "setObject:forKey:", objc_msgSend(v26, "objectForKey:", objc_msgSend(*(id *)(*((void *)&v82 + 1) + 8 * n), "inferenceRequirement")), v46);
              }
              uint64_t v49 = [v47 countByEnumeratingWithState:&v82 objects:v108 count:16];
            }
            while (v49);
          }
          id v33 = v77;
        }
        uint64_t v44 = [objb countByEnumeratingWithState:&v86 objects:v109 count:16];
      }
      while (v44);
    }
    uint64_t v52 = -[BWInferenceSchedulerFramebufferBuilder _connectNodesExpectingInputs:toNodesProvidingOutput:dependencyProvider:nodeForExternalRequirement:]((id *)&v65->super.isa, v12, v11, v33, v26);
    uint64_t v53 = -[BWInferenceSchedulerFramebufferBuilder _addScalingNodesForNodesExpectingInputs:nodesProvidingOutput:dependencyProvider:nodesForExternalRequirements:fencedMediaKeys:iterations:]((id *)&v65->super.isa, v52, (id)[v11 copy], v33, v26, v73, 15);
    v17 = v64;
    if (v53)
    {
      uint64_t v54 = (void *)v53;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      directedEdgesByNode = v65->_directedEdgesByNode;
      uint64_t v56 = [(NSMapTable *)directedEdgesByNode countByEnumeratingWithState:&v78 objects:v107 count:16];
      if (v56)
      {
        uint64_t v57 = v56;
        uint64_t v58 = *(void *)v79;
        do
        {
          for (iuint64_t i = 0; ii != v57; ++ii)
          {
            if (*(void *)v79 != v58) {
              objc_enumerationMutation(directedEdgesByNode);
            }
            uint64_t v60 = *(void *)(*((void *)&v78 + 1) + 8 * ii);
            if (![v69 objectForKey:v60]) {
              [v69 setObject:3 forKey:v60];
            }
          }
          uint64_t v57 = [(NSMapTable *)directedEdgesByNode countByEnumeratingWithState:&v78 objects:v107 count:16];
        }
        while (v57);
      }
      v17 = v64;
      if (![v54 count])
      {
        v65->_graph = [[BWInferenceSchedulerGraph alloc] initWithHeadNode:v66 directedEdges:v65->_directedEdgesByNode];
        long long v61 = [[BWInferenceSchedulerJobList alloc] initWithCapacity:v65->_jobCount];
        v65->_prototypeJobList = v61;
        -[BWInferenceSchedulerFramebufferBuilder _populateJobList:fromGraphEdges:withHeadNode:jobTypes:]((uint64_t)v65, (uint64_t)v61, v65->_directedEdgesByNode, v66, v69);
      }
    }
LABEL_64:

    return v65;
  }
  return v8;
}

- (void)_prepareToConnectNode:(uint64_t)a1
{
  if (a1)
  {
    ++*(void *)(a1 + 24);
    id v4 = (id)[objc_alloc(MEMORY[0x1E4F28F58]) initWithOptions:1024];
    [v4 setSizeFunction:BWInferenceSchedulerGraphDirectedEdgeSize];
    [v4 setRelinquishFunction:BWInferenceSchedulerGraphDirectedEdgeRelinquish];
    id v5 = (id)[objc_alloc(MEMORY[0x1E4F28F50]) initWithPointerFunctions:v4];
    [*(id *)(a1 + 32) setObject:v5 forKey:a2];
  }
}

- (uint64_t)_addScalingNodesForNodesExpectingInputs:(void *)a3 nodesProvidingOutput:(void *)a4 dependencyProvider:(void *)a5 nodesForExternalRequirements:(void *)a6 fencedMediaKeys:(uint64_t)a7 iterations:
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v9 = a2;
  if (![a2 count]) {
    return (uint64_t)v9;
  }
  if (!a7) {
    return 0;
  }
  uint64_t v54 = a7;
  v55 = a5;
  uint64_t v10 = (void *)[v9 copy];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  uint64_t v12 = [v9 countByEnumeratingWithState:&v88 objects:v97 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v89;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v89 != v14) {
          objc_enumerationMutation(v9);
        }
        uint64_t v16 = *(void **)(*((void *)&v88 + 1) + 8 * i);
        uint64_t v17 = [v16 attachedMediaKey];
        uint64_t v18 = (void *)[v11 objectForKeyedSubscript:v17];
        if (v18)
        {
          uint64_t v19 = (void *)[v18 videoFormat];
          unint64_t v20 = objc_msgSend((id)objc_msgSend(v16, "videoFormat"), "width");
          if (v20 <= [v19 width]) {
            continue;
          }
        }
        [v11 setObject:v16 forKeyedSubscript:v17];
      }
      uint64_t v13 = [v9 countByEnumeratingWithState:&v88 objects:v97 count:16];
    }
    while (v13);
  }
  id v21 = (id)[a3 copy];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  uint64_t v60 = [v11 countByEnumeratingWithState:&v84 objects:v96 count:16];
  if (v60)
  {
    uint64_t v58 = v11;
    uint64_t v59 = *(void *)v85;
    id v63 = v21;
    do
    {
      for (uint64_t j = 0; j != v60; ++j)
      {
        if (*(void *)v85 != v59) {
          objc_enumerationMutation(v11);
        }
        uint64_t v70 = *(void *)(*((void *)&v84 + 1) + 8 * j);
        float v23 = objc_msgSend(v11, "objectForKeyedSubscript:");
        id v67 = (void *)[v23 videoFormat];
        long long v80 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        uint64_t v24 = [v21 countByEnumeratingWithState:&v80 objects:v95 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          long long v61 = v23;
          uint64_t v62 = j;
          id v26 = 0;
          uint64_t v27 = *(void *)v81;
          while (1)
          {
            uint64_t v28 = 0;
            do
            {
              uint64_t v29 = v26;
              if (*(void *)v81 != v27) {
                objc_enumerationMutation(v21);
              }
              id v26 = *(void **)(*((void *)&v80 + 1) + 8 * v28);
              if (objc_msgSend((id)objc_msgSend(v26, "attachedMediaKey"), "isEqualToString:", v70)
                && (v30 = (void *)[v26 videoFormat],
                    [v21 objectForKey:v26],
                    -[BWInferenceSchedulerFramebufferBuilder _validToDeriveFormat:fromFormat:vendingProvider:]((BOOL)a1, v67, v30)))
              {
                if (!v29) {
                  goto LABEL_36;
                }
                uint64_t v31 = (void *)[v29 videoFormat];
                unint64_t v32 = [v30 width];
                if (v32 < [v31 width]) {
                  goto LABEL_34;
                }
                uint64_t v33 = [v30 width];
                if (v33 != [v31 width]) {
                  goto LABEL_33;
                }
                int v34 = [v31 includesInvalidContent];
                if (v34 == [v67 includesInvalidContent]
                  || (int v35 = [v30 includesInvalidContent],
                      BOOL v36 = v35 == [v67 includesInvalidContent],
                      id v21 = v63,
                      !v36))
                {
                  int obja = [v31 includesInvalidContent];
                  if (obja == [v67 includesInvalidContent]
                    && (int v37 = [v31 pixelFormat], v37 != objc_msgSend(v67, "pixelFormat")))
                  {
                    int v38 = [v30 pixelFormat];
                    if (v38 != [v67 pixelFormat]) {
                      id v26 = v29;
                    }
                  }
                  else
                  {
LABEL_33:
                    id v26 = v29;
                  }
LABEL_34:
                  id v21 = v63;
                }
              }
              else
              {
                id v26 = v29;
              }
LABEL_36:
              ++v28;
            }
            while (v25 != v28);
            uint64_t v39 = [v21 countByEnumeratingWithState:&v80 objects:v95 count:16];
            uint64_t v25 = v39;
            if (!v39)
            {
              uint64_t j = v62;
              if (v61 && v26)
              {
                if ([v61 isSatisfiedByRequirement:v26]) {
                  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], objc_msgSend(NSString, "stringWithFormat:", @"Creating scaling nodes to convert between two requirements that already satisfy one another: %@ and %@", v61, v26), 0 reason userInfo]);
                }
                long long v40 = [BWInferenceScalingRequirement alloc];
                long long v94 = v61;
                uint64_t v41 = -[BWInferenceScalingRequirement initWithInputVideoRequirement:requestedOutputVideoRequirements:intermediatePixelBufferCompressionType:](v40, "initWithInputVideoRequirement:requestedOutputVideoRequirements:intermediatePixelBufferCompressionType:", v26, [MEMORY[0x1E4F1C978] arrayWithObjects:&v94 count:1], objc_msgSend(a4, "supportedPixelBufferCompressionType"));
                id v42 = -[BWInferenceSchedulerFramebufferBuilder _newScalingNodesForScalingRequirement:fencedMedia:]((uint64_t)a1, v41, objc_msgSend(a6, "containsObject:", objc_msgSend(v26, "attachedMediaKey")));

                long long v78 = 0u;
                long long v79 = 0u;
                long long v76 = 0u;
                long long v77 = 0u;
                obuint64_t j = v42;
                uint64_t v71 = [v42 countByEnumeratingWithState:&v76 objects:v93 count:16];
                if (v71)
                {
                  uint64_t v68 = *(void *)v77;
                  do
                  {
                    for (uint64_t k = 0; k != v71; ++k)
                    {
                      if (*(void *)v77 != v68) {
                        objc_enumerationMutation(obj);
                      }
                      uint64_t v44 = *(void **)(*((void *)&v76 + 1) + 8 * k);
                      -[BWInferenceSchedulerFramebufferBuilder _prepareToConnectNode:]((uint64_t)a1, (uint64_t)v44);
                      objc_msgSend(a3, "setObject:forKey:", v44, objc_msgSend((id)objc_msgSend(v44, "outputRequirements"), "firstObject"));
                      long long v74 = 0u;
                      long long v75 = 0u;
                      long long v72 = 0u;
                      long long v73 = 0u;
                      uint64_t v45 = (void *)[v44 inputVideoRequirements];
                      uint64_t v46 = [v45 countByEnumeratingWithState:&v72 objects:v92 count:16];
                      if (v46)
                      {
                        uint64_t v47 = v46;
                        uint64_t v48 = *(void *)v73;
                        do
                        {
                          for (uint64_t m = 0; m != v47; ++m)
                          {
                            if (*(void *)v73 != v48) {
                              objc_enumerationMutation(v45);
                            }
                            uint64_t v50 = *(void *)(*((void *)&v72 + 1) + 8 * m);
                            id v51 = (id)[v10 objectForKey:v50];
                            if (!v51) {
                              id v51 = (id)objc_opt_new();
                            }
                            [v51 addObject:v44];
                            [v10 setObject:v51 forKey:v50];
                          }
                          uint64_t v47 = [v45 countByEnumeratingWithState:&v72 objects:v92 count:16];
                        }
                        while (v47);
                      }
                    }
                    uint64_t v71 = [obj countByEnumeratingWithState:&v76 objects:v93 count:16];
                  }
                  while (v71);
                }

                uint64_t j = v62;
                id v21 = v63;
              }
              break;
            }
          }
        }
        id v11 = v58;
      }
      uint64_t v60 = [v58 countByEnumeratingWithState:&v84 objects:v96 count:16];
    }
    while (v60);
  }
  uint64_t v52 = -[BWInferenceSchedulerFramebufferBuilder _connectNodesExpectingInputs:toNodesProvidingOutput:dependencyProvider:nodeForExternalRequirement:](a1, v10, a3, a4, v55);

  return -[BWInferenceSchedulerFramebufferBuilder _addScalingNodesForNodesExpectingInputs:nodesProvidingOutput:dependencyProvider:nodesForExternalRequirements:fencedMediaKeys:iterations:](a1, v52, a3, a4, v55, a6, v54 - 1);
}

- (BOOL)_validToDeriveFormat:(BOOL)result fromFormat:(void *)a2 vendingProvider:(void *)a3
{
  if (result)
  {
    unint64_t v5 = [a3 width];
    if (v5 >= [a2 width]
      && (unint64_t v6 = [a3 height], v6 >= objc_msgSend(a2, "height"))
      && ((int v7 = [a2 includesInvalidContent],
           v7 == [a3 includesInvalidContent])
       || ([a2 includesInvalidContent] & 1) == 0
       && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      && (uint64_t v8 = [a3 videoContentMode], v8 <= objc_msgSend(a2, "videoContentMode")))
    {
      if (objc_msgSend((id)objc_msgSend(a3, "cropDescriptor"), "identifier"))
      {
        int v9 = objc_msgSend((id)objc_msgSend(a3, "cropDescriptor"), "identifier");
        return v9 == objc_msgSend((id)objc_msgSend(a2, "cropDescriptor"), "identifier");
      }
      else
      {
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)_newScalingNodesForScalingRequirement:(unsigned int)a3 fencedMedia:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v6 = objc_msgSend(a2, "orderedVideoRequirements", 0, 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (1)
    {
      if (*(void *)v17 != v9) {
        objc_enumerationMutation(v6);
      }
      if (!--v8)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }
  uint64_t v10 = objc_msgSend((id)objc_msgSend(a2, "orderedVideoRequirements"), "mutableCopy");
  if ((unint64_t)[v10 count] >= 2)
  {
    uint64_t v11 = 0;
    do
    {
      uint64_t v12 = [v10 firstObject];
      [v10 removeObjectAtIndex:0];
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_msgSend(v13, "addObject:", objc_msgSend(v10, "firstObject"));
      if ((unint64_t)[v10 count] >= 2)
      {
        do
        {
          if (!objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", 1), "isSatisfiedByRequirement:", objc_msgSend(v13, "lastObject")))break; {
          [v10 removeObjectAtIndex:0];
          }
          objc_msgSend(v13, "addObject:", objc_msgSend(v10, "firstObject"));
        }
        while ((unint64_t)[v10 count] > 1);
      }
      uint64_t v14 = [[BWInferenceSchedulerScaler alloc] initWithInputRequirement:v12 derivedFromRequirement:v11 outputRequirements:v13 options:a3];

      [v5 addObject:v14];
      uint64_t v11 = v12;
    }
    while ((unint64_t)[v10 count] > 1);
  }

  return v5;
}

- (id)newFramebuffer
{
  if (!self->_graph || !self->_prototypeJobList) {
    return 0;
  }
  if (self->_didVendFramebuffer) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], objc_msgSend(NSString, "stringWithFormat:", @"%@ already returned a framebuffer. Multi-buffering is not yet supported", self), 0 reason userInfo]);
  }
  self->_didVendFramebuffer = 1;
  v3 = [BWInferenceSchedulerFramebuffer alloc];
  graph = self->_graph;
  prototypeJobList = self->_prototypeJobList;
  return [(BWInferenceSchedulerFramebuffer *)v3 initWithGraph:graph jobList:prototypeJobList];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceSchedulerFramebufferBuilder;
  [(BWInferenceSchedulerFramebufferBuilder *)&v3 dealloc];
}

+ (void)initialize
{
}

@end