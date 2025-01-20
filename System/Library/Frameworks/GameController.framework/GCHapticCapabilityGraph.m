@interface GCHapticCapabilityGraph
+ (BOOL)supportsSecureCoding;
- (GCHapticCapabilityGraph)initWithActuators:(id)a3 nodes:(id)a4;
- (GCHapticCapabilityGraph)initWithCoder:(id)a3;
- (GCHapticCapabilityGraph)initWithJSONDictionaryRepresentation:(id)a3;
- (NSMutableDictionary)nodes;
- (NSMutableSet)allCapabilities;
- (NSMutableSet)allLeafCapabilities;
- (NSMutableSet)exposedCapabilities;
- (NSMutableSet)exposedLeafCapabilities;
- (NSString)description;
- (id)actuatorsForNode:(id)a3;
- (id)jsonDictionaryRepresentation;
- (void)setAllCapabilities:(id)a3;
- (void)setAllLeafCapabilities:(id)a3;
- (void)setExposedCapabilities:(id)a3;
- (void)setExposedLeafCapabilities:(id)a3;
- (void)setNodes:(id)a3;
@end

@implementation GCHapticCapabilityGraph

- (NSMutableDictionary)nodes
{
  return self->_nodes;
}

- (void)setNodes:(id)a3
{
}

- (NSMutableSet)exposedCapabilities
{
  return self->_exposedCapabilities;
}

- (void)setExposedCapabilities:(id)a3
{
}

- (NSMutableSet)exposedLeafCapabilities
{
  return self->_exposedLeafCapabilities;
}

- (void)setExposedLeafCapabilities:(id)a3
{
}

- (NSMutableSet)allCapabilities
{
  return self->_allCapabilities;
}

- (void)setAllCapabilities:(id)a3
{
}

- (NSMutableSet)allLeafCapabilities
{
  return self->_allLeafCapabilities;
}

- (void)setAllLeafCapabilities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allLeafCapabilities, 0);
  objc_storeStrong((id *)&self->_allCapabilities, 0);
  objc_storeStrong((id *)&self->_exposedLeafCapabilities, 0);
  objc_storeStrong((id *)&self->_exposedCapabilities, 0);

  objc_storeStrong((id *)&self->_nodes, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCHapticCapabilityGraph)initWithCoder:(id)a3
{
  return 0;
}

- (GCHapticCapabilityGraph)initWithActuators:(id)a3 nodes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v121.receiver = self;
  v121.super_class = (Class)GCHapticCapabilityGraph;
  v9 = [(GCHapticCapabilityGraph *)&v121 init];
  if (v9)
  {
    v85 = v8;
    uint64_t v10 = +[NSMutableDictionary dictionary];
    nodes = v9->_nodes;
    v9->_nodes = (NSMutableDictionary *)v10;

    uint64_t v12 = +[NSMutableSet set];
    exposedCapabilities = v9->_exposedCapabilities;
    v9->_exposedCapabilities = (NSMutableSet *)v12;

    uint64_t v14 = +[NSMutableSet set];
    exposedLeafCapabilities = v9->_exposedLeafCapabilities;
    v9->_exposedLeafCapabilities = (NSMutableSet *)v14;

    uint64_t v16 = +[NSMutableSet set];
    allCapabilities = v9->_allCapabilities;
    v9->_allCapabilities = (NSMutableSet *)v16;

    uint64_t v18 = +[NSMutableSet set];
    allLeafCapabilities = v9->_allLeafCapabilities;
    v9->_allLeafCapabilities = (NSMutableSet *)v18;

    context = (void *)MEMORY[0x223C6E130]();
    v20 = +[NSMutableDictionary dictionary];
    long long v117 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    id v84 = v7;
    id v21 = v7;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v117 objects:v128 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v118;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v118 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v117 + 1) + 8 * i);
          v27 = [v26 label];
          [v20 setObject:v26 forKey:v27];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v117 objects:v128 count:16];
      }
      while (v23);
    }

    v89 = +[NSMutableDictionary dictionary];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v82 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
      [v82 handleFailureInMethod:a2 object:v9 file:@"GCHapticCapabilityGraph.m" lineNumber:83 description:@"Expected NSArray when deserializing nodes"];
    }
    SEL v87 = a2;
    long long v115 = 0u;
    long long v116 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    obuint64_t j = v85;
    uint64_t v28 = [obj countByEnumeratingWithState:&v113 objects:v127 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v114;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v114 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v32 = *(void *)(*((void *)&v113 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v37 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
            [v37 handleFailureInMethod:v87 object:v9 file:@"GCHapticCapabilityGraph.m" lineNumber:85 description:@"Expected NSDictionary when deserializing GCHapticCapabilityGraphNode"];
          }
          v33 = [[GCHapticCapabilityGraphNode alloc] initWithJSONDictionaryRepresentation:v32];
          v34 = v9->_nodes;
          v35 = [(GCHapticCapabilityGraphNode *)v33 label];
          [(NSMutableDictionary *)v34 setObject:v33 forKey:v35];

          v36 = [(GCHapticCapabilityGraphNode *)v33 label];
          [v89 setObject:v32 forKey:v36];
        }
        uint64_t v29 = [obj countByEnumeratingWithState:&v113 objects:v127 count:16];
      }
      while (v29);
    }

    long long v111 = 0u;
    long long v112 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    id v86 = [v89 allValues];
    id obja = (id)[v86 countByEnumeratingWithState:&v109 objects:v126 count:16];
    if (obja)
    {
      uint64_t v88 = *(void *)v110;
      do
      {
        for (k = 0; k != obja; k = (char *)k + 1)
        {
          if (*(void *)v110 != v88) {
            objc_enumerationMutation(v86);
          }
          v39 = *(void **)(*((void *)&v109 + 1) + 8 * (void)k);
          v40 = v9->_nodes;
          v41 = [v39 objectForKeyedSubscript:@"label"];
          v42 = [(NSMutableDictionary *)v40 objectForKeyedSubscript:v41];

          long long v107 = 0u;
          long long v108 = 0u;
          long long v105 = 0u;
          long long v106 = 0u;
          v43 = [v39 objectForKeyedSubscript:@"children"];
          uint64_t v44 = [v43 countByEnumeratingWithState:&v105 objects:v125 count:16];
          if (v44)
          {
            uint64_t v45 = v44;
            uint64_t v46 = *(void *)v106;
            do
            {
              for (uint64_t m = 0; m != v45; ++m)
              {
                if (*(void *)v106 != v46) {
                  objc_enumerationMutation(v43);
                }
                v48 = [(NSMutableDictionary *)v9->_nodes objectForKeyedSubscript:*(void *)(*((void *)&v105 + 1) + 8 * m)];
                [v42 addChild:v48];
              }
              uint64_t v45 = [v43 countByEnumeratingWithState:&v105 objects:v125 count:16];
            }
            while (v45);
          }

          v49 = [v42 children];
          uint64_t v50 = [v49 count];

          if (!v50)
          {
            long long v103 = 0u;
            long long v104 = 0u;
            long long v101 = 0u;
            long long v102 = 0u;
            v51 = [v39 objectForKeyedSubscript:@"actuators"];
            uint64_t v52 = [v51 countByEnumeratingWithState:&v101 objects:v124 count:16];
            if (v52)
            {
              uint64_t v53 = v52;
              uint64_t v54 = *(void *)v102;
              do
              {
                for (uint64_t n = 0; n != v53; ++n)
                {
                  if (*(void *)v102 != v54) {
                    objc_enumerationMutation(v51);
                  }
                  v56 = [v20 objectForKeyedSubscript:*(void *)(*((void *)&v101 + 1) + 8 * n)];
                  [v42 addActuator:v56];
                }
                uint64_t v53 = [v51 countByEnumeratingWithState:&v101 objects:v124 count:16];
              }
              while (v53);
            }
          }
        }
        id obja = (id)[v86 countByEnumeratingWithState:&v109 objects:v126 count:16];
      }
      while (obja);
    }

    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id objb = [v89 allValues];
    uint64_t v57 = [objb countByEnumeratingWithState:&v97 objects:v123 count:16];
    if (v57)
    {
      uint64_t v58 = v57;
      uint64_t v59 = *(void *)v98;
      do
      {
        for (iuint64_t i = 0; ii != v58; ++ii)
        {
          if (*(void *)v98 != v59) {
            objc_enumerationMutation(objb);
          }
          v61 = v9->_nodes;
          v62 = [*(id *)(*((void *)&v97 + 1) + 8 * ii) objectForKeyedSubscript:@"label"];
          v63 = [(NSMutableDictionary *)v61 objectForKeyedSubscript:v62];

          v64 = [v63 children];
          uint64_t v65 = [v64 count];

          if (v65)
          {
            long long v95 = 0u;
            long long v96 = 0u;
            long long v93 = 0u;
            long long v94 = 0u;
            v66 = [(GCHapticCapabilityGraph *)v9 actuatorsForNode:v63];
            uint64_t v67 = [v66 countByEnumeratingWithState:&v93 objects:v122 count:16];
            if (v67)
            {
              uint64_t v68 = v67;
              uint64_t v69 = *(void *)v94;
              do
              {
                for (juint64_t j = 0; jj != v68; ++jj)
                {
                  if (*(void *)v94 != v69) {
                    objc_enumerationMutation(v66);
                  }
                  [v63 addActuator:*(void *)(*((void *)&v93 + 1) + 8 * jj)];
                }
                uint64_t v68 = [v66 countByEnumeratingWithState:&v93 objects:v122 count:16];
              }
              while (v68);
            }
          }
          v71 = [v63 children];
          uint64_t v72 = [v71 count];

          v73 = v9->_allCapabilities;
          v74 = [v63 label];
          [(NSMutableSet *)v73 addObject:v74];

          if (!v72)
          {
            v75 = v9->_allLeafCapabilities;
            v76 = [v63 label];
            [(NSMutableSet *)v75 addObject:v76];
          }
          if ([v63 isExposed])
          {
            v77 = v9->_exposedCapabilities;
            v78 = [v63 label];
            [(NSMutableSet *)v77 addObject:v78];
          }
          if ([v63 isExposed] && !v72)
          {
            v79 = v9->_exposedLeafCapabilities;
            v80 = [v63 label];
            [(NSMutableSet *)v79 addObject:v80];
          }
        }
        uint64_t v58 = [objb countByEnumeratingWithState:&v97 objects:v123 count:16];
      }
      while (v58);
    }

    id v7 = v84;
    id v8 = v85;
  }

  return v9;
}

- (GCHapticCapabilityGraph)initWithJSONDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  context = (void *)MEMORY[0x223C6E130]();
  v4 = objc_opt_new();
  v5 = [v3 objectForKeyedSubscript:@"actuators"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v20 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v20 handleFailureInMethod:a2 object:self file:@"GCHapticCapabilityGraph.m" lineNumber:137 description:@"Expected NSArray when deserializing actuators"];
  }
  id v7 = [v3 objectForKeyedSubscript:@"actuators"];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v14 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
          [v14 handleFailureInMethod:a2 object:self file:@"GCHapticCapabilityGraph.m" lineNumber:140 description:@"Expected NSDictionary when deserializing GCHapticActuator"];
        }
        v13 = [[GCHapticActuator alloc] initWithJSONDictionaryRepresentation:v12];
        [v4 addObject:v13];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }
  v15 = [v3 objectForKeyedSubscript:@"nodes"];
  objc_opt_class();
  char v16 = objc_opt_isKindOfClass();

  if ((v16 & 1) == 0)
  {
    id v21 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v21 handleFailureInMethod:a2 object:self file:@"GCHapticCapabilityGraph.m" lineNumber:145 description:@"Expected NSArray when deserializing nodes"];
  }
  v17 = [v3 objectForKeyedSubscript:@"nodes"];
  uint64_t v18 = [(GCHapticCapabilityGraph *)self initWithActuators:v4 nodes:v17];

  return v18;
}

- (id)actuatorsForNode:(id)a3
{
  id v4 = a3;
  v5 = [v4 children];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = +[NSMutableArray array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = objc_msgSend(v4, "children", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [(GCHapticCapabilityGraph *)self actuatorsForNode:*(void *)(*((void *)&v15 + 1) + 8 * i)];
          [v7 addObjectsFromArray:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v7 = [v4 actuators];
  }

  return v7;
}

- (id)jsonDictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = +[NSMutableArray array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v5 = [(NSMutableDictionary *)self->_nodes allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v31 + 1) + 8 * i) jsonDictionaryRepresentation];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v7);
  }

  long long v26 = v3;
  [v3 setObject:v4 forKey:@"nodes"];
  uint64_t v11 = +[NSMutableArray array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v12 = self->_allLeafCapabilities;
  uint64_t v13 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v28;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = [(NSMutableDictionary *)self->_nodes objectForKeyedSubscript:*(void *)(*((void *)&v27 + 1) + 8 * v16)];
        long long v18 = [v17 actuators];
        uint64_t v19 = [v18 count];

        if (v19 != 1)
        {
          uint64_t v23 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
          [v23 handleFailureInMethod:a2 object:self file:@"GCHapticCapabilityGraph.m" lineNumber:179 description:@"All leaf nodes should have exactly 1 actuator"];
        }
        v20 = [v17 actuators];
        id v21 = [v20 firstObject];

        uint64_t v22 = [v21 jsonDictionaryRepresentation];
        [v11 addObject:v22];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v14);
  }

  [v26 setObject:v11 forKey:@"actuators"];

  return v26;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"<%@ - %lu nodes, %lu capabilities (%lu exposed), %lu leaf capabilities (%lu exposed)>", objc_opt_class(), [(NSMutableDictionary *)self->_nodes count], [(NSMutableSet *)self->_allCapabilities count], [(NSMutableSet *)self->_exposedCapabilities count], [(NSMutableSet *)self->_allLeafCapabilities count], [(NSMutableSet *)self->_exposedLeafCapabilities count]];
}

@end