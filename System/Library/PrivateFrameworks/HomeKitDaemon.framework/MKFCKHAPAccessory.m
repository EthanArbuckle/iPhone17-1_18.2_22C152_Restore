@interface MKFCKHAPAccessory
+ (id)fetchRequest;
+ (id)fetchWithLocalModel:(id)a3 context:(id)a4;
- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5;
- (BOOL)hasServicePropertiesForInstanceID:(void *)a1;
- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5;
- (id)fetchLocalModelWithContext:(id)a3;
- (id)lazyMutableCopy:(void *)a1 of:(void *)a2;
- (void)exportServiceDictionary:(void *)a3 forLocalModel:(int)a4 servicesModified:(void *)a5 withBlock:;
- (void)importServiceDictionary:(void *)a3 forLocalModel:(void *)a4 withBlock:;
@end

@implementation MKFCKHAPAccessory

+ (id)fetchWithLocalModel:(id)a3 context:(id)a4
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MKFCKHAPAccessory;
  v4 = objc_msgSendSuper2(&v6, sel_fetchWithLocalModel_context_, a3, a4);
  return v4;
}

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v59.receiver = self;
  v59.super_class = (Class)MKFCKHAPAccessory;
  BOOL v10 = [(MKFCKAccessory *)&v59 exportFromLocalModel:v8 updatedProperties:a4 context:v9];
  if (!v10) {
    goto LABEL_46;
  }
  v11 = [(MKFCKHAPAccessory *)self initialServiceTypes];
  if (v11) {
    goto LABEL_5;
  }
  v12 = [v8 initialServiceTypes];

  if (v12)
  {
    v11 = [v8 initialServiceTypes];
    [(MKFCKHAPAccessory *)self setInitialServiceTypes:v11];
LABEL_5:
  }
  id v13 = v8;
  if (self)
  {
    v14 = [(MKFCKHAPAccessory *)self serviceProperties];
    uint64_t v72 = 0;
    v15 = [v13 services];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    obuint64_t j = v15;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v68 objects:v77 count:16];
    if (v16)
    {
      id v53 = v13;
      BOOL v54 = v10;
      id v55 = v9;
      v56 = self;
      id v57 = v8;
      uint64_t v17 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v69 != v17) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v68 + 1) + 8 * i);
          v20 = objc_msgSend(v19, "instanceID", v53);
          v21 = [v14 objectForKeyedSubscript:v20];

          if (!v21)
          {
            v75[0] = @"t";
            v22 = [v19 serviceType];
            v75[1] = @"p";
            v76[0] = v22;
            uint64_t v23 = [v19 serviceProperties];
            v24 = (void *)v23;
            v25 = &unk_26E4722C8;
            if (v23) {
              v25 = (void *)v23;
            }
            v76[1] = v25;
            v26 = [NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:2];
            v27 = -[MKFCKHAPAccessory lazyMutableCopy:of:]((void **)&v72, v14);
            [v27 setObject:v26 forKeyedSubscript:v20];
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v68 objects:v77 count:16];
      }
      while (v16);
      uint64_t v16 = v72;
      if (v72)
      {
        v28 = (void *)MEMORY[0x263EFF9C0];
        v29 = [v14 allKeys];
        v30 = [v28 setWithArray:v29];

        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v31 = obj;
        uint64_t v32 = [v31 countByEnumeratingWithState:&v64 objects:v74 count:16];
        id v9 = v55;
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v65;
          do
          {
            for (uint64_t j = 0; j != v33; ++j)
            {
              if (*(void *)v65 != v34) {
                objc_enumerationMutation(v31);
              }
              v36 = [*(id *)(*((void *)&v64 + 1) + 8 * j) instanceID];
              [v30 removeObject:v36];
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v64 objects:v74 count:16];
          }
          while (v33);
        }

        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id v37 = v30;
        uint64_t v38 = [v37 countByEnumeratingWithState:&v60 objects:v73 count:16];
        if (v38)
        {
          uint64_t v39 = v38;
          uint64_t v40 = *(void *)v61;
          do
          {
            for (uint64_t k = 0; k != v39; ++k)
            {
              if (*(void *)v61 != v40) {
                objc_enumerationMutation(v37);
              }
              uint64_t v42 = *(void *)(*((void *)&v60 + 1) + 8 * k);
              v43 = [MEMORY[0x263EFF9D0] null];
              [(id)v16 setObject:v43 forKeyedSubscript:v42];
            }
            uint64_t v39 = [v37 countByEnumeratingWithState:&v60 objects:v73 count:16];
          }
          while (v39);
        }

        self = v56;
        v44 = [(MKFCKHAPAccessory *)v56 serviceProperties];
        char v45 = HMFEqualObjects();

        if ((v45 & 1) == 0)
        {
          v46 = (void *)[(id)v16 copy];
          [(MKFCKHAPAccessory *)v56 setServiceProperties:v46];
        }
        LODWORD(v16) = 1;
        id v8 = v57;
      }
      else
      {
        id v8 = v57;
        id v9 = v55;
      }
      LOBYTE(v10) = v54;
      id v13 = v53;
    }
  }
  else
  {
    LODWORD(v16) = 0;
  }

  -[MKFCKHAPAccessory exportServiceDictionary:forLocalModel:servicesModified:withBlock:](self, @"serviceAssociatedServiceTypes", v13, v16, &__block_literal_global_23_154915);
  -[MKFCKHAPAccessory exportServiceDictionary:forLocalModel:servicesModified:withBlock:](self, @"serviceConfiguredNames", v13, v16, &__block_literal_global_26_154917);
  -[MKFCKHAPAccessory exportServiceDictionary:forLocalModel:servicesModified:withBlock:](self, @"serviceApplicationData", v13, v16, &__block_literal_global_29_154919);
  v47 = [v13 accessoryCategory];
  if (v47)
  {
    v48 = [(MKFCKHAPAccessory *)self category];
    char v49 = HMFEqualObjects();

    if ((v49 & 1) == 0)
    {
      v50 = [(MKFCKHAPAccessory *)self category];

      char v51 = v16 ^ 1;
      if (!v50) {
        char v51 = 0;
      }
      if ((v51 & 1) == 0) {
        [(MKFCKHAPAccessory *)self setCategory:v47];
      }
    }
  }

LABEL_46:
  return v10;
}

- (void)exportServiceDictionary:(void *)a3 forLocalModel:(int)a4 servicesModified:(void *)a5 withBlock:
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  v35 = a5;
  if (a1)
  {
    id v34 = v9;
    v11 = [a1 valueForKey:v9];
    v12 = v11;
    char v45 = 0;
    if (a4)
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v13 = [v11 allKeys];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v47 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v42 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            if (!-[MKFCKHAPAccessory hasServicePropertiesForInstanceID:](a1, v18))
            {
              v19 = -[MKFCKHAPAccessory lazyMutableCopy:of:](&v45, v12);
              [v19 removeObjectForKey:v18];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v41 objects:v47 count:16];
        }
        while (v15);
      }
    }
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    objc_msgSend(v10, "services", v10);
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v38 != v22) {
            objc_enumerationMutation(obj);
          }
          v24 = *(void **)(*((void *)&v37 + 1) + 8 * j);
          v25 = [v24 instanceID];
          if (-[MKFCKHAPAccessory hasServicePropertiesForInstanceID:](a1, v25))
          {
            v26 = v35[2](v35, v24);
            [v12 objectForKeyedSubscript:v25];
            v28 = v27 = v12;
            char v29 = HMFEqualObjects();

            v12 = v27;
            if ((v29 & 1) == 0)
            {
              v30 = -[MKFCKHAPAccessory lazyMutableCopy:of:](&v45, v27);
              [v30 setObject:v26 forKeyedSubscript:v25];
            }
          }
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v21);
    }

    id v31 = v45;
    id v9 = v34;
    if (v45)
    {
      uint64_t v32 = (void *)[v45 copy];
      [a1 setValue:v32 forKey:v34];
    }
    id v10 = v33;
  }
}

id __68__MKFCKHAPAccessory_exportFromLocalModel_updatedProperties_context___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[_MKFApplicationData appDataDictionaryForContainer:a2];
}

uint64_t __68__MKFCKHAPAccessory_exportFromLocalModel_updatedProperties_context___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 name];
}

- (BOOL)hasServicePropertiesForInstanceID:(void *)a1
{
  id v3 = a2;
  v4 = [a1 serviceProperties];
  v5 = [v4 objectForKeyedSubscript:v3];

  id v6 = v5;
  v7 = v6;
  if ((id)*MEMORY[0x263EFFD08] == v6) {
    id v8 = 0;
  }
  else {
    id v8 = v6;
  }

  return v8 != 0;
}

- (id)lazyMutableCopy:(void *)a1 of:(void *)a2
{
  id v3 = a2;
  v4 = *a1;
  if (!*a1)
  {
    v5 = (void *)[v3 mutableCopy];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [MEMORY[0x263EFF9A0] dictionary];
    }
    id v8 = *a1;
    *a1 = v7;

    v4 = *a1;
  }
  id v9 = v4;

  return v9;
}

uint64_t __68__MKFCKHAPAccessory_exportFromLocalModel_updatedProperties_context___block_invoke(uint64_t a1, void *a2)
{
  return [a2 associatedServiceType];
}

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  v43.receiver = self;
  v43.super_class = (Class)MKFCKHAPAccessory;
  id v42 = a3;
  id v40 = a5;
  BOOL v41 = -[MKFCKAccessory importIntoLocalModel:updatedProperties:context:](&v43, sel_importIntoLocalModel_updatedProperties_context_, v42, a4);
  if (v41)
  {
    id v8 = [v42 pairingUsername];
    BOOL v9 = v8 == 0;

    if (v9)
    {
      id v10 = [(MKFCKHAPAccessory *)self identifier];
      [v42 setPairingUsername:v10];
    }
    v11 = [(MKFCKHAPAccessory *)self initialServiceTypes];
    v12 = [v42 initialServiceTypes];
    char v13 = HMFEqualObjects();

    if ((v13 & 1) == 0) {
      [v42 setInitialServiceTypes:v11];
    }
    id v14 = v42;
    id v38 = v40;
    if (self)
    {
      long long v39 = [(MKFCKHAPAccessory *)self serviceProperties];
      uint64_t v15 = [v14 mutableSetValueForKey:@"services_"];
      uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v39, "count"));
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v17 = v15;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v58 objects:v63 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v59 != v19) {
              objc_enumerationMutation(v17);
            }
            uint64_t v21 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            uint64_t v22 = [v21 instanceID];
            [v16 setObject:v21 forKeyedSubscript:v22];
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v58 objects:v63 count:16];
        }
        while (v18);
      }

      long long v37 = v11;
      uint64_t v54 = 0;
      id v55 = &v54;
      uint64_t v56 = 0x2020000000;
      char v57 = 0;
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = __76__MKFCKHAPAccessory_importServicePropertiesIntoLocalModel_context_modified___block_invoke;
      v48[3] = &unk_264A22278;
      id v23 = v16;
      id v49 = v23;
      id v24 = v38;
      id v50 = v24;
      id v51 = v14;
      id v25 = v17;
      id v52 = v25;
      id v53 = &v54;
      [v39 enumerateKeysAndObjectsUsingBlock:v48];
      if (*((unsigned char *)v55 + 24))
      {
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        v26 = [v23 allValues];
        uint64_t v27 = [v26 countByEnumeratingWithState:&v44 objects:v62 count:16];
        if (v27)
        {
          uint64_t v28 = *(void *)v45;
          do
          {
            for (uint64_t j = 0; j != v27; ++j)
            {
              if (*(void *)v45 != v28) {
                objc_enumerationMutation(v26);
              }
              uint64_t v30 = *(void *)(*((void *)&v44 + 1) + 8 * j);
              objc_msgSend(v25, "removeObject:", v30, v37);
              [v24 deleteObject:v30];
            }
            uint64_t v27 = [v26 countByEnumeratingWithState:&v44 objects:v62 count:16];
          }
          while (v27);
        }

        v11 = v37;
        int v31 = *((unsigned __int8 *)v55 + 24);
      }
      else
      {
        int v31 = 0;
      }

      _Block_object_dispose(&v54, 8);
    }
    else
    {
      int v31 = 0;
    }

    -[MKFCKHAPAccessory importServiceDictionary:forLocalModel:withBlock:](self, @"serviceAssociatedServiceTypes", v14, &__block_literal_global_154947);
    -[MKFCKHAPAccessory importServiceDictionary:forLocalModel:withBlock:](self, @"serviceConfiguredNames", v14, &__block_literal_global_12_154948);
    -[MKFCKHAPAccessory importServiceDictionary:forLocalModel:withBlock:](self, @"serviceApplicationData", v14, &__block_literal_global_18_154949);
    if (v31)
    {
      uint64_t v32 = [v14 accessoryCategory];
      uint64_t v33 = [(MKFCKHAPAccessory *)self category];
      char v34 = HMFEqualObjects();

      if ((v34 & 1) == 0)
      {
        v35 = [(MKFCKHAPAccessory *)self category];
        [v14 setAccessoryCategory:v35];
      }
    }
  }
  return v41;
}

- (void)importServiceDictionary:(void *)a3 forLocalModel:(void *)a4 withBlock:
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    id v17 = [a1 valueForKey:a2];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    BOOL v9 = [v7 services];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v15 = [v14 instanceID];
          if (-[MKFCKHAPAccessory hasServicePropertiesForInstanceID:](a1, v15))
          {
            uint64_t v16 = [v17 objectForKeyedSubscript:v15];
            v8[2](v8, v14, v16);
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
  }
}

uint64_t __68__MKFCKHAPAccessory_importIntoLocalModel_updatedProperties_context___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[_MKFApplicationData setAppDataDictionary:a3 forContainer:a2];
}

uint64_t __68__MKFCKHAPAccessory_importIntoLocalModel_updatedProperties_context___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setName:");
}

uint64_t __68__MKFCKHAPAccessory_importIntoLocalModel_updatedProperties_context___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAssociatedServiceType:");
}

void __76__MKFCKHAPAccessory_importServicePropertiesIntoLocalModel_context_modified___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  id v6 = v5;
  if ((id)*MEMORY[0x263EFFD08] == v5) {
    id v7 = 0;
  }
  else {
    id v7 = v5;
  }
  id v8 = v7;

  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v14];
    if (v9)
    {
      uint64_t v10 = (_MKFService *)v9;
      [*(id *)(a1 + 32) removeObjectForKey:v14];
    }
    else
    {
      uint64_t v10 = [[_MKFService alloc] initWithContext:*(void *)(a1 + 40)];
      uint64_t v11 = +[_MKFService modelIDForKeyAttribute:v14 parent:*(void *)(a1 + 48)];
      [(_MKFService *)v10 setModelID:v11];

      [(_MKFService *)v10 setInstanceID:v14];
      uint64_t v12 = [v8 objectForKeyedSubscript:@"t"];
      [(_MKFService *)v10 setServiceType:v12];

      char v13 = [v8 objectForKeyedSubscript:@"p"];
      [(_MKFService *)v10 setServiceProperties:v13];

      [*(id *)(a1 + 56) addObject:v10];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }
  }
}

- (id)fetchLocalModelWithContext:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MKFCKHAPAccessory;
  id v3 = [(MKFCKModel *)&v5 fetchLocalModelWithContext:a3];
  return v3;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFCKHAPAccessory"];
}

@end