@interface HDSPSGHelper
- (HDSPSGHelper)initWithHome:(id)a3;
- (id)allPSGsInRoom:(id)a3;
- (id)fetchPSG:(id)a3;
- (id)roomForStereoPair:(id)a3;
- (id)roomsForPSG:(id)a3;
@end

@implementation HDSPSGHelper

- (HDSPSGHelper)initWithHome:(id)a3
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v66.receiver = self;
  v66.super_class = (Class)HDSPSGHelper;
  v49 = [(HDSPSGHelper *)&v66 init];
  if (v49)
  {
    objc_storeStrong((id *)&v49->_currentHome, a3);
    v6 = [(HMHome *)v49->_currentHome accessories];
    uint64_t v7 = [v6 copy];
    allHomePods = v49->_allHomePods;
    v49->_allHomePods = (NSArray *)v7;

    v9 = [(HMHome *)v49->_currentHome mediaSystems];
    uint64_t v10 = [v9 copy];
    allStereoPairs = v49->_allStereoPairs;
    v49->_allStereoPairs = (NSArray *)v10;

    if (gLogCategory_HDSPSGHelper <= 30)
    {
      if (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      if (gLogCategory_HDSPSGHelper <= 30)
      {
        if (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize())
        {
          allPSGs = v49->_allPSGs;
          LogPrintF();
        }
        if (gLogCategory_HDSPSGHelper <= 30)
        {
          if (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize())
          {
            allPSGs = v49->_allHomePods;
            LogPrintF();
          }
          if (gLogCategory_HDSPSGHelper <= 30
            && (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize()))
          {
            allPSGs = v49->_allStereoPairs;
            LogPrintF();
          }
        }
      }
    }
    id v46 = v5;
    uint64_t v12 = objc_opt_new();
    psgStereoPairMap = v49->_psgStereoPairMap;
    v49->_psgStereoPairMap = (NSMutableDictionary *)v12;

    p_isa = (id *)&v49->super.isa;
    uint64_t v15 = objc_opt_new();
    psgHomePodMap = v49->_psgHomePodMap;
    v49->_psgHomePodMap = (NSMutableDictionary *)v15;

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    obuint64_t j = v49->_allPSGs;
    uint64_t v50 = [(NSArray *)obj countByEnumeratingWithState:&v62 objects:v69 count:16];
    if (v50)
    {
      uint64_t v48 = *(void *)v63;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v63 != v48) {
            objc_enumerationMutation(obj);
          }
          uint64_t v51 = v17;
          v18 = *(void **)(*((void *)&v62 + 1) + 8 * v17);
          objc_msgSend(v18, "identifier", allPSGs, v45);
          v53 = (NSArray *)objc_claimAutoreleasedReturnValue();
          v19 = [v18 destinationIdentifiers];
          v52 = objc_opt_new();
          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          id v20 = p_isa[3];
          uint64_t v21 = [v20 countByEnumeratingWithState:&v58 objects:v68 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v59;
            do
            {
              for (uint64_t i = 0; i != v22; ++i)
              {
                if (*(void *)v59 != v23) {
                  objc_enumerationMutation(v20);
                }
                v25 = *(void **)(*((void *)&v58 + 1) + 8 * i);
                uint64_t v26 = objc_msgSend(v25, "audioDestinationIdentifier", allPSGs);
                if (v26)
                {
                  v27 = (void *)v26;
                  v28 = [v25 audioDestinationIdentifier];
                  int v29 = [v19 containsObject:v28];

                  if (v29)
                  {
                    if (gLogCategory_HDSPSGHelper <= 30
                      && (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize()))
                    {
                      v45 = v25;
                      LogPrintF();
                      objc_msgSend(v52, "addObject:", v25, v53);
                    }
                    else
                    {
                      objc_msgSend(v52, "addObject:", v25, allPSGs);
                    }
                  }
                }
                if (gLogCategory_HDSPSGHelper <= 30
                  && (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize()))
                {
                  allPSGs = v53;
                  v45 = v52;
                  LogPrintF();
                }
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v58 objects:v68 count:16];
            }
            while (v22);
          }

          v30 = (void *)[v52 copy];
          [p_isa[5] setObject:v30 forKeyedSubscript:v53];

          v31 = objc_opt_new();
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id v32 = p_isa[4];
          uint64_t v33 = [v32 countByEnumeratingWithState:&v54 objects:v67 count:16];
          if (v33)
          {
            uint64_t v34 = v33;
            uint64_t v35 = *(void *)v55;
            do
            {
              for (uint64_t j = 0; j != v34; ++j)
              {
                if (*(void *)v55 != v35) {
                  objc_enumerationMutation(v32);
                }
                v37 = *(void **)(*((void *)&v54 + 1) + 8 * j);
                uint64_t v38 = objc_msgSend(v37, "audioDestinationIdentifier", allPSGs);
                if (v38)
                {
                  v39 = (void *)v38;
                  v40 = [v37 audioDestinationIdentifier];
                  int v41 = [v19 containsObject:v40];

                  if (v41)
                  {
                    if (gLogCategory_HDSPSGHelper <= 30
                      && (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize()))
                    {
                      v45 = v37;
                      LogPrintF();
                      objc_msgSend(v31, "addObject:", v37, v53);
                    }
                    else
                    {
                      objc_msgSend(v31, "addObject:", v37, allPSGs);
                    }
                  }
                }
                if (gLogCategory_HDSPSGHelper <= 30
                  && (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize()))
                {
                  allPSGs = v53;
                  v45 = v31;
                  LogPrintF();
                }
              }
              uint64_t v34 = [v32 countByEnumeratingWithState:&v54 objects:v67 count:16];
            }
            while (v34);
          }

          v42 = (void *)[v31 copy];
          p_isa = (id *)&v49->super.isa;
          [(NSMutableDictionary *)v49->_psgStereoPairMap setObject:v42 forKeyedSubscript:v53];

          uint64_t v17 = v51 + 1;
        }
        while (v51 + 1 != v50);
        uint64_t v50 = [(NSArray *)obj countByEnumeratingWithState:&v62 objects:v69 count:16];
      }
      while (v50);
    }

    id v5 = v46;
    if (gLogCategory_HDSPSGHelper <= 30)
    {
      if (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      if (gLogCategory_HDSPSGHelper <= 30
        && (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }

  return v49;
}

- (id)allPSGsInRoom:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  v6 = v5;
  if (v4)
  {
    id v33 = v4;
    uint64_t v7 = [v4 uniqueIdentifier];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    obuint64_t j = [(NSMutableDictionary *)self->_psgHomePodMap allKeys];
    uint64_t v37 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
    if (v37)
    {
      uint64_t v36 = *(void *)v50;
      uint64_t v34 = v6;
      do
      {
        for (uint64_t i = 0; i != v37; uint64_t i = v27 + 1)
        {
          if (*(void *)v50 != v36) {
            objc_enumerationMutation(obj);
          }
          uint64_t v39 = i;
          uint64_t v9 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          uint64_t v10 = [(NSMutableDictionary *)self->_psgHomePodMap objectForKeyedSubscript:v9];
          uint64_t v38 = v9;
          v40 = [(NSMutableDictionary *)self->_psgStereoPairMap objectForKeyedSubscript:v9];
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id v11 = v10;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v45 objects:v54 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v46;
            while (2)
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v46 != v14) {
                  objc_enumerationMutation(v11);
                }
                v16 = [*(id *)(*((void *)&v45 + 1) + 8 * j) room];
                uint64_t v17 = [v16 uniqueIdentifier];
                int v18 = objc_msgSend(v7, "hmf_isEqualToUUID:", v17);

                if (v18)
                {
                  v24 = [(HDSPSGHelper *)self fetchPSG:v38];
                  if (gLogCategory_HDSPSGHelper <= 30
                    && (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize()))
                  {
                    v31 = v7;
                    id v32 = v24;
                    LogPrintF();
                  }
                  objc_msgSend(v6, "addObject:", v24, v31, v32);
                  id v19 = v11;
LABEL_35:
                  uint64_t v27 = v39;

                  goto LABEL_36;
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v45 objects:v54 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }

          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          id v19 = v40;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v41 objects:v53 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v42;
            while (2)
            {
              for (uint64_t k = 0; k != v21; ++k)
              {
                if (*(void *)v42 != v22) {
                  objc_enumerationMutation(v19);
                }
                v24 = [(HDSPSGHelper *)self roomForStereoPair:*(void *)(*((void *)&v41 + 1) + 8 * k)];
                v25 = [v24 uniqueIdentifier];
                int v26 = objc_msgSend(v7, "hmf_isEqualToUUID:", v25);

                if (v26)
                {
                  v28 = [(HDSPSGHelper *)self fetchPSG:v38];
                  if (gLogCategory_HDSPSGHelper <= 30
                    && (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize()))
                  {
                    v31 = v7;
                    id v32 = v28;
                    LogPrintF();
                  }
                  v6 = v34;
                  objc_msgSend(v34, "addObject:", v28, v31, v32);

                  goto LABEL_35;
                }
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v41 objects:v53 count:16];
              if (v21) {
                continue;
              }
              break;
            }
            v6 = v34;
          }
          uint64_t v27 = v39;
LABEL_36:
        }
        uint64_t v37 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
      }
      while (v37);
    }

    if (gLogCategory_HDSPSGHelper <= 30 && (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize()))
    {
      v31 = v33;
      id v32 = v6;
      LogPrintF();
    }
    id v29 = (id)objc_msgSend(v6, "copy", v31, v32);

    id v4 = v33;
  }
  else
  {
    id v29 = v5;
  }

  return v29;
}

- (id)roomsForPSG:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  v6 = v5;
  if (v4)
  {
    id v7 = v4;
    uint64_t v8 = [v4 identifier];
    uint64_t v9 = [(NSMutableDictionary *)self->_psgHomePodMap objectForKeyedSubscript:v8];
    uint64_t v27 = (void *)v8;
    int v26 = [(NSMutableDictionary *)self->_psgStereoPairMap objectForKeyedSubscript:v8];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    obuint64_t j = v9;
    uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if (gLogCategory_HDSPSGHelper <= 30
            && (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize()))
          {
            [v14 room];
            v25 = id v24 = v7;
            LogPrintF();
          }
          uint64_t v15 = objc_msgSend(v14, "room", v24, v25);
          [v6 addObject:v15];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v11);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v16 = v26;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v30 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = [(HDSPSGHelper *)self roomForStereoPair:*(void *)(*((void *)&v29 + 1) + 8 * j)];
          if (gLogCategory_HDSPSGHelper <= 30
            && (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize()))
          {
            id v24 = v7;
            v25 = v21;
            LogPrintF();
          }
          objc_msgSend(v6, "addObject:", v21, v24, v25);
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v18);
    }

    id v4 = v7;
    if (gLogCategory_HDSPSGHelper <= 30 && (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize()))
    {
      id v24 = v7;
      v25 = v6;
      LogPrintF();
    }
    id v22 = (id)objc_msgSend(v6, "copy", v24, v25);
  }
  else
  {
    id v22 = v5;
  }

  return v22;
}

- (id)roomForStereoPair:(id)a3
{
  v3 = [a3 components];
  id v4 = [v3 firstObject];
  id v5 = [v4 mediaProfile];
  v6 = [v5 accessory];
  id v7 = [v6 room];

  return v7;
}

- (id)fetchPSG:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogCategory_HDSPSGHelper <= 30 && (gLogCategory_HDSPSGHelper != -1 || _LogCategory_Initialize()))
  {
    id v13 = v4;
    allPSGs = self->_allPSGs;
    LogPrintF();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_allPSGs;
  v6 = (void *)[(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "identifier", v13, allPSGs, (void)v15);
        char v11 = objc_msgSend(v4, "hmf_isEqualToUUID:", v10);

        if (v11)
        {
          v6 = (void *)[v9 copy];
          goto LABEL_15;
        }
      }
      v6 = (void *)[(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_psgRoomMap, 0);
  objc_storeStrong((id *)&self->_psgStereoPairMap, 0);
  objc_storeStrong((id *)&self->_psgHomePodMap, 0);
  objc_storeStrong((id *)&self->_allStereoPairs, 0);
  objc_storeStrong((id *)&self->_allHomePods, 0);
  objc_storeStrong((id *)&self->_allPSGs, 0);
  objc_storeStrong((id *)&self->_currentHome, 0);
}

@end