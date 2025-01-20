@interface AMDDODMLAttachmentProcessor
- (AMDDODMLAttachmentProcessor)initWithAttachmentURLs:(id)a3 withInstructions:(id)a4 error:(id *)a5 errorDomain:(id)a6;
- (AMDDODMLAttachmentProcessor)initWithHashMapDictionary:(id)a3 withDownSampleDictionary:(id)a4 withNegSampleDictionary:(id)a5;
- (id)downSampleDictionaryForKey:(id)a3;
- (id)getURLFromURLArray:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)hashMapForKey:(id)a3;
- (id)negSampleArrayForKey:(id)a3;
- (id)readDownSampleDictionary:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6;
- (id)readDownSampleDictionaryBytes:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6;
- (id)readHashMapDictionary:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6;
- (id)readHashMapDictionaryBytes:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6;
- (id)readNegativeSampleArray:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6;
- (id)readNegativeSampleArrayBytes:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6;
- (id)readWeightsArrayBytes:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6;
- (id)setHashMap:(id)a3 forKey:(id)a4;
- (id)weightsArray;
@end

@implementation AMDDODMLAttachmentProcessor

- (AMDDODMLAttachmentProcessor)initWithHashMapDictionary:(id)a3 withDownSampleDictionary:(id)a4 withNegSampleDictionary:(id)a5
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v12 = 0;
  objc_storeStrong(&v12, a5);
  v5 = v15;
  v15 = 0;
  v11.receiver = v5;
  v11.super_class = (Class)AMDDODMLAttachmentProcessor;
  v10 = [(AMDDODMLAttachmentProcessor *)&v11 init];
  v15 = v10;
  objc_storeStrong((id *)&v15, v10);
  if (v10)
  {
    objc_storeStrong((id *)&v15->_hashMapAttachments, location[0]);
    objc_storeStrong((id *)&v15->_downSampleAttachments, v13);
    objc_storeStrong((id *)&v15->_negSampleAttachements, v12);
  }
  v7 = v15;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v15, 0);
  return v7;
}

- (AMDDODMLAttachmentProcessor)initWithAttachmentURLs:(id)a3 withInstructions:(id)a4 error:(id *)a5 errorDomain:(id)a6
{
  id v47 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v45 = 0;
  objc_storeStrong(&v45, a4);
  v44 = a5;
  id v43 = 0;
  objc_storeStrong(&v43, a6);
  id v6 = v47;
  id v47 = 0;
  v42.receiver = v6;
  v42.super_class = (Class)AMDDODMLAttachmentProcessor;
  v36 = [(AMDDODMLAttachmentProcessor *)&v42 init];
  id v47 = v36;
  objc_storeStrong(&v47, v36);
  if (v36)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v8 = (void *)*((void *)v47 + 1);
    *((void *)v47 + 1) = v7;

    id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v10 = (void *)*((void *)v47 + 2);
    *((void *)v47 + 2) = v9;

    id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v12 = (void *)*((void *)v47 + 3);
    *((void *)v47 + 3) = v11;

    for (unint64_t i = 0; ; ++i)
    {
      unint64_t v32 = i;
      if (v32 >= [v45 count]) {
        goto LABEL_27;
      }
      id v40 = (id)[v45 objectAtIndex:i];
      id v39 = (id)[v40 objectForKey:FunctionName];
      if (!v39)
      {
        id v13 = objc_alloc(MEMORY[0x263F087E8]);
        id v14 = (id)[v13 initWithDomain:v43 code:50 userInfo:0];
        id *v44 = v14;
        v48 = 0;
        int v38 = 1;
        goto LABEL_25;
      }
      id v37 = 0;
      if ([v39 isEqual:HashMapFile])
      {
        id v15 = (id)[v47 readHashMapDictionary:v40 withAttachments:location[0] error:v44 errorDomain:v43];
        id v16 = v37;
        id v37 = v15;

        goto LABEL_21;
      }
      if ([v39 isEqual:HashMapFileBytes])
      {
        id v17 = (id)[v47 readHashMapDictionaryBytes:v40 withAttachments:location[0] error:v44 errorDomain:v43];
        id v18 = v37;
        id v37 = v17;

        goto LABEL_21;
      }
      if ([v39 isEqual:NegativeSampleFile])
      {
        id v19 = (id)[v47 readNegativeSampleArray:v40 withAttachments:location[0] error:v44 errorDomain:v43];
        id v20 = v37;
        id v37 = v19;

        goto LABEL_21;
      }
      if ([v39 isEqual:NegativeSampleFileBytes])
      {
        id v21 = (id)[v47 readNegativeSampleArrayBytes:v40 withAttachments:location[0] error:v44 errorDomain:v43];
        id v22 = v37;
        id v37 = v21;

        goto LABEL_21;
      }
      if ([v39 isEqual:DownSampleFile])
      {
        id v23 = (id)[v47 readDownSampleDictionary:v40 withAttachments:location[0] error:v44 errorDomain:v43];
        id v24 = v37;
        id v37 = v23;

        goto LABEL_21;
      }
      if ([v39 isEqual:DownSampleFileBytes]) {
        break;
      }
      if ([v39 isEqual:WeightsFileBytes])
      {
        id v27 = (id)[v47 readWeightsArrayBytes:v40 withAttachments:location[0] error:v44 errorDomain:v43];
        id v28 = v37;
        id v37 = v27;

LABEL_21:
        if (v37)
        {
          int v38 = 0;
        }
        else
        {
          v48 = 0;
          int v38 = 1;
        }
        goto LABEL_24;
      }
      id v29 = objc_alloc(MEMORY[0x263F087E8]);
      id v30 = (id)[v29 initWithDomain:v43 code:50 userInfo:0];
      id *v44 = v30;
      v48 = 0;
      int v38 = 1;
LABEL_24:
      objc_storeStrong(&v37, 0);
LABEL_25:
      objc_storeStrong(&v39, 0);
      objc_storeStrong(&v40, 0);
      if (v38) {
        goto LABEL_28;
      }
    }
    id v25 = (id)[v47 readDownSampleDictionaryBytes:v40 withAttachments:location[0] error:v44 errorDomain:v43];
    id v26 = v37;
    id v37 = v25;

    goto LABEL_21;
  }
LABEL_27:
  v48 = (AMDDODMLAttachmentProcessor *)v47;
  int v38 = 1;
LABEL_28:
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v47, 0);
  return v48;
}

- (id)hashMapForKey:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = (id)[(NSMutableDictionary *)v6->_hashMapAttachments objectForKey:location[0]];
  objc_storeStrong(location, 0);

  return v4;
}

- (id)setHashMap:(id)a3 forKey:(id)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  [(NSMutableDictionary *)v9->_hashMapAttachments setObject:location[0] forKey:v7];
  id v6 = (id)[NSNumber numberWithLong:1];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);

  return v6;
}

- (id)downSampleDictionaryForKey:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = (id)[(NSMutableDictionary *)v6->_downSampleAttachments objectForKey:location[0]];
  objc_storeStrong(location, 0);

  return v4;
}

- (id)negSampleArrayForKey:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = (id)[(NSMutableDictionary *)v6->_negSampleAttachements objectForKey:location[0]];
  objc_storeStrong(location, 0);

  return v4;
}

- (id)weightsArray
{
  return self->_weightAttachment;
}

- (id)getURLFromURLArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = a4;
  id v15 = 0;
  objc_storeStrong(&v15, a5);
  if ([location[0] count])
  {
    if ((unint64_t)[location[0] count] <= 1)
    {
      id v13 = (id)[location[0] firstObject];
      id v18 = v13;
      int v14 = 1;
      objc_storeStrong(&v13, 0);
    }
    else
    {
      id v7 = objc_alloc(MEMORY[0x263F087E8]);
      id v8 = (id)[v7 initWithDomain:v15 code:95 userInfo:0];
      *id v16 = v8;
      id v18 = 0;
      int v14 = 1;
    }
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x263F087E8]);
    id v6 = (id)[v5 initWithDomain:v15 code:94 userInfo:0];
    *id v16 = v6;
    id v18 = 0;
    int v14 = 1;
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  id v9 = v18;

  return v9;
}

- (id)readNegativeSampleArray:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v33 = 0;
  objc_storeStrong(&v33, a4);
  unint64_t v32 = a5;
  id v31 = 0;
  objc_storeStrong(&v31, a6);
  id v30 = (id)[location[0] objectForKey:FileBaseName];
  id v29 = (id)[location[0] objectForKey:OutputArray];
  if (v30 && v29)
  {
    id v27 = (id)[v33 attachmentURLsForBasename:v30];
    id v26 = [(AMDDODMLAttachmentProcessor *)v35 getURLFromURLArray:v27 error:v32 errorDomain:v31];
    if (v26)
    {
      id v25 = (id)[NSString stringWithContentsOfURL:v26 encoding:4 error:v32];
      if ([v25 isEqual:0])
      {
        id v36 = 0;
        int v28 = 1;
      }
      else
      {
        id v24 = (id)[v25 componentsSeparatedByString:@"\n"];
        id v23 = objc_alloc_init(MEMORY[0x263EFF980]);
        memset(__b, 0, sizeof(__b));
        id v16 = v24;
        uint64_t v17 = [v16 countByEnumeratingWithState:__b objects:v37 count:16];
        if (v17)
        {
          uint64_t v13 = *(void *)__b[2];
          uint64_t v14 = 0;
          unint64_t v15 = v17;
          while (1)
          {
            uint64_t v12 = v14;
            if (*(void *)__b[2] != v13) {
              objc_enumerationMutation(v16);
            }
            id v22 = *(id *)(__b[1] + 8 * v14);
            id v10 = v23;
            id v11 = (id)objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v22, "longLongValue"));
            objc_msgSend(v10, "addObject:");

            ++v14;
            if (v12 + 1 >= v15)
            {
              uint64_t v14 = 0;
              unint64_t v15 = [v16 countByEnumeratingWithState:__b objects:v37 count:16];
              if (!v15) {
                break;
              }
            }
          }
        }

        [(NSMutableDictionary *)v35->_negSampleAttachements setObject:v23 forKey:v29];
        id v36 = (id)[NSNumber numberWithLong:1];
        int v28 = 1;
        objc_storeStrong(&v23, 0);
        objc_storeStrong(&v24, 0);
      }
      objc_storeStrong(&v25, 0);
    }
    else
    {
      id v36 = 0;
      int v28 = 1;
    }
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v27, 0);
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263F087E8]);
    id v7 = (id)[v6 initWithDomain:v31 code:51 userInfo:0];
    *unint64_t v32 = v7;
    id v36 = 0;
    int v28 = 1;
  }
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
  id v8 = v36;

  return v8;
}

- (id)readNegativeSampleArrayBytes:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6
{
  id v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v29 = 0;
  objc_storeStrong(&v29, a4);
  int v28 = a5;
  id v27 = 0;
  objc_storeStrong(&v27, a6);
  id v26 = (id)[location[0] objectForKey:FileBaseName];
  id v25 = (id)[location[0] objectForKey:OutputArray];
  if (v26 && v25)
  {
    id v23 = (id)[v29 attachmentURLsForBasename:v26];
    id v22 = [(AMDDODMLAttachmentProcessor *)v31 getURLFromURLArray:v23 error:v28 errorDomain:v27];
    if (v22)
    {
      id v21 = (id)[MEMORY[0x263EFF8F8] dataWithContentsOfURL:v22 options:1 error:v28];
      if (v21)
      {
        if ([v21 length] % 8uLL)
        {
          id v8 = objc_alloc(MEMORY[0x263F087E8]);
          id v9 = (id)[v8 initWithDomain:v27 code:59 userInfo:0];
          *int v28 = v9;
          id v32 = 0;
          int v24 = 1;
        }
        else
        {
          id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
          for (unint64_t i = 0; ; ++i)
          {
            unint64_t v14 = i;
            if (v14 >= [v21 length] / 8uLL) {
              break;
            }
            double v18 = 0.0;
            uint64_t v34 = 8 * i;
            uint64_t v33 = 8;
            uint64_t v35 = 8 * i;
            uint64_t v36 = 8;
            objc_msgSend(v21, "getBytes:range:", &v18, 8 * i, 8);
            id v12 = v20;
            id v13 = (id)[NSNumber numberWithDouble:v18];
            objc_msgSend(v12, "addObject:");
          }
          [(NSMutableDictionary *)v31->_negSampleAttachements setObject:v20 forKey:v25];
          id v32 = (id)[NSNumber numberWithLong:1];
          int v24 = 1;
          objc_storeStrong(&v20, 0);
        }
      }
      else
      {
        id v32 = 0;
        int v24 = 1;
      }
      objc_storeStrong(&v21, 0);
    }
    else
    {
      id v32 = 0;
      int v24 = 1;
    }
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v23, 0);
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263F087E8]);
    id v7 = (id)[v6 initWithDomain:v27 code:52 userInfo:0];
    *int v28 = v7;
    id v32 = 0;
    int v24 = 1;
  }
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  id v10 = v32;

  return v10;
}

- (id)readDownSampleDictionary:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  objc_super v42 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v40 = 0;
  objc_storeStrong(&v40, a4);
  id v39 = a5;
  id v38 = 0;
  objc_storeStrong(&v38, a6);
  id v37 = (id)[location[0] objectForKey:FileBaseName];
  id v36 = (id)[location[0] objectForKey:OutputDictionary];
  if (v37 && v36)
  {
    id v34 = (id)[v40 attachmentURLsForBasename:v37];
    id v33 = [(AMDDODMLAttachmentProcessor *)v42 getURLFromURLArray:v34 error:v39 errorDomain:v38];
    if (v33)
    {
      id v32 = (id)[NSString stringWithContentsOfURL:v33 encoding:4 error:v39];
      if ([v32 isEqual:0])
      {
        id v43 = 0;
        int v35 = 1;
      }
      else
      {
        id v31 = (id)[v32 componentsSeparatedByString:@"\n"];
        id v30 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        memset(__b, 0, sizeof(__b));
        id v20 = v31;
        uint64_t v21 = [v20 countByEnumeratingWithState:__b objects:v44 count:16];
        if (v21)
        {
          uint64_t v17 = *(void *)__b[2];
          uint64_t v18 = 0;
          unint64_t v19 = v21;
          while (1)
          {
            uint64_t v16 = v18;
            if (*(void *)__b[2] != v17) {
              objc_enumerationMutation(v20);
            }
            id v29 = *(id *)(__b[1] + 8 * v18);
            id v27 = (id)[v29 componentsSeparatedByString:@","];
            if ([v27 count] == 2)
            {
              id v12 = NSNumber;
              id v13 = (id)[v27 objectAtIndexedSubscript:0];
              id v26 = (id)objc_msgSend(v12, "numberWithLong:", objc_msgSend(v13, "longLongValue"));

              unint64_t v14 = NSNumber;
              id v15 = (id)[v27 objectAtIndexedSubscript:1];
              [v15 doubleValue];
              id v25 = (id)objc_msgSend(v14, "numberWithDouble:");

              [v30 setObject:v25 forKey:v26];
              objc_storeStrong(&v25, 0);
              objc_storeStrong(&v26, 0);
              int v35 = 0;
            }
            else
            {
              id v8 = objc_alloc(MEMORY[0x263F087E8]);
              id v9 = (id)[v8 initWithDomain:v38 code:14 userInfo:0];
              *id v39 = v9;
              id v43 = 0;
              int v35 = 1;
            }
            objc_storeStrong(&v27, 0);
            if (v35) {
              break;
            }
            ++v18;
            if (v16 + 1 >= v19)
            {
              uint64_t v18 = 0;
              unint64_t v19 = [v20 countByEnumeratingWithState:__b objects:v44 count:16];
              if (!v19) {
                goto LABEL_18;
              }
            }
          }
        }
        else
        {
LABEL_18:
          int v35 = 0;
        }

        if (!v35)
        {
          [(NSMutableDictionary *)v42->_downSampleAttachments setObject:v30 forKey:v36];
          id v43 = (id)[NSNumber numberWithLong:1];
          int v35 = 1;
        }
        objc_storeStrong(&v30, 0);
        objc_storeStrong(&v31, 0);
      }
      objc_storeStrong(&v32, 0);
    }
    else
    {
      id v43 = 0;
      int v35 = 1;
    }
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v34, 0);
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263F087E8]);
    id v7 = (id)[v6 initWithDomain:v38 code:53 userInfo:0];
    *id v39 = v7;
    id v43 = 0;
    int v35 = 1;
  }
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(location, 0);
  id v10 = v43;

  return v10;
}

- (id)readDownSampleDictionaryBytes:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6
{
  id v39 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v37 = 0;
  objc_storeStrong(&v37, a4);
  id v36 = a5;
  id v35 = 0;
  objc_storeStrong(&v35, a6);
  id v34 = (id)[location[0] objectForKey:FileBaseName];
  id v33 = (id)[location[0] objectForKey:SecondFileBaseName];
  id v32 = (id)[location[0] objectForKey:OutputDictionary];
  if (v34 && v33 && v32)
  {
    id v30 = (id)[v37 attachmentURLsForBasename:v34];
    id v29 = (id)[v37 attachmentURLsForBasename:v33];
    id v28 = [(AMDDODMLAttachmentProcessor *)v39 getURLFromURLArray:v30 error:v36 errorDomain:v35];
    id v27 = [(AMDDODMLAttachmentProcessor *)v39 getURLFromURLArray:v29 error:v36 errorDomain:v35];
    if (v28 && v27)
    {
      id v26 = (id)objc_msgSend(MEMORY[0x263EFF8F8], "dataWithContentsOfURL:options:error:", v28);
      id v25 = (id)[MEMORY[0x263EFF8F8] dataWithContentsOfURL:v27 options:1 error:v36];
      if (v26 && v25)
      {
        uint64_t v15 = [v26 length];
        if (v15 == [v25 length])
        {
          if ([v26 length] % 8uLL)
          {
            id v10 = objc_alloc(MEMORY[0x263F087E8]);
            id v11 = (id)[v10 initWithDomain:v35 code:59 userInfo:0];
            id *v36 = v11;
            id v40 = 0;
            int v31 = 1;
          }
          else
          {
            id v24 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            for (unint64_t i = 0; ; ++i)
            {
              unint64_t v14 = i;
              if (v14 >= [v26 length] / 8uLL) {
                break;
              }
              uint64_t v22 = 0;
              uint64_t v46 = 8 * i;
              uint64_t v45 = 8;
              uint64_t v47 = 8 * i;
              uint64_t v48 = 8;
              *(void *)&v21[1] = 8 * i;
              *(void *)&v21[2] = 8;
              objc_msgSend(v26, "getBytes:range:", &v22, 8 * i, 8);
              v21[0] = 0.0;
              uint64_t v42 = 8 * i;
              uint64_t v41 = 8;
              uint64_t v43 = 8 * i;
              uint64_t v44 = 8;
              v20[1] = (id)(8 * i);
              v20[2] = (id)8;
              objc_msgSend(v25, "getBytes:range:", v21, 8 * i, 8);
              v20[0] = (id)[NSNumber numberWithLong:v22];
              id v19 = (id)[NSNumber numberWithDouble:v21[0]];
              [v24 setObject:v19 forKey:v20[0]];
              objc_storeStrong(&v19, 0);
              objc_storeStrong(v20, 0);
            }
            [(NSMutableDictionary *)v39->_downSampleAttachments setObject:v24 forKey:v32];
            id v40 = (id)[NSNumber numberWithLong:1];
            int v31 = 1;
            objc_storeStrong(&v24, 0);
          }
        }
        else
        {
          id v8 = objc_alloc(MEMORY[0x263F087E8]);
          id v9 = (id)[v8 initWithDomain:v35 code:58 userInfo:0];
          id *v36 = v9;
          id v40 = 0;
          int v31 = 1;
        }
      }
      else
      {
        id v40 = 0;
        int v31 = 1;
      }
      objc_storeStrong(&v25, 0);
      objc_storeStrong(&v26, 0);
    }
    else
    {
      id v40 = 0;
      int v31 = 1;
    }
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263F087E8]);
    id v7 = (id)[v6 initWithDomain:v35 code:54 userInfo:0];
    id *v36 = v7;
    id v40 = 0;
    int v31 = 1;
  }
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
  id v12 = v40;

  return v12;
}

- (id)readHashMapDictionary:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v42 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v40 = 0;
  objc_storeStrong(&v40, a4);
  id v39 = a5;
  id v38 = 0;
  objc_storeStrong(&v38, a6);
  id v37 = (id)[location[0] objectForKey:FileBaseName];
  id v36 = (id)[location[0] objectForKey:OutputDictionary];
  if (v37 && v36)
  {
    id v34 = (id)[v40 attachmentURLsForBasename:v37];
    id v33 = [(AMDDODMLAttachmentProcessor *)v42 getURLFromURLArray:v34 error:v39 errorDomain:v38];
    if (v33)
    {
      id v32 = (id)[NSString stringWithContentsOfURL:v33 encoding:4 error:v39];
      if ([v32 isEqual:0])
      {
        id v43 = 0;
        int v35 = 1;
      }
      else
      {
        id v31 = (id)[v32 componentsSeparatedByString:@"\n"];
        id v30 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        memset(__b, 0, sizeof(__b));
        id v20 = v31;
        uint64_t v21 = [v20 countByEnumeratingWithState:__b objects:v44 count:16];
        if (v21)
        {
          uint64_t v17 = *(void *)__b[2];
          uint64_t v18 = 0;
          unint64_t v19 = v21;
          while (1)
          {
            uint64_t v16 = v18;
            if (*(void *)__b[2] != v17) {
              objc_enumerationMutation(v20);
            }
            id v29 = *(id *)(__b[1] + 8 * v18);
            id v27 = (id)[v29 componentsSeparatedByString:@","];
            if ([v27 count] == 2)
            {
              id v12 = NSNumber;
              id v13 = (id)[v27 objectAtIndexedSubscript:0];
              id v26 = (id)objc_msgSend(v12, "numberWithLong:", objc_msgSend(v13, "longLongValue"));

              unint64_t v14 = NSNumber;
              id v15 = (id)[v27 objectAtIndexedSubscript:1];
              id v25 = (id)objc_msgSend(v14, "numberWithLong:", objc_msgSend(v15, "longLongValue"));

              [v30 setObject:v25 forKey:v26];
              objc_storeStrong(&v25, 0);
              objc_storeStrong(&v26, 0);
              int v35 = 0;
            }
            else
            {
              id v8 = objc_alloc(MEMORY[0x263F087E8]);
              id v9 = (id)[v8 initWithDomain:v38 code:14 userInfo:0];
              *id v39 = v9;
              id v43 = 0;
              int v35 = 1;
            }
            objc_storeStrong(&v27, 0);
            if (v35) {
              break;
            }
            ++v18;
            if (v16 + 1 >= v19)
            {
              uint64_t v18 = 0;
              unint64_t v19 = [v20 countByEnumeratingWithState:__b objects:v44 count:16];
              if (!v19) {
                goto LABEL_18;
              }
            }
          }
        }
        else
        {
LABEL_18:
          int v35 = 0;
        }

        if (!v35)
        {
          [(NSMutableDictionary *)v42->_hashMapAttachments setObject:v30 forKey:v36];
          id v43 = (id)[NSNumber numberWithLong:1];
          int v35 = 1;
        }
        objc_storeStrong(&v30, 0);
        objc_storeStrong(&v31, 0);
      }
      objc_storeStrong(&v32, 0);
    }
    else
    {
      id v43 = 0;
      int v35 = 1;
    }
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v34, 0);
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263F087E8]);
    id v7 = (id)[v6 initWithDomain:v38 code:55 userInfo:0];
    *id v39 = v7;
    id v43 = 0;
    int v35 = 1;
  }
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(location, 0);
  id v10 = v43;

  return v10;
}

- (id)readHashMapDictionaryBytes:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6
{
  id v39 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v37 = 0;
  objc_storeStrong(&v37, a4);
  id v36 = a5;
  id v35 = 0;
  objc_storeStrong(&v35, a6);
  id v34 = (id)[location[0] objectForKey:FileBaseName];
  id v33 = (id)[location[0] objectForKey:SecondFileBaseName];
  id v32 = (id)[location[0] objectForKey:OutputDictionary];
  if (v34 && v33 && v32)
  {
    id v30 = (id)[v37 attachmentURLsForBasename:v34];
    id v29 = [(AMDDODMLAttachmentProcessor *)v39 getURLFromURLArray:v30 error:v36 errorDomain:v35];
    id v28 = (id)[v37 attachmentURLsForBasename:v33];
    id v27 = [(AMDDODMLAttachmentProcessor *)v39 getURLFromURLArray:v28 error:v36 errorDomain:v35];
    if (v29 && v27)
    {
      id v26 = (id)objc_msgSend(MEMORY[0x263EFF8F8], "dataWithContentsOfURL:options:error:", v29);
      id v25 = (id)[MEMORY[0x263EFF8F8] dataWithContentsOfURL:v27 options:1 error:v36];
      if (v25 && v26)
      {
        uint64_t v15 = [v26 length];
        if (v15 == [v25 length])
        {
          if ([v26 length] % 8uLL)
          {
            id v10 = objc_alloc(MEMORY[0x263F087E8]);
            id v11 = (id)[v10 initWithDomain:v35 code:59 userInfo:0];
            id *v36 = v11;
            id v40 = 0;
            int v31 = 1;
          }
          else
          {
            id v24 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            for (unint64_t i = 0; ; ++i)
            {
              unint64_t v14 = i;
              if (v14 >= [v26 length] / 8uLL) {
                break;
              }
              uint64_t v22 = 0;
              uint64_t v46 = 8 * i;
              uint64_t v45 = 8;
              uint64_t v47 = 8 * i;
              uint64_t v48 = 8;
              v21[1] = 8 * i;
              v21[2] = 8;
              objc_msgSend(v26, "getBytes:range:", &v22, 8 * i, 8);
              v21[0] = 0;
              uint64_t v42 = 8 * i;
              uint64_t v41 = 8;
              uint64_t v43 = 8 * i;
              uint64_t v44 = 8;
              v20[1] = (id)(8 * i);
              v20[2] = (id)8;
              objc_msgSend(v25, "getBytes:range:", v21, 8 * i, 8);
              v20[0] = (id)[NSNumber numberWithLong:v22];
              id v19 = (id)[NSNumber numberWithLong:v21[0]];
              [v24 setObject:v19 forKey:v20[0]];
              objc_storeStrong(&v19, 0);
              objc_storeStrong(v20, 0);
            }
            [(NSMutableDictionary *)v39->_hashMapAttachments setObject:v24 forKey:v32];
            id v40 = (id)[NSNumber numberWithLong:1];
            int v31 = 1;
            objc_storeStrong(&v24, 0);
          }
        }
        else
        {
          id v8 = objc_alloc(MEMORY[0x263F087E8]);
          id v9 = (id)[v8 initWithDomain:v35 code:58 userInfo:0];
          id *v36 = v9;
          id v40 = 0;
          int v31 = 1;
        }
      }
      else
      {
        id v40 = 0;
        int v31 = 1;
      }
      objc_storeStrong(&v25, 0);
      objc_storeStrong(&v26, 0);
    }
    else
    {
      id v40 = 0;
      int v31 = 1;
    }
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263F087E8]);
    id v7 = (id)[v6 initWithDomain:v35 code:56 userInfo:0];
    id *v36 = v7;
    id v40 = 0;
    int v31 = 1;
  }
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
  id v12 = v40;

  return v12;
}

- (id)readWeightsArrayBytes:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6
{
  uint64_t v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  objc_storeStrong(&v20, a4);
  id v19 = a5;
  id v18 = 0;
  objc_storeStrong(&v18, a6);
  id v17 = (id)[location[0] objectForKey:FileBaseName];
  if (v17)
  {
    id v15 = (id)[v20 attachmentURLsForBasename:v17];
    id v14 = [(AMDDODMLAttachmentProcessor *)v22 getURLFromURLArray:v15 error:v19 errorDomain:v18];
    if (v14)
    {
      id v13 = (id)[MEMORY[0x263EFF8F8] dataWithContentsOfURL:v14 options:1 error:v19];
      if (v13)
      {
        objc_storeStrong((id *)&v22->_weightAttachment, v13);
        id v23 = (id)[NSNumber numberWithLong:1];
      }
      else
      {
        id v23 = 0;
      }
      int v16 = 1;
      objc_storeStrong(&v13, 0);
    }
    else
    {
      id v23 = 0;
      int v16 = 1;
    }
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263F087E8]);
    id v7 = (id)[v6 initWithDomain:v18 code:113 userInfo:0];
    *id v19 = v7;
    id v23 = 0;
    int v16 = 1;
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  id v8 = v23;

  return v8;
}

- (void).cxx_destruct
{
}

@end