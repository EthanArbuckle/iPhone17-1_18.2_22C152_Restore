@interface GSRemoveAdditionSpec
+ (id)GSRemoveAdditionSpecWithAdditionDictionary:(id)a3;
+ (id)calculateSpecForAdditionRemovalUnderPath:(id)a3;
- (GSRemoveAdditionSpec)initWithAdditionDictionary:(id)a3;
- (NSNumber)storageID;
- (NSString)name;
- (NSString)nameSpace;
- (id)description;
- (void)setName:(id)a3;
- (void)setNameSpace:(id)a3;
- (void)setStorageID:(id)a3;
@end

@implementation GSRemoveAdditionSpec

- (GSRemoveAdditionSpec)initWithAdditionDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GSRemoveAdditionSpec;
  v5 = [(GSRemoveAdditionSpec *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"u"];
    uint64_t v7 = [v6 lastPathComponent];
    name = v5->_name;
    v5->_name = (NSString *)v7;

    uint64_t v9 = [v4 objectForKey:@"ns"];
    nameSpace = v5->_nameSpace;
    v5->_nameSpace = (NSString *)v9;

    uint64_t v11 = [v4 objectForKey:@"sID"];
    storageID = v5->_storageID;
    v5->_storageID = (NSNumber *)v11;
  }
  return v5;
}

+ (id)GSRemoveAdditionSpecWithAdditionDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [[GSRemoveAdditionSpec alloc] initWithAdditionDictionary:v3];

  return v4;
}

+ (id)calculateSpecForAdditionRemovalUnderPath:(id)a3
{
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v34;
    uint64_t v24 = *(void *)v34;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_30:

          id v16 = 0;
          goto LABEL_31;
        }
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v9 = v8;
        id v10 = [v9 countByEnumeratingWithState:&v29 objects:v38 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v30;
          while (2)
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v30 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * (void)j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_29;
              }
              v15 = [v9 objectForKeyedSubscript:v14];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {

LABEL_29:
                    goto LABEL_30;
                  }
                }
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v29 objects:v38 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        uint64_t v6 = v24;
      }
      id v5 = [v3 countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v16 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v17 = v3;
  id v18 = [v17 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (k = 0; k != v19; k = (char *)k + 1)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = +[GSRemoveAdditionSpec GSRemoveAdditionSpecWithAdditionDictionary:*(void *)(*((void *)&v25 + 1) + 8 * (void)k)];
        [v16 addObject:v22];
      }
      id v19 = [v17 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v19);
  }

LABEL_31:
  return v16;
}

- (id)description
{
  return +[NSString stringWithFormat:@"n:%@ ns:%@ sID: %@", self->_name, self->_nameSpace, self->_storageID];
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSNumber)storageID
{
  return self->_storageID;
}

- (void)setStorageID:(id)a3
{
}

- (NSString)nameSpace
{
  return self->_nameSpace;
}

- (void)setNameSpace:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameSpace, 0);
  objc_storeStrong((id *)&self->_storageID, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end