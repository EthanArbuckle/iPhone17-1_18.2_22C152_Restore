id sub_56BC(void *a1)
{
  return [*(id *)(a1[4] + 40) setObject:a1[6] forKeyedSubscript:a1[5]];
}

void sub_5798(void *a1)
{
  v2 = [*(id *)(a1[4] + 40) objectForKeyedSubscript:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v2 != 0;
}

uint64_t sub_58E0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_58F0(uint64_t a1)
{
}

void sub_58F8(uint64_t a1)
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 40);
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "objectForKeyedSubscript:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
        if ([(id)objc_opt_class() serviceType] == *(id *)(a1 + 48))
        {
          uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
          v9 = *(void **)(v8 + 40);
          *(void *)(v8 + 40) = v7;

          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void sub_5AA8(uint64_t a1)
{
  id v2 = +[NSError hk_error:300 description:@"Device connection dropped"];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 80);
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        sub_5CA8(*(void *)(a1 + 32), 0, *(void **)(*((void *)&v18 + 1) + 8 * (void)v7), v2);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }

  [*(id *)(*(void *)(a1 + 32) + 80) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 72) removeAllObjects];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = *(id *)(*(void *)(a1 + 32) + 40);
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v12), (void)v14);
        [v13 deviceDisconnecting];

        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v10);
  }

  [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 0;
}

void sub_5CA8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = [*(id *)(a1 + 80) objectForKeyedSubscript:v8];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        long long v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * (void)v14) + 16))();
          long long v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
    [*(id *)(a1 + 80) removeObjectForKey:v8];
  }
}

void sub_5EE0(void *a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(a1[4] + 40);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(a1[4] + 40) objectForKeyedSubscript:*(void *)(*((void *)&v8 + 1) + 8 * (void)v6)];
        if ([v7 supportsOperation:a1[5]])
        {
          [v7 performOperation:a1[5] onPeripheral:*(void *)(a1[4] + 16) withParameters:a1[6] completion:a1[7]];

          goto LABEL_11;
        }

        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  id v2 = +[NSError hk_error:304, @"Cannot find service to perform operation %@ on device %@", a1[5], *(void *)(a1[4] + 16), (void)v8 format];
  (*(void (**)(void))(a1[7] + 16))();
LABEL_11:
}

void sub_6130(uint64_t a1)
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = a1 + 32;
  id v3 = *(id *)(*(void *)(a1 + 32) + 40);
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v4)
  {

LABEL_13:
    _HKInitializeLogging();
    long long v10 = HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR)) {
      sub_3F734(a1, v2, v10);
    }
    long long v11 = +[NSError hk_error:304, @"Cannot find service to write characteristic %@ on device %@", *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 16), (void)v12 format];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

    return;
  }
  id v5 = v4;
  char v6 = 0;
  uint64_t v7 = *(void *)v13;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(v3);
      }
      long long v9 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      if ([v9 supportsWritingCharacteristic:*(void *)(a1 + 40)])
      {
        [v9 writeCharacteristic:*(void *)(a1 + 40) expectResponse:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];
        char v6 = 1;
      }
    }
    id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  }
  while (v5);

  if ((v6 & 1) == 0) {
    goto LABEL_13;
  }
}

void sub_6440(uint64_t a1)
{
  uint64_t v2 = HDHealthPeripheralAllPropertyNames();
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 32)];

  if (v3)
  {
    if ([*(id *)(*(void *)(a1 + 40) + 16) state] == (char *)&dword_0 + 2)
    {
      if (sub_655C(*(void *)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 32)))
      {
        id v5 = *(void **)(a1 + 32);
        uint64_t v4 = *(void *)(a1 + 40);
        sub_6654(v4, v5);
      }
      return;
    }
    uint64_t v6 = *(void *)(a1 + 48);
    CFStringRef v7 = @"Device not connected";
    uint64_t v8 = 300;
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    CFStringRef v7 = @"Unknown property";
    uint64_t v8 = 310;
  }
  id v9 = +[NSError hk_error:v8 description:v7];
  (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v9);
}

uint64_t sub_655C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v6 = *(void **)(a1 + 80);
    id v7 = a3;
    uint64_t v8 = [v6 objectForKeyedSubscript:v7];
    id v9 = objc_retainBlock(v5);
    if (v8)
    {
      [v8 addObject:v9];
    }
    else
    {
      long long v10 = +[NSMutableArray arrayWithObject:v9];
      [*(id *)(a1 + 80) setObject:v10 forKeyedSubscript:v7];
    }
    long long v11 = [*(id *)(a1 + 80) objectForKeyedSubscript:v7];

    a1 = [v11 count] == (char *)&dword_0 + 1;
  }

  return a1;
}

void sub_6654(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v7 = v3;
    if ([v3 isEqualToString:@"RSSIdb"])
    {
      [*(id *)(a1 + 16) readRSSI];
    }
    else
    {
      uint64_t v4 = [*(id *)(a1 + 72) objectForKeyedSubscript:v7];
      id v5 = v4;
      if (v4)
      {
        [v4 readProperty:v7];
      }
      else if (*(unsigned char *)(a1 + 9))
      {
        uint64_t v6 = +[NSError hk_error:310 description:@"Unknown property"];
        sub_5CA8(a1, 0, v7, v6);

        [*(id *)(a1 + 80) removeObjectForKey:v7];
      }
    }
    id v3 = v7;
  }
}

void sub_6820(uint64_t a1)
{
}

void sub_6830(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v20 = objc_alloc((Class)HKDevice);
    uint64_t v4 = *(void *)(a1 + 24);
    id v5 = [v3 manufacturerName];
    uint64_t v6 = [v3 modelNumber];
    id v7 = [v3 hardwareRevision];
    uint64_t v8 = [v3 firmwareRevision];
    id v9 = [v3 softwareRevision];
    long long v10 = [*(id *)(a1 + 16) identifier];
    long long v11 = [v10 UUIDString];
    id v12 = [v20 initWithName:v4 manufacturer:v5 model:v6 hardwareVersion:v7 firmwareVersion:v8 softwareVersion:v9 localIdentifier:v11 UDIDeviceIdentifier:0];
    long long v13 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v12;

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v14 = *(id *)(a1 + 40);
    id v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        long long v18 = 0;
        do
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          long long v19 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(*((void *)&v21 + 1) + 8 * (void)v18)];
          [v19 deviceInformationSetOnPeripheral];

          long long v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v16);
    }
  }
}

void sub_6C14(uint64_t a1)
{
}

void sub_6D18(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) services];
  if (v2)
  {
    id v3 = (void *)v2;
    uint64_t v4 = [*(id *)(a1 + 32) services];
    id v5 = [v4 count];

    if (v5)
    {
      uint64_t v6 = [*(id *)(a1 + 32) services];
      id v7 = NSStringFromSelector("UUID");
      v55 = [v6 valueForKey:v7];

      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      uint64_t v8 = [*(id *)(a1 + 32) services];
      id v9 = [v8 countByEnumeratingWithState:&v77 objects:v85 count:16];
      if (v9)
      {
        id v10 = v9;
        char v54 = 0;
        uint64_t v57 = *(void *)v78;
        v53 = v71;
        id obj = v8;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v78 != v57) {
              objc_enumerationMutation(obj);
            }
            id v12 = *(void **)(*((void *)&v77 + 1) + 8 * i);
            long long v13 = [v12 UUID];
            id v14 = (objc_class *)HDHealthServiceClassForCBUUID(v13);
            if (v14)
            {
              id v15 = v14;
              id v16 = [*(id *)(*(void *)(a1 + 40) + 40) objectForKeyedSubscript:v13];
              if (!v16)
              {
                id v17 = [v15 alloc];
                id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48));
                uint64_t v19 = *(void *)(a1 + 40);
                id v20 = objc_loadWeakRetained((id *)(v19 + 56));
                id v16 = [v17 initWithServiceManager:WeakRetained peripheral:v19 advertisementData:0 profile:v20];

                [*(id *)(*(void *)(a1 + 40) + 40) setObject:v16 forKeyedSubscript:v13];
              }
              long long v75 = 0u;
              long long v76 = 0u;
              long long v73 = 0u;
              long long v74 = 0u;
              long long v21 = [(id)objc_opt_class() implementedProperties];
              id v22 = [v21 countByEnumeratingWithState:&v73 objects:v84 count:16];
              if (v22)
              {
                id v23 = v22;
                uint64_t v24 = *(void *)v74;
                do
                {
                  for (j = 0; j != v23; j = (char *)j + 1)
                  {
                    if (*(void *)v74 != v24) {
                      objc_enumerationMutation(v21);
                    }
                    [*(id *)(*(void *)(a1 + 40) + 72) setObject:v16 forKeyedSubscript:*(void *)(*((void *)&v73 + 1) + 8 * (void)j)];
                  }
                  id v23 = [v21 countByEnumeratingWithState:&v73 objects:v84 count:16];
                }
                while (v23);
              }

              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v26 = v16;
                v70[0] = _NSConcreteStackBlock;
                v70[1] = 3221225472;
                v71[0] = sub_73A0;
                v71[1] = &unk_608E8;
                v71[2] = *(void *)(a1 + 40);
                id v16 = v26;
                id v72 = v16;
                [v16 performWhenDeviceInformationHasBeenLoaded:v70];
                v27 = +[HDFitnessMachineService serviceUUID];
                unsigned int v28 = [v55 containsObject:v27];

                if (v28) {
                  [v16 setFetchLimitedCharacteristics:1];
                }

                char v54 = 1;
              }
            }
            else
            {
              id v16 = 0;
            }
            [*(id *)(a1 + 32) discoverCharacteristics:0 forService:v12];
          }
          id v10 = [obj countByEnumeratingWithState:&v77 objects:v85 count:16];
        }
        while (v10);

        if (v54) {
          goto LABEL_29;
        }
      }
      else
      {
      }
      sub_6830(*(void *)(a1 + 40), 0);
LABEL_29:
    }
  }
  *(unsigned char *)(*(void *)(a1 + 40) + 9) = 1;
  id v29 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48));
  v30 = [*(id *)(a1 + 32) services];
  [v29 discoveredServices:v30 forPeripheral:*(void *)(a1 + 32)];

  if ([*(id *)(*(void *)(a1 + 40) + 80) count])
  {
    v31 = [*(id *)(*(void *)(a1 + 40) + 80) allKeys];
    v32 = +[NSMutableSet setWithArray:v31];

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v33 = *(id *)(*(void *)(a1 + 40) + 40);
    v34 = (char *)[v33 countByEnumeratingWithState:&v66 objects:v83 count:16];
    if (v34)
    {
      v35 = v34;
      uint64_t v36 = *(void *)v67;
      do
      {
        for (k = 0; k != v35; ++k)
        {
          if (*(void *)v67 != v36) {
            objc_enumerationMutation(v33);
          }
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          v38 = [(id)objc_opt_class() implementedProperties];
          id v39 = [v38 countByEnumeratingWithState:&v62 objects:v82 count:16];
          if (v39)
          {
            id v40 = v39;
            uint64_t v41 = *(void *)v63;
            do
            {
              for (m = 0; m != v40; m = (char *)m + 1)
              {
                if (*(void *)v63 != v41) {
                  objc_enumerationMutation(v38);
                }
                [v32 removeObject:*(void *)(*((void *)&v62 + 1) + 8 * (void)m)];
              }
              id v40 = [v38 countByEnumeratingWithState:&v62 objects:v82 count:16];
            }
            while (v40);
          }
        }
        v35 = (char *)[v33 countByEnumeratingWithState:&v66 objects:v83 count:16];
      }
      while (v35);
    }

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v43 = v32;
    id v44 = [v43 countByEnumeratingWithState:&v58 objects:v81 count:16];
    if (v44)
    {
      id v45 = v44;
      uint64_t v46 = *(void *)v59;
      do
      {
        for (n = 0; n != v45; n = (char *)n + 1)
        {
          if (*(void *)v59 != v46) {
            objc_enumerationMutation(v43);
          }
          v48 = *(void **)(*((void *)&v58 + 1) + 8 * (void)n);
          uint64_t v49 = *(void *)(a1 + 40);
          v50 = +[NSError hk_error:310, @"Property %@ not supported", v48, v53 format];
          sub_5CA8(v49, 0, v48, v50);
        }
        id v45 = [v43 countByEnumeratingWithState:&v58 objects:v81 count:16];
      }
      while (v45);
    }

    v51 = *(void **)(*(void *)(a1 + 40) + 80);
    v52 = [v43 allObjects];
    [v51 removeObjectsForKeys:v52];
  }
}

void sub_73A0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 64);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_7434;
  v3[3] = &unk_608E8;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

void sub_7434(uint64_t a1)
{
}

void sub_75BC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) UUID];
  if (v2)
  {
    id v3 = [*(id *)(*(void *)(a1 + 40) + 40) objectForKeyedSubscript:v2];
    if (v3)
    {
      uint64_t v4 = *(void *)(a1 + 48);
      id v5 = [*(id *)(a1 + 32) characteristics];
      [v3 peripheral:v4 didDiscoverCharacteristics:v5];
    }
    else
    {
      uint64_t v6 = +[CBUUID UUIDWithString:@"1800"];
      unsigned int v7 = [v2 isEqual:v6];

      if (v7)
      {
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id obj = [*(id *)(a1 + 32) characteristics];
        id v8 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v48;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v48 != v10) {
                objc_enumerationMutation(obj);
              }
              id v12 = *(void **)(*((void *)&v47 + 1) + 8 * i);
              long long v13 = [v12 UUID];
              id v14 = +[CBUUID UUIDWithString:@"2A00"];
              unsigned int v15 = [v13 isEqual:v14];

              if (v15)
              {
                [*(id *)(a1 + 48) readValueForCharacteristic:v12];
                _HKInitializeLogging();
                id v16 = HKLogServices;
                if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  char v54 = v12;
                  _os_log_debug_impl(&dword_0, v16, OS_LOG_TYPE_DEBUG, "|>- Device Name Characteristic: %@", buf, 0xCu);
                }
              }
            }
            id v9 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
          }
          while (v9);
        }

        id v3 = 0;
      }
    }
    id v17 = +[NSMutableArray array];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v18 = [*(id *)(a1 + 32) characteristics];
    id v19 = [v18 countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v44;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v44 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = [*(id *)(*((void *)&v43 + 1) + 8 * (void)j) UUID];
          uint64_t v24 = [v23 UUIDString];
          [v17 addObject:v24];
        }
        id v20 = [v18 countByEnumeratingWithState:&v43 objects:v52 count:16];
      }
      while (v20);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48));
    id v26 = [*(id *)(a1 + 48) identifier];
    v27 = [*(id *)(a1 + 32) UUID];
    unsigned int v28 = [v27 UUIDString];
    [WeakRetained discoveredCharacteristics:v17 forDevice:v26 service:v28];
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v29 = *(id *)(*(void *)(a1 + 40) + 80);
  id v30 = [v29 countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v40;
    do
    {
      for (k = 0; k != v31; k = (char *)k + 1)
      {
        if (*(void *)v40 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = *(void *)(*((void *)&v39 + 1) + 8 * (void)k);
        v35 = [*(id *)(*(void *)(a1 + 40) + 72) objectForKeyedSubscript:v34];
        uint64_t v36 = [(id)objc_opt_class() serviceUUID];
        unsigned int v37 = [v36 isEqual:v2];

        if (v37) {
          [v35 readProperty:v34];
        }
      }
      id v31 = [v29 countByEnumeratingWithState:&v39 objects:v51 count:16];
    }
    while (v31);
  }
}

void sub_7CAC(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 40) objectForKeyedSubscript:a1[5]];
  if (v2)
  {
    id v3 = v2;
    [v2 peripheral:a1[6] didUpdateValueForCharacteristic:a1[7] updateTime:a1[8] error:a1[9]];
    uint64_t v2 = v3;
  }
}

void sub_7ECC(void *a1)
{
  uint64_t v2 = a1 + 5;
  id v3 = [*(id *)(a1[4] + 40) objectForKeyedSubscript:a1[5]];
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 peripheral:a1[6] didWriteValueForCharacteristic:a1[7] error:a1[8]];
  }
  else
  {
    _HKInitializeLogging();
    id v5 = HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEBUG)) {
      sub_3F9D8(v2, v5);
    }
  }
}

void sub_80FC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void *sub_8604(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = objc_alloc_init(HDGymKitWorkoutAnalyticEvent);
    id v3 = (void *)v1[2];
    v1[2] = v2;

    uint64_t v4 = +[HKPersistentTimer timerWithKey:@"GymKitTimeToCompleteAuthorize"];
    id v5 = (void *)v1[1];
    v1[1] = v4;

    uint64_t v6 = (void *)v1[1];
    return [v6 clear];
  }
  return result;
}

void sub_8688(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = [*(id *)(a1 + 8) timerValue];

    if (v2)
    {
      id v3 = [*(id *)(a1 + 8) elapsedSeconds];
      uint64_t v4 = *(void **)(a1 + 16);
      [v4 setTimeToBeginExperience:v3];
    }
    else
    {
      _HKInitializeLogging();
      id v5 = HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
        sub_3FA68(v5);
      }
    }
  }
}

char *sub_87EC(char *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (objc_msgSend(v3, "hk_isHealthKitError"))
    {
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v6 = [v4 domain];
      unsigned __int8 v7 = [v6 isEqualToString:@"NFCError"];

      if (v7)
      {
        uint64_t v5 = 10000;
      }
      else
      {
        id v8 = [v4 domain];
        unsigned __int8 v9 = [v8 isEqualToString:@"CBErrorDomain"];

        if (v9)
        {
          uint64_t v5 = 20000;
        }
        else
        {
          uint64_t v10 = [v4 domain];
          unsigned __int8 v11 = [v10 isEqualToString:@"CBATTErrorDomain"];

          if (v11)
          {
            uint64_t v5 = 30000;
          }
          else
          {
            id v12 = [v4 domain];
            unsigned int v13 = [v12 isEqualToString:@"CBInternalErrorDomain"];

            if (v13) {
              uint64_t v5 = 40000;
            }
            else {
              uint64_t v5 = 990000;
            }
          }
        }
      }
    }
    a1 = (char *)[v4 code] + v5;
  }

  return a1;
}

id *sub_91A0(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)_HDFTMProducerMetricTracker;
    unsigned __int8 v7 = (id *)objc_msgSendSuper2(&v11, "init");
    a1 = v7;
    if (v7)
    {
      *((unsigned char *)v7 + 33) = 0;
      id v8 = [v5 copy];
      id v9 = a1[2];
      a1[2] = v8;

      objc_storeStrong(a1 + 3, a3);
    }
  }

  return a1;
}

void *sub_923C(void *result)
{
  if (result)
  {
    *((unsigned char *)result + 33) = 1;
    if (!*((unsigned char *)result + 32))
    {
      if (result[1]) {
        return [(id)result[1] restart];
      }
      else {
        return sub_9268(result);
      }
    }
  }
  return result;
}

void *sub_9268(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    id v2 = [objc_alloc((Class)_HKExpiringCompletionTimer) initWithCompletion:&stru_609A8];
    id v3 = (void *)v1[1];
    v1[1] = v2;

    uint64_t v4 = (void *)v1[1];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_9318;
    v5[3] = &unk_60820;
    v5[4] = v1;
    return [v4 startWithTimeoutInterval:v5 handler:30.0];
  }
  return result;
}

void sub_9318(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_938C;
  block[3] = &unk_60820;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t sub_938C(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 33) = 0;
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
}

void sub_94C8(uint64_t a1, uint64_t a2)
{
}

void sub_94D0(uint64_t a1)
{
  if (a1)
  {
    id v2 = +[NSUserDefaults standardUserDefaults];
    id v6 = [v2 persistentDomainForName:kHKPrivacyPreferencesDomain];

    id v3 = [v6 objectForKeyedSubscript:kHKPrivacyPreferencesKeyEnableHeartRate];
    uint64_t v4 = v3;
    if (v3) {
      unsigned __int8 v5 = [v3 BOOLValue];
    }
    else {
      unsigned __int8 v5 = 1;
    }
    *(unsigned char *)(a1 + 64) = v5;
  }
}

id sub_95DC(uint64_t a1)
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    id v2 = [WeakRetained serviceManager];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void sub_96A8(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 16) = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_9760;
  v6[3] = &unk_60820;
  v6[4] = *(void *)(a1 + 32);
  id v2 = objc_retainBlock(v6);
  id v3 = sub_91A0((id *)[_HDFTMProducerMetricTracker alloc], v2, *(void **)(*(void *)(a1 + 32) + 8));
  uint64_t v4 = *(void *)(a1 + 32);
  unsigned __int8 v5 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v3;
}

void sub_9760(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    _HKInitializeLogging();
    id v2 = HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Eurotas timeout fired", v4, 2u);
    }
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      sub_9A00(v3, 0, 0);
    }
  }
}

void sub_9874(uint64_t a1)
{
  id v2 = +[HKUnit kilocalorieUnit];
  id obj = +[HKQuantity quantityWithUnit:v2 doubleValue:0.0];

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), obj);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), obj);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    sub_9A00(v3, 0, 0);
  }
}

void sub_99BC(uint64_t a1)
{
  sub_9A00(*(void *)(a1 + 32), *(void **)(a1 + 40), 1);
  uint64_t v2 = *(void *)(a1 + 32);

  sub_9B2C(v2);
}

void sub_9A00(uint64_t a1, void *a2, char a3)
{
  unsigned __int8 v5 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (*(void *)(a1 + 16) == HKHealthServiceSessionIdentifierInvalid)
    {
      _HKInitializeLogging();
      id v6 = HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Not updating fitness machine because data producer is disconnected", v8, 2u);
      }
      if (v5) {
        v5[2](v5, 0);
      }
    }
    else
    {
      unsigned __int8 v7 = sub_A214((dispatch_queue_t *)a1);
      if (v7 && ((a3 & 1) != 0 || ([*(id *)(a1 + 72) isEqual:v7] & 1) == 0))
      {
        sub_A394(a1, v7, v5);
        objc_storeStrong((id *)(a1 + 72), v7);
      }
      else if (v5)
      {
        v5[2](v5, 0);
      }
    }
  }
}

void sub_9B2C(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    *(void *)(a1 + 16) = 0;
    uint64_t v2 = *(id **)(a1 + 56);
    if (v2)
    {
      [v2[1] invalidate];
      uint64_t v2 = *(id **)(a1 + 56);
    }
    *(void *)(a1 + 56) = 0;

    uint64_t v3 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

    uint64_t v4 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;

    unsigned __int8 v5 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = 0;

    id v6 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;
  }
}

void sub_9C38(uint64_t a1)
{
}

void sub_9CB4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 56);
  if (v1)
  {
    *(unsigned char *)(v1 + 32) = 1;
    [*(id *)(v1 + 8) invalidate];
    uint64_t v2 = *(void **)(v1 + 8);
    *(void *)(v1 + 8) = 0;
  }
}

void *sub_9D84(void *result)
{
  uint64_t v1 = *(void *)(result[4] + 56);
  if (v1)
  {
    [*(id *)(v1 + 8) invalidate];
    result = sub_9268((void *)v1);
    *(unsigned char *)(v1 + 32) = 0;
  }
  return result;
}

uint64_t sub_9E6C(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 16) != 0;
  return result;
}

void sub_9FE8(uint64_t a1)
{
}

void sub_9FF8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!a1) {
    goto LABEL_20;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v8)
  {

    goto LABEL_20;
  }
  id v9 = v8;
  char v10 = 0;
  uint64_t v11 = *(void *)v26;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v26 != v11) {
        objc_enumerationMutation(v7);
      }
      unsigned int v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      id v14 = (char *)objc_msgSend(v13, "code", (void)v25);
      if (v14 == (unsigned char *)&dword_4 + 1)
      {
        id v19 = [v7 objectForKeyedSubscript:v13];
        uint64_t v20 = [v19 mostRecentQuantity];
        uint64_t v21 = *(void **)(a1 + 40);
        *(void *)(a1 + 40) = v20;

        id v22 = [v7 objectForKeyedSubscript:v13];
        uint64_t v23 = [v22 averageQuantity];
        uint64_t v24 = *(void **)(a1 + 48);
        *(void *)(a1 + 48) = v23;

        sub_923C(*(void **)(a1 + 56));
      }
      else
      {
        if (v14 == (unsigned char *)&dword_8 + 1)
        {
          unsigned int v15 = [v7 objectForKeyedSubscript:v13];
          uint64_t v18 = [v15 sumQuantity];
          id v17 = *(void **)(a1 + 32);
          *(void *)(a1 + 32) = v18;
        }
        else
        {
          if (v14 != (unsigned char *)&dword_8 + 2) {
            continue;
          }
          unsigned int v15 = [v7 objectForKeyedSubscript:v13];
          uint64_t v16 = [v15 sumQuantity];
          id v17 = *(void **)(a1 + 24);
          *(void *)(a1 + 24) = v16;
        }
      }
      char v10 = 1;
    }
    id v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v9);

  if (v10) {
    sub_9A00(a1, 0, 0);
  }
LABEL_20:
}

id *sub_A214(dispatch_queue_t *a1)
{
  uint64_t v1 = (id *)a1;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[1]);
    uint64_t v2 = (unsigned __int16)kHDEurotasDataValueUnavailable;
    uint64_t v3 = +[HKUnit kilocalorieUnit];
    unsigned __int16 v4 = kHDEurotasDataValueUnavailable;
    unsigned __int16 v5 = kHDEurotasDataValueUnavailable;
    if (v1[3])
    {
      unsigned __int16 v5 = _HKWorkoutFlooredValueForQuantity();
      id v6 = [v1[3] _quantityByAddingQuantity:v1[4]];
      unsigned __int16 v4 = _HKWorkoutFlooredValueForQuantity();
    }
    id v7 = +[HKUnit unitFromString:@"count/min"];
    if (*((unsigned char *)v1 + 64))
    {
      id v8 = v1[7];
      uint64_t v9 = (unsigned __int16)kHDEurotasDataValueUnavailable;
      if (v8)
      {
        uint64_t v9 = (unsigned __int16)kHDEurotasDataValueUnavailable;
        if (v8[33])
        {
          id v10 = v1[5];
          uint64_t v9 = (unsigned __int16)kHDEurotasDataValueUnavailable;
          if (v10)
          {
            [v10 doubleValueForUnit:v7];
            uint64_t v9 = (int)(v11 + 0.5);
          }
        }
      }
    }
    else
    {
      uint64_t v9 = (unsigned __int16)kHDEurotasDataValueDisabled;
    }
    id v12 = v1[6];
    if (v12)
    {
      [v12 doubleValueForUnit:v7];
      uint64_t v2 = (int)(v13 + 0.5);
    }
    uint64_t v1 = [[HDEurotasData alloc] initForWriting];
    [v1 addActiveEnergy:v5];
    [v1 addTotalEnergy:v4];
    [v1 addHeartRate:v9];
    [v1 addAverageHeartRate:v2];
  }

  return v1;
}

void sub_A394(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    _HKInitializeLogging();
    id v7 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = a1;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "%{public}@: Sending data to Fitness Machine: %@", buf, 0x16u);
    }
    id v8 = sub_95DC(a1);
    uint64_t v9 = *(void *)(a1 + 16);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_A4FC;
    v10[3] = &unk_60A48;
    id v11 = v6;
    [v8 writeCharacteristic:v5 onSession:v9 expectResponse:0 completion:v10];
  }
}

void sub_A4FC(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      sub_3FAAC((uint64_t)v5, v6);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v5);
  }
}

void sub_B51C(uint64_t a1)
{
  sub_B590(*(void *)(a1 + 32));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = *(dispatch_queue_t **)(a1 + 32);
  uint64_t v3 = sub_B62C(v2);
  [v4 registerDataCollector:v2 state:v3];
}

id sub_B590(uint64_t a1)
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    uint64_t v2 = [WeakRetained dataCollectionManager];
    uint64_t v3 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate];
    id v4 = [v2 aggregatorForType:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

dispatch_queue_t *sub_B62C(dispatch_queue_t *a1)
{
  if (a1)
  {
    uint64_t v2 = a1;
    dispatch_assert_queue_V2(a1[2]);
    dispatch_queue_t v3 = v2[3];
    if (v3 == (dispatch_queue_t)((char *)&dword_0 + 2)) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = v3 == (dispatch_queue_t)((char *)&dword_0 + 1);
    }
    a1 = (dispatch_queue_t *)[objc_alloc((Class)HKDataCollectorState) initWithType:v4 priority:HKDataCollectorPriorityDefault + 10];
    uint64_t v1 = vars8;
  }
  return a1;
}

void sub_B6A4(uint64_t a1, void *a2)
{
  if (a1)
  {
    dispatch_queue_t v3 = *(NSObject **)(a1 + 16);
    id v4 = a2;
    dispatch_assert_queue_V2(v3);
    id v5 = [v4 copy];

    id v6 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v5;

    sub_B718(a1);
  }
}

void sub_B718(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if ([*(id *)(a1 + 32) collectionType] == (char *)&dword_0 + 2
      || [*(id *)(a1 + 40) count])
    {
      sub_B7A0(a1);
    }
    else
    {
      sub_B994(a1);
    }
  }
}

void sub_B7A0(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (!*(void *)(a1 + 24))
    {
      id v2 = [*(id *)(a1 + 40) count];
      _HKInitializeLogging();
      dispatch_queue_t v3 = HKLogDataCollection;
      BOOL v4 = os_log_type_enabled(HKLogDataCollection, OS_LOG_TYPE_INFO);
      if (v2)
      {
        if (v4)
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v11 = a1;
          _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%{public}@: Starting BTLE heart rate data data collection with requested one-shot services.", buf, 0xCu);
        }
        id v5 = *(id *)(a1 + 40);
        goto LABEL_7;
      }
      if (v4)
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v11 = a1;
        _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%{public}@: Starting BTLE heart rate data data collection with all known services.", buf, 0xCu);
      }
      id v9 = 0;
      sub_CAD0(a1, (uint64_t)&v9);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      id v6 = v9;
      if (v5)
      {
        if ([v5 count])
        {

LABEL_7:
          *(void *)(a1 + 24) = 1;
          if ((sub_C320(a1, v5) & 1) == 0) {
            *(void *)(a1 + 24) = 0;
          }
          goto LABEL_19;
        }
        _HKInitializeLogging();
        id v8 = HKLogDataCollection;
        if (os_log_type_enabled(HKLogDataCollection, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v11 = a1;
          _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%{public}@: No paired BTLE HR devices when collection is requested.", buf, 0xCu);
        }
      }
      else
      {
        _HKInitializeLogging();
        uint64_t v7 = HKLogDataCollection;
        if (os_log_type_enabled(HKLogDataCollection, OS_LOG_TYPE_ERROR)) {
          sub_3FB24(a1, (uint64_t)v6, v7);
        }
      }

LABEL_19:
    }
  }
}

void sub_B994(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (*(void *)(a1 + 24))
    {
      _HKInitializeLogging();
      id v2 = HKLogDataCollection;
      if (os_log_type_enabled(HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v10 = a1;
        _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopping BTLE heart rate data data collection.", buf, 0xCu);
      }
      *(void *)(a1 + 24) = 0;
      dispatch_queue_t v3 = [*(id *)(a1 + 48) allValues];
      sub_BFD0(a1, v3);

      BOOL v4 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = 0;

      if (*(void *)(a1 + 56))
      {
        id v5 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
        id v8 = v5;
        id v6 = +[NSArray arrayWithObjects:&v8 count:1];
        sub_BFD0(a1, v6);

        uint64_t v7 = *(void **)(a1 + 56);
        *(void *)(a1 + 56) = 0;

        *(void *)(a1 + 64) = 0;
        sub_C100(a1);
      }
    }
  }
}

void sub_BB00(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v11 = a2;
  id v10 = a6;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (a4 != 6)
    {
      if (a4 == 7) {
        sub_BB9C(a1, v11, a3);
      }
      else {
        sub_BD9C(a1, v11);
      }
    }
  }
}

void sub_BB9C(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    uint64_t v7 = [*(id *)(a1 + 48) objectForKeyedSubscript:v6];

    _HKInitializeLogging();
    id v8 = HKLogDataCollection;
    if (v7)
    {
      if (os_log_type_enabled(HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v16 = a1;
        __int16 v17 = 2114;
        id v18 = v6;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Heart rate service %{public}@ connected.", buf, 0x16u);
      }
      objc_storeStrong((id *)(a1 + 56), a2);
      *(void *)(a1 + 64) = a3;
      [*(id *)(a1 + 48) removeObjectForKey:v6];
      id v9 = [*(id *)(a1 + 48) allValues];
      sub_BFD0(a1, v9);

      id v10 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = 0;

      *(void *)(a1 + 24) = 2;
      sub_C100(a1);
    }
    else
    {
      if (os_log_type_enabled(HKLogDataCollection, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        uint64_t v16 = a1;
        __int16 v17 = 2114;
        id v18 = v6;
        __int16 v19 = 2114;
        uint64_t v20 = v11;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%{public}@: Service %{public}@ connected but will be ignored (not in our pending session list: %{public}@)", buf, 0x20u);
      }
      id v12 = +[NSNumber numberWithUnsignedInteger:a3];
      __int16 v14 = v12;
      uint64_t v13 = +[NSArray arrayWithObjects:&v14 count:1];
      sub_BFD0(a1, v13);
    }
  }
}

void sub_BD9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    id v4 = *(id *)(a1 + 56);
    if (v4) {
      BOOL v5 = v4 == v3;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5 || (objc_msgSend(v3, "isEqual:") & 1) != 0)
    {
      _HKInitializeLogging();
      id v6 = HKLogDataCollection;
      if (os_log_type_enabled(HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v17 = a1;
        __int16 v18 = 2114;
        id v19 = v3;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Heart rate service %{public}@ disconnected.", buf, 0x16u);
      }
      uint64_t v7 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = 0;

      *(void *)(a1 + 64) = 0;
      if ([*(id *)(a1 + 40) containsObject:v3])
      {
        _HKInitializeLogging();
        id v8 = HKLogDataCollection;
        if (os_log_type_enabled(HKLogDataCollection, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v17 = a1;
          __int16 v18 = 2114;
          id v19 = v3;
          _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%{public}@: One shot service %{public}@ disconnected; clearing one-shot service request list.",
            buf,
            0x16u);
        }
        id v9 = *(void **)(a1 + 40);
        id v15 = v3;
        id v10 = +[NSArray arrayWithObjects:&v15 count:1];
        uint64_t v11 = [v9 arrayByExcludingObjectsInArray:v10];
        id v12 = *(void **)(a1 + 40);
        *(void *)(a1 + 40) = v11;
      }
      *(void *)(a1 + 24) = 0;
      sub_C100(a1);
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v13 = HKLogDataCollection;
      if (os_log_type_enabled(HKLogDataCollection, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138543874;
        uint64_t v17 = a1;
        __int16 v18 = 2114;
        id v19 = v3;
        __int16 v20 = 2114;
        uint64_t v21 = v14;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "%{public}@: Service %{public}@ disconnected but will be ignored (does not match our connected service: %{public}@)", buf, 0x20u);
      }
    }
  }
}

void sub_BFD0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    BOOL v5 = [WeakRetained serviceManager];

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v3;
    id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(v5, "disconnectHealthService:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v10), "unsignedIntegerValue", (void)v11));
          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

uint64_t sub_C100(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = (dispatch_queue_t *)result;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(result + 16));
    id v2 = sub_B590((uint64_t)v1);
    id v3 = sub_B62C(v1);
    [v2 dataCollector:v1 didChangeState:v3];

    return sub_B718(v1);
  }
  return result;
}

void sub_C21C(uint64_t a1)
{
  _HKInitializeLogging();
  id v2 = HKLogDataCollection;
  if (os_log_type_enabled(HKLogDataCollection, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v11 = v3;
    __int16 v12 = 2114;
    uint64_t v13 = v4;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%{public}@: Client requested one-shot collection for %{public}@.", buf, 0x16u);
  }
  BOOL v5 = *(void **)(*(void *)(a1 + 32) + 40);
  if (v5)
  {
    uint64_t v6 = [v5 arrayByAddingObject:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v6 = +[NSArray arrayWithObjects:&v9 count:1];
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  sub_B718(*(void *)(a1 + 32));
}

uint64_t sub_C320(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v21 = v3;
  if (a1)
  {
    uint64_t v4 = v3;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (!*(void *)(a1 + 48))
    {
      id v5 = objc_alloc_init((Class)NSMutableDictionary);
      uint64_t v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;
    }
    _HKInitializeLogging();
    uint64_t v7 = (void *)HKLogDataCollection;
    if (os_log_type_enabled(HKLogDataCollection, OS_LOG_TYPE_INFO))
    {
      id v8 = v7;
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = a1;
      __int16 v34 = 2048;
      id v35 = [v4 count];
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%{public}@: Attempting to connect to %ld heart rate services.", buf, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    uint64_t v24 = [WeakRetained serviceManager];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = v4;
    id v10 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v10)
    {
      id v11 = v10;
      char v12 = 0;
      uint64_t v23 = *(void *)v29;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v29 != v23) {
            objc_enumerationMutation(obj);
          }
          long long v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v26[4] = a1;
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_C698;
          v27[3] = &unk_60A98;
          v27[4] = a1;
          v27[5] = v14;
          id v25 = 0;
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472;
          v26[2] = sub_C770;
          v26[3] = &unk_60AC0;
          id v15 = [v24 connectHealthService:v14 sessionHandler:v27 dataHandler:v26 error:&v25];
          id v16 = v25;
          if (v15)
          {
            __int16 v18 = *(void **)(a1 + 48);
            id v19 = +[NSNumber numberWithUnsignedInteger:v15];
            [v18 setObject:v19 forKey:v14];

            char v12 = 1;
          }
          else
          {
            _HKInitializeLogging();
            uint64_t v17 = HKLogDataCollection;
            if (os_log_type_enabled(HKLogDataCollection, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543874;
              uint64_t v33 = a1;
              __int16 v34 = 2114;
              id v35 = v14;
              __int16 v36 = 2114;
              id v37 = v16;
              _os_log_error_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed to connect to health service '%{public}@': %{public}@", buf, 0x20u);
            }
          }
        }
        id v11 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
      }
      while (v11);
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12 & 1;
}

void sub_C698(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  id v9 = a5;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  long long v10 = *(_OWORD *)(a1 + 32);
  id v11 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v13[2] = sub_C758;
  v13[3] = &unk_60A70;
  long long v14 = v10;
  uint64_t v16 = a2;
  uint64_t v17 = a3;
  char v18 = a4;
  id v15 = v9;
  id v12 = v9;
  dispatch_async(v11, v13);
}

void sub_C758(uint64_t a1)
{
}

void sub_C770(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(NSObject **)(v8 + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_C838;
  block[3] = &unk_607A8;
  block[4] = v8;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void sub_C838(uint64_t a1)
{
}

void sub_C848(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    _HKInitializeLogging();
    id v7 = HKLogDataCollection;
    if (os_log_type_enabled(HKLogDataCollection, OS_LOG_TYPE_DEBUG)) {
      sub_3FC1C((uint64_t)v5, v7);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = objc_alloc((Class)NSDateInterval);
      id v9 = +[NSDate date];
      id v10 = [v8 initWithStartDate:v9 duration:0.0];
      id v11 = [v5 generateDatums:v10];

      id v12 = [v11 objectForKeyedSubscript:&off_63E58];
      if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (v6)
        {
          if (*(void *)(a1 + 56))
          {
            id v13 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate];
            id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
            id v15 = [WeakRetained dataCollectionManager];
            uint64_t v16 = [v15 aggregatorForType:v13];

            __int16 v34 = v12;
            uint64_t v17 = +[NSArray arrayWithObjects:&v34 count:1];
            [v16 dataCollector:a1 didCollectSensorData:v17 device:v6];
          }
          goto LABEL_14;
        }
        _HKInitializeLogging();
        long long v26 = HKLogDataCollection;
        if (os_log_type_enabled(HKLogDataCollection, OS_LOG_TYPE_ERROR)) {
          goto LABEL_13;
        }
      }
      else
      {
        _HKInitializeLogging();
        long long v26 = HKLogDataCollection;
        if (os_log_type_enabled(HKLogDataCollection, OS_LOG_TYPE_ERROR)) {
LABEL_13:
        }
          sub_3FBAC(v26, v27, v28, v29, v30, v31, v32, v33);
      }
LABEL_14:

      goto LABEL_15;
    }
    _HKInitializeLogging();
    char v18 = HKLogDataCollection;
    if (os_log_type_enabled(HKLogDataCollection, OS_LOG_TYPE_ERROR)) {
      sub_3FBE4(v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }
LABEL_15:
}

id sub_CAD0(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    uint64_t v4 = [WeakRetained serviceManager];
    id v5 = [v4 allServicesWithError:a2];

    id v6 = objc_msgSend(v5, "hk_filter:", &stru_60B00);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

BOOL sub_CB64(id a1, HKHealthService *a2)
{
  return [(HKHealthService *)a2 type] == 0;
}

void sub_CC24(uint64_t a1)
{
}

void sub_CDCC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id sub_D1A8(void *a1, void *a2)
{
  if (a1)
  {
    id v3 = a2;
    uint64_t v4 = (char *)[v3 length];
    id v5 = v3;
    id v6 = [v5 bytes];

    var28[0] = v6;
    if (v6 && v4)
    {
      uint64_t v7 = +[HDHealthServiceCharacteristic uint8FromData:var28 before:&v4[(void)v6]];
      if (var28[0])
      {
        a1 = +[NSNumber numberWithUnsignedChar:v7];
LABEL_11:
        uint64_t v2 = var28[6];
        goto LABEL_12;
      }
      _HKInitializeLogging();
      uint64_t v9 = (void *)HKLogServices;
      if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR)) {
        sub_3FD38(v9);
      }
    }
    else
    {
      _HKInitializeLogging();
      id v8 = (void *)HKLogServices;
      if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR)) {
        sub_3FC94(v8);
      }
    }
    a1 = 0;
    goto LABEL_11;
  }
LABEL_12:
  return a1;
}

void sub_D4D4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_D750(dispatch_queue_t *a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(a1[2]);
    unsigned __int8 v2 = sub_D860(a1);
    _HKInitializeLogging();
    id v3 = HKLogWorkouts;
    BOOL v4 = os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT);
    if (v2)
    {
      if (v4)
      {
        int v5 = 138543362;
        id v6 = a1;
        _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Handling field detect event", (uint8_t *)&v5, 0xCu);
      }
      sub_D8BC((uint64_t)a1);
    }
    else if (v4)
    {
      int v5 = 138543362;
      id v6 = a1;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring field detect event", (uint8_t *)&v5, 0xCu);
    }
  }
}

dispatch_queue_t *sub_D860(dispatch_queue_t *result)
{
  if (result)
  {
    uint64_t v1 = result;
    dispatch_assert_queue_V2(result[2]);
    result = sub_E6EC(v1);
    if (result)
    {
      if ([v1[1] isNdefTagSessionInProgress]) {
        return 0;
      }
      else {
        return (dispatch_queue_t *)(v1[4] == 0);
      }
    }
  }
  return result;
}

void sub_D8BC(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (([*(id *)(a1 + 8) isNdefTagSessionInProgress] & 1) != 0 || *(void *)(a1 + 32))
    {
      _HKInitializeLogging();
      unsigned __int8 v2 = (void *)HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v3 = *(void *)(a1 + 32);
        if (v3 > 2) {
          BOOL v4 = 0;
        }
        else {
          BOOL v4 = off_60CE0[v3];
        }
        *(_DWORD *)buf = 138543618;
        uint64_t v19 = a1;
        __int16 v20 = 2114;
        uint64_t v21 = v4;
        int v5 = v2;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Pairing has already begun. BT State: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      id v6 = [(id)a1 delegate];
      [v6 pairingManagerDidBeginPairing:a1];

      uint64_t v7 = objc_alloc_init(HDFitnessMachineSession);
      id v8 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v7;

      sub_E9B8((id *)a1, 1);
      uint64_t v9 = [(id)a1 delegate];
      id v17 = 0;
      uint64_t v10 = [v9 pairingManagerRequestsOOBData:a1 error:&v17];
      id v11 = v17;
      [*(id *)(a1 + 56) setOobInfo:v10];

      id v12 = [*(id *)(a1 + 56) oobInfo];

      if (v12)
      {
        sub_EAE8(a1);
        _HKInitializeLogging();
        id v13 = HKLogWorkouts;
        if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v19 = a1;
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting tag emulation session", buf, 0xCu);
        }
        id v14 = [*(id *)(a1 + 56) nfcConnectionHandoverData];
        id v15 = *(void **)(a1 + 8);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_EC00;
        v16[3] = &unk_60B68;
        v16[4] = a1;
        [v15 startNdefTagSessionWithBluetoothLESecureOOBData:v14 completion:v16];
        [*(id *)(a1 + 40) beginTagReadTimeout];
      }
      else
      {
        sub_EA40(a1, v11);
      }
    }
  }
}

void sub_DBC0(uint64_t a1)
{
  _HKInitializeLogging();
  unsigned __int8 v2 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v8 = 138543362;
    uint64_t v9 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Resetting pairing manager", (uint8_t *)&v8, 0xCu);
  }
  sub_DCD0(*(void *)(a1 + 32));
  *(void *)(*(void *)(a1 + 32) + 32) = 0;
  [*(id *)(*(void *)(a1 + 32) + 40) cancelAllTimers];
  [*(id *)(*(void *)(a1 + 32) + 8) endNdefTagSession];
  sub_DE40(*(void *)(a1 + 32));
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 16));
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = 0;

  sub_DF10(*(void *)(a1 + 32));
}

void sub_DCD0(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (*(void *)(a1 + 72))
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
      _HKInitializeLogging();
      uint64_t v3 = HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(a1 + 72);
        int v7 = 138543618;
        uint64_t v8 = a1;
        __int16 v9 = 2050;
        uint64_t v10 = v4;
        _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Tearing down discovery with identifier %{public}tu", (uint8_t *)&v7, 0x16u);
      }
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
      uint64_t v6 = [WeakRetained serviceManager];
      [v6 stopDiscoveryWithIdentifier:*(void *)(a1 + 72)];

      *(void *)(a1 + 72) = 0;
    }
    else
    {
      _HKInitializeLogging();
      unsigned __int8 v2 = HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 138543362;
        uint64_t v8 = a1;
        _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Discovery is invalid, so it cannot be torn down", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

void sub_DE40(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (*(void *)(a1 + 24))
    {
      _HKInitializeLogging();
      unsigned __int8 v2 = HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
      {
        int v4 = 138543362;
        uint64_t v5 = a1;
        _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Invalidating tag read assertion", (uint8_t *)&v4, 0xCu);
      }
      [*(id *)(a1 + 24) invalidate];
      uint64_t v3 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = 0;
    }
  }
}

void sub_DF10(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (sub_E6EC((dispatch_queue_t *)a1))
    {
      sub_E764(a1);
    }
    else
    {
      _HKInitializeLogging();
      unsigned __int8 v2 = (void *)HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v3 = *(void **)(a1 + 104);
        int v4 = v2;
        uint64_t v5 = _HDStringForNearFieldManagerNFCPermission((unint64_t)[v3 nfcPermission]);
        int v7 = 138543618;
        uint64_t v8 = a1;
        __int16 v9 = 2114;
        uint64_t v10 = v5;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Not enabling field detect as it's not permitted: _gymKitSettings.nfcPermission=%{public}@", (uint8_t *)&v7, 0x16u);
      }
      _HKInitializeLogging();
      uint64_t v6 = HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 138543362;
        uint64_t v8 = a1;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Ending active field detect session", (uint8_t *)&v7, 0xCu);
      }
      [*(id *)(a1 + 8) endFieldDetectSession];
    }
  }
}

void sub_E118(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) endNdefTagSession];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 40))
  {
    *(void *)(v2 + 32) = 2;
  }
  else
  {
    sub_DF10(v2);
  }
}

void sub_E1E8(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) setFieldDetectEnabled:*(void *)(a1 + 40) == 2];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(a1 + 40))
  {
    sub_DF10(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    sub_E488(v3);
  }
  else
  {
    sub_E260(v2);
    uint64_t v4 = *(void *)(a1 + 32);
    sub_E37C(v4);
  }
}

void sub_E260(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    uint64_t v2 = (char *)[*(id *)(a1 + 104) nfcPermission];
    _HKInitializeLogging();
    uint64_t v3 = HKLogWorkouts;
    BOOL v4 = os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT);
    if (v2 == (unsigned char *)&dword_0 + 2)
    {
      if (v4)
      {
        int v5 = 138543362;
        uint64_t v6 = a1;
        _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Not disabling field detect session as field detect should always be on", (uint8_t *)&v5, 0xCu);
      }
    }
    else
    {
      if (v4)
      {
        int v5 = 138543362;
        uint64_t v6 = a1;
        _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Ending field detect session", (uint8_t *)&v5, 0xCu);
      }
      [*(id *)(a1 + 40) cancelFieldDetectTimeout];
      [*(id *)(a1 + 8) endFieldDetectSession];
    }
  }
}

void sub_E37C(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (*(unsigned char *)(a1 + 96))
    {
      _HKInitializeLogging();
      uint64_t v2 = HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
      {
        int v4 = 138543362;
        uint64_t v5 = a1;
        _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Releasing express mode assertion", (uint8_t *)&v4, 0xCu);
      }
      uint64_t v3 = [*(id *)(a1 + 8) releaseSinglePollExpressModeAssertion];
      if (v3)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
          sub_3FDDC();
        }
      }
      *(unsigned char *)(a1 + 96) = 0;
    }
  }
}

void sub_E488(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (!*(unsigned char *)(a1 + 96))
    {
      if ([*(id *)(a1 + 104) nfcPermission])
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
        uint64_t v3 = [WeakRetained workoutManager];
        int v4 = [v3 currentWorkoutSessionServer];

        if ([v4 isActive] && objc_msgSend(v4, "isFirstParty"))
        {
          _HKInitializeLogging();
          uint64_t v5 = HKLogWorkouts;
          if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
          {
            int v11 = 138543362;
            uint64_t v12 = a1;
            uint64_t v6 = "%{public}@: Express mode assertion not taken because there is an active first party workout";
LABEL_18:
            _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, 0xCu);
          }
        }
        else
        {
          dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
          unsigned __int8 v7 = [*(id *)(a1 + 48) appIsActive];
          _HKInitializeLogging();
          uint64_t v5 = HKLogWorkouts;
          BOOL v8 = os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT);
          if (v7)
          {
            if (v8)
            {
              int v11 = 138543362;
              uint64_t v12 = a1;
              _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Taking express mode assertion", (uint8_t *)&v11, 0xCu);
            }
            __int16 v9 = [*(id *)(a1 + 8) startSinglePollExpressModeAssertion:120.0];
            if (v9)
            {
              _HKInitializeLogging();
              if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
                sub_3FE44();
              }
            }
            else
            {
              *(unsigned char *)(a1 + 96) = 1;
            }

            goto LABEL_21;
          }
          if (v8)
          {
            int v11 = 138543362;
            uint64_t v12 = a1;
            uint64_t v6 = "%{public}@: Express mode assertion is taken only when the Workout app is frontmost";
            goto LABEL_18;
          }
        }
LABEL_21:

        return;
      }
      _HKInitializeLogging();
      uint64_t v10 = HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543362;
        uint64_t v12 = a1;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Express mode assertion not taken because GymKit is disabled", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

dispatch_queue_t *sub_E6EC(dispatch_queue_t *result)
{
  if (result)
  {
    uint64_t v1 = result;
    dispatch_assert_queue_V2(result[2]);
    uint64_t v2 = (char *)[v1[13] nfcPermission];
    if (v2 == (unsigned char *)&dword_0 + 2)
    {
      return (dispatch_queue_t *)(&dword_0 + 1);
    }
    else if (v2 == (unsigned char *)&dword_0 + 1)
    {
      dispatch_assert_queue_V2(v1[2]);
      dispatch_queue_t v3 = v1[6];
      return (dispatch_queue_t *)[v3 appIsActive];
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void sub_E764(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    [*(id *)(a1 + 40) cancelFieldDetectTimeout];
    if ([*(id *)(a1 + 104) nfcPermission] == (char *)&dword_0 + 1) {
      [*(id *)(a1 + 40) beginFieldDetectTimeout];
    }
    unsigned int v2 = [*(id *)(a1 + 8) isFieldDetectSessionInProgress];
    _HKInitializeLogging();
    dispatch_queue_t v3 = HKLogWorkouts;
    BOOL v4 = os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT);
    if (v2)
    {
      if (v4)
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v8 = a1;
        _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Field detect session already running. Ignoring.", buf, 0xCu);
      }
    }
    else
    {
      if (v4)
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v8 = a1;
        _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting field detect session", buf, 0xCu);
      }
      uint64_t v5 = *(void **)(a1 + 8);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_E8E0;
      v6[3] = &unk_60B68;
      v6[4] = a1;
      [v5 startFieldDetectSessionWithCompletion:v6];
    }
  }
}

void sub_E8E0(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      sub_3FEAC();
    }
    uint64_t v6 = *(void *)(a1 + 32);
    unsigned __int8 v7 = *(NSObject **)(v6 + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_E9B0;
    block[3] = &unk_60820;
    block[4] = v6;
    dispatch_async(v7, block);
  }
}

void sub_E9B0(uint64_t a1)
{
}

void sub_E9B8(id *a1, uint64_t a2)
{
  if (a1)
  {
    id v4 = [a1[7] connectionState];
    [a1[7] setConnectionState:a2];
    id v5 = [a1 delegate];
    [v5 pairingManager:a1 updatedConnectionStateFromState:v4 toState:a2];

    sub_11078((uint64_t)a1, 0);
  }
}

void sub_EA40(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = *(NSObject **)(a1 + 16);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_113E4;
    v6[3] = &unk_608E8;
    v6[4] = a1;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

void sub_EAE8(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    _HKInitializeLogging();
    unsigned int v2 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      uint64_t v13 = a1;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Taking tag read assertion", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v3 = +[HDPowerAssertion powerAssertionWithIdentifier:@"Tag read assertion" timeout:0 timeoutHandler:30.0];
    id v4 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v3;

    if (!*(void *)(a1 + 24))
    {
      _HKInitializeLogging();
      id v5 = HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
        sub_3FF18(a1, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
}

void sub_EC00(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = (void *)HKLogWorkouts;
  if (a2)
  {
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void **)(v7 + 56);
      uint64_t v9 = v6;
      uint64_t v10 = [v8 nfcSessionID];
      int v19 = 138543618;
      uint64_t v20 = v7;
      __int16 v21 = 2114;
      uint64_t v22 = v10;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "(#w0) %{public}@: NFC Session ID: %{public}@", (uint8_t *)&v19, 0x16u);
    }
    _HKInitializeLogging();
    uint64_t v11 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v19 = 138543362;
      uint64_t v20 = v12;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: NFC Tag Emulation is GO", (uint8_t *)&v19, 0xCu);
    }
    _HKInitializeLogging();
    uint64_t v13 = (void *)HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = *(void **)(v14 + 56);
      uint64_t v16 = v13;
      id v17 = [v15 oobInfo];
      char v18 = [*(id *)(*(void *)(a1 + 32) + 56) nfcSessionIDData];
      int v19 = 138543874;
      uint64_t v20 = v14;
      __int16 v21 = 2112;
      uint64_t v22 = v17;
      __int16 v23 = 2114;
      uint64_t v24 = v18;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: OOB Data: %@, encodedSessionIDData=%{public}@", (uint8_t *)&v19, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      sub_3FF84();
    }
    sub_EA40(*(void *)(a1 + 32), v5);
  }
}

void sub_EE2C(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    unsigned __int8 v2 = [*(id *)(a1 + 8) isNdefTagSessionInProgress];
    _HKInitializeLogging();
    uint64_t v3 = HKLogWorkouts;
    BOOL v4 = os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT);
    if (v2)
    {
      if (v4)
      {
        int v5 = 138543362;
        uint64_t v6 = a1;
        _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopping tag vend", (uint8_t *)&v5, 0xCu);
      }
      [*(id *)(a1 + 8) endNdefTagSession];
      sub_DE40(a1);
      [*(id *)(a1 + 40) cancelTagReadTimeout];
      if (!*(void *)(a1 + 32)) {
        sub_DF10(a1);
      }
    }
    else if (v4)
    {
      int v5 = 138543362;
      uint64_t v6 = a1;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Not stopping tag vend, as we are not currently vending.", (uint8_t *)&v5, 0xCu);
    }
  }
}

void sub_F060(uint64_t a1)
{
}

void sub_F164(uint64_t a1)
{
}

void sub_F1E0(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 32) == 1)
  {
    _HKInitializeLogging();
    unsigned __int8 v2 = (void *)HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      unint64_t v4 = *(void *)(v3 + 32);
      if (v4 > 2) {
        int v5 = 0;
      }
      else {
        int v5 = off_60CE0[v4];
      }
      int v9 = 138543618;
      uint64_t v10 = v3;
      __int16 v11 = 2114;
      uint64_t v12 = v5;
      uint64_t v8 = v2;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring tag read change: bluetooth state: %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    HKSessionTrackerAriadneTrigger();
    _HKInitializeLogging();
    uint64_t v6 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 138543362;
      uint64_t v10 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "(#w0) %{public}@: NDefTag Read.", (uint8_t *)&v9, 0xCu);
    }
    *(void *)(*(void *)(a1 + 32) + 32) = 1;
    sub_F354(*(void *)(a1 + 32));
    sub_EE2C(*(void *)(a1 + 32));
  }
}

void sub_F354(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    _HKInitializeLogging();
    unsigned __int8 v2 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEBUG)) {
      sub_3FFF0(a1, v2);
    }
    sub_E9B8((id *)a1, 2);
    uint64_t v3 = [(id)a1 delegate];
    [v3 pairingManagerWillBeginPairing:a1 fitnessMachineToken:*(void *)(a1 + 56)];

    unint64_t v4 = [*(id *)(a1 + 56) fitnessMachineSessionUUID];
    +[HDWatchAppStateMonitor launchWorkoutAppIfNeededWithFitnessMachineSessionUUID:v4];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_FA1C;
    v13[3] = &unk_60BB8;
    void v13[4] = a1;
    int v5 = objc_retainBlock(v13);
    sub_DCD0(a1);
    [*(id *)(a1 + 56) setHealthService:0];
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    uint64_t v7 = [WeakRetained serviceManager];
    id v12 = 0;
    id v8 = [v7 discoverHealthServicesWithType:1 timeout:30 alwaysNotify:1 handler:v5 error:&v12];
    id v9 = v12;
    *(void *)(a1 + 72) = v8;

    _HKInitializeLogging();
    uint64_t v10 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 72);
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = a1;
      __int16 v16 = 2050;
      uint64_t v17 = v11;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Started discovery with identifier %{public}tu", buf, 0x16u);
    }
    if (!*(void *)(a1 + 72))
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
      sub_FF98((void *)a1, v9);
    }
  }
}

void sub_F66C(uint64_t a1)
{
  sub_E488(*(void *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);

  sub_DF10(v2);
}

void sub_F71C(uint64_t a1)
{
  sub_E260(*(void *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);

  sub_E37C(v2);
}

void sub_F7F0(uint64_t a1)
{
}

void sub_F7FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v4 = v3;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if ([v4 isActive] && objc_msgSend(v4, "isFirstParty")) {
      sub_E37C(a1);
    }
    else {
      sub_E488(a1);
    }
    id v3 = v4;
  }
}

void sub_F910(uint64_t a1)
{
}

void sub_FA1C(uint64_t a1, uint64_t a2, void *a3, char a4, void *a5)
{
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(NSObject **)(v11 + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_FAF8;
  block[3] = &unk_60B90;
  block[4] = v11;
  id v16 = v9;
  char v19 = a4;
  id v17 = v10;
  uint64_t v18 = a2;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v12, block);
}

void sub_FAF8(uint64_t a1, uint64_t a2)
{
}

void sub_FB0C(uint64_t a1, uint64_t a2, void *a3, int a4, void *a5)
{
  id v8 = a3;
  id v9 = a5;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    id v10 = [*(id *)(a1 + 56) healthService];

    if (!v10)
    {
      if (v9)
      {
        sub_FF98((void *)a1, v9);
        goto LABEL_33;
      }
      if (!v8 || a4)
      {
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
        id v14 = +[NSError hk_error:802 format:@"No fitness machine has been found"];
        sub_FF98((void *)a1, v14);
        [(id)a1 reset];
LABEL_32:

        goto LABEL_33;
      }
      _HKInitializeLogging();
      uint64_t v11 = (void *)HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = v11;
        id v13 = [v8 name];
        *(_DWORD *)buf = 138543618;
        uint64_t v35 = a1;
        __int16 v36 = 2114;
        id v37 = v13;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "(#w0) %{public}@: Discovered device with name: %{public}@", buf, 0x16u);
      }
      id v14 = [*(id *)(a1 + 56) nfcSessionID];
      if (!v14)
      {
        _HKInitializeLogging();
        uint64_t v31 = HKLogWorkouts;
        if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v35 = a1;
          _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring device because session has been reset", buf, 0xCu);
        }
        goto LABEL_32;
      }
      uint64_t v15 = [@"-" stringByAppendingString:v14];
      id v16 = [v8 name];
      if (([v16 hasSuffix:v15] & 1) == 0)
      {
        _HKInitializeLogging();
        uint64_t v32 = HKLogWorkouts;
        if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v35 = a1;
          __int16 v36 = 2114;
          id v37 = v16;
          _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring device with name: %{public}@", buf, 0x16u);
        }
        goto LABEL_31;
      }
      if (+[_HKBehavior isAppleInternalInstall])
      {
        if (!*(void *)(a1 + 88))
        {
          id v17 = [v8 advertisementData];
          id v18 = [v17 length];

          if (!v18)
          {
            char v19 = +[NSUserDefaults standardUserDefaults];
            uint64_t v20 = [v19 objectForKey:@"HDFitnessMachineTypeOverride"];

            id v21 = [v20 integerValue];
            if (v21)
            {
              id v22 = v21;
              _HKInitializeLogging();
              __int16 v23 = (void *)HKLogWorkouts;
              if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v24 = v23;
                uint64_t v25 = _HKStringForFitnessMachineType();
                *(_DWORD *)buf = 138543618;
                uint64_t v35 = a1;
                __int16 v36 = 2114;
                id v37 = v25;
                _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: Overriding machine type from defaults (%{public}@)", buf, 0x16u);
              }
              long long v26 = [[HDFitnessMachineSimulatorSupport alloc] initWithFitnessMachineType:v22];
              uint64_t v27 = *(void **)(a1 + 88);
              *(void *)(a1 + 88) = v26;
            }
          }
        }
      }
      [*(id *)(a1 + 88) updateAdvertisementDataForSimulation:v8];
      uint64_t v28 = [v8 advertisementData];
      uint64_t v29 = +[HDFitnessMachineService typeFromAdvertisementData:v28];

      if (v29 == 5)
      {
        uint64_t v30 = +[NSError hk_error:305 description:@"Rower fitness machine not supported"];
      }
      else
      {
        if (v29)
        {
          HKSessionTrackerAriadneTrigger();
          sub_DCD0(a1);
          [*(id *)(a1 + 56) setHealthService:v8];
          sub_10024(a1, v8, v29);
          sub_10150((dispatch_queue_t *)a1);
          uint64_t v33 = [(id)a1 delegate];
          [v33 pairingManagerReadyToConnect:a1];
          goto LABEL_30;
        }
        uint64_t v30 = +[NSError hk_error:305, @"Fitness machine type could not be discerned: %lu", 0 format];
      }
      uint64_t v33 = v30;
      sub_FF98((void *)a1, v30);
LABEL_30:

LABEL_31:
      goto LABEL_32;
    }
  }
LABEL_33:
}

void sub_FF98(void *a1, void *a2)
{
  if (a1)
  {
    id v3 = a1[2];
    id v4 = a2;
    dispatch_assert_queue_V2(v3);
    sub_11294((uint64_t)a1, v4);
    id v5 = [a1 delegate];
    [v5 pairingManager:a1 failedPairingWithError:v4];
  }
}

void sub_10024(uint64_t a1, void *a2, uint64_t a3)
{
  if (a1)
  {
    id v5 = *(NSObject **)(a1 + 16);
    id v6 = a2;
    dispatch_assert_queue_V2(v5);
    uint64_t v7 = [v6 name];
    id v8 = [v6 identifier];
    [*(id *)(a1 + 56) setFitnessMachineName:v7 type:a3 identifier:v8];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_101A8;
    v11[3] = &unk_60BE0;
    v11[4] = a1;
    sub_10238(a1, v11);
    id v9 = [(id)a1 delegate];
    [v9 pairingManager:a1 discoveredHealthService:v6 machineType:a3];

    id v10 = [(id)a1 delegate];
    [v10 pairingManagerUpdatedMachineInformation:a1];
  }
}

dispatch_queue_t *sub_10150(dispatch_queue_t *result)
{
  if (result)
  {
    uint64_t v1 = result;
    dispatch_assert_queue_V2(result[2]);
    HKSessionTrackerAriadneTrigger();
    sub_E9B8((id *)v1, 3);
    dispatch_queue_t v2 = v1[5];
    return (dispatch_queue_t *)[v2 beginUserAcceptanceTimeout];
  }
  return result;
}

void sub_101A8(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 56);
  id v4 = a2;
  id v6 = [v3 fitnessMachine];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 56) fitnessMachineSessionUUID];
  objc_msgSend(v4, "clientRemote_updatedFitnessMachine:fitnessMachineSessionUUID:", v6, v5);
}

void sub_10238(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = objc_msgSend(*(id *)(a1 + 80), "allValues", 0);
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          v3[2](v3, *(void *)(*((void *)&v9 + 1) + 8 * (void)v8));
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

void sub_10420(uint64_t a1)
{
  dispatch_queue_t v2 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v2)
  {
    id v5 = +[NSError hk_error:108 description:@"Connection intiator already registered"];
    objc_msgSend(*(id *)(a1 + 48), "clientRemote_encounteredError:", v5);
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 80) setObject:*(void *)(a1 + 48) forKeyedSubscript:*(void *)(a1 + 40)];
    id v3 = [*(id *)(*(void *)(a1 + 32) + 56) fitnessMachineSessionUUID];

    if (v3)
    {
      uint64_t v4 = *(void *)(a1 + 32);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10534;
      v6[3] = &unk_60BE0;
      v6[4] = v4;
      sub_10238(v4, v6);
    }
  }
}

void sub_10534(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [*(id *)(*(void *)(a1 + 32) + 56) connectionState];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 56) fitnessMachineSessionUUID];
  objc_msgSend(v8, "clientRemote_updatedConnectionState:fitnessMachineSessionUUID:", v3, v4);

  id v5 = [*(id *)(*(void *)(a1 + 32) + 56) fitnessMachine];

  if (v5)
  {
    id v6 = [*(id *)(*(void *)(a1 + 32) + 56) fitnessMachine];
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 56) fitnessMachineSessionUUID];
    objc_msgSend(v8, "clientRemote_updatedFitnessMachine:fitnessMachineSessionUUID:", v6, v7);
  }
}

void sub_106DC(uint64_t a1)
{
  if (sub_10828(*(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48)))
  {
    _HKInitializeLogging();
    dispatch_queue_t v2 = (void *)HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = v2;
      id v5 = _HKWorkoutActivityNameForActivityType();
      int v9 = 138543618;
      uint64_t v10 = v3;
      __int16 v11 = 2112;
      long long v12 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Permitting connection to fitness machine for activity type: %@", (uint8_t *)&v9, 0x16u);
    }
    id v6 = [*(id *)(*(void *)(a1 + 32) + 56) fitnessMachine];
    [v6 _setActivityType:*(void *)(a1 + 56)];

    uint64_t v7 = [*(id *)(a1 + 32) delegate];
    [v7 pairingManagerUpdatedMachineInformation:*(void *)(a1 + 32)];

    id v8 = [*(id *)(a1 + 32) delegate];
    [v8 pairingManagerReceivedActivityTypeAndPermission:*(void *)(a1 + 32)];
  }
}

uint64_t sub_10828(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if (sub_10A04(a1, v6, v5))
    {
      HKSessionTrackerAriadneTrigger();
      [*(id *)(a1 + 40) cancelUserAcceptanceTimeout];
      a1 = 1;
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

void sub_10968(uint64_t a1)
{
  if (sub_10828(*(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48)))
  {
    id v3 = +[NSError hk_error:800 description:@"User canceled connection"];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
    [WeakRetained pairingManager:*(void *)(a1 + 32) failedPairingWithError:v3];
  }
}

uint64_t sub_10A04(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    uint64_t v7 = [*(id *)(a1 + 80) objectForKeyedSubscript:v5];

    if (v7)
    {
      id v8 = *(void **)(a1 + 56);
      if (v8)
      {
        int v9 = [v8 fitnessMachineSessionUUID];
        unsigned __int8 v10 = [v9 isEqual:v6];

        if (v10)
        {
          a1 = 1;
          goto LABEL_10;
        }
        CFStringRef v11 = @"Incorrect session UUID";
      }
      else
      {
        CFStringRef v11 = @"No session exists";
      }
    }
    else
    {
      CFStringRef v11 = @"Unknown connection UUID";
    }
    long long v12 = +[NSError hk_error:100 format:v11];
    sub_111A8(a1, v12, v5);

    a1 = 0;
  }
LABEL_10:

  return a1;
}

void sub_10B70(uint64_t a1)
{
}

void sub_10B80(id a1, HKFitnessMachineConnectionInitiatorClientInterface *a2)
{
}

void sub_10BFC(uint64_t a1)
{
  _HKInitializeLogging();
  dispatch_queue_t v2 = (void *)HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 56);
    id v5 = v2;
    id v6 = [v4 fitnessMachine];
    *(_DWORD *)buf = 138543618;
    uint64_t v10 = v3;
    __int16 v11 = 2114;
    long long v12 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: updatedFitnessMachine %{public}@", buf, 0x16u);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10D34;
  v8[3] = &unk_60BE0;
  v8[4] = v7;
  sub_10238(v7, v8);
}

void sub_10D34(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 56);
  id v4 = a2;
  id v6 = [v3 fitnessMachine];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 56) fitnessMachineSessionUUID];
  objc_msgSend(v4, "clientRemote_updatedFitnessMachine:fitnessMachineSessionUUID:", v6, v5);
}

void sub_10E6C(void *a1)
{
  _HKInitializeLogging();
  dispatch_queue_t v2 = (void *)HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    id v4 = v2;
    id v5 = _HKStringForFitnessMachineState();
    uint64_t v6 = a1[5];
    *(_DWORD *)buf = 138543874;
    uint64_t v13 = v3;
    __int16 v14 = 2114;
    uint64_t v15 = v5;
    __int16 v16 = 2114;
    uint64_t v17 = v6;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: updatedFitnessMachineState state=%{public}@, fitnessMachineSessionUUID=%{public}@", buf, 0x20u);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10FC8;
  v9[3] = &unk_60C70;
  uint64_t v8 = a1[4];
  uint64_t v7 = (void *)a1[5];
  uint64_t v11 = a1[6];
  id v10 = v7;
  sub_10238(v8, v9);
}

id sub_10FC8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clientRemote_updatedFitnessMachineState:fitnessMachineSessionUUID:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_1106C(uint64_t a1)
{
}

void sub_11078(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_11114;
    v5[3] = &unk_60CC0;
    v5[4] = a1;
    id v6 = v3;
    sub_10238(a1, v5);
  }
}

void sub_11114(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(*(void *)(a1 + 32) + 56) connectionState];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 56) fitnessMachineSessionUUID];
  objc_msgSend(v5, "clientRemote_updatedConnectionState:fitnessMachineSessionUUID:", v3, v4);

  if (*(void *)(a1 + 40)) {
    objc_msgSend(v5, "clientRemote_encounteredError:");
  }
}

void sub_111A8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (v6)
    {
      uint64_t v7 = [*(id *)(a1 + 80) objectForKeyedSubscript:v6];
      objc_msgSend(v7, "clientRemote_encounteredError:", v5);
    }
    else
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_11288;
      v8[3] = &unk_60BE0;
      id v9 = v5;
      sub_10238(a1, v8);
    }
  }
}

id sub_11288(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clientRemote_encounteredError:", *(void *)(a1 + 32));
}

void sub_11294(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_11334;
    v4[3] = &unk_60BE0;
    id v5 = v3;
    sub_10238(a1, v4);
  }
}

id sub_11334(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clientRemote_encounteredError:", *(void *)(a1 + 32));
}

void sub_113D8(uint64_t a1)
{
}

void sub_113E4(uint64_t a1)
{
}

void sub_11464(uint64_t a1)
{
  dispatch_queue_t v2 = (uint64_t *)(a1 + 32);
  if ([*(id *)(*(void *)(a1 + 32) + 104) fitnessTrackingEnabled])
  {
    if (*(void *)(*v2 + 88))
    {
      _HKInitializeLogging();
      id v3 = HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
        sub_4014C((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
    else if (sub_D860((dispatch_queue_t *)*v2))
    {
      uint64_t v17 = [[HDFitnessMachineSimulatorSupport alloc] initWithFitnessMachineType:*(void *)(a1 + 40)];
      uint64_t v18 = *(void *)(a1 + 32);
      char v19 = *(void **)(v18 + 88);
      *(void *)(v18 + 88) = v17;

      uint64_t v20 = [HDFitnessMachineSession alloc];
      id v21 = [*(id *)(*(void *)(a1 + 32) + 88) btIdentifierData];
      id v22 = [(HDFitnessMachineSession *)v20 initWithNFCSessionIDData:v21];
      uint64_t v23 = *(void *)(a1 + 32);
      uint64_t v24 = *(void **)(v23 + 56);
      *(void *)(v23 + 56) = v22;

      sub_E9B8(*(id **)(a1 + 32), 2);
      uint64_t v25 = [*(id *)(a1 + 32) delegate];
      [v25 pairingManagerWillBeginPairing:*(void *)(a1 + 32) fitnessMachineToken:*(void *)(*(void *)(a1 + 32) + 56)];

      long long v26 = [*(id *)(*(void *)(a1 + 32) + 56) fitnessMachineSessionUUID];
      +[HDWatchAppStateMonitor launchWorkoutAppIfNeededWithFitnessMachineSessionUUID:v26];

      uint64_t v27 = *(void **)(a1 + 32);
      uint64_t v28 = v27[1];
      [v27 nearFieldInterfaceDidReadTag:v28];
    }
    else
    {
      uint64_t v29 = _HDStringForNearFieldManagerNFCPermission((unint64_t)[*(id *)(*v2 + 104) nfcPermission]);
      uint64_t v30 = (void *)v29;
      unint64_t v31 = *(void *)(*v2 + 32);
      if (v31 > 2) {
        uint64_t v32 = 0;
      }
      else {
        uint64_t v32 = off_60CE0[v31];
      }
      uint64_t v33 = +[NSError hk_error:100, @"Ignoring tap because field detect events are not currently permitted. Check your settings and try again. _gymKitSettings.nfcPermission = %@ _bluetoothState = %@", v29, v32 format];

      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
        sub_400E0();
      }
      sub_11294(*v2, v33);
    }
  }
  else
  {
    _HKInitializeLogging();
    id v10 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      sub_401BC((uint64_t)v2, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

void sub_1172C(uint64_t a1)
{
  id v2 = +[NSError hk_error:100 format:@"Simulating acceptance is no longer supported"];
  sub_11294(*(void *)(a1 + 32), v2);
}

void sub_11874(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_118C4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_12484(uint64_t a1)
{
  if (a1)
  {
    id v2 = +[NSNotificationCenter defaultCenter];
    [v2 addObserver:a1 selector:"_setNFCAlwaysOnPreferenceIfNecessary" name:@"HDConnectedGymPreferencesChanged" object:0];

    *(_DWORD *)(a1 + 28) = -1;
    id v3 = (const char *)[kHKNanoLifestylePrivacyPreferencesChangedNotification UTF8String];
    objc_initWeak(&location, (id)a1);
    id v4 = &_dispatch_main_q;
    uint64_t v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    uint64_t v18 = sub_13238;
    char v19 = &unk_60D60;
    objc_copyWeak(&v20, &location);
    uint32_t v5 = notify_register_dispatch(v3, (int *)(a1 + 28), (dispatch_queue_t)&_dispatch_main_q, &v16);

    if (v5)
    {
      _HKInitializeLogging();
      uint64_t v6 = HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
        sub_4026C((uint64_t)v3, v5, v6);
      }
    }
    uint64_t v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:a1 selector:"_setNFCAlwaysOnPreferenceIfNecessary" name:HDUserCharacteristicsDidChangeNotification object:0];

    uint64_t v8 = +[NRPairedDeviceRegistry sharedInstance];
    uint64_t v9 = +[NRPairedDeviceRegistry activeDeviceSelectorBlock];
    id v10 = [v8 getAllDevicesWithArchivedAltAccountDevicesMatching:v9];
    uint64_t v11 = [v10 firstObject];
    uint64_t v12 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v11;

    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v22 = NRDevicePropertyIsAltAccount;
    uint64_t v14 = +[NSArray arrayWithObjects:&v22 count:1];
    [v13 addPropertyObserver:a1 forPropertyChanges:v14];

    uint64_t v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:a1 selector:"_setNFCAlwaysOnPreferenceIfNecessary" name:NSProcessInfoPowerStateDidChangeNotification object:0];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

void sub_1272C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_12758(uint64_t a1)
{
  if (a1)
  {
    id v2 = (id *)(a1 + 8);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    id v4 = [WeakRetained database];
    [v4 addProtectedDataObserver:a1];

    id v7 = objc_loadWeakRetained(v2);
    uint32_t v5 = [v7 dataManager];
    uint64_t v6 = +[HKObjectType workoutType];
    [v5 addObserver:a1 forDataType:v6];
  }
}

void sub_12970(uint64_t a1)
{
  if (a1)
  {
    id v2 = (id *)(a1 + 8);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    id v4 = [WeakRetained database];
    [v4 removeProtectedDataObserver:a1];

    id v7 = objc_loadWeakRetained(v2);
    uint32_t v5 = [v7 dataManager];
    uint64_t v6 = +[HKObjectType workoutType];
    [v5 removeObserver:a1 forDataType:v6];
  }
}

id sub_12ABC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setNFCAlwaysOnPreferenceIfNecessary];
}

id *sub_12E28(id *result)
{
  if (result)
  {
    id WeakRetained = objc_loadWeakRetained(result + 1);
    id v2 = [WeakRetained daemon];
    id v3 = [v2 behavior];
    id v4 = [v3 tinkerModeEnabled];

    return (id *)v4;
  }
  return result;
}

uint64_t sub_12E90(uint64_t result, uint64_t a2)
{
  if (result)
  {
    CFStringRef v2 = (const __CFString *)kHKConnectedGymPreferencesDefaultNFCAlwaysOn;
    id v3 = +[NSNumber numberWithBool:a2];
    CFStringRef v4 = (const __CFString *)kHKConnectedGymPreferencesDomain;
    CFPreferencesSetAppValue(v2, v3, kHKConnectedGymPreferencesDomain);
    return CFPreferencesAppSynchronize(v4);
  }
  return result;
}

void sub_12F00(uint64_t a1, char a2)
{
  if (a1)
  {
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000;
    uint64_t v18 = 0;
    if ([(id)a1 fitnessTrackingEnabled])
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_138D8;
      v13[3] = &unk_60DB0;
      void v13[4] = &v15;
      char v14 = a2;
      sub_13588(a1, v13);
    }
    else
    {
      _HKInitializeLogging();
      CFStringRef v4 = HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Fitness Tracking Disabled", buf, 2u);
      }
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    if (v16[3] == *(void *)(a1 + 16))
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
    }
    else
    {
      _HKInitializeLogging();
      uint32_t v5 = (void *)HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v6 = *(void *)(a1 + 16);
        if (v6 > 2) {
          id v7 = 0;
        }
        else {
          id v7 = off_60DD0[v6];
        }
        unint64_t v8 = v16[3];
        if (v8 > 2) {
          uint64_t v9 = 0;
        }
        else {
          uint64_t v9 = off_60DD0[v8];
        }
        *(_DWORD *)buf = 138543618;
        id v20 = v7;
        __int16 v21 = 2114;
        uint64_t v22 = v9;
        id v10 = v5;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "NFC permission: before='%{public}@' current='%{public}@'", buf, 0x16u);
      }
      uint64_t v11 = *(void *)(a1 + 16);
      *(void *)(a1 + 16) = v16[3];
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      [WeakRetained gymKitSettings:a1 didChangeFromNFCPermission:v11 toNFCPermission:v16[3]];
    }
    _Block_object_dispose(&v15, 8);
  }
}

void sub_13150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_13238(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setNFCAlwaysOnPreferenceIfNecessary];
}

void sub_13514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_13540(uint64_t a1, char a2, uint64_t a3)
{
  if (a3 == 2 || (a2 & 1) == 0)
  {
    sub_12F00(*(void *)(a1 + 32), 0);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void sub_13588(uint64_t a1, void *a2)
{
  if (a1)
  {
    id v3 = a2;
    CFStringRef v4 = +[HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierActivityMoveMode];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    unint64_t v6 = [WeakRetained userCharacteristicsManager];
    id v14 = 0;
    id v7 = [v6 userCharacteristicForType:v4 error:&v14];
    id v8 = v14;

    if (v8)
    {
      _HKInitializeLogging();
      uint64_t v9 = HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
        sub_402F4((uint64_t)v8, v9);
      }
      id v10 = &dword_0 + 1;
    }
    else
    {
      id v10 = [v7 integerValue];
      _HKInitializeLogging();
      uint64_t v11 = (void *)HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = v11;
        uint64_t v13 = HKActivityMoveModeToString();
        *(_DWORD *)buf = 138543362;
        uint64_t v16 = v13;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Current activity move mode is %{public}@", buf, 0xCu);
      }
    }
    v3[2](v3, v8 == 0, v10);
  }
}

void sub_13754(uint64_t a1)
{
  if (a1)
  {
    CFStringRef v2 = HDDataEntityPredicateForObjectsFromAppleWatchSources();
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    CFStringRef v4 = [WeakRetained database];
    id v12 = 0;
    uint32_t v5 = +[HDWorkoutEntity anyWithPredicate:v2 healthDatabase:v4 error:&v12];
    id v6 = v12;

    if (!v5)
    {
      if (v6)
      {
        _HKInitializeLogging();
        id v7 = HKLogWorkouts;
        if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
          sub_4036C((uint64_t)v6, v7);
        }
      }
    }
    sub_12E90(a1, v5 != 0);
    sub_12F00(a1, v5 != 0);
    _HKInitializeLogging();
    id v8 = HKLogWorkouts;
    BOOL v9 = os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Found workouts from a watch. NFC will be always on", buf, 2u);
      }
      sub_12970(a1);
    }
    else if (v9)
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Found no workouts from a watch. NFC will be on only when app is frontmost", v10, 2u);
    }
  }
}

void sub_138D8(uint64_t a1, char a2, uint64_t a3)
{
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    uint32_t v5 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Activity mode unknown. Defaulting to NFC on with workouts", buf, 2u);
    }
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    goto LABEL_8;
  }
  if (a3 != 2)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(unsigned char *)(a1 + 40))
    {
      uint64_t v7 = 2;
      goto LABEL_11;
    }
LABEL_8:
    uint64_t v7 = 1;
LABEL_11:
    *(void *)(v6 + 24) = v7;
    return;
  }
  _HKInitializeLogging();
  CFStringRef v4 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "NFC disabled because activity mode is Fitness Jr", v8, 2u);
  }
}

__CFString *_HDStringForNearFieldManagerNFCPermission(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_60DD0[a1];
  }
}

id sub_13D20()
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1401C;
  block[3] = &unk_60DE8;
  block[4] = self;
  if (qword_75E60 != -1) {
    dispatch_once(&qword_75E60, block);
  }
  v0 = (void *)qword_75E58;

  return v0;
}

void sub_1401C()
{
  id v0 = objc_alloc_init((Class)NSMutableDictionary);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v1 = sub_14158();
  id v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v10;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        uint64_t v7 = objc_msgSend(v6, "uuid", (void)v9);
        [v0 setObject:v6 forKeyedSubscript:v7];
      }
      id v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }

  id v8 = (void *)qword_75E58;
  qword_75E58 = (uint64_t)v0;
}

id sub_14158()
{
  self;
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  id v0 = +[NSArray arrayWithObjects:v2 count:6];

  return v0;
}

void sub_14E40(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[1];
  }
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = v2;
  uint32_t v5 = [v3 taskUUID];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_14F60;
  v11[3] = &unk_60E10;
  v11[4] = *(void *)(a1 + 32);
  uint64_t v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  id v8 = sub_14FF0;
  long long v9 = &unk_60E38;
  id v10 = *(id *)(a1 + 48);
  [v4 sendBluetoothStatusUpdatesForServer:v5 updateHandler:v11 completion:&v6];

  objc_msgSend(*(id *)(a1 + 40), "invalidate", v6, v7, v8, v9);
}

void sub_14F60(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v8 = [v4 client];
  uint64_t v6 = [v8 connection];
  uint64_t v7 = [v6 remoteObjectProxy];
  objc_msgSend(v7, "clientRemote_deliverBluetoothStatus:withError:", a2, v5);
}

uint64_t sub_14FF0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_150CC(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[1];
  }
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = v2;
  id v5 = [v3 taskUUID];
  [v4 sendBluetoothStatusUpdatesForServer:v5 updateHandler:0 completion:0];

  uint64_t v6 = *(void **)(a1 + 40);

  return [v6 invalidate];
}

void sub_152C4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  v17[0] = @"serviceType";
  id v3 = +[NSNumber numberWithInteger:*(void *)(a1 + 56)];
  v17[1] = @"action";
  v18[0] = v3;
  v18[1] = @"start";
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  HDPowerLogForClient();

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_154E8;
  v14[3] = &unk_60E88;
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void **)(a1 + 40);
  v14[4] = *(void *)(a1 + 32);
  uint64_t v16 = v5;
  id v15 = v6;
  uint64_t v7 = objc_retainBlock(v14);
  id v8 = *(void **)(a1 + 32);
  if (v8) {
    id v8 = (void *)v8[1];
  }
  uint64_t v9 = *(void *)(a1 + 56);
  id v13 = 0;
  id v10 = v8;
  id v11 = [v10 discoverHealthServicesWithType:v9 timeout:30 alwaysNotify:1 handler:v7 error:&v13];
  id v12 = v13;

  if (v11)
  {
    sub_15790(*(void *)(a1 + 32), (uint64_t)v11);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(a1 + 40) invalidate];
  }
}

void sub_154E8(void *a1, uint64_t a2, void *a3, char a4, void *a5)
{
  id v9 = a3;
  id v10 = a5;
  id v11 = v10;
  uint64_t v12 = a1[4];
  if (v12) {
    id v13 = *(NSObject **)(v12 + 16);
  }
  else {
    id v13 = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_155F8;
  block[3] = &unk_60E60;
  id v15 = (void *)a1[5];
  uint64_t v14 = a1[6];
  uint64_t v22 = a2;
  uint64_t v23 = v14;
  block[4] = a1[4];
  id v19 = v9;
  char v24 = a4;
  id v20 = v10;
  id v21 = v15;
  id v16 = v11;
  id v17 = v9;
  dispatch_async(v13, block);
}

void sub_155F8(uint64_t a1)
{
  id v2 = sub_15790(*(void *)(a1 + 32), *(void *)(a1 + 64));
  id v3 = [*(id *)(a1 + 32) client];
  v10[0] = @"serviceType";
  uint64_t v4 = +[NSNumber numberWithInteger:*(void *)(a1 + 72)];
  v11[0] = v4;
  v11[1] = @"assignedId";
  v10[1] = @"action";
  v10[2] = @"clientId";
  uint64_t v5 = +[NSNumber numberWithUnsignedInteger:v2];
  v11[2] = v5;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
  HDPowerLogForClient();

  uint64_t v7 = [*(id *)(a1 + 32) client];
  id v8 = [v7 connection];
  id v9 = [v8 remoteObjectProxy];
  objc_msgSend(v9, "clientRemote_deliverDiscoveryHealthService:toClient:finished:withError:", *(void *)(a1 + 40), v2, *(unsigned __int8 *)(a1 + 80), *(void *)(a1 + 48));

  if (*(unsigned char *)(a1 + 80))
  {
    sub_15908(*(void **)(a1 + 32), *(void *)(a1 + 64), (uint64_t)v2);
    [*(id *)(a1 + 56) invalidate];
  }
}

id sub_15790(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  if (!*(void *)(a1 + 24))
  {
    uint64_t v4 = objc_alloc_init(HDIdentifierTable);
    uint64_t v5 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v4;
  }
  uint64_t v6 = *(void **)(a1 + 32);
  if (!v6)
  {
    uint64_t v7 = +[NSMutableDictionary dictionary];
    id v8 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v7;

    uint64_t v6 = *(void **)(a1 + 32);
  }
  id v9 = +[NSNumber numberWithUnsignedInteger:a2];
  id v10 = [v6 objectForKey:v9];
  id v11 = [v10 integerValue];

  if (v11 == (id)HKHealthServiceDiscoveryIdentifierInvalid)
  {
    uint64_t v12 = *(void **)(a1 + 24);
    id v13 = +[NSNumber numberWithUnsignedInteger:a2];
    id v11 = [v12 addObject:v13];

    uint64_t v14 = *(void **)(a1 + 32);
    id v15 = +[NSNumber numberWithUnsignedInteger:v11];
    id v16 = +[NSNumber numberWithUnsignedInteger:a2];
    [v14 setObject:v15 forKey:v16];
  }
  return v11;
}

void *sub_15908(void *result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = (void *)result[4];
    uint64_t v6 = +[NSNumber numberWithUnsignedInteger:a2];
    [v5 removeObjectForKey:v6];

    uint64_t v7 = (void *)v4[3];
    return [v7 removeObjectWithIdentifier:a3];
  }
  return result;
}

id sub_15A68(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  v19[0] = @"clientId";
  id v3 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  v19[1] = @"action";
  v20[0] = v3;
  v20[1] = @"end";
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  HDPowerLogForClient();

  id v5 = sub_15C38(*(void *)(a1 + 32), *(void *)(a1 + 48));
  if (v5 == (id)HKHealthServiceDiscoveryIdentifierInvalid)
  {
    _HKInitializeLogging();
    uint64_t v6 = (void *)HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(const char **)(a1 + 56);
      id v8 = v6;
      id v9 = NSStringFromSelector(v7);
      uint64_t v10 = *(void *)(a1 + 48);
      int v15 = 138543618;
      id v16 = v9;
      __int16 v17 = 1024;
      int v18 = v10;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@, Client discovery ID #%d not valid.", (uint8_t *)&v15, 0x12u);
    }
  }
  else
  {
    id v11 = v5;
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      id v13 = *(void **)(v12 + 8);
    }
    else {
      id v13 = 0;
    }
    [v13 stopDiscoveryWithIdentifier:v11];
  }
  return [*(id *)(a1 + 40) invalidate];
}

id sub_15C38(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  id v2 = [*(id *)(a1 + 24) objectWithIdentifier:a2];
  id v3 = v2;
  if (v2) {
    id v4 = [v2 integerValue];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

void sub_15DC0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) identifier];
  id v3 = [v2 UUIDString];

  id v4 = [*(id *)(a1 + 40) client];
  v27[0] = v3;
  v26[0] = @"peripheralId";
  v26[1] = @"serviceType";
  id v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(a1 + 32) type]);
  v26[2] = @"action";
  v27[1] = v5;
  v27[2] = @"start";
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];
  HDPowerLogForClient();

  if (!*(void *)(a1 + 56))
  {
    _HKInitializeLogging();
    int v15 = (void *)HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR)) {
      sub_40504(a1, v15);
    }
    goto LABEL_12;
  }
  uint64_t v7 = [*(id *)(a1 + 32) identifier];

  if (!v7)
  {
    _HKInitializeLogging();
    id v16 = (void *)HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR)) {
      sub_4059C(a1, v16);
    }
    uint64_t v17 = *(void *)(a1 + 56);
    uint64_t v18 = HKHealthServiceSessionIdentifierInvalid;
    id v19 = +[NSError hk_errorForInvalidArgument:@"@\"\"" class:objc_opt_class() selector:*(void *)(a1 + 64) format:@"Missing a valid health device."];
    (*(void (**)(uint64_t, uint64_t, void *))(v17 + 16))(v17, v18, v19);

LABEL_12:
    [*(id *)(a1 + 48) invalidate];
    goto LABEL_15;
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_16198;
  v22[3] = &unk_60F28;
  v22[4] = *(void *)(a1 + 40);
  id v23 = v3;
  id v24 = *(id *)(a1 + 32);
  id v25 = *(id *)(a1 + 48);
  id v8 = objc_retainBlock(v22);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1681C;
  v21[3] = &unk_60FB8;
  v21[4] = *(void *)(a1 + 40);
  id v9 = objc_retainBlock(v21);
  uint64_t v10 = *(void **)(a1 + 40);
  if (v10) {
    uint64_t v10 = (void *)v10[1];
  }
  uint64_t v11 = *(void *)(a1 + 32);
  id v20 = 0;
  uint64_t v12 = v10;
  id v13 = [v12 connectHealthService:v11 sessionHandler:v8 dataHandler:&stru_60F68 characteristicsHandler:v9 error:&v20];
  id v14 = v20;

  if (v13)
  {
    sub_16580(*(void *)(a1 + 40), (uint64_t)v13);
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [*(id *)(a1 + 48) invalidate];
  }

LABEL_15:
}

void sub_16198(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  id v9 = a5;
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    uint64_t v11 = *(NSObject **)(v10 + 16);
  }
  else {
    uint64_t v11 = 0;
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_162B0;
  v15[3] = &unk_60F00;
  uint64_t v12 = *(void **)(a1 + 40);
  v15[4] = *(void *)(a1 + 32);
  uint64_t v20 = a2;
  id v16 = v12;
  id v13 = *(id *)(a1 + 48);
  uint64_t v21 = a3;
  char v22 = a4;
  id v17 = v13;
  id v18 = v9;
  id v19 = *(id *)(a1 + 56);
  id v14 = v9;
  dispatch_async(v11, v15);
}

void sub_162B0(uint64_t a1)
{
  int v2 = sub_1650C(*(void *)(a1 + 32), *(void *)(a1 + 72));
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = sub_16580((uint64_t)v3, *(void *)(a1 + 72));
    id v5 = [*(id *)(a1 + 32) client];
    uint64_t v6 = *(void **)(a1 + 48);
    v18[0] = *(void *)(a1 + 40);
    v17[0] = @"peripheralId";
    v17[1] = @"serviceType";
    uint64_t v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 type]);
    v18[1] = v7;
    void v18[2] = @"assignedId";
    void v17[2] = @"action";
    v17[3] = @"clientId";
    id v8 = +[NSNumber numberWithUnsignedInteger:v4];
    v18[3] = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
    HDPowerLogForClient();

    uint64_t v10 = [*(id *)(a1 + 32) client];
    uint64_t v11 = [v10 connection];
    uint64_t v12 = [v11 remoteObjectProxy];
    objc_msgSend(v12, "clientRemote_deliverSessionHealthServiceStatus:toClient:finished:withError:", *(void *)(a1 + 80), v4, *(unsigned __int8 *)(a1 + 88), *(void *)(a1 + 56));

    if (*(unsigned char *)(a1 + 88))
    {
      sub_166C0(*(void *)(a1 + 32), *(void *)(a1 + 72), (uint64_t)v4);
      [*(id *)(a1 + 64) invalidate];
    }
  }
  else
  {
    id v13 = [v3 client];
    id v14 = [v13 connection];
    int v15 = [v14 remoteObjectProxy];
    objc_msgSend(v15, "clientRemote_deliverSessionHealthServiceStatus:toClient:finished:withError:", *(void *)(a1 + 80), HKHealthServiceSessionIdentifierInvalid, 1, *(void *)(a1 + 56));

    id v16 = *(void **)(a1 + 64);
    [v16 invalidate];
  }
}

uint64_t sub_1650C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  if (a1 && a2)
  {
    id v3 = *(void **)(a1 + 56);
    id v4 = +[NSNumber numberWithUnsignedInteger:a2];
    uint64_t v2 = [v3 containsObject:v4] ^ 1;
  }
  return v2;
}

id sub_16580(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  if (!*(void *)(a1 + 40))
  {
    id v4 = objc_alloc_init(HDIdentifierTable);
    id v5 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = v4;
  }
  if (!*(void *)(a1 + 48))
  {
    uint64_t v6 = +[NSMutableDictionary dictionary];
    uint64_t v7 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v6;
  }
  id v8 = sub_18190(a1, a2);
  if (v8 == (id)HKHealthServiceSessionIdentifierInvalid)
  {
    id v9 = *(void **)(a1 + 40);
    uint64_t v10 = +[NSNumber numberWithUnsignedInteger:a2];
    id v8 = [v9 addObject:v10];

    uint64_t v11 = *(void **)(a1 + 48);
    uint64_t v12 = +[NSNumber numberWithUnsignedInteger:v8];
    id v13 = +[NSNumber numberWithUnsignedInteger:a2];
    [v11 setObject:v12 forKey:v13];
  }
  return v8;
}

void sub_166C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    uint64_t v6 = *(void **)(a1 + 48);
    uint64_t v7 = +[NSNumber numberWithUnsignedInteger:a2];
    [v6 removeObjectForKey:v7];

    [*(id *)(a1 + 40) removeObjectWithIdentifier:a3];
    id v8 = *(void **)(a1 + 64);
    if (!v8)
    {
      uint64_t v9 = +[NSMutableSet set];
      uint64_t v10 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v9;

      id v8 = *(void **)(a1 + 64);
    }
    uint64_t v11 = +[NSNumber numberWithUnsignedInteger:a3];
    [v8 addObject:v11];

    uint64_t v12 = *(void **)(a1 + 56);
    if (!v12)
    {
      uint64_t v13 = +[NSMutableSet set];
      id v14 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v13;

      uint64_t v12 = *(void **)(a1 + 56);
    }
    id v15 = +[NSNumber numberWithUnsignedInteger:a2];
    [v12 addObject:v15];
  }
}

void sub_1681C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    uint64_t v13 = *(NSObject **)(v12 + 16);
  }
  else {
    uint64_t v13 = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1692C;
  block[3] = &unk_60F90;
  uint64_t v14 = *(void *)(a1 + 32);
  id v21 = v11;
  uint64_t v22 = a2;
  block[4] = v14;
  id v19 = v9;
  id v20 = v10;
  id v15 = v11;
  id v16 = v10;
  id v17 = v9;
  dispatch_async(v13, block);
}

void sub_1692C(uint64_t *a1)
{
  if (sub_1650C(a1[4], a1[8]))
  {
    id v2 = sub_16580(a1[4], a1[8]);
    id v5 = [(id)a1[4] client];
    id v3 = [v5 connection];
    id v4 = [v3 remoteObjectProxy];
    objc_msgSend(v4, "clientRemote_deliverSessionCharacteristics:forService:toClient:withError:", a1[5], a1[6], v2, a1[7]);
  }
}

id sub_16AB8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  v10[0] = @"clientId";
  id v3 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  v10[1] = @"action";
  v11[0] = v3;
  v11[1] = @"end";
  id v4 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  HDPowerLogForClient();

  if (sub_16C08(*(void *)(a1 + 32), *(void *)(a1 + 48)))
  {
    id v5 = *(void **)(a1 + 32);
    if (v5) {
      id v5 = (void *)v5[1];
    }
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = v5;
    objc_msgSend(v8, "disconnectHealthService:", sub_16CF0(v6, v7));
  }
  return [*(id *)(a1 + 40) invalidate];
}

uint64_t sub_16C08(uint64_t result, uint64_t a2)
{
  if (result)
  {
    if (HKHealthServiceSessionIdentifierInvalid == a2) {
      return 0;
    }
    uint64_t v3 = result;
    id v4 = *(void **)(result + 64);
    id v5 = +[NSNumber numberWithUnsignedInteger:a2];
    LOBYTE(v4) = [v4 containsObject:v5];

    if (v4) {
      return 0;
    }
    if (sub_16CF0(v3, a2)) {
      return 1;
    }
    _HKInitializeLogging();
    uint64_t v6 = (void *)HKLogServices;
    uint64_t result = os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_40634(v6, "_isClientSessionValid:", a2);
      return 0;
    }
  }
  return result;
}

id sub_16CF0(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  id v2 = [*(id *)(a1 + 40) objectWithIdentifier:a2];
  uint64_t v3 = v2;
  if (v2) {
    id v4 = [v2 integerValue];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

void sub_16E5C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[1];
  }
  id v7 = 0;
  uint64_t v3 = v2;
  id v4 = [v3 reviewSavedHealthServiceSessionsWithError:&v7];
  id v5 = v7;

  if (*(void *)(a1 + 56) == 1)
  {
    uint64_t v6 = sub_16F1C(*(void **)(a1 + 32), v4);

    id v4 = (void *)v6;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 40) invalidate];
}

id sub_16F1C(void *a1, void *a2)
{
  if (a1)
  {
    a1 = objc_msgSend(a2, "hk_filter:", &stru_61028);
    uint64_t v2 = vars8;
  }
  return a1;
}

BOOL sub_16F58(id a1, HKHealthService *a2)
{
  uint64_t v2 = (char *)[(HKHealthService *)a2 type];
  return (unint64_t)(v2 - 101) < 4 || v2 == 0;
}

void sub_1709C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) profile];
  id v4 = [v3 database];
  id v9 = 0;
  id v5 = +[HDServiceEntity insertOrUpdateService:v2 healthDatabase:v4 error:&v9];
  id v6 = v9;

  (*(void (**)(void, BOOL, id))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v5 != 0, v6);
  if (v5)
  {
    id v7 = [*(id *)(a1 + 40) profile];
    id v8 = [v7 serviceConnectionManager];
    [v8 connectToService:*(void *)(a1 + 32)];
  }
  [*(id *)(a1 + 48) invalidate];
}

void sub_1729C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) profile];
  id v4 = [v3 database];
  id v8 = 0;
  +[HDServiceEntity deleteService:v2 healthDatabase:v4 error:&v8];
  id v5 = v8;

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v6 = [*(id *)(a1 + 40) profile];
  id v7 = [v6 serviceConnectionManager];
  [v7 disconnectFromService:*(void *)(a1 + 32)];

  [*(id *)(a1 + 48) invalidate];
}

void sub_174DC(uint64_t a1)
{
  uint64_t v2 = HDHealthPeripheralProfiles();
  id v7 = +[NSSet setWithArray:v2];

  uint64_t v3 = +[NSMutableSet setWithArray:*(void *)(a1 + 32)];
  [v3 intersectSet:v7];
  if ([v3 containsObject:kHDHeartRateService]
    && (id v4 = [objc_alloc((Class)HKHealthService) initWithType:0 identifier:*(void *)(a1 + 40) name:*(void *)(a1 + 48)]) != 0)
  {
    id v5 = v4;
    objc_msgSend(*(id *)(a1 + 56), "remote_addPairingForHealthService:withCompletion:", v4, *(void *)(a1 + 72));
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 72);
    id v5 = +[NSError hk_errorForInvalidArgument:@"@\"\"" class:objc_opt_class() selector:*(void *)(a1 + 80) format:@"No supported health services."];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v5);
  }

  [*(id *)(a1 + 64) invalidate];
}

void sub_17730(uint64_t a1)
{
  id v2 = 0;
  char v12 = 0;
  for (uint64_t i = 0; i != 4; ++i)
  {
    while (1)
    {
      id v4 = v2;
      id v5 = [objc_alloc((Class)HKHealthService) initWithType:i identifier:*(void *)(a1 + 32) name:&stru_61AE0];
      uint64_t v6 = [*(id *)(a1 + 40) profile];
      id v7 = [v6 database];
      id v13 = v2;
      unsigned __int8 v8 = +[HDServiceEntity deleteService:v5 healthDatabase:v7 error:&v13];
      id v2 = v13;

      if ((v8 & 1) == 0) {
        break;
      }
      id v9 = [*(id *)(a1 + 40) profile];
      id v10 = [v9 serviceConnectionManager];
      [v10 disconnectFromService:v5];

      char v12 = 1;
      if (i++ == 3) {
        goto LABEL_9;
      }
    }
  }
  if ((v12 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_9:

  id v2 = 0;
LABEL_10:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 48) invalidate];
}

void sub_179C0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[1];
  }
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = 0;
  id v4 = v2;
  [v4 healthUpdatesEnabledFromDevice:v3 error:&v6];
  id v5 = v6;

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 48) invalidate];
}

void sub_17B78(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[1];
  }
  uint64_t v3 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 40);
  id v7 = 0;
  id v5 = v2;
  [v5 setHealthUpdatesEnabled:v3 fromDevice:v4 error:&v7];
  id v6 = v7;

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 48) invalidate];
}

void sub_17D08(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 8);
  }
  else {
    uint64_t v3 = 0;
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_17DB8;
  v4[3] = &unk_610C8;
  id v5 = *(id *)(a1 + 48);
  [v3 getSupportedPropertyNamesWithHandler:v4];
  [*(id *)(a1 + 40) invalidate];
}

uint64_t sub_17DB8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_17EE4(uint64_t a1)
{
  if (sub_16C08(*(void *)(a1 + 32), *(void *)(a1 + 64)))
  {
    id v2 = sub_16CF0(*(void *)(a1 + 32), *(void *)(a1 + 64));
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      uint64_t v4 = *(void **)(v3 + 8);
    }
    else {
      uint64_t v4 = 0;
    }
    uint64_t v5 = *(void *)(a1 + 40);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_17FC8;
    v7[3] = &unk_610F0;
    id v8 = *(id *)(a1 + 56);
    [v4 getProperty:v5 forSession:v2 withHandler:v7];
  }
  return [*(id *)(a1 + 48) invalidate];
}

uint64_t sub_17FC8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_18114(uint64_t *a1)
{
  if (sub_16C08(a1[4], a1[9]))
  {
    id v2 = sub_16CF0(a1[4], a1[9]);
    uint64_t v3 = a1[4];
    if (v3) {
      uint64_t v4 = *(void **)(v3 + 8);
    }
    else {
      uint64_t v4 = 0;
    }
    [v4 performOperation:a1[5] onSession:v2 withParameters:a1[6] completion:a1[8]];
  }
  uint64_t v5 = (void *)a1[7];

  return [v5 invalidate];
}

id sub_18190(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  id v2 = *(void **)(a1 + 48);
  uint64_t v3 = +[NSNumber numberWithUnsignedInteger:a2];
  uint64_t v4 = [v2 objectForKey:v3];

  if (v4) {
    id v5 = [v4 integerValue];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

void sub_18498(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_19C70(uint64_t a1)
{
  if (a1)
  {
    _HKInitializeLogging();
    id v2 = HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v7 = 5;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Starting device information timer with duration: %lld", buf, 0xCu);
    }
    dispatch_time_t v3 = dispatch_walltime(0, 5000000000);
    uint64_t v4 = *(NSObject **)(a1 + 136);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1A298;
    block[3] = &unk_60820;
    block[4] = a1;
    dispatch_after(v3, v4, block);
  }
}

void *sub_19DBC(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x3032000000;
    id v13 = sub_19F34;
    uint64_t v14 = sub_19F44;
    id v15 = 0;
    id v5 = a1[17];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_19F4C;
    block[3] = &unk_607D0;
    id v9 = &v10;
    block[4] = a1;
    id v8 = v3;
    dispatch_sync(v5, block);
    a1 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
  }

  return a1;
}

uint64_t sub_19F34(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_19F44(uint64_t a1)
{
}

uint64_t sub_19F4C(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 120) objectForKeyedSubscript:a1[5]];

  return _objc_release_x1();
}

void sub_1A044(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 105))
  {
    HKDispatchAsyncOnGlobalConcurrentQueue();
  }
  else
  {
    id v2 = *(void **)(v1 + 144);
    id v3 = objc_retainBlock(*(id *)(a1 + 40));
    [v2 addObject:v3];
  }
}

id *sub_1A0DC(id *result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (!*((unsigned char *)result + 105))
    {
      _HKInitializeLogging();
      id v2 = (void *)HKLogServices;
      if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
      {
        id v3 = v2;
        uint64_t v4 = NSStringFromSelector("_queue_setDeviceInformationHasBeenLoaded");
        *(_DWORD *)buf = 138412546;
        id v16 = v1;
        __int16 v17 = 2112;
        id v18 = v4;
        _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
      }
      *((unsigned char *)v1 + 105) = 1;
      long long v10 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v5 = v1[18];
      id v6 = (char *)[v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          id v9 = 0;
          do
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            HKDispatchAsyncOnGlobalConcurrentQueue();
            ++v9;
          }
          while (v7 != v9);
          uint64_t v7 = (char *)[v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }

      return (id *)objc_msgSend(v1[18], "removeAllObjects", v10);
    }
  }
  return result;
}

id *sub_1A298(uint64_t a1)
{
  _HKInitializeLogging();
  id v2 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 128);
    id v5 = v2;
    id v6 = [v4 count];
    id v7 = [*(id *)(*(void *)(a1 + 32) + 112) count];
    int v9 = 138412802;
    uint64_t v10 = v3;
    __int16 v11 = 2048;
    id v12 = v6;
    __int16 v13 = 2048;
    id v14 = v7;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%@: Timeout fired, %lu properties left of %lu", (uint8_t *)&v9, 0x20u);
  }
  if ([*(id *)(*(void *)(a1 + 32) + 128) count]) {
    [*(id *)(*(void *)(a1 + 32) + 128) removeAllObjects];
  }
  return sub_1A0DC(*(id **)(a1 + 32));
}

id _PropertyNamesToCharacteristicIdentifiers()
{
  if (qword_75E70 != -1) {
    dispatch_once(&qword_75E70, &stru_61158);
  }
  id v0 = (void *)qword_75E68;

  return v0;
}

void sub_1A50C(uint64_t a1)
{
  sub_1A5D0(*(void *)(a1 + 32), *(void **)(a1 + 40));
  if ([*(id *)(a1 + 32) characteristicsDiscovered])
  {
    id v5 = [*(id *)(a1 + 32) healthPeripheral];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v4 = +[NSError hk_error:310, @"Property %@ not supported on this device", v2 format];
    [v5 service:v3 didReadProperty:v2 value:0 error:v4];
  }
}

uint64_t sub_1A5D0(uint64_t result, void *a2)
{
  if (result)
  {
    uint64_t v2 = (id *)result;
    id v3 = a2;
    uint64_t v4 = _PropertyNamesToCharacteristicIdentifiers();
    uint64_t v9 = [v4 objectForKeyedSubscript:v3];

    if (v9)
    {
      uint64_t v5 = [v2[14] objectForKeyedSubscript:v9];
      if (v5)
      {
        id v6 = (void *)v5;
        id v7 = [v2 healthPeripheral];
        uint64_t v8 = [v7 cbPeripheral];
        [v8 readValueForCharacteristic:v6];
      }
    }
    return _objc_release_x1();
  }
  return result;
}

void sub_1A770(uint64_t a1)
{
}

void sub_1A780(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    uint64_t v8 = [v6 UUID];
    uint64_t v9 = [v8 UUIDString];

    uint64_t v10 = _CharacteristicIdentifiersToPropertyNames();
    __int16 v11 = [v10 objectForKeyedSubscript:v9];

    if (v11
      && (![(id)a1 fetchLimitedCharacteristics]
       || [v9 isEqualToString:@"2A29"]))
    {
      [*(id *)(a1 + 128) addObject:v11];
      id v12 = *(void **)(a1 + 112);
      __int16 v13 = [v7 UUID];
      id v14 = [v13 UUIDString];
      [v12 setObject:v7 forKeyedSubscript:v14];

      _HKInitializeLogging();
      id v15 = HKLogServices;
      if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138543618;
        __int16 v17 = v11;
        __int16 v18 = 2114;
        id v19 = v9;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Reading device information characteristic %{public}@ (%{public}@)", (uint8_t *)&v16, 0x16u);
      }
      [v5 readValueForCharacteristic:v7];
    }
  }
}

id _CharacteristicIdentifiersToPropertyNames()
{
  if (qword_75E80 != -1) {
    dispatch_once(&qword_75E80, &stru_61178);
  }
  id v0 = (void *)qword_75E78;

  return v0;
}

void sub_1AA78(uint64_t a1)
{
}

void sub_1AA88(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (a1)
  {
    if (v9)
    {
      _HKInitializeLogging();
      __int16 v11 = HKLogServices;
      if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR))
      {
        int v17 = 138412802;
        id v18 = v7;
        __int16 v19 = 2112;
        id v20 = v8;
        __int16 v21 = 2114;
        uint64_t v22 = v10;
        _os_log_error_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "Error updating value for peripheral: %@ characteristic: %@; %{public}@",
          (uint8_t *)&v17,
          0x20u);
      }
    }
    else
    {
      id v12 = [v8 UUID];
      __int16 v13 = [v12 UUIDString];

      id v14 = _CharacteristicIdentifiersToPropertyNames();
      id v15 = [v14 objectForKeyedSubscript:v13];

      if ([a1[16] containsObject:v15])
      {
        int v16 = sub_1AC54((uint64_t)a1, v8);
        if (v16) {
          [a1[15] setObject:v16 forKeyedSubscript:v15];
        }
        [a1[16] removeObject:v15];
      }
      if (![a1[16] count]) {
        sub_1A0DC(a1);
      }
    }
  }
}

id sub_1AC54(uint64_t a1, void *a2)
{
  if (a1)
  {
    uint64_t v2 = [a2 value];
    id v3 = v2;
    if (v2)
    {
      id v4 = [v2 length];
      id v5 = v3;
      size_t v6 = strnlen((const char *)[v5 bytes], (size_t)v4);
      id v7 = objc_alloc((Class)NSString);
      if (v4 == (id)v6) {
        id v8 = [v7 initWithData:v5 encoding:4];
      }
      else {
        id v8 = objc_msgSend(v7, "initWithUTF8String:", objc_msgSend(v5, "bytes"));
      }
      id v9 = v8;
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void sub_1AEB4(id a1)
{
  v3[0] = @"manufacturerName";
  v3[1] = @"modelNumber";
  v4[0] = @"2A29";
  v4[1] = @"2A24";
  v3[2] = @"serialNumber";
  v3[3] = @"hardwareRevision";
  v4[2] = @"2A25";
  v4[3] = @"2A27";
  v3[4] = @"firmwareRevision";
  void v3[5] = @"softwareRevision";
  void v4[4] = @"2A26";
  v4[5] = @"2A28";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:6];
  uint64_t v2 = (void *)qword_75E68;
  qword_75E68 = v1;
}

void sub_1AFB8(id a1)
{
  v3[0] = @"2A29";
  v3[1] = @"2A24";
  v4[0] = @"manufacturerName";
  v4[1] = @"modelNumber";
  v3[2] = @"2A25";
  v3[3] = @"2A27";
  v4[2] = @"serialNumber";
  v4[3] = @"hardwareRevision";
  v3[4] = @"2A26";
  void v3[5] = @"2A28";
  void v4[4] = @"firmwareRevision";
  v4[5] = @"softwareRevision";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:6];
  uint64_t v2 = (void *)qword_75E78;
  qword_75E78 = v1;
}

uint64_t sub_1B45C()
{
  return NSRequestConcreteImplementation();
}

uint64_t sub_1B478()
{
  return objc_opt_class();
}

id sub_1B6A4(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  id v3 = objc_alloc_init((Class)NSMutableData);
  id v4 = (char *)[v2 length] - 1;
  if ((uint64_t)v4 >= 0)
  {
    do
      objc_msgSend(v3, "appendBytes:length:", &(v4--)[(void)objc_msgSend(v2, "bytes")], 1);
    while (v4 != (char *)-1);
  }

  return v3;
}

id HDHealthPeripheralAllPropertyNames()
{
  id v0 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v1 = +[HDHealthPeripheral implementedProperties];
  [v0 addObjectsFromArray:v1];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = sub_1BEB0();
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "implementedProperties", (void)v9);
        [v0 addObjectsFromArray:v7];
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  return v0;
}

id sub_1BEB0()
{
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  id v0 = +[NSArray arrayWithObjects:&v4 count:3];
  uint64_t v1 = sub_1C338();
  id v2 = objc_msgSend(v0, "arrayByAddingObjectsFromArray:", v1, v4, v5);

  return v2;
}

id HDHealthServiceClassForCBUUID(void *a1)
{
  uint64_t v1 = qword_75E90;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&qword_75E90, &stru_611F0);
  }
  id v3 = [(id)qword_75E88 objectForKeyedSubscript:v2];

  return v3;
}

void sub_1C00C(id a1)
{
  sub_1BEB0();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = NSStringFromSelector("serviceUUID");
  id v2 = [v5 valueForKey:v1];

  id v3 = [objc_alloc((Class)NSDictionary) initWithObjects:v5 forKeys:v2];
  uint64_t v4 = (void *)qword_75E88;
  qword_75E88 = (uint64_t)v3;
}

id HDHealthPeripheralProfiles()
{
  v2[0] = kHDHeartRateService;
  v2[1] = @"0x1826";
  id v0 = +[NSArray arrayWithObjects:v2 count:2];

  return v0;
}

id HDServiceClassForProfile(uint64_t a1)
{
  if (qword_75EA0 != -1) {
    dispatch_once(&qword_75EA0, &stru_61210);
  }
  id v2 = (void *)qword_75E98;
  id v3 = +[NSNumber numberWithInteger:a1];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

void sub_1C1C8(id a1)
{
  id v1 = objc_alloc_init((Class)NSMutableDictionary);
  id v2 = (void *)qword_75E98;
  qword_75E98 = (uint64_t)v1;

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = sub_1C338();
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        long long v9 = (void *)qword_75E98;
        long long v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v8, "serviceType", (void)v11));
        [v9 setObject:v8 forKeyedSubscript:v10];
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  [(id)qword_75E98 setObject:objc_opt_class() forKeyedSubscript:&off_64080];
}

id sub_1C338()
{
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  id v0 = +[NSArray arrayWithObjects:v2 count:2];

  return v0;
}

void sub_1C63C(uint64_t a1)
{
  if (a1)
  {
    id v2 = [*(id *)(a1 + 8) workoutConfiguration];
    id v3 = [v2 fitnessMachineSessionUUID];

    id v4 = [(id)a1 profile];
    id v5 = [v4 fitnessMachineManager];
    id v6 = [v5 fitnessMachineTypeForSessionUUID:v3];

    id v7 = objc_alloc_init((Class)NSMutableSet);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = HKSupportedMetricsForMachineType();
    id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        long long v12 = 0;
        do
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = (int *)objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * (void)v12), "unsignedIntegerValue", (void)v20);
          if (v13 != &dword_14)
          {
            long long v14 = +[HKObjectType objectTypeForWorkoutMetric:v13 fitnessMachineType:v6];
            if (v14) {
              [v7 addObject:v14];
            }
          }
          long long v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }

    id v15 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v7;
    id v16 = v7;

    int v17 = +[HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned];
    uint64_t v18 = +[NSSet setWithObject:v17];
    __int16 v19 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = v18;
  }
}

uint64_t sub_1CB70(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = objc_msgSend(a2, "hdw_sample");
  uint64_t v4 = sub_1CBB8(v2, v3);

  return v4;
}

uint64_t sub_1CBB8(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = [v3 _source];
    unsigned int v6 = [v5 _isLocalDevice];

    id v7 = [v4 _source];
    unsigned __int8 v8 = [v7 _isConnectedGymSource];

    if ((v8 & 1) == 0 && (v6 & 1) == 0)
    {
      _HKInitializeLogging();
      id v9 = (void *)HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEBUG)) {
        sub_40A64(v9, v4);
      }
      goto LABEL_6;
    }
    uint64_t v11 = [a1 profile];
    long long v12 = [v11 fitnessMachineManager];
    long long v13 = [v12 fitnessMachineDataProducer];
    unsigned __int8 v14 = [v13 attached];

    id v15 = [a1 profile];
    id v16 = [v15 fitnessMachineManager];
    int v17 = [v16 machinePreferredUntilDate];

    if (v6 && (v14 & 1) == 0)
    {
      _HKInitializeLogging();
      uint64_t v18 = HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEBUG)) {
        sub_40A20(v18);
      }
LABEL_26:
      uint64_t v10 = 0;
      goto LABEL_27;
    }
    __int16 v19 = (void *)a1[5];
    long long v20 = [v4 sampleType];
    LODWORD(v19) = [v19 containsObject:v20];

    if (v19)
    {
      if (v17
        && ([v4 endDate],
            long long v21 = objc_claimAutoreleasedReturnValue(),
            unsigned int v22 = objc_msgSend(v21, "hk_isBeforeOrEqualToDate:", v17),
            v21,
            v22))
      {
        if ((v8 & 1) == 0)
        {
LABEL_24:
          _HKInitializeLogging();
          uint64_t v27 = (void *)HKLogWorkouts;
          if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEBUG)) {
            sub_40850(v27, v4, (uint64_t)v17);
          }
          goto LABEL_26;
        }
      }
      else if ((v6 & 1) == 0)
      {
        goto LABEL_24;
      }
    }
    else
    {
      long long v23 = (void *)a1[4];
      id v24 = [v4 sampleType];
      LODWORD(v23) = [v23 containsObject:v24];

      if (v23) {
        char v25 = v8;
      }
      else {
        char v25 = v6;
      }
      if ((v25 & 1) == 0)
      {
        _HKInitializeLogging();
        long long v26 = (void *)HKLogWorkouts;
        if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEBUG)) {
          sub_40950(v26, v4);
        }
        goto LABEL_26;
      }
    }
    uint64_t v10 = 1;
LABEL_27:

    goto LABEL_28;
  }
LABEL_6:
  uint64_t v10 = 0;
LABEL_28:

  return v10;
}

id sub_1CE34(uint64_t a1, void *a2)
{
  return [a2 addQuantities:*(void *)(a1 + 32) dataSource:*(void *)(a1 + 40)];
}

uint64_t sub_1CF4C(uint64_t a1, void *a2)
{
  return sub_1CBB8(*(void **)(a1 + 32), a2);
}

id sub_1CF54(uint64_t a1, void *a2)
{
  return [a2 addOtherSamples:*(void *)(a1 + 32) dataSource:*(void *)(a1 + 40)];
}

id sub_1D000(uint64_t a1, void *a2)
{
  return [a2 addWorkoutEvents:*(void *)(a1 + 32) dataSource:*(void *)(a1 + 40)];
}

id sub_1D0AC(uint64_t a1, void *a2)
{
  return [a2 addMetadata:*(void *)(a1 + 32) dataSource:*(void *)(a1 + 40)];
}

void sub_1F260(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    id v5 = [WeakRetained fitnessMachineManager];
    [v5 addFitnessMachineSessionObserver:a1];

    unsigned int v6 = *(NSObject **)(a1 + 24);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1FC08;
    v7[3] = &unk_608E8;
    id v8 = v3;
    uint64_t v9 = a1;
    dispatch_async(v6, v7);
  }
}

void sub_1F3C4(void *a1)
{
  switch(a1[5])
  {
    case 6:
    case 7:
    case 8:
    case 9:
    case 0x11:
      unint64_t v2 = a1[6];
      BOOL v3 = v2 > 5;
      uint64_t v4 = (1 << v2) & 0x32;
      if (!v3 && v4 != 0)
      {
        uint64_t v6 = a1[4];
        sub_1F504(v6);
      }
      break;
    case 0xFLL:
      goto LABEL_15;
    case 0x10:
      unint64_t v7 = a1[6];
      BOOL v3 = v7 > 0xF;
      uint64_t v8 = (1 << v7) & 0xE800;
      if (!v3 && v8 != 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
        uint64_t v11 = [WeakRetained fitnessMachineManager];
        [v11 endFitnessMachineSessionWithUUID:*(void *)(a1[4] + 40)];
      }
LABEL_15:
      uint64_t v12 = a1[4];
      sub_1F66C(v12);
      break;
    default:
      return;
  }
}

void sub_1F504(uint64_t a1)
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    BOOL v3 = [WeakRetained fitnessMachineManager];
    uint64_t v4 = [v3 fitnessMachineDataProducer];

    if (v4)
    {
      id v5 = objc_loadWeakRetained((id *)(a1 + 16));
      uint64_t v6 = [v5 workoutDataAccumulator];

      _HKInitializeLogging();
      unint64_t v7 = HKLogWorkouts;
      BOOL v8 = os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v8)
        {
          int v9 = 138543874;
          uint64_t v10 = a1;
          __int16 v11 = 2114;
          uint64_t v12 = v4;
          __int16 v13 = 2114;
          unsigned __int8 v14 = v6;
          _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: At session start, adding %{public}@ as workout data accumulation observer at %{public}@", (uint8_t *)&v9, 0x20u);
        }
        [v6 addDataAccumulationObserver:v4];
      }
      else if (v8)
      {
        int v9 = 138543362;
        uint64_t v10 = a1;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: No accumulator available; marking needs-accumulator and waiting for destination set change.",
          (uint8_t *)&v9,
          0xCu);
      }
    }
  }
}

void sub_1F66C(uint64_t a1)
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    id v6 = [WeakRetained fitnessMachineManager];

    *(unsigned char *)(a1 + 48) = 0;
    [v6 removeFitnessMachineSessionObserver:a1];
    BOOL v3 = [v6 fitnessMachineDataProducer];
    if (v3)
    {
      id v4 = objc_loadWeakRetained((id *)(a1 + 16));
      id v5 = [v4 workoutDataAccumulator];
      [v5 removeDataAccumulationObserver:v3];
    }
  }
}

id sub_1F7BC(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "workoutSessionServer:didChangeConfiguration:");
}

void sub_1F860(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  id v3 = *(id *)(a1 + 40);

  if (WeakRetained != v3)
  {
    int v4 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 48);
    _HKInitializeLogging();
    id v5 = HKLogWorkouts;
    if (v4)
    {
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        int v20 = 138543362;
        uint64_t v21 = v6;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%{public}@: Accumulator changed; considering attaching.",
          (uint8_t *)&v20,
          0xCu);
      }
      id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
      BOOL v8 = [v7 fitnessMachineManager];
      int v9 = [v8 fitnessMachineDataProducer];

      if (v9)
      {
        id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));

        if (v10)
        {
          id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
          [v11 removeDataAccumulationObserver:v9];

          _HKInitializeLogging();
          uint64_t v12 = (void *)HKLogWorkouts;
          if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v13 = *(void *)(a1 + 32);
            unsigned __int8 v14 = v12;
            id v15 = objc_loadWeakRetained((id *)(v13 + 56));
            int v20 = 138543618;
            uint64_t v21 = v13;
            __int16 v22 = 2114;
            id v23 = v15;
            _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopped observing old accumulator %{public}@", (uint8_t *)&v20, 0x16u);
          }
        }
        objc_storeWeak((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
        _HKInitializeLogging();
        id v16 = HKLogWorkouts;
        if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = *(void *)(a1 + 32);
          uint64_t v18 = *(void *)(a1 + 40);
          int v20 = 138543874;
          uint64_t v21 = v17;
          __int16 v22 = 2114;
          id v23 = v9;
          __int16 v24 = 2114;
          uint64_t v25 = v18;
          _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: After accumulator change, adding %{public}@ as workout data accumulation observer at %{public}@", (uint8_t *)&v20, 0x20u);
        }
        [*(id *)(a1 + 40) addDataAccumulationObserver:v9];
      }
    }
    else if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      int v20 = 138543362;
      uint64_t v21 = v19;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Accumulator changed but we do not need to accept new accumulators.", (uint8_t *)&v20, 0xCu);
    }
  }
}

void sub_1FC08(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  _HKInitializeLogging();
  id v3 = HKLogWorkouts;
  BOOL v4 = os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v13 = 138543362;
      uint64_t v14 = v5;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%{public}@: Recovering state", (uint8_t *)&v13, 0xCu);
    }
    sub_1FD84(*(void *)(a1 + 40), *(void **)(a1 + 32));
  }
  else
  {
    if (v4)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v13 = 138543362;
      uint64_t v14 = v6;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%{public}@: Saving recovering state", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    id v7 = (uint64_t *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(v8 + 8));
    id v10 = [WeakRetained fitnessMachineManager];
    id v11 = [v10 currentSessionRecoveryConfiguration];

    if (v11)
    {
      sub_1FE78(*v7, (uint64_t)v11);
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v12 = HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
        sub_40B74(v7, v12);
      }
    }
  }
}

void sub_1FD84(uint64_t a1, void *a2)
{
  if (a1)
  {
    id v3 = a2;
    id v8 = 0;
    BOOL v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v8];

    id v5 = v8;
    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      id v7 = [WeakRetained fitnessMachineManager];
      [v7 recoverSessionWithConfiguration:v4];
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
        sub_40B0C();
      }
    }
  }
}

void sub_1FE78(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    id v12 = 0;
    id v3 = +[NSKeyedArchiver archivedDataWithRootObject:a2 requiringSecureCoding:1 error:&v12];
    id v4 = v12;
    id v5 = v4;
    if (v3) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v4 == 0;
    }
    if (v6)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      id v11 = v5;
      unsigned __int8 v8 = [WeakRetained storeSessionControllerState:v3 forRecoveryIdentifier:@"com.apple.SessionController.GymKit" error:&v11];
      id v9 = v11;

      if ((v8 & 1) == 0)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
          sub_40C58();
        }
      }
      id v5 = v9;
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
        sub_40BF0();
      }
    }
  }
}

void sub_2007C(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqual:*(void *)(*(void *)(a1 + 40) + 40)])
  {
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 48);
    sub_1FE78(v2, v3);
  }
}

id sub_2079C(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "hktest_setStateTransitionCompletionHandler:", *(void *)(a1 + 40));
}

void sub_22AB8(void *a1, uint64_t a2)
{
  if (a1)
  {
    id v8 = 0;
    uint64_t v3 = +[HDHealthServiceCharacteristic buildWithBinaryValue:a2 updateTime:0 error:&v8];
    id v4 = v8;
    if (v3)
    {
      if ((uint64_t)[v3 heartRateValue] <= 0)
      {
        _HKInitializeLogging();
        id v7 = (void *)HKLogServices;
        if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEBUG)) {
          sub_40D38(v7);
        }
      }
      else if ([v3 derivedContactStatus] == (char *)&dword_0 + 2)
      {
        _HKInitializeLogging();
        id v5 = HKLogServices;
        if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEBUG)) {
          sub_40DD8(v5);
        }
      }
      else
      {
        [a1 characteristicDataReceived:v3];
      }
    }
    else
    {
      _HKInitializeLogging();
      BOOL v6 = HKLogServices;
      if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEBUG)) {
        sub_40CC0((uint64_t)v4, v6);
      }
    }
  }
}

void sub_22BE4(void *a1, uint64_t a2)
{
  if (a1)
  {
    id v7 = 0;
    uint64_t v3 = +[HDHealthServiceCharacteristic buildWithBinaryValue:a2 updateTime:0 error:&v7];
    id v4 = v7;
    if (v3)
    {
      objc_msgSend(a1, "setPreferredSensorLocation:", objc_msgSend(v3, "sensorLocation"));
      _HKInitializeLogging();
      id v5 = (void *)HKLogServices;
      if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEBUG)) {
        sub_40E94(v5, (uint64_t)a1, v3);
      }
    }
    else
    {
      _HKInitializeLogging();
      BOOL v6 = HKLogServices;
      if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEBUG)) {
        sub_40E1C((uint64_t)v4, v6);
      }
    }
  }
}

void sub_22CD0(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (a1)
  {
    id v5 = [[HDHeartRateControlPoint alloc] initWithOperation:1];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_22D94;
    v6[3] = &unk_612F0;
    id v7 = v4;
    [a1 writeCharacteristic:v5 expectResponse:0 completion:v6];
  }
}

uint64_t sub_22D94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, const __CFString *, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), @"resetEnergyExpended", a4 == 0);
}

uint64_t sub_23388(uint64_t a1, _DWORD *a2, unsigned __int8 **a3, uint64_t a4, unint64_t a5)
{
  self;
  self;
  uint64_t result = 0;
  if (a3)
  {
    if (a5)
    {
      id v10 = *a3;
      if (*a3)
      {
        id v11 = &v10[a4];
        if ((unint64_t)&v10[a4] <= a5)
        {
          if (a4)
          {
            int v12 = 0;
            int v13 = 0;
            do
            {
              int v14 = *v10++;
              v13 |= v14 << v12;
              v12 += 8;
              --a4;
            }
            while (a4);
          }
          else
          {
            int v13 = 0;
          }
          *a3 = v11;
          if (a2) {
            *a2 = v13;
          }
          return 1;
        }
        else
        {
          uint64_t result = 0;
          *a3 = 0;
        }
      }
    }
  }
  return result;
}

id sub_23C3C(uint64_t a1)
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    uint64_t v2 = [WeakRetained serviceManager];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id sub_23D60(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_registerClient:withConnectionUUID:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void sub_23E08(uint64_t a1)
{
  if (sub_23EA8(*(void *)(a1 + 32), *(void **)(a1 + 40)))
  {
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
    [v2 workoutAppIsReady];
  }
  else
  {
    id v3 = +[NSError hk_error:801 format:@"Unknown connection UUID"];
    sub_23F10(*(void *)(a1 + 32), v3, *(void **)(a1 + 40));
  }
}

BOOL sub_23EA8(uint64_t a1, void *a2)
{
  BOOL v2 = a1;
  if (a1)
  {
    id v3 = *(NSObject **)(a1 + 16);
    id v4 = a2;
    dispatch_assert_queue_V2(v3);
    id v5 = sub_24AF8(v2, v4);

    BOOL v2 = v5 != 0;
  }
  return v2;
}

void sub_23F10(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!a1) {
    goto LABEL_15;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
  id v7 = [v5 domain];
  unsigned int v8 = [v7 isEqualToString:CBInternalErrorDomain];

  if (v8)
  {
    if ([v5 code] == &dword_8)
    {
      HKSessionTrackerAriadneTrigger();
      CFStringRef v9 = @"MFA Authentication Failed";
      uint64_t v10 = 203;
    }
    else
    {
      if ([v5 code] != (char *)&dword_8 + 1) {
        goto LABEL_8;
      }
      HKSessionTrackerAriadneTrigger();
      CFStringRef v9 = @"MFA Authentication Timed Out";
      uint64_t v10 = 204;
    }
    uint64_t v11 = +[NSError hk_error:v10 description:v9 underlyingError:v5];

    id v5 = (id)v11;
LABEL_8:
    _HKInitializeLogging();
    int v12 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      sub_41008((uint64_t)v5, v12);
    }
  }
  if ((objc_msgSend(v5, "hk_isHealthKitErrorWithCode:", 108) & 1) == 0) {
    [*(id *)(a1 + 104) workoutFailedWithError:v5];
  }
  _HKInitializeLogging();
  int v13 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v5;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "(#w0) Fitness machine connection failed with error %{public}@", buf, 0xCu);
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_280D4;
  v14[3] = &unk_61488;
  id v15 = v6;
  id v5 = v5;
  id v16 = v5;
  sub_27E28(a1, v14);

LABEL_15:
}

void sub_241E0(uint64_t a1)
{
}

void sub_241F4(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  id v8 = a3;
  if (!a1) {
    goto LABEL_13;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
  if (v8 && !sub_23EA8(a1, v8))
  {
    int v12 = +[NSError hk_error:801 format:@"Unknown connection UUID"];
    sub_23F10(a1, v12, v8);
    goto LABEL_12;
  }
  if ((a4 & 1) == 0)
  {
    CFStringRef v9 = [*(id *)(a1 + 48) fitnessMachineSessionUUID];
    unsigned __int8 v10 = [v9 isEqual:v7];

    if ((v10 & 1) == 0)
    {
      _HKInitializeLogging();
      int v13 = (void *)HKLogWorkouts;
      if (!os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      int v14 = *(void **)(a1 + 48);
      int v12 = v13;
      id v15 = [v14 fitnessMachineSessionUUID];
      int v16 = 138543618;
      uint64_t v17 = v15;
      __int16 v18 = 2114;
      id v19 = v7;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Ignoring reset request because session uuids don't match: %{public}@ != %{public}@", (uint8_t *)&v16, 0x16u);

LABEL_12:
      goto LABEL_13;
    }
  }
  _HKInitializeLogging();
  uint64_t v11 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315394;
    uint64_t v17 = "-[HDFitnessMachineManager _queue_endFitnessMachineConnectionForFitnessMachineSessionUUID:withConnectionUUID:forcingReset:]";
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Resetting fitness machine connection: %s connectionUUID: %@", (uint8_t *)&v16, 0x16u);
  }
  sub_24574(a1, 0);
LABEL_13:
}

void sub_244B4(uint64_t a1)
{
}

void sub_24560(uint64_t a1)
{
}

void sub_24574(uint64_t a1, char a2)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    id v4 = *(void **)(a1 + 48);
    if (v4)
    {
      if ((a2 & 1) != 0 || !*(unsigned char *)(a1 + 57))
      {
        *(unsigned char *)(a1 + 57) = 1;
        if ([v4 healthServiceSessionIdentifier])
        {
          sub_27128(a1);
        }
        else
        {
          _HKInitializeLogging();
          id v6 = HKLogWorkouts;
          if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint64_t v27 = 0;
            _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Resetting Fitness Machine Manager", v27, 2u);
          }
          [*(id *)(a1 + 96) cancelAllTimers];
          [*(id *)(a1 + 80) detachHealthServiceSession];
          [*(id *)(a1 + 32) tearDown];
          id v7 = *(void **)(a1 + 32);
          *(void *)(a1 + 32) = 0;

          id v8 = +[NSNotificationCenter defaultCenter];
          [v8 postNotificationName:@"HDFitnessMachineMetricsCollectorDidChangeNotification" object:a1];

          CFStringRef v9 = *(void **)(a1 + 104);
          unsigned __int8 v10 = [*(id *)(a1 + 48) fitnessMachine];
          id v11 = [v10 type];
          int v12 = [*(id *)(a1 + 48) fitnessMachine];
          int v13 = [v12 brand];
          [v9 setFitnessMachineType:v11 manufacturer:v13];

          int v14 = *(void **)(a1 + 104);
          id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
          int v16 = [WeakRetained daemon];
          uint64_t v17 = [v16 analyticsSubmissionCoordinator];
          [v14 workoutEndedSubmitMetricsWith:v17];

          sub_26140(a1, 5, 0);
          [*(id *)(a1 + 40) reset];
          __int16 v18 = sub_23C3C(a1);
          [v18 releasePrivateMode];

          id v19 = *(void **)(a1 + 48);
          *(void *)(a1 + 48) = 0;

          int v20 = sub_23C3C(a1);
          uint64_t v21 = (objc_class *)self;
          __int16 v22 = NSStringFromClass(v21);
          [v20 sendBluetoothStatusUpdatesForServer:v22 updateHandler:0 completion:0];

          id v23 = sub_23C3C(a1);
          [v23 resetOOBState];

          *(unsigned char *)(a1 + 57) = 0;
        }
        long long v26 = *(void **)(a1 + 64);
        *(void *)(a1 + 64) = 0;
      }
      else
      {
        _HKInitializeLogging();
        id v5 = HKLogWorkouts;
        if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Ignoring reset request because a reset is already in progress.", buf, 2u);
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      __int16 v24 = HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v29 = 0;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "Ignoring reset request because there is no session.", v29, 2u);
      }
      uint64_t v25 = sub_23C3C(a1);
      [v25 resetOOBState];
    }
  }
}

void sub_24918(uint64_t a1)
{
  _HKInitializeLogging();
  BOOL v2 = (void *)HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(a1 + 40);
    id v5 = v2;
    id v6 = sub_24AF8(v3, v4);
    id v7 = sub_24AF8(*(void *)(a1 + 32), *(void **)(a1 + 40));
    id v8 = [v7 client];
    uint64_t v9 = *(void *)(a1 + 40);
    int v18 = 138412802;
    id v19 = v6;
    __int16 v20 = 2112;
    uint64_t v21 = v8;
    __int16 v22 = 2112;
    uint64_t v23 = v9;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Request to invalidate connection: %@, connection client: %@ with connection UUID: %@", (uint8_t *)&v18, 0x20u);
  }
  if (sub_23EA8(*(void *)(a1 + 32), *(void **)(a1 + 40)))
  {
    _HKInitializeLogging();
    unsigned __int8 v10 = (void *)HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = *(void **)(a1 + 40);
      int v13 = v10;
      int v14 = sub_24AF8(v11, v12);
      id v15 = sub_24AF8(*(void *)(a1 + 32), *(void **)(a1 + 40));
      int v16 = [v15 client];
      uint64_t v17 = *(void *)(a1 + 40);
      int v18 = 138412802;
      id v19 = v14;
      __int16 v20 = 2112;
      uint64_t v21 = v16;
      __int16 v22 = 2112;
      uint64_t v23 = v17;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Invalidating connection: %@, connection client: %@, connection UUID: %@", (uint8_t *)&v18, 0x20u);
    }
    sub_24BB8(*(void *)(a1 + 32), *(void **)(a1 + 40));
  }
}

id sub_24AF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    id v4 = *(void **)(a1 + 24);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_28764;
    v6[3] = &unk_614B0;
    id v7 = v3;
    a1 = objc_msgSend(v4, "hk_firstObjectPassingTest:", v6);
  }

  return (id)a1;
}

void sub_24BB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    id v4 = *(void **)(a1 + 24);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_287A8;
    v5[3] = &unk_614B0;
    id v6 = v3;
    objc_msgSend(v4, "hk_removeObjectsPassingTest:", v5);
  }
}

void sub_24D28(void *a1)
{
  BOOL v2 = (void *)a1[4];
  id v3 = [*(id *)(a1[5] + 48) fitnessMachineSessionUUID];
  LODWORD(v2) = [v2 isEqual:v3];

  if (v2)
  {
    id v4 = [*(id *)(a1[5] + 48) fitnessMachine];
    *(void *)(*(void *)(a1[6] + 8) + 24) = [v4 type];
  }
}

void sub_24E70(uint64_t a1)
{
}

void sub_24E7C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    _HKInitializeLogging();
    id v4 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "(#w0) Fitness machine manager recovering from crash", v23, 2u);
    }
    if (!*(void *)(a1 + 48))
    {
      id v5 = [[HDFitnessMachineSession alloc] initWithRecoveryConfiguration:v3];
      id v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v7 = sub_23C3C(a1);
      id v8 = [*(id *)(a1 + 48) nfcSessionID];
      [v7 enablePrivateModeForSessionWithIdentifier:v8];

      uint64_t v9 = -[HDFitnessMachineSimulatorSupport initWithFitnessMachineType:]([HDFitnessMachineSimulatorSupport alloc], "initWithFitnessMachineType:", [v3 machineType]);
      unsigned __int8 v10 = [*(id *)(a1 + 48) healthService];
      [(HDFitnessMachineSimulatorSupport *)v9 updateAdvertisementDataForSimulation:v10];

      uint64_t v11 = [HDFitnessMachineDataCollector alloc];
      id v12 = [v3 machineType];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      int v14 = [(HDFitnessMachineDataCollector *)v11 initWithFitnessMachineType:v12 profile:WeakRetained];
      id v15 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v14;

      int v16 = *(void **)(a1 + 32);
      uint64_t v17 = [v3 machineBrand];
      [v16 setMachineBrand:v17];

      int v18 = *(void **)(a1 + 32);
      id v19 = [v3 machineStartDate];
      [v18 setMachineStartDate:v19];

      __int16 v20 = *(void **)(a1 + 32);
      uint64_t v21 = [v3 machinePreferredUntilDate];
      [v20 setMachinePreferredUntilDate:v21];

      sub_26140(a1, 6, 0);
      sub_25438(a1, 1);
      __int16 v22 = +[NSNotificationCenter defaultCenter];
      [v22 postNotificationName:@"HDFitnessMachineMetricsCollectorDidChangeNotification" object:a1];
    }
  }
}

void sub_2514C(uint64_t a1)
{
  BOOL v2 = [*(id *)(*(void *)(a1 + 32) + 48) fitnessMachine];
  id v3 = [v2 identifier];

  id v4 = [*(id *)(a1 + 40) machineUUID];
  if (([v3 isEqual:v4] & 1) == 0)
  {

    goto LABEL_6;
  }
  id v5 = [*(id *)(*(void *)(a1 + 32) + 48) fitnessMachineSessionUUID];
  id v6 = [*(id *)(a1 + 40) sessionUUID];
  unsigned __int8 v7 = [v5 isEqual:v6];

  if (v7)
  {
LABEL_6:
    unsigned __int8 v10 = +[HDFitnessMachineSession serviceFromRecoveryConfiguration:*(void *)(a1 + 40)];
    if (!v10)
    {
LABEL_9:

      goto LABEL_10;
    }
    uint64_t v11 = sub_23C3C(*(void *)(a1 + 32));
    [v11 unpairHealthServiceIfNecessary:v10];
LABEL_8:

    goto LABEL_9;
  }
  _HKInitializeLogging();
  id v8 = (void *)HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void **)(a1 + 40);
    unsigned __int8 v10 = v8;
    uint64_t v11 = [v9 machineUUID];
    int v12 = 138412290;
    int v13 = v11;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Not unpairing machine %@ because another workout is active with the same machine", (uint8_t *)&v12, 0xCu);
    goto LABEL_8;
  }
LABEL_10:
}

id sub_25388(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) registerObserver:*(void *)(a1 + 40)];
}

id sub_2542C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) unregisterObserver:*(void *)(a1 + 40)];
}

void sub_25438(uint64_t a1, int a2)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    _HKInitializeLogging();
    id v4 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v24 = a2;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "(#w0) Connecting to fitness machine, reconnect=%{BOOL}d", buf, 8u);
    }
    id v5 = [*(id *)(a1 + 48) healthService];

    if (v5)
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_25834;
      v22[3] = &unk_61370;
      v22[4] = a1;
      id v6 = objc_retainBlock(v22);
      uint64_t v7 = +[NSMutableArray array];
      id v8 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v7;

      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_25AA8;
      v21[3] = &unk_60AC0;
      v21[4] = a1;
      uint64_t v9 = objc_retainBlock(v21);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      void v20[2] = sub_25C90;
      v20[3] = &unk_61398;
      v20[4] = a1;
      unsigned __int8 v10 = objc_retainBlock(v20);
      unint64_t v11 = sub_25DC8(a1, *(void **)(a1 + 48), a2);
      if (v11 <= 1)
      {
        _HKInitializeLogging();
        int v12 = HKLogWorkouts;
        if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "(#w0) Marking MFA authenticated as it's not required", buf, 2u);
        }
        [*(id *)(a1 + 48) markMFAAuthenticated];
      }
      [*(id *)(a1 + 96) beginRetryConnectionTimeout];
      int v13 = sub_23C3C(a1);
      int v14 = [*(id *)(a1 + 48) healthService];
      id v15 = [*(id *)(a1 + 48) oobInfo];
      int v16 = [v15 oobData];
      id v19 = 0;
      id v17 = [v13 connectHealthService:v14 connectionOptions:v11 sessionHandler:v6 dataHandler:v9 mfaSuccessHandler:v10 autoPairData:v16 error:&v19];
      id v18 = v19;

      if (v17)
      {
        [*(id *)(a1 + 48) setHealthServiceSessionIdentifier:v17];
      }
      else if ((objc_msgSend(v18, "hk_isHealthKitErrorWithCode:", 201) & 1) == 0)
      {
        [*(id *)(a1 + 96) cancelRetryConnectionTimeout];
        sub_257C0(a1, v18);
        sub_24574(a1, 0);
      }
    }
    else
    {
      id v6 = +[NSError hk_error:802 description:@"No fitness machine has been found"];
      sub_257C0(a1, v6);
    }
  }
}

void sub_257C0(uint64_t a1, void *a2)
{
  if (a1)
  {
    id v3 = *(NSObject **)(a1 + 16);
    id v4 = a2;
    dispatch_assert_queue_V2(v3);
    sub_23F10(a1, v4, 0);
    [*(id *)(a1 + 40) deliverError:v4];
  }
}

void sub_25834(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  id v8 = a5;
  uint64_t v9 = *(void *)(a1 + 32);
  unsigned __int8 v10 = *(NSObject **)(v9 + 16);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_258E8;
  v12[3] = &unk_61348;
  id v13 = v8;
  uint64_t v14 = a3;
  char v15 = a4;
  v12[4] = v9;
  id v11 = v8;
  dispatch_async(v10, v12);
}

void sub_258E8(uint64_t a1)
{
}

void sub_258FC(uint64_t a1, int *a2, int a3, void *a4)
{
  id v7 = a4;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    id v8 = (int *)[*(id *)(a1 + 48) serviceStatus];
    if (!v7 || v8 != a2)
    {
      _HKInitializeLogging();
      uint64_t v9 = (void *)HKLogServices;
      if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v10 = v9;
        id v11 = _HKStringForHealthServiceStatus();
        int v13 = 138543874;
        uint64_t v14 = v11;
        __int16 v15 = 1024;
        int v16 = a3;
        __int16 v17 = 2114;
        id v18 = v7;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "(#w0) Connection status changed to %{public}@, finished: %{BOOL}d, error: %{public}@", (uint8_t *)&v13, 0x1Cu);
      }
      if (a2 == (int *)((char *)&dword_8 + 1))
      {
        int v12 = *(void **)(a1 + 64);
        *(void *)(a1 + 64) = 0;

        if (*(unsigned char *)(a1 + 56))
        {
          sub_25F4C(a1, v7);
        }
        else if ((objc_msgSend(v7, "hk_isHealthKitErrorWithCode:", 201) & 1) == 0)
        {
          sub_26014(a1);
        }
      }
      else if (a2 == &dword_8)
      {
        if (v7) {
          sub_257C0(a1, v7);
        }
      }
      else if (a2 == (int *)((char *)&dword_4 + 3))
      {
        HKSessionTrackerAriadneTrigger();
        sub_25ED8(a1);
      }
      [*(id *)(a1 + 48) setServiceStatus:a2];
    }
  }
}

void sub_25AA8(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = *(void *)(a1 + 32);
  int v13 = *(NSObject **)(v12 + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_25BA0;
  block[3] = &unk_60F90;
  block[4] = v12;
  id v18 = v9;
  id v20 = v11;
  uint64_t v21 = a2;
  id v19 = v10;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  dispatch_async(v13, block);
}

void sub_25BA0(uint64_t a1)
{
}

void sub_25BB4(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v12 = a2;
  id v9 = a4;
  id v10 = a5;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if ([*(id *)(a1 + 48) dataTransferRequirementsComplete])
    {
      sub_261E0((id)a1);
      objc_msgSend((id)a1, "_queue_handleReceivedCharacteristic:device:error:", v12, v9, v10);
    }
    else
    {
      id v11 = [[_HDHealthServiceDataUpdate alloc] initWithSessionIdentifier:a3 characteristic:v12 device:v9 error:v10];
      [*(id *)(a1 + 64) addObject:v11];
    }
  }
}

void sub_25C90(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  BOOL v2 = *(NSObject **)(v1 + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_25D04;
  block[3] = &unk_60820;
  block[4] = v1;
  dispatch_async(v2, block);
}

dispatch_queue_t *sub_25D04(uint64_t a1)
{
  return sub_25D0C(*(dispatch_queue_t **)(a1 + 32));
}

dispatch_queue_t *sub_25D0C(dispatch_queue_t *result)
{
  if (result)
  {
    uint64_t v1 = result;
    dispatch_assert_queue_V2(result[2]);
    HKSessionTrackerAriadneTrigger();
    uint64_t result = (dispatch_queue_t *)[v1[12] cancelMfaTimeout];
    if (!*((unsigned char *)v1 + 57))
    {
      uint64_t result = (dispatch_queue_t *)[v1[6] waitingOnMFA];
      if (result)
      {
        [v1[13] userIsAuthorized];
        _HKInitializeLogging();
        BOOL v2 = HKLogServices;
        if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v3 = 0;
          _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Marking MFA successful", v3, 2u);
        }
        uint64_t result = (dispatch_queue_t *)[v1[6] markMFAAuthenticated];
        *((unsigned char *)v1 + 56) = 1;
      }
    }
  }
  return result;
}

uint64_t sub_25DC8(uint64_t result, void *a2, char a3)
{
  if (result)
  {
    id v4 = [a2 oobInfo];

    BOOL v5 = v4 != 0;
    BOOL v6 = (a3 & 1) == 0
      && CFPreferencesGetAppBooleanValue(kHKConnectedGymPreferencesSkipMFA, kHKConnectedGymPreferencesDomain, 0) == 0;
    _HKInitializeLogging();
    id v7 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "requireMFA = %{BOOL}d", (uint8_t *)v8, 8u);
    }
    if (v6) {
      return v5 | 2;
    }
    else {
      return v5;
    }
  }
  return result;
}

void sub_25ED8(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    [*(id *)(a1 + 96) cancelRetryConnectionTimeout];
    [*(id *)(a1 + 40) handleBLEConnectionCompletedSuccessfully:1];
    if ([*(id *)(a1 + 48) waitingOnMFA]) {
      [*(id *)(a1 + 96) beginMfaTimeout];
    }
    [*(id *)(a1 + 48) markBluetoothConnectionComplete];
    sub_275B8(a1);
  }
}

void sub_25F4C(uint64_t a1, void *a2)
{
  if (a1)
  {
    id v3 = *(NSObject **)(a1 + 16);
    id v4 = a2;
    dispatch_assert_queue_V2(v3);
    sub_26140(a1, 6, v4);

    dispatch_time_t v5 = dispatch_time(0, 500000000);
    BOOL v6 = *(NSObject **)(a1 + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_261D4;
    block[3] = &unk_60820;
    block[4] = a1;
    dispatch_after(v5, v6, block);
    *(unsigned char *)(a1 + 56) = 0;
  }
}

void sub_26014(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    [*(id *)(a1 + 40) handleBLEConnectionCompletedSuccessfully:0];
    [*(id *)(a1 + 48) setHealthServiceSessionIdentifier:0];
    _HKInitializeLogging();
    BOOL v2 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      BOOL v6 = "-[HDFitnessMachineManager _queue_handleBluetoothDisconnection]";
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Resetting fitness machine connection: %s", (uint8_t *)&v5, 0xCu);
    }
    [*(id *)(a1 + 96) cancelDisconnectTimeout];
    id v3 = sub_23C3C(a1);
    id v4 = [*(id *)(a1 + 48) healthService];
    [v3 unpairHealthServiceIfNecessary:v4];

    sub_24574(a1, 1);
  }
}

void sub_26140(uint64_t a1, uint64_t a2, void *a3)
{
  if (a1)
  {
    int v5 = *(NSObject **)(a1 + 16);
    id v7 = a3;
    dispatch_assert_queue_V2(v5);
    id v6 = [*(id *)(a1 + 48) connectionState];
    [*(id *)(a1 + 48) setConnectionState:a2];
    sub_27C08(a1, (uint64_t)v6, a2, v7, 1);
  }
}

uint64_t sub_261D4(uint64_t a1)
{
  return sub_25438(*(void *)(a1 + 32), 1);
}

id sub_261E0(id result)
{
  if (result)
  {
    uint64_t v1 = (id *)result;
    dispatch_assert_queue_V2(*((dispatch_queue_t *)result + 2));
    while (1)
    {
      uint64_t result = [v1[8] count];
      if (!result) {
        break;
      }
      BOOL v2 = [v1[8] firstObject];
      id v3 = [v2 characteristic];
      id v4 = [v2 device];
      int v5 = [v2 error];
      objc_msgSend(v1, "_queue_handleReceivedCharacteristic:device:error:", v3, v4, v5);

      [v1[8] removeObjectAtIndex:0];
    }
  }
  return result;
}

id sub_26644(id result, void *a2)
{
  if (result)
  {
    uint64_t v2 = (uint64_t)result;
    id v3 = *((void *)result + 2);
    id v4 = a2;
    dispatch_assert_queue_V2(v3);
    int v5 = [*(id *)(v2 + 48) fitnessMachine];
    [v5 _setDevice:v4];

    id v6 = [*(id *)(v2 + 48) fitnessMachine];
    id v7 = [v4 manufacturer];
    [v6 _setBrand:v7];

    id v8 = *(void **)(v2 + 32);
    id v9 = [v4 manufacturer];

    [v8 setMachineBrand:v9];
    sub_277F4(v2, 1);
    id v10 = *(void **)(v2 + 72);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    void v11[2] = sub_27938;
    void v11[3] = &unk_613C0;
    v11[4] = v2;
    return [v10 notifyObservers:v11];
  }
  return result;
}

void sub_26768(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if ((sub_26AC4(a1, v3) & 1) == 0) {
      [*(id *)(a1 + 32) handleDataCharacteristic:v3];
    }
  }
}

void sub_267D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if ((sub_26B44(a1, v3) & 1) == 0)
    {
      unint64_t v4 = (unint64_t)[*(id *)(a1 + 48) machineState];
      switch((unint64_t)[v3 machineState])
      {
        case 1uLL:
          if ((v4 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
            goto LABEL_6;
          }
          if (!v4)
          {
            [*(id *)(a1 + 80) sendInitialValues];
            uint64_t v5 = 4;
            goto LABEL_17;
          }
          break;
        case 2uLL:
        case 4uLL:
          sub_26BEC((void *)a1);
LABEL_6:
          uint64_t v5 = 2;
          goto LABEL_17;
        case 3uLL:
          [*(id *)(a1 + 96) beginPauseTimeout];
          [*(id *)(a1 + 80) pauseCurrentSession];
          uint64_t v5 = 3;
          goto LABEL_17;
        case 5uLL:
          [*(id *)(a1 + 96) cancelWaitForMachineStartTimeout];
          if (v4 == 3)
          {
            [*(id *)(a1 + 96) cancelPauseTimeout];
            [*(id *)(a1 + 80) resumeCurrentSession];
          }
          else if (v4 == 4)
          {
            _HKInitializeLogging();
            id v6 = (void *)HKLogWorkouts;
            if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
            {
              id v7 = v6;
              id v8 = [v3 updateTime];
              int v12 = 138412290;
              int v13 = v8;
              _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Detected that machine started on %@", (uint8_t *)&v12, 0xCu);
            }
            id v9 = *(void **)(a1 + 32);
            id v10 = [v3 updateTime];
            [v9 setMachineStartDate:v10];

            [*(id *)(a1 + 48) setMachinePreferredUntilDate:0];
          }
          uint64_t v5 = 1;
LABEL_17:
          if (v5 != v4)
          {
            id v11 = [v3 updateTime];
            sub_26CB8(a1, v5, v11);
          }
          break;
        default:
          break;
      }
    }
  }
}

void sub_26A00(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (([*(id *)(a1 + 48) waitingOnInitialMachineStatus] & 1) != 0
      || [*(id *)(a1 + 48) waitingOnInitialMachineData])
    {
      _HKInitializeLogging();
      unint64_t v4 = HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Not handling enhanced FTMS as dependencies aren't satisfied", v5, 2u);
      }
      [*(id *)(a1 + 48) setInitialEnhancedFTMSData:v3];
    }
    else
    {
      [*(id *)(a1 + 32) handleDataCharacteristic:v3];
    }
  }
}

uint64_t sub_26AC4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (([*(id *)(a1 + 48) waitingOnInitialMachineStatus] & 1) != 0
      || [*(id *)(a1 + 48) waitingOnInitialMachineData])
    {
      [*(id *)(a1 + 48) setWaitingOnInitialMachineData:0];
      [*(id *)(a1 + 48) setInitialMachineData:v3];
      sub_26DB8(a1);
      a1 = 1;
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

uint64_t sub_26B44(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (([*(id *)(a1 + 48) waitingOnInitialMachineStatus] & 1) != 0
      || [*(id *)(a1 + 48) waitingOnInitialMachineData])
    {
      [*(id *)(a1 + 48) setWaitingOnInitialMachineStatus:0];
      unint64_t v4 = (char *)[v3 machineState];
      uint64_t v5 = *(void **)(a1 + 48);
      if (v4 != (unsigned char *)&dword_0 + 1)
      {
        [v5 setInitialMachineStatus:v3];
        sub_26DB8(a1);
        a1 = 1;
        goto LABEL_8;
      }
      [v5 setWaitingOnInitialMachineData:0];
      [*(id *)(a1 + 48) setInitialMachineData:0];
    }
    a1 = 0;
  }
LABEL_8:

  return a1;
}

void *sub_26BEC(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    _HKInitializeLogging();
    uint64_t v2 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Delivering final Eurotas values and disconnecting", buf, 2u);
    }
    id v3 = (void *)v1[10];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_27774;
    v4[3] = &unk_613E8;
    void v4[4] = v1;
    return [v3 deliverFinalValuesAndDetachWithCompletion:v4];
  }
  return result;
}

void sub_26CB8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (a2 == 1)
    {
      id v6 = [*(id *)(a1 + 48) machineStartDate];

      if (!v6)
      {
        [*(id *)(a1 + 48) setMachineStartDate:v5];
        id v7 = *(void **)(a1 + 72);
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_279C8;
        v9[3] = &unk_613C0;
        void v9[4] = a1;
        [v7 notifyObservers:v9];
      }
    }
    id v8 = [*(id *)(a1 + 48) machineState];
    [*(id *)(a1 + 48) setMachineState:a2];
    [*(id *)(a1 + 48) setMachineStateUpdateDate:v5];
    sub_27A58(a1, (uint64_t)v8, v5);
  }
}

void sub_26DB8(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (([*(id *)(a1 + 48) waitingOnInitialMachineStatus] & 1) == 0
      && ([*(id *)(a1 + 48) waitingOnInitialMachineData] & 1) == 0)
    {
      uint64_t v2 = [*(id *)(a1 + 48) initialMachineData];
      double v3 = (double)[v2 elapsedTime];

      unint64_t v4 = [*(id *)(a1 + 48) initialMachineData];
      id v5 = [v4 updateTime];
      id v6 = +[NSDate dateWithTimeInterval:v5 sinceDate:-v3];

      _HKInitializeLogging();
      id v7 = HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138543362;
        id v15 = v6;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Notifying workouts that we've been running since %{public}@", (uint8_t *)&v14, 0xCu);
      }
      sub_26CB8(a1, 1, v6);
      id v8 = [*(id *)(a1 + 48) initialMachineData];
      id v9 = [v8 updateTime];
      sub_26FE4((void *)a1, v9);

      [*(id *)(a1 + 32) setMachineStartDate:v6];
      id v10 = [*(id *)(a1 + 48) initialMachineData];
      sub_26768(a1, v10);

      id v11 = [*(id *)(a1 + 48) initialEnhancedFTMSData];

      if (v11)
      {
        int v12 = [*(id *)(a1 + 48) initialEnhancedFTMSData];
        sub_26A00(a1, v12);
      }
      int v13 = [*(id *)(a1 + 48) initialMachineStatus];
      sub_267D4(a1, v13);

      [*(id *)(a1 + 48) setInitialMachineStatus:0];
      [*(id *)(a1 + 48) setInitialMachineData:0];
      [*(id *)(a1 + 48) setInitialEnhancedFTMSData:0];
    }
  }
}

void *sub_26FE4(void *result, void *a2)
{
  if (result)
  {
    uint64_t v2 = result;
    double v3 = (void *)result[6];
    id v4 = a2;
    [v3 setMachinePreferredUntilDate:v4];
    [(id)v2[4] setMachinePreferredUntilDate:v4];

    id v5 = (void *)v2[9];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_27098;
    v6[3] = &unk_613C0;
    void v6[4] = v2;
    return [v5 notifyObservers:v6];
  }
  return result;
}

void sub_27098(uint64_t a1, void *a2)
{
  double v3 = *(void **)(*(void *)(a1 + 32) + 48);
  id v4 = a2;
  id v6 = [v3 fitnessMachineSessionUUID];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 48) recoveryConfiguration];
  [v4 fitnessMachineSessionUUID:v6 updatedRecoveryConfiguration:v5];
}

void sub_27128(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    [*(id *)(a1 + 96) cancelMfaTimeout];
    [*(id *)(a1 + 96) cancelWaitForMachineStartTimeout];
    if ([*(id *)(a1 + 48) healthServiceSessionIdentifier])
    {
      _HKInitializeLogging();
      uint64_t v2 = HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v4 = 0;
        _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "(#w0) Disconnecting from fitness machine", v4, 2u);
      }
      *(unsigned char *)(a1 + 56) = 0;
      [*(id *)(a1 + 96) beginDisconnectTimeout];
      double v3 = sub_23C3C(a1);
      objc_msgSend(v3, "disconnectHealthService:", objc_msgSend(*(id *)(a1 + 48), "healthServiceSessionIdentifier"));
    }
  }
}

void sub_27340(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_27DD4;
    v4[3] = &unk_61410;
    id v5 = v3;
    sub_27E28(a1, v4);
  }
}

void sub_273E0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_27484;
  block[3] = &unk_60C98;
  id v10 = v5;
  uint64_t v11 = a2;
  block[4] = v6;
  id v8 = v5;
  dispatch_async(v7, block);
}

void sub_27484(uint64_t a1)
{
}

void sub_27494(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (a2 == 2)
    {
      if ([*(id *)(a1 + 96) isDisconnectTimerValid])
      {
        _HKInitializeLogging();
        uint64_t v6 = HKLogServices;
        if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Re-attempting disconnect", buf, 2u);
        }
        sub_27128(a1);
      }
      else if ([*(id *)(a1 + 96) isRetryConnectionTimerValid])
      {
        _HKInitializeLogging();
        id v7 = HKLogServices;
        if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v8 = 0;
          _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Re-attempting connect", v8, 2u);
        }
        sub_25438(a1, *(unsigned char *)(a1 + 56) == 0);
        [*(id *)(a1 + 96) cancelRetryConnectionTimeout];
      }
    }
  }
}

void sub_275B8(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if ([*(id *)(a1 + 48) dataTransferRequirementsComplete]
      && [*(id *)(a1 + 48) connectionState] != &dword_4)
    {
      [*(id *)(a1 + 96) beginWaitForMachineStartTimeout];
      if (!*(unsigned char *)(a1 + 57) && ([*(id *)(a1 + 48) waitingOnMFA] & 1) == 0)
      {
        _HKInitializeLogging();
        id v7 = HKLogWorkouts;
        if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v8[0]) = 0;
          _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Data transfer permitted (MFA not required). Allowing reconnect.", (uint8_t *)v8, 2u);
        }
        *(unsigned char *)(a1 + 56) = 1;
      }
      sub_26140(a1, 4, 0);
      objc_msgSend(*(id *)(a1 + 80), "attachHealthServiceSession:", objc_msgSend(*(id *)(a1 + 48), "healthServiceSessionIdentifier"));
      sub_261E0((id)a1);
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v2 = (void *)HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
      {
        id v3 = *(void **)(a1 + 48);
        id v4 = v2;
        LODWORD(v3) = [v3 dataTransferPermitted];
        unsigned int v5 = [*(id *)(a1 + 48) waitingOnBluetoothConnection];
        unsigned int v6 = [*(id *)(a1 + 48) waitingOnActivityType];
        v8[0] = 67109632;
        v8[1] = v3;
        __int16 v9 = 1024;
        unsigned int v10 = v5;
        __int16 v11 = 1024;
        unsigned int v12 = v6;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Not sending connection success -- Not all connection requirements are complete. dataTransferPermitted=%{BOOL}d, waitingOnBluetoothConnection=%{BOOL}d, waitingOnActivityType=%{BOOL}d", (uint8_t *)v8, 0x14u);
      }
    }
  }
}

void sub_27774(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_277E8;
  block[3] = &unk_60820;
  block[4] = v1;
  dispatch_async(v2, block);
}

void sub_277E8(uint64_t a1)
{
}

void sub_277F4(uint64_t a1, int a2)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    _HKInitializeLogging();
    id v4 = (void *)HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v5 = *(void **)(a1 + 48);
      unsigned int v6 = v4;
      id v7 = [v5 fitnessMachine];
      *(_DWORD *)buf = 138412290;
      unsigned int v10 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Fitness machine information updated %@", buf, 0xCu);
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    _DWORD v8[2] = sub_27F44;
    v8[3] = &unk_61410;
    void v8[4] = a1;
    sub_27E28(a1, v8);
    if (a2) {
      [*(id *)(a1 + 40) updatedFitnessMachine];
    }
  }
}

void sub_27938(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 48);
  id v4 = a2;
  id v6 = [v3 fitnessMachineSessionUUID];
  unsigned int v5 = [*(id *)(*(void *)(a1 + 32) + 48) recoveryConfiguration];
  [v4 fitnessMachineSessionUUID:v6 updatedRecoveryConfiguration:v5];
}

void sub_279C8(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 48);
  id v4 = a2;
  id v6 = [v3 fitnessMachineSessionUUID];
  unsigned int v5 = [*(id *)(*(void *)(a1 + 32) + 48) recoveryConfiguration];
  [v4 fitnessMachineSessionUUID:v6 updatedRecoveryConfiguration:v5];
}

void sub_27A58(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    id v6 = *(void **)(a1 + 40);
    id v7 = [*(id *)(a1 + 48) machineState];
    id v8 = [*(id *)(a1 + 48) fitnessMachineSessionUUID];
    [v6 updatedFitnessMachineState:v7 fitnessMachineSessionUUID:v8];

    _HKInitializeLogging();
    __int16 v9 = (void *)HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v10 = v9;
      __int16 v11 = _HKStringForFitnessMachineState();
      [*(id *)(a1 + 48) machineState];
      unsigned int v12 = _HKStringForFitnessMachineState();
      *(_DWORD *)buf = 138543618;
      __int16 v17 = v11;
      __int16 v18 = 2114;
      id v19 = v12;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Fitness machine state changed from %{public}@ to %{public}@", buf, 0x16u);
    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_27FB4;
    v13[3] = &unk_61438;
    void v13[4] = a1;
    uint64_t v15 = a2;
    id v14 = v5;
    sub_27E28(a1, v13);
  }
}

void sub_27C08(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, int a5)
{
  id v9 = a4;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    _HKInitializeLogging();
    unsigned int v10 = (void *)HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = v10;
      unsigned int v12 = _HKStringForFitnessMachineConnectionState();
      int v13 = _HKStringForFitnessMachineConnectionState();
      id v14 = [*(id *)(a1 + 48) fitnessMachineSessionUUID];
      *(_DWORD *)buf = 138544130;
      uint64_t v25 = v12;
      __int16 v26 = 2114;
      uint64_t v27 = v13;
      __int16 v28 = 2114;
      id v29 = v9;
      __int16 v30 = 2114;
      unint64_t v31 = v14;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Fitness machine connection state changed from %{public}@ to %{public}@, error %{public}@ in sessionID %{public}@", buf, 0x2Au);
    }
    id v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    __int16 v18 = sub_2804C;
    id v19 = &unk_61460;
    uint64_t v22 = a3;
    uint64_t v23 = a2;
    uint64_t v20 = a1;
    id v15 = v9;
    id v21 = v15;
    sub_27E28(a1, &v16);
    if (a5) {
      objc_msgSend(*(id *)(a1 + 40), "updatedConnectionStateWithError:", v15, v16, v17, v18, v19, v20);
    }
  }
}

void sub_27DD4(uint64_t a1, void *a2)
{
  id v3 = [a2 client];
  objc_msgSend(v3, "clientRemote_deliverDetectedNFC:", *(void *)(a1 + 32));
}

void sub_27E28(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = *(id *)(a1 + 24);
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          v3[2](v3, *(void *)(*((void *)&v9 + 1) + 8 * (void)v8));
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

void sub_27F44(uint64_t a1, void *a2)
{
  id v4 = [a2 client];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 48) fitnessMachine];
  objc_msgSend(v4, "clientRemote_deliverMachineInformationUpdated:", v3);
}

void sub_27FB4(void *a1, void *a2)
{
  id v6 = [a2 client];
  id v3 = [*(id *)(a1[4] + 48) machineState];
  uint64_t v4 = a1[6];
  id v5 = [*(id *)(a1[4] + 48) fitnessMachineSessionUUID];
  objc_msgSend(v6, "clientRemote_deliverMachineChangedToState:fromState:fitnessMachineSessionUUID:date:", v3, v4, v5, a1[5]);
}

void sub_2804C(void *a1, void *a2)
{
  id v6 = [a2 client];
  uint64_t v3 = a1[6];
  uint64_t v4 = a1[7];
  id v5 = [*(id *)(a1[4] + 48) fitnessMachineSessionUUID];
  objc_msgSend(v6, "clientRemote_deliverConnectionChangedToState:fromState:fitnessMachineSessionUUID:error:", v3, v4, v5, a1[5]);
}

void sub_280D4(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (!*(void *)(a1 + 32)
    || ([v7 uuid],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        unsigned int v4 = [v3 isEqual:*(void *)(a1 + 32)],
        v3,
        id v5 = v7,
        v4))
  {
    id v6 = [v7 client];
    objc_msgSend(v6, "clientRemote_deliverFailedWithError:", *(void *)(a1 + 40));

    id v5 = v7;
  }
}

void sub_286D0(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    uint64_t v3 = [v5 uuid];
    unsigned int v4 = sub_24AF8(a1, v3);

    if (!v4) {
      [*(id *)(a1 + 24) addObject:v5];
    }
  }
}

id sub_28764(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 uuid];
  id v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

id sub_287A8(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 uuid];
  id v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

id sub_288CC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleBeginPairing:", *(void *)(a1 + 40));
}

void sub_289AC(uint64_t a1)
{
  sub_24574(*(void *)(a1 + 32), 0);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);

  sub_257C0(v2, v3);
}

void sub_28B04(uint64_t a1)
{
}

void sub_28B88(uint64_t *a1)
{
}

void sub_28C14(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) markActivityTypeProvided];
  [*(id *)(*(void *)(a1 + 32) + 48) markDataTransferPermitted];
  uint64_t v2 = *(void *)(a1 + 32);

  sub_275B8(v2);
}

void sub_28CD4(uint64_t a1)
{
  uint64_t v2 = [HDFitnessMachineDataCollector alloc];
  uint64_t v3 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v5 = [(HDFitnessMachineDataCollector *)v2 initWithFitnessMachineType:v3 profile:WeakRetained];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v5;

  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 postNotificationName:@"HDFitnessMachineMetricsCollectorDidChangeNotification" object:*(void *)(a1 + 32)];
}

void sub_28DF4(uint64_t a1)
{
}

void sub_28E7C(uint64_t a1)
{
}

void sub_28E84(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    _HKInitializeLogging();
    uint64_t v2 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 136315138;
      id v4 = "-[HDFitnessMachineManager _queue_simulateDisconnect]";
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v3, 0xCu);
    }
    sub_24574(a1, 1);
  }
}

void *sub_28FE4(uint64_t a1)
{
  return sub_26FE4(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

void sub_29064(uint64_t a1)
{
  uint64_t v2 = [HDFitnessMachineDataCollector alloc];
  uint64_t v3 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v5 = [(HDFitnessMachineDataCollector *)v2 initWithFitnessMachineType:v3 profile:WeakRetained];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v5;

  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 postNotificationName:@"HDFitnessMachineMetricsCollectorDidChangeNotification" object:*(void *)(a1 + 32)];
}

void sub_291A8(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) fitnessMachine];
  uint64_t v3 = [v2 device];

  if (v3)
  {
    id v4 = *(id **)(a1 + 32);
    id v5 = [v4[6] fitnessMachine];
    uint64_t v6 = [v5 device];
    sub_26644(v4, v6);
  }
  if (![*(id *)(*(void *)(a1 + 32) + 48) healthServiceSessionIdentifier]) {
    [*(id *)(*(void *)(a1 + 32) + 48) setHealthServiceSessionIdentifier:qword_75B48++];
  }
  if (([*(id *)(*(void *)(a1 + 32) + 80) attached] & 1) == 0) {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "attachHealthServiceSession:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "healthServiceSessionIdentifier"));
  }
  uint64_t v7 = *(void *)(a1 + 32);

  sub_277F4(v7, 0);
}

uint64_t sub_293B0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_293C0(uint64_t a1)
{
}

void sub_293C8(uint64_t a1)
{
}

void sub_29474(uint64_t a1)
{
  uint64_t v1 = *(id **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [v1[6] fitnessMachine];
  uint64_t v3 = [v4 device];
  objc_msgSend(v1, "_queue_handleReceivedCharacteristic:device:error:", v2, v3, 0);
}

void sub_29560(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 48) healthServiceSessionIdentifier];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    sub_27128(v3);
    uint64_t v5 = *(void *)(a1 + 32);
    sub_26014(v5);
  }
  else
  {
    id v4 = *(void **)(v3 + 96);
    [v4 cancelAllTimers];
  }
}

void sub_297E8(void *a1)
{
  if (a1)
  {
    id v2 = [a1 profile];
    uint64_t v3 = [v2 fitnessMachineManager];
    id v4 = [v3 metricsCollector];

    [v4 removeObserver:a1];
  }
}

void sub_29CA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    sub_413A4(a1, (uint64_t)v3, v4);
  }
}

id sub_29D10(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          unint64_t v11 = (unint64_t)objc_msgSend(v10, "unsignedIntegerValue", (void)v18) - 1;
          if (v11 <= 0x12 && ((0x51AD9u >> v11) & 1) != 0)
          {
            id v12 = *(id *)*(&off_614D0 + v11);
            if (v12)
            {
              int v13 = v12;
              id v14 = [v5 objectForKeyedSubscript:v10];
              [v4 setObject:v14 forKeyedSubscript:v13];
            }
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }

    if ([v4 count]) {
      id v15 = v4;
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

id sub_29ECC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) addEntriesFromDictionary:*(void *)(a1 + 40)];
}

id sub_29EE0(uint64_t a1, void *a2)
{
  return [a2 addMetadata:*(void *)(a1 + 32) dataSource:*(void *)(a1 + 40)];
}

void sub_2A154(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = *(NSObject **)(a1 + 48);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_2A738;
    block[3] = &unk_60820;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

void sub_2A1D8(uint64_t a1, char a2)
{
  if (a1)
  {
    id v2 = *(NSObject **)(a1 + 48);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_2AD24;
    v3[3] = &unk_60B40;
    char v4 = a2;
    v3[4] = a1;
    dispatch_async(v2, v3);
  }
}

void sub_2A260(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = v3;
  if (a1)
  {
    id v5 = *(NSObject **)(a1 + 48);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_2AE3C;
    v6[3] = &unk_608E8;
    void v6[4] = a1;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

void sub_2A310(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = v3;
  if (a1)
  {
    if ([v3 type])
    {
      id v5 = +[HDDaemonTransaction transactionWithOwner:a1 activityName:@"Connect"];
      id v6 = *(NSObject **)(a1 + 48);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_2A894;
      block[3] = &unk_607A8;
      block[4] = a1;
      id v9 = v4;
      id v10 = v5;
      id WeakRetained = v5;
      dispatch_async(v6, block);
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      [WeakRetained startOneShotCollectionForService:v4];
    }
  }
}

void sub_2A4A4(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    id v2 = *(NSObject **)(a1 + 48);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_2A520;
    v3[3] = &unk_609D0;
    v3[4] = a1;
    void v3[5] = a2;
    dispatch_async(v2, v3);
  }
}

void sub_2A520(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  int v3 = v1 == 2;
  int v4 = *(unsigned __int8 *)(v2 + 33);
  *(unsigned char *)(v2 + 33) = v3;
  if (v4 != v3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v5 + 32))
    {
      if (v1 == 2) {
        sub_2A154(v5);
      }
      else {
        sub_2A1D8(v5, 0);
      }
    }
  }
}

void sub_2A560(id val)
{
  if (val)
  {
    objc_initWeak(&location, val);
    uint64_t v2 = (void *)*((void *)val + 2);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_2A698;
    v5[3] = &unk_61570;
    objc_copyWeak(&v6, &location);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_2A6E8;
    v3[3] = &unk_61570;
    objc_copyWeak(&v4, &location);
    [v2 sendBluetoothStatusUpdatesForServer:@"_Connection_Manager" updateHandler:v5 completion:v3];
    objc_destroyWeak(&v4);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void sub_2A674(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_2A698(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_2A4A4((uint64_t)WeakRetained, a2);
}

void sub_2A6E8(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_2A4A4((uint64_t)WeakRetained, a2);
}

void sub_2A738(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 33))
  {
    uint64_t v3 = *(void **)(v1 + 16);
    id v17 = 0;
    id v4 = [v3 reviewSavedHealthServiceSessionsWithError:&v17];
    id v5 = v17;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          id v12 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "objectForKey:", v11, (void)v13);
          if (v12) {
            sub_2A310(*(void *)(a1 + 32), v11);
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v8);
    }
  }
}

void sub_2A894(id *a1)
{
  uint64_t v2 = [*((id *)a1[4] + 5) objectForKeyedSubscript:a1[5]];

  if (v2)
  {
    id v3 = a1[6];
    [v3 invalidate];
  }
  else
  {
    objc_initWeak(&location, a1[4]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_2AB3C;
    v15[3] = &unk_615C0;
    id v16 = a1[6];
    objc_copyWeak(&v18, &location);
    id v17 = a1[5];
    id v4 = objc_retainBlock(v15);
    id v5 = (void *)*((void *)a1[4] + 2);
    id v6 = a1[5];
    id v14 = 0;
    id v7 = [v5 connectHealthService:v6 sessionHandler:v4 dataHandler:&stru_615E0 error:&v14];
    id v8 = v14;
    _HKInitializeLogging();
    uint64_t v9 = HKLogServices;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [a1[5] identifier];
      uint64_t v11 = [v10 UUIDString];
      *(_DWORD *)buf = 138543362;
      long long v21 = v11;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Connecting service: %{public}@", buf, 0xCu);
    }
    if (v7)
    {
      id v12 = (void *)*((void *)a1[4] + 5);
      long long v13 = +[NSNumber numberWithUnsignedInteger:v7];
      [v12 setObject:v13 forKey:a1[5]];
    }
    objc_destroyWeak(&v18);

    objc_destroyWeak(&location);
  }
}

void sub_2AB14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2AB3C(id *a1, uint64_t a2, uint64_t a3, int a4, void *a5)
{
  id v7 = a5;
  if (a4) {
    [a1[4] invalidate];
  }
  id WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
  uint64_t v9 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = WeakRetained[6];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_2AC10;
    block[3] = &unk_61598;
    char v14 = a4;
    id v12 = a1[5];
    long long v13 = v9;
    dispatch_async(v10, block);
  }
}

void sub_2AC10(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    _HKInitializeLogging();
    uint64_t v2 = (void *)HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = *(void **)(a1 + 32);
      id v4 = v2;
      id v5 = [v3 identifier];
      id v6 = [v5 UUIDString];
      int v8 = 138543362;
      uint64_t v9 = v6;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Disconnecting service: %{public}@", (uint8_t *)&v8, 0xCu);
    }
    [*(id *)(*(void *)(a1 + 40) + 40) removeObjectForKey:*(void *)(a1 + 32)];
    uint64_t v7 = *(void *)(a1 + 40);
    if (*(unsigned char *)(v7 + 32))
    {
      if (*(unsigned char *)(v7 + 33)) {
        sub_2A154(v7);
      }
    }
  }
}

void sub_2AD24(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
  }
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) allValues];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "disconnectHealthService:", objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)v6), "unsignedIntegerValue"));
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void sub_2AE3C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:*(void *)(a1 + 40)];
  id v3 = [v2 unsignedIntegerValue];

  if (v3)
  {
    id v4 = *(void **)(*(void *)(a1 + 32) + 16);
    [v4 disconnectHealthService:v3];
  }
}

BOOL fieldTypeIsHeartRate(int a1)
{
  return a1 == 1 || a1 == 4;
}

uint64_t sub_2B5F4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!result) {
    return result;
  }
  int v7 = a3;
  uint64_t result = (uint64_t)[(id)objc_opt_class() uint8:a3 toData:a4 before:a5];
  if (!result) {
    return result;
  }
  if (a2 == 65534)
  {
    unsigned __int8 v10 = 1;
    if (v7 != 1 && v7 != 4)
    {
      _HKInitializeLogging();
      id v12 = HKLogServices;
      uint64_t result = os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_41430(v7, v12);
        return 0;
      }
      return result;
    }
    goto LABEL_13;
  }
  if (a2 == 0xFFFF)
  {
    if (v7 == 4 || v7 == 1) {
      unsigned __int8 v10 = 2;
    }
    else {
      unsigned __int8 v10 = 1;
    }
LABEL_13:
    uint64_t result = (uint64_t)[(id)objc_opt_class() uint8:1 toData:a4 before:a5];
    if (result) {
      return ([(id)objc_opt_class() uint8:v10 toData:a4 before:a5] & 1) != 0;
    }
    return result;
  }
  uint64_t result = (uint64_t)[(id)objc_opt_class() uint8:3 toData:a4 before:a5];
  if (result)
  {
    unsigned int v11 = [(id)objc_opt_class() uint8:0 toData:a4 before:a5];
    uint64_t result = 0;
    if (v11)
    {
      uint64_t result = (uint64_t)[(id)objc_opt_class() uint16:a2 toData:a4 before:a5];
      if (result) {
        return 1;
      }
    }
  }
  return result;
}

void sub_2B868(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

id sub_2BB08(uint64_t a1)
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 96);
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v6);
        if (v7 && *(void *)(v7 + 24))
        {
          long long v8 = *(void (***)(void, void, void, void))(v7 + 24);
          uint64_t v9 = *(void *)(a1 + 32);
          unsigned __int8 v10 = v8;
          unsigned int v11 = +[NSError hk_error:300, @"Device disconnected", (void)v14 description];
          ((void (**)(void, uint64_t, void, void *))v8)[2](v10, v9, 0, v11);
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v12 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      id v4 = v12;
    }
    while (v12);
  }

  [*(id *)(*(void *)(a1 + 32) + 96) removeAllObjects];
  id result = [*(id *)(*(void *)(a1 + 32) + 80) removeAllObjects];
  *(unsigned char *)(*(void *)(a1 + 32) + 34) = 0;
  return result;
}

void sub_2BF44(uint64_t a1)
{
}

void sub_2BF50(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    _HKInitializeLogging();
    id v4 = (void *)HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEBUG)) {
      sub_414F0(a1, v4, (uint64_t)v3);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    id v6 = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v7 = [v6 deviceInformation];
    [WeakRetained characteristicReceived:v3 device:v7];
  }
}

void sub_2BFFC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    _HKInitializeLogging();
    id v4 = (void *)HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = v4;
      id v6 = NSStringFromSelector("_bufferCharacteristicToBeNotified:");
      *(_DWORD *)buf = 138412546;
      uint64_t v11 = a1;
      __int16 v12 = 2112;
      long long v13 = v6;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
    }
    uint64_t v7 = *(NSObject **)(a1 + 8);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    _DWORD v8[2] = sub_2D01C;
    v8[3] = &unk_608E8;
    void v8[4] = a1;
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

void sub_2C1D4(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = [*(id *)(a1 + 96) objectAtIndexedSubscript:0];
    uint64_t v7 = (void *)v6;
    if (v6 && *(void *)(v6 + 24)) {
      (*(void (**)(void, uint64_t, id, id))(*(void *)(v6 + 24) + 16))(*(void *)(v6 + 24), a1, v8, v5);
    }
    [*(id *)(a1 + 96) removeObjectAtIndex:0];
    sub_2C2A0(a1);
  }
}

void sub_2C2A0(id *a1)
{
  if (a1 && [a1[12] count])
  {
    uint64_t v2 = [a1[12] objectAtIndexedSubscript:0];
    id v3 = [(id)objc_opt_class() uuid];
    id v4 = [a1[10] objectForKeyedSubscript:v3];
    if (v4)
    {
      if (v2)
      {
        BOOL v5 = *(unsigned char *)(v2 + 8) == 0;
        uint64_t v6 = *(void **)(v2 + 16);
      }
      else
      {
        uint64_t v6 = 0;
        BOOL v5 = 1;
      }
      id v19 = 0;
      id v7 = v6;
      id v8 = [v7 getBinaryValueWithError:&v19];
      id v9 = v19;

      if (!v8 || v9)
      {
        sub_2C1D4((uint64_t)a1, 0, v9);
      }
      else
      {
        id WeakRetained = objc_loadWeakRetained(a1 + 6);
        uint64_t v11 = [WeakRetained cbPeripheral];

        _HKInitializeLogging();
        __int16 v12 = (void *)HKLogServices;
        if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v18 = v5;
          if (v2) {
            long long v13 = *(void **)(v2 + 16);
          }
          else {
            long long v13 = 0;
          }
          id v17 = v13;
          long long v14 = v12;
          id v15 = objc_loadWeakRetained(a1 + 6);
          *(_DWORD *)buf = 138413826;
          long long v21 = v8;
          __int16 v22 = 2112;
          uint64_t v23 = v4;
          __int16 v24 = 2112;
          uint64_t v25 = v11;
          __int16 v26 = 2112;
          uint64_t v27 = v13;
          __int16 v28 = 2112;
          id v29 = v15;
          __int16 v30 = 2112;
          unint64_t v31 = a1;
          __int16 v32 = 2048;
          BOOL v5 = v18;
          BOOL v33 = v18;
          _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Attempting to write data (%@) to CBCharacteristic: %@, CBPeripheral: %@, HDCharacteristic: %@, HDPeripheral: %@, HDHealthService: %@ with write type %ld", buf, 0x48u);
        }
        [v11 writeValue:v8 forCharacteristic:v4 type:v5];
        if (!v2 || !*(unsigned char *)(v2 + 8)) {
          sub_2C1D4((uint64_t)a1, 0, 0);
        }
      }
    }
    else
    {
      long long v16 = +[NSError hk_error:306 description:@"Write characteristic not supported"];
      sub_2C1D4((uint64_t)a1, 0, v16);
    }
  }
}

void sub_2C540(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = *(NSObject **)(a1 + 88);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_2C5BC;
    block[3] = &unk_60820;
    void block[4] = a1;
    dispatch_async(v1, block);
  }
}

void sub_2C5BC(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 34) = 1;
  sub_2C2A0(*(id **)(a1 + 32));
}

void sub_2C668(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 32);
  if (((unint64_t)[*(id *)(a1 + 32) properties] & 0xC) != 0)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = *(void **)(*(void *)(a1 + 40) + 80);
    id v6 = [v3 UUID];
    [v4 setObject:v3 forKeyedSubscript:v6];
  }
  else
  {
    _HKInitializeLogging();
    BOOL v5 = HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR)) {
      sub_41614(v2, v5);
    }
  }
}

void sub_2C850(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  id v3 = (char *)[WeakRetained state];

  if (v3 == (unsigned char *)&dword_0 + 2)
  {
    self = objc_alloc_init(_HDHealthServiceWriteOperation);
    sub_2B868((uint64_t)self, *(void **)(a1 + 40));
    id v4 = self;
    if (self)
    {
      self->_expectResponse = *(unsigned char *)(a1 + 56);
      objc_setProperty_nonatomic_copy(self, (SEL)self, *(id *)(a1 + 48), 24);
      id v4 = self;
    }
    [*(id *)(*(void *)(a1 + 32) + 96) addObject:v4];
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v5 + 34) && [*(id *)(v5 + 96) count] == (char *)&dword_0 + 1) {
      sub_2C2A0(*(id **)(a1 + 32));
    }
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 32);
    self = (_HDHealthServiceWriteOperation *)objc_loadWeakRetained((id *)(v7 + 48));
    id v8 = [(_HDHealthServiceWriteOperation *)self stateDescription];
    id v9 = +[NSError hk_error:300, @"Device not connected: %@", v8 format];
    (*(void (**)(uint64_t, uint64_t, void, void *))(v6 + 16))(v6, v7, 0, v9);
  }
}

void sub_2CC30(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 96) count])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) value];
    sub_2C1D4(v2, v4, *(void **)(a1 + 48));
  }
  else
  {
    _HKInitializeLogging();
    id v3 = HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEBUG)) {
      sub_414AC(v3);
    }
  }
}

unsigned __int8 *sub_2CDF0(uint64_t a1)
{
  return sub_2CDF8(*(unsigned __int8 **)(a1 + 32));
}

unsigned __int8 *sub_2CDF8(unsigned __int8 *result)
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    unsigned __int8 v2 = atomic_load(result + 32);
    if (v2)
    {
      _HKInitializeLogging();
      id v3 = (void *)HKLogServices;
      if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
      {
        id v4 = v3;
        uint64_t v5 = NSStringFromSelector("_dataQueue_deliverDataIfPossible");
        *(_DWORD *)buf = 138412546;
        uint64_t v17 = v1;
        __int16 v18 = 2112;
        id v19 = v5;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
      }
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v6 = *(id *)(v1 + 16);
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          unsigned __int8 v10 = 0;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            sub_2BF50(v1, *(void **)(*((void *)&v11 + 1) + 8 * (void)v10));
            unsigned __int8 v10 = (char *)v10 + 1;
          }
          while (v8 != v10);
          id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }

      return (unsigned __int8 *)objc_msgSend(*(id *)(v1 + 16), "removeAllObjects", (void)v11);
    }
  }
  return result;
}

unsigned __int8 *sub_2D004(uint64_t a1)
{
  return sub_2CDF8(*(unsigned __int8 **)(a1 + 32));
}

void sub_2D01C(uint64_t a1)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 32));
  if (v1) {
    sub_2BF50(*(void *)(a1 + 32), *(void **)(a1 + 40));
  }
  else {
    [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
  }
}

id *sub_2D194(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v10 = a2;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)HDFitnessMachineStateTimer;
    long long v13 = (id *)objc_msgSendSuper2(&v17, "init");
    a1 = v13;
    if (v13)
    {
      objc_storeStrong(v13 + 1, a2);
      a1[2] = a3;
      objc_storeStrong(a1 + 5, a4);
      id v14 = objc_retainBlock(v12);
      id v15 = a1[4];
      a1[4] = v14;
    }
  }

  return a1;
}

void sub_2D2AC(uint64_t a1)
{
  if (a1)
  {
    unsigned __int8 v2 = *(NSObject **)(a1 + 24);
    if (v2)
    {
      dispatch_source_cancel(v2);
      id v3 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = 0;

      _HKInitializeLogging();
      id v4 = (void *)HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 8);
        int v7 = 138412290;
        uint64_t v8 = v5;
        id v6 = v4;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "HDFitnessMachineStateTimer: Canceling %@ timer", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

NSObject *sub_2D380(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  int v7 = a3;
  self;
  uint64_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v7);

  dispatch_time_t v9 = dispatch_time(0, 1000000000 * a2);
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
  dispatch_source_set_event_handler(v8, v6);

  dispatch_resume(v8);

  return v8;
}

void sub_2D440(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 24);
    _HKInitializeLogging();
    id v3 = (void *)HKLogWorkouts;
    BOOL v4 = os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT);
    if (v2)
    {
      if (v4)
      {
        uint64_t v5 = *(void *)(a1 + 8);
        *(_DWORD *)buf = 138412290;
        uint64_t v17 = v5;
        id v6 = v3;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "HDFitnessMachineStateTimer: %@ timer already running", buf, 0xCu);
      }
    }
    else
    {
      if (v4)
      {
        uint64_t v7 = *(void *)(a1 + 8);
        uint64_t v8 = *(void *)(a1 + 16);
        *(_DWORD *)buf = 138412546;
        uint64_t v17 = v7;
        __int16 v18 = 2048;
        uint64_t v19 = v8;
        dispatch_time_t v9 = v3;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "HDFitnessMachineStateTimer: Starting %@ timer with %llu seconds", buf, 0x16u);
      }
      objc_initWeak((id *)buf, (id)a1);
      uint64_t v10 = *(void *)(a1 + 16);
      id v11 = *(id *)(a1 + 40);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_2D640;
      v14[3] = &unk_61630;
      objc_copyWeak(&v15, (id *)buf);
      uint64_t v12 = sub_2D380((uint64_t)HDFitnessMachineStateTimer, v10, v11, v14);
      long long v13 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v12;

      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);
    }
  }
}

void sub_2D61C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2D640(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _HKInitializeLogging();
  uint64_t v2 = (void *)HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    if (WeakRetained) {
      uint64_t v3 = *((void *)WeakRetained + 1);
    }
    else {
      uint64_t v3 = 0;
    }
    int v8 = 138412290;
    uint64_t v9 = v3;
    BOOL v4 = v2;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "HDFitnessMachineStateTimer: %@ timer expired", (uint8_t *)&v8, 0xCu);
  }
  if (WeakRetained)
  {
    id v5 = *((id *)WeakRetained + 4);
    id v6 = v5;
    if (v5) {
      (*((void (**)(id))v5 + 2))(v5);
    }
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v7 = (void *)*((void *)WeakRetained + 3);
  *((void *)WeakRetained + 3) = 0;
}

void sub_2DA18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2DA3C(uint64_t a1)
{
  unsigned __int8 v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained delegate];

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v3 = objc_loadWeakRetained(v1);
    [v4 stateTimersFieldDetectTimeout:v3];
  }
}

void sub_2DACC(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

void sub_2DC90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2DCB4(uint64_t a1)
{
  unsigned __int8 v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained delegate];

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v3 = objc_loadWeakRetained(v1);
    [v4 stateTimersTagReadTimeout:v3];
  }
}

void sub_2DD44(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

void sub_2DF08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2DF2C(uint64_t a1)
{
  unsigned __int8 v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained delegate];

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v3 = objc_loadWeakRetained(v1);
    [v4 stateTimersMachineIdentityVerificationTimeout:v3];
  }
}

void sub_2DFBC(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

void sub_2E180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2E1A4(uint64_t a1)
{
  unsigned __int8 v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained delegate];

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v3 = objc_loadWeakRetained(v1);
    [v4 stateTimersUserAcceptanceTimeout:v3];
  }
}

void sub_2E234(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

void sub_2E3F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2E41C(uint64_t a1)
{
  unsigned __int8 v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained delegate];

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v3 = objc_loadWeakRetained(v1);
    [v4 stateTimersWaitForMachineStartTimeout:v3];
  }
}

void sub_2E4AC(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

void sub_2E670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2E694(uint64_t a1)
{
  unsigned __int8 v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained delegate];

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v3 = objc_loadWeakRetained(v1);
    [v4 stateTimersPauseTimeout:v3];
  }
}

void sub_2E724(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

void sub_2E8E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2E90C(uint64_t a1)
{
  unsigned __int8 v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained delegate];

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v3 = objc_loadWeakRetained(v1);
    [v4 stateTimersDisconnectTimeout:v3];
  }
}

void sub_2E99C(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

void sub_2EB60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2EB84(uint64_t a1)
{
  unsigned __int8 v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained delegate];

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v3 = objc_loadWeakRetained(v1);
    [v4 stateTimersRetryConnectionTimeout:v3];
  }
}

void sub_2EC14(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 80), a2);
  }
}

void sub_2EE4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2EE70(uint64_t a1)
{
  unsigned __int8 v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained delegate];

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v3 = objc_loadWeakRetained(v1);
    [v4 stateTimersMfaTimeout:v3];
  }
}

void sub_2EF00(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

void sub_2F62C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2F64C(uint64_t a1)
{
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  sub_2F68C(WeakRetained);
}

dispatch_queue_t *sub_2F68C(dispatch_queue_t *result)
{
  if (result)
  {
    unsigned __int8 v1 = result;
    dispatch_assert_queue_V2(result[3]);
    _HKInitializeLogging();
    uint64_t v2 = (void *)HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = v2;
      id v4 = NSStringFromSelector("_queue_handleMFASuccessNotification");
      *(_DWORD *)buf = 138543618;
      int v8 = v1;
      __int16 v9 = 2114;
      uint64_t v10 = v4;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
    }
    dispatch_queue_t v5 = v1[11];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_35CA0;
    v6[3] = &unk_60820;
    void v6[4] = v1;
    return (dispatch_queue_t *)[v5 hk_withLock:v6];
  }
  return result;
}

void sub_2F9C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2F9EC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2F9FC(uint64_t a1)
{
}

void sub_2FA04(void *a1)
{
  unsigned __int8 v1 = a1;
  uint64_t v2 = &CFNotificationCenterAddObserver_ptr;
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 40));
  uint64_t v4 = *(void *)(v1[5] + 8);
  id obj = *(id *)(v4 + 40);
  dispatch_queue_t v5 = +[HDServiceEntity allServicesWithProfile:WeakRetained error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);

  if (v5)
  {
    +[NSDate timeIntervalSinceReferenceDate];
    double v7 = v6;
    id v8 = objc_loadWeakRetained((id *)(v1[4] + 40));
    uint64_t v9 = [v8 database];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v38 = v5;
    id v10 = v5;
    id v11 = [v10 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v41;
      id v14 = (os_log_t *)&HKLogServices;
      do
      {
        id v15 = 0;
        id v39 = v12;
        do
        {
          if (*(void *)v41 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v16 = *(void **)(*((void *)&v40 + 1) + 8 * (void)v15);
          [v16 lastConnection];
          if (v17 + 7776000.0 >= v7)
          {
            [*(id *)(*(void *)(v1[6] + 8) + 40) addObject:v16];
          }
          else
          {
            _HKInitializeLogging();
            os_log_t v18 = *v14;
            if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v19 = v18;
              [v16 identifier];
              uint64_t v20 = v13;
              id v21 = v10;
              __int16 v22 = v9;
              uint64_t v23 = v14;
              __int16 v24 = v1;
              __int16 v26 = v25 = v2;
              *(_DWORD *)buf = 138412290;
              long long v47 = v26;
              _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Removing inactive saved health service session %@", buf, 0xCu);

              uint64_t v2 = v25;
              unsigned __int8 v1 = v24;
              id v14 = v23;
              uint64_t v9 = v22;
              id v10 = v21;
              uint64_t v13 = v20;
              id v12 = v39;
            }
            [v2[168] deleteService:v16 healthDatabase:v9 error:0];
          }
          id v15 = (char *)v15 + 1;
        }
        while (v12 != v15);
        id v12 = [v10 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v12);
    }

    uint64_t v27 = v1[4];
    if (v27) {
      id v28 = objc_loadWeakRetained((id *)(v27 + 40));
    }
    else {
      id v28 = 0;
    }
    id v29 = [v28 daemon];
    __int16 v30 = [v29 analyticsSubmissionCoordinator];
    unint64_t v31 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(*(void *)(v1[6] + 8) + 40) count]);
    uint64_t v32 = v1[4];
    if (v32) {
      id v33 = objc_loadWeakRetained((id *)(v32 + 40));
    }
    else {
      id v33 = 0;
    }
    dispatch_queue_t v5 = v38;
    objc_msgSend(v30, "healthService_reportCountForAllServices:profileType:", v31, objc_msgSend(v33, "profileType"));
  }
  else
  {
    uint64_t v34 = *(void *)(v1[6] + 8);
    uint64_t v35 = *(void **)(v34 + 40);
    *(void *)(v34 + 40) = 0;

    if ((objc_msgSend(*(id *)(*(void *)(v1[5] + 8) + 40), "hk_isDatabaseAccessibilityError") & 1) == 0)
    {
      _HKInitializeLogging();
      __int16 v36 = HKLogServices;
      if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
      {
        id v37 = *(void **)(*(void *)(v1[5] + 8) + 40);
        *(_DWORD *)buf = 138543362;
        long long v47 = v37;
        _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "Error retrieving previous service sessions, %{public}@", buf, 0xCu);
      }
    }
  }
}

void sub_300D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_30104(void *a1)
{
  uint64_t v2 = a1[4];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 40));
  uint64_t v4 = [WeakRetained database];
  uint64_t v5 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v5 + 40);
  unsigned __int8 v6 = +[HDServiceEntity healthUpdatesEnabledForDevice:v2 inDatabase:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v6;

  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    double v7 = *(void **)(*(void *)(a1[7] + 8) + 40);
    if (v7)
    {
      if ((objc_msgSend(v7, "hk_isDatabaseAccessibilityError") & 1) == 0
        && (objc_msgSend(*(id *)(*(void *)(a1[7] + 8) + 40), "hk_isServiceDeviceNotFoundError") & 1) == 0)
      {
        _HKInitializeLogging();
        id v8 = HKLogServices;
        if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = a1[4];
          uint64_t v10 = *(void *)(*(void *)(a1[7] + 8) + 40);
          *(_DWORD *)buf = 138412546;
          uint64_t v13 = v9;
          __int16 v14 = 2114;
          uint64_t v15 = v10;
          _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Error retrieving update enabled status for device %@, %{public}@", buf, 0x16u);
        }
      }
    }
  }
}

void sub_305C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_305F8(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
  uint64_t v5 = [WeakRetained database];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v6 + 40);
  unsigned __int8 v7 = +[HDServiceEntity setHealthUpdatesEnabled:v2 forDevice:v3 inDatabase:v5 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7;

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v8 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (v8)
    {
      if ((objc_msgSend(v8, "hk_isDatabaseAccessibilityError") & 1) == 0)
      {
        _HKInitializeLogging();
        uint64_t v9 = HKLogServices;
        if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = *(void *)(a1 + 32);
          uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          *(_DWORD *)buf = 138412546;
          uint64_t v14 = v10;
          __int16 v15 = 2114;
          uint64_t v16 = v11;
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Error setting update enabled status for device %@, %{public}@", buf, 0x16u);
        }
      }
    }
  }
}

void sub_30774(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    _HKInitializeLogging();
    unsigned __int8 v7 = (void *)HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      uint64_t v9 = NSStringFromSelector("_disconnectPeripheralWithDeviceIdentifier:error:");
      *(_DWORD *)buf = 138544130;
      __int16 v24 = a1;
      __int16 v25 = 2114;
      __int16 v26 = v9;
      __int16 v27 = 2114;
      id v28 = v5;
      __int16 v29 = 2114;
      id v30 = v6;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: deviceIdentifier: %{public}@, error: %{public}@", buf, 0x2Au);
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v10 = sub_35040(a1, v5);
    id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v14);
          if (v15) {
            uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t))(v15 + 16);
          }
          else {
            uint64_t v16 = 0;
          }
          sub_3437C((uint64_t)a1, v16, v6);
          uint64_t v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v17 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        id v12 = v17;
      }
      while (v17);
    }
  }
}

void sub_30B58(void *a1)
{
  uint64_t v2 = (void *)a1[6];
  if (v2
    && (*(void *)(a1[4] + 120)
     || (+[NSMutableDictionary dictionary],
         uint64_t v3 = objc_claimAutoreleasedReturnValue(),
         uint64_t v4 = a1[4],
         id v5 = *(void **)(v4 + 120),
         *(void *)(v4 + 120) = v3,
         v5,
         (uint64_t v2 = (void *)a1[6]) != 0)))
  {
    id v6 = *(void **)(a1[4] + 120);
    id v7 = objc_retainBlock(v2);
    [v6 setObject:v7 forKey:a1[5]];

    if (a1[7])
    {
      id v8 = *(void **)(a1[4] + 16);
      id v12 = 0;
      sub_30C64((uint64_t)HDHealthServiceManager, v8, (uint64_t)&v12);
      id v9 = v12;
      (*(void (**)(void))(a1[7] + 16))();
    }
  }
  else
  {
    uint64_t v10 = a1[5];
    id v11 = *(void **)(a1[4] + 120);
    [v11 removeObjectForKey:v10];
  }
}

uint64_t sub_30C64(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  self;
  id v5 = [v4 state];

  uint64_t v6 = 0;
  uint64_t result = 2;
  uint64_t v8 = 200;
  id v9 = @"This device does not support Bluetooth Low Energy.";
  switch((unint64_t)v5)
  {
    case 1uLL:
      id v9 = +[NSString stringWithFormat:@"CBCentralManagerState is %ld", 200, 1];
      uint64_t v8 = 201;
      uint64_t v6 = 3;
      goto LABEL_5;
    case 2uLL:
      goto LABEL_5;
    case 4uLL:
      id v9 = @"Bluetooth is currently powered off.";
      uint64_t v8 = 201;
      uint64_t v6 = 1;
      goto LABEL_5;
    case 5uLL:
      return result;
    default:
      id v9 = +[NSString stringWithFormat:@"CBCentralManagerState is %ld", 200, v5];
      uint64_t v6 = 0;
      uint64_t v8 = 202;
LABEL_5:
      +[NSError hk_assignError:a3 code:v8 description:v9];

      return v6;
  }
}

void sub_30D94(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    _HKInitializeLogging();
    uint64_t v6 = (void *)HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      uint64_t v8 = NSStringFromSelector("_queue_notifyBluetoothStatusUpdates:error:");
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = a1;
      __int16 v21 = 2114;
      __int16 v22 = v8;
      __int16 v23 = 2048;
      uint64_t v24 = a2;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: status: %ld", buf, 0x20u);
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = objc_msgSend(*(id *)(a1 + 120), "allValues", 0);
    id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * (void)v13) + 16))();
          uint64_t v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

void sub_31338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_3135C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 56))
  {
    uint64_t v3 = objc_alloc_init(HDIdentifierTable);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = v3;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (!*(void *)(v2 + 64))
  {
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 64);
    *(void *)(v7 + 64) = v6;
  }
  uint64_t v12 = sub_314C8((id *)[_HDHealthServiceDiscoveryInfo alloc], *(void **)(a1 + 48), *(void **)(a1 + 40), *(unsigned char *)(a1 + 80), *(void *)(a1 + 64) == 1);
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 56) addObject:v12];
  if (v12) {
    v12[3] = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
  id v9 = sub_31594(*(void *)(a1 + 32), *(void *)(a1 + 72), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
  sub_2E234((uint64_t)v12, v9);

  id v10 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v10)
  {
    id v11 = v10;
    [v10 addObject:v12];
  }
  else
  {
    id v11 = +[NSMutableArray arrayWithObject:v12];
    [*(id *)(*(void *)(a1 + 32) + 64) setObject:v11 forKeyedSubscript:*(void *)(a1 + 40)];
  }
}

id *sub_314C8(id *a1, void *a2, void *a3, char a4, char a5)
{
  id v9 = a2;
  id v10 = a3;
  if (a1)
  {
    v16.receiver = a1;
    v16.super_class = (Class)_HDHealthServiceDiscoveryInfo;
    a1 = (id *)objc_msgSendSuper2(&v16, "init");
    if (a1)
    {
      id v11 = [v9 copy];
      id v12 = a1[4];
      a1[4] = v11;

      objc_storeStrong(a1 + 5, a3);
      *((unsigned char *)a1 + 16) = a4;
      *((unsigned char *)a1 + 17) = a5;
      uint64_t v13 = +[NSMutableSet set];
      id v14 = a1[1];
      a1[1] = (id)v13;
    }
  }

  return a1;
}

NSObject *sub_31594(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    uint64_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v6);

    dispatch_time_t v8 = dispatch_time(0, 1000000000 * a2);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0xB2D05E00uLL);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    void v10[2] = sub_3246C;
    void v10[3] = &unk_61778;
    void v10[4] = a1;
    v10[5] = "_createDiscoveryTimeout:forIdentifier:";
    v10[6] = a2;
    v10[7] = a3;
    dispatch_source_set_event_handler(v7, v10);
    dispatch_resume(v7);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void sub_316BC(uint64_t a1)
{
  sub_316FC(*(void *)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);

  sub_319B4(v2);
}

void sub_316FC(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    _HKInitializeLogging();
    uint64_t v4 = (void *)HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v4;
      id v6 = NSStringFromSelector("_queue_reportExistingDiscoveriesForService:");
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2114;
      __int16 v22 = v3;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: serviceUUID: %{public}@", buf, 0x20u);
    }
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    __int16 v22 = sub_2F9EC;
    __int16 v23 = sub_2F9FC;
    id v24 = 0;
    uint64_t v7 = *(void **)(a1 + 88);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    void v19[2] = sub_3A354;
    v19[3] = &unk_60A20;
    v19[4] = a1;
    v19[5] = buf;
    objc_msgSend(v7, "hk_withLock:", v19);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = *(id *)(*(void *)&buf[8] + 40);
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v12, "hasServiceWithUUID:", v3, (void)v15))
          {
            uint64_t v13 = [v12 cbPeripheral];
            id v14 = sub_39B3C((void *)a1, v13, v3, 0, 0);
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v9);
    }

    _Block_object_dispose(buf, 8);
  }
}

void sub_31988(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_319B4(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    _HKInitializeLogging();
    uint64_t v2 = (void *)HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = v2;
      uint64_t v4 = NSStringFromSelector("_queue_updateScan");
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v4;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
    }
    id v5 = *(void **)(a1 + 16);
    id v36 = 0;
    uint64_t v6 = sub_30C64((uint64_t)HDHealthServiceManager, v5, (uint64_t)&v36);
    id v7 = v36;
    if (v6 == 2)
    {
      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      long long v45 = sub_2F9EC;
      long long v46 = sub_2F9FC;
      id v47 = 0;
      id v8 = *(void **)(a1 + 48);
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_374FC;
      v35[3] = &unk_60A20;
      v35[4] = a1;
      v35[5] = buf;
      objc_msgSend(v8, "hk_withLock:", v35);
      id v9 = [*(id *)(*(void *)&buf[8] + 40) allKeys];
      uint64_t v10 = +[NSSet setWithArray:v9];
      unsigned int v11 = [v10 containsObject:*(void *)(a1 + 80)];
      if (v11)
      {
        uint64_t v12 = +[NSSet setWithObject:*(void *)(a1 + 80)];

        uint64_t v10 = (void *)v12;
      }
      uint64_t v13 = *(void **)(a1 + 72);
      if (v10 != v13 && (!v13 || (objc_msgSend(v10, "isEqualToSet:") & 1) == 0))
      {
        if ([v9 count])
        {
          HKSessionTrackerAriadneTrigger();
          id v14 = [*(id *)(*(void *)&buf[8] + 40) allValues];
          __int16 v29 = sub_372DC(a1, v14);

          if (v11)
          {
            sub_37558(a1);
            id v15 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v15 = v9;
          }
          __int16 v25 = v15;
          _HKInitializeLogging();
          __int16 v26 = HKLogServices;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            sub_37644((id)a1);
            id v27 = (id)objc_claimAutoreleasedReturnValue();
            id v28 = [v25 componentsJoinedByString:@", "];
            *(_DWORD *)v38 = 138543874;
            id v39 = v27;
            __int16 v40 = 2114;
            long long v41 = v28;
            __int16 v42 = 2112;
            long long v43 = v29;
            _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ scanning for peripherals with services: %{public}@ options: %@", v38, 0x20u);
          }
          [*(id *)(a1 + 16) scanForPeripheralsWithServices:v25 options:v29];
          objc_storeStrong((id *)(a1 + 72), v10);
        }
        else
        {
          sub_376C8(a1);
        }
      }

      _Block_object_dispose(buf, 8);
    }
    else
    {
      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      long long v45 = sub_2F9EC;
      long long v46 = sub_2F9FC;
      id v47 = 0;
      long long v16 = *(void **)(a1 + 48);
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_37844;
      v34[3] = &unk_60A20;
      v34[4] = a1;
      v34[5] = buf;
      objc_msgSend(v16, "hk_withLock:", v34);
      sub_376C8(a1);
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v17 = *(id *)(*(void *)&buf[8] + 40);
      id v18 = [v17 countByEnumeratingWithState:&v30 objects:v37 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v31;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v31 != v19) {
              objc_enumerationMutation(v17);
            }
            uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8 * (void)v20);
            if (v21)
            {
              __int16 v22 = (void (**)(id, uint64_t, void, uint64_t, id))*(id *)(v21 + 32);
              uint64_t v23 = *(void *)(v21 + 24);
            }
            else
            {
              __int16 v22 = 0;
              uint64_t v23 = 0;
            }
            v22[2](v22, v23, 0, 1, v7);

            uint64_t v20 = (char *)v20 + 1;
          }
          while (v18 != v20);
          id v24 = [v17 countByEnumeratingWithState:&v30 objects:v37 count:16];
          id v18 = v24;
        }
        while (v24);
      }

      _Block_object_dispose(buf, 8);
    }
  }
}

void sub_31ECC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_321AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
}

id sub_321D8(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_32204(uint64_t a1)
{
}

void sub_3220C(void *a1)
{
  _HKInitializeLogging();
  uint64_t v2 = HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = (void *)a1[7];
    int v15 = 134217984;
    id v16 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Stopping discovery %lu", (uint8_t *)&v15, 0xCu);
  }
  uint64_t v4 = [*(id *)(a1[4] + 56) objectWithIdentifier:a1[7]];
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(v4 + 32));
    dispatch_source_cancel(*(dispatch_source_t *)(v5 + 48));
    uint64_t v6 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = 0;

    _HKInitializeLogging();
    id v7 = (void *)HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = a1[7];
      id v9 = v7;
      uint64_t v10 = +[NSNumber numberWithUnsignedInteger:v8];
      int v15 = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Removing object with identifier: %@", (uint8_t *)&v15, 0xCu);
    }
    [*(id *)(a1[4] + 56) removeObjectWithIdentifier:a1[7]];
    id v11 = *(id *)(v5 + 40);
    uint64_t v12 = [*(id *)(a1[4] + 64) objectForKeyedSubscript:v11];
    if (v12)
    {
      _HKInitializeLogging();
      uint64_t v13 = HKLogServices;
      if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        id v16 = v11;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Removing info for service uuid: %@", (uint8_t *)&v15, 0xCu);
      }
      [v12 removeObject:v5];
      if (![v12 count])
      {
        [*(id *)(a1[4] + 64) removeObjectForKey:v11];
        *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
      }
    }
  }
  else
  {
    uint64_t v14 = *(void *)(a1[5] + 8);
    id v11 = *(id *)(v14 + 40);
    *(void *)(v14 + 40) = 0;
  }
}

void sub_32464(uint64_t a1)
{
}

void sub_3246C(uint64_t a1)
{
  _HKInitializeLogging();
  uint64_t v3 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v4 = *(const char **)(a1 + 40);
    uint64_t v6 = v3;
    id v7 = NSStringFromSelector(v4);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    int v10 = 138544130;
    uint64_t v11 = v5;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = v8;
    __int16 v16 = 2048;
    uint64_t v17 = v9;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: timeout: %lu, identifier: %lu", (uint8_t *)&v10, 0x2Au);
  }
  [*(id *)(a1 + 32) stopDiscoveryWithIdentifier:*(void *)(a1 + 56)];
}

id sub_32588(id a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    id v13 = HDHealthServiceClassForCBUUID(v9);
    if (v13 && (__int16 v14 = v13, (unint64_t)[v13 serviceType] <= 3))
    {
      uint64_t v15 = [v12 objectForKeyedSubscript:CBAdvertisementDataLocalNameKey];
      __int16 v16 = v15;
      if (v15)
      {
        id v17 = v15;
      }
      else
      {
        id v17 = [v10 name];
      }
      __int16 v22 = v17;

      id v25 = objc_alloc((Class)HKHealthService);
      id v26 = [v14 serviceType];
      id v27 = [v10 identifier];
      a1 = [v25 initWithType:v26 identifier:v27 name:v22];

      id v28 = [v9 UUIDString];
      [a1 setServiceId:v28];

      [a1 setAdvertisementData:v11];
      [a1 setPeripheral:v10];
    }
    else
    {
      _HKInitializeLogging();
      id v18 = (void *)HKLogServices;
      if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = v18;
        uint64_t v20 = [v9 UUIDString];
        int v30 = 138412290;
        long long v31 = v20;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Service with UUID %@ not supported", (uint8_t *)&v30, 0xCu);
      }
      id v21 = objc_alloc((Class)HKHealthService);
      __int16 v22 = [v10 identifier];
      uint64_t v23 = [v10 name];
      id v24 = [v9 UUIDString];
      a1 = [v21 initUnknownServiceWithIdentifier:v22 name:v23 serviceId:v24];
    }
  }

  return a1;
}

void *sub_32AFC(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x3032000000;
    id v13 = sub_2F9EC;
    __int16 v14 = sub_2F9FC;
    id v15 = 0;
    uint64_t v5 = (void *)a1[6];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_362A0;
    v7[3] = &unk_607D0;
    id v9 = &v10;
    void v7[4] = a1;
    id v8 = v3;
    objc_msgSend(v5, "hk_withLock:", v7);
    a1 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
  }

  return a1;
}

void sub_32C0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_32EC0(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 104) objectForKeyedSubscript:a1[5]];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v6);
        if (v7)
        {
          id v8 = *(id *)(v7 + 40);
          if (v8)
          {
            id v9 = v8;
            id v10 = objc_retainBlock(v8);
            id v11 = (void *)a1[6];
            uint64_t v12 = +[NSNumber numberWithUnsignedInteger:*(void *)(v7 + 16)];
            [v11 setObject:v10 forKeyedSubscript:v12];
          }
        }
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

id *sub_331C0(id *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, double a9)
{
  id v17 = a2;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a8;
  if (a1)
  {
    v32.receiver = a1;
    v32.super_class = (Class)_HDHealthServiceConnectionInfo;
    a1 = (id *)objc_msgSendSuper2(&v32, "init");
    if (a1)
    {
      id v23 = [v17 copy];
      id v24 = a1[3];
      a1[3] = v23;

      id v25 = [v18 copy];
      id v26 = a1[4];
      a1[4] = v25;

      id v27 = [v19 copy];
      id v28 = a1[5];
      a1[5] = v27;

      id v29 = [v20 copy];
      id v30 = a1[6];
      a1[6] = v29;

      a1[7] = a7;
      if ((a7 & 2) != 0) {
        a1[8] = &dword_0 + 1;
      }
      if (a7) {
        objc_storeStrong(a1 + 9, a6);
      }
      objc_storeStrong(a1 + 10, a8);
      a1[11] = 0;
      *((double *)a1 + 13) = a9;
    }
  }

  return a1;
}

uint64_t sub_33324(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (!a1) {
    goto LABEL_43;
  }
  _HKInitializeLogging();
  id v9 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    id v11 = NSStringFromSelector("_connectHealthService:connectionInfo:error:");
    *(_DWORD *)buf = 138544130;
    uint64_t v63 = a1;
    __int16 v64 = 2114;
    id v65 = v11;
    __int16 v66 = 2114;
    id v67 = v7;
    __int16 v68 = 2114;
    long long v69 = v8;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: hkService: %{public}@, connectionInfo: %{public}@", buf, 0x2Au);
  }
  if (!v7)
  {
    _HKInitializeLogging();
    id v28 = HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR)) {
      sub_41988(v28, v29, v30, v31, v32, v33, v34, v35);
    }
    goto LABEL_42;
  }
  if (!v8 || !v8[3])
  {
    _HKInitializeLogging();
    long long v50 = HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR)) {
      sub_419C0(v50, v51, v52, v53, v54, v55, v56, v57);
    }
LABEL_42:
    +[NSError hk_assignError:a4, 303, @"An internal service session error has occurred.", v59 code format];
    goto LABEL_43;
  }
  if ([*(id *)(a1 + 16) state] != (char *)&dword_4 + 1)
  {
    +[NSError hk_assignError:code:format:](NSError, "hk_assignError:code:format:", a4, 201, @"Bluetooth state: %ld", [*(id *)(a1 + 16) state]);
LABEL_43:
    uint64_t v39 = 0;
    goto LABEL_44;
  }
  uint64_t v12 = [v7 peripheral];
  if (!v12)
  {
    _HKInitializeLogging();
    long long v13 = (void *)HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
    {
      long long v14 = v13;
      id v15 = [v7 type];
      long long v16 = [v7 identifier];
      *(_DWORD *)buf = 138543874;
      uint64_t v63 = a1;
      __int16 v64 = 2048;
      id v65 = v15;
      __int16 v66 = 2114;
      id v67 = v16;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: No peripheral was found on service of type %ld. retrievePeripheralsWithIdentifier: %{public}@", buf, 0x20u);
    }
    id v17 = *(void **)(a1 + 16);
    id v18 = [v7 identifier];
    id v72 = v18;
    id v19 = +[NSArray arrayWithObjects:&v72 count:1];
    id v20 = [v17 retrievePeripheralsWithIdentifiers:v19];

    if ((unint64_t)[v20 count] >= 2)
    {
      _HKInitializeLogging();
      id v21 = (void *)HKLogServices;
      if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR)) {
        sub_41BE4(v21);
      }
    }
    uint64_t v12 = [v20 firstObject];

    if (!v12)
    {
      _HKInitializeLogging();
      long long v49 = (void *)HKLogServices;
      if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR)) {
        sub_419F8(v49, v7);
      }
      uint64_t v12 = [v7 name];
      +[NSError hk_assignError:a4, 313, @"The health device %@ was not found for the requested health type.", v12 code format];
      goto LABEL_38;
    }
  }
  _HKInitializeLogging();
  id v22 = HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v63 = a1;
    __int16 v64 = 2114;
    id v65 = v12;
    __int16 v66 = 2114;
    id v67 = v7;
    _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: Attempt connection to peripheral (%{public}@) if service (%{public}@) enabled", buf, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v24 = [WeakRetained database];

  id v25 = [v7 identifier];
  long long v60 = (void *)v24;
  id v61 = 0;
  LOBYTE(v24) = +[HDServiceEntity healthUpdatesEnabledForDevice:v25 inDatabase:v24 error:&v61];
  id v26 = v61;
  id v27 = v26;
  if (v24)
  {

LABEL_23:
    if ((v8[7] & 4) != 0) {
      id v37 = +[HDServiceEntity insertOrUpdateService:v7 healthDatabase:v60 error:0];
    }
    uint64_t v38 = sub_339D8(a1, v12, v7, v8);
    if (v38)
    {
      uint64_t v39 = v38;
      __int16 v40 = [v7 name];
      long long v41 = +[NSString stringWithFormat:@"Connected to peripheral %@", v40];
      HDSetHealthInUseDefaultWithReason();

      _HKInitializeLogging();
      __int16 v42 = (void *)HKLogServices;
      if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
      {
        long long v43 = v42;
        long long v44 = NSStringFromSelector("_connectHealthService:connectionInfo:error:");
        *(_DWORD *)buf = 138544386;
        uint64_t v63 = a1;
        __int16 v64 = 2114;
        id v65 = v44;
        __int16 v66 = 2114;
        id v67 = v7;
        __int16 v68 = 2114;
        long long v69 = v8;
        __int16 v70 = 2048;
        uint64_t v71 = v39;
        _os_log_impl(&dword_0, v43, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: hkService: %{public}@, connectionInfo: %{public}@ -> sessionIdentifier: %lu", buf, 0x34u);
      }
      goto LABEL_39;
    }
    _HKInitializeLogging();
    long long v45 = (void *)HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR)) {
      sub_41A98(v45, v7);
    }
    long long v46 = [v7 name];
    +[NSError hk_assignError:a4, 305, @"The health device %@ was not found for the requested health type.", v46 code format];
    goto LABEL_34;
  }
  unsigned __int8 v36 = objc_msgSend(v26, "hk_isServiceDeviceNotFoundError");

  if (v36) {
    goto LABEL_23;
  }
  _HKInitializeLogging();
  id v47 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR)) {
    sub_41B48(v47);
  }
  long long v46 = [v7 name];
  long long v48 = +[NSString stringWithFormat:@"Health updates from the health device %@ have been disabled.", v46];
  +[NSError hk_assignError:a4 code:312 description:v48 underlyingError:v27];

LABEL_34:
LABEL_38:
  uint64_t v39 = 0;
LABEL_39:

LABEL_44:
  return v39;
}

uint64_t sub_339D8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!a1)
  {
LABEL_14:
    uint64_t v25 = 0;
    goto LABEL_46;
  }
  _HKInitializeLogging();
  id v10 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    uint64_t v12 = NSStringFromSelector("_addConnectedPeripheral:service:connectionInfo:");
    *(_DWORD *)buf = 138544386;
    *(void *)&uint8_t buf[4] = a1;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2114;
    uint64_t v71 = v7;
    *(_WORD *)id v72 = 2114;
    *(void *)&v72[2] = v8;
    *(_WORD *)&v72[10] = 2114;
    *(void *)&v72[12] = v9;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: peripheral: %{public}@, hkService: %{public}@, connectionInfo: %{public}@", buf, 0x34u);
  }
  id v13 = HDServiceClassForProfile((uint64_t)objc_msgSend(v8, "type", "_addConnectedPeripheral:service:connectionInfo:"));
  if (!v13)
  {
    _HKInitializeLogging();
    uint64_t v24 = (void *)HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR)) {
      sub_41C80(v24, v8);
    }
    goto LABEL_14;
  }
  long long v14 = [v8 serviceId];
  BOOL v15 = v14 == 0;

  if (v15)
  {
    long long v16 = [v13 serviceUUID];
    id v17 = [v16 UUIDString];
    [v8 setServiceId:v17];
  }
  uint64_t v60 = 0;
  id v61 = &v60;
  uint64_t v62 = 0x2020000000;
  uint64_t v63 = 0;
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  uint64_t v71 = sub_2F9EC;
  *(void *)id v72 = sub_2F9FC;
  *(void *)&v72[8] = 0;
  id v18 = *(void **)(a1 + 88);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_36370;
  v53[3] = &unk_617A0;
  v53[4] = a1;
  uint64_t v57 = &v60;
  id v19 = v9;
  id v54 = v19;
  id v20 = v7;
  uint64_t v55 = v20;
  long long v58 = buf;
  id v56 = v8;
  id v59 = v13;
  objc_msgSend(v18, "hk_withLock:", v53);
  if (v61[3])
  {
    switch((unint64_t)[v20 state])
    {
      case 0uLL:
        goto LABEL_23;
      case 1uLL:
        _HKInitializeLogging();
        id v21 = HKLogServices;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          id v22 = [v20 name];
          *(_DWORD *)__int16 v64 = 138412290;
          uint64_t v65 = (uint64_t)v22;
          _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "Connecting to %@", v64, 0xCu);
        }
        int v23 = 0;
        goto LABEL_26;
      case 2uLL:
        _HKInitializeLogging();
        id v26 = HKLogServices;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          id v27 = [v20 name];
          *(_DWORD *)__int16 v64 = 138412290;
          uint64_t v65 = (uint64_t)v27;
          _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "Discover peripheral services for %@", v64, 0xCu);
        }
        int v23 = 0;
        uint64_t v28 = 7;
        if (!v19) {
          goto LABEL_50;
        }
        uint64_t v29 = 3;
        goto LABEL_28;
      case 3uLL:
        _HKInitializeLogging();
        uint64_t v30 = HKLogServices;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v31 = [v20 name];
          *(_DWORD *)__int16 v64 = 138412290;
          uint64_t v65 = (uint64_t)v31;
          _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "Disconnecting from %@", v64, 0xCu);
        }
LABEL_23:
        _HKInitializeLogging();
        uint64_t v32 = HKLogServices;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v33 = [v20 name];
          *(_DWORD *)__int16 v64 = 138412290;
          uint64_t v65 = (uint64_t)v33;
          _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "Begin connect to %@", v64, 0xCu);
        }
        int v23 = 1;
LABEL_26:
        uint64_t v28 = 6;
        if (v19)
        {
          uint64_t v29 = 2;
LABEL_28:
          *((void *)v19 + 11) = v29;
          uint64_t v34 = (void *)*((void *)v19 + 3);
        }
        else
        {
LABEL_50:
          uint64_t v34 = 0;
        }
        id v35 = v34;
        (*((void (**)(id, uint64_t, uint64_t, void, void))v35 + 2))(v35, v61[3], v28, 0, 0);

        if (v23)
        {
          if (v19 && (*((unsigned char *)v19 + 56) & 2) != 0)
          {
            _HKInitializeLogging();
            unsigned __int8 v36 = HKLogServices;
            if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int16 v64 = 138412290;
              uint64_t v65 = (uint64_t)v20;
              _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "(#w0) Tagging peripheral for mfa: %@", v64, 0xCu);
            }
            [v20 tag:@"needsMFiAuthenticationCertClass2.0c"];
          }
          sub_36744(a1, v19);
          HKSessionTrackerAriadneTrigger();
          _HKInitializeLogging();
          id v37 = HKLogServices;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v38 = [*(id *)(*(void *)&buf[8] + 40) cbPeripheral];
            *(_DWORD *)__int16 v64 = 138543874;
            uint64_t v65 = a1;
            __int16 v66 = 2114;
            uint64_t v67 = (uint64_t)v20;
            __int16 v68 = 2114;
            *(void *)long long v69 = v38;
            _os_log_impl(&dword_0, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: connectPeripheral: %{public}@ (hdPeripheral.cbPeripheral: %{public}@)", v64, 0x20u);
          }
          [*(id *)(a1 + 16) connectPeripheral:v20 options:0];
        }
LABEL_40:
        _HKInitializeLogging();
        __int16 v40 = HKLogServices;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(aSelector);
          id v41 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v42 = [v20 name];
          long long v43 = (void *)v42;
          uint64_t v44 = v61[3];
          if (v19) {
            uint64_t v45 = *((void *)v19 + 10);
          }
          else {
            uint64_t v45 = 0;
          }
          *(_DWORD *)__int16 v64 = 138413058;
          uint64_t v65 = (uint64_t)v41;
          __int16 v66 = 2112;
          uint64_t v67 = v42;
          __int16 v68 = 1024;
          *(_DWORD *)long long v69 = v44;
          *(_WORD *)&v69[4] = 2112;
          *(void *)&v69[6] = v45;
          _os_log_impl(&dword_0, v40, OS_LOG_TYPE_DEFAULT, "%@: %@ (%d) %@", v64, 0x26u);
        }
        uint64_t v25 = v61[3];
        break;
      default:
        _HKInitializeLogging();
        uint64_t v39 = HKLogServices;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(aSelector);
          id v47 = (id)objc_claimAutoreleasedReturnValue();
          _HKStringForHealthServiceStatus();
          id v48 = (id)objc_claimAutoreleasedReturnValue();
          if (v19) {
            long long v49 = (void *)*((void *)v19 + 10);
          }
          else {
            long long v49 = 0;
          }
          id v50 = v49;
          unsigned int v51 = [v20 state];
          *(_DWORD *)__int16 v64 = 138413058;
          uint64_t v65 = (uint64_t)v47;
          __int16 v66 = 2114;
          uint64_t v67 = (uint64_t)v48;
          __int16 v68 = 2114;
          *(void *)long long v69 = v50;
          *(_WORD *)&v69[8] = 1024;
          *(_DWORD *)&v69[10] = v51;
          _os_log_error_impl(&dword_0, v39, OS_LOG_TYPE_ERROR, "*** %@, unknown state %{public}@ for %{public}@ state %d", v64, 0x26u);
        }
        goto LABEL_40;
    }
  }
  else
  {
    uint64_t v25 = 0;
  }

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v60, 8);
LABEL_46:

  return v25;
}

void sub_3421C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose((const void *)(v13 - 160), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_3437C(uint64_t a1, uint64_t (*a2)(uint64_t result, uint64_t a2), void *a3)
{
  id v48 = a3;
  if (a1)
  {
    _HKInitializeLogging();
    uint64_t v5 = (void *)HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = v5;
      id v7 = NSStringFromSelector("_removeConnectedPeripheral:withError:");
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2048;
      v89 = a2;
      LOWORD(v90) = 2114;
      *(void *)((char *)&v90 + 2) = v48;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0) %{public}@: sessionIdentifier: %lu, error: %{public}@", buf, 0x2Au);
    }
    uint64_t v77 = 0;
    long long v78 = &v77;
    uint64_t v79 = 0x2020000000;
    uint64_t v80 = 0;
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v89 = sub_2F9EC;
    *(void *)&long long v90 = sub_2F9FC;
    *((void *)&v90 + 1) = 0;
    uint64_t v73 = 0;
    long long v74 = &v73;
    uint64_t v75 = 0x2020000000;
    char v76 = 0;
    uint64_t v69 = 0;
    __int16 v70 = &v69;
    uint64_t v71 = 0x2020000000;
    char v72 = 0;
    uint64_t v63 = 0;
    __int16 v64 = &v63;
    uint64_t v65 = 0x3032000000;
    __int16 v66 = sub_2F9EC;
    uint64_t v67 = sub_2F9FC;
    id v68 = 0;
    id v8 = *(void **)(a1 + 88);
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_36930;
    v53[3] = &unk_617C8;
    id v61 = "_removeConnectedPeripheral:withError:";
    uint64_t v62 = a2;
    id v54 = v48;
    uint64_t v55 = a1;
    id v56 = buf;
    uint64_t v57 = &v63;
    long long v58 = &v69;
    id v59 = &v77;
    uint64_t v60 = &v73;
    objc_msgSend(v8, "hk_withLock:", v53);
    if (v78[3])
    {
      id v9 = *(void **)(*(void *)&buf[8] + 40);
      if (v9) {
        id v9 = (void *)v9[3];
      }
      id v10 = v9;
      ((void (*)(NSObject *, uint64_t (*)(uint64_t, uint64_t), uint64_t, void, void))v10[2].isa)(v10, a2, v78[3], *((unsigned __int8 *)v74 + 24), 0);
    }
    else
    {
      _HKInitializeLogging();
      id v10 = HKLogServices;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector("_removeConnectedPeripheral:withError:");
        id v41 = (char *)(id)objc_claimAutoreleasedReturnValue();
        _HKStringForHealthServiceStatus();
        id v42 = (id)objc_claimAutoreleasedReturnValue();
        long long v43 = *(void **)(*(void *)&buf[8] + 40);
        if (v43) {
          long long v43 = (void *)v43[10];
        }
        uint64_t v44 = v43;
        unsigned int v45 = [(id)v64[5] state];
        *(_DWORD *)v82 = 138413058;
        v83 = v41;
        __int16 v84 = 2114;
        *(void *)v85 = v42;
        *(_WORD *)&v85[8] = 2114;
        *(void *)&v85[10] = v44;
        __int16 v86 = 1024;
        unsigned int v87 = v45;
        _os_log_error_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "*** %@, unknown state %{public}@ for %{public}@ state %d", v82, 0x26u);
      }
    }

    if (*((unsigned char *)v70 + 24))
    {
      id v11 = [(id)v64[5] cbPeripheral];
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)(*(void *)&buf[8] + 40);
      if (v13 && (uint64_t v14 = *(void *)(v13 + 56), (v14 & 1) != 0))
      {
        id v18 = [v11 identifier];
        id v19 = sub_35040((void *)a1, v18);

        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v20 = v19;
        id v21 = [v20 countByEnumeratingWithState:&v49 objects:v81 count:16];
        if (v21)
        {
          char v46 = v14;
          id v47 = v12;
          uint64_t v22 = *(void *)v50;
LABEL_15:
          uint64_t v23 = 0;
          while (1)
          {
            if (*(void *)v50 != v22) {
              objc_enumerationMutation(v20);
            }
            uint64_t v24 = *(void *)(*((void *)&v49 + 1) + 8 * v23);
            _HKInitializeLogging();
            uint64_t v25 = HKLogServices;
            if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
            {
              if (v24) {
                uint64_t v26 = *(void *)(v24 + 96);
              }
              else {
                uint64_t v26 = 0;
              }
              *(_DWORD *)v82 = 138412546;
              v83 = (const char *)v24;
              __int16 v84 = 2048;
              *(void *)v85 = v26;
              _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "Checking pairing state %@ %ld", v82, 0x16u);
            }
            if (v24 && *(void *)(v24 + 96) == 3) {
              break;
            }
            if (v21 == (id)++v23)
            {
              id v27 = [v20 countByEnumeratingWithState:&v49 objects:v81 count:16];
              id v21 = v27;
              if (!v27)
              {
                int v17 = 0;
                goto LABEL_30;
              }
              goto LABEL_15;
            }
          }
          int v17 = 1;
LABEL_30:
          uint64_t v12 = v47;
          LOBYTE(v14) = v46;
        }
        else
        {
          int v17 = 0;
        }

        int v16 = v14 & 1;
        uint64_t v15 = 1;
      }
      else
      {
        uint64_t v15 = 0;
        int v16 = 0;
        int v17 = 0;
      }
      _HKInitializeLogging();
      uint64_t v28 = HKLogServices;
      if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v82 = 136315650;
        v83 = "-[HDHealthServiceManager _removeConnectedPeripheral:withError:]";
        __int16 v84 = 1024;
        *(_DWORD *)v85 = v17;
        *(_WORD *)&v85[4] = 1024;
        *(_DWORD *)&v85[6] = v16;
        _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "%s: unpairingNeeded=%{BOOL}d, forceDisconnection=%{BOOL}d", v82, 0x18u);
      }
      if (v17)
      {
        _HKInitializeLogging();
        uint64_t v29 = HKLogServices;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v30 = [(id)v64[5] cbPeripheral];
          *(_DWORD *)v82 = 138412290;
          v83 = v30;
          _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEFAULT, "Unpairing peripheral %@", v82, 0xCu);
        }
        uint64_t v31 = [v12 identifier];
        sub_37204(a1, v31, &stru_61808);

        id v32 = *(id *)(a1 + 16);
        uint64_t v33 = [v32 sharedPairingAgent];
        [v33 setDelegate:a1];

        id v34 = *(id *)(a1 + 16);
        id v35 = [v34 sharedPairingAgent];
        [v35 unpairPeer:v12];
      }
      else
      {
        _HKInitializeLogging();
        unsigned __int8 v36 = HKLogServices;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          id v37 = [(id)v64[5] cbPeripheral];
          *(_DWORD *)v82 = 138543874;
          v83 = (const char *)a1;
          __int16 v84 = 1024;
          *(_DWORD *)v85 = v16;
          *(_WORD *)&v85[4] = 2112;
          *(void *)&v85[6] = v37;
          _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "%{public}@: Canceling peripheral connection (forcing=%{BOOL}d for peripheral %@)", v82, 0x1Cu);
        }
        if (v15)
        {
          id v38 = *(id *)(a1 + 16);
          uint64_t v39 = [v38 sharedPairingAgent];
          [v39 setDelegate:0];

          __int16 v40 = [v12 identifier];
          sub_37204(a1, v40, &stru_61828);
        }
        [*(id *)(a1 + 16) cancelPeripheralConnection:v12 force:v15];
      }
    }
    _Block_object_dispose(&v63, 8);

    _Block_object_dispose(&v69, 8);
    _Block_object_dispose(&v73, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v77, 8);
  }
}

void sub_34B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose((const void *)(v53 - 160), 8);
  _Block_object_dispose(&a53, 8);
  _Unwind_Resume(a1);
}

void *sub_35040(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x3032000000;
    uint64_t v13 = sub_2F9EC;
    uint64_t v14 = sub_2F9FC;
    id v15 = 0;
    uint64_t v5 = (void *)a1[11];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_36308;
    v7[3] = &unk_607D0;
    id v9 = &v10;
    void v7[4] = a1;
    id v8 = v3;
    objc_msgSend(v5, "hk_withLock:", v7);
    a1 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
  }

  return a1;
}

void sub_35150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_35168(uint64_t a1)
{
  if (a1)
  {
    _HKInitializeLogging();
    uint64_t v2 = (void *)HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = v2;
      id v4 = NSStringFromSelector("_retrieveAndRemoveDisconnectedPeripherals");
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = a1;
      __int16 v23 = 2114;
      uint64_t v24 = v4;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);
    }
    uint64_t v5 = +[NSMutableArray array];
    uint64_t v6 = *(void **)(a1 + 88);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    void v18[2] = sub_353AC;
    v18[3] = &unk_608E8;
    void v18[4] = a1;
    id v7 = v5;
    id v19 = v7;
    objc_msgSend(v6, "hk_withLock:", v18);
    if ([v7 count])
    {
      id v8 = +[NSError hk_error:300 description:@"Device no longer connected"];
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v9 = v7;
      id v10 = [v9 countByEnumeratingWithState:&v14 objects:v20 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v15;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v15 != v12) {
              objc_enumerationMutation(v9);
            }
            sub_3437C(a1, (uint64_t (*)(uint64_t, uint64_t))objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v13), "unsignedIntegerValue", (void)v14), v8);
            uint64_t v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          id v11 = [v9 countByEnumeratingWithState:&v14 objects:v20 count:16];
        }
        while (v11);
      }
    }
  }
}

void sub_353AC(uint64_t a1)
{
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 112);
  id v2 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v37;
    uint64_t v5 = &CFNotificationCenterAddObserver_ptr;
    uint64_t v27 = *(void *)v37;
    do
    {
      uint64_t v6 = 0;
      id v28 = v3;
      do
      {
        if (*(void *)v37 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v36 + 1) + 8 * (void)v6);
        id v8 = [*(id *)(*(void *)(a1 + 32) + 112) objectForKeyedSubscript:v7];
        id v9 = *(void **)(*(void *)(a1 + 32) + 16);
        uint64_t v45 = v7;
        id v10 = [v5[189] arrayWithObjects:&v45 count:1];
        id v11 = [v9 retrievePeripheralsWithIdentifiers:v10];

        if ([v11 count])
        {
          uint64_t v12 = [v11 objectAtIndexedSubscript:0];
          [v8 updateCBPeripheral:v12];
        }
        if (![v8 state])
        {
          uint64_t v30 = v11;
          uint64_t v31 = v6;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 104) objectForKeyedSubscript:v7];
          id v14 = [v13 countByEnumeratingWithState:&v32 objects:v44 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v33;
            do
            {
              long long v17 = 0;
              do
              {
                if (*(void *)v33 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void *)(*((void *)&v32 + 1) + 8 * (void)v17);
                _HKInitializeLogging();
                id v19 = (void *)HKLogServices;
                if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
                {
                  if (v18) {
                    uint64_t v20 = *(void *)(v18 + 16);
                  }
                  else {
                    uint64_t v20 = 0;
                  }
                  id v21 = v19;
                  uint64_t v22 = [v8 cbPeripheral];
                  *(_DWORD *)buf = 134218242;
                  uint64_t v41 = v20;
                  __int16 v42 = 2112;
                  long long v43 = v22;
                  _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "Peripheral was unexpectedly disconnected. sessionIdentifier =  %lu, peripheral = %@", buf, 0x16u);
                }
                __int16 v23 = *(void **)(a1 + 40);
                if (v18) {
                  uint64_t v24 = *(void *)(v18 + 16);
                }
                else {
                  uint64_t v24 = 0;
                }
                uint64_t v25 = +[NSNumber numberWithUnsignedInteger:v24];
                [v23 addObject:v25];

                long long v17 = (char *)v17 + 1;
              }
              while (v15 != v17);
              id v26 = [v13 countByEnumeratingWithState:&v32 objects:v44 count:16];
              id v15 = v26;
            }
            while (v26);
          }

          uint64_t v4 = v27;
          id v3 = v28;
          uint64_t v5 = &CFNotificationCenterAddObserver_ptr;
          id v11 = v30;
          uint64_t v6 = v31;
        }

        uint64_t v6 = (char *)v6 + 1;
      }
      while (v6 != v3);
      id v3 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
    }
    while (v3);
  }
}

void sub_356D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    _HKInitializeLogging();
    uint64_t v4 = (void *)HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = v4;
      uint64_t v6 = NSStringFromSelector("_removeConnectingPeripheralsWithError:");
      *(_DWORD *)buf = 138543874;
      uint64_t v26 = a1;
      __int16 v27 = 2114;
      id v28 = v6;
      __int16 v29 = 2114;
      id v30 = v3;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: error %{public}@", buf, 0x20u);
    }
    id v7 = objc_alloc_init((Class)NSMutableArray);
    id v8 = *(void **)(a1 + 88);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_35900;
    v22[3] = &unk_608E8;
    v22[4] = a1;
    id v9 = v7;
    id v23 = v9;
    objc_msgSend(v8, "hk_withLock:", v22);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        id v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v14);
          if (v15) {
            uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t))(v15 + 16);
          }
          else {
            uint64_t v16 = 0;
          }
          sub_3437C(a1, v16, v3);
          id v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v17 = [v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
        id v12 = v17;
      }
      while (v17);
    }
  }
}

void sub_35900(uint64_t a1)
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 104);
  id v3 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(*(void *)(a1 + 32) + 104) objectForKeyedSubscript:*(void *)(*((void *)&v17 + 1) + 8 * (void)v6)];
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v8 = [v7 countByEnumeratingWithState:&v13 objects:v21 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v14;
          do
          {
            id v11 = 0;
            do
            {
              if (*(void *)v14 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v11);
              if (v12 && *(void *)(v12 + 88) == 2) {
                objc_msgSend(*(id *)(a1 + 40), "addObject:");
              }
              id v11 = (char *)v11 + 1;
            }
            while (v9 != v11);
            id v9 = [v7 countByEnumeratingWithState:&v13 objects:v21 count:16];
          }
          while (v9);
        }

        uint64_t v6 = (char *)v6 + 1;
      }
      while (v6 != v4);
      id v4 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);
  }
}

void sub_35CA0(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 96) allObjects];
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v8);
        if (v9 && *(void *)(v9 + 64) == 1)
        {
          uint64_t v10 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "objectForKeyedSubscript:", *(void *)(v9 + 80), (void)v13);
          if (v10) {
            [v3 addObject:v10];
          }
          id v11 = *(id *)(v9 + 48);
          uint64_t v12 = v11;
          if (v11) {
            (*((void (**)(id, void, void))v11 + 2))(v11, *(void *)(v9 + 16), 0);
          }
          if (*(void *)(v9 + 64) == 1) {
            *(void *)(v9 + 64) = 2;
          }
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

void sub_35ED8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 128);
  if (v3)
  {
    dispatch_source_cancel(v3);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)(v2 + 24));
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v4;

  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 128);
  dispatch_time_t v8 = dispatch_walltime(0, 3540000000000);
  dispatch_source_set_timer(v7, v8, 0x33838714800uLL, 0x3B9ACA00uLL);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(NSObject **)(v9 + 128);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_35FFC;
  void v11[3] = &unk_608E8;
  v11[4] = v9;
  id v12 = *(id *)(a1 + 40);
  dispatch_source_set_event_handler(v10, v11);
  dispatch_activate(*(dispatch_object_t *)(*(void *)(a1 + 32) + 128));
  sub_36008(*(void *)(a1 + 32), *(void **)(a1 + 40));
}

void sub_35FFC(uint64_t a1)
{
}

void sub_36008(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    _HKInitializeLogging();
    dispatch_source_t v4 = (void *)HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = v4;
      id v6 = NSStringFromSelector("_queue_extendPrivateModeLeaseForSessionWithIdentifier:");
      int v7 = 138544130;
      uint64_t v8 = a1;
      __int16 v9 = 2114;
      uint64_t v10 = v6;
      __int16 v11 = 2114;
      id v12 = v3;
      __int16 v13 = 1024;
      int v14 = 3600;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: session: %{public}@, duration: %d", (uint8_t *)&v7, 0x26u);
    }
    [*(id *)(a1 + 16) enablePrivateModeForSessionWithIdentifier:v3 forDuration:3600];
  }
}

void sub_361A0(uint64_t a1)
{
  _HKInitializeLogging();
  uint64_t v2 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v3 = *(const char **)(a1 + 40);
    uint64_t v5 = v2;
    id v6 = NSStringFromSelector(v3);
    int v10 = 138543618;
    uint64_t v11 = v4;
    __int16 v12 = 2114;
    __int16 v13 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  int v7 = *(NSObject **)(*(void *)(a1 + 32) + 128);
  if (v7)
  {
    dispatch_source_cancel(v7);
    uint64_t v8 = *(void *)(a1 + 32);
    __int16 v9 = *(void **)(v8 + 128);
    *(void *)(v8 + 128) = 0;
  }
}

void sub_362A0(void *a1)
{
  id v5 = [*(id *)(a1[4] + 64) objectForKeyedSubscript:a1[5]];
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_36308(void *a1)
{
  id v5 = [*(id *)(a1[4] + 104) objectForKeyedSubscript:a1[5]];
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_36370(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 96))
  {
    uint64_t v3 = objc_alloc_init(HDIdentifierTable);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 96);
    *(void *)(v4 + 96) = v3;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (!*(void *)(v2 + 104))
  {
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 104);
    *(void *)(v7 + 104) = v6;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(v2 + 96) addObject:*(void *)(a1 + 40)];
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    *(void *)(v9 + 16) = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  }
  int v10 = *(void **)(*(void *)(a1 + 32) + 104);
  uint64_t v11 = [*(id *)(a1 + 48) identifier];
  __int16 v12 = [v10 objectForKeyedSubscript:v11];

  if (v12)
  {
    [v12 addObject:*(void *)(a1 + 40)];
  }
  else
  {
    __int16 v12 = +[NSMutableArray arrayWithObject:*(void *)(a1 + 40)];
    __int16 v13 = *(void **)(*(void *)(a1 + 32) + 104);
    int v14 = [*(id *)(a1 + 48) identifier];
    [v13 setObject:v12 forKeyedSubscript:v14];

    long long v15 = *(void **)(*(void *)(a1 + 32) + 112);
    long long v16 = [*(id *)(a1 + 48) identifier];
    uint64_t v17 = [v15 objectForKeyedSubscript:v16];
    uint64_t v18 = a1 + 72;
    uint64_t v19 = *(void *)(*(void *)(a1 + 72) + 8);
    long long v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v17;

    if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
    {
      long long v21 = [HDHealthPeripheral alloc];
      uint64_t v22 = *(void *)(a1 + 48);
      id v23 = [*(id *)(a1 + 56) name];
      uint64_t v24 = *(void *)(a1 + 32);
      id WeakRetained = objc_loadWeakRetained((id *)(v24 + 40));
      uint64_t v26 = [(HDHealthPeripheral *)v21 initWithCBPeripheral:v22 name:v23 serviceManager:v24 profile:WeakRetained];
      uint64_t v27 = *(void *)(*(void *)(a1 + 72) + 8);
      id v28 = *(void **)(v27 + 40);
      *(void *)(v27 + 40) = v26;

      _HKInitializeLogging();
      __int16 v29 = HKLogServices;
      if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = *(void *)(a1 + 32);
        uint64_t v31 = *(void *)(a1 + 48);
        uint64_t v32 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        int v44 = 138543874;
        uint64_t v45 = v30;
        __int16 v46 = 2114;
        uint64_t v47 = v31;
        __int16 v48 = 2114;
        uint64_t v49 = v32;
        _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: no HDHealthPeripheral found for CBPeripheral %{public}@, so create one: %{public}@", (uint8_t *)&v44, 0x20u);
      }
      uint64_t v33 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      long long v34 = *(void **)(*(void *)(a1 + 32) + 112);
      long long v35 = [*(id *)(a1 + 48) identifier];
      [v34 setObject:v33 forKeyedSubscript:v35];
    }
    id v36 = objc_alloc(*(Class *)(a1 + 80));
    uint64_t v37 = *(void *)(a1 + 32);
    uint64_t v38 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    long long v39 = [*(id *)(a1 + 56) advertisementData];
    id v40 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    id v41 = [v36 initWithServiceManager:v37 peripheral:v38 advertisementData:v39 profile:v40];

    if (v41)
    {
      __int16 v42 = [*(id *)(a1 + 56) serviceId];
      [v41 setServiceId:v42];

      [*(id *)(*(void *)(*(void *)v18 + 8) + 40) addHealthService:v41];
    }
    else
    {
      _HKInitializeLogging();
      long long v43 = (void *)HKLogServices;
      if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR)) {
        sub_41D3C(a1 + 72, (void **)(a1 + 56), v43);
      }
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    }
  }
}

void sub_36744(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = v3;
  if (a1 && v3 && v3[13] > 0.0)
  {
    id v5 = dispatch_get_global_queue(0, 0);
    id v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v5);

    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v4[13] * 1000000000.0));
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0xB2D05E00uLL);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_36878;
    v9[3] = &unk_608E8;
    uint64_t v8 = v4;
    int v10 = v8;
    uint64_t v11 = a1;
    dispatch_source_set_event_handler(v6, v9);
    dispatch_resume(v6);
    sub_36920((uint64_t)v8, v6);
  }
}

void sub_36878(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    uint64_t v3 = *(void *)(v3 + 80);
  }
  uint64_t v4 = +[NSError hk_error:103, @"(#w0) Timeout attempting to connect peripheral %@", v3 format];
  sub_36920(*(void *)(a1 + 32), 0);
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    id v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 16);
  }
  else {
    id v6 = 0;
  }
  sub_3437C(*(void *)(a1 + 40), v6, v4);
}

void sub_36920(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 112), a2);
  }
}

void sub_36930(uint64_t a1)
{
  _HKInitializeLogging();
  uint64_t v2 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(const char **)(a1 + 88);
    uint64_t v4 = v2;
    uint64_t v5 = NSStringFromSelector(v3);
    uint64_t v6 = *(void *)(a1 + 96);
    uint64_t v7 = *(void *)(a1 + 32);
    int v74 = 138412802;
    uint64_t v75 = (uint64_t)v5;
    __int16 v76 = 1024;
    *(_DWORD *)uint64_t v77 = v6;
    *(_WORD *)&v77[4] = 2112;
    *(void *)&v77[6] = v7;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%@: sessionIdentifier %d, error %@", (uint8_t *)&v74, 0x1Cu);
  }
  uint64_t v8 = (uint64_t *)(a1 + 96);
  uint64_t v9 = [*(id *)(*(void *)(a1 + 40) + 96) objectWithIdentifier:*(void *)(a1 + 96)];
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v12)
  {
    if (*(void *)(v12 + 112))
    {
      uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (v13) {
        int v14 = *(NSObject **)(v13 + 112);
      }
      else {
        int v14 = 0;
      }
      dispatch_source_cancel(v14);
      sub_36920(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), 0);
    }
    uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v15) {
      uint64_t v16 = *(void *)(v15 + 80);
    }
    else {
      uint64_t v16 = 0;
    }
    uint64_t v17 = [*(id *)(*(void *)(a1 + 40) + 104) objectForKeyedSubscript:v16];
    uint64_t v18 = *(void **)(*(void *)(a1 + 40) + 112);
    uint64_t v19 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v19) {
      uint64_t v19 = (void *)v19[10];
    }
    long long v20 = v19;
    uint64_t v21 = [v18 objectForKeyedSubscript:v20];
    uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
    id v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;

    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      _HKInitializeLogging();
      long long v34 = (void *)HKLogServices;
      if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR)) {
        sub_41DFC(a1, v34);
      }
      goto LABEL_73;
    }
    if ([v17 count] != (char *)&dword_0 + 1)
    {
      if (v17
        && (id v35 = [v17 indexOfObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)],
            v35 != (id)0x7FFFFFFFFFFFFFFFLL))
      {
        id v37 = v35;
        _HKInitializeLogging();
        uint64_t v38 = HKLogServices;
        if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v74) = 0;
          _os_log_impl(&dword_0, v38, OS_LOG_TYPE_DEFAULT, "Removing object from connection infos table", (uint8_t *)&v74, 2u);
        }
        *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 10;
        [*(id *)(*(void *)(a1 + 40) + 96) removeObjectWithIdentifier:*(void *)(a1 + 96)];
        [v17 removeObjectAtIndex:v37];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
      }
      else
      {
        _HKInitializeLogging();
        id v36 = (void *)HKLogServices;
        if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR)) {
          sub_41E9C(a1, v36);
        }
      }
      _HKInitializeLogging();
      long long v39 = (void *)HKLogServices;
      if (!os_log_type_enabled(HKLogServices, OS_LOG_TYPE_INFO)) {
        goto LABEL_73;
      }
      id v40 = v39;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        id v41 = NSStringFromSelector(*(SEL *)(a1 + 88));
        id v42 = [v17 count];
        uint64_t v43 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) name];
        int v44 = (void *)v43;
        int v45 = *(_DWORD *)(a1 + 96);
        uint64_t v46 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        if (v46) {
          uint64_t v46 = *(void *)(v46 + 80);
        }
        int v74 = 138413314;
        uint64_t v75 = (uint64_t)v41;
        __int16 v76 = 2048;
        *(void *)uint64_t v77 = v42;
        *(_WORD *)&v77[8] = 2112;
        *(void *)&v77[10] = v43;
        __int16 v78 = 1024;
        int v79 = v45;
        __int16 v80 = 2112;
        uint64_t v81 = v46;
        _os_log_impl(&dword_0, v40, OS_LOG_TYPE_INFO, "%@, %ld sessions remain: %@ (%d) %@", (uint8_t *)&v74, 0x30u);

        goto LABEL_71;
      }
LABEL_72:

LABEL_73:
      return;
    }
    _HKInitializeLogging();
    uint64_t v24 = HKLogServices;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (v25) {
        uint64_t v26 = *(void *)(v25 + 96);
      }
      else {
        uint64_t v26 = 0;
      }
      uint64_t v27 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) stateDescription];
      id v28 = (void *)v27;
      uint64_t v29 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (v29 && (unint64_t v30 = *(void *)(v29 + 88) - 1, v30 <= 3)) {
        CFStringRef v31 = off_61948[v30];
      }
      else {
        CFStringRef v31 = @"Unknown";
      }
      int v74 = 134218498;
      uint64_t v75 = v26;
      __int16 v76 = 2114;
      *(void *)uint64_t v77 = v27;
      *(_WORD *)&v77[8] = 2114;
      *(void *)&v77[10] = v31;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "Last connection pairingState=%ld, peripheral.state=%{public}@, info.connectionState=%{public}@", (uint8_t *)&v74, 0x20u);
    }
    uint64_t v47 = (char *)[*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) state];
    if ((unint64_t)(v47 - 1) >= 3)
    {
      if (!v47)
      {
        *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 9;
        [*(id *)(*(void *)(a1 + 40) + 96) removeObjectWithIdentifier:*(void *)(a1 + 96)];
        uint64_t v57 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        if (v57) {
          uint64_t v58 = *(void *)(v57 + 80);
        }
        else {
          uint64_t v58 = 0;
        }
        [*(id *)(*(void *)(a1 + 40) + 112) removeObjectForKey:v58];
        uint64_t v59 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        if (v59) {
          uint64_t v60 = *(void *)(v59 + 80);
        }
        else {
          uint64_t v60 = 0;
        }
        [*(id *)(*(void *)(a1 + 40) + 104) removeObjectForKey:v60];
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) disconnectServices];
        uint64_t v61 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        if (v61 && *(void *)(v61 + 96) == 2)
        {
          uint64_t v62 = *(void **)(a1 + 40);
          if (v62) {
            uint64_t v62 = (void *)v62[2];
          }
          uint64_t v63 = v62;
          __int16 v64 = [v63 sharedPairingAgent];
          uint64_t v65 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) cbPeripheral];

          LODWORD(v63) = [v64 isPeerPaired:v65];
          if (v63)
          {
            _HKInitializeLogging();
            __int16 v66 = HKLogServices;
            if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v74) = 0;
              _os_log_impl(&dword_0, v66, OS_LOG_TYPE_DEFAULT, "Unpairing peer as we previously forced disconnect, but are still paired", (uint8_t *)&v74, 2u);
            }
            uint64_t v67 = *(void **)(a1 + 40);
            if (v67) {
              uint64_t v67 = (void *)v67[2];
            }
            id v68 = v67;
            uint64_t v69 = [v68 sharedPairingAgent];
            __int16 v70 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) cbPeripheral];

            [v69 unpairPeer:v70];
          }
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
      }
    }
    else
    {
      uint64_t v48 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (v48)
      {
        if (*(void *)(v48 + 88) == 4) {
          goto LABEL_67;
        }
        *(void *)(v48 + 88) = 4;
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8)+ 40) state] != (char *)&dword_0 + 3;
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 8;
      _HKInitializeLogging();
      uint64_t v49 = HKLogServices;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v50 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        if (v50) {
          uint64_t v51 = *(void *)(v50 + 96);
        }
        else {
          uint64_t v51 = 0;
        }
        uint64_t v52 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) stateDescription];
        uint64_t v53 = (void *)v52;
        uint64_t v54 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        if (v54 && (unint64_t v55 = *(void *)(v54 + 88) - 1, v55 <= 3)) {
          CFStringRef v56 = off_61948[v55];
        }
        else {
          CFStringRef v56 = @"Unknown";
        }
        int v71 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        int v74 = 134218754;
        uint64_t v75 = v51;
        __int16 v76 = 2114;
        *(void *)uint64_t v77 = v52;
        *(_WORD *)&v77[8] = 2114;
        *(void *)&v77[10] = v56;
        __int16 v78 = 1024;
        int v79 = v71;
        _os_log_impl(&dword_0, v49, OS_LOG_TYPE_DEFAULT, "Transitioned to disconnecting. pairingState=%ld, state=%{public}@, connectionState=%{public}@, cancelPeripheralConnection=%{BOOL}d", (uint8_t *)&v74, 0x26u);
      }
    }
LABEL_67:
    _HKInitializeLogging();
    id v40 = HKLogServices;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v72 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) name];
      id v41 = (void *)v72;
      uint64_t v73 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (v73) {
        uint64_t v73 = *(void *)(v73 + 80);
      }
      int v74 = 138412546;
      uint64_t v75 = v72;
      __int16 v76 = 2112;
      *(void *)uint64_t v77 = v73;
      _os_log_impl(&dword_0, v40, OS_LOG_TYPE_DEFAULT, "Removing peripheral %@ (%@)", (uint8_t *)&v74, 0x16u);
LABEL_71:

      goto LABEL_72;
    }
    goto LABEL_72;
  }
  _HKInitializeLogging();
  uint64_t v32 = HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v33 = *v8;
    int v74 = 67109120;
    LODWORD(v75) = v33;
    _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "*** Connection already closed for %d", (uint8_t *)&v74, 8u);
  }
}

CFStringRef _HKStringForHealthServiceConnectionState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"Unknown";
  }
  else {
    return off_61948[a1 - 1];
  }
}

void sub_371F4(id a1, _HDHealthServiceConnectionInfo *a2)
{
  if (a2) {
    a2->_pairingState = 4;
  }
}

void sub_37204(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = *(void **)(a1 + 88);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    _DWORD v8[2] = sub_37F28;
    v8[3] = &unk_61850;
    void v8[4] = a1;
    id v9 = v5;
    id v10 = v6;
    objc_msgSend(v7, "hk_withLock:", v8);
  }
}

void sub_372CC(id a1, _HDHealthServiceConnectionInfo *a2)
{
  if (a2) {
    a2->_pairingState = 2;
  }
}

id sub_372DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v23 objects:v30 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v24;
      id v9 = &__NSDictionary0__struct;
      do
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          id v12 = v11;
          id v13 = [v12 countByEnumeratingWithState:&v19 objects:v29 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v20;
            while (2)
            {
              for (j = 0; j != v14; j = (char *)j + 1)
              {
                if (*(void *)v20 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8 * (void)j);
                if (v17 && *(unsigned char *)(v17 + 17))
                {
                  v27[0] = CBCentralManagerScanOptionRequiresActive;
                  v27[1] = CBCentralManagerScanOptionAllowDuplicatesKey;
                  v28[0] = &__kCFBooleanTrue;
                  v28[1] = &__kCFBooleanFalse;
                  id v9 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];

                  goto LABEL_21;
                }
              }
              id v14 = [v12 countByEnumeratingWithState:&v19 objects:v29 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v23 objects:v30 count:16];
      }
      while (v7);
    }
    else
    {
      id v9 = &__NSDictionary0__struct;
    }
LABEL_21:
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

uint64_t sub_374FC(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [objc_alloc((Class)NSDictionary) initWithDictionary:*(void *)(*(void *)(a1 + 32) + 64) copyItems:1];

  return _objc_release_x1();
}

id sub_37558(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = +[NSMutableArray array];
    for (int i = 0; i != 256; ++i)
    {
      id v3 = +[NSString stringWithFormat:@"%X", (i + 6144)];
      uint64_t v4 = +[CBUUID UUIDWithString:v3];
      [v1 addObject:v4];
    }
    id v5 = [v1 copy];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

id sub_37644(id a1)
{
  id v1 = a1;
  if (a1)
  {
    uint64_t v2 = (objc_class *)objc_opt_class();
    id v3 = NSStringFromClass(v2);
    id v1 = +[NSString stringWithFormat:@"<%@:%p>", v3, v1];
  }

  return v1;
}

void sub_376C8(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    _HKInitializeLogging();
    uint64_t v2 = (void *)HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = v2;
      uint64_t v4 = NSStringFromSelector("_queue_stopScan");
      int v9 = 138543618;
      id v10 = (void *)a1;
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", (uint8_t *)&v9, 0x16u);
    }
    if ([*(id *)(a1 + 72) count])
    {
      _HKInitializeLogging();
      id v5 = (void *)HKLogServices;
      if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = v5;
        id v7 = sub_37644((id)a1);
        int v9 = 138412290;
        id v10 = v7;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%@ stopping peripheral scan", (uint8_t *)&v9, 0xCu);
      }
      [*(id *)(a1 + 16) stopScan];
      uint64_t v8 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = 0;
    }
  }
}

id sub_37844(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) allObjects];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(a1 + 32) + 56) removeAllObjects];
  id v5 = *(void **)(*(void *)(a1 + 32) + 64);

  return [v5 removeAllObjects];
}

void sub_379D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_379EC(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 112) objectForKeyedSubscript:a1[5]];

  return _objc_release_x1();
}

void sub_37C40(uint64_t a1)
{
  id v2 = objc_alloc((Class)NSUUID);
  uint64_t v3 = [*(id *)(a1 + 32) localIdentifier];
  id v4 = [v2 initWithUUIDString:v3];

  long long v26 = v4;
  id v5 = [*(id *)(*(void *)(a1 + 40) + 104) objectForKeyedSubscript:v4];
  if (![v5 count])
  {
    _HKInitializeLogging();
    id v6 = (void *)HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_INFO))
    {
      id v7 = *(void **)(a1 + 32);
      uint64_t v8 = v6;
      int v9 = [v7 localIdentifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v32 = v9;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "No connection infos found for device uuid: %@", buf, 0xCu);
    }
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v5;
  id v11 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * (void)v14);
        if (v15 && (*(void *)(v15 + 88) & 0xFFFFFFFFFFFFFFFELL) == 2)
        {
          id v16 = *(id *)(v15 + 32);
          id v17 = objc_retainBlock(v16);
          uint64_t v18 = *(void **)(a1 + 48);
          long long v19 = +[NSNumber numberWithUnsignedInteger:*(void *)(v15 + 16)];
          [v18 setObject:v17 forKeyedSubscript:v19];
        }
        else
        {
          _HKInitializeLogging();
          long long v20 = (void *)HKLogServices;
          if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_INFO))
          {
            if (v15)
            {
              unint64_t v21 = *(void *)(v15 + 88) - 1;
              CFStringRef v22 = @"Unknown";
              if (v21 <= 3) {
                CFStringRef v22 = off_61948[v21];
              }
            }
            else
            {
              CFStringRef v22 = @"Unknown";
            }
            long long v23 = *(void **)(a1 + 56);
            *(_DWORD *)buf = 138412546;
            uint64_t v32 = v23;
            __int16 v33 = 2112;
            CFStringRef v34 = v22;
            long long v24 = v20;
            _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "Ignoring received characteristic %@, state='%@'", buf, 0x16u);
          }
        }
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v25 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
      id v12 = v25;
    }
    while (v25);
  }
}

void sub_37F28(void *a1)
{
  id v2 = [*(id *)(a1[4] + 104) objectForKeyedSubscript:a1[5]];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = (char *)[v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(a1[6] + 16))();
        ++v6;
      }
      while (v4 != v6);
      id v4 = (char *)[v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void sub_381EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_38204(void *a1)
{
  id v2 = [*(id *)(a1[4] + 96) objectWithIdentifier:a1[6]];
  if (v2)
  {
    uint64_t v3 = *(void **)(a1[4] + 112);
    long long v8 = v2;
    id v4 = v2[10];
    uint64_t v5 = [v3 objectForKeyedSubscript:v4];
    uint64_t v6 = *(void *)(a1[5] + 8);
    long long v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v2 = v8;
  }
}

void sub_38564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_38588(void *a1)
{
  id v2 = [*(id *)(a1[4] + 96) objectWithIdentifier:a1[6]];
  if (v2)
  {
    uint64_t v3 = *(void **)(a1[4] + 112);
    long long v8 = v2;
    id v4 = v2[10];
    uint64_t v5 = [v3 objectForKeyedSubscript:v4];
    uint64_t v6 = *(void *)(a1[5] + 8);
    long long v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v2 = v8;
  }
}

uint64_t sub_38624(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_388E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_38908(void *a1)
{
  id v2 = [*(id *)(a1[4] + 96) objectWithIdentifier:a1[6]];
  if (v2)
  {
    uint64_t v3 = *(void **)(a1[4] + 112);
    long long v8 = v2;
    id v4 = v2[10];
    uint64_t v5 = [v3 objectForKeyedSubscript:v4];
    uint64_t v6 = *(void *)(a1[5] + 8);
    long long v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v2 = v8;
  }
}

uint64_t sub_389A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a4 == 0, a4);
}

void sub_38BEC(uint64_t a1)
{
  sub_30D94(*(void *)(a1 + 32), *(void *)(a1 + 48), *(void **)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);

  sub_319B4(v2);
}

void sub_38F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_38F68(uint64_t a1)
{
  uint64_t v2 = +[NSMutableDictionary dictionary];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 104);
  id v4 = [*(id *)(a1 + 40) identifier];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v45 objects:v58 count:16];
  id v40 = v6;
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v46;
    *(void *)&long long v8 = 138412290;
    long long v39 = v8;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v46 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v45 + 1) + 8 * (void)v11);
        if (v12)
        {
          if (*(void *)(v12 + 88) == 3) {
            goto LABEL_12;
          }
          uint64_t v13 = *(void **)(v12 + 24);
        }
        else
        {
          uint64_t v13 = 0;
        }
        id v14 = v13;
        id v15 = objc_retainBlock(v14);
        if (v12)
        {
          id v16 = +[NSNumber numberWithUnsignedInteger:*(void *)(v12 + 16)];
          [v2 setObject:v15 forKeyedSubscript:v16];

          *(void *)(v12 + 88) = 3;
          if (*(void *)(v12 + 112))
          {
            dispatch_source_cancel(*(dispatch_source_t *)(v12 + 112));
            sub_36920(v12, 0);
          }
        }
        else
        {
          long long v26 = +[NSNumber numberWithUnsignedInteger:0];
          [v2 setObject:v15 forKeyedSubscript:v26];
        }
LABEL_12:
        id v17 = objc_msgSend(*(id *)(a1 + 48), "sharedPairingAgent", v39);
        unsigned int v18 = [v17 isPeerPaired:*(void *)(a1 + 40)];

        if (v18)
        {
          if (v12)
          {
            *(void *)(v12 + 96) = 3;
            if ((*(unsigned char *)(v12 + 56) & 2) != 0)
            {
              *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
              goto LABEL_34;
            }
LABEL_22:
            if (*(unsigned char *)(v12 + 8)) {
              goto LABEL_28;
            }
          }
        }
        else if (v12)
        {
          if ((*(unsigned char *)(v12 + 56) & 1) != 0 && !*(unsigned char *)(v12 + 8))
          {
            _HKInitializeLogging();
            long long v19 = HKLogServices;
            if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v20 = *(void *)(a1 + 40);
              *(_DWORD *)buf = v39;
              uint64_t v51 = v20;
              _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Calling pair peer on %@", buf, 0xCu);
            }
            HKSessionTrackerAriadneTrigger();
            *(void *)(v12 + 96) = 1;
            unint64_t v21 = [*(id *)(a1 + 48) sharedPairingAgent];
            [v21 pairPeer:*(void *)(a1 + 40)];

            *(unsigned char *)(v12 + 8) = 1;
          }
          goto LABEL_22;
        }
        _HKInitializeLogging();
        CFStringRef v22 = HKLogServices;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = *(void *)(a1 + 40);
          if (v12)
          {
            long long v24 = +[NSNumber numberWithUnsignedInteger:*(void *)(v12 + 56)];
            BOOL v25 = *(unsigned char *)(v12 + 8) != 0;
          }
          else
          {
            long long v24 = +[NSNumber numberWithUnsignedInteger:0];
            BOOL v25 = 0;
          }
          *(_DWORD *)buf = 138413058;
          uint64_t v51 = v23;
          __int16 v52 = 2114;
          uint64_t v53 = v24;
          __int16 v54 = 1024;
          BOOL v55 = v25;
          __int16 v56 = 1024;
          unsigned int v57 = v18;
          _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "Not calling pair peer on %@, connectionOptions=%{public}@, pairingAttempted=%{BOOL}d, isPeripheralPaired=%{BOOL}d", buf, 0x22u);

          id v6 = v40;
        }

LABEL_28:
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v27 = [v6 countByEnumeratingWithState:&v45 objects:v58 count:16];
      id v9 = v27;
    }
    while (v27);
  }
LABEL_34:

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v28 = [v2 allKeys];
    id v29 = [v28 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v42;
      do
      {
        for (int i = 0; i != v30; int i = (char *)i + 1)
        {
          if (*(void *)v42 != v31) {
            objc_enumerationMutation(v28);
          }
          __int16 v33 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          CFStringRef v34 = [v2 objectForKeyedSubscript:v33];
          ((void (**)(void, id, uint64_t, void, void))v34)[2](v34, [v33 unsignedIntegerValue], 7, 0, 0);
        }
        id v30 = [v28 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v30);
    }

    id v35 = *(void **)(a1 + 40);
    id v36 = *(void **)(*(void *)(a1 + 32) + 112);
    id v37 = [v35 identifier];
    uint64_t v38 = [v36 objectForKeyedSubscript:v37];

    if (v38) {
      [v38 discoverServices];
    }

    id v6 = v40;
  }
}

id sub_39B3C(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  if (a1)
  {
    id v11 = a5;
    id v12 = a4;
    _HKInitializeLogging();
    uint64_t v13 = (void *)HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = v13;
      id v15 = NSStringFromSelector("_reportPeripheral:serviceUUID:serviceAdvertisementData:peripheralAdvertisementData:");
      int v22 = 138544130;
      uint64_t v23 = a1;
      __int16 v24 = 2114;
      id v25 = v15;
      __int16 v26 = 2114;
      id v27 = v9;
      __int16 v28 = 2114;
      id v29 = v10;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: peripheral: %{public}@, serviceUUID: %{public}@", (uint8_t *)&v22, 0x2Au);
    }
    id v16 = sub_32588(a1, v10, v9, v12, v11);

    if ([v16 type] == (id)-1 || objc_msgSend(v16, "type") == (id)-3)
    {
      _HKInitializeLogging();
      id v17 = (void *)HKLogServices;
      if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v18 = v17;
        long long v19 = [v16 type];
        int v22 = 134218498;
        uint64_t v23 = v19;
        __int16 v24 = 2112;
        id v25 = v9;
        __int16 v26 = 2112;
        id v27 = v10;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Not notifying because health service is invalid %ld, peripheral: %@, serviceUUID: %@", (uint8_t *)&v22, 0x20u);
      }
    }
    else
    {
      uint64_t v20 = sub_32AFC(a1, v10);
      sub_39D80((uint64_t)a1, v20, v9, v16, 0);
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

void sub_39D80(uint64_t a1, void *a2, void *a3, void *a4, int a5)
{
  id v29 = a2;
  id v8 = a3;
  id v31 = a4;
  uint64_t v33 = a1;
  if (a1)
  {
    _HKInitializeLogging();
    id v9 = (void *)HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      id v11 = NSStringFromSelector("_notifyDiscoveryForInfos:peripheral:healthService:alwaysNotify:");
      *(_DWORD *)buf = 138544642;
      uint64_t v47 = a1;
      __int16 v48 = 2114;
      id v49 = v11;
      __int16 v50 = 2114;
      *(void *)uint64_t v51 = v8;
      *(_WORD *)&v51[8] = 2114;
      id v52 = v31;
      __int16 v53 = 1024;
      int v54 = a5;
      __int16 v55 = 2114;
      id v56 = v29;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: peripheral: %{public}@, healthService: %{public}@, alwaysNotify: %{BOOL}d, discoveryInfos: %{public}@", buf, 0x3Au);
    }
    long long v44 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v41 = 0u;
    id obj = v29;
    id v12 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v42;
      do
      {
        id v14 = 0;
        do
        {
          if (*(void *)v42 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v41 + 1) + 8 * (void)v14);
          uint64_t v37 = 0;
          uint64_t v38 = &v37;
          uint64_t v39 = 0x2020000000;
          char v40 = 0;
          id v16 = *(void **)(v33 + 48);
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472;
          v34[2] = sub_3A1F8;
          v34[3] = &unk_607D0;
          id v36 = &v37;
          v34[4] = v15;
          id v35 = v8;
          objc_msgSend(v16, "hk_withLock:", v34);
          if ((a5 & 1) != 0 || *((unsigned char *)v38 + 24))
          {
            if (v15)
            {
LABEL_12:
              char v17 = 0;
              unsigned int v18 = *(void **)(v15 + 32);
            }
            else
            {
              unsigned int v18 = 0;
              char v17 = 1;
            }
            id v19 = v18;
            _HKInitializeLogging();
            uint64_t v20 = HKLogServices;
            if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
            {
              if (v17) {
                uint64_t v21 = 0;
              }
              else {
                uint64_t v21 = *(void *)(v15 + 24);
              }
              *(_DWORD *)buf = 134218242;
              uint64_t v47 = v21;
              __int16 v48 = 2112;
              id v49 = v8;
              _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Notifying client with server ID %ld of new peripheral: %@", buf, 0x16u);
            }
            if (v17) {
              uint64_t v22 = 0;
            }
            else {
              uint64_t v22 = *(void *)(v15 + 24);
            }
            (*((void (**)(id, uint64_t, id, void, void))v19 + 2))(v19, v22, v31, 0, 0);

            goto LABEL_20;
          }
          if (v15 && *(unsigned char *)(v15 + 16)) {
            goto LABEL_12;
          }
          _HKInitializeLogging();
          uint64_t v23 = HKLogServices;
          if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
          {
            if (v15)
            {
              uint64_t v24 = *(void *)(v15 + 24);
              id v25 = v38;
              BOOL v26 = *(unsigned char *)(v15 + 16) != 0;
            }
            else
            {
              uint64_t v24 = 0;
              BOOL v26 = 0;
              id v25 = v38;
            }
            int v27 = *((unsigned __int8 *)v25 + 24);
            *(_DWORD *)buf = 134219010;
            uint64_t v47 = v24;
            __int16 v48 = 2112;
            id v49 = v8;
            __int16 v50 = 1024;
            *(_DWORD *)uint64_t v51 = 0;
            *(_WORD *)&v51[4] = 1024;
            *(_DWORD *)&v51[6] = v27;
            LOWORD(v52) = 1024;
            *(_DWORD *)((char *)&v52 + 2) = v26;
            _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "Not notifying client with server ID %ld of new peripheral: %@ because none of these is true: alwaysNotify: %{BOOL}d, firstTime: %d discovery info always notify: %{BOOL}d", buf, 0x28u);
          }
LABEL_20:

          _Block_object_dispose(&v37, 8);
          id v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v28 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
        id v12 = v28;
      }
      while (v28);
    }
  }
}

void sub_3A1D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_3A1F8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) identifier];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = sub_3A25C(v2, v3);
}

uint64_t sub_3A25C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    if ([*(id *)(a1 + 8) containsObject:v3])
    {
      a1 = 0;
    }
    else
    {
      _HKInitializeLogging();
      id v4 = HKLogServices;
      if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 138412546;
        uint64_t v7 = a1;
        __int16 v8 = 2112;
        id v9 = v3;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Adding peripheral UUID to %@ with id %@", (uint8_t *)&v6, 0x16u);
      }
      [*(id *)(a1 + 8) addObject:v3];
      a1 = 1;
    }
  }

  return a1;
}

uint64_t sub_3A354(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 112) allValues];

  return _objc_release_x1();
}

void sub_3A9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_3AA00(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  if (a2) {
    *(void *)(a2 + 96) = 3;
  }
  return result;
}

void sub_3AE1C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_3AE58(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  if (a2) {
    *(void *)(a2 + 96) = 0;
  }
  return result;
}

void sub_3B1B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_3B1DC(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  if (a2) {
    *(void *)(a2 + 96) = 0;
  }
  return result;
}

uint64_t sub_3B748()
{
  return v0;
}

void sub_3B7AC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_3B9BC(uint64_t a1)
{
  if (a1)
  {
    HKSupportedMetricsForMachineType();
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v2 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v2)
    {
      id v3 = v2;
      uint64_t v4 = *(void *)v14;
      do
      {
        for (int i = 0; i != v3; int i = (char *)i + 1)
        {
          if (*(void *)v14 != v4) {
            objc_enumerationMutation(obj);
          }
          int v6 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v7 = +[HKObjectType objectTypeForWorkoutMetric:fitnessMachineType:](HKObjectType, "objectTypeForWorkoutMetric:fitnessMachineType:", [v6 unsignedIntegerValue], *(void *)(a1 + 8));
          if (v7)
          {
            id WeakRetained = objc_loadWeakRetained((id *)(a1 + 128));
            id v9 = [WeakRetained dataCollectionManager];
            uint64_t v10 = [v9 aggregatorForType:v7];

            [*(id *)(a1 + 16) setObject:v10 forKey:v6];
            id v11 = objc_alloc_init((Class)HKDataCollectorState);
            [v10 registerDataCollector:a1 state:v11];
          }
        }
        id v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v3);
    }
  }
}

void sub_3BCA4(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
  if (*(void *)(a1 + 40))
  {
    id v2 = *(id **)(a1 + 32);
    sub_3BCF8(v2);
  }
}

id *sub_3BCF8(id *result)
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v2 = result[9];
    id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v8;
      do
      {
        int v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v2);
          }
          sub_3C0C0(v1, *(void **)(*((void *)&v7 + 1) + 8 * (void)v6));
          int v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }

    return (id *)objc_msgSend(*(id *)(v1 + 72), "removeAllObjects", (void)v7);
  }
  return result;
}

void sub_3BE90(uint64_t a1)
{
}

uint64_t sub_3C048(uint64_t a1)
{
  return sub_3C054(*(void *)(a1 + 32), *(void **)(a1 + 40));
}

uint64_t sub_3C054(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    if (*(void *)(a1 + 56)) {
      sub_3C0C0(a1, v3);
    }
    else {
      [*(id *)(a1 + 72) addObject:v3];
    }
  }

  return _objc_release_x2();
}

void sub_3C0C0(uint64_t a1, void *a2)
{
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    if (!v4) {
      id v4 = *(void **)(a1 + 56);
    }
    id v12 = v4;
    id v5 = a2;
    int v6 = [v5 updateTime];
    uint64_t v7 = [v12 laterDate:v6];

    id v8 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v12 endDate:v7];
    long long v9 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = v7;

    long long v10 = [v5 generateDatums:v8];
    id v11 = [v5 updateTime];

    sub_3C294(a1, v10, v11);
  }
}

id sub_3C1C4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  id v8 = 0;
  if (a1 && v6)
  {
    long long v9 = *(void **)(a1 + 80);
    long long v10 = [v6 objectType];
    LODWORD(v9) = [v9 containsObject:v10];

    if (v9)
    {
      if (*(void *)(a1 + 144))
      {
        id v11 = [v5 dateInterval];
        id v12 = [v11 endDate];
        id v8 = objc_msgSend(v12, "hk_isBeforeOrEqualToDate:", *(void *)(a1 + 144));
      }
      else
      {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = &dword_0 + 1;
    }
  }

  return v8;
}

void sub_3C294(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (a1)
  {
    uint64_t v33 = v6;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v34 = v5;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v44;
      do
      {
        id v12 = 0;
        id v35 = v10;
        do
        {
          if (*(void *)v44 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v43 + 1) + 8 * (void)v12);
          long long v14 = [v8 objectForKeyedSubscript:v13];
          long long v15 = [*(id *)(a1 + 16) objectForKey:v13];
          if (sub_3C1C4(a1, v14, v15))
          {
            id v16 = v8;
            char v17 = [v15 objectType];
            unsigned int v18 = [*(id *)(a1 + 40) objectForKeyedSubscript:v13];
            id v19 = sub_3C670((id)a1, v17, v14, v18);

            if (v19)
            {
              __int16 v48 = v19;
              uint64_t v20 = +[NSArray arrayWithObjects:&v48 count:1];
              [v15 dataCollector:a1 didCollectSensorData:v20 device:*(void *)(a1 + 104)];
            }
            id v8 = v16;
            id v10 = v35;
          }
          [*(id *)(a1 + 40) setObject:v14 forKeyedSubscript:v13];

          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v10);
    }

    uint64_t v21 = sub_3CA38(a1, v8);
    if ([*(id *)(a1 + 136) count])
    {
      uint64_t v22 = *(void **)(a1 + 136);
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_3CBA0;
      v41[3] = &unk_61970;
      v41[4] = a1;
      id v42 = v21;
      [v22 notifyObservers:v41];
      uint64_t v23 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = 0;
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v24 = HKLogDataCollection;
      if (os_log_type_enabled(HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "Buffering metrics as a GymKit metrics observer is not yet ready", buf, 2u);
      }
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v25 = v21;
      id v26 = [v25 countByEnumeratingWithState:&v36 objects:v47 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v37;
        do
        {
          for (int i = 0; i != v27; int i = (char *)i + 1)
          {
            if (*(void *)v37 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void *)(*((void *)&v36 + 1) + 8 * i);
            id v31 = [v25 objectForKeyedSubscript:v30];
            [*(id *)(a1 + 88) setObject:v31 forKeyedSubscript:v30];
          }
          id v27 = [v25 countByEnumeratingWithState:&v36 objects:v47 count:16];
        }
        while (v27);
      }
    }
    uint64_t v7 = v33;
    id v5 = v34;
    if (*(void *)(a1 + 120))
    {
      uint64_t v32 = sub_3CBAC(a1, v8, v33);
      if (v32) {
        [*(id *)(a1 + 120) feedFitnessMachineData:v32];
      }
    }
  }
}

id sub_3C670(id a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    uint64_t v28 = 0;
    id v29 = (id *)&v28;
    uint64_t v30 = 0x3032000000;
    id v31 = sub_3CFBC;
    uint64_t v32 = sub_3CFCC;
    id v10 = v8;
    id v33 = v10;
    _HKInitializeLogging();
    uint64_t v11 = HKLogDataCollection;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v7 identifier];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2112;
      id v35 = v9;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Calculating datum for aggregator of type %@, currentDatum %@, previousDatum %@", buf, 0x20u);
    }
    if (![v7 aggregationStyle])
    {
      if (v9)
      {
        uint64_t v13 = +[NSUUID UUID];
        long long v14 = [v10 datumForChangeSince:v9 newIdentifier:v13 newResumeContext:0];

        if (v14) {
          objc_storeStrong(v29 + 5, v14);
        }
      }
      else
      {
        long long v15 = [v10 quantity];
        unsigned __int8 v16 = [v15 _isZero];

        if ((v16 & 1) == 0)
        {
          *(void *)buf = 0;
          *(void *)&uint8_t buf[8] = buf;
          *(void *)&uint8_t buf[16] = 0x3032000000;
          id v35 = sub_3CFBC;
          long long v36 = sub_3CFCC;
          id v37 = [v10 dateInterval];
          char v17 = *(void **)(*(void *)&buf[8] + 40);
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_3CFD4;
          v24[3] = &unk_61998;
          id v25 = v10;
          id v26 = buf;
          id v27 = &v28;
          sub_3D1E0((uint64_t)a1, v7, v17, v24);

          _Block_object_dispose(buf, 8);
        }
      }
    }
    unsigned int v18 = [v29[5] quantity];
    unsigned int v19 = [v18 _isZero];

    if (v19)
    {
      id v20 = v29[5];
      v29[5] = 0;
    }
    _HKInitializeLogging();
    uint64_t v21 = HKLogDataCollection;
    if (os_log_type_enabled(HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = v29[5];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v22;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "Datum for aggregator %@", buf, 0xCu);
    }
    a1 = v29[5];
    _Block_object_dispose(&v28, 8);
  }

  return a1;
}

void sub_3C9F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_3CA38(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    for (uint64_t i = 0; i != 13; ++i)
    {
      uint64_t v6 = qword_59D60[i];
      id v7 = +[NSNumber numberWithUnsignedInteger:v6];
      if (i == 6)
      {
        id v8 = &off_641E8;
      }
      else if (i == 7)
      {
        id v8 = &off_64200;
      }
      else
      {
        id v8 = +[NSNumber numberWithUnsignedInteger:v6];
      }
      id v9 = [v3 objectForKeyedSubscript:v8];
      uint64_t v10 = [v9 quantity];

      uint64_t v11 = [*(id *)(a1 + 48) objectForKeyedSubscript:v7];
      if (v10 && ([v10 isEqual:v11] & 1) == 0)
      {
        [v4 setObject:v10 forKeyedSubscript:v7];
        [*(id *)(a1 + 48) setObject:v10 forKeyedSubscript:v7];
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

id sub_3CBA0(uint64_t a1, void *a2)
{
  return [a2 metricsCollector:*(void *)(a1 + 32) didCollectMetrics:*(void *)(a1 + 40)];
}

id sub_3CBAC(uint64_t a1, void *a2, void *a3)
{
  if (a1)
  {
    id v5 = a3;
    id v6 = a2;
    id v7 = [objc_alloc((Class)CMFitnessMachineData) initWithTimestamp:v5];

    id v8 = [v6 objectForKeyedSubscript:&off_64218];
    [v7 elapsedTime];
    objc_msgSend(v7, "setElapsedTime:", sub_3DBAC(a1, v8, @"s", v9));

    uint64_t v10 = [v6 objectForKeyedSubscript:&off_64230];
    [v7 totalEnergy];
    objc_msgSend(v7, "setTotalEnergy:", sub_3DBAC(a1, v10, @"kcal", v11));

    uint64_t v12 = [v6 objectForKeyedSubscript:&off_64248];
    [v7 totalDistance];
    objc_msgSend(v7, "setTotalDistance:", sub_3DBAC(a1, v12, @"m", v13));

    uint64_t v14 = [v6 objectForKeyedSubscript:&off_64260];
    [v7 totalDistance];
    objc_msgSend(v7, "setTotalDistance:", sub_3DBAC(a1, v14, @"m", v15));

    uint64_t v16 = [v6 objectForKeyedSubscript:&off_64278];
    [v7 totalDistance];
    objc_msgSend(v7, "setTotalDistance:", sub_3DBAC(a1, v16, @"m", v17));

    unsigned int v18 = [v6 objectForKeyedSubscript:&off_64290];
    objc_msgSend(v7, "setTotalStrideCount:", sub_3DC50(a1, v18, @"count", (uint64_t)objc_msgSend(v7, "totalStrideCount")));

    unsigned int v19 = [v6 objectForKeyedSubscript:&off_642A8];
    objc_msgSend(v7, "setTotalStrideCount:", sub_3DC50(a1, v19, @"count", (uint64_t)objc_msgSend(v7, "totalStrideCount")));

    id v20 = [v6 objectForKeyedSubscript:&off_642C0];
    [v7 totalElevationAscended];
    objc_msgSend(v7, "setTotalElevationAscended:", sub_3DBAC(a1, v20, @"m", v21));

    id v22 = [v6 objectForKeyedSubscript:&off_642D8];
    objc_msgSend(v7, "setTotalFloorsClimbed:", sub_3DC50(a1, v22, @"count", (uint64_t)objc_msgSend(v7, "totalFloorsClimbed")));

    uint64_t v23 = [v6 objectForKeyedSubscript:&off_641E8];
    [v7 instantaneousSpeed];
    objc_msgSend(v7, "setInstantaneousSpeed:", sub_3DBAC(a1, v23, @"m/s", v24));

    id v25 = [v6 objectForKeyedSubscript:&off_642F0];
    [v7 instantaneousCadence];
    objc_msgSend(v7, "setInstantaneousCadence:", sub_3DBAC(a1, v25, @"count/min", v26));

    id v27 = [v6 objectForKeyedSubscript:&off_64308];
    [v7 instantaneousPower];
    objc_msgSend(v7, "setInstantaneousPower:", sub_3DBAC(a1, v27, @"W", v28));

    id v29 = [v6 objectForKeyedSubscript:&off_64320];
    [v7 inclination];
    objc_msgSend(v7, "setInclination:", sub_3DBAC(a1, v29, @"%", v30));

    id v31 = [v6 objectForKeyedSubscript:&off_64338];

    [v7 resistanceLevel];
    objc_msgSend(v7, "setResistanceLevel:", sub_3DBAC(a1, v31, @"count", v32));
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t sub_3CFBC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_3CFCC(uint64_t a1)
{
}

void sub_3CFD4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v32 = v5;
    id v6 = *(void **)(a1 + 32);
    id v7 = a2;
    id v8 = [v6 quantity];
    double v9 = [v8 _unit];

    uint64_t v10 = [*(id *)(a1 + 32) quantity];
    [v10 doubleValueForUnit:v9];
    double v12 = v11;
    [v7 doubleValueForUnit:v9];
    double v14 = v13;

    double v15 = v12 - v14;
    if (v15 <= 0.0)
    {
      uint64_t v31 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v23 = *(void **)(v31 + 40);
      *(void *)(v31 + 40) = 0;
    }
    else
    {
      if (v32)
      {
        uint64_t v16 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) endDate];
        id v17 = [v32 compare:v16];

        if (v17 == (id)-1)
        {
          id v18 = objc_alloc((Class)NSDateInterval);
          unsigned int v19 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) endDate];
          id v20 = [v18 initWithStartDate:v32 endDate:v19];
          uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
          id v22 = *(void **)(v21 + 40);
          *(void *)(v21 + 40) = v20;
        }
      }
      uint64_t v23 = +[HKQuantity quantityWithUnit:v9 doubleValue:v15];
      id v24 = objc_alloc((Class)HDQuantityDatum);
      id v25 = +[NSUUID UUID];
      uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      id v27 = [*(id *)(a1 + 32) resumeContext];
      id v28 = [v24 initWithIdentifier:v25 dateInterval:v26 resumeContext:v27 quantity:v23];
      uint64_t v29 = *(void *)(*(void *)(a1 + 48) + 8);
      double v30 = *(void **)(v29 + 40);
      *(void *)(v29 + 40) = v28;
    }
    id v5 = v32;
  }
}

void sub_3D1E0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  double v9 = a4;
  if (a1)
  {
    uint64_t v10 = [v7 canonicalUnit];
    double v11 = [v8 startDate];
    double v12 = [v8 endDate];
    double v13 = sub_3D538(a1, v11, v12, (uint64_t)v7);

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 128));
    double v15 = +[HDSampleEntity entityEnumeratorWithType:v7 profile:WeakRetained];

    [v15 setFilter:v13];
    [v15 setImproveJoinOrderingForStartDateIndexSelection:1];
    uint64_t v35 = 0;
    long long v36 = (double *)&v35;
    uint64_t v37 = 0x2020000000;
    uint64_t v38 = 0;
    uint64_t v29 = 0;
    double v30 = &v29;
    uint64_t v31 = 0x3032000000;
    id v32 = sub_3CFBC;
    id v33 = sub_3CFCC;
    id v34 = 0;
    id v28 = 0;
    uint64_t v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    uint64_t v23 = sub_3D6D0;
    id v24 = &unk_619C0;
    uint64_t v26 = &v35;
    id v16 = v10;
    id v25 = v16;
    id v27 = &v29;
    [v15 enumerateWithError:&v28 handler:&v21];
    id v17 = v28;
    if (v17)
    {
      _HKInitializeLogging();
      id v18 = HKLogDataCollection;
      if (os_log_type_enabled(HKLogDataCollection, OS_LOG_TYPE_ERROR)) {
        sub_41FB4((uint64_t)v7, v18);
      }
    }
    if (v36[3] <= 0.0)
    {
      unsigned int v19 = 0;
    }
    else
    {
      unsigned int v19 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v16, v21, v22, v23, v24);
    }
    _HKInitializeLogging();
    id v20 = HKLogDataCollection;
    if (os_log_type_enabled(HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v40 = v7;
      __int16 v41 = 2112;
      id v42 = v8;
      __int16 v43 = 2112;
      long long v44 = v19;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Fitness machine sum for type %@ for interval %@ is %@", buf, 0x20u);
    }
    v9[2](v9, v19, v30[5]);

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v35, 8);
  }
}

void sub_3D508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id sub_3D538(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  if (a1)
  {
    id v6 = a3;
    id v7 = a2;
    id v8 = +[NSSet setWithObject:a4];
    double v9 = +[_HKSampleComparisonFilter startDateFilterWithOperatorType:3 date:v7 dataTypes:v8];

    uint64_t v10 = +[_HKSampleComparisonFilter endDateFilterWithOperatorType:1 date:v6 dataTypes:v8];

    double v11 = +[HKSource _connectedGymSource];
    uint64_t v12 = +[_HKObjectComparisonFilter filterForKeyPath:HKPredicateKeyPathSource operatorType:4 value:v11 dataTypes:v8];

    v16[0] = v9;
    v16[1] = v10;
    v16[2] = v12;
    uint64_t v13 = +[NSArray arrayWithObjects:v16 count:3];
    uint64_t v14 = +[_HKCompoundFilter andFilterWithSubfilters:v13];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

uint64_t sub_3D6D0(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 quantity];
  [v4 doubleValueForUnit:a1[4]];
  *(double *)(*(void *)(a1[5] + 8) + 24) = v5 + *(double *)(*(void *)(a1[5] + 8) + 24);

  if (!*(void *)(*(void *)(a1[6] + 8) + 40)
    || ([v3 endDate],
        id v6 = objc_claimAutoreleasedReturnValue(),
        id v7 = (char *)[v6 compare:*(void *)(*(void *)(a1[6] + 8) + 40)],
        v6,
        v7 == (unsigned char *)&dword_0 + 1))
  {
    uint64_t v8 = [v3 endDate];
    uint64_t v9 = *(void *)(a1[6] + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  return 1;
}

void sub_3D838(uint64_t a1)
{
}

void sub_3D844(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

id sub_3D964(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 136) registerObserver:*(void *)(a1 + 40)];
}

void sub_3D970(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = *(NSObject **)(a1 + 24);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_3DA90;
    block[3] = &unk_60820;
    void block[4] = a1;
    dispatch_async(v1, block);
  }
}

id sub_3DA84(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 136) unregisterObserver:*(void *)(a1 + 40)];
}

void sub_3DA90(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 88);
  if ([v2 count])
  {
    _HKInitializeLogging();
    id v3 = HKLogDataCollection;
    if (os_log_type_enabled(HKLogDataCollection, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "A GymKit metrics observer is active. Delivering metrics.", buf, 2u);
    }
    uint64_t v4 = *(void *)(a1 + 32);
    double v5 = *(void **)(v4 + 136);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    _DWORD v8[2] = sub_3DBA0;
    v8[3] = &unk_61970;
    void v8[4] = v4;
    id v9 = v2;
    [v5 notifyObservers:v8];
  }
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = 0;
}

id sub_3DBA0(uint64_t a1, void *a2)
{
  return [a2 metricsCollector:*(void *)(a1 + 32) didCollectMetrics:*(void *)(a1 + 40)];
}

double sub_3DBAC(uint64_t a1, void *a2, void *a3, double a4)
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    if (v7)
    {
      id v9 = [v7 quantity];
      uint64_t v10 = +[HKUnit unitFromString:v8];
      [v9 doubleValueForUnit:v10];
      a4 = v11;
    }
  }
  else
  {
    a4 = 0.0;
  }

  return a4;
}

uint64_t sub_3DC50(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    if (v7)
    {
      id v9 = [v7 quantity];
      uint64_t v10 = +[HKUnit unitFromString:v8];
      [v9 doubleValueForUnit:v10];
      a4 = (uint64_t)(v11 + 0.00000011920929);
    }
  }
  else
  {
    a4 = 0;
  }

  return a4;
}

void sub_3DD98(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  id v3 = +[NSDate date];
  sub_3C294(v1, v2, v3);
}

id sub_3DFB8(id a1, double a2)
{
  id v2 = a1;
  if (a1)
  {
    unsigned int v4 = [a1 factor];
    signed __int8 v5 = [v2 fieldLength];
    int v6 = v5;
    uint64_t v7 = v5;
    id v8 = (char *)malloc_type_malloc(v5, 0xACF1C6D5uLL);
    id v9 = v8;
    if (v6 >= 1)
    {
      uint64_t v10 = 0;
      uint64_t v11 = (uint64_t)((double)v4 * a2);
      uint64x2_t v12 = (uint64x2_t)vdupq_n_s64((unint64_t)v7 - 1);
      int64x2_t v13 = (int64x2_t)xmmword_59DD0;
      int64x2_t v14 = vdupq_n_s64(2uLL);
      uint64_t v15 = v8 + 1;
      do
      {
        int32x2_t v16 = vmovn_s64((int64x2_t)vcgeq_u64(v12, (uint64x2_t)v13));
        if (v16.i8[0]) {
          *(v15 - 1) = v11 >> v10;
        }
        if (v16.i8[4]) {
          *uint64_t v15 = v11 >> (v10 + 8);
        }
        int64x2_t v13 = vaddq_s64(v13, v14);
        v10 += 16;
        v15 += 2;
      }
      while (((8 * v7 + 8) & 0xFF0) != v10);
    }
    id v2 = +[NSData dataWithBytes:v8 length:v7];
    free(v9);
  }

  return v2;
}

id *sub_3E9BC(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)HDFitnessMachineSession;
    signed __int8 v5 = (id *)objc_msgSendSuper2(&v7, "init");
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 2, a2);
      a1[4] = 0;
      a1[6] = 0;
      *((_OWORD *)a1 + 6) = xmmword_59DE0;
      *((_WORD *)a1 + 4) = 257;
      *(_WORD *)((char *)a1 + 11) = 257;
      *((unsigned char *)a1 + 13) = 1;
    }
  }

  return a1;
}

id sub_3F0DC(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  if (a1)
  {
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    id v11 = a2;
    id v12 = [objc_alloc((Class)NSMutableArray) initWithCapacity:4];
    char v38 = 1;
    __int16 v37 = 7170;
    int64x2_t v13 = +[NSData dataWithBytes:&v37 length:3];
    [v12 addObject:v13];
    char v36 = 35;
    char v35 = [v11 length] + 1;
    id v14 = objc_alloc_init((Class)NSMutableData);
    [v14 appendBytes:&v35 length:1];
    [v14 appendBytes:&v36 length:1];
    id v15 = v11;
    id v16 = [v15 bytes];
    id v17 = [v15 length];

    [v14 appendBytes:v16 length:v17];
    [v12 addObject:v14];
    char v34 = 34;
    char v33 = [v10 length] + 1;
    id v18 = objc_alloc_init((Class)NSMutableData);
    [v18 appendBytes:&v33 length:1];
    [v18 appendBytes:&v34 length:1];
    id v19 = v10;
    id v20 = [v19 bytes];
    id v21 = [v19 length];

    [v18 appendBytes:v20 length:v21];
    [v12 addObject:v18];
    char v32 = 9;
    char v31 = [v9 length] + 1;
    id v22 = objc_alloc_init((Class)NSMutableData);
    [v22 appendBytes:&v31 length:1];
    [v22 appendBytes:&v32 length:1];
    id v23 = v9;
    id v24 = [v23 bytes];
    id v25 = [v23 length];

    [v22 appendBytes:v24 length:v25];
    [v12 addObject:v22];
    __int16 v30 = 6920;
    uint64_t v26 = +[NSData dataWithBytes:&v30 length:2];
    id v27 = [v26 mutableCopy];

    [v27 appendData:v8];
    char v29 = 1;
    [v27 appendBytes:&v29 length:1];
    [v12 addObject:v27];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void sub_3F5BC(void *a1, void *a2, id *a3)
{
  signed __int8 v5 = a1;
  int v6 = [a2 identifier];
  objc_super v7 = [v6 UUIDString];
  id v8 = [*a3 identifier];
  id v9 = [v8 UUIDString];
  int v10 = 138412546;
  id v11 = v7;
  __int16 v12 = 2112;
  int64x2_t v13 = v9;
  _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "Cannot update peripheral because identifier %@ does not match %@", (uint8_t *)&v10, 0x16u);
}

void sub_3F6B8(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138412546;
  *(void *)&void v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *a2;
  sub_80FC(&dword_0, (uint64_t)a2, a3, "Discovering services %@ on peripheral %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_3F734(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)a2 + 16);
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "No writable characteristic %@ discovered for %@", (uint8_t *)&v5, 0x16u);
}

void sub_3F7C8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&void v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_80FC(&dword_0, a2, a3, "|>- peripheral:didModifyServices: %@, %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_3F840()
{
  sub_811C();
  sub_80FC(&dword_0, v0, v1, "|>- didReadRSSI: %@, error: %{public}@");
}

void sub_3F8AC(void *a1, void *a2, uint64_t a3)
{
  int v5 = a1;
  uint64_t v6 = [a2 services];
  sub_811C();
  uint64_t v8 = a3;
  _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "|>- Peripheral services: %@, error: %{public}@", v7, 0x16u);
}

void sub_3F960(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "|>- Device Name Characteristic: %@", (uint8_t *)&v2, 0xCu);
}

void sub_3F9D8(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 136315394;
  uint64_t v4 = "-[HDHealthPeripheral peripheral:didWriteValueForCharacteristic:error:]_block_invoke";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "%s: No health service found for serviceUUID: %@", (uint8_t *)&v3, 0x16u);
}

void sub_3FA68(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to track successful begin experience: timer does not exist.", v1, 2u);
}

void sub_3FAAC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed writing eurotas data: %@", (uint8_t *)&v2, 0xCu);
}

void sub_3FB24(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve heart rate pairings to begin BTLE HR monitoring: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_3FBAC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_3FBE4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_3FC1C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Heart rate: %@", (uint8_t *)&v2, 0xCu);
}

void sub_3FC94(void *a1)
{
  id v1 = a1;
  int v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  sub_D4BC();
  sub_D4D4(&dword_0, v4, v5, "%{public}@ insufficient data (%lu bytes) for battery level.", v6, v7, v8, v9, v10);
}

void sub_3FD38(void *a1)
{
  id v1 = a1;
  int v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  sub_D4BC();
  sub_D4D4(&dword_0, v4, v5, "%{public}@ insufficient data (%lu bytes) for battery level percent.", v6, v7, v8, v9, v10);
}

void sub_3FDDC()
{
  sub_118AC();
  sub_11874(&dword_0, v0, v1, "%{public}@: Error releasing express mode assertion %@");
}

void sub_3FE44()
{
  sub_118AC();
  sub_11874(&dword_0, v0, v1, "%{public}@: Error taking express mode assertion %@");
}

void sub_3FEAC()
{
  sub_11894();
  sub_11874(&dword_0, v0, v1, "%{public}@: startFieldDetectSession error: %{public}@");
}

void sub_3FF18(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_3FF84()
{
  sub_11894();
  sub_11874(&dword_0, v0, v1, "%{public}@: Error encountered when starting NdefTagSession. Error: %{public}@");
}

void sub_3FFF0(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "%{public}@: Beginning scanning due to NFC event", (uint8_t *)&v2, 0xCu);
}

void sub_40068(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "%{public}@: NDefTagSession ended unexpectedly", (uint8_t *)&v2, 0xCu);
}

void sub_400E0()
{
  sub_11894();
  sub_11874(&dword_0, v0, v1, "%{public}@: Ignoring tap simulation with error: %{public}@");
}

void sub_4014C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_401BC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_4026C(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 136315394;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Notification registration for '%s' failed with status %d", (uint8_t *)&v3, 0x12u);
}

void sub_402F4(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Error reading activity mode %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_4036C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to count workouts from a watch: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_403E4(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 UUID];
  int v5 = 138412290;
  int v6 = v4;
  _os_log_debug_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "No characteristic class found for characteristic UUID: %@", (uint8_t *)&v5, 0xCu);
}

void sub_4048C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Incorrect advertisement data for Fitness Machine Service %@", (uint8_t *)&v2, 0xCu);
}

void sub_40504(uint64_t a1, void *a2)
{
  int v2 = *(const char **)(a1 + 64);
  id v3 = a2;
  uint64_t v4 = NSStringFromSelector(v2);
  sub_18498(&dword_0, v5, v6, "*** %{public}@, null completion.", v7, v8, v9, v10, 2u);
}

void sub_4059C(uint64_t a1, void *a2)
{
  int v2 = *(const char **)(a1 + 64);
  id v3 = a2;
  uint64_t v4 = NSStringFromSelector(v2);
  sub_18498(&dword_0, v5, v6, "*** %{public}@, Missing a valid health device.", v7, v8, v9, v10, 2u);
}

void sub_40634(void *a1, const char *a2, int a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = NSStringFromSelector(a2);
  int v7 = 138412546;
  uint64_t v8 = v6;
  __int16 v9 = 1024;
  int v10 = a3;
  _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "*** %@, Missing server session ID for client ID #%d", (uint8_t *)&v7, 0x12u);
}

void sub_407D8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Bad oob data: %@", (uint8_t *)&v2, 0xCu);
}

void sub_40850(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = [a2 sampleType];
  int v7 = [a2 endDate];
  uint64_t v8 = [a2 _source];
  int v9 = 138544130;
  int v10 = v6;
  __int16 v11 = 2114;
  __int16 v12 = v7;
  __int16 v13 = 2114;
  id v14 = v8;
  __int16 v15 = 2114;
  uint64_t v16 = a3;
  _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "Sample for type %{public}@, end date %{public}@ and source %{public}@ ignored - Not from correct source. Machine preferred until %{public}@", (uint8_t *)&v9, 0x2Au);
}

void sub_40950(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 sampleType];
  uint64_t v5 = [a2 _source];
  int v6 = 138543618;
  int v7 = v4;
  __int16 v8 = 2114;
  int v9 = v5;
  _os_log_debug_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "Sample for type %{public}@ and source %{public}@ ignored - Not from correct source", (uint8_t *)&v6, 0x16u);
}

void sub_40A20(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Sample from local source ignored - Not connected to fitness machine", v1, 2u);
}

void sub_40A64(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 _source];
  int v5 = 138543362;
  int v6 = v4;
  _os_log_debug_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "Sample for source %{public}@ ignored - Not local device source or fitness machine source", (uint8_t *)&v5, 0xCu);
}

void sub_40B0C()
{
  sub_20818();
  sub_11874(&dword_0, v0, v1, "%{public}@: Failed to unarchive recovery state with error: %{public}@");
}

void sub_40B74(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve recovery configuration for current fitness machine session", (uint8_t *)&v3, 0xCu);
}

void sub_40BF0()
{
  sub_20818();
  sub_11874(&dword_0, v0, v1, "%{public}@: Failed to unarchive persisted recovery configuration: %{public}@");
}

void sub_40C58()
{
  sub_20818();
  sub_11874(&dword_0, v0, v1, "%{public}@: Failed to store recovery state with error: %{public}@");
}

void sub_40CC0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Error handling heart rate measurement: %@", (uint8_t *)&v2, 0xCu);
}

void sub_40D38(void *a1)
{
  os_log_t v1 = a1;
  v2[0] = 67109120;
  v2[1] = [(id)objc_opt_class() serviceType];
  _os_log_debug_impl(&dword_0, v1, OS_LOG_TYPE_DEBUG, "Type %d data of zero not saved.", (uint8_t *)v2, 8u);
}

void sub_40DD8(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Heart rate data not saved, no sensor contact.", v1, 2u);
}

void sub_40E1C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Error handling heart rate body location: %@", (uint8_t *)&v2, 0xCu);
}

void sub_40E94(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a1;
  v5[0] = 67109376;
  v5[1] = [(id)objc_opt_class() serviceType];
  __int16 v6 = 1024;
  unsigned int v7 = [a3 sensorLocation];
  _os_log_debug_impl(&dword_0, v4, OS_LOG_TYPE_DEBUG, "Type %d preferred location: %d", (uint8_t *)v5, 0xEu);
}

void sub_40F58(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "*** performOperation, unsupported operation %@", (uint8_t *)&v2, 0xCu);
}

void sub_41008(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "MFA authentication failed: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_41080(void *a1)
{
  os_log_t v1 = a1;
  int v2 = _HKStringForFitnessMachineType();
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_0, v1, OS_LOG_TYPE_ERROR, "Characteristic is unimplemented for machine type %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_41128()
{
  sub_2969C();
  sub_CDCC(&dword_0, v0, v1, "Machine has been paused for too long. Disconnecting.", v2, v3, v4, v5, v6);
}

void sub_4115C()
{
  sub_2969C();
  sub_CDCC(&dword_0, v0, v1, "Machine has been connected for too long without receiving a start event. Disconnecting.", v2, v3, v4, v5, v6);
}

void sub_41190()
{
  sub_2969C();
  sub_CDCC(&dword_0, v0, v1, "Failed to successfully disconnect from bluetooth within the allotted time", v2, v3, v4, v5, v6);
}

void sub_411C4()
{
  sub_2969C();
  sub_CDCC(&dword_0, v0, v1, "Failed to successfully connect within the allotted time. Cleaning up.", v2, v3, v4, v5, v6);
}

void sub_411F8()
{
  sub_2969C();
  sub_CDCC(&dword_0, v0, v1, "(#w0) Failed to complete MFA within allotted time. Cleaning up.", v2, v3, v4, v5, v6);
}

void sub_4122C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[HDFitnessMachineManager pairingManagerWillBeginPairing:fitnessMachineToken:]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
}

void sub_412B0(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "(#w0) Pairing Failed: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_41328(char a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "NFC Enabled State Change %{BOOL}d", (uint8_t *)v2, 8u);
}

void sub_413A4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@: Couldn't notify GymKit metrics data source client of collected metrics with error: %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_41430(unsigned __int8 a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Disabled value was sent for a non-heart rate type: %d", (uint8_t *)v2, 8u);
}

void sub_414AC(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Not delivering data because deliverData is false", v1, 2u);
}

void sub_414F0(uint64_t a1, void *a2, uint64_t a3)
{
  int v4 = (id *)(a1 + 72);
  uint64_t v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  int v7 = 138412546;
  id v8 = WeakRetained;
  __int16 v9 = 2112;
  uint64_t v10 = a3;
  _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "Notifying service manager %@ with characteristic %@", (uint8_t *)&v7, 0x16u);
}

void sub_415AC()
{
  sub_118AC();
  sub_80FC(&dword_0, v0, v1, "|>- performOperation %@ with parameters %@");
}

void sub_41614(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Characteristic has no writable properties and will not be marked writable. No data will be written to this characteristic: %@", (uint8_t *)&v3, 0xCu);
}

void sub_41690(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "|>- readProperty: %@", (uint8_t *)&v2, 0xCu);
}

void sub_41708()
{
  sub_118AC();
  sub_80FC(&dword_0, v0, v1, "|>- peripheral:didWriteValueForCharacteristic: %@, %@");
}

void sub_41770(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "HDFitnessMachineStatus ignoring fitness machine status op code 0x%02x, returning unknown status.", (uint8_t *)v2, 8u);
}

void sub_417E8(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Unknown stop or pause procedure 0x%02x, returning unknown status.", (uint8_t *)v2, 8u);
}

void sub_41860(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Notification registration failed with status %d", (uint8_t *)v2, 8u);
}

void sub_418D8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_41910(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "*** discoverHealthServicesWithType, Invalid health service type %ld", (uint8_t *)&v2, 0xCu);
}

void sub_41988(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_419C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_419F8(void *a1, void *a2)
{
  id v3 = a1;
  __int16 v9 = [a2 name];
  sub_3B754();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0xCu);
}

void sub_41A98(void *a1, void *a2)
{
  id v3 = a1;
  [a2 type];
  uint64_t v4 = [a2 name];
  sub_3B794();
  sub_3B754();
  _os_log_error_impl(v5, v6, v7, v8, v9, 0x12u);
}

void sub_41B48(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_3B748() name];
  sub_3B77C();
  sub_D4D4(&dword_0, v4, v5, "*** Blocking connection to unauthorized device (%@) error: %@", v6, v7, v8, v9, v10);
}

void sub_41BE4(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_3B748() identifier];
  sub_3B77C();
  sub_D4D4(&dword_0, v4, v5, "*** connectHealthService, multiple peripherals for identifier %@, %@", v6, v7, v8, v9, v10);
}

void sub_41C80(void *a1, void *a2)
{
  id v3 = a1;
  [a2 type];
  uint64_t v4 = [(id)sub_3B748() name];
  sub_3B794();
  _os_log_error_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "*** Unsupported service type (%d) for peripheral %@.", v5, 0x12u);
}

void sub_41D3C(uint64_t a1, void **a2, void *a3)
{
  id v3 = *a2;
  id v4 = a3;
  uint8_t v10 = [v3 advertisementData];
  sub_3B754();
  _os_log_error_impl(v5, v6, v7, v8, v9, 0x16u);
}

void sub_41DFC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (const char *)sub_3B748();
  uint64_t v5 = NSStringFromSelector(v4);
  sub_3B764();
  sub_3B7AC(&dword_0, v6, v7, "*** %@, Peripheral not found for %d", v8, v9, v10, v11, v12);
}

void sub_41E9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (const char *)sub_3B748();
  uint64_t v5 = NSStringFromSelector(v4);
  sub_3B764();
  sub_3B7AC(&dword_0, v6, v7, "*** %@, Connection info not found for %d", v8, v9, v10, v11, v12);
}

void sub_41F3C(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unexpected pairing type: %ld", (uint8_t *)&v2, 0xCu);
}

void sub_41FB4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Error calculating fitness machine sum for type %@", (uint8_t *)&v2, 0xCu);
}

void sub_420C0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Characteristic does not support write-without-response for the Eurotas service. Eurotas data will not be written to this characteristic: %@", (uint8_t *)&v2, 0xCu);
}

void sub_42138(void *a1, void *a2)
{
  uint64_t v3 = a1;
  id v4 = [a2 UUID];
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "No characteristic class found for characteristic UUID: %{public}@", (uint8_t *)&v5, 0xCu);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

uint64_t HDDataEntityPredicateForObjectsFromAppleWatchSources()
{
  return _HDDataEntityPredicateForObjectsFromAppleWatchSources();
}

uint64_t HDPowerLogForClient()
{
  return _HDPowerLogForClient();
}

uint64_t HDSetHealthInUseDefaultWithReason()
{
  return _HDSetHealthInUseDefaultWithReason();
}

uint64_t HKActivityMoveModeToString()
{
  return _HKActivityMoveModeToString();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return _HKCreateSerialDispatchQueue();
}

uint64_t HKCreateSerialDispatchQueueWithQOSClass()
{
  return _HKCreateSerialDispatchQueueWithQOSClass();
}

uint64_t HKDispatchAsyncOnGlobalConcurrentQueue()
{
  return _HKDispatchAsyncOnGlobalConcurrentQueue();
}

uint64_t HKSessionTrackerAriadneTrigger()
{
  return _HKSessionTrackerAriadneTrigger();
}

uint64_t HKSupportedMetricsForMachineType()
{
  return _HKSupportedMetricsForMachineType();
}

NSArray *__cdecl NSAllMapTableValues(NSMapTable *table)
{
  return _NSAllMapTableValues(table);
}

NSMapTable *__cdecl NSCreateMapTable(NSMapTableKeyCallBacks *keyCallBacks, NSMapTableValueCallBacks *valueCallBacks, NSUInteger capacity)
{
  return _NSCreateMapTable(keyCallBacks, valueCallBacks, capacity);
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return _NSMapGet(table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
}

void NSMapRemove(NSMapTable *table, const void *key)
{
}

uint64_t NSRequestConcreteImplementation()
{
  return _NSRequestConcreteImplementation();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return _SecRandomCopyBytes(rnd, count, bytes);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HKInitializeLogging()
{
  return __HKInitializeLogging();
}

uint64_t _HKLogDroppedError()
{
  return __HKLogDroppedError();
}

uint64_t _HKStringForFitnessMachineConnectionState()
{
  return __HKStringForFitnessMachineConnectionState();
}

uint64_t _HKStringForFitnessMachineState()
{
  return __HKStringForFitnessMachineState();
}

uint64_t _HKStringForFitnessMachineType()
{
  return __HKStringForFitnessMachineType();
}

uint64_t _HKStringForHealthServiceStatus()
{
  return __HKStringForHealthServiceStatus();
}

uint64_t _HKWorkoutActivityNameForActivityType()
{
  return __HKWorkoutActivityNameForActivityType();
}

uint64_t _HKWorkoutFlooredValueForQuantity()
{
  return __HKWorkoutFlooredValueForQuantity();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

double __exp10(double a1)
{
  return ___exp10(a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int strcasecmp(const char *a1, const char *a2)
{
  return _strcasecmp(a1, a2);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__connectedGymSource(void *a1, const char *a2, ...)
{
  return [a1 _connectedGymSource];
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return [a1 _init];
}

id objc_msgSend__isAppleWatch(void *a1, const char *a2, ...)
{
  return [a1 _isAppleWatch];
}

id objc_msgSend__isConnectedGymSource(void *a1, const char *a2, ...)
{
  return [a1 _isConnectedGymSource];
}

id objc_msgSend__isLocalDevice(void *a1, const char *a2, ...)
{
  return [a1 _isLocalDevice];
}

id objc_msgSend__isZero(void *a1, const char *a2, ...)
{
  return [a1 _isZero];
}

id objc_msgSend__newNearFieldInterface(void *a1, const char *a2, ...)
{
  return [a1 _newNearFieldInterface];
}

id objc_msgSend__newWatchAppStateMonitor(void *a1, const char *a2, ...)
{
  return [a1 _newWatchAppStateMonitor];
}

id objc_msgSend__setNFCAlwaysOnPreferenceIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _setNFCAlwaysOnPreferenceIfNecessary];
}

id objc_msgSend__source(void *a1, const char *a2, ...)
{
  return [a1 _source];
}

id objc_msgSend__startObservingMetrics(void *a1, const char *a2, ...)
{
  return [a1 _startObservingMetrics];
}

id objc_msgSend__unit(void *a1, const char *a2, ...)
{
  return [a1 _unit];
}

id objc_msgSend_activeDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return [a1 activeDeviceSelectorBlock];
}

id objc_msgSend_activeEnergy(void *a1, const char *a2, ...)
{
  return [a1 activeEnergy];
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return [a1 activityType];
}

id objc_msgSend_advertisementData(void *a1, const char *a2, ...)
{
  return [a1 advertisementData];
}

id objc_msgSend_advertisingAddress(void *a1, const char *a2, ...)
{
  return [a1 advertisingAddress];
}

id objc_msgSend_aggregationStyle(void *a1, const char *a2, ...)
{
  return [a1 aggregationStyle];
}

id objc_msgSend_allFields(void *a1, const char *a2, ...)
{
  return [a1 allFields];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_analyticsSubmissionCoordinator(void *a1, const char *a2, ...)
{
  return [a1 analyticsSubmissionCoordinator];
}

id objc_msgSend_appIsActive(void *a1, const char *a2, ...)
{
  return [a1 appIsActive];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attached(void *a1, const char *a2, ...)
{
  return [a1 attached];
}

id objc_msgSend_averageCadence(void *a1, const char *a2, ...)
{
  return [a1 averageCadence];
}

id objc_msgSend_averageCadenceIsSet(void *a1, const char *a2, ...)
{
  return [a1 averageCadenceIsSet];
}

id objc_msgSend_averageHeartRate(void *a1, const char *a2, ...)
{
  return [a1 averageHeartRate];
}

id objc_msgSend_averagePace(void *a1, const char *a2, ...)
{
  return [a1 averagePace];
}

id objc_msgSend_averagePaceIsSet(void *a1, const char *a2, ...)
{
  return [a1 averagePaceIsSet];
}

id objc_msgSend_averagePower(void *a1, const char *a2, ...)
{
  return [a1 averagePower];
}

id objc_msgSend_averagePowerIsSet(void *a1, const char *a2, ...)
{
  return [a1 averagePowerIsSet];
}

id objc_msgSend_averageQuantity(void *a1, const char *a2, ...)
{
  return [a1 averageQuantity];
}

id objc_msgSend_averageSpeed(void *a1, const char *a2, ...)
{
  return [a1 averageSpeed];
}

id objc_msgSend_averageSpeedIsSet(void *a1, const char *a2, ...)
{
  return [a1 averageSpeedIsSet];
}

id objc_msgSend_beginDisconnectTimeout(void *a1, const char *a2, ...)
{
  return [a1 beginDisconnectTimeout];
}

id objc_msgSend_beginFieldDetectTimeout(void *a1, const char *a2, ...)
{
  return [a1 beginFieldDetectTimeout];
}

id objc_msgSend_beginMfaTimeout(void *a1, const char *a2, ...)
{
  return [a1 beginMfaTimeout];
}

id objc_msgSend_beginPauseTimeout(void *a1, const char *a2, ...)
{
  return [a1 beginPauseTimeout];
}

id objc_msgSend_beginRetryConnectionTimeout(void *a1, const char *a2, ...)
{
  return [a1 beginRetryConnectionTimeout];
}

id objc_msgSend_beginTagReadTimeout(void *a1, const char *a2, ...)
{
  return [a1 beginTagReadTimeout];
}

id objc_msgSend_beginWaitForMachineStartTimeout(void *a1, const char *a2, ...)
{
  return [a1 beginWaitForMachineStartTimeout];
}

id objc_msgSend_behavior(void *a1, const char *a2, ...)
{
  return [a1 behavior];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_brand(void *a1, const char *a2, ...)
{
  return [a1 brand];
}

id objc_msgSend_btAddress(void *a1, const char *a2, ...)
{
  return [a1 btAddress];
}

id objc_msgSend_btIdentifierData(void *a1, const char *a2, ...)
{
  return [a1 btIdentifierData];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancelAllTimers(void *a1, const char *a2, ...)
{
  return [a1 cancelAllTimers];
}

id objc_msgSend_cancelDisconnectTimeout(void *a1, const char *a2, ...)
{
  return [a1 cancelDisconnectTimeout];
}

id objc_msgSend_cancelFieldDetectTimeout(void *a1, const char *a2, ...)
{
  return [a1 cancelFieldDetectTimeout];
}

id objc_msgSend_cancelMachineIdentityVerificationTimeout(void *a1, const char *a2, ...)
{
  return [a1 cancelMachineIdentityVerificationTimeout];
}

id objc_msgSend_cancelMfaTimeout(void *a1, const char *a2, ...)
{
  return [a1 cancelMfaTimeout];
}

id objc_msgSend_cancelPauseTimeout(void *a1, const char *a2, ...)
{
  return [a1 cancelPauseTimeout];
}

id objc_msgSend_cancelRetryConnectionTimeout(void *a1, const char *a2, ...)
{
  return [a1 cancelRetryConnectionTimeout];
}

id objc_msgSend_cancelTagReadTimeout(void *a1, const char *a2, ...)
{
  return [a1 cancelTagReadTimeout];
}

id objc_msgSend_cancelUserAcceptanceTimeout(void *a1, const char *a2, ...)
{
  return [a1 cancelUserAcceptanceTimeout];
}

id objc_msgSend_cancelWaitForMachineStartTimeout(void *a1, const char *a2, ...)
{
  return [a1 cancelWaitForMachineStartTimeout];
}

id objc_msgSend_canonicalUnit(void *a1, const char *a2, ...)
{
  return [a1 canonicalUnit];
}

id objc_msgSend_cbPeripheral(void *a1, const char *a2, ...)
{
  return [a1 cbPeripheral];
}

id objc_msgSend_characteristic(void *a1, const char *a2, ...)
{
  return [a1 characteristic];
}

id objc_msgSend_characteristics(void *a1, const char *a2, ...)
{
  return [a1 characteristics];
}

id objc_msgSend_characteristicsDiscovered(void *a1, const char *a2, ...)
{
  return [a1 characteristicsDiscovered];
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return [a1 client];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_collectionType(void *a1, const char *a2, ...)
{
  return [a1 collectionType];
}

id objc_msgSend_confirmationValue(void *a1, const char *a2, ...)
{
  return [a1 confirmationValue];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_connectionInitiatorServer(void *a1, const char *a2, ...)
{
  return [a1 connectionInitiatorServer];
}

id objc_msgSend_connectionState(void *a1, const char *a2, ...)
{
  return [a1 connectionState];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_correspondingFlagBit(void *a1, const char *a2, ...)
{
  return [a1 correspondingFlagBit];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentSessionRecoveryConfiguration(void *a1, const char *a2, ...)
{
  return [a1 currentSessionRecoveryConfiguration];
}

id objc_msgSend_currentWorkoutSessionServer(void *a1, const char *a2, ...)
{
  return [a1 currentWorkoutSessionServer];
}

id objc_msgSend_daemon(void *a1, const char *a2, ...)
{
  return [a1 daemon];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataCollectionManager(void *a1, const char *a2, ...)
{
  return [a1 dataCollectionManager];
}

id objc_msgSend_dataManager(void *a1, const char *a2, ...)
{
  return [a1 dataManager];
}

id objc_msgSend_dataTransferPermitted(void *a1, const char *a2, ...)
{
  return [a1 dataTransferPermitted];
}

id objc_msgSend_dataTransferRequirementsComplete(void *a1, const char *a2, ...)
{
  return [a1 dataTransferRequirementsComplete];
}

id objc_msgSend_database(void *a1, const char *a2, ...)
{
  return [a1 database];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dateInterval(void *a1, const char *a2, ...)
{
  return [a1 dateInterval];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deliverData(void *a1, const char *a2, ...)
{
  return [a1 deliverData];
}

id objc_msgSend_derivedContactStatus(void *a1, const char *a2, ...)
{
  return [a1 derivedContactStatus];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_detachHealthServiceSession(void *a1, const char *a2, ...)
{
  return [a1 detachHealthServiceSession];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceDisconnecting(void *a1, const char *a2, ...)
{
  return [a1 deviceDisconnecting];
}

id objc_msgSend_deviceInformation(void *a1, const char *a2, ...)
{
  return [a1 deviceInformation];
}

id objc_msgSend_deviceInformationSetOnPeripheral(void *a1, const char *a2, ...)
{
  return [a1 deviceInformationSetOnPeripheral];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disconnectServices(void *a1, const char *a2, ...)
{
  return [a1 disconnectServices];
}

id objc_msgSend_discoverServices(void *a1, const char *a2, ...)
{
  return [a1 discoverServices];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_elapsedSeconds(void *a1, const char *a2, ...)
{
  return [a1 elapsedSeconds];
}

id objc_msgSend_elapsedTime(void *a1, const char *a2, ...)
{
  return [a1 elapsedTime];
}

id objc_msgSend_elapsedTimeIsSet(void *a1, const char *a2, ...)
{
  return [a1 elapsedTimeIsSet];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_endFieldDetectSession(void *a1, const char *a2, ...)
{
  return [a1 endFieldDetectSession];
}

id objc_msgSend_endHeartRateRecovery(void *a1, const char *a2, ...)
{
  return [a1 endHeartRateRecovery];
}

id objc_msgSend_endNdefTagSession(void *a1, const char *a2, ...)
{
  return [a1 endNdefTagSession];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return [a1 eventType];
}

id objc_msgSend_factor(void *a1, const char *a2, ...)
{
  return [a1 factor];
}

id objc_msgSend_features(void *a1, const char *a2, ...)
{
  return [a1 features];
}

id objc_msgSend_fetchLimitedCharacteristics(void *a1, const char *a2, ...)
{
  return [a1 fetchLimitedCharacteristics];
}

id objc_msgSend_fieldLength(void *a1, const char *a2, ...)
{
  return [a1 fieldLength];
}

id objc_msgSend_finish(void *a1, const char *a2, ...)
{
  return [a1 finish];
}

id objc_msgSend_firmwareRevision(void *a1, const char *a2, ...)
{
  return [a1 firmwareRevision];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fitnessMachine(void *a1, const char *a2, ...)
{
  return [a1 fitnessMachine];
}

id objc_msgSend_fitnessMachineDataProducer(void *a1, const char *a2, ...)
{
  return [a1 fitnessMachineDataProducer];
}

id objc_msgSend_fitnessMachineManager(void *a1, const char *a2, ...)
{
  return [a1 fitnessMachineManager];
}

id objc_msgSend_fitnessMachineSessionUUID(void *a1, const char *a2, ...)
{
  return [a1 fitnessMachineSessionUUID];
}

id objc_msgSend_fitnessMachineType(void *a1, const char *a2, ...)
{
  return [a1 fitnessMachineType];
}

id objc_msgSend_fitnessTrackingEnabled(void *a1, const char *a2, ...)
{
  return [a1 fitnessTrackingEnabled];
}

id objc_msgSend_flagFieldFlipped(void *a1, const char *a2, ...)
{
  return [a1 flagFieldFlipped];
}

id objc_msgSend_flagFieldLength(void *a1, const char *a2, ...)
{
  return [a1 flagFieldLength];
}

id objc_msgSend_floors(void *a1, const char *a2, ...)
{
  return [a1 floors];
}

id objc_msgSend_floorsIsSet(void *a1, const char *a2, ...)
{
  return [a1 floorsIsSet];
}

id objc_msgSend_hardwareRevision(void *a1, const char *a2, ...)
{
  return [a1 hardwareRevision];
}

id objc_msgSend_hasActiveEnergy(void *a1, const char *a2, ...)
{
  return [a1 hasActiveEnergy];
}

id objc_msgSend_hasAverageHeartRate(void *a1, const char *a2, ...)
{
  return [a1 hasAverageHeartRate];
}

id objc_msgSend_hasEnergyExpended(void *a1, const char *a2, ...)
{
  return [a1 hasEnergyExpended];
}

id objc_msgSend_hasHeartRate(void *a1, const char *a2, ...)
{
  return [a1 hasHeartRate];
}

id objc_msgSend_hasSensorContact(void *a1, const char *a2, ...)
{
  return [a1 hasSensorContact];
}

id objc_msgSend_hasTotalEnergy(void *a1, const char *a2, ...)
{
  return [a1 hasTotalEnergy];
}

id objc_msgSend_healthPeripheral(void *a1, const char *a2, ...)
{
  return [a1 healthPeripheral];
}

id objc_msgSend_healthService(void *a1, const char *a2, ...)
{
  return [a1 healthService];
}

id objc_msgSend_healthServiceSessionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 healthServiceSessionIdentifier];
}

id objc_msgSend_heartRate(void *a1, const char *a2, ...)
{
  return [a1 heartRate];
}

id objc_msgSend_heartRateValue(void *a1, const char *a2, ...)
{
  return [a1 heartRateValue];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_implementedProperties(void *a1, const char *a2, ...)
{
  return [a1 implementedProperties];
}

id objc_msgSend_inclination(void *a1, const char *a2, ...)
{
  return [a1 inclination];
}

id objc_msgSend_inclinationIsSet(void *a1, const char *a2, ...)
{
  return [a1 inclinationIsSet];
}

id objc_msgSend_initForWriting(void *a1, const char *a2, ...)
{
  return [a1 initForWriting];
}

id objc_msgSend_initialEnhancedFTMSData(void *a1, const char *a2, ...)
{
  return [a1 initialEnhancedFTMSData];
}

id objc_msgSend_initialMachineData(void *a1, const char *a2, ...)
{
  return [a1 initialMachineData];
}

id objc_msgSend_initialMachineStatus(void *a1, const char *a2, ...)
{
  return [a1 initialMachineStatus];
}

id objc_msgSend_instantaneousCadence(void *a1, const char *a2, ...)
{
  return [a1 instantaneousCadence];
}

id objc_msgSend_instantaneousCadenceIsSet(void *a1, const char *a2, ...)
{
  return [a1 instantaneousCadenceIsSet];
}

id objc_msgSend_instantaneousPace(void *a1, const char *a2, ...)
{
  return [a1 instantaneousPace];
}

id objc_msgSend_instantaneousPaceIsSet(void *a1, const char *a2, ...)
{
  return [a1 instantaneousPaceIsSet];
}

id objc_msgSend_instantaneousPower(void *a1, const char *a2, ...)
{
  return [a1 instantaneousPower];
}

id objc_msgSend_instantaneousPowerIsSet(void *a1, const char *a2, ...)
{
  return [a1 instantaneousPowerIsSet];
}

id objc_msgSend_instantaneousSpeed(void *a1, const char *a2, ...)
{
  return [a1 instantaneousSpeed];
}

id objc_msgSend_instantaneousSpeedIsSet(void *a1, const char *a2, ...)
{
  return [a1 instantaneousSpeedIsSet];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isAppleInternalInstall(void *a1, const char *a2, ...)
{
  return [a1 isAppleInternalInstall];
}

id objc_msgSend_isAppleWatch(void *a1, const char *a2, ...)
{
  return [a1 isAppleWatch];
}

id objc_msgSend_isAvailable(void *a1, const char *a2, ...)
{
  return [a1 isAvailable];
}

id objc_msgSend_isDisconnectTimerValid(void *a1, const char *a2, ...)
{
  return [a1 isDisconnectTimerValid];
}

id objc_msgSend_isFieldDetectSessionInProgress(void *a1, const char *a2, ...)
{
  return [a1 isFieldDetectSessionInProgress];
}

id objc_msgSend_isFirstParty(void *a1, const char *a2, ...)
{
  return [a1 isFirstParty];
}

id objc_msgSend_isLowPowerModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 isLowPowerModeEnabled];
}

id objc_msgSend_isNdefTagSessionInProgress(void *a1, const char *a2, ...)
{
  return [a1 isNdefTagSessionInProgress];
}

id objc_msgSend_isRetryConnectionTimerValid(void *a1, const char *a2, ...)
{
  return [a1 isRetryConnectionTimerValid];
}

id objc_msgSend_isSet(void *a1, const char *a2, ...)
{
  return [a1 isSet];
}

id objc_msgSend_isSigned(void *a1, const char *a2, ...)
{
  return [a1 isSigned];
}

id objc_msgSend_kilocalorieUnit(void *a1, const char *a2, ...)
{
  return [a1 kilocalorieUnit];
}

id objc_msgSend_lastConnection(void *a1, const char *a2, ...)
{
  return [a1 lastConnection];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localIdentifier];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_machineBrand(void *a1, const char *a2, ...)
{
  return [a1 machineBrand];
}

id objc_msgSend_machineName(void *a1, const char *a2, ...)
{
  return [a1 machineName];
}

id objc_msgSend_machinePreferredUntilDate(void *a1, const char *a2, ...)
{
  return [a1 machinePreferredUntilDate];
}

id objc_msgSend_machineStartDate(void *a1, const char *a2, ...)
{
  return [a1 machineStartDate];
}

id objc_msgSend_machineState(void *a1, const char *a2, ...)
{
  return [a1 machineState];
}

id objc_msgSend_machineStateUpdateDate(void *a1, const char *a2, ...)
{
  return [a1 machineStateUpdateDate];
}

id objc_msgSend_machineType(void *a1, const char *a2, ...)
{
  return [a1 machineType];
}

id objc_msgSend_machineUUID(void *a1, const char *a2, ...)
{
  return [a1 machineUUID];
}

id objc_msgSend_manufacturer(void *a1, const char *a2, ...)
{
  return [a1 manufacturer];
}

id objc_msgSend_manufacturerName(void *a1, const char *a2, ...)
{
  return [a1 manufacturerName];
}

id objc_msgSend_markActivityTypeProvided(void *a1, const char *a2, ...)
{
  return [a1 markActivityTypeProvided];
}

id objc_msgSend_markBluetoothConnectionComplete(void *a1, const char *a2, ...)
{
  return [a1 markBluetoothConnectionComplete];
}

id objc_msgSend_markDataTransferPermitted(void *a1, const char *a2, ...)
{
  return [a1 markDataTransferPermitted];
}

id objc_msgSend_markMFAAuthenticated(void *a1, const char *a2, ...)
{
  return [a1 markMFAAuthenticated];
}

id objc_msgSend_metricsCollector(void *a1, const char *a2, ...)
{
  return [a1 metricsCollector];
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return [a1 modelNumber];
}

id objc_msgSend_mostRecentQuantity(void *a1, const char *a2, ...)
{
  return [a1 mostRecentQuantity];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nfcConnectionHandoverData(void *a1, const char *a2, ...)
{
  return [a1 nfcConnectionHandoverData];
}

id objc_msgSend_nfcPermission(void *a1, const char *a2, ...)
{
  return [a1 nfcPermission];
}

id objc_msgSend_nfcSessionID(void *a1, const char *a2, ...)
{
  return [a1 nfcSessionID];
}

id objc_msgSend_nfcSessionIDData(void *a1, const char *a2, ...)
{
  return [a1 nfcSessionIDData];
}

id objc_msgSend_objectType(void *a1, const char *a2, ...)
{
  return [a1 objectType];
}

id objc_msgSend_oobData(void *a1, const char *a2, ...)
{
  return [a1 oobData];
}

id objc_msgSend_oobInfo(void *a1, const char *a2, ...)
{
  return [a1 oobInfo];
}

id objc_msgSend_pauseCurrentSession(void *a1, const char *a2, ...)
{
  return [a1 pauseCurrentSession];
}

id objc_msgSend_peripheral(void *a1, const char *a2, ...)
{
  return [a1 peripheral];
}

id objc_msgSend_positiveElevationGain(void *a1, const char *a2, ...)
{
  return [a1 positiveElevationGain];
}

id objc_msgSend_positiveElevationGainIsSet(void *a1, const char *a2, ...)
{
  return [a1 positiveElevationGainIsSet];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_profile(void *a1, const char *a2, ...)
{
  return [a1 profile];
}

id objc_msgSend_profileType(void *a1, const char *a2, ...)
{
  return [a1 profileType];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return [a1 properties];
}

id objc_msgSend_pulse(void *a1, const char *a2, ...)
{
  return [a1 pulse];
}

id objc_msgSend_quantity(void *a1, const char *a2, ...)
{
  return [a1 quantity];
}

id objc_msgSend_randomValue(void *a1, const char *a2, ...)
{
  return [a1 randomValue];
}

id objc_msgSend_readRSSI(void *a1, const char *a2, ...)
{
  return [a1 readRSSI];
}

id objc_msgSend_reconnectToServices(void *a1, const char *a2, ...)
{
  return [a1 reconnectToServices];
}

id objc_msgSend_recoveryConfiguration(void *a1, const char *a2, ...)
{
  return [a1 recoveryConfiguration];
}

id objc_msgSend_releasePrivateMode(void *a1, const char *a2, ...)
{
  return [a1 releasePrivateMode];
}

id objc_msgSend_releaseSinglePollExpressModeAssertion(void *a1, const char *a2, ...)
{
  return [a1 releaseSinglePollExpressModeAssertion];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resetOOBState(void *a1, const char *a2, ...)
{
  return [a1 resetOOBState];
}

id objc_msgSend_resistanceLevel(void *a1, const char *a2, ...)
{
  return [a1 resistanceLevel];
}

id objc_msgSend_resistanceLevelIsSet(void *a1, const char *a2, ...)
{
  return [a1 resistanceLevelIsSet];
}

id objc_msgSend_resumeContext(void *a1, const char *a2, ...)
{
  return [a1 resumeContext];
}

id objc_msgSend_resumeCurrentSession(void *a1, const char *a2, ...)
{
  return [a1 resumeCurrentSession];
}

id objc_msgSend_sampleType(void *a1, const char *a2, ...)
{
  return [a1 sampleType];
}

id objc_msgSend_sampleTypesToCollect(void *a1, const char *a2, ...)
{
  return [a1 sampleTypesToCollect];
}

id objc_msgSend_sendInitialValues(void *a1, const char *a2, ...)
{
  return [a1 sendInitialValues];
}

id objc_msgSend_sensorContact(void *a1, const char *a2, ...)
{
  return [a1 sensorContact];
}

id objc_msgSend_sensorLocation(void *a1, const char *a2, ...)
{
  return [a1 sensorLocation];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_serviceConnectionManager(void *a1, const char *a2, ...)
{
  return [a1 serviceConnectionManager];
}

id objc_msgSend_serviceId(void *a1, const char *a2, ...)
{
  return [a1 serviceId];
}

id objc_msgSend_serviceManager(void *a1, const char *a2, ...)
{
  return [a1 serviceManager];
}

id objc_msgSend_serviceStatus(void *a1, const char *a2, ...)
{
  return [a1 serviceStatus];
}

id objc_msgSend_serviceType(void *a1, const char *a2, ...)
{
  return [a1 serviceType];
}

id objc_msgSend_serviceUUID(void *a1, const char *a2, ...)
{
  return [a1 serviceUUID];
}

id objc_msgSend_services(void *a1, const char *a2, ...)
{
  return [a1 services];
}

id objc_msgSend_servicesInProfile(void *a1, const char *a2, ...)
{
  return [a1 servicesInProfile];
}

id objc_msgSend_sessionUUID(void *a1, const char *a2, ...)
{
  return [a1 sessionUUID];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedBehavior(void *a1, const char *a2, ...)
{
  return [a1 sharedBehavior];
}

id objc_msgSend_sharedDiagnosticManager(void *a1, const char *a2, ...)
{
  return [a1 sharedDiagnosticManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedPairingAgent(void *a1, const char *a2, ...)
{
  return [a1 sharedPairingAgent];
}

id objc_msgSend_softwareRevision(void *a1, const char *a2, ...)
{
  return [a1 softwareRevision];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stateDescription(void *a1, const char *a2, ...)
{
  return [a1 stateDescription];
}

id objc_msgSend_stepCount(void *a1, const char *a2, ...)
{
  return [a1 stepCount];
}

id objc_msgSend_stepCountIsSet(void *a1, const char *a2, ...)
{
  return [a1 stepCountIsSet];
}

id objc_msgSend_stopScan(void *a1, const char *a2, ...)
{
  return [a1 stopScan];
}

id objc_msgSend_strideCount(void *a1, const char *a2, ...)
{
  return [a1 strideCount];
}

id objc_msgSend_strideCountIsSet(void *a1, const char *a2, ...)
{
  return [a1 strideCountIsSet];
}

id objc_msgSend_strongToWeakObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToWeakObjectsMapTable];
}

id objc_msgSend_sumQuantity(void *a1, const char *a2, ...)
{
  return [a1 sumQuantity];
}

id objc_msgSend_supportsWorkouts(void *a1, const char *a2, ...)
{
  return [a1 supportsWorkouts];
}

id objc_msgSend_taskUUID(void *a1, const char *a2, ...)
{
  return [a1 taskUUID];
}

id objc_msgSend_tearDown(void *a1, const char *a2, ...)
{
  return [a1 tearDown];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeToBeginExperience(void *a1, const char *a2, ...)
{
  return [a1 timeToBeginExperience];
}

id objc_msgSend_timerValue(void *a1, const char *a2, ...)
{
  return [a1 timerValue];
}

id objc_msgSend_tinkerModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 tinkerModeEnabled];
}

id objc_msgSend_totalDistance(void *a1, const char *a2, ...)
{
  return [a1 totalDistance];
}

id objc_msgSend_totalDistanceIsSet(void *a1, const char *a2, ...)
{
  return [a1 totalDistanceIsSet];
}

id objc_msgSend_totalElevationAscended(void *a1, const char *a2, ...)
{
  return [a1 totalElevationAscended];
}

id objc_msgSend_totalEnergy(void *a1, const char *a2, ...)
{
  return [a1 totalEnergy];
}

id objc_msgSend_totalEnergyIsSet(void *a1, const char *a2, ...)
{
  return [a1 totalEnergyIsSet];
}

id objc_msgSend_totalFloorsClimbed(void *a1, const char *a2, ...)
{
  return [a1 totalFloorsClimbed];
}

id objc_msgSend_totalStrideCount(void *a1, const char *a2, ...)
{
  return [a1 totalStrideCount];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updateTime(void *a1, const char *a2, ...)
{
  return [a1 updateTime];
}

id objc_msgSend_updatedFitnessMachine(void *a1, const char *a2, ...)
{
  return [a1 updatedFitnessMachine];
}

id objc_msgSend_userCharacteristicsManager(void *a1, const char *a2, ...)
{
  return [a1 userCharacteristicsManager];
}

id objc_msgSend_userIsAuthorized(void *a1, const char *a2, ...)
{
  return [a1 userIsAuthorized];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_valueAsData(void *a1, const char *a2, ...)
{
  return [a1 valueAsData];
}

id objc_msgSend_waitingOnActivityType(void *a1, const char *a2, ...)
{
  return [a1 waitingOnActivityType];
}

id objc_msgSend_waitingOnBluetoothConnection(void *a1, const char *a2, ...)
{
  return [a1 waitingOnBluetoothConnection];
}

id objc_msgSend_waitingOnInitialMachineData(void *a1, const char *a2, ...)
{
  return [a1 waitingOnInitialMachineData];
}

id objc_msgSend_waitingOnInitialMachineStatus(void *a1, const char *a2, ...)
{
  return [a1 waitingOnInitialMachineStatus];
}

id objc_msgSend_waitingOnMFA(void *a1, const char *a2, ...)
{
  return [a1 waitingOnMFA];
}

id objc_msgSend_wattUnit(void *a1, const char *a2, ...)
{
  return [a1 wattUnit];
}

id objc_msgSend_workoutConfiguration(void *a1, const char *a2, ...)
{
  return [a1 workoutConfiguration];
}

id objc_msgSend_workoutDataAccumulator(void *a1, const char *a2, ...)
{
  return [a1 workoutDataAccumulator];
}

id objc_msgSend_workoutDataFlowLink(void *a1, const char *a2, ...)
{
  return [a1 workoutDataFlowLink];
}

id objc_msgSend_workoutEndErrorCode(void *a1, const char *a2, ...)
{
  return [a1 workoutEndErrorCode];
}

id objc_msgSend_workoutManager(void *a1, const char *a2, ...)
{
  return [a1 workoutManager];
}

id objc_msgSend_workoutType(void *a1, const char *a2, ...)
{
  return [a1 workoutType];
}

id objc_msgSend_writeValue_forCharacteristic_type_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeValue:forCharacteristic:type:");
}