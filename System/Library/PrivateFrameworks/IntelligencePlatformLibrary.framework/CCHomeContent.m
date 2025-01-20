@interface CCHomeContent
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCHome)home;
- (CCHomeAccessory)accessory;
- (CCHomeContent)initWithEntity:(id)a3 entityType:(unsigned int)a4 error:(id *)a5;
- (CCHomeContent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCHomeRoom)room;
- (CCHomeScene)scene;
- (CCHomeService)service;
- (CCHomeServiceGroup)serviceGroup;
- (CCHomeTrigger)trigger;
- (CCHomeZone)zone;
- (id)jsonDictionary;
- (unsigned)entityType;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
@end

@implementation CCHomeContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_serviceGroup, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_zone, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

- (unsigned)entityType
{
  return self->_entityType;
}

- (CCHomeContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  v58[1] = 0;
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"home"];
    if (v9)
    {
      v58[0] = 0;
      v10 = [[CCHome alloc] initWithJSONDictionary:v9 error:v58];
      id v11 = v58[0];
      v12 = v11;
      if (!v10 || v11)
      {
        CCSetError();
        v27 = 0;
LABEL_71:

        goto LABEL_72;
      }

      v9 = (CCHomeTrigger *)v10;
    }
    v12 = [v6 objectForKeyedSubscript:@"zone"];
    if (v12)
    {
      id v57 = 0;
      v13 = [[CCHomeZone alloc] initWithJSONDictionary:v12 error:&v57];
      v14 = (CCHome *)v57;
      v10 = v14;
      if (!v13 || v14)
      {
        CCSetError();
        v27 = 0;
LABEL_70:

        goto LABEL_71;
      }

      v12 = v13;
    }
    v10 = [v6 objectForKeyedSubscript:@"room"];
    if (v10)
    {
      id v56 = 0;
      v15 = [[CCHomeRoom alloc] initWithJSONDictionary:v10 error:&v56];
      v16 = (CCHomeZone *)v56;
      v13 = v16;
      if (!v15 || v16)
      {
        CCSetError();
        v27 = 0;
LABEL_69:

        goto LABEL_70;
      }

      v10 = (CCHome *)v15;
    }
    v13 = [v6 objectForKeyedSubscript:@"service"];
    if (v13)
    {
      id v55 = 0;
      v17 = [[CCHomeService alloc] initWithJSONDictionary:v13 error:&v55];
      v18 = (CCHomeRoom *)v55;
      v15 = v18;
      if (!v17 || v18)
      {
        CCSetError();
        v27 = 0;
LABEL_68:

        goto LABEL_69;
      }

      v13 = (CCHomeZone *)v17;
    }
    v15 = [v6 objectForKeyedSubscript:@"serviceGroup"];
    if (v15)
    {
      id v54 = 0;
      v19 = [[CCHomeServiceGroup alloc] initWithJSONDictionary:v15 error:&v54];
      v20 = (CCHomeService *)v54;
      v21 = v19;
      v17 = v20;
      if (!v21 || v20)
      {
        v28 = v21;
        CCSetError();
        v29 = v28;
        v27 = 0;
LABEL_67:

        goto LABEL_68;
      }
      v22 = (CCHomeRoom *)v21;

      v15 = v22;
    }
    uint64_t v23 = [v6 objectForKeyedSubscript:@"scene"];
    v48 = v15;
    if (v23)
    {
      v17 = (CCHomeService *)v23;
      id v53 = 0;
      v24 = [[CCHomeScene alloc] initWithJSONDictionary:v23 error:&v53];
      v25 = (CCHomeServiceGroup *)v53;
      v50 = v24;
      if (!v24 || v25)
      {
        v49 = v25;
        CCSetError();
        v27 = 0;
        v15 = v48;
LABEL_66:

        v29 = v49;
        goto LABEL_67;
      }

      v26 = v24;
      v15 = v48;
    }
    else
    {
      v26 = 0;
    }
    v47 = (CCHomeService *)v26;
    uint64_t v30 = [v6 objectForKeyedSubscript:@"trigger"];
    if (v30)
    {
      id v52 = 0;
      v49 = (CCHomeServiceGroup *)v30;
      v31 = [[CCHomeTrigger alloc] initWithJSONDictionary:v30 error:&v52];
      id v32 = v52;
      if (!v31 || v32)
      {
        v50 = v32;
        CCSetError();
        v27 = 0;
        goto LABEL_65;
      }

      v49 = (CCHomeServiceGroup *)v31;
    }
    else
    {
      v49 = 0;
    }
    uint64_t v33 = [v6 objectForKeyedSubscript:@"accessory"];
    if (!v33)
    {
      v36 = 0;
      goto LABEL_45;
    }
    v50 = (void *)v33;
    id v51 = 0;
    v34 = [[CCHomeAccessory alloc] initWithJSONDictionary:v33 error:&v51];
    v35 = (CCHomeTrigger *)v51;
    v31 = v35;
    if (v34 && !v35)
    {

      v36 = v34;
      v15 = v48;
LABEL_45:
      v50 = v36;
      if (v9)
      {
        v37 = v9;
        int v38 = 1;
      }
      else
      {
        int v38 = 0;
      }
      v31 = v9;
      if (v12)
      {
        v31 = v12;

        int v38 = 2;
      }
      if (v10)
      {
        v41 = v10;

        int v38 = 3;
        v31 = (CCHomeTrigger *)v41;
      }
      if (v13)
      {
        v42 = v13;

        int v38 = 4;
        v31 = (CCHomeTrigger *)v42;
      }
      if (v15)
      {
        v43 = v15;

        int v38 = 5;
        v31 = (CCHomeTrigger *)v43;
      }
      if (v47)
      {
        v44 = v47;

        int v38 = 6;
        v31 = v44;
      }
      if (v49)
      {
        v45 = v49;

        int v38 = 7;
        v31 = v45;
      }
      if (v50)
      {
        v40 = v50;

        unsigned int v46 = 8;
        v31 = v40;
      }
      else
      {
        unsigned int v46 = v38;
      }
      v27 = [[CCHomeContent alloc] initWithEntity:v31 entityType:v46 error:a4];
      goto LABEL_65;
    }
    CCSetError();

    v27 = 0;
    v15 = v48;
LABEL_65:

    v17 = v47;
    goto LABEL_66;
  }
  CCSetError();
  v27 = 0;
LABEL_72:

  return v27;
}

- (id)jsonDictionary
{
  v3 = objc_opt_new();
  if (self->_home)
  {
    v4 = [(CCHomeContent *)self home];
    v5 = [v4 jsonDictionary];
    [v3 setObject:v5 forKeyedSubscript:@"home"];
  }
  if (self->_zone)
  {
    id v6 = [(CCHomeContent *)self zone];
    v7 = [v6 jsonDictionary];
    [v3 setObject:v7 forKeyedSubscript:@"zone"];
  }
  if (self->_room)
  {
    id v8 = [(CCHomeContent *)self room];
    v9 = [v8 jsonDictionary];
    [v3 setObject:v9 forKeyedSubscript:@"room"];
  }
  if (self->_service)
  {
    v10 = [(CCHomeContent *)self service];
    id v11 = [v10 jsonDictionary];
    [v3 setObject:v11 forKeyedSubscript:@"service"];
  }
  if (self->_serviceGroup)
  {
    v12 = [(CCHomeContent *)self serviceGroup];
    v13 = [v12 jsonDictionary];
    [v3 setObject:v13 forKeyedSubscript:@"serviceGroup"];
  }
  if (self->_scene)
  {
    v14 = [(CCHomeContent *)self scene];
    v15 = [v14 jsonDictionary];
    [v3 setObject:v15 forKeyedSubscript:@"scene"];
  }
  if (self->_trigger)
  {
    v16 = [(CCHomeContent *)self trigger];
    v17 = [v16 jsonDictionary];
    [v3 setObject:v17 forKeyedSubscript:@"trigger"];
  }
  if (self->_accessory)
  {
    v18 = [(CCHomeContent *)self accessory];
    v19 = [v18 jsonDictionary];
    [v3 setObject:v19 forKeyedSubscript:@"accessory"];
  }
  v20 = (void *)[v3 copy];

  return v20;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  v13 = (void (**)(id, void *))a3;
  if (self->_home)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:7691 subMessageValue:self->_home];
    v13[2](v13, v5);
  }
  if (self->_zone)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:7692 subMessageValue:self->_zone];
    v13[2](v13, v6);
  }
  if (self->_room)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:7693 subMessageValue:self->_room];
    v13[2](v13, v7);
  }
  if (self->_service)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:7694 subMessageValue:self->_service];
    v13[2](v13, v8);
  }
  if (self->_serviceGroup)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:7695 subMessageValue:self->_serviceGroup];
    v13[2](v13, v9);
  }
  if (self->_scene)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:7696 subMessageValue:self->_scene];
    v13[2](v13, v10);
  }
  if (self->_trigger)
  {
    id v11 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:7697 subMessageValue:self->_trigger];
    v13[2](v13, v11);
  }
  if (self->_accessory)
  {
    v12 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:7698 subMessageValue:self->_accessory];
    v13[2](v13, v12);
  }
}

- (CCHomeAccessory)accessory
{
  v2 = (void *)[(CCHomeAccessory *)self->_accessory copy];
  return (CCHomeAccessory *)v2;
}

- (CCHomeTrigger)trigger
{
  v2 = (void *)[(CCHomeTrigger *)self->_trigger copy];
  return (CCHomeTrigger *)v2;
}

- (CCHomeScene)scene
{
  v2 = (void *)[(CCHomeScene *)self->_scene copy];
  return (CCHomeScene *)v2;
}

- (CCHomeServiceGroup)serviceGroup
{
  v2 = (void *)[(CCHomeServiceGroup *)self->_serviceGroup copy];
  return (CCHomeServiceGroup *)v2;
}

- (CCHomeService)service
{
  v2 = (void *)[(CCHomeService *)self->_service copy];
  return (CCHomeService *)v2;
}

- (CCHomeRoom)room
{
  v2 = (void *)[(CCHomeRoom *)self->_room copy];
  return (CCHomeRoom *)v2;
}

- (CCHomeZone)zone
{
  v2 = (void *)[(CCHomeZone *)self->_zone copy];
  return (CCHomeZone *)v2;
}

- (CCHome)home
{
  v2 = (void *)[(CCHome *)self->_home copy];
  return (CCHome *)v2;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (char *)[objc_alloc(MEMORY[0x263F31738]) initWithData:v5];
  v7 = (int *)MEMORY[0x263F317C8];
  id v8 = (int *)MEMORY[0x263F317C0];
  v9 = (int *)MEMORY[0x263F317B8];
  if (*(void *)&v6[*MEMORY[0x263F317C8]] >= *(void *)&v6[*MEMORY[0x263F317C0]]) {
    goto LABEL_48;
  }
  id v10 = 0;
  id v11 = (int *)MEMORY[0x263F317B0];
  do
  {
    if (*(void *)&v6[*v9]) {
      BOOL v12 = 0;
    }
    else {
      BOOL v12 = v10 == 0;
    }
    if (!v12) {
      break;
    }
    char v13 = 0;
    unsigned int v14 = 0;
    unint64_t v15 = 0;
    while (1)
    {
      uint64_t v16 = *v7;
      unint64_t v17 = *(void *)&v6[v16];
      if (v17 == -1 || v17 >= *(void *)&v6[*v8]) {
        break;
      }
      char v18 = *(unsigned char *)(*(void *)&v6[*v11] + v17);
      *(void *)&v6[v16] = v17 + 1;
      v15 |= (unint64_t)(v18 & 0x7F) << v13;
      if ((v18 & 0x80) == 0) {
        goto LABEL_17;
      }
      v13 += 7;
      if (v14++ >= 9)
      {
        unint64_t v15 = 0;
        if (*(void *)&v6[*v9]) {
          goto LABEL_49;
        }
        goto LABEL_18;
      }
    }
    *(void *)&v6[*v9] = 1;
LABEL_17:
    if (*(void *)&v6[*v9]) {
      goto LABEL_49;
    }
LABEL_18:
    switch((v15 >> 3))
    {
      case 1u:
        v20 = [CCHome alloc];
        v21 = CCPBReaderReadDataNoCopy();
        id v101 = 0;
        v22 = [(CCItemMessage *)v20 initWithData:v21 error:&v101];
        id v10 = v101;
        home = self->_home;
        self->_home = v22;

        if (!v10)
        {
          self->_entityType = 1;
          zone = self->_zone;
          self->_zone = 0;

          goto LABEL_25;
        }
        break;
      case 2u:
        v25 = [CCHomeZone alloc];
        v26 = CCPBReaderReadDataNoCopy();
        id v100 = 0;
        v27 = [(CCItemMessage *)v25 initWithData:v26 error:&v100];
        id v10 = v100;
        v28 = self->_zone;
        self->_zone = v27;

        if (!v10)
        {
          v29 = self->_home;
          self->_home = 0;

          self->_entityType = 2;
LABEL_25:
          room = self->_room;
          self->_room = 0;

          goto LABEL_28;
        }
        break;
      case 3u:
        v31 = [CCHomeRoom alloc];
        id v32 = CCPBReaderReadDataNoCopy();
        id v99 = 0;
        uint64_t v33 = [(CCItemMessage *)v31 initWithData:v32 error:&v99];
        id v10 = v99;
        v34 = self->_room;
        self->_room = v33;

        if (!v10)
        {
          v35 = self->_home;
          self->_home = 0;

          v36 = self->_zone;
          self->_zone = 0;

          self->_entityType = 3;
LABEL_28:
          service = self->_service;
          self->_service = 0;

          goto LABEL_31;
        }
        break;
      case 4u:
        int v38 = [CCHomeService alloc];
        v39 = CCPBReaderReadDataNoCopy();
        id v98 = 0;
        v40 = [(CCItemMessage *)v38 initWithData:v39 error:&v98];
        id v10 = v98;
        v41 = self->_service;
        self->_service = v40;

        if (!v10)
        {
          v42 = self->_home;
          self->_home = 0;

          v43 = self->_zone;
          self->_zone = 0;

          v44 = self->_room;
          self->_room = 0;

          self->_entityType = 4;
LABEL_31:
          serviceGroup = self->_serviceGroup;
          self->_serviceGroup = 0;

          goto LABEL_34;
        }
        break;
      case 5u:
        unsigned int v46 = [CCHomeServiceGroup alloc];
        v47 = CCPBReaderReadDataNoCopy();
        id v97 = 0;
        v48 = [(CCItemMessage *)v46 initWithData:v47 error:&v97];
        id v10 = v97;
        v49 = self->_serviceGroup;
        self->_serviceGroup = v48;

        if (!v10)
        {
          v50 = self->_home;
          self->_home = 0;

          id v51 = self->_zone;
          self->_zone = 0;

          id v52 = self->_room;
          self->_room = 0;

          id v53 = self->_service;
          self->_service = 0;

          self->_entityType = 5;
LABEL_34:
          scene = self->_scene;
          self->_scene = 0;

          goto LABEL_35;
        }
        break;
      case 6u:
        id v57 = [CCHomeScene alloc];
        v58 = CCPBReaderReadDataNoCopy();
        id v96 = 0;
        v59 = [(CCItemMessage *)v57 initWithData:v58 error:&v96];
        id v10 = v96;
        v60 = self->_scene;
        self->_scene = v59;

        if (!v10)
        {
          v61 = self->_home;
          self->_home = 0;

          v62 = self->_zone;
          self->_zone = 0;

          v63 = self->_room;
          self->_room = 0;

          v64 = self->_service;
          self->_service = 0;

          v65 = self->_serviceGroup;
          self->_serviceGroup = 0;

          self->_entityType = 6;
LABEL_35:
          trigger = self->_trigger;
          self->_trigger = 0;

          goto LABEL_36;
        }
        break;
      case 7u:
        v66 = [CCHomeTrigger alloc];
        v67 = CCPBReaderReadDataNoCopy();
        id v95 = 0;
        v68 = [(CCItemMessage *)v66 initWithData:v67 error:&v95];
        id v10 = v95;
        v69 = self->_trigger;
        self->_trigger = v68;

        if (!v10)
        {
          v70 = self->_home;
          self->_home = 0;

          v71 = self->_zone;
          self->_zone = 0;

          v72 = self->_room;
          self->_room = 0;

          v73 = self->_service;
          self->_service = 0;

          v74 = self->_serviceGroup;
          self->_serviceGroup = 0;

          v75 = self->_scene;
          self->_scene = 0;

          self->_entityType = 7;
LABEL_36:
          accessory = self->_accessory;
          self->_accessory = 0;
        }
        break;
      case 8u:
        v76 = [CCHomeAccessory alloc];
        v77 = CCPBReaderReadDataNoCopy();
        id v94 = 0;
        v78 = [(CCItemMessage *)v76 initWithData:v77 error:&v94];
        id v10 = v94;
        v79 = self->_accessory;
        self->_accessory = v78;

        if (!v10)
        {
          v80 = self->_home;
          self->_home = 0;

          v81 = self->_zone;
          self->_zone = 0;

          v82 = self->_room;
          self->_room = 0;

          v83 = self->_service;
          self->_service = 0;

          v84 = self->_serviceGroup;
          self->_serviceGroup = 0;

          v85 = self->_scene;
          self->_scene = 0;

          v86 = self->_trigger;
          self->_trigger = 0;

          self->_entityType = 8;
        }
        break;
      default:
        if (CCPBReaderSkipValueWithTag())
        {
          id v10 = 0;
        }
        else
        {
          v87 = (objc_class *)objc_opt_class();
          v88 = NSStringFromClass(v87);
          CCSkipFieldErrorForMessage();
          id v10 = (id)objc_claimAutoreleasedReturnValue();
        }
        break;
    }
  }
  while (*(void *)&v6[*v7] < *(void *)&v6[*v8]);
  if (v10)
  {
    CCSetError();
  }
  else
  {
LABEL_48:
    if (!*(void *)&v6[*v9])
    {
      id v10 = 0;
      BOOL v92 = 1;
      goto LABEL_52;
    }
LABEL_49:
    v89 = (objc_class *)objc_opt_class();
    v90 = NSStringFromClass(v89);
    v91 = CCInvalidBufferErrorForMessage();
    CCSetError();

    id v10 = 0;
  }
  BOOL v92 = 0;
LABEL_52:

  return v92;
}

- (CCHomeContent)initWithEntity:(id)a3 entityType:(unsigned int)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = objc_opt_new();
  if (v8 && a4 == 1)
  {
    objc_opt_class();
    int IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    id v11 = 0;
    if (IsInstanceOfExpectedClass) {
      goto LABEL_32;
    }
LABEL_34:
    CCSetError();
    v21 = 0;
    goto LABEL_35;
  }
  if (v8 && a4 == 2)
  {
    objc_opt_class();
    int v12 = CCValidateIsInstanceOfExpectedClass();
    id v11 = 0;
    if (v12) {
      goto LABEL_32;
    }
    goto LABEL_34;
  }
  if (v8 && a4 == 3)
  {
    objc_opt_class();
    int v13 = CCValidateIsInstanceOfExpectedClass();
    id v11 = 0;
    if (v13) {
      goto LABEL_32;
    }
    goto LABEL_34;
  }
  if (v8 && a4 == 4)
  {
    objc_opt_class();
    int v14 = CCValidateIsInstanceOfExpectedClass();
    id v11 = 0;
    if (v14) {
      goto LABEL_32;
    }
    goto LABEL_34;
  }
  if (v8 && a4 == 5)
  {
    objc_opt_class();
    int v15 = CCValidateIsInstanceOfExpectedClass();
    id v11 = 0;
    if (v15) {
      goto LABEL_32;
    }
    goto LABEL_34;
  }
  if (v8 && a4 == 6)
  {
    objc_opt_class();
    int v16 = CCValidateIsInstanceOfExpectedClass();
    id v11 = 0;
    if (v16) {
      goto LABEL_32;
    }
    goto LABEL_34;
  }
  if (v8 && a4 == 7)
  {
    objc_opt_class();
    int v17 = CCValidateIsInstanceOfExpectedClass();
    id v11 = 0;
    if (v17) {
      goto LABEL_32;
    }
    goto LABEL_34;
  }
  id v11 = 0;
  if (!v8 || a4 != 8) {
    goto LABEL_33;
  }
  objc_opt_class();
  uint64_t v23 = 0;
  int v18 = CCValidateIsInstanceOfExpectedClass();
  id v11 = 0;
  if (!v18) {
    goto LABEL_34;
  }
LABEL_32:
  v19 = [v8 data];
  CCPBDataWriterWriteDataField();

LABEL_33:
  v20 = objc_msgSend(v9, "immutableData", v23);
  self = [(CCItemMessage *)self initWithData:v20 error:a5];

  v21 = self;
LABEL_35:

  return v21;
}

+ (Class)contentMessageClass
{
  return (Class)objc_opt_class();
}

+ (Class)metaContentMessageClass
{
  return (Class)objc_opt_class();
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  if ((a3 - 7690) > 0x14) {
    return 0;
  }
  else {
    return off_26539C640[(unsigned __int16)(a3 - 7690)];
  }
}

+ (unsigned)itemType
{
  return 7690;
}

@end