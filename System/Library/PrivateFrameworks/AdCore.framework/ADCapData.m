@interface ADCapData
+ (id)sharedInstance;
- (ADCapData)init;
- (ADCapData)initWithStorageType:(int64_t)a3;
- (ADCapData)initWithStorageType:(int64_t)a3 keychainKey:(id)a4 title:(id)a5;
- (NSMutableArray)clickCountData;
- (NSMutableArray)downloadData;
- (NSMutableArray)frequencyCapData;
- (NSString)keychainKey;
- (NSString)title;
- (NSString)toroID;
- (id)capData:(id)a3;
- (id)capDataJSON:(id)a3;
- (id)clickCapObjectForAdamID:(id)a3;
- (id)dictionaryRepresentation;
- (id)downloadObjectForAdamID:(id)a3;
- (id)filteredCapData:(id)a3 maxItems:(unint64_t)a4 expirationThresholdInSeconds:(double)a5;
- (id)restoreCapDataArrayFromPlist:(id)a3;
- (int64_t)storageType;
- (void)addCapDataObject:(id)a3 ofKind:(int64_t)a4;
- (void)checkAndUpdateToroID;
- (void)eraseCapData;
- (void)resetCapDataObject;
- (void)restoreAllCapData;
- (void)saveCapDataWithReason:(id)a3;
- (void)setClickCountData:(id)a3;
- (void)setDownloadData:(id)a3;
- (void)setFrequencyCapData:(id)a3;
- (void)setKeychainKey:(id)a3;
- (void)setStorageType:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setToroID:(id)a3;
- (void)updateCapDataWith:(id)a3 ofKind:(int64_t)a4;
@end

@implementation ADCapData

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__ADCapData_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__onceToken != -1) {
    dispatch_once(&sharedInstance__onceToken, block);
  }
  v2 = (void *)sharedInstance__instance;
  return v2;
}

uint64_t __27__ADCapData_sharedInstance__block_invoke()
{
  sharedInstance__instance = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x1F41817F8]();
}

- (ADCapData)init
{
  return [(ADCapData *)self initWithStorageType:0 keychainKey:@"ADCapDataKeychainKey" title:@"Results"];
}

- (ADCapData)initWithStorageType:(int64_t)a3 keychainKey:(id)a4 title:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ADCapData;
  v11 = [(ADCapData *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_storageType = a3;
    objc_storeStrong((id *)&v11->_keychainKey, a4);
    objc_storeStrong((id *)&v12->_title, a5);
    [(ADCapData *)v12 restoreAllCapData];
  }

  return v12;
}

- (void)restoreAllCapData
{
  OSStatus v33 = 0;
  v3 = [(ADCapData *)self keychainKey];
  v4 = ADCopyDataFromKeychain(v3, &v33);

  if (v4)
  {
    id v32 = 0;
    v5 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:&v32];
    id v6 = v32;
    if (v6)
    {
      v7 = NSString;
      v8 = [(ADCapData *)self title];
      id v9 = [v7 stringWithFormat:@"Error restoring cap data for %@ %@", v8, v6];
      _ADLog(@"ToroLogging", v9, 16);

      [(ADCapData *)self resetCapDataObject];
    }
    else
    {
      v13 = [v5 objectForKey:@"ADToroIDKey"];
      toroID = self->_toroID;
      self->_toroID = v13;

      if (self->_toroID)
      {
        v15 = [v5 objectForKey:@"ADFrequencyCapTypeKey"];
        v16 = [(ADCapData *)self restoreCapDataArrayFromPlist:v15];
        frequencyCapData = self->_frequencyCapData;
        self->_frequencyCapData = v16;

        v18 = [v5 objectForKey:@"ADToroClickTypeKey"];
        v19 = [(ADCapData *)self restoreCapDataArrayFromPlist:v18];
        clickCountData = self->_clickCountData;
        self->_clickCountData = v19;

        v21 = [v5 objectForKey:@"ADDownloadTypeKey"];
        v22 = [(ADCapData *)self restoreCapDataArrayFromPlist:v21];
        downloadData = self->_downloadData;
        self->_downloadData = v22;
      }
      else
      {
        v24 = NSString;
        v25 = [(ADCapData *)self title];
        v26 = [v24 stringWithFormat:@"Unable to restore Toro ID for ADCapData for %@. Please file a radar...", v25];
        _ADLog(@"ToroLogging", v26, 16);

        [(ADCapData *)self resetCapDataObject];
      }
      v27 = NSString;
      v28 = [(ADCapData *)self title];
      v29 = [(ADCapData *)self dictionaryRepresentation];
      v30 = objc_msgSend(v29, "AD_jsonString");
      v31 = [v27 stringWithFormat:@"Restored Cap Data information for %@: %@", v28, v30];
      _ADLog(@"ToroLogging", v31, 0);
    }
  }
  else
  {
    id v10 = NSString;
    v11 = [(ADCapData *)self title];
    v12 = [v10 stringWithFormat:@"No data to restore. Initializing an empty Cap Data object for %@.", v11];
    _ADLog(@"ToroLogging", v12, 0);

    [(ADCapData *)self resetCapDataObject];
  }
}

- (NSString)title
{
  return self->_title;
}

- (void)resetCapDataObject
{
  v3 = +[ADIDManager sharedInstance];
  v4 = [v3 idForClientType:4];
  toroID = self->_toroID;
  self->_toroID = v4;

  id v6 = [MEMORY[0x1E4F1CA48] array];
  frequencyCapData = self->_frequencyCapData;
  self->_frequencyCapData = v6;

  v8 = [MEMORY[0x1E4F1CA48] array];
  clickCountData = self->_clickCountData;
  self->_clickCountData = v8;

  self->_downloadData = [MEMORY[0x1E4F1CA48] array];
  MEMORY[0x1F41817F8]();
}

- (NSString)keychainKey
{
  return self->_keychainKey;
}

- (ADCapData)initWithStorageType:(int64_t)a3
{
  v3 = 0;
  switch(a3)
  {
    case 0:
      break;
    default:
      self = -[ADCapData initWithStorageType:keychainKey:title:](self, "initWithStorageType:keychainKey:title:");
      v3 = self;
      break;
  }

  return v3;
}

- (id)restoreCapDataArrayFromPlist:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  if (v3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          v11 = [ADFrequencyCap alloc];
          v12 = -[ADFrequencyCap initWithDictionary:](v11, "initWithDictionary:", v10, (void)v14);
          [v4 addObject:v12];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  return v4;
}

- (void)saveCapDataWithReason:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(ADCapData *)v5 dictionaryRepresentation];
  uint64_t v7 = NSString;
  uint64_t v8 = [(ADCapData *)v5 title];
  id v9 = objc_msgSend(v6, "AD_jsonString");
  if (v4) {
    [v7 stringWithFormat:@"Updated %@ Cap Data information for %@: %@", v8, v4, v9];
  }
  else {
  uint64_t v10 = [v7 stringWithFormat:@"Updated %@ Cap Data information: %@", v8, v9];
  }
  _ADLog(@"ToroLogging", v10, 0);

  id v18 = 0;
  v11 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v6 format:200 options:0 error:&v18];
  id v12 = v18;
  if (!v11)
  {
    long long v16 = NSString;
    long long v15 = [(ADCapData *)v5 title];
    long long v17 = [v16 stringWithFormat:@"Error serializing %@ Cap Data: %@", v15, v12];
    _ADLog(@"ToroLogging", v17, 16);

    goto LABEL_8;
  }
  v13 = [(ADCapData *)v5 keychainKey];
  uint64_t v14 = ADWriteDataToKeychain(v13, v11);

  if (v14)
  {
    long long v15 = objc_msgSend(NSString, "stringWithFormat:", @"Error writing results cap data to keychain: %d", v14);
    _ADLog(@"iAdInternalLogging", v15, 16);
LABEL_8:
  }
  objc_sync_exit(v5);
}

- (id)dictionaryRepresentation
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  toroID = self->_toroID;
  if (toroID)
  {
    [v3 setObject:toroID forKey:@"ADToroIDKey"];
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v7 = self->_frequencyCapData;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v39 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [*(id *)(*((void *)&v38 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"ADFrequencyCapTypeKey"];
    v13 = [MEMORY[0x1E4F1CA48] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v14 = self->_clickCountData;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v35 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = [*(id *)(*((void *)&v34 + 1) + 8 * j) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v16);
    }

    [v4 setObject:v13 forKey:@"ADToroClickTypeKey"];
    v20 = [MEMORY[0x1E4F1CA48] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v21 = self->_downloadData;
    uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v30 objects:v42 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v31;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v31 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [*(id *)(*((void *)&v30 + 1) + 8 * k) dictionaryRepresentation];
          [v20 addObject:v26];
        }
        uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v30 objects:v42 count:16];
      }
      while (v23);
    }

    [v4 setObject:v20 forKey:@"ADDownloadTypeKey"];
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v4];
  }
  else
  {
    v28 = [NSString stringWithFormat:@"[%@] The Toro ID is null inside of the ADCapData object. Please file a radar...", objc_opt_class()];
    _ADLog(@"ToroLogging", v28, 16);

    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v4];
  }

  return v27;
}

- (void)checkAndUpdateToroID
{
  id v3 = +[ADIDManager sharedInstance];
  uint64_t v6 = [v3 idForClientType:4];

  id v4 = self;
  objc_sync_enter(v4);
  toroID = v4->_toroID;
  if ((unint64_t)toroID | v6 && ![(NSString *)toroID isEqualToString:v6]) {
    [(ADCapData *)v4 resetCapDataObject];
  }
  objc_sync_exit(v4);
}

- (void)addCapDataObject:(id)a3 ofKind:(int64_t)a4
{
  id v27 = a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  [(ADCapData *)v6 checkAndUpdateToroID];
  if (a4 == 2)
  {
    uint64_t v12 = [(ADCapData *)v6 storageType];
    v13 = NSString;
    if (v12)
    {
      uint64_t v14 = [(ADCapData *)v6 title];
      uint64_t v15 = [v27 identifier];
      uint64_t v16 = [v13 stringWithFormat:@"Adding %@ Download Data: %@", v14, v15];
      _ADLog(@"iAdToroClick", v16, 0);
    }
    else
    {
      uint64_t v14 = [v27 identifier];
      uint64_t v15 = [v13 stringWithFormat:@"Adding Download Data: %@", v14];
      _ADLog(@"iAdToroClick", v15, 0);
    }

    [(NSMutableArray *)v6->_downloadData addObject:v27];
    uint64_t v24 = @"Ad Download Update";
  }
  else if (a4 == 1)
  {
    uint64_t v17 = [(ADCapData *)v6 storageType];
    id v18 = NSString;
    if (v17)
    {
      uint64_t v19 = [(ADCapData *)v6 title];
      v20 = [v27 identifier];
      v21 = [v18 stringWithFormat:@"Adding %@ Click Count Data: %@", v19, v20];
      _ADLog(@"iAdToroClick", v21, 0);

      uint64_t v22 = NSString;
      uint64_t v23 = [(ADCapData *)v6 title];
      uint64_t v24 = [v22 stringWithFormat:@"%@ Click Update", v23];
    }
    else
    {
      uint64_t v23 = [v27 identifier];
      v26 = [v18 stringWithFormat:@"Adding Toro Click Count Data: %@", v23];
      _ADLog(@"iAdToroClick", v26, 0);

      uint64_t v24 = @"Toro Click Update";
    }

    [(NSMutableArray *)v6->_clickCountData addObject:v27];
  }
  else
  {
    if (a4)
    {
      v25 = [NSString stringWithFormat:@"Error: Unknown type of Cap Data."];
      _ADLog(@"ToroLogging", v25, 16);

      objc_sync_exit(v6);
      goto LABEL_18;
    }
    uint64_t v7 = [(ADCapData *)v6 storageType];
    uint64_t v8 = NSString;
    if (v7)
    {
      uint64_t v9 = [(ADCapData *)v6 title];
      uint64_t v10 = [v27 identifier];
      v11 = [v8 stringWithFormat:@"Adding %@ Frequency Cap Identifier: %@", v9, v10];
      _ADLog(@"iAdFrequencyCap", v11, 0);
    }
    else
    {
      uint64_t v9 = [v27 identifier];
      uint64_t v10 = [v8 stringWithFormat:@"Adding Sponsored Frequency Cap Identifier: %@", v9];
      _ADLog(@"iAdFrequencyCap", v10, 0);
    }

    [(NSMutableArray *)v6->_frequencyCapData addObject:v27];
    uint64_t v24 = @"Frequency Cap Update";
  }
  objc_sync_exit(v6);

  [(ADCapData *)v6 saveCapDataWithReason:v24];
  uint64_t v6 = (ADCapData *)v24;
LABEL_18:
}

- (void)updateCapDataWith:(id)a3 ofKind:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [[ADFrequencyCap alloc] initWithIdentifier:v6];

  [(ADCapData *)self addCapDataObject:v7 ofKind:a4];
}

- (id)filteredCapData:(id)a3 maxItems:(unint64_t)a4 expirationThresholdInSeconds:(double)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
  [v9 timeIntervalSince1970];
  double v11 = v10;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        objc_msgSend(v17, "setTime", (void)v22);
        if (v11 - v18 < a5) {
          [v8 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }

  uint64_t v19 = [v8 arrayCappedToMaxItems:a4];
  v20 = (void *)[v19 mutableCopy];

  return v20;
}

- (id)capDataJSON:(id)a3
{
  id v3 = [(ADCapData *)self capData:a3];
  if (v3)
  {
    if ([MEMORY[0x1E4F28D90] isValidJSONObject:v3])
    {
      uint64_t v9 = 0;
      id v4 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:0 error:&v9];
      if (v9)
      {
        id v5 = [NSString stringWithFormat:@"There was an error attempting to serialize a JSON object for: %@", v3];
        _ADLog(@"ToroLogging", v5, 16);

        id v6 = 0;
      }
      else
      {
        id v6 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
      }

      goto LABEL_9;
    }
    id v7 = [NSString stringWithFormat:@"There was an error attempting to serialize a JSON object for: %@. Invalid JSON object.", v3];
    _ADLog(@"ToroLogging", v7, 16);
  }
  id v6 = 0;
LABEL_9:

  return v6;
}

- (id)capData:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  [v5 timeIntervalSince1970];
  double v7 = v6;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "identifier", (void)v22);

        if (v14)
        {
          [v13 setTime];
          uint64_t v16 = [NSNumber numberWithInteger:(int)((v7 - v15) / 3600.0)];
          uint64_t v17 = [v13 identifier];
          double v18 = [v4 objectForKeyedSubscript:v17];

          if (!v18)
          {
            double v18 = [MEMORY[0x1E4F1CA48] array];
            uint64_t v19 = [v13 identifier];
            [v4 setObject:v18 forKeyedSubscript:v19];
          }
          [v18 addObject:v16];
        }
        else
        {
          uint64_t v16 = [NSString stringWithFormat:@"Failed to read a ADFrequencyCap object."];
          _ADLog(@"ToroLogging", v16, 16);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  if ([v4 count]) {
    id v20 = v4;
  }
  else {
    id v20 = 0;
  }

  return v20;
}

- (id)clickCapObjectForAdamID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[ADIDManager sharedInstance];
  double v6 = [v5 idForClientType:4];
  int v7 = [v6 isEqualToString:self->_toroID];

  if (v7)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = [(NSMutableArray *)self->_clickCountData reverseObjectEnumerator];
    id v9 = (id)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v13 = [v12 identifier];
          char v14 = [v13 isEqualToString:v4];

          if (v14)
          {
            id v9 = v12;
            goto LABEL_13;
          }
        }
        id v9 = (id)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)downloadObjectForAdamID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[ADIDManager sharedInstance];
  double v6 = [v5 idForClientType:4];
  int v7 = [v6 isEqualToString:self->_toroID];

  if (v7)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = [(NSMutableArray *)self->_downloadData reverseObjectEnumerator];
    id v9 = (id)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v13 = [v12 identifier];
          char v14 = [v13 isEqualToString:v4];

          if (v14)
          {
            id v9 = v12;
            goto LABEL_13;
          }
        }
        id v9 = (id)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)eraseCapData
{
  toroID = self->_toroID;
  self->_toroID = (NSString *)&stru_1F270BEE0;

  id v4 = [MEMORY[0x1E4F1CA48] array];
  frequencyCapData = self->_frequencyCapData;
  self->_frequencyCapData = v4;

  double v6 = [MEMORY[0x1E4F1CA48] array];
  clickCountData = self->_clickCountData;
  self->_clickCountData = v6;

  id v8 = [MEMORY[0x1E4F1CA48] array];
  downloadData = self->_downloadData;
  self->_downloadData = v8;

  [(ADCapData *)self saveCapDataWithReason:@"Erasing"];
}

- (NSString)toroID
{
  return self->_toroID;
}

- (void)setToroID:(id)a3
{
}

- (NSMutableArray)frequencyCapData
{
  return self->_frequencyCapData;
}

- (void)setFrequencyCapData:(id)a3
{
}

- (NSMutableArray)clickCountData
{
  return self->_clickCountData;
}

- (void)setClickCountData:(id)a3
{
}

- (NSMutableArray)downloadData
{
  return self->_downloadData;
}

- (void)setDownloadData:(id)a3
{
}

- (void)setKeychainKey:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (int64_t)storageType
{
  return self->_storageType;
}

- (void)setStorageType:(int64_t)a3
{
  self->_storageType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_keychainKey, 0);
  objc_storeStrong((id *)&self->_downloadData, 0);
  objc_storeStrong((id *)&self->_clickCountData, 0);
  objc_storeStrong((id *)&self->_frequencyCapData, 0);
  objc_storeStrong((id *)&self->_toroID, 0);
}

@end