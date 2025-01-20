@interface MPTimedMetadata
- (MPTimedMetadata)init;
- (NSDictionary)allMetadata;
- (NSString)key;
- (NSString)keyspace;
- (NSTimeInterval)timestamp;
- (id)_initWithMetadataItem:(id)a3;
- (id)value;
@end

@implementation MPTimedMetadata

- (void).cxx_destruct
{
}

- (NSDictionary)allMetadata
{
  v3 = [(AVMetadataItem *)self->_metadataItem extraAttributes];
  v4 = (void *)[v3 mutableCopy];
  v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
  }
  v7 = v6;

  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    v8 = [(MPTimedMetadata *)self key];
    [v7 setObject:v8 forKey:@"key"];

    v9 = [(MPTimedMetadata *)self keyspace];
    [v7 setObject:v9 forKey:@"keyspace"];

    v10 = [(MPTimedMetadata *)self value];
    [v7 setObject:v10 forKey:@"value"];

    v11 = NSNumber;
    [(MPTimedMetadata *)self timestamp];
    v12 = objc_msgSend(v11, "numberWithDouble:");
    [v7 setObject:v12 forKey:@"timestamp"];
  }
  uint64_t v13 = *MEMORY[0x1E4F15DD8];
  if (([@"name" isEqualToString:*MEMORY[0x1E4F15DD8]] & 1) == 0)
  {
    v14 = [v3 objectForKey:v13];
    if (v14) {
      [v7 setObject:v14 forKey:@"name"];
    }
  }
  uint64_t v15 = *MEMORY[0x1E4F15DC0];
  if (([@"info" isEqualToString:*MEMORY[0x1E4F15DC0]] & 1) == 0)
  {
    v16 = [v3 objectForKey:v15];
    if (v16) {
      [v7 setObject:v16 forKey:@"info"];
    }
  }
  uint64_t v17 = *MEMORY[0x1E4F15DD0];
  if (([@"mimeType" isEqualToString:*MEMORY[0x1E4F15DD0]] & 1) == 0)
  {
    v18 = [v3 objectForKey:v17];
    if (v18) {
      [v7 setObject:v18 forKey:@"mimeType"];
    }
  }
  uint64_t v19 = *MEMORY[0x1E4F15DB8];
  if (([@"dataType" isEqualToString:*MEMORY[0x1E4F15DB8]] & 1) == 0)
  {
    v20 = [v3 objectForKey:v19];
    if (v20) {
      [v7 setObject:v20 forKey:@"dataType"];
    }
  }
  uint64_t v21 = *MEMORY[0x1E4F15DC8];
  if (([@"languageCode" isEqualToString:*MEMORY[0x1E4F15DC8]] & 1) == 0)
  {
    v22 = [v3 objectForKey:v21];
    if (v22) {
      [v7 setObject:v22 forKey:@"languageCode"];
    }
  }
  if (dyld_program_sdk_at_least())
  {
    v23 = [v3 objectForKey:*MEMORY[0x1E4F15CE8]];
    if ([v23 isEqualToString:@"org.iana.media-type"])
    {
      v24 = [v3 objectForKey:*MEMORY[0x1E4F15CE0]];
      if (v24) {
        [v7 setObject:v24 forKey:@"mimeType"];
      }
    }
    v25 = [v3 objectForKey:*MEMORY[0x1E4F15D00]];
    if (v25) {
      [v7 setObject:v25 forKey:@"dataType"];
    }
  }

  return (NSDictionary *)v7;
}

- (NSTimeInterval)timestamp
{
  memset(&v4[1], 0, sizeof(CMTime));
  metadataItem = self->_metadataItem;
  if (metadataItem) {
    [(AVMetadataItem *)metadataItem time];
  }
  v4[0] = v4[1];
  return CMTimeGetSeconds(v4);
}

- (id)value
{
  v2 = [(AVMetadataItem *)self->_metadataItem value];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v3 = v2;
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (NSString)keyspace
{
  return [(AVMetadataItem *)self->_metadataItem keySpace];
}

- (NSString)key
{
  return (NSString *)[(AVMetadataItem *)self->_metadataItem key];
}

- (id)_initWithMetadataItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPTimedMetadata;
  id v6 = [(MPTimedMetadata *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_metadataItem, a3);
  }

  return v7;
}

- (MPTimedMetadata)init
{
  return 0;
}

@end