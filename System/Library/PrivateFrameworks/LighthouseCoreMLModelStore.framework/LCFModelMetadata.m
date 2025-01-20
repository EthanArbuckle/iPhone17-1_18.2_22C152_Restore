@interface LCFModelMetadata
- (BOOL)isAvailable;
- (BOOL)isImported;
- (BOOL)isLocal;
- (BOOL)isOriginalEmptyModel;
- (NSDate)dateCreated;
- (NSDate)dateTrained;
- (NSDictionary)custom;
- (NSString)sha256;
- (id)init:(id)a3;
- (id)toDictionary;
- (void)setCustom:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateTrained:(id)a3;
- (void)setIsAvailable:(BOOL)a3;
- (void)setIsImported:(BOOL)a3;
- (void)setIsLocal:(BOOL)a3;
- (void)setIsOriginalEmptyModel:(BOOL)a3;
- (void)setSha256:(id)a3;
@end

@implementation LCFModelMetadata

- (id)init:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)LCFModelMetadata;
  v5 = [(LCFModelMetadata *)&v27 init];
  if (v5)
  {
    LCFModelStoreLoggingUtilsInit();
    if (v4)
    {
      v6 = [v4 valueForKey:@"isAvailable"];

      if (v6)
      {
        v7 = [v4 objectForKeyedSubscript:@"isAvailable"];
        v5->_isAvailable = [v7 isEqual:&unk_2703E8358] ^ 1;
      }
      v8 = [v4 valueForKey:@"isOriginalEmptyModel"];

      if (v8)
      {
        v9 = [v4 objectForKeyedSubscript:@"isOriginalEmptyModel"];
        v5->_isOriginalEmptyModel = [v9 isEqual:&unk_2703E8358] ^ 1;
      }
      v10 = [v4 valueForKey:@"isImported"];

      if (v10)
      {
        v11 = [v4 objectForKeyedSubscript:@"isImported"];
        v5->_isImported = [v11 isEqual:&unk_2703E8358] ^ 1;
      }
      v12 = [v4 valueForKey:@"isLocal"];

      if (v12)
      {
        v13 = [v4 objectForKeyedSubscript:@"isLocal"];
        v5->_isLocal = [v13 isEqual:&unk_2703E8358] ^ 1;
      }
      v14 = [v4 valueForKey:@"dateCreated"];

      if (v14)
      {
        uint64_t v15 = [v4 objectForKeyedSubscript:@"dateCreated"];
        dateCreated = v5->_dateCreated;
        v5->_dateCreated = (NSDate *)v15;
      }
      v17 = [v4 valueForKey:@"dateTrained"];

      if (v17)
      {
        uint64_t v18 = [v4 objectForKeyedSubscript:@"dateTrained"];
        dateTrained = v5->_dateTrained;
        v5->_dateTrained = (NSDate *)v18;
      }
      v20 = [v4 valueForKey:@"sha256"];

      if (v20)
      {
        uint64_t v21 = [v4 objectForKeyedSubscript:@"sha256"];
        sha256 = v5->_sha256;
        v5->_sha256 = (NSString *)v21;
      }
      v23 = [v4 valueForKey:@"custom"];

      if (v23)
      {
        uint64_t v24 = [v4 objectForKeyedSubscript:@"custom"];
        custom = v5->_custom;
        v5->_custom = (NSDictionary *)v24;
      }
    }
  }

  return v5;
}

- (id)toDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = v3;
  if (self->_isAvailable) {
    v5 = &unk_2703E8370;
  }
  else {
    v5 = &unk_2703E8358;
  }
  [v3 setObject:v5 forKeyedSubscript:@"isAvailable"];
  if (self->_isOriginalEmptyModel) {
    v6 = &unk_2703E8370;
  }
  else {
    v6 = &unk_2703E8358;
  }
  [v4 setObject:v6 forKeyedSubscript:@"isOriginalEmptyModel"];
  if (self->_isImported) {
    v7 = &unk_2703E8370;
  }
  else {
    v7 = &unk_2703E8358;
  }
  [v4 setObject:v7 forKeyedSubscript:@"isImported"];
  if (self->_isLocal) {
    v8 = &unk_2703E8370;
  }
  else {
    v8 = &unk_2703E8358;
  }
  [v4 setObject:v8 forKeyedSubscript:@"isLocal"];
  dateCreated = self->_dateCreated;
  if (dateCreated) {
    [v4 setObject:dateCreated forKeyedSubscript:@"dateCreated"];
  }
  dateTrained = self->_dateTrained;
  if (dateTrained) {
    [v4 setObject:dateTrained forKeyedSubscript:@"dateTrained"];
  }
  sha256 = self->_sha256;
  if (sha256) {
    [v4 setObject:sha256 forKeyedSubscript:@"sha256"];
  }
  custom = self->_custom;
  if (custom) {
    [v4 setObject:custom forKeyedSubscript:@"custom"];
  }
  return v4;
}

- (BOOL)isAvailable
{
  return self->_isAvailable;
}

- (void)setIsAvailable:(BOOL)a3
{
  self->_isAvailable = a3;
}

- (BOOL)isOriginalEmptyModel
{
  return self->_isOriginalEmptyModel;
}

- (void)setIsOriginalEmptyModel:(BOOL)a3
{
  self->_isOriginalEmptyModel = a3;
}

- (BOOL)isImported
{
  return self->_isImported;
}

- (void)setIsImported:(BOOL)a3
{
  self->_isImported = a3;
}

- (BOOL)isLocal
{
  return self->_isLocal;
}

- (void)setIsLocal:(BOOL)a3
{
  self->_isLocal = a3;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
}

- (NSDate)dateTrained
{
  return self->_dateTrained;
}

- (void)setDateTrained:(id)a3
{
}

- (NSString)sha256
{
  return self->_sha256;
}

- (void)setSha256:(id)a3
{
}

- (NSDictionary)custom
{
  return self->_custom;
}

- (void)setCustom:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_custom, 0);
  objc_storeStrong((id *)&self->_sha256, 0);
  objc_storeStrong((id *)&self->_dateTrained, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
}

@end