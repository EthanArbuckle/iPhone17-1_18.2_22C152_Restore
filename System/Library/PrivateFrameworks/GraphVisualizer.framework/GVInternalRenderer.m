@interface GVInternalRenderer
+ (void)drawAllEdges:(id)a3 renderer:(id)a4;
+ (void)drawAllNodes:(id)a3 renderer:(id)a4;
+ (void)render:(id)a3 renderer:(id)a4;
@end

@implementation GVInternalRenderer

+ (void)drawAllNodes:(id)a3 renderer:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = objc_msgSend(a3, "nodes", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (([v10 isMemberOfClass:objc_opt_class()] & 1) == 0) {
          [a4 drawNode:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

+ (void)drawAllEdges:(id)a3 renderer:(id)a4
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  obuint64_t j = (id)[a3 edges];
  uint64_t v75 = [obj countByEnumeratingWithState:&v93 objects:v103 count:16];
  if (v75)
  {
    id v73 = a4;
    uint64_t v74 = *(void *)v94;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v94 != v74) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v93 + 1) + 8 * v7);
        uint64_t v9 = (void *)[v8 from];
        uint64_t v10 = [v8 to];
        [v6 removeAllObjects];
        [v9 center];
        double v97 = v11;
        double v98 = v12;
        objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", &v97, "{CGPoint=dd}"));
        v76 = (void *)v10;
        if (objc_opt_respondsToSelector())
        {
          switch([a4 direction])
          {
            case 0u:
              break;
            case 1u:
              long long v87 = 0u;
              long long v88 = 0u;
              long long v85 = 0u;
              long long v86 = 0u;
              v29 = (void *)[v8 dummies];
              uint64_t v30 = [v29 countByEnumeratingWithState:&v85 objects:v101 count:16];
              if (v30)
              {
                uint64_t v31 = v30;
                uint64_t v32 = *(void *)v86;
                do
                {
                  for (uint64_t i = 0; i != v31; ++i)
                  {
                    if (*(void *)v86 != v32) {
                      objc_enumerationMutation(v29);
                    }
                    v34 = *(void **)(*((void *)&v85 + 1) + 8 * i);
                    [v34 cx];
                    double v36 = v35;
                    [v34 y];
                    double v97 = v36;
                    double v98 = v37;
                    objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", &v97, "{CGPoint=dd}"));
                    [v34 cx];
                    double v39 = v38;
                    [v34 y];
                    double v41 = v40;
                    [v34 h];
                    double v97 = v39;
                    double v98 = v41 + v42;
                    objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", &v97, "{CGPoint=dd}"));
                  }
                  uint64_t v31 = [v29 countByEnumeratingWithState:&v85 objects:v101 count:16];
                }
                while (v31);
              }
              goto LABEL_15;
            case 2u:
              long long v83 = 0u;
              long long v84 = 0u;
              long long v81 = 0u;
              long long v82 = 0u;
              v43 = (void *)[v8 dummies];
              uint64_t v44 = [v43 countByEnumeratingWithState:&v81 objects:v100 count:16];
              if (v44)
              {
                uint64_t v45 = v44;
                uint64_t v46 = *(void *)v82;
                do
                {
                  for (uint64_t j = 0; j != v45; ++j)
                  {
                    if (*(void *)v82 != v46) {
                      objc_enumerationMutation(v43);
                    }
                    v48 = *(void **)(*((void *)&v81 + 1) + 8 * j);
                    [v48 x];
                    double v50 = v49;
                    [v48 cy];
                    double v97 = v50;
                    double v98 = v51;
                    objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", &v97, "{CGPoint=dd}"));
                    [v48 x];
                    double v53 = v52;
                    [v48 w];
                    double v55 = v53 + v54;
                    [v48 cy];
                    double v97 = v55;
                    double v98 = v56;
                    objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", &v97, "{CGPoint=dd}"));
                  }
                  uint64_t v45 = [v43 countByEnumeratingWithState:&v81 objects:v100 count:16];
                }
                while (v45);
              }
              goto LABEL_15;
            case 3u:
              long long v79 = 0u;
              long long v80 = 0u;
              long long v77 = 0u;
              long long v78 = 0u;
              v57 = (void *)[v8 dummies];
              uint64_t v58 = [v57 countByEnumeratingWithState:&v77 objects:v99 count:16];
              if (v58)
              {
                uint64_t v59 = v58;
                uint64_t v60 = *(void *)v78;
                do
                {
                  for (uint64_t k = 0; k != v59; ++k)
                  {
                    if (*(void *)v78 != v60) {
                      objc_enumerationMutation(v57);
                    }
                    v62 = *(void **)(*((void *)&v77 + 1) + 8 * k);
                    [v62 x];
                    double v64 = v63;
                    [v62 w];
                    double v66 = v64 + v65;
                    [v62 cy];
                    double v97 = v66;
                    double v98 = v67;
                    objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", &v97, "{CGPoint=dd}"));
                    [v62 x];
                    double v69 = v68;
                    [v62 cy];
                    double v97 = v69;
                    double v98 = v70;
                    objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", &v97, "{CGPoint=dd}"));
                  }
                  uint64_t v59 = [v57 countByEnumeratingWithState:&v77 objects:v99 count:16];
                }
                while (v59);
              }
              goto LABEL_15;
            default:
              +[GVInternalRenderer drawAllEdges:renderer:]();
          }
        }
        long long v91 = 0u;
        long long v92 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        long long v13 = (void *)[v8 dummies];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v89 objects:v102 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v90;
          do
          {
            for (uint64_t m = 0; m != v15; ++m)
            {
              if (*(void *)v90 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v89 + 1) + 8 * m);
              [v18 cx];
              double v20 = v19;
              [v18 y];
              double v22 = v21;
              [v18 h];
              double v97 = v20;
              double v98 = v22 + v23;
              objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", &v97, "{CGPoint=dd}"));
              [v18 cx];
              double v25 = v24;
              [v18 y];
              double v97 = v25;
              double v98 = v26;
              objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", &v97, "{CGPoint=dd}"));
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v89 objects:v102 count:16];
          }
          while (v15);
        }
LABEL_15:
        [v76 center];
        double v97 = v27;
        double v98 = v28;
        objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", &v97, "{CGPoint=dd}"));
        a4 = v73;
        [v73 drawEdge:v8 withPath:v6];
        ++v7;
      }
      while (v7 != v75);
      uint64_t v71 = [obj countByEnumeratingWithState:&v93 objects:v103 count:16];
      uint64_t v75 = v71;
    }
    while (v71);
  }
}

+ (void)render:(id)a3 renderer:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0 && [a4 drawEdgesFirst])
  {
    +[GVInternalRenderer drawAllEdges:a3 renderer:a4];
    +[GVInternalRenderer drawAllNodes:a3 renderer:a4];
  }
  else
  {
    +[GVInternalRenderer drawAllNodes:a3 renderer:a4];
    +[GVInternalRenderer drawAllEdges:a3 renderer:a4];
  }
}

+ (void)drawAllEdges:renderer:.cold.1()
{
}

@end