@interface BPSTTRMetadata
- (BPSTTRMetadata)init;
- (BPSTTRMetadata)initWithComponent:(unint64_t)a3;
- (BPSTTRMetadata)initWithComponentName:(id)a3 componentVersion:(id)a4 componentID:(int64_t)a5;
- (NSString)componentName;
- (NSString)componentVersion;
- (NSString)radarDescription;
- (NSString)title;
- (id)_parameters;
- (id)queryItems;
- (int64_t)componentID;
- (void)_setComponentValuesFromComponent:(unint64_t)a3;
- (void)setComponentID:(int64_t)a3;
- (void)setComponentName:(id)a3;
- (void)setComponentVersion:(id)a3;
- (void)setRadarDescription:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation BPSTTRMetadata

- (BPSTTRMetadata)init
{
  v5.receiver = self;
  v5.super_class = (Class)BPSTTRMetadata;
  v2 = [(BPSTTRMetadata *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BPSTTRMetadata *)v2 setComponentID:-1];
  }
  return v3;
}

- (BPSTTRMetadata)initWithComponent:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BPSTTRMetadata;
  v4 = [(BPSTTRMetadata *)&v7 init];
  objc_super v5 = v4;
  if (v4) {
    [(BPSTTRMetadata *)v4 _setComponentValuesFromComponent:a3];
  }
  return v5;
}

- (BPSTTRMetadata)initWithComponentName:(id)a3 componentVersion:(id)a4 componentID:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BPSTTRMetadata;
  v10 = [(BPSTTRMetadata *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(BPSTTRMetadata *)v10 setComponentName:v8];
    [(BPSTTRMetadata *)v11 setComponentVersion:v9];
    [(BPSTTRMetadata *)v11 setComponentID:a5];
  }

  return v11;
}

- (void)_setComponentValuesFromComponent:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      goto LABEL_13;
    case 1uLL:
      [(BPSTTRMetadata *)self setComponentID:1070638];
      [(BPSTTRMetadata *)self setComponentName:@"Watch Faces"];
      v4 = @"New Bugs";
      goto LABEL_6;
    case 2uLL:
      [(BPSTTRMetadata *)self setComponentID:871848];
      objc_super v5 = @"HealthKit";
      goto LABEL_5;
    case 3uLL:
      [(BPSTTRMetadata *)self setComponentID:547620];
      objc_super v5 = @"Phone App";
LABEL_5:
      [(BPSTTRMetadata *)self setComponentName:v5];
      v4 = @"watchOS";
LABEL_6:
      [(BPSTTRMetadata *)self setComponentVersion:v4];
      break;
    default:
      v6 = bps_setup_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)objc_super v7 = 0;
        _os_log_impl(&dword_21C513000, v6, OS_LOG_TYPE_DEFAULT, "Error: Invalid BPSTTRMetadataComponent! Defaulting to Pepper Pairing | New Bugs", v7, 2u);
      }

LABEL_13:
      [(BPSTTRMetadata *)self setComponentID:576381];
      [(BPSTTRMetadata *)self setComponentName:@"Pepper Pairing"];
      [(BPSTTRMetadata *)self setComponentVersion:@"New Bugs"];
      break;
  }
}

- (id)_parameters
{
  v20[5] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(BPSTTRMetadata *)self componentName];
  if (!v3) {
    goto LABEL_9;
  }
  v4 = (void *)v3;
  uint64_t v5 = [(BPSTTRMetadata *)self componentVersion];
  if (!v5)
  {

    goto LABEL_9;
  }
  v6 = (void *)v5;
  int64_t v7 = [(BPSTTRMetadata *)self componentID];

  if (v7 == -1)
  {
LABEL_9:
    objc_super v13 = (void *)MEMORY[0x263EFFA78];
    goto LABEL_10;
  }
  v19[0] = @"ComponentName";
  id v8 = [(BPSTTRMetadata *)self componentName];
  v20[0] = v8;
  v19[1] = @"ComponentVersion";
  id v9 = [(BPSTTRMetadata *)self componentVersion];
  v20[1] = v9;
  v19[2] = @"ComponentID";
  v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[BPSTTRMetadata componentID](self, "componentID"));
  v11 = [v10 stringValue];
  v20[2] = v11;
  v20[3] = @"Watch";
  v19[3] = @"DeviceClasses";
  v19[4] = @"Keywords";
  v20[4] = @"1210568";
  v12 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:5];
  objc_super v13 = (void *)[v12 mutableCopy];

  v14 = [(BPSTTRMetadata *)self title];

  if (v14)
  {
    v15 = [(BPSTTRMetadata *)self title];
    [v13 setObject:v15 forKey:@"Title"];
  }
  v16 = [(BPSTTRMetadata *)self radarDescription];

  if (v16)
  {
    v17 = [(BPSTTRMetadata *)self radarDescription];
    [v13 setObject:v17 forKey:@"Description"];
  }
LABEL_10:
  return v13;
}

- (id)queryItems
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = [(BPSTTRMetadata *)self _parameters];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v10 = [v4 objectForKey:v9];
        v11 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:v9 value:v10];
        [v3 addObject:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  v12 = (void *)[v3 copy];

  return v12;
}

- (NSString)componentName
{
  return self->_componentName;
}

- (void)setComponentName:(id)a3
{
}

- (NSString)componentVersion
{
  return self->_componentVersion;
}

- (void)setComponentVersion:(id)a3
{
}

- (int64_t)componentID
{
  return self->_componentID;
}

- (void)setComponentID:(int64_t)a3
{
  self->_componentID = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)radarDescription
{
  return self->_radarDescription;
}

- (void)setRadarDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radarDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_componentVersion, 0);
  objc_storeStrong((id *)&self->_componentName, 0);
}

@end